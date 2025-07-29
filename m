Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 24780B14C96
	for <lists+xen-devel@lfdr.de>; Tue, 29 Jul 2025 12:55:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1062425.1428098 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ughzd-0008TB-7V; Tue, 29 Jul 2025 10:55:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1062425.1428098; Tue, 29 Jul 2025 10:55:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ughzd-0008Q6-40; Tue, 29 Jul 2025 10:55:37 +0000
Received: by outflank-mailman (input) for mailman id 1062425;
 Tue, 29 Jul 2025 10:55:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AlSl=2K=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1ughzb-0008Q0-Jl
 for xen-devel@lists.xenproject.org; Tue, 29 Jul 2025 10:55:36 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8c7094d4-6c6a-11f0-b895-0df219b8e170;
 Tue, 29 Jul 2025 12:55:33 +0200 (CEST)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 (Authenticated sender: nicola)
 by support.bugseng.com (Postfix) with ESMTPA id AF36E4EE3C07;
 Tue, 29 Jul 2025 12:55:31 +0200 (CEST)
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
X-Inumbo-ID: 8c7094d4-6c6a-11f0-b895-0df219b8e170
Authentication-Results: bugseng.com; arc=none smtp.remote-ip=162.55.131.47
ARC-Seal: i=1; d=bugseng.com; s=openarc; a=rsa-sha256; cv=none; t=1753786531;
	b=AJ6Z3Q9CafoVzyl/10PFG6O22/io+5OdWLpT+KGxCSxBBrjwnjA2fGT+q9dYyfQKArW9
	 p3iU1i3ZFiiNni++rZaIyNnQA5ipVlg/78hKE5B7oOfSmhsvR4vW0dKdU7V5bNXCfSVkm
	 c3hFOyhkDmAYmlnAe5isORsaGfbhyb+23g4j4+VMpnNqYI6zfetPdI9Q0xXCOj0WvzK/9
	 fUC/IoJPGqWv/D5B6PASAddEbL4dovHtFqYBWoxs9cFKc9aIocGp4On3NePvaW7x+QhUV
	 0+gubQ0Cnr25n2ocUq3dFjCsUxG/OHXyIY9jpZ13aue0lYk1fV1RHTyCbzBykNUDV3DtS
	 LNWi3sVnl/Gl+Axhsyz3kF3dIV/O5h/Oi3T8N89pYtOntdQ9aYict1aK0NqHdRITnhxg0
	 4mjiDZ3yBn0lQxffkaxIFaUgA8rcWqf+ZKOkY+Cg4zZB/ZevktY64oh0vrepNrac+E1ls
	 X4RlQS5ZBngmf/Rg1ttuDomGNHDaDWh6Tult4SRkjLHHRsaQdWWrnoXUOxLRsDlg6iKjn
	 JhAMKV0Nfcs92o25MiyoUpPfob5pTpER4dv6LC295hxRYX5rc6fBBkeDCkcBhQib24K91
	 tPpbGTxougGLli8WCF2kjCwtAhKdT97JIqTcF3MFQHnxryki/X/EPsg9rDu6tjk=
ARC-Message-Signature: i=1; d=bugseng.com; s=openarc; a=rsa-sha256;
	c=relaxed/relaxed; t=1753786531;
	h=DKIM-Signature:MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:
	 References:Message-ID:X-Sender:Organization:Content-Type:
	 Content-Transfer-Encoding;
	bh=yyW1z1KFJYFLXz+z9yoIFdcdE7QGejx/abg19b/D2WQ=;
	b=vTP8FRpMF9p7EYOSli6rDmak8yoiqRTTlX3T3VaVHOg/Wp2lgQ6VzWXcgBjwF5wKXhQw
	 hv3muYPJKhGbrWh21TSGMLdGuErQEgXqYYRdEde/tKMq9otpJuSgOISD6Dq/vEX3sEXPK
	 FP3Fsf+mek+PQDy1MABFjzbQkw5Yd+wJzQonxfCAwiVi5I+En1kSBfykQmv33LnHtbQzp
	 SrtzpIzPNwvIk9vqF0jxuP7ZC9GnyynT3jiEFlgL+m+vPWagDvEuC0DBteKHA4wuJO9yX
	 3PFYYbLXvEXKO/2tIDb2Q1eGeDNG+SNQUBfIWhiGtpNsgm5mE3nkNhcHdlGIL3iziqauP
	 YmWqkNXV3TmfJglabOpYn1U2/AHyBV+JwqYt3wSlqN9O5Kxp9sCk4ALWg5pRjKc3qlR3g
	 QMIJXqDkLgMEhdsDXUgjWx2AIlyO6Qkk9yhKLEk0A5qfGt4qRCsPdcszoJVEpeSUW5uKo
	 qVmcRwu1bJe3PUAx9zbh0xhBB01xij3I5m/oa5KC335XafV+xRHZhaAoQNTdDjto17a/7
	 Mjgwl/+7ECjfBIMMkhVUrA+Hu7MgYziOKg8XpXjng18wN/5joddsXqdwh0v03z5tFqII1
	 RftBhXV2C4agDPX88sU4QFpP8bSbu/IHY/SF094JXfs/D47cv16bDLRgkgb0bRI=
