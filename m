Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A0949AD6CDB
	for <lists+xen-devel@lfdr.de>; Thu, 12 Jun 2025 11:59:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1012735.1391237 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPeiB-0001lR-Lz; Thu, 12 Jun 2025 09:59:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1012735.1391237; Thu, 12 Jun 2025 09:59:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPeiB-0001iw-JK; Thu, 12 Jun 2025 09:59:07 +0000
Received: by outflank-mailman (input) for mailman id 1012735;
 Thu, 12 Jun 2025 09:59:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=W6bR=Y3=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1uPeiA-0001iq-Rx
 for xen-devel@lists.xenproject.org; Thu, 12 Jun 2025 09:59:06 +0000
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [2a00:1450:4864:20::533])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e044f82c-4773-11f0-a309-13f23c93f187;
 Thu, 12 Jun 2025 11:59:05 +0200 (CEST)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-607ea238c37so1742923a12.2
 for <xen-devel@lists.xenproject.org>; Thu, 12 Jun 2025 02:59:05 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-64-38.play-internet.pl.
 [109.243.64.38]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6086b282444sm926267a12.79.2025.06.12.02.59.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Jun 2025 02:59:04 -0700 (PDT)
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
X-Inumbo-ID: e044f82c-4773-11f0-a309-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749722345; x=1750327145; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pE7thbfTf4JDBTGcvLHnMOhVzJhWpgg9OYEAZW1xxok=;
        b=aZZPlzMFOTLIBndyBTaYi/SkyYeD6J0kD++NbWkslhf0wixpycaZs/cVJAG9DTSssi
         XNWgftvzI3Ri2adfMHf6Oz9JZIIvO42k+O3ZTAeggn4FUZuVOmZnWWOcKGBaTkhXVU2G
         a97FCp1Lw5qnBgI4qbqXyeVsUCG2q+VKKeuIaT4+YOg30y2Ox1JGfFZifCeNLCS/kiPC
         C7INnX4Q4+ngtaYLr9k9/esB6FA3hkYnSdUTRPtqATZKdrpZ/w5sNsB6MDr2ym8qxbXD
         ZoKR8IqZNTl/lukjiKvBG5w/ksMn43KFXpDUXE63nOuY/89vqoSxxiQhQNWvMzfnSXAL
         JOvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749722345; x=1750327145;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=pE7thbfTf4JDBTGcvLHnMOhVzJhWpgg9OYEAZW1xxok=;
        b=sFApCWKdM76JjirePM89yHEgeMya1/UynFbC44BoTHiLuQpKG5ytQ0Qv1y3Un/oKRU
         US6eEiRkTcDH2GJxGyn2SGTMrVIL1650ZkJn5J0wtZd8pZwOAhDl6gM3FrYwehEz8Ndw
         o0qH1w/oENyK8t0Kzz8/y8bKhau3X+wyqHrhTma7gJiPvuSe9CHYk5Y66fyp4zgF/rMz
         IbhR0T4v4iw8jo4Rg3BjkC9GyAxaQLcWMxYqxh/54N7nWKmL8c4+dxvXKjFClBzbgOET
         DY1hpng5MQmIdOhcO/QtSam16nJL4YWlKRfzuaLH0HVWZS2htATtaofy6rb3w04uvGeb
         OsPg==
X-Forwarded-Encrypted: i=1; AJvYcCXHsAv/WD1r/3d6ZqwD7gzSEgcy3JXLPUkCRhjILo16KS/TTvDibd2MBcATLEt9VmACQWHRSn8ukU8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxoMApeTtFeK/BOG/LL9rJwx5adiRBox0GaYniRMzbb8mZth+Mv
	79U5wt2Jq7zpe6ctjOQXhePKo8UHBEKsxLTwzK+/4jrKRgRI38yTR1POQ7nK/A==
X-Gm-Gg: ASbGncu2j2aETTEPY6yk3iv/YGu+WL2rtTZPCJ4sW5PzIpIsxtI3XZwYQUQcejU1cao
	r3E96n4rB057zexG2eL35VnH8BZsnlQMM/s6weMLlruFG05iRmuZS1OKr0yLrmNdXqlhZI7i24A
	IbGUta6T6AKIpVmcGzRIPX1eC9uGjZFdGMt5ITc12X3AgzYK1ZBAdAKrXhZ1OIiyQTGoImM+rTd
	P5NAbSyYenmyO30SSKA7q1GEI2dxD10Tfa6r8bay5f81pBOZV1rOHM611n+bsDOHnylRU0xeMEO
	ksINxpRrp9QEYf1l8w/h+2fonlSvtg8LpUU7CvT2N3X3uOFfFpnE6ic/unNmMUPuy8lfWsddGJp
	p0STQP7elxN30iNK5qk7k8PnA/Ha2pUE2CN4=
