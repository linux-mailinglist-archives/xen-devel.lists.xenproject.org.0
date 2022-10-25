Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 334D660C3B7
	for <lists+xen-devel@lfdr.de>; Tue, 25 Oct 2022 08:19:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.429570.680605 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1onDGi-0001JJ-KK; Tue, 25 Oct 2022 06:18:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 429570.680605; Tue, 25 Oct 2022 06:18:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1onDGi-0001Gh-Gx; Tue, 25 Oct 2022 06:18:32 +0000
Received: by outflank-mailman (input) for mailman id 429570;
 Tue, 25 Oct 2022 06:18:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xqZt=22=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1onDGg-0001Gb-PI
 for xen-devel@lists.xenproject.org; Tue, 25 Oct 2022 06:18:30 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2065.outbound.protection.outlook.com [40.107.22.65])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d791e3fa-542c-11ed-91b5-6bf2151ebd3b;
 Tue, 25 Oct 2022 08:18:29 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM7PR04MB6856.eurprd04.prod.outlook.com (2603:10a6:20b:108::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.21; Tue, 25 Oct
 2022 06:18:27 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5746.021; Tue, 25 Oct 2022
 06:18:27 +0000
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
X-Inumbo-ID: d791e3fa-542c-11ed-91b5-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XtM3vD01AT7swj+zuesGnMxf+4HWB0s5DrJwAOnOGcU3/Jh/t6pmzAUqpMFDvx3pXmLYvsQNycFfJlIcPoz6QFDyIjuzuhtnvArOumq46qywDIn2AKmu6reftSH4GVXBW0eJMagG/4xvy4Cc4HrA2QoJk8UGPHTspp2vg4p7Z6tTICcMYjxczDey53BU/ww4BVCpbuB65PD74v12x0cT+PI5G7AuuV8vCtdXer3zYbt3oLsHwpfgFTyVz7LORrvSk8ZIDj8+N3kmpqYk6QZLegFbjwUxoWbPWwrY4p/mRbIY8D8BhyTmm17y8Wdrpp15PNZuVwXeSdSOnX5UMESjQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gFIPPrLjiVLFR4k5kNiKuRCDW0ZWacj8mAmtecTVxgo=;
 b=GtWuPJBqATYdRbYBqyijz/F5dyl0kK6BZ35lTLQ51ieGHfecgse08pq6+YdDlbBkFKpqheTBBbBdbM1l7t7qELws9o9e3g1YigwOaCkjnaFVhPiH9jyor0BwdOqJouy3aPHfu97ywJMIn9rNQqRLCkIkwr4tSTuZJZCRHf9DvFRGUwkJd1g8TkU1kvUOC4NO+Ne0bNsXFLVksjSqC+I9HwoS5cEIVhLOq7dBJJKQ/EIvdBiUpgaqPQiXjFfTflb6QtOCledAO/LuKExbfbSai7jUkcw2BSpLEVBcRFtID+TXz1VmyczX/fgWy64gUkYfBIcfnaszF5fzkJneDMPwxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gFIPPrLjiVLFR4k5kNiKuRCDW0ZWacj8mAmtecTVxgo=;
 b=pmucJeg8kXoof5OtWDA0Xg9J5dj7nCcY08pH3ZvRSP7HHKBiqAiNaDSyt3kVCha+et6yC0Mn3wb4XyIikwxcInrhw5awjOemuw3FCdSMD9Jws06rfQNC6L62La2EsvqfLPkcp9cMc+03x558kDBs2+awZSzjYFo02TT85nt38y9qesv3nN7YYu9vtSiN42gRE+b/8xogFnBGIBYA4v8CDERN4VpK5VZoIK4rhxYurImi8GgBzImFSCfOEleJoern+BEKve/PtnkZoJGzEscx+MZgyhtYYxtfTCwYE86EA7eOe3lacJ1Tme/I11koD9R1qUxGN4X6+3IRQ3mGaTFMzQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <e6f92dcb-d371-b3e0-50f2-595834020bb5@suse.com>
Date: Tue, 25 Oct 2022 08:18:26 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH 06/10] x86/mem-sharing: copy GADDR based shared guest
 areas
To: Tamas K Lengyel <tamas@tklengyel.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <bcab8340-6bfd-8dfc-efe1-564e520b3a06@suse.com>
 <bb3be891-1dad-43db-da69-f20a471ccdb7@suse.com>
 <CABfawhm-YHwO08f_tgN_-X1=2+U4krtaVv3UUoaFm6NJEhzVMA@mail.gmail.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <CABfawhm-YHwO08f_tgN_-X1=2+U4krtaVv3UUoaFm6NJEhzVMA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0093.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a1::13) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM7PR04MB6856:EE_
