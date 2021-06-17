Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 24B513ABB96
	for <lists+xen-devel@lfdr.de>; Thu, 17 Jun 2021 20:25:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.144126.265335 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ltwhD-0003ui-Vf; Thu, 17 Jun 2021 18:24:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 144126.265335; Thu, 17 Jun 2021 18:24:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ltwhD-0003ss-SE; Thu, 17 Jun 2021 18:24:55 +0000
Received: by outflank-mailman (input) for mailman id 144126;
 Thu, 17 Jun 2021 18:24:54 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/zva=LL=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1ltwhB-0003sm-Vp
 for xen-devel@lists.xenproject.org; Thu, 17 Jun 2021 18:24:54 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 67240689-0265-4969-b12d-4a3fa9728e1c;
 Thu, 17 Jun 2021 18:24:53 +0000 (UTC)
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
X-Inumbo-ID: 67240689-0265-4969-b12d-4a3fa9728e1c
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1623954292;
  h=to:from:subject:message-id:date:
   content-transfer-encoding:mime-version;
  bh=Rupoul5o9Ei/QQF4fh4LN0Bk6hWxsd/xAB7cl+QXhfk=;
  b=IBn9ZfAlVcDEXf4RWHNytWEc13G5i1Hq26wlm5ybDhJ5CXFKHXm8YIiD
   aOeQkl7A82xaH+1kDbdp5Ug6xcFO7wwL+O3Y18D9/AhsyJCTthUwm17Dl
   4NrkvTnjuO3Un50u+cxTemy8iRLwfqE47ZhIb6cQ5De4IY/UVmXabkd4J
   w=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: qt/kw05eh3HycpUMUmD9Bb9cd/c0BHU9lSy3nwyMJPZJGruPNDDtK9B+w5Ie94VtvA9szdXOZ1
 3J6w71xsiP7T11HiK6chi67UJFig3dJMIupz/6Z1X5QV7lDW4B965V6SIAQToH2LSQ1y8z0qbK
 kkdIJSJ24715+ajDA0H4A/w/pdqYNwGoJzdujL7Ke7VxHYjVa1ePG6jECunTOygce8MsJiOJTW
 62DINhh5PxmqXlQ6l5PHtYQkCsluR68yfcHzErcINipobm5jphrKB3AaRIiEeR0nhXRKPskSdn
 9Cc=
X-SBRS: 5.1
X-MesageID: 46472738
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:O44uRa1eJz+DNy0Hcndd0AqjBHYkLtp133Aq2lEZdPU0SKGlfq
 GV7ZEmPHrP4gr5N0tOpTntAse9qBDnhPxICOsqXYtKNTOO0AeVxelZhrcKqAeQeBEWmNQ96U
 9hGZIOcuEZDzJB/LvHCN/TKadd/DGFmprY+ts31x1WPGVXgzkL1XYANu6ceHcGIzVuNN4CO7
 e3wNFInDakcWR/VLXBOpFUN9KzweEijfjdEGc7OyI=
X-IronPort-AV: E=Sophos;i="5.83,281,1616472000"; 
   d="scan'208";a="46472738"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WaZNHiLy4P1B+SnDgRUQCSG6x/zVV0nMCANad2qjCidltBpIqUCI1idoOhR28O0dJQ1GNU2hJ0Cy/dx04eq5YacnEKHjc+m0J83Tp3wnalqVGl5DFyUmTwRRsThhpUK3mRCUnqcEldJ3D0GH+MDXOO5l1T5UvZnKuf4XVA18RBxNtA9cqtG4FP46tTNzgyq8FZxHR+XWugkDNFMMX4sU0dMVwx30ptAlsFkcvwPJ9gLa7vU2I6Fm5GJ6/pI/z7HMKrt6OTp9H7c73MFvyMuMJpakZs96Ye852e09ToNMzoPTLE/b8JiXwOqZEQLx10l0K3LSpkVDNJOStq0CT3MIgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rupoul5o9Ei/QQF4fh4LN0Bk6hWxsd/xAB7cl+QXhfk=;
 b=aCOqPW6V+NQUWsEblSQV3PA51b2AdyDr+F/UIWXQKd2YUKNb1ag89JMdf1Oirv/7n+7yG4CDKWmvniVaVu8hXoXThF48T2Nqim15569pASHzYfC2R7COXtRBoOILbFXCSzji0sN8cBuj0BnV4fay8fXR98jsSiaQbSNs2vN+GXxvGOrMcLV34Qiq7WFvNmh/MHBhRrPxUUJ9Z9g0ekpDOKfbg9XClKK0WpMSgh9mmau5VuvreS1+5R2pcK73ulsaBwsq3k6lUnRc+hVaB9iKHKdKeU7rWczGU5JOaqKNudv7ob/hPAo4xMXiXs8e3xzFn5/AYu6bV32CSMSO/XQDJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rupoul5o9Ei/QQF4fh4LN0Bk6hWxsd/xAB7cl+QXhfk=;
 b=O5vlrPkL2cX6rODtz0oqimUQTLG9QkInn/bOIsGCnygxfk6BY8oJYYIfq2tVeNI7xL2EFAzz7H54F1U4JtD01f7TYA/X9s9FW9BsQiGfaHYmLH51bK+nWiB1SafXbDVGpsqzy+IjFxFpkttmSWSvCCsw39NZGiM7AV4XyzXwPxM=
