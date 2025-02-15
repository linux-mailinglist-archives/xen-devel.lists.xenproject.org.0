Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DABAA36CB6
	for <lists+xen-devel@lfdr.de>; Sat, 15 Feb 2025 10:00:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.889348.1298482 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tjE0x-0005gH-T3; Sat, 15 Feb 2025 08:59:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 889348.1298482; Sat, 15 Feb 2025 08:59:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tjE0x-0005dk-Q0; Sat, 15 Feb 2025 08:59:07 +0000
Received: by outflank-mailman (input) for mailman id 889348;
 Sat, 15 Feb 2025 08:59:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OVx6=VG=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1tjE0v-0005de-Kl
 for xen-devel@lists.xenproject.org; Sat, 15 Feb 2025 08:59:06 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1b0cf065-eb7b-11ef-9aa4-95dc52dad729;
 Sat, 15 Feb 2025 09:59:04 +0100 (CET)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id 39ABA4EF0511;
 Sat, 15 Feb 2025 09:59:03 +0100 (CET)
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
X-Inumbo-ID: 1b0cf065-eb7b-11ef-9aa4-95dc52dad729
Authentication-Results: bugseng.com; arc=none smtp.remote-ip=162.55.131.47
ARC-Seal: i=1; d=bugseng.com; s=openarc; a=rsa-sha256; cv=none; t=1739609943;
	b=Y0i6CLCunPXEOwEW+Trs0zDsLnUH90Hml09Vye0P6yh0fLViPtqq1in5HkCCZPIzErzb
	 55ZNz0X3TU0q7zs8vw2/okxTI3aozt+0x62FM3ZsHxweY4LReDwCIwSaIQbETZmhp8tq+
	 5eZF9Yio8yoXPwmPiR4rkmU5XZyDeOuMKcOz4PfUaHGDjTSN8AdIzo2C17vHWo7HsHLDQ
	 FrsaGrreBFXOOHMk26BCep/CMIn2LrTP3Hgz+GMeEsdTiAH+AQKvzkBvqrZ9VlWrM3Fvb
	 zfg7ovzgVZQcc18PSb0OvhVyNFNJuc5S6r9OH1O/kdwZCWltza4OrozezVor+n2fmPlbA
	 jNpSLQCgPub6DS4KiPwv1kpBJIdnMiOdnKqf/W5piH7C8lEbh8EYXFC6qC4g2I3oIN0pe
	 H4SqM2BDONO93iALACtlw+Jna0s03YSPkF5j+LfinhLNAyXiKw/dGxWs1LTuYr/4tmmEf
	 TrSu32NzBMw7H1TJn3mzScuFUzpBvBvue5v/TD9/OH6m1jUhJDFfQ7CoEy4Z7behMf1iB
	 oacUT8Ub+m/U8erGHYWCmCBXBcFHq6ojmZCDAqCqeo+HC5q+5s9MzKCvShIddfaYvwEV/
	 Cp3ynCcsf+HyQPCB7nEUav+BFU0ys/8X+JZifgmfirYhGR60PkM5nbrohpxvQ4I=
