Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 778783BBA8F
	for <lists+xen-devel@lfdr.de>; Mon,  5 Jul 2021 11:54:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.150030.277464 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0LIt-0001pk-QP; Mon, 05 Jul 2021 09:54:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 150030.277464; Mon, 05 Jul 2021 09:54:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0LIt-0001nF-MZ; Mon, 05 Jul 2021 09:54:15 +0000
Received: by outflank-mailman (input) for mailman id 150030;
 Mon, 05 Jul 2021 09:54:15 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+Qt1=L5=citrix.com=Andrew.Cooper3@srs-us1.protection.inumbo.net>)
 id 1m0LIt-0001n8-5K
 for xen-devel@lists.xenproject.org; Mon, 05 Jul 2021 09:54:15 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f41ec073-dd76-11eb-8440-12813bfff9fa;
 Mon, 05 Jul 2021 09:54:14 +0000 (UTC)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: f41ec073-dd76-11eb-8440-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1625478853;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=/9C459icUbgkKjFDP9Oja5oWJTL1qOW2C24GH7Zbt7c=;
  b=YivnDXo+hnArbdDQbHgzWaMi4/PU9XxXG5Wl4nnDkBtb5xkO9z7epgva
   DVTis1LIxGVYb8T8fuwk0waU0CD3rLXGjLrj9Vt4xFGY5CSzCBCzBWbV+
   pwvxDjmWBoqnMySoLb4tn5o7vr+e51ros9NLhvPGsLbDDklpUBdjGxSgt
   k=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: Me6upqrVxExRVWC/yWJPKlk+nOeVk/G8vvhNnTrL9ou/2duBElbyHHnbLOIVqRaII2SpT+/nJU
 heSb1nTpOkQxcJd7ePda4odd2CB9r8arnt2KbWnaLe7t8dpBYhPlsgOI8oplca9raquosOUXaj
 TMlXUk/KqntWDXSYKFsoHgmCqYhc0gE33vycUMQGKZ+Y/750FY1bBRCAieqjnFr4IW+Pe0LA91
 ND/oZQ8i1LE7N/0QHb/M7xGcARFcav/y8uJg9XBng4w7pgxrmp1Y/7dBdWu8twymqwnmaM5ucm
 rEI=
X-SBRS: 5.1
X-MesageID: 47633831
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:suIryKDkeaPV13PlHehHsceALOsnbusQ8zAXPh9KJiC9I/b1qy
 nxppkmPH/P6Qr4WBkb6LS90dq7MAzhHPlOkPUs1NaZLXTbUQ6TQr2KgrGSuwEIdxeOkNK1kJ
 0QCZSWa+eAfmSS7/yKmTVQeuxIqLLskNHK9JLjJjVWPGZXgslbnndE422gYy9LrWd9dP8E/d
 anl7F6T23KQwVnUi33PAhIY8Hz4/nw0L72ax8PABAqrCGIkDOT8bb/VzyVxA0XXT9jyaortT
 GtqX222oyT99WAjjPM3W7a6Jpb3PPn19t4HcSJzuwYMC/lhAqEbJloH5eCoDc2iuey70tCqq
 iCnz4Qe+BIr1/BdGC8phXgnyP61iw11nPkwViExVP+vM3QXlsBeol8rLMcViGcx1srvdl63q
 4O9XmerYBrARTJmzm4z8TUVittilG/rRMZ4K4uZkRkIM4jgYJq3MgiFBs/KuZGIMu60vFnLA
 BWNrCf2B4MGmnqKUww1wJUsa6RtndaJGbMfqFNgL3N79FspgEP86Iv/r1Wop4xzuNId3B63Z
 WzDk1JrsAFciZEV9MxOA8+KfHHQ1AlFii8Tl56Z26XTJ06Bw==
