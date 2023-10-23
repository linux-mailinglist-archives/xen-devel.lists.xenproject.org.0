Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A03267D35F2
	for <lists+xen-devel@lfdr.de>; Mon, 23 Oct 2023 13:59:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.621403.967850 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1quta7-0000Yv-TL; Mon, 23 Oct 2023 11:58:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 621403.967850; Mon, 23 Oct 2023 11:58:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1quta7-0000W8-QD; Mon, 23 Oct 2023 11:58:51 +0000
Received: by outflank-mailman (input) for mailman id 621403;
 Mon, 23 Oct 2023 11:58:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OVTz=GF=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1quta6-0000Vw-1B
 for xen-devel@lists.xenproject.org; Mon, 23 Oct 2023 11:58:50 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01on0606.outbound.protection.outlook.com
 [2a01:111:f400:fe1f::606])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 854b50ef-719b-11ee-9b0e-b553b5be7939;
 Mon, 23 Oct 2023 13:58:46 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PAXPR04MB8559.eurprd04.prod.outlook.com (2603:10a6:102:216::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.11; Mon, 23 Oct
 2023 11:58:44 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d924:b650:a2ad:7b25]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d924:b650:a2ad:7b25%3]) with mapi id 15.20.6933.011; Mon, 23 Oct 2023
 11:58:44 +0000
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
X-Inumbo-ID: 854b50ef-719b-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f96BzozM67E3urK2PKfD4Aq95YOv7YVnPkb9pDRk6BmJVL+ZOUAO1gU0LsOqTCZHK+uey3FQ23dwVxByttnzKH62F0I3DLvLKGG0nknEl5ehEffjQ2PLMAITRKS12e1d25lTXaTglKGJyCrMoKyXPZpZMSePXh0mLA/Eo2R6Hohx2CluSqNY5GcgIGsE8neBgcxFNJYPM1WiZXFZh1LrJ67ele/dbfXZL4RcR3LGt7IQRpxrsT25HwxiPhP49ZFBjFX4P25sD5CFCsZaX4/2zLBa7L5A6LOi85bxVZPKpp1UqbZtSqdDslomashu1IXKEgFzObwV5Y+4wpQOnanIBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jHgZDqPo3LJGsLBPb2uaLYDJIHn8b/ZjZ36ciO4TMy0=;
 b=N934jPQL91HeiKFbAHWCzkun/KwxG91vLOvLeju+B0NKtCqN1MQHqg1r9oG7IPdiCwOaihA+k59HnPJG5LC65tKV1ej34e42yHshCeAUInnv3HPzQJIC9+1rfNGtrqLxlDEOysqsGVfEQsJ2xlUFWzNtKBZYakT2phu/4HEeb6QNeqCS4OXWSTwntIT17/jJZesnSmiD71yV21aV5pwQ1N2wvI5jlNm90S+vVBuEj0gc2V+vSGE0vpPrcYRq0q+DI0rdiqtGttdjBIJhUEd/6OwUKCzO2qLY8qIfzI0kLhWa5/uPjBdjysLtSbWYOviPOzqeGCIkALL8PmG57tpK2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jHgZDqPo3LJGsLBPb2uaLYDJIHn8b/ZjZ36ciO4TMy0=;
 b=1FVzkP/gAxmUuvRKbGJBRX830FD4LqrPky12GJ/m2rFFKgNkbxNU15K8jxqunUej+Ky8gwr2wFR7r8stJH8S3PNw/zx6mvvZv9P3UIVpuLcW5DZ1iJTLCEaodOKG3KXKKHc29Bj4o2OVGBA5y9dcoGT+TCT459O2pgQyoRC5YTwLL7OWSb04X/jVvu0lqgboL3Yy4ZRN+cdw18wykS5v/d6sCRb+QvlOssdX3KSQqN183qy0mLDnSkQNljiRb6Jo/n8Wde5DsmXTxrBJ/YEY9NmLoB22hrOa/NLjBN1bWPIilDVbJ36UMgxBD2ei/DDpgBakoqLiWZeXeHoAjGxGYg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <b2ed1c50-6e55-7d89-aaa4-e0f23d5b4da8@suse.com>
Date: Mon, 23 Oct 2023 13:58:42 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v1 12/29] xen/asm-generic: introduce stub header pci.h
Content-Language: en-US
To: Oleksii <oleksii.kurochko@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1694702259.git.oleksii.kurochko@gmail.com>
 <597a482c70fef196e245a5d898ea6314a0c479ca.1694702259.git.oleksii.kurochko@gmail.com>
 <d4dca6d7-ac54-beac-26fc-5eaf80783a73@suse.com>
 <0da7452e0c62dcdc5a0e1185b9f99cdb3d7393c9.camel@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <0da7452e0c62dcdc5a0e1185b9f99cdb3d7393c9.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0170.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a0::18) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PAXPR04MB8559:EE_
