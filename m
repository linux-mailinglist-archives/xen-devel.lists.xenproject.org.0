Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C255FB029C0
	for <lists+xen-devel@lfdr.de>; Sat, 12 Jul 2025 09:46:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1041706.1412316 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uaUvP-0000VG-Ek; Sat, 12 Jul 2025 07:45:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1041706.1412316; Sat, 12 Jul 2025 07:45:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uaUvP-0000TA-CF; Sat, 12 Jul 2025 07:45:35 +0000
Received: by outflank-mailman (input) for mailman id 1041706;
 Sat, 12 Jul 2025 07:45:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=T+S0=ZZ=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1uaUvN-0000T4-HO
 for xen-devel@lists.xenproject.org; Sat, 12 Jul 2025 07:45:33 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2fd55331-5ef4-11f0-a318-13f23c93f187;
 Sat, 12 Jul 2025 09:45:31 +0200 (CEST)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 (Authenticated sender: nicola)
 by support.bugseng.com (Postfix) with ESMTPA id A5CA04EE9BBD;
 Sat, 12 Jul 2025 09:45:30 +0200 (CEST)
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
X-Inumbo-ID: 2fd55331-5ef4-11f0-a318-13f23c93f187
Authentication-Results: bugseng.com; arc=none smtp.remote-ip=162.55.131.47
ARC-Seal: i=1; d=bugseng.com; s=openarc; a=rsa-sha256; cv=none; t=1752306330;
	b=eLlE2uK1Ua6sUEVXNj5r3dej4372Bj30askekufvDX4oUMI/7xTUjShXZvX7oFl+u3Cx
	 ypMTtihFefbCRucRMZU75dkkTliKJUGK7yV5lbTf0/+N/DH7V9kCe8ctYKMRyXzAVSy91
	 /3p65xa6CUmnni1/4e68OzdPejjZ5q78+jet0emsBhJN69ad/QTgGYRFtXyjO4s8CIaYo
	 84ztD3tnG6Zxlccd0vsBIBJWMxdQmrd5WiwOVsSvsEr8SAX0KHSqMBtOfH8FcPr4/+a8R
	 0il+Vz/BDyx7D5hysQX/9LyoWSSqXSHzzLaYQEJiTs67ZW2XbzBvcOXeS/yIXs6Zh7/TF
	 ic/Fttyc+kxgRDq9QAtyYnvVZYmdyr3F/Wk3SATkd6IAbuiKumznLM+lkz9wjxtlPhkCx
	 9+4ssNOul7xyugpBmqnGtVDrcvmPht6DyHZjpUPii47PPwwNxuNacdgxXNo32J8lj6kgR
	 oroRB2MqtnXFwE+spkBs3CwkVY6azEwGfbLzsGUgVf5XuIpmhy+RCn4IWG8sBVHr9my1Y
	 TOf4eeEr2jrKs6+XApId7Tm7eCnxdnaREUYOu4dD9vwr9uYEClWYXUiZA1T39iU/s/2xI
	 ZD8B4ZJ1y5AMngkH2bXJkQPwl+OXwaOQP1yzEai2EO8SVMUXwzGuWmADAXPZhHE=
ARC-Message-Signature: i=1; d=bugseng.com; s=openarc; a=rsa-sha256;
	c=relaxed/relaxed; t=1752306330;
	h=DKIM-Signature:MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:
	 References:Message-ID:X-Sender:Organization:Content-Type:
	 Content-Transfer-Encoding;
	bh=PEQ/DUErytXNPQVlwfoveY89tXsYd0mzhXxoykrGuNo=;
	b=CD+RRWodEc/0OIJoTpSls+XaeZTqLgbli30ufBzLJP3VrmCNHcJHnmk9PZ1qZcUeirge
	 Xo2KqHuvLMRD4keM592Q5WDKVkFALvBi4Yhv9QLaPHLKVXBH6n1uodMbxwodrGsaoxZKX
	 EfhUm5fhIw6YqGZiOtR45u3a+Bmemg4WGoHBbNVnIjpUM/YmmgECDPN/m8pzzxbyW/HZv
	 Dfvjhxb8qJF/YylQBmxb5Lt20ZYqBFxh22QWYrvN1wvuVvuaSPxDN/FJmGoFR1qgDE/nf
	 EiFzrE7bvrBRQGWh0GHBOhTq8dJmBFiZzPlJaJ/UuuGimgevM5Z//ZnsQHOMChQoDGULT
	 mCSm5/O0qV14zmXnVAGtTnu3At0G1P7XY7M05k7ozWlyuB8cGcJ3BMuoGibjtj3dbXPxl
	 zDlrZziSPKtAr3yQn/XvI6Rt45k6WVeHKsXC4VBV+QzS0aefpk66JKnlHohH9Q4yO5QjR
	 TAOU+H658rwWN3Z+nQHmn/Zg4bxPw4Ujtt81jic3z6ZLpsnWaUNufaeydy+XCPimX98aM
	 R9MPqsa/rceMYSalEvupVzn6nvR8libYBAWl8cDXLHD+5MS+lh+mdrblTGZushSVVNcHR
	 SnI56Ag/qDDZIeMLP1uY0rg2P06MUd2vnMrk1oho8qVoHCsQB5VTCmPBDLIIzVQ=
