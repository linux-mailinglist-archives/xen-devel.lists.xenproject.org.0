Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 536D3A6DBC2
	for <lists+xen-devel@lfdr.de>; Mon, 24 Mar 2025 14:39:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.925531.1328398 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1twi10-0000vN-0o; Mon, 24 Mar 2025 13:38:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 925531.1328398; Mon, 24 Mar 2025 13:38:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1twi0z-0000se-TL; Mon, 24 Mar 2025 13:38:53 +0000
Received: by outflank-mailman (input) for mailman id 925531;
 Mon, 24 Mar 2025 13:38:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=R/zo=WL=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1twi0y-0000KT-3s
 for xen-devel@lists.xenproject.org; Mon, 24 Mar 2025 13:38:52 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 522a7f9c-08b5-11f0-9ea2-5ba50f476ded;
 Mon, 24 Mar 2025 14:38:51 +0100 (CET)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 (Authenticated sender: nicola)
 by support.bugseng.com (Postfix) with ESMTPA id 3ED244EF5CF4;
 Mon, 24 Mar 2025 14:38:50 +0100 (CET)
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
X-Inumbo-ID: 522a7f9c-08b5-11f0-9ea2-5ba50f476ded
Authentication-Results: bugseng.com; arc=none smtp.remote-ip=162.55.131.47
ARC-Seal: i=1; d=bugseng.com; s=openarc; a=rsa-sha256; cv=none; t=1742823530;
	b=J+8s0KGKMzoLwGIRx1bf4t/QuiWX01e5HRlHwIbAlJF6APGtgicpZiFq7ATE1zHi1EbJ
	 Lgr41xkQ/LQ3MWT4Oc+uqX+aMOCXsXIqeGt19P5D1XOAqDzotekgz5vJ73q5Egvhk34Hg
	 QclhVldc0QLS0Ml0XOTMnyAHtg7d3WkMl12uN/c4nwketYYlqrItQIHhb/MNqG49Wnz42
	 4r3h3Lalwt5QS4hdpuFmqp096RJHTaDYFoqCYhGprJMS+/VKVjB3a8bU35t1MVHcnrj5w
	 Jnz9AvK1zePwEXuA28tu0098k7zXcMCiqAk+izpLrJgtWbyrZ+P4tgWyzT6Bz6zPclQGb
	 OxwOvV+I4MZGzCiY87gZLTe4UF7DBPFZGM+A/rkjuTbzHqzgVFUUHrlzTbNinK1cTzhpn
	 3Ca7rruYoDeSJaCXRfRJFbPB4ybqyWjpw5cWxhlDXcBVFUf4C+GN+nHZUWdI5GBxjcmKF
	 7vp1AvPVmpS0LAOK/B5g0rYG5dUuUNXfFosdM92Jp63N8ajHzCwbNcbN5vWk6ar6au/ci
	 NgrKgRYB/l7sfJfzJpMMtVGF9To4SYetDLdSiog5/ZrXo1fu9XGXlnMaa5v+C3hDAB25A
	 zTvYR3DYSkUZ73qZtcoVxBeByT5tI1662U9AdGlEemWoJxKPS1heWRMksfN50UE=
ARC-Message-Signature: i=1; d=bugseng.com; s=openarc; a=rsa-sha256;
	c=relaxed/relaxed; t=1742823530;
	h=DKIM-Signature:MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:
	 References:Message-ID:X-Sender:Organization:Content-Type:
	 Content-Transfer-Encoding;
	bh=fg4AdSp/4w4ePwGukNfy4BDqKs2+tU4sYzE8mqw+324=;
	b=ZIj4/E8hQwFKQUXMqJ7GP7f9P0yjvm/DyBvKVHiWxPQ77E/xxletkbZ4SiEEdiIXpa8V
	 TBNNQs/Z2awcSyVvtStRv3ghf8dtFPRIN4iJ1bLuGouONix1/wHFJUK5ZAEACIforBaMp
	 MFJEiY9ZmZ4Nyn7OW/AYxYWjQpyYyWbLdio59SQ18J8om8Q2KPWTA12p1hNtQZ8BK30pd
	 /BxitcXAZ6tWTD61PNWnaox5jpwCjp6+CVhA7pk178PL0bGO0zj5VZlR2cIoGLhWKtZml
	 9CPcGI6187xLFkhQhQHlwoIHWG+svfDzlkxUou83+rpGMIIB2bcDt9McuoP/KNgXkka5A
	 XRcxChxaz7ImYbQ/rRvN5wjVvaefIpen3sPkZh3kk6EvMikHP4F2beUsiJQqSLdlZJJdR
	 UkaeKJKRnX/y4WiNLKnjLM3vtK9xMZcEdQqiroImU4IyMXhAXTrJsLuFMX2AxQRMma1Cp
	 cs/nc8TtgLkxZiLiwKXpG3lnzlxbMOescVuFLd2G96IUpMFZB/SaJcxEx7OQYPUkIIoXe
	 IBWvv2szCMqszp7xdNHYSGsIADyPx0gqeolL6fMW4l/DpElTBia4c7T1GGo+EeDiUChuR
	 VqvVeYThvuCeRWEV1CV7HmFfx57Ri8SDpkOQepHROSufKp1ZDMCysdBr2dBKYyI=
