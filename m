Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C9B84747F88
	for <lists+xen-devel@lfdr.de>; Wed,  5 Jul 2023 10:24:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.558828.873259 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qGxoK-0001YW-11; Wed, 05 Jul 2023 08:24:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 558828.873259; Wed, 05 Jul 2023 08:24:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qGxoJ-0001Vp-Rr; Wed, 05 Jul 2023 08:24:27 +0000
Received: by outflank-mailman (input) for mailman id 558828;
 Wed, 05 Jul 2023 08:24:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dIgq=CX=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qGxoI-0001Vj-4u
 for xen-devel@lists.xenproject.org; Wed, 05 Jul 2023 08:24:26 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01on2080.outbound.protection.outlook.com [40.107.13.80])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 59487273-1b0d-11ee-b237-6b7b168915f2;
 Wed, 05 Jul 2023 10:24:24 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DBAPR04MB7301.eurprd04.prod.outlook.com (2603:10a6:10:1a7::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.17; Wed, 5 Jul
 2023 08:23:55 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::9bd3:48c9:ff58:9880]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::9bd3:48c9:ff58:9880%4]) with mapi id 15.20.6544.024; Wed, 5 Jul 2023
 08:23:55 +0000
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
X-Inumbo-ID: 59487273-1b0d-11ee-b237-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Jt/1kXTXvCHxycOkJSj4KJvixTT6Z6FZ7voH0tKiO4Y/DZkCkU4HMmLC6+DP9sOfvHphwc8kgcS3ntBqVCOTpJ7DyxjswJAogZcAUopVzWwHTeYiAjOGUqlC4PUxAN87BtfeeGk3nJQIlZnynlsmfSk4SIRG5vec32poBEBtv9DbECnw3oMf/XhWcR18Km63bDntO5X9XUmpUMXU3x6dkcxYbPcHz0IJvdZQ+ZnKlGWrK/dbB/FzhYLlETND4b6cZOdt5/OeSOQUdcITVSJHg9II7xt0KNew6qIrkiblRvTZsAfbzLq7wXABzCOr1RL6mKuWfymS6K583LYLSfvc6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gzP53CUvL61s5cwnMZVLJQ+3rnRe65zdq1D2pvuVoc8=;
 b=odI3JXyVxfTGukZLnShlZWHnswAV0I5EiMUFELoiHla3ulwod97BsK+vwLb6+uCg9dOv9QR/2IELEmB5gC3z2PKRtRdUFQ1ndjnmiahkveFWPxTZsvLoThbA1ncHEYp+n5h1V4L9IDWrMYARJB2ltIFhgAtInwYOsQ7ca77seT6sxSXzOhZxN8ObiU8zUJbPOBWWfrC90LTL3hXTHAcRI3tNTAUp62zT4BhTOFN3+63w/6GtwAi/1FehTemCUSJeh1dW1bo7j2WOJ9LpSBLN3ELXhObXWY1pVA6t5uLBVvFICGesLUdbClAJut9DNxg97XTM8D7R8eYH1cjKKQmO1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gzP53CUvL61s5cwnMZVLJQ+3rnRe65zdq1D2pvuVoc8=;
 b=kgv9Mz6IC4RsdgqFKJNg95kusKJ8tR7Ql9r1t5uxyswhTYJ0fQfmoEtFVX5CTk+cOLAsRuvhfnvfKfDuCJ+VczDD0qgazRpdWL+EWrKG+qyA0rIvyFxmW5RhmhtcFsTthmoSZamdLd4pDMO24cfLDzz7H2HvNuT0ay0l68yYrUugTwC7GjNf8aSCcp9sNt+O0Sp1wslxBm77mZjuFzHeMwMS4dS9DRP8IQDNHEdT+YKXeAYSMVX5i9pmJzM5XVT6BTuGuqS+YKKqZfEm2YwBc2exUmesmerPB+QwdsocjdUe9so/Q4j6CxU604GLdgtgR3oEJ0wqEmLxGAPaB/5LlA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <3773dc6e-9d36-ba80-2a0a-bb1589c9993f@suse.com>
Date: Wed, 5 Jul 2023 10:23:53 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2 1/2] x86/mm: add API for marking only part of a MMIO
 page read only
