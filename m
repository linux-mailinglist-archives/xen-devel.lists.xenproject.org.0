Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OCJ9D3b2w2nPvAQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 25 Mar 2026 15:51:34 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A778E32727F
	for <lists+xen-devel@lfdr.de>; Wed, 25 Mar 2026 15:51:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1262428.1554963 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w5PZg-0001wu-92; Wed, 25 Mar 2026 14:51:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1262428.1554963; Wed, 25 Mar 2026 14:51:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w5PZg-0001v9-6Q; Wed, 25 Mar 2026 14:51:12 +0000
Received: by outflank-mailman (input) for mailman id 1262428;
 Wed, 25 Mar 2026 14:16:07 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <aydenbottos12@gmail.com>) id 1w5P1j-0003l4-M9
 for xen-devel@lists.xenproject.org; Wed, 25 Mar 2026 14:16:07 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w5P1h-00Cxa0-23
 for xen-devel@lists.xenproject.org; Wed, 25 Mar 2026 15:16:06 +0100
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <aydenbottos12@gmail.com>)
 id 69c3ee1c-bab6-0a2a0a5309dd-0a2a45068d6c-34
 for <xen-devel@lists.xenproject.org>; Wed, 25 Mar 2026 15:16:06 +0100
Received: from [209.85.160.45] (helo=mail-oa1-f45.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <aydenbottos12@gmail.com>)
 id 69c3ee25-3034-0a2a45060019-d155a02db8d6-3
 for <xen-devel@lists.xenproject.org>; Wed, 25 Mar 2026 15:16:06 +0100
Received: by mail-oa1-f45.google.com with SMTP id
 586e51a60fabf-40946982a78so2094151fac.2
 for <xen-devel@lists.xenproject.org>; Wed, 25 Mar 2026 07:16:05 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version"
ARC-Seal: i=1; a=rsa-sha256; t=1774448164; cv=none;
        d=google.com; s=arc-20240605;
        b=PkiGqVneoTAN8tT6/3QfKjxN4t4IpqHI375XykqZCGLWvPYFNIC3sp67A4aoOBCVkn
         U2PyXrklrhbSaTTESZykcwnfAAjn61wgQ1Z8iOD1u/yJnVupCTEEIYVyywrrO63r56gL
         FWEGc0WtPyD8dggd/f58ccKjT4SeNo+JnnWz8gxrhleJKznHyPUcdG6QsEIvd4pg+PsQ
         OLbctyM1c33peAr6H/cdtPezAX0eYIZkQyG+VR+ziRCmDPMXt1tW+HhuqdmlFfEM6+Ay
         S07f2/cvwSC53mYHZbdCDPggNnEj9FzpP4agHEwqeRPzUWBwLejnXTPX28l1ZacS7aaA
         MDBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=r7y6YKolCJv5+RCixJGv6yuwL2cEKqM475jxEEtn/XU=;
        fh=g1WkAsZ2h5zzPyv9sSr+bkKXIKzQT0CMUrA/Ka8vWHk=;
        b=OkjO2PL677FWqSWeqkcAt7CjYNuWLGx77gZ3OAGoZAhsgRsNqZIM8R51QseWvaZ6/o
         +gjeqTdobjMQtStevKF/NA+crjM+cNisDCUJ05qOJ+OLHiCqXnzJa2lUPZFVnVnxlHlp
         wfcy7uyhuawbEV1PakV0PTPvjXfnuEv1mN81lEWfQUjy7ABXBKaG0/sWrGrJeSoAujoW
         MDwEKvZKF0qHvsU84b4nGgPAWAck0clIkIYWIaGDfYY59f29JViD0jXBq7hkj2BnjTV0
         18zaID6zGx8MU/cq7CQP/1+utzIO3xKC0WrU7HGKSdcgmhRtDLx0awOpRUfmf/2gEyJg
         53Pg==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774448164; x=1775052964; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r7y6YKolCJv5+RCixJGv6yuwL2cEKqM475jxEEtn/XU=;
        b=mPGQTbDg7iuLa9hEoVDZ59eYdg/ET3bGHDsA6yr7dxcFc70v3ATaapCzzeZHw99Iui
         9OtkLfNpaEQHI8xTpS4tG3kgK6Kdn1AdQvM8wg/3yKNfh/Rcz3i6Ce8vZJAbDJ1z1LGp
         2/g59PFsDMa20N8sozVmHJFED+HJjLGmXsUs4I4EOaZMXWlLn+aGRGC1JO3pPb691DuC
         01Zu5lWe0IUW/GbHCxg1cKXeeoAwm5diUgaFoLCsC5WGwnSAvTt2gUQAllqP6ZG5RKAQ
         f0/ubOUXNIqNb0P/WRYOY/pWfzCCueYbdN6Kjs8gewxrKnfwE9vhtCf8ta/Htqtl3n07
         hHtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774448164; x=1775052964;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=r7y6YKolCJv5+RCixJGv6yuwL2cEKqM475jxEEtn/XU=;
        b=TQnm1F/s7lUlyBsfUsI8XP0Dxdm2tUevbWzz6TgolPIcaa1g63nLeh8nXk+/NFe0fl
         OroeoLgucJQaR1n4w/xVce82oOX6T6pJ/90dElH9DVrSH7s4u+G+KoT/iiHP1RoUU5JS
         y6ndMFskjMZFprSjjGTnOXdsj8qrbFjgs67v1uss1xRcOPxJHjpMjd5IUtmdhO/YAiya
         efRvMZeAGI/rvJ1BSS6aqu9FH51yATRtbCnqADPCH0AEj6NWPm5Yc4WneRWf9DWqbcPo
         6srX/1bGbT/68RWxurtk8gT4zfq739XfWUzGl9O7o0JAeDzzxuy8ty+4x8U5qqllKcRi
         sFXQ==
