Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C0B8AACF5B
	for <lists+xen-devel@lfdr.de>; Tue,  6 May 2025 23:09:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.978043.1364917 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uCPXj-0003ZT-Py; Tue, 06 May 2025 21:09:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 978043.1364917; Tue, 06 May 2025 21:09:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uCPXj-0003WL-Mj; Tue, 06 May 2025 21:09:35 +0000
Received: by outflank-mailman (input) for mailman id 978043;
 Tue, 06 May 2025 21:09:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LATA=XW=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1uCPXi-0003WF-Fq
 for xen-devel@lists.xenproject.org; Tue, 06 May 2025 21:09:34 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2061e.outbound.protection.outlook.com
 [2a01:111:f403:2412::61e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 669ede2d-2abe-11f0-9eb4-5ba50f476ded;
 Tue, 06 May 2025 23:09:32 +0200 (CEST)
Received: from MW4PR04CA0355.namprd04.prod.outlook.com (2603:10b6:303:8a::30)
 by SA1PR12MB8945.namprd12.prod.outlook.com (2603:10b6:806:375::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.26; Tue, 6 May
 2025 21:09:25 +0000
Received: from SJ1PEPF00002321.namprd03.prod.outlook.com
 (2603:10b6:303:8a:cafe::ca) by MW4PR04CA0355.outlook.office365.com
 (2603:10b6:303:8a::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8699.26 via Frontend Transport; Tue,
 6 May 2025 21:09:25 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF00002321.mail.protection.outlook.com (10.167.242.91) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8722.18 via Frontend Transport; Tue, 6 May 2025 21:09:24 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 6 May
 2025 16:09:23 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 6 May
 2025 16:09:23 -0500
Received: from amd-BIRMANPLUS.mshome.net (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39
 via Frontend Transport; Tue, 6 May 2025 16:09:22 -0500
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
X-Inumbo-ID: 669ede2d-2abe-11f0-9eb4-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JkM98pa5bLac5LeVj+T/abpH51hVU/ad1FMWkzbjhZatvdh2FQ9v7ksZEgSssViDnBuapZkp8Zbx7iT+ANSfS+hRNsZgz30bnOhuPeX4tl0FvRK6JR3rrtLwbFmgRixPV3oVV5lcWAbQ732tbnnpZS5ZDAo1kHyByFkuTqWt/VUhFO5JLdnSLfjJDaNXbBecHvFUad4cVaQK++ORHrulMmFZ03EQo/SUpT/M2e8eiGec6iG9MgpKvxMYzvwJ+nNhvPXdSskkeIuoZI5t1ZPXsQrZXLgP1CMMPWmmosL8UbvNIRXHWCLLaYTrX4kEqY/7bs2QGCAJ5FjmcbMoq8qVTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LexVX8ApKvljcmQ19kTQlqapvR2rrjJA4xi625UdRDk=;
 b=Mt5kc/zo726CZLgjjKAyhgX+FjX+f1Qlo2xAaIiRj/CTnwFO8BK8QITULfNI3Ei4eOBCUsjnSQ6c3SL68HNBsO0/khay1CNk3z9W4RogJ4dXlmXpDQ81nzmsZCjAtvaB2OdVacDBxXHi7Ovxl8Z2bsBD1n4JWkIQAohXNjA1jM88cYRVqt98QSCqakM21RIBTu99T/L7kw5+j2If4vaCdjlEKW7uSc//hTNxVEgSvtoCTXOJtWIeGOzQqKuqBDwqHV+KCNfAvpMuovae7sYJZjn9RVuWRlM0k5S8u6zqY8G7UpEMd5h0A+5MJmhN7z/uYKBLW9/ftIWcqJ3KdRQ1xQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LexVX8ApKvljcmQ19kTQlqapvR2rrjJA4xi625UdRDk=;
 b=VuHQH+aTQNiDh1JEIWS1hKYNrsguHV82/Jbrp9GvzIgfhLAsRSxgjZ9qJ2fA5JmGoyekF6YjC9AxwPQaA+YykvxnMc8DwQ7QsAV/Fl9Asfw58l6vb/zfW2bzd+Srv5GNQrw50bfsHQfNe+1YB7i2aVj5xlV7oavZTRmVkwwBDac=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Jason Andryuk <jason.andryuk@amd.com>
To: Juergen Gross <jgross@suse.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Oleksandr Tyshchenko
	<oleksandr_tyshchenko@epam.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>
CC: Jason Andryuk <jason.andryuk@amd.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?=
	<marmarek@invisiblethingslab.com>, <stable@vger.kernel.org>,
	<xen-devel@lists.xenproject.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH] xenbus: Use kref to track req lifetime
Date: Tue, 6 May 2025 17:09:33 -0400
Message-ID: <20250506210935.5607-1-jason.andryuk@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB05.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002321:EE_|SA1PR12MB8945:EE_
X-MS-Office365-Filtering-Correlation-Id: 1a3ed70f-39bd-49f0-e110-08dd8ce247af
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?eXZQNGtuRnM1bnppMDJ1ZU40SGh2M2ZsNDU5VEVpczQ2eisyNHIwdVVSL1ZY?=
 =?utf-8?B?Y0dOQVZTQUlrU2FaY21GQmg1RXJCb3ZpMExHb0VxbENzMk53RGZHQzNqSnha?=
 =?utf-8?B?N3Z2elVEZCtCOHlrR0lQZXYzb1JjQkFZQnZSdjhwQ1FxTGhEYStMRjhMMjB4?=
 =?utf-8?B?K1dac3cwMld0TWNkOWtrU1FYT1dQUm5RMVlTcmphcG4rQ0h0YjdpZy9Tek1E?=
 =?utf-8?B?dlBVdU1PUTV5aVU3Q3U0eXpDWGd5L0FxU2xnTTQxMytNeHZna1pDNUFqV1E3?=
 =?utf-8?B?Z1hsNUxjb1FPenpSdkw4VllvNFJCLy82Nmk0U2ZtelhJbzFyWGVlVnkwSzFD?=
 =?utf-8?B?aVBpd0YySFVuOUM4U1Q3Ry9ZeTh5NkVwR09JclNUeitvT3dxRTM1cjQrdzh5?=
 =?utf-8?B?TjJSVDcycDlhTTNaNnl2NGdRRndrSW43bm15MVVnUTZuQ20xVFJyYkkwWXVw?=
 =?utf-8?B?ZzhqTTVKb3hrTlg3UHZEVk8wWVE0QWoyS0pqbkVvNnd6dzBGZSs5NjdEbzky?=
 =?utf-8?B?dG5yY0Qxa1JPdW9VSU5rQ1FnTDNTYUhHcW5VYU1GMkZreW92U1N0RGIxSWE2?=
 =?utf-8?B?dzdTYnhCR0lwOG8zSEowUnRoaU8xL2ZDMjRpbExHcHJpTDVBTGU2MmxWWnFH?=
 =?utf-8?B?ejRZS3VoR0Mvd2RPZUlVaEF3YktSKy8xM2R0ejVkYkRoNnFQbFZvQzdtVy9E?=
 =?utf-8?B?cTE0MXB4cW4xWGNEMU5rQ05qMUdmTXRzeEpqUmxnTFRMVVBBMlNHVWE5RlZS?=
 =?utf-8?B?ZGtlZzhvVndmL3IvbFQxV3ZvVmFsOUprRUxnSnE2RUtoWmFHOTZXcVVLR0Ns?=
 =?utf-8?B?ZjZIWTgvTURtREFjRHhJU0lBd1lDVStlaThHYW9xZzRHVVFQSUkweGVLSTNF?=
 =?utf-8?B?MW5YeDJGaWdxQ2JsMGNGK0Nla01UVEp0YjNtY0E2dDdBdFoxenRkUHdBSEdV?=
 =?utf-8?B?NGhDMHlJZDd0MkJrVW5pNHdSYnhQRkhOeSsvZHk5eU9HeThvblNUbGpqcnVK?=
 =?utf-8?B?S282dHZsNWdSRVhTODlHVXl5Qjh0SzJKdS9WYlZMNWYvL2pKd3EvZk8vSlNQ?=
 =?utf-8?B?amtjYmw3bmtjeEJGYkcveDFZNnZ2ZVpCdThCcjZ2T2lFNDFCcDBmT1RLMVFB?=
 =?utf-8?B?S1V4VEwyQW9JV2JoMC81Z1ovdkp3VWJBWVIzNmYzOG1mSkQ4L3JQMGNUQjl4?=
 =?utf-8?B?MUxPZjErUmc3WERHVnVJVGExekYzcmNsM1R4ckxUVldKQmxxcTl3SXRxVlhJ?=
 =?utf-8?B?aks5V0RsSkNVdFY1ZEtzUE5FOWZyODZxN0l4elZGTHF5WDd0TExiMnNkVEhr?=
 =?utf-8?B?Q0RTWG9wYndBelFRL1R3cmxFMVlyeHJTNkEvb2JwcjhYR01JTDNCS3RWVStP?=
 =?utf-8?B?VzlYNU4yTi9ydGxyTkRyMTZWZHdNTmI0dEZjVmlWcmpUUHJwN01PMmhLQmJC?=
 =?utf-8?B?MTRpWVpYYUdOdXFhS1BOVCtTc0xwM29BcjhJd3hNUXRObXYzRWdNcU95ZG5K?=
 =?utf-8?B?RGlPbWxhaGVJeGNXdGZOb2FWekxmdnBYbkY5WllIODFFWUJxa3dDb1B2cXFu?=
 =?utf-8?B?SUZUWGJhOEUwZ2hLcDlXQnpTRUVpdlJPb0pMQmlaY1k1bGc2QWcvTjgxYTZU?=
 =?utf-8?B?a3RHOUJwTUE3N3lVbjVlTDM0ZjNBS2ZqdGVOS09lbjZkUng5L3grV3JTQlRX?=
 =?utf-8?B?UDJlVTZUVmNQTFcxZTBMRGZNUzRhemZZSC9nZzREaUl5MTkzU0M1NWtFc3NW?=
 =?utf-8?B?b01jMnFtb1JrMldoeG02dVRwMHArcjVOZUlEenZrdTA5TW5lM2ZUTE9UTVhT?=
 =?utf-8?B?MThEUEg0VEFIOGhkcWpvUnkrRWFXWWVxdHl2dVhxbjJJNG03bS9aMmJCTkRi?=
 =?utf-8?B?eUlmR291SXV0STVFRlc3VmdEVGI1ZkhGSkFIQUlqT29FNFVqRnVwVHZhVEN5?=
 =?utf-8?B?VktTRnh2dTJmd3dNb1RYY0NGSllmemNFcHRBcjdJc0dQZHgrU1JrRWxnc04w?=
 =?utf-8?B?SFp0L2gyZnl4elZOa05pNjE4L3VJQy9ZWUhrbEU4eHBoTFJlUE53am1IR1Qy?=
 =?utf-8?B?MUtFMFVIN0JiVkNxZlk2SWt2ZEkrVkRHdXhkQT09?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2025 21:09:24.8239
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a3ed70f-39bd-49f0-e110-08dd8ce247af
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00002321.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8945

Marek reported seeing a NULL pointer fault in the xenbus_thread
callstack:
BUG: kernel NULL pointer dereference, address: 0000000000000000
RIP: e030:__wake_up_common+0x4c/0x180
Call Trace:
 <TASK>
 __wake_up_common_lock+0x82/0xd0
 process_msg+0x18e/0x2f0
 xenbus_thread+0x165/0x1c0

process_msg+0x18e is req->cb(req).  req->cb is set to xs_wake_up(), a
thin wrapper around wake_up(), or xenbus_dev_queue_reply().  It seems
like it was xs_wake_up() in this case.

It seems like req may have woken up the xs_wait_for_reply(), which
kfree()ed the req.  When xenbus_thread resumes, it faults on the zero-ed
data.

Linux Device Drivers 2nd edition states:
"Normally, a wake_up call can cause an immediate reschedule to happen,
meaning that other processes might run before wake_up returns."
... which would match the behaviour observed.

Change to keeping two krefs on each request.  One for the caller, and
one for xenbus_thread.  Each will kref_put() when finished, and the last
will free it.

This use of kref matches the description in
Documentation/core-api/kref.rst

Link: https://lore.kernel.org/xen-devel/ZO0WrR5J0xuwDIxW@mail-itl/
Reported-by: "Marek Marczykowski-Górecki" <marmarek@invisiblethingslab.com>
Fixes: fd8aa9095a95 ("xen: optimize xenbus driver for multiple concurrent xenstore accesses")
Cc: stable@vger.kernel.org
Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
---
Kinda RFC-ish as I don't know if it fixes Marek's issue.  This does seem
like the correct approach if we are seeing req free()ed out from under
xenbus_thread.

 drivers/xen/xenbus/xenbus.h              |  2 ++
 drivers/xen/xenbus/xenbus_comms.c        |  9 ++++-----
 drivers/xen/xenbus/xenbus_dev_frontend.c |  2 +-
 drivers/xen/xenbus/xenbus_xs.c           | 18 ++++++++++++++++--
 4 files changed, 23 insertions(+), 8 deletions(-)

diff --git a/drivers/xen/xenbus/xenbus.h b/drivers/xen/xenbus/xenbus.h
index 13821e7e825e..9ac0427724a3 100644
--- a/drivers/xen/xenbus/xenbus.h
+++ b/drivers/xen/xenbus/xenbus.h
@@ -77,6 +77,7 @@ enum xb_req_state {
 struct xb_req_data {
 	struct list_head list;
 	wait_queue_head_t wq;
+	struct kref kref;
 	struct xsd_sockmsg msg;
 	uint32_t caller_req_id;
 	enum xsd_sockmsg_type type;
@@ -103,6 +104,7 @@ int xb_init_comms(void);
 void xb_deinit_comms(void);
 int xs_watch_msg(struct xs_watch_event *event);
 void xs_request_exit(struct xb_req_data *req);
+void xs_free_req(struct kref *kref);
 
 int xenbus_match(struct device *_dev, const struct device_driver *_drv);
 int xenbus_dev_probe(struct device *_dev);
diff --git a/drivers/xen/xenbus/xenbus_comms.c b/drivers/xen/xenbus/xenbus_comms.c
index e5fda0256feb..82df2da1b880 100644
--- a/drivers/xen/xenbus/xenbus_comms.c
+++ b/drivers/xen/xenbus/xenbus_comms.c
@@ -309,8 +309,8 @@ static int process_msg(void)
 			virt_wmb();
 			req->state = xb_req_state_got_reply;
 			req->cb(req);
-		} else
-			kfree(req);
+		}
+		kref_put(&req->kref, xs_free_req);
 	}
 
 	mutex_unlock(&xs_response_mutex);
@@ -386,14 +386,13 @@ static int process_writes(void)
 	state.req->msg.type = XS_ERROR;
 	state.req->err = err;
 	list_del(&state.req->list);
-	if (state.req->state == xb_req_state_aborted)
-		kfree(state.req);
-	else {
+	if (state.req->state != xb_req_state_aborted) {
 		/* write err, then update state */
 		virt_wmb();
 		state.req->state = xb_req_state_got_reply;
 		wake_up(&state.req->wq);
 	}
+	kref_put(&state.req->kref, xs_free_req);
 
 	mutex_unlock(&xb_write_mutex);
 
diff --git a/drivers/xen/xenbus/xenbus_dev_frontend.c b/drivers/xen/xenbus/xenbus_dev_frontend.c
index 46f8916597e5..f5c21ba64df5 100644
--- a/drivers/xen/xenbus/xenbus_dev_frontend.c
+++ b/drivers/xen/xenbus/xenbus_dev_frontend.c
@@ -406,7 +406,7 @@ void xenbus_dev_queue_reply(struct xb_req_data *req)
 	mutex_unlock(&u->reply_mutex);
 
 	kfree(req->body);
-	kfree(req);
+	kref_put(&req->kref, xs_free_req);
 
 	kref_put(&u->kref, xenbus_file_free);
 
diff --git a/drivers/xen/xenbus/xenbus_xs.c b/drivers/xen/xenbus/xenbus_xs.c
index d32c726f7a12..dcf9182c8451 100644
--- a/drivers/xen/xenbus/xenbus_xs.c
+++ b/drivers/xen/xenbus/xenbus_xs.c
@@ -112,6 +112,12 @@ static void xs_suspend_exit(void)
 	wake_up_all(&xs_state_enter_wq);
 }
 
+void xs_free_req(struct kref *kref)
+{
+	struct xb_req_data *req = container_of(kref, struct xb_req_data, kref);
+	kfree(req);
+}
+
 static uint32_t xs_request_enter(struct xb_req_data *req)
 {
 	uint32_t rq_id;
@@ -237,6 +243,12 @@ static void xs_send(struct xb_req_data *req, struct xsd_sockmsg *msg)
 	req->caller_req_id = req->msg.req_id;
 	req->msg.req_id = xs_request_enter(req);
 
+	/*
+	 * Take 2nd ref.  One for this thread, and the second for the
+	 * xenbus_thread.
+	 */
+	kref_get(&req->kref);
+
 	mutex_lock(&xb_write_mutex);
 	list_add_tail(&req->list, &xb_write_list);
 	notify = list_is_singular(&xb_write_list);
@@ -261,8 +273,8 @@ static void *xs_wait_for_reply(struct xb_req_data *req, struct xsd_sockmsg *msg)
 	if (req->state == xb_req_state_queued ||
 	    req->state == xb_req_state_wait_reply)
 		req->state = xb_req_state_aborted;
-	else
-		kfree(req);
+
+	kref_put(&req->kref, xs_free_req);
 	mutex_unlock(&xb_write_mutex);
 
 	return ret;
@@ -291,6 +303,7 @@ int xenbus_dev_request_and_reply(struct xsd_sockmsg *msg, void *par)
 	req->cb = xenbus_dev_queue_reply;
 	req->par = par;
 	req->user_req = true;
+	kref_init(&req->kref);
 
 	xs_send(req, msg);
 
@@ -319,6 +332,7 @@ static void *xs_talkv(struct xenbus_transaction t,
 	req->num_vecs = num_vecs;
 	req->cb = xs_wake_up;
 	req->user_req = false;
+	kref_init(&req->kref);
 
 	msg.req_id = 0;
 	msg.tx_id = t.id;
-- 
2.34.1


