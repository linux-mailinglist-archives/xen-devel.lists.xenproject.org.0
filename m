Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B35AB36691D
	for <lists+xen-devel@lfdr.de>; Wed, 21 Apr 2021 12:21:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.114344.217920 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZ9zN-000072-Gq; Wed, 21 Apr 2021 10:21:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 114344.217920; Wed, 21 Apr 2021 10:21:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZ9zN-00006L-Cn; Wed, 21 Apr 2021 10:21:45 +0000
Received: by outflank-mailman (input) for mailman id 114344;
 Wed, 21 Apr 2021 10:21:44 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wOap=JS=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lZ9zM-000063-Ir
 for xen-devel@lists.xenproject.org; Wed, 21 Apr 2021 10:21:44 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7a8b6d2c-1446-4b19-b1f2-fb7686616168;
 Wed, 21 Apr 2021 10:21:43 +0000 (UTC)
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
X-Inumbo-ID: 7a8b6d2c-1446-4b19-b1f2-fb7686616168
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1619000503;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=MuoVev2JJJU4OQ4v6bd6d2fVjuhXdEQu4xIWmXrMcpI=;
  b=ZhKrk799/Nu7Ybr1qokSRh31JChcujag/IQz78IzxsskY+WuvwrZ6MyL
   bbpHj9xLmV2i+J4wAfNQVGSKBDeuNWjXtvhCHNuaNAHM6wBoq6Y3Yz+9B
   YnkzRTQ3VcJEYPFJINCyu8ODo9Nd5AsmOfqt3TKCVQLpDLSY5RIjV111F
   M=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: rw2I59pT60yxRXBam+fcp5kHSqxJ2kotdSS7BMdTG60zwlr1wjCcySw0AtsoXRfkIY1EfaDEd5
 P/SaYEHlWnHUFU0HrJG9fjSK51l8/WR76w8aekG0iuWJkF07RhXBU4hY2GVjHwKNL7lIfxFBUu
 ztTFqYtFpqLLAjlN68bEEu0s5QBshnUk/a/7v3T2gQkweXKYLXFjdIURjBALrUhvKwhfI+5SgC
 O0duz0YlA0XXbG0PMCtMMil2jy+YSOwJwMfzZorIpjJ0PWx87khsMsW0WaM0JhcTr4DPZjUwXY
 w8g=
X-SBRS: 5.2
X-MesageID: 42067297
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:M4PzDKuYl+XK4D013yRPYWU47skCrIMji2hD6mlwRA09T+Wxi9
 2ukPMH1RX9lTYWXzUalcqdPbSbKEmwybde544NMbC+GDT3oWfAFvAG0aLO4R3FXxf/+OlUyL
 t6f8FFYuHYIFBmga/BjzWQPM0nxLC8npyAocf74zNTQRpxa6dmhj0JaDqzNkFtXgFJCd4YOf
 OnhvZvnDardXQJYsnTPBBsM9TrnNHXiIngJScPGh9P0mKzpAm14733GQXw5GZ8bxpzx94ZkF
 TtokjCyYiI99q6zRLd0GG71eUtpPLRjuFtKebJpswcKjDHghulaoJ7S9S5zU0IidDq0nkGup
 3hpAohItRS5hrqDx2IiCqo4SbM+nIP7GLv0lCRi3eLm72HeBsKT/BvqKgcVzmx0TtFgPhMlJ
 hl8kjcir9sSTTHpyj578igbWATqmOE5UAMvMRWs2ZSSuIlGdhshL1axmx5OrEaEhn37Yg2ed
 Med/301bJtfVSWY2uxhBgI/PWcGnA6HhKxSkMfoMCi0z9PgHBjz0cDrfZv50s9yA==
