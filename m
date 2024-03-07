Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 714D8874E74
	for <lists+xen-devel@lfdr.de>; Thu,  7 Mar 2024 13:01:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.689819.1075155 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1riCQe-0006A6-Kb; Thu, 07 Mar 2024 12:00:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 689819.1075155; Thu, 07 Mar 2024 12:00:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1riCQe-00066D-Hc; Thu, 07 Mar 2024 12:00:52 +0000
Received: by outflank-mailman (input) for mailman id 689819;
 Thu, 07 Mar 2024 12:00:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NZPn=KN=linaro.org=manos.pitsidianakis@srs-se1.protection.inumbo.net>)
 id 1riCQc-0005nb-LD
 for xen-devel@lists.xenproject.org; Thu, 07 Mar 2024 12:00:50 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 56608282-dc7a-11ee-a1ee-f123f15fe8a2;
 Thu, 07 Mar 2024 13:00:49 +0100 (CET)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-412f0655d81so6609735e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 07 Mar 2024 04:00:49 -0800 (PST)
Received: from meli.delivery (adsl-101.37.6.0.tellas.gr. [37.6.0.101])
 by smtp.gmail.com with ESMTPSA id
 v23-20020a05600c215700b00412e84e59d8sm2356539wml.44.2024.03.07.04.00.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Mar 2024 04:00:48 -0800 (PST)
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
X-Inumbo-ID: 56608282-dc7a-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709812848; x=1710417648; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:in-reply-to
         :references:user-agent:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=twWUN2kiBJHMBkCBDehi/T5jG7Og4Pb2CjHBjUGsfYE=;
        b=QgLYnYWN23HmLxzGZ0MT61DVxSOe8PjC9HjCDVuMMrheEFYvV+uJyGguCtWIrVTV+N
         7q5LgndY7TYVdxwTfdgrZ2UnN/LKAuGCdHzxxI9p1N88Z4uCDuh8kieSFJlPtcvMWX/m
         /oa5YImGdiZgFzJJ21pP77/iWH/EAt6syMWU86AQ6o56GIqSOJ3Gd/uM2X6N8gvRkJ5p
         3ViWMqKPqKMSLerHnuk5LWPsSp2wZjWmhwE7nC/hqIAh4khMnAbvzixvwSYhsA6j8ant
         Yv09QP7YmV5MnGGGZR7tyTyd6xUAnDU3FecmxL9vBMOUCg4WlygvB9lMyUZLYmy0Q8It
         DcnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709812848; x=1710417648;
        h=content-transfer-encoding:mime-version:message-id:in-reply-to
         :references:user-agent:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=twWUN2kiBJHMBkCBDehi/T5jG7Og4Pb2CjHBjUGsfYE=;
        b=OAsT3C2q/Q6CKC10xTveq7UtrDqWx2Cf18sUgrqaUdTyX0Cxi/UHs5gGmNNvHt8VYC
         GLx7jKQjMqFgqroNBSwjSq9BoqYohwAa/zt4MUluxrwX+F88u3cwDHtDrjK4j35gpyIQ
         EDU9hOK8BU7c5GRvRNpOgyBiQ++yeCXusubGTr9gLJ5Rn2fuh4l6t2mGOH3PTRJBeOjo
         WbfiEqV+32oRl8qwvZb4p/Q6QwDEB+Cmw599BHLTsdxdcatZRrP4Z+RG0EnmmRDN6q9S
         fMLikIUjUOQQbVXqeDFsuwER/IOHAcS+ylxkLKlJCEwNJbwbQYWUHaAORrPzP2CQSjz9
         LjJA==
