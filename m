Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 06B38AFCC6D
	for <lists+xen-devel@lfdr.de>; Tue,  8 Jul 2025 15:47:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1036571.1408831 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZ8fg-0002E4-8M; Tue, 08 Jul 2025 13:47:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1036571.1408831; Tue, 08 Jul 2025 13:47:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZ8fg-0002Ca-3e; Tue, 08 Jul 2025 13:47:44 +0000
Received: by outflank-mailman (input) for mailman id 1036571;
 Tue, 08 Jul 2025 13:47:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=mjd+=ZV=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uZ8fe-0002CU-4A
 for xen-devel@lists.xenproject.org; Tue, 08 Jul 2025 13:47:42 +0000
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [2a00:1450:4864:20::42c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1e032bfe-5c02-11f0-a317-13f23c93f187;
 Tue, 08 Jul 2025 15:47:41 +0200 (CEST)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-3b49ffbb31bso1658102f8f.3
 for <xen-devel@lists.xenproject.org>; Tue, 08 Jul 2025 06:47:41 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-74ce429c46asm12097950b3a.129.2025.07.08.06.47.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Jul 2025 06:47:40 -0700 (PDT)
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
X-Inumbo-ID: 1e032bfe-5c02-11f0-a317-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1751982461; x=1752587261; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Uqs0iVZPSSOmhwvnjfiS13HwZA8uVO0w5j+YA6+fOmU=;
        b=bfYSl2ee/SZn7fKxTIVi0508gJ26u/kJGSzAdpTqLhi1qmQgeN8ZK/l3jLktP6qFzC
         JCXubp/5Za34lzdnRAeGfjlzUvfN+4/4HdRh+G5yEu9HgAklKcYSpsWQ2FzD2hGmcOs6
         XaGutydTf8b42yn4Y2z6Jx4wmB/tsUw1ogNHawlTJsbsPSnufgPeZT8DiOxYY47l5GFI
         GLX8q8QNzWD/ljRbAp2QtKjD/TXMO/wSFefLz25Pfdb4kDfHxFkWBncscc3HFy+CVIc8
         6vQqVxh2bpDlB22rmUc+5eVJkhu3pA7NG4XfQS/CWW6pLI9NBdG0N2ezPNRD1wcYMgFC
         zqzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751982461; x=1752587261;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Uqs0iVZPSSOmhwvnjfiS13HwZA8uVO0w5j+YA6+fOmU=;
        b=qcC396BkHsZrI+R8ANJRYoh3+1DoTxOsdHEd+KsIhym0QNi6fy4ELPU3BFW4mpoME/
         zUoOkKA9sKNOMlEkNyI6i/bh3u+UPJRxAzRODV6G8tXhKhI65q37BkswM3MLAxpqeinQ
         Th/FTwvtPtrOZiRD9xECBhp81zRUOqW5Fct/DyObktxSuYAsaeNJkJOOQ32qSutUAwqZ
         EOB/S3veQpgz/thYAtuEI9dDrE0cmlqbfYXG650Mfwnef/wGV78x8HJpa06HYqgM70OP
         vtXYRbd9HHOi9GSDu3onTAYfaOV/kcbIsIPacv+luWos7bbVLbq517vvlWmEWEGmXG+r
         YsBw==
X-Forwarded-Encrypted: i=1; AJvYcCXakHa19D6C/xukxTn/vugSlg+ytxWlNefjJTehXF4OcoOqe5hTsuK3cGhxPyObLJI03IR/ohySHiI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzkE/9G317g6cKRNT99GD7ruD3sXyONbmyk+uop33aueynH2PGW
	XjtDuC3rOOmZhJiPMBl4PI4knEwpl57PSdLnKRBUme6erpej20MLtGVFXrrvGQomOA==
X-Gm-Gg: ASbGncs20qZt6tPra+u0CVLCulRJMx9eLgKnoCSzvfrJRDAY6wlhT8CReQiaI3lSG/y
	1122BKBi1Bjt9iQUDiIUruoXdgeLZt/FpMnBzAa5TFfggl3xYAvLS+g+kPz0ylTE3E1WTinNtDm
	R4RjA3WFKkgEIppfcXnHCnYOs/dAV1ALxRGUfdril+l28LiutNzf0OjATGzBh7OoI8AdIaNySPR
	wFd3YPVizEfrPCjRwVdLnm6h7iw+yMai8DqSl8rGh7mYOLGTqcd/qjdZjjnMM5LMrpbe2cmhcWD
	C8pLBF/1w4+q0EkGfWV0t05FOyEA6IZ+8umYTZx677c4uMYm1H8Eea6DcHymXNjCVKoHKnQ7LmU
	zrFRtP7rGNipGZgP+Od42t2vjkQSHLRZsngSmUziOxiAS6J0=
X-Google-Smtp-Source: AGHT+IGUbjJac83P3vj3YmU0XTt/rHxRJxQuf9TAtWGBJb8lTTs0e8S6c75EH9ePHmuxl9ZWjdsJ1Q==
X-Received: by 2002:a05:6000:5c1:b0:3a4:e844:745d with SMTP id ffacd0b85a97d-3b5ddf054e3mr2903529f8f.56.1751982460602;
        Tue, 08 Jul 2025 06:47:40 -0700 (PDT)
Message-ID: <6aa4431c-de06-4927-9b29-4347fa801fdd@suse.com>
Date: Tue, 8 Jul 2025 15:47:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/11] xen/sysctl: wrap around sysctl hypercall
To: Penny Zheng <Penny.Zheng@amd.com>
Cc: ray.huang@amd.com, Stefano Stabellini <sstabellini@kernel.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <stefano.stabellini@amd.com>,
 Sergiy Kibrik <Sergiy_Kibrik@epam.com>, xen-devel@lists.xenproject.org
References: <20250707031346.901567-1-Penny.Zheng@amd.com>
 <20250707031346.901567-12-Penny.Zheng@amd.com>
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
In-Reply-To: <20250707031346.901567-12-Penny.Zheng@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 07.07.2025 05:13, Penny Zheng wrote:
> --- a/xen/arch/x86/configs/pvshim_defconfig
> +++ b/xen/arch/x86/configs/pvshim_defconfig
> @@ -28,3 +28,4 @@ CONFIG_EXPERT=y
>  # CONFIG_GDBSX is not set
>  # CONFIG_PM_OP is not set
>  # CONFIG_PM_STATS is not set
> +# CONFIG_SYSCTL is not set

Beyond what I said in reply to patch 4, LIVEPATCH for example also shouldn't
be needed here anymore, for similarly depending on SYSCTL. You will want to
go through the entire file to check what can now be pruned off.

Jan

