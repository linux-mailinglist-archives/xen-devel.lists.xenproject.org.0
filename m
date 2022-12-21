Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F021652D5B
	for <lists+xen-devel@lfdr.de>; Wed, 21 Dec 2022 08:41:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.467587.726630 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p7tiY-0005fa-TI; Wed, 21 Dec 2022 07:40:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 467587.726630; Wed, 21 Dec 2022 07:40:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p7tiY-0005c9-Q2; Wed, 21 Dec 2022 07:40:46 +0000
Received: by outflank-mailman (input) for mailman id 467587;
 Wed, 21 Dec 2022 07:40:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=GA0H=4T=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1p7tiX-0005c3-Nx
 for xen-devel@lists.xenproject.org; Wed, 21 Dec 2022 07:40:45 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2059.outbound.protection.outlook.com [40.107.21.59])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c5c0b2ed-8102-11ed-8fd4-01056ac49cbb;
 Wed, 21 Dec 2022 08:40:43 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PAXPR04MB8767.eurprd04.prod.outlook.com (2603:10a6:102:20e::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.16; Wed, 21 Dec
 2022 07:40:41 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5924.016; Wed, 21 Dec 2022
 07:40:41 +0000
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
X-Inumbo-ID: c5c0b2ed-8102-11ed-8fd4-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lT7whfsKrBOj73j7IJD4TlrPmP/q+NYBQ2R8iLlKbS+0F1QyOyRu3mtSrmt/TxRNO4IxI744ueKLwn2q43U2cKTFSU7dCtajhuW5yJfcJyKQm54QRf90+XD5fLf5c0qxHEqXCjEB2ugNPX6Z398FE2GNCiDeT5WUVr42TkEsGnlsQM4mvN+tBc3RwmnycpRi74keupagNA/rgfj0wbCMJckbzcnPDzqApMMicYNxvBeT3DFW3iTCnvROjsOrS3/18uDrXNSvTM4SXlrzC56n3ZqmDXOmQcLG7KW41B9Tu7ZnLe0EqHRCq5nQ1L/XYaZOdwnw9OoClIiKh9Ar28fCRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4qS/4CRUHSK8e9LkSyYRhb7nEi08fhJOfay4BcNaKR8=;
 b=lv2Xle7MG4KBTRRzelB6OaHjz/lAkdA6hhnDqIr86K7WvxsHvKC/EH/r9TYcYxzA1Dlt9TvXDZAwUsMju+PzKS+GZmj3OkVuX4Z8EreCyKz2Vw1R4ke+Ta11JGt9+y6BBKwAUQ4RMR6MVUbCDvKfU+0A+T/KmsZbQEbcItSq4fA+3xKHiRvUFYnoiX9GhALH+FPfE7CHsS1V3gWHhdvZcO7I3alrziPvTZjA1s7wGRhXW5x29DV+GcMUirkOQEuB5cdNvc7YCNHuMBKwoi38alJV8on7Uuw3Q6yLopb6tlObXkMiUThgM4CMcCVd7VRErSTqAJis03D6dJ0G+ZsR1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4qS/4CRUHSK8e9LkSyYRhb7nEi08fhJOfay4BcNaKR8=;
 b=VQ3kPS2ZTdw762woduA48S8/Eapg9LykCEqAzXanFEp/28bUp/ol+y8e7eKBo6KNnEKWicnR6+mZ1bpnlLGRT8f0mS1pV80iPHKRTR7TQeGb+n3wKP9jAy7EdfSTg0YqBfauh6ZXJeMyH4zboSTyeIJpjNnX7d0Q9r83N9kwKr0/H5cH1OZd7POvUNpmz6ouAPO/e6W5vh5DzHJWWefpEa8jrmoyZ1SXz7ZPFShURm7+WMrk9s7Hcean2Rf+LdoqnHWbjgn9DK36GGEnubF9A3ujSmUuOkTeEcLgAYv7FMbt9wMmB6Poe/l35/8wuKboKADn7oCWZMUF6T/sCToPGQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <e70bf233-4444-8c65-8cca-1b7ea74c55d1@suse.com>
Date: Wed, 21 Dec 2022 08:40:39 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v2-ish] x86/boot: Factor move_xen() out of __start_xen()
Content-Language: en-US
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
Cc: Roger Pau Monne <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20211207105339.28440-1-andrew.cooper3@citrix.com>
 <20221216201749.32164-1-andrew.cooper3@citrix.com>
 <520cdde9-07e1-fce8-56d9-205fc31c62e3@suse.com>
 <c14dacf1-7057-d860-7708-2dd13e8d6a4f@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <c14dacf1-7057-d860-7708-2dd13e8d6a4f@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0066.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4b::17) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PAXPR04MB8767:EE_
