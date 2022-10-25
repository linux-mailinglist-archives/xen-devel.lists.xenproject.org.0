Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C30560CFC0
	for <lists+xen-devel@lfdr.de>; Tue, 25 Oct 2022 16:59:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.429908.681244 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1onLOY-0000PZ-Q5; Tue, 25 Oct 2022 14:59:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 429908.681244; Tue, 25 Oct 2022 14:59:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1onLOY-0000N2-Ms; Tue, 25 Oct 2022 14:59:10 +0000
Received: by outflank-mailman (input) for mailman id 429908;
 Tue, 25 Oct 2022 14:59:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xqZt=22=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1onLOW-0000Mw-W3
 for xen-devel@lists.xenproject.org; Tue, 25 Oct 2022 14:59:09 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2064.outbound.protection.outlook.com [40.107.20.64])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 931a5d61-5475-11ed-91b5-6bf2151ebd3b;
 Tue, 25 Oct 2022 16:59:07 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by VI1PR04MB6911.eurprd04.prod.outlook.com (2603:10a6:803:12e::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.21; Tue, 25 Oct
 2022 14:59:06 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5746.021; Tue, 25 Oct 2022
 14:59:06 +0000
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
X-Inumbo-ID: 931a5d61-5475-11ed-91b5-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JMqMtOJn/vr7+2TSLI9tFz5eAK6PaNaMvV3vsmdww8K0SH75BahPwpVotlo2/7ltH69RLZJ3O4taZ+Co3kD17BmWDN6ZDXqm5yruPgeJnP/esVo3ofD+h/ndl53swVZaAPhccOaylnTNL8cR36dr0wVTLEdu6UhQvnmi7Y3qvYAAtUAWHjCndG6FHyBsb6pDW4JeeqIILmjDdGCvqf6fUMRaUNMC97fNNi9NaxXI2kqcyHZ/yWNUkOsgrL3cFwNRghMz0ecJJimp3yxASOynR4BldQ2ujpNLAAuCkmwR97JXvHjIwHxSWPa1vgxkAh23+2rWmgtGopHYUrMiTdKgYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m1wrWbC+Caq4MiSWmFjLRvB0Npf8O/zMP009kIqYEJw=;
 b=Shw5Oc+bDOWgUS1/zjqqSvO7zGZ8Dz/ZHyQ7OwhllHvyzwuO/SP/mOqCxuiYZhfGtkGiQeFX0oefsRyY7cml68WpJKfWVUtSszrEhmFxQZPODNT9WAp6IUvkb+jeBDhjJH0p92qayzU9mez99NnPHAR2PrE4JVi+Tk+NPsbbmK922G+hs5H4aWfTq+emuek2REYhuTpGkUCJddDiL9tx7jYWpF3XxWvekdot2k7l/JKLUsg2PsI7nIo+Nc8iP2DQ9RsweMcwOXNVFAJy3QNCdkZJDWPTHi4f68po+QNAs1DDM9koHtDmJFeLot+63jwtEr5ckaQTzHQ8QA2OepxkbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m1wrWbC+Caq4MiSWmFjLRvB0Npf8O/zMP009kIqYEJw=;
 b=jgWJm3VjxVmZvySiQYA8JlFQfvbBxmN65x8kyIy8waLrxSmfsOxdnPbXY3sSI0NHF9KwKO1rvYGRuKDnxlr2IcmHLCjDQTcX6KprFLmQ/yruv3c1fSr/GaQxVB2g+GP3dCES2HSt6olz5WDHlc2zIxcZ+4Qt9kiWNwnD7yc3IQyS/4uiBdXM521T2nf6hbIwM+ePcttQhUIqucVxxREIdgbG2UlhKWti8Tc3n0pHtZo7b9n4SbisMqlXoJfapCV6oKZglKc3L5CI2Ud9/nNR0mwE+f+j54EuPvKtCq13TVlZJTnKGLnW7zpLsSN99V+0UZV1wiBJ5CR+gMpM41RpwA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <fa87250d-8bfb-c915-daf5-baf8c91188ce@suse.com>
Date: Tue, 25 Oct 2022 16:59:04 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH for-4.17 v2 2/5] vpci/msix: remove from table list on
 detach
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Henry.Wang@arm.com, xen-devel@lists.xenproject.org
References: <20221025144418.66800-1-roger.pau@citrix.com>
 <20221025144418.66800-3-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20221025144418.66800-3-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0172.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a0::10) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|VI1PR04MB6911:EE_
