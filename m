Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EA0285B327
	for <lists+xen-devel@lfdr.de>; Tue, 20 Feb 2024 07:51:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.683173.1062549 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rcJxX-0004xV-O5; Tue, 20 Feb 2024 06:50:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 683173.1062549; Tue, 20 Feb 2024 06:50:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rcJxX-0004uX-L3; Tue, 20 Feb 2024 06:50:31 +0000
Received: by outflank-mailman (input) for mailman id 683173;
 Tue, 20 Feb 2024 06:50:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=eXp8=J5=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1rcJxW-0004uR-09
 for xen-devel@lists.xenproject.org; Tue, 20 Feb 2024 06:50:30 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 54eebf70-cfbc-11ee-8a52-1f161083a0e0;
 Tue, 20 Feb 2024 07:50:28 +0100 (CET)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-4126d65ace3so3474355e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 19 Feb 2024 22:50:28 -0800 (PST)
Received: from [192.168.69.100] (mek33-h02-176-184-23-7.dsl.sta.abo.bbox.fr.
 [176.184.23.7]) by smtp.gmail.com with ESMTPSA id
 s6-20020a05600c45c600b00412696bd7d9sm3642279wmo.41.2024.02.19.22.50.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Feb 2024 22:50:27 -0800 (PST)
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
X-Inumbo-ID: 54eebf70-cfbc-11ee-8a52-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708411827; x=1709016627; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7IEnePugGgUoICeCL35mG4yEzWVLyAAMfq5V5GWMgX0=;
        b=RoV8qHaPOc03B3S8BN1pgHnk2gmf68fL0wJvEhUsqzgGwqxA/XHhuK7laRLt4EV1R1
         b4XX/VUIT1OgcCiA0DLpErRybRYwVDAffUCYqymFl1J0kruSvxcIeUhWeomrN2zx1Usk
         C7N9Lrn25zXq+byawA9Svr4sgo2erCithRHXI4WvAQW1F0B7Enkjtw0wNug06rSMy2KN
         XYWWDSDmXoEQWuhGbdta0DQP5CIB/8B6j34YvSLO+JH99MxEJdnUeUBTzhXSgSx6qTbb
         l59IiR+QR5cXtSFi3US7uqOPWqeN8ecl03d6NUkYUD4WXzdiOqMVbOh8GPDWgwEg2Omg
         wglA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708411827; x=1709016627;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7IEnePugGgUoICeCL35mG4yEzWVLyAAMfq5V5GWMgX0=;
        b=YvYcYYCp9BZksSN/F0aVtwnyRUZQfTpx6zQrbSyJsntQqyOxkuWiw6o22n48oOeFBd
         JVI+A0ChAPeIIV4M74GIu9VwmPYNMBXGhw2xOUlTFPKnU4jUgr7O8CsfNwSh2yVn+IAE
         RuKTn1SQfkv7XwfzAm2e8i/LQAXyxA31fjy2VwFO5trzQd1qb5zbdquJdLUU89xwZ8vH
         q8B9KeTHs9bEOusHu4qsPPUOnkqL/ulKdMYWdOEtecPfHC/Y35oYkQ96kYl8K0ClhjSo
         CTKWY8x0luhNyoyjGYKO5hbQr4yy1Q70EGsL4lc/65tAg6uzuHE4LsHcCdxGY3yNJj79
         g9dQ==
X-Forwarded-Encrypted: i=1; AJvYcCW+5fX8WdK+R4aYL9t1eAP9KS276SbnUvvLSeHZiV0KiqmKZ2+uVB9Rj8TGm5q1HanAL8ZQ+aFLJ29rY0tEQeus3v8un9X9OQGkEhK4Xnc=
X-Gm-Message-State: AOJu0YwE09iZ/728D7tSknK6No2NHVlm5uzocrwp4Y9yuwe5AW20JdfX
	vP4rSavxZitS7GSOO93FPl1t+aF3zvLJLl0UTsleag1quckDKszwRGySZjx/fq8=
X-Google-Smtp-Source: AGHT+IHxO0r30lxscG2YCRQIfJHxQ5ifYp/345djnp2UqyWvY1/X9dmS4mMVsBvkya0ymJckBG5wHw==
X-Received: by 2002:a05:600c:21d8:b0:411:e398:ca7a with SMTP id x24-20020a05600c21d800b00411e398ca7amr11654370wmj.39.1708411827713;
        Mon, 19 Feb 2024 22:50:27 -0800 (PST)
