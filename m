Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E68D9B48D6
	for <lists+xen-devel@lfdr.de>; Tue, 29 Oct 2024 13:01:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.827321.1241904 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5kuf-0004cQ-SX; Tue, 29 Oct 2024 12:01:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 827321.1241904; Tue, 29 Oct 2024 12:01:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5kuf-0004as-PK; Tue, 29 Oct 2024 12:01:29 +0000
Received: by outflank-mailman (input) for mailman id 827321;
 Tue, 29 Oct 2024 12:01:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YGhd=RZ=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1t5kue-0004am-VM
 for xen-devel@lists.xenproject.org; Tue, 29 Oct 2024 12:01:28 +0000
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [2a00:1450:4864:20::22f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 82fe9c68-95ed-11ef-a0c3-8be0dac302b0;
 Tue, 29 Oct 2024 13:01:21 +0100 (CET)
Received: by mail-lj1-x22f.google.com with SMTP id
 38308e7fff4ca-2fabb837ddbso80069141fa.1
 for <xen-devel@lists.xenproject.org>; Tue, 29 Oct 2024 05:01:21 -0700 (PDT)
Received: from [10.125.226.166] ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9b1e1a6b81sm467849866b.43.2024.10.29.05.01.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Oct 2024 05:01:18 -0700 (PDT)
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
X-Inumbo-ID: 82fe9c68-95ed-11ef-a0c3-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjoyMmYiLCJoZWxvIjoibWFpbC1sajEteDIyZi5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjgyZmU5YzY4LTk1ZWQtMTFlZi1hMGMzLThiZTBkYWMzMDJiMCIsInRzIjoxNzMwMjAzMjgxLjA0OTkwOSwic2VuZGVyIjoiYW5kcmV3LmNvb3BlckBjbG91ZC5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1730203280; x=1730808080; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=D1ttu8wS22dos3d3D6QFtJLcU/5NEphrLjP4oAOwKwg=;
        b=mexCPtTX7tPnFw7DoGbPaA/al9T25Wy47+AnNEwsEhzl8xXQypGyZisCbTJ1AON6Gy
         rEORlIK2PKm3Fp1m1gA0yxAx8fNvvZ/cydpHRUTiVpLnoliNW55aiyRx+rnU1Ipa2ImF
         ZAxs0ZM/t/Mcwhh7b1h//fkyCxuwCyeIe5tnA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730203280; x=1730808080;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=D1ttu8wS22dos3d3D6QFtJLcU/5NEphrLjP4oAOwKwg=;
        b=YC0F8BZtb+YCSZgv9UR55ZtIfL7XKFH+fF9rNUkSa4eCt8h9TDxMhF1899AwonYzFR
         H94k9uJU00hXU+t3tUvDjhuUJkPI3kugWFHSokjAUDA1HrxsN3NMV7mYdK8NAKEgE4Bw
         4WKO1Z//vsUlQx5i/scsYykEVPMtEOydlsyi6FbeGKTJYlQXIeu9qf3TT75HrPTPMAP0
         bIEEj0VbWNhFcsYDBSJOg+g+hyPOvu3JBmWcSuaRabss1BlXucnXpY+wyA3uxt6+U6RR
         a/4eqJp0KZbHQnqAtNr7AIh8JeG44Rpx7eVsqm9HZQcC9AfmXfaOJ5nDMqa3RcJxqnh+
         8Nrg==
X-Forwarded-Encrypted: i=1; AJvYcCUFirN4wO8tOAKj8pow1Nif0cLbpLKjTcFyufKSiBTWne/4sgLTzyps1esqS2apdFFzvO8L2g7uZJA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzxyjfVn+ZqMuN/ZAeStWCoS3vUKQuhTx0GlmJXqDlYwUyYTuzj
	AEc6l2PWHDqzIMay+KzZnmacF7jf32mjf8oN33AcrVqGuKIw2458+1rSvcAGxBE=
X-Google-Smtp-Source: AGHT+IEz7O3QjtLpLu6jeeaFO1fG47eNmeeyYrAQfMuZbLveRDoIvV1dnoqs4r73PpykCuGesIX31g==
X-Received: by 2002:a2e:a587:0:b0:2fb:5014:aad4 with SMTP id 38308e7fff4ca-2fcbdf612dfmr71533861fa.9.1730203278862;
        Tue, 29 Oct 2024 05:01:18 -0700 (PDT)
Message-ID: <2181e8fc-1066-4749-abca-e4f0de084770@citrix.com>
Date: Tue, 29 Oct 2024 12:01:16 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Mini-OS PATCH] Add missing symbol exports for grub-pv
To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Juergen Gross <jgross@suse.com>, minios-devel@lists.xenproject.org,
 xen-devel@lists.xenproject.org, Natanael Copa <ncopa@alpinelinux.org>
References: <20241029114158.17231-1-jgross@suse.com> <ZyDL9fGtcouw9bar@begin>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <ZyDL9fGtcouw9bar@begin>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 29/10/2024 11:50 am, Samuel Thibault wrote:
> Juergen Gross, le mar. 29 oct. 2024 12:41:58 +0100, a ecrit:
>> Grub-pv needs start_info_union and phys_to_machine_mapping to be
>> accessible. Export both symbols.
>>
>> Fixes: 33411a11f848 ("Mini-OS: hide all symbols not exported via EXPORT_SYMBOLS()")
>> Reported-by: Natanael Copa <ncopa@alpinelinux.org>
>> Signed-off-by: Juergen Gross <jgross@suse.com>
> Reviewed-by: Samuel Thibault <samuel.thibault@ens-lyon.org>

Committed.

Jurgen, what do you want to do with updating 4.19?  Don't we need to
fork a 4.19 branch to avoid the CONFIG_XC change ?

~Andrew

