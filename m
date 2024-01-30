Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 231DB842472
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jan 2024 13:07:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.673323.1047665 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rUmt4-0003dO-Ru; Tue, 30 Jan 2024 12:06:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 673323.1047665; Tue, 30 Jan 2024 12:06:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rUmt4-0003bB-Ob; Tue, 30 Jan 2024 12:06:46 +0000
Received: by outflank-mailman (input) for mailman id 673323;
 Tue, 30 Jan 2024 12:06:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BUgQ=JI=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rUmt2-0003b5-TK
 for xen-devel@lists.xenproject.org; Tue, 30 Jan 2024 12:06:44 +0000
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [2a00:1450:4864:20::42b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 08b6bd93-bf68-11ee-8a43-1f161083a0e0;
 Tue, 30 Jan 2024 13:06:44 +0100 (CET)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-33aed096cb3so1602010f8f.1
 for <xen-devel@lists.xenproject.org>; Tue, 30 Jan 2024 04:06:44 -0800 (PST)
Received: from localhost ([213.195.118.74]) by smtp.gmail.com with ESMTPSA id
 bo18-20020a056000069200b0033af3aec393sm3914520wrb.38.2024.01.30.04.06.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Jan 2024 04:06:43 -0800 (PST)
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
X-Inumbo-ID: 08b6bd93-bf68-11ee-8a43-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1706616403; x=1707221203; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7m85dVzbU8iANeNtEMmS+YgaRBXjdd5oQwbqmRL7bXc=;
        b=SFN4RnD24byr4l4jVHGV843FWQ9JXc4LnmvCqXozvbQgiFPPm3gX99itW68fCoS3Bh
         jPcl/M7NEMsCWA2kzNjRVBBQ3StWCBrt4g18Vd5hhZv7BtjeJIJJRwShX+vr2um1tyiU
         w80iedVfUaJgrh/2xoTpgViMWE0dgWDEaM0H8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706616403; x=1707221203;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7m85dVzbU8iANeNtEMmS+YgaRBXjdd5oQwbqmRL7bXc=;
        b=OGn8lCB3IYRgHxfMYccYQ0iT8cd0IuNpmuvMl94ernoNSgr8RuQI7w2U0CyBpRATXV
         mEc1dWjJjDrbZqHP+X54pFynpO0O0UssXZbGvm146svTN1q5L7BPtnmaJe9BO4LAXskM
         b98D86yEWeyMJWf9Fy+0hGLTCWNLEh5L1TwCu74FuTO5bmhuwTym4Iubla1CiRO95PuR
         5D17r7W4ShK769MRkMvl9EA+aRIvAaD99DEvPqYRZb6pgsLbdsneIhM2yZqpaNsDO9sC
         eadI4OHEV5Xlz4HmV1qL2E7D0f0+w5QRXSfnIQVjmOvATmF4KoOXjQ008EXI4KQWAjvz
         ZCKg==
X-Gm-Message-State: AOJu0YwAs1wBpTUU10GL2uCCo7KWU+e/CdsGeA9vhQ1ddQ7ohBpp9Buy
	7pekMba4oR0J2FzIGXpvEIds0xqyjQrOJKTW2dcXH+dI2IiBpgck0u29l0Lu5XU=
X-Google-Smtp-Source: AGHT+IGXcyvLZh0eeKA7sQJqXqfZL1s3iLlLlIjhMrmKTFSpcsCBoXY3FsnX9GjqYBedp8z+mlRZ1Q==
X-Received: by 2002:adf:e58b:0:b0:337:c5ef:3d2c with SMTP id l11-20020adfe58b000000b00337c5ef3d2cmr5820442wrm.61.1706616403439;
        Tue, 30 Jan 2024 04:06:43 -0800 (PST)
Date: Tue, 30 Jan 2024 13:06:35 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH 1/3] x86/intel: expose IPRED_CTRL to guests
Message-ID: <ZbjmS2oLAV7Fyqdn@macbook>
References: <20240130091400.50622-1-roger.pau@citrix.com>
 <20240130091400.50622-2-roger.pau@citrix.com>
 <3959f556-6177-473e-a052-bec11b5a8a9b@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <3959f556-6177-473e-a052-bec11b5a8a9b@suse.com>

On Tue, Jan 30, 2024 at 11:57:17AM +0100, Jan Beulich wrote:
> On 30.01.2024 10:13, Roger Pau Monne wrote:
> > The CPUID feature bit signals the presence of the IPRED_DIS_{U,S} controls in
> > SPEC_CTRL MSR.
> > 
> > Note that those controls are not used by the hypervisor.
> 
> Despite this, ...
> 
> > --- a/xen/arch/x86/msr.c
> > +++ b/xen/arch/x86/msr.c
> > @@ -324,6 +324,9 @@ uint64_t msr_spec_ctrl_valid_bits(const struct cpu_policy *cp)
> >      return (SPEC_CTRL_IBRS | SPEC_CTRL_STIBP |
> >              (ssbd       ? SPEC_CTRL_SSBD       : 0) |
> >              (psfd       ? SPEC_CTRL_PSFD       : 0) |
> > +            (cp->feat.ipred_ctrl ? (SPEC_CTRL_IPRED_DIS_U |
> > +                                    SPEC_CTRL_IPRED_DIS_S)
> > +                                 : 0) |
> >              0);
> >  }
> 
> ... if I'm not mistaken exposing SPEC_CTRL bits to guests is independent
> of whether we write SPEC_CTRL on entry to Xen. Therefore I think in the
> description it wants clarifying why it is acceptable to run Xen with the
> guest chosen settings for at least the DIS_S bit (assuming that it is
> okay to do so). Likely (didn't look there yet) also applicable to the
> further two patches.

"The added feature is made dependent on IBRSB, which ensures it will
only be exposed if X86_FEATURE_SC_MSR_{PV,HVM} is available, and that
ensures the value of SPEC_CTRL will get context switched on exit/entry
to guest."

Would adding the above to the commit message clarify the intended
implementation?

Thanks, Roger.

