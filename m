Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 41DA06D795E
	for <lists+xen-devel@lfdr.de>; Wed,  5 Apr 2023 12:16:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.518382.804860 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pk0Ay-0001WD-Aj; Wed, 05 Apr 2023 10:15:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 518382.804860; Wed, 05 Apr 2023 10:15:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pk0Ay-0001Te-7x; Wed, 05 Apr 2023 10:15:36 +0000
Received: by outflank-mailman (input) for mailman id 518382;
 Wed, 05 Apr 2023 10:15:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gw2r=74=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pk0Aw-0001TU-Mt
 for xen-devel@lists.xenproject.org; Wed, 05 Apr 2023 10:15:35 +0000
Received: from outbound.mail.protection.outlook.com
 (mail-ve1eur01on0603.outbound.protection.outlook.com
 [2a01:111:f400:fe1f::603])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cb2f1987-d39a-11ed-85db-49a42c6b2330;
 Wed, 05 Apr 2023 12:15:31 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PA4PR04MB7597.eurprd04.prod.outlook.com (2603:10a6:102:e0::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.35; Wed, 5 Apr
 2023 10:15:27 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%6]) with mapi id 15.20.6254.035; Wed, 5 Apr 2023
 10:15:27 +0000
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
X-Inumbo-ID: cb2f1987-d39a-11ed-85db-49a42c6b2330
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Qy/7cb2mDISNV3/gwl2/8YwPzZfAY8CfbZ7+9ylJjvXoRBgM35AxFNuf1yu4CiS/wkm5GxSH8QgTDEWQslWM56XvC+l71GYx1aAbs0Us4NCpv8ZMMsal/FoOz5SwAEgCugNl3VN+VN4EsEMQWYvu5G7ZMqL6OnLIISv0v/RvjNmwa1K3x1q6MsFD6/5YisNVC23CoUK8Ny48wX4WErng96QDDALVAyg0iBjQwxnkfXnC20c9YnkpYcQi3ZsnOyKEZvyC6m4kax0E4Ru0FvjOsfJOXRd8+BI0gqgQscrS2fuZFXxBAMjow0drIXRYnXt3ApZCyKSeSlbHRyWbQaLBZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ia8dCuqc76h37XZyZZCOtQqagUqNbWQ4NOC/+flu5jM=;
 b=U3UDWhnesnxZ/llDrraQPi3wr6D0Nl/0WQUn+7Yrh0+/VXncI5C88VJKpLhJuBRjOic15Ib2Eu8rQ2LxY8nsqLHCrDtHRPA2uU5xRWpze/NonLb0gAMV5In5b13AFy8EqyN0L2rdKZ0xjo64Iyua+CGIS5gJsjJsHYS+ldPckHtT9Gj8AHXq+0zkLS1k1kI1MXyTtIdA8lk6OXG/+JGpNb/dE5fOMG/F5fW+ionaVZXSO8gmqWrv3m3UYU4x8COQsrj86SV/47vMxUgcHXYfs9KdJAXbjVCjIAJuNJ7qkOpPTp15vOWyeEhXfceBpd2NdNPVcOYukXJ/Q6pNHc9XQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ia8dCuqc76h37XZyZZCOtQqagUqNbWQ4NOC/+flu5jM=;
 b=u3rxKuPUiPGbuBDGztEkBbjx5GrWMMSEokpXejn9YYySnKg0Tz5HIO9r0tmN0u30jbhdv3OZRTrfblD4VO1zZvHAGr5CJfbs+JreqUj3vdPlmCtuxGiVqKSOQjJxMAPezF7U/OHskXM6Tkl7z58VPctkVMQtUPjzyO9txdpNtB8Jg+xGtyu93SeOtoIeiHcxz05zSFLL4eXaPJAMiu/uIRxgkYaAf+/t/gmg4HWxoyt2Ym/ZSuo9NkIKfNrN1mAlClV+3HgEhBcuzu7xvgtYXOpfC3DNojCz8lpn2Xg/z7mXx1ILpQKY8RsUxDohxkjG2Z/syJa1otlKtQFMaQmfOg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <2ee8a4b4-c0ac-8950-297a-e1fe97d2c494@suse.com>
Date: Wed, 5 Apr 2023 12:15:26 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH v2 2/3] multiboot2: parse console= and vga= options when
 setting GOP mode
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20230331095946.45024-1-roger.pau@citrix.com>
 <20230331095946.45024-3-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230331095946.45024-3-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0084.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1e::23) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PA4PR04MB7597:EE_
