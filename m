Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D0A6CF8A3F
	for <lists+xen-devel@lfdr.de>; Tue, 06 Jan 2026 14:58:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1196157.1514037 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vd7Zg-00019V-Uu; Tue, 06 Jan 2026 13:58:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1196157.1514037; Tue, 06 Jan 2026 13:58:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vd7Zg-000173-RK; Tue, 06 Jan 2026 13:58:16 +0000
Received: by outflank-mailman (input) for mailman id 1196157;
 Tue, 06 Jan 2026 13:58:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jshP=7L=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vd7Ze-0000Ic-Rh
 for xen-devel@lists.xenproject.org; Tue, 06 Jan 2026 13:58:14 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bddc0357-eb07-11f0-9ccf-f158ae23cfc8;
 Tue, 06 Jan 2026 14:58:13 +0100 (CET)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-47bdbc90dcaso7326685e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 06 Jan 2026 05:58:13 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47d7f70bc4fsm43681615e9.15.2026.01.06.05.58.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Jan 2026 05:58:12 -0800 (PST)
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
X-Inumbo-ID: bddc0357-eb07-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1767707893; x=1768312693; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=r/ifospxoAmGxl7rlu8s5a4uuTwWZrTxZ5REb4+DRPA=;
        b=PVx4I6E/vCgBOBWGd6SBBiAbDNkwvO0dxRYtitW1wc15bmktNcaU4gcZTlpD5e7N8f
         TcWyN/tFeBocW3dxZDpIajBLZQ/eDX4zU9mO9ofwCMQk2Ocug8nK74vUmV8mR/VZkoAv
         da7hKC1uWmEsrtu8/+9ystgx2NyNPoBTQT2Eli2iLqunX/n3y0iU/1C4Vl9Jdt//tSvT
         wksyj8O2yQgSnpXk6Bi6HsBrp9empRMH3JiG5drl+CzDcURR5qyqU0wLb6XOauvmY+qd
         twkIq3mw7MjGEi4tvqLBigM8GEIHZxLDDPQGkQn2P2KpHzIuIS13l3Y700R3hp4XeHVH
         1DQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767707893; x=1768312693;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r/ifospxoAmGxl7rlu8s5a4uuTwWZrTxZ5REb4+DRPA=;
        b=Curwb+0/8luzzyt4HXs+/uCfB+L6G2Mh2RA/TiYqHkGcyB+NQoVcL6Q8904bmSMa6s
         pZijoD+hXgnFM40EP57faSkBxh0MRYReOFgg+mlOybK22kZ6fIDnXC+sCdR3qubZ5iOd
         S78mm0Luks9SRqeXizLB7z4m+H0C9GO9qJsZjCE4pgssHBASNOB4iS3dh7NPkJC07EbO
         Mb1o3d+MBOtwKJMPwiir8DdJrzh4gg0UZgRFPHhQPrDgPJMVQ6gvoRtkbhT/hRrp5zRz
         vvmAb6c9/TnmR8Li+BBMhcsjt6vYfMZhS7FFq7FcrX/eKhRYz2G1SVnIBFg0/yMnEnQt
         birw==
X-Gm-Message-State: AOJu0YwYkqtE5FPgLj3VL7tId7fLgJjoo9GQY0b7NNN3Ah31Mc3272nW
	DVoNya6d7aw4J1RRcg0SsEvkP6585ahh66So96vvQTrPcBsif047mHg24yTMGTMVullMD7bzxTG
	aOPo=