X-MS-Office365-Filtering-Correlation-Id: 730782b9-2846-4398-860b-08dae326a8e5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Ha1d6YhP5zPXse31Y/ngRx4+NXVKVNG1CyyQAWrYXXQzOQRJ4c7WZ9ss2FNafuKvPc+i/1ti9FmMSsPfQxjGRxl6c9sg7AZAB8zu5CL/1T5LNHIpHjgccrPAdfmHttriqVv/+2ggPZptyOk3EgMor/Nx1QXQw5eK9f0wNk1QWBtlL6b4BXjSgP1nKRUz13G6bIXGhrU/xudRSuknSbOeOdiRU0JcMDkme4bBjv86NNYzVPbrH/VfpJ0nrr8xeX/Ec63ouUcjSU3q6k8/kNU4v3nr5ss5CwtRWbLx1U7ksn96RbzorOPYIm11+W/EoLIuGI9Thx4Ynk4sAvMjzowty3qfLazvHBQ8bZcJaeokP/35qFm7PYSRdVWhqhs7+RDD2MhPiFOY0RRDmiNGFbTOWZzUOmOYn/d+5+kBlnrGBNwBPdSwHr1x7ihoRS6SRyNXSTDgYBMZMrKLcyu6VCxWGq+b0u+Kv2iekh4asxjEoxMwp65J8ylOfwstK9YAETZsRFzSSIIu8i6Co6rlRZU163EJuJy99fyDc9T5p4aiMwlsIpYtRZyrQse/iogSKwUXXMFIHUi1vQs+bH44S+FaqDQL1iTB46DuqeOP0Yyqoa+oqwfEAPFGxOwSwLXA9MmYZcbZEjmC7+Ou0acUjdut6XHoxrmZantXSOyGqFmJ9ZluuZeStX/Ht5xLxplCCZ6eJbSydd2VbynHv0YuTmnjRC9K4ICyMuLg767IcMnbJ/Q=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(366004)(346002)(136003)(39860400002)(396003)(376002)(451199015)(186003)(478600001)(2906002)(316002)(6486002)(54906003)(6916009)(36756003)(86362001)(83380400001)(38100700002)(31696002)(2616005)(53546011)(26005)(6506007)(31686004)(5660300002)(8676002)(4326008)(66476007)(8936002)(66946007)(66556008)(6512007)(41300700001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RUdmSDFRT1hKMDdXTzFxSDlQcVhQZlhmNmZ3SW5sdEdCTDh0TFJMZ1A5SGpv?=
 =?utf-8?B?Z3hlTXpDUm9Wdi90RmdlR3JpWHBac21ZKzVwSlpISWYySlRIbjB5cStsdWMy?=
 =?utf-8?B?U0FWWS9aL2wxWjJrNFNzVUNVOGp2MnUyM2pOQXpscTJsMkE1ZDl1L0xrM2Nn?=
 =?utf-8?B?QnRrNTlQZ2VTcnI5M2grMDQwOEhGZktrNm50TVJKeEs5ZWNJZk1JQ0J1RXpp?=
 =?utf-8?B?Y2hjTE43OEIwNHBQa3FEZXU3NWFFZkdlVi8rajlnVWxkUUpIZGlYQUx1Uy84?=
 =?utf-8?B?QzFtT3pMYjRjcDdkM0J5T2kralFqRXNwNmhRQ3BFQ3BpZWdyN1JQN1RkT1dX?=
 =?utf-8?B?TUpmLzNSQU1XYnF1WTkvUXAveEpKOHY4a3ZPcE00Mk9RMzJROGxxaE42cFBE?=
 =?utf-8?B?N2djcm5OczBBZHp0YXRZK2c5R0Z5a1htNFJzNjdmeVN4Ti9tejhkZTJReXd4?=
 =?utf-8?B?aGZ6NzlZOU5nVWhNWjNZMTQxcWJVN3RJcy9SQlNic2phMWtYWWlOWTkxaDYr?=
 =?utf-8?B?U0FBUFY0U3ZpdVk5WERkQzVvVEE5TWExQ0RodlRMQ3o2QWQzbE5ZSlcybSti?=
 =?utf-8?B?WW5xUWpLbnVmSzE4blVydzJ0NWkydjU1YVduVHdLaG1MS040UFlNN0M3VUtR?=
 =?utf-8?B?N0NRV01WbnZ4cTZrQzRGOTNJZHFhR01SdkxKS2tLckRReVZSanprZjJNSnY5?=
 =?utf-8?B?SVQ1N1V1MmxKWlJBNXIwL1Blc0MzR0F1eFF6bHJERnd4SFIxeVhSZGVwQS9L?=
 =?utf-8?B?QmxEalpwekYxYW1mYUpOSTVUUGdrTHFURVJNdUhvWWF0RmY5THpaaUg4M1dh?=
 =?utf-8?B?Zlk1Y2tkT1FvUTV2OUFkYVRLMG41aE1BUHIvTGRPQWdrSzMyZ1VGZVo4Mm9J?=
 =?utf-8?B?YUpCQVNMQVhxeEtFNlBSTVh5WW1reXFxZ1FMQ1BSczR3bnNBMDdaY0ZoUFJz?=
 =?utf-8?B?RFZtMzdzSm9lWisva3NzZEZ3TzZpT1J6YkFqVEMzQVFtc0hXL21PQjFQT3dW?=
 =?utf-8?B?dXVwZ0o3Zk0zZ2d0REM2NllSdUx4R05xeXYxVVQrQWRvMWZwdE5MMTRsam9P?=
 =?utf-8?B?TWJaK2pZeFlwbEpxKzZRK0M4Q2YzcE9sN1p6NUZCNmxkTCsxZ09TT0ZUeGVq?=
 =?utf-8?B?QTBZSXJJbmM1ZlNKdTF1VFI1Wksyc3RUajBFVDU5YXE2b2ZzdVhsZ09sQlVF?=
 =?utf-8?B?U2EyZkkzZUdPN2FFWUJkSUk2bzdxak4yMFo1ajE5WEtTNjRRWTVJbjZ1MzJk?=
 =?utf-8?B?cm16N01aYmUrQlVEOHZRQWNJd0hTVjJWWFRpYlZMZllJNUx5aGpmbldnR2Jz?=
 =?utf-8?B?WTIyY2J1Y3JMQk9hbDBFTEsvdGdlaWVhNjhDZHhOeCtBd0ZSUjJ6aU5yVjZF?=
 =?utf-8?B?ZUpBeGZWcE9RSVFXZ3RGczA2UERuVjRnc3diUUZyNlRrWkJzamd1ZXJjemdo?=
 =?utf-8?B?R0MzUDVScTFCemozQnNueFVsdkZ5YjNBT1h5MkExZlE2cHBBNmhjNW53aU5o?=
 =?utf-8?B?SXlaeXRjSm9Cd2JBL1FWeTlVTHJ1ZENJQTdhdXliMVpmTmFEVjdCMmZ3YTZD?=
 =?utf-8?B?WmI3Y3NUWDVSTkFxRnRlQnZ2VUpaMWQwSUducVBNWUhoSDRxbWpQN1FQWS9N?=
 =?utf-8?B?eUxnWjUxSkhyV05DdWpwOFYwekJCTFZwYkhPUFd4d0E2OStWV1VUZnpVVjFv?=
 =?utf-8?B?ZUEyeUpWMyttWlBuYlVhRUUrT3ZBQnBJaDBjbTYycDJ6bFIrcll3ZWZTYkpI?=
 =?utf-8?B?K1FMRHpjNGpFN3AxcU85TVBiTnRRaiticTV2UTVzb2UxcklScktJdnpaR1lZ?=
 =?utf-8?B?c2V6WTY0TDZXcDVlMDQvaTVxdHVNOWRpMFpsWmczNkVlNW40L2hENDdOK0dm?=
 =?utf-8?B?NTgyTzJUT0d2SFUrOW5UVENCRE1QS3h1eEltcEJrU1kyeVR5eWxtc25sVlBw?=
 =?utf-8?B?bkFHb253YS8rUkRVaVY1dEtrRWFsaWQ0V2cyTVZuZWU1b2dPYVk5eml5eEly?=
 =?utf-8?B?NXdCZ0tzVy9JMjBXWFFWY3hVbFlRekJpckN5TTlUL0sxT0FOQjZ3VTQ2RVo4?=
 =?utf-8?B?Q25VU2dXcnVaNCtQaDV0ZGh0NnRmOVJBNElwaVh5V2Z3b1RCeUFhb3hNNkYv?=
 =?utf-8?Q?Fmp0lj9Sihx/E0zRFjHGjr2gi?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 730782b9-2846-4398-860b-08dae326a8e5
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Dec 2022 07:40:40.9785
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1p7GKI9rPXLJNFzklbVxaS9lMbcZX8jL8YpqolqRB60Nc84MmEIAPb9pD1kKmWREJ3VwVIlUC/ERUNnXYMogsA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8767

On 20.12.2022 21:56, Andrew Cooper wrote:
> On 20/12/2022 1:51 pm, Jan Beulich wrote:
>> On 16.12.2022 21:17, Andrew Cooper wrote:
>>> +        "mov    %[cr4], %%cr4\n\t"     /* CR4.PGE = 1 */
>>> +        : [cr4] "=&a" (tmp) /* Could be "r", but "a" makes better asm */
>>> +        : [cr3] "r" (__pa(idle_pg_table)),
>>> +          [pge] "i" (X86_CR4_PGE)
>>> +        : "memory" );
>> The removed stack copying worries me, to be honest. Yes, for local
>> variables of ours it doesn't matter because they are about to go out
>> of scope. But what if the compiler instantiates any for its own use,
>> e.g. ...
>>
>>> +    /*
>>> +     * End of the critical region.  Updates to locals and globals now work as
>>> +     * expected.
>>> +     *
>>> +     * Updates to local variables which have been spilled to the stack since
>>> +     * the memcpy() have been lost.  But we don't care, because they're all
>>> +     * going out of scope imminently.
>>> +     */
>>> +
>>> +    printk("New Xen image base address: %#lx\n", xen_phys_start);
>> ... the result of the address calculation for the string literal
>> here? Such auxiliary calculations can happen at any point in the
>> function, and won't necessarily (hence the example chosen) become
>> impossible for the compiler to do with the memory clobber in the
>> asm(). And while the string literal's address is likely cheap
>> enough to calculate right in the function invocation sequence (and
>> an option would also be to retain the printk() in the caller),
>> other instrumentation options could be undermined by this as well.
> 
> Right now, the compiler is free to calculate the address of the string
> literal in a register, and move it the other side of the TLB flush. 
> This will work just fine.
> 
> However, the compiler cannot now, or ever in the future, spill such a
> calculation to the stack.

