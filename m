Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A530BB14F38
	for <lists+xen-devel@lfdr.de>; Tue, 29 Jul 2025 16:29:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1062788.1428517 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uglKT-0000jw-J4; Tue, 29 Jul 2025 14:29:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1062788.1428517; Tue, 29 Jul 2025 14:29:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uglKT-0000iN-GF; Tue, 29 Jul 2025 14:29:21 +0000
Received: by outflank-mailman (input) for mailman id 1062788;
 Tue, 29 Jul 2025 14:29:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/H3U=2K=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1uglKR-0000iD-Mg
 for xen-devel@lists.xenproject.org; Tue, 29 Jul 2025 14:29:19 +0000
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [2a00:1450:4864:20::429])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 67f02c2d-6c88-11f0-b895-0df219b8e170;
 Tue, 29 Jul 2025 16:29:17 +0200 (CEST)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-3b7910123a0so794818f8f.1
 for <xen-devel@lists.xenproject.org>; Tue, 29 Jul 2025 07:29:16 -0700 (PDT)
Received: from [192.168.1.183] (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b789a31c4asm6122061f8f.17.2025.07.29.07.29.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Jul 2025 07:29:15 -0700 (PDT)
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
X-Inumbo-ID: 67f02c2d-6c88-11f0-b895-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1753799356; x=1754404156; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Ez5eoIhq9C6XaVPTAB4uq01PZ4UvOHyKN+44Q5JiEfM=;
        b=okxG0ODyeD51LgjCVYKORys2BCy3d2Ao1IaFOYrJ+jtAKYZwrtCA8kiXuPyzqzlDis
         AI6lQrd8cEcShMSO2eC4Y0NbwQOnnj1TGHnhxY5Q4EJZkeEt+WXvgbLcVb8QuHTsYqq/
         Et20MYfLSPzAt5qBst9daY30ECK66ZZVDqQwI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753799356; x=1754404156;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ez5eoIhq9C6XaVPTAB4uq01PZ4UvOHyKN+44Q5JiEfM=;
        b=GRjFBhig2N64KO2du/h6XW05xdlgmyUkw6wS58b91DdrpnEBh+T5Lj9LZ+7VrP7AwU
         YUUDw4Ui7t3XgweJzmWCL6s3fQbVRsTtxwdSUNvRW73+UyJ8BN/sZh93+xK4aLuloIYb
         Mf6gKkrqboGcNCLWIfSCx2SSPdoScBw3O1dt4JwD+ezNVlcRn3ORl13yOdWNWhsq+rDv
         UASlfob0H93wpnEBha7GVLGqkaIGQ0muyqQimrGTOzhkljvj3fIOMFqWm1vydJ0vNM+G
         564uoThjnDv47WltKxKxXrj2ZXHG8btBaieTTQtaAlIQlWMSKdzeeFM0RCUu4pdFFS2/
         BaMQ==
X-Forwarded-Encrypted: i=1; AJvYcCVafMowyTg1ovxtZD6TAZgkamjKRxXN0zJxfHe32v1dePLRtfnM6bCI3cCmQUQulZfe6+1llue8SAI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxojZRnJKs8PoBrlVgAiIQNa3yC55MJQ6xtRAH5TkPF+531mkaA
	Tpcl/nqOOGiOxq4QPF0BBznGkO4uDQn0NV9K6/SozjtfUKFBlytx4vRoBcC8IuKpp3M=
X-Gm-Gg: ASbGncvA9FSKHGE0LQrosu1FmG4Oc8f2SjaPX0G2v5wOJFsWdYT+mxmobfgm1ifCOXM
	iVEJgkrdxnfbielkd/VCZqrEwaOqox08gNyGPywdkPuC6YeaK3OXxJlTVR+nADCMxU30U3CHB1n
	D+qNUQNKWO6H1BDy5sA/OONV7Vp1Fqyb7scpkMU125/OhDf838o38cMvj/ZM+t6gJHtYRr4NsOT
	bDewfmyhu2aho/9sufrB9pwtqHw2HdKQpoJYG8n1q8g/Bmc8Rt8Lb2tzKRXX4bget/788zTAlRQ
	u1KGRyf9u+i9wpLARtW4avFaTSKJitjmoJsCFirqOvfAJbLEjrXYA9Ch8CrPuo9/QMz2BTMr2xF
	5Gm82INCrVOM0aJFpD4b5a1OeuZyKTUP0cc/eEbv/uXndK/Ussi8YOuSbIGPdoXQPNng5jwLJl+
	x+N+g=
X-Google-Smtp-Source: AGHT+IHXgREKD46bTMzl4TMKMImhsXf8bOMOIkWDzxasJvJWCkjqgRTCmh1AIJNRHERGkK0pXcck1Q==
X-Received: by 2002:a05:6000:240c:b0:3b7:93d3:f470 with SMTP id ffacd0b85a97d-3b793d3f71emr1077944f8f.58.1753799355878;
        Tue, 29 Jul 2025 07:29:15 -0700 (PDT)
Message-ID: <94ca0714-ee52-4d6c-ba4d-717594e83179@citrix.com>
Date: Tue, 29 Jul 2025 15:29:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] lib: drop size parameter from sort()'s swap callback
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Julien Grall <julien@xen.org>, Stefano Stabellini
 <sstabellini@kernel.org>, Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>
References: <fe3b486e-5122-4196-810b-38b3a58233bb@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <fe3b486e-5122-4196-810b-38b3a58233bb@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 29/07/2025 3:26 pm, Jan Beulich wrote:
> This was needed only for generic_swap(), which disappeared in
> 8cb0341a61fa ("xen/sort: Switch to an extern inline implementation").
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Oh, nice.

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

I'd expect there to be no change in generated code here, as everything
gets inlined.

~Andrew

