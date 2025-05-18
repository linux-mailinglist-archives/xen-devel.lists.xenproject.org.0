Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E150AABB014
	for <lists+xen-devel@lfdr.de>; Sun, 18 May 2025 13:30:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.988984.1373331 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uGcEA-0007Q5-5b; Sun, 18 May 2025 11:30:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 988984.1373331; Sun, 18 May 2025 11:30:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uGcEA-0007NB-34; Sun, 18 May 2025 11:30:46 +0000
Received: by outflank-mailman (input) for mailman id 988984;
 Sun, 18 May 2025 11:30:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=GB/u=YC=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uGcE8-0007N2-Ia
 for xen-devel@lists.xenproject.org; Sun, 18 May 2025 11:30:44 +0000
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [2a00:1450:4864:20::62b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 888e7552-33db-11f0-9eb8-5ba50f476ded;
 Sun, 18 May 2025 13:30:43 +0200 (CEST)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-ad2216ef31cso600628966b.1
 for <xen-devel@lists.xenproject.org>; Sun, 18 May 2025 04:30:43 -0700 (PDT)
Received: from [172.18.118.114] (ip-185-104-138-68.ptr.icomera.net.
 [185.104.138.68]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad52d278257sm432995566b.82.2025.05.18.04.30.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 18 May 2025 04:30:42 -0700 (PDT)
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
X-Inumbo-ID: 888e7552-33db-11f0-9eb8-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1747567842; x=1748172642; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fT5qFUdstaJsfU0VbsAMfpbT7j0sIORq0zcqhKf+2xc=;
        b=VKrYfExHvxnrStU2segaLEvPf5LbIeL6JjBgGzJ5NxtaAMv1Y+8AAqTm0tF7/XhJpi
         Fo2f0D25vACcXqH1/3G5ClXvfj4cq7IBOv/6qiT87I51NQE8dyxbOlukF7wFA08/by5F
         Gv7JTQB5ifgCpxn1P1NA0IrlmQH706gpGGYaIQSiJymZZb8MavbHFNGreTz++Q9WbD6f
         UJoZocgnMk2BPWunnMR8xY7lrbsFCLVJejC75mwj8GgOTaXWqaVeUJXvBYu6CDAtNZEI
         z2O1bHbcrWBQlA7oGFCSO8imIe8IcMQDBt6hbGgX42B0uWNTLSG2roaXJOPn+htNpBXK
         xWYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747567842; x=1748172642;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fT5qFUdstaJsfU0VbsAMfpbT7j0sIORq0zcqhKf+2xc=;
        b=REZqB16DjJZDI2m300IhIsOT8DY5uIIJZWylYNcRD0DDGV2psluONv3DtYS0GntdW3
         5G3NSyjmVdzzkvHl2z13zgqAc/tvQxDkpGOJ9nK9GNXhDOKbA/XCmzBDxuxsqHUppR3k
         W7PrLz/rszKEvPQpgmCgqw/zjaY3hQ/pu06h/9j0fqBHKuCE76/aVLeNfwgviMCLE+1o
         kjolzmbwFmb3hRVF8p19t+jmgycHWRy+YeuIUZKTZQ6ChMSazJ3t+oUiXMFO9Ut1TGi6
         PVfaMVmxXDszgv+35tP8UUGa1IVeXJdPKXOECQo8dQo/APxip/IZMBy+5Ylhj1XCUgiT
         n9iA==
X-Forwarded-Encrypted: i=1; AJvYcCU8aWJ/YpkZumeFAZ2qr+43BR9RCwSz56xzn4DcsnX5/R+Qiz08vk06Qqqo1hZo3aISGXMAnpPuVCw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwFPrMiuARiTEo1jmDZ2HJcXfHi9AJvlpfIkiFgBUMxlS3/L9pv
	M2GuFA4G0xRQBhlfDWXaEKkNkvAiEd9K/+6X/EDpknOHHg1hQ2Eeb+iathct8faajw==
X-Gm-Gg: ASbGnctCTbg+PFG82wqaLqtX9lqXqdT9wrev7DgWoPul3Yys3zred1FnuzyuplXthgv
	dqKN8jHXQBRCCQL9ULsyQGvyi+E2s41tZ/4voS+4HHP6vHCwDHnYk4jwCBd/oW+c6DgvZCX84Oa
	IiY9dL9zlPQAAWTZ/5O8t69OXFuSw85lu0KsKUH1bgePT1JYVRfd/MALU6zPoLPu/8CKQvuDka0
	IhNeoD/zdCVGViQxR+79wceO3UJ4G12/XtSFqsxy6g0m6d/U0NnzZm00RmGiESdA2w5/bEItmJv
	6YcJD6h2429jm72w4x5WMcwGT3mWINQINg70DDAWcXQvsGnxwfNJ+BydYGvpKHzt9lI/gUSWdC/
	NTWWYKIMgjbu2N3CeaCcS+cAl
X-Google-Smtp-Source: AGHT+IERauixBHvi4TculVjOfou45Ib1nbCipmzvzJd9op95368vhRnLGBsUEdgQdrZeatupDmQcMQ==
X-Received: by 2002:a17:906:580c:b0:ad5:4440:23 with SMTP id a640c23a62f3a-ad5444022c4mr461592666b.50.1747567842603;
        Sun, 18 May 2025 04:30:42 -0700 (PDT)
Message-ID: <03b9a6d4-26af-4da4-91a1-69d50ad0bc15@suse.com>
Date: Sun, 18 May 2025 13:29:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/6] xen/x86: rename cache_flush_permitted() to
 has_arch_io_resources()
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20250516094535.63472-1-roger.pau@citrix.com>
 <20250516094535.63472-4-roger.pau@citrix.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20250516094535.63472-4-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 16.05.2025 11:45, Roger Pau Monne wrote:
> To better describe the underlying implementation.  Define
> cache_flush_permitted() as an alias of has_arch_io_resources(), so that
> current users of cache_flush_permitted() are not effectively modified.
> 
> With the introduction of the new handler, change some of the call sites of
> cache_flush_permitted() to instead use has_arch_io_resources() as such
> callers are not after whether cache flush is enabled, but rather whether
> the domain has any IO resources assigned.
> 
> No functional change intended.
> 
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> ---
> Changes since v1:
>  - Drop adjustment to l1_disallow_mask().

Moving the change to the next patch instead, as I see. For both
patches:
Reviewed-by: Jan Beulich <jbeulich@suse.com>

Jan

