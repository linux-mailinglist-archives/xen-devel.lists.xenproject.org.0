Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A4EC070B7F1
	for <lists+xen-devel@lfdr.de>; Mon, 22 May 2023 10:45:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.537817.837355 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q11AV-000786-Uk; Mon, 22 May 2023 08:45:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 537817.837355; Mon, 22 May 2023 08:45:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q11AV-00075N-Rg; Mon, 22 May 2023 08:45:27 +0000
Received: by outflank-mailman (input) for mailman id 537817;
 Mon, 22 May 2023 08:45:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=oqCu=BL=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1q11AU-00075F-Pk
 for xen-devel@lists.xenproject.org; Mon, 22 May 2023 08:45:26 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2044.outbound.protection.outlook.com [40.107.7.44])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fedcb24a-f87c-11ed-b22d-6b7b168915f2;
 Mon, 22 May 2023 10:45:25 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS5PR04MB9755.eurprd04.prod.outlook.com (2603:10a6:20b:650::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.28; Mon, 22 May
 2023 08:44:56 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6411.027; Mon, 22 May 2023
 08:44:56 +0000
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
X-Inumbo-ID: fedcb24a-f87c-11ed-b22d-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nOB5qiciEUwnwGPWrzBOFS6gv2mJ7GCagbh+lY6LHZKqroLVBhAXEuLy1Q5FkyabxAdMLveEog6VJyUQWkxPDl7orhp88U5hChihKEs7n1Ug3JCx1IzpkHN6uguLMzx/uZyNFNQyx5NVjao+XzNSjA5ZXiOOPfyTM7bvS9WPcIUiCDE8Ab8ug5AtF5HOZfYbym3eRO/Q+VHi26I1XIUiaulvfP4u9OPf8CldcEsRhyti6TRX4mBqMsmY7VTZvzeZ4HcK/2g9o2VmBSLx9VAb2LP/SXVfXnpDe8DjaujFoJZ4NliKnmwmF/WJ6gmlTMiNEWZ8yrwjmIerENay+DuI4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rmLRf5Ck1L3hgbZSsPpT+g9LSkLIRfdCkOuhAtHXcUY=;
 b=PX10FujeAJexYOPuWcohP2jTXs5lf0igSQwF9okP1cPy7I3s2xP2RMsIbZALN1H0Iy3lFer61GCsd4/D6ojdq+nSntNNHm6YS1b7AS0cOXntw9TFgD61n9xzjTxhYVJPOiwhbxpcN+/gRBvh64ij83GBf3cT2UJcN9UapiNfyHI3xplDrJ51PEXOaMlfreByzcxEbhl6ZEpejPw5uOOnDMZprWEPeanE9KEBDGVBaPBDYhOSl7tD3KrS8qppwA/nnOw0BIjnHGhIAtSHqx0rTlRfsCPJSPBIZLAgXxs9ItczjtLg3seyb/Rvk/pOUkdQhrq5T27l74Jeqg29JQpZ+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rmLRf5Ck1L3hgbZSsPpT+g9LSkLIRfdCkOuhAtHXcUY=;
 b=oGeUM/dKNSGg2M8gndnjtqHkDyUIMWjQFvI4fxjBULMquvaI4PO7LU2fqXBFgOR0smOWjDagGVGvNMIsu7QyfgjLi7AOXL43EtaWuMlHKg+zHQayB3iUz36sx9NocbyrDW62qGf0BYhbif7aPTq7HDoa1tlbOqm8rOrOsZ1TOa2jn1xR0LYf4sWyIaq0DAFmNILf0xnzgXKW4anu19ZBq5Pacb2MCU/anj9tJ252ckaTgge2xPIJ+hOZyiu7aVVkhZCyxwH0bRUY6+Pka024ah/RMuluVRV+CQcZmzMFONQdbSeNxXApFWSVDQ9NdDM3dAvoYyaGuyMx+p4lyozhAQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <6bfbfc9f-1f41-1ed2-fb0e-cc7efaad9947@suse.com>
Date: Mon, 22 May 2023 10:44:56 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2 1/2] build: shorten macro references
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: Bobby Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Connor Davis <connojdavis@gmail.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <a261b10b-25e4-3374-d6c4-05b307619d81@suse.com>
 <aa76774a-0d73-989e-e054-1b30490160e1@suse.com>
