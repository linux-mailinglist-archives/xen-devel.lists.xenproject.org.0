Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D576B9628DF
	for <lists+xen-devel@lfdr.de>; Wed, 28 Aug 2024 15:40:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.784844.1194250 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sjIuO-000337-Cl; Wed, 28 Aug 2024 13:40:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 784844.1194250; Wed, 28 Aug 2024 13:40:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sjIuO-00030t-A9; Wed, 28 Aug 2024 13:40:24 +0000
Received: by outflank-mailman (input) for mailman id 784844;
 Wed, 28 Aug 2024 13:40:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mQTD=P3=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sjIuN-00030i-53
 for xen-devel@lists.xenproject.org; Wed, 28 Aug 2024 13:40:23 +0000
Received: from mail-qv1-xf33.google.com (mail-qv1-xf33.google.com
 [2607:f8b0:4864:20::f33])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 11ae08e9-6543-11ef-99a0-01e77a169b0f;
 Wed, 28 Aug 2024 15:40:21 +0200 (CEST)
Received: by mail-qv1-xf33.google.com with SMTP id
 6a1803df08f44-6bf705959f1so6016516d6.1
 for <xen-devel@lists.xenproject.org>; Wed, 28 Aug 2024 06:40:21 -0700 (PDT)
Received: from [10.125.226.166] ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6c162db0acdsm65691636d6.85.2024.08.28.06.40.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Aug 2024 06:40:19 -0700 (PDT)
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
X-Inumbo-ID: 11ae08e9-6543-11ef-99a0-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1724852420; x=1725457220; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=QU5S5X0NULHTM1QIsTLILDFcVu9I2b5MsJCxlya5c9o=;
        b=etRZwNydqxoRB6G/2wijNi81H/TL4uWxFJ2qapA8Bkuo/gPi+2Qd/uwka4dBAMZ/Jq
         czRCHXRLdZr07RH+UvQ/WZdkmRsS/fEb3LUOC/jE2V8g4T6WY9XT/uEgXpgub90U0v9U
         kVADOt0LalJgjTc/IsZLx+4h+rfOa4vMDfZhM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724852420; x=1725457220;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QU5S5X0NULHTM1QIsTLILDFcVu9I2b5MsJCxlya5c9o=;
        b=gYh6jXpusVyDhzKA2vngFsja0pIPL1HeKO+aHdK3DO+EDrkodGr610p6IA870OY2BP
         ASfugbPqYDLzQG3No82Sn5/BwbNtlGmWNJuxWhmxZgY1z5sMbA1gjxBEqeXIL8ZCJyTa
         WeCdTjGgpGxLPPnkIPC7Xt9ogxKOIKvZik15qobrH6bs8UthPQblguwfsoRPHDix89qV
         qdbqaje5af+uh39NW75eczNYU7PfJ10gnDXpmW6x2UZraI4k1Vo36m7hiGYES+aQ9MNn
         w6NcljOOAYT9ho6S4zd4hFKRkHjvTfFD4LWltGzLDmL7JDihTtaMVwW0pcOma2eWEIeo
         8ZFg==
X-Forwarded-Encrypted: i=1; AJvYcCX26dgM5LG95c5zDuiUZIO+BuK9H+ZIA6AyDPPK9kOZtyu0nKlsR8lVgIryt8SniBm5zOXNd3fFqL4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzimbyLPWofNdBa3DTWV1hBxW7P7EMTANC/aActpn01OIJOP6tw
	rwWD6aALkxhXenGWriqcP0AQEmPLC2PqoBYcMKa5LI94nOjUetkqnOfP7+wUMi4w3IPwIzszq0h
	O
X-Google-Smtp-Source: AGHT+IFdAZdXdMzcbAd1CF1VlmVe/taoIoR0YrI4Bm0cIqNTMUaofUks2gfxUJTUZyr++FG0l8X1Yg==
X-Received: by 2002:a05:6214:5b84:b0:6bb:bf27:8a15 with SMTP id 6a1803df08f44-6c335d10dabmr42515096d6.3.1724852419890;
        Wed, 28 Aug 2024 06:40:19 -0700 (PDT)
Message-ID: <cfa79e7e-9e2e-4273-848c-dc4edd761e7c@citrix.com>
Date: Wed, 28 Aug 2024 14:40:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] oss-fuzz: Fix coverage runtime error
To: Tamas K Lengyel <tamas@tklengyel.com>, xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Jan Beulich <jbeulich@suse.com>
References: <20240828133823.1114-1-tamas@tklengyel.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20240828133823.1114-1-tamas@tklengyel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 28/08/2024 2:38 pm, Tamas K Lengyel wrote:
> The oss-fuzz infrastructure collects runtime coverage information for debugging
> and fuzzing evaluation. Currently it appears broken due to missing C files.
> This is because the fuzzer's Makefile only symlinks the C files from various
> locations in the Xen source tree into the build folder. These symlinks however
> are gone as oss-fuzz uses separate docker containers for the build and for the
> run.
>
> Update the oss-fuzz build script to copy the required C files into the
> build folder to fix this oss-fuzz specific issue.
>
> Signed-off-by: Tamas K Lengyel <tamas@tklengyel.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

Thanks for looking into this.

