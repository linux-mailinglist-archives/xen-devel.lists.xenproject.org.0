Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E19A558FAEF
	for <lists+xen-devel@lfdr.de>; Thu, 11 Aug 2022 12:51:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.384419.619794 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oM5mq-0006i5-Rq; Thu, 11 Aug 2022 10:51:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 384419.619794; Thu, 11 Aug 2022 10:51:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oM5mq-0006fp-OR; Thu, 11 Aug 2022 10:51:36 +0000
Received: by outflank-mailman (input) for mailman id 384419;
 Thu, 11 Aug 2022 10:51:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WeOc=YP=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oM5mp-0006fh-9K
 for xen-devel@lists.xenproject.org; Thu, 11 Aug 2022 10:51:35 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60054.outbound.protection.outlook.com [40.107.6.54])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 90b35409-1963-11ed-924f-1f966e50362f;
 Thu, 11 Aug 2022 12:51:34 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM0PR0402MB3473.eurprd04.prod.outlook.com (2603:10a6:208:1b::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.24; Thu, 11 Aug
 2022 10:51:32 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad%4]) with mapi id 15.20.5525.010; Thu, 11 Aug 2022
 10:51:32 +0000
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
X-Inumbo-ID: 90b35409-1963-11ed-924f-1f966e50362f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JUTiU/4yF3eOiUwk5uqp5iM68a+BfYwxvTUtNKOBuWX8hXF23Lu3+P0TehvXqj+RE+AI/8UQJXgkgN+Lz6FqNalxRXPCVPIa/k3oSOppGrFBEgPA4aXUSaOil4iCBvU3q2F4hdzOe3c4LrZZBUv0yuEVDsfMTe14v8Um+sodKgGEkhjQwnLQZA8D6PVhxbczy62EVw4cgGEtX34T1YKIZ3TtLBvh450Z0K2tt6WhJxehzU3dB46HDw4XjIVGAlPk6KXVdtSvw2tiHWL1cjTsgW3zZhuNKXZX9kZaG78+Bqum49adfXIDXl3US8/45JcCB7uKyM40ZFeZVX68p1vRGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ROeaBlVhWUfxYWHNj4EnOD1wrL9+c+7pgHiRTazbgrg=;
 b=jp5FTLb3wOuNHXs/3SbsXcclq7evyYHXYoApHTpBz0A8McDqJSz92HsgnN+KdMwUq7kNd9dgVdxgYufj5UdNzjtF7QkOTPuYOjoMo9TzTYnNSQVl1EvN5Z/8bDbSlq5X7ZiK20OYhDK0h4bJWc5dYHVhOkRyRgBGhCUWT3079hZjhv89aQNlOMFBrs4+kZpb31fgmiH5nfnQVweaPe64NiOuYl/ygRt6I5qe9x5R0zMdxWQhwFdoswkpxnCk3TZzKp6+ZWkGN0TA/wTBNHs88T8siNOXQS9Wd+jaJ8ISV7o3OJZhI7VLOvd8tXzMBy0eTD3LTFESNFRUhh0aYbn9RA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ROeaBlVhWUfxYWHNj4EnOD1wrL9+c+7pgHiRTazbgrg=;
 b=zZqFvmSLLxS8p6Ci4igICLaM8VoXSBDeE9AcH+eX6ndT+tdOQSm/mng+jMjLcpyTCTD652SMAcBxvUDqvguMuPkr8adOTUbO45gZ4eP3XS4Vvq5O31Jyf6vp2QnkjSBzV0ulmaj/pThvEiYXQkNfVsueTxP8bYfXM0BJjx3he5VgJN0UO12gFHEgH/otaUV5gV6z6ios/Chy+syGB7rO9V0a8mgNkMg3WoAewG7tyqBOq8INo7ZcMAvlMWbW+2lbf4H6sJc/5q6OBFWQXCX/xvH2c8bpnyEAh+eTYrxjX9ZOgV4q5lBmYOaQgT4TYBObG3wVNQl/Pn2pcokBLCG7uw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <ad2d9405-9712-79bd-16d7-666ce79bcb3c@suse.com>
