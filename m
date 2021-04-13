Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 721D435E0C5
	for <lists+xen-devel@lfdr.de>; Tue, 13 Apr 2021 16:02:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.109777.209567 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lWJci-0005Eg-EG; Tue, 13 Apr 2021 14:02:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 109777.209567; Tue, 13 Apr 2021 14:02:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lWJci-0005E8-AJ; Tue, 13 Apr 2021 14:02:36 +0000
Received: by outflank-mailman (input) for mailman id 109777;
 Tue, 13 Apr 2021 14:02:34 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=51M0=JK=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lWJcg-0005DI-Om
 for xen-devel@lists.xenproject.org; Tue, 13 Apr 2021 14:02:34 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 65ef5357-2709-4ae1-a310-e4e06467e70e;
 Tue, 13 Apr 2021 14:02:34 +0000 (UTC)
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
X-Inumbo-ID: 65ef5357-2709-4ae1-a310-e4e06467e70e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1618322553;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=6EB34yxtREKRpQgddSh15DRCHEJ1cQ8hc+zSM5cFzGo=;
  b=ep/PBnF/ttdYAjbyppsd1tzVkqIPg4GGJgbRgQ4yaWjSFg6fQ2Nz29ZV
   uz82ukvkRoGk2jKJvWH+38GGFt+rBhkW31ow0fOsOhVhAn8y7yveMGMPy
   9FdnOaz25TmcPjgGnOang6kxg994uVTRp2STTdBeUsAlwD2ouSh4KPOFi
   c=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: Sj/Xa0h65LTdNTab4d1DHs0sDv20l4Se/NuzOXOEUPv86hEb+/+HxMH9JU5lvU/TiR9FRg3NIq
 ArJRa34fNTxQDGBWBmG6AXmK11Uk+ZyJH3SCKJDNZFAT4/9tx+/x787SUDTSCM8McvLQMck6L8
 st6Uq2bsa12otf0vA6FXePoNU7kGHi+XSMQjEw/DiqxQ3ewnZzEM5+AKopFiweZcxX42hT129L
 yvxfyZ5qH3BhY/2uBrKt6h4lXYAedggDTeiQCoV8ox4CGE3t5l3FmTNY0I6FCXNK9LKp+/39Xr
 ZH4=
X-SBRS: 5.2
X-MesageID: 41483804
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:LH1h+aGQWsRdwelIpLqFMpHXdLJzesId70hD6mlYVQFVfsuEl8
 qngfQc0lvOhCwMXWw78OrsBICrR3TA+ZlppbQAJLvKZniChEKEDqFHqbHjzTrpBjHk+odmv5
 tIXqBiBLTLYmRSot395GCDfeoI5Pmi3OSWifzFz3FrJDsaCZ1IywtiEA6UHglXaWB9ZaYRL5
 aX6spZqzfIQx1+AviTPXUZQ/PF4+TCiZOOW3U7LiQ64wqDhy7A0s+YLzGk2H4lMg9n8PMZ3k
 Xu1yf44aiitP/T8G6n60bjq654tfGk5t9KBMmngtUYJDP2mm+TFflccozHhh8ZiqWC70srjc
 ntrn4bTrhOwkKURE6Zi1/M3BTtyzkn4XOK8y7mvVLT5fbXaRh/Lugpv/M8TjLpr3AOkfs57Y
 dwm0WejJZTBQOoplWE2/H4EytEu2DxnWAvioco/htieLpbUpB9h6oF8nhYFZ8RdRiKk7wPIa
 1VAMbQ6O0+SyL9U1np+m1mwNmbVn8uBBuxQk8bpsyP0zRN9UoJtncl+A==
