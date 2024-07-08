Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F1134929EAD
	for <lists+xen-devel@lfdr.de>; Mon,  8 Jul 2024 11:09:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.755193.1163473 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sQkNE-0005hl-3Z; Mon, 08 Jul 2024 09:09:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 755193.1163473; Mon, 08 Jul 2024 09:09:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sQkNE-0005fK-02; Mon, 08 Jul 2024 09:09:28 +0000
Received: by outflank-mailman (input) for mailman id 755193;
 Mon, 08 Jul 2024 09:09:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=suqh=OI=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sQkND-0005fC-0j
 for xen-devel@lists.xenproject.org; Mon, 08 Jul 2024 09:09:27 +0000
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [2a00:1450:4864:20::236])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c5fb4fa5-3d09-11ef-bbfb-fd08da9f4363;
 Mon, 08 Jul 2024 11:09:25 +0200 (CEST)
Received: by mail-lj1-x236.google.com with SMTP id
 38308e7fff4ca-2ee92f7137bso29456931fa.1
 for <xen-devel@lists.xenproject.org>; Mon, 08 Jul 2024 02:09:25 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1fb717bc129sm33567285ad.263.2024.07.08.02.09.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Jul 2024 02:09:24 -0700 (PDT)
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
X-Inumbo-ID: c5fb4fa5-3d09-11ef-bbfb-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1720429765; x=1721034565; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:cc
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=0nKUeIdbdCUGNmYqPshJCqwXDjCi4FUnQTJEQONoPEc=;
        b=Qlvi+rThdDOPPvosB1bX4lt714iXJAtZ3QVjDaNy1uWY+o+LnryOpwkg2+A3Ar/3kJ
         RUhEkKZFLnCdZeT81WxkbzlbizfwxKZFSDaiCeAKN8PwUayyTSEjsjMpp2YWmW4KKj7b
         Ll41Go+D6iYPdtmU0m2AIjuV1MPtQt1Dc3qZoKE8HnAF2g3jjlcTvPczc84QXkfRzctl
         QLFdChy1jap23bMVuiVeqTVuhrD5Z1JuGeg5+yzPeDJg7NXD7Bq3aYt8KIX2pKJJStqu
         iKmDjYXRk+W8vEn+YhV132U5+Cg9aQJRk+rMFak91OJGEdIP2+V1VdldTU+yz+raQ5vb
         rPfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720429765; x=1721034565;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:cc
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0nKUeIdbdCUGNmYqPshJCqwXDjCi4FUnQTJEQONoPEc=;
        b=Kx8RZTZYeSTg4kddQ82iOM1/mXFuuFy+o/FHeAKEYebfMnxcyrbXLZvkoeV+uadbeb
         /Z8subwkI8jQs45VBv1+zXoFJ/cU7T5ECJS2O4y9NISp+ynyQKzY+ruNVuvlUFpXDYvr
         uYVsDENgRx2owUaEld8fa9+aQlKvUYqQulsa1o5yusREOgXi1isb+uKEt10aiGN6dQNO
         yu42gWo+HJ/T0Tcli+xpFydLQVC19q8l8coa6R+AJE4VKY47kJXQtmdTB8u8KS5CIdBr
         MU4WbAjKrYLBs/XXezWgEIhm5M7hCtjNBqv7kO4bbjjn0sAlnLNWR43zKiiRrawWha+g
         rF1Q==
X-Gm-Message-State: AOJu0YyLM3wK53X8An/dD93ABYe9Y/m9yrxhvHCAbNd4ynYuI75ybgbh
	eQ2dOWhukp/C9uaOT8AA5dehrMNjmVaz7ctHINSNif1LM8YFvEislwygThKAQw==
X-Google-Smtp-Source: AGHT+IHNVfCp2CSZqnCMI+3oOOf8CCQaxf2AyTlsmQIGfeXpVvJ8zlkq09yqgXQIWjnEokmiUqzNtQ==
X-Received: by 2002:a2e:9684:0:b0:2ee:893e:4efc with SMTP id 38308e7fff4ca-2ee8ed69c50mr96106941fa.10.1720429765250;
        Mon, 08 Jul 2024 02:09:25 -0700 (PDT)
Message-ID: <9d3d1e2e-738e-4ed8-a771-ca541fde9002@suse.com>
Date: Mon, 8 Jul 2024 11:09:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: GNTTABOP_setup_table yields -1 PFNs
To: Taylor R Campbell <riastradh-xen-devel@NetBSD.org>
References: <20240706022242.3238584D44@mail.netbsd.org>
Content-Language: en-US
Cc: xen-devel@lists.xenproject.org
From: Jan Beulich <jbeulich@suse.com>
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
In-Reply-To: <20240706022242.3238584D44@mail.netbsd.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06.07.2024 04:22, Taylor R Campbell wrote:
> On a Xen 4.14 host (with extraversion=.0.88.g1d1d1f53), with version 1
> grant tables, where GNTTABOP_query_size initially returns nr_frames=32
> max_nr_frames=64, a NetBSD guest repeatedly queries
> GNTTABOP_setup_table for successively larger nr_frames from 1 up.

First question: Is there some earlier GNTTABOP_setup_table that you invoke?
I'd expect (and also observe) nr_frames=1 initially.

