Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AA4C476C31
	for <lists+xen-devel@lfdr.de>; Thu, 16 Dec 2021 09:49:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.247766.427249 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mxmRs-0003ir-6C; Thu, 16 Dec 2021 08:49:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 247766.427249; Thu, 16 Dec 2021 08:49:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mxmRs-0003gk-2U; Thu, 16 Dec 2021 08:49:12 +0000
Received: by outflank-mailman (input) for mailman id 247766;
 Thu, 16 Dec 2021 08:49:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VxGf=RB=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mxmRq-0003ge-0O
 for xen-devel@lists.xenproject.org; Thu, 16 Dec 2021 08:49:10 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 08041317-5e4d-11ec-85d3-df6b77346a89;
 Thu, 16 Dec 2021 09:49:08 +0100 (CET)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2058.outbound.protection.outlook.com [104.47.14.58]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-29-5MQUPt5cPTGG2V6SJk8UOw-1; Thu, 16 Dec 2021 09:49:07 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VE1PR04MB6479.eurprd04.prod.outlook.com (2603:10a6:803:11c::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.14; Thu, 16 Dec
 2021 08:49:05 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4778.018; Thu, 16 Dec 2021
 08:49:05 +0000
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
X-Inumbo-ID: 08041317-5e4d-11ec-85d3-df6b77346a89
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1639644548;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OgVqy+ZO4hFO4L3NRgHooX0BNsJdR5eIfqOi4Gc7GL0=;
	b=iLkNjEKy8hZqNcYVd8hC/mSfEc1SRjV+94GYLO3KgLxpSsHOicD2lRSAHpxaTOX9H3v+uo
	PPjy1XlKJ8y8Mrsyxr+1viu1KqQSY93Q/GaoisveiJ3Voa4RyHR3pmLogLlUSC/Xe2Jm4y
	4bZtuE3x5B3togdCD89blJNi4sXIvjI=
X-MC-Unique: 5MQUPt5cPTGG2V6SJk8UOw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MTFF2rCzwXGPx35+1g7plWZveIZnDsqzxvCUh8PbuByhOYrZ31WWdWGedSggyqW4zKWDK5uMnJMzZYH4pviJoFYmglbgdB5QInEIYyVltNlCmsWzYv996jscwVkPbLvjbpP3Vb3HhGUVuchxymhQkdIHTM8FUeFIALH8IAzd+ZPTMH3MkITrmF3h7jB/RnSZyZScu/kt1YlnPiBuepG4FRQnArKcF/y47ZZATyn0fqspBv0tABYsEphyMXmRN2tMNvCRTDkPlMYG4ge2sBYPt7YuoJKsLULzUT8uhxXBxSzhjjL31aYBSaxoU1gbnSlTDvyACGnZqH51HGJSLg1GYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OgVqy+ZO4hFO4L3NRgHooX0BNsJdR5eIfqOi4Gc7GL0=;
 b=FCyQL1+r0idpeBQJj5VN0TS//mVk+HZmPaqvOFFRvJzktuoa2ey/p8kK/P1sXZA+/egWxwUbG/3Gqjc82xqdaXPrmajfPq08OM6EY9B7lwqOlAYTrkj8PkCDptS6dIpWHZsiHmWBRfxL8QgFuaLAc+MLl86/dXMcq1Y9lZIeDswjKEH3CdY4wa4fKJxkaA7+OlnKU4HcPBCFZU4q2+PzdwQKhmRqzEn88kLcBpIH+DR3Lu4ua8tFyqX8JR0BAyS9Ya+JTfiWMfiZ688taDtbZKJxd3SjIfVju22l2swWxtTfjs3hNdxsEJZrGCrjYfB02n+ckPX+3CCWrji/pM+V2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <ae7ba1bc-44cf-9b7f-87e7-f962807ab508@suse.com>
Date: Thu, 16 Dec 2021 09:49:03 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v2 14/18] IOMMU: fold flush-all hook into "flush one"
Content-Language: en-US
To: Oleksandr <olekstysh@gmail.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>,
 Kevin Tian <kevin.tian@intel.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Rahul Singh <Rahul.Singh@arm.com>
References: <957f067b-9fe1-2350-4266-51982f09d3a9@suse.com>
 <e40ee980-9151-101a-1484-b1710aaeafb0@suse.com>
 <d0c860ea-2134-d8dd-9bf8-87cd9c1a9305@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <d0c860ea-2134-d8dd-9bf8-87cd9c1a9305@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM5PR0502CA0005.eurprd05.prod.outlook.com
 (2603:10a6:203:91::15) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 970e747d-209f-4fbf-cf2a-08d9c070ea8c
