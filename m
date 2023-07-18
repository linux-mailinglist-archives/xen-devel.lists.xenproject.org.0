Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 879007573AA
	for <lists+xen-devel@lfdr.de>; Tue, 18 Jul 2023 08:10:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.564939.882732 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLdtI-0006Ct-Sw; Tue, 18 Jul 2023 06:08:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 564939.882732; Tue, 18 Jul 2023 06:08:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLdtI-0006BG-P0; Tue, 18 Jul 2023 06:08:56 +0000
Received: by outflank-mailman (input) for mailman id 564939;
 Tue, 18 Jul 2023 06:08:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=g6ux=DE=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qLdtG-0006BA-Qj
 for xen-devel@lists.xenproject.org; Tue, 18 Jul 2023 06:08:54 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur02on20601.outbound.protection.outlook.com
 [2a01:111:f400:fe16::601])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 901e7218-2531-11ee-8611-37d641c3527e;
 Tue, 18 Jul 2023 08:08:50 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DU2PR04MB8712.eurprd04.prod.outlook.com (2603:10a6:10:2df::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.33; Tue, 18 Jul
 2023 06:08:47 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6588.031; Tue, 18 Jul 2023
 06:08:47 +0000
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
X-Inumbo-ID: 901e7218-2531-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lVP/OsEc4uNAt9CVHXgkHnvWGhJn9WKYk9q2mB+j/vRcmF4hjoPWxCAlCnUWsgQ/V3/MYyS4FXE03Vst/kJ7MfzyBpogfPCOzuE5EwXSug6FdGRpUbboEVWAAf6x6EQsjshmUasZ0GguhLnYSesrTrWrQrsaEFeMQ471lJwwHGmZN0jFuR8QUSTOjDL06pDLWbZa5VEpR9ZOfS2o1Tdz3NHXOjVwEtr6GrjYpNd9e8hiav5x8Qvhb0LzkhxcyOL7sbSgxzur4x5h/55CmgXX7sWlZSjwEaiCKlQz3D3Pjskejet1rB8XhmzJePE17hNnuNTDjMoDrCUFd1yBmyG16g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vBP945K6cV1Bfs2/WNmVrWUT6t1IWGcRBzEU6qkqe9A=;
 b=TNJJEXfrugxfmXTkNXDAr3Q+1hqRqTEcgm5NDtjYmhg+8RcedW6tItekPZHH05iNySTRAGlKviRdR1Vljvlve5zPA2M4jCwF1w/oyGDhwLb93COcphE0gCh8Ifk3A1LKrXUFr8vyT7LwJcoDlJpjO46JEcMUzHq+f/pPeVO651IiaE7LDAUtb3MCoLQGPEJDu8KXoYjhgEJyEhjoYe4Cv2tUtTLHdsv2WtDRygO7pCBFjEgelBAySivFY4XWt7M2j+OmYyFywCcseR0TvmFjGZmYQ3rIPEXyoa6jxAfiOJ+qwNHEjJPhUxrZgwwESgxEwCgLTfSJ3vbIM78s8FwMkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vBP945K6cV1Bfs2/WNmVrWUT6t1IWGcRBzEU6qkqe9A=;
 b=XqdTBc3lC2su0+pXkMCjw9Ey9Q2HPxW/uAjipRwuMU7XHI6vj9Q0KypDNOuU+1grav2H4HR363xSY/fc4PGzmc1xWLgA9O2JNGe9MZZrFZf9v2i/DwKiuTqDALfAQ7QPOn6/hFr07m1/5FbzvizojRDb3aHfvP/OYLj1Yex0cs3q3B7ofmrELxPbQ8RPxrIoGRDV6K55Ysfhe+2qxxzDYKD0VTELbeA49J+ZIuJk7Zof2y0ZTowpli9HNIg/oAGXWtvogNCSkJDJ4gxSL8BLmAwju3j35Q1CrbLkpB2Dtb/ScVmhIkO9l6VaF5pdIkoLC1vd4klGnfPb0/77kQN6CQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <e66d6dac-46d6-2626-1652-f9fec21e6e75@suse.com>
Date: Tue, 18 Jul 2023 08:08:45 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 1/3] x86: allow Kconfig control over psABI level
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <0b45bc88-fe5f-77f1-9f9c-37d9ea1ec73c@suse.com>
 <6f462a2f-2e91-6397-a527-18eeade19476@suse.com>
