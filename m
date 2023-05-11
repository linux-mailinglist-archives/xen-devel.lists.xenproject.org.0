Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F1FC26FF10F
	for <lists+xen-devel@lfdr.de>; Thu, 11 May 2023 14:07:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.533323.829884 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1px54P-0000tZ-FW; Thu, 11 May 2023 12:06:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 533323.829884; Thu, 11 May 2023 12:06:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1px54P-0000rt-Ca; Thu, 11 May 2023 12:06:53 +0000
Received: by outflank-mailman (input) for mailman id 533323;
 Thu, 11 May 2023 12:06:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=CrlD=BA=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1px54N-0000KI-Nq
 for xen-devel@lists.xenproject.org; Thu, 11 May 2023 12:06:51 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0602.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::602])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4efc1d0e-eff4-11ed-8611-37d641c3527e;
 Thu, 11 May 2023 14:06:49 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by VI1PR04MB7072.eurprd04.prod.outlook.com (2603:10a6:800:12c::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.33; Thu, 11 May
 2023 12:06:48 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::8e41:82b6:a27f:2e0c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::8e41:82b6:a27f:2e0c%4]) with mapi id 15.20.6363.033; Thu, 11 May 2023
 12:06:48 +0000
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
X-Inumbo-ID: 4efc1d0e-eff4-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i5Wgd725Hb5qq7bRrYHcOI4VKkdQuVNrO+SV8QoMAL50eW87DCuI/gtADXKGo0bsTw+LFtDeAJixHJhdxmBjNN3mMPZ83McpxKmt1orn9F8TmSDZP6SuZqMIsIom+TfN9uLMtI2ernXBFv7b4jeIMdFAZwK3yYzDYA5CwmvCJ9mc2NjoiRD16Q70vUSyxvI8H8yS27/GjqKd4FncQN0upa/6FmIe3Y+kJ1h1iqbHCwC8HbTeFZ9QUh3KH2ZAVdl1bQFtSAiVX61BzYQv7rvyP6n/DSbItfsIhqjqxStjjB0SvUBsvhcqnm2uPYdSghO+n9dKey986et2h3uCn0nnSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rthJQS7crBKjl3ZFrOs6SFetUwu0mLQJ0JboEF0Txzg=;
 b=LKxZ3wFOrPdP/8LXdsJSK9EtYo9p3h03s44LSJFMXoSInx+Ts5c1pyR7eClW3+DN379bJpS5fZuxyZMZNb6GTcZwJ85Rq9P0TrB8+hlcsaWVLLBoBm0Rw2ypNqmxb3g4P3ipJDVCK8yeXNvl2OWy8aFhvCSZu8m7S6q0lCO8cKv+YxwRMpUVtKbkIlQI7Fw/r7c//7QZlEjGaR06keefI2OX+EfONJ8hzLFmt79Z0TedxSiQDi+I2rx5ccTm6KwsF3xvcEwqOCbH5WKVA8lbC7r+RnUm0iOn/BDERgROHZJKLjPD23yfmsvhb2UUQq8NPsqaNJ5I/hM6b+s8WdZNNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rthJQS7crBKjl3ZFrOs6SFetUwu0mLQJ0JboEF0Txzg=;
 b=uMue81MVy677rVdiSdhiIU7aDIlX64wsbjVLgVmpeafo8DYKGe1u80XCVnmKe9Cqtb0fx49GcKTGFJ2Z3voVzfheyqklq5rJ/ZRJ8AY58FSCFgHlDx5cdyDQi8ruEbz2tB9u4GnK/3tPEXKmtrMHCd8MBRnHvGZlr4YcF26WUvT3yyP3StLGAHyIXbRHMRAnQnIL4vU7s+H5avvfNgUE4iOYPnEUBBBXPWGDT8jPpf7YJZ0HKhpC8nPYeHVVlvT/2jsXydUwJOvJw+HBz43I0hEjMa5sj/WImEvHgxNwPGjVFp5+DkVwdBXEf9nHivX0dDOdmGJlZ3/Th5uVbVUnsg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <27dd8f40-1ea6-1e7e-49c2-31936a17e9d7@suse.com>
