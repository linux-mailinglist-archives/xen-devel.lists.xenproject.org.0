Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 78C475FD878
	for <lists+xen-devel@lfdr.de>; Thu, 13 Oct 2022 13:36:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.421885.667575 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oiwVu-0007zT-Eg; Thu, 13 Oct 2022 11:36:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 421885.667575; Thu, 13 Oct 2022 11:36:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oiwVu-0007wB-AM; Thu, 13 Oct 2022 11:36:34 +0000
Received: by outflank-mailman (input) for mailman id 421885;
 Thu, 13 Oct 2022 11:36:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=a0LZ=2O=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oiwVs-0007w1-Bu
 for xen-devel@lists.xenproject.org; Thu, 13 Oct 2022 11:36:32 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-eopbgr00067.outbound.protection.outlook.com [40.107.0.67])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4837676e-4aeb-11ed-91b4-6bf2151ebd3b;
 Thu, 13 Oct 2022 13:36:31 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS4PR04MB9482.eurprd04.prod.outlook.com (2603:10a6:20b:4eb::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5709.15; Thu, 13 Oct
 2022 11:36:30 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2459:15ae:e6cb:218a]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2459:15ae:e6cb:218a%7]) with mapi id 15.20.5723.026; Thu, 13 Oct 2022
 11:36:30 +0000
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
X-Inumbo-ID: 4837676e-4aeb-11ed-91b4-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=buq4+Ld87xb4VrYEiR9MZoYbdBfmyWsAfjW/lpI5Eh6GWef18ED740FG/a4oF6yw2TYWULRrV4+sjNzqKJ/RPxW5MsN4w93RIC++61SkPm5gLdjCqcETzIjnY1p5MfwpDAaDjIrpYJxjuACo4Q6/zTBln6rnNAS9UfI4rtCYJ8QxyLLb6rBnmmVdwtwjtvfPU5OvGXlwRe8d+e15YIe9X1gxkqDEvrv/lp9dDC5JK3aG8JRsOUDJp8EX1jxCQ5qb7rYGknIYc+DWWQfHqXGIdmuGc2j9hpegY7nYg9jB+CpauHqVjQHdbYaZArVa2JuB6KHzo6lNg/xTPH04YitvLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xrD0a6zLarfr8oL8gPj36xX2OAP6I10+pUdEw4s25CI=;
 b=n8PwcME+MBX+EGJURBzh7ThGlDs9fT877V6m4Uk0co55Vp/HsT3nIoR4xvhSuKpMs3n6f/7P6N+IG8S4zI8TwipQSHPYgsCICnm4f9yoU0upJM/O0zWeBIQrIB9K+oWU3Y6huoznLW5NtyJBEWDqgfgyo8djcHbc9x45Bt7A+k8R9CWBaHUm8FGWZbJuQp0Rl2wzRWufz7zFday/8K2AddAqEDJoZJZAuqHTSOE5w1/4Neowl1bkmEWp2S6RDP6Y44NT2jG03jR3XkXFQK6yifNvEZTpdVVR5X2l8SrET64QH8xCMpFO0V6Ydp0KN6YxYKhK/Lw8G52nKfkX48uDAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xrD0a6zLarfr8oL8gPj36xX2OAP6I10+pUdEw4s25CI=;
 b=VOxCK/yvI8taNxfTHXscNU/dUZpo1FeNkaF7eDmF+CBjLywuIdrVHd2GJH5jZYhk0ZISDJqGiJWODxwgCW+K4Wu9SzE19MIvBGyxYtOIN2zg3KOPZF1+dBoGPQ7oFF8MntzRjOQ37kBgyuL0qJAeZ4lw3WiL5n2Vh7WVtX7VofiUy2nCGU0tP+W8Gyubyn1kjCK9BMVMrQRaAvkkx5+O3TEUYhzxsDpgtvURDGE4b7WjrJYdDpO3sAWx08b3CUWDEcA/sdc/rFdQPOYFubLtfpgvZKt+p2soekuSh/iA+rnQKZ2TeNU6iQl0KL+1hrvigVB1Kovz9yf4RGCQy3/NTg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <05c4def0-321e-c864-7d92-b4dfe110d030@suse.com>
