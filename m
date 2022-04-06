Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D7404F5DD9
	for <lists+xen-devel@lfdr.de>; Wed,  6 Apr 2022 14:25:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.299835.511063 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nc4iu-0007SF-Ne; Wed, 06 Apr 2022 12:25:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 299835.511063; Wed, 06 Apr 2022 12:25:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nc4iu-0007PZ-J9; Wed, 06 Apr 2022 12:25:20 +0000
Received: by outflank-mailman (input) for mailman id 299835;
 Wed, 06 Apr 2022 12:25:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=LqB1=UQ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nc4is-0006rC-Vl
 for xen-devel@lists.xenproject.org; Wed, 06 Apr 2022 12:25:19 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9e85604b-b5a4-11ec-a405-831a346695d4;
 Wed, 06 Apr 2022 14:25:18 +0200 (CEST)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2055.outbound.protection.outlook.com [104.47.14.55]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-33-ACsCBD3NPZeQXg9i7mO7wA-1; Wed, 06 Apr 2022 14:25:16 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by PAXPR04MB9326.eurprd04.prod.outlook.com (2603:10a6:102:2b8::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.21; Wed, 6 Apr
 2022 12:25:15 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::914d:e08d:7798:8476]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::914d:e08d:7798:8476%7]) with mapi id 15.20.5123.031; Wed, 6 Apr 2022
 12:25:15 +0000
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
X-Inumbo-ID: 9e85604b-b5a4-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1649247917;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yucVFPGauWfslPNN5yRCj46l5cke1hJdmEdynBbWakE=;
	b=fBigQ/vT3qScunklYRDtF5ewnRpPycYqGqsRAPIA8Mf2AEBs33GygPj4IYNKg6MrGE31NC
	/mlvDjT2hRQA/A3cUFict7XS2k61IG2naEZxbJWgSKQVsUB7V1SK5YSzsiUEhAPy2IkkL3
	e+gZdbt2BTrGr2WmYUD1BCemNtoJb+0=
X-MC-Unique: ACsCBD3NPZeQXg9i7mO7wA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jFv+KzQxgT2zWYy9ZiL3EvQqHJ772/EolD1dyTuK56r7UTtdQdtmrZXN2p6mnVNXt9EbJh99Q/84ozMka8nVL7eXhKTUxmFFGv/7YScWKOvp0BxeG6ea2gvc17qDPJSHx2AXS30NBZUMbvqDUHuIu6+DFyjnwFDstaHNVhcaBT6ZVBZ1kNaNMSWp9w6ByMOKCo3ayRTK3sWWxYaVoStwIhp1B0sUWPeM2sBUHr561A2ZseSMKs/wL0ckuKxPpyyCV+yiw4iKjWVb/ONv6ZZMtyBYn9lFMnSIx0RmUQZY0Aj9uuQd7oNxAs0dFBEENWeJ01uc4l4hGH0fIi9jDhDIow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yucVFPGauWfslPNN5yRCj46l5cke1hJdmEdynBbWakE=;
 b=EYPTyFNgGSW5YNjn3w85cUAKqq7Mmob5yZelliLBaXXs+iMA8AJ1gcNjYE82EC48Yo0//5fqfEqW4GYvNS+TKmNhKtbfhDBIquZlwz91fY+qC1t1lx/APytnZOgxOzZMfksgHVtUFvp9AEIkfip5sOd8DcWoPaq4i7e58R/E0A/4DrJcmNTAoPdopFEudQhPVn73yA+Md0inYVRPXE0oa33Ob2ryNQvjnaP36fc9L67Wm02BLu0qMfFbhZFzLZWleQ+r1gSEQl/HNs+h1EEh3mT4N2it5fDhCy/i8/6gIo1tBw9TXSmd0XAxlot5qni3DrSgiE2s0EHgdX2c+Ugvog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <535d1050-e5e0-6e1f-5299-f41b84350ca0@suse.com>
