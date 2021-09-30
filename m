Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BDF441DC32
	for <lists+xen-devel@lfdr.de>; Thu, 30 Sep 2021 16:23:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.199959.354300 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVwxa-0003rq-RQ; Thu, 30 Sep 2021 14:22:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 199959.354300; Thu, 30 Sep 2021 14:22:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVwxa-0003pd-O1; Thu, 30 Sep 2021 14:22:54 +0000
Received: by outflank-mailman (input) for mailman id 199959;
 Thu, 30 Sep 2021 14:22:54 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lHSZ=OU=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mVwxa-0003pX-7Y
 for xen-devel@lists.xenproject.org; Thu, 30 Sep 2021 14:22:54 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e582479d-21f9-11ec-bd4e-12813bfff9fa;
 Thu, 30 Sep 2021 14:22:53 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2177.outbound.protection.outlook.com [104.47.17.177])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-28-GY67x6N2OqCYqeVV4kb7Vg-1; Thu, 30 Sep 2021 16:22:50 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4943.eurprd04.prod.outlook.com (2603:10a6:803:51::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.15; Thu, 30 Sep
 2021 14:22:49 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4566.014; Thu, 30 Sep 2021
 14:22:49 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM6P192CA0032.EURP192.PROD.OUTLOOK.COM (2603:10a6:209:83::45) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4566.15 via Frontend Transport; Thu, 30 Sep 2021 14:22:48 +0000
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
X-Inumbo-ID: e582479d-21f9-11ec-bd4e-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1633011772;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=J8nakvMkRLnc7FFQUjjQiIHAtqM9aF1YkbrbFKHyJKI=;
	b=iKXvGGz/OhIY/5nf3g+MdT4HYJD65dbe2i8z7bJcSMexHvlpKY90CuKCI5Wc9rmIRx/d9S
	Yltn4yvoKExiRKE27N8DywhiZ9X0ScSN8HgOF2SRGTKhNtg2TiRuE6zoXqQ29rvsRrnT7T
	EV4LxPXs4MtlRhiUlgqpDHb37DcyaA4=
X-MC-Unique: GY67x6N2OqCYqeVV4kb7Vg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QvTDl67UkcmD2uGX2lzzT9eGyXRASCOimsNGw77Wu0iGILg5PwsM4fiNRl0TQ+IfVrqFuERIwq+VKw4WuAPmfnQpxnI0qgkxzZUTcag6qAKH2Js0kFhTtWRMjb538mnKMVRo1mnCDdQlY1F8/rCLp2T7MamSpQzpQ3IMd2h2FYv+Hb7F7GIcY7dc3MLeOUZU+4CSgQW9KauX7DUHRpWYdZV6tJ/nM1P2UF/u+G+A7jegU4dlpMW5A3dbCAcUysRriedpglzIU36R1WBJ+1RRhUg4xclPf4Lhg7vVeuv7QNpf7ppGQatemtDoqQ0Cg7gKywvz5LvFf2J7nglWXE+oxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=J8nakvMkRLnc7FFQUjjQiIHAtqM9aF1YkbrbFKHyJKI=;
 b=FVn8mKe6edXl4nwDGEd/cXZhsTqIgFBR++qx+UdOh1ry5W3u/LOm+wgezStMXdMD4pxK0Bk7z/b/g+M3mMlSd6NcrJKZLhkwq1DnuRjLGxVDFYezknd5lXCTWwPrLSiRrRrloS1rAxIPOguDMiS1+rspll3LQbdKt/vTseJbGO3aizNzLqrtP53aSi689jMRAYDRF1S4GP8j35iP7S+WiVYnSUQKggbyvmv2c6nij+LqCiHyhU+VkAFxjPOABm8SFORMCtJc4uikE76bnNsjDQT1e8Ng66mSFfDyEWHyCEsKjazD8lNFfWB1K+FSZVTQ2437vasWaocbjExzoVuizg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: apertussolutions.com; dkim=none (message not signed)
 header.d=none;apertussolutions.com; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH v3 01/17] xen/pci: Refactor MSI code that implements MSI
 functionality within XEN
To: Stefano Stabellini <sstabellini@kernel.org>,
 Rahul Singh <rahul.singh@arm.com>
Cc: xen-devel@lists.xenproject.org, bertrand.marquis@arm.com,
 Andre.Przywara@arm.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <iwj@xenproject.org>, Julien Grall <julien@xen.org>,
 Paul Durrant <paul@xen.org>, Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>
References: <cover.1632847120.git.rahul.singh@arm.com>
 <db3af270e884838cbde7c29c366740bb3f628725.1632847120.git.rahul.singh@arm.com>
 <alpine.DEB.2.21.2109290956180.5022@sstabellini-ThinkPad-T480s>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <417ffe2a-0d79-99aa-eaaa-1d1715a3e0f3@suse.com>
