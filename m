Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CBEB867CB06
	for <lists+xen-devel@lfdr.de>; Thu, 26 Jan 2023 13:43:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.485031.751959 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pL1ar-0007Xj-Mm; Thu, 26 Jan 2023 12:43:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 485031.751959; Thu, 26 Jan 2023 12:43:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pL1ar-0007Vh-Jq; Thu, 26 Jan 2023 12:43:05 +0000
Received: by outflank-mailman (input) for mailman id 485031;
 Thu, 26 Jan 2023 12:43:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=71dA=5X=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pL1aq-0007VZ-9a
 for xen-devel@lists.xenproject.org; Thu, 26 Jan 2023 12:43:04 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01on0620.outbound.protection.outlook.com
 [2a01:111:f400:fe1f::620])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f8f6e22d-9d76-11ed-a5d9-ddcf98b90cbd;
 Thu, 26 Jan 2023 13:43:03 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB8053.eurprd04.prod.outlook.com (2603:10a6:20b:2ad::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33; Thu, 26 Jan
 2023 12:43:00 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389%7]) with mapi id 15.20.6043.022; Thu, 26 Jan 2023
 12:43:00 +0000
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
X-Inumbo-ID: f8f6e22d-9d76-11ed-a5d9-ddcf98b90cbd
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IuqP638I+4WqBBCP5FB9x/X7qBxV61sHYai4874dCn0Kpy1ZcnuJPz2VwLI6XClc3NdJcREfE8JYxQSGzBqj4cVsWOZhHManMAjxPMUPXD2N9a8TvpgXv3eGXhAIhCFW+VOA9+MohNQvh2GPbNuqQfWM0oZi37sEhE4t4wtgMjhpx6pfbf/9O5glB6x1xKCF16JZ+kQYssSvdHzb6NXGvl3p3NpnkAfk9wGO6xcafgcfOZmidwNqj/Bi1Vd1PnymY3pUYIuSiZQrwDd9MqXtn2c4GHXcQVdmT2mw8mwJZYgs6kbgLl3a5dS0WcDfnWsk+Iao0U1T93GO4pr2VHv47A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fCIVs0Urt1X0gEKvV55PmOdFxv9nt7cPT5Q15l+hdtw=;
 b=P6hYdFFCJtRgINdiyMhiLr0VKg2g5G+mRuggH64MRM1vv/wK+7JNp+Yf7B91giV3Yas+uOmX1NQ5eKE4vY7h/PMuhS3JguTBthKM4sg6tI5s1yb2QS4ObmTYpjIuLqAMNopuEBvh4J99aGu9ZKwxOU9UbSLz4rAG49uv/VkiMDt/vKlYI/Hv6B9EtdLzqaPWdaRWjLG4KfDdqApcNQBuIstC5g+imOte7Rm7svC1USytzko45HNmUsHNYUEdp4wjyZP1rJrkJMhWHVr0GrdgJLmRELVyHWIMf13KRV70vW3MOegeQzGUSMSSnf1NfkNd+mo8vb3+3dUBkxs/9vJweQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fCIVs0Urt1X0gEKvV55PmOdFxv9nt7cPT5Q15l+hdtw=;
 b=MZLirm73QnJ4WXfT1CJyZBiswhmGgK+A4VY+7ypXZC174lzSNiXNxGdI2ONUSsjvtU8g042fyihiZZ/Fu36hQB++eNo5So066eiipnA194ZtRoZcdNxZvuCwkHgdL+LQf07sITI4US/MRcLJNWDI+SX5ErKFleEPTX5qFAa68VXVBpchmxAyW8HKEDGmx8K0r9TkVIAj1nAxYts82Y2NlgPWczHr9aBx4gOFh2MVfWw03aNHPKdotyyDBMDMGjSFfLQqjOEHty7zBVcrE1bH2zwsQCv7EZAKDTJc79MVeHcsD9pvUGv5O57ZPTRxI9yQRRRAKTLCANtJ/jvZlNcXKg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <c80da13e-32c1-0499-de91-67cabc3a495e@suse.com>