Message-ID: <429a5a27-21b9-45bd-a1a6-a1c2ccc484c9@linaro.org>
Date: Tue, 20 Feb 2024 07:50:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] hw/xen: detect when running inside stubdomain
Content-Language: en-US
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>,
 "open list:X86 Xen CPUs" <xen-devel@lists.xenproject.org>
References: <20240219181627.282097-1-marmarek@invisiblethingslab.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240219181627.282097-1-marmarek@invisiblethingslab.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 19/2/24 19:16, Marek Marczykowski-Górecki wrote:
> Introduce global xen_is_stubdomain variable when qemu is running inside
> a stubdomain instead of dom0. This will be relevant for subsequent
> patches, as few things like accessing PCI config space need to be done
> differently.
> 
> Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
> ---
>   hw/xen/xen-legacy-backend.c | 15 +++++++++++++++
>   include/hw/xen/xen.h        |  1 +
>   system/globals.c            |  1 +
>   3 files changed, 17 insertions(+)


> diff --git a/include/hw/xen/xen.h b/include/hw/xen/xen.h
> index 37ecc91fc3..ecb89ecfc1 100644
> --- a/include/hw/xen/xen.h
> +++ b/include/hw/xen/xen.h
> @@ -36,6 +36,7 @@ enum xen_mode {
>   extern uint32_t xen_domid;
>   extern enum xen_mode xen_mode;
>   extern bool xen_domid_restrict;
> +extern bool xen_is_stubdomain;
>   
>   int xen_pci_slot_get_pirq(PCIDevice *pci_dev, int irq_num);
>   int xen_set_pci_link_route(uint8_t link, uint8_t irq);
> diff --git a/system/globals.c b/system/globals.c
> index b6d4e72530..ac27d88bd4 100644
> --- a/system/globals.c
> +++ b/system/globals.c
> @@ -62,6 +62,7 @@ bool qemu_uuid_set;
>   uint32_t xen_domid;
>   enum xen_mode xen_mode = XEN_DISABLED;
>   bool xen_domid_restrict;
> +bool xen_is_stubdomain;

Note for myself, Paolo and Claudio, IIUC these fields belong
to TYPE_XEN_ACCEL in accel/xen/xen-all.c. Maybe resulting in
smth like:

-- >8 --
diff --git a/accel/xen/xen-all.c b/accel/xen/xen-all.c
index 5ff0cb8bd9..fc25d8c912 100644
--- a/accel/xen/xen-all.c
+++ b/accel/xen/xen-all.c
@@ -24,11 +24,31 @@
  #include "migration/global_state.h"
  #include "hw/boards.h"

-bool xen_allowed;
+struct XenAccelState
+{
+    AccelState parent_obj;
+
+    bool xen_allowed;
+
+    enum xen_mode xen_mode;
+
+    uint32_t xen_domid;
+    bool xen_domid_restrict;

  xc_interface *xen_xc;
  xenforeignmemory_handle *xen_fmem;
  xendevicemodel_handle *xen_dmod;
+};
+
+struct XenAccelOpsClass
+{
+    AccelOpsClass parent_class;
+
+    struct evtchn_backend_ops *xen_evtchn_ops;
+    struct gnttab_backend_ops *xen_gnttab_ops;
+    struct foreignmem_backend_ops *xen_foreignmem_ops;
+    struct xenstore_backend_ops *xen_xenstore_ops;
+}

  static void xenstore_record_dm_state(const char *state)
  {
@@ -114,6 +134,13 @@ static int xen_init(MachineState *ms)
      return 0;
  }

+static void xen_accel_init(Object *obj)
+{
+    XenAccelState *s = XEN_ACCEL(obj);
+
+    s->xen_mode = XEN_DISABLED;
+}
+
  static void xen_accel_class_init(ObjectClass *oc, void *data)
  {
      AccelClass *ac = ACCEL_CLASS(oc);
@@ -142,6 +169,8 @@ static void xen_accel_class_init(ObjectClass *oc, 
void *data)
  static const TypeInfo xen_accel_type = {
      .name = TYPE_XEN_ACCEL,
      .parent = TYPE_ACCEL,
+    .instance_size = sizeof(XenAccelState),
+    .instance_init = xen_accel_init,
      .class_init = xen_accel_class_init,
  };

@@ -157,6 +186,7 @@ static const TypeInfo xen_accel_ops_type = {

      .parent = TYPE_ACCEL_OPS,
      .class_init = xen_accel_ops_class_init,
+    .class_size = sizeof(XenAccelOpsClass),
      .abstract = true,
  };

---

