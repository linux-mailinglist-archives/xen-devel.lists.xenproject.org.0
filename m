Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C65228CFF0
	for <lists+xen-devel@lfdr.de>; Tue, 13 Oct 2020 16:13:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.6245.16621 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kSL2l-0000S2-LH; Tue, 13 Oct 2020 14:12:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 6245.16621; Tue, 13 Oct 2020 14:12:47 +0000
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
	id 1kSL2l-0000Rd-IL; Tue, 13 Oct 2020 14:12:47 +0000
Received: by outflank-mailman (input) for mailman id 6245;
 Tue, 13 Oct 2020 14:12:45 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lZE5=DU=suse.de=cfontana@srs-us1.protection.inumbo.net>)
 id 1kSL2j-0000RY-RV
 for xen-devel@lists.xenproject.org; Tue, 13 Oct 2020 14:12:45 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7b302022-2406-4a8d-aa34-70d0e029c67c;
 Tue, 13 Oct 2020 14:12:44 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id E2BA7ABCC;
 Tue, 13 Oct 2020 14:12:43 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=lZE5=DU=suse.de=cfontana@srs-us1.protection.inumbo.net>)
	id 1kSL2j-0000RY-RV
	for xen-devel@lists.xenproject.org; Tue, 13 Oct 2020 14:12:45 +0000
X-Inumbo-ID: 7b302022-2406-4a8d-aa34-70d0e029c67c
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 7b302022-2406-4a8d-aa34-70d0e029c67c;
	Tue, 13 Oct 2020 14:12:44 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id E2BA7ABCC;
	Tue, 13 Oct 2020 14:12:43 +0000 (UTC)
Subject: Re: [PATCH v2 3/3] accel: Add xen CpusAccel using dummy-cpus
To: Jason Andryuk <jandryuk@gmail.com>, qemu-devel@nongnu.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>,
 "open list:X86 Xen CPUs" <xen-devel@lists.xenproject.org>
References: <20201013140511.5681-1-jandryuk@gmail.com>
 <20201013140511.5681-4-jandryuk@gmail.com>
From: Claudio Fontana <cfontana@suse.de>
Message-ID: <803af254-a005-1a50-ddad-7116ef261a8a@suse.de>
Date: Tue, 13 Oct 2020 16:12:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201013140511.5681-4-jandryuk@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 10/13/20 4:05 PM, Jason Andryuk wrote:
> Xen was broken by commit 1583a3898853 ("cpus: extract out qtest-specific
> code to accel/qtest").  Xen relied on qemu_init_vcpu() calling
> qemu_dummy_start_vcpu() in the default case, but that was replaced by
> g_assert_not_reached().
> 
> Add a minimal "CpusAccel" for Xen using the dummy-cpus implementation
> used by qtest.
> 
> Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
> ---
>  accel/meson.build   | 1 +
>  accel/xen/xen-all.c | 8 ++++++++
>  2 files changed, 9 insertions(+)
> 
> diff --git a/accel/meson.build b/accel/meson.build
> index 9a417396bd..b26cca227a 100644
> --- a/accel/meson.build
> +++ b/accel/meson.build
> @@ -12,3 +12,4 @@ dummy_ss.add(files(
>  ))
>  
>  specific_ss.add_all(when: ['CONFIG_SOFTMMU', 'CONFIG_POSIX'], if_true: dummy_ss)
> +specific_ss.add_all(when: ['CONFIG_XEN'], if_true: dummy_ss)
> diff --git a/accel/xen/xen-all.c b/accel/xen/xen-all.c
> index 60b971d0a8..878a4089d9 100644
> --- a/accel/xen/xen-all.c
> +++ b/accel/xen/xen-all.c
> @@ -16,6 +16,7 @@
>  #include "hw/xen/xen_pt.h"
>  #include "chardev/char.h"
>  #include "sysemu/accel.h"
> +#include "sysemu/cpus.h"
>  #include "sysemu/xen.h"
>  #include "sysemu/runstate.h"
>  #include "migration/misc.h"
> @@ -153,6 +154,10 @@ static void xen_setup_post(MachineState *ms, AccelState *accel)
>      }
>  }
>  
> +const CpusAccel xen_cpus = {
> +    .create_vcpu_thread = dummy_start_vcpu_thread,
> +};
> +
>  static int xen_init(MachineState *ms)
>  {
>      MachineClass *mc = MACHINE_GET_CLASS(ms);
> @@ -180,6 +185,9 @@ static int xen_init(MachineState *ms)
>       * opt out of system RAM being allocated by generic code
>       */
>      mc->default_ram_id = NULL;
> +
> +    cpus_register_accel(&xen_cpus);
> +
>      return 0;
>  }
>  
> 
Reviewed-by: Claudio Fontana <cfontana@suse.de>

