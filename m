Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F3E7450A507
	for <lists+xen-devel@lfdr.de>; Thu, 21 Apr 2022 18:09:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.310341.527132 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nhZNH-0007NM-Hx; Thu, 21 Apr 2022 16:09:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 310341.527132; Thu, 21 Apr 2022 16:09:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nhZNH-0007L9-Ej; Thu, 21 Apr 2022 16:09:43 +0000
Received: by outflank-mailman (input) for mailman id 310341;
 Thu, 21 Apr 2022 16:09:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lloE=U7=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nhZNF-0007L3-Ow
 for xen-devel@lists.xenproject.org; Thu, 21 Apr 2022 16:09:41 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 72e893da-c18d-11ec-a405-831a346695d4;
 Thu, 21 Apr 2022 18:09:40 +0200 (CEST)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2054.outbound.protection.outlook.com [104.47.13.54]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-16-pDCIU7AxObm1Xiv2t3_jCQ-1; Thu, 21 Apr 2022 18:09:39 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by VI1PR0401MB2462.eurprd04.prod.outlook.com (2603:10a6:800:5a::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.13; Thu, 21 Apr
 2022 16:09:35 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f%7]) with mapi id 15.20.5186.015; Thu, 21 Apr 2022
 16:09:35 +0000
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
X-Inumbo-ID: 72e893da-c18d-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1650557380;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DVq+6whEiLRJ7xHIrr30WCcB1pdiXOMTm0IylIrQNGA=;
	b=mNIRklGcilbJKyHtdizhyLhL8sXQaNMdebd21Y5LLrSjuC441n408qhNZZBo8qYJVZfSEC
	Y1iGiX+9FbjtxW5/VxSuzXgM65z6J+3cIG8xgplJn4xIMzpXkAKY6VB3qIBXRU/tad7/EX
	eaNfzeQ+55gOdokxB7OdC4RxS9KBQy0=
X-MC-Unique: pDCIU7AxObm1Xiv2t3_jCQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S+XuimSuMUcY14xZ9MpTohKs5KBkmKfSsIRbGma/i8/J2uKgAtzv2Ci18lLVdqPgg/sHbbmmx3xVBt58fj4l8rn1GvFAQgCjwzap/btE39GSXZ/pPApJxdfht9Q2ZpxLXb23cVs0CUvRDtbD+18qmfYM5MZOqP/KxiM/yqU7KxY9xxZx498tYEj4cpDmhLogttQuRaWQtfT+cT2vvTUJ+tsQWvuFhZxChQymQ15c12b+VIpA+bmk5RTiGUDBEM7R9jVhrPwChmqE5mggQ2t3ZmXllq5N5DYfVEuX+CuvjQ4xiYJFoNm/k387xuveSuVnAxSleTpUHc8aE4tH+WaJ6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DVq+6whEiLRJ7xHIrr30WCcB1pdiXOMTm0IylIrQNGA=;
 b=A8EZctFhMpt1c0b44Pqkvv/MACS4H/Yc/ZvYyJ98WgHSTE6xqIVf2IemjDDO4dp4bY66j9Jd5/z17SA0UG5ubQwCCcbRoWUH40HitEyyAGW0ty+NV2mNYmRn4Q3WwPLmKc9n0fbpHpTfiSxPYiIiLyjAeT3AxDjsJZ1qGVWZLRiFdFY7FPv2DfiH7+l6BymV6kYXQ7bJuifZiQD4FaxYA/7RWfEMGtumVjZNzEZcaFL+9N4MMKCEOKgI9XLTwF0PqN4kNgvs/xlqmG95fxwrJeupYCB0KBLDrTCsH9C3WX7fTuMBFz2XnQJJ4cBLqlhO5DSzMax4KqEj1NoBZECL2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <b03098dd-7fd4-ed91-cc94-35fd24c46126@suse.com>
