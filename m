Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A155706C77
	for <lists+xen-devel@lfdr.de>; Wed, 17 May 2023 17:18:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.535958.834042 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pzIua-0006vU-Jv; Wed, 17 May 2023 15:17:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 535958.834042; Wed, 17 May 2023 15:17:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pzIua-0006tM-Fj; Wed, 17 May 2023 15:17:56 +0000
Received: by outflank-mailman (input) for mailman id 535958;
 Wed, 17 May 2023 15:17:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xfpx=BG=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pzIua-0006tC-0W
 for xen-devel@lists.xenproject.org; Wed, 17 May 2023 15:17:56 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01on0604.outbound.protection.outlook.com
 [2a01:111:f400:fe1f::604])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ff5cefe5-f4c5-11ed-b229-6b7b168915f2;
 Wed, 17 May 2023 17:17:55 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by VI1PR04MB6845.eurprd04.prod.outlook.com (2603:10a6:803:138::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.34; Wed, 17 May
 2023 15:17:53 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%4]) with mapi id 15.20.6387.032; Wed, 17 May 2023
 15:17:53 +0000
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
X-Inumbo-ID: ff5cefe5-f4c5-11ed-b229-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dcIrOf+ooEfdESTwCwwqpmuKQxSgHQCJKKExBPzrV8RfyltunEToEs3soVYSY5iDp8OJVwFiYuKT6GZNfbSJL6cXbHZ07cJlXgeNYb3NHV67DhtnDid9ZWL53rE+gU75z83cUyuAMLaH3kbCcKrlSMGpPPTJ1RF3Tqykl8lm7ZQStBkjrCAuA23ietJM/Qs6amqgFLh7ATH5Gv6ClOCP45/We3vhypUJQB3M/P1J/wz7pZ4CYlSPmTtsL7qvAitYhnSnV0Le6e1DuLcuUudWPoEF8c9XMeD05VYMjc5lfpcKb0K1DHvBJd2m4FskTwxsQd30f2ITOnIj7JaA+S1HRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=inmT7/EQj7TNQcmPJ7BoVRu7uucB+XW08xEIj4cEg3U=;
 b=kpZ/Uz0bHfywoYwjK4xjBpgic3VnDoSJAFU4Ww3LaBVjQLeVb9ITg6AQay5tuJgmfLTnLnm6EIuxAreqxu6fJlAPAcT7eFkyeQEJ/oU2vHVosqWbe8B+RAM9u50VMZuzWp0Q3UDRC20CDYIa0xCnP8kwlE2FqoBEZRjf7Tgxe2jWa8XAtun/csWFh79UwhkxSNqb4upaxi+Vt9tQnyahRcoD2u3XZ/D7iuf5p5tn95Baq9DVpEc7cG09BrI1SxJ/m6kDpc3a7KUhOl2siyW99oJ6abVUC9soEyrU42oRcbA/OUaB/Pvr7Th0ZhqIDJs5DTLUDhnXOMVRFZx4bR69ag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=inmT7/EQj7TNQcmPJ7BoVRu7uucB+XW08xEIj4cEg3U=;
 b=hAoiOGfDKgqhVYmBqXnQMdPiHOMzd7x+x4xh15FMUrz5z1RmVENwu2kWw2rOhTRakBeQi/T/Uf5Q3B5b+a1kA2WBqkYHdAnJwtJtdfl++EBFmXxbajzagrovl4AOjrsxenvbRy1how29qxUc0SSPHkWF+miHLy5NWmy/Z4AtbR2ONr7TH129apXk+7rf/JNQlvvMy3GAZuBUVbQqX37Tjg7ZXkc8UPGXCTQqAkvXhjd78hNelph8sFq9royONJwhpUpRdTnEo+J135qLhTm0HdEyMDAxMVIc9qO1YteaKwjX+82v5Ppn2jwu4cgYSR31f2GId3bSOafrgVdmdMCMKA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <93a84fcc-f821-7d7d-7fff-75d10526ac51@suse.com>
