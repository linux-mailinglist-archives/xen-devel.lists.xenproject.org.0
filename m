Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qFaYIrrJcmkzpgAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 23 Jan 2026 02:07:06 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CD1336EE78
	for <lists+xen-devel@lfdr.de>; Fri, 23 Jan 2026 02:07:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1211958.1523326 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vj5dY-00078M-HC; Fri, 23 Jan 2026 01:06:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1211958.1523326; Fri, 23 Jan 2026 01:06:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vj5dY-00076U-ES; Fri, 23 Jan 2026 01:06:56 +0000
Received: by outflank-mailman (input) for mailman id 1211958;
 Fri, 23 Jan 2026 01:06:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Su0e=74=amd.com=stefano.stabellini@srs-se1.protection.inumbo.net>)
 id 1vj5dX-00076H-F4
 for xen-devel@lists.xenproject.org; Fri, 23 Jan 2026 01:06:55 +0000
Received: from BYAPR05CU005.outbound.protection.outlook.com
 (mail-westusazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c000::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cc4d5ea1-f7f7-11f0-9ccf-f158ae23cfc8;
 Fri, 23 Jan 2026 02:06:52 +0100 (CET)
Received: from BYAPR05CA0086.namprd05.prod.outlook.com (2603:10b6:a03:e0::27)
 by LV3PR12MB9267.namprd12.prod.outlook.com (2603:10b6:408:211::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.10; Fri, 23 Jan
 2026 01:06:46 +0000
Received: from MWH0EPF000971E6.namprd02.prod.outlook.com
 (2603:10b6:a03:e0:cafe::cc) by BYAPR05CA0086.outlook.office365.com
 (2603:10b6:a03:e0::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.3 via Frontend Transport; Fri,
 23 Jan 2026 01:06:45 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 MWH0EPF000971E6.mail.protection.outlook.com (10.167.243.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Fri, 23 Jan 2026 01:06:44 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 22 Jan
 2026 19:06:43 -0600
Received: from SATLEXMB04.amd.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Thu, 22 Jan 2026 19:06:42 -0600
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
X-Inumbo-ID: cc4d5ea1-f7f7-11f0-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DNOxh/uaxDBpwtuetcOrTGIvHgXg23LcFf90341QJIhORy6I6ZcWc2B5/oUV2jdOv3BROr0RnLfkNgU4bAtFqKvBJ4LsXo7dhd0da6cM/uJJzSeIfBoeK/uG0kSVOPtYPsOVAyD/BgSSs/dE9HD0UNI5VqESFQnavbGwJD7UEvqoVHD2HYn9iSkx98FLykxi2DaGrwFrhQGtm5Bb9dkjwZlDRJ7c1EJeQ7eVEXZl5TNO6GcI+lolLKCHubtWV7DeTNJXohZsnRiV9pNht2yQ+KlhfKS1f9xuvSfMJY+d3g+/3GbYgZtJcDlXONl30We2J51vlH+6u9QojuxhYq1prg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3AX/aTZxd4SbVNEt4XnbYZOE7wNw1QVzhOV83yoNCV8=;
 b=Hd+sFGzhvUy1yf0wIQs3T07sqf1Mpu55YyA6vinMxXgx7b07HQNgl4Xpq8pkWNbt5/H2mtvIa3NBD/7KfVW6u5rNoOcLv7UKYuuHkZYtwLDDkXMHBy1k+GbiCROzpaHXlPN+uSmfR65iQqCA3p2/IzkwMImR0nuXjvHf/aYFEbYrwXaWQlWJCFVllXDOk2ynJF3Xv41F01OHHRGZuzuJ+kD0gV8WGw6cC5gzC68DvNpbqV0Eh7mvlWK62ghhi++dJTR0+bLiqASZkGVGN3Cm/nx8/M32YhdIsW8FfgG15iAsqTzIJWrOVsFaaOpgwBgA9PtBD4MCN1tjOAUTk/oedg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3AX/aTZxd4SbVNEt4XnbYZOE7wNw1QVzhOV83yoNCV8=;
 b=IPnp/3NXjfw2bGpVM15tmiqBuNn7o5/BJB9efrGux5b8HXXzvJukQCk2vrvJriSOGmDCS6DPDND7O9VRIjngw0FsIM4FkBhPs6b24AsgJ2sdkpFZKdIIVCkQSkZkXuXzGtZ3REFz2/VJfQ6kQn67TZO6HCV5JRBOZYB81J5MgIg=
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
Subject: [PATCH v7 1/2] xen/console: handle multiple domains using console_io hypercalls
Date: Thu, 22 Jan 2026 17:06:39 -0800
Message-ID: <20260123010640.1194863-1-stefano.stabellini@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <alpine.DEB.2.22.394.2601221704110.7192@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2601221704110.7192@ubuntu-linux-20-04-desktop>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000971E6:EE_|LV3PR12MB9267:EE_
X-MS-Office365-Filtering-Correlation-Id: eb630b8e-f487-4693-d68e-08de5a1bace4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?fq6eQpS2gueRpb98td84iqQUgLhJ8AhX8pM0ibUBYyCJ9JyjFRmV2q7bfVd1?=
 =?us-ascii?Q?d0WplTaXKyhYlsY8zaSQcXhy2cl5RWbFr6DTBK6gwESDiOIIHTYogRrg78Vm?=
 =?us-ascii?Q?+p7n0OBK/Q4BmRmmHO9kRiR3dMHplhVidbcCQMYN4/ePp7y0BWwzBqtA9ENP?=
 =?us-ascii?Q?WIXigdkQROMj+9mfFelrR6/Gb/XgS0N/RIFAAbmMIwL6fEZsOW1QMA3qOOuZ?=
 =?us-ascii?Q?Y1HADsTx2FKkYUmXssuMOVuLPrwq/UDw1AQ+60iGvGtI64XWJsjC+njnOnEb?=
 =?us-ascii?Q?emh6FaBWXV484Ieb0/sHWBuzoD3ThH3myiA1jLAtZ/NoJO0qR6n2f8e1hPH5?=
 =?us-ascii?Q?bSnBDbiwSuT3ngF2gFJRqQNvKoQ6zE+JDsQFjKb12ltT2w0J5C4cZMsMHSYw?=
 =?us-ascii?Q?q9Fd3P8uLGU1UM3rnGZG3AJN5h5ts6KDQZswNg9O/2c2bVe4+1lyt7LYKmm1?=
 =?us-ascii?Q?DA8vKClzoaje6njAzEHGKF1DqpgUBAIlo/1kmk2T2W5cpRG5pVVqz8cYKiEi?=
 =?us-ascii?Q?JdIZDAdPfU6fXSAcv9XXBHaLj6DUXqpKlKLdkxXXBPiaQVQxGTloVlxY5c4H?=
 =?us-ascii?Q?8UGJt8ORynnC0jAjc2uDnP5ys9BrGr/PuEvnG2cMnbMy/r7FANYSJsNpSu+q?=
 =?us-ascii?Q?unUbTQcaUb2vxgI0289BbDlEZZMXUyNoJCDH/TJ3mHXDO5+xULHm3Yj2fffu?=
 =?us-ascii?Q?Ozz2dFoq3TDf0UmTCR7mv3Y3u3mBlaVWmOknEZlInHb0+1xvl6sJoihikOv3?=
 =?us-ascii?Q?+0tTEFaDaP+M9BnKHZYlLcsfW8ra0RLptw9zuPpmXUQ/XJbMeXEmtb54sIy/?=
 =?us-ascii?Q?o7sy0w+TDwB4RHMJAh4NPeOb7+8KRLqr8uwBjGLCD1hakXoIF4ttw1NW+h5D?=
 =?us-ascii?Q?o2Bm/DVP7R5OAWxlrHx5yMFKxt4WJAf2BxWOz0A0eqdlhAFsFzLLbcerBje7?=
 =?us-ascii?Q?CZBGEmI8n1gnh0L2kF251Dc6hItKcQWNZz02CI7sU+NZzZEuR0HipmQ7UN3+?=
 =?us-ascii?Q?NVI28FIHdu5Y+SP+zdw5ItFdwV4fO3EXbDSLSIzhQ8W092PtKObhA40NDC6r?=
 =?us-ascii?Q?kVUKbVTNtQs3Dp+qB8GZ/21KNIXYalaEW+Qa18jvdS/xSTj4gbt+AIlUTAlb?=
 =?us-ascii?Q?cTReKnkbzNcEX8Po2cE55Snm5JoQotL6/siwOfhZoJhJzXb1FYvxC7zrghP6?=
 =?us-ascii?Q?hYWbP/NsVpHsfzu1Kkj040nv7/W9vQ9Ju4L9ZmTClslGRW0rYHaH0PIYLLYK?=
 =?us-ascii?Q?6xuKIKWm6QakinpdZN6cLmk+xEHfJHbk/z98nYDIGC3VEznl8U/ywIRIW4Jg?=
 =?us-ascii?Q?4o/iOU4DqU5YLoDpOPlm1NljQgg9A62R8eaXiblGRw+zvK6oWnWVwF/REY2i?=
 =?us-ascii?Q?gHl0Kq4uvvYTagxVdBsZb9pi28Gnj/KrUuXijwnDyYXlehgI/IR3tEhBSW7l?=
 =?us-ascii?Q?KAAeXxqD7k5pjN9huciCTCG/w3AZY4WgKpwAkJq6gY6rfT3NX4fP4Gd/soD6?=
 =?us-ascii?Q?+b7s+s0l0Ow6UbvTxZJ8Ej1decKp2LF9b4h8yq7R8V6FMrI7khNY/AAAKpHy?=
 =?us-ascii?Q?EAy0bEMY81v0KXgMC/IfuizTXV1FArjjVzY8sPOB9Ytinrhk39GtRpIMpWck?=
 =?us-ascii?Q?FAuW2rre9oW6GDGtdJR7y99ZFBYg/2EBfFkMc7yngAnzURGP401uKQOBp+kk?=
 =?us-ascii?Q?cvLKdA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2026 01:06:44.3670
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: eb630b8e-f487-4693-d68e-08de5a1bace4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000971E6.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9267
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.69 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,amd.com:dkim,amd.com:mid];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-0.929];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[11]
X-Rspamd-Queue-Id: CD1336EE78
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
Changes in v7:
- move vpl011 hunk to new patch
- updated commit message
- add ASSERT
- const pointer
- more in-code comments
- move spin_unlock earlier
- code style
---
 xen/drivers/char/console.c | 75 +++++++++++++++++++++++++++++++++-----
 1 file changed, 65 insertions(+), 10 deletions(-)

diff --git a/xen/drivers/char/console.c b/xen/drivers/char/console.c
index 2bdb4d5fb4..09354db2e0 100644
--- a/xen/drivers/char/console.c
+++ b/xen/drivers/char/console.c
@@ -540,6 +540,12 @@ void console_put_domain(struct domain *d)
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
@@ -555,8 +561,11 @@ static void console_switch_input(void)
 
         if ( next_rx++ >= max_console_rx )
         {
-            console_rx = 0;
             printk("*** Serial input to Xen");
+            nrspin_lock_irq(&console_lock);
+            console_rx = 0;
+            serial_rx_cons = serial_rx_prod;
+            nrspin_unlock_irq(&console_lock);
             break;
         }
 
@@ -575,8 +584,12 @@ static void console_switch_input(void)
 
             rcu_unlock_domain(d);
 
-            console_rx = next_rx;
             printk("*** Serial input to DOM%u", domid);
+            nrspin_lock_irq(&console_lock);
+            console_rx = next_rx;
+            /* Don't let the next dom read the previous dom's unread data. */
+            serial_rx_cons = serial_rx_prod;
+            nrspin_unlock_irq(&console_lock);
             break;
         }
     }
