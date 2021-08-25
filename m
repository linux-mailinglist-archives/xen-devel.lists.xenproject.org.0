Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 01E253F6FA0
	for <lists+xen-devel@lfdr.de>; Wed, 25 Aug 2021 08:35:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.171797.313496 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mImVB-0001Bb-8G; Wed, 25 Aug 2021 06:35:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 171797.313496; Wed, 25 Aug 2021 06:35:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mImVB-00019h-4n; Wed, 25 Aug 2021 06:35:09 +0000
Received: by outflank-mailman (input) for mailman id 171797;
 Wed, 25 Aug 2021 06:35:08 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5IQt=NQ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mImVA-00019b-GO
 for xen-devel@lists.xenproject.org; Wed, 25 Aug 2021 06:35:08 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9650a698-056e-11ec-a929-12813bfff9fa;
 Wed, 25 Aug 2021 06:35:07 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2109.outbound.protection.outlook.com [104.47.17.109])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-23-fOBA-kiaOBCKMkyQw6oYXg-1; Wed, 25 Aug 2021 08:35:05 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB6864.eurprd04.prod.outlook.com (2603:10a6:803:138::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19; Wed, 25 Aug
 2021 06:35:03 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4457.017; Wed, 25 Aug 2021
 06:35:03 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR3P189CA0057.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:53::32) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4457.17 via Frontend Transport; Wed, 25 Aug 2021 06:35:03 +0000
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
X-Inumbo-ID: 9650a698-056e-11ec-a929-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1629873306;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kicHXpv8I9S6Ejo5Pf2BRw/rIBC0mUy00Ns6/mfZ2/4=;
	b=dzw2eESILegruG/OBZj9/4TEtHYbudC29r6wi/gavUK0oHqkLsyCOue5vakrMxewnkOKzn
	/aZP7KuoB85zTA+3I1FIESwqm47tzsplvjlxQNLm56z87yE2ZGl6ULJAtQMpYHWnRHl5Zn
	ADz5Nlo3hsTJ7meCJXeCq5ngiRCUgiQ=
X-MC-Unique: fOBA-kiaOBCKMkyQw6oYXg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PAYIUY/HWtOH2tC8+Ru1S9qQnmrlc0RehQQG6vdQ+K6/OVxHCQW3CK9NVgNiF5haCotc1h36bBtba/JYGlyhzATIecOfwYYOhygjnS9d1UXuirCD8RlnMSrlq1nhzAVHaGrF4V4EoAPz0+LZ18Gw1MQoeVow0YgOI5ULBXheEb5gVh6aqZsuc1Nh9FrIgQR/3dqSvejp7HsYyEyd7vUi1b6g5HXfMd969Cs8dLS1pfn5zAEQZ5qZVPLAjLwKrKm5XDES514zw8gGkZ19rJglUQK8v79BNfYCdB9A/vL0CHT/C917GCg8SSSyQp1co8Vsn7VlPD3pCILRo273VuJCSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kicHXpv8I9S6Ejo5Pf2BRw/rIBC0mUy00Ns6/mfZ2/4=;
 b=GxGWaF7II3fNmP/htxSPAolI2y9YxS8JeRGQ49COIE5/CSnact2HVQ4cAJf6qlDyAHHqxLudHDlmiplOoezMuJ9in9OoQNRfwsjLjuYIZk940iU8o7XsFV73XEk3zf3YxHRE3iFeiC5rG2BWrhzVGLj/otFMGCGz3dtgVv5nwa2+jYKW2GZ4J0ZnoDddykAmPhzV/uZN+lnvMkeeizkfwxdXNl+H0k5ReDMQJZZqohsRm3UEQoP9zVPKJm4Qr89kmIQQwcRNaEZNTVDZt+D6vB11dSkYexQCAx5I1arPiIDnQZWcDwTya9sWDfv+W4hOEIcWv62nsyz/VJmHFERkEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH v1 11/14] xen/arm: Enable the existing x86 virtual PCI
 support for ARM.
