Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A823286E0EC
	for <lists+xen-devel@lfdr.de>; Fri,  1 Mar 2024 13:12:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.687636.1071334 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rg1jy-0005Oi-8a; Fri, 01 Mar 2024 12:11:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 687636.1071334; Fri, 01 Mar 2024 12:11:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rg1jy-0005Mt-5N; Fri, 01 Mar 2024 12:11:50 +0000
Received: by outflank-mailman (input) for mailman id 687636;
 Fri, 01 Mar 2024 12:11:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jGsc=KH=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rg1jx-0005Mn-7g
 for xen-devel@lists.xenproject.org; Fri, 01 Mar 2024 12:11:49 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dfc25c0e-d7c4-11ee-a1ee-f123f15fe8a2;
 Fri, 01 Mar 2024 13:11:46 +0100 (CET)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-412bc3350d0so13712365e9.1
 for <xen-devel@lists.xenproject.org>; Fri, 01 Mar 2024 04:11:46 -0800 (PST)
Received: from localhost ([213.195.118.74]) by smtp.gmail.com with ESMTPSA id
 y16-20020a05600c365000b00412656ba919sm8127677wmq.20.2024.03.01.04.11.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Mar 2024 04:11:45 -0800 (PST)
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
X-Inumbo-ID: dfc25c0e-d7c4-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1709295106; x=1709899906; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KeCaJ4Swm1z+vkdsFd9E3WHBmp4+Reh3cJdm1Yf8fXU=;
        b=NBTpFk3PTlB1/HOAuQGxu5eblzudvB6gCrRl0cAYgIvM74y5BXBQ/AYvWwbAtEIIRP
         +FTAevGg5oXTne/e6s85CIZvQ4C5hx63DpaITRkjHV5Jiif+uzJNKTfwYVrnWqBPxlqY
         YqOKyIe+IN8i0X0ViDnlZqz2S28thJW33RbV4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709295106; x=1709899906;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KeCaJ4Swm1z+vkdsFd9E3WHBmp4+Reh3cJdm1Yf8fXU=;
        b=AjbMPREcr+FZv5GXR4aO788EuBf/uDWLPf/fwGIgesHhOX7XRaOI2xsC8YmYu3Mnz5
         tBUjmN0n/gdl5Rv5CFuH1olCW1IfkVgA8gkl4UPT860z6hyvarxyMaV5QaByN+imbhhJ
         BtnLCXmpeefnvLuvt7bbs60kzcNob4xe/1oxF4385F6S23swsvZbRxTyFktCozPhqfK8
         bnmhTtRbxehjmSuXMlWVlogapWqYvREgpWUcyfUcw8tk+hpaEbYD619zx9MNbZRPj0Gt
         ITjRQ4Fort80cpsmZjX56GHbRrwlsHVResGQj6xtVBYfbJi5v/iZUKzI4COpyjTBOf/h
         vnhg==
X-Gm-Message-State: AOJu0YyVgeSmQWW+lp08lcR7iSKSyDoy5F3yPnJnccAJC9Ckdnv7Na9l
	g0UO2T11xbCnnuP/LohWk1Ajb+79EQU8aDshaCVWMd4jZMa8C8nplMGfN6AsFDU=
X-Google-Smtp-Source: AGHT+IEghepjG29HVHqguR7pQ4KZUTRY3OdRCKv1tJX/d7dOiQ9gL/POk0uGR8+PUWwsb9jct3c9IQ==
X-Received: by 2002:a05:600c:154b:b0:412:a2c7:9d13 with SMTP id f11-20020a05600c154b00b00412a2c79d13mr1322308wmg.6.1709295105883;
        Fri, 01 Mar 2024 04:11:45 -0800 (PST)
Date: Fri, 1 Mar 2024 13:11:44 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Jan Beulich <JBeulich@suse.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH] x86/cpu-policy: Hide x2APIC from PV guests
Message-ID: <ZeHGAJfw0HLnkB0p@macbook>
References: <20240229221448.2593171-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240229221448.2593171-1-andrew.cooper3@citrix.com>

On Thu, Feb 29, 2024 at 10:14:48PM +0000, Andrew Cooper wrote:
> PV guests can't write to MSR_APIC_BASE (in order to set EXTD), nor can they
> access any of the x2APIC MSR range.  Therefore they mustn't see the x2APIC
> CPUID bit saying that they can.
> 
> Right now, the host x2APIC flag filters into PV guests, meaning that PV guests
> generally see x2APIC except on Zen1-and-older AMD systems.
> 
> Linux works around this by explicitly hiding the bit itself, and filtering
> EXTD out of MSR_APIC_BASE reads.  NetBSD behaves more in the spirit of PV
> guests, and entirely ignores the APIC when built as a PV guest.
> 
> Change the annotation from !A to !S.  This has a consequence of stripping it
> out of both PV featuremasks.  However, as existing guests may have seen the
> bit, set it back into the PV Max policy; a VM which saw the bit and is alive
> enough to migrate will have ignored it one way or another.
> 
> Hiding x2APIC does also change the contents of leaf 0xb, but as the
> information is nonsense to begin with, this is likely an improvement on the
> status quo.  The blind reporting of APIC_ID = vCPU_ID * 2 isn't interlinked
> with the host's topology structure, and the APIC_IDs are useless without an
> MADT to start with.

AFAICT the APIC ID in CPUID leaf 0x1 %ebx is only reported to HVM
guests, not PV ones (see the dynamic section of guest_cpuid()).  This
paragraph might need adjusting then, as it reads to me as if PV
guests could also expect APIC_ID == vCPU_ID * 2.

With this change no x{,2}APIC ID gets exposed in CPUID for PV guests
unless it's for compat reasons for guests that already saw the x2APIC
feature.

> Dom0 is the only PV VM to get an MADT but it's the host
> one, meaning the two sets of APIC_IDs are from different address spaces.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

