Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 26E764664CB
	for <lists+xen-devel@lfdr.de>; Thu,  2 Dec 2021 14:55:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.236570.410391 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1msmY5-0004oe-AX; Thu, 02 Dec 2021 13:54:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 236570.410391; Thu, 02 Dec 2021 13:54:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1msmY5-0004mr-7X; Thu, 02 Dec 2021 13:54:57 +0000
Received: by outflank-mailman (input) for mailman id 236570;
 Thu, 02 Dec 2021 13:54:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9SUj=QT=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1msmY3-0004ml-QV
 for xen-devel@lists.xenproject.org; Thu, 02 Dec 2021 13:54:55 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6d8b6aae-5377-11ec-976b-d102b41d0961;
 Thu, 02 Dec 2021 14:54:54 +0100 (CET)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2053.outbound.protection.outlook.com [104.47.12.53]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-22-N0jVKau7PCWUeU1FF3Li_Q-1; Thu, 02 Dec 2021 14:54:53 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB6863.eurprd04.prod.outlook.com (2603:10a6:803:12f::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.23; Thu, 2 Dec
 2021 13:54:50 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%5]) with mapi id 15.20.4734.024; Thu, 2 Dec 2021
 13:54:50 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM6P193CA0088.EURP193.PROD.OUTLOOK.COM (2603:10a6:209:88::29) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4755.16 via Frontend Transport; Thu, 2 Dec 2021 13:54:48 +0000
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
X-Inumbo-ID: 6d8b6aae-5377-11ec-976b-d102b41d0961
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1638453294;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=POpEsygG2alrlZnWyeaqmNsFbyVVrgq4r+tyAfk+r4w=;
	b=PUXm/O5R6PbzWeQQ7gRx9fzTuttlcotU8RGb3iUYSs+Q6osGB4XKH4yDv3mZ0soIr7Uf5S
	Z9O3DFz2JrnHz0RWEW6rWFuiKm6lkgD0bM793S8nnw4CzHla0eZMGJtq5Ep669g6FHTAst
	aHRgGqEpWQsLx63CEgOOr5nqG218ddU=
X-MC-Unique: N0jVKau7PCWUeU1FF3Li_Q-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WnU9aBnhqK151HD9a1DfRaj6DSx/bGb1O1XymY8Le50VryqpVlCUmmkm/NVrN71R1jK3fMW6ofbwf6gX0ksa+2Jz9PvnC6CMZ01dG8Bqhg4E9nhsKLHqNQdcTAlaoIzqELhFZg/j/+Bkq6xCwGcc3341jtOAbDG43q7W3iTpy9eQrIyzHxoNnIS8Hs6dIfemOGf+IajzwXuWfU0D4ZSed4d3XmJUF7d2/gQLDMpZ9ruAc+V7lIxJ9F1I8yEumubVFwwY5xqIw/GqXfzqg7TAXe8tl3+g0mfVoPzwZ1cIwGlXD5ZhWqlzCg1rhdJHyO42NIGWTMerFAmO44LNWaiWaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=POpEsygG2alrlZnWyeaqmNsFbyVVrgq4r+tyAfk+r4w=;
 b=eNcjV3tiIIs3MaR961dO/g1+MWraInSFGNNCY+W4pUmRfNs+1pllDTa7b9a8MM1xud/wO6Vfp46mHXZHrv4DtvLeDsonaE/MfUzamnxAswoMvCeX6Xy15s7ghAbOo2xOT4peATVuJS4fK3qO7flnsSbhhgvdPo37+j8LYV2teEclbaTxAKs2A5jeDllLBhTRgh2wSNtgmZHkTNwt3DNSSQ4cFt3gvdHE5ZNR1X3GjfvnBq0G/inPHJ1lSWTfQGagfge65empIkSJlzIYG9F0L048StaLYw4hJ7LUFNyqe6D3155luJfBwF2mW03UJVMeSClbIkw9klEoIa9Yf8jUJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <66bfe096-9b9d-2289-93ff-17eea95ed7a0@suse.com>