Date: Thu, 30 Sep 2021 16:22:46 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <alpine.DEB.2.21.2109290956180.5022@sstabellini-ThinkPad-T480s>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P192CA0032.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:209:83::45) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c7fa4e9f-f723-41bf-2ee1-08d9841dc7ca
X-MS-TrafficTypeDiagnostic: VI1PR04MB4943:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB49435427CE52ECE3C3C66418B3AA9@VI1PR04MB4943.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	VaFI9byU6RXECVqce7TN+P+xvC4qUVBy9lUg2zPtM0CgL+1OsAqNt2zNq/MiLmE4SBRLK6e73BGhUncSsSJXaj2mJCO+skHtWgzWrIFOtYCaDs8L3Z5oitrQUq74uvCD4tsllhXeQOkAfEiCvEP7o2deLrC3Q1cU2qUeYrJ46bl0fTZMvvjVxyoYLQRTR0Z7at9O1iEtO7dqnU68N+GkvvwWIFkEwPxyzYXz/4y9YAP6g4mTKApCOT54i4OypcoYrDoYqJdpBCreuHTGumQnFSfekgL0AX354EmxRKKahFkq/GJqLLhyO4Sweg1wdab2nVxZaxmZ6vdKKATHVF4Pt1pM2jpl818u1cxtL/aZ0Z0uKdE9815OTZ5A9hByOB9VSa0puo6qPcap7f1jdH4LtwswRClDlSPJub7G31IhYgSBND1l9IOrUs/FEFVxdUend+VYceLAQ+hL2wRHDxtaG7pwm8ubDxJvPQPoMY4aCmbxPpWjnSIoPVTeDSLrI8nblFNYs47YhiMspNDOCq9WSJWcbS61YQ3gWxa/+uB6UwA09PSma0NXVos++yTAMLIhCSPCKKF4bscZ3q+0bjQoVpOw+g4+R4VyMlLYa7BkKD6+XYnCTIosj6pvR2GPD9XorSfeHCZbjyhku1TpeIK+dHap9QeVHaWtCxaORz9gw0peEJDe4QNPX2W26NLkE5WovOkXlzvoRxdOGSIO6ogg4Qb6zzPrbdC8J3jKr2NeJdQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(66476007)(66556008)(66946007)(7416002)(2906002)(5660300002)(4744005)(6486002)(36756003)(38100700002)(508600001)(26005)(4326008)(956004)(2616005)(31686004)(86362001)(186003)(31696002)(53546011)(16576012)(54906003)(316002)(110136005)(8676002)(8936002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OUNBSktvMENIOUY1cjkvSTEwS1dHMlZZQklkRmZPUkNIS3RRVWl6Y2hWb0Ir?=
 =?utf-8?B?ektleXpCbEY1ellFMytpVEl3QUZWUGxndm5SRkdxREFSWWJrYnNqWlp4UWpW?=
 =?utf-8?B?djM4STdGcjNMUWgzZ0k5MmltRjJId0hhWHhOL21vQmJoZHB2TDd5SUNNUkJ1?=
 =?utf-8?B?SnJybHZkV1VsN2FKeGNkTGNVUS9MQ1lNVEx3aVl6R0RFekM5cXBWUkY4OVdo?=
 =?utf-8?B?WHpkR2cvMngvT1hhL3ozRzdPK3FGTXZqcVROS1dyTmxMV010d0xicGRnT0Y2?=
 =?utf-8?B?ZzdNdHJ6V3IrTzRNNXU2Z3VrK2Ruc0o1ZTM2bXN0RkF1Unp5blFxWkJvVGds?=
 =?utf-8?B?c1liQlEyeEQyVWRrcGNGRTIwSDZ0bWt0dXZTaXlzcUVFaGw1bXJkdXJGbW5o?=
 =?utf-8?B?VXd6eVQvNWVRVVBaeSthTHJjendFUFROZ2ZRUHd4RmlGUW43UHhid09vQ2VI?=
 =?utf-8?B?Q0JWME9pYnJsak5EanRvR1B4aVlwTG84SmRFdVcrSGxGeStScFMrZUxjU3kz?=
 =?utf-8?B?Nm1xU050bjJCWjRKWjRzcVNYb3ZjRHVxSHlwS2VoQllPdGJxQWZHek40U1c1?=
 =?utf-8?B?cGtPNXg5QWs0RkJtOTcrNWRKSEkwT25HeXFsTVdzUnFDa2NtMCtVYUYzdW15?=
 =?utf-8?B?emF0djFtWmg1U1phUEZxdzFxMHdXVTJoUVRyTjAzb3RCM3g2LzYwWWN6LzhJ?=
 =?utf-8?B?aE1CdVVUUGdFUHg2WlFrSnFWY2NCVmVUWnhzRDY3eFNOWkJ4NFRZRGtmaEpv?=
 =?utf-8?B?QTNKU1hvaG40a1pKRVVZNm9ULzg0V1JEWGFoMjh1Z1dNTlFGdjFJbDBuU2d6?=
 =?utf-8?B?Q0gxWUNsZ1owc0hWVllWeUhhMEtHc2pSd0R1S05QSDZMbHBiV1pIMEM3enBm?=
 =?utf-8?B?b09uUjhRVkNZbFo4YXdBeTJZQmVZM0IwT203S0RwbmZ4WlFpR21OemUveXVK?=
 =?utf-8?B?aUM0dkYyK0ZIblhUSVZqTG1pOEtwM1lPQ1JCNkFGaDk4SlBPWFZwZ1RSN2Yy?=
 =?utf-8?B?cU1nNzNMZlRJNVFuRmVuYUFBcFNWTlI5VHhCNjZ4TUpmcU91UjRlNlZ3TkFB?=
 =?utf-8?B?VzQ0VnlKWERzUzJiVVJPQmFzZ29JZVNOcHB0aGtVbDlMbjcvSnZiWW9ONXFm?=
 =?utf-8?B?UHY2cUVQTzg1VDNOZjIwakVXSWNTcndEbDMrUTBvUGZHQVpzWlZhU254WWN0?=
 =?utf-8?B?VTM3WVFyK24xekYvQk9QRmQwQko4bUhwUGhyUS9iMlRmSlVWUjFwQUJrT1lv?=
 =?utf-8?B?aTNjN3ZrZFE0K1BOUU0xa0kxbm9NaHNad2ZPRVBYTXZWNE1XWXNVVjdEeFpB?=
 =?utf-8?B?bVg0Wm9xbzJZOWNKYTM1RytwMU8rMitYTVNHUFZIRGg2UjVGeEQzbW9STmlz?=
 =?utf-8?B?NjZjc2dLMjVIQk5tNVNpSXl6N0V4eGt2eXFvRE9JYkxVdy93L2k2TDV6T2o0?=
 =?utf-8?B?RVl6am4wL1p3bjY1NkhUejAwd0EyRUppMnk1a1RTZm5yaTQzUGVUcEF1THZM?=
 =?utf-8?B?blhpY0NvcDh5VitLaFNXcUFZTGZCbkdyanRVTnlGNkRNS2hKc2ZQeFN4VHRt?=
 =?utf-8?B?UVFDVnBkNFBkakV1YjRTdXAwK01STGdGazZla0dKZ3JjTEJaZVAyM21ackRi?=
 =?utf-8?B?RGhPa1N5cEN4bXhPYXR5MDFGMVMxVFcraUV4MUNIZ1BzbUZUODRUNjc4cEJK?=
 =?utf-8?B?M3dvL2dYK1poSXdncmxISUlhVm5yU1dCLzdsUUU3TjVjVGVpRjFhYldDQUlG?=
 =?utf-8?Q?o5SdIboyufl8DFIWGCEOj6VJxHYXZtTYGugds1o?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c7fa4e9f-f723-41bf-2ee1-08d9841dc7ca
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2021 14:22:49.1829
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LWJsPLoUP7eDX7N5DkKxtdOps1ndEXaovy6RerNo9KTtVLAu586pl140pulbTAI1oIUfATguAK5P9ut5KHFI5w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4943

On 29.09.2021 18:56, Stefano Stabellini wrote:
> On Tue, 28 Sep 2021, Rahul Singh wrote:
>> On Arm, the initial plan is to only support GICv3 ITS which doesn't
>> require us to manage the MSIs because the HW will protect against
>> spoofing. Move the code under CONFIG_HAS_PCI_MSI flag to gate the code
>> for ARM.
>>
>> No functional change intended.
>>
>> Signed-off-by: Rahul Singh <rahul.singh@arm.com>
>> Reviewed-by: Daniel P. Smith <dpsmith@apertussolutions.com>
> 
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

Acked-by: Jan Beulich <jbeulich@suse.com>

Nevertheless I'd like to express that ...

>> --- a/xen/drivers/pci/Kconfig
>> +++ b/xen/drivers/pci/Kconfig
>> @@ -1,3 +1,7 @@
>>  
>>  config HAS_PCI
>>  	bool
>> +
>> +config HAS_PCI_MSI
>> +	bool
>> +	depends on HAS_PCI

... personally I think this should be "select HAS_PCI", and the then
redundant one in x86 might then want dropping.

Jan


