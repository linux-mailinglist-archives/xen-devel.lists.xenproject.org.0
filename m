Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A6C5A3763A9
	for <lists+xen-devel@lfdr.de>; Fri,  7 May 2021 12:27:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.123948.233892 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lexgi-0006ZH-0X; Fri, 07 May 2021 10:26:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 123948.233892; Fri, 07 May 2021 10:26:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lexgh-0006X4-Tr; Fri, 07 May 2021 10:26:27 +0000
Received: by outflank-mailman (input) for mailman id 123948;
 Fri, 07 May 2021 10:26:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4HO4=KC=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lexgg-0006Wy-RG
 for xen-devel@lists.xenproject.org; Fri, 07 May 2021 10:26:26 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a16821d7-6d72-46a3-82d7-642feb0e5071;
 Fri, 07 May 2021 10:26:25 +0000 (UTC)
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
X-Inumbo-ID: a16821d7-6d72-46a3-82d7-642feb0e5071
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1620383185;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=cBLNA3M/6/OVWfUIf0EjGQ794PL/9ZCVT8Pnc+UCy4I=;
  b=cqcWZhkDlWhujQfa0EsCWB5cohApozKxFKcEorOmEH5l2UBMuKHL5e2C
   Tt3iYAVBLib5HORvqYk58vDpWi+WFCk006VAQce8EPzt13nCvVmPT+bnY
   M+GIy4vXJzo97xetdm6Hsj5h+MTEr5B2WOTZzc8U7Pm+pV4vL5p2NbGFE
   8=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: vdkvY8i0oItjhJc8At2//s1kNRL4sXbPm178WU31BQKI9ak7DtKl34X5fSijuOw6Fq4EWBfzWd
 4qI9nXFgjRgZuwlyOw4X0zMqPf058zkGZfESpUTFH5jLcxXfTVID03FQKHjm6zOhCHifGxkQMc
 GssJcLxZGXOumgOA6A4EsVMl4ycph6x8wzspmfSSougcGu2zqBD79bftxHIbIB/sTID5xnMxSc
 /btdFae/MeDwwzDqkE+z8xEhNKHXI4C/IMejuzkHbQDeoCj8br+gdPMV8Er3fsU1o6AWQ17s7M
 Kfg=
X-SBRS: 5.1
X-MesageID: 44816443
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:g9h+Ta9oGqTf6ExTf65uk+Hadb1zdoMgy1knxilNoENuHPBwxv
 rAoB1E73PJYVYqOE3Jmbi7Sc+9qFfnhONICOgqTM2ftWzd2VdAQ7sSiLcKrweQfxEWs9QtqZ
 uIEJIOeOEYb2IK9foSiTPQe71LrajlgcLY99s2jU0dNj2CA5sQnjuRYTzra3GeKjM2YqbQQ/
 Gnl7R6TnebCDgqhqvRPAhLY8Hz4/nw0L72ax8PABAqrCOUiymz1bL8Gx+Emj8DTjJm294ZgC
 j4uj28wp/mn+Cwyxfa2WOWxY9RgsHdxtxKA9HJotQJKw/rlh2jaO1aKvy/VQgO0aOSAWsR4Z
 zxS09KBbU215qRRBD6nfLV4Xii7N50gEWSjmNx6BDY0L/ErDFTMbsLuWsWSGqe16KM1OsMpp
 6j5Fjpw6a/Oymw1BgV1+K4Ii2CqXDE1kbKsdRjxUC3ArFuJYO4k+QkjQpo+cA7bV3HAcYcYb
 BTMP0=
