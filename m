Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CCA65B1638C
	for <lists+xen-devel@lfdr.de>; Wed, 30 Jul 2025 17:21:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1064137.1429882 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uh8ce-0000X3-HC; Wed, 30 Jul 2025 15:21:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1064137.1429882; Wed, 30 Jul 2025 15:21:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uh8ce-0000VG-EP; Wed, 30 Jul 2025 15:21:40 +0000
Received: by outflank-mailman (input) for mailman id 1064137;
 Wed, 30 Jul 2025 15:21:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zSpT=2L=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uh8cd-0000V5-5O
 for xen-devel@lists.xenproject.org; Wed, 30 Jul 2025 15:21:39 +0000
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [2a00:1450:4864:20::429])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e239e887-6d58-11f0-b895-0df219b8e170;
 Wed, 30 Jul 2025 17:21:37 +0200 (CEST)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-3b786421e36so629970f8f.3
 for <xen-devel@lists.xenproject.org>; Wed, 30 Jul 2025 08:21:37 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23ff6e201a3sm88068175ad.150.2025.07.30.08.21.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Jul 2025 08:21:35 -0700 (PDT)
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
X-Inumbo-ID: e239e887-6d58-11f0-b895-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1753888896; x=1754493696; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=aLBQbf5t945AzlQGT/MiqV45m4rARfsjyT5Aw7l6usY=;
        b=WYT7Dq2nTKEeThwXIVOHwNQEFGuy55A+zpWW/snUVDQ/S5PGurMDwgxFy5SWry+m2D
         2dB32rCLxH4DR+sj/Lor4amJzin4Zi7Jsq8tnl1tQCYYaDx1zI/sWCS0Py2w+T9/OVMV
         XUSB2ZsitL4U/u3B+04jjQ8GloWmlZCMWPipgBlJ4J1WW21gZfzzC54Iko1JZLmhZ3/i
         VpXlzGhanY6S5HUqBylbmyNYzbgSx0HF+TopkUGGh5s01UZCXRXCzZjfQRhneGeN4DCA
         rDD/QTLLdBynaPRzpzfATMztoI32TFblpvoBNtOB2unWYbEOkNkjh0nByUd3UICnCcs8
         rk7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753888896; x=1754493696;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aLBQbf5t945AzlQGT/MiqV45m4rARfsjyT5Aw7l6usY=;
        b=YuTG0sbBJ4b2XSSfm3NDw9xJVcmiQTtNa7CTRA4XWx4+sRXGEbV7h2Xuwwp+7FObLa
         usDZ2RPyg9RGom0TbkdvqoLvaZCoz73PPvuyyjylVNnvhJRRM/1O9lWk9Sxc+SyMTY5m
         Pp+mYQrYMlsce5MAbmeOXJK6KVsDH2lR/aYhmkd1KmCNvsu+HqAu+1C77lwmsQ+hgGUo
         RMjwhEN7AY4lo+WQmtGA2uDGcTlj6YOJ0pPHS1otrEkWeRS7ArA5LhUgzKFc0uAFv+cK
         JeOtKpPdZbXI3tC5gFr2QHA/+XeTXPS+gnO3cjZtV0BsAeLgnPOOWdZHbBtSF2Pq+ShS
         Oq+g==
X-Forwarded-Encrypted: i=1; AJvYcCUPT5SFAETVvwYZrNDL5juL82+vCdmJ3lsaRxyM3NZ1uNQTKtACCnzFf6ceSbhB84uw1LOt8aFJylw=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy6hHb3HWUl73TcMN/f+EocQ3AOkQ2Hflk/ebgcgynh3keLV9xi
	8vtLAw874b9uPYdPaeYs3MNBpOnKWMdEZATEKp4+YMGqqEdVlQKOdVlhFBGZNAAiJEpIf6OWB6i
	A0uk=
X-Gm-Gg: ASbGnctlqkZ0uanVJQJ9C473kRAEq7uODoR1Px7GQgBVg4RVT6ND4ggIY5GaZq11y2U
	QFHum8ySi3vJQfsQFMMdMOZuVgX5fHttkpGU+HJO+b+pb1mSSZy9aqyyEjJ/mBcdXJ1EDg29yYf
	9GzLXVZ31YaM4eRkPgXNXfxI0P5A8JNqZ9uy7Vm9vGqoxM9mwhgOJPR9DVvqIm/Qd/b3L4yOiNY
	saxGwIy9KSgkqwI5lcJAXm8cX7uxNDtXboygaWW3drtKsFFVVfLOI7T4bKgSZCSLlkDcN1Rc+eO
	eKNuUwyVAvY4dvg+RJh6VPep56sXEGtTcuaEqNghtOr8wtagtBoj1sWKsTu6++X9pFCdc6zlURa
	ZUUKLcG5+Jp1+mZUzRGjjrW3XzQAvDj5LcV0EPy7qk6C+F3JW8RCz/XmImB2w4kB6+p7XmoSmX+
	K8rBqrZa4=
X-Google-Smtp-Source: AGHT+IGaZ8qs7vkLO8OizXMEpkUFj2u3MeKU3ftUPbj43qH3TzXLEkVg0h1qGH+vok/0vm4H6YLbXg==
X-Received: by 2002:a05:6000:25c5:b0:3b6:17b5:413c with SMTP id ffacd0b85a97d-3b795028ce6mr3192334f8f.39.1753888896349;
        Wed, 30 Jul 2025 08:21:36 -0700 (PDT)
Message-ID: <47eaf3cc-3194-4ace-bf2f-a8e2b9be7d0e@suse.com>
Date: Wed, 30 Jul 2025 17:21:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 07/17] xsm/dummy: Allow HVMOP_get_param for control
 domain
To: Jason Andryuk <jason.andryuk@amd.com>
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 xen-devel@lists.xenproject.org
References: <20250716211504.291104-1-jason.andryuk@amd.com>
 <20250716211504.291104-8-jason.andryuk@amd.com>
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
In-Reply-To: <20250716211504.291104-8-jason.andryuk@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 16.07.2025 23:14, Jason Andryuk wrote:
> The Control domain is denied access to an untargetable domain.  However
> init-dom0less wants to read the xenstore event channel HVM param to
> determine if xenstore should be set up.
> 
> This is a read operation, so it is not modifying the domain.  Special
> case the HVMOP_get_param operation for is_control_domain().  It is done
> in xsm_hvm_param() because xsm_default_action() is too complicated.
> HVMOP_get_param should be allowed for a domain itself (XSM_TARGET) and
> its device model - src->target or is_dm_domain().  It should otherwise
> be denied for untargetable domains.  xsm_default_action() doesn't have
> sufficient information to identify the particular operation, so put it
> in xsm_hvm_param().
> 
> Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
> ---
> It's messy, but I couldn't think of a better way.

Fits well with my remarks on earlier patches. The granularity you want
simply can't be had this way, unless you use such undesirable "overrides".

Jan