ARC-Authentication-Results: i=1; bugseng.com; arc=none smtp.remote-ip=162.55.131.47
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bugseng.com; s=mail;
	t=1742823530; bh=EbThDq6ZA63KLKd23KuwjaDqoXdROo2VWFj8zyzRKxU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Y3d/6y06X9K8NeedmHGfHeJOxYEdtJFouDnI0KwIBFSiLNg3W0RM4U5FEBaEZw2Rd
	 ZHEBzrvUqcAt7UqhgnA1YEdqo9sOvUHlHEcRVj1agucqX4AByDjL9h/7xu0CeS/vuP
	 h07oR+oTKPcql1f/WpYO0GagL/rsw3ComIliIyqocTWH+Lu5BcoUaXJltFA1jkr6Dg
	 cvtdiSiWaNq897+qjEUdR2psuUCK5H/12O5xDzIxLHr5+hPEvv2yyW3Qzho7JZyWx3
	 LZXdYqqcM0eNr0juQLqV/fElrJDjBvX8Hnjqq8o/fm1WIpPUTlvh99WQqrijfDCBGO
	 USBz28F8+teyg==
MIME-Version: 1.0
Date: Mon, 24 Mar 2025 14:38:50 +0100
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Jan Beulich <jbeulich@suse.com>, Volodymyr Babchuk
 <Volodymyr_Babchuk@epam.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Andrew Cooper
 <andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
Subject: Re: [PATCH v7 1/3] xen: common: add ability to enable stack protector
In-Reply-To: <a4231eb6-b195-4ce0-b9ca-bdf928a21fbd@suse.com>
References: <20250318023234.1210659-1-volodymyr_babchuk@epam.com>
 <20250318023234.1210659-2-volodymyr_babchuk@epam.com>
 <a4231eb6-b195-4ce0-b9ca-bdf928a21fbd@suse.com>
Message-ID: <f2c3de2c6fff3f9d7e5186c06cd4f31a@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 2025-03-24 13:50, Jan Beulich wrote:
> On 18.03.2025 03:34, Volodymyr Babchuk wrote:
>> Both GCC and Clang support -fstack-protector feature, which add stack
>> canaries to functions where stack corruption is possible. This patch
>> makes general preparations to enable this feature on different
>> supported architectures:
>> 
>>  - Added CONFIG_HAS_STACK_PROTECTOR option so each architecture
>>    can enable this feature individually
>>  - Added user-selectable CONFIG_STACK_PROTECTOR option
>>  - Implemented code that sets up random stack canary and a basic
>>    handler for stack protector failures
>> 
>> Stack guard value is initialized in two phases:
>> 
>> 1. Pre-defined randomly-selected value.
>> 
>> 2. Own implementation linear congruent random number generator. It
>> relies on get_cycles() being available very early. If get_cycles()
>> returns zero, it would leave pre-defined value from the previous
>> step.

[...]

>> +void asmlinkage __stack_chk_fail(void)
> 
> The use of asmlinkage here comes close to an abuse: The Misra deviation 
> is
> about C code called from assembly code only. This isn't the case here; 
> instead
> it's a function that the compiler generates calls to without source 
> code
> explicitly saying so.
> 
> This imo wants approving from the Misra side as well, and even if 
> approved
> likely requires a justifying code comment.
> 

Here my suggestion would be an explicit deviation via a code comment, as 
described in [1], to describe the motivation of introducing such 
definition without a declaration. Moreover, asmlinkage is only relevant 
for the missing declaration, but is not effective for other rules. It is 
probably appropriate to mark the function "noreturn" as well, given its 
purpose.

[1] 
https://gitlab.com/xen-project/xen/-/blob/staging/docs/misra/documenting-violations.rst

>> --- /dev/null
>> +++ b/xen/include/xen/stack-protector.h
>> @@ -0,0 +1,39 @@
>> +#ifndef __XEN_STACK_PROTECTOR_H__
>> +#define __XEN_STACK_PROTECTOR_H__
>> +
>> +extern unsigned long __stack_chk_guard;
>> +
>> +/*
>> + * This function should be called from a C function that escapes 
>> stack
>> + * canary tracking (by calling reset_stack_and_jump() for example).
>> + */
>> +static always_inline void boot_stack_chk_guard_setup(void)
>> +{
>> +#ifdef CONFIG_STACK_PROTECTOR
>> +
>> +	/*
> 
> Nit: Hard tab slipped in.
> 
> Jan

-- 
Nicola Vetrini, B.Sc.
Software Engineer
BUGSENG (https://bugseng.com)
LinkedIn: https://www.linkedin.com/in/nicola-vetrini-a42471253

