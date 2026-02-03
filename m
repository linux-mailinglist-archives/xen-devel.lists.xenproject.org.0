Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EHA9Gup/gmnAVQMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 04 Feb 2026 00:08:26 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EB9C1DF8FD
	for <lists+xen-devel@lfdr.de>; Wed, 04 Feb 2026 00:08:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1219749.1528658 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vnPVI-0000lc-Ba; Tue, 03 Feb 2026 23:08:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1219749.1528658; Tue, 03 Feb 2026 23:08:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vnPVI-0000jc-7S; Tue, 03 Feb 2026 23:08:16 +0000
Received: by outflank-mailman (input) for mailman id 1219749;
 Tue, 03 Feb 2026 23:08:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aUNd=AH=amd.com=stefano.stabellini@srs-se1.protection.inumbo.net>)
 id 1vnPVG-0008QC-59
 for xen-devel@lists.xenproject.org; Tue, 03 Feb 2026 23:08:14 +0000
Received: from SA9PR02CU001.outbound.protection.outlook.com
 (mail-southcentralusazlp170130001.outbound.protection.outlook.com
 [2a01:111:f403:c10c::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3546e282-0155-11f1-9ccf-f158ae23cfc8;
 Wed, 04 Feb 2026 00:08:11 +0100 (CET)
Received: from CH5P223CA0004.NAMP223.PROD.OUTLOOK.COM (2603:10b6:610:1f3::24)
 by MN6PR12MB8591.namprd12.prod.outlook.com (2603:10b6:208:471::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.12; Tue, 3 Feb
 2026 23:08:03 +0000
Received: from CH1PEPF0000A345.namprd04.prod.outlook.com
 (2603:10b6:610:1f3:cafe::a4) by CH5P223CA0004.outlook.office365.com
 (2603:10b6:610:1f3::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.12 via Frontend Transport; Tue,
 3 Feb 2026 23:08:02 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 CH1PEPF0000A345.mail.protection.outlook.com (10.167.244.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.10 via Frontend Transport; Tue, 3 Feb 2026 23:08:03 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 3 Feb
 2026 17:08:02 -0600
Received: from SATLEXMB04.amd.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Tue, 3 Feb 2026 17:08:01 -0600
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
X-Inumbo-ID: 3546e282-0155-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QWFaNA2GQGIvz2nm9OO3SABCG6VidESFW2wUGsWtVA76i0Un81tXxupCXtNPQ5cFVVZXi/yJ0NCNmwLfB2N0fJAQsiedkwZQRNg/K7wh8jHTJC96HiKqcKc6+xftxRlgZfWi6g1dbzjrkRfhZwxKD6jcvmOomopxo0nkeBq45xuVa3y5JELXbiXZTT3+dju4R5+q+qMBF/gRXSlMtj/TsB9NSXHfelSjw85XXOGT/Rnr2O/eiV/BjQCUAVH7ratJCIpuBFfmXl71dcsv2nRuvdvGYZ09s7lz+lEEvKudmVtLzOJLJh6VtiJXJB0jWOV6kwCvPX+NiryMWfVWmAWn2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ldlEhyuj2S9L/CGueqaFFNeQSo5XY7pcNO609Q+D5BQ=;
 b=BrWGJYqISBT4xImDKzm9RU/C0I46yExjBHG19XD9ooQNGv0cz0wb2oOZ3yPmto28L2f7CBqA62SHOVRoY/UIuwsrcLFYKtG5xSx7CpJ9uxAOJ32AyoYJqrn336o/L6eWf5Oqxoa8houO+jFz8bYkIos3q6zewRv9yhtYriqlj78OAqRHQDzP9hTh+xipU3+/FLJ0eW5X9UEDj4LrZF4DG2ujgNLd1BRiTg/0YLKy2EG1fcCoWRXZ8RS0TysgH/bGUNRWvAx8R6ZvIIuAFGBsK4LgMfniZ0mDut7Qh6724aqxT+ZsF5igSooE9cSSrcjl6m2IQxtshjT8BzQLcATuBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ldlEhyuj2S9L/CGueqaFFNeQSo5XY7pcNO609Q+D5BQ=;
 b=GN9nurzHHhuqarAgljU6RZxQ9zNOl50fvZN/5Jgk8jjld+T7vjEdrDu5YdtNHTGmzz+ApwKbA6ibQC3as9H7jWESvO0oGLGPbaSnLh4OoPTIgbHg7w/6Ws4HOBZvdoONQ3VrtIO6exTMxYjjUY7JLqGG8QUnkz4DFnZyD9SOSmc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
From: Stefano Stabellini <stefano.stabellini@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <grygorii_strashko@epam.com>, <anthony.perard@vates.tech>,
	<michal.orzel@amd.com>, <julien@xen.org>, <roger.pau@citrix.com>,
	<jason.andryuk@amd.com>, <victorm.lira@amd.com>, <andrew.cooper3@citrix.com>,
	<jbeulich@suse.com>, <sstabellini@kernel.org>, Stefano Stabellini
	<stefano.stabellini@amd.com>
Subject: [PATCH v9 3/4] xen/console: handle multiple domains using console_io hypercalls
Date: Tue, 3 Feb 2026 15:07:56 -0800
Message-ID: <20260203230757.3224547-3-stefano.stabellini@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <alpine.DEB.2.22.394.2602031502240.3175371@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2602031502240.3175371@ubuntu-linux-20-04-desktop>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000A345:EE_|MN6PR12MB8591:EE_
X-MS-Office365-Filtering-Correlation-Id: 8fd9c07a-a6ba-47df-c2a1-08de6379155e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?vqYy73CN+zomQCQHpoknKaKoqkrbydagsDsESB3+SxCScMyS/nVuXasQhEbJ?=
 =?us-ascii?Q?TK5h6oirbBmVsPbNC9UHX1IYlXJWc3FF64uMo/ZFIfyfrLq7dusKAXuPH3gM?=
 =?us-ascii?Q?nmT0FeIZWO9KirZ8/Zpp+TM7KYf3z+4xoZLz8CFusN2AysWt/GstDhxutMBf?=
 =?us-ascii?Q?lRCr1/CIxw7QIWHauWImAvgupcE5RRIrezjQqu6yYcWwY2OjrYWJvV6/UWUu?=
 =?us-ascii?Q?0S3C+9kJ3WezNu3Iqp3EZeCPii2mI4eMT7YUUbssTb7j7b3i4L7giUKrhBh+?=
 =?us-ascii?Q?eJaR/FQ96gFpms+QE/KgT3Bc1K8dkEVDqV+ksOpHLaQzQ7Bl+ZCjGN+BwKwh?=
 =?us-ascii?Q?fWkwikoU1M3QT+vd1c3EOPHuuoY7ZBRHnxXQbj/QepKwaXp8Iivuk62XIkYt?=
 =?us-ascii?Q?+R4NwdPzgTI5c9mtx8Vqb5FQxb0qYDLEeBx8AdrvVzHUNoY5SjP7DxyizZ/2?=
 =?us-ascii?Q?P6wh6H78+YFbcDXU3k/0kNoUChGirEcGTHWEFK+Rhwdyre2vnBsi9Qc37Jqk?=
 =?us-ascii?Q?ldZ40I6kSRgIrFoGI+30rpMEvA4iD1jDULEjL0B/jjpozw5nBRu8YBNvW2Bn?=
 =?us-ascii?Q?G7IcqGb/CeBVSaJ0bhSahb+VIQSYKEPgA5RaKKHKbpb9brnMzjm+SwaHpHJd?=
 =?us-ascii?Q?k+kfRz5dcpn8GJgc7PaT66wwcTQo4E+AFdX/9sXFFlup6pTV+9mADLEzkehw?=
 =?us-ascii?Q?c3PRZ5RJouOY2JFRkphqfwEC+vdEu5pmNrK7nDPJU23/20rHyQAhA1yECtCW?=
 =?us-ascii?Q?VL5agWRJAJpKzUacdaHmhMZfGM3Io6LUgyp4HmhMoeQbAXaKZpf++I9AqXgz?=
 =?us-ascii?Q?2XmNOrdIDxfhUf4BT3C0DHFcZSRCwow8zJduTo2nRRlAVJzGhnmqKuWx1B+l?=
 =?us-ascii?Q?YvhJkWl/xB2JJd1lid51yooq5jhDxi5W+lxwlm17ja11WHMBSVjbPD+SxkcF?=
 =?us-ascii?Q?jPeQvZKMwc3yFZxSgBEhqbIaJ/4aKZZDFFlPQx3YvmDN0RKw9/oC87/5pzOo?=
 =?us-ascii?Q?SPAKH68grj7nwnXdwZf1KJ8Nez68UnjVCRbw0/NWNe6543bPzY7zaKS3zZp7?=
 =?us-ascii?Q?61NLbo5igAqvARHO/vY6UOL8p4gHF/n/M7YRIec2eGxpSUFEBM0l10KZr47d?=
 =?us-ascii?Q?E+3wYc+SEaAv3Jh/M/cCZtMxUga//ceGnGdsNZKP8mUbdcxcM8zcaSUdpSi9?=
 =?us-ascii?Q?YYZsJ/SbZrJ2X7yJZnxZm/rBmWzAr41zmWsQ3KBJJlRdvFvrUnWhw0nauAsx?=
 =?us-ascii?Q?HWAXgyX3TQ+OHyJtgUkaXK3FL7PItuMseEYOMPJ8jKB5pN8AO0uluKB+hrjN?=
 =?us-ascii?Q?VyUpyIkNCZkYJHMToHQHp4GpT15bjUKAhkFO50CW/FdEMhfbj/WztwaFDdaM?=
 =?us-ascii?Q?Gb8jvL8KWylk0esK8iS6WLH+Ji8saDjEr/e5V78xhV+SKjexML4+N0FloO/q?=
 =?us-ascii?Q?d6dgVVitHOvCJYR4tBeOYyIc5qPhwfACY+LRHuoU/LdOD359KEDrJ5JKCSi5?=
 =?us-ascii?Q?0TnwZbcHNAO0B3buGEc8BrwqqC8qV2iNVhnc4nULtgDWKa7VefXO7DnN4oyH?=
 =?us-ascii?Q?WEvjEaPo4kB+IIBLRIxTTnAkXGkD450Wg7u1/Qm9EbZzB8lKjR85bhVFIg0K?=
 =?us-ascii?Q?D51aAqPaYOflpkmK9PCFAplCY3MqtO3RvlmK5TpX3ReSTbq0brkh6MbZ2Azt?=
 =?us-ascii?Q?vxrGIA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	I3eQZeyKB6ADKkcS9qNwCmnAhdX+28JFqdeB6nfC0ceNP5OUyfSsIq+jDETY6XAkwtIp58g6qhHvur7F3EAkk4+ctG2xRjqx6svTeTbjofjVjKL3N/S3GoUV/Xq/Vh4/0Xz+CEThPUmaI9eiMMx8vx5l1VzOKA1IhU2oAetZvNwduLNaX6atIy7iVa4jKOs3SJ8Xr46K3euiRDiWRkk0nQUaA39+qz5bRAQe71QR/nnRxFVuWnHUWfEHeSmbYa/yFoIY6XGfcsCtuH3y8aWZpMMo3zQGj2sej7owWA5ToLxgFDMv+38EWDJxlBlrWVn/cKtlZ1NuUDLNVQHk+UZFZD32IKz2w67Voo/OuKH2HPx/ptNDlHRnQE+ByKI7FoFF2vOhIjFI51UNvm2P00zez2nM7rlNaSooqLrQZ4d9oA/oWlTXMDEzupOo48cEArAS
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2026 23:08:03.3310
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8fd9c07a-a6ba-47df-c2a1-08de6379155e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000A345.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR12MB8591
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.69 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,amd.com:email,amd.com:dkim,amd.com:mid];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[11]
X-Rspamd-Queue-Id: EB9C1DF8FD
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
Changes in v9:
- use irqsave/irqrestore in console_switch_input
- update in-code comment
- blank lines
- local copy of serial_rx_ring
---
 xen/drivers/char/console.c | 78 +++++++++++++++++++++++++++++++++-----
 1 file changed, 68 insertions(+), 10 deletions(-)

diff --git a/xen/drivers/char/console.c b/xen/drivers/char/console.c
index fbc89ca2a4..b59ebdeddb 100644
--- a/xen/drivers/char/console.c
+++ b/xen/drivers/char/console.c
@@ -541,6 +541,12 @@ void console_put_domain(struct domain *d)
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
     unsigned int next_rx = ACCESS_ONCE(console_rx);
@@ -553,10 +559,14 @@ static void console_switch_input(void)
     {
         domid_t domid;
         struct domain *d;
+        unsigned long flags;
 
         if ( next_rx++ >= max_console_rx )
         {
+            nrspin_lock_irqsave(&console_lock, flags);
             ACCESS_ONCE(console_rx) = 0;
+            serial_rx_cons = serial_rx_prod;
+            nrspin_unlock_irqrestore(&console_lock, flags);
             printk("*** Serial input to Xen");
             break;
         }
@@ -576,7 +586,11 @@ static void console_switch_input(void)
 
             rcu_unlock_domain(d);
 
+            nrspin_lock_irqsave(&console_lock, flags);
             ACCESS_ONCE(console_rx) = next_rx;
+            /* Don't let the next dom read the previous dom's unread data. */
+            serial_rx_cons = serial_rx_prod;
+            nrspin_unlock_irqrestore(&console_lock, flags);
             printk("*** Serial input to DOM%u", domid);
             break;
         }
@@ -602,12 +616,16 @@ static void __serial_rx(char c)
 
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
@@ -731,6 +749,7 @@ static long guest_console_write(XEN_GUEST_HANDLE_PARAM(char) buffer,
     unsigned int flags = opt_console_to_ring
                          ? CONSOLE_ALL : CONSOLE_DEFAULT;
     struct domain *cd = current->domain;
+    struct domain_console *cons = cd->console;
 
     while ( count > 0 )
     {
@@ -743,17 +762,36 @@ static long guest_console_write(XEN_GUEST_HANDLE_PARAM(char) buffer,
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
+         * console_lock and it is called with cons->lock held. It is
+         * important that cons->lock is taken first.
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
@@ -766,7 +804,6 @@ static long guest_console_write(XEN_GUEST_HANDLE_PARAM(char) buffer,
             } while ( --kcount > 0 );
 
             *kout = '\0';
-            spin_lock(&cons->lock);
             kcount = kin - kbuf;
             if ( c != '\n' &&
                  (cons->idx + (kout - kbuf) < (ARRAY_SIZE(cons->buf) - 1)) )
@@ -796,6 +833,7 @@ long do_console_io(
 {
     long rc;
     unsigned int idx, len;
+    char kbuf[SERIAL_RX_SIZE];
 
     rc = xsm_console_io(XSM_OTHER, current->domain, cmd);
     if ( rc )
@@ -817,6 +855,9 @@ long do_console_io(
             break;
 
         rc = 0;
+        nrspin_lock_irq(&console_lock);
+        if ( !is_focus_domain(current->domain) )
+            count = 0;
         while ( (serial_rx_cons != serial_rx_prod) && (rc < count) )
         {
             idx = SERIAL_RX_MASK(serial_rx_cons);
@@ -825,14 +866,31 @@ long do_console_io(
                 len = SERIAL_RX_SIZE - idx;
             if ( (rc + len) > count )
                 len = count - rc;
-            if ( copy_to_guest_offset(buffer, rc, &serial_rx_ring[idx], len) )
-            {
-                rc = -EFAULT;
-                break;
-            }
+            memcpy(kbuf, &serial_rx_ring[idx], len);
+ 
+            nrspin_unlock_irq(&console_lock);
+
+            if ( copy_to_guest_offset(buffer, rc, kbuf, len) )
+               return -EFAULT;
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


