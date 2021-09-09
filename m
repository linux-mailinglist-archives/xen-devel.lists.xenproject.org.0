Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 085E3404A0D
	for <lists+xen-devel@lfdr.de>; Thu,  9 Sep 2021 13:44:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.183024.330944 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOIT5-0004lV-QK; Thu, 09 Sep 2021 11:43:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 183024.330944; Thu, 09 Sep 2021 11:43:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOIT5-0004jg-N9; Thu, 09 Sep 2021 11:43:47 +0000
Received: by outflank-mailman (input) for mailman id 183024;
 Thu, 09 Sep 2021 11:43:45 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ZYDC=N7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mOIT3-0004ja-GK
 for xen-devel@lists.xenproject.org; Thu, 09 Sep 2021 11:43:45 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2eeae68e-1163-11ec-b1ae-12813bfff9fa;
 Thu, 09 Sep 2021 11:43:43 +0000 (UTC)
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01lp2054.outbound.protection.outlook.com [104.47.2.54]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-39-LQE3Kx4ZOfiNcJnYv1Xr8Q-1; Thu, 09 Sep 2021 13:43:41 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB7039.eurprd04.prod.outlook.com (2603:10a6:800:12b::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14; Thu, 9 Sep
 2021 11:43:39 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4500.017; Thu, 9 Sep 2021
 11:43:39 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR1P264CA0004.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:19e::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4500.14 via Frontend Transport; Thu, 9 Sep 2021 11:43:38 +0000
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
X-Inumbo-ID: 2eeae68e-1163-11ec-b1ae-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1631187822;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HF0S0KYJ4nB0qOMnXGPL8jt8y++5z9GqqRNKB6MARN0=;
	b=JK66C1XgO8TmLSTxUokS5LmFnoIwIxQJyGHDhZ6roy8q8RYUNAcV4BPr0LO7PEnGQQceB9
	UozVIvESeu6b9/4PECthERnpEcNgiGzcc9Uc4/dmV78mgkXYHTkBGU0RT7I6q/rzAY6Qry
	g5EXlQF+hM4KZadGxAR5yD8MX5zUR64=
X-MC-Unique: LQE3Kx4ZOfiNcJnYv1Xr8Q-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VIy+oDLGnRjpgsKvqpolAjYIr+V5PQOcRojrv8z/qmfm1viYMd3yJp0ImtJNh851qP86v455b3ekouopqidl2/JemaFr5WhjsHBFpgFgh7AuyQb7fZJe/VA3KfWezDDgbscCvtZxPNY2OKYfQ7gNxdC5PboSjGzuM1Ez2PWI2SPaVQWDAahFzPyIBAvCCpivl2k0VW8mHMhCJGFIzdzXqltqZmlJwJChrPfU5Rl1KZ5QLaiqSFAY+I+6qVv8A0izRgihD5Bxvlxhx/aL/NfxQINBw9Es3b1U3gpjsKpWdELMOnfqj+NMYA1hy46K+6ExIpICQ5U5qHgJCjh9tWt+9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=HF0S0KYJ4nB0qOMnXGPL8jt8y++5z9GqqRNKB6MARN0=;
 b=m231F7oqGHiCrc8r1s6Eq3ap/3YW/n+jHc98Z4eyHI8UUfWvHUPzKnIejqGQR4z7xcGgZZ8z+4TsRCEw9vk1GYXiiV3BfllEKMhnaNsTNyy/jAnMVanLCwym91fI0oJhvE/PiA0yvDGQlWhAEeVRRgASVwy/E3Wnt95782nub00dn55RGARMGAc4KObzd51PyTwauDrW5fC0NoYmcv9IwwIZ6DRv7TTo+mmKS2a1OiwEAa9U4RJdGxnppPeM5c/sDeQBEcWRUd/Y9HRR7K2Mvyfhccmt5wxkRlIfm8bD6co+11LtryXs231wyIzLekfZgdAQ+gfGPQM96ILTTy+fsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [XEN PATCH 2/2] build: add --full to version.sh to guess
 $(XEN_FULLVERSION)
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20210908095422.438324-1-anthony.perard@citrix.com>
 <20210908095422.438324-3-anthony.perard@citrix.com>
 <be89ae8c-99cf-5385-00a7-d9433e0fc50b@suse.com> <YTnrnqz7Vt0pugFZ@perard>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <d4b99e9d-7c33-2edb-c53c-548e57d8514e@suse.com>
Date: Thu, 9 Sep 2021 13:43:36 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <YTnrnqz7Vt0pugFZ@perard>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR1P264CA0004.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:19e::9) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e4efccf0-9e14-4a9f-30cc-08d9738710bf
X-MS-TrafficTypeDiagnostic: VI1PR04MB7039:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB7039CA57C611BC934FA9A6E3B3D59@VI1PR04MB7039.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	QtPOLpxksWt/RvQ6PuSN7rHHpxiO5AGJSy0vfnbh+fAeVv+Lf3Btl70sTYvSYwN9N9bpcQSwX2bhZEf37HaROC0nrb+E0Jx3ccIYGp3+96ApEfSHgrQp7i6lpHkuu0YRSN959a1JPhFzZWjXDze5G7YucokYKLoByoUl2xZw7+rKTP7z/5C5RtaCxP525IE03CEIywxCaCXlplILREX6BOUNOcunzXTrEWzzAlCpO4xSdsBs5akWRjWvALxXrHGeSb7Oru1kmRuhZr53FeIm1inuirAJDiICg5QB4MWY4ZCgK1OP/HUD4X1Ob9Ir3u3AYghRn8KAvMCeheVg6O7vGUPR4vpJXcypf6HAg60aIualBvQupQLKxs6qPX+ikvVWrDk9QxvCF/wSB05P1qaPJFKhBUleWeRiHS2nqWL2dRP80pwBvzATI9K9LEyVff+A43Vb2PyipFm58tsFGRe3LmHDArcw6cUheWz9PqiX8FzDmDl9YEVHL6O9U5yUVvflbeDmbVhrPxZr7kun1Txh98gFBLCZ/P7n+5wonSAivIoS3ZshgZ5RBxFtwcByHKpUffs3lxY8T8uOAoHtwjKI7CpI/8i/JNGcqTkJ59QX0NJsD/d0tDY7V4HezPVFYA66wR89PWu78D/GSiII5Fc6/U1VtqZdiZ4NetxEC+GjXcHPPcKBt4qLqOyi9OwjyvYk2Efuj2sSmx/JaCb/+fRQAC8vPi9WxjEiU8HRUtDDzChVoWkUpNSviB/xQuTggkb9
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(39860400002)(396003)(366004)(136003)(376002)(346002)(66946007)(6486002)(38100700002)(66476007)(26005)(66556008)(7416002)(478600001)(2906002)(31686004)(53546011)(16576012)(4744005)(54906003)(36756003)(5660300002)(316002)(8936002)(86362001)(6916009)(4326008)(8676002)(2616005)(186003)(31696002)(956004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NGhISDN4WkNpUkkwQWdhbHllRFVIMU1oTEZmN3JlbE5WS1lvbkd4dU9lY28w?=
 =?utf-8?B?RWJBNTFVdE1wT1o1djBBMThodmg3Yy9weU1oMmJnOFUwU2YrNnY2RDV4NnJE?=
 =?utf-8?B?c3llZjcwdzMva3N4MkYvSGx0ZGZBdkEwbTBuZStuT0xOcHd4MlNDd3RacWEz?=
 =?utf-8?B?ZmtWWjM4V21Xb1lGcXMyZkcvd3pGb3VTUzB2UjhnSEUwT0RENDY5aGlSendM?=
 =?utf-8?B?UmF2YmtublJPcDhuU2l3dW9yUTFld0xxVkRJc1Y1VHFpL3h0UWpnSVB5ZU1Z?=
 =?utf-8?B?anAycWJyK1lpcVFWQ1U2eC9YNEFhSXRMTStrWG1vbFA1UHlCemtNTzVVbmFi?=
 =?utf-8?B?UjhtU1lKZlNydmNFRDVtQjlWWnZNWTBsbFFVajVRcnpLSzdMSDJvalg0TERj?=
 =?utf-8?B?akpzNjR0RXplaXpwcDRuc2Fzd3M0T2J3dGovdXIzZ0NEN2ZVaWRSR3hPQXpR?=
 =?utf-8?B?bnhzcVpTY0s5eGgvUUtyTmZJZHVucUNrSnhLakdXNzNzTTlWNjJyKzl4djBv?=
 =?utf-8?B?K1JSVU0zUytqSG5EWFQ4N0VMWE5KOFNjYTJGMHU2WHFUTnlnQjVzVm9GUXBa?=
 =?utf-8?B?QkVhajIzdXNxcTdFLzM0bGxhUVlwVEdLZWJkaTZlQ0RKL0JBK2MvRXZaNUI4?=
 =?utf-8?B?bkJzMGU3RFMxZmwzeUlKKzlEQkRQK3d1VytyVEgzb2ZrbFdvbjRMbk9yc3Ix?=
 =?utf-8?B?bmRmbGlQL3ZVMDcxWWJHbkJvZFJFMkU4VlFDUk1xY3Jyc2lBTG9VbENZTXpS?=
 =?utf-8?B?S2pUWC9NVmJCby9GUUtLWnFZcEdqU2lqWC9UQlpKelNYQU1DZmN0WnFjajRk?=
 =?utf-8?B?OThuZW1NR1BiQ2ptcWpsZ3JKajdnQXFsbGMvVVVMemo4aFZrRm9rU3FSSFUw?=
 =?utf-8?B?QmdFbTRHL3hjQmZ2TzNYRDJwelhsTUtrNGw0dzM2QUpjVEpBdlFxc1pZSW9J?=
 =?utf-8?B?S2RFazhyMmVvM0I5MkxFUXhEWUh4L1kyMWZSZVYzdHRiN3ZkdEtiUFJzaTVS?=
 =?utf-8?B?VzlBMFlBTHplYTlRQi9xVG5ERGZnTzhXQnhqdG4yL3RFWlF5SlVYQTVNQW1G?=
 =?utf-8?B?c3VDbGFWZTFmU28rcUNnbUxNaHgrMkVmd0FpakFhakE2UERqa0lZN2V5U0ta?=
 =?utf-8?B?ZG9aLzFtL0VEUmNLc0JjY0hzUEpPK1ZJWVVLNGN3dDVzckU3NC80RGxCcnlp?=
 =?utf-8?B?VDlob1cxY0o2Q1ZQSDd0ZTY5bWlXUEF1T2dGeG14TGZkRnFvK25PUElOZXVK?=
 =?utf-8?B?dldrbEdyNVpaak5jdm9OeWZnRXYxQ0FrdVcwd0MzMTBIcjZMUzV0R3BNT1ZB?=
 =?utf-8?B?ZTFhMTRheGd3RVJqMllkcDJQOXh6RCt6M2lkei9yM2xkS0JENHgwdExwSnhF?=
 =?utf-8?B?UXpPV2ZZWVdma2trSzY2T3FxeUFYLy9BWXZIUnN0K1ZXT2FpZkdkRjM1czZE?=
 =?utf-8?B?ZXpuZDJWM2s5UEx4cmRRYXZ0a2dWMnpmL1dDcldHaDIwbVdJY1V3blhFa3Ji?=
 =?utf-8?B?MVIreFdKNnd5R1d4U2JyQ0xuWlRzNTgrVlpoMS84b3EydnVnVm5OTnRkdjNj?=
 =?utf-8?B?MzA3akZqTU1rZ1IrNGtHR0VQQ2NObkNlN0ViN3RLczJET1FhUkVscVJVVnpQ?=
 =?utf-8?B?dW93eEo2M0RuQ1hsVnNmY1RsWmJ2RHM0S0JnTFdjRHVHWDUwZkZnOFVBb1JH?=
 =?utf-8?B?MjJRVXd1NmM2YzYrYjQvUUZqZG9iV0V4MDNPanhoNk5hcmowMFBrOEM4M3dx?=
 =?utf-8?Q?JBND1aSQH0wik7XPKcSJkkAlwXpXjhP3d/r50PK?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e4efccf0-9e14-4a9f-30cc-08d9738710bf
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2021 11:43:38.9659
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zgGaIkwqOqQEUn45xIbttyjoyWvuuj0ZWTUGCPObnSpAJamlVSN/PQ3T8Hzs/IW4NWydniTu3jaS+4WGoChcxg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7039

On 09.09.2021 13:10, Anthony PERARD wrote:
> :-( I think I just found a package overriding XEN_VENDORVERSION with a
> command line argument, the AUR package. So ./version.sh needs help from
> the build system:
> 
> Maybe
> 
>     XEN_FULLVERSION=$(shell env XEN_EXTRAVERSION=$(XEN_EXTRAVERSION) XEN_VENDORVERSION=$(XEN_VENDORVERSION) $(SHELL) $(XEN_ROOT)/version.sh --full $(XEN_ROOT)/xen/Makefile)
> 
> or probably just exporting those two var in Config.mk or tools/Rules.mk.

Either sounds okay to me, fwiw.

Jan


