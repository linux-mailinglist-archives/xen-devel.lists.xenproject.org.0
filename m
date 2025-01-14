Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A094A102FC
	for <lists+xen-devel@lfdr.de>; Tue, 14 Jan 2025 10:28:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.871023.1282063 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tXdD2-0000br-U9; Tue, 14 Jan 2025 09:27:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 871023.1282063; Tue, 14 Jan 2025 09:27:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tXdD2-0000Za-RR; Tue, 14 Jan 2025 09:27:40 +0000
Received: by outflank-mailman (input) for mailman id 871023;
 Tue, 14 Jan 2025 09:27:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tIyo=UG=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tXdD1-0000ZU-NZ
 for xen-devel@lists.xenproject.org; Tue, 14 Jan 2025 09:27:39 +0000
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [2a00:1450:4864:20::62a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ca026ec4-d259-11ef-99a4-01e77a169b0f;
 Tue, 14 Jan 2025 10:27:35 +0100 (CET)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-a9e44654ae3so844289366b.1
 for <xen-devel@lists.xenproject.org>; Tue, 14 Jan 2025 01:27:35 -0800 (PST)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab2c90da8b2sm604410066b.44.2025.01.14.01.27.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Jan 2025 01:27:34 -0800 (PST)
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
X-Inumbo-ID: ca026ec4-d259-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1736846855; x=1737451655; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Nyd7dH3RHiKx0E2y9+ZoavS8jdI9kOOhJQh9JbRxM5Q=;
        b=rbJuk+h+dAuUd2Q2m4YN+slBS6l5tiqCWdSg6RUoFq3dJCe+72apkdMzwHuS8rEqvc
         +BqlDqT1tA+j32Ni3N4dDKO4wh3MK4cs3aXRx6uBHcAUVQMhXVNio8Gk7uvxTG67I1DQ
         n6W7T2CXYsripiT7MVbWxR3UWBCoNsTlpVvHg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736846855; x=1737451655;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Nyd7dH3RHiKx0E2y9+ZoavS8jdI9kOOhJQh9JbRxM5Q=;
        b=mx0aNMYkgQwd32zaL/NONQ0r2C8gE0CgqqVqKjb/EenJG5qp0NvAiDHvG0jMb46Itx
         jL5BlculF3qM1oR/bsCoQabffaORzfx9iGnWYWqFcBm9v0xYGkJfx/C2DWwErsnzP8uF
         kVyTILEh9JG8BjvzA0Xf4MzU8HxGPbGFBI2N1ZVBiPkZEnXRpF6MZYX+gHqB2opPbMIb
         7mniZCZC1ObnxRy9cex9nGpNLKd6SfQ3BhWGktvXILNuPlMzCyrLOOIPWp0tZ7DCDP0y
         R1CO46qmsMXdtTjT5Ek5UGTMVcWMKgHwGyObrfEHP1yuBhaTbFZjZYFQhshggH0GXYvO
         zNPw==
X-Forwarded-Encrypted: i=1; AJvYcCUi6JtxyblvePCPMPD/QpHifYfkNx4vX2tjS3igVzRadSfKzY6U+IW1G7MjG8t3f5avv75diVKDaZU=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy61eY2PKU2joHABq+wpB1LCpz9DDKhvuL6T7g1+e8rW3sqGOJR
	AZh2kAaFYR6E98Sr84/5C3xuxokXmF7X0NyELi3E1lC+6n8YvvxNInVzXKeWhAg=
X-Gm-Gg: ASbGncvBlR7TIAneBuwA73odWNwdIihsiHv9ttA8jAbCo+K2oeoRIX3ZUyAv2wQwNvu
	LwUsWburnnTPWCxvMsN//7RceUTBik+AV8UE3U19Z8juGvUTIP0HcnnUrN0sgk4Lc20+9dzaBuX
	mGFdlk8st5c+YlksrVf4+hzvYcdylIHXeo3wICSxcwwiUCd1Ygqwd7LOVBimSiHjOfvf0jYQwiU
	9iznWTbkMtxo6ZSQSmxTU2+e+qLUyHVYGGcuXmAocBzyWxiBX5wQ6eN9Q8MP2lQknixnjJP4cG+
	vMau3ZMZtiqrc7HFJG5e
X-Google-Smtp-Source: AGHT+IH8MfgE39ztq/3hsSseqw32JAQQtYkLXVGYcPntCz+fX0bp3sFv2J4Hd2l4tqrRsPTYLgRESQ==
X-Received: by 2002:a17:907:2cc2:b0:aaf:123a:e4f0 with SMTP id a640c23a62f3a-ab2ab6c002fmr2005744866b.6.1736846855101;
        Tue, 14 Jan 2025 01:27:35 -0800 (PST)
Message-ID: <5e7af388-8b8b-4d81-9429-14a330780b64@citrix.com>
Date: Tue, 14 Jan 2025 09:27:34 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xl: properly dispose of libxl_dominfo struct instances
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <f751c5f0-3895-43bb-874b-3611b7916133@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <f751c5f0-3895-43bb-874b-3611b7916133@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 14/01/2025 8:12 am, Jan Beulich wrote:
> The ssid_label field requires separate freeing; make sure to call
> libxl_dominfo_dispose(). And then, for good measure, also
> libxl_dominfo_init().
>
> Coverity-ID: 1638727
> Coverity-ID: 1638728
> Fixes: c458c404da16 ("xl: use libxl_domain_info to get the uuid in printf_info")
> Fixes: 48dab9767d2e ("tools/xl: use libxl_domain_info to get domain type for vcpu-pin")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> I wasn't quite sure about use of libxl_dominfo_init(): vcpuset(), for
> example, doesn't call it.

It's a written requirement (somewhere) that *_init() and *_dispose() do
get called.

Except everyone's lazy with them and plenty of scenarios function
without, which is why it's often Coverity telling us about it (but only
for the instances where there's a real malloc()/free() gone missing).

I expect it would be better to extend this patch to fix up vcpuset()
too.  The changes so far LGTM.

~Andrew

