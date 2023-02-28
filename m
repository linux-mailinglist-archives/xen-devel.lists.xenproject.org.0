Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 43F616A5D0F
	for <lists+xen-devel@lfdr.de>; Tue, 28 Feb 2023 17:26:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.503540.775821 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pX2ne-0007U8-1T; Tue, 28 Feb 2023 16:25:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 503540.775821; Tue, 28 Feb 2023 16:25:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pX2nd-0007RS-Tm; Tue, 28 Feb 2023 16:25:57 +0000
Received: by outflank-mailman (input) for mailman id 503540;
 Tue, 28 Feb 2023 16:25:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=rjMb=6Y=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pX2nc-0007RM-Vd
 for xen-devel@lists.xenproject.org; Tue, 28 Feb 2023 16:25:56 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0628.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::628])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 937780c3-b784-11ed-9695-2f268f93b82a;
 Tue, 28 Feb 2023 17:25:56 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PAXPR04MB8927.eurprd04.prod.outlook.com (2603:10a6:102:20e::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.30; Tue, 28 Feb
 2023 16:25:53 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%7]) with mapi id 15.20.6134.030; Tue, 28 Feb 2023
 16:25:53 +0000
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
X-Inumbo-ID: 937780c3-b784-11ed-9695-2f268f93b82a
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bClawmdVHGwkLWm+8UekalbOv3obd/yzV7b2YzPIS43pheSASiMMZz9JAd/GKQep5hXbCyfdPnrjKYYo0L/vxazVeniYca3ULgu94MRCKZpFvqI9euxzt/9THRdIn8wQdSRxiNBA9HBtaI58lYdtig8Il1NrxPQhbuVMHdyRCrPHD8aF/5LwBGAVhehrPa6whRgOQc2r+KNkUTLhKvrgpFN6MyHlKMi8C7ODKSxYmBLJSktZLnWFWa04XpZ1PicOCyfkvT+Xw4FohBu+9n0/NKNA0o+3DBIMAhypbE9XpngApFvAUxCO9G+Fat6O+HIZO9mSkk/GfyNViMZ8mqAk9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BDTIOXCI/dacGdNJR6CsclTQLDidmYA3cnfhSAcWVcM=;
 b=B7X/zTeYgogPKA4Zl4dFZZ4J+PL8dYWM+RZdc/tOQAzy92qc9xJ1cUiXyX0OkjuqJTbK0SlTYcn6/NIPGsA3XtvNngF/y6jjUr6frnRThEuATioUwXfJX1hEnkbD/adXtfsNvhW3vflp9Q//7twMwXbDcx2uqBo9LNi5cpJ2iufZxYmpSoq8LEl3djEus7MlNTE++LvQgDKFmm7EaeScBzMB7I3nowgbKr00GMCoodu8WBdcu1Ti2XBWvvkDVTfHFP200ek1mPntz2xkLcR9OoOdRg9ICKqz4pZNg8jCEbQzVRsHQ97pOTcu2OMkwZuNsqu5Deq30Y6e3tEs1Cx5tA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BDTIOXCI/dacGdNJR6CsclTQLDidmYA3cnfhSAcWVcM=;
 b=fZJg2gXt7JAcec6RLgDuNgnD5tmgopwreJOqWCujC+3em3S5Gx4rCjdFvOti60ZHUJha1IhwwER2amgr6ZVAsz1VZv77F6Njy09hlm1kxa6CLeTfCCQBM4q76tFTNX+DUmzf1tkCI+E7QO1gifvqIDYCnIIar1Fq1ObdsOvAsh6ud5FOVOZ7CvzcSfEXuC+B6wTU2RPJP8QTIUqW4vxQyynLEVvNcCutOJfHo64/kjZar2vHzaR504Yz60ipzokUng1TP8JopFiRh9LQs/2SzI2t+UOReoDenqM3h79zVDH6f5eXbhNwnwlY5w5IAJTVYOuyr9ntTOUyH9Xl1eAp8A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <8889daf4-cb6d-7a2d-1290-f89d5560408a@suse.com>
Date: Tue, 28 Feb 2023 17:25:51 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [RFC PATCH 09/10] [RFC only] xen: iommu: remove last
 pcidevs_lock() calls in iommu
Content-Language: en-US
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Cc: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>,
 Kevin Tian <kevin.tian@intel.com>, Paul Durrant <paul@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20220831141040.13231-1-volodymyr_babchuk@epam.com>
 <20220831141040.13231-10-volodymyr_babchuk@epam.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220831141040.13231-10-volodymyr_babchuk@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0175.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a0::12) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PAXPR04MB8927:EE_
