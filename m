Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DD134026F0
	for <lists+xen-devel@lfdr.de>; Tue,  7 Sep 2021 12:13:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.180806.327625 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNY6N-0000Wd-6u; Tue, 07 Sep 2021 10:13:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 180806.327625; Tue, 07 Sep 2021 10:13:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNY6N-0000U4-3U; Tue, 07 Sep 2021 10:13:15 +0000
Received: by outflank-mailman (input) for mailman id 180806;
 Tue, 07 Sep 2021 10:13:13 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=GyZL=N5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mNY6L-0000Tt-6T
 for xen-devel@lists.xenproject.org; Tue, 07 Sep 2021 10:13:13 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1fa92911-547c-4530-b653-2e4bcc89a973;
 Tue, 07 Sep 2021 10:13:12 +0000 (UTC)
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur02lp2055.outbound.protection.outlook.com [104.47.6.55]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-22-lAzMNj_cNImWjXxDWmK0UQ-1; Tue, 07 Sep 2021 12:13:10 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0402MB2703.eurprd04.prod.outlook.com (2603:10a6:800:ae::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14; Tue, 7 Sep
 2021 10:13:09 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4500.014; Tue, 7 Sep 2021
 10:13:09 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 FR0P281CA0075.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:1e::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4500.6 via Frontend Transport; Tue, 7 Sep 2021 10:13:08 +0000
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
X-Inumbo-ID: 1fa92911-547c-4530-b653-2e4bcc89a973
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1631009591;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uHbz7vDnLyWZn+Vx+UcHtoqyEcsa9/5Gh3CvlM0cqI4=;
	b=KN6HwClin63jXWvTBny/tu4g59X4oqvx6zcXsbmr3lsCenbIbAJEPtapBNLZGue+NLu6du
	ygPD2OTXBxtxaG+REhtO8u0hPVDWxebunneTgUCiiX5xFLNuiFhALFBGIwc9piF+U3zlfq
	qQV70aqbPT+ruBcD9irg6DbgRC0RF/8=
X-MC-Unique: lAzMNj_cNImWjXxDWmK0UQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CO9BcPUPSzL297plkLrfWFu7JBxYVt7I/sm2DxAIRgrmZVbvi88U8qguy6371yqm9kz8qhMwxhMFFLRlhZ5HY82bQayRNOVCOBIm24CVkrvKHw4FftUdWiMOmcgRDpXOHqTYgFxfUNaYU/yIdNnVvBOCkOwEu83JoWaGYeC3Lta0648dZZsaC9Jsu4+BzQRNV2aMnemE7SNIwIxb2Ocnevp/nvLQy2KaClYIll4E7TCpQVczB7ewPfwjulesVAp66T6xc4Qr73ObL8p1dRSa7pqfu0KJVsiwHi7oL0LWJ6hLCaTisVnRvsFdv8JzX5lYTEgGhpxOAFAH579+F0qz2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=uHbz7vDnLyWZn+Vx+UcHtoqyEcsa9/5Gh3CvlM0cqI4=;
 b=SV1lgHXViEVBZwaxVWq5uFMF/sQPvP/wYSZD0ULY57z+Y/56InsHTil2/lY9qNm6K86QhRH9xPTfYdOL0l61THIgqSgt1OI2bods2dHS3917F/K3IG0PJZo49riBhXU6y0Pfi66Hu0ozpLtWJYRaQjWqib8uI2OUIyhz1ipxhA5woFhokQb2P6ZLdHsqOC5/hXvsqtt0gijogZNeqcdzoHQmK3QJd1PGi0H7oNQokQDLjjY+BxkWNfe9/qU7oA0XzkfOSDZKavbrMZfqUO0k11b9xnvJ72b1q4lJyqNuxzCKUoFuVhMpApnBY0XG3Lhm4ePisABDVehASkMDl+fvQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: [PATCH 9/9] xen/x86: adjust data placement
From: Jan Beulich <jbeulich@suse.com>
To: Juergen Gross <jgross@suse.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 lkml <linux-kernel@vger.kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <4efa804e-3250-227f-00c7-347581366cd4@suse.com>
Message-ID: <a7d9936d-2fa8-507e-5b0a-a4930eb457dd@suse.com>
Date: Tue, 7 Sep 2021 12:13:07 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <4efa804e-3250-227f-00c7-347581366cd4@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0075.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1e::10) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b22900b5-8fc6-421e-fa29-08d971e81776
X-MS-TrafficTypeDiagnostic: VI1PR0402MB2703:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR0402MB2703F05765650A72EA152E63B3D39@VI1PR0402MB2703.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	uCMHuxX+xBvqr/iRMqO1XJwMYXmryJxG883EB/0M+NJsvlk+2wfaxDxFYjarYaf5aSVvzXW+pAZIIL/8tNo1cHdqWvzHsw3su7eudn8OT+5ARcRu/DqaHB9F4yuBy9UBAetQgm5eLw9OLeJDTe05/2xiVLHTe1KNFmasosWjJaXPWMIiGyHAnmiPD8t+VTIaoT4uHb8rZtG4xehUe6SIVE/b0HUkJM23XtwqLIgp0qX5HRiiyD82W7v814NwKhwZVckgq4umi3P6GukOc0RxMaJBqWY+m1LASLP24cCPPEApKFnso3KAxk9ly3+H3eVj/bhyT56R+1FpxD4elSqVwhTvsatXAUULBDJnBfsnKIbExC8SQ4q+4RNQIdojr5VXnuHnGwlTYWqRDGNX1nEWOiITI/CyBfubhULG6toIKJuyvIYuhl1bHzl3qkq/SVraeeShzupa1Wt4aV7A0rkSimRCzD4WLCVHP898z4I3stH3aJsd2Z9a8u4s7YNPZXyoq1Irnc1UcFDqUFn7u2qiUeN8te5H5pTGSiQDWEAVWSxuODhevEW6fhLW2dwIQaawjfYbEL8H2yCdKP9URsVNPA5QlZVwCWC5VLG1TGwGZHJxsMChbjPHewyU2s8jRijHNOGGNayhC/117DpchPBWi2dpZS0NEkAB7PzMw1pmvUAcUyEfODjNouPq27hACyNU+UbPpCAAIC7iOKqKxD2xXmkbjt5ySfNnYTtrbdclUxE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(396003)(346002)(39860400002)(366004)(376002)(136003)(4326008)(186003)(86362001)(316002)(16576012)(8936002)(31696002)(478600001)(8676002)(36756003)(2616005)(956004)(31686004)(38100700002)(2906002)(26005)(66476007)(54906003)(66556008)(6486002)(5660300002)(110136005)(66946007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WGNlRVk1NHd6cFpWVnIrb3F3bEYxSHJlTmF1ek9DcUYvblUzNWwwZWx2NWo0?=
 =?utf-8?B?Q3hDcnV5NHA5bW1uekFzNVZqRXlET01yUGJ1WjM0NktmQmJrbkFPQUx6SXhB?=
 =?utf-8?B?d2p2a2E1ZUdLZG1hUE90d3BaT2RHcm1SM29uM3N5Qjl4UFl0TDFDdmtDZGxW?=
 =?utf-8?B?bTZ5RmU3MkordlJXL0oxeXBSbmJ0ckNHUHdGU2Rnakg2RElGY0IvUDdGZW4y?=
 =?utf-8?B?SWMxc0JBVDNrMnMra3ozbkNtMkQyVkVyQXRGTDJwSzBBeXZHaUVBK0VWdFpp?=
 =?utf-8?B?TU5GTExoaXlCazc0NWhmeiszdDgzaXlUZTlnSzJSdEg4VDF3MzluVHVQa1F3?=
 =?utf-8?B?YXk1VlJxSUprR254ODBIOXBKcjRqOTducHp3NnBnZFBySzZ6SG9DeXI2clFI?=
 =?utf-8?B?R2VieUIvVnNMblZkNDNTVEJONEFZbTBEMHpNbmdIQ0FSMjlVOE9vK1B5R0lP?=
 =?utf-8?B?QkpKRW1MWUNjd28zUmhlV2Q1TWJxQjhzWlg4VWgyYzRPMFd3NlZ3ZS9DN3Yy?=
 =?utf-8?B?Qk1aZXJKcTQyQThtdnVXaVFid2dKSzUvdmczSlFCWHV3TmUvRlhaYThXODlm?=
 =?utf-8?B?TGJ4UzdoVEQ1d3B5aHJiNHZ4NmpOV2pOa254T3F0YnpFWlhGSk52OXM4NjNT?=
 =?utf-8?B?RWFZVFVORlNrbzBjMlovaDlDZWRCVDZWTDQwK0tFclpvaXQ2d21ZeFBWVDUr?=
 =?utf-8?B?TkRUT2xuaCszVmRlOTdXVUVQb0NGL3o0V2JzTGh5dWkzOWVqTERZRjVmeS9U?=
 =?utf-8?B?aEFZZWd2WVlIM2RlWmVtYjh5NGNXMlBMWUxvYzhVWU5vTDN0UERPaEozR3Zw?=
 =?utf-8?B?NHovNVlUS3F0R3NidUFhYTFOWDhJZnJ1ZS8wclArWnMwaUFmNE9YNm91bDcw?=
 =?utf-8?B?dHBHaUVVdnZOYWNoNGR1Qkd1L0ZHcDdScno1eTFSOE1HVSt5aW1GNU5PY3FD?=
 =?utf-8?B?Nm1aQS84cnpWQzdzR3VJTlNJcXRlVUhXQXJIN0ZqQnFEdnNmR2VCNnZBSFZa?=
 =?utf-8?B?bHlCRlBzVDN1eHdHS2VaTFVUa2VMQTg0VldJcXlZcFBRVEZBc2dldHNIa0ti?=
 =?utf-8?B?QUxHN3NBN0lVNXB0RkN5aVIyOHhMSzBMcG9yWG9QV1RkMk4yZUtrcGIvMStn?=
 =?utf-8?B?VE8wZk9FSVo1RTA3SmtoREVjSStGQmduTFJiUHdmMHE4MU1hVlVyLzZuV0Nn?=
 =?utf-8?B?NFJxVDBHeEtHNW1FNi9XTkcwd0JMMFNlTUpzUDdaUDlKSUpEWlg2Q1l0VTB1?=
 =?utf-8?B?bCtGTUM5cXZCTm9yMnQyTS9vNm1BMElqdE5jZ3RLSVRJUTN0OGg5VTVHWjd2?=
 =?utf-8?B?ODAzQ21OeFR2ZmdSL1ZRZE93WW1EbWMrNGZwUEk2SDJwejJtbjhrWWVnVlM2?=
 =?utf-8?B?YXNHNmhjTml3TXBibTlUK1AxSm9zNWhGamduK0V5WUZiakw5UDhxaHBBakcr?=
 =?utf-8?B?T3Nsd2s1b215SkY0NjFTOTRhRkwwYzg3b2tzQjM2RkdHUEZkMlJSTFBnWlNm?=
 =?utf-8?B?dlNJUzI1TGV1VEl3eDFxWXZnZlJvelZUVTI2OGM2V0s1VkxmU1EyZzVhYzk1?=
 =?utf-8?B?TjV5V0RqSEl6cjFGOGxnMXdRNllBRHJISFoyaHZXSWZJQk5oeDZvVmdidnJR?=
 =?utf-8?B?OE84cmxyNE8xVm0wWkkzVGM1cktvUzVDWVNiVlRnajhqcXBVQ0Z3R0NuNXEz?=
 =?utf-8?B?Wm1VWlF4U0ZOOFptVVhIMEQrNVR3bEZ5SVhaZHFEemZvblZWTDdZckdHcVhn?=
 =?utf-8?Q?cwyfKC2l3iJ7Px6KrYVYCJyr9ZtMFFFAVHYvlhg?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b22900b5-8fc6-421e-fa29-08d971e81776
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2021 10:13:09.0759
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +Uj30H/dxCjL3C4AsS8QjgM6Vtm1xcoiuIO9jw3ooI7NZY1d7mgUvG595wG/XmO773j5EXeiB/LXDbGTSMW65A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB2703

Both xen_pvh and xen_start_flags get written just once aeryl during
init. Using the respective annotation then allows the open-coded placing
in .data to go away.

Additionally the former, like the latter, wants exporting, or else
xen_pvh_domain() can't be used from modules.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
I have to admit that it is completely unclear to me which form of
exporting I should have used: xen_domain_type is GPL-only while
xen_start_flags is not, yet both are used in similar ways, extending to
xen_pvh.

--- a/arch/x86/xen/enlighten.c
+++ b/arch/x86/xen/enlighten.c
@@ -75,7 +75,7 @@ EXPORT_SYMBOL_GPL(xen_have_vector_callba
  */
 enum xen_domain_type __ro_after_init xen_domain_type = XEN_NATIVE;
 EXPORT_SYMBOL_GPL(xen_domain_type);
-uint32_t xen_start_flags __section(".data") = 0;
+uint32_t __ro_after_init xen_start_flags;
 EXPORT_SYMBOL(xen_start_flags);
 
 /*
--- a/arch/x86/xen/enlighten_pvh.c
+++ b/arch/x86/xen/enlighten_pvh.c
@@ -1,5 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 #include <linux/acpi.h>
+#include <linux/export.h>
 
 #include <xen/hvc-console.h>
 
@@ -18,10 +19,11 @@
 /*
  * PVH variables.
  *
- * The variable xen_pvh needs to live in the data segment since it is used
+ * The variable xen_pvh needs to live in a data segment since it is used
  * after startup_{32|64} is invoked, which will clear the .bss segment.
  */
-bool xen_pvh __section(".data") = 0;
+bool __ro_after_init xen_pvh;
+EXPORT_SYMBOL(xen_pvh);
 
 void __init xen_pvh_init(struct boot_params *boot_params)
 {


