Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F37C7EAAFE
	for <lists+xen-devel@lfdr.de>; Tue, 14 Nov 2023 08:42:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.632164.986259 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2o43-00021p-FM; Tue, 14 Nov 2023 07:42:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 632164.986259; Tue, 14 Nov 2023 07:42:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2o43-00020A-Bt; Tue, 14 Nov 2023 07:42:27 +0000
Received: by outflank-mailman (input) for mailman id 632164;
 Tue, 14 Nov 2023 07:42:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6V1E=G3=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1r2o41-000204-Np
 for xen-devel@lists.xenproject.org; Tue, 14 Nov 2023 07:42:25 +0000
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com
 [209.85.208.42]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 582889b4-82c1-11ee-9b0e-b553b5be7939;
 Tue, 14 Nov 2023 08:42:23 +0100 (CET)
Received: by mail-ed1-f42.google.com with SMTP id
 4fb4d7f45d1cf-53e751aeb3cso8127566a12.2
 for <xen-devel@lists.xenproject.org>; Mon, 13 Nov 2023 23:42:21 -0800 (PST)
Received: from [192.168.69.100] (cac94-h02-176-184-25-155.dsl.sta.abo.bbox.fr.
 [176.184.25.155]) by smtp.gmail.com with ESMTPSA id
 er22-20020a056402449600b0054130b1bc77sm4739041edb.51.2023.11.13.23.42.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Nov 2023 23:42:14 -0800 (PST)
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
X-Inumbo-ID: 582889b4-82c1-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699947735; x=1700552535; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=afwXf5UyfyHio4t/MoTziNc/oom0veIJS2FP26Ef0EA=;
        b=i++D8hS0/ZiCEejgJogbXky4h2JNT9itk2sgeCT3HIiVQRewMFaU38wTmiG21rPE2h
         aQvYwvpdp77Gs6hv1iBIchLt304u1fGDqTMOr6Sh59NAlnJ/Tk8gInu8bVdAc58qw5ES
         QiIJRXTxicOJozQWrjWPHvqcjgWeO49XpXWNrD6dSAQJ7PdVo3I/hMm13MF1j+lsT6wM
         qIiLZKz//iJQoEussltAzyXE8fm2EAr66tmenFLsPes3C6aJeSwf3mJ1dPwjS0wLgyK6
         UjxNjncrXPLOICPhszcZNHiml/PVlzjIm+pxFyNfKOx8TWaMZkPj6WFt2zhnKJXcskfg
         zrjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699947735; x=1700552535;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=afwXf5UyfyHio4t/MoTziNc/oom0veIJS2FP26Ef0EA=;
        b=g6WGq7zGFVWgdeW9mfpTOcXcUIybI+LT+BD+jJS6Fz4XZ4O9IQjTSLJtSOFttwSRsT
         gDxwxOLblfXd16mdcwKK8XP0eTnZ+WEJE1bi99dbZDXeGiUA7z7+8ONdZs9JW+8+2Jak
         8o8zlmI3nnKSIE8kev7PSfCPzhS5aLZB4FG7BcDgYe0aurzI68dnsAlgncQKTtpzLwoK
         GDQm4ENhS/I780kRylsGu2swNxGmmYtpY5qUL10IreZdVkkvq6V6Dgn3ct20VGCzYLt1
         KVuDedQUyHDZpHPyoRSSRAnzbIRsTxFd4JJdhTBC84prRit3tDo7XzkTVDt0e7ItoSUS
         XljQ==
X-Gm-Message-State: AOJu0YwXm0gQxFwz8N+/NP6GYYpaVzUTX/2GwfwP8lXX2wdF1DYu8VN1
	Pq7TttWP6/k36bE49LmfyYaGqw==
X-Google-Smtp-Source: AGHT+IFce6dsUWO8qArRxaXq4VW8P2txycNkeinwY/EAXtRKE4RItRlBpr4najyISG4uncQiB0ABBQ==
X-Received: by 2002:a05:6402:884:b0:545:5674:4293 with SMTP id e4-20020a056402088400b0054556744293mr6387649edy.28.1699947734901;
        Mon, 13 Nov 2023 23:42:14 -0800 (PST)
