Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A3124D008A
	for <lists+xen-devel@lfdr.de>; Mon,  7 Mar 2022 14:57:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.286063.485404 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRDr7-0004NC-ER; Mon, 07 Mar 2022 13:56:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 286063.485404; Mon, 07 Mar 2022 13:56:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRDr7-0004Kx-Ai; Mon, 07 Mar 2022 13:56:57 +0000
Received: by outflank-mailman (input) for mailman id 286063;
 Mon, 07 Mar 2022 13:56:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=XxC1=TS=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nRDr6-0004Kr-34
 for xen-devel@lists.xenproject.org; Mon, 07 Mar 2022 13:56:56 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 72a608fd-9e1e-11ec-8539-5f4723681683;
 Mon, 07 Mar 2022 14:56:55 +0100 (CET)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2172.outbound.protection.outlook.com [104.47.17.172]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-14-Wfq0O7aLP6O0BU1FJBfJ8w-1; Mon, 07 Mar 2022 14:56:53 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by PAXPR04MB8318.eurprd04.prod.outlook.com (2603:10a6:102:1c0::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14; Mon, 7 Mar
 2022 13:56:53 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%6]) with mapi id 15.20.5038.026; Mon, 7 Mar 2022
 13:56:52 +0000
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
X-Inumbo-ID: 72a608fd-9e1e-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1646661414;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pKOtJ5rZ/cCNRnJt8oBduFecx7Vl6nC0sAX2vRaNI9Y=;
	b=SEt2Y3AqWxM2El9IfYYtLtPSwaQrfUs4dg9x25v8DJw8eEPXBrm4Ma1DO1DhAmdDMY9y8w
	GAt6kSisJzycVDSX4+O2HdD41qCzJYeRE/uJ66YxvdcquMWPTntGlNTwbrgRM0DE2ywSbo
	5PI9hzDXvE10atioZ+ng50npmgVz+Po=
X-MC-Unique: Wfq0O7aLP6O0BU1FJBfJ8w-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LYi2iquip4/8ecs2S8ry9kzDOUPCbqVFUujGsb9XEpeuygzI/laxw+e042WVNi0naN0c7E+4xtEuJt7DdGMvtH4etNOSIEXq2UzqsAlLtOcH2pav/2j18mlv6ufvCNgi8Sg2++vx5XI3af7aVixCvytiJ83x+bhCJi8bHYy+1x5bkT69WYTWlvis49FGEXaNcC+nUo5nikLg9P+RIho2n9tOoKePHRDYENa20aqv74+45Tg2uVeYu7zs49Yw73DGhrZkPiDNedruYNpJ7fluaG85YtDgASyYcdOCMTtq6f1xV5bLcvbo3FaUn3R44wMPfgjsvoD8sXzZXnLIzh8BqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pKOtJ5rZ/cCNRnJt8oBduFecx7Vl6nC0sAX2vRaNI9Y=;
 b=epPYjMzNMIThQuBEPpNizE89esIe8HWD8swvVER63PKl5m2tg/zMf9699y72cdts8a1cHYHvgqM5q8lFKGeaLiNNkqnXy0ypheseyEetAAdIjEATcUcnFUPRuBVq8efCssOMNYDYt8ZQrip4bYg6V4PV5fBQPUvJ1gGeNT8BUiprsiCNgvrXT1NXoZghpoMUq26DmMXaP/VuQu3QHnsKFnP3hXdqrRWjhRVyH1UgJR+iZkX7UE0qik2VVQVhGcYrcEO53VLM3csl6FgqShisCc9A03LIlB07D8uutEDJ0YTOxRGF+radRrvei27q8WmhK4t+yVB69EYOw5iLkihNmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <3c7241bf-e110-3670-0cc8-9b84e228803e@suse.com>
