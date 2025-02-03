Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2690DA25F3C
	for <lists+xen-devel@lfdr.de>; Mon,  3 Feb 2025 16:50:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.880733.1290811 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1teyiL-0005fh-AO; Mon, 03 Feb 2025 15:50:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 880733.1290811; Mon, 03 Feb 2025 15:50:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1teyiL-0005d5-7H; Mon, 03 Feb 2025 15:50:21 +0000
Received: by outflank-mailman (input) for mailman id 880733;
 Mon, 03 Feb 2025 15:50:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=o2EM=U2=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1teyiJ-0005cz-7N
 for xen-devel@lists.xenproject.org; Mon, 03 Feb 2025 15:50:19 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 906a3632-e246-11ef-99a4-01e77a169b0f;
 Mon, 03 Feb 2025 16:50:17 +0100 (CET)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-43618283d48so33972625e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 03 Feb 2025 07:50:17 -0800 (PST)
Received: from [192.168.100.192] (lfbn-gre-1-190-108.w90-112.abo.wanadoo.fr.
 [90.112.153.108]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38c5c0ec2f4sm13381142f8f.11.2025.02.03.07.50.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Feb 2025 07:50:16 -0800 (PST)
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
X-Inumbo-ID: 906a3632-e246-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738597816; x=1739202616; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hGLnd7MW+INFn8KfAogSE4Aqa3eGROQgfUiqN6p7Bnk=;
        b=cV+C8LSyvQyatJ6O5vzcQSFP+ksIhuP3OCzeYDqi9wsqxBhGCuai+la7dQ3ymIfSzk
         mtmi9MM6VVIOWlB/ku4WdAq6Ywu0dtgbi8XV+vrkTid6uWgWQcOqTz4HpcBtrsF1gBdT
         dEx8HejRUuRaTUYXFA9AJRmI+AfSEvbk2wYp/HQD88phj2rL/aF7YM+gPel2n/wdO+3a
         f+p6Lx5uJyC8BlLwM6GWT9BmGkw9ghIbKRIGI1I/9GmJoJu98COW6CRyMrvLjNLLNbae
         RBVTu4ytcqebpVLyTOMZ3eJto+6Uuax45CpNL9/4+709+E+1rpYDLNB8IrWzKFUCsy+F
         OWHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738597816; x=1739202616;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hGLnd7MW+INFn8KfAogSE4Aqa3eGROQgfUiqN6p7Bnk=;
        b=U2rFNkO/lCTWCj+5swfzwTerfRiZbPVz7aakRhk0HIWt/KVSizJhpDQbLYBaw+HnpO
         ShicLWUB5oObA9ucDJA1wxFX3cMxsex00aDMTKauznr5g5FviS5yzEtM9rx3FTfiAf9s
         0Fbu60+t39sVcV6Evugur1DGo/Rpwga2yX2F6n750VGXt5EHMK36U5J8iawIs1pdC3V1
         cCfFttIFKX5pjxOwJp+65YPpH0u8yY2At+4IyH5aJjpTDm1fnD/tP5TxXdDpgvNnuCzW
         zNajDdzMxi/dh2/7apC9WHwHwwuu9IAMi26cL7/CowPhM4WGpIIoBdAgW/newvlrp1Cc
         QLrA==
X-Forwarded-Encrypted: i=1; AJvYcCV2MvcZO0gtnPtFLTlps4F0xwbRkHBAlBZNyznFuDiTxXQGJejlihxM9ZQ9FplI/tqaigYCK4tM+RE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyqG4G8nP79s1TBgfTssi8OURoYh8VRRpas2gTFlc9dlW2hXTfK
	EXwKhYzqjvWM2dLktuPW5RR24F0FbJw3/CDPat7dG/uTNr/xNRvG
X-Gm-Gg: ASbGnct1EvRR7nvDDNs95wlsKBCTHNJ+dvumkXTtKPtpmduSn7f06yVSY5daXhsJNum
	5mBFSIGbyErw+XTEc23i6x8pej10MPKgbDpZb/HibBKpFR2T9A2mvfeSnNzIn7Ra52ul0iQ/6ZT
	KLZPD9rnpYFGhJOaLivLZ4wmTrOLCVvTjygvg9ZJSAZaioLDz64X7PDqVEejHbULbblZPAskJkw
	k7PuvILLzwFgxdfdGNtgNb5PPJlavlpg8rt6S5x05gcVFwowSBl3aXFYlp4zhMsglg+6ldmMRHR
	Oz2u09EfH5eN49DbjfxZoDs/LfRACEcYBqAkXZVcWHLsFCU5JTD2OXDcnUPwYtxOhE4LB4Ly0Cm
	tRII=
X-Google-Smtp-Source: AGHT+IE8SxZpPo+pJoPbv7IyfcVSXKgbbliSJkUdPL8PJEXPDMpM8sh5QpzXoCMN2Ms31WEyG/TORw==
X-Received: by 2002:a05:6000:154f:b0:388:da10:ea7e with SMTP id ffacd0b85a97d-38c5195f6b3mr18568863f8f.24.1738597816322;
        Mon, 03 Feb 2025 07:50:16 -0800 (PST)
Content-Type: multipart/alternative;
 boundary="------------E4oC060um80aI3lOPnfbVY73"
Message-ID: <8ca2fe43-f698-4913-bb09-13093938fba9@gmail.com>
Date: Mon, 3 Feb 2025 16:50:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 6/9] asm-generic: move some parts of Arm's
 domain_build.h to asm-generic header
