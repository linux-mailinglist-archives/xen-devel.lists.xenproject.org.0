Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C759455C6C
	for <lists+xen-devel@lfdr.de>; Thu, 18 Nov 2021 14:14:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.227400.393288 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mnhEb-0008SR-4k; Thu, 18 Nov 2021 13:13:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 227400.393288; Thu, 18 Nov 2021 13:13:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mnhEb-0008QW-1g; Thu, 18 Nov 2021 13:13:49 +0000
Received: by outflank-mailman (input) for mailman id 227400;
 Thu, 18 Nov 2021 13:13:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nol9=QF=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mnhEZ-0008QJ-L1
 for xen-devel@lists.xenproject.org; Thu, 18 Nov 2021 13:13:47 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5caedfc5-4871-11ec-a9d2-d9f7a1cc8784;
 Thu, 18 Nov 2021 14:13:46 +0100 (CET)
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur03lp2056.outbound.protection.outlook.com [104.47.8.56]) (Using
 TLS) by relay.mimecast.com with ESMTP id de-mta-4-uSpZ9odVPXG20505mv0x2w-1;
 Thu, 18 Nov 2021 14:13:45 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5165.eurprd04.prod.outlook.com (2603:10a6:803:54::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.19; Thu, 18 Nov
 2021 13:13:44 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898%3]) with mapi id 15.20.4713.019; Thu, 18 Nov 2021
 13:13:44 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AS9PR05CA0055.eurprd05.prod.outlook.com (2603:10a6:20b:489::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4713.21 via Frontend Transport; Thu, 18 Nov 2021 13:13:44 +0000
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
X-Inumbo-ID: 5caedfc5-4871-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1637241226;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eOVU/IktMNarHrzq1eR850T7kGTI+/Z3sQLri7a16Vs=;
	b=L+h+7yNB2Nyebmuo4Ml2YmGAmpkWORuNvUymlF0riosDf0wui+SHmFZeXLZD7H+KBvlDxC
	8yeddsGCxfYNRz9W8vogM4eFIrtQR6vU5qABKwyTPhLVHMilG3Nw9m1YiafntxUL3TvKo2
	V1RzYwtiMWQ6abZKmLHTvI3vBvhrUUg=
X-MC-Unique: uSpZ9odVPXG20505mv0x2w-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hL2b/G1b4jsYWi+4D8AsVEMaiKZgmyaap7qYxrNObjC7FrZpY7E2K8WDWVFVJ2iskLXxEMT9Cw7L04j2LVscS/MZQYOeZdptquudUmhAbnaXUq7YLihqZZjsGThKfflBHq8I8FvkBJXm9YHYdL0477IMhUYe6gy44DJ0owaB3RoWJZSJBNMGW6SdmHDVVgZJh/mgqHWUZX77SoCpCDkih74bPGSeWuGr3PUiC9P+LjbCaMuScVwVyaDrxUav3DZG5Zrqlgp3lyHLBVd391e7HM25cGVVX3dfkyRvjfNbndNAbBpyHOHAKJNIl2yTUFwHURihDfF3YD433WviRNlSng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eOVU/IktMNarHrzq1eR850T7kGTI+/Z3sQLri7a16Vs=;
 b=Ki9If9sbqdl0YYB0D2FmM5CYq7Oxzz1LoxOe1CugHheonvDGp8t/pY2VCAnE/sx3GC/m4p8dpHxJ7rp8hY5vG+9ssaS/PPYENpO/04vNtqx7A1fdEzI4/oNvkXQndAnjoXxxGJV0G7iTsuk//Y3cnb7sZSNryX/Nf5NSDQxVAvpNg6CLp2YvFDxrNctby1YccckM+F36WI9rpWF1fVcHi5itK/ye1ew4KOlqKxstdCT5JK9kDytHSwyKirday1zxDuf8fPzFFAGTNAwkDR/YbbblLppL6H7IHBrOuR5H13X549SecUR7B97RtMBwSMwOavVeI7HEqZDhwupu/pAGOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <cf0d323d-6ef3-0b35-8423-5adab75ab4f1@suse.com>
Date: Thu, 18 Nov 2021 14:13:43 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: [PATCH 1/3] x86/Viridian: fix error code use
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Paul Durrant <paul@xen.org>, Wei Liu <wl@xen.org>
References: <c8e8767b-111c-5eec-15c4-a7cb60a99283@suse.com>
In-Reply-To: <c8e8767b-111c-5eec-15c4-a7cb60a99283@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR05CA0055.eurprd05.prod.outlook.com
 (2603:10a6:20b:489::6) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 21ac61cb-8bb5-4a2d-3b46-08d9aa953fae
X-MS-TrafficTypeDiagnostic: VI1PR04MB5165:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB516524CDF5C6FD7C679B96CDB39B9@VI1PR04MB5165.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2803;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	jhXxK4K7FILXhA+kK1jvKynLlUATITXA29cAq2bO8CJym41J57CWbLwisJZcyf9KyKTDmm+Ymi24LctjND8mFudc2xityiayHePPZFV/MV33q1gCxLklgjzwed0C1FNlC3NQKP/qRdaxG+xLnBfEdnUKKKfP7zBfuDbRjk4v7izwFTo2DyPk14dIv8akAqDX3PEmvCOivbfYgZWEao1v7ZHopdoKYmMwZ99gY/XPhEHugkdykpG80xbLBxwep52IxgEQSYtBzIeKALq6cNbQ27bhLbsRVgckRxGmmxgvQ9ce0g82ZzX5ZKdVH8jhK5Qj6ejpXWhpvZUZJR46++Vf47L/uTNCMlK/gvi2q0xaa6+apzQSoJP7nHBCWmQIVvEEcH3E/P4TH05SeJoOM+WArpD5a0fZJqUMTg7YwULAt3GZnOCczuDs80IUWHKJCmYqXRaBm2cOX/+8EVxYt86ngqaZBRt7EZtwyoKwhsprk7niZpPl8DukivWHpc4VBcx1GgMxv9ZEBd4b5FhrtjisIEDbBv2dafXgj3NRUgmcRNKcbZrPfQD8zjHhQRTnrFfeB8gIPe8F7nW+GqptF4uY7WjakEUw6WdSUUQOpFXZTKd24kyyxIbOIZzxQ3s3wh8wneEqh8j6BQN/UybaS1fF6TWBabZy50IGMYcRXLEmtV8KHT64FJ5RNx/xur1Li7aYpVSS08jVmcFHahRQEJmwsgHqittFU6e6qOI89JY53Bw6fFcP+EVrz5/zh4DTRIjX
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(6916009)(38100700002)(83380400001)(54906003)(16576012)(956004)(66946007)(26005)(31686004)(4326008)(316002)(31696002)(2906002)(2616005)(86362001)(186003)(5660300002)(66556008)(66476007)(8676002)(8936002)(6486002)(508600001)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RHloekJmOGxlYzFURW9jTUVQNEs5UEZrcEJRTFU3eEQ1WnEweWlsQlZKR2tH?=
 =?utf-8?B?R1dHcXFpUUt2UHBJU1NrYUV5amcyOVZyajk4UVh3RXdBbnVkOEZsWENDM2tW?=
 =?utf-8?B?SXhNckExaW11Y3p2ZVp0QU8xL3Z5Wkx1N1JZQmdvSnRKQ0hMbVhEekZLSUxv?=
 =?utf-8?B?bG5IRytsazJwVWsvREl2VFhGU3d1YlZldDJVNTFOTmF1cklJakd1NEhZSEdD?=
 =?utf-8?B?MlkvUzhNeUljbEhNUXJsQXdZRENXcW5zTlZuNGZUZ3Z4dzl4bDkwT0Y0QzlW?=
 =?utf-8?B?WHVIWTgwL2ZqQW4rWURXOTRvUzIzeWNYWVNkZFc5N1Y5RTh3UzB4UGdaUzJB?=
 =?utf-8?B?WE8vQlZNcDJWdXdlZ1pKLzYyOFdVUmNTM1hPOU4yNkJRM3NKMVhjVDhRY0Nu?=
 =?utf-8?B?SkRpNzVsR29tZWl3clZOVzRQZnhOczB3eGVaM3NyRk55U3hMZktLanB5bXY5?=
 =?utf-8?B?bk1NbEVmbUJZT2RXaU1CbFBwWlpNa3RKU2xjNC96OG1qb2JYWHJrVk1ScktS?=
 =?utf-8?B?VUxVV1d6eHhhS2Vqanp0NFFwOWZGejUvSzNLL0ZOMm5ZaFV0b3g1WGhjTDdU?=
 =?utf-8?B?bVprVkdUbWhZNnFHZTVxSkhLTE1waXZ0MVdMWS9qazRBazNxemNUSEM3ditU?=
 =?utf-8?B?ZUQwNThDekNabkVEdkpWNlh5UG5RdE9XZmFFS0p1Y2d5YnFneTBmTXhvb21K?=
 =?utf-8?B?WXRZMnRjTWhTOXRldC9HTXpWeE5hcUFjOU5FUll4c1FkcnBhQTNhRy9NbUhE?=
 =?utf-8?B?bHZVQVdFaFQ4V3MxeGtmTVppOUplN3ZwNEh6cjhHbmhtYWNBT1V1dzJRdisx?=
 =?utf-8?B?ZHJMMVR4V3ZRQ1RWZmNrSEVFRnBvSnJwaGR2L0cvejRoQzR4VWVPZ255WVh6?=
 =?utf-8?B?TVEvbExHa0hhSXVIVmQ3YUtaOEx2UXRoZFJMZnBPL0N1RmZrenZqQiswc0NN?=
 =?utf-8?B?UzJZa3BZYXRlNGg3WWJ6aGtPeExncll6MWw2ZUNDTlNpLytPRXlPemgvTWdU?=
 =?utf-8?B?aVV4YnZFTE1wYWFZSEs0MmFNcTFIMjNnRzFJajdhL2VMK0EyM1BSbnBFNDZh?=
 =?utf-8?B?TFBQMXM3eDBCSHNwbnhCUTE4aVc5cTh6L2ZUQkJ6bENYbGIxUEJ1TDhDUTQ0?=
 =?utf-8?B?ck1SeDZYcUtJVk5zRXAvUUtxVHRnMGRLalByb20zaTkvdmNHQ1R1NkcwazU4?=
 =?utf-8?B?OG91V2I0M1o4d1NjOUQ3NjBybmhSS3hnOEJJZGVqRHJHM1hMRmhmL0Z0UnNa?=
 =?utf-8?B?bnJyYkpOM201WFRQK1RoQ1hTbFR4WWx4RDcvOWNRNmsraUtYOHBXQng3bzk2?=
 =?utf-8?B?bTZMQ2VyZ0JyVXA0RTgwbWhlN3JDZ2diR05UdDJyeFBvTDlhV1I4cktTREVZ?=
 =?utf-8?B?cXIyWU5kaGtHOXF4R0RpZS9UWWJySS83ekIzcWRVNGN1YUhGYUQ0NFNIRzF1?=
 =?utf-8?B?OUUyeDd0UGtOcHZHU2RJM1kzeWlDTDF2SEhxSTZXN24yREtWZjJCU3dCZU8z?=
 =?utf-8?B?MEVQS0NKNUpycDJBU3JaZWZJbWZwMjhYMVE5a0h4WGxuWjlwSzM4M1QrdmhB?=
 =?utf-8?B?ak1MaEtPKzFpU3ZaNmcvekh4VkhMb2hDU0hYeWNLWG9MWUlWeEdzaHB6Z09X?=
 =?utf-8?B?eGYrK1JSNmZQSUltLzBBbXROcTJLYWtnNG9vTXNZZnhsMnAzOEdvdVUveVgx?=
 =?utf-8?B?bHExVXg2M1lpU2lOT216b0xnMnJMZzZJSzNGeExuRzJrRDUwZlJJU212K2VU?=
 =?utf-8?B?S2Nqa05HbDkyNzNkdmQ1a0w0MW1rdjNFU0k4OC9rbFoxSDVraWVTMEpQWGV0?=
 =?utf-8?B?WFAwM1lqbFZzQldpeDZrZEFFY3N4ZXhsaEZTWmdVdjY4T0tGS3ZwR1daQjdw?=
 =?utf-8?B?a25CZW94K1ZEdmM2bUJsTnpTSjZmek1YSjArcHlKYnc3STFTaGR5YWFOaVEr?=
 =?utf-8?B?K0pBQkpPRy9ZTU8veVNLb1dlVFhjNXNoY1dUWTZaZ1JuOTVjQVdPL1JQZFNP?=
 =?utf-8?B?T2ZWYlNZbEo4ZUJOVTk0TG9QdWI5TUI5U0lHeWJrVEhhK1NEYXRUOXRPa3BJ?=
 =?utf-8?B?eDNmalJ1UVJYTEpaU0I0eWJLQzlYMnJHVTBCT0VYM1Bod3dvSEhxbDhPTjk2?=
 =?utf-8?B?YjY1S3B0Z0ZMUmJNdHhYRmlGY3hYUEc4ZTl0NDhlanFPSHVzVFNIQkhLby9i?=
 =?utf-8?Q?usI0xC0SyVrtuepCXQeihPE=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 21ac61cb-8bb5-4a2d-3b46-08d9aa953fae
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2021 13:13:44.6427
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: psnhVAYenQi/JrSZ3l9PjUjODhKaVZdb1oXHTSVyix4oeNm0R1L+X5Qj7E/U2VoWH1PP7MSJphDUuGjKKMp8Jw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5165

Both the wrong use of HV_STATUS_* and the return type of
hv_vpset_to_vpmask() can lead to viridian_hypercall()'s
ASSERT_UNREACHABLE() triggering when translating error codes from Xen
to Viridian representation.

Fixes: b4124682db6e ("viridian: add ExProcessorMasks variants of the flush hypercalls")
Fixes: 9afa867d42ba ("viridian: add ExProcessorMasks variant of the IPI hypercall")
Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/hvm/viridian/viridian.c
+++ b/xen/arch/x86/hvm/viridian/viridian.c
@@ -628,8 +628,8 @@ static unsigned int hv_vpset_nr_banks(st
     return hweight64(vpset->valid_bank_mask);
 }
 
-static uint16_t hv_vpset_to_vpmask(const struct hv_vpset *set,
-                                   struct hypercall_vpmask *vpmask)
+static int hv_vpset_to_vpmask(const struct hv_vpset *set,
+                              struct hypercall_vpmask *vpmask)
 {
 #define NR_VPS_PER_BANK (HV_VPSET_BANK_SIZE * 8)
 
@@ -919,10 +919,10 @@ static int hvcall_ipi_ex(const union hyp
          input_params.reserved_zero[0] ||
          input_params.reserved_zero[1] ||
          input_params.reserved_zero[2] )
-        return HV_STATUS_INVALID_PARAMETER;
+        return -EINVAL;
 
     if ( input_params.vector < 0x10 || input_params.vector > 0xff )
-        return HV_STATUS_INVALID_PARAMETER;
+        return -EINVAL;
 
     *set = input_params.set;
     if ( set->format == HV_GENERIC_SET_SPARSE_4K )