ARC-Message-Signature: i=1; d=bugseng.com; s=openarc; a=rsa-sha256;
	c=relaxed/relaxed; t=1739609943;
	h=DKIM-Signature:MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:
	 References:Message-ID:X-Sender:Organization:Content-Type:
	 Content-Transfer-Encoding;
	bh=lkY8kyDQzyQeMpy3rpBkmNJE+hjbxpHlAu41cDMfb68=;
	b=LW+wRkWVV6Eg7GImfRHP0EVNhIZ0Et/7r2HfEfiG8OIf84ZDydraulW9ReKQNIZCP7El
	 RJYW2qoRN0Kn4030oIkbSwQMHNaRwwG5i6K26+I9mnEZX2cjVgL/mGofz6yRPmqOlzUM+
	 jwwf5FdAn/n84FuSrKILEjJBksY270uxhZ0k7/fxAJKOKPWaIIeBnLIFhZdKoqYzuRpmf
	 yXeowjDxspP8GKU8KmKFt/bX8tCE50b9PnAKPf+aq/HE0PkEr2p5Q0/rpfuhwtGOUX8mg
	 dI8uefEIjK0Bh7GGY0wdp7n62wLRFDhSnR8Hmq8FAYEMer0kncm3shtTLC+lQOgsiLBQB
	 4+9cP/t0pWGhang1aHbtLyE5I5JFE8OlbIfTMh8NC7xNDfBowT+H1iFZgcORzrlZKIeC3
	 iGR7ea92O/j0lEVpANIrBhNitYO+UGMb+xetrx5bBRFQhfmsTSQLHT3hLThvmJ9Lr/oW1
	 hfa51RC40DKDtVr3IU/GExanWnK3A6ATDjdT9EYFyXzcKt+k664aJkY/kzaftw12Fi8br
	 p/S6sZ3OlPBo19jzCJk2+NiXUYQTBhc7K4mU72ehdia+OYdzOE23a5387aILm0MEvpJ2h
	 Zjwy1H9oJ62H10qcxzugdEPslELx7FnhdavudvtWP53OUI8OKpwuG5LUdECrads=
ARC-Authentication-Results: i=1; bugseng.com; arc=none smtp.remote-ip=162.55.131.47
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bugseng.com; s=mail;
	t=1739609943; bh=EWh2Jryoc9x+VmGlD/tbLie2J78UmMmSh/rBe6VTJsk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=K3/5ZYQsnKd+aTTLMKANcE4xDnijSaMF7uHOj9MyrFPWXabyfNOuzaQ+sHK/doe2p
	 9CxdivC4hiw+xvlW9eJZMdIXkPg7YFaWIchLhL9u/U5G+E7wpA6xRht/3wSQSfaBbq
	 ogjhNmBHv/Lu2bEZPl6Km98XIErOr/omE7bTjz4TDYi4TXIKMsKINF4vS795jWozD0
	 3fDDe/VG4ophWyFyLnN1jyTYcRIr1nx6e7eDUQB3zEbuoe5EKQY+NBLS7s8rVWsBrG
	 EZYz/CVL5yRv4ukiocgcwLOBlXl0gRql+alb/SJjR/enjMmRMviu+E9ByjauY25AFS
	 ZEO4IxbGfTdAw==
MIME-Version: 1.0
Date: Sat, 15 Feb 2025 09:59:03 +0100
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Subject: Re: struct mctelem_cookie missing definition
In-Reply-To: <alpine.DEB.2.22.394.2502141245150.3858257@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2502121721490.619090@ubuntu-linux-20-04-desktop>
 <1823d604-aa29-4828-a954-b8a08fbdbda7@citrix.com>
 <alpine.DEB.2.22.394.2502121738440.619090@ubuntu-linux-20-04-desktop>
 <alpine.DEB.2.22.394.2502121800190.619090@ubuntu-linux-20-04-desktop>
 <eccc2a63-9678-4675-8a7b-7c8e94206cb8@suse.com>
 <alpine.DEB.2.22.394.2502131326440.619090@ubuntu-linux-20-04-desktop>
 <alpine.DEB.2.22.394.2502131804510.619090@ubuntu-linux-20-04-desktop>
 <3c883b4587d750c2723637a037fb46b4@bugseng.com>
 <69a70bfa-203c-44f9-99ea-60a674e36442@suse.com>
 <alpine.DEB.2.22.394.2502141245150.3858257@ubuntu-linux-20-04-desktop>
