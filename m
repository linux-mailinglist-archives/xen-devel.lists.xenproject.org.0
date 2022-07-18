Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E923C57859E
	for <lists+xen-devel@lfdr.de>; Mon, 18 Jul 2022 16:37:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.369870.601436 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oDRry-0004Lo-24; Mon, 18 Jul 2022 14:37:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 369870.601436; Mon, 18 Jul 2022 14:37:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oDRrx-0004JN-VA; Mon, 18 Jul 2022 14:37:09 +0000
Received: by outflank-mailman (input) for mailman id 369870;
 Mon, 18 Jul 2022 14:37:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Pu44=XX=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oDRrw-0004JF-Ql
 for xen-devel@lists.xenproject.org; Mon, 18 Jul 2022 14:37:08 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr10045.outbound.protection.outlook.com [40.107.1.45])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 19624bea-06a7-11ed-bd2d-47488cf2e6aa;
 Mon, 18 Jul 2022 16:37:07 +0200 (CEST)
Received: from AM6PR04MB6551.eurprd04.prod.outlook.com (2603:10a6:20b:fa::20)
 by PA4PR04MB7885.eurprd04.prod.outlook.com (2603:10a6:102:ce::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.23; Mon, 18 Jul
 2022 14:37:05 +0000
Received: from AM6PR04MB6551.eurprd04.prod.outlook.com
 ([fe80::dd30:2cbc:361d:2d1e]) by AM6PR04MB6551.eurprd04.prod.outlook.com
 ([fe80::dd30:2cbc:361d:2d1e%6]) with mapi id 15.20.5438.023; Mon, 18 Jul 2022
 14:37:04 +0000
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
X-Inumbo-ID: 19624bea-06a7-11ed-bd2d-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bOx1L9CN5kG9XDgplRvB91ba5HaikVI6Hp8yRUsEJfpBxjqarA3eA/Bwg0XUuvD9xoAoYI+yJnERX3Oh7wlNv+0llw8wx697/JbtHQyKnEA408GtZJJbbMEK4serEkUD8QX6W0Z8S4EaAo6SWiD6VY8O4gTf6RBkKomCLOoGOwdBYZ4Cz0gcaxuyIzSM9ouhFwcmlqgaGPnuOqX8D8CMPJod5QwsIEoRW+c4lpUXs4/Yy4ni8YZ9NOV8j68eb0GYpt4AGTX/nWTwH4SRT0jpJsKm9A8ed5NVeQ51ux2MSa9eHKKyh9tIJgBx4jxx9PdYedzNdmHsBHoPvay/CYNV0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eoHIU4OiRfWL6eSBDEGpHf/53qf3JoHaxC4d8lWaUz0=;
 b=deLk56bhVuTHNk0x/BpzQJzZmAuTLZkExeNqpoXqKHej/1BVj/t+/+VNI27kvHpCq05YFittPXy17opm/ZMQhYDy7EECa8kIBwqN8w11cSXkx1wpAbzWI6efNxGIevh7vca3IQHD1T7K2KgNGBI5duzF8CifUdORRC0UClPjJc+6GbbY35XqWOSkUjL2QHazwhYXejyo9vSOq+uiOyQPaUfj7o0tu/xkh/PLSt/mJ7VihxtQoT/+ahbRvXDwM1yHo1SHWA2/EiY1wQo+kqQmC8P+jHTHfpkc9R5Ax4dg2kZJz/vcgT0h9V2+2MjltxDzjpVrR+zZAOFkW9PRxgo0Fw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eoHIU4OiRfWL6eSBDEGpHf/53qf3JoHaxC4d8lWaUz0=;
 b=wY9qjX2TF4j3HX0zsVcSokIrr9/wTY5vWwG23elphFnjf9muURXRz/T1m61eC84GoACJOtaSg7jQMOXOcD2MkOhYvoCgk3z7MVbZ+c5jxEWeDEk3oAMI+swfi+tfnxFAQx8iw/RVanGNCTOBByUZ74vPUTsA9E2LqqzCizehVnU4qEy41X5bnfO/Z2oV4XvdODOqLDzulAi7T+8l3rOapHCE1YLFTY2A2Ybyo5/CR/09esmf0CZQXPL50Gk1neyeifMc1xdJRGyulTsUnwVyUa6/AfE2uWeW+3sea7a+0yu/e/+YuvBKDSGGKzoqUihL6lBtIyRkywKSsD61bQCKWA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <81dc8330-909c-ad32-6543-7dd3066b3e00@suse.com>
Date: Mon, 18 Jul 2022 16:37:03 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 4/9] console: support multiple serial console
 simultaneously
