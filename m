Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F0612B14156
	for <lists+xen-devel@lfdr.de>; Mon, 28 Jul 2025 19:44:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1061802.1427382 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugRtH-0000xP-MF; Mon, 28 Jul 2025 17:43:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1061802.1427382; Mon, 28 Jul 2025 17:43:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugRtH-0000vx-JX; Mon, 28 Jul 2025 17:43:59 +0000
Received: by outflank-mailman (input) for mailman id 1061802;
 Mon, 28 Jul 2025 17:43:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=s93S=2J=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1ugRtG-0000vr-El
 for xen-devel@lists.xenproject.org; Mon, 28 Jul 2025 17:43:58 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6cda4c1b-6bda-11f0-a31e-13f23c93f187;
 Mon, 28 Jul 2025 19:43:57 +0200 (CEST)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 (Authenticated sender: nicola)
 by support.bugseng.com (Postfix) with ESMTPA id DCED54EE3BFE;
 Mon, 28 Jul 2025 19:43:50 +0200 (CEST)
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
X-Inumbo-ID: 6cda4c1b-6bda-11f0-a31e-13f23c93f187
Authentication-Results: bugseng.com; arc=none smtp.remote-ip=162.55.131.47
ARC-Seal: i=1; d=bugseng.com; s=openarc; a=rsa-sha256; cv=none; t=1753724631;
	b=aFemo4I8T/y33RxSgGCGXhxMed5JDCyast8hBF6VSMZtoINqWAjiFv+FmTK3fIWYYh/J
	 xCsbE10X/Dr6ZSKdqdh5pm7VO8qXRCdFNgfGaTQbKvoZUkCI81Y5mGCcbhEXt4Ik/N/Rz
	 w0KZNg+hvpP/+IGto16kvOkxIXjqC1IPyZJ3YW6lB3FaljfLWlbAb4GZm+y35YwHG2E3y
	 tUV3Ym/3TV7orpufR+OMqkWAQLX4RT4AsEOtJQzb7kkmEsOLKcYPWTGxtGw+f5CybPFzS
	 fwjCXJP1C76pD8ZWvjkmELmoARs1mnpIkfXYrw7z5CkGrYbbIUinCkXE36/G8njgJS9jk
	 ZqKrvTDD0bap6gnhCjf0+j4rTslI09uLQlzsNBtGOtAFC4KJIYMAd52/P17KEYB5jtyUy
	 eC6e68vAWVF35PHKb3gWoT74WQA2LDH/DQP1AcI3R2e+Fx8PPBY353ppOc7IQZR7AOPCM
	 6LtYief90svPu21gJoJ2qa16zSXTJZE6A/iZxcfnDr3Dpq6N3fSLPtK9GeFqmQaTJhtMV
	 9Z5+81CENEc4NbfiD2sUof6snMkikaKjzY7PU/uWwN33E1uYgo1FsmuL+j7xUMiOAk973
	 nryAIkKs/tohc1UbkZbiaaPMy3G+c+AkJp78Mh+iVwi6vVl2KMfLI80pyMvquBg=
ARC-Message-Signature: i=1; d=bugseng.com; s=openarc; a=rsa-sha256;
	c=relaxed/relaxed; t=1753724631;
	h=DKIM-Signature:MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:
	 References:Message-ID:X-Sender:Organization:Content-Type:
	 Content-Transfer-Encoding;
	bh=7BPNj/8AaJau18LtVlMhCLst9WTNlnZPcyFNXMfgwC0=;
	b=3XhAwbm8yEX+1iYOKvPwMNSo3TNp0bsKSIGyrjpaKIXvR9TA74yttrlSqTUdU/d3+Zj/
	 CyY/R6OMsIZvRKgjyWAHFOXxCiUGXqMe49XUI4m/bQ2ygG82ezzoTefP7RyatIPVA3/Hh
	 klWRtsbkQ6JOdvp4KUAosXnprOewAFAFWOPxqkvyplUJsuV6Br+zNsG09HYTW4chwvoNA
	 x39kE9nT7F8eU2Fq6OC9hYM0ROQFkQYQdbi8f4XrcEMoY50PO+YCWf7allVYcOdkOrmpN
	 p3TOWyr1BPloZCYcHlwyNj4Br5hvdPOhBz+iiUKrUAEbv+OXm0q25ugHLp6fm8OhmkVz+
	 JtRlLA/TFsJL/WmBFAEgLLVDG+Vpn0KFreg5e3PY6YMrK8lexoE3P0NBYqia8JFq7EOQp
	 9DZr7TP2NxAd+NJBtUSSxXsviK3QgZq1UNqq85kVDTSvPg5LjK0odoxXIyyp5CHLOuVO+
	 0mQgsH/0bE5ZVuKM45FBST8HDng9PHIEXpAXnE+k4AVf7jeMcAdUwHuHBN1XB7QVycxzu
	 jCfqLm9vApvdeHwSnopTbGWw6QlJ75QocSvJiPG7epmm1MHkdANMw3lTEc25h3GvTKguT
	 WacyNBDmw/pb7GaeV/ux2ix3RbtUoC7rv3dAJ4jnvCsZllvI17g7HbfVumvCHro=
