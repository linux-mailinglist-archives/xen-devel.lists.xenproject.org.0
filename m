Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EC797D7B86
	for <lists+xen-devel@lfdr.de>; Thu, 26 Oct 2023 06:36:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.623469.971323 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvs5q-0001n2-Dm; Thu, 26 Oct 2023 04:35:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 623469.971323; Thu, 26 Oct 2023 04:35:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvs5q-0001lD-B0; Thu, 26 Oct 2023 04:35:38 +0000
Received: by outflank-mailman (input) for mailman id 623469;
 Thu, 26 Oct 2023 04:35:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4jAM=GI=amd.com=vikram.garhwal@srs-se1.protection.inumbo.net>)
 id 1qvs5o-0001ko-IR
 for xen-devel@lists.xenproject.org; Thu, 26 Oct 2023 04:35:36 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2060a.outbound.protection.outlook.com
 [2a01:111:f400:7eaa::60a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 18bf0c5a-73b9-11ee-9b0e-b553b5be7939;
 Thu, 26 Oct 2023 06:35:33 +0200 (CEST)
Received: from MW3PR12MB4409.namprd12.prod.outlook.com (2603:10b6:303:2d::23)
 by BN9PR12MB5083.namprd12.prod.outlook.com (2603:10b6:408:134::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.31; Thu, 26 Oct
 2023 04:35:28 +0000
Received: from MW3PR12MB4409.namprd12.prod.outlook.com
 ([fe80::bc0e:2b8d:357c:675e]) by MW3PR12MB4409.namprd12.prod.outlook.com
 ([fe80::bc0e:2b8d:357c:675e%7]) with mapi id 15.20.6907.032; Thu, 26 Oct 2023
 04:35:28 +0000
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
X-Inumbo-ID: 18bf0c5a-73b9-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cTqWhinfgxuqt78KT3/xVLjGYHQ6O1YV8SkJbmbvY1A0O3u3CS0bgyDtfeWEEw+spMR+5AwbrstuY82dUDI0WfPsHYJzTEDsQ/eOgMACkd3lYCtzL4WsqO15Xk/OY3YwvWQrMao2ky1Yo6rFXagdW6MX01EMXecAKeZf+jWZgZIpxlOQd1jTP49ZtPQx/24uPUTiT64s7nv7I+RhAxtHkabMjwIL7dWyqC9LFopfrabz8ozWoAa28DSKHhF+afhfXfGTGrG8a9b3IL2d8kVvY9wDsAPiMBmxwos8Gs8ia766VDVb+0lmImw40efZGVava44ufACbJk4BDxK44DHVRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f5yU4fIZRKw4waQcnAvKo3auuurJRLbbSnIPTnZsiL8=;
 b=DXPpGunXp9RXtz/oy4RChtwVueSKIULlz5rAEeZoaKgQog5SrBs2dQy11X4n1e5/t+2Ag/9Y7dembCEMWe/upQR8CXqUBaWskP4OB5yYk58XnI2ghlu9S6HDYdpA+TS3on+5V+RxzbBK8EkeQs+LR+ItjZbuvy0BbtJqEzHECBEobQBSdcFmj/rUfDpi4FMwyX7AvZD3ev6aft+4Hc2n3mYq9EPXAMKmSjWk0Mo4whBTsNW/qx1iv3SAvtbR/U/0GMA3gFwVt/ZFiWnXMJmZwLORdOSlaujhXW2YzmLJjwTGR3I95xlwsixTHayfWOTVc7D9YM21UUEUu0KfN5Syzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f5yU4fIZRKw4waQcnAvKo3auuurJRLbbSnIPTnZsiL8=;
 b=iTl+wE1xdhQhliccpPRFRLvn7SbirHvo4VI31QDcTQvy+T0jkBbKeUk7A+3axqqN0XoWV2X5/BVrBNYWj63RnbO4ZJZ0HYfCOl+2Xne/hGCo+0IdC0Cw6tr6SNL9kMQfJosTA7TzkEbXL/qXRZ5WAOac4ZxuWdjL3fcz7At/RNo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Date: Wed, 25 Oct 2023 21:35:24 -0700
From: Vikram Garhwal <vikram.garhwal@amd.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: qemu-devel@nongnu.org, jgross@suse.com,
	Anthony Perard <anthony.perard@citrix.com>,
	Paul Durrant <paul@xen.org>, Paolo Bonzini <pbonzini@redhat.com>,
	Peter Xu <peterx@redhat.com>, David Hildenbrand <david@redhat.com>,
	Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	"open list:X86 Xen CPUs" <xen-devel@lists.xenproject.org>
Subject: Re: [QEMU][PATCHv2 7/8] xen: add map and unmap callbacks for grant
 region
Message-ID: <ZTnsjCo2kPyWk_ZT@amd.com>
References: <20231025212422.30371-1-vikram.garhwal@amd.com>
 <20231025212422.30371-8-vikram.garhwal@amd.com>
 <alpine.DEB.2.22.394.2310251832100.271731@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.22.394.2310251832100.271731@ubuntu-linux-20-04-desktop>
X-ClientProxiedBy: PH8PR22CA0001.namprd22.prod.outlook.com
 (2603:10b6:510:2d1::16) To MW3PR12MB4409.namprd12.prod.outlook.com
 (2603:10b6:303:2d::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW3PR12MB4409:EE_|BN9PR12MB5083:EE_
X-MS-Office365-Filtering-Correlation-Id: 37a5b730-dafe-47aa-ebdb-08dbd5dcfaff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	nE5hg/iNU1rfPxZJUni50q6ayGoOI8seEDf2uSJr+brCCp6GnHnQIU5gtVPURd2bb5lFGTAo5CKKNHQRaT8dvI66lnegeZCjT+Srvc0gB9XQp0lwP52CIa1GWDvd44u3m5gNlykGUqwoSZ6MEZaR8mMKn2dO4ImF935jikPCb/dg6idxo6I5dqvNixQqafxxcOfowAjB8NP70+2guI6/Kbk2DxCS6ttdY9H2kMUPm4jl1F9iJfL9wqC3f4c6pF7PqE52DpwitbNnO11O1aYMsWD7OZvgyGSRMo4lWKaMUpt1fXYR8Y5xt+cvYdUA2ZzXg5MW9PE+B/OXqGAooYRbggxGq40qwqRq7RX2cd3vkujJjxD0PM0QzmmaLPXnaikHB9OWBKxcC3kQ3plm+CfKfaBvYgxbl2YvEIpYwOugS4PEinwlRlk9zz9hLDOojlF3x0tYsv86G1/P+ea5r48ATcdmL4OsS2QuMA55KCR20WD++lI+iS5onqH4Vr/iDb0GMueZzOnmYrwfOerKVqPyM5Xn3MmuIA5/tHDK/Plv9yILw3Aaywi+kYCxA2djS7vV
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW3PR12MB4409.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(136003)(346002)(366004)(376002)(39860400002)(230922051799003)(1800799009)(64100799003)(186009)(451199024)(66946007)(2906002)(41300700001)(36756003)(38100700002)(6506007)(316002)(5660300002)(54906003)(66476007)(66556008)(478600001)(6666004)(6916009)(6512007)(6486002)(83380400001)(86362001)(44832011)(7416002)(4326008)(2616005)(8676002)(8936002)(26005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eUpUY2g0UHhlRGRFbUJJYzVIeElHSlBleVc2S29IcUw1UEZtMm8vem1lTHdi?=
 =?utf-8?B?MFpEZ3BLZlE2RVBTMHV3VkxwU3ZFQ3ZQTy9GU0hWOG0rNW45c2tObktBNXBu?=
 =?utf-8?B?M3hKV3Z6M3htWWlneXg1bVQ3eW05OFMxR1FEbXhnWEhyZkFtL0dXTmIxMUkv?=
 =?utf-8?B?N25LbHc4M1h1Qms0RG9XNWlkWWRJNGM1U3BLbDR5VXV2TXh0Q0xWcHErTFUz?=
 =?utf-8?B?VnJrMGtFUDM4YjJmcWtOSG1ZMUIzNjlTL0k0K2RwVG0zT2VDcVMrNWNKNDBB?=
 =?utf-8?B?ZEY0L0h4ZXArMEE2eUFGQmErUS93dkNYZFNoOGpSVVpzL0xPWEdwdEhORFE1?=
 =?utf-8?B?NVNQNnFmVk4yb2IrTjdFUExFZjdVdG5PejFnZUQ0OFBzb01DclBydGFNdFIv?=
 =?utf-8?B?SGxQekRESWFzRVZ3RVNMWVZ4bmRkOHY4VU4xMEpLSGYzdzErWGl1M08zUzhq?=
 =?utf-8?B?RC9sS1RGMTdua280T2JYdVJUckJUR0pCdGVDT3A2NEVUUG93NjR3Mm1vQ3pY?=
 =?utf-8?B?V2VEV2QrQlN0c3NxU1FNaHppMGdhZnRESFVkT3htYkhHWmZMZ01uMHhMZWpy?=
 =?utf-8?B?OS9mL3hJQ09kamRCWEpHalVMQ1FzVXUvR1pFTWxPcDNsdHpkUGNRcmZyWmh2?=
 =?utf-8?B?TWFCVVBuWnRKNTlPOGNsSmVOOEZ3S2JIVFAyUUFvOGpZZ1gzZTcrVUo4UUZM?=
 =?utf-8?B?VDQzRlAyN3pKbVJYcjdOcEMzditkZFFSYVV5cXA1Z1hoVjd4dGlaK1RMMjZu?=
 =?utf-8?B?TzB5b0dBUWhGL3lqUWRSaG9Fa28vVWc0dnErOTJpSlR5dCt2a0VKY1NER2RM?=
 =?utf-8?B?WXVQNy94L2NyeHpwVnBHb0VhWkk3eExtSjQrZUtEcEFQSndRVXdXOVdIcC9L?=
 =?utf-8?B?MGdXVlg0dENnclUweXJUWTBuWHF3VFpDT1pQNWxjQXNQMWgzZWRUMlUrbWlQ?=
 =?utf-8?B?NmpKUGdJcGJ3TStwdWp0Y1prTGhWQi80QXpTTHFYdnZiTzVEVEdXbW0rblor?=
 =?utf-8?B?WmVWeWF6bEVsMmpVdzlxMGozU2ZjbmJyV2srQk82SWJ1SWg0eVl0QzlpOXE3?=
 =?utf-8?B?blNZSWdxUWp4SjN6OXM1amtSa21pSG9JeE54SWRBdmhXZ2xsdFRaN3l2aDNW?=
 =?utf-8?B?TS9FZkVzQnErQ083cnYrSEFFUTNQUjhKQ2Y0VVkyYUpVUWQyUmF1QXAxajFu?=
 =?utf-8?B?S0swYXNFVXhxYlExb1J3N1VXT0lGZENXMU1yd3QyZVlHQklHWHNHbFdPR2Jw?=
 =?utf-8?B?WllJeGhFQnBsR0NJWFd4cjRNdXdaWWZCdVdZb0dXNFdGcG1FemVXaUtoSDdz?=
 =?utf-8?B?bUh1eklMVEZVRWFQR1VHRlAzSUdoSVVsMDVtem5vNGxONjNHRk5yVDQ5Tm1v?=
 =?utf-8?B?bS9PeVo1Si9mVzI1bzBQSVdaUXhLTHdLcXV5aElLUnBXZmQzRC9UTHc0QkVq?=
 =?utf-8?B?SHVDU1hIcHlYZ1BadkhzWXFPNkVFSTRSWExmMkQydVF1V0tkM2d3dFpYSUtz?=
 =?utf-8?B?TGxKMUExcE0zRXhBdEgwSmdpVmVWQUxSenJmU2lKYjBPRUdJUjNvbjc4eDEr?=
 =?utf-8?B?WUdzVGZReTQwbERQZ3REV29oaGFXcWlQKzRPcUVrbHRMRGtjT2pKSnV4UjdE?=
 =?utf-8?B?OW56clVvaGUvNFhnZ1pBMGZTZlpZUS85bEwyWi95a1BuTFhMQTZGcUhIZGUy?=
 =?utf-8?B?N3V5Y25mc1VQbnV3dmczcGoxM1pBQUxaSUZ1SnhlMjZXRnBGYmMwR2xMbnBR?=
 =?utf-8?B?c2M5eHRyZ0pNOEpmV2FHT1BGNnRZYUZoQ21tWG15dkx3KzI4WC8rdStqRU1X?=
 =?utf-8?B?VWVDVVZhMEdnZFZzc1lQT25XRzd6MWNBWTg4SGk0Y1BqeXQ3cVo0QzE5aEVT?=
 =?utf-8?B?WWYyR3I5cmZWdHNvKzFpeU9BenR4Mk90ZHBmMUNpSlYxR25xeWp6YjdvN0VI?=
 =?utf-8?B?MjN1eGN2UjNNb2pSOUNtNHVzYkYyTkNDSTFxSVZCakk5NXZ6aE5xdm9jTWlD?=
 =?utf-8?B?SEkxZUxibnAvdjczeCtrYXp0TzJ6eHZZcW0vem4zeWpKNjAzYWdteTIyZDF5?=
 =?utf-8?B?S0RRTmcxWmdXdmF5N3h0SXpOUDMwVGd2ZnRYdkZJMXpKdVRsZ3lZeWVwN1ly?=
 =?utf-8?Q?bHxY=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 37a5b730-dafe-47aa-ebdb-08dbd5dcfaff
X-MS-Exchange-CrossTenant-AuthSource: MW3PR12MB4409.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2023 04:35:28.5512
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NpKKiWm6q848VoSLNeL9driUl0KyCLMZFF7LtK8HK6HCE/eOOXCf8Plos3+SHhKOvO6AsfjNkMw5mJGwTgyonQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5083

On Wed, Oct 25, 2023 at 06:32:26PM -0700, Stefano Stabellini wrote:
> On Wed, 25 Oct 2023, Vikram Garhwal wrote:
> > From: Juergen Gross <jgross@suse.com>
> > 
> > Add the callbacks for mapping/unmapping guest memory via grants to the
> > special grant memory region.
> > 
> > Signed-off-by: Juergen Gross <jgross@suse.com>
> > Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
> > ---
> >  hw/xen/xen-mapcache.c | 175 +++++++++++++++++++++++++++++++++++++++++-
> >  system/physmem.c      |  11 ++-
> >  2 files changed, 181 insertions(+), 5 deletions(-)
> > 
> > diff --git a/hw/xen/xen-mapcache.c b/hw/xen/xen-mapcache.c
> > index 8a61c7dde6..feb4a3b886 100644
> > --- a/hw/xen/xen-mapcache.c
> > +++ b/hw/xen/xen-mapcache.c
> > @@ -9,6 +9,8 @@
> >   */
> >  
> >  #include "qemu/osdep.h"
> > +#include "qemu/queue.h"
> > +#include "qemu/thread.h"
> >  #include "qemu/units.h"
> >  #include "qemu/error-report.h"
> >  
> > @@ -23,6 +25,8 @@
> >  #include "sysemu/xen-mapcache.h"
> >  #include "trace.h"
> >  
> > +#include <xenevtchn.h>
> > +#include <xengnttab.h>
> >  
> >  //#define MAPCACHE_DEBUG
> >  
> > @@ -385,7 +389,7 @@ uint8_t *xen_map_cache(hwaddr phys_addr, hwaddr size,
> >      return p;
> >  }
> >  
> > -ram_addr_t xen_ram_addr_from_mapcache(void *ptr)
> > +static ram_addr_t xen_ram_addr_from_mapcache_try(void *ptr)
> >  {
> >      MapCacheEntry *entry = NULL;
> >      MapCacheRev *reventry;
> > @@ -594,10 +598,178 @@ uint8_t *xen_replace_cache_entry(hwaddr old_phys_addr,
> >      return p;
> >  }
> >  
> > +struct XENMappedGrantRegion {
> > +    void *addr;
> > +    unsigned int pages;
> > +    unsigned int refs;
> > +    unsigned int prot;
> > +    uint32_t idx;
> > +    QLIST_ENTRY(XENMappedGrantRegion) list;
> > +};
> > +
> > +static xengnttab_handle *xen_region_gnttabdev;
> > +static QLIST_HEAD(GrantRegionList, XENMappedGrantRegion) xen_grant_mappings =
> > +    QLIST_HEAD_INITIALIZER(xen_grant_mappings);
> > +static QemuMutex xen_map_mutex;
> > +
> > +static void *xen_map_grant_dyn(MemoryRegion **mr, hwaddr addr, hwaddr *plen,
> > +                               bool is_write, MemTxAttrs attrs)
> > +{
> > +    unsigned int page_off = addr & (XC_PAGE_SIZE - 1);
> > +    unsigned int i;
> > +    unsigned int total_grants = 0;
> > +    unsigned int nrefs = (page_off + *plen + XC_PAGE_SIZE - 1) >> XC_PAGE_SHIFT;
> > +    uint32_t ref = (addr - XEN_GRANT_ADDR_OFF) >> XC_PAGE_SHIFT;
> > +    uint32_t *refs = NULL;
> > +    unsigned int prot = PROT_READ;
> > +    struct XENMappedGrantRegion *mgr = NULL;
> > +
> > +    if (is_write) {
> > +        prot |= PROT_WRITE;
> > +    }
> > +
> > +    qemu_mutex_lock(&xen_map_mutex);
> > +
> > +    QLIST_FOREACH(mgr, &xen_grant_mappings, list) {
> > +        if (mgr->idx == ref &&
> > +            mgr->pages == nrefs &&
> > +            (mgr->prot & prot) == prot) {
> > +            break;
> > +        }
> > +
> > +        total_grants += mgr->pages;
> > +    }
> > +
> > +    if (!mgr) {
> > +        if (nrefs + total_grants >= XEN_MAX_VIRTIO_GRANTS) {
> > +            return NULL;
> 
> missing qemu_mutex_unlock
Oops, thanks for catching this! Will fix it in v3.
> 
> 
> > +        }
> > +
> > +        mgr = g_new(struct XENMappedGrantRegion, 1);
> > +
> > +        if (nrefs == 1) {
> > +            refs = &ref;
> > +        } else {
> > +            refs = g_new(uint32_t, nrefs);
> > +            for (i = 0; i < nrefs; i++) {
> > +                refs[i] = ref + i;
> > +            }
> > +        }
> > +        mgr->addr = xengnttab_map_domain_grant_refs(xen_region_gnttabdev, nrefs,
> > +                                                    xen_domid, refs, prot);
> > +        if (mgr->addr) {
> > +            mgr->pages = nrefs;
> > +            mgr->refs = 1;
> > +            mgr->prot = prot;
> > +            mgr->idx = ref;
> > +
> > +            QLIST_INSERT_HEAD(&xen_grant_mappings, mgr, list);
> > +        } else {
> > +            g_free(mgr);
> > +            mgr = NULL;
> > +        }
> > +    } else {
> > +        mgr->refs++;
> > +    }
> > +
> > +    qemu_mutex_unlock(&xen_map_mutex);
> > +
> > +    if (nrefs > 1) {
> > +        g_free(refs);
> > +    }
> > +
> > +    return mgr ? mgr->addr + page_off : NULL;
> > +}
> > +
> > +static void xen_unmap_grant_dyn(MemoryRegion *mr, void *buffer, ram_addr_t addr,
> > +                                hwaddr len, bool is_write, hwaddr access_len)
> > +{
> > +    unsigned int page_off = (unsigned long)buffer & (XC_PAGE_SIZE - 1);
> > +    unsigned int nrefs = (page_off + len + XC_PAGE_SIZE - 1) >> XC_PAGE_SHIFT;
> > +    unsigned int prot = PROT_READ;
> > +    struct XENMappedGrantRegion *mgr = NULL;
> > +
> > +    if (is_write) {
> > +        prot |= PROT_WRITE;
> > +    }
> > +
> > +    qemu_mutex_lock(&xen_map_mutex);
> > +
> > +    QLIST_FOREACH(mgr, &xen_grant_mappings, list) {
> > +        if (mgr->addr == buffer - page_off &&
> > +            mgr->pages == nrefs &&
> > +            (mgr->prot & prot) == prot) {
> > +            break;
> > +        }
> > +    }
> > +    if (mgr) {
> > +        mgr->refs--;
> > +        if (!mgr->refs) {
> > +            xengnttab_unmap(xen_region_gnttabdev, mgr->addr, nrefs);
> > +
> > +            QLIST_REMOVE(mgr, list);
> > +            g_free(mgr);
> > +        }
> > +    } else {
> > +        error_report("xen_unmap_grant_dyn() trying to unmap unknown buffer");
> > +    }
> > +
> > +    qemu_mutex_unlock(&xen_map_mutex);
> > +}
> > +
> > +static ram_addr_t xen_ram_addr_from_grant_cache(void *ptr)
> > +{
> > +    unsigned int page_off = (unsigned long)ptr & (XC_PAGE_SIZE - 1);
> > +    struct XENMappedGrantRegion *mgr = NULL;
> > +    ram_addr_t raddr = RAM_ADDR_INVALID;
> > +
> > +    qemu_mutex_lock(&xen_map_mutex);
> > +
> > +    QLIST_FOREACH(mgr, &xen_grant_mappings, list) {
> > +        if (mgr->addr == ptr - page_off) {
> > +            break;
> > +        }
> > +    }
> > +
> > +    if (mgr) {
> > +        raddr = (mgr->idx << XC_PAGE_SHIFT) + page_off + XEN_GRANT_ADDR_OFF;
> > +    }
> > +
> > +    qemu_mutex_unlock(&xen_map_mutex);
> > +
> > +    return raddr;
> > +}
> > +
> > +ram_addr_t xen_ram_addr_from_mapcache(void *ptr)
> > +{
> > +    ram_addr_t raddr;
> > +
> > +    raddr = xen_ram_addr_from_mapcache_try(ptr);
> > +    if (raddr == RAM_ADDR_INVALID) {
> > +        raddr = xen_ram_addr_from_grant_cache(ptr);
> > +    }
> > +
> > +    return raddr;
> > +}
> > +
> > +static const struct MemoryRegionOps xen_grant_mr_ops = {
> > +    .map = xen_map_grant_dyn,
> > +    .unmap = xen_unmap_grant_dyn,
> > +    .endianness = DEVICE_LITTLE_ENDIAN,
> > +};
> > +
> >  MemoryRegion *xen_init_grant_ram(void)
> >  {
> >      RAMBlock *block;
> >  
> > +    qemu_mutex_init(&xen_map_mutex);
> > +
> > +    xen_region_gnttabdev = xengnttab_open(NULL, 0);
> > +    if (xen_region_gnttabdev == NULL) {
> > +        fprintf(stderr, "can't open gnttab device\n");
> > +        return NULL;
> > +    }
> > +
> >      memory_region_init(&ram_grants, NULL, "xen.grants",
> >                         XEN_MAX_VIRTIO_GRANTS * XC_PAGE_SIZE);
> >      block = g_malloc0(sizeof(*block));
> > @@ -612,6 +784,7 @@ MemoryRegion *xen_init_grant_ram(void)
> >      ram_grants.ram_block = block;
> >      ram_grants.ram = true;
> >      ram_grants.terminates = true;
> > +    ram_grants.ops = &xen_grant_mr_ops;
> >      ram_block_add_list(block);
> >      memory_region_add_subregion(get_system_memory(), XEN_GRANT_ADDR_OFF,
> >                                  &ram_grants);
> > diff --git a/system/physmem.c b/system/physmem.c
> > index 5db1b32823..155a8c05fb 100644
> > --- a/system/physmem.c
> > +++ b/system/physmem.c
> > @@ -2233,13 +2233,16 @@ RAMBlock *qemu_ram_block_from_host(void *ptr, bool round_offset,
> >  
> >      if (xen_enabled()) {
> >          ram_addr_t ram_addr;
> > +
> >          RCU_READ_LOCK_GUARD();
> >          ram_addr = xen_ram_addr_from_mapcache(ptr);
> > -        block = qemu_get_ram_block(ram_addr);
> > -        if (block) {
> > -            *offset = ram_addr - block->offset;
> > +        if (ram_addr != RAM_ADDR_INVALID) {
> > +            block = qemu_get_ram_block(ram_addr);
> > +            if (block) {
> > +                *offset = ram_addr - block->offset;
> > +            }
> > +            return block;
> >          }
> > -        return block;
> >      }
> >  
> >      RCU_READ_LOCK_GUARD();
> > -- 
> > 2.17.1
> > 

