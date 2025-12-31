Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 43912CEB873
	for <lists+xen-devel@lfdr.de>; Wed, 31 Dec 2025 09:28:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1194523.1512909 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1varYe-0001rn-02; Wed, 31 Dec 2025 08:27:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1194523.1512909; Wed, 31 Dec 2025 08:27:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1varYd-0001p5-S1; Wed, 31 Dec 2025 08:27:51 +0000
Received: by outflank-mailman (input) for mailman id 1194523;
 Wed, 31 Dec 2025 08:27:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TQtY=7F=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1varYc-0001os-0q
 for xen-devel@lists.xenproject.org; Wed, 31 Dec 2025 08:27:50 +0000
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [2a00:1450:4864:20::535])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9719126c-e622-11f0-b15d-2bf370ae4941;
 Wed, 31 Dec 2025 09:27:48 +0100 (CET)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-64dfb22c7e4so7367764a12.1
 for <xen-devel@lists.xenproject.org>; Wed, 31 Dec 2025 00:27:48 -0800 (PST)
Received: from [192.168.1.6] (user-109-243-67-101.play-internet.pl.
 [109.243.67.101]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-64b91599605sm36937041a12.23.2025.12.31.00.27.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 31 Dec 2025 00:27:47 -0800 (PST)
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
X-Inumbo-ID: 9719126c-e622-11f0-b15d-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767169668; x=1767774468; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fobpSK9AUXphPAhG1PyM5Pwgt4TvSHa2X/lrd8clEqM=;
        b=aIteteG8NdbWENjFWnS8zke9aG+mLSegZ/WJwUwY0JfykdaJ7YaRRE3XQ96yk+/HXW
         AuTZvGJUeipgaK0fX1JjWwJ/uaCl2JIlWFfe5WBIMgYjvt4rk+J923QVNCw8us27Bf93
         qYT/GbPEhqS89YobJtQbSzjgqQ9RWOs2Hhbslo4mSsxbQ1hfO8qwp+1163VJa+lyodNy
         nv0Hxz4bTe0+sd+6mhkJsttoRe71mTh11KI8ICwB5aKxRjSoCyy5B2BWpwS4sS2+1tnL
         NM5jI5kOG3eYYFoFdxVYmOxSM6nuQP4XZ5c8aIUm7Rw6WseWWXEksuk8SDBD2E4SWjys
         27/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767169668; x=1767774468;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fobpSK9AUXphPAhG1PyM5Pwgt4TvSHa2X/lrd8clEqM=;
        b=qY+VmKZeT3dY4T6obYboNEgi3HoqPhc475cQPBkRatm1z8Aw/eAqTNTBRe554pVZ92
         icT9wO3d+8FZ+7eF4y093uCvVaq0qD7l8Qc9Qw3JI6bI/jmsf+BZLn/o/N8LsShiUnwQ
         65bCKkaDxyAEvHMxz0728rsTE+QYYA0Xf+SYHpgXD3zREqRTTRPIsyp2bkchrjwEk3F7
         QMhFnS4yxZGGFrsbromR5gJshscf2gJ9Z2/sHmwARS/M+TBiJR/AgowjB3v+0xVP3QA5
         YDvH2wcQTSMfbp6vY02A72Tbarn1iLR2Zr3SrEQgftIrp8i5b2UD+ZyPJb2BIu4HxPkG
         moZg==
X-Forwarded-Encrypted: i=1; AJvYcCUtjVvLSE4I/IaE08ijgV9r+iwCv4JPJ8dVavsBmU6IyMk9T+xzL20KYb0gAOUsUcJo9jmIAA3L4oQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz/1SfxeTn9Kw4fbyCaLuvWgE+PLb0czu9CSLh+UFFxUz0npURj
	36IAllTZNhyQLX5dD5QqIlhSlMTvH7JAh8W+uFllIZ+8ReX+zJiadcYL
X-Gm-Gg: AY/fxX5jLKJyy6Kbp1keObCCdAPOJIBs3ZLO+4u9nIDNiOMJfN85Dk+BVa7Xd3DPK7a
	SzpIuGO0QPtH8mnQIF4bTP2fC6zYqJx5A+Eg1kAxAUz535lXjBgQX3xkZPJNbVg7UgWzMB5j4hD
	NlYmDvY1tvSydLWIaro4ZS94Hw8WZ+Vp1wciblKhb3yVPP+ZE3c/wv9eDrDsssJKe6bJ23uZNiR
	Vvl0RJ5k8SFm+WLri6SsMiBmljTuEjgUPCOrKj41ZPFZ/ivdY/BsgYmF8tD6Ak4eKI/Afka90QN
	FWKaipwHKVn+NbGjnNyz1AF0VTaP/prjU0sLjcRzb/3VeWM+P5YD1f9lVZyitHVKkGskn5c7Xtx
	4aOkczZJsTWzNInruH/70ABNu0rTE0/yofUUfNIJ/Jm4FS4+iO+TzC34sT0m6gCXdnWPEAwvtCM
	pdDTfUteL6Cfi+N4uTZ1vW7gW5G2uL9u9wrpnGolveY1be2LQyTg6C8fcRzmgnyCU=
X-Google-Smtp-Source: AGHT+IFFR875P5sAxSwb8eNWKE2TGpCv7OYBlEAvuaiumzld7urOY4EmCLTTRinr0c5I0yvFw6GWfQ==
X-Received: by 2002:a17:907:70d7:b0:b80:1403:764c with SMTP id a640c23a62f3a-b80205e6bd3mr3024207366b.24.1767169668174;
        Wed, 31 Dec 2025 00:27:48 -0800 (PST)
Message-ID: <096a8105-667e-43a6-856f-3ed52fb1c0a0@gmail.com>
Date: Wed, 31 Dec 2025 09:27:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/4] xen/arm: optimize the size of struct vcpu
To: "Orzel, Michal" <michal.orzel@amd.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <cover.1766504313.git.oleksii.kurochko@gmail.com>
 <0756ee97dd47f6acdefe593694b743eb6bfefacb.1766504313.git.oleksii.kurochko@gmail.com>
 <9f2c9e4a-64e3-4e5e-b5da-976ab433f6cd@amd.com>
 <9f343323-2743-4bd6-82de-afe3b48adb70@amd.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <9f343323-2743-4bd6-82de-afe3b48adb70@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 12/29/25 12:10 PM, Orzel, Michal wrote:
