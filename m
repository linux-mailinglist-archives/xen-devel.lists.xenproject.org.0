Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 950C365082D
	for <lists+xen-devel@lfdr.de>; Mon, 19 Dec 2022 08:49:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.465863.724671 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p7AtU-0008Lc-QO; Mon, 19 Dec 2022 07:49:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 465863.724671; Mon, 19 Dec 2022 07:49:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p7AtU-0008Iy-Mh; Mon, 19 Dec 2022 07:49:04 +0000
Received: by outflank-mailman (input) for mailman id 465863;
 Mon, 19 Dec 2022 07:49:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=eGu8=4R=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1p7AtT-0008Is-H9
 for xen-devel@lists.xenproject.org; Mon, 19 Dec 2022 07:49:03 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on2084.outbound.protection.outlook.com [40.107.247.84])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 99f615a5-7f71-11ed-91b6-6bf2151ebd3b;
 Mon, 19 Dec 2022 08:49:02 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB8482.eurprd04.prod.outlook.com (2603:10a6:20b:34a::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.16; Mon, 19 Dec
 2022 07:48:59 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5924.016; Mon, 19 Dec 2022
 07:48:59 +0000
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
X-Inumbo-ID: 99f615a5-7f71-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RNQomaRuRgM+wyBh1yB5QNEfrtc7d8WDxknAjyVL1cDhpYkfjjZY+15MfI/gkdfUHKu0c7DpGezqxkywOxADZ8s3ddG1PeF7wvahKgpfhOWeOZ6H707jbACCuGxbWteOBmz1GRp4lhnkFsReiLM/zVTcn+VANpHUcvb0rjmSYuX4EdNI3e+aY8uczvcXMjbDO/nXNzfoXlU0FMYYMDqlb1vZKeDqKYG5ccALABtahXKv3RLK6gdprkwIU8Nmht675JjSY+TrOiJnWl4MpNatcsbTNi01S8bC8NdK5HWXqzmkqyC4ueZc5JFlxu4AOrbeGV2HryJNmCjcX3ro+7jhSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WyGf/Zo+LQsnQ/3LOUuKoMI2J6NtVFetQDo08e0D1cE=;
 b=P44TOcJpGKDR7uzoCMJaLHT3/NTqsBIG080sRl30zEJC/zQwyWKQUdSo4WdfS1Kc6Tzr7hDnDmTakHxirdRVNCk7RGVrOLthIX/l2P1Ggi+2nuWPtWXx/fMIcHq3caSjGgZKIeHoKAIUo1y13D3D4iqO7/BjnKY4IEGmeP2aKQ6D9GX+s3nDyuWgdNDmkv/eaDIgN9SPqJzq5oXS+CiZT9CA+SW0mZFP75IjtQER5zRTHwzILBbcqPWDKpt4ZnuYr1PTThc2hJkqYlr/+bqw2z3OG+jxCXzMoAJsl7kWrasMgCITb4lBMlJfcbIX1pfwn030E/a1aD/nc9yn2qkngQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WyGf/Zo+LQsnQ/3LOUuKoMI2J6NtVFetQDo08e0D1cE=;
 b=Y8Qx7HFFGHhN44xmWVb58uBpb2h5G+9mVjPRm8wvoj6FfhqwvVkKWRToTUwzDwpJmZVkwesi/wZr3fcCCvVoe79uDsj7dGZsDNNhCtmaXUTJCdE59PagW9bpjeupvwZrn2YSA9xPHH0a8V56TFH1tX0ft8ZAr6rd/+569yExRtEnKk/Xc1q8mPaOOIegOkK+SmUeSvTA/76UiLDjr8NgQQDaugJDdzy1mzJCh4bfSzU5uUd0unt2IhCvuKqnOUTWRSk1jkgemktDptEShQ5E2DwEuYcsTqKzhyWfHZ3yYzsiNiHJ7r/afXsK7krC/ACotlrOmi9m27WBkoVi9Ekv7w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <d2a7638d-f0df-70a4-83a5-f951a5e930f9@suse.com>
Date: Mon, 19 Dec 2022 08:48:59 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [Patch v1] Bug fix - Integer overflow when cpu frequency > u32
 max value.
Content-Language: en-US
To: Elliott Mitchell <ehem+xen@m5p.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Neowutran <xen@neowutran.ovh>
References: <c1535eba0bba6fc1b91f975f434af0929d9d7c96.1671298923.git.git@neowutran.ovh>
 <Y54j7mp/fMsaF564@mattapan.m5p.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <Y54j7mp/fMsaF564@mattapan.m5p.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0138.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9e::7) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS8PR04MB8482:EE_
