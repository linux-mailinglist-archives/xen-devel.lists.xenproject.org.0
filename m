Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F8C94C8AED
	for <lists+xen-devel@lfdr.de>; Tue,  1 Mar 2022 12:36:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.281263.479516 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nP0nf-0001sH-Qe; Tue, 01 Mar 2022 11:36:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 281263.479516; Tue, 01 Mar 2022 11:36:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nP0nf-0001qR-NA; Tue, 01 Mar 2022 11:36:15 +0000
Received: by outflank-mailman (input) for mailman id 281263;
 Tue, 01 Mar 2022 11:36:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nfYH=TM=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nP0ne-0001qL-8M
 for xen-devel@lists.xenproject.org; Tue, 01 Mar 2022 11:36:14 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cbd7b545-9953-11ec-8539-5f4723681683;
 Tue, 01 Mar 2022 12:36:12 +0100 (CET)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2107.outbound.protection.outlook.com [104.47.17.107]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-20-mvBW0GLBNK2bXaF868IcLw-2; Tue, 01 Mar 2022 12:36:11 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by PR3PR04MB7356.eurprd04.prod.outlook.com (2603:10a6:102:8d::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.25; Tue, 1 Mar
 2022 11:36:10 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%6]) with mapi id 15.20.5017.027; Tue, 1 Mar 2022
 11:36:10 +0000
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
X-Inumbo-ID: cbd7b545-9953-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1646134572;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=1CGuQnavDaQzxl8KQfCDTDU2TjGe6+yb2XeXhfdCsjI=;
	b=RxwI8dNwrcND+MjbPBnCnHH8qZBoeZ3B+bxeNHT3bUUI8kZc82Vj9Ymnd3EMhbmGOZAiqn
	ja/ilHw8hCClooNTURM0UcRVIFdK2BmhK4mAcImxZ79u15qJo3WPTZ1oR905JmyE34tDoA
	5euntlp97WylkkwKWcu8wc+f0skA5l8=
X-MC-Unique: mvBW0GLBNK2bXaF868IcLw-2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mzq7KSX76EZzT/aHLQyWd9FdkdzscqKe0mKOBFj60LCIJuxTcV9lM2o2VBmC+K6R60RNGcfL96KE7uwHsnRtcAsA3nk4GsttLpQcojB1BtLDz7uBuEGrBcqH5PPTZ3SLoAC9oKsI9KknBOs9WbZsBMfZE3a9IM6VwZPpM36RlqYb4n3wOCaxYDl+MuBfSq2iEa6SV3GstcsmtHto2kvk7oLHGfHb6XGFd4E0aMb0Fqofr2j31FFmGvYXlwZ4Vj7q2hA51k/b6jebM98uXcrnrPRGEsMzcs7zMeJq7Mjx1NGurdHRQeHo/Yv3fRINGX+NY7qehHobBf3H54Ww7YHcvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1CGuQnavDaQzxl8KQfCDTDU2TjGe6+yb2XeXhfdCsjI=;
 b=c4vXLvOfnq5ne9vobrOCKSGq3Ddsf7S1hR67isvr6sCti+GYjlRv8d0IyDnzuk3CJO+mdIBdjSXUXCFNaIkTOW+VfGjUABKtoDzDjuUWVU2+Vv0sCCzRUSnDgHZ0u4CvrXBZKKOMlfQK3j0XA6g57MGFV0Yhk354j+kWZE37uwUKBIS/XjlbJKB5L5zYNbELos2h4ETpxUIQw0TzDyg2mLpV3Tpiiwc9Q6eEoQvWRBA3KOuEJrqwD0ksDoyn7koo6gJIYsvyCA7866odkSo/QoQ8jbw0UPDKL0Je/3na10rnJglw3WcwK2ZPTATcq12l9i3fg67C5evUNPD5bPI59g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <0e3594ff-c637-46f2-bc95-7a26b5471b86@suse.com>
Date: Tue, 1 Mar 2022 12:36:08 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86/altcall: silence undue warning
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR0301CA0016.eurprd03.prod.outlook.com
 (2603:10a6:20b:468::34) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ac26bf4d-58be-45ce-2a90-08d9fb77aea7
