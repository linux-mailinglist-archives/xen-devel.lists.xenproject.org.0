Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id fNq2N65UMWrKgwUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jun 2026 15:50:38 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DDB86901B6
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jun 2026 15:50:38 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=R8FnIlPy;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("google.com:s=arc-20240605:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1339257.1600426 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZUBT-000756-BY; Tue, 16 Jun 2026 13:50:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1339257.1600426; Tue, 16 Jun 2026 13:50:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZUBT-00072V-87; Tue, 16 Jun 2026 13:50:31 +0000
Received: by outflank-mailman (input) for mailman id 1339257;
 Tue, 16 Jun 2026 13:50:29 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <freddy77@gmail.com>) id 1wZUBR-0006yO-L9
 for xen-devel@lists.xenproject.org; Tue, 16 Jun 2026 13:50:29 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wZUBR-00620L-1i
 for xen-devel@lists.xenproject.org; Tue, 16 Jun 2026 15:50:29 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a31549c-5cb7-0a2a0a5109dd-0a2a4506d43a-34
 for <xen-devel@lists.xenproject.org>; Tue, 16 Jun 2026 15:50:29 +0200
Received: from [74.125.224.52] (helo=mail-yx1-f52.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a3154a3-7371-0a2a45060019-4a7de034e00a-3
 for <xen-devel@lists.xenproject.org>; Tue, 16 Jun 2026 15:50:28 +0200
Received: by mail-yx1-f52.google.com with SMTP id
 956f58d0204a3-662bcc30fafso624301d50.2
 for <xen-devel@lists.xenproject.org>; Tue, 16 Jun 2026 06:50:28 -0700 (PDT)
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
ARC-Seal: i=1; a=rsa-sha256; t=1781617827; cv=none;
        d=google.com; s=arc-20240605;
        b=h1u3VfqLOD8IdUpK0M94EGcn9367CN4ID5pUD2dr8QvH/1Rp5jL0SdiwArA1V+g3Jt
         hzMkc0fWJBwCtxmTxSpG0RgModMEKg+HHr1OIzCQUz0koO+rGvTsI7S8BlWWHPW4xLqI
         kGfxnFlJS9HIgYj/kAujjDGexgaUS403J7bOP4z+NMgSsmhJJaC/wy8KyyiEB0IdhcTE
         zqeGYXz4iJ4+wQZIDUrcsD0jw6RUw6TrbcEgvNTOQj5EtWY9wAXmcNoecybcVMKni8FT
         lWO/vqIFi7N+IftiiySNdMioEqprQPHObuWnZmCGhZG8pdegrV6YmqK2eKyKk8rr8uj/
         P8zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9Wk1fyCcm/KEhgWxilGQEp6mZ1sQfhLzr8u6Ky01KSA=;
        fh=oJMX+pG19iTQBQS8RwZ4ninwvsj1Gxox465NplAJP4k=;
        b=Trma1eSEvWz6zvW1wr0M/4usQefiGRo+CMgn+3QNzX+qWPNJzde2nD3sugggLMleZd
         7WalMhfC5zpgR+8j+xN9MC2oaObYpIhceooYF95fhPKaZx3sGpFhynlHk6lJTvFajGNc
         LB8QuAgaOfuTpDvAZS1WUTww56DsyWgfmsALGbMMbGI8HkcJOicwr/CZ9LP2W7xiJ7CD
         ubfnU1lok/TwU7dl4SCiS9C9cVI2GC2f1FeJWvPABzrBlryqD3RH0aI2HIUwlmgs2r++
         P/C/gi7PkZiMVeiNobdqj0I4fRwU06q6Cw3x0DcsZHWSjx3MdQd7PqrGeSP1TPZrTFCr
         GxRQ==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781617827; x=1782222627; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9Wk1fyCcm/KEhgWxilGQEp6mZ1sQfhLzr8u6Ky01KSA=;
        b=R8FnIlPyGCORqRomv8WTvK0FO1MXTiQGkcO4uAbpZfvK9N9Ixzxt56yAUNAQugzSLt
         QJw0gb4cichsNed6kTt3uffbL/HG85EGZy/JXuWN1sp2U8vZnGhyok5opRFRrnUU1uWC
         zrFW5QggeYWEkCfw3PeLRjQyjt9jaDqCA46+fz+oFDACj0mGJ0uTtLQGW+HLD6DXAm7A
         xkLt/DJ41aLqIdreM/Ii8fmf7eo5afJLNSF4Mw1BAVARNQdHKmRlux79FL/nXs77LMIe
         T2Y5TJYxQFuiu3HN+QfSb26wF4PhzykgRhb0pAf8pr5P9AEr60FbxiGMgFLe6Snk1DkX
         zGIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781617827; x=1782222627;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9Wk1fyCcm/KEhgWxilGQEp6mZ1sQfhLzr8u6Ky01KSA=;
        b=OMzthEVkf7yfq7xraCnCgPGVuXNSCK0YDfUeuTvyOkhGz6fXVS5JC/DbziUu2UyXBm
         1F+8SyGez99GlGRov0BttF/soffLZXg0NhlsBEQi8p1DWR/9p61V7yFDk0lm8IHD5wop
         BBIyi4Fs/nSEvsG4K3QHxyPtWLRxl+ku8psKj/MymQ7I/DwJ2kaQ8o+YGVHbKBQZ1R7r
         L08UUHIZ5xHTi5OXeUnZ+0dHICnjbE1syvEFdkXfvSi/NB521P2xXElQbpY9OkUruaiS
         aM4noHTXWZ2F677U8YTosBvHni5SGl7nUz45y1I8QYoOLdYLWVQxUK/3+3QuqW3rtdxP
         X7sw==
X-Forwarded-Encrypted: i=1; AFNElJ/W/pJU8doR/5UN3qQyBX6pjjw9XQoFOHjH1pmvOD15ZZYBQGpi83shyAol8vJ/Q5iabG4ehJ9O/Po=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwRSqOv/N4CvFI3REh8bnb/EyE5FzfUOmWzWgjkaTuM2XlS0LDS
	vZ+rb6E6JF0/XMXmT37TXyqIcKIspc4mLeR0o6lsqs8xGzFQIQpw5xhoOyetAjEFEoBYEP9Lza0
	8QJJLWnA5tEKAFBRP8IAk9grTJcFJpPc=
X-Gm-Gg: AfdE7ckf7OgRkfDjw7BLO0rzvouPxwGN0gxP8/89VpENh4XMrnxVkgPoOzDbghWpZrX
	9Dkatt61I/e22+etrzQX3HFXCVkrF6QUTOf3i1UcASSlEddEH+80N7NIHVURBWAhwwPqSmoUhZL
	h3+moFKy/TkjigCjTtGnFPlTzia6Yw3ypT+9KgHhw+KUj+5jJiW5+/jZdQjADXf+pK1AGfpn2mg
	qfpD/+eiPtsMdOdLFZSxD0zQvCcE0mNSn5sK0/N1+hGgIZpbBdrjeBb0IgurfmdOa8t3jdBVa/k
	ooMxmHB2YAkHUCca2IBSD9sh5CCe1yDJ2mkBDQ==
X-Received: by 2002:a05:690e:440d:b0:660:8e61:1a5d with SMTP id
 956f58d0204a3-662b606e5b9mr2092177d50.11.1781617827141; Tue, 16 Jun 2026
 06:50:27 -0700 (PDT)
MIME-Version: 1.0
References: <20260616101336.44009-1-frediano.ziglio@citrix.com>
 <20260616101336.44009-5-frediano.ziglio@citrix.com> <ajExivEwb88pcOxT@mail-itl>
 <f80e5c37-96db-4af5-9b9f-28f4ff457a72@citrix.com> <8b27a14e-865a-462e-a6dd-1f8323de5f43@suse.com>
 <a7d9c983-c264-4a90-ba17-b2a49bd85c18@citrix.com>
In-Reply-To: <a7d9c983-c264-4a90-ba17-b2a49bd85c18@citrix.com>
From: Frediano Ziglio <freddy77@gmail.com>
Date: Tue, 16 Jun 2026 14:50:15 +0100
X-Gm-Features: AVVi8CdrMR5Gf_6xo7c5qxYruS8LNlBA-v1EuPdb2OW7CjwbkQOzPzBDrjIQlDY
Message-ID: <CAHt6W4dLpSVz2P_7OgP9H-19jRpAd+km_1ep_VefR-Ku-u2MBQ@mail.gmail.com>
Subject: Re: [PATCH v3 4/4] x86: Split .init section to satisfy UEFI CA memory mitigation
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Jan Beulich <jbeulich@suse.com>, 
	=?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?= <marmarek@invisiblethingslab.com>, 
	xen-devel@lists.xenproject.org, Frediano Ziglio <frediano.ziglio@cloud.com>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Teddy Astie <teddy.astie@vates.tech>, Frediano Ziglio <frediano.ziglio@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-16d1c6/1781617828-87B7DD75-054EA7C5/0/0
X-purgate-type: clean
X-purgate-size: 3002
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:jbeulich@suse.com,m:marmarek@invisiblethingslab.com,m:xen-devel@lists.xenproject.org,m:frediano.ziglio@cloud.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:frediano.ziglio@citrix.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,mail.gmail.com:mid,citrix.com:email,invisiblethingslab.com:email];
	FORGED_SENDER(0.00)[freddy77@gmail.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[freddy77@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3DDB86901B6

On Tue, 16 Jun 2026 at 13:40, Andrew Cooper <andrew.cooper3@citrix.com> wro=
te:
>
> On 16/06/2026 1:30 pm, Jan Beulich wrote:
> > On 16.06.2026 13:29, Andrew Cooper wrote:
> >> On 16/06/2026 12:20 pm, Marek Marczykowski-G=C3=B3recki wrote:
> >>> On Tue, Jun 16, 2026 at 11:13:36AM +0100, Frediano Ziglio wrote:
> >>>> From: Frediano Ziglio <frediano.ziglio@cloud.com>
> >>>>
> >>>> Currently .init section is both writeable and executable, split data=
 and code
> >>>> to have 2 sections satisfying W^X rule.
> >>>>
> >>>> It is a requirement for NX_COMPAT so the PE can be loaded with W^X p=
erms
> >>>> in the pagetables.
> >>>>
> >>>> NX_COMPAT is a requirement from shim-review,
> >>>> https://github.com/rhboot/shim-review#do-you-have-the-nx-bit-set-in-=
your-shim-if-so-is-your-entire-boot-stack-nx-compatible-and-what-testing-ha=
ve-you-done-to-ensure-such-compatibility
> >>>>
> >>>> Signed-off-by: Frediano Ziglio <frediano.ziglio@citrix.com>
> >>> Acked-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingsla=
b.com>
> >>>
> >>> Is that the last piece necessary to satisfy the NX_COMPAT requirement=
? If
> >>> so, I suppose a subsequent patch should actually set the
> >>> IMAGE_DLLCHARACTERISTICS_NX_COMPAT bit (IIUC ld --nxcompat option), r=
ight?

At the moment we don't have downstream patches changing the nxcompat
specifically. Recent toolchains combinations are setting that flag
automatically.

> >> We need to satisfy everything in
> >> https://github.com/xenserver/xen.pg/blob/XS-9/patches/correct-sections=
-permissions.patch
> >>
> >> .reloc needs to be non-discardable and writeable.
> > Writable? Why?
>
> Because we take fatal pagefaults against it when it's really read-only.
>
> But as for why, I'll have to defer that to Frediano/Ross who did the
> work originally.
>

Wait, there's a bit of confusion. The .reloc section needs to be
non-discardable but read-only is fine, it's the .rodata section that
has to be writable. The reason is that some variables are "read
mostly" or "writable during init". This is consistent with what the
script is doing.

> >
> >>   This will require a very recent binutils and a patch (series?) from =
Jan.
> > Seeing that no patch had been submitted so far, I recently added this t=
o my
> > todo list, yes. But really I was hoping that someone else would make th=
e
> > small change that I expect is going to be needed.
>
> If you can explain what change is needed then maybe someone else can do i=
t.
>
> But right now, all I know is it's a new binutils and "something".
>
> ~Andrew

The patch was not submitted as similar patches were rejected as too
"hacky" and instead was suggested to have binutils changes. On the
other hand, former binutils must continue to "work" even if they
create wrong output. So instead of having to wait 5/6 years so that
all Xen supported binutils have the features we need we have that
patch in our series.

Frediano