ARC-Authentication-Results: i=1; bugseng.com; arc=none smtp.remote-ip=162.55.131.47
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bugseng.com; s=mail;
	t=1753786531; bh=/FcAdeOa1slT+HUgYNylqwsM5Fn9wfNvdJLOyvBJhr8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=DaQVQ8TwA7QzTnObL4F8o1sZcy/ezjVGvAP0pTk0yJWmTZ2OnX6hYhDDmJxh0OKe6
	 PssL+CZEua6SO41wBnLHE/5D1zuUislqoDiigymfQYlylZeIzMk/BuUkMOiEzCvS0O
	 HxTTExWWjk87U1ojwm5kOG7olQD8EZbs10R3ogVfptjb0rGfaNUWy/NsuuT2jXAxHW
	 m8Sj3XYEIv70Fw1cKJlJ1Il+nBQPyo/gDHlD5Ll/70EWcMEkLfk7kP/LAx+Dre7dpr
	 qv6X/pJJPxTGuQNel/CD5Iyv6P3KJU4YKC9X+UrAxJpjRaEkXf2knrGzdjj3oU3z+b
	 FdaZWmeTtUpFQ==
MIME-Version: 1.0
Date: Tue, 29 Jul 2025 12:55:31 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>, Doug Goldstein
 <cardoe@cardoe.com>, Stefano Stabellini <sstabellini@kernel.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
 <anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, Julien
 Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH] misra/eclair: set 'noreturn' attribute as safe during
 cast
In-Reply-To: <2c016cc6-bd1e-44c1-baaa-5faa6b88cf6b@suse.com>
References: <8989bf6d8d245537628912a00f5ba4731b292fb1.1753738107.git.dmytro_prokopchuk1@epam.com>
 <2f2a1992-0d88-4429-bed1-af5e60e05664@suse.com>
 <ef43422f-902c-43d6-8b67-10385427e2fe@epam.com>
 <2c016cc6-bd1e-44c1-baaa-5faa6b88cf6b@suse.com>
Message-ID: <7c1de6ab79993a96f8c2cf6ce4c6ddff@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 2025-07-29 12:52, Jan Beulich wrote:
> On 29.07.2025 12:04, Dmytro Prokopchuk1 wrote:
>> 
>> 
>> On 7/29/25 11:04, Jan Beulich wrote:
>>> On 29.07.2025 00:15, Dmytro Prokopchuk1 wrote:
>>>> ECLAIR reports a non-compliant cast due to the presence
>>>> of the 'noreturn' attribute in the callee function.
>>> 
>>> Which callee function? Which cast? Please be concrete. You don't need
>>> to enumerate all case, but one specific example wants pointing at.
>>> 
>>>> The issue occurs when casting a function pointer with
>>>> the 'noreturn' attribute (void noreturn (*)(void *))
>>>> to a general function pointer type (void (*)(void *)).
>>> 
>>> And again - why "casting"? As per ...
>>> 
>>>> Configure ECLAIR to treat 'noreturn' attributes as safe
>>>> in this conversion.
>>>> 
>>>> Signed-off-by: Dmytro Prokopchuk <dmytro_prokopchuk1@epam.com>
>>>> ---
>>>> Previous discussion thread:
>>>> https://patchew.org/Xen/181a03d5c7625d42c06cf9fa0cf48a9bc6825361.1753647875.git.dmytro._5Fprokopchuk1@epam.com/
>>> 
>>> ... there was no cast involved, iirc. We specifically rejected your
>>> attempt to add a cast there. It's a conversion the compiler does, 
>>> aiui.
>>> 
>> Yes, you are right.
>> Word "cast" is not appropriate there.
>> 
>> Below is updated text:
>> 
>>      misra: allow 'noreturn' as safe for function pointer conversions
>> 
>>      The conversion from a function pointer with the
>>      'noreturn' attribute ('void noreturn (*)(void *)')
>>      to a function pointer type ('void (*)(void *)'
>>      causes type incompatibility according to
>>      MISRA C Rule 11.1, which forbids conversions
>>      between incompatible function pointer types.
>> 
>>      The violation occurs at the call site
>>          smp_call_function(halt_this_cpu, NULL, 0);
>>      where 'halt_this_cpu' with type 'void noreturn (*)(void *)'
>>      is passed to 'smp_call_function' expecting a function
>>      pointer of type 'void (*)(void *)'.
>> 
>>      The 'noreturn' attribute does not change the function
>>      calling convention or parameter handling at runtime,
>>      making the conversion safe.
> 
> Up to here things read much better now, thanks. Just one more request:
> Please make better use of the 72 (or maybe even 75) characters that are
> permitted per line.
> 
>>      Configure ECLAIR to treat 'noreturn' attributes as safe.
> 

Configure ECLAIR to treat implicit casts that lose the "noreturn" 
attribute on a function void (*fp)(void*) as safe. This is because the 
deviation actually just deviates void noreturn (*fp)(void*) -> void 
(*fp)(void*)

> This one is still way to imprecise, though. And I hope it's only this
> description, not also the Eclair configuration item that's overly lax.
> 
> Jan

-- 
Nicola Vetrini, B.Sc.
Software Engineer
BUGSENG (https://bugseng.com)
LinkedIn: https://www.linkedin.com/in/nicola-vetrini-a42471253

