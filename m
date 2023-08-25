Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 33BB3787F26
	for <lists+xen-devel@lfdr.de>; Fri, 25 Aug 2023 07:10:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.590500.922800 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qZP51-00016D-Ce; Fri, 25 Aug 2023 05:09:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 590500.922800; Fri, 25 Aug 2023 05:09:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qZP51-00013A-98; Fri, 25 Aug 2023 05:09:55 +0000
Received: by outflank-mailman (input) for mailman id 590500;
 Fri, 25 Aug 2023 05:09:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+VXW=EK=amd.com=vikram.garhwal@srs-se1.protection.inumbo.net>)
 id 1qZP4z-00012p-Bo
 for xen-devel@lists.xenproject.org; Fri, 25 Aug 2023 05:09:53 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20619.outbound.protection.outlook.com
 [2a01:111:f400:7e89::619])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9e490a95-4305-11ee-8783-cb3800f73035;
 Fri, 25 Aug 2023 07:09:51 +0200 (CEST)
Received: from MW3PR12MB4409.namprd12.prod.outlook.com (2603:10b6:303:2d::23)
 by DM4PR12MB7597.namprd12.prod.outlook.com (2603:10b6:8:10b::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.27; Fri, 25 Aug
 2023 05:09:46 +0000
Received: from MW3PR12MB4409.namprd12.prod.outlook.com
 ([fe80::8931:6349:9a02:48c1]) by MW3PR12MB4409.namprd12.prod.outlook.com
 ([fe80::8931:6349:9a02:48c1%4]) with mapi id 15.20.6699.028; Fri, 25 Aug 2023
 05:09:45 +0000
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
X-Inumbo-ID: 9e490a95-4305-11ee-8783-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h++hclkRSpieubNfLdWpQyKECmJrNhM372ysUYwRwxntVvmco5WUQC4EXG4E91hPNEY/sgnkNkN9MJZaM4gUXHgyo3Hld5+Kh4ceg+rSKqxzu8ultgdNTlmIUmw46Bh9APFEokZZiI5kl0lDRxN/epdRTzNnzbBVTVqp/mWbs/aIwdw2bFJQcqpvmWRjAquNK3o9/jkJH4qHRhPXoFwpJNhr/PsJuVg3DqED003Pe3S0z39XWi1MLqZ/ZMmQPS/+XHpzyxNjNaPBizG19Rqe+/DDdL1I0ayM/WFwNLIIvEGfboSNZpHC6KyV9ZqcZSMeAz1EXmCQVJ7K/d4pE90cKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LthECWouvaQOZ+qDwH7JUelIlPzBC/05/D4Z62sZpp8=;
 b=ff1Jqyd7ck6JAXN6FWqpzkVnxr3mJoqgBWmpFOgmgzbXGw2j+dmnThD/a+2iaGpfszc3THh/DvLjG0xPQG4UpOWsUZVRCNqU0D1GxfMrucYHZfIuIzMuLS9fsm7VGIkiolpXHBQFkGsuqBVP3W6wDyswpFY/7WUjlsomOpp+AIP4z003n33DvIsP3sPVygaCnUY9wGblidKhfGt31729KAPqzewYC7BEDHhwu8dE3/aAQRzTXDdmUD2bVuw+PjdQhS4rpKNruFck83yH6ARQohqRP0JQOkcRNZhmfLqX8rlnOEInd8oRBXTx6itPckarKVr/zGnoCQ679z6kXvsIBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LthECWouvaQOZ+qDwH7JUelIlPzBC/05/D4Z62sZpp8=;
 b=fnsrnoudZFNqEUzUuEz+WgOXSIWAhNWwDBCSgnwv2Fc0nW4Zr6wAqAuSB55VKuB+RVaO+RhR473YAFp3YiqVXCW+apbfr+ewUEesbczFkOyWtQ5B/ImtfE94GFgUSQF59cIjsVEiH3NuaoXOJTy6NAK8FRf1nM0xnW3P0ZHAHlU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Date: Thu, 24 Aug 2023 22:09:38 -0700
From: Vikram Garhwal <vikram.garhwal@amd.com>
To: Julien Grall <julien@xen.org>
Cc: xen-devel@lists.xenproject.org, michal.orzel@amd.com,
	sstabellini@kernel.org, jbeulich@suse.com,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [XEN][PATCH v9 09/19] xen/iommu: Move spin_lock from
 iommu_dt_device_is_assigned to caller
Message-ID: <ZOg3kurjD16J2vtr@amd.com>
References: <20230819002850.32349-1-vikram.garhwal@amd.com>
 <20230819002850.32349-10-vikram.garhwal@amd.com>
 <e77c9551-a167-468f-b889-e2a0a18471c6@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <e77c9551-a167-468f-b889-e2a0a18471c6@xen.org>
X-ClientProxiedBy: BYAPR01CA0024.prod.exchangelabs.com (2603:10b6:a02:80::37)
 To MW3PR12MB4409.namprd12.prod.outlook.com (2603:10b6:303:2d::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW3PR12MB4409:EE_|DM4PR12MB7597:EE_
X-MS-Office365-Filtering-Correlation-Id: 0dc42b3f-083d-4726-3896-08dba5297f45
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	6NeaGeNHE7EC7tOozGa7V9PtupgiM9ep/iJCBC5fukp43icH1ZOK33/+echRY4cI68UsBC7l35abuqSajEJySXUEoiG9XsFp4LDfHdXx+eN51/6EabEMelEKRSrZ3oC0sNqrYOp8H99oJKSPvPib2XuK+ZVSEjN7t7SinKpzEBeC9LO7nw/4Gu4TU3w39AOxwGv+zMFz5faPVrQa3vcUj2NCn/RbNsMGVUbvWqGJl2qGwPTxerCYrV6k/t0FiS4KB1DDwAz1PC3x4UuH+L8YwObmpz6O5hqk0OxMRcPfpxBd4A2JY0UEoKmg4oHNKtRB+qGZUREVq3sFmdia63oQ8sKMHA1JHSVevHpMMHpkRlmjNSWuWduS/jkwxi31FqWfB7p5zHv8sUdZ4y6w2sl6Tlj4vOmmEDmdAonta83Nq9KAnGXkg6sEd5Mtit+0fY6Sik6wPRxKURQunxZaGeXD6Lt3Ra59URIpMoo4vofrMPYmCDFzguWqVabGTtHbEZFJvBDkBizDjRpJokHpLhCcXE5H2Ymu+X+hq141uUmG/m0skM+X5rW5lUtDTyiBMuZr
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW3PR12MB4409.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(136003)(396003)(39860400002)(376002)(366004)(451199024)(186009)(1800799009)(54906003)(6506007)(66556008)(66946007)(66476007)(316002)(6916009)(478600001)(26005)(44832011)(38100700002)(6666004)(41300700001)(53546011)(86362001)(6486002)(2906002)(6512007)(4326008)(8676002)(8936002)(2616005)(5660300002)(83380400001)(36756003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dzFIUWdoZUdONmtqMTkrN082V05KTjNUN2V4MEJWNHphUXF6aEZ3VzhPOUxn?=
 =?utf-8?B?cVJaeXIyV1Z4d25pTzRpOTN1ZkphNGFndFIydjVjQ1IrQk10WVkvdWw5Wits?=
 =?utf-8?B?YU9mRHhxclVMVzBDVVVpVFh6R0YvNWVuRDZEcjZKVDFjWjFKNlZ5aFZZUWFq?=
 =?utf-8?B?VmE1WHQ5cU5ud2lFR2tFa0huWERQb291Tk1LMFpwMDQrMTVSUXFmOGFXY2xW?=
 =?utf-8?B?S2xMN0EvelpuQkFMMkoxSmZQakg5YTZuYnpGRHQzbStFdDMxaExIUCtWcnM5?=
 =?utf-8?B?YWdUR0pjUFV3M2VjcE0zZlBJb2xrU1NFZW1WZ0xxak4wakcycVFHeTB2Yk8x?=
 =?utf-8?B?bGpiZjFXVnlIL2xJVmVvb1RvMWZ6eGxaNVVaSk5yZVlQTnZEYS9oQjlrb1A5?=
 =?utf-8?B?UXFjNGxZVVZXQlZJNk44eWR5c0k3NzE5V3Zwc2ROT2IrTWdCWUcvN0NLR2VE?=
 =?utf-8?B?QVFPRkNNdi9xQ1E1K1JmckNXSVlrcGtUNkRwZXU2OE5EandGTGpHcTFpYzNt?=
 =?utf-8?B?ZHI1UHBMKy9wKzlaMi9jVGVZNmszR0xOZEFKRlJseUYrWWRsNE5mMTZObis0?=
 =?utf-8?B?cFQzRHdwb0xHR3BGbkIxOWt0cDQ2MXI5VXJqR3kxMGVsNnpkelN2RjhCbmt5?=
 =?utf-8?B?M3NzRkpwaktueEEvNTNPWHA5Tkc3SGlMOWVkN1kwMGFoUU0yN0JOdk5qWmt5?=
 =?utf-8?B?eW9SYS94VkZzMCs2T3FqcXEySDRISDFaa29GR3lWa2ZRWEdSV3RTVFNwcUx2?=
 =?utf-8?B?MmgyMzhmMFpWaUF6VmxEbnltYnlra2NJdm1ZaHh4ako0WE84Y3F5dHZTK2lq?=
 =?utf-8?B?SkFhd045ZDZORVNqWUxMcTBDdFdCQk93bFhHZWY5WGRRaTFiclRaUEtLaHRP?=
 =?utf-8?B?eXYvd2FPRHJwRkxYbWo4Q0NRVFRtcGVudnNFZDhrNTJEcGpKVUJXY0JsTXdm?=
 =?utf-8?B?cjdBODdrMzhZWG1QQUxlMThQbjhSVjFhejhRRnlLMlNRSkF1TldYMTI3OVBw?=
 =?utf-8?B?MzdmbkpJc3lvL003bm4wZGNJT2xOaklLQ0RtLzJwbjgvbmpTZG0vZGk1NTRQ?=
 =?utf-8?B?TmtINW9sMGQ2cURNUm04ck5PdGhVaEtVYUdLQ2lQdEpKWUNUZFBscG1qREox?=
 =?utf-8?B?WDFTRStCNmxjVnFsdG1Id1gvQitGd0RjbTh0SCtBbVVSb014OW1BNXVBdmh5?=
 =?utf-8?B?c1pQcnI3K1J1cXFEbWIybDVsWkpIemZ5dkl0RTNWOXovM2xjVk1YdS9GTWlP?=
 =?utf-8?B?RnlrTFRwT3NhaXpaNUpKR29jd0xLaUVldGxVUjlWMkNJV2ZTQVNzbmlUeis4?=
 =?utf-8?B?QkxMaEFXV0NySTVKK1lMbTJPei9ZSUtFamV6eDlIdnhFSmdlOW1nY0I3NndB?=
 =?utf-8?B?ZXFmM055ZDFka29jYnlkZHdsM1YxUjBRQ0J2N1hMQzdENGdqcUJxOUlpZmZk?=
 =?utf-8?B?QkVGQjNFeHVEZlJWTnd3R0ZtQ3pFajFWK1poOVBnelJUYnV6ZDYxYUlGRzVj?=
 =?utf-8?B?V3lWT1JjYzhKdWlmUjB3MDJOOVpSelF3M29UVFRaOXMzeDlPanAwc0h3QTRy?=
 =?utf-8?B?V3NRYllIR0VGUmxzUVo5cFJLUXJ1YU1NLzdkb2w1MWsxR1lteVpFSVJGY2c1?=
 =?utf-8?B?NndTUk1mWm02enRGQ0NaZmd0WjZyY3ZyMlZPRCtMNlZVK3dIb0NWL3BaempJ?=
 =?utf-8?B?OVBEN1NUN21SUExDeThSWEx2bWZzcmgxWURTRzA5dUZOdEJJQTRHM1VEbmph?=
 =?utf-8?B?eVVIU3lueXJMaFZoM2g0SW9pN2lOS1VhTFRtbkZ4NVBvcnJNWUd1RGw5Q2d1?=
 =?utf-8?B?UEZpcThSSHRPUUNXWVR6TWg5am9sWTVGL3RBRE16eXU4Sm9wOXk0RS9HanBJ?=
 =?utf-8?B?TGlpZ3pVLzV5OHMvbFd4RWpvRTBSUFZRWXdhaGo4MDNkaXhEdnN3bG1JeWVO?=
 =?utf-8?B?NW1QVmpuazVKbTFaNnJxelpyc21samFTUFFHcFpNMVp1UlZxdElwTk8wUWJH?=
 =?utf-8?B?RGxqQkErRXBIWjAvTXh5Z2FVZ2tETGY1cUNQeWVYQ2YybHRwVXh4YmZSVk1M?=
 =?utf-8?B?RTB2WkcyUGlZd01hOTNBcDRiWGlLaktqcEZsSE5oaFY3RGlOdG4rc0NsZUta?=
 =?utf-8?Q?mgQFY4O0YTZDWjqTZPpa88csv?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0dc42b3f-083d-4726-3896-08dba5297f45
X-MS-Exchange-CrossTenant-AuthSource: MW3PR12MB4409.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2023 05:09:45.2720
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I0U+Y/ZJ+qI6ByoSS8TENqTb8zgXl8QaMRnEU0hWksLi+mh7cE28kQt/WlzU6NLXuHd7qNOah9keDZlvjM5ATA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7597

Hi Julien,
On Tue, Aug 22, 2023 at 08:43:27PM +0100, Julien Grall wrote:
> Hi Vikram,
> 
> On 19/08/2023 01:28, Vikram Garhwal wrote:
> > Rename iommu_dt_device_is_assigned() to iommu_dt_device_is_assigned_locked().
> > Remove static type so this can also be used by SMMU drivers to check if the
> > device is being used before removing.
> 
> I have commented on v8. But I will comment here to make easier to keep track
> of comment.
> 
> I don't think iommu_dt_device_is_assigned_locked() should be called from the
> SMMU. If you want to check a device is assigned then it would be best to use
> the internal state of the SMMU.
> 
> This has two benefits:
>   * This avoids what I view as a layer of violation
>   * This confirmed that the internal state match with what we expect
> 
> > 
> > Moving spin_lock to caller was done to prevent the concurrent access to
> > iommu_dt_device_is_assigned while doing add/remove/assign/deassign. Follow-up
> > patches in this series introduces node add/remove feature.
> > 
> > Also, caller is required hold the correct lock so moved the function prototype
> > to a private header.
> 
> I don't understand how requiring the caller to hold the correct lock means
> you need to move the protype in a private header. Can you clarify?
> 
With removal of check in smmu.c, this header is no longer required.
will remove private header too.
> > 
> > Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
> > 
> > ---
> > Changes from v7:
> >      Update commit message.
> >      Add ASSERT().
> > ---
> > ---
> >   xen/drivers/passthrough/device_tree.c | 26 +++++++++++++++++++++----
> >   xen/include/xen/iommu-private.h       | 28 +++++++++++++++++++++++++++
> >   2 files changed, 50 insertions(+), 4 deletions(-)
> >   create mode 100644 xen/include/xen/iommu-private.h
> > 
> > diff --git a/xen/drivers/passthrough/device_tree.c b/xen/drivers/passthrough/device_tree.c
> > index 1c32d7b50c..5796ee1f93 100644
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
> > @@ -83,16 +84,16 @@ fail:
> >       return rc;
> >   }
> > -static bool_t iommu_dt_device_is_assigned(const struct dt_device_node *dev)
> > +bool_t iommu_dt_device_is_assigned_locked(const struct dt_device_node *dev)
> >   {
> >       bool_t assigned = 0;
> > +    ASSERT(spin_is_locked(&dtdevs_lock));
> > +
> >       if ( !dt_device_is_protected(dev) )
> >           return 0;
> > -    spin_lock(&dtdevs_lock);
> >       assigned = !list_empty(&dev->domain_list);
> > -    spin_unlock(&dtdevs_lock);
> >       return assigned;
> >   }
> > @@ -213,27 +214,44 @@ int iommu_do_dt_domctl(struct xen_domctl *domctl, struct domain *d,
> >           if ( (d && d->is_dying) || domctl->u.assign_device.flags )
> >               break;
> > +        /*
> > +         * To ensure that the dev doesn't disappear between the time we look it
> > +         * up with dt_find_node_by_gpath() and we check the assignment later.
> > +         */
> > +        spin_lock(&dtdevs_lock);
> 
> This change doesn't look to be explained in the commit message. But looking
> at the code after this series is applied, you justified the addition of
> read_lock(&dt_host_lock) to protect access to the device-tree. This will be
> held longer than dtdevs_lock. So is it actually necessary to move the
> locking earlier?
I re-looked at the implementation and actually, dt_host_lock will protect the
dt related changes. I will move it down before iommu_dt_device_is_assigned_lock()
call.
> 
> > +
> >           ret = dt_find_node_by_gpath(domctl->u.assign_device.u.dt.path,
> >                                       domctl->u.assign_device.u.dt.size,
> >                                       &dev);
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
> > index 0000000000..bb5c94e7a6
> > --- /dev/null
> > +++ b/xen/include/xen/iommu-private.h
> > @@ -0,0 +1,28 @@
> > +/* SPDX-License-Identifier: GPL-2.0-only */
> > +/*
> > + * xen/iommu-private.h
> > + */
> > +#ifndef __XEN_IOMMU_PRIVATE_H__
> > +#define __XEN_IOMMU_PRIVATE_H__
> > +
> > +#ifdef CONFIG_HAS_DEVICE_TREE
> > +#include <xen/device_tree.h>
> > +
> > +/*
> > + * Checks if dt_device_node is assigned to a domain or not. This function
> > + * expects to be called with dtdevs_lock acquired by caller.
> > + */
> > +bool_t iommu_dt_device_is_assigned_locked(const struct dt_device_node *dev);
> > +#endif
> > +
> > +#endif /* __XEN_IOMMU_PRIVATE_H__ */
> > +
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
> Cheers,
> 
> -- 
> Julien Grall

