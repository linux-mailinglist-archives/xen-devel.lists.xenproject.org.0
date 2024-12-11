Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CC409EC77F
	for <lists+xen-devel@lfdr.de>; Wed, 11 Dec 2024 09:41:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.854115.1267396 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLIH9-00057R-3h; Wed, 11 Dec 2024 08:40:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 854115.1267396; Wed, 11 Dec 2024 08:40:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLIH9-00054H-0n; Wed, 11 Dec 2024 08:40:55 +0000
Received: by outflank-mailman (input) for mailman id 854115;
 Wed, 11 Dec 2024 08:40:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YTIw=TE=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tLIH6-00053S-VA
 for xen-devel@lists.xenproject.org; Wed, 11 Dec 2024 08:40:52 +0000
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [2a00:1450:4864:20::62d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9d6d6599-b79b-11ef-99a3-01e77a169b0f;
 Wed, 11 Dec 2024 09:40:46 +0100 (CET)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-aa6b4cc7270so58575966b.0
 for <xen-devel@lists.xenproject.org>; Wed, 11 Dec 2024 00:40:51 -0800 (PST)
Received: from localhost ([213.195.123.63]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa6841eece0sm452938666b.56.2024.12.11.00.40.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Dec 2024 00:40:50 -0800 (PST)
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
X-Inumbo-ID: 9d6d6599-b79b-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1733906450; x=1734511250; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LZXiN7dOF3YMKu7Pm2MUwWBz8ub48mTQD04O+vFfaX8=;
        b=ubCmlC3IW3AZZM4onksusjrBrtXTodcxZcZ1x9OpyHidpIUIdkLMcMPxHqbIGJGWRW
         ky4NXY5QtyFdKCocMKSoG1iLRd7qTPJq9CT2/uyFddV0ycs8kXYPNvwSEuuMPlnlK9GI
         /ao/JZSwPbC70D/4cL+5NvBLTrbJW1QLboefc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733906450; x=1734511250;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LZXiN7dOF3YMKu7Pm2MUwWBz8ub48mTQD04O+vFfaX8=;
        b=D77dFcFs59hsipH5O7TeE8coE+iYe3korAiFb11+niWU8140jjqeTIpbcXKMhYMEMW
         rK07aLVgIvOpNpA4OYZaE8jDvi1I5pKZq7SpiZWcJYhLmZYEmgNfurd4p8L5W4QsxHUR
         CPbjDrqKKfLev791WQkwj39rV9snDQgXhYI8NqhDwglA8nzxCgWVqqgwaaHC2S9Ym8qo
         GaeGe1RQ6V5o0ixc/SIq5CciqboLfaXLS/oi28SiUWuHLz9w3gXGTs8PpQKVN4DSjOjc
         50+NkWI4lWpTk+/voT3AjIUvVnroVv+pPSvXpj1kyh6pBIuuo0tDnGSqNTGx/R5TXEkF
         MMTQ==
X-Forwarded-Encrypted: i=1; AJvYcCWxpOKdCi5kS5rPDeSG769TiaJXVGeD3OytGNKvidoYotCFYuJE4CK2Zx58Moo2gIFSHL4Hlr8RX6c=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy+2xzNd+KnH8zvXK9Q6hsEA9tmHn3UT1Z3wsiXIXrmIcsKCM5W
	YAjVvR38vtAWpwafS4Ewf19NevJHOSbYgjrCRAF8jK54nRRQ5pQCWN320HU/l98=
X-Gm-Gg: ASbGncsyu+EGxCrWWIPmQFpZIgeaggs4zjr0t0hJRr3zIINnwMYBUnfkF1p8kxVzlo8
	k7R0wBjTJNxNcT/G+YX4QnsdN0V3CRfKEP67JPCQMpUdIS54JxlEPJSOPAfsbBnMvuR4OcTr7tC
	Fb9Oy0wB2sifcEL2MRbeWsx5bXLcjAGotLjNLKdci4GfNLXNvWxOkZy5HfY/zHGFRiOfQQbGV8Q
	8z1OOqzw4lCM6ss1odWX/o/NOdvxc5roe28w2+vb6w2QpR89sRGRtNvWPazesE=
X-Google-Smtp-Source: AGHT+IGBvXnPWIBOzRk4ggwvbOXDCPdNb4d4GtEuPWeTAKiVck0QnniMgPkQhnfc33kT4t8AwUFuwA==
X-Received: by 2002:a05:6402:2105:b0:5d0:cfad:f71 with SMTP id 4fb4d7f45d1cf-5d43316510amr4120628a12.32.1733906450410;
        Wed, 11 Dec 2024 00:40:50 -0800 (PST)
Date: Wed, 11 Dec 2024 09:40:49 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: "Chen, Jiqian" <Jiqian.Chen@amd.com>
Cc: Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	"Huang, Ray" <Ray.Huang@amd.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v2 1/1] vpci: Add resizable bar support
Message-ID: <Z1lQEdXy_Njy8wAf@macbook.local>
References: <20241202060956.1124162-1-Jiqian.Chen@amd.com>
 <4e4df0ee-67f6-41e3-bfc7-e78011680015@suse.com>
 <BL1PR12MB58499BEB287C4F9711324F71E73D2@BL1PR12MB5849.namprd12.prod.outlook.com>
 <1e0576d9-400e-4483-8dd1-061e215a00cd@suse.com>
 <BL1PR12MB584945F11C271CE137231F7BE73D2@BL1PR12MB5849.namprd12.prod.outlook.com>
 <a07bca59-90d2-4a84-bb47-59157bf5207d@suse.com>
 <Z1glF5FJjnSzRqsB@macbook.local>
 <BL1PR12MB58492072C5D445052FD056D5E73E2@BL1PR12MB5849.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <BL1PR12MB58492072C5D445052FD056D5E73E2@BL1PR12MB5849.namprd12.prod.outlook.com>

On Wed, Dec 11, 2024 at 07:57:29AM +0000, Chen, Jiqian wrote:
> On 2024/12/10 19:25, Roger Pau Monné wrote:
> > On Tue, Dec 10, 2024 at 10:54:43AM +0100, Jan Beulich wrote:
> >> On 10.12.2024 08:57, Chen, Jiqian wrote:
> >>> On 2024/12/10 15:17, Jan Beulich wrote:
> >>>> On 10.12.2024 08:07, Chen, Jiqian wrote:
> >>>>> On 2024/12/9 21:59, Jan Beulich wrote:
> >>>>>> On 02.12.2024 07:09, Jiqian Chen wrote:
> >>>>>>> +        if ( rc )
> >>>>>>> +        {
> >>>>>>> +            printk("%pp: add register for PCI_REBAR_CAP failed (rc=%d)\n",
> >>>>>>> +                   &pdev->sbdf, rc);
> >>>>>>> +            break;
> >>>>>>> +        }
> >>>>>>> +
> >>>>>>> +        rc = vpci_add_register(pdev->vpci, vpci_hw_read32, rebar_ctrl_write,
> >>>>>>> +                               rebar_offset + PCI_REBAR_CTRL, 4,
> >>>>>>> +                               pdev->vpci->header.bars);
> >>>>>>> +        if ( rc )
> >>>>>>> +        {
> >>>>>>> +            printk("%pp: add register for PCI_REBAR_CTRL failed %d\n",
> >>>>>>> +                   &pdev->sbdf, rc);
> >>>>>>> +            break;
> >>>>>>
> >>>>>> Is it correct to keep the other handler installed? After all ...
> >>>>> Will change to "return rc;" here and above in next version.
> >>>>
> >>>> I'm not convinced this is what we want, as per ...
> >>>>
> >>>>>>> +        }
> >>>>>>> +    }
> >>>>>>> +
> >>>>>>> +    return 0;
> >>>>>>
> >>>>>> ... you - imo sensibly - aren't communicating the error back up (to allow
> >>>>>> the device to be used without BAR resizing.
> >>>>
> >>>> ... what I said here.
> >>> Sorry, I didn’t understand.
> >>> Do you mean it is not enough to return error code once a handler failed to be installed, I need to remove the already installed handlers?
> >>
> >> No, if you return an error here, nothing else needs doing. However, I
> >> question that returning an error here is good or even necessary. In
> >> the event of an error, the device ought to still be usable, just
> >> without the BAR-resizing capability.
> > 
> > So you suggest that the capability should be hidden in that case?  We
> > have logic to hide capabilities, just not used for the hardware
> > domain.  It would need some extra wiring to be capable of hiding
> > failed capabilities.
> Can you give me a guidance on how to hide a failed capability?
> What codes are current logic to hide capabilities?

