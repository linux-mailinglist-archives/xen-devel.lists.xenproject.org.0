Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 87DB4BF0D38
	for <lists+xen-devel@lfdr.de>; Mon, 20 Oct 2025 13:26:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1146231.1478689 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vAo2I-0008RV-1E; Mon, 20 Oct 2025 11:26:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1146231.1478689; Mon, 20 Oct 2025 11:26:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vAo2H-0008PU-Td; Mon, 20 Oct 2025 11:26:45 +0000
Received: by outflank-mailman (input) for mailman id 1146231;
 Mon, 20 Oct 2025 11:26:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7iz2=45=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vAnvv-0001y1-Hx
 for xen-devel@lists.xenproject.org; Mon, 20 Oct 2025 11:20:11 +0000
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [2a00:1450:4864:20::435])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bdb4c719-ada6-11f0-9d15-b5c5bf9af7f9;
 Mon, 20 Oct 2025 13:20:11 +0200 (CEST)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-426f1574a14so3118878f8f.3
 for <xen-devel@lists.xenproject.org>; Mon, 20 Oct 2025 04:20:11 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-427ea5b3c65sm14775468f8f.15.2025.10.20.04.20.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Oct 2025 04:20:09 -0700 (PDT)
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
X-Inumbo-ID: bdb4c719-ada6-11f0-9d15-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1760959210; x=1761564010; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=4ft3MIA/0HMfE9mn1CrSRGwasVj918sVnbBRryONFvI=;
        b=KchrSwBYdFKlg9rBgtvq/FVuIq6lS4C1xMIgvoSd5JSUeIcHo5kxFzs6Ys7gvkuO/q
         VClNQIvVIuYjLzdhJ8nqroP8S5zJQSGHyKFMUjiU5gOTceQHN16sq2eF7dib9B5RFaFa
         2aIT+uO4/Idxi3vZ/3bGZX3OGx/ZZX+O/qpyGUuZwp8sHnzRQy732GamQ4bWfAwMjg/6
         oSVIlSUXMQjYuIQiUxbvRw4saMPv4tBPIqCCUiye28hC1O3O6Xi0ua/KmSkingw5qBwr
         5CSw3NOKNNwt+mfZaYLqyjTmhqbKPO8x1JE+AapC7RBgEBQYx0yxKt66RNWTlF/ZGFC2
         VYCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760959210; x=1761564010;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4ft3MIA/0HMfE9mn1CrSRGwasVj918sVnbBRryONFvI=;
        b=gjQRpF3Qw8RgXuYENend5CveGLTQdVVdS0e0w17mDnP5rNeLUFQBC3uZ4k5YQxf9Zc
         zaE62Am8F45ArStqLIIGuX9DFr5cJ+hgvoo8G+ATiuBpXA2i6WdgUq1t+pl18fwU9onM
         NQq/0kXafENP83dAVHYAoTFWF9c7tCIqPldt3BCDART6+0R6U2BAAYfyFL0Gy7AFybLS
         c23RpHBowjGIBWmjkY0jo9W8dwpuEz9bGxXhPKjhksW2E+GnzbP3KDByYc8H2dLeSkJp
         k0ZzmuiJQ2pDJuNItjHxRJI55ZFm1rdgY+ny/1W7bkvytPRoAuaT0vV3sDHIXppTGFmd
         eZhw==
X-Gm-Message-State: AOJu0Yw9FMjXYWPm4zNp/PuckvHUQl1kepwEUtl5cbeoPe24Y4Ermd78
	1zl6/Wqy3331SF5JTF5I9regnEG7Ley4XkZL9h/kVmCFRtBU4wJ/Yt5/MVaXRRLbNTvclRPAX21
	MH9Y=
X-Gm-Gg: ASbGncuebV0MQ0HdB1VcBfeB/FAJ1UXJ4OI3x02MA6KR/ezYkNL+4EKBg/KKFREF2oz
	wgUQA53z17brIyt4F/V9M9xzviO14ecRd3t9Xj50Fi2cbUlVBDRLdf6mnx2nGXSFNsekVcPHbVy
	N+yRn+Vv+roSg15KM4FSE6rfcnVL/N5Wr3yYDbJipTauFAaXMZjcAIqwuk9qBke2eiY0WIHweCL
	rAlHsqOg1xwEUo5PmfyxGWu3XW+XbKCgVR2RwliqOyGBVG6ObRwZ5i0jfLfslBM+dCiG/YN/xDe
	fPFiXPcFaorqt5RbjwR1+ujjpJH4WdDtQpTGrm+7BYuRk/UdRmHdyZ6JznZmzwB4XN7FIGIHZg8
	MlLQRNeSBFNMwY0yn3GoYajr9RtdqY/IKPtw9oIki9tfbMLgENW8PPdq2SgLc5g+GYT1Hl31nWZ
	oJfznc6pT52JjRdkLqpS6GkeOCew/fY2ktk/TH8NqFkPvMYSq0d4nFoLYI7pW/
X-Google-Smtp-Source: AGHT+IFtQTKy/kD9PVEIcrRDmAyEd7RxNmjmlzPY/NFMDBBs2q9i+v800+Wp2aSt0Pa8jb5qSvSR5A==
X-Received: by 2002:a05:600c:8185:b0:46f:b43a:aeed with SMTP id 5b1f17b1804b1-4711792cc0cmr88221065e9.40.1760959210236;
        Mon, 20 Oct 2025 04:20:10 -0700 (PDT)
Message-ID: <95d977f5-6ccc-4a86-9ddd-bce0f70bc476@suse.com>
Date: Mon, 20 Oct 2025 13:20:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v2 5/9] x86/HPET: make another channel flags update atomic
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <b66ea488-2d47-472c-9520-8590fdf89e0e@suse.com>
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
In-Reply-To: <b66ea488-2d47-472c-9520-8590fdf89e0e@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Unlike the setting of HPET_EVT_LEGACY in hpet_broadcast_init(), the
setting of HPET_EVT_DISABLE in hpet_disable_legacy_broadcast() isn't init-
only and hence can race other flag manipulation (not all of which occur
while holding the channel's lock). While possibly any such updates would
only ever occur when HPET_EVT_LEGACY isn't set in the first place, this
doesn't look straightforward to prove, so better be on the safe side.

Fixes: d09486dba36a ("cpuidle: Enable hpet broadcast by default")
Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/hpet.c
+++ b/xen/arch/x86/hpet.c
@@ -723,7 +723,7 @@ void hpet_disable_legacy_broadcast(void)
 
     spin_lock_irqsave(&hpet_events->lock, flags);
 
-    hpet_events->flags |= HPET_EVT_DISABLE;
+    set_bit(HPET_EVT_DISABLE_BIT, &hpet_events->flags);
 
     /* disable HPET T0 */
     cfg = hpet_read32(HPET_Tn_CFG(0));


