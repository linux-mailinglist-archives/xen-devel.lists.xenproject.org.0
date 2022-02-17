Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 652804B9D66
	for <lists+xen-devel@lfdr.de>; Thu, 17 Feb 2022 11:42:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.274627.470161 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nKeEk-0002G6-6J; Thu, 17 Feb 2022 10:42:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 274627.470161; Thu, 17 Feb 2022 10:42:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nKeEk-0002EG-2u; Thu, 17 Feb 2022 10:42:10 +0000
Received: by outflank-mailman (input) for mailman id 274627;
 Thu, 17 Feb 2022 10:42:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xzkl=TA=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nKeEi-0002EA-Ue
 for xen-devel@lists.xenproject.org; Thu, 17 Feb 2022 10:42:08 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 40d13035-8fde-11ec-8eb8-a37418f5ba1a;
 Thu, 17 Feb 2022 11:42:07 +0100 (CET)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2055.outbound.protection.outlook.com [104.47.12.55]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-5-Dk8FM5SJOG-VT4-BZPZNpQ-1; Thu, 17 Feb 2022 11:42:06 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by AM8PR04MB7395.eurprd04.prod.outlook.com (2603:10a6:20b:1c4::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.17; Thu, 17 Feb
 2022 10:42:05 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%5]) with mapi id 15.20.4995.016; Thu, 17 Feb 2022
 10:42:05 +0000
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
X-Inumbo-ID: 40d13035-8fde-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1645094248;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LsNLX9HKlarzxpykQvdNVa6gyEF5+GjGf0wJ34RvpBg=;
	b=jw9Rlr/7xH71UYhIfEhEimo7amGBV+Rpd8srI8n5sMNfr2b5mtGGK5xbN07hfmANJQ5jMd
	2zphufQsL6CemTUNBNAZmsIgc3tBShwUlIs3FBX80zspP+86CMCeuDYQr/xbVQgAOGtYZR
	bIKO8r46kqZppm5MUE7lEmC1kAD6cdU=
X-MC-Unique: Dk8FM5SJOG-VT4-BZPZNpQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Pb3GF/sl3TsQ9+hGlNgBRxILL86YSemhdMR37UVTtYWQ8UFZSgUXvKb0J56w6ZaSODT9heJ4C5sbFCNrBbLuQQz+bKahREuT5v4SRSg6J1KFKm++gg/0Cu/4pEEQ3r+/LNd+FR2BcUC/9m5Q1wVceKbBiOj5A6kS1YEyxu3w0bAqUgOAgAwv0/OS5cH9A59gHAb2KOzlMpK8lDUZFR2P62XlkEtSm8I5kAOXLHKxS9T1R7lWLW3LHrPSknYGy3gCWMt6C4Z5XphlCfgy7Te+Jgv08lSr3A+iL6M75qZhEFkNlkzt78HVd1xR3D5nd4tirXvH49l+Zg/Hq6y38cZ/6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LsNLX9HKlarzxpykQvdNVa6gyEF5+GjGf0wJ34RvpBg=;
 b=DYq8KP4ntnvHr61lLEmcYGn7qry63wq2VPVwQVYUWoCocULbxwPgAs40COkiZ76XNvwbP4fXJSNXjGuseFnkEg7YfDeDKPhF9ibJq9atVzY1o0l1+GaAGGaQZ1IeJHAE9SA/PqSkfHdRwxUN7p7dw9yK7AgXXDT0EIOMwriF85bfhtpcC3FpurZCZnGAX0bYHzdVpyBG883ZqhPDvidUZKDmpeGHCQLTAMsym4WFpAU9ADv36KpAxyjbON5RfaoqAu8SphzgimACYz4xVu1RHSLZNwmyR83bJ3UZ1ALGb9TViIrUA4q06G3ESh9Y0ep77V6MPjYksI4BYJeAY9F2wA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <4e9924f7-fdfa-c3c3-7b6c-e5cbe77ff9ac@suse.com>
Date: Thu, 17 Feb 2022 11:42:03 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH v2.1 6.5/70] x86/kexec: Annotate embedded data with ELF
 metadata
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20220214125127.17985-1-andrew.cooper3@citrix.com>
 <20220217100158.22402-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220217100158.22402-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0231.eurprd06.prod.outlook.com
 (2603:10a6:20b:45e::28) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: eff7a023-f55a-4f72-364d-08d9f2022390
