Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F316CAC5B2F
	for <lists+xen-devel@lfdr.de>; Tue, 27 May 2025 22:03:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.998741.1379465 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uK0W5-0001ox-70; Tue, 27 May 2025 20:03:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 998741.1379465; Tue, 27 May 2025 20:03:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uK0W5-0001mA-3f; Tue, 27 May 2025 20:03:17 +0000
Received: by outflank-mailman (input) for mailman id 998741;
 Tue, 27 May 2025 20:03:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Xrmh=YL=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1uK0W3-0001m4-UV
 for xen-devel@lists.xenproject.org; Tue, 27 May 2025 20:03:15 +0000
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [2a00:1450:4864:20::52e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9f95cfd5-3b35-11f0-a2fe-13f23c93f187;
 Tue, 27 May 2025 22:03:14 +0200 (CEST)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-6049431b0e9so3688437a12.0
 for <xen-devel@lists.xenproject.org>; Tue, 27 May 2025 13:03:14 -0700 (PDT)
Received: from [192.168.1.183] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-60517a7cc93sm56762a12.56.2025.05.27.13.03.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 May 2025 13:03:12 -0700 (PDT)
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
X-Inumbo-ID: 9f95cfd5-3b35-11f0-a2fe-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1748376194; x=1748980994; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Gu7H+m0Pzp9L3ltUVMxaOznZEZoo6E9N6ddLmDRYqvc=;
        b=ctfHe+O6tzrMLDaqRLBw53u1HuaCBhs3En6huaa9cn9ONRg+rehFkiAW2ln22lifkX
         bCwcsKkQKS1BKY06AO7tvLSujARTtfn5O2Oufei2L9SEOlQoc30Zp6sW40N0sJNjgiKX
         rlHr/ttgtOwGcatSlqw0wUKZ0ESf0n7tRleLg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748376194; x=1748980994;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gu7H+m0Pzp9L3ltUVMxaOznZEZoo6E9N6ddLmDRYqvc=;
        b=OdeJ1sMR0TsJPIjM0jur3ua0Zdreuo8yLYdrroK7Z2nhAQBxtPCi9hpkEKxdURRoLU
         w+/1s+ohnHT5BJGpwOEF5bcfUVWJcNr2z5GS48rpqJsAkOA/hH9vn92cbADPWvUnAdS0
         PLKoBYoAd+c9KAPe4YH3qu3D6cM/wSW7944C/zhc7YfXwCcanrGIuaTORHuhNQfG9yVH
         wKRkHfxy7TxrU70gHqWHCqfwMKaRmTV0RL8sVgp024PhHVmsKLs3JWpoSeFAgvz1G/PF
         3S04OAfBI5OR23dzUMx3OuOY7KuhvTmW1TdT1gAZ+3R8CK6rK7xZmz0hbOcCZHxkdW1F
         AHYA==
X-Forwarded-Encrypted: i=1; AJvYcCW7u/kyJiIrXz07bfxMfuYOfxJ3CAghz2Wc40fq38iUT4VPBIJ8AAksaQuh6pT6fR3W9biPhoX/gf8=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz54WLiVfoJFlqhJ/13AOG+KhXan4VCIxQZWkPHMpcyS//EVQPe
	L7eh0OG0BagbPs6+QwyyGcays3WUgWdonFtXh2n4nU4DYGMDbZf7t6J1boN/yi2XWMw=
X-Gm-Gg: ASbGncuTs98A9fXgOpwHQCsdI+WCmqheF82Rif7R8J79vqdhxqQK9Eb8/q8tYzunOXT
	VWgm50i84+Yb7E1310YMhkkU2pnZgOZK86pblkv47SxCG9LSPRxi6rzfFmkEguAutiAU7H6pbpM
	07I1ptivg4BIHZ05m6eUyDL8ZiXubBPrwDpxyJrVuJSTKSKFkijYzuhuHmDlwd8Ph7cDcExSm1G
	81+RKL/LiEV5wNyU/K/co5VnlJquarjd9sRXA6pw0o9A0//ZAPA9CUoNOGCdQPQSajCj/TxVhXO
	EUgd669yX2UIz/gu5uizLe8Sb9oKkfQ6mRXFmsmnPjyFNo3fQtexHAdzzrtOy54uDM1sMM+sMMd
	Cdpkkif7PLiwvrHgFGCld793+HOQ=
X-Google-Smtp-Source: AGHT+IFPDBILA9OVcgzewwmD3SFdqalhiUyaHGgLxDKAWIC8Alk/MmG6KWHKS4rNfpzmVClD1Wa8+Q==
X-Received: by 2002:a05:6402:350f:b0:600:1167:7333 with SMTP id 4fb4d7f45d1cf-602d906c71dmr11883927a12.10.1748376193936;
        Tue, 27 May 2025 13:03:13 -0700 (PDT)
Message-ID: <2eac2199-f3e2-4fa8-b6e3-f6cbf999d436@citrix.com>
Date: Tue, 27 May 2025 21:03:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 0/3] xen/arm: Add option to optionally disable trapping
 on unmapped mmio
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, julien@xen.org, bertrand.marquis@arm.com,
 michal.orzel@amd.com, Volodymyr_Babchuk@epam.com, edgar.iglesias@amd.com
References: <20250527195616.874614-1-edgar.iglesias@gmail.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20250527195616.874614-1-edgar.iglesias@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 27/05/2025 8:56 pm, Edgar E. Iglesias wrote:
> From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>
>
> This follows up on the virtio-pci discussion and adds a per-domain
> option to select the behaviour of accesses to unmapped mmio ranges.
> The new option is trap-unmapped-mmio. For dom0less I negated it to
> be able to use a boolean prop and keep existing behaviour, i.e
> trap-unmapped-mmio-disabled.
>
> I'm happy with any name though so if you have better ideas please
> suggest them!
>
> For the domain config i followed the example of x86 flags
> and XEN_X86_MSR_RELXED, creating a flags field for ARM.
>
> Thanks,
> Edgar

I think this should be common, rather than ARM specific.

Traditionally on x86, access to unimplemented address space was ignored
(write discard, read ~0), but these days you do get a machine check on
certain ranges, which is for all intents and purposes the same as a data
abort.

So even if x86 requires it to be false in the short term, I think the
control ought to be common, so x86 and others can opt in at a later point.

I don't have a good suggestion for the name, but it's not really about
MMIO space; it's about address space generally.

~Andrew

