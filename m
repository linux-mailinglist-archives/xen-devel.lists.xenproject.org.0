Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A745A762C6
	for <lists+xen-devel@lfdr.de>; Mon, 31 Mar 2025 10:54:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.932272.1334427 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzAuE-0007jX-Pt; Mon, 31 Mar 2025 08:54:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 932272.1334427; Mon, 31 Mar 2025 08:54:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzAuE-0007gR-M3; Mon, 31 Mar 2025 08:54:06 +0000
Received: by outflank-mailman (input) for mailman id 932272;
 Mon, 31 Mar 2025 08:54:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FpTe=WS=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tzAuC-0007gL-KK
 for xen-devel@lists.xenproject.org; Mon, 31 Mar 2025 08:54:04 +0000
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com
 [2607:f8b0:4864:20::632])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b1bbd6cd-0e0d-11f0-9ea7-5ba50f476ded;
 Mon, 31 Mar 2025 10:54:03 +0200 (CEST)
Received: by mail-pl1-x632.google.com with SMTP id
 d9443c01a7336-22438c356c8so82901485ad.1
 for <xen-devel@lists.xenproject.org>; Mon, 31 Mar 2025 01:54:03 -0700 (PDT)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 d2e1a72fcca58-7397106c7b7sm6464437b3a.116.2025.03.31.01.54.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Mar 2025 01:54:01 -0700 (PDT)
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
X-Inumbo-ID: b1bbd6cd-0e0d-11f0-9ea7-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1743411242; x=1744016042; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=g68pv8HLKjxwIYNYmVAVNeAB6X96bZp2QGkJCQ1PFwQ=;
        b=XOPudND53zcD7ztA/mfEzGxtp50UOHpO0xcrGQKTPZ/B8jb5sx7XTsD95r5CkixFgk
         M6/oJVXRYnZ9dsogzYSIVkzsZ3F1Lxy7wGOuss129UvRbaIWPYapDbiO3urF52W32fLs
         wwBsj9wL/8Oqhz/LyDEb/4djXR6xchrv4/TOM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743411242; x=1744016042;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=g68pv8HLKjxwIYNYmVAVNeAB6X96bZp2QGkJCQ1PFwQ=;
        b=jlImEYhWn/U/e92pcBidpn7+uFiaYbMfIpkA125xRLzzTHn56GOWssRzpoR86IjYmI
         3yRanuSuC+VmOIoI8lrbcI1sJTI1qQmeV6e8sex/t+2VSisI/6E1j4eukJhFW9Mza7qv
         915ZocX5dE10Kf9R5jR7PUzOmL9KGsiIOUaDLC8Mf65NiuqXtgyZQHXeNQJjB2nUBJVt
         liS7Hlm/3G78aB4nmbZue99By4wzU8B+ltHW61Fwtq83aBrGzk3Ws570bM0/GKpn9dQE
         EJAqBOXeoz95PA+Z9j+X5q9CAmgU2N0I/quc5HTVfJEBYcZ47tSPa96GDTMMU3ZA5au1
         P+tA==
X-Gm-Message-State: AOJu0Yw+ea6WkJBu9ljczLZ+dbx32GOT4lj8RxFxJeoj7LcECH1oS4gr
	twyxQuxZWLjCPvC6yl0xOQJpoHaqE9QKE+8EaOPIvt+3U9qn8znmiG8DnjcIwkkRmpjQMJcBmzC
	S
X-Gm-Gg: ASbGncsUbRlMerRs9OsW3z+bntk/CBMCXg2QdlMbOTyEn12KbaJrsXMzScKF1nZhhh/
	tSOeiJjik0R3GDDrgl4xU7aI0+7M4Sh6XbMH7/sSIzUtRfBZee3OScOoPETptBuSJgIWPzJwhof
	HEqpVg0eHjGwDtxua2mSUguoafGFHmS4zo2eE9dR21doZYsdpv9WNr1qoSMzHroTxnx2zg5xxgQ
	XqWGfBlq4JJb3cpgPh16+B15IoSHNvoOf1LljTavLeI0KH0UoXpfTybtCpnM/c0FZYrRXydWL0v
	e9s4DFkkslcbXVaSQW0q4vc5WMChuzKFqAnvJq2wsbGXk3ngSA==
