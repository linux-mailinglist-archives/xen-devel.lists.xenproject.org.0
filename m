Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8192358F7D4
	for <lists+xen-devel@lfdr.de>; Thu, 11 Aug 2022 08:43:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.384181.619476 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oM1uZ-0001YK-Iw; Thu, 11 Aug 2022 06:43:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 384181.619476; Thu, 11 Aug 2022 06:43:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oM1uZ-0001WX-G7; Thu, 11 Aug 2022 06:43:19 +0000
Received: by outflank-mailman (input) for mailman id 384181;
 Thu, 11 Aug 2022 06:43:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WeOc=YP=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oM1uY-0001WN-GT
 for xen-devel@lists.xenproject.org; Thu, 11 Aug 2022 06:43:18 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2084.outbound.protection.outlook.com [40.107.20.84])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e187c180-1940-11ed-924f-1f966e50362f;
 Thu, 11 Aug 2022 08:43:17 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by HE1PR04MB3049.eurprd04.prod.outlook.com (2603:10a6:7:18::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.19; Thu, 11 Aug
 2022 06:43:14 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad%4]) with mapi id 15.20.5525.010; Thu, 11 Aug 2022
 06:43:14 +0000
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
X-Inumbo-ID: e187c180-1940-11ed-924f-1f966e50362f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SJYTCjOF2CwnkVPoKIPaZybecqjbYnWeoyltphKmo8lTDnOglqEKGxetauCzPIkeqWkJInp1IhfDmma+oBgV5g56nptlKgo3oXPd6yz7jlLeWHrSIdQbDL1T5A6kznM4IYcwOpVB8HrPzbYe/6ziudI7Fjdu0stTLDEz7cInNiAwW0ieximEVx45Bdt7GRGMoej+dALuQ83TEXvgZ0iyK87nIRH0NcrKC4irnKBYKWJ1VH+PFPiLwca0Qj/ws0OI5XBsZVaoBtEPKPF23Wk7MO2ji0umt41VBDQNRmumH0diuuMQTTElCmiXznX8KRL29uHgqCeupfNGej/fX5SCTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D8tIM+q0X+VhXAivd9+zXbst6r5mW2HJuGbPf5j6bpo=;
 b=Ni8kOZUxKGql/8FCRDHsyNKvce5OANYty274Tgrlb/yvkUoeUXLl8rJSSbStBbBRMIGs/Kf3jt4fuQhQyIdtQsr7hTAYsCf+Pd6oRSh5kUCU7+J2tdGpm6Z1RWEo6KlTq6qHaZf7XJKBUEyJG+zxPRc7mixR/fmbnlRG/ayNKjKDkiWvKoBkWfSOdaNqbOnAAryKl+yr7jRbmXKYvaWKpNad0h4ksUbOiq6neokYl01eSeUe+kUk9lo9TcGLyZj1q+104DjNKxM4KHpcGFRNRm7RHQzRUHMhE4d6sH7o8ftSeSPWNKwzWwOmNLKgg04Xn60EeRHqKy3FMEEJX8hIOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D8tIM+q0X+VhXAivd9+zXbst6r5mW2HJuGbPf5j6bpo=;
 b=js0lW3Z+GWnNaru+fffOAa19BPVebbTQoWBTopiwV459yTzJGsuM0ySGVC6yWcrDVCtqcsYXaOpWaTKOjK8L9eT61G6jf3AMpoNh+G6MqsBha1Ux/SwP1XXoUeiwg+/INwEYgKp+cZl4j3tMpb0Yn9xH3GoZLTCRhTvs2O6vNuirgvYvb9ZNePQO0RyH3rBggRCzeKe2pPRoL8xdqczH7tGMxfJ8jFLKyEn/T0KrA43m9tsj9LXUn6KDs1k/0M5Vymx0WPzIGR5sFvUR1c1bZPrCQJ75kfoMqpy7ZAiTOjAkx25xOP8dWcBVaRLgBUhEnhvIykwJHUFRl6BEzclkPg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <ad02161e-b03a-626a-9472-c07edeb93108@suse.com>
