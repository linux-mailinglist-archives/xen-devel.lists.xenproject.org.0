Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 22A4D5FAFF3
	for <lists+xen-devel@lfdr.de>; Tue, 11 Oct 2022 12:01:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.419506.664285 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oiC4h-0000Qc-CQ; Tue, 11 Oct 2022 10:01:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 419506.664285; Tue, 11 Oct 2022 10:01:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oiC4h-0000Om-9G; Tue, 11 Oct 2022 10:01:23 +0000
Received: by outflank-mailman (input) for mailman id 419506;
 Tue, 11 Oct 2022 10:01:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lm68=2M=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oiC4g-0000Od-26
 for xen-devel@lists.xenproject.org; Tue, 11 Oct 2022 10:01:22 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr140053.outbound.protection.outlook.com [40.107.14.53])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a7d48b1a-494b-11ed-91b4-6bf2151ebd3b;
 Tue, 11 Oct 2022 12:01:21 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PAXPR04MB9278.eurprd04.prod.outlook.com (2603:10a6:102:2b8::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.28; Tue, 11 Oct
 2022 10:01:19 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2459:15ae:e6cb:218a]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2459:15ae:e6cb:218a%7]) with mapi id 15.20.5676.034; Tue, 11 Oct 2022
 10:01:18 +0000
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
X-Inumbo-ID: a7d48b1a-494b-11ed-91b4-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NIfILdPyn/W44petXoqAmYP7ohhHMihvbANmnS6q01vZfBcFyZfuFtTbIMXGdGSOjkDgHMC58FvvW6OtbbnGsKc7OPeDTBHC4h7GDI+4s/Y6dqJHx5ykIrd+hFIeIEgsbtrGJ1Dcu5TUPdpD8Ee0MkbOv0H4X3vgwsKh42wVYQ9uxwXYSmnKUxnqA2kRp64m9gNCFQEgU72HoweFq/DYT2NNUMXFMbN90mn7fvSdaeB6NEtjoF2m91eKSOdWCmfpOHOCpp+gHMp31ldPlIp9CwCIp1sDguBfk1/sZ4dBDROKE8lGT608EkaPK2SYmeLghfW74z8OXwZ87rPVYUWutw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AxpY7tfm4Gi4neBIrsxFJNMvPDnzEcd6Y8/4zEBSaZM=;
 b=d4+mTBHfYbhCvT09yiunCkb7C2vD3edPoQdrTkuyijl7W/tfaZL4pOrGj1KPulN7PudcKcWU0sebadSAge8Wnsm1n+aqk/pnWAMIHbcE4FuQGUs+FkAZ9Ox2dKGaI17Z+bZYZnHx7hd49rHyp0/lZMJX5dwsrFAmA7l/H9fO1w14DhE6Oroozv0SVyrG9wB944ATaLjvHuYaUazKyFtlWWdDYrWF+MdwftQyzHgTe0U6unuJk2UnBXygcg4z7xP7q9Bh3Eh+Fpi5xz0xSZrz7Zx53kOtbT05E3KSkBW38a1nGA7e21luu59qxYc2aZpgj/9Lyac9jvRR8P2PgPaMtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AxpY7tfm4Gi4neBIrsxFJNMvPDnzEcd6Y8/4zEBSaZM=;
 b=RxTYsCaLCYPQHIP/9yLXpylrT6o2q7MkvK7SJqYluTyAaLurKWvLf5QqlAU6vzVSXWD2Yeg6BEDHnajSlFl7umSdnCg6/chR4dYZwLzstHVMpBKsLcYUYqU9lGqr4ZdVemTEoIOq/yrzf5Nc44aOQMaP/QntUf/AuOk1Zb8LnUodDVkZFAv4eCZiW+RaQPgsCaza5qrzBf48yxion+hJ1AHxmoJ4U114dSccmdO9GCqQTpFRNEAg6WcAV67qE56IAWzmHod2Qkt7V/QVXTL7NO65p4JNlQj0GAyUud56RqCIBxf56h25VeVQZsfWOAcsHtJF91SFc0Sm06wyqloIOw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <1fc32039-5a3e-5f74-d6ab-059ab8037338@suse.com>
Date: Tue, 11 Oct 2022 12:01:17 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: [4.17?] Re: [PATCH] x86emul: respect NSCB
Content-Language: en-US
To: Andrew Cooper <Andrew.Cooper3@citrix.com>, Henry Wang <Henry.Wang@arm.com>
Cc: Wei Liu <wl@xen.org>, Roger Pau Monne <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <b0103a30-22b7-c010-3e8b-6eab1c25ee47@suse.com>
 <f5851974-86ab-8da7-3b5f-4196faae7969@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <f5851974-86ab-8da7-3b5f-4196faae7969@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0120.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a8::10) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PAXPR04MB9278:EE_
