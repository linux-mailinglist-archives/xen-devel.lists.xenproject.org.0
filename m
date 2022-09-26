Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F0AC45EA67C
	for <lists+xen-devel@lfdr.de>; Mon, 26 Sep 2022 14:48:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.411777.654834 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ocnWl-00079v-Em; Mon, 26 Sep 2022 12:48:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 411777.654834; Mon, 26 Sep 2022 12:48:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ocnWl-000773-BJ; Mon, 26 Sep 2022 12:48:03 +0000
Received: by outflank-mailman (input) for mailman id 411777;
 Mon, 26 Sep 2022 12:48:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=L52i=Z5=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1ocnWj-00076x-Dr
 for xen-devel@lists.xenproject.org; Mon, 26 Sep 2022 12:48:01 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr20081.outbound.protection.outlook.com [40.107.2.81])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 73b4e7ee-3d99-11ed-9374-c1cf23e5d27e;
 Mon, 26 Sep 2022 14:48:00 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by VI1PR04MB6958.eurprd04.prod.outlook.com (2603:10a6:803:137::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.22; Mon, 26 Sep
 2022 12:47:57 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::358f:58dc:c0c2:1155]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::358f:58dc:c0c2:1155%7]) with mapi id 15.20.5654.016; Mon, 26 Sep 2022
 12:47:57 +0000
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
X-Inumbo-ID: 73b4e7ee-3d99-11ed-9374-c1cf23e5d27e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E5sXKifrxpHMkM5kfoM4P+ZyUy7zlcWqatMU27lszJ7xFghUQRMGqVZljxpaAm+DzEWrik+izXHcT0e9vzVjbKbMAC8FMD45l23fySrf/SH00mncrJfd8D7WEy5TcAtHQnlJ8u5sk0gE+CWY/CpYqSiTJ5wiNcJEJxVkHgY5GXkRy62TkrB/O8FSjgmOcLY/qwlyflxco34COcp0bTLlB4Xzo3GhSn9BZSFDDkV0czqAAl5DIXAtnQDqdxkf+OqEhOrJk0jNXs2lVw329f09xZdad/TeB/a4Mu+cuKNSy8sVHWyxpOLHGpmv6RJOhmuTyrvXsQoDdusejGGgG64kXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GF5cs8X+2vlzNrJM/nI/jpzWosjyRdbH7wYIscY976g=;
 b=IH/LYZi79tHo9x7OM5U5E2MQjSfqcSm6g/WbqsnEEla3AZpkc6EwyEdEA1uO48DegxHjZATFE6RPiFTUwfgTLVaLlNw4YLbaZa9U4LDt0TXXKflwNZ51reX2YBnamBt8iciyDL5D2KsaCB7uTb+WnmlDIPwZJfPkmS5JNTXKKeK0dxTFzCN0xdwCUGZS8P1ZxBtd3Ob59qKNr3Qu9BOUbIere3t5BgcTAxLODDm1sTKsjFN0bk+X0/zM1p7vMp6E2FJjNa5n/o6PZM3bOM0XXgFyeIVINvQCF+rmMwqCfgjG8CtmLTuzCTE2+vGz0vhOTExOB+4HqP6VxteWBE4E7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GF5cs8X+2vlzNrJM/nI/jpzWosjyRdbH7wYIscY976g=;
 b=I8KQzNW1SsD0oc5/Tt9nYBSEmzUNxaQ4b40F2pS+aahyj8fSSicjdeV+iE33SdCqQim4+qKF2U/OO1hVCiXXngfpwHYdeisOOyy7sr5TxE4yMNSG17ZWWH5EQ6D5KrKlU25zcq3I4V/l1QMjKF0oVDkWIi6VJvOKeviAu24nigcXdd+6aZ7CkFC4BenQAJ4kxL0bm1GXcTldMM2xsckNXQkfBsAxd2IXNwKZ9UUuFX2fVmpueXct6oaJ9fO/I04P1LjJTi6CK3VEZGUcrNAudn1wzAXe+AiBr6FfO0tAZXJCXAqtbkSos2EYl0yJt8rkJ0KCdCpYCuAVpkigvNlDAg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <ca19380a-6ccd-453d-4693-ea666152f45f@suse.com>
