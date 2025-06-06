Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6347AACFF0A
	for <lists+xen-devel@lfdr.de>; Fri,  6 Jun 2025 11:17:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1008273.1387532 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNTC8-0007xP-EW; Fri, 06 Jun 2025 09:17:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1008273.1387532; Fri, 06 Jun 2025 09:17:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNTC8-0007vP-Be; Fri, 06 Jun 2025 09:17:00 +0000
Received: by outflank-mailman (input) for mailman id 1008273;
 Fri, 06 Jun 2025 09:16:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DWpK=YV=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1uNTC7-0007vJ-4Z
 for xen-devel@lists.xenproject.org; Fri, 06 Jun 2025 09:16:59 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ff443834-42b6-11f0-a301-13f23c93f187;
 Fri, 06 Jun 2025 11:16:58 +0200 (CEST)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-452f9735424so991725e9.3
 for <xen-devel@lists.xenproject.org>; Fri, 06 Jun 2025 02:16:58 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-3a5324360fasm1298816f8f.56.2025.06.06.02.16.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Jun 2025 02:16:57 -0700 (PDT)
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
X-Inumbo-ID: ff443834-42b6-11f0-a301-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1749201418; x=1749806218; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZZiVLXY+uRhcDUBodbSeE9pVkYvBo/5taz01lkfc+YM=;
        b=JayzBE0iS1evRTDQlW3qTVkNANF9vHb/YGffG23SzYHXlPk6wiV9nMnUW3lBMdymGc
         LradeDMuMzSmMahiWNKh9FuqXSYa5bszDZ2npRGYVVlfgFZNmU1ZnypITR0JeNGRN0cC
         CwgOgiY099wBzKP3VkRb72oX50GwIVdMnj66Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749201418; x=1749806218;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZZiVLXY+uRhcDUBodbSeE9pVkYvBo/5taz01lkfc+YM=;
        b=eaegfcnSJOHgjbcQVJLvEiAmdqz8gN7doNRg0C2HpmzUNSxl2tvvscrxZVgKPY/R6b
         6tK6JuCm6Gs9AWR2lMOTbUr1KfqNio75gPxPSOnRcj1FaxDdl66agTw7uN388wzuX84P
         S8XByHXhy00EQ9Wdjptr/oHhgtsGKtbTD5a5mTqNNcKEWTlUfY3C6/nScqiloLavq59j
         VJ7QIGGrgbP+mRNEKatsvZEUZEsrejAaKNT1uf90S9upIwQcignPlLI10bMJixAVbiHk
         LjQUC2VBAOS+765RvbM+hppmXefQnEXSTHruzN2/4/dLlxyDUO5uR8NhtskAwX9m9hPe
         Um/g==
X-Gm-Message-State: AOJu0YwnLgE+rbhdv/QkHrsAkwhwuRLw4P1ta5MBal7WxV75NRBvyyCH
	rHdk8FbXPOSPaUqWVwlxtWtCjnW3fHcbgp80QJmEN2JhRuDpO1VMjnEI6mQgffXaX+U=
X-Gm-Gg: ASbGncuWVKCpBszB6KwFu93xbWyMoJtRFIeNu2Xj0TqQNv4eVf1LBPSW9rGyHrrhPRB
	sWgArL0CXp2hha2Td045tPtOypjavVJ/wG1MMW6cUDHlqdXBminwVjxolNyT1r8TIVlWmRlCUEO
	U4N0QSVxCHD5K6fQ1sY4YkLCZ7BN+DYNRcr9YQQGIXfFFjEWctH3tV/aEIzWsZ+wI7UDTfkKlqk
	Pp8ir7i7nKPhF26plssJlLHl7iz5gsVS2iqIIZMBYVqmm6mR19PMccy4trH2erTlu6dwraX86Vr
	DI81KojwU2s6Yo299gv6GRItzQlEeBnrM1PVsVna9YRu54jjkrA/ESUHzMwBryjYVKQJ6YZWswQ
	CmqLqt3cXGMi4TxpwA9gSRz5UVheH7YiIy6dMEMDY
X-Google-Smtp-Source: AGHT+IHFcCHl5V6DhX8mIa5lPED8cmkbmC4IgiZigrPJe5cWZpSYCWv+tnV1Vxgp879LFjvFU4SPZw==
X-Received: by 2002:a05:600c:1c25:b0:43c:f81d:34 with SMTP id 5b1f17b1804b1-45201437847mr27460425e9.9.1749201417639;
        Fri, 06 Jun 2025 02:16:57 -0700 (PDT)
Date: Fri, 6 Jun 2025 11:16:56 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: "Chen, Jiqian" <Jiqian.Chen@amd.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"Huang, Ray" <Ray.Huang@amd.com>
Subject: Re: [PATCH v5 05/10] vpci: Hide legacy capability when it fails to
 initialize
Message-ID: <aEKyCFiNkWfu2Yjo@macbook.local>
References: <20250526094559.140423-1-Jiqian.Chen@amd.com>
 <20250526094559.140423-6-Jiqian.Chen@amd.com>
 <aEGdMBmZsfQaRdJC@macbook.local>
 <BL1PR12MB58496E3D1546229911588D85E76EA@BL1PR12MB5849.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <BL1PR12MB58496E3D1546229911588D85E76EA@BL1PR12MB5849.namprd12.prod.outlook.com>