X-Forwarded-Encrypted: i=1; AJvYcCUyrOWg5NpzFbX1m54SjvIGLXV6DurimsftLzaleqZrjzr4kJz4fkOVlKcG2ViD+6/cyNgY3U8RjDtZvZzJ2gOtjZlCP70bGl47K03vZIA=
X-Gm-Message-State: AOJu0Yx9wYytOljoSMz1tJ0Al31+Q7iDw3FYiN/BNHQ6Y0zJgOPhaZRz
	5RCP1voioGr8986qKZG0M5La50t0U5YG2dQqJd0wT3W2TxS+La4Ma5KcDJX6Q5A=
X-Google-Smtp-Source: AGHT+IHpiLitTFNjn86v2ggcN10vD7epyc0jEhUeO7saXhtlWV7ljeU238OFndl2+3dWsKcBM0XbgQ==
X-Received: by 2002:a05:600c:5252:b0:412:de1f:cdfb with SMTP id fc18-20020a05600c525200b00412de1fcdfbmr9194532wmb.20.1709812848632;
        Thu, 07 Mar 2024 04:00:48 -0800 (PST)
Date: Thu, 07 Mar 2024 13:58:43 +0200
From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
To: qemu-devel@nongnu.org, Philippe Mathieu-Daud=?UTF-8?B?w6kg?=<philmd@linaro.org>
Cc: Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>, David Woodhouse <dwmw@amazon.co.uk>, Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org, Stefano Stabellini <sstabellini@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>, Alex Benn=?UTF-8?B?w6k=?= e <alex.bennee@linaro.org>, xen-devel@lists.xenproject.org, Philippe Mathieu-Daud=?UTF-8?B?w6kg?=<philmd@linaro.org>, "Michael S. Tsirkin" <mst@redhat.com>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Richard Henderson <richard.henderson@linaro.org>, Eduardo Habkost <eduardo@habkost.net>
Subject: Re: [RFC PATCH-for-9.0 6/9] hw/xen/hvm: Initialize xen_physmap QLIST in xen_read_physmap()
User-Agent: meli 0.8.5-rc.3
References: <20231114163123.74888-1-philmd@linaro.org> <20231114163123.74888-7-philmd@linaro.org>
In-Reply-To: <20231114163123.74888-7-philmd@linaro.org>
Message-ID: <9z81a.ekdgcipljjf2@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset=utf-8; format=flowed

On Tue, 14 Nov 2023 18:31, Philippe Mathieu-Daudé <philmd@linaro.org> wrote:
>xen_read_physmap() is the first function requiring
>xen_physmap QLIST being initialized. Move the init
>call there.
>
>Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>---
> hw/i386/xen/xen-hvm.c | 4 +++-
> 1 file changed, 3 insertions(+), 1 deletion(-)
>
>diff --git a/hw/i386/xen/xen-hvm.c b/hw/i386/xen/xen-hvm.c
>index 789779d02c..3b9c31c1c8 100644
>--- a/hw/i386/xen/xen-hvm.c
>+++ b/hw/i386/xen/xen-hvm.c
>@@ -532,6 +532,8 @@ void xen_read_physmap(XenIOState *state)
>     char path[80], *value = NULL;
>     char **entries = NULL;
> 
>+    QLIST_INIT(&xen_physmap);
>+
>     snprintf(path, sizeof(path),
>             "/local/domain/0/device-model/%d/physmap", xen_domid);
>     entries = xs_directory(state->xenstore, 0, path, &num);
>@@ -575,6 +577,7 @@ void xen_read_physmap(XenIOState *state)
> #else
> void xen_read_physmap(XenIOState *state)
> {
>+    QLIST_INIT(&xen_physmap);
> }
> #endif
> 
>@@ -595,7 +598,6 @@ void xen_hvm_init_pc(PCMachineState *pcms, MemoryRegion **ram_memory)
> 
>     xen_register_ioreq(state, max_cpus, &xen_memory_listener);
> 
>-    QLIST_INIT(&xen_physmap);
>     xen_read_physmap(state);
> 
>     suspend.notify = xen_suspend_notifier;
>-- 
>2.41.0
>
>

Reviewed-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>