X-IronPort-AV: E=Sophos;i="5.82,238,1613451600"; 
   d="scan'208";a="42067297"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TRVWbylQOeqngaKcN4hKm6D6nQw99MGUjlndonjBXsGJ/oX/f9K+YagvxOPZDceMsBh5iw+e98PC8xrnEK7bfTNVqgVvOc2G72qBaEPsrPXKmTZSeex5BfpSJb1Rnqv91vGchASyPVWgKu9f4ZApmfWbkXkB2eBrCBqzuVN6L2FwGRRPG5OAZ2EFGs3P8iz51PG+2uumHcJooIPYJXKN0ygpKr0hI/op53Lt3XtygVYyUi0Qj/mJibnYvTKdgawVW1Dms1UqSy3S9S4QJl24oUUiAt6vXqCnfsr0F4W2gRaHzQILq4K3iSZcKGhSAT1QYntZrGWgAIHdyN31IdqdoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MAFnNU0wOcYuQG/+1kQBqD8XXC+QttCAyTwwuwQ/lNQ=;
 b=fRAipm8a4jeisT8l6tV7dk+vi60LZ9zt4NolZd9+kTKzpl0Dzk2h2HOquKVGqYdELOwJCuNCavtU62XXOWqoFN0tcnEoyx/N7nSa/kx1rh4P1hRVFCU/w+YCLNMi+9ZpStjQXGGe2OBI7KaGWI8avggpdQcHd8sRUuvAWxgM90ItvKzZ9NtERCtSzAV4SDz/M+wx48kvnCtGHR0xbjpv3iBjPXnLRThMD0X+bN5zhJkJz33OvjhIM9W5h7fYaa5sM9om1YCue1gMpUhJSfvt1CD9ewIBYaE7FVRtONku/Xeu1oLkSMmtCaWI3HVkKGxDNI/Cz9V+t4aCceRHU+L9ZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MAFnNU0wOcYuQG/+1kQBqD8XXC+QttCAyTwwuwQ/lNQ=;
 b=mwg3efocyZdl3/6eDV40BjHP+3voqLDoX5k/Ouahal5My6pkq5KoEbd+9krbkNf4PY2FubS8l+t4iyJT2dSkSMv+X5/PQh8LNJ/C5Zdvfp4M740k+vUgeKCNq1udBEqQPW3xIQ4FlNSyfoQ64SYVnQSZRXsFyoPlGG2uctogsrI=
Date: Wed, 21 Apr 2021 12:21:33 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH 6/8] x86/EFI: avoid use of GNU ld's
 --disable-reloc-section when possible
Message-ID: <YH/8rb0aENMqOLAn@Air-de-Roger>
References: <b327185f-db31-50c8-ec76-6ef8f2fcfdfd@suse.com>
 <ff15338a-ca10-ff38-3c2a-459303ce9d68@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ff15338a-ca10-ff38-3c2a-459303ce9d68@suse.com>