Content-Language: en-US
To: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.991b72d99d9e5bd4c2c76791ceb49f1056ce5d1c.1657121519.git-series.marmarek@invisiblethingslab.com>
 <e40a6de7f032c776e889e4ca6d68579fbb3ad57a.1657121519.git-series.marmarek@invisiblethingslab.com>
 <ea93063e-1b18-0d3d-586b-3b1ce048d017@suse.com> <YtVWjta6GJwts+bp@mail-itl>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <YtVWjta6GJwts+bp@mail-itl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS9P250CA0007.EURP250.PROD.OUTLOOK.COM
 (2603:10a6:20b:532::8) To AM6PR04MB6551.eurprd04.prod.outlook.com
 (2603:10a6:20b:fa::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 07e7c606-0ac0-488b-f42a-08da68cafc14
X-MS-TrafficTypeDiagnostic: PA4PR04MB7885:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	51eo5C0O9sRIDvMagZc/XBbaD1xkaaEkscZmJiLQUNXViN0Bza0bDgJ5rEfv2e8z0GiR2a3ZKMwosZKnljESP10h+C4bqtdoGESJYxZswqI92Gf4q7eIXtgDuga88UEj3c9zBlYXcaCiww1wQDQ+2+Fi7tLVeyaMY0tkmvXfS8h4eZ1SGuA+X/84q5OA1YrNfdapSbD9Xf8d9ZcaWOPjGmT44UGHMkU2qmiWilB//ZTgjphrPQ54IWVu2D0Bo7/s0reRp0k5BVL4W3BfQynEcL7YbR0dF1tHHiujwbqaIujeWnhA8zA0d6J7R/okre95bEoRt/PKp41jz44qn1cx3vZ6bgYsCK6fi6KyOGRmFY/sqfLa82vsJG6AAha9VN7j4pVuR2LNXXwPes2aHmM/r+nPWiHTf3NWliMp/AHLx/hWu70bSRM0JfwRADzEQzmKVprUx4Phs4ruOzaHvOmxaX2k2JzRnXe++AS52MVy8TPa57RA6TND2iXFdBZVXehO3PrdPCXknnU4gNrK+AAeSilvlCO3xpvLSYpLCinRSnccPP9XZtbEq1NY/SjoBliZQTBOfl7jwnRlMT/3ieAbXJDJIFNCDiVkn/80g6Dc+g8FuyWbQFxvV9q/NkLNxAyb9bZ1TYprs02RbmfywnaDDv7YgmLwhoA25zcRnWtLQvIzD27pqn7XzFiVKBKEVzVJjqA5UIdEc56emXteIx7tff4/bBh6wuAXd1+HcJjUMOpPBbumtOiZC/nyyoe76mBA9AvYwZL+LIzcfvorVkDQL5nbTjDR3KjWuZfSnGXN2o7pIEemotzfBON1TtUoea21hZbKu1nBAtHDw0Fk2mxi38a6HBk/G4XVDU5KbnY5LzY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB6551.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(39860400002)(376002)(346002)(136003)(366004)(396003)(26005)(83380400001)(186003)(6512007)(41300700001)(66574015)(2906002)(86362001)(6506007)(478600001)(53546011)(6486002)(2616005)(5660300002)(8936002)(31696002)(38100700002)(316002)(6916009)(4326008)(54906003)(8676002)(66476007)(66946007)(66556008)(36756003)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ckRySzQ3NDhSUW5kUWtmZEhPWDRBY2xFTGJ2UUs2TWVLei9aLzZmMGhCcTVM?=
 =?utf-8?B?KzdVdWorMloyOHc2MEREUHFRS0plbXhsL1JpcnI3SFZXVC92dXZPYW40eXlN?=
 =?utf-8?B?N0EycitQTWMrTjQvK1lVNnVhWHV4b2JydEF3dVNBc0RjQzJYYUJuTGRHNFhG?=
 =?utf-8?B?WkpJM2trYm9oNGpuWWZOT0NlUEd6YUwvUGRjaGFacVJvWFpzYkppbUdQS0Q0?=
 =?utf-8?B?YitFYUxtYWlURkJFUzQ0SXAyMVhvVC9aM01MWEU4RjlRWVQ0SThSekhuaVVF?=
 =?utf-8?B?elZaa1V0Slh0TFFETWViQzlNR2VpSzNZK0tPaVp5RllDUGNoZmtHK1VKOTRG?=
 =?utf-8?B?UmdyNS9RQytpSHV1MCtFUEZmUk1HUzF6Tk5sVUF2TGJ3a3ZRNkV5RmZJa0hy?=
 =?utf-8?B?cXprdzhpcVpXRXB0UzJVTmJMVmtKQWp1QkNjVjUyYjVTaDU0SzlocUZkNmd1?=
 =?utf-8?B?UVp5cUtzTG0yTVRNL29pVEI0STlFZmFVV1NGbWxab1dGMEN4TFA0UWsyZ3do?=
 =?utf-8?B?YmtUa2xNMnI3TjlSd2NuWER5aEtYd2prT09SOENvc0VpUXRTazlNTGZ6MWVT?=
 =?utf-8?B?a3ZWUitoWG82K3M2a0h1MmxjdE96NmVPMlB1dVNNa1dLMnB5MmUzMlgxYmhr?=
 =?utf-8?B?U0NiQU9jQ3QwVnZ0S3pSbEdJSzNnRUwzWmJUL1NWU1BQNG4rcXQwSUtrbG85?=
 =?utf-8?B?TDlPaU56ODhmSlgzdjExQ2V1N1F4R2xFS2ZPd3QzdlhSM0dBMS9UM2ZFOGZM?=
 =?utf-8?B?MS83L2w0SjEyRTNSOWtTZWpDSVJvNk0vTHBCOXQ3QUNnb09HbktnSTI4dGFR?=
 =?utf-8?B?SnIxTUFWTmV5ZWhFRTBtYk9LRk1BOUlVTTZaRVJESHBkTGJ2YXdoK05jdXJI?=
 =?utf-8?B?NDd6aFlxdDZLbUE5cWE5NGc1U09TRzlDaXh2K3h0NFFRTkR6Ujk0b0JxTW91?=
 =?utf-8?B?alFrNEF2OHF0YXNvby95UkpnVmFISm5idEpvSDlZWjZWQnFHVXBHRmx0VVVN?=
 =?utf-8?B?R0J0T2ZNUGJVbmR3T1ExKzZaU01aVlRVdXYrMnQ0SlNETnpvZ1JNdDBwOGU1?=
 =?utf-8?B?RTNIdGMwY1grVlk1dGZXd2ZOeEpUeXBnWGlmQkdOUVE2OW1LTitseGR3VUUw?=
 =?utf-8?B?OXBDVklFamlQSGJLRmc5NDRrL3VZemxML25uSERKL1FER2NINlM0VUI5d2Fo?=
 =?utf-8?B?NllEaTlnbjlxMDRZclV1VDJpV3FjYjR5eTBKMWRyVStuQmdnWmdRYmc2bUdv?=
 =?utf-8?B?VTFVUDMyTmhtdVNJY0hrWGg0ekZjaU1HU3ZibG1wRTBjZHIrd3llSlRUUE1U?=
 =?utf-8?B?aWF2K09IVFRQSXQ5eHQzVjhzM2pFUmVwZ1NMNXljT1pqNmRucDJiaCtLbVMz?=
 =?utf-8?B?T2IzVUFJRDMrMldpR2lNN0JBVURBYW1sZVk3L0lxKy8vODYwNGViN2ZRb1Na?=
 =?utf-8?B?OWljdU5uSnhLUk56cXBWVlpQc0hacjhGSEw3STZ1THEyYTZocFhzTlNKb2hO?=
 =?utf-8?B?ZEJqYmJxNXM5VXVuWTRWOVdWS1NQRDlzV3lNeG1nZU1Gbm9LMDZreWluajIw?=
 =?utf-8?B?enpNMWcySWFoMGlwOVBHT0ZQcmZiM3JFZ0NDaTNSLzZZcE5CS2xpR1lzMHU2?=
 =?utf-8?B?WUNKLzRrUHJlYTFzaXpQZXRIQW8vOW40QUdsYXJnaTRkT3JXU2JuUkVnZ0xq?=
 =?utf-8?B?dU4vQU1OVVdFL2xzY3NIeXBPeGFOWldIVjU1WkhPUHJNY1V0Znd0S2psMjJt?=
 =?utf-8?B?QjZobFVmdW14STFRMCtJMVQyc2ZZdXlHdFl4TEszdllyb2xsT2xvN24zMTVO?=
 =?utf-8?B?MXpObEF4WmpqMVgvOE1vZUtTVnRzbXBJRDBFSkNPNW1EQ0lGWk4zNGEyUFZs?=
 =?utf-8?B?UTFSK0gyV2ZqZ3JSVDQ1ODErb0lyemZaYi9sZWYrN21NMjlhMzRGdlZUaTZT?=
 =?utf-8?B?MjU2eVY0SUVHOFNMc2lYVXFoRFlRQWdEY1BpZ21NLzJiWFArSmJwYWtEVXU2?=
 =?utf-8?B?RWRVNDF6eXdPS1dZYkI0bXQ2R1k3bmszODZIdE0xclFyaTVGTTUrRE5RbHow?=
 =?utf-8?B?SFlQRno3RVVIVWUzY3MrWWhFQ1FudWRWV1p0UGIvREJnUnUySncrYlBqSHo4?=
 =?utf-8?Q?ijhdvrAAitGBnLdsSiawLWXYw?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 07e7c606-0ac0-488b-f42a-08da68cafc14
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB6551.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2022 14:37:04.9198
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VUHnuFnvkSfT2HNDzZGdLYROEkGtnS5cP77zq7kQspuLDtXOH/E3pVTwE2InBsquE2rNI2kCYm/ERnRcCVVGZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7885

On 18.07.2022 14:48, Marek Marczykowski-Górecki wrote:
> On Wed, Jul 13, 2022 at 11:39:07AM +0200, Jan Beulich wrote:
>> On 06.07.2022 17:32, Marek Marczykowski-Górecki wrote:
>>> --- a/xen/drivers/char/console.c
>>> +++ b/xen/drivers/char/console.c
>>> @@ -113,7 +113,9 @@ static char *__read_mostly conring = _conring;
>>>  static uint32_t __read_mostly conring_size = _CONRING_SIZE;
>>>  static uint32_t conringc, conringp;
>>>  
>>> -static int __read_mostly sercon_handle = -1;
>>> +#define MAX_SERCONS 4
>>
>> Might this want to be a Kconfig setting?
> 
> Is that going to be useful for anybody (who isn't modifying the code
> anyway, for example to add yet another console driver)?

If allowing multiple serial consoles is deemed useful, then making
their maximum count build-time configurable is quite likely useful.
People may not want to allow multiple of them, for example.

>>> @@ -1291,7 +1322,8 @@ static int suspend_steal_id;
>>>  
>>>  int console_suspend(void)
>>>  {
>>> -    suspend_steal_id = console_steal(sercon_handle, suspend_steal_fn);
>>> +    if ( nr_sercon_handle )
>>> +        suspend_steal_id = console_steal(sercon_handle[0], suspend_steal_fn);
>>>      serial_suspend();
>>>      return 0;
>>>  }
>>
>> The commit message gives no explanation why only the first handle
>> would want/need dealing with here.
> 
> Sure, I can add an explanation. I'm adding this comment to console_steal():
> /* Redirect any console output to *fn*, if *handle* is configured as a console. */
> 
> So, calling console_steal() is about all serial consoles, not just a
> specific one. The use case for this "if" part is gdbstub, which wants
> to redirect serial output only if that serial was configured as both
> console and gdb. Having proper per-console stealing is doable, but IMO
> not worth it (it would require also avoiding duplicated output in case
> of multiple serial consoles, and probably few more corner cases).

And what if the one handle you pass on isn't the one matching the
console the gdbstub is using? While I understand that per-console
stealing may have some sharp edges, I don't currently see how we can
get away here without handling things per-console.

>> One overall remark: Especially with sync_console latency is going to
>> be yet worse with all output being done sequentially. The help text
>> for "console=" will want to mention this, up and until this would be
>> parallelized.
> 
> I don't think it was parallelized anywhere. All the relevant functions
> (__putstr especially) write to various console types sequentially. The
> difference is that previously only the last "serial" console was used,
> all the other were silently ignored. So, it was "parallel" with all
> _zero other_ serial consoles, but not other console types.

Parallelizing vga and serial likely wasn't deemed very useful, as
vga has negligible latency compared to a (slow) serial line (albeit
I leave aside software scrolling here, which indeed is slow). There
are also no commands involved in vga output which may require waiting
for their completion - it's all simple MMIO writes (and hence the
slowness of scrolling could only be dealt with by involving a 2nd
CPU, as the one doing the scrolling can't at the same time do output
to another device; nevertheless some of the latency could be
compensated by doing output in suitable order). This is quite
different when it comes to multiple serial consoles.

> Anyway, both help text and boot warning for sync_console already warn
> about it. Do you want me to include relation to number of configured
> console explicitly?

I think it should be made explicit, yes.

Jan

