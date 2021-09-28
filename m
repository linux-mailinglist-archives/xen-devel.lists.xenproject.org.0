Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D5EE41AA17
	for <lists+xen-devel@lfdr.de>; Tue, 28 Sep 2021 09:51:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.197734.350953 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mV7tI-0001dI-IS; Tue, 28 Sep 2021 07:51:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 197734.350953; Tue, 28 Sep 2021 07:51:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mV7tI-0001an-FM; Tue, 28 Sep 2021 07:51:04 +0000
Received: by outflank-mailman (input) for mailman id 197734;
 Tue, 28 Sep 2021 07:51:03 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=3WUc=OS=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mV7tH-0001af-KZ
 for xen-devel@lists.xenproject.org; Tue, 28 Sep 2021 07:51:03 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d3153dc8-2030-11ec-bc72-12813bfff9fa;
 Tue, 28 Sep 2021 07:51:02 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2052.outbound.protection.outlook.com [104.47.12.52]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-25-SOftHYKTMMuythZLOczN5Q-1; Tue, 28 Sep 2021 09:50:59 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB2959.eurprd04.prod.outlook.com (2603:10a6:802:8::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.15; Tue, 28 Sep
 2021 07:50:57 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4566.014; Tue, 28 Sep 2021
 07:50:57 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR2P264CA0003.FRAP264.PROD.OUTLOOK.COM (2603:10a6:101::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4544.13 via Frontend Transport; Tue, 28 Sep 2021 07:50:57 +0000
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
X-Inumbo-ID: d3153dc8-2030-11ec-bc72-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1632815461;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WnWXYj8LX5CKb3mnxa2+jCxX1IwAdl0UKdT7BrkECrA=;
	b=bwV9SlRBAI5AtDMewJtJeQJJwGVBqIoLiqr48jxTVCgipmFcm9LxLYcxc/xMcNpivsILt9
	oUTv0VkKB3qQFpw946cHwF8RiZUkfPoHb6zu0J/NyMfYgNHDH/AURz6Ag56G5X5zB0Fq2+
	diWh4cLTzn21lLeohUEaT4+GN0qeM3o=
X-MC-Unique: SOftHYKTMMuythZLOczN5Q-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kafbRu4WxxJzJzkxEkfhyx2hPqc3gzj+y/Lv5Js/41K6/Ruu0xJ3vpxeB+o19saSkzrcnMRohihUiFvMHjm0ukkH6R15Oi+J6g3K7h2/qXrvxbD8UmfZAtC1PvHUH1asgP3HxKuvX5fb8zxqWLJQ4AelskMCTjB0rdQzt65Tx264bTU7+6XZG1mD8iVSGuFiv0xGpq97M9YES93FZs0F/RKUvq5zKuSV3i9KqN1t6KOAU4oj94t0sdM2+VRRUkrSGUjepLW8fRKSJpBn30POOuouARvOEt+qG/kQOrgn535H4wsGn6AM+LIt9J6YFQd/Hi/ygeA9gTu5o6AFa//Clw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=WnWXYj8LX5CKb3mnxa2+jCxX1IwAdl0UKdT7BrkECrA=;
 b=fIyeAGdVmwrsvl8FZADDpD1nfm4RI7J7NR35nKurmHcuY91xPgMhgMPvXFZxNNDplcFPubFDra1r1Y3uguONC4yDlU50yWnx8jlM2ILPgAPdahP7gMhNwRZ5ZqHjBSkzc9t+RZPoUG8fmayYgG9fNq2sk6oIjCDx0VkYz9nnMWtvJeUQ5ih0fk+CyNZ30o3CP4bjgxxBcgpWBGNGG5WPF4mfKb/KlaHKnj9BtJx5xxCBeWEtu8/gJlITTrhcFBQtRvrdjbAbLwpfzH7yp8RFjqCzWl+CrL6L81RQB6DhCd6qyYUj3FBCZnzQywVjJTcbJFwp5BStA03wbb0tz0W2ug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH v8 6/6] AMD/IOMMU: expose errors and warnings
 unconditionally
To: paul@xen.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <d249a759-188a-d689-316a-4743922827e5@suse.com>
 <dc0cd7f7-a313-099d-3e89-e3862ed11f43@suse.com>
 <ba9fe216-32a8-ef6d-173b-4f0d31a20db2@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <707b7bdb-bf81-8c16-a7a9-f55256f53ec6@suse.com>
Date: Tue, 28 Sep 2021 09:50:55 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <ba9fe216-32a8-ef6d-173b-4f0d31a20db2@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR2P264CA0003.FRAP264.PROD.OUTLOOK.COM (2603:10a6:101::15)
 To VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 353aa0df-d8be-42c6-a0f8-08d98254b521
X-MS-TrafficTypeDiagnostic: VI1PR04MB2959:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB295971C769F5EA26141F8347B3A89@VI1PR04MB2959.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3631;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	idX5zBhcqXW2M0aKU9TdgSMLY9KxMjmBrdnYivkqN1RTN4rW/1Kx+6d5wElwdpQmy1gDT5tX1TV7uyGgpmwI0zSuoe31XABHkW42brRWb4pPhAHlcGp61Uqco3b4ZJjObPaYI68zXBrxW/+795TEbQU5Dfz1dhUB6RZeWG2sTNdEca/1V4s9Z+D9qahxODDD9MP2o6Rue5eZ4ClJqlvnF+VJRZSj65SihYZYJ40X0DkH4VKR1S2zY8f1ov/Ye77o1bZjuFRwmJeqKrNiuYox+g1YYNkM4lJnNrtiHt8p3PNvLq9KdvgmYP/kGeJ8Udr1qEQm5P7u3qPKtJcN8RnL6+LgkaEyIBmZdXIne5S7UHsh3Xn6mqe/6wuMtIZXvSKlmA4KQqs41zk+eXFdd7Hzp8RNaHkp+KER++rwBfxuv+yxpOfz/Uv/pGABxmfdjr6YBjywXecY+disW67lX73J8VpZznUyJeZLYugYI8ZSWEIzM8AJ61l0/ZfNw/JGMJdZSQVvPurcbeUf+QaG5P2E9j59Yz9EZIvQhWIkY4C/Kk27giCNIQYoXf3/9knYymcjV6uicU6YUu+y9zog5R+26qKhGxUVes0kpNBy+lNfXskh9ZFK+jlNQ2idfO/+eOjWWlkguSmIkk+Hv4uus6i2wagqOr3XTELTJMKv+2tJEuciMX8xDcXhepZxYdHc3HiLnHObuDsulKI4MFcYsaacxdU9oBH+b/8O/F1JEH/nRgfyfAL9cP6E7U/yc+18Sg7H
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(54906003)(26005)(16576012)(4326008)(6916009)(316002)(2906002)(5660300002)(38100700002)(83380400001)(36756003)(2616005)(956004)(8936002)(6486002)(31686004)(66556008)(31696002)(8676002)(53546011)(508600001)(66946007)(86362001)(66476007)(186003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WHIzSlRnQVU5V3RnaFZTaUxFQ1B3VUl1VUo5TnNwcW9DbEQ2K2ZSdnZPeXVW?=
 =?utf-8?B?alBMREJ1U2ZLQkhLY2ROMmtjNjNqT25jQXc0RzJ3RU5HM0grRk43SDEzODlh?=
 =?utf-8?B?SG8zREU3NTRodENxcmJFREV4b3g4VTNuVHkyeFM1MUdIVU15a2VlRjlOckll?=
 =?utf-8?B?UC9IeDcvcmVBTjArNWhGd3hraVVBbExmbWQ2SXVuejdLM1pQbzNUYTVrOGZi?=
 =?utf-8?B?bjRoa283Mm9pTmNZM0d1VzdCQVRVR0pNdFluS0hhTXczczZsK1BHU3ZYUm9I?=
 =?utf-8?B?OC95NGdvNUg2VXBrbVVkUmE4RkY0YkpIVmxOWWw0SGt6dncvelpSU040MGdt?=
 =?utf-8?B?c2pEWmwrQlZnQnpsNlVGdW4ySXNaRXM5R3hqK0xEcTJjU3NkLzE5b1lMSXJw?=
 =?utf-8?B?ZVlsNXc5dEczM0RiMVlVdXlrL2JBaUY0RWFYNlZHQ1BlcUdvVURHNk9neDlV?=
 =?utf-8?B?REI3U095N3lUOHNCYktBWkFrdks2cEJpR2lPeFZpWktyWHozY2ZpWVJkcHNI?=
 =?utf-8?B?OW16UkdXQ2Evb1pCV3NWYkQ4MFJIei81Q1pPaVhiZ0lqOVlNUkVQWmpkN3VE?=
 =?utf-8?B?L0ozL3dUbVREN0xWVGp0UjlORXJRK1I5MkY2U0xaeVo1V3BjUDhyN2wwNG82?=
 =?utf-8?B?QUYxMFJGNFBTUUhnT0dFLzNiaWlueks3bVFBUnJqVkx6YkVUb0w3dUxELzhr?=
 =?utf-8?B?L3c5RXh3cGIxd2FrL1NMeUprU2FFdm5XRTUzL0tyZElycXMwL09VZ3cwUXE5?=
 =?utf-8?B?SS9mUXJDVzM5bEFReCtHOUlXblhZam0rTWhpSVl3eUM2REp2a3Y0STF0QXEz?=
 =?utf-8?B?ekxqQ2xnSkpBYy85UjFzakZ2aEpmUm1qeXNhWklFR3UwSFlUOFF1TGJRMEVL?=
 =?utf-8?B?VWFvbEtXSDZwWjYwRUh1ZnZ0aGdQK0V4V0xTNkJ0RWV1SzNYYjBZMHEyVmxI?=
 =?utf-8?B?NnpoK1pmeFByWDN0YXBSbGZNUmxtUFNyTTBtMmtMdk9CS0ZtYzdjV1A3Z0Yx?=
 =?utf-8?B?aTcwY2JnRmF2SVVzeWtmRktWT0VpZkFIMnY2MWYvaFN1RWo5QWlPV1dOb0hy?=
 =?utf-8?B?ZnU5aUtwL2l5YTBrWnJoaU9aYzFqN1VwZzVYTG1ZbmNKNFR1MUdlenk2VXRS?=
 =?utf-8?B?aVdaV3pSY1JUQkVqSFdqcEhJRXpHUlNQT043VlFZZE1JbTZ1R2djWDBNOG9n?=
 =?utf-8?B?a1ZLT3QwZEFhSkRCQ3AwS3NBVzR3aTJscTBrenRuUWlqbFhsOTN5OHlyTXVJ?=
 =?utf-8?B?MnJBK3NLbW8xYVh0OC84OTd4a3NjSHlnWWhPSW54TitVYm5salNsTEZIUTVX?=
 =?utf-8?B?YW5QZHFtdStYamZ3Ly9heGg5L2VWb1JuS3BMWjJSb29ycUZjUWJ4Z0FaTzFJ?=
 =?utf-8?B?b2FIRVNReWVVdzlSUFRCait4ZFRqUWFFSnNlY1dqeUVHa01HNDJ3UXNuQVdS?=
 =?utf-8?B?Rk5Xc3phY204NjhpWlJNd082OVA2TmpqaHhWYXNhN08xa3NQYzl0T2hpNjlG?=
 =?utf-8?B?bDd3UHZ0T0tMenJZRmdIcUZhOWc5YWVBY1ExS0JzT2o3dTUrRHNaeW1XMlo3?=
 =?utf-8?B?b3AzQ3l3WUk3dkdUYVBDYVpCV3BzK3Y5cEFLb0dDcjZqaitucUVtTW1vVmNW?=
 =?utf-8?B?aVBBV3pZcm44RVdUWHJyL2tWdlVlbFkxeTVhazNxMWFZU214ZHhjMVhVbk5U?=
 =?utf-8?B?blpzUHdNZW9pTjlNc3ZLdnpPZnNCTWRwMjVrNnZ3Vzc2eXhNRmRDWUJiRGxw?=
 =?utf-8?Q?+7MBH5n6qdxqMofkeJRUvDMicJU8yDpF9f0Nh/Z?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 353aa0df-d8be-42c6-a0f8-08d98254b521
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2021 07:50:57.8229
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nNktrPSy8p4ScvHfDmUljFOPMgTdvnbxa+6+gdyESZnZ5LxeDi09RdRquHurvROe+yr85kI9BOliDbwaBcsZ1w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB2959

On 28.09.2021 09:42, Durrant, Paul wrote:
> On 22/09/2021 15:38, Jan Beulich wrote:
>> Making these dependent upon "iommu=debug" isn't really helpful in the
>> field. Where touching respective code anyway also make use of %pp and
>> %pd.
>>
>> Requested-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> Reviewed-by: Paul Durrant <paul@xen.org>

Thanks.

>> @@ -515,14 +513,13 @@ static u16 __init parse_ivhd_device_rang
>>       dev_length = sizeof(*range);
>>       if ( header_length < (block_length + dev_length) )
>>       {
>> -        AMD_IOMMU_DEBUG("IVHD Error: Invalid Device_Entry Length!\n");
>> +        AMD_IOMMU_ERROR("IVHD: invalid Device_Entry length\n");
>>           return 0;
>>       }
>>   
>>       if ( range->end.header.type != ACPI_IVRS_TYPE_END )
>>       {
>> -        AMD_IOMMU_DEBUG("IVHD Error: "
>> -                        "Invalid Range: End_Type %#x\n",
>> +        AMD_IOMMU_ERROR("IVHD Error: invalid range: End_Type %#x\n",
> 
> NIT: I guess you want to drop the 'Error' here like you did elsewhere.

Yes indeed. Fixed. Thanks for spotting.

Jan


