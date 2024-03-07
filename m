Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E32C874E5B
	for <lists+xen-devel@lfdr.de>; Thu,  7 Mar 2024 12:56:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.689805.1075125 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1riCLq-0002pY-8o; Thu, 07 Mar 2024 11:55:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 689805.1075125; Thu, 07 Mar 2024 11:55:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1riCLq-0002nO-6C; Thu, 07 Mar 2024 11:55:54 +0000
Received: by outflank-mailman (input) for mailman id 689805;
 Thu, 07 Mar 2024 11:55:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NZPn=KN=linaro.org=manos.pitsidianakis@srs-se1.protection.inumbo.net>)
 id 1riCLo-0002nE-In
 for xen-devel@lists.xenproject.org; Thu, 07 Mar 2024 11:55:52 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a53a9652-dc79-11ee-afda-a90da7624cb6;
 Thu, 07 Mar 2024 12:55:51 +0100 (CET)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-412f55695d1so7252625e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 07 Mar 2024 03:55:51 -0800 (PST)
Received: from meli.delivery (adsl-101.109.242.224.tellas.gr.
 [109.242.224.101]) by smtp.gmail.com with ESMTPSA id
 r11-20020a05600c35cb00b004127057d6b9sm2517388wmq.35.2024.03.07.03.55.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Mar 2024 03:55:50 -0800 (PST)
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
X-Inumbo-ID: a53a9652-dc79-11ee-afda-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709812551; x=1710417351; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:in-reply-to
         :references:user-agent:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=S2WmJe5+VMgo3q0Y6DtKVBoMQYi4KEJJ63YECSnGdAI=;
        b=ti9lqOzxB3HbfaCeLZHY9v7EZlsjgowvN1YP+0s7bhET55tmnJgDpTitGEjrdz6Ywz
         uQmQF78ggM/vlzIp1gllsQb+BjDb8+2aqN+KWtcWg5qcEJcjpdDqb1MtiUdaMYj217+v
         mzjyq3zAYP6pp00SnhbAzS71KDq5Sr4AZqs6Yta1a0lut5XBQBFRF7BwgOleVYmLcDsG
         wBJeN90y4zJM+PWcXBQB6XnhO+/OS6w9GBsyAIma7oX42seAA63/0YIkIfkYIdChFiUH
         FS8TXmG3Q9Y9CwGSeCWXr+kpSKJBHkj4UZ516to278B++g4jM2lXsyoGEuwazutcpzeI
         DYJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709812551; x=1710417351;
        h=content-transfer-encoding:mime-version:message-id:in-reply-to
         :references:user-agent:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=S2WmJe5+VMgo3q0Y6DtKVBoMQYi4KEJJ63YECSnGdAI=;
        b=X34X8ITZJkZxD2nfKD9NGAZu9KPQqAwd+Oofm/kOqzrKndQyIh+LlRig3sDm+6sUKY
         cCmWYH9/asiEnzbGVBjEHj1q83Gxw5qyqPZs8KkNbGBuQPodmCW89BehT0Vnv167w+bV
         tycAUdVFhdCIqMSrIFQsy8mpWbqqroWS2xG/ue3P6o7RDmAIIX8eW9Yg6PiI2n0uS/mb
         laIb77QoMQUkOYma06f3rz+3lZJH58aVxyhE2Bw47EIK3n3ljRTZgXfKl5GRH5XhlvDZ
         +fcsUnsDRDX/iu6Q78kAxJGAHcPvIpXNhVIXB5yd7Fr7pEFBcUca9cGEES4DsHf8Dezv
         SLgg==
X-Forwarded-Encrypted: i=1; AJvYcCV2x4X+FtM6OZaY08H909+txupaeTuUcCaorc7M2NpTzPxWTjnQzVWzguwlQG3eAKnJXSTp+pYR0jQmV07L152cnfH7s4aruc6V1FAYPJQ=
X-Gm-Message-State: AOJu0YwowhDTSWPxeQtKXwpyXTk21HPBOC4jGOX/yoOzAypE0CBpahnZ
	7gpL9EQ4uzAvqKFz/Xa5HHTwW2+YwHwhz2Ew8Qtx7pl7q8kFocnC1b6Ttc9alVU=