X-MS-Office365-Filtering-Correlation-Id: 7780e50a-0254-46c6-4d05-08daab6f8ad6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	XE9LpqsQRJJM29YxtsuftOck0EFPaVlh0W8h3YmnuDDcAdvdMjkFQoupIraerCfppG+kh6uSELFQ4s0a2RB9ov2Pt8mESMnTZvfifRWPOdgXQHJo9zQyJ4uxjUkjiasNX8/Xq7SpguLGX0SzQuumFBPNHAaxcuxmc6S6/np71PBJNexafdrMW/Gk2wUz8AKxYZc8MZh1IlIcEqGAl9ZcMV5Kx4YFZsKY43QiYCrFvlbFYWppgxVS4kiaeVLXs/2J/qfsLTdg+atTnz/LO5KUCj9sZuAa9x/dIgX4WgBh64Yx7ECOmdS0X09tyNF0cG2KlbzqINL9UECg8O/uLufn6HWgsX5VToVHaypFr+6wQVoQTSGLNulwygt6vsPPrrc7mcLSBJUz87B2qdoVENNHQabKe3REOcwm8nWurmS/qXImUuBFfCSq2uAWfu3vTSUXQ0a+MK52efduecpwqcjdtN7uCm637iWI1zdOxuWCDib09jP5gzRilnTax6pyEzooB1a5WSEDnC/YMoUucAhBYIMpQHdGrV+0yoPSgkf6GqarXIafz46B2pH0r5ZHA6uIThVYOkNr3mJCgEoy2qVSab1SF3snk3/9V1cAsuqUUQ3pm12PbC84of6jzoq2/4i1iVGH9FXHh8M96mqMeLcL673DWbN6YRrYmTp9fpF6U4sLHFDV3CNd7rL/8gF2VOeP9HBgIyncguvFfd2+nBzMyo37i+yf+q+jJiSwG4lRXpIGjB0111AfBu7k5jo4NmF8ZwPx0/W+X1tuBVCoXodnyfLxVdWXj0+fPOegiMAlO4c=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(39860400002)(366004)(136003)(396003)(346002)(376002)(451199015)(54906003)(110136005)(316002)(8676002)(66476007)(26005)(36756003)(6512007)(6486002)(4326008)(66946007)(38100700002)(66556008)(31686004)(31696002)(478600001)(186003)(83380400001)(2616005)(53546011)(2906002)(4744005)(8936002)(5660300002)(6506007)(86362001)(41300700001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RXh3OE9ZUHhzTW1zVktBMUhKZ0JZamNqK0JoTzMvVlRLSWdMeS9vOEswZnV0?=
 =?utf-8?B?S3EyZjNManB5blI3aGp3ckdOTlVVcG0yYWtMSzBpRURxZVQwR1hFZ016Z1g2?=
 =?utf-8?B?Q2kxU3lQTGFiVjljdW5UQUxCckx0dmlQTTBaQ25NZGVFT0RqYjJFQzZkSytx?=
 =?utf-8?B?UlJPV0grZi9Wd2hWYXVhdTU2S1dvR05TZWFtYXprYlozY1pZSW1Bd3ZadnVj?=
 =?utf-8?B?eFZRUVd6WlI5ZUpuV0ZVaVh0aVZBOTc0WG44WDV1SGdlRzJ0QnRBUHcxNkxF?=
 =?utf-8?B?MHU2SWgxdWlrbVFseGJ0UGU5MDFyMGlUZVBzcUk4dWRlUzNUcFZmYU1LKy9w?=
 =?utf-8?B?M1BUYjBUeXFVN2xmRHlVVFZqbjYyZURQVGczTi9VN3N0dnNUWG0xTi9lbE43?=
 =?utf-8?B?cG5iNHNBdjBSR2phdERoQ2x3U0tTczNCR3V1Q0I3SkRFTnN2aGxvZjhZU3Nv?=
 =?utf-8?B?bGNPci9KeXNUd1ZINkhRcWI0TG90cnZ2R204ZzBGZS9nc0U4d3pLVEU3ek1V?=
 =?utf-8?B?ck5tQkZ1NGN3aURDaTM1bzdMZllLTXpPSG9hNkpJZ0FCTUhqQnkvY2x4dWY3?=
 =?utf-8?B?RDFXMUpIL09wYmxyZ3JaK1BoaXpHMnJ0MWNyL3MxU0ZRQmN5TWg2VXBYNzRq?=
 =?utf-8?B?cXVycnpWSFhrNlk3NWZxZHBEVjVoVEw0Ym40VjJ2aHgweDgyeGlLTSt0Rklr?=
 =?utf-8?B?S2xjRjVVVTlmWXJKdDJtNEsvRTB3dEdBZHpFRGpEckN5QVFOT0NYcGRFRldO?=
 =?utf-8?B?eHpmMWVQSkRkbkdaM1JIb0VicVhFYlQyNFhpYk52OEMxRFk0M1dQUDdjY3J0?=
 =?utf-8?B?dGhuMFZ3WHZQUlYxTDZldkFQTDBheEtVM3lJMXpmQWl1NmRFUTE0cUJmM1B6?=
 =?utf-8?B?VXlGTDhnN1BZbUI1UGh5U1RMZ0xPeWkvdDJxNmlNTFEwWVU5OFFxZE5MRW9W?=
 =?utf-8?B?UjgzSVFBOXpDSkU4QXI3eUpudGR0SnlvNkxiRTZRVHZJZWxmbUtJVnVuZkVS?=
 =?utf-8?B?NHVrMzNuR3pYemg4RU5NeERPYmpISm5JUDRIRytyc2lWajhDNDhscjNRNHJi?=
 =?utf-8?B?eVc1NnNYWmRVOWNnbXQ0amtjcHJWMlVCaWJwTEdlN3RiZE9Qems0TjhyL0Nw?=
 =?utf-8?B?WEpqUFRQak5WS0tGd1hYeG16d1BNa01weERkZnZvamlQVXlhaXRQdUpiYjZL?=
 =?utf-8?B?UFQybjZLekFQbnNEWUJCc1FjUDVYZktORUFkR2daNkJsS0RwTGdsdXB6NDFK?=
 =?utf-8?B?YjJ2RFUzNFNaZ1V1Vm9BaFluZm5iOElaZUR0NjFBWlp2cEJEQ2ZYNVcxVHVr?=
 =?utf-8?B?UHJVRGsyT2NHNkIzY01UWXJ2MWlNSG5Ddmg0S1pyNEwyVktLUlE1OWZ1ODZT?=
 =?utf-8?B?bHJ4bks4T2l5RVZpUzAzMGJkOUg5YjN6L0tZQlJPWEoxZnlpZFg0endWUE01?=
 =?utf-8?B?WENqcWZrdE5nOGdWRkRhN3dWR01rc0JhZTg3K3A5TnJETHZrL2xqQ0hpRUhm?=
 =?utf-8?B?Wkl3aGYxelF4MDN3T1AwSTkxclA3VXZzOU85OHpSbWJWZEk5eWJPSmE4YjhN?=
 =?utf-8?B?NGVkbTNtSUpPa245a0E4TmszSTAySVVrdkhMc21FaEhqbWZ5Y3ZrUUx2Q2FM?=
 =?utf-8?B?QW8ySE82dFhPNkJmaCtnTEgwenpNWnB6ZTAwcWZnZktwMjZ1cjlJOGZYeFJo?=
 =?utf-8?B?TVFqV2U4enFRYlgwNnZlN3dSRDd5ckRxVG5YemdQV1ljSzRKclVMQzIxNW4z?=
 =?utf-8?B?R1B5TERLeGxZS0d5ZHUza1ZqbGZIUDJsNUcyMjEwQnh5UmJ5UDM1ZE5SZ281?=
 =?utf-8?B?Z0ZLQjhQS2NDOWpncVpRWVc2K29WTzVIbTMxT0h5ekgrSzlqdHZRRVVRZnFv?=
 =?utf-8?B?UGlYdE9IbzFGRGFkZGhLT3lNcWpYZTJXblo0cEE3eG1JNHQxeXN2OUZTekFH?=
 =?utf-8?B?UExvMUJURmVHYzhaOXRGQk9wa0JmaFJiYU41MWdFVHBHSE0xL2dvN3RpaGo5?=
 =?utf-8?B?L1gwRzNHOFBVNTl3RTFHMWxhU3lTRHE5d2FMeFZGOUZVUFVjWVZGQUN5ZHV1?=
 =?utf-8?B?TkNsaGx1UnZDYnBCQkR0eU9qb1pwR20zV2IwZGlQd0o5a2lEQkQxcE1nZDY4?=
 =?utf-8?Q?8Se/ONQChukFaQfonbDIUyhb5?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7780e50a-0254-46c6-4d05-08daab6f8ad6
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2022 10:01:18.8647
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vbIzsf3b6vCTZeWdR/IbGTsx3f5zvmA+f9WvYzta0H0BZmVoY6i2VmH+PhpTvp/IQF6sgB7YMeQ0uwdD+2/WMQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9278

On 10.10.2022 18:44, Andrew Cooper wrote:
> On 15/09/2022 08:22, Jan Beulich wrote:
>> protmode_load_seg() would better adhere to that "feature" of clearing
>> base (and limit) during NULL selector loads.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

Thanks.

Henry - this was submitted before the code freeze, so you weren't Cc-ed.
May I ask to consider giving this a release ack?

Thanks, Jan

