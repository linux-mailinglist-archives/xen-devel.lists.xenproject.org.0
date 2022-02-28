Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BA924C6714
	for <lists+xen-devel@lfdr.de>; Mon, 28 Feb 2022 11:30:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.280368.478291 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nOdII-0002Rs-3n; Mon, 28 Feb 2022 10:30:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 280368.478291; Mon, 28 Feb 2022 10:30:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nOdII-0002Pc-0J; Mon, 28 Feb 2022 10:30:18 +0000
Received: by outflank-mailman (input) for mailman id 280368;
 Mon, 28 Feb 2022 10:30:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=A4HT=TL=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nOdIG-0002PW-2v
 for xen-devel@lists.xenproject.org; Mon, 28 Feb 2022 10:30:16 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 67618f65-9881-11ec-8539-5f4723681683;
 Mon, 28 Feb 2022 11:30:09 +0100 (CET)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2173.outbound.protection.outlook.com [104.47.17.173]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-27-tZKYVeXONsu7q8-aH4W5Bg-1; Mon, 28 Feb 2022 11:30:13 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by DB7PR04MB4571.eurprd04.prod.outlook.com (2603:10a6:5:36::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.28; Mon, 28 Feb
 2022 10:30:09 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%6]) with mapi id 15.20.5017.026; Mon, 28 Feb 2022
 10:30:09 +0000
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
X-Inumbo-ID: 67618f65-9881-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1646044214;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3uRGGnjNNDfyD4Fb3eAqtsoKlIW1CI8VIMyjIbR8wMY=;
	b=Qpz9b8A6XosFCNYoSQ4iowrRHa06D556aBZJU3fnNpC2d9fNMlt/7hYV7IOplOXAqLmxdI
	emaKobOR+P/9Vv7oY3+voZeiVGyfI8b3pVyG3x9WOsojJOAOe80Vwq0GfENpT/8tzJrpw9
	YlMXhExK/PfJ/o+kvqvXpZF4TjH2s7w=
X-MC-Unique: tZKYVeXONsu7q8-aH4W5Bg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VEjTO1k6H207ttR3bQ0+7ufA9bwhsKw5ULBGPL4bUgXXpZ8lBJkbNaXeBg4g+7mDfwit7oRoPqArDjSsfr68ETzVAMJ1EaO2UlkhyWAE7hn7J19VCIYBsmAWDio82xEvKtquCOETd8r/sGRhSXEBBhGeg1XAIdMYKwWsDaoT4DAmEo3bRXVTvPxAfuG7KFDstToByOhqHdxAvKI9AffVA3risCk11fhSKOCd9U7LWlY9ZeHZTeEJNBk1S5fiZN2+dZ//6kQnp/xrHeuhJ8GJ91dk0xN85ow4IYF/guiXOXO5SIRZ9bisvbPQyNZacJxfFyCu7BdkK1RAP+uS1noaxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3uRGGnjNNDfyD4Fb3eAqtsoKlIW1CI8VIMyjIbR8wMY=;
 b=Ff9fJDt2fLIZ6rOr+CY4oGXpo08AcW/Jv+bXpCH4fTNOuVDHfIkMrVrL/Q6XoNEhPqLUzurgx+lkEtM2YobKF52vhBwhVUr+AjiSeBaMgDHKp6uuq1xuudq5WM1+zQX6VG6tSbhW6tegrRupQYmUd6btQD+RhlFsbzDPJ1MWQgxhWHvOBqwfT/WdElKqeHs5qAcsvoEFBdifx5hFuNNnqFsJnmY0XjYzP9NqFyjqo3XhRX5SiNBZO1Jc2ybiJy43wOK8M0xYVh0eTC9BpBuV6cTd3hTBopesxQyYEvIaNOJ9ASvQ5iyyWRZ/VYwo8doAS8AtjX9o1e3XCoAacHqi6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <9cb96dda-5450-6127-0eef-66aa2fb670fd@suse.com>
