Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +LgSAGOcBmoylQIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 15 May 2026 06:09:07 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C3125491B8
	for <lists+xen-devel@lfdr.de>; Fri, 15 May 2026 06:09:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1309338.1580368 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wNjqg-0001od-8j; Fri, 15 May 2026 04:08:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1309338.1580368; Fri, 15 May 2026 04:08:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wNjqg-0001nc-4y; Fri, 15 May 2026 04:08:30 +0000
Received: by outflank-mailman (input) for mailman id 1309338;
 Fri, 15 May 2026 04:08:29 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <den@valinux.co.jp>) id 1wNjqe-0001Qf-Ti
 for xen-devel@lists.xenproject.org; Fri, 15 May 2026 04:08:29 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wNjqe-00GbfP-9N
 for xen-devel@lists.xenproject.org; Fri, 15 May 2026 06:08:28 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <den@valinux.co.jp>)
 id 6a069c0b-2eae-0a2a0a5409dd-0a2a4504bda6-40
 for <xen-devel@lists.xenproject.org>; Fri, 15 May 2026 06:08:28 +0200
Received: from [52.101.125.129]
 (helo=TYVP286CU001.outbound.protection.outlook.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <den@valinux.co.jp>)
 id 6a069c35-1dec-0a2a45040019-34657d8136d2-5
 for <xen-devel@lists.xenproject.org>; Fri, 15 May 2026 06:08:28 +0200
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:38f::10)
 by TYYP286MB3981.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:156::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.18; Fri, 15 May
 2026 04:08:21 +0000
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32]) by TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32%5]) with mapi id 15.20.9846.025; Fri, 15 May 2026
 04:08:21 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=valinux.co.jp header.i="@valinux.co.jp" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mxT8Nm01DxQ+CSw70GAGjBHeQDZxXsxCXvUdjgAcAGQFDrnjRvIPb0v5dR82AbK4mU/ZmxiImCppKI9kVkSdm2au34w1ivelCkTrvbhmPJvBmSU0el0AmtUExCSChoQW5mLQ2B5+r0bPWP1TomeGQ2t7VYQZbnRjZS8S2nTq8tluAhk7TndDOCgFkPm0tNVEbG6yT9Pi4pR1vL1fivWKEPNGC/VcaE3AZou/2LMVGkq/I9aoXGZkZG5vtfzKdnEYVkdepvS8Se+cbZ8ccDhD7ppyQ3dPc/6dgxYpT8SSf+iBhTk+Q/BNwY9Xq4UUUeJTKqenVRfmwLgbPDCA/Px6/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vAyjwFNK4w1A5HZVai7iWdh30Be5cNwrdAR6jGy2XIc=;
 b=Z50oCDTnpGtzwpC1QfdNgCWghQZ38YhxL632nerZXi5VVrelPgxgue0yYENBy5APj9uU3lh/ogQ+K/wa5i4M5kGFoA0jhUjnw59OJk+SEG1p7cUQXwiW0IswV/Kd5D9c9/0puZoU3aBxfnTZwtXh41+/P8Meuj7V4zULop0WW8J/LAHbpfvxAOiqRnKqdZ+wL+McGJqeYmKw+4Ona4pRdXpgQTavmcYOACt/mVrl69P3wy6hE+p6uyveaVmt9tRB9xe95hsGbcv5Jdw0c9eOyiVitid/JLf/h79cXB+mrsGbsg7iDA8LcsrkQjJhn9bNa2lpYdcWXVOARLL3UjBoBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vAyjwFNK4w1A5HZVai7iWdh30Be5cNwrdAR6jGy2XIc=;
 b=lY2HshufvoyA1OK7cF1JdeKoRxeUYhIrG8BSA/iLHWDgoSxVG73zKzide+fYPO9chXSAW8+5bzt6fsoJrPSQmUrevt94QUtv1bpD2hHrVuSp7khyzyCna273PKr5QyZNnBYQxyxjHAUbMITlXyB+HuyW3M4VAMJ4nwy3+A263SM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
