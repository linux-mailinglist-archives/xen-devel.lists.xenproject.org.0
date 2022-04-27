Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A2FD51116A
	for <lists+xen-devel@lfdr.de>; Wed, 27 Apr 2022 08:43:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.314391.532439 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njbNo-0003BV-Mn; Wed, 27 Apr 2022 06:42:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 314391.532439; Wed, 27 Apr 2022 06:42:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njbNo-00039g-Iq; Wed, 27 Apr 2022 06:42:40 +0000
Received: by outflank-mailman (input) for mailman id 314391;
 Wed, 27 Apr 2022 06:42:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=PTsb=VF=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1njbNm-00039X-P8
 for xen-devel@lists.xenproject.org; Wed, 27 Apr 2022 06:42:38 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3a1c01f9-c5f5-11ec-8fc2-03012f2f19d4;
 Wed, 27 Apr 2022 08:42:37 +0200 (CEST)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2176.outbound.protection.outlook.com [104.47.17.176]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-4-J9KvaoYlOveM_zSY0z7J_A-1; Wed, 27 Apr 2022 08:42:31 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by DU2PR04MB9081.eurprd04.prod.outlook.com (2603:10a6:10:2f0::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.21; Wed, 27 Apr
 2022 06:42:29 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f%8]) with mapi id 15.20.5206.013; Wed, 27 Apr 2022
 06:42:28 +0000
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
X-Inumbo-ID: 3a1c01f9-c5f5-11ec-8fc2-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1651041757;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yTJXMMcoQiypeivkIZdPtIMIr8CDJ5JMmO2GxSpbJ6I=;
	b=J0cbet5g3V2VXCbCxNep53XvC6Tw2SV8WrMOG8fVSBsmgCD+MvNkzoRWwOrjV0Z02ItqRk
	fwC+cUC4LgS02ArO1NcCUIX5sD2rdlVLco27rrgVp05Z2gfyI0zNE91FkNdkgfoaKq+Qx9
	U5O+JlZCpp/6eT8uYr8bfLB4lYM5+6Y=
X-MC-Unique: J9KvaoYlOveM_zSY0z7J_A-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ODmGsZ6LD3qsnzB00qrpwwHdo84mtwiuLwozWXEsrrwZtf2Aq050oDdJsAkku5kcEFn3TsRBWGahYsdx9MHIw2AsA094a0cmDlBpA1sM3YscM4BT0zevs8MnnK9vKv5gSF/ApRpLws7AzWPL3fcCD8nVwgmRReVueNNIYMJrbPiTgTW7hId3wZkLFUGdQhiNsAMdrvGdOMT/Ke1p17yc5uPHzIi+GrqZPoGyMMKyB9Dw0B1SXo8Adz03p0FCHpyNSDs0kQbYAmdrhyi/M5CYK/I4iZLAk9A5Y4iQgq5CFbJpBNAt9tamtploYKWt23V30pVsmqZJ2js7KE3+3jzVkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yTJXMMcoQiypeivkIZdPtIMIr8CDJ5JMmO2GxSpbJ6I=;
 b=NgzXRfXqFVEOojZ6Ie/530jglEITw+oFsFloex5aBHdNVDtivQvHiEd8IWbQOHasNQyzIbU3m/kAro5O5LJApCP0NrAs2TY8M7KEANHO61eKMDJcXgPgFN+srH4TuO0WIRcU+ZncXNQi0YEL+nPCrcjc676j9VbzxEHQeOdqQfsgqO8PnNd3S6pAIs2ZZKB6OQL9BduI8K7Y2y6XmLvOa2/iJhvz84FIzJNLRLx02e/pBsVJAV3S+vwLJITktn1TFim6Z35oX/xDBGKNEa9dLzY/zBACurixj/pFD/dn4m6Bizc2+Gl+UL79L2pGXO0gLQwGQ6GGCq2gKgu5uYP8+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <0aacc53d-279f-2e0d-b495-217133e75e03@suse.com>