To: Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <cover.1736334615.git.oleksii.kurochko@gmail.com>
 <ba3cde730ae072ba1088e396dd7d03482e4c4011.1736334615.git.oleksii.kurochko@gmail.com>
 <347b4bb0-5fd1-439f-9e3b-ef13ac89bbe9@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <347b4bb0-5fd1-439f-9e3b-ef13ac89bbe9@suse.com>

This is a multi-part message in MIME format.
--------------E4oC060um80aI3lOPnfbVY73
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 1/27/25 12:23 PM, Jan Beulich wrote:
> On 08.01.2025 12:13, Oleksii Kurochko wrote:
>> Nothing changed. Only some functions declaration are moved to asm-generic
>> header as they are expected to be used by common code of domain builing or
>> dom0less.
>>
>> Signed-off-by: Oleksii Kurochko<oleksii.kurochko@gmail.com>
>> ---
>>   xen/arch/arm/include/asm/domain_build.h | 19 ++----------
>>   xen/include/asm-generic/domain-build.h  | 41 +++++++++++++++++++++++++
>>   2 files changed, 43 insertions(+), 17 deletions(-)
>>   create mode 100644 xen/include/asm-generic/domain-build.h
> Again I question this movement under this name. "Domain building" is a pretty
> generic thing, yes, but what you move would e.g. be entirely inapplicable on
> x86 (as it is now). For example ...
>
>> --- /dev/null
>> +++ b/xen/include/asm-generic/domain-build.h
>> @@ -0,0 +1,41 @@
>> +/* SPDX-License-Identifier: GPL-2.0-only */
>> +#ifndef __ASM_GENERIC_DOMAIN_BUILD_H__
>> +#define __ASM_GENERIC_DOMAIN_BUILD_H__
>> +
>> +#include <xen/types.h>
>> +
>> +struct domain;
>> +struct page_info;
>> +struct kernel_info;
>> +struct membanks;
>> +
>> +typedef bool (*alloc_domheap_mem_cb)(struct domain *d, struct page_info *pg,
>> +                                     unsigned int order, void *extra);
>> +bool allocate_domheap_memory(struct domain *d, paddr_t tot_size,
>> +                             alloc_domheap_mem_cb cb, void *extra);
>> +
>> +bool allocate_bank_memory(struct kernel_info *kinfo, gfn_t sgfn,
>> +                          paddr_t tot_size);
> ... the term "bank" seems pretty closely tied to DT. Other stuff ...
>
>> +void allocate_memory(struct domain *d, struct kernel_info *kinfo);
>> +int construct_domain(struct domain *d, struct kernel_info *kinfo);
>> +int make_chosen_node(const struct kernel_info *kinfo);
>> +int make_cpus_node(const struct domain *d, void *fdt);
>> +int make_hypervisor_node(struct domain *d, const struct kernel_info *kinfo,
>> +                         int addrcells, int sizecells);
>> +int make_memory_node(const struct kernel_info *kinfo, int addrcells,
>> +                     int sizecells, const struct membanks *mem);
>> +int make_timer_node(const struct kernel_info *kinfo);
> ... here also falls in this category. Stuff like this may well live
> under asm-generic/, but the file name chosen then needs to reflect
> constraints.

