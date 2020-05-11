Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B5FE91CE300
	for <lists+xen-devel@lfdr.de>; Mon, 11 May 2020 20:48:51 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jYDTN-00081v-4F; Mon, 11 May 2020 18:48:17 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MQL3=6Z=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jYDTL-000815-Mm
 for xen-devel@lists.xenproject.org; Mon, 11 May 2020 18:48:15 +0000
X-Inumbo-ID: f8055200-93b7-11ea-9887-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f8055200-93b7-11ea-9887-bc764e2007e4;
 Mon, 11 May 2020 18:48:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1589222894;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=MYaZwDsAVkRp8lvSQHR65VKbP/HlTMO1e62r3ITEeXI=;
 b=Sd36zreFrh2yVwGCgH3dOZji5FcJ9CstDoXEeymrwQ20K5jtYyMcq1+4
 VnrRkLA1E/m/qU/1g7KZeJ/TtPNUyBdlRb43j7fAs3uZ95lqr6WjyUrTb
 I4DSSIc5mJqr8qKzYugpi5hykNBep7al0lutX1nEDbdamwwp0zZ2vCcER A=;
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com;
 dmarc=pass (p=none dis=none) d=citrix.com
IronPort-SDR: 7g4L4vCvNt84P54kGjwLw/IMQV/puJ/qU5RaJX/vjuvrhGyAA+0H94JNedWFKPVyx99kV3gOmx
 gmdkH3cowYxCXOERf0cv4JgQ+q/FiP4ZEu7pQMrvHl5jCkriPaW3oYJoYGo5sh7U2uxX+4aO+s
 Vly6v9TpMqBVlulXprHry9gG6o8QL8eSyRl9MpmWQjYcOhRxcQIDKTexmoAJ+abJApXBVIMfPV
 VfbquG26Vz+7/CjPfoW88OzAce+REAlw6TA+WN+VDiUna3J1ETzwfHIf/5qRnSkZDpwEhx42bw
 yyk=
X-SBRS: 2.7
X-MesageID: 17619118
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,381,1583211600"; d="scan'208";a="17619118"
Subject: Re: [PATCH 09/16] x86/cpu: Adjust enable_nmis() to be shadow stack
 compatible
To: Jan Beulich <jbeulich@suse.com>
References: <20200501225838.9866-1-andrew.cooper3@citrix.com>
 <20200501225838.9866-10-andrew.cooper3@citrix.com>
 <478340f1-4238-1419-eeb7-c8c2ed7103a6@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <544840f1-9c8a-ec97-44f3-5ec263b8428f@citrix.com>
Date: Mon, 11 May 2020 19:48:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <478340f1-4238-1419-eeb7-c8c2ed7103a6@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 05/05/2020 15:48, Jan Beulich wrote:
> [CAUTION - EXTERNAL EMAIL] DO NOT reply, click links, or open attachments unless you have verified the sender and know the content is safe.
>
> On 02.05.2020 00:58, Andrew Cooper wrote:
>> When executing an IRET-to-self, the shadow stack must agree with the regular
>> stack.  We can't manipulate SSP directly, so have to fake a shadow IRET frame
>> by executing 3 CALLs, then editing the result to look correct.
>>
>> This is not a fastpath, is called on the BSP long before CET can be set up,
>> and may be called on the crash path after CET is disabled.  Use the fact that
>> INCSSP is allocated from the hint nop space to construct a test for CET being
>> active which is safe on all processors.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> albeit with a question which may make a further change necessary:
>
>> --- a/xen/include/asm-x86/processor.h
>> +++ b/xen/include/asm-x86/processor.h
>> @@ -544,17 +544,40 @@ static inline void enable_nmis(void)
>>  {
>>      unsigned long tmp;
>>  
>> -    asm volatile ( "mov %%rsp, %[tmp]     \n\t"
>> -                   "push %[ss]            \n\t"
>> -                   "push %[tmp]           \n\t"
>> -                   "pushf                 \n\t"
>> -                   "push %[cs]            \n\t"
>> -                   "lea 1f(%%rip), %[tmp] \n\t"
>> -                   "push %[tmp]           \n\t"
>> -                   "iretq; 1:             \n\t"
>> -                   : [tmp] "=&r" (tmp)
>> +    asm volatile ( "mov     %%rsp, %[rsp]        \n\t"
>> +                   "lea    .Ldone(%%rip), %[rip] \n\t"
>> +#ifdef CONFIG_XEN_SHSTK
>> +                   /* Check for CET-SS being active. */
>> +                   "mov    $1, %k[ssp]           \n\t"
>> +                   "rdsspq %[ssp]                \n\t"
>> +                   "cmp    $1, %k[ssp]           \n\t"
>> +                   "je     .Lshstk_done          \n\t"
>> +
>> +                   /* Push 3 words on the shadow stack */
>> +                   ".rept 3                      \n\t"
>> +                   "call 1f; nop; 1:             \n\t"
>> +                   ".endr                        \n\t"
>> +
>> +                   /* Fixup to be an IRET shadow stack frame */
>> +                   "wrssq  %q[cs], -1*8(%[ssp])  \n\t"
>> +                   "wrssq  %[rip], -2*8(%[ssp])  \n\t"
>> +                   "wrssq  %[ssp], -3*8(%[ssp])  \n\t"
>> +
>> +                   ".Lshstk_done:"
>> +#endif
>> +                   /* Write an IRET regular frame */
>> +                   "push   %[ss]                 \n\t"
>> +                   "push   %[rsp]                \n\t"
>> +                   "pushf                        \n\t"
>> +                   "push   %q[cs]                \n\t"
>> +                   "push   %[rip]                \n\t"
>> +                   "iretq                        \n\t"
>> +                   ".Ldone:                      \n\t"
>> +                   : [rip] "=&r" (tmp),
>> +                     [rsp] "=&r" (tmp),
>> +                     [ssp] "=&r" (tmp)
> Even after an hour of reading and searching through the gcc docs
> I can't convince myself that this utilizes defined behavior. We
> do tie multiple outputs to the same C variable elsewhere, yes,
> but only in cases where we don't really care about the register,
> or where the register is a fixed one anyway. What I can't find
> is a clear statement that gcc wouldn't ever, now or in the
> future, use the same register for all three outputs. I think one
> can deduce this in certain ways, and experimentation also seems
> to confirm it, but still.

I don't see how different local variable will make any difference.  The
variables themselves will be dropped for being write-only before
register scheduling happens.

GCC and Clang reliably use the callee preserved registers first, then
start spilling caller preserved registers, and finally refuse to
assemble as soon as we hit 16 registers of this form, citing impossible
constraints (GCC) or too many registers (Clang).

The important point is that they are listed as separate outputs, so
cannot share register allocations.  If this were to be violated, loads
of code would malfunction.

~Andrew

