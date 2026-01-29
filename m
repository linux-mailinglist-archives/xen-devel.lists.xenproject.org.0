Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qDDfM5/ae2nNIwIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 29 Jan 2026 23:09:35 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F429B5305
	for <lists+xen-devel@lfdr.de>; Thu, 29 Jan 2026 23:09:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1217050.1526890 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vlaCc-0000mz-1X; Thu, 29 Jan 2026 22:09:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1217050.1526890; Thu, 29 Jan 2026 22:09:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vlaCb-0000kb-Ty; Thu, 29 Jan 2026 22:09:25 +0000
Received: by outflank-mailman (input) for mailman id 1217050;
 Thu, 29 Jan 2026 22:09:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dzzj=AC=amd.com=stefano.stabellini@srs-se1.protection.inumbo.net>)
 id 1vlaCa-0000SM-PU
 for xen-devel@lists.xenproject.org; Thu, 29 Jan 2026 22:09:24 +0000
Received: from SN4PR2101CU001.outbound.protection.outlook.com
 (mail-southcentralusazlp170120001.outbound.protection.outlook.com
 [2a01:111:f403:c10d::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 21b63017-fd5f-11f0-9ccf-f158ae23cfc8;
 Thu, 29 Jan 2026 23:09:08 +0100 (CET)
Received: from SJ0PR05CA0177.namprd05.prod.outlook.com (2603:10b6:a03:339::32)
 by SN7PR12MB8102.namprd12.prod.outlook.com (2603:10b6:806:359::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.7; Thu, 29 Jan
 2026 22:09:02 +0000
Received: from SJ5PEPF000001C9.namprd05.prod.outlook.com
 (2603:10b6:a03:339:cafe::d7) by SJ0PR05CA0177.outlook.office365.com
 (2603:10b6:a03:339::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.7 via Frontend Transport; Thu,
 29 Jan 2026 22:09:02 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 SJ5PEPF000001C9.mail.protection.outlook.com (10.167.242.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Thu, 29 Jan 2026 22:09:01 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 29 Jan
 2026 16:09:01 -0600
Received: from SATLEXMB03.amd.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Thu, 29 Jan 2026 16:09:00 -0600
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
X-Inumbo-ID: 21b63017-fd5f-11f0-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JBZUjU7NcQmdJuW9xjC8p2MAkJnO9OUbxArlNnOEO2/aOrnO0Au+rCwzLl42qiJiS6DcQvZOg02wqQ1oAeuPigtsNetI8VIyLxhOiigBqrIbo8TAmAukWzYzg/65qEP7UMKhxoURk65DJHrVpgvkBVU3zV5tgZh+sw/nvjehXcDIOD4gtVoPQqGdmF7SMVR5HJr6AbxhM3NVngKf0DYj2MHDtDq4FKNsqScPb7uSjEkRy76zJhhvK1feAGPJ5qUDJ7ZNXRjzmwak63bCTxLSQI5L6W+fFb2UPQvygZeTHD3XnBhTo5ldrF8botg9iEY5A3opWwiNVI3JtrLT1yXwcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gvd6fc7XOc0NaN65HjV2UWYq1G1YeJLe/XO2kD7iR+s=;
 b=WKV+tL8MbSV0KVMZqo2GrJGcC3ujSfqDb/nVismsOdbYTxCBdWa92SpB/jPJA62yy3bLko4abxqmqEnH997EdjpoxuQQOUQo0lPqE6fpLhju3Uvj24c3g9n08m0tY6e9/H+zlBNG2TpB5g8ZPOoQWg/wzYII7g9G0cT0KKsjEavGHTEGLfwr5VYd7SL0tM/8mlDQTCfRf+fwCIDPpYqp6Lr6GPcggTsEEMU6a0zshTTNmdSCPHk3NOrzUqSmlCbONn1jlLl8uG8S/kR5KbXJ4JoQ9Q/+mEHlnUNCESczWrcUQOJzo191ONOQOy/+zYT4IYsd+2MjIBo/w7Q8JbjLfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gvd6fc7XOc0NaN65HjV2UWYq1G1YeJLe/XO2kD7iR+s=;
 b=aHhV9XxHugevQJgch6vjzsNdA9y989QWROJs6fAbPS2HcnOr6zXe38FRxdqn7SxBtp04wM1bgh9E4CifnnYJb3398rWPkz+ziuJrhV4e+uAT1P1aMbsv/mp+1aCSoyWf5aOW2RqPVnwdTItGJzoioZiogVRwOlyH4N5le9YyzEc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
From: Stefano Stabellini <stefano.stabellini@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <grygorii_strashko@epam.com>, <anthony.perard@vates.tech>,
	<michal.orzel@amd.com>, <julien@xen.org>, <roger.pau@citrix.com>,
	<jason.andryuk@amd.com>, <victorm.lira@amd.com>, <andrew.cooper3@citrix.com>,
	<jbeulich@suse.com>, <sstabellini@kernel.org>, Stefano Stabellini
	<stefano.stabellini@amd.com>
Subject: [PATCH v8 1/2] xen/console: handle multiple domains using console_io hypercalls
Date: Thu, 29 Jan 2026 14:08:57 -0800
Message-ID: <20260129220858.2371938-1-stefano.stabellini@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <alpine.DEB.2.22.394.2601291404410.2238666@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2601291404410.2238666@ubuntu-linux-20-04-desktop>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001C9:EE_|SN7PR12MB8102:EE_
X-MS-Office365-Filtering-Correlation-Id: 632e1726-8f5c-45da-7a4c-08de5f83025d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?gQ6dffjK5xbhTSuOk3uKPvw61+SKt+GU2sf2L6+yDek/6+3NaS3LtwDEjbMK?=
 =?us-ascii?Q?ZuuLpWZzvvCwRv1uZqeHR0TpFmvhFO/ORxsIpXCx9HgbwkEdSuG4nuODViP5?=
 =?us-ascii?Q?pKMkfm9kb/UG+eD53xZ3ALLcR4wk4lqQQcaigSzZPt3nmbDZKCYPgc7HP0C3?=
 =?us-ascii?Q?ioD46ClZtfm0HUTokFobZpzOWXijgDsej/eQ4e+RqtaISoAbEh0Z/bTC+I1z?=
 =?us-ascii?Q?IZsBai81vPSbNYCBctTzN34y+dBrOkBqNmHP4+jnyYhBK4lMGPblqfrGIKTn?=
 =?us-ascii?Q?1HmgdFL3w/bk1vh1zl9rPtNZT2tCJYuVnRtYwyQMHqj9Hgu8CKb63CuSSI/t?=
 =?us-ascii?Q?80PmcOmu2vKDsB3VoZEPy7Ofxjk7POuv4KD4ICgf4kHec9x7qDBjKBjXQUdF?=
 =?us-ascii?Q?+Yxse6SPXyfWZd123purHtZhC3JrN9i6aiQW2iAyjK/3BwXTkze+yH6dmVXe?=
 =?us-ascii?Q?yDbGE4QJ9liSAyOvxNYqpFupYNQPC9e/f2ESxNOAxCbu9zej5K6McUXitkzg?=
 =?us-ascii?Q?w/Oq7qCMLm9n7M3rDiGeD+Ip7l2idr5qShyTfqfa8GN7HzrkDGagGE8mKYXa?=
 =?us-ascii?Q?m4zKvkhlmcYZ/S7bnABQi65z02LXxar07Yza5hY738/vwwJ5COt8xS6+1g6D?=
 =?us-ascii?Q?3/t1gSKCQImlihjxhB8veIGZw/P5RTfd2D3yt6vfNHdf3Nh2OVyCu3CJyJAq?=
 =?us-ascii?Q?cIwGSTUXMXpKUWLoLyJgABnebnjncr1bMJthnZAsXgPhvO9ocOFVDXUMsihu?=
 =?us-ascii?Q?/p6njYxbfy1FuMVMy91TzuSqjpPPUNwDb7klqUbDzauYaoXH9uFdbIjyxGdF?=
 =?us-ascii?Q?ICpoVXSAgRkGuJHPwz+3NLz/9wQ2UnIxvJ+6DHh4AzJsquxi5jkdD/eqgzPZ?=
 =?us-ascii?Q?thSEdDzBGYYW7NNEGH9VcadxNo8COzaQ8zGMD9TaJ6FMgU+eJiSJjU5jQGX5?=
 =?us-ascii?Q?FnZ69wxKnOPhac7SAUPxxSW1e7jrlw8GRtGGhZuUOw7C7V3HX3oscXUgaUrf?=
 =?us-ascii?Q?T+HDAZ+2jXBAQZsCGD6CvIYCl9J1asUmVkB1SiiwPj+kaZrdSzHQNIFTN1XJ?=
 =?us-ascii?Q?v93+oHrCyZTQj0ZmsDLHW+c0+HZ63fU5dutngRMTltGQ4FebNHhFfUmOjqcE?=
 =?us-ascii?Q?3GGjR0lEw2v0mMjEzoS8m48Vg9o11hK0+7WaKaZKl+POR0V7rt/uRT+2Uc33?=
 =?us-ascii?Q?qbOYn325bFPTVgmlghdzfsbAuKf1MM+ITVNlyoBhLUY6WRy1kTy4rMJa6bpQ?=
 =?us-ascii?Q?AbEg6bGJ9I7pcXVcP4vuKHHo+hqCB0zazeXPl1IG20QexdHgIdCGRfcrVQAe?=
 =?us-ascii?Q?+bSqfUgD4PzdVBKEBgmpZkFKPhmlTLsyqMk7fYUC5EOb6yZFJ2Vi5CSX3rmJ?=
 =?us-ascii?Q?kStCU56Al9lEQywKkWwjrzUjjjJ0d92wm2qwbm1qxORbR/fOYiWaAmYq6Bml?=
 =?us-ascii?Q?uadMiYIcPrfrvIRCuWXBnEoqDKAGHGrgZlAsgJnuWgkrKQHCpXDertJlqCIG?=
 =?us-ascii?Q?cW+hPOlyDibQKZn8qSeji4uUZhe1LOtdWPk24NewJiYdIE3vWimbQ7Vm6p48?=
 =?us-ascii?Q?tW298sD/B+7ijoVW9a4nKTiR7eNAfTjOQfJXnJ04GGHsfNxLwdpmJbSBSTbb?=
 =?us-ascii?Q?UqoqzibVFHnZElyqrYjsATJUYGPzo1oCg+b1EdmpGECf2P6QTEWTS7WANe71?=
 =?us-ascii?Q?V3gRhQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	eibUuI4xyHBdsXUxvgtHd9tUBaMn5NB2JuyKPAZH8Y2RWujDPFXTCf01XM1wtaWKuQPGURdLSGfsB09v4hn28tmevPNoM4WilR4uauZCrbxe0LUQVGkQHg9MMQ1dDEpJL52mJ+YwZU+33qRj7mpWNNZTbQVgeTdjCS1eEr0ueGWRQJOtHrb7aEzhbxXdGB9XP4bYaLU0pnucbk0udC92VjFPRmDYawOvv7+mzYtyKSfT259kRt3zzeIx0teWhIVepoD5lbZTA+ii/rrHzTSIsVqZeUb34veqj9QA+TDDxGAiJPbeySeWh4JPzjAvAbpPew6baG662g3bOUk3x1QxKK6b7OIP2ylazdfzZlUZRyxp1afpXO6mD3byrgv0WAjPT7mALlUNmTU81cAG/QQc6ULqfm/qRLiRtr7y6FNxpbRQOAQFCwkqeFq9y70uZWe4
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2026 22:09:01.7433
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 632e1726-8f5c-45da-7a4c-08de5f83025d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001C9.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8102
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.69 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:grygorii_strashko@epam.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:jason.andryuk@amd.com,m:victorm.lira@amd.com,m:andrew.cooper3@citrix.com,m:jbeulich@suse.com,m:sstabellini@kernel.org,m:stefano.stabellini@amd.com,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[stefano.stabellini@amd.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[stefano.stabellini@amd.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,amd.com:dkim,amd.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[11]
X-Rspamd-Queue-Id: 3F429B5305
X-Rspamd-Action: no action

Allow multiple dom0less domains to use the console_io hypercalls to
print to the console. Handle them in a similar way to vpl011: only the
domain which has focus can read from the console. All domains can write
to the console but the ones without focus have a prefix. In this case
the prefix is applied by using guest_printk instead of printk or
console_puts which is what the original code was already doing.

When switching focus using Ctrl-AAA, discard any unread data in the
input buffer. Input is read quickly and the user would be aware of it
being slow or stuck as they use Ctrl-AAA to switch focus domain.
In that situation, it is to be expected that the unread input is lost.

The domain writes are buffered when the domain is not in focus. Push out
the buffer after the domain enters focus on the first guest write.

Locking updates:

- Guard every mutation of serial_rx_cons/prod with console_lock and
discard unread input under the lock when switching focus (including when
returning to Xen) so that cross-domain reads can't see stale data

- Require is_focus_domain() callers to hold console_lock, and take that
lock around the entire CONSOLEIO_read loop, re-checking focus after each
chunk so a focus change simply stops further copies without duplicating
or leaking input

- Hold cons->lock while flushing buffered writes in the focus path
so the direct-write fast path does not race buffered guests or HVM
debug output

Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
---
Changes in v8:
- protect console_rx read
- move printk() to last
- update "Deliver input..." comment
- in __serial_rx() use nrspin_lock_irqsave
- in do_console_io() use count = 0 to skip the loop
- in do_console_io() move nrspin_unlock_irq up a few lines
- append () to function names in in-code comments

---
 xen/drivers/char/console.c | 80 ++++++++++++++++++++++++++++++++------
 1 file changed, 69 insertions(+), 11 deletions(-)

diff --git a/xen/drivers/char/console.c b/xen/drivers/char/console.c
index 2bdb4d5fb4..ed8f1ad8f2 100644
--- a/xen/drivers/char/console.c
+++ b/xen/drivers/char/console.c
@@ -518,11 +518,16 @@ static unsigned int __read_mostly console_rx = 0;
 struct domain *console_get_domain(void)
 {
     struct domain *d;
+    unsigned int rx;
 
-    if ( console_rx == 0 )
+    nrspin_lock(&console_lock);
+    rx = console_rx;
+    nrspin_unlock(&console_lock);
+
+    if ( rx == 0 )
             return NULL;
 
-    d = rcu_lock_domain_by_id(console_rx - 1);
+    d = rcu_lock_domain_by_id(rx - 1);
     if ( !d )
         return NULL;
 
@@ -540,6 +545,12 @@ void console_put_domain(struct domain *d)
         rcu_unlock_domain(d);
 }
 
+static bool is_focus_domain(const struct domain *d)
+{
+    ASSERT(rspin_is_locked(&console_lock));
+    return d != NULL && d->domain_id == console_rx - 1;
+}
+
 static void console_switch_input(void)
 {
     unsigned int next_rx = console_rx;
@@ -555,7 +566,10 @@ static void console_switch_input(void)
 
         if ( next_rx++ >= max_console_rx )
         {
+            nrspin_lock_irq(&console_lock);
             console_rx = 0;
+            serial_rx_cons = serial_rx_prod;
+            nrspin_unlock_irq(&console_lock);
             printk("*** Serial input to Xen");
             break;
         }
@@ -575,7 +589,11 @@ static void console_switch_input(void)
 
             rcu_unlock_domain(d);
 
+            nrspin_lock_irq(&console_lock);
             console_rx = next_rx;
+            /* Don't let the next dom read the previous dom's unread data. */
+            serial_rx_cons = serial_rx_prod;
+            nrspin_unlock_irq(&console_lock);
             printk("*** Serial input to DOM%u", domid);
             break;
         }
@@ -601,12 +619,16 @@ static void __serial_rx(char c)
 
     if ( is_hardware_domain(d) )
     {
+        unsigned long flags;
+
         /*
-         * Deliver input to the hardware domain buffer, unless it is
+         * Deliver input to the focus domain buffer, unless it is
          * already full.
          */
+        nrspin_lock_irqsave(&console_lock, flags);
         if ( (serial_rx_prod - serial_rx_cons) != SERIAL_RX_SIZE )
             serial_rx_ring[SERIAL_RX_MASK(serial_rx_prod++)] = c;
+        nrspin_unlock_irqrestore(&console_lock, flags);
 
         /*
          * Always notify the hardware domain: prevents receive path from
@@ -730,6 +752,7 @@ static long guest_console_write(XEN_GUEST_HANDLE_PARAM(char) buffer,
     unsigned int flags = opt_console_to_ring
                          ? CONSOLE_ALL : CONSOLE_DEFAULT;
     struct domain *cd = current->domain;
+    struct domain_console *cons = cd->console;
 
     while ( count > 0 )
     {
@@ -742,17 +765,36 @@ static long guest_console_write(XEN_GUEST_HANDLE_PARAM(char) buffer,
         if ( copy_from_guest(kbuf, buffer, kcount) )
             return -EFAULT;
 
-        if ( is_hardware_domain(cd) )
+        /*
+         * Take both cons->lock and console_lock:
+         * - cons->lock protects cons->buf and cons->idx
+         * - console_lock protects console_send() and is_focus_domain()
+         *   checks
+         *
+         * The order must be respected. guest_printk() takes the
+         * console_lock so it is important that cons->lock is taken
+         * first.
+         */
+        spin_lock(&cons->lock);
+        nrspin_lock_irq(&console_lock);
+        if ( is_focus_domain(cd) )
         {
+            if ( cons->idx )
+            {
+                console_send(cons->buf, cons->idx, flags);
+                cons->idx = 0;
+            }
+            spin_unlock(&cons->lock);
+
             /* Use direct console output as it could be interactive */
-            nrspin_lock_irq(&console_lock);
             console_send(kbuf, kcount, flags);
             nrspin_unlock_irq(&console_lock);
         }
         else
         {
             char *kin = kbuf, *kout = kbuf, c;
-            struct domain_console *cons = cd->console;
+
+            nrspin_unlock_irq(&console_lock);
 
             /* Strip non-printable characters */
             do
@@ -765,7 +807,6 @@ static long guest_console_write(XEN_GUEST_HANDLE_PARAM(char) buffer,
             } while ( --kcount > 0 );
 
             *kout = '\0';
-            spin_lock(&cons->lock);
             kcount = kin - kbuf;
             if ( c != '\n' &&
                  (cons->idx + (kout - kbuf) < (ARRAY_SIZE(cons->buf) - 1)) )
@@ -816,22 +857,39 @@ long do_console_io(
             break;
 
         rc = 0;
+        nrspin_lock_irq(&console_lock);
+        if ( !is_focus_domain(current->domain) )
+            count = 0;
         while ( (serial_rx_cons != serial_rx_prod) && (rc < count) )
         {
             idx = SERIAL_RX_MASK(serial_rx_cons);
             len = serial_rx_prod - serial_rx_cons;
+            nrspin_unlock_irq(&console_lock);
             if ( (idx + len) > SERIAL_RX_SIZE )
                 len = SERIAL_RX_SIZE - idx;
             if ( (rc + len) > count )
                 len = count - rc;
             if ( copy_to_guest_offset(buffer, rc, &serial_rx_ring[idx], len) )
-            {
-                rc = -EFAULT;
-                break;
-            }
+                return -EFAULT;
             rc += len;
+
+            /*
+             * First get console_lock again, then check is_focus_domain().
+             * It is possible that we switched focus domain during
+             * copy_to_guest_offset(). In that case, serial_rx_cons and
+             * serial_rx_prod have been reset so it would be wrong to
+             * update serial_rx_cons here. Get out of the loop instead.
+             *
+             * rc is updated regardless to provide the correct return
+             * value to the VM as the data has been copied.
+             */
+            nrspin_lock_irq(&console_lock);
+            if ( !is_focus_domain(current->domain) )
+                break;
+
             serial_rx_cons += len;
         }
+        nrspin_unlock_irq(&console_lock);
         break;
     default:
         rc = -ENOSYS;
-- 
2.25.1