Date: Mon, 26 Sep 2022 14:47:55 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: Design session "MSI-X support with Linux stubdomain" notes
Content-Language: en-US
To: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>
Cc: xen-devel@lists.xenproject.org, George Dunlap <george.dunlap@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@citrix.com>
References: <YyyHvp34Wg1kSqFu@perard.uk.xensource.com>
 <f24b9e06-f9ed-aa0f-0d69-abb8f0d7560f@suse.com> <YzGeY8L6Op7n8pip@mail-itl>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <YzGeY8L6Op7n8pip@mail-itl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM6P193CA0115.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:209:85::20) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|VI1PR04MB6958:EE_
X-MS-Office365-Filtering-Correlation-Id: 849a9265-b886-4473-f807-08da9fbd5622
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	oogTJYjFzCSYDvH/NPxdVXANWRvkcEDRaKvSoTZS49F+lVZfry4nAKId/r260/1HfyZi1/MQ696+3C+3StRLb7VR3rI7EM8vSldXgjGmlANpAyqIm26o8LKGafnDkrfEDX+erxksm/DfwYZqDetAzSwLntKFTnWFLpNOifQrmJFePg4cBTn23PwuDSlsDEuRLPovvevqQdKX/CBi/CsUrSId+bvcMte807+sdorsQe+KFLLQBp2uTgB2IPk9cMCDN5dmfSJXPmz5TCLd04aHeXFJQkmdy22Rv40SOrbi1gEwTxSGiXSOC03ngSAaduDLFE63M2CT88Oa5YMcBQ0yvp4j3HQyRP9QTpDNsDS1eY2tx/248pUGoiuAhkr4MjXk4w7dXqwwsGhP6sfFKoM1xknEtzI5sOtjwCXyGl9ESdf8QW37cNCR9b1SW8SP9EbbHzc92yoAlrXbrVdsaDUjCF25WS0yy8jiNtWIeZQzmtrLyWOS8LWQvHPyIPN92BZcLvsbsJijScvnDeGOJic7/3Dxaik8wYpSPyMRCujZv4EBR3Zz9vIWlUjSCGutxoo/UKI7SbrC9sDZfY7AWHZY+84EuYaIjB8rVJF/VzZdkc6/aVreTXjdV3h8Ik8IsSEpHPhvecRfELRjjFL5FSyL+rZaEgiB5TgNnXcV0WwOcYF1POnwsaG6Xqen+yZPbxkTzQasjBYjraWCT9G8Fmh6KFBGAUk81Gym3rm/AAlSVgow9UjgrtQbrVYqFcqPhMIFM/iCbKtcLH8SN29vHHP2kDKMV8C+c2Y/I8wo/19fPdeWraW3tMpjHw0qNFdpmRYEzZDPwuZaQ9uPdzuULPmOyF7ShMXWi+CNcmeEDRSp4sVPpel+LxRHXW9RmyL6K+Jb
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(136003)(366004)(396003)(346002)(39850400004)(376002)(451199015)(31686004)(41300700001)(8936002)(2906002)(26005)(186003)(66946007)(66476007)(66556008)(38100700002)(66574015)(966005)(478600001)(6512007)(6486002)(2616005)(316002)(4326008)(8676002)(31696002)(83380400001)(86362001)(36756003)(53546011)(6506007)(54906003)(5660300002)(6916009)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dFY2Tjk3dG1Dd3UwUmtVZFViSFdTVkU5YS9XY0sxMjNwbUlJUExSM3RBTC9Y?=
 =?utf-8?B?OEw5MHZGMFl5SSszRXcvUmtGT2tPbjJQbVM1cUwwSm5ibklQWHRSSnUvOXU0?=
 =?utf-8?B?bDdQVE9wWm9seHBoaVFrajlYRHhraElyZGFDSmJXVVFucnVGQUtGaUJmK1Vj?=
 =?utf-8?B?cTREaDhSTE1aMFM0MGVBdXBuY2JFNnBUKzVEdGY4MDJTamx2bUNrdEZ1blM1?=
 =?utf-8?B?cFppNTlaWTNBMkVIdXZ1bjBiVjM4TnJBT2prNlUvaHNBcFZFcU9lM2VFcnRV?=
 =?utf-8?B?cU5oTkxIbEVOMEtlSjZMcUphNDZHQ3p0R29KZzZzWkxwOEhDYlNVMUZianFq?=
 =?utf-8?B?N3VKWHpxMlZ5M0Uvejd3aVhtc1dBNzNHMG00NkhWdEkwZUhUU2lMUnlYamNX?=
 =?utf-8?B?NkpZZkFHNkpPNFZuZlU4SXlINEd0NGtqWDlTNm5zMTd1ZUpuVERzUVFhK0Jm?=
 =?utf-8?B?d0EyK1FSbVpDRmNibEN4SXJlZVR4TGZOVjIyT3ZmbHptdEw5cHAzdHFWbk9T?=
 =?utf-8?B?WlZCUko3VEVrTGxQQ3BGY3ZtK0VPWSsxOUdhU0VseEtPZUgyMWNvdlhqdXB3?=
 =?utf-8?B?K3cyMzdUTjlqTGtyZkJrWlZ0S2tSbFhuNURpR2gvUzR5RXJhYzJlcnRaOVBI?=
 =?utf-8?B?YTQvV2NzTlM5TStFTHYweCtoWTYwN2tsWVM0NDZ4V2ZOREVJYTVIVHVuV3Jp?=
 =?utf-8?B?SFhpSm1PWDQzZzh2ejMxLzVJTnVOMVRiTE8ybVJ1Sk4rQnVqaGdtY3pWSzNp?=
 =?utf-8?B?RFRBWERXWmpaaW5hRzMyOTJHNWpnTkhTcmZtdHF6bVdCRkdRb1RrNStZblJz?=
 =?utf-8?B?UFN2K1hFSUxwcjltbXZwMm5CWWtBVWJNUE85cnc3UHEzQjhRMC9hdDZrQTZE?=
 =?utf-8?B?YThDZVpXeUMwMVZpclFlU1h6ZW0yb1VtMTZ1djRydkZJYy85eU5NUWNCRnlk?=
 =?utf-8?B?TzM1ZjhoUHJQL052dC9ncnVMYTFHc0UybjJCdlA1V2ppQ1pFL2Y0bWZuUnFM?=
 =?utf-8?B?emdFanl0RWxrZG1NWU9KVXdGcWNnWitYaldTTmhpMGlUMlZXN3pPd3ltZTVl?=
 =?utf-8?B?R08vNFNKc1BVT05ObFFxbDBlU0JWOVNtZ29hR2xRc0c4SkpFWVdmaFAzVStZ?=
 =?utf-8?B?cmdDcStOQkg3TTJSQS8zOU5md3I5SUtlY05RdUpQREY0c3hkQ0thalozYnhv?=
 =?utf-8?B?cnJIU0FVRkF4VkNEK2xjQ1ErWTN0d1A3cG1TS1M3WUhFSXpTMStxRHNDZFZC?=
 =?utf-8?B?cTdDcW81YTBvMHppUWlOb2ttaWw3Ry83aEJQT04rbWtZekxRYUJRTDE2WTBm?=
 =?utf-8?B?U3RYN0ZPbU9zQ1VDWWlTR2tQa0JEVHpqdjVvWEpNcW9acllSaEJURmRTdTFz?=
 =?utf-8?B?TTNjWlQ1OWZxdDc5V3hVTGJhV09jU25pYkdiOG14VWUzVmlQdDZLRWp4OGVR?=
 =?utf-8?B?S2tvMDJ2Z3JjSWRoSDdVM2kzWGhjZXBtRTQvamZ5RVJHWDJFdVJwWktjTUU5?=
 =?utf-8?B?dGRZUGw0UEx4TGF5emRhU0ZDd0ZxR0hiU3lqSFEzU0R0eE0vQWxaYjc1bVg0?=
 =?utf-8?B?OTFKZnFwbGZmTzY3UFhoVnRkVXdZZy9pZXAzbU5NL2VzQ0wySzlsVnhNdFNV?=
 =?utf-8?B?VUsxMENkY2Y1WUNCT0ZzVEx4WE9zZDRnSHh4SldJQzIvbEtSeWNKbzgzVlBu?=
 =?utf-8?B?NUUzMHZCVjBvS29FRXUrZVVsdzFialVhNTkyVW5QZ1htN0dKMitoM3NuY1Zi?=
 =?utf-8?B?b0F5b1RDTnl1Qk9SeFp5VXB6UEpQWGlPKzdvUU9hejVDWk5JWHVJWUZLSzBj?=
 =?utf-8?B?byt4SkhqaHNLWlJTOEp1eDFCRk1lTC9CTW5nVkRzR1Y1c1paK1Z4cVFwMjhu?=
 =?utf-8?B?c1dKRXlFYTFOTkVINmdNQ1MzMllkNnRHUUxGUy9XUHBITEJYdjBFOVpHRkVl?=
 =?utf-8?B?dTlZcHZMMmJ6SjdLMTdldGxqdmt5Smk0R0RielRYekthbG9KcUlNU0pIeWZP?=
 =?utf-8?B?NDA0UUZ0RGVjb3JYdDlXL1M4MnBEamNkc0NGYzM2M3I1Y2FOY3JHdkZhSGNN?=
 =?utf-8?B?S0JONmRuL1g5emJCN0g3V3ZWT3BWNi9sYm1QYW9jSUh3UVROR1lhbC9jN09R?=
 =?utf-8?Q?ILW19r2uqsABwSddn7mhrKQuL?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 849a9265-b886-4473-f807-08da9fbd5622
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2022 12:47:57.2707
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O7rOqU3TozzoR9lgG+7CAls5gSXI1/+2cTSo7if+dFtFPnVXsMVr4a+wPPWCr4qW3nB3s7ZqU2T/5LuzkPup/A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6958

