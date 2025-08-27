Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FD3EB37A0E
	for <lists+xen-devel@lfdr.de>; Wed, 27 Aug 2025 07:57:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1095522.1450487 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ur99i-0005z8-Sg; Wed, 27 Aug 2025 05:57:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1095522.1450487; Wed, 27 Aug 2025 05:57:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ur99i-0005xQ-Oz; Wed, 27 Aug 2025 05:57:10 +0000
Received: by outflank-mailman (input) for mailman id 1095522;
 Wed, 27 Aug 2025 05:57:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Gy2E=3H=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ur99h-0005xI-CX
 for xen-devel@lists.xenproject.org; Wed, 27 Aug 2025 05:57:09 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a9fe7d1b-830a-11f0-b898-0df219b8e170;
 Wed, 27 Aug 2025 07:57:07 +0200 (CEST)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-afcb73394b4so910507666b.0
 for <xen-devel@lists.xenproject.org>; Tue, 26 Aug 2025 22:57:07 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-afe9c908431sm354167666b.92.2025.08.26.22.57.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Aug 2025 22:57:06 -0700 (PDT)
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
X-Inumbo-ID: a9fe7d1b-830a-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1756274227; x=1756879027; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uxSd+napYPGy30Ljg8q5ThlKlaXeb0SXlCDtdIj8V6g=;
        b=Mm2vR3iyrqrD9BQi+/6U5oPVplW4EQb7se6RXgOPeXMhpisg7qKqtSqK2uo185CkSU
         Gv9OULTgJXKSFQV/FZRbZmTSSeDvsUaVr/GtLdjUQP98oL/saaMBsqYWj4egFq/FSZMN
         WRWEcWdu7NoKwC39D0/Wza2GBPTGbUOrkUdjxDzQR8YTq4K2OxnZjA5WsMVp5csM2UhS
         OXonyxPniPlLGZb04aV2taCIU3OxQCZT3prEoZkwbWvo+ZV6lt/IPu0gDuS7YWIZNNOE
         8jVY/e21TJhNoEkQDhlWL5vN5dxOM5mdnfsP1fyDj7Ze7LR2E4MlzvXEjQlD2eAwyYki
         Uq3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756274227; x=1756879027;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uxSd+napYPGy30Ljg8q5ThlKlaXeb0SXlCDtdIj8V6g=;
        b=S34YiwLN8v9EWpYcT1wFw93yfBe3OWvgpGVPwmlFsflGeMt8LeLok+ExY30Nm7yrXm
         abOULlW6F0k9RVzwIMyk4Z51u/CQC/FPWC5Ry/PQ+T7FrMLKevCtyzPsmupJnOPpQl2X
         OtaHtiXwWGSNsoBdRm4j6Y3KuC9C4uFt/bs+kh7tcSfm2jisnAQc4F+HvajPdC8fZGTA
         9j1aORC4ea5rxwgUeqYRi2by77nHWHzjAfSESrNqwPy6s/OiDKlQXR4HEDjLv+7vkHaJ
         0ovkw3r+Os6eVIiBdmbLyRkWcub2cpx00+5FCOfalXvlDPEhAAE5HTRK6RzSaiQ6vGXC
         pF1Q==
X-Gm-Message-State: AOJu0Yw6BPJAkxluKoKBgTBWvH9TM6z3HRJC/QTV72NxnnKXxSLZ0qjF
	WV5RJ3/e6hWxOfKkHo367OjuI+ZlCRdVYUBgxZpEKzCdWkybvmphswcXmjvTk20QPT5eSR9AqEn
	6v+E=
X-Gm-Gg: ASbGncsPzxlTh6awXcCxTvOwC9C3p+xX7Kj9rzR6gwsFGU1fHRnx+SHLP+sGqOnJgst
	uxLGcFwKfPqBZIG7xkicPD4rxyRz+hOLfVChmvjOPjQMfQZJYWy6BFfn0vieD8eACDP8ed4vcOV
	alLRyOobBfpGUYZXrBvp7dEchFfQjcsqelmrecTkRgAAoJ9o0st5DVnYDx2cgbdICKqQuHnWYw3
	E5ARzjYIENE3+rqZHxoqMnGsBEcuss1nt4qc2Qf23Ky6thCZvX2QZR9gOX3H1pc+q3Cuo7rd78h
	hhsWIyZ8Mk5uhe+kkgMTsguehoWQHtwCfZ26N71UcH0rvS4N3Qm7y7ZmkIyfCjJQbJkANfctSee
	7Ah3BHg9MuVKS7NQgW6mXPMa1TLW07/B0N7UR9SkeYLfv4k5nuM/LYBgFOzcbk6KqDoWwMDel8R
	GJvPFlm48=
X-Google-Smtp-Source: AGHT+IHoNwMtqgvjo7yNognA1mtpNilFqYn6bUqxN9qRLJ+5PfC3IY4ToJwhFlTzuM/amvfRCURkKA==
X-Received: by 2002:a17:907:849:b0:afe:74f1:dbf2 with SMTP id a640c23a62f3a-afe74f1df73mr966017466b.30.1756274226926;
        Tue, 26 Aug 2025 22:57:06 -0700 (PDT)
Message-ID: <e567c234-473d-40c3-86dc-53317812baf7@suse.com>
Date: Wed, 27 Aug 2025 07:57:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Juergen Gross <jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] libxl: preserve errno in libxl__xcinfo2xlinfo()
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

Callers observing errors elsewhere may be confused by the ENOSYS that
the Flask operation would yield on a Flask-disabled hypervisor.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Of course I don't know whether clobbering errno is perhaps deemed "fine"
in libxl.

--- a/tools/libs/light/libxl_domain.c
+++ b/tools/libs/light/libxl_domain.c
@@ -277,6 +277,7 @@ void libxl__xcinfo2xlinfo(libxl_ctx *ctx
                           libxl_dominfo *xlinfo)
 {
     size_t size;
+    int saved_errno = errno;
 
     memcpy(&(xlinfo->uuid), xcinfo->handle, sizeof(xen_domain_handle_t));
     xlinfo->domid = xcinfo->domain;
@@ -284,6 +285,7 @@ void libxl__xcinfo2xlinfo(libxl_ctx *ctx
     if (libxl_flask_sid_to_context(ctx, xlinfo->ssidref,
                                    &xlinfo->ssid_label, &size) < 0)
         xlinfo->ssid_label = NULL;
+    errno = saved_errno;
 
     xlinfo->dying      = !!(xcinfo->flags&XEN_DOMINF_dying);
     xlinfo->shutdown   = !!(xcinfo->flags&XEN_DOMINF_shutdown);

