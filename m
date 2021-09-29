Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AA71541C555
	for <lists+xen-devel@lfdr.de>; Wed, 29 Sep 2021 15:15:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.199086.352929 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVZQF-00026T-Lz; Wed, 29 Sep 2021 13:14:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 199086.352929; Wed, 29 Sep 2021 13:14:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVZQF-00023u-Iw; Wed, 29 Sep 2021 13:14:55 +0000
Received: by outflank-mailman (input) for mailman id 199086;
 Wed, 29 Sep 2021 13:14:53 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lbjb=OT=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mVZQD-00023a-LH
 for xen-devel@lists.xenproject.org; Wed, 29 Sep 2021 13:14:53 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3b126ad0-2127-11ec-bcfe-12813bfff9fa;
 Wed, 29 Sep 2021 13:14:52 +0000 (UTC)
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur03lp2054.outbound.protection.outlook.com [104.47.10.54]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-12-Q5pSGNuuPzuE5k3J6YPxDg-1; Wed, 29 Sep 2021 15:14:50 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB7150.eurprd04.prod.outlook.com (2603:10a6:800:12a::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13; Wed, 29 Sep
 2021 13:14:47 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4566.014; Wed, 29 Sep 2021
 13:14:47 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 FR2P281CA0028.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:14::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4566.10 via Frontend Transport; Wed, 29 Sep 2021 13:14:47 +0000
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
X-Inumbo-ID: 3b126ad0-2127-11ec-bcfe-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1632921291;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eW/2cF3lu6QYOHTIXUs9q6QXeBV+Luo/7Lua57wsjCU=;
	b=RFwuWuizdH85sv3rGnCKzKjZkR86mObT8tviw5uiDjaaDcong++gAcrJsWlHTamv88v+Lx
	gqM81AMiWlJypjllbhTxlSp2H7JUpLsctOqvAMg91JXEEFQUAeEtb1VXLSzqpHqi2eyvc9
	WuN6To0h1VKxVs+yfUZkmpDPyESMW80=
X-MC-Unique: Q5pSGNuuPzuE5k3J6YPxDg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hO+bq2XZYZuU4NVXmDz0OiVOj56/iXgRQE3QFAH9IUJ4BDp2oQdTVaSlvUFnryPn6XwHnxWLwY3RwSDIO/dLUzHnYqBqLvdpngf3SyL6J+nnxMokpJtupMEq3gwZD4M/YMbQ7QaTDXTUfBsKgpLfHWpkkH+Yz2q41fZyhXtEbvC8tlAs6mooBg2+uQ4rTOkilYAbqDnjzptx+5sU3tSxD20Fk0KqpML6jZn1Tq1Fxa5KeCj91XCr7POeNL54/m+c4OQS3R11hlTARF7ayz9W5ffJwTfL9Q/Wny7JYhNvt9so0yXL8gE9OV8oZnwytV7/G24zR1Th5+KHnSmD/1wQPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=eW/2cF3lu6QYOHTIXUs9q6QXeBV+Luo/7Lua57wsjCU=;
 b=LE7xNH0JaXtIoBkxN4JgLUV3+TfN1ISvfg2NbNU5E2EfMho/eapi/8XljV0II4pY9mZuYP3AnwOJCr8UlmrGT0WnDeg2pRJ82xRbvp7VE7hDGU3jtKqvcUhZRhjMHvxWjV4bFX+6jYojxXfgDLJsMISVVRxrMOdnYL+V/S80gGc4jpcD8Aj5l07NRe4/O7tR81OOaZHPj8vcGyNVPoX/d3x+mta+yON4UomsXNVlK8ppR3OoRnZZftst74PA3Ag9laWtuPPf8UsrN26tbx8LNYh3YGmelsUSKCIrO9N3pu/d6Sr0evgRYTgx8/T8ldoe0tfjuy/rbcbpoFgxbeKiDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=suse.com;
Subject: [PATCH v4 4/6] x86/HVM: also dump stacks from show_execution_state()
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <cbdc93a6-e675-420c-f7e8-53aa407766ba@suse.com>
Message-ID: <db023918-618a-d19f-e600-ee0a683a01af@suse.com>
Date: Wed, 29 Sep 2021 15:14:46 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <cbdc93a6-e675-420c-f7e8-53aa407766ba@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0028.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:14::15) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0bb73bed-6c89-412a-2339-08d9834b1cb7
X-MS-TrafficTypeDiagnostic: VI1PR04MB7150:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB71505054E009C1ED4777752EB3A99@VI1PR04MB7150.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3968;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	3ZNlQTUaLyH8/6MqA5ptf9H4lJCoeMLgR5EWxt0q0aFA+aI+CDmJQHMvPdFA0JEz6CX9kcdipFCbplFOoloHtpDw9l6QEioW4DVdTnSGZWfcg+8vQqJMz57YiRIOL7+V58PNl/hCfXfAV7GxL55hu4PyjIryd/PHEA6ioNrpvqM/5Qq3bWx4VCvhI+0dmaZRg0tESvchrKqA23JhhtIvB8oFW469qp+iXUWFvlBtNWbLGRI33V7FXsECWeqC1SNfEz1NmnKXZBqYE/vTVMJY6wtv/ZJ5wA6NcneTGiFCxLhQ25cZyE4QMMrhCXpQ0YMJW7Dgj9Ew+9fYTBrffCUFBL4RwK616H4hGtqvyR49aZpNA5YpKlZRWhQhW0HC+l94ifd5VcsIBHyW2UwMcZuJK+3okURHcBNYs+Lid1wn8gJSr50iRXdX+PXqmGWFeiBd2ijxVwZ53hSGdjr04ltQ5k2wFkzFmEgtyxl9pPhvk71hoWWyro9B3lpP/7Z84rU3UQkTUX5/5BE+FE382ZQTUDA5M9qvksfIIfOrwjYA984Jl0i8zCR+iWxIfGSvjcyCS3aOuwoEXgpx9GFkKLH2cR5qVc0mTbd558FSp6x0KDEdjIUcluU2AtykoOi4e3cXxnqlf1E9SqREsKX4IEJfJMxfB2mlrOwr1lUFCeSwtvHrjRc8fvaUzp7eXIXEhZ4E4O9N82Yzsz4ikNAVb+LERjAXR7ghe+LJvepiOqhBKsk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(38100700002)(66556008)(186003)(2906002)(16576012)(316002)(5660300002)(26005)(66946007)(8936002)(31686004)(83380400001)(8676002)(54906003)(66476007)(6486002)(86362001)(508600001)(36756003)(6916009)(956004)(4326008)(31696002)(2616005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YmowbVNNNU5weklQZGhPMW1LSUwwbmZsb0VhMG1uaVVHajZJNlRVTis2WTJI?=
 =?utf-8?B?SVVPS3JSb3lVME5DUWJWYzVKdDBDVFJnV0JDNnFTWjlOMnRCTDNGSmxqYkVH?=
 =?utf-8?B?Njh3MGZ4bWExWEcyNnhCYmJpQnNtRHgwVHRHQ3psa3kyNERBa25MTnd2elpx?=
 =?utf-8?B?OGl0dDBKMm5Ebis0TnFvcVVVQTFSeFRBMVVsS0c0dkxTVkp0dVlGMDNzSWJs?=
 =?utf-8?B?eHl6dk9vbXpzSVF1L1BNNHFFbnZYTERSTzk1QUpnckpZQzJoazZFNlFUMHRY?=
 =?utf-8?B?YlB5OUI0RlBCWDFlMXNIcWtXcTdYUFlIcDd2bTQzbjdYVWIxNDhnQndPK1hn?=
 =?utf-8?B?V2FQdHNhSjV1VEpkdTAydUdoV3JObWIwUWovdFBjRXNtS3pxUHA1MWgzbG00?=
 =?utf-8?B?KzJpM3Fia2NjajU2MmR3bTZmdkdyTGZpSnEra1l5L0tNTm4vZmQzOXZqREov?=
 =?utf-8?B?T2FpWURVQlVJaEFNOHdNR0g3MW83bzFFS2lxZVJ4QVljN3dSOVBDbUJyQm1C?=
 =?utf-8?B?RUxHRXcybm1wQTVwSU5KZzlXRnNSaWd2WFRQb2wrRCtOdFhqWGJaWXZJcXpr?=
 =?utf-8?B?ZFlGdmkrSkFvQnc1bytuMlhGeVAzRXB0ZEFvYnBqQzdFOHIvY3o5NmhrQVlv?=
 =?utf-8?B?cTJQK2N3bkhyZ0xQNmE2N1UyeUd5SUtuajZVVGtQOEZQNEJKUkk0Tm9DVnYv?=
 =?utf-8?B?L2duSFpuenBjMlpuamZWVGtaeUNtOWFVTDR3YW9CelBVeW1ldFh4QkFxa3RT?=
 =?utf-8?B?NUZVbFBUOHlrTW9MVThtS09lS2xaN1d5TUlzek9hbHNvUjF6NkhiYkY0Z0Y5?=
 =?utf-8?B?Yk9Mc3hrLzkydTVxdTZoZk81WE5PNnlTbDd4VFEyVkNxVVp4bHdtQ1l0MFBl?=
 =?utf-8?B?dkoySGVtanR4UHpEQXdWQW9aR1ZLdXptNndrRFNFS2w4OHRudWFjczFPRkdO?=
 =?utf-8?B?NGhnYW5uM0xpTFlORGMzOU52T25ENmRZdUpJYUcvbFNZRlM1dTZ4VWF2OGh3?=
 =?utf-8?B?dXBkSkFERlpiV09QQ091R05ZbjJ0RTkvTXhSQUdpVU5aQkh6RHFUZTIwK3pu?=
 =?utf-8?B?eTJZSW13bEFpdnlYdHQxeTJjWlRBL2FHS2NUY3k2V1R3bkdBYXExNjdIMCtv?=
 =?utf-8?B?SzdPaFNjc2hsT0o4cEVyVEk2cGxxZS9oV3VRR3BYVHMwQUdocDBoQVVOMXdx?=
 =?utf-8?B?K3k0TXgrcER6cnFEb216UFBvdVNoK0c3R29lYzF0dmEycGJYbmo3dWErS1Uy?=
 =?utf-8?B?QjZlSm1aL0czbzdTOGh5NzBGaFZPY2dtZjNFYTg4R2p6bnJBRDVrczhoOFhJ?=
 =?utf-8?B?SzBXdjFQR1VuVDhLZmUwVldhYjZ6bkQyRjFPQ1dYOGNjM3duS0Rra2Fiejht?=
 =?utf-8?B?dWs0bUMvWlZvQy9kR3ZDMVRMYytoVFFwYlBTQ001OSswWGhCRzZ5RDNucE4v?=
 =?utf-8?B?NE5lM25obFFJNjVUWGtmZ1h5K2ZrSmJSOWkxTjM3RjhJNEpHNzVQeFpKVjlW?=
 =?utf-8?B?K1d0LzZoNzNyRWpDNS9STm82U3pja1dVb3V6N0I2dnFaN3hOMFNmOTBvVUhi?=
 =?utf-8?B?Y01aUzlBdFVMUXhvM2xSLzkyVEJDTDR2YWZMOWRqL0lsUFl6VlJIOStaVWN0?=
 =?utf-8?B?WWcreTJCb2cya29LclFUamhVLzEvNWdWc1FLNVdwMkhTNlF0bys3WExpcHNp?=
 =?utf-8?B?MGFjd1NacXZpRU1BMGxrcStvOUt3TDM2OHhtMFI1VXJEQjZXbDN2WkN2ekRj?=
 =?utf-8?Q?71kUPElaM53sIe3nxRQvkYgXEMkbIMTEtaiPE66?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0bb73bed-6c89-412a-2339-08d9834b1cb7
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2021 13:14:47.7835
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UtEVlkbDpvc1RMt3KX76A2rb6wPkfkVDI1HcTqlp3HH0PG4XefMcWPEqLs8ZiiCT+BCvQn9r/lvHQivQSEfCmw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7150

Wire up show_hvm_stack() also on this path. Move the show_guest_stack()
invocation out of show_stack(), rendering dead the is-HVM check there.

While separating guest and host paths, also move the show_code()
invocation - the function bails immediately when guest_mode() returns
"true".

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v4: New.

--- a/xen/arch/x86/traps.c
+++ b/xen/arch/x86/traps.c
@@ -303,10 +303,6 @@ static void show_guest_stack(struct vcpu
     unsigned long mask = STACK_SIZE;
     void *stack_page = NULL;
 
-    /* Avoid HVM as we don't know what the stack looks like. */
-    if ( is_hvm_vcpu(v) )
-        return;
-
     if ( is_pv_32bit_vcpu(v) )
     {
         compat_show_guest_stack(v, regs, debug_stack_lines);
@@ -611,14 +607,11 @@ static void show_trace(const struct cpu_
     printk("\n");
 }
 
-void show_stack(const struct cpu_user_regs *regs)
+static void show_stack(const struct cpu_user_regs *regs)
 {
     unsigned long *stack = ESP_BEFORE_EXCEPTION(regs), *stack_bottom, addr;
     int i;
 
-    if ( guest_mode(regs) )
-        return show_guest_stack(current, regs);
-
     printk("Xen stack trace from "__OP"sp=%p:\n  ", stack);
 
     stack_bottom = _p(get_stack_dump_bottom(regs->rsp));
@@ -687,8 +680,30 @@ void show_execution_state(const struct c
     unsigned long flags = console_lock_recursive_irqsave();
 
     show_registers(regs);
-    show_code(regs);
-    show_stack(regs);
+
+    if ( guest_mode(regs) )
+    {
+        struct vcpu *curr = current;
+
+        if ( is_hvm_vcpu(curr) )
+        {
+            /*
+             * Stop interleaving prevention: The necessary P2M lookups
+             * involve locking, which has to occur with IRQs enabled.
+             */
+            console_unlock_recursive_irqrestore(flags);
+
+            show_hvm_stack(curr, regs);
+            return;
+        }
+
+        show_guest_stack(curr, regs);
+    }
+    else
+    {
+        show_code(regs);
+        show_stack(regs);
+    }
 
     console_unlock_recursive_irqrestore(flags);
 }
--- a/xen/include/asm-x86/processor.h
+++ b/xen/include/asm-x86/processor.h
@@ -493,7 +493,6 @@ static always_inline void rep_nop(void)
 #define cpu_relax() rep_nop()
 
 void show_code(const struct cpu_user_regs *regs);
-void show_stack(const struct cpu_user_regs *regs);
 void show_stack_overflow(unsigned int cpu, const struct cpu_user_regs *regs);
 void show_registers(const struct cpu_user_regs *regs);
 void show_execution_state(const struct cpu_user_regs *regs);