Date: Mon, 28 Feb 2022 11:30:07 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH v3 14/19] xen/arm: add Persistent Map (PMAP)
 infrastructure
Content-Language: en-US
To: Julien Grall <julien@xen.org>
Cc: Wei Liu <wei.liu2@citrix.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 George Dunlap <george.dunlap@citrix.com>, Hongyan Xia <hongyxia@amazon.com>,
 Julien Grall <jgrall@amazon.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20220221102218.33785-1-julien@xen.org>
 <20220221102218.33785-15-julien@xen.org>
 <fea3b34c-d605-be27-f75e-722b39cc48e3@suse.com>
 <ecb68523-1881-214a-b1e4-b239fed6ddce@xen.org>
 <5d218b78-876f-71c2-ec73-9958c7e472ea@suse.com>
 <c55d7cb3-3d9d-59d3-6d85-69c115c8da89@xen.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <c55d7cb3-3d9d-59d3-6d85-69c115c8da89@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0247.eurprd06.prod.outlook.com
 (2603:10a6:20b:45f::14) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 943f5caa-d911-4907-c793-08d9faa54b75
X-MS-TrafficTypeDiagnostic: DB7PR04MB4571:EE_
X-Microsoft-Antispam-PRVS:
	<DB7PR04MB45710F6C2B21173A7BDC3130B3019@DB7PR04MB4571.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Ty0f4wQ4Ookg2NWq8BSc3m1+y/sH9raQn7t4aWLdbNdZ9X6id9sCD+ZNKNK/XZVPdrAJw03/oy8w9iGSn9D/1/sxQFa/EXHgEt128LtAXxqA8/K9IrjZewivBlKgweGx2eFkIWni0dG47PmoEPpGZnOuk+fNITy8xCYErz8xD9Eb6nudm3w78KxcbjBJ4237jmEZTXBnce5uFopEXTYn4egQuSMe+Vsqar47RgwaKlQbUyxfPeFrnJEBvJKbwCGbzsGRK70Wolt1CvygVsz7TG6qweOmfcDl5jJQ1gDrjCNbWiDQhhrJTLGjdMg27ROH6lrLnQxdxI4OlvtxYXrlEbzG+BTm2YFR1otvX6pviPgxfQrVRw+bneHqjY0Wb6xq+f1OmwFOXtQTKLkrwAotBo5d8bxija0ypC+cyk+8DrQbjTs8SZnRYh1PkjIrQB6/DSz/gidJd3/F5yTps+rXl2bADL6u163YQfFyAj7Oew9Q+l8iPwoWPumlMN2NPOe8FlVwW8inoiMpQquuosuVworslcfHghevKb8XpZ5wHmdKQgFu64eO8Wgo9YRkQlFWM0WzX4AwI++62iy8O9SN4AQhBVlSpLtDWyMxRLNoDfq8sfmGVqB6z53W1vUKpfMo6YUbn11AWGyGDzjtfZZSXKobOfE92JRg/bOUM1KR3BkbSDCcXQbIWpef3Us28t7cLETK48hayXFc1SnFNuJhgsT1/YfluPlhtb0r0U4TWdrWdL6F6lDqpnkArAX2r25U
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(186003)(8676002)(26005)(8936002)(66476007)(66556008)(4326008)(31686004)(6486002)(66946007)(38100700002)(5660300002)(36756003)(86362001)(6506007)(316002)(6916009)(54906003)(508600001)(7416002)(53546011)(6512007)(2906002)(31696002)(2616005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ekZlNjB4cGZHUmM4NFZEa3Z4b0pJOFM0NCs5anY5V1hmN0xIK2tkcFdEM2dZ?=
 =?utf-8?B?ak9ObTU0U1lrVDBJcTFZTDc0V3g1VmlDbFNMZU5jVHdxSmJHZ1I2QW5lb3hj?=
 =?utf-8?B?RjVVMHF4MHFmNE9SMmF2YWVqSzVzWGRrY0FRZzY3cWFzME1JWkRMVlEreHlv?=
 =?utf-8?B?R0RNYzRsZTcyK2RIN1J4Qk5OOXJENXJ3Y0NrZDJMUTlOWVJ0ZHdNWkdLdjla?=
 =?utf-8?B?THNqUUZuV2Qvd3hUNldST0N3UVhlN1ZDTi9jTXRSSENhM3VMK2x0WVZIU2dS?=
 =?utf-8?B?TVVjTDFlRG0veEQveFlDZGtYclhuV1htbE9TUU04c2VCeTdYeGFzaUk3cngz?=
 =?utf-8?B?TS9CYmFkQVRKeVg0N1VnS0M3SjY1VkZYZHFzM1E2QmNqZWVyd1pidXB4b1BY?=
 =?utf-8?B?SW52bm9zaExQcHIycnpGc1JVVjg3ckZiWnNkZG5yYXlnWXdEcVN3NlJlQmkv?=
 =?utf-8?B?cW1HRHFXU0tvYjZzVUlqRmFKVHdjdTZ5cmF5aTNoQ3pCT1RNNUgvV2YvRkV0?=
 =?utf-8?B?UHIyVVJUTzcwN1dtaFpqcUpRQzlrL2NkTlcvR2RWcWpQRm1USEJ4RXBWM0h3?=
 =?utf-8?B?dGZuMVBhbFBTRElhU0NIMUpQcGM4QU9tN1hzcW1vZUkxd2pUNWlrdWVaZElx?=
 =?utf-8?B?c0ZsNEZqa1hnRmlLT0VBcDMwVjhUdXIrWWI1MURLV3JGc09XRW0vQ2x2L2hP?=
 =?utf-8?B?cWZ6NHIwK3cxSmRwM3M0d0RDMDE2TEo2QUFvZ1VsMkRPODVTNXVoVlhSZUVC?=
 =?utf-8?B?QWFCbkhEMnQzY2ZrOENpeDRuYTNJRnF3MnhzMytwSjU0UEVIbVkxQnh6bkFU?=
 =?utf-8?B?b1UrcnU2c01OZVRLQ05JTmVPTlk2TVgrZzBTN2U4cXZlMXdFK2FkSUtPeUJx?=
 =?utf-8?B?bTFjMFVMdS9EQ2trZ0dXaXdBOWtLTkN5R2cwY2dvOTE5MnJ4TTFURHFzZGRR?=
 =?utf-8?B?MjIrVVhLa3B0VzNOeWhrWkpBUkJUSjhUQUtaSXlHVlZuSFV0MEk0dWErcVc3?=
 =?utf-8?B?UVhuUzg5cDY5WUc2a04xQ0FMREFBL3VXc25CRDJ4bWpmNDV5SGFDd2ZLQk1t?=
 =?utf-8?B?WXdaS3krNG0yL0M1NyszSGRMYWVZYmMxbmdqSTIvUzBpOEJ1Vy8zai90YUl4?=
 =?utf-8?B?UVJOMFV6Tnh0N3M4ZEtaNU5ibG5xWklQRWlwbWd1RXpuSUtsZ1FCN2prcDE5?=
 =?utf-8?B?Z0xXTS85RVd5cDc1QWNmOTh3TERBei90NmkycElzOWFiVXNscXJhbUU3UXEx?=
 =?utf-8?B?MkhiT21TcGkyRVFGMlB1K0hBdnJtYWNPQm5JUjRESTNYd1ZnTGUveEdEWTBB?=
 =?utf-8?B?SDZiVmFaS2pFTVhFMTZBaGpIbGVqb2NkMkFGbVNjZFdVcnRjOGU1cDFzZENT?=
 =?utf-8?B?cTBhdndLaXdIWFk2WER0cVZTcHdaZ2pZN3FpTUJYcDJhczBqNFd1OXFGUjlM?=
 =?utf-8?B?VjhieFVGemc3VDlkZkkxMGZWTUthNGh6Wjc3NjBSNUdHZDErREJQTURXR2hn?=
 =?utf-8?B?YjJsUVBnV2szS3lIcUlLSk9Nd0NVd2E2SWI1WmNkSmgyZWQwaHdDbDRQQVpN?=
 =?utf-8?B?UTRxMzJyZzlCSmVUTGxMWEIyV1U1ajZpQUxOaXZWTGdQaVBLVG1OT2llbnN1?=
 =?utf-8?B?UTQ4SlUraVg2Z1ZZdkFxcmNMZFBkTVZOT1NOenc5SzNFNjlNL1FtYitUQ2U2?=
 =?utf-8?B?S3R5b2xpK2NNeXowTmtBSW11MkpyNXdJTmpmMVhZdnFLTTRRZVpVZitGYXZI?=
 =?utf-8?B?L1dIMCs4MmtZZUtOQ1FXUDg0UWM1a054bEZUNkpkTGlpakZKaW43cnk2U2xD?=
 =?utf-8?B?eHhVS1BFbUhyMzdnVTB3SlNBUU9zeFVzZ1Nuc05ETTFqZjNUVDI0WTc0UjRS?=
 =?utf-8?B?di8zWGl3b0haamoybmFzWTNKQmdzNGxuMjdSUkZ6K3UxVWN0OUVUdXFmalNH?=
 =?utf-8?B?K0xnY2cvR05CdWtxQlVGQ3d1TzJRUTF1dFErRDRaMlZtYjZXcjVPeEQyYUZa?=
 =?utf-8?B?aEF1T0JsNm0xTXl0OVByRUo5STZscGpncUlkclJxUldaM2VFanJBUkpYV0tQ?=
 =?utf-8?B?YjM0U1loR1BRRjZURjF4VVkwTlk1bGVvRjlEVFRkN2txdjVveTVCR3ZNWElV?=
 =?utf-8?B?Umw2V2M2VGtZdDF5TWY2Z3dBYlVUWE5QWTRWNFAxVWt2L2U1TGVYYXBGUjRM?=
 =?utf-8?Q?Y6nS4ZL1Lmp1JS81Hyy3CT0=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 943f5caa-d911-4907-c793-08d9faa54b75
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2022 10:30:09.3287
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2oJLUWToFxzCY2y69aQmP6oA0jHP7wyahfO02AieY969czBNNFEGIMi2EctHM+JT1y87LilnoRj9YdUusLlriw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB4571

On 28.02.2022 11:20, Julien Grall wrote:
> On 28/02/2022 10:10, Jan Beulich wrote:
>> On 28.02.2022 10:55, Julien Grall wrote:
>>> On 22/02/2022 15:22, Jan Beulich wrote:
>>>> On 21.02.2022 11:22, Julien Grall wrote:
>>>>> +    /*
>>>>> +     * We cannot use set_fixmap() here. We use PMAP when there is no direct map,
>>>>> +     * so map_pages_to_xen() called by set_fixmap() needs to map pages on
>>>>> +     * demand, which then calls pmap() again, resulting in a loop. Modify the
>>>>> +     * PTEs directly instead. The same is true for pmap_unmap().
>>>>> +     */
>>>>> +    arch_pmap_map(slot, mfn);
>>>>
>>>> I'm less certain here, but like above I'm under the impression
>>>> that this comment may no longer be accurate.
>>>
>>> This comment is still accurate for Arm. I also expect it to be accurate
>>> for all architectures because set_fixmap() is likely going to be
>>> implemented with generic PT helpers.
>>>
>>> So I think it makes sense to keep it in common code. This explains why
>>> we are calling arch_pmap_map() rather than set_fixmap() directly.
>>
>> I guess I was rather after "when there is no direct map" alluding to the
>> planned removal of it on x86.
> It is one way to interpret it. The other way is that pmap will be used 
> when the directmap is not yet in place.
> 
> But I guess I could be less specific and refers to the fact the domain 
> page infrastructure is not yet setup. Would that be better for you?

That or simply add "(yet)" to what is there.

Jan


