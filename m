Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DAE7266E2DE
	for <lists+xen-devel@lfdr.de>; Tue, 17 Jan 2023 16:56:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.479584.743526 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHoJR-0000ju-4t; Tue, 17 Jan 2023 15:55:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 479584.743526; Tue, 17 Jan 2023 15:55:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHoJR-0000i3-0n; Tue, 17 Jan 2023 15:55:49 +0000
Received: by outflank-mailman (input) for mailman id 479584;
 Tue, 17 Jan 2023 15:55:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=IWGa=5O=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pHoJQ-0000hu-51
 for xen-devel@lists.xenproject.org; Tue, 17 Jan 2023 15:55:48 +0000
Received: from EUR03-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur03on2046.outbound.protection.outlook.com [40.107.103.46])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 67b3935f-967f-11ed-91b6-6bf2151ebd3b;
 Tue, 17 Jan 2023 16:55:46 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DBBPR04MB7756.eurprd04.prod.outlook.com (2603:10a6:10:1e3::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.23; Tue, 17 Jan
 2023 15:55:43 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389%7]) with mapi id 15.20.6002.012; Tue, 17 Jan 2023
 15:55:43 +0000
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
X-Inumbo-ID: 67b3935f-967f-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WUYYWHyd+Usj0ljJ544wfkss5dPqlzewAwdnEwHk/DAnfMyYDj7NM39/J6qnG4Dh6+SJ6SWhEq2+UItlxsiH911zPjVaq8DJWIDVfu9gOh9ooeGVJFLLW+b6IySqowwAbrmEHYQQ8o7G+U23KBt2RAaMDC4R+IJxaezZEIEpugSmDfJsQOgNVMuTe947G8S5HVGA+U1NLmFR3QVv0wEJepkamWnyHq7HUvdsExNl4rjrPpXnmIF1eQAUw1Hf/rqG2K2Si8RePqtIzshhaodRMyJdNNNG9vazuEVmUYKardAQ1OBOsEs+Jk3Ic83CyuKG4q4F832KnxTEGEU85fYWiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qvZL0QLp5gwi4TE3RYXxeAqSEYBl+mDU5xcEH6xpkro=;
 b=Gm5ZZ9ZEXnyKUc6uqYDmDVVp6VyQNsg9+8Y17B6FbhHd0pVamtRqV3Kyqi85/o1pQO0KR048/i/EPZUuGI9zbOvUfV0PYdRu9SX/OjhVN2cj6VdKP59Ek1sgKKqsmEZ1VWAjh49OEqWvlkmXnrdcXKZVc+qO6yDSdcbkgMHyNywV7N4H9BWjObpAz841SWralfulkJPH3SIDEBZt+0cKeZNWmGzvhPMIM9eRsKLreFF/TSB/PQtS5kKg1H4LcH0AOWjGkuY4XvWwakwsj9uYoW1AftdlnxqSjsSh59Eclw1PETqf20Cv6RvF99DZ/N+LEPbQ0EjbcqpdXL6bJsvX/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qvZL0QLp5gwi4TE3RYXxeAqSEYBl+mDU5xcEH6xpkro=;
 b=N7odw1zka5vUjZ8sBsTE5XDsmgu8bO0Gc8ZmlMYao4ZsbPqqbAYTEFn7xKG5rMyPogpZmobYLU23E7vo8Splq0ghEAlxjfmIIF/y6HTwg5N36UQ3nA4rlqNQ7M+zxvdIrWCDHUfyZG9FEKXWby8Hj+DIXbQMClzWVESlisBh3uSIfs299lGDDTtfXTHnUdKBoM0PjD0IL0DFd/14900AAm/paJunHhhk/fwMwebviU145cNYxdrUgDb1FUHX5tQAzx73Ph50rYoWQst3G60ZvRTSiDPgmY+2LK6xAJ74eNyHkEZ0Np05r32UmEu2vBi41FiMsuLrVYsp8iFerGNUwQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <f7e7b6ea-5bc1-ba2b-5d21-eb431ecff53a@suse.com>
Date: Tue, 17 Jan 2023 16:55:41 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [XEN PATCH] Create a Kconfig option to set preferred reboot
 method
