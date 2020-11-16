Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 128852B4A8F
	for <lists+xen-devel@lfdr.de>; Mon, 16 Nov 2020 17:17:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.28525.57617 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kehCO-000154-5k; Mon, 16 Nov 2020 16:17:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 28525.57617; Mon, 16 Nov 2020 16:17:48 +0000
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
	id 1kehCO-00014f-2X; Mon, 16 Nov 2020 16:17:48 +0000
Received: by outflank-mailman (input) for mailman id 28525;
 Mon, 16 Nov 2020 16:17:46 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ru3m=EW=kernel.org=luto@srs-us1.protection.inumbo.net>)
 id 1kehCM-00014Z-Bc
 for xen-devel@lists.xenproject.org; Mon, 16 Nov 2020 16:17:46 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d5f983a5-c388-483e-a422-d3e33c5d7d88;
 Mon, 16 Nov 2020 16:17:45 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C98272227F
 for <xen-devel@lists.xenproject.org>; Mon, 16 Nov 2020 16:17:44 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id h2so24277131wmm.0
 for <xen-devel@lists.xenproject.org>; Mon, 16 Nov 2020 08:17:44 -0800 (PST)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=ru3m=EW=kernel.org=luto@srs-us1.protection.inumbo.net>)
	id 1kehCM-00014Z-Bc
	for xen-devel@lists.xenproject.org; Mon, 16 Nov 2020 16:17:46 +0000
X-Inumbo-ID: d5f983a5-c388-483e-a422-d3e33c5d7d88
Received: from mail.kernel.org (unknown [198.145.29.99])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id d5f983a5-c388-483e-a422-d3e33c5d7d88;
	Mon, 16 Nov 2020 16:17:45 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id C98272227F
	for <xen-devel@lists.xenproject.org>; Mon, 16 Nov 2020 16:17:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1605543465;
	bh=Mv6f7f8506FraoMumz35j4BQyYx1tMmBjlS7DZTMh6s=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=cO0fEGISnNA7PcgOiATiolTw7tAkS5Zg7T/iuml160lD72+D/c5QQCC6g99NPdiv0
	 E+tm/P0YcyWfeksg5V68oPeJbMzzoFz8MOlckQYOvSLN5cL4nnxznKQsmlZxwvR3+9
	 21xAGXQROAjxwTtWdTl8e7cPOi/ciZNc1Yiis33Q=
Received: by mail-wm1-f43.google.com with SMTP id h2so24277131wmm.0
        for <xen-devel@lists.xenproject.org>; Mon, 16 Nov 2020 08:17:44 -0800 (PST)
X-Gm-Message-State: AOAM531cG51DPaDMkOWymUfDE59ZBvhBtOWpGYSP45gMrb++uh+E8yN4
	fueHHvWbY7M8XqxcTpZ2dm8Jzsk20GQtMRD/OqRC0A==
X-Google-Smtp-Source: ABdhPJzo4DLkbb/iKsJTRaDIKTsVLyxyBBgQcLU+k85si7bdNAKlaxr9HCjPF0P3RxTG5pvYnF7uVMxefE2gleeWFnw=
X-Received: by 2002:a1c:7213:: with SMTP id n19mr15820304wmc.36.1605543463407;
 Mon, 16 Nov 2020 08:17:43 -0800 (PST)
MIME-Version: 1.0
References: <20201116152301.24558-1-jgross@suse.com> <20201116152301.24558-4-jgross@suse.com>
In-Reply-To: <20201116152301.24558-4-jgross@suse.com>
From: Andy Lutomirski <luto@kernel.org>
Date: Mon, 16 Nov 2020 08:17:29 -0800
X-Gmail-Original-Message-ID: <CALCETrWwnK1AwrGRn8Kuin-23NOG31LrWBO7w=T2QE+EJW=f-w@mail.gmail.com>
Message-ID: <CALCETrWwnK1AwrGRn8Kuin-23NOG31LrWBO7w=T2QE+EJW=f-w@mail.gmail.com>
Subject: Re: [PATCH 3/4] x86/pv: switch SWAPGS to ALTERNATIVE
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, X86 ML <x86@kernel.org>, 
	LKML <linux-kernel@vger.kernel.org>, 
	Linux Virtualization <virtualization@lists.linux-foundation.org>, 
	Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>, Deep Shah <sdeep@vmware.com>, 
	"VMware, Inc." <pv-drivers@vmware.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, 
	Stefano Stabellini <sstabellini@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, Nov 16, 2020 at 7:23 AM Juergen Gross <jgross@suse.com> wrote:
>
> SWAPGS is used only for interrupts coming from user mode or for
> returning to user mode. So there is no reason to use the PARAVIRT
> framework, as it can easily be replaced by an ALTERNATIVE depending
> on X86_FEATURE_XENPV.
>
> There are several instances using the PV-aware SWAPGS macro in paths
> which are never executed in a Xen PV guest. Replace those with the
> plain swapgs instruction. For SWAPGS_UNSAFE_STACK the same applies.

Acked-by: Andy Lutomirski <luto@kernel.org>

