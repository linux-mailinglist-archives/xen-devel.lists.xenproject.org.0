Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 040BCAADAB1
	for <lists+xen-devel@lfdr.de>; Wed,  7 May 2025 11:06:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.978379.1365182 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uCaii-0007Vv-P8; Wed, 07 May 2025 09:05:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 978379.1365182; Wed, 07 May 2025 09:05:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uCaii-0007TP-LS; Wed, 07 May 2025 09:05:40 +0000
Received: by outflank-mailman (input) for mailman id 978379;
 Wed, 07 May 2025 09:05:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zuHe=XX=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1uCaih-0007TI-R4
 for xen-devel@lists.xenproject.org; Wed, 07 May 2025 09:05:39 +0000
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [2a00:1450:4864:20::42d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6ef1d567-2b22-11f0-9ffb-bf95429c2676;
 Wed, 07 May 2025 11:05:34 +0200 (CEST)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-39c0dfba946so5536977f8f.3
 for <xen-devel@lists.xenproject.org>; Wed, 07 May 2025 02:05:34 -0700 (PDT)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-3a099ae0cd6sm16118351f8f.5.2025.05.07.02.05.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 May 2025 02:05:33 -0700 (PDT)
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
X-Inumbo-ID: 6ef1d567-2b22-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1746608733; x=1747213533; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gjmEDZhNPW31cGpCRagy/48bySkSEmiZ9p0xXlJXBK4=;
        b=n1A1g5d6DxLueq5ij53W8NpJMftXqHl2ppn9Yc8Jsd3D3HXmvL0QLnau1HVjdQWhwy
         kiT7fqvPphpHXuT14n26g4JUo6NWmg1ASPNXGKt/e+uI+yvPCyICIVaOQRvlFtVo3fKq
         ZZp7nds8CjgqgMbpJwGKSrD5a1xvhMHRW2kNY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746608733; x=1747213533;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gjmEDZhNPW31cGpCRagy/48bySkSEmiZ9p0xXlJXBK4=;
        b=IOQ6xJHw8LAe1//A65LRVjx4n1nJFwJ4udezpoTHWuDvU8M7fjRXFO+RRGpuyDd4Ee
         m/dvdhgn/WsSCoU+aOAvGuNoJ3oD/8vB8QKdsu0fXNaRBrvTeCoGPTKH0QPsoiU6Ng+L
         iME0T5Ikfstdw0vgiNLE26rOdx7aCxKqDjd4AlmiJ9U7A0MXI1SPdI5Uv+c6U860mlN9
         R9ne+NOHslbP7cLVG1TpjH37/HeMVUENgRtn5GV5NNkwGMeNiscODDUlq0JdCfHvSCJ4
         J1cxDzY5xR9fYH94iYkrkzlMLJC0e69kDYP7mL3/4zxMzLcVId6urhgKrbcZMrv3QIUG
         oVIA==
X-Gm-Message-State: AOJu0Yx00AriKYaV/WT4pLyMlYYQXOLlRKHq2PFhnJjN6I6RrPJhjyvk
	nW3yiUilgweXM3QNzcyXh7SloqIlKHVXz3iNzgyMIor1ENKiPWlnKmBakAVcaXQ=
X-Gm-Gg: ASbGncuSPTxGPWq3GXJaf25n3WkHvkTvgr6JELkLeGxZ7h5rQczR2daTXNtts1yLI8J
	HeCaS9+yfZbXYjJRNHI7TZdYMyeh9Kl7D445NgzqeesHCwX0CKPZcDOuKfOCEZpEAJ7q1+wflmC
	xmautFGL1JPWODL6oxMi3Ut/MYJCpsbkbCoHbKzodXvchylGKKdEgrt7uEyYaO3yTa4uoFpimSa
	o5gqJ7hA4XI7SSQHpdo8j+P95S34yxsk3PmcEGq0mim2qtyCsTmaqtWDVKNbYI94F4Kj2dHH4BU
	n1OVnOLEsUi16MVXPGFJmmKcVAjFR5MWqUlXRUxWctl1og==
X-Google-Smtp-Source: AGHT+IFIYyGpBz2rQQyxyUKoSjfoZVJmbcQCxIqGZMo8+jaAKHym8vfogaVmY6b51zMU0v0WuMTvBg==
X-Received: by 2002:a05:6000:2ab:b0:39d:724f:a8cd with SMTP id ffacd0b85a97d-3a0b4a24475mr2057783f8f.35.1746608733409;
        Wed, 07 May 2025 02:05:33 -0700 (PDT)
Date: Wed, 7 May 2025 11:05:32 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: "Chen, Jiqian" <Jiqian.Chen@amd.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"Huang, Ray" <Ray.Huang@amd.com>
Subject: Re: [PATCH v3 07/11] vpci: Hide extended capability when it fails to
 initialize
Message-ID: <aBsiXLb_e5MagwR0@macbook.lan>
References: <20250421061903.1542652-1-Jiqian.Chen@amd.com>
 <20250421061903.1542652-8-Jiqian.Chen@amd.com>
 <aBo3EfiWJUyWnl_a@macbook.lan>
 <BL1PR12MB58495E4592CA4E80DA34AE04E788A@BL1PR12MB5849.namprd12.prod.outlook.com>
 <aBsVI5ftmUteTaPE@macbook.lan>
 <PH7PR12MB5854A0FE23FA9AA0C364FB28E788A@PH7PR12MB5854.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <PH7PR12MB5854A0FE23FA9AA0C364FB28E788A@PH7PR12MB5854.namprd12.prod.outlook.com>

On Wed, May 07, 2025 at 08:49:46AM +0000, Chen, Jiqian wrote:
> On 2025/5/7 16:09, Roger Pau Monné wrote:
> > On Wed, May 07, 2025 at 07:26:21AM +0000, Chen, Jiqian wrote:
> >> On 2025/5/7 00:21, Roger Pau Monné wrote:
> >>> On Mon, Apr 21, 2025 at 02:18:59PM +0800, Jiqian Chen wrote:
> >>>> When vpci fails to initialize a extended capability of device for dom0,
> >>>> it just return error instead of catching and processing exception. That
> >>>> makes the entire device unusable.
> >>>>
> >>>> So, add new a function to hide extended capability when initialization
> >>>> fails. And remove the failed extended capability handler from vpci
> >>>> extended capability list.
> >>>>
> >>>> Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
> >>>> ---
> >>>> cc: "Roger Pau Monné" <roger.pau@citrix.com>
> >>>> ---
> >>>> v2->v3 changes:
> >>>> * Separated from the last version patch "vpci: Hide capability when it fails to initialize".
> >>>> * Whole implementation changed because last version is wrong.
> >>>>   This version gets target handler and previous handler from vpci->handlers, then remove the target.
> >>>> * Note: a case in function vpci_ext_capability_mask() needs to be discussed,
> >>>>   because it may change the offset of next capability when the offset of target
> >>>>   capability is 0x100U(the first extended capability), my implementation is just to
> >>>>   ignore and let hardware to handle the target capability.
> >>>>
> >>>> v1->v2 changes:
> >>>> * Removed the "priorities" of initializing capabilities since it isn't used anymore.
> >>>> * Added new function vpci_capability_mask() and vpci_ext_capability_mask() to
> >>>>   remove failed capability from list.
> >>>> * Called vpci_make_msix_hole() in the end of init_msix().
> >>>>
> >>>> Best regards,
> >>>> Jiqian Chen.
> >>>> ---
> >>>>  xen/drivers/vpci/vpci.c    | 79 ++++++++++++++++++++++++++++++++++++++
> >>>>  xen/include/xen/pci_regs.h |  1 +
> >>>>  2 files changed, 80 insertions(+)
> >>>>
> >>>> diff --git a/xen/drivers/vpci/vpci.c b/xen/drivers/vpci/vpci.c
> >>>> index f97c7cc460a0..8ff5169bdd18 100644
> >>>> --- a/xen/drivers/vpci/vpci.c
> >>>> +++ b/xen/drivers/vpci/vpci.c
> >>>> @@ -183,6 +183,83 @@ static void vpci_capability_mask(struct pci_dev *pdev,
> >>>>      xfree(next_r);
> >>>>  }
> >>>>  
> >>>> +static struct vpci_register *vpci_get_previous_ext_cap_register
> >>>> +                (struct vpci *vpci, const unsigned int offset)
> >>>> +{
> >>>> +    uint32_t header;
> >>>> +    unsigned int pos = PCI_CFG_SPACE_SIZE;
> >>>> +    struct vpci_register *r;
> >>>> +
> >>>> +    if ( offset <= PCI_CFG_SPACE_SIZE )
> >>>> +        return NULL;
> >>>> +
> >>>> +    r = vpci_get_register(vpci, pos, 4);
> >>>> +    ASSERT(r);
> >>>> +
> >>>> +    header = (uint32_t)(uintptr_t)r->private;
> >>>> +    pos = PCI_EXT_CAP_NEXT(header);
> >>>> +    while ( pos > PCI_CFG_SPACE_SIZE && pos != offset )
> >>>> +    {
> >>>> +        r = vpci_get_register(vpci, pos, 4);
> >>>> +        ASSERT(r);
> >>>> +        header = (uint32_t)(uintptr_t)r->private;
> >>>> +        pos = PCI_EXT_CAP_NEXT(header);
> >>>> +    }
> >>>> +
> >>>> +    if ( pos <= PCI_CFG_SPACE_SIZE )
> >>>> +        return NULL;
> >>>> +
> >>>> +    return r;
> >>>> +}
> >>>> +
> >>>> +static void vpci_ext_capability_mask(struct pci_dev *pdev,
> >>>> +                                     const unsigned int cap)
> >>>> +{
> >>>> +    const unsigned int offset = pci_find_ext_capability(pdev->sbdf, cap);
> >>>> +    struct vpci_register *rm, *prev_r;
> >>>> +    struct vpci *vpci = pdev->vpci;
> >>>> +    uint32_t header, pre_header;
> >>>
> >>> Maybe sanity check that offset is correct?
> >> What do you mean sanity check?
> >> Do I need to add something?
> > 
> > I would probably do something like:
> > 
> > if ( !offset )
> > {
> >     ASSERT_UNREACHABLE();
> >     return;
> > }
> How about adding check?
> 
>     if ( offset < PCI_CFG_SPACE_SIZE )
>     {
>         ASSERT_UNREACHABLE();
>         return -EINVAL;
>     }

That would work also, however note that pci_find_ext_capability()
should only return 0 if the capability is not found, and other callers
already assume that != 0 implies a valid position.  I will simply
check !offset as that's inline with all the other checks Xen does for
return values of pci_find_ext_capability().

> Do I need to add similar check in vpci_capability_mask()?

Possibly - seems like I didn't comment on that one, sorry.

Regards, Roger.

