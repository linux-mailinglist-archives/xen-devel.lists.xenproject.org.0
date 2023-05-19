Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A26A708FB3
	for <lists+xen-devel@lfdr.de>; Fri, 19 May 2023 08:10:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.536685.835265 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pztJo-00039M-D4; Fri, 19 May 2023 06:10:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 536685.835265; Fri, 19 May 2023 06:10:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pztJo-00037S-A9; Fri, 19 May 2023 06:10:24 +0000
Received: by outflank-mailman (input) for mailman id 536685;
 Fri, 19 May 2023 06:10:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TMQ+=BI=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pztJm-00037M-5d
 for xen-devel@lists.xenproject.org; Fri, 19 May 2023 06:10:22 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20609.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::609])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d5bcfd1d-f60b-11ed-b22d-6b7b168915f2;
 Fri, 19 May 2023 08:10:21 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB9PR04MB9789.eurprd04.prod.outlook.com (2603:10a6:10:4ed::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.19; Fri, 19 May
 2023 06:10:18 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6411.021; Fri, 19 May 2023
 06:10:18 +0000
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
X-Inumbo-ID: d5bcfd1d-f60b-11ed-b22d-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DjRH5EnmaHGL/nRRN3iWrUzDycrI8FeTVE4fMUOYWTDBbkZGnsPzYx7MTV8qfMfKNYENtqJVH84U/Hwa8PQ1as5bWq68HXlhE98gmJbYjKjEXiaarFOvlPa9Qmx29SP90lsEzpSDo7LqoyuNTrsFxhfZGGMJmHGqLWkNO6Rn2/wSreibpvvoXvQ8+pj+XUzT4NKjvQklf2lU/MmKFsdAZrKeapOHwfhNqFwKeryFfnCh/EU4QMpFqgyafnS+9ja9hBdvPrlOhSAezLJ5pDid7psvEA+k6qsdDps5gU5UAw8j+tiV54X/+5T+C35TqwOQkEJ7gh0Q+w7W54079btSBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=evtFuPv6XMF+Tdp6iGbdxcxMnpHnJtUVWds36uzNMSw=;
 b=m2NRsNhtqknXjvhx4BilCTJKVV+22Xi2k0SSYSpB6MeHIEWS4iz1L9etwHOdOHt9WUfAfA4gIzoRnlbj0FS8TJ6/7AvUN8A2YRAL1l4IxbVie9p5bhMYwt14222MtRULiRoY8mDLayYx4O0+79vmZXBJb6lnBxVn9KEZ7zFoC/uJOU0eMiYDdHDdKHlinfOxhaKzOdXkLRHOvnb/7KuXdZuKyDW9AeU4nW5cYpoUuN076qLKRyMLbPgR+voNWT7n2SpQondodnZjXnRsvHgJtslPAdMGXqvfSciq8P50fpz6g1+T5KyrEoIDGNCkRv69PO/sCw/tPDTLxO0w3xvFsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=evtFuPv6XMF+Tdp6iGbdxcxMnpHnJtUVWds36uzNMSw=;
 b=4Dh11Vqli31FIL9POyofIoKcwqRk9tZGV7KXqRl8Dy7TVReTHSQwpFjwDGm7L/iv5fe/nmimRY3KlCRs65XWB3d2K+fxX5eu8EuZ3HiMJnfFOcr4kpGyEtu1lZOcigoqfNXf4HGwm7R/Knl7L7xv7HZjamTD2xTrQBjl7vRTO7OyEWhcCv7Z33AMLMRCTT3MaZ4SrN3tDpF9FYY19R/4pzWPsMw13k/oVj702iiykelgqKkOl3DVAscU+794ZdRcJ4USWFFSg9Syt/oE1+HODwKyeL3bjfuYHHLYmqLTxHGbYFomY4NqeQPfikaykv0e/5I7xUi9varATHcR1gN/ag==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <a871ff38-5a68-d703-6909-2d217f7fdc7d@suse.com>
Date: Fri, 19 May 2023 08:10:17 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH RFC] xen: Enable -Wwrite-strings
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Volodymyr Babchuk
 <Volodymyr_Babchuk@epam.com>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20230516203428.1441365-1-andrew.cooper3@citrix.com>
 <796b6671-c699-1bbf-b3a7-59c8fceeb625@suse.com>
 <2308d1ef-4928-bb60-88b0-319ac3370a53@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <2308d1ef-4928-bb60-88b0-319ac3370a53@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0153.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a2::11) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DB9PR04MB9789:EE_
