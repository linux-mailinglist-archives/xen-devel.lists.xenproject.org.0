Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4774021F41B
	for <lists+xen-devel@lfdr.de>; Tue, 14 Jul 2020 16:31:19 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jvLwU-00030V-By; Tue, 14 Jul 2020 14:29:58 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CaI7=AZ=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jvLwS-00030Q-Tz
 for xen-devel@lists.xenproject.org; Tue, 14 Jul 2020 14:29:56 +0000
X-Inumbo-ID: 7cd94aec-c5de-11ea-bca7-bc764e2007e4
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7cd94aec-c5de-11ea-bca7-bc764e2007e4;
 Tue, 14 Jul 2020 14:29:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1594736996;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=b8om463gRNF4qLu5qLFh8zoCkH24j5z2o6bB4TYwNp4=;
 b=IfaKIxB4a9HLe7pLX4lEu5xnxG04frl8+Es0b9g9A8U2HCQrkopGBgW1
 Sr7tsbk3tj1n2+4jt5OMry/32V9Mjr0uPtCKdRTrrItgvzYap4RpWS/Kr
 Qy33t/vvQM8Ji66/igbNikJaeQmJkPt9EahH0On6/PsMOM4iKrLXHGOkJ s=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: DoJ72Sl64rH9CcCLYR0m4n/sCQF0S1+885X9QLdm5Z6gs5bV24vng9fU2/J7QjuyQsb+BbP+io
 Cs7c32lugl5WPFWUdAmijNhCTeYiSU0uP5bts31IOca2GEmay7wWUZo5EF/gvigiQDbWxMAF6S
 sS9WGPw8RUanxUt7PLtI8gvws85jffWDSjpwJ7uTTgWZa5qAgka+Pszr97G/OunK3f40btA2rA
 YTOqN4v5yeGAo8bkwY1QWkHZh9UKFsVEQo9cHdcgdhbV1wm0lB4ANAeHdfkOEq4jN98nyXU4nF
 6Ck=
X-SBRS: 2.7
X-MesageID: 22541779
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,350,1589256000"; d="scan'208";a="22541779"
Date: Tue, 14 Jul 2020 16:29:48 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH v2 5/7] x86: generalize padding field handling
Message-ID: <20200714142948.GK7191@Air-de-Roger>
References: <bb6a96c6-b6b1-76ff-f9db-10bec0fb4ab1@suse.com>
 <83274416-2812-53c9-f8cb-23ebdf73782e@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <83274416-2812-53c9-f8cb-23ebdf73782e@suse.com>
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Paul Durrant <paul@xen.org>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Wed, Jul 01, 2020 at 12:27:37PM +0200, Jan Beulich wrote:
> The original intention was to ignore padding fields, but the pattern
> matched only ones whose names started with an underscore. Also match
> fields whose names are in line with the C spec by not having a leading
> underscore. (Note that the leading ^ in the sed regexps was pointless
> and hence get dropped.)
> 
> This requires adjusting some vNUMA macros, to avoid triggering
> "enumeration value ... not handled in switch" warnings, which - due to
> -Werror - would cause the build to fail. (I have to admit that I find
> these padding fields odd, when translation of the containing structure
> is needed anyway.)
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

> ---
> While for translation macros skipping padding fields pretty surely is a
> reasonable thing to do, we may want to consider not ignoring them when
> generating checking macros.
> 
> --- a/xen/common/compat/memory.c
> +++ b/xen/common/compat/memory.c
> @@ -354,10 +354,13 @@ int compat_memory_op(unsigned int cmd, X
>                  return -EFAULT;
>  
>  #define XLAT_vnuma_topology_info_HNDL_vdistance_h(_d_, _s_)		\
> +            case XLAT_vnuma_topology_info_vdistance_pad:                \
>              guest_from_compat_handle((_d_)->vdistance.h, (_s_)->vdistance.h)
>  #define XLAT_vnuma_topology_info_HNDL_vcpu_to_vnode_h(_d_, _s_)		\
> +            case XLAT_vnuma_topology_info_vcpu_to_vnode_pad:            \
>              guest_from_compat_handle((_d_)->vcpu_to_vnode.h, (_s_)->vcpu_to_vnode.h)
>  #define XLAT_vnuma_topology_info_HNDL_vmemrange_h(_d_, _s_)		\
> +            case XLAT_vnuma_topology_info_vmemrange_pad:                \
>              guest_from_compat_handle((_d_)->vmemrange.h, (_s_)->vmemrange.h)

I find this quite ugly, would it be better to just handle them with a
default case in the XLAT_ macros?

AFAICT it will also set (_d_)->vmemrange.h twice?

>  
>              XLAT_vnuma_topology_info(nat.vnuma, &cmp.vnuma);
> --- a/xen/tools/get-fields.sh
> +++ b/xen/tools/get-fields.sh
> @@ -218,7 +218,7 @@ for line in sys.stdin.readlines():
>  				fi
>  				;;
>  			[\,\;])
> -				if [ $level = 2 -a -n "$(echo $id | $SED 's,^_pad[[:digit:]]*,,')" ]
> +				if [ $level = 2 -a -n "$(echo $id | $SED 's,_\?pad[[:digit:]]*,,')" ]
>  				then
>  					if [ $kind = union ]
>  					then
> @@ -347,7 +347,7 @@ build_body ()
>  			fi
>  			;;
>  		[\,\;])
> -			if [ $level = 2 -a -n "$(echo $id | $SED 's,^_pad[[:digit:]]*,,')" ]
> +			if [ $level = 2 -a -n "$(echo $id | $SED 's,_\?pad[[:digit:]]*,,')" ]
>  			then
>  				if [ -z "$array" -a -z "$array_type" ]
>  				then
> @@ -437,7 +437,7 @@ check_field ()
>  				id=$token
>  				;;
>  			[\,\;])
> -				if [ $level = 2 -a -n "$(echo $id | $SED 's,^_pad[[:digit:]]*,,')" ]
> +				if [ $level = 2 -a -n "$(echo $id | $SED 's,_\?pad[[:digit:]]*,,')" ]
>  				then
>  					check_field $1 $2 $3.$id "$fields"
>  					test "$token" != ";" || fields= id=
> @@ -491,7 +491,7 @@ build_check ()
>  			test $level != 2 -o $arrlvl != 1 || id=$token
>  			;;
>  		[\,\;])
> -			if [ $level = 2 -a -n "$(echo $id | $SED 's,^_pad[[:digit:]]*,,')" ]
> +			if [ $level = 2 -a -n "$(echo $id | $SED 's,_\?pad[[:digit:]]*,,')" ]
>  			then
>  				check_field $kind $1 $id "$fields"
>  				test "$token" != ";" || fields= id=

I have to admit I'm not overly happy with this level of repetition
(not that you introduce it here), but I would prefer to have the
regexp in a single place if possible, it's easy to miss instances
IMO.

Thanks.

