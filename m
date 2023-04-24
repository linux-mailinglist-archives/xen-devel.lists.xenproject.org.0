Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C2B9B6ED177
	for <lists+xen-devel@lfdr.de>; Mon, 24 Apr 2023 17:36:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.525522.816791 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pqyEw-0000su-3m; Mon, 24 Apr 2023 15:36:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 525522.816791; Mon, 24 Apr 2023 15:36:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pqyEw-0000q5-0G; Mon, 24 Apr 2023 15:36:30 +0000
Received: by outflank-mailman (input) for mailman id 525522;
 Mon, 24 Apr 2023 15:36:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0Hh8=AP=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pqyEu-0000px-Mw
 for xen-devel@lists.xenproject.org; Mon, 24 Apr 2023 15:36:28 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2049.outbound.protection.outlook.com [40.107.7.49])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c70b4d60-e2b5-11ed-b223-6b7b168915f2;
 Mon, 24 Apr 2023 17:36:27 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB8166.eurprd04.prod.outlook.com (2603:10a6:20b:3fa::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.33; Mon, 24 Apr
 2023 15:35:58 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae%2]) with mapi id 15.20.6319.033; Mon, 24 Apr 2023
 15:35:58 +0000
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
X-Inumbo-ID: c70b4d60-e2b5-11ed-b223-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Sl+4jFKU0OunTLJlTcOcqp35j9UYF+0ny+R2F2/i5/emxCFQLOZx7NWB5+cvskzpDdqa7LIjp03M1hLdhpLJePEupFmZ6BTQikSqh+gWnyGKNVVvJN4NHQjYxB5rOsA+0m2FMTpmx7cicZo/JRF3tPE2LDWE+gAQiJeoGZJAFJIFl5GhFA+OPseRLMqR1H5H8EuaHZxuvbWnLiCXB80UOGZItEqw8JKwgjm6mWzipSrdnNWJENzmtnmxbm/9NJoTml9LnMyd2pOtlMb6Ko7HL4mBvTZyey8SPHxblQWpMFbNTb7HrS8D1nUGccFgSm08emVS3c8jls3DkZM+TmaabQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8L1MefyeX44jGk7haZjaW+suQtvdSDuBGojG5wUjjN4=;
 b=b73IoAtDmqL2ZtcarKAeZOvrw/rHT6W40RxBpMUA/zSnODKsHyiJlsSP3lorXCei9OeLN9ceuDsx5qZ1E9YfcKSF4B2QMyHb4Ij15FFbTUOdj0dwe1dxolB9lmWYPXZtL5Mf4uY1G+BaaRf2iFCCD3Rip2QwbiCgrAkLg0I6z8PJukyXp8TCQQ+hDpA6Bq9+YA+5pkM+XkTDOytGjIqH11dZa2pjPsQipO98PECy0kkwTHMLHBH9wrTzM6ARwWrslW5gCjhgu9w8XtK4HhwH82yIEkaUBgYI4uaoxGNfLO+EOpx5TfWizMLz8DdFTyA5MNvW/FDnDsHqWp1sOPZCFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8L1MefyeX44jGk7haZjaW+suQtvdSDuBGojG5wUjjN4=;
 b=1mbLhFnvwNMqfYhESgncLjlPmt092IbNfe3SOCUTAPEYF+F/8goka94XFS3P/JrN7155yKy2+fNUxNHD0ibDtDXDSZNSE3FDBdCKKWddS000eXz68w8qF6OM3vJNmSAVYiGObAk9d+vnkDeP65MtaPIpXvV3b1GDYA2AAlj6/bHEkR1lRJyLf6oqX9py3dlnRF4Wb2fdF0E5TVJP47rwNzMuS41pt0BSw46nsExQzNBAThdRW6Pu5ekneERyV5g2CIuBrLFs/SVscdjE30RPkxt41zW4kKSeZ88zi0X6FTdRKXrUWQzt+4r9M+R34zLmwIXZVnvI40RxN4YxTaJXgA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <2c424759-3072-cd07-913d-c45ae6791ce2@suse.com>
