Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DA6DBA8B688
	for <lists+xen-devel@lfdr.de>; Wed, 16 Apr 2025 12:15:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.955427.1349204 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4zni-00088S-Mk; Wed, 16 Apr 2025 10:15:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 955427.1349204; Wed, 16 Apr 2025 10:15:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4zni-00086E-Jp; Wed, 16 Apr 2025 10:15:26 +0000
Received: by outflank-mailman (input) for mailman id 955427;
 Wed, 16 Apr 2025 10:15:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9TmO=XC=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1u4zng-000866-RB
 for xen-devel@lists.xenproject.org; Wed, 16 Apr 2025 10:15:24 +0000
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [2a00:1450:4864:20::429])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b4db6197-1aab-11f0-9ffb-bf95429c2676;
 Wed, 16 Apr 2025 12:15:22 +0200 (CEST)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-39129fc51f8so5726226f8f.0
 for <xen-devel@lists.xenproject.org>; Wed, 16 Apr 2025 03:15:22 -0700 (PDT)
Received: from [192.168.1.183] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39eae97b249sm16855406f8f.58.2025.04.16.03.15.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Apr 2025 03:15:21 -0700 (PDT)
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
X-Inumbo-ID: b4db6197-1aab-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1744798522; x=1745403322; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=YBR5stUE2ekUxwuvmxA3aFTitiAgfhMWKZkkaBi47rI=;
        b=KsXTWTqBGY8qe4MDa3f7DL4K+l7UwrcL0CsYuY/KZGar7UpgLJheE1Kv9oBzzuLCux
         goF/uqAUye5lpj8VF4EBkgEXjh4h4wzCFmgvP/Oa6FATPjuh3SzAsgF6kGyiBWmWnTTK
         2LiUkGfzf4p7s+S28w9iycPhwo6EBRoiRwMEo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744798522; x=1745403322;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YBR5stUE2ekUxwuvmxA3aFTitiAgfhMWKZkkaBi47rI=;
        b=wlf5KrI98Fkm1Ndei003pRn0c/XeGydCZT9rzkAHFYYadrYi7EhYq9xw5MlYoLFVA0
         6YNk/UHikI3AcE8GqKi0QPzJPZYBB50wyjItff449eEuGG89AooRrJYBQaFy8LVmD6V3
         t1Cs4QFlzqubaiMAnTjg24mGlhwHgAqWCEUfHjNi+SH3dBBWNbNkXEsyhAoOPGDLFbtT
         EtzpMyL8j8kK9Cp5S3j1f2h33dRBK0+eCgwbZXA7JxsfSdzOV5goUZ5iM6yqvKRfBMUx
         R8lZa0biW8wNfkoO1oSBQaNh0S+C9ilB9y7TzAPJVQ6M3LNbOZNq60BjpAvZYxaB1Sxl
         nljw==
X-Gm-Message-State: AOJu0YwQbeGUvrYNvgTzBTRqB8tw3AAsEJLIdFXAjRncTOKnTi2XLy6U
	FUE4EHJv8ZF2KVo00ZYh9ASLOXE8FQqDn+36ZK2lcZQZL6qqh/5ibGdj7wxdziI=
X-Gm-Gg: ASbGncu8lQX7TZL2aFsu9eAEvmcJjvVhP6ySFoB7RZa6lJ1ti2I5t7f+wiY2AiUJORH
	IVVX8y7hqsETlBn800vQBHk5JeD3xVdoJN51kWm7Dt7xi4Ozs3KMSkeLtpYsLlvnijTHpbHjLjz
	srvhygcj2gIQcDlkDTx3O/FKYeXJhcxXMC+JS6mZDtflRBnJovj7BxiYB1YSeIft2VMeYZlkebR
	LMOdtmfovVwFHuTpJXUKy611sEEo3tW2AR9nzoVv0GvhU7vTSO4sbOlYy6Oc4m/xXBVAfQEFJv4
	l/VLpVSJSQKT6nWHQui6XOCxdItB+5LMXw3qHvzrT5poe4Nvgw63PKZhXy6f1jLZC6b7Cc+lNpU
	hidsEbEDc1Z4fLUP8
X-Google-Smtp-Source: AGHT+IHp9QeJP4hSEUGMSPkpIjpgeNFO5BrkMv0FwYVfZ2OtQZGzgbrv8k0SYg8kYzshFemFIAHXUg==
X-Received: by 2002:a05:6000:381:b0:391:3f4f:a17f with SMTP id ffacd0b85a97d-39ee5b8b921mr1158638f8f.42.1744798522283;
        Wed, 16 Apr 2025 03:15:22 -0700 (PDT)
Message-ID: <44efebcd-877e-46a3-a072-07c44fc29f27@citrix.com>
Date: Wed, 16 Apr 2025 11:15:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/7] Overhaul how Argo is built and packged
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Doug Goldstein <cardoe@cardoe.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, Jason Andryuk <jason.andryuk@amd.com>,
 "Daniel P . Smith" <dpsmith@apertussolutions.com>
References: <20250414101843.2348330-1-andrew.cooper3@citrix.com>
 <20250414101843.2348330-3-andrew.cooper3@citrix.com>
 <alpine.DEB.2.22.394.2504151645260.8008@ubuntu-linux-20-04-desktop>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <alpine.DEB.2.22.394.2504151645260.8008@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 16/04/2025 12:48 am, Stefano Stabellini wrote:
> On Mon, 14 Apr 2025, Andrew Cooper wrote:
>> Right now, the argo artefacts are a pile of files which the test has to turn
>> back into something which resembles a filesystem.  Furthermore, because we do
>> not build modules for the main kernel, it is extra important to make sure that
>> xen-argo.ko doesn't get out of sync.
>>
>> Build argo conditionally as part of the linux artefact.  It's ~100kb all
>> together, compared to ~14M for the kernel.
>>
>> Produce a single argo.cpio.gz with xen-argo.ko in the standard location.
>> Prune userspace down to just the executables and libraries.
>>
>> This is cribbed from the existing scripts/x86_64-linux-argo.sh, which stays in
>> place in the short term until Xen can be updated to use the new scheme.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Do we need to remove x86_64-argo-linux.sh?

Yes, but 4.20 still uses it.

One thing I'm not sure about is whether "keep latest artefact" is just
artefacts from the latest run, or the latest of each named artefact.

Now is as good a time to experiment as any.

~Andrew

