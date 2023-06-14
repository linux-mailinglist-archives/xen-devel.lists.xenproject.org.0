Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CD1B72FF00
	for <lists+xen-devel@lfdr.de>; Wed, 14 Jun 2023 14:47:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.548736.856844 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9PuI-0006h2-FR; Wed, 14 Jun 2023 12:47:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 548736.856844; Wed, 14 Jun 2023 12:47:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9PuI-0006eO-CF; Wed, 14 Jun 2023 12:47:26 +0000
Received: by outflank-mailman (input) for mailman id 548736;
 Wed, 14 Jun 2023 12:47:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dIEj=CC=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1q9PuG-0006eI-HM
 for xen-devel@lists.xenproject.org; Wed, 14 Jun 2023 12:47:24 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2085.outbound.protection.outlook.com [40.107.7.85])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9b83d99e-0ab1-11ee-b232-6b7b168915f2;
 Wed, 14 Jun 2023 14:47:23 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM9PR04MB8146.eurprd04.prod.outlook.com (2603:10a6:20b:3b5::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6477.29; Wed, 14 Jun
 2023 12:46:54 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6455.039; Wed, 14 Jun 2023
 12:46:54 +0000
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
X-Inumbo-ID: 9b83d99e-0ab1-11ee-b232-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iZUNLUYvtbwX7bZSVjzj0t7hrOx55jQCDC/7d40afAuCkeNNctjWtVYkDp9K3ZNLXkc83I5wGSq/UFomS1VIzbBCPsDp9Oi6a7ghnMCk7lEiM+gPDLZ2pRXjOcDGOjlyt0M3tgLiZ6Wu9jFtAJOia9M4w/+5tyfud6iWWXmTGv8++THEJTkRHinb5fVBo2E0wFTfsVL/h/DWz3bk9DMX96AOBLJvNePDke6BJi608WyxXqKJ/t3EiwjpdPjRqAGNW4mH1Hv+Tuj/v2Od3RFRn7xEzN8zOK8EdLSdtOFlVHS2bNQpCRBeEw4ywF5oPPah9euXIJXFj2dOAylSLwxZHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OrzAVWHRC5m9R6tb1kW8qaFEfUZgMQ5RkPOtRv08TgE=;
 b=EftlSnMkAMG07Mzk6MTb+s4yPbAnmwNpGYn0w7/TgbsoWKCKU9jlSdpqe6RK6FbmliN5Kiulpu4I6G3XeBwHGhLpY9XmdXj+oYPm0xwnyzteOFcdCqGzxZ/rPm4xucWaHz1P9yzZtWZQDYF8olgAuExn0av5RJZGt6AnAScAEs7foMCJqmGnfPTXqfkRYu+FWlV/WWQZ/UG2HVBPeJOvcU2MKADD/IQ3lRPLBVcKzNffyXlK2k7b7mdY6vGstpayzwmm9t0+yWhXyp7WBfgucs2tQ60U0T9psmhGFUAxSTcFxYuKwe6J6uuegEmYIUfOAJl+f8fcdIl/Jh9VbNT0SA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OrzAVWHRC5m9R6tb1kW8qaFEfUZgMQ5RkPOtRv08TgE=;
 b=Agm8lZylfzoHpOrwiVXHQMKdSjYDfAONudi/b0Tbsbcn6j/n6BHUnSoQiqHKeAcqNkcY2pO9dnea1wXotl6FjujKszfZH4WY+zX8ibeBSQ1JSJNGFWalUTnEoZ+Q3IqWjnkwlacWUM9ZJqWsNxVhgx0tUOEp0HNeDUBWfE7pzht8173JG0P0f3BpkFPysaYpZj7Tak+PXnSmdIMSii2OP3CueoNLErrP48tEj0HDwLeeyoFNmXJ8o8zb3bpRpYF51sHSJ5WukxKwt7G/Ng+44JisNe90VU+6rEEhY0siQG2debq6BxAqsNUnFoFIjDLtDKCAfrRVGxpwhVtiRF0f0w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <20512f99-a993-443f-6e1f-377c474469d5@suse.com>
Date: Wed, 14 Jun 2023 14:46:52 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v1 3/8] xen/riscv: introduce reset_stack() function
Content-Language: en-US
To: Oleksii <oleksii.kurochko@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>, xen-devel@lists.xenproject.org
References: <cover.1686080337.git.oleksii.kurochko@gmail.com>
 <c01a0c54edcf5ca46a7b2069740d7a81eb6f2330.1686080337.git.oleksii.kurochko@gmail.com>
 <92fab0b8-647a-b9c1-d15b-1217a4420715@suse.com>
 <f2e81cee460b419146d53a5e7ba0b507a8b0e724.camel@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <f2e81cee460b419146d53a5e7ba0b507a8b0e724.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0059.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4b::21) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM9PR04MB8146:EE_
