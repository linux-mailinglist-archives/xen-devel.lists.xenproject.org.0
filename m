Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 10CA47CE10F
	for <lists+xen-devel@lfdr.de>; Wed, 18 Oct 2023 17:21:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.618679.962645 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qt8M2-0003RM-6S; Wed, 18 Oct 2023 15:21:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 618679.962645; Wed, 18 Oct 2023 15:21:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qt8M2-0003PL-37; Wed, 18 Oct 2023 15:21:02 +0000
Received: by outflank-mailman (input) for mailman id 618679;
 Wed, 18 Oct 2023 15:21:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EezS=GA=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qt8M0-0003PD-46
 for xen-devel@lists.xenproject.org; Wed, 18 Oct 2023 15:21:00 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2072.outbound.protection.outlook.com [40.107.7.72])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f0afac8e-6dc9-11ee-98d4-6d05b1d4d9a1;
 Wed, 18 Oct 2023 17:20:59 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AM9PR04MB7681.eurprd04.prod.outlook.com (2603:10a6:20b:286::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.21; Wed, 18 Oct
 2023 15:20:30 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d9c0:d907:4d2d:15b3]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d9c0:d907:4d2d:15b3%7]) with mapi id 15.20.6907.022; Wed, 18 Oct 2023
 15:20:30 +0000
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
X-Inumbo-ID: f0afac8e-6dc9-11ee-98d4-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n5/1utX3PSoVUWwEypX77aGJN/bNg+ofRTM7Bks134wlQ9cl2Oy7hkBP829Qp14bPb7UqyfqrCynmEZwRKWFWtZ7Wi1WxCQwmd7rbLBHQQYe9fXh0HzEhoJQML+2dtpuwPbkamtM6A0QIjnv5JbIp+cBbO8P8ZNYH3D6NcjOR/W6tL6RSbxHmfgQpzYuDZ85rMmAchNgZvnFwKEjx8vctzyCu5T1jkNhkLBA5fCMGlj+pRvcdMw/a2IcquqLUYmPfb3yRT1dVdcEnzv/XEESXmV1RgEOM7JiJbDPxah5VhdEtXmQmDrrQQYKDFS9APiS0mgTwmh2bMAyaj1OlCLppg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uyDnMD6I5+3i0wJtXzO4vIDeZUU7PeldcJDsGQnlpfs=;
 b=DlnozyB+tJ5QD4DuQO6ylTUeHqQtn74dDMFA2YoJSma3OAIHztTgi8UNsoOzK/8R7AFzyjh1IcCf7GtWvfMdTNsdOtyWv7EQEMt2dxDnhi/UmOVSdPBtjSRq/Z4o/STlHttJN+Ap4VRKSR0+EHRVMZNN2BqMQdwrJhTu9JAj8l1p0AJQcIL9OM740jcwwVO7TFQC8pLLWhNBEFDsHmDJOKcDMvfygf4gjX8g4oTIgLdyXCSZG5tJ0dBvBFcBNydcAPdf15pQNvigh6cBjaMxHGtVLQp66vd5dO8UnGe/Y3AqgnoM8A6mq1Wi8o3xREdLfybuB/bE1DVotJNrtXJkvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uyDnMD6I5+3i0wJtXzO4vIDeZUU7PeldcJDsGQnlpfs=;
 b=29pA07chq/t4ADvFD3Bh00g2DUYLjymOSgz+AvJKDx8E/F/kjBWeqbuypwMefEtr0vcUPHbojOQhtrptD4l6p3bisuIfG/Im4YVuvwtt4WS1IR/Tsz5OHQskruCamt+JMzPriAfavDiEBzkyMFWCyMIZa5tdkqoV0yx7L3m+a9JMSzOkPSEhkPkfiA6bEkFn2JmNDMFh4B5ptA3qauF4p4VBxAxGfsisxX7iLiGsf33MMYw2IrfN3Fp/mgl4xQ9MIiJPkIJxX6Bvk4verbtiOYXkieBsJOOtWxHOEgrqWG7n9g2saI0/FK7GIJ7FGcVBYUkNwo9AHxG+3imQIlhqnw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <5f52c7cd-2913-6a57-8e6c-c8b8bd529e28@suse.com>
Date: Wed, 18 Oct 2023 17:20:28 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v2 1/2] xen/ppc: Add .text.exceptions section for
 exception vectors
Content-Language: en-US
To: Shawn Anastasio <sanastasio@raptorengineering.com>
Cc: Timothy Pearson <tpearson@raptorengineering.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <cover.1697220184.git.sanastasio@raptorengineering.com>
 <f06ee2e5d836a64277bed6d9c6c1367dc0627dc8.1697220184.git.sanastasio@raptorengineering.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <f06ee2e5d836a64277bed6d9c6c1367dc0627dc8.1697220184.git.sanastasio@raptorengineering.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FRYP281CA0017.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10::27)
 To DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AM9PR04MB7681:EE_
