Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5827142D6D7
	for <lists+xen-devel@lfdr.de>; Thu, 14 Oct 2021 12:15:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.209226.365612 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1maxl1-0001UG-Tl; Thu, 14 Oct 2021 10:14:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 209226.365612; Thu, 14 Oct 2021 10:14:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1maxl1-0001RU-PR; Thu, 14 Oct 2021 10:14:39 +0000
Received: by outflank-mailman (input) for mailman id 209226;
 Thu, 14 Oct 2021 10:14:38 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Xl23=PC=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1maxkz-0001RO-Ut
 for xen-devel@lists.xenproject.org; Thu, 14 Oct 2021 10:14:37 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0647970b-16b9-4bc1-8370-c650caf72088;
 Thu, 14 Oct 2021 10:14:36 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2111.outbound.protection.outlook.com [104.47.17.111])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-40-3KhCfHXoNjacIPxfU8VPKw-1; Thu, 14 Oct 2021 12:14:34 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VE1PR04MB7375.eurprd04.prod.outlook.com (2603:10a6:800:1a8::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.18; Thu, 14 Oct
 2021 10:14:32 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4608.016; Thu, 14 Oct 2021
 10:14:32 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AS8PR04CA0043.eurprd04.prod.outlook.com (2603:10a6:20b:312::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.15 via Frontend
 Transport; Thu, 14 Oct 2021 10:14:31 +0000
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
X-Inumbo-ID: 0647970b-16b9-4bc1-8370-c650caf72088
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1634206475;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=F1w/wcdwqVVfnml3Ug9BPNlOAB72tYYCv1Qc0qqfq1Y=;
	b=MZF9jglv0CDWSI+ihrB9ld8w5qpqN8nIww3nccIYFG5/P/a8GHVU1MYn+aVwmeoTw8xJhS
	a3G4+ZdX8jI1xcFCszJpH2WcNOLr8Hy+DzP36uvVCWCqwFmq8wJVblBP5QyqKD5fNKTg5P
	6oGpchelMpYLY7WisnfNy3sAL7Z2spE=
X-MC-Unique: 3KhCfHXoNjacIPxfU8VPKw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XY6O6dFHVHIJ5ABhphh1AH69515SRNBWgyUSmoA1Cfhq9/JZ9LAzdNN+OMqrgddnHDtpBrSAjQoJIOI+UMGqB97rTIyvA68KvaODuLUUAlTU3LTrfxFQct+NZPChHsRdZ52IZnnCaQW3JF3QTkJPM2U1x286S2uA3HCKJJpP24QlJwbkAmM7ImiD/3edPHW5fVr7uvAf2n+ydzIygIzeljCF5x98hNbbqYqqR35FIpQ1Qx8UYQ6ZejX8reUiEVKs2ug4tNBnwtrgxgfeVBtqxqWOuCfnSXEg+rZ0cjsCK1cKXEL6ZC9Uf/itS1mOwmeeqqq16AhxOgbSt4vaBQQTbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F1w/wcdwqVVfnml3Ug9BPNlOAB72tYYCv1Qc0qqfq1Y=;
 b=dyVavzGSohGVSBVGSYSQravthB1eVSAp/3m9Lw/StiFOs95BcLYY5Go7K0F5QonZmSoOKpzhtDpIHWT7zbwJtwVA+asR/UyOw9feZmknI7b6PMoqlsLIWOIgVrzl1hmAerk1ClpCh+2n+TaE249i9iHiqNx96VoPmUyJ5lnKYlfjdQARSxAQgKWhUVbcuHKX0e9S5bHKdpraW1WVFKqv1HB0NumVJresw1tu7VoJ1ien91lt7xpHJluvcSiO3mEOfPkiWjqR9ELZNpGuFpgW6+utjNvud5W+h+snzC0M0CQaKIcIFlm1tudJ1ro5rUzRSuEC/pR4TkwUSvLhpi9T8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [XEN PATCH v7 49/51] build: adding out-of-tree support to the xen
 build
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 xen-devel@lists.xenproject.org
References: <20210824105038.1257926-1-anthony.perard@citrix.com>
 <20210824105038.1257926-50-anthony.perard@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <2aaf0858-1602-be5c-77e4-2daa7fddc534@suse.com>
Date: Thu, 14 Oct 2021 12:14:29 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <20210824105038.1257926-50-anthony.perard@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8PR04CA0043.eurprd04.prod.outlook.com
 (2603:10a6:20b:312::18) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 293a0898-028f-4c46-21d7-08d98efb6a77
X-MS-TrafficTypeDiagnostic: VE1PR04MB7375:
X-Microsoft-Antispam-PRVS:
	<VE1PR04MB73751D7C38D6DC23E8BFF9E3B3B89@VE1PR04MB7375.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	8tPU3tZ+iJSjdkOh55cfHXp2InUwHVsqlbTogdnsDOprUN/ra08DJHeDv0gnm9kGTl/Tm1zJ5/VuLUg2nXP/Lv5bBhkFqa8m+FD02ksOfGAY59h6/2qEpPccyAi0TCI0TLI00VjHbcNXrFwLm3iGOK1oOeFlirrzO4/o9NUbwYh5pUR6nA9/Sq13LS+PTmppovAdaVRNy0oRKR37p/ha1lg5M1NOQAKdH8RvgQO+Epeh/uJWlJKhFW4BRd56qhjL8/GyBAEpBBlqOmkhdJkscwXbYkfiAao4JhssKWFvZMBTjryrIjjdgju7shI6ZyPwPFBQk/KrddJckN7/9yjXV89DYjw3RLel1REMab40dD7kLid1CeDhk9jxY4ztr/ivXAhrfGi4pii4t6EJZhxwq8rvdw6uMHOndgblox2x+Uu1G/hWy9QdRQxCCenILNGyGzYUkgrdCZZGykThEiQHNcKVYj1nwgzfy31Kf08pihUTbwuHoc5U2OkuPVFeVpfqczT51w+aoYP+bXlDrEQ0OCj0//dVoFvCFoVaXunt3rA4ijDdrqlP+sCDt49BTkXYeCs90ZWyxbFwOKAZNlIzvYoCoJ5XiJHj0Ae1WJHBYbcBvRyP1vORTOCuDnFQPg2FDEKNq4UL8Mhg4BVIiUvEgcgMnrJwrNXI+txeVd6XlrdCTMB3jGXHAJZMce+iyYQfNkbdVTcuh9U7zbeTrETNOYASRTFuiWGD7wN2BlWtF20=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(66556008)(66476007)(86362001)(31686004)(53546011)(26005)(2906002)(36756003)(5660300002)(8676002)(7416002)(38100700002)(508600001)(186003)(8936002)(2616005)(6916009)(66946007)(83380400001)(956004)(6486002)(4326008)(31696002)(16576012)(316002)(54906003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Tk1nRms0emJ2VFdmb3k3RHpjV1BuRVhTelVUVm1jd1BpMW9ZekdRTDNBWTZp?=
 =?utf-8?B?OGlKTU1xQWpjdERJTGM0d3M1OW03WWxsOHVUcGtFOEk3QU9OcmV3N250NjBX?=
 =?utf-8?B?Mm9ZeDJmbm0weGtjNHRwbUFyMUpwS0J0N3Q0MjNxK3pWRGtuSC8va3JRaEZC?=
 =?utf-8?B?dlc5R1Njck4yajZhUVFZU29OS0Q0N1I0NWdGb0VlYVZTdnZERUVZUFNvYmJK?=
 =?utf-8?B?UzVyZU1ZcXpxUWRmcHRhZlRFZlM1UlBnR0tYMjRMSEpKQ2J3OE9Vc1dtT2x4?=
 =?utf-8?B?d3ZOdHBoQVVQSjZZQlFUcWMyVW1iLzNVUzhGdXBPT0s3RmNuU1JobkpwSkd2?=
 =?utf-8?B?NzBldEQ5R01ZRjEraDMyelpXazNOMkJYS0orOEtESFdZcDFWVEZUTG1QSG92?=
 =?utf-8?B?Wk04NUoreWtPYWFMZFkwV1ZjaktiK0Z0U0JsMVlRcEl6WGtWZUtMREFHU0Nm?=
 =?utf-8?B?bnIzTk5JSzlvWUJVRi9kajFYbEFxbjU5NUdQeDBJN0pTN1VYakFSWmhpZWpt?=
 =?utf-8?B?cUVjY0JYaEgxUjdEdFZndUdOUDVibmVrR3lNQW5mOXZBR3pmWU9WclpENmNF?=
 =?utf-8?B?WHlUMHBxR1hvbmtqR20ycXc2bmhqOGFtREFPTTFhalIwM0pFOG9yZmk5QmVG?=
 =?utf-8?B?dnZLTVRvc1Z1WW8veDJPeDFHLzRrOHloaDJmd1UzU1pSNnpLUUJObGtVYmxt?=
 =?utf-8?B?ZmVaaWxQS3puQ3d6Sy9BU2pMd0MzVFV0YnloZW1meTZ0anYzT2l5ZnpmK3ZN?=
 =?utf-8?B?Z2REOGVYNVpxWUFOOUQzWEh3bW1KMUhiek93N0JVTkNhZlMzcy9DNTBEUkkx?=
 =?utf-8?B?Tng4d0wxdnBNL0c0UFR2dmJSdmJNNDQ0Z3pnVzZpMVlJOGMyQnpSNFBkSksy?=
 =?utf-8?B?YlJrd3dVWXVuM08vSitURkNaN1JuR285U2VndWd1UFJMU0dTMk5RMm5QMGNn?=
 =?utf-8?B?d3NZczMzWVN0VTc4ZlhueDJSOHBtbGFySVlsMFZvZ1VvSEhEWTdhQTYxdDRm?=
 =?utf-8?B?QUNmU1g2WThxYXVTSUg3SHVIdDZBQVV4eFZ6YTJsUVdOOXk2dllRY1M0dGhO?=
 =?utf-8?B?NUJKT0RuVVE4Y3FWNWJKZXNXWHdyUkhDWmp2aDRJZVNNTnRhYzQyeXE4dzQ4?=
 =?utf-8?B?UXErcUJJNG1PR0hyUUlnNFYyWWczZmQrUTRaOTZYSGdtSkFtNksrdi9MNDVs?=
 =?utf-8?B?WThSelZaWlpPci85SGZhZjlNZ0xRQzlDRi8zdEJyc3FLdjV2YWlRWGhNSkU4?=
 =?utf-8?B?ZE5kRC8zVG5YOGQ5WjRTREFDb0s0YkVMb0dXUWJURnBDVkZJb053bEoxcUZp?=
 =?utf-8?B?Z1NkOGY1ZCtHeUxLZ0tzSGlOeWlML0ZMSnozVWdwNzZuMndWdm8xUUlid3B0?=
 =?utf-8?B?bDhVYTMvYmRPMWJnM1Bpclo2cmk3cTNQSDEzMTloZ0JpVzQ0TlZqd084MnZ3?=
 =?utf-8?B?WGtpY2kzdy9WR05QUGkvTjhacVZjb2ROaVN2S1JXb0cxemI4ci92L2E3cXJu?=
 =?utf-8?B?TlRISldCNFVHcWdFa0djYmpVSSthZnNhZm1jUTVHRzhEL1Z5cUZmRlVPNEc3?=
 =?utf-8?B?cDdHNDBzdk4rMEpTS2N1Y3I0c2pEcG0rQkJaT2F3MHJDNXpEMVhBOUVrTXVU?=
 =?utf-8?B?YTdScUFvMmFuT09mKytEYjBHeEkvUnZLUUREQkJ4NHIrc0oxbklubWdmUGMy?=
 =?utf-8?B?YWRRYmlzTXlFemhIbFAzdWk5V1pqeG05WXg0N2dIdEhJbXkrOWd4U0hBQTll?=
 =?utf-8?Q?r+MtLCfgiNJoDJhBnVG5qauwtk3z48pBwEkj0jb?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 293a0898-028f-4c46-21d7-08d98efb6a77
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2021 10:14:32.4992
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eCzUBnwwHRBLau/syfUMUHP7AReENwUB/wzjqWseSpuMReaJRn1K7O17iRgRCCQzrpm7leS8JDAggz3tXDa13A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7375

On 24.08.2021 12:50, Anthony PERARD wrote:
> This implement out-of-tree support, there's two ways to create an
> out-of-tree build tree (after that, `make` in that new directory
> works):
>     make O=build
>     mkdir build; cd build; make -f ../Makefile
> also works with an absolute path for both.
> 
> This implementation only works if the source tree is clean, as we use
> VPATH.
> 
> This patch copies most new code with handling out-of-tree build from
> Linux v5.12.
> 
> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
> ---
>  xen/Makefile                | 173 +++++++++++++++++++++++++++++-------
>  xen/Rules.mk                |  11 ++-
>  xen/arch/arm/efi/Makefile   |   3 +
>  xen/arch/x86/arch.mk        |   3 +
>  xen/arch/x86/boot/Makefile  |   5 +-
>  xen/arch/x86/efi/Makefile   |   3 +
>  xen/include/Makefile        |   9 +-
>  xen/scripts/mkmakefile      |  17 ++++
>  xen/test/livepatch/Makefile |   2 +
>  xen/xsm/flask/Makefile      |   3 +
>  xen/xsm/flask/ss/Makefile   |   3 +
>  11 files changed, 194 insertions(+), 38 deletions(-)
>  create mode 100755 xen/scripts/mkmakefile

Linux have done away with this script just recently; I don't think we
should introduce it.

> --- a/xen/Makefile
> +++ b/xen/Makefile
> @@ -1,3 +1,7 @@
> +# $(lastword,) for GNU Make older than 0.81

DYM 3.81?

> +lastword = $(word $(words $(1)),$(1))
> +this-makefile := $(call lastword,$(MAKEFILE_LIST))

Oh - is it documented somewhere that this would always be last?

> @@ -17,33 +21,18 @@ export XEN_BUILD_HOST	?= $(shell hostname)
>  PYTHON_INTERPRETER	:= $(word 1,$(shell which python3 python python2 2>/dev/null) python)
>  export PYTHON		?= $(PYTHON_INTERPRETER)
>  
> -export XEN_ROOT := $(CURDIR)/..
> +$(if $(filter __%, $(MAKECMDGOALS)), \
> +	$(error targets prefixed with '__' are only for internal use))
>  
> -srctree := .
> -objtree := .
> -export srctree objtree
> +# That's our default target when none is given on the command line
> +PHONY := __all
> +__all:
>  
>  # Do not use make's built-in rules and variables
>  MAKEFLAGS += -rR
>  
>  EFI_MOUNTPOINT ?= $(BOOT_DIR)/efi
>  
> -ARCH=$(XEN_TARGET_ARCH)
> -SRCARCH=$(shell echo $(ARCH) | \
> -          sed -e 's/x86.*/x86/' -e s'/arm\(32\|64\)/arm/g' \
> -              -e s'/riscv.*/riscv/g')
> -export ARCH SRCARCH
> -
> -# Don't break if the build process wasn't called from the top level
> -# we need XEN_TARGET_ARCH to generate the proper config
> -include $(XEN_ROOT)/Config.mk
> -
> -# Set ARCH/SUBARCH appropriately.
> -export TARGET_SUBARCH  := $(XEN_TARGET_ARCH)
> -export TARGET_ARCH     := $(shell echo $(XEN_TARGET_ARCH) | \
> -                            sed -e 's/x86.*/x86/' -e s'/arm\(32\|64\)/arm/g' \
> -                                -e s'/riscv.*/riscv/g')
> -
>  # Allow someone to change their config file
>  export KCONFIG_CONFIG ?= .config

Would it be possible to split off some of the pure movement of pieces,
to make it easier to see what (if anything) is actually changed at the
same time as getting moved?

> @@ -51,14 +40,9 @@ export CC CXX LD
>  
>  export TARGET := xen
>  
> -.PHONY: default
> -default: build
> -
>  .PHONY: dist
>  dist: install
>  
> -include scripts/Kbuild.include
> -
>  ifneq ($(root-make-done),y)
>  # section to run before calling Rules.mk, but only once.
>  
> @@ -130,14 +114,93 @@ endif
>  
>  ifneq ($(findstring s,$(filter-out --%,$(MAKEFLAGS))),)
>      quiet := silent_
> +    KBUILD_VERBOSE = 0
>  endif

In how far is this related here? Doesn't this belong in an earlier patch?

>  export quiet Q KBUILD_VERBOSE
>  
> +# $(realpath,) for GNU Make older than 0.81

Again - 3.81?

> +ifeq ($(abs_srctree),$(abs_objtree))
> +        # building in the source tree
> +        srctree := .
> +	building_out_of_srctree :=
> +else
> +        ifeq ($(abs_srctree)/,$(dir $(abs_objtree)))
> +                # building in a subdirectory of the source tree
> +                srctree := ..
> +        else
> +                srctree := $(abs_srctree)
> +        endif
> +	building_out_of_srctree := 1
> +endif
> +
> +objtree		:= .
> +VPATH		:= $(srctree)

Would you mind using blank padding here, and perhaps fewer blanks than
the tabs are worth?

> --- a/xen/Rules.mk
> +++ b/xen/Rules.mk
> @@ -38,7 +38,7 @@ SPECIAL_DATA_SECTIONS := rodata $(foreach a,1 2 4 8 16, \
>                           $(foreach r,rel rel.ro,data.$(r).local)
>  
>  # The filename build.mk has precedence over Makefile
> -mk-dir := $(src)
> +mk-dir := $(srctree)/$(src)
>  include $(if $(wildcard $(mk-dir)/build.mk),$(mk-dir)/build.mk,$(mk-dir)/Makefile)

Perhaps already when it was changed to $(src) the name has become
slightly misleading, at least imo: I would rather expect a variable
with this name to refer to the build dir/tree. Maybe "srcdir" or
even shorted "sd" right from the start? (Reaching here I can finally
see why having a shorthand is helpful.)

> --- a/xen/arch/x86/efi/Makefile
> +++ b/xen/arch/x86/efi/Makefile
> @@ -1,5 +1,8 @@
>  CFLAGS-y += -fshort-wchar
>  CFLAGS-y += -I$(srctree)/common/efi
> +ifdef building_out_of_srctree
> +CFLAGS-y += -I$(srctree)/$(src)
> +endif

At the example of this (where perhaps -iquote could be used again) - is
it strictly necessary to have the ifdef-s around such? I.e. would things
fail to work for an in-tree build without them?

> --- a/xen/include/Makefile
> +++ b/xen/include/Makefile
> @@ -110,7 +110,7 @@ $(obj)/headers99.chk: $(PUBLIC_C99_HEADERS) $(src)/Makefile
>  	$(foreach i, $(filter %.h,$^),                                        \
>  	    echo "#include "\"$(i)\"                                          \
>  	    | $(CC) -x c -std=c99 -Wall -Werror                               \
> -	      -include stdint.h $(foreach j, $($(i)-prereq), -include $(j).h) \
> +	      -include stdint.h $(foreach j, $($(patsubst $(srctree)/%,%,$i)-prereq), -include $(j).h) \

Please split the $(foreach ...) from the earlier -include.

> @@ -124,8 +124,8 @@ $(obj)/headers++.chk: $(PUBLIC_HEADERS) $(src)/Makefile
>  	$(foreach i, $(filter %.h,$^),                                        \
>  	    echo "#include "\"$(i)\"                                          \
>  	    | $(CXX) -x c++ -std=gnu++98 -Wall -Werror -D__XEN_TOOLS__        \
> -	      -include stdint.h -include $(src)/public/xen.h                  \
> -	      $(foreach j, $($(i)-prereq), -include c$(j)) -S -o /dev/null -  \
> +	      -include stdint.h -include $(srctree)/$(src)/public/xen.h       \
> +	      $(foreach j, $($(patsubst $(srctree)/%,%,$i)-prereq), -include c$(j)) -S -o /dev/null -  \

Similarly here please split -S ... onto the next line.

> --- a/xen/xsm/flask/ss/Makefile
> +++ b/xen/xsm/flask/ss/Makefile
> @@ -9,3 +9,6 @@ obj-y += conditional.o
>  obj-y += mls.o
>  
>  CFLAGS-y += -I$(srctree)/xsm/flask/include
> +ifdef building_out_of_srctree
> +    CFLAGS-y += -I$(objtree)/xsm/flask/include

There's no header in $(srctree)/xsm/flask/include in this case, so if you
use "ifdef" here, shouldn't that other part move into an "else"?

Jan