From: Koichiro Den <den@valinux.co.jp>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Juergen Gross <jgross@suse.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [RFC PATCH v1 03/26] xen/arm/cca: add RMI v2.0 lifecycle wrappers
Date: Fri, 15 May 2026 13:07:49 +0900
Message-ID: <20260515040812.983626-4-den@valinux.co.jp>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260515040812.983626-1-den@valinux.co.jp>
References: <20260515040812.983626-1-den@valinux.co.jp>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY4P301CA0031.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:2be::17) To TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:38f::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY7P286MB7722:EE_|TYYP286MB3981:EE_
X-MS-Office365-Filtering-Correlation-Id: 2aef2e53-e2ce-4d94-eb75-08deb23799f6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|366016|10070799003|3023799003|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	/rU923jkb4jSayiWGlSsyfPnwdA+OJ7a6TfSsz1vmPLwENGRc10ZuCPj6Qgsn5MRSfivXryT6/kvnIEo+oDeTGKAKVJnfoWxkgn7YdNvzwVYE0wxYCMkgJwlL8C7j7Ekt29qoJu1vonAqW2thxovGJC8tsG8LIX1EWFV0FEp1cLnbXAsKL7S6AxILqTLOmBouLEpMTDZO1YadASo9gLDI31/bDEvUyrOw7vJiXpwC8u6CoyrEBihQqTTts2MI2k6DPmCaS6up3yut0Ebs/iC/cJKgP+tItk1m08gZ+Zs5i6IKdIacRTXvTYORlshNST+pg3e1FEb541PwqTDd3BiQbqKDJmrZInQTM/5IJkMlAA5Cb4bNRif+D7W1DGwVQLiIyulySa0wraJWuN53m/vS6wmVDO1f6wOcPXzSAcGr1xeIHC+kD2KdeOEdd/Th7w7RHp8qZavJ3v/7lSttAB4JS7tqkW3nAAmNECTjkVPInH4z6b7cJP0++qSe6WqNCVvknDhAx38PUR1bps8qioyRuufOwC7p9X1GNLwfVBCCo3Mo/V1zkMsnvvUiXONMV2hSWRThxO0H5+f3BLBo0gol8rJEPG1l5XMMcMurewAvw20DvJ8fdpTWBVgO4+CPENnxJGCa9o2e95cf4hd4mwDua29pWmp8HFPyzef0SA+fXAiORM+2yXIO35VY/jo0iSc
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(10070799003)(3023799003)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?4/tZAFWLDyojmP1204mU6uTODmN+qgtb/ul3ayL+jyRo9Z/fXvrW6OIjTM7m?=
 =?us-ascii?Q?miM7GpevQ7hfp8gdIbrtazM6X8BoipajO5KeTMRD1z9/gBx8DeOPyJs6ynZE?=
 =?us-ascii?Q?addcbDX1NDTo/No5GFzHPv3MBfSX7jKRmaMhnqfIPdBBPtvhSs3XRAWXz1Sw?=
 =?us-ascii?Q?BVYTe1M2zk/EkD30Bj61GisVp8JfyL7iQyvIc5PoRldkL1Y/UdWzfYckpgTC?=
 =?us-ascii?Q?O5dFuw2q+eT0LhGTMdr+J+Ujmqa+ooKxOyWiR10XqnWeT7zZxritNHyrTinp?=
 =?us-ascii?Q?GzBaSI3GbpGq/L39A2vCWpOXJKKYHj1wwAhWENVe+CWYMGKUxwsmfL40ExVf?=
 =?us-ascii?Q?MX//MrTlrT3i2CaKYXOnW0U7NIqUoO6IFCc/JOL5Mrmz4IyP8Z9xSVnuBvrp?=
 =?us-ascii?Q?abcss/qt5bAq27jtCsB4U9a7RJXzo/WVIYpg9Do4TlukgI8GZLSqN27ljCku?=
 =?us-ascii?Q?AGWOohSVdxhimwErHOMHVPO8e4isukk2ZVEefyp+JTs+kKfGHzRzYsdUWiuw?=
 =?us-ascii?Q?9SgCuidaY5O1nizn66KIuFQaBp1zYkTvOIyEtvlU1GKTYkflyaW7qWCpFNt0?=
 =?us-ascii?Q?zHNEraM/7g/aD/UvK0mkXO53Y68dTtA/bluCgif31xPQsRjAiqu6OJh++ubG?=
 =?us-ascii?Q?OR34P0R1jGlb8Rvww/3fNxrh7Uo6lOEJB0VocHC6i44A+PU9PTLr0Yma7eXS?=
 =?us-ascii?Q?C5YlTmyVn1R/cm4bqkfOf88f9CU5mh6EEW6qbE0PgHeB6P9mn8yyH+4NUxP1?=
 =?us-ascii?Q?L/lo/2albLDDRPz0M248O8iew/W4oYOa2JO7f+VS05ithh/ZZmCNRjVHMjS2?=
 =?us-ascii?Q?wj7Drt8XXjtItWtj7tYNW0xCeVVp/dJ67yZagzR4BTdwGUtX8iyLz1j9bghw?=
 =?us-ascii?Q?yWsyEVnTGTCfuSo5MbTE1825UerfYo+ineUNXe4bPasFIauJUFhptsyqEHe6?=
 =?us-ascii?Q?PZvp0rWymv4+dayE5DgPYmi3A0ETXjUbfuvMSCjHRSNZYQR1YlmuKPkPNH7M?=
 =?us-ascii?Q?55qElkxzYKSqfNjDUzGPl/pSpHEaItY+NqUJhYUpBcTLCNA77ziuvN2LHAx/?=
 =?us-ascii?Q?vfLjO+BKZRSapVJ04Q0JhuXAXobhWxhgjxbxafA+lqQlMEe4cfKDKJ18VcVf?=
 =?us-ascii?Q?iQvydeleM/SGU+V7IEqfzs4wUbKIm4NplJRgzLuBOsVUMCojT1qca05NaCD8?=
 =?us-ascii?Q?N5i1DCfQgU/N07FHn6s9X0ROdZ/jLOPHPTHBY4FJ91vFt+xSDBiOKwvrfuJp?=
 =?us-ascii?Q?Xo/YGmjU9CEtGVJyVCoz2/616l/DEpqL9bsUFl3gTR82V7UZMCNZtjd/oqp2?=
 =?us-ascii?Q?jf56VRd1whbAEv8a2PCWiCgRs+MHGyFtf5GTvt7ZaSSAPpAB5S/V6UyUSdxr?=
 =?us-ascii?Q?DscjBLabBx3bD+hRIJEaAxdSJjl4jqq8wspAlgyvmBzh8o+bMg3JTlxDRzn5?=
 =?us-ascii?Q?uFW+L4YZg6MzYvUhIZgYgwkX6EpKqQ8p+Zl6TiMQ58W2jbmblB8DhYpN1Q69?=
 =?us-ascii?Q?HGklVIMOvFKa6G01weoFAtALHGCvNAM+/GAXMcjaFA0JR9VRCg5LkKyQ5ZPD?=
 =?us-ascii?Q?OxNvqj+qmyFvrdmutbBjgNnxIKzy5uav7Umy3d/VnWLfVECcAH3IaqVSfVrB?=
 =?us-ascii?Q?oa7rE+KOUvPNfP6v/qKZvwfL1KwMlKil5o1xf1Api3xcmcx6w+twn5f/A1Ao?=
 =?us-ascii?Q?9t/e0qw18YCQkXRAK+srODjPBXCRV19XW5xxfqOPMRHifbq9VNCdWDSPPrnB?=
 =?us-ascii?Q?sMeRoH5e1S1DYouPamBs0LirbAplUqsbfU8ePk7llSIAhEqYoYZp?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 2aef2e53-e2ce-4d94-eb75-08deb23799f6