X-MS-Office365-Filtering-Correlation-Id: 99ba670b-1bd1-43ad-4497-08db582fb89b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	tG6gB+IduNODRVMRrTuGPCMbK5YbNyXs0hnUTP5gBxbmyTjUx58dv+PLiTBIGTik0qMcRzE8VlyotHbn8ZB3Jqg3o3vKfkCR42E8kOfCeMYZP+Mdc/HSdfQAI0+x1+aR5kspVGDZpGxoT6aRh6m/GD68semg/BbxYbtUu7jFW66uiOMkt39xQuX7bOQLReg5Tu7MDxQY2P0dBiLIsHRott9Hk5FOuS8pX7YA7wDLfSvsGuybTbSOK+2y8sdoG2h4sT0vlP3DfNG2uNUnUNRHz5P5FTZraGu01f+q1UNVag8IYdRg4PzAAkIF899YXLQmQMfzGMWL0t9eqZk1286XViRTLCFbBEYgFKixZyb5BPrH/qaQlKoiQUxciApTYY4K2GguQdi3FlsIQhAbK9wyHJcNNaGcY68goIOAFcqve9zL8Xza3odJD4R8yZspsfjIKr0ljBG98usnCTte8Smuh1tdgQDUvqxQjs+L4V6C5ekbQcYvZUnaB+ErshTIBsv/DdvSsNGCgnnsdstBuCsc8EjGs2WeAbO+ba4dLfvTRbL/9UEGR3Njh0SOv/pVcpajI5EDkKeagXO/s315UcmQyy6K/1odKnqOMcySFHzNiIEaD80uc1OyVuuSYRvsz+6hLQ4Bv0tGQRfMkjODWwR/wg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(39860400002)(396003)(366004)(376002)(346002)(451199021)(2906002)(316002)(478600001)(41300700001)(4326008)(8676002)(6916009)(31686004)(8936002)(6486002)(54906003)(5660300002)(66556008)(66946007)(66476007)(53546011)(6506007)(6512007)(26005)(38100700002)(186003)(83380400001)(36756003)(2616005)(86362001)(31696002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dm9oZGFXQTF0V0xIdWl2VnVtTmhEV29QUUZ1cXhlcURITVNPQmRtdTkrdXg1?=
 =?utf-8?B?Q3ZkZEpQUG1wbk0zR0hZQUw5MkZmNGNGOGtwbTNRdFdzSW8vYWhnK3VqM2dm?=
 =?utf-8?B?dzFoZEJjRGsrS1FxaGxIOXorRDlselhXbXNXUFVxUFUrd1R3enc4WHRxV0Zw?=
 =?utf-8?B?ekV0VVBrRi9ZbExnVXZnL2ViVXJNOW1KemZGS2llS2VyaEJWelk0NlROdGE1?=
 =?utf-8?B?TDZlSDVzZitBREpQY1A2MVJvN3d1QzEzRUh0ZGRJMmlmN3QweWRZTFQwUzM1?=
 =?utf-8?B?dE9uUWc0RkNseHJKbVB0eC9SSWRGUXY2Z2JMajRBZ0FidTJDV2lFOU5lMUNV?=
 =?utf-8?B?bVZ3ejFhMlpVeWpKVytYOUJ3czZQYjJKM0thRG1NSEc5U1NSMjdndDE5NW9F?=
 =?utf-8?B?SkhDRFVLZ1gxaEhXNzAveVFPelNhVFNVRlgrTVFLZ3kvNEZBSDYwbUorVmVh?=
 =?utf-8?B?QVZtcWdvR3FsWU1WVllHK2gvTjZrWXFVV2U2L2xDektRakY1dHhiZWQ4bm43?=
 =?utf-8?B?dndlTW95TGJUZ0FVSmdYbHoyVTg1bzlnV29JQ2dMSG5IdG5JQ1Y1SmUxVlZF?=
 =?utf-8?B?ZGRZMHVnSTdUMS9rQVlYZmNhdXB6alZSUWw0NFFhT1NTVlNWdjI5UnZYdG9l?=
 =?utf-8?B?K3NjbFpOQW5wdFZXMjROL3V5L1hEMDk4UFgvRkl1U0JRam4waVE1S2FNemJj?=
 =?utf-8?B?dkhIOENhS0lacmN3NXlXVWN6MHhKWXRXazlqeUpUUFhwbWJreUI5ZVVKQ2di?=
 =?utf-8?B?ZkpuM1lJdnV1QW9JNkcveE8rNnRHY0UzUnI3ckNjcURDaFhVZmhHVEh5NFVj?=
 =?utf-8?B?TEdlb2JMeDE0Q0QvNUhsdEpyNzlKMnBVZ1VScnRFRThsUys3eHBmK29sWXB2?=
 =?utf-8?B?SHdKN0doMXRMTVFqNEhkbnRsbS9USnJkc0Q0aWQxNFgzSHZqR2NLaGxZemsx?=
 =?utf-8?B?QUM3Y3kraUhkK0w0UkxZZXBuQXNaU0JOTzFObHlPSUVVaWdaOVZoREFaL1dJ?=
 =?utf-8?B?dUZTdUZ0NFl4MG85dDVrQ01Tc01hK2tEMEw3aG1BYnZMSER1QzM5RFlyVHV6?=
 =?utf-8?B?Ri8yMm12Zm16aTJkNUwwSDE5cGZLNlBtcGNHVURjUGFWcHVaYUtWc3IwZjJl?=
 =?utf-8?B?aTRhS04waFhZU0p2dnRSOTBPTTMxNWpzOE52cWZZWGZsQUJMN2luY1JtVHVt?=
 =?utf-8?B?dStJZzNVaEEvRjlzNUtob3Z6MVZpTXIrWDV0MTZSaHNMSVNRa1F0eDRDVVVV?=
 =?utf-8?B?ZThaUjlreU5sTVUxNUl2WFdudVNVclB3M1ZBN2NaNEhZWVJlRUpOQlhDcmRT?=
 =?utf-8?B?cHdQeHNoZ1I0RU55dnJFUzdNVFAweVQ2YlVQUlRwTnhvUFlocUZ6b1ZscVNi?=
 =?utf-8?B?Qk1wdUZSY3E1Q2Z3d0E4WVNaT2psZlFyS3dEOTMzNU5aYi9NaVBGL01UYkFC?=
 =?utf-8?B?RngzYVdNNGJDT2IrUlpDS3FoVU1zS2dEME81aWQ3UElLUVlmdWVJYnRRdW52?=
 =?utf-8?B?RXdmVjhKTUZxOWVFaVdZZ3k4MWpPRDJSQWtwVXFCOXl3aitrbDlaalQyc0Zj?=
 =?utf-8?B?NWlFcEsyQUVUM1ltakVWZENJdzkxOXBUdkw4SFNVRFNSY3pFTm1lN2R1bzJa?=
 =?utf-8?B?YzhDZ0RDS09jRTA4WFhNYU9zbE9tSFEwcTVSWlhIbnZrK05FdEVncnR3c1Rn?=
 =?utf-8?B?dGVWeDJaandtNzJLRDlqUXN4bHI2aUN5VHFlc1FINU91QXpKaE1iLytFZ2l0?=
 =?utf-8?B?aGs3NXlzNlYvVmVPREdlbDV5K2NlbGVFNUZnMG9Ndjc3c3FyTjVlOFN2VUxm?=
 =?utf-8?B?R2hFdmR2NzZEc2VKRFIwQllTa2RzOU5ZdzVQdklXTWpxOXpZcTIxcHZoK0lq?=
 =?utf-8?B?cG5QRVlpWTdKYTVPZzRNQTVqeEYxdTR6VE11ZjhlNlNxNlpRSXROZW9rSnlR?=
 =?utf-8?B?bUlZQVJyUVBCNGVhMjNKRGIrK3RzV1JGUmNSREYzbExJaC9vSTh5UUFaUWZT?=
 =?utf-8?B?blBzVVkxWUpBdW9sUGZ1YmlFaVdCOTRWNFE1eXlOdDNkN2JpWXpFWXBKbTh4?=
 =?utf-8?B?R0VYRkRqS3lvekVqR1BDMHVEU2FsdDBTYUxnaEFVNUxteGVEeTEzOWhrQldx?=
 =?utf-8?Q?iqYrIURzZ67IH9IcMhFXTQgY4?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 99ba670b-1bd1-43ad-4497-08db582fb89b
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2023 06:10:18.8350
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7oJxQGt/JqoIE+hjTbJNyRZhmaatZkb7GwNbY51k3pLRrqsmjx6x4a3zGLdVfRSqAJwKhnITsdWb/GglHvq5RQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9789

On 17.05.2023 19:00, Andrew Cooper wrote:
> On 17/05/2023 11:34 am, Jan Beulich wrote:
>> On 16.05.2023 22:34, Andrew Cooper wrote:
>>> Following on from the MISRA discussions.
>>>
>>> On x86, most are trivial.  The two slightly suspect cases are __hvm_copy()
>>> where constness is dependent on flags,
>> But do we ever pass string literals into there? I certainly would
>> like to avoid the explicit casts to get rid of the const there.
> 
> The thing which trips it up is the constness of the cmdline param in the
> construct_dom0() calltree.  It may have been tied up in the constness
> from cmdline_cook() - I wasn't paying that much attention.
> 
> Irrespective, from a conceptual point of view, we ought to be able to
> use the copy_to_* helpers from a const source.

True. Yet then as a minimal additional change may I ask that you drop
the cast that copy_to_user_hvm() has in exchange for the one(s) you
add?

>>> The one case which I can't figure out how to fix is EFI:
>>>
>>>   In file included from arch/x86/efi/boot.c:700:
>>>   arch/x86/efi/efi-boot.h: In function ‘efi_arch_handle_cmdline’:
>>>   arch/x86/efi/efi-boot.h:327:16: error: assignment discards ‘const’ qualifier from pointer target type [-Werror=discarded-qualifiers]
>>>     327 |         name.s = "xen";
>>>         |                ^
>>>   cc1: all warnings being treated as errors
>>>
>>> Why do we have something that looks like this ?
>>>
>>>   union string {
>>>       CHAR16 *w;
>>>       char *s;
>>>       const char *cs;
>>>   };
>> Because that was the least clutter (at respective use sites) that I
>> could think of at the time. Looks like you could simply assign to
>> name.cs, now that we have that field (iirc it wasn't there originally).
>> Of course that's then only papering over the issue.
> 
> Well yes.  If it's only this one, we could use the same initconst trick
> and delete the cs field, but I suspect the fields existence means it
> would cause problems elsewhere.

I'm pretty sure it would (hence why I didn't suggest so); as said I
think this field was added much later, maybe in the context of the
unified EFI image work.

>>> --- a/xen/include/acpi/actypes.h
>>> +++ b/xen/include/acpi/actypes.h
>>> @@ -281,7 +281,7 @@ typedef acpi_native_uint acpi_size;
>>>   */
>>>  typedef u32 acpi_status;	/* All ACPI Exceptions */
>>>  typedef u32 acpi_name;		/* 4-byte ACPI name */
>>> -typedef char *acpi_string;	/* Null terminated ASCII string */
>>> +typedef const char *acpi_string;	/* Null terminated ASCII string */
>>>  typedef void *acpi_handle;	/* Actually a ptr to a NS Node */
>> For all present uses that we have this change looks okay, but changing
>> this header leaves me a little uneasy. At the same time I have no
>> better suggestion.
> 
> I was honestly tempted to purge this typedef with prejudice.  Hiding
> indirection like this is nothing but an obfuscation technique.

To be honest - I think I'd be fine with purging (but then better in
a separate patch).

Jan

