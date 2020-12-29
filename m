Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 56A9E2E6FC7
	for <lists+xen-devel@lfdr.de>; Tue, 29 Dec 2020 11:57:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.59805.104857 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kuCgV-00081W-M1; Tue, 29 Dec 2020 10:56:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 59805.104857; Tue, 29 Dec 2020 10:56:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kuCgV-000817-Ic; Tue, 29 Dec 2020 10:56:59 +0000
Received: by outflank-mailman (input) for mailman id 59805;
 Tue, 29 Dec 2020 10:56:58 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+dLv=GB=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1kuCgU-000811-Mv
 for xen-devel@lists.xenproject.org; Tue, 29 Dec 2020 10:56:58 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f382c377-67d3-4f0f-97d8-f4e38c7a9a41;
 Tue, 29 Dec 2020 10:56:56 +0000 (UTC)
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
X-Inumbo-ID: f382c377-67d3-4f0f-97d8-f4e38c7a9a41
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1609239416;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=TPZkfNkoKtl1hMMhcQYpSXtRVwcoyalmwRqdLVUwCZk=;
  b=XtLfQzOxAmk9BRTOeeYhvl5bZTBSEQUOPS5lBAojjJHxxs1ZUAVk8YPd
   ao2FpE0yAsy8xZSNtl2+kR2otsemfEML1xycxohOKkxhvGZXql5Ap0l+k
   Q9aOIYnFYsoacE7O9n/AFqXgE0vuNJV2HAaHRwLBrxluuQOI4c/NILKA3
   k=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: ZazKAYaVKAmYgmAF8kin7F/SJn/O3ZCInguW0qxZUIgde+6/GiKTwXXJ+xbmMgpWFSkbVxzx3x
 NnQ7nKpBkYsV3cmfJ0umwz/U2aShsFEuEonpzqgXiK1B7qMJstKUH+ob3b0R7L4s6iJtlqZbur
 zHqgrYnJxLPGQchU26AT0siinoOmCLKTkWS0Mqdg+7qIZshLaAMkIRyqmp1vl6eQ4scGVteYPW
 tqewdFl9zim5mGCwh+EvR4sX5TG5xu9dMUWPYeLZflfi3zNYJawP1gnhJo6yHd4VY8MladELzM
 jFs=
X-SBRS: 5.2
X-MesageID: 34315853
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.78,457,1599537600"; 
   d="scan'208";a="34315853"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RcmJM0t+CIL40bGA4UgxDtrbKxT56FeBHebqjCF5e4YhZtxG/5+Ce4Q27MkMEjNiNUUHU59hIiV+9qYccV/HLZfEAxFhhZMvMklV+/aypXw6HSYmrj6NGQuWIu7YA3HiGLqP3Rwe8lsc9rANjfX5WxbCIp30ggTEkGG+eZu2brf6l4Vtq+jqAxKVR+X8IIGEplZOgJo77z6zWpg0N2Z4UeMo9FPDUiP98oK7lrH0uUtgDzHWNbft+B1vvvC4yV7x38AGGSwBUkITNQrfcj/YM1vsG/k1CsuHgpMMDa7qBxI+vNQJwXcgLjfqxvoLb00478XTKAoPmRjlT05p1dOcuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yrmUNnfftmS9BgOhBfrMF5Enj/eNbFxeMNg97tCnSA8=;
 b=l0xVP73RkRwmyV5nKVCZgbfdxlai6clHEjtx73CZpUjoF/b+m4ZtR57MRHqNdaG6/dxSOodvbkJvvBJxkQKlMsjZTG+Pr+LG9MA9N+63tzUgk4P67iiyQ4rGYid25GS/FCD8SB12eqfdBUHR1bEIcit7XAyZQVVQPFnO6MEiSN3vjCUOQ9mNuKz01A0tagzfSAj8hGT5FGLMddqdKbQ136OLMDY3512Fc4YdVa0B3Uu1uP9yor1wQzJHWjX/iZYR+0pzEOQOjGpPwxq3fbaWO7pA+OeqYSByR02BzeSrbubIAXqfRGP2VE8HWLTr4SqeXrgWPaRTrwrbIa+7Db0wtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yrmUNnfftmS9BgOhBfrMF5Enj/eNbFxeMNg97tCnSA8=;
 b=YwaRjLkOkfzGQ/V/FsJ4G4dPqh+wwQ8ScrzaWB1ccH+giuJ8rtZW/mJMMbQMVvDSknLZ1wfyYkLQGkVhXfiHxH237ybohexrHTVrk2+XL+p4Z+W0Thb+bCKU0oANhwfX6fzg0MTAeFmwCq98/tQJWAXBjjZBPMKfukXaIAGZBKM=