ARC-Authentication-Results: i=1; bugseng.com; arc=none smtp.remote-ip=162.55.131.47
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bugseng.com; s=mail;
	t=1752306330; bh=n+Ib1FPoHkkVaaAifKxQRTJ1IZ6jxTLEznS3ishOhN4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=nFaY7oEtRinusS9DWzBhXt4xr7KKqeFc4Wn4WsLMaIinn9J8okDrroanKphdArZc7
	 keiStjPgdqvfL5f5wMLWuKhiAN/qpnkh2Sf3absTCGM7dWy2KgB7t7mYOaLv6xR8yP
	 qJN/pbd7sxr6SL3VylXra01UA3Q88ZRRvMgrfwZlQ/24wtKb54LudTPA/T42PmwAi3
	 ai3X9FmrbugcYw2lhbcYD/voCtDF1iyOpWdWKSsVjL8ZF15F/5R4ylc/5GwmSES57p
	 UqL9rbwLMZcLrzTipyFRky/dzKYOYJmzKEvvPhs9NCaEGWsJXT8BpX1UMlW3s1bjik
	 s2ENdrzB9miSA==
MIME-Version: 1.0
Date: Sat, 12 Jul 2025 09:45:30 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Stefano Stabellini <stefano.stabellini@amd.com>
Cc: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>,
 xen-devel@lists.xenproject.org, Doug Goldstein <cardoe@cardoe.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Andrew Cooper
 <andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, Julien
 Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
Subject: Re: [XEN PATCH v2 3/3] eclair: add deviations of MISRA C Rule 5.5
In-Reply-To: <alpine.DEB.2.22.394.2507111712120.605088@ubuntu-linux-20-04-desktop>
References: <cover.1752096263.git.dmytro_prokopchuk1@epam.com>
 <e47d08e4465f913f03348830954e800f420c652d.1752096263.git.dmytro_prokopchuk1@epam.com>
 <b5759332d598ec9b3d7df520735d9dbe@bugseng.com>
 <alpine.DEB.2.22.394.2507111712120.605088@ubuntu-linux-20-04-desktop>
Message-ID: <a8108ecec0451e448645ed0ebc4f1148@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 2025-07-12 03:13, Stefano Stabellini wrote:
> On Fri, 11 Jul 2025, Nicola Vetrini wrote:
>> On 2025-07-09 23:38, Dmytro Prokopchuk1 wrote:
>> > MISRA C Rule 5.5 states that: "Identifiers shall
>> > be distinct from macro names".
>> >
>> > Update ECLAIR configuration to deviate:
>> > - clashes in 'xen/include/xen/bitops.h';
>> > - clashes in 'xen/include/xen/irq.h';
>> > - clashes in 'xen/common/grant_table.c'.
>> >
>> > Signed-off-by: Dmytro Prokopchuk <dmytro_prokopchuk1@epam.com>
>> > ---
>> >  automation/eclair_analysis/ECLAIR/deviations.ecl | 8 ++++++++
>> >  docs/misra/deviations.rst                        | 8 ++++++++
>> >  2 files changed, 16 insertions(+)
>> >
>> > diff --git a/automation/eclair_analysis/ECLAIR/deviations.ecl
>> > b/automation/eclair_analysis/ECLAIR/deviations.ecl
>> > index e8f513fbc5..a5d7b00094 100644
>> > --- a/automation/eclair_analysis/ECLAIR/deviations.ecl
>> > +++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
>> > @@ -117,6 +117,14 @@ it defines would (in the common case) be already
>> > defined. Peer reviewed by the c
>> >  -config=MC3A2.R5.5,reports+={deliberate,
>> > "any_area(decl(kind(function))||any_loc(macro(name(memcpy||memset||memmove))))&&any_area(any_loc(file(^xen/common/libelf/libelf-private\\.h$)))"}
>> >  -doc_end
>> >
>> > +-doc_begin="Clashes between function names and macros are deliberate for
>> > bitops functions, pirq_cleanup_check, update_gnttab_par and
>> > parse_gnttab_limit functions
>> > +and needed to have a function-like macro that acts as a wrapper for the
>> > function to be called. Before calling the function,
>> > +the macro adds additional checks or adjusts the number of parameters
>> > depending on the configuration."
>> > +-config=MC3A2.R5.5,reports+={deliberate,
>> > "any_area(all_loc(file(^xen/include/xen/bitops\\.h$)))"}
>> 
>> Bitops violations are not inside "xen/include/xen/bitops.h", but 
>> rather
>> "xen/arch/x86/include/asm/bitops.h"
>> 
>> > +-config=MC3A2.R5.5,reports+={deliberate,
>> > "any_area(all_loc(file(^xen/include/xen/irq\\.h$))&&context(name(pirq_cleanup_check)&&kind(function)))"}
>> 
>> I would rather do (untested)
>> 
>> -config=MC3A2.R5.5,reports+={deliberate,
>> "all_area(decl(name(pirq_cleanup_check))||macro(name(pirq_cleanup_check)))"}
>> 
>> > +-config=MC3A2.R5.5,reports+={deliberate,
>> > "any_area(all_loc(file(^xen/common/grant_table\\.c$))&&context(name(update_gnttab_par||parse_gnttab_limit)&&kind(function)))"}
>> > +-doc_end
>> > +
>> 
>> same as above
>> 
> 
> Thanks Nicola! The following deviations are enough and sufficient to
> zero violations on both ARM and x86:
> 
> -config=MC3A2.R5.5,reports+={deliberate, 
> "any_area(all_loc(file(^xen/include/xen/bitops\\.h$)))"}
> -config=MC3A2.R5.5,reports+={deliberate, 
> "any_area(all_loc(file(^xen/arch/x86/include/asm/bitops\\.h$)))"}
> -config=MC3A2.R5.5,reports+={deliberate, 
> "any_area(all_loc(file(^.*/compat\\.c$)))"}
> -config=MC3A2.R5.5,reports+={deliberate, 
> "any_area(all_loc(file(^.*/compat/.*$)))"}
> -config=MC3A2.R5.5,reports+={deliberate, 
> "any_area(all_loc(file(^xen/arch/x86/x86_emulate/.*$)))"}
> -config=MC3A2.R5.5,reports+={deliberate, 
> "any_area(all_loc(file(^xen/arch/x86/include/asm/genapic\\.h$)))"}