X-MS-Exchange-CrossTenant-AuthSource: TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2026 04:08:20.9857
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n5HtbHoJaFIKAr31MmkGmKotGKQ6LwNrdv9AUIcp/+cxoDIqw6yXkaPf6We3/JiFJ7uH9qk/Im9ISxHjqBwWxw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYP286MB3981
X-purgate-ID: tlsNG-ebf023/1778818108-2A37F3FF-6843D637/0/0
X-purgate-type: clean
X-purgate-size: 14387
X-Rspamd-Queue-Id: 0C3125491B8
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.31 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[valinux.co.jp,none];
	R_DKIM_ALLOW(-0.20)[valinux.co.jp:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER(0.00)[den@valinux.co.jp,xen-devel-bounces@lists.xenproject.org];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:dpsmith@apertussolutions.com,m:jgross@suse.com,m:bertrand.marquis@arm.com,m:Volodymyr_Babchuk@epam.com,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[valinux.co.jp:email,valinux.co.jp:mid,valinux.co.jp:dkim];
	FROM_NEQ_ENVFROM(0.00)[den@valinux.co.jp,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[valinux.co.jp:+];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

Wrap the Realm, REC, RTT, SRO and PSCI calls used by Xen. Keep the
stateful completion rules close to the raw RMI call boundary and avoid
code duplication.

Signed-off-by: Koichiro Den <den@valinux.co.jp>
---
 xen/arch/arm/cca/rmi.c | 271 +++++++++++++++++++++++++++++++++++++++++
 xen/arch/arm/cca/rmi.h |  88 +++++++++++++
 2 files changed, 359 insertions(+)

diff --git a/xen/arch/arm/cca/rmi.c b/xen/arch/arm/cca/rmi.c
index d37f1226f834..5661d35e30da 100644
--- a/xen/arch/arm/cca/rmi.c
+++ b/xen/arch/arm/cca/rmi.c
@@ -56,6 +56,46 @@ static int arm_cca_rmi_initiate_sro(unsigned long fid,
         cpu_relax();
     }
 }
+
+static int arm_cca_rmi_complete_no_mem_transfer(struct arm_smccc_res *res)
+{
+    unsigned long handle;
+    uint64_t result = arm_cca_rmi_result(res);
+
+    if ( !arm_cca_rmi_status_is(result, ARM_CCA_RMI_INCOMPLETE) )
+        return arm_cca_rmi_result_to_errno(result);
+
+    /*
+     * The initiating command returns the SRO handle in X1.  Once
+     * the operation is continued, X1 is not a stable handle output:
+     * completion returns the initiating command's output registers.
+     *
+     * See DEN0137 2.0-bet1 - B4.3.2 and B4.3.2.1
+     */
+    handle = res->a1;
+
+    while ( arm_cca_rmi_status_is(result, ARM_CCA_RMI_INCOMPLETE) ||
+            arm_cca_rmi_status_is(result, ARM_CCA_RMI_BUSY) )
+    {
+        if ( arm_cca_rmi_status_is(result, ARM_CCA_RMI_INCOMPLETE) )
+        {
+            /*
+             * This helper is only for commands specified as stateful but not
+             * memory-transferring.  Callers with donate/reclaim flows handle SROs
+             * themselves because they must own the backing-page lifetime.
+             */
+            if ( arm_cca_rmi_sro_mem_req(result) !=
+                 ARM_CCA_RMI_OP_MEM_REQ_NONE )
+                return -EOPNOTSUPP;
+        }
+
+        arm_cca_rmi_op_continue(handle, ARM_CCA_RMI_CONTINUE_KEEP_GOING, res);
+        result = arm_cca_rmi_result(res);
+    }
+
+    return arm_cca_rmi_result_to_errno(result);
+}
+
 int arm_cca_rmi_version(unsigned long requested_revision,
                         unsigned long *revision_lower,
                         unsigned long *revision_higher)
@@ -168,3 +208,234 @@ int arm_cca_rmi_gpt_l1_create(paddr_t base)
 
     return arm_cca_rmi_res_to_errno(&res);
 }
