Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 55D50431F5C
	for <lists+xen-devel@lfdr.de>; Mon, 18 Oct 2021 16:19:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.212353.370197 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mcTU9-0006bw-0K; Mon, 18 Oct 2021 14:19:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 212353.370197; Mon, 18 Oct 2021 14:19:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mcTU8-0006Zk-TB; Mon, 18 Oct 2021 14:19:28 +0000
Received: by outflank-mailman (input) for mailman id 212353;
 Mon, 18 Oct 2021 14:19:27 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=628V=PG=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mcTU7-0006Ze-OM
 for xen-devel@lists.xenproject.org; Mon, 18 Oct 2021 14:19:27 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 65c4b714-301e-11ec-82d8-12813bfff9fa;
 Mon, 18 Oct 2021 14:19:26 +0000 (UTC)
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01lp2056.outbound.protection.outlook.com [104.47.1.56]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-35-_TyS0lhyNJuCUH82H_6Wkg-1; Mon, 18 Oct 2021 16:19:24 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0402MB3392.eurprd04.prod.outlook.com (2603:10a6:803:7::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.17; Mon, 18 Oct
 2021 14:19:22 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4608.018; Mon, 18 Oct 2021
 14:19:22 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM5PR0502CA0012.eurprd05.prod.outlook.com (2603:10a6:203:91::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.16 via Frontend
 Transport; Mon, 18 Oct 2021 14:19:21 +0000
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
X-Inumbo-ID: 65c4b714-301e-11ec-82d8-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1634566765;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WtHjRJ5yE0K4RfhuQE8jW1K6AaQIVbvo76d+uTdWq2I=;
	b=jOl06+oiXnUQ7p1XyOY8BlczKuH5uEX4MCv7rBLJ80JmxxUFalUdxCTvDAB90kaLF/vPRG
	AzZpb5W0qQb/lo1DrT6Nj6JDOBa0CzCu2qvypuOBwyCcoi9GpARwR2cbb80HP+bEal/XEe
	gSc2t0QOk46hgESqw4G3OY26imwLot8=
X-MC-Unique: _TyS0lhyNJuCUH82H_6Wkg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Zbj2/hXHRZ9uZuy/ok/9Yotkcn4RxQ1anzbCU9KwrwnagSTbgN/sPwGwEVC0k2BuH+LPeOcyE97ykPXi+hB55/wPOQu/5ENT0PJL3icg44XX/1ueulH7+7kNEuwSh4o7e3Sf6M7WYgwr661nkiqZqyJ0OvY3siEPz8706ziLxCv9WoYQ2ogKBn9zQEDbu9CMPFvMssV48iZIDIG+t/ZsUvq4dLxLvJVxwgmKGK23kOb+Ywo0v9GfjxZOLC3Wzj/Rpd1/+bE8qIu4Ed8J4GHlT+z3ZLq8Z9Za9ZDJm0KQImdH2CamPRITU9Z3R0srw/G4HjLSqlpEbhSJv7elnOPl9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WtHjRJ5yE0K4RfhuQE8jW1K6AaQIVbvo76d+uTdWq2I=;
 b=Pz8jEA1uILPoKeczXHRDikkI48KOSue+IADdHCveo4BgXKhVaBy4S1YLG3KfS7hb4ze05aOMd8ACl4HbUu/o9wNfTPdlQtsXey60GpsNhsb+CqtzK3839cVZ70gCU1qTSU+hPJ+didop988RzrB7zxDMPepo58qZ5b0trcRpx8R5XxyD1VXdynrMmL8J0ieM58vIgV6Abl86p8XcwzpNcM0ylJCISKRy8b9rPaf0/n8gIGH4Ivot/namCzgvMDkARqkLI3pBJfYGECu/xVs0viHbv4t56s0r1EeALCcjBlAd1tQ+9cHal2dBftt5C/3L91uvYM2qxRmCG/cvyg5neA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: xenproject.org; dkim=none (message not signed)
 header.d=none;xenproject.org; dmarc=none action=none header.from=suse.com;
Subject: Re: [PATCH v8 2/5] xen/arm: Enable the existing x86 virtual PCI
 support for ARM
To: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>
Cc: Rahul Singh <rahul.singh@arm.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, "sstabellini@kernel.org" <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Volodymyr Babchuk
 <Volodymyr_Babchuk@epam.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 Paul Durrant <paul@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Ian Jackson <iwj@xenproject.org>
References: <cover.1634315461.git.bertrand.marquis@arm.com>
 <e2b10f56043155e4bb8eae824723045ccc042f8e.1634315461.git.bertrand.marquis@arm.com>
 <ca5558b2-25c6-90d2-284b-03cbbb02691f@suse.com>
 <FBC4FA6D-AF07-437A-BD81-52708B139070@arm.com>
 <8c99e635-9509-b078-2285-48fb6fb91507@suse.com>
 <46bcd42f-df4f-922a-cc21-a05821481754@epam.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <17fd4f89-9afa-f65c-c66d-1364d7474969@suse.com>
Date: Mon, 18 Oct 2021 16:19:20 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <46bcd42f-df4f-922a-cc21-a05821481754@epam.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM5PR0502CA0012.eurprd05.prod.outlook.com
 (2603:10a6:203:91::22) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ee2dd4a3-0177-4aca-2d37-08d9924247df
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3392:
X-Microsoft-Antispam-PRVS:
	<VI1PR0402MB33926C2E8FDAA8075E0CD039B3BC9@VI1PR0402MB3392.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	1EYEwMJWjfDIhCgSGvvOXrIywkxmfl8JRrMyNF0S33BswGwH8yeHxSZDPSR3MsybGTbizjCHZ/giKl1UnxD1Z+0S56asgLH4GmP+N05fbHEZRKRSD9jQSCK+3cM1N9LORABGG6+uO65j+EOc7Jk18oIdXeuTgg6I2wKxOV7OHSLRXUrhtoX6WW71fEzSOIEVxJwGy91zk2m8kZUrEuBObEmlZC810jM/SCW2bEMp6PdF3pKIpVbGMXAT8MlEvGacejmTx7khesmcUVFvF/9fj/PXlykj46kZSNIJidN/ZEQrbmg2kO2dFU+7zlxBsjN5O4ucDOenkKqcCG5OCag9mP07E5Wu2VFyA9V61ZSYomDpU8fPsDaLjmXRhedTvQd6UiEX3ZeuzFQIZ+e+/Hh3DDaZ2loDZAPnGIhQXiyfwHtaWZR/xGTWdDEe6EiMqU6VPAVBBFwEeDvYUDrc0S+/85A9j+nGEf9mt4SFVoW0LrJwhrdI+3f67MHAZqvn9oHLXz8gvXG7Hm/C5wI8D/ubdksPTjsn5gFl4AWMEou3JsIiMh+0vHkPf6YT+U3m06FTcEUVLgDYLEzLXNKzZgKeG147ANaHckbr+kjGb1ESzGIUSBOU2Kvn44Uk4hkOO4O6Ixt5SOlrDWhwSe3GGsIzIKdbU1gIdhbRDSYB7P/fIGJdk5K1bpJG3WM4rHzXOtgkRWm0qCOeRNy9UnRHFODlkTEuK4rtb5lUtz01OkPFLV6VomcWYo2pR02a9rOMc8BXI9sW5y/4H3A79aNjP1oJat5OW74uDuqFHHqi1foDnYZ6+1wZwRdvnqbkjtRzEc+lo9nG9sKh1doTSQNVXGdETj3SvjYxTJveyBuB1iQ3RA8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(956004)(8936002)(186003)(6486002)(26005)(2616005)(31696002)(86362001)(36756003)(16576012)(8676002)(31686004)(66476007)(316002)(66556008)(966005)(66946007)(54906003)(5660300002)(508600001)(7416002)(38100700002)(53546011)(4326008)(83380400001)(110136005)(2906002)(2004002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?N0R2OXdCSElJQ0Z1SnJOK292SlZaU1NLbmxyQ2tHenRKMmZ0UUtISmtPMWZS?=
 =?utf-8?B?Q25aV0l6Nmhzejc2ZEtBc0FZSy90TE9KZzErQXlTcldab2hxSk5Ba3dldDBM?=
 =?utf-8?B?ZEJET3dvWm9ZaUYvMG85Z09qSThpUW9Bc2Y2ZjBNelFTYmlEdXhINUYrN1lp?=
 =?utf-8?B?aStTSjlCSmVxVTUzbzZ0M1ZDbStNSHljK3R1NXhET1pocVE3cDVWdjdHM3BL?=
 =?utf-8?B?cERtQUcvK1U0aVhBVUhwaUVUc2s1cncvZVNwMXQ1VHNubjBTaW84YlQzQ0xs?=
 =?utf-8?B?TGJWd09mOC84NXdkU1Y4dUI4Uk5QRlpZZnNGRjdoQXQyYyt5TWtvdXVBQmEz?=
 =?utf-8?B?RlZlUlkvMysxMkplaExIc3VFcFdFR29Uc3lPRm9ab0RTamp2MHUzZGZ0Zlpu?=
 =?utf-8?B?dm8wOWIwdkpwL2xucEgwVXhTYWVQMzZrSzlHQWVvSUVaNlJuQy96bXFXNGRo?=
 =?utf-8?B?MmUvdnF1b3dEa0ZJKzdtdmJ1V0dpUFppa3FUckJzYkNvT0tMdit2MkJ1TmZ1?=
 =?utf-8?B?Qk1LdTlyMVIwejdnMnRLckZBNk8yL21wS2dRRlVweU1aLzAvS0ZLckZwZnNY?=
 =?utf-8?B?emxwaURTSS8ycXE1S1VzbjJUdUcvMzF4SUZzM2RpY3ViMXl0djQzeXdDWncr?=
 =?utf-8?B?Z1ZUdFNFaDJtVkhIalRabjZaUGdJcE9WNkVGT3hiWU05MjBxdGJKL2pHMlRq?=
 =?utf-8?B?bC9xNU8yOE5XUHM3R1RidWd4Lyt2SHRldWp0K2dhUVlMRVJhSm5EN1gvSEY4?=
 =?utf-8?B?NU5wYTlHOHpOL2pWbzB5RUVqb2tZMjRJZDJvUFAraXZWUWc2STJ6b0U0L004?=
 =?utf-8?B?OFNSdm53QzRjd0g0WHZBMDR6amoxdHVzalRadjNiYmw2a1drL3pGYzNoaW01?=
 =?utf-8?B?NTNxbFB4akRqOFdnL1pMb0lQNnRkc3hsM3pMa3o0eEovdlhjaWpyclZUUXZC?=
 =?utf-8?B?TGdrYlVzdGsrWU9OSXRZUkJYWExkY1dEc2RyTGNiOGJpRE9PNlFhK0ozd21p?=
 =?utf-8?B?ay9PQmFIYnMyQVVoUHdSWWRBWXd5cVJCdzIyQWhiMVMxRkRKNGc1VEdCQ1Fq?=
 =?utf-8?B?VWhFZ1NWbUZ5NFd2RGQ0UEkzeDRvN2YwOXVKSW1aSlhrV3MwWTc4dDVWcmVB?=
 =?utf-8?B?YkMzc2xKOFpmTWRnMXdNTldhYzlHNHpPVjZ2dmE5NndDS3oyVFdBY3FBcXJL?=
 =?utf-8?B?Y0l2cUlvb25mZ0RRRjBIbGN6WnNibVZGLzNmd2xLVS9USkZ6T0FoaUN3Uk80?=
 =?utf-8?B?YW1QelRxdkM3b21LRGxRZnB2L0xZbkR0U1lFb1djSFVPdFI2QjBFV2l2T3Rh?=
 =?utf-8?B?ZThQdDZPWVh4SC9KUW5KNVVrWEo3dEFzKzUxelJybFFobUxISW13TGVUbTNx?=
 =?utf-8?B?eldxcVl3QWRwYVNLYldDTWprUElKL2x1aEt2WFNqVkxhczN2cWJTZU9qZy9G?=
 =?utf-8?B?NVE0TDFtdVlqYTBDM0d6MHJpRC9XdW9FMy9aSEdrMWVLM0xiZnBpTEV3MEFs?=
 =?utf-8?B?RldjbTNMVVJnMU9CckpNa3BnVEJZenBkK3l4Q2oyQ2ZTc1c2MUV6QW0za3dE?=
 =?utf-8?B?YWIzUGh5cXJnR0N5ekJoZkd2cG0zRUkzSDd1NzZYcU40bTlEOW1MZzd2aHRs?=
 =?utf-8?B?MzRqT2VaLzRWNVhlQWNaMFcxL2xid29mODNybm85TS9wV2pYRlVXRkVVYkFr?=
 =?utf-8?B?ektSMSsxSEt5UTFhcVJHZmVOclRuSWNzUUZQT0Z3UkczSUlGaWhWbm1xVTFL?=
 =?utf-8?Q?wYnmh+9XfSzgRAe/ioO2Q6cZupVrc+N2LTFmixW?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ee2dd4a3-0177-4aca-2d37-08d9924247df
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2021 14:19:22.2290
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4ULIaLZwFk+/ZHOL3Hr+ofTKh9RKRuoDjYuAjW1Wo+PhjZlqXjik58K+AexAHCLdUFHjkl5huoHcvFLAlbu8uQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3392

On 18.10.2021 16:07, Oleksandr Andrushchenko wrote:
> On 18.10.21 13:29, Jan Beulich wrote:
>> On 18.10.2021 12:11, Bertrand Marquis wrote:
>>>> On 18 Oct 2021, at 08:47, Jan Beulich <jbeulich@suse.com> wrote:
>>>> On 15.10.2021 18:51, Bertrand Marquis wrote:
>>>>> --- /dev/null
>>>>> +++ b/xen/arch/arm/vpci.c
>>>>> @@ -0,0 +1,77 @@
>>>>> +/*
>>>>> + * xen/arch/arm/vpci.c
>>>>> + *
>>>>> + * This program is free software; you can redistribute it and/or modify
>>>>> + * it under the terms of the GNU General Public License as published by
>>>>> + * the Free Software Foundation; either version 2 of the License, or
>>>>> + * (at your option) any later version.
>>>>> + *
>>>>> + * This program is distributed in the hope that it will be useful,
>>>>> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
>>>>> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
>>>>> + * GNU General Public License for more details.
>>>>> + */
>>>>> +#include <xen/sched.h>
>>>>> +#include <xen/vpci.h>
>>>>> +
>>>>> +#include <asm/mmio.h>
>>>>> +
>>>>> +static int vpci_mmio_read(struct vcpu *v, mmio_info_t *info,
>>>>> +                          register_t *r, void *p)
>>>>> +{
>>>>> +    pci_sbdf_t sbdf;
>>>>> +    /* data is needed to prevent a pointer cast on 32bit */
>>>>> +    unsigned long data;
>>>>> +
>>>>> +    /* We ignore segment part and always handle segment 0 */
>>>>> +    sbdf.sbdf = VPCI_ECAM_BDF(info->gpa);
>>>>> +
>>>>> +    if ( vpci_ecam_read(sbdf, ECAM_REG_OFFSET(info->gpa),
>>>>> +                        1U << info->dabt.size, &data) )
>>>>> +    {
>>>> Here it is quite clear that the SBDF you pass into vpci_ecam_read() is
>>>> the virtual one. The function then calls vpci_read(), which in turn
>>>> will call vpci_read_hw() in a number of situations (first and foremost
>>>> whenever pci_get_pdev_by_domain() returns NULL). That function as well
>>>> as pci_get_pdev_by_domain() use the passed in SBDF as if it was a
>>>> physical one; I'm unable to spot any translation. Yet I do recall
>>>> seeing assignment of a virtual device and function number somewhere
>>>> (perhaps another of the related series), so the model also doesn't
>>>> look to assume 1:1 mapping of SBDF.
>>> This question was answered by Oleksandr I think.
>> Yes; I continue to be sure though that I saw devfn allocation logic in
>> one of the many patches that are related here. And I'm relatively sure
>> that there no adjustment to logic here was made (but since it's hard
>> to pick the right patch out of the huge pile without knowing its title,
>> I can't reasonably go check).
> Offtop: I was somehow dropped from the Cc..
> 
> Please see:
> 
> [PATCH v3 10/11] vpci: Add initial support for virtual PCI bus topology
> [PATCH v3 11/11] xen/arm: Translate virtual PCI bus topology for guests
> 
> [1] https://patchwork.kernel.org/project/xen-devel/list/?series=555481

Ah yes, this way I can find them in my mailbox. And indeed - no translation
from virtual to physical SBDF on the config space read/write paths afaics.

Thanks for the pointer,
Jan


