Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E138A3DEE6
	for <lists+xen-devel@lfdr.de>; Thu, 20 Feb 2025 16:41:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.893928.1302759 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tl8f6-0007sy-UT; Thu, 20 Feb 2025 15:40:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 893928.1302759; Thu, 20 Feb 2025 15:40:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tl8f6-0007pq-RU; Thu, 20 Feb 2025 15:40:28 +0000
Received: by outflank-mailman (input) for mailman id 893928;
 Thu, 20 Feb 2025 15:40:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ie4y=VL=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tl8f5-0007pk-NA
 for xen-devel@lists.xenproject.org; Thu, 20 Feb 2025 15:40:27 +0000
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [2a00:1450:4864:20::62b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 00cc7603-efa1-11ef-9896-31a8f345e629;
 Thu, 20 Feb 2025 16:40:25 +0100 (CET)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-aaec111762bso251222366b.2
 for <xen-devel@lists.xenproject.org>; Thu, 20 Feb 2025 07:40:25 -0800 (PST)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5dece1b4f65sm12131691a12.1.2025.02.20.07.40.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Feb 2025 07:40:24 -0800 (PST)
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
X-Inumbo-ID: 00cc7603-efa1-11ef-9896-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1740066025; x=1740670825; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=sdgyXCr1hHcqc7GsSF4OVz+yiKke1Nv8FkisuZeiiuo=;
        b=KJTuS/igV1hD/DKyGOAtZ7ZJn4jAqC1NbLu1cD4FUBJv6tAdEvfEmrcQdK51pFVoKM
         u/uzz4x+XCxol/1LBcWScnRbHnE3V6L5+4jqAQ8pc9kd7y2JcCsRnhJVqbyD7iaIqJyF
         LL0CgcdDMW8RjgK/97SbDhYu770zvA6Z3q9lw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740066025; x=1740670825;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sdgyXCr1hHcqc7GsSF4OVz+yiKke1Nv8FkisuZeiiuo=;
        b=jXYmpGLzfVZsFm2qBGSINLzZTfJZl3HduHqAk6Zx5QnVNhckhFwwp1MPKBpvXmBL6v
         /bqFPyH1YUFckkxWMYK6egCnjV04EnFxBlWsTi/xWeAB9kjwXTKv1Netlhe/jQNQ5S+y
         vF384Bbh+TiZKYdaiqyl9jgdIKW41OsUKUuoWcyV6Da/3Lq5qAVm+/o5HnU+WadvJLn+
         y6Rd7UE7Osl30oj/mJjJegJMf2J7NcIdJjS0/EAEWSfidu94nNARiPeRSOigOLgOMenI
         iExPJcKXAkgwFrsynHFw7I6r+RmM3hb27//KqufED8oAxVzE/xC6dNP//eT3peONlNBS
         QjxQ==
X-Forwarded-Encrypted: i=1; AJvYcCWeyH3Xvavkr8YCkOSykGSyloxm0U99uftxv1q/8OQFDoib6wNvaF+3PMy8SeOAHt7tyrzojvGRdzk=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz6tkPyV4jnFFtn0sVkAraqPfZ4kRRHZVFWXxlwFqPVUnS11gj6
	S9IYvo01M7cNau+v8hCreFgm4LwkhrXN9iyueMmVfHG276kppD0WyxeLQEj5FOw=
X-Gm-Gg: ASbGncvRd1pt+AIAyT49annD5wI3JVPOl29VD86TWLNcBNpGMEFzmH48M/CgnXleTJr
	jQPmFpbHwMPy+Ev29uhTOj4hQJlzc/LdojHXlC8h+5A/6DE+PTOofJgnxAYe2AnjI2CNuUo0Qgt
	HFy9mhJoRiXejGxFdAADel6Bp3M8P8mxa5rKW7wKEUWFTTH6eSGkSTujkLks9g8P1rcY+uUhd+b
	p/1jbcxnr8VVX0wCXlZ//aorpfAjTWv15KZv4kqHZQoF49ngvLkGwsXdO7C3txb3zA2aJWzHBKI
	sIz00JQjhWYQwpCMdPWE
X-Google-Smtp-Source: AGHT+IFgtBZCrX35e6FLe6pWtLnj6onpFKDPnRDw5XJ+aaUA7DVOEv0dEG3SOyq0cfMD25Y0OxEobQ==
X-Received: by 2002:a17:907:9717:b0:abb:c647:a4bf with SMTP id a640c23a62f3a-abbcce890a2mr724334866b.23.1740066024856;
        Thu, 20 Feb 2025 07:40:24 -0800 (PST)
Date: Thu, 20 Feb 2025 16:40:23 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v3 3/3] x86/dom0: be less restrictive with the Interrupt
 Address Range
