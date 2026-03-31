Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WIZtGLvuy2m5MgYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 31 Mar 2026 17:56:43 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C5A2536C33C
	for <lists+xen-devel@lfdr.de>; Tue, 31 Mar 2026 17:56:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1269161.1558277 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7bS8-0001Aw-Ba; Tue, 31 Mar 2026 15:56:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1269161.1558277; Tue, 31 Mar 2026 15:56:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7bS8-00018q-8Q; Tue, 31 Mar 2026 15:56:28 +0000
Received: by outflank-mailman (input) for mailman id 1269161;
 Tue, 31 Mar 2026 15:56:26 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1w7bS6-00018k-Aj
 for xen-devel@lists.xenproject.org; Tue, 31 Mar 2026 15:56:26 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w7bS3-00Fy82-VJ
 for xen-devel@lists.xenproject.org; Tue, 31 Mar 2026 17:56:25 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69cbee8e-2eae-0a2a0a5409dd-0a2a45038a6e-18
 for <xen-devel@lists.xenproject.org>; Tue, 31 Mar 2026 17:56:25 +0200
Received: from [209.85.128.47] (helo=mail-wm1-f47.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <jbeulich@suse.com>)
 id 69cbeea9-1947-0a2a45030019-d155802fb5ef-3
 for <xen-devel@lists.xenproject.org>; Tue, 31 Mar 2026 17:56:25 +0200
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-48704db565eso73804785e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 31 Mar 2026 08:56:25 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4887e83682fsm49749425e9.7.2026.03.31.08.56.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 31 Mar 2026 08:56:24 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:In-Reply-To:Autocrypt:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1774972585; x=1775577385; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=InSI0fJBvNdmLz7Lbfu1htsosIRCbjjDLgKx+8Uljrs=;
        b=PfnGZEpJYd6egXpUDmP2LqBrBeu2RCnfpuDCldVhfg7jDHrZSDFINVlcbkYtZR9BUN
         048dfE0VnbEzyww0ZKB39lbg/NIqY6IpchAZfP5iDFyF7HEEW397KW+IfCmJnoO+pdaV
         PaaGUaznnzjpJjTqb/HK2/3t3kGj0A5czBCGx3mFqzIfGOcBhybA8RwkMlVMXr78D0Mm
         yKQwANQsqAhfpUV2rWYmHKMYGWgkeeLChJ6fJx8VNot3Bk1EPris80cHg+OKpuAzF9Ys
         QLush8sYJuHZ0gZxk23rFUroaPkKINX2Emyg/m3c+WVNaPXCyLAceno9pYKinZNBkc61
         2DlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774972585; x=1775577385;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=InSI0fJBvNdmLz7Lbfu1htsosIRCbjjDLgKx+8Uljrs=;
        b=Az3taz6PP0Upm4Dkj72uMA0aAWjdEec/E7iyLqhPpqGJz2eKK9lPlw3YekC4lKRCPy
         Gr4qIYcHtTKR5/v4/0qgAPiU3jTjXUcfttLW18zuNsy1gIS6Mu/ZqOUnMA7LYC0Ws+V9
         jv8Y5TeGq/QQq+412UijmCnxePtTlTMiX/EyHyWwKD9Z76mSAQ5VGCtwVX6xTGcMtvZh
         KUW4LNs5/VCiqcWvTtSUsAvFOrt8wjjFuBTinGO2ADHJItXLYQ8ptEfKBfskzd+Ml6At
         enqyjB07e4uVSFZ7IQOIEIuEkszQDHIFRJBYSkGF+IA+cNzyJa/biywIfo5bzWCBlE8L
         Sc+w==
X-Forwarded-Encrypted: i=1; AJvYcCWw3ump2ZvTVq0VVPIqaM4SD9rgRXAdsLm4Lg4UjiShczVuly/rS2fLV7UOhSHLaX1MW8D5i5iis4Q=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwlPOIvBiMfae6AdPIMyYSo3zNeVcS3jRaDlbE9wxns2+JZdsg+
	0mrMjIYGfj0vKt+jfDmTD2nNJ6j0stYFdkGY+HLjX+UWK6gd88OgF98GWhfkoXmoBQ==
