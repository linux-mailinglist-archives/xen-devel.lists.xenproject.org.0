Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CD121A17A2E
	for <lists+xen-devel@lfdr.de>; Tue, 21 Jan 2025 10:29:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.875198.1285579 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1taAZM-0001Mh-Ly; Tue, 21 Jan 2025 09:29:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 875198.1285579; Tue, 21 Jan 2025 09:29:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1taAZM-0001KM-Ie; Tue, 21 Jan 2025 09:29:12 +0000
Received: by outflank-mailman (input) for mailman id 875198;
 Tue, 21 Jan 2025 09:29:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jEc5=UN=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1taAZK-0001KG-9l
 for xen-devel@lists.xenproject.org; Tue, 21 Jan 2025 09:29:10 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2a79241b-d7da-11ef-a0e4-8be0dac302b0;
 Tue, 21 Jan 2025 10:29:09 +0100 (CET)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-aaf900cc7fbso894483766b.3
 for <xen-devel@lists.xenproject.org>; Tue, 21 Jan 2025 01:29:08 -0800 (PST)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab644adb658sm57199666b.134.2025.01.21.01.29.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jan 2025 01:29:07 -0800 (PST)
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
X-Inumbo-ID: 2a79241b-d7da-11ef-a0e4-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1737451748; x=1738056548; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GvJEpUlaCpSa5xrAbtwL2ucNycSaZ8DMf4Zq0g3iUCE=;
        b=bn6abcNGIFrmamYxXvqxSsK2oyqCFO8sdPxCnb5AU1n+Dgh12mNfLMSjOK9i4O5SOm
         QlZYil7zLF056IFTG4Zai4BpZgK0i9OzG0lwToJENemlzAYxyaz+GnYpNN/5Ik6jCLQU
         JIshCyI+lHiKKaDjqcHNyyEaRp9V1h+DP2PJE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737451748; x=1738056548;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GvJEpUlaCpSa5xrAbtwL2ucNycSaZ8DMf4Zq0g3iUCE=;
        b=Hw+Ugm5u8hzSXzY8SLDs+rU9Hnn7BjHDrPmsuiHW3PbQHfUKzbzSTL2JO8iX9wD+N8
         KjEHJY8A+8c9W5r7k9RF4sYR7Sfz0S4z2P5wVc4qwHVZy65E2IQXhhzVo+iDKfBVlytU
         ydsvh2066dUZfn52W83ZYj2luWFSYF0iFvr7GrXv8Ko6NJ3C1gZixKRudlinYnmFAlkc
         RQwvnhqMeAsl42ElHZH0u6+vaKM72M9DXYJPqp6o5dnfJpdyGxPM/llelnQ9GyHPb8UW
         1GSzxz4h1oqGjJ5hUzdcs29HNwD9f89rL+n14JhrN6mpsYRmMQKJ2xEpbQ9YuoBsakhz
         bGBw==
X-Forwarded-Encrypted: i=1; AJvYcCVElCcqYbTIwcRbK+cfop/QrzyeuMo+EH/aUGjiIHp1X99f95DtFtGVWoBiF0cQN+D2vwSm+r+NGqY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxYq8dKeGKd0wtBDRAcJK5M52K7kEW89Nn2O/wdZG/QAN369U1e
	EdfAbvOGrK3sFGgtW8D80+Xv0CWiKRl3twV2VdFQ56T5EfCJJ9BuoDw/AlyFyZ4=
X-Gm-Gg: ASbGncvyDY5CURB1bvPIAaof5OENNjPUaQySqa9CHNbpGsRY44Vw6v54bxGbWqzPWYg
	OD+vTNDgrUprWdf+PkvBnVgP84kpI5QXqDYthicFNGcEUOH18gKdrBtS0Y5ApqZvMhzlTwaegf4
	Slx49C8V004/C3OkrZXq04CLTEFdarGMpRCcPz1RagZXTeO9rHYlou+a5CAa4B8kPp7KS7sFhP8
	DPfOuAxQfm2o+wnbVmxr8YBhCaxpAIvrNexwGbssm+9u8uNGUrpYBD3FcPJTCZwHagVt2zxkwk=
X-Google-Smtp-Source: AGHT+IGswEwVXXzTKLYyvM7Jam5pW0T7DgM5GLV0NMC4GIai2nKx2ULjAk42kPDcqavcwsds+qxWyA==
X-Received: by 2002:a17:907:2d2c:b0:ab2:faed:f180 with SMTP id a640c23a62f3a-ab38b18bf29mr1705692866b.33.1737451748250;
        Tue, 21 Jan 2025 01:29:08 -0800 (PST)