X-MS-TrafficTypeDiagnostic: PR3PR04MB7356:EE_
X-Microsoft-Antispam-PRVS:
	<PR3PR04MB7356F27551DEFDDC5D713110B3029@PR3PR04MB7356.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	8dsD3V15LU1DxfhZFIAepuWGR+CsqKO36Smh00aAYJcQQs0nR0lQAvGJ1umOwXWhEICpdb+a2LO/heaVe0vgCzHh9lG/fbIiV/kIba8ZVxawUOocdYAItP1qu/xwtaa2zdPRluOOnUZoIaqR8VE7CpzTjXq6PuD1hZ8Db7Xutw/nuGfy34IezjYm4MrhcmqjKEXLhwnL2ChTFiUQmPpvawh+CjqWDTLab3DISEpAKa+LmsMAZaRK35HovxJjysf3rsmNKJboaie+oB6/Asyg7b5dDnIzmsHLnOFW+fvX5NAqoQDzZXEUrywjdq0wQBDuTwezaxpyMWrnC4Co3DZOGSQff4WS9r+8j640IXTXXObo/da47S824+HsAYcYfQj07JCL3vaE/xaLwNiSKQXW2hdzUHt1S6VLUcxaa/DBMyDMDE3Eon3ov5HBPPFcaXQfHVOCmPyWOUaB+h7TPL6Go1/nVpg2Up2fv2JJqmf+QZtoEYBWpnKU6xKOBL/NvZMszH3SlM879F7pnh6+Rwt5XxY0KRaFsiFw87/La7URs2hTcZvEE24jpyBF9/pc+auh21T7jsc1vgSa/A7KRGzeupp7KGTjIq2goPa7TJqaycStryxmGXkZwCHJ8I16h7ZRegLLEVlG7SzvxkI0VhIYWXH1QWH0lKtLbTtc7hvftQhC+MxycbwKb+XepGRDjPXqCpbTHXZMR8eXM5Av8kRRNx0jXq37OKw65uLZi4nYEmM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(31696002)(8936002)(86362001)(6916009)(54906003)(4326008)(8676002)(6506007)(36756003)(66556008)(66946007)(66476007)(38100700002)(26005)(186003)(316002)(83380400001)(6512007)(5660300002)(2906002)(4744005)(2616005)(6486002)(508600001)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?c20rc2p5a2FtRVZQSlBKMlBIU2tCVE41QWpvNHNtSWFvTWRabkdRQkZjWEVm?=
 =?utf-8?B?VStpL0xhcWFjbkRWNmk0OTE2bkozL1VqTE5MRkxNM3k2cFBJQ0tDdHoveDlF?=
 =?utf-8?B?b3hzN2xCeUV1dDdEOWMwWVhKNzhBazNPNk1Nb3hlaXpNcVJoc09MeVpBNUtq?=
 =?utf-8?B?MGFzTXpjNE8rOGFmVWErWnJtVGNwb3NzZXE4Q0trRnpZWTAxeVRXaFdTVm1N?=
 =?utf-8?B?bUN0b2VRZWdZK011dnlXY01IR3dqcjVIMGFvMFVPOG93dkd1REZOLytsak5Q?=
 =?utf-8?B?UDFSM1d6QkV6NU9aK1VHckRBS3hHYkNLOVFEY1IxenNXT1I5K2k3OStkVjQ4?=
 =?utf-8?B?N2tSN0xEU1dYb3IvOEtuY3paV0F0M3B0SnljYVBQVm1SYUNVVnpUeFBxWFY5?=
 =?utf-8?B?OXJoNG1CL2MzR2VFUUh1UkJjMHdTdUtOd25ubFBnQUtnOGdlT1l3TzlOTmF3?=
 =?utf-8?B?RVV2R0grUkkrTkdoV0tCcGp6K2l0R1ZMNGNvWUJDMDhjZnRjZm1qZEI2ency?=
 =?utf-8?B?eGw4eTY2Y1RmcnBPMDc2WjBFOEs5VnA2Wk0vb2psd2Q0SzBJRDlJZUV5S1RJ?=
 =?utf-8?B?WE9YMFovZ2tMRmZyeTR0YjNrVCtEVjVwN1ZEb1VYRjFPdXdrQTgxWWk0aUIv?=
 =?utf-8?B?UXovRkQ5K0lnam50Q2swZURXNGxQOE5vVHlUK0JRVmhXNXlTTjgybmJmV1h3?=
 =?utf-8?B?clVxMUdQQWtTVGJGZk84Nk9DdzlYTEFZZmN5cnlXblR3SXVQUGw2QTJuTXhm?=
 =?utf-8?B?NjVIUVNKT1gxMktRblhtZElEQU1iMEVzNkkxcFcwTkpRdHptNGRtNWxaYUd2?=
 =?utf-8?B?R0Y4MUxHbk9Db0lpa3F4K2dRQ29qWVBsRDkvTFZob1dVYzBsWGRnb29rR29O?=
 =?utf-8?B?ZEEwQm9EQ0tYdDgvWjNMZkVOOFVCcTN0VS8zTllEcGdnWjY0ZVlXajAzaHBX?=
 =?utf-8?B?Wm9OZ0IvQWV4UXR5eUVxck1odFRsdFdKR1ZJWm1oK09xV0tVRVBUOGtSRmtS?=
 =?utf-8?B?UmxrNHV2SUpwUzM0a1FmSklXa1p5NlkvU0NLVWJ0NmU3Ti9kKzAwNytvQUpC?=
 =?utf-8?B?UjRWc3daVUxHdnc5WlhTNmhURmlLZEx4aFVvdXh2UHBYWW1IOUNTY1lSa01Y?=
 =?utf-8?B?MzNDZExWMXRhWE9Td3RobVJpd2ZITDJNZ1pZdVFIeFp6SDROZ05oNVNYZUdz?=
 =?utf-8?B?MDUvQVJPYld0dUhhMVZoWGVqdVY2dUNiRVA1RllWME1DNnBoMEFUU1hrczli?=
 =?utf-8?B?YXEwNWxNbW51alpYa0tzNlcxbTNKTjF0RnJTT0VHZ1d4TlJaNDdCdnRBRGdU?=
 =?utf-8?B?VDFCN2RLcUpqYU5KRFJFd0ZjTlRGYk5UYS9ISENWZWlMaFFONnY2bmdYeHJT?=
 =?utf-8?B?aDVjdlp2OHZEYTlPcElkYkMvOElRTFpwR0tka1k1YVdmMlBMMWtCa3pZTmM0?=
 =?utf-8?B?cGM2U25CY0hjZEpJcEl0OTg2czNXZ0xIaHdTSDFmMXFCUDhIMjVLVmthWnhs?=
 =?utf-8?B?ZGNsOFduQXU3K2VRWnppTHBHYmJnNURIU0NjMFllMzE5QVNiVDQvSSt6YzBL?=
 =?utf-8?B?S1FNV2V6KzJFVml1ajhYSTdpT2I2c2dMUmlpc2pNa1JWVC9TVnJ5WmNDUW9m?=
 =?utf-8?B?ZFUwSnlVbUxIaU0yL0hZUm9KNFljYWZuSWN0RmNvV3dQOWJ3OVVtMFJDZHhz?=
 =?utf-8?B?SW1JMVJHREltOThPRytpNnVPSjNEdktac0s5bThYRDJTZk9wR1dHQVhuZVM1?=
 =?utf-8?B?a2VhRk5oeG5xY01HVXBEVHNHVXJkRnZ1QTlMUFJ4VXFiMGl0RkFQRkgzNVJn?=
 =?utf-8?B?VEtnOTBPMGZ6c3JrQnFNMWZueFJ5MWpXZmsvb0FkQW5MSE5EWWVSbHRZQUN4?=
 =?utf-8?B?Mk41YWQ2NHNXYVI4ZFgyZzBQbVV1VVZPZjJCY0tvYWg3ZnFNLy9YaWsvYVVz?=
 =?utf-8?B?Yk4yamxMTVRjSjB6c2Q5TS91NFNISlJBdHZ5ME80TXdyaGJvb2tGdC9OcTh5?=
 =?utf-8?B?anJPOVprdXQwcG1vb3I0MWtHaEZkWnhIR2xKR3BVdHM3YWRlSXp5ck5ZbDFN?=
 =?utf-8?B?Z0lUZGJOV3h2RDIvaENMRU9GTGEzN0FJdjN1N3pZQUtCaEJuSUNZMmVuNTBX?=
 =?utf-8?B?VG52UkhLVHNJTVFTOUxFTitmaXNGaHpHZHVZRGpERThGQ2NKejFacmg0WXlI?=
 =?utf-8?Q?hiQ+qoLN0a+rG/QvVrewyzQ=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ac26bf4d-58be-45ce-2a90-08d9fb77aea7
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Mar 2022 11:36:10.1069
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ao0yPZqaURAYGtVxJp9EbwWDPv4fSel04260zMzAOYhLkNE8GNE+BsEGYFS5NYCQel5hx8y2zou0cqQAWofYkw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7356

Suitable compiler options are passed only when the actual feature
(XEN_IBT) is enabled, not when merely the compiler capability was found
to be available.

Fixes: 12e3410e071e ("x86/altcall: Check and optimise altcall targets")
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Furthermore, is "Optimised away ..." really appropriate in what
37ed5da851b8 ("x86/altcall: Optimise away endbr64 instruction where
possible") added? If this really was an optimization (rather than
hardening), shouldn't we purge ENDBR also when !cpu_has_xen_ibt, and
then ideally all of them? Whereas if this is mainly about hardening,
wouldn't the message better say "Purged" or "Clobbered"?

--- a/xen/arch/x86/alternative.c
+++ b/xen/arch/x86/alternative.c
@@ -295,7 +295,7 @@ static void init_or_livepatch _apply_alt
                      * marginal perf improvement which saves on instruction
                      * decode bandwidth.
                      */
-                    if ( IS_ENABLED(CONFIG_HAS_CC_CET_IBT) )
+                    if ( IS_ENABLED(CONFIG_XEN_IBT) )
                     {
                         if ( is_endbr64(dest) )
                             dest += ENDBR64_LEN;