X-MS-Office365-Filtering-Correlation-Id: 6b0f6c30-96cb-42b1-40ea-08dbcfedc3ee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	pVK2Ud77BtlopvIhN9Oq5v0iMgsJPIqJvaheWhmW3OgN+6NIHfLBPgVxS41z7keT7Aa1aLPQV9PYi3kmR2p+MHST2X3/WKL7Z97kw/vYKUsk2gbvv/PJ5wcPhNZIEbD7nw1Ml1KAVe4lari25HG/kwUTVvPd4RFkAS8t5nJiQV7uita73I4OGEWy8oG0YkKMn2LvDjQeAEoXEQSWlQvnlUcbkWIhj6M1SwqbcLWBBXNxK49k1Ej74Gn175ZbKQdCahdRkMA4PD/abWwuSaNthIGBaA7gSbRoQVFiTbHgKEpApgBee1Nr7DoYsZaHf+Jyb3u/lhezt1dVRRueT8eUWHp4r59SvxayZ6fs7nFb/zEcIFUZsVrU8tZ5EieLCOjjWTEY2eXLWRBVkbgvNIucv1m0EbbxXLrs75MPTKQZSpJFPMroUSpMUMjVpgogKV2Vd1QSHAaihP4hJitKlRTTG0e5InxKZ4nAhkyZW0acRaKaSKCjaNFlArb5AihKR8Gs+XP3ggZKsNRJNkwVW7e4Gyeq4VnwTx4KcrPKcXLiGM8byBz0MharUgZWS/Y+l6drSg8T8Q7M/8b+WLJfwfdIQ35/HGdGoER2HsTBM9bTlw89QIIfZXj6J2JiAgfXU35IYTMmB+aa0rbDyU7V5+NEgKQa2JXWWtnDNZ467w6LquTvR9cyiAlljpf5Sc/iZNUE
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(396003)(346002)(366004)(376002)(136003)(230922051799003)(64100799003)(186009)(1800799009)(451199024)(26005)(31686004)(38100700002)(66946007)(5660300002)(4326008)(66556008)(54906003)(8936002)(8676002)(4744005)(316002)(2906002)(31696002)(66476007)(478600001)(41300700001)(6486002)(6916009)(6506007)(53546011)(86362001)(6512007)(36756003)(2616005)(142923001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cks2OWFWb0dHYkd4STROY29ocEQxaWV6TndnUFJ6R1pxMlpSM2dHKzRLR0Vv?=
 =?utf-8?B?NWZoWUFzeE41c3kyMmZ6MlNhUUlLMExrRUdkeE5WTjdwZzAvMlFrNm9VMlEx?=
 =?utf-8?B?YlRrL1VVU3haYTlwY0hONTE2Nzk2aDdnYlArdFdreHpNa2lWNkJXOWpCTEhO?=
 =?utf-8?B?c1pBSytsUWxwMnBKNXVoR0N3QjlBc1YxY3ZJVGxndExDTEtEL29nL2pDMHJz?=
 =?utf-8?B?amFjYkthQ0pCcU1GdDdwVmQ2c1pCcHlqdGRINDI3emp6OVFVY213ekZTOUlt?=
 =?utf-8?B?Qy9wbGdsbnFYdzlQRnArOTBXa1JNWUZiYkJ3OEREZUVNSmk4R1ZEbDQ0NWhl?=
 =?utf-8?B?b1p1TnR4dDVmUktkb2JlaG9UMCtXWUV0dVV1ZzRtcGl5U0hCbE5jWE5pc0Ez?=
 =?utf-8?B?YjZ2cmY4N1RDMm8yVEVoZDdIUVRUZkRibUdkYU9LME9kUWFyRUR6Y3M4MjN5?=
 =?utf-8?B?TFRoZEdtbHhmTmFmcktWRGpyVzlRZCt0KzNxNFBWY2JMK3lZVm9ZUTBKakE2?=
 =?utf-8?B?MWxobldwZXRvL2FHdVBsQ0h6RVFwQStjb1lDbWlXek5KQU1ieHN5MHp6Y2Ez?=
 =?utf-8?B?NnpicFlOVGFZUk5YV1VQaThENUFJMUlFNWQySW5hVjZTeG9EczljWURLUjJT?=
 =?utf-8?B?UXU0WjNJaStMVDFxV3QxY0pLelFaVjhmOWZGOS8wU29uUm9UNWZ0QnE3cnNZ?=
 =?utf-8?B?d3ZjODBmK0l0KzlhNFMwdmxuS2t6Rzl6bjA3L3VXMXFhNUdycDY2TnlpVUhq?=
 =?utf-8?B?eEpIdk1FekdQekxFbG9yYkdleldXcGxrNG5EeXdtaUVtQ0gxZUZKM0d0RDlu?=
 =?utf-8?B?cmh0d3VnWjVCRVBWaWpVWU1SenhGMTNOVlhCcThoTlJKRWduYVRXS0xPd2FP?=
 =?utf-8?B?VDE2eTBNNDN5RXZQVGozQkRQMlpBZXJrYmVZc082NW8rUVhGUis2R2R2S0Rw?=
 =?utf-8?B?TTRrczRoZVk1cXdiUmxtZmhTRVVKMjBGbHhWOTArNTQvS2J4dXh6UTdaNmYw?=
 =?utf-8?B?UmpReGpqN0dtUlFjK1BNbENnQ1d5Q0RyaWlVVWhXNHZVYUxvaHJQOTY4K2lH?=
 =?utf-8?B?TVZHc1B3em1jTzFEL2ZFeU1USGcvQVdjdDhMWkNlZVJzcUlSdkNyYWlMcFRz?=
 =?utf-8?B?bURXd0k2aW9ud2QrN1JUYTNCSnZ5azhwQzAvRloyS3RtWkpmMExoc09JcFdL?=
 =?utf-8?B?bEExR1lBMUJ0YzZNR0JTSU9PQnRndWVuTUV2RlBTaFNxVllPTHRibmh1MTlq?=
 =?utf-8?B?VktKYWxYa2VXRXlsQkE5aGxHVHlsTnVBWHpjazBldFBYYVpRaDF1Q3N1NXJP?=
 =?utf-8?B?a25VUVdBbVg4SWZHYjdpNjVTekxHVEs4d2grNG52eFk1Zzh5QzdyVGdjOGcv?=
 =?utf-8?B?QnJCUzdKdE1pbkt5RCtnVVc0akNsL2taaDZjakNUOWJRYTNVeWVDSnB2Y0NJ?=
 =?utf-8?B?R21xenk1U3RucEVZQTJsU3g0ZEszaG11dmZsRGxmZlV6UHpDZ1IrTkRpTXoy?=
 =?utf-8?B?OC9CTmNTcGQza1Q5S241UFJpQkxUaFZrUDdJYUpGcUE5dUhjMGE2cG1GcFV0?=
 =?utf-8?B?NXRSYURXNnBtYkJZaGFiRTVJdXdYNGEwakpvTWZ6anhKZitiSDVaTVBwTS94?=
 =?utf-8?B?NXpCc2RXNmZ2bkF1aFcvZWpCeTV3emVJQ3hhTHVmUHk0bEN1RDNKbkE5a3dj?=
 =?utf-8?B?VnNMR3ZQWGxVc2lCVlpranFZdUtESGYwcm1lL255RkczZ1RVK0RMZVJLS1Za?=
 =?utf-8?B?QStmeVlOT2hWcFc4ZGpSdXZOUGxCY2U5eDhLVzVYNWI3VXp6emZUZmF5Q3dE?=
 =?utf-8?B?Nk9NZUdENlBqMTRITHd2cDhlNUZXeFFCb1NRS1VyS3dJT0kvSXQ3QUxEZlZz?=
 =?utf-8?B?T0E3Z25EUzFVVVBhbXJZMWFtU1FVblpac2NseWxuemlJTWcwOHJrWXcrTFpG?=
 =?utf-8?B?THZvUzFKcnk1RjFBN0FOd1lpc2N1NllESHNseEdCWUJMK2RHYnNXZlYwd21w?=
 =?utf-8?B?V1Q4Vnl5WkFzQTNCWVB1eXJVQ3hSVVI2VStLTzhCcjRsMzM5UmNJQWE4THJV?=
 =?utf-8?B?aUt6TlFINmVYYzFXdUxiYTA5cGM2TDRyOUdTd0J4MWpyL0RnK2lrYU9DUWV0?=
 =?utf-8?Q?Ugn9IuggKXHfQYW96QLEI6LOE?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b0f6c30-96cb-42b1-40ea-08dbcfedc3ee
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2023 15:20:30.5618
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TRmF5jbBRi+Da8rFfQVmoECVJd/uhH2iQnhfzUy7XrOYIi2zUQEJVIQ71FFaNWLPl8IcdqWxnP6QvjsrreACdQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB7681

On 13.10.2023 20:13, Shawn Anastasio wrote:
> On Power, the exception vectors must lie at a fixed address, depending
> on the state of the Alternate Interrupt Location (AIL) field of the
> Logical Partition Control Register (LPCR). Create a .text.exceptions
> section in the linker script at an address suitable for AIL=3 plus an
> accompanying assertion to pave the way for implementing exception
> support.
> 
> Signed-off-by: Shawn Anastasio <sanastasio@raptorengineering.com>

Acked-by: Jan Beulich <jbeulich@suse.com>