Content-Language: en-US
To: Per Bilse <per.bilse@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20230116172102.43469-1-per.bilse@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230116172102.43469-1-per.bilse@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0130.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:97::17) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DBBPR04MB7756:EE_
X-MS-Office365-Filtering-Correlation-Id: 6e7b894c-305e-4e95-b349-08daf8a34a16
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	2WgcIoYANPNl1pQ3XwBT9LBnKi2Cv7u9wYjkRCsI/i5G8ey6dLEy2Tg/xiphRtDBuJYa9RN7lALTXIOK4OL2n5dw3JfEuVGhFwCoz3ECT2ubl21OGFV15kjPDwwHel8AftJxwPlJFEaWYHWesFrqDPwM3Fsi/0w0jqd32TDGqHP8dBHY3+jZPlko2rTzlcfg333QbK3ShmOeJXCsuaghhuj/eB7GqQT1HzdQxLflxorVCJNqzjRC26TfMNBgDlzcXBA0/clGmVjK1BnebbAkQHUFsva+kN8S5Bvs99oBbmfF0uj6kAGR7YTUFmSIuhhxeDUwWmsfGJXXqCWdZaX95YqSX+YjAykofDFSYXUpP94fgccCD8AUTtoAC9ZUMniEIM+xVG71yLo/55OtseCj2U/+N98Ij9m4KgbYVfU+N7IhyjC+Blx5jOuEG/lcfGusIN47s/5+X6qV1PEQauMvru6XfanLa3XEq/mbnReKoTQ6cZ6CcuP8oTC35TyPiBq3J9b9BGUcgpKf13m32soufgsBrhExAI3lp+CTJY8LigMyzmJgMUyJU+MA6TeLZV0ItqZDEf8peCVOP+NXFTE9E3SajE+SK7LVC1CirW3sRp4X3vduuA1eDC+GMvbDPr2KwG0mIORL+7B1rxkrYBccf6EfHeWdZprMKhtL/HeSCPh/RFn1HOC/7YMGeRP+4GJVTa+3VmWqiDqa7AshIIrKgW9oJe6aNid2m9U48WFOsnk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(366004)(396003)(346002)(136003)(376002)(39860400002)(451199015)(31686004)(36756003)(86362001)(8676002)(6916009)(66476007)(66556008)(5660300002)(4326008)(31696002)(66946007)(8936002)(2906002)(38100700002)(478600001)(6486002)(316002)(54906003)(41300700001)(2616005)(26005)(53546011)(186003)(6512007)(6506007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RjJBVXF2OXF1OU81SW45YkQ2WEFWd0VIdGNmUGp3Y0VCV3o3WTcwNGVnSDFT?=
 =?utf-8?B?aktJUTVWSSt2OCszMDZ6REY3MnExS0tMTEw5VHZOdW5wVUozZ0UvTUJ5VWNu?=
 =?utf-8?B?VWpwdDRYUFpHY3NQV1JQc1p5VUozdElqSFh5QjdjVUFIN3ZSZ3F6NzZPNVVO?=
 =?utf-8?B?c1N2bStGZTJaSmVMZFo0bk90M0lXZEZ0SlJIMUVpS2liZkdWNHZWZzZrWHRa?=
 =?utf-8?B?cEZmNnZsdDIxeVRSMWtZc2VRcGFTbkg0dVJUVFgxbCswSFBjSVU2ZWpTUXda?=
 =?utf-8?B?VUVYZkUzTDlFOFlIYjI5VUx6MDlQaldEd0VYdVViVXVQZUlrdEpkZjcrVmxU?=
 =?utf-8?B?cC9ERDgrUTJnczc5Qk5zMHp4OG8yWDlwRS9WSU5oY293ZVZQNFViK2llSExG?=
 =?utf-8?B?K3dlOER4MTlCRkJLbnF2WGZGeFZDcUFUWk1xYTNySVBQU04zZWEyU3lLTjFV?=
 =?utf-8?B?NmZDaHh4SnBrSmxaNkRVbTNIZkh3TXpQNTR0SXhET0ZSb3Bsd1NtdHAzUzZM?=
 =?utf-8?B?OC9KY3VHcmlJOTFITitRRlpUdGk0K0tmeElkZjI1aUh6ZGIvQ3N2SSt2L1Fx?=
 =?utf-8?B?bHBxTEVna2J5d0llQVBvZCtkOXptenYyR3lxODkxN0YrbkRreFZ3cnA2MGFl?=
 =?utf-8?B?Lzl6bUJVb09iMkpDVTRqZmI4V0w2NG1oV3FRaGRIV2gyZ3VRSE5UQjVZZ2Uv?=
 =?utf-8?B?LzEyZ2cyaDFISTlkckJQZ1pDMjJiMVZEVGJVYStuTVdtNytUeHdxS0pxbm9h?=
 =?utf-8?B?MjY0U1Q1UDhKanZQdm5ScHZpa2RzSlN1ZDU2WjU4QVJiTHBUYklTWk5XTUly?=
 =?utf-8?B?OG14QUVGWm02OGFFUlNOaVFHWG1aZlZTWWFsNEQweEQ1dUNMY2d6RWZKT2ZP?=
 =?utf-8?B?bGQ5a3NhcHVZK3NEZnlNK1c2ckxIQVlRK2p5WUhyb1V2bWtGV0hwK0g3b0ll?=
 =?utf-8?B?ajlsdklRL3grbVQwUXFGL1VVdDVNZFFjUmIwbXlFcHV0RktOUVNqM2tmRUhI?=
 =?utf-8?B?L0dXc3VrL2VhYUVJWXVILzdQTjZ2czRSMU9tVU80SS9Jb21tRXJMOHA0clRk?=
 =?utf-8?B?M0JxamJkM0JtdWoyNXdKeGxzcDc0eHVLUksvSUdKQklzRXMwUHVlQkc5Nkdn?=
 =?utf-8?B?K1RQam0wZ3FSMDRMNWc1elBVWHQvUjFTbG44TkJFSTc0cnNacDlURlpXRnBp?=
 =?utf-8?B?cVJHVEdNZmJzdndsYVB0VWlZVGdqVWVJaTNocUQza2pJTzZMMUdrRVhSK0U2?=
 =?utf-8?B?Y0dpKzdXUGp0T0dGcTA5UDBCSEdtZG9kL2FDNDl2Vm5LM2VCYzdkN0pndWt5?=
 =?utf-8?B?SFdwRmFVcXRLNWordnQvVHExQWdNV05qdFlmQ3hOM0JodVBXM00vc2FhRE5p?=
 =?utf-8?B?eTd3TmJsZWsyS2pJam1PVDlEQ1JsNk5JVUVvWXhwV2lPWHYzeW1ISExsZG9z?=
 =?utf-8?B?K0J5ODMvMURIR2FrMzNoU2ozMXh0YlRFaEREYXNDZGwyL29MR3dnY25LL0or?=
 =?utf-8?B?elROODVaY3BlTGxmaklJRmlIMHUzSm83RzdQbnZVYnRSNnliaXZiei9LTnk5?=
 =?utf-8?B?dUlaMWR6MzcyWVB6TnRzVmpGbEpTK1gwMnM4UkhZUmRLSFZReU1kUUNmcjZj?=
 =?utf-8?B?OUk1dk1seFd5QjAzczB0ejVvelNqS3dtWGJ6WS9PSlJvbHV6Ykp0TjFxZUls?=
 =?utf-8?B?MFBETnk4ZVVGUGVQZzVDS25PUzBPQXByMktSbjJJZEMzTncxL1N1bUl0RDJI?=
 =?utf-8?B?ZnRlSGs0V0RDL1JvcDdoWmxVQzhHNk1oK000a2RZNk1tSDJsRkZWRUtGVjBi?=
 =?utf-8?B?WG12M3E0NmJMMExiOGVRd29zandSWktmMXVmclhvMzRiN0x6bm43cVY2cnEz?=
 =?utf-8?B?NmRGaXp0ZHVtMzNYK3puZitsL3VzNS9VclUyMEU1MGY1M0pMalJzb1FuUDZq?=
 =?utf-8?B?R2FUejFHOWdGMUxkaG5Zd2ExOUoxcXZVcHNCTVlMcitWM3JEY0pJR3VLMW8x?=
 =?utf-8?B?ZVdXS1A0dEhHZXhTNUQ3Q3MzQ2FMSWRFQUhIWEJzNmdLb2lCcnVwNkFqZDJ0?=
 =?utf-8?B?UTlEeUdmMzBRZ0tPbXdsaWZOcUZKZUFlNEJzTHJld2pUdm9UWmo0RnBlZGg2?=
 =?utf-8?Q?tBkO6KnoJvo9H7SYvn2eNOb06?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e7b894c-305e-4e95-b349-08daf8a34a16
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jan 2023 15:55:43.4580
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: J0WkMW9+BQrojPJ5CQhnOFDnoMH+e/XmiREZpJ2x3wXtQtmBTI9MPgd2hZ4P1QUa7InMvSCVFmyaGUyDB42oAg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7756

On 16.01.2023 18:21, Per Bilse wrote:
> --- a/xen/arch/x86/Kconfig
> +++ b/xen/arch/x86/Kconfig
> @@ -306,6 +306,101 @@ config MEM_SHARING
>  	bool "Xen memory sharing support (UNSUPPORTED)" if UNSUPPORTED
>  	depends on HVM
>  
> +config REBOOT_SYSTEM_DEFAULT
> +	default y
> +	bool "Xen-defined reboot method"

May I ask that you swap the two lines? (Personally I consider kconfig
too forgiving here - it doesn't make a lot of sense to set a default
when the type isn't known yet.)

> +	help
> +		Xen will choose the most appropriate reboot method,
> +		which will be EFI, ACPI, or by way of the keyboard
> +		controller, depending on system features.  Disabling
> +		this will allow you to choose exactly how the system
> +		will be rebooted.

Indentation: Help text is to be indented by a tab and two spaces. See
pre-existing examples.

> +choice
> +	bool "Choose reboot method"
> +	depends on !REBOOT_SYSTEM_DEFAULT
> +	default REBOOT_METHOD_ACPI
> +	help
> +		This is a compiled-in alternative to specifying the
> +		reboot method on the Xen command line.  Specifying a
> +		method on the command line will override this choice.
> +
> +		warm    Don't set the cold reboot flag
> +		cold    Set the cold reboot flag

These two are modifiers, not reboot methods on their own. They set a
field in the BDA to tell the BIOS how much initialization / checking
to do (in the legacy case). Therefore they shouldn't be selectable
right here. If you feel like it you could add another boolean to
control that default.

> +		none    Suppress automatic reboot after panics or crashes
> +		triple  Force a triple fault (init)
> +		kbd     Use the keyboard controller, cold reset
> +		acpi    Use the RESET_REG in the FADT
> +		pci     Use the so-called "PCI reset register", CF9
> +		power   Like 'pci' but for a full power-cyle reset
> +		efi     Use the EFI reboot (if running under EFI)
> +		xen     Use Xen SCHEDOP hypercall (if running under Xen as a guest)
> +
> +	config REBOOT_METHOD_WARM
> +		bool "warm"
> +		help
> +			Don't set the cold reboot flag.

I don't think help text is very useful in sub-items of a choice. Plus
you also explain each item above.

> +	config REBOOT_METHOD_COLD
> +		bool "cold"
> +		help
> +			Set the cold reboot flag.
> +
> +	config REBOOT_METHOD_NONE
> +		bool "none"
> +		help
> +			Suppress automatic reboot after panics or crashes.
> +
> +	config REBOOT_METHOD_TRIPLE
> +		bool "triple"
> +		help
> +			Force a triple fault (init).
> +
> +	config REBOOT_METHOD_KBD
> +		bool "kbd"
> +		help
> +			Use the keyboard controller, cold reset.
> +
> +	config REBOOT_METHOD_ACPI
> +		bool "acpi"
> +		help
> +			Use the RESET_REG in the FADT.
> +
> +	config REBOOT_METHOD_PCI
> +		bool "pci"
> +		help
> +			Use the so-called "PCI reset register", CF9.
> +
> +	config REBOOT_METHOD_POWER
> +		bool "power"
> +		help
> +			Like 'pci' but for a full power-cyle reset.
> +
> +	config REBOOT_METHOD_EFI
> +		bool "efi"
> +		help
> +			Use the EFI reboot (if running under EFI).
> +
> +	config REBOOT_METHOD_XEN
> +		bool "xen"
> +		help
> +			Use Xen SCHEDOP hypercall (if running under Xen as a guest).

This wants to depend on XEN_GUEST, doesn't it?

> +endchoice
> +
> +config REBOOT_METHOD
> +	string
> +	default "w" if REBOOT_METHOD_WARM
> +	default "c" if REBOOT_METHOD_COLD
> +	default "n" if REBOOT_METHOD_NONE
> +	default "t" if REBOOT_METHOD_TRIPLE
> +	default "k" if REBOOT_METHOD_KBD
> +	default "a" if REBOOT_METHOD_ACPI
> +	default "p" if REBOOT_METHOD_PCI
> +	default "P" if REBOOT_METHOD_POWER
> +	default "e" if REBOOT_METHOD_EFI
> +	default "x" if REBOOT_METHOD_XEN

I think it would be neater (and more forward compatible) if the strings
were actually spelled out here. We may, at any time, make set_reboot_type()
look at more than just the first character.

> @@ -143,6 +144,8 @@ void machine_halt(void)
>      __machine_halt(NULL);
>  }
>  
> +#ifdef CONFIG_REBOOT_SYSTEM_DEFAULT
> +
>  static void default_reboot_type(void)
>  {
>      if ( reboot_type != BOOT_INVALID )
> @@ -533,6 +536,8 @@ static const struct dmi_system_id __initconstrel reboot_dmi_table[] = {
>      { }
>  };
>  
> +#endif /* CONFIG_REBOOT_SYSTEM_DEFAULT */
> +
>  static int __init cf_check reboot_init(void)
>  {
>      /*
> @@ -542,8 +547,12 @@ static int __init cf_check reboot_init(void)
>      if ( reboot_type != BOOT_INVALID )
>          return 0;
>  
> +#ifdef CONFIG_REBOOT_SYSTEM_DEFAULT
>      default_reboot_type();
>      dmi_check_system(reboot_dmi_table);
> +#else
> +    set_reboot_type(CONFIG_REBOOT_METHOD);
> +#endif

I don't think you should eliminate the use of DMI - that's machine
specific information which should imo still overrule a build-time default.
See also the comment just out of context - it's a difference whether the
override came from the command line or was set at build time.

> @@ -595,8 +604,10 @@ void machine_restart(unsigned int delay_millisecs)
>          tboot_shutdown(TB_SHUTDOWN_REBOOT);
>      }
>  
> +#ifdef CONFIG_REBOOT_SYSTEM_DEFAULT
>      /* Just in case reboot_init() didn't run yet. */
>      default_reboot_type();
> +#endif
>      orig_reboot_type = reboot_type;

As the comment says, this is done here to cover the case of a very early
crash. You want to apply the build-time default then as well. Hence I
think you want to invoke set_reboot_type(CONFIG_REBOOT_METHOD) from
inside default_reboot_type(), rather than in place of it (perhaps while
#ifdef-ing out its alternative code). That'll then also make sure the
command line setting overrides the built-in default - it doesn't look
as if that would work with the current arrangements.

Furthermore a reboot type of "e" will result in reboot_type getting set
to BOOT_INVALID when not running on top of EFI. I think you want to fall
back to default_reboot_type() in that case.

So, taking everything together, maybe

static void default_reboot_type(void)
{
#ifndef CONFIG_REBOOT_SYSTEM_DEFAULT
    if ( reboot_type == BOOT_INVALID )
        set_reboot_type(CONFIG_REBOOT_METHOD);
#endif

    if ( reboot_type != BOOT_INVALID )
        return;

    if ( xen_guest )
    ...

? Which of course would require (conditionally?) dropping __init from
set_reboot_type(). (And I wonder whether the #ifndef wouldn't better be
"#ifdef CONFIG_REBOOT_METHOD".)

Jan