@@ -605,8 +618,10 @@ static void __serial_rx(char c)
          * Deliver input to the hardware domain buffer, unless it is
          * already full.
          */
+        nrspin_lock_irq(&console_lock);
         if ( (serial_rx_prod - serial_rx_cons) != SERIAL_RX_SIZE )
             serial_rx_ring[SERIAL_RX_MASK(serial_rx_prod++)] = c;
+        nrspin_unlock_irq(&console_lock);
 
         /*
          * Always notify the hardware domain: prevents receive path from
@@ -730,6 +745,7 @@ static long guest_console_write(XEN_GUEST_HANDLE_PARAM(char) buffer,
     unsigned int flags = opt_console_to_ring
                          ? CONSOLE_ALL : CONSOLE_DEFAULT;
     struct domain *cd = current->domain;
+    struct domain_console *cons = cd->console;
 
     while ( count > 0 )
     {
@@ -742,17 +758,36 @@ static long guest_console_write(XEN_GUEST_HANDLE_PARAM(char) buffer,
         if ( copy_from_guest(kbuf, buffer, kcount) )
             return -EFAULT;
 
-        if ( is_hardware_domain(cd) )
+        /*
+         * Take both cons->lock and console_lock:
+         * - cons->lock protects cons->buf and cons->idx
+         * - console_lock protects console_send and is_focus_domain
+         *   checks
+         *
+         * The order must be respected. guest_printk takes the
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
@@ -765,7 +800,6 @@ static long guest_console_write(XEN_GUEST_HANDLE_PARAM(char) buffer,
             } while ( --kcount > 0 );
 
             *kout = '\0';
-            spin_lock(&cons->lock);
             kcount = kin - kbuf;
             if ( c != '\n' &&
                  (cons->idx + (kout - kbuf) < (ARRAY_SIZE(cons->buf) - 1)) )
@@ -815,6 +849,13 @@ long do_console_io(
         if ( count > INT_MAX )
             break;
 
+        nrspin_lock_irq(&console_lock);
+        if ( !is_focus_domain(current->domain) )
+        {
+            nrspin_unlock_irq(&console_lock);
+            return 0;
+        }
+
         rc = 0;
         while ( (serial_rx_cons != serial_rx_prod) && (rc < count) )
         {
@@ -824,14 +865,28 @@ long do_console_io(
                 len = SERIAL_RX_SIZE - idx;
             if ( (rc + len) > count )
                 len = count - rc;
+            nrspin_unlock_irq(&console_lock);
             if ( copy_to_guest_offset(buffer, rc, &serial_rx_ring[idx], len) )
-            {
-                rc = -EFAULT;
-                break;
-            }
+                return -EFAULT;
             rc += len;
+
+            /*
+             * First get console_lock again, then check is_focus_domain.
+             * It is possible that we switched focus domain during
+             * copy_to_guest_offset. In that case, serial_rx_cons and
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


