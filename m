Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EEC23C2112
	for <lists+xen-devel@lfdr.de>; Fri,  9 Jul 2021 10:56:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.153475.283555 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m1mIX-0002kg-5N; Fri, 09 Jul 2021 08:55:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 153475.283555; Fri, 09 Jul 2021 08:55:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m1mIX-0002i8-26; Fri, 09 Jul 2021 08:55:49 +0000
Received: by outflank-mailman (input) for mailman id 153475;
 Fri, 09 Jul 2021 08:55:48 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1OC2=MB=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1m1mIW-0002i2-Aq
 for xen-devel@lists.xenproject.org; Fri, 09 Jul 2021 08:55:48 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d49598d1-b7b8-4819-acbe-96e4b253648b;
 Fri, 09 Jul 2021 08:55:46 +0000 (UTC)
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
X-Inumbo-ID: d49598d1-b7b8-4819-acbe-96e4b253648b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1625820946;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=v80nvruMhMDWFw2bzoYTuW/XAJ9Oxps7XQZohkOcA2A=;
  b=iBqc59zSwFLZZQfL6MZmPAvO98LeyISS6HYuOuUEyap4nuXmjk6X31+3
   GqynvaGHE+H9Hlr45Xzf1i0O2T4BOZAG7DKAyepLjG+74U/CRUTfdC1O/
   EdBpr6CxaQKdFf0OMx3aNs+UPsy6jYUGZmTbX7v5h1Uo1j5kp6z6L+RBu
   4=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: HKveQechKVogurJDHf50iWrE9UmrzOMzk5rHVyo5XVZmHG8VCK7L2BGRp5Hitkn9VVd8rCb3Yi
 E2FvdVyLPaAXbBwke5irROYTHD68iGxh73Mfuj/o5n/Hu0NHnE16eDvtrzd6RalMrLb2XPqQLz
 QeNITddgKU4HLw20T4wrBHFm2G3IdpffZGZ+I/OR4gL3Y/3x9qgYU17/dbZ9xq31wQA/tlM3aD
 zTYjnemK7nmYmtDXnZiLPiEow6IdKkDP6gWzQJCsN4/FYagU6AKXHgZmDHH6ZAE3Rs0Sz1HS+4
 lPI=
X-SBRS: 5.1
X-MesageID: 48293333
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:yQxhtqEyCvE6zxF4pLqFF5HXdLJyesId70hD6qkvc3Nom52j+/
 xGws536faVslcssHFJo6HmBEClewKnyXcT2/htAV7CZnichILMFu9fBOTZsl/d8kHFh4tgPO
 JbAtRD4b7LfClHZKTBkXCF+r8bqbHtmsDY5pas854ud3ATV0gJ1XYGNu/xKDwReOApP+tcKH
 LKjfA32AZINE5nJPiTNz0gZazuttfLnJXpbVovAAMm0hCHiXeN5KThGxaV8x8CW3cXqI1SvV
 Ttokjc3OGOovu7whjT2yv66IlXosLozp9mCNaXgsYYBz3wgkKDZZhnWZeFoDcpydvfpWoCoZ
 3pmVMNLs5z43TeciWeuh32wTTt1z4o9jvL1UKYqWGLm725eBsKT+56wa5JeBrQ7EQt+Ptm1r
 hQ4m6fv51LSTvdgSXG4cTSXR0CrDv7nZMbq59Rs5Vja/pdVFcIxrZvuX+9Ua1wUx4S0bpXUN
 WHV6rnlbJrmTrwVQGogoFtqObcF0jbUC32BXTqgfblpgS+qkoJuXfw9PZv7Evoy6hNP6Wsx9
 60epiAx4s+BfP/U8pGdZA8qI2MeyrwfS4=
