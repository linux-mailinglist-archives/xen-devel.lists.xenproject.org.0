Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id GeZDKcpQIWqvDAEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 04 Jun 2026 12:17:46 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 04D7963EF02
	for <lists+xen-devel@lfdr.de>; Thu, 04 Jun 2026 12:17:46 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=rNBLie98;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("google.com:s=arc-20240605:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1327611.1592435 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wV58L-0002oV-O6; Thu, 04 Jun 2026 10:17:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1327611.1592435; Thu, 04 Jun 2026 10:17:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wV58L-0002lz-Km; Thu, 04 Jun 2026 10:17:05 +0000
Received: by outflank-mailman (input) for mailman id 1327611;
 Thu, 04 Jun 2026 10:17:04 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <freddy77@gmail.com>) id 1wV58K-0002lt-Jc
 for xen-devel@lists.xenproject.org; Thu, 04 Jun 2026 10:17:04 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wV58J-00AAq8-LT
 for xen-devel@lists.xenproject.org; Thu, 04 Jun 2026 12:17:03 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a215098-2eae-0a2a0a5409dd-0a2a450386e6-12
 for <xen-devel@lists.xenproject.org>; Thu, 04 Jun 2026 12:17:03 +0200
Received: from [74.125.224.45] (helo=mail-yx1-f45.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a21509e-672d-0a2a45030019-4a7de02dacce-3
 for <xen-devel@lists.xenproject.org>; Thu, 04 Jun 2026 12:17:03 +0200
Received: by mail-yx1-f45.google.com with SMTP id
 956f58d0204a3-6603d8697d2so587589d50.0
 for <xen-devel@lists.xenproject.org>; Thu, 04 Jun 2026 03:17:03 -0700 (PDT)
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
ARC-Seal: i=1; a=rsa-sha256; t=1780568222; cv=none;
        d=google.com; s=arc-20240605;
        b=cxwFEk645IfQidGJLOrN3n6XB37OpkmfG6qj+kvzPRCDeoEelYGl3WqYsjgzFueHen
         cYRJKCr9JIAbLftwJ3eLYY3q22jyh4L1x0+GYh8epnsy4n9O+oLlMUb9Oe8l98dUAnXJ
         JRLOl4P+PdT+OFwpcKNAFzu2CzeVxnG2mAsQXnmYNW54k9fUjH5Bukw6XzQeezLFgFZf
         0cTKOVKoKnMarcQfYKqRZkD3lXTSmOXerhXacZf0yKLjaDkHjHg/CkkmMLnthKOHVZ5w
         V/uiHPcO9/Ft6UvzidgspWPynu3Z+4V4xWg1gBIRGosly0mTQ0ZznWOY9XoGYZInJ2jG
         Fq6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=3g2FJuhmtw1p1grCzFRLprBtPRu9/Gw6Z11ZYhXMP/k=;
        fh=P4u/IhpfK7clP8z1s5Ol+HHE8whEXfpZ9+vnjbgCW9Q=;
        b=BSptCTgdxppBka+8r1bCBUzeGw+/6khmNmk4+hy+xuseky08aQn8a3KZhb7xzI4HqC
         bzq7L3B/ixywmK3yr9OP9IL8WRmdXvQLhbWc7laD9CIuEELRYN6pZKz7l1Xt1/gCQZ2G
         QBNuFhqMg5JA1TSB0DfDHUZsQz383PjDjAcFFtb0VBY2x9PYj6XgSjv9FzRZ+U1DhkF0
         z8LZR4CuHXDOUpnf4PhRWRM3fhyFG1mxypdrvZgtVimV6Cx0fHLlVT4Ofcp06XAAnxHO
         QTkZ5ygMsMiMoxEHAPmyuv/ew2BPnPzeyJb8wf+JX63wuPvX+lK1Oab1pgbCU3rt6xWt
         5TOQ==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780568222; x=1781173022; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=3g2FJuhmtw1p1grCzFRLprBtPRu9/Gw6Z11ZYhXMP/k=;
        b=rNBLie98hGwz1ZmLTLreYq9n5BR57KETBGw27zMgQMxeK5ja7S/pxqAAMsiOASM3xY
         zV34mTXHIzWZ3De+qizYlxsZ5EPLGLc54jPnnt4QoJo42EFeJSMg+iD66uhErOu9JLJX
         mxwFQAr9kMTew7V11DDSiifwI19OE9/n0KsZdbw0vUyKOCugqZeZszrjZqHbNVcAw2ab
         w0apj11NSxybUsyqgv+1IGw4dKaj2ohQwAJLgt0VOcBrKz8tYRRmsQuPusWAZID6+C+V
         GYjtc58U1BKOfF93lfZqNKIzs6mEd/FC6mJvH+o9gaW7VuH+mlPNlzx472pRm+FnBERE
         Wjbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780568222; x=1781173022;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3g2FJuhmtw1p1grCzFRLprBtPRu9/Gw6Z11ZYhXMP/k=;
        b=J3XvJ4wRBSD4d051FNNHPSeWZXtGCoBBm0fIWKdXk6OTVxAwSlO4+rIPO+aCaw5pPr
         WyBEZl54PCz84LbUnhWbUwXW1xxPleoW5dbJcMPp4ihpZ7qIXDSrGtYpGka/JgaQKud/
         QBRZcYJnSsB7qJk/jzJKiv+g4b66FSEc/6iVr51Ry6MHX0XkMyFYfOfW+P9ZqDeQEcEu
         3ISP3JocnVp1k+PxjogtJ9O88teZMT4V0/NLfJwFAW1KQ/FBj4ayZbIYs+MQ6aBZ/wjs
         WqRgMQS2m645OdDTfSgU7ueYKx98ISFcYvuQGwep7rPj+JDt4+dOBD0/1yV7j+GaNPdh
         8KbQ==
X-Forwarded-Encrypted: i=1; AFNElJ9bZ2OPhmuz+IfGoydj0w9bkFjRgdB32oyfQ1tYgxBwEfyNMqtj7CZnWIWjK3RKu5RouCo0TfDgf0k=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yzd1+1clwZLDvT62Kvi5Ftvxltf6TywyxXn6RB0qCd5GnQFUiZe
	5GB6LJz8vUsDpPmLVcamScdkdiJ49ahDR+rqEawSNRyMzZYjIttEcnLxO1S0FwmVoFC/pvIZvv2
	5UkmosJHwjTvOUulKRb9KMC12qnkU3TA=
X-Gm-Gg: Acq92OFuZ4AZ9rqdzu/6sJlJqDuHOh4bNA0hpgVFfS67L+44xjXC6kGVehTD5g27XyB
	x13Owhy0wHcusH/xmGFta+up0aTm0Q763uP7Pc2e/+8owtZZWFx8cEZekBaUQfcw++LKG7H9mxC
	bnldnDtebdBvXvWXvJZKZg1ktUrj1xvNWBcQiz9PLdywhtD3oVtcuzwcd5dt12SPcggn3fBgjuQ
	1vaZZLtzi4V+PMFHsWPz2R0Evq9DASzX/7eS9tcT3+Ae0Zd/2bMd+ROtMCXFH8zgWM/ds6Vorln
	+c2u4F0MqpIpCsCtEHSpXGQiGRYb295aYy51qQpUopJeroMVydGklgU5uh4=
X-Received: by 2002:a05:690e:bcd:b0:660:eaa4:5c17 with SMTP id
 956f58d0204a3-660eaa45cc7mr4604017d50.2.1780568222039; Thu, 04 Jun 2026
 03:17:02 -0700 (PDT)
MIME-Version: 1.0
References: <20260529153531.1341542-1-frediano.ziglio@cloud.com>
 <20260529153531.1341542-3-frediano.ziglio@cloud.com> <7067092e-ba18-4513-a9b1-83ba084ccbb4@suse.com>
In-Reply-To: <7067092e-ba18-4513-a9b1-83ba084ccbb4@suse.com>
From: Frediano Ziglio <freddy77@gmail.com>
Date: Thu, 4 Jun 2026 11:16:49 +0100
X-Gm-Features: AVHnY4KSFS8YyALlJI_kHXlPvRsRAqaV41C6jpV-aelfAbhVk2vyTWu-Vzew3Qg
Message-ID: <CAHt6W4cP57pAPsNDKpssjYB=snLEZgOhWkYkVrJys01-NTMiRQ@mail.gmail.com>
Subject: Re: [PATCH 2/6] Align all sections to 4KB
To: Jan Beulich <jbeulich@suse.com>
Cc: Frediano Ziglio <frediano.ziglio@cloud.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Teddy Astie <teddy.astie@vates.tech>, 
	=?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?= <marmarek@invisiblethingslab.com>, 
	xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
X-purgate-ID: tlsNG-33051d/1780568223-41396938-41C62D49/0/0
X-purgate-type: clean
X-purgate-size: 1951
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[freddy77@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:frediano.ziglio@cloud.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:marmarek@invisiblethingslab.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[gmail.com:+];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[freddy77@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	TAGGED_RCPT(0.00)[xen-devel];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 04D7963EF02

On Tue, 2 Jun 2026 at 13:09, Jan Beulich <jbeulich@suse.com> wrote:
>
> On 29.05.2026 17:35, Frediano Ziglio wrote:
> > Required by UEFI CA memory mitigation.
>
> Imo this isn't enough for a description: At the very least you want to
> point at where that requirement is spelled out. Additionally: How much
> of an image growth is this going to be? Considering that elsewhere it
> was already said that xen.efi is too large for certain purposes (and
> hence e.g. debug info wants stripping there), size increase is a
> potential issue.
>

I'll integrate Andrew comment on the description.
The image will increase but if it's a problem just adding some kbytes
it would be a pretty big deal.
If I remember the issue was more if the image was not stripped and in
this case it was like 10 times bigger, not just a bit bigger.

> > --- a/xen/arch/x86/xen.lds.S
> > +++ b/xen/arch/x86/xen.lds.S
> > @@ -162,8 +162,8 @@ SECTIONS
> >         __note_gnu_build_id_end = .;
> >    } PHDR(note) PHDR(text)
> >  #elif defined(BUILD_ID_EFI)
> > -  /* Workaround bug in binutils < 2.36 */
> > -  . = ALIGN(32);
> > +  /* align to satisfy UEFI CA memory mitigation */
> > +  . = ALIGN(PAGE_SIZE);
> >    DECL_SECTION(.buildid) {
> >         __note_gnu_build_id_start = .;
> >         *(.buildid)
> > @@ -330,6 +330,7 @@ SECTIONS
> >    __2M_rwdata_end = ALIGN(SECTION_ALIGN);
> >
> >  #ifdef EFI
> > +  . = ALIGN(PAGE_SIZE);
> >    .reloc ALIGN(4) : {
> >      __base_relocs_start = .;
> >      *(.reloc)
> > @@ -355,6 +356,7 @@ SECTIONS
> >    VIRT_START &= 0;
> >    ALT_START &= 0;
> >
> > +  . = ALIGN(PAGE_SIZE);
> >    .sbat (NOLOAD) : { *(.sbat) }
> >  #elif defined(XEN_BUILD_EFI)
> >    /*
>
> You say "all sections" in the title, yet this is not covering e.g. debug
> info.
>

I will change to "all loadable sections". debug sections are not
loadable so they don't cause an issue.

> Jan

Frediano

