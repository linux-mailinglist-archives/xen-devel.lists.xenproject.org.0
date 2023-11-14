Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 144CA7EAFBA
	for <lists+xen-devel@lfdr.de>; Tue, 14 Nov 2023 13:19:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.632351.986629 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2sNB-0001xc-9r; Tue, 14 Nov 2023 12:18:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 632351.986629; Tue, 14 Nov 2023 12:18:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2sNB-0001uO-6r; Tue, 14 Nov 2023 12:18:29 +0000
Received: by outflank-mailman (input) for mailman id 632351;
 Tue, 14 Nov 2023 12:18:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vqel=G3=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1r2sN9-0001uI-Sg
 for xen-devel@lists.xenproject.org; Tue, 14 Nov 2023 12:18:27 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e8e3ce07-82e7-11ee-98db-6d05b1d4d9a1;
 Tue, 14 Nov 2023 13:18:26 +0100 (CET)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-40842752c6eso45557365e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 14 Nov 2023 04:18:25 -0800 (PST)
Received: from EMEAENGAAD19049. (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 h9-20020a05600c350900b004094d4292aesm11272478wmq.18.2023.11.14.04.18.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Nov 2023 04:18:24 -0800 (PST)
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
X-Inumbo-ID: e8e3ce07-82e7-11ee-98db-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1699964305; x=1700569105; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:subject:cc:to:from:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=A85wZepMEi4zg8+KKhXoracYhZUvVUnNKrthvKCiGDE=;
        b=Zjlsv2ozN40ggMRpHFCgZchfcfnC9OrOeOYVaIRiwGa3Iq3uj/Qp+61PdgHoyCTuBF
         3ayE7y6QXivBSdaxqQcg2j6608jQMWR37L/tjyGjrtYrGny/z/oiAVXBBuFRDR6bgaBr
         sa2TDIRecsbKjUQ7KsambY0nLbAUcS8o+WhyY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699964305; x=1700569105;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:subject:cc:to:from:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=A85wZepMEi4zg8+KKhXoracYhZUvVUnNKrthvKCiGDE=;
        b=MU4pc1BwVljlPcWjQJNWg7J7xL7hXWk4VsdoODLYVYZTaKg4e4zRZcQHFVz8tNyXS0
         qTGgiu69NumhE6PtLlFdHWOiR8iT2Gcm3L7CAQuwnXd1p1CU+xXZRZqhOPUZzmjpQIVv
         yKica5MxP8xV33UWRQlzy8bD6qD9/JYEugZ7Aeg5aXg0+zLJO4SXAKLyJv3llKeT72eN
         LRbljmL2gLkzRaXCjAWbgK2yGFqcDas52bqhYQ2WMPqOFijnfqW6uwzhpxhPU+nCOC2M
         4xBpA2vnK4qjahIboPAPzHPfyNWpX42E49iTi3EXIGgsjfKf2tzsmMwDKju85M5teG4D
         /1NA==
X-Gm-Message-State: AOJu0YwHKaX/b/sxjsNj50LsgyX5em3mUNLKZnl7ZcegqvJ0aiu6zJ/q
	O8XECVZxnh5aDzm4ROl9Vcmgzg==
X-Google-Smtp-Source: AGHT+IGkG922mh2zAONqg8uiz7tEwvUfDdtnn+/WM/2+2Gjg6eqhVzbk8K1IFsDOA9U7HhNsFk6Qtg==
X-Received: by 2002:a05:600c:5493:b0:40a:4a7d:606b with SMTP id iv19-20020a05600c549300b0040a4a7d606bmr8090921wmb.40.1699964304752;
        Tue, 14 Nov 2023 04:18:24 -0800 (PST)
Message-ID: <65536590.050a0220.eb28a.617d@mx.google.com>
X-Google-Original-Message-ID: <ZVNljowDpefvYKZp@EMEAENGAAD19049.>
Date: Tue, 14 Nov 2023 12:18:22 +0000
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
	Xen-devel <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH] xen/x86: On x2APIC mode, derive LDR from APIC_ID
References: <20231113165023.5824-1-alejandro.vallejo@cloud.com>
 <ZVJifMqOR_3zINYZ@macbook.local>
 <5c4a237e-975d-f452-1261-f9fc10ef65c6@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5c4a237e-975d-f452-1261-f9fc10ef65c6@suse.com>

On Tue, Nov 14, 2023 at 11:14:22AM +0100, Jan Beulich wrote:
> On 13.11.2023 18:53, Roger Pau Monné wrote:
> > On Mon, Nov 13, 2023 at 04:50:23PM +0000, Alejandro Vallejo wrote:
> >> Both Intel and AMD manuals agree that on x2APIC mode, the APIC LDR and ID
> >> registers are derivable from each other through a fixed formula.
> >>
> >> Xen uses that formula, but applies it to vCPU IDs (which are sequential)
> >> rather than x2APIC_IDs (which are not, at the moment). As I understand it,
> >> this is an attempt to tightly pack vCPUs into clusters so each cluster has
> >> 16 vCPUs rather than 8, but this is problematic for OSs that might read the
> >> x2APIC_ID and internally derive LDR (or the other way around)
> > 
> > I would replace the underscore from x2APIC ID with a space instead.
> > 
> > Seeing the commit that introduced the bogus LDR value, I'm not sure it
> > was intentional,
> 
> Hard to reconstruct over 9 years later. It feels like Alejandro may be right
> with his derivation.
> 
> > as previous Xen code had:
> > 
> > u32 id = vlapic_get_reg(vlapic, APIC_ID);
> > u32 ldr = ((id & ~0xf) << 16) | (1 << (id & 0xf));
> > vlapic_set_reg(vlapic, APIC_LDR, ldr);
> > 
> > Which was correct, as the LDR was derived from the APIC ID and not the
> > vCPU ID.
> 
> Well, it gave the appearance of deriving from the APIC ID. Just that it was
> missing GET_xAPIC_ID() around the vlapic_get_reg() (hence why LDR was
> uniformly 1 on all CPUs).
> 
> >> This patch fixes the implementation so we follow the rules in the x2APIC
> >> spec(s).
> >>
> >> While in the neighborhood, replace the u32 type with the standard uint32_t
> > 
> > Likely wants:
> > 
> > Fixes: f9e0cccf7b35 ('x86/HVM: fix ID handling of x2APIC emulation')
> 
> +1
> 
> >> Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
> > 
> > I do wonder whether we need to take any precautions with guests being
> > able to trigger an APIC reset, and thus seeing a changed LDR register
> > if the guest happens to be migrated from an older hypervisor version
> > that doesn't have this fix.  IOW: I wonder whether Xen should keep the
> > previous bogus LDR value across APIC resets for guests that have
> > already seen it.
> 
> That earlier change deliberately fixed up any bogus values. I wonder
> whether what you suggest will do more good or more harm than going
> even farther and once again fixing up bad values in lapic_load_fixup().
> After all LDR being wrong affects vlapic_match_logical_addr()'s outcome.
> I think one of the two wants adding to the change, though.
> 
> Jan
You mean changing the LDR of a vCPU to the correct value on migrate? That
feels like playing with fire. A migrated VM is presumably a VM that is
running without issues (or it would have been rebooted). Letting it run
as it did seems safer.

I don't think vlapic_match_logical_addr() is affected. The LDR's are still
unique in the bogus case so the matching ought to work. Problem would arise
if the guest makes assumptions about APIC_ID and LDR relationships.

Cheers,
Alejandro