In-Reply-To: <6f462a2f-2e91-6397-a527-18eeade19476@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0177.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9f::13) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DU2PR04MB8712:EE_
X-MS-Office365-Filtering-Correlation-Id: 55477d38-4705-47a8-f041-08db875572c4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	+IxBn44dqrLD3bqFM0OQ/fIspNpG8x8qBhdTwbNpLr4LevJsFkpRpCdE19CXKZdTIEWmp65jve6e1m+h7R5MFXKN+Yw1HOl/01s2KfgvUNnQKky5nzCmaFMTfyin1/w8c0Gkxr+UuFDoE2iyegST8z+GSMvDZQJuuux5lgqFdUFrkbANHKtMeekjkFFfBW+TK7sZBf7NCayPgs4ehdzl17m4FNsw22+GJy/uBEctm8HH2xS4TeO02/EbuxCDl2gd7EBXiLHEx4NUo0pYWbcaUeM0b1nN5VSp0if+gvfpNlDvotQs9ohwjoilVLpVC/mKYyUe4pBsOT5W3jDPjsULFIqNHvddeaeE4klJ5tXfj9vkhN/BWeEZ46kW9+19uZ/4aRkpSSb1OUI59gjdZocLCzQp8fOGuD/VcyQodS0j4jxTw5zNpSjOYvdmemncdoWNUjFgxzL3idHC7KX0pxT+Ygkqhj/zHXZBksPxex61hQZdYmTTCAS/ftpDec0ThHTtqu5gBUBIXVzpr23aYb++Za6GT5BO+TKfgF6l8k6XgxOlvs700H1xJwLyWlrerhdbVtsqQ2imwdJdyRfS5z5rMoh0zJZ8WYYjIgt9x7bVKHqr/82R0fetHzbkmqZetPnQ2lxVkra6MTVBUz0vLCjgZA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(39860400002)(396003)(376002)(366004)(136003)(451199021)(6916009)(2616005)(66946007)(83380400001)(66556008)(66476007)(4326008)(6486002)(316002)(6512007)(54906003)(186003)(478600001)(53546011)(6506007)(26005)(2906002)(36756003)(86362001)(31696002)(41300700001)(5660300002)(8676002)(8936002)(38100700002)(31686004)(66899021)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?R0hySmdlbGZNaTUwcXlOWjZpSWhQTnFEa2wwSlNHcllhdDVyYVE0Ly9jc3A5?=
 =?utf-8?B?N2N4S0IrcnI0WEpxUlAvU3ZVVkx6YnRaNUdhSGZkUzYzZy9pV2ovcWF3cHZK?=
 =?utf-8?B?ekY0MEtySDZPNXpvRlYwUTVtNkVQRzBwV1BQODVZK2xwSXo1ODczYVBYOXlX?=
 =?utf-8?B?VjZCT3dXR0hHWEd6MEMyTkJFWVFTNFhDQStzSEJYMVZBQXpsSTlJTGVOVkJq?=
 =?utf-8?B?REZvUFNTNUpkc3NUTmtjOGdoQmJ4OXI4MkMwbHhJNmNiZERMQnFDV0pZdWdK?=
 =?utf-8?B?dkJBdVR1Zk1lOFJUUFdUek95dS9ka2lnY3dJVVZXbFpDQkZaWmtzbUVZNkFa?=
 =?utf-8?B?YXFYNkcyUXJ2TEEvTFhOT0w3MHlhY1ZwQnkwMXlydEE0bUROMU1QR1M5a2s1?=
 =?utf-8?B?bmF6c2ljTlpBaDduVGVUMHZlaEVNYkhSL2VDQmVyZ0h3dVpqaXZNREtXRWRl?=
 =?utf-8?B?WEg5RTBHcndIcXhWekJiV0dwOFYzaG9kOVdtWkRDSFhoRjV0MUZ5YmthekZR?=
 =?utf-8?B?a3UvRWZEc3RFUWVDKzZYcHZzQ2tkaGVhaUxYbmN5cklpRDRIc2ZvSDkweUhH?=
 =?utf-8?B?Y256eWZLZC80Mi8xVWZLL3Y2U0dVODFyd2U1bFlkcWFUcjhyNVF1MlBJRy9Q?=
 =?utf-8?B?MVJINnlmbTJKWjZPNlYyTnJzcTM0ekZlN0hBbjlqZVZGR2hzTG81QXdmYi91?=
 =?utf-8?B?bkgxQ1RkVXVxc0JSZEkweG9NWmZ2R2VUWVhYT25rSDgyUW55SVdCdE5MSHhE?=
 =?utf-8?B?WCtMakhJSGpJK3Awa3lCeEQwRjBBUUZQczVPKzF1OGpRSHpTZ204bGk0Y0xH?=
 =?utf-8?B?YTVHY2FVKzd3UU9WcDBoS0JFVkVwbHBEQ2FCRldJWTNMTEhZM2ViVG1EUU1M?=
 =?utf-8?B?dnkwY3JwVkFIQ2RHeEFMTnhldEVDTjRobG1aZmFSS2I5UUN2QjUzUEMvVmF2?=
 =?utf-8?B?a3BpdU1ZM2JoNkJ4QTJuN0FiYmkySUVFNGxXZkhHbENQbTBDT1IySmhGNzFP?=
 =?utf-8?B?LzVlM1EyNW9XRXYvSVRDcTFMNHJMMGRrQkNqN2VpVTk0YmdPY2loYTY3Tzdp?=
 =?utf-8?B?ZC9FdEhraEpqa2M0Z2xMbGpGWTNLYnhKMGlKbVZBMEU0UHdCVGliczRUQTF6?=
 =?utf-8?B?Q2ZnNjJWUlZNalpUdXhzd2xNWDdWN1dhcnBnOTUzcGZQVzFFWE02TWlSbCtq?=
 =?utf-8?B?TTBTWVYxYXdUU2FLTEtOOTVUVWxpMFdMR0x4UENweVBwNFIwWnRmS0FxZzF1?=
 =?utf-8?B?alQ5UGx5NDB4VGxFdUhpTTZhdnFHVGFIays3Q2tXU3F6OGJ6WFVaS2ZRTjc2?=
 =?utf-8?B?ZjBYdyt2S3FjSXhwblJpY3ZQdFhoMEtLQ0Rsd2duekVVYktZeGNKakliVllW?=
 =?utf-8?B?SFRuazNjeWozT2NoYnJ5RS9EUlRYUFhtWkFHUkg2VlIvUkFOWk85OFo5QWox?=
 =?utf-8?B?Z0d4UEoyWUFXdW5VdG5GdXY5TlZGb3g3c0w0ZXhOVkJIR3QyaXF3TG1vR0tx?=
 =?utf-8?B?Y0lLZTE5WlQ3UHJJUks2MVplcEEwRU84dTg4bHFXOE9Nb2YwNitBb0ttaWZZ?=
 =?utf-8?B?Sk9sYzRaOHRPazhEUElqSkRtOGhrN2FuL2M0TGFFbTNQdmFyKzJPMlprVE1l?=
 =?utf-8?B?OHdtT1cySytveVNJa1g0S29uUGRCckg5NU5YWFRxMDhBQnJRZkZMN1plTHF5?=
 =?utf-8?B?VWxZSzJzcFpoT2VTTDZJZDJKK1VrZEI4N01ncmtuL1JIb0FnVFdGcEo0T1ph?=
 =?utf-8?B?MjB2MnlicnZlUUEzQkxyOS9jMU9IaWpITFVrL2xQUWN4SkV6Vmg0QVNVbzlO?=
 =?utf-8?B?a3hzcElDdkJXQ1hyNEg3UzU3VmRseGRHdk5DOUpOSVlsMGd5azRjWXFuanhW?=
 =?utf-8?B?akxxWnRUeW9lREJUU0hPVDV2aEdWOWJuajZKbVV5cDY3NC9PZlJNMmxoZnpW?=
 =?utf-8?B?MmlmQWJSdzZvOGFVM2R3RkZXSFVBaG8zNkg4RThxemJMTWlkRmE2dFdua2F3?=
 =?utf-8?B?bTg5S1MyL0RmS3N3SThzNFpTdStiU1pKMjZtTTFLbE9lWUw5ajZ6TzhBMjNi?=
 =?utf-8?B?ZnRmNjdSODN6dlRxT1pMWGhuYzF5ZG9LQkYzWUFjK000OEVZTGFqSmVBa01Y?=
 =?utf-8?Q?mHVuMWzk8Z/DDhkyqmllIfvT3?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 55477d38-4705-47a8-f041-08db875572c4
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2023 06:08:47.2238
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fq7KTgfmaQ0HaMGsh/Kk5ary5vC7KFe60AvFuf8yB9mOr/LOsKRK6iHUQzQsgIT2/b06HcnJiDeHYhH+WkvvdA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8712

