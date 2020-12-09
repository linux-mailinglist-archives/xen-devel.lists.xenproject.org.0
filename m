Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A504A2D4C67
	for <lists+xen-devel@lfdr.de>; Wed,  9 Dec 2020 22:04:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.48706.86151 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kn6cN-0001vO-3g; Wed, 09 Dec 2020 21:03:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 48706.86151; Wed, 09 Dec 2020 21:03:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kn6cN-0001uz-03; Wed, 09 Dec 2020 21:03:23 +0000
Received: by outflank-mailman (input) for mailman id 48706;
 Wed, 09 Dec 2020 21:03:20 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/1wO=FN=linutronix.de=tglx@srs-us1.protection.inumbo.net>)
 id 1kn6cK-0001uu-NW
 for xen-devel@lists.xenproject.org; Wed, 09 Dec 2020 21:03:20 +0000
Received: from galois.linutronix.de (unknown [193.142.43.55])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d857475a-3cda-471b-8370-3d20ba7df5e2;
 Wed, 09 Dec 2020 21:03:17 +0000 (UTC)
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
X-Inumbo-ID: d857475a-3cda-471b-8370-3d20ba7df5e2
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1607547796;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to; bh=hNj079rC8GX5zfhsejFcRe+fUy18shN+tw2tIy22n68=;
	b=tfGrf6ucHKdubpqgU5nra0rYDWqvB0mIeri1Uqo1FyyEnFIEhEUNXO3+Lnc8bnkJsA4eHL
	0fin5E7QTBnkNC/ygxpJIkzt+GIBeW/S4NBuYI36+B+5Siq0tkX5m9ALwNh2W+2jjnvSyM
	00GfY+TQDq4Z5KL+4g03Ix2//g6i/0Ets34gKCx3ppzQ0g5RXVawvo++SF/MdNVoWrQfzZ
	8Gf3dYxdP1/07TJ0hldpbe0xmrWvZIPsXQaOFBbf6i/QhlWbqeRJc7Gjvfh4swJhUTeEzR
	iYnzzG7c+XHDEGxMxATdw20P+08Ot/jlViISPGpc6V3AgSlZwK53m1G3URv3eQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1607547796;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to; bh=hNj079rC8GX5zfhsejFcRe+fUy18shN+tw2tIy22n68=;
	b=RhXZJZRElncI738YJE3Yz7QMi9kllsKSf21gQ7U6c7lGF3UGbJIOoJN6RM8ni0BsqF6DzW
	qQfu/RWtRA5lKeBw==
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org, x86@kernel.org, linux-kernel@vger.kernel.org
Cc: peterz@infradead.org, luto@kernel.org, Juergen Gross <jgross@suse.com>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v2 01/12] x86/xen: use specific Xen pv interrupt entry for MCE
In-Reply-To: <20201120114630.13552-2-jgross@suse.com>
Date: Wed, 09 Dec 2020 22:03:15 +0100
Message-ID: <877dpqlmjw.fsf@nanos.tec.linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain

On Fri, Nov 20 2020 at 12:46, Juergen Gross wrote:

> Xen PV guests don't use IST. For machine check interrupts switch to
> the same model as debug interrupts.
>
> Signed-off-by: Juergen Gross <jgross@suse.com>
> Acked-by: Peter Zijlstra (Intel) <peterz@infradead.org>

Reviewed-by: Thomas Gleixner <tglx@linutronix.de>

