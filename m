Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EF055880C20
	for <lists+xen-devel@lfdr.de>; Wed, 20 Mar 2024 08:37:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.695757.1085792 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmqVn-0005tG-92; Wed, 20 Mar 2024 07:37:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 695757.1085792; Wed, 20 Mar 2024 07:37:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmqVn-0005qA-5g; Wed, 20 Mar 2024 07:37:23 +0000
Received: by outflank-mailman (input) for mailman id 695757;
 Wed, 20 Mar 2024 07:37:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QeEy=K2=hotmail.com=rafael_andreas@srs-se1.protection.inumbo.net>)
 id 1rmqVm-0005ox-1Y
 for xen-devel@lists.xenproject.org; Wed, 20 Mar 2024 07:37:22 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04olkn2018.outbound.protection.outlook.com [40.92.73.18])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id aef4770a-e68c-11ee-afdd-a90da7624cb6;
 Wed, 20 Mar 2024 08:37:21 +0100 (CET)
Received: from DU0P192MB1700.EURP192.PROD.OUTLOOK.COM (2603:10a6:10:3bf::6) by
 AS2P192MB1984.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:557::10) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7386.28; Wed, 20 Mar 2024 07:36:51 +0000
Received: from DU0P192MB1700.EURP192.PROD.OUTLOOK.COM
 ([fe80::181e:3628:177d:1cf9]) by DU0P192MB1700.EURP192.PROD.OUTLOOK.COM
 ([fe80::181e:3628:177d:1cf9%4]) with mapi id 15.20.7386.017; Wed, 20 Mar 2024
 07:36:51 +0000
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
X-Inumbo-ID: aef4770a-e68c-11ee-afdd-a90da7624cb6
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fFEIM7NB3Ts/iGIYCRwz3z8gJsHYom/Vow0MxUYhGaV2VekxS8ZGj/hBp/723GOQ7kO/+Bf9KiTFnaE7PpcsjSGlIvi9NHucCkn0UXa44jAyW0YbsCB79j2ezlfWepcPnAOosi5u1dTMJK8FQ0V0+uINp6lqjLFFUGEBHZMz0JLlGTBtI/2JBLNjEWC4OxIctIxjmkPUjviVV/r4OKFEoBlSlo7IlmK2x39Dt0NlO8Ze58AuN65pnjcX2AahUGr11DkKi0F1PDkpbUn4CeVTW2fAB5mtFefrOGRK2jY5JCIAlYE8vJzWdzJWu0pVUiB4jFEDqIGDe5wVBBoB7POxaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9cY7xZu6tKQkBnJEkMrnX9JbxrH/GT81vRAlOY9ec+E=;
 b=fIjyaT/+kEadzNt5lLiQOrTSemw0ADGcpCXNI1lUPlLqF8gVk9pkPXgg83m6D+UphvX366rHCX3kgX0+X2Dzc5EEhNJ/L6yDzU71n/wb5p73LlPlxoHDvhQRNUZQGootlhOkup2mCjt7supwvTyPPrOOAVBXArLvCTsgUPHHlyyA8LDEDcGSnlXj+Qu6O/LGlbcF6hhtNT0bzoF0Q1wi0xqZhl75c91fdrKvjZ7qDtBDi5liv4121DjpxjbwuekLCOFDLuJ/RsMfFIBzR9tHo9HD6H19s8jcbyfx1gBuR9TiyvAouWaeEhZudGAJfLJsMoD8UzKnMOrxe9APcwqIgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9cY7xZu6tKQkBnJEkMrnX9JbxrH/GT81vRAlOY9ec+E=;
 b=f43k8UIFyIJ2p/fGJ7VKuHVsWsgFX3KaMSZVndeEsnKv4Ody6bleBqszBzA1t2JnsHiW6QjNLUWTgrJdJFNijN563m6urIYeoCVxaae+EqFhWezyfNBxdtjoC5ykw25brMUqlfW0Sz5NQB8QIFZV37rwncm6Qgm+CuA1LEVKIfJ8ypbNBnHA4CO8kCRO87KSe//22IW76pqJdQcE8Gh2WVhj4TCLabogbRT7v9pAGr1PIf0KxJp0XWl2bXyUp+SbDsB6A98nYC72eFD7k+gBlBs7SveiXiPsn7u8hR060hJzdYTL8g/JJJx7a6VEoHjXveFHcvyxb4J0Ij11FdvPew==
