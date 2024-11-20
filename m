Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 41D559D350C
	for <lists+xen-devel@lfdr.de>; Wed, 20 Nov 2024 09:08:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.840938.1256457 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tDfja-00028o-Tg; Wed, 20 Nov 2024 08:06:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 840938.1256457; Wed, 20 Nov 2024 08:06:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tDfja-00026f-Qu; Wed, 20 Nov 2024 08:06:46 +0000
Received: by outflank-mailman (input) for mailman id 840938;
 Wed, 20 Nov 2024 08:06:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=E1p6=SP=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tDfjZ-00026Z-1H
 for xen-devel@lists.xenproject.org; Wed, 20 Nov 2024 08:06:45 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5f07beec-a716-11ef-a0cb-8be0dac302b0;
 Wed, 20 Nov 2024 09:06:39 +0100 (CET)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-aa1e6ecd353so313340966b.1
 for <xen-devel@lists.xenproject.org>; Wed, 20 Nov 2024 00:06:40 -0800 (PST)
Received: from localhost ([213.195.123.63]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5cff453e53fsm526737a12.61.2024.11.20.00.06.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Nov 2024 00:06:38 -0800 (PST)
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
X-Inumbo-ID: 5f07beec-a716-11ef-a0cb-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo2MzUiLCJoZWxvIjoibWFpbC1lajEteDYzNS5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjVmMDdiZWVjLWE3MTYtMTFlZi1hMGNiLThiZTBkYWMzMDJiMCIsInRzIjoxNzMyMDg5OTk5Ljk1ODUyNywic2VuZGVyIjoicm9nZXIucGF1QGNsb3VkLmNvbSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1732089999; x=1732694799; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=tRXxDYXtttUmygedL/iA4y/BzhFVMPguzG8BHAYhXBY=;
        b=FdpM9IP9e65zO8XQ1F+nakFEjjG9TYI9QCVMStbgsyDdOPmKSelPMR0nYdPZTKxMAx
         mQYZx4/UXifaveCh+K1KheHDbkuF1fl91t+DIXewmSK0tyZ6iSC1HL3oSMn+BMfLFIrq
         sR/ivtuPKA+k3MED6qj5f6E3ZYBdBOpRA+088=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732089999; x=1732694799;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tRXxDYXtttUmygedL/iA4y/BzhFVMPguzG8BHAYhXBY=;
        b=R4OVybiB+VpseihDpW96+YFziHTESYh1TZU3h9PwXFZUNugq5RvB6KuMzuNf0CYcH3
         o6YPV7GzxiyCRD29Y1bC7mLiIIJfzB00QGKU6ka+Fbe/+71X32LxTmbdFWZcZEdTAG6G
         Dw0rDnaQn1os7w0J+Izsw84IspP/rdfvqWvi+4l6BzuxJI5509Va9MJXLgxGGjlMclRZ
         G/uzt0W1Vu4zwn3k7XcO0TCcFmGmeT+SV+cQ1oQwqeztIMg3n9udXwlmod0hTwY/bd/U
         YmCOBosFOnKNboS//3DX+LNGsnKRZbu3vqz5n4pmHIDLvNm/fbzbVeiH1VIIzNhlJtdn
         TZ+A==
X-Forwarded-Encrypted: i=1; AJvYcCU9U9dIwH1wJzT2f5y4bBlb7yV1EV/laTr8n+iUSzikekCmU97cvPRHq8D2NhSRH/gHQJqb1X77mUc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxU0N6JyEoM7ojdjhCIBz0osmPTTAOYEIknTWjE8LKnMSilaEZa
	4RHfQt8Ql9XHGAIZTIs4byXJICgM7dOfjS1PgVASqTkLXs9+fuSsE9KYQm6vdAxBpjBVl0xlvw4
	C
X-Google-Smtp-Source: AGHT+IEoK5gfY81dj9x21Eh+PyoFlR/7y/ec2B//6IqcDJp0Xq5R/nQbcwx1naLdS+vi4sGy6PyiuA==
X-Received: by 2002:a05:6402:3511:b0:5ce:de19:472a with SMTP id 4fb4d7f45d1cf-5cff4c3474emr1452537a12.16.1732089999476;
        Wed, 20 Nov 2024 00:06:39 -0800 (PST)
Date: Wed, 20 Nov 2024 09:06:37 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: "Chen, Jiqian" <Jiqian.Chen@amd.com>
Cc: Jan Beulich <jbeulich@suse.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH] vpci: Add resizable bar support
Message-ID: <Zz2YjdWyyVgu1xhl@macbook>
References: <20241113080027.244240-1-Jiqian.Chen@amd.com>
 <ZzsUL3dnjl5x0-si@macbook>
 <BL1PR12MB5849F6F7A4E86E0209AB152AE7202@BL1PR12MB5849.namprd12.prod.outlook.com>
 <5262adaf-2ff7-47ea-8c13-c544b31e4115@suse.com>
 <BL1PR12MB5849199069AA4C9F3837031CE7212@BL1PR12MB5849.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <BL1PR12MB5849199069AA4C9F3837031CE7212@BL1PR12MB5849.namprd12.prod.outlook.com>

