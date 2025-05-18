Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 008CDABB00C
	for <lists+xen-devel@lfdr.de>; Sun, 18 May 2025 13:25:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.988963.1373312 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uGc7f-0005MU-Ap; Sun, 18 May 2025 11:24:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 988963.1373312; Sun, 18 May 2025 11:24:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uGc7f-0005K6-6W; Sun, 18 May 2025 11:24:03 +0000
Received: by outflank-mailman (input) for mailman id 988963;
 Sun, 18 May 2025 11:24:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=GB/u=YC=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uGc7e-0005K0-9j
 for xen-devel@lists.xenproject.org; Sun, 18 May 2025 11:24:02 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 98533ea8-33da-11f0-9ffb-bf95429c2676;
 Sun, 18 May 2025 13:24:00 +0200 (CEST)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-43cfba466b2so37770425e9.3
 for <xen-devel@lists.xenproject.org>; Sun, 18 May 2025 04:24:00 -0700 (PDT)
Received: from [172.18.118.114] (ip-185-104-138-68.ptr.icomera.net.
 [185.104.138.68]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a35ca888fcsm9346273f8f.78.2025.05.18.04.23.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 18 May 2025 04:23:59 -0700 (PDT)
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
X-Inumbo-ID: 98533ea8-33da-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1747567439; x=1748172239; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ISVlo5CkaHqObbg8m9QzQeot5/VqVMTOtl6H4zBVWbU=;
        b=IobFZHXu+ucW4ipourL6xfZHL/ce6UT7EGNfrKFIsrO+cp6ZqevWPgvHxv1jVPMhr+
         VA+Tx3jw/f1VodWiuxLW6Bs1KAlpJcepGeOQlhYxOIyKOq0pOk1woYm/DjpLubupb/qK
         vGgY5biWO9il7bTapPUpHY5OaBk3RrB0xZyO9rsOh5leZliWJU7HFJ5Rl5DWEYv7xEwM
         H1Zexnfwfvs/ZxAZ4S3zw4B4i75ItHAQIXtQqrlIikJRyIo4JwzloP64M0GfMPFm2rZc
         9QVeO/QiN0EftmNvdC5zPCsWx+61BdYm0MXuLBzkadLZUnbwocr/f6WNHrrwrFwpDwVb
         54nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747567439; x=1748172239;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ISVlo5CkaHqObbg8m9QzQeot5/VqVMTOtl6H4zBVWbU=;
        b=WncrR/Coxsbe3tN9tdtYxWeHvvU6uolCL316FrIl0YH9cXhnzuq9dVawhDZXrjjOeT
         qL8t3oftkDLuNPnJXB0gxpFYcw9+KHrHQCkZaRAop5YSjx4jOwH+DJppJd54hzlidwg+
         Cz40wlJPlp980TkCyk4gWWTiG9LkUmaRU+zwjNHZRO2WAiW5gaRt/KzWpoNVx8v+CtB/
         og3Hz6cco4pleRs9LV87ak74dgec67o+dCFXG5Vblaw+1EUa1fDoWtZrnxrxshsBsvza
         RgDtdrHsuNqSZP5BmmAf21z8h+qziAWBhi/GtI2RS92qc9Rm+IZMzws+dStP5Esm5Ehz
         L75Q==
X-Forwarded-Encrypted: i=1; AJvYcCVlr8r1+CNVVaq7kyWgzHYQq0GMlQUuHz/Pp7481U1HMPO5EzM9OhbW3OjHBacw93m8PNPupWwf7m4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyLqZMTtwkzDNZ1G/M54T3DuSJ+rfzA/2xd74Z/048HhBOArMqc
	9ZFgMOSfs0JaHeUUfN7JoZUeWy7tovkM5MZsG0v8QwXIbzF62PDVB4pvuZY5yKMhSmIft0hlpYR
	gz3M=
X-Gm-Gg: ASbGncvVcJNbixA/KVq1kwYo7G2gp1y+A0ckBUhbreItGW95i/9/mV2v4IZEByuaCzB
	g5B6EYTnbyPUBjHGYL0A6B2783u+lMtxjLDXYy/Yjzhd1rh4if2EHfaBIkqaa9iBtzdDL6zjfZO
	moEeHAd+zUy7HfnZqSUqO/LaRPBjs5cBjjZ6aSQnaZGKOcWUxgPKE7ol7/CYATKKEK23JTib6dH
	u/ffP3V+bWEeN7sElKwcdA9SOS62Myu0sejpWSHkkWf5Sof1ImqdK4qPs8hZjfViY3/hN3uNPhT
	J3NlNpW3WyAIuoV0Kn43LtMzovzRwoOH86z9TvkgmPHxL9QS6AAV7Vadosw2G2PrHBmByxtJD9C
	tE+DdQSIEK3adwzytN7MyPb0rrwa++9gSMog=
X-Google-Smtp-Source: AGHT+IEtrY2tkm+X6QdVhUSyPmEce2mFk4GFUIf6+8n2tI0nvDwmhtpEccYq/1Vy9fZnrsLDcgKEew==
X-Received: by 2002:a05:6000:4284:b0:3a1:fd60:887 with SMTP id ffacd0b85a97d-3a35ffd2bbbmr6966880f8f.45.1747567439481;
        Sun, 18 May 2025 04:23:59 -0700 (PDT)
Message-ID: <30797d9b-8ba4-4ffb-8b85-251ff585afc2@suse.com>
Date: Sun, 18 May 2025 13:23:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/6] x86/pv: fix emulation of wb{,no}invd to flush all
 pCPU caches
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <20250516094535.63472-1-roger.pau@citrix.com>
 <20250516094535.63472-2-roger.pau@citrix.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20250516094535.63472-2-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 16.05.2025 11:45, Roger Pau Monne wrote:
> The current emulation of wb{,no}invd is bogus for PV guests: it will only
> flush the current pCPU cache, without taking into account pCPUs where the
> vCPU had run previously.  Resort to flushing the cache on all host pCPUs to
> make it correct.
> 
> Fixes: 799fed0a7cc5 ("Priv-op emulation in Xen, for RDMSR/WRMSR/WBINVD")
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>


