Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 889EB639B00
	for <lists+xen-devel@lfdr.de>; Sun, 27 Nov 2022 14:34:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.448665.705292 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ozHm8-0001CV-LH; Sun, 27 Nov 2022 13:32:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 448665.705292; Sun, 27 Nov 2022 13:32:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ozHm8-0001AY-Gn; Sun, 27 Nov 2022 13:32:52 +0000
Received: by outflank-mailman (input) for mailman id 448665;
 Sun, 27 Nov 2022 13:32:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DJuD=33=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1ozHm6-0001AM-Iu
 for xen-devel@lists.xenproject.org; Sun, 27 Nov 2022 13:32:50 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20601.outbound.protection.outlook.com
 [2a01:111:f400:7eae::601])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id faf7e276-6e57-11ed-8fd2-01056ac49cbb;
 Sun, 27 Nov 2022 14:32:47 +0100 (CET)
Received: from SN6PR12MB2621.namprd12.prod.outlook.com (2603:10b6:805:73::15)
 by DS7PR12MB5720.namprd12.prod.outlook.com (2603:10b6:8:73::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.22; Sun, 27 Nov
 2022 13:32:43 +0000
Received: from SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::62cc:47ae:a750:8f57]) by SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::62cc:47ae:a750:8f57%4]) with mapi id 15.20.5857.022; Sun, 27 Nov 2022
 13:32:40 +0000
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
X-Inumbo-ID: faf7e276-6e57-11ed-8fd2-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OnkpVN0hdm86QEfUMAz7+46VHO84Ff/w5undHcCdwkrKxwa2OXo95WH+JNV+vhZZqfcMMJqhWYqBruHLF3ZT57ElKxjcWZ12wIOkhI4D4rP0YUA5iDTqlD+/weGNNFvtjr9/+RnCzw3KznTWMMeEBN1l54fnoNsiMFBI87lessrk2Pwb7nIptFx4ZcP6s9Ke+DGtBagHonHQ7b3RmGi/Pd4zE0tURG5UqPsIa8zel0ppJ9UMqdpACP4NumlxTHe5RE/prD6nig1kemkIs4bcWXDAzVdR+fWAZKkIUVX87j2BW5Ju3hgK59SYEp+iMjvInaMDuEJB/wT3Qr3adiXXWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AI6Bpawt/zYRo2wBr5OsW0H21+PjSq4U8+j/r+iLFGs=;
 b=GkcJJIDIQHc0Dr6qJBEhagfrzTZJe88G9YFgpLHrbbj8oZ7xBy4z2PfO+Dph1+Se60D2ArfP8jCd/t/tYZmCXySE3RbI7oRiHd2DkTTvU/Fiqw/arXAeLgTygdqiNKOUpUPlSmpLaEg6xxLRUBEklt4COvDV7uBZYM42PdeiOgxdkdQ7DwChtgdCRo468w4ky6bsTE92qyzKZTiF5GtDWqbj4LuVIunnhIVQTSj7GChzXgZnUNmFMOGqSw2I61CxXE6Z8KjuKytTX1HmOPDJsmZLq8h6YYC0zQLJZYDsAak0r2bU9iEVZXN5TFXf6aCwAcHmxbIqeM58V53Q4yKh8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AI6Bpawt/zYRo2wBr5OsW0H21+PjSq4U8+j/r+iLFGs=;
 b=J/ppLClsECYymFVEn3XDqxmQJ4aYAzQIsbdysKcG4PqvUJ0U6K76PemUXWDPgErpu5uYdbT0IDpEmqC5BokyHZ921wu2qrh/uK8KSz8lXOFwVa+3Qve457/461TBPKB6z8Vr8rqEAe1A5KlZ4g1tT0kEZS5GEGrkQXuoP5TvtDA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <382e5e7d-5bb3-7d7f-913f-842407d9414b@amd.com>
Date: Sun, 27 Nov 2022 13:32:31 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.2
Subject: Re: [XEN v3 02/12] xen/Arm: GICv3: Adapt access to VMPIDR register
 for AArch32
To: Michal Orzel <michal.orzel@amd.com>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>, xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, stefanos@xilinx.com, julien@xen.org,
 Volodymyr_Babchuk@epam.com, bertrand.marquis@arm.com, jgrall@amazon.com,
 burzalodowa@gmail.com
