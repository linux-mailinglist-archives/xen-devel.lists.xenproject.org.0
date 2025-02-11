Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 509CCA3124A
	for <lists+xen-devel@lfdr.de>; Tue, 11 Feb 2025 18:00:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.885795.1295596 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1thtcn-00058k-Vc; Tue, 11 Feb 2025 17:00:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 885795.1295596; Tue, 11 Feb 2025 17:00:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1thtcn-000569-SA; Tue, 11 Feb 2025 17:00:41 +0000
Received: by outflank-mailman (input) for mailman id 885795;
 Tue, 11 Feb 2025 17:00:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hVvi=VC=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1thtcm-0003WI-GT
 for xen-devel@lists.xenproject.org; Tue, 11 Feb 2025 17:00:40 +0000
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [2a00:1450:4864:20::52f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b8c1c94c-e899-11ef-a075-877d107080fb;
 Tue, 11 Feb 2025 18:00:40 +0100 (CET)
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-5de56ff9851so7278942a12.2
 for <xen-devel@lists.xenproject.org>; Tue, 11 Feb 2025 09:00:40 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5dcf1b7b089sm9908463a12.29.2025.02.11.09.00.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Feb 2025 09:00:38 -0800 (PST)
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
X-Inumbo-ID: b8c1c94c-e899-11ef-a075-877d107080fb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1739293239; x=1739898039; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=9t92GOMEBUVRyFzPtbwXnq6lhwLQQ0wTj+8ntf07+Nk=;
        b=YhUBUSHO1U0X9WztRalIGKNd3OcmpfPERobZwaedLeXuJmfZ+CKKawWJ4GpGYn1BDC
         Yr5HNnuN5weVK+vg6HrWHcCTniOaYACK2dt3w4nNC7p/ngkbtOD2TUssHvT62IAAaBEx
         kN9HthiL4DVV8nL4Yh3vaG0CP4ckZZz2gPe2Vlet0MS3Y6L4f2KmoyHTFiGnPpygKS68
         jx3eBPKTdcYjMDSM0Ss27oz0plCC3Cv18jNQU3DIIln7zdGYj0J2M5fs/+enBryukgmE
         3kATpPYKCvbBRIhWGZl4GGP4PD49BPbJT+V79QCbVxdS8O/KMfYR9IRrelyMAsdjdI91
         YmtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739293239; x=1739898039;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9t92GOMEBUVRyFzPtbwXnq6lhwLQQ0wTj+8ntf07+Nk=;
        b=DN+Dq7NxS4gKEWwHis+gBNq2sJ8cbP+sdbZo+Lrlkg+iPIo2negJgJrczaJMuWKTaj
         F5E9HuQZlc01/A8dOz07ylGCSgHUsn1c+VhOdlj9SBFD95BRgNBzsrbaeQlMeHYEoGkP
         27G8Lljiyg7GAfPJyiLemC2dGMOSgzppF7rtsRDd9wYtNKXlsNYfwpCYlf8cGtCWrKHe
         Q8LfrSDoPxIuJowUMhKhiEO6q6/jsGrH/29URMxmKGU9J6Z8TTBn70F7PmS5/dLb0Aqy
         i+wqM2M4Sg+vyHuTyiAONmyylyYbQPsSAGGtzJdVfkfx6Il+dkH+8VLkzqo+f7g+4py5
         FJmQ==
X-Forwarded-Encrypted: i=1; AJvYcCUhQM92KTFq6NhvT26R/8c15gtFEh//iDwrxzdeOOpFrCZvIkXyqkVFTg08YER3MvHDTPpDyT5ZB/Q=@lists.xenproject.org
X-Gm-Message-State: AOJu0YySd+N6UvwRIFLX+iDlKbyRMTnIBSyaPKoM6xrQmYnDw4jvz/+g
	61xwBf5EDI4+fZAbf4AQrxQ0VuebL56sBa/WWFLn6zz4SzwOFXpTkzPrz/Vy7Q==
X-Gm-Gg: ASbGnct2ru1sBpu30g6Xwpnjof92MkA85ZgkZFr3877NjUrkkBVrMR9bpgzBUoG0xks
	ou8r5WmgDENCCTEWbSY3iyjtN68zA3Kd+5+W/975IZM1jGuoAgFSf4fQttiXQnjvq2jOqXmXeI6
	8t9qD9omYYCvegi0qIt0FWkuX3K9cuas5Qn1IoX3nEI0bWr8sE1Dk1UMVU/q6xRjEx/VPv7YRoL
	hPaqD6bFOhRV8ClI+MqKV61VZmJ9BLK4OQLbmKP+4ao0f8PJUFnVpmtNeNo55H0J4x6EA8R9trM
	F3O7vH396Wecsu3q0EbdDiftz/n+LfF/H8oN/RCNJ3Q+sgVCwZrovSAIYBJm9tCK2GZ7wBUJmsC
	R
X-Google-Smtp-Source: AGHT+IHwg/KFqRs0xLgUo7xxqwaDn8IcdpIb0YEW4L2I2iNAg2n0VqZ64d3BDdo2JOLrPRZ3tWeHRg==
X-Received: by 2002:a05:6402:27d4:b0:5dc:1173:bfa3 with SMTP id 4fb4d7f45d1cf-5de9a4c86f0mr4714946a12.29.1739293239444;
        Tue, 11 Feb 2025 09:00:39 -0800 (PST)
Message-ID: <5d964e15-e146-4d03-9129-bb0cb43ac4ab@suse.com>
Date: Tue, 11 Feb 2025 18:00:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.20 v4 4/5] x86/pci: disable MSI(-X) on all devices
 at shutdown
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: oleksii.kurochko@gmail.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20250211110209.86974-5-roger.pau@citrix.com>
 <20250211144813.89137-1-roger.pau@citrix.com>
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
In-Reply-To: <20250211144813.89137-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 11.02.2025 15:48, Roger Pau Monne wrote:
> Attempt to disable MSI(-X) capabilities on all PCI devices know by Xen at
> shutdown.  Doing such disabling should facilitate kexec chained kernel from
> booting more reliably, as device MSI(-X) interrupt generation should be
> quiesced.
> 
> Only attempt to disable MSI(-X) on all devices in the crash context if the
> PCI lock is not taken, otherwise the PCI device list could be in an
> inconsistent state.  This requires introducing a new pcidevs_trylock()
> helper to check whether the lock is currently taken.
> 
> Disabling MSI(-X) should prevent "Receive accept error" being raised as a
> result of non-disabled interrupts targeting offline CPUs.
> 
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>



