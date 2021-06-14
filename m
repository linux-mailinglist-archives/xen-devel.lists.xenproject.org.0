Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 205AA3A6978
	for <lists+xen-devel@lfdr.de>; Mon, 14 Jun 2021 16:59:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.141612.261521 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lso40-0008Nu-Du; Mon, 14 Jun 2021 14:59:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 141612.261521; Mon, 14 Jun 2021 14:59:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lso40-0008M2-AP; Mon, 14 Jun 2021 14:59:44 +0000
Received: by outflank-mailman (input) for mailman id 141612;
 Mon, 14 Jun 2021 14:59:42 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=XszW=LI=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lso3y-0008Lu-7o
 for xen-devel@lists.xenproject.org; Mon, 14 Jun 2021 14:59:42 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 229b1db1-fad4-4716-a850-ef13262a142a;
 Mon, 14 Jun 2021 14:59:41 +0000 (UTC)
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01lp2054.outbound.protection.outlook.com [104.47.2.54]) (Using
 TLS) by relay.mimecast.com with ESMTP id de-mta-7-1HI_6QEgNiOn38S9iAGQeA-1;
 Mon, 14 Jun 2021 16:59:39 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4381.eurprd04.prod.outlook.com (2603:10a6:803:6d::30)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.22; Mon, 14 Jun
 2021 14:59:38 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::f06c:6f5d:34d2:1c36]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::f06c:6f5d:34d2:1c36%5]) with mapi id 15.20.4219.025; Mon, 14 Jun 2021
 14:59:38 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 FR2P281CA0022.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:14::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4242.9 via Frontend Transport; Mon, 14 Jun 2021 14:59:37 +0000
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
X-Inumbo-ID: 229b1db1-fad4-4716-a850-ef13262a142a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1623682780;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wpD3cR1gk7HASzyY+f5N3PorKTwg02z3WvEFIYP4MRw=;
	b=CDJnUb8dKCud2EaUVli/d9o+fn8/6ZgBJEyzbzlXvyQcScBaqW1PV42E7QPS5MiLwUV77J
	LUA7+oM0rPb+u1AL81MCV/7C2TmUrsuwEgVwydxJuysqfJBe4ZTBIJYI0agg/sAa+oLEQf
	4iffWfs5up3e4Idxd/OXOce64bRNClc=
X-MC-Unique: 1HI_6QEgNiOn38S9iAGQeA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cXE7E7y/gW2k+wbWuCGPYlmTJPnWVbrfXGB7T0xKcby3bu+/II0wdNSlY4cBqPOyhLs+A0EvrlF0oIOdK0zBlj0aKcpssxI6DF6aAfL+BNR9FtIHEQgi32yGSsZmKDCY2fU5w9dqrsXGVoV/L2ApziuGtEERlwcujdKYbZ6hYsZRpUT261HkK1vIxVDMP263H0wwhP8sZaAW6pNtindUtc8Y+3HhdTi96/4IVIJ6qhIqNQ3qgORzLeXyw33CNvrEPJKlVnc3f/8whOea/15OFywAMVhjTrjTvIfs3w938vlvk/r1mdm7ccVsJZTLv7bPJ2ZYrNtxyLSgkSmQXzFEJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wpD3cR1gk7HASzyY+f5N3PorKTwg02z3WvEFIYP4MRw=;
 b=AC0ucYPOPAR6/ejvNFTzl0uKaExRFnA1M1s9Go1uu7+B8iuWeUVZ8fQkiLu82QA9EkK7NhTED1yRilrE1dfb7mklLyanN5+ATVCw4qRuowDKmW1m+IX2+agOQqyqRHlKE539JtqMwBoFEFHs7hSoqHM/rksC+q3e069mLrv0s5XvVzAz0i4nGbHDUAKppmbSoizrekD8fT+0ToL1BCqMIaYKrUDmvhozGBLbfKfpZ4ufzzd9LfQYKIG1n6CcoEWTURo9lvDv4NajS4+XDFacNH4pQWjcT92hAQiJgUWHRkO8OJFYzH/KRPnqC5b8CZgd27UbEJ85RgSAtl/eEVFDEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH v1.1 5/5] tests: Introduce a TSX test
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Igor Druzhinin <igor.druzhinin@citrix.com>,
 Edwin Torok <edvin.torok@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20210611163627.4878-6-andrew.cooper3@citrix.com>
 <20210614104716.23405-1-andrew.cooper3@citrix.com>
 <9257fd40-65cb-8b08-7639-00b15dd0aba4@suse.com>
 <cecc837c-e261-17d8-a77e-044256d8bc0b@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <d7c7959c-6842-7305-2aef-77cb65883324@suse.com>
