Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 74797A7890F
	for <lists+xen-devel@lfdr.de>; Wed,  2 Apr 2025 09:45:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.935174.1336628 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzsmb-0004d8-6R; Wed, 02 Apr 2025 07:45:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 935174.1336628; Wed, 02 Apr 2025 07:45:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzsmb-0004be-2j; Wed, 02 Apr 2025 07:45:09 +0000
Received: by outflank-mailman (input) for mailman id 935174;
 Wed, 02 Apr 2025 07:45:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=g9bq=WU=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1tzsmZ-0004bY-Ry
 for xen-devel@lists.xenproject.org; Wed, 02 Apr 2025 07:45:08 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 647c5e72-0f96-11f0-9ffb-bf95429c2676;
 Wed, 02 Apr 2025 09:45:05 +0200 (CEST)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 (Authenticated sender: nicola)
 by support.bugseng.com (Postfix) with ESMTPA id D46C74EE0755;
 Wed,  2 Apr 2025 09:45:04 +0200 (CEST)
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
X-Inumbo-ID: 647c5e72-0f96-11f0-9ffb-bf95429c2676
Authentication-Results: bugseng.com; arc=none smtp.remote-ip=162.55.131.47
ARC-Seal: i=1; d=bugseng.com; s=openarc; a=rsa-sha256; cv=none; t=1743579904;
	b=uU02vpy4h8VghoZIYHSZ6CsIaJoqqjd6MzPOzCVmH7qobbSSGHBcuhOpRHzKRIVN1AKk
	 7ECSP0e9qwEtJnzHrGtyiig9b8aeIfTwwZqQGJxYmvqatmCnEOAt7Oe6zvNPdLpQOGHi8
	 CBSeHC5+W7PJULcC3NkMfZpv1wOazwGn/awVM2no5R84DE+sl5FamFmuwLrdvqpmiPsYc
	 9hZOctApE1JMjfJHj3S2loB99sq/xnRTVfnEmYBTPJNG61sWZZIr2TraMg0DLx3o9Tmqo
	 AHkN/z6DG3sWXPBdo8j+ENTg8o1P045fIeiauZDYn6BGWcP86OH5+/uzwMB3+I/lGimlc
	 PgjEOfOuqAU4ivXOVVfaeOFAzjystWKQWmI1n8BpDAvVkOIxszGf8QuLy+JAHO+mJeBjP
	 1h9ACgbAAe//HoLvkRmovyCoMLfv/39NlB2cEx1ECMmyX6nen9UPQr8Etk/rcTqz8tOxa
	 xS1Zx/A94DOoXh/pQSew12E8uTfcyjopSvY3rj33P4P1nUKQJqGdV0OpH119uNiIIu89g
	 lfEwbMl0IHll66akFqEU7DMBWJ/72XL9IIMfGxvUVcaRQCsX391oVQMZ/VikyBEOnUKND
	 RNY4S5FI/xj3djBgSzCDSFG1D9pNkbOOU9Du2pj9wQ4oZtwvosOHcwIBUPzneYY=
ARC-Message-Signature: i=1; d=bugseng.com; s=openarc; a=rsa-sha256;
	c=relaxed/relaxed; t=1743579904;
	h=DKIM-Signature:MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:
	 References:Message-ID:X-Sender:Organization:Content-Type:
	 Content-Transfer-Encoding;
	bh=qhCy2CGoUJcFbZWqQcomLbijGomZjPwLRYg2MA13gfQ=;
	b=nkdUf6O3wXzgGB4Vw1ZZaRyCKnnlm3mEgKqwAWtRRjiRelNiuEPbpMgWnmAwLr+XYASG
	 LtozptuuxD+B0ag3BaswM3jUhhBzci2xcPSsoqX2UFV0gymjEOunupI7oawfp7/9kwULm
	 I9/iEwfSgjDc5paI4QRmGqgvTgyZVnW7kTpZ/AxKqL0ONWDe+4TDbtMvuGG6JlvJ+oNAB
	 NJT+fTbM3J0MBuxVFE3201vkl47f3CF1o4GqvsgHAUAeJMLf6IQg7VyhjAkvR6T2+OIkF
	 TVzAvVTdUhffOrkP9M/2peLPqIeflqeX9N0JT5DuG+cfvRItvoaM6ky3kui3b5Y+Uw1Ne
	 otWLdWHV8so7kUJ+gnHDcG14m2iN2WAdFcZD9W9LzJhL8akhKBeH96s1BXHv2ZJf4qQpc
	 zFpxcySQ/bwQWYvvpo61ES6By5h2p/6bOYfdCEA/OXkZ0zK89B7m1tdxStckm46JKW5Sy
	 xl3G6wXIbYuuw/++3+miPwbA4ExgOVhZIjNbmX2V0XpnEEAjrpCDu171UIdtJFiexIitB
	 mO2K/FpQGOVbkaibIsQZXFw9WKk1YBhvX+uswjvZ0qwHImGG+GocL7Xpp+o1idVEHshc7
	 FBSrAfRd+taq1uWUkE5RayF3Z2uZGLBfMmyzCiYhEOOywICW7G94eNJFoaywK3g=
