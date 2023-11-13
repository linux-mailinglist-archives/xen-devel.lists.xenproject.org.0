Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B63A27EA271
	for <lists+xen-devel@lfdr.de>; Mon, 13 Nov 2023 18:53:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.631888.985664 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2b7Q-0007Nz-NS; Mon, 13 Nov 2023 17:53:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 631888.985664; Mon, 13 Nov 2023 17:53:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2b7Q-0007M0-Kb; Mon, 13 Nov 2023 17:53:04 +0000
Received: by outflank-mailman (input) for mailman id 631888;
 Mon, 13 Nov 2023 17:53:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=h1x5=G2=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1r2b7P-0007Lu-1U
 for xen-devel@lists.xenproject.org; Mon, 13 Nov 2023 17:53:03 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7ce59900-824d-11ee-98da-6d05b1d4d9a1;
 Mon, 13 Nov 2023 18:53:01 +0100 (CET)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-40a48775c58so26223765e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 13 Nov 2023 09:53:01 -0800 (PST)
Received: from localhost ([213.195.113.99]) by smtp.gmail.com with ESMTPSA id
 n7-20020a7bcbc7000000b004064cd71aa8sm8697066wmi.34.2023.11.13.09.53.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Nov 2023 09:53:00 -0800 (PST)
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
X-Inumbo-ID: 7ce59900-824d-11ee-98da-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1699897981; x=1700502781; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=T8/3EOPbR2ofVzNuWqkP/qMPKIkG7fBZoWGemR7UHzU=;
        b=d6MZPpYIfQxqAoEIcIuGcJrF6y7YOTn3KgMQ0QPWlfzToeOsQsYIuZYuWRJsG3qn3c
         HlXMjq+JY37aZFSdI2gI0qUiQQKzP9ErU9Ys5+oUKrl15emBoeDSQDId3M+F8kGVJbSz
         o7K6xXmelOkoFgdnfLZuc9mvDeRfD7pA5tj6Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699897981; x=1700502781;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T8/3EOPbR2ofVzNuWqkP/qMPKIkG7fBZoWGemR7UHzU=;
        b=AROF0iOz2zHCCf95eF4lV0lEaFSHjB6aIBf5dmHiQe/qCpNrapFU06l4KKXruYLvLz
         kLnmfly2Gu8UkyrdSxcIHMkhbk0amVf3QSlYWpyHbZJRV7r9hiMzmB82NArRiHLCVpU+
         rxTYI7vULQQVG/A1GHCoYeuiC86rz1K/ZhI+/nl6pLBurZsBhxKVIgiOr43iQ2pLqkkw
         5kn01s7kntim48Jp4yMJr/t+RzqZES3ZTsFdkWFjV8zAtBldjrZpAlaCnjdVnjdW3oYX
         RV+V4aiCC91ebuo4NEmmtI5INU/WNLCGQTDt4cwrWFRxlrVMnkBgnJwa9q0Xm+zGP/jl
         36PQ==
X-Gm-Message-State: AOJu0YyrbXRPTEzBG1pXsyjqC/uOjxJbQjQ076T1mLwvo/+oEr0I2/XO
	ujf49xZbjP4CGs6KQSWtRXe8bg==
X-Google-Smtp-Source: AGHT+IGjrOzRLGIAOTmht6JuaNSBqDtY8M+pe8Qkwbo3Jiuc6tDyUK3jOHIGuyb1B9Ksb9yCjXgThA==
X-Received: by 2002:a05:600c:4f47:b0:405:34e4:14e3 with SMTP id m7-20020a05600c4f4700b0040534e414e3mr5528420wmq.3.1699897981019;
        Mon, 13 Nov 2023 09:53:01 -0800 (PST)
Date: Mon, 13 Nov 2023 18:53:00 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH] xen/x86: On x2APIC mode, derive LDR from APIC_ID
Message-ID: <ZVJifMqOR_3zINYZ@macbook.local>
References: <20231113165023.5824-1-alejandro.vallejo@cloud.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231113165023.5824-1-alejandro.vallejo@cloud.com>

On Mon, Nov 13, 2023 at 04:50:23PM +0000, Alejandro Vallejo wrote:
> Both Intel and AMD manuals agree that on x2APIC mode, the APIC LDR and ID
> registers are derivable from each other through a fixed formula.
> 
> Xen uses that formula, but applies it to vCPU IDs (which are sequential)
> rather than x2APIC_IDs (which are not, at the moment). As I understand it,
> this is an attempt to tightly pack vCPUs into clusters so each cluster has
> 16 vCPUs rather than 8, but this is problematic for OSs that might read the
> x2APIC_ID and internally derive LDR (or the other way around)

I would replace the underscore from x2APIC ID with a space instead.

Seeing the commit that introduced the bogus LDR value, I'm not sure it
was intentional, as previous Xen code had:

u32 id = vlapic_get_reg(vlapic, APIC_ID);
u32 ldr = ((id & ~0xf) << 16) | (1 << (id & 0xf));
vlapic_set_reg(vlapic, APIC_LDR, ldr);

Which was correct, as the LDR was derived from the APIC ID and not the
vCPU ID.

> This patch fixes the implementation so we follow the rules in the x2APIC
> spec(s).
> 
> While in the neighborhood, replace the u32 type with the standard uint32_t

Likely wants:

Fixes: f9e0cccf7b35 ('x86/HVM: fix ID handling of x2APIC emulation')

> Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>

I do wonder whether we need to take any precautions with guests being
able to trigger an APIC reset, and thus seeing a changed LDR register
if the guest happens to be migrated from an older hypervisor version
that doesn't have this fix.  IOW: I wonder whether Xen should keep the
previous bogus LDR value across APIC resets for guests that have
already seen it.

Thanks, Roger.