X-IronPort-AV: E=Sophos;i="5.82,219,1613451600"; 
   d="scan'208";a="41483804"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=joEvALicDJ1p3S8vig9ZE65tnZQWRau/K/sqzSa/PSfs2X8bZbID+cgsA7JmnmBGuTXZWVyDmIzNO0iOCrEkAlTBU5zcFYrM1uOgo1IphCbcttEs9u4jdywXTTXv6i3TDAC1SDKIgQ55gllklStD8bltYuegYe+y5i560hoLEIEJ2fMWk/N3Eer2HNcC8EkJ/Ua+z2ZwZA0zTqQGFJq/7saRo7d0w0rpfHL9vUT+BGa0A7ktTYV0GC56Lmf7vR/CnzGF8d0fcRsizZrbERTBVDONa9CSttoL8cZFdqai+oq3lEoHks0ybULoh+npVU87tZkp+vURG9hR+RA0asMuqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+C8NC1XmcgG+hR7rhDwEzRtSVqk3ZTRRhzEbmJGLd68=;
 b=e8x7s+BD5l63z9wD4u/e6dU5iwqd+JTcJXbfwRlsBd8vpsoctt56hjyA/clY4v18IdXT9+a8+BBD+ethVwo/XHFKadtLvk+01CCNaHo7/PUT3xXgP7oe3BcUq/NaIKT4+fLxES+grOYOITm9NHSa5lMkPpV64Zh4t1wTBU4+P4OW9cWVBDO64JEryhZ0VLUmDukQp00nfQcFCTRBJdjuhq6hO9RaVuOPJJHgpB2Dfb1bYYuYaV2kMVXCg5PlW6JaHyJNxa/LGXa+TFubFEADrD/80TxHc5zhcwD7/o3kFfOgxm8B3oYkpamrx2USo/OQhp9hLm3c8MYBlYkaP5jZ8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+C8NC1XmcgG+hR7rhDwEzRtSVqk3ZTRRhzEbmJGLd68=;
 b=pcRnrc531tj1Jbw7PBgmrV7/ez477ezNYVjyKGNYOAegRqGJjaEGmVZMnCFPNs3RziCciAqR6LauDKJ8FYwuVBJj0649rYRP75daVlv3fhwf2WTJ6BZ8okN/FPvufXN2gHrP+Hksz4DSwapKeaZnUOD3xaCz0VjqKr6AKhouBYI=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Roger Pau Monne
	<roger.pau@citrix.com>, Ian Jackson <iwj@xenproject.org>, Wei Liu
	<wl@xen.org>
