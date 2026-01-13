Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 98969D16EC7
	for <lists+xen-devel@lfdr.de>; Tue, 13 Jan 2026 07:57:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1201142.1516836 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vfYLE-0003p7-7D; Tue, 13 Jan 2026 06:57:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1201142.1516836; Tue, 13 Jan 2026 06:57:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vfYLE-0003nf-4F; Tue, 13 Jan 2026 06:57:24 +0000
Received: by outflank-mailman (input) for mailman id 1201142;
 Tue, 13 Jan 2026 06:57:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9S4V=7S=kernel.org=wei.liu@srs-se1.protection.inumbo.net>)
 id 1vfYLC-00035y-9k
 for xen-devel@lists.xenproject.org; Tue, 13 Jan 2026 06:57:22 +0000
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1b07e99d-f04d-11f0-b15e-2bf370ae4941;
 Tue, 13 Jan 2026 07:57:21 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 46CF46001D;
 Tue, 13 Jan 2026 06:57:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5D12C116C6;
 Tue, 13 Jan 2026 06:57:19 +0000 (UTC)
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
X-Inumbo-ID: 1b07e99d-f04d-11f0-b15e-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768287440;
	bh=60SPyWB8vDd2rUgvHslTdiPd0EofSPJHlT4QUyPma6A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=R1NApMXhnqwRdTk2bbAImX9NrjtIDbtzQx9IWe8no+TStcOX4nHWBNhBtEh+GTKfh
	 5D2bVETHk3k4qJ3TfhxNbgsDzI/0L7N9K5AjJ5ICcWGg61rv3Y+R7jL66oh0Suq20c
	 8ibdQVDTHWMXjBYyAHqG+dWbXUn3ynN5ePye7vIIG+VWbvicoe4q/j99LOhZgBjKP2
	 urczlgGE8vb5kkt9cvhYHL4DJkbBf/GmURlHuhpD78NJaytElj/4UwAT5yTfTkSnZY
	 EQclNoU14InQbSaOyIdaYIGps5fgK3GMHmyi1TJsMHNXkh66lxmk3y2lLgljPPwTfN
	 Lb2RJ8DPFS6dg==
Date: Tue, 13 Jan 2026 06:57:18 +0000
From: Wei Liu <wei.liu@kernel.org>
To: Juergen Gross <jgross@suse.com>
Cc: linux-kernel@vger.kernel.org, x86@kernel.org,
	linux-hyperv@vger.kernel.org, virtualization@lists.linux.dev,
	kvm@vger.kernel.org, "K. Y. Srinivasan" <kys@microsoft.com>,
	Haiyang Zhang <haiyangz@microsoft.com>,
	Wei Liu <wei.liu@kernel.org>, Dexuan Cui <decui@microsoft.com>,
	Long Li <longli@microsoft.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Ajay Kaher <ajay.kaher@broadcom.com>,
	Alexey Makhalov <alexey.makhalov@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Vitaly Kuznetsov <vkuznets@redhat.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v5 21/21] x86/pvlocks: Move paravirt spinlock functions
 into own header
Message-ID: <20260113065718.GD3099059@liuwe-devbox-debian-v2.local>
References: <20260105110520.21356-1-jgross@suse.com>
 <20260105110520.21356-22-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260105110520.21356-22-jgross@suse.com>

On Mon, Jan 05, 2026 at 12:05:20PM +0100, Juergen Gross wrote:
> Instead of having the pv spinlock function definitions in paravirt.h,
> move them into the new header paravirt-spinlock.h.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>
> ---
> V2:
> - use new header instead of qspinlock.h
> - use dedicated pv_ops_lock array
> - move more paravirt related lock code
> V3:
> - hide native_pv_lock_init() with CONFIG_SMP (kernel test robot)
> V4:
> - don't reference pv_ops_lock without CONFIG_PARAVIRT_SPINLOCKS
>   (kernel test robot)
> V5:
> - move paravirt_set_cap() declaration into paravirt-base.h
>   (kernel test robot)
> ---
>  arch/x86/hyperv/hv_spinlock.c            |  10 +-

Acked-by: Wei Liu (Microsoft) <wei.liu@kernel.org

