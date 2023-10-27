Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D3B57D8F54
	for <lists+xen-devel@lfdr.de>; Fri, 27 Oct 2023 09:13:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.624231.972608 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qwH1U-0001Kz-2h; Fri, 27 Oct 2023 07:12:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 624231.972608; Fri, 27 Oct 2023 07:12:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qwH1T-0001Iu-VH; Fri, 27 Oct 2023 07:12:47 +0000
Received: by outflank-mailman (input) for mailman id 624231;
 Fri, 27 Oct 2023 07:12:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=eU9S=GJ=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qwH1T-0001Io-12
 for xen-devel@lists.xenproject.org; Fri, 27 Oct 2023 07:12:47 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20621.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::621])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 398f229b-7498-11ee-9b0e-b553b5be7939;
 Fri, 27 Oct 2023 09:12:44 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PAXPR04MB8457.eurprd04.prod.outlook.com (2603:10a6:102:1d8::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.11; Fri, 27 Oct
 2023 07:12:42 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d924:b650:a2ad:7b25]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d924:b650:a2ad:7b25%3]) with mapi id 15.20.6954.008; Fri, 27 Oct 2023
 07:12:42 +0000
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
X-Inumbo-ID: 398f229b-7498-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Su2ApsWZma/UBuu3b2gJ5cGa996t6bnl+Ffbo8XQZqT3sirL55XEaHfIVpuMspoOUTzR/ytf5ZTt5XkDgC2LGI6Ayc1AMpseSF7g58fR3Ligv//f6Q9kcxYh9Jgll1nsJP+/olwhhFRhhWaFHRl7RTbAnenh3bQdF8NmPWcrK8E7aCw+m4gqEZA1hA6NiPbDNWpAMCV+CC9ZU68ZBQsDYzuH8IaDSStWSUFnayxDIvCbY41HBplA4eNgAt6dv8H+NCI4qLUADhZuV1pWZ/cLo0SvHqKoSWMDvsxUbIuualZdICN1ELLAo2E4eAXuR/Vbupya1AJEzAYAPlOnQOeMDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZvCfxPBt0rbg0fD7wk13ly8mIejfQGicuvEoaReozpg=;
 b=hO2jdCue1jx2+ECrbCijn9NxguGFqyRx8fpgmf11EQJUGnpxYja5Vv8XbYEszzN0xYpTz/ExZ/05mzQ2oVADwMtxx2/wh2Qok6P1NgW7VDJ4SAmouImiTnqniZ5W7byWoKkrV4HKp3uMhK/mz/hfuCUfJP4wVbUWjJXIpmlcZBKMsSL0GuqKpFM5kUgqB8ZzhDSKtkRv8sZBAbW7GRJj58FPM4bQaM3wSno13EPEia1l4ayPnPk4mdh7HS5bRy8qw29gR55Yjv1ZkiIE80F4XKKjyC/WOsomK7SaQaAF1ZxzphsqSr3APC5lDXZyAebjnjSGQcAnxWWnylw9vaf95g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZvCfxPBt0rbg0fD7wk13ly8mIejfQGicuvEoaReozpg=;
 b=atcrkUDG051WR5WBpKKlFih5DW9+Zo9nrskfKWJTzKtaIzJw371FoqPo2+2YCec40g+Qt/Q2c9VxNlBBhOk+kNLhhZx8ZmjX8YtSHGabqnqLr5stcfRHnPP15NsXRABKensdCl41O9daLlnCw4H+oHpkwjKj9qRlEX2wqokvFNVTy/2veIyxj+ZYEM6WccRe51LBaOq424Oj0sqDSwP2jvwJ1iTDwTMCk4cgSN3/9AH4D3mcg1jEtjy2MRHDgh9dHX8rsH7yE3Qi4VpPjwluHzn1SC7t/oL89lXsjO1YIN2mgiv4gVOUl3HGSKO4/gLMw59U2CkgkN16lG+pB7pXvA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <70472259-6429-e60f-7cdc-faa50b2d257f@suse.com>
Date: Fri, 27 Oct 2023 09:12:40 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v2 2/2] x86/Kconfig: Introduce CONFIG_{AMD,INTEL} and
 conditionalise ucode
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: Wei Liu <wl@xen.org>, Alejandro Vallejo <alejandro.vallejo@cloud.com>,
 Stefano Stabellini <stefano.stabellini@amd.com>,
 Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20231026205539.3261811-1-andrew.cooper3@citrix.com>
 <20231026205539.3261811-3-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20231026205539.3261811-3-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0063.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:93::19) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PAXPR04MB8457:EE_