Date: Mon, 24 Apr 2023 17:35:57 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v5 2/4] xen/riscv: introduce setup_initial_pages
Content-Language: en-US
To: Oleksii <oleksii.kurochko@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>
Cc: Julien Grall <julien@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Gianluca Guida <gianluca@rivosinc.com>, Connor Davis
 <connojdavis@gmail.com>, xen-devel@lists.xenproject.org
References: <cover.1681918194.git.oleksii.kurochko@gmail.com>
 <5b27693bcdf6d64381314aeef72cfe03dee8d73a.1681918194.git.oleksii.kurochko@gmail.com>
 <67d8574f-2e0d-4eb6-19aa-67fe7645e35a@suse.com>
 <ea2d5cfabb9ada64eb975369779ca430f38e9eec.camel@gmail.com>
 <53257ae8-d306-8c7e-35ff-f3bc3947849b@suse.com>
 <3d440048717892fe5d3ed7fe3255dc8c9f5d38a3.camel@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <3d440048717892fe5d3ed7fe3255dc8c9f5d38a3.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0077.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1f::10) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS8PR04MB8166:EE_
X-MS-Office365-Filtering-Correlation-Id: 467cd46d-3bac-4858-107b-08db44d99a15
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	fz9cABQc1HTyQkIjPD7UuPSeRvLIObNkG/8oGhCZ4AmrGXBiRpd/W52E1vooPLscDHKwR4ZR0hYEEckN7xLTNF1ytBKRXQQrIzvwy3xzdrMfDkn1PJ22SkuSQ0Gkxglm8iYp5KMVMiWhrerVgp/ZvUITkimx6yC+2SxbEa5A3G0qvRlFiB2u0F0nbcG0cn+bZlQd7A356R/j23osucPRcuCaCMCzyQfmQzlPq1JTf4MGasCyjzEMEaW5CyVAvjS4mOyOe2OZhOAAtzYWjZFu/GjW0oNGTiGO5KOjqnKcSx3+fvWRSGbb/uXw4P70vU3qok0ruYYmxt1fxnjVuoAAFGXmdPk3y6A6f/KSdqxpOUhRbudktCm6TZfWPPAoL2sdoFKubqjpzdlZwpXSUAt5oEAcFJWSjPJsCuItlUkjfanNBZU34C/QiknEY9y2fU9WpRJ9IhfRmkPM8d3dQTHkxZ6/oPT8K7ROOmY145fWZa9Z4JEDYIMbuLm9DB9Br5p8uQk4pU4OSKxc/rN7Fr2pu2kB4zPHTWNM/wu6zh4pyxvodn5XB21+88oV3GOOBxStBVpkr/rcQdqlSFOmLo8L+QEfZ3xMjcUYx3+G5DCmjIT6pFB7LhtElEE45qqAXNS4Bv2WPd8b0VkhEvez7isWeQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(136003)(39860400002)(376002)(366004)(346002)(451199021)(53546011)(6506007)(26005)(6512007)(2616005)(36756003)(186003)(38100700002)(66946007)(31696002)(478600001)(86362001)(66556008)(66476007)(31686004)(8936002)(8676002)(54906003)(110136005)(5660300002)(6486002)(41300700001)(2906002)(4326008)(316002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bnk0WFlMWmFoUjBFN0xaUkVyay9IM3FXbU9sSnlmdGIzL1JnaFo2Nklubk1h?=
 =?utf-8?B?aDdETzh0SVhSMXJwK3BlNHlsM25qQStndlR0cVZMQ0p0ZWNwVm1nd2l2V0Q5?=
 =?utf-8?B?SENwOEJTOG0xYzJOMnJNa25VTmJYZmRSWVhPM093QW9mMTBvYXRaYUhrQm5w?=
 =?utf-8?B?ZDh2bDdJZXplZ2RUOXJjL3FsK3NlelNWRklEYWxNd0NlNm0yNHFRV1FoV2pN?=
 =?utf-8?B?MDJGd2ZWcTQwdzM1eW9aNkZsMUEycUFCcjl1MExoZ0o1VHg1M2tOQmcxVzhL?=
 =?utf-8?B?Rm5UQk0vbjBmaldnNDNUV0JvWm9QNnkvUGtKeHpHN2NhN0tKV2hQbnhMSUsz?=
 =?utf-8?B?TWFqWk4xUFlLb1c1M0RPbjdQa25LVU5qQ1I5cEFwQVhVUmgwTW51WG9VanRj?=
 =?utf-8?B?QnEyUGRNWFp0dlNLQ3ZVSjdUMTNJVE1qVlZSdWNGeUIrZUdHMUUyTWFjeGpE?=
 =?utf-8?B?K2RQLytQQThMUENVNGZEWjhZTkk3WHhtaDZDcHM5MkhxS09ma3VpZXFpYnFo?=
 =?utf-8?B?NmRTbi9pM2dxZ2U2OXdTUnFIZ1Z2ejRCSjhyU3VQME1VaWxiK0RlOUdVb3l3?=
 =?utf-8?B?a0NGUXJSc0ZQd0RzTFV5OW5xT0lieXZZVStMMGtMOVhGczduYllYWjU2aFdh?=
 =?utf-8?B?WUh4QWNYUFhFSmdDeUFtUzVKNWMvc1NZbzFFNFBWeTJBS3o4cm4vSThPZkhP?=
 =?utf-8?B?bkhkYjkyU2NUaEd0UUd0QzZrdTBWcFNDdmdDVE9PMVdISkJuUzlQWFNQYTc4?=
 =?utf-8?B?eVRNYjJDY0pKNkNVSGhqbEJoUGZoUnFQNGZFbWNJTCszeFdKc3RHamRTeFJY?=
 =?utf-8?B?RUJra3FUeE1POG9PUE83YTd5ZTNoa1hISkJkS3hYWS9yN0RsMklHSmJrdTNR?=
 =?utf-8?B?bUNoWWlPbml4empsa25NWSt1TWpnemZIOUNtdUV4WEFURnpxVTN4WnZFVXM0?=
 =?utf-8?B?a3YwZElaQ2RxSDhRbHBHNWlUd2FWV0xYUjFOSDRZQUR6L2V4RERRZERYSkw0?=
 =?utf-8?B?Ynpvc0NVT0trNnpiNzF6RmdwcHJpdk1pQ283RFdxbXkxZFBTeVBJcFpkVzNF?=
 =?utf-8?B?UjQySUYzdlppZmcvVElacUhiTkRZWmRzNFdSdEpzZFFKQm9xenFKeG8wUDJj?=
 =?utf-8?B?aS91SVhNaUFqclB5cTljSFg1MEQ2QUJtUHNiSW5FcWgvUlk3bmNDTFlqNjNu?=
 =?utf-8?B?K0JURGdMbWRCSVhORU5QdjJSSUVuTXY4cm5lMjJwWk91MzN1NG5GdGJoa0pt?=
 =?utf-8?B?WVpzaC82aUdIdnhFYWM3ejRwbFBkdGQzbnhyclByeWtESE1iblpYL0hFWWxj?=
 =?utf-8?B?eFcvNHJuOXRUeDdWcFpIOWRYZWdyRU5Rd3pjRFlGaWgyTzg5OVMwN2daeUtN?=
 =?utf-8?B?eG80Z0YvZVJyK0kvdnUwZlMvVkxOQWFhaHBzcE9INEdpOFFpeGliMU9aTTNY?=
 =?utf-8?B?ZkxSaTRabktVUHVjMVBoc1N0bWFGbTBqc3RUbEJaRnMwQkNyNzNZcjB6MTA4?=
 =?utf-8?B?TWZiLzRpU1F6aWplUmM3cVkyRUtYdkNxbUhRWURoYlFOc20zenhqZVdiTDJV?=
 =?utf-8?B?MW43NVU0R3ArTGtKaS96ZmYrajl2b0Ixd1FFN0t0Y1VvRENWd2JhZUhFT0Vt?=
 =?utf-8?B?T3o2bllDWHBvOVdWcCtBN1ZKRjdPbEtvRUhKMFlPSFZIRzc5bWpUTmI3MzJU?=
 =?utf-8?B?UllJVnlJbUVuT0JTeUxLc2lPbDJwbTJpVFZVSndUdnh5N20rUHY5ZkNzS3Rt?=
 =?utf-8?B?RFZmTnF2YUZ1SEFXMWl2R0FzMXpMcUlZZVZCaG9CRFM3NEN5NEhQUWlEaTVN?=
 =?utf-8?B?ZnpYMjlMODZNWTJUanJFRndVTE1sRG1PVDF3UGZmb3FpRWkrQnlrNGluMkpT?=
 =?utf-8?B?b0pWaUFsUkxhT0J0S2lib1pMSnFscFY0Q3BQUkJOOTNtTndZaWJVcW1hZFZy?=
 =?utf-8?B?OE9MODFic2NiUEU1VE1lR3NaRkJsb3FHU0tUVjR4THVBOHZzazBaaFdpa01o?=
 =?utf-8?B?VDhteitpUUFUUkZBSW4vd0RLVHBqckFrVjJlWFFQNGNGd21RSXQ2QW5MaVJu?=
 =?utf-8?B?L2RCTjRzTDEwSjN5bkpjRGp6VUgvakZnRWMyTWh4S2ViQ0d5ODl4T2IwRys0?=
 =?utf-8?Q?H32leA5e4WaMRQ0yl3yK7IkNp?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 467cd46d-3bac-4858-107b-08db44d99a15
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2023 15:35:58.8061
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oYsq+wzhvJeCSOuvOdeyRgeKSO4JvVIE2DdnFqGNBq4M9jplSd3R51CO2CExU7XABB5uwmUsF57DcoaQLzlC8w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8166

On 24.04.2023 17:16, Oleksii wrote:
> On Mon, 2023-04-24 at 12:18 +0200, Jan Beulich wrote:
>> On 21.04.2023 18:01, Oleksii wrote:
>>> On Thu, 2023-04-20 at 16:36 +0200, Jan Beulich wrote:
>>>> On 19.04.2023 17:42, Oleksii Kurochko wrote:
>>>>> +    csr_write(CSR_SATP,
>>>>> +              ((unsigned long)stage1_pgtbl_root >> PAGE_SHIFT)
>>>>> |
>>>>> +              satp_mode << SATP_MODE_SHIFT);
>>>>> +
>>>>> +    if ( (csr_read(CSR_SATP) >> SATP_MODE_SHIFT) == satp_mode
>>>>> )
>>>>> +        is_mode_supported = true;
>>>>> +
>>>>> +    /* Clean MMU root page table and disable MMU */
>>>>> +    stage1_pgtbl_root[index] = paddr_to_pte(0x0, 0x0);
>>>>> +
>>>>> +    csr_write(CSR_SATP, 0);
>>>>> +    asm volatile("sfence.vma");
>>>>
>>>> I guess what you do in this function could do with some more
>>>> comments.
>>>> Looks like you're briefly enabling the MMU to check that what you
>>>> wrote
>>>> to SATP you can also read back. (Isn't there a register reporting
>>>> whether the feature is available?)
>>> I supposed that it has to be but I couldn't find a register in
>>> docs.
>>
>> Well, yes, interestingly the register is marked WARL, so apparently
>> intended to by used for probing like you do. (I find the definition
>> of
>> WARL a little odd though, as such writes supposedly aren't
>> necessarily
>> value preserving. For SATP this might mean that translation is
>> enabled
>> by a write of an unsupported mode, with a different number of levels.
>> This isn't going to work very well, I'm afraid.)
> Agree. It will be an issue in case of a different number of levels.
> 
> Then it looks there is no way to check if SATP mode is supported.
> 
> So we have to rely on the fact that the developer specified
> RV_STAGE1_MODE correctly in the config file.

Well, maybe the spec could be clarified in this regard. That WARL
behavior may be okay for some registers, but as said I think it isn't
enough of a guarantee for SATP probing. Alistair, Bob - any thoughts?

Jan

