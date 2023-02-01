Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A4DB8686146
	for <lists+xen-devel@lfdr.de>; Wed,  1 Feb 2023 09:08:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.488154.756105 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pN8AB-0005on-B5; Wed, 01 Feb 2023 08:08:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 488154.756105; Wed, 01 Feb 2023 08:08:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pN8AB-0005lX-82; Wed, 01 Feb 2023 08:08:15 +0000
Received: by outflank-mailman (input) for mailman id 488154;
 Wed, 01 Feb 2023 08:08:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EYYs=55=gmail.com=xadimgnik@srs-se1.protection.inumbo.net>)
 id 1pN8A9-0005lR-Tw
 for xen-devel@lists.xenproject.org; Wed, 01 Feb 2023 08:08:13 +0000
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [2a00:1450:4864:20::433])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 92c48f74-a207-11ed-933c-83870f6b2ba8;
 Wed, 01 Feb 2023 09:08:13 +0100 (CET)
Received: by mail-wr1-x433.google.com with SMTP id t18so16478051wro.1
 for <xen-devel@lists.xenproject.org>; Wed, 01 Feb 2023 00:08:13 -0800 (PST)
Received: from [192.168.9.204] (54-240-197-238.amazon.com. [54.240.197.238])
 by smtp.gmail.com with ESMTPSA id
 z14-20020a5d4c8e000000b002bfc2d0eff0sm16515779wrs.47.2023.02.01.00.08.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Feb 2023 00:08:12 -0800 (PST)
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
X-Inumbo-ID: 92c48f74-a207-11ed-933c-83870f6b2ba8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XLlFUHrB4dqS6ExW87vO+DxepZQxoiFn7C/Z7E/edp4=;
        b=J5lsL/WvlJtpwlCkxaBIktDEmFrZq9do3LodWXecQIlaSN808M3PUJdPiaBlVjjEfL
         mxHMkeTCQm4kjvhJbIgJHNjua+Vongih/8x+9hB2vYXgA3xloASuVblM7sxGSRht/cUI
         7ni5SibR3vBuLiyowBC55G/fcqCcBaPRqsuJNE7BKVFMRj2jqkCTt9/aY9WDUn3o7Tsk
         YF5AOhzcXH9EVGMR53rq5US5f268bcqn5JQ/YiH4cGmD5co84T28Hl161CAGeNvn9Qlr
         Oc883oIWTm3Q8ZpdOW6FHtZvgsYNtqYBDpgHpFo22uCXCog+UvdpCC3OuP5RZlR0N5GS
         jnmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XLlFUHrB4dqS6ExW87vO+DxepZQxoiFn7C/Z7E/edp4=;
        b=eZuqEaEmMEcEzGuhcfP8aSyw2qwwuzAZSJlJjDI8ldv7WRdxm6iCR7o/ZKFU0bCoqv
         6lcog/VnqV3oizPkLtm6LSZq/3HXq8kK4p8kJmHBEScOF+NGKX+n/LH8r7R9FM29qjdY
         e9N2iODQPlO281RshSyJe22uPAfQ1J4fcVjqcUCCzM0oJvdPRcnarc/bBI6voHp1EPhg
         Yskx9e/ShwMusGY9qLcnArfqbFovekf7zdxMGXDOPZ1Lww3L0Q7GRb+w+Quk8+QN9X1K
         jRb7QqyXWeO/vAq0UDzzTSVhJ3YEK5B6neQmJqlNV1gA07n9qFdGlolNlEdpuyIrM0LK
         T5/w==
X-Gm-Message-State: AO0yUKWtqudO9Bg1IWV/IGE8ETv5+R2SKEUHgLgooRgagpI0RYQlSp80
	s2K18rMdjo1pT5eRJpRVqAM=
X-Google-Smtp-Source: AK7set8LPP76RGbDt/11bG6XWEjesbfQuJXYL/6cDcAr8FSy4JhHXJC9/IJSIGblrRI1R1oIYFvIMQ==
X-Received: by 2002:adf:f54a:0:b0:2bf:e7f0:b273 with SMTP id j10-20020adff54a000000b002bfe7f0b273mr1521846wrp.18.1675238892660;
        Wed, 01 Feb 2023 00:08:12 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <6153d2e4-c00b-f966-f2f8-7eb34270dfd1@xen.org>
Date: Wed, 1 Feb 2023 08:08:08 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Reply-To: paul@xen.org
Subject: Re: [QEMU][PATCH v5 05/10] include/hw/xen/xen_common: return error
 from xen_create_ioreq_server
Content-Language: en-US
To: Vikram Garhwal <vikram.garhwal@amd.com>, qemu-devel@nongnu.org
Cc: xen-devel@lists.xenproject.org, stefano.stabellini@amd.com,
 alex.bennee@linaro.org, Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>
References: <20230131225149.14764-1-vikram.garhwal@amd.com>
 <20230131225149.14764-6-vikram.garhwal@amd.com>
Organization: Xen Project
In-Reply-To: <20230131225149.14764-6-vikram.garhwal@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 31/01/2023 22:51, Vikram Garhwal wrote:
> From: Stefano Stabellini <stefano.stabellini@amd.com>
> 
> This is done to prepare for enabling xenpv support for ARM architecture.
> On ARM it is possible to have a functioning xenpv machine with only the
> PV backends and no IOREQ server. If the IOREQ server creation fails,
> continue to the PV backends initialization.
> 
> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
> Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
> ---
>   include/hw/xen/xen_common.h | 13 ++++++++-----
>   1 file changed, 8 insertions(+), 5 deletions(-)
> 

Reviewed-by: Paul Durrant <paul@xen.org>


