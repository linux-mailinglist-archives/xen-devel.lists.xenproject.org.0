Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A9F0EA67495
	for <lists+xen-devel@lfdr.de>; Tue, 18 Mar 2025 14:12:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.919111.1323647 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuWje-000709-OX; Tue, 18 Mar 2025 13:11:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 919111.1323647; Tue, 18 Mar 2025 13:11:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuWje-0006xb-L0; Tue, 18 Mar 2025 13:11:58 +0000
Received: by outflank-mailman (input) for mailman id 919111;
 Tue, 18 Mar 2025 13:11:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0H9a=WF=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tuWjd-0006xV-J1
 for xen-devel@lists.xenproject.org; Tue, 18 Mar 2025 13:11:57 +0000
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [2a00:1450:4864:20::42d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8c7dfbef-03fa-11f0-9abb-95dc52dad729;
 Tue, 18 Mar 2025 14:11:48 +0100 (CET)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-3912e96c8e8so3623416f8f.2
 for <xen-devel@lists.xenproject.org>; Tue, 18 Mar 2025 06:11:48 -0700 (PDT)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-395c8975b83sm18677359f8f.52.2025.03.18.06.11.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Mar 2025 06:11:47 -0700 (PDT)
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
X-Inumbo-ID: 8c7dfbef-03fa-11f0-9abb-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1742303508; x=1742908308; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=af0l6Ity1oEgvpJOuUKir2VWs2oKMKFz/FduPxGLgl4=;
        b=m2u9dPu9VNmIEVIKcIOWP1Xj2fgA3QphKabTcZi3ANCBLquewsKVg2oeFty6+DGOY/
         GL0aE5D4AAmGzInYuvSv204vVQh02omhMpCtm+Jft14g87xlp+7vT8Z2L9wJoQL5VRzR
         sayYazGryCraEnS65OPILOtielJvzXB95tp4o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742303508; x=1742908308;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=af0l6Ity1oEgvpJOuUKir2VWs2oKMKFz/FduPxGLgl4=;
        b=pBvIJ/4kzZgWEh6AMN0oe5gaADWForO9O3R0Q2l9AWCWFttL+DnO9+aMFPLHW0S32D
         1nTPrWLs31HwO0QyPpnReFs1E/V+D9+kG9+9XoU5OgcAZX6yIPZYoKc4qh/ZcaSs/PW+
         AW+e9uK3FDo+u/0N8GfVY7/s5T2EUCySXxV94NLMf0vaMhQhaHnw/txVo9nF4yaLzvr0
         x7asgUC6EIeFJ4ipdWG6NmCO22KUAMu1CJTN1yqdnjMfhTisPjpI4FqZh0BUZ8c313vb
         5VdD6hMx5GhEDL/Y0NF74aMc3YAZ2gx/vF7IVwCwQQ9S6B3QVBp9KylOLzpcewOZkVBm
         sr+g==
X-Forwarded-Encrypted: i=1; AJvYcCVfpjEhZFwCSdAncyZL5Uma44b2g8M1PQ7DDKI8HCeQ71EI6GIy+vZt0L6R2Oc/zuZWZ4HyA63khGk=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yyv+QHKVjJJwykh2NMx7JnFYTWBEkI9hR81jpQkYCuI/3cw8xgY
	U62mD+n+8FN7cvreVxjJbynTuu2KXPhiN+np3rsuezir8dnAn6iDiqdbpjM8Xto=
X-Gm-Gg: ASbGncuH3jqNqYRiry+HuZzA15Reu4mGRW3FSyorBRwDwl6weyUORBqgcImF88kbk5n
	esrSkrs1Pf7aYwFzWVE9n2tEnSSw/MfwcfdUyCVu+4dgI7AmFqsKZ5l55XJI7KgkQlyf/OTYFBj
	bgme+szZxHo3+2nQzzYr1Cm5RiM8DG9HW6cATk76hdYO78Pu0f8OLE9TL/jGZeEMIbqeLyUHwbU
	YAIYoVHg+OD0K0FS7lTR5NucIEaW8XU7BpcAP4rwnw27fZJjkdUhz6tVwVm+soPrWs67pWUswMo
	Rls4IaIWksqPtygxTWe2N8IUIpyfX95u89VqSc84wwTEkZ/OJufZPZCB/IVNW/6GGICfJR+BxWn
	ZPhtkSnzG
X-Google-Smtp-Source: AGHT+IHxlMwra9f+FTK5JUjVveR6Z7y3PrcytmULTTcgiOdJK8poytvu6YDeIATPpbWX5DeNL4aDgw==
X-Received: by 2002:a05:6000:1fa5:b0:390:f55b:ba94 with SMTP id ffacd0b85a97d-3971d3336e4mr18591744f8f.13.1742303507684;
        Tue, 18 Mar 2025 06:11:47 -0700 (PDT)
Message-ID: <cc882f93-b5d0-45ad-bb2a-1c6b9455509b@citrix.com>
Date: Tue, 18 Mar 2025 13:11:46 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/5] x86/vga: fix mapping of the VGA text buffer
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
References: <20250318091904.52903-1-roger.pau@citrix.com>
 <20250318091904.52903-3-roger.pau@citrix.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20250318091904.52903-3-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 18/03/2025 9:19 am, Roger Pau Monne wrote:
> The call to ioremap_wc() in video_init() will always fail, because
> video_init() is called ahead of vm_init_type(), and so the underlying
> __vmap() call will fail to allocate the linear address space.
>
> Fix by reverting to the previous behavior and using ioremap() for the VGA
> text buffer.
>
> Fixes: 81d195c6c0e2 ('x86: introduce ioremap_wc()')
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

This is somewhat ugly.

ioremap() isn't really any better than ioremap_wc(); this only works
because plain ioremap() has a special case for the bottom 1M where it
does nothing and exits.

What's the consequence of ioremap_wc() failing?  Presumably nothing out
on the screen when using legacy text mode?

From that point of view, this is an improvement I suppose.

~Andrew

