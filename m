Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E0374F75A4
	for <lists+xen-devel@lfdr.de>; Thu,  7 Apr 2022 08:09:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.300379.512318 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ncLKo-0007sl-UZ; Thu, 07 Apr 2022 06:09:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 300379.512318; Thu, 07 Apr 2022 06:09:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ncLKo-0007qG-RP; Thu, 07 Apr 2022 06:09:34 +0000
Received: by outflank-mailman (input) for mailman id 300379;
 Thu, 07 Apr 2022 06:09:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/6v3=UR=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ncLKn-0007q8-EQ
 for xen-devel@lists.xenproject.org; Thu, 07 Apr 2022 06:09:33 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4a700897-b639-11ec-a405-831a346695d4;
 Thu, 07 Apr 2022 08:09:32 +0200 (CEST)
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01lp2059.outbound.protection.outlook.com [104.47.2.59]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-41-kk4g0Cb5PH-V-lQDQLNMkw-1; Thu, 07 Apr 2022 08:09:30 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by DB9PR04MB9259.eurprd04.prod.outlook.com (2603:10a6:10:371::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.31; Thu, 7 Apr
 2022 06:09:29 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::914d:e08d:7798:8476]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::914d:e08d:7798:8476%5]) with mapi id 15.20.5144.022; Thu, 7 Apr 2022
 06:09:28 +0000
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
X-Inumbo-ID: 4a700897-b639-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1649311771;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ttWm9ee+aHhw0r/e9vcokzPDdYX2VuhekspXIMntow8=;
	b=bTDInIXJnqz09Q8FqGUvvnjeaAF+TkBGGK/0IAAhC/NO33PUOuhiQT9fMm6KLeoRRp53vZ
	c0YMHZmLwQddKUjBA6K5TlS7Lp3L9ltiAZRybTWzbZzpMH4b5kR5o4a4zHPxJFmGwfh25X
	qLjqTWQYt+3anBlCoHgO1YtkeGMewdQ=
X-MC-Unique: kk4g0Cb5PH-V-lQDQLNMkw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KucKEVyvVAiorJgflsEc1usjRNCJkx9ZF5nOsXNP+d3UmiMsVdT2DJpQUw+EtTfUCI3Bl0siXzU7ByaaFaxGxt7B/MzwEq4NjAYI+twHVJZTBxbybA1Zy3HBJiGic8c13W2MIT2P+FP+lb6SJRp5gCW4LDJ0eMzL9M3y0qxiWFQ4j/D9BRRusDkWkiAyFrOaO4GOJPILJPUNGMAuXBHHnNARgv7Ubo1hlebQd0giPZ3mT3kvs+Jd+zJ/0J8gb41qFMIdd0kX7nh+GzA6650D/pt0XLqx4MRbLY1DiAmSQNbFn1aFF2zwURDooEPHjBsDwKECwvDBFayfzB1VO1T8IA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ttWm9ee+aHhw0r/e9vcokzPDdYX2VuhekspXIMntow8=;
 b=JU8FJbruwvIlEx+HJFf+O0xPX4v+hriUH9TL580dH5kERPYQSTretF/i9xQoIGAZTGj/EsA/2N8RCwtlb5DjaBaxXQsUzvjDdBO/9QHUc64j63dKN7F7rZF470TsDVKpR4uajuSA1V9qJAQPshQ07EPH4rKmqOih2Yghz2nwwZQ1WSFooDyn/ya5IiGNeKaQkuaw2hwhtFcjyFqXuNsZIjsrpcy5c+xNqPLzfVpvkSLzo4x543xqU/MVlmVp1hcyNZRvcpilyRP/ERN8too5eYRP4z13CcWwfuvdq2PLO0l8nCJjYk+CFMxLsOauL3OoSDuZ7U8EADeIv/6UBJXZIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <6e1c7faf-d1ea-1a61-5452-9dec5b8fd221@suse.com>