Message-ID:
 <DU0P192MB17000D69E46F2715FD1FA6D6E3332@DU0P192MB1700.EURP192.PROD.OUTLOOK.COM>
Date: Wed, 20 Mar 2024 08:36:43 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH 1/1] tools/xenstore: Add missing XENCONSOLED_ARGS
 variable
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org
References: <cover.1710892585.git.rafael_andreas@hotmail.com>
 <DU0P192MB170046CFB3F2977E45B08E3EE3332@DU0P192MB1700.EURP192.PROD.OUTLOOK.COM>
 <373304eb-ff38-411d-becf-99fc7c170ccc@suse.com>
From: =?UTF-8?Q?Rafa=C3=ABl_Kooi?= <rafael_andreas@hotmail.com>
Autocrypt: addr=rafael_andreas@hotmail.com; keydata=
 xjMEZHDtHhYJKwYBBAHaRw8BAQdA4C7O72UZHQbhHNm1BUkAM/7+KQKN3tupyuGVGyj2dIHN
 KVJhZmHDq2wgS29vaSA8cmFmYWVsX2FuZHJlYXNAaG90bWFpbC5jb20+wo8EExYIADcWIQTv
 ioHnE84MxV6adj/iFi3SALEToAUCZHDtHgUJA8JnAAIbAwQLCQgHBRUICQoLBRYCAwEAAAoJ
 EOIWLdIAsROgP80BAKeJdh3YQ5l3gxGp8R9wIvN9Ac3vsMfy8I4kZ6TXksLKAP9vLRV4G3yw
 z7/seKhWc27Jjl4uI/+lIWhWaWrUYZmjAM44BGRw7R8SCisGAQQBl1UBBQEBB0DE61lbAezY
 NhOlHgxdZ9V4klIhSajeU50O8wHIPQnCLgMBCAfCfgQYFggAJhYhBO+KgecTzgzFXpp2P+IW
 LdIAsROgBQJkcO0fBQkDwmcAAhsMAAoJEOIWLdIAsROghHgBANU4dj+WnuSaWemAHVkjERJg
 m0FQpmZzNI8hdolS3gYdAP9zGK65ilpHMDj4pGvfALabruZA4NPJYxSqeamHvOuhBA==
In-Reply-To: <373304eb-ff38-411d-becf-99fc7c170ccc@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TMN: [xTgT53uF+T7ONRchNxIKRPp+ySOD2xvWqbMTNCxwXmFCxqnQ7ai1xYfLh9uCw37R]
X-ClientProxiedBy: SI2PR01CA0020.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::6) To DU0P192MB1700.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:10:3bf::6)
X-Microsoft-Original-Message-ID:
 <5979ca28-5a42-4e73-abe8-9a2f21df86e4@hotmail.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0P192MB1700:EE_|AS2P192MB1984:EE_