X-Gm-Gg: AY/fxX4lyCTfFVqLzzr0nDKgk9blQSzWG2yxuQ0hONozyDiWuBEsFrhlgm4t94hGUqW
	5UyUpQ/4Q6Ki+suM02K9lJ6gLOIp1ehNXBI67EGlvRcsewY5TY9lEzTDI91MAd9Z0P6aWmLVIa4
	dWd2kQAvHbmLboEKOMpSjo+H0u2LPhzIvZCHmayDJTdyAkcXbdItU+A2rKhQjZi7S+xXkEjCg/j
	sQIw/N6zvCXqJ3PTx5H3CTK3FKNS5n8z1MoHV79u8l1YWzDoB1Ltxk0I+bHRO1G0MWn1g6Wlba7
	eIzRSk5TwAU9+v72swTfBylVRG0B1AgNlqa3AeyYDohYxoINKLzUZ+Xrxdi8Ql4Vra46A82HpLa
	bNH5ENOIrBBT5/pNc4sqddBL6Uuo2y2uFzqrYJYUVgzaNefChG1PhiDUUXTKRhWa6P9Isi5lCtC
	JLXIiIkbvHnb5rSJEmljqK/oP6vIPxckHcqdkDiRTBJQgirCZXU9dVQBulaXp+WbWC5kho5WeI6
	fk=
X-Google-Smtp-Source: AGHT+IESFugYWnSWR1GVQ6MKPDsm28/iwTFbijmreacv6DKgHXqXKRAEV7WwUQVI7g9BZJmJcvPLIw==
X-Received: by 2002:a05:600c:5289:b0:475:de12:d3b5 with SMTP id 5b1f17b1804b1-47d7f0a94e9mr34155405e9.34.1767707892696;
        Tue, 06 Jan 2026 05:58:12 -0800 (PST)
Message-ID: <1f539879-3083-41d5-a2c5-c63c9161f0bf@suse.com>
Date: Tue, 6 Jan 2026 14:58:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 1/5] x86/time: deal with negative deltas in get_s_time_fixed()
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 =?UTF-8?B?0JDQvdGC0L7QvSDQnNCw0YDQutC+0LI=?= <akmarkov45@gmail.com>
References: <66a53368-9c33-436c-858e-2b2d25ae84b7@suse.com>
Content-Language: en-US
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
In-Reply-To: <66a53368-9c33-436c-858e-2b2d25ae84b7@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Callers may pass in TSC values from before the local TSC stamp was last
updated (this would in particular be the case when the TSC was latched, a
time rendezvous occurs, and the latched value is used only afterwards).
scale_delta(), otoh, deals with unsigned values, and hence would treat
negative incoming deltas as huge positive values, yielding entirely bogus
return values.

Fixes: 88e64cb785c1 ("x86/HVM: use fixed TSC value when saving or restoring domain")
Reported-by: Антон Марков <akmarkov45@gmail.com>
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
An alternative might be to have scale_delta() deal with signed deltas, yet
that seemed more risky to me.

There could likely be more Fixes: tags; the one used is the oldest
applicable one, from what I can tell.

A similar issue looks to exist in read_xen_timer() and its read_cycle()
helper, if we're scheduled out (and beck in) between reading of the TSC
and calculation of the delta (involving ->tsc_timestamp). Am I
overlooking anything there?

stime2tsc() guards against negative deltas by using 0 instead; I'm not
quite sure that's correct either.

amd_check_erratum_1474() (next to its call to tsc_ticks2ns()) has a
comment towards the TSC being "sane", but is that correct? Due to
TSC_ADJUST, rdtsc() may well return a huge value (and the TSC would then
wrap through 0 at some point). Shouldn't we subtract boot_tsc_stamp before
calling tsc_ticks2ns()?

A similar issue looks to exist in tsc_get_info(), again when rdtsc()
possibly returns a huge value due to TSC_ADJUST. Once again I wonder
whether we shouldn't subtract boot_tsc_stamp.

--- a/xen/arch/x86/time.c
+++ b/xen/arch/x86/time.c
@@ -1649,8 +1649,13 @@ s_time_t get_s_time_fixed(u64 at_tsc)
         tsc = at_tsc;
     else
         tsc = rdtsc_ordered();
-    delta = tsc - t->stamp.local_tsc;
-    return t->stamp.local_stime + scale_delta(delta, &t->tsc_scale);
+
+    if ( tsc >= t->stamp.local_tsc )
+        delta = scale_delta(tsc - t->stamp.local_tsc, &t->tsc_scale);
+    else
+        delta = -scale_delta(t->stamp.local_tsc - tsc, &t->tsc_scale);
+
+    return t->stamp.local_stime + delta;
 }
 
 s_time_t get_s_time(void)


