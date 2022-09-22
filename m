Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AE605E5B65
	for <lists+xen-devel@lfdr.de>; Thu, 22 Sep 2022 08:30:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.409965.652975 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1obFij-0008Vw-Tl; Thu, 22 Sep 2022 06:30:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 409965.652975; Thu, 22 Sep 2022 06:30:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1obFij-0008Rs-Qi; Thu, 22 Sep 2022 06:30:01 +0000
Received: by outflank-mailman (input) for mailman id 409965;
 Thu, 22 Sep 2022 06:30:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zSMg=ZZ=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1obFii-0008Rg-2d
 for xen-devel@lists.xenproject.org; Thu, 22 Sep 2022 06:30:00 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr20053.outbound.protection.outlook.com [40.107.2.53])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fad97ed8-3a3f-11ed-9647-05401a9f4f97;
 Thu, 22 Sep 2022 08:29:58 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB9PR04MB8361.eurprd04.prod.outlook.com (2603:10a6:10:24d::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.18; Thu, 22 Sep
 2022 06:29:54 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::358f:58dc:c0c2:1155]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::358f:58dc:c0c2:1155%7]) with mapi id 15.20.5654.016; Thu, 22 Sep 2022
 06:29:54 +0000
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
X-Inumbo-ID: fad97ed8-3a3f-11ed-9647-05401a9f4f97
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FR2DOa9Yk25QWyKRrpIuHh4XU8uQa/t2+2m7m7evkPdjo7UZk3tGntPnpZjlyyOKdMUn8KNwaY2Zh25emRmbJUdv9eEx8qMIN/FdDtIzkngTY3/IhnguQDe3KmhM7luD/kdjmZSE50bm74yyUENADSPYYtBLEE2xJGWWaJZLuXubUoGtgEnMKH9bktXunXBdExzfplhJ2su69/E5ry5xnudxhuWMztctVBtpb6k2JTa/VKv1I7UsiIYADuY/Gb7blZ/En6kpIWE/DmnPQkDoqSLof77wolAjXIEb3WN8Eyb6jXnTvP98fhOpknML2Lzd61FR2UVSzy+DxRkgX5irTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xx33f59HE4qsKi5XbvBgAzXBkgYjUtuyAaD64JbbLT8=;
 b=fpB4GnO32JmTXWYr2P8DW6qO58ImYkonfVH7QTwzsZ90J3Fh1+3CytVdKPvweceNjQhxxnS9BYPTs+eN/h/OTQzBECwYokvuGdlWTTtW/cvqbP2lv5/UH201e+mgN30PUdjTUzMVVR++Ef8vzsLwh7ZUiXCrn5mV1B/9sb1z4BF/IOfPuHWzQ2IPsYASU5cj+2ZSu9FECd5K0bpIQHWoTmxdmaemWR0aIkWuOrnuYhe5Zv3Gsh+cDaCX+4gjEe4SJxkBV/XIFeynuYkjU5+/xbRTRp6+q56S3zkuLdLQ7OqryaADDzIuzb+tUENem+AvElNdK/GgmDr/tskg6oBubw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xx33f59HE4qsKi5XbvBgAzXBkgYjUtuyAaD64JbbLT8=;
 b=Uk5f/smdXiewWOphMQGqBWLxSLNpssQAJpINwKLVq/W9W+RBMKgDTIN505/ygONIbVG5droacXC8eNMEC3K7Ug8HKNVRteH+mELCYRqhoV7IRtBoOQJf+tmDN4/nrbs7KI1bCDK3FjzUvmtopBBOlkTKfIPRy7y+yEcZSzAKNLk+29kz3vaZ9bNsf1r2QJ7OvJsFg8hltzTb/r8iPOVfpJoo+bmHpbeD9q+FvQcEW4HR3hioMl8K7vPgs7JqQzdX1jligQIkwl3VgqvxJKKgFsLKILm54DZLr5UoHuOjlCjIWmD28wYbTRcrCSYtcKgsbP+l9fYUgLE06z9vPzNUDA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <3394db68-6569-50fc-a3f9-95b9756a0d89@suse.com>
Date: Thu, 22 Sep 2022 08:29:52 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v2 1/4] tools: remove xenstore entries on vchan server
 closure
Content-Language: en-US
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 Wei Liu <wl@xen.org>, Dmytro Semenets <dmytro_semenets@epam.com>,
 Juergen Gross <jgross@suse.com>, dmitry.semenets@gmail.com,
 xen-devel@lists.xenproject.org
References: <20220713150311.4152528-1-dmitry.semenets@gmail.com>
 <336cfa84-2f32-286a-394b-fc596b2ce03e@suse.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <336cfa84-2f32-286a-394b-fc596b2ce03e@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0185.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a4::10) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DB9PR04MB8361:EE_
