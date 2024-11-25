Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 059A89D859A
	for <lists+xen-devel@lfdr.de>; Mon, 25 Nov 2024 13:47:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.842525.1258060 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tFYUy-0003bW-9k; Mon, 25 Nov 2024 12:47:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 842525.1258060; Mon, 25 Nov 2024 12:47:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tFYUy-0003YS-74; Mon, 25 Nov 2024 12:47:28 +0000
Received: by outflank-mailman (input) for mailman id 842525;
 Mon, 25 Nov 2024 12:47:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=p6X4=SU=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tFYUv-0003YM-RW
 for xen-devel@lists.xenproject.org; Mon, 25 Nov 2024 12:47:25 +0000
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [2a00:1450:4864:20::631])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 69d795f3-ab2b-11ef-a0cd-8be0dac302b0;
 Mon, 25 Nov 2024 13:47:22 +0100 (CET)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-a9f1c590ecdso719716166b.1
 for <xen-devel@lists.xenproject.org>; Mon, 25 Nov 2024 04:47:22 -0800 (PST)
Received: from localhost ([213.195.123.63]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa50b3457basm459236766b.89.2024.11.25.04.47.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Nov 2024 04:47:21 -0800 (PST)
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
X-Inumbo-ID: 69d795f3-ab2b-11ef-a0cd-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo2MzEiLCJoZWxvIjoibWFpbC1lajEteDYzMS5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjY5ZDc5NWYzLWFiMmItMTFlZi1hMGNkLThiZTBkYWMzMDJiMCIsInRzIjoxNzMyNTM4ODQyLjExNjAyMywic2VuZGVyIjoicm9nZXIucGF1QGNsb3VkLmNvbSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1732538842; x=1733143642; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=c/MZ7qQPDZn9WoacarwXEZFSPAJiR4wFq7rrJBnJSPc=;
        b=Wfe1AKFTERSq5w0rlc3L81Zu+68qZoYTksxIX+Hf4lINjqpA3BbVBb4FFthw06pZA/
         ZS9C6WXnXlVek+je9oMuU+YRJl5yUnQcVgwEliByDVSRQm69dfXpaFQwnDs+1lXKYZGZ
         O/AJ3hroIBLJEtqtVIVyX7xFSFDH20k2TSkY4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732538842; x=1733143642;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=c/MZ7qQPDZn9WoacarwXEZFSPAJiR4wFq7rrJBnJSPc=;
        b=TctTwPNXKUyeFAs0JYCWjDK/JPLPZtxvg6AgR2BXRQWt+MjZqWBKpO0/oggSD0YqpY
         OxpZPHRYpMkz8FblYJkUQG+NyBcg14Qm9xE4YrZxJO3z7/jvs/V5cwPjbqj8CrwQO6X2
         BTWbKjmZ3ip9HYmCUxibDLWHIL9RV2/kynR+/0eOxkHGQbMDLidoc/k3G7WfUuCErFCZ
         i90LISaMHncJv7PCYjmJtMN9Q6bB2Htk3q0wsOIIPCMsVNVfuRol5vrA6w82rQt1iBHS
         PulWtsnJNPZR0NCdYv9S3y5TKudrIiTSdZvmyjCY6dYFeAqGzII6clBsz6tFzaMiHaFW
         GxFA==
X-Gm-Message-State: AOJu0YxUPGprL/MuVLmSN1jeysCqwb6hun+Gp12atOie4EUM6XuUHGys
	vWa/zGjiRVWG5CzxKYNEwIm4agqdx2qawh8bDCkfJzk6fX5P48yfnem9T4uRpzotdYeaKE1u0GO
	e
X-Gm-Gg: ASbGncsrsQjhaiUkT73izuRulZCscy+/uEtE5THjBNbYRkGJZ8mN6X8Vi3bVvUgWNi1
	K6P3HeiQqCsSOMaPflq2o7gKLs9raHL0cZ8hfuSrK5K0mO8G4DsrznzOCsMp2Oh1KeGYRCkAbxb
	PJ13rDRHTWytMJoBFcdixXhevagP4utryd9ZFbDCwykjIuLtzhZWGYBDwZL69N8Z+Mpol22gQSz
	mhC5S8a929F6xRfxouqdqQS0Z+GG/bnobxCvZLRI/kujuXE4Q5JUoVF6EQ=
X-Google-Smtp-Source: AGHT+IHqV+ajEDv5I+yDuledBOFjyNwnB2We4iC4jejfiGmbRyn0J7/gFRy4CrYrZsvXoQv9hBJYhw==
X-Received: by 2002:a17:906:31c1:b0:aa5:1d68:1ec8 with SMTP id a640c23a62f3a-aa51d681fc8mr1023719566b.7.1732538841988;
        Mon, 25 Nov 2024 04:47:21 -0800 (PST)
Date: Mon, 25 Nov 2024 13:47:20 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: "Chen, Jiqian" <Jiqian.Chen@amd.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH] vpci: Add resizable bar support
Message-ID: <Z0Rx2IXqqvrLaIIq@macbook>
References: <ZzY1O-zrcWB6Ra3q@macbook>
 <BL1PR12MB5849FC8077C7C6035F1D3E15E7242@BL1PR12MB5849.namprd12.prod.outlook.com>
 <ZzczqznFbixk3Vfu@macbook>
 <BL1PR12MB5849894360DB8D96073AB21EE7272@BL1PR12MB5849.namprd12.prod.outlook.com>
 <ZzyIk0KipX8LPZNv@macbook>
 <BL1PR12MB5849FC514034CDFC2F68BA6FE7212@BL1PR12MB5849.namprd12.prod.outlook.com>
 <Zz2lgkjgRoZ7Sr5Q@macbook>
 <BL1PR12MB5849F5382CF3A03C080C4CA4E7222@BL1PR12MB5849.namprd12.prod.outlook.com>
 <Zz8Cwj3KJ1BIBEg_@macbook>
 <BL1PR12MB584977971D2C0A00443A1A79E72E2@BL1PR12MB5849.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <BL1PR12MB584977971D2C0A00443A1A79E72E2@BL1PR12MB5849.namprd12.prod.outlook.com>

