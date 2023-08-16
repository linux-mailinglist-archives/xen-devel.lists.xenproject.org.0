Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 10E4677EDFE
	for <lists+xen-devel@lfdr.de>; Thu, 17 Aug 2023 01:56:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.584958.915878 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWQMu-0002c6-D6; Wed, 16 Aug 2023 23:56:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 584958.915878; Wed, 16 Aug 2023 23:56:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWQMu-0002Zl-AF; Wed, 16 Aug 2023 23:56:04 +0000
Received: by outflank-mailman (input) for mailman id 584958;
 Wed, 16 Aug 2023 23:56:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CG9s=EB=amd.com=vikram.garhwal@srs-se1.protection.inumbo.net>)
 id 1qWQMt-0002Ze-6Z
 for xen-devel@lists.xenproject.org; Wed, 16 Aug 2023 23:56:03 +0000
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2061b.outbound.protection.outlook.com
 [2a01:111:f400:7e8b::61b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7352f072-3c90-11ee-8779-cb3800f73035;
 Thu, 17 Aug 2023 01:56:01 +0200 (CEST)
Received: from MW3PR12MB4409.namprd12.prod.outlook.com (2603:10b6:303:2d::23)
 by PH0PR12MB5645.namprd12.prod.outlook.com (2603:10b6:510:140::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.30; Wed, 16 Aug
 2023 23:55:57 +0000
Received: from MW3PR12MB4409.namprd12.prod.outlook.com
 ([fe80::1280:3c61:6568:3908]) by MW3PR12MB4409.namprd12.prod.outlook.com
 ([fe80::1280:3c61:6568:3908%5]) with mapi id 15.20.6678.029; Wed, 16 Aug 2023
 23:55:57 +0000
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
X-Inumbo-ID: 7352f072-3c90-11ee-8779-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aScrbhr7cx9BgGXcF2kxeT5H/dgfC651IVHnKRPddjCoNHgqHnLIhzseeSYiViaXdBk3j77jHkQ7tusk1fDl9YRK0HC/tYYJ2ozdXigIkbhmN0dmqkSHBNJlTWVypwuvDhlHdV8ilO+nh13gFK7ySQFKnBM8l93xYnN5uh8xCLuZIPPlP6sTA5C8pzoooT8w6iX8jcVrZT/6Z9R8NLZlevJh1XaXtndmZ7v0Zg220EfuC+1W8qYrGD3zXoS7JT1qU4WPcfVaJuGIkmqGJJ9l83d+IpItYpKRBEg/JDsj7v8NPbpzGNHai58EztvaHMwfJmo72H60B417A52O7OWZWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=isFgEM4EOujalJwah3nofj10h40PnbzgaB6MSvPv/yc=;
 b=ClA636JYlnHUHcgoWV2muROEf8moMjyECpFPqunLEe18s9RgyLZflL//FTtoKwsEhDCCiQ4tmWda4+URNm8il982z4zW941F2GIdJ2uFrAOB6KnlLKLIj+0bASUV9AAfiY7+eHFdOLds6K9NneECd6qXFnFFtyLTme/T97nnjDgLosuPRWP8f6gQDXjRnXVNx6f6nvZOsIS9KghtZChxslMNbR3/Wxy/L/xtcX2NqOd2UQypruLnaK5m6QvQ30EYkrclsj/3I2uhF/TspnKJsogszqyWFk9rigzFNKh3qbQYJRhedsGdA8B95zbCwzhXDnw9UNXxQsnp+1XwvFLTKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=isFgEM4EOujalJwah3nofj10h40PnbzgaB6MSvPv/yc=;
 b=3zPAViUb69bdfsbx4N92QFNxRYX7ekKRnY4kOuEvDEGxF+POI+4peK+EUl9tiOUBwFX0AP5g/9eH0znbJwS/511Nw4Jt2c5Cb36JsT3HtdNHvch1E1/q2P5aWnwcl4Ey7lRXjelOFDgFeg+FfTbUtnNCLyfzC0G19CJhP9E5zkE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Date: Wed, 16 Aug 2023 16:55:54 -0700
From: Vikram Garhwal <vikram.garhwal@amd.com>
To: Julien Grall <julien@xen.org>
Cc: xen-devel@lists.xenproject.org, michal.orzel@amd.com,
	sstabellini@kernel.org, jbeulich@suse.com,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [XEN][PATCH v7 09/19] xen/iommu: Move spin_lock from
 iommu_dt_device_is_assigned to caller
Message-ID: <ZN1iCrswRO1t+cAB@amd.com>
References: <20230602004824.20731-1-vikram.garhwal@amd.com>
 <20230602004824.20731-10-vikram.garhwal@amd.com>
 <831b46dc-eff8-b937-c0f7-57acc39afee7@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <831b46dc-eff8-b937-c0f7-57acc39afee7@xen.org>
X-ClientProxiedBy: SJ0PR05CA0018.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::23) To MW3PR12MB4409.namprd12.prod.outlook.com
 (2603:10b6:303:2d::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW3PR12MB4409:EE_|PH0PR12MB5645:EE_
X-MS-Office365-Filtering-Correlation-Id: c920d99e-e68e-44c7-1a0b-08db9eb455db
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Yv32fHsfEChpwuOe5cQMJ2JElZAI71V2NtA7owiZB0ONhGGaKJWpTEF6hxbKRgneTvfErIgqEoKSZcrSIZBuag+YoJpA5H/9HVix9Hf8E6hF4jGnbMEV8hhIz5HKfhRt9p9bJa18R2o7ht5MDAjTBfKoJ+ovQPwjyZowX5k2EiUg4FMIo2UQ/I/3WYg97XEO+6EZGapxZdok1miwtufVy8ZM1O0JAyVRR/Ru2h9zB/m1jBG/M++LjqQv9JfQLhSJgNmT92TX88coY/8WONajwttnNzV9w1205aYL3+V6Gt/rGKnet7mOamICQzLl7mWm5ug20IDQKPUUC2tyKDJFfBcrukF9mXW3DZIuOCTBQv+3aOLplk2ZoWvXgayE9ssU3qyo6X9/VKpr3zpVmHlQ4/MVsOXdvkkvmsYHSIfhe1wnqKSfFYjG2dTA499FESIq4NoHg2BDQGVcEyimFRWgENvZ7qKFCfPYomg7ZzYGuybqkKPB3Pt0GYmhr0jUZrgRiugbSLsILBk/l24Rt8P6/Yza1BkEIftDe4FtEElLMR5suZvRU3+gXTcDc29/uElkWoqmrdK65i9iM720u1Md3q52gWpBuq0CXHF4fq1Z3W4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW3PR12MB4409.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(396003)(136003)(346002)(366004)(376002)(451199024)(1800799009)(186009)(316002)(54906003)(6916009)(66556008)(66946007)(66476007)(5660300002)(41300700001)(44832011)(38100700002)(8676002)(4326008)(8936002)(2906002)(83380400001)(26005)(478600001)(86362001)(53546011)(6512007)(36756003)(6506007)(6666004)(6486002)(2616005)(67856001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RzJJUExEK3Q0MjJZdjBDVGwzSmJMRWRXb3llYXR6TnNFQWxJN2lBc0xjTDJv?=
 =?utf-8?B?VWVGSEVzS21nK3ZUaDJnMmpFV3M5WjFUbTNzUk9vT0NqZWIza2tYUU1STG11?=
 =?utf-8?B?ZCsvUFBUUDBqN2VNUytMaTcvUWxURVlJWU8zTzFTVGJhQU9iZUZCWTQrdnhv?=
 =?utf-8?B?MHRpL3NSUVB5VjRLcFkzQkJ2UkhoSGJTckF1VnBZN1ltd0wzYUdjeEFLZHBH?=
 =?utf-8?B?Z3RWakRZaXQ1TmxlT2xCczl1amRvZlBIbjVXVndFWEVPbUZzMWhuc0ZkZGdR?=
 =?utf-8?B?VkhXcGQzUXoxV1FiUE5UanlRTTZVQXk1U3FKM3hCeFB0eHFNbEJSQVZ4d3FZ?=
 =?utf-8?B?YWNQS29kZExPQ1ZWTXRwR2YySldtam9UbWRYU2lnZ0ZZU2xUZjRBZFEydjd3?=
 =?utf-8?B?YWFzaU9nK1JmWTc5K3p2WGxMM1BIWDh4MVQvNG5CSWtpSUdtd1dhMFJRODBp?=
 =?utf-8?B?RWNtbXE4MG5RcWxaclEzSjZyNFNtVkRBU1ZQb1Y3RDE3QkVvWXFLd1hsUU5n?=
 =?utf-8?B?dTEzNFJjS1dBYisrRmY5eEVBRjdBYytTb1RiMWhxSHpxVUxxa0tkYTRaeUxi?=
 =?utf-8?B?c0VPeFg4YXJCTnRZLzZuU3dQK1IvY1FndDFLWUt2U1VrWTVOSG9laGN6eXB5?=
 =?utf-8?B?cjl1RzFqNlYveUFTU252SjJZaXdHTHVEbytOS2NhKzM1UmtXM3kxL3pLeGlk?=
 =?utf-8?B?U1NlTXE5Sm1Ud0xveURWckYwOVZCb1U5NWZCUmdBdTBOcFNkakx2WmJUMGNp?=
 =?utf-8?B?S2xZWnVuZFBaOWI4OVJyMTlUaGt0ejhnZWMrSlRoZ2tUSkt1ZmtYaTd6QlpT?=
 =?utf-8?B?ZVd2LzhFMWExTTh2Vkx3VzRQSCt2dGlncmdlMlFLZkNWR3ZYTWh2c1NFMWxC?=
 =?utf-8?B?NVNyb1J5RUdqdGtRZlJ1bFkrb2tEcFFacktnNG1pSisrMVpocXZxT1hrbnlY?=
 =?utf-8?B?Tjh4QWE0RXF1S3RkTUxWZVlpZG9kcTRPZFR5YUw2cnE2Q003eElpVTlqa3pU?=
 =?utf-8?B?bEdxcUpRY0FCODFHc2tlMGkyR1UzQnpIUEhLbXpuazRPR0JpVGJuUkdKOHVV?=
 =?utf-8?B?d2RQbkc3WWNxNnN6TXgzb2RlbkxQK3FsN2sxL0RWRWpaeHp4akFQeTRuYlpR?=
 =?utf-8?B?VmVPRk5UbGhMNGRMU0RVYXlUQ0N3ZVFqeWc5ZXhaOGZOQnhVUWF0ZUhiNC9i?=
 =?utf-8?B?NnVyTUpISFFBOXQ4R1F1T1lsVDJ3VGVsaUh2Mmw3eUFGcGptYXRuM1hWdzlX?=
 =?utf-8?B?Zkh3MWtIRG4zU0k3NHdobU1qOFFwMzNNcEVWZVRneTJIQTh1QUtoMlFwYWlX?=
 =?utf-8?B?QlBzb2RuaUhpVWlBTFgyWXZIcHhNeFg0bFAyYTFseGF1SjJHbkNBeEprcDVT?=
 =?utf-8?B?a0FHeE1QbjlSQ2l5cFdaamFPSlJIN3FXVEs2VzhPRkVMQ09rQWp1aU5wZzJ5?=
 =?utf-8?B?Z0gra3RuVGh3Y0R4WXAyRE1pUTV2VmNqQlV0aUExcDZpRFl0SWVKT1N0VmxE?=
 =?utf-8?B?bXJKdURCWG12c3BXRjJrYzFtbEJxT1ZxNmUrL3VjeUNPcmJ5ZnNiaGFjdlpy?=
 =?utf-8?B?QmRqc3YyMm90TVdTY1lBK0xhWDJpeWJWSHA1Zllza2Q2UFozUk81ZjB0UVhN?=
 =?utf-8?B?c25acFhDaWpmVmE1RFpnaXM0dDRkV2JscjdCUmcwdFJ6WjZhVG5aYkJaY1Qz?=
 =?utf-8?B?ck1NQmpVNmhxWFlKam1hcXFha2Frb2ZNTzdudXpRRmErQmEvZ1dVVTlscDF2?=
 =?utf-8?B?V3RmaCtHQ1M5akRyWXA1UWcrTFdUbXRtblBXaHdYMTVrZ0lxcDg2S1FkeHpj?=
 =?utf-8?B?UkZuSm1DZDF3T294ZVNtQUY2bnhQVER4d2RtaFpLTXlsUWprZ0NtWXNKZHNX?=
 =?utf-8?B?ZWhka0V1SlBQYjFHNHJ3UlFNRW01Y2YxMklTcnpwZTAwSzF6NHBNalNGbGgx?=
 =?utf-8?B?cWxvM2UzOWhrYkQ1Qnl5VWxBNWdxdGNENjNHM1hqL3F6UnVsMDhldGtTSUFw?=
 =?utf-8?B?dFc5QmFGVG9ocEdWZWhNUWduM0tMdGtlelJMaDkrbFJIbEZUTXdMZkl3ODM1?=
 =?utf-8?B?MUIvck9TcWF1QVlwa2JkbXhGOHhoZDBNejlQd012aldTTmZOWENYbTBBWTYx?=
 =?utf-8?Q?vQ4MQLfWRUYFJ3bHk0k18klph?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c920d99e-e68e-44c7-1a0b-08db9eb455db
X-MS-Exchange-CrossTenant-AuthSource: MW3PR12MB4409.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2023 23:55:57.6615
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GwUgNJqykJbInVS4vkfJzMNQ6vXnO+U0WAqInLwmoLvrIQ0uYsiSMUzxHTO+js9iliq9+80GUvfzX+ciaobSSA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB5645

On Mon, Jun 05, 2023 at 08:19:38PM +0100, Julien Grall wrote:
> Hi,
> 
> On 02/06/2023 01:48, Vikram Garhwal wrote:
> > Rename iommu_dt_device_is_assigned() to iommu_dt_device_is_assigned_locked().
> > Remove static type so this can also be used by SMMU drivers to check if the
> > device is being used before removing.
> > 
> > Moving spin_lock to caller was done to prevent the concurrent access to
> > iommu_dt_device_is_assigned while doing add/remove/assign/deassign.
> 
> Can you explain if you are trying to resolve an existing bug, or this is
> something that will be necessary in a follow-up patch?
Updated for v8.
> 
> > 
> > Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
> > 
> > ---
> > Changes from v6:
> >      Created a private header and moved iommu_dt_device_is_assigned() to header.
> > ---
> >   xen/drivers/passthrough/device_tree.c | 20 ++++++++++++++++----
> >   xen/include/xen/iommu-private.h       | 27 +++++++++++++++++++++++++++
> >   2 files changed, 43 insertions(+), 4 deletions(-)
> >   create mode 100644 xen/include/xen/iommu-private.h
> > 
> > diff --git a/xen/drivers/passthrough/device_tree.c b/xen/drivers/passthrough/device_tree.c
> > index 1c32d7b50c..52e370db01 100644
> > --- a/xen/drivers/passthrough/device_tree.c
> > +++ b/xen/drivers/passthrough/device_tree.c
> > @@ -18,6 +18,7 @@
> >   #include <xen/device_tree.h>
> >   #include <xen/guest_access.h>
> >   #include <xen/iommu.h>
> > +#include <xen/iommu-private.h>
> >   #include <xen/lib.h>
> >   #include <xen/sched.h>
> >   #include <xsm/xsm.h>
> > @@ -83,16 +84,14 @@ fail:
> >       return rc;
> >   }
> > -static bool_t iommu_dt_device_is_assigned(const struct dt_device_node *dev)
> > +bool_t iommu_dt_device_is_assigned_locked(const struct dt_device_node *dev)
> >   {
> 
> Please add an ASSERT() checking the lock is taken.
> 
Done in v8.
> >       bool_t assigned = 0;
> >       if ( !dt_device_is_protected(dev) )
> >           return 0;
> > -    spin_lock(&dtdevs_lock);
> >       assigned = !list_empty(&dev->domain_list);
> > -    spin_unlock(&dtdevs_lock);
> >       return assigned;
> >   }
> > @@ -213,27 +212,40 @@ int iommu_do_dt_domctl(struct xen_domctl *domctl, struct domain *d,
> >           if ( (d && d->is_dying) || domctl->u.assign_device.flags )
> >               break;
> > +        spin_lock(&dtdevs_lock);
> > +
> 
> 'dtdevs_lock' was intended to protect modification related to any IOMMU
> change. But here...
> 
> >           ret = dt_find_node_by_gpath(domctl->u.assign_device.u.dt.path,
> >                                       domctl->u.assign_device.u.dt.size,
> >                                       &dev);
> 
> ... you also include "dt_find_node_by_gpath". Can you explain why and add a
> comment on top of 'dtdevs_lock' to explain what it is intended use?
I have added a comment in v8. There was a comment in v3:
"ensure that the "dev" doesn't disappear between the time we look it up". So,
i moved the lock here and for dt_host the lock is added in follow-up patch:
"common/device_tree: Add rwlock for dt_host". So, this all will happen with
dtdevs_lock and dt_host_lock.
> 
> >           if ( ret )
> > +        {
> > +            spin_unlock(&dtdevs_lock);
> >               break;
> > +        }
> >           ret = xsm_assign_dtdevice(XSM_HOOK, d, dt_node_full_name(dev));
> >           if ( ret )
> > +        {
> > +            spin_unlock(&dtdevs_lock);
> >               break;
> > +        }
> >           if ( domctl->cmd == XEN_DOMCTL_test_assign_device )
> >           {
> > -            if ( iommu_dt_device_is_assigned(dev) )
> > +
> > +            if ( iommu_dt_device_is_assigned_locked(dev) )
> >               {
> >                   printk(XENLOG_G_ERR "%s already assigned.\n",
> >                          dt_node_full_name(dev));
> >                   ret = -EINVAL;
> >               }
> > +
> > +            spin_unlock(&dtdevs_lock);
> >               break;
> >           }
> > +        spin_unlock(&dtdevs_lock);
> > +
> >           if ( d == dom_io )
> >               return -EINVAL;
> > diff --git a/xen/include/xen/iommu-private.h b/xen/include/xen/iommu-private.h
> > new file mode 100644
> > index 0000000000..5615decaff
> > --- /dev/null
> > +++ b/xen/include/xen/iommu-private.h
> > @@ -0,0 +1,27 @@
> > +/* SPDX-License-Identifier: GPL-2.0-only */
> > + /*
> > + * xen/iommu-private.h
> > + *
> > + *
> > + * Copyright (C) 2023, Advanced Micro Devices, Inc. All Rights Reserved.
> > + * Written by Vikram Garhwal <vikram.garhwal@amd.com>
> > + *
> > + */
> > +#ifndef __XEN_IOMMU_PRIVATE_H__
> > +#define __XEN_IOMMU_PRIVATE_H__
> > +
> > +#ifdef CONFIG_HAS_DEVICE_TREE
> > +#include <xen/device_tree.h>
> > +bool_t iommu_dt_device_is_assigned_locked(const struct dt_device_node *dev);
> > +#endif
> > +
> > +#endif /* __XEN_IOMMU_PRIVATE_H__ */
> > +/*
> > + * Local variables:
> > + * mode: C
> > + * c-file-style: "BSD"
> > + * c-basic-offset: 4
> > + * tab-width: 4
> > + * indent-tabs-mode: nil
> > + * End:
> > + */
> 
> -- 
> Julien Grall