X-Google-Smtp-Source: AGHT+IHTrX0lC8T3PLaxz1sbkEaRBvG84qtG/QZ7wzGJNR4jLVc5anW3ulXgaYkfJsv+SqCJghr4/Q==
X-Received: by 2002:a05:6402:d09:b0:601:89d4:968e with SMTP id 4fb4d7f45d1cf-60846cafdefmr5653377a12.27.1749722344970;
        Thu, 12 Jun 2025 02:59:04 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------lc6NHlp8uUnShWRqjpJ1FlAl"
Message-ID: <087c943f-a65e-4ccb-9e3f-cd2a260a2d1b@gmail.com>
Date: Thu, 12 Jun 2025 11:59:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen: move declarations of device_tree_get_{reg,u32}() to
 xen/device_tree.h
To: "Orzel, Michal" <michal.orzel@amd.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20250611114415.64480-1-oleksii.kurochko@gmail.com>
 <97cefe77-d876-489e-bd54-7a79d1209774@amd.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <97cefe77-d876-489e-bd54-7a79d1209774@amd.com>

This is a multi-part message in MIME format.
--------------lc6NHlp8uUnShWRqjpJ1FlAl
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 6/11/25 1:53 PM, Orzel, Michal wrote:
>
> On 11/06/2025 13:44, Oleksii Kurochko wrote:
>> There is nothing Arm specific for these functions thereby it makes sense
>> to move their declarations to common header: xen/device_tree.h.
> I find it a bit odd that you don't mention that the definitions are already in
> common and therefore the prototypes should be too. For me that's the main reason
> (in fact the prototypes should have been moved together with definitions).

Initially I mentioned that they are used in common code:https://gitlab.com/xen-project/people/olkur/xen/-/commit/db46a683342421375c01a71317deb5a8840ae624
and by that I also mean that they are defined. But then decicded to re-write a commit
message.

I will send a v2 with updated commit message:
  The definitions of|device_tree_get_reg()| and|device_tree_get_u32()| are already in
  common code, so move their prototypes there as well.

>> Signed-off-by: Oleksii Kurochko<oleksii.kurochko@gmail.com>
> Reviewed-by: Michal Orzel<michal.orzel@amd.com>

Thanks.

~ Oleksii

