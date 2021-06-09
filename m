Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 44A853A0FA3
	for <lists+xen-devel@lfdr.de>; Wed,  9 Jun 2021 11:27:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.139073.257266 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lquUe-0007vT-E2; Wed, 09 Jun 2021 09:27:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 139073.257266; Wed, 09 Jun 2021 09:27:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lquUe-0007tD-Az; Wed, 09 Jun 2021 09:27:24 +0000
Received: by outflank-mailman (input) for mailman id 139073;
 Wed, 09 Jun 2021 09:27:23 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jMcQ=LD=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lquUd-0007rs-Aa
 for xen-devel@lists.xenproject.org; Wed, 09 Jun 2021 09:27:23 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d697bdc6-6b13-4efb-973e-78bc85c94891;
 Wed, 09 Jun 2021 09:27:21 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2110.outbound.protection.outlook.com [104.47.18.110])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-14-XXIDG_zIMJC01qKnpRyo0g-1; Wed, 09 Jun 2021 11:27:19 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0401MB2335.eurprd04.prod.outlook.com (2603:10a6:800:2e::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.20; Wed, 9 Jun
 2021 09:27:17 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::f06c:6f5d:34d2:1c36]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::f06c:6f5d:34d2:1c36%5]) with mapi id 15.20.4219.022; Wed, 9 Jun 2021
 09:27:17 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM0PR02CA0022.eurprd02.prod.outlook.com (2603:10a6:208:3e::35) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4219.20 via Frontend Transport; Wed, 9 Jun 2021 09:27:17 +0000
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
X-Inumbo-ID: d697bdc6-6b13-4efb-973e-78bc85c94891
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1623230840;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=o6pDydvSJ6LSaglFSBHbIL7y0svRLi1hBmasidhS7XM=;
	b=M+JFO64yhJ0D+bVcduJ7M98WEJNOb/ylq3eO3dNz28QBskmIbGGjebmyxeV+Rm2AOvQ3p7
	ENDttg+sjfjjtMiqJcICHt8I8Fbo6cLyOhAzWmnzA3C4BPRKh3xLH87XeZ6MyODeWLH7Va
	AamtDELEXP5lcDr0mVt4cK8nD6Y8W2o=
X-MC-Unique: XXIDG_zIMJC01qKnpRyo0g-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SPECZzKS4qcd3PSSM/chLBQ+vZ1o77BTCUWbsgSSfjKHnHzEtYY9THlGIgapJS3EKardfMnvrAcPrYqS7QA+FMkzXQ0am+3pntvglxEP6uTZlsK5ND50CjIpX1Q8lJgyBZP1oFr0Ca2X3Tup3xZUJM3sBfi5RKPu5WaVhEu1PPCkLx+ddoUCkdndu5Po4TQyib5p/WEMnM5KF6Qj5DQeZ7lOjqASCAV8Ci1sklS31D2Z9Jse6NGl0jikwvaA51ZhSrXdHiy5h26Gjv9+RXJeg6iDgZaZgeTsB5Ddpnl0qWZiLQiG2yuesK6ap72MsomedFaKq5tdth5NOpSY3TZ0Kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o6pDydvSJ6LSaglFSBHbIL7y0svRLi1hBmasidhS7XM=;
 b=BK3e/YwlZQE79fZYdzImPZz7x+qkuSuyG5NxQrk0Wv6fHhQHzaK3Usl19NC3LY0QJN/R4ojoTnh0Cwx5PnPK299+0Ctp4muh6mir0s3eveS1gh2tnbs34VdCN8Tzc5CK0r26VdyUZY0H3Lve31EsqZZ9KmLUDepS1rFWrzG4Vp/m+FEApldEh48rD+Ic4Srar00/ZSk6e3kgjKGwddZpvGfGPtGoS5ATB/Hi48+Hkl4gpl7tgL8f8hqF2hQpdLR+4O3oZiyYRk+gqAChjjilPT4LODkFrfE030UYF+EDhKpdQ378s0WfwKICcjtjTVCgAzGwlutHdSyKEKE6lMkTLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=suse.com;
