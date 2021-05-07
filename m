Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 635F0376445
	for <lists+xen-devel@lfdr.de>; Fri,  7 May 2021 13:07:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.123966.233977 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1leyKF-0004tf-JW; Fri, 07 May 2021 11:07:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 123966.233977; Fri, 07 May 2021 11:07:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1leyKF-0004ox-C0; Fri, 07 May 2021 11:07:19 +0000
Received: by outflank-mailman (input) for mailman id 123966;
 Fri, 07 May 2021 11:07:18 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4HO4=KC=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1leyKE-0004jI-1X
 for xen-devel@lists.xenproject.org; Fri, 07 May 2021 11:07:18 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3f452d81-4586-43ab-b104-aa97b66944c0;
 Fri, 07 May 2021 11:07:17 +0000 (UTC)
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
X-Inumbo-ID: 3f452d81-4586-43ab-b104-aa97b66944c0
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1620385636;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=DK5Oj288zwi/pAzruQfeshpv1Ya6qkXUi9NgpMqGtpg=;
  b=R7tY8x0G4c2mpGV0JrgGN5/sF/hFILVOrCqtoOwtMot4ZXzKjG6FVmLx
   j0agdiTrkrKmF0M3cJHIo6qHWpCePJGu/BX7zEx0oNQaLpN2ghB7otl+E
   4nPGhSBRpU7TFpHXFj4267QIiXQku7hpJaiAifqkA8T5tlgTvqyzxAqWq
   w=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: wBLs1wbGBlphFIMXsJra93bid4GkQexU8WJqk2kgcZC+JcxMxYIUsQW5WyMab5z+kY4Bm/1F6P
 AIxsXPswh9K1ClVbsKYj+z6sy4aQWSMIi1WEHNJI0JRvEgOdA06qvhUYt42l11lur6Wi/kIcBS
 y65/M3lZKyEU/TfgcEp5dwEouxFAYQunc+3Sht4qCMTfuZy6YRMMaqh9634ye1enSfMCOIpjjK
 i7w/faXl7Nf6s+sedB19DtbS4eSOBZ89vJ8IWRtYJOoekh9boOB1yY12AkZ56Si/AY05zqHtGp
 ut0=
X-SBRS: 5.1
X-MesageID: 43304421
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:/50QaKs7KHJAbbCB6XXX9Z807skCRIMji2hC6mlwRA09TyXGra
 2TdaUgvyMc1gx7ZJh5o6H5BEDyewKmyXcV2/hbAV7GZmXbUQSTXeVfBOfZogEIXheOj9K1tp
 0QOZSWaueAamSS5PySiGbXLz9j+qjgzEnCv5a8854Zd3AOV0gW1XYaNu/0KC1LbTgDIaB8OI
 uX58JBqTblU28QdN6HCn4MWPWGj8HXlbr9CCR2SyIP2U2rt3eF+bT6Gx+X0lM1SDVU24ov9m
 DDjkjQ+rijifem0RXRvlWjoKi+2eGRhOerNvb8yvT9GQ+cyTpAo74RGYFqiQpF4d1HLmxa1e
 Uk7S1Qe/iboEmhBF1d6SGdpjUIlgxepkMKgGXo/UfLsIj3Qik3BNFGgp8cehzF61A4tNU5y6
 5T2XmF3qAney8osR6Nk+QgbSsa4XZcYEBS4tL7hEYvGLf2qIUh2LD32XklWKvoMBiKmbzPId
 Mefv00vswmD29yR0qpzlWH7ubcIUgOIg==
