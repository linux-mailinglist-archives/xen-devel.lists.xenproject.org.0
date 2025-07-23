Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D4B7B0F5BD
	for <lists+xen-devel@lfdr.de>; Wed, 23 Jul 2025 16:47:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1054296.1423046 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueakU-0006YY-58; Wed, 23 Jul 2025 14:47:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1054296.1423046; Wed, 23 Jul 2025 14:47:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueakU-0006Wt-1n; Wed, 23 Jul 2025 14:47:14 +0000
Received: by outflank-mailman (input) for mailman id 1054296;
 Wed, 23 Jul 2025 14:47:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kfeK=2E=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1ueakS-0006Wn-Pr
 for xen-devel@lists.xenproject.org; Wed, 23 Jul 2025 14:47:12 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ea62eb97-67d3-11f0-a31d-13f23c93f187;
 Wed, 23 Jul 2025 16:47:11 +0200 (CEST)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 (Authenticated sender: nicola)
 by support.bugseng.com (Postfix) with ESMTPA id 818244EE3C3B;
 Wed, 23 Jul 2025 16:47:11 +0200 (CEST)
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
X-Inumbo-ID: ea62eb97-67d3-11f0-a31d-13f23c93f187
Authentication-Results: bugseng.com; arc=none smtp.remote-ip=162.55.131.47
ARC-Seal: i=1; d=bugseng.com; s=openarc; a=rsa-sha256; cv=none; t=1753282031;
	b=AfoLF7BervQQF4PKYClX4CUiCobStSCzAGVsEL+7smpSWKZDDJv1zpKNjbZGyiphInHi
	 HylISGlk8vYS6BGmcB8OEKSVWLCW8K4KyccGywbvhdctIRCtocyd90mb+hyn+armCYgmg
	 GdIcvrtfq60O9X5CwC2A8c0Q2Bd+RcySx2HCy/sivIqy+3nveq6t4/96Lb1YnAdaF3oFe
	 1UquGbrgPrq4ubOZ2L6i4tKLu5FNwqWvMQ1WUG45/hV2husMko3hQ/zJFMyiobmrlvO71
	 7Pi824Vb6CUV+IaQHnln5ncVrlVB1GsJOYAElOYQX78hokYFUNl2+AAp2XcsBKekIsKzv
	 TiP1YQa9yLvNWYD1agJHxZMqEnLTkzREuJZyI+LbBHdilTED7kIWL7Uc8JAUx/XKdPfvE
	 iPR0AVJQI4Dt2PU89UVePtZ350lbGnB5XbWGOg5APKgLKclBxe0XIYi6pjl6p4BchSE9L
	 yrBYOkuLUBj172/FpI/gaunPusfMJb6uFKyfhaHjZG/gJlk887QUtI2ZoeVOtfVbpjtY6
	 Q0nFb5OsvOthyn3f0Kz2wVelnvQU1SDaeY9RgsCJ0X5V+klzL1AXMPJckHJm8HpIe6wGe
	 FJXUadck9LUDTlByRpDyxh8Z7b1FXblxsdZRLIhP/B2VxVBaHIWwzjZAj6VxOqk=
