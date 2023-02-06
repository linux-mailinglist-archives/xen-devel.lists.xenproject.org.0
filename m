Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ADFD68BE41
	for <lists+xen-devel@lfdr.de>; Mon,  6 Feb 2023 14:32:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.490437.759127 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pP1aw-00085W-KH; Mon, 06 Feb 2023 13:31:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 490437.759127; Mon, 06 Feb 2023 13:31:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pP1aw-000833-HF; Mon, 06 Feb 2023 13:31:42 +0000
Received: by outflank-mailman (input) for mailman id 490437;
 Mon, 06 Feb 2023 13:31:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=JzEl=6C=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pP1au-00082x-Ub
 for xen-devel@lists.xenproject.org; Mon, 06 Feb 2023 13:31:41 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01on060e.outbound.protection.outlook.com
 [2a01:111:f400:fe1f::60e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 94ac34d8-a622-11ed-93b5-47a8fe42b414;
 Mon, 06 Feb 2023 14:31:37 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB9PR04MB9354.eurprd04.prod.outlook.com (2603:10a6:10:36c::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.32; Mon, 6 Feb
 2023 13:31:35 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e138:4fc3:705c:d178]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e138:4fc3:705c:d178%6]) with mapi id 15.20.6064.034; Mon, 6 Feb 2023
 13:31:35 +0000
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
X-Inumbo-ID: 94ac34d8-a622-11ed-93b5-47a8fe42b414
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I/K5a/+dRl+ocyhI78rPqhOJEZ5+Ruz4ZWEoY0t9JctM0MSIBZiHkC2bA+xhjlFOMNUGWnOPJAby5IpMj5iSCMucdg0QOMLO2zIikIGMH7J8SbuQHjhKDi7SQhX6u9kJbOFloUcJodNqpQIaEfX8usmx7K5BSPusm/XW6hgGFN7DwDst/rti/kgWFoNZMZz6FB6IJBZYMZaNFHcThhWJPEQoNJo9ccrSOy/JPYk4yJIE46WMeS/WCb3tOGPWbPgUOX8+SYs00B96KtKWJC4YaaX/uJuN/p95m9IEOy9egnQlOXHy3Cu+8KJ0tg5qRU4c/bZRBgy5KcET8oKVSL2Y3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Sygd243Vo/GwduwCHmg7HSqON/WDDmGlIEApJrSrGEo=;
 b=iEi1RspWB+Q8fo7sT+N++1t8JO01/nmYaVlnPdqn4hgdQkubdu/HH+tp9rVvuRagM1HJ/ABhjtm5jElovqjkVFPH65F3H9k0xvQJ31O2VGi1I7PQZcI31VDo78rtucpqOkSwHX0xjVkqssIYzV612mXmHsrVtwzLexPwPxQWequZif4ZMCMaSZ8JyTX53G9uCDb3yXWVAGTGl1LSW18rOBElUg3XCh6fOVt24bbM42gBar6BY24MabUDoDA0v5wp5FABFYErCGg2Xilc0duhB1i0Xw872KbS5Uz96jJ08sE5hLJ/jUcb9Fh5BOHWZ03j7nWLv78+YpnAmOAOmks59Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Sygd243Vo/GwduwCHmg7HSqON/WDDmGlIEApJrSrGEo=;
 b=0RymhEQNWQBX4iVENFzCXH65PLPupkeC3O3ylB9NAVD4D95rlo0mUYC9/n+rrT7Z/1NDQE5Tdv9fb9h3pzyLGFIJ4Pbs/s2VKWKvcr9epJSLfc/0m62mL5gk17dbQib6GPf05IkjBg+NlAlIDTYs5gQRJHDcq8hK1tgBXOWJ3C6ybLNp0abmmfC9XdDI8FbJ9Fy+JgEI+le0SzjYlHwNJ0sDtN0LDPui618lnbnvbO2d5WtN+lv7NoeoOxClO1n8NroAIGRcONqUvVgHmsssXO53YIuHuzwx2z3RXmPdcxldLGmf61iDNf5VNnDGCzhG2KnKDgu7ucA8WheD3B8r3g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <d7bd5478-87b9-e24d-aa87-86a9eeee0ac9@suse.com>
