Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F294F416FC8
	for <lists+xen-devel@lfdr.de>; Fri, 24 Sep 2021 11:59:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.195200.347802 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mThzC-0001xD-Kq; Fri, 24 Sep 2021 09:59:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 195200.347802; Fri, 24 Sep 2021 09:59:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mThzC-0001vP-HV; Fri, 24 Sep 2021 09:59:18 +0000
Received: by outflank-mailman (input) for mailman id 195200;
 Fri, 24 Sep 2021 09:59:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=wINm=OO=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mThzA-0001vD-Nw
 for xen-devel@lists.xenproject.org; Fri, 24 Sep 2021 09:59:16 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 78f18b1f-8cae-4a57-9fa7-8b80fc127153;
 Fri, 24 Sep 2021 09:59:16 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2173.outbound.protection.outlook.com [104.47.17.173])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-11-Tz40-cw2O-u5kW-x1X3tCg-1; Fri, 24 Sep 2021 11:59:13 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5901.eurprd04.prod.outlook.com (2603:10a6:803:e9::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13; Fri, 24 Sep
 2021 09:59:09 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4544.018; Fri, 24 Sep 2021
 09:59:09 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR1PR01CA0029.eurprd01.prod.exchangelabs.com (2603:10a6:102::42) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13 via Frontend
 Transport; Fri, 24 Sep 2021 09:59:08 +0000
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
X-Inumbo-ID: 78f18b1f-8cae-4a57-9fa7-8b80fc127153
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1632477555;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5WR5TsPKpIUkmQ4IQU9GK9qAtnS1zO3umVFMyOynuwM=;
	b=UGKDFHZWK/pC2GpoceEe6I3vC43S0d+qZ2L3ZnKidtV/dd4vnPxnFB7tg73KABjgVa+cyM
	zdmxGaepZhr57i9qI0AU7kqScyShj9GpKulMFOMQ36cAnpPuDObxNz/Ux/i0WY3rEhuT6H
	S8TXEW+on5k94U5Zy1bpYOxlu/qt54o=
X-MC-Unique: Tz40-cw2O-u5kW-x1X3tCg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZYhDv6x1ajlroHEjGPfUkuhpCMT1sUMurmdSEy32PwQ8Evs3/vfUwIovPhJm1/wZKrlQCfuSpA72PMRhTbm6jek0FZIQb8sJTnSRZvvfQvq9lHQY+LDXYedUyoTEY2qonOdP8EJWpDHiQexvnFiXq00sHEx8Qep5VLzaeS7C4I/6iJCy6Yl3ViziFhd+YnUbPPWV6AwX9k0RN/CObmH5lveZTfed1ZKffEkauoaEFd09wK9xm3zC8iJSpf2eQxf5hw2Tv4MnAQzpkXjZLBaZXxst3EQ91UU+4dnTL6dPBWvbR5XB6MxCPkgqMvPenaKgVcAfAOwnzXX8RQ1TTVBYwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=5WR5TsPKpIUkmQ4IQU9GK9qAtnS1zO3umVFMyOynuwM=;
 b=Kzm/Lh0NzSHUIzpnSTZeaUBJNo6Xe/+zhjwxNm5/e1o7AAESgRC7VYnq0M0TZojSPLsnSBBPLVRtT4BdX+7+zDlPvuS4c9than9buxCXvHWXVwyDnkZD21NtLJatDHauVlxDdjQ5v9MZz3qckfUPaFkQ+Ez1c+n6cF2AvXpj/KPV9Ty8wR/8dZWB8Z8TbWK7bbHehJTCSk8x/9TRijmsuWF5kXZrZj51YSb2DNogqfPDOKHdDMhC2+YdVD0pwSszSFqXzokE3MJAoQeKfB51AYcqTe4EgYHnrBFSM/lRtudU3VuGtvt18gvziHkM37HX4C2igEMosui1b2goB0wHug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH v2] pci: fix handling of PCI bridges with subordinate bus
 number 0xff
To: Igor Druzhinin <igor.druzhinin@citrix.com>
Cc: paul@xen.org, xen-devel@lists.xenproject.org
References: <1632474612-9940-1-git-send-email-igor.druzhinin@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <0b008762-e483-5d94-e380-1b37adb36396@suse.com>
Date: Fri, 24 Sep 2021 11:59:07 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <1632474612-9940-1-git-send-email-igor.druzhinin@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR1PR01CA0029.eurprd01.prod.exchangelabs.com
 (2603:10a6:102::42) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5ddc86da-70c2-44cf-6f81-08d97f41f3ee