Second: The version you name is pretty unclear from an upstream perspective.
Leaving aside that 4.14 is out of support, it's entirely unclear whether you
at least have all bug fixes in place that we have upstream (4.14.6). Without
that it's hard to see what you're asking for.

> The guest initially gets arrays of valid-looking PFNs.  But then at
> nr_frames=33, the PFNs [0] through [31] in the resulting array are
> valid but PFN [32] is -1, i.e., all bits set.
> 
> GNTTABOP_setup_table returned 0 and op.status = GNTST_okay, so it
> didn't fail -- it just returned an invalid PFN.  And _after_
> GNTTABOP_setup_table yields -1 as a PFN, GNTTABOP_query_size returns
> nr_frames=33 max_nr_frames=64, so the host thinks it has successfully
> allocated more frames.
> 
> What could cause the host to return a PFN -1?  Is there anything the
> guest does that could provoke this?  Are there any diagnostics that
> the guest could print to help track this down?  (I don't control the
> host.)  Should a guest just check for -1 and stop as if it had hit
> max_nr_frames?

I'm afraid for the moment, from just the information provided, I can't
reproduce this using a simple patch on top of XTF's self-test (see below).
Neither with a 64-bit PV guest, nor with a 32-bit one. I've been doing
this with a pretty recent 4.19 Xen, though.

Jan

--- a/include/xen/grant_table.h
+++ b/include/xen/grant_table.h
@@ -275,6 +275,23 @@ struct gnttab_setup_table
 };
 
 /*
+ * GNTTABOP_query_size: Query the current and maximum sizes of the shared
+ * grant table.
+ * NOTES:
+ *  1. <dom> may be specified as DOMID_SELF.
+ *  2. Only a sufficiently-privileged domain may specify <dom> != DOMID_SELF.
+ */
+#define GNTTABOP_query_size           6
+struct gnttab_query_size {
+    /* IN parameters. */
+    domid_t  dom;
+    /* OUT parameters. */
+    uint32_t nr_frames;
+    uint32_t max_nr_frames;
+    int16_t  status;              /* => enum grant_status */
+};
+
+/*
  * GNTTABOP_unmap_and_replace: Destroy one or more grant-reference mappings
  * tracked by <handle> but atomically replace the page table entry with one
  * pointing to the machine address under <new_addr>.  <new_addr> will be
--- a/tests/selftest/main.c
+++ b/tests/selftest/main.c
@@ -230,6 +230,57 @@ static void test_driver_init(void)
     if ( rc )
         xtf_failure("Fail: xtf_init_grant_table(1) returned %d\n", rc);
 
+    struct gnttab_query_size query = { .dom = DOMID_SELF };
+    rc = hypercall_grant_table_op(GNTTABOP_query_size, &query, 1);
+    if ( rc )
+        xtf_failure("Fail: GNTTABOP_query_size returned %d\n", rc);
+    if ( query.status != GNTST_okay )
+        xtf_failure("Fail: GNTTABOP_query_size status %d\n", query.status);
+    printk("gnttab: nr=%u max=%u\n", query.nr_frames, query.max_nr_frames);
+
+    unsigned long frame_list[36], prev[ARRAY_SIZE(frame_list)];
+    if ( query.max_nr_frames > ARRAY_SIZE(frame_list) )
+        query.max_nr_frames = ARRAY_SIZE(frame_list);
+
+    if ( query.max_nr_frames > 32 )
+    {
+        struct gnttab_setup_table setup = {
+            .dom = DOMID_SELF,
+            .nr_frames = 32,
+            .frame_list = frame_list,
+        };
+
+        rc = hypercall_grant_table_op(GNTTABOP_setup_table, &setup, 1);
+        if ( rc )
+            xtf_failure("Fail: GNTTABOP_setup_table(%u) returned %d (%u)\n",
+                        setup.nr_frames, rc, query.max_nr_frames);
+        if ( setup.status != GNTST_okay )
+            xtf_failure("Fail: GNTTABOP_setup_table(%u) status %d (%u)\n",
+                        setup.nr_frames, setup.status, query.max_nr_frames);
+        printk("gnttab: tbl[%u] @ %lx\n",
+               setup.nr_frames - 1, frame_list[setup.nr_frames - 1]);
+    }
+
+    for ( unsigned int n = 1; n <= query.max_nr_frames; ++n )
+    {
+        struct gnttab_setup_table setup = {
+            .dom = DOMID_SELF,
+            .nr_frames = n,
+            .frame_list = frame_list,
+        };
+
+        rc = hypercall_grant_table_op(GNTTABOP_setup_table, &setup, 1);
+        if ( rc )
+            xtf_failure("Fail: GNTTABOP_setup_table(%u) returned %d\n", n, rc);
+        if ( setup.status != GNTST_okay )
+            xtf_failure("Fail: GNTTABOP_setup_table(%u) status %d\n", n, setup.status);
+        printk("gnttab: tbl[%u] @ %lx\n", n - 1, frame_list[n - 1]);
+        for ( unsigned int i = 0; i < n - 1; ++i )
+            if ( frame_list[i] != prev[i] )
+                printk("gnttab: %lx != %lx\n", frame_list[i], prev[i]);
+        memcpy(prev, frame_list, n * sizeof(*frame_list));
+    }
+
     rc = xtf_init_grant_table(2);
     if ( rc && rc != -ENODEV )
         xtf_failure("Fail: xtf_init_grant_table(2) returned %d\n", rc);



