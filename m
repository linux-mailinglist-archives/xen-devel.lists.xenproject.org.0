Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 126AE4B7011
	for <lists+xen-devel@lfdr.de>; Tue, 15 Feb 2022 17:19:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.273403.468577 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nK0Xj-0004SQ-5u; Tue, 15 Feb 2022 16:19:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 273403.468577; Tue, 15 Feb 2022 16:19:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nK0Xj-0004QE-2o; Tue, 15 Feb 2022 16:19:07 +0000
Received: by outflank-mailman (input) for mailman id 273403;
 Tue, 15 Feb 2022 16:19:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=p95L=S6=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nK0Xi-0004Q8-Ck
 for xen-devel@lists.xenproject.org; Tue, 15 Feb 2022 16:19:06 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fe867e47-8e7a-11ec-8eb8-a37418f5ba1a;
 Tue, 15 Feb 2022 17:19:05 +0100 (CET)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2051.outbound.protection.outlook.com [104.47.12.51]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-29-EMcPiap5NiuZiPPeZVSr0w-1; Tue, 15 Feb 2022 17:19:03 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by DB6PR0401MB2598.eurprd04.prod.outlook.com (2603:10a6:4:39::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.19; Tue, 15 Feb
 2022 16:19:01 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%5]) with mapi id 15.20.4975.015; Tue, 15 Feb 2022
 16:19:01 +0000
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
X-Inumbo-ID: fe867e47-8e7a-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1644941944;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ioi/htouuhSZmkaVTDshvz4D/moGu2rMwb80FkDpNE8=;
	b=QFPyg221VR3YqNPO4jUoJ4LgU2PdGRT+SR/mMR0BZG65LJLTa5QvosOuTP7La3UeF7pJ40
	P3UoF9mOVKGrfCLIeyh+Phq0WswC6MwhF1xMZyc1Bjv7GnD440phwDlDwaVuE3StumPFLZ
	9H3BujuVLyCszMYcK5TZBK50+wbyWCE=
X-MC-Unique: EMcPiap5NiuZiPPeZVSr0w-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Bq2riRRsWv8CzNne7c+nl8ELBbZkPP9279yn0ByKXQbnJQAXTvyT4vaxO3ee3kx5KKHdHlBTEeouKyCDUCRNseJb7W5WmCH5B/guX9xJi2jO9hfDna0Z145v9NAw2Dnt9CicvPnnnl3V8eKniYI/cmRRicPAF2GtlQfWBtFXbxAjXuxOw6X/uatHxugKF+4QZSgduBv7Tg/U6QTlDx06uTm2sxxpT60aY25jpe9STQ2P7B5Huq5slMQPFvlwfx4vq1PMIyRxAMQhnBq7n2R3teo2Xj1/VGyMw0dZ2jEZmB30fh4y6zgUZfdvvVEwESorxP7Dbxn1S3E1CLaapicK2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ioi/htouuhSZmkaVTDshvz4D/moGu2rMwb80FkDpNE8=;
 b=h842nNtrgcO0bEWqlFAHyUdzvWHjxkm3kS/rPbu9T9pxSHpgIOywz8MQCt8zVbhrfxCMLWM3N+b9TxDXayHSd6Ee/zWMvPFnb0RvW912tMg5R4t81lO7cNlgEeKF/Sq6SXr9+wLFv0mbumsI7eNV6dBYL5KCsMO0sgvI+z3IrK5a0IR6AdSCrPruJRZGjLyHrRc8x/Rn4rp8qOY1jVRC7mcWH8q3rxFfdalO0wPqbVpIacMmy+Pi6ylXtG8Rj8mkCW3SkVR93Z98nVz0JL4R1MFjVMghrmD+uFaGV/tibvaZfZPIuqs4jYeMbJBDenDF7bloE/4YH6683zEhXxPOnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <0c7aa17a-1735-1d9c-9cec-fa3693025256@suse.com>
Date: Tue, 15 Feb 2022 17:18:59 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH v2] vpci: introduce per-domain lock to protect vpci
 structure
Content-Language: en-US
To: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "julien@xen.org" <julien@xen.org>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Artem Mygaiev <Artem_Mygaiev@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Rahul Singh <rahul.singh@arm.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>
References: <20220215081135.1497470-1-andr2000@gmail.com>
 <YguE7RWOteSnvVNY@Air-de-Roger>
 <c5b9b02c-93f8-d018-6048-9abf2e7de4dc@epam.com>
 <YguQ8wfhfYFXTWSU@Air-de-Roger>
 <70dbd7fd-3f74-d0d3-6e30-c1e1e24fc279@epam.com>
 <0d8f01b2-b015-a08e-dd49-e9c688ff7245@suse.com>
 <bbb36ebc-de66-297d-f82f-abc0e63f20a2@epam.com>
 <22d25499-cab0-00c1-3ad3-bddd74c97a55@epam.com>
 <772eb410-be1a-3b5f-3b51-e363c43bc3c6@suse.com>
 <504327d2-0d82-7f88-e155-e6a45ba11a74@epam.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <504327d2-0d82-7f88-e155-e6a45ba11a74@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0015.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a::25) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 974fa0d6-ad75-4043-dac5-08d9f09ee056