X-Google-Smtp-Source: AGHT+IGIE0rMnnu+MRDEZJk9y8ZHT3VF0R+T53xSrMaQX2pAC07QvM09shgGUdRHgWf96BiJHhDD+g==
X-Received: by 2002:a05:6a20:9e4a:b0:1f5:862b:a583 with SMTP id adf61e73a8af0-2009f78553bmr15390872637.34.1743411241885;
        Mon, 31 Mar 2025 01:54:01 -0700 (PDT)
Date: Mon, 31 Mar 2025 10:53:56 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: "Chen, Jiqian" <Jiqian.Chen@amd.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"Huang, Ray" <Ray.Huang@amd.com>
Subject: Re: [PATCH v1 3/3] vpci/msi: Remove registers when init_msi() fails
Message-ID: <Z-pYJNyGieUqkVvl@macbook.local>
References: <20250327073214.158210-1-Jiqian.Chen@amd.com>
 <20250327073214.158210-3-Jiqian.Chen@amd.com>
 <Z-VIFo7q7-UNsLCt@macbook.local>
 <BL1PR12MB584905BC9966EF9742FF4472E7AD2@BL1PR12MB5849.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <BL1PR12MB584905BC9966EF9742FF4472E7AD2@BL1PR12MB5849.namprd12.prod.outlook.com>

On Mon, Mar 31, 2025 at 08:13:50AM +0000, Chen, Jiqian wrote:
> On 2025/3/27 20:44, Roger Pau Monné wrote:
> > On Thu, Mar 27, 2025 at 03:32:14PM +0800, Jiqian Chen wrote:
> >> When init_msi() fails, the new codes will try to hide MSI
> >> capability, so it can't rely on vpci_deassign_device() to
> >> remove all MSI related registers anymore, those registers
> >> must be cleaned up in failure path of init_msi.
> >>
> >> To do that, use a vpci_register array to record all MSI
> >> registers and call vpci_remove_register() to remove registers.
> > 
> > As I'm just seeing 3 patches on the series, isn't there one missing
> > for MSI-X at least?
> No, because init_msix only call vpci_add_register once, there is no need to remove registers when it fails.

Seems a bit fragile, what about if there's further code added to
init_msix() that could return an error after the vpci_add_register()
call?  It would be safer to have a cleanup function that removes the
config space handlers, plus the MMIO one (see the call to
register_mmio_handler()), and the addition to the
d->arch.hvm.msix_tables list.

