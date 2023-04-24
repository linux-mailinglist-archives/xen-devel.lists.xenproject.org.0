Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B32B16ECBB7
	for <lists+xen-devel@lfdr.de>; Mon, 24 Apr 2023 14:02:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.525332.816468 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pqutA-0003N1-Ey; Mon, 24 Apr 2023 12:01:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 525332.816468; Mon, 24 Apr 2023 12:01:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pqutA-0003Kf-CI; Mon, 24 Apr 2023 12:01:48 +0000
Received: by outflank-mailman (input) for mailman id 525332;
 Mon, 24 Apr 2023 12:01:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0Hh8=AP=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pqut9-0003KX-07
 for xen-devel@lists.xenproject.org; Mon, 24 Apr 2023 12:01:47 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on062d.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::62d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c82a99bc-e297-11ed-b223-6b7b168915f2;
 Mon, 24 Apr 2023 14:01:45 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DBBPR04MB7819.eurprd04.prod.outlook.com (2603:10a6:10:1e9::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.33; Mon, 24 Apr
 2023 12:01:42 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae%2]) with mapi id 15.20.6319.033; Mon, 24 Apr 2023
 12:01:42 +0000
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
X-Inumbo-ID: c82a99bc-e297-11ed-b223-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bfzK61v1rYdPhquKWKAhUS9Bo4VRlf9fLV6SQKFWRXM7bnoNnHfy2ag9brcrLtig9Q570OAQwpZg7VGGObY1K7g1UXIClkfNiaVxXPqPFGHp8N63oWIUXM4lOp0qOlIOqxDH57mB0YtrTRr6TZ1ZMHUrrFTebsPWn9YJ4MKdESGnl4x2mj0Kj4391uocLgsbk/xBkLKqRJZQ2Z8fLMNhFbznDBx9F7igFerCcEwMl4aRaYxSa2Y4ZaYiKmB/iH9K9DiScxsbEgs3TTXs5Npz/1ORl9rS4UgUeBvSZipeGOnW193VFP6ajsl7uUvW53CB6U5nUF1VJJzYJmalYW2yQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n9hNCXuO0OnaZb3uPDhdrOiAnK2CzORCGdLFN0p9Z5U=;
 b=bQhlbhd9bEVl5PHDL/Q/m5MsB+J+1tnXIWLsKQY2LqS068kH7zPd/FSfduuLCgTSK4fZ3y4ojbWQ8bgLD7vmhXrzSMYhUdh28FBnQI6JGULss+E0M+TPBh83/nOn8/9FRpwM5hmJuZDXEofB9zGQ3o5JUkdfUIBvRPusCL6226Mnu+3G2r0zGFesRS5JFCXI8FemvZ+N95LMPeCgf+VfE9EL6c9xemSRm8KWbKts6WhnS1b7kRpNfScgRbzCMFcNc1aMQyZbbE5PjEqgaLnmRmbbb5EBi2dX+meHBKuTYexZATl9snMYwcOiWODuu5/xwLiKCfHA3XGOiXIaj7NdnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n9hNCXuO0OnaZb3uPDhdrOiAnK2CzORCGdLFN0p9Z5U=;
 b=nUBUtDUscSVVYLrbNjz1QXl4mKxjw+vAdV66G6EKcLzqG0ha5VxuxMPLeHqEl7Mlvlr397zN+OI4AkpUhKbOSWylnm0TZ/g6cuXw30UPkUDrdOQWAI9S9FsczbIN3whC4bf7SXfsqEo5Kqq8v4CjHprQFKZKhggLGmP/PkV0KdjFMIjQ1xeTTr2V6pQNE/rK8Nj7mYEZKHX4xlzA+J4K2MEuLN4nsqwWFX5r46Lcu715L6EizieTrAw1ypKMtzzqqYrL8Tw+miXHJ/M5kuG21TYOCKexonuwx5nqIeSZpQ6iyndRjekwpwroNAWlkNUxwGIrmO/VWSpRxZbjre6SfA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <45bdf36f-93c5-9f7c-a028-0a9443f85013@suse.com>