ARC-Authentication-Results: i=1; bugseng.com; arc=none smtp.remote-ip=162.55.131.47
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bugseng.com; s=mail;
	t=1753724631; bh=9PqloJ+0n3WzHkXncwBWw1mcZoAvq3wKEr8YBuvhNW8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=J3/aV1UWf2DPeg/14XtYWj0U28/tPs+UQpJYpWLjQiNioprLbgVeEtyH2YyIzIH1n
	 MUqcMs0p14epMrNZK4zbBWXqIGs66z8mTTguF2tNfwJz0MNYzRJnoYGzF4FWOokcHa
	 oqvVI2xxSPulkZNKbvXQMSk2puTD1U9oiGZU3iWmlAzItV4+GHYbT+IAzvwXw83MRs
	 6s76WOY4zppirgA+Tzr5hJ1POLTJBA/9an1m1oxFz53YgFulv9Zd776aV0HwY0Lxco
	 E+eQlEqaN1BEpnOsR+Wi1SS7EOL5ewu2tqTmyYDIA+LTlwFsy6682ZyyxoQPxLFu7Y
	 tLeQ6fJUq1BrQ==
MIME-Version: 1.0
Date: Mon, 28 Jul 2025 19:43:50 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Jan Beulich <jbeulich@suse.com>, Dmytro Prokopchuk1
 <dmytro_prokopchuk1@epam.com>, consulting@bugseng.com, Anthony PERARD
 <anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, Julien
 Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>, Volodymyr Babchuk
 <Volodymyr_Babchuk@epam.com>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH] misra: deviate explicit cast for Rule 11.1
In-Reply-To: <43bea8dd-fbd3-4a64-ad9c-aac5813c15a9@citrix.com>
References: <181a03d5c7625d42c06cf9fa0cf48a9bc6825361.1753647875.git.dmytro_prokopchuk1@epam.com>
 <093601d7-691a-48ee-a0f4-2e86a0f2015e@suse.com>
 <43bea8dd-fbd3-4a64-ad9c-aac5813c15a9@citrix.com>
Message-ID: <f1fa4da171fd7b6dbfed06cff3d4771b@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit

On 2025-07-28 12:49, Andrew Cooper wrote:
> On 28/07/2025 10:56 am, Jan Beulich wrote:
>> On 27.07.2025 22:27, Dmytro Prokopchuk1 wrote:
>>> Explicitly cast 'halt_this_cpu' when passing it
>>> to 'smp_call_function' to match the required
>>> function pointer type '(void (*)(void *info))'.
>>> 
>>> Document and justify a MISRA C R11.1 deviation
>>> (explicit cast).
>>> 
>>> Signed-off-by: Dmytro Prokopchuk <dmytro_prokopchuk1@epam.com>
>> All you talk about is the rule that you violate by adding a cast. But 
>> what is
>> the problem you're actually trying to resolve by adding a cast?
>> 
>>> --- a/xen/arch/arm/shutdown.c
>>> +++ b/xen/arch/arm/shutdown.c
>>> @@ -25,7 +25,8 @@ void machine_halt(void)
>>>      watchdog_disable();
>>>      console_start_sync();
>>>      local_irq_enable();
>>> -    smp_call_function(halt_this_cpu, NULL, 0);
>>> +    /* SAF-15-safe */
>>> +    smp_call_function((void (*)(void *))halt_this_cpu, NULL, 0);
>> Now this is the kind of cast that is very dangerous. The function's 
>> signature
>> changing will go entirely unnoticed (by the compiler) with such a cast 
>> in place.
> 
> I agree.  This code is *far* safer in practice without the cast, than
> with it.
> 
>> If Misra / Eclair are unhappy about such an extra (benign here) 
>> attribute, I'd
>> be interested to know what their suggestion is to deal with the 
>> situation
>> without making the code worse (as in: more risky). I first thought 
>> about having
>> a new helper function that then simply chains to halt_this_cpu(), yet 
>> that
>> would result in a function which can't return, but has no noreturn 
>> attribute.
> 
> I guess that Eclair cannot know what an arbitrary attribute does and
> whether it impacts the ABI, but it would be lovely if Eclair could be
> told "noreturn is a safe attribute to differ on"?
> 

I'm convinced it can do that. Perhaps something like

-config=MC3A2.R11.1,casts+={safe, 
"kind(bitcast)&&to(type(pointer(inner(return(builtin(void))&&all_param(1, 
pointer(builtin(void)))))))&&from(expr(skip(!syntactic(), 
ref(property(noreturn)))))"}

which is a mess but decodes to that, more or less.

I haven't tested it yet, though, but on a toy example [1] it works.

[1]
void __attribute__((noreturn)) f(void *p) {
   __builtin_abort();
}

void g(int x, void (*fp)(void *p)) {
   if (x < 3) {
     f((void*)x);
   }
}

int main(int argc, char **argv) {
   g(argc, f);
   return 0;
}

-- 
Nicola Vetrini, B.Sc.
Software Engineer
BUGSENG (https://bugseng.com)
LinkedIn: https://www.linkedin.com/in/nicola-vetrini-a42471253

