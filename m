Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A4274EBBC8
	for <lists+xen-devel@lfdr.de>; Wed, 30 Mar 2022 09:33:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.296058.503945 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nZSob-0002Bh-Ma; Wed, 30 Mar 2022 07:32:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 296058.503945; Wed, 30 Mar 2022 07:32:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nZSob-00029s-JL; Wed, 30 Mar 2022 07:32:25 +0000
Received: by outflank-mailman (input) for mailman id 296058;
 Wed, 30 Mar 2022 07:32:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=b505=UJ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nZSoa-00029m-6t
 for xen-devel@lists.xenproject.org; Wed, 30 Mar 2022 07:32:24 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8885e1b2-affb-11ec-a405-831a346695d4;
 Wed, 30 Mar 2022 09:32:22 +0200 (CEST)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2113.outbound.protection.outlook.com [104.47.17.113]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-3-a-H0i90RPtCwH-LECqHAbg-1; Wed, 30 Mar 2022 09:32:19 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by DB7PR04MB4411.eurprd04.prod.outlook.com (2603:10a6:5:32::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.23; Wed, 30 Mar
 2022 07:32:17 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::914d:e08d:7798:8476]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::914d:e08d:7798:8476%7]) with mapi id 15.20.5123.019; Wed, 30 Mar 2022
 07:32:17 +0000
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
X-Inumbo-ID: 8885e1b2-affb-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1648625540;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NqvfZqfJm8N+O8e5n2Eq0kzoj3jiLBY34rMIGTB9nGE=;
	b=Qe8wac+l3OKloKx3IYZnSZdVUiNAa5d6XaEBFr82z0/c0d1FnEsYQV5QrTSDgnlkrx/LfU
	fe+LRfWGqW8fWN526oVYNutMqLfEhPJN2/QfeJoxjuxeYFhrxHp/ClIOirSe7KCJjYg7QV
	MdqmbZWj/xr05iFaYDjAqPgrDN835Ds=
X-MC-Unique: a-H0i90RPtCwH-LECqHAbg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hvGbhW4LAby/3uM6YakYqtTQRhusTURhcsOsu1Vlge5l5nzLqBYJ1l613whAfpH4dMoHMkxkjgh2YcQOWB94zsHrvKU1MiEpEv2wsSOhZtCVvfs1MZGKtFwXk/takjI8nzS/tofoARODgXUs41AuXhKeXJrfi/BRcUPXQPStV/LHdmqmqcmOr4w+r0vRq56a7kxJDQB7nHqbKN0Uk3uc7SLIeyq5lLGyde4zJGArNJwMgSF2TpKXBcGueHxm7etbEM0JZI3jWwRYoWduQ3e9kQX6VTgiaXVM5lVMkACtQFdThCJ4RPFqxqHfuEyjGeyu1wWOVUcF8P1OwodB2rtJtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NqvfZqfJm8N+O8e5n2Eq0kzoj3jiLBY34rMIGTB9nGE=;
 b=KsLksHfNmNj+fzCKjWtIvyq3re2LP/i09jNGYgw0qqY+Dpd9QOx2Y/D9EP6rPhowHeoytIxsL9iEFLWWvGsmA3E3rJG2JL5mvcQ49DW6IjvlUzrbkL1J20i34boIdMVN7vXl5wWnHGCEDWD4B0aws1q9PR7icdgg+59NOPY9WgAj8fwPlOqmnRj/F7YC0d49n8H96ZJJyk1fZsx17Qmi28UGYcqKAGvCVycTx7Zisz/WN3PqCP3J9mASNqlvk6tLAKMOphZZI4flJ6Rm2KxPG3dkyY/uJhMqXZT/acHWCKtjpJxCuZT9pjQxznvQODUrrn+JUeLLbomHVNQwI0gq3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <de5832ab-3fd6-f58b-4a0d-fe22cba9d786@suse.com>
