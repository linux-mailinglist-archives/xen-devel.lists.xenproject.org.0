Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C4E012B95D5
	for <lists+xen-devel@lfdr.de>; Thu, 19 Nov 2020 16:12:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.30926.61143 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kflbT-0000B5-M2; Thu, 19 Nov 2020 15:12:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 30926.61143; Thu, 19 Nov 2020 15:12:07 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kflbT-0000AX-IR; Thu, 19 Nov 2020 15:12:07 +0000
Received: by outflank-mailman (input) for mailman id 30926;
 Thu, 19 Nov 2020 15:12:05 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4Veg=EZ=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1kflbR-0000AO-Pm
 for xen-devel@lists.xenproject.org; Thu, 19 Nov 2020 15:12:05 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f6e2eae9-b6a9-4c58-b62c-2f5efe1b5c2e;
 Thu, 19 Nov 2020 15:12:04 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=4Veg=EZ=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
	id 1kflbR-0000AO-Pm
	for xen-devel@lists.xenproject.org; Thu, 19 Nov 2020 15:12:05 +0000
X-Inumbo-ID: f6e2eae9-b6a9-4c58-b62c-2f5efe1b5c2e
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id f6e2eae9-b6a9-4c58-b62c-2f5efe1b5c2e;
	Thu, 19 Nov 2020 15:12:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1605798724;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=UP6kg95BAs0h/yVgLtA3xeQOX/4tv1T9jvIqv8ibVN4=;
  b=A0/EhR1i9QZt5K8ZKnHvZeC9vOQbt2bVtCaVbD34c74nUC3zGWX3+eXN
   DyEMlOnOSHQhPkAa21Q/LxnduKVHqWWsOJLBbpRqIFb2hKlg1pusImoyF
   RimlC28SHBTaM4HomBbvuUBsxKVylLSTJvFm9jkUQe69xbBefgqobsaqW
   I=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: xSPTS7REGbmy1QGHiiJU0pkX2rocQcNWyA9h6QE5IZ/UL5wQ+7eQRMKVqbtMZlD1QfoZt+hCK2
 OXLqGSsAeN7B9DVXJ3dR5hlhBPDXYBNzhgv005YriIgv1wDjdhkQI7cabDKr5G1pjmyXA107DJ
 hCcd86OMw9V2olmRa/ooSEpFtHq0MKTDHWCHE56+JiN84ATclNHs1MIfuPOt0wsLugrXudYITz
 vEzZ/Om1r1FDPrGazUdh7Dx+R3jfo1obGnQFm7T8fck9h3wdjCGzKoBTuEioYm60pvbxsIa6bx
 IL0=
X-SBRS: None
X-MesageID: 31531907
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,490,1596513600"; 
   d="scan'208";a="31531907"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oW4cMNPRBHDFzS4zvLNHV3zbBDgD7mTUo/9T4s74/UCE7p9pwZNzBqW24G+Ppuy1xZ+rzQUJW7o0FIT87SrHzFuu4zoshqFjbM8x9CGGpOUe0JuhlGjv2j83kTZDX75ahiQ3nPyBiw3fga3rBiHla5rMKB/U5AcFxZfLv5fHle6TBugGq5mSWzb4n39qNg+3pFa6y46imzhtTVoKHRe5+KFSLqWYcGiN2+s+RH2fp4zN/M3NZ+aI05fo6n/8uncuaHlbzslJ490lqzFnWW1UrFWYr6YkQvp0N6LR0W3YDNA37qlNtcgKZBZ7fEEmY3qBFZhUvvm5d4Re1FCmLRU5LA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L2g0sfSw/+FWdj3AvQM0e97FVPhTPT+NA6Gp956jAtk=;
 b=EgzI0sUZmn6FQM3cIHfv+r+Rp3R7rKSyrcclUdZ+CNK0uBQSaDtpuKM6R1fGeiWrmZCmiZO/0ZNSrx2wexoI9EbFg/k3+OWkm++apxRQcX1+7TsIXVEljCrDGCFhp5tZ68gbV3synxcRdJulO98QOYdo4P1OTtmgL/DixdvAYU9AT1X3DFOPh+3xGrmN3Nk9aR7lsodgTugljb3sNfice+SyFjE+szjG2okW4LU0QDMqftcLs+tZSIv5lesIzvoiS7nZrEcD2hhG2XucRKwau8X79MbXLnmoxK4kvCWu4b0Yxcu9OfVaTkWlb7Bq10884znxhGf0AfuG8zdEw2A+3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L2g0sfSw/+FWdj3AvQM0e97FVPhTPT+NA6Gp956jAtk=;
 b=Bp+0LIx91lM6S8g2qStk41KbaXqCEbAiNlWu70MMTqVoU7CqPsNKM/+OVKIm/LIFllYd6tWmk+itGdCZ4nTf1CrEs0hWP2S3PHTUiGBx/mbFXDLQr6ONYjek5aTu3fFOY2BgmAmWVu/UdzRQVBHUhdzYuJOKHiF3xyizX5H8two=
Date: Thu, 19 Nov 2020 16:11:56 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Julien Grall <julien@xen.org>
CC: <xen-devel@lists.xenproject.org>, Julien Grall <jgrall@amazon.com>,
	Stefano Stabellini <sstabellini@kernel.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Jan Beulich <jbeulich@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH] xen/irq: Propagate the error from init_one_desc_irq() in
 init_irq_data()