X-MS-TrafficTypeDiagnostic: AM8PR04MB7395:EE_
X-Microsoft-Antispam-PRVS:
	<AM8PR04MB73959070E2676F254E966A41B3369@AM8PR04MB7395.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	AXHQhYffjL+0D7jDOQuRTFHxQxrafGm9D7CzCKub8Bpzxw5MkGOBzwoLsMF4crBqWK9gHo1M7pxhOdEEZPaLtadmhtq/LaFo6XLT2TBo21LoyAaYgVTaYPo5ZHy35jd7r5VAJpA4TRf8qmUVH7fAW0432SQbvz/X5oJRreTXAxHYoOP+XikPpeSASwHOrh8EffmCZj82KQATsX/LasO/iwP9KUOi4r0nFZ7jjbbb7rKnnCYCmBby8g5FBC5uFvLf3mwoOFgfijOdZjgdNxD5egtQkxRWZ4LpqBoOjG0xU4GY1LllXBHBFTzdTkDBpC3OdUEsNqQoo/35jPSEuPVclIrlMILKlRMVH8qofnPruZb7MkdbgpD9CJDCaCo9qLvJ/QRZ4dFnQNtm6Vac+gSzKmt8kTQ31z0+y18DV5L9GNkd8CT8K9vYlFDVCMD4a4FbSIIN9ZpaXP6QkL5OgEShn+tWd5x0eESVMkAoxgi1VFwgiXAe51pd5veuFH6jAxuLoEOqK596KISVoG8IH6MD/0XI266bDe1JiQ0U/uwDxRrTsQ85Y/7Yu7VuGyNb2IwU6iZSDrz7RZretx91BjtVKk9mqxS5ONhgjnU/XCG1kfMdpxsJEpZbYWwdN22ny6RaZLJs9vJZI5pe16eQvC0uHI3Glfv3b2CTEiuVN5acJMeuKFUaO58NPH4XgfsgRh6yJTPeUxMYdCrwVu5GlbFa2x7aP6ibr1AkW+m2d54IIOcmmkBDqI+S/XyWpauNG7At
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(38100700002)(83380400001)(54906003)(5660300002)(6916009)(316002)(66476007)(66556008)(66946007)(4326008)(8676002)(2616005)(8936002)(6486002)(186003)(26005)(2906002)(508600001)(6512007)(53546011)(6506007)(31696002)(86362001)(36756003)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SDlxaVdkZ0d6SHVmcWZZT0NjVVhFN0UzQXkrSU40Rjd4c2VYM3pDZXluN0VS?=
 =?utf-8?B?SHpCY0tFdjkyT2I3V3ZyOFYzY0Q5R3plRWNBa3R4TXJHRVJMT01BdVlBUGFj?=
 =?utf-8?B?RGxKY3JkeitWbW9BRWtyS09lQVFaTWUzUlU2QWJYRlhqeG44aHZwdWRDa0p3?=
 =?utf-8?B?SU1OT3JTeldCc2tIdndRc2c2cks5U21CZmEyYzU3L3ZpRjlyb0JRK1p0VERC?=
 =?utf-8?B?eG9uSUhHZlQ5RDl1TUVEYTAyejBtNkh6dGI4NGRDZ1J3R0FvTHZFY2NacHV5?=
 =?utf-8?B?cFJxdHEvaE9NaE94aFVidHNaNncwVlFGV25nNldsbUdKYllHcmJMdGw4RGpr?=
 =?utf-8?B?RTJpU1dDZ2xEMklvN1JqSURubE1KSkg4VnpYZzMwVGpwOG82TGZBYkU3NXlm?=
 =?utf-8?B?VzlMYVdVQklzYUNaVjlpQWlQVjlORzMrN0lLdjkxRFhZL0ViQ0VsekVrS3Js?=
 =?utf-8?B?TDlyVXZqYXhrZzZCK0dHWlhjZGg4MnA4cHJXVGRmMmJPV3BKMmRxdDRxNkNN?=
 =?utf-8?B?U2JqOVNLQ2FpME05TUxBcUJVRVZ0L2ltOWFNNmRFN2JZcDM2L1dFRHlaOXQ5?=
 =?utf-8?B?Tk5XTUEvQ05rKzV2MW9jbkVUK1NJZTNWdTROY01VcHpwQ2k5QTMvRTd1NEVE?=
 =?utf-8?B?cG9nNVJFWTRHQ3lFK05ZSkMrYnk1M0tIbnJ4SEJJRmxmbXJZUnp3UkV1TG0y?=
 =?utf-8?B?dWhKY1VyM25pQ0t2WEYvUFJRNnRQb2pFUTZMb3BLTURramlhNm45QXFKem8z?=
 =?utf-8?B?WjN0bWlsR0pmZW5WeWNiazg5QTRGRVJrNlprTVdGemlnajgvbFJ1Q2xTaTNH?=
 =?utf-8?B?U1JLcFFvUjRqU21NSDdDWTNjbDZpNVI2MnNTVjB6Q1R3cnBrMnZhUHpaNDJO?=
 =?utf-8?B?cWl2ZEo4QTkwekhkbHkyblBOVGNFS1ZvcnUxaXFFZXlOWmsweEExcTdISmMv?=
 =?utf-8?B?TEZVL2JMcG83UmxsYnF6cmRZQnRTbyt4aEtFVmhFSGxBVVkxaVFSY0ZqR3pZ?=
 =?utf-8?B?emp0T1RmSUh4YXpRRWJ2L010eHozN3dENTZZcmtHRERHdFN5Q0hFdG1NeHdq?=
 =?utf-8?B?Qlh2b0c4OHE0NzFnY2tFemR1MUM4dS9PNFdpV1hXODhvLzBxbVJ0VVV6MFZR?=
 =?utf-8?B?VXp2UkhLS0NydE5PZ0trWjJnNFU1dm53Vi9DaHZmbTB5aXVJY2tzWmt5eGsv?=
 =?utf-8?B?M2FoVlM4TmMyblRSUXpEUXJGcTVqWnozNS9aamtseHVIa1ZsSUNPbEJoNmN3?=
 =?utf-8?B?Y2RyZUdrVll2NlUxMERWeFF3a0NXNXpuUTYvam5rNk0xYXNQRW1QbUtORnJQ?=
 =?utf-8?B?czFMdUY1Vmt5ZW1KeGg4UVpka0NWbXMzQ0k1aXJOZTJtOU8xZHI4cWxxcXJB?=
 =?utf-8?B?d3pqdlQ5TUxmdlF3RzJIVlVuOC9vdE04TnhyWFF6bjFzZ3d3UkwyUjdPeElm?=
 =?utf-8?B?NjRkT3hySkRnQXdvbG5mUmE3bk5MczBqTEpCL0VESndqQmgrUU1rSzB5T1dv?=
 =?utf-8?B?dlhqQW92Z0NzaGpYVkt6Ym1ib0FDdmRwRExjWXZBUU5TNk5tbTk3eXR1UUpj?=
 =?utf-8?B?UXVGai83ZU1hT01rWms5RzY0aEJmdkVMWjVLa1lEMTRFdUg5U3RTUFg2R05U?=
 =?utf-8?B?NnNYVmkzNnVvZXZHV3hJTGZTN3pEZmdBMmlBL0s2TjZieTZKc2Z3Q2J2RDI5?=
 =?utf-8?B?dUpHQWpKYVNrSm1pcFQ3bThxa3ZZOGZJMk5nKzdhZTdVM3NFbWdVUG8yV1hu?=
 =?utf-8?B?aEtKRGJjY050M2QxQ3E3MW9kTzlYNTQvS0Flc3QwSW5VMnczTGNESUJYWFI3?=
 =?utf-8?B?bzhjcGlNN0YyRERJV1lFaUxOWUtHUEpWU0x0TlNFWG8ycTdEcDVwSDgreStw?=
 =?utf-8?B?dTZ4S2FUWXdSZjM5RDdwVEtET2dRMVYzaXAzSTRpbjVOZFFEeFB0MVZCQnQ3?=
 =?utf-8?B?eXFzbXA2U3RUQUZLSzBqWURMMjRwWDBxQW01cmxFSmhuL1d1RExYSXlnR0Vq?=
 =?utf-8?B?VS8rQit4S293Nkg4elBsQTZ3dm8vMk5qOGxKZzlIS1kySGFYcE44dytkZTJC?=
 =?utf-8?B?bVRZSXRaeTZ3d3BIYkFGb3FxTEMzN0NqbDZMakF0bWVZaHBXa3pzNFRoVmhk?=
 =?utf-8?B?NjIrbGhyWVRPRS9rKzY0b2ZhNWVpWi9LMmdjNllwakRpZ0pQTHA5TVVqcTY2?=
 =?utf-8?Q?1t4ViUVv1iStxShX5z/dihI=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eff7a023-f55a-4f72-364d-08d9f2022390
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2022 10:42:05.1395
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t4L+d+jq5A+r3LyqCn7LXA3EhuM6uu82hpj6b+LbR9OI1X6zs2/rj7QMtAiybtAe+cWCmcMD1lhtr5QiCLPSzg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7395

