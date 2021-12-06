Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D1E6146A19A
	for <lists+xen-devel@lfdr.de>; Mon,  6 Dec 2021 17:42:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.239389.414910 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muH4S-00017e-DL; Mon, 06 Dec 2021 16:42:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 239389.414910; Mon, 06 Dec 2021 16:42:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muH4S-00014v-9m; Mon, 06 Dec 2021 16:42:32 +0000
Received: by outflank-mailman (input) for mailman id 239389;
 Mon, 06 Dec 2021 16:42:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0GdR=QX=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1muH4Q-00014n-LV
 for xen-devel@lists.xenproject.org; Mon, 06 Dec 2021 16:42:30 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8013438c-56b3-11ec-a5e1-b9374ead2679;
 Mon, 06 Dec 2021 17:42:29 +0100 (CET)
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01lp2053.outbound.protection.outlook.com [104.47.1.53]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-14-joOXOMAXNkm6dpZMAXXQ4Q-1; Mon, 06 Dec 2021 17:42:27 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5325.eurprd04.prod.outlook.com (2603:10a6:803:60::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.21; Mon, 6 Dec
 2021 16:42:26 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4755.021; Mon, 6 Dec 2021
 16:42:26 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM6PR02CA0001.eurprd02.prod.outlook.com (2603:10a6:20b:6e::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4755.16 via Frontend Transport; Mon, 6 Dec 2021 16:42:25 +0000
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
X-Inumbo-ID: 8013438c-56b3-11ec-a5e1-b9374ead2679
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1638808948;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HZi3AxTdExXlR+Y06/82M2J28uaSxo3qoPiHhYf1K5o=;
	b=nN/dqG9rN2jD9f73DQmlAi858zruRBz2muaVyL/HP4vH6Np6unJsuYyCiy+vcCZ7TnH5PR
	PQLtSL9R4uZ7OKqU00NHhmdwZkecA1vU5aSsMDszx2tSXPxC0CatZHFwBfHrKqPt3eGVfa
	dLElUJsDtMIXbplZfaSPWSK7jH2m5P8=
X-MC-Unique: joOXOMAXNkm6dpZMAXXQ4Q-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZOo+ryosl4qWptBjRCNuGhyRdyXmJtQRK/gu8UW7Qw4VYd3LmxCZemzZWarI5e4MBfb4ebePCJipzj/xjZ6vpxH0U4eo0jGCxy+S/cqa+KHyZT1OB8lYzEHBEhVHMQBN6jFbDAwfgP0CQWkGrGSo4Byghq7VYp5qZ1lg7klnoyisI5fziVfbY1B/7nfhRbXHmNcZ/iQiT0ywwIP04e/qCBEamhQl0yMSPEPt64a4ToGS5TLbpJVAgOkawWlYIPWK/44Rs0RG+zn6A2k7iB9oGdUIfn7eqCxFYP2yVThMsEnxziR/tlzEv/Li5HrFUMG2HR9vxADBqi70BGGXaVK+KA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HZi3AxTdExXlR+Y06/82M2J28uaSxo3qoPiHhYf1K5o=;
 b=Lf/x9UxawKs+hoZtBW+G9XC4DmR7fbxzykBmtBYttTtFVUG3Vaa+wijZuz26yLqQfoFIs2/iiX8HlqXy5UuHIpxb8+mtOm1uKPS+G2ZyI8KVqEduaeD/taGVDuiaZW/33dNY03PSO/4gJpNDcIn5gHo4DfmVMCozZDcrGdYTY0TN80aYJfhGJkq8+4dNtC4zj6oSYYvUzoN/Eyr4UbSMN5iHIWgPJ/9G4HGYsenjtmuyyJCnEnJwTeiPYrcGyCSUfVMPCdf77No0KRGb9nl0X6ifrrQ9xi4fRZdb3lPwromF0/4pfRl5kLLiGeuSTkGZixFld9NeGoWjguJQ0wn6ZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <0a6d8d02-12e4-3c39-ba63-735d94805ded@suse.com>
Date: Mon, 6 Dec 2021 17:42:24 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [XEN PATCH v8 06/47] build: avoid re-executing the main Makefile
 by introducing build.mk
Content-Language: en-US
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20211125134006.1076646-1-anthony.perard@citrix.com>
 <20211125134006.1076646-7-anthony.perard@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20211125134006.1076646-7-anthony.perard@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6PR02CA0001.eurprd02.prod.outlook.com
 (2603:10a6:20b:6e::14) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9cc7556b-f9d5-4bf0-910f-08d9b8d762a6
X-MS-TrafficTypeDiagnostic: VI1PR04MB5325:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB53256869DA3F8C28008BBA90B36D9@VI1PR04MB5325.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	yGaNqifkIs7slp4kibzY8Ubz6yDVKUNWxb2PS6hnp+ZY7jmmdTP1xSy4IKRHrKWeyMdbNM0SAvSDBaj6FivBkxPrtVWIUWOwkfM+uAa6wI4q5AVTq1cQ0I9j+qiBs6W992J6JafZVlqXJKKlj0x8RK0KZFDyJueniHAiBWVvlhuqFpQcNSucO0ss2lSjmKLS4mZxqfaK9w11OKkkPZ8Yg83JLkRdOogtFYRvdcNPSYBBkf8uCikr8RwsQRkVEGCHhqH32KDVTZB0zhr4HyKziZOaRB2RB08vKXZGTBdoBPI+2zSAx6/knZUHyIRB0MuP1P1C8nPG5ri/r8ORW1DPNkd1m940m8ui7i61yWhgiUadaXfnRQ/HU4UGp+cEA9DnqvL+UyuMnNjcZnN8Xrxlo/URbheZ3dBKUjW7iyxykNt6JMKGTi3IZzPPhJ4pbt9k4EJeEiXF3oZNVs7wEJV+1XBFr1Xvpak6URpSeMmEvYBr+jmPLoYLgZ9CoYjhjQVd0RJov9J3IssDLoLWUo+WLOtY1U6IezUUDA6/jtCihPvmJP0U7FsiVDWeRxIuSuFoAl6EQBJb7/bRnBgBjjcIDvqRFYxAZwigCog/4bjgTp5q1wJ5YYcSIz4AcTxxLKCyTxJI8ITT+L+HDxQOjEwAOi9XG47fe8BwAUlJbQAmoUJOlXIupMLqnCSfDk21cJg420QDKjzyIHuZXCe6H6/iI5dSGfhoMVve6MqszaunQL/7DiZ0qo+XDB15dWhDe5Xs
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(956004)(38100700002)(4326008)(6486002)(31686004)(26005)(5660300002)(6916009)(36756003)(186003)(31696002)(8676002)(53546011)(2616005)(66946007)(316002)(54906003)(66476007)(8936002)(66556008)(86362001)(508600001)(2906002)(16576012)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NjQ3YW1aUkJEbUFydDZ5S0VEOEE1SE9VUVpqcjAvT2VtYVg3anNWRVE4U0Yr?=
 =?utf-8?B?dHBIbW5lcWN6OUtoclBOa1VCVmptZnRDRFVpY1dBMXZDZTJZcVl2SkJVZDZU?=
 =?utf-8?B?b0t1WW1HYUZmRUZycE5Rbmtsc2Z6bkM4SU1zdjQ3enJQU1AwMHlHNlpkbkJa?=
 =?utf-8?B?c3UvSVhBelhzNmNKWFNUaTBuTDJKRDF4RlF4OE1VKzdPZ2xsQlJwcTJsRERX?=
 =?utf-8?B?TE9XTXRGUWpsb0VhdkJZWmR1M01YcXE5L1kwNVdJU2JMQ0ZSNDMrMEhleDJ0?=
 =?utf-8?B?aTFOMlJDa1g1WkRlWERNeFZxUEFVU2w4QjRuZTZOV29iNkxIdGt5bHZ0Z3FE?=
 =?utf-8?B?UmhyTkhCYXB4S1FVOFVMNFkwNm13SGVmNXowWXA3OTFwT0dNc25odko5RjFX?=
 =?utf-8?B?QnppK2ZBaG51YmRSUFdnRldSbzdMM3dYN1RuKzY3aWQ0bmdrekNPOFhCd1pV?=
 =?utf-8?B?N2tlbXc5Y2JCQSt1SkhFVVNYazBDOXNuaDFRZFU3NWhuOUJWOHhpb05Bb1Z2?=
 =?utf-8?B?T2h1UXJlRGJjWm9UQ3dVZW9UWVhMSDdMbStvclVFT1ZldlhnN0pqKzR3MDRF?=
 =?utf-8?B?bHYwTkwvd3VhNVluZ1lGc0NkWDZLMVU5Y2VLbGhoWENtMmJxQ3NJQ3lnVm9Q?=
 =?utf-8?B?cEpFUmo2elovcU10Z2lWR3BaTXNMaXVRaWk0bVMwR0tNTThtZmRhckFmK3Yv?=
 =?utf-8?B?QTlEWVdCTDNPR0NXY3lxR0lKTXBYVTJPTTQ2WklvUDFORUdmUVQ0Wmw5akZo?=
 =?utf-8?B?NWtDbXpraGNIUFloK2dGRGY1L0ExQkFhd2NnVXdxZWhNVFNOeEVXVUF5VDZ3?=
 =?utf-8?B?ZW4vbGZQVW5YclNickwzUDhNamlvQVNaZmgwb1crd1p2MnQ5dFNWMHZnOVJn?=
 =?utf-8?B?TUxzOWxadytncHg0VTlxSlVyTUJLekxhU2g4WEdVSE1hcVltR3JXeVpVbHNJ?=
 =?utf-8?B?VmVUaUJ5WS9mUDRGZzFqc1dMWFVIR0doeHVkUXA5b1Vkempqd2M5M3NxVVhC?=
 =?utf-8?B?MElsdXdJQUg1cTlyN3FEcERFMXZKVjJwOFBvWVJQRjdzc2lvR1B1VkpMZUdv?=
 =?utf-8?B?bnFqRTY5c3AwbklUWDZZL1U5T1pVcXIzZW1VV0JOUjNpUTRDTXdLd2NmTzdv?=
 =?utf-8?B?MXcrOXBRbGY2NFFOTDhiVjcxUVRKM20vcDBpelJFWkxyL0wwTWttRmNGVGh6?=
 =?utf-8?B?YnZQSmZOS2ZwVjJQT0dxWVZnTmpJajVWam9TTUxnU1lJYmtKeG9yV0hLbHJY?=
 =?utf-8?B?U012KzYyUjVMQ3hqUERGUjF5YkxYQzFiTDNhN205ZXFHSkpmL2JadUpYNmVh?=
 =?utf-8?B?TGw5dGhqdzNxSCtkc2ZGMUlYS292aFZ5Q3ZYNGVTa1BvR1JxbGdjSWIxYms4?=
 =?utf-8?B?MlA2R20wRThsMGNkdGk5cEh4NGRSUWQvalFKMEJTNEtqT2lvR2psc1FFWCt2?=
 =?utf-8?B?aEh6TTc4TU1oU0ZoM2NOZlNxditPTjF4V2dDRmFtcnVXaVNIVHRjT1Rka09m?=
 =?utf-8?B?bEVSTzV5ekE4WFNqY0Z5ZFBWSFpaSmJBTTBqYUtTWWdUTEtlVGtsMzBVcUxZ?=
 =?utf-8?B?TmNHeWhWUTNFOEdUTVJuU1F1Z0tRL2NhYTVFaCtmY3FyTjBDTDFpc0ZFZUpC?=
 =?utf-8?B?UzQ0eFBZeVZ6eXVGZUZwWktLNEtiLzcrYnphTmRCcUY4eDlzSnhhY2h0c2Jr?=
 =?utf-8?B?TDFxUWZWNkhDQXE4cmxSRkpQcHJ4MjF2MjVELzFWdGcxbDJYZlNHOWRYSkdB?=
 =?utf-8?B?NHNjcDFzNEI1dlhVVkxaQnRyNk8yeVY1VHdlS3M5R09uNHMrdjJjRXFwMVFs?=
 =?utf-8?B?MHZwMVdxL2FQVVJNTElJeWp6dUYzMVFraWszMGxsVWhqQ0NKTFF0L1lEcU1s?=
 =?utf-8?B?eGFVNXZaOW1PMmI1bW9pVEliRGVzU2VvWDNvSGlHVmxNU01xZU56UFZlTmFT?=
 =?utf-8?B?RTZEUXM3U0pOd3NrL2RpMmhOY1NxL3hYUzB1amU5eldiZ1BGZjZhYWQxYmFv?=
 =?utf-8?B?Qm0xY2d1VDNENTBNOUI2VVRSZERsc1FLdWV0Y01mM3B3TldqekVkVi8yY1gr?=
 =?utf-8?B?T1VhQ2hVL1pmVXJhM2lsSHRrWlNOZXB2TWNteGR2Rk5HZFdyZ2dIUWpEY2lD?=
 =?utf-8?B?emxLUGt1VUoxa0djT1QrZ3lMOUNHYXZrU0xLeGI2VExvOG9acUNram4vYzNY?=
 =?utf-8?Q?/vl6halFtBRyGeKy5sF4tb4=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9cc7556b-f9d5-4bf0-910f-08d9b8d762a6
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Dec 2021 16:42:26.3427
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7+UogSRdwGpzg/nsCYbjUKRqGxsI+2dqyWkjzZYrENke/eMtkmwjbQK2oL8yQ61dv4CX6ajI+WPvm54g8im7bw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5325

On 25.11.2021 14:39, Anthony PERARD wrote:
> Currently, the xen/Makefile is re-parsed several times: once to start
> the build process, and several more time with Rules.mk including it.
> This makes it difficult to work with a Makefile used for several
> purpose, and it actually slow down the build process.
> 
> So this patch introduce "build.mk" which Rules.mk will use when
> present instead of the "Makefile" of a directory. (Linux's Kbuild
> named that file "Kbuild".)
> 
> We have a few targets to move to "build.mk" identified by them been
> build via "make -f Rules.mk" without changing directory.
> 
> As for the main targets like "build", we can have them depends on
> there underscore-prefix targets like "_build" without having to use
> "Rules.mk" while still retaining the check for unsupported
> architecture. (Those main rules are changed to be single-colon as
> there should only be a single recipe for them.)
> 
> With nearly everything needed to move to "build.mk" moved, there is a
> single dependency left from "Rules.mk": the variable $(TARGET), so its
> assignement is moved to the main Makefile.
> 
> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>


