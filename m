Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F0597D2F90
	for <lists+xen-devel@lfdr.de>; Mon, 23 Oct 2023 12:22:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.621255.967527 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qus4O-0005lv-3x; Mon, 23 Oct 2023 10:22:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 621255.967527; Mon, 23 Oct 2023 10:22:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qus4N-0005j1-W1; Mon, 23 Oct 2023 10:21:59 +0000
Received: by outflank-mailman (input) for mailman id 621255;
 Mon, 23 Oct 2023 10:21:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OVTz=GF=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qus4M-0005iv-Nc
 for xen-devel@lists.xenproject.org; Mon, 23 Oct 2023 10:21:58 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2062a.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::62a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fe26bdf4-718d-11ee-9b0e-b553b5be7939;
 Mon, 23 Oct 2023 12:21:56 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AS8PR04MB8296.eurprd04.prod.outlook.com (2603:10a6:20b:3f2::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.11; Mon, 23 Oct
 2023 10:21:54 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d924:b650:a2ad:7b25]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d924:b650:a2ad:7b25%3]) with mapi id 15.20.6933.011; Mon, 23 Oct 2023
 10:21:54 +0000
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
X-Inumbo-ID: fe26bdf4-718d-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Yj6zD4WLCnkD5zMKz+yXTRqlHjcbb09RsDRpxFgiaoX1YE0KMUmqamFd0xwR1hBMMMwy/uzpoAMRVfssxYpTGUSWeI32Sh7dBWXdmZ5O9u1WTJ9KyDzoL+Wi30nBaiYZqVQmmsTplGcypY+ntwBrWUzV1/U0xF0NYldF5Q+ReAECEh4DNXR0J7xAGKUAg7xh8CpmT8TovkeMtFgRmYfbE3b9VLyDSt9eK0djjxgsr8DIWT3jadWv/aoHXV5A+vdoZW5yBwjBOxGUDdL4+nt+7VgxKZPjrzqScjbLzmjqD0gxDwrp4L3MLOmJqx2nz7qL07d5UNs8CKUTNHggMvBTLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7zKrMsetwLuXRUDlqzkwFWJDW+Hg2UiyAYy70dYVY5Y=;
 b=LKK2Y1Ay+BFaepP6D66DSHqfAswGgaSoGRjG3NbsyUI9EJ4FSjgJeNCdmnXygbIZorKRE+7u7iTexoXTsZFWjPXLq47ERlZf9JYt/k5qlLbbVJwYVT0BL6+uRIBFGcWCmByOu42UbEXn92DB51LIjx/lXsY0TJh4giYK1ZfH+DgbBxY6ktn5iq8kvdCqPrpDfRKpFMO5zyEiMnC/ZMLDVLm/Zls9fOip/yH+0B8zDCueDlUupPTPxaCee0xzFOyzmvRTdJpBb8pNsrb+Bd3hVaYi807iQBKbFXeu6KaPZNOzYBVnv+2jl20vk6+t/527jt9yPxl4KEgKO/uca1AUZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7zKrMsetwLuXRUDlqzkwFWJDW+Hg2UiyAYy70dYVY5Y=;
 b=4GXQRh1WSItzFvIp7f1DFl7hev2ztBXPfQu7sSFsTjMAhllj1Eht3RiZ4K6+r9B62jYKfZ8scyh5zw5mzyL0Y9cAOtVbTA/IwJfLvLblbO+NHKzIaN+OR5Ovkz+v6Po9jnUi/fvSxRvXaDyf662u98ZQRpu4GW8SmwxxXfKhiZaQT1/sNxm7JWH5FKlQbgQiMNtt9dZUTWh4OB0Fj9i1OeqzsGcZqDJ1ZspOPF8l+wJlYKVIz/69D7bwT+Fxbb1fmrvuZ1jltdU7dOzOVovCOFVa0xswiN6SIhUvoSn7TBqflPLszJjJ8FCTT8MICLTzQGhUHx8XEFbUWyDKQupalQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <4d229be8-6daf-c27e-c9c0-01af6e4862f3@suse.com>
Date: Mon, 23 Oct 2023 12:21:52 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [XEN PATCH][for-4.19 v4 6/8] xen/console: remove stub definition
 in consoled.h
Content-Language: en-US
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 andrew.cooper3@citrix.com, roger.pau@citrix.com,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <cover.1698053876.git.nicola.vetrini@bugseng.com>
 <98443e951c5c51fc0dbedf1e530d1c27e564e19e.1698053876.git.nicola.vetrini@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <98443e951c5c51fc0dbedf1e530d1c27e564e19e.1698053876.git.nicola.vetrini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0189.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ab::20) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AS8PR04MB8296:EE_