Date: Mon, 24 Apr 2023 14:01:38 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH] xen: add support for crash dump analysis with xen.efi
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20230421135933.23353-1-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230421135933.23353-1-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0054.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::18) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DBBPR04MB7819:EE_
X-MS-Office365-Filtering-Correlation-Id: 52ce8907-5239-4bc8-2f15-08db44bbaad4
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	pLqXnI3K7ZAW/o+Cb576yClwf42w6njc5BZ+xGDYroKIcpOaIvyqp6GMDtDU8eX6kaeRlEUg/BFpYdIRau6s+Ri3QhxpzSIwS4c9Tpx7wBFZLY6JmzIRU09OoxbOeE4QGenVeQ9mxbwKmf/IbKzcofYkN5tTTIuDqo4GVvxfoHf9KKsvFmaFUtCo7PJDJ2irv83y7GA9uv+MpnwPLi07zyLUPTQeWeSMIxuYfH1ajRv75h1lBnEcb3/AsfIA150Sm7L47uMrEjDIoXqNkmXzHrtf+6k5ZyrG3LZBc952e6zxndC1bmJHIcT9p2G1Xt7QrdxuEfVb5Ffg9ODxiucfWGOzJlHJ2wSYCxcl8bcAYpAYH9pTk8V555zLuiPDDcRvCy98rUxWrYRzX43YJQ1DKYg+TWNuBR/mnRnPZbL9TQc2viGkacKsEhsHJ4Mm5nxSudmeSxzFigJbZEsjFn8ELdmkLErVW0WyCjK6quLF2PmKxHombsFaYGw45/trsciVP/vOWgfCRN3VYBvJXODXVwpVUvsgKOpS+71D852sFyW+N78VLAotSzDAJEkh2shuV4xE06tKTsGjGjVMqlbSECZFs7JnIMnpbp6Z3AitvMGGiYBwCmyzQ+KX/bqR2lGTpcWi9Z3Ghnp+DTzEa3MBgQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(39860400002)(366004)(376002)(346002)(396003)(451199021)(2906002)(66476007)(66556008)(66946007)(316002)(4326008)(6862004)(8676002)(8936002)(5660300002)(41300700001)(36756003)(31696002)(86362001)(6512007)(26005)(186003)(53546011)(38100700002)(478600001)(6486002)(6666004)(83380400001)(31686004)(2616005)(6506007)(6636002)(54906003)(37006003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bSs2SVJ3Mjh5OVpxQWtoTE1rSXl6TVIyS0tjSGFwM0VoZnFmTDFyRXhZRDE2?=
 =?utf-8?B?ZkI3dXRoMWNCUkpnTGFQWnNGQkVpTnVkQnI2NjA0cUY1cklwRGZQbFBFTW5N?=
 =?utf-8?B?V0paekhJaW5DdVY2d094SGwrN0pnOTBmVzB5WnFsVVppUG9ja2dDSDFEOHY0?=
 =?utf-8?B?aUs3dFpOZTJhaDloL3c4bUUvRUVxR0VZT0wyRk1hYndvcGQ4eUJVRWx3ZlZK?=
 =?utf-8?B?bEpXV1lKRjRNelp3L3JVQ1ZaU00xRWR4UVdFR0ZjN3o2d1pReFZUZ1Rmc1pF?=
 =?utf-8?B?OXZob2Z1Y0FWQ25hWDlrMGQxL3F4L09nM2pueWt6Wjl0ZUxVS0lLZUxpWEZ4?=
 =?utf-8?B?ODlnOGljRzdUQWh2TVdtWUNuT2VHRkNGUVZpdGlKbjBGeERraC91NitYeGZo?=
 =?utf-8?B?Wllwb3UrWS9tR212WUFxaWZ5ZE55YVJ6eHRSdStuY0h6WGNRd20yaHJENWdD?=
 =?utf-8?B?NUx6NmdSZ1o2dTdzNjV1bG56N3BJM2ZaY2U2VzJFK3YyZjcvOGV5Yk4zcE1J?=
 =?utf-8?B?aDhzK25NQkV4Ukxac2QyNVY1Yk1FbnIwSFdNcUp0Q1BMNjl6TlNET1NxZCtZ?=
 =?utf-8?B?bVNCN1hqN2xSaWRuWGtKNmFrSDcrZFRUSm0wZmIvV0Vqcm5jVzlTRUFFUGtF?=
 =?utf-8?B?aENvNUprUGpBUU5XNWVRaVlZMFlhcFk5NnVyRlE4TnJud3h2enI4aHpyRm5P?=
 =?utf-8?B?R1g2UElaT0NsQjlHRkxpZGd4SEEvMFFPMkV1U3gvbUROUVF2UnlwOE96R3hK?=
 =?utf-8?B?d3JqYk92eForKzBmclFsYzJ6NmhycTl4UUswcml3bEpJMkRnbDNremtGTXFD?=
 =?utf-8?B?WnZXaDAxV0cxa0RtQ3VzQ0tzU2xpa2xZSnIrWDdzZ1ZtellqbHZ0U0hwQzNv?=
 =?utf-8?B?OVhHaHBmMktQZ1lyUUp6d3k5cUkvVUNrQVRTWlNNVDVXc1FsaS9JVzBITllV?=
 =?utf-8?B?U2RCa3h1NmhITFhHd3VGYitzTU54em54ZVFTTXpSMGt6R1hhR29DOVIxeit3?=
 =?utf-8?B?cHlTYWN4YXVxVFJXWjRoOXV5OGhISG5UVXNnWVB2S0ZxWnVVeXJUR1lnenow?=
 =?utf-8?B?ZHBLdkFEbUFZVWhnN1o3SzNRRkJ2Zk5ydFlrdEFxYkpwcUEyRVUvRUUvdEs5?=
 =?utf-8?B?RUFtMFRJQzdjUXlFMUhQVnI1MzRENmNBeUhkSk1hUXlRRFFhOFJZY1FqY1ly?=
 =?utf-8?B?ajBjVm1xNTFQQUNlOXlWWGhMc1ZtL3lHVGNORFJhaW5xUGFpaW1HeTVlTFhR?=
 =?utf-8?B?OGpHc1BvNGVDanFoODkzeXpaVWxWYTBMZEZGQWtSUWtsTXgyTVA4SHJGd3VL?=
 =?utf-8?B?LzlYckRwS25YbGcvd2NLSmh6bUREQkJMWEpPWjRhQllMcEFEajNKOUhKc1Fl?=
 =?utf-8?B?NWlvNkhTZ2ZjTXJRcWhoSW5DRXRnV0FPbnhtaEJ3Znk1dndBa0MzQTMrWXZX?=
 =?utf-8?B?c3Y3OE0zYTNEYVBNeUUzU0lkN3phemFjb21rSUFMSGtrdTk5NTFvU2YraERF?=
 =?utf-8?B?anRwQzZaOVhyd2htcVd2bld0dEVxVWdmTDNXR3pwU0Y0V24vcnp4UTdoSGp2?=
 =?utf-8?B?dXM4V3ZFQnN4NWNMRU0zM3QramtxeGNsMWRIKzcrcFdrSmJicXFsS0V2OXp4?=
 =?utf-8?B?RU5DRHcxcHJjNktvQ0VDd1BzTHArRDdOSEhxOVd0cGVtNjRFUkhHeDMySDNj?=
 =?utf-8?B?aUVQQXZlZ2Y5N2c1dFdvTm9OYy9YTTRQWUYzd0tXRkxaeEcremhnSE5ObGpr?=
 =?utf-8?B?MWN4K1RwRFRJYmFaMDZvWlo1anhiTnMzM1RRMWVxYzJKSU54T3ppbS9CRXA1?=
 =?utf-8?B?eno3aENReGJPZFlNakZlNHBWY1ovT1d4Y2hrZ3g3eXpFcVVBSXd2bmhscWkr?=
 =?utf-8?B?eVRkQWY5T3pTNGlRS1R4bW5EeWgyUEhKNTBmaHZXYlozZTh1a3pRT1pIUE40?=
 =?utf-8?B?VHZNUkV4Q21sV0lwbTJhVExIb1c4U09aWWV4RmgwWHpJRTY3Z2U3alBqVEZL?=
 =?utf-8?B?dUNQaktHZndYVUJYMDVudHAzUG53N1M1cEhlVEprRTFRK1ZKQWMySFk4bHBy?=
 =?utf-8?B?UjZTQkxLUzZZOGNBOUxETzJ4QjVqcG1yTVlvTXVkQVR0Q0tRSEVsSXFqaFpO?=
 =?utf-8?Q?plassOZ5b4XD/41bKHJ58zn/l?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 52ce8907-5239-4bc8-2f15-08db44bbaad4
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2023 12:01:41.9945
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2/2/+Tw7FUCLUxJCIerBFFGiYFpVzC3sCzT7E1p/3jRUgzLOcKZJwLWF1VsOoOQ4syhZeqkg9ScoYKyY666a0Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7819

On 21.04.2023 15:59, Juergen Gross wrote:
> Today it is not possible to analyse crash dumps of a system in
> hypervisor mode when it had been booted via EFI, as the crash utility
> doesn't understand the file format of xen.efi.
> 
> This can easily be solved by creating an ELF file from xen.efi via
> objcopy. Using that file as name list for crash enables the user to
> analyse the dump in hypervisor mode.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>
> ---
>  xen/Kconfig.debug     | 5 ++++-
>  xen/Makefile          | 4 ++++
>  xen/arch/x86/Makefile | 3 +++
>  3 files changed, 11 insertions(+), 1 deletion(-)
> 
> diff --git a/xen/Kconfig.debug b/xen/Kconfig.debug
> index 94e818ee09..4aec0fd3aa 100644
> --- a/xen/Kconfig.debug
> +++ b/xen/Kconfig.debug
> @@ -138,6 +138,9 @@ config DEBUG_INFO
>  	  the EFI boot partition (look for "INSTALL_EFI_STRIP" in
>  	  docs/misc/efi.pandoc for more information - when not using
>  	  "make install-xen" for installing xen.efi, stripping needs to be
> -	  done outside the Xen build environment).
> +	  done outside the Xen build environment). Note that stripping
> +	  xen.efi using "INSTALL_EFI_STRIP" will disable the building of
> +	  xen.efi.elf, which is needed for "crash" dump analysis of systems
> +	  booted via EFI.

