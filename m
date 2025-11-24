Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 23B00C7F673
	for <lists+xen-devel@lfdr.de>; Mon, 24 Nov 2025 09:38:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1170130.1495212 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vNS4R-0008NR-FJ; Mon, 24 Nov 2025 08:37:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1170130.1495212; Mon, 24 Nov 2025 08:37:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vNS4R-0008KV-C5; Mon, 24 Nov 2025 08:37:15 +0000
Received: by outflank-mailman (input) for mailman id 1170130;
 Mon, 24 Nov 2025 08:37:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=CeM5=6A=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vNS4P-0008KP-Sz
 for xen-devel@lists.xenproject.org; Mon, 24 Nov 2025 08:37:13 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c4876ee4-c910-11f0-9d18-b5c5bf9af7f9;
 Mon, 24 Nov 2025 09:37:10 +0100 (CET)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-4779cb0a33fso38628385e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 24 Nov 2025 00:37:10 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42cb7f49a7bsm26614826f8f.19.2025.11.24.00.37.08
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Nov 2025 00:37:09 -0800 (PST)
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
X-Inumbo-ID: c4876ee4-c910-11f0-9d18-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1763973429; x=1764578229; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:to:autocrypt:from
         :content-language:references:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=yPaPlRztGjiIqx0UO0gKDSinunt8qm514nsD/zgL7hY=;
        b=BolbDPnhHzH/zJm/GHIurvKKguYjjqWXzV1QZyZ7kBAfqc+QEKsd9onvIBv5AbXNkF
         t2uhUSFIh7wzXqotfbo65CvPBrVOupad4TbasPeXWNbnucF2GsTtbGgUOHep2+PgcMUt
         1kf/yz/rMwYUp+yalWabXdkYivTlWiErW1fGSVYqDdvSYZMpFXe3PRJTWcIG+tNCbJSf
         l2IYXyZ7gbkr2AcStbEpyeEaiOGemEp1hqnULRS2ydYC1CPAC3geNOlUmtifw6zKSAIL
         fHG98Pks+t2PSh8lRJSBRTKZtFKsbpmEZfFRuf+YZM929DQNKpf3dVtOiG5+VNdlZpqZ
         16/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763973430; x=1764578230;
        h=content-transfer-encoding:in-reply-to:to:autocrypt:from
         :content-language:references:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yPaPlRztGjiIqx0UO0gKDSinunt8qm514nsD/zgL7hY=;
        b=c5/AT/sBbyKeMGTw1BQL8cioCDHIpuNjLnaN+1HNpcqV+2RWRypHgyN/TG6hPn2769
         ukAxZTQRK7e7LP/QhFlF8m8zCLMXD02W08m9JRNMiqIoDZcYvl4iPcLb28FseWIoaxyK
         aWg2PsOFEkcu6AO8XtKhg7m09O1VinV7vXDoFp3MusCrE9QEN9/JSJ4bKR5QZa0CjoVO
         tyUoYf6CdZPfua796SNNpqWYuhC7vQAEA4rrE66RmyPvjC3Bd5i7T8m2bNQrIfH9RAIn
         kQEEsztzeI/Yspp0SrvCtTqx7HXU2D1dkFFUObxU+t5Hd4ydZLfTzXNQdV/pBmhZFT41
         IGVw==
X-Gm-Message-State: AOJu0YwTEr+KhjGDAcoVKyhaTptzHdtkvn+WbTGu/lHAVm2X0emmK5fE
	2PeUweSFIqEyJ/OKuDLKYArn+LIanyp28ZATgb7hFSs022OkrBr6FAhsknglBOXdOp7AA9QTJH9
	Vnm0=
