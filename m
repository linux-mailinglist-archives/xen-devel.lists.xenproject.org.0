Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CF0D33103E
	for <lists+xen-devel@lfdr.de>; Mon,  8 Mar 2021 15:00:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.94957.179029 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJGQe-0008Bo-LR; Mon, 08 Mar 2021 14:00:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 94957.179029; Mon, 08 Mar 2021 14:00:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJGQe-0008BQ-Fk; Mon, 08 Mar 2021 14:00:12 +0000
Received: by outflank-mailman (input) for mailman id 94957;
 Mon, 08 Mar 2021 14:00:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wBqT=IG=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lJGQc-0008B5-IV
 for xen-devel@lists.xenproject.org; Mon, 08 Mar 2021 14:00:10 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id be1b9675-9e37-4f55-8139-3c109f35872b;
 Mon, 08 Mar 2021 14:00:09 +0000 (UTC)
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
X-Inumbo-ID: be1b9675-9e37-4f55-8139-3c109f35872b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1615212009;
  h=to:cc:references:from:subject:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=2QFGUf0NpAEB3q315oWeky3tTb0uY9yxwUgU4ec7utY=;
  b=cXqPwpGC9Zg6GqiuT7MQdV7Axn5jiK81d4mmHju9acYSYpeAyBH0ZZSD
   CZqDhkSdVV/letJv7xoFfahZNDra72yE8uyQ7qFr0NyhNqSoHVeEM6/tA
   fYtyns6Pz+IEo2wcY1qZJ5GfLKqfut3syh0H0s2Mhkuy4K8p4VzpbzQci
   Y=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: v1rgk1PRTuGbetZpADjWPOsR3NiEVkDPUiMbeLw9jOEY/oNCtQ57jV/iJzUvOGHjt5Vn9bBT/F
 CDpHZCTaAytcki2wdNY1DOuxqJg39F4GhsY0l5cYz6I9OMtW7vHB8/pMcxKFNnicwfexHwMluN
 GGHRV680Dubto8WrvvTiOn3P4FS37UrIA8Z55pI83J82axNFawDcpOOYKQDIx18JSI6Cb90aQ7
 HPgCigU7FXffgF2zx78901XWHERwXnywrH+U47EBL8In2J16YNsZ+R+TVjHHC9lr0F2lrNZc9a
 44s=
X-SBRS: 5.2
X-MesageID: 38682582
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.81,232,1610427600"; 
   d="scan'208";a="38682582"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dDKxjfpjwMoKs29JOOatnt9Kvzgb5NX4tyT0kaOzhOrpoIwWOHXMb91aNjPGgjvLkuXwnFxNNnh5/rcWTDVhWvjMk7votHyGre6O2dwIO02nXdbe42K40Vu79/3acrhGW+aO7YD6tBA5mzknGCpU7JCwtyVxBWdZL0TBmCbcjkz7qId4nogLK51mjydhPRg4p+Dfa4l0IzxcWjQWtxeNncYkvmdEsD2lxeL2YJ3F9MOTyiIb47WhWihX9LGNz65lnTxsxrAA6L0mx/FuFbnnyhLdDRsvfkoTrKN17FWRMtyGJZAOJnwKCfKw5g7cY+wi2zUMkQlBtoAyv8I7SO3Nvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2QFGUf0NpAEB3q315oWeky3tTb0uY9yxwUgU4ec7utY=;
 b=KGuyGsQICWM7NoTf5T7RIrGbG685IphSwc2VxEQfml/HY73brTEuhuxN7tXZcGU+LtDGCZnkRXZL8hpzFK2/CmMAVrVkEod9a//nU9haSFW9JwyvjHYYCKo6DPEQZ9JPYzMBcIxSLxDbG2ilP2cQEwTYFXPZgOvqVUWDphFuHaN+mMTWoRGBrKgKJouIO3w307HdXtN+ner0WOPUY8ax8tLN8utNddbFRiWlQal7QTQle5DdnE0MPipoJ+uO4ejsYJgXC8MttkfWJAMtKuRcGAX6IWlKMZ86TsSHVVNfyk4NQKWtiAVKvnESGgSG+0SFiv4Rvepk1EiQx5DPoubeOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2QFGUf0NpAEB3q315oWeky3tTb0uY9yxwUgU4ec7utY=;
 b=NIRFm4DVbZT2PnGAp0Yk1/BL7/2O2oVn2KVO2hgbInlO0rK2uzxwPt8apmBMvpVB+HuU6auAxdyziKjQQEsuZrma/pyBQm68u0EoFMMLWhT0Mb9ALvXUlSsFF1YghS4T8uid4+5LFzp3w6FRuL4qA5UBmenIDwKreCNxPvp1dPg=