Date: Thu, 2 Dec 2021 14:54:47 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [XEN PATCH v8 02/47] xen: move include/asm-* to
 arch/*/include/asm
Content-Language: en-US
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: Paul Durrant <paul@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Tamas K Lengyel <tamas@tklengyel.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Jun Nakajima <jun.nakajima@intel.com>,
 Kevin Tian <kevin.tian@intel.com>,
 Lukasz Hawrylko <lukasz.hawrylko@linux.intel.com>,
 xen-devel@lists.xenproject.org
References: <20211125134006.1076646-1-anthony.perard@citrix.com>
 <20211125134006.1076646-3-anthony.perard@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20211125134006.1076646-3-anthony.perard@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P193CA0088.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:209:88::29) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ad98835f-2359-46e8-c8e6-08d9b59b4ee1
X-MS-TrafficTypeDiagnostic: VI1PR04MB6863:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB6863F284A5E64A60E5195EA2B3699@VI1PR04MB6863.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	1QNKs1suLHHKw9ySC0ZurT2Jh/yx+pOP0GI48IpqYGfbdrorfLYp9Ok8bIbLKsCQdYObFS1lGRWzh14f9CTxch4NOZiNuUBp/Hni7H9vW69t1DIIn7gpmMDQAnB1pMosqixyD/bZcueiBSsJooswJnCHR80VaekVcP2yV+GT5WnIMMnXgZGxp3HdK4uC83BcRwwMjzXBw+7Exlp2TSsWmzVTTEQt029M56ykGoiSNfYznrh+pBngTZH/OZ/vhr52pDhC6h2BIOf2v07540Kpz10XncA/TWUsGdhUHuisOu7y9rmuHqh6Q8wwNl+rICVDJ5Z2Q6Z91bz6IgUob7CDEmPso1uYgVOL2UyNl90m1ZmUh56lUHtxzl3qXKObEbm/zF8fQjLddIzWLbzfTNdkOLBCLjH4Wd3UC6FYx6+Do5IrpdEteFKYu24OwpLYD91yb3W/EXumejUbqAjWNEbDrL/4sjxPMNL8pL17rIFe3F/8ZlJzr9l9fhvGWcgPllaSv05Y8Yj/zCao5Lhsp2FpV3KFRvKEmTQDN1WBMg1GOkboM5yV9+H1t0ZXL42+UgCckH3NSLl95HCGU7WEQIgPBr331UGaf+9SYaeN2EMZuBm4wDORnphaoKLe3UgE/v56UDRTmArT4bRNw+VVfrJe755yosyhEt8ok3gWALyr1W7SsKcJr4QtvUYcRajR4USg6cbed3qKdopQiVGzPNSmmUqAyUnFViXec0PO0IhCHNoEi78NdC7UIg9dljn2S4m4
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(5660300002)(31686004)(7416002)(66476007)(66946007)(66556008)(54906003)(16576012)(6916009)(53546011)(31696002)(316002)(4326008)(186003)(2906002)(8936002)(86362001)(956004)(4744005)(2616005)(6486002)(26005)(38100700002)(508600001)(36756003)(8676002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZHVzSzkyWEJYUlFJa1dhUldSYm03UGRSM3piSTFmUXVzaDJaMlZRNHB4UFMr?=
 =?utf-8?B?dlFvaW0rbmNTV2pTeVhodjdDR3I5OGpvVWJOSTQybnUyUXhUVk1IRHVHa0dQ?=
 =?utf-8?B?Vk9ZZ3RCbEVVRmlJRExBTk5FRU1naG9qUFpPa0VqcjhxNDlEempSYm5md3cy?=
 =?utf-8?B?L1lRQ1dFTUVNLzR1SGVhMDRqZlZWcFgwdEFZeWZWY2NhRWkxZjVDbkRYWitB?=
 =?utf-8?B?RGVxNW5VMlNYMkF5KzVVakJQV25DMlE5T0FPVm1uNHdvdHJQRjdjUDIvTXlV?=
 =?utf-8?B?YmxBL1ZpTGJvY3FuM3FxRW91SUR0QlM4RGhvdE9wN2JabURFcUZHTFB6R3ly?=
 =?utf-8?B?VWttR0hlOUczNDZxM0h1Q0VBaDRkT1Q5NXlIWExFMTZNbHFjSGw1bDZTRzhI?=
 =?utf-8?B?STBGa1ZZNmxkN2lTNkRGNmVkRGZMNGFyNWNYUUtiQzU0Q2s1OUxpc2JIY0w4?=
 =?utf-8?B?VkZiVG93eUVUeVBPa25LQmVQS3VXNC9waitaUWhybUJ1cXBHbC9Udk5NeUtQ?=
 =?utf-8?B?dk0rcDMwd1NCVUExd1dLSFdJK1hxZjVxZDkxdWZVbUxOZFFGckxSSlZYQTFM?=
 =?utf-8?B?MFdsZFdCeEZnMFpicy90cm45RlhhWWJMVDZVVHVtNUFBaTR3ckxyUzdQZkhj?=
 =?utf-8?B?YVFsUU80aGZUazNjRGtwdjdxRkM4QVJJMHNtZ2YzSU1vb0FVdTFkQXZpcE1Z?=
 =?utf-8?B?WW1GNXYrd2I2TEplS2cxV3lzS0FTT0FXWC91RS9reElwY2Y5NU5KT0E1cVhZ?=
 =?utf-8?B?Q29vTlVSbVYwd2syZTkzTUp5d29TZjdjeUUzTjdrYVUzMUR1K2FkS2dQMUdH?=
 =?utf-8?B?RXVwbGZsWjQ1a2FVbGdLMUN0MU1pa3F4UWxQTUFwVGsyVllwZm1sdDRsemhM?=
 =?utf-8?B?YVd0bVlIdkpkWkhlME1mMG1OTXF0SVRkNkJTS3A5S2ZOem91SnN3b3JoUEpK?=
 =?utf-8?B?QUtNRzhZVEh5T0trWDFnZFowTXhPVmo0amc1ZGZzbXZOWGpsZTd6Mm5ENTZE?=
 =?utf-8?B?OXB6cXJiM2RjMFlOcGRINW1STDdURlkxWmt5TUVJMm02OW5CcWJQQnQ3M2k2?=
 =?utf-8?B?clhlZTRZV0FSTUU1M0UweDg1TUJ0UFFNQ1YyMFV1YjY4VU1udW9BOVVMMzRO?=
 =?utf-8?B?bjFid3lSZ3JnUDIyV0JweGJTTDRxNTJIMUtRa1h1RE9aRVJqc1hZeExGZ01t?=
 =?utf-8?B?WWIwOHBVbUJwQnZxUnhGUUZtMW90NlZ3Z0hjUFpaNno1NWVzb0hZdy9yS2ZP?=
 =?utf-8?B?N1ZHd2NJYS9sZHIwQm82QlN4K2R1ZEJscTBuWmlrdW9hZ0dha25aMTNiQ0oz?=
 =?utf-8?B?ZDd1VlB4eXltR1RodkU4MnVyUTFLU2RKd2t0VnR2S3BXRmZReVdCV2oxOG1R?=
 =?utf-8?B?RzU5NjdhU0VDdi9iblVxYWdIZW5iQnI0eERVdGJDR1pWRlhIM0kzSFp3am02?=
 =?utf-8?B?Y0lKWkJoZXdYK2hwVEhsWWR4VTZzd1RGakU4QjlGZVZncTlhaW1ycmxaRVJr?=
 =?utf-8?B?WFpidXR4bksvY2hSREtiMm9QY09LeVJzb2NtaHVOWXpUZmtIZDF0eHFVVGpH?=
 =?utf-8?B?aWpveTFyVDc5ODBPMEhrTG41VjMyOWJUbk9DOTJGT1FhVFFWWWZxbEZ4WUtS?=
 =?utf-8?B?T29BVXhDcWhXZ0FqUjduYUs4c1hLUCsrYzVVbU5ESE4rSFY4YXY4R0dBVjVv?=
 =?utf-8?B?MlZ6ZGN5U0syQUk2c09pS1JocFNCbG9RMEV6UVFlOStnQytDdVJTZUsrL3VG?=
 =?utf-8?B?d1ZwbFNnaElLcUZML242Tm9LZ0tPSFlydVZlVjVUaEFaejlSaURxeHBjRmtJ?=
 =?utf-8?B?U2VlaWVmT3VtSWVDUjBEQ0N3dlNKRzBLakdxQVNOQzBCTDkxVjJFYlRneS81?=
 =?utf-8?B?TzAwRTNqMThxV2MzOVBKU2ZVTmYwN2w5U2ovdWhMaE1GUWFmc1RPbE9zQVl2?=
 =?utf-8?B?NjNPOXVDV0hJSmQ4WWRQSm1FQXFZMnpXYWhtZmFTVmFzWCtnN01oclB2WThr?=
 =?utf-8?B?aHM2VlpsR1oyT05HVFRPTENwZHMxaHVoWW5JbDZuMlh2TTNXMHlTWVpaK0lN?=
 =?utf-8?B?dDBmcHFFQk9iOW56UFVJK29ZWCtjZ0N6TTcxWnRNaTBSNlJSVGczaFpNdEd1?=
 =?utf-8?B?N01USGczRm9lV0d5RUE4NEduL0VxWFc0aEE1UVlydStZZkp4cG05dmc4ZytR?=
 =?utf-8?Q?OUP7k7OgJvvEHms9lONzlQ4=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ad98835f-2359-46e8-c8e6-08d9b59b4ee1
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2021 13:54:49.9662
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0E+683MZifDpIMMaBaCGIHeyk4qAxwI79b97e8Dwt8DVC0FnuZaSIIIWYY4VHskF0rqokofjLFXuH5gfagETCg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6863

On 25.11.2021 14:39, Anthony PERARD wrote:
> This avoid the need to create the symbolic link "include/asm".
> 
> Whenever a comment refer to an "asm" headers, this patch avoid
> spelling the arch when not needed to avoid some code churn.
> 
> One unrelated change is to sort entries in MAINTAINERS for "INTEL(R)
> VT FOR X86 (VT-X)"
> 
> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
> Acked-by: Paul Durrant <paul@xen.org>

Acked-by: Jan Beulich <jbeulich@suse.com>


