Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E6580419032
	for <lists+xen-devel@lfdr.de>; Mon, 27 Sep 2021 09:48:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.196441.349288 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mUlMx-0005lz-HO; Mon, 27 Sep 2021 07:48:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 196441.349288; Mon, 27 Sep 2021 07:48:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mUlMx-0005kC-ED; Mon, 27 Sep 2021 07:48:11 +0000
Received: by outflank-mailman (input) for mailman id 196441;
 Mon, 27 Sep 2021 07:48:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xtCR=OR=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mUlMw-0005k6-1D
 for xen-devel@lists.xenproject.org; Mon, 27 Sep 2021 07:48:10 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ddee715e-87bf-4987-800b-730a46a797b6;
 Mon, 27 Sep 2021 07:48:09 +0000 (UTC)
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur02lp2052.outbound.protection.outlook.com [104.47.5.52]) (Using
 TLS) by relay.mimecast.com with ESMTP id de-mta-3-PCpniL9XNvqwcCco3rh3wQ-1;
 Mon, 27 Sep 2021 09:48:07 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB7024.eurprd04.prod.outlook.com (2603:10a6:800:124::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.15; Mon, 27 Sep
 2021 07:32:29 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4544.021; Mon, 27 Sep 2021
 07:32:29 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR3P193CA0015.EURP193.PROD.OUTLOOK.COM (2603:10a6:102:50::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4544.15 via Frontend Transport; Mon, 27 Sep 2021 07:32:28 +0000
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
X-Inumbo-ID: ddee715e-87bf-4987-800b-730a46a797b6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1632728888;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FC8US9h+dvFJf/b7A4Sa/oFEziZP/JSAVuR1fpnU+7s=;
	b=USVYM1IIJk+BePAUqrBcj9ZRSeZo5cBIwCCuS1yjSc5MyliCMXVOvdQDzym8CEPRMBQmT5
	kgU8PSe2+pEcp5bwD/BLiAXTggXKE42R6ImzTIyiStih6WKlS04jUxqjmMDAGhFK1E2SKX
	P9sqnCKXOZSsW6r50kKTQU6tiAmbCAc=
X-MC-Unique: PCpniL9XNvqwcCco3rh3wQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n69m6RUPHi12saa+Z5aDpMW5fZjOV/wadpPq/k8VCWXV+R2MlRWTSXY95rdxUJ3S3M5KH5U3vHdsO78yQEmMe1sm04bVpafGskyUTXq+a5pR81QLypH/1R9Sb28EHpucNPudQBhLGkqAxvqRxepAmnfzcQTB2d9lWCO83GjJcge6B/HlCCAkD7As7vdZR3mfNWCnrKNuAWryJu7by7Fr89YM2NnBWsF9E1ADFVCQONiomEm/ZGt5mrg1pomGVvlr4QvsxwR7SnYOrJBN+WuNCoqIqLRj9QZVr3MuuoSgSlnkA4anM2wmKbLNAUyJO3kdmgNch0O+h77WnRwwbFZ84g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=FC8US9h+dvFJf/b7A4Sa/oFEziZP/JSAVuR1fpnU+7s=;
 b=Ro9MqhTRcWlwraP+eM8G99v2vEjVtR2HVrLgrV4CQktaA6lPz5/2DqIHXD88BZdVvoZBXpz9QXZfp1NCxYRWVRdOUvy2kSBaDeWcKLel+YNCKvdSyROkPXO+NcNOsqTHLUrB2TC0hXXleGBdieBUJC9eS8hEGDcW0w8aHSc71ESejwW3m5QwNUxaE4smCm5HB8d/iRvgzHOq+uq8/NKyLHUWCHe6dFLjvXzZqEudSOS2qxtv21kFu5nMEhs3K6Hk6NJUHmqhWV6td5iWK+btxGSgeiSUJAsacfaDds97Y+KiD/o+SjMrgoz4RZ4KpM7RPKzLRMgW6MNkr8SILxMK2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: linux-foundation.org; dkim=none (message not signed)
 header.d=none;linux-foundation.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [GIT PULL] xen: branch for v5.15-rc3
To: Juergen Gross <jgross@suse.com>
Cc: linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org,
 boris.ostrovsky@oracle.com, torvalds@linux-foundation.org
References: <20210925143126.26439-1-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <1402ea5e-d392-410f-16a6-ea3d4d7a3adb@suse.com>
Date: Mon, 27 Sep 2021 09:32:30 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <20210925143126.26439-1-jgross@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR3P193CA0015.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:102:50::20) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 40aa3432-47af-4e0a-cbc8-08d98188f5dc
X-MS-TrafficTypeDiagnostic: VI1PR04MB7024:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB70242BB56F59A25BE043CC68B3A79@VI1PR04MB7024.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	TVWYkDkg2sn+yj17PUpJs1T8jC+QurttojVk0xkhuvdBcDXl5+S2kwj7L55LIC05AFUs2k2wiUZkhez1vCmIKJBp0NE1ryJoPPYwR9XJSckWDc5+c9KmDDEVT4UKkD/Wb58ORfqZyy7HOHPp6dA3OU7lmX7OllZTsPXsY53J7zBc98/uSSsAurZH5NazEtjFPEqmMMO09Yq3QBhNB9koI5+dr7sfQWrL8Tz48D1TsTHJ6JstjovyqMpi1nK0y1LUWJJkShIwEeLqf78fK+09xwfNj/8GmPFjnM3ZWnnWqFQ5dCQjCPWVw6wnN7ZGn4JwufPieLZJkmvlTAAo/enHspe0iAq6Ex5gazsCMCmEl3T62NwzAtRlDI3R4SI0KXJCMySUa7lNP9QNK5S7sqD5PxFQZ6JB2QTgRvPu8H3zgbU/Id7AwNHWSdfJnf/hTMKSkjseUMeN7GuSyh0QvO6iiupZnggOf3bpdiMSRL25Cqg25Gp5eAO2mUpP9vXzA2mL5DRsPaZuUbK3QYYRSykgc2Lo9WJy3DBTpU2sU1f+nkx9gGYY5ZH5fzYAqUu8XKHQj1Lda0oxpch64KaFePPZbKFCKJHZo3+MNCyaole76CFXszidkpNGxzaJPg1kBBw8CWTrJG8MhbkG5efZmxRkR6OrjCArhuJDAY0Ws2yTdsQZe3Pc5OmQY8M4ufw0HzoOZ2KAYYbcQuxMlN6Ud5QTZtQFKMssoQN/j7qV4LCBbPk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(6666004)(2906002)(6862004)(8936002)(53546011)(66946007)(37006003)(31686004)(6636002)(38100700002)(5660300002)(83380400001)(4744005)(316002)(16576012)(956004)(26005)(36756003)(508600001)(66476007)(186003)(66556008)(4326008)(31696002)(8676002)(86362001)(2616005)(6486002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TEZab3lEcFR4TnNRSEFiSUZaVnMzVXNqM0UrRC9hQnNRSHFNV08xS09ZV0xT?=
 =?utf-8?B?TkRObWZYTHBPVFcxemd4V0IwY3p0a2R6RFY5NFdvWUVsc0R1K2YrSFdlbXEx?=
 =?utf-8?B?YW1uek5lQUhXMzM1QkZJQytTQk1qTjNXNWpqSmxrSWI2RjNpWmtaaEM0RURC?=
 =?utf-8?B?eFNZaXc4QmJOVmp4UTd6MWZPVjhyNjM0VDlNVWVlb3dwelQ3aWdlaktMZzF6?=
 =?utf-8?B?alRia1JiYUxSektnVTdtNXpVUlgrbHZ0WmFxanNIMGMyRWYyWWlJak1aeGtN?=
 =?utf-8?B?aU80VER3b2lmVkJ4RGNFR004ZThPWHFaV1hCMTUzc2J2K0dQenhaRUQvc3Nv?=
 =?utf-8?B?ZjFOeWdjVHlNZUdBZjRyVDBZZXhMYnRuRi9wcWtkWnRRd0QvQy8xSmplUkpn?=
 =?utf-8?B?SjJ0OFdTbnpVTUplTG5aN0lLNDhCTVlrdlRpVExac0xKcTZ5U0YvdytnWHRo?=
 =?utf-8?B?a0d0ckU5OHBvNTdXbmx1QjR5RG1NZisvSnVlRnN6aDNaWFdISGU0OTIzVHZP?=
 =?utf-8?B?Z2NFUlY5cktTdjJab0VvdkgrV1QrRXJRbkpYVml2VFZGMno0RWVlQWJvSThS?=
 =?utf-8?B?bW5aQmxDWnMzL1IvRXBDRE5sVlFsdmtsVkRiaXgvckduQWRzekU5WUluZ1NN?=
 =?utf-8?B?MEpTT3hXUm9KNjN1ZXI3blJxV1ZPRWhxMzBHaW5XSS9GaURFZlZXUktqS2ZZ?=
 =?utf-8?B?Z3FmTm1uSFRSVTdwQm5XWGtNQllxUXI4RVN3Vk16ditVOVowYkJZanNFN2sy?=
 =?utf-8?B?bUtXa1JxTkE0T1FTR3dJSms4VDVPdGI3S0VrcGt1b0JwNEsvNE9odjZkN21V?=
 =?utf-8?B?Nmh3K3A5d3ZqUUJVNExXc1AxOHdaYWkvM3B6K3dpM1RXbWhnemRnWXc0WUFD?=
 =?utf-8?B?VS8vR2dyYVBwVDlmVWY4MDViYXVYdmZwRzFEdmt6ZlFuM2NnbWFtNTFOR1I1?=
 =?utf-8?B?UndtaVR1TTFvR0V4b2RnT2lQcThXSGoyQlg3bldTOFY0QU4wKy83RSt3Qk9M?=
 =?utf-8?B?eCtocVV0aGd2azJSZUpWSSthV3pZSS9ES3ZiMlIxaGhWYmVDbkpUNCtvT05I?=
 =?utf-8?B?cmhPVkRraDdJVXREM3NhK0I2R01rc0c5Ym5UMUNvNFdNdnFNcGxscVQxVzQr?=
 =?utf-8?B?WHphK2MwTFk2K3l1aE1maUNNZWo3V0llenBmRnFtYXN1cXdhRmJjMk1qTWhC?=
 =?utf-8?B?L293RlA2Vzc0TFJYVmpRc2VFaEgvQ1FTQkYycjN6bXdmaFBVLzd1VmtlelV1?=
 =?utf-8?B?ekhpSEtYNGhiUjNOVkl5TGtXWnBSWExHNVVMN3ZiL2tyOFhBd0NiTW42cEww?=
 =?utf-8?B?YW82ZXhvdi83cHFsUm5QQUpoQi9pNm1aUjI0SzNPc09Ydk5vVDJaODNicG96?=
 =?utf-8?B?MEtIZzdZTEFkSGluKzVFRHFxUFdSNXJxQlV6N2VGdktkMk5NRDBxbW1ES052?=
 =?utf-8?B?a2lWUFJiRTBmdC91aUxoTTlaVDhRUDJ4anlIdWl0RVBPNGtsVUdOZGg3WGxh?=
 =?utf-8?B?dnFGRlN4ajdibHg3aTZtSDNGbWQ2MmJwelU2d0xJODZQcHl2WTVjTFE1K3Bi?=
 =?utf-8?B?VlFmREVjZ3EyMTRJdmh3NnVabkVaWC95OC9WWGpCN2N6U0hRbHc2UitsbkdX?=
 =?utf-8?B?dDNqOU5hLys0NGpsV3dKRVM3SDQyL0VwRXc3ZUxHbnpaVld3dUQ1NjdLNXEz?=
 =?utf-8?B?SDVMOHBGRzcza3dSVmphaS9vNjVoczhMbHBkNVNETGtEamRUSkIrbG45Z3l3?=
 =?utf-8?Q?OodfJmw0TkeofvqMZJt01gyKdaI7DCb9m9wFIhb?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 40aa3432-47af-4e0a-cbc8-08d98188f5dc
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2021 07:32:29.1678
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VpUjKOt+pB6BtZED2azVAKKQGEgQSPsBpJa9yqlo+3LnkNkARN6vcyEk5HUtCgaEMkJZUFBNxWAfM8dQGcg1jw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7024

On 25.09.2021 16:31, Juergen Gross wrote:
> Linus,
> 
> Please git pull the following tag:
> 
>  git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-5.15b-rc3-tag
> 
> xen: branch for v5.15-rc3
> 
> It contains some minor cleanups and fixes of some theoretical bugs, as
> well as a fix of a bug introduced in 5.15-rc1.

Just FTR that the above doesn't apply to ...

> Jan Beulich (7):
>       xen/x86: drop redundant zeroing from cpu_initialize_context()
>       Xen/gntdev: don't ignore kernel unmapping error
>       swiotlb-xen: ensure to issue well-formed XENMEM_exchange requests
>       PCI: only build xen-pcifront in PV-enabled environments
>       xen/pci-swiotlb: reduce visibility of symbols
>       swiotlb-xen: this is PV-only on x86
>       xen/x86: fix PV trap handling on secondary processors

... the last one here, which fixes a regression introduced in 5.14 and
a long-standing underlying bug.

Jan