Unfortunately, at least at the moment, this is not applicable to x86.

Partially, domain_build.h was chosen to have less changes in Arm code.

Would it be better to use domain-build-dt.h?

~ Oleksii

--------------E4oC060um80aI3lOPnfbVY73
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
    <div class="moz-cite-prefix">On 1/27/25 12:23 PM, Jan Beulich wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:347b4bb0-5fd1-439f-9e3b-ef13ac89bbe9@suse.com">
      <pre wrap="" class="moz-quote-pre">On 08.01.2025 12:13, Oleksii Kurochko wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">Nothing changed. Only some functions declaration are moved to asm-generic
header as they are expected to be used by common code of domain builing or
dom0less.

Signed-off-by: Oleksii Kurochko <a class="moz-txt-link-rfc2396E" href="mailto:oleksii.kurochko@gmail.com">&lt;oleksii.kurochko@gmail.com&gt;</a>
---
 xen/arch/arm/include/asm/domain_build.h | 19 ++----------
 xen/include/asm-generic/domain-build.h  | 41 +++++++++++++++++++++++++
 2 files changed, 43 insertions(+), 17 deletions(-)
 create mode 100644 xen/include/asm-generic/domain-build.h
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Again I question this movement under this name. "Domain building" is a pretty
generic thing, yes, but what you move would e.g. be entirely inapplicable on
x86 (as it is now). For example ...

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">--- /dev/null
+++ b/xen/include/asm-generic/domain-build.h
@@ -0,0 +1,41 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef __ASM_GENERIC_DOMAIN_BUILD_H__
+#define __ASM_GENERIC_DOMAIN_BUILD_H__
+
+#include &lt;xen/types.h&gt;
+
+struct domain;
+struct page_info;
+struct kernel_info;
+struct membanks;
+
+typedef bool (*alloc_domheap_mem_cb)(struct domain *d, struct page_info *pg,
+                                     unsigned int order, void *extra);
+bool allocate_domheap_memory(struct domain *d, paddr_t tot_size,
+                             alloc_domheap_mem_cb cb, void *extra);
+
+bool allocate_bank_memory(struct kernel_info *kinfo, gfn_t sgfn,
+                          paddr_t tot_size);
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
... the term "bank" seems pretty closely tied to DT. Other stuff ...

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+void allocate_memory(struct domain *d, struct kernel_info *kinfo);
+int construct_domain(struct domain *d, struct kernel_info *kinfo);
+int make_chosen_node(const struct kernel_info *kinfo);
+int make_cpus_node(const struct domain *d, void *fdt);
+int make_hypervisor_node(struct domain *d, const struct kernel_info *kinfo,
+                         int addrcells, int sizecells);
+int make_memory_node(const struct kernel_info *kinfo, int addrcells,
+                     int sizecells, const struct membanks *mem);
+int make_timer_node(const struct kernel_info *kinfo);
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
... here also falls in this category. Stuff like this may well live
under asm-generic/, but the file name chosen then needs to reflect
constraints.</pre>
    </blockquote>
    <pre>Unfortunately, at least at the moment, this is not applicable to x86.

Partially, domain_build.h was chosen to have less changes in Arm code.

Would it be better to use domain-build-dt.h?

</pre>
    <pre>~ Oleksii</pre>
  </body>
</html>

--------------E4oC060um80aI3lOPnfbVY73--