X-ClientProxiedBy: MR2P264CA0143.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:30::35) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 49e6a6d7-a649-4dfa-8611-08d904af3fd8
X-MS-TrafficTypeDiagnostic: DM4PR03MB6096:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM4PR03MB609607289172949F3634ABBA8F479@DM4PR03MB6096.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6A9Lqv5ig2Fjpfin/fXJojLq2G0vSPK+agVDtEBySlLP2tQT5RY0mlma0qW90pjKhoTof0YavwkZjCrBIOPUqpH2VdNONZS4rRuZJfq1OVfeDROm6hHscBBqNfnBczNNvyBfVpjR5k7WuB2+a3FDEdBejpMt3PpfS2MKK0TkLftDQiE+sP/7hMbTgk2yot8ZWrWJhGFP3r+ml6Gp20G2a8AJGQ50axcgrcl/GXZnzbha8abeZzXjEMhjLwxpU6QkfQzA4zMRM+iIydfObQ7A431Ip2kEjmIxMUSHnzYmDyovVyW7FEvOYZ3gVoB09mcuOHGiHw4sQYSBdsrCehk5KiFU8kJhewyQRItdt9XF0efgGK54tH7FhHztGCfwyxOCt5DXU0BuIxKdBZhbLagUkWuBotYbUZEbU5ki2YxkF9cjsnrvjEPmW1VPtqERl4jt/Kv7d0cKzaoRNDcckiCT9rvkmRqFwXXTNTo9+W4R1vvTvK0C7hZc1tJEFc6or5bQC9oaF5NDlbneOZTDOA2StBLbr/J6PUzEplzVPNq4K9adTj6KAqO16yZqv/VmaVgEcL2/rfWSqdVO2QVIWA9781ucFvJv56Sw8FrXr1bNMJQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(346002)(366004)(376002)(39860400002)(396003)(136003)(54906003)(5660300002)(6666004)(316002)(6496006)(9686003)(6916009)(6486002)(478600001)(8936002)(8676002)(26005)(86362001)(16526019)(4326008)(33716001)(38100700002)(186003)(66476007)(66556008)(956004)(85182001)(66946007)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?OHViYjdKNHN0OWdoR3dDUE84N3RpRGkxaXFGRWFxaTFYMW1BMHUxWGRXNXFp?=
 =?utf-8?B?R2kzU3RpbzV5UXN6dXRzYnpsWWNHNXptNUVBVjAzZGxIMklnQXJ2N1VHTWxZ?=
 =?utf-8?B?aEFUbTUwSkFQc28zVnlqQm9KOHlwOHY0TWQzN1JtT1ZnNktEZGxlTytUNzZ1?=
 =?utf-8?B?dVlqMlhaZGNKR2ZQQzRWT3RpTGhXL0FlbUcrVTZkUldJSWwvV00yTjIySlNZ?=
 =?utf-8?B?NHQzRXlwOEZVbHd1QmtCdFc2REVUdlpkYnE0L2tzSU5yQ0tiL1MxOVVna05L?=
 =?utf-8?B?dHkzV0grdnJHWXh3dUp2Nldmd2NYNTRWM3Y1bUxmRG9USEJEWGlGOTNKZ2pl?=
 =?utf-8?B?Wlo1cHFlQ1lXWWlZb0IyV1d5M3E2b2QzaUpIY3N2UWVLb2oyZWQ4dzBaeS9C?=
 =?utf-8?B?eFU2dkFva0tmWXA5eVJxcnUvZitBRUpKYVdTc3B0WGdnQTZqN0pST2Nxanp6?=
 =?utf-8?B?WlZOZU9pUWhQcllXTWFmNHFocnQ2SkV5dlptTyt6M2tRT2xac1Zvb0tVZ2ti?=
 =?utf-8?B?NGFzeEdHMWRGamlWelhjeEg1RC80Q0g4RGZqQ2FSMUZTR09xaEpUenBFTzIx?=
 =?utf-8?B?UHpDak9tOW9pSUUxeWJGN2NzWWIzM05DOU5RSUlBeFZqT0l4ZjMzaStqT3dx?=
 =?utf-8?B?cjJWQXRRRFBCS3I5Y0c5Vm1GOTNoQk5DZkQxMnBWNjI5OUxBcVl1KzkxVnF0?=
 =?utf-8?B?dnY3UmRvNEhKZWFjRGcxV0NmWUlROW9RL0VoVHR2aHBDd1EvWW0yeUZJT3hU?=
 =?utf-8?B?MXRjZEdudGU0ME1CczNaZFRiZE5nMDlvZGs1MThFcDFUSFBacm8xaWg4bm1N?=
 =?utf-8?B?N244eGFhV1E3TmZQdFEvZUpoRUlGcnhzb2JwbERlNDN3WGhFOUtnWHJkY2lQ?=
 =?utf-8?B?VG4xb0JyUXJnRVlYeWQ0MVBaMkdNSitvbXlSbHlhVzZNQmRBczZwMnRGektF?=
 =?utf-8?B?YVpBVlNQNThjWnYxYWpvdW0rNFo3T3Y5WHhpQUVPVFZFK0h5Nzc3MEgyUlps?=
 =?utf-8?B?czU1YmhTQkpwTW9TZ3dKSUJoTjU3QmYxUzBLTVRSbVlVZ2F6MVptbk9zY0Z6?=
 =?utf-8?B?dktpbVVzaTZPUEFiNUhYbE9TVjgyOXB3QnNRQXRXOTluK3E5bGx5MGlpT3BY?=
 =?utf-8?B?dC9xQXMxRmRQSjRud0t3SWVQa084Q3V1VzRaVkNlWmlpVVZRRnJzRHlTcUZU?=
 =?utf-8?B?cVFZTDQzd2pRRG9ZQVhSWTdVaUZXbTJRbzJzN1J2Y2hlTmVxdWQ4ZHh4Wkl4?=
 =?utf-8?B?anUxTjJUYkQ5c2xJSUtLR1JnWm9OZWFWQTQ4WHlXSHJBNUNyazBMQmxHdWxu?=
 =?utf-8?B?V0F1SEhRVHBBNmhHZndpVWhJaHYvdlUxc1AxdUFGdlEwTlk4MXpoaXM0aHAx?=
 =?utf-8?B?Vmt5ditHMTZiMzh1N2l4U0dXbUZmQ1U3Y3FpM2VBbUlLWThsY29NTVJaelJD?=
 =?utf-8?B?MTQ0bzB4SzNBOU1aUTdHK0NQa1FZR0ZrQVZsSDVacWJJMHFveWVvN2d6NGxM?=
 =?utf-8?B?RWIva2VWek5OeEJnQzA0S2MzM2FpTjJhU2VtSHV3K3d6bmgvVFZyQm1yNTk0?=
 =?utf-8?B?TWZER1d0b2hmZGc5TG5zd2dZcmk5d3hiYlhKczMwL0FCbHV4MmxPL290SjlF?=
 =?utf-8?B?cURLUWdHSjF5cTZtWEhlQmhuTWJyQU5CcW16TlJsOStEOGk1a2NyUmJNMkFU?=
 =?utf-8?B?YnBSQUNMengxVi94YWRoQmVGN1lvcFNsTjNCMnZOOXhEWnA2R1VFd3BzWnlh?=
 =?utf-8?Q?Hk/IIgk+ndn07gkEfx3jijQWMEFljx5kmpRCYhZ?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 49e6a6d7-a649-4dfa-8611-08d904af3fd8
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2021 10:21:38.7613
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PnlcEW8Y+IYatcrYIeoeXlOf6Ag6FmrxfQoQ8yUIU7k7JpBPk/02CHi1XIZfP031d7mQXAonkJlyM5OJG2jTjw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR03MB6096
X-OriginatorOrg: citrix.com

