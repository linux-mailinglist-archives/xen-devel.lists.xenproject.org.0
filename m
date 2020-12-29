Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D0DB72E6FB8
	for <lists+xen-devel@lfdr.de>; Tue, 29 Dec 2020 11:52:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.59779.104833 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kuCb9-0007VS-Kv; Tue, 29 Dec 2020 10:51:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 59779.104833; Tue, 29 Dec 2020 10:51:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kuCb9-0007Uz-HO; Tue, 29 Dec 2020 10:51:27 +0000
Received: by outflank-mailman (input) for mailman id 59779;
 Tue, 29 Dec 2020 10:51:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+dLv=GB=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1kuCb8-0007Ug-45
 for xen-devel@lists.xenproject.org; Tue, 29 Dec 2020 10:51:26 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8bb1bf53-6a7a-476a-8b59-17376edd97c2;
 Tue, 29 Dec 2020 10:51:24 +0000 (UTC)
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
X-Inumbo-ID: 8bb1bf53-6a7a-476a-8b59-17376edd97c2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1609239084;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=fDTtDBAqlmv4prZld/cMmwwyDEnl9C5kbUHypT24eAA=;
  b=HCGN5bT0HAfuZ4XvO9Y1m6ZMN2my3xklYpfsJTc4HJZlpfCBGH4g++0a
   qkVMnqj1BG1oAWvwjE7anvEuvlsYPf66sLm3HEjlPdgN6zGNwjyauZe1z
   oaDrt4v1kj6UFTigL+XpMRt0Ul1WWY5Pc8fbUFuGlYyYo/3ZBOW1GgdrG
   I=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: NedtSPx6ihld52GWYzZKDEfIH+4J7Rq/jzwLon1bHAlqof2PhyJwkoTyFZ5R9nCyzpJlBAy5OG
 6xoEeVwmGEbru2ZgfycHLCXVomJdAcErX3i1iI6Q+XxzJSAxNcjBlPKx1CL0NqURpkFEQeSrzV
 jDrRN6WEfW1AUyxvgmuyQP32dKDi0s8NGAbKu1LNnoc99X1/1VVAQyvsxTVxDFWVH/x0gRETuy
 k7Ilecyxoz6JcNOuJGnwsxKTDMQnw/Y7YTBY9+aFju5Q7mbMYde1IqFJxDZZCrUme8NFAInmK+
 HaQ=
X-SBRS: 5.2
X-MesageID: 35335118
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.78,457,1599537600"; 
   d="scan'208";a="35335118"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YQFxykOBHlQrwl8VJ29VpS/+M7KrUzCrIdDf6pNI00jFXXh+VWDVwYktqwEIsJuPkWpU27y1VbhhI1066jrYp3B8vRotuNICus1t0z2dZbd2IHEoFv7au7pUJuV1J0VqyLuHvnh6HOhjlcaK4f3+R5B9qkXcoDTgOfSquZ+aX26OAskr3txQ2F3Gv0cL8tFMDmHGwFNvnc0Kt7y3TvcWz4+ZhMZTdPwNCHMUGfoYau6GoBVe4dcVk/3Q7OnD2yzqdDtaNFwKeTRHWDaIDVr1FkZEVK7HHrP7/bgm7hYPvDZN0gFoEJQe7WykRawX5h8Eqlg/S1E0tzAK7rZ1lfCo/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qG8/AL35yjMCHqR4iyWD6TLIat3zqRylgKO2oXOs8sg=;
 b=Cv8r6M3JXMvf68j7rGDvGWI+fVeDUzN9dVYKACgdROvT4jIYKrRxvQIYfOUOVGApCMUTJbGUx4AZkX99njZO/OSafpcmlBe/cHKx/AGmFTWhDX3GsApREpMlafJQn+VeQb+te8IBo6jliTJAHN0q9LFZXdei7STI6SEA9Eo+Wl2JFXEsYxYwsFEi9tOQIMMJitn7alSqcrfVzjxzZHUI0nlQgk5+tRhPHI069kSdnYgpkAyoVPmhJJpT6SijkhLHy7nRc98jZEEx1nNmq4PON4yl81zYmCHbDOgsM0JX4To7821pB26tTlG6HCFlHGx74W2HETaH8PavfGsRKjzkUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qG8/AL35yjMCHqR4iyWD6TLIat3zqRylgKO2oXOs8sg=;
 b=hEzxRCPhFcTomiNiO+ioVRxC7qZ1apyH0H+kcd5sMeQ+1LmaRXximvmyWJ4ZQE5Yo9MqAeY4dUwPGeDFWVzJKfx+NsScaiHBMOTDdruMH2fYkmJc7HYta/sWjS7sFngwv54ioWsABvvb8A3U7o7ykR0yKXVnXeD+4+jqADeCG9Y=
Date: Tue, 29 Dec 2020 11:51:16 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, Julien Grall
	<julien@xen.org>
