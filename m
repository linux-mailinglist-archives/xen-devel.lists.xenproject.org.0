Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 79F825EC5B7
	for <lists+xen-devel@lfdr.de>; Tue, 27 Sep 2022 16:15:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.412642.656025 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1odBMp-0000vD-R6; Tue, 27 Sep 2022 14:15:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 412642.656025; Tue, 27 Sep 2022 14:15:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1odBMp-0000ri-O7; Tue, 27 Sep 2022 14:15:23 +0000
Received: by outflank-mailman (input) for mailman id 412642;
 Tue, 27 Sep 2022 14:15:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Kd8q=Z6=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1odBMo-0007b7-Px
 for xen-devel@lists.xenproject.org; Tue, 27 Sep 2022 14:15:22 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr130079.outbound.protection.outlook.com [40.107.13.79])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d2127ee6-3e6e-11ed-9374-c1cf23e5d27e;
 Tue, 27 Sep 2022 16:15:21 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by GV1PR04MB9515.eurprd04.prod.outlook.com (2603:10a6:150:24::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.25; Tue, 27 Sep
 2022 14:15:20 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::358f:58dc:c0c2:1155]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::358f:58dc:c0c2:1155%7]) with mapi id 15.20.5654.026; Tue, 27 Sep 2022
 14:15:20 +0000
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
X-Inumbo-ID: d2127ee6-3e6e-11ed-9374-c1cf23e5d27e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SFAuDTNHCAU4kpA7oHUtk1zFyevbiUupXqAvXxK5EZSnw/JFe+7Teqvl+lIfEfa7cdghXrlAqkv8lpHbSam+kcTUfB+rQuyAHy5rlv9Fwr2fRXSDeW22PF5einMfvsZvPJM3XwcEHxDLH6tfskn3U9rBDtYSyygRH/sBpdYjxG0OmWPYFALc4K7JKy/r8LWM7S6xVekHJD1Y/sAMkgq4ur3D8J0r7je1YXMl740V3/3NoFxLYbffzx9jOirGKXaU0X7IWVsLY4CvqXh2KrwGGbMQvICBGqO/YgSN10nA0b3gWt5xos5n9j4s8Ykc6Aqux7O8rvryIrq9EozRw3HXfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RTLi2iGdZYIlnjw1ZxuuWrnZlomFDGrRKcaedNt44lI=;
 b=dglA1ohTX+vXfgSXETHXWfr+BvpuRXAUE1p7umDZ5XFp4AHWrSRGoPLF6DOWGyp7XUss1sb8h9ubISULbt2wZqaDYvlQfbUNz10Iy/b9N1e1GMrs4m4DeAzXq3wIlOfVSwndNH2oX/wVG32VjqUBlOrI9hmGPSXiviZ2QKeTkezIGaVV3+NWR2ZvAvgp5necV8RilRnNcZCbH70IlDlL3F/1TYuJE6CW7u6rlPxRwCJl+8Yxsds8jp6B4f25cR5SznH+AhkkVPwipE3AkPcb1AVx5KcQhMguvgBptGgvr+7lJdhXG5lAhxBaTmj/wesP/GnX6CQUFxLz3flSekhK2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RTLi2iGdZYIlnjw1ZxuuWrnZlomFDGrRKcaedNt44lI=;
 b=XynfCbrbzZPt5OVXF98i1Xz3bMxFR9GDUjW+R9zRQZj8BYtw5+AaKrSG4ZHHKKynRwmuVB4vdV9ebyEv+krxBaAeVfsp+54ek030msV/dAHbQgiapzVOtm+7+31os6eNi7CYFdf5ZJEAX4Jo4H3yh/EZ/VUWJfsElu9aPLRHjDmIdyAtP8BsNh27juSCcCZtTbbNQHxTlRRyTSSdIcu0MMbDvNzItU3hS2FGfB38PGl763HgejhcYftpa/ulMFrG4XlBqWf7Szvy3a0KxSk0p2g3VMyk0p3hdn23i/omUPNBhntpARKfzfmSuYNt2+OMKkVQDvRI2PInCX72pRqalg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <87c5e6be-5ad8-fe2f-d729-4f9904a4a027@suse.com>
