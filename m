Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C6CF3872188
	for <lists+xen-devel@lfdr.de>; Tue,  5 Mar 2024 15:34:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.688815.1073462 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rhVrd-0003KF-9M; Tue, 05 Mar 2024 14:33:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 688815.1073462; Tue, 05 Mar 2024 14:33:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rhVrd-0003Il-5p; Tue, 05 Mar 2024 14:33:53 +0000
Received: by outflank-mailman (input) for mailman id 688815;
 Tue, 05 Mar 2024 14:33:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Mek3=KL=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rhVrb-0003IO-8x
 for xen-devel@lists.xenproject.org; Tue, 05 Mar 2024 14:33:51 +0000
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [2a00:1450:4864:20::52a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6171e28a-dafd-11ee-a1ee-f123f15fe8a2;
 Tue, 05 Mar 2024 15:33:49 +0100 (CET)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-563d56ee65cso8639815a12.2
 for <xen-devel@lists.xenproject.org>; Tue, 05 Mar 2024 06:33:49 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 y26-20020a056402135a00b0056694006fa7sm5900656edw.70.2024.03.05.06.33.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Mar 2024 06:33:48 -0800 (PST)
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
X-Inumbo-ID: 6171e28a-dafd-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1709649229; x=1710254029; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dXAIYdOVmaJtr5P/s2+33MPZa5QVmPdxL5PDXXJoJT8=;
        b=gUWzXNYiP9+7NphhJvmdIiqi8W/1Sfax44XlAJfPWHDYvCnnXPAN6xlx59I9L2Y12q
         tYoEOzze8lnDvvXeP2h5iy3Ubbqhvcx5nj982E3fAyojvKTnRv3H7xb31SyV/kPMVslx
         sZEa8hImZnqOZ5TyldrIEgObXln3LqPfbzRzDWCrXKaCJbExkkVY2zfIFwBPTKOCO77b
         G/qrVFQnHbkK/w3quXvY0qK6ZOq5rdD4Vn+4eeS7iSt160jqBLMyvS4xO4ZMaNNS/Jdd
         2VRoA/cK6PzC6HvbY5yz3wUn93esjUmx5ZOLSlOKNlHg+8/6L/w7wXmNoTzKJy7wEnkb
         BeGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709649229; x=1710254029;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dXAIYdOVmaJtr5P/s2+33MPZa5QVmPdxL5PDXXJoJT8=;
        b=aRWbJIDEoI1/ms6wUxw8oYc8xJC1A3Vng1rNNLdjB1xL8jevhqFkllzu1VbZU4crAL
         twjlUwIbwX4ouPZVF9kHRwML/LyAvxiousOF62UTgUS5t4kKK+G7yPl4G1pvvw1JOFV+
         GjyTR5Ys1nYHZbx347cP36zXcmCluxHRmwCldEMeauZHKz82yjOl47kIWtda8rUq7MgA
         uLy0GJn+cV4spU9nSMI2vyj2K6Wj55S0U/Cbad5CshGrEc2sG1+Ol87QC4GbX+2CDt/I
         GN9NriWBGFOe9tS1AK5ugocmlrNNnjArVdC9tAe0XNBao9YUdKYDSd6jicIfl99Wo0wh
         pyOQ==
X-Gm-Message-State: AOJu0YyQsToH44uJejH//VYX9b6c2rRKnYgCxQwkgS3iQYOOMCOaZ/Jf
	yEV1Zhw7GklQB6GsO6KKNYL9+D+WOz6t89f6yU6WHXjzwcDFkWBpcQ0dgAHUdUowjeSPycvIk6k
	=
X-Google-Smtp-Source: AGHT+IHJ95z9b4X8dJ0/Ajco9LCr8fLKj1kqrm7C6Ssio3MkQudhQMnCSGKOYTWQtz/pXIrroxp7sg==
X-Received: by 2002:a05:6402:2318:b0:565:1049:c013 with SMTP id l24-20020a056402231800b005651049c013mr8348985eda.10.1709649228752;
        Tue, 05 Mar 2024 06:33:48 -0800 (PST)
Message-ID: <3aca1707-9eab-4b85-a4ae-e56508b15843@suse.com>
Date: Tue, 5 Mar 2024 15:33:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Anthony Perard <anthony.perard@citrix.com>, Wei Liu <wl@xen.org>,
 Juergen Gross <jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] 9pfsd: allow building with old glibc
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

Neither pread() / pwrite() nor O_DIRECTORY are available from glibc
2.11.3 headers without defining (e.g.) _GNU_SOURCE. Supplying the
definition unconditionally shouldn't be a problem, seeing that various
other tools/ components do so, too.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/tools/9pfsd/Makefile
+++ b/tools/9pfsd/Makefile
@@ -5,7 +5,7 @@
 XEN_ROOT = $(CURDIR)/../..
 include $(XEN_ROOT)/tools/Rules.mk
 
-CFLAGS += $(PTHREAD_CFLAGS)
+CFLAGS += $(PTHREAD_CFLAGS) -D_GNU_SOURCE
 LDFLAGS += $(PTHREAD_LDFLAGS)
 
 TARGETS := xen-9pfsd