X-IronPort-AV: E=Sophos;i="5.82,280,1613451600"; 
   d="scan'208";a="44816443"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gEPLhjjiWy7a8STo1hX4OU9KeTGkEZWa0A1+LVAhYxOHUwswQ1Y4pVJroDfTkLS7yMyCvXz7uDop3+Nh/BcPrXcrbRmWB/wG7NESJUawmV/srizw5GUIdyZle4nKrpwkClZlahnGwMHFhe3OS9fTOt+09xoC0uYgo+fUsNsAU7wOnE+yNge2a4XEn/vr5U0xy9rshAPS901WsuMJrWGzMWXPeik+SLVWIq/xf/bIg/cyJ5DatdX9D+qfP9og0DfrEqih5y9aAgU3l3ok1P+dl7GdFCOaqy23l8CiczPN5x18Miy2OmsIKGqS+vKVQbzztolimZEAzEoBF8czyKLIGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uA7J73w4tUhnzRmbH076hDYbU3zz8EBFrETmbD7W0Ak=;
 b=WmjUnh1RkmWYRkSaaVIMH1S9eLvuuy0oGY66fzy65L6M8OEcEu3RlwCpDeluBIc8AcnjlEI3gQ9hZhx/UcnQibciHmZxu9mX3E0TmmHzbisQXKTZOIT1YsWgBFIwy9PLODQ0HtqhzbrugJoQLmRxLwm5d2tDaOUvTSQSKL2CQcgaTg4++HHe/TXc8TybSsjDS7aRedGfYJeDaUiSgDSmPhec2rNGyBZ7EP6ThEVWCYWvvzbvnDNj/VK92BZJlHcgUu0Yf+gXzML7DsaRsI0+KewO1/oojk9hidACH8L8SdFrBQmspKjMawoTfrPCey+swCNAlCfGc2lkgNcB8Y1HyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uA7J73w4tUhnzRmbH076hDYbU3zz8EBFrETmbD7W0Ak=;
 b=Gbeg0n3MQwjheOIRuAraGK9G2c2fkd19mU+S0o74n2wI+KZUGk959H6wR6J0NzyrjoL4j4ToftDe5zZjgFOMbSgI5v/nUgyWbfJZXiX/f2bSaaEuXjVi6rUPm3vFy1i68uZ2RbvRCA9JVDDMDestabBDj4wp6pdlOeTqWo6GqAY=
Date: Fri, 7 May 2021 12:26:15 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: George Dunlap <george.dunlap@citrix.com>
CC: <security@xenproject.org>, <xen-devel@lists.xenproject.org>, Jann Horn
	<jannh@google.com>, Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH v2] SUPPORT.md: Un-shimmed 32-bit PV guests are no longer
 supported
Message-ID: <YJUVx8WMn/4f0gMS@Air-de-Roger>
References: <20210506124752.65844-1-george.dunlap@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210506124752.65844-1-george.dunlap@citrix.com>
X-ClientProxiedBy: MR2P264CA0187.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501::26)
 To DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 23e50226-efd9-47f0-1bc5-08d911428f53
