Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D27C5A01244
	for <lists+xen-devel@lfdr.de>; Sat,  4 Jan 2025 05:37:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.865331.1276632 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tTvua-0001AY-8D; Sat, 04 Jan 2025 04:37:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 865331.1276632; Sat, 04 Jan 2025 04:37:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tTvua-00018c-59; Sat, 04 Jan 2025 04:37:20 +0000
Received: by outflank-mailman (input) for mailman id 865331;
 Sat, 04 Jan 2025 04:37:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EL/b=T4=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1tTvuX-00018S-T9
 for xen-devel@lists.xenproject.org; Sat, 04 Jan 2025 04:37:18 +0000
Received: from mail-10629.protonmail.ch (mail-10629.protonmail.ch
 [79.135.106.29]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9353c6e4-ca55-11ef-a0de-8be0dac302b0;
 Sat, 04 Jan 2025 05:37:16 +0100 (CET)
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
X-Inumbo-ID: 9353c6e4-ca55-11ef-a0de-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1735965435; x=1736224635;
	bh=esT0z8LBblkh1BbXHcW4EWgIxuuwWhHvlOOa3shTeWo=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=YAqgYI1fV6FYX55eG9DYRfEQ5uQKroA38h6TbR5+qoImonlZlgpqTXaLdzttkOisB
	 xR1A+v41KzWxjy46yJ0JfMV5tj1Sx2zo/Lq9ZssoPE6ZmbQF+zX75bBuocWQBRIXvn
	 ZJkSSEMk762JBk6pcXgLwRu/g9MM3b2wgbzSLUkNBFFNbHyto8LOBrdqCeJSHEzp8V
	 1jMcIt16Ai0AjQ7SLEniSBTGiFnuR1lwv98hd+JRYoxP8Geq/BCLgK032Z5I+X85Zl
	 8dgB4QXPZV9qT5vuFvhgQnpp/meCJ9TqgTlDH7sOBTEeNP0wy4rl9e1S85ozDub1dI
	 nEOGATHVdP8sg==
Date: Sat, 04 Jan 2025 04:37:09 +0000
To: Jan Beulich <jbeulich@suse.com>
From: Denis Mukhin <dmkhn@proton.me>
Cc: dmukhin@ford.com, Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2 32/35] x86/hvm: add debugging facility to NS8250 UART emulator
Message-ID: <zsRVKo1fv9LnJ4lyhC-H5wDBGVje41HRtB-u2CK0-zFh1g-RwvW-q-tTdvt9tfu1BJbHwhTJu-s25MsnjEv1h8lhaZuIAG4AAhJpw6kmsx4=@proton.me>
In-Reply-To: <d6ffc431-34f4-46b9-b0ad-0071439ed3c6@suse.com>
References: <20241205-vuart-ns8250-v1-0-e9aa923127eb@ford.com> <20241205-vuart-ns8250-v1-32-e9aa923127eb@ford.com> <d6ffc431-34f4-46b9-b0ad-0071439ed3c6@suse.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 741208ac6294debe4d4fea9be74ae5a4624c22f6
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Monday, December 16th, 2024 at 7:08 AM, Jan Beulich <jbeulich@suse.com> =
wrote:

>
>
> On 06.12.2024 05:42, Denis Mukhin via B4 Relay wrote:
>
> > +static void ns8250_keyhandler_init(void)
> > +{
> > + register_keyhandler('1', ns8250_keyhandler_show,
> > + "dump virtual NS8250 state", 0);
> > + register_keyhandler('2', ns8250_keyhandler_irq,
> > + "trigger IRQ from virtual NS8250", 0);
>
>
> Characters for key handlers are a pretty scarce resource. I'm afraid I
> wouldn't want to see this committed, even if it may be helpful during
> (initial) debugging. Even more so when both handlers only ever act on
> a single domain. Imo both want to be domctl-s instead.

re: keyhandler resource: yes, thank you, I understand that.
I did not know better way to add dev debugging; I hooked to 'q' handler
in v3. Triggering vUART interrupts - dropped.

So no keyhandlers in v3.

>
> Jan



