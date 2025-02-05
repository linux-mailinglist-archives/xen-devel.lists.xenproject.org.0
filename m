Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 634B5A28606
	for <lists+xen-devel@lfdr.de>; Wed,  5 Feb 2025 09:58:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.881968.1292132 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tfbDV-0004hm-5a; Wed, 05 Feb 2025 08:57:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 881968.1292132; Wed, 05 Feb 2025 08:57:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tfbDV-0004fX-2D; Wed, 05 Feb 2025 08:57:05 +0000
Received: by outflank-mailman (input) for mailman id 881968;
 Wed, 05 Feb 2025 08:57:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cMUO=U4=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tfbDS-0004fP-R3
 for xen-devel@lists.xenproject.org; Wed, 05 Feb 2025 08:57:02 +0000
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [2a00:1450:4864:20::435])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 296fe563-e39f-11ef-99a4-01e77a169b0f;
 Wed, 05 Feb 2025 09:57:00 +0100 (CET)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-385ef8b64b3so5696436f8f.0
 for <xen-devel@lists.xenproject.org>; Wed, 05 Feb 2025 00:57:00 -0800 (PST)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38db708496fsm656401f8f.69.2025.02.05.00.56.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Feb 2025 00:56:59 -0800 (PST)
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
X-Inumbo-ID: 296fe563-e39f-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1738745820; x=1739350620; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wBIcMpMKtfs7O4MbCCS5mlteIe8qkhx+xUz/5G9hOn4=;
        b=d3AXwyshIPA4Vib63qUm3JmlAi7ae1dvA0WUKTqxgnlWvVlXFfkAb5EWjJvnYAWXzR
         /ZOaEsVJEimLOPxjHmpVWiZtqgLUDcn6+/9ifIzw6hY2j+SJQ6+bLzMWHf5SBa2j+1Wp
         yXuovwBc0fDG86Ydy6hBFBW2pfrsu6OsdL8xE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738745820; x=1739350620;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wBIcMpMKtfs7O4MbCCS5mlteIe8qkhx+xUz/5G9hOn4=;
        b=XOTGTTWPfduuz95VQe3UoX8cQJPBATN3k0Eb4saQ28/M6GrXOdnKYpXWxKSvu+8lQ6
         NBSk+AvCclH9eJtxB0YCQKlgRIXemnXQBgDB2Q2NqfBiUuhzs1r+Hs1anwgKFF0wuA6e
         TC0DI0QrbcaZ3oaZducxb4b/CWMSS1iH00qrxHUYG/QLe+7WyT+lYy/ayU0UCeWPUNRN
         Z/CxZwpeNRkUDDhj67O0zBs0FQvPqiMYEoOFRhA2K3T0l5n65YGYMt+2YZJFweeWCpnP
         X+jwK0zrk75BqlkbChPc84i021JkRh61h/uJfk87b7b/70fnLC6LdfWuUBDdkWrcarxT
         ykyw==
X-Forwarded-Encrypted: i=1; AJvYcCXNbjpJRJ1UnyW+dX8Aadxz+Imt4pDOBdKxLtLlE+viSSitv3TdpLo6b2IH+FwvDznJiBx8DBBEWIQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzIUfHo8B4RFQJYhBsOWQAHTDuX04N8c28c7BM64V4S4yhZi1PQ
	su+5uHKo/d9F9j7E88sXYu7rPKYXzEJu+g9m2K2qwXNzkpfDNOV4fzWzzOwYjrgK1IJnTYs847j
	n
X-Gm-Gg: ASbGncumYIj3eLKV+S+f5tCcWBEI6BfIRZAF71ZKe3N9rhnucBNpkkCrRYorBkCWqM7
	ySpFmG9tvgH9IN5j3l3jU8JWwlfPJcTMkwe+13awjH25zzVZ7IjZX0uGb8ntVixyyIzcg98XbGq
	l5teVMG2CcZ8E9ur3ofpglZWVwVHq7fRfzug4BxULrwa26w0+sbxp8AkxQzyPRkqb7SjftR0+gg
	XaacUQrcqgV9F7g+u6EdtexL4YP4fTwh5qHSC5jOSfxdsziJe4a2/qheeVoS/taGN6D9QWwElBT
	VMN+7QcDRNQX/VTwztlloLbIgQ==
