Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BF1B7D48AE
	for <lists+xen-devel@lfdr.de>; Tue, 24 Oct 2023 09:36:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.621709.968450 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvBxi-0003RN-9N; Tue, 24 Oct 2023 07:36:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 621709.968450; Tue, 24 Oct 2023 07:36:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvBxi-0003Ph-6F; Tue, 24 Oct 2023 07:36:26 +0000
Received: by outflank-mailman (input) for mailman id 621709;
 Tue, 24 Oct 2023 07:36:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=krZT=GG=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qvBxg-0003Pb-Jh
 for xen-devel@lists.xenproject.org; Tue, 24 Oct 2023 07:36:24 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2075.outbound.protection.outlook.com [40.107.7.75])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 06c751af-7240-11ee-98d5-6d05b1d4d9a1;
 Tue, 24 Oct 2023 09:36:23 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PA4PR04MB9663.eurprd04.prod.outlook.com (2603:10a6:102:261::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.8; Tue, 24 Oct
 2023 07:35:51 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d924:b650:a2ad:7b25]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d924:b650:a2ad:7b25%3]) with mapi id 15.20.6933.011; Tue, 24 Oct 2023
 07:35:50 +0000
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
X-Inumbo-ID: 06c751af-7240-11ee-98d5-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d6d1bokdbWw58oyeqotayRpz1jsidJ5cuNJ4VqywXLaahabsoubKRvq+byJSBUcE3rMPqdCe2GH4VTIPsk+/bUnHfRoVIIiBdovDhbCz+psu41tFkZ5gHwyMmOXncp6Pu0KwDJC9y4b6PrdgDDdMQuFl9mHbWLnGRbE8/7EKpepNiuDAIl/6E2aPL7RkXj+XYvKfcp30OHeEwCIoyUO0EMEvLdY2n5ezLi03LR0ESlNGC+NoWH4vQt3A1PpeeKiY3jB93FaCqyuZ3+8Vdaxh83oltETyWi+AHcdn7ga9QAhFOyrxrBiQwwNYhIobrW71r0BKzZkK8sFR1eLdUn5TyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ot4+hE+7o8ioemUiCX+7THAko9qApKKhlviUlcAuKUg=;
 b=TUfKKuEU/4v2XZQsCrtvehEO6TWvz3eqJDUmUVN09olvyRN72BUYyfmzVY7k0Ad8q7RqoRBIXyCGAezYfc74TDyzAIOkyO4a+xMMa4N1RQlUx6ns45iXG2uwpN7t1sKn2VoZ89oKsocfyG169ss0Fam/fDqBcWRSTsi0Nm8jlyhoME/TC88L4RKfs/7cFXyZl0h6hTIY9NeW0fe4lqEh0FvBHEXezxkq/+IcyetUE+iqPBvwquikBv4c9QUKGdPLqSeaov4JscekMItP95/5Yat95qOaITi5jH3aYo/4LjQDMR5aUKhBJodVBBWe89ayQuGDrmHuAZhtHuaOgn97dA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ot4+hE+7o8ioemUiCX+7THAko9qApKKhlviUlcAuKUg=;
 b=NjlfTM4qUWlaWQcbWL+pvJVi1pt4doeuZlD4tmJ6UEiemx380Rnjc3zdIPk3w3AEY0AgLO+c4h7kIA6Gm2OltsrI8YU4iKMQmhyAHmvWuCoZOoLdvc6zQ5hHnUAIgQqub8fHF9PPo9UGrAyhviV6B7eLutIYylnkh0Uj+ngX1uWniV4p1NF0mqGaaitkoaYallNKDkhU1FsbgYXAMjptPsEwNUTeJmmj813tNoDJ+P0EmRSyhZThiy+si1nfhRPO6Cb+l6aIM9K5O+M+ILTIeqDJvPc5awYcgMqfT3Up7LUaB/HIcKSJ/l9kGvH+u6Id6TL5ZIxmDtrKxGwldCCx5w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <a7cc92b4-64ff-8586-bf04-23ae8fdfb7aa@suse.com>
Date: Tue, 24 Oct 2023 09:35:48 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [XEN PATCH][for-4.19 v4 2/8] x86: add deviations for variables
 only used in asm code
Content-Language: en-US
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 andrew.cooper3@citrix.com, roger.pau@citrix.com, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1698053876.git.nicola.vetrini@bugseng.com>
 <67ec8b468d6048f7f91590b59430df275b2f5870.1698053876.git.nicola.vetrini@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <67ec8b468d6048f7f91590b59430df275b2f5870.1698053876.git.nicola.vetrini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0050.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::19) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PA4PR04MB9663:EE_
