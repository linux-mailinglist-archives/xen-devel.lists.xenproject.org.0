Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 89403776195
	for <lists+xen-devel@lfdr.de>; Wed,  9 Aug 2023 15:48:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.581119.909670 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTjY5-0006rY-7g; Wed, 09 Aug 2023 13:48:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 581119.909670; Wed, 09 Aug 2023 13:48:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTjY5-0006pF-53; Wed, 09 Aug 2023 13:48:29 +0000
Received: by outflank-mailman (input) for mailman id 581119;
 Wed, 09 Aug 2023 13:48:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nhcc=D2=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qTjY4-0006p9-9W
 for xen-devel@lists.xenproject.org; Wed, 09 Aug 2023 13:48:28 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2061e.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::61e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6a78b682-36bb-11ee-b281-6b7b168915f2;
 Wed, 09 Aug 2023 15:48:27 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DU2PR04MB8904.eurprd04.prod.outlook.com (2603:10a6:10:2e3::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.26; Wed, 9 Aug
 2023 13:48:24 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6652.025; Wed, 9 Aug 2023
 13:48:24 +0000
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
X-Inumbo-ID: 6a78b682-36bb-11ee-b281-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Qt3jCZT36OvyLyjVbuYqBu1bRoW+ETHahrim5JAfj7b7Ikt1HSVTJMD6FVzWl5zLC2SFLVIzXsngIj+y6PDloC1Hj+ZoBQHVXJk/6vfIwGbIwdxzohaAezDKOYMkgh2sQf5p8YrDgtDICxs7osVysRQWlBoI6HIepRQIS81Yv4uZQN855etPAHTFaOmZFagEMDkUUiSiPh0APZkny1dRG5jWIXH5uAFOzMFCcT9RbhKcYCbH9qtTUGkx7G0qkcHBUJv/xRAowIIOJQxwOlOXjWj2xD2/hIsA2gl4AZ1/fC/v+cHw+SbQ53y5GEEYZu5J2Yh+yDgoICsQwV+5mpZKtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aiX0nx08s7rsrGTCb7zbmS6NckAEj1pNnvMYg6Sfa+0=;
 b=WVAJv7nKRNDzSoRMp3SMt34MsnTHaG2RFsxZB0Lm1fOa/4YWwl3wwHI+Pv/4Ptc/kwPcvELc97VwjWGs3B+CPm6mHlhseeuJpAzUSg74wyChl1Tp4psf8Zp7zynaS1IuQoG3sE8+7ArpMEIXliogu8WzGJOAGC0ZSy82/ZFRUVXnZKeY3k2+X60cdx5QFXhxi5TREr/x4wH0iWbyZoc4jHcOzOF+jezy/c7T0QPMGdobnzITVlMTReT3LPQnJrEc0uqNGLwx3Cq70mvFd09ZFUQYUKqJ/Z7o9l0KjAuceHuLW+lubUnWzLuoCZ5U4e0S6xB3V8Ce9I/dd1wz6Z6fPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aiX0nx08s7rsrGTCb7zbmS6NckAEj1pNnvMYg6Sfa+0=;
 b=Kf9dXCWmmK2jjoWs420lpld5v5ej9Z3N4iVKbEI3FsegTegtT3542dbBQDOGdEUb8DVybbsi55dqZY+2xSIWU/S6hMz/aGlsuijpcAc55W/eQ/N9Vu0uWJa0X0JmhFXAIsP/V6JhLlATiTiSaXJTHkZALwx/xJWKpAaHHQScTzOlEbp7pbVWadkgx82xc1KTKcTMbDFQz3PuVDsUFU/0Kzm8IuDLsWy+xEsSpHlheUKPZeFBhbuG6NHZaFH2jBUqM0fuio0qqEvapDfoh9ClaHJJ/ePDLBj5BKx5t6BHhcwDKT08ZChIJPeB7yCRP2ZbohG822DjjVE09j5OMlJ4vw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <076d7588-8fab-51c9-f382-58350c91cce8@suse.com>
Date: Wed, 9 Aug 2023 15:48:22 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [XEN PATCH 5/8] x86: address MISRA C:2012 Rule 8.4
Content-Language: en-US
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
References: <cover.1691575243.git.nicola.vetrini@bugseng.com>
 <4a07e7bb893f3d96e007ef6ccb645eee0d730489.1691575243.git.nicola.vetrini@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <4a07e7bb893f3d96e007ef6ccb645eee0d730489.1691575243.git.nicola.vetrini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0241.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:af::19) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DU2PR04MB8904:EE_