X-Google-Smtp-Source: AGHT+IEbUup4FNnp7114mdNdSNK2b8W/QKVMhsQ/zsT+5cUAu9FBSXWLneJAWyqo8ni8Fi13nKm0TA==
X-Received: by 2002:adf:f243:0:b0:38a:5df9:f86a with SMTP id ffacd0b85a97d-38db48d34e5mr996180f8f.26.1738745820107;
        Wed, 05 Feb 2025 00:57:00 -0800 (PST)
Date: Wed, 5 Feb 2025 09:56:58 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: "Chen, Jiqian" <Jiqian.Chen@amd.com>
Cc: Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	"Huang, Ray" <Ray.Huang@amd.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v6] vpci: Add resizable bar support
Message-ID: <Z6Mn2pWdp6aquAmY@macbook.local>
References: <20250123035003.3797022-1-Jiqian.Chen@amd.com>
 <2f34ba33-070e-4c02-a7e5-71451553a23e@suse.com>
 <Z5ebGImjSz-55Nkj@macbook.local>
 <9a4ed1f8-0cbf-4df5-804e-78cc3ee1d777@suse.com>
 <Z5ehh9IK3W8fLXIl@macbook.local>
 <PH7PR12MB5854E7408E3028689450E68DE7F72@PH7PR12MB5854.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <PH7PR12MB5854E7408E3028689450E68DE7F72@PH7PR12MB5854.namprd12.prod.outlook.com>