>
> On 29/12/2025 12:08, Orzel, Michal wrote:
>>
>> On 23/12/2025 18:01, Oleksii Kurochko wrote:
>>> When CONFIG_NEW_VGIC=y and CONFIG_ARM_64=y, the size of struct vcpu
>>> exceeds one page, which requires allocating two pages and led to the
>>> introduction of MAX_PAGES_PER_VCPU.
> Also, I think it would be better to drop MAX_PAGES_PER_VCPU in this patch.

Then I'll update alloc_vcpu_struct() and free_vcpu_struct() to:
  struct vcpu *alloc_vcpu_struct(const struct domain *d)
  {
      struct vcpu *v;
  
-    BUILD_BUG_ON(sizeof(*v) > MAX_PAGES_PER_VCPU * PAGE_SIZE);
-    v = alloc_xenheap_pages(get_order_from_bytes(sizeof(*v)), 0);
+    BUILD_BUG_ON(sizeof(*v) > PAGE_SIZE);
+    v = alloc_xenheap_pages(0, 0);
      if ( v != NULL )
-    {
-        unsigned int i;
-
-        for ( i = 0; i < DIV_ROUND_UP(sizeof(*v), PAGE_SIZE); i++ )
-            clear_page((void *)v + i * PAGE_SIZE);
-    }
+        clear_page(v);
  
      return v;
@@ -503,5 +488,5 @@ struct vcpu *alloc_vcpu_struct(const struct domain *d)
  void free_vcpu_struct(struct vcpu *v)
  {
-    free_xenheap_pages(v, get_order_from_bytes(sizeof(*v)));
+    free_xenheap_page(v);
  }

Thanks.

~ Oleksii