X-MS-Office365-Filtering-Correlation-Id: c57a5714-e33b-40d4-3e86-08dbd3bf6832
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	jRNpprKBaBqmkualxIKgBBuqe1vdxDMW4XoICyYv99GFV3mWcNbnoPetx3UZ/qiZ7Z/woUc8btUvsSy5Cc88Mb6mi9gGa/S3Hjea2z+TYbbaGnwe8fRdC9yzJ8jXBSSTouLLJ7YwXcoMdVMZG1KkrZLpFDbyYxhlqRqjTQy1067n5SalvUOP9Xb6nvh2hpUHNZWZB34ntoxKIlw/mzLqLhXhxpXpxopdZ7a3cT8z7omgAMtN8J73prXeYVqQ5X/M/3WF2pBgCp1MJ/HugxC8mJCGQYQJkIE5WNnqJER0geuEAVs9hmGRqynKFoJNnil5gJoM/0EzkDCBMXiINvNp3U9yGx7TjJd3/jsO9oQ6ZW0kaPzHjU7xGQlbXQccC239EeMRr8spnVMe7be99dhKXPqTMJllJkM9vrAWSnCGiZu1yAmHKVSaM4pxRkC0hlVElhqtJ1ZBEKP4qfTnZOpDPCc4/2MmK8+zzT1znWFjI1c512Z0diJRFgXzUwCHfGynaF9qjKO6Juo3YN8kuvDLfzb6MbYRPZTBLqLjdDrrJkBThDaMqi4GMyisqnT6HLUUvyjptiqE8B7qj8K4V0IQpXtj4Ha6qyMzxEn1+/obxIf9pvMI0AyT77f6fBNBEavx41kM+9wTkYdHUz3IIYZUesPbs7A9e+wjs6nCAviPdPk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(136003)(396003)(346002)(376002)(366004)(230922051799003)(186009)(451199024)(1800799009)(64100799003)(2906002)(4744005)(4001150100001)(316002)(6916009)(54906003)(31696002)(86362001)(66946007)(38100700002)(66476007)(66556008)(6506007)(53546011)(6512007)(478600001)(6486002)(26005)(2616005)(4326008)(41300700001)(5660300002)(36756003)(8676002)(8936002)(31686004)(41533002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UHFOQy82MzJnbHF1VUMrUEh6ZGRpcVFQNFZ3RGxqK2ZmSnVHUlJmOXd3SXdX?=
 =?utf-8?B?UGttekpXeEpQMStkUlJodXgwQWwvNjd6K29MWE95QUpuQkM2M0tKYkFNTlVO?=
 =?utf-8?B?Q1pLSlAxQXF6RHFzakN4N1NoYzZ6aEdMS2E4YjN2cnlqT3I0Y0VCVVdudmJI?=
 =?utf-8?B?bWEyektnYThpTU1nKzc0aFVmMDFZODNVcDZtbGVpMnAyT3EycmtIUE5JMUQy?=
 =?utf-8?B?K3ZoUEtwMkhQV0ZlZTdSd2E1NTRBbmJGaXRWdm0rbGI3a3UxR0FEVTVGSTBE?=
 =?utf-8?B?UWJ2cWttYS8vb3Q2b2VTRzZVcC80YTlnSXprMFJVTEhpcHB5VWZkZzJEekdU?=
 =?utf-8?B?WVd4SENXalgxL280ZnNxRGVnSUJuekczV2gyVlZXbnRiOFlkZysvMGZwQklI?=
 =?utf-8?B?TlRyUVVuL1B2ZEFWN1ZkTHArZjU5K25zSGp6UzFZa2l4bE8vMmcxcnh2VGlX?=
 =?utf-8?B?N1FyNVc0NUVZZEhncmI5dy9vRkZGdFovcFhXeXNEQVprY2Y5RW0zUzByRVBU?=
 =?utf-8?B?R2liZXphYjVpd0pGK2oxOFlYdGxBamVEd1JtRW5CeHYrRm5RdDFPVmg3UC9m?=
 =?utf-8?B?M2daZ0lCTm5Wd1psa1JSYXJENnNUM3AwdTJvZUpZMEd5V21kSjNJK0NORGZF?=
 =?utf-8?B?cHY0Zmh1bUpUdHB0aDdrUzhFckw3czJTUnQ0d2NMbWtCdWYya1hWMUVVSmpr?=
 =?utf-8?B?d004Z3F0V0JaTFNhSlhuQW11TUpzTitucVMzNHl1TVFKLzYvVDNzT2ZEVFB5?=
 =?utf-8?B?R2dXT3pQV2V5TnJjQnhQRU1zRWpGeUJhMTROSWtIcENTNERQY25qdVAwQUpT?=
 =?utf-8?B?UXJFZHh5aGxmdVVMQ0ZtK3dseDVRblBPNnd5bGlhUVRuSktzeXZvQkYxRG9F?=
 =?utf-8?B?S0JmM1NMWkRYV1NlRTgzVDVtRWxodnFQS0hkR1FhSEtNK2hnOEgzdkxMK01a?=
 =?utf-8?B?d3dxR2V6NXVKRFNFRDhRRmNXejJkMGI3em1Rc0NTajl4MWROQUhWMVVieG54?=
 =?utf-8?B?azArTkx0S2lYUjlRRnRLSFZuM1h0RnY3Rm1JK2dackV1aGI0ZjIwOERQS0lJ?=
 =?utf-8?B?ZGJwaXhlYXl1dUZaM09nNDNEc1d6NVdCMGd3Szd1aEVrSzVRVHJZcmtvRVp3?=
 =?utf-8?B?T0R3SCtjckZjSVdlOUp4UVVGQ0J3YytYcVJkbmdIU3FWU3Y1NUczMERucCtD?=
 =?utf-8?B?cGpFYTBJTU1NaCtsK08wN3V2ZGd5ZnQ3bHpQQlB5bE5wSFM5dlQwWFk5S2Vo?=
 =?utf-8?B?OHJaM1YyaDg2UG50d3pHTW0reDh0aG5nd1VuOVpUZkJuMDJWL0dadWpVQnl3?=
 =?utf-8?B?R2xNTmNDY3E3ZVM0UXNBNFZSVlhnN1ZabmFoNjYxRytYaVRzd1dOeUF6ZGJB?=
 =?utf-8?B?dXVOUkRkMUhZQ0lTcGMzSEhYc0lDVm1CelFCQUNGT2d2N0hBVlk0UjM3c0FH?=
 =?utf-8?B?dzBoM2dQYTcyQ212UmRsVkpwZ0h0dXFlcll6NExkdmJTN1V6Si9GbXg1WnEv?=
 =?utf-8?B?ZElQbkR2NHhCUjNQZHUrdlltR1k5eXQyNFpYYU5EOWJabXZkUEdrUk5PY0tX?=
 =?utf-8?B?QUk0cVpwOVN0RXhTTGJHTC9jd3RXbjBEbk9ZeFRPU0Jnc2hIMzVlL1gxL2U4?=
 =?utf-8?B?dXBpMXRCenIyRWpPNmxsUUVZSUFNc2orK0l0NklwZXdienZNVXNOS0Nkekdz?=
 =?utf-8?B?eE40VDh6SFRvdkF4dEtBZGtKbzJYRENKWTJ2dXg3Y3VySHVEV0tTMW9yb0JP?=
 =?utf-8?B?N0hEbGx5R2RONlBZL0hsRVBsbDRrOGlYcnE0amhsa3hDZEpOaENjN3NpbUZm?=
 =?utf-8?B?OERyYTB6Q2JrZEtodUJwU1YyaWYrYTRFOXNsY0xFRXdjT0xkR0syeFg5TG1B?=
 =?utf-8?B?UkxycnRWRmg3UmZ2UXFjRndFUHVQSkNDSjFSSFVQa2NXOW1rT29YNlRkUGlq?=
 =?utf-8?B?MkNUOE5sY2tiMjZqc2IvS2tEQ1pkdGF3NWQ5RG9Oa0RlVFFKa2EzUmpuOU5j?=
 =?utf-8?B?K0dadXd6WnJUb09jaS9wdnRabHBNb1l2ajFSc1R0MitET1ZUc283eEZ5YkM3?=
 =?utf-8?B?SUJQbnpjK3RLRkVMWEFBemVwZUdHZm04dUdVMzc3NTNuazN4SGRMbDVyVyt3?=
 =?utf-8?Q?URxZ9+Onnm3unzvNB46+bk9D0?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c57a5714-e33b-40d4-3e86-08dbd3bf6832
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2023 11:58:44.4537
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xTbqBI4UKK2wyb3QihYsK5byJ7t3VtC/Yhm47ZAsrSKW1SZPaH4Hke+Syg7wPm9DT6IMbdLgLhDeVdlsN8bVOg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8559

On 23.10.2023 12:50, Oleksii wrote:
> On Thu, 2023-10-19 at 11:55 +0200, Jan Beulich wrote:
>> While more involved, I still wonder whether xen/pci.h could also
>> avoid
>> including asm/pci.h when !HAS_PCI. Of course there's more than just
>> the
>> #include which then would need #ifdef-ing out.
> It looks like we can get with #ifdef-ing. I'll push a separate patch
> for xen/pci.h.
> 
> It will probably need to remove usage of <asm/pci.h> everywhere or
> #ifdef-ing it too.
> Which option will be better?

What's "everywhere" here? The only non-arch-dependent use I can spot
is in xen/pci.h.

Jan