On Wed, Feb 05, 2025 at 03:42:30AM +0000, Chen, Jiqian wrote:
> On 2025/1/27 23:08, Roger Pau Monné wrote:
> > On Mon, Jan 27, 2025 at 03:52:31PM +0100, Jan Beulich wrote:
> >> On 27.01.2025 15:41, Roger Pau Monné wrote:
> >>> On Mon, Jan 27, 2025 at 03:20:40PM +0100, Jan Beulich wrote:
> >>>> On 23.01.2025 04:50, Jiqian Chen wrote:
> >>>>> v5->v6 changes:
> >>>>> * Changed "1UL" to "1ULL" in PCI_REBAR_CTRL_SIZE idefinition for 32 bit architecture.
> >>>>> * In rebar_ctrl_write used "bar - pdev->vpci->header.bars" to get index instead of reading
> >>>>>   from register.
> >>>>> * Added the index of BAR to error messages.
> >>>>> * Changed to "continue" instead of "return an error" when vpci_add_register failed.
> >>>>
> >>>> I'm not convinced this was a good change to make. While ...
> >>>>
> >>>>> +static int cf_check init_rebar(struct pci_dev *pdev)
> >>>>> +{
> >>>>> +    uint32_t ctrl;
> >>>>> +    unsigned int nbars;
> >>>>> +    unsigned int rebar_offset = pci_find_ext_capability(pdev->sbdf,
> >>>>> +                                                        PCI_EXT_CAP_ID_REBAR);
> >>>>> +
> >>>>> +    if ( !rebar_offset )
> >>>>> +        return 0;
> >>>>> +
> >>>>> +    if ( !is_hardware_domain(pdev->domain) )
> >>>>> +    {
> >>>>> +        printk(XENLOG_ERR "%pp: resizable BARs unsupported for unpriv %pd\n",
> >>>>> +               &pdev->sbdf, pdev->domain);
> >>>>> +        return -EOPNOTSUPP;
> >>>>> +    }
> >>>>> +
> >>>>> +    ctrl = pci_conf_read32(pdev->sbdf, rebar_offset + PCI_REBAR_CTRL(0));
> >>>>> +    nbars = MASK_EXTR(ctrl, PCI_REBAR_CTRL_NBAR_MASK);
> >>>>> +    for ( unsigned int i = 0; i < nbars; i++ )
> >>>>> +    {
> >>>>> +        int rc;
> >>>>> +        struct vpci_bar *bar;
> >>>>> +        unsigned int index;
> >>>>> +
> >>>>> +        ctrl = pci_conf_read32(pdev->sbdf, rebar_offset + PCI_REBAR_CTRL(i));
> >>>>> +        index = ctrl & PCI_REBAR_CTRL_BAR_IDX;
> >>>>> +        if ( index >= PCI_HEADER_NORMAL_NR_BARS )
> >>>>> +        {
> >>>>> +            printk(XENLOG_ERR "%pd %pp: too big BAR number %u in REBAR_CTRL\n",
> >>>>> +                   pdev->domain, &pdev->sbdf, index);
> >>>>> +            continue;
> >>>>> +        }
> >>>>> +
> >>>>> +        bar = &pdev->vpci->header.bars[index];
> >>>>> +        if ( bar->type != VPCI_BAR_MEM64_LO && bar->type != VPCI_BAR_MEM32 )
> >>>>> +        {
> >>>>> +            printk(XENLOG_ERR "%pd %pp: BAR%u is not in memory space\n",
> >>>>> +                   pdev->domain, &pdev->sbdf, index);
> >>>>> +            continue;
> >>>>> +        }
> >>>>
> >>>> ... for these two cases we can permit Dom0 direct access because the BAR
> >>>> isn't going to work anyway (as far as we can tell), ...
> >>>>
> >>>>> +        rc = vpci_add_register(pdev->vpci, vpci_hw_read32vpci_hw_read32, vpci_hw_write32,
> >>>>> +                               rebar_offset + PCI_REBAR_CAP(i), 4, NULL);
> >>>>> +        if ( rc )
> >>>>> +        {
> >>>>> +            /*
> >>>>> +             * TODO: for failed pathes, need to hide ReBar capability
> >>>>> +             * from hardware domain instead of returning an error.
> >>>>> +             */
> >>>>> +            printk(XENLOG_ERR "%pd %pp: BAR%u fail to add reg of REBAR_CAP rc=%d\n",
> >>>>> +                   pdev->domain, &pdev->sbdf, index, rc);
> >>>>> +            continue;
> >>>>> +        }
> >>>>> +
> >>>>> +        rc = vpci_add_register(pdev->vpci, vpci_hw_read32, rebar_ctrl_write,
> >>>>> +                               rebar_offset + PCI_REBAR_CTRL(i), 4, bar);
> >>>>> +        if ( rc )
> >>>>> +        {
> >>>>> +            printk(XENLOG_ERR "%pd %pp: BAR%u fail to add reg of REBAR_CTRL rc=%d\n",
> >>>>> +                   pdev->domain, &pdev->sbdf, index, rc);
> >>>>> +            continue;
> >>>>> +        }
> >>>>
> >>>> ... in these two cases we had an issue internally, and would hence wrongly
> >>>> allow Dom0 direct access (and in case it's the 2nd one that failed, in fact
> >>>> only partially direct access, with who knows what resulting inconsistencies).
> >>>>
> >>>> Only with this particular change undone:
> >>> R> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> >>>>
> >>>> Otherwise you and Roger (who needs to at least ack the change anyway) will
> >>>> need to sort that out, with me merely watching.
> >>>
> >>> Ideally errors here should be dealt with by masking the capability.
> >>> However Xen doesn't yet have that support.  The usage of continue is
> >>> to merely attempt to keep any possible setup hooks working (header,
> >>> MSI, MSI-X). Returning failure from init_rebar() will cause all
> >>> vPCI hooks to be removed, and thus the hardware domain to have
> >>> unmediated access to the device, which is likely worse than just
> >>> continuing here.
> >>
> >> Hmm, true. Maybe with the exception of the case where the first reg
> >> registration works, but the 2nd fails. Since CTRL is writable but
> >> CAP is r/o (and data there is simply being handed through) I wonder
> >> whether we need to intercept CAP at all, and if we do, whether we
> >> wouldn't better try to register CTRL first.
> > 
> > Indeed, Jiqian is that a leftover from a previous version when writes
> > to CAP where ignored for being a read-only register?
> Sorry to reply late, I just came back from an annual leave.
> Did you mean: why I added handler vpci_hw_write32 for CAP?
> If so, this is a change since V2, that you suggested to add it because there is no write limitation for dom0.

Indeed, if there's no write limitation, you can just drop the addition
of the traps, as the hardware domain by default gets read and write
access to all PCI config space.  IOW: there's no need for a
vpci_add_register() call for PCI_REBAR_CAP if the handlers are just
vpci_hw_{read,write}32().

Thanks, Roger.