Date: Thu, 11 Aug 2022 12:51:30 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: [PATCH v2 1/3] PCI: simplify (and thus correct)
 pci_get_pdev{,_by_domain}()
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Paul Durrant <paul@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Rahul Singh <Rahul.Singh@arm.com>
References: <5379b4bb-76c9-d7be-4bd7-2f75dde470a8@suse.com>
In-Reply-To: <5379b4bb-76c9-d7be-4bd7-2f75dde470a8@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0113.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a8::13) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8830853e-4c08-4e85-89e3-08da7b8773d9
X-MS-TrafficTypeDiagnostic: AM0PR0402MB3473:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	biinijqGYPpOxNbZuVSG24GHRGZLEJj1NCzwnFaBzLsd3d4KrY36sfRki8iPdvpX/SYv+3R3vLVJ6ts+3DW0bXYOW+CiraE5cOSNnLbwJsmcm33uNIlFKwdL4zs2lFTA2ZX4XP/H+rFT9KEji8NJcVhqCycNEwSQu6VbowEF01cYeEzl6wpJ2cJy7GIxftg5aF22/9Lvu9y0+kWDQ1s5Vyw7BXfTq4NWnENq8N15aQjV4L86E4ASFNIU0D3qj3HTE+As1EWLJnWxDqfczCm1vCsJ1s2oZzIKpm+g2KqZyz5K77t6dnDfONsCufZSCE44JNKCtKRxyqvcpN2UV1ff14EcYIJxo1TaNTsx0fKA6um8noSbtge3jSETqB1wPn83DXUg8/VwkNCNOD7Mf609GkQWBhyX9l1sWkfsK1fDQIF0qYtBWa2xoafvM8RG/dsIafdbcjzmrVEiGiSLlWtV2TqZfhZfBSxAnv3g91ZmohEGUr111SieOlR6BMtww1x+qdyyLQM/EJwXwRoHR8sYQeuotxdyI0H5LPwx7WSrFQFv4eqwvx8D0zOIIW5U2bNieskkoZSzYDfZ4cWGPSVBXmMASeuZWSyCXrloHCC4+ZpZR6oWAuqLV/qYbsnLbivUcHXmM4V4wubqQOuf2dgzoMzgkIJY3u3y72hpPpg6bhsuwz287/jImo5VjMtxxDP6XbKmAiImaIVmZRD5w48WBO8Ft0SDBaAXClNmPx2HyUdJZFqHkgNcf8qEBzLZxd7gKBzPIsmnXkFSZXRL+WsxLNLMJuG+y5xhTwqBuelm97M9NfbGGbwx8yRMRI4K9bP9zwQHCStaDnZpqI8k9QqXEQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(366004)(396003)(346002)(376002)(39860400002)(136003)(6506007)(2616005)(8936002)(26005)(6512007)(5660300002)(186003)(478600001)(36756003)(31686004)(6486002)(41300700001)(83380400001)(38100700002)(31696002)(86362001)(316002)(2906002)(54906003)(4326008)(8676002)(66556008)(66476007)(6916009)(66946007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RVZpZVlMbDlnd20wVFI5T2dyMmlvdjA3dDl4d2ZQb3hJSG9nSFhsdXo4ZHBu?=
 =?utf-8?B?N09Odm02enFLekdZUTU5SW54Rm9SMU9ZVENlaVcvMFp0RXVsd0JIUTNHcVE3?=
 =?utf-8?B?ZmtBWG0wT25hSGtVdTVzQ3QzNDZVUzlxbHBkV0VkT1dNaHpyTEp3Sm9mOG5I?=
 =?utf-8?B?OFFLRXEyYTlieS9UQWMyV1J0YU03Qy9TNGlDS0E1L3pqblFNbllxT3RtcGI4?=
 =?utf-8?B?YXVDWDZiNCtZcWlCRjJwTDBBVmp4MHFuM0V5SFo2bTczWjhWZEtmZUNRU3E0?=
 =?utf-8?B?S29QRnpNelp3eGFONDlkN0kyVzNmMk1oMWY1S1J0TS9uSWJzMmk5T29ka1k4?=
 =?utf-8?B?RzZjVlphQlBINjhVeXI2MUVxSXlqVkFTN1k1N3V0bXlJcEUxZ3F4dEsydTRk?=
 =?utf-8?B?dG41L3FYS1B0clZUM3A2Z0xiRzBFWit5WTRWckkwMkwwVUs0RE10MGlHVFhG?=
 =?utf-8?B?aXhMelVkWEw0c0pmY3diQ0FqUGpoVUw4NEVYQ0dTaUhNb3ZZd2hUais4TWF6?=
 =?utf-8?B?U05jdm05cjFNc3Bvbi81SUNPMnJlUWFybnBQeDVuL3M5cUM0bVZxRDJ0bnFX?=
 =?utf-8?B?bDNjRU1LTW93K2x5QUMzRjViUVZhckx0QUFrdlBUaUlxZ2ZnM0dWdkZoazlH?=
 =?utf-8?B?TFRadWdwcHRkOGd3RzRBbGZsd0lsb3lmUTQ1Vm1vcm1HWmg3T0RLazVHZWdG?=
 =?utf-8?B?TG1OTk1rOS9YZGRWTURYelo3K0ZtT3FsU1Eva3ppOEI4UjNPUUVmMkU0cHFC?=
 =?utf-8?B?cUU5bUthQ1NUY2JwdTYxSzBKcXNwTTU1SFFmbHlCWCtHZTk4T0N1Rkk2SkRM?=
 =?utf-8?B?NkRqY1BUcERpWFBrRFcwaWJNYVNMc0o3WERoa01NRFNsSWEySExIVVU0c1Bs?=
 =?utf-8?B?bzJtaVo4eGdjWGRnWlFzS09STHYycTdubVMwbUxhVHFFZzl5cnFMOEthOE5x?=
 =?utf-8?B?ZE56RmFtdHRhRVdTM1BHWlZldGl5Zk1tWHBIOFRDSWJEMmxPT2J5WVV4OFBp?=
 =?utf-8?B?WUFyU3VxS3doZ3BQRGNIaDlHKzRpZDh3eGhDVURmSU1LS0RjVXhSQ1NIR05M?=
 =?utf-8?B?UXFmQkxtMm9iSDFhcmJ6bFVZMVB6VGszbTRSU1hITHJLSFBmZm9mUTJPYmlP?=
 =?utf-8?B?bWVQL1NoTk8yUXFKWmFFam43eGZsZUFmT3J2eHduMWNwRm9pbmVUVlhkbWhq?=
 =?utf-8?B?L1dpVkl1VGZPL3F1cllvTVgwdVFacE9zM3lIOHFsZDVWRUc2ZnFOUktmZDFn?=
 =?utf-8?B?VkZXMXFOa2V2UmZvelZyMy9aeWJyNmV2T1Zoclh2d2JQVFBWSTMyVlNHL0tO?=
 =?utf-8?B?U20xSUg3Z2hoZm9YR1dGZ0xaeHR3MG8xeUdTYmdrRzFjbFN2OW5zd1k4M0Jq?=
 =?utf-8?B?czQybC9EUlZKQ1EydzJubmtuTkZvZnJuWUVEendXWnBwSzhUanBUUlRjSVhJ?=
 =?utf-8?B?VlNwTVJiVGxVbVBXbmovdDZ3cCt6UmFNbkpMQ0RmTVVWbWlOeExhS0x0eFcw?=
 =?utf-8?B?SjR4T29MZVJSdHBvLzkrQ3VyTVN3RnFCRlJZaHA2L0pCQlNkZnFKT3c4dVo5?=
 =?utf-8?B?N0M1RUdoUitmMGFNZko1SkdZbUNMOWt6a3ZabFhyc2hPLzRySTRrVUpKcHZs?=
 =?utf-8?B?TDZZc21HRTUvQnlrWXVrcjlwZzArTXZWYXljK3ZROUM3eFhoRTdWblJRQWo5?=
 =?utf-8?B?QzN3dmE2NldnT3c0NXBBS2hTRGRBUE56WE5Ub2tJZXRzdjFEUFZFOVNSVTdB?=
 =?utf-8?B?RWs0eDlmVk5PbjlUdWkvQ2MrcjVxME5pYkdFOUpxK29aYnNNSkdhMTdLU1VQ?=
 =?utf-8?B?UE11QWtFbXVNZHAyZFU1Rm8va3IrYVNVNmNDRjREd09qZ2MwaFNmWkozK2ZF?=
 =?utf-8?B?enIxQUpGd0g1SjZXOGZrRzVTSitndi9JQVplV2ZVTFgvYk1renZ6SnpTQUVm?=
 =?utf-8?B?b09PTnJldDZabEY3YzBlSjRLUjhibDhDN0hTaDRSakxnL1Q1am5NTk1Balh0?=
 =?utf-8?B?bDRFTjlLSG1hODFkK2s1TnZRM0t2R09JcFg1TmZqNmdaQmZ5Sk1JMkpKUHM2?=
 =?utf-8?B?N2lCaDZtN3c2UTN5Yy9TbkgwQjV3b3dLT2I5TVhHc1JxTUFnZXNjU3pvWkpY?=
 =?utf-8?Q?fZgtHvRgSjR+XKIfbPGhe2tG4?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8830853e-4c08-4e85-89e3-08da7b8773d9
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2022 10:51:32.1878
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F+YKKK2Gmpnl4lpt/bHPO2FdcT/LXiKeS9LS96y7mU1q0N4ICTr6WIhXfbdU144hi0ELCsntDeO7xeAA5wNI3g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR0402MB3473

The last "wildcard" use of either function went away with f591755823a7
("IOMMU/PCI: don't let domain cleanup continue when device de-assignment
failed"). Don't allow them to be called this way anymore. Besides
simplifying the code this also fixes two bugs:

1) When seg != -1, the outer loops should have been terminated after the
   first iteration, or else a device with the same BDF but on another
   segment could be found / returned.

Reported-by: Rahul Singh <rahul.singh@arm.com>

2) When seg == -1 calling get_pseg() is bogus. The function (taking a
   u16) would look for segment 0xffff, which might exist. If it exists,
   we might then find / return a wrong device.