ARC-Authentication-Results: i=1; bugseng.com; arc=none smtp.remote-ip=162.55.131.47
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bugseng.com; s=mail;
	t=1743579904; bh=AtGTAxW0PwrhY5qFpU+TlRRK5r826YovS/7+iYwxjFA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=H6YVhaTdkmyX8GESw2Q2Fpz9B8uzXlbGB3eCYAmZpgclxFFaF54BTa2sWVlNULMg+
	 ABgI61wOxUtX6WK2CqBT41DloE3ZpjH+irtEv++p5dFE156N0w+6L4RH4oTkwR5Aiv
	 +I5l6qFPyQo2uqJJHkwRp9bILJEjK7KOPTaHiuv3ig8KzeBiCX0AU7A6Wsg0m8y4Lt
	 jhrIThVHMt43mW/cZgDfwkcxLTofq5Lp9kqS01a2rjYzw3VfItmAnx4v54uNBX01MZ
	 tjqKLP+v6V9hj1Yrzl+TXFnc2frLiF+c3+ZYKmHZApaUGHhUDqJmcQMrYIG1J818rM
	 Ntaco1Aw61lOw==
MIME-Version: 1.0
Date: Wed, 02 Apr 2025 09:45:04 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: "Kwon, Gihwan" <gihwan.kwon@boeing.com>
Cc: xen-devel@lists.xenproject.org, Stefano Stabellini
 <sstabellini@kernel.org>
Subject: Re: [QUESTION] Minimal Xen Configuration
In-Reply-To: <PH3P110MB2246A9D7AFA0A73000781B0390A0A@PH3P110MB2246.NAMP110.PROD.OUTLOOK.COM>
References: <PH3P110MB2246A9D7AFA0A73000781B0390A0A@PH3P110MB2246.NAMP110.PROD.OUTLOOK.COM>
Message-ID: <f4803fc17047a9d74928c66d39bf9632@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 2025-03-28 07:43, Kwon, Gihwan wrote:
> Dear Xen Community,
> 
> I hope this message finds you well.
> 
> I have heard that there exists a minimal Xen configuration optimized 
> for
> safety-critical products, particularly in automotive applications, with 
> the
> code size reduced to approximately 50k SLOC.
> 
> Could anyone provide guidance or point me to relevant resources 
> regarding
> this minimal Xen configuration? Any insights or references would be 
> greatly
> appreciated.
> 
> Thank you in advance for your assistance.
> 
> Best regards,
> Gihwan Kwon

Hello,

I am part of the team that provides static analysis for Xen, mainly 
towards the objective to make Xen compliant with MISRA C guidelines. As 
part of that effort, a minimal Xen configuration has been defined (for 
Arm and x86_64) at [1], which is the one currently analyzed for static 
analysis for each commit [2]. It starts from the default configuration 
for the architecture (i.e., make defconfig) and then turns on or off 
various Kconfig options, as specified by EXTRA_XEN_CONFIG.

@Stefano Stabellini (Cc'ed) is the main driving force behind the Xen 
certification effort for automotive, therefore he's probably the best 
person to approach to get more information on this matter.

Hope this was helpful as a starting point.

Best Regards,
  Nicola Vetrini

[1] 
https://gitlab.com/xen-project/xen/-/blob/staging/automation/gitlab-ci/analyze.yaml?ref_type=heads
[2] https://gitlab.com/xen-project/hardware/xen/-/pipelines

-- 
Nicola Vetrini, B.Sc.
Software Engineer
BUGSENG (https://bugseng.com)
LinkedIn: https://www.linkedin.com/in/nicola-vetrini-a42471253

