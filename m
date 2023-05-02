Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 71F256F4242
	for <lists+xen-devel@lfdr.de>; Tue,  2 May 2023 13:06:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.528500.821738 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ptnpT-0000hq-M5; Tue, 02 May 2023 11:05:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 528500.821738; Tue, 02 May 2023 11:05:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ptnpT-0000fA-Iw; Tue, 02 May 2023 11:05:55 +0000
Received: by outflank-mailman (input) for mailman id 528500;
 Tue, 02 May 2023 11:05:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fQfQ=AX=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1ptnpR-0000ey-Up
 for xen-devel@lists.xenproject.org; Tue, 02 May 2023 11:05:53 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on20611.outbound.protection.outlook.com
 [2a01:111:f400:fe1a::611])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4d167fa8-e8d9-11ed-b225-6b7b168915f2;
 Tue, 02 May 2023 13:05:52 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PAXPR04MB8367.eurprd04.prod.outlook.com (2603:10a6:102:1c7::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.31; Tue, 2 May
 2023 11:05:50 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae%2]) with mapi id 15.20.6340.030; Tue, 2 May 2023
 11:05:50 +0000
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
X-Inumbo-ID: 4d167fa8-e8d9-11ed-b225-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A4scwBzn9rvRbQBKU72IRVBfAVDq/7RYW9nTKHVoVFVqr2yXEWGCwVkwWj3TuNPR7VBy7RR6JLD3ex7pgO4GZwGbhOYjUvvJxgEaoM2SEj5fwAERzp+PtT1Tm9zjg/1FUNgFyC/mCv6ZGgqy8xpf5RTIEw+UMu7YLnnqw9qVXzmvkPcCNnRIZM/5aS96pUj/t0brqcx7pv7ZyZ3mt8H5Ysbh5uyWD5F1wI6bmGBddbEqMl13vTOz//ILcHU/4rfFCHNdQJSU310LUGklofTAjO0ASUSnx/ugdeHakdBzxc1lt4AoMq89jkUgLVDmLliBAnJrgW9iGf9NrJmHrbiqxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EUcaUhaJh2P17DmQn85ZzGyhh7j+KHpKjFu6faQt5hY=;
 b=TT0lK35Wvw0j3cliYl5EqY63NUKorlCnHag7Vx3DSMQbToDObzRXslF5wWOeJQ5G+xkt3HRz7fcPgrUCBC/3EP4vpDAOstGhNGHw30sZ7/o2B/MRCrmpZTJQXPAI6JUFABjr5UH5864NewexBR4wIOpJDQThkSXyNfce/seqo13ddmTroU08TWsu9QXaRdQpmhCgKswc067/n/hAtVWcKAQzBd9i5TaHf2sGkpSiHOBEXYmHmjPYR//Dv3RFQxBFlJlhhhx8wU1GNTnLax/3Lpl1U45D+9VN1gg1rQmlNFBayvlx8dHKN/5fxGnm/t3eXWnDApqs+C2bgjdEBFtEgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EUcaUhaJh2P17DmQn85ZzGyhh7j+KHpKjFu6faQt5hY=;
 b=4+sK2Jlre2Un0r9Er1pGg2KFndtv+8KxMucRDUDDicTB62ouo4PtWDRTRIwToP3Jl4Lf8EvitW/1kX1BJYLsSQLxjdhSdhQeJCUBuRPIawu11Cng3SOHddu5K8cvQm3psaQhillkE0C8P9q7deaTw1BPw9biMnqT9wHAgmhPDQprfa53UjZ/NTkDZCR85oLIR8JnQPGqHjHdwLPBvQsiYlkYVPztBUZ9RxQVpIGk7vLhJDzROYgYZqLKr9WNJBQxfyfxts3l3vvW3Uh4s7QW7h32wvTf1gR9flSN8aDlKcY63PhCPuknQJQZLxkdkIHMrvNJbFwXTmhT0jEPmh64Mw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <6aa9f2a5-bb57-4c56-84b8-5bc63b47cfa4@suse.com>