X-MS-Office365-Filtering-Correlation-Id: ebf1ca2a-608e-4c16-e0a7-08dbd6bc1c50
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	rdIjc1pJvg363hnppoVhyL3o/bDhfptN71Fg/w82xkW5E6v8yi3GcQfm7HcOmhIguEeL0M3kDLZewMqjZNiPwev/PS2L38dZS2e/Gqz62VEeZql/HvpS5WbFfZIQiDkReAKlTu97SOceSWYhby+6VNGKHrEy9dyTdf3lj5hn+KzY/hjBIeDTsiGagcp4mHEhEC3olhz4IS7m0FyavKNUII6lwGzD6EnBtZ713zjGHk29EFDJOqRDtBwSwJUfwmUL9IggskV/CUdpl6NbQ+5b757BCX4HY+7bMH/YJepgGPXGTh9LxZv0AYgkFLE7NpYOFIVz8kHIUsZ+Oi0W35bXMrEt7XfPIhLtUqnT9X3mJ/s9H8JuvK5az42v0vl90xTJ3K9OlshjZsxkU8T9N4V/mBDLvXsaPxK738EEwrCmYy13Lz1JEIdj9zuvc69pQg0nSfB42DcC+beNL2FW5teKCyhgxIwtaYYMGKl3N5i3vVLRmHV6kB/f35hQIzNNfS3QEatQfnW8i3wtNe9Yuw03+QzIrW3WqHhs5uXfzyUM4P90VDNO6OVKCzifpjnrRGaAzkSOk34C2xJ48XAI5r1700KCGaeSdgikPybE1+KrN7TgCxeY64xAYcHITFIOG2T8XiFvpx1J2JrYEr8k3gedMA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(366004)(376002)(136003)(396003)(346002)(230922051799003)(186009)(64100799003)(1800799009)(451199024)(2906002)(53546011)(6506007)(6512007)(86362001)(26005)(31696002)(2616005)(316002)(66946007)(66556008)(66476007)(54906003)(110136005)(6486002)(478600001)(83380400001)(38100700002)(5660300002)(4326008)(36756003)(41300700001)(8936002)(8676002)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VWZWR2dhcXptV0VaMzhOOTU4bnozMWF5VTNDNm9hQjBnUGorQ0Q3MmtEMXpm?=
 =?utf-8?B?TzU5NjZHYlVSUUVwdU10dENjLytFZWY1SHZBMW5UZHZ3YzArQmFYcFFGdnZK?=
 =?utf-8?B?dTBWeG92MXlrK09ndVJQRUlYaE5FdUVvditXNlNlMGRITEtGbC9RYmJRY3Iz?=
 =?utf-8?B?S3UwYlBab25GcEJ1L1MyM3FWbkhFdXkrQ2JOdWxHM0FVTGpnNmdpL3poZXlT?=
 =?utf-8?B?ZTBKRkdhU010akI2ajdRay9QRXFVc2tCRG01N01nUXkrQjI5aWRVcDJpc3JU?=
 =?utf-8?B?WnBLRGFsOWhPa3U1MHZFaVBhRU5OS1RmMzBjSjBxWUc1RGUrc1U3L01KN0VI?=
 =?utf-8?B?RExTZGlBK2dKa0FTYTFwb1BOUkpnUThyQjNQbFdGcG5MdE9sUFBaODFFZ1Rw?=
 =?utf-8?B?bGVmVEZjWVBUckdnZEdod3NYQy9Cc2IvdWxFWEdnVitobUI5ZU85cU1lQzVY?=
 =?utf-8?B?L1hiZlZHNGxaWWJzcXBMRlgxanFFRkRGNjRWMlN5RFlTTkJoSit5RGROU0M0?=
 =?utf-8?B?OUJLN0lPdUdwNWJDYm9tT3VNeDl2M2dDZFIyRFBWYXFOQjdyeml0WXpPZEdv?=
 =?utf-8?B?Nnhhdk5kTHZucGRBckVkMjVLMmd5Z0YzdkpKTDU5QXVIREhZMkZidlF2a3pI?=
 =?utf-8?B?dFVQR1lqM1Bna0xLVWFYZTFFN2VyUERhaHM0Rzl3MjBVdmJPbDlocEJNdHpj?=
 =?utf-8?B?N2IwTmF3d3NLZG1OM1RoWHRaMkk4bGN5SktreU9lZW9nN3IyWEZyS21seURZ?=
 =?utf-8?B?MUlWaEJwU0FHdlFad1BvMEU2Y3dvQ25VcWROdEZvcmRzVFJaRHBNTkR1SWJF?=
 =?utf-8?B?czNFbmVHUCsyamlCUkd4eFhLdFNGSk5NZDg3VHh0VXBqTG5Nc1Y3MjFVMldM?=
 =?utf-8?B?b1poQ1lYd1VXR0Y0NUVKLzErQ1ZnazcyS2h6NGxLMENtSmpJK2Z0cnBvN2Nn?=
 =?utf-8?B?Y0RYbHRyeGFtaXFORHBDKzRiUTQ1Q21Ba2dxR3U3SFNlc1B1V0VoN2szVENy?=
 =?utf-8?B?RXdhRXB3YUw1dVVtZkc0M3g2QWJKRDJIaytMeUh2Z1ZaRkwyVERTMkJLQlJw?=
 =?utf-8?B?U2t2QzhYaW9vQktLZThDNjNpekdwMzNIVzVZTnp0Y1VhbWd4V0d0RzZpVlR2?=
 =?utf-8?B?MlpDN1phRzIxZHcxeFhmWkhZc3UvazZ1MjRmSXZuc0hYeXlSdHJsU00weEx0?=
 =?utf-8?B?U1RTS0c4OW0xWTZWTFUzK295SG5zTC9lbHI5K1cvQXdyQUUrL0FNRTZsdkdJ?=
 =?utf-8?B?dU5pRUlGMERUQ2JQQ2pHc0h0UnhWclQ0cUdnQTJjNWhoMXZRMjFoT1NFWVIx?=
 =?utf-8?B?N0ZLWmZ2THpadUZ2S3FqM2E0cjBZUDlHUWFJWXBZYVp1U1FZSkdXY0FRRTVw?=
 =?utf-8?B?Mm9JTTZiVmhYS1I3RmNhdFdzdFJJditVdkNVYnJqUFVSdUd3SzdPa2Zkd2p2?=
 =?utf-8?B?bmM1aCtlMis3M3N0bmp6eDhPUEZCZ2x1OEpFdUV1ZUlsN1dpeGRIaTlVYmhw?=
 =?utf-8?B?U1p5d05GQ3JKUmt5RlZ5a3Z3TUJGWjVxSFRVd3lwb2JIM25WaXcwQ1dzQ0F5?=
 =?utf-8?B?OXRFNklGVTdybStZY2lpQjBYZHZHNkE0UVpiUDVKbW1idVVnU3ZLNnFNSVNh?=
 =?utf-8?B?TG54ZXNLa0dhanFqdHJRdEg4ZXBXSldkdXpZY3FDQzYyYUsra1kyc1dNTFhu?=
 =?utf-8?B?ZGlyTUpVS1kvVGlDcVlUSlM2L2dxeTEveG9VMGJqSG5BL2xtei96Y3g5cytH?=
 =?utf-8?B?UlVqQ3pROXBKUXo1b242bldvdWgwSTg1SmVwREtXU3V6UHAyenJRemFMRWdl?=
 =?utf-8?B?MWI1bXhocDlSNnBJZEtGTko4NWV2SkZDR0JWZzBIY1J5RHhxa2NhRUhjb2dX?=
 =?utf-8?B?OFhJTmUzdVI3TVc1VmdxdEswVmpOVXl2UFpuUnpjMUcvWWtEUWgxYllpdjIx?=
 =?utf-8?B?SWdkeE1VMFRsL1VLYjI1ejJxVm1RMDZxSWdibXpmVmJhUjVWdW9abnd0MXJz?=
 =?utf-8?B?bzkxejVpYW4rNVhsNlY2YnlYa0o2VDE0RWV3SDNXRU1BSTZHVVNYSjQzSUdL?=
 =?utf-8?B?OEI5QTBlNmYwbEl0alhNNnlYMGl3aFN1L3F6L0hCNytJQy8wRWsvaXFhMnNv?=
 =?utf-8?Q?BrDGiChHc3jwVeLBaHz/sJfot?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ebf1ca2a-608e-4c16-e0a7-08dbd6bc1c50
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2023 07:12:42.1564
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CZil1dJ2bpj6KOg1wAAfVzOPDYvlxEm9sq6bSBDMO64bIYaUd4NSUszGHRtS9LYW7jG+VbeWa+u1nBeXxIyIoQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8457