Date: Tue, 29 Dec 2020 11:56:46 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, Julien Grall
	<julien@xen.org>
Subject: Re: [PATCH 1/4] x86/ACPI: fix mapping of FACS
Message-ID: <20201229105646.fjeq364wcfstff4a@Air-de-Roger>
References: <7f895b0e-f46f-8fe2-b0ac-e0503ef06a1f@suse.com>
 <81a8c2f0-ae9b-98e0-f5c5-d32b423db491@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <81a8c2f0-ae9b-98e0-f5c5-d32b423db491@suse.com>
X-ClientProxiedBy: LO3P123CA0002.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:ba::7) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ea9ecdb5-96c1-42fc-023f-08d8abe87302
X-MS-TrafficTypeDiagnostic: DM6PR03MB5289:
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB5289DAC2B4B38A31B3D49BE38FD80@DM6PR03MB5289.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RVgtDKKJOQRVYbD/xUjX252rfQrn6+2bl0qvbEsT0bz/6F7MnZFchTVRo1UfkUROm2bCveyJsbf27uIiynPrPzbvCcKWLim7ZTzbLBY6rwBzcFpuQaajI2kQspyVB3YtIHBFHNc4uwMdLd0HlQ40v/o06gsNbuzRJ/5o8Ema/NqFzlx53yn3CVH/GlA3/Jbd8tKUx1lfgy8anrIFntrPUNWUcyIC67Abpvo/ndGNo/RSiPBM88TETp6ghtb+31VaJ8w0/4ewnnBPlMHTELZ3OhLcBq612LBJTO3sCFVSTJkxlhjP7f8TY75KYn1KnY6cUztt8yuSCslEIM00hy4L+DL4BAAFSBjaFzMg2fQIXX3fAG2Sn1iN4dxHW6bMb16gpNmm2fRdiklXvqGjHnpnUw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(396003)(346002)(376002)(39860400002)(366004)(136003)(54906003)(6486002)(66476007)(5660300002)(316002)(6916009)(66556008)(16526019)(86362001)(8676002)(4326008)(66946007)(6496006)(6666004)(8936002)(33716001)(26005)(85182001)(478600001)(186003)(1076003)(956004)(9686003)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?THpvazZoT2RqM1VzRUNTSTRZSFAySzUvS2xCRkg1M3NXSk9PdGhQSi8yZlZ3?=
 =?utf-8?B?NFFHY3Aybkg5dk9hR0VVWDVVNjNWWVp5ME1zNHhYMCthUTFUaDhvTW4yVUQ2?=
 =?utf-8?B?MHJkSEJkTlluUWNMb1lUenlwRXl2Y2tMeHU4L2xnYnd3SjJMU0F5YUlON1Vj?=
 =?utf-8?B?Yi9tb3hvRFlUYmV3aDJUYzdTZDU4cjc4UVFuckhrWERzeldRWE1UTHpGVFNO?=
 =?utf-8?B?VTExQ0JWVmU2UFdXb2c2Rjh1QmVYZE8rQUVPb3o4aHY4MFd5L0tpa0xUUVcx?=
 =?utf-8?B?bEloNzRLRHN2WGxRZ1FKVkRkOWZkaDdRdlhFM1RMTTl5YjBYYk1WeG1VWk9R?=
 =?utf-8?B?Q0hiRDhvQ3dyaUF0S2tQbzNvTHNCNE04TldhOG1YOUIyNmdiS3ZZSGIyV0xO?=
 =?utf-8?B?Tk91K3p6Z0JBbWxXZ3ZOdFFRWkRxejJGYjd4dWZSRHBaYlJhdlk5TkhkWGtV?=
 =?utf-8?B?L3BGQm10Qmw1Vzd6bWhSajdpaTVZdG5sS1YrRUEvVzd0SWt2UmZ0OWp0WFlt?=
 =?utf-8?B?YnpRL3ZNTDQ1N3I5cDNienVQZGdDZ25SMEhjMnZML2JCRTZyZFhnSkphc1hL?=
 =?utf-8?B?L3o0MXpOSlpRRmZvKzhvR1Q5MmlyQkh2d0h4R3lZOVZaZXlUWFQ5RkxwMWlH?=
 =?utf-8?B?N01QWmFaZzBXb2g2Tlg4T0UyOURqbkJMa1VXWHFxaEF5V3ozK0p4UjgrdDI1?=
 =?utf-8?B?MEJibitRRXFaa2EwRXFnblN1Zjd3QjgrL2VTcUtxVWxPZStDVjNTdzZKOUFK?=
 =?utf-8?B?T3VIemdpa1VwRUtlT21GbVJTckFRck1CUnhMZS9LTyt3TFlqdWZZZlhGcGMy?=
 =?utf-8?B?SEgvQkhmenRFVGpCMmgzMUpCS0srQmZ5bzZvVHIzTTRJZ0Z1T1pabjZCSG1U?=
 =?utf-8?B?RnNSdDFrbjNmQzRVc2FETUV3V1lyUC9pRVRPYTg4anF6Zkh0cElJUW9ybnVR?=
 =?utf-8?B?Z0Y4Y2pnVlRWUHZvRWd6YUxxNXZrQ3BwbEZvZjFIL2d1UmVzeFJDYVlTdExE?=
 =?utf-8?B?bDJSaEVlcUlzbWpwcE5NT1FJVUxEUUd3SWR3ZE1HcXN5b3lFSXFybWZkUzhE?=
 =?utf-8?B?ZHZTaHcvSmh4ZlBqbXJhN2tHMllBK2FkMUUvY2pPbUVpOTBYWTQ5RVR0YVFZ?=
 =?utf-8?B?RWgvNURhVVkwQWtuWnBHOFJqZmdOVzdBa3l5VlcydHVQOFdqSkZoeDVIbzFw?=
 =?utf-8?B?K1pNK2pXRDZLQ3U1RGtkcjY3NkhLdlBhenY1NlJvWUZnNmp1cmdObzdhZmVQ?=
 =?utf-8?B?L0lsc0lCRzlrVS9QejlkL1l0R3huYUZVNjJTQXJMWUtuNVFGdlBxMDVuanFB?=
 =?utf-8?Q?RurqZZ+HSCoRUM6+LvsxDfWClq2n+DdMXS?=
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Dec 2020 10:56:52.1695
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-Network-Message-Id: ea9ecdb5-96c1-42fc-023f-08d8abe87302
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jDW+3bdl63k4Eeei5KeWj0J9RCynuHB9XqpDN7zPo9fmsEJsv/NR6EuPvBKsfb1BpEgfBO92fbiJpBF3V4YjmQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5289
X-OriginatorOrg: citrix.com

