Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CAEBD9A2668
	for <lists+xen-devel@lfdr.de>; Thu, 17 Oct 2024 17:18:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.820714.1234289 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t1SGU-0001qK-Ub; Thu, 17 Oct 2024 15:18:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 820714.1234289; Thu, 17 Oct 2024 15:18:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t1SGU-0001oN-Rz; Thu, 17 Oct 2024 15:18:14 +0000
Received: by outflank-mailman (input) for mailman id 820714;
 Thu, 17 Oct 2024 15:18:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Rwie=RN=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1t1SGT-0001oE-KE
 for xen-devel@lists.xenproject.org; Thu, 17 Oct 2024 15:18:13 +0000
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [2a00:1450:4864:20::436])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 05b923c2-8c9b-11ef-99a3-01e77a169b0f;
 Thu, 17 Oct 2024 17:18:11 +0200 (CEST)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-37d473c4bb6so901277f8f.3
 for <xen-devel@lists.xenproject.org>; Thu, 17 Oct 2024 08:18:11 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-37d7fc123dasm7468474f8f.94.2024.10.17.08.18.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Oct 2024 08:18:10 -0700 (PDT)
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
X-Inumbo-ID: 05b923c2-8c9b-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1729178291; x=1729783091; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=vysFJVZZxp17KWTtrvzVuNPjUdPB2c7Ix1VyLuHSzq4=;
        b=ANEMO2B1pF0jXbrMghGQnJ+lC9utNU8eiUs3+nu6gLDTnFdKvQem1YyrStrhmesffJ
         +H+ymENdMOXahUJPSFzCMGKK6KRZ+Sdq8FjquS+XIYtP9H4hk6VRkSBrJ490um2vKBPr
         +vF5SschOhZ4uZMfU0C7RnULD2Bv/ox5q+JdgekppTi0TZ6NtMEshVdj81QDD9R6YLNa
         o5p+viRFO5TVDXDuseUjOD8wkOS7SgL6bUrRUadchf+m5hDetG5sMr/qT6kYArEeI1Vr
         udsn0V6FcL6kRHx9BnyYgV6sGu1qU6vyuey/HW3wSCqoUvrjCEH5kJvI5pcVEF3vUxyj
         gHew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729178291; x=1729783091;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vysFJVZZxp17KWTtrvzVuNPjUdPB2c7Ix1VyLuHSzq4=;
        b=cfiuqO+0quFwwkzCMXMj+LvDuDV52IizeTuITGeWAZP+aq1cw8N8Vt9oUaqCqPvFxQ
         00YgLLeSQ5klC81098M8/5r+VrfWg8YZtAQN4R6Y/SZC2K79KATuV+Qoz+4itphBjLoz
         jD8PRivfvU+5XfK83BpNVmnGvNFxDzSWdhLyf3aF+bb1yrxcSRku/47x4Z0nixz6O56V
         VQr2xXkpJaPbySTSereXr85qWBM9GD6SFg+Mr4Vhl6Or6PW3xsOFKF19IKVrFbg501bk
         cUqCpum+cglMLcEI23zCtp6YrEAzehy4E570X5oIR7YoU8O6mIn9796pcYHVHkFYxQ8q
         KNqA==
X-Forwarded-Encrypted: i=1; AJvYcCVwZMydotF4sCN8gcwMeq5qQYrUSNnaHVuN6TbZKhDhIHgXe5bYC7jOv7vK3IECMloa5zu84I3K8zc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyZXuZYaozQ0agWh/wrGGWFuA3ihVCQGJEGjRvbaWt3y4MMGqs/
	Vbdq7Q9KUn3rBCIhPdok88QvId1wXQeE8aFxQ/QEypbGUP868tm2LsVUNlXkVQ==
X-Google-Smtp-Source: AGHT+IFG08zZZ8WX4rffRGh2c+dA9Q7kjaAfVwyyYV+dXzs78/MZD8070xoIr/Oxi46ipdE9uqE1SQ==
X-Received: by 2002:a05:6000:11ce:b0:37d:3e6d:6a00 with SMTP id ffacd0b85a97d-37d600d329cmr17707144f8f.47.1729178291063;
        Thu, 17 Oct 2024 08:18:11 -0700 (PDT)
Message-ID: <a09aaf26-2e52-4e0b-9a09-da90d24cc01e@suse.com>
Date: Thu, 17 Oct 2024 17:18:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 4/5] xen/riscv: initialize the VMAP_DEFAULT virtual
 range
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
References: <cover.1729068334.git.oleksii.kurochko@gmail.com>
 <c1aac25b3e772ca243ee74a131e2c861ef2a20ca.1729068334.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <c1aac25b3e772ca243ee74a131e2c861ef2a20ca.1729068334.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 16.10.2024 11:15, Oleksii Kurochko wrote:
> Call vm_init() to initialize the VMAP_DEFAULT virtual range.
> 
> To support this, introduce the populate_pt_range() and
> arch_vmap_virt_end() functions, which are used by
> vm_init()->vm_init_type().
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Acked-by: Jan Beulich <jbeulich@suse.com>



