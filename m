Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6E28K47dumk3cwIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 18 Mar 2026 18:14:54 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 155322C0049
	for <lists+xen-devel@lfdr.de>; Wed, 18 Mar 2026 18:14:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1256497.1551093 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w2uSp-0004Np-TO; Wed, 18 Mar 2026 17:13:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1256497.1551093; Wed, 18 Mar 2026 17:13:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w2uSp-0004MA-QD; Wed, 18 Mar 2026 17:13:47 +0000
Received: by outflank-mailman (input) for mailman id 1256497;
 Wed, 18 Mar 2026 17:13:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EGn0=BS=citrix.com=ross.lagerwall@srs-se1.protection.inumbo.net>)
 id 1w2uSo-0004M4-4h
 for xen-devel@lists.xenproject.org; Wed, 18 Mar 2026 17:13:46 +0000
Received: from PH8PR06CU001.outbound.protection.outlook.com
 (mail-westus3azlp170120001.outbound.protection.outlook.com
 [2a01:111:f403:c107::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d1bc3c5a-22ed-11f1-b164-2bf370ae4941;
 Wed, 18 Mar 2026 18:13:44 +0100 (CET)
Received: from LV4PR03MB8282.namprd03.prod.outlook.com (2603:10b6:408:2d8::11)
 by SJ2PR03MB7355.namprd03.prod.outlook.com (2603:10b6:a03:557::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.19; Wed, 18 Mar
 2026 17:13:31 +0000
Received: from LV4PR03MB8282.namprd03.prod.outlook.com
 ([fe80::19b5:9cc6:3b73:3489]) by LV4PR03MB8282.namprd03.prod.outlook.com
 ([fe80::19b5:9cc6:3b73:3489%4]) with mapi id 15.20.9723.018; Wed, 18 Mar 2026
 17:13:33 +0000
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
X-Inumbo-ID: d1bc3c5a-22ed-11f1-b164-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Xt3ew7OZnw7ZkJvIgqyqd9Fo8cf0/2pWgWzSNkvS71Gue3tmO+AxAT3yehqZM4IgfVIaJ5ExvlZ7ZHBqEyzGOU8RVBiE4sdDo33xqrQXtQyJx96pfRrqrIb2wv3yN59rfGczsplrd6LDhPzf6HKuQowJS1gESEPjcqBNo+owzbRs+yheLrmMHOxV9oPZdMirPoXFHTZrWVpugnenMnaqULrXLSV1BexFP36KWX3Vj0cc8qwZ3UgNuZ7imOjZ3gt4c4EJEWQKjHYjTlsjKn4b2yKJxWlIfrkecIXwtATG+bD03x1hlTEOqspGidSaWM2lehcl2qGVMaVUDhlNYCXGiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xOSY9UtMZS1bFLCO9xPmBX9fiyIoFhDZrdg9EpZdgfU=;
 b=fkE9Y97BjQI7DOqPkqp6YQN6G0cNBTH3D9HDzAcnZV1NMz7pHlhZDMar1rxQA7oW/3hXjfUSY07qUy0oma6TE9O7lPKZW2IOsrkUkm7VPIMXzA3qUCpKW+ew89MoyDZxLt+SlOK2yDj8zN9vNn60rXO+VEKgnS1SV93hhuoVqrRwhWcqbsQUHYFKqvMynp66OvKlY577rKgAXsone2bIVKFvmfYCvXIQQRmAR754uCUXlHAuVotWQ6+IRdd9HS+Cv2qSlhZ5TctUBXHVf1uZbh+43EtF+sE66GxMS2GqnxAY1Rbrzv7rEycYVju/3YJwjH4fyRcWG1zHKXhBZ/pyUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xOSY9UtMZS1bFLCO9xPmBX9fiyIoFhDZrdg9EpZdgfU=;
 b=TFooy/DP8VLgONQ166+szextElhQgONrm7/uHNIF8y1lI09WjbAaDiwIQ6DqmFV0AWs86sUDvdZvm8k2nihY9fQqYOmyI6UqrWe2J0hgCDqVMuY71jdneSWk3uryIBTb7TbTg3hqYj/agS9wKsjypa1mFiUbj03JD0CObr1fu48=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Ross Lagerwall <ross.lagerwall@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Ross Lagerwall <ross.lagerwall@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH] x86/hap: Defer P2M TLB flushes
Date: Wed, 18 Mar 2026 17:13:24 +0000
Message-ID: <20260318171324.1362219-1-ross.lagerwall@citrix.com>
X-Mailer: git-send-email 2.53.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0611.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:314::10) To LV4PR03MB8282.namprd03.prod.outlook.com
 (2603:10b6:408:2d8::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV4PR03MB8282:EE_|SJ2PR03MB7355:EE_
X-MS-Office365-Filtering-Correlation-Id: dcbba424-1c62-4157-0929-08de8511aee4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	vdSWkOD2CoLKQu1XWyhOaXm6GL9FvnBI3EWw6Psu5pKWMaupHMUG9dS6puhPxmAU1DD7xwd2pJ0C/k/RSu4aDXpOXmuwmnBAs6PSbQRdihR/HESffFm5//lWcCQRCpHAfHDcNp8HnFSc54Ks8O/CGRK64o/gQQ8Hl1F73SDgVPTUe9sRnpWntKRatA3a7T1Y0IkFzenoBqJDh+9NUs7DfVIKnTmEXCSmMQmiygz376Fslsf+8TDj2vza41fDrup2tDae/0iOm9wUD02TSD86gKUecsKhzcTeR9kMVMV/ww/r2dgIDkV92YwtFcokNBmymzMKFnNIaMm/ADyQ/WAp+wONPBQckcA3lBMeEDQdmdgaZD16/TeclCmwcE+wOZ7PrKV7U53TPXWsktUsPX/m/wzYzuBaJEJzhsXAsSZB95UCyKZYdm+1sy3pfMY4A3YHJ2mLmZIfYsz9osz7a4aTtHi4hx+0CqsZgoa07BotJxtcpCyAw2zwFyqoyKaCK7mZ0mGnbBLKZRjF0xWWsW4MDcZz3HbcVXFMrhi5WE5tbIsttUYiB/yWy/Od2iSEmIyrsdY/vkVaSax95ciqA+ZpHFdXl+P4Rhi7sGeJwuPIIAAUFhWLf75jiEbsYJAwhTayMLG3GT9lgmDT4Hk7m06Y2PZDn/28dzIwhXd/YDo33ENC9b6x3ZEwl7pYRtWHjwFDgCjNdMTjm78DKhzMdeudp3l016iXo5pS9yZJgoBypXE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV4PR03MB8282.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?uX7p8kDbT+wCy9gzya3wtl38Ey6KFCjV7jZ1u22zWKTwg4DbsmR92p3dzd/z?=
 =?us-ascii?Q?uwA8BLRt1CqJkfHqUsXFGB6QfZXfUkVawy/6JrMMwDojSSSuyRyWkilps4t7?=
 =?us-ascii?Q?Cmk4lZRclbuiliG5MCeaxmc5Hd6BVF66pQUNazHH88F8LVMs4RtjGnHuyet6?=
 =?us-ascii?Q?lBn9+G1Yw9i3Yzwen/jtzOJWEJsn1hHgiYZf4r5o0TNZn5wteGlQw4QJ5vaj?=
 =?us-ascii?Q?QPj6Xxyh/FITvP1MYWaet80MVYfpLOuz6jTv6jhCvUq57EijYAZWmKlOmus1?=
 =?us-ascii?Q?N5vQpA83r3wqBBpTf6J8BuUUWPDHJ22BQH3UGsCLM+mYz5RSz0G0YDFjIv5F?=
 =?us-ascii?Q?73BHirKLJ3EbpDCo+vyDgQXC5YlHNcGERe2aKg4/OnwXKCNeu9p7w5BmJOp3?=
 =?us-ascii?Q?YX4Er49poS1dCTkuMxrnEkp0pX7k666ojPjy24/Gk5SfVtx5srXcLsl5+zlb?=
 =?us-ascii?Q?73m+8BQc3Ar8uc2sDi4oI69jD997Tgcu+Usue0IRQxMxArTUXsENmTKtbUTR?=
 =?us-ascii?Q?s0h1XQLQayEnaXHNuqF9kUXBG2m3v9M1I8gL9Fv7vnukmpqO1MvnKLi9ArO2?=
 =?us-ascii?Q?OIfcdCBr3d3k6P5YU1jHdDtd1JZ3sQCGLZu6uMcFCjGCIApzhLLUmwXLfr1h?=
 =?us-ascii?Q?2/C0TJtte6A3ojfP3fSz+aJ4y76SdwJtdiOgNgjfAbz7dKPFT1T0VrIprp+Q?=
 =?us-ascii?Q?Mp1Ia9IddOv+ycQssMFrk6y4Csduz7hwSId20ngzGxGvna6V2ma6FfDvUslU?=
 =?us-ascii?Q?7jPUuAsJTUXVnxxx7b2ObZsdIrKYXqkBb2rgTD/PCcjNsU3V/cJ9UDZHpvoY?=
 =?us-ascii?Q?Ows5mTBge3DQA75m6499OnTHuUUyZjHemr48pY2VMBP5GlXoLhrRrbx5bj48?=
 =?us-ascii?Q?aOMFCQvuVX7Man7CXI2fXcS5CjfsZbwTvdW1f3hzbDbS8W0Gr4s/7r6C+6TC?=
 =?us-ascii?Q?nwOX7lY40X4zmvlMTvSlccDD7j5qj05RN3/E09+cveEg8I7b0bbePiPCYFBR?=
 =?us-ascii?Q?mwOp+th+UPwhqo5flL0X09iQ9/1JHsUnBK0veNohEC203++BaBTrx6/8gN2+?=
 =?us-ascii?Q?S7jmGu6PQNvWrZ5EGlYFZGZ7/OcMnj0KagwYoVfg7nylyUAxCMbP3p+/p/0A?=
 =?us-ascii?Q?y/QtZLzTtFA63MzYK6kxzPehBetnLy8xm7lvzHrU8hlJ5/SwU7YLPWylRRHB?=
 =?us-ascii?Q?4raFbYfEKEzEAVj7WvH2bSPZNFBM2gnfI4UmycZ/+ui4TZElfWnLWATeiWFn?=
 =?us-ascii?Q?M7Xq0rAWtFo5y/LRCUbv+Q0GBPK6GwBwBRUj+ybliwx+86dYK+g+ZtlO8bqE?=
 =?us-ascii?Q?Yf4qpMWc1KkZAIfSC1mOAE0es3/WQhMhew9dZFXPhTugu85oWwIbfaYFCDKn?=
 =?us-ascii?Q?4mamacqvxJeElnJYDw4+FGGX5N+nU9tzL1c8R2hnopDQcos+eXxAomA+epY6?=
 =?us-ascii?Q?IDtDzCFP9/qrI1slnrf++Ca7ECQvZc+ww0+aEG7mcSyCITdCXmAQ65PtsZSs?=
 =?us-ascii?Q?F05NajwN9cY5IbYdntIDoSC0BW1CRPA/BrSv4PriSKSfOtNYzxyYDf0Eqh5Y?=
 =?us-ascii?Q?+SQsxcOekY99iEGsImoaUwDo2Ldiydgit8eNrd6fmKaBMozkx96tvp5aJkwb?=
 =?us-ascii?Q?/by7mBPyDRwXBgcRq7oriwWUB3D1VMsRO3k6O4H/+Otca2PXisMro0O5lR72?=
 =?us-ascii?Q?MgbjGPPH+T8P7zU40I/hh0qyfghdCXp+7ypG6Vy8neTpmQtDDAA9NMtBGNSd?=
 =?us-ascii?Q?OvRGjlPe3Yg0RNM+0yd/L4kXeyTG15c=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dcbba424-1c62-4157-0929-08de8511aee4
X-MS-Exchange-CrossTenant-AuthSource: LV4PR03MB8282.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2026 17:13:32.9541
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HunjT+JC1/zw0rWIJzyDImwSQSVmuP9qD3qY/IFYwU10KiuPxuRc/RfDGXbQX7bFBooXiLDtdDukrNIDrBWFqvHS9WZf9Z+ZU7MwfMHqzkg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR03MB7355
X-Spamd-Result: default: False [-0.69 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:ross.lagerwall@citrix.com,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[ross.lagerwall@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ross.lagerwall@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 155322C0049
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Like the EPT code, defer TLB flushes to reduce the number of flushes and
avoid holding the P2M lock while flushing. This can substantially
improve performance in some scenarios.

The cases where the TLB needs to be flushed without deferring are
already handled by the call to p2m_tlb_flush_sync() in p2m_free_ptp().

Suggested-by: Roger Pau Monne <roger.pau@citrix.com>
Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>
---
 xen/arch/x86/mm/hap/hap.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/mm/hap/hap.c b/xen/arch/x86/mm/hap/hap.c
index a337752bf488..1eba995c7b39 100644
--- a/xen/arch/x86/mm/hap/hap.c
+++ b/xen/arch/x86/mm/hap/hap.c
@@ -813,16 +813,26 @@ static void cf_check hap_update_paging_modes(struct vcpu *v)
 
 static void cf_check
 hap_write_p2m_entry_post(struct p2m_domain *p2m, unsigned int oflags)
+{
+    if ( oflags & _PAGE_PRESENT )
+    {
+        ASSERT(p2m->defer_flush);
+        p2m->need_flush = true;
+    }
+}
+
+static void cf_check
+hap_p2m_tlb_flush(struct p2m_domain *p2m)
 {
     struct domain *d = p2m->domain;
 
-    if ( oflags & _PAGE_PRESENT )
-        guest_flush_tlb_mask(d, d->dirty_cpumask);
+    guest_flush_tlb_mask(d, d->dirty_cpumask);
 }
 
 void hap_p2m_init(struct p2m_domain *p2m)
 {
     p2m->write_p2m_entry_post = hap_write_p2m_entry_post;
+    p2m->tlb_flush = hap_p2m_tlb_flush;
 }
 
 static unsigned long cf_check hap_gva_to_gfn_real_mode(
-- 
2.53.0


