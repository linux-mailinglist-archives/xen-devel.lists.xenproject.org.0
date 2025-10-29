Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D426C1B3B6
	for <lists+xen-devel@lfdr.de>; Wed, 29 Oct 2025 15:33:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1152803.1483309 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vE7F3-0007RH-En; Wed, 29 Oct 2025 14:33:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1152803.1483309; Wed, 29 Oct 2025 14:33:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vE7F3-0007OD-BV; Wed, 29 Oct 2025 14:33:37 +0000
Received: by outflank-mailman (input) for mailman id 1152803;
 Wed, 29 Oct 2025 14:33:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=f6do=5G=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vE7F1-0007O5-Gb
 for xen-devel@lists.xenproject.org; Wed, 29 Oct 2025 14:33:35 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3fa5e978-b4d4-11f0-9d16-b5c5bf9af7f9;
 Wed, 29 Oct 2025 15:33:34 +0100 (CET)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-47114a40161so82743945e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 29 Oct 2025 07:33:34 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4771e3aae1fsm50207055e9.12.2025.10.29.07.33.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Oct 2025 07:33:33 -0700 (PDT)
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
X-Inumbo-ID: 3fa5e978-b4d4-11f0-9d16-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1761748414; x=1762353214; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=0KPabSsjOmRk9Io8yvuUJdObdsb3QElAMBpgQFsQwsY=;
        b=cA1XUmhW6ZKJBjPPzSR2EXyVegwbCN56VTQC3FvHrASsFa2cJOQB4m5syC8MCFd0bW
         IXhSfngQzwuEwti0ThVvQDK9cINeMe5G3dcpziJD6CvtF1Oz4LtCB/UBKGUoKAV3WhNx
         mIbSV+VvoT2p/4ngq12nrhPnbv7DdnKgEF1rwqonOmSVK9lZiyLfBuWHbEfnonK2LXt8
         QHK/Eqx8jOu+kJwY3AoYAu4Vr8D6KiWjdKc1TyScIx0Y3rcbW9NBMeSsQZkVvYQxw17x
         pSerKB7/x5P51TTuBFG+gtJNfN+okRz1wJL1XyNPP3YIbsdu/Hy/bisrxvPCCUnN91qF
         Y12w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761748414; x=1762353214;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0KPabSsjOmRk9Io8yvuUJdObdsb3QElAMBpgQFsQwsY=;
        b=HFrJtIIltZX/FupYIoiSversLQo+60YPt808XgbdDlZDbadLOIortmOQ93WFbBawYw
         usuzv/iNCfjrHhz0TRxBindWYghF/Yd9XWtT01EYtxSxCCj+fcrwVcN0KjUWg14gaV9g
         IyLPLvTMZ6wcfTWFRJkPt+InhUDng3uY7c1U2i5FWG0m5HflIm5yZBa004hnWABxFge+
         ZaY6x60F4JLke6GAs6hqa5x29HfeZSPC1hXScaEn3XyrUFOAGgdbGE8RSXb8yS48Wz0F
         8dvI5pD8Cp2jKz0yvUa177NRx+tPuey2OGT7NpDOyA4F0Q6jGUAPXpbYTykmNwQVusxW
         yPfg==
X-Forwarded-Encrypted: i=1; AJvYcCWiiMTrhBto4fa3EV2QB1t7I8r65vLHew3plP2rX251em6F6z2hctmQOzlFxxLnRJaEpt7Gk1ap4Ok=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwldUG5QcafLb82t2dgvXRzLEVoK//jOoq0hZsXgFdv6kB5u3mi
	Y+0sSTKdYxdwRiNqJXzwyIp16epIjQt5WB1nRlHVkFR8Xs0zFgfyUL+60d8CS5j4QQ==
X-Gm-Gg: ASbGncsDUWYqS7E7Mpll4TfD85z77+Ydqb8mhCSKRYu/x6Ut6/ENtHqape2TCj24oWD
	7Yv9iVi2SZmDINj2SdcLhPDX2c5Dzg9lLBqHxk4NY0uPRLkd692Dr5CJwrIHuwyCoCXKWOJfReH
	YYABeBVVrDJ06dIKZJ+TB2CdW3fT1EyDdfHKZTtoulgvE1gukRAPFhkuZCTQPGrb7pUuIZXGgEp
	UPBoHmGsmOEeLHqeZzuwi9hUc6NEJh3mNgf6JjVmOu63KZEnbGCzMaaICw+o34Bihy1AevTJVFP
	orAOANzw8uFSPEj4kV8O88n9MBPfNOgtiWiAXf4Y7hdvVubRdh7i7je+5mmekcOQkFOnXeicTsR
	HhS7loliwxl6WnotKNynv4eac2umCGVB2+mbSn45FHdh3PlLSvhlWK8I+VyINl+Lw6sQ7RIvPBs
	jLI2ipEU/6xvEbU5T2OGb+tNIyoE1IMvm1nxgsgyRvvpnJbh4g6hAywt5yocw0
X-Google-Smtp-Source: AGHT+IFWm6GKzAEesvUQ6gncDhZlAHNM8YDK8BHAFMp/h7xrTUlGvfeu+JweROdlHZZ+31JlSrCXzg==
X-Received: by 2002:a05:600c:34cf:b0:475:de14:db25 with SMTP id 5b1f17b1804b1-4771e3b8455mr35476985e9.28.1761748413921;
        Wed, 29 Oct 2025 07:33:33 -0700 (PDT)
Message-ID: <26841bf6-2904-4def-aed3-3451d5408903@suse.com>
Date: Wed, 29 Oct 2025 15:33:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 06/28] xen/x86: move domctl.o out of PV_SHIM_EXCLUSIVE
To: Penny Zheng <Penny.Zheng@amd.com>
Cc: ray.huang@amd.com, oleksii.kurochko@gmail.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20251013101540.3502842-1-Penny.Zheng@amd.com>
 <20251013101540.3502842-7-Penny.Zheng@amd.com>
Content-Language: en-US
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
In-Reply-To: <20251013101540.3502842-7-Penny.Zheng@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 13.10.2025 12:15, Penny Zheng wrote:
> In order to fix CI error of a randconfig picking both PV_SHIM_EXCLUSIVE=y and
> HVM=y results in hvm.c being built, but domctl.c not being built, which leaves
> a few functions, like domctl_lock_acquire/release() undefined, causing linking
> to fail.
> To fix that, we intend to move domctl.o out of the PV_SHIM_EXCLUSIVE Makefile
> /hypercall-defs section, with this adjustment, we also need to release
> redundant vnuma_destroy() stub definition from PV_SHIM_EXCLUSIVE guardian,
> to not break compilation
> Above change will leave dead code in the shim binary temporarily and will be
> fixed once domctl.o's building becomes dependent upon CONFIG_MGMT_HYPERCALLS.
> 
> Fixes: 568f806cba4c ("xen/x86: remove "depends on !PV_SHIM_EXCLUSIVE"")

Is this still applicable with what has gone in recently? (Overall I'm trying to
figure out whether actually reviewing this patch makes sense, before it's re-
based onto current staging.)

Jan

