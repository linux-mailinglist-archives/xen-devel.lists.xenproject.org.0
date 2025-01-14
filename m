Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D7BB6A101CC
	for <lists+xen-devel@lfdr.de>; Tue, 14 Jan 2025 09:12:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.870986.1282032 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tXc1u-0006fg-4e; Tue, 14 Jan 2025 08:12:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 870986.1282032; Tue, 14 Jan 2025 08:12:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tXc1u-0006ds-1v; Tue, 14 Jan 2025 08:12:06 +0000
Received: by outflank-mailman (input) for mailman id 870986;
 Tue, 14 Jan 2025 08:12:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/Vp6=UG=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tXc1s-0006dW-Bd
 for xen-devel@lists.xenproject.org; Tue, 14 Jan 2025 08:12:04 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3c2c17dd-d24f-11ef-a0e1-8be0dac302b0;
 Tue, 14 Jan 2025 09:12:02 +0100 (CET)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-4361f65ca01so49320805e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 14 Jan 2025 00:12:02 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38a9fcb7a11sm8635485f8f.75.2025.01.14.00.12.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Jan 2025 00:12:01 -0800 (PST)
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
X-Inumbo-ID: 3c2c17dd-d24f-11ef-a0e1-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1736842322; x=1737447122; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rVPBaSFPjmA2kyXdA9hPx66yC6feJXixJ8t3pYb10Ig=;
        b=b19RBtVwugnt8tmT8kGfhO1f6ZTd82ADT0tFMPkXg/GPdiSo8GtmkE+qg3Gr29eR4o
         OW4abKQxrM+PvLEhUitM4Oz4ogsgXcjlTd3wPKbKAgey7ApcD1p5J7CWxSSOtwNCDNwl
         5+OGERjvTwzIRz/6YV5OgnsvuezI0AaNHvPeDQTujZXd1f5arMw/tzq9KAmNeE2c1D/Q
         QkZ4LuVl9y7AbD8DzlTuDUN7LtEr87UtyVB/+wLz3hBu6++r18ty7SyMc0C6VbQil22o
         JsUzipZxBJzWN1emGMJVUdC4Pnhj5Xh1mXOLFWfcD6Kx/x/t1MJvckxK9DErvg5u0uK3
         Y1Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736842322; x=1737447122;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rVPBaSFPjmA2kyXdA9hPx66yC6feJXixJ8t3pYb10Ig=;
        b=MGzel5qWcMK9KeqAbgeAtJ1VJW5lIjEo9AHNAH5rhrOfgi9I9YxNza61NB+FvZkG+F
         NoLrdJZu/aGQG5U/IzRwuWJ07807/Hwfokaew0drsVu4UJeeITA6NnDPGFQftwVXXVXi
         bEQLpF+1YJQWB30V1HuCbOnUN0XwSYNYUxt/yGdBhMT7FeJQEBvZiTHHk1/bfeCxtbLP
         inKRbpW4TBjM2+Ah8wpOkmTf7mq0NYQa6tV2kNE0jCbr+eXV3sntV1xCa2dBYg3hEEjY
         AbnGIrjo143IiM/j0AiCk239olAkwFI55EME332EXrTuHdmN5jaEoDcLhU3sqO/Okws0
         h8xA==
X-Gm-Message-State: AOJu0YyYIWBqijoqmerOz0Ls8erlcGGyNfh3TciUOJ3vlZR26on1nkwT
	8tmitAFjJH0gngzGNIF8zjlb3tkIcdH7WJbepuCrFTals7eIB+kbQaU8PsFgF6flu0h+N7INCs8
	=
X-Gm-Gg: ASbGncs484Rup+5Kl556A9aMkQyymFnTQHVY7nFX+tF7nq6AbCzrHUOypyBKTcN4wwm
	0h9Vf52VxF/9eDeDvRKifkhOeqIDHguzy+vwheAnqaBJKggn2g8EUVFdJXFkfEqeo1M/MPl1RbY
	YaQd8hLbgYGDPEiC9D9ShGroUsLgUZb9qJn5te/bTbqHTQbvNh8vbOThMLvd8DnZ4KUN4RU/9UO
	3c0lTpehPpsfDvkeBmfjzk47JcjGduNsm9ZfL/RX3+RcMwcIkq2dzIJZpPCeysjlKuYo55VyFXs
	FZrfZ8kU/ugGH8b01v3LVcyvFYA0CE4w8pWvhs99eQ==
X-Google-Smtp-Source: AGHT+IESFwavgYsznOM1HhEtPAGrja370bElM2W7yO561xu1E1jsst4LzWlP9213pkRh/c4Xf9EuBg==
X-Received: by 2002:a05:600c:4511:b0:436:5165:f1ec with SMTP id 5b1f17b1804b1-436e271d428mr236428095e9.30.1736842322137;
        Tue, 14 Jan 2025 00:12:02 -0800 (PST)