Date: Tue, 27 Sep 2022 16:15:19 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86/NUMA: correct memnode_shift calculation for single node
 system
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0041.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:48::6) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|GV1PR04MB9515:EE_
X-MS-Office365-Filtering-Correlation-Id: e54f7ba8-e4ed-45fc-916e-08daa092b5e4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	OuWF8QXhwc50lcVWfgudKAHuS9flmQqehBJ1RTCSmfdk7rsaAc7Ko073Qg/j3uW/Xd75nNR1XcKDJMcLdoqys9c7fcAJFCNUK/SuwnxIF4oceeRixscftTPIT+BlIUMQPXhD8jbTr3YVltaUXukQTp4C237aCVqegMBku05pxxvkPZhZdzfFr+R2Fn64iJzMMgk0qpddpHN7f3eqUNM4f6vGBM+2ZhkbECRUOKKcgatpdlJ52vFegvB2hN6jfI1Y3PkxjxJhMuVZmhfhYZe/eU7qiMkItmQXvZopb/EqrwWKwltMt0J20JIs3vk6dTLUv/1kC2tHLFsDUlOb1PVIUgwYjuaXCJlHtoKoqE42A2JP1y9/r+hpBwmghWokBWO1JFGhw4rSjpC0xO++W960ZaXOGBttwgHRD2vrfF9T13v6nGziDRhix6FnAkMtx6bPvuOOOI5gh9TvIjTG9F+PYMOl+iuPARyHy9ylmRoioUmZMBGeoRI08RhbfLi/9KITFoM8Ps8GDFZ/0Vcr+EBpd/1JgcDOka5SZW0LKGrcOqJZNQeJBzwb/huR9Zjf4xr2m5/r1kfuprzl7pYM+2kCGJBV0hL/MCSEkl10iBhWaTe2RCdydRBgRAeXtxd395Gdw4S/dNS7gvnAc8BgCNzQZvtOEXCzy+//tSIP8jhsXeyygChAt+nNIFp6VR1u7vgCYUsT525t8lu0RlHX82hKZVK7ePnXh1myQssQLSm2sSdXdTjiGyLin9ijanoZmdwuYKyc48Z2f4YUH0eIo8XF2bwTwDBMEWtreofoy3ErL28=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(346002)(396003)(376002)(39860400002)(366004)(136003)(451199015)(26005)(6512007)(5660300002)(41300700001)(8936002)(38100700002)(83380400001)(2616005)(36756003)(186003)(6506007)(2906002)(54906003)(6916009)(31686004)(478600001)(86362001)(31696002)(66946007)(66556008)(4326008)(316002)(6486002)(66476007)(8676002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UXNOeW9NbklxYjR3cGlwVHRNMDY4VVI4TFpJRStkdklVTzhCNTZHSEl6c1Ru?=
 =?utf-8?B?VmpndDhlaFFUVk5uRlhEbFllUzJBUG51MXpnOGdrSjBDQlo2YjRVSTFoRG16?=
 =?utf-8?B?c0M4ZC90dVJtdW52MXN0UE5nQytkWW1JK01Pd1FJczBVTGZpQnp6NVNnZ3lV?=
 =?utf-8?B?UnpvT3BuWnljMURUQ0NhRHZSL0NWVFlxdlZiZHpOWXlhRk84VnFGaGN3TmRU?=
 =?utf-8?B?MGpPM3N4cXZHaUVVVXdJVVV0M0NTNWtYTGRQMXhxR0dZQ2RLdWIxVTZCZlRJ?=
 =?utf-8?B?UGRUKzVuSmQ1WGl0Q0hVOXlKUDRMOFd1SzBQY3dhVmF4SG9iWUdSNmJLRzhH?=
 =?utf-8?B?LzBJTlJodm9DY2I1STZvN3ZnekFwbWkyTXozVDRHcEJnQWJEMWFWOFJ3RUg2?=
 =?utf-8?B?WXNOYTZCaHB0SEp2WDJYaGtMb3J5VUNlNG1vaXRzSmF3QVo5TVdKeUlObklE?=
 =?utf-8?B?ZVZXTy9DaXhlcEJ2TitsaFpaYlNIR1cwbFB1ck5CYU1jRnJZY3YwSHdCNHNR?=
 =?utf-8?B?ZkFZOHV4bExxeG1lWHFOS2FmbmhTMWxJREJ2NnVleDNlK1lOOTRoeUQ0S0ZU?=
 =?utf-8?B?akN3QnBlRDh0VXdMai9XVVo0c3BneG1teXE2YnpkcDZ5WHBOV0xKdUVkaU5L?=
 =?utf-8?B?M2xydlNDZ1lZenNhU0c3VFNINndXYXBhRlNRK1krWFlxT2MwenM0S1NLaXhO?=
 =?utf-8?B?WXZaL2VlK1NDWXBDTXBiNlRNNTBMT01aSlpaalJEMjZIMlRlbVdoYy82a1k1?=
 =?utf-8?B?cE8yZ1ZhamFwQVFzNS9pWmhOMWZEQzV2NGlPckxrVVVkUVlRUjN1R2pPQVZz?=
 =?utf-8?B?Y2RjS0dNWU5wNDV0QzRTQmdxNjVnSXNNT1JMa3poUHZ6VHF0V2xpRTdGdlFI?=
 =?utf-8?B?eHBzZWh3WmhOY3lFTVF0NlJKM0I4WVcyWE1qS0hETnVYblJYNEdFMHU5Vk1H?=
 =?utf-8?B?bmpZWHJ5b1VwRnZiZXlYSzZtcTB4b3V0Z3c5ZzVRU1V6V01jWFBKS213OWJW?=
 =?utf-8?B?d0p6THVSYk1MT0I4QzZ4RzZBcnp3OFhnMU44RVdDVGZJd3FoR3RzdUhZa21t?=
 =?utf-8?B?NHpiU3lGTUhpWS9XYVJaZzNSYVUwb0RyTjl5UTVpY2ZuTnhWeUk3bEZaN21y?=
 =?utf-8?B?dTI5M3V0cEtqc0x5VHZoMHhXRHBFTTJzSXFQeGp0aU1LZ1ExbzluK2RoL2xD?=
 =?utf-8?B?N1ZIV2VGWFhsWjJwQ2FGUXhlUnpGcis1N3JESEFIYWtzWFRCVTJaRHRIWlpH?=
 =?utf-8?B?TVNwb2VaRHdaKzA5dUNtM3F2bGxIWnRZSHY2UjhuK3NtSTVJRWRMRnFIS3ZP?=
 =?utf-8?B?elVUVVdFUEZoaDE4d242YVhlbUcraEtGUmlJeGQyYUxiWGJ0WXcxZHMzQnRy?=
 =?utf-8?B?RGMyZlB6aUR2NjBuelpoTnRMQ3JnUkJZMmtlcTA5a2tNNTBOcG1jaWpvYnFm?=
 =?utf-8?B?TUlZeERsL1BRczI4YVVCbElqS2J6VnAzWmxKOWVrUStzbmF4M0FhRDRlSTVm?=
 =?utf-8?B?bldiZzBMRGViMnVQWkF6WmdQSjR1SGg4OVVYbjd3ckpxUE43bDlaRHFVQ0No?=
 =?utf-8?B?RzV4Wm9IaXh2VWlrcmdLTC9FUE1YYXVyZVNlMW9UWEJ6Y2FBN2VrRWFuNVpS?=
 =?utf-8?B?YlFoMEJadVE1UnFUN3F3Ym1ZVWh5VHRORlduMlAzTGE1cElHYk1VUHh3YkRa?=
 =?utf-8?B?TnBJUkgwTUtGOE9uamducGxxNUNiMWh3N3BDbVI3VmZJVjBhNnlqZjBZVjVN?=
 =?utf-8?B?eVdNL2R1UTJmUnlYK0JBeGxOK1h5SEVmM1B2R3RDYXhyYzdiUmZYZTNIRWMz?=
 =?utf-8?B?c3dlbVpZZzhYYmtUY3Bhb0J6SnVqdlRnUjZpTElSTmdCbTJMVU5Vcks2Z1NT?=
 =?utf-8?B?aXMxNEZTTU8vcHo3cTZpbStNT3Bva0ozeGE3c25XaUsxa2dVUmhUN2JTbm5D?=
 =?utf-8?B?RXIzL25JeHFjcEtwTm96QS91Wm1Ua2pBY0lwbzZibTZEczFHS2YzK0pQWW1j?=
 =?utf-8?B?OWRocWVYMWZRNHF4VTVrMkVKS3FpRHdwdWNkeThUOHhVenNXNTNGcmF2aHJv?=
 =?utf-8?B?MGF2dnl0TnJnQTVVSnlPMDJma1ZlVE9HQ1BJU2ZqSFhlME5tWWdhd0hNdE5I?=
 =?utf-8?Q?XZ35YCGDBSgD80UcL03pNl6Wv?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e54f7ba8-e4ed-45fc-916e-08daa092b5e4
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2022 14:15:20.5390
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RiZ879+ML0SSRcZ5OrQDhtvOdu3+WtFKmdbMn9RuKWCzU7vGLvROaQXcFqmdlz2KcRDDSRrHqow/Escel881lg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB9515

