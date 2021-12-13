Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DAC844721BE
	for <lists+xen-devel@lfdr.de>; Mon, 13 Dec 2021 08:29:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.245822.424084 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mwfkr-0003LO-BV; Mon, 13 Dec 2021 07:28:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 245822.424084; Mon, 13 Dec 2021 07:28:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mwfkr-0003Id-87; Mon, 13 Dec 2021 07:28:13 +0000
Received: by outflank-mailman (input) for mailman id 245822;
 Mon, 13 Dec 2021 07:28:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=RwxN=Q6=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mwfkq-0003IQ-5K
 for xen-devel@lists.xenproject.org; Mon, 13 Dec 2021 07:28:12 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 39585372-5be6-11ec-a74f-db008197e53d;
 Mon, 13 Dec 2021 08:28:10 +0100 (CET)
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01lp2050.outbound.protection.outlook.com [104.47.2.50]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-11-6wdYklEcNdeN4HtyD8y-Bg-1; Mon, 13 Dec 2021 08:28:08 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0402MB3533.eurprd04.prod.outlook.com (2603:10a6:803:b::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.25; Mon, 13 Dec
 2021 07:28:06 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4778.017; Mon, 13 Dec 2021
 07:28:06 +0000
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
X-Inumbo-ID: 39585372-5be6-11ec-a74f-db008197e53d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1639380490;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tAmoCuDuA4Rpu4CReY46oI835jDUWPsgxCmYXHsXa+o=;
	b=VJj2vsIMi2gRAmjY7ZqumgngiYVWIhT8hNRO7KUhpl5r6DdV4FRY5Cytiz0zHghcPDUemA
	dxcZ27otSNgbMwK4ZeGhGdqHtQepMS/KHcyL+ly6BHqfI3TBcIOQNqH+kM8UYhaxrJdn5j
	GClYA6xKd66/AmqRPO5D3wNwpwQSN4Y=
X-MC-Unique: 6wdYklEcNdeN4HtyD8y-Bg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OiIpISJKBY6AmSiQIXqpjqU9mQPkTJBm9vYhqf3CUe7+fMev0TR2nIL0eCSQzfHdcQQCJ6oRXV0smNF1M6PzpSh62JBuiGdgNZntCwyCCIPZStDMdruZ3irsBplezHvsDPsDuZZaL0iLT7A/teFF6HBIvXgeRSlmmKslXOE/qaJCGlJyH+IKGaEXliz4AI70aGOSFqFMbKeKp/O9Bh0/P76g/RRM1OR3OLmTe7lFhSqTA1wrcST18DApd5zvP6iHhbJxlJvm+kAccOtS5RPI6l/r92sNDn9N84AScI7BrI8+8e0wbK6/lAEQQ7VCs7kX9n1mV4Mh2tCpz5r98uiCGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tAmoCuDuA4Rpu4CReY46oI835jDUWPsgxCmYXHsXa+o=;
 b=EBfoeoHcLlfX9VLm2gMl71/BZMZRMEbnNmXFDzFcO5igNSkoPL28iANJ59WFNHxwgPHfVjkHnbAIU9s7AfGYccWjwhzlu5VRZJirSXGMBUTEc0qKKea3bzlGneEJQDpoJqZq0aoEi9odZhcVRvPvoXcQH0FsSjCK8Isov28h07MCb3OndX34loGKy5tQQdUP98YJiF0SHBqYm3wFroR5OpKIlKXgiDsrrXRQ/jEIF57kyqxmlmnTnYGBG9HPHEH7u9KlgPaogSWUaeUwKAmS7d4AVZsGcamSD2OQXX9c/Ff2KnjBhna8FQbXg9cd0O3+NHaSGiX3qZpi8uq8PqB1vQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <078a2f3d-c188-0a28-6265-dceef41cd6f3@suse.com>
Date: Mon, 13 Dec 2021 08:28:07 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v2 2/2] memory: XENMEM_add_to_physmap (almost) wrapping
 checks