Subject: Re: [PATCH 2/4] x86/ACPI: fix S3 wakeup vector mapping
Message-ID: <20201229105116.hfg3mtjzsga7dia3@Air-de-Roger>
References: <7f895b0e-f46f-8fe2-b0ac-e0503ef06a1f@suse.com>
 <c0210cbf-c07d-7fa6-2ae0-59764514836a@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c0210cbf-c07d-7fa6-2ae0-59764514836a@suse.com>
X-ClientProxiedBy: LO2P265CA0257.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:8a::29) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f174951b-2d97-4681-342d-08d8abe7ada5
X-MS-TrafficTypeDiagnostic: DS7PR03MB5525:
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DS7PR03MB552509305555A472F957C6E58FD80@DS7PR03MB5525.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: niAJg+H6clg4XW6eEKRTjRWKt9Z0CuLozPEkIcFDa1wUwi8s8pCx7g5ToKfFWTIAyZZVKeeymWG8J5JnX6Ly2TwbrLZurmBG9Xq30++KSgOK1Wdu1xlAJtS2mXWRaoBGOT9Q/8p+v1FWHjQhIUg5QKrxYr+tcY3BT35bbK/GHwPZUMpz/gW090xtI4nBO3GpkbprAK+7iJDdhFMdB1DfnsG0QhJ96P68VvLgsU+XErjEjvczFRMbJ+crcS9oeihWzf0l9gwIjgF2Kzfl41bvnTlYR6rSUyB6JypG1DgiyAiymIgeaAAfU4SntIejqKlY/TBhTyAplcVe9T+1Lp6aWkEMIWJLhHTLeydIhD1NhEOxdhXRt4AWlD0FkvTnzhGcXgtaEqDk1EK1lv12YO9VvA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(376002)(136003)(346002)(396003)(39860400002)(366004)(86362001)(8936002)(66946007)(6486002)(956004)(83380400001)(66556008)(4326008)(54906003)(478600001)(2906002)(316002)(8676002)(66476007)(5660300002)(33716001)(6496006)(1076003)(6916009)(9686003)(6666004)(85182001)(26005)(16526019)(186003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?L3JjRk5TMUoraEtiaWpTZVFaT0xBaW1haEVOMER2L2hiV1QxbHRaVmxnVXFZ?=
 =?utf-8?B?MlFSL1NRTitLUmM0bE1TRHBGWkI1aFJHMFdOdGVKNkNVWHllNVVNS2p6L2NG?=
 =?utf-8?B?TlFnOFB0dzlzU2Q3WWJpN0FGM1VsOVJhTEF5L1haK1lCVkFLaSsvT0lVK1Er?=
 =?utf-8?B?NnFROThCUTZScXdKQ1BtZ0FqRkszZTNJaHRHMkc0REpEYldUdkZzM3Zmd2Ex?=
 =?utf-8?B?OXkzVnorelZUZ0p6N1dpT0xBdjFvSE4yVm5JUUE0MlgrRFFaaGhJeTk4RkpE?=
 =?utf-8?B?ang2a0ZidlFhdk9oN0FkYzNZOVF0SWlNR242Nm9ybVZEa09FVUwveEtpbkVy?=
 =?utf-8?B?ZG51N3J1K2lzcVE0MU5UZnQ0cVlMOEJvcDBncE5YbXh3blE5ckxWVW10QlFs?=
 =?utf-8?B?OWpaM3FTVk8wRHQ4WjF3d1BkckdiZXJ4bFI3cG9sY1BaNTJmNFFSa1pXS0hZ?=
 =?utf-8?B?dzB5alRPQ055K2c5Sy9SY0ZBeWlScExrZFBEdVFpU3B0WkRzL0E0a3RVZEE4?=
 =?utf-8?B?UVR2bWNybVkzMUppajE2cVdPa1BNbXpKMXdzUDlpNlpscmhkd3BiOVlkcnov?=
 =?utf-8?B?WU1hRDl6M3Z2aFBkRlBsbzJRTHFmemhyeFdlOHJPYXNpTHkwSHlSODF5NWY3?=
 =?utf-8?B?Qy8yUnp2WDN6Uzk5cGd3Q1hVMlQ3UkU1d0IybndjYjdVOGxnTW5mTnZBbnFJ?=
 =?utf-8?B?eGVINzZuTGZDUHhNN1JianZkQjlOUFhsS2Rkc3YyQkJuQW9zWGdzSnNxNURG?=
 =?utf-8?B?cVlLYVg4L2w3aWF0OVRDeXpYM2d6VlF3YlRub1FLZ1k0N1Bla3h6eWtzT0t3?=
 =?utf-8?B?MUE3TlA2M0xKazlwaWl1OWhpSUNmTnhManQ1SnZhR3dIdGlyUlJZblFYYjRB?=
 =?utf-8?B?R1J1azZJSUVTd0FsT1V6bk5ZMUVDQ3BQUEhPc3R0ZXdBS21wUTFkZ2pVUDBt?=
 =?utf-8?B?dVNPRGcwY1RtWEV4RS9WeHBmMnJDMGM2SDFmbUM0OVhpMHNUTXNLUm1oSXVH?=
 =?utf-8?B?OHczdGdkMmdEV0JpUUJ1NUt4RVpFbWZaVTFRZXdPVjVSenF0eEFFSnJGUks0?=
 =?utf-8?B?RGJhNm5JRWlqN1hPOVdKQTBack45WkdabHVYTDhJUmJJUG5TQUV6czhZMGNI?=
 =?utf-8?B?cVJhalBwNEoyb3lSQmwyTDR2VGk0NGkzR1dQME5XY0hUd2ZVTzBkSzJaZm1h?=
 =?utf-8?B?dmhwZFovaFJkalEraHVTMTU4Z0tjVVZJNFozcTZ3TEtUM2xNSXZCRkM3U25L?=
 =?utf-8?B?QVdCUHRmZ1U2cWJJek5VdkFhR2hYSVVkd1FtQ0swQnRkSDVEMU9YeFhONWxL?=
 =?utf-8?Q?bTP9tUFcjYB7RDEMQ83drAkWt5Ak+A3ljE?=
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Dec 2020 10:51:21.1009
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-Network-Message-Id: f174951b-2d97-4681-342d-08d8abe7ada5
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oYElPMR4xGkaMx4l9Y+lCnd7Y8JYvGkSbsmnMusgSTsXAMb16iaeU0RVPUXhx7/GUo2Mun9ZrD+jreCMUG2SaA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR03MB5525
X-OriginatorOrg: citrix.com

On Mon, Nov 23, 2020 at 01:40:12PM +0100, Jan Beulich wrote:
> Use of __acpi_map_table() here was at least close to an abuse already
> before, but it will now consistently return NULL here. Drop the layering
> violation and use set_fixmap() directly. Re-use of the ACPI fixmap area
> is hopefully going to remain "fine" for the time being.
> 
> Add checks to acpi_enter_sleep(): The vector now needs to be contained
> within a single page, but the ACPI spec requires 64-byte alignment of
> FACS anyway. Also bail if no wakeup vector was determined in the first
> place, in part as preparation for a subsequent relaxation change.
> 
> Fixes: 1c4aa69ca1e1 ("xen/acpi: Rework acpi_os_map_memory() and acpi_os_unmap_memory()")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

See below for a comment.

> 
> --- a/xen/arch/x86/acpi/boot.c
> +++ b/xen/arch/x86/acpi/boot.c
> @@ -443,6 +443,11 @@ acpi_fadt_parse_sleep_info(struct acpi_t
>  			"FACS is shorter than ACPI spec allow: %#x",
>  			facs->length);
>  
> +	if (facs_pa % 64)
> +		printk(KERN_WARNING PREFIX
> +			"FACS is not 64-byte aligned: %#lx",
> +			facs_pa);
> +
>  	acpi_sinfo.wakeup_vector = facs_pa + 
>  		offsetof(struct acpi_table_facs, firmware_waking_vector);
>  	acpi_sinfo.vector_width = 32;
> --- a/xen/arch/x86/acpi/power.c
> +++ b/xen/arch/x86/acpi/power.c
> @@ -174,17 +174,20 @@ static void acpi_sleep_prepare(u32 state
>      if ( state != ACPI_STATE_S3 )
>          return;
>  
> -    wakeup_vector_va = __acpi_map_table(
> -        acpi_sinfo.wakeup_vector, sizeof(uint64_t));
> -
>      /* TBoot will set resume vector itself (when it is safe to do so). */
>      if ( tboot_in_measured_env() )
>          return;
>  
> +    set_fixmap(FIX_ACPI_END, acpi_sinfo.wakeup_vector);
> +    wakeup_vector_va = fix_to_virt(FIX_ACPI_END) +
> +                       PAGE_OFFSET(acpi_sinfo.wakeup_vector);
> +
>      if ( acpi_sinfo.vector_width == 32 )
>          *(uint32_t *)wakeup_vector_va = bootsym_phys(wakeup_start);
>      else
>          *(uint64_t *)wakeup_vector_va = bootsym_phys(wakeup_start);
> +
> +    clear_fixmap(FIX_ACPI_END);
>  }
>  
>  static void acpi_sleep_post(u32 state) {}
> @@ -331,6 +334,12 @@ static long enter_state_helper(void *dat
>   */
>  int acpi_enter_sleep(struct xenpf_enter_acpi_sleep *sleep)
>  {
> +    if ( sleep->sleep_state == ACPI_STATE_S3 &&
> +         (!acpi_sinfo.wakeup_vector || !acpi_sinfo.vector_width ||
> +          (PAGE_OFFSET(acpi_sinfo.wakeup_vector) >
> +           PAGE_SIZE - acpi_sinfo.vector_width / 8)) )

Shouldn't this last check better be done in acpi_fadt_parse_sleep_info
and then avoid setting wakeup_vector in the first place?

Thanks, Roger.