In-Reply-To: <aa76774a-0d73-989e-e054-1b30490160e1@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0047.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:48::18) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS5PR04MB9755:EE_
X-MS-Office365-Filtering-Correlation-Id: 9cb595ce-cb32-4c96-727e-08db5aa0d16d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	dWflcBM+bUnKchjTkFuAJnULbEf3HgWcE0k0+psehSdAvDUgSHHnUkkHN3GqfSN3KZE1kSfQH+9ekXKGlnUtpN3vkm8OMx5yACGJ4Wnk0vE/Kp1qW8op/XUvRRYT5F1nV2t0AB36WKXDEWDJd7Ud5EjU30iEcMHh29gxNO+xTO5LzJpNF3KzBdU062+105wOaCTGnnzmEVeCqxIdqoN+Rtc+ToIw3YqZaSnkYspbUClOw3rEJTjf3NglYIU113CWD8axVThcgR1Kf/pyzOR5j7qH3H5H56J/ZPltR/axtcnwaBb895vaAvOVKuWmCZ6DW1OSSRQvFIvYcIQDBUAcKxdwCJXQwtykrfGtXbPa/tDLKoXAAkuDXtPGpAJWvCfkA7ZjAkzxNn4bCJDyEEVBmIfqZy1lgmjZed2yFeVSJNOSKyy72l1Y9QqyMAtGgzugTQzWq2dvdNaUEB6YqgvA5wOrMlO9zYB+YM+KcT16byHJ7OvRa6v/B7wkAa6pNPdcEWzLUD/xUdDWrZSzC90Z16lSwSIxrSmghRH8/BgWJUi3gX2fI5pO3ZNTAb8z1ixSMf1SN7Rb822Y8vR+txxNc42CHUTyEig99R963kp2/70cGz45AxTVQVbhZFqAngS4JIdE7D57N7h+hKW6KnTr5A==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(396003)(346002)(376002)(366004)(136003)(451199021)(38100700002)(8676002)(8936002)(7416002)(5660300002)(53546011)(6512007)(6506007)(26005)(186003)(2906002)(2616005)(36756003)(31696002)(86362001)(54906003)(110136005)(316002)(31686004)(478600001)(66556008)(66476007)(4326008)(66946007)(41300700001)(6486002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WFZ4am1RM1FOc1BZdzNSMUI1d3dQdHliYzIwWDlRK1JTS2MzM3JaaDFtL01J?=
 =?utf-8?B?Ly9LWS83SVlBd2I4cm94RWZYR0NrNWRLMENOZlZFMFMySmRGdS9DRHREWVdr?=
 =?utf-8?B?Y1RnMks3M2JJMUQ4SDhMSW5vUStKMlRkSkgwOWRpbUNpWkEydkRoVkxRT2ZO?=
 =?utf-8?B?T2VZT21XSEpxSFJWbk1BWTladUJtVDI2NmZ2K0xRUjJVR3JQR0RuVjE1RWsw?=
 =?utf-8?B?UlpoU1BBd2h5MWxGSHVRV3ZjL3BNUU1IZEJSM0p1b3N3OXUwZSsxeFMzVlRq?=
 =?utf-8?B?WWpyT0RyRU9Ya3piVlB0ZlZsUjFuYVlpYnhlcVowK3JnSXRQcVNHQzk0Wm1o?=
 =?utf-8?B?eGRqZElLQ3ZlT1hlNHBBSGw0enBlTjRQSHJUUjJQTG8yc1l2RE84b1Bkak1h?=
 =?utf-8?B?RnVBY2s1OS9zb29RUHUyN1ZtQzgzU0U4NXhtMnNQa3BSTXJvQngzNG9SeWVx?=
 =?utf-8?B?VytxcjlWcWt5cDJNdGVHSWVGcmF2Mk5UaURYbmhKT2NURytCWS9kaWdNcVJi?=
 =?utf-8?B?WWlNNytwV1AzdkxhcTlxZHplUTFwYVZic2E4VzZxVFNnZ2MweGVQd3JtWFhn?=
 =?utf-8?B?SVQ0NUkzaGduZUNQZ0NhN2YxTXd4NHFXcFBxK01Dam9hUHdwM0g5NmpESFZ3?=
 =?utf-8?B?eTV6MDFZOWlERnZzNzA0aTMxZENvRGpqYVlmRndFU2UyZnJCVDAzU3RJYnpM?=
 =?utf-8?B?M3JpazVLZGZDblVwVCt3Y2ZZQU1QL2RJQUFERytIYzN4SDl1SGc4OGxOWkxj?=
 =?utf-8?B?bnZ5SFFPVERNUUxYVTU5eXBJcXBXY2VLRm85K1FSYWpLSWZUaGZseUoxRXdr?=
 =?utf-8?B?dzF1cVlnYUdhZVhPVTJuSGRrRDM0cmtWd0E4YTk4S1MxdEg0alZxdVYxcFg2?=
 =?utf-8?B?cllSZ3c4TDJOaWtxLzBkN21SNG5ScEpSZ0ZZeGZlV3hVQkdQLzlpcmdzMjFD?=
 =?utf-8?B?cGFMSEgyZTJaUFlvR0JzcFdYYnpRVWJ4ZDNlU0ZNbHB1UlVlWFFxbHNQYlpF?=
 =?utf-8?B?anFMZmhCM2ZDVktRTWVpNjcyRSsxUnFubEJsWnlvaUZvbE1aYVd2YmMyU2lF?=
 =?utf-8?B?R1RYV2N1amIrcVBTc0lKZlJFL0ZkekhXWnVTZHc1QjlrTWZsLzhscG1wSnYr?=
 =?utf-8?B?OFJwTytnTC9odU5wOTZJbTc4a1VyODZaK1BjeDVLNk5mWURISU5tSzZFZXpN?=
 =?utf-8?B?MnZnN1FNWHV6N3QxQ0NkMGJ1STUyZjg2Nk5qSE85QWx4K2Q3MFgwRXlkcDRY?=
 =?utf-8?B?MDF5NW4xQ3JtVCtEYkFmUmRPT2FraUxxSkJQTWdJRVM1RXpZVHUvVlZ6TlVG?=
 =?utf-8?B?Y0N3amhOQWRzSUFBVlE1QjhVZ3M4TXhtdmo0N3N0OThjUVFUSUNianV0RXh4?=
 =?utf-8?B?TFcvb2Zsa0RUU0lncUcrZDVKWXRBSU5jTzlDc3dCNjVtK1p3UG5NOEhjclZK?=
 =?utf-8?B?V25qTkdsQnNmZDJNYnFzcEZuQUdyenk4bUxjMnVhWWNvNnA0RU5rMEZhanRW?=
 =?utf-8?B?Z1N5anBralNURU5EaFJyeEZnT2hBazVxRGttemxWTStuQXNGUmNaK1ZOeklE?=
 =?utf-8?B?Qk8zTDRGTkNxTmJGL3pSTktRajM5NzJLMkpzSHBCV2M5RU1jcmRibExKKzhk?=
 =?utf-8?B?ZjVNd1lDeUtrUkNDL3BPS2tVSmxYR0xMZ0oxSmRMeXY3M1l6WTlza1pRNmtK?=
 =?utf-8?B?NVI4ZGpId0x0bjJlYUovcmdpcXVQZ1VGSGIrM3FLMjl0VVNnTEVPNHo3RGpZ?=
 =?utf-8?B?K1BDS21zVDlSVDdsOGluYlc1ekxZSmxqT3ZEWXN0YUFWZkpkTlJEd0tnU2E0?=
 =?utf-8?B?UjNEczBMdzFKUGxjdFprVVU5RDZiKzBnWW1COHFGb2lJelhOb0NSNTBYYm1D?=
 =?utf-8?B?S24zTmZGa2dQaHpoMndwb0pOMGZkMGxtZ1lwYWJ1VkJMNk5PUk5OUUVkTmJX?=
 =?utf-8?B?dHYwMUZJb0xaYWdBVUpHMHpGT2t0TlRuTE9jYzQ1RXowTlYrY1VqdVFiT01T?=
 =?utf-8?B?T0dXZ1JJb0ZZNEtjQkRhVlZjZlJHVkNPZmFWd2cra2pMN2hFTkx5aTYxeUtL?=
 =?utf-8?B?OTg0c2ZZRktUa0tLUFUybWpsbGJLOWJNNVRsN2t5LytMajJvbmpLU1NZU1Zp?=
 =?utf-8?Q?d4SgojAjifdQv4eNOnUWfN7GM?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9cb595ce-cb32-4c96-727e-08db5aa0d16d
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2023 08:44:55.9551
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fOdvoWrDlDH43XB2cptlpfHiq0jMkEHQNxz8LbSnTktr5YmhmAuChHp1MUtDbHioolxNBfX+AOVIZzFeETwF/A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR04MB9755

On 08.05.2023 14:58, Jan Beulich wrote:
> Presumably by copy-and-paste we've accumulated a number of instances of
> $(@D)/$(@F), which really is nothing else than $@. The split form only
> needs using when we want to e.g. insert a leading . at the beginning of
> the file name portion of the full name.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
> ---
> v2: Insert blanks after ">".

Any chance of a RISC-V side ack, please?

Thanks, Jan

> --- a/xen/arch/arm/Makefile
> +++ b/xen/arch/arm/Makefile
> @@ -104,9 +104,9 @@ $(TARGET)-syms: $(objtree)/prelink.o $(o
>  	$(MAKE) $(build)=$(@D) $(@D)/.$(@F).1.o
>  	$(LD) $(XEN_LDFLAGS) -T $(obj)/xen.lds -N $< $(build_id_linker) \
>  	    $(@D)/.$(@F).1.o -o $@
> -	$(NM) -pa --format=sysv $(@D)/$(@F) \
> +	$(NM) -pa --format=sysv $@ \
>  		| $(objtree)/tools/symbols --all-symbols --xensyms --sysv --sort \
> -		>$(@D)/$(@F).map
> +		> $@.map
>  	rm -f $(@D)/.$(@F).[0-9]*
>  
>  .PHONY: include
> --- a/xen/arch/riscv/Makefile
> +++ b/xen/arch/riscv/Makefile
> @@ -10,9 +10,9 @@ $(TARGET): $(TARGET)-syms
>  
>  $(TARGET)-syms: $(objtree)/prelink.o $(obj)/xen.lds
>  	$(LD) $(XEN_LDFLAGS) -T $(obj)/xen.lds -N $< $(build_id_linker) -o $@
> -	$(NM) -pa --format=sysv $(@D)/$(@F) \
> +	$(NM) -pa --format=sysv $@ \
>  		| $(objtree)/tools/symbols --all-symbols --xensyms --sysv --sort \
> -		>$(@D)/$(@F).map
> +		> $@.map
>  
>  $(obj)/xen.lds: $(src)/xen.lds.S FORCE
>  	$(call if_changed_dep,cpp_lds_S)
> --- a/xen/arch/x86/Makefile
> +++ b/xen/arch/x86/Makefile
> @@ -150,9 +150,9 @@ $(TARGET)-syms: $(objtree)/prelink.o $(o
>  	$(MAKE) $(build)=$(@D) $(@D)/.$(@F).1.o
>  	$(LD) $(XEN_LDFLAGS) -T $(obj)/xen.lds -N $< $(build_id_linker) \
>  	    $(orphan-handling-y) $(@D)/.$(@F).1.o -o $@
> -	$(NM) -pa --format=sysv $(@D)/$(@F) \
> +	$(NM) -pa --format=sysv $@ \
>  		| $(objtree)/tools/symbols --all-symbols --xensyms --sysv --sort \
> -		>$(@D)/$(@F).map
> +		> $@.map
>  	rm -f $(@D)/.$(@F).[0-9]* $(@D)/..$(@F).[0-9]*
>  ifeq ($(CONFIG_XEN_IBT),y)
>  	$(SHELL) $(srctree)/tools/check-endbr.sh $@
> @@ -224,8 +224,9 @@ endif
>  	$(MAKE) $(build)=$(@D) .$(@F).1r.o .$(@F).1s.o
>  	$(LD) $(call EFI_LDFLAGS,$(VIRT_BASE)) -T $(obj)/efi.lds -N $< \
>  	      $(@D)/.$(@F).1r.o $(@D)/.$(@F).1s.o $(orphan-handling-y) $(note_file_option) -o $@
> -	$(NM) -pa --format=sysv $(@D)/$(@F) \
> -		| $(objtree)/tools/symbols --all-symbols --xensyms --sysv --sort >$(@D)/$(@F).map
> +	$(NM) -pa --format=sysv $@ \
> +		| $(objtree)/tools/symbols --all-symbols --xensyms --sysv --sort \
> +		> $@.map
>  ifeq ($(CONFIG_DEBUG_INFO),y)
>  	$(if $(filter --strip-debug,$(EFI_LDFLAGS)),:$(space))$(OBJCOPY) -O elf64-x86-64 $@ $@.elf
>  endif
> 
> 


