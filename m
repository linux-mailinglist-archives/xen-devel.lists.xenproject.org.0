Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6254AA1D896
	for <lists+xen-devel@lfdr.de>; Mon, 27 Jan 2025 15:41:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.877974.1288146 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tcQIv-0003kh-TX; Mon, 27 Jan 2025 14:41:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 877974.1288146; Mon, 27 Jan 2025 14:41:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tcQIv-0003iJ-PZ; Mon, 27 Jan 2025 14:41:33 +0000
Received: by outflank-mailman (input) for mailman id 877974;
 Mon, 27 Jan 2025 14:41:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jIzP=UT=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tcQIu-0003iB-Gw
 for xen-devel@lists.xenproject.org; Mon, 27 Jan 2025 14:41:32 +0000
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [2a00:1450:4864:20::52f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cc25779b-dcbc-11ef-a0e6-8be0dac302b0;
 Mon, 27 Jan 2025 15:41:31 +0100 (CET)
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-5d3ecae02beso6194627a12.0
 for <xen-devel@lists.xenproject.org>; Mon, 27 Jan 2025 06:41:30 -0800 (PST)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5dc186d8b37sm5467311a12.72.2025.01.27.06.41.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jan 2025 06:41:29 -0800 (PST)
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
X-Inumbo-ID: cc25779b-dcbc-11ef-a0e6-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1737988890; x=1738593690; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=DuQVWa3UAj0x1+sC5RPCZtQ/X8NDmzt/StrL5IE96mw=;
        b=upV8hwOQe2k7AxFv7Yjl0dRYyKY2OnAT989U37hpimAzC+t4kONCW8Z9xqtal3vE/a
         8F2qywQ5+WlIiuaNoiNF9t+1/FMHHf4L2BNFidpFq/48icoQrmGJGQ6en9VR+yP7irxr
         O54fA0n52gt+JKX1l9dRBzbjzqmdYwbZVV5Sg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737988890; x=1738593690;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DuQVWa3UAj0x1+sC5RPCZtQ/X8NDmzt/StrL5IE96mw=;
        b=YiqZ+bLMfO4vMPUjF7QwPlz8ZXuBbflVkSDMd1NJifVLGfwqBTpoOfr5Bu/P8HFkln
         NlC4Pmbw5E4lCdRBLF0L5ECXGnvIbiafM9JIs+XuT8C84hEPBGOyA+imXxK3iCP+WX9O
         H1fDhP1LUryQ4js85ic0PQGi/D5bK+XRWF9Bmk0AFS5xO6NOG7Yfm7d7iL0uxkHI+njl
         uY29I4Nmt1i7FhQgxaCQSKsSc3E2wtiyts59ifkhfJIhRHTsWu72ocxCLck2adT0+IbB
         QV2FDXPE84EiQBDdB120ypB1vb48G+X4iWbdcaMu6MIpV+vx3G6ET00Kaeta05Obqb3L
         lxXw==
X-Forwarded-Encrypted: i=1; AJvYcCX9JAdMdXk4mSf7ZB490HLH0i0GTAb38zG+ta+WpK9HTofcPv+929jr/I0jOQNVv+JrdRnYCRXc3FY=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw0T8VbrQshqM3quy+HIYRZVMjKyaa1S4cyZTQaO5IrqBwXbF9D
	YuY4kT8FX0ZkebACWl+L3AOmaaQxOwBkUB8EzTLwNE9VcEdL2sDZEXF7bC3+wYw=
X-Gm-Gg: ASbGncvoSsFGwcI3ZsEC6a3hgRt9tcOyGsleF16xAudA6aSg0FT5U+GUBfnPcq8QBgK
	RDeFGoTbeRC46lcH6ibYmSUm14Re8VjMNDyvqY6sqCaxsy6YyjnSEcTojmfnFY81PK06HbrsKhR
	bxvWOJiPcxgZEl4VugCRW5nMtj4G5/8CyviNqjpYkzMEJPkORKY97/K8Hd0+zfWYgkr9zqcM3zR
	OY9j5pNlEu79Z27VeXAh5JCkDX0rZMyxwzDX5Ik5kNrKLgnVCk9Z0ctpj8abcCeBXjlnhaOyaru
	ca5cSItsOg==
X-Google-Smtp-Source: AGHT+IEkT5y7ZTrLdEEz45DlubyCU0IVulmOTVNa2RieT4MUePILWFs4ZZBYlzdM1XTFNrxLPBbi1Q==
X-Received: by 2002:a05:6402:278f:b0:5d2:7346:3ecb with SMTP id 4fb4d7f45d1cf-5db7d2f8066mr39168584a12.12.1737988890364;
        Mon, 27 Jan 2025 06:41:30 -0800 (PST)
Date: Mon, 27 Jan 2025 15:41:28 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Jiqian Chen <Jiqian.Chen@amd.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Huang Rui <ray.huang@amd.com>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v6] vpci: Add resizable bar support
Message-ID: <Z5ebGImjSz-55Nkj@macbook.local>
References: <20250123035003.3797022-1-Jiqian.Chen@amd.com>
 <2f34ba33-070e-4c02-a7e5-71451553a23e@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <2f34ba33-070e-4c02-a7e5-71451553a23e@suse.com>

