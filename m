Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YEFGO4jlcmlzrAAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 23 Jan 2026 04:05:44 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 94E846FE60
	for <lists+xen-devel@lfdr.de>; Fri, 23 Jan 2026 04:05:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1212028.1523378 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vj7Tc-0008Cx-Gm; Fri, 23 Jan 2026 03:04:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1212028.1523378; Fri, 23 Jan 2026 03:04:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vj7Tc-0008AB-CB; Fri, 23 Jan 2026 03:04:48 +0000
Received: by outflank-mailman (input) for mailman id 1212028;
 Fri, 23 Jan 2026 03:04:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qkWT=74=antgroup.com=houwenlong.hwl@srs-se1.protection.inumbo.net>)
 id 1vj7TZ-0008A5-UT
 for xen-devel@lists.xenproject.org; Fri, 23 Jan 2026 03:04:46 +0000
Received: from out28-145.mail.aliyun.com (out28-145.mail.aliyun.com
 [115.124.28.145]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3eeeabe4-f808-11f0-b15e-2bf370ae4941;
 Fri, 23 Jan 2026 04:04:41 +0100 (CET)
Received: from localhost(mailfrom:houwenlong.hwl@antgroup.com
 fp:SMTPD_---.gDSnk6b_1769137470 cluster:ay29) by smtp.aliyun-inc.com;
 Fri, 23 Jan 2026 11:04:30 +0800
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
X-Inumbo-ID: 3eeeabe4-f808-11f0-b15e-2bf370ae4941
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=antgroup.com; s=default;
	t=1769137474; h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
	bh=z7QKQEit5IiI9wEnKzSXeZlrU6DLi2VCu28yIrU4sWs=;
	b=iX7hzYSA93ykBxdaR2ZcKhMIMZbgTe9InBDBMrAojhu0FYPgcR4qGytnB22U2Njown7AM5yx+jAFNHv+bBb4SeRZIVD5UUJc8u6KwofagH6zVbzh2Jn9LlvDuQUOhAYyBilwJXs6GisFeZclz5Uyjwzyb/+rD82rrBGjzkzGuxw=
Date: Fri, 23 Jan 2026 11:04:30 +0800
From: Hou Wenlong <houwenlong.hwl@antgroup.com>
To: Borislav Petkov <bp@alien8.de>
Cc: linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>, Juergen Gross <jgross@suse.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Peter Zijlstra <peterz@infradead.org>,
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Li Chen <chenl311@chinatelecom.cn>, Brian Gerst <brgerst@gmail.com>,
	Sohil Mehta <sohil.mehta@intel.com>,
	Tim Chen <tim.c.chen@linux.intel.com>,
	Patryk Wlazlyn <patryk.wlazlyn@linux.intel.com>,
	Eric Dumazet <edumazet@google.com>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH 1/2] x86/smp: Move the static call update for 'smp_ops'
 into smp_prepare_boot_cpu()
Message-ID: <20260123030430.GA75451@k08j02272.eu95sqa>
References: <b5e3f1d674af21c1592eab3ce8cc7dc93f9a7dad.1769090885.git.houwenlong.hwl@antgroup.com>
 <20260122142156.GEaXIyhNQeGvOR5yyu@fat_crate.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260122142156.GEaXIyhNQeGvOR5yyu@fat_crate.local>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[antgroup.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[antgroup.com:s=default];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[antgroup.com:email,antgroup.com:dkim,k08j02272.eu95sqa:mid];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:bp@alien8.de,m:linux-kernel@vger.kernel.org,m:tglx@kernel.org,m:mingo@redhat.com,m:dave.hansen@linux.intel.com,m:x86@kernel.org,m:hpa@zytor.com,m:jgross@suse.com,m:boris.ostrovsky@oracle.com,m:peterz@infradead.org,m:rafael.j.wysocki@intel.com,m:kprateek.nayak@amd.com,m:chenl311@chinatelecom.cn,m:brgerst@gmail.com,m:sohil.mehta@intel.com,m:tim.c.chen@linux.intel.com,m:patryk.wlazlyn@linux.intel.com,m:edumazet@google.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[houwenlong.hwl@antgroup.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[antgroup.com:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[houwenlong.hwl@antgroup.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,redhat.com,linux.intel.com,zytor.com,suse.com,oracle.com,infradead.org,intel.com,amd.com,chinatelecom.cn,gmail.com,google.com,lists.xenproject.org];
	NEURAL_HAM(-0.00)[-0.284];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 94E846FE60
X-Rspamd-Action: no action

On Thu, Jan 22, 2026 at 03:21:56PM +0100, Borislav Petkov wrote:
> On Thu, Jan 22, 2026 at 10:15:43PM +0800, Hou Wenlong wrote:
> > The commit 1f60230cdc63 ("x86/smp: Use static_call for
> > arch_send_call_function_ipi()") changed to use a static call for
> > arch_send_call_function_ipi(), which causes two problems:
> > 
> > First, the KVM guest also changes 'smp_ops.send_call_func_ipi' when the
> > PV sched yield feature is available. However, the missing
> > static_call_update() breaks the PV sched yield feature.
> > 
> > Additionally, xen_smp_init() is called before static_call_init() during
> > the booting of the XENPV guest, which triggers a warning in
> > __static_call_update().
> > 
> > To simplify, move the static call update for 'smp_ops' into
> > smp_prepare_boot_cpu() to address these two problems together.
> > 
> > Fixes: 1f60230cdc63 ("x86/smp: Use static_call for arch_send_call_function_ipi()")
> > Signed-off-by: Hou Wenlong <houwenlong.hwl@antgroup.com>
> > ---
> > I'm not sure if the XEN part is okay or not. I think there should be no
> > IPI before smp_prepare_boot_cpu(), and even if there is, it's okay for
> > the KVM guest to use the native version before smp_prepare_boot_cpu().
> 
> All three commits zapped from tip:x86/core.
> 
> We can try again once this is resolved.
>

Get it, thanks!

> Thx.
> 
> -- 
> Regards/Gruss,
>     Boris.
> 
> https://people.kernel.org/tglx/notes-about-netiquette

