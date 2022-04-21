Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E9A950A05D
	for <lists+xen-devel@lfdr.de>; Thu, 21 Apr 2022 15:08:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.310130.526789 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nhWXc-0000T8-GO; Thu, 21 Apr 2022 13:08:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 310130.526789; Thu, 21 Apr 2022 13:08:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nhWXc-0000RL-D3; Thu, 21 Apr 2022 13:08:12 +0000
Received: by outflank-mailman (input) for mailman id 310130;
 Thu, 21 Apr 2022 13:08:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lloE=U7=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nhWXa-0000RD-GE
 for xen-devel@lists.xenproject.org; Thu, 21 Apr 2022 13:08:10 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 17585d02-c174-11ec-8fc2-03012f2f19d4;
 Thu, 21 Apr 2022 15:08:09 +0200 (CEST)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2177.outbound.protection.outlook.com [104.47.17.177]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-4-IkyQrpd3MTmfzf9aqEGO8g-1; Thu, 21 Apr 2022 15:08:07 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by PAXPR04MB8893.eurprd04.prod.outlook.com (2603:10a6:102:20c::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.14; Thu, 21 Apr
 2022 13:08:06 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f%7]) with mapi id 15.20.5186.015; Thu, 21 Apr 2022
 13:08:06 +0000
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
X-Inumbo-ID: 17585d02-c174-11ec-8fc2-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1650546489;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=m3Ll8XXoAgebmEaBxUAzSYZ46MdXqYrYM0ejhfGT9/4=;
	b=O9dskZ76lkpaH9yoQ+T5vTMWEwKnsK7n5Efn+Y2cmdnlwM39FnfKQUm1wnvDckxEad4+mJ
	OVQQNA6QYRn+0qpMace+syJgMCjqHXFSStXa66cuEuz/oVMI2kMVRIBrK/6U2ZZTG2j0H2
	Uy3yUXSMhb0goBIzrT18mqnPcew+AC4=
X-MC-Unique: IkyQrpd3MTmfzf9aqEGO8g-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F8YyXXiDs1vFLJcMC4rI2Fub7Ly9HcwnxcUGd4jZLDoNpax3Mm4QQHLouv4OrBKf5DO+VzXLhs/pqUQe7CuuYw5NyTYMs8GdesT7ID0PEXNewT5FkyjaOXBo914bz7CySJX2ts53A/BxMPl2n9DjRl4/0+tjwPdQqwaT+Rv9N1XMEnTn2Hsb5KOMOX7rChKnvwXj9u9sYGjHLT7cmo9CoJbeEzm8GwsTXr4vfj8H1WZdTCvOamNhWLRFxPVgyYwbN4v8F6yn+E1V/3MOv16HRrFtvFSkkFINm/oA+4T+d9GX/SEvypHHKFRIMQug+tAYJYIpZ4SiSYeUgTHUM4Qw9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m3Ll8XXoAgebmEaBxUAzSYZ46MdXqYrYM0ejhfGT9/4=;
 b=ghaNz59EDWKuutuHuofg/VrGnPvk5o6XfAySzyI7D+dLFm5Tq34ltlASWGhnpg+YRUKn2W971m7uPR3NycX95ndILPbAOS9pIyLmaXTkprwSB+Zd/rAUv5SSkk0A6EPBhkou0YTRG+3PRU0kwGshQ3uIyQAgLzuHHrvdlzwWL5trEQhSk1Y0xnf8LuPzvwhBxLEfv1QAqmuXamzfOd8WtseCruor+uqNMBy0CspuS8xvrBnu7/KmKABbbmlOKxlrm1gjpnApRRWFHVrj3raxxCsEebsuich5dz1dO5iDemqQXpLPQK+qRO3/9FC8BOrj/H4CaYTn3NhzxQRRvAb6Pw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <acb6c1d3-7270-f651-4a8c-86b8c089075b@suse.com>
Date: Thu, 21 Apr 2022 15:08:04 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v5 3/6] x86/gdbsx: Move domain_pause_for_debugger() into
 gdbsx
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20220420141307.24153-1-andrew.cooper3@citrix.com>
 <20220420141307.24153-4-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220420141307.24153-4-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM5PR0301CA0022.eurprd03.prod.outlook.com
 (2603:10a6:206:14::35) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c1387474-a193-4ea4-b94d-08da2397f98b