X-MS-Office365-Filtering-Correlation-Id: 4e1fdfc9-a63e-4a4c-792c-08db35bead7b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Fv2AMJeFHR4bWA1wnvx+09vle5+lbgWvxP1UsunTVEaXKZ+jYm9aNk0aiPKxYpglWoAkWsqk4kLSsG4JHpgCQ5e4DCTf36XRSkjnkpKjRpkMx7OhdDM+3lq7hokQraWrx895Tr+tE/HihpxMAVbXwP540YzR28vWfdx7GKmaFPXBMMbqmsAFcrBlNW+taYk2hwn4FjbL+tCBaiDcjC+lkCgEuwtro48PjsqP+cL+QCXDAi1HjRMgUd9f7uIt21VyceKd8//jLBbAcUnJWEvyiAV626Nu17c4ZYTsGvsOXvTe4jmRnPdsulmZZOU/4SP+iAUd7x0ukjnUTRzTwYtdP5sXlDSdrl64REjTeWqLziwww0b+bgaF022NpAyQOcn0yP7eg07gVucRKhW243JsFL33a0gIeUB56DhR192nh5QqfzjDyhDj+snEM0coQIPRS77vWneixbkTl0LV3A4BDmtCVhX3owa4ZmOL+ywNmdt0t20o4IlNLHlvGZpPsPDn03UKA7l3rYmiSlQ7cDK5fUcZ5K1VeUezVn7tc1UnnviB22mZrKr+PwxWDEQdmxHF2mkNptUTyiG9pdzdtwVb9+IW/j3xKelGYC2dLblW+zkQZ15mHjNioh0FnwG2HWXeCTA7VfqGb/ql2SWEAyNoDw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(376002)(346002)(136003)(366004)(39860400002)(451199021)(2616005)(186003)(38100700002)(31686004)(316002)(6916009)(66476007)(36756003)(66946007)(2906002)(4326008)(66556008)(478600001)(41300700001)(54906003)(6486002)(6506007)(6512007)(8676002)(26005)(8936002)(86362001)(31696002)(83380400001)(53546011)(5660300002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QkFqNFdydWNKWU13c2FFRTRXZHQ4WmlZdzdMaVZPbDFtR0pVTitzV21yRzdM?=
 =?utf-8?B?amREcWdjcE1TenBTL2dxMnhpL3E4U1VjZGJGMGhKamQvUmtBMGdNd2NYVTNu?=
 =?utf-8?B?bVlWV0lCWUo5eHVvN3NIbkVueTcyTmdNY0lwNGloWjMzcHJ5TU1kcnFUcDdv?=
 =?utf-8?B?dXpTUzh4dmgwUm1KMjViUklWUmpPM2ZoMktqQlh6UlFvRGJVc1kxQWZ6S1Rw?=
 =?utf-8?B?VWc2OGNNcDlaVDkrWW5LTUFhM1BBRFJxNWZUWkNYQ0tIU3QwbUViVVhORHFG?=
 =?utf-8?B?VlBtQU9Lc1ludU9xQ2xROVJzMGc0TjdhNDdsc1hocmFjSVBrbXRCUG50ZG9y?=
 =?utf-8?B?NkJPL3VtVk5URVhHS0I4cUg3dVhSSWxWY0VvUmQ3a3J1V2h1QTR5K3dsSGl1?=
 =?utf-8?B?OFZoSjBjbjZmcDRwNWo5VXo4MWl1NWJLZE5WaENEblA1UzJXbm5tYzZRbVRk?=
 =?utf-8?B?RTUyOXJzdnpmTHRKLzBlRWROMHMvKzRYMEExNlV1R2dDSzFnb3plRThIVFpH?=
 =?utf-8?B?cmw0VG5YcENjNnZrUEFBYWQxN21JU2l0NTJZMGxsQ3QxNzgvZE9aV0RSMG9L?=
 =?utf-8?B?Uk9mOER3UmdzZm9sZmI2dWxFWlN6bDBNcjZwNDZYSG85VzdMMitYVFB2Mm1s?=
 =?utf-8?B?TVhsczQzZVhGcWErWHhFcnpHeXVlMWFFWnpNVTc2S2hLZ3J1SzB4bjBzVWpI?=
 =?utf-8?B?WVlZQTNUMDgrWmk1R0ZTQld6Ty9DcnpHNXk0WHdNdGUraCtiakpocGZtcytk?=
 =?utf-8?B?N0JOVTZNYUVQSitJU3NlV3VaNVI0Mzh4b1JRSVczWGpuRTk4bzlxTnp5SlJS?=
 =?utf-8?B?eVl2Z1d0cHQ5NVhlTXY2c042dTJ4NXpmSjdVVkg1cVdFUjZVR09uV1NlZitu?=
 =?utf-8?B?RStMZTRuOWtLTHpkeWw0Ynd1aTUxaExrTUZ1ZXdUVU1GZjRwcWJpWnQ2NGJL?=
 =?utf-8?B?SmJoWElzbjAzdytzQncrRlp3d2JoejdlRDgyVVVaS0V6TC9oVHY2Q0ZHUFJs?=
 =?utf-8?B?cHV2TFZHUDN5c1RkT0Z1dFkvblVBVTRCQ1ZUM1FJcFB5VGp5QmhVbVN0cy9v?=
 =?utf-8?B?c1dQakpsYUszeEJnQ2JKT2h5cElVMGRsRlZ2TkgvM3ozWXNkSzhVcTRMdWh6?=
 =?utf-8?B?cEZGbVR6Z2xIcTBGNkNWU1FyTHhieUZKb3VZVmVqcVlJRElUcGdYRERZT21z?=
 =?utf-8?B?cjBoSFJjaWZESXltcHdTaVgrRWhDWG9RWEYrdkdLL0JsdDJuSjRFSDl2MTFT?=
 =?utf-8?B?NU0xeVVzR2pwZXkyd3F4dGE0amZNMitUVTdFTElNVUZXMkdWdUI4VWxzZGFp?=
 =?utf-8?B?Tm5Ma3diWFRxUnFMQTZGLzNoVHF5Tm1KOEtHMzhtYWxsN0kzOUJVQVoxcFZO?=
 =?utf-8?B?MkRjYzl1UkRNeWhGQzVWOGpEQmRIdWxTUGIwTjdiaDZsQmFaTjJnVmVWcHhR?=
 =?utf-8?B?N3E2ejU3WkE0ZThkdE51MjVYZk9LRjdlaS9xZkxBR2JycklWNGxlNTcrUDNN?=
 =?utf-8?B?Y21QNHVuMmNleE9aa0E0UEVyb042M1NKRWFWNWgxVlo2bUR0RVZHV0dXT3FE?=
 =?utf-8?B?cEwxZlFsb25XRDJyclV1Z0w4eTkzYWJ1VHJNUFh3MlMxV2lRbmJjV3pRdktJ?=
 =?utf-8?B?R3V1dEgvRGRad1E2N3NiNWdNSHE4M2RHb21MeXB0V1JrcEFwekY1SWhsMkhi?=
 =?utf-8?B?MTlEK3l0TmRJYXFJL01FckhpWUd0R3hLV3BFVUM4cUh1SmZzUGJWcFZmMy9L?=
 =?utf-8?B?cTA3ajVWTzlFcmVXd0VPQmNrQkRsbUF0citYSDViWi9YQ0pFMGxKWTRTTkRW?=
 =?utf-8?B?MDhlYnJJdGQwcStZb25DcHFqZkUyMGRxUlhoeVV5bzAvby82dFNBaUhLMUhh?=
 =?utf-8?B?dlNVQUluaEdYM3Erdlk1SmpDOGdpVUJMYTdCanRuTlNrRlUwanFEVzhMOHRT?=
 =?utf-8?B?ZXlKZUppMnNZem9wd2F1d25UbXhvVjd3SkZ6NURNNlZraUh1QUJNdHR3Mm1N?=
 =?utf-8?B?dmRrZ3lHeWRwWGlYSEVDYVkwTTVLVUJ2V0J6ZkFDeXVDTm1yeGo1TDl0cTJH?=
 =?utf-8?B?ZUlFR2RFT2k1VWVPZzFOMXlUMjk2Slhub3ZscG1DYXo4MHRpTXpiYWR0Vmx4?=
 =?utf-8?Q?WjjZ3XDlD+kGveY1kYuIoykd8?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e1fdfc9-a63e-4a4c-792c-08db35bead7b
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Apr 2023 10:15:27.5458
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sydkG/s6kdfCO/9vSw9pbDJcF2L5d8r4bxJA9Z9QJ63QXMmO1rHNk0CjIViKVr6+Dt9y0NEQcsCRf5SHLD0i5A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7597