Subject: [PATCH v2 06/21] libs/guest: introduce helper to serialize a cpu policy
Date: Tue, 13 Apr 2021 16:01:24 +0200
Message-ID: <20210413140140.73690-7-roger.pau@citrix.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210413140140.73690-1-roger.pau@citrix.com>
References: <20210413140140.73690-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MR2P264CA0099.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:33::15) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 480a7cde-3a81-40d6-6add-08d8fe84c719
X-MS-TrafficTypeDiagnostic: DS7PR03MB5542:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DS7PR03MB554207A5DF0BF7F679BF31588F4F9@DS7PR03MB5542.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: reCXnJjfy3n9vvTSfczOqbg4xaZvu9ikC2veci6I5QGYvjZds11ijWnwh75PR8bvI8oef+jjDd6KwiI4ejQeAjePp2z9rGNHR/xc8C13BiBD+ZDjZ+Vf4LoM48se8ajwyPzH2iPo7Tv/zmOQ8kiveBh9wrOz80mC0v4pzOhQIimbr02sMFyVNm5pMhOWPzQs5TN8CuSR0H+Su5kAP7vseBjprLwRXC5+xMjJ4XuVrFNULx+z5F/YBE25WKbgHG/Q/YpS7vBzyCaSoc6hAFcOsQ56y+J546xGbBTrXMnKwgj4SBMFFJ9P65X1q2WZ4NrYihFdXY3t1v6oyk+7UeR9bLvekAxK0kd9ub2vXLhDw1qZoa1ffdpKwm/+2F9F8vAwf1Lzh/07Y8ptV6+53UlATwF/qndy7Yf3PG3xyx4/pW6UuF7xIGamE0xvcOVaTVhtoe0zuUI7XTrdnVLKmpcU3diG2IL3qFsakjbZS2TbpzLYs1EREkjJjYmWU9h4v0FUn2ErddJ0mBByuVfr775nBhVBx1RJCrX9KR7q4KBHffaDl9+pU2tRJAKOuQJKgOFIBAqPL1v+rc+/GFset5fHTy8hncx99Ts8LthnQ3NXnwI=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(396003)(366004)(39850400004)(346002)(376002)(2906002)(6916009)(6486002)(36756003)(66946007)(54906003)(83380400001)(1076003)(6666004)(5660300002)(66476007)(316002)(66556008)(8936002)(478600001)(186003)(2616005)(16526019)(86362001)(6496006)(26005)(38100700002)(8676002)(956004)(4326008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?WmFxc1hBV0luTG1mVDJRTXMyV2xtK282TEdDd3R1TUpTSHQzcUlLNlpxWWFK?=
 =?utf-8?B?U3RWSFdzaGhnUmV2Ri9RdVFXU05MQzBnVGI4R1A5NCtKR0pDZ1lKYWR0R3hK?=
 =?utf-8?B?aTAwa2lMdzRWOXNQY1VvbmdiM3p5SkN5dDNzemQxYVNrWG1QQWdPWTdZRnhs?=
 =?utf-8?B?NzZuRW90L05DaVBCVTVTSDVnVXlrVHh4NmNLWFdGMjd6ZE43SlpUeHVzK3Ur?=
 =?utf-8?B?bzhlS0NEYms4d0F1aVZmUEFQc080QWI0a2c2dUZTakNEeHR3czFaNDRmLzEx?=
 =?utf-8?B?Vlk2SG1EN1FuUi9yc1FRRXBPZmp0dmZ0ZlRQM3BuL0J1WVBEellqMWFaU0F6?=
 =?utf-8?B?OGRIY3pUMXJ4Q2pSY3hVQmhYcG44UVdhcy9LNjA2YUQwbXpBMG9NeERpU3Q0?=
 =?utf-8?B?dlA3bHRpVG5DUUdEL0JvMWdhMUJ2YWc1dFh3S2lGdlA4dFVuTGJ6YmFZZG84?=
 =?utf-8?B?M1NpY2JWY3RvdTVaemROQnpFdmpaTjM0TU9ZQWRFWmlQNWMxb3hNQkhTTUM5?=
 =?utf-8?B?bFVhKzU0UDBXbmtwbkJoYkNkRk9hb3JCOWhMSDYyK3U0NkZWdW5OQ1FGUE5G?=
 =?utf-8?B?MnErSW9vL0FaTGZuMko1aGdpWkpFS2VFZ0Q3dm55R1NwWHVpRGkvUTM4V0sy?=
 =?utf-8?B?QWp4RFdrd1FhdFRMcXFXZGlrcmd1SEpEOTd4N0o5ajIzZ25JUXFjRzB0SXdV?=
 =?utf-8?B?NDNXOXVWSGlzTTB3TjYyZ0hVcDAvQnhzMElsT2lwYnJqUUdKVmM1Vk9IY0VS?=
 =?utf-8?B?VlRwN2dOcExNaTYvNmtIWWhlc1hmVlV5Yk02NnVBUEpuZTRaSkwwNzBPWHI0?=
 =?utf-8?B?QUNJSmRXK05pNFNhY3FQekhTem84OEppZEJUMHQ2UFZvRTA2NjVxUWRmckpm?=
 =?utf-8?B?dVZ6SE5tTGxIdU1lbkxiOVFRbXlNSEJQS1RZRWo4RkgxWkRSejNFbHBIWk1M?=
 =?utf-8?B?Ui8rY0w1aWRjTDNPK2dFMDhvQldCamFHaXRGd3dMMXdqSnAyZlVkUFoyckx1?=
 =?utf-8?B?cjJuZTN1WldFZlZUa2gwSTRjM0ZzZzRNK0ZscnN2TTNKZDlYRW8xbVFlbmhF?=
 =?utf-8?B?aFcyc1QySDEwS1VNSGtPSXdzVU1tM3l4c0Vnc0d2VFR3RVorWndOMUR0VGRk?=
 =?utf-8?B?M0h6anV2K0Y0SXYvQmd3OXpkYXlQd2w0Vlk5UExpNDFEZ05kZm0xK3dzUEkr?=
 =?utf-8?B?SHV4cGd5SDR5MDZWYWhJVXoyOWxCVFF3bHNreVJvUDRUck53a1FDT1Ixdlo1?=
 =?utf-8?B?NVAxVUQ2RkRrREtqT1VMNXJITCtQbFZnUXhPK3dKdzFIWnBpWm1jblFscWRS?=
 =?utf-8?B?cEVuS1BjY3M2dWE2aDd0L2RDTXFVVzAvN215Z0RDeDlUL00xM0R6S0QzL3Rx?=
 =?utf-8?B?YUxNK1BQMjZjc09FUGdGaUNaUnBleWtaSTNjK2dBV0ZKblVxYlEvcnR1WVEr?=
 =?utf-8?B?QlQ1Qmp6MGsxbjQ5M29sSHo5Wng1MERJZnhBWEpZam5hTlNzZ05lUmtqcnBK?=
 =?utf-8?B?YmNINWhZaC9Qc0s0a0paUzdZY2lFNVVSaEgyb2E4c004OGZTOTZtYlJQazAz?=
 =?utf-8?B?UXVZWUdvTWdtUVBpaTE0NldtNnhXNVA0SzEzN0U0Y2s0elRtRkhXckxwb0hk?=
 =?utf-8?B?aituNlc3SFRsYXZQRGVSdmhZeUd6UTBUVFd5UnRVd29OS0krL2s3UDdSL0lZ?=
 =?utf-8?B?RXNrN01UOUtNZUt3VlcvOFZlOXl6d0pqanZudDQyS3cySXZIYWRraTQ2TTBR?=
 =?utf-8?Q?p5AfPE1Fgp6EIYkSVX1zjnaAYqfqIW9jWro6wNJ?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 480a7cde-3a81-40d6-6add-08d8fe84c719
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Apr 2021 14:02:30.4565
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r69qJRuwc4bRB7kPxMRibOxmsJjOlInj41lHBDKVeD15e6tsxwImr56PK8imNcH5x4tEo/cvWc/3cWDXlIssJA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR03MB5542
X-OriginatorOrg: citrix.com

Such helper allow converting a cpu policy into an array of
xen_cpuid_leaf_t and xen_msr_entry_t elements, which matches the
current interface of the CPUID/MSR functions. This is required in
order for the user to be able to parse the CPUID/MSR data.

No user of the interface introduced in this patch.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 tools/include/xenctrl.h         |  5 +++++
 tools/libs/guest/xg_cpuid_x86.c | 32 ++++++++++++++++++++++++++++++++
 2 files changed, 37 insertions(+)

diff --git a/tools/include/xenctrl.h b/tools/include/xenctrl.h
index 34d979d11da..a4827b1ae6a 100644
--- a/tools/include/xenctrl.h
+++ b/tools/include/xenctrl.h
@@ -2602,6 +2602,11 @@ int xc_cpu_policy_get_system(xc_interface *xch, unsigned int policy_idx,
 int xc_cpu_policy_get_domain(xc_interface *xch, uint32_t domid,
                              xc_cpu_policy_t policy);
 
+/* Manipulate a policy via architectural representations. */
+int xc_cpu_policy_serialise(xc_interface *xch, const xc_cpu_policy_t policy,
+                            xen_cpuid_leaf_t *leaves, uint32_t *nr_leaves,
+                            xen_msr_entry_t *msrs, uint32_t *nr_msrs);
+
 int xc_get_cpu_levelling_caps(xc_interface *xch, uint32_t *caps);
 int xc_get_cpu_featureset(xc_interface *xch, uint32_t index,
                           uint32_t *nr_features, uint32_t *featureset);
diff --git a/tools/libs/guest/xg_cpuid_x86.c b/tools/libs/guest/xg_cpuid_x86.c
index 1394e503f3d..918591a128c 100644
--- a/tools/libs/guest/xg_cpuid_x86.c
+++ b/tools/libs/guest/xg_cpuid_x86.c
@@ -757,3 +757,35 @@ int xc_cpu_policy_get_domain(xc_interface *xch, uint32_t domid,
 
     return rc;
 }
+
+int xc_cpu_policy_serialise(xc_interface *xch, const xc_cpu_policy_t p,
+                            xen_cpuid_leaf_t *leaves, uint32_t *nr_leaves,
+                            xen_msr_entry_t *msrs, uint32_t *nr_msrs)
+{
+    int rc;
+
+    if ( leaves )
+    {
+        rc = x86_cpuid_copy_to_buffer(&p->cpuid, leaves, nr_leaves);
+        if ( rc )
+        {
+            ERROR("Failed to serialize CPUID policy");
+            errno = -rc;
+            return -1;
+        }
+    }
+
+    if ( msrs )
+    {
+        rc = x86_msr_copy_to_buffer(&p->msr, msrs, nr_msrs);
+        if ( rc )
+        {
+            ERROR("Failed to serialize MSR policy");
+            errno = -rc;
+            return -1;
+        }
+    }
+
+    errno = 0;
+    return 0;
+}
-- 
2.30.1


