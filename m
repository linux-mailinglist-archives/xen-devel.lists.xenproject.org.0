Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E530722071
	for <lists+xen-devel@lfdr.de>; Mon,  5 Jun 2023 10:05:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.543532.848590 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q65CJ-0005qN-Pt; Mon, 05 Jun 2023 08:04:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 543532.848590; Mon, 05 Jun 2023 08:04:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q65CJ-0005oB-N2; Mon, 05 Jun 2023 08:04:15 +0000
Received: by outflank-mailman (input) for mailman id 543532;
 Mon, 05 Jun 2023 08:04:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+s6H=BZ=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1q65CI-0005o5-Gy
 for xen-devel@lists.xenproject.org; Mon, 05 Jun 2023 08:04:14 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20617.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::617])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8edf1c8d-0377-11ee-b232-6b7b168915f2;
 Mon, 05 Jun 2023 10:04:13 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PA4PR04MB9271.eurprd04.prod.outlook.com (2603:10a6:102:2a6::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.32; Mon, 5 Jun
 2023 08:04:11 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6455.030; Mon, 5 Jun 2023
 08:04:11 +0000
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
X-Inumbo-ID: 8edf1c8d-0377-11ee-b232-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Co9QDEmkzhGvdWJZVZpMyR4awR7KofDQCxkGh2fWhzTar1XSxRawlSEIyObg+L2LpzYcHv9Pqp5QuD3on7eBQaiXchZhSVCiIFKbiV/Ko6urROEnlgPkWemAI48y6fZjddpB3FQzc4KfyrThmIAtfO/2EisKNlC6KRkA0800Of0tGE29CHlIYsu+duQlbhIeKHvY24Lh8M0UdmXJ4wzul+Hb50tLHcK1brqoGpOkiod4BnWcG68CVdbdq/u2ylWURlL3oiC6KDsgK/NOvW/C0vAUcB2PKh6+YeEBYptCXUS8rzcVk1rBU2RMUmwBZ/pRvEWSeEwFulTDBm2ncmQ6Uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qCUgs5LvrhINOsk70XDEqLSdFRZiH9too8S7O00vAgo=;
 b=YUe8gI175fsb2WLUknJ/hpWesME19uBxXxHnCTvQP3ML7PMfSNKG+5OR+xMS/w10raBd5H1V1hhiZFWs48xBjfDARAkIVNf/QgibuSL863Pim2qV0WHQ7TEdAk4B/VEc+vC1zW4sSegNvgTuvhlUeUzMhUwfeA83yJVwWs9/ENXUCIytCpKvbEkwgsD0+ViEfrHDFP+SyODaVxTRRPUZCTca10GCrl83+klvdkz5jGWFUVje88n3O75PfsrulSJC3ow1+Cp3j9rZreVUyD+DqRL78LIoeVBxoUM3ncDFvx3XIMO23kL/00eFZye7Wfg5iUDmxvV3vnO/7k8iy5vqaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qCUgs5LvrhINOsk70XDEqLSdFRZiH9too8S7O00vAgo=;
 b=V4XPmB3WPRB4g5VloTHYl0Jy3nyvZVaLYxVbb57/myCF8UFXRkB4/89V9wmiFDExgTO6x4X+Ui1Q+GmPY5cudmfTub13lWek1YxGLodpYFWE3Jjn36pU2IAdTfcnwS5zMOhjPxOBvQ6Fbq3trirWpfO7pY0XyrPckpj9YUSVLokVvaGaXKhSuoSPe1FeuzdxPyoJaz/qkzxJ4mH3iKf3tyl0dNPwE3P/lq8+Ni7aNU/uBWb7i4nhqOUCmZgYjWnq+NDCC9s8KJGyp8CWLJeUeUAiEaNo7PKxu1tdqLn63mGvf05szXYAH9DyxwTgfk9BWwSmGSO1/rLmnVfD4LwLUQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <b8476629-0739-2a40-056a-38a56605260a@suse.com>
Date: Mon, 5 Jun 2023 10:04:09 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH v2 3/3] x86/cpu-policy: Derive RSBA/RRSBA for guest
 policies
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20230601144845.1554589-1-andrew.cooper3@citrix.com>
 <20230601144845.1554589-4-andrew.cooper3@citrix.com>
 <1ce6bd53-089e-e8ab-3b54-2720a3fd2c12@suse.com>
 <bd03669c-66be-a64a-e73f-a80f372a6484@citrix.com>
 <1987e108-3ab6-4971-78cf-0e7ba5facc04@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <1987e108-3ab6-4971-78cf-0e7ba5facc04@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FRYP281CA0010.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10::20)
 To VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PA4PR04MB9271:EE_