X-IronPort-AV: E=Sophos;i="5.83,325,1616472000"; 
   d="scan'208";a="47633831"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cBG7RNrtl206LrkSGlx7H8ihLbbXqqBxsLnQAkKW99B8RytaxPrXC1fleaKQDWVYcEdCt4RqtZLEyZq12EXfdBYyMtf2t6phJMc4Y4SkBUS5AK9IjDu0gcuez/Dd/xCIyaFP/++TOmEm6kXbcTiaYic0QYk3y/yBc0n/nBTk3yUdrZNzSXtjWlmOR8RwMxv5/4TYE73+bFcTw0EUsTizfnpQcPwkbjEyUl9GlbjvQyjRYBoniLDdmIMeBw5fntJkurnV0Uzc4LaXnNtgxuR2E1j0awGLOv5et5zgasTEa47qKgUnwo0OLTV01kmfPyRYHm2NzSdIYxdTMRt6DslqXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/9C459icUbgkKjFDP9Oja5oWJTL1qOW2C24GH7Zbt7c=;
 b=C1RoFX2O3s2ta1jjmYG9Ov5GKQcl3brpmRIBGxEIoLe1ja+YU5Vynz37rGDi/2fSitvEyQFnEEoV7PpP5lrlJIU3SvfatU12nxBALadeb6LkXNo20TZyXGSPWAWaOC9lnhIZcSU/afhFzQKIh9nRi70ofR/663wY/yfgrNzRQ/7ArLqjoFM1QPza5vKnSWKjGhYyWzeJV3B0M2JvWH1qTvimNCI/By6Ctw96tEXPZa0bJc8Ybtil7S5astUKN63YALjia7Q6Fr94aUaH9S3CxR1xyY8kxY6LFiqKfQtOOZMsXOuEmq+qq0wC/H4jurJlVgEGgFtpY429KXrFRDsYUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/9C459icUbgkKjFDP9Oja5oWJTL1qOW2C24GH7Zbt7c=;
 b=pXswqywguVTdgT0YNtoDe6aE0is/m8tocaK3Yzn6Q8eAvW0HcvqLTnLJCq7sXiVguEd37eD+MAXqAVF1Z45n65lbYnJiO/j1C8+fnf7zZz/nSCsxGb++u5Yy5OhLN3OFLyJTLoKzWR0ofdeicCwuE2SHvkzyV+AooBADd9419So=
Subject: Re: [PATCH v20210701 12/40] tools: unify type checking for data pfns
 in migration stream
To: Olaf Hering <olaf@aepfle.de>
CC: <xen-devel@lists.xenproject.org>, Ian Jackson <iwj@xenproject.org>, Wei
 Liu <wl@xen.org>, Juergen Gross <jgross@suse.com>
References: <20210701095635.15648-1-olaf@aepfle.de>
 <20210701095635.15648-13-olaf@aepfle.de>
 <9db50e05-233b-e279-307d-548fc23d0115@citrix.com>
 <20210705105917.132793c9.olaf@aepfle.de>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <23314695-f84f-59c0-dcb0-62f553efc62e@citrix.com>
