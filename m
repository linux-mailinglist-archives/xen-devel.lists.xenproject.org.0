Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 22CF4A97090
	for <lists+xen-devel@lfdr.de>; Tue, 22 Apr 2025 17:26:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.963026.1354151 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7FVU-0000w3-Ap; Tue, 22 Apr 2025 15:25:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 963026.1354151; Tue, 22 Apr 2025 15:25:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7FVU-0000uc-83; Tue, 22 Apr 2025 15:25:56 +0000
Received: by outflank-mailman (input) for mailman id 963026;
 Tue, 22 Apr 2025 15:25:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NnGu=XI=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1u7FIk-00053b-M7
 for xen-devel@lists.xenproject.org; Tue, 22 Apr 2025 15:12:46 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3ed5bc41-1f8c-11f0-9eb0-5ba50f476ded;
 Tue, 22 Apr 2025 17:12:46 +0200 (CEST)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-43edb40f357so39825935e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 22 Apr 2025 08:12:45 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-64-225.play-internet.pl.
 [109.243.64.225]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4406d5acdd4sm176051415e9.14.2025.04.22.08.12.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Apr 2025 08:12:44 -0700 (PDT)
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
X-Inumbo-ID: 3ed5bc41-1f8c-11f0-9eb0-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745334765; x=1745939565; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oiUqEBuY4Ss8TzKkuyi1daOGwN2KW+4XMKyBVzNRhfU=;
        b=iu+RlvdDqgpvCXHkrIohZCRyGje8Ly+uLZP64LFBxfpak68TIJmGKnodXLQtsGzYxc
         xjm8cpqoL6QKm3ZU6Dca+6R+5VyxEZxI8RDi2ba86kCrv3+lY1dF9Ko8jsvJ0M4iwbpu
         Ppoqy5J52SqpiDbkGcpwKYp9CLtmKCvAiWWtLLFqHG/S32PlozhzjLnCHk4XvqbIryNT
         Lhe1ZnKBiWmD4KRZaspwvx13uYRtgup3S08tXk3Y0aYRUKpbi/mlfoTRagZ8zko7DZb5
         r5I0gjXnhVywqyU+rz9ApXcM7cRnwArQk6av/VlI37k1g8idGmUqysPH0i2BSB7Tfmxq
         lOJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745334765; x=1745939565;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=oiUqEBuY4Ss8TzKkuyi1daOGwN2KW+4XMKyBVzNRhfU=;
        b=HEfnhpEVxP+fjY3YvmmxM36KGJuRZWENt0eYh6tdqUYUvncRxAUSjnGYqUnhRjj6uK
         UP0YhPm9lR2fJ/r/1nyq5t2sjq56i2XRDqW5CrIdCt6VMiURQIZnSVsqhom9TKbGwxAR
         fEwW/41QtnZKLoCvt4FtK+uKTf2R9SM3KvYJxlwUIikry9+O/0KWI89Q8N0vGv1ioUmn
         EkjQVOREH1zPJNbCQ9lYrBFz6ECXFjdhlpW4wh6U0wyswlXGk+bZG5oNmjvgyleJ2Rik
         jZ6g1uoiSVxjNrpPYQJ9H+WJ1gjQ2K4eThr6GGRxNeEOpXsX9Y5zCEzkPv88SWSd/QXR
         /+vg==
X-Forwarded-Encrypted: i=1; AJvYcCVtVpSwylw27zHmSf7T0V+kG6GIlviqZhMHpiXw/c9kSaZOyjiGceQ/HB8J0S4GrE/t0qV0PbHxtWU=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx5wofsWkeKBw1UC9BqBYUFW2smD4Fpo28/iSEoGbfCp+xtkOJi
	wvycU/usQ+cK777ve8TjuNUPLhh66wwxJqIWObxwDiVj+iOOl90l
X-Gm-Gg: ASbGncuW0KOLj2yXjgfCi2g4CYTa5/C+o+r0vROAKLg+7odH5CIVfq83w8u2fKrHxLc
	a/48B99PLQEz0rZh3jwRmylYD4zUX+fpIZ7EAm8MPrzOZgwfAhZUgdaKZYcfl7UmYIC5JUzQilB
	SSSLf9w22DUxSnv8YWvvegVcJ0mUo8ixXVL3Hm9xQXDlm+Rc9mTmnrXVkw80zecqSmfy6Rdmyqh
	GS/jrGRc1K0/P+tyHAVuPqxARv2bLCwbytGj+SGIw0QCXV7fEvUStRQ2dSHm5VRSfBWfbp8M4eY
	Iycp+/8U9iXWRbQHWw0RSBQCVmzqWVYb2uRQGPTVzzSKPEaU4gDCigOiQ7dmCiIpPk3eU0kKnKE
	lOxqRz3QCYwpT6GhO
X-Google-Smtp-Source: AGHT+IERZlGz/oPhzxTG22sOsD9Gd4gkfx86jY4wtwNZkuUU5qA5pBbQ/7eEDxABrgUX7pPviZVucg==
X-Received: by 2002:a05:600c:3c9b:b0:43c:ec4c:25b1 with SMTP id 5b1f17b1804b1-4406abfbcd7mr127875805e9.23.1745334765263;
        Tue, 22 Apr 2025 08:12:45 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------5dwnZhe09JW5CNlehNPefJLI"
Message-ID: <3181aaf7-e1a8-48de-8f16-dad0dfad0cdc@gmail.com>
Date: Tue, 22 Apr 2025 17:12:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/8] asm-generic: move some parts of Arm's
 domain_build.h to common