X-MS-Office365-Filtering-Correlation-Id: e9a07bda-9850-47e3-54fe-08dab650bae1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	iTGZXzKBrkMVkiJR1mCTOzZbNFIFPsfe2Xf/MRYfJnk9SzfnYz83vRG9lpVlluysedgiL7xus12xT45sas6jk8zWXbjefOzCnjOwAr2kMKyqypRXd10AvywD5gTDJMxez9vxc08ydymaSxH8jwERFB1f0yzsknVtedbELsbyxBjdqpdP8dRztPhoOhwXqrxUYxC7OlK6/6HoOK9Jr+ztOMRm1/lR0ZxINUxbzcZGt1xCq99twAgayTXJQ4DlwSYISBsqyDXD+TVlArRvI+ozQ5WVQxNYpH30xz5vL4r4e5myF/uD1FfXXhmCos1Zcj2qZJ/oL+Z5gtWD7hdL4mxBQ2S7vZeYOJGOVbtIJpf5Ko6y7rPXnGGTXN3SSYaPsFjfRqzaq79CFr2JsN3w2w1XngVOHshFddimh1Xwc1psJJxpLNpp+vNteaMsOUHJiYjjIpJP5Vwmc5Kz9efuQUCNDOUlqLHueDA9MEICvJKW57AV9zFS4nG3w2ETQiGFq8NACNQpVFKOk1iCzQv6T3/Z3YryOTm7pv7kbWZQnDzS7Jll2hIcayfCiWYAnihTEXfj6ElPpobUSWUTbf2s6uqEix/wQ6fk2/VauMqywdaZqyBYzkLb096W3aO9idHxVVdcQ/KCuIntDfONN6XTbPn/PqbCU8UHBIVL5sNMkDTeuKYLQbEAKOGGavvtncHuedIFpkg5KekOOPOpkQbSzr5hrBHkzH5qknhMudJjYCpYEEAxOddhz2lPslBWSvY2fu3qiLi4/+I5hI/P49dnhKdLTukTUACIC92HrqVtVNvzVEI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(366004)(346002)(39860400002)(136003)(396003)(376002)(451199015)(31696002)(86362001)(36756003)(31686004)(38100700002)(2906002)(2616005)(478600001)(6506007)(53546011)(6512007)(26005)(186003)(83380400001)(6486002)(54906003)(6916009)(316002)(66946007)(66556008)(66476007)(8676002)(4326008)(41300700001)(8936002)(5660300002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?T3RBMXBHajhDakxtaGJCQUJMM0JZbTZwY2NzWml6cjVORGo5QXNDdDg4dGM1?=
 =?utf-8?B?cFNEbU1jdWxHSmFMYUIzczR3Y2oxWEhuU25xYXYyYVh4b1RDOFJGSnFGOUNi?=
 =?utf-8?B?aFRqd2RPb0lLT05CRU1NWkJZcVQ1Z1BtRi9VbHNmSFE0SnZhVEpPb3BrUWZJ?=
 =?utf-8?B?VEN3RXZVUEdnV2pQcENmdm9hUkZ5VTNVM2pkYnJreHFNUnBISXMrMllXSTU5?=
 =?utf-8?B?aFhqYWQzcEt2SDN1ZzMwRURtNmkvcjlQaDYwRWZJNkhyRUNVNFVwa3hXcEti?=
 =?utf-8?B?ckd6RjJkQk5LSi8vY09aMFNpKzk4RXlVVXI2d1Uwbmw3dlhFaEZ0YnZOak15?=
 =?utf-8?B?QXZBQ29xeVpiVFJkMGpORHN5aGpOd3ZVdXRCOWhEWFhPdWNTT0J0U2prc2Qv?=
 =?utf-8?B?YUNSbDJHVDg3TzA1ZzVKOHdKZUhjbDZJSXRDMWo1MlFQUitwTEw1SzhmL0Zh?=
 =?utf-8?B?MEZvaU9JTEltUE83MUMwU2w5aEY2RGlFTC9pNDVCRnhHWUU3eGRRc2pMSFIr?=
 =?utf-8?B?SGVMVkROdTNyL0lzcE0xaWVYK09FQ0E1dXFURkFETVFnTzdMN01INzF4K0t0?=
 =?utf-8?B?VFdsL1Y2N3RxRVZLM3NUVDBmaDJRc3U0aG5JbWJWTWk2Mm10aEZQRi9Vc0Qv?=
 =?utf-8?B?T0gyOVMwN3lQOXNSN0x3cG84OVgwejNZQTBoajRVakZPcmtDbHZVME1UMFdO?=
 =?utf-8?B?a2dYQkdScUhxbFdQUDhPTU9qTU12V3NJRHRiY2hzY1pvM0h2YlhoanpLakhB?=
 =?utf-8?B?SW0rTzBPR1ZPWW5lSFNJb0M2OW9HQWJOYVNRc3haeXNuWEFITS9DSkI3YzFW?=
 =?utf-8?B?Z3VpRHdkTk5leGtxWUVEZVoyQVgvd3lVazM2endyVXVLd1dSSHRKRFBEMEFz?=
 =?utf-8?B?M29RNmZlQ0JNNFdleDNDYnpnVGhxZkhnUUttb2FCcklwa1VxRGh5THdpLzJ1?=
 =?utf-8?B?N0JTTVNRUFppZHo1Z09pMm5jVmJZZTFENkV1M0ZzY3BBTG9EUzE5MTVJR3pB?=
 =?utf-8?B?WEtxRU5XUUx4VEJRVlhvcTcrNGQ3bkd4UFFGdjVvQUFnL09rZXRBNHlETS9W?=
 =?utf-8?B?aEd0NWp4cDRqNHFqbVAxK2hFNWRZNGJ1dUpsSHBOTXoxNVNiTDVOSmRvNEZE?=
 =?utf-8?B?U0xCWDhyZ2tVM29NNTJISU9RZlplVldPRzh1ODZFY2lXT3BicWNhYmJscTVt?=
 =?utf-8?B?dFFUOHVNaFA4ekdQZ1RaUTNUWjdmR3oyNWpzU2E5MnFSb01ickl1TjdYMWtF?=
 =?utf-8?B?b05JTzZtSzlqSmZCZ1pYZ3l5bXZKK1NOS2RWcnhGSkRyWVVvYzRYMUZXYkdv?=
 =?utf-8?B?NkNHSG5kNVErRUsyWGgxckVrWjVCSml2bnRDdWRudlVnK3hlUGtiOU11WUMy?=
 =?utf-8?B?bWlBWENCZkIyb043ZFNFT3VuOWh5T2FpM2lCV3pVWEtMQ2NhWFF4dDM1VS9l?=
 =?utf-8?B?b3c0bm5RUmZHQmVjM2kvRS83N1dqM05GQy9kZXQrdFA1Qmhhb1kvOEY1NEI0?=
 =?utf-8?B?aUVYYUZPYUZRVDlUUFIzODRZckVEZTA4ajZIN3NkdFdqcVREV01XQ2FUeUJE?=
 =?utf-8?B?cFJRWmpmRlEveE1vTkZBM0t3N09ZTDExWUJCNmZmRDM0UTdPc1YwYTNwS2Ri?=
 =?utf-8?B?TXlISjE2UndhYkpIdDltc01WaEcrMzI2b3U1bjk5bFhVazBKandzOEw1Qy9i?=
 =?utf-8?B?ZlZrNnZrYlpXKzR3TngyazNxVm85R1U3d05TZVY4L2drNHEzWU1TbHZiblBN?=
 =?utf-8?B?THF4azZwVFlzK1JSVzRNUE84VlBQeHBhV1NSRVkybUZPMjBHdForYjF2S3J6?=
 =?utf-8?B?ZldxQUdCQ0R2MjEwTDY4TC9HamI5S0x0MGJwaUdEQWtINU8vbTVVZ3hUajd4?=
 =?utf-8?B?VzJOL0tkS2JLazJja2x1bUw2bWlESStQRU1QekZrcUhMcysvSEkvNkRJQzlQ?=
 =?utf-8?B?cnFUdCtWT1UrR2hIeCs1d2pYQVl5K2dhaUdxRFZQZ1BpY2FRUjV4d2dLaGRG?=
 =?utf-8?B?LzlCc0l0WFJOaWE0RkRnYzFvbWtnNUQ0MHpRVEltQThoaUhwb1VPTjIxTUpJ?=
 =?utf-8?B?eFBOOW1Qeis3Z2dtWnZkaURzTVNqdUoydnRtR2hrY21xazZKSXR5SnM0dEtY?=
 =?utf-8?Q?NO3UGrfpk/D9Y8ijyDj26WJoW?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e9a07bda-9850-47e3-54fe-08dab650bae1
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2022 06:18:27.6721
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bvyA3PqlIwgZ65aHl1m6yJbGgxjTLYKqRtnBf5KQfE46KKjtJ96Gkxu56PXUzd+A2GfrPH6t/EUhNKKc0Fv3Zg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6856

On 25.10.2022 01:04, Tamas K Lengyel wrote:
>> @@ -1987,7 +2056,10 @@ int mem_sharing_fork_reset(struct domain
>>
>>   state:
>>      if ( reset_state )
>> +    {
>>          rc = copy_settings(d, pd);
>> +        /* TBD: What to do here with -ERESTART? */
> 
> Generally speaking the fork reset operation does not support "restarting".
> While in the memory op path the error can be propagated back to the
> toolstack and have it re-issue it, on the monitor reply path that's not
> possible. But the important question is where does the -ERESTART come
> from?

From map_guest_area() when d's hypercall deadlock mutex is busy. I
guess d is fully paused here, but checking for that to avoid the vCPU
pausing in map_guest_area() would end up fragile, I'm afraid.

Speaking of which - for the use of map_guest_area() here I guess it's
wrong for the function to have a local variable named "currd". I didn't
have this use here in mind when writing that function ...

>  What I think would happen here though is that -ERESTART may happen
> during the initial fork op and that can fail, but if it succeeded, then
> during reset it can't happen since everything would be already allocated
> and mapped, the only thing during reset that would be done is the page
> copying.

As per above I don't think there's any dependency on initial fork vs reset
here.

Jan