Date: Thu, 26 Jan 2023 13:42:58 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH] tools/helpers: don't log errors when trying to load PVH
 xenstore-stubdom
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20230126122406.14627-1-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230126122406.14627-1-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0111.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a3::14) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS8PR04MB8053:EE_
X-MS-Office365-Filtering-Correlation-Id: 97764e3b-e437-46d0-0d77-08daff9adbba
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	JaFNiF4Sn1KUgSDtNdWigj/xWAmF0XI5rY8XY9FjpP7Vdn/zUiKqgrZAflsxl3iQh7qZR31IrwHwc2PdiI4PYG8KADvKCXpUrVlbKHkVyIPnzsYCUVAPatgqFp+RKx21RrHb3LcU8D4nDjs68kuMQ7+1D6HmcqNSqazGEvM7an8rsxih/KFIqngB8UA0muAU4QBAfK0dcBE46vMe3jvzojEMMiuv/wA9Mv4ZE/80Mb3DvnQK9Ey/tzdDXqU9W61rwEWs6pkqOWqPqGcF1lm6wb+gZ3s97LcbNHs395CA9gPd2+7S/kh8GwY5TqF70DlUvOoAMLGZwplriRKqpCUo/lm3ERL6bkdms1mjHwVqj+rrvaNDlIt7TTVxm+OhCdChPZ+tepKDAFOQNynK7MAyq57s88/5RoTC4h2nOYL5W7FcMOTnZBz0+Cn48n/5s+OYwBT/RevDtZOoiXvQ8XSHsoY1FKo3Cg+HE1w7aCcuWwqsOFO5+jzpMScblG2SYoeFSViJHbwklfgkJeytczDd0tZxvxjNgUDYeowan+3mpgdIYWmiGuHH48+aLeUilW5HbtZM6ec8+zSi+iu3ThVx5KgJeHSTiu87tKSJld3fhzxIfdKnRWXw7KuQP6KObG+iDYh5M5r0UQ7uNcMBlWRvm+Vu2HuSxFVz+ayA7OO+/orOvxJ0RqIQ1rR98k/7nuxF5kHLDSUNSc6HUFmblonX8uxh3+bFRJszNf6qRcydwxI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(396003)(39860400002)(366004)(136003)(346002)(376002)(451199018)(38100700002)(36756003)(8676002)(6486002)(478600001)(54906003)(31696002)(316002)(37006003)(66476007)(2616005)(41300700001)(4326008)(66556008)(53546011)(6636002)(31686004)(6506007)(86362001)(2906002)(66946007)(186003)(83380400001)(6512007)(5660300002)(26005)(6862004)(8936002)(4744005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VUNQNFgvWlRwc1VJZ2NkbGRqdW91VmZESFVFSXp4cUlucnNMU1JsaGx5bUVv?=
 =?utf-8?B?U3MzalhjUU05WHFnS1ZsMFBqNGZKSEVqWlpNRWtqaCtzWVpFSDVtbThMQnlM?=
 =?utf-8?B?VnZrQnNMY0FmR0c0Nyt2Z1Ruc0MxWHlUdTh1enVjRDhCakFzRkJtK1h2YlFx?=
 =?utf-8?B?S0cvU3RXZmp4aUVobUNKUjJINkNkaXVMTFE3MzRjZnZTTWxFaDFBY25KOU5N?=
 =?utf-8?B?ZU5WRUVpTWJNWHlIUHpEN0ZmMGh1ZVhxbFcxczBxaEFTUkpmd2JPNXBBUkdo?=
 =?utf-8?B?S2dXVEZFeEFpVU9uT3VmWElHbWZOdFlKbjFSNWtLYzNENDBzVVpua0Q1L1ZW?=
 =?utf-8?B?SURLTldTWTFZV3YybCs3ZlRQUnV1eFhVK3NNQjVOOGNjQWE1SkRWeG1qMU5a?=
 =?utf-8?B?eU9pTlN1YUZjRkxlRDZqL3ZVYkd0VW5IbDNnb0FPeitDdmk0aFoyNm5HRDIx?=
 =?utf-8?B?d0RtV0RwQ2tTd3IrUW9CTmVtL2krNHRLOG9zekc4aVdLQ0ovMHFRK0NkWmZw?=
 =?utf-8?B?YnZlc000Zis5UWNvdVIzL1p5YnZ4MTBJMlRoOGs4RkNuRmF6dXhIR2JGUDNa?=
 =?utf-8?B?K3FpOGdmNTFXQUR4N3h2SGtlU3lRdTRWVy8vSkVlNFlCb0NsME9uR0prTDNI?=
 =?utf-8?B?Q25NUnhzd1dRbjB5ZG90SXYzbVR5V3BybmVzZlpvSWtuZGIxc2ZyQnVqc2FO?=
 =?utf-8?B?Y3ZPWFlVK2cxZ2RXVStPS3lGQm1OQWR0QkFNZ3BGdEZOQmM4RzAyUW1kVFRn?=
 =?utf-8?B?cy9uaFNiWmRlcjdPc0pLMkJyL09vdHhmUklyb096VDh0RThscVlicjZic3h2?=
 =?utf-8?B?Q3pzQVlYczdUeld6K0lPYnh3R3ZFVkFwZmM0TFpEd3hWQ25oN0QwZnRDbkJj?=
 =?utf-8?B?TjJBeFB4WmY4aE5GcENDMlFkQi9iallzbEdWRGVERDZhaGJzVWg4ZVJpY0pN?=
 =?utf-8?B?cmsxdFpaRmZ4Y2Z6NllVd0creldOUUVnbllaQ1k1NHZWMHZoRUpFSTdrT3NK?=
 =?utf-8?B?V1RiREp4bmwrTk94N09vYkV5aDJ3dUlvNmpxVHFNd3hEcE45Z3VLZUVJL1Az?=
 =?utf-8?B?Nmp3aHZoeDYyQXNJemkyZzFXeURMQldRdXlJT013dGNYL0pSWGx3M2xGYThq?=
 =?utf-8?B?ZlRFMlhrRDVjUnk5KzZScndDRUdwQkpOVVlDZnBPbU9zTnMzRnM3QkVRVTJx?=
 =?utf-8?B?MmtJdm12V0dhRllkUW1aOXN2clBxcHkxK2NzY29WWTBkSWFLTmQzVmpFSDI1?=
 =?utf-8?B?SmRSaEY4dUpxem43UVdlVnFubjY1YXJwRFlmQnBXYWc3YmtwWTMwZ2poMFg2?=
 =?utf-8?B?ZFhlUU5sWVN2NXVxOGVBeEFVT1I5aFl3eE56ZG1pS2k4TzdZM3prQnhtWFdu?=
 =?utf-8?B?YlNhamFJUGtnd3VPK1JVeTFnMzhxMndkSHpiZWR0OEZoeFdJdWdTV0gwdFpm?=
 =?utf-8?B?R0NpdXlKV3JLTzUrdk1ITUViNnNMV0UxUTlNdEJEQURlSTlMZVZnalRzcWlT?=
 =?utf-8?B?dy9sRkFjcDhDQXRncndNQXlyNTdJM1lwV2dTdGhQNG9rTlhlZkhRS1JYbWFs?=
 =?utf-8?B?Q2VNZ3luU3lhS3pUVjZhUUJBZHJuSURQd0h5UUxVdUVETVRIbnVwZmJuZzFS?=
 =?utf-8?B?T2l4NHFHa1NzYUhzUHpvRkI1Q25CWlhiMmVIdkZjdGJxK08vV1YyeVVRcHY3?=
 =?utf-8?B?UndHVml6Zm5wQnJPMUZJWXc3b1hKWkNaYmdJUURkZVJSRzM5NUYvMWcrejhk?=
 =?utf-8?B?L0dBSGNxQjg1MzJ1ZTNOUmpvZHdwMDFsVkx1TGw0QXlza29nbCswcEJkRHF6?=
 =?utf-8?B?VWhPUnl5aXg2QncyWkVxNFhrY3U3K1UxcXY3VXdlOWVFcUwrUUFFM0kvK1Vl?=
 =?utf-8?B?SG5XcStiSnVwczdKSXczSCs0YUFCcHNkMCtCVWcyR2k0L2FETllJbzM0T0to?=
 =?utf-8?B?K0NtclYxeFFsY2ZxeVJRRVVwUCtJWDQrem9SWFhXL1RRc2RlK0pDb3FzZHhG?=
 =?utf-8?B?d2Z0cVlEOXh4bHFrL2dTWTFOOFFhV2ZhK2RxNzZtUkp6N0Z1cXUwL2Y5OWk2?=
 =?utf-8?B?UVFGeDV5b0c4dFdpaHliZU45a3JUOHBmd2hGOG9NN0F6bmc3NGZUcjJvT0xV?=
 =?utf-8?Q?NRazB1HWyhHZAjsYoBJC0Ypcg?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 97764e3b-e437-46d0-0d77-08daff9adbba
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2023 12:43:00.4046
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: puN3ciDTc5C31Z/gFbG1i1WMGvrmFjsLc6PdKF2xY7U54EngaBPvIOpIBrV9bkUZj7tDBvdujRfcy9APUq9DjQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8053

On 26.01.2023 13:24, Juergen Gross wrote:
> When loading a Xenstore stubdom the loader doesn't know whether the
> lo be loaded kernel is a PVH or a PV one. So it tries to load it as
> a PVH one first, and if this fails it is loading it as a PV kernel.
> 
> This results in errors being logged in case the stubdom is a PV kernel.
> 
> Suppress those errors by setting the minimum logging level to
> "critical" while trying to load the kernel as PVH.

And if the PV loading also fails and PVH was actually expected, then the
messages will be heavily misleading? Shouldn't you instead accumulate the
PVH messages, and throw them away only in case PV loading actually worked
(or issue them at lower severity, in case they're actually of interest)?

Jan

