Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E60C464D6D
	for <lists+xen-devel@lfdr.de>; Wed,  1 Dec 2021 13:02:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.235993.409347 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1msOJm-0005K9-Fn; Wed, 01 Dec 2021 12:02:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 235993.409347; Wed, 01 Dec 2021 12:02:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1msOJm-0005IB-BU; Wed, 01 Dec 2021 12:02:34 +0000
Received: by outflank-mailman (input) for mailman id 235993;
 Wed, 01 Dec 2021 12:02:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gc09=QS=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1msOJl-0005Hz-FO
 for xen-devel@lists.xenproject.org; Wed, 01 Dec 2021 12:02:33 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 90131da2-529e-11ec-976b-d102b41d0961;
 Wed, 01 Dec 2021 13:02:32 +0100 (CET)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2051.outbound.protection.outlook.com [104.47.12.51]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-18-Ogo5UNmeNpaVxXOt9a57ZA-1; Wed, 01 Dec 2021 13:02:30 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB7040.eurprd04.prod.outlook.com (2603:10a6:800:121::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.22; Wed, 1 Dec
 2021 12:02:29 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%5]) with mapi id 15.20.4734.024; Wed, 1 Dec 2021
 12:02:29 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AS9PR05CA0053.eurprd05.prod.outlook.com (2603:10a6:20b:489::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.11 via Frontend
 Transport; Wed, 1 Dec 2021 12:02:28 +0000
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
X-Inumbo-ID: 90131da2-529e-11ec-976b-d102b41d0961
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1638360151;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+ZLyFXtU+qxq8Gam5maldnYSMZEm7r1hmDKd6T8okO8=;
	b=HuUby3UTIA2RKtD9ueEQl93e8k72v4YtdH0FDBI5F7a3v8Ufk0t7VAOCKonBDd2W3pWVl7
	m8qGRXOZ+E+4lr8s+QKwAyCx3n4X4aWHz8uGCBZ323CjPZC304cMx+l945yRujZUh+NeIY
	UZgCH2JOT7b4ijJJthymD4ymZ9bA/I8=
X-MC-Unique: Ogo5UNmeNpaVxXOt9a57ZA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TG29IB6FxAx7frFv8OgKgu2thOnNZrPvkNHRNb0cz2oxRQ+2JxefX2xlWJjsqzOoJscLiTGWHZ66/uAcwHxFe5BSN/zmxKJn2VFCF5KhAtuDgFuriNdXY/i6iORyyZeiT2fNbpwu3r2H+ZGkdnFOL20Nn5yHgqIx0Y2OTKGYOX6pWOZSlWi9+QnVXb7i/aPqMLU2qdFH26xFv8Adx34eqAyhaU+FADAKsjjZEl/EqsQ3poCEbyT6SsEuPttHD5EWQQypz5kif5H1BOwHkDeUCMagSxd4mGs5i9jOUy1zhc9u8op+Mk/2ctGBUJKCP0gVCr4ehbIyuK8LD5uBo/yF+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+ZLyFXtU+qxq8Gam5maldnYSMZEm7r1hmDKd6T8okO8=;
 b=PrJ7pBWUAOcMwvvgpRb3EfskxhSprhxYlfPw/Jd60CKZn2JgSeDAL4OAGlct5Oz5jCXJl66H00d3V83fgsOS0abDgXXlKl+vwkcO8lwGr8mMkJG1+LOdIXkAEfUugZwYM6ykBXnLr96IHQ/orbvFgGbQZldQ10JXlcvihC3xzPfETDbnH3v5Z9wcAzA5cwabUVZrSOoJ0vU6ncjTfwR/DLX+I3VG0d8hz9CY4VM7UeSSwLhLshAr5OwVP5JBkZFO+v+stVUXEWRC/dUSKIBnQ8Wkh1Qj0tXU5ka5Pmmrq80c129Xj1GIjcrxBzq7DfCz9bAJ2oh2cLfdJApVk8Xyeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <7d85ed5b-a103-f953-5fca-f6b417cd2967@suse.com>
Date: Wed, 1 Dec 2021 13:02:27 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [XEN v2] xen/arm64: io: Decode 32-bit ldr/str post-indexing
 instructions
Content-Language: en-US
To: Andre Przywara <andre.przywara@arm.com>
Cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org,
 stefanos@xilinx.com, julien@xen.org, Volodymyr_Babchuk@epam.com,
 bertrand.marquis@arm.com, Ayan Kumar Halder <ayan.kumar.halder@xilinx.com>
References: <20211129191638.19877-1-ayankuma@xilinx.com>
 <20211130094950.1bf368d6@donnerap.cambridge.arm.com>
 <a69d41f1-7b57-c127-ae73-2de5a581dddd@xilinx.com>
 <20211201115846.6f9b1d99@donnerap.cambridge.arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20211201115846.6f9b1d99@donnerap.cambridge.arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR05CA0053.eurprd05.prod.outlook.com
 (2603:10a6:20b:489::33) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: acf5e9d6-6462-4b76-ad9e-08d9b4c272ef
X-MS-TrafficTypeDiagnostic: VI1PR04MB7040:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB7040E6C16C2641B7B0D59DE0B3689@VI1PR04MB7040.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ZivaaIz+wsZrCDH5Gn1f4XEXZXeBzD9GCLzZ/88HkGfrF1B6Eh8qTiyxLDrlBr1GbI5xGuXNDL3CvJHmU2CvpKSs8PIg55lzHhPx9FUZQoIAlfpcjfCgLU3MfZDdBmUB2bWlFFDRQ6rFKfcCiRnc2PyO3yktTDnRPJPJz/JmiG0fyE4cqBzypqqskWOxZuDjsuB8eDVMJW/jFbhNN2AnHMDYy0iWTSHLcGoJ+Kl3ccP9YT/gWyjoQmpZT4WpW+y5c7qt3dl9IusFjjn6YkOKpbpRJtqpAanET/Q6KnLeBeBepaxa0uHsloKq93rUNv+Sb3xITTEjXF7W+j2JuaTrbcwiKnkK6Es4ad9+TqL3canjKsQrimZJeElqbAjeQcXbsanMks+6B5rGx6kDrsaSJ/sLyEXZIpNV7CT+rWu5xajuic4nXwaEDLgRXOWKckCdoblcLgd2F5Hd1UvDTxyuZmp1X9cvdR4xCdvM42Z6qiRNmxogQyZC9x43xUVag6S7MAo15qy/3U8qAJn3CDcvlo/vXKuE0JFoM3KIV7eTHJ8iAfXRqXAfOYmDDZcfFENTgNzfnUzSbgOnsXbNSysiflufn0FH4wBGtUVoHyXHMo3c2y4tlzm2sK7ARz+oOdaLJahe1/Kq9bV9YPesnE6ZtVP+KYVkNm82LmKo7dlQdFCD19URnh2SanKoP6xJqfjBOcFiF0nEJi+XCb+B7gU8PdzMhNODzQIiHYbS43Uerg0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(2616005)(66556008)(86362001)(956004)(8936002)(316002)(66476007)(8676002)(16576012)(6916009)(36756003)(83380400001)(2906002)(6486002)(38100700002)(31686004)(66946007)(5660300002)(53546011)(31696002)(186003)(4326008)(26005)(508600001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?N05rQjNZZ1U0Wk9hMVU4OWxQZThIWU1XUlpGU3NIQkxvNXpLUndvbkV6c09R?=
 =?utf-8?B?Z0lzU05VNlhqcDZab2xMQVBLbzcyRVVqWTV2WEVqekIwc3paNE5jRlAweVNG?=
 =?utf-8?B?WGNPUFJzYU1BVmo4bEcwRWNLRmxxa0pVV0N0S01UZkhYbFNuVW1JQS85eWQv?=
 =?utf-8?B?TTRmd1BwaE1oWGVGWlVhUmJRWHFDekRzejJQWjZXSzc5dTYvRGxURWZWTEZu?=
 =?utf-8?B?dFVJYzdSWkROaDZoQXVzLzcxMndHam84SlNWekp6V3ozWlpPL1NwTzAzdG5J?=
 =?utf-8?B?RjAyYVVkcm4zZDVabzE0eVJyQ0xFS0s3SGRSTlNGRFVMT3NPa2ZrMDgyZ0NJ?=
 =?utf-8?B?c2ZGTTlpS2xWUUFIYlE1amIyWTA0SEd1N0FuTE8xYUVsTHhxbGIxd2U3Z0lM?=
 =?utf-8?B?ZnhQRklrdUlEV2NPNmhEaFIwb1BaOHdRbm11aDcxblJxandBTDdJbHI4YlMr?=
 =?utf-8?B?Q2cycmxIVjZKZFhOWGE0SzBZaTdkNzE2cFFkY1M4ZlJPa1dXVlF2ZUVHOFNO?=
 =?utf-8?B?azNLb0I0SGRyZ0Y0djI3b1MwRG5xNlpWYVNteEV5a1pUejcycDR2ZFY2REZx?=
 =?utf-8?B?VjQ2dTRaeEE1RlpwVS9qaUljNVhlTnlwVDNLclNCTE1oOVlMZVYreThUZVM4?=
 =?utf-8?B?eTMyUEdrNTVQZ3Npb3RkK0xhL3RKNVFYbmNWQmp2cnpGd1ZNQWJHdjNSVTdw?=
 =?utf-8?B?M0ovV05YQ29vWW9WdDBrcUNiTkxXTVZEMVZjZ0Rsa3pOclFaSEcxM25xM1pJ?=
 =?utf-8?B?UGY5S0F1VElZQ0FMYlRoNjdvTGszaVJ4emZvV2RWMCtMYTVIOEE0Sy85OTVF?=
 =?utf-8?B?L0crUU9ibE1HSWs3aEU5TFpNczFUQ05BbWVkclNtUzRaU3lNRTdqUTM0blpI?=
 =?utf-8?B?cW5INm56c245NDc1UHkvcXVndDlQMFdoMHE1eW14Sm1sSFF2WDVIN2duZVE0?=
 =?utf-8?B?U1BDanRPMmJlWWJGWFA4UHozZHRqbE5qQXZ4VDB4b3JwbXdrL1Y3UjRSakdC?=
 =?utf-8?B?bklhT2dtbjlObWFCMngyMnJudSsrK2cyT3dtWGdFdjhUbHU5Yk9ONmQ1bHIx?=
 =?utf-8?B?MEYvdVZQeExHdGFyYkRDOFJVK1JCdWU4Y0YwU2V1b3lscDJzcUNMbHNSUTdN?=
 =?utf-8?B?Rm02bXVaaUR6TzBGYmJ1SjFKNWpRZmhMMWtWMFJkU2pqQS81OUJiZm5uaWIv?=
 =?utf-8?B?YkZUS2l5OWo5SERtZlJOUU1BMVJEM3BRYXBiNVVXbTBkUHpVYlN4emZtOC9m?=
 =?utf-8?B?T3ovZGd3bnVyemhZQ0p2V2tRVk5JZmtXaUtwYk9SaWpNZDY0YU5kMm1lUTJl?=
 =?utf-8?B?OUtFNnRKQU5sNVR6N1pVbGtBSjB5RXVhTUVhMFNUWTAxUnR2bGloV3pKZ0J4?=
 =?utf-8?B?dzBoeGtqYnpvbzIvK3BYVVZRcEFOSXF0c1FjMHltdExvSFJQbldocVY3cW1h?=
 =?utf-8?B?eVZRSmpJUjUyNTBpd3FDbVI0ZFRVL0I5TTFuNFRNblJJenpMWTR6MDhwMlNi?=
 =?utf-8?B?eVBmRjg0RlJwM1ZXZjNaazhDWm1sVWNTcHdvV0cvaXU2THVIeVJmVkJPMWNB?=
 =?utf-8?B?SWduNVZRekkxL3JxSUV3WnM1cGtoUlEvdjV5aWM3UEhIWmpxcUt6L3VvaVRn?=
 =?utf-8?B?S0xtY3ZEYTBrMnpsV044Q21jM1laTlV3Ym9VRUNKam1XazJIekk3N2JsZXNO?=
 =?utf-8?B?ZllJczBCelBEU2k5QXpXaGRlSmtFU0VPOXVDU2xIUjM4cjgyc2E4Zi9RL3Bj?=
 =?utf-8?B?WE53MllCUzcwTE9XWjU4TzQwM3hQMXhXajdvdkVwdUx3WUk4dTEveVI0WEVX?=
 =?utf-8?B?UjdkVy8yT01iMDZyZ0d5NnIrZXFJQU9WYUR4WkQ4STFoa0R5NytNeWVhL3JJ?=
 =?utf-8?B?QWN3ODJhNUVxVmkzUy9KanpVbFI3T2phNkY5RTdwM3NZdEJ2OGZockQ2WmZm?=
 =?utf-8?B?d2dKY3NxVUlCWnlmcXpwU052NDJ4YUVFeUFvY3R4cy93L2tmc29aekpzQ21l?=
 =?utf-8?B?NHFOQ2REK2MzYmNwYmhodFphUXNrd2I4dzFNQXEvVVhlczB1MFBwNHlDZjZ1?=
 =?utf-8?B?QnowRXRacVZxbXl1SVdTYTR1RHFhYjRSb21kbFVlYk9RaWVoMHVzVFBCM0hr?=
 =?utf-8?B?OTVuQmpJdWZJWjczQVo0dzB6RkVUM3pjZ0hBdXd2SUNUTTBwd0FwTFErbEs2?=
 =?utf-8?Q?3A5gtvWd8U73hyqc4KHas4A=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: acf5e9d6-6462-4b76-ad9e-08d9b4c272ef
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2021 12:02:29.5860
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l/47PrbAXsjfOohWLY0c4kXHuQKYXfvCuwQdBG9b2qDviC9x2rovBAtKbpb0wV5kwFmvscGiKaRrYMmyaE279Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7040

On 01.12.2021 12:58, Andre Przywara wrote:
> On Tue, 30 Nov 2021 19:13:41 +0000
> Ayan Kumar Halder <ayan.kumar.halder@xilinx.com> wrote:
>> On 30/11/2021 09:49, Andre Przywara wrote:
>>> On Mon, 29 Nov 2021 19:16:38 +0000
>>> Ayan Kumar Halder <ayan.kumar.halder@xilinx.com> wrote:
>>>> At the moment, Xen is only handling data abort with valid syndrome (i.e.
>>>> ISV=0). Unfortunately, this doesn't cover all the instructions a domain
>>>> could use to access MMIO regions.
>>>>
>>>> For instance, Xilinx baremetal OS will use:
>>>>
>>>>          volatile u32 *LocalAddr = (volatile u32 *)Addr;
>>>>          *LocalAddr = Value;
>>>>
>>>> This leave the compiler to decide which store instructions to use.  
>>>
>>> As mentioned in the other email, this is wrong, if this points to MMIO:
>>> don't let the compiler do MMIO accesses. If a stage 2 fault isn't in
>>> an MMIO area, you should not see traps that you cannot handle already.
>>>
>>> So I don't think it's a good idea to use that as an example. And since
>>> this patch only seems to address this use case, I would doubt its
>>> usefulness in general.  
>> Yes, I should have fixed the comment.
>>
>> Currently, I am testing with baremetal app which uses inline assembly 
>> code with post indexing instructions, to access the MMIO.
>>
>> ATM, I am testing with 32 bit MMIO only.
>>
>> On the usefulness, I am kind of torn as it is legitimate for post 
>> indexing instructions to be used in an inline-assembly code for 
>> accessing MMIO. However, that may not be something commonly seen.
> 
> It is legitimate, but I question the usefulness: for a start it wouldn't
> work under today's Xen (or KVM), and I doubt this would be backported. So
> you would always require users to use the newest version of the hypervisor.
> Also MMIO accesses are slow anyway, so while using post-indexing might be
> convenient from an assembly writer's point of view, it doesn't give you
> much performance-wise, probably.

Just so it gets mentioned: Smaller code size may also be a consideration
here, beyond the more general one about performance.

Jan