X-IronPort-AV: E=Sophos;i="5.84,226,1620705600"; 
   d="scan'208";a="48293333"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ns8AdZtXsAezku1Yo+a1/lU2IqdWtS0W+Zm3dUgMoKRGO2uBABTVZo5YjKcTFpTph80nrdVsmY1Iz2IB4rJkZJ85Af17VRV1QDUsO+SuGJIFmHq5ySUvn5i39GiN7zxrp43V1CyUu5xkNro6Ojb+F5J1y6C6gjlrq+JJH9QWD2Kwi0DpsU9ey8bThloBvCgaYRxyCk1OTZ9sfoEZ9fK3yzztQpkt4hA2zj4DOvGLSUfY5FkE417ceiOyhEFwRihELqw9UOuetZWQPO0rUz8qTnbMi7N6rGVKhdEkbFkUh31HvGnscBAtl9WrHIJ/TKzsInC1O1UCXdWoZNlj2iHlDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YV6xnMEA5BfgGTyWTcsopm+KDXmcg5HCi+m92NikJRs=;
 b=loD+Vg5dYnfZNPbMkA5Xl2j9nVgxjSEBheSbWZw/euRtJPTdulv53bzgnf9pMOY2XMXitNod5pgak7KzqKBiUJ+aWRMz7HhomvkD36n1dYpdIVDDkQnDlZT+TiRxi3iTjRykuhOmzUBBqtYJ7Zp/mBswnV/40jLql3aX7Og88mooyWLc7UHhhWqI/lM/X9EEgq5K/cBhjToRHXfiMpYF6eLGeNl5EPZZWh4ObevqCFTGIDeFwh2isnYekUNZXTCHl0iY+9EEJmmHzvWqgK0P/61cwnB1fil2v55Ck2/mCOzjw9fhfxs6BdFNRyGxrIz6HEVQlO1zvrSjJg6MiDwaWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YV6xnMEA5BfgGTyWTcsopm+KDXmcg5HCi+m92NikJRs=;
 b=B82nRL1Namdl9ZgLsRgolcNtRcJ1tLiFh/BwWcC8WfvA3m4/Xc+VdWlerpZvihe8uojOvQm/J0xZLr5qNJ1sRFcdLRMI3KKHXo9VcHn5i9r8iwCOHss/xbljihB/iuiBlK4r5gLZuif3QSLhsz9RUaR5fpuUDtzeE9oHvezZ+oA=
Date: Fri, 9 Jul 2021 10:55:37 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Juergen Gross <jgross@suse.com>
CC: <xen-devel@lists.xenproject.org>, <linux-block@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Konrad Rzeszutek Wilk
	<konrad.wilk@oracle.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Stefano Stabellini <sstabellini@kernel.org>, Jens Axboe <axboe@kernel.dk>,
	Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH v2 2/3] xen/blkfront: don't take local copy of a request
 from the ring page
Message-ID: <YOgPCZbEF+t5DN+G@Air-de-Roger>
References: <20210708124345.10173-1-jgross@suse.com>
 <20210708124345.10173-3-jgross@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210708124345.10173-3-jgross@suse.com>