On Thu, Apr 01, 2021 at 11:46:44AM +0200, Jan Beulich wrote:
> As of commit 6fa7408d72b3 ("ld: don't generate base relocations in PE
> output for absolute symbols") I'm feeling sufficiently confident in GNU
> ld to use its logic for generating base relocations, which was enabled
> for executables at some point last year (prior to that this would have
> got done only for DLLs).
> 
> GNU ld, seeing the original relocations coming from the ELF object files,
> generates different relocation types for our page tables (64-bit ones,
> while mkreloc produces 32-bit ones). This requires also permitting and
> handling that type in efi_arch_relocate_image().
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> --- a/xen/arch/x86/Makefile
> +++ b/xen/arch/x86/Makefile
> @@ -120,18 +120,37 @@ $(TARGET): $(TARGET)-syms $(efi-y) boot/
>  	mv $(TMP) $(TARGET)
>  
>  ifneq ($(efi-y),)
> +
>  # Check if the compiler supports the MS ABI.
>  export XEN_BUILD_EFI := $(shell $(CC) $(XEN_CFLAGS) -c efi/check.c -o efi/check.o 2>/dev/null && echo y)
> +CFLAGS-$(XEN_BUILD_EFI) += -DXEN_BUILD_EFI
> +
>  # Check if the linker supports PE.
>  EFI_LDFLAGS = $(patsubst -m%,-mi386pep,$(XEN_LDFLAGS)) --subsystem=10 --strip-debug
>  XEN_BUILD_PE := $(if $(XEN_BUILD_EFI),$(shell $(LD) $(EFI_LDFLAGS) -o efi/check.efi efi/check.o 2>/dev/null && echo y))
> -CFLAGS-$(XEN_BUILD_EFI) += -DXEN_BUILD_EFI
> -# Check if the linker produces fixups in PE by default (we need to disable it doing so for now).
> -XEN_NO_PE_FIXUPS := $(if $(XEN_BUILD_EFI), \
> -                         $(shell $(LD) $(EFI_LDFLAGS) --disable-reloc-section -o efi/check.efi efi/check.o 2>/dev/null && \
> -                                 echo --disable-reloc-section))
> +
> +ifeq ($(XEN_BUILD_PE),y)
> +
> +# Check if the linker produces fixups in PE by default
> +nr-fixups := $(shell $(OBJDUMP) -p efi/check.efi | grep '^[[:blank:]]*reloc[[:blank:]]*[0-9][[:blank:]].*DIR64$$' | wc -l)
> +ifeq ($(nr-fixups),2)
> +MKRELOC := :
> +relocs-dummy :=
> +else
> +MKRELOC := efi/mkreloc
> +relocs-dummy := efi/relocs-dummy.o
> +# If the linker produced fixups but not precisely two of them, we need to
> +# disable it doing so.  But if it didn't produce any fixups, it also wouldn't
> +# recognize the option.
> +ifneq ($(nr-fixups),0)
> +EFI_LDFLAGS += --disable-reloc-section
> +endif
>  endif
>  
> +endif # $(XEN_BUILD_PE)
> +
> +endif # $(efi-y)
> +
>  ALL_OBJS := $(BASEDIR)/arch/x86/boot/built_in.o $(BASEDIR)/arch/x86/efi/built_in.o $(ALL_OBJS)
>  
>  ifeq ($(CONFIG_LTO),y)
> @@ -175,7 +194,7 @@ note.o: $(TARGET)-syms
>  		--rename-section=.data=.note.gnu.build-id -S $@.bin $@
>  	rm -f $@.bin
>  
> -EFI_LDFLAGS += --image-base=$(1) --stack=0,0 --heap=0,0 $(XEN_NO_PE_FIXUPS)
> +EFI_LDFLAGS += --image-base=$(1) --stack=0,0 --heap=0,0
>  EFI_LDFLAGS += --section-alignment=0x200000 --file-alignment=0x20
>  EFI_LDFLAGS += --major-image-version=$(XEN_VERSION)
>  EFI_LDFLAGS += --minor-image-version=$(XEN_SUBVERSION)
> @@ -189,7 +208,11 @@ EFI_LDFLAGS += --no-insert-timestamp
>  endif
>  
>  $(TARGET).efi: VIRT_BASE = 0x$(shell $(NM) efi/relocs-dummy.o | sed -n 's, A VIRT_START$$,,p')
> +ifeq ($(MKRELOC),:)
> +$(TARGET).efi: ALT_BASE :=
> +else
>  $(TARGET).efi: ALT_BASE = 0x$(shell $(NM) efi/relocs-dummy.o | sed -n 's, A ALT_START$$,,p')

Could you maybe check whether $(relocs-dummy) is set as the condition
here and use it here instead of efi/relocs-dummy.o?

> +endif
>  
>  ifneq ($(build_id_linker),)
>  ifeq ($(call ld-ver-build-id,$(LD) $(filter -m%,$(EFI_LDFLAGS))),y)
> @@ -210,16 +233,16 @@ note_file_option ?= $(note_file)
>  ifeq ($(XEN_BUILD_PE),y)
>  $(TARGET).efi: prelink.o $(note_file) efi.lds efi/relocs-dummy.o efi/mkreloc

Do you need to also replace the target prerequisite to use $(relocs-dummy)?

>  	$(foreach base, $(VIRT_BASE) $(ALT_BASE), \
> -	          $(LD) $(call EFI_LDFLAGS,$(base)) -T efi.lds -N $< efi/relocs-dummy.o \
> +	          $(LD) $(call EFI_LDFLAGS,$(base)) -T efi.lds -N $< $(relocs-dummy) \
>  	                $(BASEDIR)/common/symbols-dummy.o $(note_file_option) -o $(@D)/.$(@F).$(base).0 &&) :
> -	efi/mkreloc $(foreach base,$(VIRT_BASE) $(ALT_BASE),$(@D)/.$(@F).$(base).0) >$(@D)/.$(@F).0r.S
> +	$(MKRELOC) $(foreach base,$(VIRT_BASE) $(ALT_BASE),$(@D)/.$(@F).$(base).0) >$(@D)/.$(@F).0r.S
>  	$(NM) -pa --format=sysv $(@D)/.$(@F).$(VIRT_BASE).0 \
>  		| $(BASEDIR)/tools/symbols $(all_symbols) --sysv --sort >$(@D)/.$(@F).0s.S
>  	$(MAKE) -f $(BASEDIR)/Rules.mk $(@D)/.$(@F).0r.o $(@D)/.$(@F).0s.o
>  	$(foreach base, $(VIRT_BASE) $(ALT_BASE), \
>  	          $(LD) $(call EFI_LDFLAGS,$(base)) -T efi.lds -N $< \
>  	                $(@D)/.$(@F).0r.o $(@D)/.$(@F).0s.o $(note_file_option) -o $(@D)/.$(@F).$(base).1 &&) :
> -	efi/mkreloc $(foreach base,$(VIRT_BASE) $(ALT_BASE),$(@D)/.$(@F).$(base).1) >$(@D)/.$(@F).1r.S
> +	$(MKRELOC) $(foreach base,$(VIRT_BASE) $(ALT_BASE),$(@D)/.$(@F).$(base).1) >$(@D)/.$(@F).1r.S
>  	$(NM) -pa --format=sysv $(@D)/.$(@F).$(VIRT_BASE).1 \
>  		| $(BASEDIR)/tools/symbols $(all_symbols) --sysv --sort >$(@D)/.$(@F).1s.S
>  	$(MAKE) -f $(BASEDIR)/Rules.mk $(@D)/.$(@F).1r.o $(@D)/.$(@F).1s.o
> --- a/xen/arch/x86/efi/check.c
> +++ b/xen/arch/x86/efi/check.c
> @@ -2,3 +2,17 @@ int __attribute__((__ms_abi__)) test(int
>  {
>      return i;
>  }
> +
> +/*
> + * Populate an array with "addresses" of relocatable and absolute values.
> + * This is to probe ld for (a) emitting base relocations at all and (b) not
> + * emitting base relocations for absolute symbols.
> + */
> +extern const unsigned char __image_base__[], __file_alignment__[],
> +                           __section_alignment__[];
> +const void *const data[] = {
> +    __image_base__,
> +    __file_alignment__,
> +    __section_alignment__,
> +    data,
> +};
> --- a/xen/arch/x86/efi/efi-boot.h
> +++ b/xen/arch/x86/efi/efi-boot.h
> @@ -86,10 +86,12 @@ static void __init efi_arch_relocate_ima
>                  }
>                  break;
>              case PE_BASE_RELOC_DIR64:
> -                if ( in_page_tables(addr) )
> -                    blexit(L"Unexpected relocation type");
>                  if ( delta )
> +                {
>                      *(u64 *)addr += delta;
> +                    if ( in_page_tables(addr) )
> +                        *(u64 *)addr += xen_phys_start;

Doesn't the in_page_tables check and modification also apply when
delta == 0?

Maybe you could just break on !delta to reduce indentation if none of
this applies then?

Thanks, Roger.

