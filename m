Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 94A0C31689F
	for <lists+xen-devel@lfdr.de>; Wed, 10 Feb 2021 15:03:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.83614.156021 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9q4y-0000o2-W8; Wed, 10 Feb 2021 14:02:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 83614.156021; Wed, 10 Feb 2021 14:02:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9q4y-0000nf-SC; Wed, 10 Feb 2021 14:02:52 +0000
Received: by outflank-mailman (input) for mailman id 83614;
 Wed, 10 Feb 2021 14:02:51 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=08uA=HM=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1l9q4x-0000na-74
 for xen-devel@lists.xenproject.org; Wed, 10 Feb 2021 14:02:51 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a613883b-5e9b-4a3d-88a1-5605cbd3e4a0;
 Wed, 10 Feb 2021 14:02:49 +0000 (UTC)
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
X-Inumbo-ID: a613883b-5e9b-4a3d-88a1-5605cbd3e4a0
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1612965769;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=LKxuVFzCwI30/ve4LOGavldIqq3W4dzJmAlCSiGbxiE=;
  b=LA0NF4x46FanwYi+d++6XnDnemhN02+ageRxy7vJ/DrhSBYyVLFi8zku
   5VM3BdyMhLXf8CMlrANLv8Rj3FXlNROVD5RnrL8GcAwlBjWP72tdkIdOi
   fXYH21EscsfwryNZ5VzZ8wzsaHPikdyUf5iXTmLqiEqwLGGmr0NTsl6jk
   Q=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 8dmyrFxXGNxlH/wNBL1bpBb/eLntvt9ttSoFrrEtx/RDOZpy969OA/VhcUdnw46Nkrso7lyDv2
 kGX2g+v9QkF033I1yUBoCT3dtTF5eJtl8m4ldu4GLQU8H58oqhjYfy/r4DcdXYXAQArDXJ5ZQI
 IgzcVM9pHFXn7WIfBV2B0F56yQbY3s0Y9Kpm+0j07s27uPz3knOyW/L9VUwYEgzCKibBZhuRw0
 w68HjvK1nCK9caZGtI5mv7U/btgJpLX0gxS0YFjQwF6hvieAXVRxanLBbVJtb8HdSI7MYIJgk2
 rjg=
X-SBRS: 5.2
X-MesageID: 36893409
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.81,168,1610427600"; 
   d="scan'208";a="36893409"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l4Ij01F3MSSL0Ae8LKMI8e6XWowYh/tIDGh66N2HhPR6PSpIkhMqWFiNa4hQDm2pMZqcosuI3oM5p4cwiekcBjTOE5sQikonVnhTHosTdem9GlxRf2u13+LaH+IqZHkngS26INGfueKC498S9NSBPBMrx2xZKD+gOz8EPgieTpNVSf+tSIXj6LY21i8acK8FT+SKY9TITa8z4TwkS+ux1JjpufRPzhSNSOWYjdu9D+V5kGgqfskZYd9IU7bfdtTezaieQ3kGYuO/GCjOrf6d9l2ILtgPb0Rkynu/y0K0xgDaYFbxoqa99zL2gYWDzOe+BCaxg2JP/aNT/GGpAd0VVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EFHZcH+jQ9Eve3do2WdbBwrkpQEDzESAD3lY3yYCHQs=;
 b=DXlO5xzweYvQQYo5ZeBfftU6SFwxRjKQhzZX/DTV/f4K2PPPOECbbwhJGSk9+S0+MHrODq6q6zXN8k1VH+62yssTyorJHfHJMHPcf2SaErazFxreeS994bj5PozZ107nl+mTgCjYEIOu0q+AM7e/2jBjQTOoP1fESiiTFKwQxNUinhyLvLmnb3x9egojv9SWLqiNnbU/H2IhpmrQfFDW0i5aEbLANwILDJ8UtucsrYai1AypJcj9drww4Qf5QVa1XUEPD3OLnrcCeRcqsFM6vDmgPqO02HtESbeyN/EbzaYuQbRkPGFIowrWMFRhAmB5BptvvT9ovO9bNSi0TxnyZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EFHZcH+jQ9Eve3do2WdbBwrkpQEDzESAD3lY3yYCHQs=;
 b=U/nVNsULgjVM/fJyZoPG6O7I9m80xPsp6Azt214t9ecW93srHD2cU+66WKfngSk0Qogz5e/hfbiiVlDlnspVjylqiOWLSBcZnQI6YL3nO1U7l/2IJSbazN8itEn9VA9/qopYfU0LW16yGFjWFTHW10A2+XWXvwaLXRdnBiDqIGw=
Subject: Re: [PATCH] x86emul: fix SYSENTER/SYSCALL switching into 64-bit mode
To: Jan Beulich <jbeulich@suse.com>
CC: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
	<roger.pau@citrix.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
References: <7ce15e4b-8bf1-0cfd-ca9e-5f6eba12cac1@suse.com>
 <d66cce4b-6563-4857-30be-5889788ca6c8@citrix.com>
 <2eed5630-3e23-3005-245e-989893fc8476@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <bf31a01e-4a32-5938-c158-38923100355d@citrix.com>
