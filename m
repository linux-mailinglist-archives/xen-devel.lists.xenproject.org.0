Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B16CC30A401
	for <lists+xen-devel@lfdr.de>; Mon,  1 Feb 2021 10:07:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.79623.144971 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6VAR-0003L0-Ho; Mon, 01 Feb 2021 09:06:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 79623.144971; Mon, 01 Feb 2021 09:06:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6VAR-0003Kb-Ed; Mon, 01 Feb 2021 09:06:43 +0000
Received: by outflank-mailman (input) for mailman id 79623;
 Mon, 01 Feb 2021 09:06:41 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IWGu=HD=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1l6VAP-0003KW-9O
 for xen-devel@lists.xenproject.org; Mon, 01 Feb 2021 09:06:41 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0064ddd0-f13f-4694-ac5c-a9df2de8c614;
 Mon, 01 Feb 2021 09:06:40 +0000 (UTC)
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
X-Inumbo-ID: 0064ddd0-f13f-4694-ac5c-a9df2de8c614
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1612170400;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=xkVJHZ3Z0cnda2Ifz1g5Y9SdJvPoShYXfdWDTCZ5Rp0=;
  b=E2ASW/ORZomc3vK0VHu+Nzh1ZB2q1bOB8kcFigRfZVyrwhSf3lf4+DZo
   t/sRc8PFuefW08o/B4x/Uh7Spx/lcBFxPTSIPXGYFepNkbN9DDPg2zipz
   XqTV4m0n6WTLNVnUuzFDwCqeDbDfBBTll9zV0RYa0o/BTcdHvxu8juMhR
   4=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: JjPmpUc7y4gJ0wMtEgJPJ0GIFydIeGEz0FCYCLC6dC+AU3tVXUpT5vytp9AtktnrwOOBcjdqXc
 tzf/d4AQIgDT94+IN1dgzYM66yC6BE5l2iXYlLawhi7Fb74uyKe9r3f9w4Tt4KD3oOrKjqcvGY
 E5hXB7oa2G0nVDaSE5My5h/eDDXDFZFNY4uRIv4nM9a0SdJQ3PqKuAnu/HNOjUWtSnE3dTsuJ5
 xqVP2X6g05zLcHf7v8oEzufNF3TV6IGdLtj7A8JKC+KMGNsGlh+fyNsqhwt1T9nr7FFw1KIrwC
 X7c=
X-SBRS: 5.2
X-MesageID: 36216196
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,392,1602561600"; 
   d="scan'208";a="36216196"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Dmzl8EpwcX3pejtzrAT37HnC+Nf4gCblUATKhO1k/nwmYfKhFeoimjQeGqPOEMY9gt+NLcBLmBqSTU2PUCqXuWU06Pqr7vBip5T9yVIa0jgYYBATkXUlc5g8gdSb3ayyKHbdteGhMD95hDwVKbNnZtCeGmhWSQGm04zLKKvAa2Ltlu3whg6Y1fZS3sM2GVKQDDxXZ/WnGDdgPWmP904E9gBeVvOD3xrhBid/be+qWc8hViQbrHfueCRVrw639fpASSUJYO5x1rpSrHTkFWe/S7SlO9bPScaSUWmFUd4BQt8jVcxUQDp+TkdGJ+D307pIqn4y8lOm1pwNDid+GaSLtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sGjRN6tz/BfhPmsSH+7Nomnz4zgbH460+p/U5a3VJfI=;
 b=jOTki7pAZSX5ygC2u9r2lRuJaAMei47ysH25VgAP4W2r7diGGhAs64ouUB9nYipJcrcl3/rC9SMOp6MJOl/ne0gqrLVJlRXtk3y2RweKaVyDkm4LgeU0Z/OB6TdHub8pJN5DcJQUY6YYaVsnBa0kW9W2nBlB+rSDi2t9WGWhyRbX5ogaz5KrAD/jHC9Iu9yk8AyTa/cHMQ+QytbUJtgOLun0PeOM4LyCIKiex36mUEx9LgjauC7lLeCuhm8rtVYkZC9TfGuEhlKk9TIJrg1jvT7YonP4l5XDhlZfg6gz5gqtb4TqCGVJNYTY6sIQrKiqMJuXa+v5Pe/vmUOXWUAyIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sGjRN6tz/BfhPmsSH+7Nomnz4zgbH460+p/U5a3VJfI=;
 b=QC6juAVyI92HMZT41G7a4UCL5q9hg3j8pEokpVTfUkEROO7oFOfC1Hd+92y6xtYW2qGsjJYW4V5A5W1T9wJ5nKNGZokMNhVf0NG1NCcjpxoPd+n6F+IfrTaSJCdMkP/4GfPbmX6I8RXZX1/XYUD3VGzAE09tZnO5aEcadMqqsJA=
