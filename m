Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D7A726F7CC0
	for <lists+xen-devel@lfdr.de>; Fri,  5 May 2023 08:07:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.530222.825686 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puobN-00027D-AG; Fri, 05 May 2023 06:07:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 530222.825686; Fri, 05 May 2023 06:07:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puobN-00025W-5f; Fri, 05 May 2023 06:07:33 +0000
Received: by outflank-mailman (input) for mailman id 530222;
 Fri, 05 May 2023 06:07:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9G22=A2=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1puobL-00025Q-Lp
 for xen-devel@lists.xenproject.org; Fri, 05 May 2023 06:07:31 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on0629.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::629])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1e464c6e-eb0b-11ed-b226-6b7b168915f2;
 Fri, 05 May 2023 08:07:30 +0200 (CEST)
Received: from AM6PR04MB6551.eurprd04.prod.outlook.com (2603:10a6:20b:fa::20)
 by AM9PR04MB8145.eurprd04.prod.outlook.com (2603:10a6:20b:3e1::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.27; Fri, 5 May
 2023 06:07:27 +0000
Received: from AM6PR04MB6551.eurprd04.prod.outlook.com
 ([fe80::768c:6df7:9afb:acd7]) by AM6PR04MB6551.eurprd04.prod.outlook.com
 ([fe80::768c:6df7:9afb:acd7%7]) with mapi id 15.20.6363.027; Fri, 5 May 2023
 06:07:27 +0000
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
X-Inumbo-ID: 1e464c6e-eb0b-11ed-b226-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nlZIW4KjZY1+igXQEsb+pJOXns/C4h8Z03/Mdj5349P2YPB7qSZRWqSwW7yFRqpGkZ6uf+qJ9dPSoGuLmdAbC3ZHxc+eoJYFGi1Usw4tOVOXFat3U7G06/5bJ6CAiSc/Usm8PGuZGo8sqN0nCplhdp/097/D4of8asd6JfyQxcy1KJNVkCmdG54saxEdPWQAQrTYpYpnjtt/6zcpSDiNM8f2LEv3EenTJ+E12TxyoZ20c0u2Xo1pLrX1mnZA+xm/bQ+9DCWoCPVBbpoAs+ilVabYGpYsW/Pqjrudcoy2q9J75QtpGdSyNaC5wjtAC5VzrdF+62f0HPammpgGmpm9aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tyJsGgOmH1j6Xmps5DvUIVknIqyTkutnVPVaG5fiMeI=;
 b=KNpLwbWStd1hv5xFLDrppYxk89biHjKuq2VfmHpsd+nopjGh/CH96iofcsRo6m+Ep0U/0fECOxUFr19gsNiwwCKF4YpRYF0dvQCyIYbi4mdj2+KwgSpAuxEuJaod4+nUIT9lj9ia+iUylAREXNEqxFVFwjHTKt1+Smt+A322M/5t9WiCooJSqq6ERuta3pKlq65cJBXRQkiIcQ/bhSaKQVBAj+tlDCJX77tGk1GlmaGgJ28YMzlWCJiylBE5rDBItClhC2IlbNzzrlc8g4y6zJfsavpq3XPC93xznRVe//mQeXhqXzKit2VDXYRlQ2Jol3AYyHJOr+uBFc0xj2MEqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tyJsGgOmH1j6Xmps5DvUIVknIqyTkutnVPVaG5fiMeI=;
 b=A61dMT9lZX/HF1UlWvEepacjOGioHrroKVR6ClPHaDK3VE0/VZ7hGeRW8qgVdkvM1znTi5l9eEeZro2eeOec+PpNAdB7QCo2smFtUrOi8l8DrGk5IcUUc6d80Wi+Zj6HJYJ1IFhMK+iDQ4BiKXM1FK8qYCdja0lF295xlEH2FfGzzLj8rLCnpoHdxZKe4pRYER5JOTjkw856dS/40SVmVNheWcNANKAozQo1lYoupGohNMfZ6YY5WcPo4iYjXImWhdh9jZuMXG1aOrmaEuYubRmDfRYyHUqaRlcXwV2hrLyQe9ts1d0eV0Ejy6LT60/wgrQKwGGJeSgShSlYwgVWbQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <09655daa-97dc-75bf-4590-5c59af7ab84a@suse.com>
Date: Fri, 5 May 2023 08:07:22 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH] build: shorten macro references
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Bobby Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <95467f2c-09ed-d34f-feef-5cd55c60f628@suse.com>
 <ca02ea8b-d196-8d2c-bd63-b5ab5f379bc7@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <ca02ea8b-d196-8d2c-bd63-b5ab5f379bc7@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR08CA0221.eurprd08.prod.outlook.com
 (2603:10a6:802:15::30) To AM6PR04MB6551.eurprd04.prod.outlook.com
 (2603:10a6:20b:fa::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6PR04MB6551:EE_|AM9PR04MB8145:EE_
X-MS-Office365-Filtering-Correlation-Id: 956105b1-fd0e-4a43-154a-08db4d2f009d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Up2KQWLozvOpPlZToLxGKCLTDymBlIQUwACLAZW0prOS9gpAk3nVe4J2vCBu4VUyZXS2bmesqkGt5bE+uGYdLRJqsElCVul+RVX1VVFbtpmbqKzfp6OSpQJgmOrTSNdiBzs5ohqjfhnuLjRXQTrq+7d45KjpvfgT1p3v0FDceyabLYTKVnzb4Pyzb24wPKDlGnje/vF8P7QYEXbcGGmZA0SuVF1ZZfeaeyBx8Rc4Fwjk7VhACTc6BATDGoT3LRGN3YxOF3KRgWBHeSJyhVgLm2b+b425DYC1uIh4QWSDKmPPJ8J+wwXxiZKrWMfxTonfxRxNYuNem2qLY60XSJ3vhQZrQXefjr7WvRe7FlNvTKtiqyjELah7sNpbHnWcTVRyXzNZZ+1JqI7l9EbJRQnRiN17lSV5mk4+X+iqihBWsZ8BMbsf2YkGx56+pD8Meoc9dJgD5N3gz9XfuihaUz7u0hW5pIsCoBwOEjo65dwv4HuNvV8VcKvfa1Fuif8D/4hNm0HZKqys5Nr4+QNLBdDTvubVQxIFcW60HTLblEGDpiDHLPTs5Scb6UsyO8PRcqjqyjskLxva+ZlDoU6zWhxmOYf1Mr1Fs7qBB/cqUPtWMaLHb4gtHas6jYZKg9wuJ1FQmrn0aXktULqkykTVw7dvSQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB6551.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(39860400002)(136003)(366004)(346002)(376002)(451199021)(31686004)(2616005)(6916009)(4326008)(41300700001)(38100700002)(8936002)(316002)(6506007)(53546011)(478600001)(66476007)(66556008)(66946007)(8676002)(31696002)(6512007)(26005)(6486002)(7416002)(86362001)(5660300002)(186003)(54906003)(2906002)(36756003)(6666004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?c3crSXVJdHUrVDN5cFlzbWhCSGUzNVkwZGRIT0pFSjFWSWUzalYyU2lscUhB?=
 =?utf-8?B?NTV6VFU1Q1puTDh3MldZbUk4RGlXU3lnaHZpa2ZOUnoyMlNDT2ZNSVFJMEdX?=
 =?utf-8?B?bHFpZ1Q0MkE1bmgvR2FmTmo1RlFOc1orTkRLS0tOamliYzZvSTBKQm93Z1Zi?=
 =?utf-8?B?NGsxNzBmd2hyTkluL2NOcjZWTUlLRjdNbVVhNHd3a3p3eWRmRnhIL2tkbi9i?=
 =?utf-8?B?K01jdVBpZEZNVEVjMnBwSGhkd2RQQjd6Tmg0WUhLUzkwUFJmUDgwTVZ5RmpC?=
 =?utf-8?B?bU5WQkRRU0RGMVJsWFNoQ1ovQVlFVkV0ZUhxSG4yWlJWckVwUWZQbU1uQWgw?=
 =?utf-8?B?WGhQajhuVEY0NkNaY1JHNkRrUHBJd1l3blVPS3htV05NaWxVQmtpZWVPYlBz?=
 =?utf-8?B?ckorMWMxOGs5cElrR2NmK2tEemJQZmpHSHNUQjBrVkRrWkdoSnBsdWFmVjZQ?=
 =?utf-8?B?MWhuWmdQK0FUdi9VSWNnQjYxVDhFTGVzWVhMeW1lQmwwUitPTncrWEVtVjJ0?=
 =?utf-8?B?M09palBqUE9haWp3b0lNekRUdTVZbnVad2ZTTTJVbExpcmljcjJrWWxzUHRU?=
 =?utf-8?B?b2R0YXhlQm9BeXkreDBiRjJ3bWwrcFA2cWhZSXdrbi9GOFdRSWYvYUNDY2Ro?=
 =?utf-8?B?L2p6NXlNSHlDN29MK2IyRkt1ZVFDNm4rWURzdEVwMzlyeklJeU5BU2RFWjcw?=
 =?utf-8?B?SmtIR2xIb2toY2lldWN2MUxWTlNVYm55MnBqVVJybkpSYWN2UWdBdUgxUldK?=
 =?utf-8?B?N2E5SmpYQ1hJTlVJeUU3eEswOTNPaFZFMWNRUVA1U2trb05jaENiNjBCV05F?=
 =?utf-8?B?MUZNNjZSYXNYK1dIbEtWMkQ1ZkFYcnBqRXBxdHpKYUVQb2JQQjB1MGRLL1VS?=
 =?utf-8?B?TWxOK1FUVXlnRVZ0SGtJakhzTXJmeTJkMlZtdE9PVkYzQm5kOENGdExhMUoy?=
 =?utf-8?B?M1pNQ3g3T3VQaW43L0p1YjNIekYwekorQlkwM3V6Q0J0c0lTMWhkcE5IOTFy?=
 =?utf-8?B?bHd0Y2NQSmo0S3BtYVJDOUo0MGJNT0p5UlllNUUvbkNtVmJvc0NzQmNucEE0?=
 =?utf-8?B?cGg5cUdpcDFUb2xHd2d3U3g2UjVlaU5naGRZaG13SytaRVQ1UDNrM1NPbFRr?=
 =?utf-8?B?NjN3d1Q3MVRYdkhvYlNXd2EvdGZvbC9Kc3VnUUVyNk55Wkc5MlE2Nk1FNmVt?=
 =?utf-8?B?ZTBxakRJQTZFd1dSZGE1a0xETE9tdnMrUlVTbUgzSllyY3g4WU5TM2ZNc0Uw?=
 =?utf-8?B?Rk5oQTA4TmpQbTd0bHp5cElaRnFxdDU1YWtUZmR2aXN5UHVyVHpVdmdkd0Qv?=
 =?utf-8?B?TW5ublFJSVdZdTBYaDN0b0I2dm9rYkRlMks4MmJwK2l1NDBiUVZaSk9wUDZk?=
 =?utf-8?B?QlhCdTE4UzM3VHZNUm9QMGlJL3pNS1haWVlBcFBJQURqaGp6VWpCcXBDdWhJ?=
 =?utf-8?B?K0FTejRETWxKaUVNWUlUYXFBMERRQk5IbUlYR3BUenAxQkduK3g0cUhUTVZ0?=
 =?utf-8?B?ODlya2xyeG9hTnpzdTNUTXFCT2N0dUw5Rm5zOW1iVUxHbFFQYVhQTTdIc0Rx?=
 =?utf-8?B?RWhCZHM5bVdsODVSSmFvQXZQeTNLNW5QeDkraEhzUDJ1RTVJc2xoWW1vQi9H?=
 =?utf-8?B?UW05amV3RjQvU2lOK2p3NThIdzhZSlV4S3F0bGlXbDhzVHdGZVA1RFFTWTdI?=
 =?utf-8?B?T1J2aGJWRTA2N2JsN1BmVDM4YW5mUXgyZ0FwUlpQUVRqMTA2bGVaTUFQYmRh?=
 =?utf-8?B?QUpaMkV6Skl1T2c1MHAvWmJmQWZRLzVVaUd5S1pSay9CVTNNL0dKRkNNWjd5?=
 =?utf-8?B?NFcwSmVxRjZBR2kxbXZoL1NyOHMyRzFkQ0NjYzdJcmo0ZjFSdC9VdDJLQXhU?=
 =?utf-8?B?YWxwTVVkQkZ2bWNqQ3RBaHFxVXdDYkFrL21Na0E5OTlrMzROdHdpKzZvTzdv?=
 =?utf-8?B?elU0NW1XbmpzWTFYYkYySXJCYmFoamxaeEk1UHpJazk5TXhYODNIeXp6c1ow?=
 =?utf-8?B?V3Y2RGNZSjQ3dVNWTTc1TzFtdlpwL0hXQktEbkRkQXVIRnQ3c0VOSStQcUFG?=
 =?utf-8?B?TUZHMFl1dXJvN2IvWXh0U3BZSmd3dURPMWpGVXFHeWYwTlRuTCswS2pCV1lz?=
 =?utf-8?Q?QvuJn5B/4vKQpVnP2VD2VR+rQ?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 956105b1-fd0e-4a43-154a-08db4d2f009d
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB6551.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2023 06:07:27.5177
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n37W+M8SQhaEEczschCbxg/QHXXCScO20OHlbwkBBqAvDoj8oIAZSq6qsUK/gAyWYX9dSe0q5wBWjhGs/Ra9AA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8145

On 04.05.2023 19:24, Andrew Cooper wrote:
> On 04/05/2023 5:16 pm, Jan Beulich wrote:
>> Presumably by copy-and-paste we've accumulated a number of instances of
>> $(@D)/$(@F), which really is nothing else than $@. The split form only
>> needs using when we want to e.g. insert a leading . at the beginning of
>> the file name portion of the full name.
> 
> From the Kbuild work, we have $(dot-target) now which is marginally more
> legible than $(@D)/.$(@F), and we ought to use it consistently.

Oh, right - let me make yet another patch on top.

>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>, although ...

Thanks.

>> --- a/xen/arch/arm/Makefile
>> +++ b/xen/arch/arm/Makefile
>> @@ -104,9 +104,9 @@ $(TARGET)-syms: $(objtree)/prelink.o $(o
>>  	$(MAKE) $(build)=$(@D) $(@D)/.$(@F).1.o
>>  	$(LD) $(XEN_LDFLAGS) -T $(obj)/xen.lds -N $< $(build_id_linker) \
>>  	    $(@D)/.$(@F).1.o -o $@
>> -	$(NM) -pa --format=sysv $(@D)/$(@F) \
>> +	$(NM) -pa --format=sysv $@ \
>>  		| $(objtree)/tools/symbols --all-symbols --xensyms --sysv --sort \
>> -		>$(@D)/$(@F).map
>> +		>$@.map
> 
> ... any chance we can get a space between > and $ like we do almost
> everywhere else?

Since "almost everywhere else" wasn't quite right for xen/arch/*/Makefile
I was first inclined to say no, but I can easily insert blanks when doing
the $(dot-target) conversion as well, and then it looks like it'll end
up fully consistent (in this one regard).

Jan