+
+int arm_cca_rmi_granule_range_delegate(paddr_t base, paddr_t top,
+                                       paddr_t *out_top)
+{
+    struct arm_smccc_res res;
+    int rc;
+
+    rc = arm_cca_rmi_initiate_sro(ARM_CCA_RMI_GRANULE_RANGE_DELEGATE_FID,
+                                  base, top, 0, 0, 0, &res);
+    if ( rc != 0 )
+        return rc;
+
+    rc = arm_cca_rmi_complete_no_mem_transfer(&res);
+    if ( rc == 0 && out_top != NULL )
+        *out_top = res.a1;
+
+    return rc;
+}
+
+int arm_cca_rmi_granule_range_undelegate(paddr_t base, paddr_t top,
+                                         paddr_t *out_top)
+{
+    struct arm_smccc_res res;
+    int rc;
+
+    rc = arm_cca_rmi_initiate_sro(ARM_CCA_RMI_GRANULE_RANGE_UNDELEGATE_FID,
+                                  base, top, 0, 0, 0, &res);
+    if ( rc != 0 )
+        return rc;
+
+    rc = arm_cca_rmi_complete_no_mem_transfer(&res);
+    if ( rc == 0 && out_top != NULL )
+        *out_top = res.a1;
+
+    return rc;
+}
+
+int arm_cca_rmi_realm_create(paddr_t rd, paddr_t params_ptr,
+                             struct arm_smccc_res *res)
+{
+    int rc;
+
+    rc = arm_cca_rmi_initiate_sro(ARM_CCA_RMI_REALM_CREATE_FID,
+                                  rd, params_ptr, 0, 0, 0, res);
+    if ( rc != 0 )
+        return rc;
+
+    return arm_cca_rmi_res_to_errno(res);
+}
+
+int arm_cca_rmi_realm_activate(paddr_t rd, struct arm_smccc_res *res)
+{
+    arm_cca_rmi_invoke(ARM_CCA_RMI_REALM_ACTIVATE_FID, rd, 0, 0, 0, 0, res);
+
+    return arm_cca_rmi_res_to_errno(res);
+}
+
+int arm_cca_rmi_realm_terminate(paddr_t rd, struct arm_smccc_res *res)
+{
+    int rc;
+
+    rc = arm_cca_rmi_initiate_sro(ARM_CCA_RMI_REALM_TERMINATE_FID,
+                                  rd, 0, 0, 0, 0, res);
+    if ( rc != 0 )
+        return rc;
+
+    rc = arm_cca_rmi_res_to_errno(res);
+
+    if ( !arm_cca_rmi_status_is(arm_cca_rmi_result(res),
+                                ARM_CCA_RMI_INCOMPLETE) )
+        return rc;
+
+    return arm_cca_rmi_complete_no_mem_transfer(res);
+}
+
+int arm_cca_rmi_realm_destroy(paddr_t rd, struct arm_smccc_res *res)
+{
+    int rc;
+
+    rc = arm_cca_rmi_initiate_sro(ARM_CCA_RMI_REALM_DESTROY_FID,
+                                  rd, 0, 0, 0, 0, res);
+    if ( rc != 0 )
+        return rc;
+
+    return arm_cca_rmi_res_to_errno(res);
+}
+
+int arm_cca_rmi_rec_create(paddr_t rd, paddr_t rec, paddr_t params_ptr,
+                           struct arm_smccc_res *res)
+{
+    int rc;
+
+    rc = arm_cca_rmi_initiate_sro(ARM_CCA_RMI_REC_CREATE_FID,
+                                  rd, rec, params_ptr, 0, 0, res);
+    if ( rc != 0 )
+        return rc;
+
+    return arm_cca_rmi_res_to_errno(res);
+}
+
+int arm_cca_rmi_rec_destroy(paddr_t rec, struct arm_smccc_res *res)
+{
+    int rc;
+
+    rc = arm_cca_rmi_initiate_sro(ARM_CCA_RMI_REC_DESTROY_FID,
+                                  rec, 0, 0, 0, 0, res);
+    if ( rc != 0 )
+        return rc;
+
+    return arm_cca_rmi_res_to_errno(res);
+}
+
+int arm_cca_rmi_rec_enter(paddr_t rec, paddr_t run, struct arm_smccc_res *res)
+{
+    arm_cca_rmi_invoke(ARM_CCA_RMI_REC_ENTER_FID, rec, run, 0, 0, 0, res);
+
+    return arm_cca_rmi_res_to_errno(res);
+}
+
+int arm_cca_rmi_op_continue(unsigned long handle, unsigned long flags,
+                            struct arm_smccc_res *res)
+{
+    arm_cca_rmi_invoke(ARM_CCA_RMI_OP_CONTINUE_FID,
+                       handle, flags, 0, 0, 0, res);
+
+    return arm_cca_rmi_res_to_errno(res);
+}
+
+int arm_cca_rmi_op_cancel(unsigned long handle, struct arm_smccc_res *res)
+{
+    arm_cca_rmi_invoke(ARM_CCA_RMI_OP_CANCEL_FID, handle, 0, 0, 0, 0, res);
+
+    return arm_cca_rmi_res_to_errno(res);
+}
+
+int arm_cca_rmi_op_mem_donate(unsigned long handle, paddr_t list,
+                              unsigned long list_count,
+                              struct arm_smccc_res *res)
+{
+    arm_cca_rmi_invoke(ARM_CCA_RMI_OP_MEM_DONATE_FID,
+                       handle, list, list_count, 0, 0, res);
+
+    return arm_cca_rmi_res_to_errno(res);
+}
+
+int arm_cca_rmi_op_mem_reclaim(unsigned long handle, paddr_t list,
+                               unsigned long list_count,
+                               struct arm_smccc_res *res)
+{
+    arm_cca_rmi_invoke(ARM_CCA_RMI_OP_MEM_RECLAIM_FID,
+                       handle, list, list_count, 0, 0, res);
+
+    return arm_cca_rmi_res_to_errno(res);
+}
+
+int arm_cca_rmi_rtt_create(paddr_t rd, paddr_t rtt, paddr_t ipa,
+                           unsigned long level, struct arm_smccc_res *res)
+{
+    int rc;
+
+    rc = arm_cca_rmi_initiate_sro(ARM_CCA_RMI_RTT_CREATE_FID,
+                                  rd, rtt, ipa, level, 0, res);
+    if ( rc != 0 )
+        return rc;
+
+    return arm_cca_rmi_complete_no_mem_transfer(res);
+}
+
+int arm_cca_rmi_rtt_destroy(paddr_t rd, paddr_t ipa, unsigned long level,
+                            struct arm_smccc_res *res)
+{
+    int rc;
+
+    rc = arm_cca_rmi_initiate_sro(ARM_CCA_RMI_RTT_DESTROY_FID,
+                                  rd, ipa, level, 0, 0, res);
+    if ( rc != 0 )
+        return rc;
+
+    return arm_cca_rmi_complete_no_mem_transfer(res);
+}
+
+int arm_cca_rmi_rtt_set_ripas(paddr_t rd, paddr_t rec, paddr_t base,
+                              paddr_t top, struct arm_smccc_res *res)
+{
+    int rc;
+
+    rc = arm_cca_rmi_initiate_sro(ARM_CCA_RMI_RTT_SET_RIPAS_FID,
+                                  rd, rec, base, top, 0, res);
+    if ( rc != 0 )
+        return rc;
+
+    return arm_cca_rmi_complete_no_mem_transfer(res);
+}
+
+int arm_cca_rmi_rtt_data_map_init(paddr_t rd, paddr_t data, paddr_t ipa,
+                                  paddr_t src, unsigned long flags,
+                                  struct arm_smccc_res *res)
+{
+    int rc;
+
+    rc = arm_cca_rmi_initiate_sro(ARM_CCA_RMI_RTT_DATA_MAP_INIT_FID,
+                                  rd, data, ipa, src, flags, res);
+    if ( rc != 0 )
+        return rc;
+
+    return arm_cca_rmi_complete_no_mem_transfer(res);
+}
+
+int arm_cca_rmi_rtt_data_unmap(paddr_t rd, paddr_t base, paddr_t top,
+                               unsigned long flags, unsigned long oaddr,
+                               struct arm_smccc_res *res)
+{
+    int rc;
+
+    rc = arm_cca_rmi_initiate_sro(ARM_CCA_RMI_RTT_DATA_UNMAP_FID,
+                                  rd, base, top, flags, oaddr, res);
+    if ( rc != 0 )
+        return rc;
+
+    return arm_cca_rmi_complete_no_mem_transfer(res);
+}
+
+int arm_cca_rmi_psci_complete(paddr_t calling_rec, paddr_t target_rec,
+                              int64_t status, struct arm_smccc_res *res)
+{
+    arm_cca_rmi_invoke(ARM_CCA_RMI_PSCI_COMPLETE_FID,
+                       calling_rec, target_rec, (unsigned long)status,
+                       0, 0, res);
+
+    return arm_cca_rmi_res_to_errno(res);
+}
diff --git a/xen/arch/arm/cca/rmi.h b/xen/arch/arm/cca/rmi.h
index 4cd0bc64ccf5..589c12b24e79 100644
--- a/xen/arch/arm/cca/rmi.h
+++ b/xen/arch/arm/cca/rmi.h
@@ -110,6 +110,51 @@ static inline int arm_cca_rmi_res_to_errno(const struct arm_smccc_res *res)
 {
     return arm_cca_rmi_result_to_errno(arm_cca_rmi_result(res));
 }