SRAT may describe even a single node system (including such with
multiple nodes, but only one having any memory) using multiple ranges.
Hence simply counting the number of ranges (note that function
parameters are mis-named) is not an indication of the number of nodes in
use. Since we only care about knowing whether we're on a single node
system, accounting for this is easy: Increment the local variable only
when adjacent ranges are for different nodes. That way the count may
still end up larger than the number of nodes in use, but it won't be
larger than 1 when only a single node has any memory.

To compensate populate_memnodemap() now needs to be prepared to find
the correct node ID already in place for a range. (This could of course
also happen when there's more than one node with memory, while at least
one node has multiple adjacent ranges, provided extract_lsb_from_nodes()
would also know to recognize this case.)

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
On my Skylake system this changes memnodemapsize from 17 to 1 (and the
shift from 20 to 63).

--- a/xen/arch/x86/numa.c
+++ b/xen/arch/x86/numa.c
@@ -78,7 +78,8 @@ static int __init populate_memnodemap(co
         if ( (epdx >> shift) >= memnodemapsize )
             return 0;
         do {
-            if ( memnodemap[spdx >> shift] != NUMA_NO_NODE )
+            if ( memnodemap[spdx >> shift] != NUMA_NO_NODE &&
+                 (!nodeids || memnodemap[spdx >> shift] != nodeids[i]) )
                 return -1;
 
             if ( !nodeids )
@@ -114,7 +115,7 @@ static int __init allocate_cachealigned_
  * maximum possible shift.
  */
 static int __init extract_lsb_from_nodes(const struct node *nodes,
-                                         int numnodes)
+                                         int numnodes, const nodeid_t *nodeids)
 {
     int i, nodes_used = 0;
     unsigned long spdx, epdx;
@@ -127,7 +128,7 @@ static int __init extract_lsb_from_nodes
         if ( spdx >= epdx )
             continue;
         bitfield |= spdx;
-        nodes_used++;
+        nodes_used += i == 0 || !nodeids || nodeids[i - 1] != nodeids[i];
         if ( epdx > memtop )
             memtop = epdx;
     }
@@ -144,7 +145,7 @@ int __init compute_hash_shift(struct nod
 {
     int shift;
 
-    shift = extract_lsb_from_nodes(nodes, numnodes);
+    shift = extract_lsb_from_nodes(nodes, numnodes, nodeids);
     if ( memnodemapsize <= ARRAY_SIZE(_memnodemap) )
         memnodemap = _memnodemap;
     else if ( allocate_cachealigned_memnodemap() )