On 12.07.2023 14:33, Jan Beulich wrote:
> Newer hardware offers more efficient and/or flexible and/or capable
> instructions, some of which we can make good use of in the hypervisor
> as well. Allow a basic way (no alternatives patching) of enabling their
> use. Of course this means that hypervisors thus built won't work
> anymore on older, less capable hardware.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> TBD: Should we, just like for NX, add an early check in assembly code,
>      to have a "clean" failure rather than a random crash?

TBD: While older compilers (apparently gcc10 and older; not sure about
     clang) won't recognize -march=x86-64-v2 etc, we could fall back to
     passing -mpopcnt and alike explicitly.

Jan

> Whereas the baseline -> v2 step isn't much of a difference (we'll gain
> more there by a subsequent patch), v2 -> v3, while presumably (or shall
> I say hopefully) faster, yields an overall growth of .text size by (in
> my build) about 2k. The primary reason for this appear to be conversions
> of SHL-by-immediate to SHLX.
> 
> --- a/xen/arch/x86/Kconfig
> +++ b/xen/arch/x86/Kconfig
> @@ -118,6 +118,36 @@ config HVM
>  
>  	  If unsure, say Y.
>  
> +choice
> +	prompt "base psABI level"
> +	default X86_64_BASELINE
> +	help
> +	  The psABI defines 4 levels of ISA extension sets as a coarse granular
> +	  way of identifying advanced functionality that would be uniformly
> +	  available in respectively newer hardware.  While v4 is not really of
> +	  interest for Xen, the others can be selected here, making the
> +	  resulting Xen no longer work on older hardware.  This option won't
> +	  have any effect if the toolchain doesn't support the distinction.
> +
> +	  If unsure, stick to the default.
> +
> +config X86_64_BASELINE
> +	bool "baseline"
> +
> +config X86_64_V2
> +	bool "v2"
> +	help
> +	  This enables POPCNT and CX16, besides other extensions which are of
> +	  no interest here.
> +
> +config X86_64_V3
> +	bool "v3"
> +	help
> +	  This enables BMI, BMI2, LZCNT, and MOVBE, besides other extensions
> +	  which are of no interest here.
> +
> +endchoice
> +
>  config XEN_SHSTK
>  	bool "Supervisor Shadow Stacks"
>  	depends on HAS_AS_CET_SS
> --- a/xen/arch/x86/arch.mk
> +++ b/xen/arch/x86/arch.mk
> @@ -36,6 +36,10 @@ CFLAGS += -mno-red-zone -fpic
>  # the SSE setup for variadic function calls.
>  CFLAGS += -mno-mmx -mno-sse $(call cc-option,$(CC),-mskip-rax-setup)
>  
> +# Enable the selected baseline ABI, if supported by the compiler.
> +CFLAGS-$(CONFIG_X86_64_V2) += $(call cc-option,$(CC),-march=x86-64-v2)
> +CFLAGS-$(CONFIG_X86_64_V3) += $(call cc-option,$(CC),-march=x86-64-v3)
> +
>  ifeq ($(CONFIG_INDIRECT_THUNK),y)
>  # Compile with gcc thunk-extern, indirect-branch-register if available.
>  CFLAGS-$(CONFIG_CC_IS_GCC) += -mindirect-branch=thunk-extern
> 
> 