On 31.03.2023 11:59, Roger Pau Monne wrote:
> Only set the GOP mode if vga is selected in the console option,

This particular aspect of the behavior is inconsistent with legacy
boot behavior: There "vga=" isn't qualified by what "console=" has.

> otherwise just fetch the information from the current mode in order to
> make it available to dom0.
> 
> Introduce support for passing the command line to the efi_multiboot2()
> helper, and parse the console= and vga= options if present.
> 
> Add support for the 'gfx' and 'current' vga options, ignore the 'keep'
> option, and print a warning message about other options not being
> currently implemented.
> 
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
>[...] 
> --- a/xen/arch/x86/efi/efi-boot.h
> +++ b/xen/arch/x86/efi/efi-boot.h
> @@ -786,7 +786,30 @@ static bool __init efi_arch_use_config_file(EFI_SYSTEM_TABLE *SystemTable)
>  
>  static void __init efi_arch_flush_dcache_area(const void *vaddr, UINTN size) { }
>  
> -void __init efi_multiboot2(EFI_HANDLE ImageHandle, EFI_SYSTEM_TABLE *SystemTable)
> +/* Return the next occurrence of opt in cmd. */
> +static const char __init *get_option(const char *cmd, const char *opt)
> +{
> +    const char *s = cmd, *o = NULL;
> +
> +    if ( !cmd || !opt )

I can see why you need to check "cmd", but there's no need to check "opt"
I would say.

> @@ -807,7 +830,60 @@ void __init efi_multiboot2(EFI_HANDLE ImageHandle, EFI_SYSTEM_TABLE *SystemTable
>  
>      if ( gop )
>      {
> -        gop_mode = efi_find_gop_mode(gop, 0, 0, 0);
> +        const char *opt = NULL, *last = cmdline;
> +        /* Default console selection is "com1,vga". */
> +        bool vga = true;
> +
> +        /* For the console option the last occurrence is the enforced one. */
> +        while ( (last = get_option(last, "console=")) != NULL )
> +            opt = last;
> +
> +        if ( opt )
> +        {
> +            const char *s = strstr(opt, "vga");
> +
> +            if ( !s || s > strpbrk(opt, " ") )

Why strpbrk() and not the simpler strchr()? Or did you mean to also look
for tabs, but then didn't include \t here (and in get_option())? (Legacy
boot code also takes \r and \n as separators, btw, but I'm unconvinced
of the need.)

Also aiui this is UB when the function returns NULL, as relational operators
(excluding equality ones) may only be applied when both addresses refer to
the same object (or to the end of an involved array).

> +                vga = false;
> +        }
> +
> +        if ( vga )
> +        {
> +            unsigned int width = 0, height = 0, depth = 0;
> +            bool keep_current = false;
> +
> +            last = cmdline;
> +            while ( (last = get_option(last, "vga=")) != NULL )

It's yet different for "vga=", I'm afraid: Early boot code (boot/cmdline.c)
finds the first instance only. Normal command line handling respects the
last instance only. So while "vga=gfx-... vga=keep" will have the expected
effect, "vga=keep vga=gfx-..." won't (I think). It is certainly fine to be
less inflexible here, but I think this then wants accompanying by an update
to the command line doc, no matter that presently it doesn't really
describe these peculiarities. Otoh it would end up being slightly cheaper
to only look for the first instance here as well. In particular ...

> +            {
> +                if ( !strncmp(last, "gfx-", 4) )
> +                {
> +                    width = simple_strtoul(last + 4, &last, 10);
> +                    if ( *last == 'x' )
> +                        height = simple_strtoul(last + 1, &last, 10);
> +                    if ( *last == 'x' )
> +                        depth = simple_strtoul(last + 1, &last, 10);
> +                    /* Allow depth to be 0 or unset. */
> +                    if ( !width || !height )
> +                        width = height = depth = 0;
> +                    keep_current = false;
> +                }
> +                else if ( !strncmp(last, "current", 7) )
> +                    keep_current = true;
> +                else if ( !strncmp(last, "keep", 4) )
> +                {
> +                    /* Ignore. */
> +                }
> +                else
> +                {
> +                    /* Fallback to defaults if unimplemented. */
> +                    width = height = depth = 0;
> +                    keep_current = false;

... this zapping of what was successfully parsed before would then not be
needed in any event (else I would question why this is necessary).

Jan