Date: Tue, 21 Jan 2025 10:29:06 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: "Chen, Jiqian" <Jiqian.Chen@amd.com>
Cc: Jan Beulich <jbeulich@suse.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	"Huang, Ray" <Ray.Huang@amd.com>
Subject: Re: [PATCH v5] vpci: Add resizable bar support
Message-ID: <Z49o4iyY7vPhz2ow@macbook.local>
References: <20250114032636.3698383-1-Jiqian.Chen@amd.com>
 <Z49e8NmROzke-tYc@macbook.local>
 <BL1PR12MB58492016DDBB106A607F32CDE7E62@BL1PR12MB5849.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <BL1PR12MB58492016DDBB106A607F32CDE7E62@BL1PR12MB5849.namprd12.prod.outlook.com>

On Tue, Jan 21, 2025 at 09:10:26AM +0000, Chen, Jiqian wrote:
> On 2025/1/21 16:46, Roger Pau Monné wrote:
> > On Tue, Jan 14, 2025 at 11:26:36AM +0800, Jiqian Chen wrote:
> >> +    ctrl = pci_conf_read32(pdev->sbdf, rebar_offset + PCI_REBAR_CTRL(0));
> >> +    nbars = MASK_EXTR(ctrl, PCI_REBAR_CTRL_NBAR_MASK);
> >> +    for ( unsigned int i = 0; i < nbars; i++ )
> >> +    {
> >> +        int rc;
> >> +        struct vpci_bar *bar;
> >> +        unsigned int index;
> >> +
> >> +        ctrl = pci_conf_read32(pdev->sbdf, rebar_offset + PCI_REBAR_CTRL(i));
> >> +        index = ctrl & PCI_REBAR_CTRL_BAR_IDX;
> >> +        if ( index >= PCI_HEADER_NORMAL_NR_BARS )
> >> +        {
> >> +            printk(XENLOG_ERR "%pd %pp: too big BAR number %u in REBAR_CTRL\n",
> >> +                   pdev->domain, &pdev->sbdf, index);
> >> +            continue;
> >> +        }
> >> +
> >> +        bar = &pdev->vpci->header.bars[index];
> >> +        if ( bar->type != VPCI_BAR_MEM64_LO && bar->type != VPCI_BAR_MEM32 )
> >> +        {
> >> +            printk(XENLOG_ERR "%pd %pp: BAR%u is not in memory space\n",
> >> +                   pdev->domain, &pdev->sbdf, index);
> >> +            continue;
> >> +        }
> >> +
> >> +        rc = vpci_add_register(pdev->vpci, vpci_hw_read32, vpci_hw_write32,
> >> +                               rebar_offset + PCI_REBAR_CAP(i), 4, NULL);
> >> +        if ( rc )
> >> +        {
> >> +            /*
> >> +             * TODO: for failed pathes, need to hide ReBar capability
> >> +             * from hardware domain instead of returning an error.
> >> +             */
> >> +            printk(XENLOG_ERR "%pd %pp: fail to add reg of REBAR_CAP rc=%d\n",
> >> +                   pdev->domain, &pdev->sbdf, rc);
> >> +            return rc;
> >> +        }
> >> +
> >> +        rc = vpci_add_register(pdev->vpci, vpci_hw_read32, rebar_ctrl_write,
> >> +                               rebar_offset + PCI_REBAR_CTRL(i), 4, bar);
> >> +        if ( rc )
> >> +        {
> >> +            printk(XENLOG_ERR "%pd %pp: fail to add reg of REBAR_CTRL rc=%d\n",
> >> +                   pdev->domain, &pdev->sbdf, rc);
> >> +            return rc;
> > 
> > I think we said we wanted to attempt to continue here, rather than
> > returning an error and thus removing all vPCI handlers from the
> > device?
> I thought the result of your discussion with Jan was that I only needed to change the above two error paths to be "continue".
> If these two also need to be changed, I will modify them in the next version.

Hm, let's wait for Jan to confirm, but even if handler cannot be setup
for some of the registers, it's better than just allowing dom0
unmediated access to the capability.

None of this is ideal, but it seems to be the option that gives dom0
most options to successfully boot.

Thanks, Roger.

