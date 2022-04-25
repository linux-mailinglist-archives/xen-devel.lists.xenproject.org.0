Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5870850E22F
	for <lists+xen-devel@lfdr.de>; Mon, 25 Apr 2022 15:45:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.312998.530457 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1niz1Q-0000D8-TE; Mon, 25 Apr 2022 13:45:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 312998.530457; Mon, 25 Apr 2022 13:45:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1niz1Q-00008q-PC; Mon, 25 Apr 2022 13:45:00 +0000
Received: by outflank-mailman (input) for mailman id 312998;
 Mon, 25 Apr 2022 13:44:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OfhB=VD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1niz1O-00005U-VQ
 for xen-devel@lists.xenproject.org; Mon, 25 Apr 2022 13:44:58 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e5649175-c49d-11ec-8fc2-03012f2f19d4;
 Mon, 25 Apr 2022 15:44:58 +0200 (CEST)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2058.outbound.protection.outlook.com [104.47.14.58]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-6-Dygxzp6NONOg9F3gDWX1jQ-1; Mon, 25 Apr 2022 15:44:53 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by DU2PR04MB8951.eurprd04.prod.outlook.com (2603:10a6:10:2e2::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.21; Mon, 25 Apr
 2022 13:44:51 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f%9]) with mapi id 15.20.5186.021; Mon, 25 Apr 2022
 13:44:51 +0000
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
X-Inumbo-ID: e5649175-c49d-11ec-8fc2-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1650894297;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ghY+xzaSACVfn+rBM7XU56+JSQXJZR3ojZ70fLF589w=;
	b=iN3d8rOjTXAWxeJE08dT5d5WLtwiYkXp5E4hPNlvYnFzBr+Z3svm+rxz8nVQprQDBCdRv1
	hhjp27xZIlMmx4P6YlCIemFofWW0mNCGhwmeZ+b38rkiTghLMTT5sIAxJ6vHG7oXxzof8/
	j1chSvRpVr6OPChZ95AM3bl7pOPFB+o=
X-MC-Unique: Dygxzp6NONOg9F3gDWX1jQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hWCAVO7jZrtVX5t3waFgag+HDxFvcWeizvRhEk6bDAJxtcFkVdKIshZCun8ZcDqtKJ7fC5dM3RNaL6EmP/2IjYIixQmIbkNNbaReIBZMP1UAwDLRXaC0xRAjQL/0O/jlyraOUBil3fc0MDoIu0TFlXTgTLH8X7KzIB8Pu9zX4zD6CnlH3CbtPb4ZzktHBWi6sH7VuLX0YVn53YxjJAYj2gTPVB70B76evUcJ1Rh0A9Ht+glM07LfTPodi6HgIIl7CfQ0e6TZWcwXC8DNyq4j5w3ALnyaC++1lHuM7QZeAyhdsB+sevrWnX491v5Oipfhg8/H3Y53BgyJn6sDV0rslw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ghY+xzaSACVfn+rBM7XU56+JSQXJZR3ojZ70fLF589w=;
 b=b5bDtJP+v1AcWaNMEQFkqrhBQZMZDOjkhAsKFMugudXPINoHsdQDpLOtNjQp0izOIeOENyelLoZsBX1W2d64ScVr2bU1SYVjGf2wDZDdz+zM/D/ejM1V8yWFLQD5C5r6R6sHGsEmsgk+BdaNzSv6SrmVgzGyCPKPP395RuiG4+t4Bw4f+7mzbzdSL7jN72YQsisvdXXQMFYF4M2ylSAGqVGZB7Fk37cP0M8pliZW63V9zYAudmI4FBqtxuWAdDtRF6lJ2oSGZQ2OW/UpSlEfe8Dx+AaUfv1EfIpyJug6RLR+fl29C5RZTL2FgoOy9XVifb7we36s2F6VxGvx4f+neQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <efcf913a-0549-3d5b-08c1-82e3d7a26349@suse.com>