In pci_get_pdev_by_domain() also switch from using the per-segment list
to using the per-domain one, with the exception of the hardware domain
(see the code comment there).

While there also constify "pseg" and drop "pdev"'s already previously
unnecessary initializer.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v2: Full rework, with even the title changed.

--- a/xen/drivers/passthrough/pci.c
+++ b/xen/drivers/passthrough/pci.c
@@ -576,30 +576,19 @@ int __init pci_ro_device(int seg, int bu
     return 0;
 }
 
-struct pci_dev *pci_get_pdev(int seg, int bus, int devfn)
+struct pci_dev *pci_get_pdev(uint16_t seg, uint8_t bus, uint8_t devfn)
 {
-    struct pci_seg *pseg = get_pseg(seg);
-    struct pci_dev *pdev = NULL;
+    const struct pci_seg *pseg = get_pseg(seg);
+    struct pci_dev *pdev;
 
     ASSERT(pcidevs_locked());
-    ASSERT(seg != -1 || bus == -1);
-    ASSERT(bus != -1 || devfn == -1);
 
     if ( !pseg )
-    {
-        if ( seg == -1 )
-            radix_tree_gang_lookup(&pci_segments, (void **)&pseg, 0, 1);
-        if ( !pseg )
-            return NULL;
-    }
+        return NULL;
 
-    do {
-        list_for_each_entry ( pdev, &pseg->alldevs_list, alldevs_list )
-            if ( (pdev->bus == bus || bus == -1) &&
-                 (pdev->devfn == devfn || devfn == -1) )
-                return pdev;
-    } while ( radix_tree_gang_lookup(&pci_segments, (void **)&pseg,
-                                     pseg->nr + 1, 1) );
+    list_for_each_entry ( pdev, &pseg->alldevs_list, alldevs_list )
+        if ( pdev->bus == bus && pdev->devfn == devfn )
+            return pdev;
 
     return NULL;
 }