Date: Mon, 14 Jun 2021 16:59:34 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <cecc837c-e261-17d8-a77e-044256d8bc0b@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.24.206.209]
X-ClientProxiedBy: FR2P281CA0022.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:14::9) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bba61029-8163-4345-0ac1-08d92f4507da
X-MS-TrafficTypeDiagnostic: VI1PR04MB4381:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB438165DEAA506DC24B4B661AB3319@VI1PR04MB4381.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	eT2iH0y2cdB0UZ1AsMfFCnBZkk1JCzjeWD/ndczDPtFvUtsLTsBsUfoBm/BOoRH4sQRrMcgKNOy0lEuMOcbLAQmeDApK0SCC/YrG0gzBESnPaZH0d20h3foYvWDHl+Wx4k4VMRmqC7CxY/QNT2Ke4aWhiFSo26G2fK4ch1RqJ3zPCZ6f5bFGpKVPOTmke//nloReP/BUNgJx6aIV+qqAqhO4YCHTUQQrXMbRAT0IakcsnUBpNlDT1Jb47vTcbtZ5AXga4bRp+/Wp4eVJ+E5fdI52+REjtjT0ytQTHlNs7QauN+bJuzevZ6zU4CNi5ENyOCd8GhVllSnfR4SuU/crL8UWzG58W1UEqjbowOZWZlEeUoEhUdhzx0BN4AthXfWV4aSxGiYBUWR94VO5DFzoYc5DvmVRGJurp4o5P6a9K20uC2+Tt5OebKHqT/sSyXzH9MtfB+JDH2pzQ4ipM8lfmqQs+LQnTXTCIxEiE2PIc/ZSOV8LOQl5zbEAYDITWgknxT1EXq6ZodbiHX47Mnh4I7gWNZ6UxqeuQFhyhZ9JS5YepK6uYI7E+olKd12of545Jos5wHvD+S8RLKuuxbeCsZodjOwZhmAOto2hLEty5SPOt0P7fCdWOZFy62eiV2dktqJnh7cTAmZSHWm2gQ4kanh5vYvGvlEbVyFB6D+DA8YiH4TzNPS70bDzGQC39Pv7
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(39860400002)(396003)(376002)(346002)(366004)(136003)(53546011)(31696002)(66476007)(66556008)(478600001)(38100700002)(4326008)(31686004)(66946007)(6666004)(186003)(36756003)(16526019)(86362001)(6916009)(16576012)(2906002)(316002)(8936002)(5660300002)(26005)(6486002)(8676002)(2616005)(54906003)(956004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Q2RqWHlQdG9GanByM3R4SnA3aWdkdnhmb0xrTm03T2lnaTFwL2trem1yL09u?=
 =?utf-8?B?RnIxS3ZzQTBudzZJT0w4Q1hDRTZGL3Y5Qm40azlFZDBNWVZoQzJ0WmZjM1N2?=
 =?utf-8?B?RlU5R2ltTUFtRmFqblozZisrRnAxemk5OFY2NkhsM3NmV1haYUhIbWp1b1Iw?=
 =?utf-8?B?eVdNYTFqSGJ1VDhhMjVRQmhtUlhrQXhYVkU4K3lQRjVVWWpncDlxZVVIUXZD?=
 =?utf-8?B?VGlkUm9PNHVBT3BuRUJMSy9wazVURFJsWVd2b3hHaVptYjJUa21jN3RuY09S?=
 =?utf-8?B?OVFVOTZYNDRGWWpvYUkwT0JoWkRjMjFNWkI3bkxuYm5OMWV5QURhRW93Zlkx?=
 =?utf-8?B?NThEUmJpWkI4REhvblNTUm0vQXBHMkF3VE5md3BCZzZxbTM2TkRNclNNa0l4?=
 =?utf-8?B?OTcvQmNVVzJLcmlHMlA1TnhKTFNOY3QyLzAxY0tJdTVnakpsUHhOUVBWVzk0?=
 =?utf-8?B?Y2ZqUUZHaHpKY0NidlpmcUUya1Vnbi8xK3lXdmxja09oSGdKZlFYTEhHb2dO?=
 =?utf-8?B?NEV5eUxTWEJqamRnd2VRZlcycGtwMjhhaW11T0taOTRpbzJLaFZYbUJVTkpa?=
 =?utf-8?B?YWlvZ3VPWVduQlRJbUlydzkzeU5LeVdRaU5NSFh5K2FuMnltU1g4c09mekxF?=
 =?utf-8?B?VDg0aXFXaGNYanhiSERiQXZVMEwxKzlwcy9pMnA2b0JVSllxZnU5YnlqUzhG?=
 =?utf-8?B?emZteDBCWEVGVVd0V09lMU9yNWoya1lZZmE1b1BJOGxSQktPaVRwU2NhTmEw?=
 =?utf-8?B?MkFoVnFBWFdmbnVyM1J1cW1lQjlOS2pZSXprT3FJVjE2VWROSUdhY1NtWnZ2?=
 =?utf-8?B?NnYrdzBGaUhxV0p6UzJacU5Rb0tJaHo5bzNRRWQzUkxjSWVGaGxycmVZVFR3?=
 =?utf-8?B?NERlUGRZZ2F2Z1BsaXBTdkpKZnJaanFXU0RsV3h5VjNqYkhPMTVRQ1F1V3hE?=
 =?utf-8?B?UGlXQ2xCRjN6ZDErSk1tZndPaTRnYlZqZUdFcXN5WUFLRTBjV3d0YVFQd0pC?=
 =?utf-8?B?WGhEWWxreTBQMk1FZnZwOXN5ZGZKUkMwTmlaNEZXRFJVc0pqUTd0dTdFWjdD?=
 =?utf-8?B?V1pqYnB1SE5hWk0yTno4ckZlNms5V2l5SEU5Z1lTTkFQcURxK0doTWxEQm9B?=
 =?utf-8?B?WDh1dVdNNVZsdi9tU3BicTIyT0NVcTVXK20zTkRuRXd5T2VyZzZJV2JmbzdE?=
 =?utf-8?B?VHhsKzQxSlZoYVVsVk9PSlVpRmZQVXg4U24yN0hyRE92UlVxWGJJSVNIRmpy?=
 =?utf-8?B?U0JhNXRWemFYcTdVZlQ5RXhHekRMVGdXVERPRnVVZDUyN0xTdXVzOHZ3YWZx?=
 =?utf-8?B?cG54Z1lhdi9ROFNWWEpPbmNiL3VveHNCOHcrOUxjMWQrRkpIOTBpekswWlZh?=
 =?utf-8?B?eGFZSk84ajZiRTU1eEx0cFh5ZHR2clIxbHZ2ZXdNYWRiUnNjZXkrUWpTK1VD?=
 =?utf-8?B?N1RlSTNXaHFmMFJENWJzSGtaRUpFU1lBVkkvVXd0WEM0TkpER0ZVekdLM0N2?=
 =?utf-8?B?VkpPT0pWamdkbk02UW4rQkFGSkVKaE5nUzFZcmNWRnJDSXMxQ3gwTnlOdVZt?=
 =?utf-8?B?d1FReERBTmJaOW9nRldFNUl0SkphaFNqTzQvbTY0Q2RmNnpEZnhIWVRMNy9J?=
 =?utf-8?B?RXdoMXpUa04wRkcyQThqcDJ5bWF4SHNjMUxFbm5laE5lTjB2Y0hFQjU3MnhW?=
 =?utf-8?B?K1J3WU5VdlNHSnY1YmJkaWhBVFM4T2wzSFc2clpkSzlCaXpudkhxM1JvM3Ix?=
 =?utf-8?Q?ho0oC/WakW+LWkUJtdQBi6LiLNZWRNugSJysTiD?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bba61029-8163-4345-0ac1-08d92f4507da
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jun 2021 14:59:38.1824
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VETmXgttV8a0BaQCDbYonjspYCBOSOeh9eYZ7mIDWn/xo6YK416asq/fZ0D+E5g4MbnOkla4u3UbFdmixa7V8Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4381

On 14.06.2021 16:50, Andrew Cooper wrote:
> On 14/06/2021 14:31, Jan Beulich wrote:
>> On 14.06.2021 12:47, Andrew Cooper wrote:
>>> +static void test_tsx(void)
>>> +{
>>> +    int rc;
>>> +
>>> +    /* Read all policies except raw. */
>>> +    for ( int i = XEN_SYSCTL_cpu_policy_host;
>> To avoid having this as bad precedent, even though it's "just" testing
>> code: unsigned int? (I've first spotted this here, but later I've
>> found more places elsewhere.)
> 
> Well - I question if it even is "bad" precedent.
> 
> For array bounds which are constants, the compiler can (and does) do
> better than anything we can write in C here, as it is arch-dependent
> whether signed or unsigned is better to use.
> 
> Beyond that, it's just code volume.

Well, no, I disagree. Any use of variables for array indexing,
when not intentionally meaning negative indexes as well, would
better use unsigned variables. This is just so that in cases
where it does matter, people will not end up cloning from an
instance where it may not be important because of, as you say,
e.g. constant loop bounds.

As to the compiler doing better - if it can when the induction
variable is (implicitly) signed, why would it not be able to
when the variable is (explicitly) unsigned?

Jan