Date: Tue, 2 May 2023 13:05:52 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH 1/2] x86/head: check base address alignment
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20230502092224.52265-1-roger.pau@citrix.com>
 <20230502092224.52265-2-roger.pau@citrix.com>
 <89389465-f32c-7dfe-f62b-b957e2543cb8@citrix.com>
 <068ad06b-d766-4fc7-6bbc-289911441ee7@suse.com>
 <ZFDrT87RixpOmMfq@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <ZFDrT87RixpOmMfq@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0120.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a3::18) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PAXPR04MB8367:EE_
X-MS-Office365-Filtering-Correlation-Id: 5aba1d6c-8d78-42cf-d8d7-08db4afd3070
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	+4UDTG+ub4kz9f1+5b0tNYaQl8pFRqCAIX1qoqorOY1exGs7lrqXGz/6dhh4Y2UCMwBO9lQbpOOEl6lFR3lhjc9Vm5LP4FwL8jsHeA/nb7dRHHCjiVGiXr/YxbGyoCGQy8Bs0WDx3xqL77MeopeXomhr6U4UCbICImtk52uYIOQ6pabchdmZm5DRjafChmQCahVoNmcJPzjTDiOAjtkADz0H/eSYndFfYSGu0ROF7Z0NxTd2kVUxo62mWC2QfHsI4cEmvhTX9/BFihQIJ+ST/aFPuSyEhkXdBtAnlRf3Ze7692yaIWDWa/LlDw9Vg7TxOnXWAOZ4Oc1u0gyrA1GcYZu5ZYWZl2jmjW5D2cwn8F0Kg+wfZ3BF7XAGRqQStPQo6CIkW5vXivCHLvpeJOHDysAY5KgQknMk0g09n5A9Ec9tMnBqLrW5Ep7L0fN1fbjrrQhtNRmch9imKJwzBEMDlLeaUYn9jVvYfPp/kbB2k5PXsUqgouEMI+j0jcu+Gknmo49DoqT7t3FQeqdW+nLLmJtJxAhwQyNeMmxwRObtokYTIZhbKm91G9u8TkPcwxHm9Pe8dguiK+f5cv0JKozUkNrA78CJPVMQbNwJeGijZFhIZWXH7Hk3Xu6dIwhlAQG8LikTezk0ckdyQnPKg0+Z0A==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(366004)(346002)(396003)(376002)(39860400002)(451199021)(66476007)(66556008)(4326008)(316002)(6486002)(966005)(38100700002)(6916009)(26005)(186003)(6506007)(6512007)(53546011)(66946007)(478600001)(36756003)(54906003)(31696002)(86362001)(5660300002)(83380400001)(41300700001)(31686004)(8676002)(8936002)(2906002)(2616005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ME1nSlY0TytONVdzbCtlZEU1eHE2WEZ4OXI1amlQSCtZQStNYWRFd2k2R211?=
 =?utf-8?B?YU5KZno5WU95WnFHZmlTcTRaQi9ocE01NTdydDJtZTJoelExK0MxKzE2TGtl?=
 =?utf-8?B?eUhPWFdMTDRsa3RVYXpndUQxTXRuQi9vM0ZrRVRxK25BTnNXWVdPajNSK3NR?=
 =?utf-8?B?TzA1Sm1TbTNTQU9HMW9VR0MzWDlpUEwvbllqdGR2dkVJejlCOC9zZis1MnQv?=
 =?utf-8?B?SnlrcEJxWDV5blZDZDNUUmx0M0hOQUVOL2VRMVZkS1lpMGU5SXNPMWlmVXVj?=
 =?utf-8?B?dXVRWjdmbkVHbTlUN1VaY0RMd3F2OW9KMkd6UnBoWTFsZy9SSHhCYkxNcStW?=
 =?utf-8?B?bFo0WUoyYkxPaURzNkZQVTdxYkN3U3ZNMWp4TjA4MEsyQXVPMk11R3poUmFm?=
 =?utf-8?B?cE5yeEZ6c2NLaFNZV2l0Uzl6T1VGYnlVNVczK0MxQjBUOTVDV1l2eVU2T2dV?=
 =?utf-8?B?dWkyWm1qRWNTVDRkckdXVWJRUTBpRUl4Y1JNaXZsNWFXd2dDRmpvekNhMlNJ?=
 =?utf-8?B?TzlVVlhtVElydUgwVnE4UEVRMHYycWMrQktWc3owUzNLVnQ0K0dITlN4aGxr?=
 =?utf-8?B?NHlvSHlKcU1GS0d4MU5oc3llVGdDeGhlVXF2eUtpSzQzREdXUmZaU3hVN2lW?=
 =?utf-8?B?Z0F3RFYvYVlyN1dPSGR5WjFIdGVUTnNBNEpvTDh6cGxBTzdXaEFsSXZ4VHBL?=
 =?utf-8?B?L0tRNCtGZzU3SjZXMXA4YVpGa3dDaUtqNzFuUFpmVjZmZnFhSFNEZDBhdHEy?=
 =?utf-8?B?Mk5CREQwRzgzeFdGenRIVC9FTE13ZlpMeHhueTkrMjBjZEpFZUZlQmcrbnhX?=
 =?utf-8?B?SlYxbjd4ZGxmaHVZbHZadzVYRDRNcDF1Y2J5LzFBZXE2Sm5rMHhBa1ZMTDRj?=
 =?utf-8?B?dUJ4c0NtVWdYalFqRjdyYlFPMmlJOGtMUUt3ZWVJSFBkRU5MODcwVFZmZjFr?=
 =?utf-8?B?TjVXNFlyc1lKOGg2SVp4Sis2Rnl3ZnREdlo2NC94bE5LYTErWkNDcXo2RXpY?=
 =?utf-8?B?dklENnpsMkt0Umoyako5aCtsc0lzekFpaFdRUFJsWldaKzFUR1BKZUwvYzBl?=
 =?utf-8?B?R1RIdUhUVDZyTy9XNkJ6VUtLT0xSV04zeG9Xald1K0ZXdEM1SHFNOFcxL0xP?=
 =?utf-8?B?d29nV0hUalUrWWp5Zm93WnB6WjFqZ3dBd3doRzdtTk1Mb1FMakRsK2tJdEMw?=
 =?utf-8?B?S0VzanZqdW1XWE04a24wVE5BM3RHNEdvS25UNEQ3NHFWUHZEdGpyYmQ5aU1G?=
 =?utf-8?B?WkszT3BQK2JaMGErUks1WUhJaEQrSTN1TXZ4ODNkZSs4TnlrNFZVR3NRSHZk?=
 =?utf-8?B?U05UWXYyZGc3K1h5Unl1V1h5d0JybkRmVWpUQ2llT3dqajNLU3FiU3VQSzFM?=
 =?utf-8?B?NzJxS3VhcEcrZW91UW9qWXI1R3JCZmFqS1dmOTFTZkpsYjNEMHM5dFJ2d2h4?=
 =?utf-8?B?TlZ4WFAyNVBCdlF1Q2dwL21OQVJGL2c2R0R3Z1JYVmZVWWlBYkFuZGVVcU1M?=
 =?utf-8?B?N0pLdmdHK0tSakhJZDdjK1VBYWRvWEJwdHE2SzJXaHVLaEFnZ2FRSmRTWUlI?=
 =?utf-8?B?R3ZhakJwbVBJUWc1SkJwMVBjY29CTU5HMGxackRqaTQyOGZISU9YUE5yb3dM?=
 =?utf-8?B?TnJScnE4NWRYRUx3TUxlRDFOWTNGT3RERWlOTmxOTEd6VndndW1McmRpYzNq?=
 =?utf-8?B?eU8wRWRLZmsxSzRjb3Z1QmhtVnRDbTJXNEJGejFJTHlxWXZ2Vytvck02L0l0?=
 =?utf-8?B?cjRVS2VmQlg4dUY1Y1U3SisvK2lXbGoxZVFoMkVoM2MwYzlEaTJ5Zmp2N1U2?=
 =?utf-8?B?ZzZlaWRrZkoxMFlZWm1CVkd2T0FYZld2SmFMa3hEWEJBRXh1OVByUlFFZlZZ?=
 =?utf-8?B?VjFERXVrVW5QWGxmOUl2SDhyMWtvSkpvZzhNVjNXSlBQcnJLa3VWNDBabDMy?=
 =?utf-8?B?UDl2c0gydzV1aHIrVHF5VlpieWpudG1wOG9ZdkUyMlNPZVBQVS8zRXNKbUdl?=
 =?utf-8?B?NXMrYjhhRTYyMFo5REF3U2xJWS9sQVRUQmhSMklNWExvbmhqWllDNklhdVVR?=
 =?utf-8?B?bHlWZ2ppektYa2IybTRIc3J2bk5YMEttaUZSZExMRWpPVWh5cHFmd0lWMmtm?=
 =?utf-8?Q?zuzyRlOYjyBVuK6Gh4UL9CmXf?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5aba1d6c-8d78-42cf-d8d7-08db4afd3070
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 May 2023 11:05:50.4142
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WPa4b8uij6EdTz6x0/X5WM4Z+3XHmY/a9YAp8kgaD5lIjPgyk887zvaWrx9eCSjqSiBe+JEbDibLKN2bXRWnzg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8367

On 02.05.2023 12:51, Roger Pau Monné wrote:
> On Tue, May 02, 2023 at 12:28:55PM +0200, Jan Beulich wrote:
>> On 02.05.2023 11:54, Andrew Cooper wrote:
>>> On 02/05/2023 10:22 am, Roger Pau Monne wrote:
>>>> Ensure that the base address is 2M aligned, or else the page table
>>>> entries created would be corrupt as reserved bits on the PDE end up
>>>> set.
>>>>
>>>> We have found a broken firmware where the loader would end up loading
>>>> Xen at a non 2M aligned region, and that caused a very difficult to
>>>> debug triple fault.
>>>
>>> It's probably worth saying that in this case, the OEM has fixed their
>>> firmware.
>>
>> I'm curious: What firmware loads Xen directly? I thought there was
>> always a boot loader involved (except for xen.efi of course).
> 
> This was a result of a bug in firmware plus a bug in grub, there's
> also one pending change for grub, see:
> 
> https://lists.gnu.org/archive/html/grub-devel/2023-04/msg00157.html
> 
> The firmware would return error for some calls to Boot Services
> allocate_pages method, and that triggered a bug in grub that resulted
> in the memory allocated for Xen not being aligned as requested.
> 
>> I'm further a little puzzled by this talking about alignment and not
>> xen.efi: xen.gz only specifies alignment for MB2 afaik. For MB1 all
>> it does specify is the physical address (2Mb) that it wants to be
>> loaded at. So maybe MB2 wants mentioning here as well, for clarity?
> 
> "We have found a broken firmware where grub2 would end up loading Xen
> at a non 2M aligned region when using the multiboot2 protocol, and
> that caused a very difficult to debug triple fault."
> 
> Would that be better?

Yes indeed, thanks.

>>>> @@ -670,6 +674,11 @@ trampoline_setup:
>>>>          cmp     %edi, %eax
>>>>          jb      1b
>>>>  
>>>> +        /* Check that the image base is aligned. */
>>>> +        lea     sym_esi(_start), %eax
>>>> +        and     $(1 << L2_PAGETABLE_SHIFT) - 1, %eax
>>>> +        jnz     not_aligned
>>>
>>> You just want to check the value in %esi, which is the base of the Xen
>>> image.  Something like:
>>>
>>> mov %esi, %eax
>>> and ...
>>> jnz
>>
>> Or yet more simply "test $..., %esi" and then "jnz ..."?
> 
> As replied to Andrew, I would rather keep this inline with the address
> used to build the PDE, which is sym_esi(_start).

Well, I won't insist, and you've got Andrew's R-b already. (What I would
appreciate though as a minimal change is to switch from AND to TEST. We
really should avoid using AND or SUB when in fact we only care about the
flags output, and hence TEST or CMP can be used. It doesn't matter much
on one-time paths like the one here, but each unnecessary use sets a bad
precedent.)

Jan

