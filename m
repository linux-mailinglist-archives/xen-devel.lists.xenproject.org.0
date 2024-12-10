Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FD439EB152
	for <lists+xen-devel@lfdr.de>; Tue, 10 Dec 2024 13:55:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.852295.1266129 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tKzlS-0004vd-Ip; Tue, 10 Dec 2024 12:54:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 852295.1266129; Tue, 10 Dec 2024 12:54:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tKzlS-0004tG-Fa; Tue, 10 Dec 2024 12:54:58 +0000
Received: by outflank-mailman (input) for mailman id 852295;
 Tue, 10 Dec 2024 12:54:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+Xbj=TD=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tKzlR-0004tA-RO
 for xen-devel@lists.xenproject.org; Tue, 10 Dec 2024 12:54:57 +0000
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [2a00:1450:4864:20::52b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f4fa2376-b6f5-11ef-a0d5-8be0dac302b0;
 Tue, 10 Dec 2024 13:54:56 +0100 (CET)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-5d3ea065b79so4069141a12.3
 for <xen-devel@lists.xenproject.org>; Tue, 10 Dec 2024 04:54:56 -0800 (PST)
Received: from localhost ([213.195.123.63]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5d3d0f93d54sm5993599a12.68.2024.12.10.04.54.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Dec 2024 04:54:55 -0800 (PST)
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
X-Inumbo-ID: f4fa2376-b6f5-11ef-a0d5-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1733835296; x=1734440096; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=t4FHQghY5NHT28aQifRvJszhRcycJD9eQp9/X19JOAo=;
        b=ODp+KRSY1S7NfLqeihpZg/jYAGDLjly7GyfMT5Y8SNqHulY6AXRt2fwSyPjuPGtVKl
         6FPvVwJhculTEPA47MD1/6M0oF4wh/VAd2ay+2IzhbUeYb6uV+X9OMl348Tr9yidh4gS
         v/eYpRdJiUTsWUOqNGiHy+nOcXUfvgzU6NeGY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733835296; x=1734440096;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=t4FHQghY5NHT28aQifRvJszhRcycJD9eQp9/X19JOAo=;
        b=hXaXvhGwhS24QAGGkfbAHvkfyXKZwCNfXDDE8IiHMrZ75e04QM2ppgZPTlnf3qWEEo
         QYsvx0oJqTcsn52ozssk+IX/vyi6BzgF+laP/yunHmd61v3O/ijjuBmzr1TPnmVMSyAu
         hJ8rbRMDlMBllCFHgS3j3UFmpo8lm4BnjcczlVlY5J95Z8ildDXMHRa/XC/kGIIa4Vn6
         L5YYhPhLPTt0Lj+SZASKPH7iBSDCMJxvriqDd1DfA1Gl2xXdIm8krcI+Vq8WHV0B8kUb
         5XGCWMYPiHVx5ytn47W9oBa3QtohlLiKnHX0uZrGj85Hx+Uc1+oitZnq7+TYojld28t9
         Ebuw==
X-Forwarded-Encrypted: i=1; AJvYcCWZ9XTIOtnzI+FUShwrZFcDxxIbJeio/BHY4kOuGDNvm/lgwRavuPLZlrAOzYtQhmgPwxrFaWViBck=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx9wtpUmi9aE6X7VKiQE3wECPlPFWytIfk9e99rtbi7SgLvWoIm
	VK/JIpfMQszpfIaSTfH1phIgVeV3UqsJ3RyUwlUvqwxzu3+S54MinWYhxxKMmcE=
X-Gm-Gg: ASbGncsZzg+A/1u2QIfGxtFiDezvyhyQCXXjkCqrXpm40JXQFWz9vzaEjyu2pERGBn1
	qUeesL5m2L3X1dDLLmZTv4w6PGXCdKTYVZzvkAQJGbrCmOQ5ZwYbBpdC7/0Bsgb1tUVsm/5Oagn
	RfXPluxL5ctBGsxIHo6nEA4bMvpiFenZi6PWHxcplMp+JefNl9ZhSysDUlxqaaMH6umbxlt0jOe
	CnspH2knDgjypebqYe8SzvxleAnfp2jf2hlfpXuLWthemmRwzzzdgrO12lMARw=
X-Google-Smtp-Source: AGHT+IHxZXYum4p28zMZQkx84l+YU6NFwuzHrQpuV+qKlnbgSpLdI9epxpsIqaoi4IiQBq5LnXrT5g==
X-Received: by 2002:a05:6402:3490:b0:5d2:7396:b0ce with SMTP id 4fb4d7f45d1cf-5d4185029c2mr5927451a12.3.1733835296092;
        Tue, 10 Dec 2024 04:54:56 -0800 (PST)
Date: Tue, 10 Dec 2024 13:54:54 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "Chen, Jiqian" <Jiqian.Chen@amd.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	"Huang, Ray" <Ray.Huang@amd.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v2 1/1] vpci: Add resizable bar support
Message-ID: <Z1g6HrWc7CF7K1cR@macbook.local>
References: <20241202060956.1124162-1-Jiqian.Chen@amd.com>
 <4e4df0ee-67f6-41e3-bfc7-e78011680015@suse.com>
 <BL1PR12MB58499BEB287C4F9711324F71E73D2@BL1PR12MB5849.namprd12.prod.outlook.com>
 <1e0576d9-400e-4483-8dd1-061e215a00cd@suse.com>
 <BL1PR12MB584945F11C271CE137231F7BE73D2@BL1PR12MB5849.namprd12.prod.outlook.com>
 <a07bca59-90d2-4a84-bb47-59157bf5207d@suse.com>
 <Z1glF5FJjnSzRqsB@macbook.local>
 <e3231310-0041-44f8-b92b-989992c64d0a@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e3231310-0041-44f8-b92b-989992c64d0a@suse.com>

On Tue, Dec 10, 2024 at 01:15:00PM +0100, Jan Beulich wrote:
> On 10.12.2024 12:25, Roger Pau Monné wrote:
> > On Tue, Dec 10, 2024 at 10:54:43AM +0100, Jan Beulich wrote:
> >> On 10.12.2024 08:57, Chen, Jiqian wrote:
> >>> On 2024/12/10 15:17, Jan Beulich wrote:
> >>>> On 10.12.2024 08:07, Chen, Jiqian wrote:
> >>>>> On 2024/12/9 21:59, Jan Beulich wrote:
> >>>>>> On 02.12.2024 07:09, Jiqian Chen wrote:
> >>>>>>> +static void cf_check rebar_ctrl_write(const struct pci_dev *pdev,
> >>>>>>> +                                      unsigned int reg,
> >>>>>>> +                                      uint32_t val,
> >>>>>>> +                                      void *data)
> >>>>>>> +{
> >>>>>>> +    uint64_t size;
> >>>>>>> +    unsigned int index;
> >>>>>>> +    struct vpci_bar *bars = data;
> >>>>>>> +
> >>>>>>> +    if ( pci_conf_read16(pdev->sbdf, PCI_COMMAND) & PCI_COMMAND_MEMORY )
> >>>>>>> +        return;
> >>>>>>
> >>>>>> I don't think something like this can go uncommented. I don't think the
> >>>>>> spec mandates to drop writes in this situation?
> >>>>> Spec says: Software must clear the Memory Space Enable bit in the Command register before writing the BAR Size field.
> >>>>> This check is suggested by Roger and it really helps to prevent erroneous writes in this case,
> >>>>> such as the result of debugging with Roger in the previous version.
> >>>>> I will add the spec's sentences as comments here in next version.
> >>>>
> >>>> What you quote from the spec may not be enough as a comment here. There's
> >>>> no direct implication that the write would simply be dropped on the floor
> >>>> if the bit is still set. So I think you want to go a little beyond just
> >>>> quoting from the spec.
> >>> How about quoting Roger's previous words: " The memory decoding must be disabled before writing the BAR size field.
> >>> Otherwise changing the BAR size will lead to the active p2m mappings getting out of sync w.r.t. the new BAR size." ?
> >>
> >> That'll be better, but imo still not enough to explain the outright ignoring
> >> of the write.
> > 
> > I think we might want to do something along the lines of:
> > 
> > uint64_t size = PCI_REBAR_CTRL_SIZE(val);
> > struct vpci_bar *bar = data;
> > 
> > if ( bar->enabled )
> > {
> >     if ( size == bar->size )
> >         return;
> > 
> >     /*
> >      * Refuse to resize a BAR while memory decoding is enabled, as
> >      * otherwise the size of the mapped region in the p2m would become
> >      * stale with the newly set BAR size, and the position of the BAR
> >      * would be reset to undefined.  Note the PCIe specification also
> >      * forbids resizing a BAR with memory decoding enabled.
> >      */
> >     gprintk(XENLOG_ERR,
> >             "%pp: refuse to resize BAR with memory decoding enabled\n",
> > 	    &pci->sbdf);
> >     return;
> > }
> > 
> > Note this requires that the data parameter points to the BAR that
> > matches the ReBAR control register, this needs adjusting in
> > init_rebar().
> 
> SGTM.

One nit that I'm kind of unsure, is whether writing the ReBAR with the
same BAR size as it's currently set also causes the matching BAR
register to be reset.  I'm unsure whether dropping the write when size
== bar->size without logging a message is appropriate, as it could be
a change in behavior if the software expects the BAR position to be
reset.

Thanks, Roger.

