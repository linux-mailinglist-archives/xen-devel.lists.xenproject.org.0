Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 66F06788148
	for <lists+xen-devel@lfdr.de>; Fri, 25 Aug 2023 09:53:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.590532.922840 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qZRd0-0004kD-JT; Fri, 25 Aug 2023 07:53:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 590532.922840; Fri, 25 Aug 2023 07:53:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qZRd0-0004iB-G3; Fri, 25 Aug 2023 07:53:10 +0000
Received: by outflank-mailman (input) for mailman id 590532;
 Fri, 25 Aug 2023 07:53:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+VXW=EK=amd.com=vikram.garhwal@srs-se1.protection.inumbo.net>)
 id 1qZRcy-0004i4-86
 for xen-devel@lists.xenproject.org; Fri, 25 Aug 2023 07:53:08 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20604.outbound.protection.outlook.com
 [2a01:111:f400:7e88::604])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6c6ccd2d-431c-11ee-8783-cb3800f73035;
 Fri, 25 Aug 2023 09:53:06 +0200 (CEST)
Received: from MW3PR12MB4409.namprd12.prod.outlook.com (2603:10b6:303:2d::23)
 by BN9PR12MB5244.namprd12.prod.outlook.com (2603:10b6:408:101::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.29; Fri, 25 Aug
 2023 07:53:02 +0000
Received: from MW3PR12MB4409.namprd12.prod.outlook.com
 ([fe80::8931:6349:9a02:48c1]) by MW3PR12MB4409.namprd12.prod.outlook.com
 ([fe80::8931:6349:9a02:48c1%4]) with mapi id 15.20.6699.028; Fri, 25 Aug 2023
 07:53:01 +0000
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
X-Inumbo-ID: 6c6ccd2d-431c-11ee-8783-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kCNw/V8KYBuOToERmQ+jbNGRHSRMxzhSUaw/BhXiNi2ZvOXi/mZMEY9/PksF+CZkIIakoECsE0hj7P4RPYdIJSOM9PufTgupCKGRMmPV6Vwk3KfhtsUJj2N1/qGgVAL10dcKT8tEohpK503xQPEqveWVHeXvf9PjVUNm3/l7wvgHzI3/9UPWBoPJNrbRXLrdxaUn/cpS2dOG2W9MARJNS2nQxHs+Z3j40+227zi1nb1fPYOcFJZnkOTR8VrnR4puXQycHE7sblmCOkLfW6yZAgSkPnYlIhSLc8CYWg6Yt4+YUJVH5/tQDVPfcDV0RDqxsMGOE4rbihnI2k6qMfUglw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2Z7vaWuZHtH50LUmhxO31eQwQmjEqzQnNSpbiJWkMwA=;
 b=oD0vgNkeDWMnrpamR7f9bLUk/HZBVtzHldiIfWjBzzrjvdMNUc7Ejz3k3bsca4oEIZ7EuNU4D58KE3/yK8V0x+kPH81HjUCGl0MgsCtWY4phnuOkOAhDJZQGUdJjgc/m0+UuW+TBFt2mLgpcjzxtOKRMFO4VBb8ILdQgNtZpZqRmvWirZan1Diu/adYyJo1/oMwb5GqLMbygYtrxy1MygpEZFGVlNbcEiC5epslBaWOh3xe+xww7ugvGDUbFhlamjXz4V4EjyIFMuZ92yHB4oP8lq0vqx1lfhLw4DR6Io/vMR4k7itURQZ5YKFt8WILtsEHuFKGCv5cbE/9uv6xwKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2Z7vaWuZHtH50LUmhxO31eQwQmjEqzQnNSpbiJWkMwA=;
 b=EZnftJBsivs2oUPG0DnIq5UqmeLLnO0b0fd5L8hclsHrHTeiQE6Og12Ij5fq/GiiM3a7ATAEVttqNaTQhnJB+AJtTOCHENtIlp1mTiRZpG5mVN6GqBHXQ/IWuXGaxmv+I7iyjawacdfsM3FIRA3g57b1UE6RnE/l3SZeNDqWHrs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Date: Fri, 25 Aug 2023 00:52:52 -0700
From: Vikram Garhwal <vikram.garhwal@amd.com>
To: Julien Grall <julien@xen.org>
Cc: xen-devel@lists.xenproject.org, michal.orzel@amd.com,
	sstabellini@kernel.org, jbeulich@suse.com
Subject: Re: [XEN][PATCH v9 14/19] common/device_tree: Add rwlock for dt_host
Message-ID: <ZOhd1HwM4km0_MfG@amd.com>
References: <20230819002850.32349-1-vikram.garhwal@amd.com>
 <20230819002850.32349-15-vikram.garhwal@amd.com>
 <d5e658e4-e30e-4783-8fcc-0bd93126abf3@xen.org>
 <ZOhIiLg0thx3Q2N_@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ZOhIiLg0thx3Q2N_@amd.com>
X-ClientProxiedBy: BY5PR04CA0019.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::29) To MW3PR12MB4409.namprd12.prod.outlook.com
 (2603:10b6:303:2d::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW3PR12MB4409:EE_|BN9PR12MB5244:EE_
X-MS-Office365-Filtering-Correlation-Id: d0795e46-1b3b-4fbf-4a1d-08dba5404e13
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	y473WPTVATi71MabwGwpHzW4ntss2wlYoDl1hG4T1gKZRKEooi6C3MyljNcQymjKs6sWQ8uv5fopT7tt2uR0BaxQx9cA2UEONC1H4Hmciq+t0R6klye5T5jUM2PKe8YQkRVR4Gu42dTQyn/JtkOuouKfz/i3hbl7BDlOz6g9Yyq51q2nlca+9NiNHn/Yu6eyRr1VQzSLfj8k+5eG6dKNYhFLyp4MU3uuhF4HAf9gzLAPhjT29XXy0J+tI0XHtn/I8A5Rp5vR6aAAQ/5EuezsG16OlFpsg0s7NBprZeV4coxqXEyDz3552IgmGIhyagEua+Au5RVp90fLZqv3dzdgtukaWVhuclMlIviBIA16LeAgyvI6uxbrAZucDk55lMGM/rJQGFC4oHGYUpZMUD2OPW2KXFbbBLQzWBCT+lLgVwDnuZ+YtUAkngdxjVwyrsxjrExImJjM0SfRyFjROaa24RLXCLR9ANT5g5G3zofBrcIwQss+RQyO+COnP5/YvGqquxb74Zp0eCRNzgmPzm9YaLrOYwkrJwS17QxlgpY8us1LeRLo5x9vp6XK1QHq5UbB
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW3PR12MB4409.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(346002)(39860400002)(366004)(376002)(136003)(1800799009)(451199024)(186009)(44832011)(83380400001)(6512007)(26005)(478600001)(2616005)(5660300002)(2906002)(8936002)(4326008)(8676002)(38100700002)(66476007)(66556008)(66946007)(6916009)(86362001)(41300700001)(6506007)(53546011)(6486002)(36756003)(6666004)(316002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VUhMbHczbHJYQzUrYmhnQ2YxNzRybEJacjRDWXh2RFJDM1o4TTJ6UjM3aDVu?=
 =?utf-8?B?MklOMjE4bVE4enNtek10bG5YM3V3cUFnSFJlSFBKRWM0YUtiNkdySnRPaUxW?=
 =?utf-8?B?aWdhcDQ5Wmc3NjFia0JWMHZhdDB3NEpFZ1NQWWJjaURmZENLM3Y3QjJRWENZ?=
 =?utf-8?B?SGpnaHA3QVUrMzRBOEJ3Q3h3SkFKaWZCSENCZTFZWmxJa1p5OTF0aXFFWm1o?=
 =?utf-8?B?cHczWkliMVRpdit4KzdCVzFpeVNlZFA2bm50M29PaDJrOEZ6c1hMbTRmNlJo?=
 =?utf-8?B?L3J1ZDkzbEpCQWE2bmh2V2prV0FQVXA2WmcrQTE5L3ZDTW50U1l5VkZjcUZq?=
 =?utf-8?B?L0ZNSWs4QVZqaUNUV3puVE02aVk4aUU2QVVkZXJ3YnFHQ0djeWxmYnU1Q09q?=
 =?utf-8?B?V3F4dVArNm51cCtYWlRKNHhRSEQ3SlNEVnJDUXMvV0QyQ1BRbk1vSEkvcTYy?=
 =?utf-8?B?ZmsvM21pN2gxK0ttNk5hMmNOWFBHeTdUdXA3cDF1UlZFZHFZVlh4OTg5TVRz?=
 =?utf-8?B?Y2lHZDRPNE1CR2RaY2o1Yis0ekpzeHRVbXlTSjZ1VS8vUkI1Rm5Da3pmQnpK?=
 =?utf-8?B?bTMzQUVVVHMyZzlsS0Q5Z20zSWx6SEYzYkkrS3dmSXNZbXZLYlJYdDFSUm1N?=
 =?utf-8?B?dnNDMUd3M3B1cDBVSSsrSkx4Nkc2ZjlBV2hlQUhPMG1CM05KQXlqaXllMUZ0?=
 =?utf-8?B?Sjc5ejRRejF1amV0MGRsWUJpUkI4L01jcGFIQVlWLzlEUDJiQ3pNeHZsN2NQ?=
 =?utf-8?B?em82WURucDhnZC9aTVVTUU1rTGQ4VXlWVmR4OU1heWQzWTFBaWNTTDk2cE5w?=
 =?utf-8?B?NUhwVndOTjF4OUtzcUczcGtGc09FdG56dnRudUNMRDM0cVdjR3hlbWFGdFNl?=
 =?utf-8?B?Und1dHpaUlM4eUUzRkM2ZmdqWTJnZVpRZURrMC9DLzZGWlFyVlJubXVCWkRp?=
 =?utf-8?B?SFBvUW5JejhVYi8vQ0dCQzBXbjIzcHB4UzJZdGtDbnAyb1RqV2RBSmR0RnBw?=
 =?utf-8?B?cjIwZEtVVGhWY0hndXgwcURnWkVETjNQWDhEa0J2Z3ZxaTdtU1hXVGgxemwy?=
 =?utf-8?B?cjhOSDJCYk0rNzZOYmw0VlBhUGwvVHNYeDRqTnl3c1BnYTlBMjdka3ZtS0t1?=
 =?utf-8?B?VlFaMG1xT1Y1ZTZFUFN5elNrak9Ud3dSZHdyOEloNkl1dFIveGk4Z1d3YnNz?=
 =?utf-8?B?dkt5U2Y3dTdQdVB5V0xtaWwvRDkvZ1lYMzQ3SVFTTkRsT3h0NFgyeHdmdEZa?=
 =?utf-8?B?ajVmN0czdFNnOWFZNEpxZGlSTnRJQklEWnd6MDVKTlV1MlZDd3A1MjJWL05V?=
 =?utf-8?B?em1FSDZNN2RrNkZNVHErZy9PZjhyYXREY3RGNzBRMUVJQkswRTZwMnhKQTQ5?=
 =?utf-8?B?NjRJdlliaEtqeDRvMzdUaGhZL09pbThHN0FaR1h0bmJ6Vk00d0xER0tWU1Y4?=
 =?utf-8?B?MUowZDhLTjRyQmUvUFpCZ3BKOFJMZExDYk5nM2JjMXVSbjBVWC9udVpCdlF2?=
 =?utf-8?B?UkM1VDVsNm9FakhncUtPRHlQVnA1enY4TXBSU1BjbU9acVYzK290ekMrOE9o?=
 =?utf-8?B?R0lzVmZCQmc5dStjUFFDM1VwZkNKNjJ5U09DZnNRSDdTdXphUjIwQXBZdXJN?=
 =?utf-8?B?SXRTd3dzWUtLbEF4bG80TnRFL0k4Q1NZYUhsOUpwekt1bmsrL0FKNG9mai9j?=
 =?utf-8?B?MDR6N0d2U1VKY0VxK1VhdlUySC91dElGeU83WklxTFQvR29kQ0FuM2E4VCt5?=
 =?utf-8?B?Ty9nU2pQcVVBN1VYeGJTZFl5cm1MWmNCSG1XUzNFQnUyL00wRjQ0bFFEZ3Mz?=
 =?utf-8?B?dnlSYTdRMlRHbEdsdkEwb2VEZ3pmb2VqQzBDNFF0OUZ4T2YrWTl0UGROdENJ?=
 =?utf-8?B?QmZCeE5KNkN6aGxHQll4OEc2Q0licDBhUkQ0R29LdGpGUDByVXlQNFVFZWQr?=
 =?utf-8?B?eFBNNEF3QmZBMXUxNkh2YW5rcXkwT0dsaUpEOFQ1S3lTK1RFTys0Tmh5WEtQ?=
 =?utf-8?B?VVB2U3QxR3dXOEFMaGhhOFNZRTB3bFZiZzArZnpac2RpaENJZFV1MFNORFZy?=
 =?utf-8?B?bTNvRDBuNzRNejhtc2oyZ00xVjY5LzQvamdJQmFxZWFQOS9iNWVBeGY2dGF4?=
 =?utf-8?Q?TWI1+Or8iQLERJcPjrcU/twn+?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d0795e46-1b3b-4fbf-4a1d-08dba5404e13
X-MS-Exchange-CrossTenant-AuthSource: MW3PR12MB4409.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2023 07:53:01.1538
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9isRP3RtUQ3PwzaYaapGqH/ZkdZt1jrUQ9KyprIcwi4LKh7WU9CqYGhvduLh0iogFQbTbD7LBX/POVkjojYLLw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5244

Hi,
On Thu, Aug 24, 2023 at 11:22:00PM -0700, Vikram Garhwal wrote:
> Hi Julien,
> On Wed, Aug 23, 2023 at 11:06:59PM +0100, Julien Grall wrote:
> > Hi Vikram,
> > 
> > On 19/08/2023 01:28, Vikram Garhwal wrote:
> > >   Dynamic programming ops will modify the dt_host and there might be other
> > >   function which are browsing the dt_host at the same time. To avoid the race
> > 
> > Typo: I think you want to write 'functions'
> > 
> > >   conditions, adding rwlock for browsing the dt_host during runtime. dt_host
> > >   writer will be added in the follow-up patch titled "xen/arm: Implement device
> > >   tree node addition functionalities."
> > 
> > I would prefer if we avoid mention the name of the follow-up commit. This
> > will reduce the risk that the name of the commit is incorrect if we decide
> > to commit this patch before the rest of the series is ready.
> > 
> > Also, the commit message seems to be indented. Was it intended?
> > 
> > > 
> > >   Reason behind adding rwlock instead of spinlock:
> > >      For now, dynamic programming is the sole modifier of dt_host in Xen during
> > >          run time. All other access functions like iommu_release_dt_device() are
> > >          just reading the dt_host during run-time. So, there is a need to protect
> > >          others from browsing the dt_host while dynamic programming is modifying
> > >          it. rwlock is better suitable for this task as spinlock won't be able to
> > >          differentiate between read and write access.
> > 
> > The indentation looks odd here as well.
> > 
> Changed above comments in v10.
> > > 
> > > Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
> > > 
> > > ---
> > > Changes from v7:
> > >      Keep one lock for dt_host instead of lock for each node under dt_host.
> > > ---
> > > ---
> > >   xen/common/device_tree.c              |  5 +++++
> > >   xen/drivers/passthrough/device_tree.c | 15 +++++++++++++++
> > >   xen/include/xen/device_tree.h         |  6 ++++++
> > >   3 files changed, 26 insertions(+)
> > 
> > I am not sue where to put the comment. I noticed that you didn't touch
> > iommu_remove_dt_device() and iommu_add_dt_device(). Does this mean the
> > caller is expected to held the lock? If so, then this should be documented
> > and an ASSERT() should be added.
> Added ASSERT in iommu_(add,remove,assign and deassign)_dt_device(),
iommu_add_ and iommu_assign_ are called at boot time. Also, only other callers
are handle_device via overlays and iommu_do_dt_domctl() which will hold the
dt_host_lock. Will look into it more but for now sending v10 with ASSER in these
two functions.
> > 
> > > 
> > > diff --git a/xen/common/device_tree.c b/xen/common/device_tree.c
> > > index 0f10037745..6b934fe036 100644
> > > --- a/xen/common/device_tree.c
> > > +++ b/xen/common/device_tree.c
> > > @@ -31,6 +31,7 @@ dt_irq_xlate_func dt_irq_xlate;
> > >   struct dt_device_node *dt_host;
> > >   /* Interrupt controller node*/
> > >   const struct dt_device_node *dt_interrupt_controller;
> > > +rwlock_t dt_host_lock;
> > >   /**
> > >    * struct dt_alias_prop - Alias property in 'aliases' node
> > > @@ -2137,7 +2138,11 @@ int unflatten_device_tree(const void *fdt, struct dt_device_node **mynodes)
> > >       dt_dprintk(" <- unflatten_device_tree()\n");
> > > +    /* Init r/w lock for host device tree. */
> > > +    rwlock_init(&dt_host_lock);
> > 
> > Calling rwlock_init() from unflattent_device_tree() seems to be incorrect as
> > it would lead to re-initialize the lock every time we are create a new DT
> > overlay.
> > 
> > Instead you want to replace the definition of dt_host_lock with:
> > 
> > DEFINE_RWLOCK(dt_host_lock)
> > 
> Changed this. DEFINE_RWLOCK is added to device-tree.c and this is removed.
> > > +
> > >       return 0;
> > > +
> > 
> > Spurious change?
> > 
> > >   }
> > >   static void dt_alias_add(struct dt_alias_prop *ap,
> > > diff --git a/xen/drivers/passthrough/device_tree.c b/xen/drivers/passthrough/device_tree.c
> > > index 4cb32dc0b3..31815d2b60 100644
> > > --- a/xen/drivers/passthrough/device_tree.c
> > > +++ b/xen/drivers/passthrough/device_tree.c
> > > @@ -114,6 +114,8 @@ int iommu_release_dt_devices(struct domain *d)
> > >       if ( !is_iommu_enabled(d) )
> > >           return 0;
> > > +    read_lock(&dt_host_lock);
> > > +
> > >       list_for_each_entry_safe(dev, _dev, &hd->dt_devices, domain_list)
> > >       {
> > >           rc = iommu_deassign_dt_device(d, dev);
> > 
> > So iommu_deassign_dt_device() is now called with the read lock. I am
> > assuming the intention is all the caller will need to fist held the lock. If
> > so, then I think this would require an ASSERT() in
> > iommu_deassign_dt_device() and a comment on top of the function because it
> > is exported.
> > 
> > I am guessing that iommu_assign_dt_device() is in the same situation.
> > 
> > 
> > > @@ -121,10 +123,14 @@ int iommu_release_dt_devices(struct domain *d)
> > >           {
> > >               dprintk(XENLOG_ERR, "Failed to deassign %s in domain %u\n",
> > >                       dt_node_full_name(dev), d->domain_id);
> > > +
> > > +            read_unlock(&dt_host_lock);
> > 
> > Coding style: Usually we add the newline before the return. So I would
> > switch around the two lines.
> > 
> > >               return rc;
> > >           }
> > >       }
> > > +    read_unlock(&dt_host_lock);
> > > +
> > >       return 0;
> > >   }
> > > @@ -251,6 +257,8 @@ int iommu_do_dt_domctl(struct xen_domctl *domctl, struct domain *d,
> > >       int ret;
> > >       struct dt_device_node *dev;
> > > +    read_lock(&dt_host_lock);
> > > +
> > >       switch ( domctl->cmd )
> > >       {
> > >       case XEN_DOMCTL_assign_device:
> > > @@ -304,7 +312,10 @@ int iommu_do_dt_domctl(struct xen_domctl *domctl, struct domain *d,
> > >           spin_unlock(&dtdevs_lock);
> > >           if ( d == dom_io )
> > > +        {
> > > +            read_unlock(&dt_host_lock);
> > >               return -EINVAL;
> > 
> > NIT: Rather than adding the unlock here, you could use:
> > 
> > rc = -EINVAL;
> > break;
> > 
> > > +        }
> > >           ret = iommu_add_dt_device(dev);
> > >           if ( ret < 0 )
> > > @@ -342,7 +353,10 @@ int iommu_do_dt_domctl(struct xen_domctl *domctl, struct domain *d,
> > >               break;
> > >           if ( d == dom_io )
> > > +        {
> > > +            read_unlock(&dt_host_lock);
> > >               return -EINVAL;
> > > +        }
> > 
> > NIT: Same here.
> > 
> > >           ret = iommu_deassign_dt_device(d, dev);
> > > @@ -357,5 +371,6 @@ int iommu_do_dt_domctl(struct xen_domctl *domctl, struct domain *d,
> > >           break;
> > >       }
> > > +    read_unlock(&dt_host_lock);
> > 
> > Coding style: Please add a newline.
> > 
> Changed all above coding styles.
> > >       return ret;
> > >   }
> > > diff --git a/xen/include/xen/device_tree.h b/xen/include/xen/device_tree.h
> > > index e507658b23..8191f30197 100644
> > > --- a/xen/include/xen/device_tree.h
> > > +++ b/xen/include/xen/device_tree.h
> > > @@ -18,6 +18,7 @@
> > >   #include <xen/string.h>
> > >   #include <xen/types.h>
> > >   #include <xen/list.h>
> > > +#include <xen/rwlock.h>
> > >   #define DEVICE_TREE_MAX_DEPTH 16
> > > @@ -216,6 +217,11 @@ extern struct dt_device_node *dt_host;
> > >    */
> > >   extern const struct dt_device_node *dt_interrupt_controller;
> > > +/*
> > > + * Lock that protects r/w updates to unflattened device tree i.e. dt_host.
> > > + */
> > 
> > The wording suggests that any update to any node would require to hold the
> > write lock. However.. it looks like you are only holding the read when
> > setting is_protected in the SMMU remove callback. Is this intended?
> > 
> > Or maybe you expect is_protected by to protected by dtdevs_lock? If so, then
> > I think it would be good to spell it out. Possibly on top of is_protected.
> > 
> Yes, dtdevs_lock will be held to avoid concurrent calls to SMMU remove.
> > Lastly, there are plenty of place in Xen where the lock is not taken. They
> > mostly seem to be at boot, so I would mention that for boot only code, then
> > lock may not be taken.
> Updated.
> > 
> > Lastly, this is a single line comment, so the coding style should be:
> > 
> > /* ... */
> > 
> > > +extern rwlock_t dt_host_lock;
> > > +
> > >   /**
> > >    * Find the interrupt controller
> > >    * For the moment we handle only one interrupt controller: the first
> > 
> > Cheers,
> > 
> > -- 
> > Julien Grall

