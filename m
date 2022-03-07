Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4903C4CFB4B
	for <lists+xen-devel@lfdr.de>; Mon,  7 Mar 2022 11:34:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.285807.485067 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRAgH-0000IX-1d; Mon, 07 Mar 2022 10:33:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 285807.485067; Mon, 07 Mar 2022 10:33:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRAgG-0000GB-Ui; Mon, 07 Mar 2022 10:33:32 +0000
Received: by outflank-mailman (input) for mailman id 285807;
 Mon, 07 Mar 2022 10:33:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=XxC1=TS=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nRAgF-0000G0-Jm
 for xen-devel@lists.xenproject.org; Mon, 07 Mar 2022 10:33:31 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 07c30ff5-9e02-11ec-8eba-a37418f5ba1a;
 Mon, 07 Mar 2022 11:33:30 +0100 (CET)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2110.outbound.protection.outlook.com [104.47.17.110]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-6-Rs0uFRX9MVyep0Ihpmwfhw-1; Mon, 07 Mar 2022 11:33:28 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by AS8PR04MB8754.eurprd04.prod.outlook.com (2603:10a6:20b:42d::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14; Mon, 7 Mar
 2022 10:33:27 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%6]) with mapi id 15.20.5038.026; Mon, 7 Mar 2022
 10:33:27 +0000
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
X-Inumbo-ID: 07c30ff5-9e02-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1646649209;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GgbDyPoo8GQc0yETPpRZhJ3FGEFYKIVp1LBTWsa3RiE=;
	b=bU8tftTQqs8uosvWCgH0UrE0JLgRC450uXsarmhVrq5tc9YSl6EmtRPgx2iXG6Qayx0Xqv
	s1fIgOoE3X3+8ntD8NklKppU9q8bakUpCSkJf/76VZ5RwFFrplzRjlAfESxviEV8VXLUqF
	k7wIlUW3f17+35p3hmxpG2m79Azxce8=
X-MC-Unique: Rs0uFRX9MVyep0Ihpmwfhw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gS0ppJAKBPCl0MLyPeQWBsGDXwZn2C6iDL8CnmkyNmkSeOjjEVK5QZlhZ1vq+n/RSrxX76LgQhUm6jVhQVDwo/qZP8aBepRwuwg96vcBeXzKCGtz0TsdwreeWqFasEvCqwoCwPsLZi22zJqFv/uDKiScZUWrIE5t9Kl7gyPJD/44l6coglMu2NofwO5eU22mTl5nGIXfuGZ2anPhUFab0IOKlR1j2Uss9soodlyCxmfKnTnzpzSOkqHuJ6F+JyXOhnEA9ig1/bLGlslomCwAfX/uzybEOefx+DkffIs7HfI9Br5gGH75mD+8HRhCVKRLm1En5bIh0Jc9II2PH7XlFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GgbDyPoo8GQc0yETPpRZhJ3FGEFYKIVp1LBTWsa3RiE=;
 b=jUnDwqMLDTfZVYIVwIDO5caQqUgA4v0dFc+PJ/YVWcl+pKyTaHrkmkkUGICXQgEN16HDtViteZxM8fB1ki4KZ0j9P8FQo/DdP0gTceSttEWLW0U1nyEXNqnIHZ6+E35r/uoZSnHUy1m2x9HeIxP2juqoz1SRJC/UjVHdbwSwxgIzfC+sShMud40bi5tAn2HLoSNJnDA/p+SSQU7Xq7XFw0SJC7CmR7tzNd6L5e0yEzMe/DRn3MCM+7XUDdJG6LOmxSThbnVt6oJGs6DUVpsysGcph9i+1Beyywef7cVZNg65g/XpVepWlX/t8OiIa4ZUtu1v9EHT9AELR9hxyKUj1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <02856ef4-3cc9-b3c7-30e6-84a5d0037fcb@suse.com>
Date: Mon, 7 Mar 2022 11:33:28 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH] xen/x86: Livepatch: support patching CET-enhanced
 functions
