Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CDFEACB6F9
	for <lists+xen-devel@lfdr.de>; Mon,  2 Jun 2025 17:23:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1003593.1383177 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uM70I-0001rw-M3; Mon, 02 Jun 2025 15:23:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1003593.1383177; Mon, 02 Jun 2025 15:23:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uM70I-0001px-HV; Mon, 02 Jun 2025 15:23:10 +0000
Received: by outflank-mailman (input) for mailman id 1003593;
 Mon, 02 Jun 2025 15:23:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TnRc=YR=gmail.com=edgar.iglesias@srs-se1.protection.inumbo.net>)
 id 1uM70G-0001p9-9r
 for xen-devel@lists.xenproject.org; Mon, 02 Jun 2025 15:23:08 +0000
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [2a00:1450:4864:20::22f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7bd82d18-3fc5-11f0-a300-13f23c93f187;
 Mon, 02 Jun 2025 17:23:06 +0200 (CEST)
Received: by mail-lj1-x22f.google.com with SMTP id
 38308e7fff4ca-32a6f5cb6f9so22596151fa.2
 for <xen-devel@lists.xenproject.org>; Mon, 02 Jun 2025 08:23:06 -0700 (PDT)
Received: from gmail.com (213-67-3-247-no600.tbcn.telia.com. [213.67.3.247])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-32a85b337absm15211891fa.26.2025.06.02.08.23.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Jun 2025 08:23:05 -0700 (PDT)
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
X-Inumbo-ID: 7bd82d18-3fc5-11f0-a300-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748877786; x=1749482586; darn=lists.xenproject.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5F5eVUrYkyhLcTB2TJWM26UTa/yIJkoh7wyIMTrpq3s=;
        b=Sa0NciF33VF5cYIxGYqzpGOnlCGhgrzCPuvI59NQVt8bkDVTiIj7HBGwtc4XLpY1hA
         wDP+b2Gni+u7KE1w/jsq9zFdZVMEqG1YHbSdaqZnyX92Gtb5rCsYmbEuSX96vAU+cGFX
         Q6ahANz0tHpkqeUsi751NHJ8Tlvl2GZp/83dXQ4PdP0PbDKE+zC+GQwuxJwaKcz9SRGf
         BF27eTp7o9QXsDISCJ1/Rq4FWaWatQl3jwti0o6TzGwOKjz2HV+7TXlhLNYyOVsSIqy3
         dDsHHVfM9dkSSvxUh8tX+xWIdiuCn6fQmtcwnUsVyaf9ypQwXPA/BzvjcME97Sg4rXYQ
         bEDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748877786; x=1749482586;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5F5eVUrYkyhLcTB2TJWM26UTa/yIJkoh7wyIMTrpq3s=;
        b=s+aagkf384I1q3NPBWCHw9BE5ieqzaIOpnL9XAXL0QDVF4Iajqthvg4iJp9X1MzjUj
         a4hE8cBQHSNL6Ky3G2UE4WWFh0m7W0cRKtTjG+nxOMKs26GWkRsej8bo1nbhnl/R5ViM
         VHyuhuClF4tHayzDCvnjBLyyS0yVIiLosu5Bw5UC4G+5yYxmnL3PvAX5/gq351adlW3V
         200q/w99m9ye4J6sqUsCQLfSX+TM8WCFEHKpfdmCL+6fWcIl5ctbXH22LC/Q11HTGERI
         Vdv5N7a3CMvFinylU/P7dEa9lMph0fmABzlWxk+anoervBQryDn/Zg1sOy8DwJ7pRyVf
         yxIg==
X-Forwarded-Encrypted: i=1; AJvYcCXPLM5R24qK0QAENVrNvV47jq3kndroxMrKmrphkARz3SOPcTpp+j1oGc/I6aN8NrvD8hTOUud8p1E=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzW04sdHRRcWyrWNV5d67MYsa4BcNvs21GhnL71/AY9kUsyS2Cj
	n8sDYrfhmI74I/ePJaOZVz/MHXffO6KcKUX4AkzIK9gFv0/8QTgZXtmS
X-Gm-Gg: ASbGnct+Edt5WkHOcPvvsDRZy5n5j7zKWzN4SZ/6+mPb025JyZ1s3uHr97pa1R0OoiI
	CKv5+n3aA3TNEVL5BmYyVEZ4i0JAAGjCtEVrOfCZI2XFZxqRk0ITO3dR4Avazu4xhd/LHHsDJCD
	evOeHxX1J77i2g355Dz56XG9nxFrWpCNj8iCCTKtx6Aroqj/5xO7H27iQYtTfmspRxVKpV83JdG
	+I7FJeUl+HGdKhseH0ttn75yk57KuxMqhaK9SZa3ttseXw0LdIHqedplhi27xgSu3HE/Vlgcus1
	o0/F0/oGezvjaCKk/1GzMvUrI+BJK6jbrShwkSafI3mY4i7K7qk3r+oo/IhKHnLHT9kRH8oBywM
	Xcc5xYgaIwAb/CM7w2oXYD/k=
X-Google-Smtp-Source: AGHT+IFkiAoB2M7nK9lhfiIC9rbpVEThHExxCNd1GPIWrv/AbF1SdDBnKgG+gc9uRNGy9AR2nQoFkw==
X-Received: by 2002:a05:651c:220d:b0:32a:7122:58c9 with SMTP id 38308e7fff4ca-32a9e99b732mr18989151fa.5.1748877786054;
        Mon, 02 Jun 2025 08:23:06 -0700 (PDT)
Date: Mon, 2 Jun 2025 17:23:05 +0200
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: sstabellini@kernel.org, julien@xen.org, bertrand.marquis@arm.com,
	michal.orzel@amd.com, Volodymyr_Babchuk@epam.com,
	andrew.cooper3@citrix.com, edgar.iglesias@amd.com,
	Anthony PERARD <anthony.perard@vates.tech>,
	Juergen Gross <jgross@suse.com>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v3 1/5] xen/arm: Add way to disable traps on accesses to
 unmapped addresses