Date: Wed, 6 Apr 2022 14:25:13 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: [PATCH 2/2] VT-d: avoid infinite recursion on
 domain_context_mapping_one() error path
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Kevin Tian <kevin.tian@intel.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>
References: <e17b98ee-8d84-512b-6403-26c7b2ee1eb5@suse.com>
In-Reply-To: <e17b98ee-8d84-512b-6403-26c7b2ee1eb5@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0052.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::23) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: df827b5f-471d-4421-4501-08da17c880cc
X-MS-TrafficTypeDiagnostic: PAXPR04MB9326:EE_
X-Microsoft-Antispam-PRVS:
	<PAXPR04MB932644A55C4D42507AA6DCD5B3E79@PAXPR04MB9326.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ufQiu/Rmfahn2fzU4lxOg52qfJFCs2Nq/orOfSHgzXcLqLHg5B9PN9DVjRJWBH30J8JYxSxC3xvajAfOEaHB5OAjCmL/rxtUXGe1vKYBn3ppP/hkJCUjiCe0toBDfywzZM+v5BFlAI/pzFElqG1i6mp8G+S7eOyFAgehMoIyMLUboy1io3Z7ggSoIHlOeaMPpUziXVuWMKqyief1V1CdVQHt6GFsYziwmWYKbWx5REexllCahLAMM01xEqhmt7Bs95OAFxRovr5hw5xOUK+Q/dRUH/9AH4+2LCwf3cZLcjaKWXPNwbjtF869WtFjesIZOmADcSO7v5GZNJja4HXByI96zNtK7dy+iGM4S1OLJc+HvdeSCHyV1mT7IL8HtVF+4jzRcfXY5DYXqsZT5mGfzZTjbcBKZMUnsiB0/Qkzg2c1xCHHwtoTiXAW/s/k/1fiqywi6iF2vgic+r/8ahxzwDrhh0FqN1HQdmOWz+xl4B8yy8WHlb13y2glUqUpZt4XPiO4W5qvl7C5BS2nzQfMMeeN9upofU9OVbW34GiIgG47FaPkKXvygW6UeHn7obtbq7qOWnAIMGzpsy571Jq+uOZYSvGkwhXFP/ejyD0JUhvGHUXnjwPCFSv/yjllI1KKOLDMCYwFexsZQ0RNucpCYf7gGWswLIb5VHQULxYfCKmjC5Oy9t5YWAN239lrLxme/8WVHZiBhQmLB1b8tLach74sAptaXgKabPaqYgdaG/w=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(186003)(26005)(316002)(2616005)(6506007)(6512007)(31686004)(36756003)(6486002)(54906003)(6916009)(508600001)(2906002)(31696002)(86362001)(66476007)(8676002)(4326008)(66556008)(66946007)(38100700002)(83380400001)(5660300002)(8936002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Mm5UeW1XNmZqNGlJdEFTaTYwdnN2Rm1Mb0JudVh0SGtwRmVlL3lOelNEcUxm?=
 =?utf-8?B?dVRKdG9ieXFQQ1gzV29hR0xiVkVEd3ZrNm5ubWMrcUdveGlKYWNwZ2RXQlZK?=
 =?utf-8?B?N1dXSDJRTEwwZXBDUlhvTGhkeVozcnhNR3FsbXNTNVJrWGVsajVPOElrNjR3?=
 =?utf-8?B?Q0U5TnNpNzFuM1FPRUVVQUhIdWhydlByazdlWFBZMlV4enBIVTlndkgrRDBq?=
 =?utf-8?B?TlFzYXpJdmF1Nk1YRFcyMVlaTXhGUHpGWEdUS0JKZzFHTUc0Rk94Y1F0N3lw?=
 =?utf-8?B?N3RjdG9MRUUzWHViRjdPVkpGQmpyQmp0VldJZ3hBeG1aWFJHSnBBb01yeFl1?=
 =?utf-8?B?dzJGZDZtTm5hbk1tVGVURFRtZk9sc3VBTVBJcUtFVWI3MFVkMjZZM2VKTUc0?=
 =?utf-8?B?aXcybDNST2E5QmxsVFFUdUtIeUhiU3E5M3ZLY1FUWExIUHhtbjRqbjY2Y3FL?=
 =?utf-8?B?QW5jc01ES1lsTGxMbW8xSklFaWR4MTl2cWNVQnZlY2Y5ejNSdW9FL0J2SDM3?=
 =?utf-8?B?M1IxQ1dGR3ZBNnU5d0tibTlxbTJNaEg1d2lKVWZPb0RFdmNYVmRiYUlxM1Jo?=
 =?utf-8?B?aGFJL0toZHRVTThKWkZTZzhSQ0p5bW52L3g5Y0t3ZjlUbjIwMUVreURacDlh?=
 =?utf-8?B?TStwNFJ4QW01ZVQvdGY2RmZmeDduREdINklvUnErUUxYRGtFY3dSWTlMY29R?=
 =?utf-8?B?d1dNUXlqamlJcGlrNjFWU1JIajlYczF5NXZDZWtQcWNBTWx6dmxUWVpybVhC?=
 =?utf-8?B?dXI2YjZFem42YUtQMDQrL2ltSjQrSUdnUUQvbGpLQU5pUXZnbnE1eVNsVUlU?=
 =?utf-8?B?T1d6NlN6dTV3QkpIRXNYWWlhRTJaczcxbTlmWlhid2tMM1htOU9hVVFsMkpp?=
 =?utf-8?B?SzZSempuaTdYLzFlLzJrbFdCZzJtOVZiTW1BZGpvTUVJTE1VN3hPK3lkSGNN?=
 =?utf-8?B?RDR4dDJGRUZ6RmN4SjJrZTJZU2ZCcldnZVB3MXJKRHVQL1g3SEhCSkFId1lv?=
 =?utf-8?B?dnB5RHNwR0JJUXl4T3F3dG15SHNqb09qcE44SGd3NzJVRmZyaFJyTmJYbmpX?=
 =?utf-8?B?ME4vNVR2ejVORXpPUVJKL1JILy9keXQwMlVNYXdIc3N5eFVxQlVudXdaK1JT?=
 =?utf-8?B?bjBndzE1YXZUeGtUdHJQUVhXYU05NDNsOHFFM3ZKd2x6YTNnOFZUT2RpY2JH?=
 =?utf-8?B?WjllUFJlOVJJQ3lINUgzQ2VldGhnWWs5cktuNXpIS3R0b3RlZnl5T0orLytY?=
 =?utf-8?B?dXBQK1I2QksvZDVDMlJkQW5nL3g1ZWxhOEhJRVB4akpVUHI5Yi95L0J4TEpv?=
 =?utf-8?B?cVdmeTRKb01EcDMxd1V3OUU0TGpsS0JuUFdUTDZqTmhSbU1sQTUwdnRMREdh?=
 =?utf-8?B?c1BCSXdnUjdhQ20zelF2UklYR1pYRFZteUFsb1VwcERZOG1NMWRvbE0xTXBh?=
 =?utf-8?B?S0kyL0xLZUpwazZJeVpXUmIvR1RNR2FpbTJCKzZsUjhtUURzaFF6Q1ZhZm8v?=
 =?utf-8?B?ejhxdVJwOXh0RDZCWmdhWDYyMHpMaVprL1RDT1RTU3pzNFg2U3pUalY1Y01v?=
 =?utf-8?B?Um9kbzl3UjlQZjdiU1oxQk9wMzZlcHVKT0RBTWhrWWtPLzl5TnlyN3BrMVpO?=
 =?utf-8?B?aW1uRWZ2L2lZcXRpR0oyWHBDOFlkQTQvR3piZTFHeGhDUTVMUyszZ2pBc3du?=
 =?utf-8?B?UkUxK1VQc1F5anRMRVJJOWRuVHZEZlFHK290R2RNRVpOdzBKQWZNWDVGU1ZF?=
 =?utf-8?B?L2MxZEhYVitiaW5FczlLbXVZQzYxSE9TNisxV045YTdTWTY4V0Mzd2dlRXJT?=
 =?utf-8?B?SlpPOWo1ZVhNMDJ2S1p5RTRZL1h0dUdnWkJyTGtRN0RYaWVCczhwRkpFdE5J?=
 =?utf-8?B?Z05abGxKZFRySklPT0FCeE94RXJEektybkJoMGtuVnI5OURSY2FQUGhzWUJR?=
 =?utf-8?B?SDVkZjl5OFZidGQ0bzlzMmxZZm9COXdqVytHUGhueHJTRkpVYTJTRVY3WlR2?=
 =?utf-8?B?d2JCQ1RXenNqeTByS0piUXFsaWJ2RHN0eUhQWnN0emNaTlJUSkkxTTRYQkVP?=
 =?utf-8?B?ZkJQTlo3bHNJTjFkWWVuaGcwZVpOYlQvNjVsdDFydG1KYktuUjd1OHhyYkR4?=
 =?utf-8?B?cENoRjdIaWRDZGw0eVRIS0k4MUtPcHJRTnBSSVV1S3NmZWJHMlhJVmJkbUFt?=
 =?utf-8?B?SUtKVzNBdmxtcWgrUnZoRkRUZUZPV1oveGF6MTFyMHB4SG5jT2FvRis3RXhS?=
 =?utf-8?B?ZlhRRmlIbldoSkRrWUt5bmdid3h3alA0TkxHOG9ydysrVVJ4UVpHaXIvTU5W?=
 =?utf-8?B?cmxHMTUyWHRFUnBPOGUwT1J3d3pXWThYUmZTdjJDTGczaGUzNEFFZz09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: df827b5f-471d-4421-4501-08da17c880cc
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2022 12:25:14.9520
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kiiMlkMb5QFwaB+nof5EVBYYyffNxvpO7z5k5Vmjn6Yg4JdfxKjKVglODOveXgZ8S+db1UFdYE/boSbpGkR2aA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9326

Despite the comment there infinite recursion was still possible, by
flip-flopping between two domains. This is because prev_dom is derived
from the DID found in the context entry, which was already updated by
the time error recovery is invoked. Simply introduce yet another mode
flag to detect the situation and cancel further recursion attempts.

Fixes: 8f41e481b485 ("VT-d: re-assign devices directly")
Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/drivers/passthrough/vtd/iommu.c
+++ b/xen/drivers/passthrough/vtd/iommu.c
@@ -1608,11 +1608,13 @@ int domain_context_mapping_one(
               */
              (prev_dom == dom_io && !pdev) )
             ret = domain_context_unmap_one(domain, iommu, bus, devfn);
-        else if ( prev_dom != domain ) /* Avoid infinite recursion. */
+        /* Avoid infinite recursion. */
+        else if ( prev_dom != domain && !(mode & MAP_ERROR_RECOVERY) )
             ret = domain_context_mapping_one(prev_dom, iommu, bus, devfn, pdev,
                                              DEVICE_DOMID(prev_dom, pdev),
                                              DEVICE_PGTABLE(prev_dom, pdev),
-                                             mode & MAP_WITH_RMRR) < 0;
+                                             (mode & MAP_WITH_RMRR) |
+                                             MAP_ERROR_RECOVERY) < 0;
         else
             ret = 1;
 
--- a/xen/drivers/passthrough/vtd/vtd.h
+++ b/xen/drivers/passthrough/vtd/vtd.h
@@ -29,7 +29,8 @@
 #define MAP_WITH_RMRR         (1u << 0)
 #define MAP_OWNER_DYING       (1u << 1)
 #define MAP_SINGLE_DEVICE     (1u << 2)
-#define UNMAP_ME_PHANTOM_FUNC (1u << 3)
+#define MAP_ERROR_RECOVERY    (1u << 3)
+#define UNMAP_ME_PHANTOM_FUNC (1u << 4)
 
 /* Allow for both IOAPIC and IOSAPIC. */
 #define IO_xAPIC_route_entry IO_APIC_route_entry


