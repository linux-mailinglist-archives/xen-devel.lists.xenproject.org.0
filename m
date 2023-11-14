Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 985767EAFA5
	for <lists+xen-devel@lfdr.de>; Tue, 14 Nov 2023 13:10:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.632348.986619 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2sEx-0007Wf-FB; Tue, 14 Nov 2023 12:09:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 632348.986619; Tue, 14 Nov 2023 12:09:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2sEx-0007UB-Bs; Tue, 14 Nov 2023 12:09:59 +0000
Received: by outflank-mailman (input) for mailman id 632348;
 Tue, 14 Nov 2023 12:09:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vqel=G3=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1r2sEv-0007Tm-KP
 for xen-devel@lists.xenproject.org; Tue, 14 Nov 2023 12:09:57 +0000
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
 [209.85.221.42]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b904e2d7-82e6-11ee-9b0e-b553b5be7939;
 Tue, 14 Nov 2023 13:09:55 +0100 (CET)
Received: by mail-wr1-f42.google.com with SMTP id
 ffacd0b85a97d-32f737deedfso3398473f8f.3
 for <xen-devel@lists.xenproject.org>; Tue, 14 Nov 2023 04:09:55 -0800 (PST)
Received: from EMEAENGAAD19049. (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 b11-20020a05600010cb00b0032f9688ea48sm7685833wrx.10.2023.11.14.04.09.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Nov 2023 04:09:50 -0800 (PST)
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
X-Inumbo-ID: b904e2d7-82e6-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1699963791; x=1700568591; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:subject:cc:to:from:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1kHAfFfjtZjoZTk/4MlvWzgWmmeyACOraV2u09MQDWM=;
        b=gdYsbN41P7e1U6PrCZRfkfN8GF4HTlkk6csN8fHPC3T3h5ZizAmi4PkNgNjyBdtDP7
         kq0188hiYxZsplVDv/vZg2YgU8j7lHESaUpwdFXfpqib4AfkXfgAcsHi1Zj3jY5EgMq4
         4YEQXRc54VHBjmh2zunMDXgHXdE0HiB3mXPfo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699963791; x=1700568591;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:subject:cc:to:from:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1kHAfFfjtZjoZTk/4MlvWzgWmmeyACOraV2u09MQDWM=;
        b=WasEJN8SHKWUUpqFjetj6o+p8jfjPIQUw9ICbjpQxzmi60OhkgIcpBpFpBw43TG67O
         THRlROWLxZDkp+DIAGeg8NsX7WRJ+CmzKBl3i7LOKVsixK8G++/YDgSjpjSCeR69Ho/i
         SDhCFHtP4H+ADkbWOt3xxAU8ivxylXcgQPms9x7WzMp6mBKoEOiJNHSdPVK24r6Zt0Bm
         8+uJ9XJJzntJwvmSA/+p2PO4OOBP6Ve7sSPQSBkmAajGGqRPUJegfG6GZzhseQXL4MPP
         yJfoghWbqtTEKvlTK7Vd/1q9YWBZCbX7scfOIyKTs3M7zYbtjWNpNBYA8lCcWVmweR9l
         g+RA==
X-Gm-Message-State: AOJu0Yy/1P3phlVG+Hvl/iemvGmcg/ET5vez9siKVGIkItJYHGrWtuKv
	6QtDfm9UPSRtObDvvffn+a74IQ==
X-Google-Smtp-Source: AGHT+IF+z6KJBxar28FR4O08n0+Mitcaf0SSpflB/XP7NCxSTZ0tZgxkxk2D9C7QNY5JKMScsMV/Eg==
X-Received: by 2002:a5d:47ce:0:b0:32f:8248:e00 with SMTP id o14-20020a5d47ce000000b0032f82480e00mr8166806wrc.51.1699963790940;
        Tue, 14 Nov 2023 04:09:50 -0800 (PST)
Message-ID: <6553638e.050a0220.6d36e.9962@mx.google.com>
X-Google-Original-Message-ID: <ZVNjjBnRkBwFFFHP@EMEAENGAAD19049.>
Date: Tue, 14 Nov 2023 12:09:48 +0000
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH] xen/x86: On x2APIC mode, derive LDR from APIC_ID
References: <20231113165023.5824-1-alejandro.vallejo@cloud.com>
 <ZVJifMqOR_3zINYZ@macbook.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZVJifMqOR_3zINYZ@macbook.local>

On Mon, Nov 13, 2023 at 06:53:00PM +0100, Roger Pau Monné wrote:
> On Mon, Nov 13, 2023 at 04:50:23PM +0000, Alejandro Vallejo wrote:
> > Both Intel and AMD manuals agree that on x2APIC mode, the APIC LDR and ID
> > registers are derivable from each other through a fixed formula.
> > 
> > Xen uses that formula, but applies it to vCPU IDs (which are sequential)
> > rather than x2APIC_IDs (which are not, at the moment). As I understand it,
> > this is an attempt to tightly pack vCPUs into clusters so each cluster has
> > 16 vCPUs rather than 8, but this is problematic for OSs that might read the
> > x2APIC_ID and internally derive LDR (or the other way around)
> 
> I would replace the underscore from x2APIC ID with a space instead.
Sure
> 
> Seeing the commit that introduced the bogus LDR value, I'm not sure it
> was intentional, as previous Xen code had:
> 
> u32 id = vlapic_get_reg(vlapic, APIC_ID);
> u32 ldr = ((id & ~0xf) << 16) | (1 << (id & 0xf));
> vlapic_set_reg(vlapic, APIC_LDR, ldr);
> 
> Which was correct, as the LDR was derived from the APIC ID and not the
> vCPU ID.
I can rephrase the commit message to state the clustering difference in a
way that doesn't speculate about the previous code intent. It way many
years ago and it doesn't matter terribly.
> 
> > This patch fixes the implementation so we follow the rules in the x2APIC
> > spec(s).
> > 
> > While in the neighborhood, replace the u32 type with the standard uint32_t
> 
> Likely wants:
> 
> Fixes: f9e0cccf7b35 ('x86/HVM: fix ID handling of x2APIC emulation')
Sure

> 
> > Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
> 
> I do wonder whether we need to take any precautions with guests being
> able to trigger an APIC reset, and thus seeing a changed LDR register
> if the guest happens to be migrated from an older hypervisor version
> that doesn't have this fix.  IOW: I wonder whether Xen should keep the
> previous bogus LDR value across APIC resets for guests that have
> already seen it.
> 
> Thanks, Roger.
I could do that, but the fix would not be trivial. It would have to wait
for another series I'm working on that extends the CPU policy, because we'd
have to stash the initial x2APIC LDR of each vCPU on the migrate stream.
The question becomes whether there's value in preserving those LDRs, and of
that I'm not very sure.

In particular, I'm not sure how the guests might behave here. Keeping the
broken LDR could both maake things better or worse. Or better for some and
worse for others.

From a purely pragmatic point of view, in the absence of a clear advantage
I'd rather take the path of least resistence and let nature take its
course. Otherwise, I'll just stash this patch in my topology series as it
would need to be added after the migration logic is in place.

Cheers,
Alejandro