Date: Mon, 6 Feb 2023 14:31:33 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [XEN PATCH v2] Create a Kconfig option to set preferred reboot
 method
Content-Language: en-US
To: Per Bilse <per.bilse@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20230125182706.1480160-1-per.bilse@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230125182706.1480160-1-per.bilse@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0124.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:94::15) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DB9PR04MB9354:EE_
X-MS-Office365-Filtering-Correlation-Id: 186098b4-e7c5-4a46-2835-08db084677d5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	cxEsBBuJteSt0WDyiUvU485yS7wE7iycBa5JmtdEBOk52cTPf/mHWVX+ZCr+jGV/FBM/5Or2RVzifAc+H0FfYq6Mode+oPn3VrsJ2M9u/Zpj4oD4NMePZPyHhIFbTAQ9306m9GkwOnkjJUpe5qi+rKq3nxiIDpSR8kVAHU/EptG6KWNGUo5ZaP2kHMJKJAAsSCbW4XCZBu4+5NxUYfSVVrBxdLr/x+3Y5N1MxPsrWe01aGeSw7KoDw7SekQlJ9GxYYBWtRa7ENXkocOsSUml1H+tJ+Psw9QAPVb1zKN+U+a53oOZtdKgosoVzFov1U/G8obaRd8BGgCM6qXdEddWHSiANqqr8W8+UcKF7ZTFI1v6582VESEYANbVuAyOB4Z1bxwwzgkcX4ChuDHhu9p6eV1Mh4e3VDPMHrwdX1i84P2rMkESDwHQmjAfp86PScQmQ32aUqErY02qYiJ9r4w9J4HDlNCzZZo0idu1I7lChS+RDgIwKiBTeqT8J13GyYxO5G7VezJ0vCGv4a8TkA5lXPjmYRovfvHG/4xfIRzbC+3UOep2OgNlPv58fOJ5267tsxCTohvJUUsoyQfKBXAULjQ8HxsWJlPj+f1rRKZQ9H1FBq2Uhz9C8itr2zQ57mKKHlUzhmH6VvphOUJ5WxiumAVXN9Acs1tEsRlAVuqLKBVy8hesSMapPtEAgna/Pwxbc4hIra/2x3/JqjAS20P9JSvLOAAzAl808f591rOZW9E=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(376002)(346002)(136003)(366004)(396003)(39860400002)(451199018)(31686004)(54906003)(4326008)(66476007)(316002)(66556008)(66946007)(6916009)(36756003)(38100700002)(31696002)(86362001)(2616005)(6512007)(186003)(26005)(8676002)(478600001)(5660300002)(2906002)(41300700001)(8936002)(6506007)(53546011)(6486002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bTUzUHU2ZXV1cjJZRDFLUmNLY3lQcHF2NnVxY1M5dkRIelNVZHdUbDQ0STZj?=
 =?utf-8?B?UW43Q2NvWmkwR1ZGMnA3c0h2YjZwZnU2YmdSVVpETzVKUXU5Vlo0d3M3VnJH?=
 =?utf-8?B?RjZsblgzVDBKVktVYm9lK2lqM3NFQWdVZVVQeGYyOExQcFozYVpkd1VkY3Jz?=
 =?utf-8?B?eWxUeG0rVXUzaHdDTEtrZVBSdldWZC9zUjZ0bHgvRk42b1JJeUlQbWxGYXp1?=
 =?utf-8?B?eTZYU0FpSjRsaTNJL2hpTlU0Q0x4OU1TLzRQUkgrVWNBQWVzZXhIazVwYXBK?=
 =?utf-8?B?eWgwQThoZUxtS05EbHY2MTNwVFh2QUxFdlpwS3QrRXZ6WFVBMGJ5Qk1rMDZD?=
 =?utf-8?B?VUdPREFhL0ZiMVhpT1VzZkxEQStheFVJUnQ5eURTbTlCMFV5WGtwa293cHZG?=
 =?utf-8?B?V1hyanZUeHNTZXR0MkVUME9ZMkxCazNtNTlqVXdrMURJN1A5KzZuWkd3MDJq?=
 =?utf-8?B?Vy9COTIyWUtVRGV6Rm1IeEdXWm9JUjgzL3R1WWVoQm1xMER5S0hsbjkybzZL?=
 =?utf-8?B?Q1JLaHlQWG1JS01iR3NNckxEVUp3MjZMWE1wcmpQOGpGMDNLK0Z0cjhXNnVI?=
 =?utf-8?B?VGNoeDFNQ3JZeFpHZml1WGE3VU4xbGttSVJZejVmRzNtV1EwWllCVTBPV29G?=
 =?utf-8?B?QVJKTi9RYWVITHhWTVNTMUpRTVBQMFlJZnFkSHFteWozdUh4N2RrQ05xazQ0?=
 =?utf-8?B?bmhlaFFaM1lzTERid0JtQ2p0TkV4dGpVN1Z4ci8vaEJuUTF4dW11U01oYTJH?=
 =?utf-8?B?T2JIcVZpVmJOcVU1a1cwaE1PUTNYRWR6amk0enFFTjhYa2F4Wld2a2pJcUZR?=
 =?utf-8?B?bVlIdDlmczU2WUVYZHBpWWYrNTdMWVZSZWlxcDJtTk9xM2J4ejhoUkxDeDQ5?=
 =?utf-8?B?NVFGWEFzaHRoT09ob2tIZ3RiNFhlMDVQbHovODlHMmpWdGorR0xiOGIvOHlu?=
 =?utf-8?B?K1Y3NkpUS2Nkc1hlSW1TT2dKVUxiRE1sa2IyVjVXZ3d2cUxrbVFVUVVRdTlZ?=
 =?utf-8?B?Zm9oU2QrajgzV05hQlczUlBDdzVDM0pQeVpZcWxnUmdDN3hKWEhGYjZCRWtX?=
 =?utf-8?B?Ymh6Z3VjSnhzWExWOFJUSjQ2Vm5jU3d0SjJ2Uk1mSUpWVGFaZTBJZSswdkVl?=
 =?utf-8?B?KyswTWtkMUdHS1JINWVDcWNvU0JwQlRnaVQzVGZJTnVVWHRRejRkTjdwN1ho?=
 =?utf-8?B?dmRQWjdhUzFqTUNDK2w2RW9Zakw4YUpqWGhNa3JrTkR1Nkt1SXl5cGFTK1lz?=
 =?utf-8?B?ekJLYmlKbGQ5UGh3YzNkakxWLzZwakhYeG5WajdwNGZCWGMwU1NnazVpYm0z?=
 =?utf-8?B?cW4rWkJNRFRPQm5KMStQYjBqWUtkVDVMTE90RjZodXJncDE3VWtDY0hQanov?=
 =?utf-8?B?Q0RxYmZrdGcvakNxaDlmVUlEQUFSTTFYbXEyWW10NjNqRE9CYnFlTW1vM2tz?=
 =?utf-8?B?VG92dFgrT0NLQ1JGNlM4RWJqOUFWR2ZHNCtWRERPNWo3cnM0U2x1ZEwyV2FZ?=
 =?utf-8?B?SVhlajRNSXRqZ1JZU1cwUlhkT1Q0VTVaUnJaWjdwZjRBTE1MaFZFcFVWL1Q3?=
 =?utf-8?B?cUliVVUrZThmbkZMV0hBdkRxb0E1S3R6NGhqSVpjRWdDT2hnT2REZTJDYWtM?=
 =?utf-8?B?dkpMZ2szSzBZZkJLTElJRjVGYVo3T1cvdnMreklqNWlVaUYwRVh4dGM1bnlI?=
 =?utf-8?B?UTRzRUI3M01hazFzQmFnMkhTREJvc2tlRVl3STY5azFNWmVsallJLzV6UUVQ?=
 =?utf-8?B?YXNPS3RrbDJyWGN1czJPR0JNR251SVcrVFVaMUc0R0hHS1hRRys0WEVMcUZ2?=
 =?utf-8?B?cDF5YS8wU2QraW1tVjVpKzNtMzhqaE0yK3NFdHh4V2ZOdTVoZlNxWCtKTGtu?=
 =?utf-8?B?cmNvQzRRdFE4bDFEUnBjeWc4Qk5NM2JmaTZsVTVBVTBac1BnTktTNmdiWGxY?=
 =?utf-8?B?cGcwd3RkcEt1bm1Mc3EzZlJhZ1FGWi91S2o1TkFsSmYxMklHWFhGR01EU2Zl?=
 =?utf-8?B?MS9QMW14eStTdys3NVVZcXBLUUJRR09yUzRNMU1UUG9Ramt5djVJUCtkcEN5?=
 =?utf-8?B?WjNrYU1rbTZtOXVGeXFGV29pZ2c4Q3BVT005Vk5iMm1TN1pJd2VJTlJHbENo?=
 =?utf-8?Q?MS1JF33TUZ963smS4FbiryU8c?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 186098b4-e7c5-4a46-2835-08db084677d5
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2023 13:31:35.5341
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vo2ASNC9aevNYii/bJJEPhjwRjfabQej0Cx1tB+C0No/XDUKQJu+3uPW9w5WPwF+8nPcLdhZwPbs8E6bVZC0Og==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9354

On 25.01.2023 19:27, Per Bilse wrote:
> --- a/xen/arch/x86/Kconfig
> +++ b/xen/arch/x86/Kconfig
> @@ -306,6 +306,90 @@ config MEM_SHARING
>  	bool "Xen memory sharing support (UNSUPPORTED)" if UNSUPPORTED
>  	depends on HVM
>  
> +config REBOOT_SYSTEM_DEFAULT
> +	bool "Xen-defined reboot method"
> +	default y
> +	help
> +	  Xen will choose the most appropriate reboot method,
> +	  which will be a Xen SCHEDOP hypercall if running as
> +	  a Xen guest, otherwise EFI, ACPI, or by way of the
> +	  keyboard controller, depending on system features.
> +	  Disabling this will allow you to specify how the
> +	  system will be rebooted.
> +
> +choice
> +	bool "Reboot method"
> +	depends on !REBOOT_SYSTEM_DEFAULT
> +	default REBOOT_METHOD_ACPI
> +	help
> +	  This is a compiled-in alternative to specifying the
> +	  reboot method on the Xen command line.  Specifying a
> +	  method on the command line will override both this
> +	  configuration and the warm boot option below.

The way it's constructed right now, I don't think this is true. E.g.
"reboot=warm" on the command line isn't going to override "PCI"
selected here. It wouldn't even override REBOOT_WARM=n if I'm not
mistaken, as the new call to set_reboot_type() would replace what was
parsed from the command line.

> +	  none    Suppress automatic reboot after panics or crashes
> +	  triple  Force a triple fault (init)
> +	  kbd     Use the keyboard controller
> +	  acpi    Use the RESET_REG in the FADT
> +	  pci     Use the so-called "PCI reset register", CF9
> +	  power   Like 'pci' but for a full power-cyle reset
> +	  efi     Use the EFI reboot (if running under EFI)
> +	  xen     Use Xen SCHEDOP hypercall (if running under Xen as a guest)
> +
> +	config REBOOT_METHOD_NONE
> +	bool "none"

To be honest I don't consider this a reboot "method". The parsing
really should be treating this as a boolean (i.e. also permit "0",
"false", or "off"). See also "noreboot" as a further (redundant) way
of expressing that intention.

What is important here is that this control doesn't affect the normal
reboot process; it merely suppresses rebooting in case of a crash.
While I wouldn't outright nack it, I think this aspect of behavior
shouldn't be Kconfig-controlled. The more that it can only be
overridden by "no-noreboot" (or similarly off equivalents like
"noreboot=off") on the command line, which I guess you agree would be
an awkward option to use. (Personally I think we should phase out
"noreboot", as "reboot=no" has been around for long enough.)

> +	config REBOOT_METHOD_TRIPLE
> +	bool "triple"
> +
> +	config REBOOT_METHOD_KBD
> +	bool "kbd"
> +
> +	config REBOOT_METHOD_ACPI
> +	bool "acpi"
> +
> +	config REBOOT_METHOD_PCI
> +	bool "pci"
> +
> +	config REBOOT_METHOD_POWER
> +	bool "power"
> +
> +	config REBOOT_METHOD_EFI
> +	bool "efi"

For these prompts: They want to be meaningful to people seeing them.
Imo acronyms want to be upper-case (when they're in common use) or
be avoided (e.g. "kbd" -> "keyboard controller" or some such). My eye
was particularly caught by "power", where I was wondering: What does
that mean?

> +	config REBOOT_METHOD_XEN
> +	bool "xen"
> +	depends on !XEN_GUEST

Why the "!" here?

> +endchoice
> +
> +config REBOOT_METHOD
> +	string
> +	default "none"   if REBOOT_METHOD_NONE
> +	default "triple" if REBOOT_METHOD_TRIPLE
> +	default "kbd"    if REBOOT_METHOD_KBD
> +	default "acpi"   if REBOOT_METHOD_ACPI
> +	default "pci"    if REBOOT_METHOD_PCI
> +	default "Power"  if REBOOT_METHOD_POWER
> +	default "efi"    if REBOOT_METHOD_EFI
> +	default "xen"    if REBOOT_METHOD_XEN
> +
> +config REBOOT_WARM
> +	bool "Warm reboot"
> +	default n
> +	help
> +	  By default the system will perform a cold reboot.
> +	  Enable this to carry out a warm reboot.  This
> +	  configuration will have no effect if a "reboot="
> +	  string is supplied on the Xen command line; in this
> +	  case the reboot string must include "warm" if a warm
> +	  reboot is desired.
> +
> +config REBOOT_TEMPERATURE
> +	string
> +	default "warm" if REBOOT_WARM
> +	default "cold" if !REBOOT_WARM && !REBOOT_SYSTEM_DEFAULT

Instead of the dependency here, I think REBOOT_WARM should have a
"depends on !REBOOT_SYSTEM_DEFAULT". But I view this second control
as unnecessary anyway. All you need to do is ...

> --- a/xen/arch/x86/shutdown.c
> +++ b/xen/arch/x86/shutdown.c
> @@ -28,6 +28,19 @@
>  #include <asm/apic.h>
>  #include <asm/guest.h>
>  
> +/*
> + * We don't define a compiled-in reboot string if both method and
> + * temperature are defaults, in which case we can compile better code.
> + */
> +#ifdef CONFIG_REBOOT_METHOD
> +#define REBOOT_STR CONFIG_REBOOT_METHOD "," CONFIG_REBOOT_TEMPERATURE
> +#else
> +#ifdef CONFIG_REBOOT_TEMPERATURE
> +#define REBOOT_STR CONFIG_REBOOT_TEMPERATURE
> +#endif
> +#endif

... construct this accordingly based on REBOOT_WARM.

> @@ -42,10 +55,13 @@ enum reboot_type {
>  static int reboot_mode;
>  
>  /*
> - * reboot=t[riple] | k[bd] | a[cpi] | p[ci] | n[o] | [e]fi [, [w]arm | [c]old]
> + * These constants are duplicated in full in arch/x86/Kconfig, keep in synch.
> + *
> + * reboot=t[riple] | k[bd] | a[cpi] | p[ci] | P[ower] | n[one] | [e]fi
> + *                                                     [, [w]arm | [c]old]
>   * warm   Don't set the cold reboot flag
>   * cold   Set the cold reboot flag
> - * no     Suppress automatic reboot after panics or crashes
> + * none   Suppress automatic reboot after panics or crashes

Why the change from "no" to "none"?

Jan