Date: Thu, 13 Oct 2022 13:36:28 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: [PATCH] xen/arm: p2m: Populate pages for GICv2 mapping in
 arch_domain_create()
Content-Language: en-US
To: Henry Wang <Henry.Wang@arm.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Julien Grall <julien@xen.org>
References: <20221013083818.36209-1-Henry.Wang@arm.com>
 <c1020b65-491f-e1c5-3ef3-7edb99e0435c@xen.org>
 <AS8PR08MB7991F3222D1C616AEF9C771092259@AS8PR08MB7991.eurprd08.prod.outlook.com>
 <2c2b3e8f-34fc-1ef2-c086-233964e29e43@xen.org>
 <03419318-275a-1f9d-6e00-1a3489659f22@suse.com>
 <AS8PR08MB79917792FD8A7695C969020992259@AS8PR08MB7991.eurprd08.prod.outlook.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <AS8PR08MB79917792FD8A7695C969020992259@AS8PR08MB7991.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0123.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:97::9) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS4PR04MB9482:EE_
X-MS-Office365-Filtering-Correlation-Id: 694c6554-e4b0-4baa-1af6-08daad0f2be6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	wTuHGFFLSpugxk9qy5N8hqt0/U9ykDWZAR8TpHnqxzU2P1HCTByeeeNstCNEkT8lIGKnO2CtnmCPOIud5sB0MyjGLjbWikz5hXVg4o2Gjdzr+bKbFdb4wsmlqBfnBgNzDW6UAooYyJNTsfbcV0ysU6LkfSFPiCg0CyYat8fnn9Ewd8T6ny+mWnv5tfoWYSgag8kPiJg+7v3dJfxoghXF9llnZ5tM+YMciGLnc3EItbwvZLkkSqoj+YUHAh+itGc/LGIgIw+krcnfC1CPnU2DCEayTpuYbYjrEKmvA+BmnYzXvcEyseFp4zCFdgyDKKmmmvoiz/zjYuye6srIyMzzWJ+9A0W+ZREc6WFtEBJ7LAKfoVkvq348MIwPf66/XVC4hWe6ghjB4sR8eMYTE6LUjtxEvOhjaSVRSnYH5LwbpbTwK8S87flatQkGqjEPVxbLq0eGFCIqNjVvoec53UbgpCS3jpdJLvXcPuxqLDXEQeUf0t4RN/dNXUk3e3eXiXBrD/dXUSMc+BXiVTNxnObCVqotfQPZ5Alvinon8e+ZpP0/l0cYjpzl2lUUU4KtCv33dU/hDFr1psGdUnw+I5TMngssunkCeaO36NIshv8kmKEbcgmcRFjQcaN1IfIlnqIYtza8J41aDp1ynhKkW/tUzbWzYNnhJmexwreRVaL9qJT6RY/FVrIy64di/jFmwRCOzX1rv46hJGJxzRSdcvsI86dgBURBg7Twy1JR2b5GzyS1WPy/OMSFpzvgnNDQfd2iJRT3/l5s1Cn7dEUkTPSjmiQO2tpR1CUxPBnIGAFJ1Aw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(396003)(39860400002)(346002)(376002)(366004)(136003)(451199015)(186003)(36756003)(2906002)(66476007)(316002)(66556008)(38100700002)(66946007)(8676002)(5660300002)(41300700001)(8936002)(31696002)(86362001)(83380400001)(478600001)(6486002)(6506007)(4326008)(53546011)(2616005)(54906003)(6916009)(31686004)(6512007)(26005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?THk4amdwUGFIcEJybkVGY3ZIWFhwUzBqQ2kvbzN6dHNkTzRrcktMNGx4TC9I?=
 =?utf-8?B?Rk9KQmFRR3l1Y1NZQm9DN2prU1Z2czI3dTRjc3NmeDF6QW16WTAvYS9CN29j?=
 =?utf-8?B?OXVjV3FlaE94M0FyZW5Kamx2aktQY25xbGRTRXZBOXRmbk13aG15MzVoL2FY?=
 =?utf-8?B?dHVPaXFTZ2tyU1EyOHBhTVlGN3M4Ulk1M2JNRFVISnRhZG1OUUxWblZFSTdP?=
 =?utf-8?B?ZEtPaUZKMm1UOXZiaERPTzl4eStrOUEzemg2dXE1MUVoWjkwK1lRUi9vbjFP?=
 =?utf-8?B?bFF2VTlHYVNsa3FmSng3bVphajlZcVBGTU55eHNmWmxKWTliRXZScFUvN09I?=
 =?utf-8?B?TlBLL0F6V2ROVmkwbnhuY0JwTGt6dytTWmVBMWhPNUJBTm84aU5hWC93UE5H?=
 =?utf-8?B?N09LUVRzWk5iUHNVSWQ3ZXd0MGNZUkpwRmpCY0pFSE03WDRTbytNQzZUQUFl?=
 =?utf-8?B?OHJJc2VEUFdyWEMraGlkS0VxODhBN2hPYlgyM1lMY0hNWUlNQzRtODdKRXlI?=
 =?utf-8?B?aTBWK3ZIb1dVbUxkNHF4NEVJRmRoMWZxdittellWU1RSMWphdVhEU1A3aVdz?=
 =?utf-8?B?a2ZONy9TY2tDWWt5M3NrTW5yMkd0akNxRG5jTFpNeDVYUE02UW5RaWx2RXFr?=
 =?utf-8?B?SG9YQkdESUlCUmQ3VTMySnE2SkR3LzhyMXZnRTdqODVWRHZ6c2lNclVZcndG?=
 =?utf-8?B?YWNnRmUyd1ZQZzNsUnY5V3dqb2grN1FpNmlUQ1Myek9xU0lFenFQd3o3Y3hj?=
 =?utf-8?B?TzFacWJ2UGg4ZVVNM2VpTEtHYlBhbUJjVG4wNUZxOWxXdjFTNTR1RnFhZnJw?=
 =?utf-8?B?UVRLZEpUN2c0MEw3MTlQbHFDM1d1VUJRdHdyemYvR2paNmU4d1Y4NGluZGxM?=
 =?utf-8?B?WkNyc3pFanFNVDRHOTZ4d3EyM1ArZWt3NVF5WFEvMWU0S0JlbnRSRkFoNkwr?=
 =?utf-8?B?L09sT1FwY3BwdGc1Q0Nxd1VOdmdIRmtHY3Q4SWk1dUtzZ2xMN1pnMGVUQ01L?=
 =?utf-8?B?YjFTcUd5RjRMRFllc1NhMUlTQjZNNU9tZUJJMzFxa3ViZUM2Kzg0YXU3Z2hX?=
 =?utf-8?B?TmYvMm1Hd1NNK2hzYkVmQ00rYTJaRDFPWHhGYnp1d2JUeGNUUTBtQTlOeGsr?=
 =?utf-8?B?bHZxQXZTNDVGcEY3TC9BYWlxazZZZXF3UUZCd0ZXRzVEeDJYdHpFUEpYREp3?=
 =?utf-8?B?SHZ6TmpSVG5va3BuY09aN2gxeW16SjcwaHdONVZlTngrN2FEcXNUcFlPOE83?=
 =?utf-8?B?Wmp4NVBGZXlzMjQ0Y3VtWFFqMDAwWk1KTldOQjJTZ0dZRUJ6NEpNUTNETkFX?=
 =?utf-8?B?ZTZZc3dhSWhTazRwVzVNOXVXY01adHFkUXhFSXUvNm1mUGlXSk1PUEI5aW14?=
 =?utf-8?B?SGh6THlMVGIxbTBVOFFtSVB2djR2N3N3d3B4N2NzdU8rVjJ0MktzY3MwbFFv?=
 =?utf-8?B?THBQNTNkMnVOblhhMmZmR2Y5Y2xJMTluMTNuT0xQR1EwTEY4dmhIRmNhVnF5?=
 =?utf-8?B?d3dCT0JxaUsyVEV0eVNaVWVnUFRDTEtwR20vRE0rdGVRVFVGLzA0b29LdXdJ?=
 =?utf-8?B?NjNNOCtnQlA0OXlobGxTTWtHT2VNRytvS3p0WHhSUXpINjNEM1BNSGs2N2M0?=
 =?utf-8?B?THFQaVdvcElPbmwzdVA3MWVpbm1LWXhYazQxMm1jSTJBWE1oamkzblNYcjNK?=
 =?utf-8?B?N0VFUVE0WGdLbCtYck9vWFhWMmJOYUU4aXkrNnd2WFVpU1RpV0lnN001UTg2?=
 =?utf-8?B?TllOb1dJdFRyK2Q1TmtIRzBlZmFKZVVZUGlDdmZYbk4xZlN6dG1pZ3VpazZZ?=
 =?utf-8?B?Smw2Snp0dDhrUHB0dVFtcE4rOSt6ZEZENDlkWVArcVJTbHkxRmtWZE1CZ296?=
 =?utf-8?B?c3UyQzNBTEZCVkRaTHBsSmRnTjJ0eDh0WkxpWU1HdWIzUzlKNlBkN2Z2blVa?=
 =?utf-8?B?ZG9wdXpLRFFrQTZxaFFNcnBJQVZtaTJZdCtEV0F6T1MzbXpuOWcySnRna05n?=
 =?utf-8?B?cCthcjlLeExGQVRoNkV6YzF4MlE2SDNZOU9iNjNQdnJzZkx6UkFHTHJMOC9R?=
 =?utf-8?B?U1RCbFpESDNIKzkvRkFWK1FRczFrSG9CMVlIRUZ2ZzIvcktUY09scXRGTUpO?=
 =?utf-8?Q?7AxRvGRW+bki0EYNFboBIptcQ?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 694c6554-e4b0-4baa-1af6-08daad0f2be6
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2022 11:36:30.0055
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r61dZluwNeCPeaDSYkPujBiEExQh02dJv44RVXoU1q9USBCMlGMas6i7cFI2yMZlINtsE0lcsukzQiFbfDXA9w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9482

On 13.10.2022 13:05, Henry Wang wrote:
>> -----Original Message-----
>> From: Jan Beulich <jbeulich@suse.com>
>> Subject: Re: [PATCH] xen/arm: p2m: Populate pages for GICv2 mapping in
>> arch_domain_create()
>>
>> On 13.10.2022 12:58, Julien Grall wrote:
>>> On 13/10/2022 10:21, Henry Wang wrote:
>>>>> -----Original Message-----
>>>>> From: Julien Grall <julien@xen.org>
>>>>> Subject: Re: [PATCH] xen/arm: p2m: Populate pages for GICv2 mapping
>> in
>>>>> arch_domain_create()
>>>>>
>>>>> On 13/10/2022 09:38, Henry Wang wrote:
>>>>>> Hardware using GICv2 needs to create a P2M mapping of 8KB GICv2
>> area
>>>>>> when the domain is created. Considering the worst case of page tables
>>>>>
>>>>> Can you describe in the commit message what is the worst case scenario?
>>>>
>>>> The two pages will be consecutive but not necessarily in the same L3 page
>>>> table so the worst case is 4 + 2, is that correct?
>>>
>>> So I agree that the worse case is 6. But I don't understand what you
>>> mean by '4 + 2' here.
>>
>> Assuming you have 4 (N) page table levels, isn't it 7 (1 + 2 * (N - 1))?
>> Or is the root table not taken from the p2m pool?
> 
> Correct, on arm the root is not taken from the pool.

Isn't that a (perhaps just minor) mistake?

Jan

