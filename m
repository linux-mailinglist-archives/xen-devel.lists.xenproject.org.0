Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8ASTCespcGnYWwAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 21 Jan 2026 02:20:43 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B9BBF4EFE8
	for <lists+xen-devel@lfdr.de>; Wed, 21 Jan 2026 02:20:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1209400.1521420 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1viMst-00008Q-Fh; Wed, 21 Jan 2026 01:19:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1209400.1521420; Wed, 21 Jan 2026 01:19:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1viMst-00005u-9o; Wed, 21 Jan 2026 01:19:47 +0000
Received: by outflank-mailman (input) for mailman id 1209400;
 Wed, 21 Jan 2026 01:19:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=M5F9=72=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1viMsr-00005o-Qa
 for xen-devel@lists.xenproject.org; Wed, 21 Jan 2026 01:19:45 +0000
Received: from tor.source.kernel.org (tor.source.kernel.org
 [2600:3c04:e001:324:0:1991:8:25])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 434a2b10-f667-11f0-9ccf-f158ae23cfc8;
 Wed, 21 Jan 2026 02:19:42 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 4E1ED60051;
 Wed, 21 Jan 2026 01:19:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E6F4C16AAE;
 Wed, 21 Jan 2026 01:19:39 +0000 (UTC)
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
X-Inumbo-ID: 434a2b10-f667-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768958381;
	bh=gyRuce2gAMFd7Kf+AIbt/VKe3z2siCjHdmIEWBGHDgY=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=BXChK3/hFw7xNsDxiEk+a6VD0tDY6aeS23lbOl9HWy+9TN1Q++GayE3hlidcd43Aj
	 b473UShyLOVs1ExKIaO3kGxPJRriVEpjwW7UuDWqYZrb0zH4NQIiaRAaBxxA/2bmSW
	 rkcseWZcbKYVbJbodBlT+h4L274jTjT72skMY7z47fWHLbiAEGyC0KR9fo/f1nyENe
	 Ka/4FPEvDxnVWjWEqAx88w5yX4KNARd1t7u5liyiLBuonviEZxr+rPEJ5svogmdHdE
	 KEGojP09//roEsQJfRHCAhs4k/hhYfU/PqTUhr5rHCnfoC+I93EAQtVP+BtRZ6mCjX
	 dphN7EFAcJ4yQ==
Date: Tue, 20 Jan 2026 17:19:38 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
cc: Jan Beulich <jbeulich@suse.com>, 
    Oleksii Kurochko <oleksii.kurochko@gmail.com>, 
    Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Alistair Francis <alistair.francis@wdc.com>, 
    Connor Davis <connojdavis@gmail.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    Anthony PERARD <anthony.perard@vates.tech>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [Arm] Re: [PATCH v1 11/15] xen/riscv: introduce ns_to_ticks()
In-Reply-To: <87bjin6cgd.fsf@epam.com>
Message-ID: <alpine.DEB.2.22.394.2601201718460.7192@ubuntu-linux-20-04-desktop>
References: <cover.1766595589.git.oleksii.kurochko@gmail.com> <e4e36ed2d02b760c925014db986041b82fd9b943.1766595589.git.oleksii.kurochko@gmail.com> <369eb1d7-864e-4432-9729-57786d0c191f@suse.com> <87bjin6cgd.fsf@epam.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_RECIPIENTS(0.00)[m:Volodymyr_Babchuk@epam.com,m:jbeulich@suse.com,m:oleksii.kurochko@gmail.com,m:michal.orzel@amd.com,m:julien@xen.org,m:sstabellini@kernel.org,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[sstabellini@kernel.org,xen-devel-bounces@lists.xenproject.org];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	ARC_NA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:rdns,lists.xenproject.org:helo];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sstabellini@kernel.org,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[suse.com,gmail.com,amd.com,xen.org,kernel.org,wdc.com,citrix.com,vates.tech,lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: B9BBF4EFE8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, 21 Jan 2026, Volodymyr Babchuk wrote:
> > On 24.12.2025 18:03, Oleksii Kurochko wrote:
> >> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> >> ---
> >>  xen/arch/riscv/include/asm/time.h | 5 +++++
> >>  1 file changed, 5 insertions(+)
> >
> > Looks okay and read to go in as is (no dependencies on earlier patches afaics),
> > but:
> >
> >> --- a/xen/arch/riscv/include/asm/time.h
> >> +++ b/xen/arch/riscv/include/asm/time.h
> >> @@ -29,6 +29,11 @@ static inline s_time_t ticks_to_ns(uint64_t ticks)
> >>      return muldiv64(ticks, MILLISECS(1), cpu_khz);
> >>  }
> >>  
> >> +static inline uint64_t ns_to_ticks(s_time_t ns)
> >> +{
> >> +    return muldiv64(ns, cpu_khz, MILLISECS(1));
> >> +}
> >
> > It's hard to see what's arch-dependent about this or ticks_to_ns(). They're
> > similar but not identical to Arm's version, and I actually wonder why that
> > difference exists. Questions to Arm people:
> > 1) Why are they out-of-line functions there?
> 
> That's interesting question. According to git blame this is how it was
> introduced in 2012 and after that no one touched this part. Original
> patch had cntfrq defined as `static`, this explains why these functions
> were declared out-of-line.
> 
> > 2) Why the involvement of the constant 1000 there? 1000 * cpu_khz can
> >    actually overflow in 32 bits. The forms above aren't prone to such an
> >    issue.
> 
> Patch "xen: move XEN_SYSCTL_physinfo, XEN_SYSCTL_numainfo and
> XEN_SYSCTL_topologyinfo to common code" (096578b4e48) changed hz to
> khz. This added that 1000 multiplication. Also this patch removed
> `static` qualifier from the counter variable.
> 
> Anyways, latest ARM ARM suggests that timer frequency should be fixed at
> 1GHz, which is shy of 32-bit overflow. So most new platforms will be
> fine. And older platforms had much lower frequencies.
> 
> > If the delta isn't justified, I think we'd better put RISC-V's functions in
> > common code (xen/time.h). They're not presently needed by x86, but as
> > inline functions they also shouldn't do any harm.
> 
> I'm mere reviewer, but I agree that proposed approach is better and more
> resilient.

Yes I agree too.