Subject: Re: [PATCH v7 10/10] x86/vm_event: Carry Processor Trace buffer
 offset in vm_event
To: Jan Beulich <jbeulich@suse.com>, Tamas K Lengyel <tamas@tklengyel.com>
CC: Tamas K Lengyel <tamas.lengyel@intel.com>,
	=?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian
	<kevin.tian@intel.com>, =?UTF-8?Q?Micha=c5=82_Leszczy=c5=84ski?=
	<michal.leszczynski@cert.pl>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20210121212718.2441-1-andrew.cooper3@citrix.com>
 <20210121212718.2441-11-andrew.cooper3@citrix.com>
 <c00b60c5-ba4a-7473-cf26-60b46681279a@suse.com>
 <0a34175c-9bc1-9449-413b-01d743d201fc@citrix.com>
 <CABfawhk4eYA85pgSc6xKbHexBQpJKzAv-KvS_X6X9-eAAqXe4A@mail.gmail.com>
 <95f07ddb-7fe8-c6fb-dbc4-9743f82a1d89@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <39fe9d84-05c9-955d-4938-ab4b30e0ccfb@citrix.com>
Date: Mon, 1 Feb 2021 09:06:27 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
In-Reply-To: <95f07ddb-7fe8-c6fb-dbc4-9743f82a1d89@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0435.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a9::8) To BYAPR03MB4728.namprd03.prod.outlook.com
 (2603:10b6:a03:13a::24)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 133e5b7a-7eef-401c-ca2f-08d8c690ac58