Date: Wed, 30 Mar 2022 09:32:15 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [xen-4.15-testing test] 168970: regressions - FAIL
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <osstest-168970-mainreport@xen.org>
Cc: osstest service owner <osstest-admin@xenproject.org>,
 xen-devel@lists.xenproject.org
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <osstest-168970-mainreport@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P192CA0096.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:209:8d::37) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1351a6f7-0adb-490b-1770-08da121f6ace
X-MS-TrafficTypeDiagnostic: DB7PR04MB4411:EE_
X-Microsoft-Antispam-PRVS:
	<DB7PR04MB44114C624A3520A54E2B825CB31F9@DB7PR04MB4411.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	T9ycuVvZP1tzxG7X10iPwS9Yzmoy7x7kAr3+e8SqRJYEzF9wsizQ5S0mzwajl7yu/la4Z3kCl+g0JroowQtXpa8vfjNVcUv8siN8blt09Zvi4VD++A/YIe8wARKCE0CjrKOnI0a3b9H+G8WoRVGckMQBiZuADCvJWhWq2xLiry8iCcPrL3YkFrDyvem6/FpfE8h1dORxuKknmPujrKwBzLYxHAVMARfg0QQZdQEhsk1fKeh5ZYMI0strYXRXuHzLY16lBC0+esRphTBUmPHtX9U5PyuGVhUmAdzrLQmSx2Bkps7TzWRuz6dt9p3huoppig22S/E2Ry46i045MSLu+E3g9PBWMUjJvlVhu3rEwTOsHaqCBSzW0hIFVBKGmX75IsqF5uul3HGgWD7Jk0oJ+NuqbZZUX1wwgX4VJSEEBByiIDwvbmarzpSNNLGq2eWkCXDBR38GbZC6dyagMC8bIGU4lc3otW6DS2NwSPZ9EuqOpGoGl1Od4Jfri/OXv0nILDllRmCOW/FoONyuP35ci8u7AzuHskMXkRB8A0a7uZY+y7rLo50AkbjmIaxR1rgr5a7LSg/ZV3JCknzHjCHzMbF2MB9XPf9al7NPtcOpxRUpZCTsESVG9MWUjU97iRMt/8SmsH0yiNHhAnI+zt35wmFruKSNRYGzO54v58C5PF463k3CRn5RzPqoK6qwxgeVbC32TXmxB3+rtwyens9eaEUXgQu1s8a1+R6qO5RVzXToWB40icqb8SAjJvv9WcxnhYfhYa/K4dF32zuuZ58lEPObPDWoJ+3yijS0GmmEoRDiD/+jw5ju/lnuFOPwaE+3
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(86362001)(31696002)(8936002)(31686004)(2906002)(8676002)(6486002)(66556008)(66946007)(66476007)(5660300002)(6916009)(4326008)(966005)(316002)(6512007)(26005)(186003)(508600001)(2616005)(53546011)(83380400001)(38100700002)(6506007)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?N3Zod3AvUnhPdkhVeDIzVGZVYUZYUlNpVEJXaEQwNUpSSWF4NmdvMWpodFpO?=
 =?utf-8?B?c1pwaWk2UnI1MWZIY1Fldk5qQ2JucXZqRWpKZERSZTNLKytBWnZqVzYrL2R4?=
 =?utf-8?B?NGh1TjB2a2ZQRVhYZE4reUF3QnBLS3pZRGZ6NzlMM0UxSkJyK2ZBT0xJQk5t?=
 =?utf-8?B?WjlGM252UGJIMXRWY21ZQ21uR3JmdkZmSUsyY0tBYnhSVGZUMlBDUkE4Mll2?=
 =?utf-8?B?d1lRdUtNS20zbjUvb0hZMWIrMnRnZzNqSkExbTZZalFIekVGK291Uk5hdElS?=
 =?utf-8?B?MTBQQXptL2oxYU5hTlVETnQzdCtPNWFiYlhkV21rOG9TM0llOFBiUVREeWd5?=
 =?utf-8?B?SnFmY3hmREhLOHo0T3p6MnhJajZZamFIMHBPU1UrbC9xN2hJcTBCajl4bVkr?=
 =?utf-8?B?TGJOOWlGa2JZR0VlNW50REdqWlZNb05rZmxSbUlwbXNZbWFUcUxZVm5pMk5Z?=
 =?utf-8?B?ZXRsRlhEM1grSVNSK2xDWUpSaStzeEp0Z3h4b3k3bm1WRXArdU8wVVNIVzZO?=
 =?utf-8?B?NU1sVHR5UWE5RnRzenltWlRDYk9YYWhNOGxuY2JFbHBhdGllZ3JVVFo5clZm?=
 =?utf-8?B?NUNxL0l4WFhjVjMxb0hCWklDZG0wWXgvZko4K09rOUcralVlb3E4ZkZhVFJ6?=
 =?utf-8?B?cmZ6Wkd4U0wySThRWUR3eVd3d2wxdW5pOHRJQnRmZmJnOVpGS3ZtVGpkbmZl?=
 =?utf-8?B?aERsdFRPZE01NkVBa1M2MkVuRXcxRE15QWFhQytJRVowM1FYWkhDbDNGRmgv?=
 =?utf-8?B?TXZyS3E4QjF0cWFEODlObE9nTmpJWlFablV6QjEvVWZaNmNNRVRlaU5QdnZa?=
 =?utf-8?B?OTNUTlpza3RrdGpGRXJoMHJ6NTU5MGRoclY1WTc2Z3d1WEUvWjlmdmxTSjdX?=
 =?utf-8?B?bitSaUNMeGVoSVpJelNiU1JzVDlxQ0lIN3ZCODBxVjF0MERwWXN4cDR1eXJ6?=
 =?utf-8?B?VkdLbWI1WnJuMGZES1ZlTjhSTC9zZXNJd0tONUkxN29EYWJDRXVyNVNFdGh0?=
 =?utf-8?B?ZGViZjhtdGhrSzNubmsrUXBCWWVEbmpxRy9qenBNVEtNYzJJUXhFTWVtblhG?=
 =?utf-8?B?ekhaK3lHOG50d3JhSG9hSUYzR0JOZnQ2aVNIcmo3OU9Mcm1oL3NCR3IzNkZr?=
 =?utf-8?B?U0hNdlNyak1wQVNpNEowZEMyVkFld2JxaTIxRkJpQzBBanluQlZJcUNzOEtn?=
 =?utf-8?B?YU1BMkNEczFHak9PR2RjZk5uL3kxNU1jM0thUWtkTXE3WmtNbVJRR2tmRnQ1?=
 =?utf-8?B?RDJ1MjVodjNOOTNRQjNudXppS3NQemVtRXdEUUk0VWNBa1lxdjdoL1hHRm9x?=
 =?utf-8?B?MEQraWo2Q0kyWU9pVStjRzgzZHNYQUxCNGtwYUxHMEE2Nmo5QzJyWlBrQWdC?=
 =?utf-8?B?Nm1uTFNualZ3WTc1aWhUMjd2QjZEdUhIa0lzd0MxR1lzYVdGYWtxeDNTamJB?=
 =?utf-8?B?MUI2cDBOamc2cnUwRWRNU29MQ3BBQVFYRkVYWnhKTllJNjV3MndORFZicHpC?=
 =?utf-8?B?VWVoNkY4cWcxODVNcHFUMlVONGh1V00vUHZTb3lIRHl4YnA4UWN4NFpjMk9H?=
 =?utf-8?B?UTEzUFBmdkxWNWpRY3lKWTNXV2VJZUkycnpub3BEWXMvei9TaE43RG8yUW9X?=
 =?utf-8?B?WGQ3azFqZVhIT1E5OVM5K3JKQTJ5UGZLT2JmS3lxTXUwUDFVby9aUlNOYVZu?=
 =?utf-8?B?L2tzUS9Ebit2SklNcFgyaWtkek1lMHRHVjJsTjJVSFo2OWRwZ1IwQ1JEM1hK?=
 =?utf-8?B?MlZnWkJDZ3owMmVybVFYZzZ1di8rekxCK3dGOW5tWExNTVQzNzRMaGQzejRu?=
 =?utf-8?B?b25LRi82Qit4a21BdW0vcktEempJS1l2Vzh6L3d3TkR5WE02OHNYV0t6OHg0?=
 =?utf-8?B?NE5UYkVkcnJQeG5YbjZIMVg4YTBaL0F4a1J1ZmlxaHh1Myt1U2FCU3ZCUDU3?=
 =?utf-8?B?c0ZNNGUzNzRHZlRWdms1RGpvTjJtTStYQlVkQlJUYThrL3J2TjMwZDVXUy9t?=
 =?utf-8?B?cXBQbEJCSkRXZzZGc2Z1d25rSVliengrSEpYajczRko4c2VxZnd2QXJuSjR3?=
 =?utf-8?B?Rzk4SHdaRTF4TDhDMHc2MTAyaDZ4YzJqbDMvWjJGRk9SSnpQdHd6QThHNm9q?=
 =?utf-8?B?NGxSZUFoL2xjSUMvbng5RG56MnV4MldqRDM3NEJFL1JuUkdUVks5WXJlaE8x?=
 =?utf-8?B?OXVuQ05oRUtlSUNmZDg3aC9WNC9BWUpFTnFvUDQzM0R3ZkJkT05DT1hYZnZj?=
 =?utf-8?B?N2xvZGxvZFpSUWwrVFFMOUtPdHk2MXBwZ0h0LzF6YXUwVGxCdld3THhGcFRZ?=
 =?utf-8?B?UU5ZOEJObXdyU2tqTHp3RWwvQkpYbG5PZGdJdmxFaTQreVlKMkM0UT09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1351a6f7-0adb-490b-1770-08da121f6ace
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2022 07:32:17.2617
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cfCnYaKOsUeSX4pB2tkM1GAWDWsA4TeRxMOTlDMaY8Hv++owRGnzk8KvENq6/1SZlHTuMMGtXD5o6JI52OAKng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB4411

