Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3321241E88E
	for <lists+xen-devel@lfdr.de>; Fri,  1 Oct 2021 09:51:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.200449.354973 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mWDJw-0000Wk-HL; Fri, 01 Oct 2021 07:51:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 200449.354973; Fri, 01 Oct 2021 07:51:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mWDJw-0000Tm-DY; Fri, 01 Oct 2021 07:51:04 +0000
Received: by outflank-mailman (input) for mailman id 200449;
 Fri, 01 Oct 2021 07:51:02 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=KCT2=OV=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mWDJu-0000Tg-KF
 for xen-devel@lists.xenproject.org; Fri, 01 Oct 2021 07:51:02 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5165302e-228c-11ec-bd96-12813bfff9fa;
 Fri, 01 Oct 2021 07:51:00 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2177.outbound.protection.outlook.com [104.47.17.177])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-30-Ramz9tJON6u9dsal3ZuEYA-2; Fri, 01 Oct 2021 09:50:58 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VE1PR04MB6478.eurprd04.prod.outlook.com (2603:10a6:803:12a::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.18; Fri, 1 Oct
 2021 07:50:55 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4566.014; Fri, 1 Oct 2021
 07:50:55 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 FR0P281CA0053.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:48::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4587.11 via Frontend Transport; Fri, 1 Oct 2021 07:50:54 +0000
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
X-Inumbo-ID: 5165302e-228c-11ec-bd96-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1633074659;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FS3M77QyqTSgF3aukoaB+MKaXGKK9/uwme7/4adiMq8=;
	b=EwCmcvT0Fii2RbmeIP7IKaT8Z74mvLXWtLzRaTnPY8DFea/nUACOM/wSz/RiQCbp0UsT6U
	ag8rilXumdaff2yyjoymxd/062T1iGF7ySgThBCXSIehxj4iGE7sUBHM+pI0ihi+UxCjU6
	tB8kY/arRaA5WwC8U4GZeedalgyzmjg=
X-MC-Unique: Ramz9tJON6u9dsal3ZuEYA-2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cP7m0WWF6up00OpUH/RaMfpwIDB5Y9Iu+sxHjBe9NvakzWEg/Zm5X/r55s38tQQ5EHZeg4hC0yOCoVK979xV9sU4uueHiGFqime8vYSpwT9tdSRxMtswbg5B/soQLdzm/KOrwBxo8AOzJq4wCBGv0qX8XnN+9yxEnKkOqmZej5vBFrGDFT67/PxXCIZW97KqXIB3qErN8lO8I8k0eCci3Fr4QbpfrS/p2bw9FSQnwB9ijjNG99ZO3l6uz2U5C2qtJY+Umr/c1AgKtLol+5vujinWB6Yp7msFIiMJh0L2C9kfbuQ27RKJJWGH8mT+vKPAnSDYRbQNu7zIcSgdk5danA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FS3M77QyqTSgF3aukoaB+MKaXGKK9/uwme7/4adiMq8=;
 b=l3IagNSjf1b4LewabkJfzyGeYll9rZo2ms2KLpvjTq4cwKegFpw/8C8zsEK9tCyvsbGfdEzdl2BCve6qpZpgDv74ZZ7Re5AvVpNqzCy2aONulZ+i7Tt+GmFVK/poBwNvxTkMDxYROItgss+BM2+LYDSlvjIVH0rJHHlZLxOiR/HCHoJfZz9AxBC5kr8UbVwEuQfJKnIQBko+r8FWOuz9w78GreJiQXjVgd0wRSLsuLABeucKYiTCmsELJQWz2lNaep4ktlAMxg5yr8s0a+aPinJftqaKl9xMVELXMW8QfSYGavIwvBQdBddeNjtQr003o7DFK9LjsksmRWwxk2nHpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=suse.com;
Subject: Re: [PATCH V4 1/3] xen: Introduce "gpaddr_bits" field to
 XEN_SYSCTL_physinfo
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Juergen Gross <jgross@suse.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Oleksandr Tyshchenko <olekstysh@gmail.com>
References: <1632955927-27911-1-git-send-email-olekstysh@gmail.com>
 <1632955927-27911-2-git-send-email-olekstysh@gmail.com>
 <alpine.DEB.2.21.2109301600060.3209@sstabellini-ThinkPad-T480s>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <05b040b0-a069-47a1-1f5e-85be62fa35f3@suse.com>
Date: Fri, 1 Oct 2021 09:50:52 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <alpine.DEB.2.21.2109301600060.3209@sstabellini-ThinkPad-T480s>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0053.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:48::17) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9abbd8ee-f8f5-4af0-e3a7-08d984b03311
X-MS-TrafficTypeDiagnostic: VE1PR04MB6478:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<VE1PR04MB64789440493F8575F813EFD5B3AB9@VE1PR04MB6478.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2958;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	HqSwwe9cNKYfT1sv8sXWf1gkb8Nb+qdklg1S1AIhRvbXe9CPeWDB1Gz1UYUc8kmyvbAO24RsMhZ/ZTPtUlj9Wcg/Js1VeX9qz/0j2tBbFuuBGi4LFKYHGYnZhPVqRcG7mFIiGBulaT+Ip6fNlk6SztMwWmErA3XS5HVBaR1MyFMY1zfR6BrWdxAazy49kl+zIE0k0JgmzZR7rBeXLEcxxGblr10HVXBjeX8Ttv26X+gvSTvQg9mbapnZ684VwCB9wQG8rHFKKI4PaUN3NmIUZRnqNWv7rf8uI6isJGswW8Qx/L4jJaqkiyYRgGBu7WN8+fhlfQ+7jGGG/txn2pCxMQRnlSqti38vh8GXJ1ZTZ4bHrYxKcYyLYeFd3QIpri8awpdWSkQ7gjBWblpzGvrxnJjIxDL+3td20tiGwsh1LoGJvF2QGyvTpRPz77BE7FA8osdJAoXQlg0cG9Dtwa8/jPFSMmrd4Moj5l3QeuVke5A+4pkVHCO4vTG/tnwEXHTKFxvaMOXQkOGTq6ndmotTFv2DBI46OlXlZoPniwHzfJ4+o9CuCN5ka9hpu7PhYaySMJvA/zZIrSHLtYcepSdCvcNSQlsGjaKBnHJmt23j5ey3dEskG4HJaY2C2ECoMAUhx5mmJxjutwufUP2+tdhvAOiW2qyzf61XDi1sK+oIdgybZimBX6SvNlDQnVBHPKfc3Emhvw0pAEnBxlF+wH6vRX3DI5DB9MUTBkdwNyUJSE86oM+gg2OOt28FB19fsLzpFdeyt7hVa2TQqYOgt3U3SpSCE1lWIvxNuNXxngjbp9WkYofWEsmAiARE0o/IX2Cp0Y1274ZiNPcoMq+kpcwckg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(31686004)(8676002)(36756003)(83380400001)(5660300002)(66476007)(66556008)(38100700002)(8936002)(4326008)(6486002)(186003)(26005)(53546011)(316002)(7416002)(2906002)(66946007)(6916009)(16576012)(31696002)(2616005)(86362001)(956004)(54906003)(508600001)(966005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eFIvS09tZlZiNW1CeDlBZlJDMDQzRmg1T0RZY3lsajVyVmdKdmRiVlA5RGVV?=
 =?utf-8?B?MFVKR3dNR1N3RW1ocWJqV0tDZGJ0bmltN0FzM0dvdTBjYktxMExqRm5iTy8x?=
 =?utf-8?B?WGVPVWp4RUNQbDVlMUdQRkJ4dmJnUzdZWjhrYXhYbjQ5ODdyV1dDbFo4Y3do?=
 =?utf-8?B?NXJTNk9oc1NiQWZLcHFMQTcrTGlOYWppVm9zWmFhN2dvVUpyU0FzTVJ4enph?=
 =?utf-8?B?Z0xwRDFKbmxYU05pRjY4S0VKZ0ZvODFVOE5nN21FNGxtUzd4QWFQdkJOWU9o?=
 =?utf-8?B?d3NvYU5waUQzcm5KU1ViV1FhSmdpUHZCSWtnTmhINkRLbW83S01keWVoaGVF?=
 =?utf-8?B?V1FzMlljdTNsVjlQSzdkWE9vc3RGQUJKeTFuQjF0Sjd4aTZTTDN6L2ZVQURQ?=
 =?utf-8?B?NVZKN0FpQVlmTTR3Q1VKS1NLRTR1NlJSQ1lrYXJTQWxCVldDbTRUQnJKRSto?=
 =?utf-8?B?NWR2bHo0QWZzODBmbnpCcFE2b0pZWXJYTGNMYStwMHFHNThhU3MyWDVZWjhp?=
 =?utf-8?B?WmJVNjdaN2ZVcUR1amVwYzBjQUhDTFVnU1FUQ1dIdnpoakZ2ZlZSQ3RjK2Ra?=
 =?utf-8?B?b0tvcXc1YXRHaE4rNzBUQjB6Z0Qxb1BZM2JlYVJuRG84SXBTTHl5RGV1OUdt?=
 =?utf-8?B?WWJ4N0Zza2k4RVRTTDJ3TkdFVHhvcS9IaFJpaXN0aGpGZy9IRG41eGZSN1JE?=
 =?utf-8?B?VE5EanFRQXNDdkZ6SDhObWVQVVN3OEQ4dE03V0N6UGt4Y2U0azBTWU16Rkdl?=
 =?utf-8?B?Y1V2N3ZWYUZ5R056WGluVnI4K1E3andCU1FiMVg0VzBOVzczQjI1dGZIQTR6?=
 =?utf-8?B?QjVNRkQxSWZCWEtzOUE1NVhYS2ZFTmp6RkJ2TEFxWlJvVHpyaTM4TjRlUE5w?=
 =?utf-8?B?NWQxZHgxQmlsTTZ4TGFiZDRPUmcwNnBjYUlMTXAyWlluUHFEdCtCWEtJU3BQ?=
 =?utf-8?B?eElnUmplMlhZRXJsOC9ocnFoakVyRTU0blo0Z09wQW9Kb282NDNiNWh0cGRK?=
 =?utf-8?B?a21wMUlGQXY0clBFb2thSXdpRmRSNzkzcEZXYm9VaHhpT3RVdEU0YnVSSFNV?=
 =?utf-8?B?Z3Bqd2xNVUwwNGo4N2xRbm9yTHN3RnQzZUhBSVkwNVlLem05bnRqLzN3ei9H?=
 =?utf-8?B?U0xJcWI2UkRRWFlmYy8yRzFXSjJBTDNpaG5Kc000Nk82MzJVMm5IQkpSbmhj?=
 =?utf-8?B?RG0wc0dnVGNrUTVYRGlTZVhER0ZDOXNvdmFtbTczaEJBZEZ0MDhubS9YTm5z?=
 =?utf-8?B?ZXRFYXZQclg5YWFOUWpBczE1OW1ScmlyTFQ1M1l6ZTZSalBNbjJIZFBDS0ky?=
 =?utf-8?B?M3VaOVAyVEoxQng1NnhtR3hRb29IQUcwN2tNMk93YlZTN2VhVURpMnVlUklN?=
 =?utf-8?B?RldGYUxBenliL0lJZXNFbE5Ecnl4bG55OGh4QzVtSmJyZXFCdUg5Tk9wbjJm?=
 =?utf-8?B?YkUxUE9XSzVEcnV1SCt0b3M2VmZkcnZzaUcvU2o5a3hFWHhCNjdJdEprc1lI?=
 =?utf-8?B?TlhkVlRvVDBneTVxOGhhZFlTcUJVcWRJbXNueS9NaitxMVRFUzBvakluL3lM?=
 =?utf-8?B?N1BlTi9PUllSRkphZWx1SUNjeDVqWG9CaDg1cjJ2VnhCZ2JBaFdIRFZEUEEx?=
 =?utf-8?B?Mk1KL0gzVWZyaFl1cnhoL1hEWTFpei95VjlRdlBJOG9uQS9CWHA1UmVpN0oz?=
 =?utf-8?B?azRTTUUydnVEelhQM1A1cFNxQ2xFaGNGeHVqcVM5aTFqMkNxbktpUmpsYVNa?=
 =?utf-8?Q?oloLMqGzcxFG6F44mWalwrEgmLTRC+Qn4HAc47R?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9abbd8ee-f8f5-4af0-e3a7-08d984b03311
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2021 07:50:55.6286
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VXWL7q42yJEjzn7SlOXjGKWgTIRL8nlGbW5ADjk/EF83XtPHlOe0OBKbANx16vOuvZp4s1hjma1424Hq42pXPg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6478

On 01.10.2021 01:00, Stefano Stabellini wrote:
> On Thu, 30 Sep 2021, Oleksandr Tyshchenko wrote:
>> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>>
>> We need to pass info about maximum supported guest address
>> space size to the toolstack on Arm in order to properly
>> calculate the base and size of the extended region (safe range)
>> for the guest. The extended region is unused address space which
>> could be safely used by domain for foreign/grant mappings on Arm.
>> The extended region itself will be handled by the subsequents
>> patch.
>>
>> Use p2m_ipa_bits variable on Arm, the x86 equivalent is
>> hap_paddr_bits.
>>
>> As we change the size of structure bump the interface version.
>>
>> Suggested-by: Julien Grall <jgrall@amazon.com>
>> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>> Reviewed-by: Michal Orzel <michal.orzel@arm.com>
> 
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

I have to admit that I'm a little puzzled to see these R-b-s when ...

>> Please note, that review comments for the RFC version [1] haven't been addressed yet.
>> It is not forgotten, some clarification is needed. It will be addressed for the next version.
>>
>> [1] https://lore.kernel.org/xen-devel/973f5344-aa10-3ad6-ff02-ad5f358ad279@citrix.com/

... Oleksandr makes clear this patch isn't really ready yet. The tags
could misguide a committer into putting in this series despite the
open issue(s).

Jan


