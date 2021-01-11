Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CA442F19A7
	for <lists+xen-devel@lfdr.de>; Mon, 11 Jan 2021 16:30:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.64977.114958 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kyz99-0005DM-Hx; Mon, 11 Jan 2021 15:30:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 64977.114958; Mon, 11 Jan 2021 15:30:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kyz99-0005Cx-DT; Mon, 11 Jan 2021 15:30:19 +0000
Received: by outflank-mailman (input) for mailman id 64977;
 Mon, 11 Jan 2021 15:30:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/ci+=GO=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1kyz98-0005Cs-Ja
 for xen-devel@lists.xenproject.org; Mon, 11 Jan 2021 15:30:18 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4b656d6c-178e-49cb-910b-9821ac510742;
 Mon, 11 Jan 2021 15:30:17 +0000 (UTC)
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
X-Inumbo-ID: 4b656d6c-178e-49cb-910b-9821ac510742
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1610379017;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=Rt2LzJOvPFMD+7Yw3EKRh4qiQ7pcKwrXD4R9KU3JgbE=;
  b=Oxmv36PjAQ61hV+lN8Z5wph3uTIkHcqXJAENbegqxHWQwuxB4/GYIjkI
   oqAbrn02dotoly2gNnBHTRtTq+lWQWaqqGCyEOva+JqD9tKJW85M2otPU
   j1Pm/wyzdwhR6lH3YITo1Ud9sdlY2q4YUW3FZBAkZ2uWFc2k5gj6XrFE2
   U=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: Qcsklfd+gK2LhOdJ7tNk0t/2RUZU1pXQLFnqI8I4SAH0sLlYFfdpmVVlNaYl9tA7FMcASKziun
 2A0BSB2McHmLbTiycnhr/IM1izb+B7fm/QP0I00z07CNKpkHElAvcxCi+UxRwQVo+N7kU2HUBl
 bwY+kneOGotFmUp5CErF0eEcxMjrGcDWiajsxdWRgm8Nc8wBvfQFDV3sh2iIRONNUMvXr0v8ht
 440B7SGC3zvRbEEQKl+y9jOBZHO8VTXLTgYiZH10QzwDgiweAyxCe3dSNmltGJjTUyY6vVHt4U
 ZDY=
X-SBRS: 5.2
X-MesageID: 34875826
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,338,1602561600"; 
   d="scan'208";a="34875826"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YB3gLsSWaFL8isb9tw97LvCzFfyhjP7eHUtj0+oG0XVYRdGe0eEYvqC9GO1/tkvTIT33+uHZsEurDwhD+Mf04/zaQwJWKciJNzbqdop+OdFf10hVX5Ni+AK6kRMsCLh2OzI5iJUVq6GJ9RjKCqIFjyY6wg/8+7jdvZ/kAb7zuTuhPXIoHL9Q0hd44C8y/WGARHWnn59ngFma5DJvVQzbUZvQV5uadwev4S5C5pRgPcmOlUjyWpLDQzmMCc3lQcTVcwcjqANff4BWd+J+TZQMZxEWw0bkMwH6stE7a+xtJLVZKVmLIROvMX23g9z4jjhtV5C+iVWPkds+TYgg7F60lA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GMv+D5XNXaUs7jlSi3vF8u/xKZa1WRXWQ+kXGL1O4rw=;
 b=W80ogAYczVifSzSXjz22UguUcPBd+30yBixwRuAzYrBnYm9wyIYH6/AtqDdVfKEejrvqzR0oFF70e55cGIMziX2Pb8krPPLwmDA/6dhojwDukn1MbEt2V1uY+VkAF2TM+HTb69tZM+2st+VOH9J5nUUJgt3bx/uQcLPsiAOWdOBdEQ5OEsRaJO7ZtsM4eeIbMajbTYRuNtex+4ewJ1POEjCqRUUDTNAPkwSMasPvYTxJABKcc7spWj/TbMxuk4gHIGeYDuTJlqcmaeh+GuWktK9I7xDuXWi4QVtsKH5vKwHKSsooSH4cwWh6rKQ9NAIesb2pNVbYhqNNKfTzhtuf/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GMv+D5XNXaUs7jlSi3vF8u/xKZa1WRXWQ+kXGL1O4rw=;
 b=jH65inIfaW+FPoj0ivQApSlApYp4n0i6ndH+qGKlJiNbAp/2nbZ0nlILd6mOkb15n5zB3SDtgk/nLHFRRb5aVAi1WsyG28962LAU/USfM/Lfe6b065ffomDT4ifBawr0pSfF83tsPv6B/UOezz9qdhceESfy9SEmUXeEQObR3mA=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <linux-kernel@vger.kernel.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Boris Ostrovsky
	<boris.ostrovsky@oracle.com>, Juergen Gross <jgross@suse.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Paul Durrant <paul.durrant@citrix.com>,
	<xen-devel@lists.xenproject.org>