Content-Language: en-US
To: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <9725c93e-c227-f29f-07a4-65e383bb7858@suse.com>
 <0b68ff3a-3c82-f800-4d20-17eded13163a@suse.com>
 <612735b2-8af6-782d-35cf-526841109170@epam.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <612735b2-8af6-782d-35cf-526841109170@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8P251CA0014.EURP251.PROD.OUTLOOK.COM
 (2603:10a6:20b:2f2::13) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 245fbe6e-3248-44f5-1824-08d9be0a1adf
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3533:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR0402MB3533F4792E084AC8CD4DE36BB3749@VI1PR0402MB3533.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	r5+CpwhZSC1h7exntB4wokUdIJYYuN1oB0czD00ruOWZCLk0SDMqbYlOiWU+yzCW4bI3lxJXyb+oi//TpgswiWT9XNuEwsZ7pqmt5VvCIcIxtNJkowacUs2N6ilVMRt2w8d8LKRJNSvG9kpVkwEnTKQW/d/bGdRfERnSFDbF5DdEp4aetXlWrMxrJfBbYVuMsK2D/lt5vSN5AWJpCSoIlkAWBV5rwTqt01+5v3ho+8OIp1YOWF4wT9vFxuSVTlLlWL316U9MLe1jljMEQz90gzVN424aO/iPMMMuii3+UMEqb0ML5LZAJeOkZGSrRUKrdEkdSDDxpbaeTqvnbCCXYQjLJb4+BrIOa4lO+dWGtlOtWfDKfBB/eBKFVJp9lSieJf5/GMcQg70Ks9OaOb2wCUuOdquG5Ii6dA0aO1P7Q/nL2CXEZOqs0ZQbof3aDo8GS3XRNfPBxUWeYMC0+PdJQCMH0acWPaiC0vUgjDt9xQ5B3nWFrOglWRWTnrdB3ciRzF5oHa/HkuRNlpjef1jtDtVLHWMiGfYrp/H7nkA8nDg1U1GiDTXVL0zGLxtHWMpJrtX76mylV5VrRfGDnMXniP+0YxwPU2YEaM2zaefjv62magVp9dfKmWz/UXmEuBr4UG3rgbB63fesQeMOEsJbU3o8Om6eeb2xPNyMxZ7QAS9qeyP7OaT7XpzagOX9yfz5sbN7hl1rRiBAvBNPToRZAcQ2nZID7sh60nUwMnRgHlw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(66476007)(8936002)(186003)(66556008)(38100700002)(66946007)(8676002)(53546011)(6506007)(316002)(6486002)(4326008)(31696002)(36756003)(6512007)(31686004)(4744005)(5660300002)(86362001)(26005)(110136005)(2906002)(54906003)(508600001)(2616005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YllvOVlSMVB4RkNodDhQRHBObmpMTnNHNFpFbm9OcXpLSmFwYzRQdWdZbzlP?=
 =?utf-8?B?K3gwR0V4RW1zanJxVVdlNHh4SnpXTWFHSlZFOHFIREFsOHpRcDN1bmhaK2VM?=
 =?utf-8?B?amNQNWtzZXl6RVJDYUZaNnk3TTBNNDJVRHhoUEdtM3NxWXdXVkJQUFp5cTZU?=
 =?utf-8?B?VzRNRGdQWEgvNGdFMG9LL0pLdGFBeEZvZmcxNTdYd1dmbVUyTmovTXkzTkdL?=
 =?utf-8?B?cnY1Nmk2dXZZc0VsMjIySkdCNUlwQzRWZXk1RmhxcS9wSXlJZFIybEJQdkV2?=
 =?utf-8?B?MHVBRVplVkZGeXNpUVhTMzkyVlBOUE9LbkNFUGRWcTE3NVNIUDNMbkRjS05P?=
 =?utf-8?B?c0d4MEFPdzhCemlzUENRL1hxSGZ5Z1VCV1dadlJEWXN1MlVmOUtaQ3Myb0xs?=
 =?utf-8?B?ejE2WDBBbHZ0RXRrOU0wRVluclZneUJFdHRXWjNsVHJncWwxbWRHZUNLRFBv?=
 =?utf-8?B?N3hweVpLak5ha3Q1MEt5a2U5WFBuNDJFUmZpRForajFPZzlMVHdtb2JQclJa?=
 =?utf-8?B?djdGL1BOWnN6QmcvaXIyWE8xRUFiNFgrVElKMlFVQ1hrd0pNK0N5OGFFN0RS?=
 =?utf-8?B?V1k5M2U3TkxQZFdLKzljZmR0K3BkL2ZJSmJlNlhsZkNoUnNIU2lFRmd4THFo?=
 =?utf-8?B?ZlM3NnFGY0puOE5uM3ZXY0RWOFA5c0RjWGdqWjNmS1J1VUFNTC9QM21JOVZT?=
 =?utf-8?B?R2dNZzFJLzZwNjNnUlZkRDZJeXBZVTd1MldZY2crYThjRkNQdGl3YnRiYnc2?=
 =?utf-8?B?MHNPdWxLUncwYmVGaHJuTHg0clpPYVNrejlyRE85ZmxoUy9jd1AxNDdmNzd2?=
 =?utf-8?B?OTU1Q3lndG41YWpSYXZ3ZTBlME9EczJ5SGdjVkZWdUt3VE1MNFFQaFZLRmFL?=
 =?utf-8?B?SkF0UTdzSThqL2pJQ3JHcDQwcVk3RWYwdzlJYmZsejRlVmxSMDNnZmgzYnMz?=
 =?utf-8?B?Mi9tUVZacVBVei9pNEV4aERKMGZwSlEyT0Z6Zkl2S0hkWGh0TVlSYXFCclJR?=
 =?utf-8?B?T2tzTTNuQXhDUFkvbXUyUFNOK2txVi9tWVBOcjNSUThTQUZ1YWZzRnNVc0xs?=
 =?utf-8?B?WVFGdjYvVWtOTGh0Rkw4S2FMYVdQVVA5TDl2MzV2U2pEaHpkTVpwbzg2ZVl3?=
 =?utf-8?B?TllaL0IwTUJQaFpCL0lwaDhBbHZJcUNvSnJhWERJTmhtay8xMlB3YkxCRFZ3?=
 =?utf-8?B?WXhTVzVOSWlERE1LWkVFa3kraHRDbERreW9EVnlNUU1ENk9hRGttRkhVbVBk?=
 =?utf-8?B?cVNwbENxS0tUelJZMExaT3d6dDVEQ2ZMUDBNdjFmMVVzWHNVTWtJbjdPOFhy?=
 =?utf-8?B?L1ZzZDVOQXc4cW4vZ2JJLzlaRzA3ZEIwRjFpUnRKM1dSVjVuS1d3d0U1Tzha?=
 =?utf-8?B?blQyTUNhZVhzVnpqWmFhVEUzMGlNaFkvazRIcmpsczNCS3hYY3hkZk1xUXR3?=
 =?utf-8?B?OUVLRTNmdHVFREI3dWx5RWtSVjhFc0VmOTZnVEoyQy94aFBFejVreHpPdDcv?=
 =?utf-8?B?aVBYampnd3h4a3V3RUgzSHJOL3hNVmZaeWliVktPS1loZ1gzdnVCc1FpZDBK?=
 =?utf-8?B?RVlHRVJTd0xIaHNDblVrWGk0anZ0amIxaHdXenphNkZETGpINytTRTNPb3RW?=
 =?utf-8?B?RU5NZEdUMzhoU2dXZHp3YTVsOFlBUytaWXlER29ramZra1VwbGVZdGJ2TVdm?=
 =?utf-8?B?OEJqMHh4U282c2puQm1PQ25xM1dtTnZmdDY5RFl1RnBlaFg4MkpHZnJ5cko0?=
 =?utf-8?B?Um1QY0hqRElxQm5ZM1NkdmNYejJpYmxJMXUyTkVLS3NmYlZBbnlqaUxZTXo3?=
 =?utf-8?B?d2dGNDNPcm1nUlFXdFAwak1vUmMreTNRTElIM3pPQkxhYW9PVVkrNno1ZWlE?=
 =?utf-8?B?RmN2VmkzRHllUitXaGZlK2FGa1NXSlF6djhJUHFYS2tXZDZrc0dTbXZhbEgz?=
 =?utf-8?B?NWgvSEUxNFBoVlZMNTVVaU1XMEQwRUtmTHBsRzZsWlpON3ZSMmNkOU9tZng5?=
 =?utf-8?B?clRUamFtNjVNWDQ3Y3QzdndaNG9XaitBTkIxNzl0NXFCYXVqZU1McnVhay9O?=
 =?utf-8?B?clJCa0VadDQwOE5tNUQ0bm01SEhsTWx4N2srSkVSSzdQalU5Y3lpQzgvQmFh?=
 =?utf-8?B?eGhzRmI4RHkrdnRIWkdwUTFDUkhqeHdNcmovc2pRY05Ld2RVaU9pN3ZiRVJP?=
 =?utf-8?Q?EK8T5IygXsSOi5wWbVjpW2U=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 245fbe6e-3248-44f5-1824-08d9be0a1adf
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Dec 2021 07:28:06.1133
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bYLE7QAe3jVzuGUlAZMQP/slGdu4kT1UjcfDJVhf8g7QfBIbnKwX+iTLw2HPCfoIxI0dj7EtvK00TOvHM+dUPg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3533

On 10.12.2021 15:10, Oleksandr Andrushchenko wrote:
> On 10.12.21 11:40, Jan Beulich wrote:
>> --- a/xen/arch/arm/mm.c
>> +++ b/xen/arch/arm/mm.c
>> @@ -1479,7 +1479,7 @@ int xenmem_add_to_physmap_one(
>>           break;
>>       }
>>       case XENMAPSPACE_dev_mmio:
>> -        rc = map_dev_mmio_region(d, gfn, 1, _mfn(idx));
>> +        rc = map_dev_mmio_region(d, gfn, _mfn(idx));
> Technically this is ok, but reads odd now: the function maps a single
> page, but its name has "region" in it (which might also be ok, e.g.
> for a region of a single page).
> 
> I think it is worth either implementing full mfn range check inside
> map_dev_mmio_region or renaming it to something else:
> with mfn check map_dev_mmio_region will indeed be able to map
> a region consisting of multiple pages and perform required validation.

Well, I had no maintainer comments on v1 regarding the name. I'd be
happy to rename to e.g. map_dev_mmio_page(), so long as there can be
an agreed upon name before I submit a possible v3. Julien, Stefano?

Jan


