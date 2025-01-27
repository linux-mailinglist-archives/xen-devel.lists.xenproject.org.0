Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7701FA1D904
	for <lists+xen-devel@lfdr.de>; Mon, 27 Jan 2025 16:09:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.878012.1288186 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tcQjV-0000kG-Jg; Mon, 27 Jan 2025 15:09:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 878012.1288186; Mon, 27 Jan 2025 15:09:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tcQjV-0000iG-GV; Mon, 27 Jan 2025 15:09:01 +0000
Received: by outflank-mailman (input) for mailman id 878012;
 Mon, 27 Jan 2025 15:08:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jIzP=UT=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tcQjT-0000iA-Rx
 for xen-devel@lists.xenproject.org; Mon, 27 Jan 2025 15:08:59 +0000
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [2a00:1450:4864:20::536])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a1b8a6ea-dcc0-11ef-99a4-01e77a169b0f;
 Mon, 27 Jan 2025 16:08:57 +0100 (CET)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-5d3e6274015so8550531a12.0
 for <xen-devel@lists.xenproject.org>; Mon, 27 Jan 2025 07:08:57 -0800 (PST)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab69095d6c8sm380218466b.104.2025.01.27.07.08.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jan 2025 07:08:56 -0800 (PST)
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
X-Inumbo-ID: a1b8a6ea-dcc0-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1737990537; x=1738595337; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Pqg/8C+rq1Z7I8x8tR8XZfMwe9rEjvF9C4goOoYa7jk=;
        b=Kq097DiZrOuS0hyYDW1iUTSxxWiCkZdfF1uCoWAOek4k/+Phe8y5rYVxv7pdoHmxyE
         wIKvDo8orZwDY/3rpDZ7hejKDy+a51OCIsq51upZ6Zhp+Sjhj9MrRHRclEfYjZ3gzQJp
         6M2kD5zayRi3hbw4DRT+XfE9wLFiJ/SFWXkKM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737990537; x=1738595337;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Pqg/8C+rq1Z7I8x8tR8XZfMwe9rEjvF9C4goOoYa7jk=;
        b=lepJF/cUJTNpqKBRTQiDTH15khoZhYYQdfQt9NXEJsTjm2W8nBp6sO4sFkXnBWZ0Ep
         tqa9t7ODNWW6RdTYkgPjRgTarHH77WZ0zi9GPNQNaAfRizZCx9UyFhv9x7VGSDJyXf5v
         e/y0xHRHRXftZHGwnQXhR5dJRw4cE1DKSFee5KAU/D9u8qBqgY/kyw6ncQixENbbl7Jf
         T4X46pijJ9bB7jco+lvy+fOi0mpX4iA0ziXwb5/NrWciFNpGWM1hgu+kp1sUkLUfwYHB
         EB6nFAkuyvsi+A4iDBPogEEUX7Ish9SocwOOW8isj+l5SVHdAInZUe+GiI362vKKvhLi
         x+Bw==
X-Forwarded-Encrypted: i=1; AJvYcCXkb3nQ6twew95pTOBSJ9wOaPinoXNtga3tC17aPhK+0IyexiNwedFWdza2diP8Mj74XRtAebBwd/w=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyYGCAl68z2igoAhBbKLpqnCHrYPJ4UDh6tWXdOqvKVePENI5nF
	sNekxk/vXj3QSPNOxE8CEUFldw36YQ8+egDrajFdQgsU2ZH+99BAQ4ttvrqfCwg=
X-Gm-Gg: ASbGncsbAZSCtbYMC7HkFMbrxyF1vUCbtkteClAnTehLJz5u0SKIVLGJkygaHf1tUAm
	99DNCkFwKr+nVSuw+l+yse1NCWx8JNoDXXGtH8ZfC4qAlCts71j2NtsWyZhIq1wKobTpif2j6bT
	bvZ5BtYykwMJnWPuo1S/hzasw2AdyActviS1gD9eu6z1rlygsBbIIlARu1MxAiSssM7ND8t61Qz
	EUvCS2a+QYpGTdHAPeNLDip36KF6l+x6RhwrCL0zoc+BKySxx30m0ClgFuxVMoBiAQ3ZWn/Z/kl
	Tt77gohzwQ==
X-Google-Smtp-Source: AGHT+IEcjQPQqADvho5JeuBDBOESkaQg+b+CsH7vZGYyRdvBPkdKfqHB0dYQ800ODIZpn1su0ZrFTw==
X-Received: by 2002:a17:907:7fa3:b0:aa6:707a:af59 with SMTP id a640c23a62f3a-ab38b4c6b1amr4181681866b.50.1737990537115;
        Mon, 27 Jan 2025 07:08:57 -0800 (PST)
Date: Mon, 27 Jan 2025 16:08:55 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Jiqian Chen <Jiqian.Chen@amd.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Huang Rui <ray.huang@amd.com>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v6] vpci: Add resizable bar support
Message-ID: <Z5ehh9IK3W8fLXIl@macbook.local>
References: <20250123035003.3797022-1-Jiqian.Chen@amd.com>
 <2f34ba33-070e-4c02-a7e5-71451553a23e@suse.com>
 <Z5ebGImjSz-55Nkj@macbook.local>
 <9a4ed1f8-0cbf-4df5-804e-78cc3ee1d777@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9a4ed1f8-0cbf-4df5-804e-78cc3ee1d777@suse.com>

