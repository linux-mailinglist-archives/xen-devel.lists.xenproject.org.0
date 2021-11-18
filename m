Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E51CC455FF2
	for <lists+xen-devel@lfdr.de>; Thu, 18 Nov 2021 16:53:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.227499.393475 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mnjip-0007XZ-Ce; Thu, 18 Nov 2021 15:53:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 227499.393475; Thu, 18 Nov 2021 15:53:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mnjip-0007VQ-9X; Thu, 18 Nov 2021 15:53:11 +0000
Received: by outflank-mailman (input) for mailman id 227499;
 Thu, 18 Nov 2021 15:53:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nol9=QF=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mnjin-0007VK-Po
 for xen-devel@lists.xenproject.org; Thu, 18 Nov 2021 15:53:09 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9ff5505f-4887-11ec-9787-a32c541c8605;
 Thu, 18 Nov 2021 16:53:08 +0100 (CET)
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur02lp2058.outbound.protection.outlook.com [104.47.5.58]) (Using
 TLS) by relay.mimecast.com with ESMTP id de-mta-8-4AgSKdwwNMKiup0rx-8l5Q-1;
 Thu, 18 Nov 2021 16:53:07 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5743.eurprd04.prod.outlook.com (2603:10a6:803:e0::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.26; Thu, 18 Nov
 2021 15:53:04 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898%3]) with mapi id 15.20.4713.019; Thu, 18 Nov 2021
 15:53:04 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM6P193CA0087.EURP193.PROD.OUTLOOK.COM (2603:10a6:209:88::28) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4713.19 via Frontend Transport; Thu, 18 Nov 2021 15:53:03 +0000
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
X-Inumbo-ID: 9ff5505f-4887-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1637250788;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DSP7lRJgendETN/3k2DCCiinkR6tX5EzevSV6N86guU=;
	b=UsPfqkk1UZH0MPVuGbpWnQVoDb6mC7Te4s2e0t2/o4+D2tHFFqsWPJ6VbFp1ax48psrE8K
	PUXLpRwsWTcua+yjbPlK7ZJD3gSZCrUxiW4G9F0ifKEOhbmMTKbo3gW5O2O+LR2M3M8mQh
	VCKKZ2AV9uOmNh/ILoWccaMNf6zgP64=
X-MC-Unique: 4AgSKdwwNMKiup0rx-8l5Q-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EjxZQTlpRb7wxvCxVHaM1JnzBt1PDhRl1g9Dbk+xX7bI79R1Duw9RlurdOH1rm6imHeoQjdpGy0bpCQhaLjVeCYsxru/gk7esjJlK5S3atXt3gxv9ISlEmiw5wdN6XqFO3I4HkMqz9XzyBJMDxfG4/URUhe6It5vQX4V/3yqloqGHpx167AL0ML3ytupnM22BaTLt07jDdfiT7cpl9HVwgnC33vUe+Pnwwrktq2/v5Zuftk6Fux0DEmXPb9C3Dp5/ou+5NymR9xvCdQBjr6bQyqDv7IcwYS9R1UKoUEP5mXoYIsJWuno1xRx7hdsa9sAVs5qdBpBlGK4CAIn/HcD9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DSP7lRJgendETN/3k2DCCiinkR6tX5EzevSV6N86guU=;
 b=Gq1lsNT4YrBOv9HY40wZQ0VP36KJ/JjWesm9PlKDs/ZABInorhdsEP9FrzoVUVH64ter/acJreMtkE5MVPzrNMvPHW6gALT2nADbBmacxQxyPnR/+YE/Hc0pdHUFWVcMDBwKpkS9qc18njjwzP5o8t9kzWHyBa89yquLO3Sv4RpkdS7+opbtw7LWAx2RP/xFE7mlrfUe01nk96AA2zW/HDc8r/y7aoImAC3y71BeVZPQCGjxb3CL51nEWnxA9uuBoX8tMbdmlkgm4ZnHDzeuJ9fBHrUkBAtS2S/1nXR1ewM50NA6N/Bc3cWN0pZB3FSGUIX4jxzoolqPbSObg2QLEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <7dd919b8-0e3d-30dc-302a-9964f9d94ad2@suse.com>
