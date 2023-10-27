Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C8737DA12E
	for <lists+xen-devel@lfdr.de>; Fri, 27 Oct 2023 21:15:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.624623.973211 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qwSI7-0001Mb-OW; Fri, 27 Oct 2023 19:14:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 624623.973211; Fri, 27 Oct 2023 19:14:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qwSI7-0001JW-Ks; Fri, 27 Oct 2023 19:14:43 +0000
Received: by outflank-mailman (input) for mailman id 624623;
 Fri, 27 Oct 2023 19:14:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wQui=GJ=infradead.org=peterz@srs-se1.protection.inumbo.net>)
 id 1qwSI5-0001JQ-Lp
 for xen-devel@lists.xenproject.org; Fri, 27 Oct 2023 19:14:42 +0000
Received: from casper.infradead.org (casper.infradead.org
 [2001:8b0:10b:1236::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 131a7e4a-74fd-11ee-9b0e-b553b5be7939;
 Fri, 27 Oct 2023 21:14:39 +0200 (CEST)
Received: from j130084.upc-j.chello.nl ([24.132.130.84]
 helo=noisy.programming.kicks-ass.net)
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1qwSHz-0056Vr-SO; Fri, 27 Oct 2023 19:14:35 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
 id 84DA4300392; Fri, 27 Oct 2023 21:14:35 +0200 (CEST)
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
X-Inumbo-ID: 131a7e4a-74fd-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=s5bWgVKpwmS1KllHLKJH6MgftoWkWiVLZ4YJm3tjFD4=; b=Lm/WGIyRJjJfRsdY53T4rtZXPq
	WgEnLip1WsWSzW7hPSzoqL3CkCULHfUqtiixPcHU4/Sxv9t6be3iGrvGzZew4mdXYdxefVxVgfguG
	1Wc4tIvraqp9VyCAIXs6nZAihLnhEB4BS9+nZgnlNTHc8WRZSWBsPM3vGdiW+KDbyEOJF67JqVEED
	NClrnbYbx/v6G6CiuRkqAqqgHY2C7GJrPGWmPprcbX4CSTgFj2Xkc9tmaQT0DooiOlfp8xPfSC/hs
	nVBRqo+VDeyPMdkfUHOZ0Gg7l3L1PU7qIhMr404RXKYYXSOFWmEhDYADds/a+zdkJq1RZQQsM/Gy9
	qceYikrQ==;
Date: Fri, 27 Oct 2023 21:14:35 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: David Woodhouse <dwmw2@infradead.org>
Cc: linux-acpi <linux-acpi@vger.kernel.org>,
	linux-kernel <linux-kernel@vger.kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>, Juergen Gross <jgross@suse.com>,
	xen-devel <xen-devel@lists.xenproject.org>,
	Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>,
	Waiman Long <longman@redhat.com>, Boqun Feng <boqun.feng@gmail.com>
Subject: Re: [PATCH] acpi_idle: use raw_safe_halt() from acpi_idle_play_dead()
Message-ID: <20231027191435.GF26550@noisy.programming.kicks-ass.net>
References: <a079bba5a0e47d6534b307553fc3772d26ce911b.camel@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <a079bba5a0e47d6534b307553fc3772d26ce911b.camel@infradead.org>

On Fri, Oct 27, 2023 at 07:36:51PM +0100, David Woodhouse wrote:
> From: David Woodhouse <dwmw@amazon.co.uk>
>=20
> Xen HVM guests were observed taking triple-faults when attempting to
> online a previously offlined vCPU.
>=20
> Investigation showed that the fault was coming from a failing call
> to lockdep_assert_irqs_disabled(), in load_current_idt() which was
> too early in the CPU bringup to actually catch the exception and
> report the failure cleanly.
>=20
> This was a false positive, caused by acpi_idle_play_dead() setting
> the per-cpu hardirqs_enabled flag by calling safe_halt(). Switch it
> to use raw_safe_halt() instead, which doesn't do so.
>=20
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> ---
> We might {also,instead} explicitly set the hardirqs_enabled flag to
> zero when bringing up an AP?

So I fixed up the idle paths the other day (see all that __cpuidle
stuff) but I've not yet gone through the whole hotplug thing :/

This seems right, at this point everything, including RCU is very much
gone, any instrumentation is undesired.

Acked-by: Peter Zijlstra (Intel) <peterz@infradead.org>

>=20
>  drivers/acpi/processor_idle.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/acpi/processor_idle.c b/drivers/acpi/processor_idle.c
> index 3a34a8c425fe..55437f5e0c3a 100644
> --- a/drivers/acpi/processor_idle.c
> +++ b/drivers/acpi/processor_idle.c
> @@ -592,7 +592,7 @@ static int acpi_idle_play_dead(struct cpuidle_device =
*dev, int index)
>  	while (1) {
> =20
>  		if (cx->entry_method =3D=3D ACPI_CSTATE_HALT)
> -			safe_halt();
> +			raw_safe_halt();
>  		else if (cx->entry_method =3D=3D ACPI_CSTATE_SYSTEMIO) {
>  			io_idle(cx->address);
>  		} else
> --=20
> 2.41.0
>=20
>=20



