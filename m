Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C297AEA115
	for <lists+xen-devel@lfdr.de>; Thu, 26 Jun 2025 16:46:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1026564.1401725 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uUnqz-0002BQ-37; Thu, 26 Jun 2025 14:45:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1026564.1401725; Thu, 26 Jun 2025 14:45:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uUnqz-00028e-08; Thu, 26 Jun 2025 14:45:29 +0000
Received: by outflank-mailman (input) for mailman id 1026564;
 Thu, 26 Jun 2025 14:45:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZhAb=ZJ=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1uUnqx-00028Y-7C
 for xen-devel@lists.xenproject.org; Thu, 26 Jun 2025 14:45:27 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3223eb75-529c-11f0-a30f-13f23c93f187;
 Thu, 26 Jun 2025 16:45:26 +0200 (CEST)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 (Authenticated sender: nicola)
 by support.bugseng.com (Postfix) with ESMTPA id D6D534EE98AA;
 Thu, 26 Jun 2025 16:45:24 +0200 (CEST)
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
X-Inumbo-ID: 3223eb75-529c-11f0-a30f-13f23c93f187
Authentication-Results: bugseng.com; arc=none smtp.remote-ip=162.55.131.47
ARC-Seal: i=1; d=bugseng.com; s=openarc; a=rsa-sha256; cv=none; t=1750949124;
	b=U3Ojx9d//tQtIb3KhvDi6ZEZNGQumKRkfh/hVx8sBBrGbcbXWEc9xcNQC84bgKKdmK2P
	 xaMooXmpUfwtXQ09+yiNgcmufKEMBiVHzqQwq4t+i62c3LQ+ThZI/5dgbKH727iXOQy5l
	 02D8yNSG8H+I5i07ZtNf2j14Pxw97E886SZryVyCbQWYm/UpJP7Y7KlqctcPNql+sbJhD
	 o9VRyvD9mXBapa4oSBVQTi/WWNBgR8xZ8hx4x2mX7OAA0Ih3Za7Qs46SPJujJFgPNEDDL
	 M5xbnvM0hn05uAVwHuQM0JDH0eZcy9B77tIhTRdL1lroQLS1OxOLVze0AXqBdJbQpmhbf
	 grg3aqvSz6ekB3CuFTN4UjciS5WD6FNgZv21kbMEF7oaSGqJ2Wz6Hwjwm+65ssiHAeUFT
	 kc57HcgTLP9PX35P4YqOIU9NIph33hT/06E9k8YktpPq5LMrZAXR3SHpOVKyFpGOpw3f0
	 /o5y8PQI0fYD3odAqH6EBrwojJO3CfRQveN+nZimp5sOpbDpPvgCvZMe2gkAqcEbhL43b
	 4AQ7HsmD6fQrYVfBoDsbqG5N9ghdTfv/dTyaJzRiWv01VmDpYJ9M4Dbe1VyTKjMKfn/th
	 A4lauEvI00KOwX7o7gRZHG7DqSTsIXZQFJ3Gn/Ob1LIKqdKcA3spdjAM0vW9MmY=
