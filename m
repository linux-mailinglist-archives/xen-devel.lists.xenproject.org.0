Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F57D945B18
	for <lists+xen-devel@lfdr.de>; Fri,  2 Aug 2024 11:35:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.770817.1181409 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZogd-0004dd-1x; Fri, 02 Aug 2024 09:34:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 770817.1181409; Fri, 02 Aug 2024 09:34:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZogc-0004by-Ul; Fri, 02 Aug 2024 09:34:58 +0000
Received: by outflank-mailman (input) for mailman id 770817;
 Fri, 02 Aug 2024 09:34:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=bU9L=PB=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sZogb-0004bs-TA
 for xen-devel@lists.xenproject.org; Fri, 02 Aug 2024 09:34:57 +0000
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [2a00:1450:4864:20::529])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7a555c0f-50b2-11ef-8776-851b0ebba9a2;
 Fri, 02 Aug 2024 11:34:56 +0200 (CEST)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-5af326eddb2so5305778a12.1
 for <xen-devel@lists.xenproject.org>; Fri, 02 Aug 2024 02:34:56 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7dc9ecabb2sm76637766b.214.2024.08.02.02.34.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 02 Aug 2024 02:34:55 -0700 (PDT)
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
X-Inumbo-ID: 7a555c0f-50b2-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1722591295; x=1723196095; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=IZ8EcOpsXrt02ySDEHAtgYUraLY+wIsLYMyC376Ur0g=;
        b=emACKsfLmhjB1Vnsu34FRMB+Sgiq1EPG1cvmw72WdCtg6dEKStzFOtSaKviURNgqF/
         XoewbbaTbe8vWSKLcCXH2f3h2m+hIQjmvB9QXhoFV/TpMH0Hr6vIkBGH5MRVZ+5HatLF
         V+O1S4TbItG8Kfj35WsJe/18PPt2VuBVQLhQI9RYOeiyygIF/nzgXU3TSEcJgTUhTtPo
         zoRycBG3q08zkMtHtI1MTqPK1aeO6WvwQR+UMuU6CI5ekMBQQ0cyP2vtLq4+g2cGJlIj
         6kmcp1RFFmlXbCRyk9fpXP19E1zZ62X2i9wdw6H3CgjuOIqMUA8SPpdRlbEMPWYv2OAq
         wZew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722591295; x=1723196095;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IZ8EcOpsXrt02ySDEHAtgYUraLY+wIsLYMyC376Ur0g=;
        b=VnQojAqAUcyoDUO25gickfDyzl7wXByfvg7xoSJqGRzwAXVIX8K2Gi5c8Gjd7c9Opa
         nXGS5J25uZMu4HI7DGEf4PgwnBCDnGcF8vpnGABN4pydXxuvHSXqTgeQayMdaypT6UdX
         i/8AcMhZYuhYbbLltTrJBgw78T/BVda/f98P0CA9aNgGie+jaOBcw6sdRfWN6t49Quc5
         VW9MPYnErJnvmonZJ+GzTiEZBuj63SAqIuh2XB2CORHB/MSdqqKSHFdjtL1Yf9jI63nr
         HkUzfljQ5Xyvbn8rwEdccY8hzPXyPXJbAWG+szIMUb82m183LioOTteY28UyB6N4xBV8
         y4rA==
X-Gm-Message-State: AOJu0YwMChpLk6+Zb7Z3iqN94D34Lkdg89KkTvVQUn1d8OvQBI0rL5/7
	abCRV/1o1xr924re93iY8wLE1+O+LnOoC6Qcv3ux+Wm/HWnu7SDkPOIwamGONw==
X-Google-Smtp-Source: AGHT+IF6fAwz+FKIaZNJB2j5cJNpKzTqDK8HZS2bk3v7A298D52OgCSN85aiJKzqtEE2enpae1xOTA==
X-Received: by 2002:a17:907:72d4:b0:a7a:b18a:6c with SMTP id a640c23a62f3a-a7dbcc28507mr355805866b.16.1722591295295;
        Fri, 02 Aug 2024 02:34:55 -0700 (PDT)
Message-ID: <4cff5f0b-3a19-4071-a201-51ea72ee48ce@suse.com>
Date: Fri, 2 Aug 2024 11:34:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mktarball: only archive Xen
To: Anthony PERARD <anthony.perard@vates.tech>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <cf280800-d0d6-4493-933f-f83f418dd91d@suse.com>
 <Zqym5op9e2BAn5KA@l14>
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
In-Reply-To: <Zqym5op9e2BAn5KA@l14>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 02.08.2024 11:29, Anthony PERARD wrote:
> As for removing the rule "subtree-force-update-all", I don't think
> that's a good idea at all. As long as Xen's build systems is cloning
> subtrees we need to keep the rule. Those subtrees aren't going away
> anytime soon, especially mini-os for stubdom.

So you expect people might be using that goal from the command line?
Fair enough to keep it if so. I simply didn't think a goal with this
long a name would be intended for manual use.

Jan