On 26.09.2022 14:43, Marek Marczykowski-Górecki wrote:
> On Thu, Sep 22, 2022 at 08:00:00PM +0200, Jan Beulich wrote:
>> On 22.09.2022 18:05, Anthony PERARD wrote:
>>> WARNING: Notes missing at the beginning of the meeting.
>>>
>>> session description:
>>>> Currently a HVM with PCI passthrough and Qemu Linux stubdomain doesn’t
>>>> support MSI-X. For the device to (partially) work, Qemu needs a patch masking
>>>> MSI-X from the PCI config space. Some drivers are not happy about that, which
>>>> is understandable (device natively supports MSI-X, so fallback path are
>>>> rarely tested).
>>>>
>>>> This is mostly (?) about qemu accessing /dev/mem directly (here:
>>>> https://github.com/qemu/qemu/blob/master/hw/xen/xen_pt_msi.c#L579) - lets
>>>> discuss alternative interface that stubdomain could use.
>>>
>>>
>>>
>>> when qemu forward interrupt,
>>>     for correct mask bit, it read physical mask bit.
>>>     an hypercall would make sense.
>>>     -> benefit, mask bit in hardware will be what hypervisor desire, and device model desire.
>>>     from guest point of view, interrupt should be unmask.
>>>
>>> interrupt request are first forwarded to qemu, so xen have to do some post processing once request comes back from qemu.
>>>     it's weird..
>>>
>>> someone should have a look, and rationalize this weird path.
>>>
>>> Xen tries to not forward everything to qemu.
>>>
>>> why don't we do that in xen.
>>>     there's already code in xen for that.
>>
>> So what I didn't pay enough attention to when talking was that the
>> completion logic in Xen is for writes only. Maybe something similar
>> can be had for reads as well, but that's to be checked ...
> 
> I spent some time trying to follow that part of qemu, and I think it
> reads vector control only on the write path, to keep some bits
> unchanged, and also detect whether Xen masked it behind qemu's back.
> My understanding is, since 484d7c852e "x86/MSI-X: track host and guest
> mask-all requests separately" it is unnecessary, because Xen will
> remember guest's intention, so qemu can simply use its own internal
> state and act on that (guest writes will go through qemu, so it should
> have up to date view from guest's point of view).
> 
> As for PBA access, it is read by qemu only to pass it to the guest. I'm
> not sure whether qemu should use hypercall to retrieve it, or maybe
> Xen should fixup value itself on the read path.

Forwarding the access to qemu just for qemu to use a hypercall to obtain
the value needed seems backwards to me. If we need new code in Xen, we
can as well handle the read directly I think, without involving qemu.

Jan

> I did some preliminary patch here:
> https://github.com/marmarek/qubes-vmm-xen-stubdom-linux/commit/80cf769f3659aa0d7f2b5598bf862d83da28807e
> 
> but it does not work yet. It seems I haven't undo MSI-X hiding enough
> (lspci inside the guest doesn't report MSI-X at all). This I will figure
> out, but I'd appreciate comments about how to handle PBA best.
> 