X-MS-Office365-Filtering-Correlation-Id: bc0b648b-27e7-4203-6fa7-08dbd3b1e121
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	1RwsmoC4c9gc0OSUqL7Ge6rg18XbDGyVhZglS2umlc8TxwCll//+/x3HjTrnut4gsl7WL0VJkWB/A6Gfh0mxM2CpqAxn/+ZqJ3eW6bW8I2ijwr3SrHhqrowwmuLuIMvu8nKTBR0uix6hcKrF81MMWQJbRaAOGfPueoVocy889HvMpMypH2MwRjuhJUdK4jJZfpNd2mV1iSLMvicShpGa9ggB08bkcSa6B3mbFAFU2gHNORjnNGuosvYGhkMLf0d9PGeQoIcHKhyISA1xI2Utu/6u0p3bbp25+73E6nt83olnXG9aVFyPZj8D4ffiHXVc7XQldO0gMUr5UO2jwZfrmu4cmYt5VjKDP9CGGXzCGXIMPanDBZhjREWbriPVwTYbsWWWRX3Gs+GlfMT4YFd6SBX4TcYmWMqEBhHCpCWlsI8itXljUhG7iT8AEOhnk8xSi0UAMZV8rVZzdmWbpRZ1grEjbKgHt3Id9g4QwhH+DOnaxobpHQUidgMJupKlgOBI3Vj3MRG3/c68rxGscSxyqDD+o7Pzs3WIgZJNFxJNn+k9olAZkd8dwvQwQSa/qFoW46PXYJsUsHNX9INKRJ/Vr+cVXqmspVvME+YTZsJQnrpjWnT+6Ybme1lkO/8ekdj8fOcunCQWb6hYwGx1HoRNjA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(136003)(376002)(39860400002)(366004)(396003)(230922051799003)(186009)(451199024)(64100799003)(1800799009)(4326008)(8936002)(8676002)(41300700001)(2906002)(4744005)(7416002)(5660300002)(53546011)(2616005)(26005)(36756003)(38100700002)(6512007)(6506007)(31686004)(66946007)(66556008)(54906003)(6916009)(66476007)(86362001)(31696002)(316002)(6486002)(478600001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VGliNzVFQXFpSGZHVVRQdjYwM0NjcTMySFc5ZzFiUk00WkxtTW15Mm5tL3pr?=
 =?utf-8?B?dHpNdlIyQVo0aVBPeG8wL2dWUmlSellXWWVDY1h3cFhoQ0crdTN3NUxZa25n?=
 =?utf-8?B?L056K3NvZEZtWG9ZbWtSTXhsQnpvM3J0WFQzb0pKdENhUkxmWnVBdktXSkV4?=
 =?utf-8?B?N1V1YjcrdzAzeGZCazk0RmVmbkhVQTI1NmF2RW9YZjF4cTAydExjZUpGSXVj?=
 =?utf-8?B?dFgvWXFMQ1ZwK3JiQUhZZEVyM2R6Yit3dkFoVWlqaktXUjVMbVRsN0tzN2RT?=
 =?utf-8?B?UEpWU24yMTdkbFYyeVVLRTZnbStKbnRuUWpGLy80YzJ0Rmo3Z0dGeDhDVS9N?=
 =?utf-8?B?MFMycTc1a2JLUkRGUG9Cb1NXUWJ4bW9JY3V0T2p6Z0tRNVNVZ3dmWWJtQWJz?=
 =?utf-8?B?Qm85bVNZbTY0Mm5pSncvZnZkNWtzRlRHRktXYVpjOXUyVG5TdHZqZHZucUFp?=
 =?utf-8?B?OWZ5WDY3M3h1a0JadllVV2c3NjVqOFl5VXRoSUZacXpTWVBiS3R3NUt6S2pl?=
 =?utf-8?B?cjQzdGpGK2ZPTEhJSjJ2aG9QV3pTMkZzZ1lsSEY2cmlSZmhFTjhHQ1JQaWU4?=
 =?utf-8?B?WU9XcUw5Q0FxRjdmaDZNYS9LUzhQNFRTWnc4VW5DUkxPMFlPaGlodHE5SXFB?=
 =?utf-8?B?bEZFOGVYT3dvdUhueE9CcHQvaDNaMzdYdUVvaEtmRThmMlllZnd0OE1tbHpq?=
 =?utf-8?B?ZWpxcjJ6SnB4d0xOL3ZCMzUrQWcreFRaYjVmV0ZBSk9vMVRxdy9oRTUwWHlC?=
 =?utf-8?B?WmJUVmpKR1dRWHMrZklHRUhReGVHSzJmUGErZzdhWCtLOUx4YlpPUU11aGpn?=
 =?utf-8?B?dHlZTVFzY3BvLzljcVgvYkcyZ2ZaM1lOWXhpSWFhcytvMHBrUGNVclU4TVh3?=
 =?utf-8?B?V2dZL0pXNmM1V05XRzROcml4UUkzSEZqQy9SVXRPVmxCYlJBcGZrSThxQ2xW?=
 =?utf-8?B?MG1Bd04xZC9haW1HU2ZQRFNxQzZxOU1CNXZFUi9aRDFxVUZkZG1Sd0ZtU2pk?=
 =?utf-8?B?UEFLNnNoYm5ldGM1SjhMVFVCK01rcGQ4ZE9oZENaQUl1TFNSbEJxTXNieGJK?=
 =?utf-8?B?YTd0Rkw0c1pmVU12MzY0bW4vUWFWSTBjKzZFVlJ4TXp1M1RmZFdoSnFocThF?=
 =?utf-8?B?MGFTZ1k2WlJhbkd5MWlSOXlDK1h2clBIRHh0RUl4TXl2QWRuZXZsbzBZNkhu?=
 =?utf-8?B?Y3RmYnhwSU5oVjl6UXJEUUhaZGhMSFBaUUpzdDVrK0pxSTV2NTQ0NkNxRkwv?=
 =?utf-8?B?czJRcnAzZlFSL0RsL1VkN1Y3SGM5ZUVsUlYyN2JhaTNpM0c4S1k2TGZ4bWFK?=
 =?utf-8?B?ajh6RmEyVlRJNVd2Qld4VkJDaXpsTCtvMEIwU2pEQ2c1Y25nUkpObnlvajZM?=
 =?utf-8?B?V2lCeFV1L3RuSXFVazdvYnE4eGwvTTJZVWQ5dWs4eTJMRDlNWnVUZ3cxY1p3?=
 =?utf-8?B?d28rVGdRY2ZZYk9jeTB0c3lkNk41dGt6S0hwZ1Z1WUwwc3dVRE1ZVXMraUxy?=
 =?utf-8?B?eGNCT3NiaGxQOUlSOTZNS3cvVFArOU1FUmRaRnpCbWJIZ0xQcVpLQkFtYTd6?=
 =?utf-8?B?dThpOGUrSE51OW5paVFrbTgxd0JPWjZrbEZ3TjlRRndDZkpodUQ5NC9iVjgz?=
 =?utf-8?B?TS8vTTNITGxVRjQwZ2xTNVRUMXVkWXFvUVRmZlB4UW1JTW16SGRSdG5FZ1Iy?=
 =?utf-8?B?dTBzV3ZjUWt1L1g2aVlJUnBXb0M3TWlObVhaWlFXamc2N0UrUFU4ZDh0U01D?=
 =?utf-8?B?eERMNGRtTzcxRGdyZXNCYmI0R2lxTGt0R2R2MlRkWTVGUzNucWdvSnhyWnov?=
 =?utf-8?B?VS9UY01mNVlxYzdWY3RlckpHSXdsWDZMMmJBY3dqK0tqUUNpOTJ5eUFUZHNv?=
 =?utf-8?B?VHNHUWZ5VzFobzdMT3ZBZEFBL1BGbFFaQjFFbzdkbFlNaGVRaVNJc1U2U2Fl?=
 =?utf-8?B?OXZ2Q0MwRGhiMmJmZjVJTElwMHB6Q01DR1E1NEhmV1RzUnU2dDlhYmxZUTAz?=
 =?utf-8?B?eU90WCtFa0FMcDN5K0lOZjd5YkRPelpLRDFtUndwOHZhcjVhS0xjejFqeVlx?=
 =?utf-8?B?aHRETE9QM1FPeVdDeEduREZWMGRmb05oTy9sVy9KM29nd1ZNOHRmNFNQbGto?=
 =?utf-8?Q?XP0L7yy1+Ya1/nxYlj64akdTJ?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bc0b648b-27e7-4203-6fa7-08dbd3b1e121
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2023 10:21:54.3684
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RywWSnaXKAfdC8SJxxuFjJ/KM8FV+7Fpn6iHC0l+ILNyiiaF2SOHOouJ0DAGy34IsDZyMp5+lHdjUH3iAN06mg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8296

On 23.10.2023 11:56, Nicola Vetrini wrote:
> The stub  definition of 'consoled_guest_tx' can be removed, since its
> its single caller uses the implementation built with PV_SHIM enabled.
> 
> Fixes: 5ef49f185c2d ("x86/pv-shim: shadow PV console's page for L2 DomU")
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>

Where did Stefano's R-b go?

Jan


