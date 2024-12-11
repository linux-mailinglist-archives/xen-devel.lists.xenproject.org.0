Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D965A9EC991
	for <lists+xen-devel@lfdr.de>; Wed, 11 Dec 2024 10:45:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.854230.1267490 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLJHM-00063U-OV; Wed, 11 Dec 2024 09:45:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 854230.1267490; Wed, 11 Dec 2024 09:45:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLJHM-0005zp-LO; Wed, 11 Dec 2024 09:45:12 +0000
Received: by outflank-mailman (input) for mailman id 854230;
 Wed, 11 Dec 2024 09:45:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YTIw=TE=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tLJHL-0005jB-Bn
 for xen-devel@lists.xenproject.org; Wed, 11 Dec 2024 09:45:11 +0000
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [2a00:1450:4864:20::531])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 99489c16-b7a4-11ef-99a3-01e77a169b0f;
 Wed, 11 Dec 2024 10:45:04 +0100 (CET)
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-5d3f57582a2so939164a12.1
 for <xen-devel@lists.xenproject.org>; Wed, 11 Dec 2024 01:45:09 -0800 (PST)
Received: from localhost ([213.195.123.63]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa6656f306csm632081066b.61.2024.12.11.01.45.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Dec 2024 01:45:08 -0800 (PST)
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
X-Inumbo-ID: 99489c16-b7a4-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1733910309; x=1734515109; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MatPXrZkv5pN4xoMbDj8qSwvawl6FUHH2KG/qu9qqbM=;
        b=CtwL04R2hjrPiYMM6euhZRcJDTeFcN3i/N3ByJr5C2D8+czLTLBvZ0cieJ3SNJfn4w
         ApAGxrk9VxExNUpSm2Ozhd4wxziXSR7hW0FPbHQngHl0FnztfxF8Rb+OxOjhbp6AT4eY
         bITX7K0RSgF5UgCBaN2iYzWqdEFN1/ZhZBxPA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733910309; x=1734515109;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MatPXrZkv5pN4xoMbDj8qSwvawl6FUHH2KG/qu9qqbM=;
        b=EwXGwS36PDclsTYw2btglgqaUD4eoV82RNnXNhq2OCxOX3t2UE45LbqyH59Z9tk5oV
         Ka2hwtRd+AXkfA+JWGKxSJ+cbIEnJ0kv+ypgqAWh2ITILKres+oMxo1cL2UWt1emD7DH
         zKp7X1heje5xShAd7dea+l2AgdHQ4VfyR5pU1kJtvRWpCuHNPXLr96ZnWaATxGB8ZlXo
         hPP97elXIIprg9sWCb2WJ5SgzEnOjCecCMubvha9zmg8orRKHMJO0lxVMDT4wUdzc7Jq
         6l15egxTdq6YGjys2rkMnaEf7CG/1IQFo7SFxe8G+2SNpjOk0s2Sthdc2cnWHpLj4dPy
         K9jQ==
X-Forwarded-Encrypted: i=1; AJvYcCWfkd2Gk9xjrKAT6kwjmrssHmFiBRJ+QTMB8JycBGD33xgTzxyK1xmyu4D0pwkH90s9UyRJmUOci4I=@lists.xenproject.org
X-Gm-Message-State: AOJu0YybTba1vkPLPqmHjzumGikYDPnwMMpkYBdAuLoNKl7j4WF+nxyp
	wQYNFzTHqZ6GAwFjn9UFYmzDM8V4Bs/Ewiv9CKYBRswqUZekhwqYTbmXW7nkBF0=
X-Gm-Gg: ASbGnctiShq4CfCd7c8FBD6J/Ama9qnTCv//ifQLlVigfAq4gEwYK2Vq49runOtmUT6
	mPV/fRGUNGYFTvnqBo6zsLts6TC6/IumMTnZ+m4dkliyh99vARvExZ/J3tW2zRLkvn4mG4T4gqN
	IjlmfETnopUzOff6fWYlao6y3rMg3dqlpDc+kHqkhiXsYemsxt1JcLVr6wWJ2s1mrBIr4idPWXi
	QV9WApAYKzUVJPvvuTpcZiixe/O8KsA3HD+ytO24Wz176n5U4KcoQ0hvk8UxHY=
X-Google-Smtp-Source: AGHT+IHJiqKn+BHt/6DzziOoe6q7lQrs4+z4LGDX9qSrfzNyO7JMg1cjTJwqBuMnYYOTMNBcphuzxA==
X-Received: by 2002:a17:907:3eaa:b0:aa6:7ff9:d248 with SMTP id a640c23a62f3a-aa6b159d7a7mr204683866b.8.1733910308905;
        Wed, 11 Dec 2024 01:45:08 -0800 (PST)
Date: Wed, 11 Dec 2024 10:45:07 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: "Chen, Jiqian" <Jiqian.Chen@amd.com>
Cc: Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	"Huang, Ray" <Ray.Huang@amd.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v2 1/1] vpci: Add resizable bar support
Message-ID: <Z1lfIx1lvUuFFBlB@macbook.local>
References: <20241202060956.1124162-1-Jiqian.Chen@amd.com>
 <4e4df0ee-67f6-41e3-bfc7-e78011680015@suse.com>
 <BL1PR12MB58499BEB287C4F9711324F71E73D2@BL1PR12MB5849.namprd12.prod.outlook.com>
 <1e0576d9-400e-4483-8dd1-061e215a00cd@suse.com>
 <BL1PR12MB584945F11C271CE137231F7BE73D2@BL1PR12MB5849.namprd12.prod.outlook.com>
 <a07bca59-90d2-4a84-bb47-59157bf5207d@suse.com>
 <Z1glF5FJjnSzRqsB@macbook.local>
 <BL1PR12MB58494BFB7FBB042450189684E73E2@BL1PR12MB5849.namprd12.prod.outlook.com>
 <Z1lKRLmmtXKCjIDO@macbook.local>
 <BL1PR12MB5849450C8BF9CDE27777AC03E73E2@BL1PR12MB5849.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <BL1PR12MB5849450C8BF9CDE27777AC03E73E2@BL1PR12MB5849.namprd12.prod.outlook.com>