On 17.02.2022 11:01, Andrew Cooper wrote:
> Scanning for embedded endbranch instructions involves parsing the .text
> disassembly.  Data in the kexec trampoline has no ELF metadata, so objdump
> treats it as instructions and tries to disassemble.  Convert:
> 
>   ffff82d040396108 <compatibility_mode_far>:

What about the (possible) padding ahead of this? Should the .align
there perhaps specify a filler character?

>   ffff82d040396108:       00 00                   add    %al,(%rax)
>   ffff82d04039610a:       00 00                   add    %al,(%rax)
>   ffff82d04039610c:       10 00                   adc    %al,(%rax)
> 
>   ffff82d04039610e <compat_mode_gdt_desc>:
>   ffff82d04039610e:       17                      (bad)
>           ...
> 
>   ffff82d040396118 <compat_mode_gdt>:
>           ...
>   ffff82d040396120:       ff                      (bad)
>   ffff82d040396121:       ff 00                   incl   (%rax)
>   ffff82d040396123:       00 00                   add    %al,(%rax)
>   ffff82d040396125:       93                      xchg   %eax,%ebx
>   ffff82d040396126:       cf                      iret
>   ffff82d040396127:       00 ff                   add    %bh,%bh
>   ffff82d040396129:       ff 00                   incl   (%rax)
>   ffff82d04039612b:       00 00                   add    %al,(%rax)
>   ffff82d04039612d:       9b                      fwait
>   ffff82d04039612e:       cf                      iret
>           ...
> 
>   ffff82d040396130 <compat_mode_idt>:
>           ...
> 
>   ffff82d0403961b6 <kexec_reloc_size>:
>   ffff82d0403961b6:       b6 01                   mov    $0x1,%dh
>           ...
> 
> to:
> 
>   ffff82d040396108 <compatibility_mode_far>:
>   ffff82d040396108:       00 00 00 00 10 00                               ......
> 
>   ffff82d04039610e <compat_mode_gdt_desc>:
>   ffff82d04039610e:       17 00 00 00 00 00 00 00 00 00                   ..........
> 
>   ffff82d040396118 <compat_mode_gdt>:
>           ...
>   ffff82d040396120:       ff ff 00 00 00 93 cf 00 ff ff 00 00 00 9b cf 00 ................
> 
>   ffff82d040396130 <compat_mode_idt>:
>   ffff82d040396130:       00 00 00 00 00 00                               ......

