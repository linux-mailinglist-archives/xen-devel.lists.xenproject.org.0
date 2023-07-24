Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F4B875F7D6
	for <lists+xen-devel@lfdr.de>; Mon, 24 Jul 2023 15:08:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.568950.889187 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qNvIA-00057J-Sk; Mon, 24 Jul 2023 13:08:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 568950.889187; Mon, 24 Jul 2023 13:08:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qNvIA-00054H-Ng; Mon, 24 Jul 2023 13:08:02 +0000
Received: by outflank-mailman (input) for mailman id 568950;
 Mon, 24 Jul 2023 13:08:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vJ35=DK=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qNvI9-0004Jx-A2
 for xen-devel@lists.xenproject.org; Mon, 24 Jul 2023 13:08:01 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20628.outbound.protection.outlook.com
 [2a01:111:f400:7d00::628])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1d076b24-2a23-11ee-8612-37d641c3527e;
 Mon, 24 Jul 2023 15:07:59 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AS8PR04MB7989.eurprd04.prod.outlook.com (2603:10a6:20b:28b::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.32; Mon, 24 Jul
 2023 13:07:57 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6609.031; Mon, 24 Jul 2023
 13:07:57 +0000
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
X-Inumbo-ID: 1d076b24-2a23-11ee-8612-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kziCq6r4qQZN8YVOJGl7Wun0n1cKIBwv/oW8mN9tQ9eD/8kgCRQgTeKT4d9WLqmf4krAbRAeKOTGoBMO+1YShYSy6iqpWkKMOs6mulGYuj9ZMjZGHUBLql8i62kPxdsUV+gUou9tWVNPuU2XVwh+G7wdivNDsOct2TNGDl60aS2NQnnAKcUtcoV591qRGICkKdFNdUPaj+84JQwLW1Q1/Jz9dT0Kmtv40SHtRY6wfpA6bHlV9IBSEXYqmn2Yg3loJ4NeJulciwHpubQvkqwvcJQ/LNZQCrAID2CJoFSA0bjZqJhEjR3j6lvcqk6lobkUPKcuFdADFiRm7khck0Mw1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Gv9cDQKBaLCNl+zKIQICHTqpJqJNTHABuJriI3EDKmY=;
 b=So7tYg6FyYb62/7/zcHp8rWYa99se4r3Bdc0GPDaGi7PQ9kPXclUJdcEnV5xXf3ZQ1K0lv3U/tVATsZHNmuur+1e0Su5KN9BuPtjHw5t2lZpQfWLlwP2sUm/dxzWA9H41UEGM11xgOvtVzAnZpE31WvsWwF7XMhMnBDvvaDXahIu57r+R9Ugd0+WZ9ngzDqv7z2z3MG7ebNOW7ukqv7YgjbqWYikhslG8C90YjIG/AvejxYE3gL5QdgqVXSPDdF83d3jn3fGfj2mOCgeWed/odI9nGI2p30DHhwB++Bt5lrlqKP6GolRyspKPR0asFiqsaTRZ5e4TfamwVJungcomA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gv9cDQKBaLCNl+zKIQICHTqpJqJNTHABuJriI3EDKmY=;
 b=R4Kx1I8kS+Xuj9kkxr6qHw9bIM8e9ilWqL4lMvTkfZokNg6TyR7uBeSNjj3IAjXcFohMbQfEoFckVUZAO2sDyLghWBgrUmUKzx/XUGfecFbVJak3mobLD6UsR9X9qYBlsV0+amnS32XGM7HqQwlN07PEpE8UoHwrhLBGKeVhBVNn9Eb6f8Asqky/jCyJgMUhaGV8M+6lVJV/7RCYNVp2uvEnDTfFfnLlRRng1MphzGLj97riqu+ueCP9iZsyD6j3Vq0hS8Gi4OMWnu+kBEpRr5S3bs8h0lufBggq4ah5assMNXZl1XP7scRRZEBqQVEKZQfI91kvH9KEez2o6QDgfQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <8e9a47c3-1c1e-6075-f462-5cadec80c28a@suse.com>
Date: Mon, 24 Jul 2023 15:07:55 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v5 0/4] Early serial on Power
Content-Language: en-US
To: Shawn Anastasio <sanastasio@raptorengineering.com>
Cc: Timothy Pearson <tpearson@raptorengineering.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1689958538.git.sanastasio@raptorengineering.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <cover.1689958538.git.sanastasio@raptorengineering.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0256.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b5::9) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AS8PR04MB7989:EE_
X-MS-Office365-Filtering-Correlation-Id: 6d0f8ade-05b3-441c-1eb2-08db8c46ffb2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	+gsyaGlQ8q2uJ234GxdxL8vJx++gWbrX7MeYJvBbj0prwms9v/57KraBNJoQGfL0noxR1I8rGpsm9sP+H1inFofHq+dapfH0fzO8q408dEPZEnmdNMfAH56Vqz7RhXvgpJt9WAcCx7yBejZmi0dBuXjUKBLI2sNjq/Wsk7Sx9u6MiZNsdjjBOeL6U3e2gEQVrhnnJhdoco98qlvstbO5dvnRTD45y679j89dJ+kMRkLMIroF/dTujffAWdz8Lxnh2A+EcJ5HTig1vTlNSXsUr4OHZwsIX10AIjeqlQgRlax7I8tZzrbjI0aA4kQDyRztUVEuKAAhQvjw82uy3e+W+L33JydnRcnhcKjc2PlJaFBRj4Y+RcDxPt+XFfrVjsLg+a0iN+tpfkGLe/gYfbZhU6aXy3Z3a+HI/cXwaQEUfomvlFFpFYd1Ik4l2zsSMkJxrCwfTCwd4v4Pdsn0uvGcxofwCSRwTZUC0G8dMDAvTnsdiOGP7qNDtzGvlLx0GoChhulXoyR6aaeVMX/CxcRP2ZKieR5s8YzoF6KjpEOiLvktDRG1fzL3/CKvzrGP3nSDByryZ/OhvkONv3GUqR5djtkv/Ir4604gBxNuvgKEL9omlfnx81vrMMVl7LXA2Pnm32qB0lZgUZj7qlrvLSzVRQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(376002)(366004)(346002)(136003)(39860400002)(451199021)(6512007)(6486002)(478600001)(54906003)(186003)(53546011)(2616005)(6506007)(26005)(2906002)(4744005)(41300700001)(66946007)(66556008)(66476007)(6916009)(4326008)(5660300002)(8676002)(8936002)(316002)(38100700002)(36756003)(31696002)(86362001)(83380400001)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YnNPdzRZTnBkRU85UjBvTE1IVW1sNVNGQU1vWm5ZQUtTbzBzSHpaUG9vMTBH?=
 =?utf-8?B?UDlkeWljOGFqZDJFRk8xNUJ0S2VnNnJ4SUlSaFFwZjYvYU5FVkJIUlNqdW93?=
 =?utf-8?B?RmIyM0xsb1RWUDFxRzFHZFJWT1dDdk9uWlpsSVM0RGZHMjR5NEdaeW9XcnQw?=
 =?utf-8?B?N0RPakNzcDJ6SzJmZm55bkdMSUVILzRPU0EwTzhsS1F3SUxtVTRGUmdEaFpM?=
 =?utf-8?B?eEt3RWwrZnp1M0dHTFJIdFNOUTArVFlYcVJMM2c2WEFUQXlKby9lU2w5ZzJr?=
 =?utf-8?B?bjlWNjE4RU0rdnZrRmw2cHViY2syQU44SEZsTWdPeVoxck9RVjRHdjlHNk5Z?=
 =?utf-8?B?cXdjVFNXeVpCWXRuQXMxSjFoR1ZTNTdiUzJsM2FmNDZiZUtTOGZNaHZRbjRC?=
 =?utf-8?B?REk5Z3RseHNveXRHK0l3NWNqKzJwWW9YaENEdlBQQ3NsL29zTkhvK2FJRHFX?=
 =?utf-8?B?QlhKRjRnRGNvQjZoTGJtR2ppMHMrSFdlUFI4TytrWWN1ZUo2d3Znbm51MGVV?=
 =?utf-8?B?ck84dGU0dUdQMWNZRWsxR3BjbkVFeENGcWpUenV5ay8vZGg3OHEzaWVHMEYv?=
 =?utf-8?B?R1QydUtYQ2hWWGdseHFkN3ZXQ085MkFDclZEVSsxV0FMWlZpQkZuclQ4Vlhi?=
 =?utf-8?B?SU1sWThKdU0yT2h1bXNUOFdiT3ZraXV1MDAwUjVraG1DNE4raU1JLzRXaCtp?=
 =?utf-8?B?VFhjQ0Q3RUV3YW5EOGVZU205TmNDWCtaOWZONkQ1SG9ucXpSZUpKNHZpYnNR?=
 =?utf-8?B?aEtoU3NwUU1JOXhxREkwZGh0cXlrTmQ1c3gxTzliN2p0REVQZThLVkxLeU1i?=
 =?utf-8?B?dXRXSUh0SldPWEFDZ1diSkhBMGxLTkFlQm03RmpvQk0zdzc0eHlGeHF0cDZI?=
 =?utf-8?B?WnF4RkUwSW9nZ0VONEtMNXp6OHR5czNTZlBjY0E5amQzdS9naHpJU1lEcStV?=
 =?utf-8?B?K25Qb0ZLdHhmZzlIUTBaREdEbXJNMnYwald6U3NZeGtiZHFvRkVkZEp3SFlt?=
 =?utf-8?B?eTd6UGEvUmFRME9Kc1p0WXdjUytNM3FCOGxyQisrZlVPNXkwczVwTHpGc05O?=
 =?utf-8?B?d3lhQU4zOU42czFORGMzK29KejE2bFhCejUzdnhIYmt1eGJQUlo2L3I0REJO?=
 =?utf-8?B?ejJ2WTIxb2RvdzJTb0Q0U1Zmazh4UFZYbkFLV003R21EbXhmWWVmaDdMWGNu?=
 =?utf-8?B?K2xNUmp1aHVtalBYenNWZ3hIanNWaGQ3NmtXRnlWWXY3eEI4aE9EUHZWdTNP?=
 =?utf-8?B?bHBaKzd1NzFoT01QNUt5QVV4YVpKdWZQZnhQVlBOWityU1M4ejJhbTNNZFRp?=
 =?utf-8?B?MHNKUnI2Z09WeTVqOVFuT082S1RvVFdFaDd6YlpMSXZCTXZ5Ti9Sa0F3YjJG?=
 =?utf-8?B?ZFl5cDB4V3NHNlp1RDlnbDJtK1k4VTJHTDZ5ck44VWtDdld2UUhNZlNPeFAv?=
 =?utf-8?B?RWNWZkpBbXh0alFkZ21wc1NhMzR2OGI3Zk0vV3gvbks2NjRMNkJPZkt6STVl?=
 =?utf-8?B?RDBBdEhHWHNVcVgwQ1J2YXRVSVNJdElhdUUwbzN2S2NNOVFYa1pUbVlFbTBj?=
 =?utf-8?B?dm83RHNFRTR2eDFxSXRGMS9kbFRBcUdISzRFMzF3Qjc1ekswbUZzNllqYVpl?=
 =?utf-8?B?dDkvY3dPbG1XaVltbHdLOFNsUFVSV2dyRldCU1lzNW1jalNTRlhEVjdNam9D?=
 =?utf-8?B?bkJ2MlpjcllNODFUajQyV3FNa2M2Q0lueHpvcEQ3VW9ldXRmZEFTTnFZZ0s3?=
 =?utf-8?B?RWlSQlZtVG55ZVltOWcvZEtHWkZ0T1huMHA2ZmlhaktuTXNURjRWalVZNXhK?=
 =?utf-8?B?V2szcGVTMlREbUdzVVlHU0RJT2U3ZjJWWkg5a09RcWVudEE3WVlYUXVaam96?=
 =?utf-8?B?VnREc01qWjZKRkZ2UTlHd3RRMnZnMHBzOS90cWFldFBvb2dROGVhWVQ0NHdS?=
 =?utf-8?B?aWo1Y01RQ28rdnpLMUJiUEgxYlhlM0R0UlNIbEVCOVVHU3FCUk5yaXJNa2pE?=
 =?utf-8?B?ZmVoMUFNRFFlSWVvdGpYOTN0V2JaN1ZSM3EyK0M2ZmV2V1p2akhCb2tYWm0w?=
 =?utf-8?B?bkd1eElQVWNhV2pqRnk5cDV3OTZZYUoyMXRwc2tRMzJmZWxVZVIwMjkzU1do?=
 =?utf-8?Q?mk5wa9uRpzGbspyydrjGQwqDD?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d0f8ade-05b3-441c-1eb2-08db8c46ffb2
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2023 13:07:57.1973
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I9z9BdPfd3BySLp3bsqI2Yu1XBjAsCIINcmzZ1+B8l578qtWQ78FbKvCkS9eR+ur7iO8LCzcNuSy8WnH8zSYFQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7989

On 21.07.2023 19:02, Shawn Anastasio wrote:
> Changes in v5:
>   - (xen/macros.h) Add signoff
>   - (xen/macros.h) Fix up comment formatting and macro parameter names
>   - (*.S) Use 8-space column alignment for assembly
>   - (of-call.S) Add missing space after comma
>   - (asm-offsets.c) Fix DEFINE() macro formatting
>   - (asm-offsets.c) Replace _Static_assert with BUILD_BUG_ON

One more general remark / request: Having change logs in cover letters
is certainly okay and better than none at all, but for review purposes
it is far more useful when provided in the individual patches. Not the
least because, as you will likely understand, the larger the series, the
harder it is to associate each of the remarks here with individual
patches.

Jan

