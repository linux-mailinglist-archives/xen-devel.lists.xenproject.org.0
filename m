Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id c8JMKl1eT2pRfQIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 09 Jul 2026 10:39:57 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 76DFD72E645
	for <lists+xen-devel@lfdr.de>; Thu, 09 Jul 2026 10:39:56 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=valinux.co.jp header.s=selector1 header.b=Cc6ZAmBw;
	dmarc=pass (policy=none) header.from=valinux.co.jp;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1357677.1612034 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1whkHt-0001CG-Nl; Thu, 09 Jul 2026 08:39:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1357677.1612034; Thu, 09 Jul 2026 08:39:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1whkHt-00019Y-Kf; Thu, 09 Jul 2026 08:39:17 +0000
Received: by outflank-mailman (input) for mailman id 1357677;
 Thu, 09 Jul 2026 08:39:16 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <okamoto@valinux.co.jp>) id 1whkHr-00019S-Mk
 for xen-devel@lists.xenproject.org; Thu, 09 Jul 2026 08:39:16 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1whkHq-00AvoR-17
 for xen-devel@lists.xenproject.org; Thu, 09 Jul 2026 10:39:14 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <okamoto@valinux.co.jp>)
 id 6a4f5e21-e002-0a2a0a5209dd-0a2a4504e6e6-38
 for <xen-devel@lists.xenproject.org>; Thu, 09 Jul 2026 10:39:13 +0200
Received: from [52.101.228.92]
 (helo=OS0P286CU011.outbound.protection.outlook.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <okamoto@valinux.co.jp>)
 id 6a4f5e2e-a01d-0a2a45040019-3465e45c97bf-3
 for <xen-devel@lists.xenproject.org>; Thu, 09 Jul 2026 10:39:12 +0200
Received: from TYCP286MB1053.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:af::12)
 by TYRP286MB4389.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:132::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.15; Thu, 9 Jul
 2026 08:39:08 +0000
Received: from TYCP286MB1053.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2067:ff0e:4c3:ad0b]) by TYCP286MB1053.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2067:ff0e:4c3:ad0b%4]) with mapi id 15.21.0181.014; Thu, 9 Jul 2026
 08:39:08 +0000
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
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=roRMH+6nFxUDhV++FMs2MWNgVTUuWE+47sv7nQJZuXTlpct6NnoPUag6VND4xsG8VoZrRZv52zDDd7wEKVvdVQrT6VFY7FOFaIvLDPicNSNWo2Niz9JHOUa9WUEUF+zXsidieZVVXmOGGU9c4PJI+OAY8kNKY/Lc6IF9yKyjPNXgufpPxs8zpZNdeHYAyAb4B14FztxIYyQISNggmMEyU1+rcptsNVyruHsKbeGPPGefovmqqME/JGlD85442dny+csBAj3XP2rt12uJ+CmXOdkm2swP7JS14wh3Jqso5TMObNAguL8SZ1KHTMWYVMXgSjoVuJw6k9zO30ouLVjWyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iOptUrsPdEoTFj6Wze4p/9x+ulfSVC4T8O3PgXi2kOE=;
 b=XGoSsMUkgd6IFeu1qqWwbxkN/KG9hw0UOhlekfqH5Ox03ARGqjmHyBJVmrEPC50Fix5MsgacZdtlAf38OawWlltN7IdTubsVr6gFm6WYmEa9kFm9afSKzxuCcxg4vhD7/2hTKJzsp3NiDSoKXhbuwBrBH5G1eGkUk0ti/X67iYnYP0QcpKUPdoceqizNDnx31tGvEnqMrY44TPS1dHYEWRC14+RTE3ICZ5047PIdRXaKXXGKIqNvpfvwIP+Ne/KNAdmrYTQu4k5e77q9V4IiTHJIS9rlqdVuTJzq8V2qjeRR9rvOcPtOAiSrfbRzlP2ii+spnwu6aV7DB/vXblGHnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iOptUrsPdEoTFj6Wze4p/9x+ulfSVC4T8O3PgXi2kOE=;
 b=Cc6ZAmBwomDTIH95drQpRrVZCEH0zgAMSlkyIfP6urtPLIwyvDD0yr5TtXsy9S11GyHV7TDtyH8sE+0ZJnvHrDV+x4CiXiG0+Dmi9/O/gRDO4YO6ioVmsxkMa2cZEkTA7Xx7VJ2lbuiU3dYFfACRD/rgD8w/zVjw5dl5fWVpybU=
From: Ryoji Okamoto <okamoto@valinux.co.jp>
To: okamoto@valinux.co.jp
Cc: Anthony PERARD <anthony.perard@vates.tech>,
	xen-devel@lists.xenproject.org