Message-ID: <20201119151156.wgkwyslzzlpcirot@Air-de-Roger>
References: <20201119145434.28065-1-julien@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20201119145434.28065-1-julien@xen.org>
X-ClientProxiedBy: LO2P265CA0488.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:13a::13) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c6f986be-c814-44e4-5c49-08d88c9d76d8
X-MS-TrafficTypeDiagnostic: DM6PR03MB4764:
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB47644051362A9E715E76E2258FE00@DM6PR03MB4764.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ROERwgM2iRLFtl5E2akJWjIhsEGOmcpP0osusDcIHxpRhgoAnu2Kk+VNrDBi4/rJjQFKACIXurhAYIB9mTz4R/Rfm+hTjwpfBx0ym2pJPf5O5uI4U66e/bWWpX4cNjpfMyfDmD0lfpvWynddnBxS2BYT/j+PYZLMXCRllyyv711IB5MY41hWJcvHRzZLegt59t6SQWr2JLa28KdbsYiq7hhZBeDmQZFpscq7SuvnqQC1V4HZ3x3ftMTmA5aR5R9ROp7LFzsZ0ikd71QM8VLyFmLrOmnRs2V3dSkV2bchvXb1tw5OMzn6p8LFJKVB7YkyxpC58QBTIzkkT5c9C2H7mw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(366004)(39860400002)(376002)(136003)(346002)(396003)(33716001)(66476007)(83380400001)(3716004)(1076003)(956004)(66946007)(54906003)(5660300002)(26005)(6496006)(316002)(16526019)(186003)(8936002)(2906002)(6916009)(8676002)(66556008)(4326008)(9686003)(6486002)(86362001)(6666004)(85182001)(478600001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: OnooJ+62AzYTXqo1iplmgb+GPzBslyrtFK+rjrmseugvaLVc4sZGj6aQ5aDtIu/wWqQhdAf18MI6rItoPeJdv1CryAkc3r0Rbh9mqE0/9PDX5jirBa1Ub4oVZ5UHOGV5Ht7g2joa/VuHYqZorlIbLoLhnGpVtp3nlHogPggAmGMVjzvxFYwurcYZIQxzJ5oVRIoVgPPrCmRvDOS29dWIs6AnMF3uvQBlMUYiMp2LjRqP/R8ABzkkQ5xuq8GHJKy76UdYxCFwWoFqrHXV2Zj+YU16BOEBhoivKcf8cL+en2Y/aSGQrpnHhYjGdFwiO/noeERiT/OqaM+D2nO+RQqX83S3AXF5quF4K4PRDhauK3O7vXInNqb6aR0ZjCeBFsZVbpyTfD5+oWfeERz7BqHqjycofJu1IdC3k99FwLgsjmeFuEfVTWf2JHYsr1YVcwTpu0F+QfA7l8o/CVvTqaNGt/aNGB8eNakgkEnj+A5W89EiIQf7qigHCxFg88pSbP7mfKDMmeY9iR+lL5f2zHFC3LTOwyWUX1jOhK/ufrmNWUe7KUAvf1nCbcvVgD8Bkr1LYuvYSSkXjk+CjHsrS1puIDfqsJE7kvrjl4Z29R9TzNa1yPzE/51YRURmCD4zasgfAQn7091SB5R92hCimdr7LGrCHu+QNHmVq6MepZbfmX5Z1HSMK2Yx+hym1KXWhct4qwMy/bbmbjDwKLZv47i9JUcMyvIuIFRwk2qQ121fdxfNW14PGwzcpEOAYx4lBLwCzQiA4aGV4JaUVDM850xDAsabIcs0hFAfN25GG419j9pMX281R73BcKTBMYc8+dT1ghWbKSV5vYmeNRwF+F91Eu1S4XAWcHhpOkKDVxDEYFcuIhmvNU/AdEXDTLSCpKLdTpDq6bY3l4hauE6uhOdvSw==
X-MS-Exchange-CrossTenant-Network-Message-Id: c6f986be-c814-44e4-5c49-08d88c9d76d8
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2020 15:12:00.5794
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ku+tddempvrvb+OmnQigCkpf2QZmyLILGrCCpPYFRcAPiFqDWRkKJEB+ZRhd7DQVxdTp/B8Phra21oo/7fQUUw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4764
X-OriginatorOrg: citrix.com

On Thu, Nov 19, 2020 at 02:54:34PM +0000, Julien Grall wrote:
> From: Julien Grall <jgrall@amazon.com>
> 
> init_one_desc_irq() can return an error if it is unable to allocate
> memory. While this is unlikely to happen during boot (called from
> init_irq_data()), it is better to harden the code by propagting the
> return value.
> 
> Spotted by coverity.
> 
> CID: 106529
> 
> Signed-off-by: Julien Grall <jgrall@amazon.com>

> ---
>  xen/arch/x86/irq.c | 7 ++++++-

Fox x86:
Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

>  2 files changed, 12 insertions(+), 2 deletions(-)
> 
> diff --git a/xen/arch/arm/irq.c b/xen/arch/arm/irq.c
> index 3877657a5277..279d221a2b85 100644
> --- a/xen/arch/arm/irq.c
> +++ b/xen/arch/arm/irq.c
> @@ -88,7 +88,12 @@ static int __init init_irq_data(void)
>      for ( irq = NR_LOCAL_IRQS; irq < NR_IRQS; irq++ )
>      {
>          struct irq_desc *desc = irq_to_desc(irq);
> -        init_one_irq_desc(desc);
> +        int rc;
> +
> +        rc = init_one_irq_desc(desc);

You could init rc at definition.

Thanks, Roger.

