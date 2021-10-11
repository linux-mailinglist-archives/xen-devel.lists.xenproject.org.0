Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CE870428890
	for <lists+xen-devel@lfdr.de>; Mon, 11 Oct 2021 10:21:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.205464.360767 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mZqY9-0003G8-P6; Mon, 11 Oct 2021 08:20:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 205464.360767; Mon, 11 Oct 2021 08:20:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mZqY9-0003E0-Lm; Mon, 11 Oct 2021 08:20:45 +0000
Received: by outflank-mailman (input) for mailman id 205464;
 Mon, 11 Oct 2021 08:20:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9TNE=O7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mZqY8-0003Du-K4
 for xen-devel@lists.xenproject.org; Mon, 11 Oct 2021 08:20:44 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3c6cfd9a-4838-4b8f-ab38-ad3d01fe769a;
 Mon, 11 Oct 2021 08:20:43 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2105.outbound.protection.outlook.com [104.47.18.105])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-18-ksDHdLA3MdmXh1jah7hCqw-1; Mon, 11 Oct 2021 10:20:41 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5326.eurprd04.prod.outlook.com (2603:10a6:803:57::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.19; Mon, 11 Oct
 2021 08:20:40 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4587.026; Mon, 11 Oct 2021
 08:20:40 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AS9PR06CA0223.eurprd06.prod.outlook.com (2603:10a6:20b:45e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.25 via Frontend
 Transport; Mon, 11 Oct 2021 08:20:39 +0000
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
X-Inumbo-ID: 3c6cfd9a-4838-4b8f-ab38-ad3d01fe769a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1633940442;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=wXp4WejUo1gQalHqC0ptBAcKhLpjEL68Gg6QYPuu8qo=;
	b=femKHVVUswm5AO29DyCkUrQL9cDvbEQ+LCIHjeksBr+/H42nAKXsJ5ZjFiDJ21X5ncstbE
	EJBX2Mn/gdO6zLocnQr62YljUTzKZzGc4qjXdYalnbHhltlxuxK3AXeuqb6KOVyTjXTujK
	oNN81BSyAJDJew8BpGYXKYuHS5YLlkY=
X-MC-Unique: ksDHdLA3MdmXh1jah7hCqw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SWMh82GmDCqvVbBzXJAzDF5g4jX2sE2r7V+LALWO+eLEYmBGp926wMJkYDIgTKw65pAI3+IQOx901LZRnfmq5OvAaFbYWgHfVdE6omuBhrcPzZIN8uC6/CyEXlk59f6nKvBs3IexX26fv8IXYb0+PbrN16r3p6oe+MG3BYDqVvRLf6AU0yXamn8097g+kwRWSnqbTicdrlLcrmeIz0WnicGj6udtt/Hxfj+ppzqU/c4po3eaFeD96L9/vvb/F+N6oy3NLUR4HczWDz9Y1SS2yNQDhI4lN2LKFKmZWwbkmR3nG28VoTzV2iTFlCWCM1Kxle0bCYGlE99uq3e1XZ697Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wXp4WejUo1gQalHqC0ptBAcKhLpjEL68Gg6QYPuu8qo=;
 b=CXP/iNDsef0hYg95S8WChVX6tzUEJWgNiBvl5lrq10ZZt6TUrHBIYymd2XYGTxSajJbTrSc6HEry/28H/ZOHETPVMXOPHz1K9aTjGIVcs4hx2K2nKgyiaMkBClWRIf/iPtv/92pBA0izkfnU17gnQ9Ym01ouPAHKp2eYyGYpLoj3u4bfossveWCzJmUM36VMDOMpWVRfakBisFGKa9BtnwHYpc6zno0SdrWF7Eq5t88TBfUpLeZdXfYR26dUMVASfNAE7OtYk2x2I6RRMichwdsaC5m1NFZZ/GNO1kanpi8aEjuYgvwWqUs5tEzuhKGjF/4QgmWUxFrEjau7yJOHDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=suse.com;
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v2] x86/PV32: fix physdev_op_compat handling
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Message-ID: <af2f934a-49d8-a15d-3b66-94abc0d39081@suse.com>
Date: Mon, 11 Oct 2021 10:20:41 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0223.eurprd06.prod.outlook.com
 (2603:10a6:20b:45e::11) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9be5a194-8d6d-4e3f-8efb-08d98c9002eb
X-MS-TrafficTypeDiagnostic: VI1PR04MB5326:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB5326827D6AD5DBD8E8ED5375B3B59@VI1PR04MB5326.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4125;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Q7+9rD2NyVN24nUx6QDhJr46Cro/zQL/6qNZhaB8VK0tKMO9u3ny02WSTvmoMBerNZp4nnQ7exZ9b/P5ApAWrJUWAnubPM4smyyEDNXjicx3qT741eBvAgXRYZJ6mUO8gv1KMv/zcibm5vq2luqNHqClkHsvu5Tpb9Jf0dwZtH/2meRLoNWRiBJIosgLelRUNaufhH2ig+QBJjfjUBlN91T6RQYTvNE/w+n/n0lAxfEkAPBhVawEzi6gI0ThCkqaDiVaT7JrWY1ZQ3m6/JwYRl9mAz6GdFIYDYIeR1YV1IFOEIpR/0iDp7hu8etxiyDUpVKlujp1M4kwxByMk6eua3LOklFbc86SkbPfr0pTcI5TKU3YletIRn/87tVw3yGwtYps8EQy08KsGBgPqcC122U3Mz5pm/9zcI/4mMZ8vcA/piuvKk1h+LX1wTFHOlEZfIRz+/+MJluV1pERmFYx4G8kZn+sBdJlC7OK0Lqv35tu2VQOp3/SIV1Sib71Q6cL9GzdlBKgniWB7R2f8eCABPiAHGWXQp11+iKJy5VWg2fwNrBkF244pF+O1n8MdBoOHMUg9Y3mVJMAtMrDknehQIPY9+i2diL8Bq54PL75bzka8TBrP2eL1CWfNdUuN7oPZ0O7/4dpp3bes7m1Afl0AvhPyjF65BphD+AuJiui5xOUCKeajhXgkBSXcm/TNlH5oQElGINHoLAX4o5DPqnsUi6ZPvdLUIdiTDfBIDQX6f48KInVSX0OlKE5hSqJQro/
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(186003)(8676002)(31696002)(2616005)(6666004)(8936002)(38100700002)(26005)(956004)(31686004)(36756003)(86362001)(4744005)(66476007)(66556008)(5660300002)(66946007)(6486002)(54906003)(316002)(16576012)(4326008)(6916009)(508600001)(2906002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dzdTY05WcUgwLzZaWWlkbjJNeHE4Zm4rWmJ1QzJkbTdtUjJuNmpXVnVzUVI4?=
 =?utf-8?B?T1crS0J5MVRaUFBtbGpNTmhzVTZDNng1Wk9GUnNRa2RKV2pLVFh6aUZzL0Uv?=
 =?utf-8?B?RFB6UGJ6K1Q0WnMyblVSdmtjelNBRktBclFvS05nY3pTUHdjZGRobVJtWU9T?=
 =?utf-8?B?WUVnTHU5cVkva2dzUHhoUHNBNmsrYkZnWHpBUGJKOTBkRjBpQ3FCaE4xTnFM?=
 =?utf-8?B?SkNuVUtmWG9SYnNzMWhqZWdxcnQ3R0NRczZNc3RnSnNDcFN5aG5ybWE4V0Zo?=
 =?utf-8?B?ak1FMlBoT2Q3ZGQ0V2YxRzN1aUo1bDUvYklSQXR3N2J6NjNSYVBjSnhDOGFr?=
 =?utf-8?B?TkVNYUZxRnBzNm4vNE4wTkR0cWszL1piRHNndmNIQjFpUnQrd1kxVFBUelJp?=
 =?utf-8?B?N1lxS21RalNNaS8rVjZVcE0zSHVwZmN2R1hSZnRncXA5ajBYZGdvZFc5dlRL?=
 =?utf-8?B?TFcycmRGZ3g0djRFdzN6VjV4RVZQZVc0OFl5N0d2TWkxZ3JGUmF4UWV6Ujkv?=
 =?utf-8?B?ZjViTFdmRHBHNDlSR09Sazk3Y1ZFZUJncUt5VUE1K0ZQU2cwL1hwOHRMcUlr?=
 =?utf-8?B?QjNBOHlMdmcwSi9ob0x5bFpWczg3M0ZOTDdDMWo2dWcxWjFsamFnam1TcTcr?=
 =?utf-8?B?ZWl4bXQ5UmVtZm5ZT2c2UDRyRkd0dG9aSjNrNy8vTjM3R3d2ajYxZVdSSXBC?=
 =?utf-8?B?VXFQMlV2b3BCTTUvc3VaVWhBbXlCK2duQVRHZXVOOUVkOEpHbkF3cDdFYUlC?=
 =?utf-8?B?VUhld1didE44R2piekdkQVBaZy9waFpyNFdRMnRRUkV3NzZpSzhHZWg1eGgx?=
 =?utf-8?B?WThYYTVOMEZ5RXNrTE4yRzFIZk9xQzdxMktMVlZsaGg2VWJaK0h1aUg4ZEpu?=
 =?utf-8?B?RldRa1RNOEQ4OHZZcEh1RGpwelhoUXRtWllvL1l2QlM1QUtocWxzWkZEaUZw?=
 =?utf-8?B?eEtqMkhPeWs2N0lMeUZtZlZsdVhpbUFJc1Z6TEFjVTRRYzBYRnR1bWlzL2E4?=
 =?utf-8?B?aFRBV1o3Uzh4ZE9Gbi9RUW8zVERrMVVSMEtjM1dyTnVSeDRuWTJrKzBVRVFG?=
 =?utf-8?B?ZnA3SGkrQ0RxT1QrNnNJYXRuYXBzZzRnK2hnNnUvQlRtN05BcFJSTmdQUzZY?=
 =?utf-8?B?VmllckpZYm9neUpqTUIwUGNyVThyV01GZ0xaK21OcTkxQWY4anRTY1FiZlMz?=
 =?utf-8?B?b3VqTGpRdTJ5MHJRdkovRzB5enhTVUUxcW41aklNQmN3emF1YnJ5VWdTZ3N6?=
 =?utf-8?B?OFZFN0VhbXI0NG9QejlXZDV5WHNxUTZLaSs0RlVZV3YwMVFTcXFQdUI0aG5D?=
 =?utf-8?B?c2ZXcWI2Rk5mQnVFcG1tTnlORXUzdzVSQ015aWRDNUdyRTg4THhBNk5JbHlG?=
 =?utf-8?B?WkJwZ05RZDJ6QkxVZ0pUOWVWZ1NEQ0xGYmtLR2hVam5ZZ0FlN21FazBNVGNJ?=
 =?utf-8?B?WGtBaXVzOTUxaG5DWEZWUVU0b1c1YmtjRDArb0QwcnhoZHNZZW5Hb1lUMlpQ?=
 =?utf-8?B?Qk5BRUNNaGRwSVVLY0t4UEMyT0paeTRJeDdRRmVIcHR5YzhJZEN0amJMV3M5?=
 =?utf-8?B?TEFKZXlYMzU0a0pZT2ptWWFjTkI1VGNMRnE2N29zdlNxc2RHejJvemtZWUJN?=
 =?utf-8?B?Tjk0dDhudGxWMlhMdmNPNjUvOG5uaGlVbUVFMTRFTksyZDFHNnZVb0ZRekpo?=
 =?utf-8?B?NlZVekllUjRvcVZGczU3UW1MRzlkbFViSDJPMSttODRmVTloeVFYZEVpN1g0?=
 =?utf-8?Q?KbfIarVqhXjDjcfj9ugjpRG/jFqAMNdPB/7v8Oo?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9be5a194-8d6d-4e3f-8efb-08d98c9002eb
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2021 08:20:40.2556
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sBHciJsQRS8afeK5+v6lQu21SITZs3eOnNS1sUt3EjE6OYwZkvy+Lonn870dhufriNy3a7ACYQyyIYGC4+VIDg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5326

The conversion of the original code failed to recognize that the 32-bit
compat variant of this (sorry, two different meanings of "compat" here)
needs to continue to invoke the compat handler, not the native one.
Arrange for this by adding yet another #define.

Affected functions (having existed prior to the introduction of the new
hypercall) are PHYSDEVOP_set_iobitmap and PHYSDEVOP_apic_{read,write}.
For all others the operand struct layout doesn't differ.

Fixes: 1252e2823117 ("x86/pv: Export pv_hypercall_table[] rather than working around it in several ways")
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v2: Don't remove do_physdev_op override.

--- a/xen/arch/x86/x86_64/compat.c
+++ b/xen/arch/x86/x86_64/compat.c
@@ -12,6 +12,7 @@ EMIT_FILE;
 #define physdev_op_t                  physdev_op_compat_t
 #define do_physdev_op                 compat_physdev_op
 #define do_physdev_op_compat(x)       compat_physdev_op_compat(_##x)
+#define native                        compat
 
 #define COMPAT
 #define _XEN_GUEST_HANDLE(t) XEN_GUEST_HANDLE(t)