Date: Thu, 11 Aug 2022 08:43:07 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 11/11] x86emul: AVX512-FP16 testing
Content-Language: en-US
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
Cc: Wei Liu <wl@xen.org>, Roger Pau Monne <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <9ba3aaa7-56ce-b051-f1c4-874276e493e1@suse.com>
 <a64d46c5-53ca-299e-a7f7-7f66f6ae871f@suse.com>
 <ec0c4bf4-b3d4-8921-a369-3798c5d36168@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <ec0c4bf4-b3d4-8921-a369-3798c5d36168@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0047.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::10) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 89dc04ee-71bf-4d69-5439-08da7b64c43f
X-MS-TrafficTypeDiagnostic: HE1PR04MB3049:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	URizOy2IOnJpf2J3ySYtkKjoahWMcA6T+ocQGvIcfFGpO+eaBYBw5Ob3tC5+1raTvtPa3nfL3DlD/O3VpNDtW3eDdBFT+6gcgaLcgSNtzcWyx+7hYZq8hQ1l1OYLticuShMS46Ve0rk9eGcN4nBLHXuNtonpF/h8R3HO1NEwVGvzj1yjo84HmLrjdZ0vkLhJSJ5UK0C5XzA0IxodnICfeikFMrpD1SUt/PNk5u/yxTrzFNaef6+I/ysLGfTlIufHnzWOSIiLtQKPToxPdt/QUb84Eg83b4OB5YUvYq3AsMhEGHjZAr3DYi4KGMCAprp9yDwi3YL+FiltPokEC7hDGhV0O3qvUvKvIVpg5TkXvbg90TdryJZTptw7x2BrDEIpixo5pSEStyNSZ/Wy38zymLqm9XNxxp2e6i7Zz15LGhjMX9qg9WfyccoGvSGl42MFH8Wav/qhxx3GWnV66ml14fcvv3UfVLBzMnEU1JSfoeGihlqgaRHAl0RoVyTEapbopZo5zQyoVAHx5mqMLCCdJcjEHcdlcAY3EjSOb1xbw+DqFp71hOq2jEqLoX9j4DLkFRTVIMm4bz1H1qaiJpbCJUtNUea6TUGZPDz/MSgUuUaTgmyT2pAcFaDfxPUUl3wvk7dBbDMNm31f5W4udgnlQ1JpgXe2YblRWwQNuvI7Fpgwu7mhVP+YzqKAHG+iCmCjLoFqtLE0Bgc0pMgZ3k0QToWmheqVdAHkuDvorZmhN+F3FE8rtsTRAE4CD170eQXtA7RjfXwXaFb0RWx5P5oJR7I2zHY4Cb9G/LcIwOUTwuzIOLZvkdpcfl9gtP9DArcJhs3agUmnmB4Onehd5RpK2g==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(346002)(136003)(376002)(39860400002)(396003)(366004)(86362001)(31696002)(31686004)(38100700002)(36756003)(6666004)(41300700001)(53546011)(26005)(6506007)(186003)(6512007)(2616005)(6916009)(54906003)(316002)(2906002)(83380400001)(6486002)(5660300002)(8676002)(66476007)(4326008)(66556008)(8936002)(478600001)(66946007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NlVEbzZ0cFNRZHEySmJTQllaSVp5QytmbDBTRHJUQUNVMXp4Y0JaUEZiSGt4?=
 =?utf-8?B?TEZBMkJ5dHVRRTFJRGFTSWdPdE1lQTd6L0tkS1JBMWtjaDFzK3NFSjZlKzVp?=
 =?utf-8?B?aXpNNHAxTStrdFlVL3czbVpjRXlTOXpmb2xYVHkxbDN6RWd6TURheHVyNC9M?=
 =?utf-8?B?MzljRlMvaDFjQ0E2bGJBNlB1N0F5OGgzNnJCNmVaRXRaRnBZN2lJbEJGWTFJ?=
 =?utf-8?B?V2NDbnNXMkU4QWFCZWhVOGp0MDBZRENEWmpURmlISmVBSTl5UWx3aFg0NlJ5?=
 =?utf-8?B?eUhlUVJBNzQzTllwL3BpTTlRdkJEZ0ZsWXpoZGY4ckw3U0w5RGlwYm5Ed1JZ?=
 =?utf-8?B?M1lyVmpIRVB1T3BjcW5Yelo0K2ZRNHFhc1dQQzFoSXlwbzRkdkFXQnVLU2Yv?=
 =?utf-8?B?ZVRaamUrMHA3VDNzTGsvam5IZXZYVVh6TlZRUnY0WERIQjNsV3VvU05PR3E2?=
 =?utf-8?B?RGVLRXJpTExmY1pMeEgvRzB0S3NoMjZNUjJHSUVPalQxMEd0Tzh4bVFQOThw?=
 =?utf-8?B?ekFJbnBXMlZSUmNHMDFMa29XaXhFUUxNNFprWDFFMnRtOHd0bFVBaVVMaFkv?=
 =?utf-8?B?WGZnOFpZQ0VrSVp1Nzh0NW5ITXFJZ2V6V3ZTblpYUEJ0YlRoYzRMd3pQSGpM?=
 =?utf-8?B?K1hOaUVDNTJEOU1QK1lNL1l6OFM5U1pVSTkwNktNS1JLSWhYN3JSSXdOdjRU?=
 =?utf-8?B?ejRNbWdYZVcrWThZWnFUaWk4bmFRZmtmVFpKdUlqcWFhUXIybjJWdHl5U09B?=
 =?utf-8?B?NFVPdEM5Wm1pS3BiWTE0TExCRU1qK1dDYllVQzFQbW44UXd1eTRQMVIxTy83?=
 =?utf-8?B?ZHYzVjRyc3REZnhEbjNtU0gxeE85amhqVlRwb0Ura1YrbFYrakI4c1dScDEr?=
 =?utf-8?B?RHlVYnlPSlVaQVp3VE4xZ2NOdVpNZ1NNeHlJOUlBZWV2SHBBM1dEbWFZSmhP?=
 =?utf-8?B?aVpFdkx1aTNRTXBiU0w4RFY2TWtTYTJFWXBiRlZ1bFc5alVoZGVNbmZSNkVU?=
 =?utf-8?B?OXBEbnBpLzFDb3RZbWEzRGVCR21jUWNYNnFvdkZXSzdLcFY1NGdZaVZkV2d0?=
 =?utf-8?B?bWFWL3ZlUXJ1aXFreFZubnIzblB1RkQ4YUYvU2YxZmt3NDFOeUhKWmhRbEkz?=
 =?utf-8?B?VDFlLzkyQTZXdEk4UXdtRm9mZWtYMmhZQmIvT0VTQUFVZko2YlZEWEozeG9E?=
 =?utf-8?B?T0NuUmdoRTljZXRPQTROSmJ3QnpYZVYreU90Nm44cjN1UjJrQ3V2YmFMZmxo?=
 =?utf-8?B?UklHRkhBd2ZGbktqRDJxOVZZNnl2TGFkRXozeE93cUNYUHduMFFCTXcrWUNO?=
 =?utf-8?B?VWlXb05WOHd3Vm5ENFU1d1VSdGpoc1hnY2VaWEllb2lzYzA3ZjJNU1ltdnBU?=
 =?utf-8?B?bnIvZUFXQ1hNQ0loaGkvK0U4c2dDNlU0S21Ja1JvSXlHN3FXYVNnRkNmSVdF?=
 =?utf-8?B?aC9tT3l5L0p0cUlhNmkzMC9kMk5YZXdTWWNNekl5aU9HVDZuNlozMjF1QlJY?=
 =?utf-8?B?VVk3Mm5WcEFvbXZob2twbW1jNGdPR1cwZmZTdDZYbllyVng1bUt2dW51bE5x?=
 =?utf-8?B?NjFpaTlUZE92dVVsVXdGMW93OS8zemxDVGhhR0ttUWRIekZ3a0pnQ05xM2Ji?=
 =?utf-8?B?cmdFVk1GVXlxcGZEL3AyM2lMRmlIVnNCWngwTkdwMzlUSGFSR3NHb2FmWklG?=
 =?utf-8?B?TjhZd3pmMllwYTFwOFpzcGEyRDFIWlJTOGxvOUFESDgyamtJSTl4V29YVVR3?=
 =?utf-8?B?SWs3N2tFUlhJeWNTOXFlQjJ2aWJtcUJZWldBb1BTN0ZFcXFnczkrWFowMHBS?=
 =?utf-8?B?Y0YzYjV4NjZheXFCaCtxTzdLRlZkcXB4dFNrSFgrWDk4MWRXKzI5OVYwQXpu?=
 =?utf-8?B?cXhaOEZvSmd5QzlXNkdFWnJTVWJLZzk2U1hPZEV0Q2pMS1RSQ0NRWDdsWll0?=
 =?utf-8?B?U0ZjWmhEL3l2RGhZL3Z0Qy9yODRKOTNDcmJoRkltcjlIWXhzOUd0MXhlSGIy?=
 =?utf-8?B?dGE0anNubTRkUVg0K2RiaTM1UWN4SjgrNE9YNVNiNVA1dUZVVjJTOFEzQjNz?=
 =?utf-8?B?ak1VQ1JBRUdhY2gwblFxUDFodm4vekRHL0N3aVpReGMwSklyUi8zR2tCcmdU?=
 =?utf-8?Q?t3fW/tjnY9eV4+RQWd4tGItst?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 89dc04ee-71bf-4d69-5439-08da7b64c43f
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2022 06:43:14.6870
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7B9eQ7GXRcs+Se821OU8CIkGzla1PdMGc6tZvy1oTFXhPLiGFLVLyxMu/TErZCHIT8rqmE6SMxIN6Gtl+wWInA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR04MB3049

On 10.08.2022 21:14, Andrew Cooper wrote:
> On 15/06/2022 11:32, Jan Beulich wrote:
>> --- a/xen/include/public/arch-x86/cpufeatureset.h
>> +++ b/xen/include/public/arch-x86/cpufeatureset.h
>> @@ -281,7 +281,7 @@ XEN_CPUFEATURE(TSX_FORCE_ABORT, 9*32+13)
>>  XEN_CPUFEATURE(SERIALIZE,     9*32+14) /*A  SERIALIZE insn */
>>  XEN_CPUFEATURE(TSXLDTRK,      9*32+16) /*a  TSX load tracking suspend/resume insns */
>>  XEN_CPUFEATURE(CET_IBT,       9*32+20) /*   CET - Indirect Branch Tracking */
>> -XEN_CPUFEATURE(AVX512_FP16,   9*32+23) /*   AVX512 FP16 instructions */
>> +XEN_CPUFEATURE(AVX512_FP16,   9*32+23) /*A  AVX512 FP16 instructions */
> 
> This ought to be 'a' rather than 'A' until someone's actually run the
> series on a SPR system.

Hmm, merely running the series there wouldn't mean much, as the code
doesn't usually come into play. My justification for going straight to
A was, as expressed in the description, that the new tests all pass on
SDE. Otherwise I think you're putting the bar too high for ever going
from a to A for such extensions where no new state is introduced, as
imo this would then mean proving that every single insn was actually
tested when taken through emulation.

> Otherwise, Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

Thanks (also for the other ones), but I'll wait with applying this one
until we've settled on the above.

Jan