On Mon, Jan 27, 2025 at 03:52:31PM +0100, Jan Beulich wrote:
> On 27.01.2025 15:41, Roger Pau Monné wrote:
> > On Mon, Jan 27, 2025 at 03:20:40PM +0100, Jan Beulich wrote:
> >> On 23.01.2025 04:50, Jiqian Chen wrote:
> >>> v5->v6 changes:
> >>> * Changed "1UL" to "1ULL" in PCI_REBAR_CTRL_SIZE idefinition for 32 bit architecture.
> >>> * In rebar_ctrl_write used "bar - pdev->vpci->header.bars" to get index instead of reading
> >>>   from register.
> >>> * Added the index of BAR to error messages.
> >>> * Changed to "continue" instead of "return an error" when vpci_add_register failed.
> >>
> >> I'm not convinced this was a good change to make. While ...
> >>
> >>> +static int cf_check init_rebar(struct pci_dev *pdev)
> >>> +{
> >>> +    uint32_t ctrl;
> >>> +    unsigned int nbars;
> >>> +    unsigned int rebar_offset = pci_find_ext_capability(pdev->sbdf,
> >>> +                                                        PCI_EXT_CAP_ID_REBAR);
> >>> +
> >>> +    if ( !rebar_offset )
> >>> +        return 0;
> >>> +
> >>> +    if ( !is_hardware_domain(pdev->domain) )
> >>> +    {
> >>> +        printk(XENLOG_ERR "%pp: resizable BARs unsupported for unpriv %pd\n",
> >>> +               &pdev->sbdf, pdev->domain);
> >>> +        return -EOPNOTSUPP;
> >>> +    }
> >>> +
> >>> +    ctrl = pci_conf_read32(pdev->sbdf, rebar_offset + PCI_REBAR_CTRL(0));
> >>> +    nbars = MASK_EXTR(ctrl, PCI_REBAR_CTRL_NBAR_MASK);
> >>> +    for ( unsigned int i = 0; i < nbars; i++ )
> >>> +    {
> >>> +        int rc;
> >>> +        struct vpci_bar *bar;
> >>> +        unsigned int index;
> >>> +
> >>> +        ctrl = pci_conf_read32(pdev->sbdf, rebar_offset + PCI_REBAR_CTRL(i));
> >>> +        index = ctrl & PCI_REBAR_CTRL_BAR_IDX;
> >>> +        if ( index >= PCI_HEADER_NORMAL_NR_BARS )
> >>> +        {
> >>> +            printk(XENLOG_ERR "%pd %pp: too big BAR number %u in REBAR_CTRL\n",
> >>> +                   pdev->domain, &pdev->sbdf, index);
> >>> +            continue;
> >>> +        }
> >>> +
> >>> +        bar = &pdev->vpci->header.bars[index];
> >>> +        if ( bar->type != VPCI_BAR_MEM64_LO && bar->type != VPCI_BAR_MEM32 )
> >>> +        {
> >>> +            printk(XENLOG_ERR "%pd %pp: BAR%u is not in memory space\n",
> >>> +                   pdev->domain, &pdev->sbdf, index);
> >>> +            continue;
> >>> +        }
> >>
> >> ... for these two cases we can permit Dom0 direct access because the BAR
> >> isn't going to work anyway (as far as we can tell), ...
> >>
> >>> +        rc = vpci_add_register(pdev->vpci, vpci_hw_read32vpci_hw_read32, vpci_hw_write32,
> >>> +                               rebar_offset + PCI_REBAR_CAP(i), 4, NULL);
> >>> +        if ( rc )
> >>> +        {
> >>> +            /*
> >>> +             * TODO: for failed pathes, need to hide ReBar capability
> >>> +             * from hardware domain instead of returning an error.
> >>> +             */
> >>> +            printk(XENLOG_ERR "%pd %pp: BAR%u fail to add reg of REBAR_CAP rc=%d\n",
> >>> +                   pdev->domain, &pdev->sbdf, index, rc);
> >>> +            continue;
> >>> +        }
> >>> +
> >>> +        rc = vpci_add_register(pdev->vpci, vpci_hw_read32, rebar_ctrl_write,
> >>> +                               rebar_offset + PCI_REBAR_CTRL(i), 4, bar);
> >>> +        if ( rc )
> >>> +        {
> >>> +            printk(XENLOG_ERR "%pd %pp: BAR%u fail to add reg of REBAR_CTRL rc=%d\n",
> >>> +                   pdev->domain, &pdev->sbdf, index, rc);
> >>> +            continue;
> >>> +        }
> >>
> >> ... in these two cases we had an issue internally, and would hence wrongly
> >> allow Dom0 direct access (and in case it's the 2nd one that failed, in fact
> >> only partially direct access, with who knows what resulting inconsistencies).
> >>
> >> Only with this particular change undone:
> > R> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> >>
> >> Otherwise you and Roger (who needs to at least ack the change anyway) will
> >> need to sort that out, with me merely watching.
> > 
> > Ideally errors here should be dealt with by masking the capability.
> > However Xen doesn't yet have that support.  The usage of continue is
> > to merely attempt to keep any possible setup hooks working (header,
> > MSI, MSI-X). Returning failure from init_rebar() will cause all
> > vPCI hooks to be removed, and thus the hardware domain to have
> > unmediated access to the device, which is likely worse than just
> > continuing here.
> 
> Hmm, true. Maybe with the exception of the case where the first reg
> registration works, but the 2nd fails. Since CTRL is writable but
> CAP is r/o (and data there is simply being handed through) I wonder
> whether we need to intercept CAP at all, and if we do, whether we
> wouldn't better try to register CTRL first.

Indeed, Jiqian is that a leftover from a previous version when writes
to CAP where ignored for being a read-only register?

The current adding of a handler with vpci_hw_{read,write}32() result
in the exact same behavior for a hardware domain, which is the only
domain where ReBAR will be exposed.

Thanks, Roger.

