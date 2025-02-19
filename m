Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1349AA3BBD1
	for <lists+xen-devel@lfdr.de>; Wed, 19 Feb 2025 11:45:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.892623.1301586 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tkhZV-0008A1-E4; Wed, 19 Feb 2025 10:44:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 892623.1301586; Wed, 19 Feb 2025 10:44:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tkhZV-00088Y-BV; Wed, 19 Feb 2025 10:44:53 +0000
Received: by outflank-mailman (input) for mailman id 892623;
 Wed, 19 Feb 2025 10:44:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CKsl=VK=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tkhZU-00088S-OP
 for xen-devel@lists.xenproject.org; Wed, 19 Feb 2025 10:44:52 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8c4c7775-eeae-11ef-9aa8-95dc52dad729;
 Wed, 19 Feb 2025 11:44:51 +0100 (CET)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-4394036c0efso40801545e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 19 Feb 2025 02:44:51 -0800 (PST)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38f561bee3esm2906851f8f.21.2025.02.19.02.44.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Feb 2025 02:44:50 -0800 (PST)
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
X-Inumbo-ID: 8c4c7775-eeae-11ef-9aa8-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1739961891; x=1740566691; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=UgYwxqQAf64SOrT4GI68SDNWDkvdBCcxuhH/23/qN5Q=;
        b=gZHJaoEGuLb5D5c1tqO6LV0wT7RXDXPsnthQveJblrGXnNtu1BmOUe4w0ZWwYz0YZP
         4A/ocK4VdhDnkl36SjpxOh3gewiW4RDymJhjkKKaDqkhdWaQQ/uxPMRrzzXh+LIz5IFq
         y10qOWMxlcG+Zt6ZSqsutAYhHGSqWzrXidMKw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739961891; x=1740566691;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UgYwxqQAf64SOrT4GI68SDNWDkvdBCcxuhH/23/qN5Q=;
        b=OXqnsmfRdN3Ci+qy5NAaHUunHaXWdffQLaCiFRPUpn4DSqpE8s/yWl9vNGzXGGga2K
         g48fkm1hNfMnLtzKq4tGOPcWfHhrYphz6ZYTdYaK5Qdu7okR07XHUaYu1H4Lb5BtFihn
         l3SLhQZcaPyGKli3WTEVEnq89YRW/yotMP3xDZ8zgEFBkl+vB5IQHQXo58kbQfzYFkza
         vsD/aUpZ86oGSlDuiJ0uj4ZT0xQOsOFtneycKhRdg2e5JtA0SOX+Yi8QcKyI7MLUO7Ea
         gfPouiyOe8GKjkm299CWAK9v+ftETUvAgN4ZmHsOHMFk9zFuAV4Cqbr+PGKUpH1ZtSc1
         WAyA==
X-Forwarded-Encrypted: i=1; AJvYcCVAgTCTQ8PFdl0cBa5LWvDSVfWzgtPLvZHI3UZyecvEjqWEHjk+GdjtDA/5MmgiaLYkyI13xOkx4Lo=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx63gNPlOh2SjC/jabQaH9y7FrA1a6vCy0iyRu/3EHgGg4c/9yA
	LAJ2JGAvehl1TjWyXeWmQQ4V6rgzvht5VDt+hZYs1PuZb4fMM2ogKg5BRdsiveI=
X-Gm-Gg: ASbGncsu05z/WKX9kvHaJjdp+xx0+gyfatCZGQwEJv5U0I7AEp37GBJ9lg8Mda3iBJ1
	nEgTxcFqDqB3YS5RVsUn4oqARqHm0XnEujG2u7BzLeOSc+vMA0r0DL3aDabR4spAYFOse5T51T4
	BsJ2J5p63aBCPbT7LY6PUCzZ+EcAZqPhWDr3uWvOvYfZgT6io/EIvdDHmlyPw+3g2aayNTpv7iA
	wqURe/EbP+IRw4/gDG44ROOiosQjEKmFnmt3A8NxIEIqwsPBWJueK4LomeQk9lHrk72wcs4rQIg
	PBkbUkluwoIpUWQAEFNFmrNJsneP5lmajGBOPlc1XXXNNKj48FYxYlM=
X-Google-Smtp-Source: AGHT+IF8nzlj/fJl8b8AqCpTRISeRVzybXrq5LRkqZ8i2uj7imPJ9MBCVJkkdrsyOmUt8jKUJhexDQ==
X-Received: by 2002:a05:6000:1864:b0:38d:e48b:1787 with SMTP id ffacd0b85a97d-38f5878c7b9mr2734378f8f.14.1739961891281;
        Wed, 19 Feb 2025 02:44:51 -0800 (PST)
Message-ID: <84298eb0-42cb-4967-b382-71cb309a7359@citrix.com>
Date: Wed, 19 Feb 2025 10:44:50 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/MCE-telem: adjust cookie definition
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <stefano@stabellini.net>,
 Nicola Vetrini <nicola.vetrini@bugseng.com>
References: <bd74b357-b254-4c43-a417-f26434361340@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <bd74b357-b254-4c43-a417-f26434361340@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 19/02/2025 10:00 am, Jan Beulich wrote:
> struct mctelem_ent is opaque outside of mcetelem.c; the cookie
> abstraction exists - afaict - just to achieve this opaqueness. Then it
> is irrelevant though which kind of pointer mctelem_cookie_t resolves to.
> IOW we can as well use struct mctelem_ent there, allowing to remove the
> casts from COOKIE2MCTE() and MCTE2COOKIE(). Their removal addresses
> Misra C:2012 rule 11.2 ("Conversions shall not be performed between a
> pointer to an incomplete type and any other type") violations.
>
> No functional change intended.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

https://gitlab.com/xen-project/people/andyhhp/xen/-/jobs/9181587757

Eclair does appear to be happy with this approach (assuming I stripped
down to only checking R11.2 correctly, and making it fatal).

For the change itself, it's an almost identical binary, differing only
in the string section which I expect means some embedded line numbers.

Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

