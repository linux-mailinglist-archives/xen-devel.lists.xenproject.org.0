Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 43C1A50668C
	for <lists+xen-devel@lfdr.de>; Tue, 19 Apr 2022 10:10:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.307843.523161 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ngiw7-0005tR-QI; Tue, 19 Apr 2022 08:10:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 307843.523161; Tue, 19 Apr 2022 08:10:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ngiw7-0005rD-NK; Tue, 19 Apr 2022 08:10:11 +0000
Received: by outflank-mailman (input) for mailman id 307843;
 Tue, 19 Apr 2022 08:10:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TFaJ=U5=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ngiw6-0005r7-E4
 for xen-devel@lists.xenproject.org; Tue, 19 Apr 2022 08:10:10 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 211104f4-bfb8-11ec-8fbe-03012f2f19d4;
 Tue, 19 Apr 2022 10:10:09 +0200 (CEST)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2055.outbound.protection.outlook.com [104.47.12.55]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-35-Zd7JhvgcO3SCehH2y2uUBg-1; Tue, 19 Apr 2022 10:10:07 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by PAXPR04MB8352.eurprd04.prod.outlook.com (2603:10a6:102:1cd::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.20; Tue, 19 Apr
 2022 08:10:06 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f%7]) with mapi id 15.20.5186.013; Tue, 19 Apr 2022
 08:10:06 +0000
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
X-Inumbo-ID: 211104f4-bfb8-11ec-8fbe-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1650355809;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zF/OE+Y3rr6iM/XxMP4ir7Vp9xquV5aHacM2tYu/eqM=;
	b=MkIp6XwWdiHyYm+BSVqem55X0pzTA1dwFcND6A+7pXHgTfT2sjqya6Q1utHD0XmLlhXae3
	Z15NfLDaIYAB3EAzQgAMROBlYNCL5mRvPij20cQzAJdeUHqB5VXB9ju37Lff3wJaOHkreL
	sCkq7gXPP5HsE7+UDPdYVxNPcl3pcV8=
X-MC-Unique: Zd7JhvgcO3SCehH2y2uUBg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XfR9ymNg9FNK3nwo8AqJsIWHPZ17m+4Uppb3PrLNAr4BnemEhfT4c15nYfst83Y3bsMaLejuPE4n7psIIyPbV7YwjZ5+9rGtQPFW4TUBDUS9bJJhH5sFtLOkoag7q+6DZCEwFWsFMcjUVQnFfZJtDP/uH/oXEKQ8WHffjWbvOOorCIcw/qjcWA0oKIVM+J71vcBTUX89gCQEeeqkIhno+uE6y7Q8VrLD69ngI7ICXAkE276gGKoaFr8vyzJCKxPB+ceFWLJNF1dBwtegz02TfkrpjK3UvtYxU+z12txxfgQVv5M+mXU6uUZfS3X9T5/iCxaHuQjUC6PBX7vh14ZFRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zF/OE+Y3rr6iM/XxMP4ir7Vp9xquV5aHacM2tYu/eqM=;
 b=JWn3EghmrPk0FtURO7e1Cq8tpRwnruxCnIOLQyxVzSSH/Wum5sDf8gPjM2Dc1tRsWF1tEwxmhfPs73TfivW5bKiQmOHEFGXYsixNof3hrP+01ZJ4Epb7xYhbgookwKXu3FxLZmir8+Dti9JfZCQhN1bONq1gV8af89SOE+l1Qv5+OxMvwNwG9VYr8Si+Lmdktd+p93HlxooxEMigFn39QbzNjMi/uE3LyPC3eUd+iVL7PPtuYo1nPhhbnQVgytXZcQ8NIvy17xZl+lqb03UUWk28NrxqCLenIVGtuDA3KMZZyNETig5i2AMo0M3JiqGz+8ZI0XaA0D9RHtY2ukUNZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <1d0d3161-525c-cb47-34b5-b5202692cbcb@suse.com>
