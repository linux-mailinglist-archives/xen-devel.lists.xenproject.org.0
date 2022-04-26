Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D39CF50FA55
	for <lists+xen-devel@lfdr.de>; Tue, 26 Apr 2022 12:24:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.313699.531394 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njIMR-0008EG-9g; Tue, 26 Apr 2022 10:23:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 313699.531394; Tue, 26 Apr 2022 10:23:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njIMR-0008C1-68; Tue, 26 Apr 2022 10:23:59 +0000
Received: by outflank-mailman (input) for mailman id 313699;
 Tue, 26 Apr 2022 10:23:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=urB8=VE=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1njIMP-0006S6-C6
 for xen-devel@lists.xenproject.org; Tue, 26 Apr 2022 10:23:57 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fa69d5e6-c54a-11ec-a405-831a346695d4;
 Tue, 26 Apr 2022 12:23:56 +0200 (CEST)
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur02lp2055.outbound.protection.outlook.com [104.47.6.55]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-31-05FTq-RQNNW-XRPLGOZsDA-2; Tue, 26 Apr 2022 12:23:54 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by AM6PR04MB4245.eurprd04.prod.outlook.com (2603:10a6:209:4f::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.21; Tue, 26 Apr
 2022 10:23:51 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f%9]) with mapi id 15.20.5186.021; Tue, 26 Apr 2022
 10:23:51 +0000
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
X-Inumbo-ID: fa69d5e6-c54a-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1650968636;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7XE0MZ5Q/V0/alHvDtFRmInLwfamZyLpxplt2pkODz8=;
	b=P0MJVeAB6UEjCsi/r6Zlz39ExjXLUzY3kMOcCk+zPodraQb/llf4r59p5IZHFRDAXFrjZZ
	ByDrrHZ6lTjjO7V8V30UBoBxpOJX4vcJ2DMk1z94yMmdgcCbsLGS05phvXDFFAPCblwl7C
	CillbuAGf8NO6ifT3jtQxLwUVB8emIA=
X-MC-Unique: 05FTq-RQNNW-XRPLGOZsDA-2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O57Qh6FhRQ0Xc8/yaMe26SYHIOBBRcV2A2QXeyX2OtPC2q6IPpiysUXiPnFcyFzK9ZK3NdyvU9LAD5qRTxE45NOAdPmhJUzo8t4ziMBciMqjiDAk5K8l3dwjNx9CISK0WKlEN0xWM+bns4vNnhkiHHfX9eLcSub2wj0cpgfKfJcD2pdu5Ujx+/q/GTw8RMNRCCRPHFBk8Wg5cHPjaxz7Xw/2jsdb/hR9wtuQQzTOBHqyhSc6MgwWt8Yhn/EKqfIJKolxlRFKy8bZdF3epQ23qNO7C4JYXBtJLVaVct+BhMjmo8UXtpePgRp2g8rfhPPVqH7OADWwN6RY6pWWVyN9dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7XE0MZ5Q/V0/alHvDtFRmInLwfamZyLpxplt2pkODz8=;
 b=FV7IjQn4DEXPLLcYFUqPyaSY5ExVF2ELKJzKoGyAL3xY9IYC61MWgcXt6WQRmICs2p/ZsRKhjqqz3IZIX64objIj9H+hU3nARo2ZrvD04Jzkr+cp3UMJXolKUcEq4THV6GppxfSpVYgvRt0Jz1tEB1unfcAuDkXUThboyQRNayLyvWCa2/VoczsJkBqifxzehKAPNnIjf+ehKle0U863YZRie42XwmPlf12HwFB9p5uOmYiKgMUEEyFOwLYun0Y3MD04Kkrd+H4Tr6T63gAcq7KNFRgvMIIHjUe9EQrkQl9qvZA2jcO1ZpaGGEtEQCVcKaHLBs2B16YfgGkBiP3rQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <1744d775-4446-69b4-152f-c81d36e4996c@suse.com>
Date: Tue, 26 Apr 2022 12:23:49 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: [PATCH v3 4/8] libxenguest: restrict PV guest size
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Juergen Gross <jgross@suse.com>, George Dunlap <george.dunlap@citrix.com>,
 Anthony Perard <anthony.perard@citrix.com>
