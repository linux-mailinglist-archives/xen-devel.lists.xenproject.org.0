Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EAB5B58B88
	for <lists+xen-devel@lfdr.de>; Tue, 16 Sep 2025 03:53:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1124487.1466812 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uyKsI-0006Aa-MG; Tue, 16 Sep 2025 01:52:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1124487.1466812; Tue, 16 Sep 2025 01:52:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uyKsI-00068e-G7; Tue, 16 Sep 2025 01:52:54 +0000
Received: by outflank-mailman (input) for mailman id 1124487;
 Tue, 16 Sep 2025 01:52:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=KURy=33=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uyKsH-00068W-Mh
 for xen-devel@lists.xenproject.org; Tue, 16 Sep 2025 01:52:53 +0000
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [2a00:1450:4864:20::435])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id da6be9c3-929f-11f0-9d13-b5c5bf9af7f9;
 Tue, 16 Sep 2025 03:52:51 +0200 (CEST)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-3ebe8dc13a3so697729f8f.3
 for <xen-devel@lists.xenproject.org>; Mon, 15 Sep 2025 18:52:51 -0700 (PDT)
Received: from [172.20.3.155] ([12.157.112.82])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-32ea41d3e19sm236103a91.11.2025.09.15.18.52.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Sep 2025 18:52:50 -0700 (PDT)
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
X-Inumbo-ID: da6be9c3-929f-11f0-9d13-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1757987571; x=1758592371; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:cc:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bTA5cgKGgBiuphRp7mP3u6Gnvre7ZlNtP4IpL5fN19o=;
        b=G9+kdw5sCs1zW3PurEyggg21GPWXsYBODak1zipNH0TlJmjlTXmyJ7RpPb7GK0ZjPw
         aIAgB8pCkqJ1Ft9/JM8nmpNM9H/vGOdT3yg1eSiKVCBN29rf0NETBw5BuC4250ZUXAAZ
         c8VPB1R6SbjA/ZHT5BndrjopDWPb+WerdMOJ3M9FuMVT1nfu4wq10oBHk7AzMHh2rC8E
         RTQLIYoJcTFj9+CN+awprQ6VphzQjrjEda0+8OZyM8enIQobScJkCH/jkdsZN8JHJ6Yl
         ubHBnB2OTcnIcP707++KAK4If83/9z36an79Mb05kuymPXm5rZWX2GNTLQIAHN3lxC20
         izaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757987571; x=1758592371;
        h=content-transfer-encoding:in-reply-to:from:cc:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bTA5cgKGgBiuphRp7mP3u6Gnvre7ZlNtP4IpL5fN19o=;
        b=lI5f2wU7bi4Q2UgcxiDACOhmGVA3LdtzpwrWq3yuh+xEr77Xc+FZf9totnWpEApckS
         PmoYhFB1NRaQSpX+fok3wCTsJTAhJfQQKlk1Fxf0yqEIW4N2UsCNVGP8BeKycgZ2UJHo
         1c5bE3BhxVusBlieFA8B4Ny2rhAOg0Pi8qe9JQqv2vZflgZhxVPFWwbIGPA3bh8ys3gP
         c1cz4UsrZAako3kv4ba5RBpBtPKfg8PczASZwkX5h3SrCOHwW57QjnU0I7jYvHprpmNt
         nAtKL3TBpaloU5qYLblluwWFUQeNKvNH58C5g2xhps+PqpGHdAHOLHHN+g5/YkMaLyKV
         Kexw==
X-Gm-Message-State: AOJu0Yxs/vSqT/XwJHt5+a5FH8ZmazQurosD2iiYwFHnul/l5RPjKwfH
	e6BqiUnSexORlc6obhx3VwwJDmwGJ+IFslaskgCTkrB2u8bgl2ZHjeOzhNlrhNUn8g==
X-Gm-Gg: ASbGnctZZbJgZHwZQkGYLh89XafYOfchNYyI6M8t8d/3D0t5JOihJJuxlxdMi3eBvjT
	oAPzz3gJYGVfNAS+QeTU6PPkQp+XXDyThC9rDy95V3LLAQBQNMzNZPluKnFD7JP+6l1dBEI3GC8
	FsYbkOfqOWW+oc/2Hs2sHbCvBjC+714odqK1LrqDPevhgvc5DBgU+2PE2f1rGV0Ka/e0jJdJFVr
	CfGVnyK9qhBAG7xghpe0RhSmKD6TceNyt+NapX0d94G9ceO+GQH0//7x9I5HFVBiSpK+sYK4N09
	yLsugkvs2n7l/zNSs0aXI7nMlqpd6p/Me6jC0r+1YMCXMCJifm9poofEwLZxKYYt+r7fEI6xtO9
	mahytkyDLmkoK/7sXAQaNOBagSJuc4Uk=
X-Google-Smtp-Source: AGHT+IEpJkzEeA/kd4GuzYObfhnHnswToz97S95soyEjoJnKdBc5H2XFfzGincPgU8veGYERV79B/Q==
X-Received: by 2002:a5d:4d81:0:b0:3e7:bbaf:6a07 with SMTP id ffacd0b85a97d-3e7bbbeb55cmr8086260f8f.6.1757987570634;
        Mon, 15 Sep 2025 18:52:50 -0700 (PDT)
Message-ID: <7228afa5-6ebc-4fdd-8181-b30c78417767@suse.com>
Date: Tue, 16 Sep 2025 03:52:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [llvm coverage] Update LLVM profile raw format from v4 to v10
To: Saman Dehghan <samaan.dehghan@gmail.com>
References: <12f2f3bd9010422004c38c23f6758c87df8682a5.1757951300.git.samaan.dehghan@gmail.com>
Content-Language: en-US
Cc: xen-devel@lists.xenproject.org
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <12f2f3bd9010422004c38c23f6758c87df8682a5.1757951300.git.samaan.dehghan@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 15.09.2025 18:56, Saman Dehghan wrote:
> This patch updates the LLVM profile raw format in
> `xen/common/coverage/llvm.c` from version 4 to version 10,
> enabling compatibility with LLVM versions 19 and 20.
> While the patch supports only one version:
> 1. It seems better to support one version than no version --
>    the current profile version 4 is not compatible with
>    LLVM version 11 or later

Indeed.

> 2. The patch could be extended to support multiple
>    LLVM profile versions, e.g., from 5 to 10

Would certainly be nice, perhaps as a follow-on.

> The llvm-cov toolchain, with its Source-based Code Coverage,
> offers two substantial advantages over gcov:
>   - More accurate coverage reporting when compiler optimizations
>     are enabled, ensuring better analysis of optimized code.
>   - Better tracking of coverage across inlined function boundaries,
>     critical for complex control flows in Xen.
> 
> Overall, this change would enhance Xen's code coverage analysis
> capabilities by leveraging the latest LLVM toolchain improvements,
> particularly for safety-critical hypervisor code.
> 
> The patch modifies only `xen/common/coverage/llvm.c`,
> maintaining API compatibility while enabling modern toolchain support.
> Testing was performed with LLVM 19 and 20 to confirm functionality.
> 
> ---

What's missing in any event is your Signed-off-by:.

Jan