On Wed, Nov 20, 2024 at 02:26:31AM +0000, Chen, Jiqian wrote:
> On 2024/11/19 15:44, Jan Beulich wrote:
> > On 19.11.2024 08:31, Chen, Jiqian wrote:
> >> On 2024/11/18 18:17, Roger Pau Monné wrote:
> >>> On Wed, Nov 13, 2024 at 04:00:27PM +0800, Jiqian Chen wrote:
> >>>> +static void cf_check rebar_ctrl_write(const struct pci_dev *pdev,
> >>>> +                                      unsigned int reg,
> >>>> +                                      uint32_t val,
> >>>> +                                      void *data)
> >>>> +{
> >>>> +    uint32_t ctrl, index;
> >>>
> >>> index should better be unsigned int, as it's the BAR index [0, 5], and
> >>> so fits perfectly in an unsigned int.
> >>>
> >>>> +    struct vpci_bar *bars = pdev->vpci->header.bars;
> >>>
> >>> You could pass bars as the data parameter.
> >>>
> >>> Additionally you need to check that memory decoding is not enabled for
> >>> the device, otherwise attempting to change the BAR size will lead to
> >>> the active p2m mappings getting out of sync w.r.t. the new BAR size.
> >>>
> >>>> +
> >>>> +    ctrl = pci_conf_read32(pdev->sbdf, reg);
> >>>> +    if ( ctrl == val )
> >>>> +        return;
> >>>
> >>> I would still carry out the write in this case, as that's what the
> >>> owner of the device requested.
> >>>
> >>>> +
> >>>> +    ctrl &= ~PCI_REBAR_CTRL_BAR_SIZE;
> >>>> +    if ( ctrl != ( val & ~PCI_REBAR_CTRL_BAR_SIZE ) )
> >>>                      ^ extra space here and         ^ here
> >>>> +        return;
> >>>
> >>> The feature only being exposed to dom0 ATM, I would suggest we allow
> >>> it to write any bits it wants in the control register, as that would
> >>> be what the OS would do when not running as a guest.
> >> But only PCI_REBAR_CTRL_BAR_SIZE bits of REBAR_CTRL register are RW, others are RO.
> >> Is removing the check here fine?
> > 
> > A native kernel would write the full register (with r/o bits simply not
> > getting updated). Hence for Dom0 we ought to do the same, just in case
> > e.g. some future spec declares some other bit(s) writable.
> Got it, thanks for explaining.
> 
> > 
> >>>> +
> >>>> +    index = ctrl & PCI_REBAR_CTRL_BAR_IDX;
> >>>
> >>> Some sanity checking of the BAR index might be good.  At least a check
> >>> that the BAR is of type VPCI_BAR_MEM64_LO or VPCI_BAR_MEM32.
> >> But the information of the BAR that support resizing is from hardware(when init_rebar), that shouldn't have any problems and doesn't need to check the BAR's info.
> > 
> > Right, but also better to avoid confusing ourselves over bogus hardware.
> OK, will add some check for the index range and the bar's type.
> 
> > 
> >>>> +    bars[index].size = (1 << ((val & PCI_REBAR_CTRL_BAR_SIZE) >>
> >>>> +                              PCI_REBAR_CTRL_BAR_SHIFT)) *
> >>>> +                       PCI_REBAR_CTRL_BAR_UNIT;
> >>>
> >>> This would better be a macro in pci_regs.h I think, and you need to
> >>> use 1UL, plus using MASK_EXTR() simplifies it:
> >>>
> >>> PCI_REBAR_CTRL_SIZE(v) (1UL << (MASK_EXTR(v, PCI_REBAR_CTRL_BAR_SIZE) + 20))
> >> OK, another question: Should I need to check the size is allowed by hardware(the PCI_REBAR_CAP_SIZES bits in PCI_REBAR_CAP)?
> > 
> > Probably better to do so, yes. Whether to reject bogus attempts or
> > merely warn about them I'm less certain: It's (see above) Dom0, after
> > all.
> I would like to if the new size is allowed by hardware, then update the size, otherwise do nothing.

I'm of the opinion that dom0 shouldn't be restricted like this: dom0
might have more information than Xen about the device.  Xen might
detect the size as invalid, but dom0 might have extra information (or
quirks) about this specific device that make the size valid.

I would just add a warning.

Thanks, Roger.