Subject: [PATCH 1/1] update struct member
Date: Thu,  9 Jul 2026 17:38:50 +0900
Message-ID: <20260709083850.214088-2-okamoto@valinux.co.jp>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260709083850.214088-1-okamoto@valinux.co.jp>
References: <20260709083850.214088-1-okamoto@valinux.co.jp>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYWPR01CA0047.jpnprd01.prod.outlook.com
 (2603:1096:400:17f::12) To TYCP286MB1053.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:af::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCP286MB1053:EE_|TYRP286MB4389:EE_
X-MS-Office365-Filtering-Correlation-Id: 44bf240f-0a64-4b8c-6d22-08dedd958ae4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|366016|376014|23010399003|1800799024|56012099006|6133799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	xRrvcHdFxj79wNO9KAj11E0V/+Pa+JV/aBr7NIiG+CGkEcQ+mqSgH6LiBjfhnuAJRGekr3QS0A2EshZmOuduWq4iDUgkyNzzWlD8ksYbG3sqwxqkfFNGNdpGyT2tMva9bMprnfBlV5PXUvAufgdLEMd4PpP3xu0me4JWyvOjx2GeiI68Tyxxfw3hg5Pw6ATxEbXGH4EuT41gg/ku5ScS1BBqU7VbPORWAMxhyGcEJPfzepTobumraTEoE40v0uNe4X92rlgVuRXJh4Rz+u2c/etF6OSb8Hz+usy5UtecCyrKRFxrOtcvNqkhVCXQDEwLfHpfiwdnhy/rRHz0QeQYJH+NvFPaXawalRgHgHW4LF5sR98aHVnn+1ovMC+m++r7Zao6Wz0Vn6GrhGZffYui9Na1cO6Px5UP7YU129qgpinO2Iy25roWH2o9+N8xioV5qGbyZ7p0cdaMDfQGmmhVIGjom4cdxltTYhLAsLGSOf+yUeurc2ZVude95KtegunFB2igOOlnWWZUHaZXLuxNfZdwCS5V0yuX+zPzaBiKkigw8skOZHFfPOOLs/ANPOU63SIiLiarxL9qsidRnUhmYlg93Elu7SGLZCqXPeljbqD3N1tymvYtt2Je0xyJ9NrUEFmQk8xpsjDSU4q0ZxI31NeE6JXBlaqvCL9wsSF9C9A=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCP286MB1053.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(366016)(376014)(23010399003)(1800799024)(56012099006)(6133799003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?bal6hklRv8WrPhPxoJBSitQMgf/6bVQrH3vuYXqiJD8S3fTly5jQyLkBmkae?=
 =?us-ascii?Q?4+/5zfLsZzJh5xXgWQ8CRHclJulSx1X7pWYZ+ikpMnMK1uUbG06/odhrYgOH?=
 =?us-ascii?Q?KXCk2q2fH1hhp+IUfCD2SDXFNcCvteq9r7QxLAcN4TFA+rert4JxLc141eii?=
 =?us-ascii?Q?HCYWzjYrTJAfHduZw8jceKvL8vS/04K8sF/fHijvMactrL0jl4TPKIxb+6T2?=
 =?us-ascii?Q?vsKebpfsFyFmERWlQCaxOoEo7RcUjzutBq2s6LlT77HogNITynmw3tl+easJ?=
 =?us-ascii?Q?cL0+ncZHDJX1EDiMB1LOSqwKcQvzkABTLx9qef/bzkWsICBUABoyvui/nGBB?=
 =?us-ascii?Q?9S6jV9VIZn4r7Ka4kPloIKvqSRSGa0bTCpU2QZj5wPEwVRsJ0t/8XKLaWOXM?=
 =?us-ascii?Q?r5lxA/3Qh+OMGRAN2JeUmWM+GfgMA4Jies+RblQyQLG0ilCXA6XOxn6RWouK?=
 =?us-ascii?Q?ZEMpqs+Q2+aSoqVGIXaV+IA6nVIzf91Lc+BUz94OA3ow0fgcRXBaGMnvQcmO?=
 =?us-ascii?Q?dQWmFM+4RbOnq5MUzoSslXyGtdWk0eJ/d0TVFNyRhpuJaQU+Q7ZIvyP//lS0?=
 =?us-ascii?Q?NHlpCgr7S3ifJpeFyrTG48gP6ya+fc46imXex1jDdpj0DHg8JkAUcU+uUNhv?=
 =?us-ascii?Q?YJO4CwpFQmWxMw1xGZD43NJGyIU3qvKz0Vv+Jyrhu7L5crgRxF+W53FZq9VU?=
 =?us-ascii?Q?avzn66b25cCtZE2EJFRz9s2rPVVFxrkj3OD4Zar1YIqfRcgmvRiLIwvrSROk?=
 =?us-ascii?Q?3zpbmdqHezh7jyZma3wRsSDeYRcl73/aQJRbRsJanQT6/fw1OFF3gRSHtIM/?=
 =?us-ascii?Q?SnyrFt9+l9cTuk9K8G4kI6+BpUIXLZX1nll8QjRZFiPO1Mp9OKxjpz/OJDLL?=
 =?us-ascii?Q?UPhBE85cpPnZgwTCjEQMVB8iZWclBHwGXy18wVlvrG62HuZSU1d2qqCAJCCQ?=
 =?us-ascii?Q?czkDXII5APHVK3dX3xzdjsntKUd7Xg4f1yJqh7csc9pfB2SvHdoRgPgj3ngk?=
 =?us-ascii?Q?O8x5Q5QQZP/lyyDjkMm6S9YSRi1yBwe0kazo9R1t8IhiFnAv45A7DLLKDXR0?=
 =?us-ascii?Q?Bn+DJyhWdQyhZb7fJf7zSFHP+YGJEKrga+HbyHft990T5QxM7uBeeud1HRCl?=
 =?us-ascii?Q?2STQOBMolXIc2HRdEKrrqfjsaw6jPahAv1rdtNHldaE0jqYUFay+6YZu6vP5?=
 =?us-ascii?Q?DIk5I0YXU4sUbdPTP66ywYtxX6jG8KDpfeZEE9EyeumeOF1a96MG/kTvs9qq?=
 =?us-ascii?Q?3m/rHW7TXw5rQ9RbhCOo+5d2hG1Rds5kUGf4Mh3uVH2FICNhWIpl2Ex07ejT?=
 =?us-ascii?Q?v1Y99uA7oeaDeTzDZqy2k8yQaV6G0pd99xWmvtw4iSR7y9iAI+oVxpapA3oM?=
 =?us-ascii?Q?eHR6OeaYDrB6RHFXesyLbk4coaCZJ7G5KVUlAB6zx1SdueH4r62rqFGEf5e7?=
 =?us-ascii?Q?x4RagpxSTAyulcyrlX2XgwaTZzVnouxhLYdReFQ3dxymPeQAfr0PG9gDsiHp?=
 =?us-ascii?Q?VlNv+rDvL/0LTf3bKo2XNY3vHDf/bkMZerYRuxvA60nJJVZD0ZHVBbGD+i05?=
 =?us-ascii?Q?NgduYaAaO7k8cnKo7c1v51Lawt3YzAnwRda4Rv/Kqb4Y8iv2MjQzGI1XnaQ1?=
 =?us-ascii?Q?HndnB+63BUs2isu1PlsnnO+6X2G3vNv1nXAse3IVGEYMkmwPHttgyNQwIyYh?=
 =?us-ascii?Q?T1maRfWv892Qvz3kv3MKc9BeaZpZ9WlcfauShyk0mTOIis1eDoq6nIZC8M8Q?=
 =?us-ascii?Q?IDpSe9Ijs0+QCeE1Z9+KgaG2OtR2DkVSmIk1Wq2U9rxQW2MTKnKA3TZHXZaD?=
X-MS-Exchange-AntiSpam-MessageData-1: B+5bdQzZqJF0NA==
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 44bf240f-0a64-4b8c-6d22-08dedd958ae4
X-MS-Exchange-CrossTenant-AuthSource: TYCP286MB1053.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2026 08:39:08.4256
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UoIAiHE8CfIcd3KdlArG/pgFNgi2qmk7jfMQ6f4bb7gRPSHftqUgDmr8bkGVHbR7ofiC7f0kcmR/uKOWp39PEA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRP286MB4389
X-purgate-ID: tlsNG-ebf023/1783586353-2E7A61CC-034B8703/0/0
X-purgate-type: clean
X-purgate-size: 651
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.69 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[valinux.co.jp,none];
	R_DKIM_ALLOW(-0.20)[valinux.co.jp:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:okamoto@valinux.co.jp,m:anthony.perard@vates.tech,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[okamoto@valinux.co.jp,xen-devel-bounces@lists.xenproject.org];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_THREE(0.00)[3];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:from_smtp,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FROM_NEQ_ENVFROM(0.00)[okamoto@valinux.co.jp,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[valinux.co.jp:+];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 76DFD72E645

Signed-off-by: Ryoji Okamoto <okamoto@valinux.co.jp>
---
 tools/xentrace/xenalyze.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tools/xentrace/xenalyze.c b/tools/xentrace/xenalyze.c
index 42feeb282e..1187c78d5e 100644
--- a/tools/xentrace/xenalyze.c
+++ b/tools/xentrace/xenalyze.c
@@ -8039,6 +8039,7 @@ void sched_process(struct pcpu_info *p)
             if(opt.dump_all) {
                 struct {
                     unsigned int vcpuid:16, domid:16;
+                    uint32_t priority;
                     uint64_t cur_dl, cur_bg;
                 } __attribute__((packed)) *r = (typeof(r))ri->d;
 
-- 
2.43.0


