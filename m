Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 68EE145E338
	for <lists+xen-devel@lfdr.de>; Fri, 26 Nov 2021 00:12:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.232091.402093 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqNud-0007V5-B0; Thu, 25 Nov 2021 23:12:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 232091.402093; Thu, 25 Nov 2021 23:12:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqNud-0007SR-84; Thu, 25 Nov 2021 23:12:19 +0000
Received: by outflank-mailman (input) for mailman id 232091;
 Thu, 25 Nov 2021 23:12:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zLcn=QM=tklengyel.com=tamas@srs-se1.protection.inumbo.net>)
 id 1mqNub-0007SL-VR
 for xen-devel@lists.xenproject.org; Thu, 25 Nov 2021 23:12:18 +0000
Received: from MTA-08-3.privateemail.com (mta-08-3.privateemail.com
 [198.54.127.61]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 20d402c3-4e45-11ec-a9d2-d9f7a1cc8784;
 Fri, 26 Nov 2021 00:12:16 +0100 (CET)
Received: from mta-08.privateemail.com (localhost [127.0.0.1])
 by mta-08.privateemail.com (Postfix) with ESMTP id 9F4C518000A2
 for <xen-devel@lists.xenproject.org>; Thu, 25 Nov 2021 18:12:14 -0500 (EST)
Received: from mail-yb1-f171.google.com (unknown [10.20.151.240])
 by mta-08.privateemail.com (Postfix) with ESMTPA id 7B4B3180009F
 for <xen-devel@lists.xenproject.org>; Thu, 25 Nov 2021 18:12:14 -0500 (EST)
Received: by mail-yb1-f171.google.com with SMTP id q74so15350826ybq.11
 for <xen-devel@lists.xenproject.org>; Thu, 25 Nov 2021 15:12:14 -0800 (PST)
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
X-Inumbo-ID: 20d402c3-4e45-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=tklengyel.com;
	s=default; t=1637881934;
	bh=HNy96XEdiZ/Me3QQJuJr6FSt9o8mdnUWqprGpvdQrGo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=crJiGUZe6ZULfy3GaezZvVvl/qMwPSRZq+JH9vkdn4tS+wn0rXrG6QzPSaxf37ouu
	 ZdsbizbnM/VpCzdt+72L4Tc01wPEZyf7PGwdcHmmro+i89c97bo/edbk2agayaeJDV
	 euZFP71iYfXzcC0Kh/InfllQiNLpq3cM8+Kz9E/5VEt3UWTEkQzLKh7YxDbWpsCoFV
	 BeaKFr74q0LxCeMw33ACDE69eAlZNdaXb7zunpjAChj0mwG2NH3qmP3Eh9JfxwUB+j
	 S28nU4Zv0BVzxqLe6FfOcfwlaXkGKrJO44/4Znswv3jEle+yF3xqdmIeDfp2rJUvgA
	 EcJc4rqZEqdHA==
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=tklengyel.com;
	s=default; t=1637881934;
	bh=HNy96XEdiZ/Me3QQJuJr6FSt9o8mdnUWqprGpvdQrGo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=crJiGUZe6ZULfy3GaezZvVvl/qMwPSRZq+JH9vkdn4tS+wn0rXrG6QzPSaxf37ouu
	 ZdsbizbnM/VpCzdt+72L4Tc01wPEZyf7PGwdcHmmro+i89c97bo/edbk2agayaeJDV
	 euZFP71iYfXzcC0Kh/InfllQiNLpq3cM8+Kz9E/5VEt3UWTEkQzLKh7YxDbWpsCoFV
	 BeaKFr74q0LxCeMw33ACDE69eAlZNdaXb7zunpjAChj0mwG2NH3qmP3Eh9JfxwUB+j
	 S28nU4Zv0BVzxqLe6FfOcfwlaXkGKrJO44/4Znswv3jEle+yF3xqdmIeDfp2rJUvgA
	 EcJc4rqZEqdHA==
X-Gm-Message-State: AOAM5339gmOVNDSMQ6Z8hOnfyMJT9WEgt6fYtkyRUSDQF188NrLRkwrB
	TfGAKm1IJpTVBxMGIzVonyh8lfYX/Nm4+FP5sP0=
X-Google-Smtp-Source: ABdhPJxC7BShi7L57o8W6ubcfcAq7DRGO9pvwvSvyA2wStNMXx43ZsBBN7FeExlcunZZtE8nD/y0OgLZMFC0T8tLK6Y=
X-Received: by 2002:a25:d895:: with SMTP id p143mr9930808ybg.513.1637881933805;
 Thu, 25 Nov 2021 15:12:13 -0800 (PST)
MIME-Version: 1.0
References: <1637880559-28821-1-git-send-email-olekstysh@gmail.com>
In-Reply-To: <1637880559-28821-1-git-send-email-olekstysh@gmail.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Thu, 25 Nov 2021 18:11:37 -0500
X-Gmail-Original-Message-ID: <CABfawh=mCHtWoFjT4TpSgHB5MJnZ2b7BVPGTCFMaR5BJ-jAi2w@mail.gmail.com>
Message-ID: <CABfawh=mCHtWoFjT4TpSgHB5MJnZ2b7BVPGTCFMaR5BJ-jAi2w@mail.gmail.com>
Subject: Re: [RFC?] xen/arm: memaccess: Pass struct npfec by reference in p2m_mem_access_check
To: Oleksandr Tyshchenko <olekstysh@gmail.com>
Cc: xen-devel@lists.xenproject.org, 
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, Alexandru Isaila <aisaila@bitdefender.com>, 
	Petre Pircalabu <ppircalabu@bitdefender.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Julien Grall <julien@xen.org>, Volodymyr Babchuk <volodymyr_babchuk@epam.com>, 
	Bertrand Marquis <bertrand.marquis@arm.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="UTF-8"
X-Virus-Scanned: ClamAV using ClamSMTP

On Thu, Nov 25, 2021 at 5:49 PM Oleksandr Tyshchenko
<olekstysh@gmail.com> wrote:
>
> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>
> Today I noticed a "note" when building Xen on Arm64 with
> aarch64-poky-linux-gcc (GCC) 9.3.0. It turned out that Andrew Cooper
> had alredy reported it before [1]:
>
> mem_access.c: In function 'p2m_mem_access_check':
> mem_access.c:227:6: note: parameter passing for argument of type
> 'const struct npfec' changed in GCC 9.1
>   227 | bool p2m_mem_access_check(paddr_t gpa, vaddr_t gla,
>                                   const struct npfec npfec)
>
> From the explanation I understand that nothing bad actually is going
> to happen in our case, it is harmless and shown to only draw our
> attention that the ABI changed due to bug (with passing bit-fields
> by value) fixed in GCC 9.1. This information doesn't mean much for us
> as Xen is an embedded project with no external linkage. But, of course,
> it would be better to eliminate the note. You can also find related
> information about the bug at [2].
>
> So make the note go away by passing bit-fields by reference.
>
> [1] https://www.mail-archive.com/xen-devel@lists.xenproject.org/msg87439.html
> [2] https://gcc.gnu.org/bugzilla/show_bug.cgi?id=88469
>
> Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

Acked-by: Tamas K Lengyel <tamas@tklengyel.com>

