Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 07240367FCB
	for <lists+xen-devel@lfdr.de>; Thu, 22 Apr 2021 13:49:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.115327.219948 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZXpn-0000xr-Lp; Thu, 22 Apr 2021 11:49:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 115327.219948; Thu, 22 Apr 2021 11:49:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZXpn-0000xU-Ib; Thu, 22 Apr 2021 11:49:27 +0000
Received: by outflank-mailman (input) for mailman id 115327;
 Thu, 22 Apr 2021 11:49:26 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=00C0=JT=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lZXpm-0000xN-Nn
 for xen-devel@lists.xenproject.org; Thu, 22 Apr 2021 11:49:26 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7e3223ce-014f-453f-b28e-b5d3dacd4e7b;
 Thu, 22 Apr 2021 11:49:25 +0000 (UTC)
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
X-Inumbo-ID: 7e3223ce-014f-453f-b28e-b5d3dacd4e7b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1619092165;
  h=to:cc:references:from:subject:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=y/SvzFxn2ov0Nhk0NDvzquny9bJF4g0Ycp5FeCkDVxM=;
  b=LQtL2Q5PIBLTjU+aMBOBLl1yUVqq5YhsG1PqeEJl70rdYYtx050l/NQT
   BhnzT8Gvyb+nv9sb0jlkjKnc65KG/qF3zBdKMp/BV81fT9eWb/CNMuzPn
   Jhnpx78h+nJnC1UHNFQrXNSoCaukrlag1NhOUWhTvQQo9rxo/2FWjC+09
   8=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: ZM2s9fQMD7ziOEZ+vQ021SzsSJ/H+p4uiVh6/FBFjcYIXndlJQcsb8barLmgJnRwN3TlQ+JaVi
 xodThdyJjibrWhRaKXNcXV4JFk0a48MNVn1m73vd/dHF3eZV5Owr7eYRNURnqrlPrmhUuWLUEc
 88UWsagoqxvKRAGA3fgSBrm0+PHJ9vG6hewTf5xZnJL0rjr58WlxGoBsn3781K1htDZgZETlOC
 kKh33J7LP1ae8ieKs7Xlu3e24oukdL+N7CWAjG35o3xeaQK6QH/i2cOB0LQDYmUspcXqTFa/nZ
 aPw=
X-SBRS: 5.2
X-MesageID: 43660527
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23: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
X-IronPort-AV: E=Sophos;i="5.82,242,1613451600"; 
   d="scan'208";a="43660527"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fcyZ9l/nt0s6qgS37CDVMgIWgjs726HW5FB3GKoRqkRv+xbySFd0n78PtT4zyYlcvvoz1BxpLcQD8KV5Z3u8WcQEZpJ2FMk38oI13T76tA56Gi5QXYNCMMuARDMvhI7/ieqv/O2UW97FKzwuZSYSLtU365xt6+hfFTzp4ugwqun5QE3Pn0HMDReCToXAQNG/JyEJydaw99XnW+dIOWzDEP0SOlQJSQ9lApJAdtSK/iRMxpDiwaD1f9m23OTAkkNR63WEfY7utb7Oubq3wYBVCzTJD3lCUoyQWYNcdDA/QCVfDsAVFLTvsWq5Nyj2yhfWgWl3pYA0jl3gMhN6Cg0h6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AuGSutb6tXApNa7uWxeh5/Kpi01VmEh80TySZWVu5tQ=;
 b=kcMZWAR8z8uyiCwp6XC+H28ZtxwttevuZWAkFIYqSo1GZveg+BCmro100onAw6bFIDyAHX/w1gAp9ONDmrJ1keZCfBIQ4nO490tnfbAsQ7akPdrRvcApyR0lrKBdSVQkkJQRaOesZqKXCp/HKyPcKrSDbCM820ogUgKCi69LQkcVzf53l70W+N/0YzzdMVLkz+xuCyorgg5ol7RT59gN4H5UZocHyc49hgXhacLhE3EnO+EIbYem9e+fVp1/NqDb+NfA/EnUN+NCHQkjjudpdILjOREkiN7D5BH6xK7huOrN0ST3Nl4I1A2N0m2Qqe49WpVKbqJ/GfsSSgIlYG/1hg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AuGSutb6tXApNa7uWxeh5/Kpi01VmEh80TySZWVu5tQ=;
 b=hqgglFsPgETIiX/QTbKseDtVOoVArROmz1fw90PIjgRzuHjgDBGqubWi3dhU8So95iITDGQB6Q/yx3WpilFV7KDjElqD6uIHDhpVg1ntzEBZZQTOGjoH9bXp7yh/T4+OqIHm+HOZ/nHGEwKpsbcvl+QTMrVJhXiR831v03nu4tI=
