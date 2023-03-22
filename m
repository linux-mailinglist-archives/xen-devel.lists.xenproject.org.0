Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2769C6C4CC6
	for <lists+xen-devel@lfdr.de>; Wed, 22 Mar 2023 15:02:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.513479.794532 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pez2y-0005vA-0k; Wed, 22 Mar 2023 14:02:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 513479.794532; Wed, 22 Mar 2023 14:02:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pez2x-0005rn-Tr; Wed, 22 Mar 2023 14:02:35 +0000
Received: by outflank-mailman (input) for mailman id 513479;
 Wed, 22 Mar 2023 14:02:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=SGSf=7O=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pez2w-0005rh-HJ
 for xen-devel@lists.xenproject.org; Wed, 22 Mar 2023 14:02:34 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on0611.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::611])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3034f39e-c8ba-11ed-b464-930f4c7d94ae;
 Wed, 22 Mar 2023 15:02:32 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DBBPR04MB7723.eurprd04.prod.outlook.com (2603:10a6:10:20a::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Wed, 22 Mar
 2023 14:02:30 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%5]) with mapi id 15.20.6178.037; Wed, 22 Mar 2023
 14:02:30 +0000
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
X-Inumbo-ID: 3034f39e-c8ba-11ed-b464-930f4c7d94ae
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EW7nHn/wKgigz9/HmI+niyIg89avRRYXad1lel/Yt8uLjjpnjtCTU3frnNU7kc9uMYEvVZoT5DcJmQZr3BRW4TSzZWbPTpJK+KkcFGzpi34jgzkyY3OhFdSHgLq+rENwZEGRpBOt2GrPnWMuPlF0CU4WdN3AkFMZHDlkGJiEbuZMOiOw5Wmahb3AXczuCGjQq1MC6qDCzi6U76pnFZC6hpxpoViPT9JKw25PvHE2GlAVO87WUyWSBHu8ozOaPW+0lmlEXuf45SDHAHRlQ/rrGMzIbMY+M5C30Ffh5l4o7Xvk/nGv2GD5JWTBbHX6IdU5A4hKyWoOswP8GttBbAVTYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HRC3egg895XQ6epe8HYrwV5FDZq5DbMujKQ7impg4Kk=;
 b=DqndOjmySMUkfjDUZuflOEbqbMIB8kAWC2syr1EmXCgNpUz5XI2QIYWFwdVoYevLeiWOHYeS/ZaOr3gGo5hJaoRDb8wRAAk+Yj/FhQ5P4dRmkRw5E25NxRIGK//iT1Pmgh4bGaThgic5rfZp50cJ/UBdb0wa2aoFNhejQW9i7IVSt1PlIbkqKXXAcDr34akkd6TgjgShgR0AO9TKbl41r/p4++ISt3i3WvrIJxUL1iSKaw2ecwl2wn6yQqYLe6SmW3vqolO2uO23mQqqyIKJCjpQ7kOV3F1UUWZQqGa7NFAxrSkXQIo2WdmarM6Rxa8JfkuTDPQGh9PiPqkYTbzKdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HRC3egg895XQ6epe8HYrwV5FDZq5DbMujKQ7impg4Kk=;
 b=usBba7t5JT2v4iZMFtrivr4xKajuKbZNZ5DxU36GmCqb+fhuyxU45NGkDZ6qaYehI4lrXmP9dIjQpv6pYmWkOMlzYqPgfsiGNmaeLapfairVUWGmCPV3mla4QuAJE1Vi/oo3YycbFTBD8MKLLU06tQJwQvVdBnWN3XHukHh2nPF9YsmZAohgKRdEbD3j/NwDgWQUXpzhdzv4QaphL61uBX+YOPaLFnevoAuA6ukmNAKeGD/u5QpAvEQiA2vXhQe2PEVlc7916oazzPLuAr7uDQ8gjKXou/EFdmaaY39QvC+f99WKEAfMDXHx5eFDExs+RP+OdXTOAt9StQkw2km6/A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <1ddd4fb6-033e-5a94-876d-086af3eb1cf8@suse.com>
Date: Wed, 22 Mar 2023 15:02:28 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v5 5/7] xen/riscv: introduce trap_init()
Content-Language: en-US
To: Julien Grall <julien@xen.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Gianluca Guida <gianluca@rivosinc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>, Oleksii <oleksii.kurochko@gmail.com>,
 xen-devel@lists.xenproject.org
References: <cover.1678976127.git.oleksii.kurochko@gmail.com>
 <91b0284d20f530f2795a119ccb7436ee0b800256.1678976127.git.oleksii.kurochko@gmail.com>
 <5a2c6f35-373a-de3c-1db2-aeeb1b39635f@xen.org>
 <520d64f0b6cd283416aa4fb7b9baa5f83454c4a8.camel@gmail.com>
 <fb5632f9-d749-4396-930e-9f2a601720d8@xen.org>
 <370a6e223d8db5f2d075ca8aba31db198a3aefce.camel@gmail.com>
 <af0d3509-9be4-19d7-8f5d-1c0596a63d15@xen.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <af0d3509-9be4-19d7-8f5d-1c0596a63d15@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0078.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9a::20) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DBBPR04MB7723:EE_
