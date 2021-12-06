Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D05BC46A266
	for <lists+xen-devel@lfdr.de>; Mon,  6 Dec 2021 18:08:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.239518.415403 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muHTf-0003Gc-F7; Mon, 06 Dec 2021 17:08:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 239518.415403; Mon, 06 Dec 2021 17:08:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muHTf-0003BO-2R; Mon, 06 Dec 2021 17:08:35 +0000
Received: by outflank-mailman (input) for mailman id 239518;
 Mon, 06 Dec 2021 17:08:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0GdR=QX=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1muHOw-0005ta-ME
 for xen-devel@lists.xenproject.org; Mon, 06 Dec 2021 17:03:42 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7611c199-56b6-11ec-a5e1-b9374ead2679;
 Mon, 06 Dec 2021 18:03:41 +0100 (CET)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2058.outbound.protection.outlook.com [104.47.13.58]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-9-ej0sc7dGP-afHWbY2h7NrA-1; Mon, 06 Dec 2021 18:03:39 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0402MB3776.eurprd04.prod.outlook.com (2603:10a6:803:18::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.16; Mon, 6 Dec
 2021 17:03:38 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4755.021; Mon, 6 Dec 2021
 17:03:38 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 FR3P281CA0018.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:1d::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=) via Frontend Transport;
 Mon, 6 Dec 2021 17:03:37 +0000
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
X-Inumbo-ID: 7611c199-56b6-11ec-a5e1-b9374ead2679
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1638810220;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nz375AMFecIdgYkYtENyDLTLBQN7pwZgXN4e0X8P7uw=;
	b=OcxGXnUxH172PvgO/Rz4z0f3zVfE3d5H4ONxZBwLyvEQObwLF45Z91K6QXx1f6F9iEIbEy
	9RUYfAYZiuhzwzjktBuQK539C4fC1PiQGm/bBVAxsNiaesBChfcFfP09jvWgoVYTehOmcH
	aUvxc4cWVYYYBJvxPgW3R+hDJjiy6PU=
X-MC-Unique: ej0sc7dGP-afHWbY2h7NrA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UVO4jNMJ/bw/rcN8KVyOmE1G6rUMIXMYPrBG9SrwarbVUW/Us9Tyderlz91uabqI0G0cIh2x1nXfisTQ8d9z34H6JVTxvfXenYcRPdEsifn0lry5njNn0oX1P2PoMxrVrB6eNAbMFbAlz/X00Dw7JLnq1aKq63FGjQF7bU3QxRhsQbxTOkOmp+igUAI8XJjGG8l280eEt2p+qKmDDjRKiMKid/G8HFM/6nZaCk7Qbw+UzDQJyM/StL6RUQTzivKF+WJU0OebJnTS2+bdNHU5FFPC3lvesiQygPgDvrSXqJxoLNqDDNa72srqsK0irvUY+Hf+8VoJwVhjz4PH5wiJbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nz375AMFecIdgYkYtENyDLTLBQN7pwZgXN4e0X8P7uw=;
 b=epo2+tQ++u1ptebuyUlnl4tq2eMOqc7AOVTV+ahS9iAhXCedUS8iy9ALj4Wt6SHFD6k5s6JDZSzkiwGzHBYU+l1gHpQwDcvU5Il6cf/u0I8aBWWerrrlFVxipdMRscoj84qyyVTn1MQKZXMXifTTH4cTqhdvVSSbugrex1FGFVOYSErub6gvBdYe2NrQoOiG82XRhSnS/PPyruF1mC9boX68JvAzImaOY36iUVd70rrHvjo9AZ4yW2TQUqoYAegWlHnC/2N3j5jEDXHPfDPvBBV+W/JwRwUry2DR3j/Qfo6e5Da2t3BZsERVghAkR5d3Ii1vHRgd/tnk1RV4VqBdJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <c2a1fc6d-3ae5-b799-cd27-4ad28f88dbcf@suse.com>
