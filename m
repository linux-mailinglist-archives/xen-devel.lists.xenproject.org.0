Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 82D1B874DF9
	for <lists+xen-devel@lfdr.de>; Thu,  7 Mar 2024 12:47:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.689796.1075096 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1riCCZ-0007fY-SL; Thu, 07 Mar 2024 11:46:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 689796.1075096; Thu, 07 Mar 2024 11:46:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1riCCZ-0007dL-PV; Thu, 07 Mar 2024 11:46:19 +0000
Received: by outflank-mailman (input) for mailman id 689796;
 Thu, 07 Mar 2024 11:46:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NZPn=KN=linaro.org=manos.pitsidianakis@srs-se1.protection.inumbo.net>)
 id 1riCCY-0007dF-8M
 for xen-devel@lists.xenproject.org; Thu, 07 Mar 2024 11:46:18 +0000
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [2a00:1450:4864:20::134])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4ec6e88e-dc78-11ee-afda-a90da7624cb6;
 Thu, 07 Mar 2024 12:46:17 +0100 (CET)
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-513382f40e9so949391e87.2
 for <xen-devel@lists.xenproject.org>; Thu, 07 Mar 2024 03:46:17 -0800 (PST)
Received: from meli.delivery (adsl-101.37.6.0.tellas.gr. [37.6.0.101])
 by smtp.gmail.com with ESMTPSA id
 j33-20020a05600c1c2100b00413101235b0sm1951412wms.2.2024.03.07.03.46.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Mar 2024 03:46:16 -0800 (PST)
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
X-Inumbo-ID: 4ec6e88e-dc78-11ee-afda-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709811977; x=1710416777; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:in-reply-to
         :references:user-agent:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=3FEKikgmbE/r5zzOA+k0Nr1gqI/iXTequF89jFi37Kw=;
        b=aVtLvOu7VA9sAxkO4mUUjig5X7a3JGUOy58c33x+ZtQY8e1fV60AbWYS0+3uSqLw9H
         TsMPJbTWEDaStl5f2sHybCn3xEll/kY6HCIPURk+9+uXc/50PXPTPnC5M6slTvnz3v5J
         VmfNZn5lEldi59AI3YN/hO11dj6CYF67YYCplNeDl8qKpX3ewkF5fnmKCgWnhACpZWZh
         nItauKP2Mbmp3EvuRj+xj4iEiufALqzRw2Iu57x2Q/lJiNInQ6C+5QHzAIwTymri9f8v
         FGLmv40NlqJhMnIeIUEhfHyyrGOz0YZSKc1HNSh1Nme1UHzezZsmH5yESY9S2mtPXZWd
         SUUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709811977; x=1710416777;
        h=content-transfer-encoding:mime-version:message-id:in-reply-to
         :references:user-agent:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3FEKikgmbE/r5zzOA+k0Nr1gqI/iXTequF89jFi37Kw=;
        b=FFlFK6Kmvj8BGkWdwX6C9NrtuOKfcsGuwXTxiapeqzpqjokLqZKy/OgUFuM04Fc3kh
         nmkQMs4lvzcD58Es2JbuZFTUWvb4KwYvVS7xac53lt48RXW2i1yeLdHnCPi3iYZ4bvhR
         svRDoRi1jZY6UFoVXZXNepxdfRPV3toMSCvcbLwq8rLLoywHrO2ig6ym38hR9ERWbXks
         auym4fgdK6TTgVGdu+/CAHqoBdcluiYQIDw5BHnrY9jNvblormXW6XQF9G4ODqbk7qht
         NQEkflHBKQ3NC7MQG5YjiAz4K2LkLBPWWhVzaYIU+4bTUElvW+mt/6LP0R5wJnpjl10M
         BZBQ==
X-Forwarded-Encrypted: i=1; AJvYcCXXlY5i3k/cPvJ9CuMqLyHK55V8V+3PYRlXbrcPqhoxywVmkXc8xbEyV55EWBDgO26cMrSrF4J904IeUOhwbbHjyr4S5O/wukGN+i3ptz8=
X-Gm-Message-State: AOJu0Ywz4htyXNlcwzj6jQhUMraYMAp7CmFkKTLNttXbBf3NSNnbFJPO
	iZ8Bp2szKlgjMCzo7dwYGurV/Rerwjix8MlXKiA6nPaqQFrki1klFgVnW6EHRFs=
X-Google-Smtp-Source: AGHT+IFH3wkwuGOA+F/yj5AIdWusXZJacoA67XWG5i8L99raCDY6RqXWR5e9a7fc4f3xfADZKnZc2w==
X-Received: by 2002:ac2:5223:0:b0:513:4777:f8c9 with SMTP id i3-20020ac25223000000b005134777f8c9mr1204156lfl.6.1709811976634;
        Thu, 07 Mar 2024 03:46:16 -0800 (PST)
Date: Thu, 07 Mar 2024 13:43:50 +0200
From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
To: qemu-devel@nongnu.org, Philippe Mathieu-Daud=?UTF-8?B?w6kg?=<philmd@linaro.org>
Cc: Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>, David Woodhouse <dwmw@amazon.co.uk>, Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org, Stefano Stabellini <sstabellini@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>, Alex Benn=?UTF-8?B?w6k=?= e <alex.bennee@linaro.org>, xen-devel@lists.xenproject.org, Philippe Mathieu-Daud=?UTF-8?B?w6kg?=<philmd@linaro.org>, Richard Henderson <richard.henderson@linaro.org>, Eduardo Habkost <eduardo@habkost.net>, "Michael S. Tsirkin" <mst@redhat.com>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: Re: [PATCH-for-9.0 1/9] hw/xen/hvm: Inline TARGET_PAGE_ALIGN() macro
User-Agent: meli 0.8.5-rc.3
References: <20231114163123.74888-1-philmd@linaro.org> <20231114163123.74888-2-philmd@linaro.org>
In-Reply-To: <20231114163123.74888-2-philmd@linaro.org>
Message-ID: <9z7d2.v9odatywozfr@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset=utf-8; format=flowed

On Tue, 14 Nov 2023 18:31, Philippe Mathieu-Daudé <philmd@linaro.org> wrote:
>Use TARGET_PAGE_SIZE to calculate TARGET_PAGE_ALIGN.
>
>Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>---
> hw/i386/xen/xen-hvm.c | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>
>diff --git a/hw/i386/xen/xen-hvm.c b/hw/i386/xen/xen-hvm.c
>index f1c30d1384..8aa6a1ec3b 100644
>--- a/hw/i386/xen/xen-hvm.c
>+++ b/hw/i386/xen/xen-hvm.c
>@@ -678,7 +678,7 @@ void xen_arch_set_memory(XenIOState *state, MemoryRegionSection *section,
>     trace_xen_client_set_memory(start_addr, size, log_dirty);
> 
>     start_addr &= TARGET_PAGE_MASK;
>-    size = TARGET_PAGE_ALIGN(size);
>+    size = ROUND_UP(size, TARGET_PAGE_SIZE);
> 
>     if (add) {
>         if (!memory_region_is_rom(section->mr)) {
>-- 
>2.41.0
>
>

Reviewed-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>

