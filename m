Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E76CA5C23A
	for <lists+xen-devel@lfdr.de>; Tue, 11 Mar 2025 14:17:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.908113.1315268 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1trzU1-0000Oo-8c; Tue, 11 Mar 2025 13:17:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 908113.1315268; Tue, 11 Mar 2025 13:17:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1trzU1-0000Mg-53; Tue, 11 Mar 2025 13:17:21 +0000
Received: by outflank-mailman (input) for mailman id 908113;
 Tue, 11 Mar 2025 13:17:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EmiY=V6=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1trzTz-0000Ma-Ra
 for xen-devel@lists.xenproject.org; Tue, 11 Mar 2025 13:17:19 +0000
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [2a00:1450:4864:20::433])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 289900b1-fe7b-11ef-9ab9-95dc52dad729;
 Tue, 11 Mar 2025 14:17:18 +0100 (CET)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-391211ea598so3034582f8f.1
 for <xen-devel@lists.xenproject.org>; Tue, 11 Mar 2025 06:17:18 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3912bfba8a9sm18096708f8f.9.2025.03.11.06.17.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Mar 2025 06:17:18 -0700 (PDT)
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
X-Inumbo-ID: 289900b1-fe7b-11ef-9ab9-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1741699038; x=1742303838; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:cc
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=O21ZBP1LORUHWVo7z4txTTHR9OUfXFI/2w9ZR5Kdntc=;
        b=WK5zP+oNeJlMwxk9SPWHeVrao1qO+s968mWDn0FEFORE5X8F9K7QGi5EKrhxc3o+bg
         q41yhgc82nfH2qXQlpo45Os55F07X1nmStqrllIDiowqaKN07q5aUdMKndKWxXvyKfAQ
         vFIqudv76id1JNpi7DGVYbosWeV0RRPP6aj71iXTs1VtOpX8WtGWAsOcp8lyrFIxe3O7
         vstQABUEqBPTEuVE4wDk2zkpGEMurbBJ3qUoBuBlNVGnpDe1rPwBBUBV9/tgr2Ox00GL
         BXRZPvyB29KIq/QTta3QdCsXt+5J/ASB4WXSp/+hJOWwtVnL2d96az+O5CAubu5xaDUM
         MarQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741699038; x=1742303838;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:cc
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O21ZBP1LORUHWVo7z4txTTHR9OUfXFI/2w9ZR5Kdntc=;
        b=c1Gj45bqi3oF2m+30y2efuSEuzuItMMU5epraX/dyz0nuhuCO3oThqFUc6MFoPufND
         banshvGJZXmD35CdWQxmF+ghdtk0daa88dy6serEp2Z7HHkswfIQ+4jL7atVI3hCwVHq
         jPH9AA/k2vKF3BTwTFrUHp7Ejz3jO6bhsoM50DqTRBbIyFjrtoT7P8LuT2PoVHTmuRaQ
         lSHV60MbPuwafFRn47l0Cy8FeoD+VfzC9VdnfZgSxsgfXaCX0CXyYJNbUWedIwjKkrcU
         qm/Ud1iCtNKzYlPXetzSfY4aaxQwWabQirW3gtQ9iV/KrEcrSsUaxhVOZ6Vw0tXFlt94
         udHw==
X-Gm-Message-State: AOJu0YzCoRhB5Zrqks3pwviZUABz07meERGsaeBnWk+nNjguNANYF5hD
	U9IuFCjJp/IbT0HVO82B4UIeaBQ+8oSvGEOauV79S/+OeYDw/J7m2g8yHSsNFA==
X-Gm-Gg: ASbGncsup3P8DYMoLnmLBbC3aDtQ4ujef+Yx8NKCk80ClJxeCBaDJrt8XtholqRDQNx
	JYbv9qTRrAZFiLclnlJ8dCok7XppCuqX/uk4XGURv/Ta4PyYcJOHcryIEYaUQdq+CunBmCxZ9XL
	OIixqq/Q0hzflOq2iAsXDdqj1CadNXEY3S4xftRhT0uj5zbZRg9h9oLH+++CE67CQeXiM/ZzQUL
	fWPJz7CXnexn2Gvrtxcp/3qgeTHhbWmdMzkQYB430MJh08ZfpjiL6sceTpoLY/M5MrltR9rieK9
	C9cIlVhp0lLejjbyXDPkKJI6VLTXnBYm1ix1zimTaCd3WSIwPOS8lkhx2SjBdAm+geLFdFsPO57
	t8KxyNZTiZrFKverDvq9TOt/Arn+UAw==
X-Google-Smtp-Source: AGHT+IFhiMI5KdoXCzVoYQ8B4lgVwTEc+bUtmXpgR7uq6gFqabB8V/F+i+Qzy58RPYAqiqX1AzdoMQ==
X-Received: by 2002:a05:6000:1fa1:b0:390:fb37:1ca with SMTP id ffacd0b85a97d-39132dbb25amr13046137f8f.53.1741699038331;
        Tue, 11 Mar 2025 06:17:18 -0700 (PDT)
Message-ID: <42f7e36b-c3ee-45b8-9821-44a9da77eb6d@suse.com>
Date: Tue, 11 Mar 2025 14:17:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/3] x86/hvm: check return code of hvm_pi_update_irte
 when binding
To: Roger Pau Monne <roger.pau@citrix.com>
References: <20250311120652.61366-1-roger.pau@citrix.com>
 <20250311120652.61366-3-roger.pau@citrix.com>
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
In-Reply-To: <20250311120652.61366-3-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 11.03.2025 13:06, Roger Pau Monne wrote:
> Consume the return code from hvm_pi_update_irte(), and propagate the error
> back to the caller if hvm_pi_update_irte() fails.
> 
> Fixes: 35a1caf8b6b5 ('pass-through: update IRTE according to guest interrupt config changes')
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>



