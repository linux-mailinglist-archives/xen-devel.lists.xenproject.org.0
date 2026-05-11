Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8PafI03fAWptlgEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 11 May 2026 15:53:17 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BD70650F605
	for <lists+xen-devel@lfdr.de>; Mon, 11 May 2026 15:53:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1306222.1578287 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wMR46-0005FM-L8; Mon, 11 May 2026 13:52:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1306222.1578287; Mon, 11 May 2026 13:52:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wMR46-0005Cw-IG; Mon, 11 May 2026 13:52:58 +0000
Received: by outflank-mailman (input) for mailman id 1306222;
 Mon, 11 May 2026 13:52:56 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wMR44-0005Cq-Rk
 for xen-devel@lists.xenproject.org; Mon, 11 May 2026 13:52:56 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wMR42-00FE5f-MQ
 for xen-devel@lists.xenproject.org; Mon, 11 May 2026 15:52:54 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a01df27-e002-0a2a0a5209dd-0a2a450ca008-44
 for <xen-devel@lists.xenproject.org>; Mon, 11 May 2026 15:52:54 +0200
Received: from [209.85.128.49] (helo=mail-wm1-f49.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a01df36-62f1-0a2a450c0019-d1558031d93d-3
 for <xen-devel@lists.xenproject.org>; Mon, 11 May 2026 15:52:54 +0200
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-48e82c23840so8884275e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 11 May 2026 06:52:54 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-69-121.play-internet.pl.
 [109.243.69.121]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48e702e5630sm172893775e9.8.2026.05.11.06.52.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 May 2026 06:52:53 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:In-Reply-To:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778507574; x=1779112374; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZFmoW6JntkeQx2+RQzRMcSb9LFMgoGGLEeiywY/lSFU=;
        b=JTE+yFmKtsHnEfA9ryTvOkyqr4tXj7X5XclYAvfb2vONlDr4W99jhHGrs4HWPaOBj7
         aLcBwXtDZ+LRiNUBV7qSDHTnaQxAUpieifrnnTeTnG1ZMzvfD58vS8ACsuRBnMKgVCw9
         fQBfhATouJ4b78K/tjWfuHtwBJd6JczHC/aKSubd/OvScq5tugHwp+ZggWWLl+3eFT14
         hOVn1vgNKT2UGQqQzfqwRuQiwrEB0BL8EX9AIJ5JbOh0gaRBP5VLNkfJyjKVBArTKhiT
         1ggTeafFHhvsoc58zXNV98x4gkgQGSrhJC5uWthV6U0ASmGgIus7aHC6q95H/3abw6mi
         QfUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778507574; x=1779112374;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZFmoW6JntkeQx2+RQzRMcSb9LFMgoGGLEeiywY/lSFU=;
        b=TA1xbtyaj32P8IP+tWmfYWVrDsTfCg4tQrx6Cfe9N1L5O2/HNU5l7GzKAU05otYbTe
         hBbmu98rQGgvunvSVU4ME0+6hPY5qMjewjhJWnCyJ2Si+xuEjQtb8fH8eA9G6WRsrSQ7
         RZc3pJlP6WGmEn8rptcWHl1h01jrM/3YQIlrmu51GwYpAfHkFO5Cfv1gsig3as9OxWC9
         FV39L1+0HQOA5PJ0Mg8uPausn9o1JvvO+jzh/h+/+p7+xjBk6TVcoSW14DzgJUoZKyNM
         XW9xuS7eNZR9HZiq35YJ1zqUvaliNNIC0cjUfQ6tdSkaZjjz6UsO/tqy5/kA9i3Kw5t9
         2ayw==
X-Forwarded-Encrypted: i=1; AFNElJ+tavS0NDucqrIjxoD1mJFLC+YhTONxsyK90DmZ5YrWYMkdopF8rKxXsNos5I1BirE/AWshG1i4Pq0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyUPJf63J/E4CuGRN8K/pb44VNm9sPCfmV/ZBi0Bpg17S3DoJyi
	zh4XKyWL24j2OXB9KFGLfeYmu21YgZ+cnBbS7kM058wJQHTHrwYOG6d28C9NtA==
X-Gm-Gg: Acq92OHvezg8HivnfeNH+7Gy3zKCZhc7bRNoY0f58xfGY/l7XRjMkbmX5RwKLHZhKpx
	DF5wcLPVx1nSWXyVcSpUBGzylEfe+wXSccj2yZvgKnUO/0MhFmRqmKsk43XuKgYeOHsxbac2a+U
	kKyj851qKbZLB6Jc1gwuWS5bhymKAz9ge9La2Wjj6JkgleyWYOeCC+Gma7WV9dkQ8VbGn0/2of+
	5tKf8jaZjckgCJ9vspzxqYULcbrg8+Dt+qEzIcfYilMZ3AdDu9/W+44htO55r4jSr+zg0cxweLk
	aGq5LiqhyCp27lbnA/6QLyRjs9XxDu8nsmTOKPIZgHd/tpeP7FqnlhbZ4H+pkynDOuB7Ekzp92O
	2zintfiVb3EWIs0tJj37SDbd6i+bktO3fyMvuTokgjn36PZ5xSGE6wrgrWk6+CYhqViz/hKLyVZ
	Lxh8B0zHcZcS17YBjDrOCR44anPO/POGvwImRu+WRhhUBr3hIcb/fOqCQsQLEeEu3NlTjG+FjW4
	8k=
X-Received: by 2002:a05:600c:1f89:b0:48e:8741:fd43 with SMTP id 5b1f17b1804b1-48e8741ff6fmr28938555e9.13.1778507573894;
        Mon, 11 May 2026 06:52:53 -0700 (PDT)
Message-ID: <9d56ec7f-4502-4133-92ce-e536f4ab3177@gmail.com>
Date: Mon, 11 May 2026 15:52:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] symbols: explicitly specify source file name for symtab
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
References: <f921abc1-1f1a-4ef1-b21b-a65b5d50eafd@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <f921abc1-1f1a-4ef1-b21b-a65b5d50eafd@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d25034/1778507574-DBB7CCF5-9F4DB3BC/10/73395122804
X-purgate-type: spam
X-purgate-size: 1948
X-Rspamd-Queue-Id: BD70650F605
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:julien@xen.org,m:sstabellini@kernel.org,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:roger.pau@citrix.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action



