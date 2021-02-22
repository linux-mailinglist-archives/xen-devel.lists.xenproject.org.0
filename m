Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BDBA321A9F
	for <lists+xen-devel@lfdr.de>; Mon, 22 Feb 2021 15:57:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.88149.165646 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lECdw-0005D4-Rb; Mon, 22 Feb 2021 14:57:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 88149.165646; Mon, 22 Feb 2021 14:57:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lECdw-0005Ce-MU; Mon, 22 Feb 2021 14:57:00 +0000
Received: by outflank-mailman (input) for mailman id 88149;
 Mon, 22 Feb 2021 14:56:58 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=w45/=HY=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lECdu-0005CE-P2
 for xen-devel@lists.xenproject.org; Mon, 22 Feb 2021 14:56:58 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6a499f80-aae2-406e-b463-1272d60e08bc;
 Mon, 22 Feb 2021 14:56:57 +0000 (UTC)
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
X-Inumbo-ID: 6a499f80-aae2-406e-b463-1272d60e08bc
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1614005817;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=yLi43FZrcj03EbcFY3Aha6Srz/MpSiaoOj48kpyZ/Tg=;
  b=hkCG3H4DzLWmRsQEuCOEr4uLG9GZPz3B7x4bMV+bDOejNWXf4H6sOcER
   icwBNBhwM65HoudhAcZEqEIuGinjRxWwQM+K0A3kb+YNq0Hp64rQUUETI
   1UNpyK8LQyiOJb7RecATHSADXNTys78+J96xgIg7yVNlCqJ7GJoncK+b8
   I=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: GDfVy7rZY9SGfZHkARRI5WETkzXs3NxopEIMfuXqDPA4kFvfIU/9VgPux6C2n9hrJ6fcyH1FP8
 yxW78gI3wPsIEqm1m+PEdfhb4Aq4EpUypw5Brg4Zg+HrT4xk/rzO5K0vQoQ2p8FBcbsHci9Wpl
 kMv8ihJXEnrKb6bL10Jh+d7IZ0YAa8Egduz2I68lqE0iYwvBr3WqSnuOZZpSfF1qZH736r1yc7
 ti5ADcaEVGovEri3cMhWdCN4nDLdqgaUfzW3gj+7iPT6Wi+RpWFDpMNI1pCqtOMfdWVYkp4IDa
 1PI=
X-SBRS: 5.2
X-MesageID: 37935217
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.81,197,1610427600"; 
   d="scan'208";a="37935217"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i4r0UTIV6gD2X2kurob+dKzk2qBxvOCE09a2e2t2UXR6RIfCyvhBgCgDgZaUGlOxS1LY7TbQmYrmYSWtJ28iT61ymPxpxveCkG4FSOA+agk178P6x4mc8nkOmIP6PG/LG4sKZbl8lMws9UTkaEaPsY6fVEt/zGC90Uti+M8isNnJ7AXHixFhS23HVn4pUSseOpsXsNejw2vQLnXI9bjWMWRiiPBCsoeYi4Ig3+H+hQXzp0rm+fiegjLdYWOb6rS20JLhwOQSd04fBC8nHiu3FZE6IuGdvRetEK4CHdJkaMuTCpnWNaQDFT2RlobsGhXYlnJdf0qQ8/mrEiipjYPy8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VSl6Vl11W3QTSz2u4mO81xxZ40P/k97NaOubUWyp+HE=;
 b=SM0pBjZJxwbE5QHlMF4poaYlBbB63scO/RP2J6H7uU/Os47sUA9SNvcpgxLtBWNmb/NqS7Cep8RZ/G9VfFOb2FtyQBjVSeHUBgxEvvwOAckgiTgbFalq3qVFGrHRPskyTMxGpgxdQZ7/RRvNA1sFIJOcVPMhXjI91B5LGSDe6FEELVE3/ITLtRKYyb4VCsavwV2wR/5lh222DPC5K0LxiJTw+o/NPX5hmVn+J+1hHFsRvDmJkxVW4nFWMkH4oYdtokgellcRJqARHadPADv+QzhIMgf7FdEswdkUG5tn2K7eZcGVGhQP7K7118Ua2N2jCRhwd6ugbLK1wyYLLkGM4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VSl6Vl11W3QTSz2u4mO81xxZ40P/k97NaOubUWyp+HE=;
 b=ulWfO2l3ScMTo9kedn+ihM5U3V2eB3siLzElaPAYGK2xRoZFVvaLF6+IN28dfzcdQhWmsbgy+6jrfxid5+NpBWK5XTjWeOly4yQ+NoBod1u3W9J3jYE8oXxHY0tiPWRTG6/q9LQE78wFAWNrzIle/2aM4wz2ZXBClBo/wQ1zPac=
Date: Mon, 22 Feb 2021 15:56:48 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] x86/irq: simplify loop in unmap_domain_pirq
Message-ID: <YDPGMOgV1sLCczpT@Air-de-Roger>
References: <20210210092211.53359-1-roger.pau@citrix.com>
 <f80e0026-9a0b-d25d-a0a4-81774da8cba8@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f80e0026-9a0b-d25d-a0a4-81774da8cba8@suse.com>