X-MS-Office365-Filtering-Correlation-Id: 36c64598-9dc4-482f-36b8-08db19a8766c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	r9THzQsd1Y9hl4Fmwu3Ia/x15eBLMbHWjOP7g/Nl7h+j/b/Sga8pArhAXCGt4hXWdgrGf2otVCmW4qGRutd/lZL65Gh6GEL0j8WnbDOxwfnSgjV01592yqKUA+SBRNwf9rdWaVwUospbzIvibslbYzl2jfG2F3gsxv32m2pJiy973b8VSgzw2dtNWOuqELuQbiJyhqlpNlzO3Z+e5Y+ZWdLtcWcBGqzcSvI/D5MnmcjDY7nlxRht6+GOWleFvpOzo1uusjT9ZrWfl72by00NAmyEHoJxaWHoQPs5dNfxtJ9nWovC6MJXuKkQQnJItTqtz81F3O3cx73wUlb605K4m+MBBvoHl35p35IqwTVdb2k9b8cQoZIAJNSvZIjEj3PDJLlZWXMt5kwr15PzMjTpobUJtP4CE8Lv7+C4T/c2Q527qehYDlOqn2QmaWYP92owVmOGVuE8prUXhXsMDV7YN2/ARI//4goIzrZ087mJd6OYVeQ9CBVsRfPWE0lLTz7pw9ZQSgLxhc/eV33FGClgh9YUWuZJvcBXyl78mDnyYxrsBpk+P21c5VvcmKt/lqbCL/5nHgSPoH0Aws2wprLmn9xMx7+sLwx1dwgae5WQfB3bNpI4SBXZPkVf4monCY+Mbn+Ez3wltnj0QlqzmiGW+FxP3zYHI1qqW5Qno9xxBIDV8w3lHtYfgoJanGcjhNw04tCOywjh1m6AFCLbOO6hIFauLaV2BLblYXJjS4CgRWY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(39860400002)(346002)(366004)(396003)(136003)(376002)(451199018)(2906002)(6486002)(5660300002)(54906003)(31686004)(6506007)(6512007)(53546011)(186003)(26005)(36756003)(2616005)(66946007)(4326008)(6916009)(66556008)(86362001)(66476007)(8676002)(31696002)(316002)(478600001)(4744005)(83380400001)(38100700002)(41300700001)(8936002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?K0V1U2tWOS9VWmJhNjc5SVlhYm5XMWQxUEIwREtlOHMwaWJvaEQrZUQwbkdV?=
 =?utf-8?B?Rm5NdTEyRmVuOGdud1hVNTdVWk1XMTBYVUtzMjZhdUVZd29MaFdrQ0oraEQ2?=
 =?utf-8?B?Qkg5YVNXaThJTTZpbnVYV3FpeGVOZWRoYStUcnhRNk5yZXBnSzUvWGF2d1hJ?=
 =?utf-8?B?Y1NuUFNLMnY0UG9BTXJWQi82L0ZoRWJmNzhRWEVyajNvTHZiM0l3VFM1OXJz?=
 =?utf-8?B?T3VsL0pCaEJ2TlR2dU43MDdCcXhNOWthNks4eG44eUdPOUQzVUxRbzRFWWFP?=
 =?utf-8?B?ZlN5M1laUnhXVzdLaW9WOW5aZ1lxYXJ0UnowVGR3NVkxaDNFMlFrN2d2bFpI?=
 =?utf-8?B?SlA4TG03RnJJd0V6emNpYUJ4Z0xPdDVLUk5rYmJNNU5DUmNMSlhDWkRuUnJG?=
 =?utf-8?B?N2JZL1hsYXhBeXVrUlhPblNTSUZvN3BsektKTG5UZ0ZtRkhqSXNabVovZ29o?=
 =?utf-8?B?VWZnNm81blYyVFV6bFVkODJER0l5dEkxNjlWa3F2bWEvMTNKS1JWc0tBR0JP?=
 =?utf-8?B?TVc4czcxV1pZS2hQTURvVmNoWDYrQmhqZTNBRm5oTzdVVGN4QkxVSHJZNlJ4?=
 =?utf-8?B?Tmc5Mi84SmtubzJzaGZvRktEVGxmRlRyaDlHWlF4OUZFYm5BZjRQM3N1a08w?=
 =?utf-8?B?a1lQR0h6RXpRTkRGbldvUnNyeUFFZXp4M3U4eUVtMWVqdHRRemFWRFVSMXNM?=
 =?utf-8?B?dWdzMC91MzVDbFZCZ3RWbDBOdi81OWVOMS9EUkFGdWNkc2tFckEyRVNBVm9P?=
 =?utf-8?B?U1dva2ptV0NLTnpXQ3RlNGord2hqelREOVlROTRIOUNJZEIwYTFQMUg3UEkz?=
 =?utf-8?B?WEcybDh0dFVwS1M0RWxCTnh5NHRWNS90R2JkRjZPZnBxbWlZendDV0IyU3ox?=
 =?utf-8?B?RVFhM1pKbDJ4Nk1YV1RIWjQwdGFRa1dMZGlHUDBCNTNYdUlOaUNIVUhobEtt?=
 =?utf-8?B?bHJiamlTZ1B0aDF3UFY4bEowSGF5b3prVjVtTGMzSkYwelpmVVZHQUxrTnQv?=
 =?utf-8?B?NFp3ZWdsRHFnR0UyZHM5WmdrVFhhc215VHZ0ZUM2U2VkeGpVOHVDSmg0Zm1N?=
 =?utf-8?B?dHRNWjUrbGdDdXlNTStreUJINkwyaHQ1QSt6d1ZSRytIMk92UXpGYmtNcyts?=
 =?utf-8?B?cWE4V21reDMxS3UvSkpWaFRJeitrMkRqZVZZOExWQWNCcU14TEVZWkp2VThW?=
 =?utf-8?B?TVJLQWZGSXNDWTl5MHFwTUlJNWNPOFd1Qkt6dEc1VThEajdPYmN4dEUvdXZ6?=
 =?utf-8?B?Q3RvcWJjM3NWTnUvOHMwYkJaMGpsaUdoNEtkRXN3ZDFuZkwxU3k4VVVhRE9O?=
 =?utf-8?B?N3NsU0FrUEtUZ29tRzkwMHIzRnRvSDZldDhPd3h6aG1uWUN4WjRIQUMwUENM?=
 =?utf-8?B?WnBJdkFCa0xFU2FqVnptZ3pJSzYwN0FjazQzbkkxL2IyZzBEZHNDUTh3aHFV?=
 =?utf-8?B?ZTVuVEF1Q2lGNHYxbk41Vm5IcENPSTlCNUxHYndidGovdUZRTUliV3NCOGFo?=
 =?utf-8?B?am5Na3Yyejh3WEpXckZoQ0k5c1N6ZStsMGMvVVJwWlYxdVJKODlLWlA4V0V4?=
 =?utf-8?B?ejQ1S093VXhQZlFYOGRWSlpPbTFkYzByaXNrbTZwVjE4RDZ0T2hMVjY3dEFy?=
 =?utf-8?B?cDhOSWhIM0pURHJ5c21SZTVyUjVPYWpVY2ZLSWVyVldNOW1aN05GRmVFaDE4?=
 =?utf-8?B?WUFLSjBzYngrZTBBR3ZVbHdrUU45dU95NlpQTDBSMkgvM1FhRHBFKzRxZmVi?=
 =?utf-8?B?b1NhWlBmVHNITmZTdTBUN1ZWK1d2Rm5SdlpGR1JmS3NUODJPdHhNdkZyQ2tp?=
 =?utf-8?B?UlhaUDNDRGx3YzBSbURBVU12TlA4MkprMzFqZTdVZDhObXF5eGpSTHJ0WFg0?=
 =?utf-8?B?NVpLVTlsZUhOOWpKNUpxZWtLZGJrT3ZDUThYS2ZUUFdDTi91SHkyckI0OFUz?=
 =?utf-8?B?TnVCSzNjaFpjR2JCeERDMTFiTDRGYTBOTTZqK21wS2F5N0dMd2tudWxaTXk3?=
 =?utf-8?B?TTE0RkltNWp4RVJUTGR1aUtCYzY4UWYxMjRlSWRTaWd5cVRCUGpjVjlyd0Fq?=
 =?utf-8?B?azhOZEt4anlOb1JQTk1uRitIV0NvY3R5M01PN1BDVElvdEYwOTZVRFRyVlFE?=
 =?utf-8?Q?eLxiAz6vXTG+N1fM3C1pzowsj?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 36c64598-9dc4-482f-36b8-08db19a8766c
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2023 16:25:53.6623
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qnpcB9zh8/ipydRFSeWtDb8hkL+b9arfKvuiyThqM9v3hTJk505plIW1aThINlAeV81RPBUeCpGj67IJy6g1xg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8927

On 31.08.2022 16:11, Volodymyr Babchuk wrote:
> There are number of cases where pcidevs_lock() is used to protect
> something that is not related to PCI devices per se.
> 
> Probably pcidev_lock in these places should be replaced with some
> other lock.
> 
> This patch is not intended to be merged and is present only to discuss
> this use of pcidevs_lock()

For all such instances it needs to be understood what (if anything) is
being protected and how the same guarding can be achieved in the new
model. Since I'm afraid that's simply stating the obvious, I guess I
don't really understand what needs discussing here.

Jan