To: Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <cover.1744626032.git.oleksii.kurochko@gmail.com>
 <1c67078147c4a89e46f253f040bef5046fac9ca9.1744626032.git.oleksii.kurochko@gmail.com>
 <1e7ba51b-8943-4001-be2f-9181e7362223@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <1e7ba51b-8943-4001-be2f-9181e7362223@suse.com>

This is a multi-part message in MIME format.
--------------5dwnZhe09JW5CNlehNPefJLI
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 4/17/25 4:36 PM, Jan Beulich wrote:
> On 14.04.2025 17:56, Oleksii Kurochko wrote:
>> --- /dev/null
>> +++ b/xen/include/xen/fdt-domain-build.h
>> @@ -0,0 +1,46 @@
>> +/* SPDX-License-Identifier: GPL-2.0-only */
>> +#ifndef __XEN_FDT_DOMAIN_BUILD_H__
>> +#define __XEN_FDT_DOMAIN_BUILD_H__
>> +
>> +#include <xen/bootfdt.h>
>> +#include <xen/device_tree.h>
>> +#include <xen/fdt-kernel.h>
>> +#include <xen/types.h>
>> +
>> +#if __has_include(<asm/domain_build.h>)
>> +#   include <asm/domain_build.h>
>> +#endif
> Why is this conditional include needed? There's ...

To use everywhere just the generic header xen/fdt-domain-build.h instead of both
xen/fdt-domain-build.h and <asm/domain_build.h>.

~ Oleksii

>
>> +struct domain;
>> +struct page_info;
>> +struct membanks;
>> +
>> +typedef bool (*alloc_domheap_mem_cb)(struct domain *d, struct page_info *pg,
>> +                                     unsigned int order, void *extra);
>> +bool allocate_domheap_memory(struct domain *d, paddr_t tot_size,
>> +                             alloc_domheap_mem_cb cb, void *extra);
>> +
>> +bool allocate_bank_memory(struct kernel_info *kinfo, gfn_t sgfn,
>> +                          paddr_t tot_size);
>> +void allocate_memory(struct domain *d, struct kernel_info *kinfo);
>> +int construct_domain(struct domain *d, struct kernel_info *kinfo);
>> +int make_chosen_node(const struct kernel_info *kinfo);
>> +int make_cpus_node(const struct domain *d, void *fdt);
>> +int make_hypervisor_node(struct domain *d, const struct kernel_info *kinfo,
>> +                         int addrcells, int sizecells);
>> +int make_memory_node(const struct kernel_info *kinfo, int addrcells,
>> +                     int sizecells, const struct membanks *mem);
>> +int make_timer_node(const struct kernel_info *kinfo);
>> +
>> +unsigned int get_allocation_size(paddr_t size);
>> +
>> +#endif /* __XEN_FDT_DOMAIN_BUILD_H__ */
> ... nothing here showing any dependency thereon.
>
> Jan
--------------5dwnZhe09JW5CNlehNPefJLI
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
    <div class="moz-cite-prefix">On 4/17/25 4:36 PM, Jan Beulich wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:1e7ba51b-8943-4001-be2f-9181e7362223@suse.com">
      <pre wrap="" class="moz-quote-pre">On 14.04.2025 17:56, Oleksii Kurochko wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">--- /dev/null
+++ b/xen/include/xen/fdt-domain-build.h
@@ -0,0 +1,46 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef __XEN_FDT_DOMAIN_BUILD_H__
+#define __XEN_FDT_DOMAIN_BUILD_H__
+
+#include &lt;xen/bootfdt.h&gt;
+#include &lt;xen/device_tree.h&gt;
+#include &lt;xen/fdt-kernel.h&gt;
+#include &lt;xen/types.h&gt;
+
+#if __has_include(&lt;asm/domain_build.h&gt;)
+#   include &lt;asm/domain_build.h&gt;
+#endif
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Why is this conditional include needed? There's ...</pre>
    </blockquote>
    <pre>To use everywhere just the generic header xen/fdt-domain-build.h instead of both
xen/fdt-domain-build.h and &lt;asm/domain_build.h&gt;.

~ Oleksii
</pre>
    <blockquote type="cite"
      cite="mid:1e7ba51b-8943-4001-be2f-9181e7362223@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+struct domain;
+struct page_info;
+struct membanks;
+
+typedef bool (*alloc_domheap_mem_cb)(struct domain *d, struct page_info *pg,
+                                     unsigned int order, void *extra);
+bool allocate_domheap_memory(struct domain *d, paddr_t tot_size,
+                             alloc_domheap_mem_cb cb, void *extra);
+
+bool allocate_bank_memory(struct kernel_info *kinfo, gfn_t sgfn,
+                          paddr_t tot_size);
+void allocate_memory(struct domain *d, struct kernel_info *kinfo);
+int construct_domain(struct domain *d, struct kernel_info *kinfo);
+int make_chosen_node(const struct kernel_info *kinfo);
+int make_cpus_node(const struct domain *d, void *fdt);
+int make_hypervisor_node(struct domain *d, const struct kernel_info *kinfo,
+                         int addrcells, int sizecells);
+int make_memory_node(const struct kernel_info *kinfo, int addrcells,
+                     int sizecells, const struct membanks *mem);
+int make_timer_node(const struct kernel_info *kinfo);
+
+unsigned int get_allocation_size(paddr_t size);
+
+#endif /* __XEN_FDT_DOMAIN_BUILD_H__ */
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
... nothing here showing any dependency thereon.

Jan
</pre>
    </blockquote>
  </body>
</html>

--------------5dwnZhe09JW5CNlehNPefJLI--

