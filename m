Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EE8C9EAFCC
	for <lists+xen-devel@lfdr.de>; Tue, 10 Dec 2024 12:25:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.852156.1266049 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tKyMd-00053Q-Iw; Tue, 10 Dec 2024 11:25:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 852156.1266049; Tue, 10 Dec 2024 11:25:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tKyMd-00050q-F5; Tue, 10 Dec 2024 11:25:15 +0000
Received: by outflank-mailman (input) for mailman id 852156;
 Tue, 10 Dec 2024 11:25:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+Xbj=TD=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tKyMc-00050k-35
 for xen-devel@lists.xenproject.org; Tue, 10 Dec 2024 11:25:14 +0000
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [2a00:1450:4864:20::530])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6c17b7f9-b6e9-11ef-a0d5-8be0dac302b0;
 Tue, 10 Dec 2024 12:25:13 +0100 (CET)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-5cfa1ec3b94so7110830a12.2
 for <xen-devel@lists.xenproject.org>; Tue, 10 Dec 2024 03:25:13 -0800 (PST)
Received: from localhost ([213.195.123.63]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa653a95e90sm518661366b.173.2024.12.10.03.25.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Dec 2024 03:25:12 -0800 (PST)
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
X-Inumbo-ID: 6c17b7f9-b6e9-11ef-a0d5-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1733829912; x=1734434712; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=E60N0SEVUwo/nJDsVvbVs3YkHOZ5b7Qy4u9k+Vr0HpM=;
        b=D5WB0WdsBFhZF+kLXm2GIsTHf95nuCWDCr4VDerDrNCnAjNy99NVSqJ/8qJhsLnasm
         zL9QeI5AukaD47fTU410dssOblUO+gY/+YD1gVVPktbXphw8FB2rbStd60h29DgkPLzn
         8WGIAZdvuds7djdIbJDW58BGOMzQCotq9MXUc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733829912; x=1734434712;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=E60N0SEVUwo/nJDsVvbVs3YkHOZ5b7Qy4u9k+Vr0HpM=;
        b=ntINwlfJG0oB7cBdO9CO7FPnhAXSeLMfhcRap5IPz1Ji6Di22ssQG2ErePOHiBbShU
         zuvp6O+iBwiQjxxcC/XaZTQ6qWnYztLPerLu5BPe1sZMPKOq+bPiiNXlZJcPW41OFwUi
         T73swxXJ9evQ5TsZM1EnBLShoYnZEAqhUpPTyrgunzNiYXgGYIyRJ0kPs4zVjXnVV8mE
         nmVyb44S9gL2A2EaH2fsaKhUxXgHV4q+ilMZkvkMtQCCLAKBuWTUzJYFz0aCmzngtvX8
         qSY7pawVyGyJcIWoGBJCnFz294Xlf6YH6/meZUDm9l9zeKoPEbOdoP325dP2ORo0L1YY
         zcfQ==
X-Forwarded-Encrypted: i=1; AJvYcCX53roQvvZ2WW+2mcnRZiP2RII3yBV6DeZksaTm1Vp/Uz9Lvb5iQD+B4YDczEWQot1JtY28SoM3Fp0=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw8aa9sFJ9QOb9d6zVz4C5FAjr40UcEMAW5fDF/HBM1kdCR6jlB
	UBzN6ZKEJGW3RWG0pieVjPUeY2X79WUTu7R0GZzY9JhIaeJI6/Oad6TevK8D79o=
X-Gm-Gg: ASbGncv8dV9VlSWAmnYLyPBrufqimyPQLqxh+AVKLU/bBjjQFAnrjiv9al86ko3eAIj
	X8Cv6l8NanX0T+a7TjfI54vJHcFElUqQ7mg7EhrZC1xJU8hbl7FNvyBkdqmp1TR4C7X6kHvXzhV
	oY8+VduiJgBdkyjgFW5YdoieiW1gORrNDtg+sTZqJzqRdY/RSLl1rQtux8WNHjjZFL8A0YfpXvH
	8GHe5K80gTjPZGO5pE9wz9cPanTS9utkp1xnSKv3MVFKBwF5NyRgSSLQDKkaJc=
X-Google-Smtp-Source: AGHT+IGpZ+5h+V/OaKu4rLAugAtiBQKs062BZz7VmOi8ggU8c101z4hNIazRY5yuslTKV40QBj+UGQ==
X-Received: by 2002:a17:906:4d1:b0:aa6:aa8a:9088 with SMTP id a640c23a62f3a-aa6aa8a90a2mr48494966b.41.1733829912445;
        Tue, 10 Dec 2024 03:25:12 -0800 (PST)
Date: Tue, 10 Dec 2024 12:25:11 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "Chen, Jiqian" <Jiqian.Chen@amd.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	"Huang, Ray" <Ray.Huang@amd.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v2 1/1] vpci: Add resizable bar support
Message-ID: <Z1glF5FJjnSzRqsB@macbook.local>
References: <20241202060956.1124162-1-Jiqian.Chen@amd.com>
 <4e4df0ee-67f6-41e3-bfc7-e78011680015@suse.com>
 <BL1PR12MB58499BEB287C4F9711324F71E73D2@BL1PR12MB5849.namprd12.prod.outlook.com>
 <1e0576d9-400e-4483-8dd1-061e215a00cd@suse.com>
 <BL1PR12MB584945F11C271CE137231F7BE73D2@BL1PR12MB5849.namprd12.prod.outlook.com>
 <a07bca59-90d2-4a84-bb47-59157bf5207d@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a07bca59-90d2-4a84-bb47-59157bf5207d@suse.com>