References: <a0f019c5-4089-e19c-6041-044d6e93d80b@suse.com>
In-Reply-To: <a0f019c5-4089-e19c-6041-044d6e93d80b@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P193CA0064.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:209:8e::41) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 635dfd18-0c15-4153-b886-08da276edb94
X-MS-TrafficTypeDiagnostic: AM6PR04MB4245:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-Microsoft-Antispam-PRVS:
	<AM6PR04MB4245772E936C7E496A993AB2B3FB9@AM6PR04MB4245.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	DjYboPnQ/p/2Zsazk6LIrJywIyRlsHPxOTqzm7vuLH9yYmk1Hum3hbf/znFQH6c7N+frPkUQ3w3AyKHs01lUFLY0l+HrXqy4QGDdMgj06eW2ij0H7A1MSH7oBpHd1XbYVDoqgyV/4DxhS+WKofJwBjkOoGPoozLvqL1vwa0MHDEnCLCXFSqjpgRLwQk0Kl7w3N71xxl2QzqsFLnF6qh+9IT3hvcEzzw8x5noMBUTnOALNKkEIaW3sx5sPE1A4R65TeuGnXhTjmW8Rzjv6MU+1yEUbDb9Zp3WFWcrtT8TyiwkztcjBki4cD0gzpMMGfI8Q52+BiQUCMz8FtLcgYLOCm2gdmX2gjWvpjrFboR95j1mrMPRBFHZcBhxw4Y6fpdeRxARCdttidEXmgjSFaKiVvsD7n7gOI43cfrW9dUB1B79bWvijqhcID5L6Pcs0g7ZDV3Z8Lg+HNPbY/vPi+DE3vIfgfDLXmOor8XjvhcGaM/LIJT4TMdNn/xuoXb+GDhJ9x9LGlqIptGZ7T6BVdY2ptLV3ZoGOBifsfvfRG144BDy3t4SJJRXlBGymYj/ILUUPmzFmz279WuhgqaRky6z81XK11N1p1MjXI4NbGr9WMRXPLG4jDLeJMhfIJOKEtGy3pmkvWBBcqUlWpNyTU6/SfxtR7RJfY78ikiTFm3YrD/FCeQHoKzBTT6zuFVBHfcyu4363Qme6p0yUlg6p5q0Hd/g0s09Cq1614jy7rYxGYU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(2616005)(31696002)(508600001)(6506007)(6512007)(6916009)(86362001)(186003)(36756003)(31686004)(8936002)(4326008)(38100700002)(2906002)(5660300002)(66556008)(66476007)(66946007)(26005)(316002)(54906003)(6486002)(83380400001)(8676002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bk1sbkdvcHQybXpnenN2ejR5YS81VDY1SkIwSmdxT0VDRy9ZdElVVEJrMDhk?=
 =?utf-8?B?VFF6S2tZdTIrWlJhc2xNKzJjWkZWTUFiU3o1bWNNM1dTTk0vVmtYdXZsQU9Y?=
 =?utf-8?B?V2NWaXBsMEFCMDVUSkp3OE5ZV2pIOVY0MzdTKzltSFFMZy9xbHU4Vjl2V1RS?=
 =?utf-8?B?aE9lWVp6cDJDbFZnTXJtemliL09MMGpOMWZkWXF3THN2SGZTcnFjN2tTc25r?=
 =?utf-8?B?N0lWc0FITVZSVHpDL29QbWI1ekNJNWpDQ3ZaY0svQzhQT2lmN3FrVGhEMld1?=
 =?utf-8?B?dFlCM21qc0tXaUhnaG0ybTdQZE9TWGtqM2RicUFXelVpNWU4d2t6RU12WVJN?=
 =?utf-8?B?ZThXa0hSWW5HLzdIWXFFdkxXbzBXRXNLalp2NE9FN3N3QTkvR1lBdTAwVWcw?=
 =?utf-8?B?OWxRSFVqVjhvejJhaGFDT1puQzA5alJZSmpNdzZPVDl0VHUrL2NuckNxZEZH?=
 =?utf-8?B?ZHhvN25iNzcyS0NIWnBlWmFVejA1elVvbDJyZ2tGMk9EcUE3Qmx2UnJncXcz?=
 =?utf-8?B?YloxSWhPdXU4ZUlWZ3UrTzFTMnZKcXp3YVIzMG1rai8weGgrRzkrR0xwRStp?=
 =?utf-8?B?WmljbFpWREoxTzF1UzVlVC90VUl3RTN4QWRvYzl5VWZsVk5NcTZFZTVPS2cy?=
 =?utf-8?B?OFFUZysvdDNKa2hzcnkrL1ppVklyMGkvQTEwSTFsVzBGelJ2cExjUEN5eGRw?=
 =?utf-8?B?emo1ZEsxYmJ2M3o2SG1aWFRTOFhXOUN3RnkyRC9Bd1dmdlVaSmk2V2dBUmVW?=
 =?utf-8?B?aWx3OTNtOStoY0VETU5nS2JVd0xPcHNMV2JwSDM3bXFIajV3NXcyTlNJcURS?=
 =?utf-8?B?QWhNRGVaQUpkSXd4TEVLdVo5WW5UNzRhQTlqZWE1VnRnaWFTcTNvTmFCdHF1?=
 =?utf-8?B?TVFEUDRadGR1clVERW84dzh3cGErd3JFN2d5M2JwaWhCeEZwZlFsSEtwTWdt?=
 =?utf-8?B?bTAybDN6Rk44VTVwQlJzR2xKbWttK043eDJJamY1dCs1clBjUEtYdjE1ZEE1?=
 =?utf-8?B?QzlxL1dWVmlEc2pOR29BZGRIUmFsclVIajMreEt4NklSMDltNlRBK0VISHpD?=
 =?utf-8?B?RXUwMkJ1MC9melVvTm1rQnFpeVVDdGFNRmtIRWh0SkVpSW1YbVZrR2FSZU1y?=
 =?utf-8?B?bUY2b25FdnZIOUZsRm1nRDEvb0NqVlN0Y0pKTzFTUDBkUzBIUVhwZFJmTWxM?=
 =?utf-8?B?eDhLdnA5dFJkZEV4QUNVZ01HdWRjbFlUQUQyS2k1SGVQc2NSa2g4M3ViU1gy?=
 =?utf-8?B?MTdiOUJWa2l0UXVVUHJybHBMQkxQS09kanNkakU1ZDk1UEV2KzhGWWZPN2xP?=
 =?utf-8?B?T2tpM3k0SUlIUHExTGw5bVZGM1cwMjRVdmp6TW96Mk1oUmZVRXA1eUlLWnhO?=
 =?utf-8?B?Y1lSMitoendHRG9VWHFpYmJZeWhPbCthVEZhL096eHFyeFpDa0pGZy9kai90?=
 =?utf-8?B?dnBzeFV6WlAzdzcxSU4wMVVjVHN3TS9IcHZsdUszYmd2cHVNTEx2eEdubkQ3?=
 =?utf-8?B?YU9wZElDbWV5eUxkVmY2OWtkNTMyOUtYS2VpZGRTUlJaYTNIN081a3g1bmww?=
 =?utf-8?B?TVRPWXk5YW50a1EwWUYwcGpVZHQ0NDhjeFJadE9yOTJNTFNEdDMwMXJ3ZWk5?=
 =?utf-8?B?dGdmY2NjamJBV0Njd244SEk2enhnQm9IR2dBUVh6YXV2T1V2RXFIRjAyUmt3?=
 =?utf-8?B?Ym5LakE1cXp2T2c4OXhNdTlpQ2x0NnFBNFBFSUpRYU1TdlNKVEptZ0p0bEFz?=
 =?utf-8?B?ajdnSEU5S0M3YkNLeFJKYlBMblQwZ2p4bGNHalBNTWk1L1VqN0lqZjR1dHdV?=
 =?utf-8?B?YVlKWTJLZmxEd3FUcXJhK09oRDdmUllPSVlPZ3R5cXplOXNhOVN1SUdlWnZt?=
 =?utf-8?B?M3RDMG1ldFNNcjRhYm5oSDhPOThyZ29GY0dteFVvc0ttOGprVndwdXBQL3lM?=
 =?utf-8?B?OSs1eVN4NmF3Mi9BaWRkbWRMenhzanl2REp5RzNEcGFEVytOMlZiaW8rVjRG?=
 =?utf-8?B?WEROdEhHSjlaUTdYY2JxemEyWWtUaVYwQkJydnRJaFAvR2c5OVptRmpGUWJD?=
 =?utf-8?B?TDNCRHhBd0JlRDlTMHNpNTJYL2c5VzNvYnpLeXZXZG1WZklQYmJsZDdIc0FL?=
 =?utf-8?B?aDJVZWwxdVl4dUhEc2ZWa1dwd1J5dTdqNG1kb29VS3JDZ1hzeklnZ2FPYmEw?=
 =?utf-8?B?akwrc2c4cW5NL0hwZGFYVTdiL2lTMEVJYUtINUlBckgzT3Y4cUtmeHE3bmVQ?=
 =?utf-8?B?TS9oaDdYaEtCRU5jeHdFZFBCSDR4VmI4bERpQlZnL2hJUFBrOHNGSTRqZnJZ?=
 =?utf-8?B?dmR1NnYyQmxSNVFBN2cxQ2lzYVNLbHJwWFlZM1NFeWRRMzh3MTd1Zz09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 635dfd18-0c15-4153-b886-08da276edb94
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2022 10:23:51.1282
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tlmkGKa4+uwA2DbbFUXoZap0+sx7AubJo80rVCAlQk0SrCi9WrspeGs4jTAckoYAISmG12e6sSUXAgf+/9aYWA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB4245

The P2M, the use of PFNs, and hence the maximum valid PFN are purely
software constructs in PV. In principle a guest is free to use arbitrary
PFNs. However, at least page table normalization requires that PFN space
be, like MFN space, limited to the architectural 40 bits (52 address
bits). And of course a 32-bit tool stack places further constraints.

Bounding the values also makes sure that various subsequent calculations
won't truncate values and then continue with inconsistencies (see e.g.
fl_entries vs ctx->x86.pv.p2m_frames in map_p2m_tree()).