+
+static inline unsigned long arm_cca_rmi_sro_mem_req(uint64_t result)
+{
+    uint64_t incomplete_data = arm_cca_rmi_result_data(result);
+
+    return arm_cca_rmi_field_get(
+        incomplete_data, ARM_CCA_RMI_RESULT_INCOMPLETE_MEM_SHIFT,
+        ARM_CCA_RMI_RESULT_INCOMPLETE_MEM_WIDTH);
+}
+
+static inline bool arm_cca_rmi_sro_can_cancel(uint64_t result)
+{
+    uint64_t incomplete_data = arm_cca_rmi_result_data(result);
+
+    return arm_cca_rmi_field_get(
+        incomplete_data, ARM_CCA_RMI_RESULT_INCOMPLETE_CAN_CANCEL_SHIFT,
+        ARM_CCA_RMI_RESULT_INCOMPLETE_CAN_CANCEL_WIDTH) ==
+           ARM_CCA_RMI_OP_CAN_CANCEL;
+}
+
+static inline paddr_t arm_cca_rmi_addr_desc_4k_pa(uint64_t desc)
+{
+    return arm_cca_rmi_field_get(desc, ARM_CCA_RMI_ADDR_DESC_4K_ADDR_SHIFT,
+                                 ARM_CCA_RMI_ADDR_DESC_4K_ADDR_WIDTH)
+           << PAGE_SHIFT;
+}
+
+static inline unsigned long arm_cca_rmi_addr_desc_4k_size(uint64_t desc)
+{
+    return arm_cca_rmi_field_get(desc, ARM_CCA_RMI_ADDR_DESC_4K_SZ_SHIFT,
+                                 ARM_CCA_RMI_ADDR_DESC_4K_SZ_WIDTH);
+}
+
+static inline unsigned long arm_cca_rmi_addr_desc_4k_count(uint64_t desc)
+{
+    return arm_cca_rmi_field_get(desc, ARM_CCA_RMI_ADDR_DESC_4K_CNT_SHIFT,
+                                 ARM_CCA_RMI_ADDR_DESC_4K_CNT_WIDTH);
+}
+
+static inline unsigned long arm_cca_rmi_addr_desc_4k_state(uint64_t desc)
+{
+    return arm_cca_rmi_field_get(desc, ARM_CCA_RMI_ADDR_DESC_4K_ST_SHIFT,
+                                 ARM_CCA_RMI_ADDR_DESC_4K_ST_WIDTH);
+}
+
 int arm_cca_rmi_version(unsigned long requested_revision,
                         unsigned long *revision_lower,
                         unsigned long *revision_higher);