Date: Thu, 7 Apr 2022 08:09:27 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v2 0/2] VT-d: address fallout from XSA-400
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Kevin Tian <kevin.tian@intel.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9P194CA0018.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:20b:46d::30) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4e1e58e8-f89f-4014-e900-08da185d2cb9
X-MS-TrafficTypeDiagnostic: DB9PR04MB9259:EE_
X-Microsoft-Antispam-PRVS:
	<DB9PR04MB925974BA66F245D03D414EBBB3E69@DB9PR04MB9259.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	TLVFOkYoVhuhMm4HTH7XTrZxjfhIgxV3wqloagQhBLAHS6EByTTjhPZjy1NfM/1wyZ4/BPn5cJQeFVabLHv4clLvt/HEaUg6kmseZmDpB70kum55YZnRMVb2QcvpSNBIFWVefrGZnMfiROwhSqogfWt91W44sHU1SPfbCnUjNKC1IU/go0yxxaodgdRt6oJeGI2XfDYQHyFxm+gctM81+QPsVgQYl3aZ9vJ9OsfK+225uXOQmawmlv0cZpUBVMXOo2O4m/kNDdwknrSDGD00LyaUFXahS0dSd702Of8c6/jH4gv1dLlsvMLZCz2tX8oGjM61C/4i0abJs/bvipvaRdKzNUrQfbD7Gfjy1LdiYf8Tv1qQboQwTdHZhjCxfodEdIit0cuxk68NqLQ5atk12/bplpQNpN1CF6jObUshLMj7lujGh6NfpR/6vwfjeiwZjknesWmgzOlyqdPf0Lh98C5ydED1VAEEh8mNXzKIDXykGXF+MR/Nn+4nIxFDZG99m9fuZETjYk2zOyG9077ZW94/Infos4z4kqoxoyaSvKxrb6XsPKy2e9JR4lR2CIb13T4+A75mFKmi6nrNTD6uen7Hzu75g+4HYSg/uhwQ1DaPAU15cfyYO6PNSRbSanfftWPieWDtXehzsV2WVh0pkbOYdy0rY5TmjANhHrxzaGXmkwUjuRc29wdyodMhYkfwSytZuMdfDHb14qSslBqYhX2XAnlqehkwXAi2BgF5pABF4hZQJebpiY5u1WSFfaqU
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(4326008)(26005)(558084003)(66556008)(66476007)(6486002)(66946007)(186003)(8936002)(8676002)(508600001)(38100700002)(5660300002)(6512007)(31686004)(31696002)(316002)(6506007)(6916009)(2906002)(54906003)(36756003)(2616005)(86362001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aHpMNlVzWW8rRDlPVW9sVUlodE9VR1E0UDBmS0xJN0IzZGgrSWNXbkREVXNx?=
 =?utf-8?B?MXZLcHlZdnIyVTBFS3hhMURFSk1CTzV3KzhKYitZTk1lOTBqOTBJb2dOczlC?=
 =?utf-8?B?ajc5Y2htU0Z2cm5MZUs4K2pyNk55eGp3aHVqYytvdkhnRjRuTC9ZdGxJSDFo?=
 =?utf-8?B?Tktrejc1YlRCV1pEd2IrdTA0eDV2QkFuSm1ZQXV1ajMwTkVEamZhcEpHZjFn?=
 =?utf-8?B?T1FEeE1icDIybXNnZ096b0lyUER2R3RXbHpsTkdKNDBXUlU2ZlhMczJXMFhB?=
 =?utf-8?B?R1NTU3VIMXZuTSsrSlY5U1JuazhubmtjbXZCbktWU1ZoU01uMTNYZ3kwQWly?=
 =?utf-8?B?RDlYbCtBYmxPSmVtVVRFKzNUbWZQL2ZUNzhuSUJHVmFVMENxUlF2Z3NiaFQ5?=
 =?utf-8?B?YzJsdzM2K1NXMzNUMDQxNmo1SFFVZzFnUlhOT2FXN1REWjZJaW53RlhoRnl5?=
 =?utf-8?B?bng1L3h1UmdwdHU0aTU0ZnEzSnQ0eUVCUDVoZkJrcGdyc0tab1B1alNWL0Nh?=
 =?utf-8?B?MGxKakJTU2kreEJwVS9ZVVhUSzdYcFJ0RnArZnNDc3RUSXFoR2k3UGcrbnI3?=
 =?utf-8?B?emFNYTVJMkhUd1R2RWxjbFJ1Tmw0WTdOYzh5dWNidjEvekFJYnNOUmpBQlNt?=
 =?utf-8?B?MjI4TmVvSE85LzlsVTg3Mi9ET3pEQzBvVFk4RE0xcEY1UEY0QVNtVi93eFpJ?=
 =?utf-8?B?amhFLzErQmxYaHh3ZE1wY0gxdTJVa2tEa1l2bE5LRG42TEtvNUV3aVd4MTV0?=
 =?utf-8?B?YitGRFFsTTllQk84Ym1QQ0tiMjUzSkU4ZjRxTGFORkh6eXJiYjYvVGgzZndo?=
 =?utf-8?B?OTNFdXlRRXpjMXNzMlIxWmJaSllzS2NIanN6MVlodk45dVhOKy91YXhwaG4z?=
 =?utf-8?B?eXF6Y1JtSmU4MFRwWC9zR1h0V2srSzJiQlp6akFzT2xyMnUyVmxrUGJ0Mms4?=
 =?utf-8?B?N0M0KzBZb0xnQmpFVlJYOUhkZ3ZFckNGdS9sSEdyaFZoWitYeWcxZFJRN0Qv?=
 =?utf-8?B?UHhWdGpiTFpzNHh4UDBVRUlLcHJPNGhWYTlqNm5EOVJlY09hWnZPOWxVck9C?=
 =?utf-8?B?a3VucFZ3NWZNQ3dhOWlxb3hkc0RVZklLOEh2Tis4NU5NUTZERk1oWE43TmF4?=
 =?utf-8?B?OWRNQjR5R09FZm53SDR3S2ovMmhRb0tabFV5SFZ4ajg4dmFIM3IvMXMzTmNv?=
 =?utf-8?B?Y0hpUjQ4L1YwVGpnbG1rMjcrL1RCYTdaQWtmck05cERsdW1MYi8xQ0JmbVZk?=
 =?utf-8?B?YUpvT2haZkpQaEFnK3FRN0RmdXZ4eXZEdzQvNGFQMWJmaDNBTkxzOXdvWkpi?=
 =?utf-8?B?SlRnZ0RLWDZKWXZjOUlnZ2MyVUZtTkhYK0F6K0NTTGxOYnFjOVV1U1BITEEz?=
 =?utf-8?B?dWlENzJPQzNOejNMMWZFdXNhQk9IVjlTUnluK0hGcE92OGFabkJsVnljeFpv?=
 =?utf-8?B?aXh0bU1Nc2pOYXNuRnZPTnUzZTRMQ2JNVFNCWjI3ZTZKTlU2bEhpQk5ZOVJE?=
 =?utf-8?B?UENqbytMek9tZnBsbUMzcllkYWhMbHk4Sm5qNWxtY2pLZENJWjIxejJaYklG?=
 =?utf-8?B?SkFSRHlmSjB3UXZva3VpS05oU3R4aDJuUTVHODNRWFBVenNmczRrUU84a3c1?=
 =?utf-8?B?V0IxOTc2NGd6OEdZQW8rZGVnSnQ5VHEvMms2OXRTMlRraHNKK1dWUW1icXEx?=
 =?utf-8?B?MDZSQlNZV3FzRXRjb1RXdVAzempOVFpLZTgrbUhuVWJGazRkeUpySkJGN1R5?=
 =?utf-8?B?L3NHOXM4ZnZxekdLeVlibzArVmRQSUxoUkZRYUE4aXhPRjdsK1YxWVJHYXRt?=
 =?utf-8?B?VHhkaXgrczh5VHlMVld1bTI1ZndaTHhxSm1BRUJzbmtLdkI3QlFlZlZ4Wi9H?=
 =?utf-8?B?ZlAzVThWbEJIdHhlWEpqSEtqKzhCTHk1NSt4Ly93MlR3RVRUU3JJY3RmeXRQ?=
 =?utf-8?B?MGozQ0pGUGRWazZ0RVZWNEpqK0tKTHg2ZTM2dzFQbDUyMmRPanhTNklqYlFW?=
 =?utf-8?B?MWdTZWNGVVJMMkxUbFhYMmExdnlJRVp2SjhSTVYyZHpNU1lQQnFoaDkwNC9F?=
 =?utf-8?B?ZGJRRU5XQWY4QzU2dkZ5L2paNTRKcWVhTm41dEp3eW5ZWGlaWU8yZC91TlpD?=
 =?utf-8?B?V3l4bFNLU0YxWFpkenhiQi9Yd0c3R2FaMUZiUHJKRkJZY3N5Ly9QV1Z6Y3hM?=
 =?utf-8?B?N1JxMlVHUC9mTmpLN0pGdWR3L08yWGVvM3ZVL25MTENBSUxvWlh0cU5WbkFY?=
 =?utf-8?B?dWVMdDU4RDV1aG5ja05Fc0tnd1NrQkh5ak1EY1dIZnBwN28wOGhrbVRmMWlF?=
 =?utf-8?B?WjZzUmVKdUllK0VPNXVLMjduNlEzTW9KcHZEQmtoZjVGeFBEVGM5dz09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e1e58e8-f89f-4014-e900-08da185d2cb9
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2022 06:09:28.9158
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ogXaKd5xb2bitr9FO8AK8KHoXqdzpJExNsV5CA86+aAO1TBOFrkmE06A1qxqwCoEC2CIKiaTqI+2xKexuWxs3g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9259

1: avoid NULL deref on domain_context_mapping_one() error paths
2: avoid infinite recursion on domain_context_mapping_one() error path

Jan


