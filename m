Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C3CF1A67ED
	for <lists+xen-devel@lfdr.de>; Mon, 13 Apr 2020 16:21:57 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jNzxO-0002P1-Lj; Mon, 13 Apr 2020 14:21:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=geSq=55=alien8.de=bp@srs-us1.protection.inumbo.net>)
 id 1jNzxM-0002Ow-Gk
 for xen-devel@lists.xenproject.org; Mon, 13 Apr 2020 14:21:00 +0000
X-Inumbo-ID: fe7511c0-7d91-11ea-9e09-bc764e2007e4
Received: from mail.skyhub.de (unknown [5.9.137.197])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fe7511c0-7d91-11ea-9e09-bc764e2007e4;
 Mon, 13 Apr 2020 14:20:58 +0000 (UTC)
Received: from zn.tnic (p200300EC2F06C900CDC4EA77E1BD02DC.dip0.t-ipconnect.de
 [IPv6:2003:ec:2f06:c900:cdc4:ea77:e1bd:2dc])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 2BCCC1EC05D6;
 Mon, 13 Apr 2020 16:20:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
 t=1586787657;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EvqjNnYQ7o0idjKHDUx8jEi5/BB6c/YUkQH5OCgKrQg=;
 b=UA4vS/uvqDIJ6vpmf30WbVO8rgXk8eXQu4ujQ2VCo1rCrpDDYBVSLLoi3ez1bRyVdLPfL7
 u57Ej8KqhFZa3VC0EB2VAXawNjozEJL1QQ6eNfjRk9inXTO6vd+45v71N3nX0AtFybp5lR
 6WHStVd7PcMDbDV0AfyR/x6sMOIehpk=
Date: Mon, 13 Apr 2020 16:20:51 +0200
From: Borislav Petkov <bp@alien8.de>
To: =?utf-8?Q?Fr=C3=A9d=C3=A9ric_Pierret_=28fepitre=29?=
 <frederic.pierret@qubes-os.org>
Subject: Re: [PATCH] xen x86: fix early boot crash with gcc-10
Message-ID: <20200413142051.GC3772@zn.tnic>
References: <20200413123535.10884-1-frederic.pierret@qubes-os.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200413123535.10884-1-frederic.pierret@qubes-os.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: jgross@suse.com, sstabellini@kernel.org, x86@kernel.org,
 linux-kernel@vger.kernel.org, mingo@redhat.com, hpa@zytor.com,
 xen-devel@lists.xenproject.org, boris.ostrovsky@oracle.com, tglx@linutronix.de
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Mon, Apr 13, 2020 at 02:35:35PM +0200, Frédéric Pierret (fepitre) wrote:
> The change fixes boot failure on VM where kernel (at least v5.4 and v5.6)
> is built with gcc-10 and STACKPROTECTOR_STRONG enabled:
> 
> ```
> Kernel panic - not syncing: stack-protector: Kernel stack is corrupted in: cpu_bringup_and_idle+0x93/0xa0
> CPU: 1 PID: 0 Comm: swapper/1 Not tainted 5.4.31-1.qubes.x86_64 #1
> Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.12.0-1 04/01/2014
> Call Trace:
>   dump_stack+0x64/0x88
>    panic+0x10b/0x2ed
>    ? cpu_bringup_and_idle+0x93/0xa0
>    __stack_chk_fail+0x15/0x20
>    cpu_bringup_and_idle+0x93/0xa
> ```
> The change makes successfully booting the VM. The VM is hosted by
> KVM hypervisor and is running Xen into.
> 
> Based on work done by Sergei Trofimovich: https://lkml.org/lkml/2020/3/26/1133

I was waiting for the merge window to finish to queue his patch. That is
done now, you can rebase yours ontop.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette

