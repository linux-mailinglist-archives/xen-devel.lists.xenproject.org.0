Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C871742A298
	for <lists+xen-devel@lfdr.de>; Tue, 12 Oct 2021 12:45:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.207099.362854 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1maFHA-0004pM-GW; Tue, 12 Oct 2021 10:44:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 207099.362854; Tue, 12 Oct 2021 10:44:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1maFHA-0004ls-BH; Tue, 12 Oct 2021 10:44:52 +0000
Received: by outflank-mailman (input) for mailman id 207099;
 Tue, 12 Oct 2021 10:44:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/4YK=PA=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1maFH8-0004lm-8L
 for xen-devel@lists.xenproject.org; Tue, 12 Oct 2021 10:44:50 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b619b2ec-bd5d-44ad-b1e1-b5bb928227a8;
 Tue, 12 Oct 2021 10:44:49 +0000 (UTC)
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01lp2056.outbound.protection.outlook.com [104.47.0.56]) (Using
 TLS) by relay.mimecast.com with ESMTP id de-mta-3-EndXMT0aPuKwWAY5tVMqwg-1;
 Tue, 12 Oct 2021 12:44:47 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5599.eurprd04.prod.outlook.com (2603:10a6:803:de::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.19; Tue, 12 Oct
 2021 10:44:45 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4587.026; Tue, 12 Oct 2021
 10:44:45 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM6P192CA0087.EURP192.PROD.OUTLOOK.COM (2603:10a6:209:8d::28) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4544.27 via Frontend Transport; Tue, 12 Oct 2021 10:44:44 +0000
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
X-Inumbo-ID: b619b2ec-bd5d-44ad-b1e1-b5bb928227a8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1634035488;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xYx0Oca5q9WtFK1Q+0zPto8fLAaNTygfy9vMrtYAAB8=;
	b=hxWHE/X379vgi77cCl0c0dY7o/ISzHWmgFY3kUwjXG8u2vuLmcGieMN0+XR9rOqx6ZHGBz
	jIaqPtCzFqZysJqNLpZV/P2YxW9B0LwooxgU6JSitfQ3iEv2sf9jiIRVOnz1bU6sabLwdH
	LdYD1vp7Ra8OejMgK70SK+UXbgLPxcs=
X-MC-Unique: EndXMT0aPuKwWAY5tVMqwg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Vh5msktervtd5lIkM7O19lIk0SqLLdlb/QOoo/enAYEz+a1Km1uZhx10bPJX49Imab24IrTmlYqqJaWxFAeYDfwbSnQAhBbbhMOwVwszCUACHTTGk58bIT0ouEizS0/uIhaVUPxr3orLqe5jKDtmpqM95WFbB9mQVwB1jokRQFooEl6zIltZVXGmymmnNYVKlXcrbCcg2h2SUrPLeQVKMj9TOi0iSLVgBKUGgoWH9cofh0hpx8njPaaHeBpiklb7lwKPP712+HH61h+o+QjkConXuCZChiWk2I38rFvnXxUpohXon3zpxPLJapRQdL/GqKHN610gZdPsVlO3DAsEwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xYx0Oca5q9WtFK1Q+0zPto8fLAaNTygfy9vMrtYAAB8=;
 b=Wb/qsDg/401lcU7WI11mEZoiNtXz7t9WhoXg1Cid3Odam+847feEW1uV977FhgHdEzXzAOxe7eNc3af58dCF+1kqRaF4iFv+1jduu8foYV6KRjsACQJ7i3XmKeAzlIyMLygqm4dOjygSzY4b4eZrK/9L2J1QryyOcVuh+4m3ZgpvnMU5+7pOMdBKhlxcrRQUc1b3UKLA1YaUCPeMYZKmCxeOtYEMEWtBXzDiTBrgx1W+ebVIkovpnJOxOMNiLaTeAv92RlhEhC4FsVDU+0F6nNbcaXgtZ4fuwvsNE37ltPD44Ni9gI8oi82pKFX7WeUZtvt8AyB/thd9VMpqqmyx3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=suse.com;
Subject: Re: [PATCH v5 01/11] xen/arm: xc_domain_ioport_permission(..) not
 supported on ARM.
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>,
 Rahul Singh <Rahul.Singh@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andre Przywara <Andre.Przywara@arm.com>, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>, Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <cover.1633540842.git.rahul.singh@arm.com>
 <d292392268df2c74c4103a82ef917072643407a8.1633540842.git.rahul.singh@arm.com>
 <YWQkblfNMYEs6jI9@MacBook-Air-de-Roger.local>
 <77CF7FA5-C566-469E-B4A8-0400789890BB@arm.com>
 <YWQ6Nk3Jk+BqgkwZ@MacBook-Air-de-Roger.local>
 <53AE6E2A-01D7-41EC-9B2C-C0D596EB8D4D@arm.com>
 <YWRCxXGQIyTOAepC@MacBook-Air-de-Roger.local>
 <FEF0B03A-5AC8-4F8D-B821-191AC2EF8295@arm.com>
 <YWRnMfAi808TQ4Gt@MacBook-Air-de-Roger.local>
 <EB1CB53B-9D5A-49C5-A687-841BF94A153F@arm.com>
 <ac6d4785-ac9a-4491-26bb-c66ffe82c55b@suse.com>
 <ED8FC92F-B5EF-4473-B4A9-641C7D44859F@arm.com>
 <0744b957-1832-dff2-9ae2-b8e8534f501b@suse.com>
 <c3952fd5-b893-4cb6-a9bc-325a89e859db@epam.com>
 <c125b447-53e8-7d13-3b08-af62fd3a9140@suse.com>
 <c6b6c22f-fb8a-f2d9-7735-f1ebc9809908@epam.com>
 <09656882-b297-7144-c291-1ee997edb119@suse.com>
 <69A83587-B7E0-4653-AF8C-AEE802922CE5@arm.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <e5a25f27-4361-d61b-ca63-9f031cd53600@suse.com>
Date: Tue, 12 Oct 2021 12:44:43 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <69A83587-B7E0-4653-AF8C-AEE802922CE5@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P192CA0087.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:209:8d::28) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8b5c9f39-0c51-4efa-cb1e-08d98d6d4e34
X-MS-TrafficTypeDiagnostic: VI1PR04MB5599:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB5599CE177BD452DDE2F126E0B3B69@VI1PR04MB5599.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	3gHEavgAdKGbI3nKIw+HyAqxR99XM+yfj4YJVMKiS2UhQFLdn/+xFYClH82c0R28Og4o55eD/wMtgo22aS8gyoaifmxH03WLPyffqBjw0uISad5Beos0ir4zZxRLlUl7NWj4X0FX1bDYJVLksNyLmMTPjQWGNb5sZiu4AC/sjbu/JWoDf8bUChb9iFMYnfUb2rLtFWycHkBsHKuk3nwAuIQOfr7r2xWKBMzNxus9dpgoqdPOZAjhrIT/kP37AUaEgT1IvgeLqHHu1p1alfQAeuIavgZyGViv2wPybyuDIlGgsZ5wfuAjhxseApHH6OlPlbT78tTNFhkrETT+ReWpfYq77RrvMwnk+dnKuzftNFIEzjjZ3WkfM3YCjcHRMVtyA2/U19mORLTwt09qbLi387Hw/CHIE2bZK/CpgSvv7nW+ydXOyP7pgx/hywGJU7nWFZfehGWPyi9Z9S+TRfEgKz1lcBFxHqrMAtfOBolx90WaGsmYecbYNuQrHpSjOt2qfPjHLj+4vx5lCJ+nRY6Kak+27zl4WBo1t5o0HqmbPNeA6xcrSrAjFAs0pfPMK8oGhVKLhslNSwdP+yc0Q6ocYyHvheHhc+hQln0y109r1m0ixqoViSaHr3xY614+cmxxrwNiPeNegDRNi9Y5vrqKO8VcVluf+uBQTMNQQyaF0QFBL2PQ+Vrj960joL5CtRfVwE3gabJmG0iljgYbHMr091WlUp7rIlJRJJWVhxCl8sQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(8936002)(31686004)(66476007)(66556008)(66946007)(2906002)(31696002)(4744005)(36756003)(8676002)(956004)(2616005)(186003)(16576012)(508600001)(5660300002)(38100700002)(54906003)(53546011)(6916009)(86362001)(26005)(316002)(6486002)(4326008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bndOY21KNnNta0dVWWVVd283anpUWWp0TGZiaE1JUFlCKzJGSkVuZ3ZXV0gr?=
 =?utf-8?B?enM5WVBEUWUxQkFKRDNMdzNHTnlyOW10SWFzZE1LQ2g1MGhhaUYxV1BwSEtV?=
 =?utf-8?B?amIvd0FVVWU1TzVzeGlPLzZyRWx5Q0EyVUdnd09RZW5EZzRSVkhNRW1pcExt?=
 =?utf-8?B?WnRvNHhGQ0FSZ2JGeWRUWWZ0R0JPTVFidXprWjR5L2lMQk9Yd0N1SUM5REtL?=
 =?utf-8?B?MFgxaTRYZnQ4UXEwR1NyTUV2L0g3RUpWQ0tSMTdjaUE2SEY0eStESjJoM3lR?=
 =?utf-8?B?SWxScnNzNFdrck9MTkJhaEloSVhIYWh2dkdsMkR3WEhISHNrMDdua1NFc2JD?=
 =?utf-8?B?TVQwb1RzVEFsb004cFJJL3lwK09MZkhyVlJzK2oxSjZyRnpFeFdwR1g4U2dW?=
 =?utf-8?B?SmpJQk1HOEhWUmd1Z0RXeWhYSUlGb3RETXdXSmxYWFRyc0Nta0w1RmpMUVor?=
 =?utf-8?B?V2RiVnZ0MHZ5WHdpRFN1STVhdTRIczFqbCtiSGxVd2tobC8wZGRzODRzRGEv?=
 =?utf-8?B?M3JBSmJydEdPZUNFNlYyOEhvRXo3aSt6ck1vRHFWdDVqRUVWRVQ0RStVQ0lI?=
 =?utf-8?B?YTBrK2sramRad09zamxOa0ptRHBBbjBNR2cyaWFtUjhvdzJ4VmFNZUMvcUVz?=
 =?utf-8?B?Tjg1UTE1cEhKNFNLemozaUl1eld1RFNNSGN0ZnpFckNpWkIrdGZCWkZYcVpN?=
 =?utf-8?B?aDJvTGtQbW9YdW0wRnZrdFBLR2pTOG1pdS8xTUFmVkFHQ3VCM3NOczJESExm?=
 =?utf-8?B?VGlybytmRkRZWE41Umx0MnJTMGhGdEZwNFJwemhlKzl3azJOWTNTRmR1YU82?=
 =?utf-8?B?azJqY0Y4U2VpVWhwVWFNN3R6YXFaMW1pQkN6eVdzblU5WUFnYWloemZPZXht?=
 =?utf-8?B?MURQYnQrRVJNSGI1aC96YmtvalNkUm12L255U0ZnZjFuK0hpS1FiNDJ4dG10?=
 =?utf-8?B?WmErNGR5NUdMTkJlWVNEQ0ZHdDYydmJPMnVNUWJtZDY2OVlSaGhOWFp3b2x3?=
 =?utf-8?B?VFR5NFl6UlNTVW1BNDZmb1YxM25KZ1c1NWZXdGFaTDhhNHE3TjJZL2xDNmRT?=
 =?utf-8?B?bnhPR2laVFlEZG8vd0ZqOUliZldwUmczOElQeVBURSs4eFg2M3FjTGhoMnRJ?=
 =?utf-8?B?OEdyRXd6emRKeC90ZDJxOE9HZWlkWnN2VTNlOHMwRWxFQjhPSTVDdXFkaCsx?=
 =?utf-8?B?R1lJOEs2cmpGbmJLUnRFSGVYZ0p3VEkya2ozSmtwelVlQmNtMU1aMXlNU2V3?=
 =?utf-8?B?VGlkb2ZGUFczRFNjNDRhT1BkMzNKUVJ4RzMrU1AwalBCZ09YSUcxU3RCWnZW?=
 =?utf-8?B?ekYyR1RGbENiSVQvdTUyeXc3Y0dkdmM1Sy9WNW9nSDNBMDAvM1JSUjRpK3Rn?=
 =?utf-8?B?UlgxWDV3RWtlMlE4UXVCWnNCRFpMSVJrRWQrdHRIc204a2ZZaW9yZ2ZZREJu?=
 =?utf-8?B?WnV1OTZWR0k3T1RZZlU0dDhJMTFVRnJLNVVRQTdNT1Zwc1FXK1JqWUJPaFZV?=
 =?utf-8?B?YUZVRHN2TWF0dWFWNU9aVTVIb3FRUnhnVG9rdllRbGxMb2IwUTIzQ28rcmM3?=
 =?utf-8?B?bkRhemF6OVZiN3BBN1IvbmRWN24yekJkOHR1MmsySk5lMHhaK2wwV0hrbzN1?=
 =?utf-8?B?RUZxTGZBdFl1c3R4QWoyQ2NMYUlmSEpzRnl2cmx5N2dBR25wRENTMnF0NXcv?=
 =?utf-8?B?YTFLOXFQUHlJN2xZTXg1S0tmQXhkaFhkZlhNMU8yZ3ZPK3VrYTJhRzNmL2RN?=
 =?utf-8?Q?+sczqPTyWZEmsLNu+GEwJToRyfUp8qtHpe1ll86?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b5c9f39-0c51-4efa-cb1e-08d98d6d4e34
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2021 10:44:45.4169
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Fd4fEABGFasYJ6jwGlPU2wMieQ59ZjKiutOBZmezm61o3Nu7P2VR840n/aTKgEFpcIcrSN3lKcsjDGdl0nux4A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5599

On 12.10.2021 12:41, Bertrand Marquis wrote:
> So there is no comment remaining on this patch ?

No, but the comments weren't on the patch anyway, but on a question
raised in the course of the discussion.

> Would it possible to get an ack on it ?

No, as I can't ack this patch: I'm not a maintainer of the file being
changed. And I don't feel qualified to give an R-b.

Jan