References: <20221111141739.2872-1-ayan.kumar.halder@amd.com>
 <20221111141739.2872-3-ayan.kumar.halder@amd.com>
 <8086e3ac-445b-17a1-bba3-078024ab2579@amd.com>
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <8086e3ac-445b-17a1-bba3-078024ab2579@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0383.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18f::10) To SN6PR12MB2621.namprd12.prod.outlook.com
 (2603:10b6:805:73::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR12MB2621:EE_|DS7PR12MB5720:EE_
X-MS-Office365-Filtering-Correlation-Id: 7d944c0e-5834-4daf-c99a-08dad07bdb19
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	W433uVDrmXzaw9+nzg5MeFMZRJX2SCwhS8YGMzbcGVYamayfY+ORLNdwnhbsznmNGUOIJcuf1ky4L1mqKXHAi6HwzgRZmKT4GfJxG0tPAPT9pNzjUvlsfqo70wthQOkBQdkMQnZS323K/YzEpaM7VvAaKi6YBhqFktoGX9+sNX76YgeDtftRHxWZARbvIMAEAgT+67uyz3azUoMv0/N3q+ipXDOppnvE7HcqNqJrkZVVtHenatVT8FY9JTS1XkJOidgu8bKK8bNiZuM7e+ap2tW0AKfOxA4hWmYBYwt7F0Fw9HOFmfMcEy5S6zJJ2AXSR25LcgDcFcOM8/J+To7YV8zrzRyFgS1Fs3h+S7rAxKVgOI4bL8oj+c+rrdB3eG/25XAcLoa76Pbfb9r96w0zs2A1rCn2S8kyyhoebDfLHzPF8WdX04zMc+Hd2ThkCjUE8t7O7QQLOuvjn7HeqA4xkdSz/URR2KKE7yqAfo3n5H/d6+UQq6f5JOl9x3kmmrnDMqOD/kP/uxMAzgZPtlsANNU2yGllKHFHImU9on3TnfyxWQKOtdeLLA5ObJJGKrNMC5JXL+DrMm5dbVq1YOzRsFArGnFig2ZZzS45ZeypnHWZU1bEwS09ziAIGEHDer4PsGIAlFgnJh4Qf2+dUJEfhYhSEKe0Zp4s2J6G3xUk29oDS1XWse6zvLyQH1zm+arh0Qt2jb/JJIMnE44DV80JmUfUhjtX8oC2RztIOxj+GLs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR12MB2621.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(376002)(396003)(366004)(136003)(346002)(451199015)(478600001)(41300700001)(66476007)(66556008)(66946007)(8936002)(38100700002)(4326008)(6506007)(6666004)(5660300002)(6512007)(26005)(53546011)(8676002)(316002)(31696002)(110136005)(36756003)(6486002)(83380400001)(2906002)(31686004)(2616005)(186003)(4744005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WHdjSkdUS20wM0pOUWhVWTVDVXAvTk9jRkZsMmpiUE52RUdmR2Myb0dWOWJj?=
 =?utf-8?B?a0pYUHBmWC9HS2dGN0FxL1JYUWlnT3pVZDlUakE0RXlTSWVGazFkN3h3bVRX?=
 =?utf-8?B?VW9LeVJ4RmNmREhJNEZGWVgvc0dhNEthOGwyeWNYc1FSOXhlTUFIQWo1MlV1?=
 =?utf-8?B?VEQvZXIzYis0b2JDcVFoZU43eHJiT3oxVG5aV1VqcVhJWWdkSTFTa1l5MUVJ?=
 =?utf-8?B?dkFQRUU3UHRPL3BySlB2VWxGTzBPL01OTy9yWlpsbFhNZnVYQ3BEZGNhUGVk?=
 =?utf-8?B?bWJlNDVvUnZLZXpxKzdEbWxpd09UN3c0bHl1Z3JnOEd6bjVhaWswR1FCcXE2?=
 =?utf-8?B?NzdDcC9SN1BjalYzblFOQnBzbEZqT2xoTHFvZG1ReXBFWWk2UjlnektyekNS?=
 =?utf-8?B?b1JFZ2I4VlYyYll4aUdJc2l2ZFlIWks3M0hoWWM5TFVvaTVIeUJ1MVpZRzVC?=
 =?utf-8?B?M0d1SXY2Q01aTms4M01uZHFxSUFVa2dCdlN1NDh6Mjc2cWJZaml5MHFOSXZJ?=
 =?utf-8?B?RjN1NWUySzRVTGtSMUg0cGZ4OTFLczFLTlYxakZFZmZWL05JSkpHNEs4Y3R4?=
 =?utf-8?B?bVUyMGtDMWxlN3MxY1dkbWwrdWdaVis4QVVUUzE1TkE5ZUVBZi9LaWRtQll1?=
 =?utf-8?B?dVhJb2xwbDU2Q3lnL29QVlFuVU83ejJxc3VOd2lqdTJQQkZmUnNNVlNxMndU?=
 =?utf-8?B?UFY0bWlWOFFVdkpaRS82a1FYV0EveW05SHZIc3F6bXdwZnpMeWI3WGxZV0Rn?=
 =?utf-8?B?TitFZFpGYzZteHdMWE81cmdnUUtQV0twOWlhUDdlVmQxYkdrbFd1YzBROWND?=
 =?utf-8?B?UGl6Q21JN0h4ck1ER2hqMWtMcWF5Z0VqTXRYNWMxVFFDMy9HcGwxVjZGb1ZD?=
 =?utf-8?B?MGZScUNDK3IwUldoTVFNaElMYkkrQ0xsVVBjNTZJRHNRWVpQZ3pIWVJiV2p5?=
 =?utf-8?B?cWpYc1hZTWozdDhOZ1IzZ0NrNThEc25DbFV5M28rY2tmV2NLbHpSUDdFRllN?=
 =?utf-8?B?ekc0T2loZEZtZkpIK2hjdUd6WFgyamxxVWhHM2tyN3NIbnhvTGpDOTVteFNC?=
 =?utf-8?B?K1lMUkl6WXhwZ0daZTl1Zzg5MTBBVTlpZ3hiTHM2R0pQaHJkQml0ZmJZWjlB?=
 =?utf-8?B?Vzd4b0p6SkkybWhLRk9DSk1KdnFKQUVENkJHOGIwUEhJYlJtQjRsSUFnWUVP?=
 =?utf-8?B?aUZra2NVWDdJTzM2c2NMaFB6QWV0djFnVG85cnlPQlh5Q0d0K3l2TWE0YXE3?=
 =?utf-8?B?b0Z5L3A3b2VuaE1XeW1qcWxEVHh3aG8vLzVSUnhHL2UrSTk0SEdCL09XNmpz?=
 =?utf-8?B?NFQ3WWt0VDJGUW45RXEwbE9FK1E1K1Y3SlRTOUE3VXNTd1BBL2ZuTGpUdjE5?=
 =?utf-8?B?cUNJOHhOUmhjWVl6bkY4Nm9Da1BRelZlRzlaaFZHN0xKRHdZUGJnSjdVRGJC?=
 =?utf-8?B?M2swemlLa283SVRhVncxU0thOTcyYmE4N1BPZ3EvaVNwWHNibDY5T2pZa3hK?=
 =?utf-8?B?WFZPU2wwMEVmMzJYR0RiOE9HMWVsVDRiWHBSMEJMejh5Qmtta1hDSlo5Rllh?=
 =?utf-8?B?dVh1ZkpFYzNsTDVKTGxoa3JMa0ZyLzNNN1JBcXltRERVVTkzalRBdUdCNlcy?=
 =?utf-8?B?ZHdvVTcwNi9NRUx4Vk41M0hTMUV2NEZEd3o3WmVEdmovd2R2YUx5NEdJZFJu?=
 =?utf-8?B?OUhKL2VZbEtyZzFqUW1HaWtNeXE1SnRiOW5Eckx3T0JoQmludUJxRndoUVpT?=
 =?utf-8?B?amdrYXVaT3p6K0JtYXpqQVE2WEdhWWozaVJ1NDZ1ZHNVZjBwNGx4QzVzaVBa?=
 =?utf-8?B?eThrMWE0Z3o3RWtNWGVZRzVVekg3TmhBbG84bHdhd2pyb2xUOFBMQzAxTnVu?=
 =?utf-8?B?TnViZStFQm5HSGNvVTVtbTNzaE9vTXBvcmtvMGNsa1BrZHpXWjM4SWtZVTVC?=
 =?utf-8?B?bWpJVXh0c3V1YkNIOXoxa29HUTByWE14cklPRjdhMzdwZFE5Mk9Ed2JiNkNS?=
 =?utf-8?B?UmJEMGhtNGJza0RFakh4SlVJeEZBT2VQQ2UvZThKNHpuOG1yM2JTTkdtWWlH?=
 =?utf-8?B?UEJjdUZCQldLVS9WWS8rYis2cENwallZVnBRVHB6MmpRaW80VzMzTHBoNHJS?=
 =?utf-8?Q?QAvJilrnleGTOzAnObgq2NOsP?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d944c0e-5834-4daf-c99a-08dad07bdb19
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB2621.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2022 13:32:40.5707
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RYV8JX5uHfENFrZrNfWFzvPYYMqm2VlQHfeI54mEvo8rwDe2JxDDENf5cB/2oJvsMQ8RO3fmru7OB0LTwtVCPg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5720


On 17/11/2022 13:39, Michal Orzel wrote:
> Hi Ayan,
Hi Michal,
>
> On 11/11/2022 15:17, Ayan Kumar Halder wrote:
>> Refer ARM DDI 0487I.a ID081822, G8-9817, G8.2.169
>> Affinity level 3 is not present in AArch32.
>> Also, refer ARM DDI 0406C.d ID040418, B4-1644, B4.1.106,
>> Affinity level 3 is not present in Armv7 (ie arm32).
>> Thus, any access to affinity level 3 needs to be guarded within
>> "ifdef CONFIG_ARM_64".
>>
>> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
> Reviewed-by: Michal Orzel <michal.orzel@amd.com>
>
> although, IMO the commit msg does not reflect the change (i.e. you do nothing
> related to accessing MPIDR, but instead you are just not taking the Aff3 into account for AArch32).
> Also, I'm not sure why you used VMPIDR and not MPIDR.

Actually MPIDR in EL2 is known as VMPIDR. So I used this name.

ReferARM DDI 0487I.aID081822, D17-6354,D17.2.152, VMPIDR_EL2, 
Virtualization Multiprocessor ID Register

- Ayan

>
> ~Michal