@@ -625,31 +614,33 @@ struct pci_dev *pci_get_real_pdev(int se
     return pdev;
 }
 
-struct pci_dev *pci_get_pdev_by_domain(const struct domain *d, int seg,
-                                       int bus, int devfn)
+struct pci_dev *pci_get_pdev_by_domain(const struct domain *d, uint16_t seg,
+                                       uint8_t bus, uint8_t devfn)
 {
-    struct pci_seg *pseg = get_pseg(seg);
-    struct pci_dev *pdev = NULL;
-
-    ASSERT(seg != -1 || bus == -1);
-    ASSERT(bus != -1 || devfn == -1);
+    struct pci_dev *pdev;
 
-    if ( !pseg )
+    /*
+     * The hardware domain owns the majority of the devices in the system.
+     * When there are multiple segments, traversing the per-segment list is
+     * likely going to be faster, whereas for a single segment the difference
+     * shouldn't be that large.
+     */
+    if ( is_hardware_domain(d) )
     {
-        if ( seg == -1 )
-            radix_tree_gang_lookup(&pci_segments, (void **)&pseg, 0, 1);
+        const struct pci_seg *pseg = get_pseg(seg);
+
         if ( !pseg )
             return NULL;
-    }
 
-    do {
         list_for_each_entry ( pdev, &pseg->alldevs_list, alldevs_list )
-            if ( (pdev->bus == bus || bus == -1) &&
-                 (pdev->devfn == devfn || devfn == -1) &&
-                 (pdev->domain == d) )
+            if ( pdev->bus == bus && pdev->devfn == devfn &&
+                 pdev->domain == d )
+                return pdev;
+    }
+    else
+        list_for_each_entry ( pdev, &d->pdev_list, domain_list )
+            if ( pdev->bus == bus && pdev->devfn == devfn )
                 return pdev;
-    } while ( radix_tree_gang_lookup(&pci_segments, (void **)&pseg,
-                                     pseg->nr + 1, 1) );
 
     return NULL;
 }
--- a/xen/include/xen/pci.h
+++ b/xen/include/xen/pci.h
@@ -177,10 +177,10 @@ int pci_add_device(u16 seg, u8 bus, u8 d
 int pci_remove_device(u16 seg, u8 bus, u8 devfn);
 int pci_ro_device(int seg, int bus, int devfn);
 int pci_hide_device(unsigned int seg, unsigned int bus, unsigned int devfn);
-struct pci_dev *pci_get_pdev(int seg, int bus, int devfn);
+struct pci_dev *pci_get_pdev(uint16_t seg, uint8_t bus, uint8_t devfn);
 struct pci_dev *pci_get_real_pdev(int seg, int bus, int devfn);
-struct pci_dev *pci_get_pdev_by_domain(const struct domain *, int seg,
-                                       int bus, int devfn);
+struct pci_dev *pci_get_pdev_by_domain(const struct domain *, uint16_t seg,
+                                       uint8_t bus, uint8_t devfn);
 void pci_check_disable_device(u16 seg, u8 bus, u8 devfn);
 
 uint8_t pci_conf_read8(pci_sbdf_t sbdf, unsigned int reg);