On 29.03.2022 20:06, osstest service owner wrote:
> flight 168970 xen-4.15-testing real [real]
> flight 168989 xen-4.15-testing real-retest [real]
> http://logs.test-lab.xenproject.org/osstest/logs/168970/
> http://logs.test-lab.xenproject.org/osstest/logs/168989/
> 
> Regressions :-(
> 
> Tests which did not succeed and are blocking,
> including tests which could not be run:
>  test-amd64-i386-livepatch    13 livepatch-run            fail REGR. vs. 168502
>  test-amd64-amd64-livepatch   13 livepatch-run            fail REGR. vs. 168502

Looks like it's more than just the one commit you did put on top of
the original batch. The log has

Mar 29 08:02:17.743419 (XEN) livepatch.c:1578: livepatch: xen_nop: timeout is 30000000ns
Mar 29 08:02:17.743442 (XEN) livepatch.c:1690: livepatch: xen_nop: CPU44 - IPIing the other 55 CPUs
Mar 29 08:02:17.755416 (XEN) livepatch: xen_nop: Applying 1 functions
Mar 29 08:02:17.755436 (XEN) livepatch: xen_nop finished APPLY with rc=0
Mar 29 08:02:17.767371 (XEN) *** DOUBLE FAULT ***
Mar 29 08:02:18.031400 (XEN) *** DOUBLE FAULT ***
Mar 29 08:02:18.031417 (XEN) *** DOUBLE FAULT ***
Mar 29 08:02:18.031427 (XEN) *** DOUBLE FAULT ***
...

Clearly not very helpful that the double fault handler itself hits #DF
again before it can print anything useful. With the first printk()
completing but print_xen_info()'s not showing up I have some trouble
guessing where things might hit that nested #DF ...

Actually, xen_nop fiddles with xen_minor_version(), which print_xen_info()
calls. The comment in xen_nop.c about relying on the function being built
a certain way doesn't look very promising. Another comment referring to
"req" when likely "ret" is meant also doesn't help clarity. Since the
ENDBR is skipped while applying patches, the assumption is clearly
violated. Aiui this will lead to the RET being overwritten with NOP. And
this issue clearly exists only in the stable trees, as the function
wouldn't have ENDBR in staging/master.

Jan


