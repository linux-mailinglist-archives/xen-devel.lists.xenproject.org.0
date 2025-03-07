Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 59C74A5615A
	for <lists+xen-devel@lfdr.de>; Fri,  7 Mar 2025 08:02:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.904595.1312447 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tqRiB-0002YJ-9Z; Fri, 07 Mar 2025 07:01:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 904595.1312447; Fri, 07 Mar 2025 07:01:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tqRiB-0002Vf-6t; Fri, 07 Mar 2025 07:01:35 +0000
Received: by outflank-mailman (input) for mailman id 904595;
 Fri, 07 Mar 2025 07:01:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hW4D=V2=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tqRi9-0002VZ-Gt
 for xen-devel@lists.xenproject.org; Fri, 07 Mar 2025 07:01:33 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ff91d19f-fb21-11ef-9898-31a8f345e629;
 Fri, 07 Mar 2025 08:01:31 +0100 (CET)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-43bc30adad5so9020215e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 06 Mar 2025 23:01:31 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43bdd8b04edsm41908595e9.1.2025.03.06.23.01.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Mar 2025 23:01:30 -0800 (PST)
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
X-Inumbo-ID: ff91d19f-fb21-11ef-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1741330891; x=1741935691; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=RS476B2SU7qQlYR+uylKs0Zico0mizTgEw12o/5AepI=;
        b=ZQi308/Q0Jwto+yjhNhO12gjs4DiTpSPYUahz3VZsQNxJ0y2+WfSJK0GcY+M4dxOWu
         ackp6HdwYxuZ3n20eHJZiBH03BFtMgMi72IQhyyJ1jp96dgoDhiFaQfyAnj6d9ChM7iG
         js+aQG0KCxHZ/QojzXSDGmyCfns8h0ar48Yq80s07YaiQ45tfqc1N91TU6Z5G2auTM7Z
         TqyIzoO3NajYkL2a46ZDQSvtHZb45wH8Ek9iO7oZHtD0Xi0seojrqVU/+YDrpGnCLz/w
         GmuFf/5uXnY6hvYGpG+uwOP40512+rFDmdAKDKtptKlwc+7UIPB/WE0R5aZhmWHMNlCx
         T/mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741330891; x=1741935691;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RS476B2SU7qQlYR+uylKs0Zico0mizTgEw12o/5AepI=;
        b=Zncq7VNN5F2EEi8g4eLfDbcGqwYqB1BkSYkca/9KOtjc0ZTbXVP8n/JjZUc1HxZVGp
         zvVAVW27Z59bxW/wg7sM07c/eWCUE8YfolstKhtuYSf3sB00O9gtCc4vcNXJihcwkjQV
         iCqtUO7spgaO/kAJZqF53WYygNvwmGoox+8VitGNMifrT3pTmzZkriJPO0hF8b3IGoZD
         SnCYuIy2xRAYSXHP9VHDP5D/xLbskuvo9hZ7klJnIb6Ix05izo/NGQLOmFdxwtIQRU1f
         7q72v/ndqBgqrx4mAjKUJxOIJtQmtGODLmlRw4l7zP1WvuqQqtv0s9kbnm6gOMLWldyg
         gZjw==
X-Forwarded-Encrypted: i=1; AJvYcCXISVthSWlheDNJ3oRBjzDxpGEX6ks6rhuiJ3khroFPmOHnPUlxpV2Lsq4ZuJ3QflKTvrXnpbvWt9g=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzP3/JtkN6340KFzGL+Sekl4DgQriDFYCGT+02hyY0wtXNOIrp9
	TFbO/y3K0kjhDjOxXuecqTLgJxILCWT28XPNurSKj8um5WDZVTmGzcnbMHH1gA==
X-Gm-Gg: ASbGnct/rTpVBWj3Ny8iYmHP88m+GvLP2AQuCBk6SwipXyIrOfXoWrQuO9g3HIz8Kq+
	Sct2s1A3KMzdjEJsHlaQ9bvnQkmAluxzrRJV9hJjiR2c9i0NqKWM1utEVkvIaj9PZsL89O8gOos
	YfZNTsJ9wYfEQMRF6Jeb3ZrBohpXFE6iqTcObu07p47E8HniGoHovDSzeD+naMTsQ4h2JBxBzP3
	yZmbmdVtytj3uc6Vmzz28/1vD75/AAbSwfSoOAz7A0KZLcWw9eVUhtTJFCUC8/8AiPE6fBuzEam
	GOTSH6Uqgf9buVESZCqZNiSMCYlRac+6uzyd4eeP4hA46IJhERsnQNuMA8EyezU41oxEV/xunFv
	p95hKapQXdc1OCeb89w3P7GlUq2U5EQ==
X-Google-Smtp-Source: AGHT+IGmoZW+VEw6IvVZ7XdWfaJbp+g7koPT2ud0KSDjbnUyZLKwe35qN37yTOlkeEXi2sv+Ch5RRA==
X-Received: by 2002:a05:600c:4884:b0:439:9d75:9e7d with SMTP id 5b1f17b1804b1-43cd169b4d8mr4051965e9.22.1741330890737;
        Thu, 06 Mar 2025 23:01:30 -0800 (PST)
Message-ID: <f2ad2751-8b00-4541-a372-d754c84f955c@suse.com>
Date: Fri, 7 Mar 2025 08:01:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] xen/domain: Annotate struct domain as page aligned
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Dario Faggioli <dfaggioli@suse.com>, Juergen Gross <jgross@suse.com>,
 George Dunlap <gwd@xenproject.org>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250303232941.2641306-1-andrew.cooper3@citrix.com>
 <20250303232941.2641306-2-andrew.cooper3@citrix.com>
 <abffca04-ca4f-4d62-8c2d-c687550ca8c3@suse.com>
 <7da64dd1-2510-440f-b165-f64c0a873575@citrix.com>
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
In-Reply-To: <7da64dd1-2510-440f-b165-f64c0a873575@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 06.03.2025 22:29, Andrew Cooper wrote:
> On 05/03/2025 9:23 am, Jan Beulich wrote:
>> On 04.03.2025 00:29, Andrew Cooper wrote:
>>> --- a/xen/include/xen/sched.h
>>> +++ b/xen/include/xen/sched.h
>>> @@ -645,7 +645,7 @@ struct domain
>>>      unsigned int num_llc_colors;
>>>      const unsigned int *llc_colors;
>>>  #endif
>>> -};
>>> +} __aligned(PAGE_SIZE);
>>>  
>>>  static inline struct page_list_head *page_to_list(
>>>      struct domain *d, const struct page_info *pg)
>> I understand struct domain is where you need the annotation right away, but is
>> there a reason not to do the same for struct vcpu right away?
> 
> struct vcpu is more complicated.  It's multi-page on ARM, and I have a
> strong suspicion that alignment is going to have to change away from
> PAGE_SIZE for architectures wanting to use larger page sizes.
> 
> e.g. with 64k pagetables, I expect these will still want 4k alignment,
> and therefore they'll all want changing. i.e. I'm probably creating less
> work for someone in the future by not annotating struct vcpu. ~Andrew

Wouldn't the same hold for struct domain?

Jan