On Mon, Nov 25, 2024 at 03:44:52AM +0000, Chen, Jiqian wrote:
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
> > This is even weirder, so the attached patch works fine?  The only
> > difference with my proposal is that you trap the CTRL registers, but
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
> > 
> If I change rebar_ctrl_write() to:
> static void cf_check rebar_ctrl_write(const struct pci_dev *pdev,
>                                       unsigned int reg,
>                                       uint32_t val,
>                                       void *data)
> {
>     printk("cjq_debug %pp: bar ctrl write reg %u, val %x\n", &pdev->sbdf, reg, val);
>     pci_conf_write32(pdev->sbdf, reg, val);
> }
> 
> I can see three time prints, it can't work.
> (XEN) cjq_debug 0000:03:00.0: bar ctrl write reg 520, val d40
> (XEN) cjq_debug 0000:03:00.0: bar ctrl write reg 520, val d40
> (XEN) cjq_debug 0000:03:00.0: bar ctrl write reg 528, val 102
> 
> If I change rebar_ctrl_write() to:
> static void cf_check rebar_ctrl_write(const struct pci_dev *pdev,
>                                       unsigned int reg,
>                                       uint32_t val,
>                                       void *data)
> {
>     if ( pci_conf_read16(pdev->sbdf, PCI_COMMAND) & PCI_COMMAND_MEMORY )
>         return;
>     printk("cjq_debug %pp: bar ctrl write reg %u, val %x\n", &pdev->sbdf, reg, val);
>     pci_conf_write32(pdev->sbdf, reg, val);
> } 
> 
> I can only see one time print:
> (XEN) cjq_debug 0000:03:00.0: bar ctrl write reg 520, val d40
> 
> The check prevented the two times incorrect write actions.
>     if ( pci_conf_read16(pdev->sbdf, PCI_COMMAND) & PCI_COMMAND_MEMORY )
>         return;
> 
> And why my original patch can work too, the check:
> +    ctrl = pci_conf_read32(pdev->sbdf, reg);
> +    if ( ctrl == val )
> +        return;
> happened to play the same role as PCI_COMMAND_MEMORY check.

Thank you very much for figuring this out.  So in the end it's a bug
in the driver that plays with PCI_REBAR_CTRL with memory decoding
enabled.

Won't this also cause issues when running natively without Xen?

I think we have no other option but to trap accesses to the capability
registers themselves in order to ensure a minimum amount of sanity
(iow: no writes to the ReBAR control registers decoding is enabled).

Thanks, Roger.