I'm afraid the compiler's view at things is different: Whatever it puts
on the stack is viewed as virtual registers, unaffected by a memory
clobber (of course there can be effects resulting from uses of named
variables). Look at -O3 output of gcc12 (which is what I happened to
play with; I don't think it's overly version dependent) for this
(clearly contrived) piece of code:

int __attribute__((const)) calc(int);

int test(int i) {
	int j = calc(i);

	asm("nopl %0" : "+m" (j));
	asm("nopq %%rsp" ::: "memory", "ax", "cx", "dx", "bx", "bp", "si", "di",
	                     "r8", "r9", "r10", "r11", "r12", "r13", "r14", "r15");
	j = calc(i);
	asm("nopl %0" :: "m" (j));

	return j;
}

It instantiates a local on the stack for the result of calc(); it does
not re-invoke calc() a 2nd time. Which means the memory clobber in the
middle asm() does not affect that (and by implication: any) stack slot.

Using godbolt I can also see that clang15 agrees with gcc12 in this
regard. I didn't bother trying other versions.

> Whether it's spelt "memory", or something else in the future, OSes
> really do genuinely need a way of telling the compiler "you literally
> cannot move anything the other side of this asm()", because otherwise
> malfunctions will occur.

Something like this may indeed be desirable in situations like this one,
but I don't think such a construct exists.

Jan