X-Google-Smtp-Source: AGHT+IGSeoRtR4+ZIJLregRqLFeBUzAzoogr8Ud+254lhRno0eax5sWI6+KhquUo7luhLcS/qDwyrg==
X-Received: by 2002:a05:600c:5247:b0:412:9dd0:f7e7 with SMTP id fc7-20020a05600c524700b004129dd0f7e7mr13265305wmb.22.1709812551075;
        Thu, 07 Mar 2024 03:55:51 -0800 (PST)
Date: Thu, 07 Mar 2024 13:54:35 +0200
From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
To: qemu-devel@nongnu.org, Philippe Mathieu-Daud=?UTF-8?B?w6kg?=<philmd@linaro.org>
Cc: Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>, David Woodhouse <dwmw@amazon.co.uk>, Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org, Stefano Stabellini <sstabellini@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>, Alex Benn=?UTF-8?B?w6k=?= e <alex.bennee@linaro.org>, xen-devel@lists.xenproject.org, Philippe Mathieu-Daud=?UTF-8?B?w6kg?=<philmd@linaro.org>, Peter Maydell <peter.maydell@linaro.org>, "Michael S. Tsirkin" <mst@redhat.com>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Richard Henderson <richard.henderson@linaro.org>, Eduardo Habkost <eduardo@habkost.net>
Subject: Re: [PATCH-for-9.0 4/9] hw/xen/hvm: Expose xen_memory_listener declaration
User-Agent: meli 0.8.5-rc.3
References: <20231114163123.74888-1-philmd@linaro.org> <20231114163123.74888-5-philmd@linaro.org>
In-Reply-To: <20231114163123.74888-5-philmd@linaro.org>
Message-ID: <9z7t0.nx533lxsltko@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset=utf-8; format=flowed

On Tue, 14 Nov 2023 18:31, Philippe Mathieu-Daudé <philmd@linaro.org> wrote:
>There can only be a single xen_memory_listener definition
>in a qemu-system binary.
>
>Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>---
> include/hw/xen/xen-hvm-common.h | 1 +
> hw/arm/xen_arm.c                | 2 +-
> hw/i386/xen/xen-hvm.c           | 2 +-
> 3 files changed, 3 insertions(+), 2 deletions(-)
>
>diff --git a/include/hw/xen/xen-hvm-common.h b/include/hw/xen/xen-hvm-common.h
>index 83ed16f425..0fed15ed04 100644
>--- a/include/hw/xen/xen-hvm-common.h
>+++ b/include/hw/xen/xen-hvm-common.h
>@@ -18,6 +18,7 @@
> extern MemoryRegion xen_memory;
> extern MemoryListener xen_io_listener;
> extern DeviceListener xen_device_listener;
>+extern const MemoryListener xen_memory_listener;
> 
> //#define DEBUG_XEN_HVM
> 
>diff --git a/hw/arm/xen_arm.c b/hw/arm/xen_arm.c
>index b478d74ea0..39dcd74d07 100644
>--- a/hw/arm/xen_arm.c
>+++ b/hw/arm/xen_arm.c
>@@ -38,7 +38,7 @@
> #define TYPE_XEN_ARM  MACHINE_TYPE_NAME("xenpvh")
> OBJECT_DECLARE_SIMPLE_TYPE(XenArmState, XEN_ARM)
> 
>-static const MemoryListener xen_memory_listener = {
>+const MemoryListener xen_memory_listener = {
>     .region_add = xen_region_add,
>     .region_del = xen_region_del,
>     .log_start = NULL,
>diff --git a/hw/i386/xen/xen-hvm.c b/hw/i386/xen/xen-hvm.c
>index b64204ea94..a65a96f0de 100644
>--- a/hw/i386/xen/xen-hvm.c
>+++ b/hw/i386/xen/xen-hvm.c
>@@ -469,7 +469,7 @@ static void xen_log_global_stop(MemoryListener *listener)
>     xen_in_migration = false;
> }
> 
>-static const MemoryListener xen_memory_listener = {
>+const MemoryListener xen_memory_listener = {
>     .name = "xen-memory",
>     .region_add = xen_region_add,
>     .region_del = xen_region_del,
>-- 
>2.41.0
>
>


Reviewed-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>