Subject: [PATCH 2/9] AMD/IOMMU: re-work locking around sending of commands
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Paul Durrant <paul@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>
References: <03285055-47ff-ab10-ae76-0553f28f136d@suse.com>
Message-ID: <da2e161f-5d5e-c4bb-bce4-7b86e9418a1e@suse.com>
Date: Wed, 9 Jun 2021 11:27:15 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <03285055-47ff-ab10-ae76-0553f28f136d@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.24.206.209]
X-ClientProxiedBy: AM0PR02CA0022.eurprd02.prod.outlook.com
 (2603:10a6:208:3e::35) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b77f4cbb-8fd4-4305-ae89-08d92b28c663
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2335:
X-Microsoft-Antispam-PRVS:
	<VI1PR0401MB2335C46B9DAC0395624B59FDB3369@VI1PR0401MB2335.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1107;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	0IBo7jrnbd81dzQnjdXfkNReslH/WbRxQYurUFEbtPhwThbl4hWT+fePnzGrYUZdk7Iry2nXgVBFbDlGlEIzRZyIy/Ezovy5t0wgiFijOnttWC+7EPTd3sJrbFDUHzsWtRoxgQJwKzVaBChSg0S9pESvryl/vptXaJKsBQlUzrWSmF+ipSuB1y/YwTtQvA/jt/OzOX++fO1PV9mAjdrO7qMccRDBx9iqCoBsgMs2WhzjnIWWd31oyUfRMnWYHPQI4t+AZ5x5Gu/aORHmXL65qdH9OgvFHtCBFa3OZxeD5BskcP1CtYNVyNJ4lqVjo47TCKnuhgLZRztLFUIjdFS+x3LMrvhfVuKptQ0GbHp5WcKefAH7Tvde0OZHqZXRCvnZ1gBNLla/FAvjC3mOd2MaRfnHXN7rw2lQn+mge4inUYTEkDsOsB1ZFFFvXCl13xYoiIeJVajrPJlsZjiYYa4X6WpfRGUxM/Etnst04iAA1VNp556/4ijQkjFjU3TpodSQl+o6iIyJXLGLqkDQYjUb1DpEk/7W81xOFAzT45ugVxC5y1vhqxtj1Il/TqcSrzGIuBXV0JaDkgyr0/BG6feCrk2vmLSk8ZdEbKNAmDSwuk6UvuUwq8y+RdsjBdgLozDTDLwIwftkkHPMB20IUKY/1pAMiHiZSb++laWp1tTbvNJXiUfNT1K6dneNShKtJ9Cw
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(396003)(376002)(346002)(136003)(39860400002)(6486002)(6916009)(83380400001)(31686004)(478600001)(956004)(2616005)(36756003)(2906002)(8676002)(4326008)(66946007)(8936002)(66476007)(5660300002)(38100700002)(66556008)(86362001)(16576012)(26005)(316002)(16526019)(31696002)(30864003)(186003)(54906003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData:
	=?utf-8?B?a0RNZ3NaL0gvWkhZUndBUEVqWXBkR2p0ZHRLcFYwMHAweTZDTGE3VzZLNk9I?=
 =?utf-8?B?VDZ3ZVZmRDhYSnlITU9LTHcxUm85UDhaRDV0cFl2dkcxY0djVzB3M3VaeWw4?=
 =?utf-8?B?bzBnQVVtSHVISmJlb3lwMDgzeWc1WGFVa09nNE85U3BrMi8zOFVjTWZFb2RE?=
 =?utf-8?B?R1JTWE1wdWRJL2ZVYlorRENlNFpyV3c5V3ZkNXNjakJqQXkwY2Nvdlk1WkdE?=
 =?utf-8?B?ajRuWEZkUWFsMzU2R3VyblZQNDc0VVFpMFpudEVEQ0dMVXB2RlBaMGRqNWVT?=
 =?utf-8?B?bmJ4Q0hNNVRHcW9WeGJDbTB2aVAxcWk0TE5PdHVNdHN1c2dodFpOVHZZYUpn?=
 =?utf-8?B?akdkUHZuQmJ1VTIySG81d0RKamVVT095ZDN3dEFDYUEwVmVCTWwrckt5a0dU?=
 =?utf-8?B?dGZJM2tEdnREeUhKMFh2d21qNEZWZktiMkk0c3pmTy9iTzJYbW5qSUFHZlhj?=
 =?utf-8?B?Y3RKcG1FemVpTXE2cXBiMW9HN3ZvKytOdGNEZGM1QzZjN0hVRzA4ZGVobFBu?=
 =?utf-8?B?UytSY2Q3aEtaMkNXNWk4OVcwSWwweVdkV1hvRHBGaHE4UmVXTFBLYU1qODBh?=
 =?utf-8?B?Sjg2SldkODdZSzBNTTlsL3JJQmhCRnpIZVNVaE5RQW0xdjVSZTFSVHFuMHlN?=
 =?utf-8?B?bXJmZU1pMEd6RjBiNGxHdk9HT3hZWWhZeVB0M1BwS3BEMVdrNW01SnBoTEpE?=
 =?utf-8?B?Z2FNQmZWczRRVk80OFRLdzF1dlZtbDlHY1Z0c2R1c1lsM2d3NnI5bHM3eU52?=
 =?utf-8?B?UTBFSnVWbTRNNzVqUlJpZVFlTkxWSnZvSW1idkx0NWM3bVRuMFBjaTlGNksw?=
 =?utf-8?B?ck5zcDFudzlZZ2gzMWkzclduVmRTRFFHa3NUSEo0TkJRYUlmeUpUcnVET2lv?=
 =?utf-8?B?b3ZHc2NXM0w2S1FYN2lSNGR6bmpmTkp4UHRHcXp0bTFZcUFMTldaSXJCVWNV?=
 =?utf-8?B?ZWxnZ1JRK2kyQXdwdFZLb2EwU0Jtem1idUdTZlBOSUx4TWVCdGV5ZlZEWkUv?=
 =?utf-8?B?V05oZWw5RUFFS2E4alR4MjBwdWZ5c3lRQjFxQTZ5ZFNUZXlLR0NRMlZWekgv?=
 =?utf-8?B?WE92YkZ6WE9DT1hZS0Z1RGJYL3MzdS9odnRHRlZvMkNlMFAyeVYwWVF0bTE2?=
 =?utf-8?B?d09GdUlZaEZRRHpSbDBjRkkvYVUyNGNUQWpTVTZ0YzRkVGNiT01USFhaRXdv?=
 =?utf-8?B?VE1oank5WHNFR3N3SWZIR1pLQU5mOXpGUlNxTVdTcDc1RlFJOEZWTEQrOGxZ?=
 =?utf-8?B?WWVwSGFMNnAwZTBLNDFFaEJieGJpS0pJa1NxaHg0ZDFOMCtWU3pQUUZTTFRK?=
 =?utf-8?B?VDVZbGNxU1pmN0dKSS9sRU9KSDZIUldNVklMaGJNaEtUSi9zQjRyOFB5YmdH?=
 =?utf-8?B?QkJDZXFYVFFIWWFFOEVnMFVSMGVvUGYreGd1d05xMWtlU3phU2VaQ21ESW9M?=
 =?utf-8?B?TTBWc2hqNEJkVUM1Z0xvLzg5L092L3l4ei8vRWtGSFlQcDMzMTdST3hRMmtH?=
 =?utf-8?B?VUVQOWNVMG8vRVVTQ2Q5TkF6c0JEcmpjTUV2SW40NXBhY0IyQlAxbTA5OVZL?=
 =?utf-8?B?eTRXcUV6RjRsSE5GYjNzUmJwZjhDb1MyeFZuN0VmQy92cUVOeHBnVVR3ckVz?=
 =?utf-8?B?cU9uV2Vpb0syWGtVM1JTY2pGK0xlZU5Layt1ZVp0SjhwVkFIMFdXbUd5RG9E?=
 =?utf-8?B?Qk1JSzVhSWRHOG9Va2t5VXNzRW8xUVZNcVFaNjYyeGVJVWFLR0F2aHhWQm5C?=
 =?utf-8?Q?aI5peF6ooaxaoxzsXL/HCC7ueX0GXN/FyWbLJzj?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b77f4cbb-8fd4-4305-ae89-08d92b28c663
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2021 09:27:17.8102
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JA4g1n48cS983orGvAmE29zq2qWCHEawC52CNVMMcBmWDnpPVWofGn88Fwgk0YYeCipnRgH+0jC9Hxh9F+5Cog==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2335

It appears unhelpful to me for flush_command_buffer() to block all
progress elsewhere for the given IOMMU by holding its lock while
waiting for command completion. Unless the lock is already held,
acquire it in send_iommu_command(). Release it in all cases in
flush_command_buffer(), before actually starting the wait loop.

Some of the involved functions did/do get called with the lock already
held: For amd_iommu_flush_intremap() we can simply move the locking
inside. For amd_iommu_flush_device() and amd_iommu_flush_all_caches()
the lock now gets dropped in the course of the function's operation.

Where touching function headers anyway, also adjust types used to be
better in line with our coding style and, where applicable, the
functions' callers.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
Reviewed-by: Paul Durrant <paul@xen.org>
---
v2: Add comments. Adjust parameter types when function headers get
    touched anyway.

--- a/xen/drivers/passthrough/amd/iommu.h
+++ b/xen/drivers/passthrough/amd/iommu.h
@@ -253,9 +253,10 @@ void amd_iommu_flush_pages(struct domain
                            unsigned int order);
 void amd_iommu_flush_iotlb(u8 devfn, const struct pci_dev *pdev,
                            uint64_t gaddr, unsigned int order);
-void amd_iommu_flush_device(struct amd_iommu *iommu, uint16_t bdf);
+void amd_iommu_flush_device(struct amd_iommu *iommu, uint16_t bdf,
+                            unsigned long flags);
 void amd_iommu_flush_intremap(struct amd_iommu *iommu, uint16_t bdf);
-void amd_iommu_flush_all_caches(struct amd_iommu *iommu);
+void amd_iommu_flush_all_caches(struct amd_iommu *iommu, unsigned long flags);
 
 /* find iommu for bdf */
 struct amd_iommu *find_iommu_for_device(int seg, int bdf);
--- a/xen/drivers/passthrough/amd/iommu_cmd.c
+++ b/xen/drivers/passthrough/amd/iommu_cmd.c
@@ -23,11 +23,20 @@
 #define CMD_COMPLETION_INIT 0
 #define CMD_COMPLETION_DONE 1
 
+/*
+ * When @flags is non-NULL, the function will acquire the IOMMU lock,
+ * transferring lock ownership to the caller.  When @flags is NULL,
+ * the lock is assumed to be already held.
+ */
 static void send_iommu_command(struct amd_iommu *iommu,
-                               const uint32_t cmd[4])
+                               const uint32_t cmd[4],
+                               unsigned long *flags)
 {
     uint32_t tail;
 
+    if ( flags )
+        spin_lock_irqsave(&iommu->lock, *flags);
+
     tail = iommu->cmd_buffer.tail + sizeof(cmd_entry_t);
     if ( tail == iommu->cmd_buffer.size )
         tail = 0;
@@ -49,8 +58,13 @@ static void send_iommu_command(struct am
     writel(tail, iommu->mmio_base + IOMMU_CMD_BUFFER_TAIL_OFFSET);
 }
 
+/*
+ * Callers need to hold the IOMMU lock, which will be released here before
+ * entering the loop to await command completion.
+ */
 static void flush_command_buffer(struct amd_iommu *iommu,
-                                 unsigned int timeout_base)
+                                 unsigned int timeout_base,
+                                 unsigned long flags)
 {
     static DEFINE_PER_CPU(uint64_t, poll_slot);
     uint64_t *this_poll_slot = &this_cpu(poll_slot);
@@ -72,7 +86,9 @@ static void flush_command_buffer(struct
                          IOMMU_CMD_OPCODE_SHIFT, &cmd[1]);
     cmd[2] = CMD_COMPLETION_DONE;
     cmd[3] = 0;
-    send_iommu_command(iommu, cmd);
+    send_iommu_command(iommu, cmd, NULL);
+
+    spin_unlock_irqrestore(&iommu->lock, flags);
 
     start = NOW();
     timeout = start + (timeout_base ?: 100) * MILLISECS(threshold);
@@ -99,12 +115,19 @@ static void flush_command_buffer(struct
 }
 
 /* Build low level iommu command messages */
-static void invalidate_iommu_pages(struct amd_iommu *iommu,
-                                   u64 io_addr, u16 domain_id, u16 order)
+
+/*
+ * The function will acquire the IOMMU lock, via its call to
+ * send_iommu_command(), and then transfer lock ownership to the caller.
+ */
+static unsigned long invalidate_iommu_pages(struct amd_iommu *iommu,
+                                            daddr_t io_addr, domid_t domain_id,
+                                            unsigned int order)
 {
     u64 addr_lo, addr_hi;
     u32 cmd[4], entry;
     int sflag = 0, pde = 0;
+    unsigned long flags;
 
     ASSERT ( order == 0 || order == 9 || order == 18 );
 
@@ -152,16 +175,27 @@ static void invalidate_iommu_pages(struc
     cmd[3] = entry;
 
     cmd[0] = 0;
-    send_iommu_command(iommu, cmd);
+    send_iommu_command(iommu, cmd, &flags);
+
+    return flags;
 }
 
-static void invalidate_iotlb_pages(struct amd_iommu *iommu,
-                                   u16 maxpend, u32 pasid, u16 queueid,
-                                   u64 io_addr, u16 dev_id, u16 order)
+/*
+ * The function will acquire the IOMMU lock, via its call to
+ * send_iommu_command(), and then transfer lock ownership to the caller.
+ */
+static unsigned long invalidate_iotlb_pages(struct amd_iommu *iommu,
+                                            unsigned int maxpend,
+                                            unsigned int pasid,
+                                            unsigned int queueid,
+                                            daddr_t io_addr,
+                                            unsigned int dev_id,
+                                            unsigned int order)
 {
     u64 addr_lo, addr_hi;
     u32 cmd[4], entry;
     int sflag = 0;
+    unsigned long flags;
 
     ASSERT ( order == 0 || order == 9 || order == 18 );
 
@@ -222,9 +256,12 @@ static void invalidate_iotlb_pages(struc
                          IOMMU_INV_IOTLB_PAGES_ADDR_HIGH_SHIFT, &entry);
     cmd[3] = entry;
 
-    send_iommu_command(iommu, cmd);
+    send_iommu_command(iommu, cmd, &flags);
+
+    return flags;
 }
 
+/* Callers need to hold the IOMMU lock. */
 static void invalidate_dev_table_entry(struct amd_iommu *iommu,
                                        u16 device_id)
 {
@@ -241,12 +278,18 @@ static void invalidate_dev_table_entry(s
                          &entry);
     cmd[1] = entry;
 
-    send_iommu_command(iommu, cmd);
+    send_iommu_command(iommu, cmd, NULL);
 }
 
-static void invalidate_interrupt_table(struct amd_iommu *iommu, u16 device_id)
+/*
+ * The function will acquire the IOMMU lock, via its call to
+ * send_iommu_command(), and then transfer lock ownership to the caller.
+ */
+static unsigned long invalidate_interrupt_table(struct amd_iommu *iommu,
+                                                uint16_t device_id)
 {
     u32 cmd[4], entry;
+    unsigned long flags;
 
     cmd[3] = cmd[2] = 0;
     set_field_in_reg_u32(device_id, 0,
@@ -257,9 +300,12 @@ static void invalidate_interrupt_table(s
                          IOMMU_CMD_OPCODE_MASK, IOMMU_CMD_OPCODE_SHIFT,
                          &entry);
     cmd[1] = entry;
-    send_iommu_command(iommu, cmd);
+    send_iommu_command(iommu, cmd, &flags);
+
+    return flags;
 }
 
+/* Callers need to hold the IOMMU lock. */
 static void invalidate_iommu_all(struct amd_iommu *iommu)
 {
     u32 cmd[4], entry;
@@ -271,7 +317,7 @@ static void invalidate_iommu_all(struct
                          &entry);
     cmd[1] = entry;
 
-    send_iommu_command(iommu, cmd);
+    send_iommu_command(iommu, cmd, NULL);
 }
 
 void amd_iommu_flush_iotlb(u8 devfn, const struct pci_dev *pdev,
@@ -304,10 +350,9 @@ void amd_iommu_flush_iotlb(u8 devfn, con
     maxpend = pdev->ats.queue_depth & 0xff;
 
     /* send INVALIDATE_IOTLB_PAGES command */
-    spin_lock_irqsave(&iommu->lock, flags);
-    invalidate_iotlb_pages(iommu, maxpend, 0, queueid, daddr, req_id, order);
-    flush_command_buffer(iommu, iommu_dev_iotlb_timeout);
-    spin_unlock_irqrestore(&iommu->lock, flags);
+    flags = invalidate_iotlb_pages(iommu, maxpend, 0, queueid, daddr,
+                                   req_id, order);
+    flush_command_buffer(iommu, iommu_dev_iotlb_timeout, flags);
 }
 
 static void amd_iommu_flush_all_iotlbs(struct domain *d, daddr_t daddr,
@@ -336,15 +381,12 @@ static void _amd_iommu_flush_pages(struc
 {
     unsigned long flags;
     struct amd_iommu *iommu;
-    unsigned int dom_id = d->domain_id;
 
     /* send INVALIDATE_IOMMU_PAGES command */
     for_each_amd_iommu ( iommu )
     {
-        spin_lock_irqsave(&iommu->lock, flags);
-        invalidate_iommu_pages(iommu, daddr, dom_id, order);
-        flush_command_buffer(iommu, 0);
-        spin_unlock_irqrestore(&iommu->lock, flags);
+        flags = invalidate_iommu_pages(iommu, daddr, d->domain_id, order);
+        flush_command_buffer(iommu, 0, flags);
     }
 
     if ( ats_enabled )
@@ -362,39 +404,44 @@ void amd_iommu_flush_pages(struct domain
     _amd_iommu_flush_pages(d, __dfn_to_daddr(dfn), order);
 }
 
-void amd_iommu_flush_device(struct amd_iommu *iommu, uint16_t bdf)
+/*
+ * Callers need to hold the IOMMU lock, which will be released here by
+ * calling flush_command_buffer().
+ */
+void amd_iommu_flush_device(struct amd_iommu *iommu, uint16_t bdf,
+                            unsigned long flags)
 {
     ASSERT( spin_is_locked(&iommu->lock) );
 
     invalidate_dev_table_entry(iommu, bdf);
-    flush_command_buffer(iommu, 0);
+    flush_command_buffer(iommu, 0, flags);
 }
 
 void amd_iommu_flush_intremap(struct amd_iommu *iommu, uint16_t bdf)
 {
-    ASSERT( spin_is_locked(&iommu->lock) );
+    unsigned long flags;
 
-    invalidate_interrupt_table(iommu, bdf);
-    flush_command_buffer(iommu, 0);
+    flags = invalidate_interrupt_table(iommu, bdf);
+    flush_command_buffer(iommu, 0, flags);
 }
 
-void amd_iommu_flush_all_caches(struct amd_iommu *iommu)
+/*
+ * Callers need to hold the IOMMU lock, which will be released here by
+ * calling flush_command_buffer().
+ */
+void amd_iommu_flush_all_caches(struct amd_iommu *iommu, unsigned long flags)
 {
     ASSERT( spin_is_locked(&iommu->lock) );
 
     invalidate_iommu_all(iommu);
-    flush_command_buffer(iommu, 0);
+    flush_command_buffer(iommu, 0, flags);
 }
 
 void amd_iommu_send_guest_cmd(struct amd_iommu *iommu, u32 cmd[])
 {
     unsigned long flags;
 
-    spin_lock_irqsave(&iommu->lock, flags);
-
-    send_iommu_command(iommu, cmd);
+    send_iommu_command(iommu, cmd, &flags);
     /* TBD: Timeout selection may require peeking into cmd[]. */
-    flush_command_buffer(iommu, 0);
-
-    spin_unlock_irqrestore(&iommu->lock, flags);
+    flush_command_buffer(iommu, 0, flags);
 }
--- a/xen/drivers/passthrough/amd/iommu_guest.c
+++ b/xen/drivers/passthrough/amd/iommu_guest.c
@@ -449,8 +449,7 @@ static int do_invalidate_dte(struct doma
     spin_lock_irqsave(&iommu->lock, flags);
     dte_set_gcr3_table(mdte, hdom_id, gcr3_mfn << PAGE_SHIFT, gv, glx);
 
-    amd_iommu_flush_device(iommu, req_id);
-    spin_unlock_irqrestore(&iommu->lock, flags);
+    amd_iommu_flush_device(iommu, req_id, flags);
 
     return 0;
 }
--- a/xen/drivers/passthrough/amd/iommu_init.c
+++ b/xen/drivers/passthrough/amd/iommu_init.c
@@ -921,13 +921,13 @@ static void enable_iommu(struct amd_iomm
 
     set_iommu_translation_control(iommu, IOMMU_CONTROL_ENABLED);
 
-    if ( iommu->features.flds.ia_sup )
-        amd_iommu_flush_all_caches(iommu);
-
     iommu->enabled = 1;
 
+    if ( iommu->features.flds.ia_sup )
+        amd_iommu_flush_all_caches(iommu, flags);
+    else
  out:
-    spin_unlock_irqrestore(&iommu->lock, flags);
+        spin_unlock_irqrestore(&iommu->lock, flags);
 }
 
 static void disable_iommu(struct amd_iommu *iommu)
@@ -1554,9 +1554,8 @@ static int _invalidate_all_devices(
         if ( iommu )
         {
             spin_lock_irqsave(&iommu->lock, flags);
-            amd_iommu_flush_device(iommu, req_id);
+            amd_iommu_flush_device(iommu, req_id, flags);
             amd_iommu_flush_intremap(iommu, req_id);
-            spin_unlock_irqrestore(&iommu->lock, flags);
         }
     }
 
--- a/xen/drivers/passthrough/amd/iommu_intr.c
+++ b/xen/drivers/passthrough/amd/iommu_intr.c
@@ -310,9 +310,7 @@ static int update_intremap_entry_from_io
         entry.ptr32->flds.remap_en = false;
         spin_unlock(lock);
 
-        spin_lock(&iommu->lock);
         amd_iommu_flush_intremap(iommu, req_id);
-        spin_unlock(&iommu->lock);
 
         spin_lock(lock);
     }
@@ -527,11 +525,9 @@ static int update_intremap_entry_from_ms
 
         if ( iommu->enabled )
         {
-            spin_lock_irqsave(&iommu->lock, flags);
             amd_iommu_flush_intremap(iommu, req_id);
             if ( alias_id != req_id )
                 amd_iommu_flush_intremap(iommu, alias_id);
-            spin_unlock_irqrestore(&iommu->lock, flags);
         }
 
         return 0;
@@ -567,11 +563,9 @@ static int update_intremap_entry_from_ms
         entry.ptr32->flds.remap_en = false;
         spin_unlock(lock);
 
-        spin_lock(&iommu->lock);
         amd_iommu_flush_intremap(iommu, req_id);
         if ( alias_id != req_id )
             amd_iommu_flush_intremap(iommu, alias_id);
-        spin_unlock(&iommu->lock);
 
         spin_lock(lock);
     }
--- a/xen/drivers/passthrough/amd/pci_amd_iommu.c
+++ b/xen/drivers/passthrough/amd/pci_amd_iommu.c
@@ -129,7 +129,7 @@ static void amd_iommu_setup_domain_devic
              iommu_has_cap(iommu, PCI_CAP_IOTLB_SHIFT) )
             dte->i = ats_enabled;
 
-        amd_iommu_flush_device(iommu, req_id);
+        amd_iommu_flush_device(iommu, req_id, flags);
 
         AMD_IOMMU_DEBUG("Setup I/O page table: device id = %#x, type = %#x, "
                         "root table = %#"PRIx64", "
@@ -138,8 +138,8 @@ static void amd_iommu_setup_domain_devic
                         page_to_maddr(hd->arch.amd.root_table),
                         domain->domain_id, hd->arch.amd.paging_mode);
     }
-
-    spin_unlock_irqrestore(&iommu->lock, flags);
+    else
+        spin_unlock_irqrestore(&iommu->lock, flags);
 
     ASSERT(pcidevs_locked());
 
@@ -307,14 +307,15 @@ static void amd_iommu_disable_domain_dev
         smp_wmb();
         dte->v = true;
 
-        amd_iommu_flush_device(iommu, req_id);
+        amd_iommu_flush_device(iommu, req_id, flags);
 
         AMD_IOMMU_DEBUG("Disable: device id = %#x, "
                         "domain = %d, paging mode = %d\n",
                         req_id,  domain->domain_id,
                         dom_iommu(domain)->arch.amd.paging_mode);
     }
-    spin_unlock_irqrestore(&iommu->lock, flags);
+    else
+        spin_unlock_irqrestore(&iommu->lock, flags);
 
     ASSERT(pcidevs_locked());
 
@@ -455,9 +456,7 @@ static int amd_iommu_add_device(u8 devfn
             iommu->dev_table.buffer + (bdf * IOMMU_DEV_TABLE_ENTRY_SIZE),
             ivrs_mappings[bdf].intremap_table, iommu, iommu_intremap);
 
-        amd_iommu_flush_device(iommu, bdf);
-
-        spin_unlock_irqrestore(&iommu->lock, flags);
+        amd_iommu_flush_device(iommu, bdf, flags);
     }
 
     amd_iommu_setup_domain_device(pdev->domain, iommu, devfn, pdev);


