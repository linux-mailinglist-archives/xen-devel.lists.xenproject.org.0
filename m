Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ECC4564A4C0
	for <lists+xen-devel@lfdr.de>; Mon, 12 Dec 2022 17:29:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.459833.717611 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p4lgA-0007F2-Cd; Mon, 12 Dec 2022 16:29:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 459833.717611; Mon, 12 Dec 2022 16:29:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p4lgA-0007Cw-8V; Mon, 12 Dec 2022 16:29:22 +0000
Received: by outflank-mailman (input) for mailman id 459833;
 Mon, 12 Dec 2022 16:29:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8fsB=4K=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1p4lg8-0007Cl-S2
 for xen-devel@lists.xenproject.org; Mon, 12 Dec 2022 16:29:20 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2074.outbound.protection.outlook.com [40.107.20.74])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 209e3107-7a3a-11ed-91b6-6bf2151ebd3b;
 Mon, 12 Dec 2022 17:29:19 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB8371.eurprd04.prod.outlook.com (2603:10a6:20b:3b2::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.11; Mon, 12 Dec
 2022 16:29:17 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5880.019; Mon, 12 Dec 2022
 16:29:17 +0000
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
X-Inumbo-ID: 209e3107-7a3a-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TT59R/E/mR+IZHi9A8SWUn/0pwV4dXceIqXLioIl4v8/8UENxVXqnGdjS5qiXSfE/oetsAqyn3I59w82N0VDL7XDZ5ALbjiE6vOOkcVKhcGKds+37DI8zYaPCZ0Ww6DFv8SbObyZJYhja6ROHZTy/jgarJRueQd6HTYzI6ujrC9NbZf3JIBkQg3FvxJLrLBuua0G3vZpPlLRm9te0IZzDRnuPaMALu0u2dQY48JZC6Ww8CpTF9KBI8mDYQqzdbEmXfOHHSbqUJkOP6gRfP843T9nbXNF8ln4+bPiBGY3PXRpkLsttCihwawkI+hRE7zHqDJdkDxNRv868u3tyoVxpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jCb978U2YiPzAdXBlNaAdlZq6ytl6kzLhTNf1dThXOU=;
 b=adR1KNgEdSwSmsBl98ax8V6y/ZSo85JPGML4M8kFPkl3EdXbMzebLQxxPeG4nw8iK3B7Il8qHRWDLr+f5VWAQDxfbjmOXKB9OUacUNcRimDSy3F723r0VFUfVgcyyPTt50DAnCzMZ7HQiICPmavpnXn9tfMiy7StwaKcXHyaPWoIjL6tnIh7sAUJmltNHQUXDweIbZh1V+782sHT/h26DD+OJx9vv1G8DWJeE8q2MVuphrCst5Z7oRs8ULYdbEBhG946CqJRoIaoGwyJHboe9wr5CnxasA/cQr7+JUVXoSC9DSfSXOYLCTZBgpdAefPfdyDikBaeKNRTmrP7zbRJSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jCb978U2YiPzAdXBlNaAdlZq6ytl6kzLhTNf1dThXOU=;
 b=bXJCnPhVTF9tXidcGMVJh5uetPOA/ECls270NLBNiZLdJdwVhcaSUhHXhSLTRLDCZdQgS8kNfH1RFRG2Vca3rrvOATD9L3rGfuvgzCC2hHWVFxtYwS/YYurZDPWQPj1+xj+RVBIWnlBnTlDvzvWg9NO5Z6fcq7p+es8z48bCA3/HIuSPowQfq3CocLSPHAXTNh9HrnVfJwxfGr8+Td7vEQMUxI2Xxofjh0mYEHpmNwSPgjtWDeCvXg9jN2AyzqtLq7UxYr0sYyVHt5Xe/Q6cNpslr7p0ZUfIE5s3DT/TtfoM9hHEi7sQpHYIuyJW+yq6tH9Li08f2g7mIuB/gKs1pQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <89add6e4-e931-f5a9-29ae-6a8fffe0a952@suse.com>
Date: Mon, 12 Dec 2022 17:29:15 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH 2/2] x86/ucode: load microcode earlier on boot CPU
Content-Language: en-US
To: Sergey Dyasli <sergey.dyasli@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20221208132639.29942-1-sergey.dyasli@citrix.com>
 <20221208132639.29942-2-sergey.dyasli@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20221208132639.29942-2-sergey.dyasli@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0029.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1c::22) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS8PR04MB8371:EE_