X-MS-TrafficTypeDiagnostic: VI1PR04MB5901:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB59015D27E7839D17FACE28F1B3A49@VI1PR04MB5901.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4941;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	eSQdU4FCp+hRxcHPLcQWiHVnPKzu6S4OHNnALadJAcxHwry0//fH3F0wYaEIxsPOq4Ywei7j+LJhxUCtDASfRngYDkIp1TsM9THXuiZ1OiJ8Jx+dTKfBXxK9mveTnMCJdy9UCNVhecqm6LhpZYmWlr0wQXknblI/Am7E/3R3GoAFOBHIHmOHekseghVhySF8kVC8CYmBfPveZua9/sYBAG5zETVuxIxRaMp5CXQvnIMV0adx51kb/nlw+jxM8dlwuUkfh4n0olSa9QZd0lHwCqywI3eELT22G4RmimP/3/AlNPlr+G048esdpQEsYKvuBfrZL/oqTaT4nhKTh8r8ZDhmr7Us1kn3KiRzvq322gSy8s9T7pJxmlCcrNfJycmj/xyMd48xXKSs19/X5vk9AvuBzie7C29GHY1dt5iEnwh/g8wo8B+f0WeTPN3zpQ1acrDoZRjhqVmMHbHDrupFMSRLaoDhFJDx0Hjf1NBIKR/o3t7V2uFkO8hycd4A55JL+OqysKoo1Nvzh/oZfEbPD7Rm8AEfHb0Hd6NKv2FkML0CR8BUvlkmGk0WGM+3JrL52tw9NHjs6LFymgoh+liK9iGuIduKrT8Tc2gwS71xcPi1E9gU7bC2BUL35QQ1byQhXay7USKFAvjK0yx+QMEr3T5b9iOhCOSOrkrJjo85yBWoa6Dd4XQq8FSLA8nsKsJbgQJhqfqn72i1gLGMAX7WMA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(83380400001)(31686004)(4744005)(6486002)(53546011)(31696002)(956004)(8936002)(186003)(2616005)(4326008)(8676002)(86362001)(508600001)(6916009)(2906002)(36756003)(38100700002)(316002)(66556008)(66476007)(16576012)(5660300002)(26005)(66946007)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aWUxQVB6aVZKVVM0SExlZStHcjlkdVh3WGpTQXQ0T0hmNFZjenN3M1Baa2FF?=
 =?utf-8?B?R3BmbFplczhYVEhGTWN6ekN1dUpsamFEaDRPRlJwTFhjWVF6L2NScEdDLzEy?=
 =?utf-8?B?czdrTlczaXh4TEhTemF3RUVKbXBpUFFVdWxuS3kwVncyY1FRb3V5U2YwQW01?=
 =?utf-8?B?c3NrdldXS3E1bmsrNlFtcjhJNGF2UzltcjJxU1J3K2JyMTUxRUdXR0VmajhQ?=
 =?utf-8?B?SVdRdW1pN3NXalJyeC9zaGlZNWtFQUJwcFJYSUNodlhIa0JGRmRJSCtsNm1i?=
 =?utf-8?B?VnVTN1R0ODVXVTNKdmtuOVlVYzM2UlU3bmZMYTVoVWdVWHVERUJWVHFwOElS?=
 =?utf-8?B?Uk1qa3Vtd0gzMUlaQjh1amVyR1pmbkY0Ui84Q2x2b0EwaVIzTXFuZUpYd0Qz?=
 =?utf-8?B?bXFLUDJldnVYWEo4MEVEYXp6S21STnJsRjhNSTBiUU5QOEIvTXlRUUc2WXF1?=
 =?utf-8?B?SzByR3YvYUp5aTVocjMzSmVwK2Q1S24yaDlFTTIvN3JiMWgyN3ZtNUtmWTRz?=
 =?utf-8?B?ckNBQTJJTDJCQzJWY2RtdnVHMTVvUXRrbFY2dHhzYURUMU1QYVUzMkJIdHM5?=
 =?utf-8?B?NkZMWGVVZnY3cCtCeFc4Z3NxTmxBeks0aUtsUUFvMXhRNW9TYXQ2K2ZSdWhI?=
 =?utf-8?B?UXUvY0JsSlRPcWI5WC95YUQ2VS9BdUZybnBBRndLOHROQ05EMDVFdHBkV2k2?=
 =?utf-8?B?WmZoMEtJVElGbWVEU2M0c0dOZTVRL0ZDQzBVdldYdkJlRiswOVhBVUozYi94?=
 =?utf-8?B?dmJ3MlhxNFFtcjhtNHlGN205R2U0Mk9FUVhkc0toa01xRDA1WUVoVk42T1RL?=
 =?utf-8?B?K1VmM1BEU3Q4MHh2Y3RJTS9KOXBNaEdBSnpKRmNyTXZ3elR6QnR4OUpha3Qy?=
 =?utf-8?B?TzBkZGFlcU00eHpQWVVMT3VtQngwckhMYSt0TGlia1ZxVURTQmZWbGhTVDZj?=
 =?utf-8?B?Ykx5OVFZYXFzNCt3T2JtalhrczV4Si9QYUFRNHMvdTA5cVVQNHJhejJUTGNa?=
 =?utf-8?B?UkRtSDRCMStjY0VWQnF6RTRhbTJBNCtBa3ExUlIyUUFUd2ovRUhIMkdSSDY5?=
 =?utf-8?B?NlY4NjVhSk1GM0ZheWNON0o0QkNZYmk1S0N1eG96UjBOVTUvdGRydXNsQXk3?=
 =?utf-8?B?OXFWZjI0QmxtaHg3VHMybXRraWR6QllFai8xWGlWR2dRWXdnMXpnc0NqaUdm?=
 =?utf-8?B?K0xoOUR5RldGRHhKdUpvUmtRVkwxV0k5eXJOWVA1SGZGbE5JWERoTnFsa0ls?=
 =?utf-8?B?T2dTcXQrMlIyYUd4dFplbGw1UUpjSTd5U0tSZDlxU1VvOEZueExQQ0tqcXlO?=
 =?utf-8?B?SEQ4Y0JSdCt2MkhqeWVjWUVJWVcyK3NaQ21lTVhZbmt1d2R1S295d1AvZGZ3?=
 =?utf-8?B?Y2p2SUcvZTV4MmV0NFpIWkRFYmR3S2JKQlIvajJZZzF1eDkyYVZvN1ZUc09P?=
 =?utf-8?B?QVgwc2Z4WW9VZ0tKT042ZVg2TUp5ZDljRCtSU094cUFHNlc1YkhSRm82aXNl?=
 =?utf-8?B?WFBJTGt6Z0VLelZTQkRsU2VYZ0RzUUVkbFNKck5BZTFuUFZkUlh2RElmeUJq?=
 =?utf-8?B?SGExdEF1eHF6OXZrbzFZa0VtM1JLbXlTMHFLMCtpZENubjIvL0FSM1JpY0FB?=
 =?utf-8?B?ZitEdTVFQytrY0NKVUJSc0FreFZkYUlwNUplTitxV2p1cU9ONzIzY0FnbTFN?=
 =?utf-8?B?SFdvZzQ4RTAzK1BycGZwdnAvNVN6WFNmT25Rd2RtZS83MnVTWnZ3RWFxa09l?=
 =?utf-8?Q?RFRyZqQoBwQiaKPcdF2QS6gO7mPQ6mJwh6adPGv?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ddc86da-70c2-44cf-6f81-08d97f41f3ee
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2021 09:59:09.2866
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XFXBZtxMAfXUJU8RyPJZG8W9Ic4rmdHYdlKkKvwH7BPOZD7DmVrHkn1nxowYY4EDW8R+qA05Tv03+AhxnBZjfw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5901

On 24.09.2021 11:10, Igor Druzhinin wrote:
> Bus number 0xff is valid according to the PCI spec. Using u8 typed sub_bus
> and assigning 0xff to it will result in the following loop getting stuck.
> 
>     for ( ; sec_bus <= sub_bus; sec_bus++ ) {...}
> 
> Just change its type to unsigned int similarly to what is already done in
> dmar_scope_add_buses().
> 
> Signed-off-by: Igor Druzhinin <igor.druzhinin@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>