This was done by Stewart for the legacy PCI capabilities, but not
exactly to hide the capabilities that fail to init.  Take a look at
commit:

d830b0a7bc7e xen/vpci: header: filter PCI capabilities

However that was designed to expose a fixed set of capabilities,
always known when init_header() is executed.  If we want to hide
capabilities on failure we will need a bit more flexible interface I
think.

Ideally we would like to tie this to initialization hooks themselves,
so that in vpci_assign_device() an init function failing automatically
triggers the hiding of the failing capability.  That would need an
interface similar to:

#define REGISTER_VPCI_INIT(<capability id>, <function>, <priority>,
<pcie?>)

REGISTER_VPCI_INIT(PCI_CAP_ID_MSI, init_msi, VPCI_PRIORITY_LOW,
false);

And then in vpci_assign_device() any init function that has a
capability ID different than 0 and fails to initialize would lead to
the capability being masked.

It would be great to have an interface like this in place, because the
current error handling in vPCI is not great.  For the hardware domain
init functions failing will just lead to the device being fully
accessible by dom0 without any mediation.

Anyway, we don't do any of this for dom0 at the moment when MSI or
MSI-X fail to init, so I'm not sure it's fair to ask that you do this
for ReBAR.  It would be great if you want to, but it's not a trivial
amount of work.

Thanks, Roger.

