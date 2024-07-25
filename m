Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 982E993BD8D
	for <lists+xen-devel@lfdr.de>; Thu, 25 Jul 2024 10:01:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.764782.1175325 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWtPf-0001Ve-4W; Thu, 25 Jul 2024 08:01:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 764782.1175325; Thu, 25 Jul 2024 08:01:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWtPf-0001Tu-1r; Thu, 25 Jul 2024 08:01:23 +0000
Received: by outflank-mailman (input) for mailman id 764782;
 Thu, 25 Jul 2024 08:01:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/jnY=OZ=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1sWtPd-0001To-Cb
 for xen-devel@lists.xenproject.org; Thu, 25 Jul 2024 08:01:21 +0000
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [2a00:1450:4864:20::233])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1311dffd-4a5c-11ef-8776-851b0ebba9a2;
 Thu, 25 Jul 2024 10:01:19 +0200 (CEST)
Received: by mail-lj1-x233.google.com with SMTP id
 38308e7fff4ca-2eecd2c6432so9673081fa.3
 for <xen-devel@lists.xenproject.org>; Thu, 25 Jul 2024 01:01:19 -0700 (PDT)
Received: from ?IPV6:2003:e5:8729:4000:29eb:6d9d:3214:39d2?
 (p200300e58729400029eb6d9d321439d2.dip0.t-ipconnect.de.
 [2003:e5:8729:4000:29eb:6d9d:3214:39d2])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7acab23394sm44719966b.26.2024.07.25.01.01.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Jul 2024 01:01:18 -0700 (PDT)
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
X-Inumbo-ID: 1311dffd-4a5c-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1721894478; x=1722499278; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1rcRioImMxc/6ndik9rsNgcLsBY2YiVPz+IgBUsue8c=;
        b=NaWU1v3vCVtG5Kz9oWHvKxxD9UMLzY9t5MUzo8QIlkWMYc3GXsNhP5RtPH+7aA/DkW
         ln/Cuq67KBhiD/hZ9qIOINCeTeM+TuX00qv926n/KrywEY4+OCgcDP2rZuN20t1/HZEq
         9QdFw3sM+7A8bZAIhzekbjTMUA5lDXnLqe6CZKq/JSCyfmS9X6DW8VHCdvuj4hC7kRcn
         EH3UC5SkFABBcdS5/JWNREKMEogGXjzEChBmYVdmqZ+0sSqxCfE7uEqGSeHO/Vq0G8uQ
         ypcoZqLHMEAbDgY0W+j7cuiv+XlV6Y29M2cxXwijXbT4+ZaRpkJl4q3u57QlHl3C0fmv
         KGsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721894478; x=1722499278;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1rcRioImMxc/6ndik9rsNgcLsBY2YiVPz+IgBUsue8c=;
        b=BRuRQIJXoLGC+Z8SeuHjCEmZNw1YP7KuUoJZWJs/an1YoQFAQpmiezZvr7GiFaKsb9
         j6rTggk3Pt28+PP1ajb96tS7erxr9XrFCgMA3LsO9xj3mjT729oiiZE6GWYH4qPKXp0R
         2AzJEok6ZCSRN42EnWBUQL1Y0Ra6JvJjP2vEYgIhQEyAnWlsot6G1Ifhmqlp+i2QzLiL
         bG2ccUr0ilngKJc78dgRKewz7zRcsk2MvwgUmIqNiSj9iPnP88Ou8dSzx4ga4cEQta65
         tgY4iyHkk/XgSgPoLqhNlUi0P05C+y7bd2WsqDuppV3a32kXG1DLub16aJJCoZniN3EN
         uaHQ==
X-Forwarded-Encrypted: i=1; AJvYcCVIzLGu3yKbW3Yd02h/HlI7tf2JatNe/guXbxT5eWpXQ5DE7C9zt+iZgd9QzENBH2keXhRX0do5LeZDmrLtqGa4NESk+4ro17jtw/L50xM=
X-Gm-Message-State: AOJu0YyqJ9+1TXc/aUL1V2Tyx+Qx//Y1H8MF/7Pm/2kZXUC3rm6gg6CW
	E7kFtqWLITtkmk26fuD+1ZzIe0azJirhUCqEQwO+XmB8M2uMkM0oyjr8+JnFBQI=
X-Google-Smtp-Source: AGHT+IHcNb2whkudlAoX0PIxv0wM+WiJHVbabURN52CZ95xVY0/XjQG7ggcKAuwehZjH4LmIdYalug==
X-Received: by 2002:a2e:3603:0:b0:2ef:2dbe:7455 with SMTP id 38308e7fff4ca-2f03db56305mr10047511fa.1.1721894478341;
        Thu, 25 Jul 2024 01:01:18 -0700 (PDT)
Message-ID: <a249e651-a2a1-4ea9-b262-0d04a8abaf0e@suse.com>
Date: Thu, 25 Jul 2024 10:01:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] x86/xen: fix memblock_reserve() usage on PVH
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org,
 linux-kernel@vger.kernel.org
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>
References: <20240725073116.14626-1-roger.pau@citrix.com>
 <20240725073116.14626-3-roger.pau@citrix.com>
Content-Language: en-US
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
In-Reply-To: <20240725073116.14626-3-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 25.07.24 09:31, Roger Pau Monne wrote:
> The current usage of memblock_reserve() in init_pvh_bootparams() is done before
> the .bss is zeroed, and that used to be fine when
> memblock_reserved_init_regions implicitly ended up in the .meminit.data
> section.  However after commit 73db3abdca58c memblock_reserved_init_regions
> ends up in the .bss section, thus breaking it's usage before the .bss is
> cleared.
> 
> Move and rename the call to xen_reserve_extra_memory() so it's done in the
> x86_init.oem.arch_setup hook, which gets executed after the .bss has been
> zeroed, but before calling e820__memory_setup().
> 
> Fixes: 38620fc4e893 ('x86/xen: attempt to inflate the memory balloon on PVH')
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> ---
> While the commit that introduced the user-noticeable regression is
> 73db3abdca58c, I think 38620fc4e893 should have been more careful to not
> initialize the memblock ranges ahead of the .bss zeroing.

Reviewed-by: Juergen Gross <jgross@suse.com>

I'd prefer using 73db3abdca58c for the fixes tag. Otherwise you'd need to
add this patch to the stable branches, too, which is technically not really
needed.

Additionally I'd like to drop the Fixes: tag from the prereq patch, as this
one doesn't really fix anything.

I can do both while committing.


Juergen