X-MS-TrafficTypeDiagnostic: SJ0PR03MB5646:
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SJ0PR03MB56468C1611E259195A4EAAA7BAB69@SJ0PR03MB5646.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Bi9ptCoKhwTil3gQtMeujo23APygMhTMyDw5bYCEX7B6RHgsr6qgwyD+ifSSH0s3Z57iJnEp+tH5pymiEf1O9+hcatEW7JRfm736BrJhn5Yk7Xu/W26jkbBbWa1wIEFY1oHpb0VWvJZ2LyzQzvrr8VgjFnUR15zXqP3TAB/jO+mO3VAPfUGMrjxZeY3yijUAIkL7/6HBkRpkncj3TLjEKnQerpXmvxu0jg7cUW+4rVGL6cfWGHAOknTQX33fNw/1PWdZkAqE1AMnm+rNp8ib8OUQv46EwF/3NPiqfcNXzwR642K5FSS3pNSgR5pHHfwukaKliB4+3WHK+NTF2LyQGY+w44lriLQDHfMTAdmBYdBtDq8x8jgVyxnJ4DYtnvcORGwxuVxkLiM3iPMQFFApTrsTYUgdZuPnA3pYH7XTybQnfxvCNVlRP5+mTuJnU21RC+AMfRvjW17+FRbB945JjuKPX0ihzdzfeb6MzqtQyXuzCpEhhzq5X/jG2NqR2zf9F1OMjtLgxT3anBSIqlAkz9vLD+OUTR/FcbvY7DkMk+m5qugeedm02+G/oGX2SBMhYQD0JSr16DYRSyFc0XR9pzdEtf4C9JKjWLUdR9Y5fd8=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB4728.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(136003)(346002)(366004)(396003)(376002)(956004)(2616005)(5660300002)(6486002)(31696002)(86362001)(31686004)(4326008)(478600001)(6666004)(16526019)(8676002)(54906003)(186003)(53546011)(26005)(36756003)(66476007)(66556008)(66946007)(83380400001)(8936002)(2906002)(16576012)(316002)(110136005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?dzRkUnhRckZlRnlqaG1BbWZCdHZxYW43UmhHRkdqbUdZUW9ZRXlIYStzY0xo?=
 =?utf-8?B?OHVOZitqVElZd1NWdTY2dkRvTm9JOXp6ZHZEcXI3dXM1RllxVFBlSGRRdWwy?=
 =?utf-8?B?Q3lMRGVoOS9jU3YzemZYZmc1eTVqZnpOc1MzUXdXc3NsZGFleDZmeGVkajE3?=
 =?utf-8?B?bHZXV2x1ZW1HR1hlVW5heGVEWWNpM04zazNjTitCZDN1VXBrbXo5Z0hXQ3kw?=
 =?utf-8?B?ZFUwcXBuUVdkQWtBcjU3WStOeU4vLy9tMVFzVmRIbzE3TXdjNnkrREdJYmg1?=
 =?utf-8?B?MTkxNDBjK1VIRVhCNXViS2wrbkcvNW1LMGVPYmNaK1BhalpWbTNxek94aVBL?=
 =?utf-8?B?enI3TCtRaDA1ZzVYS2gyWUp0K015MUJnRDRJNHAxbWNEa0RFVm5wOXpyOUoy?=
 =?utf-8?B?cDFnTzcxTGppN2hjd05PS3ZGOW9qVUx1NGZkTDQ4OTk2MExrQmNBdXBTdU01?=
 =?utf-8?B?TzdRTlhIYktSOVRoVm5YWXFqb29VYW5wMnpaVmxad1EyMWVjRkpnTGdMU2hD?=
 =?utf-8?B?Tm13MVhrTzRmU2dCWjNFek5XMjlHYXc4cXB4Vk9nMUtTQjBGOVQ3dzN5SENp?=
 =?utf-8?B?ZmgxUGpPRjFWV0tZYjM0K01CZm5SdjBCeDBsVjRsQjg5ZktKdUIrbC9DYi96?=
 =?utf-8?B?UlJYTWlaRE1qbmNGU3VhODZUMjF1UmxKbnZiMkwrS2xUYVh5RUs5bCtMWFJN?=
 =?utf-8?B?T3dTTWVFOWltRHJ1TGdSdjlaT2Npbit1U1lkZEVLNDRzR1FyZHJIUExrWFIx?=
 =?utf-8?B?V1h3TnNHcmc1NVRFZnVPRmFueWpVaEpOTkQ0bGlseElPQ0Y5UDJPZm9DYzRI?=
 =?utf-8?B?ZWRxWlQ4TEVJbi8ySm0xZXJPdWtRZlJlV3BhQ2lBTW9KcGcvazY5bVJ0dEhZ?=
 =?utf-8?B?Mll5RUtaQ0d4WElET3pmVWFHdUJtQ0p0U3pFbjVCaWgrZkFObnlIdjRraWdz?=
 =?utf-8?B?cnNldXlpRnN6MGpwc3RhNGgycGdHQ2JCT21DNlJ1NG4wZWZUZFNWRXNBemNj?=
 =?utf-8?B?RkoxVzJhbGRkd0hVWkg2d0E0NzlseGJlZXU5RlhuMlM5OWdCdlBObzFXYUcr?=
 =?utf-8?B?aGdUc2tZWUZWRmgyY1JjWEpEdUppSVFlTEhEVnBIZldWS0cyQ0hhalp2NkxX?=
 =?utf-8?B?U1VNR3h0cVZYVnJoZk9NVVlib1duMHF3VGwzT01VKy93d1hpaFFkR3BNdXlo?=
 =?utf-8?B?eFBJVE8yREtmZy96M0ROeWE4Ni9YTnljTnh0OVNNWkNoMWVkTmYvZW10STAv?=
 =?utf-8?B?bktJWFBUWTNPZEVOZGxPK1BvNDRFSW9pdUJuaVVrdHgvNjdSMVdyZ0VKVC9h?=
 =?utf-8?B?SWdhTDZkTWZNNVVhRmNYOFFwK2lBN2cxQ2thVnVMc3IyNUk2bVFpeXBTQ0h1?=
 =?utf-8?B?bTNla1RHNmlEQ2xuZUhZSnJoZk0yRXRZZVhlQnVvV2hqcnhsT3RIV1prd3hz?=
 =?utf-8?Q?MhKKQzgo?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 133e5b7a-7eef-401c-ca2f-08d8c690ac58
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB4728.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Feb 2021 09:06:34.3694
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9nAQSyjgKWoc/cD8lGPY98muB00eOfPIreY32vfeICkpeRqu37HCvcD68B2lTSvUvniffVNeWgerkfOs08795uyRfA5CtH5LFyIlnilRHUc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5646
X-OriginatorOrg: citrix.com

On 01/02/2021 08:55, Jan Beulich wrote:
> On 30.01.2021 00:40, Tamas K Lengyel wrote:
>> On Fri, Jan 29, 2021 at 6:22 PM Andrew Cooper <andrew.cooper3@citrix.com> wrote:
>>> On 26/01/2021 14:27, Jan Beulich wrote:
>>>> On 21.01.2021 22:27, Andrew Cooper wrote:
>>>>> --- a/xen/arch/x86/vm_event.c
>>>>> +++ b/xen/arch/x86/vm_event.c
>>>>> @@ -251,6 +251,9 @@ void vm_event_fill_regs(vm_event_request_t *req)
>>>>>
>>>>>      req->data.regs.x86.shadow_gs = ctxt.shadow_gs;
>>>>>      req->data.regs.x86.dr6 = ctxt.dr6;
>>>>> +
>>>>> +    if ( hvm_vmtrace_output_position(curr, &req->data.regs.x86.pt_offset) != 1 )
>>>>> +        req->data.regs.x86.pt_offset = ~0;
>>>> Ah. (Regarding my earlier question about this returning -errno or
>>>> boolean).
>>>>
>>>>> --- a/xen/include/public/vm_event.h
>>>>> +++ b/xen/include/public/vm_event.h
>>>>> @@ -223,6 +223,12 @@ struct vm_event_regs_x86 {
>>>>>       */
>>>>>      uint64_t npt_base;
>>>>>
>>>>> +    /*
>>>>> +     * Current offset in the Processor Trace buffer. For Intel Processor Trace
>>>>> +     * this is MSR_RTIT_OUTPUT_MASK. Set to ~0 if no Processor Trace is active.
>>>>> +     */
>>>>> +    uint64_t pt_offset;
>>>> According to vmtrace_output_position() the value is only one half
>>>> of what the named MSR contains. Perhaps "... this is from MSR_..."?
>>>> Not sure whether, despite this, there still is a reason to have
>>>> this 64-bit wide.
>>> This is a vestigial remnant which escaped the "use vmtrace uniformly" work.
>>>
>>> It should match the domctl_vmtrace_output_position() format, so each
>>> interface gives the same content for the attempted-platform-neutral version.
>> From the vm_event ABI perspective it's simpler to have a 64-bit value
>> here even if the max value it may possibly carry is never going to use
>> the whole 64-bit width. I rather not play with shortening it just to
>> add padding somewhere else.
>>
>> As for what it's called is not that important from my perspective,
>> vmtrace_pos or something like that for example is fine by me.
> The important thing to me is that the comment not be misleading.
> Whether that's arranged for by adjusting the comment of the
> commented declaration is up to what you deem better, i.e. I
> understand the comment it is.

Please see v8.  I rewrote the comment.

~Andrew