X-ClientProxiedBy: MR2P264CA0049.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:31::13) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 52cb1f34-3824-4150-8f3d-08d942b75533
X-MS-TrafficTypeDiagnostic: DM6PR03MB4970:
X-Microsoft-Antispam-PRVS: <DM6PR03MB4970769F5B063410D42B93748F189@DM6PR03MB4970.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: g2mEckyKSJkkz/c8K57uQ83M83tEnN2m52VEPcOjBc8He2R6vjtK8fe5KWYkmdG6WNXygdBY3qBE3ubBb3L/1xjNajUPjPBlHUNVu6RnxMpC16gAClRKK8EpssyoteOE9Hm8Fzitx3iv1izLoskIYrG+W118MX89A/uRQ7yciS2BXDQccs/LbhIt+xuuzF/lbhMlm6XhWRk7tYPY5c2oxKd0n6oAn4pX4ogUm1aCrhBBGhGF73Fo8c1ilpFQggxJFmqP6f03JAG7qCOEiWabh4LJUwzxH+2xOUo4+cD2dI0G/tyQqF1k1DqJKAJe4NyAcT595VW2EHgjFt1UHPhJ5M4CciFGAac9yaNSTlpdD+RCWpGZKYCnZYSWPxV8RwXFo+H7dqkqc7ckYIY7Pz6TA+TISmiZ35sSU+97PMPtJGq2IFe5sSUsClRNvw05TS3QcqdF0a3DpWxTBKfzlYYGvoCOOe3iJrx7whd3xoPPHDjbkn6jKJWHLCbjfSo/NCKj/yrpLupYJ5HV2Uhkcm4enuZWEHeCk9XUvAGtwouUXl7y9W8PoKkNA2agDNhn3Mh609xjH+fbaD9LBP1zfFYppvQdytzHsVAJP4lCqLkGSCXlk9wfOvWJiBTcj5DoGL86VHlbi4qauy+D/e3mSY/vqQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(396003)(39860400002)(376002)(136003)(346002)(366004)(66556008)(316002)(6916009)(6486002)(4326008)(6666004)(33716001)(83380400001)(2906002)(66476007)(8676002)(6496006)(38100700002)(66946007)(186003)(86362001)(5660300002)(85182001)(478600001)(54906003)(8936002)(956004)(9686003)(26005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?anRkUGdtbmFLV2VTQ1VzcXVaZURtb3FvZzFGckJIbW9mT1paYnVjRUhmOEdq?=
 =?utf-8?B?a0R2QmpJME93WFRYKzNkc0Evd3FxeUFXMGF1UjRUbVpDbSs2K2N0Q1FnQ2NV?=
 =?utf-8?B?eFI5cWI3aTZuK21DRW1veCt5ODM4SG5HUGZjRzdvRnNwVWM4WWw5MVd5WThS?=
 =?utf-8?B?dUpQSzBPY2Z5ZnVhRUVZYUxkK3pQWU1NYnJHU2V0MFVDSDZYQThEYVEvN3F2?=
 =?utf-8?B?cjk0TEFrQkJwdVNka29McDdxNTJ3dnJ5M2wxZVVDQ3cyWCtNREpXU1VjbW95?=
 =?utf-8?B?d1lMV2FvQnlabGY4dHZ2L2pwdzMzVUxBWnhCWkI0UW05YXFEd0oxWHdXeXkx?=
 =?utf-8?B?ZUFQRytDZnlwUDA1TGFROVF6NWJ6UVhhcGJQSGZtMnhwVWVoQm1MaVdCeFdU?=
 =?utf-8?B?dS9kdEw5TEsxTTFDcXFKckhmcVlJaml3cXE5RmMyODUzcWFVU042RnZTdGZx?=
 =?utf-8?B?RVBJa2RGcllBK3lBUFlUSlRRUndjSit0VFEyWWZacDgrWTR5QmpNQVh1WFdo?=
 =?utf-8?B?NkxVYllYOTBTMGJDbjltYjBvbHRocExCT3VoWVhCWTlTeEY0K1dGL2FyTENt?=
 =?utf-8?B?NEI3VFRFVjRINXh0UERkOFptOUhYKy9YZUxRWDVEZWxNRVF2dGxDWXZLSUpo?=
 =?utf-8?B?bUZ4VHNCUGJ5Y1VwWlpwTDdyWkRHam4rOWZrSytTMzJ1eVhWelh0cjZXUGVm?=
 =?utf-8?B?L1gvclFqMk5oRlpKTmhZUDc4T2dXOHNmbFBBcGV4OVYxSUxnMWc1U0J4YUYx?=
 =?utf-8?B?ZkhOTjRZMWU2NEhxanVESEEzWHlkZk8wNWdleXpvbkxJS3BONXpKeU1IdU40?=
 =?utf-8?B?K3ZpQm56VTUwWmRUcXBQSVBKL0FHSFA0VXk1eURVeDdUbElxY2wwanpkREhK?=
 =?utf-8?B?ZVBTSzVVNjkyWGZzanQ5V2M2QzMvOTE4UEV4UG9PWkMzZDI2eWJEdW5Xem1Z?=
 =?utf-8?B?M1B1VVdtKzR5Vk9BUlJpL0ppUW43cHIwZzYzdzB3eEtqaUIzOHFVODhqT250?=
 =?utf-8?B?QTJuRlV6N3N1bEVxRWJDckFSYnNzUk5KSjJyaCtaNmYxWXcxSzQ1bTFxeCtQ?=
 =?utf-8?B?empFcU1GMDBPMzROdVVHVHpTbEhpQnpWZ1pJb0czTE9IYXpvU0VtWTV3Q3NM?=
 =?utf-8?B?QTkvN3JGOW02YTZod2NKWThScnV3ZStoUElNZEhPOVJwNnFPTjBFOGlQdTlr?=
 =?utf-8?B?YjUxUEV1ZUpPL21wMzNSU3pPWW11QnlDN3EzS1BLWnNrVUJ0R2xIQ1A2YzJR?=
 =?utf-8?B?VE9KeUJ5VEpmNTQzS1M5WVZHa3d6c0hkSTVKTkJReU93SThWV2piRlIvamRo?=
 =?utf-8?B?UWQrTmlnRlpFMTR5ZDR1NzlFVDVWKy9uaXhpUE14bFRBN2UzRDBhZVZZQVpH?=
 =?utf-8?B?RkNiMGNlZ3ZjaFI0V0JpSWR6WmNEdjlmUmY4M1dnU1NuL1ZTb2ora0JLWEJH?=
 =?utf-8?B?MWFnTDR6cW9XWU5LTEJDSzQrTWczYXJobGMzYmVXZG91VjAxUkJDNldWUjRa?=
 =?utf-8?B?K3ZhWjNDdW1sem1SSlMzQWM1ZTdJMXRZOUtDLzZvbkJiZkJreHlheEYzVGxH?=
 =?utf-8?B?QUQybVNCUTA0NHNJV2N5K0RwOVhjbUpteHp2U1JEUmVJUzhndE5YQzBEUjJX?=
 =?utf-8?B?WHJnTGIyQmVmS3NrenhTaUI3V3JPc2FFdWo2alp0WEVvT2VndUI1UXhKRlIv?=
 =?utf-8?B?aExHUmhXUzZ2Nm92aVpldHRmRkY3Z1hCY3pGM2pZdlltRExJc1p3U2JmY1Rv?=
 =?utf-8?Q?fHMa8lMDDlTino+kFORGGSbplXkbyukKAV1fN0x?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 52cb1f34-3824-4150-8f3d-08d942b75533
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2021 08:55:42.7507
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cZE1+H8WnRUMWGjscCQcz/r1gFb+W4wazpP4+jXiqeR2zYeUOrldT8srkzYpy5Ke0D1c09IgakVWHhrtk6865g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4970
X-OriginatorOrg: citrix.com

On Thu, Jul 08, 2021 at 02:43:44PM +0200, Juergen Gross wrote:
> In order to avoid a malicious backend being able to influence the local
> copy of a request build the request locally first and then copy it to
> the ring page instead of doing it the other way round as today.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Roger Pau Monné <roger.pau@citrx.com>

Thanks!

One unrelated comment below.

> ---
> V2:
> - init variable to avoid potential compiler warning (Jan Beulich)
> ---
>  drivers/block/xen-blkfront.c | 25 +++++++++++++++----------
>  1 file changed, 15 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/block/xen-blkfront.c b/drivers/block/xen-blkfront.c
> index 86356014d35e..80701860870a 100644
> --- a/drivers/block/xen-blkfront.c
> +++ b/drivers/block/xen-blkfront.c
> @@ -546,7 +546,7 @@ static unsigned long blkif_ring_get_request(struct blkfront_ring_info *rinfo,
>  	rinfo->shadow[id].status = REQ_WAITING;
>  	rinfo->shadow[id].associated_id = NO_ASSOCIATED_ID;
>  
> -	(*ring_req)->u.rw.id = id;
> +	rinfo->shadow[id].req.u.rw.id = id;
>  
>  	return id;
>  }
> @@ -554,11 +554,12 @@ static unsigned long blkif_ring_get_request(struct blkfront_ring_info *rinfo,
>  static int blkif_queue_discard_req(struct request *req, struct blkfront_ring_info *rinfo)
>  {
>  	struct blkfront_info *info = rinfo->dev_info;
> -	struct blkif_request *ring_req;
> +	struct blkif_request *ring_req, *final_ring_req;
>  	unsigned long id;
>  
>  	/* Fill out a communications ring structure. */
> -	id = blkif_ring_get_request(rinfo, req, &ring_req);
> +	id = blkif_ring_get_request(rinfo, req, &final_ring_req);
> +	ring_req = &rinfo->shadow[id].req;
>  
>  	ring_req->operation = BLKIF_OP_DISCARD;
>  	ring_req->u.discard.nr_sectors = blk_rq_sectors(req);
> @@ -569,8 +570,8 @@ static int blkif_queue_discard_req(struct request *req, struct blkfront_ring_inf
>  	else
>  		ring_req->u.discard.flag = 0;
>  
> -	/* Keep a private copy so we can reissue requests when recovering. */
> -	rinfo->shadow[id].req = *ring_req;
> +	/* Copy the request to the ring page. */
> +	*final_ring_req = *ring_req;
>  
>  	return 0;
>  }
> @@ -703,6 +704,7 @@ static int blkif_queue_rw_req(struct request *req, struct blkfront_ring_info *ri
>  {
>  	struct blkfront_info *info = rinfo->dev_info;
>  	struct blkif_request *ring_req, *extra_ring_req = NULL;
> +	struct blkif_request *final_ring_req, *final_extra_ring_req = NULL;
>  	unsigned long id, extra_id = NO_ASSOCIATED_ID;
>  	bool require_extra_req = false;
>  	int i;
> @@ -747,7 +749,8 @@ static int blkif_queue_rw_req(struct request *req, struct blkfront_ring_info *ri
>  	}
>  
>  	/* Fill out a communications ring structure. */
> -	id = blkif_ring_get_request(rinfo, req, &ring_req);
> +	id = blkif_ring_get_request(rinfo, req, &final_ring_req);
> +	ring_req = &rinfo->shadow[id].req;
>  
>  	num_sg = blk_rq_map_sg(req->q, req, rinfo->shadow[id].sg);
>  	num_grant = 0;
> @@ -798,7 +801,9 @@ static int blkif_queue_rw_req(struct request *req, struct blkfront_ring_info *ri
>  		ring_req->u.rw.nr_segments = num_grant;
>  		if (unlikely(require_extra_req)) {
>  			extra_id = blkif_ring_get_request(rinfo, req,
> -							  &extra_ring_req);
> +							  &final_extra_ring_req);
> +			extra_ring_req = &rinfo->shadow[extra_id].req;

I'm slightly confused about this extra request stuff because I cannot
find any check that asserts we have two empty slots on the ring before
getting here (I only see a RING_FULL check in blkif_queue_rq).

This is AFAIK only used on Arm when guest page size > 4KB.

Roger.