X-MS-Office365-Filtering-Correlation-Id: da7bd407-2848-49a5-e766-08dab6997671
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	F8TqqS04xTQQPkp6cMoH+joUMlXw8w9t+ia1TKOosV+KjTB6MNSZcfKM4A6dkMzGRP0+QwSXGH+ghLiGYcvCw9wR1Zj/hX7xXnHN81eKeWg7VBgpw+rtLqD3qo653SKJMiydL+IUxC9un9V6S2O5wPzubUCBiwPK9kfmebq9wps3VK9YLWLn1FZtT96Yi7YkrxYWhZLV7fsLBJ93cOTeBEwTyPhCFNQE9OhMgR6XHmVnVuvLRsXLTJ9b5Ut0bwB45xo3L+okXJeh/kaT6Q5Qr1wU06q1O61+amK1d4lNMHbFQuJIdpR/T1xlayoty/oXYfgdbrJj0hm2omqhuKjLaOpVg6yhBfqHcCsH+3rOaDluqT6Fx82RIjPbGbm13Z8OScQOQ60ndZNqbw/KgHkOTTIGdlK85LBLbipFGl5gRTHOlbaeWAmApRhDBpgC7+SYp1JwO7sPt0BArQm/0Di9h3qumKWSpI9NZhUZZB+S+H2u8EwUpJUU2ChLlp8jvi5pyGAY7ZmK6+7XK2mYwxmWNZPtN1L1cv/7xb8irnOo+uqoPOxlgz0NyBzLhuETcbop7V0fRcftkUDEOzf8+mijOb8AdGKCOTxy++AXtUxO2mgNX8AGiPGd3lAhMPgaashxk00YN7B/EtX8OBWrVPqLVw8UpZgHX3XD5gl56CeKayxuOM/qdhgYJCf9OFINuLAJkjsYjGj3+Wx4AD91AafLru/pZ28ePOnFvndZFP+ioKZ6VE0ZlE0wsUTiWZkIXU5Z0MWIz9v2pHEttgClCoR9kngG/DZ2MCwHaU2KJmOkAx8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(396003)(366004)(376002)(136003)(39860400002)(346002)(451199015)(83380400001)(31696002)(86362001)(4326008)(41300700001)(8676002)(6486002)(478600001)(5660300002)(6512007)(8936002)(38100700002)(4744005)(316002)(26005)(66946007)(6506007)(6916009)(66556008)(66476007)(53546011)(186003)(2616005)(2906002)(31686004)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZjVjdGplRXlVWkFhNzIzT00zbzgybmgrWWg2LzdyeEtadk5JcEZzaTlXWnBH?=
 =?utf-8?B?ME5TVVd1UlhSbmdxNUJSSXBQWVdzV2xNY1BUUGd2THdFdkFLZFFiN28wcEtV?=
 =?utf-8?B?YUZOendMbmdHeE1ub3gvL3VNODRRUVNIcEptL0IvY215b3NOLzRCL1puZmZh?=
 =?utf-8?B?RkN5OEQrVXRuVUhsQlc0Y0xyb2xWeWUwenBCV3doSkh6NkpkVzJZRXFiekpT?=
 =?utf-8?B?dGNkODRQdGRHWjRmWHpITHh3VFFLUGF2RGVSMVFDeUlLVG43blptdXJvYXdL?=
 =?utf-8?B?ZXZWVm1nSDh6dmdUKytoRGdkd0c5emZSMVp5TE5WVXJjV2VxclVrZDc0MWpi?=
 =?utf-8?B?UW1ocGVFS0ROaGdOTzNpa3FlSEdHNENHRTd4UXY0MklnVnJIN1l4L2VGYzdT?=
 =?utf-8?B?TE0yYTBHZXVYVzhJUVFTM0xFMWYyWmlOZXZ6QjhTQUVzMW9PSlNZUTZSWEoy?=
 =?utf-8?B?R20yU0lIZUVqbThQSnRrbjBWVzcvdTB3N09qcHVJZkpaajdmdWlaWVdJWm83?=
 =?utf-8?B?QjNxYjl5WE9zbWh6NUxnaE5rd1d1cEJvTnZRdXY3S1c1UStHTG5yVXU3Uy9R?=
 =?utf-8?B?d0RnbStHOGI4eXd4dDVrU05JaVBzd0pvRFJFOTRDVTF5WHhra0FYRENTbHk5?=
 =?utf-8?B?TGpSOFNjR1FwbjlhNld1M3ZIOWlCOHhtUTJpdmRNRjRWUHFXYXlEUEErMm93?=
 =?utf-8?B?R1prbzNiV09mSW5vQi9Jd0JIMU9NRlFXejJXNlEvTk9yOHN3b3dtaERKaUFs?=
 =?utf-8?B?c0FqeERqU25HR3VyNXBBbllBTHBRNTRwUmYxbW92bXdlWWcyNnBneSs5K242?=
 =?utf-8?B?TVN5ZUgrN1Y5RnhxZ1ZIU3EwdmNLUkJCUlB0RTgrZHc0cHFqRmNkR1BndmlB?=
 =?utf-8?B?UFp2aURJcG8zQi9IWXFzYXhvZmM2R3FRSzBINUZIbnRiSHEwU0hlNVJvTytr?=
 =?utf-8?B?R1BkZnBoQzFVeENtTjJYcjRnL3pPZnBndzR1ZW9DSnU2bG5DVmNvZnUzdVEw?=
 =?utf-8?B?TGlKbzRLMENlN3EvekpnSm5jeGhyZG1CKzMyQkVVYzdpMWFENGtrTjEzVjdn?=
 =?utf-8?B?Y0l6SC9ya2ljUUFMNkkvVUdRS2RkOFRqYnpLN0tSOWJZNW9XNUR1MENNNEcr?=
 =?utf-8?B?TTNWdm13NU12Q3hyZTV1Y3p1bVdDWVliZ0J4T0liQUtDdlpPZnVxS3ViTGJn?=
 =?utf-8?B?QUVJL3ZDTUMrVkNpMTMzQjRzYlUrb2RZa1NEbTZVZnBTR0V1anZtcDN2Vlgv?=
 =?utf-8?B?eElZaFdwRU0xSnJab3JrZGduSGdLb1FTaFFrRFQrY3h1Rk1vdUhUckdmeVNT?=
 =?utf-8?B?N3lqTWxIYzFBdk4wQUYzamhseHhIcDcxMlVlLzBHRElxV0dWbmgvSDA5RGkz?=
 =?utf-8?B?MHJwZ2ZEQXhDeWRJb1RhdEhiWThwK2FUNXRDMG9QZ2xQOStBY3RIUWRmWTgx?=
 =?utf-8?B?eElPakFYRmVUZVk0Z20wLzk1OXBWYjZhaXNKSlRmbk9NQmFDM0ZoM2J5Yk5j?=
 =?utf-8?B?bWhXQjlnbFQ5Ny9IbHhLc2pQVDIwU2xXK2crVGd4Kzg1NzIwVTUvbHlTTlAw?=
 =?utf-8?B?V3VwaDdUNHlpSFJmTXlLdjdoUDYrNVo2U3IvOWtyTGJjTWxsZTlrQTJTajI5?=
 =?utf-8?B?VDdvdmdMKzVRUzFhTlFZUU05WFZ4ZlZUVXF0VUczTWYxNGdFTHR3b3BVT1BR?=
 =?utf-8?B?TmJkQmlVeFk0MkQzUHU5VU1JdXBNMG1FMk9QTG5CRUk1UDNteVhOVXRLSGxm?=
 =?utf-8?B?MkV3dmoyQWVwUkNXYThQSUN6OWlCbEU4VGx3dUh2T1NzSVdkb0tiQnNFNDNS?=
 =?utf-8?B?WVYzK3czdjhpb21JWFNESlM1eDdDVXR2cUZaTXZrdWpNeE1iY01RRVJObzZu?=
 =?utf-8?B?c3JBR2NKNjl0cjl3YmhKVVdlanR0Zm5UcnNQVTBzc1BibVFCUE8zekpqN3B6?=
 =?utf-8?B?by82ZVA5Q0hwc3FxUnU2cTR5emhBVjg1VDhwelJNVXd0MElPTXJJL1Jub01U?=
 =?utf-8?B?bnE5NWtOVUpxbE13eVhrR25LbW5MVTNjajB3cHNDQlk2R2ZUSEpWK1QwZ09L?=
 =?utf-8?B?ZHltOWJRM0ZaKzlRSW5SS2NLellyRzQrOUlTK2FtT1hOQS82bjJwZU94K0cv?=
 =?utf-8?Q?SAzAguF7xxKEjTe3X+LGZwqkv?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: da7bd407-2848-49a5-e766-08dab6997671
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2022 14:59:06.1649
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZxgT4KnwKagKZES39eun9jguMthLKbPfx0HNBOq/5iFe5FkcA+JtjtpAA2exueTq32h2J3K9ht89zLsPODUerQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6911

On 25.10.2022 16:44, Roger Pau Monne wrote:
> Teardown of MSIX vPCI related data doesn't currently remove the MSIX
> device data from the list of MSIX tables handled by the domain,
> leading to a use-after-free of the data in the msix structure.
> 
> Remove the structure from the list before freeing in order to solve
> it.
> 
> Reported-by: Jan Beulich <jbeulich@suse.com>
> Fixes: d6281be9d0 ('vpci/msix: add MSI-X handlers')
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>