X-Gm-Gg: ATEYQzwdC/rw0HSBSjjrCxJXsLaa1m3SPwRijXx+Wu5WNnxU2naPWHm2so+T6Ucxrc0
	pzAabG/L8FcrVoQTjG5bJrEGsUKvOo1jaw/tE+f16dYIC+FaKAEzZFOARviF3ghhDNrMx5u1KPg
	c7nkQx4nPstCxnC+GVX2Kdl9Yfa264m1tg+1WPlQhC24M668tE4aFHr5mgKjAoLRRugPClEUgKE
	pk9M4waFyTIRUSBdGL4pfTtx5SvJuooAhH9qkW7W40r4iGu/a0asee1ip9C/+LEQgoGVUlaf3mN
	mntYJ5BmRL9iZGCIwO3KtawlY888OzbC/2y6mrYCWIeRIiohqcYL6IWt/MqafgqlPn8IOrd143S
	eSgujO2B56HnPpt//Gt0vRjKZ6/xPDPu7xJ/UbU5o+AB74JQQYZr2Dn+VFsjwpXxqWL2X8HS1ZL
	XkrOhuBeZcrTWTdyQVWM3IEX5IQN8DLZBqnG9oulxlGNUqu1gWLVCApNexj7WJIIVpWhTSvdagA
	ZUu1nBD6lN5BQ2XSTNPaDMMbA==
X-Received: by 2002:a05:600c:35c3:b0:488:81b1:ae36 with SMTP id 5b1f17b1804b1-48881b1af51mr17100385e9.23.1774972584795;
        Tue, 31 Mar 2026 08:56:24 -0700 (PDT)
Message-ID: <ff2c91e3-6da3-4561-bcd6-054ac7ba47d4@suse.com>
Date: Tue, 31 Mar 2026 17:56:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 05/11] xen/riscv: add kernel loading support
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1774281309.git.oleksii.kurochko@gmail.com>
 <1688c6e0e616b2d1bc1a9050d66f007e0e65d3b2.1774281309.git.oleksii.kurochko@gmail.com>
 <0a28eda9-a1c5-4e12-907e-b85f8972881c@suse.com>
 <05b1bc67-bbed-412e-881e-a3fb2c2d873b@gmail.com>
 <57f01614-e742-4f2b-be9f-6687ea0b79e5@suse.com>
 <a0efb7a6-4854-4fe5-bbf4-2561f25d7133@gmail.com>
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
In-Reply-To: <a0efb7a6-4854-4fe5-bbf4-2561f25d7133@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-33051d/1774972585-48E5372C-D16AE819/0/0
X-purgate-type: clean
X-purgate-size: 1638
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:oleksii.kurochko@gmail.com,m:Romain.Caritey@microchip.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_CC(0.00)[microchip.com,wdc.com,gmail.com,citrix.com,vates.tech,amd.com,xen.org,kernel.org,lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[suse.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: C5A2536C33C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 31.03.2026 17:36, Oleksii Kurochko wrote:
> On 3/31/26 5:14 PM, Jan Beulich wrote:
>> On 31.03.2026 16:30, Oleksii Kurochko wrote:
>>> On 3/30/26 4:47 PM, Jan Beulich wrote:
>>>> On 23.03.2026 17:29, Oleksii Kurochko wrote:
>>>>> +    /* Currently there is no length in the header, so just use the size */
>>>>> +    start = 0;
>>>>> +    end = size;
>>>>
>>>> What's image_size then?
>>>
>>> The comment is incorrect, the length is present in the header, but it is
>>> effective length which isn't equal to the size of binary and is actually
>>> bigger then binary size.
>>>
>>> So here we want to use 'size' as it is a size of binary itself.
>>
>> What is "effective length"? That sounds a little like e.g. .bss extending
>> past the (file) image, yet such would nee taking into account for allocation
>> (but not for reading in / copying over).
> 
> Yes, correct.
> Effective length is how much memory the image needs when loaded and 
> running. So it includes .bss (and similar sections) that are not stored 
> in the file but need zeroed memory at runtime. So:
>   size = actual bytes in the binary file
>   image_size (from header) = total memory the kernel occupies at runtime 
>   (larger, includes BSS)
> 
> So I think that:
>      start = 0;
>      end = size;
> that could be dropped at all. then:
>    info->image.len = size;
> 
> Then in kernel_image_load, pass load_addr + info->image.effective_size 
> to place_modules instead of load_addr + len.

Not really - for loading you need to know how much to load/copy. For
allocation/placement you need to know the overall size.

Jan

