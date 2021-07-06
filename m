Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D4FB3BD783
	for <lists+xen-devel@lfdr.de>; Tue,  6 Jul 2021 15:14:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.151282.279597 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0ktp-0004cS-NT; Tue, 06 Jul 2021 13:14:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 151282.279597; Tue, 06 Jul 2021 13:14:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0ktp-0004Zc-KQ; Tue, 06 Jul 2021 13:14:05 +0000
Received: by outflank-mailman (input) for mailman id 151282;
 Tue, 06 Jul 2021 13:14:04 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hfi/=L6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1m0kto-0004ZW-AN
 for xen-devel@lists.xenproject.org; Tue, 06 Jul 2021 13:14:04 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 08791712-de5c-11eb-8494-12813bfff9fa;
 Tue, 06 Jul 2021 13:14:03 +0000 (UTC)
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur03lp2054.outbound.protection.outlook.com [104.47.8.54]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-40-o4xMoQ5NOsKj50WwLGuGbA-1; Tue, 06 Jul 2021 15:14:01 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB7150.eurprd04.prod.outlook.com (2603:10a6:800:12a::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.22; Tue, 6 Jul
 2021 13:13:59 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4287.033; Tue, 6 Jul 2021
 13:13:59 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM0PR04CA0102.eurprd04.prod.outlook.com (2603:10a6:208:be::43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4308.20 via Frontend Transport; Tue, 6 Jul 2021 13:13:58 +0000
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
X-Inumbo-ID: 08791712-de5c-11eb-8494-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1625577242;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cEitWQbh6r5Ml9jJh6pdJ/XnLG4kfdRcYiO145Mh6GQ=;
	b=UInWETNNILjvJU+MoPxPUqSfoG7igO92x/A4Nc56BaHacwaydQcqlqvrnRwitin4ukZVYe
	zMF28VVQwSphPPx7QG/M0kcwwgPuysE/der0nz8+oQCi/jGB0QuNhx2mfoPoC3RfGQWuKk
	I2+6W8Ve/TuzVTqhyevfsVVQOB14SR0=
X-MC-Unique: o4xMoQ5NOsKj50WwLGuGbA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y9Oy8jnJu8CQWzi4Lu2701Hm7B3JE6VJ7ZolIf+9pAxowUnR5EmkiYvYbi/rElK6O1bTdG9T0T93vCGFbWqG+SfOHuvxLjdI0g+uG4ur33iw1CU/qzW6/3V9uFQPKI+wZ8bTkcJsASmVu//ArLbOuvPjaDmlF0VWZ+xa5CV3QWos7Wh7XKbJWtJfsGFw7ieTsjwBW2dvZrfxmVOtmpmYywzE1NAMSCtAgHzYRMMsCkfWqYNnkZ2i7IoftBEFer7z/3W7YysQGMi9KInmIf8HMVXvAfIl4iCKlCN6DDUp74RHvZsOw5NYfky7OWla4kyKidcV8+zpLpKWpX/RnSq5Pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cEitWQbh6r5Ml9jJh6pdJ/XnLG4kfdRcYiO145Mh6GQ=;
 b=U4DPmIfI3hqIkID/vaeyvs2ldSzbOpP8v+WW/mSKyiT+NEZJsRnNOzVSEp1F4GzgS5ifxFds6d/lvAVNMupYuvK1XQvtCdH2gKYYlhHjzeB5CoZkUN3wqNT/GbNUuzf28RXzXC3T8KFYTALMjGPNMnAA2AeQcQV/qcpt2pZFvvqoLslQiSOMFc1/p6/iDPZsvAVYFejLAxPCMfCS2z0m6QjSPvUQpQzivjUHaFcmhMBlXraIjASQpn6LF2d4P4b5F96XU496TCBc3qQLMJPNRYufIJBmExgC37RpBlP+V7Cl9CoNzSQKourKLPIIoYc54LnSC4xTaLY3yaWmeyU2jQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=suse.com;
Subject: Re: [PATCH 1/2] x86/mem-sharing: ensure consistent lock order in
 get_two_gfns()
To: Tamas K Lengyel <tamas@tklengyel.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <dea13187-04ce-9c1d-aa5c-e2cd0a7d42d9@suse.com>
 <932211b2-c3aa-17f6-9fed-ca762e189786@suse.com>
 <CABfawhk4N-KznkFhmk3Q749tTp3X+j0fCwDXooYZEDdfQ7Fchw@mail.gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <a95a3f1e-afa5-30b7-f2f9-2e0ba1808b94@suse.com>
Date: Tue, 6 Jul 2021 15:13:58 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <CABfawhk4N-KznkFhmk3Q749tTp3X+j0fCwDXooYZEDdfQ7Fchw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM0PR04CA0102.eurprd04.prod.outlook.com
 (2603:10a6:208:be::43) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b3d54976-05bc-49a3-1344-08d9407fea87
X-MS-TrafficTypeDiagnostic: VI1PR04MB7150:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB71500F6FA166F543FC2553D8B31B9@VI1PR04MB7150.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3044;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	/9eBWjnGk3OZoLCmjBCeCGPZoHqBDlpevfw9pL0L2eNcbEKV5WMOT4xBJVCUWEcpqjiXWOI/Q2GgEMwE8rT5HP8gPbqt9FusyFTFZ+r5L0b44WMdNdqZdylUmBbiCm3LMx1A3L0PtMuxkpHqvAr4qQJ59apwVsxbyfa3sGuLUcC7TsZT1gUMSIkdvJNSmm2g5Vyt2tU7l+RQkDdHxpZ05Ok57cQ/XEFzB1xTkMkyd6oP8MopJeqQS9bv5szO6McZsPk2kngX5hNSVO+w+g3cW9+ozXISv76Va9BUL9Cwlpkh4zs4CxqKDUkyx0HSKjYmo2RksF1fR40x09XuAPwXfCZEimP9swp2UYyGad1Z4NBBXjA6XuYCGNGE5rFGrOdd5yPRWdmqskq6Qm5ZsUDF05yZp52hYyLKthRl/EeRX8JBbR2Zke60vzqsoo9WduvOySWK6ETlDS21GQdYD+z802/msfFX/dcH3mTPwvURmskA203+8qRrUzmg4aOXsTYkx706h/aUO8U2KOmMl0hqJPFM1HgxdyFjpirHJoXESObYJmu9WnApluFZkkOq0BTu8wBJ9U1DHo7ul7fysyDdPqnCczeKn+cqSvYp8B1OfoI8y1c0lWWZYIt96gAYphEEFsTxrY5t2d7s44L03jx+24N2vW0Se0dOM7tVU0clD1mqIKvz64Mlx1Ju99cslw8dit+XAO+aPAH6oJJZQzBNJCex/OKVtrutpSP4OrHxdzI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(136003)(366004)(396003)(39840400004)(346002)(376002)(2906002)(54906003)(16576012)(186003)(6916009)(956004)(4326008)(66556008)(66476007)(316002)(2616005)(31696002)(6486002)(86362001)(36756003)(31686004)(83380400001)(8676002)(5660300002)(26005)(8936002)(478600001)(4744005)(38100700002)(66946007)(53546011)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bGVhKzhzS3U1dEJFNTdORGdDU0NDSVhvYWs4dVo0NjhMdHpDZWRjR0F6R1RU?=
 =?utf-8?B?UTZDM1QvRlptRjMvMFFaRVJ0TFU0alppMDNhSmpIM29Sa1VHTnpQS2ZQeVlt?=
 =?utf-8?B?dGVKd2p3MnVDZEVRZW5uYXArbnk4Q2VoQlZlZ015ZmtyNlNCclhPcjhxcndW?=
 =?utf-8?B?NXpoalhZUVZZUDhyTHdOVkpHMHpHV1pSaHF2QkxmU1IzRW5EdlpvTWhGbGhs?=
 =?utf-8?B?ajBNdTI2aEduY0I4eUVkeGk4Y2Jyd2xyRGs0bXF1K1ZCZ0hLaXVibkVIbjZP?=
 =?utf-8?B?WG9VR3AzNHArY05JaHM5MENnV2xvUUNjRy91dlB3eG5iV1NVWEFPV3hyR2lW?=
 =?utf-8?B?N1BtNndhMm81ckNMVURHRnFLSURVYTBQT1EycElOejJkVzZLd1JBY29TTWhE?=
 =?utf-8?B?NDBrZWhTaXc5YXBIY3lSRGRBMzhxaWVaeEhlcytYU0poeUpWYzVDSG9uKzRp?=
 =?utf-8?B?ejVwNnJoWFl6WitRN0FuclFIelNYV2dkcnp1UGJiaDJTODJ2Q0xPNmlKUVNw?=
 =?utf-8?B?QzlBTndxTng3SU51WWlhY08rWG5nVUJGVFJ5azZjRzNGMmpmSDVnSy9sc1dL?=
 =?utf-8?B?dHE0VjdQRGd5N3JsV25wWVN6ZXpTSU9JajJVazVaaGZRUU9aRlRyMG9Qdjcz?=
 =?utf-8?B?VVJsSmR6dmNxVU56K1V5MVN6bmxETGFtWVY5eEpiNmtFdTdaTmthMlZDeGVw?=
 =?utf-8?B?NG1VL0tPQzhFNm5RVW5EcURNTkVLV2V3dlNhemRWN3ZOMzZZZkhXUlB2dENz?=
 =?utf-8?B?R2dab2hCLzc1cGJnbjBpUWVXMmxSM2ZsNTNHUWFHQTBJTmtyMkprWWxtZFpa?=
 =?utf-8?B?Ky9rR2NJQkFZOW9xbmR4eDdRQm95UUtrbjRTZWJOZTlqVVFUV0pYSXhQaTJo?=
 =?utf-8?B?Q200ZVFQc2tHeEt2dGRPMUJPNjJCY2JVWThtQUFiMVQ1a29obXloRlYyZi9Q?=
 =?utf-8?B?alhNRUxPUHZsQjBtM0x2QXF2SHdOcGxDUzNTRjB0UmZTWnNYaWVVeGplWjly?=
 =?utf-8?B?RzNlRm15cnFSOHc3bTRhMGJFem1GZE00NDllRVVJQlJjMVVrV1MvU2VvTHVx?=
 =?utf-8?B?ZVRweHBFT0Q2Z3BISG8vbVpwR2FBLzZvRjZxYTlxcHF3dERjdW9EelhRTEth?=
 =?utf-8?B?WE9LY1FrdTJ5WWJJUXFIU1MyWnEyQ3J6WWh4M1RwVExqNXQ1a0pIWVliWjVp?=
 =?utf-8?B?YVdUN2NmOHhoNEZkb2J1Q3NqdDZ0dnJNSW90Y2Y5MmkwVmlkWXZ3SE8zWHNE?=
 =?utf-8?B?UGlVRm9ycytVVjIwQTdOcE1vTE13QnRvOXdpbk1Rd0RFcGpsWC9pcFBvSlAz?=
 =?utf-8?B?dUJKV2R3TGZ4U0pOTFlFQVlPOVluS0xYYVRuSjl3MjRkMDF4RXowaDFhK2tL?=
 =?utf-8?B?VVVFeFd2Ly9JeTZpM21YRU5UNDc1Mnk2dm4zRVhpMVhxWGh0UFgwaUxRemI2?=
 =?utf-8?B?YUQrQmNPejFaK1pHRGk3L1VzNEE3cXdaSWtzZWJLYzlJTjNqck9WVmIzTHIv?=
 =?utf-8?B?aXVXUEVCMlhtdDE4NEpZdTlsNEM5Z3NlWmhDMHFZeFlHSGpMUXBTQ1E0NGNn?=
 =?utf-8?B?US9BQ2I0eWRCVHRuaDgreVpxdzdPNTg0OVZqbWphdHgrUDZ4UEErenBBUHBI?=
 =?utf-8?B?WjZQMHV3WDd0TWhydFBIZ0RsWGV5ODZLalBiNCswRldSK1d0WTVpSUk4clFI?=
 =?utf-8?B?Z2pGZ1V5UE4zOEtzSkJXTnlBMlA0dDNSRXFKZFFLMHYzUisxdklsMjhhWW5N?=
 =?utf-8?Q?xdaCexRlRfHpGhWnZSv7Y+jV9Kq6Pj75GNYbxfl?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b3d54976-05bc-49a3-1344-08d9407fea87
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2021 13:13:59.0740
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qbsN9lm9oUvuR2KwYGURtQLHPxGIZVqvtZxhXzbQSTM2e4ceznkotaLwW/V6OKbf+te8SS/P5fRNuUFY7RXa9Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7150

On 06.07.2021 14:36, Tamas K Lengyel wrote:
> On Tue, Jun 29, 2021 at 8:54 AM Jan Beulich <jbeulich@suse.com> wrote:
>>
>> While the comment validly says "Sort by domain, if same domain by gfn",
>> the implementation also included equal domain IDs in the first part of
>> the check, thus rending the second part entirely dead and leaving
>> deadlock potential when there's only a single domain involved.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> Acked-by: Tamas K Lengyel <tamas@tklengyel.com>

Thanks. Do you think I should queue this for backporting (once it got
applied)?

Jan