While there correct an adjacent error message with wrong way round
wording in restore code and another slightly malformed and misleading
(off by one) one in core dumping code.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v2: Integrate into series.
---
In case the save/restore changes don't make it obvious enough: It
escapes me why struct xc_sr_rec_x86_pv_p2m_frames has p2m_pfns[] with
uint64_t element type but {start,end}_pfn both as uint32_t. Imo all
three can sensibly only ever be of the same type.

--- a/tools/include/xen-tools/libs.h
+++ b/tools/include/xen-tools/libs.h
@@ -13,6 +13,10 @@
 #define ARRAY_SIZE(a) (sizeof(a) / sizeof(*a))
 #endif
 
+#ifndef sizeof_field
+#define sizeof_field(type, field) sizeof(((type *)0)->field)
+#endif
+
 #ifndef MAX
 #define MAX(x, y) ((x) > (y) ? (x) : (y))
 #endif
--- a/tools/libs/guest/xg_core_x86.c
+++ b/tools/libs/guest/xg_core_x86.c
@@ -59,6 +59,43 @@ xc_core_arch_memory_map_get(xc_interface
     if ( xc_domain_nr_gpfns(xch, info->domid, &p2m_size) < 0 )
         return -1;
 
+    if ( !p2m_size )
+    {
+        ERROR("Cannot map a guest without P2M");
+        errno = ENODATA;
+        return -1;
+    }
+
+    if ( !info->hvm )
+    {
+        unsigned int guest_width;
+
+        if ( xc_domain_get_guest_width(xch, info->domid, &guest_width) != 0 )
+        {
+            PERROR("Cannot get address size for PV guest");
+            return -1;
+        }
+
+        if ( p2m_size == (guest_width > 4 ? ~0UL : ~0U) )
+        {
+            ERROR("Cannot map a PV guest with invalid P2M");
+            errno = ENODATA;
+            return -1;
+        }
+    }
+
+#ifndef __i386__
+    if ( (p2m_size - 1) >> 40 )
+#else
+    /* Very large domains (> 1TB) will exhaust virtual address space. */
+    if ( (p2m_size - 1) >> 28 )
+#endif
+    {
+        ERROR("Cannot map a guest with P2M size %#lx", p2m_size);
+        errno = EOPNOTSUPP;
+        return -1;
+    }
+
     map = malloc(sizeof(*map));
     if ( map == NULL )
     {
@@ -333,10 +370,30 @@ xc_core_arch_map_p2m_rw(xc_interface *xc
 
     if ( dinfo->p2m_size < info->nr_pages  )
     {
-        ERROR("p2m_size < nr_pages -1 (%lx < %lx", dinfo->p2m_size, info->nr_pages - 1);
+        ERROR("p2m_size < nr_pages (%lx < %lx)", dinfo->p2m_size, info->nr_pages);
         goto out;
     }
 
+    if ( !info->hvm && dinfo->p2m_size == (dinfo->guest_width > 4 ? ~0UL : ~0U) )
+    {
+        ERROR("Cannot r/%c-map a PV guest with invalid P2M", rw ? 'w' : 'o');
+        errno = ENODATA;
+        return -1;
+    }
+
+#ifndef __i386__
+    if ( (dinfo->p2m_size - 1) >> 40 )
+#else
+    /* Very large domains (> 1TB) will exhaust virtual address space. */
+    if ( (dinfo->p2m_size - 1) >> 28 )
+#endif
+    {
+        ERROR("Cannot r/%c-map a guest with P2M size %#lx",
+              rw ? 'w' : 'o', dinfo->p2m_size);
+        errno = EOPNOTSUPP;
+        return -1;
+    }
+
     p2m_cr3 = GET_FIELD(live_shinfo, arch.p2m_cr3, dinfo->guest_width);
 
     p2m_frame_list = p2m_cr3 ? xc_core_arch_map_p2m_list_rw(xch, dinfo, dom, live_shinfo, p2m_cr3)
--- a/tools/libs/guest/xg_sr_restore_x86_pv.c
+++ b/tools/libs/guest/xg_sr_restore_x86_pv.c
@@ -709,10 +709,23 @@ static int handle_x86_pv_p2m_frames(stru
         return -1;
     }
 
+#ifdef __i386__
+    /* Very large domains (> 1TB) will exhaust virtual address space. */
+    if ( data->end_pfn >> 28 )
+#elif 0 /* sizeof(data->end_pfn) > 4 */
+    if ( data->end_pfn >> (ctx->x86.pv.width > 4 ? 40 : 32) )
+#else
+    if ( 0 )
+#endif
+    {
+        ERROR("End pfn in stream (%#x) too large", data->end_pfn);
+        return -1;
+    }
+
     if ( data->start_pfn > data->end_pfn )
     {
-        ERROR("End pfn in stream (%#x) exceeds Start (%#x)",
-              data->end_pfn, data->start_pfn);
+        ERROR("Start pfn in stream (%#x) exceeds End (%#x)",
+              data->start_pfn, data->end_pfn);
         return -1;
     }
 
--- a/tools/libs/guest/xg_sr_save_x86_pv.c
+++ b/tools/libs/guest/xg_sr_save_x86_pv.c
@@ -464,11 +464,40 @@ static int map_p2m_list(struct xc_sr_con
  */
 static int map_p2m(struct xc_sr_context *ctx)
 {
+    xc_interface *xch = ctx->xch;
     uint64_t p2m_cr3;
+    uint64_t max_pfn = GET_FIELD(ctx->x86.pv.shinfo, arch.max_pfn,
+                                 ctx->x86.pv.width);
+
+    if ( !max_pfn )
+    {
+        ERROR("Cannot save a guest without P2M");
+        errno = ENODATA;
+        return -1;
+    }
+
+    if ( max_pfn-- == (ctx->x86.pv.width > 4 ? ~0UL : ~0U) )
+    {
+        ERROR("Cannot save a guest with invalid P2M");
+        errno = ENODATA;
+        return -1;
+    }
+
+#ifndef __i386__
+    if ( max_pfn >> (sizeof_field(struct xc_sr_rec_x86_pv_p2m_frames,
+                                  end_pfn) > 4 ? 40 : 32) )
+#else
+    /* Very large domains (> 1TB) will exhaust virtual address space. */
+    if ( max_pfn >> 28 )
+#endif
+    {
+        ERROR("Cannot save a guest with maximum PFN %#"PRIx64, max_pfn);
+        errno = EOPNOTSUPP;
+        return -1;
+    }
 
     ctx->x86.pv.p2m_generation = ~0ULL;
-    ctx->x86.pv.max_pfn = GET_FIELD(ctx->x86.pv.shinfo, arch.max_pfn,
-                                    ctx->x86.pv.width) - 1;
+    ctx->x86.pv.max_pfn = max_pfn;
     p2m_cr3 = GET_FIELD(ctx->x86.pv.shinfo, arch.p2m_cr3, ctx->x86.pv.width);
 
     return p2m_cr3 ? map_p2m_list(ctx, p2m_cr3) : map_p2m_tree(ctx);


