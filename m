Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E99B40173E
	for <lists+xen-devel@lfdr.de>; Mon,  6 Sep 2021 09:43:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.179400.325656 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mN9HE-0001aN-45; Mon, 06 Sep 2021 07:42:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 179400.325656; Mon, 06 Sep 2021 07:42:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mN9HD-0001YN-Uk; Mon, 06 Sep 2021 07:42:47 +0000
Received: by outflank-mailman (input) for mailman id 179400;
 Mon, 06 Sep 2021 07:42:46 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WUJr=N4=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mN9HC-0001YH-I2
 for xen-devel@lists.xenproject.org; Mon, 06 Sep 2021 07:42:46 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 05e1e3f2-0ee6-11ec-b099-12813bfff9fa;
 Mon, 06 Sep 2021 07:42:45 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2175.outbound.protection.outlook.com [104.47.17.175])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-6--VJjzU7QPaSfY_f2SYh3PQ-1; Mon, 06 Sep 2021 09:42:43 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB2959.eurprd04.prod.outlook.com (2603:10a6:802:8::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.21; Mon, 6 Sep
 2021 07:42:41 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4478.025; Mon, 6 Sep 2021
 07:42:41 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR0P264CA0074.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:18::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4478.19 via Frontend Transport; Mon, 6 Sep 2021 07:42:40 +0000
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
X-Inumbo-ID: 05e1e3f2-0ee6-11ec-b099-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1630914164;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=thr+KWDNBf4RXgukMPAM+yfG2ZtaAJHpOlaYkocEhOU=;
	b=fOrW/MsJJa7aHe6PBLsb2lnTluUtLDmBz1mcEa0xaA0mBeKjWVu2txQ//ukfdo69vIsjIJ
	T2PrAT0xoyn+iB+LrkXcph7s5u4+pv0FqQjNUaTTNcMKedE6KvrrbRavV6mR4z8jmcUGg5
	goM287RYt87Wx8fJjVyzjR6/bRBXRwg=
X-MC-Unique: -VJjzU7QPaSfY_f2SYh3PQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oe2ussa7S5SlyO7NRMUHxRj5gFZ3JEo7d7CJFEqPvsM/1Tq2Hi9g+GYatJUOnQqezXs1z6/lAtnXnSmiUM6XuBhWJfcJtGDS8LDhfy1v3kH/7AZ+rWAST+8sQ+6FQwBsBVK9hO6qUNQyasiEglhqT2LnhdK94NRh1zQNBAronCD9imvRkR4kwq4/QrjJ8Cbb9zUMA60LjPGeIYfh+Wm+5FuMMCqcpZryz1qcv8+1cw9A2WGRrUVTBG5rGytq/t91jDcPz+KuNQwQn035IzKWyZK45JznydZLPWA+NSq9HZafYoz/H32kckeQ4f8Ai9K/oi+xt4NDScDI6bgbx+YM7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=thr+KWDNBf4RXgukMPAM+yfG2ZtaAJHpOlaYkocEhOU=;
 b=Xaall/BESC/SB9UCTlJvcaU0oN/D9ierH/Sp9K0BqZpYEKQlKkYXNnfpsJadA+ouX6WcyyCKPs52GRxdJRVh74Bqy1c+MKGnkCLQc0+tH72Fy36UDQzazaPHt6fav/5j4/K8hrv2LAAyzTUoOTx3+8Jmoa7zIGJk85IkwoZ9bRpiikrRq46IMmlC9r3E7jlQi82SH0Z29gExn8Dpj8s4u/kGbvK9sr+siRSweJwBGQwrYNOTIDW8O85P5VphaUIfMCW6q+ZnpZbEJTF7NUT0Kxfc3ptCzQr+GX+Wik3tr24W5U3OGOB57PQc0N6ZM/4jdbJQMDFdJAckRTm1yPaLsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: Help with Network SR-IOV (PF still in reset state. Is the PF
 interface up?)
To: Bhasker C V <bhasker@unixindia.com>
References: <CAPLCSGCkdZMph=iRrqf3G5kT881mN5kYaG=qXrMtWS=fTn2O=g@mail.gmail.com>
Cc: xen-devel@lists.xenproject.org
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <8282a111-0481-410b-4a04-f0edd4bdb326@suse.com>
Date: Mon, 6 Sep 2021 09:42:39 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <CAPLCSGCkdZMph=iRrqf3G5kT881mN5kYaG=qXrMtWS=fTn2O=g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR0P264CA0074.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:18::14) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f6c020da-8081-4d40-40d9-08d97109e805
X-MS-TrafficTypeDiagnostic: VI1PR04MB2959:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB2959889FC3C66F2BC1974EF2B3D29@VI1PR04MB2959.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	xrg9MqHQZJR0J7R/OFehNXU4zQjtflIUdXKWaP/Hj+t+rovV9SpH4Stjj7S8wzpAH9BTip28SR00HpL/vcPSFdfjQAqSAoSptUge1VC/3RqcwiJnXd63EqbNfOpa5JkX638f/WHc8CA02aGIq09gGoLxquEehOsL+zR84cToxkBoGUbouObLJeSta9RcdOpKTPS1xNsS4GfFx0ckCz4EJ6SncO/1DsSvLb6+iRgk8lWYmAwzRi2T9ip7BYACQJz+fsrUycMSypiqKoc2TXE6RfkH40ox9SsiwNeIwR/BW0IUpKJRfK4FGyguaSCECFMEQIMtiETYjolhh6Fetr1OjjmcDg5nr0SGx/iE4L3OXjwYO8kKdesLfSKRQM5qY/ndFF6ZDLpddOsNPTWWHiNFU3bBwkK+8zERKvIWTjIu0K5YIP6BILR3LRzyAIKDCAx+Fen0Wl2Gj7kY9CDjixlSgoEr+urKKEoaKamti1KqNQ8vNTqBwitpbVp0IiyGHFDdjmMB8pXb6RbtXjmo3WNEwVt6harF4wzgthjWb/wvxJFG/rIlvrTysa4vPLaMcmkT4iFm4qDIHHWGHdzN9EHVXTqYyrd/m4wJ9kvoYHmT9RhaGpleVyzO2FwuNnGq04WOTNCpFObOqeWAAjwsHDaJ7LHDxGucw0CyvpUWaw/tUDmcq3djjfOnsL81UB2V8CZqEeaalWqcdBkozwMAjQlmf446xjHhBSV/rxFF2U+9ckU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(8936002)(5660300002)(6486002)(186003)(26005)(66946007)(31696002)(8676002)(2906002)(956004)(2616005)(316002)(53546011)(31686004)(83380400001)(508600001)(38100700002)(16576012)(4326008)(66556008)(66476007)(36756003)(86362001)(6916009)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SCt5UkE3cnZRMWFBdHJ5RFBYMUkyazhxWS82d2VKbmVYVHFEOS9RV1RCenpV?=
 =?utf-8?B?QVFSSlpGUHZDUGFrWklaeUNibk5NVXQ1c3M0RWtBRzh4UzdacTBycVlCVVh5?=
 =?utf-8?B?WXV6SnRVYWo5MEtoYWZ6UlZVRVA1M2JVRjNSMGFsS3RpQUVDaCtnQ3NQbTVa?=
 =?utf-8?B?UmkyVmJvUnNJTWoxb0lzeVdmMVZZU2JnNm81b1BZamxOYXlOdUlUZ0tSVTBj?=
 =?utf-8?B?QXNBMjRtNlZNdWtIMVJDbzdZaFJoYWdka21najZPQUpGWVFhQyt1VWY0dzRS?=
 =?utf-8?B?VmtmS3VBbTdQRDEvWG9KcCtqRGRkbEVVNGdYNURDdHR4SEw1M1BlL3padEZI?=
 =?utf-8?B?Rjd4L002ck5UOHB4RWYxL0FpOW1WYytVN1VKaU1ORWxnSy9sZUZDaU96emJu?=
 =?utf-8?B?aS9iaHQ3WDV1K1hocWpLdDFNY0VaOEFOOWZKaXRWS213VG5TK0VlNHo2bXRh?=
 =?utf-8?B?dWRJUG5UUVFnTzVPd0tIU2VhQW15ZU4yMkFjV3doUW5DT204SFM2VjE1OTRL?=
 =?utf-8?B?ZTdZS0FIQjhJOEsxcGczUE1KSzZtbXgvY3RlQ0pBOUEyR1JzZFdjT0trRUg2?=
 =?utf-8?B?eW01bW9rRnRvcThwWDF5OWdoVVJlb3JFM3RmaTlLbWN5czA2K0lHMWVEWTFE?=
 =?utf-8?B?Q05IcHhaMjArb1ZwV2JpdjlNSWJoRzlUTkI2aEFwNWM5YXlDbWxHV2NDeWYy?=
 =?utf-8?B?ckhYY2VnaHAzT2ZSL1haZllrRndXM0JNNFlZYjhqWXB3OE4zUXZydGp6ZjQ1?=
 =?utf-8?B?TFJRd2lHU0FzWThNM0NzTU8rVnVvRFRqTFF4YnNGT1dzemh4Um05VHZHZlQ2?=
 =?utf-8?B?ODduclp6TmZ0SFhieVVFSWtRNDBKSkU1Nit4enF6b3ZpZ3lsVEpFUGt0djNr?=
 =?utf-8?B?cVA1U2xSaGh2RXF6MlczSWk0ZTZDK3NqWUM3OE9VZEgxNUg5QktJc1JRUjEx?=
 =?utf-8?B?L1NWRVBVcEREejY3UlpZRjFpM3RML0dOMDVYSS9mYkM5aFhUclBQNGtmTXVB?=
 =?utf-8?B?WlNEY0tBMVhmVjhML0l6NFBueWwrU0psNEdTRzNVOU5RSmY1bFdtYjQ4aE1u?=
 =?utf-8?B?a2lac3gySFFZd3BCQ2RheGZHbEdsaGQ0d3ZKeHhSK05CU0JTRDg2Zk0zenRt?=
 =?utf-8?B?UXZCVGs4YU5LNm9XRFBlRE5FVlJVTXRtcTZLN2Jod0tBNlBmdngxV05hcVNK?=
 =?utf-8?B?MGxQOWduNkNsbFZCUnY0OHBiV29mOSt1VmE5MEppYzd4ZUQ5M3lNSkgrbWJq?=
 =?utf-8?B?aGlNemVGcGhHSXlpVTJxV3Ayc1lqZUFSTm4rakdWRXkyK1dkNXN3eURRTVAv?=
 =?utf-8?B?dHhvOUJZWUh6Z0UzZjhQSHU4cVpSK3MzQXc1YmxWTlFSQ0VNd2wyMjFJbDRu?=
 =?utf-8?B?ZU9RL1hWVzRxd21sMGZwbDF1VVU2OEE3OUk5b0RGQmd3YkxXRHBQVHRuVURn?=
 =?utf-8?B?TkZ5YUJCU2FYY3BQWk4zN3hvS0JPWWxaYWUzL0V5WEM2RTlyaXVjRHFjM3Fr?=
 =?utf-8?B?M08rTW1vejFuanBReHFPby9PSytDdmNlRTNSTXpOVVdMR2NSN0hrYmN5TTgx?=
 =?utf-8?B?QWMrN2lyckhiOFp5R3RORldtcU1pSkRuRVVzc05WckVHZUdveERXSDlkL1Zz?=
 =?utf-8?B?QWdyUWFYVlNXUEM5dG9zLytLeUhTYjN0M1MxYXpCaTE5L2s3VGhUOXYyRHZG?=
 =?utf-8?B?K1lOeUMzR0h0WVdHS0kyMjZ6TzlhZ1dnd0VFMGNHblVDSjR4SUk2RVc4K1h3?=
 =?utf-8?Q?BJ9lgyi8wq4QkjRa4YNxDFT8d5SX039QrQPcjFK?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f6c020da-8081-4d40-40d9-08d97109e805
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2021 07:42:41.2107
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XIW1kEQetet1uchw+/4oTYHGZIf6L3rScpXeQ10DsVPAJn6RtvfJ+7yNgu1P8nbUwSGYBChIulLiIorwWXEJnQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB2959