I'm afraid I don't understand this: INSTALL_EFI_STRIP only affects what
may (optionally) be placed on the EFI partition. The normally installed
xen.efi should be unaffected by this; an intermediate xen.efi.stripped
is created instead.

> --- a/xen/Makefile
> +++ b/xen/Makefile
> @@ -505,6 +505,9 @@ _install: $(TARGET)$(CONFIG_XEN_INSTALL_SUFFIX)
>  		if [ -e $(TARGET).efi.map ]; then \
>  			$(INSTALL_DATA) $(TARGET).efi.map $(D)$(DEBUG_DIR)/$(T)-$(XEN_FULLVERSION).efi.map; \
>  		fi; \
> +		if [ -e $(TARGET).efi.elf ]; then \
> +			$(INSTALL_DATA) $(TARGET).efi.elf $(D)$(DEBUG_DIR)/$(T)-$(XEN_FULLVERSION).efi.elf; \
> +		fi; \

To avoid the risk of the two going out of sync (as also to limit
redundancy), could you wrap the earlier "if" in a "for x in map elf;
do ...; done" loop?

> --- a/xen/arch/x86/Makefile
> +++ b/xen/arch/x86/Makefile
> @@ -224,6 +224,9 @@ endif
>  	$(MAKE) $(build)=$(@D) .$(@F).1r.o .$(@F).1s.o
>  	$(LD) $(call EFI_LDFLAGS,$(VIRT_BASE)) -T $(obj)/efi.lds -N $< \
>  	      $(@D)/.$(@F).1r.o $(@D)/.$(@F).1s.o $(orphan-handling-y) $(note_file_option) -o $@
> +ifeq ($(CONFIG_DEBUG_INFO),y)
> +	$(if $(filter --strip-debug,$(EFI_LDFLAGS)),,$(OBJCOPY) -O elf64-x86-64 $@ $@.elf)
> +endif
>  	$(NM) -pa --format=sysv $(@D)/$(@F) \
>  		| $(objtree)/tools/symbols --all-symbols --xensyms --sysv --sort >$(@D)/$(@F).map
>  	rm -f $(@D)/.$(@F).[0-9]* $(@D)/..$(@F).[0-9]*

Personally I think that - in case of build problems - having the map file
created is more important (and less likely to fail) than the ELF one, so
I'd prefer if the two steps could be ordered the other way around.

Further I vaguely recall possible issues with entirely blank make rule
lines. Plus having some trace of the command in a verbose log perhaps
also wouldn't hurt. IOW maybe better add another use of the colon command
here (we already have some, at least through $(MKRELOC)):

ifeq ($(CONFIG_DEBUG_INFO),y)
	$(if $(filter --strip-debug,$(EFI_LDFLAGS)),:)$(OBJCOPY) -O elf64-x86-64 $@ $@.elf
endif

?

Finally - do you really need to copy all the non-debug sections as well?
Might --only-keep-debug be helpful here (provided it works for a PE/COFF
-> ELF copy operation; it looks to do so in my simple experiments)?

Jan