X-MS-Office365-Filtering-Correlation-Id: e1e4da84-2cfd-44a6-51da-08db6cd56e79
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Pa0Oo1aXwabDeyuxEu/aKL2VRGNWtGNA0to4R5Pw99vAFM9lz95ulKJcG1waaaCNz2y6T5tg4u4LeVkOH66VBebRDyvpqdzDONYZpfnumRz8eqR9ciklbC4SI69/kLAosX/1MtsGjwPE9sFPZoZyrB8hxpnXgV6dX2oJBxaW6MFZBSghaogIwPy9YFIYKIFc9lK/4BPR3KtF4Lt23e1EReMMXGRkx2+gtxCfcMXCVJUWS4UFEpKyBj9QRwOlSywRPkbqra68OkwbinRIZkHclv1h5ON/gzQUZzA5c8MSy62pGeGDCZ4PsUxxLLivpixGcuYZrJV1vX30O3jdFmfsibQXM12m+6BtsYqdUGM9aPe1tkVERF6HtwHK94OqAWVaGiipInw0JleaBQnp1p/dKktD2nsS3lkFGgw/ZH2BgMJLPmOttJ8l/Vkwnw4Z2MMe5zQAcYEmqxMyBfYizLH4cTrqrQD6TN9Z7RGtkVFuoWpNYkRuwqJaDDT0e4lTrAC/nHvF75wshyIA6zNZD2qXvZosKmzDcABMDnzUOcW8+bKBQ6JmVZS6wsiIkPy2XdrrhmRJBgw/Bm2CgnvEjk94dp7azwzI1YD6QQMnJYeXbenOu84CDcSV8jKITarqPTDqK7FINLc6keNR5KBZfmfTDw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(376002)(136003)(346002)(366004)(396003)(451199021)(6486002)(86362001)(36756003)(2616005)(31696002)(38100700002)(6512007)(6506007)(26005)(53546011)(186003)(2906002)(54906003)(6916009)(316002)(4326008)(41300700001)(31686004)(66476007)(5660300002)(478600001)(66556008)(66946007)(8676002)(8936002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VG1FTjJ1M1hFUHZTcHFPZEJCaU1Lenc0NTZXQ0VrV1Y1M29oN1FPSk0xSjhY?=
 =?utf-8?B?SC9OeUVvZFd2K0FEM0ZuY2FUcTh4emV5aVcwZ1ZvSFExNk45dUo2MFh1NlZ6?=
 =?utf-8?B?cngyaFpWR0ltY0JLR2trNEUvOTNzZUQrMVRMMVh3RnhaRHY1V2p3ZGdMOTI0?=
 =?utf-8?B?ejFXNFFWSTVxdS94anRwRE9yVmthUjZCTERDajVjZVUxdzFkT1luMGYxaVpV?=
 =?utf-8?B?eElUeDZCNGM4NFd4a0dPQUZBQ0gwUTJPNTVrM21aaUNGYTFUZ1BNek0yajZr?=
 =?utf-8?B?ZEdEV09rYWQ5NC9hUHlka2tlbUJEV2FPOWtxRzEyaXA2UU5URGlXVXhDdzN1?=
 =?utf-8?B?eTB3RE5BcGdPZ3lnenV2QlpmVC9iY3g2VGdxemttWTdxN3N3N3hoRjNqaitu?=
 =?utf-8?B?dEhvSWdTZklkeUhWNWlkeWNBa3FRUDNaWDZRYkdOR0piMHVUcFBEN1RoNkp4?=
 =?utf-8?B?WGptOXlQeFRnMjRJMXplYkVvekUwVDJUZnBvaTQ2aG5vSkFoSis5TVNmWkJJ?=
 =?utf-8?B?T2J6aXluM0EvcHk3WVFIWnFxYUFpRzl4alQyWGE2R1gwMVM0RVRoWmRVcy9N?=
 =?utf-8?B?KzN2d1IwSW56dGYremlhd1VxNHlqSHlrZTNnYy9UQ2FPYUNzZlI0ZEVaek5o?=
 =?utf-8?B?RDRMcmpYei9QWVBFOU1Td09FRmZmaC9la1dpNjllWndLM0pxakhORmRodmtm?=
 =?utf-8?B?TUxwVzd5ckdrcE95UUNNQkNnYUUvSC95NGdHZm1xNDRIeUhTWVNMeExSc2xm?=
 =?utf-8?B?cVBUaE5raWpFaitjcTUvQ2djR2VnUWp0bVYvTkFsUDVHRVBiK2d1eGkwRmpV?=
 =?utf-8?B?Z3JQdWFnTllsUzljUkJCRHo3ZjU5WWJlY2w0WHgrejY1V04xWll0VmMvV2Mv?=
 =?utf-8?B?bDc0NDhBSEdPdlBWZGRtMThUQjZ3ZEcwamNIUmo2NzRKSWQ4TisyMlVGWTVo?=
 =?utf-8?B?bndWU2owdEFEYjF6VW1uajdBRmdHNUppYTJTQ21PVTZPaHpsc2pIeUhUOEow?=
 =?utf-8?B?WGxFMUFLYmJ4d3ByMVZ0YUtiUGptZytwaEMzNXVRUnNqZkhHYlVlazByQnRh?=
 =?utf-8?B?MzJrSlErVStUa21EVE5pQnFKRVdhQTF3UWpERXdLYmp0QWtwNHZ4OGFMMURK?=
 =?utf-8?B?TGxUd2FPODFzblZLZlgvTW00eHNBQnpqWWgyZ1cvNmM3Vy9CUVY2djBuNkRK?=
 =?utf-8?B?WFh6UXNOUmhkOVYyQXhPZ1NuQ0MzYW1EV1h0TGNwWmhQOHpQN0ZhWjIvZHVV?=
 =?utf-8?B?Mkd2RXBuRHl4RG5nTFR2NTk5NldzWXM0dVdJRkViVHVSMTZpQ3liTG1lQmg2?=
 =?utf-8?B?VmZFeTdFOGFhZmlZS0U1LzltYk5PSlowTXJjTk0xdGt6UVRkU09WemlpZWZw?=
 =?utf-8?B?c3VQTjk2YTA2WHZaTWZ3R3Ewa3d5QkNsUnp4ZGY1V0xjZ25lNllMSkV1L1NU?=
 =?utf-8?B?TDNtYXBwV0o3aWJTTkpJM1htSmd2ei8vNndkVGYzR2JlWWh1aHJYQWlUU2pu?=
 =?utf-8?B?ZWVhZEpoNUZoeHZmZU1vVU5zVFJ6aW9FcS9RM1NHVElvV2dmcHN1bHYyYmF3?=
 =?utf-8?B?c0JRcVN3YWVoOFNGQk51MjdCbng4MFFaTktGcWtkYTM5NVlXRWxpYWNXM0xr?=
 =?utf-8?B?WWxFTE9KQnhtM1Z1dWFkK1J3ZmNNZmFja2h6dTdHNndvK2dmK3lUSmtpVzF6?=
 =?utf-8?B?N3FJbEl0aTE2UVUra25hNHFrcjc5aGJjdTQyaG45eXFYYUNBVTlmdG1aeDB1?=
 =?utf-8?B?d1pDdzJvSU8xOHkxS1IvTGRNeStXNUZ4M1ZsM3RNYkdIeTlVcXZUTEhCV1Iw?=
 =?utf-8?B?Q2NTM0R5b3ZMRG4xenJiOFZkYWJrS2VtMkd1RE5EZDVibHJDa1NKa0ZYVEhy?=
 =?utf-8?B?TEg0MGpDRjFvTzJabmpEcW5tZS9IR1lBR1kxYXZqZ3pPeGpRdFlLY2J4dStQ?=
 =?utf-8?B?Q1V4amF6NksrK1ZuWnZSZSthdks5eTJMQnJGQnhzWlpUUXdWdFJ4djhjcHZI?=
 =?utf-8?B?OGswKzRhY1pmWU9VYTZ0cEhIbmpZeGdxZFZ1ZExsTXhscTJlZ1FzTXNkWEtC?=
 =?utf-8?B?blVXWnNhZmJJZEIwOVd6WWVaSktiOG9YRGJ3bVdoZnBEQmZHbmVZWXhoSXRs?=
 =?utf-8?Q?evLOuEdF62cHEtotVG6Q/Poeu?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e1e4da84-2cfd-44a6-51da-08db6cd56e79
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jun 2023 12:46:54.1540
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FvbAb0u114MLxDyIlzXaVXUByCH63gyWlJCifEf1rGAa+XtcWSdH3/sTWS17GvQ/g2olYJHibWXDNF9yyJCiSQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8146

On 14.06.2023 14:19, Oleksii wrote:
> On Mon, 2023-06-12 at 09:12 +0200, Jan Beulich wrote:
>> On 06.06.2023 21:55, Oleksii Kurochko wrote:
>>> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>>
>> This wants addressing the "Why?" aspect in the description. Is the
>> present
>> code wrong in some perhaps subtle way? Are you meaning to re-use the
>> code?
>> If so, in which way (which is relevant to determine whether the new
>> function may actually continue to live in .text.header)?
>>
> As I mentioned in previous e-mail there is no such requirement for
> reset_stack() function to live in .text.header.
> 
> I think such requirement exists only for _start() function as we would
> like to see it at the start of image as a bootloader jumps to it and it
> is expected to be the first instructions.
> 
> Even though I don't see any issue for reset_stack() to live in
> .text.header section, should it be moved to .text section? If yes, I
> would appreciate hearing why it would be better.

Because of the simple principle of special sections better only holding
what really needs to be there.

Jan

