Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F1C43C252F2
	for <lists+xen-devel@lfdr.de>; Fri, 31 Oct 2025 14:08:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1154295.1484368 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vEorl-0005mm-0Y; Fri, 31 Oct 2025 13:08:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1154295.1484368; Fri, 31 Oct 2025 13:08:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vEork-0005kS-Tg; Fri, 31 Oct 2025 13:08:28 +0000
Received: by outflank-mailman (input) for mailman id 1154295;
 Fri, 31 Oct 2025 13:08:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=r2XW=5I=epam.com=grygorii_strashko@srs-se1.protection.inumbo.net>)
 id 1vEori-0005kK-Un
 for xen-devel@lists.xenproject.org; Fri, 31 Oct 2025 13:08:26 +0000
Received: from AM0PR83CU005.outbound.protection.outlook.com
 (mail-westeuropeazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c201::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ace3d043-b65a-11f0-980a-7dc792cee155;
 Fri, 31 Oct 2025 14:08:21 +0100 (CET)
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com (2603:10a6:20b:5e4::22)
 by PR3PR03MB6489.eurprd03.prod.outlook.com (2603:10a6:102:7c::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.15; Fri, 31 Oct
 2025 13:08:19 +0000
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593]) by AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593%3]) with mapi id 15.20.9275.013; Fri, 31 Oct 2025
 13:08:18 +0000
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
X-Inumbo-ID: ace3d043-b65a-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ygTKh8Ou2AmXIMY2tbz/iNvIrkJxkuCefTEHdS2toLYoiATak3O0wC8tKRoQHae2F4XG24h1Pmi2zqGi2sd7PrgVxDaQZGwwUapDSOwNu6gP1F7mmippK1XoAAO8AsWGwN/Xmgn4QcMw3q5sPycJgRIsrk9qnEW66W0HhahfQGPDh5Q7RmBoNQnHTuiwn4XEMXKHp7L838e2tiZK8Xow1tFg8VKkMxFFVefwy6DnWlSWycde3+iG2iypXfZo/rG1qsWdDo7FeJ1XtGhKFMqOwPAMnjsMQm9gTaGWh6zu6PPP7zz87UYnKHwz+GjkjPaYjFDPudyc0Y1FNFMX+s3xyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=blHKH9R2+50ZKxBKclvV94XxnDSiT4M7TFNVeYbBiXY=;
 b=YlqDWFo2A40E7BbY/qDkj+izno0hHzFqcmuD4LOfJ/nIuwRKGd9ygc9rskZcUn1VT3lOEmhLatcQXXQeWs6Jeb30cGZSbSpKDp3Nqo/BrGSgOTVyYR3jEDQ+o+IMv+GwUoZTep+W2/ZX9Nagc8CWJpw2gzmu5qaTnJl+PgY3TRm64BgwZbw5s6BrMyqeYmt67mN556tS/AVZP2uS1Pf9R65EUekCTnICEOPI2Ty1kgND+XbqaSIYjmNsRbFJgv/HKTO02Yurwd+jaCKBuMpO2TEN6KHQYtfvz4GXcuDiE7bZLY43lWQIqUFZpiqYLUGw1JpqlpPOqtJJEV0NpmqSLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=blHKH9R2+50ZKxBKclvV94XxnDSiT4M7TFNVeYbBiXY=;
 b=gAqsnXTMvnX5r4N9PizoRwBroMG/JgvzbXNm1HncHuzwhVjmSvx6e/h3UFWEJJ567/+PgMLs0binxku5Xeh7ASO3u4lw3gb0Pj0d/ZDPV3PrxbdecY33gI/C1YF1j+SjBd96CwnWZmopbMLQohEo78PJDUE2uujU133eI2cnfl4WX7hy7ershK1AY53Jvch3CTQEghfAC3conEArDWhK4rYdgWxp2odqncBozwe1RznbsVPHuAV/bjhuUFCa4EMxKZphpKhnaD2A+K97X/HX4Z+zVIXp/Gy8dN6G7tjvv+qRDOMEDt/5WHxIDFlkxzDiqtTi3o6UNSrOXmOYA5wmkA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
Message-ID: <40609db8-ea7d-4866-b7b2-d9647c64d512@epam.com>
Date: Fri, 31 Oct 2025 15:08:16 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] domain: adjust soft-reset arch dependency
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Penny Zheng <Penny.Zheng@amd.com>,
 Christopher Clark <christopher.w.clark@gmail.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Timothy Pearson <tpearson@raptorengineering.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>, milan_djokic@epam.com,
 Sergiy Kibrik <sergiy_kibrik@epam.com>