Subject: [PATCH] xen/privcmd: allow fetching resource sizes
Date: Mon, 11 Jan 2021 16:29:58 +0100
Message-ID: <20210111152958.7166-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.29.2
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MR2P264CA0091.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:32::31) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 40583e6c-0543-4618-5abf-08d8b645ca88
X-MS-TrafficTypeDiagnostic: DS7PR03MB5445:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DS7PR03MB54454B6E3E387EA12173E5C48FAB0@DS7PR03MB5445.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DlqyfIfcs7wZnmdzi/K3eVPJCF88nTDxRSGGSxrdxyHrNSRiovh0ynIJAQkYenlAzd+Ctec3Vh5hpS9o//mVrsD04AWnG1q/vubzJiOQmU4pUAeApyUSR3A3WBxD81wwuNwaDzWSt276qgd86BXt2oq8OrKmDZ+BFiYjwCPKPA7h0K34vFFSaC0iOUv8H2LmiusIgO7o3XP9R0C6e1KED5O/NFfjLG86ZxWN+loXXPUz/bAw0iv1DJfLxruBbS4WyCKE9PYBDPgirCMkJ4Zy+vWDafi3XeFx7GAW1VPkapMQURlMRTsvZ/S45CaNvWbgs7XeWbXGxRJ8y+FnBTa7CvVoBeq0F36rdkkh8qrcObFXa9NzoIoCHloZ+032qbEE/P1oGovWVVq4eJjQB36S5g==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(376002)(136003)(366004)(39860400002)(396003)(6916009)(6496006)(956004)(4326008)(316002)(2616005)(66946007)(66476007)(26005)(6486002)(478600001)(1076003)(66556008)(83380400001)(86362001)(8936002)(2906002)(186003)(16526019)(36756003)(54906003)(6666004)(8676002)(5660300002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?RVY0TEsvcFVpSmlUSkYvTEpKS0lNSXdtbmxXV2FpUTlCN3lrOVlPY2YyTFRh?=
 =?utf-8?B?YVA2MWlzWTZ2MXdKckJOa2tRN25iN0tveTVaV2J6UDlXTW42Tks4TFNBd1lo?=
 =?utf-8?B?cWFjc3AxY3lUbExtZndpN21HbmxWeWwvaEFOL2lYUDRxaUJCN3JXcHExQ0Vz?=
 =?utf-8?B?RWxpOFhsbmExeGY3czFvazU3Mlg3MVNKZjFjRzRBcXB2cE01U29YNzZrcWtj?=
 =?utf-8?B?TmhKTkk4NTVNYzluaDVRZFNOL290Q0t0WjBpN0x2aTUwRE1XODBwc0c1WThW?=
 =?utf-8?B?bDh1cG9sTEJFTmxMc2g4ekN6dUJaOStFTElsSkY3ODdOODVTUzc3dnBTbHBP?=
 =?utf-8?B?KzBFeXZsM3JyckZlVmxMZjNMb2QxdDJMTGRLbnhuUS9USUc0QXFiUFhXRTVk?=
 =?utf-8?B?bHY3UDZRWG5UT2dRaU9UMlpRR1BPditOa1ZGcEFLWFFSeFFrb0h1NTdBbll3?=
 =?utf-8?B?ZDhWK3FPN0x0bEl2ZVhTTWdHbEZpZ2ZuRFdEaE9QY0RRdzMvYmQxRnZzanlB?=
 =?utf-8?B?Z3h1OUlsdG11Mmd1Z1VLY3FQS3JidUtGeDVEU1phZnBidnd4MmtJMkloMFlw?=
 =?utf-8?B?U3ZjU2ZLcFNpVEVZdm1rNEJoa1BncFBlbTJ0MCsreHRIQkpIMS9WdzRpR0Jy?=
 =?utf-8?B?UTlQZktKOXdtTFJ4TEpWSTQwUmpGbk1TREs5Y3VrTzR4Q1Zic1Y1U1hwM0lR?=
 =?utf-8?B?WW50L3ovRFBacC8zTTRHalF2akcwQW1RbXdGK1JNeElGN0cxUkRVUjJuczdq?=
 =?utf-8?B?L2tKUXBKMjd3c2YxOXgraU1TTE1wSGEyZW9LZ3EzRDFQbklCcmUwWWJ1c3RJ?=
 =?utf-8?B?NEpXR0UxY0NxcWhPeFk3RkJLUEF0OUt6bm85SnZXY0NLeEpJamJjMWQwTkdm?=
 =?utf-8?B?ZFR3M3h1UCt5Mmg4cTIzVTRpd1dMTzU2UmVVWjVmSFVqc0hSOENSVVJZYUoz?=
 =?utf-8?B?NGx3bUk1Q1dNNFZTVXovSVZ5eFpPTEtrdVh0Z3E3NUhveGhRcTg3ZUMyVHc2?=
 =?utf-8?B?elJ0ZUwzMERsWm5wK25EcXhiQWY1TThrQTZNRUZLV1B4YnM3SW4zc3krNkdy?=
 =?utf-8?B?bEwrWldnTUlkMWkyVExZTFJobU1jYmZ2ZzNOL0FDK2dOa2FRY1psMXJZOCtV?=
 =?utf-8?B?MXRsWlhocVRRa0hGUlk5czVFS3FENG4xZDhRZFQ3QXN6SUR1d29NY1FsRytT?=
 =?utf-8?B?MW40TU9lL3BVV3VvbGQ0bWNEZDJQbzdpQjBvRFplSUdPVjJPL2FPUkJ0SjdF?=
 =?utf-8?B?K05pSGdPMXVxRXR6OEw2alAvZEhXOUM5VkJIU3pVS1R3Qnh2a0l1NnZiaFFn?=
 =?utf-8?Q?nVny3zW267jKHqRxCef3XG6d0d205GkbYQ?=
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jan 2021 15:30:13.8861
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-Network-Message-Id: 40583e6c-0543-4618-5abf-08d8b645ca88
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xd0gq8wMWFODL27AZFjUwk949HEdj3zNezyti4ZTv/fIwCoLw5KcNZGSYeKGlcYGoJxhYsvcda9F2glL2jJ3zA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR03MB5445
X-OriginatorOrg: citrix.com

