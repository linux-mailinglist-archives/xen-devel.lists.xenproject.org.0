Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CDEEACFF2D
	for <lists+xen-devel@lfdr.de>; Fri,  6 Jun 2025 11:21:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1008300.1387572 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNTGT-0002ww-K0; Fri, 06 Jun 2025 09:21:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1008300.1387572; Fri, 06 Jun 2025 09:21:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNTGT-0002v4-HM; Fri, 06 Jun 2025 09:21:29 +0000
Received: by outflank-mailman (input) for mailman id 1008300;
 Fri, 06 Jun 2025 09:21:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DWpK=YV=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1uNTGS-0002cH-Eu
 for xen-devel@lists.xenproject.org; Fri, 06 Jun 2025 09:21:28 +0000
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [2a00:1450:4864:20::42f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9f5108ff-42b7-11f0-b894-0df219b8e170;
 Fri, 06 Jun 2025 11:21:26 +0200 (CEST)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-3a365a6804eso1264935f8f.3
 for <xen-devel@lists.xenproject.org>; Fri, 06 Jun 2025 02:21:26 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-3a5323b653dsm1313155f8f.39.2025.06.06.02.21.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Jun 2025 02:21:26 -0700 (PDT)
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
X-Inumbo-ID: 9f5108ff-42b7-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1749201686; x=1749806486; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XDjRAfe21aPSN4PV54jmcZ7Bl2LRjvbfpaSIkqhQ05o=;
        b=vq5Nq9td40tGbcgSwTyl8ldb4UxnxNH9/Pj/vIu1kv1obMlI4gDTapOh/2GO+ecu1N
         xge8yuCdS7FLVH3k6m0QEiGzFUauQ1JpfpV3eP8YE4jEzKszutBehT9WCgN04t6T/GD4
         /XWG42KNFWPmP/ywPQsr92RfjxXqlfLBdusoY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749201686; x=1749806486;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XDjRAfe21aPSN4PV54jmcZ7Bl2LRjvbfpaSIkqhQ05o=;
        b=ccijgPu52NrHDhcxiiBvKiT0fruLagpOJvE/89hAiycnt0DJFwT4Hf5II73wIsad2G
         jZYji1A3Sm8WLt4e3bIVeCKtmz6nCQKWecYfPI7WD2xSDge2RQL9IcaRFiGPS+Lb2t4t
         R/2Mao03gmVn9zbDg7cu8llgomypefWNf2ufv3I+TCeV7B6misNb/hbRqBy1NFSZrjhF
         8auqURZUcvJoagF/O4egM8jhmDEkOzPJtxofqaIMSEBa0WkLousvgtANWrku79M3i8bN
         VN2erIrxqpXwSMn66YczAJMNl7KO/RljQX/lKCrp1hybWj4+f6luP6/fwUo9RKtKc9RC
         ndfA==
X-Gm-Message-State: AOJu0YwaXrCXP/e5p7dcT3n4Yc6Ou4sXgjjhP+Ry/bys/eihywbw9K5U
	MqlYOj+/8usHkzCYxm2vgn/McFrUK3BjXt9sEmT33FeBOTEc4+BFzLqsmpYJRjXVJNnlzE0qc/W
	zAEVq
X-Gm-Gg: ASbGnctb9FGqzJDCR1FrsFAReD8Q7lEkrcJiWBHxS2EMUJFX368bA0XaoBgsNwtBVKR
	r4xCU4tYif5NufZHqWqZZe54/eAF1+flwMD4lVR6tOCZ+pK5EWWbtaqAVI/xBgiqRBvgMIDdCRe
	oBhoTpXk2OgY6RVl5NoTDde5wJnj3lSXvuZxTzTxDPCy0wuiIKVsB8cb8OSpSkxR7P3G5J/kq1x
	R0Xmwji/klbVqKshS9TQipC80E4XtWc55iILSTqy3i75809fJK9c8SQZVrDdrKtNA1tPpN7mg5w
	g7o0Dl7ZGsrsYo/ynqc236y1nop6jaHXhZMzqxFIBMf/wC0X1yITbgEq8loTRHz4qhZR5AjQdJo
	ocEQLvmvSd4PqXtdcTCeckokb++vSKw==
X-Google-Smtp-Source: AGHT+IEhNXAiXaJITIXO5z84uL2rCHNHexjmI1AqwbZyYxKhSpdCOyEHtvraokHwkuUPr7BhL6I5KA==
X-Received: by 2002:a05:6000:290f:b0:3a3:7ba5:93a5 with SMTP id ffacd0b85a97d-3a531cb27e9mr2130150f8f.26.1749201686325;
        Fri, 06 Jun 2025 02:21:26 -0700 (PDT)
Date: Fri, 6 Jun 2025 11:21:25 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: "Chen, Jiqian" <Jiqian.Chen@amd.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"Huang, Ray" <Ray.Huang@amd.com>
Subject: Re: [PATCH v5 09/10] vpci/msi: Free MSI resources when init_msi()
 fails
Message-ID: <aEKzFbopo9HFfpq5@macbook.local>
References: <20250526094559.140423-1-Jiqian.Chen@amd.com>
 <20250526094559.140423-10-Jiqian.Chen@amd.com>
 <aEG1jgbVJGF7HxzI@macbook.local>
 <BL1PR12MB584926CF782BD10D925D1801E76EA@BL1PR12MB5849.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <BL1PR12MB584926CF782BD10D925D1801E76EA@BL1PR12MB5849.namprd12.prod.outlook.com>

On Fri, Jun 06, 2025 at 08:38:49AM +0000, Chen, Jiqian wrote:
> On 2025/6/5 23:19, Roger Pau Monné wrote:
> > On Mon, May 26, 2025 at 05:45:58PM +0800, Jiqian Chen wrote:
> >> When init_msi() fails, current logic return fail and free MSI-related
> >> resources in vpci_deassign_device(). But the previous new changes will
> >> hide MSI capability and return success, it can't reach
> >> vpci_deassign_device() to remove resources if hiding success, so those
> >> resources must be removed in cleanup function of MSI.
> >>
> >> To do that, implement cleanup function for MSI.
> >>
> >> Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
> >> ---
> >> cc: "Roger Pau Monné" <roger.pau@citrix.com>
> >> ---
> >> v4->v5 changes:
> >> * Change definition "static void cleanup_msi" to "static int cf_check cleanup_msi" since cleanup hook is changed to be int.
> >> * Add a read-only register for MSI Control Register in the end of cleanup_msi.
> >>
> >> v3->v4 changes:
> >> * Change function name from fini_msi() to cleanup_msi().
> >> * Remove unnecessary comment.
> >> * Change to use XFREE to free vpci->msi.
> >>
> >> v2->v3 changes:
> >> * Remove all fail path, and use fini_msi() hook instead.
> >> * Change the method to calculating the size of msi registers.
> >>
> >> v1->v2 changes:
> >> * Added a new function fini_msi to free all MSI resources instead of using an array to record registered registers.
> >>
> >> Best regards,
> >> Jiqian Chen.
> >> ---
> >>  xen/drivers/vpci/msi.c | 29 ++++++++++++++++++++++++++++-
> >>  1 file changed, 28 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/xen/drivers/vpci/msi.c b/xen/drivers/vpci/msi.c
> >> index 2d45c7867de7..4e106c39efae 100644
> >> --- a/xen/drivers/vpci/msi.c
> >> +++ b/xen/drivers/vpci/msi.c
> >> @@ -193,6 +193,33 @@ static void cf_check mask_write(
> >>      msi->mask = val;
> >>  }
> >>  
> >> +static int cf_check cleanup_msi(struct pci_dev *pdev)
> >> +{
> >> +    int rc;
> >> +    unsigned int end, size;
> >> +    struct vpci *vpci = pdev->vpci;
> >> +    const unsigned int msi_pos = pdev->msi_pos;
> >> +    const unsigned int ctrl = msi_control_reg(msi_pos);
> >> +
> >> +    if ( !msi_pos || !vpci->msi )
> > 
> > Possibly same request as the previous patch, msi_pos should be after
> > the PCI standard header.
> msi_pos <= PCI_CAPABILITY_LIST ?
> Or msi_pos < 0x40 ?

Hm, no, ignore this, sorry.

Thanks, Roger.