ARC-Message-Signature: i=1; d=bugseng.com; s=openarc; a=rsa-sha256;
	c=relaxed/relaxed; t=1750949124;
	h=DKIM-Signature:MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:
	 References:Message-ID:X-Sender:Organization:Content-Type:
	 Content-Transfer-Encoding;
	bh=Qz0iB7aUQ9vqJuypBRbALfOZSr2anArAlOVnsRMt83c=;
	b=PMIYYsMP1p5CIW0QT+ZItd60oVL8/MdEzku71QbgX6r5zXPMIQ4A2OgvhBljmmidZqGQ
	 aI9vvdiNDCFIeY3feycGAeeNflJdVzHwhaxjulCldiIjqHr+Jj+HrDkRxmo2IH78GqOpi
	 khYheWuemn8qkdmq0iSqW4k0fHgeoW/T5x4+uqaXx2DrltIeJjp7a669CRQ8yOwuItkxa
	 7eeQzFVoEnCzfQBZ0dHtMznsliEJbhw2uoK0M63V8X4u2/PFrBeG0IV8YBKkZZ2eoX4nS
	 7z0i28GDQBBc1+C8sNxcKImoIVXZOlpjjX02BXst7Nv4uXoTDyREpJPQl5zBG94gHhUbp
	 AKdt4YUqlXpXrQJoaavNljW3E5t/7B3idgoTlrq7W8s3+C3AWifNGoTXbkbBZ5uJRIqrH
	 n4ZA3oZpDaEGG+D/iPLxRjCW9o+GaaYuH/ZMIn7xbu/0eqiHDKRouCkrVs30TiM1TiQ2m
	 wy8Ed0s5TU7+F4QslPUB3iJ6EMDohiQPmhWvxC0f/y2MmIldzf3JqK/rif74fR518TaQV
	 xnbIVLALx5ml6UA5Kctvgt563fGrszxKt3shCcDbxmfy8X73OSyAjrErpAlE7plY1tTMp
	 VmgbnDOaB8fM8r0g8oBnWQQD4FfgeItmRYFsoukc6alJGZ0zRrN2QzGAVtGYuUU=
ARC-Authentication-Results: i=1; bugseng.com; arc=none smtp.remote-ip=162.55.131.47
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bugseng.com; s=mail;
	t=1750949124; bh=vFuZYmp056XyyVm6vEIbSCdf+ety9niT2s7YK5Cj+mk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=UPw4/dKsOhbbjScYRzHCAD304cCFz3l3mdyvGarWwauwtgigBvlqfYmYwnMB2cmSO
	 Og4XzZfNq1xPOejnjEprdTjrn6hnsnUOl4yXDC2pUfnCjdm75bx9oapZQIGMuBjv21
	 3F8KA7w3VFE8A2xvNkwaV1c0aYXYpKMofD0IiwaKbsWjewg4FWioBuLlcL0vq5iEbJ
	 fvIXPeAYFRLvHO7nneRmGR9g7n76DEPorKznBOobk0A0GFP/ibNuIp/zkl7L+w9ZOA
	 CxsjeP+H/9ZEKjjuMDgAyS9M5RWYuY+/NLKld3qu4kDmySnCNu/Y4K7RG5Ik9BvaAv
	 wTTwH+5Rwr5Dw==
MIME-Version: 1.0
Date: Thu, 26 Jun 2025 16:45:24 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, andrew.cooper3@citrix.com,
 michal.orzel@amd.com, julien@xen.org, roger.pau@citrix.com, Bertrand Marquis
 <bertrand.marquis@arm.com>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH] docs/misra/rules.rst: allow string literals with memcmp
In-Reply-To: <0c6d5b49-ce69-4f16-b61e-ad1378b20807@suse.com>
References: <alpine.DEB.2.22.394.2506231642450.862517@ubuntu-linux-20-04-desktop>
 <0c6d5b49-ce69-4f16-b61e-ad1378b20807@suse.com>
Message-ID: <c61624db2dc3cce8609aed49d49b2865@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 2025-06-24 08:11, Jan Beulich wrote:
> On 24.06.2025 01:45, Stefano Stabellini wrote:
>> Rule 21.16 is about the types of arguments allowed for memcpy.
> 
> Seeing the subject - is it memcmp(), memcpy(), or both? (Writing from
> home, where I don't have the Misra spec to hand, and hence can't check
> what coverage the rule has.)
> 
> Jan

In this case the rule covers just memcmp(): "The pointer arguments to 
the Standard Library function memcmp shall point to either a pointer 
type, an essentially signed type, an essentially unsigned type, an 
essentially Boolean type or an essentially enum type"

-- 
Nicola Vetrini, B.Sc.
Software Engineer
BUGSENG (https://bugseng.com)
LinkedIn: https://www.linkedin.com/in/nicola-vetrini-a42471253