X-Forwarded-Encrypted: i=1; AJvYcCXvaMndhgb9Cq0SjhhjosvhvVBIANtguftoXuG3kNtcbiUxVLvzE8ynIGlKyMGQ1CZWKldi6kPW6t8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwO6SpAJWD1ixh9AQvK83BhSH4bA4toXCxcUHe1KpgTtLpKCFAH
	vkIE9SO77iA+HBuwMngBxQe6MPoSvz2enWKHflG4MqG5oO0Pm9Ikqd8Eq0v9l3As0xJsLjEWXiY
	8m3+xo79OuQbcsJFux8CeaafMMbpoYLQ=
X-Gm-Gg: ATEYQzyhGroAzStKck2GMZt2JasO17UN3k2aOXjts1TYbU3UPVi0eh41EZiEvtAUKmv
	sIi8TrkpAuK6uygb+/zOClLtvMtgepxJjbEYzm0H+HAtS7Qy+bLo45+1DaRiF54fdBrwcrfqTF+
	ZdMsVmuIhDjg0r7lzuSl5zQB+8S+83IxOLb21gdVeX9HZxTWqa+5x06pxue7v7MJ/TGsbL6MK9/
	pss0fhZuHWOEVz8ZBr0yqahBKsmNx69QNludU1GHgCYIRGAUc8EJbeJNTGAPTkpMUD2vf7f3cnc
	vCR2sb4+XWErxVGCqvchucu2vjRUgZyvCuZcvRZ1YV2HJke/abM=
X-Received: by 2002:a05:6871:3a28:b0:41c:4849:38b9 with SMTP id
 586e51a60fabf-41ca6d6a4c3mr2111306fac.5.1774448164335; Wed, 25 Mar 2026
 07:16:04 -0700 (PDT)
MIME-Version: 1.0
References: <20260325100803.6640-1-roger.pau@citrix.com> <20260325100803.6640-2-roger.pau@citrix.com>
 <ab36ce57-2067-4f1a-8384-403e015732dd@suse.com>