X-MS-TrafficTypeDiagnostic: VE1PR04MB6479:EE_
X-Microsoft-Antispam-PRVS:
	<VE1PR04MB6479FC1E2B4A18844944C8C7B3779@VE1PR04MB6479.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	LE/bffupFQYvhDJryyIPnPpw2S4Kwss5byB9x2ZAY++Hp6vLnppxeHjsn6v6cEwjpWi41KzRr8U7dngmaJ82/rB9ZNuYoyzFC+RnliAb2BZZAIfGZb9Q802R4/QzJMPqK2N7asHUkyg9+9+7a6pWNhHR9EVOo4f0ZusZLfjRIumoKRgNxhLSnMWjVSMLGWHplCNLTejIN6BgxrX+P3xp6KNlFCCqnMQJ0cdbuZI5mzXzEynL5v63PKCaXj1jtu19YksoVnnO9jUUT7ldNU8+8C58c67ECWoBldmRfbz26yI8b73+DOZ08RDjK/cGmLRVPyE9KSL79ANyODqEz2Pv+wH2lflsAfmNKgazaaRNrkvLoO30AVjWQdlILuH+i2RyM3i6KfLJ3rESaVSGu+vWyF8huckWh0fNr3nr5FSBusJuJF04LuKP+/3xOPdhMrlecjMSniZRyoxgqHnK9Mzv9I8BoPpPY4762NCf75XF56e0nJ+GjtyphBe5j+EiYxcN8CuC7EZxcmp59Guh6ku8CatbULDr3D9B/dnKfiwSAK/dPjFYBOJ5pz2pmygle3zlaPX3ZYXztnlCm3v4WVve6HY+RuIVAnXijLfGgHsRK5xX7aFwi+QITrc29B9yPpeW14C3xrBXcrM+cR35y3IG00AkfDX7zj9MJ7R0ldiKn58Yehc9QNFUDusZlWgER0ZDmHhjmsj2IQJXvmh1oEvWCcFJr5aXblmBEuKEazIoAfDBMkumXM09Un7yCFKQoqlv
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(2906002)(26005)(316002)(54906003)(31696002)(36756003)(86362001)(31686004)(53546011)(6506007)(8936002)(7416002)(508600001)(5660300002)(66946007)(6486002)(8676002)(66556008)(6916009)(186003)(2616005)(4744005)(4326008)(6512007)(38100700002)(66476007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cWd3ZWN5TDM0MHJiYkQ4T1RaZCtrZnFKMTh1aitaclhFT1NLK2x0VEVBVkJH?=
 =?utf-8?B?WWdhVWlTMitRekc1OTJQbU5DQ2RZRHlYRjRYNndYK1NZK3U3RUdCdGRzdllS?=
 =?utf-8?B?VFhLWi9YWkNWYTdybmtDSDBEaUljKzhEbTdlNVBzMmhaeWdFZURCSHZadVU1?=
 =?utf-8?B?NlVFZFRmeEhxbkhlR2h2TkdSV0ZyQWRXT0NhNmpHMGZQNHl1bEhGa3J6V0Vm?=
 =?utf-8?B?eS81REZyL01laG44T0NIWUkvTjFQU1Z1YUpYNEJNNXh2MXJtbGdvdFNvWk1Q?=
 =?utf-8?B?dkZYSWhvR3FzRHpsVkp0UXgxSHp5WW5FUXhKQ3Q4cTdCbDBTUEl6WmJzN1ZM?=
 =?utf-8?B?VXVaczhXeVE3OG9NY1ZhS3NVTnZaUXh5MG54VGlacDdHekZYK0Q5blNTUndi?=
 =?utf-8?B?MXNiWUdxT0xqVEJwdzY5amVsQnB3M20zZzl2ZVZGUUN2S3RUTVhiOWY3Vnpx?=
 =?utf-8?B?bU5IYnZnOWtNY2Zpd2RJamxXVXU3Ymd4dnZUTzg3SEZFRlNqbWJSaXNSVmZI?=
 =?utf-8?B?VDhQa0UrckNWREhIOHVCNFJ1REE5L1NxaWUzelljMS9Qb0ZldkE5MUtyNGVl?=
 =?utf-8?B?WHdtZHZYMzd1NlZJVm93RGNWa0VLTUltWkVnMHk5czQyM1VJS1J1bjJJcDlD?=
 =?utf-8?B?ZUQwdE9qNVp4Wllta3pIak5mZnpOak5TZzdXSHU1NkF4T0g2bkN0T055Rmd1?=
 =?utf-8?B?VTRUVGk0Um9oSGNaVTdTWUNJYlUxQ2M1ckpLN2FmOFNnbjE5RGxTdTJFWFZI?=
 =?utf-8?B?bEVWMkwvMXUwa3FxT01GempaanBXdWJVbGx0R09kNzliT3dCMGJZL3pMeEdG?=
 =?utf-8?B?OEpWaGtHUHMxcUpyM1JEVUptU3Y3QWRGdDloeUliM25JTnc5ZlZoTVJteFpk?=
 =?utf-8?B?OVBid1JuaDdwd0cvYnFUb1NjcXJndVBHdUFhWHBab0FwRG5yUVZJTmF5Y1d4?=
 =?utf-8?B?N1BGSUx1cytZM3ltVlVzb09TSTl5dTB0MEVBejVoVjFLRldTNEkvWE5zYU9J?=
 =?utf-8?B?MzZqSlJHLzlLdEdPa2tVN2QvVzhBU0gvVkw0TEQzU0d0T3dzQ2R3eWxJUmhk?=
 =?utf-8?B?aEI2MUhKck1reTdTRDdJLy9jaTV5c1VxY3BVNEp3elBIa3lkUkpiZndwOWZD?=
 =?utf-8?B?aGtVNEtuWEpQSEppaC9hd3Q0aDA1R0svQUE1MGRHZkZxa2VQQ1ZDUU1Wcytw?=
 =?utf-8?B?NUFNb3F3SFF3OXRxSk1wNE1CMW5rMzF5bDZIUStiYXExS3dTRkU2bVNpL2pX?=
 =?utf-8?B?Q0FZSW5BRjNndUVEOCswaWkvalNGNGlJcDNGcy9NNG1HMmJTYUVBVmlsMXdT?=
 =?utf-8?B?VTFvdkREUnh3Tnc1MXRPM0p6TkVQK2tlbDJ1V2dFM1paQnA0VHdxS3I1Z2Z3?=
 =?utf-8?B?a09VUWZrb0JjZHlFcHpwNUhxdjBRY0t1ZzU0Umh0M2JVMTU5ODlFNTh2bW83?=
 =?utf-8?B?ZmVGM05Xd0NlZit3b3UwQ1kwQXNwZGRybW02WWYwNU45bnhZKzhXOTAxYmRF?=
 =?utf-8?B?emkzWGFIaDFncjA3djYzSjNYYkJIc01oQ2l1U3F1K3B0MGgxdXB5OHQ4czJT?=
 =?utf-8?B?S1J0cW9oTHZHYXFIa1Z6V3A3Q2dJMUtmcUZ1UGxZVUlRK2RrSWlXcXFMNG9G?=
 =?utf-8?B?TUplSm02QVo2VTBpN2I1bUlobzZKVzZHRTEwZkdlclR3cVhSU05HcWc5VnNC?=
 =?utf-8?B?SEkybmpGamt5SjcySEF3MC9MRFFwTGFqWmUvazAwNWFKcEN1b0kyL3hYWXpO?=
 =?utf-8?B?Q0dKWTNMUlpxRC9nV2c1Wmd6N09DWUhLa2t3dUlEZklDRzQ2Q09SUU8zek5K?=
 =?utf-8?B?TEllTjNMbWpUZ0pmK3FGODlZY213Yk0rdllSQTRkSGwxWWZhQWxXaGdyR2VW?=
 =?utf-8?B?TTdoVVo4QnovNjdUaFJJSmEyZGZJdEtaQnRkYkRucVhXVHpGbVhCUVVGd3dH?=
 =?utf-8?B?ZjlQdlZ4TndtUzg5dHpTSnl4c2NmQjR1U2lYZGNiaTFzSkhqS3FyTkUvTFRs?=
 =?utf-8?B?YXkzaEY0Vnp1Tjk3azhzWlIwcCs2b0JQRjhxL0FiKzFhcG5wa0t0azVTbEpG?=
 =?utf-8?B?a052UXZyV2owV3pVY2RNcWkrV3kwWkthSjY3bmxjbFNkbFVLaVNybVRCTU94?=
 =?utf-8?B?bStkMlNCV0o4cnF0VnBBaEdIZXR5UTM5WFhmSzlwLzVJbHFlVWMzRHQ0QVBz?=
 =?utf-8?Q?llKLjQ1FBsKUY80B6rN5yfI=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 970e747d-209f-4fbf-cf2a-08d9c070ea8c
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2021 08:49:05.5511
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yboQ/6B7xA8x9jJL79g/RQ2HKNpoE9yLA2AD8Ldro24ADRtScxLiQQQsKM/MFBZgQuIuxpXxgMeK709gvZOF9A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6479

On 15.12.2021 16:28, Oleksandr wrote:
> On 24.09.21 12:53, Jan Beulich wrote:
>> Having a separate flush-all hook has always been puzzling me some. We
>> will want to be able to force a full flush via accumulated flush flags
>> from the map/unmap functions. Introduce a respective new flag and fold
>> all flush handling to use the single remaining hook.
>>
>> Note that because of the respective comments in SMMU and IPMMU-VMSA
>> code, I've folded the two prior hook functions into one.
> 
> Changes to IPMMU-VMSA lgtm, for SMMU-v2 I think the same.

Thanks; I wonder whether I may transform this into some kind of tag.

Jan