To: Jan Beulich <jbeulich@suse.com>, Tim Deegan <tim@xen.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "George
 Dunlap" <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
	=?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Ian Jackson
	<iwj@xenproject.org>
References: <d0190313-921f-7cbc-4659-9a79f6299fab@suse.com>
 <3bb90ab6-22c9-31d4-88a2-39bd3d81c2d7@suse.com>
 <YEXtnkYzNSXasTw1@deinos.phlegethon.org>
 <96c83adb-9e81-8398-c905-f4f0730ba240@citrix.com>
 <ceed3443-0b83-6baf-2ccc-c59d834263e6@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 1/2][4.15?] x86/shadow: suppress "fast fault path"
 optimization when running virtualized
Message-ID: <8fd91411-ecb7-c0ec-000a-b1937c98f57e@citrix.com>
Date: Mon, 8 Mar 2021 13:59:50 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
In-Reply-To: <ceed3443-0b83-6baf-2ccc-c59d834263e6@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0474.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a8::11) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b74d4776-7338-4e3a-f5e0-08d8e23a7532
X-MS-TrafficTypeDiagnostic: BY5PR03MB5079:
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BY5PR03MB5079DEAF0875E0DFF8EF4C1FBA939@BY5PR03MB5079.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vxiSfHAZBCOvyjnSa22NkXwoK0CI9VDlvxhwsl52PQe+IoxuslE9RIKvv5czSA1Y7oNy++Ap0PTIeorcwVgitJlnuoUxI00lXjIwPq7hAF002CbEeFlYM5xYmQP8Vz2wWe5bcot05h+OczitEYEXGDi9u1G7PB89NvLmwE2sLh+pqxHPbP/tpKg+nswnGm1tmSHZrcvWnwSsnl2Xbge4yYdzSyamIerv0EqWX9fuBb/Ke7HO458Mc1gV0QDs7TKKEmj1R96oC/HVc6e/dpQeDQSpV48rHbVkueJxWpA1LzS4fIJgpYchQzXxgA3I8jLZELM1oYwcMLZ+KBYN7tLuVylJ8916RtFDhmTV6DnGGDU8GSmT2LmQ2ht6l+Uk7HXqntCq9oYVynckCJ+HrWO2h9/FCqq4l9y+WkmtkavhH2af+RvqbDmLNSQ/UMP50PmYwhPBoK/IA1drdfZnZkCQrb+lLk5w7xKbOp7WIgzuK+iUq5hGrq93SOoBn+OEOWCer/tt8fi3b0ZXFZbVvBOg0dHDaQvUZEZBcR4inNkTKr6DPD/uz4KP/jFeJRBtC0/vnIom41wNgvT/VLBJ/Jyjub5DgdSY3H1UYYLbYpsXrAY=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(396003)(366004)(136003)(39860400002)(376002)(2616005)(16576012)(54906003)(110136005)(66946007)(83380400001)(86362001)(66556008)(6666004)(8676002)(31696002)(36756003)(6486002)(66476007)(26005)(31686004)(8936002)(4326008)(316002)(53546011)(478600001)(956004)(186003)(16526019)(2906002)(5660300002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?V3A2cDJjS2poL3NTVzFpcnp1Z0trUldaeUtTa3pkSTFlSmdkanN2WG9lRDEv?=
 =?utf-8?B?bUJ3UFhGZVd2K0RITU95R0ZsS2kxVkR5VjIrcmhndDkzdXdGcG12S0daNjJk?=
 =?utf-8?B?WUNIQ0ZDNXIyb09RN3kwdjlWbjlFa1hERkVSYjVaNFFEQjJKUHBtNzFZcnVD?=
 =?utf-8?B?cmM0M2tnSjBTb0VoVnZCU0lXYVBkb2pHRVRRRUhDR2J1bWhmK05LVTVPUDhm?=
 =?utf-8?B?d28xNkRWWUpLNnQ0OUQ0bkVDTUt2RUZXbUYzb1l0bys4OHdNNEd4aWk1d3RT?=
 =?utf-8?B?R3V1dnlJWXhlNnFUR054ODBBYlV5R2xVZ05EaU1RTlBEblY5VEQ4MHoyYldi?=
 =?utf-8?B?MTdZV3lkeWxMOStic3dNbjkvay9aWGhvdEJiQTVIdjRmaXIzZDJQOEhmT0tQ?=
 =?utf-8?B?N2VCVXNteVBZeWEvbnlMS1RvUmdHc3dJRUxiWnVNdnNiRjlwQ3NtZS8xTUUx?=
 =?utf-8?B?VVFneGVDTzdqVHNqVGVkSXFHWU9lVGd2SXR1cjBoZ3BjVUExcE9yQ3phZ1ZL?=
 =?utf-8?B?YnJicFNJR2hBWENnTzJoM0pLYVU4OVlyeGc4eGdJcnRUZXIxdGZ1dWY2K294?=
 =?utf-8?B?dnorN1dLME1VckdXWmJTdjBydlNSSmoxdWM3cnBXRG5xMzZUTlllRmYwck1J?=
 =?utf-8?B?MFI2TGc3WXBJNXVrQVJxMVBWM29Uem5lMjI1eGs0YzJJRWNOR0VrWm52aEt3?=
 =?utf-8?B?dlVBc21lUVVxempaRzZoaVJSZ00vd2prVGZ4RXBQTG0ya2psV2k2bm1nbE9M?=
 =?utf-8?B?SnhDTzFLdjAxVUIvWHd4VVZuSkREVW5vR29maVlDYkhqb3d3Nk5RcjIwaUtj?=
 =?utf-8?B?RTR6M3FUZzBzK1Jvd085NEs4cE4rRzVqKzh5bE5tTVVxRXVuMEg2ZUZyZmlI?=
 =?utf-8?B?MFpwaGN3ZmNPbmNkR21RYUVreWk5Mzk0U1Z5UTVRNHZ4V1gwQVE5LzFnMThI?=
 =?utf-8?B?R1Z2Qk5UQlYybHY2b1FYbDVFZ05md0owcjRDbkVsVzkrM0F3VUVOMDN6eE1T?=
 =?utf-8?B?dGZDdGpXc2YvSUthRzFJamVQS2JjbE9YQWg4alRCZmZhUUc4Ry9qNG1GTksr?=
 =?utf-8?B?T0lVcWcwSDNNNlhyRzVGWE50MzdvVmZ6RC9IVkxzOXlTRXdkQ1hCQkExWEdH?=
 =?utf-8?B?c0NmcU1yQkZXUUlxT0NoaTZLbnNlbHNLWk4rMFF0YmdBbDFsVlo2Wk5MZjFY?=
 =?utf-8?B?QUdLdjBrY1FVdUlNZm1ybytpbzNXQmV2L2hpeDkyRDI3MTJOb1BodzVOTGJS?=
 =?utf-8?B?T0lNb2lGWWVJRjZEZzJOT3lkYXhsaUJ3OFhvRVBqS0E4RCtDL2lzUGppY29h?=
 =?utf-8?B?Zld5YzBxZ25ZZ1NKY3pTa253aEtjYnBLN1dOeG51bExZOXlJRkJtampJVjI5?=
 =?utf-8?B?ZXNYTDRLZW5vQTl6dVpycm9nTU1YNW0zZVE4WDlYUnFMK09qS1V3VGYzdUs0?=
 =?utf-8?B?bFlhOU4xUTRmM3lPRzJVZzIrT3M3bCt5VmM5cC9JMUc3czN5K0o5VnllYi9K?=
 =?utf-8?B?SXRPZnh6SWFicTUrT1FnQTJtM240UzlBbm0veWdQcFNRdUl4am0rbzZIUmJN?=
 =?utf-8?B?Y3FtZVBFZjJ0b1RCeXBEWTBGRkdHVkFRQWd2TDRab2RwRkFHQyt0WStWd1J4?=
 =?utf-8?B?Nm5mNWZCOWJ3VlFnK3JwaDNKSlY3UHU2cThoT21yNCt0b3Exekpza2hXLzBy?=
 =?utf-8?B?TEFnYUdKR0JreGRlU0xXcmlBWW5Nc2hOTnJVbUY5T2ZISmNKdERVd2lxTWdT?=
 =?utf-8?Q?TwKmcQi4tQGHwLrD3kNRdJLvYKf6ch3rtLh1LcZ?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b74d4776-7338-4e3a-f5e0-08d8e23a7532
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2021 13:59:57.6498
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hbfg+0+olqUMaTeV4xW/TZtuw7jQxF9RVB/IY/cUMvikY9aqfIwuLvouEOMAShxG5J6kYltTR4PMdqGs0V95EXqGhQxSMrDFdoHaU3J7ajA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB5079
X-OriginatorOrg: citrix.com

On 08/03/2021 13:51, Jan Beulich wrote:
> On 08.03.2021 14:47, Andrew Cooper wrote:
>> On 08/03/2021 09:25, Tim Deegan wrote:
>>> At 16:37 +0100 on 05 Mar (1614962224), Jan Beulich wrote:
>>>> We can't make correctness of our own behavior dependent upon a
>>>> hypervisor underneath us correctly telling us the true physical addres=
s
>>>> with hardware uses. Without knowing this, we can't be certain reserved
>>>> bit faults can actually be observed. Therefore, besides evaluating the
>>>> number of address bits when deciding whether to use the optimization,
>>>> also check whether we're running virtualized ourselves.
>>>>
>>>> Requested-by: Andrew Cooper <andrew.cooper3@citrix.com>
>>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>> Acked-by: Tim Deegan <tim@xen.org>
>>>
>>> I would consider this to be a bug in the underlying hypervisor, but I
>>> agree than in practice it won't be safe to rely on it being correct.
>> I'd argue against this being a hypervisor bug.=C2=A0 If anything, it is =
a
>> weakness in how x86 virtualisation works.
>>
>> For booting on a single host, then yes - vMAXPHYSADDR really ought to be
>> the same as MAXPHYSADDR, and is what happens in the common case.
>>
>> For booting in a heterogeneous pool, the only safe value is the min of
>> MAXPHYSADDR across the resource pool.=C2=A0 Anything higher, and the VM =
will
>> malfunction (get #PF[rsvd] for apparently-legal PTEs) on the smallest
>> pool member(s).
> Except that min isn't safe either - the guest may then expect reserved
> bit faults where none surface.

Such a guest is buggy, and in clear violation of the rules set out in
the architecture.=C2=A0 All reserved behaviour is subject to change in the
future.

Any software (Xen included) deliberately choosing to depend on the
specifics of reserved behaviour, get to keep all resulting pieces.

~Andrew