ARC-Message-Signature: i=1; d=bugseng.com; s=openarc; a=rsa-sha256;
	c=relaxed/relaxed; t=1753282031;
	h=DKIM-Signature:MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:
	 References:Message-ID:X-Sender:Organization:Content-Type:
	 Content-Transfer-Encoding;
	bh=HVCDQEWGqF8la3C3xBM1trIpYtBVkznL9Tczio+hfiI=;
	b=5unZWav+Z4n7fy3f+sDierpKm3ASA70J7QCEwyvKAlDAueUc2nr6DyjLaZNjB6GcTdPO
	 kGtWh+2UzpAtcqDnoE5eio7F5k73l1oAIfeII0HTEPR/72ie0I/lJv80gMoEKDdVzZgbB
	 7Zmnfpys7OfBE/jeNjleYP3tqIFTonmhH3cXavSZRUWEPzp8OVVoj8Pr86nbaRTc5jVdI
	 gDs8l5e505hO85gNPZ0nBeEQFroa8pdzuGx+bbccnzh07fZCJ9+1HPHBF6N9IKhNlyKsb
	 7Yer1FAgUNVl+9nKPHdntIUjNZwjHOO1snku+ZiiJTd2XhIVBpVAcG2HIWH62dO7Lil65
	 x9EGazGd2/UGDohYDgETgvQ0W3bRqTHXvqDKpf8FhTTOS8/WU9VCtxT4Xhf/llKl0OHyJ
	 WN6Qvtk3ThFOD3FFOEpQ6g5D+5iDvbrFy6BKuPLWesIFTB0XNnANBd90DK6HmbB5zjPt6
	 7Vms+0GxfRbhnngJKq7OoDqeTzWrlRIk6oWrMux1mxzzPLznHfjHKN/xm0oUy49f9vBt/
	 VRDUIW2IZKrsIrX2PMscR/k0tWALqGGLpg65kiDFvPyD8pLvgdb70Z6446merUgQM4YOL
	 GfGn+w6pt0uY7Mq3yjHBDn8dG8M7jlihFjjVID65Q5QSgL4Z5hx5RxRxHKnpd+Q=
ARC-Authentication-Results: i=1; bugseng.com; arc=none smtp.remote-ip=162.55.131.47
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bugseng.com; s=mail;
	t=1753282031; bh=7uSSJAKnz6np+EYwINHFq0z/KMa0uSmLT9PrDrjgeOE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=WjgEeki0VSCv0540Oz6JX+yz4TRTBIMtIxOwH3dIWS7OWTUMYElfiK/NdbOE+hEqH
	 wdSh6dc38+9JbejMiv5FLcZNSqozt4X9z4n0DiVIDpxVinBPJkZAYg1ZASGQ8f3GNR
	 4iDyAwIH/YjnhFv87E1+ryO4NHKllSOoojcpCTdKVzTbp70RgEuVCtgGwzXlB8fCp1
	 12E7r47AHCe/5hdVRq5RTrGLpK6TSwTg+r9OMzAwbcjoico0PCqhMxAjWDTszHQn6s
	 +ncHdj7Yw2VE0Nl12wlUBZi62cjPn/41nE9PD/FsKGQNL6ElnPnirljvU0ehAQx3Vg
	 m/1Vqpr4T//UQ==
MIME-Version: 1.0
Date: Wed, 23 Jul 2025 16:47:11 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
Subject: Re: [PATCH] x86: correct scrub_page_{hot,cold}() prototypes
In-Reply-To: <161f9018-7746-4f74-82cb-d3921a9be4e2@suse.com>
References: <161f9018-7746-4f74-82cb-d3921a9be4e2@suse.com>
Message-ID: <f0538799c8e18950b80efa939b43c8dc@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 2025-07-23 16:37, Jan Beulich wrote:
> ... to be in line with Misra rule 8.2 requirements.
> 
> Fixes: 6ff0cfbfd4f7 ("mm: allow page scrubbing routine(s) to be arch 
> controlled")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Nicola Vetrini <nicola.vetrini@bugseng.com>

> ---
> The offending patch had been pending for far longer than we care about
> Misra, and hence at the time of writing I didn't pay attention. And 
> then
> I never looked again. I'm sorry.
> 

Ah, sorry, I didn't notice your patch, I just sent basically an 
identical one, feel free to disregard it.

> --- a/xen/arch/x86/include/asm/page.h
> +++ b/xen/arch/x86/include/asm/page.h
> @@ -227,8 +227,8 @@ void copy_page_sse2(void *to, const void
>  #define copy_page(_t, _f)   copy_page_sse2(_t, _f)
> 
>  #ifdef CONFIG_DEBUG
> -void scrub_page_hot(void *);
> -void scrub_page_cold(void *);
> +void scrub_page_hot(void *ptr);
> +void scrub_page_cold(void *ptr);
>  #endif
> 
>  /* Convert between Xen-heap virtual addresses and machine addresses. 
> */

-- 
Nicola Vetrini, B.Sc.
Software Engineer
BUGSENG (https://bugseng.com)
LinkedIn: https://www.linkedin.com/in/nicola-vetrini-a42471253