X-MS-Office365-Filtering-Correlation-Id: b3a2ff42-93a6-4b8d-2bd9-08db98df4d67
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	L6749WGXf9evcQ15JOS6gquaWWlrtTFDyQfgfzuPJ8XPPgEsXpSQPteErVr9lGY8TMKdDl7KNitrZQSErNRDNBdjfV3j1XYpWDb4tXogDIxfGF58u2YOYziP3raAjc8nD/k+ByRKprcgFkqvIw4wt8UVdTFnE9vco5BRxpU5aCY6qKGuxJ4GWwm1bmNL9zLkNpR5NcfoJskH8UV5tPaehFKCmdR2dJ2yRGqlCV/PtsVpCdcF+pdcRDe1dl1XBX9RraTzwLpVjs9z5zaxQcya8O1UKR7w+nC+gDTDcC/JtLVbWjWuutjJ5FqLgDsKlHnWD6/1KkTyloAlrbEfesl1QbaaZlfiuTqhE35WYOaH/bWG2ig6B7oabx9wpmnUU448nGKRSwfZjovW9OlWq5wu6q9E7Or3HTvuy1zrvEr4VwzWLTMLpmv96wIvS0bZ8ywA89Bi1l/ieopV5Uo2BmHE2HbAiZjKHblx4HI15vxNRU7sMzTNTYXv64O1gPg2V8k5/AIlKNCHWMeN9rKWr/6+gC0yvIOXx3E7mvJrw1JnsoQSwJiZfxSxyAcYrVZwHPbz5Jq/WLT0OpsZ75EW1aVnXRL7z38eG3XGrlCRJX7LVcF2t4Y5iVs8UghFl4pKVAEakwcNDRKiGS3dAeZeZRxtqg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(396003)(136003)(346002)(376002)(366004)(1800799006)(451199021)(186006)(2616005)(6512007)(36756003)(4326008)(316002)(6916009)(38100700002)(54906003)(478600001)(6506007)(86362001)(6486002)(66946007)(66476007)(53546011)(31696002)(66556008)(41300700001)(26005)(8676002)(8936002)(4744005)(2906002)(7416002)(31686004)(5660300002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?c0FaRW9TdFNwS1lhMWpPRWlrMlppUGRHaHp6aXBnNEpNb1FCWGVCOVRHeU5Q?=
 =?utf-8?B?TTlsbUlMM0xXRUg2M3Vkem1obDJqR3B1ZGxpdEJ4OEZZWGk2TGRBNVBXT3FY?=
 =?utf-8?B?QWhWRFJGYVVJbEw2Q1cvZmRFYkFjTTlZRGdGY0lzallJRlE0VFZ1bmVreDBw?=
 =?utf-8?B?TnhXdThsMHpKV2JSVTNOUGVQK0w3L2t2RTVPQ0NmK1N3QTZraU9RdDEwNEZa?=
 =?utf-8?B?ZnYwNHU0cDMxSGhyekpqdWE0eFZVUCtqMFdrR1NUUnhwMlB5aUVHTmxKVTBl?=
 =?utf-8?B?eFkxTE1ETEZ5NkR0MkNBazBtTzJKZEhpYkxpaWlScGZ0Y3NtQXFkU01FQlQy?=
 =?utf-8?B?OEdUaVVGRWFsL2lLUnhEYzhOZUVVTHlFMXV1QlFGcUd2RUk4SzlkMlcxeEFk?=
 =?utf-8?B?dEs5OGU4TzZJTjhaempOOWNmdHlzai80QUh3dGxmNDI1SHhVUUJjZWdrbHJp?=
 =?utf-8?B?b1lPdTJBd2VVM1FvVkVyZVhHa251c0phcUpPQjFySjRCQWRPU09KQ1RaTCtF?=
 =?utf-8?B?akkzSnlTdTl5eE5QRHFKUjFZemZMVnNDSzhtdmVSNXlOcU8vMEZVcWs5bW5y?=
 =?utf-8?B?VUxuSEpMcXcrNVlNWTBrMHZpZytRTTlWNVRDa3FFU1cvWkZPOTg3OWlwT2dW?=
 =?utf-8?B?QW9wWWtEa1k5Y2MrRU43Zm4zcmV2eVhxWFE5dHhrOUlnWFovelNoTCtnbWYy?=
 =?utf-8?B?TzN6dFJUVk5oeVhwVktiUE00STBSWXFSMGRaclNZWXF6Y3NmaVV5b0lVZE0y?=
 =?utf-8?B?OHdkWmZPU1U4NnJlWEZsYXIxQlRHRWcwbGl3Q3U0dUJQaUlQaHlhSk5tNW9C?=
 =?utf-8?B?ckhzdmNWS2o5SHB0YW9GMHBLamZNS1dNSStGV2lweVQ2bUFQTHBpZGRINUF3?=
 =?utf-8?B?ck9obFRpNDJWODBZNlZpNDJGSFdtNzU2Q2NSVTFFRXczTFJnTmhXYTlvY3Ux?=
 =?utf-8?B?MWtaWW8waWZoSWZ4YXBlanJpcWd2NXdKOENjcWIzc0piY0c3N3FHaEVBUDVJ?=
 =?utf-8?B?cmJSNnNsNVFEVTdZTjdwYmpSUkUwZTVveFJmWm9kUDNCYWhiaElROXVCbkdx?=
 =?utf-8?B?eXNDQisvTC9hMWFCc3lvRWQ1ZUNoQ2NsNy9yZzZBNkhQSkF0QzZWcXV6czM5?=
 =?utf-8?B?dFpFT1ZhTGVNTXJRcE5KQTdZQzZWcFd3WHZicXBTUnJ5ZzBnemNHTEMxdTNM?=
 =?utf-8?B?eEZrMndEclo2by9XTEtheU81Wjh0Z3dqc29KVldQWmRiSmYxSHU4RmVsWm8x?=
 =?utf-8?B?SUFZT09IcHRvUkZPYjMvYXNzYmR0Vm1lTDQ1NFQxbTE1RnpiaHN0YzF0Vmxn?=
 =?utf-8?B?M2ZwcTlzUWZtQ1RpWGkwSGNJNUpwd211QjdQb1FLRGhqaURqSnR2WFcvSi9X?=
 =?utf-8?B?U2pFNGhnTDNqTmNkK1F2RmxlT01ydXlTOFFjRi9MY1NrQlppU3R3aUM4M3ll?=
 =?utf-8?B?cUd0V0JxM1VRZC84VEgxNVNYZjVkWFNVblFkcW1WSGpKbkR6TitNQ1NCNnI0?=
 =?utf-8?B?NHhBNjAybnl2NTVXd2FlSEZpZ2REUks2dDJjZGRQVytsQzlGVGZndHRJejVa?=
 =?utf-8?B?aHBmVUFSY0RCa0E0RnhUbUtsY3M0cHY2TnFROXBIMWN1MkVZMCszZTdsYUty?=
 =?utf-8?B?RERyZldwTjFCZ3VDOE0wdzZPTTQ0WUMvSUgzcG9sKzdKVkVkVmZDcWdySmk5?=
 =?utf-8?B?Z2x5d01FcUl3bFUwaEFYZXVxZ2dsM1l4TWYxRW5NNGpJWVdJYTN4ZnNxQW9l?=
 =?utf-8?B?YnZmSUV1VmxNcnhEQisvVVI1M2ZjbWt3a1dCTDV2SkQvMTEwdUZYZktjOEd0?=
 =?utf-8?B?eDFyajJrTVE4REd2LzdtbkswY05yRkJFemVRKzAxaERRK1R6YXRwKy9US1gx?=
 =?utf-8?B?Y1l1RnlZK3ZpWHNhL1Y5SXJnM2dXNEVQNzdSdmxPN0thZEg4WXluTUcyT1Ry?=
 =?utf-8?B?T3ZQTmVwQllIWGNxa1Y2N3Q5c1RhZE5Eb1ZIWGtkMW42R09RRExnbC9ZcElE?=
 =?utf-8?B?MmtYM1JJT2Q2Q0NxRWtBZWpWdUdKeVVyYXdVT1RnUzNFd0hUU1E1MG9ZMXFu?=
 =?utf-8?B?MFRRTXV2d1JHbDZlRlJ3MTdpVk1jQzFXMTFVZlpLeDJGcVp0RUNJazNVRjJu?=
 =?utf-8?Q?Pif+sjzz/WuPZ4w+Z1SBR0wgB?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b3a2ff42-93a6-4b8d-2bd9-08db98df4d67
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Aug 2023 13:48:24.8015
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y8cQBzT2dFMlSfPpWtOU2zeGR9ypAsmnaSrgFCYCgv6yHRqTCXGcBCTlBdiKSSE2bEfOER82vc9zqLQauYyZWg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8904

On 09.08.2023 13:02, Nicola Vetrini wrote:
> The functions and variables touched by this commit can be static,
> as they are only used within the same unit. This in turn addresses
> the absence of declarations that violates Rule 8.4.
> 
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>

I'm happy with the code changes here and also in patch 3, but please
make the titles meaningful (in patch 3 the prefix also wants to be
more specific). As mentioned, the Misra rule is secondary here, and
hence doesn't need to be present in the titles.

Jan