On Mon, Jan 27, 2025 at 03:20:40PM +0100, Jan Beulich wrote:
> On 23.01.2025 04:50, Jiqian Chen wrote:
> > v5->v6 changes:
> > * Changed "1UL" to "1ULL" in PCI_REBAR_CTRL_SIZE idefinition for 32 bit architecture.
> > * In rebar_ctrl_write used "bar - pdev->vpci->header.bars" to get index instead of reading
> >   from register.
> > * Added the index of BAR to error messages.
> > * Changed to "continue" instead of "return an error" when vpci_add_register failed.
> 
> I'm not convinced this was a good change to make. While ...
> 
> > +static int cf_check init_rebar(struct pci_dev *pdev)
> > +{
> > +    uint32_t ctrl;
> > +    unsigned int nbars;
> > +    unsigned int rebar_offset = pci_find_ext_capability(pdev->sbdf,
> > +                                                        PCI_EXT_CAP_ID_REBAR);
> > +
> > +    if ( !rebar_offset )
> > +        return 0;
> > +
> > +    if ( !is_hardware_domain(pdev->domain) )
> > +    {
> > +        printk(XENLOG_ERR "%pp: resizable BARs unsupported for unpriv %pd\n",
> > +               &pdev->sbdf, pdev->domain);
> > +        return -EOPNOTSUPP;
> > +    }
> > +
> > +    ctrl = pci_conf_read32(pdev->sbdf, rebar_offset + PCI_REBAR_CTRL(0));
> > +    nbars = MASK_EXTR(ctrl, PCI_REBAR_CTRL_NBAR_MASK);
> > +    for ( unsigned int i = 0; i < nbars; i++ )
> > +    {
> > +        int rc;
> > +        struct vpci_bar *bar;
> > +        unsigned int index;
> > +
> > +        ctrl = pci_conf_read32(pdev->sbdf, rebar_offset + PCI_REBAR_CTRL(i));
> > +        index = ctrl & PCI_REBAR_CTRL_BAR_IDX;
> > +        if ( index >= PCI_HEADER_NORMAL_NR_BARS )
> > +        {
> > +            printk(XENLOG_ERR "%pd %pp: too big BAR number %u in REBAR_CTRL\n",
> > +                   pdev->domain, &pdev->sbdf, index);
> > +            continue;
> > +        }
> > +
> > +        bar = &pdev->vpci->header.bars[index];
> > +        if ( bar->type != VPCI_BAR_MEM64_LO && bar->type != VPCI_BAR_MEM32 )
> > +        {
> > +            printk(XENLOG_ERR "%pd %pp: BAR%u is not in memory space\n",
> > +                   pdev->domain, &pdev->sbdf, index);
> > +            continue;
> > +        }
> 
> ... for these two cases we can permit Dom0 direct access because the BAR
> isn't going to work anyway (as far as we can tell), ...
> 
> > +        rc = vpci_add_register(pdev->vpci, vpci_hw_read32, vpci_hw_write32,
> > +                               rebar_offset + PCI_REBAR_CAP(i), 4, NULL);
> > +        if ( rc )
> > +        {
> > +            /*
> > +             * TODO: for failed pathes, need to hide ReBar capability
> > +             * from hardware domain instead of returning an error.
> > +             */
> > +            printk(XENLOG_ERR "%pd %pp: BAR%u fail to add reg of REBAR_CAP rc=%d\n",
> > +                   pdev->domain, &pdev->sbdf, index, rc);
> > +            continue;
> > +        }
> > +
> > +        rc = vpci_add_register(pdev->vpci, vpci_hw_read32, rebar_ctrl_write,
> > +                               rebar_offset + PCI_REBAR_CTRL(i), 4, bar);
> > +        if ( rc )
> > +        {
> > +            printk(XENLOG_ERR "%pd %pp: BAR%u fail to add reg of REBAR_CTRL rc=%d\n",
> > +                   pdev->domain, &pdev->sbdf, index, rc);
> > +            continue;
> > +        }
> 
> ... in these two cases we had an issue internally, and would hence wrongly
> allow Dom0 direct access (and in case it's the 2nd one that failed, in fact
> only partially direct access, with who knows what resulting inconsistencies).
> 
> Only with this particular change undone:
R> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> 
> Otherwise you and Roger (who needs to at least ack the change anyway) will
> need to sort that out, with me merely watching.

Ideally errors here should be dealt with by masking the capability.
However Xen doesn't yet have that support.  The usage of continue is
to merely attempt to keep any possible setup hooks working (header,
MSI, MSI-X). Returning failure from init_rebar() will cause all
vPCI hooks to be removed, and thus the hardware domain to have
unmediated access to the device, which is likely worse than just
continuing here.

This already happens in other capability init paths, that are much less
careful about returning errors, so Jan might be right that if nothing
else for consistency we return an error.  With the hope that
initialization error of capabilities in vPCI will eventually lead to
such capabilities being hidden instead of removing all vPCI handlers
from the device.

Thanks, Roger.