To: xen-devel <xen-devel@lists.xenproject.org>, Ian Jackson
	<iwj@xenproject.org>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Backport 6d49fbdeab3e to 4.14
Message-ID: <c8af8c5e-46cc-ab85-0364-0840d2309759@citrix.com>
Date: Thu, 17 Jun 2021 19:24:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0461.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1aa::16) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e145a085-8de1-44f6-6d5c-08d931bd3054
X-MS-TrafficTypeDiagnostic: BYAPR03MB3942:
X-Microsoft-Antispam-PRVS: <BYAPR03MB39424AB27C4E1EB49F6745B4BA0E9@BYAPR03MB3942.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0npWTrnRE3QCSqLPipVZaYfxd5OfYFJpM+9oyk87Rv3zqhHvzAk3VTkdnzP3aUpIlsAmNoWZ3lpx7FqoV+Z3gv3bptI6EIxk7pu3VnMIu2Giz0KVFIGZe7JU6foAqGQWntEIAeAsWlmwiEcss2JhySGNkcIZrIcoB+7F3QFgBz4Pl/np2RfaUhvBXRkHMZS6RJ80g4338KvcK5JB4uwEs2XCa/5tq88/E5tVTQH8yELu/EUetfxANVpe321IYlXS3UreH8wLjJxaBqFPAe8K/SRF8pA5RQYnZrXS0LW851Qe7j8IVzAjibM8Cv8p5L+Zx7vOxL3LSyZ5pScttt6QKsAaDql3Pg6r71ni9dRT4q1k/vhD/MnAVcH2fv24CKKVePPPugKy0fW8zhkmqAraB57Tt5QDZgIqe8I0eoW2GNFhdF/OCHkgClhA0D8TpfYlnjBAeIom1/SOf531zN12RnYmWb/f1g1X/U8n1WvMiprFrqK563LrqdOd7w2EhVUPD0R03q/WK4Qr0KPMCX8RtN/j0ZabVlM1kV1ToOWxuBdvpOzMAFQBGAWD79OqdEh/Ez0pcmUPCf9kUoyznP/itiDgt8qSrALokI+EGzBu2/lIZSC/skj7taxgAEIUTHb/3dEv3MptIqc51CVdTxye3wh1SBlCLa94iMHp8spDY42BTcn/hDQB61PY+7jh7CRDvM96FBDW896doJS2hueaptOuc1NAmOAnrbRCYcrfvsQ9xG4Wva3HmN8O3TDAUMPwsEulVljq9/NGDphVTG93FO9qE1qWAQKP7JBnvmWOrwuIjR2DfP+QIKNLfqjEooP8
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(396003)(136003)(376002)(366004)(346002)(2906002)(478600001)(66476007)(8936002)(6666004)(38100700002)(966005)(31686004)(66946007)(110136005)(186003)(66556008)(16576012)(8676002)(6486002)(26005)(5660300002)(16526019)(86362001)(31696002)(316002)(4744005)(36756003)(956004)(2616005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R1pxaFhsOEhDd2g2UVprZ0x1TExyRHRSNHpYUE1IY2FaTlk2ZmtweFcvUG1N?=
 =?utf-8?B?V0V4U0ZWVFpQTktRK2tMODltaXc4NldjR2ViU3p5Wjd6dTh0YUIrckdac2tx?=
 =?utf-8?B?Y3Qzck82VjJ0UDJNcWhrVEpNY1MyRGFpK0NnTVhRNHJ5QyttOUxoWDlQRkZl?=
 =?utf-8?B?Y3ZwTWdnRC96RUsvUVFTQ2NZVEZna2JmME9naWVjSUFyb0FsUm9uYVp4RUg4?=
 =?utf-8?B?VFVIcXZwdzIxbGpacFJQYTI4clloelhWMWxwcmxoUWs5SHJwNWk5UHdJNzBF?=
 =?utf-8?B?dFI5WEdtckVvSkdQSFJkTXoza2ZSbjlOTmlvZmErRnR6Sk14YVBqUlpFTTEr?=
 =?utf-8?B?eGNhTGxsYktKYnRPVFZYMmFBSnNSeWFSU3IrSmtFc0hKWXFnUlBPWVFoTWE5?=
 =?utf-8?B?dkdYUEtLd0txR2xvV2FlQWQ5MTd1MEw5VEZGVlNXWjRMdHVWVjY3SmZHUzht?=
 =?utf-8?B?Z1FTTDBZNFNZemJZTFZ5ODhEOGpaRmlJRUNuakJyVStzd0VveGJOdG1ZTys3?=
 =?utf-8?B?VURpeEs2N2ZqcmZ1SEpPTnoxZGE3TzJxS2ZuTFpUenlkSzFsQlVyMWhaSW9W?=
 =?utf-8?B?RzZTT3VlQW9TbklXVFFqOFpiUXk5VkdWMlVMQmhTQ0grQWhCbUg0L3RqNDJN?=
 =?utf-8?B?cTVpdFRCRTF5UlczRDdtYXE3MiszeFFYQjdGazNrendaK2d5ZHlXRlh4aFFY?=
 =?utf-8?B?c1RBL3FnandBYU0vZENJMTZpWFVmenY2Wkdvb2hMbUFnanN5cjNEcm9vL0VD?=
 =?utf-8?B?OERjVE1Oakh1TitseTdHQzFUUVFldjJpdkJtV3paUXZ0bTJSQ0hFNVVCb1ZB?=
 =?utf-8?B?Z0tUWXpDOWFXcEJaa2FwS25FaE1KZnIyWFhjQUN0Slk1WDJFUFJwTmlyWlBw?=
 =?utf-8?B?VCtVRU53MVBwNDd6cUpDQzhUdmhscm10M05TbkFmVEdjV1VnNkZQeTZKVStP?=
 =?utf-8?B?MG1PNGwySWxjaXNQWWxXQjJONWkrdDE2OWFuWmtaM0R4azN5OWgxS2JPbUgx?=
 =?utf-8?B?R0ZGajZ0S0lVcldMS0hSQnVlYjdTNG5NR1QwQmVCdXhsT0tBNzdvVW9ua0Vk?=
 =?utf-8?B?Q2NlY0lHYUV6OW41Q2l0Tk5vR2JwZ0gybUxhcmJhMnk2VlBlTEtGL2w3bFBz?=
 =?utf-8?B?WWQ3REdULzRGb3VWeXBDK1hNK0o2bFZ0TmJyQ0NCZmJidXlDR3o2RmN0czFs?=
 =?utf-8?B?L1dYY1FyY25Ta3h0bmpKamFWQkNXei90SUorenBVK1kxWGJoOVJVOU9ZdGhD?=
 =?utf-8?B?M1ZuYWp6V0ZTdEwrbFhSOWJtOEJIRUEvOGY4NkhHZmVOMXQ3djdTdWpGZHIr?=
 =?utf-8?B?czBpb2FJUTkwZlhudnhHa0d3TkRQSjhzc3FVUXNSNmE3YUtwQnlUQWEwUlpK?=
 =?utf-8?B?ZzRhYXhPTmZWWjM3aG9FcU5aS3JyWU5HVkl0TzJsUERCejB5TUNuWVR5NERS?=
 =?utf-8?B?TlltR1BKSkJDRzVWb01zcGV4NVRuTGJMREI2MjhDeG1OV2Q5dXY5bWVlKzUz?=
 =?utf-8?B?aDBaYzZtb2p1WU0rSlgzd20yU3B6Sll0MTgzcXcyMTBLVFQ2Y0ZtUVdtNU44?=
 =?utf-8?B?VzhGallrc0hSY2ZkRTF6c0JzdC94UlBUV0RCU05GaC9nMndGeGl3dmdGRFRB?=
 =?utf-8?B?SzBPanl0aXZIVXlzUUI0eWdadmRTZGhiSkJuZlE1Ry9acWtxY0NxdnJtRTUw?=
 =?utf-8?B?WFdrV1IxcjV5eHJTYWlxMVdNa0NjWU54MU9yaE8xVEdtS0E1M0F1aitNUmFH?=
 =?utf-8?Q?LEEvBcI4IDGP64FeYcWvAth8G5BsRvTVe+tPW54?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e145a085-8de1-44f6-6d5c-08d931bd3054
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2021 18:24:48.0954
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r5trJSrWK9DWVAVtcjWVPEyXVT4iv7WbJa9C+gWcAM7hNvOR1+9Z7we8NHCzkEYuBU3ZMqHgVuZVIgawpOC0lAN7oSjdSCfKJKRrDcrD8cc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB3942
X-OriginatorOrg: citrix.com

Hello,

Gitlab CI on 4.14 currently fails, e.g.
https://gitlab.com/xen-project/people/andyhhp/xen/-/pipelines/322762306

The problem is that CentOS 6 (still supported back then) has Python 2.6
in it, and trips over the bug fixed by c/s 6d49fbdeab3e (4.15).

From IRC,

20:18 < Diziet> andyhhp: golang is experimental and the impact should be
mild so yes, but please can you c&p what I write now into an email so we
have some record when I have forgotten again :-)

~Andrew