X-MS-Office365-Filtering-Correlation-Id: 9cf479a8-b26f-4e00-8893-08dc48b0816a
X-MS-Exchange-SLBlob-MailProps:
	qdrM8TqeFBsDoBs/oZrXuoWrSByezst7VDYqxQw+b5ynGfzZrmTkxqxZ7fTUEPuAP45RwQ9Mxsc4s3zE0gZkWLwqwoQNdY6RW+RgWPAkXRNrqcsYSFb014SM7BK/loN6s3ZSvdhh4gt/9ov33DsoO5FNVm/aXRsPVbEbP44JEid7PjSb0ed/kGen8I4+Fhvo9/cGjw08nF3Fr/sAUj+Rwz95NhsG5coK2H7dDg4pGnVRI1H00mV9E2+qduVZoICaBs9FHidQsHOap8BxJ4KKxq6cwO4faors5Xhrf/duf27tArY9RHB98KS2nLKkfL1CrtItcPGLO6zwhgBfD5MjOIYc1yco4Xz/3dalvC5TTBDfOdqEHQKevtk/Xg/vSYbE9jvi2Qf/JKD3omKkRQeYoeuOE6nwvHf5noD1FAIc6fvu63RYSouXQnKvSxxuOSsTsadmzXwA77ynVRpYHpFwMt3xWcGHH7RmMI9aDJwMRWHPLMcx+qfY+M/fB5E+/jgOoTT0RiMkkwahfBlvFQiJCCHGxPnjEb1EcIXeLF/XDZdoLk3gKJTwKEytvO6gA+lNeSZImpgEtrW8+POBMxYVJqjW6LRVd7t+ZjVp3mzO7XJ9CrM30Xzovijomg6+e0eN2Pt9PdeAeTZ5BobhXA//IXNf8G0cQ2HyXkfXRb6NJ/A7bj3jpnmUv2mSRC1ThYIG7Io2+52t7q8o7AK0TtJmRU96Xvy5h+uMkRQXtmJbJ0GslRtzRnEEkeOILHLYV0PAiR0JoEyvi7lwY66I3du71TFEmXkpjclj
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	z/c17clEZmYu+peCHvoLjdByjsfRCL6P97A4Y8737SVRPfbMJ7WApxq/Z9PuAzCr3CqMjRvYvHJAG+Z+bC1+yAeGFRz9Sps8/lAGAckcttfK4A0U4B69+9QBCO87r5voKc/JCjIvPbeQtI4n6+6CDxL4x2XMotHEu6qvMTLHxJ1LhEKG8ru7k/G8hftM0btp5hBtQxGLIqbNA7tvxzzFvgMbVG5AoQIqHXH3PMfEmljftyJjw8YXGyxavpGqFNLTtUWHWns8FEI06OwQBF1Z/F17Yzjm1CyHXXP37sVr/4xuaVyk5/4SzDMcT3Z7k5sLDLvg1kv4PIJFuYI+PF7Gk2Bqege0opLgo2qJIQ2JwaF9S4Fd5qiWXS5hKb+BU86+1/kSW927rv8bSvbzyjCMIa7oEMxVh61v9bmwr6KOvQfn1xXpzqiP8Z8Qqsxe/ceX1OfXjXwIUaze9EJhpJpFmDyaQUAw4fnkMMUyojvHkmFjT4j1LRNyUhyqQQKW1zFmkYdy+Mp71tzCXeJ153Hx/Lp20QcJPfUvQGVteArHy9QMFQypVwhVAxs7Xg7YzeIP
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WkZqRm9XYytjOEFLc0hJajdjTEsrSEt6Mjh2OFlvMjRzMXhVSUV6QXFJSU9D?=
 =?utf-8?B?YWtZS3IwUEI1VnhVQWtCMVNVL09yakhNOExmWUtlRURBQy9sQVNtSEpuaDFk?=
 =?utf-8?B?UUxCKzRnTGpIeVh4a0tCODBmVXJxbWFWZ3V2TCtFUWp1a3VqVnRmMFZGSnNt?=
 =?utf-8?B?V1lmUEhOSzMzcXRBNEJCOE16dE5YMGxPWHN6Tkkxbkh0UktwdFZSUVcxYy8v?=
 =?utf-8?B?VmVnd2Q2OThndWpOM2V1aXZDMGRYRkE4RGZ2clhuL2tnS0JjRVRYVUVHM1Nn?=
 =?utf-8?B?b3ppN2s4NVlLODFMNEhZWTJiQUdFUGVoS1ZVaFF5c2hEZlVSTFliMXpmd3Br?=
 =?utf-8?B?ditJcFg1RW8wb0dKZ3lDdFpQV2djODQraWNvMnJBLzNzTXY1cWNuQjYyTG5a?=
 =?utf-8?B?ZEhqWis3WWhKRUgrVjF5dTE2NzV5aGx3RWF5SW9KTEZmMXNkOTA1TUhhRFo4?=
 =?utf-8?B?N3Z3YU54OHd3cUFkZVI3bW0rczROalo3Q3lzR0FOdzFFK21aNWdhTUZZbU4v?=
 =?utf-8?B?a0N4TWpNNGpPanFiYk05TmdDbE1XWWJhSSsraXlBK0tYSHREQXVZa1YvMDho?=
 =?utf-8?B?TGVhRzQ2ZFVyTzF5Z09VZ3Uxc1ZBRkZRNmpqTEdoRHJJMDVIMW9aM0l2eVNF?=
 =?utf-8?B?d3VzVG90QzhFQjdJMklDWWQva2Y5N1llQ2tvdGtMbG16cHR6Nkcyc0dJRER2?=
 =?utf-8?B?V3NyU2ltazRVTndpU1FCKzgwbnpOOVl1ZXpsakVvMFA5VGZnVVY5NXlhY0Iz?=
 =?utf-8?B?WnlPajdKV0hwUEZPMWVCQkgwc0JuWmkvZlQycVZRZFZkQW4wd25QQi93eGpr?=
 =?utf-8?B?WE1tZStYRkw2RjZ0cm1iOEVHNmhCb2pYcjlYNWVrMFUxbUN6Z1dZSEd6aVR2?=
 =?utf-8?B?V3RQVTlLRkttOFJtSENWV0diSVR3L0YwZjdSa1MxaXlLT3ltTDZLNzBsZVUr?=
 =?utf-8?B?Tm9mSWc2MUxRejVVSmpnamZXNkp0aDNNblhuVmxhaGlXYjNZNTBRUjBhY2xI?=
 =?utf-8?B?LzNJejhhbU16VFozdVo4Sk9PUU0zbVVjejUrMWRjOERCWUFDT1R1MXo5Q0FG?=
 =?utf-8?B?UEJzckwxQSt2MHNpUG4zcjBwWWlGSW5iQWxkbXB1RjBvSE82OElKZjJwL3Y1?=
 =?utf-8?B?aUFGOXRVTGplOVJxbzZHaGc5ZEc4TG0wWEh6WU4xc2xBZWVmRDA2S1dmR0pX?=
 =?utf-8?B?eTcya0R5blVqelplWGVjTldRb2VFTWNtaUNjN241djVlYXVUZU9iMnBBU2pI?=
 =?utf-8?B?UnJhcFdROVdKQkJWNUkrU1NrK3cvSDJWdTB2VjNaWDFGOTlxbld1dWxkUVV6?=
 =?utf-8?B?c3k4TE9TSkJGS25zd3pHcktabVBPMUxLZmdSTmR3eFdXaVlLbGN5YnU1cHJZ?=
 =?utf-8?B?bEErY1BBdS9aOXhkSnVxdjl1K0Z3U0F0UTFidUNpazNkbU1DWTZoYnZ6U2wz?=
 =?utf-8?B?eFhLMFZCR2FBYmMranhYYnk5cDlBa09EZ1Uzdjk5TTI1SnhhMk1ZYzFjbVQr?=
 =?utf-8?B?N3drOWRoellXMXVkamU5b24reHNwWVJtNmgwSUZCZXY3TXV1WWRKUVR2SkxQ?=
 =?utf-8?B?WVlGeGQ4SlZyUmxqWFl1UmtLMXlYcWExcHdiWWlETTMxZ2lZZHJLUm5JNlEy?=
 =?utf-8?B?YVBIcytrWVRtNjJOZVFnMHNLaG1JcjcrbmlDMmVEN21IbmhzaHpMN3JFeHAx?=
 =?utf-8?B?QlZkb0lvajVnTEdpUlhicEVxd0hSa3h0V0h2enNPdXRCZWRyUllGQVY3dTVl?=
 =?utf-8?Q?IYIN2HeEfZ7eAkfwENcnB/ukJeM/ZgofRNw26Fu?=
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-fb43a.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 9cf479a8-b26f-4e00-8893-08dc48b0816a
X-MS-Exchange-CrossTenant-AuthSource: DU0P192MB1700.EURP192.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2024 07:36:51.5682
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2P192MB1984

On 20/03/2024 08:30, Jan Beulich wrote:
> On 20.03.2024 08:15, Rafaël Kooi wrote:
>> The systemd xenconsoled.service uses the XENCONSOLED_ARGS variable, but
>> it was missing from the xencommons file.
> As to the title prefix: How does xenstore come into play here?
>
> Jan
I don't actually remember, I may have done my git log incorrectly as I
don't see other people use that prefix for it. I probably should've
double checked before posting.

Should I use `tools: init scripts:` as the proper prefix?

Thanks,

Rafaël Kooi