X-MS-Office365-Filtering-Correlation-Id: 39624234-a7a2-49a5-f415-08dbd463d8d0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	d6qeKl702jdUIfY1MFkAXxvCn+fEqWmxY5el2QNLRNz9drtaB4TNwuG0S8szycQh2He/LPMilt31QDRdEeyZdBiQnBuEAzmQjPnbjJv6SPRv0eNpdGuzZnnEu4qvnCrBQt0i68fh9in1KXw5kMwN0mk2TujCeIZY+Tqyeu0npj0WY4pwMZC+BlcWUCt/a/ZgWbZNP6ayGNHhqHgZBGImCNRHhQ0ikG74Kh7+9au3D7+xsylyFMDXvxv3OMQh8GPNwSX/gqeHMDs40AwQ7l6pnOYrCA5Cicr/G20biOX8BIHqTflDlU21gWVEJBgmR8XbxXHysAOYYA0Hl4apRo5gfnQEUTI44s5RcjN2muNrVU0Ydl7d6m2pjYlw8lFMLOYeRsHN8rZN5AV1Lop76QN0wnFCVQ1uLajQDbVmuybNnjpNMRsHFRipl9KTCV6Gaa87gfSZQIkVjzX8I56hr6V1TNoAmKb/Kv3ST883a659dpEhrH+HUY3Ko2U9my1BGSMZP8oXcfjbcn80WAZSv04FprZgC0mHP2X8Sc1XZy51wSd1h837u7ccOCsO80IeEMdSEl7fWyOL0D6y2v9uU/fswVkrbQIFqNBP0bhJE7s37wQVdFajYUycFhEcECBIdvJd3r1TqVSu1+U13aemK7U6pw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(39860400002)(366004)(346002)(136003)(396003)(230922051799003)(186009)(64100799003)(1800799009)(451199024)(66899024)(7416002)(6512007)(2616005)(86362001)(478600001)(6486002)(36756003)(8676002)(41300700001)(31696002)(4326008)(8936002)(4744005)(6916009)(66556008)(316002)(66946007)(66476007)(2906002)(26005)(5660300002)(53546011)(31686004)(6506007)(38100700002)(83380400001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cUhteGhkN2dpbHBaL2FLVjhTY0ZhZjZrRnlwVFordmFhVjltWk41YVgrbEl1?=
 =?utf-8?B?RG5YbTg4dlFIcDRRWmczSTFxSVBCTTM2Tmtic2RHZWxRNWJDQ2s3YXAzKy9V?=
 =?utf-8?B?Q1Q2bWhYR2Z0RzRIaGkzL3h0dEs5dk1XNnFzWkNyOWZPcnQ4SWxXcXR2OFpR?=
 =?utf-8?B?NXg5WWljaEV2WXZ3VlRwYW9GRUw0V1E5V05iLzd1Q0U1aWZHdnNUVzZ5MUFz?=
 =?utf-8?B?NmVCNXFZRDE3N0Jrdzc0M2ZGUDNVM0t5VDhiekpkWnZyS0poVm1aTGhMOVc2?=
 =?utf-8?B?RE54c1ZGbnVWUG42TkxHQ3lhcXNSeWQyeXZ0Q0Q0VXh3eUloVW9RYXRnVlRt?=
 =?utf-8?B?T1B2MThrbGZzbktQY3lYQVk3ZUZFVzJCTGlkN0g0WnphZDlTNXUwT2ZmQUw4?=
 =?utf-8?B?SG9Fc1RRcUhVcVlJemZ1QWRCT2UrWEo4VGZkaHJncFN0V2VLOVAyQ1lpRFRl?=
 =?utf-8?B?VytFa3kvUEh4Q2VmMzZRN2N1Um9VclpZYytBUzdmZmZBa2NzTmpBSnR1OTd3?=
 =?utf-8?B?RlR6dzhLNWFqQlFZL0UyNHI3ZzQ3RS90Nm9HRDV5VGpMd1lrd24yd0hnRWRW?=
 =?utf-8?B?K2FBenhtYmxhQ1BOQmh2c2hqYStzQ1lad21IYmhiUGRibjNaMkdwWmsxeXo3?=
 =?utf-8?B?TGtBOXlvc0pHNExHVnpMajZOemE2bUI3MmZMRytKOEt3NTlZVmZXMUVkMFB4?=
 =?utf-8?B?Y2NjOUFWcEUycEpCL25Za0FzSkprM1Rndi9KYnRmTXZubHc4SmFBVTVISmZi?=
 =?utf-8?B?UjhLZGxJclRuRCtaUnc3SUp2UzJuaCswckNReHRKaUFLa3grVWV3ZzV0RitY?=
 =?utf-8?B?eWt6U1VRMHNESEM3ZllVS3Z3WVUxeDhYMXA0TWYrNEFaUUJwWWE0cEZBTWNR?=
 =?utf-8?B?U2p1aXhodjd0SUJZM09hbWJteU5ac1phUFhlTjJhKzdtcHl0YnR2cWpLaXNx?=
 =?utf-8?B?VFJwcVRzN0RKMDR3RVlMWUR3bENXQWtMNW5tOGlsc2trMFREcjMvUnZybnh2?=
 =?utf-8?B?ajdmYVNWU0JYbEx2M1llQUpNM0swRVlmSHhkMHplWHcwdnh5eTVSSzZJODBH?=
 =?utf-8?B?MVNBQVZmZHl3dkZHQVp5WTNFRFhScHZ3WnJzM2lSc1BkM3psenZLVzRhY0tY?=
 =?utf-8?B?RkpPdU1kVS9ZYitRRDVLVXNIa0licnJodnIxSzJKOWROcnZLM3dEN3pLd3hY?=
 =?utf-8?B?c3gvaExscUhtL2NqZmttRCtJdEQrVnBUV2xyeGRHQjV4TmlLc2k5aXA3aDhy?=
 =?utf-8?B?eFlLcWdKSjViZ3hWV3ZBZzd3ajQ3cGNjL1RFWUxDc3NFbndvQ002MFppMTZ5?=
 =?utf-8?B?YWdqSHBGMTRUdi91UHhTbHh2QkdEVGFqN0gyWWJqczNPdXplenoySkxDVGRJ?=
 =?utf-8?B?T3dwYkd6enBicnRuQXR0cTlkRldWOURISExBODJ2SEUxLy9LajdSZzRyQS81?=
 =?utf-8?B?UGw3SzRENG9aRGdZUlFwVlV2TjhiSVUzQjcyc1lDNTNwcXh5N1dROExKZDRO?=
 =?utf-8?B?NHNTUlNIUDM3YU9WdnA3eTRtdHNtU0wzdGZxaGtBYTljU1ZqSkJzNHk4cVN2?=
 =?utf-8?B?Snp5Zm9RNG9RZUtBbHBmK2NVeDM4eTU5ZlhCMVZsRXJSblVmRDFlMUt5eE1I?=
 =?utf-8?B?dmFEZldUdmVhUlhUSjF2VWNJVzZJQlc4TXluTUJiczlBU0tadUNHTGp3UTQ1?=
 =?utf-8?B?L2NhUDU4bkJPOGdKSmRKTVEwSU4xdzZFcnNqMlV0bTlzOGpLUDVOWjA5c2J1?=
 =?utf-8?B?cEk1M0F2aTBYbHpDRUZsMzFDZTVQSndOTDByck1KM3E2UVZpZGxqeERoMTBN?=
 =?utf-8?B?eFRwU3VUWG5RRXZxQndlR3JuaTlsejg3Z01DM2puWXhtbkk0SWxaL1ErQU0y?=
 =?utf-8?B?elZuN0VYQ3dBSm9aeitEOWZBYWw5Y1NTb09MemNSVng2RGxHakhzU3UvNysz?=
 =?utf-8?B?T095RXo3SGtiUzdLZXVQcllOdXJzYjU0a3Z0Q2dZMStTaXluL0ZOSlZjT3hZ?=
 =?utf-8?B?dEtjMkluZEh1QjRzNFFEWUVVeWNoZ0NQTFpSNFlkT2hNTFB4cC9xcE84RUlr?=
 =?utf-8?B?RGI5VFlOZEtxUDRaTjRUZk54RWRDK2RIS3YzYWhaVTVhU21KRlJ4NHVKS09P?=
 =?utf-8?Q?maLvN02dDZ0aXb3kGtPzilR79?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 39624234-a7a2-49a5-f415-08dbd463d8d0
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2023 07:35:50.8804
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0EYnfScFQdzk5MnXdpbZPL1F88ZnL6Qu/lzSOY0YPq8bP0Ji8C03pppDKygJc1fFyMzrlEog/Le0VOUhUfkSmw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9663

On 23.10.2023 11:56, Nicola Vetrini wrote:
> To avoid a violation of MISRA C:2012 Rule 8.4, as permitted
> by docs/misra/rules.rst.
> 
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
> ---
> Changes in v3:
> - Edited commit message
> - Add two new variables

Oh, also: The R-b dates back to v1. Imo any addition invalidates prior
R-b, unless indicated otherwise by the person offering it (which isn't
the case here afaict).

Jan

