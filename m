Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D68AB22C10
	for <lists+xen-devel@lfdr.de>; Tue, 12 Aug 2025 17:49:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1078866.1439899 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ulrFs-0006DN-M0; Tue, 12 Aug 2025 15:49:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1078866.1439899; Tue, 12 Aug 2025 15:49:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ulrFs-0006B2-JI; Tue, 12 Aug 2025 15:49:40 +0000
Received: by outflank-mailman (input) for mailman id 1078866;
 Tue, 12 Aug 2025 15:49:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WPHn=2Y=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1ulrFq-0006Aw-Ku
 for xen-devel@lists.xenproject.org; Tue, 12 Aug 2025 15:49:39 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f30745b4-7793-11f0-a327-13f23c93f187;
 Tue, 12 Aug 2025 17:49:37 +0200 (CEST)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 (Authenticated sender: nicola)
 by support.bugseng.com (Postfix) with ESMTPA id D63134EE0744;
 Tue, 12 Aug 2025 17:49:35 +0200 (CEST)
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
X-Inumbo-ID: f30745b4-7793-11f0-a327-13f23c93f187
Authentication-Results: bugseng.com; arc=none smtp.remote-ip=162.55.131.47
ARC-Seal: i=1; d=bugseng.com; s=openarc; a=rsa-sha256; cv=none; t=1755013775;
	b=hWsy1XXb+IhtjyVtI094BmKpY6oX7bfBLwMxJhWcRnY6xvC/fhHjurNYhc1vUzX0cUeH
	 CjJwRKRaDusWP0rz6B8KSGn+oRmS5nY+aCQpaj98je5w3NNM+ontAFx58oqchesEoQ/WD
	 vQ8BMX1n2CyhVrwY0q06F+Fu3qsq1MahfOaovx69Fl0iHA8P7G3X+XyQ82mXJwkU0QB2E
	 dndiCKZoJBMRy/inwbbgKDeNYKGYbxkgWK8cfHA6dmF6VOsY8+luYnmkn/XndhUCze3kp
	 bRmoQeyAPrMlLhVmYJCxQaCbWZXV3gb2xqoFI8YnBc6MEJ5tIh3bQHwsyVrEdEWX4CK12
	 UdBCcVh0xUrb95a0DuEVEEAroBfaTZGvSUgF/Xe1Dy5+GsaXCHSzBt4OshS+2/W/DZ4Si
	 BngneFnHgp/l1nEhsyZmeUGOMW5oH6f1zwLW9P2+C9ZCfigERpoKscBW+2xl/7qDnKxWM
	 Os3i13sZB784xWHCmzjGw4lBxwqewfSr4xMTrzOB5zCPYJt17ndy4Q7aZ/4HgZgShTRPX
	 h2C9HjCuQTd5BFpXB/uTYarjAkcgF0nMLDmS/at7YMbDSw+xlQFtDmjw81zseBLgQm0Lm
	 PXyNPAVtIAHQ31q0OHRDwyEjEVUMNdhluRD3z6WlqSIhhlKspzU1ystGM16t9KM=
ARC-Message-Signature: i=1; d=bugseng.com; s=openarc; a=rsa-sha256;
	c=relaxed/relaxed; t=1755013775;
	h=DKIM-Signature:MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:
	 References:Message-ID:X-Sender:Organization:Content-Type:
	 Content-Transfer-Encoding;
	bh=92+Xp9/ptUrRMK/PBNThr9/1s4fDv2zdvs5B2CKPtRA=;
	b=29/csnUI1hrs16f3AM4yA0Kr5Ry5KfCJH65kVFjs4iHADO9N5on1GYdIJZYPe4lrPk/P
	 BTyieFwoF0TRmR+66P3HT+QeP/x7YstqjI7BrNI+0pHOLAPMZB38RLYKjB0tkX27eatWK
	 f0LE93D/fdvdahlrLXm1YsJ7ScvsdPGd8oO5RwlOiW/hI8rYQwHWmYq7JsYJrs2pvgJZY
	 aZouD1SRKwMC0gIWyYCkXStcMilVTj/zxzjKL+2dUn3mtbf7Jo0M/0HDfdBi6c3lDduxN
	 +WFj8i4mEsUEjIMzxk9j7auqDQrFVhafXLasG1pNGde/CtbGoL1OWpwMPDJMuVhYqHTUG
	 ZbwbZ/Onuq+nZAB2RvnqTlPuFkezXSeBTe8IEwIon+Is1gmRMS7DO4zE66D3KKIY9Gh2U
	 U89WJqAAeYW3FKRSagtDQ7aEPung2HaO6UfUVLkm4FZIS1oTxPW+luH/+fQUpKXR5eQxd
	 rVTSC7MJWOHHmssTMgkeVp67Zc75/yqE7DXVvPNtg/HxyxRzuKbAIcr/oliJZXz4O3s91
	 NoJAGRtGcg1OSNevG2MdYfSwI8w4QWYHw26Rxc7s1T5Dp6KRSiFIUL6X0ZJbYpD/LR99N
	 zlhj3p5fMd7RqsWRbRUwudq4fRzr9BSICrMCZfa5PpAMf3XWUsOM7eQOUJjZcME=