On Wed, Dec 11, 2024 at 09:36:00AM +0000, Chen, Jiqian wrote:
> On 2024/12/11 16:16, Roger Pau Monné wrote:
> > On Wed, Dec 11, 2024 at 06:37:30AM +0000, Chen, Jiqian wrote:
> >> On 2024/12/10 19:25, Roger Pau Monné wrote:
> >>> On Tue, Dec 10, 2024 at 10:54:43AM +0100, Jan Beulich wrote:
> >>>> On 10.12.2024 08:57, Chen, Jiqian wrote:
> >>>>> On 2024/12/10 15:17, Jan Beulich wrote:
> >>>>>> On 10.12.2024 08:07, Chen, Jiqian wrote:
> >>>>>>> On 2024/12/9 21:59, Jan Beulich wrote:
> >>>>>>>> On 02.12.2024 07:09, Jiqian Chen wrote:
> >>>>>>>>> +static void cf_check rebar_ctrl_write(const struct pci_dev *pdev,
> >>>>>>>>> +                                      unsigned int reg,
> >>>>>>>>> +                                      uint32_t val,
> >>>>>>>>> +                                      void *data)
> >>>>>>>>> +{
> >>>>>>>>> +    uint64_t size;
> >>>>>>>>> +    unsigned int index;
> >>>>>>>>> +    struct vpci_bar *bars = data;
> >>>>>>>>> +
> >>>>>>>>> +    if ( pci_conf_read16(pdev->sbdf, PCI_COMMAND) & PCI_COMMAND_MEMORY )
> >>>>>>>>> +        return;
> >>>>>>>>
> >>>>>>>> I don't think something like this can go uncommented. I don't think the
> >>>>>>>> spec mandates to drop writes in this situation?
> >>>>>>> Spec says: Software must clear the Memory Space Enable bit in the Command register before writing the BAR Size field.
> >>>>>>> This check is suggested by Roger and it really helps to prevent erroneous writes in this case,
> >>>>>>> such as the result of debugging with Roger in the previous version.
> >>>>>>> I will add the spec's sentences as comments here in next version.
> >>>>>>
> >>>>>> What you quote from the spec may not be enough as a comment here. There's
> >>>>>> no direct implication that the write would simply be dropped on the floor
> >>>>>> if the bit is still set. So I think you want to go a little beyond just
> >>>>>> quoting from the spec.
> >>>>> How about quoting Roger's previous words: " The memory decoding must be disabled before writing the BAR size field.
> >>>>> Otherwise changing the BAR size will lead to the active p2m mappings getting out of sync w.r.t. the new BAR size." ?
> >>>>
> >>>> That'll be better, but imo still not enough to explain the outright ignoring
> >>>> of the write.
> >>>
> >>> I think we might want to do something along the lines of:
> >>>
> >>> uint64_t size = PCI_REBAR_CTRL_SIZE(val);
> >>> struct vpci_bar *bar = data;
> >>>
> >>> if ( bar->enabled )
> >>> {
> >>>     if ( size == bar->size )
> >>>         return;
> >>>
> >>>     /*
> >>>      * Refuse to resize a BAR while memory decoding is enabled, as
> >>>      * otherwise the size of the mapped region in the p2m would become
> >>>      * stale with the newly set BAR size, and the position of the BAR
> >>>      * would be reset to undefined.  Note the PCIe specification also
> >>>      * forbids resizing a BAR with memory decoding enabled.
> >>>      */
> >>>     gprintk(XENLOG_ERR,
> >>>             "%pp: refuse to resize BAR with memory decoding enabled\n",
> >>> 	    &pci->sbdf);
> >>>     return;
> >>> }
> >> Thank you very much!
> >>
> >>>
> >>> Note this requires that the data parameter points to the BAR that
> >>> matches the ReBAR control register, this needs adjusting in
> >>> init_rebar().
> >> I think I can keep current implementation of init_rebar() and use bars[index] to get the corresponding BAR.
> > 
> > IMO it would be best if you can pass the corresponding bar struct into
> > the handler directly, as that will avoid having to do a PCI read just
> > to get the BAR index from PCI_REBAR_CTRL.  It should also avoid the
> > need for the index and BAR type checks in rebar_ctrl_write().
> OK, if so, then I need to move the logic of getting index from PCI_REBAR_CTRL register and checking the BAR type into init_rebar(), right?

Yes, I think that would be better, as then the check is done only once
at init rather than on every access.

Thanks, Roger.

