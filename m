Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CBA685A13B3
	for <lists+xen-devel@lfdr.de>; Thu, 25 Aug 2022 16:35:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.393456.632422 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oRDwZ-0006OQ-3x; Thu, 25 Aug 2022 14:34:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 393456.632422; Thu, 25 Aug 2022 14:34:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oRDwZ-0006LG-0R; Thu, 25 Aug 2022 14:34:51 +0000
Received: by outflank-mailman (input) for mailman id 393456;
 Thu, 25 Aug 2022 14:34:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2f78=Y5=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oRDwX-0006L8-K7
 for xen-devel@lists.xenproject.org; Thu, 25 Aug 2022 14:34:49 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2089.outbound.protection.outlook.com [40.107.21.89])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 098a1744-2483-11ed-9250-1f966e50362f;
 Thu, 25 Aug 2022 16:34:34 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM0PR04MB7188.eurprd04.prod.outlook.com (2603:10a6:208:192::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.15; Thu, 25 Aug
 2022 14:34:46 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad%4]) with mapi id 15.20.5566.015; Thu, 25 Aug 2022
 14:34:45 +0000
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
X-Inumbo-ID: 098a1744-2483-11ed-9250-1f966e50362f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W/Ujo5F0SJ7rfyfW1dzj/F04AN3+NanzscAcneB0XWGoQt6xy6sNEyDZoS2RyTKvRImyoHPUDkNMfVGNUYLPb41xuseyoG8J00umXCLzCR+7VBlVLJ+z65E0hB9GVH3gvI2PEYOXtp3twGbou7GHW+rDjlMZzrIyTjM4dZXdeQnH4g2y9hzsSkBQ/arrqVtklvUPKneyB/hhoJzGeq/vwpJXuVpZwl++ZsmNFCJr4pq+lbMcK1DKxNqdI5rT+C2BU54LI3FhVU5vkbbBRON5dISAGt+gplEuW23MkuWLanfSpFAObfzjkazdgTQmmcqrHIJm34l4AHffWNFJDYAS8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WTa2VvAIxWdy0E5BCcQlqrQpKNAMUNm6p8bVe8gBT5s=;
 b=iOfnyXhqfnzMD77gHOA7+YwkIN8gqpJsn7GueBxpyaPgvydSQ03grk8AjWjrKbDO6NHB+QvkvE2Ex4MpoS38s3pe9M68FFTDq8XAp4JcloRZbqtpckVX3fvo8qpG9wtiwvx57ctmUf7VCu4zAphpT2LeYsTMxwNsJDK5/v1iGQ98cHf2EvMLGK2n5GwR5vJKG1LJfNNaZJtg8TVHHH2idg2yUi171DiVT0GIoJ0uBdWnw72sO6NE0MKg3nSIhoKBKEk9UCnSC1aVr8pQ/YtWprbvmjBMj6GxP/1xQEQTcTlimIz8XrWfbFx+XKlu5ixdO0sbnin2Zp+Xr9WjN2XnOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WTa2VvAIxWdy0E5BCcQlqrQpKNAMUNm6p8bVe8gBT5s=;
 b=XHowSKIAmVzMBqCjpCood9wanPm4VW9dm6N5T5iYKrLORNZUG98FCgq+QdBr2MSDjxfEpBO96AdBPrX0v9aJ7fffaunB5aOknDYyADLhnFEeX/qvEzYPEhuBmkjLbQ7RuLHsaLpXE5pQQ+OKAAcsjrn5406H+2ENX+N+JCGUtoxywcSdoLYQcEgCOvBcIlWQ9PugYkiJIkAEuJGn6bDGgHyBBnWSJdkCwvLr7VhQ7D4+zuvuN4CLUVxeVdj19OOBstNsVdnCrhsBRdsxpLfVf2ftlD4P0wgdWgzKaJADez0BHwrECPUlin8+/4aA62hltglm4YMAJH+KpTO9qnT3OQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <4919c645-1724-e6af-1db9-33a3214a24f7@suse.com>
Date: Thu, 25 Aug 2022 16:34:43 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v2] Arm32: correct string.h functions for "int" ->
 "unsigned char" conversion
Content-Language: en-US
To: Julien Grall <julien@xen.org>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>
References: <8e5df72f-2ed8-3bec-18ff-3da228ab9ee0@suse.com>
 <031ce9f6-ede4-f371-da04-ff8c2df209dc@suse.com>
 <43F406AE-988F-4429-B8CB-F47DBD599B43@arm.com>
 <6c14c923-0ab1-5a07-0e3b-4df2956d7ec4@xen.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <6c14c923-0ab1-5a07-0e3b-4df2956d7ec4@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0088.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1e::8) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 15e9da68-3317-4a27-8a0c-08da86a6f4d0
