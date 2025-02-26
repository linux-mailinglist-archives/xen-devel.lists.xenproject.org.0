Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 39C52A46828
	for <lists+xen-devel@lfdr.de>; Wed, 26 Feb 2025 18:34:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.897139.1305857 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnLI9-0006PS-Iq; Wed, 26 Feb 2025 17:33:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 897139.1305857; Wed, 26 Feb 2025 17:33:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnLI9-0006Nu-Eu; Wed, 26 Feb 2025 17:33:53 +0000
Received: by outflank-mailman (input) for mailman id 897139;
 Wed, 26 Feb 2025 17:33:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=y9YQ=VR=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tnLI7-0006No-KJ
 for xen-devel@lists.xenproject.org; Wed, 26 Feb 2025 17:33:51 +0000
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [2a00:1450:4864:20::531])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d6b8f8d7-f467-11ef-9897-31a8f345e629;
 Wed, 26 Feb 2025 18:33:49 +0100 (CET)
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-5e058ca6806so12498770a12.3
 for <xen-devel@lists.xenproject.org>; Wed, 26 Feb 2025 09:33:49 -0800 (PST)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-abed205c28asm359206166b.158.2025.02.26.09.33.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Feb 2025 09:33:48 -0800 (PST)
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
X-Inumbo-ID: d6b8f8d7-f467-11ef-9897-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1740591229; x=1741196029; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=lSGItwYuz0Wxc+Oa5Ba7YQeYE+6xEHm4QVjsv41Uh9Q=;
        b=vUQIs28UvNWcx7YX80ZrEn5RQL17/MSNjiI8M9c/fEA4i92abePD7y3+bOT872HByM
         kZCfmKkKbS9HGjQK4Ju4oyqfSaEhFNN2MLQjpsflnqx3JDXT5T8TwYurq/DtJESwNiVw
         IwT5+BI4w3pdcsYHtRWlz5UHbfEnKmFCCmQHA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740591229; x=1741196029;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lSGItwYuz0Wxc+Oa5Ba7YQeYE+6xEHm4QVjsv41Uh9Q=;
        b=UDmzJA+4QT8jCGLOgzVBCn2zNwBfuhnZK79vAsiMTxBfnMq/YeyO9pUJDsaRwG5Dbu
         qT+YdpR+D3xREcP7oVO0eFbdp6fFCvDmJnS/C4FgfGltjga9W+JOJPHx6/WXgJw3nxYa
         fxTjAjag95UenTzm+bpJMe/V2sVpZjivPFhuKo9hgauRO1Uu2lPAWd+u64SSEiSHrs64
         f7YKDErP2QO1lO35b87Kk0UGtH/xk1djHR6vsYBVMooKkkcis+74dZp7SR2w/N5N6Iru
         0ztv7jnJGydSA1FjGg/klDGbC8T+ZZChHdL2Zxx+UYw3KK0qiDuZkjnuk5/NEtQGyUs5
         g6bw==
X-Forwarded-Encrypted: i=1; AJvYcCU763CuA4blPopj/jeV3zKbWPe8eJqt0OGOXmlJAy4VFbn6vIvmRIO9QwVA999DyXIPza21IduPh1Q=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzqJfi+G/94a/cgfOmgpm58sqSdrlFBPhiGkK+pOaTk9z5fGhjp
	RWv4V4DYRAhFm1OUCRUdRM85JeFtYqHvowynSDlAITGwrzZLLU8i/oLvbkQZous=
X-Gm-Gg: ASbGnctoHZKW/x3SUop2Swe8H5Wu4aEpS2TRx2CfXXa5VOOavOl2j2n+oR8fe20GBcg
	OZNDAHzqYfQR7Tk8L6Ytqf7b2NsOUTbY4o1mlsmvCXMfnYtejQfcSbYIcnMTaubxjioVGe+mjja
	IY6dOq2MLsHOARW+VW1Bq/S7xNJ2Gqh4v0dVeeouH37QjZNCcWjl0VyUZn2zni7eYDTWxOu1/8z
	kcgn5H3GgvRdVYbeYIrg04VAW5SKmgkbiGZ5fpdbhRBDPXhipxq7RRrUaNLisnaJuS2So5oeOl1
	ZGi9WmdCSZ9b9wVru9IWT3tEugC9nuo=
X-Google-Smtp-Source: AGHT+IEscmj+MtBFOmmTx/kGSl2zk/sVjiafmN6npf1fQ3uNSKpQ+ujnJGQ4t5V/RL8Mgi5gtZ5mUA==
X-Received: by 2002:a17:906:6a04:b0:ab7:db5d:44ea with SMTP id a640c23a62f3a-abc0da391f0mr2306317066b.27.1740591228828;
        Wed, 26 Feb 2025 09:33:48 -0800 (PST)
Date: Wed, 26 Feb 2025 18:33:47 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH] x86/hvm: Add APIC IDs to the per-vLAPIC save area
Message-ID: <Z79Qe3kMS18P6JNQ@macbook.local>
References: <20250218142259.6697-1-alejandro.vallejo@cloud.com>
 <1de43f95-5ed1-46c1-a157-094ceb84ac83@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1de43f95-5ed1-46c1-a157-094ceb84ac83@suse.com>

On Wed, Feb 26, 2025 at 02:11:23PM +0100, Jan Beulich wrote:
> On 18.02.2025 15:22, Alejandro Vallejo wrote:
> > Today, Xen hardcodes apic_id = vcpu_id * 2, but this is unwise and
> > interferes with providing accurate topology information to the guest.
> > 
> > Introduce a new x2apic_id field into hvm_hw_lapic.  This is immutable
> > state from the guest's point of view, but it will allow the toolstack to
> > eventually configure the value, and for the value to move on migrate.
> > 
> > For backwards compatibility, the patch rebuilds the old-style APIC IDs
> > from migration streams lacking them when they aren't present.
> 
> Nit: "when they aren't present" looks to duplicate "lacking them"?
> 
> > Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
> > ---
> > I've split this one from the rest of the topology series as it's independent
> > and entangled with another patch from Andrew.
> 
> Albeit I think meanwhile we've settled that the entangling isn't quite as
> problematic.
> 
> > @@ -1621,6 +1624,14 @@ static int cf_check lapic_load_hidden(struct domain *d, hvm_domain_context_t *h)
> >          return -EINVAL;
> >      }
> >  
> > +    /*
> > +     * Xen 4.20 and earlier had no x2APIC ID in the migration stream and
> > +     * hard-coded "vcpu_id * 2". Default back to this if we have a
> > +     * zero-extended record.
> > +     */
> > +    if ( h->size <= offsetof(struct hvm_hw_lapic, x2apic_id) )
> > +        s->hw.x2apic_id = v->vcpu_id * 2;
> 
> While we better wouldn't get to see such input, it is in principle possible
> to have an input stream with, say, half the field. Imo the condition ought
> to be such that we'd make the adjustment when less than the full field is
> available.

I would add an additional check to ensure _rsvd0 remains 0, to avoid
further additions from attempting to reuse that padding space.

if ( s->hw._rsvd0 )
    return -EINVAL;

In fact I would be tempted to overwrite the ID if the stream size
doesn't match the expected one, ie:

if ( h->size < (offsetof(struct hvm_hw_lapic, _rsvd0) +
                sizeof(s->hw._rsvd0)) )
    s->hw.x2apic_id = v->vcpu_id * 2;

Regards, Roger.