In-Reply-To: <ab36ce57-2067-4f1a-8384-403e015732dd@suse.com>
From: Ayden Bottos <aydenbottos12@gmail.com>
Date: Thu, 26 Mar 2026 01:15:52 +1100
X-Gm-Features: AQROBzBfCfuizWLiShRP0VGdIuXL2zuUtpdad1ADypykvE1mouKdJNmF1GNiB5Q
Message-ID: <CAMAzJ6GmqZpwCCnVh3nk4u0ddwtJCiF9DbdmP=ybsm1F3f2_tA@mail.gmail.com>
Subject: Re: [PATCH 1/2] xen/mm: don't unconditionally clear PGC_need_scrub in alloc_heap_pages()
To: Jan Beulich <jbeulich@suse.com>
Cc: Roger Pau Monne <roger.pau@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	Anthony PERARD <anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, 
	Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-16d1c6/1774448166-B30951C2-E9C2566E/0/0
X-purgate-type: clean
X-purgate-size: 3015
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,mail.gmail.com:mid];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[aydenbottos12@gmail.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:roger.pau@citrix.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[aydenbottos12@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: A778E32727F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This looks good to me. I would also add a brief comment in mm.h to
make the contract clearer for future callers: MEMF_keep_scrub is an
internal allocator flag and only valid together with MEMF_no_scrub.

On Thu, Mar 26, 2026 at 12:37=E2=80=AFAM Jan Beulich <jbeulich@suse.com> wr=
ote:
>
> On 25.03.2026 11:08, Roger Pau Monne wrote:
> > alloc_heap_pages() will unconditionally clear PGC_need_scrub, even when
> > MEMF_no_scrub is requested.  This is kind of expected as otherwise some
> > callers will assert on seeing non-expected flags set on the count_info
> > field.
> >
> > Introduce a new MEMF bit to signal to alloc_heap_pages() that non-scrub=
bed
> > pages should keep the PGC_need_scrub bit set. This fixes returning dirt=
y
> > pages from alloc_domheap_pages() without the PGC_need_scrub bit set for
> > populate_physmap() to consume.
> >
> > With the above change alloc_domheap_pages() needs an adjustment to cope
> > with allocated pages possibly having the PGC_need_scrub set.
> >
> > Fixes: 83a784a15b47 ("xen/mm: allow deferred scrub of physmap populate =
allocated pages")
> > Reported-by: Ayden Bottos <aydenbottos12@gmail.com>
> > Signed-off-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
>
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> with one nit (minor request) at the bottom.
>
> > ---
> > This issue was initially reported to the Xen Security Team, and it did =
turn
> > out to not require an XSA only because the code hasn't been part of any
> > release, otherwise an XSA would have been issued.
> >
> > The Security Team would like to thanks Ayden for the prompt report.
> >
> > In the scrubbing loop in alloc_heap_pages() i should better be unsigned
> > long.
>
> This issue is wider than just that function. As long as MAX_ORDER <=3D BI=
TS_PER_INT,
> I think we could have all such loops consistently use unsigned int induct=
ion
> variables. But of course switching to unsigned long would be okay as well=
, just
> perhaps a little less efficient on (at least) x86. My main wish would be =
for all
> of those variables to be consistent in type (and hence all involved liter=
al
> number suffixes also being consistently U or UL).
>
> > --- a/xen/include/xen/mm.h
> > +++ b/xen/include/xen/mm.h
> > @@ -208,6 +208,8 @@ struct npfec {
> >  #define  MEMF_no_refcount (1U<<_MEMF_no_refcount)
> >  #define _MEMF_populate_on_demand 1
> >  #define  MEMF_populate_on_demand (1U<<_MEMF_populate_on_demand)
> > +#define _MEMF_keep_scrub  2
> > +#define  MEMF_keep_scrub  (1U<<_MEMF_keep_scrub)
> >  #define _MEMF_no_dma      3
> >  #define  MEMF_no_dma      (1U<<_MEMF_no_dma)
> >  #define _MEMF_exact_node  4
>
> Irrespective of all the similar issues in surrounding code, may I ask tha=
t << be
> surrounded by blanks in the new addition, to conform to ./CODING_STYLE?
>
> As an aside, I wonder whether we really need the separate _MEMF_keep_scru=
b, but
> the same likely applies to most other _MEMF_*.
>
> Jan

