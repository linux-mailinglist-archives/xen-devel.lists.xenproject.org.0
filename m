Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ADDD84E2F1
	for <lists+xen-devel@lfdr.de>; Thu,  8 Feb 2024 15:16:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.678247.1055333 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rY5CJ-0003AN-S6; Thu, 08 Feb 2024 14:16:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 678247.1055333; Thu, 08 Feb 2024 14:16:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rY5CJ-00037q-PQ; Thu, 08 Feb 2024 14:16:15 +0000
Received: by outflank-mailman (input) for mailman id 678247;
 Thu, 08 Feb 2024 14:16:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Up58=JR=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1rY5CI-00037k-BO
 for xen-devel@lists.xenproject.org; Thu, 08 Feb 2024 14:16:14 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20601.outbound.protection.outlook.com
 [2a01:111:f403:200a::601])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9b995cf1-c68c-11ee-8a4a-1f161083a0e0;
 Thu, 08 Feb 2024 15:16:11 +0100 (CET)
Received: from BN8PR12CA0019.namprd12.prod.outlook.com (2603:10b6:408:60::32)
 by IA0PR12MB8279.namprd12.prod.outlook.com (2603:10b6:208:40c::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.14; Thu, 8 Feb
 2024 14:16:06 +0000
Received: from BN3PEPF0000B074.namprd04.prod.outlook.com
 (2603:10b6:408:60:cafe::6) by BN8PR12CA0019.outlook.office365.com
 (2603:10b6:408:60::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.36 via Frontend
 Transport; Thu, 8 Feb 2024 14:16:06 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN3PEPF0000B074.mail.protection.outlook.com (10.167.243.119) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7249.19 via Frontend Transport; Thu, 8 Feb 2024 14:16:05 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Thu, 8 Feb
 2024 08:16:04 -0600
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.34
 via Frontend Transport; Thu, 8 Feb 2024 08:16:02 -0600
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
X-Inumbo-ID: 9b995cf1-c68c-11ee-8a4a-1f161083a0e0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SYYYhhuo25wqmJlmPzC791mh/BJFs6+04A6jgikJplY/se25rcbADV9B4WLT7Boua5I6uSitfTHF6g30xYt44sdBXgjr4stLBgjP2uo+GuONRJYuztKuRjoKNe9bvC8EAzVS9p1/wKZBeyNYbDDBo7BGOYdK+PFNhHNwF6hQK7leGlT8qk0I6GsUfwSH4NoBkYwSsP5KUpLoz0HSvI8NVVp7aSWaoBtVHlTP5foXnmHGXv4DAJq/2FUkXyeyMqwEBDJAFiOyXrJLeNYfW+58Rx9PTfYxS+Y5cVEGqh38zev+iH7r6TsWQrdgZrRxFaCBJ/fngF1EiSFl+RRCLw8mEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eYJ+n8SemN9KXBcE3LP38y3El3PaoT/CJmuWmm7LOco=;
 b=hP/hUzgAusXpAcnXh9cTyTqUBAfNJC+swY73EL3ReTYGZFKKdo5pemT1ULT1BS/8Xebabmg+caQbR4+dU5WpSu+OGPAHmtF62AQvTODYogWerlat38kf+1Kesz0vZR6gNUOCSNGglE5VKug/1N/vpmnFjd77+bhM8UyRIUrHuJmMOswzbyRIETXMLEK1xpPcTta3QSc0gLFuicuPpOyGJrbMLgVSjdOUdi7X/DTg+XBccJG6PvkoVj93k/iPX268jFDxWErRht+6N7tVP1nhsJuzOGd9Yi0rsIVBWGcGNHHuYwlM1TNXB74LsKxIpIET/fYeGCL2vLqytFulmzu8qQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eYJ+n8SemN9KXBcE3LP38y3El3PaoT/CJmuWmm7LOco=;
 b=xhq6ZtTL0OHKZwbQLlj9CHEnByOiC0DwDh1F4AGjk1XVKd6P9roQAR2VR6eRtIvwoDev98mII6vVBfUl3iIJdxSIR1EQpP37ylg11YcCqGo3QzBQH6rFah+MY0woR8XqZD+9RtC4mxFBGDKzWEzQFUzGgY7YSZwX1OqL/UB14Ps=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Michal Orzel <michal.orzel@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Michal Orzel <michal.orzel@amd.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, "Jan
 Beulich" <jbeulich@suse.com>, Julien Grall <julien@xen.org>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: [PATCH] xen/serial: Drop serial_{put,get}c
Date: Thu, 8 Feb 2024 15:16:01 +0100
Message-ID: <20240208141601.78023-1-michal.orzel@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B074:EE_|IA0PR12MB8279:EE_
X-MS-Office365-Filtering-Correlation-Id: db149e00-21be-4b77-4c67-08dc28b07cfe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	qpDWTXmItqzI9oZWdkFnPh55oXhiiA8aKDDd1hh01KWCcWVY39fvK7rGvZXnO8BS0ErDwSSwULLUYhGuW3NU+tFHj5bF44K4q5SHvvj5oy4xujWyJwzE0uufpGc2bHMxMcU0eJWKB43FYEgO5MDeCSFi4T7JO1sV2iWChamzVKFqh96U2j8nS0PepjPe1vXCtCtnmpDsNR3HbPEeTEUze7igklPgHzua0psBnVbcaa1hxiYd2K3dJwpGlDE2S0lieiWPrV1+5ZUu7I24eVGX7Pph+/xIEvLIbr8+A83T/RimxJgiXVWaWCrRyMwzwQfJzKBagXHtMfg+GONGe5G/rgOby130AUul1C+sLFhMlg9in/1tQWGvy6cvecTH2G3s9eWQCxsBguw2lL94deWqqKmFp757TwoX3xxN7YYGqjesSxrJ9uubtnZnQ4GBdt8ZaiSyQYg/QxWuzocQXiwx3Et8r78/hj/gG+749nIB6ujSwKiVlUyIAKvq2jRlq6skZyp6Lr6XQftMBq4Ji4u/KPM4U/ojMPsx6VYiBzQnkZf/YU570lZDVhjp1ovq0bwSqsd5Y02aETVn5YtI0K/zjl+T8WhhzdoGtq/7TZXiBcc=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(136003)(346002)(376002)(396003)(39860400002)(230922051799003)(82310400011)(64100799003)(186009)(1800799012)(451199024)(46966006)(36840700001)(40470700004)(2616005)(1076003)(86362001)(70206006)(6916009)(70586007)(54906003)(316002)(356005)(82740400003)(26005)(336012)(426003)(81166007)(83380400001)(478600001)(4326008)(8936002)(8676002)(44832011)(36756003)(5660300002)(41300700001)(2906002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Feb 2024 14:16:05.5069
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: db149e00-21be-4b77-4c67-08dc28b07cfe
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B074.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8279

After removal of gdbstub by commit d182f9feae6d ("x86: Remove gdbstub"),
we no longer have users of serial_{put,get}c functions, so remove them.

Signed-off-by: Michal Orzel <michal.orzel@amd.com>
---
 xen/drivers/char/serial.c | 72 ---------------------------------------
 xen/include/xen/serial.h  | 10 ------
 2 files changed, 82 deletions(-)

diff --git a/xen/drivers/char/serial.c b/xen/drivers/char/serial.c
index 324024c29a10..93e217d34859 100644
--- a/xen/drivers/char/serial.c
+++ b/xen/drivers/char/serial.c
@@ -196,36 +196,6 @@ static void __serial_putc(struct serial_port *port, char c)
     }
 }
 
-void serial_putc(int handle, char c)
-{
-    struct serial_port *port;
-    unsigned long flags;
-
-    if ( handle == -1 )
-        return;
-
-    port = &com[handle & SERHND_IDX];
-    if ( !port->driver || !port->driver->putc )
-        return;
-
-    spin_lock_irqsave(&port->tx_lock, flags);
-
-    if ( (c == '\n') && (handle & SERHND_COOKED) )
-        __serial_putc(port, '\r' | ((handle & SERHND_HI) ? 0x80 : 0x00));
-
-    if ( handle & SERHND_HI )
-        c |= 0x80;
-    else if ( handle & SERHND_LO )
-        c &= 0x7f;
-
-    __serial_putc(port, c);
-
-    if ( port->driver->flush )
-        port->driver->flush(port);
-
-    spin_unlock_irqrestore(&port->tx_lock, flags);
-}
-
 void serial_puts(int handle, const char *s, size_t nr)
 {
     struct serial_port *port;
@@ -261,48 +231,6 @@ void serial_puts(int handle, const char *s, size_t nr)
     spin_unlock_irqrestore(&port->tx_lock, flags);
 }
 
-char serial_getc(int handle)
-{
-    struct serial_port *port;
-    char c;
-    unsigned long flags;
-
-    if ( handle == -1 )
-        return '\0';
-
-    port = &com[handle & SERHND_IDX];
-    if ( !port->driver || !port->driver->getc )
-        return '\0';
-
-    do {
-        for ( ; ; )
-        {
-            spin_lock_irqsave(&port->rx_lock, flags);
-            
-            if ( port->rxbufp != port->rxbufc )
-            {
-                c = port->rxbuf[mask_serial_rxbuf_idx(port->rxbufc++)];
-                spin_unlock_irqrestore(&port->rx_lock, flags);
-                break;
-            }
-            
-            if ( port->driver->getc(port, &c) )
-            {
-                spin_unlock_irqrestore(&port->rx_lock, flags);
-                break;
-            }
-
-            spin_unlock_irqrestore(&port->rx_lock, flags);
-
-            cpu_relax();
-            udelay(100);
-        }
-    } while ( ((handle & SERHND_LO) &&  (c & 0x80)) ||
-              ((handle & SERHND_HI) && !(c & 0x80)) );
-    
-    return c & 0x7f;
-}
-
 int __init serial_parse_handle(const char *conf)
 {
     int handle, flags = 0;
diff --git a/xen/include/xen/serial.h b/xen/include/xen/serial.h
index 12ef24351d0f..7548bb73249b 100644
--- a/xen/include/xen/serial.h
+++ b/xen/include/xen/serial.h
@@ -112,19 +112,9 @@ void serial_endboot(void);
 /* Takes a config string and creates a numeric handle on the COM port. */
 int serial_parse_handle(const char *conf);
 
-/* Transmit a single character via the specified COM port. */
-void serial_putc(int handle, char c);
-
 /* Transmit a string via the specified COM port. */
 void serial_puts(int handle, const char *s, size_t nr);
 
-/*
- * An alternative to registering a character-receive hook. This function
- * will not return until a character is available. It can safely be
- * called with interrupts disabled.
- */
-char serial_getc(int handle);
-
 /* Forcibly prevent serial lockup when the system is in a bad way. */
 /* (NB. This also forces an implicit serial_start_sync()). */
 void serial_force_unlock(int handle);
-- 
2.25.1