X-MS-Office365-Filtering-Correlation-Id: e92b8c1f-c655-4d0b-7d57-08dadc5e039f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	d2Q01OiNKTFUBWyK2cn6mpi6D5iA7nu5+MUObEvjURrFUmxFliHQEETjvaePRFTSJYhjiRSmpveJ3VV+5aQnC8DdF7DT199RLAjdamZ73DIT8kriNCNzhEaJKt94wKpzRm+yQM35MCUxMu6bLeaIjz6bz7/bocaGq/Q0zODsDTpXDZSUyKt71Lrt1hpfKhg7dOsscUStr7zlod6Ox6h0uwRzlyHhJt9KyVY8HadvGxCTagsvXl/1PRM4IQ2kYnGSOUbHuEvDx7mIpn7VHW0W+vNmyItO7GiNU33v7HJ9G2ULVjPPpldsw9M55LizRPQESY4s2RQ6h02xOr/2ArW0ZevmrzGG8AYUnddouuZBFhSgftdewoFKUBx00Xrs9xD9QnPVXDeZ2Adln/rgQ0X2ldfc1l7oLsEmAlvgYO7YCwshLQL/Idrxc9U8M2Z4IP7oEjygxnyzK6/C/nfv3XN1nuTfeg6jm182MqPNgJQoDlWAN8/Q6LdTyVBWyy+LtEI6aQDpGnhyvVpnodgy7AC4UDi9zB00ab2jyw0FALQ5aaIIA4MrLCmkC1GDpPt7wOFwE7PE0/5gdH+emlT7wi3MSTnY4ExZj/gO+7C3Ca+LRskk3a1CBndsrKAUIbPR2XW1YpP6ncdRXvGO97cUYjwAbhGT+yStGoFpjwTrfCP2C6Rn1QMuGkFfKWiwIZqtUXu+8JLFQ/5PXv3pWCG5klEpY/TBsz6LBnzUmf5F9G3xFPk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(366004)(396003)(39860400002)(346002)(136003)(376002)(451199015)(2906002)(6486002)(36756003)(41300700001)(6506007)(186003)(478600001)(316002)(26005)(54906003)(86362001)(2616005)(6512007)(31696002)(8676002)(66556008)(4326008)(66946007)(53546011)(6916009)(66476007)(5660300002)(83380400001)(31686004)(38100700002)(8936002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZnpqaUZlbTJrRjRNY1hibko0SzJpbG5QL1JhRzY5Vkg1Wmc3em1EUFRuT0xp?=
 =?utf-8?B?KzdGN29obWx5ZnhhZ2d3QjFzVmlrVHdMUjFsS0V3UlM0UHgxY3Z0anRXU01D?=
 =?utf-8?B?T09UM1NrQVhSb24rcFd3Nm4wOFNxNXUwR1MxT3lLVml2NHlWcWp0NnpvWVFP?=
 =?utf-8?B?QmpxSXdEQVZhb3VTem1XWHhZL2duSVc3RzJUajRURnhFbUM4UmsvU1ZnNHRm?=
 =?utf-8?B?Q3ZGeFJCanZnOERRaUhYZnFuOWYxUWw5TUdVNGNKYTJwQ0IzZjBGbEQzVXJX?=
 =?utf-8?B?VWFUUU1Jakd2cXZlbHlZaHZsTmhTWE5iYU9lOTFyUXVHR2RxNGR2TENHQlpk?=
 =?utf-8?B?ZUpoUlBmSkt4THQvd0RBNXBSZXdpYzU5L3VWd2k4M09IVHA5eXBmNzFWYVVt?=
 =?utf-8?B?YWV6VGQ0Z0sxYk5CY1BYdG9sS01USDBEekxseXo0eTJ6eXM1S3oyZGxmdWk4?=
 =?utf-8?B?UFRoVVdoOG9mR0ZVTnpybDlBYUx3cEFUOFN5Y2o0NHAzTm9hUUxRNnhWcHFu?=
 =?utf-8?B?SWdxeTlpT3RHS0pRdHZqUmN2elR3QjN3NVRESFEzdjJkUkFMdVlBVkpOZjU5?=
 =?utf-8?B?TmhiaWlXQ1hpaTN3Tm5EcEcxVk5iUElqUTUwcVBIenJrbWluQjhRWTZGV0h0?=
 =?utf-8?B?ZjB6cVowdE44R1FWVjVDL09Ra0RzT2Z6TVRtSTRub1JwV3czV0V3aE5OU0Js?=
 =?utf-8?B?VUNSVUU3SjZxOXppNm9YOEVMb1RuakZidWgrc2pjYTMwV1M1K2l5bmlubVk1?=
 =?utf-8?B?Z21WRzVZS0l0czFZOUJlZVh0WkkvWVYyUGJqcVptZE5SL2NTMElMOG5CWkJI?=
 =?utf-8?B?SmRpQ2I4RU9BUzU5MXZGNm1kVEZwL2RzZ2xmem5VVzhDOE42eFhkME5iYUhX?=
 =?utf-8?B?ZWNwa3UrVkxNNGkvdWkxVGJXQjVEMmJkcmREYkFFMk9MeTZxdjhmZFhiV2lT?=
 =?utf-8?B?eldqcTMvdEQ1Y0hDNnAxQSt4MExxZVVlcG4yZU1Gd3NGbHJVdmt4cklWZzRa?=
 =?utf-8?B?UjFPVjFEalJxWVF5OVJvK2M1TTV5a0k2SzN4UFMwc0JyY2lmeGpVYUFyTXBT?=
 =?utf-8?B?TkZ1TmhFaTFkSXhhM0lWazgrc2dOOWYvUGJBdFVweVREUEsyQU50bDI1L2lS?=
 =?utf-8?B?N0U1bmV3WjdSQlhwT0hwSjYwWnl4cnBLQUlEa3UvUHNUeTU2cy93SnE1R01Q?=
 =?utf-8?B?SzJUNUhyVXgrcFY5NUhlaUFOOW1zNXhMOXZ3cnVsUUROa3RWcjlTMlpHdXB6?=
 =?utf-8?B?Z24yWUlPRFRTOWdhaEdsRG84eCthREw5blE1TEVOYWRGQVhRUmNFWmh4a2Zk?=
 =?utf-8?B?WngwWVM2VDlNZHkxR0FDSGJubFR4ZVNGczhKSGJDR0Y0NFpXSFREdXowUW43?=
 =?utf-8?B?b0VHalNnSWxoZW8xQWdoTUVqOXl6TlNtdi92Z01KZDZrV3NWbW1XclBoakJ5?=
 =?utf-8?B?ZWx2dmpyOXdMVktVd2ZqZG5zaW5ySjFWOGJIRmw5NW9TVHJ6L25CMDFXcDZ2?=
 =?utf-8?B?VXBIaDZuTlNZVUZFdGt2M244KzAzbnlIYXFCVzdHQ3h5UHFPSHdmbG9IcGJp?=
 =?utf-8?B?S3Y5dXpxK050Rm5sSHA5VmZlYmRwQ3BKcU1PZ0ZLQmpJMEtuYTM3WktWQWJw?=
 =?utf-8?B?QURuMmdaU20vNWlWSHgwbCszZ1FOTkJVY3VqTVFta3FuZURickZUQ2p1Znky?=
 =?utf-8?B?R3JYdzhhRytER3pWSHcyc0FRWk1nYnQ2Z3d3b3ZWNEsrbG1sT0p1SEpld2Ey?=
 =?utf-8?B?amVNbkJYM0V4WC8yL3M2WWtaUXczeXBnenpLaUhJRFZVRUlTUVFzTjlZVVNJ?=
 =?utf-8?B?SzhJVE1QOVUwNXV6TWZhYllSTExQdjVMSC9KOGZ4ejRUcGRJUHNSK21YcFBJ?=
 =?utf-8?B?ZGZOMHphUUhtNmZOV3BsT3E2cU44NEs4Ry8va2dQVUpydW1aWjBOYzNRSk1E?=
 =?utf-8?B?YmN4ZnBXMXhRSHdCWWsxVVlOUnhkUTExU0xaUmZ1WGY3U2RHbUhXa2lFaGE4?=
 =?utf-8?B?bGlzS0I5MTE1U3c4aDgyUDI5dGZKZ2pxc1lESVlhN3RseXJsdTFwTTkrbEJQ?=
 =?utf-8?B?MnNYajhoMG9XTkRhODAzUEZoNktYZ1FaYU1ZbTdjeGYxUDlPQm90UDhFQlBv?=
 =?utf-8?Q?a30EqVVHpc+QhZNLPCBMyoFmM?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e92b8c1f-c655-4d0b-7d57-08dadc5e039f
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2022 16:29:17.3260
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QM3FDap3uIijyGcR7LM5kM8yVV0ecEu9zLMZ6v3fUKcsKebhpPwj+bpJXb6+5meWg5rpSm72JBIQ/vsy6sht8A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8371

On 08.12.2022 14:26, Sergey Dyasli wrote:
> --- a/xen/arch/x86/cpu/microcode/core.c
> +++ b/xen/arch/x86/cpu/microcode/core.c
> @@ -198,7 +198,7 @@ void __init microcode_scan_module(
>          bootstrap_map(NULL);
>      }
>  }
> -void __init microcode_grab_module(
> +static void __init microcode_grab_module(

May I ask that you take the opportunity and add the missing blank line
between the two functions?

> @@ -733,9 +733,35 @@ int microcode_update_one(void)
>  }
>  
>  /* BSP calls this function to parse ucode blob and then apply an update. */
> -static int __init early_microcode_update_cpu(void)

I think the comment wants to stay with its function. In fact I think you
simply want to move down ...

> +static int __init early_microcode_update_cache(const void *data, size_t len)
>  {

... this function, which strictly is a helper of early_microcode_init_cache()
(and, being a static helper, could imo do with having a shorter name).

> @@ -754,7 +780,9 @@ static int __init early_microcode_update_cpu(void)
>      if ( !data )
>          return -ENOMEM;
>  
> -    patch = parse_blob(data, len);
> +    alternative_vcall(ucode_ops.collect_cpu_info);
> +
> +    patch = alternative_call(ucode_ops.cpu_request_microcode, data, len, false);

I realize early_microcode_init() also uses alternative_vcall(), but I
doubt that of the two altcalls here are useful to have - they merely
bloat the binary afaict. Looking at Andrew's 8f473f92e531 ("x86/ucode:
Use altcall, and __initconst_cf_clobber") I also don't see any clear
justification - the __initconst_cf_clobber alone is sufficient for the
stated purpose, I think (as far as __init functions are concerned, of
course).

> @@ -765,15 +793,28 @@ static int __init early_microcode_update_cpu(void)
>      if ( !patch )
>          return -ENOENT;
>  
> -    spin_lock(&microcode_mutex);
> -    rc = microcode_update_cache(patch);
> -    spin_unlock(&microcode_mutex);
> -    ASSERT(rc);
> +    return microcode_update_cpu(patch);
> +}
> +
> +int __init early_microcode_init_cache(unsigned long *module_map,
> +                                      const multiboot_info_t *mbi)
> +{
> +    int rc = 0;
> +
> +    /* Need to rescan the modules because they might have been relocated */
> +    microcode_grab_module(module_map, mbi);

I'm afraid the function isn't safe to call twice; the only safe case looks
to be when "ucode=scan" is in use.

> --- a/xen/arch/x86/include/asm/microcode.h
> +++ b/xen/arch/x86/include/asm/microcode.h
> @@ -3,6 +3,7 @@
>  
>  #include <xen/types.h>
>  #include <xen/percpu.h>
> +#include <xen/multiboot.h>

I think dependencies like this are moving us in the wrong direction, wrt
our header dependencies nightmare. Could I talk you into adding a prereq
patch giving a proper tag to the struct which is typedef-ed to
multiboot_info_t, such that a forward declaration of that struct would
suffice ...

> @@ -21,7 +22,10 @@ DECLARE_PER_CPU(struct cpu_signature, cpu_sig);
>  
>  void microcode_set_module(unsigned int idx);
>  int microcode_update(XEN_GUEST_HANDLE(const_void), unsigned long len);
> -int early_microcode_init(void);
> +int early_microcode_init(unsigned long *module_map,
> +                         const multiboot_info_t *mbi);
> +int early_microcode_init_cache(unsigned long *module_map,
> +                               const multiboot_info_t *mbi);

... ahead of the two uses here?

Jan

