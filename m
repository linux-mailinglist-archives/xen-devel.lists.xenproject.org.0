Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E33441704B
	for <lists+xen-devel@lfdr.de>; Fri, 24 Sep 2021 12:26:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.195229.347861 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTiOx-0008Kc-VA; Fri, 24 Sep 2021 10:25:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 195229.347861; Fri, 24 Sep 2021 10:25:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTiOx-0008Hs-Ql; Fri, 24 Sep 2021 10:25:55 +0000
Received: by outflank-mailman (input) for mailman id 195229;
 Fri, 24 Sep 2021 10:25:55 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=wINm=OO=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mTiOx-0008Hm-7n
 for xen-devel@lists.xenproject.org; Fri, 24 Sep 2021 10:25:55 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id cc2492dc-1d21-11ec-babb-12813bfff9fa;
 Fri, 24 Sep 2021 10:25:54 +0000 (UTC)
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01lp2052.outbound.protection.outlook.com [104.47.2.52]) (Using
 TLS) by relay.mimecast.com with ESMTP id de-mta-5-12ZFw3nFMUO77ZMEnZ1e3Q-1;
 Fri, 24 Sep 2021 12:25:52 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB7149.eurprd04.prod.outlook.com (2603:10a6:800:12e::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13; Fri, 24 Sep
 2021 10:25:51 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4544.018; Fri, 24 Sep 2021
 10:25:51 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 FR3P281CA0037.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:4a::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4544.7 via Frontend Transport; Fri, 24 Sep 2021 10:25:50 +0000
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
X-Inumbo-ID: cc2492dc-1d21-11ec-babb-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1632479153;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IWDsTB/XrnmD4UkTyPlFg9JMBb+0jAMIBX8dFfssLRM=;
	b=bAKHHpEz0bpj+wPQOEz7yN9hUCqfF2b5DynkV3uuwiDyCXbdF1tlrz7soR/dIvyEzB8xeJ
	p+jXtFq1AcO+ZemktVyG1WHyooHTMmaMwhdAafiJEv4HnhQzfBspkESl5VyeLKVCn0NiIa
	A5OJZ1brlSk+KYET9Dai+Mol1qQ7wUk=
X-MC-Unique: 12ZFw3nFMUO77ZMEnZ1e3Q-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Jvay3FowmX6zIIQXRijjnvdekZZwWmyPDRuxd71BeyV49CviMPNzA6M3RqNfpUpn1qciznz6NEyvhMriQeyb26T8rg3DaTxVTkSTugKW8dJ9ouZqHql4nEUjYfg41faESFrCasRr9L3BVcJE/xz23SGrOOZpXYUrJyN8jw3s2iTpQZDoJkyyCW1EwwhUCUOlAd7ICDnf4DwhgcaIb5QKtRVDMbRBU5Ww3Rbp7XjCtIkPOo1+pXBkMx4WipDoZRpf5w6Y6KlLVMtDq7eof7R9b77VZxKt3qlzL+q5Z4ALQwk1edQYrwlZ74XSZeOXn9tPHiicubcH0ZP5XuKMs6wGnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=IWDsTB/XrnmD4UkTyPlFg9JMBb+0jAMIBX8dFfssLRM=;
 b=bjzRERp5LUFZnlA0j4w/3woOICe0Tr7gUk9f+30z2v89uOT6g6PYMG1791V2PRKJ7bpg7FgyY7yrAW0O0JufxriuOOymlbopxCDmF4bz5eyhpEe75BRZLnhtJpljbVzLENrA6raVuo7efB6PITvsI2tUSuUSM87uFHkrlWvzrygVBISvQI64oe2XkOT+mZhOgUadM3Ky6/qTY0YldHeNKr3YqztdOwsiNL1kFvJUVNpmvvvdk56VOfmr8vv5fAb4vSzb5aTkH98QLKQvcG1We/D/knTBNRQpYuQhT38g3fJHpLVSnd1nEreFBthJ02SReLxF4mMr8fU8dr3w54DjTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=suse.com;
Subject: Re: [PATCH 36/37] xen/arm: Provide Kconfig options for Arm to enable
 NUMA
To: Wei Chen <wei.chen@arm.com>
Cc: Bertrand.Marquis@arm.com, xen-devel@lists.xenproject.org,
 sstabellini@kernel.org, julien@xen.org
References: <20210923120236.3692135-1-wei.chen@arm.com>
 <20210923120236.3692135-37-wei.chen@arm.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <a3d3db98-420a-79a2-97a7-d332aee5b531@suse.com>
Date: Fri, 24 Sep 2021 12:25:42 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <20210923120236.3692135-37-wei.chen@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0037.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::21) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f61de166-ab00-41cd-9b12-08d97f45aea1
X-MS-TrafficTypeDiagnostic: VI1PR04MB7149:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB7149B0049AFFF390AC36B412B3A49@VI1PR04MB7149.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	oYLod0DoG8A7NMlhcZGXhGfMNwlZmPTd8vfLWgGXWrxK5z3NR13rpp2zThdW+9vuQP5TGAY3pnbtnulO14y+VVjIG6camXo+Vri+ywsYqXQBSSVq9jgnljn2gyzYss7q6PRe6JP/vBs4DPyUJpsx93Pe4RMWHOvWvowiYszc6q9dQ7gmUKTyhgoXQI78XfXoqtQaY1CHh6EMZkcnfIAu5HH9IE3MoGtBVl/JcRLZTruorJjVDaziGqrjv/P2bemIJBVDBKntULR6DW4X4PTrJDJpdFzN7zOpd+3wd5TQWBlZAimpQyshqBE7KxZw6asf41gDih8ypyYkaBJ+troCUWqmRmjs1kfj6Vl6U82J2TWvAw5/cHonbLt8C8Cm3Ofg+g7B4mHEpaKUtoHHZsPLPyFmqLWVZdhHgeNgVu4NUcrEMQUbHb9Z7Aw6wCScCGA+YV/UOIMz8SbgwzVQiZaVkWolmq4j9Eyx8GjxpTkYQvEy/fQOn36PCtfON869UO41KSVW3sjPaiS9MYum4bbcASLi3yovplS+eZM1WKzkG3YF+stYGupCHlBxvAJq1BNfU9RYx3/B6mW+ZEG4zrd3Ze6uUVobNIaH9iFL22ejw5kTcrTXEYm36Y1HZfdocR8Tc1ijZhgYzp0afBhgnNFuJhELR0QFpDvBt867F+oroBxku6+aPGcOJbdg+OGNpl6YRCnTionH7oa+koqf7wuf6MocDQNsThf1Uaukz6MsKV8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(66946007)(38100700002)(186003)(8936002)(4326008)(66556008)(66476007)(16576012)(31686004)(26005)(956004)(83380400001)(6916009)(316002)(2906002)(2616005)(4744005)(53546011)(31696002)(36756003)(5660300002)(86362001)(6486002)(508600001)(6666004)(8676002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VDVKbWVXekJaUEwwMDlJellrWXdkNmRZblY4ZWw3aXl0djhhSmtxVXBmZXBJ?=
 =?utf-8?B?Rk9XUEpOLzA1YzdHZzRwajFxUUtIYlhva2pRdUk0RUZVQThHRlZMM0RHOElT?=
 =?utf-8?B?RkFkRTl2TzM3WDVreWFkcGE3Q0ptNTdqZDJGei9zc3Q3R0JYZU5QUkJOdjNk?=
 =?utf-8?B?dWpSbGU3dTJyRVZFdEtYdnR3cU1uNEhUN2dKeE02M3J3dGVieW1heW5YM0pL?=
 =?utf-8?B?RDVPdjZHeXgwS1p1YTBMdXdrdkVYYjc4YmJteE9tRWFFRG10LzRlL0E1TlZR?=
 =?utf-8?B?NWdaeUFmMzZXRzlia2tXN1drdUtCbnhYeGt5dXZXNWc4YlJuaWg2RVZIdkxp?=
 =?utf-8?B?RUtPMmk2VWszMVduR0tvNkdGdzdLWXJUUk9kbUcweGtSSnlNWEsyMFEyVG1K?=
 =?utf-8?B?M2pyV3N1NlAxalFxMzRVSVRqZFM1UkZTYUZ5bmNUWjBGUk9RQWRhSE0wQXdo?=
 =?utf-8?B?STBHOUZkVm1qUDhBbU96NVRrVjE1anRRYWcyUmUreUFqY2dTNGJubFhBRG1j?=
 =?utf-8?B?TGdJdFNpV1dlczBlMkRkUnNwaERHVnlNS0tUNHAvUDZWU3Jhd3FTVWtZQ2VH?=
 =?utf-8?B?MTBlSzNlQzQ0SS91UUZwbmg2eEFtcCtCbktXeWFPVWJWVmpBK1FKcXFmNjJY?=
 =?utf-8?B?SUEyN283WDZrZEYzTlFuUVFzUWxYOVdXQ2tiVFQreml5eGJsVkFneEx1S3dQ?=
 =?utf-8?B?WkR5c3FleE9ZL04rQTZRWnFyUnRrTWx1eVloOVVtVFFjRkdjanV3dmhPcnoy?=
 =?utf-8?B?czY4OUk5czRzSDc4NGg4ODBHZ1IxUUgvaFhIZ0pQc21VYjMrc1RQdnl6TG5G?=
 =?utf-8?B?LytOUUV1VUxsTmdxbi9IZUdSem5Damg0Y1NEeHJ5Mm5VR1gzOHl5Um5IcmpF?=
 =?utf-8?B?MFFOVFZGbUtZZ0lYd0FlT0wzallJZ0ZaMy83VFFWQ2gxNjRqS2hNcUxLLzJT?=
 =?utf-8?B?cW9XTmZEWkFud3UwM0plYlBWZmtuY0ZnZHVnaW5ZUy9mMFlHeG0zd1c4WjhY?=
 =?utf-8?B?eWI3Z1l1TGVPVGttaFowVEFKT1c5Q29YYklaY0M2Y1lMWlNEZHV6bStpME53?=
 =?utf-8?B?eHJXNnBtR0hINnRTSEdjcXMvNVd1eERHOWh6WWt3S3pvUENCNWlRVmNhV3VZ?=
 =?utf-8?B?ZDBVNVBNT2lQTDBRMDlIWFB0ZitMWXBoeUJKMk9wSEVIVlppM25QbWJJM3ly?=
 =?utf-8?B?QlcxRHdkdE1vckNOdUxITnVFUHNyS0YzYzZlTy90NFU2c0hJTjcxekRHa2Yr?=
 =?utf-8?B?Y3U2dG4xTUF6dmlNVUw2dHJDNTRXOHR4ZTdrdkVoQXdERTByRWJJcGJFd2N5?=
 =?utf-8?B?d25XZldBSi9BODFxYytQOUhEaFFpd1Rzb3VROUF5dStrMHMzc3hCb1dxQlNO?=
 =?utf-8?B?RkJhMGx6L0JTS0RJNHB1dDZsdUNtQVkrMHhtVXE3SmpTbjNDOHpiRmFPczcy?=
 =?utf-8?B?RytlV0lhZXVKK0JQR1BJZUtHQWpwbERqdll1YS9MRy81U0QxVkJmVFRDRWk2?=
 =?utf-8?B?K0RpZXQvelEwQWt2bksvMkhSQzlRTW9SblArVXhIUTQwUkk0cUsxeU53NElX?=
 =?utf-8?B?SzBlcE5jOEQzU1AvbWFnVUZFYXNEenFnbTZIVVZaZForNWhrem9qWGxhMUFV?=
 =?utf-8?B?d3FiT3pUUFF0ajRhb1ZPeUVmQ3NlQ0Y0aEtzMndleVVia1htenVKblNRdDJQ?=
 =?utf-8?B?bHAwTHJBTmp5dW42NnBudVZ0dVBacmhvd3RPendIMlZ2NUVjSm02YTA2V1hR?=
 =?utf-8?Q?DLHUmIO7j5YEcjhDBpYoul9bNdaHhNg1TlWqOf4?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f61de166-ab00-41cd-9b12-08d97f45aea1
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2021 10:25:51.0302
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JUU5vXpi778KfAeKCp5LYIhpX/9wrlERXAF3cfhHq+BA/09iqOGbglYAitJPXluDh2K3nBAq4Jjrcotst+m2Tw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7149

On 23.09.2021 14:02, Wei Chen wrote:
> --- a/xen/arch/arm/Kconfig
> +++ b/xen/arch/arm/Kconfig
> @@ -34,6 +34,17 @@ config ACPI
>  	  Advanced Configuration and Power Interface (ACPI) support for Xen is
>  	  an alternative to device tree on ARM64.
>  
> + config DEVICE_TREE_NUMA
> +	def_bool n
> +	select NUMA

Two nits here: There's a stray blank on the first line, and you
appear to mean just "bool", not "def_bool n" (there's no point
in having defaults for select-only options).

> +config ARM_NUMA
> +	bool "Arm NUMA (Non-Uniform Memory Access) Support (UNSUPPORTED)" if UNSUPPORTED
> +	select DEVICE_TREE_NUMA if HAS_DEVICE_TREE
> +	---help---

And another nit here: We try to move away from "---help---", which
is no longer supported by Linux'es newer kconfig. Please use just
"help" in new code.

Jan