Date: Thu, 11 May 2023 14:06:46 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: [PATCH 4/7] x86: detect PIC aliasing on ports other than 0x[2A][01]
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <95129c04-f37c-9e26-e65d-786a1db2f003@suse.com>
In-Reply-To: <95129c04-f37c-9e26-e65d-786a1db2f003@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0106.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9c::18) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|VI1PR04MB7072:EE_
X-MS-Office365-Filtering-Correlation-Id: 4caf44d5-2e29-4e0e-fb79-08db52183275
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	s8jy3byeHlo2Xcd4ocY4hZvB2ZmHVmCdT43DG/AWaSdOYNOkpPj5cAWdlDE7c3AZdSzWBGwGers9sxh7NKOXiTiXSM8SeneGw8ik7DdTVOC8fUIXnghWqqPAfV3e6zPI7Site3o5PX/AvkWCPVTWOtGon8VgGmNPfrrLORn/HGl0r9wstinfa+RqrMC9nZzHY8240k2H0jKhHwghjNjHObi1zYUKwfxsdKBTUHCqhWUEyWknZ3XdcO8qIto2InEjSBpWYeUz18EwAQA310JpzU2TsMR1Xz7yi9JitTgQ6/orp8UsUYWm3uihbTxA2okRDlkb+z6bX/P14pifHDw+5fjWReKkf5tVE2ybiGMiY2Dx7HUpgUMolGeBQag3re/qY/hCPPu/OjYzUhkyoyJGs471LrtKVVjeuPQTG2PP2rlgAjwncB3Rr3dtw/psajLdPjkRrtLWhXn3RifBLsG6LW3AcUo71vZ39Th/ySb+Ds3r5ya9Pr732hLfINPH8Ljk0Fe2tvJOW+2CmlogyErQUvXz/kcUAgdqeeRSr/2A3n2vEqbBSF2Zugfca0mhD56xlgiWfDErgjFaWkD66g99bUl+0XGAvyE+96CDeWJwBFp2mSLOEgGTAGer1M7qr3Q5UrxQgzTMkzCY1DObU5dNQg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(366004)(39860400002)(136003)(396003)(346002)(451199021)(31686004)(36756003)(2906002)(41300700001)(86362001)(38100700002)(8676002)(31696002)(5660300002)(8936002)(4326008)(316002)(83380400001)(478600001)(66946007)(6506007)(6916009)(186003)(6486002)(66476007)(66556008)(26005)(54906003)(6512007)(2616005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VVZDWTk0eFBzM05nM28relRrS1lJSlBkM0ZWOERibi9FbnJ3T3lMT1hnYldC?=
 =?utf-8?B?dlZNNHZ5cEV4Q2RwRlhOOWxTVDkza2lFbUFjTTJ3V2JZYzR6c2J5Q3YwWTM2?=
 =?utf-8?B?Zk1pWjZ2SVV6N2VYSWxiM09KVUJ4WUpaaXVMb1dKeSsvTm5wTGxFMUpTREs2?=
 =?utf-8?B?SW9Tc1ZJOG9pcGd0V3NBYmxOdWFBRmZCSnpOYjhXQVJodHoxVTJnRkRGVTN4?=
 =?utf-8?B?NmNBdGZLVDMrSThGZnAvRGJkU3Bkd2RiYjBKc3VLeVB5SDRxVE84aUIzSXFw?=
 =?utf-8?B?QWtGQXVMV2xURVdJRVlBRzVPZk1xTW41R1BZRFZHY1ppZGtTbVBCa0Y5MHpT?=
 =?utf-8?B?Q0F4SExXOXNhL0plL0JxYkh3WHE0bTBKZTE2ZHR1ay82bG9RQWdreGwzdmE0?=
 =?utf-8?B?Q0pPaGhNZkhFeVpYcnZzZndSUUZHZ0o0Rnd6Q1NzamJWN2hrcDZ5Vjh2ZmQv?=
 =?utf-8?B?ZitsanNCZjhLZHBJWEVjaWtTZnJxTkFGUGw2QVlEQTZQbDUwamRucExxK0dy?=
 =?utf-8?B?SUxPajJYQ21DQ2hERER0OUh2VXQ5S3YvQzZjU2hsNldoTHg4Q0wxdDB3RXFG?=
 =?utf-8?B?MWdpUk5FUmxITVZNdFJRY3NkUTRMREpmR3lDRVN3ZHhzekZDdFhLV1FIMVZh?=
 =?utf-8?B?SUVyTWc0bnMycWhtQzhHSTZqSzIrRDU4NEtRb0NtU29FcStXN0JrR05HRXEy?=
 =?utf-8?B?YTJ4cnpLamxZekYxLzloOFA2Ky9GcmZPQm9Wb3hVOGFSb0RRQXRYL1J6WWln?=
 =?utf-8?B?b0xyanhRdUxmY0VKbEh6SDhBazBlRGpqVFdVM2YyQThyQU5ocnI4TW5wSWR1?=
 =?utf-8?B?cGxaKytZdENVYlh0ZlpqeEd5YXpRbmsxSzdGYnBJaTQzWmx3TXBtSTJpWUli?=
 =?utf-8?B?K2dVUWtaeEM0V1JzMTFxbmowSUE5ZmZUNW9pRnU0TzFSSlhDYnVDUEtRRUdV?=
 =?utf-8?B?TFIwZzN3UDVLYWU3cGJ6Q1REWExZKzJsUjV0Z0VFRFhqeHliLzVHZDVFM3NH?=
 =?utf-8?B?UFY3eDVOYXVpRWJYcUk5KzZ5bDF6dlYydExrRzRqM25OTGhzTWtBakVlUElZ?=
 =?utf-8?B?ZXVuU0tmejdlOWRYRGwzcURjK3Z1dFlJK0t2aG5SeFBsOU03YUV6MTEwbmZ3?=
 =?utf-8?B?Q3FiTkFPMXlZSkl5cW1sQVREWkVxWEhKNXhEWWlHMERuaG1qS1M4VTlpeDJj?=
 =?utf-8?B?Tno4NTQxSGFxTjNzdGIya2kxMEdtS1RtclhuRUdyeWVGc1k5Y0VVTk5YWDdl?=
 =?utf-8?B?VTdBSE84SDN4M1hJc0dJRkJUWDFTSXlnU0ZaZEpJK0Q0bHlxMWFZUFlSNjI4?=
 =?utf-8?B?L25QTHNVcStaVmlLVFc2N1NXbWZ4ZVlkREVGYUE4dnN6a2NhODY3MHhTelUv?=
 =?utf-8?B?eEJCcjJjZksxZldLNkVXc00xbXkrRHhTZ2Raa1hxQ0ExNTBzaXR3cHNhZ0pW?=
 =?utf-8?B?VzNNVU1MTXludUEzeW9nRmFzUEpNTk5vWEdUcFprMWV5SnRIUVBYeHI5cWpv?=
 =?utf-8?B?NTBpRFdJSGV0aUNSUDY0Mk1GRFR2YjB6VmVQYkVQWXZpdFFYblB2QVEyY25m?=
 =?utf-8?B?NVVJMmFoK0hkQVhvZk9JOUJ0a2NaekxINHVOc2FJZkZsRW1uV2dZcUVRVUEy?=
 =?utf-8?B?ay95VG42eVhWREVOUVNHOUVyS3ZtSjZZVWRLYngwTDBYVGtZbzJPYWsyOFRw?=
 =?utf-8?B?eG1wWExjNzJaWWpFQmg0c29ueWF2czRWSTZuU1dOcmF2SXQrQVIrMi9BY2FW?=
 =?utf-8?B?M1NXOEttRDM0ZHZNZFhUSHhCSTdMQmxid0J6TmdNNFpTY3piTWdYTCtET1BL?=
 =?utf-8?B?S2NWZzhseDFmdXVvY1hwcE5Gek1YclhPbTNzTFQyamN1bmpmUWhNTFlLV0Vt?=
 =?utf-8?B?a1M3b09pZ1U3WHVwRHJ5MDdROUlCN1JaV1gyUDg4eVduMGtiM0QvVTJSU2Rx?=
 =?utf-8?B?bm4wODBxaWtzT0JINlhoM1VuN1Y3TnV0bHBCQnlvZHRSZGN1Qnk4TnFab0RX?=
 =?utf-8?B?WEpnZFVQYTFxNUFxM0JmVWc3TVIvYksrS1Z5YlF0YWNhcjB6R09WelJFWW1Q?=
 =?utf-8?B?cHB5akNuc0VVdTc0bDVRa0ZOVFA1eWtMeThydTBmWWNBU1NoWUJZbWVZRVRz?=
 =?utf-8?Q?Ygf5yU/403EeUFysAnRJYkmg0?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4caf44d5-2e29-4e0e-fb79-08db52183275
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2023 12:06:48.3894
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: W+MUsw/B+bw9jgOXSYSjSUMmhUl/nuWAbauq2C/lHVjDCX5r89UnHLeOBD0lKdxjZzZgk3Fbo0r/9GX7gBf3tg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7072

... in order to also deny Dom0 access through the alias ports. Without
this it is only giving the impression of denying access to both PICs.
Unlike for CMOS/RTC, do detection very early, to avoid disturbing normal
operation later on.

Like for CMOS/RTC a fundamental assumption of the probing is that reads
from the probed alias port won't have side effects in case it does not
alias the respective PIC's one.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/dom0_build.c
+++ b/xen/arch/x86/dom0_build.c
@@ -479,7 +479,7 @@ static void __init process_dom0_ioports_
 int __init dom0_setup_permissions(struct domain *d)
 {
     unsigned long mfn;
-    unsigned int i;
+    unsigned int i, offs;
     int rc;
 
     if ( pv_shim )
@@ -492,10 +492,17 @@ int __init dom0_setup_permissions(struct
 
     /* Modify I/O port access permissions. */
 
-    /* Master Interrupt Controller (PIC). */
-    rc |= ioports_deny_access(d, 0x20, 0x21);
-    /* Slave Interrupt Controller (PIC). */
-    rc |= ioports_deny_access(d, 0xA0, 0xA1);
+    for ( offs = 0, i = pic_alias_mask & -pic_alias_mask ?: 2;
+          offs <= pic_alias_mask; offs += i )
+    {
+        if ( offs & ~pic_alias_mask )
+            continue;
+        /* Master Interrupt Controller (PIC). */
+        rc |= ioports_deny_access(d, 0x20 + offs, 0x21 + offs);
+        /* Slave Interrupt Controller (PIC). */
+        rc |= ioports_deny_access(d, 0xA0 + offs, 0xA1 + offs);
+    }
+
     /* Interval Timer (PIT). */
     rc |= ioports_deny_access(d, 0x40, 0x43);
     /* PIT Channel 2 / PC Speaker Control. */
--- a/xen/arch/x86/i8259.c
+++ b/xen/arch/x86/i8259.c
@@ -19,6 +19,7 @@
 #include <xen/delay.h>
 #include <asm/apic.h>
 #include <asm/asm_defns.h>
+#include <asm/setup.h>
 #include <io_ports.h>
 #include <irq_vectors.h>
 
@@ -332,6 +333,55 @@ void __init make_8259A_irq(unsigned int
     irq_to_desc(irq)->handler = &i8259A_irq_type;
 }
 
+unsigned int __initdata pic_alias_mask;
+
+static void __init probe_pic_alias(void)
+{
+    unsigned int mask = 0x1e;
+    uint8_t val = 0;
+
+    /*
+     * The only properly r/w register is OCW1.  While keeping the master
+     * fully masked (thus also masking anything coming through the slave),
+     * write all possible 256 values to the slave's base port, and check
+     * whether the same value can then be read back through any of the
+     * possible alias ports.  Probing just the slave of course builds on the
+     * assumption that aliasing is identical for master and slave.
+     */
+
+    outb(0xff, 0x21); /* Fully mask master. */
+
+    do {
+        unsigned int offs;
+
+        outb(val, 0xa1);
+
+        /* Try to make sure we're actually having a PIC here. */
+        if ( inb(0xa1) != val )
+        {
+            mask = 0;
+            break;
+        }
+
+        for ( offs = mask & -mask; offs <= mask; offs <<= 1 )
+        {
+            if ( !(mask & offs) )
+                continue;
+            if ( inb(0xa1 + offs) != val )
+                mask &= ~offs;
+        }
+    } while ( mask && (val += 0x0d) );  /* Arbitrary uneven number. */
+
+    outb(cached_A1, 0xa1); /* Restore slave IRQ mask. */
+    outb(cached_21, 0x21); /* Restore master IRQ mask. */
+
+    if ( mask )
+    {
+        dprintk(XENLOG_INFO, "PIC aliasing mask: %02x\n", mask);
+        pic_alias_mask = mask;
+    }
+}
+
 static struct irqaction __read_mostly cascade = { no_action, "cascade", NULL};
 
 void __init init_IRQ(void)
@@ -342,6 +392,8 @@ void __init init_IRQ(void)
 
     init_8259A(0);
 
+    probe_pic_alias();
+
     for (irq = 0; platform_legacy_irq(irq); irq++) {
         struct irq_desc *desc = irq_to_desc(irq);
         
--- a/xen/arch/x86/include/asm/setup.h
+++ b/xen/arch/x86/include/asm/setup.h
@@ -52,6 +52,8 @@ extern uint8_t kbd_shift_flags;
 extern unsigned long highmem_start;
 #endif
 
+extern unsigned int pic_alias_mask;
+
 extern int8_t opt_smt;
 
 #ifdef CONFIG_SHADOW_PAGING


