Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B82378D7D1
	for <lists+xen-devel@lfdr.de>; Wed, 30 Aug 2023 19:21:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.593218.926175 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbOsR-0002Ur-1p; Wed, 30 Aug 2023 17:21:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 593218.926175; Wed, 30 Aug 2023 17:21:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbOsQ-0002Sd-TZ; Wed, 30 Aug 2023 17:21:10 +0000
Received: by outflank-mailman (input) for mailman id 593218;
 Wed, 30 Aug 2023 17:21:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dzxB=EP=amd.com=vikram.garhwal@srs-se1.protection.inumbo.net>)
 id 1qbOsP-0002SX-94
 for xen-devel@lists.xenproject.org; Wed, 30 Aug 2023 17:21:09 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20612.outbound.protection.outlook.com
 [2a01:111:f400:7eab::612])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9a02ff8c-4759-11ee-9b0d-b553b5be7939;
 Wed, 30 Aug 2023 19:21:07 +0200 (CEST)
Received: from MW3PR12MB4409.namprd12.prod.outlook.com (2603:10b6:303:2d::23)
 by DM4PR12MB5231.namprd12.prod.outlook.com (2603:10b6:5:39b::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.35; Wed, 30 Aug
 2023 17:21:02 +0000
Received: from MW3PR12MB4409.namprd12.prod.outlook.com
 ([fe80::8931:6349:9a02:48c1]) by MW3PR12MB4409.namprd12.prod.outlook.com
 ([fe80::8931:6349:9a02:48c1%4]) with mapi id 15.20.6745.015; Wed, 30 Aug 2023
 17:21:02 +0000
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
X-Inumbo-ID: 9a02ff8c-4759-11ee-9b0d-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g/Wh1fjjtuqT+PbIAjg4lfA1fzgH+QAB2Lm1xSDHOOveIZzzFRIpWzex/9CTCJznDBoHpkCOvrBWUftPOQCU8BDba+8rqWg4O+TO46+LgDhryHRLCyGx1H43He1F5KvLCCJdesaY5crZuq8vYIdElF9UUkuOq3AkuvgORtHK1uyom4nWX9yYAN7Qsv9ghEiD/rn641LwgCZQ9j6YNXRS+vEb+YidJh0JQn4LdYq2k7orTVuY45oanwiRmKZVcOgta/9YxulnRKULiM47orcwRC5OKiULiDoeUQRGFUQztNfsA3KmLDDiRt8ulrN7jwa7HhREQj5C90N9ERxMrdbJmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z7VFgtWVVpZ8oUKynHRGq+XOwFCKH3v3MXtcKBLFT+U=;
 b=Gp7x+5vMIjbPCV8zdXtCS9qZQUhQaZ8lN4dQIX8gf5rO2WHg2Dq6UCm6Cb1cHwToN758PDoRcFzKxlu7tcurGdFFVBPVzh8ukQ/xGjEpSXlTy/ZeP/MIUlUmN6isJBImai28Su/UXRAOGdCP0zerJr8YfUyUNV5IA97dO/29chJzekQ/6QiSHczHZA8Fet1XqiznscH3wcUa/K4f0AGNvu4CvbXGhv8433gVXriI/FTtufKClhAzdf+sXDCoK+ZVQk8OjRbfipM6r4vV/FmtNpxU4Xg3KlJBVpWbp0UJTEdMjXpQLBseUZKuU63jGWB1qyxhq8pdM/AEFQarT7mUQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z7VFgtWVVpZ8oUKynHRGq+XOwFCKH3v3MXtcKBLFT+U=;
 b=v6bXE/mmBnISuB+CVMesJhSNmIVuqhIhRkTjZTX84fa8zd7zpkzTP4yYKWvpk9/zoTYxLB40w+H9HBwLslL0tzGHkU+u7bbUZc6ecUI54ohLqqPxCjVGpdbq3KhxjLTdxLZvB9i1q83qIGzY215Y5jZ02GUmWJ0T8j6MrTKrRuY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Date: Wed, 30 Aug 2023 10:20:59 -0700
From: Vikram Garhwal <vikram.garhwal@amd.com>
To: Michal Orzel <michal.orzel@amd.com>
Cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org, julien@xen.org
Subject: Re: [XEN][PATCH v10 09/20] xen/iommu: Move spin_lock from
 iommu_dt_device_is_assigned to caller
Message-ID: <ZO96e6stC178o3eo@amd.com>
References: <20230825080222.14247-1-vikram.garhwal@amd.com>
 <20230825080222.14247-10-vikram.garhwal@amd.com>
 <301f4799-ff57-c697-94ab-62eb39397c44@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <301f4799-ff57-c697-94ab-62eb39397c44@amd.com>
X-ClientProxiedBy: SJ0PR03CA0346.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::21) To MW3PR12MB4409.namprd12.prod.outlook.com
 (2603:10b6:303:2d::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW3PR12MB4409:EE_|DM4PR12MB5231:EE_
X-MS-Office365-Filtering-Correlation-Id: 8d8ff95b-e798-48d9-1abd-08dba97d7c5a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	1Sc27r3LIdrT2FubnGmFGUJ6gz5eTusJy10kkundHaeyhDYwbaMyGGrDA9+lns/YpWM3rONzqvCEChu7R1gWhNlmYdHo+0X6j+yghJwHZlBPeU528e2sZmTioy3EL95/gEnw8XoTsuYojxP+dcPyZ1NpYqNMqOOHhjbL+JMXbg3FK9ZvjZNOxJ8XgSBSrGyRbMG+wolmywbZ+f6pIc8i3JekMNC79EhMzvjB6AhFOY1SGoiCrTkcanK8+o4DI0HtmZKQ+7D4GUyQp0U80Mko1pAb9F7luPdw+UJlJ/5EVY9/rDSar+3Cs5cD685evboiRDb++LjZWI7pySMI3VP4vWnldClUsWEmB7Wefaofwck29ChgsFUTvu4Shsc8RHShSB1z/8vdp01NlCdnhJyARtQtYqlY8rnZK/c8gqAF+fZAHk0gnCITY+JAStoo602YuJddWyZjtn2PpftybReqgpiV18BSxDnp3aLFJyFIcAMaqPFuJkWJ0x2Q4eQ933/mIHxX8dXvs6oziii9gcAvYyshKAwJ7bSJlWusVuZUNLNtC6U5IIYqmgRuvdfUNIfa
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW3PR12MB4409.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(346002)(376002)(136003)(396003)(366004)(186009)(1800799009)(451199024)(6506007)(6486002)(6666004)(6512007)(53546011)(83380400001)(26005)(478600001)(6636002)(316002)(41300700001)(37006003)(66556008)(66946007)(66476007)(4326008)(5660300002)(8936002)(2906002)(6862004)(8676002)(44832011)(36756003)(86362001)(2616005)(38100700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eEU4bHl3U045UzY5VUhmb3JIdWZadVZIQkVsZ3FEY2NpWDR2L0o5ZUdvazcv?=
 =?utf-8?B?TW83YmdQTUkwUDlOa0w3TG1XYitRV3dHSVp1RXBRNjBOK3JJeGppc3BxdExk?=
 =?utf-8?B?NFE1aDR2a3RVNHhRTFlKUG1BWWo4aHk1Z2ZESnZIVTdXYno1SmM4c2F1K0Ir?=
 =?utf-8?B?RFFqQVpLMzN1bUtyOWZOckxwL2Q3bW90eFFsanBBTmV5ZDRJclNwU0xZdTVY?=
 =?utf-8?B?SFZHN21wUXdxc3EwVnVHWFA2TFkrcEdwRUdlQXhnWUg0bDBPMjhOM01kKzA2?=
 =?utf-8?B?c0h2L3YxSHRQNmY1cldFUE5NKzNJalNPMHAvZWY0N2F4cFZueTh5UkltdzNo?=
 =?utf-8?B?TTlXZ3pSL0tsa2lDWGtQOFVZTWV0cE5UdjM1by9kVFRDbVJRNEZzaldGQ2l4?=
 =?utf-8?B?TkZMb2wyUmJjVThkayticTFSWk8rZUxFUlFNTnhzZXRmYVdEZFFLY3ZnTmR2?=
 =?utf-8?B?MHFaczdQWnI4eUc1RVpkcjJwcWFURjhxYnh4MWp4T3k1UlFzazR3amJJWitt?=
 =?utf-8?B?NGhZRWxXWGFnTit2WlJiZkdPOHVYNHlScTdEMjV0V1ZVVGQxWW5ZNWl1RXJ6?=
 =?utf-8?B?UlU0MlNqQlJKT05pRERnQ0NXak5zTTlPQm1Bb01RNHk4VDJoRncrKzJaOFVS?=
 =?utf-8?B?Q1VVak5HNlNCemlTYmJBTWFFYStoajhjZTNPYitvb1Fnbk5RbkRXcWJDeUlO?=
 =?utf-8?B?SXJmWSt4dTNJaTZHSlRZNTB2YVlyNGV4MGZ1amNMamE4ODhYMHdWemhpZmlX?=
 =?utf-8?B?VElOalB5UHZsdUphZ3pEeXV1K3kwRlNNK2pqQlIzdGNkY1diaDlwYlJvc3BY?=
 =?utf-8?B?bjRQcUh4alVnekJsaVpnUmFITExqZ1crcnUzenhHMVJwanJWKzFzMEV0NjV2?=
 =?utf-8?B?a2JVYkcyN2RqNThnY1BzTkhNZHpMMitCOVU5c2pZVmprYkozZ3VOam5YOXFy?=
 =?utf-8?B?TjBiVlMyZ3l2VjZ4S1NZTTljZ2pwcS9CeEtEWlBmV0RndmJlaXV6dHFxKzdP?=
 =?utf-8?B?UmtUWWsxOGsrb1JsTmlscHVWMEtiVzdsT3JOMFZnT3NRbjZrcllBQ25hZndp?=
 =?utf-8?B?WVloWlcxN0tWTEkwR1g5TUtBMXVvN1RUUkF4R2o5L3VjbGszaEljNzlCOXFi?=
 =?utf-8?B?Z3FuajZtWlVpM3lvbm55NmphVndtZFpsaXVZOWxwcnB5djdtMTkzZUdxbjJy?=
 =?utf-8?B?bXpTa2dUWk16dTBiQ1lWWVRxTFJJNGN0SGhBc0NLUFU5Z3pqSU04aTJ2M21Y?=
 =?utf-8?B?N3NZRHo1cHBGbWRDa29zN3ZPV2RDUWlUZUJDQzJzRXhQNzR4K29GSWFZaGJs?=
 =?utf-8?B?UklzQmUxR0krOGN2Nklnb1FIelVoOWhBbUN5Q1lWaVc0RW9DUmZHOFQ5cjQx?=
 =?utf-8?B?YkY5OXhPYjNXb0U4K1VFdGZHeFpVMS9iOVpVbzFjdG5NemFMalNBTzZnMk0v?=
 =?utf-8?B?UmordnJuTDJpSDlPdWxoc1E3SnpTZ2tRN3Z4Y1NleGNiREluaGJTUHhBZlB2?=
 =?utf-8?B?aVZScjJGSk91UnUvSFdQcHQ0Q29VQlc1YTA4UXNkTm80dnpwaGMrckxLYm94?=
 =?utf-8?B?Nlg3YWtaZ3lTV0gxekNoRXdvdnBNTVZsV2xrbjdMdklZcVlRcWI1Wkduckta?=
 =?utf-8?B?NlByNVNVTkswUjFkYVlOSU84Y1NIN280TWFJN1VXYjJpRHZvMnJLUzhVK0RC?=
 =?utf-8?B?TExCdnRnYkltWkNLZGZxTjluTDVVNjA2K29oc1duTWxhQVk3emhIWUpEclBj?=
 =?utf-8?B?OFdpUVBlM0NLbEFFV04rSzJRcUFkakhiWkI2UDlUU1p5ek4xTmxsUWVxazcv?=
 =?utf-8?B?bU5CSWhjYnBaMnpFWExMT2NqdW1ZeGVxa1QzdXNWWTJ2U2U3RUFRWWZtNlpo?=
 =?utf-8?B?UTZFV29ENGZ3SGZMR2JnVzBpWCtYOTZzbGVaV1JvMkJhQkR0MVpuN3BERC9P?=
 =?utf-8?B?U0tJRzJ1by9wVWtYOVZyUlljeXptZ0J6eHk0am0rRTZpbnlJYkxKVldyZ2p3?=
 =?utf-8?B?d3VObG5pOWkvL2Rwdko2N1VVaUlzTkpkdi9xVUZuZ1p1NkN3TlQ4NCtIOStx?=
 =?utf-8?B?MDNmeVkweU1iZXo3U1MzaUtKMTJIRmw2RmZKS0QzZlFZWTFQODZFa245bVli?=
 =?utf-8?Q?6wXjoAeeCPQjoZjt4wcLw0shT?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d8ff95b-e798-48d9-1abd-08dba97d7c5a
X-MS-Exchange-CrossTenant-AuthSource: MW3PR12MB4409.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2023 17:21:02.7089
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VcXzf2BgTW79WQCBGIYmVRP/G2Z2xixKVe0VAmuf1lVIg8wK/xfVIQ8jT+kQ8uRJxcOx5eDoaLiq7WvdqzRKmA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5231

Hi Michal,
On Tue, Aug 29, 2023 at 10:05:55AM +0200, Michal Orzel wrote:
> 
> 
> On 25/08/2023 10:02, Vikram Garhwal wrote:
> > Rename iommu_dt_device_is_assigned() to iommu_dt_device_is_assigned_locked().
> > 
> > Moving spin_lock to caller was done to prevent the concurrent access to
> > iommu_dt_device_is_assigned while doing add/remove/assign/deassign. Follow-up
> > patches in this series introduces node add/remove feature.
> > 
> > Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
> > 
> > ---
> > Changes from v9:
> >     Make iommu_dt_device_is_assigned_locked() static and delete header.
> >     Move dtdevs_lock before iommu_dt_device_is_assigned_locked().
> > Changes from v7:
> >     Update commit message.
> >     Add ASSERT().
> > ---
> > ---
> >  xen/drivers/passthrough/device_tree.c | 16 ++++++++++++----
> >  1 file changed, 12 insertions(+), 4 deletions(-)
> > 
> > diff --git a/xen/drivers/passthrough/device_tree.c b/xen/drivers/passthrough/device_tree.c
> > index 1c32d7b50c..5d84c07b50 100644
> > --- a/xen/drivers/passthrough/device_tree.c
> > +++ b/xen/drivers/passthrough/device_tree.c
> > @@ -83,16 +83,17 @@ fail:
> >      return rc;
> >  }
> >  
> > -static bool_t iommu_dt_device_is_assigned(const struct dt_device_node *dev)
> > +static bool_t
> > +iommu_dt_device_is_assigned_locked(const struct dt_device_node *dev)
> This does not apply cleanly due to recent change from bool_t to bool. Please rebase for v11 (the function
> should then fit in a single line I think).
Fixed the changes here and made it one-line.
> 
> >  {
> >      bool_t assigned = 0;
> >  
> > +    ASSERT(spin_is_locked(&dtdevs_lock));
> > +
> >      if ( !dt_device_is_protected(dev) )
> >          return 0;
> >  
> > -    spin_lock(&dtdevs_lock);
> >      assigned = !list_empty(&dev->domain_list);
> > -    spin_unlock(&dtdevs_lock);
> >  
> >      return assigned;
> >  }
> > @@ -223,17 +224,24 @@ int iommu_do_dt_domctl(struct xen_domctl *domctl, struct domain *d,
> >          if ( ret )
> >              break;
> >  
> > +        spin_lock(&dtdevs_lock);
> Why is this lock placed here instead of ...
> > +
> >          if ( domctl->cmd == XEN_DOMCTL_test_assign_device )
> >          {
> > -            if ( iommu_dt_device_is_assigned(dev) )
> > +
> ... here, right before iommu_dt_device_is_assigned_locked()?
Moved the lock before iommu_dt_device_is_assigned_locked().
> > +            if ( iommu_dt_device_is_assigned_locked(dev) )
> >              {
> >                  printk(XENLOG_G_ERR "%s already assigned.\n",
> >                         dt_node_full_name(dev));
> >                  ret = -EINVAL;
> >              }
> > +
> > +            spin_unlock(&dtdevs_lock);
> >              break;
> >          }
> >  
> > +        spin_unlock(&dtdevs_lock);
> You could then remove this one.
Ok!
> 
> With the remarks addressed:
> Reviewed-by: Michal Orzel <michal.orzel@amd.com>
> 
> ~Michal