Content-Language: en-US
To: "Doebel, Bjoern" <doebel@amazon.de>
Cc: Michael Kurth <mku@amazon.de>, Martin Pohlack <mpohlack@amazon.de>,
 Roger Pau Monne <roger.pau@citrix.com>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>, xen-devel@lists.xenproject.org
References: <fd56d3713b873bb00f7fca80e86ee7466057be3c.1646643967.git.doebel@amazon.de>
 <f9a608be-8aea-9116-fcd7-15a197073f8d@suse.com>
 <2aa0886c-9a62-dd29-644f-edb5b10a340c@amazon.de>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <2aa0886c-9a62-dd29-644f-edb5b10a340c@amazon.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P193CA0045.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:209:8e::22) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6c885149-8231-4412-4d24-08da0025ea20
X-MS-TrafficTypeDiagnostic: AS8PR04MB8754:EE_
X-Microsoft-Antispam-PRVS:
	<AS8PR04MB8754C7961A8E3F5E61533FCDB3089@AS8PR04MB8754.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	8mnZuvfxwPZKK6hAj4w0POVtOTt44pSFvosdvCjylEu12M46prfWiUte2inpzd9eTJAKBG4Acacf2Pg49LLsx/RwPGZk7hPQWFFWVq40KJbWn2HFhSEvyvfz2lmYTXtMAreVhst2jvnjNsrD/efgqHnmOEnRzXVpaE1C+Hkb5+tjSlHfQBZVgHRj/oVBp3/VubH+5jVyC9N/Qw23WacpuHnk59VWr2PaFf28kPEPCBeyXb3PXPp6vPyV0dvitBg6WlsHRtcCWtEckrIwZ1UCdP8g0u99QA5vdYnr0Pl68mzGsBVWsjsSkWfwGSEDE5u9QaYifxlCNRTkIGieMGwWA0rBkYu/BxvfRlxyF7ofDTByRQyXho9jR2rZPBZeMTKqtfZfgU56JeyDGLF9r1pQ0jUEObd4XsQf1XhTNHhUn8enImZTm7jpHDNM5QVdSGbBPduqFFnKVdkL13B6YeIBugUxPVLrU9R98ZdbiBlHumjkZJ1vwZkc2fl0ygs2zn65R2CSTlfCCMD+3ePyqHfXrRGvExZ5jtIoZrT9cGWB5DbN+MAlfFlewPNROe1RXmYfq8nhmhW94R02GtWydrpMpGUboL06UoYitBnY5FMPx+qhVoU58rLvjJPwsVCwpa1GqeKDB2t/efZMMonaqEUPFcJrFcBYUiaath0OzY0PAVfeBgS7Z7tWzYN+UAh7gTQwpE3wIHEJPpW4yAKvpxtXSkBmopuw3OdzG66WxrA7h10=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(38100700002)(31686004)(508600001)(86362001)(6486002)(54906003)(6916009)(36756003)(6506007)(66556008)(66946007)(4326008)(316002)(66476007)(8676002)(6512007)(186003)(26005)(53546011)(83380400001)(31696002)(8936002)(5660300002)(2616005)(2906002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ekNVV0RvZlA3aXRVQmE4N3dpZ0c1YnBrcldqWWhrVGZnWXIwWklpTjV5T09C?=
 =?utf-8?B?L1pTRkhkdkpKbXJXYTFrWEc0OHU2b3FjY3d3QWphdWFueEhjdVJvRDE2WkRq?=
 =?utf-8?B?a2s1cXVBbUhjdVdMWVBnbHY4bnJGM1RvWHp2QUNBaTRWRWEyMGZFbmdISVZo?=
 =?utf-8?B?T1o4VCszY0xXamxzRlNyOFQzMUVPaXlLa0tRdTVmUHg3TDNuaEFOZUlGeDZ5?=
 =?utf-8?B?VldZTEgzMTdYcHkrVUlIbmZjZ20xWE54eEp4b1RVWFNtQ3lYOWVrQktTZjhT?=
 =?utf-8?B?VTNWOS9RS1BvWXhzMUZlQ3hIVjB5UXA2YWZqYnM4a1B1U0ZQUFRJTFphOGNq?=
 =?utf-8?B?VHlPbEJsOTdpUzRWbHFqTlZMWG5nZDBXQWZOVXc2OUI4anNLc2lpbjBZWVdw?=
 =?utf-8?B?QXJlcGdEdzZEZENTZzVSNkM5SzEwL1lvWUdVd2FVTkdsbXB4QjZkVElHdGFv?=
 =?utf-8?B?ZUNkZ1FLRUNXTkd2bkxJTmMvUzVXczFqZEpTQ0htTzBwaGE3UXNMeGtGbm1h?=
 =?utf-8?B?dHJkTlZjSXFvcFNGRDBkWjJSUitoNnF6eGF4SHBIRE9OOHh1TWRnN0Q3T1VX?=
 =?utf-8?B?b0gzcmkwSjJWWmxYQ1hvNThiVlplcmYzMXhHTDRwVUxabTBreGwwSnNZdmJm?=
 =?utf-8?B?eGxYU2F6SHFnM25aMDJQZUt0ZXhVQ0dWR0hoUS9zbHk4OVZGSzZaRWcybHNF?=
 =?utf-8?B?b2llUitrWVAvZXBJaXZKNTNsSm16NlBraUJsYXQ2MU5OOVNWQ0lQVVN6WTZm?=
 =?utf-8?B?L29WSnZZUDYvV2l6VE93RFhVbGV3ZGlKVVdWY3NTbG1jMXNqR1pibEZLUFhm?=
 =?utf-8?B?NlZyZ2R2bmdXZnp4SDBWc2YzL2hpcFgyMTZ6VHVzNDlSaWx0TlllYWd5OWxp?=
 =?utf-8?B?MTZyVEJQRzZYMm5qWUUrdC95VWlEVnkyNjgyMVhaLzIwaVRuWEVwK1k1VUZX?=
 =?utf-8?B?MWV6YW16bzg4ck9XalJMQW5zNjlQU3dwNHNxakdPNDc1ak56ZUlTTkc1cEkx?=
 =?utf-8?B?elZ4TTg5eWE0Z1VCYUx4QTJYU1Z0Tlp2aGh6QXA4Tkk0aHdWL0JaS1VzVkhw?=
 =?utf-8?B?MXY3NFJ3bzg4Mkp1WXR1R2FiQWwzcTc3SjUxMjZtak0vVnZUUEFJMXA3RU81?=
 =?utf-8?B?cVFSSUxzSlBORG0zdjI0bThGbzVCb0pOOFVtNkNDZmdPUUZOVkpLd0RqTWU2?=
 =?utf-8?B?bDA3Yk5UcS9EVjVyaEx6QVIwWHdzYmFneHVqUDJrbGNkbjBzRG5GTGdTdHlj?=
 =?utf-8?B?Ny9kYnhPS3o4b042NzZsVnF1VmthS0gzRkZTN201UXpNem53WkNiVzRmNHds?=
 =?utf-8?B?Qk5pdTJVWktONDY3WlRnMVQ5VU9wdmpRVmFJbGNYN0Nia3BLSzZzZkxPU05i?=
 =?utf-8?B?ZWxUSzU5WVJtUFJNRnlHNzdRVDJkY0M2R1RSdnhTbEx2bHNQNFhrTW5EL0pL?=
 =?utf-8?B?ekVUOWE3NXY4TjR0SWJJVWIvL0ZhMkl6eVVqZ0Y5b2lsRDdSNVNTQXpBaElz?=
 =?utf-8?B?UW5NVE1nREZiNUE5WDR4NWVDNWVnaDZmckU4cVlobjYrNzJBOGUrRGt5L05H?=
 =?utf-8?B?dVp2b0JhV3d3RjRHczBWSzR5aWtTS0xBMzN5MmY2U1hRd2NTdnFGOHljL29D?=
 =?utf-8?B?alZONTBieHBzQnZPQUovVXhDNlFPWnNIcjUvVy9yVVpCVEw0UzBxb0lOTGRI?=
 =?utf-8?B?WC9ZZVBYOEMxM1RXbGNnN2p6MzN6WVdiWS8vSmhtd0V6ZzJ1bS9nSXlYS3Rt?=
 =?utf-8?B?V2ZGSUhXNTNmYkF0UExkRXlLWWkwNjNmNjZUNWY3cW5zNlNobjh5Zkc5R3lq?=
 =?utf-8?B?WC9UNjdTMXNud3YvcDk0bGllbmtNWDMwTTFCREhWOVJub2ExWWJnckxQT2Z4?=
 =?utf-8?B?WFNtWkkxT0ZwaGRGN2dXQTBoSG45and4c0h6SytINzRwVXg3dXNIQjZyRGU0?=
 =?utf-8?B?ak5wQmtpUmNZRFBzdi9YNHcvb0FUVUlpVjJhMmJabW55ZGNhT2Ewb201RWZz?=
 =?utf-8?B?U3NMV2YrMXFlZFk4M0tEWlZUZVBKTWpYaUl3eCtvcWFyYVhqV2VGMVRRYStV?=
 =?utf-8?B?eEtLcEd4ZGplZk9iaUtXamkxTGNMSXRxQU52aUpzNDBVUnRwY05CNG9RSWVx?=
 =?utf-8?B?RUc1VEJWUXFIMFhkZE5Ma25qZml6L2svQ09nRkNad0s5Zyt5ekMraittZlpi?=
 =?utf-8?Q?qsliRBls3X5i6ZPEG5jEp3U=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c885149-8231-4412-4d24-08da0025ea20
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2022 10:33:27.0621
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TUToglIEvKSdcaiXwvyz0URW0MQ2hpuy5wj20eHHcdi2tHfGsXhtDN6BC5LoUS1g6/6SBiIv5rl2M1yL+JOU4Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8754

On 07.03.2022 11:17, Doebel, Bjoern wrote:
> On 07.03.22 10:37, Jan Beulich wrote:
>> On 07.03.2022 10:17, Bjoern Doebel wrote:
>>> --- a/xen/arch/x86/livepatch.c
>>> +++ b/xen/arch/x86/livepatch.c
>>> @@ -14,11 +14,28 @@
>>>   #include <xen/vm_event.h>
>>>   #include <xen/virtual_region.h>
>>>
>>> +#include <asm/endbr.h>
>>>   #include <asm/fixmap.h>
>>>   #include <asm/nmi.h>
>>>   #include <asm/livepatch.h>
>>>   #include <asm/setup.h>
>>>
>>> +/*
>>> + * CET hotpatching support: We may have functions starting with an ENDBR64 instruction
>>> + * that MUST remain the first instruction of the function, hence we need to move any
>>> + * hotpatch trampoline further into the function. For that we need to keep track of the
>>> + * patching offset used for any loaded hotpatch (to avoid racing against other fixups
>>> + * adding/removing ENDBR64 or similar instructions).
>>> + *
>>> + * We do so by making use of the existing opaque metadata area. We use its first 4 bytes
>>> + * to track the offset into the function used for patching and the remainder of the data
>>> + * to store overwritten code bytes.
>>> + */
>>
>> Style: Line length (also elsewhere).
>>
>>> +struct __packed x86_livepatch_meta {
>>> +    int32_t patch_offset;
>>
>> I was first going to suggest to use plain int here to comply with
>> ./CODING_STYLE, but it looks like int8_t or uint8_t will do, leaving
>> more space for the insn. I'm also not convinced you really need the
>> __packed annotation. Furthermore, to avoid the need for casts,
>> simply using the ->opaque[] directly would look to be an option then
>> (with suitable #define-s to identify the two parts).
> 
> * Agree on the uint8_t.
> * The __packed was mostly to be really sure there's no added padding.
>    Likely will be needed once I change the type for the offset.
> * I think using an explicit struct is more readable+comprehensible than
>    magically defining macros to reinterpret the opaque[] array, so I'd
>    prefer that. No hard feelings, though.

While I agree on the readable/comprehensible aspect, casts - in particular
such as used here - come with a risk. But it'll be up to the maintainers
to judge anyway.

Jan