X-ClientProxiedBy: PR3PR09CA0003.eurprd09.prod.outlook.com
 (2603:10a6:102:b7::8) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 56b4574e-54c9-4754-b7c2-08d8d74217fe
X-MS-TrafficTypeDiagnostic: DM6PR03MB5324:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB53247FDAB32A94559F1D36308F819@DM6PR03MB5324.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fq1YOS4j/0Nhs0X6A+8otHz4DPyoJ5NfmuWu6QZhNtqg42MRG7ks0/OgzM8ncneyC9kZI1Je1/4oxWJAw+4YnH9Zb9uDzkEC5EBslkikY0YZ+JuC/BAx5FAobdNWRNUa3xxu7lr+8K9NTMnzLWRfz23Yn7oRdX6x/8o0it1Z3lCtsr///mYO1JcmIOexitl/7wubvW+ljEe5T9mjjTgreXq1WBZt18QMMLoc/qqn18p1d5TMpFhRbUQCTdw0MfKDPo18QCMmx1qqMslWHxxyuqQqnAwxUS/uf9BW5DNh0xgNjjY3KUj32zFGmJxbPjWLBpNyQMy/aJ52GmVXeyJf4Zz+fCTENAYTRwXJRCXCwrZIYLTe+fv7AxUwjMA+6DfZVGqrl2vBxCFHHBDNHYTP1fl8IIQZcs/81RJzPRiqx3FszTNu59TtcN+U0pud2DmK1ujhNcsR5wJBQ6vHxjz4mvYAg9O+PGWRqgJQDT59vNDMPEfSdYtEGLrEgeQTQze+GAl8MXL3g5Xtt5RYEeTHQg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(136003)(376002)(396003)(39860400002)(366004)(346002)(8676002)(66556008)(85182001)(2906002)(6666004)(9686003)(53546011)(6486002)(6496006)(6916009)(8936002)(316002)(54906003)(86362001)(478600001)(83380400001)(956004)(4326008)(16526019)(186003)(26005)(5660300002)(66946007)(33716001)(66476007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?bnlOb0xUYlowTjhOWHpkczNvWjVyMVNUc3hTVi8rTUZQU3pyL0gzdmhPSkIw?=
 =?utf-8?B?MklRcDdlcjkzUDRsbUxiSzYxZmV6cEVHMEd6c0xvYVliVmFtVEc3NWxacjJt?=
 =?utf-8?B?U1VmajBuWEt2NG9PVk8rN0VydWE2UGlIMzNwbVdBekIxbFR6SFptaG0yYSs5?=
 =?utf-8?B?czFUTjFESERzcUE2eFlqT2FCR1F0dlllMkREUTd2RFNLU1pNNDlTcUVIY3Ni?=
 =?utf-8?B?eWJNaElpNkFuV3pqQXJBbVhUYVg2a0J2bDN3dE50amp0S2pZQW9sUXgwK3hq?=
 =?utf-8?B?aWh1SE1OUWlwL3dzL2RyS0V3NmtabHpRckQvcE54R1JQUkpTVHRFejZ6ZjdV?=
 =?utf-8?B?QVFDbkxudjVzenYyaVRlRkg5ckcrTVFDVFF4WGswczhjWXhZQXpTZUttdDRo?=
 =?utf-8?B?NFdPUGY5TU1XUExQSFhuVmxDMWVWbjJPeTVBY0lTYUVCZTd3UXZsaTl2U2V5?=
 =?utf-8?B?ZUVuOStwNUh3RkVrY1VDTEhVTll4TEVoNk1JblJ4NExyOHg0VENxb1BYZ3ox?=
 =?utf-8?B?bTNkMjFmbGZ6bmZNMWtJV1o5WFRLbDI5NmlIVXhJUXg3YkVQNlZlMGR1QStW?=
 =?utf-8?B?TWx6NW5IMk5FM2IydG9YMURpMTdlQU1WYkxmYnUxRWdXbVEveUI0MHp3ZUt1?=
 =?utf-8?B?QXl1SFkwUTJ3ZEZNNDVLWWtDUitNTHowdndBb1hRcE9xRjd4NG1NbjdlR2xi?=
 =?utf-8?B?NUN5OFA5eEZWR2tXaENDWDBndGVaZldaZDI1WmNjT1c5NVYzMWk1N3pYdy9o?=
 =?utf-8?B?RUlVZVJFUVpMaS83T05Xd2M5VDYyMjU3S0hpTEYrSGJLQ0o2dnJOTmNUMjVv?=
 =?utf-8?B?YUQyL0RTQWgvV3llSTlhalJKMmRnVHl4OEFodjdtenk2WFdVQWV4R2NhdHJm?=
 =?utf-8?B?Zm11dS9MYS9qVEJyOGRDZEF1cTR1MHJIcXQzR3d6dTRyditXRVorSWhLbjFS?=
 =?utf-8?B?SWFVZ1VEZVNJeVY5TkI5MHdoNkRQVjBERjF1TUZnVFRxTWhkWnJUblE1M3Jx?=
 =?utf-8?B?bVlVZmN1MERzZytwaklmak40SDBXM0ZZbkpEVlhOWG5EV2xiajBlSDQxbitL?=
 =?utf-8?B?Qk5jRG51dFR2M3FHVzlzYTdMa0RvY2lpeFM1eEhjUW9raUg2dkdnS3lUMXdo?=
 =?utf-8?B?aHlVdEF5djBFdkNVOURtQjBpVDVNN0Z0NFkrb05XUlZHQlc1Ty9Gb3ZpTVBh?=
 =?utf-8?B?RUtaMHViK0hBSHkwVmNHU3owbkxtS2J4QzdDc0xaU1VDS3dsUDk1YTFuckNV?=
 =?utf-8?B?OWFQUi9reEc0dUx4bnR1S0JrUVlqSEQzVTN4cWM5RzJIQWs5bUtnNFhFa1dG?=
 =?utf-8?B?dElOQS9yT2tQazRuenMrRTRIbWdQMnBqYldNaXNSdnpaVHJDYUh0SllPSzVT?=
 =?utf-8?B?dkEraTQ2cHh6em5SV1pjM0ZmbHdRVzA4ckhZZWo4eTAyV3R5czRKZEZ0cTNq?=
 =?utf-8?B?NUFZaXA5Q1dLbHBMUHc0SU5ta2hhSTYzSDM0NzhrWEdvRmlYVkV1L0ZtVU9P?=
 =?utf-8?B?cU9xWGxRNXVvYVZuaXcyZEQyVjR4VEpFdWgrTFVUUDNvdjVHMGdiNmhTV1Zn?=
 =?utf-8?B?ZU80Y1JxR2pkRnZ1dWFodzBWUTdpR0llM0VGVlFaN1FaZUtPL09iOXdydW5w?=
 =?utf-8?B?ZnQ4K05EcExEcHp2OGpROVF3Y3lDY2xpc3N0bVZxa2lTcEUzb0tBUTlFaGg5?=
 =?utf-8?B?cGRnUW8xbC9ieCtzNUFqSzFncUZUdEUvckthNUVLTW1JdWQ3enRBRlk2bGNz?=
 =?utf-8?Q?5at8t40yguINrj6DUFUwhR8WM1J9VtIjR9/fwbc?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 56b4574e-54c9-4754-b7c2-08d8d74217fe
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2021 14:56:54.4641
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gugdK3cV3hlsjrRt7CxdiDZyzqXaw56vgIktVtYtobnSX6lehqVI0PahtGhAKXELo7PunXARyNGfXMnqrGeQ/g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5324
X-OriginatorOrg: citrix.com