Message-ID: <aD3B2c4jtrT5A85T@zapote>
References: <20250530134559.1434255-1-edgar.iglesias@gmail.com>
 <20250530134559.1434255-2-edgar.iglesias@gmail.com>
 <4cd82cbb-fc01-425d-b036-62f80a027a9b@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4cd82cbb-fc01-425d-b036-62f80a027a9b@suse.com>
User-Agent: Mutt/2.2.14+84 (2efcabc4) (2025-03-23)

On Mon, Jun 02, 2025 at 10:45:36AM +0200, Jan Beulich wrote:
> On 30.05.2025 15:45, Edgar E. Iglesias wrote:
> > --- a/xen/common/domain.c
> > +++ b/xen/common/domain.c
> > @@ -721,7 +721,8 @@ static int sanitise_domain_config(struct xen_domctl_createdomain *config)
> >           ~(XEN_DOMCTL_CDF_hvm | XEN_DOMCTL_CDF_hap |
> >             XEN_DOMCTL_CDF_s3_integrity | XEN_DOMCTL_CDF_oos_off |
> >             XEN_DOMCTL_CDF_xs_domain | XEN_DOMCTL_CDF_iommu |
> > -           XEN_DOMCTL_CDF_nested_virt | XEN_DOMCTL_CDF_vpmu) )
> > +           XEN_DOMCTL_CDF_nested_virt | XEN_DOMCTL_CDF_vpmu |
> > +           XEN_DOMCTL_CDF_trap_unmapped_accesses) )
> >      {
> >          dprintk(XENLOG_INFO, "Unknown CDF flags %#x\n", config->flags);
> >          return -EINVAL;
> > --- a/xen/include/public/domctl.h
> > +++ b/xen/include/public/domctl.h
> > @@ -66,9 +66,11 @@ struct xen_domctl_createdomain {
> >  #define XEN_DOMCTL_CDF_nested_virt    (1U << _XEN_DOMCTL_CDF_nested_virt)
> >  /* Should we expose the vPMU to the guest? */
> >  #define XEN_DOMCTL_CDF_vpmu           (1U << 7)
> > +/* Should we trap guest accesses to unmapped addresses? */
> > +#define XEN_DOMCTL_CDF_trap_unmapped_accesses  (1U << 8)
> 
> Besides being pretty long an identifier (and that's already with "guest" not
> even in the name), if this is to be arch-independent, would this perhaps fit
> x86'es recently introduced "advanced" PVH handling of holes? See [1].
> 

Looks like the implementation of the options would be related
but trap_unmapped_accesses is intended for domU's and pf-fixup is for
dom0 IIUC, so in terms of configuration they would be different...

I'm happy to change the name of trap_unmapped_accesses if there
are better (and shorter) ideas.

Thanks,
Edgar



> Jan
> 
> [1] 104591f5dd67 ("x86/dom0: attempt to fixup p2m page-faults for PVH dom0")

