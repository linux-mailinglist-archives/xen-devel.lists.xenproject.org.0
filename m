Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C62D646FE06
	for <lists+xen-devel@lfdr.de>; Fri, 10 Dec 2021 10:40:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.243666.421558 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mvcNn-0000E0-GI; Fri, 10 Dec 2021 09:40:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 243666.421558; Fri, 10 Dec 2021 09:40:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mvcNn-0000C0-CS; Fri, 10 Dec 2021 09:40:03 +0000
Received: by outflank-mailman (input) for mailman id 243666;
 Fri, 10 Dec 2021 09:40:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aCrA=Q3=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mvcNm-0008SI-Fc
 for xen-devel@lists.xenproject.org; Fri, 10 Dec 2021 09:40:02 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2551e253-599d-11ec-a831-37629979565c;
 Fri, 10 Dec 2021 10:40:01 +0100 (CET)
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01lp2057.outbound.protection.outlook.com [104.47.0.57]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-40-GYnaKQCEO5uwIFwvOui8Qw-1; Fri, 10 Dec 2021 10:40:00 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5325.eurprd04.prod.outlook.com (2603:10a6:803:60::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.21; Fri, 10 Dec
 2021 09:39:57 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4755.024; Fri, 10 Dec 2021
 09:39:57 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AS8PR04CA0008.eurprd04.prod.outlook.com (2603:10a6:20b:310::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.17 via Frontend
 Transport; Fri, 10 Dec 2021 09:39:56 +0000
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
X-Inumbo-ID: 2551e253-599d-11ec-a831-37629979565c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1639129201;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nQbHxo+SG7zXc0WpjqfjCW7hun4rktAxwnnAypfq9w8=;
	b=dMWyyVtgdncU1XGXXLA7fHm+RdVecL/Hs2gWc0ahwlRJ310/bf6gxlhziH+XRJKinMvrvX
	b5JD/jl+GyU0+8Jy8U5u0Rdag0UIZCkF1N5L88Pu/oU9IDu+GyBxma9ReefhMkARHTJKzo
	5PnN3/GwR1ZAn5aSniBVa8zOmkkuv7E=
X-MC-Unique: GYnaKQCEO5uwIFwvOui8Qw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jvb9SjtqNm+73m7UPu624dGUJHV7WA7/IaB303mWKvUOi30Umc7B1kmqOk+PiBwLLiZCEHCWU+uinj7YCXlpomw0LgJ7VQ6Tw02NIISYJreJxEjH09xhByWgITZB3NLl2b/RiZKHIXIbohs9OaGlj4I9YjB/82qHGcIByvLUrGRztN25jY92bntC5y9Vq/SCt3z10EpQfqy7qoHsK5WkkiDRgGAM598YO60mH7er71WH3hMvb+KwDP5rcXmf0IZ2UWjJMovclui9u008q2JBIvuM3s1Q6pB3Xo10tkt8QWMwVOBnFR75s9rkABVJHcL94xhI5m9pl3pQTdwou7mLKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nQbHxo+SG7zXc0WpjqfjCW7hun4rktAxwnnAypfq9w8=;
 b=kW1zSbcpjDlW4j9XfeKz6MqmJ48wMeFNz//z5i0qs1ZG9/0DGE8q/XYYgB900CNxoFXEpr6dpY+FG6efjvIduORArLcQLMo/4xzcX82np3AiV3sUAa1RIWztxfqwriCbPGT79wgDausvy5v/bICQgKhkTeZHSb7yM/e7l+W/Z8h78G/Q6s++QgxtWEQD/U2dPeG7G3wrHUBTtkK2xXZZidKgu5xzTMKGhQoflJRSXG7hLHlMFpE43nixnLWti5wzz5xzP8CvJ9AvijbBc92QngaSWb3StTlmRoNvl9T0+zwGuGgcTuM7a/ju5NH9ScXfLA+buH8/wqE9n5oIoB/CwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <6d2d29ca-0495-5029-afc8-7248f462db06@suse.com>
Date: Fri, 10 Dec 2021 10:39:55 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: [PATCH v2 1/2] mm: introduce INVALID_{G,M}FN_RAW
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <9725c93e-c227-f29f-07a4-65e383bb7858@suse.com>
In-Reply-To: <9725c93e-c227-f29f-07a4-65e383bb7858@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8PR04CA0008.eurprd04.prod.outlook.com
 (2603:10a6:20b:310::13) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a661d899-186b-46ff-1ac1-08d9bbc10759
X-MS-TrafficTypeDiagnostic: VI1PR04MB5325:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB5325B4824F00A4BC1B8F093AB3719@VI1PR04MB5325.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3826;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	tWeAP6AIzSDp16yRsvHgDyp4CZTcacv/7OFE3BrIUggRgeLEg/aXrktR+d1tg0sCbYmGayrsQmSdIBTz/OS0u7pYxe5ICR6vigUn2WWEkhU1A/NuVbtdrJW5B/fWDLpno1Shzu12Z7XmOEr/HHHhqzIVwNzf+QZ6zo8xvjMaaaeRkz022fnday1l3CW0vAUbHP9hG7mCnpv8ni59buST1FuTPWRbPUGvWhfynIkSdz0KqfBRQ2wN8C2mRx6weXEzx2W8Tn5//oHVcYaCWhjvhAIy96bDp14qU9sIe9PvRKosxlaXRibyJ9Zc0GMcDU1Kn3e/tIRZK9tRxgfhs1Y1CwNhLVQMxltwyM47GnRTBeQdfZzQtX8HJ4ENhWNzPSf73jAO+YfrpSoJLsC04gL5JhkU48ATSeGlbmhr7kpgKCL0dXJX3gCY/hyUhuO427q2riOXlJRXtcTDhxfrIAuqiRSUYUDHHD4LByNZ2bEQcgTZe10pBgE0c7b7vmtIyrdT48r8Ggo8m4lD/HLke4VSStPAvnTdFQkHbaGZbElu4Cw1FFtlq6ft1mrYYuo5M/uelagCjVsIorOEJkqvtEyHT+VQndc6Pt2XMExPFvCIdIlcbAjRn1hR1w5jbnonZ4kcvCPxF/f/+UX6BdeBWPwOFPbegJrJVcArnW7+l//L7dpCR91RHooVIXkp/ZGpuwuxpzliHwFxXWYaOT7iqd6o78avtk6YTPvnx/PzBkU0Ffn79K6tgqfNbDqkcubIPNMeHtYX1k5WZNrV51f6vP9BeGWihM52WrR7QURSnLrCH/2gqhx0NxoyUUmvzLbbrSeHWLUtOqZiRYFGrM+6J2pq0A==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(6486002)(8676002)(8936002)(2616005)(956004)(66556008)(66476007)(31696002)(66946007)(966005)(26005)(508600001)(86362001)(2906002)(186003)(38100700002)(54906003)(6916009)(5660300002)(36756003)(16576012)(316002)(4326008)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Q0dGK2w2YzZxSDJPSHBlUDRTUU93ci9KNDNtVE9pcjFQQ3oxTlFGcFp0NUs5?=
 =?utf-8?B?V3F5VnozalNnNXcyYUdxZk5MZ2gwbGdGTDRhY2ZMekFSem10UTMwTVd6S0lX?=
 =?utf-8?B?SlhLOUZobTlWUEJnNC9pZ1ozWVZXNzE1aExGR1FDN0x0QkVLcVE4OGtMQ0Fq?=
 =?utf-8?B?eWRlSDRSRGFUSkd4QTVGUFhuSkJBT05kMmUwTnlSQ2Y3cUcxL0RJMHFXL0h6?=
 =?utf-8?B?VUViT1NGN1lMc0pHaVVKNFZWYUl2Nm10N0JvMFo3S0wrZU5MTTRZOVFqaWtY?=
 =?utf-8?B?akZTeE1MTFZxVk94NjltZkZ5dmNvWkd6bmNPU1o0aEFkVThNbDRXTkZud2dS?=
 =?utf-8?B?ZlpLd0lWa1lIcitwdFR0VzFPcjZrbFdpYjc0SVpsd2F6aHZzUW40aTU4SkdQ?=
 =?utf-8?B?YlFwS1g1RDNXRHZWWFBwSUFqUUhBVXkzYnlNS1ZhYndEOUlLZ2htZ09zc0pr?=
 =?utf-8?B?NzA2ZmhiUXRlZzZ0bzdFVDNYVE1XVEZPSlJGYXVDTTBoZlRhTXBLc2JCd29i?=
 =?utf-8?B?VFdqcTJJWFRXWG1FL29vcXFpS3ljVHVINEtNVXc4YU8wZ3FqVTM2L3JIMGdl?=
 =?utf-8?B?dkpFVWl3NkhrVWhKeXBuU3VWS3BEcWxmeEI5bGllSU1KWTR4dTNOaGtMWmFC?=
 =?utf-8?B?Mm5sRzNxT0ZGNFBsM0ZORlprYTJBb1RnYWZpRlRpT0RJaHgxakxrR3pQM1lh?=
 =?utf-8?B?RkdpUWNENDc4eGpkTlAzU2NGNHg1d25tdkMvNGpUTVI2ay80K2wyT3pGVkpW?=
 =?utf-8?B?d1YzOUlTbERJN01MZG4rNEtjbDlRVTRNNlEzTCt5emhNZCtwVGtkMnBWd1pU?=
 =?utf-8?B?cWRLbnBBWWdwaVNFSnpMaU84NE9scUlDc0RDYm4welNCdEZDaGVPN01zY0Z6?=
 =?utf-8?B?a2xIbEtqNzVXbWtjQ1pxZHB5azZEMnVVOTdFVlhoWEdyYWFwY3dERmJlaXI0?=
 =?utf-8?B?K3BkcW5ETytRRXdIaGFjalhiM0Fkd1FYaExEdWU0MmQxK2srMHQ2MkZudlJh?=
 =?utf-8?B?dHljbTBoeTdQa3Q5UFVMbHp3T2ZFL1RMQzVNOXpjcmF5SWt5UWNRcUx5aUJH?=
 =?utf-8?B?dFZxQWU2ODhNblQ1bWZvQUFEMFpsb1IvRWN0S0VoeTRPenNDOGU0QzZFSHF5?=
 =?utf-8?B?Uy9sU2FvN2NsRXFUVG8vUng0YkkxMUR5SmJxdVBrQ05JeTZ3cy9ub2RDaU9q?=
 =?utf-8?B?anJjbmF4L0tVT3VoMDAyb3Z1WUcxSnJIZEF0dUdTb3hwcG1GbHVjTEZiTm1T?=
 =?utf-8?B?QSs1SjIya1oxQi9SRHp0UG9VRXRUOW14bFBWRTRlYlZIdlRPK2JNWWlXUmFW?=
 =?utf-8?B?SGcyQzYxVHFLQWo3NHZYY1RJaHU1dGNIQ1JOUUxTQ3B6b3djenpYUGRmck9q?=
 =?utf-8?B?c2RBVVNyUXhCTEJKbTl2Q1BDbllXMExFSVJpZXFkUnhZQTZnZHpHd0JoMlpX?=
 =?utf-8?B?UVJtVWY1QTh2UU9oZ1E1R0pVUzhDMUtCRXVGWnhMeDVzZVpQQUpmaENWVWFW?=
 =?utf-8?B?L3hxTzRuN3lqZDU2MndkS1RXN05oZy9aRUxEeEowOVgwVHFiVkJEQnhvaFZK?=
 =?utf-8?B?R0tQZEpFUCtvWnNTSmdKZXMzVW1SWEcxVHF3SVljQVB4enFhVE9nd1BLYlox?=
 =?utf-8?B?R0VmbC9CWmVHRk5ya2t1L0tzVExLS25IdjJxUVlCTzhUUGpWcmRIS0Y0dHVY?=
 =?utf-8?B?YVl0WEx4Z1doYnpiWEduckxOWWdZWUpRb0dQT2o5Y1ZtdTJTUWczTmZXSXkx?=
 =?utf-8?B?RmxvUFFLdnowN0k3bFpwWm1MNnN6OVVESVNQZnA5SVdvaXc5Zm9wR242QUVx?=
 =?utf-8?B?bC84a1VkNU1rOVNjcVN2dEYrSFc4OUs1VGdka1phdFFkNFFiZFFtQkNKK0V6?=
 =?utf-8?B?K2IrQkNMNFBZVEJOeFF3aHA5NEJQajVXMFk1YmVGMGFRSWVYWVVxVlMrS0RY?=
 =?utf-8?B?OVUvdXpRZWV4c2ppWm9Vb3RlaTF5UVFySGJDd0ZINGY4QnMzK2ZnbG5WM2Nu?=
 =?utf-8?B?UmlHN2ZkdHRTTXBsREI2MkRSOGlmM0krb2M3ZTQzWnRuTWZsL1NSaEE5NkRl?=
 =?utf-8?B?em5IcHVQOHJvY2hheWcvaGphVlRpU1d3aWtxa0NMOHFkem1LTFNML2JOR3Jv?=
 =?utf-8?B?bFZOR3dVM1c5VzVNZUgxcitIQkhHcGJzdituVU1xVWlxeTFDbkJQMmhCdUpT?=
 =?utf-8?Q?rTftEKnTSAIdkIyIiR7l8Fg=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a661d899-186b-46ff-1ac1-08d9bbc10759
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2021 09:39:57.6867
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IhuZy7DoPlcfAh9YyfluNT/2Lr6SlHMfDMEpgOLtFMrqXrZUN+Rj7lrr1JUbFX4r9nqAXVzd2yAeVA0wQ8K+MQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5325

This allows properly tying together INVALID_{G,M}FN and
INVALID_{G,M}FN_INITIALIZER as well as using the actual values in
compile time constant expressions (or even preprocessor dirctives).

Since INVALID_PFN is unused, and with x86'es paging_mark_pfn_dirty()
being the only user of pfn_t it also doesn't seem likely that new uses
would appear, remove that one at this same occasion.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v2: New.

--- a/xen/include/xen/mm-frame.h
+++ b/xen/include/xen/mm-frame.h
@@ -6,12 +6,13 @@
 
 TYPE_SAFE(unsigned long, mfn);
 #define PRI_mfn          "05lx"
-#define INVALID_MFN      _mfn(~0UL)
+#define INVALID_MFN_RAW  (~0UL)
+#define INVALID_MFN      _mfn(INVALID_MFN_RAW)
 /*
  * To be used for global variable initialization. This workaround a bug
  * in GCC < 5.0.
  */
-#define INVALID_MFN_INITIALIZER { ~0UL }
+#define INVALID_MFN_INITIALIZER { INVALID_MFN_RAW }
 
 #ifndef mfn_t
 #define mfn_t /* Grep fodder: mfn_t, _mfn() and mfn_x() are defined above */
@@ -44,12 +45,13 @@ static inline bool_t mfn_eq(mfn_t x, mfn
 
 TYPE_SAFE(unsigned long, gfn);
 #define PRI_gfn          "05lx"
-#define INVALID_GFN      _gfn(~0UL)
+#define INVALID_GFN_RAW  (~0UL)
+#define INVALID_GFN      _gfn(INVALID_GFN_RAW)
 /*
  * To be used for global variable initialization. This workaround a bug
  * in GCC < 5.0 https://gcc.gnu.org/bugzilla/show_bug.cgi?id=64856
  */
-#define INVALID_GFN_INITIALIZER { ~0UL }
+#define INVALID_GFN_INITIALIZER { INVALID_GFN_RAW }
 
 #ifndef gfn_t
 #define gfn_t /* Grep fodder: gfn_t, _gfn() and gfn_x() are defined above */
@@ -82,7 +84,6 @@ static inline bool_t gfn_eq(gfn_t x, gfn
 
 TYPE_SAFE(unsigned long, pfn);
 #define PRI_pfn          "05lx"
-#define INVALID_PFN      (~0UL)
 
 #ifndef pfn_t
 #define pfn_t /* Grep fodder: pfn_t, _pfn() and pfn_x() are defined above */


