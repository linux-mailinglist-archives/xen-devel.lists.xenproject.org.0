Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 16E2FBB95B3
	for <lists+xen-devel@lfdr.de>; Sun, 05 Oct 2025 13:05:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1137588.1473605 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v5MXS-0001RG-AN; Sun, 05 Oct 2025 11:04:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1137588.1473605; Sun, 05 Oct 2025 11:04:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v5MXS-0001OQ-6d; Sun, 05 Oct 2025 11:04:26 +0000
Received: by outflank-mailman (input) for mailman id 1137588;
 Sun, 05 Oct 2025 11:04:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dr0i=4O=citrix.com=andrew.cooper3@srs-se1.protection.inumbo.net>)
 id 1v5MXR-0001OK-3L
 for xen-devel@lists.xenproject.org; Sun, 05 Oct 2025 11:04:25 +0000
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [2a00:1450:4864:20::42c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0c5625a6-a1db-11f0-9809-7dc792cee155;
 Sun, 05 Oct 2025 13:04:22 +0200 (CEST)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-3ecde0be34eso2565129f8f.1
 for <xen-devel@lists.xenproject.org>; Sun, 05 Oct 2025 04:04:22 -0700 (PDT)
Received: from [192.168.1.183] (host-92-22-57-86.as13285.net. [92.22.57.86])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4255d8f017esm16408913f8f.47.2025.10.05.04.04.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 05 Oct 2025 04:04:21 -0700 (PDT)
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
X-Inumbo-ID: 0c5625a6-a1db-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1759662262; x=1760267062; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=fYCEMSjHOTLgoFEpibhiw4BWGlHfLgPbNWAgu1n2jjw=;
        b=F1iSeGV6GavJyQIS+T8Iu83hvnXbSGrodeekdP1P48H5lNtzgcPWL7j5BhS3ubegrY
         fCcZ0T3Fi5a0nYoRZWFCkhdgROcVdOrnU5Br7TIY7a5iP65I16dEAA88Yd4rL9s9gYPw
         iNzeQA+txegZB9eH8jeg0H0N8oQb3HUbCjTxo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759662262; x=1760267062;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fYCEMSjHOTLgoFEpibhiw4BWGlHfLgPbNWAgu1n2jjw=;
        b=CUGcq7HCfOownrD9jUKAKq6yXiOdu5u6m0fDgHUc6uQlQELvcU5LIhFuBskb0U68Ge
         dcOMR2Z7QvByWpEDA1V9ZHXybbHJtzYJF2hrBuqbH0V9O7jJYr1Se1mJNIaK/45Raypp
         +UCVQinxpEjRVG8n7RzR/d7WMGeqpWv3vi2XODQdGwkAwmIYVUkrhXU3yMeKgjPPsx4z
         UD8SzxYllTrCsiD7fxh9DrWwKMQ3miOx6w2rjYXh93c9pD+H1H6aN8H1uXFocjbtMK5L
         6BQfVogItyeYGrAMyoLqLNp1StYDzrP6oORjOp9JWs6fE7yU0egqyygsDaElLYjRPuwx
         DtXQ==
X-Forwarded-Encrypted: i=1; AJvYcCWKb+l1jP8OIhlMsYGIixRylglnKuFSRfTmrSIGw0TY8W1m3+6WMjZySKtSHWHMnlyviaDJob53hPY=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw9DQQN3UUBWckUg8Fgxk65X/kfMVan3DT4OES53nI3tsFg67jy
	ztcoDWlrrU7Zwp+cjM4G4FE6zHt9SrO4sOLJBYpR/l0d1ed/oFPUm1a2UcLY2b6fY0U=
X-Gm-Gg: ASbGncvzvGo4ztSh9kM0b6wBLJP1nwk+7507hTEbHm+2PUecyqSkRoKxMZXmnze+gYF
	epyR8KpFbDcGw3twImJKbqGC6kA56zV1Sq9irbzLTjDLEYJITXaqZeiJtFNlCaQEo4Y3hngBHzE
	prYa65BPf2DlG74CAK76/DrETortERqKUrtNk9mFV/S0Gu7BEMLWWtUST5PcNmYsjJDD0QIs7pm
	xQpqXktQZ/TpPo2EaE01djWagJ+FbbQYhAh2F0jTwZ8aKeCwbcqRlUIMsuFkQIbTCpzq7JyL4q8
	c1n7Y29qx9F28r6WN6blzivLVXcTqFlWXpHR/vztWIQIns9Agv9HJGNSHRh8Uv4me/0xJxVr3aY
	Mo+iPumr4O7YHQgNE7/FCXghXE/XlKMVt1tmoQNLHmBXMudGz644RaRLizTXeN90u8QRqaow+CW
	lKteKXKBn5WV1KQz3ehgaBIFI=
X-Google-Smtp-Source: AGHT+IFGJvgg9b8K6cXmfkz50e0hbFIpYJAJSpAUw6LA2fV1y+2cjYeOk9iPuwDF6xnPaxIbrtvRGQ==
X-Received: by 2002:a5d:5f83:0:b0:3ec:d9a8:3700 with SMTP id ffacd0b85a97d-42566c4b928mr6089724f8f.23.1759662262082;
        Sun, 05 Oct 2025 04:04:22 -0700 (PDT)
Message-ID: <9c5c6748-84c4-4be3-859c-929b3ded5afd@citrix.com>
Date: Sun, 5 Oct 2025 12:04:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] libs/guest: don't use unsigned long as type for PFNs
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Jason Andryuk <jason.andryuk@amd.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Luca Fancellu <luca.fancellu@arm.com>
References: <20251005091845.3725-1-jgross@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20251005091845.3725-1-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 05/10/2025 10:18 am, Juergen Gross wrote:
> Declarations of xc_dom_console_init() and
> xc_dom_console_set_disconnected() in libxenguest.h don't match their
> implementation in the library.

"Under arm32, xen_pfn_t is a uint64_t and wider than unsigned long."

>
> Use xen_pfn_t for PFNs in the library to fix that.
>
> Fixes: b6fc307b0b00 ("libs/guest: Set console as disconnected on resume")
> Fixes: 971b7d5ecbcd ("libs/guest: Set console page to disconnected")
> Reported-by: Luca Fancellu <luca.fancellu@arm.com>
> Signed-off-by: Juergen Gross <jgross@suse.com>

For this patch, Reveiwed-by: Andrew Cooper <andrew.cooper3@citrix.com>

However, another bug in these patches is the use of pfn.  gfn is the
correct term to be using.

~Andrew

