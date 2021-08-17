Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1309E3EEE80
	for <lists+xen-devel@lfdr.de>; Tue, 17 Aug 2021 16:27:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.167894.306526 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mG03z-0003jz-Fx; Tue, 17 Aug 2021 14:27:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 167894.306526; Tue, 17 Aug 2021 14:27:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mG03z-0003hB-CH; Tue, 17 Aug 2021 14:27:35 +0000
Received: by outflank-mailman (input) for mailman id 167894;
 Tue, 17 Aug 2021 14:27:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=tbpc=NI=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mG03y-0003h5-Nu
 for xen-devel@lists.xenproject.org; Tue, 17 Aug 2021 14:27:34 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 357ac1f8-a01a-42cb-9ebb-19c3d0009a01;
 Tue, 17 Aug 2021 14:27:33 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2057.outbound.protection.outlook.com [104.47.12.57]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-21-pYBQXVpXOPesQ7LNRoIf4w-1; Tue, 17 Aug 2021 16:27:31 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VE1PR04MB7360.eurprd04.prod.outlook.com (2603:10a6:800:1a3::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.13; Tue, 17 Aug
 2021 14:27:29 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4415.024; Tue, 17 Aug 2021
 14:27:29 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 FR3P281CA0021.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:1c::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4436.9 via Frontend Transport; Tue, 17 Aug 2021 14:27:29 +0000
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
X-Inumbo-ID: 357ac1f8-a01a-42cb-9ebb-19c3d0009a01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1629210452;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=40US14X/1jgZPiEiNTxfN9+abFvahdUTbEzEluiRlXk=;
	b=Hi/uIhD0NNPR/28SbFc5ULk4h+vOOk71vHATkiYwEfYsEx0KDUJ+xMSFpnFxh20u3c0MP6
	XO41HqH9nqB99wotxSVTBp4gaI3dO/uXxNMHhvIpXs1BQxwNS25BSFyHmLU0PDWkIpEYxC
	+MfB2wFtLEsXpSLZLdZvMnuvO9eTU88=
X-MC-Unique: pYBQXVpXOPesQ7LNRoIf4w-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WLMOBSXzYQsitooBlyD6B9UvQxpYVVWeuE+7IW+MTnOzurTlrROBAwcD02gGU/Iqyx9A8Y4X6D2p6ondAIJyw3HJHVh8tyJIawRoy5MVgS8tfafqBM7DTy6j7S9yksgeWMi+k8LuA7jFxh9YyXKC3FXJgBVWIQ98axWfEcEvZtYi2L1rDcJbdpEjBdpZH41mVKTw4k9YCh0AP1ou6Y5iYWuNOfZ42DZA3SKOjldYnfYgloM3QXkHqUPBpNanuE9gplaZ4UmtxSJvRPhKp9uY+o9cqikV9666xyqi/wCFMF6yTlBvtsAoTv2KGrza3XlDlmlrltCDH6PwkjP84LLwEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=40US14X/1jgZPiEiNTxfN9+abFvahdUTbEzEluiRlXk=;
 b=JSUaAKbNerqv7kC8XSTBL+qtWwrpWnAshvvrOXtfe/Q6no8UfVMy60+bFwvaZ9bt8A7Xblo73GI0h1wcupcKDHIqojG5WBHopXDMkJUkTcwo69enypodW+2FrWUNUvZS0SkIdnK4SI9V1jlI/Rf7l3o0JVvD1KfeA+nlOpwh6mAyaUT5wweelMN/VAEr0xVIbSRGuAr9KKUlv1LSruuStpAWrpoYYTqB8nJap8PjjEU6M9Y6Pd71xEHCKntNZ6k7RLWe2TotZSHcGfoJ8E45ECjMCn8XlzCryCNDgHNNZG9KLU90yhhugGIdx+TIea+xOC9Ev/o8uz1pgBMkzKywfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=suse.com;
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v2] x86/PV: suppress unnecessary Dom0 construction output
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Message-ID: <39b949ad-4052-c577-a726-e1b8fd97f099@suse.com>
Date: Tue, 17 Aug 2021 16:27:28 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0021.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1c::11) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: add720c9-4728-4683-4886-08d9618b24ca
X-MS-TrafficTypeDiagnostic: VE1PR04MB7360:
X-Microsoft-Antispam-PRVS:
	<VE1PR04MB7360C0AA87A4E231B4C031A7B3FE9@VE1PR04MB7360.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	JMfQRs8eHakua0QGf0VJgosGz1991YWAZGGKNL1GVlSpHbJwZhAyt0NX70IRIWMkQUd4k2lghRlctJ4aXnRbUgtmLkpKTXXIICxjg+QJ1pDCoA16jKODn9rrJy/xnHdPf/rffGc6f8Cws5m1h241QM2p5bsilPaKgYiGy2nOiJUNOtj3aaW/Ep4jLkiSsPtLM57YmB+Oieb/OVkS1dcRP9AKBKFnL7iZH9K52plSYz4h0eIZSRqwJMzCGrdfFuYptdGw4laqLsaYbTVcAH6tGH2Sx6n9mGITuaFZCKvwWbNyENLJrJtm66xwIGczw5DsSsqjx53yH/HKemOy+vz2g9Efn0oN38whGcbiCzEkaU/yBv0lhRdtraUSLpeQfGVx2BnvmxXOEzNrww7A8GxeIdWIP3ykcxexusxc9FdvFAl2F+PigU3Zl/Dif/AC2B/cIfyjypu1VSP+7I/LgsHokN+Z2gv4pTVwkz3mVVozHUwHIGb7NGk4OMKQnbsRr55N62Eb/y4gjKXXZS/G2fN8kmlL5SjHz7iCF+VcroCNfGCKc7TJzm7nNeniYOe4Fvil+4vNw7yWcXGqXBT/dRZZ3TfYM2xZD5IIMdySaE8XKh3tt+9ZbfFS8MCUgyYMON1vOs2fi0Tck93GeWf4w883sYMrEkF2Xy9Rt/DBF+dlreUa4oeX7RS8iNybQp7Fdr3HArNsQ47bdToaptJjw/6bAtttI7QxQoin8+VZUO/5l40=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(396003)(376002)(39850400004)(346002)(136003)(366004)(26005)(186003)(31696002)(31686004)(54906003)(956004)(5660300002)(16576012)(8936002)(316002)(6486002)(36756003)(2616005)(4326008)(66556008)(6916009)(66476007)(38100700002)(8676002)(66946007)(478600001)(86362001)(2906002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MXVkTWJ0YmNMaytCWTRrY2hYUGZzaXc2NkpwdDZFN01VQ1F6YzNLeFowN3d4?=
 =?utf-8?B?Z2lhNHF4aVNSeTJQamlPN0wyTGx3UzRwalVndENaaFEyU2V1SVVVam10WTRs?=
 =?utf-8?B?Tk5CTlczL2xpemJRZWV1ckxadFZ2Zk05L1NUUnhiUmdGV2pSOXVXb3d1Z29m?=
 =?utf-8?B?N0ZOVTFqU2t6RysySjF5a3B2ZEVNcnhaY2w1ay9WV2h2cDkra0xVQVd6WmI0?=
 =?utf-8?B?QXNJMUtKMWlVL1QxVDdoWWs0ZXVFRE9WZkFOMzdZaXc2YUsybHozb2ZYTmJQ?=
 =?utf-8?B?dDRNVS91N3JTOWJOYXJPNW5CRHVBaUxNWmdyN2JrRXJhY0NGTlhTSmQ4V01U?=
 =?utf-8?B?bU5JVEZHM0FUQk9MRktNeFNmeDA1WUQ0ZmxaRFZXQTUxOWxiVzByb3VwMHUr?=
 =?utf-8?B?cU44VjRoNE04ZUNlWnk0OE8wOEZCa1FKdWVWWG1nbmRxV2crMUI1MHZJek5z?=
 =?utf-8?B?ZWY1a3dkSmQ2U0tGNUpwMllpRTcwblVDdzhndk1PUSttQUNQQ2NuQW1BbVlD?=
 =?utf-8?B?d0kzU0NsaW9YcW5zV3RqZzJrVnh3ZVh3ejF6YkdXLzNtWXk1a0liRlpQajdN?=
 =?utf-8?B?QXhneEk0QVJpNUhkNExTQ1BiSjB6RnU0UDBOSVJlbndJWU5ybkpWSkJlODBi?=
 =?utf-8?B?V2h1QzQ3ajNQK2JUaWpmMlZYYjdYSFl5bUQydlZwcTBUM28zTzNNNGhGVFNN?=
 =?utf-8?B?MVhHTFZvMk9nK3NFcWtTbTFobE9yYU9YZkJkYU43emJ3Z1VFb2trb0JUSng2?=
 =?utf-8?B?alhqZk8rM0pHRUV1VXNnNU93VE00aUxBeDFLZU90ekd4RGljekFjbVVmYWRO?=
 =?utf-8?B?WVNMWGJEMFJhbzJLenFvb3QvSFRRUnNUeTFKUlhMdHRmRkxoejdoNTBOSGFI?=
 =?utf-8?B?UUhjck1wb0dYbVpaUEFwcFNteGQ0YkNoR2I2M2JDZ1BrM2pOMlZqdUVyRHNJ?=
 =?utf-8?B?VmJVNW9XMlhjQVBNeHg2bVdpTzZZelhWa05sT2c4RFNOVGJ5STB6NTIxa29l?=
 =?utf-8?B?MWVjTDUxa3NRTmgxNzNsZjNFc2htbExvNG40Sm9RQVBhbkNxUzJRcWl6Q1Ry?=
 =?utf-8?B?ZFFBc3NHaitxNkszSVEyR3ZOQzU2R1VuYWZyYjR6anlZaDhJK0VOTU8zYlVk?=
 =?utf-8?B?YW91YTNXTUEvY2VYYUxkSXlzM0l5V21xS1ozTUNOZDA3L1AxTExHRGkyOHk3?=
 =?utf-8?B?WjhWZy90cks5NHRVS2NxZzk5RWRXNG1uNThMQ0dZTmthcDg4aHZTQnFESjZt?=
 =?utf-8?B?YmxhUDVuTXZwRkgwaGs2WEpSVFA0SUJ5cGE5MDY4STdqZlRKbUs1NXRzc0hn?=
 =?utf-8?B?S1YrTnp6UGVBMEcxaUZsZmNhQjIwZWc4bDNKenQ0SktjMldJVWpQdXZSSUVR?=
 =?utf-8?B?ZERuOHFtSlBPdGt6dFpNOVBHbFczdEIyYlJXelg5N09KeWxRQkZjaER1eGsy?=
 =?utf-8?B?dW1LdmhvUTVXZUpXNXBQT1lwaDV2eDdLQ0lzVnZGa0JBT09kRExNdGNZRE9N?=
 =?utf-8?B?WEV2QmVTaVRsTnBxdVgyQmFKMG5vaDcyeGlTR2xyaGpHV3VQc0gweE40TlV0?=
 =?utf-8?B?bTd6WkNidVZib0xoN0U1dGU5Y2xleG1oUHB4Z2Y3ck11blA5STNLbUl5ZUhk?=
 =?utf-8?B?TEVVSURDaTU2K01adXR0MkxYVyt3c0lJR05VZmd2NEI5NVBjU00xdjR4Ynds?=
 =?utf-8?B?RGM0T0RrN3ZsMmFwMFZHMWF3VXVJSm84SEJNNEFFRFdrN3hlV0lyRzErNHRi?=
 =?utf-8?Q?qxdzf7k2FByl65rpW5Y6sNk98C3Tj7XAnqMoLE5?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: add720c9-4728-4683-4886-08d9618b24ca
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2021 14:27:29.6720
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O0wXQj+QDxMFuvBsbj5fzFyw23xWyOd4A5jXREsa32E4D4HwmVX6luBmEjkY4ZOZVHXrbckbuVZQKxEuYLvsjg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7360

v{xenstore,console}_{start,end} can only ever be zero in PV shim
configurations. Similarly reporting just zeros for an unmapped (or
absent) initrd is not useful. Particularly in case video is the only
output configured, space is scarce: Split the printk() and omit lines
carrying no information at all.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
v2: Split printk() and replace / extend #ifdef by if().

--- a/xen/arch/x86/pv/dom0_build.c
+++ b/xen/arch/x86/pv/dom0_build.c
@@ -575,25 +575,21 @@ int __init dom0_construct_pv(struct doma
         printk("\n Init. ramdisk: %"PRIpaddr"->%"PRIpaddr,
                mpt_alloc, mpt_alloc + initrd_len);
     }
-    printk("\nVIRTUAL MEMORY ARRANGEMENT:\n"
-           " Loaded kernel: %p->%p\n"
-           " Init. ramdisk: %p->%p\n"
-           " Phys-Mach map: %p->%p\n"
-           " Start info:    %p->%p\n"
-           " Xenstore ring: %p->%p\n"
-           " Console ring:  %p->%p\n"
-           " Page tables:   %p->%p\n"
-           " Boot stack:    %p->%p\n"
-           " TOTAL:         %p->%p\n",
-           _p(vkern_start), _p(vkern_end),
-           _p(vinitrd_start), _p(vinitrd_end),
-           _p(vphysmap_start), _p(vphysmap_end),
-           _p(vstartinfo_start), _p(vstartinfo_end),
-           _p(vxenstore_start), _p(vxenstore_end),
-           _p(vconsole_start), _p(vconsole_end),
-           _p(vpt_start), _p(vpt_end),
-           _p(vstack_start), _p(vstack_end),
-           _p(v_start), _p(v_end));
+
+    printk("\nVIRTUAL MEMORY ARRANGEMENT:\n");
+    printk(" Loaded kernel: %p->%p\n", _p(vkern_start), _p(vkern_end));
+    if ( vinitrd_end > vinitrd_start )
+        printk(" Init. ramdisk: %p->%p\n", _p(vinitrd_start), _p(vinitrd_end));
+    printk(" Phys-Mach map: %p->%p\n", _p(vphysmap_start), _p(vphysmap_end));
+    printk(" Start info:    %p->%p\n", _p(vstartinfo_start), _p(vstartinfo_end));
+    if ( pv_shim )
+    {
+        printk(" Xenstore ring: %p->%p\n", _p(vxenstore_start), _p(vxenstore_end));
+        printk(" Console ring:  %p->%p\n", _p(vconsole_start), _p(vconsole_end));
+    }
+    printk(" Page tables:   %p->%p\n", _p(vpt_start), _p(vpt_end));
+    printk(" Boot stack:    %p->%p\n", _p(vstack_start), _p(vstack_end));
+    printk(" TOTAL:         %p->%p\n", _p(v_start), _p(v_end));
     printk(" ENTRY ADDRESS: %p\n", _p(parms.virt_entry));
 
     process_pending_softirqs();


