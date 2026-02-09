Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KJN2BeS0iWlLBAUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 09 Feb 2026 11:20:20 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BC26210E14F
	for <lists+xen-devel@lfdr.de>; Mon, 09 Feb 2026 11:20:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1225146.1531621 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vpONB-00019R-Ed; Mon, 09 Feb 2026 10:20:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1225146.1531621; Mon, 09 Feb 2026 10:20:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vpONB-00016g-Bd; Mon, 09 Feb 2026 10:20:05 +0000
Received: by outflank-mailman (input) for mailman id 1225146;
 Mon, 09 Feb 2026 10:20:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=mr8m=AN=alien8.de=bp@srs-se1.protection.inumbo.net>)
 id 1vpON9-0000nj-UK
 for xen-devel@lists.xenproject.org; Mon, 09 Feb 2026 10:20:03 +0000
Received: from mail.alien8.de (mail.alien8.de [2a01:4f9:3051:3f93::2])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e2b51e57-05a0-11f1-9ccf-f158ae23cfc8;
 Mon, 09 Feb 2026 11:19:58 +0100 (CET)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id ACEAC40E02E5; 
 Mon,  9 Feb 2026 10:19:55 +0000 (UTC)
Received: from mail.alien8.de ([127.0.0.1])
 by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id 4C9Q5WVVx173; Mon,  9 Feb 2026 10:19:50 +0000 (UTC)
Received: from zn.tnic (pd95306e3.dip0.t-ipconnect.de [217.83.6.227])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest
 SHA256) (No client certificate requested)
 by mail.alien8.de (SuperMail on ZX Spectrum 128k) with UTF8SMTPSA id
 917DA40E0326; Mon,  9 Feb 2026 10:19:30 +0000 (UTC)
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
X-Inumbo-ID: e2b51e57-05a0-11f1-9ccf-f158ae23cfc8
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=fail (4096-bit key)
	reason="fail (body has been altered)" header.d=alien8.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1770632389; bh=qEUrs9aV2UevLern7cWNO8zzbe1KAW/M2x98IuKSaBo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=L7SgNe1HGQWJrNNPxIw1k6KgoWfev2wqz1jZbCcdXa3N+r4Sl/iSwK3+WgzxAFLP8
	 QDIumwRX6KDqKNsBiOjqrW8IUFJtEx9sgCqb/bAzmbANjrv039vpmzj4gjo9THzeU+
	 YSeKDxKiC0bvOQQrRgAmB1w4YLy5TCWky0ssa46YJD12Zf3DncxHeqLZnCEyiDvmok
	 ImdQ26bRkjFZie01PrBcG6QN7TlXcb7KBJhmBUxPdA+piF7m7xZKSZWgb7o4p/oBoW
	 65Eq70rBCFjVlN2eomT3o1+/ySJUpqMssMZEfzXq/CyGEHZVfOrzEhVna54KL/dc4S
	 7ZeL+vs8Y7GtRdbrr9C4RHiMxtgKQPEoyMTb//9gb0Y2+3+7wDLh1B9yHuqbWjz+Kr
	 Yb/Ws3PqB19EwD6aoi/Tt1w25wr/ScLec10clV/Mjn/qpU5jib/sg2vHOJVaaKm4Sh
	 oDhL5LGnFq1wjriJrXcmG4Vw3VjwohtUAQmP5GMIB5HnkpO6y85vAK8EPWtn6A4K9+
	 TJ9NGVpHZA3Fht96JrON+2jvKS3NfRstQvYDeF17seJMrMjba69iIQPkiaMVYjiH5s
	 0ihBjjGUpmtKls4QpuZphm5tynBcgqWNyCG4hiKuLtwqpBtWM+74IOdgKLcwwzTB+v
	 5v/tPeD19u9TgLlvgaBntID4=
Date: Mon, 9 Feb 2026 11:19:18 +0100
From: Borislav Petkov <bp@alien8.de>
To: Juergen Gross <jgross@suse.com>
Cc: linux-kernel@vger.kernel.org, x86@kernel.org,
	virtualization@lists.linux.dev, kvm@vger.kernel.org,
	linux-block@vger.kernel.org, Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Ajay Kaher <ajay.kaher@broadcom.com>,
	Alexey Makhalov <alexey.makhalov@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Vitaly Kuznetsov <vkuznets@redhat.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	xen-devel@lists.xenproject.org, Denis Efremov <efremov@linux.com>,
	Jens Axboe <axboe@kernel.dk>
Subject: Re: [PATCH v4 0/6] x86: Cleanups around slow_down_io()
Message-ID: <20260209101918.GAaYm0plbeXIBr8p9a@fat_crate.local>
References: <20260119182632.596369-1-jgross@suse.com>
 <6ee93510-1f43-4cd2-952e-8ed3ce7ba0e5@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <6ee93510-1f43-4cd2-952e-8ed3ce7ba0e5@suse.com>
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.61 / 15.00];
	R_DKIM_REJECT(1.00)[alien8.de:s=alien8];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[alien8.de : SPF not aligned (strict),none];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jgross@suse.com,m:linux-kernel@vger.kernel.org,m:x86@kernel.org,m:virtualization@lists.linux.dev,m:kvm@vger.kernel.org,m:linux-block@vger.kernel.org,m:tglx@kernel.org,m:mingo@redhat.com,m:dave.hansen@linux.intel.com,m:hpa@zytor.com,m:ajay.kaher@broadcom.com,m:alexey.makhalov@broadcom.com,m:bcm-kernel-feedback-list@broadcom.com,m:pbonzini@redhat.com,m:vkuznets@redhat.com,m:boris.ostrovsky@oracle.com,m:xen-devel@lists.xenproject.org,m:efremov@linux.com,m:axboe@kernel.dk,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[bp@alien8.de,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,fat_crate.local:mid];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bp@alien8.de,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[alien8.de:-];
	NEURAL_HAM(-0.00)[-0.995];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: BC26210E14F
X-Rspamd-Action: no action

On Mon, Feb 09, 2026 at 10:11:49AM +0100, Juergen Gross wrote:
> PING?
>=20
> Now 3 weeks without any reaction...

J=C3=BCrgen, there are other patchsets that need review too. And we have =
merge
window right now so no reviewing anyway.

And you know all that damn well!

How about you help us out and you start reviewing x86 patches instead of
pinging every week?

Thx.

--=20
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette

