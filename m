Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 70A2B808155
	for <lists+xen-devel@lfdr.de>; Thu,  7 Dec 2023 08:07:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.649565.1014210 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rB8T3-00076L-AR; Thu, 07 Dec 2023 07:06:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 649565.1014210; Thu, 07 Dec 2023 07:06:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rB8T3-00073d-76; Thu, 07 Dec 2023 07:06:41 +0000
Received: by outflank-mailman (input) for mailman id 649565;
 Thu, 07 Dec 2023 07:06:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+CYm=HS=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rB8T1-00073X-73
 for xen-devel@lists.xenproject.org; Thu, 07 Dec 2023 07:06:39 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2951ba7b-94cf-11ee-9b0f-b553b5be7939;
 Thu, 07 Dec 2023 08:06:36 +0100 (CET)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-40c29f7b068so3351725e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 06 Dec 2023 23:06:36 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 s13-20020adfdb0d000000b0033339027c89sm624440wri.108.2023.12.06.23.06.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Dec 2023 23:06:36 -0800 (PST)
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
X-Inumbo-ID: 2951ba7b-94cf-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1701932796; x=1702537596; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:content-language:cc:to:subject
         :from:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=EmVQ4jmwAS5OoFvZ8fWEOnaIcLmDr6cS7p4WfAjGnaA=;
        b=IladTKqTySIf0htuR+Ua/TfcyigVi6c9kTk+4MXIoB0cVMuKQGhn6iBFS7uI0gVIPn
         f7UQx6Zuz3kSaNb+U0KyLL2xX4dmb4zqfGfbQXqBi0TQb+W8k3q23WdGKPiqqkc+VWac
         jXmIF4WLgbhWFEkwrMQ3uESdrcWtRC3TRePJZ9lTyu8N0oeRXzWEbgyMDrxw2jbUUJC+
         cu23rFdAjJgei2cNJeu3aiZY86HA8s5Y9z1x9Zq51Yr/GDKLA5ebgQdlqWdO4zBn/Si3
         XvelV4uyccCQQGkBh7TpgbJ15Ms4V9F4gP4VxBmdXG62WI703XbwUTi9FOYpd6UaSnJa
         6f9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701932796; x=1702537596;
        h=content-transfer-encoding:autocrypt:content-language:cc:to:subject
         :from:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EmVQ4jmwAS5OoFvZ8fWEOnaIcLmDr6cS7p4WfAjGnaA=;
        b=dBJVmB9RR2u0nD+PJDqPrhG4NlSRhDNlatrA4O34P+AYVUOJa2onKLls8mqenOan2F
         2hRUnv0yi8SwYmRMs1+eCDCBfsGtWdqFWS9ck5JHQbDA98aGlpQiFVozzqHy1qzkxU2j
         jtwpz5PiaH/v3GN5TeDLrzTGV4Lmbtvv3sLUOxGZ+/29TE9jRilGI++dyq808WfmffQM
         Ve7fg8kUrI++DlhxVkBMVqowshS2QBr58j00y0KO4vRVprTaMalSNvoQ8i/kAxEyiaOe
         b6G33W9xhiC1SBtyyebW+GGqmSl2leydAOuEApcLqmevVLlha2aCsiDUX3I2rgs0xZBZ
         lBJQ==
X-Gm-Message-State: AOJu0YwcNEkJUeHu9IWIyljzw5a+uBxSUnfZ01KqR+qHgi3x5QMqV0iC
	bKECwBjD6HAqcZvD0AGHLT0vplvUz0Ga7TbCIp8a
X-Google-Smtp-Source: AGHT+IH6oZqL5TTb5+D5BiBXa6xFeezSyel1xFPkDawBVxIhrCbi7KnaR7yLY2zveoLG3MRf2opHKA==
X-Received: by 2002:a05:600c:1d26:b0:406:c6de:2bea with SMTP id l38-20020a05600c1d2600b00406c6de2beamr1280923wms.17.1701932796274;
        Wed, 06 Dec 2023 23:06:36 -0800 (PST)
Message-ID: <4a7ecdb1-770e-4886-a397-336a510b7e3c@suse.com>
Date: Thu, 7 Dec 2023 08:06:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Jan Beulich <jbeulich@suse.com>
Subject: preparations for 4.17.3
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Anthony Perard <anthony.perard@citrix.com>, Julien Grall <julien@xen.org>
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

All,

the release is about due. Please point out backports you find missing
from the respective staging branch, but which you consider relevant.

Jan

