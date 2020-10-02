Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CF182816D7
	for <lists+xen-devel@lfdr.de>; Fri,  2 Oct 2020 17:40:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.2227.6580 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kON9u-00067k-9i; Fri, 02 Oct 2020 15:39:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 2227.6580; Fri, 02 Oct 2020 15:39:46 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kON9u-00067L-5n; Fri, 02 Oct 2020 15:39:46 +0000
Received: by outflank-mailman (input) for mailman id 2227;
 Fri, 02 Oct 2020 15:39:45 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5pZ8=DJ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kON9s-00067G-VS
 for xen-devel@lists.xenproject.org; Fri, 02 Oct 2020 15:39:45 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 190bc2d8-a250-4476-a866-8a26bb7cff8e;
 Fri, 02 Oct 2020 15:39:43 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 86C5AB240;
 Fri,  2 Oct 2020 15:39:42 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=5pZ8=DJ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kON9s-00067G-VS
	for xen-devel@lists.xenproject.org; Fri, 02 Oct 2020 15:39:45 +0000
X-Inumbo-ID: 190bc2d8-a250-4476-a866-8a26bb7cff8e
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 190bc2d8-a250-4476-a866-8a26bb7cff8e;
	Fri, 02 Oct 2020 15:39:43 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1601653182;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qrfGihDGcHqZgbuB5NmYzKqBrdZfeb7UvtkAF/YVzOc=;
	b=szWhYp29GskhiIwbTY+qk43k+yl4yZtGm+HLtbWoN2VlO9lS/iutCE21G3ImAUEz3ilCOu
	GZZMAw+Y2DvFJM/m8D/IhX5zbSgjz3bzD3l/0bRVicgUkQgs2bAKf0KJoQBlb3f7VgePVj
	00EN5jzmQZj3TYqJI2LMnudYnAAg6zA=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 86C5AB240;
	Fri,  2 Oct 2020 15:39:42 +0000 (UTC)
Subject: Re: Yet another S3 issue in Xen 4.14
To: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>
References: <20201001011245.GL3962@mail-itl>
 <a80ad59b-feb1-01c8-2b14-dbf6568d0ff5@suse.com>
 <20201001123129.GJ1482@mail-itl>
 <1e596ccc-a875-93f1-2619-e4dbcbd88b4d@citrix.com>
 <20201002150859.GM3962@mail-itl>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <454ac9ce-012f-f2e7-722d-c5304fd3146f@suse.com>
Date: Fri, 2 Oct 2020 17:39:43 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201002150859.GM3962@mail-itl>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 02.10.2020 17:08, Marek Marczykowski-Górecki wrote:
> I've done another bisect on the commit broken up in separate changes
> (https://xenbits.xen.org/gitweb/?p=people/andrewcoop/xen.git;a=shortlog;h=refs/heads/dbg-s3)
> and the bad part seems to be this:
> 
> From dbdb32f8c265295d6af7cd4cd0aa12b6d04a0430 Mon Sep 17 00:00:00 2001
> From: Andrew Cooper <andrew.cooper3@citrix.com>
> Date: Fri, 2 Oct 2020 15:40:22 +0100
> Subject: [PATCH 1/1] CR4

Interesting - I was wild guessing so yesterday, but couldn't come
up with even a vague reason why this would be. I think you could
further split it up:

> --- a/xen/arch/x86/acpi/power.c
> +++ b/xen/arch/x86/acpi/power.c
> @@ -195,7 +195,6 @@ static int enter_state(u32 state)
>      unsigned long flags;
>      int error;
>      struct cpu_info *ci;
> -    unsigned long cr4;
>  
>      if ( (state <= ACPI_STATE_S0) || (state > ACPI_S_STATES_MAX) )
>          return -EINVAL;
> @@ -270,15 +269,15 @@ static int enter_state(u32 state)
>  
>      system_state = SYS_STATE_resume;
>  
> -    /* Restore CR4 and EFER from cached values. */
> -    cr4 = read_cr4();
> -    write_cr4(cr4 & ~X86_CR4_MCE);
> +    /* Restore EFER from cached value. */
>      write_efer(read_efer());

This one should be possible to leave in place despite ...

>      device_power_up(SAVED_ALL);
>  
>      mcheck_init(&boot_cpu_data, false);
> -    write_cr4(cr4);
> +
> +    /* Restore CR4 from cached value, now MCE is set up. */
> +    write_cr4(read_cr4());

... this change.

Further, while I can't see how the set_in_cr4() in mcheck_init()
could badly interact with the CR4 writes here, another option
might be to suppress it when system_state == SYS_STATE_resume
&& c == &boot_cpu_data (or !bsp && c == &boot_cpu_data).

> --- a/xen/arch/x86/acpi/suspend.c
> +++ b/xen/arch/x86/acpi/suspend.c
> @@ -23,7 +23,4 @@ void save_rest_processor_state(void)
>  void restore_rest_processor_state(void)
>  {
>      load_system_tables();
> -
> -    /* Restore full CR4 (inc MCE) now that the IDT is in place. */
> -    write_cr4(mmu_cr4_features);
>  }

This one should be possible to leave in place despite the other
changes.

Jan