On Mon, Nov 23, 2020 at 01:39:55PM +0100, Jan Beulich wrote:
> acpi_fadt_parse_sleep_info() runs when the system is already in
> SYS_STATE_boot. Hence its direct call to __acpi_map_table() won't work
> anymore. This call should probably have been replaced long ago already,
> as the layering violation hasn't been necessary for quite some time.
> 
> Fixes: 1c4aa69ca1e1 ("xen/acpi: Rework acpi_os_map_memory() and acpi_os_unmap_memory()")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> --- a/xen/arch/x86/acpi/boot.c
> +++ b/xen/arch/x86/acpi/boot.c
> @@ -422,8 +422,7 @@ acpi_fadt_parse_sleep_info(struct acpi_t
>  	if (!facs_pa)
>  		goto bad;
>  
> -	facs = (struct acpi_table_facs *)
> -		__acpi_map_table(facs_pa, sizeof(struct acpi_table_facs));
> +	facs = acpi_os_map_memory(facs_pa, sizeof(*facs));
>  	if (!facs)
>  		goto bad;
>  
> @@ -448,11 +447,16 @@ acpi_fadt_parse_sleep_info(struct acpi_t
>  		offsetof(struct acpi_table_facs, firmware_waking_vector);
>  	acpi_sinfo.vector_width = 32;
>  
> +	acpi_os_unmap_memory(facs, sizeof(*facs));

Nit: looking at this again, I think you could move the
acpi_os_unmap_memory further up, just after the last usage of facs
(ie: before setting the wakeup_vector field).

Roger.