On Fri, Jun 06, 2025 at 07:03:02AM +0000, Chen, Jiqian wrote:
> On 2025/6/5 21:35, Roger Pau Monné wrote:
> > On Mon, May 26, 2025 at 05:45:54PM +0800, Jiqian Chen wrote:
> >> When vpci fails to initialize a legacy capability of device, it just
> >> returns an error and vPCI gets disabled for the whole device.  That
> >> most likely renders the device unusable, plus possibly causing issues
> >> to Xen itself if guest attempts to program the native MSI or MSI-X
> >> capabilities if present.
> >>
> >> So, add new function to hide legacy capability when initialization
> >> fails. And remove the failed legacy capability from the vpci emulated
> >> legacy capability list.
> >>
> >> Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
> >> ---
> >> cc: "Roger Pau Monné" <roger.pau@citrix.com>
> >> ---
> >> v4->v5 changes:
> >> * Modify vpci_get_register() to delete some unnecessary check, so that I don't need to move function vpci_register_cmp().
> >> * Rename vpci_capability_mask() to vpci_capability_hide().
> >>
> >> v3->v4 changes:
> >> * Modify the commit message.
> >> * In function vpci_get_previous_cap_register(), add an ASSERT_UNREACHABLE() if offset below 0x40.
> >> * Modify vpci_capability_mask() to return error instead of using ASSERT.
> >> * Use vpci_remove_register to remove PCI_CAP_LIST_ID register instead of open code.
> >> * Add check "if ( !offset )" in vpci_capability_mask().
> >>
> >> v2->v3 changes:
> >> * Separated from the last version patch "vpci: Hide capability when it fails to initialize"
> >> * Whole implementation changed because last version is wrong.
> >>   This version adds a new helper function vpci_get_register() and uses it to get
> >>   target handler and previous handler from vpci->handlers, then remove the target.
> >>
> >> v1->v2 changes:
> >> * Removed the "priorities" of initializing capabilities since it isn't used anymore.
> >> * Added new function vpci_capability_mask() and vpci_ext_capability_mask() to
> >>   remove failed capability from list.
> >> * Called vpci_make_msix_hole() in the end of init_msix().
> >>
> >> Best regards,
> >> Jiqian Chen.
> >> ---
> >>  xen/drivers/vpci/vpci.c | 117 ++++++++++++++++++++++++++++++++++++++--
> >>  1 file changed, 113 insertions(+), 4 deletions(-)
> >>
> >> diff --git a/xen/drivers/vpci/vpci.c b/xen/drivers/vpci/vpci.c
> >> index 2861557e06d2..60e7654ec377 100644
> >> --- a/xen/drivers/vpci/vpci.c
> >> +++ b/xen/drivers/vpci/vpci.c
> >> @@ -83,6 +83,99 @@ static int assign_virtual_sbdf(struct pci_dev *pdev)
> >>  
> >>  #endif /* CONFIG_HAS_VPCI_GUEST_SUPPORT */
> >>  
> >> +static struct vpci_register *vpci_get_register(struct vpci *vpci,
> >> +                                               unsigned int offset,
> >> +                                               unsigned int size)
> >> +{
> >> +    struct vpci_register *rm;
> > 
> > Nit: I think you re-used part of the code from vpci_remove_register()
> > that names the local variable rm (because it's for removal).  Here it
> > would better to just name it 'r' (for register).
> Will change.
> > 
> >> +
> >> +    ASSERT(spin_is_locked(&vpci->lock));
> >> +
> >> +    list_for_each_entry ( rm, &vpci->handlers, node )
> >> +    {
> >> +        if ( rm->offset == offset && rm->size == size )
> >> +            return rm;
> >> +
> >> +        if ( offset <= rm->offset )
> >> +            break;
> >> +    }
> >> +
> >> +    return NULL;
> >> +}
> >> +
> >> +static struct vpci_register *vpci_get_previous_cap_register(
> >> +    struct vpci *vpci, unsigned int offset)
> >> +{
> >> +    uint32_t next;
> >> +    struct vpci_register *r;
> >> +
> >> +    if ( offset < 0x40 )
> >> +    {
> >> +        ASSERT_UNREACHABLE();
> >> +        return NULL;
> >> +    }
> >> +
> >> +    r = vpci_get_register(vpci, PCI_CAPABILITY_LIST, 1);
> >> +    if ( !r )
> >> +        return NULL;
> >> +
> >> +    next = (uint32_t)(uintptr_t)r->private;
> >> +    while ( next >= 0x40 && next != offset )
> >> +    {
> >> +        r = vpci_get_register(vpci, next + PCI_CAP_LIST_NEXT, 1);
> >> +        if ( !r )
> >> +            return NULL;
> >> +        next = (uint32_t)(uintptr_t)r->private;
> >> +    }
> >> +
> >> +    if ( next < 0x40 )
> >> +        return NULL;
> > 
> > The code below I think it's a bit simpler (and compact) by having a
> > single return instead of multiple ones:
> > 
> > for ( r = vpci_get_register(vpci, PCI_CAPABILITY_LIST, 1); r;
> >       r = next >= 0x40 ? vpci_get_register(vpci,
> >                                            next + PCI_CAP_LIST_NEXT, 1)
> >                        : NULL )
> > {
> >     next = (uint32_t)(uintptr_t)r->private;
> >     ASSERT(next == (uintptr_t)r->private);
> Why need this ASSERT here?

Extra safety to ensure the value is not truncated (which will indicate
something is off).  I would not argue strongly for it to be added if
you don't think it's needed.

Thanks, Roger.