Allow issuing an IOCTL_PRIVCMD_MMAP_RESOURCE ioctl with num = 0 and
addr = 0 in order to fetch the size of a specific resource.

Add a shortcut to the default map resource path, since fetching the
size requires no address to be passed in, and thus no VMA to setup.

Fixes: 3ad0876554caf ('xen/privcmd: add IOCTL_PRIVCMD_MMAP_RESOURCE')
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
NB: fetching the size of a resource shouldn't trigger an hypercall
preemption, and hence I've dropped the preempt indications.
---
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: Juergen Gross <jgross@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>
Cc: Paul Durrant <paul.durrant@citrix.com>
Cc: xen-devel@lists.xenproject.org
---
 drivers/xen/privcmd.c | 21 +++++++++++++++------
 1 file changed, 15 insertions(+), 6 deletions(-)

diff --git a/drivers/xen/privcmd.c b/drivers/xen/privcmd.c
index b0c73c58f987..a6e7e6e4286f 100644
--- a/drivers/xen/privcmd.c
+++ b/drivers/xen/privcmd.c
@@ -717,14 +717,15 @@ static long privcmd_ioctl_restrict(struct file *file, void __user *udata)
 	return 0;
 }
 
-static long privcmd_ioctl_mmap_resource(struct file *file, void __user *udata)
+static long privcmd_ioctl_mmap_resource(struct file *file,
+				struct privcmd_mmap_resource __user *udata)
 {
 	struct privcmd_data *data = file->private_data;
 	struct mm_struct *mm = current->mm;
 	struct vm_area_struct *vma;
 	struct privcmd_mmap_resource kdata;
 	xen_pfn_t *pfns = NULL;
-	struct xen_mem_acquire_resource xdata;
+	struct xen_mem_acquire_resource xdata = { };
 	int rc;
 
 	if (copy_from_user(&kdata, udata, sizeof(kdata)))
@@ -734,6 +735,18 @@ static long privcmd_ioctl_mmap_resource(struct file *file, void __user *udata)
 	if (data->domid != DOMID_INVALID && data->domid != kdata.dom)
 		return -EPERM;
 
+	xdata.domid = kdata.dom;
+	xdata.type = kdata.type;
+	xdata.id = kdata.id;
+
+	if (!kdata.addr && !kdata.num) {
+		/* Query the size of the resource. */
+		rc = HYPERVISOR_memory_op(XENMEM_acquire_resource, &xdata);
+		if (rc)
+			return rc;
+		return __put_user(xdata.nr_frames, &udata->num);
+	}
+
 	mmap_write_lock(mm);
 
 	vma = find_vma(mm, kdata.addr);
@@ -768,10 +781,6 @@ static long privcmd_ioctl_mmap_resource(struct file *file, void __user *udata)
 	} else
 		vma->vm_private_data = PRIV_VMA_LOCKED;
 
-	memset(&xdata, 0, sizeof(xdata));
-	xdata.domid = kdata.dom;
-	xdata.type = kdata.type;
-	xdata.id = kdata.id;
 	xdata.frame = kdata.idx;
 	xdata.nr_frames = kdata.num;
 	set_xen_guest_handle(xdata.frame_list, pfns);
-- 
2.29.2