Message-ID: <f751c5f0-3895-43bb-874b-3611b7916133@suse.com>
Date: Tue, 14 Jan 2025 09:12:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] xl: properly dispose of libxl_dominfo struct instances
Autocrypt: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJgBBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AACgkQoDSui/t3IH4J+wCfQ5jHdEjCRHj23O/5ttg9r9OIruwAn3103WUITZee
 e7Sbg12UgcQ5lv7SzsFNBFk3nEQQCACCuTjCjFOUdi5Nm244F+78kLghRcin/awv+IrTcIWF
 hUpSs1Y91iQQ7KItirz5uwCPlwejSJDQJLIS+QtJHaXDXeV6NI0Uef1hP20+y8qydDiVkv6l
 IreXjTb7DvksRgJNvCkWtYnlS3mYvQ9NzS9PhyALWbXnH6sIJd2O9lKS1Mrfq+y0IXCP10eS
 FFGg+Av3IQeFatkJAyju0PPthyTqxSI4lZYuJVPknzgaeuJv/2NccrPvmeDg6Coe7ZIeQ8Yj
 t0ARxu2xytAkkLCel1Lz1WLmwLstV30g80nkgZf/wr+/BXJW/oIvRlonUkxv+IbBM3dX2OV8
 AmRv1ySWPTP7AAMFB/9PQK/VtlNUJvg8GXj9ootzrteGfVZVVT4XBJkfwBcpC/XcPzldjv+3
 HYudvpdNK3lLujXeA5fLOH+Z/G9WBc5pFVSMocI71I8bT8lIAzreg0WvkWg5V2WZsUMlnDL9
 mpwIGFhlbM3gfDMs7MPMu8YQRFVdUvtSpaAs8OFfGQ0ia3LGZcjA6Ik2+xcqscEJzNH+qh8V
 m5jjp28yZgaqTaRbg3M/+MTbMpicpZuqF4rnB0AQD12/3BNWDR6bmh+EkYSMcEIpQmBM51qM
 EKYTQGybRCjpnKHGOxG0rfFY1085mBDZCH5Kx0cl0HVJuQKC+dV2ZY5AqjcKwAxpE75MLFkr
 wkkEGBECAAkFAlk3nEQCGwwACgkQoDSui/t3IH7nnwCfcJWUDUFKdCsBH/E5d+0ZnMQi+G0A
 nAuWpQkjM1ASeQwSHEeAWPgskBQL
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

The ssid_label field requires separate freeing; make sure to call
libxl_dominfo_dispose(). And then, for good measure, also
libxl_dominfo_init().

Coverity-ID: 1638727
Coverity-ID: 1638728
Fixes: c458c404da16 ("xl: use libxl_domain_info to get the uuid in printf_info")
Fixes: 48dab9767d2e ("tools/xl: use libxl_domain_info to get domain type for vcpu-pin")
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
I wasn't quite sure about use of libxl_dominfo_init(): vcpuset(), for
example, doesn't call it.

--- a/tools/xl/xl_sxp.c
+++ b/tools/xl/xl_sxp.c
@@ -45,8 +45,10 @@ void printf_info_sexp(int domid, libxl_d
     /* retrieve the UUID from dominfo, since it is probably generated
      * during parsing and thus does not match the real one
      */
+    libxl_dominfo_init(&info);
     if (libxl_domain_info(ctx, &info, domid) == 0) {
         fprintf(fh, "\t(uuid " LIBXL_UUID_FMT ")\n", LIBXL_UUID_BYTES(info.uuid));
+        libxl_dominfo_dispose(&info);
     } else {
         fprintf(fh, "\t(uuid <unknown>)\n");
     }
--- a/tools/xl/xl_vcpu.c
+++ b/tools/xl/xl_vcpu.c
@@ -286,6 +286,8 @@ int main_vcpupin(int argc, char **argv)
     if (!ignore_masks && hard) {
         libxl_dominfo dominfo;
 
+        libxl_dominfo_init(&dominfo);
+
         if (libxl_domain_info(ctx, &dominfo, domid)) {
             fprintf(stderr, "Could not get domain info\n");
             goto out;
@@ -293,6 +295,8 @@ int main_vcpupin(int argc, char **argv)
 
         /* HVM and PVH domains use the same global affinity mask */
         apply_global_affinity_masks(dominfo.domain_type, hard, 1);
+
+        libxl_dominfo_dispose(&dominfo);
     }
 
     if (force) {

