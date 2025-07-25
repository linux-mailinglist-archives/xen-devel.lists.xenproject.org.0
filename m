Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FC81B11981
	for <lists+xen-devel@lfdr.de>; Fri, 25 Jul 2025 10:06:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1057461.1425367 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ufDRv-0007sR-R8; Fri, 25 Jul 2025 08:06:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1057461.1425367; Fri, 25 Jul 2025 08:06:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ufDRv-0007q7-Ob; Fri, 25 Jul 2025 08:06:39 +0000
Received: by outflank-mailman (input) for mailman id 1057461;
 Fri, 25 Jul 2025 08:06:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kfLl=2G=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1ufDRu-0007q1-N4
 for xen-devel@lists.xenproject.org; Fri, 25 Jul 2025 08:06:38 +0000
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [2a00:1450:4864:20::42d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 49e3e32b-692e-11f0-a31e-13f23c93f187;
 Fri, 25 Jul 2025 10:06:37 +0200 (CEST)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-3a54700a463so1162659f8f.1
 for <xen-devel@lists.xenproject.org>; Fri, 25 Jul 2025 01:06:37 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-3b76fcc43c2sm4240027f8f.83.2025.07.25.01.06.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Jul 2025 01:06:36 -0700 (PDT)
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
X-Inumbo-ID: 49e3e32b-692e-11f0-a31e-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1753430797; x=1754035597; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=sAStXe3zr/7J3uNB+mfMqr6JjbrdR22hhs3KRsUdzZM=;
        b=pss4JUiiVRWfiZzNYoSyp7JgUPoQPCBy2Yyr6kSZBQr8UgthMHZbKXBORsm9+d/lhD
         uw5Frjl0OBd6NxRhd6vuxuw4rK4XVtBnn1Fcy6yRqDehDUEggPSJIv/AlbBe0imdplS1
         L7ikx1+RDNdzImlV59eQYigqQ0wfxDEdAKAEk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753430797; x=1754035597;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sAStXe3zr/7J3uNB+mfMqr6JjbrdR22hhs3KRsUdzZM=;
        b=DaZb7sKBrQnNW1NO50RRASpeUfyheLAILy6NezEgUt/bUPi68F/rOtw2n2nnaRfMk8
         3ZD5NyCiXutjJK2v9OuOTv8Qrw2g2hev8NH1mOkPf4Hh8lZhc/AInQ3INXVxGE929b5t
         H8UGM7I5yC+czsvmPVP5gLff2tjeROzVJoKcX+B+GaPYZWA4WpVGNkd5sJbuHsq8BfFk
         M8GI9ZsQb6RhCCuU6iMahrBa0HjPh5i4jD0ok/IVwVLySO70J5Xjgq5AGG9YrLhmg8JW
         e3JbdxbCxczEuTcm3gafMm91SbCiA5Bkb0fdrToX1iwvx+3j65BdAnNpOjdjKiRlHUVX
         hFPA==
X-Gm-Message-State: AOJu0Ywb5TU/eUNtRk9dNiZJ41Au2xuF0wyOMHm1C3qVcVYo+QGT3dbp
	vPsY2QYCmOn8bc6vzSfVEtLXkkGanl3bcwQiQxtqWIMq3hAuxXIgLwK9/eZNbDaG95I=
X-Gm-Gg: ASbGncvrXjhA7hNkgt87mcVe96T2VYLukISpJ7vMQekauJGPyg8HiQcCZIkHHS7GRC+
	mj/87uxbOjHQ/yWdbqy7mKTFRR4Ib0EsJ0rhlhBbS8bLwrwNkJpt0gRNP8scjqZsU98/5GXQgmT
	X+JJKzCT0HxVAu7aKWKvDFyDDSOwA+yUX1jfoprz1jpNm6b8Bky1PZ/OBfBoSBkwKDdncjYXhYD
	KgV0YoCplfLGx8PlNdhH++xTIaJcEHIUMtgmKVdMg9Hry/dB45JeVsbRwvA23Jypa4UMG2Bdd5n
	/f+FcXGFEu/DAVjXaY5S5zllRoti+LxyTFBingTaksUR4tpWA/MPRndRY0+8mniidzhqSWD8qYf
	3i8jofd6UavsAStKPcaQ84IrDlKLptkbgOGl9e0QbORkZ/RHSDxkahS9hnX99OF0qnQ==
X-Google-Smtp-Source: AGHT+IFdkTMS2PI9U8+oF3So1CsQgOXE/8l0wPqQuby7WNVPEjL07q1t50oArrMJvyU+QJoht6jSTQ==
X-Received: by 2002:a05:6000:40ca:b0:3b6:162a:8e08 with SMTP id ffacd0b85a97d-3b77123f244mr4191228f8f.12.1753430797049;
        Fri, 25 Jul 2025 01:06:37 -0700 (PDT)
Date: Fri, 25 Jul 2025 10:06:35 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: "Chen, Jiqian" <Jiqian.Chen@amd.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"Huang, Ray" <Ray.Huang@amd.com>
Subject: Re: [PATCH v8 8/8] vpci/msix: Free MSIX resources when init_msix()
 fails
Message-ID: <aIM7C-EcPpRCot7i@macbook.local>
References: <20250724055006.29843-1-Jiqian.Chen@amd.com>
 <20250724055006.29843-9-Jiqian.Chen@amd.com>
 <aIJYSGSGQ76MgKF2@macbook.local>
 <BL1PR12MB58495437343EBAC5DA119A97E759A@BL1PR12MB5849.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <BL1PR12MB58495437343EBAC5DA119A97E759A@BL1PR12MB5849.namprd12.prod.outlook.com>

On Fri, Jul 25, 2025 at 02:50:36AM +0000, Chen, Jiqian wrote:
> On 2025/7/24 23:59, Roger Pau Monné wrote:
> > On Thu, Jul 24, 2025 at 01:50:06PM +0800, Jiqian Chen wrote:
> >> When init_msix() fails, current logic return fail and free MSIX-related
> >> resources in vpci_deassign_device(). But the previous new changes will
> >> hide MSIX capability and return success, it can't reach
> >> vpci_deassign_device() to remove resources if hiding success, so those
> >> resources must be removed in cleanup function of MSIX.
> > 
> > The text here is a bit convoluted IMO.  It would be clearer as:
> > 
> > When MSI-X initialization fails vPCI will hide the capability, but
> > remove of handlers and data won't be performed until the device is
> > deassigned.  Introduce a MSI-X cleanup hook that will be called when
> > initialization fails to cleanup MSI-X related hooks and free it's
> > associated data.
> > 
> > As all supported capabilities have been switched to use the cleanup
> > hooks call those from vpci_deassign_device() instead of open-code the
> > capability specific cleanup in there.
> Thanks, will change.
> 
> > 
> > (see below for the reasoning behind the last paragrpah).
> > 
> >> To do that, implement cleanup function for MSIX.
> >>
> >> Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
> >> ---
> >> cc: "Roger Pau Monné" <roger.pau@citrix.com>
> >> ---
> >> v7->v8 changes:
> >> * Given the code in vpci_remove_registers() an error in the removal of
> >>   registers would likely imply memory corruption, at which point it's
> >>   best to fully disable the device. So, Rollback the last two modifications of v7.
> >>
> >> v6->v7 changes:
> >> * Change the pointer parameter of cleanup_msix() to be const.
> >> * When vpci_remove_registers() in cleanup_msix() fails, not to return
> >>   directly, instead try to free msix and re-add ctrl handler.
> >> * Pass pdev->vpci into vpci_add_register() instead of pdev->vpci->msix in
> >>   init_msix() since we need that every handler realize that msix is NULL
> >>   when msix is freed but handlers are still in there.
> >>
> >> v5->v6 changes:
> >> * Change the logic to add dummy handler when !vpci->msix in cleanup_msix().
> >>
> >> v4->v5 changes:
> >> * Change definition "static void cleanup_msix" to "static int cf_check cleanup_msix"
> >>   since cleanup hook is changed to be int.
> >> * Add a read-only register for MSIX Control Register in the end of cleanup_msix().
> >>
> >> v3->v4 changes:
> >> * Change function name from fini_msix() to cleanup_msix().
> >> * Change to use XFREE to free vpci->msix.
> >> * In cleanup function, change the sequence of check and remove action according to
> >>   init_msix().
> >>
> >> v2->v3 changes:
> >> * Remove unnecessary clean operations in fini_msix().
> >>
> >> v1->v2 changes:
> >> new patch.
> >>
> >> Best regards,
> >> Jiqian Chen.
> >> ---
> >>  xen/drivers/vpci/msix.c | 44 ++++++++++++++++++++++++++++++++++++++++-
> >>  1 file changed, 43 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/xen/drivers/vpci/msix.c b/xen/drivers/vpci/msix.c
> >> index eb3e7dcd1068..8ab159969da6 100644
> >> --- a/xen/drivers/vpci/msix.c
> >> +++ b/xen/drivers/vpci/msix.c
> >> @@ -655,6 +655,48 @@ int vpci_make_msix_hole(const struct pci_dev *pdev)
> >>      return 0;
> >>  }
> >>  
> >> +static int cf_check cleanup_msix(const struct pci_dev *pdev)
> >> +{
> >> +    int rc;
> >> +    struct vpci *vpci = pdev->vpci;
> >> +    const unsigned int msix_pos = pdev->msix_pos;
> >> +
> >> +    if ( !msix_pos )
> >> +        return 0;
> >> +
> >> +    rc = vpci_remove_registers(vpci, msix_control_reg(msix_pos), 2);
> >> +    if ( rc )
> >> +    {
> >> +        printk(XENLOG_ERR "%pd %pp: fail to remove MSIX handlers rc=%d\n",
> >> +               pdev->domain, &pdev->sbdf, rc);
> >> +        ASSERT_UNREACHABLE();
> >> +        return rc;
> >> +    }
> >> +
> >> +    if ( vpci->msix )
> >> +    {
> >> +        for ( unsigned int i = 0; i < ARRAY_SIZE(vpci->msix->table); i++ )
> >> +            if ( vpci->msix->table[i] )
> >> +                iounmap(vpci->msix->table[i]);
> >> +
> >> +        list_del(&vpci->msix->next);
> Should I need to move this line above " for ( unsigned int i = 0; i < ARRAY_SIZE(vpci->msix->table); i++ )" ?
> Because I noticed that is what it be in vpci_deassign_device.

Yes, indeed, that would be preferable.

> >> +        XFREE(vpci->msix);
> >> +    }
> >> +
> >> +    /*
> >> +     * The driver may not traverse the capability list and think device
> >> +     * supports MSIX by default. So here let the control register of MSIX
> >> +     * be Read-Only is to ensure MSIX disabled.
> >> +     */
> >> +    rc = vpci_add_register(vpci, vpci_hw_read16, NULL,
> >> +                           msix_control_reg(msix_pos), 2, NULL);
> >> +    if ( rc )
> >> +        printk(XENLOG_ERR "%pd %pp: fail to add MSIX ctrl handler rc=%d\n",
> >> +               pdev->domain, &pdev->sbdf, rc);
> >> +
> >> +    return rc;
> >> +}
> >> +
> >>  static int cf_check init_msix(struct pci_dev *pdev)
> >>  {
> >>      struct domain *d = pdev->domain;
> >> @@ -714,7 +756,7 @@ static int cf_check init_msix(struct pci_dev *pdev)
> >>  
> >>      return rc;
> >>  }
> >> -REGISTER_VPCI_CAP(MSIX, init_msix, NULL);
> >> +REGISTER_VPCI_CAP(MSIX, init_msix, cleanup_msix);
> > 
> > Don't you need to also call the cleanup hooks in
> > vpci_deassign_device() and remove the open-coded cleaning of MSI-X
> > done there?
> Oh, will do.
> How do I process the return value of cleanup_msix in vpci_deassign_device?
> Just print an error when it fails and continue to do other deassign actions?

Yeah, I don't think there's much else that can be done.  Printing an
error and continuing should be fine.

Thanks, Roger.

