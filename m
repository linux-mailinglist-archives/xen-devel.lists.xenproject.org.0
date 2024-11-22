Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CB9B69D5A81
	for <lists+xen-devel@lfdr.de>; Fri, 22 Nov 2024 08:58:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.841746.1257245 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tEOYn-0005VP-N3; Fri, 22 Nov 2024 07:58:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 841746.1257245; Fri, 22 Nov 2024 07:58:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tEOYn-0005T0-KZ; Fri, 22 Nov 2024 07:58:37 +0000
Received: by outflank-mailman (input) for mailman id 841746;
 Fri, 22 Nov 2024 07:58:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PYSV=SR=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tEOYm-0005Su-OU
 for xen-devel@lists.xenproject.org; Fri, 22 Nov 2024 07:58:36 +0000
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [2a00:1450:4864:20::62c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9236b862-a8a7-11ef-a0cc-8be0dac302b0;
 Fri, 22 Nov 2024 08:58:33 +0100 (CET)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-aa20c733e92so226295266b.0
 for <xen-devel@lists.xenproject.org>; Thu, 21 Nov 2024 23:58:33 -0800 (PST)
Received: from localhost ([213.195.123.63]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa50b52fd20sm66029666b.111.2024.11.21.23.58.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Nov 2024 23:58:33 -0800 (PST)
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
X-Inumbo-ID: 9236b862-a8a7-11ef-a0cc-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo2MmMiLCJoZWxvIjoibWFpbC1lajEteDYyYy5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjkyMzZiODYyLWE4YTctMTFlZi1hMGNjLThiZTBkYWMzMDJiMCIsInRzIjoxNzMyMjYyMzEzLjk0MTcxLCJzZW5kZXIiOiJyb2dlci5wYXVAY2xvdWQuY29tIiwicmVjaXBpZW50IjoieGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnIn0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1732262313; x=1732867113; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xljAT8OSq2IJPduuPZt1Xo4ThQPmaTdw1vaue2jdPzw=;
        b=FgFelfEdkf7ln9MIgveoxRucJv1fl8GGALczKsU0zbYZQZZ/5Px9M93EgtmX3TuF0W
         xnXYCAoI8I/cZ9hqCjEABOB2hjqfb7BBoahP1AoIffBCS9ZzlxaMUirnUZP0GwdTzJD/
         bGdsMZAfyTEclIvvDXuH2psIeMsTdBgHZYua8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732262313; x=1732867113;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xljAT8OSq2IJPduuPZt1Xo4ThQPmaTdw1vaue2jdPzw=;
        b=OH49hn61iXpCATn4C2vvytK3JobI17b7aiA/9UsEylX+dsXPiH8G7SIGxdf3Er8qv0
         4lZFt8VOKGEBzE+cJQJaa6EbeGTgPqmLWwiYTj0XHJLKgRw3EN83cs/1+N/l2yMFhLOR
         +XDSBQniJB9nZhM4JzAcD+k0Bis8pGgJhVFPmsipBohCmNxNAygcA2rhWZVyo8yUx6Me
         ARm7FlfPospDZR9gb+QbV2l5L0R+atzzRb97ArzVt4o6uRqRV+iCaq08lxvlkzeGnaqX
         JQH0NLF64uI03jE7y6Ibwy8RMxMdYcD3RgezjYwcmmKRCvOankbTe8iAIw8dqoJBOmoK
         31qA==
X-Gm-Message-State: AOJu0YzpacAKoGLrUBIAh/Z/vaRrQeXcVt5yl6T52q1kDyLiHN897psm
	3P47YAyFUtaKUoRDaVpQVep0t/g5mmchTrYEzsAEa7tKv1MW16tjpRy8idLoFZ0=
X-Gm-Gg: ASbGncvtRmoYBBQSQolEBnlLWE9UjTfy6unlZFT214P7nkT5QAlBAyJB5kpmaL9cNNE
	rRx56KhYwdxwocpCqCobWNg1+h4QhLTd/ylmaeUAscD/rWMDW3zIAhH1gKMvCebPdf0TKh7sisK
	EAhJJAKGvT+VKky9LL2HDxZntD0qMd+Lr21W8mNXkFkgvYLfi6RbJjIkvciPmSVwtMF1FkoBW/R
	a22x8T5nptRK0xve3m4Wx/3nHaDVa6dmZWnLy45IBQ0wezwp0oXCbLfems=
X-Google-Smtp-Source: AGHT+IFwfmv2teB7NhwKeZl2XyE+GpnJRho31qpcmbuhUPJpKPJ7w64IL4sBXbjP8lprAWLWS47cvQ==
X-Received: by 2002:a17:907:2cf0:b0:a99:da6c:f607 with SMTP id a640c23a62f3a-aa509d2138bmr149829566b.44.1732262313355;
        Thu, 21 Nov 2024 23:58:33 -0800 (PST)
Date: Fri, 22 Nov 2024 08:58:32 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: "Chen, Jiqian" <Jiqian.Chen@amd.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH] vpci: Add resizable bar support
Message-ID: <Z0A5qHd2AqrsuRFr@macbook>
References: <ZzY1O-zrcWB6Ra3q@macbook>
 <BL1PR12MB5849FC8077C7C6035F1D3E15E7242@BL1PR12MB5849.namprd12.prod.outlook.com>
 <ZzczqznFbixk3Vfu@macbook>
 <BL1PR12MB5849894360DB8D96073AB21EE7272@BL1PR12MB5849.namprd12.prod.outlook.com>
 <ZzyIk0KipX8LPZNv@macbook>
 <BL1PR12MB5849FC514034CDFC2F68BA6FE7212@BL1PR12MB5849.namprd12.prod.outlook.com>
 <Zz2lgkjgRoZ7Sr5Q@macbook>
 <BL1PR12MB5849F5382CF3A03C080C4CA4E7222@BL1PR12MB5849.namprd12.prod.outlook.com>
 <Zz8Cwj3KJ1BIBEg_@macbook>
 <BL1PR12MB5849786A66C48A85202F40C5E7232@BL1PR12MB5849.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <BL1PR12MB5849786A66C48A85202F40C5E7232@BL1PR12MB5849.namprd12.prod.outlook.com>

On Fri, Nov 22, 2024 at 04:04:05AM +0000, Chen, Jiqian wrote:
> On 2024/11/21 17:52, Roger Pau Monné wrote:
> > On Thu, Nov 21, 2024 at 03:05:14AM +0000, Chen, Jiqian wrote:
> >> On 2024/11/20 17:01, Roger Pau Monné wrote:
> >>> On Wed, Nov 20, 2024 at 03:01:57AM +0000, Chen, Jiqian wrote:
> >>>> The only difference between our methods is the timing of updating the size.
> >>>> Yours is later than mine because you updated the size when the driver re-enabled memory decoding, while I updated the size in time when driver resize it.
> >>>
> >>> Indeed, my last guess is the stale cached size is somehow used in my
> >>> approach, and that leads to the failures.  One last (possibly dummy?)
> >>> thing to try might be to use your patch to detect writes to the resize
> >>> control register, but update the BAR sizes in modify_bars(), while
> >>> keeping the traces of when the operations happen.
> >>>
> >> This can work, combine our method, use my patch to detect and write the size into hardware register, and use your patch to update bar[i].size in modify_bars().
> >> Attached the combined patch and the xl dmesg.
> > 
> > This is even weirder, so the attached patch works fine? 
> Yes, it works fine.
> And I will double check.
> 
> > The only difference with my proposal is that you trap the CTRL registers, but
> > the sizing is still done in modify_bars().
> > 
> > What happens if (based on the attached patch) you change
> > rebar_ctrl_write() to:
> > 
> > static void cf_check rebar_ctrl_write(const struct pci_dev *pdev,
> >                                       unsigned int reg,
> >                                       uint32_t val,
> >                                       void *data)
> > {
> >     pci_conf_write32(pdev->sbdf, reg, val);
> > }
> Will try.
> 
> > 
> > And if you don't trap any PCI_REBAR_CTRL at all?
> What do you mean? If I don't trap any rebar_ctrl, how can I call rebar_ctrl_write?

Well, that's part of the question, is just trapping PCI_REBAR_CTRL
enough to make this work?

At the moment it's unclear to me what makes your approach work and not
mine.  And I would like to understand why your code works, otherwise
I fear I'm not understanding how the capability works, and hence our
support for it might not be reliable.

Thanks, Roger.