X-MS-Office365-Filtering-Correlation-Id: 6ce10d9c-6377-4d68-c539-08db659b71ee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	REwzXEOCaiCM0RfTyxFs9JL/TWug5J13XA7B8bVd2N+kAAfutTgkJv9N2NOHMmYjqtqFPAsyz7Y//VmSsrXAalbl3aNfEIGhj8TVJXVPo5QZ8Fhc21zsb5iP/cvpyfdNjwEG9C3md+vn25pIhHcCOFD4iqdA5c2WvbtXP8xBNGSaq9WQAnx1/zGwDsXv1FfBj8EHQO+jcoomWUV1zakPKZHpwnoOKusA7c8h53CckVco+hnvr+TZDWxXFupPCEKc1LxoYcJ2i4KTC+O4G8FL0fELfKTX1nf53GE/9iRwUZomHc3dUE/a+Q75+xn8dEouBYvcGxL+rSxOGYU15kZkhv3HD7SIOIkErXhN6gfcwa0TsJcpiobFp0KqZ4szTzE4lNu5b8LvD988Y67uOmxX0/MYuObnDFn/bBaKmdiwjus646EEN84DgHsQWPRTNQdEn7UNBiIEfS6/iyq7V/PHgQB6jxOwx5GYEzITzMT+kyH/iRhRLituefP3cLF7ULuW0CrcN9+RpI5rpURSAy9DX4fVYlBBbIfSr/QPLYqh0JbcDGYuuqSzidSCy/RDZfwml0A0hPMaHYAC8gCXiitAkWLQhDhIE2LfGTaPWMyc6DJVV4BE8Eo4maI2psZlySJVH56YnnJ5qSVMkoMR4RTDeg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(396003)(346002)(366004)(136003)(39860400002)(451199021)(54906003)(478600001)(8936002)(8676002)(5660300002)(36756003)(2906002)(86362001)(31696002)(4326008)(6916009)(66476007)(66556008)(316002)(66946007)(38100700002)(41300700001)(31686004)(83380400001)(6506007)(26005)(6512007)(53546011)(2616005)(186003)(6486002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?L2xZUk01M1J2SmErWkJha1kxMEtPdGhueUUzQjV3L1hGdFJhOEMrNnc5ZWV5?=
 =?utf-8?B?OGl5RHVTbmtJdnI3dzhSV095WnA2dFBTOHBlcjdMcVBzY0gyZFZSTmV1aXNy?=
 =?utf-8?B?c1FTdGFNSDg4bzI0d1R1aC9sZVFicEhreEQ3TzY1bnZrcWYwdGRLbDRscDJM?=
 =?utf-8?B?REMyaVZ4c1NtY2tYc3pnYjhSaG51aGdwSnIrN1BkUnVzcnB4WkhORllmRVNE?=
 =?utf-8?B?VkEzRURaUEtYOFdtLzlXazIxaTF4ZEZWNGc4ek9nRGIxS1JvMDBZVGpCVTVZ?=
 =?utf-8?B?eEFZTVBkajBJZGZlb0FRZDYzYTlzZWxwQ2VORXgyT3RJSytTdjEvWkd3Tk1l?=
 =?utf-8?B?emdtMlFqbWdCemc1RHBlQUp0N0t5K1NPR1o5UW9JTytiejhYYllTYktiSDZn?=
 =?utf-8?B?bVdRaHlHS0pjTDdQa0hPN1JKTEV5am1uS2I1NFRabHIwZW10NUlEMlp6NklZ?=
 =?utf-8?B?WXZSSDVQcEVNanR4MGtrak4rTG1jeVo0Y09nRENVdlo5anpvbDYveTR2TGxM?=
 =?utf-8?B?d0dhSzZPbUhhY1BCUHM0QTF2YXVEc3VyTXQxRTJweUMzUDRJL29lT3RxUjRO?=
 =?utf-8?B?Y0dKWVF5NmJIb1hkSnBONEJZalJmK2xFQzVuRkE1UTN1L0JZL3A5UFU4U1lC?=
 =?utf-8?B?NTA0NCthMEN4Mk1WWHRkR2VGR3RoL0dwZUtaVm9HN1U2VUdySTU1WGNDcGQw?=
 =?utf-8?B?ZGxZKzFLeXFDaWh3NThXdGwzZndyMkZSc1o5WDVDcktMS21QRzd3M1FER1NG?=
 =?utf-8?B?VWR5Vy8wNVZ5d21haUYwY1BiTnc3b21DRXMrZ05PSStaaFNVckVGRUtkSjhs?=
 =?utf-8?B?WXZHTzU2dDZ1R3k4bjRqTnNTcjRBc05VbVVXMHF4N2NrRG1STUNaYWRTMFJh?=
 =?utf-8?B?cUxnVjk2NlhsanI0TEQ0cFdqckQ2VkkzU25Ha2N1Tk80YTZnS1VVYmQ1K29J?=
 =?utf-8?B?Q1ZySTJxZGhheEVubEFoNUxBQ2tsZCsyOXFxSFd5ck9vZjNJd3o5YWdxNXQy?=
 =?utf-8?B?ekcvNXl0L3pnSzZJOCtsY0s2amk5WGxoNHF6S05nME5yeXVLWVVGYktnclQ0?=
 =?utf-8?B?V3hXUzdPN1c2V1hLV3JnU09GS0tvSEJuVmw1d0lrT3labHUyb3JHdy8zUmU0?=
 =?utf-8?B?QTVTYWx6ckxHZjhtQ1BBQlZ2N2ZaUzM4c2FLU0ZPUE1jV0xmdXAwbGlOMWtS?=
 =?utf-8?B?amRoT3ZMbVdMcTZVdGYvVEdBOVdxa3hKdzB5amx5Zi9EOGg4L01xcnlHUVRB?=
 =?utf-8?B?T2JiYzB1MFgvK0dXVlJkYVFZQi9iU3RqQ213L2p5bHAxelZMTkVjY2NQTWV4?=
 =?utf-8?B?a0ZKMy9DcWlCeHRCRUhxSHZvWU9GMFNzeVRYdXFVSTh2Nnp4Wmo1R2VTWHlN?=
 =?utf-8?B?WCtvTzBDdUR1bG1pdFlYSlNvUUJiVXpsOS9iamZwL2gvNWVuREhCbTlLYkVn?=
 =?utf-8?B?VzRrVVJXRHpWanFkUFBSM3E0M1h1NXpUbWJ5eGQ0N0Zkd0IvUkVCdjBvL3Jz?=
 =?utf-8?B?SzY2VGd4MDZSYWJjSHZndGtuMjVhNE42SDBRNlRRcjV1elhrU1dNOUd5bnJK?=
 =?utf-8?B?TGZ2d25SRGd0MExVa2VESWtKc05zRVI0d3JUcCtlLzVoRDN4dVNyVzd5UUhV?=
 =?utf-8?B?Um1QRjBES1RVcEh5R2l6bnkranNkbzVOV0V2Slc1QU5CUU1QVlZjeGloVEZR?=
 =?utf-8?B?OExLdlM4NUI4YXFsVGJiNDYwOXVwcS9MQlF1a2hYRmtHQ2dRUi9mM2JRSjJB?=
 =?utf-8?B?VFl5TzR5Y1NUdmVKUFlreGZLZFpVcWdjRi9FZHREd0ZYem95MlJmYkd1TE4z?=
 =?utf-8?B?cTRCRHVWOWdtS241NmVscVpYaFlmTzM1Vm9kOFp0SFc5WXRBRDhTRWE4UHZN?=
 =?utf-8?B?WHZnVnRrdHVIOElocyttMUwzUDRFVTJaQk5KRktvL1hhNmV5MnZ0ekEzQTAr?=
 =?utf-8?B?ZkdJYU9XT2RmY0dUekIvdVZDN012Umo2RmNFL0hONmtKeGo1Ym1sMnVnNjhh?=
 =?utf-8?B?QlNxbDF6VUZYVm1YZTNuckdKMjdwa3pjWCtxYXI1YklDMFVQVHI0M0dQSmZW?=
 =?utf-8?B?dTI5QmE5b1NWZlBodHdhaFBsckt2RzBQNWk2dHUwbUx6V1h0NG13YStNYzIv?=
 =?utf-8?Q?gtgtVHZVOpK5XpFOlKjGUueFa?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ce10d9c-6377-4d68-c539-08db659b71ee
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2023 08:04:11.1666
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F754lM9jBn0ApID8/euQ7YRU434XaBkPTTRldoI9EK/PXTNf2SrRHHvAFG0giPDmV+6LNH5rkv6BjQWXWpHAKw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9271