Date: Wed, 10 Feb 2021 14:02:39 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
In-Reply-To: <2eed5630-3e23-3005-245e-989893fc8476@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0112.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:192::9) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7071a748-b69b-4362-b67c-08d8cdcc8a0c
X-MS-TrafficTypeDiagnostic: BY5PR03MB4966:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BY5PR03MB49666395C0892181EFBBD388BA8D9@BY5PR03MB4966.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: t/LivcIiVwBFD9pYswYiI9ZJrD4BHKN8HR3rf23ws6dAVqNebO4pIQqRusI1aC4IA9Nxqu0KdEyhRboroKEbdpSqIyYWR5lTURqqkvqt3/EPnpp2RbkuE+bmg1ilNptyy77OaQWj/LMhRrYayGpKE3t8MbC6NNrNnK6+l3352efqinIuS1VTtvBp55IRlrz/do5fXs1+m/wFXzoOt/oNw+a9Y3MaY5pAOJEWl/O0YkmfGQez6hYdxnokqh7T3ZY9HsH8iAW15TvoW46YJpzNEsTrgTLufYKdwpmm3lR9UEN4A+u43LugnjpgruT0ZvTXXonHm6nFMqyyAA0sbxxqFZOHK4Nt1eBiMSwAkHvMgW8wUuruQffS3uQsGC1oWiU6Mz555Pn7mhZowddrNqelcq6v5aovD/krbRWRrzH73fB0n1nF5Ov0NqloGyn1ozxfTVWj5m8fHsLgct3kcxc44UNAwyjfMmQXTwFFpzfytUrigBKha/zsm7uoyiw4xo/U6d9f6xu/1dei1sLpH3Gn6kFxOs9Lw2qQS1GHK6SSx6KrlbNvXQtDYh+UHZzJn/utG+RsYAV7GDEl/URa9Cb7Wsca/N6sbL/0aVWMDqW0FuY=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(396003)(366004)(346002)(136003)(376002)(86362001)(36756003)(31686004)(478600001)(66476007)(66556008)(66946007)(83380400001)(31696002)(956004)(2616005)(53546011)(8936002)(16526019)(186003)(8676002)(26005)(16576012)(316002)(2906002)(5660300002)(6916009)(4326008)(6666004)(6486002)(54906003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?Y0FQWmExS0R3VWlyWEpXR2xTeEphY2NXdDBNclBDU3kxS09RcG1Zbms5VzRq?=
 =?utf-8?B?TW11RHA3Zmx0VFJXdkJIaVdEaVVRLzV4VmxnWk1XaUlsekxCeFArcGQvTHhY?=
 =?utf-8?B?UDJxNjZlbmRPd3FQRzRSOWE5dmlmNC9MUG1sd2NlcUtuQ3Yxbit4VlFoTU1Q?=
 =?utf-8?B?U3l3aWtNTUx6OHNaWHM3VnU4WnIva09kcU5EYXYrYi84YmNTUDMxSFhuSk5B?=
 =?utf-8?B?QitCTTBsVFlWWHh1cW9DSXdWcGNqcFVxd0tGTkhRRnBxTkV0Q1UvaEY1RlFu?=
 =?utf-8?B?ck1qUGZPWHFoLzNTR3ozd1ZDU09pQnRLMFRZUkNOSmNidmIvT0hzTmZiMEJi?=
 =?utf-8?B?RFdEczd3SmQ3K05KRklUZHlHUy9CMGs1V21CMFdOZXZSeDB0U1QwajlBeklX?=
 =?utf-8?B?dWE5ZWJJS0NJM2x4ODh1dDdnUElYRkNqWENtdmpDMmRhbW5JczR2aFFPVVdk?=
 =?utf-8?B?dEVaejNac1Zrbno2WTZHVE42MlcxWFBHK2dCVC9wNDhiZE1HTmVtdDNSMjJM?=
 =?utf-8?B?b0Joc2NJclg3YnQ5MEU2WEZwUHcxOXVzd1N2ZGY0Z0xPd25XOFg5eWV3Uml5?=
 =?utf-8?B?d3VCZFlnVU5yb2ExN2huUGJtZ1NhbEh2ZFVrakJUMDM4bDBUdFcyV0o0K3F6?=
 =?utf-8?B?c1VONHltM2xua2JuelFGamRwZ2ljdmQrKzJRSFVabzZCUUwyQWdXZE5LQXFX?=
 =?utf-8?B?R3gzenVZRzNjVi9VWHhIZkg4VzM0L2d4Qkdwb3BxUEJLbW1jTFJMUEdGU1J0?=
 =?utf-8?B?dllUUEZUUGFqanF3RTNibFQreHlqMzZMWWJvc0J5WWRKZE42SUozNGtraElF?=
 =?utf-8?B?c2gyMEVKakZwZVY2YVV6L1hueGFYSWtWRW1pcVR1RUZWNURPVlArREkyOE02?=
 =?utf-8?B?MldCNkZNK3ZLK0xWOUl4eUpUblhwSlVEa0RlSzA0Tnh6TUZaTTlPaWFwTmtu?=
 =?utf-8?B?QmZjSU5PZ3lzb0dGZEpERlB6R0lBSEdkZ2hLMXNBZ0FYSXZwWWs1cy9WQlFz?=
 =?utf-8?B?VmJ3c3ZNSGd6dnFFalB4ZHRubExqYWx1SS9WNTZJbWdmNUhPQzBBMEZIUWVh?=
 =?utf-8?B?ZTduazBFZUF6VUFDcVRrU1psYVB5QzluZUJoaSt2NmhBeEY4bDc0OEdFZFNC?=
 =?utf-8?B?a1NGN2RzNHVnVTR1R3RnbmF3K05rMkNIVTZ1SVNiUUo2NzdqdEU4MWU2NWh0?=
 =?utf-8?B?aTJVUm1ld3h5UVBoNWJ6QzZQSFBUd3NkYXlPZGdGZWdRbjh3eFQ2RTlZNlJv?=
 =?utf-8?B?cmFZbnppOWR3T0V3OWM5UmV5RlVkUkk1SXVQWXNZTHdFN3Noa1JNR3hySGNM?=
 =?utf-8?B?VEx5aVUyUlZYSXNRblFYTHhkOXlkMHVFWG43L0lUZHNmSmV1dVovWWJra0tG?=
 =?utf-8?B?Z1ZJa1puY3VaNnNtRkVKWUtwWUhvZlJBQTBtUHpUV3o1TmQzSHVZN1FId2Zz?=
 =?utf-8?B?bGMrZjFTeTdra0gzNXFuQjVMdlArSm5LZHZkWkJyR25zcXFmR0Q2RWZMRmp2?=
 =?utf-8?B?T29HeE5HYnJvODNiREN5RWU5OGFFN2ZMakVjWmtFQWoxSGRPTTVRRkM4QkM0?=
 =?utf-8?B?VnZXQXVaZ0NxSXhmdEowNDhYSlJEYXo2ZWR2a1RHMmpRQSt1WTdsS2xHM2ZW?=
 =?utf-8?B?SkFuNXgvUUJ6TXRZUjNTcThmQkpSNXc2cU5rc0JvOGVXYUV3VjJSMjRSQklP?=
 =?utf-8?B?cjhsdjIvSXZHM1l1eCt1SHRwTlN1UG5VS1dTSnpJQ2tKOXROcElpczNxUHlo?=
 =?utf-8?Q?tdbNo6YqEQrKgwkJhnZBdtTIRwO6GRnO11nw5mK?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7071a748-b69b-4362-b67c-08d8cdcc8a0c
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2021 14:02:44.7315
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LzkkckhfscUa/E61gDr1POvZDAe7YeD/3CkvM9uRc5KkaOpwdqRzDZLjkkfgk+3otSOr7Gw08IbILLoKFxKXgjvMuCz6uXsKI6YmeBbYSJg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB4966
X-OriginatorOrg: citrix.com

On 10/02/2021 13:54, Jan Beulich wrote:
> On 10.02.2021 13:28, Andrew Cooper wrote:
>> On 10/02/2021 09:57, Jan Beulich wrote:
>>> When invoked by compat mode, mode_64bit() will be false at the start of
>>> emulation. The logic after complete_insn, however, needs to consider the
>>> mode switched into, in particular to avoid truncating RIP.
>>>
>>> Inspired by / paralleling and extending Linux commit 943dea8af21b ("KVM:
>>> x86: Update emulator context mode if SYSENTER xfers to 64-bit mode").
>>>
>>> While there, tighten a related assertion in x86_emulate_wrapper() - we
>>> want to be sure to not switch into an impossible mode when the code gets
>>> built for 32-bit only (as is possible for the test harness).
>>>
>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>> ---
>>> In principle we could drop SYSENTER's ctxt->lma dependency when setting
>>> _regs.r(ip). I wasn't certain whether leaving it as is serves as kind of
>>> documentation ...
>>>
>>> --- a/xen/arch/x86/x86_emulate/x86_emulate.c
>>> +++ b/xen/arch/x86/x86_emulate/x86_emulate.c
>>> @@ -6127,6 +6127,10 @@ x86_emulate(
>>>               (rc = ops->write_segment(x86_seg_ss, &sreg, ctxt)) )
>>>              goto done;
>>>  
>>> +        if ( ctxt->lma )
>>> +            /* In particular mode_64bit() needs to return true from here on. */
>>> +            ctxt->addr_size = ctxt->sp_size = 64;
>> I think this is fine as presented, but don't we want the logical
>> opposite for SYSRET/SYSEXIT ?
>>
>> We truncate rip suitably already,
> This is why I left them alone, i.e. ...
>
>> but don't know what other checks may appear in the future.
> ... I thought we would deal with this if and when such checks
> would appear.

Ok.  Reviewed-by: Andrew Cooper <andrew.cooper3@citirix.com>

> Just like considered in the post-description
> remark, we could drop the conditional part from sysexit's
> setting of _regs.r(ip), and _then_ we would indeed need a
> respective change there, for the truncation to happen at
> complete_insn:.

I think it would look odd changing just rip and not rsp truncation.

~Andrew