To: Olaf Hering <olaf@aepfle.de>, <xen-devel@lists.xenproject.org>
CC: George Dunlap <george.dunlap@citrix.com>, Ian Jackson
	<iwj@xenproject.org>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20210415131138.8709-1-olaf@aepfle.de>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v4] tools: create libxensaverestore
Message-ID: <39eb928b-161d-4870-93d2-8c15929aa32f@citrix.com>
Date: Thu, 22 Apr 2021 12:49:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <20210415131138.8709-1-olaf@aepfle.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
X-ClientProxiedBy: LO2P265CA0232.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:b::28) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3dd73c57-c1bf-4200-47f5-08d90584ab65
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6357:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SJ0PR03MB6357E2D6E2FA4A7A5166AB10BA469@SJ0PR03MB6357.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7G7oNsIhQvh/zg/wM/StzuppQkI1wXlaZnqRI6TXjlzz1PuOOTiMEPA3awlOzWMnK7LGsD6KaDTiQTZUouWUP43kFNVkA3AGji4Dhn0HEmpfQGCJBnkpOhqBFfA5QuW3QCROIo8en43/F84dw0qLLe7X8YraNjRrHdoN5c6I8LgwuvqtXQPHvgvu0nMQv4/GFRrwytQRV7jSRyrTw/eCIOQbqk75ck4QanGSlOBc2UiZldto7ideBW7x5qPrKzIM9GuY7pZ7k1T6H2H4RJtRivvJCQcZgpZVA7NldaUCfxWdHsvFn4rSXvbWBiPUnZMWIAB6+HFELgyQzKjgHgqdURGOzVGxnE3orUoegoCFbrtXcC2GDIWHKjRuIp5nW/CeY+KyFpc4ayXCz75Z3dmBwm8mWs0FELW7YFX2bW1n8mg2Qs174g4KMEJIdwcCmHVb8wr2SD0P8wgvb/s8FlSIw4Cf3JTfxyfgGyIMpl0ftC6m2wVl3UYC8t/6u3/QA6qarkQ2OyJrjpfaszfn/4WxtMhxjremDY1R5D7COvdK24NA8Tv7dxCP14mTV1vln5ll9lIDFa/B1LCRwjZchUow386lksspEGjbb7ydeWGaAt49MfMjRSdtj+zVwK9hz4O7wqsOVkPWo0hNZ8JpUCRQxXMMaVpJgnactHHIFFg8mTJitEcpjEGRJJ33WNUAiPAf
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(39860400002)(376002)(366004)(346002)(136003)(53546011)(16526019)(86362001)(31686004)(2906002)(83380400001)(5660300002)(66476007)(66946007)(66556008)(956004)(38100700002)(316002)(6486002)(16576012)(4326008)(26005)(8936002)(186003)(2616005)(8676002)(36756003)(478600001)(54906003)(31696002)(107886003)(6666004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?aWd5RTQyUktIY24veG5PWjhoSGFUWENMVktZZ3gvT0JyUG0zaWtkVGcrV3RR?=
 =?utf-8?B?SUpJRjFwVyticWc1U1BwNjcvbi9OeE5ad1NnZ1J2QVZ2RmUydHNOOTRtL3pr?=
 =?utf-8?B?N2xWcEdMbVFGVktCUnNhbnpyZUttTmxkdGdUUFIwcVUvYmxKdGxPRmpoTkQ3?=
 =?utf-8?B?RFZtWE5RaCtRQUtzYng1d2s0bFNNM3EwUU9TcWJpSlQwVzFqYzR4dW11MTNV?=
 =?utf-8?B?RkhNZG1wRlkwdVQwWmZEVGhiQmQ2cFp1a0VCblRnYVdaNmU3b2RJZTN4RFFS?=
 =?utf-8?B?MmRNODVhenhMdzR3eGd4Y0hvUnVna2JrSE51NlUwQnVaT1dsenBNbjRVaW0y?=
 =?utf-8?B?akVCRFNIZ2Z5Zm5JQUZaMUpWdVlUUytRMFFWQTZpNDJWbzY1ZTN2T21oZE12?=
 =?utf-8?B?eFY3Vmdwb1dkc2FTTm0xd3BFcHJUM2lpbXd1S21JZnRJeTgzSXBlMnpMRktU?=
 =?utf-8?B?MlF6bHBSbkR2OFJ4c3lyYUNLUldTYVQ1MElja0NVNGlWd2JaaVpoMmN6cHY3?=
 =?utf-8?B?d2hiQ2RGNGw4ZTNjM3lpemtObm53K3RBSVY5enl1K21pME9YajNUZmFTT3JW?=
 =?utf-8?B?YnNnRTRJUnBabUVQdHVqTnZTajlGSlBydTJ3NUVNZXduOGNhbDFDUER6TVZ6?=
 =?utf-8?B?UHdPcERrTHc2ZGx1YlkyZjNIWUlNejJYQ2RFcEpwYTNyQVlseEVRRU9ZcEdp?=
 =?utf-8?B?Z3UvMzZnZU1Ea0hhTUw0SHdqK3krYmRWQWZiTWtrTUJaSldvU1JQbDMreGZK?=
 =?utf-8?B?RVpaam9QVytjMldMajErTklwalRaMUJoVHMwbG95cjM1N1hQWWVBTWhvMnYx?=
 =?utf-8?B?Qng1T0xjeVRBTnhLSk1LUnlrWmdRcWlUMUhRTTM2VnlPU1BwWGtjZGJpK2VW?=
 =?utf-8?B?aC9wdEZyTncvVktQZ2U2OXNJMjM1Q3VlV0p6RFFIcXpOdWg0eUNtSWF0aXU2?=
 =?utf-8?B?eDluRVUvaVpXelc3TU9YS3I1QkU4ME8rek90bk55VVM4VkN4dDZsazJUY1VU?=
 =?utf-8?B?TFpTQVdOVUI1UFZVR0dPdGVUaGxRenpuUlE2WTNxaUZMWUlkNkFMUzNrYUN3?=
 =?utf-8?B?RGJ4ekVhMlUvNEU4STFXN2lyVys2UE9sZzc4RDVNcnlpR1JZUkg1M1p6RTlz?=
 =?utf-8?B?SHFuZWlrUS82c080U1VwUlB1UXY2ZDY3RFh5akdpZFNlTFQ2RjVHMStlNVh6?=
 =?utf-8?B?SHlSb0p0UW1JMXp4ZWV0elNIN05VL3hXdENuZmxLUC9yMWJnUGRMZERnL2Zm?=
 =?utf-8?B?dUUyUFZha1k3amZ0NlhtTFh0Y0ZpTUYrM2gxNDB0VGtraGEwdlpncERseCto?=
 =?utf-8?B?ZVVlMng3OXhtQTdDTjZhcGg1MVYzOGhZWStpaXdOQ2pOWGRIakNwcjBKSGJY?=
 =?utf-8?B?dVh5dlFHbGNzL014WGR6SHMrbnlJWlBZd0Y0dmlQb1BJZUl5Ujg1a2ZJdnBT?=
 =?utf-8?B?d2JTN00zRnR0RUVPQmx4T3VxOFRZVTNlcS9hRmF6c2xhWWczWE1KbGIvTkI2?=
 =?utf-8?B?UjZ2NFBXNGRHY1hBK2ZOVTRtWXFCbWEyM2hZaEl2Tm1EOXltVVhrMHlQZFZ4?=
 =?utf-8?B?RVZSSi8ycFBrL0IwL0Uyc09BOWdHZ09BRG9wOXhpMHJyQndFbGRyTktmMWZG?=
 =?utf-8?B?dTlOdEpjQUFaZkhzUzQ0bVUvNTI5NlRSNjl0TEFMKzJUTFVwQ1NncjJzR1Ay?=
 =?utf-8?B?SkFLMi9vV0R4TFlCK1hub1dEVm1BYm5QS3lEZTYySktXN2lySUsrZ1RyV3Vy?=
 =?utf-8?Q?CCGKYckIr5DBIulgquijBXn9DGu/8YattSwW9V/?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3dd73c57-c1bf-4200-47f5-08d90584ab65
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2021 11:49:22.0268
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1a1d6PIpyDP6qhBr2JybsL68Xe6UiW3Bv4jQKevI24g0taox/avaEnpJD78e/S0VKII6Gql8PjQXu3bQa+DB0mCYTDW2aI+RoYS1gkYvpZA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB6357
X-OriginatorOrg: citrix.com

On 15/04/2021 14:11, Olaf Hering wrote:
> Move all save/restore related code from libxenguest.so into a separate
> library libxensaverestore.so. The only consumer is libxl-save-helper.

"in tree consumer".

It's not the only consumer, but XenServer's equivalent of
libxl-save-helper is in a position to consume this library.

That said, if you've dropped the plans for the static version, I don't
see what the point is.=C2=A0 You're literally saving 15 pages of memory (so
nothing in the grand scheme of a userspace process), at the cost of
added effort for the dynamic loader.

