Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C487321D21
	for <lists+xen-devel@lfdr.de>; Mon, 22 Feb 2021 17:37:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.88260.165816 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lEECq-0008F7-Vv; Mon, 22 Feb 2021 16:37:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 88260.165816; Mon, 22 Feb 2021 16:37:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lEECq-0008Ei-SH; Mon, 22 Feb 2021 16:37:08 +0000
Received: by outflank-mailman (input) for mailman id 88260;
 Mon, 22 Feb 2021 16:37:08 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3rhT=HY=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lEECp-0008Ed-Fi
 for xen-devel@lists.xenproject.org; Mon, 22 Feb 2021 16:37:08 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f1952d20-1d2a-4830-a891-4ae2ee793bff;
 Mon, 22 Feb 2021 16:37:06 +0000 (UTC)
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
X-Inumbo-ID: f1952d20-1d2a-4830-a891-4ae2ee793bff
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1614011826;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=Cq4RYPbzBecZqbvkdQqZfeatq2NE9ia0qzEPltOPq/A=;
  b=OsYXsPj4pWx5hakwsrC7v7+QKlIIJKUZ0Bujc3K85he92v2F4w3oQD9P
   sif5ZUXRDRXZMl46u/yf+D1ZmvXnVqn6H32NgTJRngYE+AWEX5BjwJq+o
   qjUNdAhTDipNTaXVs3KGkq+SAWLzrxSZ3tlUUNTuGYsLWe5HqmNKS5tn+
   0=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: Jggs+ESgMP3fPHTF3L32ZHyCfkkkZ6CdBchiNHwNJiy10eeFxaC4316lFVyJLBXkWLXCpKBBwM
 uT17aEQXtY5SdLuHVdv/pfEDMdtXK3MeFG85tHhfur3UbJgyprfuyAANdPzod4be0Mu5flvW6c
 Ui+TcGqriSsMfpaQL4QsOsMTHsdRFC+hkHpuoJ2YiRpN4oPk9mbbxy5lMCiqHK1KTv/h33A5Q6
 hjqK22mc1BY4vPs9Ywr6V/X0Ch7O6EEdCVmK9g4ySTSVZz73Iac+RxanOUuTVXJB4qqwJMSi1P
 ISU=
X-SBRS: 5.2
X-MesageID: 39133682
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.81,197,1610427600"; 
   d="scan'208";a="39133682"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GfxlvWRwlQHr6IgDGhGjvYlomkzFXpRrgq4ganAoN61LASLKtdU5AjdypBFRgIIYRMMV//4nyJzN9ZSuC//aXE7TdBUviSYk2hbWx533wW/JDcOCRj68wGUBcd24RJNBvL7hxs/5mQuJ7OVEsqVGMegZyRb3teig6conQMrVEXGWOOzWRuI/IAruUGZqpKyF5o6dHy0XSKDHngVHahoAo5wYnvM5bzx4Z5GJFNIOjU8vkfP4HCgfHaWyPc29irYMRHPUalEkDzLl+ZBI4CBHjwLhrEcZFzsnOd9DDx/XCPQh/g8hyg/Kq7DhGoncFkFNqjTZY5NdfjxulZRUIW5orQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=igvHt88+y0PxeuZPTsv7W3aUySGlin14FYCjRGWRSMQ=;
 b=Gcxn2hOVoFkANg5BczBtG+19OwFLfNchJzgRJ2mUjskcg+njK3Fp+MISo15vZRNzvzB0r9M7y0hljWd2F7Q3LgUcMvl/0qrIoInA7aUlTUDWJKM1s76eznUMLnuoikQkvUQj5/Pm3v1MaLiwzyOn1vRPXax1UZVo9YA6VXaBy8znNRejRxB4Qc5R6m54bz1WzIwG6TCkCN2w3JmqD4Hr12U4zCSCvyF4atBDwwtLrqDhoeAAOY9aA9sFvU8l+PXRfrlcI1t09DXWOZsilJA1ZYWYFDtpBE8MYP1eQhdF+sH9sidE39lwBPlaDA253KNuRL0yfB2sr4W4Rg1NoDvCNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=igvHt88+y0PxeuZPTsv7W3aUySGlin14FYCjRGWRSMQ=;
 b=fczfR6RpEb1xda5jQcH8eimGn7DL8g8jA7lPPdljcJ1shV1+WaStCeYNCa1F3G3EcMu9/ygQVl4o8IBq7sWWcI3zf8rqAOXUujPVnl/+xiq8tU3wAMMXoXz9x3z6u7EH30itkkzEII3hYAw5FqNuEijEhDiR8SijzfZhk4wGFDo=
Subject: Re: [PATCH] x86/EFI: suppress GNU ld 2.36'es creation of base relocs
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
	<roger.pau@citrix.com>