X-MS-TrafficTypeDiagnostic: DM6PR03MB4540:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB45401A2D7FEE02EAB3FD5E608F579@DM6PR03MB4540.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3rD9P5xt5ufCv494x71cPqEAIVY1X78K38boaSHO+3lJJCRNZ4dSOVlXIkMehrHAACXira/Xv4pBgAPhnl7VWVmo1iv+uiGKPgc80nKZaH5WJGz84s4mhgfCxnx6kGvvTiDEt3XtNaWyk/Pt+gRBELiTlqdKsYOvzB/ohNcX3kQ+YjVMvEg3fQ1u7GivMRaBx1A7NsecAkR9EBL2CYw+MhnbzRQRRYXCfGAe7Z8DOv2a69QT7mHtH/x2PdGXSmkCAkMU2L2Cr1myBfXS1yDh/0QTdx02y/ByPKTp+HhfN9cofNSOxVl7qGUfh7Ish2eoZcZkfil2drSynq7F/9E0/GtO4QEDnQByQ73lKugKhwZ7vMV1ZlswbW5xJS1MbDNoeAdzgwnj4mml/m50O5ji9WGiLWSHNDpyjRV0Ad4cXHfomOUDnESSqEFID8lKQz69EJaiXOm4g3kIRHxYeYqI2KIUPbabRlcXvHGkJJhZoUt0IQv6nZXnFv/8jd+GBf59JVAtSz2H8rarJ9UP+a1W9A2AV3rPIBRoroSHQ7v/jAXZvead/6yw5K/0TbE2kvPjEo3TJSotZsGD6FYev1tHvC+TJb1oVbgzuMf9hgblyGQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(366004)(346002)(39860400002)(136003)(396003)(376002)(54906003)(4326008)(8936002)(6862004)(66476007)(478600001)(66556008)(85182001)(6496006)(26005)(6666004)(186003)(8676002)(9686003)(956004)(38100700002)(316002)(86362001)(33716001)(6636002)(6486002)(2906002)(5660300002)(83380400001)(66946007)(16526019);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?NUVqOEJMS0szZFRZZys1RGJENklncnRFdXg3eEdvWUZSQVlJempMTUdIMmtv?=
 =?utf-8?B?Zkc1ZnRYMUFEOFE0eU4rZmpLNW56UXV3QXBLdHJ0R2FpRGRDcExkbk9ZMnFz?=
 =?utf-8?B?RDFqei9RRTZZZ0NHd0tnLy9ZYXEyNHBrSkxheUtuTENMN3p3ZHpjKzhCbUlz?=
 =?utf-8?B?U2tMcVVMalB3MjJIZ1U2Wnc2TE9SMitHOVpLZWV4NDRDZkpDZDh1VlRCQlht?=
 =?utf-8?B?OTlvSkpudDk4aXFTUHlNelhmNEdTcXAyRFZhQ0xqb25ITE15Nk9qb25iUjkx?=
 =?utf-8?B?VlVBeEpUYjlIUmQvSnJTY3B5c1UzcnpvRFdBc3BZSTc1N3kvaXhZS0FxWStN?=
 =?utf-8?B?SytoY1FsdEc1bHVmWFA0cE41OG0yekJIcGtCOVRNUGprWWpSOS92R2JScEZh?=
 =?utf-8?B?TjdyNVpGM1hTd1ExM0l0cjRaWWdackdidG9rU0hYenVwM3JNQTAwQzR3TmFM?=
 =?utf-8?B?bG94cUJZY3l2RGtxQWtib0x3VW1MM1AvNG5JSjREeTRTM2t1eVUyVUZLcHJT?=
 =?utf-8?B?WGxFYndNalIxaVdYREEyek5aUGlUUnNJZnIvS1JtR1hpRSt2TW02N0c1QjBY?=
 =?utf-8?B?RHlreTAxaHJvV0xSUnJmMnlFRWtXQjNNcTlaTlhCRGYyRFIzdUdnUXdWdUlY?=
 =?utf-8?B?SEIwd000YmxYZ1RzUjZJanFqU2hSMkhzVFVXMEFhWkY2NjNiQmVvNzBLMi9P?=
 =?utf-8?B?ZnJnaDRjdGRRd213STY2cXpRRG9xblB6M3BZbTFvMDdTaFZyOHEvTXVQbjR0?=
 =?utf-8?B?VXF0SEM5M1IzRGJMZFV0TERkWGR4NDRYMC9IaHdFdXdiTC9JNHhDbFJ4V3hG?=
 =?utf-8?B?dnVSb2JGNXM1RWlvL2s2WTdmaUIxNzhFb3lJUE8vOUdpVjN3S29GRi9YUDJK?=
 =?utf-8?B?QVVzRUFoTTE5cFVsWmcrSjJTRlZwb0pvQzJnNnpiZkVldFZIeGh2Q2F3dVpI?=
 =?utf-8?B?MFZRTjk4aVRCODhVaG9QNXlYQ1hBZysrb2M1V3ZCTEh2MmdsQVBKQ3Nmenlu?=
 =?utf-8?B?QW1SUmx2N1NXcDVZTXNQNnp1QnhTcEF1cW5kdVg3Zi9YTW1rcFV5aUdqdjBP?=
 =?utf-8?B?dUUyTllKb3V2UUF2SkluVkpYL2pBOGxUa3VIb0tndXZuNEVrZDFoSmM5ZGtM?=
 =?utf-8?B?dm9ha0tZOUhMaVpCVFA4cFYvWXBWVGZoaFRFbEZhZ0c2TWdETUNFWmFYU1Bx?=
 =?utf-8?B?OFFVZDhLbWtiSHJwL1diRXdDN3VmanJJYm1VM0ZmWCtkNDFYSEJpcStyUUpS?=
 =?utf-8?B?T2hvaC9GVkJzYUVMU0x0R2dJQlhiTkRmakZJVE9BNHlVTTZNVElNSis2VDVL?=
 =?utf-8?B?NzV5ZEZNTndxZDE2ZndlZFpNMlcrSysxQmI0bWhHQ3VZektKMzk4VjNTbjhD?=
 =?utf-8?B?azF1MWlVdmZ5VGNNTy9zdDY3YmxrdXJkUnY1T2RFY1dCcW5nYXo4eDZFWjhN?=
 =?utf-8?B?TzVXdHVjMk5meVVHS1N5ZnFhTjZsRWdwWEZ2N2d5UHg1SW1pbHFGcndJQnB5?=
 =?utf-8?B?NEJBcDlEc0VxaGUrOVBiQ1QzTlhmT3Y5SXNQREhabmo4L1NtOEEvTmZUc01H?=
 =?utf-8?B?VGY2cCtrVzVRMVcvNU44Y2E3eXM5YWdEb2JOWmlTSVdaQk53MzNjV0ZTUTRH?=
 =?utf-8?B?eDFuUGtFNDRlMHRYMVBIUEIwT052ZHRZWmF5TGRaRzFSTkNVUFpEd0FBNnh6?=
 =?utf-8?B?RHdZN0l5UU44R0pqTEhLai9FOUdFdmwzdm11RkVrbm11MERGc0IzbzJvS0o3?=
 =?utf-8?Q?gK41Ov4mYi6DZIp7CBJ2kZ5LVuj/T8fQRnQTzgv?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 23e50226-efd9-47f0-1bc5-08d911428f53
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2021 10:26:22.1440
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TL+DT1B+26OFhU29gpc+azISoUteeAx4Lp038Li8cEIyU/aXqh/F6vBp+FTtEjGj3u+Pr6rFsuRSSp6zn53bbw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4540
X-OriginatorOrg: citrix.com

