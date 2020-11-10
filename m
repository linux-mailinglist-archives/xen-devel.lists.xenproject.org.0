Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D1B232AD3BC
	for <lists+xen-devel@lfdr.de>; Tue, 10 Nov 2020 11:27:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.23211.49845 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kcQsJ-0002Ip-PO; Tue, 10 Nov 2020 10:27:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 23211.49845; Tue, 10 Nov 2020 10:27:43 +0000
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
	id 1kcQsJ-0002IQ-Lp; Tue, 10 Nov 2020 10:27:43 +0000
Received: by outflank-mailman (input) for mailman id 23211;
 Tue, 10 Nov 2020 10:27:42 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hJ2u=EQ=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1kcQsI-0002IK-86
 for xen-devel@lists.xenproject.org; Tue, 10 Nov 2020 10:27:42 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f8d6a73b-187d-43be-b090-a40008456ef5;
 Tue, 10 Nov 2020 10:27:40 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=hJ2u=EQ=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
	id 1kcQsI-0002IK-86
	for xen-devel@lists.xenproject.org; Tue, 10 Nov 2020 10:27:42 +0000
X-Inumbo-ID: f8d6a73b-187d-43be-b090-a40008456ef5
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id f8d6a73b-187d-43be-b090-a40008456ef5;
	Tue, 10 Nov 2020 10:27:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1605004060;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=jbg2vOJ/SIP5Oqtija1BYZDEJ0QFHzzIQCi5QGEzKy4=;
  b=GZddmFikHMzedDBJTpmXPzTwtC+Nxsn7oczDbGjzfGwgLaa+aOQq0sdm
   KD+5Am5GoaoRyL3pDuJPeSvYg8xnDV1DHQwHZrplJnguTQKO1ZL/5U4kd
   iK/lvhRTQCGRecXO/XfK6WGucd1aQM60ogCcj4GWDGUwfDOE5elylQC64
   0=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 9CMnBvkB3nS5SERjSiZiM/b1Q1wAAYQivzCwHPaD/ilZJ/TtFY29cufTfBN5xzDNNANptJzSNx
 VQ90qYdgQCa0IB/wtFjusewtM/857eeJyu+iIiqOUA4zbq7N5ps0V+TsZzNc9NgNamsHXkW5ao
 lyg0ngomqVwY4Lk7l6HLo06WbYUcHcITgfORCwRW7Ts6wkqGfceS48etpJ4ir/EJrCcFvIvAHt
 xn4FQsWuGnSgjA3gAT1TXcTdvrHGB0RwmYm+DXIJApAcpHBZeUVK2JVesalstygTHhVQr7/RtZ
 9S8=
X-SBRS: None
X-MesageID: 30807467
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,466,1596513600"; 
   d="scan'208";a="30807467"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QZe74/IWbP75wB4tRvOJfPn5kkRfNOVLiOmCz/KNHaD1Uim1+ApXXtt+k4pKQM2891GRbihqiqivO8cOt8xCmcDCiL/eWyPKx4t5xhenbXL7s286K2Bc1SEWDOPn2aZkwgmGwPbZthDAK4vuqQIhnrO67epRjKJW6qCbBa0TXgjyyG9D6w6V/6SryJJK5AXPGiObfqan7MWNUwTHIzH0fb6YL6FH2lShbTiEpW189s5ATZlrwJuC00m+DwKPVmZnhU8VXzKVzWemQ7o+9joTXFNmWKSBvT54oyRfvzClyODZ5NZQ4TeRel3dy7FS0CYZix1GmaGsDNkO8UZmjTIEnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6aSv34bPjibLtGTL3U+lwCgf+nz8m/0NbKVn4O3bRa4=;
 b=h+z8EjG7ck1t0bg55XIFKFEO8zi4jiQJH78Z+l1QR+uDqj0n9KvWxIKorNu73VJvylCdVMwJlh+uJpzypG4U3e8n2lLZyhvuG+ecBg1ILX38AOYs72Hk1Di3QRrSkQzsymK2dox4oGjmL1FvhqtRkXro5TrvrUhGqKCBEdVzB5bXfYoQK4IvGVq8e8wlOyrTOJeIZ/rCu0aWyy/xnvhV3mDBFzx+31c/6AEMBv1OQIje3xFc2bgV+aRO2qhgwGsUQip7LBadN7RjPuIfSXwUMXOnwa/fpJzENA9Vr4Duiq2lE2ofj3/uJFWDBBJVLtgB2l8K/0GqGnw1IcOKCmSfsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6aSv34bPjibLtGTL3U+lwCgf+nz8m/0NbKVn4O3bRa4=;
 b=rbEzGOK+W2+F3K8Roi6rah+BOevJjsNQddTJqEGFQ6ToEng6n+JOb6ktS01riJmQQZYghQP/p0cwg8NRCTLCgmkGGoOsmfSFJtyC4E+13E6wI+EUQbItRIK4aw1LxdUjTxYGm0T8pxnJC0/s3i2KqYIktI3gvSrneM7xO/hDl1o=
Date: Tue, 10 Nov 2020 11:27:31 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, George Dunlap
	<George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>
Subject: Re: [PATCH 1/5] x86/p2m: paging_write_p2m_entry() is a private
 function
Message-ID: <20201110102731.6eg6u7mxefoihmfq@Air-de-Roger>
References: <29d30de1-2a8d-aee2-d3c3-331758766fc9@suse.com>
 <1fab241b-3969-9ce5-2388-bcdbe3be6079@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1fab241b-3969-9ce5-2388-bcdbe3be6079@suse.com>