On 26.10.2023 22:55, Andrew Cooper wrote:
> We eventually want to be able to build a stripped down Xen for a single
> platform.  Make a start with CONFIG_{AMD,INTEL} (hidden behind EXPERT, but
> available to randconfig), and adjust the microcode logic.
> 
> No practical change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> CC: Wei Liu <wl@xen.org>
> CC: Alejandro Vallejo <alejandro.vallejo@cloud.com>
> CC: Stefano Stabellini <stefano.stabellini@amd.com>
> CC: Xenia Ragiadakou <xenia.ragiadakou@amd.com>
> 
> I've intentionally ignored the other vendors for now.  They can be put into
> Kconfig by whomever figures out the actual dependencies between their init
> routines.
> 
> v2:
>  * Tweak text

What about the indentation issues mentioned in reply to v1?

As to using un-amended AMD and INTEL - Roger, what's your view here?
I'm not outright opposed, but to me it feels misleading to omit CPU
from those Kconfig symbols.

Jan

> ---
>  xen/arch/x86/Kconfig                 |  2 ++
>  xen/arch/x86/Kconfig.cpu             | 22 ++++++++++++++++++++++
>  xen/arch/x86/cpu/microcode/Makefile  |  4 ++--
>  xen/arch/x86/cpu/microcode/private.h |  9 +++++++++
>  4 files changed, 35 insertions(+), 2 deletions(-)
>  create mode 100644 xen/arch/x86/Kconfig.cpu
> 
> diff --git a/xen/arch/x86/Kconfig b/xen/arch/x86/Kconfig
> index eac77573bd75..d9eacdd7e0fa 100644
> --- a/xen/arch/x86/Kconfig
> +++ b/xen/arch/x86/Kconfig
> @@ -49,6 +49,8 @@ config HAS_CC_CET_IBT
>  
>  menu "Architecture Features"
>  
> +source "arch/x86/Kconfig.cpu"
> +
>  source "arch/Kconfig"
>  
>  config PV
> diff --git a/xen/arch/x86/Kconfig.cpu b/xen/arch/x86/Kconfig.cpu
> new file mode 100644
> index 000000000000..3c5d88fdfd16
> --- /dev/null
> +++ b/xen/arch/x86/Kconfig.cpu
> @@ -0,0 +1,22 @@
> +menu "Supported CPU vendors"
> +	visible if EXPERT
> +
> +config AMD
> +	bool "AMD"
> +        default y
> +        help
> +          Detection, tunings and quirks for AMD platforms.
> +
> +	  May be turned off in builds targetting other vendors.  Otherwise,
> +	  must be enabled for Xen to work suitably on AMD platforms.
> +
> +config INTEL
> +	bool "Intel"
> +        default y
> +        help
> +          Detection, tunings and quirks for Intel platforms.
> +
> +	  May be turned off in builds targetting other vendors.  Otherwise,
> +	  must be enabled for Xen to work suitably on Intel platforms.
> +
> +endmenu
> diff --git a/xen/arch/x86/cpu/microcode/Makefile b/xen/arch/x86/cpu/microcode/Makefile
> index aae235245b06..30d600544f45 100644
> --- a/xen/arch/x86/cpu/microcode/Makefile
> +++ b/xen/arch/x86/cpu/microcode/Makefile
> @@ -1,3 +1,3 @@
> -obj-y += amd.o
> +obj-$(CONFIG_AMD) += amd.o
>  obj-y += core.o
> -obj-y += intel.o
> +obj-$(CONFIG_INTEL) += intel.o
> diff --git a/xen/arch/x86/cpu/microcode/private.h b/xen/arch/x86/cpu/microcode/private.h
> index b58611e908aa..da556fe5060a 100644
> --- a/xen/arch/x86/cpu/microcode/private.h
> +++ b/xen/arch/x86/cpu/microcode/private.h
> @@ -70,7 +70,16 @@ struct microcode_ops {
>   * support available) and (not) ops->apply_microcode (i.e. read only).
>   * Otherwise, all hooks must be filled in.
>   */
> +#ifdef CONFIG_AMD
>  void ucode_probe_amd(struct microcode_ops *ops);
> +#else
> +static inline void ucode_probe_amd(struct microcode_ops *ops) {}
> +#endif
> +
> +#ifdef CONFIG_INTEL
>  void ucode_probe_intel(struct microcode_ops *ops);
> +#else
> +static inline void ucode_probe_intel(struct microcode_ops *ops) {}
> +#endif
>  
>  #endif /* ASM_X86_MICROCODE_PRIVATE_H */