Content-Language: en-US
To: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>
Cc: Paul Durrant <paul@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
References: <cover.dd82aca339854e90ffe12e7bc4298254a6caaf0d.1683321183.git-series.marmarek@invisiblethingslab.com>
 <def382a6481a9d1bcc106200b971cd5b0f3d19c1.1683321183.git-series.marmarek@invisiblethingslab.com>
 <f3531050-fb31-2d9e-f3dd-2d310dc7c5ec@suse.com> <ZJ9XFdGhxyKLY3fm@mail-itl>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <ZJ9XFdGhxyKLY3fm@mail-itl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0149.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:95::20) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DBAPR04MB7301:EE_
X-MS-Office365-Filtering-Correlation-Id: f3b53a5e-5e89-4b51-a533-08db7d312c0a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	rhr4mqgpENL4H2PBbTTnUGiFHVl30rSwcKQ5NO4Kiu+8jOkyrn/PnMrX+0xv+8w8L8hpOvbjBtcQ7Fs3CAUYdsoPLs6/u1Wtp+KTI5JNtA42/lX/Ws9XCXjvhnU9eV6eKPEQXOiGo+12QiL9bBwkNfOJsU5KRaVSxLQjESXzFoLw6BVVb1V8Y0wDCvSLtR/K6VrC2bZ0zjIWsqHmOqt4m36FGHGFeGlAxgfW1VdjBBMg4LLduSEfMKLYhr1ICDiaCahy6K37BF1QADVjWrbnJivGb/WVDTMLeWX2ovYd3mggxvaJ20lhpEHxzPE48y4XOxmslp9E/Og1m3WSumNxTBADZdePvuQgovoe/2EXO5EWCHuFcrQMR7zYRkvUCX0C7Gms1YW4IATr5ZtNRtQd2K/j0eOzot3WiLcKCbfqEDHz0DxdgGkDJGDWis0yfRrBQOHBCzd1t8bCrgEc0VKVKNr95gVF5ugsVzzvQrMQtHmF9waxP/JJ/5OUY8nNq0ZUZ50Wq/Y9DrOKQooNCMWpVgYU68MmTkAEt1sYuaJV4VHRIIq4GCexBxVTLf3IzHqJldgGtcnBCG0G3hNc4VmqfEyLinY0DN9jOMla7qVdk2T5i8BYdIMw8UzYYUkTeG5WZwTOpDGXsfJPCcSWNAoRzQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(346002)(136003)(39850400004)(366004)(396003)(451199021)(31686004)(2906002)(66899021)(5660300002)(86362001)(31696002)(8676002)(66556008)(8936002)(2616005)(6506007)(54906003)(53546011)(6512007)(6486002)(478600001)(26005)(186003)(30864003)(38100700002)(316002)(66574015)(83380400001)(4326008)(66476007)(66946007)(6916009)(36756003)(41300700001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?T2pucHlJT24vT212WVFNOHVwaWplaWx3Ym9CQ3NnMHRJZnJFaFNhSjBjQ0lO?=
 =?utf-8?B?WDZ2TzhvZVZSOXF2RUVSYVpRSlBTUEJPaEU2NFRMbE9UbVlBWGlIWHBpQ1E0?=
 =?utf-8?B?T2RRR3UySEVXTlcwK3VBOEVJaXVmRU1YbDBraXhYRXlyUVNmaUZPZTI0bW1J?=
 =?utf-8?B?d2RrY0tpMnJTNTNCZ1IwMVpiWWZwcVUzSktRV2FtK2xyb0pVQ1plRGdJN2Fo?=
 =?utf-8?B?Q2hFeWd2ck9FUVBTTGI0bjVNUDVFVmpSRGoxOUVSbjlUSkI4UkdHb1ZvZStt?=
 =?utf-8?B?MGFZYlZZSDdaenpkU0VoK3ArVVVOWiszUk1yWldLbVFySVZaUlNlRGRrZHF4?=
 =?utf-8?B?My9BTXRrOGxvU01ZTEJ3ODdYUmUzRDJwZDNNK29ZRWJmR3AvL0oydlB3c1k5?=
 =?utf-8?B?WEwyS1dlZjdIbjh5amJWYzVpbnN6bnBlZE5sSVV1b2h4ZzVtUGxrUUp5RlFm?=
 =?utf-8?B?RGJGRmNOdTNIODBvMlljZmw2c2hKYi90K3drYkw0Y3RUeXcyNkw2eHB6ZUpK?=
 =?utf-8?B?U1A5MzU5VCsrYTZ2ZFFSUTZLRGdOQ3I2Wm1Fam15aWtMalpuYjhnV3RwVkhE?=
 =?utf-8?B?NUdVSlN3MVBIY2ZBWjZLN2MwZjlKVE00UHB3blJpL0tWNFYwaWpDL3ZVMzJQ?=
 =?utf-8?B?MDlNUkJtTVVLU0ZMS25GdVA3c3VPWFdFRlgrTVRKNUF4TTN6LzVpUzlsQStX?=
 =?utf-8?B?aVUydk9hUHpVUDR1RzlndG9JNmt0a1lMS25vMUZwU283VDRGblVlLzVWaDds?=
 =?utf-8?B?Smk5NnBleGd3SDFPWFdZckxnUVFmdEdQbnpBSGh1SXBScFVaM1JENFQxVW1I?=
 =?utf-8?B?eGlhMjZZSlRQUXc3dnA2ZGY1V1F5MzhiY29qc2MzY3BPWmNjbEl1WEFlOWxS?=
 =?utf-8?B?cVVjeGpQODU4V3pjYytpSXh5MkhsTU5xS0NPcGRUcmdzYmRhK2ZlRFd4WGJv?=
 =?utf-8?B?RWNTV0RUQlRBaVNKSmcyM3o4eWZBRmJsTktMYld4Y1hsUDRibHEwZTNOeG9E?=
 =?utf-8?B?eFprMksxc1lBeXVOUnRNUGFMc0xDTkxEODdtMVBFRWw4Nm1ZcEVjTExycENw?=
 =?utf-8?B?YXA1Slk0bXBxakVDaWI0YVNpWHJOMExCa1FBa1lXVHlUN3h1WVpqc3NPaDgz?=
 =?utf-8?B?SDI3RHp4UTVVVU82cHJyMFBJZFJpYzBKR0pra3dOWTJSYVNXSC9iSkdLN25D?=
 =?utf-8?B?cEtwcU5oelY3Mk5MTkY4L0luT3hCSHRYM1h2RHpCK3dBMnFnQnFxZTViZmtC?=
 =?utf-8?B?RkhycTFaM3RIUTBtYVhoUWZMY3Q2eXd3T1ZzRFhaQVJVZFdNQ2VyaFFPM3Yr?=
 =?utf-8?B?dzlRVnovZGFEeEt4VlNNVXd6Wkdac3o5TXNmbmM0ZklNYkR1aCtPS0ZUSEln?=
 =?utf-8?B?YmFIWkhBVkx6c2dENkM5azIvZ01kbVk5b1htL21HdWU1ZXlHWWpVQk9LSzdU?=
 =?utf-8?B?dnZLNGNqaWRKOVJiR0xYRlJrZkkzZG85VHRxWlIzMy9NNjRpWk1mQ09yY2ZU?=
 =?utf-8?B?bUlITU5VamtvMVE3bzZGT2FTckhYTkVWS2tQRWc3eGdJdDBVdXgzZDBDUlJT?=
 =?utf-8?B?WnY4cTlDRUkyT3Zza01walE3R0Vlazd3c1h1K0R1VGoxYllMWm5iL2EyQ2s5?=
 =?utf-8?B?U2ZGc1hGc2J2a1pMeHhJbk1XUUlsT1pnUGZJcUs2STREUDlNSmUzY0M0R0FQ?=
 =?utf-8?B?VWZyRDRkL2FVMXlrRGxRVmZxSzV5YXVaWDBCcXNHMGRWQ2VyTXFCazU2cVRt?=
 =?utf-8?B?c0tmRW9NUloxQjQzaWlva3ZYeStzZlh0aDVOa1FHOVE3cVBKU2dXc1kzUE5n?=
 =?utf-8?B?VmdKYk0xdXRyR0FpRmJ4VS9CYWdMWk41dzMrTkxTbzFCWGVCV3FhWDk4Tmhk?=
 =?utf-8?B?STkxeVh3U09pbWh3aDk3V0NaeU12YXJvNC9vakgzT0IrY3NlY0hmUzdESDJj?=
 =?utf-8?B?UkxjTWtBam95djdKSVZVTDZTVHpuSmtRcXY4YXRTUkU3a05CMm02ZlM2cXBY?=
 =?utf-8?B?Nmpac1h4OW8xNDZoZUF2aDNGSTcrY3h1OEJCbWppK01vM283alRHRVZVeXZO?=
 =?utf-8?B?cWpVdGE3WWtMbVhpYWx0RjJLSTI1NnhoQU0rUzFQRjExVXZoWGN2SW5CN2lP?=
 =?utf-8?Q?4gt398khnfR31PWWlWr9U8PzY?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f3b53a5e-5e89-4b51-a533-08db7d312c0a
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2023 08:23:54.9885
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p79hWwmMrigjilyewC/L5kAZtXC57S6IPi14AfRlrHkXpe5iWzZUg6NdGHBwqaUcknBABLHLyXOcyirQDiLvlg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7301

On 01.07.2023 00:28, Marek Marczykowski-Górecki wrote:
> On Tue, May 30, 2023 at 01:56:34PM +0200, Jan Beulich wrote:
>> On 05.05.2023 23:25, Marek Marczykowski-Górecki wrote:
>>> In some cases, only few registers on a page needs to be write-protected.
>>> Examples include USB3 console (64 bytes worth of registers) or MSI-X's
>>> PBA table (which doesn't need to span the whole table either), although
>>> in the latter case the spec forbids placing other registers on the same
>>> page. Current API allows only marking whole pages pages read-only,
>>> which sometimes may cover other registers that guest may need to
>>> write into.
>>>
>>> Currently, when a guest tries to write to an MMIO page on the
>>> mmio_ro_ranges, it's either immediately crashed on EPT violation - if
>>> that's HVM, or if PV, it gets #PF. In case of Linux PV, if access was
>>> from userspace (like, /dev/mem), it will try to fixup by updating page
>>> tables (that Xen again will force to read-only) and will hit that #PF
>>> again (looping endlessly). Both behaviors are undesirable if guest could
>>> actually be allowed the write.
>>>
>>> Introduce an API that allows marking part of a page read-only. Since
>>> sub-page permissions are not a thing in page tables (they are in EPT,
>>> but not granular enough), do this via emulation (or simply page fault
>>> handler for PV) that handles writes that are supposed to be allowed.
>>> The new subpage_mmio_ro_add() takes a start physical address and the
>>> region size in bytes. Both start address and the size need to be 8-byte
>>
>> 8-byte (aka qword) here, but ...
>>
>>> aligned, as a practical simplification (allows using smaller bitmask,
>>> and a smaller granularity isn't really necessary right now).
>>> It will internally add relevant pages to mmio_ro_ranges, but if either
>>> start or end address is not page-aligned, it additionally adds that page
>>> to a list for sub-page R/O handling. The list holds a bitmask which
>>> dwords are supposed to be read-only and an address where page is mapped
>>
>> ... dwords here?
>>
>>> for write emulation - this mapping is done only on the first access. A
>>> plain list is used instead of more efficient structure, because there
>>> isn't supposed to be many pages needing this precise r/o control.
>>>
>>> The mechanism this API is plugged in is slightly different for PV and
>>> HVM. For both paths, it's plugged into mmio_ro_emulated_write(). For PV,
>>> it's already called for #PF on read-only MMIO page. For HVM however, EPT
>>> violation on p2m_mmio_direct page results in a direct domain_crash().
>>> To reach mmio_ro_emulated_write(), change how write violations for
>>> p2m_mmio_direct are handled - specifically, check if they relate to such
>>> partially protected page via subpage_mmio_write_accept() and if so, call
>>> hvm_emulate_one_mmio() for them too. This decodes what guest is trying
>>> write and finally calls mmio_ro_emulated_write(). Note that hitting EPT
>>> write violation for p2m_mmio_direct page can only happen if the page was
>>> on mmio_ro_ranges (see ept_p2m_type_to_flags()), so there is no need for
>>> checking that again.
>>
>> Yet that's then putting us on a certain risk wrt potential errata.
>>
>> You also specifically talk about "guests", i.e. more than just hwdom.
>> Adding another easy access to the emulator (for HVM) comes with a
>> certain risk of future XSAs, too.
> 
> There are a lot of ways where a guest with a PCI device can exercise the
> emulator already, no? And even without PCI passthrough, more or less any
> device backed by the device model allows that too. So, while emulator is
> a complex piece of code, I don't think this patch makes it easier
> accessible in any significant way.

Hmm, "easier" was perhaps the wrong term. The emulator doesn't normally
come into play when guests access MMIO regions of passed-through devices.
That's different here. You're right that the emulator is always involved
when accessing MMIO regions of emulated devices.

>>> --- a/xen/arch/x86/hvm/hvm.c
>>> +++ b/xen/arch/x86/hvm/hvm.c
>>> @@ -1990,6 +1990,14 @@ int hvm_hap_nested_page_fault(paddr_t gpa, unsigned long gla,
>>>          goto out_put_gfn;
>>>      }
>>>  
>>> +    if ( (p2mt == p2m_mmio_direct) && npfec.write_access && npfec.present &&
>>> +         subpage_mmio_write_accept(mfn, gla) &&
>>> +         (hvm_emulate_one_mmio(mfn_x(mfn), gla) == X86EMUL_OKAY) )
>>> +    {
>>> +        rc = 1;
>>> +        goto out_put_gfn;
>>> +    }
>>
>> But npfec.write_access set doesn't mean it was a write permission
>> violation, does it? 
> 
> Doesn't it? IIUC it means it was a write attempt, to a mapped page
> (npfec.present), and since we've got EPT violation, it got denied. 

But the denial may have been for reasons other than the W bit being
clear, at least in principle? Abusing the bit now, even if in
practice there was no other possible reason on existing hardware
with the features we presently use, might lead to hard to locate
issues in case a different reason appears down the road.

>>> --- a/xen/arch/x86/include/asm/mm.h
>>> +++ b/xen/arch/x86/include/asm/mm.h
>>> @@ -522,9 +522,24 @@ extern struct rangeset *mmio_ro_ranges;
>>>  void memguard_guard_stack(void *p);
>>>  void memguard_unguard_stack(void *p);
>>>  
>>> +/*
>>> + * Add more precise r/o marking for a MMIO page. Bytes range specified here
>>> + * will still be R/O, but the rest of the page (nor marked as R/O via another
>>> + * call) will have writes passed through.
>>> + * The start address and the size must be aligned to SUBPAGE_MMIO_RO_ALIGN.
>>
>> With this alignment constraint, the earlier sentence can be read as
>> controdictory. How about "Byte-granular ranges ..." or "Ranges (using
>> byte granularity) ..."? I admit even that doesn't resolve the issue
>> fully, though.
> 
> I don't see where the issue is, alignment requirement doesn't change
> anything regarding the parameter units.

And I didn't say it would. What I said is that starting a sentence with
"Bytes ranges specified ..." is ambiguous in potentially suggesting to
a reader that arbitrary ranges at byte boundaries are permitted. Which
can then be taken as contradicted by the subsequent sentence about
aligment requirements.

> Anyway, I can change to one of the suggested versions.

Well, something even less ambiguous would of course be yet better.

>>> @@ -4882,6 +4895,243 @@ long arch_memory_op(unsigned long cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
>>>      return 0;
>>>  }
>>>  
>>> +/* This needs subpage_ro_lock already taken */
>>> +static int __init subpage_mmio_ro_add_page(
>>> +    mfn_t mfn, unsigned int offset_s, unsigned int offset_e)
>>> +{
>>> +    struct subpage_ro_range *entry = NULL, *iter;
>>> +    int i;
>>
>> unsigned int please (as almost always for induction variables).
>>
>>> +    list_for_each_entry(iter, &subpage_ro_ranges, list)
>>> +    {
>>> +        if ( mfn_eq(iter->mfn, mfn) )
>>> +        {
>>> +            entry = iter;
>>> +            break;
>>> +        }
>>> +    }
>>> +    if ( !entry )
>>> +    {
>>> +        /* iter==NULL marks it was a newly allocated entry */
>>
>> Nit: Even in a comment I think it would be nice if style rules were
>> followed, and hence == was surrounded by blanks.
>>
>>> +        iter = NULL;
>>> +        entry = xzalloc(struct subpage_ro_range);
>>> +        if ( !entry )
>>> +            return -ENOMEM;
>>> +        entry->mfn = mfn;
>>> +    }
>>> +
>>> +    for ( i = offset_s; i <= offset_e; i += SUBPAGE_MMIO_RO_ALIGN )
>>> +        set_bit(i / SUBPAGE_MMIO_RO_ALIGN, entry->ro_qwords);
>>
>> You're holding a spin lock, so won't __set_bit() suffice here? And
>> then __clear_bit() below?
> 
> Right.
> 
>>> +    if ( !iter )
>>> +        list_add_rcu(&entry->list, &subpage_ro_ranges);
>>> +
>>> +    return 0;
>>> +}
>>
>> Since you mark the qwords which are to be protected, how is one to set
>> up safely two discontiguous ranges on the same page? I think I had
>> asked for v1 already why you don't do things the other way around:
>> Initially the entire page is protected, and then writable regions are
>> carved out.
> 
> Because that's not how the API is used. This API is for those how want
> to write-protect some specific ranges (to be written exclusively by
> Xen). They don't need to even know what is else is on the same page.
> Take XHCI case as an example: it gets the range to write-protect by
> enumerating XHCI extended capabilities, which is a linked list. The
> driver gets info where XHCI console registers are.  Things before/after
> them on that page may not even be XHCI extended caps at all.
> This in fact is very similar approach to already existing
> mmio_ro_ranges.

While I agree there's a similarity, multiple entities caring about the
same MFN isn't an expected scenario there. Whereas here you explicitly
add support for such.

Furthermore you sub-divide pages covered by mmio_ro_ranges here, so
defaulting to "full page protected" and then carving out sub-regions
would be the more natural approach imo.

>> I guess I shouldn't further ask about overlapping r/o ranges and their
>> cleaning up. But at least a comment towards the restriction would be
>> nice. Perhaps even check upon registration that no part of the range
>> is already marked r/o.
> 
> Yes, this is a good suggestion, I'll add that.

As long as all restrictions are properly spelled out, this may be
sufficient. But please don't be surprised if I ask again on a
subsequent version.

>>> +static void __init subpage_mmio_ro_free(struct rcu_head *rcu)
>>> +{
>>> +    struct subpage_ro_range *entry = container_of(
>>> +        rcu, struct subpage_ro_range, rcu);
>>> +
>>> +    ASSERT(bitmap_empty(entry->ro_qwords, PAGE_SIZE / SUBPAGE_MMIO_RO_ALIGN));
>>> +
>>> +    if ( entry->mapped )
>>> +        iounmap(entry->mapped);
>>> +    xfree(entry);
>>> +}
>>> +
>>> +/* This needs subpage_ro_lock already taken */
>>> +static int __init subpage_mmio_ro_remove_page(
>>> +    mfn_t mfn,
>>> +    int offset_s,
>>> +    int offset_e)
>>> +{
>>> +    struct subpage_ro_range *entry = NULL, *iter;
>>> +    int rc, i;
>>> +
>>> +    list_for_each_entry_rcu(iter, &subpage_ro_ranges, list)
>>> +    {
>>> +        if ( mfn_eq(iter->mfn, mfn) )
>>> +        {
>>> +            entry = iter;
>>> +            break;
>>> +        }
>>> +    }
>>> +    if ( !entry )
>>> +        return -ENOENT;
>>
>> Yet the sole caller doesn't care at all, not even by an assertion.
> 
> Indeed, right now it's called under the same spinlock that the page was
> added. Would you prefer to drop return value (not relevant until another
> use is added, beyond cleanup on failure), or add assertion?

Taking Misra into account, dropping unused return values would be better.

>>> +    if ( !size )
>>> +        return 0;
>>> +
>>> +    rc = rangeset_add_range(mmio_ro_ranges, mfn_x(mfn_start), mfn_x(mfn_end));
>>> +    if ( rc )
>>> +        return rc;
>>> +
>>> +    spin_lock(&subpage_ro_lock);
>>> +
>>> +    if ( PAGE_OFFSET(start) ||
>>> +         (mfn_eq(mfn_start, mfn_end) && PAGE_OFFSET(end) != PAGE_SIZE - 1) )
>>> +    {
>>> +        offset_end = mfn_eq(mfn_start, mfn_end) ?
>>> +                     PAGE_OFFSET(end) :
>>> +                     (PAGE_SIZE - 1);
>>> +        rc = subpage_mmio_ro_add_page(mfn_start,
>>> +                                      PAGE_OFFSET(start),
>>> +                                      offset_end);
>>> +        if ( rc )
>>> +            goto err_unlock;
>>> +    }
>>> +
>>> +    if ( !mfn_eq(mfn_start, mfn_end) && PAGE_OFFSET(end) != PAGE_SIZE - 1 )
>>> +    {
>>> +        rc = subpage_mmio_ro_add_page(mfn_end, 0, PAGE_OFFSET(end));
>>> +        if ( rc )
>>> +            goto err_unlock_remove;
>>> +    }
>>> +
>>> +    spin_unlock(&subpage_ro_lock);
>>> +
>>> +    return 0;
>>> +
>>> + err_unlock_remove:
>>> +    if ( offset_end )
>>> +        subpage_mmio_ro_remove_page(mfn_start, PAGE_OFFSET(start), offset_end);
>>> +
>>> + err_unlock:
>>> +    spin_unlock(&subpage_ro_lock);
>>> +    if ( rangeset_remove_range(mmio_ro_ranges, mfn_x(mfn_start), mfn_x(mfn_end)) )
>>> +        printk(XENLOG_ERR "Failed to cleanup on failed subpage_mmio_ro_add()\n");
>>> +    return rc;
>>> +}
>>
>> None of the failures here is particularly likely, so perhaps all is fine as
>> you have it. But there would be an alternative of retaining the
>> mmio_ro_ranges entry/entries, allowing the caller to "ignore" the error.
> 
> That is an option here too, but note one of the potential failures is
> about rangeset_add_range() itself, so one needs to be careful about
> completely ignoring the error.

I agree a fair amount of care would be needed. Hence why I did only suggest
this as an alternative for consideration.

>>> +static void __iomem *subpage_mmio_get_page(struct subpage_ro_range *entry)
>>> +{
>>> +    if ( entry->mapped )
>>> +        return entry->mapped;
>>> +
>>> +    spin_lock(&subpage_ro_lock);
>>> +    /* Re-check under the lock */
>>> +    if ( entry->mapped )
>>> +        goto out_unlock;
>>> +
>>> +    entry->mapped = ioremap(mfn_x(entry->mfn) << PAGE_SHIFT, PAGE_SIZE);
>>> +
>>> + out_unlock:
>>> +    spin_unlock(&subpage_ro_lock);
>>> +    return entry->mapped;
>>> +}
>>
>> This is easy to deal with without any "goto".
>>
>> I'm further inclined to request that the ioremap() occur without the lock
>> held, followed by an iounmap() (after dropping the lock) if in fact the
>> mapping wasn't needed (anymore).
> 
> Is it to limit time the lock is held?

That's only a secondary goal. The primary goal is to avoid lock nesting
where it can be avoided: All forms of allocation acquire some lock in
the process, and any lock nesting needs sufficient care to avoid lock
order inversion. As long as allocation is fully self-contained (no
callbacks, no call-outs or other hooks) the risk is low, but imo better
to avoid the risk altogether where (relatively) easily possible.

>>> +static void subpage_mmio_write_emulate(
>>> +    mfn_t mfn,
>>> +    unsigned int offset,
>>> +    const void *data,
>>> +    unsigned int len)
>>> +{
>>> +    struct subpage_ro_range *entry;
>>> +    void __iomem *addr;
>>> +
>>> +    rcu_read_lock(&subpage_ro_rcu);
>>> +
>>> +    list_for_each_entry_rcu(entry, &subpage_ro_ranges, list)
>>> +    {
>>> +        if ( mfn_eq(entry->mfn, mfn) )
>>> +        {
>>> +            if ( test_bit(offset / SUBPAGE_MMIO_RO_ALIGN, entry->ro_qwords) )
>>> +                goto write_ignored;
>>
>> I think you can get away with just a single "goto" by putting the gprintk()
>> (and its label) here.
> 
> write_ignored label is used also below in "default" case (which should
> be unreachable, but still).

Right, which is why I said 'just a single "goto"' (implying a label would
still be needed).

> Do you suggest jumping from default case into here?

Yes, that would be one way of structuring things.

Jan