Date: Mon, 6 Dec 2021 18:03:36 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [XEN PATCH v8 10/47] build: rework cloc recipe
Content-Language: en-US
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20211125134006.1076646-1-anthony.perard@citrix.com>
 <20211125134006.1076646-11-anthony.perard@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20211125134006.1076646-11-anthony.perard@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0018.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1d::11) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bb60b728-e853-4b79-9435-08d9b8da58a4
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3776:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR0402MB37763C2E6A9CBC4823FB9D5BB36D9@VI1PR0402MB3776.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	NnaqmLmCdokWnY46xOC3BuBPSqvzUT4Jh5DmqKTEU2nwucgpfQl62fphHLPiDb8wSJDNVQMhspOsXPulmX2BZB/nN+kNR3KmhzH7t1+uH195Mvl/n8AKpLalBkBXW8CUp5G8uRdZLHCQlt9aF5oN8ST9id1OzobVD9iR8nh8H7euPZ9bR0sC4Qh82/JGYrEf47UohkdP8t/zlLq57HsKYgLoTfL7oBvDgWEVnmYQMAibcxKll2v54TQwTJBGLCKGt+7/PZoMwXwLqdEIUgmS6xBMyTGZgZqJuiK/lbEUhxTNWjOaK+LMsEhu4auAobOXSjVTA6HuJCNAIJSKW1ibyHsHq5RayEpk3N+Tak6d05vSj26vB4uHPUTPEyoi80cAQ4unHBudRqNPNgRpMYxLPfMNd+KVVkmSw1tEaUGI8DfMoaGgb86JSTR0F50UYKwLOFSNfMuIu44OThSRyahgwkEgkb/hMCZcjeY8dLH5guBeO7hS5wPbHqXNhFDZdH5iRyhhpFyxH3CR5NUSeiIxaZU/yfqArg6FEi0B4NOqvxfIY+BctXEeV7kp8a+Ui3ZWIQh/vQ1BaM3CHkP5ILKyAbht5zadi+eWVJrHpOpLMgzxBbKZE677KJCU9nhnfmMKu6DsCcuAIBmueLRqX8FxQlG84+B8s6OHtUnY7hC+MfDOb06ZcaOv71deqb+xon2u/2XhtCoBf/SNAFlIbn26a7AXV9BvXhEw16KUxBq7L0fJzEoPblKRmWWjYUzt00Fn
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(26005)(16576012)(508600001)(316002)(31686004)(186003)(8676002)(66556008)(66476007)(6486002)(36756003)(8936002)(66946007)(4744005)(31696002)(6916009)(956004)(2616005)(54906003)(86362001)(2906002)(53546011)(38100700002)(4326008)(5660300002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NERETVRHQ05ZcVlha1BmN2tYME5xUjBNVHBKUTc3YncxL0wvYkNTTEkvdVRX?=
 =?utf-8?B?UjNWOE5XWk5OWHlWdTE4OTBpTyszVHlBYlBGMk11dDJreGoxTk9MamJ5TWEw?=
 =?utf-8?B?V1o3S09Fckh4UDV0UFNPMHRJQ0pLeEFXKzRxRzYrdXR1WkFib1ZQcElxa1U1?=
 =?utf-8?B?Uk5rTHlYcnQrSjhPMks3WWswazFVZ04wSnhLUURmcHpLRGtLdkhoNUhRRFU5?=
 =?utf-8?B?a1BTc1JFSEU3Qy9GNzdPbmkrZjdpT1hCZjh3N0N1elcrejRzN1VZVmc2cWox?=
 =?utf-8?B?eDU5UkhXbE5JWGZDWHcwT1BzaWlXcG53UHZCVUFUWkNoVVlnMFVPRzBWcndG?=
 =?utf-8?B?MHpFenZlSjBqbjdhd0srNVQzNUgzNjJxNEw1UFIwZGtqemtNOVlNa25jb2xV?=
 =?utf-8?B?eUNPSDBvRkdORVN1akh2VlRjaWk4N1hRQWNCSkJFTWxkSXJxdXd5Nk1NWGFq?=
 =?utf-8?B?NytzMmw4cUk2a2luL21ZMWhMOW4yUFM1czl1RkJ1WVYvYTFoNnEraDdCamlT?=
 =?utf-8?B?c0F0Nm9QUFhmcmN1WEFITGR1M0NtaFV2TjB2ZHBrUHM1dVdzWGNobmRyam9V?=
 =?utf-8?B?dDVCUWNhVHkyZG0yKy9JaWhrUFhpc0ljMTZ6KzZsNEpzcGx6NUhnYXllR0c0?=
 =?utf-8?B?dWVFNGpLYXFtekRjSVcwb3Rpd0FBa0xLWXMxWU5UVUltMzNrZlR6akhIYVZk?=
 =?utf-8?B?cnpETGxqYVd4eEpFSkFQMEdJNmtzRTI4MzM1U0FKZFdIS1BPTGVWYUxuaTBL?=
 =?utf-8?B?U3dIWSs1L0tFWVpLd1V3SUlTNmNBT3pIZXhuMytKSGlreFcvemI5VllGQXQr?=
 =?utf-8?B?dm83cDdPRVlPQ2JYb2pNaDRNUnFpMjdEUjNnenZEblpNaExGVUlXYkJvbjZq?=
 =?utf-8?B?TWpubE1rMmF3VC9hRkpZMVFvb2dNYUtHL3liYU53K2E0RVpHZW13ajFBYWZ0?=
 =?utf-8?B?UDM0RXVZM2l5UXpOV0Q0QStYeEM5MWl3Z3NrY1dkWEhkaERwN1RvaWg2T0Nt?=
 =?utf-8?B?eUozbWhLSG5GVjRwWWFMendjMU1pa0RmdUxuYytWaWY5ZXdQVkZmNHdMODN6?=
 =?utf-8?B?bTlWUzNnQ2s0Q3E0UjE2R3VsUTJqQXlXTCtPRSt6NStTM0dsek1rOTdHS2Z3?=
 =?utf-8?B?aTZCME5NbVdxMUdpR2lqeVhPMkxyaVZRQ05vLzQ5NjFoamkyYzRIWU1nL0hi?=
 =?utf-8?B?aW1jZTREcWllakozTWV2Y2phS2xtMXBKcEMvcDMzQnoyRFJzc1BqaUQ1MnhK?=
 =?utf-8?B?MVZSZEwvV1paT0pWb3NJWVNUbC9xaEZiWTAzSHJRK1pVNUNpMU9MT3RWVGp2?=
 =?utf-8?B?MnQ3NGJITm93dXFNcXpnZXVjY3FISGg2RTBLWWZrU2kxVkZzUnBmNjcvMWhz?=
 =?utf-8?B?RkFpMytpWjhXRWoyWUpUdUtXdE5ObmhtYW83QytYT1Q5TlNXTnltbE1LQStw?=
 =?utf-8?B?Mm1uWmYwMmVDc1B1aGFudHpaVjVMOXltd0pBODdaM2RBY3FoenoxOGRWeWs4?=
 =?utf-8?B?Wk9tR0xxcVVUR3I0OFFUSXVpaXpWZGpyeTF0MGxXY2VkTUorbHQrR3IyOXda?=
 =?utf-8?B?Y3BZaW5WNEl5Z1VTbFZhUENrcXpiVVh2Sk54MFpEWUNKc1FjYXQyQzk3SnQx?=
 =?utf-8?B?RHBYMzJiQWxhL3NoZlBoNWFtbFhwYmVxSDZ5V3Y1WDBTM3F2WUZvVWwwdHpo?=
 =?utf-8?B?cjVFMkpnTWxDYnc5cDVSMW4zMk12dm9oMGppNC9qNWtCREl3UWNYenFxaDJR?=
 =?utf-8?B?aVQxTURLVnRBakhhYWFzRVNQYUgxc0duSk93Rll0ZGNxUmlsd2FsWmRUMnAw?=
 =?utf-8?B?eVQ2N1dTaVF0L2o5a3liQ3hPVUF6VVAxZEF3TzkyMzZtU1BXWG9Vd0M5Umpa?=
 =?utf-8?B?dnFVMVcwd3l5cGdkejI1cjZ3V2R2RkRwaFZNVExIL2NZbkZoLys2eDNQM3Jx?=
 =?utf-8?B?MTNRQ0dFSGJwa1ZTcjFvck9ZdzZaTE1BeDZyMXdvSEdGbUtDYnpneDVLS1dB?=
 =?utf-8?B?WEZiUllTUWxoWmIzZ0lNT2dFNFdnSk4vOTI0TUlIcVlPYTVjTXNjaFRSVGFC?=
 =?utf-8?B?dEw5L0hweDN0ejl4MXFGTlBlSllXRHNBWjF6TlZKenBxNXRUNWZpcFJYUTk5?=
 =?utf-8?B?YTBrL2djTG8vc1E4OWZxdVVRbklsVHYrWEVWZkNxMUFDQTQvU1A4cXprdmF0?=
 =?utf-8?Q?DR4fw3jepcgQaODYMJoajP8=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bb60b728-e853-4b79-9435-08d9b8da58a4
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Dec 2021 17:03:38.0387
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: T+jUWQarll2meIX7d+0bBMw2afwzYqPPz+wQNHk6VVnM5qmDFUxnJcGX7TXCmtmqXhYVB2Hpr+2AXLwjYjfjKQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3776

On 25.11.2021 14:39, Anthony PERARD wrote:
> We are going to make other modifications to the cloc recipe, so this
> patch prepare make those modification easier.
> 
> We replace the Makefile meta programming by just a shell script which
> should be easier to read and is actually faster to execute.
> 
> Instead of looking for files in "$(BASEDIR)", we use "." which is give
> the same result overall. We also avoid the need for a temporary file
> as cloc can read the list of files from stdin.
> 
> No change intended to the output of `cloc`.
> 
> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>

Acked-by: Jan Beulich <jbeulich@suse.com>