X-IronPort-AV: E=Sophos;i="5.82,280,1613451600"; 
   d="scan'208";a="43304421"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SwW2R73A/0+ioVdnKEkHQHsR7vMSjrqBtJ2MkI6uowitw7PkCupMOUGHkwBa8SlzfIxB1dawC9P3Rn/WnwdP3+dF1wdEWXT9vrP5JDuE1JTxvxeMF5w5vEBKKcB8WHBJQvuv4HW1cgbyAVaiQsEkDTWpaUXuCFYOQDY5GZjFcubOn5iP/qoYQvagpH4BRGvsByQ+WIggs+KgipPiZiJy9/i2psHr8EyGSEFKTHouZEsAAyZ//W63rvax7QvAsosYzAIG0Hy4TGvTIdlWRGpI6Ay7k2QRC465ltySk+bn3RIzerzXaJe3zeUPI89v/HObxrrFnKeXWkW5eHH1Di137A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v1TbxRetccB3cqkr4MGIU/LGmnU1UmJDCQ3gYxtvhWg=;
 b=KNl9EbkDfJ/eVyq90odXqQsnEOIVgKOv6PGczUZtpQpMsyyyeKCg78P+kITAfCHnS60zGpUCS0E9SCUVNKYs2R9VpEV+Jemz7dtsbymu7/YVYoqQMuSDZTgBAxDikrpQho8xqdLuWf+Wo2CXdlLEgmDq8RZVgtlPuFweAc8EhwRdenprJljyebef673uBmTBXrID7YS8JPzvzV/wUfkJJAM9IJWPFXjdh9bAXFsviKBXdYYiM5vaJP2cq45TKiVLLNAX086XA3G+4R3ZcDiRfBvrxjozHHLvfveh5p8X0JIDNg8oa1QzzrtEIeMoobrGsk18TmmeWtpvTNwpC/qw3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v1TbxRetccB3cqkr4MGIU/LGmnU1UmJDCQ3gYxtvhWg=;
 b=SrwvTE9EKfw1wqlj6BuH9oAidxpkVESk8I76+y0nfOkpKYHYT66bkZ/JKjMn6vrMWMat7hZMvG8SULUQx8LJKXQSsr5r4YDoXf7SthpTnJy7uWuHNB1HEWBz6XswLN4DVcZdSrNYgobbHWi+Lw4B84HU1XplpCKKBd1icJ7Zn8A=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Roger Pau Monne
	<roger.pau@citrix.com>, Ian Jackson <iwj@xenproject.org>, Wei Liu
	<wl@xen.org>