Message-ID: <c7f35e1a8a14eb5ffb19d67bbc63036b@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 2025-02-15 00:04, Stefano Stabellini wrote:
> On Fri, 14 Feb 2025, Jan Beulich wrote:
>> > Would deviating macros "COOKIE2MCTE" and "MCTE2COOKIE" work?
>> 
>> If it did, COOKIE2ID and ID2COOKIE would likely need including as 
>> well.
> 
> I wrote this patch. Nicola, can you please check the changes to
> deviations.ecl, this is the first time I try to write the deviation
> myself :-)
> 
> ---
> misra: add 11.2 deviation for incomplete types
> 
> struct mctelem_cookie* is used exactly because it is an incomplete type
> so the pointer cannot be dereferenced. This is deliberate. So add a
> deviation for it.
> 
> In deviations.ecl, add the list of macros that do the conversions to 
> and
> from struct mctelem_cookie*.
> 
> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
> 
> diff --git a/automation/eclair_analysis/ECLAIR/deviations.ecl 
> b/automation/eclair_analysis/ECLAIR/deviations.ecl
> index a28eb0ae76..87bfd2160c 100644
> --- a/automation/eclair_analysis/ECLAIR/deviations.ecl
> +++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
> @@ -366,6 +366,14 @@ constant expressions are required.\""
>  }
>  -doc_end
> 
> +-doc_begin="Certain pointers point to incomplete types purposely so 
> that they are impossible to dereference."
> +-config=MC3A2.R11.2,reports+={deliberate, 
> "any_area(any_loc(any_exp(macro(^COOKIE2MCTE$))))"}
> +-config=MC3A2.R11.2,reports+={deliberate, 
> "any_area(any_loc(any_exp(macro(^MCTE2COOKIE$))))"}
> +-config=MC3A2.R11.2,reports+={deliberate, 
> "any_area(any_loc(any_exp(macro(^COOKIE2ID$))))"}
> +-config=MC3A2.R11.2,reports+={deliberate, 
> "any_area(any_loc(any_exp(macro(^ID2COOKIE$))))"}
> +}

-config=MC3A2.R11.2,reports+={deliberate, 
"any_area(any_loc(any_exp(macro(name(COOKIE2MCTE||MCTE2COOKIE||COOKIE2ID||ID2COOKIE)))))"}

Note however that there is also this deviation in place

-doc_begin="The conversion from a pointer to an incomplete type to 
unsigned long does not lose any information, provided that the target 
type has enough bits to store it."
-config=MC3A2.R11.2,casts+={safe,
   "from(type(any()))
    &&to(type(canonical(builtin(unsigned long))))
    &&relation(definitely_preserves_value)"
}
-doc_end

I was a bit confused by Jan's remark, which seemed correct, but I 
couldn't see any violations in the report, so I dug a bit deeper. 
ID2COOKIE and COOKIE2ID, which operate to/from unsigned long are already 
excluded due to being safe. If you envision those macros to be used with 
other types, then your deviation should mention them, otherwise they are 
already handled.

> +-doc_end
> +
>  -doc_begin="Conversions to object pointers that have a pointee type 
> with a smaller (i.e., less strict) alignment requirement are safe."
>  -config=MC3A2.R11.3,casts+={safe,
>    "!relation(more_aligned_pointee)"
> diff --git a/docs/misra/deviations.rst b/docs/misra/deviations.rst
> index fe0b1e10a2..f3004d6023 100644
> --- a/docs/misra/deviations.rst
> +++ b/docs/misra/deviations.rst
> @@ -324,6 +324,12 @@ Deviations related to MISRA C:2012 Rules:
>         semantics that do not lead to unexpected behaviour.
>       - Tagged as `safe` for ECLAIR.
> 
> +   * - R11.2
> +     - Certain pointers point to incomplete types purposely so that 
> they
> +       are impossible to dereference.
> +     - Tagged as `deliberate` for ECLAIR. Such pointer is struct
> +       mctelem_cookie \*.
> +

I think here (or above in the deviation text) the concern raised by the 
rationale of the rule should be addressed; namely, the rule states: 
"Conversions shall not be performed between a pointer to an incomplete 
type and any other type" because the resulting pointer might be 
misaligned, therefore there should be an argument as to why such thing 
is not possible.

>     * - R11.2
>       - The conversion from a pointer to an incomplete type to unsigned 
> long
>         does not lose any information, provided that the target type 
> has enough

Thanks,
  Nicola

-- 
Nicola Vetrini, B.Sc.
Software Engineer
BUGSENG (https://bugseng.com)
LinkedIn: https://www.linkedin.com/in/nicola-vetrini-a42471253