X-ClientProxiedBy: LNXP265CA0049.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5d::13) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 49da6026-4762-4514-be3d-08d885633dc0
X-MS-TrafficTypeDiagnostic: DS7PR03MB5590:
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DS7PR03MB5590673576FC1B75064392B98FE90@DS7PR03MB5590.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 69lXt6c2ts/3p7XT0RxzRrOOKO9ClqUOc9//ozWiPXEyDIR/TrB1as6gLbAGaOOmkEo2z06lfOaDDchvo0onz/H4tou+DTOybfedr7FkthVc3/wzT70iiaXbnsw5hcyhzIL07MbObenOWRPJAXk3OYv8hwQaCfkKhMdYNS5iimrqZa1+m5ax6NZYa12uUmD+b+VqvNPJVsFFLMJm5RgQyXMwRrgJgkBM/jo40jLpvjcJ71dNkHiho3IOv4NTZf8t5C0kI/JbX9jr1Vk5fUo6ivYS1tzLgM7Pr927AykjEZwsQEdsHbcD+3aNc8Sou9qXAf9mm0hueu57fvSGVaF9qx95TNJi6wM0Po5QheISDgCUEqAqW6Dt53FZzffpCW4W
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(39860400002)(136003)(366004)(396003)(346002)(376002)(26005)(6916009)(85182001)(316002)(9686003)(6496006)(86362001)(186003)(83380400001)(2906002)(6666004)(1076003)(16526019)(8676002)(4326008)(5660300002)(956004)(6486002)(33716001)(478600001)(54906003)(66946007)(66476007)(66556008)(8936002)(70780200001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 3f01DDJoWYToZnaokPgrws13+6GxDLzpA3FOHnY2+7teYX8iD+gEAcFYDTakPkY5qIWrlw5r6JuTPw9JdFjcUISPoJytR6Y8NPDa5wFmsHgeLnz0Kt4B8GdVDP+j9gg1nK7Fa2XFg0qn82xYklnEwRE80sOLpA4w9ORWfuJvgD92Yhq/ogHvPpy3A9DFvvgvc4MPeFD2VdlxpKAhL+CxQqKSr+5OwkEffHuVpRub98m01EyX5+hmX/9nW7ZVHdXc3/b4/3axDK2lWGHk8K1svtB/ugBHbLXYrC0hXQP4emWRcRNxJ6Ei8L7qSrchswrPgg3pvRGdhwa+B+1jVAbgKsC1fdeWpveW3/QdbI+P4uOZ5en3fNMLunj6jkHC+mmBHeLhJRYg+OU4S95pfjsVYNDk3OMWZ3RSM11I/k98VMG61TWVDf4mw/uKykqhCtR2vDKWWry2H1sc8dvIsyLsA9OT5mtpQx5iUxwWQgq/cVefqUOgXea1XWcfI511T+/diLfx0Lk7rkXqDJu7kTIcaEMsggLYXg9C3dtyJFXWWyExVgbw+DCMspQzn4rPkcjf+zeTaZc7U2M5DxphuqLSuQDiu49c3hVPebbdeJXxA6Lyy+B6gVg2ivFA1JrLzJ7EULZfjAPZFWItAvs9M93/B5SBSIVlBP0GGdIRHgQr57ZaVIMqsPzdsBiZo1uxlydUL9RZ7mduvLXurGOi6Upb30/UDPaWwQNHnese1KogdzLA0vYfCxZroby2yGhNxGBHwJI7PD++MZfiEJlxtfEN9uRhORPnGZ9j9UU0pzFKElThx3tFRHToHKet3G867wgJpt5xFVAvBpAQoxJ33O/YVkkrzaS2yxfQlHq0bjqo6KtOb4V6bPY2GK+PuOKV8apasQY0JvdQNRw1BKGPRNVW7A==
X-MS-Exchange-CrossTenant-Network-Message-Id: 49da6026-4762-4514-be3d-08d885633dc0
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2020 10:27:35.9264
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9O7szrjOYCDL+e+YLX02cxGKn/Ai8oEq4GoW+6+PURVmk+1xO648ihfACtjO4sL2HnK7rPHwc4cJ862hX7ZDPw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR03MB5590
X-OriginatorOrg: citrix.com

On Wed, Oct 28, 2020 at 10:22:04AM +0100, Jan Beulich wrote:
> As it gets installed by p2m_pt_init(), it doesn't need to live in
> paging.c. The function working in terms of l1_pgentry_t even further
> indicates its non-paging-generic nature. Move it and drop its
> paging_ prefix, not adding any new one now that it's static.
> 
> This then also makes more obvious that in the EPT case we wouldn't
> risk mistakenly calling through the NULL hook pointer.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

> 
> --- a/xen/arch/x86/mm/p2m-pt.c
> +++ b/xen/arch/x86/mm/p2m-pt.c
> @@ -108,6 +108,31 @@ static unsigned long p2m_type_to_flags(c
>      }
>  }
>  
> +/*
> + * Atomically write a P2M entry and update the paging-assistance state
> + * appropriately.
> + * Arguments: the domain in question, the GFN whose mapping is being updated,
> + * a pointer to the entry to be written, the MFN in which the entry resides,
> + * the new contents of the entry, and the level in the p2m tree at which
> + * we are writing.
> + */
> +static int write_p2m_entry(struct p2m_domain *p2m, unsigned long gfn,
> +                           l1_pgentry_t *p, l1_pgentry_t new,
> +                           unsigned int level)
> +{
> +    struct domain *d = p2m->domain;
> +    struct vcpu *v = current;

I think you could constify both?

Thanks, Roger.