@@ -123,4 +168,47 @@ int arm_cca_rmi_granule_tracking_get(paddr_t base, paddr_t top,
                                      unsigned long *state, paddr_t *out_top);
 int arm_cca_rmi_gpt_l1_create(paddr_t base);
 
+int arm_cca_rmi_granule_range_delegate(paddr_t base, paddr_t top,
+                                       paddr_t *out_top);
+int arm_cca_rmi_granule_range_undelegate(paddr_t base, paddr_t top,
+                                         paddr_t *out_top);
+
+int arm_cca_rmi_realm_create(paddr_t rd, paddr_t params_ptr,
+                             struct arm_smccc_res *res);
+int arm_cca_rmi_realm_activate(paddr_t rd, struct arm_smccc_res *res);
+int arm_cca_rmi_realm_terminate(paddr_t rd, struct arm_smccc_res *res);
+int arm_cca_rmi_realm_destroy(paddr_t rd, struct arm_smccc_res *res);
+
+int arm_cca_rmi_rec_create(paddr_t rd, paddr_t rec, paddr_t params_ptr,
+                           struct arm_smccc_res *res);
+int arm_cca_rmi_rec_destroy(paddr_t rec, struct arm_smccc_res *res);
+int arm_cca_rmi_rec_enter(paddr_t rec, paddr_t run, struct arm_smccc_res *res);
+
+int arm_cca_rmi_op_continue(unsigned long handle, unsigned long flags,
+                            struct arm_smccc_res *res);
+int arm_cca_rmi_op_cancel(unsigned long handle, struct arm_smccc_res *res);
+int arm_cca_rmi_op_mem_donate(unsigned long handle, paddr_t list,
+                              unsigned long list_count,
+                              struct arm_smccc_res *res);
+int arm_cca_rmi_op_mem_reclaim(unsigned long handle, paddr_t list,
+                               unsigned long list_count,
+                               struct arm_smccc_res *res);
+
+int arm_cca_rmi_rtt_create(paddr_t rd, paddr_t rtt, paddr_t ipa,
+                           unsigned long level, struct arm_smccc_res *res);
+int arm_cca_rmi_rtt_destroy(paddr_t rd, paddr_t ipa, unsigned long level,
+                            struct arm_smccc_res *res);
+int arm_cca_rmi_rtt_set_ripas(paddr_t rd, paddr_t rec, paddr_t base,
+                              paddr_t top, struct arm_smccc_res *res);
+
+int arm_cca_rmi_rtt_data_map_init(paddr_t rd, paddr_t data, paddr_t ipa,
+                                  paddr_t src, unsigned long flags,
+                                  struct arm_smccc_res *res);
+int arm_cca_rmi_rtt_data_unmap(paddr_t rd, paddr_t base, paddr_t top,
+                               unsigned long flags, unsigned long oaddr,
+                               struct arm_smccc_res *res);
+
+int arm_cca_rmi_psci_complete(paddr_t calling_rec, paddr_t target_rec,
+                              int64_t status, struct arm_smccc_res *res);
+
 #endif /* ARM_CCA_RMI_H */
-- 
2.51.0