Thinking a bit more about it, this deviation is perhaps a bit too wide, 
though in this case it's probably fine. Probably what is actually wanted 
is "all_area(all_loc(...))" . This ensures that the decl area and the 
macro area of the report are in the same file, which is almost always 
the case for deliberate shadowing. If that turns out to be too strict, 
then we may do "all_area(any_loc(...))", ensuring that at least there is 
a loc for the macro and decl in that file.

> -config=MC3A2.R5.5,reports+={deliberate, 
> "all_area(decl(name(parse_gnttab_limit))||macro(name(parse_gnttab_limit)))"}
> -config=MC3A2.R5.5,reports+={deliberate, 
> "all_area(decl(name(update_gnttab_par))||macro(name(update_gnttab_par)))"}
> -config=MC3A2.R5.5,reports+={deliberate, 
> "all_area(decl(name(pirq_cleanup_check))||macro(name(pirq_cleanup_check)))"}
> -config=MC3A2.R5.5,reports+={deliberate, 
> "all_area(decl(name(virt_to_maddr))||macro(name(virt_to_maddr)))"}
> -config=MC3A2.R5.5,reports+={deliberate, 
> "all_area(decl(name(set_px_pminfo))||macro(name(set_px_pminfo)))"}
> -config=MC3A2.R5.5,reports+={deliberate, 
> "all_area(decl(name(set_cx_pminfo))||macro(name(set_cx_pminfo)))"}
> -config=MC3A2.R5.5,reports+={deliberate, 
> "all_area(decl(name(cpu_has_amd_erratum))||macro(name(cpu_has_amd_erratum)))"}
> -config=MC3A2.R5.5,reports+={deliberate, 
> "all_area(decl(name(copy_to_guest_ll))||macro(name(copy_to_guest_ll)))"}
> -config=MC3A2.R5.5,reports+={deliberate, 
> "all_area(decl(name(copy_from_guest_ll))||macro(name(copy_from_guest_ll)))"}
> -config=MC3A2.R5.5,reports+={deliberate, 
> "all_area(decl(name(edd_put_string))||macro(name(edd_put_string)))"}
> -config=MC3A2.R5.5,reports+={deliberate, 
> "all_area(decl(name(cpu_has_amd_erratum))||macro(name(cpu_has_amd_erratum)))"}
> -config=MC3A2.R5.5,reports+={deliberate, 
> "all_area(decl(name(page_list_entry))||macro(name(page_list_entry)))"}
> -config=MC3A2.R5.5,reports+={deliberate, 
> "all_area(decl(name(do_physdev_op))||macro(name(do_physdev_op)))"}
> -config=MC3A2.R5.5,reports+={deliberate, 
> "all_area(decl(name(do_platform_op))||macro(name(do_platform_op)))"}
> 
> Jan, are you OK with it?

-- 
Nicola Vetrini, B.Sc.
Software Engineer
BUGSENG (https://bugseng.com)
LinkedIn: https://www.linkedin.com/in/nicola-vetrini-a42471253