X-MS-Office365-Filtering-Correlation-Id: e5f20f74-6838-40b0-f3a1-08da9c63dcd0
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Her9xEebZawsgbl0GqtPlnPrS5PE1/F9BOM0/huTDRXeTuVoE7fDOpR54j3sF5cgY0nvZwTprUgDP3k+hY3MgmDfVY/GR96W5sBO4qvm7WxuFZWGV87WLlexdAG+izXUo9TzqVEbSPnutPEngzbwY3qjuWLKVsx8dCQCUwRs2dTkxojKeH4gpuro8EMdnXo44AtZKkvcKKLgPxiFF6NlGcfetaBH6Xc3H7l/nBVBTqHHhG2JNL1yjz5T+V7X7v8v040gXHWyiJCuRLc+K2jqf/GNY9iMD6zeA/RCdDxmSg7lyZv6AsIyN/S5otyPSPdj6xL5H70fUggzCNw2V+g1BXJ1AKRydt77ThpDDscjqAiPUusGIpwPn6HHf7yJpceyZfAH/BacdvBnmJ0TZzJNe7HQvMzXepK1UWPPsIA9JGoZAAM/JWNmLN6TzUQyWYTh1TCghDrKWaxJWn7eYVAE73gsnx/tWZaGR+C1M/aHSseZZH3st5rC6DreSiLNtSPHztBzoLTncmNNSJ8kRFNHP3Y7FeYkZCmqxOTxOKmEve79IewmtIUViv3gyZdk5xo8ju02RlW5mfbGQnCvV55WtsvFrWs6fdEvEGNZ2aUvmCcp0AxpkK3BCGh96GpjPrQrgh2axZImZ9A1RgA4ZntGIgZ2H6Cm67qF2iOJh//VF43OQFLSKxs23rUxNeXMi9LdY9/6QLa6oDgNSKJqa8IMhxqN8OdiViufGFrTYjORst8M8PTX77eRgleLTDAyTBbVwhXJvMrxXoTQ/HhN/zjyLjLEDbwkGeIRCxW+gn52tF4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(366004)(396003)(39860400002)(376002)(136003)(346002)(451199015)(2616005)(38100700002)(8676002)(186003)(31686004)(26005)(8936002)(6512007)(6506007)(4326008)(53546011)(36756003)(5660300002)(6916009)(2906002)(316002)(66946007)(41300700001)(54906003)(4744005)(66476007)(478600001)(6486002)(66556008)(31696002)(86362001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dzR5eTlsbUdsNWo2QTdvMlorMy9aNlV6OFZmc1hNUDlTYS95bUZSVXlPamtt?=
 =?utf-8?B?ck0rOUhJRllDT2x4Y1AxNHNlTFNBZUdFZXlVZ1VVRjZtZGNPT3RXQWozNzRk?=
 =?utf-8?B?YWh5bndEdGYzZEUwaWpuZGNtcGl6N0o1M2ZhdmdWMWZCZG1IL2hJR3VzN29l?=
 =?utf-8?B?eDlVYmcrN3M5N01OSzdDenJha1ZzazFLdlR4ZDNaNVJaQ0RUajh0N0FMRUVL?=
 =?utf-8?B?aHlCbmJ1SzhZM09lRGpSRzc3WktETWNab2NkZWJqUTVvZWtNd28zQ3krVlpS?=
 =?utf-8?B?MFNSbTFma0JaTjlKc1ZJWGUrNmpqOU5rVitaSEh1MVJIMjhhVkZSOEJjSS9j?=
 =?utf-8?B?Qi9XOHNDY3loL1ZTNkxGSk5EU0dDNUlEK0svRmpIbzRRUWlxUHQvSk53Vysz?=
 =?utf-8?B?M05zYzB1RWFYQXJ0eGhtakF3MTdYV3VwYnVBRHFBQ0RhTFdCdk1zWWdHNDRk?=
 =?utf-8?B?NmJ0SWVSSG5HMm1GSUFxZzdFQW5qYlNKb2I4R1lNWCtiUm12WTcwcnFvMWdH?=
 =?utf-8?B?YnpEYzlnUEkydEJGM1NzbU1PNmFZVWx1Y2NzeEZaeWNEcS80VE9sOG8xQUtU?=
 =?utf-8?B?c1NjK0kzQUcvS3JQSW9yVWRVOFlOYXZZS2g2NUFYQjh0d1haak9COUxhSmFr?=
 =?utf-8?B?WFhsYTBqNjJtaG1JVDNiTUdqTEplejNRSGlHcTMwSk9OTTFqT0JlU3NTcnk5?=
 =?utf-8?B?ak9wVllIeG1PNWZUc2U3UmFTaklyNjNmWFUwUHZmd2tqVnoyREJLS0laM3V5?=
 =?utf-8?B?aXlvNHcyMEw0cXpONUN4V0VIK01hRHRaMVZqZGkvdHlNZ0NzalJrSFhnWXhF?=
 =?utf-8?B?VXVNOHM1NCtwc2hSb3pUN2NTUUZGMDN1NklYM1dxWktLYklrNStzRUx3Tncr?=
 =?utf-8?B?ZmxJUHVzaWNjWkdkYXhEWEwvSExDeU9RcFFTNVhCWk9DekEzc2dyWC9VYUlF?=
 =?utf-8?B?NC9uOHl1MjlUeWg0M3krK1ptN0JBUW9yYnAzUWdYRmRUTjdaMjg4Nnl0SFY0?=
 =?utf-8?B?RTgvUlVMTHNMTVZlMlFlbjd2anJMVXBuTU9wSHJPUEZRL0w5OW5aR2o3TUZQ?=
 =?utf-8?B?ZHpNdUZYS0RMaTIvTEg0MlRYQnNBUEFSc2dnNU5DVnFFOU1SY3JqWEVVRFF6?=
 =?utf-8?B?dXhPdXhkdXU5ZUlLWVdibXJIT3FBWjhpeHp6L2xyb29QRzlNcTZnVW1XMnFO?=
 =?utf-8?B?T2V5SEpPbk9VWUhhNEU0ZlFPenY5ZmtQRnhqK09kV09KbE55Si8xL1JEZFc1?=
 =?utf-8?B?T2ZyQW45T1ZKNW91WktPOFcyTThyWm5jZnpFUk5OYVMvWk5FTktsdGFIdXdC?=
 =?utf-8?B?T1o3blM0OFAvK2FvN1p5bGE0SkdKQlBZTXF5RlV6TTUxQ2JsWVdrNXNpZnlu?=
 =?utf-8?B?bG91bEFuNHhpdmlrSHBHOU5GYnkvMTF4VEJnbW9VbzU0NTdGWDBieUVMZUI1?=
 =?utf-8?B?MkthbFIzbU54YVFXOWZQaWE5YlRDU084VVFDNjdxSWxiMzhReDNlT3Mvb2tH?=
 =?utf-8?B?NjcyMzJFOHJpdlNKbllqT1lzN3BqMTZwOHk3ZlBoQ3M5TTJrQXE0ZXdlUDYx?=
 =?utf-8?B?cU80WExCeHVBeDZDb0FCcmhKbVJ5ODdiWDRoQ1F0L0RxWExzejdLT2g1b1lv?=
 =?utf-8?B?dHM1WWVGL3BqanNIbDhhMWl6MU9Oem4rQTFOL3NJN1hha0RFcHU0OGxkc2pH?=
 =?utf-8?B?ZkhhRXZxVTBEVG8yRERNY2xLaTZ3OWswczZHSHYvSmtoTzR0dStoZVJxblRy?=
 =?utf-8?B?RW0rdGljVllLcWdGeGJyL3JHRnZoek93YnRRNThTSEhqaXlKM3lWUEFVUFQ2?=
 =?utf-8?B?NEYyTVNYYVZ0b0R1SmppVm9KUU1Ha1V0Vjc1Y2dDSU1haHM5czkrSTN1cTFj?=
 =?utf-8?B?bmhWRGtSa041bXlwWVI0bG9MRWRMYnl3a25XWG91N3JrUDVwbm5iN0pvazg4?=
 =?utf-8?B?TW1qMFNzTFFTTTQxL3hoMURTVmNQcVowVFJlN0Y0UzMvN3hHZWo5RGVsTmV2?=
 =?utf-8?B?V2lja3hEdjhaWjNBM2dENGY1NExMbmQ0UnoySGhLajdoWkV6QUQxK2hBYmRi?=
 =?utf-8?B?eEhqRnhnKzlLRCtBM2FvU2dvWTBTOUplK3JReDlDV1ZoYVJ6bDE3R2dHVTQy?=
 =?utf-8?Q?bl1qgeJIxdsudCJEAd0kkkEgH?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e5f20f74-6838-40b0-f3a1-08da9c63dcd0
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2022 06:29:54.8285
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FXDOo7ojQQ/ZKr03VnFjcLtmmDydJp/YBTuHqPRa5sQbRPtk4kI3oBMfaIge+Jqih3JA++FEj4NPQzkhPqFR8Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8361

On 01.08.2022 10:57, Juergen Gross wrote:
> On 13.07.22 17:03, dmitry.semenets@gmail.com wrote:
>> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
>>
>> vchan server creates XenStore entries to advertise its event channel and
>> ring, but those are not removed after the server quits.
>> Add additional cleanup step, so those are removed, so clients do not try
>> to connect to a non-existing server.
>>
>> Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
>> Signed-off-by: Dmytro Semenets <dmytro_semenets@epam.com>
> 
> Reviewed-by: Juergen Gross <jgross@suse.com>

Anthony - any chance of getting an ack for at least this first patch?
The others are more like feature additions, so perhaps aren't to go
in anymore before 4.18 opens ...

Jan