X-MS-Office365-Filtering-Correlation-Id: 5fb5f9f9-6fed-4653-5b50-08dae1957cf0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	TdPky7AkHGCcY7tYekSde0TmEzXH2m3Xz7pnaC3fuvEZA1cgMDFtwTcaYuQq95WjJCkWHMmdM/sgKg18mgs1P1jNWZjckKqPamNI5HLA9Y40nKN9yDtI3w+dqthrDvHR/J3SOtUzruZJUzL1sHi8+vo7Bf4I+9QEf54kTTCzw9H8xOPSGyqke5w9rx8y+JbmIhI2hjeNwLhqb1TYB8G6b7Xt8xRXCP40wcQjBZYW6QFZlvjJ4BQIg+bhPhrFsScLrfADB9B3FHHHm2d2LqAJW82ov411wfZoQzLWE1hmCHcD2yH4G4tGwSBatkXcO5Zn+jGuxv4oBh2jcIZ8oODRJxe4lLF5wtsgWIzN8dCg0qkNaYGe29ENL7favC1OHNqbEP7Qq5hd39NoAiB5YhlF23fSQd890J8tpigfzTjIUghQGrM8UkWhCEHf6YkD31EctPb53n53bsUwyZijaoQf46bfU4lf62243Q6UjDZVmOg9vAivwXWrV4JLVSFxbmbuL6kmotq1APYXMhDJtg/wHU8sAoh91D/RBg6PUq0kFMDc5acERe8VI8QxfAVTawnrazm0pllYQKv0OtfnTU/Z/sMcoWXDH19mcG76VupCQcKIflig9TITacqkB2KTZtso/K6uHul2+y4l8P0PFCZ+736w2mRE5iK7tnDDDsmrq+ofEMo+xTc00OHodChp4lNQF/jscKlhccJ+8pbKmDmdpONWztvZoXy+XThdVVz0cZU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(376002)(39860400002)(366004)(396003)(346002)(136003)(451199015)(31686004)(38100700002)(2616005)(86362001)(53546011)(6512007)(2906002)(186003)(26005)(6506007)(478600001)(36756003)(6486002)(316002)(8936002)(41300700001)(54906003)(66946007)(66556008)(8676002)(66476007)(31696002)(4744005)(4326008)(83380400001)(5660300002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WTVhK1pHTk5LSE9JZk1oOXAxWC9vU1diaHgweEdhRC9zN1pGZzhYNzMxVVhB?=
 =?utf-8?B?N0E5RFpnaEVFNldZZU5ROVB2UmcrSUZIRjZ1QmtSeVhGTXppbFB4d0d1emFW?=
 =?utf-8?B?Yks1VWxEdWVCMjZ0WUNya3N1RGFLZ05RcFFvTkRIUjVBQnJBckVzeTZNYUNI?=
 =?utf-8?B?TWdGSExmREpFR3E4N3NFc0xMcEs5RitDa0xXK0s3bEgwcFNWR0NJZFJJTmM3?=
 =?utf-8?B?TFJCYmthb3QzWXhTczlNQXVPZzdQMFZEVm5hcmVtZDhManBTOGtvanhicjBz?=
 =?utf-8?B?QUY3YWYyUTBwSFlraGRuSDE5L0hqL3lza2c4dytOV1ViNiswaCtsVHF1SzN5?=
 =?utf-8?B?Y0tRN1RQYzdJM1NzWTJpNzVFU1F6NnVpN0lKQjFud2ZPT0gvMUR5Q2doa3hZ?=
 =?utf-8?B?aWV4cFZCZzQ5cGRmcFpXTDRYMnVkd1paQ3lGRHphamFsZVhpM1JVYStoUUxj?=
 =?utf-8?B?SU13eEpKakZUeFhCL29URXQxdDZIYmwwdk5nUkdDZWI1SGRRLzNaeGRWcnBo?=
 =?utf-8?B?QUE3QjFXTE5FS1k2dTBIVE9Pc0w4RGNBY0MvbFFnRmJvaVVCV1JJcDI5MFh4?=
 =?utf-8?B?MmlkOFRRc21MalRHWHV4RHdLZkJNb09MVzk0R1EvQ1lxN3pVcDIzSlY3eGda?=
 =?utf-8?B?cGtPdnVwUFU0TTFKV3JxdllqYk1GcENHRUUzclUvUjNxQytEdFFWSjRiR215?=
 =?utf-8?B?a1dFRGJxODg3NDc3ZHBoZmVGbTcvODc2ZjFObHIzcUlkZ3NkVFVsckpQOG9M?=
 =?utf-8?B?WGJWSTlHUnJEaGVMNWp5dDllbzQ4M2VDWjJnbjd4c2V3ME5FWlJucVZrbHo0?=
 =?utf-8?B?S2g1QnJBNzhQUHZMcGtUamJyellFZDVMek5KTGs4QmlZcy94N2huRXZzS1Fq?=
 =?utf-8?B?dW1TNjBJVFFWcENxZVpRcWEzUysreTAxYlMzYzZnV01mckhjSEpTeCtXK0JN?=
 =?utf-8?B?UVFtK3ZDT2VWbzloL0cwM3g2UTZNaUVmQ05iYmExS3lzS1JWay82NzVGVnJW?=
 =?utf-8?B?Q2RoZXRNTzVNdkpHZS9reXYxNEQzalB1UWZuN1VTR25VUmZsQUZndGVKMk9G?=
 =?utf-8?B?K2tCTTNjR1NHQitoSUtKSjRFTHdlRHFIbVJCL3Rzd05zSDlLTE55TFh6eVlO?=
 =?utf-8?B?Um9VUFhsaGdPM3MxR2swUjFPR2dCRGpRQ29MQkRWeUFsQ0VzUzZsTDZ2WElp?=
 =?utf-8?B?MGJOb2J2L3Y2cGxNblpnN1ZZSDg0b2toLy8xWTdtQ0lNUUgrMTd4Um1jZTRY?=
 =?utf-8?B?cjZvbG5ac3FVcCs3cjNOUy80c0EzMmRUbDMwcExuR3VkanV2aVZvUTRNS1oy?=
 =?utf-8?B?QUdwekpsaFZmK2JQMHBUTHM3aUp4VGVGU3A0aUZ1QjhURngxcFI4ekJseDJ2?=
 =?utf-8?B?WWhKbjA3T0JlbDdRT3FjaXMyVzRIM1hSRmpHNmp3OXVWdFZ2Rm11RHlZR2R5?=
 =?utf-8?B?dzZyOTZMWXczS1k1d0ROdVdyaVI2QnpiS3RmSXpqYWkvZnc0QkhEMWlVNEJh?=
 =?utf-8?B?cW9ZMDJaSnF1MnVHRXJsRXB5K3dva0oya2tnaDJlUVBqOW1WWG4rYS9HYTB5?=
 =?utf-8?B?Uk4wajFGeFQ1bm1wUGwrN0RKdG9nc0h0aTZ4dTI0UTNMKzUxM3gzam1HQW1K?=
 =?utf-8?B?dG9sTGVyaXJpckZaMVJ6RjdkR2Q3V0J4TS9ac2oyMWVnS2dzakN0UzR3NVVJ?=
 =?utf-8?B?TCt3TFhUMVNycDIwY3plRHVaNTM3b3kydzdFYnNkZmZDRFdZd1ArT1dFaFpr?=
 =?utf-8?B?Q0RINys0bERnUko0MmtLQXNxejFRMlhNaVJLSU92eE9ldFhTUkhSVjZuelZj?=
 =?utf-8?B?NzJOZm1ubFNwZWdxMXdZTG1oWTRYYXZMbmduL0UwaEpKMXhhRmNLQng0blhy?=
 =?utf-8?B?VGJsVndLUFQ1VG92Y2FsMHFCdG92Zm9ubW5DVDdtUU9oSEhZOFFNSC9mZVEy?=
 =?utf-8?B?dkpuSlZ2YWx6ekhwNVNWMEhoR2JZYjd4TWUxVm1QNmQydm9hTDB6VDBNMS9u?=
 =?utf-8?B?bzVsRlJCYVQ0QnNIL1hqVmVLb1hYZUZDTERMd05HTnZmS0tBYWxYdmdBeFlC?=
 =?utf-8?B?L1JuNjIxRmhzaEFwUlI2cENBVlRMRzZISUIyL204RXdGT3pPQ1BIc2dIaUFN?=
 =?utf-8?Q?YJtv3B2bhFbR10WKxBcLFw2vY?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5fb5f9f9-6fed-4653-5b50-08dae1957cf0
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2022 07:48:59.0724
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WVvXA6y78gBHHpW7OeINa+mU1EqS26x7BPgz0Oy28uo7iz/4hFefeodYRoR0Nx8mUyKPBQGvqA7FhiFJGH2Mpw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8482

On 17.12.2022 21:17, Elliott Mitchell wrote:
> Note to Xen and Linux distribution maintainers: I suggest this needs a
> point release of Xen.  A large processor manufacturer has recently
> released such a processor.  A great number of people are going to be
> rather unhappy in short order without this fix.

As long as we aren't cutting point releases on every XSA (batch), I have
a hard time seeing why we'd make any in this case. The change is going to
be backported, sure.

Jan

