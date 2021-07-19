Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 925293CD1F5
	for <lists+xen-devel@lfdr.de>; Mon, 19 Jul 2021 12:33:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.158298.291499 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m5QZz-0006jm-J7; Mon, 19 Jul 2021 10:32:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 158298.291499; Mon, 19 Jul 2021 10:32:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m5QZz-0006hG-Fz; Mon, 19 Jul 2021 10:32:55 +0000
Received: by outflank-mailman (input) for mailman id 158298;
 Mon, 19 Jul 2021 10:32:53 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jTRW=ML=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1m5QZx-0006hA-AI
 for xen-devel@lists.xenproject.org; Mon, 19 Jul 2021 10:32:53 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8bee903f-1036-4729-a81b-e019b5ae9ae1;
 Mon, 19 Jul 2021 10:32:52 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2050.outbound.protection.outlook.com [104.47.14.50]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-22-9EuQThn-OBe_Wvm3wHeTLA-1; Mon, 19 Jul 2021 12:32:50 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5168.eurprd04.prod.outlook.com (2603:10a6:803:56::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.23; Mon, 19 Jul
 2021 10:32:48 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4331.032; Mon, 19 Jul 2021
 10:32:48 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR2P264CA0007.FRAP264.PROD.OUTLOOK.COM (2603:10a6:101::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4331.21 via Frontend Transport; Mon, 19 Jul 2021 10:32:47 +0000
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
X-Inumbo-ID: 8bee903f-1036-4729-a81b-e019b5ae9ae1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1626690771;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+sI4hlX+E6U5otfUjBvU/8tmDZUTo8mfolZXvGicamc=;
	b=iSqCs1ymVaZaJjTNs85vromiYctS2AhGwapfnlvAOb5vdqRp+1/JcQ+nbJf7NnvBl8ErWL
	6QnonMewvQy9doP4/64xqirGIinvPa9+JdseueN2EQoH5dHBiBhku73SaCQus2cpf0KAYq
	jCRcicZ6XQ5LqQ4tvxL2hLIEFuyGSOM=
X-MC-Unique: 9EuQThn-OBe_Wvm3wHeTLA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m7Cu93cALr8HFByyxIKcW3UMCFL5vgCeoybhCamIjK6jOU9SR69CyhUYZaT9Z3rqpZU6dY6SNjyynKAlFObMxFYzWayhA1OdGMcTzR+FxKmWx7NcnLOwOKEj2+jFPxBgcvt2e37rPpwbbMiWhpSY8oJY/93YQC9Y52i4DN0+JzNz/ei5BVzJhKyofzJZu7pJoJqdDsoyc4sqTovZzsLAN/iXimaDP2VIyJK95u7a3tAXB4WABrmoBV6zmimYDF5kq9UvgdfazcceGTgLdaCORqq8sP9Adxe1E05KUVPeXFaWmo6+XJyGOEHrYkbJUIdAexyBwzAOwtzhMFUtrL1jvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+sI4hlX+E6U5otfUjBvU/8tmDZUTo8mfolZXvGicamc=;
 b=MiE7p/r4A9r0E9zuoaZve10bLk3+qcNKAI2nTl1RWHlGkWzyx/mYDU3KaYycYd4X6nca7L2aqWqoXqwutiBDqFiznaUo8ljCqrCYeL76hK6uZyk/vC9GrGkZb7tV3RAriKz3D9vfVez3zLYRH6jmS6M4leUDdW99rV3yAQWm/61asANTF6J7+QVGoGx38wA+2A66zIU4Qw+vS7IBc2mP1SlN5+Tfkm/b4MeAtwBdDrFVvIYU9cN5n3XRJ5MEqjva/cHy6S0ATFMaEsV8ww4ovhGyp3es/HHYJfqFhfn9agKmiKCNx+updiVFdWbDCB7YUcEXylkLEJbFaJKJZlhNxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: preparations for 4.15.1 and 4.13.4
From: Jan Beulich <jbeulich@suse.com>
To: Ian Jackson <ian.jackson@citrix.com>
Cc: George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Anthony Perard <anthony.perard@citrix.com>, Julien Grall <julien@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <48cc22b9-6d0a-2cfc-ce34-6aabeb84b160@suse.com>
Message-ID: <51ef91e4-24bd-dc95-98fd-124007634978@suse.com>
Date: Mon, 19 Jul 2021 12:32:46 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
In-Reply-To: <48cc22b9-6d0a-2cfc-ce34-6aabeb84b160@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR2P264CA0007.FRAP264.PROD.OUTLOOK.COM (2603:10a6:101::19)
 To VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8db23d77-6cfe-47ea-20a0-08d94aa08db6
X-MS-TrafficTypeDiagnostic: VI1PR04MB5168:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB5168281B1D435174F8949BFBB3E19@VI1PR04MB5168.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	aC0/LUsln46yUinZx8gBd4hZPbnFVHvnBCpAs0biHrb9snI3KSkpvG2Tji6GtPqMNlArZQT5c+z733fkg3Koz3nU4Y/itfl64B9Wt+gQU0pgDvoC8HREc4SMV37A09yPbGb4uBt68nd3VnR3L1mce6BbqIN56AnZC6hmDQ7JujGA07yQNVGfAno0i69xv12K9XzoeJBk5NrnbpTDaZUlHXhgP1o6PQ0tAxmChanqdwmbeu+fIqOpSMoJkpqCl6lOvTgyXmZx747O4BNr40i67QytvZ4PyxFJhpbulSMEZbQZaTRu9cfWvPeWsByO59awgx3dCwTh76msCCRTyl2LXVCqkV6kPLEOvGHCUWChQqKczjg825ssKQXMVButLRCq0GnyREmIOYJ+1L9IzFETMWME/n42k6Cfto6USCSYuNQ+BxKiCvsFRml6bobCY3331OM1cuC4n49H/4TsEPn+KUrDDLXzcekHJ3gaRd8SOdBjmBilHrSRXrCnmAlvtb3FaVhjF1w1qYAoXJ52XrErBBEzZiVaazCEk5Iv9lVyGXRJlUxHY6f977jIPc+NKPOikhjd51h4oysoDZjf/bpcGsRc5N5H1RloAVhhhfKn1PMZD47TswZ6o0eK9uYVCwV9wCmL588fyrWT0FwCS30lDG44hHxzpb1NVsNnf7S7RtV0bFa8yEQiuBSzN+jSB+baHeGTbNAUFrxW0EnYvZ0f7i7b67YOdiQoFntub6EfjEaKu8OBRztB/iNVdgOEsM4j
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(396003)(376002)(366004)(39850400004)(346002)(136003)(53546011)(6916009)(4326008)(5660300002)(2906002)(54906003)(6486002)(66946007)(478600001)(31686004)(8676002)(186003)(38100700002)(8936002)(36756003)(316002)(16576012)(66476007)(66556008)(86362001)(2616005)(31696002)(26005)(956004)(4744005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eVFHeTlnbzBLbW5tYXRLMXRlcENiR1RJQ0l5U0IrNHBjTWNWZkxIckNDL1FY?=
 =?utf-8?B?aVd0amNrQXZERGlZQXorVVFlNUFMRHplZXVQQVA1QkRrb29VbkhqSFQ4TVRw?=
 =?utf-8?B?Q3lJUTloZitmdm90TFN2cmpiR0syV3lSTFVuNFFSRjRuMEQxZVZpdk9IM0VX?=
 =?utf-8?B?WEdFUGFGYXlnQnhUQWd2cWJyU2F4OVlBYTZZS0ZYQldzQ09FVkNsSWZadWpq?=
 =?utf-8?B?MnpEbUkxWE1LdldTS3NTckNyWUVlekN1ZWFXYkxsNFozVHRpTHM5Qk5VZVFT?=
 =?utf-8?B?aC95UzJNT0Q5dU1sNEl0T3RpcFd1MmhSTGJIaERaS1pCeWpXTW43a0xnR3B6?=
 =?utf-8?B?bm1qZDg4NVNwcUxEUXI3UTM0R1NLaVhJQVBGMzNJa0pZV3NBNjZxZjlJeEtS?=
 =?utf-8?B?NE5FMTBSQ3NuVU5FV3k0U3FmQ2NzRUlVY1M2bCt6b05PaWpXeTRHQi8vaDFD?=
 =?utf-8?B?WDMzbUJLWTJjWi9UeG1QN2FINzdDQWZoWGpjVG1KYy9JdzZBZkdhcWh0REs4?=
 =?utf-8?B?ZUgyRGNLZUFudld2N2JPNzB5TW5oL2hndnZrMGxwM09uQm9oSWlpb1VQZ21O?=
 =?utf-8?B?SUtGbStQME8wMnhCZjFUSHJlOVllS09kMCs5eVNwaitaU255TkNKeTBUL3VK?=
 =?utf-8?B?YVZ0UUJhcnNvc3R2dDFUc3NrUHpwSDkvdHFZV0d6Wkk2dnFneVRDcmg4ZFYx?=
 =?utf-8?B?V2s1UU1TTzJBOEovQm13MHcxcW55bjhvZGdpWXRPUnJoM0dsLzVWVyt1b1Nj?=
 =?utf-8?B?a1AwcEZiNno0bFpqVU5ZblZ4eGUxWU9GRXM1SFRxVWl4VnFON1ZLdXVod3Na?=
 =?utf-8?B?cnB0bE8wSHRRaWJnT2RsMFlCY0gvV0hEb0g1Rm5UK1VnakZZcmJOMFE4OU4r?=
 =?utf-8?B?azJxbU01OFlRUW12emtYdXJZeTljYVZKTTRHYjlidXNiYXUzU3N3MXovRHRV?=
 =?utf-8?B?a2svTitScDA3b3ZGNXA4cnBBOG1MT29BZmh5Z01MdzQ1NCtGaU1mOVBqN1gz?=
 =?utf-8?B?UHZwdzBPb1llNEVvSGVsaUdGc3RXU1JGa0Y5NEFvb3BZd2dYQjZPT3Z4Z2Jz?=
 =?utf-8?B?Z0d4MmhQbm9heUx0a3dWQXp6VVhXUGVzVG5BTjd3dHJRdGRDQ3dLU3FyeENI?=
 =?utf-8?B?S3FQeHdCZ3YxZXgrQ3NmaU1BZFR5YkhKUHlOdGIrdXJVYUJjK1JiWXhQRDVs?=
 =?utf-8?B?cHZXV2R1ck9YdXhMK2lSeE1xbjdabjcwbGxabUdqMlNXRXJkRklUTmpoR2Fs?=
 =?utf-8?B?Q0pzOExCeFZ5MUQ1eU1FeDh1c0RpRVpQSVBpUnh5eDZkYjF3Zk5mQ09MRHJL?=
 =?utf-8?B?Zzh4amhLVktJdWRNbk1TZXpWMElYUU1JR0NRNlNkd214RmNKZnRwbmhxZ1JS?=
 =?utf-8?B?TXozRkI2N2EyTXFoYzk4aDMvejhJZW9ZemxDT2FPMlpoVnhwVHVNZDFGMnpq?=
 =?utf-8?B?Ni9MZ0tIMW9hWlpLaENrQWcrcitsYXBOUVdWamxMTlNkUFgza2xmczJ2aWZv?=
 =?utf-8?B?YkZleTJMdkVWOWV5L01lRGRtNEtGQXdwOGVNNEpFOFRpTGpXTW04a2c2UUNo?=
 =?utf-8?B?MEJSRTAyOGluQWFGK281YzhBMitYRHRRY3RoNXpUa01ZWnFkeTRYN0FiSnIz?=
 =?utf-8?B?MzRLUFppS3FRY3JtSWZqMmwrQTZDSlEycUpZenJrYWc1ME5SWE5rLzh2aDFm?=
 =?utf-8?B?K1JrRi85OWFmMGZIOHQwL2Z0WWlDN3Q0WHFzak9wNDZ6L2FQeDF0QmYvQ0xj?=
 =?utf-8?Q?qXsenLC0vuQENCUHHg+qiqQfHfFvbASGV2fuGML?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8db23d77-6cfe-47ea-20a0-08d94aa08db6
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2021 10:32:48.4270
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Pg0UUw5ftm4QbQ4EqS/phkPQn/fOWy/iV2X7nr1HTRKsTmeoxTc9CtKti6CAg/5lt/W4JfwNBoLgSXiq5f62fA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5168

Ian,

On 15.07.2021 09:58, Jan Beulich wrote:
> Beyond this I'd like the following to be considered:
> 
> 6409210a5f51 libxencall: osdep_hypercall() should return long
> bef64f2c0019 libxencall: introduce variant of xencall2() returning long
> 01a2d001dea2 libxencall: Bump SONAME following new functionality
> 6f02d1ea4a10 libxc: use multicall for memory-op on Linux (and Solaris)

in addition I'd like to ask you to consider

0be5a00af590 libxl/x86: check return value of SHADOW_OP_SET_ALLOCATION domctl

as well, now that it has gone in.

Thanks, Jan