On Thu, May 06, 2021 at 01:47:52PM +0100, George Dunlap wrote:
> The support status of 32-bit guests doesn't seem particularly useful.
> 
> With it changed to fully unsupported outside of PV-shim, adjust the PV32
> Kconfig default accordingly.
> 
> Reported-by: Jann Horn <jannh@google.com>
> Signed-off-by: George Dunlap <george.dunlap@citrix.com>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> v2:
>  - add in Kconfig from advisory, ported over c/s d23d792478d
> ---
>  SUPPORT.md           | 9 +--------
>  xen/arch/x86/Kconfig | 7 +++++--
>  2 files changed, 6 insertions(+), 10 deletions(-)
> 
> diff --git a/SUPPORT.md b/SUPPORT.md
> index d0d4fc6f4f..a29680e04c 100644
> --- a/SUPPORT.md
> +++ b/SUPPORT.md
> @@ -86,14 +86,7 @@ No hardware requirements
>  
>      Status, x86_64: Supported
>      Status, x86_32, shim: Supported
> -    Status, x86_32, without shim: Supported, with caveats
> -
> -Due to architectural limitations,
> -32-bit PV guests must be assumed to be able to read arbitrary host memory
> -using speculative execution attacks.
> -Advisories will continue to be issued
> -for new vulnerabilities related to un-shimmed 32-bit PV guests
> -enabling denial-of-service attacks or privilege escalation attacks.
> +    Status, x86_32, without shim: Supported, not security supported
>  
>  ### x86/HVM
>  
> diff --git a/xen/arch/x86/Kconfig b/xen/arch/x86/Kconfig
> index e55e029b79..9b164db641 100644
> --- a/xen/arch/x86/Kconfig
> +++ b/xen/arch/x86/Kconfig
> @@ -55,7 +55,7 @@ config PV
>  config PV32
>  	bool "Support for 32bit PV guests"
>  	depends on PV
> -	default y
> +	default PV_SHIM
>  	select COMPAT
>  	---help---
>  	  The 32bit PV ABI uses Ring1, an area of the x86 architecture which
> @@ -67,7 +67,10 @@ config PV32
>  	  reduction, or performance reasons.  Backwards compatibility can be
>  	  provided via the PV Shim mechanism.
>  
> -	  If unsure, say Y.
> +	  Note that outside of PV Shim, 32-bit PV guests are not security
> +	  supported anymore.
> +
> +	  If unsure, use the default setting.

While not opposed to this, I wonder whether we should give people some
time to adapt. We have in the past not blocked vulnerable
configurations by default (ie: the smt stuff for example).

It might be less disruptive for users to start by printing a warning
message at boot (either on the serial for dom0 or in the toolstack for
domU) and switch the default Kconfig slightly later?

Note I don't have any specific interest in 32bit PV, so I'm not going
to argue strongly against this if everyone else is fine with it.

I also wonder whether xl shouldn't try to boot PV 32bit guests by
default using the shim now if the hypervisor has been built without
CONFIG_PV32, or at least print a message so users know how to deal
with the fallout.

Roger.

