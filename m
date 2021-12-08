Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DCE7146CE49
	for <lists+xen-devel@lfdr.de>; Wed,  8 Dec 2021 08:21:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.242049.418699 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1murFm-0005fu-Bp; Wed, 08 Dec 2021 07:20:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 242049.418699; Wed, 08 Dec 2021 07:20:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1murFm-0005dB-8c; Wed, 08 Dec 2021 07:20:38 +0000
Received: by outflank-mailman (input) for mailman id 242049;
 Wed, 08 Dec 2021 07:20:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xuKF=QZ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1murFk-0005d5-QI
 for xen-devel@lists.xenproject.org; Wed, 08 Dec 2021 07:20:37 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5514f200-57f7-11ec-a831-37629979565c;
 Wed, 08 Dec 2021 08:20:34 +0100 (CET)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2054.outbound.protection.outlook.com [104.47.13.54]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-38-z8LQ6pXPN0quYU2FtdJg_g-1; Wed, 08 Dec 2021 08:20:33 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB2960.eurprd04.prod.outlook.com (2603:10a6:802:9::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.22; Wed, 8 Dec
 2021 07:20:31 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4755.023; Wed, 8 Dec 2021
 07:20:31 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AS8PR04CA0206.eurprd04.prod.outlook.com (2603:10a6:20b:2f3::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.17 via Frontend
 Transport; Wed, 8 Dec 2021 07:20:29 +0000
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
X-Inumbo-ID: 5514f200-57f7-11ec-a831-37629979565c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1638948034;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=l+6ajF4T0Q7XoX6xysx4OUr69jG3xXH61OqGaErEBgw=;
	b=EIkKC/oDR+1xsmnZCbDw5eZ6prjKMG8mMCHNdEZsebrunUbUvmR1xPSzgsZAUBrv2I/kNW
	v3qHKNJugE4yRb44GM9gC/7ySKVmFUg/SvRr+AUlXmN7jXSu6zXI3sLplwzyqv7FDu/Ohr
	2GSLAOCF3IX6Z7qw9S1cLcNy31ldHKg=
X-MC-Unique: z8LQ6pXPN0quYU2FtdJg_g-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gkt3okCX77slde6XtFYAvhycEMRsMWY9kJ8riTQNZWy0F7IA1Iufq0GjLOkS3qRRwuNf23U7/Bra7V54DbMo9v0pYCExzz3JCfDCxv/qVgOiqWCADDeJbkheEZXR6p1dsbqREFuJOs6TxDbWpbYJ49ZF7PZxFPbqbanyWd1vUbQLk2goG4BlmDm2lJLBJpODSDLjuRzh9q2SmnNStSDUQ93trzLa9Q9EwAfn/1t2HW+aaZcHtg7VuCZmFAuj+FVKWLWc+gsuxT8e3VymKeoJhJB3g7fQ3tFhlQDHQrXRAgnPSOJw3Qu+HF1gbsJwi3p+rINHd3f/BZJyuRVgahLLDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l+6ajF4T0Q7XoX6xysx4OUr69jG3xXH61OqGaErEBgw=;
 b=SY0Vv5wEC5pBJHRhr5AmTHVpXnTqOTlizcVernLs8W9xTBNQYKSwARX8DaokfQeSfY+Gbu6UGBajWcooJrEzWD32v5Ql1oS35V7caFSuJZ02zpb7EtRrctU9CJaEnfOSf53Zf0MA2SbWj2vxXtNei76T1YjnnEYPuz4N6I3lS4r39DpU4AAW+gV/NqZIIO2ix9Jm2nzkVgh1eZQXagE/GnI4UDQeVb4DtFcYAOfcB4cKf9JxUS3nCbxND+r7tuce4LRT7KbAmnyP4YIxVyeK5cBnYfq0blHk0eiSFI+YlRUiZ+YWtaWtN8JoLm2ChABX69NEXIxMjWGorBtlxH6gZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <6ab797ce-86dc-2c32-1cd0-417fab7516c7@suse.com>
Date: Wed, 8 Dec 2021 08:20:28 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH] xen/arm64: Zero the top 32 bits of gp registers on
 entry...
Content-Language: en-US
To: Julien Grall <julien@xen.org>, Michal Orzel <michal.orzel@arm.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>, xen-devel@lists.xenproject.org
References: <20211206142032.27536-1-michal.orzel@arm.com>
 <f3573439-4893-440f-54e1-fdeba3eb4508@xen.org>
 <dc114877-b9da-7a5b-260d-b9438cddd777@arm.com>
 <b7a53384-39cb-f368-f39b-9b560336226b@xen.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <b7a53384-39cb-f368-f39b-9b560336226b@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8PR04CA0206.eurprd04.prod.outlook.com
 (2603:10a6:20b:2f3::31) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 264670ab-a567-4d63-aad7-08d9ba1b376d
X-MS-TrafficTypeDiagnostic: VI1PR04MB2960:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB29605201D583B5E88E4FB9E5B36F9@VI1PR04MB2960.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	hwYC6K0Egs3wpafN1Y1AhFrT8vqGNn1OAbPQt3jaFJGobvzhH77vplPFgFBe0njvxPJh1HInH9U4k4O8KY+xHv0ajIN6I7WyLxubcyX3FaV229wR1QPMg+K/+jDiLa6owz8vmgjUk8Rn6W21dUGHu2YGpSPiDRLSD5ydaqYnJVFIVp5Yb8E48K4or156Du9FonTQ6/dj2Tbmwg/8b+3tJ3nAczMe+gbEqWiq2Jk9P7nlK8o7ybU1zM1ut9f9zHRvgcR342vS0uH0hv9gCHZqDO044ZtctK4COgFbZ27FCcV9lYDlfG8QB9o+nf4YlIaw+0WJrJE72nPb3c6ctJnD4Pt1TbGCPMcJkUCPfl/vAYe+zR7yBy8K+Eo2i6/R5wmwoDFj3ud26ok6EbPmeO1gqC/fcf/ctCvkFeysMKFuBuQmHA1Z6wMMdKj4P1uu1gQ9BumYPTwgoHmWAhU5/kBNYz0soW//0p2eTmlIp67xYHDCAkiMbaJtUGkJls19NKgz7QiCwlb+5v4/GWfSDujICavMxDn0xQC3Khzpevwv/VYUmFpB4CFVO3krw+a12egSA8qKlQjZhNoZhhgrzcvHI7EilVN1XHMbaXrTtw3jT/x3TkEjjfxpw80cYjr6/MX4qiT5KMQZmLOvj0kveZLodPDpiusr0P4N1tADT9nNcL1L+gRr+kq5qSe0OILd7kXRrFc17u/JayOCsgNhrrWfcBQzAkB5cXdjv0zKOw4dlnrEuew97+GJNdDyj9DnyLoH
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(53546011)(83380400001)(4326008)(186003)(54906003)(110136005)(956004)(5660300002)(16576012)(86362001)(26005)(8936002)(2906002)(31696002)(2616005)(31686004)(38100700002)(6486002)(66556008)(66476007)(8676002)(316002)(66946007)(508600001)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?K3JPMGtNVVNHbzlJb2hSSXhrRW1MUnhUK05HR3dhbHAwYUZlUWZya3BzeWtI?=
 =?utf-8?B?SEp5VHVaUDRFMzBpZ0hUYjc2WWYrWkFIeVZ0VkFCdEtSbGJhRDg3L3F5ZmVW?=
 =?utf-8?B?aDNkNVc1Z1c5THJweUZEa3pRZEMxaEtCTEZMUUtVS29FUVllOStubndrRmVs?=
 =?utf-8?B?djRWNnVWbDVMckJJMHkrMDNZRFJEdCtxZnhCUjVXNlR4eWU5UUJab0VTR3N0?=
 =?utf-8?B?UjFPdjc4eW9HdTZZd0UrVnU0eVA4ZXlaWDh5RmlGUGNpM3pRYUNuYTYxdzZa?=
 =?utf-8?B?TzNZUkNJcWpkdTZDUWFXOTFtZXVYSzRIWlVBcGI2VVE4cUgvaFJ0Z2ZtYzVF?=
 =?utf-8?B?a0FodURBbFZsaWVhZ2pOdXphUC96UGt1cUMrMFVncWxOUENDbmdYZVhjMmtq?=
 =?utf-8?B?ZTFSNlY4RE44bk0rSVkxbFRBUjRKUUlaU2pXVEFURTdFVysrNEZ4YTcvTDgx?=
 =?utf-8?B?c3E4ZlcwN1hSL2lycHBmaVh5ak4yQ0dWNEx1UC8wSFhsbnorU2ltTVZwL0Iw?=
 =?utf-8?B?Q2xDVHQwUHhObnh5L01MdVdreGFaSG9TVVhSNUU2K0FoVkZmc2puQ29VcEs5?=
 =?utf-8?B?elIwRTJYUTlCcWxucTNNTjZ4SFduS3RIU1JkcmdiSnFxSzVFczdCcTBsQVM1?=
 =?utf-8?B?dWt3VVBucUJYZVNUWmlmZEl3RW9UaGUwSElGRWxjMkYxaFBOK0g0N0kzK1Ju?=
 =?utf-8?B?M3p4dlZ1U3lnUDNoSkN5MmhiZWpPL3lJRElDNkVBNVJQanl5M0dWSWU2ZVVv?=
 =?utf-8?B?VjUxVjNIV0M4MkRKNW5XanlvMnF0RW4wUE1SSnh5VndyMW5QOTVCYjRFQnla?=
 =?utf-8?B?ZGVXMzN0ZFlQS2lqK0J5NjJvV04xeW1iNis3TTVzTjI2ZkNmcFNzQzJ5ajlp?=
 =?utf-8?B?Y1hTTzdNanZ5NjVjejFCOGZJQ0s2SFFJRkRYOXUwSWozUU5aN0JWSXhlT3FI?=
 =?utf-8?B?bFJhaFZMVmNFS2tPc1pBN3dMdmNFc20xSGRSQnBVWXluT1VzR0NCMzFIRTJ4?=
 =?utf-8?B?TlU5cktkUVNOc0hER01sdkdQa3RsTWNzeTQ3QmJIV2xHRDRjb0w3a2lVSlZk?=
 =?utf-8?B?MGtlakVUeGJFWW1RcTAxNy9tSWZVTkdNQTBCK29aVkVmeWFBQS9BVmI4UlYz?=
 =?utf-8?B?VUE1V1BnTzhMOWVSYnlqNGhBUVRkWTdDQ0xrNjBHeW5sM0lJVmNJVGdtVy9w?=
 =?utf-8?B?MHZUMWpsdHBtenJmZmhZR2pIam04RVUvVHlkM2NndjBtN3AyajRBMzBrL3ZP?=
 =?utf-8?B?WEVqdlJsWTFCRGgrLzcwbmYrd3V0Z3JSUENwbTIvMXBORXpFZzJTUVdkVGZr?=
 =?utf-8?B?QjBZeWVxVHhydkgvanRRdHBLTk5sMGFBVDNIMEhqQVNNcWxUZS96b3phUWZo?=
 =?utf-8?B?QWJpNDAyc2t6QTRwME1kaWxyY0p4MnFGOU1YejdSU3F2K1JwZnBYY0hFTm9B?=
 =?utf-8?B?eXBnV3ZNMkhCZWdZMmV3QVJTbW5xU2lab0JUN2RLK0FtVjl2TS9nUGhDbGo2?=
 =?utf-8?B?VFYwOEVLcC9MMlVnSS8vek4zSmltT0hpTjV5d2ZsYVdUNkxzeDJlL1VjNmcz?=
 =?utf-8?B?dC9QaWczTU05MzFyaElxaWp4NTBkQ3MzeXZqNGhYcUZ0YXdyQ1dpZUhEZXhX?=
 =?utf-8?B?ajh2ckF4Wm81b213cGdQaW8wRWo5Mm02NjZoVERBNXRxN2tzMzQ5c0ErWmR3?=
 =?utf-8?B?d0xrMnZuV1VWWGhUTXlpSmZ3SUVHNHJ1VFlpcXR3RnVDejB6cDZNSFpuTDZt?=
 =?utf-8?B?WFdEVXZNWWl0OW0xMHN5U3J5R2NDVU91UTFOY0tCbW92T3JCOGQ3cVE0VjRm?=
 =?utf-8?B?WTQwZ285YjdqL0ZtR3FvR1JURzJKNFNPYjhpYUFJaVRpWWZrTWhPZU1ONE9N?=
 =?utf-8?B?MWFCUVBXa1BBUFkrMkphUnllaHJONExNeEs1ZFJFUmkyMDJjUG03VURZWVYr?=
 =?utf-8?B?K3Q3NFI2T0NPWFFIcHNtY0NPK1pTcklqMzhxOWxvNFVxVnd4OExPM2VYWFNn?=
 =?utf-8?B?QnR3bzdrcU9Bd0djazJyNXZBMThKQmVKc1F1ZEswOEoxRGZ0bFoyaFBaR0Zm?=
 =?utf-8?B?ZjRsbGVSMEhzcE8raGRQZ2VKVWxDczkwVmNOcENGM2Z6M1E3eGtteWZhWm52?=
 =?utf-8?B?VUpnR0kwTkxmWXh3L3FiZGpzbFN5aDl3YXdXL3lnS25hNmZNYWZlM3I4b3kz?=
 =?utf-8?Q?p/7lPbaCi5ftbFpOP+/Hipo=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 264670ab-a567-4d63-aad7-08d9ba1b376d
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2021 07:20:30.8492
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lqlF517oqAxRcoh8qn8c3R+UY4CZL5fOdeJY3sNf3361p9kj/xyZfhS4NKBUJuEzJPLeim0pUkW47Jwb3+9DrA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB2960

On 07.12.2021 20:11, Julien Grall wrote:
> 
> 
> On 07/12/2021 08:37, Michal Orzel wrote:
>> Hi Julien,
> 
> Hi,
> 
>> On 06.12.2021 16:29, Julien Grall wrote:
>>> Hi,
>>>
>>> On 06/12/2021 14:20, Michal Orzel wrote:
>>>> to hypervisor when switching to AArch32 state.
>>>>
>> I will change to "from AArch32 state".
>>>> According to section D1.20.2 of Arm Arm(DDI 0487A.j):
>>>> "If the general-purpose register was accessible from AArch32 state the
>>>> upper 32 bits either become zero, or hold the value that the same
>>>> architectural register held before any AArch32 execution.
>>>> The choice between these two options is IMPLEMENTATIONDEFINED"
>>>
>>> Typo: Missing space between IMPLEMENTATION and DEFINED.
>>>
>> Ok.
>>>>
>>>> Currently Xen does not ensure that the top 32 bits are zeroed and this
>>>> needs to be fixed.
>>>
>>> Can you outline why this is a problem and why we need to protect? IIRC, the main concern is Xen may misinterpret what the guest requested but we are not concerned about Xen using wrong value.
>>>
>> I would say:
>> "
>> The reason why this is a problem is that there are places in Xen where we assume that top 32bits are zero for AArch32 guests.
>> If they are not, this can lead to misinterpretation of Xen regarding what the guest requested.
>> For example hypercalls returning an error encoded in a signed long like do_sched_op, do_hmv_op, do_memory_op would return -ENOSYS
>> if the command passed as the first argument was clobbered,
>> "
>>>>
>>>> Fix this bug by zeroing the upper 32 bits of these registers on an
>>>> entry to hypervisor when switching to AArch32 state.
>>>>
>>>> Set default value of parameter compat of macro entry to 0 (AArch64 mode
>>>> as we are on 64-bit hypervisor) to avoid checking if parameter is blank
>>>> when not passed.
>>>
>>> Which error do you see otherwise? Is it a compilation error?
>>>
>> Yes, this is a compilation error. The errors appear at each line when "entry" is called without passing value for "compat".
>> So basically in all the places where entry is called with hyp=1.
>> When taking the current patch and removing default value for compat you will get:
>> ```
>> entry.S:254: Error: ".endif" without ".if"
>> entry.S:258: Error: symbol `.if' is already defined
>> entry.S:258: Error: ".endif" without ".if"
>> entry.S:262: Error: symbol `.if' is already defined
>> entry.S:262: Error: ".endif" without ".if"
>> entry.S:266: Error: symbol `.if' is already defined
>> entry.S:266: Error: ".endif" without ".if"
>> entry.S:278: Error: symbol `.if' is already defined
>> entry.S:278: Error: ".endif" without ".if"
>> entry.S:292: Error: symbol `.if' is already defined
>> entry.S:292: Error: ".endif" without ".if"
>> entry.S:317: Error: symbol `.if' is already defined
>> entry.S:317: Error: ".endif" without ".if"
>> ```
> 
> Thanks for input. I am concerned with your suggested approach (or using 
> .if 0\compat as suggested by Jan) because they allow the caller to not 
> properly specify compat when hyp=0. The risk here is we may generate the 
> wrong entry.
> 
> compat should need to be specified when hyp=1 as we will always run in 
> aarch64 mode. So could we protect this code with hyp=0?

Since my suggestion was only to avoid the need for specifying a default
for the parameter (which you didn't seem to be happy about), it would
then merely extend to

.if !0\hyp && 0\compat

or something along those lines.

Jan