On 02.06.2023 17:38, Andrew Cooper wrote:
> On 02/06/2023 4:29 pm, Andrew Cooper wrote:
>> On 02/06/2023 11:20 am, Jan Beulich wrote:
>>> On 01.06.2023 16:48, Andrew Cooper wrote:
>>> What about a tool stack request leading to us setting the 2nd of the two
>>> bits here, while the other was already set? IOW wouldn't we better clear
>>> the other bit explicitly? (Due to the EIBRS dependency or RRSBA I think
>>> this can really only happen when the tool stack requests RSBA+EIBRS, as
>>> the deep deps clearing doesn't know the concept of "negative"
>>> dependencies.)
>> Hmm - I think there is a bug here, but it's not this simple.  I think
>> the only reasonable thing we can do is start rejecting bad input because
>> I don't think Xen can fix up safely.
>>
>> Xen must not ever clear RSBA, or we've potentially made the VM unsafe
>> behind the toolstack's back.
>>
>> If EIBRS != RRSBA, the toolstack has made a mistake.  Equally too for
>> RSBA && EIBRS.
>>
>> I think this is going to take more coffee to solve...
> 
> Actually, no.
> 
> I'm going to delete the hunk modifying recalculate_cpuid(), and move
> this patch back to the meaning it had in v1 which is just "get the
> policies looking correct".

Hmm, and how are you intending to achieve that goal without adjusting
behind the tool stack's back, and without it being an option (yet) to
reject the input? Iirc you agreed with my v1 remark that some fixing
that some fixing up is going to be necessary.

Since as you say (and as I should have realized when writing the earlier
reply) we may never clear RSBA, wouldn't it be an option to clear EIBRS
instead?

> It's still not supported for the toolstack to request ARCH_CAPS (the "a"
> marking), and the safely logic for that can come in a subsequent series
> along with the unit(ish) testing I was already planning to do.

Yet it not being supported doesn't mean we should leave a broken
result when we can fix things up (for the time being, i.e. until we
can report back that we don't like this feature combination).

Jan