(please don't cross-post; removing xen-users)

On 04.09.2021 17:12, Bhasker C V wrote:
> I run  xen-4.14.3-pre from debian
> 
> I created 6 vfs for my igb card
> 06:00.0 Ethernet controller: Intel Corporation I350 Gigabit Network
> Connection (rev 01)
> I got these
> 07:10.0 Ethernet controller: Intel Corporation I350 Ethernet Controller
> Virtual Function (rev 01)
> 07:10.1 Ethernet controller: Intel Corporation I350 Ethernet Controller
> Virtual Function (rev 01)
> 07:10.4 Ethernet controller: Intel Corporation I350 Ethernet Controller
> Virtual Function (rev 01)
> 07:10.5 Ethernet controller: Intel Corporation I350 Ethernet Controller
> Virtual Function (rev 01)
> 07:11.0 Ethernet controller: Intel Corporation I350 Ethernet Controller
> Virtual Function (rev 01)
> 07:11.1 Ethernet controller: Intel Corporation I350 Ethernet Controller
> Virtual Function (rev 01)
> 
> bcv@bcvibmb1:~$ sudo xl pci-assignable-list
> 0000:07:10.1
> 
> However the guest is not able to see the link up.
> bcv@utils:~$ sudo ethtool  enp0s0f1
> 
> 
> 
> Settings for enp0s0f1:
> 
>         Supported ports: [ ]
> ...
> 
>         Link detected: no
> 
> I see this error on the guest
> 
> [    6.134890] igbvf 0000:00:00.1: Xen PCI mapped GSI0 to IRQ19
> 
> [    6.149577] igbvf 0000:00:00.1: PF still in reset state. Is the PF
> interface up?
> 
> [    6.149595] igbvf 0000:00:00.1: Assigning random MAC address.
> 
> 
> 
> [    6.151552] igbvf 0000:00:00.1: PF still resetting
> 
> [    6.153807] igbvf 0000:00:00.1: Intel(R) I350 Virtual Function
> 
> [    6.153822] igbvf 0000:00:00.1: Address: 32:91:70:c5:62:bd

All of this is kernel functionality, which driver maintainers may be
in a better position to help with. At the first glance the Xen
version in use may be of no relevance here.

> and thiis on the host:
> [  390.776779] xen-blkback: backend/vbd/3/51713: using 1 queues, protocol 1
> (x86_64-abi) persistent grants
> 
> 
> [  395.849996] pciback 0000:07:10.1: xen-pciback: Driver tried to write to
> a read-only configuration space field at offset 0x1d6, size 2. This may be
> harmless, but if you have problems with your device:
> 
> [  395.849996] 1) see permissive attribute in sysfs
> 
> 
> 
> [  395.849996] 2) report problems to the xen-devel mailing list along with
> details of your device obtained from lspci.
> 
> 
> [  396.103595] pciback 0000:07:10.1: enabling device (0000 -> 0002)
> 
> 
> 
> 
> However if I pass through 07:10.4 it works fine. The host still reports
> this  above error but all works well in the guest.

"This above error" being which one? "PF still resetting" or "Driver tried
to write ..."?

> Please could someone help ? I have been using  KVM these years and just
> moved to xen and hence new to xen.

Well, if one of the VFs works and the other doesn't, then a close
comparison of the various logs (hypervisor, kernels, tool stack) may
already provide an indication of the problem. Above you only supply
individual lines from logs, which isn't going to be sufficient to derive
anything.

Jan


