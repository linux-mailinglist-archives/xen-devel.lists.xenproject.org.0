Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 772549EC6D2
	for <lists+xen-devel@lfdr.de>; Wed, 11 Dec 2024 09:16:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.854046.1267346 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLHtE-0005Fz-7B; Wed, 11 Dec 2024 08:16:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 854046.1267346; Wed, 11 Dec 2024 08:16:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLHtE-0005Dj-3L; Wed, 11 Dec 2024 08:16:12 +0000
Received: by outflank-mailman (input) for mailman id 854046;
 Wed, 11 Dec 2024 08:16:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YTIw=TE=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tLHtC-0005Dd-Mg
 for xen-devel@lists.xenproject.org; Wed, 11 Dec 2024 08:16:10 +0000
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [2a00:1450:4864:20::529])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2c60fdb3-b798-11ef-99a3-01e77a169b0f;
 Wed, 11 Dec 2024 09:16:08 +0100 (CET)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-5d3f57582a2so785879a12.1
 for <xen-devel@lists.xenproject.org>; Wed, 11 Dec 2024 00:16:08 -0800 (PST)
Received: from localhost ([213.195.123.63]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa678f34c68sm513174566b.38.2024.12.11.00.16.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Dec 2024 00:16:05 -0800 (PST)
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
X-Inumbo-ID: 2c60fdb3-b798-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1733904967; x=1734509767; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Tq3dxAWXy5XJWm3IGlsikCO2oYUrgklOmjblU5npweg=;
        b=TbfhdnpoqvcvQ4UT/xYHrgvgsDlTpGo1swCt4fvb5Md5PseoM/UDliOQq6Ng879smu
         1kpp/lCmekbMSP7Y/ZI9inRMO7XKSY5shyVe2UOvchTMr1NJiEFzJIx9gcJ8BDUTHctr
         +EgKlTqxCTSJT4afP0gbFMDWDBXVorj6cVv3A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733904967; x=1734509767;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Tq3dxAWXy5XJWm3IGlsikCO2oYUrgklOmjblU5npweg=;
        b=t7YxSL+IgBXKQ5wGJcyEoWUYkLOP1tqGnfnWk2yonIIRTlVroZadTkS2NZg4pil3aj
         tO0pENe2YjJNif4pQ0tz4Rl350eqj1uzNebU5iy6a6UocNkVoyM6DNMZj8cJxNUj5lHU
         ok5oQUjyc1Vyo2qW9PXirySZeNTp+1xGRuRpMlP4M/fZlKkr99D6hrxc/S7ekQc8+764
         nxGZM/E1zcEk7zxEJWBVrD1zB1Fr7qO75rpLBOphvqdoaEoGwOYGGwXdWWsNdkA4Wxmg
         Gbk+WGuvdpjAs3XvRItq5+dB2tOKCqxQEGRDV0S3c+E3ry+Uce+nG0RMVvKdPnaatVxc
         pH4Q==
X-Forwarded-Encrypted: i=1; AJvYcCUxvn+yun9RXBt7o9PhzHW6pGQ40SpBEQRNmzvDi75juPch15xQO8ASlnXUP76GY906jM8lF7QGXbM=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy8JqLlOfItQFoV2NKySP7IO1uawTa7rIeYXIJlg/4zTZB+0p9Q
	vxVxC87E6pNa3lrRqap/Pu7RVQppBBLdn2QTeRVMj9DzXACEYhTw6dn6vqrd0Ew=
X-Gm-Gg: ASbGnctYwGcICIRbxNzRftKwYtPPYdGPxDk6L5zsVUhvDiaMJ97sQAJ9GeFucuN6MI3
	7Z4tG36N/0Q8AZBF7Mlpl/fPgH0nkw2UOFfQiOx47XnP4cCZg0plOCJmzyxX28rgz3Ad5df1pRA
	O+fsZtdjIdAuz99aAabr9um8hBinBo/90d+g5v86wW4hyV5L7TuasYDQSeGKK/UFm/7Tm7jqsHH
	38819fOX4+OHboJU9K5c0KadeV8jOj36kZK63/T9WWTrbwvj/m21aAag2Ve21Y=
X-Google-Smtp-Source: AGHT+IFrdx5HjkKQlEgwR0HsqKg8XmEK5Ssr9r9FiZ/JK+6HRbVX7201jJyze882Or/9nWIcZ/FAjQ==
X-Received: by 2002:a17:907:7251:b0:aa6:743e:d621 with SMTP id a640c23a62f3a-aa6b16fcbc7mr160640566b.30.1733904965967;
        Wed, 11 Dec 2024 00:16:05 -0800 (PST)
Date: Wed, 11 Dec 2024 09:16:04 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: "Chen, Jiqian" <Jiqian.Chen@amd.com>
Cc: Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	"Huang, Ray" <Ray.Huang@amd.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v2 1/1] vpci: Add resizable bar support
Message-ID: <Z1lKRLmmtXKCjIDO@macbook.local>
References: <20241202060956.1124162-1-Jiqian.Chen@amd.com>
 <4e4df0ee-67f6-41e3-bfc7-e78011680015@suse.com>
 <BL1PR12MB58499BEB287C4F9711324F71E73D2@BL1PR12MB5849.namprd12.prod.outlook.com>
 <1e0576d9-400e-4483-8dd1-061e215a00cd@suse.com>
 <BL1PR12MB584945F11C271CE137231F7BE73D2@BL1PR12MB5849.namprd12.prod.outlook.com>
 <a07bca59-90d2-4a84-bb47-59157bf5207d@suse.com>
 <Z1glF5FJjnSzRqsB@macbook.local>
 <BL1PR12MB58494BFB7FBB042450189684E73E2@BL1PR12MB5849.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <BL1PR12MB58494BFB7FBB042450189684E73E2@BL1PR12MB5849.namprd12.prod.outlook.com>

On Wed, Dec 11, 2024 at 06:37:30AM +0000, Chen, Jiqian wrote:
> On 2024/12/10 19:25, Roger Pau Monné wrote:
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
> Thank you very much!
> 
> > 
> > Note this requires that the data parameter points to the BAR that
> > matches the ReBAR control register, this needs adjusting in
> > init_rebar().
> I think I can keep current implementation of init_rebar() and use bars[index] to get the corresponding BAR.

IMO it would be best if you can pass the corresponding bar struct into
the handler directly, as that will avoid having to do a PCI read just
to get the BAR index from PCI_REBAR_CTRL.  It should also avoid the
need for the index and BAR type checks in rebar_ctrl_write().

Thanks, Roger.