Subject: [PATCH v4 05/10] libs/guest: make a cpu policy compatible with older Xen versions
Date: Fri,  7 May 2021 13:04:17 +0200
Message-ID: <20210507110422.24608-6-roger.pau@citrix.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210507110422.24608-1-roger.pau@citrix.com>
References: <20210507110422.24608-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MR2P264CA0062.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:31::26) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 79327a89-74ea-48ae-fe47-08d91148444c
X-MS-TrafficTypeDiagnostic: DM6PR03MB4475:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB44751F66998272AEE46142138F579@DM6PR03MB4475.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3513;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Nji8Zv8BmCfGnXxEJYveZmQ11ipTMPUIcDHyEsm9HmvEw0LrtFWogjMd01JCagj/IJ35FZDQJQi6f45rhiIn5/BTfI0eDkPaokwjHxI8V+qHUlcEKyE03DtFGew4t2NOKy7TMvdWM8hMl6hYTT3PL8rnlxRPvgMIY6NhYpYu+Cj7jQyp1soEp57v8VD6JpC2OhDExL0ukS5V31yaxddSNJcg2a7DZF9RphrWHoK1DON2OLQwHuyI5sZBYDgqb3oAc5Aux7iiClrd2y8HyMgqOvsGvBhPhayQnU0KrY4wWB1PnmpLzH2LZ82bsZJJ77aMYw/XOe5DhOsNroUVjlE5MN1rwyhtSLLoqr46yIUa9ymYAVFe5HQokFT4G8/H2j8Gw9kjVIJM32Mxqt82mItWtEzr8YJFl0vAfrKa7TK96JuqlV3s0aK60giLaSdcPF/N0jY+3iyy4/i4+StHz3RBceWJB5f2KylzVYdIZY2VeS0bCQUQ6Z+gBSfpsgA17VhqQrUxBew7X87N8MnqPIHH/EurP/YPef1j+2F50tz2uSFKRznbNxaB2p3H3p9HK181pEtfQnuZWT74A1axnjWPMw7+LcRUPOznJTXF/YQs2KE=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(136003)(376002)(346002)(39860400002)(366004)(8676002)(6496006)(26005)(66946007)(5660300002)(66556008)(66476007)(83380400001)(478600001)(956004)(1076003)(6916009)(316002)(38100700002)(54906003)(6486002)(2616005)(86362001)(8936002)(36756003)(4326008)(186003)(16526019)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?dytKaFpFZ2tyWkU1aGY1bXA4d1l1UGFxaHdIRktjYmgwZDBsNVBoQWRWN2U1?=
 =?utf-8?B?dm81R3JUNWk2cmJnQnhtZEZVbi9DOWNCQ255VkNLL0RzMjAxcWhXWW5wTzNI?=
 =?utf-8?B?Q01aNUx6NjAvcGpNdHhRYlR6cDV1RTMvM2VxMmVaUzZHQVZOaDZWS3U5N1Fq?=
 =?utf-8?B?eUltaXQrTWxiSExtUDZ1Z0ZNMU44Lzg3V3RRZGRqVHozR20zbm85eVZaWUsz?=
 =?utf-8?B?eDZ5TEh5SzF2ZEVRamxtZ1pXNkg0cE1ZSlBQaUdjNmhJeExwdGVkSjZMQkw5?=
 =?utf-8?B?bHRPdTFSTWtSRjF0ZHVrZElOL2VJOStwNzNjNFUzNkhDdGdHVGlMbVpHVm91?=
 =?utf-8?B?alpsZG1PWlBqQnVPaDByUUUyL05vckw0Q0x5QkVydUwvQ2ZnUUFWWGpkd2h1?=
 =?utf-8?B?SkJ3R2VNeXBONnpaVnFOZFlReW42SUdFMXhhaUQ5L0xMcmFSQXdoaEp5bVZh?=
 =?utf-8?B?b3NCTEY2RXhXUG9uRFFGZURWNTg1N1NDMXo4cXhjazFlN1IxK3F2NXllUmhP?=
 =?utf-8?B?emU3S3NNcFJnUXo5WFJvZUJqcm5yYW9hY0tubzVrdE54dVN1WGxkRDlDVjRV?=
 =?utf-8?B?VGgreDhmUytkUGtnSk9CNHB1OThwRG90d2ljbWltZFlRQkZiTHphODlPNHgx?=
 =?utf-8?B?c3FObzh6ZHZwNldkaGV3SmRPNXlXOHl6OXdPVHo2N2ZENlhlZVNQUWhNRU50?=
 =?utf-8?B?dlAyQmdTN3h1aTh2clhZQXl4enlwak5MU2xWbUxpTXZ6V3U5OGZsVE8vTUo2?=
 =?utf-8?B?RG5YQkVCdm80UGNpQ1FYNFQ2NFBybjM1MXY5N0hYbng5bHZRM2lic1MyNC9h?=
 =?utf-8?B?RWc1dE14VE1UNk5jSzR2VXc4REltNmI5QnZuUmhGa1N4Nnp4OHg0bTZkeElM?=
 =?utf-8?B?OVprNjQ3dzdkdFlXSzdEN0x2ZHBQM1I3SEc2YjRzZ01KWHRuQWhXdHNab3ZU?=
 =?utf-8?B?SkxXeVQ0QUlrb2lUSnFOVytveVBJaTQ0NlpvL1BBNTlReDZiWGpFb0ZTTWp4?=
 =?utf-8?B?NVR1SDV1L1pEcGRsWlNXOTM2TDdYdk8wa1dmM1V0TTlLb2Uwb3NHTmp6b2o0?=
 =?utf-8?B?ZVlmcElrcjZVNkRENkZuZHdzL0ZVbWduNHRVbmY4R1BDVy9oOU1Nd2NVL2sr?=
 =?utf-8?B?WjNySWJlUEw4cUpiSHJJcmlZOXhBMmdGc0dUTGVDVHBQQ0FtZDRhRHloMDRR?=
 =?utf-8?B?OTJmVDRiY2xNd3ptNGliTXBzSmNEZ1A0cFlYTS9zdGkzVTRnYjNlM05YK29R?=
 =?utf-8?B?b1hQNlRjYkI0djNmUmRCWGRGS1FCbWpsYnRyUjQvc1kvMHZaU1IxR3grZVdq?=
 =?utf-8?B?T1VyZ3FCVlQ4Y29kWkxsSjN2VWhpbzk1MnhILzFhSTNYSVpYUEJPZlZWQStl?=
 =?utf-8?B?dWtXRmkxYS9LbDJ1R2s2RHE0bk5BbFlJVms3K1RaNTE1VmQvd2VWMlBXNkcy?=
 =?utf-8?B?VVgzSlZGYnBvTTFRYmFXQjlmNkZTclZFVU1QZWhHYU54dnYwOWJtUk1mdXMx?=
 =?utf-8?B?TFl6alMzZXNyMmZDQ1dCWk5ObDB0bys3ZXR5N1dTMzNuN3dpaHpOV3FqY3ZY?=
 =?utf-8?B?Ym5DU0FxdGNzRlM0TnB4NVlWcURRbjFrU244RWZkcElML1VWUW1TeUNsZ2F2?=
 =?utf-8?B?akptM01vdDVmc2poZm56ZGNrdURSdGlWZU1nVjk2TWdrN3Znbnd2VVY3U1hP?=
 =?utf-8?B?Qk1PaFEwYlJrT1Urd3B1RTNwTEczeHo4M2FPa2RHQi83RW9WUXNJWVRrd2dk?=
 =?utf-8?Q?kZAxIrzSXt1bxsSVqzBZ/8AP0ZgeEIc7PgAYxgS?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 79327a89-74ea-48ae-fe47-08d91148444c
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2021 11:07:13.2691
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1MQwioud98NuvP4W1aNsUynhRKCtLm7wRUBkg0xjHdS54zRjy5DFzN3Eb+tWL6SfWhMAaNPr9iCunGcNN371Jw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4475
X-OriginatorOrg: citrix.com