References: <c9c8c9c6-a155-4986-bf77-5766cdcd6024@suse.com>
Content-Language: en-US
From: Grygorii Strashko <grygorii_strashko@epam.com>
In-Reply-To: <c9c8c9c6-a155-4986-bf77-5766cdcd6024@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0137.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9e::12) To AS2PR03MB8907.eurprd03.prod.outlook.com
 (2603:10a6:20b:5e4::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS2PR03MB8907:EE_|PR3PR03MB6489:EE_
X-MS-Office365-Filtering-Correlation-Id: 52f53260-232a-4a44-1c08-08de187e8f88
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZlM4QnJkbENOS2ZyWlBuMHlGRzdNMi9CZHlvcDd5dXVBWEJPVXM1WUJLb1l4?=
 =?utf-8?B?Sm9SQ1g4bUhkZ3h6cWh0Z2dOc3Y3RXBKczU2cm1OT0ZwN3VGc2U2SHpKU0Z6?=
 =?utf-8?B?NXdmZmRZd28vRDJuOHhNUUovVGVmSWI1bDhVZ20xZ3ltZ2RadWJ0T3hxS1po?=
 =?utf-8?B?ZkhqMjBZQ3dvWTdxY3BTM29FaXJESGdRTXBaWkcrZUprRlNYcjBtRC9Eak1v?=
 =?utf-8?B?bTRyb2FrU0ZTTkxyOW5Kci9EVkU3c2VPRURyeFFLQzNXZ3c0K3A2YWgwSXpV?=
 =?utf-8?B?YUl2QlliNjNUQWdWSGNSbXExYXg1VWRobnZ0c0k1MHY5NUVTRUhrRHVRZldN?=
 =?utf-8?B?Tld3QXlWcHZwMktGdWR6TWdUWURESFRDUmFCbllKTDJRZytPbjdZaVNLVkYz?=
 =?utf-8?B?NDdJOXhycExOMk5VQ3NiMHlzYVA5MHlTVzdLNWZZWml6eHhYSWg5NHlCako2?=
 =?utf-8?B?NC84MjBLNERINE1mSnRxVDEvVHF0M1F4cmc3bUFwamYwQ2haeHJqQUU0Ti95?=
 =?utf-8?B?RWZvN1NzUVEyZVppZ3AxclZySG00ZytuMDdwcTNMQ0NqOU1abVRPY1lqbTNN?=
 =?utf-8?B?cW5scWI4SDhEbXNERkNGenptQnUxZUFRaHVpeVZnVUM5czZRMVI4dnBSTTJa?=
 =?utf-8?B?YnQzMk5GK2oxVHlLc3ZUTWNHSmwveFQ4SjVYTUVCUU1SMG1CbmFGVTlBMzFR?=
 =?utf-8?B?ZUU3RkZQMWFTVHd3aUJLQ01BL043MjNOdVdVWTFQaGVkT1NoUDdVVERnZkVk?=
 =?utf-8?B?UzhNOWV6UGR6ZFllTGFSNWoxdmcxaERrV2ZDcGExa0xiSHdyMytKaEt0K0ha?=
 =?utf-8?B?WXNMcUlETkw3YWtZTHhDc0lWbHJhMHk0RHRMUlBmWmZuQWVBMUF3V25obXh4?=
 =?utf-8?B?Q2FzTEt3aUt1WksvVmNpK01ZVlUyaE9Na2NlMGlNN3hXS3dsT2U1MHJFY1Z0?=
 =?utf-8?B?djZVNXQ3KzN3VEVJbkFrMGJ2WU8xVWVHcStWa2JhemJLZGYzQUFaeWVWT1Z3?=
 =?utf-8?B?NGZrcTVPMHgzcVBxTVRsV043RmlTcDNVZnVSYVZJWEFLbk1XQUp3WTg3blVz?=
 =?utf-8?B?cUJRY2Fpb01uWS9PWjJVZE02RVczYjNucFZ2NmNiajBrVnp0YTFRbTdxY1Va?=
 =?utf-8?B?Q2FDMnhFS1Z4VTVoaXVBaEhDb2xTYi80b0MxTTYzbEErVjI5NVBxRDd6ZlRP?=
 =?utf-8?B?WE5EazZjOEY2VzI2NUExeU1NNmpMNE1ldHFCSysvZi93N2tpc1VZK0tzdW5w?=
 =?utf-8?B?aVU1bzNXeTFrdW5mSGhxM1VmK2dmNFpHdERzRUJOTS9pcHdhTE5nUjVWNmNM?=
 =?utf-8?B?TzVXTlQrNml2NjBVZGtJM25pbWg4eU4zZGN4TEtOSW5FR0dRNGVNSVBFa2hK?=
 =?utf-8?B?Z1BlWE1CUXA2WGxiTlhubWJYVGZhcnZRNU4vRStWNHFGdEFZWUFadi93eWti?=
 =?utf-8?B?MWJZNzZva3RMbjVIUmRuMEdGamdjL3RmUkswb1R3eVVjcEl2d1VIRkhvTVlx?=
 =?utf-8?B?dzROVUFoUGxpeVR6b1hyMzFPSmZ0NUpZUEY4TVczL1FaSmhBbzU0ZWh3MzFJ?=
 =?utf-8?B?Ti9kbkRhWkUySWZyM1hHcy96bUxyUHBPNWcwSGpLQVNHNFVkM0w3NXpiR0hr?=
 =?utf-8?B?SFNqV1hoR3JqTjloODlobU1uWmZtU0pRY1JvYzZjTXZrcDdOTzNVV2RFYWZ5?=
 =?utf-8?B?OTI0NDg4UXdzb0RTcUE3cHBzRERnWnF1b2wzYTFZNVlnRWNqeE5lRjRQNkR6?=
 =?utf-8?B?UXdxMk5QU0VpZEs4SWpXWEtJQ3BiWlNJMlFQb21NTVVSbzVtdUJNa2I3ci90?=
 =?utf-8?B?VzlTMXdyOFo5V0FrSWhxZlVqZVFUNm9OUUNrbDFEdlNFT25sSHRmaGtSeito?=
 =?utf-8?B?UG11WGdhSHdZVGorTkNGbHA0cG0rL0V0c3ZweWtqYS9RWmk5amRJb29NSHha?=
 =?utf-8?Q?BspBmfaCZeJ1ifdLGG093OJoONTgixee?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR03MB8907.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RmRsUDRKQUhEQUtIYnNvWGZOYzBUdXB2bzFzQTRYeFlWekFOUzQyVE8yMnl6?=
 =?utf-8?B?TFAybExpL1M3RDBabVZhcXRrVDVFOFVPQ0t5LzJmSCtqY0dCRUNJVlMyR045?=
 =?utf-8?B?UkkyYWdsWi9vdW9KcDdlZzB6VkN3blJQakt5WnY3L0F2dUU5bUpwTnZGUjRZ?=
 =?utf-8?B?OUZEWDExQ1puMEdtQUsxWUVBSFBnQ2Mzd3pCQnluZnlPU2JBYzFETHgwN1pF?=
 =?utf-8?B?Mnpxc3g5YU5SMzNhY1JZWlVVeVFWUFBHMkRYV2swd1BTSWZvU0QwUEY2UHdY?=
 =?utf-8?B?VFVXQ055Y1BCek5aOWpuWXRpSklSVUZHd0wyVTc1cncxOXJ2SW9TOHh4cmNU?=
 =?utf-8?B?VC8zNmVSY0VMSVpJMW9mMjVZYmJRY2pDNzVlZDhiblJHVlRMKy9UY0lBREQ2?=
 =?utf-8?B?OHNqdFJrQytYOVRrSHR1djlBK0dLME93QnZDWEZnd3FhTGthQWFJdXljWk5x?=
 =?utf-8?B?SitLdDM5YUtFMVRzWThYSGJEQ01zVTk0NndZT3NjaWljQ1pmaVhnalZHcDhw?=
 =?utf-8?B?V0dCWDBKS3pJdWdQZnFtNm1nbWpqRmlrVGlHVFpHYmtMeWFCOWhkcWtFRCtR?=
 =?utf-8?B?eTAzT25yY2M1cnpKdk5jTGoyTTNWQXdZRERiNzQxR3R0RWE2MGJpZ1YwdklJ?=
 =?utf-8?B?L0w4ZTQvY2FFQjc3SVZoaUJHbnZtTUg2MUxudThrckFXU2w5Q2Y3MGVxSUgw?=
 =?utf-8?B?ZnQ4YkFjcUtwUzVsRVFCNjJUM2JUV1BKUWpQdVM1NkUwajhxV2s2bzVDTEZF?=
 =?utf-8?B?anBndmc2dng5N3RmK21xczc3akxIWi8xMWl2TURzMUVhRHpkWENnTndoWEdI?=
 =?utf-8?B?dXBMYkM2R0Fla0Y5a3Y2TXNMQkdCU1ZoVHE2TEdwUUswOUVURDBwK2o4NE5s?=
 =?utf-8?B?Wk1xL1pmM1ZxUXVIVHptVFlNcTVkazNNREhhSVN4RWpybTlZZVB4djN5amQ0?=
 =?utf-8?B?b2hEbG94by9xeGVvbldKbWtIQVlOVFg4OHpDTjI3TTFhaGllLzNlRDF4b0pM?=
 =?utf-8?B?NWZYREQxRW5va01TVDEwY2p1a0ZHbkZIZGdLaGY0bkluT2U4SXVPRVo2TVhF?=
 =?utf-8?B?eGFoM0x5UzlvQ0ZuaGs1SzBaaFpYSFpFS2sySmxDSGprN0ZlMlhCQlhUUDJB?=
 =?utf-8?B?RkkvMGJoRVFJSEcwaEI4Rnkyd1VXSVFQNkFPY3VXMzNxOCtUVnJWR1NXRXlO?=
 =?utf-8?B?d0ZKNUIzeW0wYkhkaGhNZU81dU5BQTc4U21lSGx6amZCR3dtNUM5Tk9ZdlRj?=
 =?utf-8?B?dFp1WGp6N25aZUthT0NSRnkwNjl1VC9lbTRBamlWSXZhU1dOVGlXclV0VVhN?=
 =?utf-8?B?Q200aDVxbnBYNGhkTU9xblRyZ09CLzZWWUV5VG00c1diQ3hvOFkzckgyY2pl?=
 =?utf-8?B?aEQra2NrcWJMelJMU0lubzRSb2NucllWYXJMNjdhb0oydGx2aE9CbEluVGNI?=
 =?utf-8?B?aUN6VDlPTTZtbXM0TC82VGVuZ0VVaHIwc3M4N2toaC9HZ3kvUGdGSUx4cDdG?=
 =?utf-8?B?ZmR1cFRJR3BGSGpoUy82dXRUWkRkOGU4dFczWG01MG5kZGJ2ZklMVkRDMDVj?=
 =?utf-8?B?YVdDQ244WXJuOXgvdDMrMHlMVXlKeTdjOUZmR2MyNjI0b0wwSnoxT09vbFZM?=
 =?utf-8?B?VVNhWjJ5R2l4WWQzdk9zRVZjZkg0RjREWUkzWHdHODNjRVE1UUdxZ2xVbjRC?=
 =?utf-8?B?ajRGbmRjZ1p4N2hKMWU4bm5LVkpwL21rVFlKTFUyc0N5QXFNdkxkZmo0eUZn?=
 =?utf-8?B?b1BIYm4zV2ZvZ1h5aGFXYzB0UjN6UHppUkdkMHNpcXY4aGpnR2p3Zi9zd2hP?=
 =?utf-8?B?blAvY3NQeFl0d0lnNUE1UkZKL3dsNnBmYngyK25pbUtKT1RrRHdocFd1Vkhw?=
 =?utf-8?B?NU01RWljNllrWEl4RDJqQ0xwc3d3RW83Q2N4QzhEQktONXhHRXlmdjh4R2lZ?=
 =?utf-8?B?V2JoaVZRVUtkdENvRUZzN1hPWmlZT1NIUVlpeDB3azVCbEVQQkZoZENjdUo3?=
 =?utf-8?B?dUdJOWl3NXZOMWZlN1R0bkxTS0svWjlBa01neUVqbHNkSjFGeTRFblEzSDNX?=
 =?utf-8?B?b3U5S0xYL1hlMW4rcmhjUFJMOHdtRDRtT3ZSdnd6T2krWmdpSGNQMGE0Z1Rl?=
 =?utf-8?B?SFVINmhTa3hBbXhROFMrWll2ZCtYRUFxS0dySDlWZzBvbldMeXNXMlBPRlIy?=
 =?utf-8?B?TkE9PQ==?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 52f53260-232a-4a44-1c08-08de187e8f88
X-MS-Exchange-CrossTenant-AuthSource: AS2PR03MB8907.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2025 13:08:18.7707
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9em0rbOJVBEh97UqwTtlN7uHZeQMNLKLMfrI3F8CVlsg60cvXUci5A6hE8lTaQUNZR7LJ6cgPk+1XRhaq4NeHHAiMpVVaixXJofzA71E5R0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR03MB6489

Hi Jan,

On 30.10.25 14:10, Jan Beulich wrote:
> Arm's arch_domain_soft_reset() returning -ENOSYS is quite unhelpful: This
> way a domain will be crashed if a tool stack mistakenly invokes
> XEN_DOMCTL_soft_reset on it. Instead the tool stack should be told of its
> mistake.
> 
> Introduce HAS_SOFT_RESET, implied only by x86. "imply" rather than
> "select" such that HAS_SOFT_RESET can later gain a dependency on
> MGMT_HYPERCALLS. That way HAS_SOFT_RESET will go off when
> MGMT_HYPERCALLS is off.
> 
> Check the new setting early in domctl handling, and compile out the thus
> dead (when HAS_SOFT_RESET=n) domain_soft_reset() as well as its dedicated
> helpers.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 

Thank you for your patch.

Reviewed-by: Grygorii Strashko <grygorii_strashko@epam.com>

But one question - soft_reset is applicable for domain, so wouldn't it
be better to note that in Kconfig option name:

   HAS_DOMAIN_SOFT_RESET

-- 
Best regards,
-grygorii


