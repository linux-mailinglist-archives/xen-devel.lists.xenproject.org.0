Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EED9141D980
	for <lists+xen-devel@lfdr.de>; Thu, 30 Sep 2021 14:16:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.199792.354058 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVuzC-0002XI-KP; Thu, 30 Sep 2021 12:16:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 199792.354058; Thu, 30 Sep 2021 12:16:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVuzC-0002UH-HB; Thu, 30 Sep 2021 12:16:26 +0000
Received: by outflank-mailman (input) for mailman id 199792;
 Thu, 30 Sep 2021 12:16:24 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lHSZ=OU=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mVuzA-0002U9-Q2
 for xen-devel@lists.xenproject.org; Thu, 30 Sep 2021 12:16:24 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3a12fa52-21e8-11ec-bd49-12813bfff9fa;
 Thu, 30 Sep 2021 12:16:24 +0000 (UTC)
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur03lp2051.outbound.protection.outlook.com [104.47.10.51]) (Using
 TLS) by relay.mimecast.com with ESMTP id de-mta-2-4_WgSp7WOJitte5f-y4AzA-2;
 Thu, 30 Sep 2021 14:16:22 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VE1PR04MB6382.eurprd04.prod.outlook.com (2603:10a6:803:122::31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.15; Thu, 30 Sep
 2021 12:16:17 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4566.014; Thu, 30 Sep 2021
 12:16:17 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AS8P189CA0028.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:31f::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4566.14 via Frontend Transport; Thu, 30 Sep 2021 12:16:17 +0000
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
X-Inumbo-ID: 3a12fa52-21e8-11ec-bd49-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1633004183;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/NqxYuSK5poj82wwlDFvGZG2lRpG9jB2q+2T7aAqVlo=;
	b=QI0AadEEFjtavmayZJOqoqlmZyOw5PKNo9G86tQZzhjoIZOtCi74f53j67IGJpuMAEK6ti
	2XsjoFKujz969g5T66jt2CK9tklYLbEnfICSDKZ2szNPOZSoMqERvhrO1A5BxY3LbDpLix
	SQY9c/Cvjlk6HaYLhNK4UTNnKeiTdNg=
X-MC-Unique: 4_WgSp7WOJitte5f-y4AzA-2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ifElNPL8ivCsdVMzAXc5ocymM357vWVNWj+2KoAVTKem4Z8uo3uOk3lsqXh/PFnGfrzAKvzXjYgKhzUTydzPihZi02FmMjcqp2jZ+8fEzfaPqJ9O4CQpaZNAzMjsYEFzkKXnnxWR24xNx6uZLP4Mm1tjVgJY1bBkeaT2vOedcaHAT5Eej3UDk+Yzh37ZDKjbFGo+jxHvrqUKR2TEKK3UzPMrk8QTbnHtRdcYEpxx76Fj4WoLJAfF6RYFRFbIMxKcOs/Yk7lb4WWBjpySkDJ1GxIa8GvaPx95nH4ZRDN+8c/+45scCf7PUjZgkS8sNYfr5MrLzVcUrZRfMzoSlwxv8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=/NqxYuSK5poj82wwlDFvGZG2lRpG9jB2q+2T7aAqVlo=;
 b=FtPtM23utb3A1B3gG1FuTQdA4iP0x4YwzZyve2vTyJM+HS41jAA0UifkrFtFtFmzo7WhU1wZEMNZD7rL9mhCQfwTOwleSMURjUzzu7cfjiqK758XhEImBet6fDahTXmGWjch1fm6aoBExGjzzR3rhrXLiKV6PMZXbkn+0sUW/U3zB2TzODepRTpOPOcE5eyd6X+8Ndn7B+R6dSEjY4FodgqIpCHwbIjzifgKMp3RCUO54AS6nm/8b7RcvgkmuIfIlAN5qwx8M3inOzuiqh+NAhORg62WzrrCCSXA77s9fHi461TsiZc3+p9rRjZhJ6Q8oufPYCXrqC3B9IBDUO7N3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: [PATCH v2 1/9] xen/x86: prevent PVH type from getting clobbered
From: Jan Beulich <jbeulich@suse.com>
To: Juergen Gross <jgross@suse.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 lkml <linux-kernel@vger.kernel.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <9a26d4ff-80a1-e0c1-f528-31a8568d41f7@suse.com>
Message-ID: <d301677b-6f22-5ae6-bd36-458e1f323d0b@suse.com>
Date: Thu, 30 Sep 2021 14:16:15 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <9a26d4ff-80a1-e0c1-f528-31a8568d41f7@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8P189CA0028.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:31f::13) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1da47a57-0b3c-46b1-7b3f-08d9840c1ae2
X-MS-TrafficTypeDiagnostic: VE1PR04MB6382:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<VE1PR04MB6382FC63FF3E95DA554899F9B3AA9@VE1PR04MB6382.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	7QR4Zmvtm49JMRlNKmeBq+9giJSpxwDZ4rvpDcKPgLI15B8zOsI2fXW7DG91NqTRQffiXwx4+vcLPIzOqrYjQW/+v31FN1Ixus8ndNgGXXDnduTwH3ra21Hgx++pN0KprC8gWBUTXkmzqjVNDh5Hcx7IYk3qsQuVQJLvaAsRczyW7VNrGtferUuIBUFsGbKMW9MZyEuv+MbfoB5UEa2/7G5E5HM7nJ2NH5fvsWH7AXeUc63XkTeUGs2LfrRFHEgTQ0o+90kC9xGb9wOiRL6+S0kjpQuRVOIp5D4djv2m2zvEruK2pdhanKzVDch3kzMZBqgLfY8MNLoSRum2j8LgfeKicFJhAC8YXjUU6xjRHg+tDzOQUApZgNH8UnY/uzJvPB+E5d6qXhh28JmEvhBIyeufhH0hnSwcI9gfWEsoRnFwUYW/vSv6b6dwcD79J2im1oJEBd6QD2izhtOpFsoIVdS2vWvBdczza2AhI26M9Gm7rYR3NM/Nf6NImZJZL4WXRrm+ldkvpBs8IRpG5VsR/WdIZ1oGT5cqh6Jnhtpb+f1d5nW65hUGkYIhCAL6X807cXDQ31RIk86WwxWi6QFTwiRYSTh3q9Qs5AcXi9vuq8nBwgR++KKTiEjp7X5vs6AhjihDgJTTAVVzZ/rVRVRa/eofqbJQm8ibKjWEPdgO9mShuHjMDPKdeY6Ml5NiOKmgtg+mXBZAvvyw3dpMGlvMzj8MACf9Ru+TFxumVTXxuoA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(38100700002)(86362001)(31696002)(186003)(8676002)(31686004)(26005)(66476007)(4326008)(508600001)(316002)(956004)(54906003)(6486002)(5660300002)(16576012)(8936002)(2616005)(36756003)(66556008)(110136005)(2906002)(66946007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VS9aNDQ1SENwbGU5YjVqdkY0VUtORitRNUZ5bUx6NTl2WUZhb3NNcXhoamg5?=
 =?utf-8?B?b25mMjdIdTU4dzZaN3JBUGZHK3hibHphRUl0OHJJVjZwalZlMXFmQWNxYW1t?=
 =?utf-8?B?eVVOK2YxTDhsdFdWSTV5dDZoS1I3TkZNVzN3aitPVGtBTVcvQTN1b2F4bk9C?=
 =?utf-8?B?bjJRVWNsdWhJY3ZCN0VxRGs5bzlvRlV3RElNcUFRYnY5MnB0WlZVSldLM2Z5?=
 =?utf-8?B?TWFESVg0aWhFdGNYT2NhZzVnUlVoN0xFYWlLdGhzUmFiKzA1L0VURGJEdWlT?=
 =?utf-8?B?dkphNmtPWWRZTDcrV21ab0ZTWGQ0enlPckx3RUFSQzhibUYzL1Fhd3E1TERI?=
 =?utf-8?B?MzlzZHg5UkJpaHV3bWs5Vk9zcVBScFJIdEVyS3hTOWZtYkltTVkvVDFhV3pn?=
 =?utf-8?B?L2NTai94QzlDZlpLUWxSZFVnM1VwcElKYWx6MDJuYlBqcmtsclNicmdoNFVm?=
 =?utf-8?B?WTFoTkRxOFpLWXBxeEZ3QTdkQ1ZUekppckhMZGNuTmczd2xrcXh6Um5iZVFT?=
 =?utf-8?B?UnFOaVlmcnc5ZVYySm1scnY4aHBMTktReXNLeFBhTmpXZStvQlQ2MFBXRGFW?=
 =?utf-8?B?dWh1V1F5L2JLKzFWVStyZ1NtYW8vdUkrWjF6OHhVQ1ltc1FvM2pBUlA3dzRN?=
 =?utf-8?B?MnBHcUtsdEhJZUJHUUk2bnltNVFhcHQvY2t0RVljRWFQZ1pkL0paSFBYQ1RJ?=
 =?utf-8?B?b2pTSFNBMFNiaGhyMlp6VUtlalBZRElnU3BlMFJ5Z2tOTWRVMitlOWlNbWlH?=
 =?utf-8?B?b1ZoYkVDUlVDTFZ1YTlIMlBEWEFiZDNDV0lROHViYmNsSDB5RUNqeTZwMURL?=
 =?utf-8?B?M3VzYWNsaDBRVjIwTmZ2K2JIcnZnejdZNHVZZFlITEFVdVRNZWZuUWsyNXYy?=
 =?utf-8?B?YXlPNUxYamswc2x0UkVITzhQbzVLbCtpdnhoME1iWVdpSzJKeXB2aFdESDRj?=
 =?utf-8?B?N1ptcnZ2dGNHOUhNT0ZiYU9XYklqbUZhV3NFakY1aWR6KzZRVGw2YXhZVkZE?=
 =?utf-8?B?bmpYWWYyV1BRQUFHUktaVlJVK3JCenFSekZoSDhvekpsbWdINDRLNnpGS0ty?=
 =?utf-8?B?eG9TNDdVb3RLRlQrQTlOVlpyeWhZb0hSMks3STVIZlo4UjdrMklNY0o0NytB?=
 =?utf-8?B?UEFnNUxVSGNEckpzM3c3YmU3UlV5VGZlVzhaenl6dGJMRnpKTWZ1TlEyTVRG?=
 =?utf-8?B?eEQ4YWR0UmFmZUttVVQ0aEV3Qy9MbEFxVzVZUEdYa1UzTTliVjVKWnlnVHQ1?=
 =?utf-8?B?RExYWjV4YXlOMUdaUm5VOGxhRGxWa2JlNjNxajhBdWpyaWo5RjFvMEVCVDla?=
 =?utf-8?B?M0YxRld2YmlXUGpkelZaVEIzWTZLS1dqUm83RDMvQXlDU3VmdFVJbHhmOVJ4?=
 =?utf-8?B?UlowQXlXUGtmeXZzYmF5Tnd6cVdWaElJQW9kbGREN0ovbEdPMk95aTM3Vlk3?=
 =?utf-8?B?R2ExMlJRdm1XcFY5OTRpQklnbWF3WnBlei9nS1F1TWQ1TlNBdkdqdnp4RXdE?=
 =?utf-8?B?TUdtMFNRZnZnSG1KVCtoYWxCVm5DUEl3K3VDRXZhb0JuVjNxaDk1TWVuL2Vm?=
 =?utf-8?B?YUQweU5TRHJ1OFhzd2JrbENQZ1ZiT3dOYUlwUUk2RWczcUhnRlB6ZHdyY1ox?=
 =?utf-8?B?VjhiNzRMMk5HOEJkQjhwRDlRRFJJWHBCKzFiRU9lazBlTmpCOGNwNGNycmE1?=
 =?utf-8?B?ZjA0N281TEpZL3ViRUVVeElBOC83R3paeDJYZmNLZ2dXRFE0VEtlRnRGWlBT?=
 =?utf-8?Q?ZL6VEO5J2BXu6nic87ZIgc8FtkGFhamJSH3xaIt?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1da47a57-0b3c-46b1-7b3f-08d9840c1ae2
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2021 12:16:17.6349
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t5NwW851KivOKa8DdKBD43rjsoLPincopUC+WfLp12/qLeT+T3xABojJXm3sgBVrIHWQMupYp99ajz8Bao9zkw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6382

Like xen_start_flags, xen_domain_type gets set before .bss gets cleared.
Hence this variable also needs to be prevented from getting put in .bss,
which is possible because XEN_NATIVE is an enumerator evaluating to
zero. Any use prior to init_hvm_pv_info() setting the variable again
would lead to wrong decisions; one such case is xenboot_console_setup()
when called as a result of "earlyprintk=xen".

Use __ro_after_init as more applicable than either __section(".data") or
__read_mostly.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
Reviewed-by: Juergen Gross <jgross@suse.com>

--- a/arch/x86/xen/enlighten.c
+++ b/arch/x86/xen/enlighten.c
@@ -52,9 +52,6 @@ DEFINE_PER_CPU(struct vcpu_info, xen_vcp
 DEFINE_PER_CPU(uint32_t, xen_vcpu_id);
 EXPORT_PER_CPU_SYMBOL(xen_vcpu_id);
 
-enum xen_domain_type xen_domain_type = XEN_NATIVE;
-EXPORT_SYMBOL_GPL(xen_domain_type);
-
 unsigned long *machine_to_phys_mapping = (void *)MACH2PHYS_VIRT_START;
 EXPORT_SYMBOL(machine_to_phys_mapping);
 unsigned long  machine_to_phys_nr;
@@ -69,9 +66,11 @@ __read_mostly int xen_have_vector_callba
 EXPORT_SYMBOL_GPL(xen_have_vector_callback);
 
 /*
- * NB: needs to live in .data because it's used by xen_prepare_pvh which runs
- * before clearing the bss.
+ * NB: These need to live in .data or alike because they're used by
+ * xen_prepare_pvh() which runs before clearing the bss.
  */
+enum xen_domain_type __ro_after_init xen_domain_type = XEN_NATIVE;
+EXPORT_SYMBOL_GPL(xen_domain_type);
 uint32_t xen_start_flags __section(".data") = 0;
 EXPORT_SYMBOL(xen_start_flags);
 