Older Xen versions used to expose some CPUID bits which are no longer
exposed by default. In order to keep a compatible behavior with
guests migrated from versions of Xen that don't encode the CPUID data
on the migration stream introduce a function that sets the same bits
as older Xen versions.

This is pulled out from xc_cpuid_apply_policy which already has this
logic present.

No functional change intended.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v3:
 - Rename function to xc_cpu_policy_make_compat_4_12.

Changes since v1:
 - Move comments and explicitly mention pre-4.13 Xen.
---
 tools/include/xenguest.h        |  4 +++
 tools/libs/guest/xg_cpuid_x86.c | 58 ++++++++++++++++++++++++---------
 2 files changed, 47 insertions(+), 15 deletions(-)

diff --git a/tools/include/xenguest.h b/tools/include/xenguest.h
index 8e8461b0660..576e976d069 100644
--- a/tools/include/xenguest.h
+++ b/tools/include/xenguest.h
@@ -754,6 +754,10 @@ int xc_cpu_policy_get_msr(xc_interface *xch, const xc_cpu_policy_t *policy,
 bool xc_cpu_policy_is_compatible(xc_interface *xch, xc_cpu_policy_t *host,
                                  xc_cpu_policy_t *guest);
 
+/* Make a policy compatible with pre-4.13 Xen versions. */
+int xc_cpu_policy_make_compat_4_12(xc_interface *xch, xc_cpu_policy_t *policy,
+                                   bool hvm);
+
 int xc_get_cpu_levelling_caps(xc_interface *xch, uint32_t *caps);
 int xc_get_cpu_featureset(xc_interface *xch, uint32_t index,
                           uint32_t *nr_features, uint32_t *featureset);
diff --git a/tools/libs/guest/xg_cpuid_x86.c b/tools/libs/guest/xg_cpuid_x86.c
index cdfc79a86e7..fccbc54a400 100644
--- a/tools/libs/guest/xg_cpuid_x86.c
+++ b/tools/libs/guest/xg_cpuid_x86.c
@@ -441,6 +441,7 @@ int xc_cpuid_apply_policy(xc_interface *xch, uint32_t domid, bool restore,
     unsigned int i, nr_leaves, nr_msrs;
     xen_cpuid_leaf_t *leaves = NULL;
     struct cpuid_policy *p = NULL;
+    struct xc_cpu_policy policy = { };
     uint32_t err_leaf = -1, err_subleaf = -1, err_msr = -1;
     uint32_t host_featureset[FEATURESET_NR_ENTRIES] = {};
     uint32_t len = ARRAY_SIZE(host_featureset);
@@ -505,21 +506,9 @@ int xc_cpuid_apply_policy(xc_interface *xch, uint32_t domid, bool restore,
 
     if ( restore )
     {
-        /*
-         * Account for feature which have been disabled by default since Xen 4.13,
-         * so migrated-in VM's don't risk seeing features disappearing.
-         */
-        p->basic.rdrand = test_bit(X86_FEATURE_RDRAND, host_featureset);
-
-        if ( di.hvm )
-        {
-            p->feat.mpx = test_bit(X86_FEATURE_MPX, host_featureset);
-        }
-
-        /* Clamp maximum leaves to the ones supported on 4.12. */
-        p->basic.max_leaf = min(p->basic.max_leaf, 0xdu);
-        p->feat.max_subleaf = 0;
-        p->extd.max_leaf = min(p->extd.max_leaf, 0x1cu);
+        policy.cpuid = *p;
+        xc_cpu_policy_make_compat_4_12(xch, &policy, di.hvm);
+        *p = policy.cpuid;
     }
 
     if ( featureset )
@@ -921,3 +910,42 @@ bool xc_cpu_policy_is_compatible(xc_interface *xch, xc_cpu_policy_t *host,
 
     return false;
 }
+
+int xc_cpu_policy_make_compat_4_12(xc_interface *xch, xc_cpu_policy_t *policy,
+                                   bool hvm)
+{
+    xc_cpu_policy_t *host;
+    int rc;
+
+    host = xc_cpu_policy_init();
+    if ( !host )
+    {
+        errno = ENOMEM;
+        return -1;
+    }
+
+    rc = xc_cpu_policy_get_system(xch, XEN_SYSCTL_cpu_policy_host, host);
+    if ( rc )
+    {
+        ERROR("Failed to get host policy");
+        goto out;
+    }
+
+    /*
+     * Account for features which have been disabled by default since Xen 4.13,
+     * so migrated-in VM's don't risk seeing features disappearing.
+     */
+    policy->cpuid.basic.rdrand = host->cpuid.basic.rdrand;
+
+    if ( hvm )
+        policy->cpuid.feat.mpx = host->cpuid.feat.mpx;
+
+    /* Clamp maximum leaves to the ones supported on pre-4.13. */
+    policy->cpuid.basic.max_leaf = min(policy->cpuid.basic.max_leaf, 0xdu);
+    policy->cpuid.feat.max_subleaf = 0;
+    policy->cpuid.extd.max_leaf = min(policy->cpuid.extd.max_leaf, 0x1cu);
+
+ out:
+    xc_cpu_policy_destroy(host);
+    return rc;
+}
-- 
2.31.1