X-MS-Office365-Filtering-Correlation-Id: 3396b380-fd91-42cd-3dce-08db2ade134e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	xc6gZRfwX8ucwcHu+J38RlF4dXYYX1gA49CVghr6BrO62yEgeabTQw1+fct0dayS9YR8z5VKS+cHofDaJ4zg5jiyJjmA1x3lRCSDBkpBNsfioj11lR0Ya/IXdPvGadh2Ae6pB4Mb/O77OfSdqsSmBkugvO5SvewFhdZklUmbWDoOE1H5BXwypu7vuwWGYsYCO49K/FNFPcuC8uSc9O/PyYgKcDBE+LEW1A6YiTQZjGmhSw5BOyYo3tzKoHfeoLU/o1EZzbl1B/wgNObcG+5WD5Lu23cPdGl9Dq4ouaqznz/Y2/3075HZD4rXoJinM2z3aFVtuCPiPVsrgJE4ruKEjt3qeXjisKJ4i1IQofXtXbvVcI5wUVPJaKHueVS2ZG9J7AyIV3+gVmTYG0Xd5pxOMzusblrbewPrB03dBPe36xqVFIQZYd1lqG7hpMFwjVyw6HMi77ww2HmtSnlbdS9Mn3Oh6xDykVG1/gwlmu3oIB6fgMwBpSRUZNJMwZU4VWDADcz+1tN/Xby52YNTgTR/HRvOYCo5QWQeRSmky+y4zIHvNqbCRLQ/GXPhKc+juYXO6gv6Eowjl1nvZYY/LYgAydP7KcFfoBQCDR0ki3ZDFxx1ufR2yuiPjkVvmbvCK2aLYT/h0+s0scnA07muK7XuuamESJ085G6pJ3QOW5GscFjFbfi2Wr6aSApm49OgmSR1nPJ3YeWcuMoBagmG/0eFbF2N24npTgfn+2OpZ8mnmJg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(396003)(366004)(346002)(136003)(39860400002)(376002)(451199018)(2616005)(6512007)(54906003)(86362001)(38100700002)(31696002)(8676002)(36756003)(2906002)(8936002)(4326008)(66556008)(66476007)(66946007)(6916009)(4744005)(41300700001)(5660300002)(6486002)(6506007)(26005)(316002)(53546011)(478600001)(83380400001)(186003)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?amp3dUhEMWQ5YmQvN0IzWlg5OXA2VEtxaHA0VGkweWJuNE1DdkxHdHJ2bnc2?=
 =?utf-8?B?RU4zeitZVUF3SEZqKzhnZjBJeXcrUXFSb1Q2T00zcGRHQmFGbVV0OVErM2s0?=
 =?utf-8?B?VVd1dERUZno2THk2SFkxUUhVc3dMQjhPZlJ5dUlRMzJ5ZTd2em9yS21rRURv?=
 =?utf-8?B?RGhERVBma1pGd09NenRiRlBpVEl6YUZ5R29DK01DbzZxNXhaMjVEWTc2cVFo?=
 =?utf-8?B?dHlpZnV5Z29IdW9YcTFQS1lBcW9IUE9lclNES0V3d05valh1aXlnZ1kwckFv?=
 =?utf-8?B?N004ZC83R1A5dkxtQnppVEdZSkVpQmY0ekdTcUc5M29aN1RFclptam00Zzht?=
 =?utf-8?B?Z3Y4MVVJRkZIWFloQXhuMWJwQ3hQUFZSSmlyQVJYc0o1U0xJY1hESldiOWlt?=
 =?utf-8?B?TTlkVklqS2cvQWhydWJ1RDlKaGFQeGRnajQvS21uZWw4L2w2U2huN3AxbG50?=
 =?utf-8?B?SGFOUlU5S083VWtscFV4TVB3Mkx4TGczTXdxeFpIUC9rbXlHQjZFS3lRb1NW?=
 =?utf-8?B?UWlUTWNEUVkxNzd3R3Yrd1JJWUVuUU55VDZkRUw5Q1BHVndtM0JacG9VZjho?=
 =?utf-8?B?TUhGbWUxRlp5RXhPSVVWZEdnT3VjRGY2bzlQMjB4amlSMndaV0xYSkRWQXcz?=
 =?utf-8?B?U0RkSE1mc1FFbzRqak4zc3l4bVNRWnRKMkpscG0yNUo5cnZFZUtMckVHUWhK?=
 =?utf-8?B?c05NTkxFS3N1T3JScmlnbDB2d2R6VFROMlRWNG8wSElUaHc1ZFBDc3o1NmUw?=
 =?utf-8?B?Q0xPSXFBbUhTY1c1NG1Xa0w2MnRiYlQvRkJKeXcveGFjQmpDMzVsaXJLd2xa?=
 =?utf-8?B?ZFRFaU1wSGxQRGJVN2pKanpCQzdPVWtzdHFpaTJNWi9STmQzbjN1QlJ3NFQw?=
 =?utf-8?B?ZjhhS3JndU1nc0d5UU5KK2VENG4rNm9ZeWV6VzVURDdGMkVxYTJLU20xWnM2?=
 =?utf-8?B?MVRjL3VLbjRDcFIwQnNMeU91c2dhd0VEV05jQnl0UEE5SXA1Z1RSWmY0NlBw?=
 =?utf-8?B?MmMxWnRUVWxLeHJla0lCa0JSeUoyRkhqSmlsN3FHaTdwQlF0azhpSG9VS3g5?=
 =?utf-8?B?bkRsYktjNjdDZWhBaWg1OG1FdEFROU1NajlvMStYTjgzVU1mR3lWVjNKNy80?=
 =?utf-8?B?bGtqOFN6MVdZUGdmYkNsWVdkVVBId3BPbWFGOG51RVFWWnNQY0kvcWxyZzFJ?=
 =?utf-8?B?SytWRlFvODJqMzJMR0NLVWVqUGZEaVJjSFY1WEQ4KzY2ckJvNWRSVGh6UnJ3?=
 =?utf-8?B?aHJnVGFRdm95OXhWQXlHdXg3L3Ara0M0bmpxNnN3bnRGNjNWb3pLSGt2R3BL?=
 =?utf-8?B?YytoVmZoZkQvWGsybUJEVnFFZ0FySHE4UHdFb3lGNFlVNkxRQW8wMVd6N3hi?=
 =?utf-8?B?dDdWVlIrS283dWVEYXl4V2tqckhrOHJ1dHBiZWVuV09mZytxSlVsdTZhcTFx?=
 =?utf-8?B?bksrS2NhVC95cm1IV28vWEhXcTNVMjlqRDF5U3NMRVIwSUZLOWFOTXQvUmxW?=
 =?utf-8?B?azZ0UmpRQ0Z5cllIRHdYVlJNbGlzcDlKRHlRZmNGSjBrdmsxTExoK2h1VlRo?=
 =?utf-8?B?M2dPc242UUY4T2Ztc0M5dm5SOUhJcnAwaVdtUWNBWTNBSHBnTXNyaEhMbjBx?=
 =?utf-8?B?eFpNTnBuVzgvSjhja2xuSnBZb2ZZSFJBUXUzQ0pGb0lZVTlxNW5YMjR5clIv?=
 =?utf-8?B?SUJhbkJZK2hrSTdRZDN0VGwyTXJFQkcxOUdpZHp3aThJN2JsK1RjcURwenJ2?=
 =?utf-8?B?bXpsaFFDTnU1MzJKamtpWGxnWlVxQTBuM2tLWllvMmVWWjhxM1dnc2RXbFVV?=
 =?utf-8?B?dzFTQzgwWjY1OTNLUHQ2REk0YUd1RTVyRTFXYkVTZEd2S1N4TTZOdThxdGpj?=
 =?utf-8?B?bnhTU0Y4N3pxYXpZMmYzN3ZEYUczUmNGQzFtTWJiczE3NnpCckVYbnBvaXlL?=
 =?utf-8?B?ZFhEMG5UT1M3Z25zT3dSMUk2UitjOElFdTJRZkNYenZ6V0hjUU5YejVLWmMw?=
 =?utf-8?B?NXF6SVl0aGxJK2M3SDd3UWJyZEJYTGU0ZkRmT3h1dUhEMjVHalJOQTdtUEJr?=
 =?utf-8?B?R1ZORVd1eTh3WG1XUkI5Vk1vaGF2THBrTGdzSW44eHIxOEVPUXNKYnA5VW1h?=
 =?utf-8?Q?eZZtx/OfTQrZ0+bhVvpR4xEsT?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3396b380-fd91-42cd-3dce-08db2ade134e
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2023 14:02:29.9151
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wYJLEJ+5H13DEgtFXd9OHgZGzECgC3nbb6EaZI+2Ucv4pXmkOASFw3yJIEtfWWeV3qvJDAQjnIDjGQLAKfWV/A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7723

On 22.03.2023 14:51, Julien Grall wrote:
> I am a bit puzzled with what you wrote. From my understanding, with 
> -noPIE, the compiler would be free to use absolute address rather than 
> pc-relative one. Do you have any pointer to documentation that would 
> back your reasoning?

It might for RV32 (using lui), but for 64-bit the ISA simply doesn't
have any halfway efficient means to load addresses in other than a
PC-relative manner [1]. -nopie really suppresses the compiler emitting
code going through .got (which then indeed would mean using absolute
addresses). I understand that at least for now RV32 isn't really of
interest; if it were, I guess the concern would be more significant.

Jan

[1] There aren't even suitable relocations to express such in ELF,
because you'd need to have a way to get at the top 32 bits of an
address. The only alternative would be .got-like indirection without
actually using .got.