On Tue, Dec 10, 2024 at 10:54:43AM +0100, Jan Beulich wrote:
> On 10.12.2024 08:57, Chen, Jiqian wrote:
> > On 2024/12/10 15:17, Jan Beulich wrote:
> >> On 10.12.2024 08:07, Chen, Jiqian wrote:
> >>> On 2024/12/9 21:59, Jan Beulich wrote:
> >>>> On 02.12.2024 07:09, Jiqian Chen wrote:
> >>>>> +static void cf_check rebar_ctrl_write(const struct pci_dev *pdev,
> >>>>> +                                      unsigned int reg,
> >>>>> +                                      uint32_t val,
> >>>>> +                                      void *data)
> >>>>> +{
> >>>>> +    uint64_t size;
> >>>>> +    unsigned int index;
> >>>>> +    struct vpci_bar *bars = data;
> >>>>> +
> >>>>> +    if ( pci_conf_read16(pdev->sbdf, PCI_COMMAND) & PCI_COMMAND_MEMORY )
> >>>>> +        return;
> >>>>
> >>>> I don't think something like this can go uncommented. I don't think the
> >>>> spec mandates to drop writes in this situation?
> >>> Spec says: Software must clear the Memory Space Enable bit in the Command register before writing the BAR Size field.
> >>> This check is suggested by Roger and it really helps to prevent erroneous writes in this case,
> >>> such as the result of debugging with Roger in the previous version.
> >>> I will add the spec's sentences as comments here in next version.
> >>
> >> What you quote from the spec may not be enough as a comment here. There's
> >> no direct implication that the write would simply be dropped on the floor
> >> if the bit is still set. So I think you want to go a little beyond just
> >> quoting from the spec.
> > How about quoting Roger's previous words: " The memory decoding must be disabled before writing the BAR size field.
> > Otherwise changing the BAR size will lead to the active p2m mappings getting out of sync w.r.t. the new BAR size." ?
> 
> That'll be better, but imo still not enough to explain the outright ignoring
> of the write.

I think we might want to do something along the lines of:

uint64_t size = PCI_REBAR_CTRL_SIZE(val);
struct vpci_bar *bar = data;

if ( bar->enabled )
{
    if ( size == bar->size )
        return;

    /*
     * Refuse to resize a BAR while memory decoding is enabled, as
     * otherwise the size of the mapped region in the p2m would become
     * stale with the newly set BAR size, and the position of the BAR
     * would be reset to undefined.  Note the PCIe specification also
     * forbids resizing a BAR with memory decoding enabled.
     */
    gprintk(XENLOG_ERR,
            "%pp: refuse to resize BAR with memory decoding enabled\n",
	    &pci->sbdf);
    return;
}

Note this requires that the data parameter points to the BAR that
matches the ReBAR control register, this needs adjusting in
init_rebar().

> >>>>> +        if ( rc )
> >>>>> +        {
> >>>>> +            printk("%pp: add register for PCI_REBAR_CAP failed (rc=%d)\n",
> >>>>> +                   &pdev->sbdf, rc);
> >>>>> +            break;
> >>>>> +        }
> >>>>> +
> >>>>> +        rc = vpci_add_register(pdev->vpci, vpci_hw_read32, rebar_ctrl_write,
> >>>>> +                               rebar_offset + PCI_REBAR_CTRL, 4,
> >>>>> +                               pdev->vpci->header.bars);
> >>>>> +        if ( rc )
> >>>>> +        {
> >>>>> +            printk("%pp: add register for PCI_REBAR_CTRL failed %d\n",
> >>>>> +                   &pdev->sbdf, rc);
> >>>>> +            break;
> >>>>
> >>>> Is it correct to keep the other handler installed? After all ...
> >>> Will change to "return rc;" here and above in next version.
> >>
> >> I'm not convinced this is what we want, as per ...
> >>
> >>>>> +        }
> >>>>> +    }
> >>>>> +
> >>>>> +    return 0;
> >>>>
> >>>> ... you - imo sensibly - aren't communicating the error back up (to allow
> >>>> the device to be used without BAR resizing.
> >>
> >> ... what I said here.
> > Sorry, I didn’t understand.
> > Do you mean it is not enough to return error code once a handler failed to be installed, I need to remove the already installed handlers?
> 
> No, if you return an error here, nothing else needs doing. However, I
> question that returning an error here is good or even necessary. In
> the event of an error, the device ought to still be usable, just
> without the BAR-resizing capability.

So you suggest that the capability should be hidden in that case?  We
have logic to hide capabilities, just not used for the hardware
domain.  It would need some extra wiring to be capable of hiding
failed capabilities.

Regards, Roger.