Date: Tue, 19 Apr 2022 10:10:07 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v1 02/13] xen/arm: introduce a special domain DOMID_SHARED
Content-Language: en-US
To: Penny Zheng <Penny.Zheng@arm.com>
Cc: nd <nd@arm.com>, Penny Zheng <penzhe01@a011292.shanghai.arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Chen <Wei.Chen@arm.com>
References: <20220311061123.1883189-1-Penny.Zheng@arm.com>
 <20220311061123.1883189-3-Penny.Zheng@arm.com>
 <eefa9cf2-a04c-ba8d-74cb-0d2aaa35badb@suse.com>
 <DU2PR08MB7325265A2356A09AC1DA5FDDF7EE9@DU2PR08MB7325.eurprd08.prod.outlook.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <DU2PR08MB7325265A2356A09AC1DA5FDDF7EE9@DU2PR08MB7325.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0759.eurprd06.prod.outlook.com
 (2603:10a6:20b:484::13) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1121f48a-58ee-484d-5864-08da21dc032c
X-MS-TrafficTypeDiagnostic: PAXPR04MB8352:EE_
X-Microsoft-Antispam-PRVS:
	<PAXPR04MB835279C12D478353BF084D00B3F29@PAXPR04MB8352.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	24e+Uo6MDmemIyV8KRGUX1Cw8wQwpiDYSHah4ZP53H9NLmy5gU9P6wkPYa67Ht3AqKOXcxHjcEBXb5uE10a/VWVnfpyDcIaro1tbmuZRKTF4wHjR7y4+vr7XOrAB690xxwKHV6LSQwpQRnuyClnRcl07X3l62tdIe7e0K9ANk0ggAk2lCffauA6JnoNOhWIONtOeABsE+Ea0hjUzh1vWes+pFHsSEI16ixwNAHpZD1FZIh/C7PHI03Za7p3MPXt2cIbYdueX9rRQwkk06B7s3Nol8E9FNB5VjLbXEjMoCHAd7bf2Rnf3AZLvBw473fhAee8l/2NMpymf3/ZedqaFZaYGR0v9/ZDOzDYIDDMGgHEdfVjjApCVlzsrF7jKrmMEKy/RayOVKL/kf8w9E+9/dESgnQvhQ0Oepf9LmXy/u5AR4OAXqDUpTfPnJynkKQByRxRXJTvLwdvv4XDkDWAHVHLM7TK8gg2l/nylSAej4Y+RjGOR8mDEIe9azpJ+dfskYremnOPW4u5Dc/nYbhg2G9Rd1ySFqXnatv4N+dpt8KKgir0uOrJXJLlYJ5sfeDun3dWn2PtoApJ9ewwksWPpP+35vYulOZLEqUstGhLf5jQOeGmPkroQKq1Ct9zpWAAgwmt6lYq7BBs4vTrvR1mY1MY2VD7a2f6po9tiAOO5teM+cVzmyM+A51yFPyWt5Gox+rt0epcNlDEYe9ADIYEQSKHJMW4lTt5VIQbN247R8ozAl+ALDA2ioodVNIGQszsf
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(4326008)(508600001)(2616005)(5660300002)(8676002)(66476007)(66556008)(7416002)(6916009)(54906003)(2906002)(53546011)(6512007)(31686004)(8936002)(6506007)(36756003)(31696002)(66946007)(86362001)(6486002)(38100700002)(316002)(26005)(186003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?U1U2ZTBBS3NQMHVrTFhLWTZYdnFFVUc2Y3FRZFpEU3FtOTc0bFViUm5BeG1n?=
 =?utf-8?B?QndvZ3ZRTnBsNmU5eDZsa0xsVVU5Rk9MYi9RNEx6TzZJd0FmVW9adEtaM2sw?=
 =?utf-8?B?THhjUU0wcjBhbUlZY3BUOWdjclJUT0ZQZ05UUFRDWmhIQW5NaHNaZWVvZmsx?=
 =?utf-8?B?UENNRXc3U1hxcmRIU0JiQ2RqSy9pRklJK3FmMGFHWWdNbGdsK1RidnorL2Vw?=
 =?utf-8?B?TEk2SlVHUzJjRy9ETG8ya1cvUFVSQWZJdnhNRkpGN0E2Uk5pVm85SUdCWlRU?=
 =?utf-8?B?VDJqNWdTVjNSZTBJV3hHZWlwVDhuQm9QN1VrMnRGczdBWUpDQWpnSGs5R2RV?=
 =?utf-8?B?RUxnZFZIaDdlaXViVmRXamlXUFl6UFVON2I3MnY5bDBqQ1NqT1FQQ0h1d2No?=
 =?utf-8?B?ODByblRvRitwcmdkSlRQc0VDVFB2dGhiMXVyaG1iTG5PNUxBa2J1aHAvNnVG?=
 =?utf-8?B?L2EzcW11OURFV2VKWmVvQ2h5WVB2ckt2aWM3SEJZb3pPQlJ1NHZmSnltWDhq?=
 =?utf-8?B?c0dIZExEWHNMUEJaV0k4UEpaaDhCNU9peGpscFBmL0pRUFUzcUtWejYzM3hB?=
 =?utf-8?B?V0VjdUkxbGVjeVNBWG43MURaVkk2Z0lkdnVUN3o1VGFjRFJEUUM1djBrZEZD?=
 =?utf-8?B?R3ZZYXl2azBhMkhtTHVQYjU5RXBZZENmSjJyNkJLQ0NRUmlhWk1hOTVvYkFY?=
 =?utf-8?B?eUtXMk9hMTQ5OE9zaDV0aVkyWi81TVd3bm1FeVBTZ0k3NlhmTUpPOSs5dlQ1?=
 =?utf-8?B?ZkRBUHplSjdnSGlPb3pEYyt0Szc4aEREWUZ6THNkT3E1cnQ4UkRyczhjdGc5?=
 =?utf-8?B?NWIzUEg2ZThWa09qZ3ViY25QNHFrbTIxVVo2b2tDTGVwOVZ3Zm5BTzkrdUFr?=
 =?utf-8?B?VVF2R0cwbld2RVYxTVNsWXhYa21wNzVZUHNLZ2VyVzBSZXUweVlaY01ENjB6?=
 =?utf-8?B?VnQ2TUJWdk5hMmMrdDhVa1B6VTdKSXh6MzAvNGEwc3NKT0ZDekY3MnJQNUZo?=
 =?utf-8?B?anNCNE56anBvWTlGd0owODlmRGYrQ1M5S09oWmZ2eDhXM0c5Q04wMzJrdkZ4?=
 =?utf-8?B?Qjgwa0FVaVNZYk1pV0tJVElRMVNOQUNKUlRMeWpWbkIweFpHY2cvblNqdkZW?=
 =?utf-8?B?SHRCYU5uT0dOdHZoTFRnOUpnZ243WFBBc2pkSXgzNWhnditLbVFFaVN4Mzdv?=
 =?utf-8?B?Q09vMFp4cnQ2VWhBVTUvQmZ4TUt2WFRoZWN2ald4d2Uybzk0bFJZVS9DZTl5?=
 =?utf-8?B?YjJ6Y3BkNnZ6OHdVb1hKbkNVTkh2ZWxQNlZ1cGFSa2gxTlZYa1kwYjBqSzN2?=
 =?utf-8?B?TlVid3gwdlFGQWlSNDRoZnZuRUhzS3hNUVA1ckFVbmp2b2duK2VoUkNiMVRN?=
 =?utf-8?B?eHZCRDg3ZkFEVUhnSzlXUUpqNXA5VXAzdlRsV2FCSXJ3RkZjRE9Wb1Nka3NW?=
 =?utf-8?B?MmhOQmFoeGFuMFRmQkNJVStMV2hMbDBka3pYaUtGSnBZRjRaM0hZeXJaMnZU?=
 =?utf-8?B?aktqVFI3S3RxV2RaREc0OHpBalZ6L082ckpLSFlVazdkUU93TmFkcnlJRHVu?=
 =?utf-8?B?ZjVlNFBISEpBWDlPMnVzOEFQajVNaTRZSUpBbi9wNklvZURDQ1o4Z3NLWk9m?=
 =?utf-8?B?N01PZGh1Y0pBdFJ6V2Q0SGZUeElSYmVtRTVWY0dyTG5aRmpLME45Q3Iwakp2?=
 =?utf-8?B?NEZQcTVuRWI1STlwQkRLYUFtZG96Nk12N3JoeGF6UjQxdUliWUwwRXNIWVF5?=
 =?utf-8?B?aTg0YlU3aVQ3UEYwTW1ZREFXbjJ1eWRQZ2ZpTDdreXNsc1gvMExYNEhybmtE?=
 =?utf-8?B?NGgvZUp6UmpmTG85aWRvWXNQM25xNkVncS9Qb3ZGVnpHSE02ZEFtK1FvM1Fr?=
 =?utf-8?B?VHFVTFpPUzRNYXhhYlJkcWtNcjZZQ1NGeGtGQ0o1UDFncGwzSk8yZTJwSU5q?=
 =?utf-8?B?Y2RtVkNaTXNOaEtBeWVuK1NBbWlKRWJMVjljVlVKbmJwOHZQcWNLMHcyM0pJ?=
 =?utf-8?B?UXBPSlVaQ1BXRVI1RmRsOXhoM05JL09UN2pRaktqZGhnVWZVVXp2MXMrTEVu?=
 =?utf-8?B?SEtoZk9rd1ZaQ01DQUxGbU9ndXlncTc3aC8wa2J3c0I0NHJEVVpXMFJhTmVk?=
 =?utf-8?B?d3BWbUxlSHowZzA2cDVtZXd0OHRqb3NlZFd3aTVjUytnTy90QTc5VEJMdWhK?=
 =?utf-8?B?VWpWVTBXaWN0bEFqWlBKQjRVUG04SzhJdmVhVk5NejhsdmNoTzIvZGVDc0hE?=
 =?utf-8?B?UzdwcHhNYjRGMHVSSHlnVy9reStCWVNyd3RtMHFVZC9wc21LMk9wS3Bwc1ky?=
 =?utf-8?B?RDVLNThWcDhhM3BrUlN0UnVVbXZPdFkrVUpDNlhBR2daeWZGWXZOdz09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1121f48a-58ee-484d-5864-08da21dc032c
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2022 08:10:05.8761
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Mdj8FDA0qUjkl0d5SmlgDbd50CjmF9P6QPuDi7eVepoa46T6h2uVlekKjh0sx8k88xPJDvQdHtSPnlf2XyWw+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8352

On 15.04.2022 11:52, Penny Zheng wrote:
>> From: Jan Beulich <jbeulich@suse.com>
>> Sent: Friday, March 18, 2022 4:53 PM
>>
>> On 11.03.2022 07:11, Penny Zheng wrote:
>>> --- a/xen/arch/arm/setup.c
>>> +++ b/xen/arch/arm/setup.c
>>> @@ -855,6 +855,20 @@ static bool __init is_dom0less_mode(void)
>>>      return ( !dom0found && domUfound );  }
>>>
>>> +#ifdef CONFIG_STATIC_SHM
>>> +static void __init setup_shared_domain(void) {
>>> +    /*
>>> +     * Initialise our DOMID_SHARED domain.
>>> +     * This domain owns statically shared pages when owner domain is not
>>> +     * explicitly defined.
>>> +     */
>>> +    dom_shared = domain_create(DOMID_SHARED, NULL, CDF_directmap);
>>> +    if ( IS_ERR(dom_shared) )
>>> +        panic("Failed to create d[SHARED]: %ld\n",
>>> +PTR_ERR(dom_shared));
>>
>> I don't think this should be a panic - the system ought to be able to come up
>> fine, just without actually using this domain. After all this is an optional
>> feature which may not actually be used.
>>
>> Also, along the lines of what Stefano has said, this setting up of the domain
>> would also better live next to where the other special domains are set up. And
>> even if it was to remain here, ...
>>
> 
> The reason why I place the setting up here is that DOMID_SHARED needs to map
> pre-configured static shared memory in its p2m table, so it must be set up
> after system P2M initialization(setup_virt_paging()). setup_system_domains()
> is called before system P2M initialization on xen/arch/arm/setup.c, which
> can't meet the requirement.

While possibly moot with the plan to use DomIO (and my hope that you don't
mean to move DomIO's creation), I'd like to point out that there can't be
"too early" setting up of something. If it happens earlier than where you
need it, all you need to do is arrange for the further setup you mean to
add to be invoked separately, whenever it's time to do so.

Jan


