Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 079A71EE37B
	for <lists+xen-devel@lfdr.de>; Thu,  4 Jun 2020 13:36:28 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jgoA9-0006WC-2B; Thu, 04 Jun 2020 11:35:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NfFn=7R=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jgoA8-0006W7-4B
 for xen-devel@lists.xenproject.org; Thu, 04 Jun 2020 11:35:56 +0000
X-Inumbo-ID: 8cf2d980-a657-11ea-81bc-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8cf2d980-a657-11ea-81bc-bc764e2007e4;
 Thu, 04 Jun 2020 11:35:55 +0000 (UTC)
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: B/2NPJysEtlF5iTqSkXZRVP925RDlvp2ZZBlE9KU/CLGxRgRdzEU6/RhJ+JXwp1GYufnrGE/Gb
 s8aFiR0mVk9imNJBm5m41nO2Ue6BdKfpdSFdla9Pb0TUAjtzez9hKl3q+j1/xy5bU4o3GirNqx
 1e311TVg8FEoSbllvQnsiGssmxZRkjJQNTk3luHer36l5DMzRQsVw1JGy4HCaDBabZ79iyHTqh
 U1sed9m+l6h2QGttP+x4uG3XAvXqCnlxHIscKYi6if170slsMMDpANO4arpLIZ3IUvF1LgADGp
 YRU=
X-SBRS: 2.7
X-MesageID: 19505023
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,472,1583211600"; d="scan'208";a="19505023"
Subject: Re: [PATCH] build: fix dependency tracking for preprocessed files
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
References: <bb246053-f49b-58af-5381-fe0674f645de@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <0f8afd27-2af5-580e-48f8-65c01881e568@citrix.com>
Date: Thu, 4 Jun 2020 12:35:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <bb246053-f49b-58af-5381-fe0674f645de@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
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
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 04/06/2020 11:22, Jan Beulich wrote:
> While the issue is more general, I noticed that asm-macros.i not getting
> re-generated as needed. This was due to its .*.d file mentioning
> asm-macros.o instead of asm-macros.i. Use -MQ here as well, and while at
> it also use -MQ to avoid the somewhat fragile sed-ary on the *.lds
> dependency tracking files. While there, further avoid open-coding $(CPP)
> and drop the bogus -Ui386.

Its not bogus.  It really is needed to prevent OUTPUT_ARCH(i386:x86-64)
being preprocessed to OUTPUT_ARCH(1:x86-64)

This explodes properly with 32bit builds, but we might get away with it
now on a 64bit build (preprocessing without -m32 does appear to skip
this transformation).

However, the robust way to deal with it is:

/* Don't clobber the ld directive */
#undef i386

unconditionally in xen.lds.S

> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>
> --- a/xen/Rules.mk
> +++ b/xen/Rules.mk
> @@ -201,13 +201,13 @@ $(filter %.init.o,$(obj-y) $(obj-bin-y)
>  	$(call if_changed,obj_init_o)
>  
>  quiet_cmd_cpp_i_c = CPP     $@
> -cmd_cpp_i_c = $(CPP) $(filter-out -Wa$(comma)%,$(c_flags)) $< -o $@
> +cmd_cpp_i_c = $(CPP) $(filter-out -Wa$(comma)%,$(c_flags)) $< -o $@ -MQ $@

Please can -MQ come before $<, so the input and output files are still
at the end of the command.  It is a very useful property of the current
setup, when playing build system surgery.

If you're happy with both of these suggestions, Reviewed-by: Andrew
Cooper <andrew.cooper3@citrix.com> to save another round trip.

Alternatively, I'm happy to submit the i386 as a prereq patch, seeing as
it isn't now such a trivial change any more.

~Andrew