On 5/11/26 12:00 PM, Jan Beulich wrote:
> If there are any local symbols in an object file, GNU ld will create an
> STT_FILE symbol derived from the object file name if there is none in the
> incoming symbol table. The object file name, however, varies between
> linking passes. As a result, symbol name compression can yield different
> results if any of those local symbols need retaining (Arm [and RISC-V]
> mapping symbols are omitted, for example). If that difference in
> compression would yield a difference in the sizes of symbol_names[] or
> symbols_token_table[], the compare-symbol-tables sanity check will fail.
> 
> Fixes: d37d63d4b548 ("symbols: prefix static symbols with their source file names")
> Reported-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

I would like to note that with the current staging I can't reproduce 
this bug anymore with configs I have:

10d417b8b62e (HEAD -> staging, upstream/staging) xen/arm: skip holes in 
physical address space when setting up frametable
2611377cf9c9 xen/riscv: fix MMIO alignment check in imsic_init()
54ca0aadc821 x86/time: make do_settime() uses more accurate
4526d6763466 x86/time: make early NOW() uses slightly more precise
9f976dec039c xen: introduce CONFIG_HAS_DOMAIN_TYPE
bdb30883f352 iommu/amd-vi: do not zero IOMMU MMIO region
4f9457ece11a xsm/flask: Fix undefined behaviour in avc_dump_av()
4ff927133ebc EFI: adjust cfg file buffer freeing
96ffccef5a5f xvmalloc: adjust XVFREE() ordering
e8c1feab33cb CI: Refresh the Debian 12 cppcheck container
278953f6c155 (origin/staging, origin/HEAD) automation/gitlab: introduce 
macOS build jobs

But when I switched to origin/HEAD I can reproduce the bug and I applied 
the suggested patch on top of it and I don't see this bug anymore with 
this fix:
   Tested-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Thanks.

~ Oleksii