Date: Thu, 18 Nov 2021 16:53:02 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v4 02/11] vpci: cancel pending map/unmap on vpci removal
Content-Language: en-US
To: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
Cc: "julien@xen.org" <julien@xen.org>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Artem Mygaiev <Artem_Mygaiev@epam.com>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 "george.dunlap@citrix.com" <george.dunlap@citrix.com>,
 "paul@xen.org" <paul@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Rahul Singh <rahul.singh@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20211105065629.940943-1-andr2000@gmail.com>
 <20211105065629.940943-3-andr2000@gmail.com>
 <cf0d5566-5629-76f2-ec8d-a05e6ecb4248@suse.com>
 <e2e83bee-5191-761d-f38b-55605de51002@epam.com>
 <d9620e9c-ef21-ea7b-0b25-16770fa47073@suse.com>
 <e77ebf8d-0be2-7b4c-4169-db239bfa8e80@epam.com>
 <e17ee963-d498-00ef-a5c5-1fea73ed4898@suse.com>
 <d9692f93-a58d-1513-1f22-7d0cbc7b3b6e@epam.com>
 <b45c172d-ab51-a02a-8e29-3b31b6319f4d@suse.com>
 <17c7485a-2c44-63ec-553c-5caa9b8eb70c@epam.com>
 <YZZdU1oCaMt1HxTj@Air-de-Roger>
 <b7cb9ce7-fee9-f16d-572c-c39b3ff75d62@epam.com>
 <bf8f1c03-d872-094b-4a3c-3b15706babdf@suse.com>
 <816d3519-f007-80e2-e07f-ff285640926b@epam.com>
 <ecd83d8f-f290-295c-e073-583aa70a8c1e@suse.com>
 <2db325e9-0349-1cc3-1c4a-fefa048f181b@epam.com>
 <ac0cc710-05b9-bdae-c31c-d159b4de0105@suse.com>
 <00e78d11-8e7b-84d2-5aa0-0a7f82f13af6@epam.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <00e78d11-8e7b-84d2-5aa0-0a7f82f13af6@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P193CA0087.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:209:88::28) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 23278496-4897-4116-9c33-08d9aaab81fd