Date: Mon, 7 Mar 2022 14:56:54 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH] x86/cet: Force -fno-jump-tables for CET-IBT
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20220307132651.25691-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220307132651.25691-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P192CA0108.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:209:8d::49) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 56c64885-d892-4ea8-2b68-08da00425566
X-MS-TrafficTypeDiagnostic: PAXPR04MB8318:EE_
X-Microsoft-Antispam-PRVS:
	<PAXPR04MB8318D07D8D245D85ECB8D932B3089@PAXPR04MB8318.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ugwd0BU3IQDKlLJYL7Jq3qgjZxnQKTqNYKo1hv7polCXeV4uLknqBXXylp3vJPTZhg//GcT5ZwQaWki0/XHZYdQ5JB/lpofBjo/8J2Rs6zmHQeZKc8y6WjWTYbavsN6YLoo5oy51yj7I1kAxxj6WkbPzTPPLOiAuH220co8oRQnarad/PukIj7FnGcjLOUhQHcBpdJ368MSjJvluu8+PfbdbhkD1VilyzSiqnjJEZF43BUU7e4ikYCMLcSN//9mxhOhYluJwBFPv2n9YLP33CsFREL6p8O2lPaGYwO6SGMAXKt/WjQYIMf8KHKaRSGGawBpIAbHh1KYMmg2VrHffSptXzv/0hqHZv2RYJCyL0YzCD+pDg9Rq3Rn6IqOi28e8j90z32yvRPAyIC2sTdREdAx4abEY/RqugH/SucsNrHAWr+9QRJuZ7+Qxz/ElrHWwRTi2r4sQ3GEcak9qenMIQW6R/cIr+Xt3TK6uEbu9dfchUDSMILo0DHNSxR+vgX5sHz8b7Rcd1EKmdJ9we0lzrVfUFy2asm9XPaUrt0PRsBV3GYNU9zd0gN9gBhmJQr00ho/GEutdWaK8wdJcHr26py/DVEh2zoRzix07MuFbZG7+fU7+6fAfN5R4uY1/qHmYPJntiJSQMPFkuhDAbtenIEZs68IY+j1e1trTSmMUwaiZjAXMiBraqUITcvVCXVhU/ADTrkqaE4lhJxPiS3groyIX5aIulaS2Y/oG5+OI3fI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(38100700002)(31696002)(86362001)(4326008)(8676002)(66556008)(66946007)(66476007)(54906003)(6916009)(316002)(5660300002)(36756003)(8936002)(2906002)(4744005)(186003)(26005)(53546011)(6506007)(2616005)(6512007)(6486002)(31686004)(508600001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?a0FQdlBnMDNsWmwxU0dOWVJMMGpCR2FsSG9LNE5BT1hWL09nMDVWTURFbkw1?=
 =?utf-8?B?WW0vTGgyVVdCeUZUbVpFOGtvVEh2TjhZMDhoT3FoZEl6Wk1Tdml1TEUyaHZy?=
 =?utf-8?B?TWF0Zy9Cbk9BN1Qrb2RtNUxJMnBsalpYY01hWVE2RXpsK3RMK1RCOVlwTHk5?=
 =?utf-8?B?SVcyN1VyTTZRd0x1SWREeTdYVHZCVXhFamVMSmNzL1BWYlR3THJ5elc4WkxJ?=
 =?utf-8?B?UTZhdkNEMzMyZzhpQ3NTZmtTZEpFTTdyTisvRlU5ZmVObEptbnVTczVMUWtQ?=
 =?utf-8?B?dExMY1JyTDNJbGxZYVl2b0JmbmVYeThUemN3a250VkNKeTZVa2lWSkt3d0VR?=
 =?utf-8?B?c2EvbEhXN1U5ZU1uOXUwTmdjSUxHN2hmTnMvRytRRjZBY0k0bDF5VmMraUFM?=
 =?utf-8?B?WVFJTmlGYzM2ZjVjZ1ZDcFVySlFTVVcvajdPMlNncmFKc0FQTjBGdGFHVlZM?=
 =?utf-8?B?cjZlTm5HQzNrU21Yakt5SkFmcnpHODZVRmR4U280UTBUc2E5RkdtdzJKWDFK?=
 =?utf-8?B?bnJrRlpuVW9sRlZyR2xic3I0dW9URnRsS1VUWWhRRGFBZHBwYTJUS21ZYkt5?=
 =?utf-8?B?OWZZMGlCSEZqL2M2cGdlZ0JhbXdDSTlIYjB2ZHk3ZGxlUUdKMTZDQ0p2dTF5?=
 =?utf-8?B?QldGY2grUm9YY1Jvbi9weVh0NWRSWnlqOGI1R0luY2xHWElNejNSSVREOExM?=
 =?utf-8?B?bjlCTzUvK1E3TFgvY0o5ZElEU3VIb25rcXA4S0xiZTRSaTNoWHJ0TkpKZ2d4?=
 =?utf-8?B?Mmp5czhweDR2c0Ztend6RjAyTUZYUjByVkRZMWI3aVBBYVZGdW1mS1JNRlNz?=
 =?utf-8?B?TkJpemQvbktraStFektZd3RydWsvRFZuVHVsNWhWcmd6WUZJckQvMjgyK091?=
 =?utf-8?B?SUJiSFFLNWFOMlQveTU4RHg4RFFXRG5TeEF2Y1ZEZ2s2c0RmRm1YRFYxcGk3?=
 =?utf-8?B?cFJ4a0VQYTNMeWJjRm5HV2k2UnpPUkgrUUhaOUViRjdpREtCaVVuV1RhdEJK?=
 =?utf-8?B?NEcwaUpwTEN3R0lKaW9QOUh6dG9GSnBlbkxYTG1ncy9XVGk3RTJIVDVVUThX?=
 =?utf-8?B?aHc3NGF0NTIreVFiUW14cjd5S2VxWkVDaFlWRmV5UkZIa3dZODRyMjR3RlNz?=
 =?utf-8?B?UkpPVk9EaEZFWWZXcjdKSEZJNnlReGN1RmdQR1B3ZWttSDIxNmU0R1JnRWtZ?=
 =?utf-8?B?bDRoZVVDQmpZbXpUb0IwY05zVm1uVVcwbUFBek02VjkvbE9XQVFCanRPTFI5?=
 =?utf-8?B?ckZ3cjVsYlI5NDJsRzJlMUpSVHlXL0dKZG5jTE9zcHB0cjVtcXBGT0djNCs2?=
 =?utf-8?B?c3BXS2dMT2pxZlVZSzBBeTZwcUQ5WnNzS2grUG1sWHV6Y2FLQXh0ckdBT1ZE?=
 =?utf-8?B?R3VoajA4OGcyZFljZjErQVl6cVIwM2NnQmJtaktnaWJnNEJoTU5PNW1MZENJ?=
 =?utf-8?B?TTVKbDJaSUhzbWtuY0NibzZNTmlxbEtySTlybUdkbnhHbmF3MmYySXIxeXhU?=
 =?utf-8?B?VllFQ3hhVmJJVEVKcnl3RGVnM1FYbjlaUWRyMFkwNFVmZGVuamdLeDkzelpL?=
 =?utf-8?B?YTRrdzZMbHlPTk5tWkRPankvM09VSVlIOGVUa1htWERnSG5pcURPT1dOUElh?=
 =?utf-8?B?NlpYQVNIN1NQOG5aK1M2NDh5b3h4NUtwN2pweVVIdGtMSXRLZEpkWkFkbE9C?=
 =?utf-8?B?T244Y0dVZ1FCU2lHUHVNWGY1djl4cjNUT2Vvdlo4aUE3Zy9ieVVzNnVlZ1pt?=
 =?utf-8?B?Ry91U00wbUJ3NW1JRGw4ZThnbmo0eWxFalVGYi90NkdpeVA3Y0lGUjAyQjk0?=
 =?utf-8?B?WFRDVEQxMFlZVlkwWXdWZWhwaXNTKzBMY3lSL2x4NjJONDhUK005dDV2Y094?=
 =?utf-8?B?eHl3d3hCekJpTEl3RTVrRVovV2VwRjZZQitmSlZ6cTJoZk51T2JxK3NZSjhn?=
 =?utf-8?B?U2ZJVDNZOU9aU2xUSUp0dmtnWE5rRWFpazF0RmlYOUJNQ1lObnlJUXhKOVI4?=
 =?utf-8?B?L2RCYXJOOW1UYmxpMjZjZW14anJDcUFxWDBMMllFZytmanFXVHdxcWp0N21N?=
 =?utf-8?B?TllkVWdDeFhhK0kzbWpwUEsxYTNUVmxsTXB0RTNqRVJDQ0xKVEpTa2lnd1dI?=
 =?utf-8?B?Vit0YUlHV0pLRmpvTXJxMzl3ajhkK2N3Q3pjWU5JaEJKTzBaUEY1SXJEKzVN?=
 =?utf-8?Q?X5KK3L/22sqsY/6UnH+2evw=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 56c64885-d892-4ea8-2b68-08da00425566
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2022 13:56:52.8509
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UXTerp3FCq1rzeKf0z+vEE1hdlr6BKWWtBRYyRYteRC4+CPhK880Gqbc3FFlEuV2vH9IDAJ0r5Sg2cAsR36cYQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8318

On 07.03.2022 14:26, Andrew Cooper wrote:
> Both GCC and Clang have a (mis)feature where, even with
> -fcf-protection=branch, jump tables are created using a notrack jump rather
> than using endbr's in each case statement.
> 
> This is incompatible with the safety properties we want in Xen, and enforced
> by not setting MSR_S_CET.NOTRACK_EN.  The consequence is a fatal #CP[endbr].
> 
> -fno-jump-tables is generally active as a side effect of
> CONFIG_INDIRECT_THUNK (retpoline), but as of c/s 95d9ab461436 ("x86/Kconfig:
> introduce option to select retpoline usage"), we explicitly support turning
> retpoline off.
> 
> Fixes: 3667f7f8f7c4 ("x86: Introduce support for CET-IBT")
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>