Date: Mon, 5 Jul 2021 10:53:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210705105917.132793c9.olaf@aepfle.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: LO2P265CA0071.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:60::35) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 84d40e02-31c8-491d-9b16-08d93f9ad38d
X-MS-TrafficTypeDiagnostic: BYAPR03MB4806:
X-Microsoft-Antispam-PRVS: <BYAPR03MB4806B849EECD6DE4A06EEB1BBA1C9@BYAPR03MB4806.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +FRUNX2/3iZK/A8W4aGPzrhPmgTpQN3SRLUbSD4eXK5A/kD2SBkNlfDi7tzTLBlpd9DN0GTcppDOU5ItIDnvrwP/EbOdEvHh83/UUBIejGaFFktAjsmUv35lvl3bp2jnnK+HD4B3a6fLXDRz8FY3i8z4B0R81hQe6WQGmiqh/sG/10D9oot20GxiS3TWWWMucXor352BKGwctfWJYuntdFFniccSAKO45EDEvf7RMzAShakN2mlF7T08hoBocR40CC9c4rXEb/h1ZpgzhgB4mvnNqSLmKIiBFzm4NDiA83rWjF6DWCkiWYLVCCETttrghN0uT5nf2xjyfTas3WZ55eIg7c5Q5P7HE2/EzniZOPTmidFlgAWW75Kgz9FfLrmyAFto9WooUIucWcWlwZ5Y8/n7cDlIv1j0mDkJKHwHhRQDX96e1XmvDmNf9/tVDqvvGvhrdvs6XlAZCRL90cjcOZwc6txx4aQq8f/WYGEfdznlmYJ634pNH1C6YX3X9DWtqKATtyiAkryT4ztYpVMVilU2fHpR2TNm0BHEsFO8c2xPv4vZcdYu9fqng27vd3uK3aHJrd3N8O7yXeao7saIg8QSxdNH6I0p2j0gT/VYi7siAmwywIxXzrO5Tylrevn5iRz0Sag02RP+XsuoI3J06ya+gAKYX1qYR0RdkquOy0T6L3LzjbaEK0u1+wqtcPquZ705C3y8QiDwwqjvcWZTAHA+EPo5sbwA25aUjrFLV+U=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(366004)(376002)(39860400002)(396003)(136003)(53546011)(36756003)(8676002)(66556008)(6486002)(66946007)(66476007)(6666004)(31686004)(5660300002)(16526019)(478600001)(6916009)(4744005)(31696002)(316002)(38100700002)(16576012)(86362001)(2906002)(26005)(8936002)(186003)(4326008)(2616005)(956004)(54906003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z3p3UzhFc3NIWFdxbE5nUjhGbnVWanJMQzcxNUlsbmc2RVdNNkNYdnRrUWk4?=
 =?utf-8?B?ZndTM0tZMzRBWXIzdFM2L2puOXA3M0hMbXBnd3Fha1VEMnprSkhhYzZqRUJm?=
 =?utf-8?B?VmQyWFJ4TWVTUy93SHJVVU95RFQ4eS8wRFV0WUVYNHN4SzVrTk1rMzlBc1JK?=
 =?utf-8?B?NVAxODk0d2s1ODNMUDVhak5iWlRuSjMvTXoxeE5UYjlNbEVmL1ZldWRIWWFo?=
 =?utf-8?B?RE5aMk40eGhmZnZqOXZtSFZHd2VqVUVlVjViRDNsbkN2dFNHYWF0M3lyM0FX?=
 =?utf-8?B?eTFVZ2l0cUxOWDJjckF5VTlXaWg5TExYQXE4T0ZsYVpSVXdIOC9Pc1Z5c2lG?=
 =?utf-8?B?UjZxSXdNVGZmQkU5TjFiTE5nbmIzbjZEeWxHdmwxbjlLbE9UaC9zdUhrbXZl?=
 =?utf-8?B?VjJQTFRWdCtsdjh0ZVUzcEdJTFpxOUtOWExjckZ2amhjSkN4YzJlaDRXek9q?=
 =?utf-8?B?ZlpldURSUEFCOVdNdjF6czlMaVAyL1lnRDJrd3dZK2czVFpFL2hUcWF1R3d6?=
 =?utf-8?B?TS9FSFB4OUxmMTN3NTdLcHA3RDloVURWWTYyUElaWDJwSXNVUVNoRlFvZW5Q?=
 =?utf-8?B?R1ZzZG01aUJpN2ZQYi9mWUxidFRXQ09NOWRXTnE1UjdhV1pETjM2Y0Mvb2w2?=
 =?utf-8?B?YWdlbTNlQTFFUVJzVW5pQ3d5b2VPTzd4RkxpcGo1SXM4c245VHJXa2t0RkJ4?=
 =?utf-8?B?LzNEUnFudWIrRXJNUkhHS0IvelhKN2NFdiszYjNXOGdGMlBpRHYzK3liSUpP?=
 =?utf-8?B?YXN0RUNTVlRVanRlL2p2RithUTRlVEZqaGdnL3ZDSTdNaVlacGxhMENZSVdx?=
 =?utf-8?B?dTZ0azI1ckZVRzlMRDBLY3hiVVVvazk2VmFsZjJPZVl4UGJCWWRRZnJ6Ni9O?=
 =?utf-8?B?UFovSnR0ekZsOVlEL09LRzNkTWN6Q3VNQmZ0UVA3SkZXUUt3R2ZOQmJJL2NO?=
 =?utf-8?B?RTQ0VE1JbDBjbzI0SHA0ZkpoSkhTT2Jsc0FSUzJGclVTWTRPK005NEZyVWZz?=
 =?utf-8?B?eFBUSDhSZ1NTY1B2VE5RNGc0WC94RjVLYi8rUWwrNm0wcTJyTDQwWjdQZ2ZS?=
 =?utf-8?B?Yk52WUY5UmJGTW9WYW53Y1NWN0tqL29uZGxSdldlT0U0WTd4b3ZVbnFtWWla?=
 =?utf-8?B?VHRkQmNOd1pyMUdQR3RVZU1XT2RKYXI1cG9rUkM1MHhXM2VQbWtmOWduRFFL?=
 =?utf-8?B?Rm15eEhJaFJhWUxHZTlZRmx0NHhnNUlTcXFNWHA0MFJvaUxEOW9QQ09HR2gv?=
 =?utf-8?B?ODJkY2I2MCs4U2xrOHcveW1GNVQ5d1BlUXZCTkJweWZVZ0ladGxkNTBFeW1i?=
 =?utf-8?B?TncyaWxBTi9qaC9PamdEYWlVNmQ1SWcxTkczdEM0Wmo0T2E5RVhwZCt6NVl3?=
 =?utf-8?B?YUMzWjUyWHBZSzcvQ3pOOWg0OUFHajdUUUtrcmZzYUFHRnhadkcvelliTWxG?=
 =?utf-8?B?Y0tteTlhdWY4dGJjdXhLRCtIQUM5dlNzbUZKamUzSUxOeklIejZyR0h0eUNO?=
 =?utf-8?B?QWllTDcxWDdlMTFFa2t1YzlHRVFodml4TWlXblJPRThOSnNiV1dmOHh5ZzUx?=
 =?utf-8?B?QlZuUzJkMjBuQTJSQUVVeDJ3b1RHWU5qY2NleXhnNXJqSjB3RkxhUXE0UUpQ?=
 =?utf-8?B?N3RqS2Q2RTU5Z1d2NTduZWdLQXRaVjg0TzhHNTh6L2FvbmJHM3ZZSmZnN1pI?=
 =?utf-8?B?QzlPSC94RTg4WmJ4VGhld0RXb2drL1V5T3FxaDBzNnNXNFlVWlg5SnlMQWEy?=
 =?utf-8?Q?t6YGs1gQMjdNxqaiTVzbH4JgX+Kls+1b+ddlrX7?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 84d40e02-31c8-491d-9b16-08d93f9ad38d
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2021 09:54:05.7361
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z8I5rgl0tIRrYNsfnn9/lbUZ0pkcUmZwqlla9+x9pWIq7a2t99Wn44sHAoNLMJd2QzVykRYCF5NFH4kZXl2OnRpAWMor6YiefHipI7il2u0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB4806
X-OriginatorOrg: citrix.com

On 05/07/2021 09:59, Olaf Hering wrote:
> Am Fri, 2 Jul 2021 20:43:13 +0100
> schrieb Andrew Cooper <andrew.cooper3@citrix.com>:
>
>> Anyone adding a new page type is going to have to audit/edit each of
>> these helpers.  I think it would be better to write all the true cases
>> explicitly.
> You mean the check if a page has data or needs to be populated should look like sr_is_known_page_type, where each known variant is listed?

Yes.  I think that is a safer approach overall.

~Andrew