X-MS-TrafficTypeDiagnostic: VI1PR04MB5743:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB5743DC08B6EF09C23DB62986B39B9@VI1PR04MB5743.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	kfKF7BqDyZP8/l9RS2QxtEuYTLa/zUngouzLxA06+DZlupmaLjZyt5efCuxuPwrFhfJPe89RlLKnv6BKAgG8/x7nOXnpjWFtDWovd1+6r0TD2gU9hGjNavA//nrRQBV3JSZhMAF6sz7VBYSaNId4NtKMcdsQYbVSQsuU5RVK1HXyataE9HYaNfT87txFm/CYKgg+Z1EFuZexaS9Ly6a6yRK8wbTE0n3/to1nHcLxuycULKvMvD5ZDma/wbuqYxi+Gl7BRMZa7NXGTrPERGQjPsIPcEsoOYftE11zBmKyuzpSZSx9l6yUM5MRIpz5l9u4AJwxOxWgCy1/YF03/GhJ8AaIlXogVXiSXTt3heDf/f0MTD+x/nPGEOrnllKdYvh0KVPYmLr1u1xp9DaxV8k+skvoFYWOZ/u/GHHk0xx6aDq6VDA8L5IiprLsTWEQBWTsVDgaH8aclBHGzFf1l5GrxsK02H9r681mDixnsu/8lrGvp3QkTgWgC4DYTqVMBUfwhNGXuhWJ4J5fDKBlyJN4rPoUmKZZM2Y5Urh+3B3w8hfEYtcfBRy2xuOPk4AhPBWFEV4YtS71ivq1KMV2CKEBW4ML9RnEE4vwikFP7zmd71e1+wtFPtmXlCz9eOPl/O8cNYky+ULMuApErjTItjaFm6/HmOWKsd9SxNM1tmSfjQEMA5eD7rDOsUQlNIP8WpL3LWMdi+ElxktfOPcxULji1AofaZjT2OWtnlfp7Eb+AIe1ND+wIr4N5rzhNpONEoj7
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(4326008)(8936002)(66946007)(38100700002)(31686004)(6486002)(5660300002)(53546011)(8676002)(66476007)(86362001)(2906002)(16576012)(83380400001)(956004)(316002)(7416002)(31696002)(26005)(54906003)(36756003)(508600001)(66556008)(6916009)(186003)(2616005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QTNod2s5eUlZTmVwS2hOM0d0YWNaTHMwcldFcFNXMlhmNzNYVG01OVBzdDQy?=
 =?utf-8?B?MEVUeUNEd3JkZ1VFL3hqUm5Bc2hsUnpMS21McTdxS0RISEdaNHJ6UGdwYXo1?=
 =?utf-8?B?Ujd6OGg1M3c3Q082c29Wc1pCbkpqSDVrcHd2YmhzMVY5bEdzYUp5VVJBOEFW?=
 =?utf-8?B?OFk4bCtIL1pDdDF1WnZNOFQ2ajd5YjczbFNXZURpS0QxeG9iQlZ1NklJNnN4?=
 =?utf-8?B?WnlOaHFrQURIMjVzQW1Uek5mbjR0YTRieldqWFd2a0UvWXVxOHlycVJMUWtF?=
 =?utf-8?B?aXQ4WjdiTEVVU05DT2thOUgrZEZpUFNiaytrM2FNMy9JeGdaRTBtQWVHSUhO?=
 =?utf-8?B?eUxsbVhycTNJUXM1Z2lZaGdDeWlTbHdsNHl5S0lQSVYxSlplUGlXdFVQb0xP?=
 =?utf-8?B?ZkNZK1Nvb20yM2JKa3h1RzVZZTFQWWZualZjczJGc2FobTlJLzlSRGxzSSt3?=
 =?utf-8?B?MjlSVzZaaTl4UEM1L1RYczZtd2lIZk9iNlhPbjA5b1lLZ0dEekNEeHloblJE?=
 =?utf-8?B?RTlKRms1Tm55bnEySy9VNmVXU21VM1h5Z1ZKS2YzUXdPekFzaGxaT3dJMXZ3?=
 =?utf-8?B?dG5jOE5uK2RmMFFkWnM5OXYxN3JibmRwakNMcktHcnpXRlRuSWN3U1k4bzNl?=
 =?utf-8?B?Z3liTERITSt4R3R0aXRUSHRsL1BjTnB5RlVSNU5UVW5QTC8wcmdWLzlzcVZk?=
 =?utf-8?B?RFQyUEVxYjR3ZmgvaWk2OTFIYjZ4RGY3QUJPRHVWY3VxR0hTWERuck9abjNN?=
 =?utf-8?B?M2tGRXhEY0g0VUVBalBsQWNnOEQ3WWlEK1lweG1TZ1NDV3d2aFJHM2M4QVhJ?=
 =?utf-8?B?MXRjSlVPVWRTSW16MGNsazVwdWh5WkVCaEVvcC9lSncyK0MxNmlBVlJnWjNP?=
 =?utf-8?B?c1ZWaHJxbmJPNG96U09JVVYyWEpnNXh6S0FxVjcrS0pyUFVZMVpzUmwrejdV?=
 =?utf-8?B?c2ZtUW04ZGkvWGxuMUl6SVgvTGRmMElDQmYrOHYxbmkyM2w1RnBncXNJYXh2?=
 =?utf-8?B?TEd5Q0Jwd0xtSmYxTWc2T3Q2UG9TNTFJdlRHbXVjdlFONUJMVHNOYkJQb2V6?=
 =?utf-8?B?RFFMeStSUUdlS00xYi83Zld6Ujl3ZW9wWlBaSTRMSGovMDNaeTBkTExha0s4?=
 =?utf-8?B?SysrOVFtcTlHbU5JOUdvQjU4S3JIcm9yOVRtM2xnRldMMlorRDR6NVR2QVlw?=
 =?utf-8?B?d21Ra3pJMWgxQ3drb3hERXhLK3ZmMkYzVHNSN09iZ2xmQzlrYkR2Qjc4bk9G?=
 =?utf-8?B?VktnTmY2elhydWtwQjBlZmhmU2pMcUVmVk5ZYTBHZjlvNjh0TUIxSjcwa0ta?=
 =?utf-8?B?S1d4SGtuNExOUlFadDljTDdDVWtVMUorWFp2bTk5NllDTk9PUEFCZUQxUGRm?=
 =?utf-8?B?emNpSHlFMzdlaDRSOU5ZMitWcGx1OFNNSFgvdzRpNUpYRDFZL3FKVHg0R0o5?=
 =?utf-8?B?dWNNUnp6cHplTjNLaWJLa2h5QTNFMmRxYjlHS1ZIM0MyZzR5dGVzWTFvNUNE?=
 =?utf-8?B?MWpxS1h3Z1oydEdLNTVvVW5JMDFCdERDNnNCQm1mL013cjJ3bzhORENiWGhi?=
 =?utf-8?B?Q0hteVVvRm0ybHVsekpYSndZWmJTaGpUZUgvd0FYa3JtdmowZC80SE81M2d2?=
 =?utf-8?B?YWFUNWhrKzROd1B1S0ViZmtlRXFuTzZjcUFMc0hnOEJqVENoT1FLV3VCRU1S?=
 =?utf-8?B?RHdnYS9mZCtzM1J0bzhNTEd6ZWo1WHlOWE44bFJQSS81bzBMMFByTHVJb2Rr?=
 =?utf-8?B?b1lmTHd6eVpKc1lLSW1Iakwzd0hsY2dqei9qK0huNTk5MXI1cE1SRXVROEUv?=
 =?utf-8?B?bk9ZSVFZT2JSR1pCRjZXUW5qSEYrLzFITjRrNlREaUhXSXRSV2FmQzJvcm9U?=
 =?utf-8?B?QXN1cDdGTHNHaFhRUUEwTHUzWERCRWhhNCs0d1FWNUVheFh5RkgxZ2d6TUJP?=
 =?utf-8?B?MVFQZzBSQ1ZNNGZEN2dTY1l3RHhPaHZORGNsVGtmb1MrN1BSbGs1RHhvaFdr?=
 =?utf-8?B?YjN1T1JaL1lJQmxTSi81enNKY3llTyt3b0YwcHFYYVZGVzBiQXplT3pEb0g4?=
 =?utf-8?B?R2pPWktLUUlkOVZoQ2JzUXM3NC9qVElzZytpTGZFMU5zd0V2NnFaaUl4WnlV?=
 =?utf-8?B?eHd0M0E5d2NCR2ZFaHpBdXY5ZklDWjVxclB2TGpmaFlmbXJjbGZNY1JCOE12?=
 =?utf-8?Q?uLIxcO7EHOn9KTy6wJyFqMY=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 23278496-4897-4116-9c33-08d9aaab81fd
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2021 15:53:04.7596
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xBqPWAhwDSogzQ1Crtw8jMGLu3Z2sCOMtVxbhR7wp/704O/q87KLrbn07RM7KnQlX6LYhnILbzlj9L6x1/eDdQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5743

On 18.11.2021 16:46, Oleksandr Andrushchenko wrote:
> On 18.11.21 17:41, Jan Beulich wrote:
>> On 18.11.2021 16:21, Oleksandr Andrushchenko wrote:
>>> On 18.11.21 17:16, Jan Beulich wrote:
>>>>    For the moment I can't help thinking that draining would
>>>> be preferable over canceling.
>>> Given that cancellation is going to happen on error path or
>>> on device de-assign/remove I think this can be acceptable.
>>> Any reason why not?
>> It would seem to me that the correctness of a draining approach is
>> going to be easier to prove than that of a canceling one, where I
>> expect races to be a bigger risk. Especially something that gets
>> executed infrequently, if ever (error paths in particular), knowing
>> things are well from testing isn't typically possible.
> Could you please then give me a hint how to do that:
> 1. We have scheduled SOFTIRQ on vCPU0 and it is about to touch pdev->vpci
> 2. We have de-assign/remove on vCPU1
> 
> How do we drain that? Do you mean some atomic variable to be
> used in vpci_process_pending to flag it is running and de-assign/remove
> needs to wait and spinning checking that?

First of all let's please keep remove and de-assign separate. I think we
have largely reached agreement that remove may need handling differently,
for being a Dom0-only operation.

As to draining during de-assign: I did suggest before that removing the
register handling hooks first would guarantee no new requests to appear.
Then it should be merely a matter of using hypercall continuations until
the respective domain has no pending requests anymore for the device in
question. Some locking (or lock barrier) may of course be needed to
make sure another CPU isn't just about to pend a new request.

Jan


