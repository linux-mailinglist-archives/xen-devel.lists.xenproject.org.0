Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1160687BA07
	for <lists+xen-devel@lfdr.de>; Thu, 14 Mar 2024 10:06:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.693060.1080788 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rkh21-0006gF-CY; Thu, 14 Mar 2024 09:05:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 693060.1080788; Thu, 14 Mar 2024 09:05:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rkh21-0006e6-9d; Thu, 14 Mar 2024 09:05:45 +0000
Received: by outflank-mailman (input) for mailman id 693060;
 Thu, 14 Mar 2024 09:05:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4N5k=KU=cloud.com=george.dunlap@srs-se1.protection.inumbo.net>)
 id 1rkh20-0006e0-Kl
 for xen-devel@lists.xenproject.org; Thu, 14 Mar 2024 09:05:44 +0000
Received: from mail-oa1-x34.google.com (mail-oa1-x34.google.com
 [2001:4860:4864:20::34])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 08b18431-e1e2-11ee-a1ee-f123f15fe8a2;
 Thu, 14 Mar 2024 10:05:42 +0100 (CET)
Received: by mail-oa1-x34.google.com with SMTP id
 586e51a60fabf-22215ccbafeso381451fac.0
 for <xen-devel@lists.xenproject.org>; Thu, 14 Mar 2024 02:05:42 -0700 (PDT)
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
X-Inumbo-ID: 08b18431-e1e2-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1710407141; x=1711011941; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7BxBaJcrAmxi2huKCdNF1/OD24+lEdSeSWhukacTCPU=;
        b=DEdJLEaAFkKvocFUsTtfOt1jSuBnclDogwCeQ2BoZspaAfjZ7pSEdj+tXMA3Ja/v7Y
         9Nm8Xn8HtORrT6yLxGu3Ad4gdXVO2EGiSF1fOPUJoqcbTgk2OLCywi0bWrmkwjnmBjfM
         uQiRhagZPIGQjXvQuEQxJmeL0BZVh/tCfrxfY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710407141; x=1711011941;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7BxBaJcrAmxi2huKCdNF1/OD24+lEdSeSWhukacTCPU=;
        b=YCbf/eabMxNYIks2KiAlDUMTn66FWLEoKbfRlCTM0ZaSrA2U+lUAiPxahg8dA6y9rp
         jQr7qTVQG0u26VINBDQqt4UncTOvsdIDkcjztWLXqM72kuPUzgSRSYihgJxobQ0y7F4y
         KUR2HwmcxCNn91DZOluTcrijNc88u7sJvz0MS7Z8WmtySKulc8uT+tVPOZJY/xXxU4HW
         KO6MUpUSyRmLFQQ7Xb0pvgLn1oUkJDiE/CAnc48aR+lISikfqagHfBa57vgmOIoo+iEm
         3TW7vjStMQt10jTrqqxMoPNZYJyPY0uuQbCuY88CChmUzc1myTKNw4ArkC7gVX8qCRXr
         sYqQ==
X-Forwarded-Encrypted: i=1; AJvYcCWekO5U4OGtm9Q61Tbqh8mw6OUV1aEVHW3Y7ftmYBblq22KcrANTzgM/9rsGtEx9xk8DNfayFcyRXD5Y9UZA1tA/NlflBEYa8r5VaPkpaM=
X-Gm-Message-State: AOJu0YynQ5IEKDnzt4GADUli4JrxMJYq9x/s6MaMvIBicDwPyuv4GiLF
	uCPVCe15CiXrAXq0oP3PL2UgTdFlDmkm2koRC/O9MNShy8N4lzc+gD4r5DiktpWReBtrwAy7/tM
	Qpc74WSpm6N13BrInNH5/ghjatETggH9/aDTqTg==
X-Google-Smtp-Source: AGHT+IHnYaeIN8ZWl0ZQ8WXofu9hPBDLWpuV3nWBRIUpTlElCPA5mS+woRgk2jbu10j226lsCe2MzMmQBm1kyR19Puo=
X-Received: by 2002:a05:6871:286:b0:21f:d1e6:d8e8 with SMTP id
 i6-20020a056871028600b0021fd1e6d8e8mr1305710oae.39.1710407141441; Thu, 14 Mar
 2024 02:05:41 -0700 (PDT)
MIME-Version: 1.0
References: <alpine.DEB.2.22.394.2403131622020.853156@ubuntu-linux-20-04-desktop>
 <5bfd2a8e-afa9-4630-ae75-382edc943bc6@suse.com>
In-Reply-To: <5bfd2a8e-afa9-4630-ae75-382edc943bc6@suse.com>
From: George Dunlap <george.dunlap@cloud.com>
Date: Thu, 14 Mar 2024 09:05:30 +0000
Message-ID: <CA+zSX=bg-SPbiVCorGZUR=esMk_zviV6e0LcN9XHfzQzM9N5tw@mail.gmail.com>
Subject: Re: [PATCH] docs/misra: document the expected sizes of integer types
To: Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, andrew.cooper3@citrix.com, 
	bertrand.marquis@arm.com, julien@xen.org, michal.orzel@amd.com, 
	roger.pau@citrix.com, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 14, 2024 at 7:36=E2=80=AFAM Jan Beulich <jbeulich@suse.com> wro=
te:
>
> On 14.03.2024 00:23, Stefano Stabellini wrote:
> > Xen makes assumptions about the size of integer types on the various
> > architectures. Document these assumptions.
>
> This all reads as if we required exact widths. Is that really the case?

At least one thing here is that *all compilers on the architecture*
need to have the same idea.  If not, we absolutely need to change
"unsigned int" to "uint32_t" in any public interface.

A second thing is not only assumptions about minimum number of bits,
but about storage size and alignment.  Again, if we don't assume that
"unsigned int" is exactly 4 bytes, then we should go through and
change it to "uint32_t" anywhere that the size or alignment matter.

 -George