ARC-Authentication-Results: i=1; bugseng.com; arc=none smtp.remote-ip=162.55.131.47
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bugseng.com; s=mail;
	t=1755013775; bh=af0Dom1/TSFFK5AmTYyYolg6Vz6yqixWwh8drceswgg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=cFpre41fBYY+GylfQLgq2RtEeXsq+IyMVQHqLCEm3KOfBwUK7qyYDAiXmExo+gla5
	 wgS+mJn4+4qjM7kZ99PsYBLVDUgPa9RMchEpypdLX6FDPOd8VC5JaIOZl5cON8mGpw
	 cslvwx8/mbRdL+hiEFL75Y0NvDETrVsHNkgoHVBMHZUM91/gOkYpafOgP09vQbttVA
	 ScoTQ6wsvNv+QsFg8i1Au5BCI8hoywp/gY8ZSddQWUyXmgp1/ard1BN/8YgUTYPo+y
	 L4oJDr4o5nW6yQ+ZUxwrx+c/e3Vhe2iSVLpUMMMfgZPBE4DWun/0wg8x3bHdcxKZbn
	 PpN09QDPCHOsg==
MIME-Version: 1.0
Date: Tue, 12 Aug 2025 17:49:35 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
Cc: xen-devel@lists.xenproject.org, Stefano Stabellini
 <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
 <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH] misra: add missing noreturn attribute for __div0()
In-Reply-To: <1b5549a97db31c65edb769302deff73576cec41d.1755013482.git.dmytro_prokopchuk1@epam.com>
References: <1b5549a97db31c65edb769302deff73576cec41d.1755013482.git.dmytro_prokopchuk1@epam.com>
Message-ID: <6aa50b8147d14e4d654f1291fc3b9cef@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 2025-08-12 17:46, Dmytro Prokopchuk1 wrote:
> The __div0() function never returns to its caller, causing a violation
> of MISRA C Rule 2.1: "A project shall not contain unreachable code".
> Add the `noreturn` attribute to fix this.
> 

I was convinced that this was already upstream, as I made a patch a 
while ago, but evidently I forgot to send it.

> Signed-off-by: Dmytro Prokopchuk <dmytro_prokopchuk1@epam.com>

Reviewed-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
> ---
> Test CI pipeline:
> https://gitlab.com/xen-project/people/dimaprkp4k/xen/-/pipelines/1980129839
> ---
>  xen/arch/arm/traps.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/xen/arch/arm/traps.c b/xen/arch/arm/traps.c
> index 445e7378dd..2bc3e1df04 100644
> --- a/xen/arch/arm/traps.c
> +++ b/xen/arch/arm/traps.c
> @@ -172,7 +172,7 @@ void init_traps(void)
>      isb();
>  }
> 
> -void asmlinkage __div0(void)
> +void asmlinkage noreturn __div0(void)
>  {
>      printk("Division by zero in hypervisor.\n");
>      BUG();

-- 
Nicola Vetrini, B.Sc.
Software Engineer
BUGSENG (https://bugseng.com)
LinkedIn: https://www.linkedin.com/in/nicola-vetrini-a42471253