To: Oleksandr Andrushchenko <andr2000@gmail.com>,
 Rahul Singh <rahul.singh@arm.com>
Cc: bertrand.marquis@arm.com, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Volodymyr Babchuk
 <Volodymyr_Babchuk@epam.com>, Paul Durrant <paul@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <cover.1629366665.git.rahul.singh@arm.com>
 <370f4f87c148eaee5ac5ec69346828e6473f0f2d.1629366665.git.rahul.singh@arm.com>
 <c4cd8072-e463-6c9b-ddb2-640108dd5d2a@suse.com>
 <53a61aa7-499b-f21d-8f44-a4c24f270d45@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <2b7c9109-cb8c-1971-3549-0c73059d7d44@suse.com>
Date: Wed, 25 Aug 2021 08:35:01 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <53a61aa7-499b-f21d-8f44-a4c24f270d45@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR3P189CA0057.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:102:53::32) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 53c5b5e9-5b71-4255-ae91-08d967927886
X-MS-TrafficTypeDiagnostic: VI1PR04MB6864:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB6864860433C43CA978A302C1B3C69@VI1PR04MB6864.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	hHWxdZJF4NSb6D6gYDksXyEjJ5XxsmNG40vL4lO9gKNrZIekc09TdGN2kkPykHpPVslocXe5gBnI2nxtMJkAt77PGMv7vcakRLALpQ2i17fCEavCwss/zuNKAmEp+lSONCYDBzneP7RKCw0+d0mgqjgbjRJ6A5GF54UZ/KBeIzmATIiWAG+jrpLc7/cwB1ycZs8u7GuKASpfzpORfhBZKmbqDejLUJuS7UtWwIn52Avt0dhxmvKtPEKq0S3WGCoM3finkOTANfFZ6kHudUArFlfG3UP0ySCWj/XI6uwZVef93Hl4yabl4YxiPIXGLwRx5USxRJtag2E1yYjAKjgNjO1WeZ1+TlJl8nOTax1bYIP8Tl951S9GaAGMSmOxwduNxCkIjss+r5eh2gBIX8QIq7EDnzUIF4Zf6yV52ahp6+5xW7KMwSmWY0zu0rORRIkkk1PfFKAdZ67IFT6/+z37fI9oj37dhZC4C1QSNKu5WjkQRZtuMWd60KFmfgT6/W8IyTaLJW46kZ1eOHcp2MB/hdov2/Yjap6sxHjFI0gAKGg3mH3hM0qCqXl7hK+GiPOrV3m6kLNjaJMvafhBEddJMDSQttGlWfnrh7jiiFwRxeSMk3J9Z9oqQt+syPzL6IsLmLaGtgJOZrDJWM/A+9WYDaaKFPpKmEDu+5sqhDJxq+NQWVm1WaMgAuyTJMoy2LoGchs/X5Sb1/KfuOClMkJYdkISvKcFP25lDic/Mv83ysQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(508600001)(2906002)(66946007)(31696002)(83380400001)(5660300002)(4326008)(956004)(8676002)(53546011)(16576012)(316002)(36756003)(31686004)(2616005)(26005)(6486002)(38100700002)(86362001)(186003)(66556008)(54906003)(66476007)(110136005)(8936002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SlpXVGVwQS9La1FLK1R1SEhlVXF6aW91VXVvL1dySWZhSEhyMm9nOSthcW9O?=
 =?utf-8?B?ZDRYdTVoYkpxUVc1N2ptNXBPZTI0eFpRTzRvaFg4Vlhza2I5WVAyZ1ZXU1A2?=
 =?utf-8?B?U25oN3Y5VzRGTHlneTNWSVNvWVVJMERhYk5PZUlVaFVLd0NaNTJPYytXcGx2?=
 =?utf-8?B?aGxBcy9CZ1lJRCsrSk9LeUVFQlpvWFphQnlMTTl4MVRyY3Bha01XRVBtemhw?=
 =?utf-8?B?aGxCREJvM3oxNm9la21PaDlJVTlGcU1tdDY3aHI1UG1vaUZLMGduL0Fwd0pw?=
 =?utf-8?B?U3UvZ3ZVbGpKRkJQaW15bjIvNlNpeEdqTlliUFYwaHJNcTJCb0xnS2hlQW9t?=
 =?utf-8?B?UXJxb2wzZjFoZWI0T2kvTkxzOEVwUTMrWm5VSnlBTEwwdHBVMjVQWlNQOGZa?=
 =?utf-8?B?UFJrTFA1K0hPMVRXMEZqQ2lvdnBwVG0yVjMzb29Mbk9CUVcvVUN3TVQzckk3?=
 =?utf-8?B?eXRKQ0h6N1JIM1BlbzYrbmdydTdjRGZwdERNMWVjNk42aHpxMXoxSTVCY2dE?=
 =?utf-8?B?YitETktRSEJmVmdUa0l4VS8yTXkrWWtTMExSaVFiMitPMFQrUkhKNnp0emJP?=
 =?utf-8?B?ODhjTXVtQUdCWStFL3pZYzduakZEYS9uWk9GSlh5ajJ2S2VoV1RKY29NaW9a?=
 =?utf-8?B?TzlsKzNNVUJGQmhQQjFCME96WktUbzZSOGlWUVpLKzhrN0VoZlB4eDhmeTBN?=
 =?utf-8?B?d2lGdDFHU0tqa0FBN0lIL3VxYWdYd2hPZUtsVEdFWC8xckR0dUg5UlNMdHFQ?=
 =?utf-8?B?UEZGREhnQkFuYlY2MTdqOG5YbUJITWN6N3BXTFZaMUtqU3RHUGJIQitCR2t2?=
 =?utf-8?B?cEJsd0MvNnFaQmpxQU1vOTZ3eTNBV2xpd2RrdG14Tyt1OUlXdnlDT2JzQUpl?=
 =?utf-8?B?NUVLSmVIMXcwbms0Q3EvaVhqR1czRStocklVRnVDU0VqOU5IUlhINUpIOVFD?=
 =?utf-8?B?Ym9FdFI3MlVWSEQ4eTJPcGRTeXVhOEVRZFBWSlZ5MFozaFpHdW1HaEV5OUo1?=
 =?utf-8?B?V25YT0F0Tm8zNWEvaVllTEFTS0hjakFhNnlIZnFvV2pXcnNZUE52S0xWbmlw?=
 =?utf-8?B?eWoyV3lCQU1mSmk3ckY2dTNLdE1GOWJvcXluUGdSNjRpSmNpZmZCZmtzc2Fk?=
 =?utf-8?B?OUhvOUFIYm5odmRoUjUzdTFIZ0JwcHpsbS9hRFVsRDZZOCt6YWltOHgyazBX?=
 =?utf-8?B?VDRRR2JkZHZGUlJ3TG1XSTFaVElJNFVWNHQrQ0Z1bUVFaFpKQ2QvSTd3RnR4?=
 =?utf-8?B?bjVFNjVqK2FickNtRXdPK3pjaEcrdVBSWkVqZlMxRjdKOUpvRmVQRjhLRngv?=
 =?utf-8?B?Nkdjd1VkZ2FENDdTSk9JcmxLZnJwdXI1bENhaGUzbS8xanJrMU1hanBYdWQ5?=
 =?utf-8?B?d3pJV2xURXVDQjF2elZzU2hYVndDam11STJoQlZFeGFmQTAvUHkrVDdFUmYz?=
 =?utf-8?B?SmNMZWpLOVJWTFM3YmhpREtSNGxRdUtmQ285VEg3N3RFQVFDL3REY1VxK3JI?=
 =?utf-8?B?R244anhlcVJseUNXSGJ1N3YzTXdyYzZOeEhOUlprZXVhc24yV1lyUmVXS1o5?=
 =?utf-8?B?cURQYUNjVm5aTzFXNlJqVlJoaTFpSnZvNE8rR0pzbHVqUm9pZ3N5TzBRblUv?=
 =?utf-8?B?STIrdTBNV2NJNGR3bnlkbDNKYnNWTnJmSUhaUENCQTR0M0VCOHRFc1pqaXdN?=
 =?utf-8?B?UFcwTjdhODh1ZlVCU1Q2TVQ5cklPSWFJTzkvcU5YRnBndW5rYXVrL1lnNWJi?=
 =?utf-8?Q?u8F3Lme193JaGNQEe9rU31ukfvBJKb04m1jgnIG?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 53c5b5e9-5b71-4255-ae91-08d967927886
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2021 06:35:03.5983
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zYGVrdPZ5xsjUOOJxdCKg84Mehzniu/ugVIANWeYvHB3ttacgGOnATh6oAx5+a12MpNPmV83E2k07freRoim4w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6864

On 25.08.2021 07:44, Oleksandr Andrushchenko wrote:
> Hi, Jan!
> 
> On 24.08.21 19:09, Jan Beulich wrote:
>> On 19.08.2021 14:02, Rahul Singh wrote:
>>> --- a/xen/drivers/passthrough/pci.c
>>> +++ b/xen/drivers/passthrough/pci.c
>>> @@ -767,6 +767,13 @@ int pci_add_device(u16 seg, u8 bus, u8 devfn,
>>>       else
>>>           iommu_enable_device(pdev);
>>>   
>>> +#ifdef CONFIG_ARM
>>> +    ret = vpci_add_handlers(pdev);
>>> +    if ( ret ) {
>>> +        printk(XENLOG_ERR "setup of vPCI for failed: %d\n",ret);
>>> +        goto out;
>>> +    }
>>> +#endif
>>>       pci_enable_acs(pdev);
>> I'm afraid I can't see why this is to be Arm-specific. The present
>> placement of the existing call to vpci_add_handlers() looks to be
>> sub-optimal anyway - did you look into whether it could be moved
>> to a place (potentially right here) fitting everyone? If you did,
>> would mind justifying the Arm-specific code in a non-Arm-specific
>> file in at least a post-commit-message remark?
>>
>> If it were to remain like this, please add a blank line after the #endif.
>>
>>> --- a/xen/drivers/vpci/Makefile
>>> +++ b/xen/drivers/vpci/Makefile
>>> @@ -1 +1,2 @@
>>> -obj-y += vpci.o header.o msi.o msix.o
>>> +obj-y += vpci.o header.o
>>> +obj-$(CONFIG_HAS_PCI_MSI) += msi.o msix.o
>> I continue to consider this a wrong connection - HAS_PCI_MSI expresses
>> (quoting text from patch 1 of this series) "code that implements MSI
>> functionality to support MSI within XEN", while here we're talking of
>> vPCI (i.e. guest support). I can accept that this is transiently the
>> best you can do, but then please add a comment to this effect (if
>> need be in multiple places), such that future readers or people
>> wanting to further adjust this understand why it is the way it is.
>>
>> But perhaps you instead want to introduce a HAS_VPCI_MSI (or, less
>> desirable because of possible ambiguity, HAS_VMSI) Kconfig option?
> 
> Eventually we'll have the code like that:
> 
> obj-y += vpci.o header.o msi.o msix.o
> obj-$(CONFIG_X86) += x86/
> obj-$(CONFIG_ARM) += arm/
> 
> So, this is indeed a transitional change. Will you be ok with a comment
> about that then?

Well, yes, as said - if this is a transitional state, then a comment
will do. I was suggesting the further Kconfig option merely because
all I've been hearing so far was that MSI works entirely differently
on Arm, and hence the MSI code we have is not going to be used there
at all. If that was a correct understanding of mine (including its
extending to vPCI's MSI code), then adding just a comment would
continue to be misleading imo.

Jan