X-MS-TrafficTypeDiagnostic: AM0PR04MB7188:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	2zuiJ2vMMSutC6Y4/jEZOA7fyFFKxyp/A4eeGHMl+X+/gZUpOFdAirlJhIuunLuaPwKQShoO8kR/Uy+HUMX1RthjTpvCf3B+oCTQRkw+n5eq3psQh0mpc7LpsCgaeU12AmiQTEJZ7UlkhxMZ8iZNBjz0nDndE9CDxQ+NNZlfqC3dnwFwUAvG4Z3lfa4pdioW446JKrjKEurUfrpw3k8+uFgcXTfO3Q7pChjJg+OBkjaTUQgOutyTvaj1juCwW3KrlE9f8X34B6eniQg81RU2klXVOFuZFbTxLFnc8qevjiYmYPNlICVQDuAUXDEEtl/VNsQShMGV5k4zZzq5SVJwPtVvMiOCCI48sWgtujftQNbiYjey853zhNbJv87SluHxPgjdbHrbAhwNb4+h8RfYVmA8dR73zH+9yG3KgDRNT3cyikVbZY10HHqRQjQrgp1sp0VlfgP/tIgArMDHuEiDJdlMH7ZCtl4A2EoJsNFv/eV9HtCwR36nh9Uesggms8cBam761EqGQ7XVgxerbaX+ezePZDkZEDGPMnCJXlOu9cgiMu8ODX6I+C4zBynKSJPrFvrpukAu5suBxw6R6syaF5XsHZak+/IK2R6VTzMlZxqmWTHR6EWrA5DieY3Sya73Aets1O8kbQHc5yHz4ArMZQub3chFXqbFsgfTucrdQGUnrJzwxmyplpQ5OVJhzaVCELU4qgCEEiLONRCiFilBiyJ7vpTY2VjEyATHUm96qVxGt1yhilN/oda6toi0icYP3ZkLuyUPxbPlNVGbR5DgXl5FkK0vutwjRAjHeb7fMQM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(366004)(136003)(39860400002)(396003)(376002)(346002)(54906003)(6916009)(316002)(31696002)(86362001)(6486002)(478600001)(186003)(2616005)(6506007)(38100700002)(41300700001)(53546011)(66946007)(6512007)(4326008)(4744005)(8676002)(26005)(5660300002)(66556008)(2906002)(31686004)(8936002)(66476007)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MnBuQ2M5ZTFENWh2NmhzVitoM3NNcU11dlpiZEJHNHlPQXBqbVJkOG1Db1py?=
 =?utf-8?B?bzhQcmtaMmJYand0SkZ5aVdmMnZhK0dlUzcwajhXUDZqMWVUcXUrUUtSOVRy?=
 =?utf-8?B?bHNXcldKNXkwOG1CYlNRMlhVMXJKOC9mU3BtSzBvMlBVU1pFdDVwTUMvdzg1?=
 =?utf-8?B?b3pQSjdUeGF3d0xyRW5wajM4amllTURjeUJCVXpJbXZwbXVmSHpuRkR4U25p?=
 =?utf-8?B?OGgrOGNSU3dEZFlHa204L1hPREN6cDFqVTlDdFdjYnNkVzBaNlpxQUpEQ2JI?=
 =?utf-8?B?TTcveEJGTGNocGcvY2tLaU01SHVPSVArQ0kxOEZpMklvK1pYWmRHcEtWU3B0?=
 =?utf-8?B?Mmg1Y2hVeGIxWm1xSmEvTDgwSkNCU1ZwNW9VbzBwQ3diUEJWSnFqUFJKaTFu?=
 =?utf-8?B?bGdYcFE5VVBsL1pFNEF0R3pVT0F2dHlQNW42M1RhSDhpWlYzdjd0NE9SQWl3?=
 =?utf-8?B?a2VsanA4aFp0cXVyTGV5OTRlbGtGdDJiYytTYzNDN25mdGRldEZ0SDV4RGlh?=
 =?utf-8?B?VStyWlU0eFYxSkpmRHh4bXdxK0VicGVGVG82b2F0RVd6Q0FQTEFjMjNTWHdQ?=
 =?utf-8?B?NERIVUR4dmZhTnl3YlNtc2podFVreFhMOGZwK21TSXVJb0svSUFIajl0blUr?=
 =?utf-8?B?czJqSmdrczkwemN2Tkh6b005VkZ5c201TWQ1aDdGZnJUV3RaWHZMVnM3VDNp?=
 =?utf-8?B?VC9SdEhMMjBVSG55S2FOa3V2VlBOdG1iODBXSjN5YlNjVkJ1cnB1eFhDQUZQ?=
 =?utf-8?B?OVB3S01veVBaR2EwQ1VIcUNhRHZnUys5NXdOWktCZ0VaUUtJMlVnU2dEVlV3?=
 =?utf-8?B?OEQ3cGc5Rkd3ay9wbXRHNVcvcHdRbGtTR2pPWVZvNXhmN0FSelNYMkh1SlZj?=
 =?utf-8?B?NjZvdjRuUFY0d1hVVlVmY0M5dHA2NzNHV3lJc1FSQjJoRGNlV29qdTYwVjdk?=
 =?utf-8?B?anNmNTV5TG1kUVhwODlIN0ZQb0Z2MzBEVUV1TndLdXpReVBJMDVZRTZ0YTc5?=
 =?utf-8?B?c2h1MldTWCtieTJNckMvZGxtTER3bHAxekZXbWhrd2srSGNPaGlGOXF5a2s0?=
 =?utf-8?B?ZXAvbitUVjAraUxXOU9TWUpJNU81Nkk5RXZDb0Y2b2lkai9UWk9BdWptWEZt?=
 =?utf-8?B?end2VEl1WkJ3anlVVHhsanllSXFrd3RSWEtIVTBaVlNnN2hSWmRQc3RGb0Jy?=
 =?utf-8?B?SVlwdlZjM2xvVEFFVldMZWZvTE9JODFlMDZmQ1E1NGkwZ2hOeTYyNzNTZ3Bi?=
 =?utf-8?B?NjRwVjcyUEVoVjZvUDhkZ01HK0F6NmNUOS9ZRllidzdYVjhybzJmR1Q5QU9K?=
 =?utf-8?B?TWd5RXk3YTlSQndKM0hsdVpzdEg5emxBLytiRnlNZStkN2ZDa2VTL29JY1Rt?=
 =?utf-8?B?VyswWGJ1NXQxVE9oTXhMT3dOUUJNdG96NWhZdnpUOG9DQTF2d05XS2k5dkVR?=
 =?utf-8?B?VXZENFNuRlRTVWphdkZ3QzJEM0FpVE9KdkJSTjNPZThmRWIvWTlNT1laOHYx?=
 =?utf-8?B?ZEJRQklBM3FqcGczdXZTOEJRTWZ5eHZoVUF1NXFieVBYZlRKQWtTZm41bUhB?=
 =?utf-8?B?L3hHOWNTdERycnY0b21XRlFOTjJnVGtFQ2xhWkRqQ0VLeE11dUY2bWtVeVM2?=
 =?utf-8?B?c21mQW1jMlZXZ2hHbWN0K1lqYVQ1K0cvdFlFbDE3bnFkTmQrcmVRZ0N3Z3k5?=
 =?utf-8?B?cHl5T1MrTDExOHBoRG5oV2dXTmQrRmxTcjBMWE1yblJXSk9lZElVN2Zza08w?=
 =?utf-8?B?YVZnbk1xeFpiUkJDMGtoVUFFSVB2Rk9PWGJoR2hmV1VYKzNEczdOTXRwMDZD?=
 =?utf-8?B?MWUzVFZoT0l3T0hLOVV1RmZOdmlNZXNxaXJlbFpzUEY3S2t1aEtFeCtUcVFh?=
 =?utf-8?B?OVh0K093Z2ViTS9ZYWZiZjZaUEZ0WnNZcHM5ZXJzdTJmM0R0WktpQmhsSlRD?=
 =?utf-8?B?akZmTmxQWjVHVTBEbjlnNWh5bnJnaW9EeXg1Nnc5UlZqQkxxQU9XR010Rk5B?=
 =?utf-8?B?ZEJaTStuRmxacloxQ21UVDhzWHhGbHIyUlVXZzRZM09PWkxxVEpkZDZRUVp1?=
 =?utf-8?B?SS9vMldHSkpObDZibWh6MVVJSWM4aFJKQ3dzUUhFSS9iTzdrOXJhVHdGRFpJ?=
 =?utf-8?Q?qr1ZRv3quevX3ie3Io3WX8ngR?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 15e9da68-3317-4a27-8a0c-08da86a6f4d0
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2022 14:34:45.8222
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t5nK0g7IbOhkVPsi1LhMKdZWGMYo4YU8fIX6nYpyo4aUs6cLsqjWCvC/Hr8oG924AOPYBgqqEkmsK1F4eGMMKg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB7188

On 25.08.2022 16:31, Julien Grall wrote:
> On 24/08/2022 13:44, Bertrand Marquis wrote:
>>> On 24 Aug 2022, at 13:33, Jan Beulich <jbeulich@suse.com> wrote:
>>>
>>> While Arm64 does so uniformly, for Arm32 only strchr() currently handles
>>> this properly. Add the necessary conversion also to strrchr(), memchr(),
>>> and memset().
>>>
>>> As to the placement in memset(): Putting the new insn at the beginning
>>> of the function is apparently deemed more "obvious". It could be placed
>>> later, as the code reachable without ever making it to the "1" label
>>> only ever does byte stores.
>>>
>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
> 
> It is now committed.

But then perhaps not pushed yet?

Jan