> > 
> >> Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
> >> ---
> >>  xen/drivers/vpci/msi.c | 57 +++++++++++++++++++++++++++++-------------
> >>  1 file changed, 39 insertions(+), 18 deletions(-)
> >>
> >> diff --git a/xen/drivers/vpci/msi.c b/xen/drivers/vpci/msi.c
> >> index 9d7a9fd8dba1..30ef97efb7b0 100644
> >> --- a/xen/drivers/vpci/msi.c
> >> +++ b/xen/drivers/vpci/msi.c
> >> @@ -195,6 +195,9 @@ static void cf_check mask_write(
> >>  
> >>  static int cf_check init_msi(struct pci_dev *pdev)
> >>  {
> >> +    unsigned int offset;
> >> +    unsigned int reg_index = 0;
> >> +    struct vpci_register registers[VPCI_CAP_MAX_REGISTER];
> >>      unsigned int pos = pdev->msi_pos;
> >>      uint16_t control;
> >>      int ret;
> >> @@ -206,15 +209,13 @@ static int cf_check init_msi(struct pci_dev *pdev)
> >>      if ( !pdev->vpci->msi )
> >>          return -ENOMEM;
> >>  
> >> +    offset = msi_control_reg(pos);
> >>      ret = vpci_add_register(pdev->vpci, control_read, control_write,
> >> -                            msi_control_reg(pos), 2, pdev->vpci->msi);
> >> +                            offset, 2, pdev->vpci->msi);
> >>      if ( ret )
> >> -        /*
> >> -         * NB: there's no need to free the msi struct or remove the register
> >> -         * handlers form the config space, the caller will take care of the
> >> -         * cleanup.
> >> -         */
> >> -        return ret;
> >> +        goto fail;
> >> +    registers[reg_index].offset = offset;
> >> +    registers[reg_index++].size = 2;
> >>  
> >>      /* Get the maximum number of vectors the device supports. */
> >>      control = pci_conf_read16(pdev->sbdf, msi_control_reg(pos));
> >> @@ -234,33 +235,42 @@ static int cf_check init_msi(struct pci_dev *pdev)
> >>      pdev->vpci->msi->address64 = is_64bit_address(control);
> >>      pdev->vpci->msi->masking = is_mask_bit_support(control);
> >>  
> >> +    offset = msi_lower_address_reg(pos);
> >>      ret = vpci_add_register(pdev->vpci, address_read, address_write,
> >> -                            msi_lower_address_reg(pos), 4, pdev->vpci->msi);
> >> +                            offset, 4, pdev->vpci->msi);
> >>      if ( ret )
> >> -        return ret;
> >> +        goto fail;
> >> +    registers[reg_index].offset = offset;
> >> +    registers[reg_index++].size = 4;
> >>  
> >> +    offset = msi_data_reg(pos, pdev->vpci->msi->address64);
> >>      ret = vpci_add_register(pdev->vpci, data_read, data_write,
> >> -                            msi_data_reg(pos, pdev->vpci->msi->address64), 2,
> >> -                            pdev->vpci->msi);
> >> +                            offset, 2, pdev->vpci->msi);
> >>      if ( ret )
> >> -        return ret;
> >> +        goto fail;
> >> +    registers[reg_index].offset = offset;
> >> +    registers[reg_index++].size = 2;
> >>  
> >>      if ( pdev->vpci->msi->address64 )
> >>      {
> >> +        offset = msi_upper_address_reg(pos);
> >>          ret = vpci_add_register(pdev->vpci, address_hi_read, address_hi_write,
> >> -                                msi_upper_address_reg(pos), 4, pdev->vpci->msi);
> >> +                                offset, 4, pdev->vpci->msi);
> >>          if ( ret )
> >> -            return ret;
> >> +            goto fail;
> >> +        registers[reg_index].offset = offset;
> >> +        registers[reg_index++].size = 4;
> >>      }
> >>  
> >>      if ( pdev->vpci->msi->masking )
> >>      {
> >> +        offset = msi_mask_bits_reg(pos, pdev->vpci->msi->address64);
> >>          ret = vpci_add_register(pdev->vpci, mask_read, mask_write,
> >> -                                msi_mask_bits_reg(pos,
> >> -                                                  pdev->vpci->msi->address64),
> >> -                                4, pdev->vpci->msi);
> >> +                                offset, 4, pdev->vpci->msi);
> >>          if ( ret )
> >> -            return ret;
> >> +            goto fail;
> >> +        registers[reg_index].offset = offset;
> >> +        registers[reg_index++].size = 4;
> > 
> > As commented on the previous patch, I don't like much the usage of
> > this registers array to store which handlers have been added.  It
> > would be best if you just removed every possible handler that could be
> > added, without keeping track of them.
> Make sense, it will indeed be simpler if it is fine to remove all possible registers.
> 
> > 
> > Thinking about it, do we maybe need a helper vcpi function that wipes
> > all handlers from a specific range?  I think it could be helpful here,
> > as the size of the capabilities is well-known, so on error it would be
> > easier to just call such a generic handler to wipe all hooks added to
> > the region covered by the failing capability.
> But I am not sure if that helper function is suitable for all capabilities.
> Like Rebar, its structure can range from 12 bytes long(for a single BAR) to 52 bytes long(for all six BARs).
> If a device supports Rebar and only has a single resizable BAR, does hardware still reserved the range from 13 bytes to 52 bytes for that device?

No, we would need to fetch the size of the capability in the cleanup
function, or figure it otherwise.  Note the same applies to MSI
capability, which has a variable size depending on whether 64bit
addresses and masking is supported.

> I mean if I remove the registers(with range 13 to 52), is it possible that I deleted registers belonging to other abilities?

It is, indeed.  You need to know or calculate the size of the
capability to be removed, but that's likely easier and more robust
that keeping an array with the list of added registers?

Thanks, Roger.

