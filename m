Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1238D76AA0F
	for <lists+xen-devel@lfdr.de>; Tue,  1 Aug 2023 09:34:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.573729.898705 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQjtH-0007gk-Fh; Tue, 01 Aug 2023 07:33:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 573729.898705; Tue, 01 Aug 2023 07:33:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQjtH-0007e3-D2; Tue, 01 Aug 2023 07:33:59 +0000
Received: by outflank-mailman (input) for mailman id 573729;
 Tue, 01 Aug 2023 07:33:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OOcM=DS=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qQjtF-0007ds-Pu
 for xen-devel@lists.xenproject.org; Tue, 01 Aug 2023 07:33:57 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01on2073.outbound.protection.outlook.com [40.107.13.73])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c5db7083-303d-11ee-b259-6b7b168915f2;
 Tue, 01 Aug 2023 09:33:56 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AM9PR04MB7667.eurprd04.prod.outlook.com (2603:10a6:20b:2d5::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.44; Tue, 1 Aug
 2023 07:33:25 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6631.026; Tue, 1 Aug 2023
 07:33:25 +0000
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
X-Inumbo-ID: c5db7083-303d-11ee-b259-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hgBX+mx2XlbVoC4sJxuKCOEyYGozJsj3+ulWYHH2Zg4v9C2icRfJJxjt7W2IvhKEghOnZTQQnCKezSWlnnA9CzSb61DXSKp/XhUYxB9ic7uM+bvPaJVjoTbTH/vcnAJrVwEjQs0R2oD/HQhuZPvOFDan6H6Mdsx2rp2TO5/m3HvS1uuqnt7CYBpNi1ekr0S8Yd1OQrvZmLbehRVYv0lFBbHXOwumMna9nvKnZtYSxYwCRMXS4Ge2Wj0FLY7Yh+JxEsqsHyMLjIN9sEKXqZecS3Ms7no44b18aok5gyEvVr6zSRUSRGqyiHCGWIqIXQzWq/ttiSCWXNkzdqJOVg90TA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7OMh/x05/42TX1QWERn3Tnku7+pQOTwbHOS3lypRLzI=;
 b=nPFJao3AeV6tqZsJjbdb360mhxiYHX58srbWMKo0HUFxw7gcfI3StirsT1vXsigLPZKUJ6tYxQR0l65ULFDaYvCP1qzg76Bx+xy195Vm+KLEUKiDwFXpHi/EjmHLSbJnjW9yIKGIFQnk+QT2FuYdTWiETDeP9UGL2xJdMf6Ff3hRtYHSW3oAxVz2StaxbX2xM+QoeiaebkZDhnNDIl7ih4JK4+Q+YubjaMWdY+ya0D92+IUONjZSwDCjbwd0Di4SCiFs4ZdFaoZkjbxr+I+MFbvJFCCQsRV1brfNIfPieG3OeDRekDXHsZmUn3GebDz9ScOTLNL+GC5YniVmTJ2GWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7OMh/x05/42TX1QWERn3Tnku7+pQOTwbHOS3lypRLzI=;
 b=dHPz7CN6BUYFT0ZgpJypWA0TNx2sIrrFp1o3kIkB/b4Qwz4Qs68sHfhuK5YRW8xn3XR4xNEeG1jVKXOVNskiPWpCa8PucpCwT/rybmUGIJjJCM5lezPm8dMdqEYQkgmq+S5qa5XFcuraYhfb/lJw3u94zwKVqhJHYID6f2YHxg/EqpDsXWCbA3lFi104MWRUq8vRrdgkcUvajIpqdvmNKQwucPpkJg8EvsHiJl3KxdExWGr7bf4bEeYOu92k0E8G45N0p6mXsGMf1hftQwWey1bNnHvDvugaNOIMGUXPlXim2v32fq6b63aPKyxB+ThSFBleCUVZDcy0+qrOckeLHw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <ed6ce883-4905-fc3b-5614-48f86dc490dc@suse.com>
Date: Tue, 1 Aug 2023 09:33:23 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.1
Subject: Re: [PATCH] arm32: Avoid using solaris syntax for .section directive
Content-Language: en-US
To: Khem Raj <raj.khem@gmail.com>
References: <20230801001258.555944-1-raj.khem@gmail.com>
Cc: xen-devel@lists.xenproject.org
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230801001258.555944-1-raj.khem@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0257.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b5::20) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AM9PR04MB7667:EE_
X-MS-Office365-Filtering-Correlation-Id: b031b435-7d3d-4aa2-e63d-08db92619794
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	b+a14iDaJJLFwMILu+JzbV484USc2l5cMnhy2wbhPZ2k1Mf0py4n2Y5gM2tK+0GyS0GmAZ+1uYe+lKpdcIhr+9R2iNRBd0Capkmucbikzvwx3bjBOtzkvVTI9K9dClo21Op4x+Garoxqq8dHGz5214xYHwvmwP1a2UX/Y25+irYvmTMizwnV5iLGBMf0TCbGa1kbuUtkb4RtVX37txNT1athpQ+QmEhORfZtwIH26M0jY6N5JLTwpX/hwur9xgPeuewuOpLVrTvZ+eH7H1ROolYuE4IsDLSMgrzFXHH1+SBqEPX6GzgYvYRDj22XaB7JXJVdaxarF4xlAIs57vKQ5BCO1iF+ycBBHPKHc4qj5CtQHBDK9QvFQ8wKDUCbMODoiIZwB7NUxNsJBCg/uMtTzIQ0hfZsEsGbXoem9JNUk16wWLKnn4azOFgDqMF5V4ABJ/FQL1u/wcu7Tbdrcfqj03NEvuV/yGV//KyBea8HEJEjHTF9srBooQroQGvbPT9elWafHhcjoTAdE7R0V63rijxqaKwvED71BQ2IU9/lavx8j4m3wDJE/Dd4i4DQoAGdqxoK/v2jsj1wwVU80SB/geobBIRi5U2MnEF4SaIKIxN6XGJP30nTwKM0CARaX7Iee63RxNHKnoCaxFL7AMZ+aDNOZuaCa9h9b7wFlfyYdIE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(136003)(39860400002)(366004)(396003)(376002)(451199021)(966005)(6512007)(26005)(6506007)(6486002)(36756003)(8936002)(8676002)(5660300002)(66946007)(66556008)(66476007)(53546011)(4326008)(6916009)(2906002)(4744005)(2616005)(83380400001)(478600001)(41300700001)(31686004)(86362001)(186003)(38100700002)(316002)(31696002)(142923001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VEFCZnlTTXpvczhmajdrR2ZHV09uTGFuRTRjY1ZTRmdhOXlhQU1oOXkzekY3?=
 =?utf-8?B?endyMTJaMGp2a3JzQkQzcEJBWTROcXByQ0xCa0VDVFlyRmF1WXUwTk5GT0RD?=
 =?utf-8?B?NzcxdTRlZFp3NGZBbmk0K2hOMXpVUHZIaEVHelgyL2o0WnkzRUxyaE1mOU5I?=
 =?utf-8?B?Y3RVQ0pZOW1TVDNBVFBJb1hhbVhNVGV6M0VVZG1ueXJOS1ZWUXFQTG1sUit0?=
 =?utf-8?B?OVRoZGorTml1OENRdERSK0Z5VnFEN2hVeDJhRzB6NkJsZGlZNW9wV091NFF6?=
 =?utf-8?B?L1F4UDBaVVR6UDlhdkl5S3o5NmNNV25qS0ZBaUxGWUVlL01JcWFQODNKOWp3?=
 =?utf-8?B?SVVUQ2hQMnZrOGZwekJUNXl5ZkZkbjJ3aVlnbHkyZFRnZnFlU2ZQOTN6S3Jp?=
 =?utf-8?B?REY1NjIrK1loUklKQy9HdTdIRTRHRTlEby90di9GclppRXlqSE1KakQ4QjFV?=
 =?utf-8?B?ZksyWkhjQnNDOEcvN1BibHQrVFdaTXpOb3JaaklsMjEwd3pwZlBYa0NNcWxo?=
 =?utf-8?B?QUFiV0ZvS2JhOWdPajJaYmh4MmtvWVI3cGdiVXJXTzdOU3pxM0o3UXdoZ2xW?=
 =?utf-8?B?RzJLbnFYMW9ZSFk5VVQyWjJKK1hyd2gxdm5mWHlCa0c2elF2RnVrR0pKdnFZ?=
 =?utf-8?B?d1dqWWVjTlJWcDBlUW5jMzlzM3hkekFxSllyayt1M2NjQjBIN3lTZzNrZ3o0?=
 =?utf-8?B?aXFrb1VYQXZYU29RcmsrdldLdyt5bEthSFlVb0JrYW90WGRGQWkvSXY2SFQr?=
 =?utf-8?B?a3gyRzNlQUVhZEZyWDZSYUVjek1jTmJieGdtUzVxZXNQcVdGRDhBbHRDdWw1?=
 =?utf-8?B?RStCTzRweXFIZ1ZsRGJsMml2VlNZUXljVnVBVCt1UHhxUHd5bkowbkFIL044?=
 =?utf-8?B?WHBVS1BXVEt2OHQrclZDNEE2T3VGa3lyMHd0RytjRXVRM0pPSDVSYTVwQ3ls?=
 =?utf-8?B?c2Z4eUw2S3FQUHRFQlRZdVFpN29ZaUl2cTE3QlJPdzdCRDNEeWlWdHYwaS9i?=
 =?utf-8?B?NVpPS2lpakw2YnlZUldudmg3bFYyTndDb0Z4dW9MZUNYU1BFNWRWZDVtRGNE?=
 =?utf-8?B?UXJmN2VLSW9xd0RtMTk5NnBQOGpkeHhGdE4yS2E1LzJrZHVVTURKNkJtTWJE?=
 =?utf-8?B?ejFjVUZTcEVMQlRSa0VlVXFDcGNySmd5ejJUaGNVQTNPZTU1TmRZU3RaV2hW?=
 =?utf-8?B?NmZ5WlBlNFlqbmNnRit2bDBuUzIwL1ZuQkdQZlFBQkRucGVSa3hTNTJKM3hG?=
 =?utf-8?B?RC9OWWhpcUcwRTZhMFpGd1ZzMHZGOGhwSVF4bGpWRTVoeGRkT2RHV0NqOTAy?=
 =?utf-8?B?MlpoMHZxK1N4RU81a1NtdkZ4VGNSSGFPOG8wNG1Hc0IzcUl5S3BMdmVOZ3Mx?=
 =?utf-8?B?WlNiRk91NGVDaEFnUDNiRW9MakU5TzBFQzVmaUV6Sm9meDI2VU15amZPeUlQ?=
 =?utf-8?B?aGgzY3RWbHRHeTdpcmNmeHE1SnhPVlhXNVJUWTlZbHI4YjRSdkkzVzI1aVp1?=
 =?utf-8?B?aUpiRzhoeGsweis1NGpGZkk3VHdSM0lYRTE4MlJIQmFFck1aMEE3SksxMEph?=
 =?utf-8?B?ZEVsT3cxZ25ua1QxcXRLdFlLMFRFYmFkS0Y5VFptL2RUa1FBSER2dGZFdFov?=
 =?utf-8?B?YTB3cVFMSnVQM0tUQ21UNUdYRldMMWoraWkvRHBUUHIwVzYra0xDWTBieERJ?=
 =?utf-8?B?c0FCRG9lTExGYnNuYkpnYyszdTRxSGtXS2JOLzlhd3hTNzdVTkpQaFdxZFdM?=
 =?utf-8?B?QVZ1Y2lHU3h0UUxYT0RzVGY2VEtNT1hHL3diNVBlQS93L2UvTmNSbFVFbnFS?=
 =?utf-8?B?RVlNaHQ0aVJzOUkyYmEwUUIyREhadmJVT0k1ekpZVXVFVHU2TDZRTHVlbjZn?=
 =?utf-8?B?V0lNZWQ2azFCcFJUTXJ0WGZiZ01idmZkbWtqYXBtSEVmNXAwSHNuV2RDblhM?=
 =?utf-8?B?SjBsUHBQUEovUmJRTEZ0Vmd2RDRScmowNnBYa082OWJGRSsvZmdRUC9DU1h3?=
 =?utf-8?B?cUNSNVI2a2JiWTJWUlFydWlaNHMxSmdsQ29CN05OMlBTSjBJZGU5ekliNVBP?=
 =?utf-8?B?YklxUHVzOXJDL3hKQXN6dUFud2gxbkVQT2IybUVRTElRRkUvL082Z1JIRmhn?=
 =?utf-8?Q?GKL0DLTNXcBAUhxoHnS8KVzYV?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b031b435-7d3d-4aa2-e63d-08db92619794
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2023 07:33:25.7087
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: twdrmteSuTtFOtM6B4++tyZJ7A9MFa3Zgip++r0+vYEbjbr0MvHx8s11wzp4VfZLN9V1D3FnTETWxy1sOK+LjA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB7667

On 01.08.2023 02:12, Khem Raj wrote:
> Assembler from binutils 2.41 rejects this syntax
> 
> .section "name"[, flags...]
> 
> where flags could be #alloc, #write, #execstr
> Switch to using ELF syntax

You mean GNU, not ELF (ELF is describing the object format, not the
syntax used). Feels almost like a regression (I'll mention that to
Alan), which likely went unnoticed so far because Linux had changed
to GNU syntax already in 5.5, to allow building with Clang's
integrated assembler. This aspect may be worth mentioning here as
well.

> .section name[, "flags"[, @type]]
> 
> [1] https://ftp.gnu.org/old-gnu/Manuals/gas-2.9.1/html_chapter/as_7.html#SEC119
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>

Out of curiosity - why were there four instances of the patch?
They all look largely identical; if there are differences, I haven't
spotted them.

Jan

