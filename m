Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D257347C10E
	for <lists+xen-devel@lfdr.de>; Tue, 21 Dec 2021 14:54:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.250436.431342 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mzfaZ-0007ej-SA; Tue, 21 Dec 2021 13:53:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 250436.431342; Tue, 21 Dec 2021 13:53:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mzfaZ-0007c2-Nz; Tue, 21 Dec 2021 13:53:59 +0000
Received: by outflank-mailman (input) for mailman id 250436;
 Tue, 21 Dec 2021 13:53:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=GYHQ=RG=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mzfaX-0007bw-Gr
 for xen-devel@lists.xenproject.org; Tue, 21 Dec 2021 13:53:57 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 708b6a0e-6265-11ec-bb0b-79c175774b5d;
 Tue, 21 Dec 2021 14:53:56 +0100 (CET)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2058.outbound.protection.outlook.com [104.47.12.58]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-5-1JIaAd2KM56GMnJUNIA-yA-1; Tue, 21 Dec 2021 14:53:54 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB3118.eurprd04.prod.outlook.com (2603:10a6:802:a::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.17; Tue, 21 Dec
 2021 13:53:51 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4801.022; Tue, 21 Dec 2021
 13:53:51 +0000
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
X-Inumbo-ID: 708b6a0e-6265-11ec-bb0b-79c175774b5d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1640094836;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Qkjjh9kRi2Eganfg66W6tiCiZCvz3HlNuzjxCpX64cg=;
	b=US3qacgjtsdiWmZCWXyzJJlXbSA/LdWekNoo+XSCrBzXQ3Ae7LNc60HebTE3xTAFqDEaos
	lOHAXIb9VP2qLbRc71K01TzOWgcqo/rd+SWxyXROllAvqLYZVLRjoeQrB8aJcm3TjWKsnn
	21M4+EZOqDrh65Ql7QsHdydlf/h69yU=
X-MC-Unique: 1JIaAd2KM56GMnJUNIA-yA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b4190y3sv+s5BjmA6EkG74B73zQkxBCHU9A2dSj/NMm0wPeJNAR9Fbc4F6dCs4bbROxn6+QWgqVW7pIQAdy8QWein1VhNTaxFmFftyH5NULEodFiS23wNqWiXuTMybQJ+4ojDHubPIrGeoA2J+KWZ28aJDkPe6nNNoxD3EwZQMfovFr2ZJHBFAIyFUXk5fzpeV4Rr464B31aQJCWrA+wEZZ2MBDZbsZ+7P3wLRK7iw3BxZm2mbGp9tdSALUHKPVeKxuIbROp1epKXhvsjmKNCIEeMXAq/T5pfBHNxVhFsKFeNM5EfDLT5mAOQWth7YKXZsD5KC8qjigLZxXETZ15wQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qkjjh9kRi2Eganfg66W6tiCiZCvz3HlNuzjxCpX64cg=;
 b=HK2M++D6INaN4RXFi+rWKKlRxM5z136nzW7DyQEOz8wzqE+7PvUshNpiLqvOYbGHnhj5zQa2j4DO65HfEYnfwxIxXV6gZZDXQpOLd60r5Rj+E4q5sXX5Dy7lsREi12PkDIgr2dgS2oAdofpVrgJwMayw1NgnugQgQ61uxE+ymvsztJam/0MEiPNB+boOqYZw6hcUPmYTrBpoka7iokdezYT41Lo7nn1SZuDU5lRjjFuCfwVHdOTRtekAqHoGyUGPc5OXch9ftICToR+5evxV0u8pRhhXhlCsD4M/hvDyeOF1WyHMgKDHLiPuZCE8kbp1pCIbnjRtoBtvIrqr+JqVfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <57f03aed-c260-1c80-c604-0223d4603b4a@suse.com>
Date: Tue, 21 Dec 2021 14:53:49 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [XEN PATCH v8 27/47] build: grab common EFI source files in arch
 specific dir
Content-Language: en-US
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20211125134006.1076646-1-anthony.perard@citrix.com>
 <20211125134006.1076646-28-anthony.perard@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20211125134006.1076646-28-anthony.perard@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM5PR1001CA0072.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:206:15::49) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c6c8fb85-0ee5-4670-dfeb-08d9c4895203