Message-ID: <e6680657-59de-4845-a3a3-af8df11fc443@linaro.org>
Date: Tue, 14 Nov 2023 08:42:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH-for-9.0 04/10] hw/xen: Factor xen_arch_align_ioreq_data()
 out of handle_ioreq()
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>,
 Paul Durrant <paul@xen.org>, David Woodhouse <dwmw@amazon.co.uk>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>, qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 xen-devel@lists.xenproject.org, qemu-block@nongnu.org,
 Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
References: <20231113152114.47916-1-philmd@linaro.org>
 <20231113152114.47916-5-philmd@linaro.org>
 <a50b0790-03d7-458c-834b-907e130bb5fd@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <a50b0790-03d7-458c-834b-907e130bb5fd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 13/11/23 19:16, Richard Henderson wrote:
> On 11/13/23 07:21, Philippe Mathieu-Daudé wrote:
>> diff --git a/hw/xen/xen-hvm-common.c b/hw/xen/xen-hvm-common.c
>> index c028c1b541..03f9417e7e 100644
>> --- a/hw/xen/xen-hvm-common.c
>> +++ b/hw/xen/xen-hvm-common.c
>> @@ -426,10 +426,7 @@ static void handle_ioreq(XenIOState *state, 
>> ioreq_t *req)
>>       trace_handle_ioreq(req, req->type, req->dir, req->df, 
>> req->data_is_ptr,
>>                          req->addr, req->data, req->count, req->size);
>> -    if (!req->data_is_ptr && (req->dir == IOREQ_WRITE) &&
>> -            (req->size < sizeof (target_ulong))) {
>> -        req->data &= ((target_ulong) 1 << (8 * req->size)) - 1;
>> -    }
> 
> 
> I suspect this should never have been using target_ulong at all: 
> req->data is uint64_t.

This could replace it:

-- >8 --
-    if (!req->data_is_ptr && (req->dir == IOREQ_WRITE) &&
-            (req->size < sizeof (target_ulong))) {
-        req->data &= ((target_ulong) 1 << (8 * req->size)) - 1;
+    if (!req->data_is_ptr && (req->dir == IOREQ_WRITE)) {
+        req->data = extract64(req->data, 0, BITS_PER_BYTE * req->size);
      }
---

Some notes while looking at this.

Per xen/include/public/hvm/ioreq.h header:

#define IOREQ_TYPE_PIO          0 /* pio */
#define IOREQ_TYPE_COPY         1 /* mmio ops */
#define IOREQ_TYPE_PCI_CONFIG   2
#define IOREQ_TYPE_VMWARE_PORT  3
#define IOREQ_TYPE_TIMEOFFSET   7
#define IOREQ_TYPE_INVALIDATE   8 /* mapcache */

   struct ioreq {
     uint64_t addr;          /* physical address */
     uint64_t data;          /* data (or paddr of data) */
     uint32_t count;         /* for rep prefixes */
     uint32_t size;          /* size in bytes */
     uint32_t vp_eport;      /* evtchn for notifications to/from device 
model */
     uint16_t _pad0;
     uint8_t state:4;
     uint8_t data_is_ptr:1;  /* if 1, data above is the guest paddr
                              * of the real data to use. */
     uint8_t dir:1;          /* 1=read, 0=write */
     uint8_t df:1;
     uint8_t _pad1:1;
     uint8_t type;           /* I/O type */
   };
   typedef struct ioreq ioreq_t;

If 'data' is not a pointer, it is a u64.

- In PIO / VMWARE_PORT modes, only 32-bit are used.

- In MMIO COPY mode, memory is accessed by chunks of 64-bit

- In PCI_CONFIG mode, access is u8 or u16 or u32.

- None of TIMEOFFSET / INVALIDATE use 'req'.

- Fallback is only used in x86 for VMWARE_PORT.

--

Regards,

Phil.