In this form, there's a reasonable chance that it adds to the perf
problems you're trying to address.

> There is no need to have the moved code mapped all the time in binaries
> where libxenguest.so is used.
>
> According to size(1) the change is:
>    text	   data	    bss	    dec	    hex	filename
>  187183	   4304	     48	 191535	  2ec2f	guest/libxenguest.so.4.15.0
>
>  124106	   3376	     48	 127530	  1f22a	guest/libxenguest.so.4.15.0
>   67841	   1872	      8	  69721	  11059	saverestore/libxensaverestore.so.=
4.15.0
>
> While touching the files anyway, take the opportunity to drop the
> reduntant xg_sr_ filename prefix.
>
> Signed-off-by: Olaf Hering <olaf@aepfle.de>
> ---
> diff --git a/tools/libs/saverestore/Makefile b/tools/libs/saverestore/Mak=
efile
> new file mode 100644
> index 0000000000..48728b3be2
> --- /dev/null
> +++ b/tools/libs/saverestore/Makefile
> @@ -0,0 +1,38 @@
> +XEN_ROOT =3D $(CURDIR)/../../..
> +include $(XEN_ROOT)/tools/Rules.mk
> +
> +ifeq ($(CONFIG_MIGRATE),y)
> +SRCS-y +=3D common.c
> +SRCS-$(CONFIG_X86) +=3D common_x86.c
> +SRCS-$(CONFIG_X86) +=3D common_x86_pv.c
> +SRCS-$(CONFIG_X86) +=3D restore_x86_pv.c
> +SRCS-$(CONFIG_X86) +=3D restore_x86_hvm.c
> +SRCS-$(CONFIG_X86) +=3D save_x86_pv.c
> +SRCS-$(CONFIG_X86) +=3D save_x86_hvm.c
> +SRCS-y +=3D restore.c
> +SRCS-y +=3D save.c
> +else
> +SRCS-y +=3D nomigrate.c
> +endif

Depending on the answers to the general question above...

I don't think pulling nomigrate into this new library is sensible.=C2=A0 A
dedicate migration library, stubbed to errors based on some exterior
setting, is very rude.

Given the proposed new structure, the way this ought to be expressed is
libxl-save-restore-helper being conditional on CONFIG_MIGRATE in the
first place.

Also, xensaverestore is a mouthful.=C2=A0 If we are changing things, how
about xenmigrate instead?

~Andrew