Date: Thu, 21 Apr 2022 18:09:33 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH] xen/build: Fix MAP rule when called in isolation
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Anthony PERARD <anthony.perard@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20220421160039.24564-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220421160039.24564-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0384.eurprd06.prod.outlook.com
 (2603:10a6:20b:460::25) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2df8d500-228f-43be-8e33-08da23b153d5
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2462:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR0401MB2462F404B9C2DF10DD4FE2F1B3F49@VI1PR0401MB2462.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	F2bNmm4fykOGYG8g1V0va9z3uusNQEPihT1shQi5qWiWdAlxwJDkt5TJ5cHi5FMe9bB/mTckprRJF/Mnf5ImpVnehM+kj/5SmCCGFXYH6f7VCqXYkTKszG/HFcPTbHn5q/CqLizd+I9iZdJYJk23wnii8KcW5d8E6ylELadehDfxBV3+GtVbpELvjch+lffvt9/burO6EhO45mp3r3vGxuKy9AL/7P+BNaqvR/skUZbIR21ObyaxACEACTu/oHUgobgPyCI5N+5Ra4Bl4yLZ8vlQPnP/9WB4KlYQJRQAvOU+9qgeeUc2bd+f74ta5CMRO2vCnPlMSZS56pS9w0yKnMxTrKvDk4pvN9KaaEvMah5KhHGswkkLPeKlaYg9Zy+pvzZOcGjj0x/u+tOV5r1A/47fSyEV5eB6OJjTbItoUwIi1RHlauVlFwy8NCZn1WGch9EjZ9euKDKhG3WbTL8Rvfc9SY04K22HsX3QxT0pSqjZ/ZLhhfiod/p/dgkBaIgnygOycRnFLnFJpSVi8/tsfk9qebsxSLyAPX6XdVQ899E1/G5HVn+8whFE4DXea7ksf+bwTtT3Ko8VaxfwPeJuHaq3i4g4GmJkG7IZ1dtgvkpjipVLyLVi2cSw2+LdB2YO6AwdPFjF8dmUWAvX+B5zR3YxwqwvZQi8hLQOKV39szCpLFRjOLe2hKUmJ8I1s9Nfe7w1AkZhGTUJTVRmlqiMwbljMj8BkluhLpKy1H9FXKDR1oB5JlGAsaf1g23aECq+
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(5660300002)(66556008)(36756003)(53546011)(31686004)(2906002)(8936002)(66476007)(186003)(6486002)(26005)(2616005)(38100700002)(54906003)(66946007)(4326008)(508600001)(6512007)(8676002)(86362001)(31696002)(6506007)(6916009)(316002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WndBZ2tFTTV3VWtjd3hlcVBKdncyVmMxd3g4dTQ4eGx4RHZKNHlVWURObmZI?=
 =?utf-8?B?OVZ5S203MXkvazBYRUpZcVBsN01tSWRtUUhRVERWMFVVRnh0ZFdvZEdBc29R?=
 =?utf-8?B?QmNtNUFrL05jYUhmOXRNWS8zbXVXYkxUZXQweE9YMU5LRXV5NVdqN09PSXF3?=
 =?utf-8?B?QkwxSjJHWGJsZ2NFMzRZdDB2aWdHUGl4TlJJc0dhb3lHOWFqUnVDQ1pUR0U1?=
 =?utf-8?B?R0Nlbk1rZE5xeTdrTVBMcGpLTUt3MXhiSVdldmtCRHhCVkdzaWJiREFkQVly?=
 =?utf-8?B?SlJGYnZPZjVUQkdnaDB4Wm03bHZxSXp1a3h5dHFESUU4enRJNjBVTE4rek5v?=
 =?utf-8?B?bTROWGkySFBya2tiQmpVcjdWSGZpNTl4bVlheGNKcWRWbHUySkZ6andFZDRm?=
 =?utf-8?B?Q05iTFhFbmVXRkxJMnVkcGJCbHp1QmowRXpWSXZYV0JFbkszV0ErTGpIcXpV?=
 =?utf-8?B?SWNwZUxMMFN5d3BWTGFlSTdiM0dzdUdHYVBncmxTNm4wUXNGVExnZG1iajZ4?=
 =?utf-8?B?bU1WbDFLOUZCREVPd01mTlF6eGpBeGNUMEtvSHhHRjdGRUFiR2ZybFJteXRa?=
 =?utf-8?B?TU14Y1czc1hsZWExbWZvdllzT3Z4bWhFRGh2VWJoUWEzQkwrcEhKV3BSS0NX?=
 =?utf-8?B?dm9qV3Q1UmV4VVNSazhBNGJVWVVPU0tsVkJ2Y2hKU0srNngwYnFPdXBWc0tp?=
 =?utf-8?B?N0FQa25FQUNaeWZZdjRNcFFuMXpYanRQSllYcXpsQllTSUt2QVowelR6WVNF?=
 =?utf-8?B?Mzlhcm9IOVk0VFMxVUUxdFUvWm1aZW5EQjZvMUhjMi9RWWdwbTlyVlJ6K1NK?=
 =?utf-8?B?VlExSWZidWpmRXFEQnVabW9VTlkwajNhektnQ0hqcFQ3VW9EaTA2b1ZrVjFN?=
 =?utf-8?B?Q212OHYwVGVFdmFrTFBjNTIwRnNHUDVpSUNvRXBzRm5HU0pqdFZZeHFLbnZj?=
 =?utf-8?B?VktzTjRoamJuRlZBRWxxcHJhblVKbHkrQjdWWk0xb0dFcjFiVjlYcGpiTVNz?=
 =?utf-8?B?ajIyM0FWdUFJTUxoRmorOGtzN1V2UDlIbnNVeHA2NmpmKzRvZ2tDa0FCajI3?=
 =?utf-8?B?dG5RckR5R0s2cWZhVStkQUloMkNIZmd5U1pwNDBaL3hVWlBHajl1WkRnV1Rv?=
 =?utf-8?B?SlRDM2lHVmVBSDcxaEZIcEoyRG4xVWRpQllLQTBIb3lZUnJUbG5Nbkt1Z3lH?=
 =?utf-8?B?azVIaDliZ3pUcXNCMjl3bDV5d1B4S2wySUVWM1IvWHFPakRzZlZBdmRhY2Er?=
 =?utf-8?B?dnJ6dk4wQkFMZ3FiTGF0VHk2NVFrWXdFMy95TkhSNGNiRjhhSUM1VEZEMWNy?=
 =?utf-8?B?NUhDaGp0NStnMStlNExHVnpXSEoweHYyOTZCYnJaaE9RN1NiYTAyMHc1NVdp?=
 =?utf-8?B?K0lRdU1HM1p6WnhuRXVXSzVQYU5rUmZjMXVIeno5b1hmL1RkN2Jscm9RWXBn?=
 =?utf-8?B?RExBMlRtVzl1c2YxWGoxK2UyeVo3Y002cm81eFJjQUpwOXJFb0ZUK1h5dzhu?=
 =?utf-8?B?WXZiOUpUVDFkZFJyeHNBc1JKWFIwQnl2STl3K1hySWd5eUl0Mmw3VktjQmFU?=
 =?utf-8?B?a0dLRVNRWVVCcTBKQ25RV3lzVEgxaFU2SlpuY1RzbWJXOWJ3a21wV1lwY1pZ?=
 =?utf-8?B?a0ZwNmpEeEVIRVhBMVZqZks1enFVRk04ZG9oenRERTZZSjNYM3piamFuNDdU?=
 =?utf-8?B?S3dIQXVvb09KMm1rYkJCb1VOc0dJR3hnTU5sakIyVlZ2YlcvbGkyOGlLY1BJ?=
 =?utf-8?B?SklDQzhqNmJxSXVZRHJIbEluZ3U0VUdsL3V2NXkvZ1ZhbUFYK0NqVnd4TzVp?=
 =?utf-8?B?T3NFa01DV2Nac0dvVk5oQ2xwQ1ZOZmlLNVozQXVqd1pLSlo5SXNsN3BJNXhv?=
 =?utf-8?B?ME91TEJ6cG5aWlE1NFhXY0VYcEtZdjl5ZlJnM21VamhlRGxxOTRqeXV5QmJr?=
 =?utf-8?B?ZzlaSUZaRmN1RWdIcmxMd251SmRSNlZJMmNPelhGVFo2eHJUSGV0K2x5K3FN?=
 =?utf-8?B?YldyK0tlNnViQURjSStibjlNWjRYVnUyWFlDUzdEZHNnK2hMMXNCQzlndkx0?=
 =?utf-8?B?QytYWTZvdjcycExBelY2VGJ0ekRIeXU1T25rVVMrTjZLL2t2YTZNeEw2bUZ4?=
 =?utf-8?B?UjM3c0h4SDBqME5nYnR6SnQ1NHgxWFRxekU1NG4yYmJiSGk1WjEzS3h5TkZ6?=
 =?utf-8?B?b3ZDc1B4U3BjZ1hqekN1Y0VpY3hQUTlGbHNqMjFnTVRDVXNZK3Z0U3lWZVQ4?=
 =?utf-8?B?ZTRqTXdMMnR6SjNvczN4eWFqQ2pDLzF2SkZvVzF1NHUyaVk2MWFqa2Q1UEts?=
 =?utf-8?B?bTllYmwvVEhpTGptdG5zSjJDRjRwY2ZxWDdzSHhCQ2xyejQ4SXQ1UT09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2df8d500-228f-43be-8e33-08da23b153d5
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2022 16:09:35.1377
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qI2NmmuzBSKQtcB7zAYO9DrHW3FzfGGkbDqRsddT1zsYC/6p6r8N97WGM6xd1lRwhDEjqUOZiNGQTNkZK93QmA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2462

On 21.04.2022 18:00, Andrew Cooper wrote:
> Now that `make MAP` might rebuild $(TARGET), it needs removing from
> no-dot-config-targets.

Which raises the question whether the MAP target originally was
meant to be used only on an already built tree, which would
explain the missing dependency that you added in the earlier
commit.

> Otherwise the build eventually fails with:
> 
>     CPP     arch/x86/asm-macros.i
>   arch/x86/asm-macros.c:1:10: fatal error: asm/asm-defns.h: No such file or
>   directory
>       1 | #include <asm/asm-defns.h>
>         |          ^~~~~~~~~~~~~~~~~

Why would this be? asm/ isn't a symlink anymore, so should always
exist. I would have expected an error about .config or
autoconf.h not existing, ...

> Fixes: e1e72198213b ("xen/build: Fix dependency for the MAP rule")
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Anthony PERARD <anthony.perard@citrix.com>
> 
> Backporting notes.  The original, e1e72198213b, wants backporting as far as we
> can go.  This patch is only relevant from 6c122d3984a5e onwards, so 4.14,
> which is why my main developing/testing on 4.13 didn't spot it.

... and the commit you reference seems to support that expectation.

Jan


