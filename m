Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 691BF8616B0
	for <lists+xen-devel@lfdr.de>; Fri, 23 Feb 2024 17:01:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.684907.1065138 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rdXy1-00041P-RZ; Fri, 23 Feb 2024 16:00:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 684907.1065138; Fri, 23 Feb 2024 16:00:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rdXy1-0003xt-OS; Fri, 23 Feb 2024 16:00:05 +0000
Received: by outflank-mailman (input) for mailman id 684907;
 Fri, 23 Feb 2024 16:00:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SHka=KA=cloud.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1rdXxz-0003aU-TD
 for xen-devel@lists.xenproject.org; Fri, 23 Feb 2024 16:00:03 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 99008269-d264-11ee-98f5-efadbce2ee36;
 Fri, 23 Feb 2024 17:00:01 +0100 (CET)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-a3566c0309fso75053266b.1
 for <xen-devel@lists.xenproject.org>; Fri, 23 Feb 2024 08:00:00 -0800 (PST)
Received: from perard.uk.xensource.com (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 ot18-20020a170906ccd200b00a3ecdd0ba23sm4413236ejb.52.2024.02.23.07.59.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Feb 2024 07:59:59 -0800 (PST)
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
X-Inumbo-ID: 99008269-d264-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1708704000; x=1709308800; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ssD+CzyXnBVEZMfxZkqRKLy8uXBrLLZsUTuV+Jfdq+Q=;
        b=ZZ0drDS0FcI7FYtXwRm7dPqBLA5vx7xO63L4w1MBf5EECxBQGieXy3D3y9e3GizlfQ
         yADfwzuOS09Da2PnZJNb1PnkIyTXEDM3mRZVnvjF9nIJeiXGXLd6fUF5RfFVokHnkFwA
         KqR73xwmCo8oX0nktdlBdjIbotB1ts/syEPS8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708704000; x=1709308800;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ssD+CzyXnBVEZMfxZkqRKLy8uXBrLLZsUTuV+Jfdq+Q=;
        b=NsgQSK/lIyuej7XZqD7OjEJ843S6+BA+X9LQlrebTFEjUgXAmuk0G4jRDex0AILrW3
         CAjHdVpsRvLxROPfD7vvx+rSw4cQ/ivkesd0ujjfz4Zb+GwzT9SdG1dkw/8L/NTl1pWQ
         GzN/izWC3HOzqR9fFH+Za3+9ARH9QDE6RcfLI7uIX8e/f4nu+BjrekFEDDmLAivii7+J
         lrfD0AeuugUwR9BwzJfs8k3Bt7Fe6/N0Kq1YhZ/9V7zG8b2OlinpRtbPwKz9bEu4a7Lj
         tULl3PZJtmcKYMTURvUG4PxrOJPGvCZKUX8+8GNXCGnS86FhTHkLL7zFHjpAoEu5UKUe
         HUtA==
X-Gm-Message-State: AOJu0YwiXOyDXcs3WVuP5qZ+y79TY6aP12h5UjNaDDWx985DoI6Zm+UJ
	bN25pW8bo0SSxHvnfgZVaAMORZpSjJIlXCWyqiE5x3fEdo75JekEbV8eweLHZsI=
X-Google-Smtp-Source: AGHT+IGDivtW5FFVIARkidjXJCZPcfL03/nDJKsjOPlYFct8cLuj+JWf7/f5xD/A5xhykCulpHYc6g==
X-Received: by 2002:a17:906:4809:b0:a3f:988f:b9c4 with SMTP id w9-20020a170906480900b00a3f988fb9c4mr168559ejq.7.1708703999672;
        Fri, 23 Feb 2024 07:59:59 -0800 (PST)
Date: Fri, 23 Feb 2024 15:59:58 +0000
From: Anthony PERARD <anthony.perard@cloud.com>
To: "Chen, Jiqian" <Jiqian.Chen@amd.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Juergen Gross <jgross@suse.com>,
	"Daniel P . Smith" <dpsmith@apertussolutions.com>,
	"Hildebrand, Stewart" <Stewart.Hildebrand@amd.com>,
	"Huang, Ray" <Ray.Huang@amd.com>
Subject: Re: [RFC XEN PATCH v5 5/5] domctl: Add XEN_DOMCTL_gsi_permission to
 grant gsi
Message-ID: <d0adfc76-5142-46b1-acaa-3a4f0331cfb0@perard>
References: <20240112061317.418658-1-Jiqian.Chen@amd.com>
 <20240112061317.418658-6-Jiqian.Chen@amd.com>
 <09290ba4-6915-4f0d-8e16-3e14713d02ba@perard>
 <BL1PR12MB5849F3787ED9245E6986872CE7562@BL1PR12MB5849.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <BL1PR12MB5849F3787ED9245E6986872CE7562@BL1PR12MB5849.namprd12.prod.outlook.com>

On Thu, Feb 22, 2024 at 07:22:45AM +0000, Chen, Jiqian wrote:
> On 2024/2/21 23:03, Anthony PERARD wrote:
> > On Fri, Jan 12, 2024 at 02:13:17PM +0800, Jiqian Chen wrote:
> >> diff --git a/tools/libs/light/libxl_pci.c b/tools/libs/light/libxl_pci.c
> >> index a1c6e82631e9..4136a860a048 100644
> >> --- a/tools/libs/light/libxl_pci.c
> >> +++ b/tools/libs/light/libxl_pci.c
> >> @@ -1421,6 +1421,8 @@ static void pci_add_dm_done(libxl__egc *egc,
> >>      uint32_t flag = XEN_DOMCTL_DEV_RDM_RELAXED;
> >>      uint32_t domainid = domid;
> >>      bool isstubdom = libxl_is_stubdom(ctx, domid, &domainid);
> >> +    int gsi;
> >> +    bool has_gsi = true;
> > 
> > Why is this function has "gsi" variable, and "gsi = irq" but the next
> > function pci_remove_detached() does only have "irq" variable?
> Because in pci_add_dm_done, it calls " r = xc_physdev_map_pirq(ctx->xch, domid, irq, &irq); ", it passes the pointer of irq in, and then irq will be changed, so I need to use gsi to save the origin value.

I'm sorry but unconditional "gsi = irq" looks very wrong, that line
needs to be removed or changed, otherwise we have two functions doing the
same thing just after that (xc_domain_irq_permission and
xc_domain_gsi_permission). Instead, my guess is that the
arguments of xc_physdev_map_pirq() needs to be changes. What does
contain `irq` after the map_pirq() call? A "pirq" of some kind? Maybe
xc_physdev_map_pirq(ctx->xch, domid, irq, &pirq) would make things more
clear about what's going on.


And BTW, maybe renaming the variable "has_gsi" to "is_gsi" might make
things a bit clearer as well, as in: "the variable 'irq' $is_gsi",
instead of a variable that have a meaning of "the system $has_gsi"
without necessarily meaning that the code is using it.

Maybe using (abusing?) the variable name "irq" might be a bit wrong now?
What does "GSI" stand for anyway? And about "PIRQ"? This is just some
question to figure out if there's potentially a better name for the
variables names.

Thanks,

-- 
Anthony PERARD