X-MS-TrafficTypeDiagnostic: DB6PR0401MB2598:EE_
X-Microsoft-Antispam-PRVS:
	<DB6PR0401MB2598109FA7D301C3547E5E9FB3349@DB6PR0401MB2598.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	fsx3qjDNfj2G+mPamhLZrgZMgy26UIjzJ3SPqpr6VhMSnufSheumxFyCaOWdAQ0Qbsc7f4fw2cHyJEea0OoG26sSX8ayJ6jSq+rmt+tSOLp8pSpGxV/F1DKVOw9US2Kyljwcx37IWtdmnm+55RMdPNWQ4zMOU4CyH6tvTM0+75MCkoV4oz0zUevozMBmPmtd0PaqING1cWxG2rbkByg/CmPgZtyHcs69l2GuhVpZPY++DZiv4h044pJEYEBjZBbZ6be+mZ2X6/5mhNiqbTymGiCmzxqyljydqQcqR+fONI9bHybMUv1+J3Ns62rvOdTeLp7hu4+OtLu+RdYdEMEeP3tEDGaRgarHGTjcwxA7wlHEJt1g9WPL+HF7ErUbl+juJeU5RDBWfW0haewo5Hn/+CK1swwp5XYXjfj1NNEneuogNIXpXfcUJfOKnCUpEP7FuABDw+GkQXyUPyZ0d2fDFuxUJ9BqOKe5Uzei0zKKBF2hlJLD//NTB+4fLMK8133521xYev0nTNGnXaP6208h4e4dcx5DI/MIRzI+b647r2CzKPNmdcVS7AAA/XbtPDJofnTgiaVEhKgWnDBgqAYXsNywnSaoM4uKIi6BvOtnK0TPnCj3Qyd7VO3p3rELPcprsyLjfEq7Yl+JLfGP5RSZsDAoCT3PFd/oMnlUo1FjFSHSzYQBrG9xDPtn1hCcRjqn1EWaLRENypBVCTI9no/I3DxkDCrPY1+pwSdJRb1oTLP001LtSVUMRX3lCtssQKs/
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(36756003)(5660300002)(2616005)(7416002)(316002)(6506007)(2906002)(83380400001)(54906003)(31686004)(186003)(4744005)(53546011)(6512007)(26005)(38100700002)(6916009)(66476007)(66946007)(31696002)(86362001)(8936002)(66556008)(508600001)(6486002)(4326008)(8676002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ckZyYXlpZ3RTcWx5SWd6Q0tQUUMwaGZRbjAvc0JFaDlWZEtkTnM5TGs3NWZp?=
 =?utf-8?B?N0JZaGZMSVhMeG0xcGZ2Q1dxNnowZVpHb0lUdTc1TE5QOHByUHEvZ21LcWhX?=
 =?utf-8?B?aDVDNHpBUmR1Si90VnFyWkVpMys4RjhTV1RacnJ0VkNROGt0NkdRRE1zWHR6?=
 =?utf-8?B?aXh1UHBWb3ZSL1lQandJa0hRa3Q0NEE1dzgxMk85VU1PQXFhSStiL3Vlc1o1?=
 =?utf-8?B?clU2S3JUbXNpdWpTTVJRRFNRWnJWUWN0cjBOR1o5RDZtYVBBVmlZTUJUNENW?=
 =?utf-8?B?c1pCM3ZsUHp1Y1c4YkVtNllTQ2hvOUkzQ1hUYXZXWjB2NTBXQThwN0dnRm9i?=
 =?utf-8?B?KzRWWU84UjdRd1J6bm1GNkQzWFErQ2svRDI3K1ExbXZ4MVprVG84QXphV3Nh?=
 =?utf-8?B?SXZRM2dJYWNTNlNEdWlMbCsydW5ORUN5ZWZuQ1luQ3dnTjdoNDdkR1g3WmJC?=
 =?utf-8?B?Nzh6a0RUZlV6N29pOHJXb2hKVU9rcVdaZjRVdE9VMjJ5OXNZOExhT0ZFK0Yv?=
 =?utf-8?B?azdockwzdmxhSXVYOGQ5MXdHR29jSnp0MjJjdTlVdjFlaHN5RWJiRENhV3BF?=
 =?utf-8?B?WkpmbEl5eVEvcHFiaU9KVHNzS1dWUTBqNHdGcnV3OGlENE1HUWJVRTJ2MEJo?=
 =?utf-8?B?eFJlWmpQYjAxYnBuZVg4Y2NLRXBFMWhkVWRjd0ZLdmNGcVFuMEFqQUJSQVR1?=
 =?utf-8?B?UzM3bUMzakRBQmtDVVdBdjU5elc5VmhNVEVoYUxnYVVVaEhJWG0zZDdqQkp4?=
 =?utf-8?B?WHUzdE9FMytEaERhUnAvUWxlNHRwbHNFMzJaeXZRazUrdU9USENqRVJOL1JW?=
 =?utf-8?B?cHdXcTc0a1V1RS94RWF0L3p3UXFBbmk4bDVhTThrUHFqQ3dPdVJKRlp5NDdZ?=
 =?utf-8?B?REIxMmZjcXoxbTVVZ2dHRVdvdUh3Z3JVcGY0STBYYzhGQWhnOXlCQUR3RTdI?=
 =?utf-8?B?WUp2bHVtUndGSzFTWGFrd0VqQVo2VGNKQVQ3TDNWRk1uZExwaU9yS21xdzRU?=
 =?utf-8?B?RlAwdjBvWDdhTVg3Z1l3ZVJlSWx5THViOHdobTVqTVZJem0wOHRlZkhOeW1T?=
 =?utf-8?B?eVAvUEx1MXNmZ0JRa0tSeE9CRWdhV1dnYkhBbXppeGNkRVdFRy9FbU45YXJD?=
 =?utf-8?B?Si9PVnlqSWxEYklZYWhpMzdnRzd6aDlJSi81NThkeDhMdmI5U2V1MFFZQkRH?=
 =?utf-8?B?dFJ6RSsrTTRydmdwZG9mZ3Z6dEZxNVRJb2NRRkUyYUd1UnIzaFhPMml2QmpZ?=
 =?utf-8?B?MWNIUlA3NmhJdGdiU1duRzRzc1RVOGFGUXo0Njh3NTRDUFhBYjBNdHBab1JC?=
 =?utf-8?B?NTJiN3Eyb01wY1A0WExIcDRvT2JuTFMrVnZFN2tmK2IydEFwNHVodEFXb2RB?=
 =?utf-8?B?ZU1SeVg5dXA4WE9YOEZkWEpvaFFBSlBRbFgva2tjYTNwaWZSRFJ4M1NGb2k4?=
 =?utf-8?B?M1hZTy9ONENSTi9ZckNYOERuYWhpSytBMFpTTUQ4aEk0UnVoUm1jbGgrc05L?=
 =?utf-8?B?dWlpemllWXpGWVlKQVVrbUZncU9lK3FuN0tzK2JhbFZmaEd4bGpPbjkwajBG?=
 =?utf-8?B?dVRPSmFXWUFvOEdlcEttL3FaZnFwVGdLYXBUclZOcGRCOENoOU5HTTE4eWRF?=
 =?utf-8?B?QWpyZ0ZJK28vQXZMR3YwdmNubVZtblBEa3hkUjBybVVpV1NPWDl0Umh1L2hI?=
 =?utf-8?B?dFhiSjVXa095Uk1CQmlEUFkxNk1ZaWg5UXFLQ2lZaTJ4cE1kcUxsYzVsSXpE?=
 =?utf-8?B?STM5RExuWEZpOUZvUGV2UWdiUGtMTlBZNXRjTDZ6Tm1Hc3pCRVowY1dTMVMy?=
 =?utf-8?B?WC81MVFJRStETTJKbG9HMkhKMUJsYWNLMzYzN1ZndThNWDlBVjdWUy9meGRW?=
 =?utf-8?B?YkxVQkVSTjg5SzRFdnQ5SzdOSlBSZFpuS01XRExmcEVMdTN0WlRLR2xKcTdI?=
 =?utf-8?B?WDdUSWNBRGJzTUlmQXpScG9DNkIvdDFsVWpkVGVKdVJkYzBkejlWeUdJdUhV?=
 =?utf-8?B?MDdHeTduWGw5c1c1UlVNRE8rakJMdDdmZzFNRUtxNDNjY0ErUXg2TU5IdWh6?=
 =?utf-8?B?Q0gra3VQNzBjNGt3bEZnUFp6TUtXbElvaWJjclNObHl3V0pSNFdMbFh6Nk9B?=
 =?utf-8?B?OHdPd3BWVkVNbzAwUDI1dVVjbXJYVlNwMFlmcUpRajdldVpuNi84NHpCM0Y4?=
 =?utf-8?Q?dMt28JHeSSoIXOKt2N5Se5M=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 974fa0d6-ad75-4043-dac5-08d9f09ee056
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Feb 2022 16:19:01.1891
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kNsQ+SFe/hwUpP5bEH8TEYoBIrx9eILSp6vgMJRlzCI1yU5j5gkDToLASWG8mx8SF3IirOlc64yYUavc7YqRNw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0401MB2598

On 15.02.2022 16:46, Oleksandr Andrushchenko wrote:
> Question: can anyone please explain why pcidevs is a recursive lock?

Well, assuming you did look at the change making it so, can you be a
little more specific with your question? Are you perhaps suggesting
the original reason has disappeared, and no new one has appeared? I'm
afraid I have to repeat what I did say before: If you want to remove
the recursive nature of the lock, then it is all on you to prove that
there's no code path where the lock is taken recursively. IOW even if
no-one knew of a reason, you'd still need to provide this proof.
Unless of course we'd all agree we're okay to take the risk; I don't
see us doing so, though.

Jan