X-MS-TrafficTypeDiagnostic: VI1PR04MB3118:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB31183858C62C2ED66FD9D787B37C9@VI1PR04MB3118.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	UkJ6JBMMfw4t2qyatlKNAENy5pvrn0+soJPZuCbU3RfV/IMnmHnM4Pul59pKVoQkQSSVHQnLc8DHTa58wH3D+ddFEhNTnlkziAFv2TXCwJ0W2uyvRFyBhZaiT1FmkwIO2ebU+Q6vygXcfGNAhYJXUyGZzwt3VA8tPeuNvuYNqRHnPEfEbNfz3IVGx3fC1CIndB3ISXqPcLzbfVYGyRV5oNIEPsUNUa1DFqmm1hiBexrwGsdLRJELa8+gl8JR+ezg9ruIhfaEqpwr+py3q2BFWygZ/FfHV62/+PhjuDMHcj/elWgkm1yjk9wRJZTlStRC5/C9vBAeIQy3wyMiF8CxkjrvT18HKccDzUHuf5k8meRcR8AB0ESzw3dabbXGlUWz5w6HHbRAU78sHEZPqB8aVEIjDHXmAtGRq9AyxWcK46jGwB/Ncl25ppXR7J8yTIWf3SJb1MVL14mPiKj5fQR/GyyEKeaN0qi9NTua7Td3nuHBYLsgRaptqDyojtvq42L18JDMXgYx84aJE/VJAv/k8IBL2y42o8IFsGgJszpMll6t/haGZqwJ/IwEio3AyPVYsnIkJcEr1FY/PWFDH1S27ThNaMb/8Bl4egSJp91/MnwO6Mk4Suf2kGMtiYqiwzVWy214d3bRBtZ+GClEgfgAzyb4BEPxe3a8o6WNFtuvpQIBjU7l1mZvl5qKD8usDcV9+roFzS3WXXi85inXQf50yOg4750t2e/hTCK0vg+QXgo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(2906002)(31686004)(26005)(36756003)(31696002)(8936002)(8676002)(6506007)(186003)(7416002)(508600001)(54906003)(86362001)(2616005)(53546011)(316002)(5660300002)(83380400001)(6486002)(6916009)(38100700002)(4326008)(6512007)(66556008)(66476007)(66946007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TWJoSWhvSnMvR1lrSm9ZV2lISmJhYi9rZjhZY1QxMWdEV0hBdXpLTWN5TUp3?=
 =?utf-8?B?dDdSMWxyMHNQZUhWZG9EaDFaSDRjVVNuZE1PUkh1ZHhPbFhlenE2RWczS0pK?=
 =?utf-8?B?RUdDQWFlWHRYbFp1OUd0MjErT3plbitNTXBnUEdvbXcxSlBOejJZbklyM3JM?=
 =?utf-8?B?TGJmUjdRUGRHaE13ZUVQemhOWm14ZlRqb0ZGSk5zZFVnQzFqSkxZUjArbWNG?=
 =?utf-8?B?a1JRaHptSWFienVvb3FnVzJmTkhXNUswN3ZsSWM3YzFaYmE4aEFlZUtLTDlD?=
 =?utf-8?B?QmpiWWdBVmtIVkZrek9EdWh2eXdSazZ4OFcxS0ZOVnR6em16WnpCL3NvOGF3?=
 =?utf-8?B?aGtyZmhxazNGVFJWSWV3U2VNYWE4ckpNM2M0Y0VXTng4S2pWWGZjdVBJYkEr?=
 =?utf-8?B?cGJKUDJZNUhtZVlscTErMlFTa0ZYSnpkM1Qra2hVR3hEMW8wLzlIZ1RZQnZK?=
 =?utf-8?B?N2d0M3crU2ovaThPQ0NqTHoxREJBcjFvOVY3YkhKWUtaUy9hRlVtNzYyTmZE?=
 =?utf-8?B?RFoxWW1mTnhpcjFSb1FsRlB5eGpiVE9rT2Z5OHpIVVNWWXZHRHNUQmRkNTEy?=
 =?utf-8?B?cXNnS09IcnV6TmthOEt6SFo5Qnk5ZnByS2dTZnIxbU9uZmxGd2RIdGgwZUts?=
 =?utf-8?B?RUVPSFMwdnMzTVpscStHUFU1Mlp4V05Bajh5TlBmZjR3UHF1c1d4b1ljZE1i?=
 =?utf-8?B?NjBpNnhzaVdEWnFQSnh2Rmxnbzc5Z2xYaCtYZDZCdDdFYnpOOEZIMlRTSEJq?=
 =?utf-8?B?UzZOSzFXekZ3TnVOa1Y1QzJWTXdJbXBIYlE3N0NET3liSXNDUkhrcUprcSts?=
 =?utf-8?B?czZnSW5JdG5tZDFzM3hXaHNwU0dYVTVZZ1UxMVVDaUt2VHNEbUdCaGFsc0U0?=
 =?utf-8?B?OEFMNy82emx2UTV1WTByTnhRZUt3TWZaazZjOEgxMTF4VDNWK0ozUlFIdnVs?=
 =?utf-8?B?SGVqWmhqQ1NuSjAzUmJTYTdhVjFYaTBhWUltM3pISUNEUE95SkVPZEVnTVhq?=
 =?utf-8?B?RjV6K3B4WHoxaHlaa3puYTMvSlpmWFV2aUxaUmJrZkpNaW96WnV5RGM3TXB5?=
 =?utf-8?B?c3pYSVd6MXNWc1V6Ulk1VDlZdytYSWVBaHRQanhDK093M3U5TW5kOUV1MWh6?=
 =?utf-8?B?TjlNdzVDQlliU3RZWGo3MWVsd0NjSU5vWWd0RldEbHU1VkJtN2g5SXJ1WWFY?=
 =?utf-8?B?M05VbERDRVNrNHluNUphQTJnNjVUQnZpSjlGcnNuclZ6S05UU05xT21xSUFO?=
 =?utf-8?B?K0R5M0ZQd1YyMWNFZ1NCcVJGSk9rYUw1ejdqNUhsb29malk3Y2djQTJpZjdP?=
 =?utf-8?B?ZjdzSkxTenRkUERNS3RJbkh0SC9Pb011K1k2MkNRTE1pR09qbldURFBKWExQ?=
 =?utf-8?B?NEZ4dGozanN1UDhVVVBJSFNrVGUrY3RIcU02QzFyNkliTDhZenBYbHVlYlpV?=
 =?utf-8?B?dWpHSUVSQSt2bC9uaFNGcWg1ZkZRSVlhOEw0bTMxcVZhamV2T01RRXkzaFBs?=
 =?utf-8?B?VFA1WUlNR2JOWTBNeUkrbW5tamFTNmFFMjZrdlVQendjTG9mQ2ZOK0lFeUFG?=
 =?utf-8?B?SDBiem5kTVVMeHdMNmdiNy9EVVdtbHdrK215QktTRUxtYWNjWjZUV2luWEdF?=
 =?utf-8?B?YVlQNXgwMGJoNktBOXpDVEswU1p3K0E5RW0xSVVLZjAvYm5tUzMrNzM3R2dX?=
 =?utf-8?B?em40cDNvWkRIRXlqb2d4R1V0OWhDM2xpc2lhdXY2VkdvTmp1Wk1FdFI3RkVE?=
 =?utf-8?B?OEVlSVQrdTFTcDlwUUxNUU9ob1BIcUFKQWxsUEpKeFVzQVFBL3RRa2xadXV6?=
 =?utf-8?B?QndBNHBGS2ZmL2pySmk5bHpwczZLUnZ6L1NHc2xTWklFRGlDV3AzMjdEUGIx?=
 =?utf-8?B?dTI5clVqbmpmb3RHZ3RkVWprTWZhN2FHK0U2YlEra0F4TW5LaVBKaFFIOU5q?=
 =?utf-8?B?MkpFWXBYdSsvWWNyY1o5a0FSd0g4NWZlbEhLUDdFWVoxcmR5aExjUEdIVDky?=
 =?utf-8?B?MSsvbXNybkNTdkF2N1ZWZGRQd0JGbUVPNUR5ajZ1Y29nSU42eWF3TDJrVDJp?=
 =?utf-8?B?RXhURTZQRUVrUUdGYzNpZGVkdWFScnlBc21TQjdCYjAvRDc3SGpjNkVRL3Fl?=
 =?utf-8?B?Y0krT28xRjlFTmJvd294TEJrKzNLNVpHUnlOWWRRVXNEV0EvTS9KZzlzRkJQ?=
 =?utf-8?Q?moEEXQqGszT/mYILFbmndGY=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c6c8fb85-0ee5-4670-dfeb-08d9c4895203
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Dec 2021 13:53:51.6144
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YjM7JRXFdx7P5AnnSIy9ahJtEBt4Ef2XCQpdsWcCRWsXLRM8sWhoqBlks2fQ7TsLzRCnboZS9r/qUmbC66anEA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB3118

On 25.11.2021 14:39, Anthony PERARD wrote:
> Rather than preparing the efi source file, we will make the symbolic
> link as needed from the build location.
> 
> The `ln` command is run every time to allow to update the link in case
> the source tree change location.

Btw, since symlinks aren't being liked, would there be a way to make
things work using vpath?

> This patch also introduce "efi_common.mk" which allow to reuse the
> common make instructions without having to duplicate them into each
> arch.
> 
> And now that we have a list of common source file, we can start to
> remove the links to the source files on clean.
> 
> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
> ---
> 
> Notes:
>     v8:
>     - use symbolic link instead of making a copy of the source
>     - introduce efi_common.mk
>     - remove links to source file on clean
>     - use -iquote for "efi.h" headers in common/efi
> 
>  xen/Makefile                 |  5 -----
>  xen/arch/arm/efi/Makefile    |  4 ++--
>  xen/arch/x86/Makefile        |  1 +
>  xen/arch/x86/efi/Makefile    |  5 +----
>  xen/common/efi/efi_common.mk | 12 ++++++++++++

Could I talk you into avoiding _ when - is suitable, which is the case not
only for (non-exported) make variables, but also file names?

> --- a/xen/arch/arm/efi/Makefile
> +++ b/xen/arch/arm/efi/Makefile
> @@ -1,4 +1,4 @@
> -CFLAGS-y += -fshort-wchar
> +include $(srctree)/common/efi/efi_common.mk
>  
> -obj-y += boot.init.o pe.init.o ebmalloc.o runtime.o
> +obj-y += $(EFIOBJ-y)
>  obj-$(CONFIG_ACPI) +=  efi-dom0.init.o
> diff --git a/xen/arch/x86/Makefile b/xen/arch/x86/Makefile
> index e8151bf4b111..eabd8d3919a4 100644
> --- a/xen/arch/x86/Makefile
> +++ b/xen/arch/x86/Makefile
> @@ -79,6 +79,7 @@ endif
>  
>  # Allows "clean" to descend into boot/
>  subdir- += boot
> +subdir- += efi

This renders the comment stale - please generalize it.

Also, any reason a similar adjustment isn't needed for Arm? Perhaps
this could even move into xen/Makefile:

subdir- += $(wildcard efi/)

> --- /dev/null
> +++ b/xen/common/efi/efi_common.mk
> @@ -0,0 +1,12 @@
> +EFIOBJ-y := boot.init.o pe.init.o ebmalloc.o runtime.o
> +EFIOBJ-$(CONFIG_COMPAT) += compat.o
> +
> +CFLAGS-y += -fshort-wchar
> +CFLAGS-y += -iquote $(srctree)/common/efi
> +
> +$(obj)/%.c: $(abs_srctree)/common/efi/%.c FORCE
> +	$(Q)ln -nfs $< $@

Like was the case before, I think it would be better if the links were
relative ones, at least when srctree == objtree (but ideally always).

> +clean-files += $(patsubst %.o,%.c, $(EFIOBJ-y:.init.o=.o) $(EFIOBJ-))

Nit: Please be consistent (at least within a single line) about blanks
following commas.

Jan