Date: Mon, 25 Apr 2022 15:44:49 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v4] page_alloc: assert IRQs are enabled in heap alloc/free
Content-Language: en-US
To: Julien Grall <julien@xen.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 David Vrabel <dvrabel@amazon.co.uk>, David Vrabel <dvrabel@cantab.net>,
 xen-devel@lists.xenproject.org
References: <20220425132801.1076759-1-dvrabel@cantab.net>
 <4fbc28f9-5a0e-5ed2-12a7-d2bfd63af633@xen.org>
 <afb15744-5e80-6c40-069e-6fc076e40e3d@suse.com>
 <74500983-79f8-07a9-7dcf-54a7bc162061@xen.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <74500983-79f8-07a9-7dcf-54a7bc162061@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8PR04CA0167.eurprd04.prod.outlook.com
 (2603:10a6:20b:331::22) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 917f0aa8-71a3-41ce-9d31-08da26c1c5cd
X-MS-TrafficTypeDiagnostic: DU2PR04MB8951:EE_
X-Microsoft-Antispam-PRVS:
	<DU2PR04MB8951CC86B524AF41F5892B58B3F89@DU2PR04MB8951.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	A+Oq8Hxi8uOKLv0y2XIbG25sjPpE3prHwT8yaqMwJPtvggcgwmEeOzpHRyxvGPgGMlbmpeDCyqun3wggNDXkJ/6fBdZH+M+IAFpMAoqQIySwYlOJXFxIADooaMCJwtNF73HZ+8F7F9Ntx8o8qeO/Tqwcw5Opct7drA3v+y0TOLfYeoEFvRzw/OF5ztZmkrzDu4tJD33Zf1+oV7mwsvvZTmGt7u4Hq9scGU20lyAyt3JJsqJs+gC5JDPcEUyUCKxKNUJnf65fRdJK9IcDl5PmK8D81nDK+8xWdELEgwI2AFZavczYlu4lY+ijFeifXGdnbWXXj1IY7le3VC3PppKNHrGULyDYXgxT0TMJM0XcI14KaxoIYP0PQWvVn3PKo7iFTERlI2noTzOk/E53JO0bweEujfhlKJrd6y3wD+qer2kSGxmOC60mUUNj6sxCxO9PTmrPvpNnIijwZFf2lBAg8T76jlk9eEIls65HT/wY3FRfv/a/ocHhWzevolbbUGrwxZPOEvdcQgGd2BC/mrdGUcTSWGqjP1RiXhPEzb3epWAugTAbmYCNgJuq5JBompzTaTpuyHPu/XJVRbpfY/Ut3MJrH4qJHhQxXtRDmjJ/uDY1ssJKxZs+EduUyfj7JeSSqDhz5p9aS2Nl1NTgu3B/Jvvno6vOkfIZEOYvXKkWC625v8nLon87LvrO3hkvnuZ/Hmqew2C3D4UyLOQKD9mjtXCmM/Pja6xKIhDb/VdsT1AUpf8cTAuQBtT43S6CXk+2
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(8936002)(66946007)(508600001)(316002)(36756003)(5660300002)(54906003)(6916009)(186003)(31686004)(4744005)(8676002)(31696002)(66476007)(66556008)(38100700002)(4326008)(86362001)(6512007)(2616005)(6486002)(2906002)(83380400001)(26005)(6506007)(53546011)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eTVqNStRR01ValZoNkhkWG9uaU53U2dkNEY5dFllbHJrRTlpV3FzK1Ezd1B5?=
 =?utf-8?B?NkJvRTMvcHN3NnpuTURPYnFESzlRSXdHL1VLSmlpNytJRk8vOXRucjI2REJI?=
 =?utf-8?B?QlVtVk5QcGJYVEVTM1ZzZGVCQ3I0Njd1dUtOK0lqOHEyaUYzeVk3ZnlWTWRC?=
 =?utf-8?B?djNjSVV2L0o5OXF4ZWNJdE1pV3ZSaGVQRkdGWlVTRlkwRHhBMlozSk9NZm51?=
 =?utf-8?B?NWdvYlJOc3BKcWozZk8vMEhBU2ZWSUVTdVFCeDhCbUU4d1V1UWZMVTZBakNT?=
 =?utf-8?B?VTVBQ2NpYzV1Y2Zib3N0QTQ4Vk1ybVliZmFUeFhtQ3M3UFNhZE9VZVBldGZp?=
 =?utf-8?B?SXV2azdGY1ZlVERjckE4NHZhdzh4aUQzUDgzdXlvY1RoU3ZWUmNFYnQ1ZG9R?=
 =?utf-8?B?RjBNSkI2MVJWSTNrVUI3WTlOazVUaUdxVjNrdm9XQzRueU43Q091WTdYMHhI?=
 =?utf-8?B?VTcxTTJTaEo0UHdkbk9TRUxJLzJ2OSs1ZlQxYk4yOW0xaStmaEdEdXlSSGNo?=
 =?utf-8?B?d21tWE1UcnZpVHFLVGpxOS92YWNZU1c3ZDVORVQzcVdzZnNBQmRDUlorQXo1?=
 =?utf-8?B?aElYZmttYWlzeTVHSWFWRGc3cU8zMDV1bmQ3T1NGN2JHZDBCeEdrVVc5d2xC?=
 =?utf-8?B?anZnU05TNW1Vb1daeGhNWTA3SHY2STZ4R3Z5UWs4Z1dLMXVESFZiNTlTUmUw?=
 =?utf-8?B?T3RJWC9BR21wN3NucE9xbFF5VzdUT1FLR3dsTTAyb2ZqUVZqOWh0QzlBOVdw?=
 =?utf-8?B?Ri9UdHU4NmcyOWRQZEtJK1EyUU56MlpGSWpyWGx2dGtUK1U4TGhIbzRGYWVG?=
 =?utf-8?B?cUVRTng0ZmEzZlUwTitoRG5VOWRrQnp5NWxIMmFWQXl0blBxMEYzREpzajho?=
 =?utf-8?B?bjlVQ3E4VEdnSHVnV1B2RDc5c3JiVTlaRFdTN01KY2RLQ01qRHVPRGd6eW54?=
 =?utf-8?B?LzRKU0tLZGtZNmVoSkQwWWpxaEJVbGY0bG4wNXM4UGlKN01pWGs4TGdSTmZ2?=
 =?utf-8?B?V0ZsQVhUdzkzNU0yd25oU2JMTXhnUXY5eWhlQjRnN2JCY0lKZXVvSnc1bURv?=
 =?utf-8?B?ZGNRMmtjQUROa2NpWDQwbWZoNzEzWVE5QnRtaEUxM1NXdWpqV0dlM0VNSlhP?=
 =?utf-8?B?RFVVWG5wem9BaGZteTBaRW1NZ3AwbUU0MTJEVXRCeXQ5bmliM2hvQlNIeXZj?=
 =?utf-8?B?RHg0cWlmeEtGQU1jOEFweHBYOHJPMG0rNnJ6Umd6Q3RMYVFnQ3dnSTRYN1hs?=
 =?utf-8?B?dXlrZVdJbTdnQlMrYkxIT1NBaldGdm5hd1d6RXBodENyREhWVWVYU3BKVzlk?=
 =?utf-8?B?SnI4VE9SdFNJQldsY0YxZUM1YkpieC9aVy8yQ2ZhdXFoOHZqNWJYQ1BFR29a?=
 =?utf-8?B?T2ZQNWFjQTVlOUtpSFZXcURLYkRzZmFQYklCMFBnMnBWVEJqcnpySXprME9N?=
 =?utf-8?B?aEo3WmQwNFhJalZ2QkdqMEZwZ3o1djFxOFZRaUd0UTlmMmVGL2xXNjVVY1dy?=
 =?utf-8?B?V2ZJeEV3K3BOTFVEeEtrNm9US3FCSFZWTUVaVS9OMEd3M2wxZGxvY1A0eUhr?=
 =?utf-8?B?Mnl5Z1A1Tk5lbzFuaDQ3b2pLdVhZMzRRYzRSd2dYK1doU3hNY1Izbk93aE8r?=
 =?utf-8?B?NzFmTXUyeTdVdyt5dzRCNHJLdlBlQlp2Vy96c0RqdjB0aXcvR2taV2d1cHZI?=
 =?utf-8?B?TnhMQytSa2Y4VnppMk01REkwREFnMHFvUWpFSEFtcnZFQk5FaHRtNDNtNjE4?=
 =?utf-8?B?QXVXVlZmVkJCT0ZaMmhFUm9RN0tRWlNpa2lidEYvOWhEeS9GbDFTZWFqQlpV?=
 =?utf-8?B?NkZqMkcxODVCb0xGN3VlRWFJWGVMcm5OdGJmMUsreEY4YWRhNmJRRGxVdFVZ?=
 =?utf-8?B?elVLUDZWaThpcmVBdmhqOG5GcW8vbjB3cXFTV0c2ZXBMSjZYSndzbjRGZnlQ?=
 =?utf-8?B?UXZybVBwRjhNNnN5VjFydFhadGFIbHFHckIzK1RaYUhTUnR4SnoxemxQUzJV?=
 =?utf-8?B?MkVTaXZhUzZxN1prZCtmYXpNQ0tjQU93RnRwNmRQeWpLZWtRUFRTNnI5TFBn?=
 =?utf-8?B?QlFnYmt5bFcvUWZCZHVVK3hyWEdpd2Y0R3o1aWhxSXJnanUrZmtoc2dCMHpa?=
 =?utf-8?B?K0hzem1PdjVWb2VnM1RXK0NMTWt4ZUhSODg4WkFBUktEZ3VjeWY2YXFZUTNU?=
 =?utf-8?B?VGlnM3N1aVZxRlJFT0RWQUEyZUliNmpYbjAwc2twLzkwWTRRTWorUTlrOWJV?=
 =?utf-8?B?QUdNOGJxODZJVDRDMTJBeEpUN0lQeURQWDBGQmVCRFJmMFRpT21Rb2VtWWov?=
 =?utf-8?B?L0JJN2JRendoWkc5bVpsT01lcEdIdGg0NytodDZmeURMYW0xbWhlQT09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 917f0aa8-71a3-41ce-9d31-08da26c1c5cd
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Apr 2022 13:44:51.6566
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: svuwPtnbx5cdEKtMvxtXU0JktfqNf/fKECt10AjYQm2/UZeL+YMoYlPGA/Olj72/YFywrG0DtFxypHMxPAeODA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8951

On 25.04.2022 15:43, Julien Grall wrote:
> On 25/04/2022 14:37, Jan Beulich wrote:
>> On 25.04.2022 15:34, Julien Grall wrote:
>>> On 25/04/2022 14:28, David Vrabel wrote:
>>>> --- a/xen/common/page_alloc.c
>>>> +++ b/xen/common/page_alloc.c
>>>> @@ -162,6 +162,13 @@
>>>>    static char __initdata opt_badpage[100] = "";
>>>>    string_param("badpage", opt_badpage);
>>>>    
>>>> +/*
>>>> + * Heap allocations may need TLB flushes which require IRQs to be
>>>
>>> The comment needs to be updated to reflect the fact that at least Arm
>>> doesn't use IPI to flush TLBs.
>>
>> I thought the use of "may" was satisfying your earlier request?
> 
> Maybe I read wrongly this comment... To me, anything after 'which' is 
> optional (it is a non-defining clause) and describe how the TLB flushes 
> works. So the 'may' here is referring to the possibility to use flush TLB.

Oh, so you'd like to have a 2nd "may" inserted later in the sentence.

Jan