Date: Wed, 27 Apr 2022 08:42:26 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH] xen/arm: alternative: Don't call vmap() within
 stop_machine_run()
Content-Language: en-US
To: Julien Grall <julien@xen.org>
Cc: Julien Grall <jgrall@amazon.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 David Vrabel <dvrabel@amazon.co.uk>, xen-devel@lists.xenproject.org
References: <20220426200629.58921-1-julien@xen.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220426200629.58921-1-julien@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0005.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:15::10) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 96f6f247-84f2-4dc4-0950-08da28191937
X-MS-TrafficTypeDiagnostic: DU2PR04MB9081:EE_
X-Microsoft-Antispam-PRVS:
	<DU2PR04MB9081D9F095E98E5314223A8BB3FA9@DU2PR04MB9081.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	48ev6PPBhHfj9CmfMcaNj8sgS7aProxYxWNU+189BCcA3+GzQNwVlWkbSap2ps8czEPh4+UbBD5k2uQmkWDBAAkzIo4Susd7vRb6mAv0Y2f3MywIU39Xe1q7iBpTwypvV9/Uiq3T9+TXjvGmETafJCSpuwzFlG3NDmFjhm8KORY/vMj+FGjtjADeA9D593EXkJMFHe5uMsUaImQo7xFrIaZSc3bkr6xHCe3dTDix5vXW/ivZeUl6ZcMYkBOEy6c0iI0qL3brBGRBdRDI871LiRZ526+QunHsLi29fFiB/27pXTsLquTr29/fal5m6CN0Pt9xg2QkWlA6zicS0/JkDrI5NZktda9TUy0WP1hD8LFYAGgsCKGrN5a/tEL8YTkiVskP12NLxCumTZcPfLBLupXuw1SOHSOI6bNyR7l8/3OROISE62av3c28l22uvCFOsibm3qlHNxFqFZI9hegXndnjnw7YrEFaP0OaXU7ihvn1GdNwvBLFK5qknxxsjnGmryJOGh3Z2jtdRs5K3/YeAUYLg6LVvoj/m4VKKasPEMLz0Fg4JyECt6XgAgacYmLfApGLcfIGgq7UpV5quStJEMBgxU6yJjrjrlJZ1iiqX4XQJGRZf8I4bHqrffXcNVps8SaWoztCGu3KLJMrDyFGD3Hy5hn1D85pMTjKVD2HqMHyWb4AXfpnGuXpzmc53N/PZ5H3rKGBGoOVRpKxYNrE6nF6nVM+0Zw1M2pyD6EWUU+RlOYnBrejGD5kXwSmjboQ
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(54906003)(6916009)(86362001)(6512007)(26005)(31686004)(186003)(2616005)(2906002)(36756003)(66946007)(66556008)(66476007)(8676002)(4326008)(5660300002)(83380400001)(38100700002)(6506007)(53546011)(316002)(508600001)(6486002)(8936002)(31696002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MXZTWFRHSVYyKytraXFPK1h5d1AxNTNWNjRWcjgrWGxGRWFtLzF4cU1vR0Rq?=
 =?utf-8?B?YWJBWEl2T3lwemNiOXluTDFQVFZTQ0NUb1BoY3ByRjdMNndROTRSUmVpL0JQ?=
 =?utf-8?B?NkJ3RzU4SUQxT2EwYis1azBrVzIzK08vYlluanlmV0dCMGtuRXFiMlhXUm1M?=
 =?utf-8?B?dE9ZL09DVmd0WnpUM1IwSDcra3crQVluYjFvd2NvLzRXWEc3czVEYlJlZDZ0?=
 =?utf-8?B?WjgxWkV5OGUzRFBMcTdoMkIvYmF1R1J4TlljNkIreWpXTEZBdTVMQmNvdWdP?=
 =?utf-8?B?aXBSZkVhWHk2bXFSbGNYQzA5STUxdWVjNEo3SXdPa3pXdlBPNU9Yc29YbmUw?=
 =?utf-8?B?ZkhTeU40OGRxWmxrSC9uV1BlUGphOE5Vd3E2b0tkaTNmVkV5RHVoaW8rTzBG?=
 =?utf-8?B?VUo2dWx5K1ZCSG1INmt4dGlwSW9LMlBNeSs2NCtnSHhvZ1dPQVdRazRkVFNo?=
 =?utf-8?B?YlgyKzQrazF5WG02UUZVbmx3WHFpRVhvaDQwTC9jT0xOYlZwQmgvM2dvYTJn?=
 =?utf-8?B?a01HUFg1RDlQbG9RWDdvc2F5SUhQek1iS05seDdsMC9sOGtleXUrN0tGd05P?=
 =?utf-8?B?dktqak5Ja29hemFnOVpXRmF2Vm5raUsyTVJVOG9KdGxjQVNXOGRzZFNOd0FB?=
 =?utf-8?B?MlFPWVBISllKVS8wZkhHN3ZmblVOaFdudTdOYXZwa0hWb2c2VVFjRmdZUEI1?=
 =?utf-8?B?ZS9aY1BFUWZqNmM0a0puaVd6MXk5aDh1T2tJTTZjVTNGRS9BQWRURlNEWGtM?=
 =?utf-8?B?M0FaTkxucU9hakRNclZNcVZXSXlOcDRpZnluR0xhZ05JL09vVzNQcEtMblc0?=
 =?utf-8?B?YnhPSFBXcHhxRitHQ2Y2OVBmampWQ3pjWG50Q21GYjlod01uR3dDMjAxcFpk?=
 =?utf-8?B?eHVJVzZ3QTRGQnZlTDRXV2RpM05iN1pIb1VWMnpFdW5WeTJpQ0t5SGlCUkJn?=
 =?utf-8?B?Y0xqRXhkTjlsNmI1UHFmSkNJVEFTa0U0K2c3ZFg0MEhiSmEwVE93dEtleTVR?=
 =?utf-8?B?RWlhczF1M25FeGk1OUc5WXMrVHdaUzdlWlpEL2t3Z3JURnNhamtYN1JTaWdQ?=
 =?utf-8?B?V1pRUmI1MGgwTGFjRVFTS3NBTWM4cldNckJ2SjVxWVphdDdhTitwNDRWWC9z?=
 =?utf-8?B?MjR3STRFTEpjMlVnM1RmQ2oxd0M0QlM0RzlXUjg3UFh6dVRWTWlFQnl4OXMw?=
 =?utf-8?B?alNIaHpUK0dKbTFOYzJyWTJseTJPN2lJOE9nL2YxUHpPeitta1FxRmxFWFkr?=
 =?utf-8?B?Y2x6dU5FcEhjNkRCTUxFbWRJQ2RLcFQ1L1B3V3JzbThUbDJhL3ExTFhaMWZ1?=
 =?utf-8?B?OFhpWmhJQVVLSzF4YWVEdU1KWUlJd0o4cThmbmxNekJHUjd0N3pkWDNQZFh4?=
 =?utf-8?B?SnNLazU3NWF5SXNYQk5MeVRhZ2g1eWxXWWpDcW1NTk5zRUtlN1lVQ2wwVkkv?=
 =?utf-8?B?UmNORFVzckhHSEljNjJxUC96bGtWcm9sSHRHY1ZYV2Nsc3gzWUpkOVpxdDRY?=
 =?utf-8?B?SllGZW8zanFrZDBkMnU0aitsVHBGaURRWmlhWnA0OW96REpjQlBQSUo1a3JK?=
 =?utf-8?B?NjlscGRBMkZIQTZJZFMwYU1KeXdKWWtub2ZMcndSdmhvbWkwaWdsdUlIU1Rn?=
 =?utf-8?B?S2cyR0FEdEpUaGZ4VTh4VXNMMzhNYWV1WUxmU2xjclJ0K2c3Ty9UeDJJMUYz?=
 =?utf-8?B?ZkxUMmZIcmUxV2ZoajQ4K0dpTkNETTdBNWd2UEhFS0djWW5BZHV1Uk04bUg4?=
 =?utf-8?B?ZlUxVDgzaUREaStBeUt5bWoxSlVYVzlOSEcrYW1tYTZRV01MMlpUazRZeENa?=
 =?utf-8?B?ZUsyWmdaUHduSnBqTzF3cFMrb2wyUVhCeFVZOTd0a254bHVRN2RxWU1yeVNY?=
 =?utf-8?B?TmRIOUx6OXFVVVR4SURlYkxDbDVENEdFejJGZkl5eW5BNVJ2Z0xQQkxSemhC?=
 =?utf-8?B?YklDZFlmdDBDM1hDR1JBMEVnNTlrUkRTaHZBd0crNkFGdVArRUc3am9NZ2xq?=
 =?utf-8?B?OTdGTi9NY3V3b3lJeXlaTS9MQkV1dzZKNFFCQUcremlGOWZielpyZGxXUXY2?=
 =?utf-8?B?d0QraWt5T293b1FyOEtyM3RnYzk3dk5vZ1Ywd0RqL3FHZUJDeGZMamtweDRj?=
 =?utf-8?B?YUJmTDNQaWM1enVGdVhZTER2akVZVm5HV0d3WC9zRGhveWFyV3VHRmZVWU1S?=
 =?utf-8?B?aXJJMnI1emE5QWJINVJzN2dFVkJIN2krcnp2aGhGUWNld0YzOCszVTVYS1d5?=
 =?utf-8?B?cjd3SVg3bjgzY21iaFdzK21IQzlkZndkaWlWdUwxMEZvSjZGWDl6bFB3aDFW?=
 =?utf-8?B?djZ1WFR5MW1iWVZQRnJJcmNzcW9aYnhkWlFLOVhZWmp5ZG9DaGFGQT09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 96f6f247-84f2-4dc4-0950-08da28191937
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2022 06:42:28.9302
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ttVB7Ep2naETa8LrHwPArMpnfP2Ucg/6L0U9gNrLmF+4tjTA5q1kw63xMlDuRLVauG0RICS7dKi9vJ1qnBDyDA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB9081

On 26.04.2022 22:06, Julien Grall wrote:
> From: Julien Grall <jgrall@amazon.com>
> 
> Commit 88a037e2cfe1 "page_alloc: assert IRQs are enabled in heap
> alloc/free" extended the checks in the buddy allocator to catch
> any use of the helpers from context with interrupts disabled.
> 
> Unfortunately, the rule is not followed in the alternative code and
> this will result to crash at boot with debug enabled:
> 
> (XEN) Xen call trace:
> (XEN)    [<0022a510>] alloc_xenheap_pages+0x120/0x150 (PC)
> (XEN)    [<00000000>] 00000000 (LR)
> (XEN)    [<002736ac>] arch/arm/mm.c#xen_pt_update+0x144/0x6e4
> (XEN)    [<002740d4>] map_pages_to_xen+0x10/0x20
> (XEN)    [<00236864>] __vmap+0x400/0x4a4
> (XEN)    [<0026aee8>] arch/arm/alternative.c#__apply_alternatives_multi_stop+0x144/0x1ec
> (XEN)    [<0022fe40>] stop_machine_run+0x23c/0x300
> (XEN)    [<002c40c4>] apply_alternatives_all+0x34/0x5c
> (XEN)    [<002ce3e8>] start_xen+0xcb8/0x1024
> (XEN)    [<00200068>] arch/arm/arm32/head.o#primary_switched+0xc/0x1c
> 
> The interrupts will be disabled by the state machine in stop_machine_run(),
> hence why the ASSERT is hit.
> 
> For now the patch extending the checks has been reverted, but it would
> be good to re-introduce it (allocation with interrupts disabled is not
> desirable).

We definitely should re-apply that patch once the one here went in.

Jan