X-Gm-Gg: ASbGnctypGBF+RrH1Xdh4ZM2SXfCsGZ3DN6IOtIYou+KrZRJdH7YdxbkT/loNmVb2dt
	8SIko3I0HMWqpIPRusBDeyljqiAuUFXFiWke40pZqqCJbDwnCo6qB1MK6FVYHGBlXlBOIs4tyY2
	vk57CVp+ESgr07DywEyQyPVWGXrSaAJHyhPw0RttxU3dAA/fYpLDd2iuUY5zszO0OMDk1E3p5E2
	CZGVIoR2tZN9nT1HVH6FYyEU6p0wFstpDBuHPbLu5++H0MAQcAjP3NNOlym4gVPSBHkx+WvgjGZ
	PhydMH9YQqTHaMZM/8jYjesYTqXbJAvsjRhFlWYorJqEPB1e8PYt6N1gI3G8S8toJG1yqQ8Vwf6
	idlBTRpI8FJVQXXx+36LttgMP6F7Msn0UIEjnE9OJC57ucTIetGk5+fHuvevtygXA8ZvTogIOP4
	cgEcnmHLJjx88Oy+eVgtFj0jslemhdXjIjC73zXOdsbrbKMAZ7GPof61DgIBz66WLlTdeMt3CzD
	A0=
X-Google-Smtp-Source: AGHT+IE3NdWJAztK7S4pe+F5znknsUmfC5Q+euuxXv2N24mM//wq1PrKh51zYZXDlEapc7X6/aYQ3Q==
X-Received: by 2002:a05:600c:4f4d:b0:477:9ce2:a0d8 with SMTP id 5b1f17b1804b1-477c00ef4f9mr125854395e9.0.1763973429550;
        Mon, 24 Nov 2025 00:37:09 -0800 (PST)
Message-ID: <a4c06854-6548-43b3-b17f-fd89c71281a9@suse.com>
Date: Mon, 24 Nov 2025 09:37:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: New Defects reported by Coverity Scan for XenProject
References: <6922db67d5bee_ec6942e9307a67994398e5@prd-scan-dashboard-0.mail>
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
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
In-Reply-To: <6922db67d5bee_ec6942e9307a67994398e5@prd-scan-dashboard-0.mail>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 23.11.2025 11:01, scan-admin@coverity.com wrote:
> Please find the latest report on new defect(s) introduced to XenProject found with Coverity Scan.
> 
> 1 new defect(s) introduced to XenProject found with Coverity Scan.
> 3 defect(s), reported by Coverity Scan earlier, were marked fixed in the recent build analyzed by Coverity Scan.
> 
> New defect(s) Reported-by: Coverity Scan
> Showing 1 of 1 defect(s)
> 
> 
> ** CID 1675028:       Data race undermines locking  (LOCK_EVASION)
> /xen/arch/x86/hvm/vmx/vmx.c: 1502           in shadow_handle_cd()
> 
> 
> _____________________________________________________________________________________________
> *** CID 1675028:         Data race undermines locking  (LOCK_EVASION)
> /xen/arch/x86/hvm/vmx/vmx.c: 1502             in shadow_handle_cd()
> 1496         }
> 1497         else if ( !(value & X86_CR0_CD) &&
> 1498                   (v->arch.hvm.vmx.cache_mode == CACHE_MODE_NO_FILL) )
> 1499         {
> 1500             /* Exit from no fill cache mode. */
> 1501             spin_lock(&d->arch.hvm.vmx.uc_lock);
>>>>     CID 1675028:         Data race undermines locking  (LOCK_EVASION)
>>>>     The thread 1 sets "cache_mode" to a new value. Now the two threads have an inconsistent view of "cache_mode" and updates to fields correlated with "cache_mode" may be lost.
> 1502             v->arch.hvm.vmx.cache_mode = CACHE_MODE_NORMAL;
> 1503     
> 1504             if ( domain_exit_uc_mode(v) )
> 1505                 set_uc_mode(d, false);
> 1506     
> 1507             spin_unlock(&d->arch.hvm.vmx.uc_lock);

This clearly isn't a new one, but merely flagged as such because the code moved.
There look to be at least two aspects. For one, the tool may be irritated by
shadow and HAP modes being handled differently: In the former updates (and
corresponding checks) happen under lock, while in the latter case they don't.
This looks to leverage that no domain-wide checking is necessary, and hence
updates only ever occurring on the running vCPU means updating is race-free
despite being lock-less. (Sadly parameter / variable naming doesn't properly
reflect this "on current" aspect, despite it being pretty important here.)

Further there are vmx_{get,set}_guest_pat(), which inspect the field without
holding the lock. These functions are intended to act on either current or on
paused vCPU-s / domains only, though. Hence no race either due to all updating
being done on current.

Am I overlooking anything, or does this simply need silencing (again) in the
tool?

Jan