With the .size directives added, can we rely on consistent (past,
present, and future) objcopy behavior for padding gaps? It just so
happens that there's no 4-byte gap between compat_mode_gdt_desc and
compat_mode_gdt. Changing the .align ahead of compatibility_mode_far
would eliminate the risk of padding appearing if the code further up
changed.

>   ffff82d040396136 <reloc_stack>:
>           ...

Now this is particularly puzzling: Us setting %rsp to an unaligned
address is clearly not ABI-conforming. Since you're fiddling with
all of this already anyway, how about fixing this at the same time?
Of course there would then appear padding ahead of the stack, unless
the stack was moved up some.

> @@ -175,10 +175,16 @@ compatibility_mode_far:
>          .long 0x00000000             /* set in call_32_bit above */
>          .word 0x0010
>  
> +        .type compatibility_mode_far, @object
> +        .size compatibility_mode_far, . - compatibility_mode_far
> +
>  compat_mode_gdt_desc:
>          .word .Lcompat_mode_gdt_end - compat_mode_gdt -1
>          .quad 0x0000000000000000     /* set in call_32_bit above */
>  
> +        .type compat_mode_gdt_desc, @object
> +        .size compat_mode_gdt_desc, . - compat_mode_gdt_desc

Side note: We really ought to gain something like OBJECT(name) to avoid
c'n'p mistakes not updating correctly all three symbol name instances.

> --- a/xen/arch/x86/xen.lds.S
> +++ b/xen/arch/x86/xen.lds.S
> @@ -87,6 +87,7 @@ SECTIONS
>         *(.text.unlikely)
>         *(.fixup)
>         *(.text.kexec)
> +       kexec_reloc_end = .;

Does this maybe want aligning on a 4- or even 8-byte boundary? If
so, imo preferably not here, but by adding a trailing .align in the
.S file.

Jan