On Fri, Feb 19, 2021 at 03:39:14PM +0100, Jan Beulich wrote:
> On 10.02.2021 10:22, Roger Pau Monne wrote:
> > The for loop in unmap_domain_pirq is unnecessary complicated, with
> > several places where the index is incremented, and also different
> > exit conditions spread between the loop body.
> > 
> > Simplify it by looping over each possible PIRQ using the for loop
> > syntax, and remove all possible in-loop exit points.
> > 
> > No functional change intended.
> > 
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> 
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> 
> Quite a bit better indeed. Just one nit below (can be taken care of
> while committing, once the tree will re-open).

Sure, if you want to queue this already please fix the format
string.

> > @@ -2356,11 +2355,23 @@ int unmap_domain_pirq(struct domain *d, int pirq)
> >      if ( msi_desc != NULL )
> >          pci_disable_msi(msi_desc);
> >  
> > -    spin_lock_irqsave(&desc->lock, flags);
> > -
> > -    for ( i = 0; ; )
> > +    for ( i = 0; i < nr; i++, info = pirq_info(d, pirq + i) )
> >      {
> > +        unsigned long flags;
> > +
> > +        if ( !info || info->arch.irq <= 0 )
> > +        {
> > +            printk(XENLOG_G_ERR "dom%d: MSI pirq %d not mapped\n",
> > +                   d->domain_id, pirq + i);
> 
> %pd please as you touch/move this anyway.
> 
> > @@ -2378,45 +2389,6 @@ int unmap_domain_pirq(struct domain *d, int pirq)
> >              desc->msi_desc = NULL;
> >          }
> >  
> > -        if ( ++i == nr )
> > -            break;
> > -
> > -        spin_unlock_irqrestore(&desc->lock, flags);
> > -
> > -        if ( !forced_unbind )
> > -           cleanup_domain_irq_pirq(d, irq, info);
> > -
> > -        rc = irq_deny_access(d, irq);
> > -        if ( rc )
> > -        {
> > -            printk(XENLOG_G_ERR
> > -                   "dom%d: could not deny access to IRQ%d (pirq %d)\n",
> > -                   d->domain_id, irq, pirq + i);
> 
> Looks like the pirq number logged here also was off by one, which
> the re-arrangement takes care of.

Indeed. I don't think it's worth fixing this now.

Thanks, Roger.