References: <6ce5b1a7-d7c2-c30c-ad78-233379ea130b@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <53c7a708-1664-0186-1fd6-1056f8e7839c@citrix.com>
Date: Mon, 22 Feb 2021 16:36:56 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
In-Reply-To: <6ce5b1a7-d7c2-c30c-ad78-233379ea130b@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0264.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:194::17) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: aa5cc219-7b92-433b-052a-08d8d75014d9
X-MS-TrafficTypeDiagnostic: BY5PR03MB5000:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BY5PR03MB500032B73F4464F7D6AC0275BA819@BY5PR03MB5000.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1091;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hHQSvmOZ35R13B6wWS01zR+KJVzAjsYhZQFiExin8m40uFP8j+8XwKbuaGDr1ZcftPexM7O4UZV2JpSkHFqfiHzM7sZbVjpdmSdIZwUF5a9rPZwpOVXkbA7eXPdkfVYNs1zTa7vJr2LY52sv98PF68O9BRUDB/nEb1vFDcMV0IeSHKiuGtsBnZcMwy/MRyBT4I8BZ7GiL++2AiLLMEUiLX8oP3jDsFsLMJT8jnZAZ5Vz/ItlyuxA6qaN0S+JjTiPcPaTyk7kpU89cdSeRjTUqdB7Cw9NB3Jfuchw186pp85iAILzsbkrn5PgAzR4a4HJwfdPVQhEMUKMzA39V2v9YzEVwQwWHvFPbmSaqVXbq0bEWZvKawquKg2GxyymJ+KcWudDGT2yaswCaFRr8QsWK3yfzSFxWTnIZcBb6hpMJfxPlVeMTbdrQMbq1Tspa0bVv/cLo+YDRzBmh9hqiZrAanYTYGHju3KDXsHsd8knPtPSA69LsLNjXiLwGOt4+LSgzaDcGmH1Mt7qDsqt2KsUUnMFrB0DY9KNKkyB44eDF2wVy5wB4/OcaRmZAuYrfAUjcDI5GFWzDs5zuB1LBZCI9UQLLEuAj9Wx7g/mXilLeRY=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(136003)(39860400002)(366004)(376002)(396003)(4326008)(5660300002)(83380400001)(6486002)(8936002)(186003)(8676002)(16526019)(956004)(31686004)(26005)(2616005)(86362001)(6666004)(107886003)(2906002)(54906003)(31696002)(36756003)(53546011)(66946007)(66476007)(66556008)(478600001)(16576012)(316002)(110136005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?ZVdPeWJ4am02ZHR3YU5KWi9xWm9kYy96ZXFURms4UlVpNWFDQXVtTGpJU0Ni?=
 =?utf-8?B?TlNlbjRXaUpDZFNyYmtVL1ZUWHBnaEpNUHBGTklkVFozbW53cGtWL0RidUtq?=
 =?utf-8?B?ai9EeGd5WWE4SGREdy93RUtSajBWa0ptcCt4d0FHQTkrZXY3QjNNNVBLUkRQ?=
 =?utf-8?B?eStLTDV3UlR5RUdkbEl5UlRQbTBJdVplL3NOYjNuUnU1eXU1Y0xDWnNqS2gr?=
 =?utf-8?B?dUs3ZThkTEtXNlRXbTdwcDFYSzY3VjJ4TTF5b2IvYkJ2Zlg1K0JlWUx1YVQ3?=
 =?utf-8?B?Vzh1b3djNm5yUnQwcnRtdHMyS0JZanpGN3Zjd21MQVlmNFkxZW8yRC9UaWJq?=
 =?utf-8?B?TVMyU0Fyd0xpbnBqOWJUNjVsYUdtOHkzVThpSDNxbHZ3N3Q2RDBzYWVwK3Rs?=
 =?utf-8?B?SG1jNHhadFcweXVpSWdzQ1ZlV1dmNytNQ2dqcEFBSGZTMGpaRmJjUXhXYys3?=
 =?utf-8?B?dk0vR0w3eFU0OE04VU1YYUNpc2U0dWJSSGhkbVZmd1ZkL2tMY3A3R3IvZVVJ?=
 =?utf-8?B?YWtORUg1dVYrZEZqVFFZbkM2Uzd2bi85NEVDbngrRGxLWUd0a2RUc2pnN2cx?=
 =?utf-8?B?YXFTR0dEekNJVk93ZDhXTWVlMmRHejVSL1RWcEVjeUZjUExLK2Q4aXFRM3cx?=
 =?utf-8?B?OEtNejlwS3JuaDJPMTBYMU1ndjFjQkNURi9qTkxKWG1lOFNyTzByc1Q5MTJs?=
 =?utf-8?B?elNQVDBtdkYwK1RkRzQ0bi9EYU1OeGJZQ1Z6VHJCR3FhK21EWnBNODVBRXhw?=
 =?utf-8?B?bU5HYVg3bXAvRXUzTjR2TXZRMEw4aWI1WXcwR28wcExreEpydEdFMHhXb05y?=
 =?utf-8?B?TlFjUzV3ZGRMUGZjM3c2aHlMUCt1QkVteEFXalJXMnVYRVozY0NvWmdzSVlD?=
 =?utf-8?B?Z2pQUEV6bzRYS0h4Vk5yS1BoWHFUT3l6c2RJN2ptZ2QwNWZ1aStQLzdhODRY?=
 =?utf-8?B?a3lybWJGaDJ3MDZlUFdxNEl2YlpSd1FhNmJPS1hzSm53NFhSdGdBM1JzRkEz?=
 =?utf-8?B?OGdFK0pHa0h3R2JSMktxKzNJSlJQcHJNbUMrNDJjZnpvN1E5Nmk3dDFCbXFx?=
 =?utf-8?B?alo2MDdoQjl1QXU5Z0RPeHl0VE43bWIxWlJ5eHNyR1hFWjZUQXRhNzZLSXU1?=
 =?utf-8?B?WFBBUFdIQnYwc01XYitmSDM1Nm54SC9mWXBiaC8ycGY4K05URkRYaWNoL0w1?=
 =?utf-8?B?NjZ4WGFlQ0VrOUNjU2RiQTRaa0VLZitDUURYWVM1YTg0YTdTR0JQNGg5Vm8x?=
 =?utf-8?B?bThkdDVEU2lsNHJGVTBSZnZMTUdwb1dML2NkZm5Zbm1sVHkrQjcvZXVRcG03?=
 =?utf-8?B?bEZyYjFqN0FBRDJRalh0d2dFeW4zaUhEWkU2NDcveEl3OHJzS25zV3ZiSlJq?=
 =?utf-8?B?RFBGL2xXTUlTVWlBQWFrSGZGS0hJL3dVS01kcGxhWGVic0cwTDI3MVc0NUxt?=
 =?utf-8?B?eGZMN2VOZUx4Y0ExbW9tcmVlZkRUOHNjNzBVeHJsMU1pUVFxRzJwZXBSOUdL?=
 =?utf-8?B?UDBTcThPU1dISVU3WGh5b0xDb2RHOGpRVTQ2NkswOTllY0JhWU1rcndLRE43?=
 =?utf-8?B?TjB1WnRmS0o0V2tySUNWOHhySDRyMDZFc1FsWFVIYjQ4K05RMVpQeWVRUlBD?=
 =?utf-8?B?Q3h3YnhDL05pUW0xVlBDZjJHcnNwRUpZbm4yRFF2RnFaNUFZcWlwWWcweG9o?=
 =?utf-8?B?bnc1M2dsMCtFOEZQcFA5RkJ0Um5pRmtyc1J3c290REFjNVdYY3RUbnlzT1VO?=
 =?utf-8?Q?TO746G9DpUu7fHc2IDQj/md4+16PClT43Bys7na?=
X-MS-Exchange-CrossTenant-Network-Message-Id: aa5cc219-7b92-433b-052a-08d8d75014d9
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2021 16:37:02.3235
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y59wtwKNED8HCFSw1TVxieDQPWtppGFnLPH2NUYicyA1fEIsQvijnaAAivpoTkcUuhYjrPhW4YVlF+h2QsbhanRjZpsIjJmBqPLqYuzceXg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB5000
X-OriginatorOrg: citrix.com

On 19/02/2021 08:09, Jan Beulich wrote:
> All of the sudden ld creates base relocations itself, for PE
> executables - as a result we now have two of them for every entity to
> be relocated. While we will likely want to use this down the road, it
> doesn't work quite right yet in corner cases, so rather than suppressing
> our own way of creating the relocations we need to tell ld to avoid
> doing so.
>
> Probe whether --disable-reloc-section (which was introduced by the same
> commit making relocation generation the default) is recognized by ld's PE
> emulation, and use the option if so. (To limit redundancy, move the first
> part of setting EFI_LDFLAGS earlier, and use it already while probing.)
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>
> --- a/xen/arch/x86/Makefile
> +++ b/xen/arch/x86/Makefile
> @@ -123,8 +123,13 @@ ifneq ($(efi-y),)
>  # Check if the compiler supports the MS ABI.
>  export XEN_BUILD_EFI := $(shell $(CC) $(XEN_CFLAGS) -c efi/check.c -o efi/check.o 2>/dev/null && echo y)
>  # Check if the linker supports PE.
> -XEN_BUILD_PE := $(if $(XEN_BUILD_EFI),$(shell $(LD) -mi386pep --subsystem=10 -S -o efi/check.efi efi/check.o 2>/dev/null && echo y))
> +EFI_LDFLAGS = $(patsubst -m%,-mi386pep,$(XEN_LDFLAGS)) --subsystem=10 --strip-debug
> +XEN_BUILD_PE := $(if $(XEN_BUILD_EFI),$(shell $(LD) $(EFI_LDFLAGS) -o efi/check.efi efi/check.o 2>/dev/null && echo y))
>  CFLAGS-$(XEN_BUILD_EFI) += -DXEN_BUILD_EFI
> +# Check if the linker produces fixups in PE by default (we need to disable it doing so for now).
> +XEN_NO_PE_FIXUPS := $(if $(XEN_BUILD_EFI), \
> +                         $(shell $(LD) $(EFI_LDFLAGS) --disable-reloc-section -o efi/check.efi efi/check.o 2>/dev/null && \
> +                                 echo --disable-reloc-section))

Why does --strip-debug move?

What's wrong with $(call ld-option ...) ?  Actually, lots of this block
of code looks to be opencoding of standard constructs.

~Andrew