Date: Wed, 17 May 2023 17:17:51 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH 0/3] officializing xenstore control/feature-balloon entry
Content-Language: en-US
To: Yann Dirson <yann.dirson@vates.fr>
Cc: xihuan.yang@citrix.com, min.li1@citrix.com, xen-devel@lists.xenproject.org
References: <20230510142011.1120417-1-yann.dirson@vates.fr>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230510142011.1120417-1-yann.dirson@vates.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0143.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:96::17) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|VI1PR04MB6845:EE_
X-MS-Office365-Filtering-Correlation-Id: f081239e-46f3-4c03-cff1-08db56e9e2a3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ZVI0wMD3Gw6ZAlBlcm9K0mH7ndDqgnpt7MlgB7i4CGdHZLwB8s+V5YdvvWWhBe7ZitDQaVLAvQdbZxbpiAB5g6AceNpXyNgkzkE3P6xhqv5CYCCoddnSfRgOT2pC7/Vx6HNeURFn1Os3Ge6uNMBICtC1mwZlKhNr6+WxUya/ZdGnpdtpoC3JcwjdLuvMjzuq+DUrKQm+N/j8aC05TXS+Ophl1AdqKjYO7cUrgxJANn70qokb70B0vYeXi104Wbk0sHi7LjDJyK7RaG2jVbYDTdlqrCNrUACuwy95k+LtqL8F5K5JqC4egLbBo7/xVRWvgHm9AnrUUAlI9Ut2HTMwx8vB/COXuGP+04ORRUp2FyjYBsDx4waNyhVfYPrHrWBw4RUNnes46No66EZk9wHZ+XwMxzyxg+Yd/yOMivWOyX/oBqsc1cn3bWoEkA3aGOyQSA8Pt9H5l9mkf8uuOdY5wkTUzXcPhZdEt/Osa/1moldoJOUyPUlNiIgIEQWQcrI5pjVTP0JJdFJY1HbqylTKojxDDoqkLqdsL/SfZbMmkC8skd2WKyaI3P58dAjeOVqte8WCZVXP0CJLuA0paIcHmOyIn4EwqhW63jIlE0xXm20NoZs64h5MHckbPCH2jl6qdxg2I+/Rfm3HLqAfFM3ecQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(39860400002)(376002)(136003)(346002)(366004)(451199021)(31686004)(2906002)(4744005)(83380400001)(5660300002)(8936002)(8676002)(66946007)(478600001)(66556008)(36756003)(4326008)(6916009)(66476007)(316002)(6486002)(41300700001)(31696002)(2616005)(86362001)(53546011)(186003)(26005)(6506007)(6512007)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WW9HQ2RyZEVBdCs2Qy85eUFnV0gyM2tSL2lVZEVCTVM3Q0hRaDFKckIvaysy?=
 =?utf-8?B?Rlo4dU5JelN2UVV6ZWl2ZnFkSWpLblp3KzJKT0dvRUVoVVc0U0VGUm9Ma1JJ?=
 =?utf-8?B?T0R1Ni8wQUtGYmEyWHVSdUt1UXRtdURXb3BYblBtQWNiQW9YY2V4QVpWbXVZ?=
 =?utf-8?B?SHpCZFg1N0gwcklXQ1RzQlNFZE1HWFhVRDN6Q2xaeHJJbmNWczRxaDlWRTJj?=
 =?utf-8?B?b1l1M053ZVdrRWc3UTlPMGZBdzR0UG5LM3ltYmRnUzFSVEFiMEZpejduNkls?=
 =?utf-8?B?UHFLVk54eXhqdkNyMW9CMC9ReU1YZks2TVZXN3kxTnc1MWlIWGhiYUFhN29o?=
 =?utf-8?B?YmhXaXE0ZnNoMXpqeU5qcnlIV0tiNVMxNEFONW1WS281ZzhpNGdGKzF3SjAx?=
 =?utf-8?B?N25vS3lCTWQxajVuZ3ZKWDhNSXBkeVFRZTFhUHlrUjJWQmI4OGVpSldEMWhv?=
 =?utf-8?B?NHZvZkJ5VEZlelRncGpIVVBjUzhBWjdrTUd1amYxSlRmNEhEWnpGNjNpanpJ?=
 =?utf-8?B?NmFwblVSN3dWa1FCL21HaFZIaEdoSHlQYkxrRlhlMEdYRFhIbGNqRXdVWlVJ?=
 =?utf-8?B?V2pzS3V2aW5GZmhtVy9BUHFRZTdJVlhIU1d1cWNIdEpoTG04ZVZheGJscmlW?=
 =?utf-8?B?SXR4MHdvZXRFd1RIZmdHY3FaaTY4RXZzSmdobUgzOUl5cjJJSnJ5ZFBtdW9M?=
 =?utf-8?B?UkhDNDQwem9oNzRBTUd6ak0rN21Ma3puZnJNWlFNNnJkc0VJbzRmZEkwV3JJ?=
 =?utf-8?B?ck1MQlpINDYyd3VHK1kyMTg4QzEraU1WckMwL2VKMTdLQ00vVjJPUkM1dXRK?=
 =?utf-8?B?OTV3TjU0RDB6T0FFSzZBSEtSaWJoc0NrQStUQWRpU3pFMk1sd1pEVVdkMlo5?=
 =?utf-8?B?YkNwam1IUU04TFowdWcxengxejVTQ245Y2VnNEM0WmVhaGVFcXlDQ2F5a2Z0?=
 =?utf-8?B?SVhvaGtwZ3VWZCtiTForRjJtRWRxVnhSZXNydTFjU25OZkZqYzJ0cUhxeXNE?=
 =?utf-8?B?NGl5R0IxMUFscTZORCtBeXJTdmFGZEQxcVhnZE9RVEdPK24wNHcwUm1mSVdz?=
 =?utf-8?B?anREOXBqakNIc0E2eVNHSUgxYVVrNUtuNForb3A2UExHck5XSUNLc083V1o1?=
 =?utf-8?B?aWNIdlhERkJPZE43a1hxcGNEREtvTmdwMW1lL3BjZ2N5QmpkK2hpdkwwSFA5?=
 =?utf-8?B?K3J6RVc2R090Y2JUaWxsZFoyanVsYnBod0RJakI1cy93T2F2NUhCYUg2bVpj?=
 =?utf-8?B?dDJPa0xNbWx0QVRrZTBOMFp4aUQ5VjAwaUhBVVBmZXdGUXBIUUIwZ2F5NWMr?=
 =?utf-8?B?U3dEcGtpeUlneDUrMWlsN1lsN1REL3pvMzdUR0hiS0R0SmpaR2taZTFhZTlQ?=
 =?utf-8?B?VXJlWWtXOGxqS3J1UmhFZUVwWGducVI0WjBRNFFZOEMyeTBwaHFwQnFiVkNy?=
 =?utf-8?B?OU82citnWFYvQUFkRUlRYzc0SmptYzhCd1N0dkVPTEhBcGhxRENDamxRcmxB?=
 =?utf-8?B?SkwzZG51V3UyOXdpNm5yc3FnT2x4ZGkyc3ZTb20rTDBtMWplMTN0K1h2d1Y5?=
 =?utf-8?B?a1ZUTldCcDU2YXliRTc4WVUvS1U0V1QyUEd5U2xSSjU0eVB1QjJDMlplS1hZ?=
 =?utf-8?B?UjZEa25PdnRnUEV4UHZ6TjNoa3dJV1dwSnBLSjJ5VjJSY1RSUnU2bG1kbVZW?=
 =?utf-8?B?dFlJVFBPSUZNOUFhSjlXenRXUzZQWW9OMko4S2NsM3hMODR3Um5iOG9oMXdD?=
 =?utf-8?B?VGFwMEU2U2MrUVhzK2ZQMDVMYWo4bE1qdytUV1hxcDJLUFpJLzRLcWdoRWVZ?=
 =?utf-8?B?K2xBR0lOcmhJYXkxemdlamVxWjRPUU9IMnlnbTBLTS9UL3l2NE4yQldadWZm?=
 =?utf-8?B?OTV5Z0d6T0VjaEpudi9KSmtjTGROWEVuYWM3ZHE5NHpuWE12eHQweDNoVjRu?=
 =?utf-8?B?TXRJSnA0V0IzaDdsay9HeGRaODQ2MjlYa09WMGx5OEZkN3ZKY2lmelVXVHls?=
 =?utf-8?B?WGZqZTBhUEVrZFcrQ0JQc1RQdlVDeGVIY3FNWlJveXhLWTZIR3JVT0xpTUVm?=
 =?utf-8?B?azBNTVRhcTNaRHl3M3Z3YU9FcTEzcmh4ME1YanJuZEZLK2duaGxzdEhRaDNI?=
 =?utf-8?Q?YoIg9rr5jwd/Jsl7f5mOiqWeX?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f081239e-46f3-4c03-cff1-08db56e9e2a3
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2023 15:17:53.5981
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V1YaMaVEEEnfZQ6qohUv7iQSbBf1U0vkau9vlpOqFI3b+CZq4VNgxpv3NACPI5Sa9oeTAo1Hq6S3v5WcXMWwNw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6845

On 10.05.2023 16:20, Yann Dirson wrote:
> The main topic of this patch series is the ~/control/feature-balloon
> entry used by XAPI, prompted by the report of xe-guest-utilities on
> FreeBSD not being able to report the feature when using just libxl on
> the host.
> 
> First patch is a bit off-topic, but included here because it fixes the
> text from which this feature description was adapted from.
> 
> Yann Dirson (3):
>   docs: fix complex-and-wrong xenstore-path wording
>   docs: document ~/control/feature-balloon
>   libxl: create ~/control/feature-balloon
> 
>  docs/misc/xenstore-paths.pandoc | 16 ++++++++++------
>  tools/libs/light/libxl_create.c |  3 +++
>  2 files changed, 13 insertions(+), 6 deletions(-)

You may want to re-send this series with maintainers properly Cc-ed.
For the docs changes I wouldn't go by get_maintainer.pl, but rather
Cc the xenstore maintainers. (I guess this file ought to be added to
that section, on top of what was recently added there.)

Jan