>> ---
>>   xen/arch/arm/include/asm/setup.h | 6 ------
>>   xen/include/xen/device_tree.h    | 6 ++++++
>>   2 files changed, 6 insertions(+), 6 deletions(-)
>>
>> diff --git a/xen/arch/arm/include/asm/setup.h b/xen/arch/arm/include/asm/setup.h
>> index 6cf272c160..2b58549c1a 100644
>> --- a/xen/arch/arm/include/asm/setup.h
>> +++ b/xen/arch/arm/include/asm/setup.h
>> @@ -53,12 +53,6 @@ void setup_mm(void);
>>   extern uint32_t hyp_traps_vector[];
>>   void init_traps(void);
>>   
>> -void device_tree_get_reg(const __be32 **cell, uint32_t address_cells,
>> -                         uint32_t size_cells, paddr_t *start, paddr_t *size);
>> -
>> -u32 device_tree_get_u32(const void *fdt, int node,
>> -                        const char *prop_name, u32 dflt);
>> -
>>   int handle_device(struct domain *d, struct dt_device_node *dev, p2m_type_t p2mt,
>>                     struct rangeset *iomem_ranges, struct rangeset *irq_ranges);
>>   
>> diff --git a/xen/include/xen/device_tree.h b/xen/include/xen/device_tree.h
>> index 6dc1fb5159..75017e4266 100644
>> --- a/xen/include/xen/device_tree.h
>> +++ b/xen/include/xen/device_tree.h
>> @@ -949,6 +949,12 @@ int dt_get_pci_domain_nr(struct dt_device_node *node);
>>   
>>   struct dt_device_node *dt_find_node_by_phandle(dt_phandle handle);
>>   
>> +void device_tree_get_reg(const __be32 **cell, uint32_t address_cells,
>> +                         uint32_t size_cells, paddr_t *start, paddr_t *size);
>> +
>> +u32 device_tree_get_u32(const void *fdt, int node,
>> +                        const char *prop_name, u32 dflt);
>> +
>>   #ifdef CONFIG_DEVICE_TREE_DEBUG
>>   #define dt_dprintk(fmt, args...)  \
>>       printk(XENLOG_DEBUG fmt, ## args)
--------------lc6NHlp8uUnShWRqjpJ1FlAl
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 6/11/25 1:53 PM, Orzel, Michal
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:97cefe77-d876-489e-bd54-7a79d1209774@amd.com">
      <pre wrap="" class="moz-quote-pre">

On 11/06/2025 13:44, Oleksii Kurochko wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">There is nothing Arm specific for these functions thereby it makes sense
to move their declarations to common header: xen/device_tree.h.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">I find it a bit odd that you don't mention that the definitions are already in
common and therefore the prototypes should be too. For me that's the main reason
(in fact the prototypes should have been moved together with definitions).</pre>
    </blockquote>
    <pre>Initially I mentioned that they are used in common code: <a class="moz-txt-link-freetext" href="https://gitlab.com/xen-project/people/olkur/xen/-/commit/db46a683342421375c01a71317deb5a8840ae624">https://gitlab.com/xen-project/people/olkur/xen/-/commit/db46a683342421375c01a71317deb5a8840ae624</a>
and by that I also mean that they are defined. But then decicded to re-write a commit
message.

I will send a v2 with updated commit message:
 The definitions of <code data-start="71" data-end="94">device_tree_get_reg()</code> and <code
    data-start="99" data-end="122">device_tree_get_u32()</code> are already in
 common code, so move their prototypes there as well.

</pre>
    <blockquote type="cite"
      cite="mid:97cefe77-d876-489e-bd54-7a79d1209774@amd.com">
      <pre wrap="" class="moz-quote-pre">
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">
Signed-off-by: Oleksii Kurochko <a class="moz-txt-link-rfc2396E" href="mailto:oleksii.kurochko@gmail.com">&lt;oleksii.kurochko@gmail.com&gt;</a>
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">Reviewed-by: Michal Orzel <a class="moz-txt-link-rfc2396E" href="mailto:michal.orzel@amd.com">&lt;michal.orzel@amd.com&gt;</a></pre>
    </blockquote>
    <pre>Thanks.

~ Oleksii
</pre>
    <blockquote type="cite"
      cite="mid:97cefe77-d876-489e-bd54-7a79d1209774@amd.com">
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">---
 xen/arch/arm/include/asm/setup.h | 6 ------
 xen/include/xen/device_tree.h    | 6 ++++++
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/xen/arch/arm/include/asm/setup.h b/xen/arch/arm/include/asm/setup.h
index 6cf272c160..2b58549c1a 100644
--- a/xen/arch/arm/include/asm/setup.h
+++ b/xen/arch/arm/include/asm/setup.h
@@ -53,12 +53,6 @@ void setup_mm(void);
 extern uint32_t hyp_traps_vector[];
 void init_traps(void);
 
-void device_tree_get_reg(const __be32 **cell, uint32_t address_cells,
-                         uint32_t size_cells, paddr_t *start, paddr_t *size);
-
-u32 device_tree_get_u32(const void *fdt, int node,
-                        const char *prop_name, u32 dflt);
-
 int handle_device(struct domain *d, struct dt_device_node *dev, p2m_type_t p2mt,
                   struct rangeset *iomem_ranges, struct rangeset *irq_ranges);
 
diff --git a/xen/include/xen/device_tree.h b/xen/include/xen/device_tree.h
index 6dc1fb5159..75017e4266 100644
--- a/xen/include/xen/device_tree.h
+++ b/xen/include/xen/device_tree.h
@@ -949,6 +949,12 @@ int dt_get_pci_domain_nr(struct dt_device_node *node);
 
 struct dt_device_node *dt_find_node_by_phandle(dt_phandle handle);
 
+void device_tree_get_reg(const __be32 **cell, uint32_t address_cells,
+                         uint32_t size_cells, paddr_t *start, paddr_t *size);
+
+u32 device_tree_get_u32(const void *fdt, int node,
+                        const char *prop_name, u32 dflt);
+
 #ifdef CONFIG_DEVICE_TREE_DEBUG
 #define dt_dprintk(fmt, args...)  \
     printk(XENLOG_DEBUG fmt, ## args)
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
</pre>
    </blockquote>
  </body>
</html>

--------------lc6NHlp8uUnShWRqjpJ1FlAl--