Message-ID: <Z7dM5_X4OEHk5gn1@macbook.local>
References: <20250219164840.94803-1-roger.pau@citrix.com>
 <20250219164840.94803-4-roger.pau@citrix.com>
 <1e8ef6d3-09db-4d53-b7c8-4b10a7f5d8f0@suse.com>
 <Z7buBc4yLtf-UpmB@macbook.local>
 <c8ce79c1-0d8a-45b3-868a-2b67b05d6aee@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c8ce79c1-0d8a-45b3-868a-2b67b05d6aee@suse.com>

On Thu, Feb 20, 2025 at 02:30:38PM +0100, Jan Beulich wrote:
> On 20.02.2025 09:55, Roger Pau Monné wrote:
> > On Thu, Feb 20, 2025 at 09:33:46AM +0100, Jan Beulich wrote:
> >> On 19.02.2025 17:48, Roger Pau Monne wrote:
> >>> Note that the restriction to map the local APIC page is enforced
> >>> separately, and that continues to be present.  Additionally make sure the
> >>> emulated local APIC page is also not mapped, in case dom0 is using it.
> >>
> >> But that's in GFN space, not in MFN one. Why would that matter for iomem_caps?
> > 
> > It's required to avoid arch_iommu_hwdom_init() creating an identity
> > mapping for APIC_DEFAULT_PHYS_BASE, which would prevent the local APIC
> > emulation from being used.
> 
> Hmm, yes, on one hand such a mapping would be created by default, as we
> default to "dom0-iommu=map-reserved". Otoh that mapping would be replaced
> before Dom0 is actually started, via the domain_creation_finished() hook.
> On (modern) VMX that is. So yes, on old VMX and on SVM the slot would need
> to remain unpopulated. Otoh, when the physical LAPICs are elsewhere and
> when the domain is in x2APIC mode, there would be no reason to disallow
> Dom0 access to that page.

Right, but that's now how dom0 is started ATM, as the local APIC is
unconditionally started in xAPIC mode and at APIC_DEFAULT_PHYS_BASE.

I could use vlapic_base_address() against vCPU#0 vlapic, but even in
guest_wrmsr_apic_base() we don't allow moving the local APIC MMIO
region, and hence I assumed it was fine to just use
APIC_DEFAULT_PHYS_BASE here.  Note in pvh_setup_acpi_madt() Xen also
hardcodes the local APIC address to APIC_DEFAULT_PHYS_BASE.

Would you be fine if I expand the comment so it's:

    /* If using an emulated local APIC make sure its MMIO is unpopulated. */
    if ( has_vlapic(d) )
    {
        /* Xen doesn't allow changing the local APIC MMIO window position. */
        mfn = paddr_to_pfn(APIC_DEFAULT_PHYS_BASE);
        rc |= iomem_deny_access(d, mfn, mfn);
    }

> That would apparently mean fiddling with
> iomem_caps once all vCPU-s have entered x2APIC mode.

Urg, that seems ugly.  It would also need undoing if the APICs are
reverted to xAPIC mode?

> With LAPICs not
> normally being elsewhere, question is whether this corner case actually
> needs dealing with. Yet even if not, commentary may want extending, just
> to make clear the case was considered?

As said above, for both HVM and PVH Xen doesn't allow moving the APIC
MMIO window to anything different than APIC_DEFAULT_PHYS_BASE.

Thanks, Roger.