X-MS-TrafficTypeDiagnostic: PAXPR04MB8893:EE_
X-Microsoft-Antispam-PRVS:
	<PAXPR04MB889383CDCBF7BA45EB90770CB3F49@PAXPR04MB8893.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	PYvh0NcyHBBu8Jbep42QIrpL2jFQTYgZWZ/u4zibtZwnE9cQLNsyEEZGn8UVypmTQQTjI2Gs+43l9l+SKQjVc7xb8r0wNLqejozG1K20I09d3N+5i7iVcs6RX4NyAJvcUKCBgcIz+t98P3c7z0b4uMUPsce0I0vLokHPZvpUxFSeB/VQ2loRiF2h6hi/EfnZWtW/vwvK1wLn40E+dIS8mRC2Co8++19IQB/VS4AO80rKXV54Wm0+MGj0ecdXfpRwLNijjNTHONOix1YI0+u0+djVF5Dkt6gYG5ioinkzoiQONJyKp1hLU8AIH0/wulHUf13DM7qZ/TnlArxQQcBZcxBkeHeyYHl6OhpY3lisiMey2NYHKisS0puR8yI6R3b5CX7gDvDgdr5kPO1r+RidEStoEbNxpXQE/pkDgsbiDzMGUJabtIsQn53NtfP5EmXgha0AeE0YnS+1Lod7RRSiucdZceJz8S0mt1jGDFPAUzEkycXNk8+8PMiIAqzy4I2BAK4QmVCVc11S7emzB/f5rZ/IPmrP24Z+gABRv+Hlu2pnT4mnZvNZdZfhY73r+ti8mpVpKfrSJObcAupruNlpy75ZljZG5h6155b/X7oj7tlywKBQjn2TMSmlXmRY2wK8ecIeeuYMZnhrklBQyBnSmi/6AWafNhhN0UBZCE0v6B3WiHoTNdhNz5X9eyGWSmn+2Vfma/tJuBgWFyRs9AP+lw0F6pS3QOpYdzkX3o+Ybxz/agOLCJzu2lA3JlW0ZRL9iOTBT8iWWcOdBtaJQDhvew==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(186003)(31686004)(2906002)(2616005)(26005)(4744005)(6512007)(36756003)(8936002)(5660300002)(86362001)(31696002)(38100700002)(8676002)(4326008)(6486002)(66556008)(66946007)(66476007)(53546011)(508600001)(316002)(6916009)(54906003)(6506007)(17423001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NHJvR1llc2hJYlBPRjB3ZGljSXVVWUhTT2FIK1MvUXpweStGa295ZkNDa0V2?=
 =?utf-8?B?KzZKRUliZER3U2dLYWVNN2QvaFljMHlVZjFrZWllOXE3alZEVVkyMmZKNGhS?=
 =?utf-8?B?UTMvVUFrQ0FEdWoxU09jUGluM2dzSjJrS28rRVRFSXZzaGlmRm5XVFNQUWpK?=
 =?utf-8?B?NUFrNWdJakZQL3FtSFdnNEwyVEtOVFZpcEEzZm9IZTlNRU5hUGZ4N25wODA1?=
 =?utf-8?B?WTRsaG1ucG1iZlZ2MGZDZFRNVk1KZnF2K1JYY3pyQi8yVkVNbnVHY3YrY2wz?=
 =?utf-8?B?NFZ1a2l2YlNQekVseGlzWVQwejRGZlVNOXNyOUFNSmJScU9VQ0hrenN1eG50?=
 =?utf-8?B?YkNDMDlzejQ5YXIyMDQzZ25odGhrQUdBZHlTZm9KSGVwVnJ0Rlk4U0pIRVN0?=
 =?utf-8?B?MGoxanJqUEIxeVBUR3ZkRjRuR0t6OS9oa0g2b212NWc5bFBETU5IbzM4eTZh?=
 =?utf-8?B?QUlUQWFkZm5TYmkwUW5CMzU1cEgxbkJrZitnOERveWk2ODJ2VkdRSllBS1NK?=
 =?utf-8?B?WkhPd1NFTlFnWnRmOU00NFY2RDcxOUZKUGFtbFNuaDQxczR2ZzlTR3FpWXVB?=
 =?utf-8?B?Vm1yelMybXpoOWk0QWg1ZnA0b2R1ZlRTOUlaNnIvWVAvRHpCMHZ6YWlIbDRt?=
 =?utf-8?B?Witxb0Z2NVN3ZzNFeVpwZ0U0dnY5Um54U25KZFdKWlRPR1hxYk9UZmx5S2Ni?=
 =?utf-8?B?NmxzZXhOY0p4RURnQzVqL2lLMzVpZ2NMY2ZpR01kOWZHdWtaWjM4SU1BR0tI?=
 =?utf-8?B?OVhNVDdaSGd6MmtJQkJYLzF5RmpNa0xidXlXSnZuR0Y1Q0hOWUxsTHhmSmlJ?=
 =?utf-8?B?NVRidFRieVlaWGpWOXFNZTduM2s0eWVmSXRUV0toZURjakE1YmdWNE5VanBi?=
 =?utf-8?B?VUpzLysreEFRWWkzUW5NNzcxNERpU2l3YnZxR0NIbStPcFhmUFhlVWJ2Vmxi?=
 =?utf-8?B?dDVrYWEvQkl2TTMzb2M3T3dWckpzRE1RN2J5Rnp2TGp4TysxaEtNcEhDdFRp?=
 =?utf-8?B?VE9ZNGpXY2tnWXkycFlvdDVGUmhaUGpCM0VWemNWWWcyZEJiWGF1RXJMR05E?=
 =?utf-8?B?WXczQ1A3QlA1ZFNxanZKaFQ1dkl2cDdybHFOemRCUWozUnplMnVIclVXUHJE?=
 =?utf-8?B?aisxUE11OWpCNzZOTDFzR2dBOFJUcytUaWRPcFZnWHJsbGxrcGxtQXV6V1hm?=
 =?utf-8?B?NWdoTXhhcy96STR3cHFSZFJmYXZaNHNsc1VQbWhVeVRVbXBQUHJ0UzhHdmtC?=
 =?utf-8?B?dkEzZHNPNG1UWWZ2NTVYSDZiOWVPM0tRa1hOZHcwOWVhRlNXTmtrRjJKUnRz?=
 =?utf-8?B?a2dRK1FIeWxnRWNDR1R5Z29UU2l5WkdLZnI3RTc1WkVCcFRyTndZdFdSaVVh?=
 =?utf-8?B?Zno4VWcxbkxRa0NtMVNPbHpGYVc2UWZ6emlWTXFpYW12emxkbm5ESmhaRHk0?=
 =?utf-8?B?dGJ4UXU2VUoyNG5CandIRHBPeXNCMzJlWW1FZTBFZ2VVWHFUNFluWVdCdlRK?=
 =?utf-8?B?dVV3NWlVcTdDNUp6dU1kOWxCcGtkWWdkQW1vLzdjQjZrZy9rYi9STlRVVDBs?=
 =?utf-8?B?bDhka2dLamhraXJWWnpNemlpaUNOL1dTekRNa3F3dXFuWVJ4a2ZpQUZjTmtt?=
 =?utf-8?B?NUcwSDRHMlp6UnpnQVA3QnVXVG1wd0YxY2lkOEp1LzNZemxzU1lkMmhlNEZa?=
 =?utf-8?B?b3NoTVB1Y1praHpMNXNnVDFLVXNvWm9lNnZlVWtKcXJVd0huU2lBaWVSWUN6?=
 =?utf-8?B?QkUvNFA4RnFsdnZ6Rm41REJLYjJCcWdnTjdJaUhZc0Z3ZHh0QW1RMHM4NTd4?=
 =?utf-8?B?VjkxcTJYaUlwdVdkdmtsMXMyaStpR3V0NWxoOXRxOEJFY0xjMmtuOGpyM0hz?=
 =?utf-8?B?ZXJlV2lPY1RIaFAyOFpiQitUSGZOeVdvdUJGRGhvalZzcUJmanRTT2VsQ1NB?=
 =?utf-8?B?aUEvNGR2N2NpVm5uZWtub1lBUEMxVEErTnl4cy9qVzJaditIQ0ZNZnNvSy9X?=
 =?utf-8?B?UWtVRHpwRmhJOVM2b3hweS8xQW41RHJzV2tWNmdDRG9QajE5R2xJMXRlb1Vz?=
 =?utf-8?B?Qk42a0tVWWd2SnVyR291allNN0dqWXFTS3o2QzVWSGFWY2MvTTIyNkdidnRn?=
 =?utf-8?B?dUxJU2EvRTdYQWpZNUF0eDVVdXMyS05hQXR2TGJwZnFRZmJxOVl6Mk5YNElT?=
 =?utf-8?B?ZVVGaU1uS3pvL2RqSVVEckl5ZTBtNUYwYnZpaXdiVjRIRHJpd2kxZmo1aDRa?=
 =?utf-8?B?QXVTc0duV2ROQUtjcHpZbk9ONlA1Q3loYlhrYldGSDZaUXo0d0gybjFETTJL?=
 =?utf-8?B?ZXd4SlV6WkFHNlBjc2dFUEFOVzJmL2pNVXdyaVpYTHE4cklJeEJPUT09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c1387474-a193-4ea4-b94d-08da2397f98b
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2022 13:08:06.1950
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6fG4I/9aSkCcXO+BjymVrfZbFWP/FxpEx5JiMsoaVnpyZEhRCGHlROFfeZbnbztoKajVHrI4p7mr7/jblIH8Qg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8893

On 20.04.2022 16:13, Andrew Cooper wrote:
> domain_pause_for_debugger() is guest debugging (CONFIG_GDBSX) not host
> debugging (CONFIG_CRASH_DEBUG).
> 
> Move it into the new gdbsx.c to drop the (incorrect) ifdefary, and provide a
> static inline in the !CONFIG_GDBSX case so callers can optimise away
> everything rather than having to emit a call to an empty function.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>


