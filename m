Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 600BD5EC0F2
	for <lists+xen-devel@lfdr.de>; Tue, 27 Sep 2022 13:20:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.412528.655895 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1od8ct-0002lP-Aj; Tue, 27 Sep 2022 11:19:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 412528.655895; Tue, 27 Sep 2022 11:19:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1od8ct-0002hy-7p; Tue, 27 Sep 2022 11:19:47 +0000
Received: by outflank-mailman (input) for mailman id 412528;
 Tue, 27 Sep 2022 11:19:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=IkIR=Z6=alien8.de=bp@srs-se1.protection.inumbo.net>)
 id 1od8cr-0002hs-OX
 for xen-devel@lists.xenproject.org; Tue, 27 Sep 2022 11:19:45 +0000
Received: from mail.skyhub.de (mail.skyhub.de [5.9.137.197])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 49732cfc-3e56-11ed-9648-05401a9f4f97;
 Tue, 27 Sep 2022 13:19:44 +0200 (CEST)
Received: from zn.tnic (p200300ea9733e757329c23fffea6a903.dip0.t-ipconnect.de
 [IPv6:2003:ea:9733:e757:329c:23ff:fea6:a903])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id B70F61EC058B;
 Tue, 27 Sep 2022 13:19:39 +0200 (CEST)
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
X-Inumbo-ID: 49732cfc-3e56-11ed-9648-05401a9f4f97
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
	t=1664277579;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
	bh=sh92KicTDh4caqpKkqA808K5SVahDD/Q8fFa9qaLWr4=;
	b=NgY0WzvQkkzu5MW68ZDDIcuV4ZDbsPWHe6Ea6G6DMmWyYU9vEc9VIxat/9KrpbSzohoO4T
	I890t20ZAuG8NWX0e5bK82z7sN0jhVlFGhMPVsNeuLbkOhNcCTcI1IH2WjJPtBVx56jzmL
	C+FFp+HdbIyl//i7IKrn1bjLTVyW1Gc=
Date: Tue, 27 Sep 2022 13:19:36 +0200
From: Borislav Petkov <bp@alien8.de>
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, x86@kernel.org,
	linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>
Subject: Re: [PATCH v3 08/10] x86/mtrr: let cache_aps_delayed_init replace
 mtrr_aps_delayed_init
Message-ID: <YzLcSOS6ZLIoPwBl@zn.tnic>
References: <20220908084914.21703-1-jgross@suse.com>
 <20220908084914.21703-9-jgross@suse.com>
 <YzIVfj/lvzQrK15Y@zn.tnic>
 <ce8cb1d3-a7d2-7484-26eb-60d3e29fa369@suse.com>
 <YzLMKk4OK9FtjjKQ@zn.tnic>
 <c0872933-e046-0c5e-b63f-861d2d343794@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <c0872933-e046-0c5e-b63f-861d2d343794@suse.com>

On Tue, Sep 27, 2022 at 12:14:42PM +0200, Juergen Gross wrote:
> Yes: cpu hotplug.

You might need to elaborate here.

Because I see mtrr_ap_init() on the AP hotplug path:

native_cpu_up->
do_boot_cpu->
start_secondary->
smp_callin->
smp_store_cpu_info->
identify_secondary_cpu->
mtrr_ap_init

Which then means that we could check in mtrr_ap_init() if we're on the
hotplug path and still get rid of that stupid bool...

Close?

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette

