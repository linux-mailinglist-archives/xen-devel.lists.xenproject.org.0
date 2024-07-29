Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D1A2693F9E0
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jul 2024 17:53:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.766941.1177485 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sYSfk-0001c5-LF; Mon, 29 Jul 2024 15:52:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 766941.1177485; Mon, 29 Jul 2024 15:52:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sYSfk-0001a7-Hj; Mon, 29 Jul 2024 15:52:28 +0000
Received: by outflank-mailman (input) for mailman id 766941;
 Mon, 29 Jul 2024 15:52:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=U+rL=O5=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sYSfi-0001a1-Nk
 for xen-devel@lists.xenproject.org; Mon, 29 Jul 2024 15:52:26 +0000
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [2a00:1450:4864:20::229])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8cb7946e-4dc2-11ef-bc01-fd08da9f4363;
 Mon, 29 Jul 2024 17:52:25 +0200 (CEST)
Received: by mail-lj1-x229.google.com with SMTP id
 38308e7fff4ca-2f035ae1083so48584651fa.3
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jul 2024 08:52:25 -0700 (PDT)
Received: from [10.125.226.166] ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5ac64eb3111sm5954127a12.69.2024.07.29.08.52.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Jul 2024 08:52:24 -0700 (PDT)
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
X-Inumbo-ID: 8cb7946e-4dc2-11ef-bc01-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1722268345; x=1722873145; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=nv0j4OU+BIienT8K4WyNHHX1Z4IJTt9TYCyx7EZ/HNM=;
        b=ZxBkjCslob+Ia6WTjAAwjlz82pcQ5+kbZ5gFslQv8hfjtxuY8QxOk6j7PbZnev+7Lm
         MsyxWeonbTMzImGPurl6JZhVNJuP9JXxSCZYzzA2ebNZSNZH9mHh104ne99tX9LjZnEo
         ROIoXHkUmAjgXJGthRTg4nHzQBnYvER08nIo0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722268345; x=1722873145;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nv0j4OU+BIienT8K4WyNHHX1Z4IJTt9TYCyx7EZ/HNM=;
        b=Sncq94DAF5aEJwYvLj9+mKRymd4R12OGXjBl8w46TvBUDCVdh6O5rDIhq/yIZdiZS6
         1ZDNnCqe4H8eR3dz7PyOsHV34Stz88BEenSwBkbbejz5Cb+vv5pHB4PL7O+etnfCCHdS
         cfyBVo745oK0psBq+EicRv6gSTf4cFoQM5V3O5Za2jTH09zEK4nuP3xuZLD+8ZtOXtwH
         9vUzIoKPblQ7On4LKnaZup2wZl41ieLK5a6YA3/vCuXN27iBD53AFKr/5oAGVQrbp8Bb
         DUOnqdIA3FsvlabOC3K60bwLqa7K2Jw1MZw/4I0a/QqNc1pFyeydDD2mzIWSN7yCpi28
         7cUA==
X-Forwarded-Encrypted: i=1; AJvYcCXaTvsyZyoZPFtcOSpCIUCdY7KS7JFu9ZSIZb/GRlbAH1msECNwzKoaKxjeTNqA3q8KOjS8xc36m5uJzbcjw30kjDZJVSpbrnyNNt/ADiI=
X-Gm-Message-State: AOJu0YwkQ15e2dhfmDZr8d2H7V15pXtzo3/ARc9s/91Id6qp53IOYigI
	Qo41i4n6eL2ylO4WJxPJmZoa98wDDiAaWgEpXTOQGmfCzWfUZRJ+F7pYZkbJ9B4=
X-Google-Smtp-Source: AGHT+IH+I8Iq3Pr3UNAYqRuieBkDvhYHoUyY6bwV6Li/Jilx8Qb+Vt4k6+/STo6TNi35Q1e6PelghA==
X-Received: by 2002:a2e:9619:0:b0:2ef:2e3f:35da with SMTP id 38308e7fff4ca-2f12ee634famr48998341fa.45.1722268344464;
        Mon, 29 Jul 2024 08:52:24 -0700 (PDT)
Message-ID: <5aad5f48-e32e-4a59-bcef-05adec0ecbec@citrix.com>
Date: Mon, 29 Jul 2024 16:52:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/22] x86/dom0: only disable SMAP for the PV dom0 build
To: Jan Beulich <jbeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>
Cc: alejandro.vallejo@cloud.com, xen-devel@lists.xenproject.org
References: <20240726152206.28411-1-roger.pau@citrix.com>
 <20240726152206.28411-4-roger.pau@citrix.com>
 <b1918f51-1ac0-40f8-9174-d8161b2681dd@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <b1918f51-1ac0-40f8-9174-d8161b2681dd@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 29/07/2024 12:53 pm, Jan Beulich wrote:
> On 26.07.2024 17:21, Roger Pau Monne wrote:
>> The PVH dom0 builder doesn't switch page tables and has no need to run with
>> SMAP disabled.
>>
>> Put the SMAP disabling close to the code region where it's necessary, as it
>> then becomes obvious why switch_cr3_cr4() is required instead of
>> write_ptbase().
>>
>> Note removing SMAP from cr4_pv32_mask is not required, as we never jump into
>> guest context, and hence updating the value of cr4_pv32_mask is not relevant.
> I'm okay-ish with that being dropped, but iirc the goal was to keep the
> variable in sync with CPU state.

Removing SMAP from cr4_pv32_mask is necessary.

Otherwise IST vectors will reactive SMAP behind the back of the dombuilder.

This will probably only manifest in practice in a CONFIG_PV32=y build,
and with a poorly timed NMI.

~Andrew

