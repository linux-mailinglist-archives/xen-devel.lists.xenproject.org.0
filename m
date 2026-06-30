Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id bD5EIkWNQ2prbQoAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jun 2026 11:32:53 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 164A06E235F
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jun 2026 11:32:53 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=3mdeb.com header.s=ovhmo3617313-selector1 header.b=nm3NX4EH;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=none
Received: from list by lists.xenproject.org with outflank-mailman.1348577.1606305 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1weUpA-0005NS-OW; Tue, 30 Jun 2026 09:32:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1348577.1606305; Tue, 30 Jun 2026 09:32:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1weUpA-0005Kk-Lf; Tue, 30 Jun 2026 09:32:12 +0000
Received: by outflank-mailman (input) for mailman id 1348577;
 Tue, 30 Jun 2026 09:32:11 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <sergii.dmytruk@3mdeb.com>) id 1weUp8-0005Ke-49
 for xen-devel@lists.xenproject.org; Tue, 30 Jun 2026 09:32:11 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1weUp7-006TI3-10
 for xen-devel@lists.xenproject.org; Tue, 30 Jun 2026 11:32:09 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <sergii.dmytruk@3mdeb.com>)
 id 6a438d17-5cb7-0a2a0a5109dd-0a2a450189c0-6
 for <xen-devel@lists.xenproject.org>; Tue, 30 Jun 2026 11:32:08 +0200
Received: from [87.98.179.66] (helo=19.mo584.mail-out.ovh.net)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <sergii.dmytruk@3mdeb.com>)
 id 6a438d17-400f-0a2a45010019-5762b342b2a7-3
 for <xen-devel@lists.xenproject.org>; Tue, 30 Jun 2026 11:32:08 +0200
Received: from director11.ghost.mail-out.ovh.net (unknown [10.110.0.137])
 by mo584.mail-out.ovh.net (Postfix) with ESMTP id 4gqHwl3q9Gz8FPJ
 for <xen-devel@lists.xenproject.org>; Tue, 30 Jun 2026 09:32:07 +0000 (UTC)
Received: from ghost-submission-7d8d68f679-78tjw (unknown [10.111.174.145])
 by director11.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 92378C2A16;
 Tue, 30 Jun 2026 09:32:06 +0000 (UTC)
Received: from 3mdeb.com ([37.59.142.98])
 by ghost-submission-7d8d68f679-78tjw with ESMTPSA
 id 9wGuEhaNQ2pUcC0AIQpDtg
 (envelope-from <sergii.dmytruk@3mdeb.com>); Tue, 30 Jun 2026 09:32:06 +0000
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
X-OVh-ClientIp:176.111.183.249
Date: Tue, 30 Jun 2026 12:31:59 +0300
From: Sergii Dmytruk <sergii.dmytruk@3mdeb.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
	xen-devel@lists.xenproject.org, trenchboot-devel@googlegroups.com
Subject: Re: [PATCH v3 14/22] x86/boot: choose AP stack based on APIC ID
Message-ID: <akOND2rkKHLxvQmL@MjU3Nj>
References: <cover.1748611041.git.sergii.dmytruk@3mdeb.com>
 <16a5438f73a026d4db1a5340f599d4839c74fcc6.1748611041.git.sergii.dmytruk@3mdeb.com>
 <1483a375-9662-48b8-8bf2-8cc83386b068@suse.com>
 <akLvI_OJ8RjU_90S@MjU3Nj>
 <4e0585c5-1838-4193-ac92-37e2b9ebcd81@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4e0585c5-1838-4193-ac92-37e2b9ebcd81@suse.com>
x-ovh-tracer-id: 10166594685696878012
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: dmFkZTEeFO4yJxF6J+aOSNWedEqLUC38pgJwOQu4uftNm734UuX8MhDQRZd5UAfB24oz/JRvTlu9NBj65zp7l71ixbWm8T7ipN5EC+i2aEsVcoVZsVIQc0WbGRU6Z9cv3AMt/zoxYfExv39oCCd82gIeJZ7MX7+VdKMC2c61UbwmR/NJTMZNEp1S2R/uSfdqCIT9lmC+DVgnUJK9uYsT7m6wjfbIBl34nIrXoFRTFtnZJvWFnS3lDFhRpLfIImeqXz1bmpUF1kh3si58k6zhvcUm6U1R9NfEEPWfl/KXzVfZD+iOwg078kD/cv3PIAlOTTWh3lhJ48ISh7hVwNn3lBSZTB33IWrmOQkuv0vjZUp+RWSP7bYGtBZI1KlE7y5zeTSnPTsVdnkT5uioVxk0P8j30sOh3CebuwvTKG0usVJuYFOkLKnVCtvckAQvcvZprH41F9KJEUDae33H4KA7gLQQtBxJHWlYijO2hob/H9Pz4RpQt57gF6Wq04P0HTXcAY+ja9R+xzdHew6fxJI3S0i2O5eLETNHmNfGT5vFqw0NNbWcEwh1+hpVOvAKasQkUID9L0mupls0sj7xfizwqmA+kyEcqxXQb4nL2etD3f4cIujfbdSiLt/LVDsa8vzBqDBF5p/hGgccbyjYVnLz5P/PhNcTb9MxJWW3KMbYxs+ufnuNAA
DKIM-Signature: a=rsa-sha256; bh=HBAbJMQsAzXfsqFa9nsP27KQYE/Vu7gWSyc9Pea3C1Y=;
 c=relaxed/relaxed; d=3mdeb.com; h=From; s=ovhmo3617313-selector1;
 t=1782811927; v=1;
 b=nm3NX4EHeF35v9pGR48Ag9rRTTSfkjG7KAA7keUJ8hw3wCb5HakoXNAbGJaL6IYSX6kmTSdG
 2Xt8iOmUPSOZVBNgXP7GbJGGh9h2v+tv2gd2tYhAOv0uskh5vWQFbYn+AiMuVaOc1bsZecXqzCF
 +XKpm/heDa+UVVe1wtF29KY6SIxvUA1ajk1JY7kE3eVAH+4Jmn2igp6OTR7j24eG5CTBnftQNlF
 TLqC1Pv7ElwaWfiY9x8ADL/7hxWiqonyhHHtVqVRI6MhoDCmNucqdwU/89c2iN6GiDQa0hG1UqX
 HIFrN60uFcBtLPOdvAm7rv0mNBR+iKYV+KPjwEWujnEPQ==
X-purgate-ID: tlsNG-d62444/1782811928-838C81E0-01574683/0/0
X-purgate-type: clean
X-purgate-size: 2182
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.19 / 15.00];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[3mdeb.com:s=ovhmo3617313-selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,m:trenchboot-devel@googlegroups.com,s:lists@lfdr.de];
	DMARC_NA(0.00)[3mdeb.com];
	ARC_NA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[sergii.dmytruk@3mdeb.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[sergii.dmytruk@3mdeb.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[3mdeb.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[11]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 164A06E235F

On Tue, Jun 30, 2026 at 09:17:59AM +0200, Jan Beulich wrote:
> On 30.06.2026 00:18, Sergii Dmytruk wrote:
> > On Thu, Jan 22, 2026 at 04:52:36PM +0100, Jan Beulich wrote:
> >>> --- a/xen/arch/x86/boot/x86_64.S
> >>> +++ b/xen/arch/x86/boot/x86_64.S
> >>> @@ -15,7 +15,33 @@ ENTRY(__high_start)
> >>>          mov     $XEN_MINIMAL_CR4,%rcx
> >>>          mov     %rcx,%cr4
> >>>
> >>> -        mov     stack_start(%rip),%rsp
> >>> +        test    %ebx,%ebx
> >>> +        cmovz   stack_start(%rip), %rsp
> >>> +        jz      .L_stack_set
> >>> +
> >>> +        /* APs only: get stack base from APIC ID saved in %esp. */
> >>> +        mov     $-1, %rax
> >>
> >> Here and below 32-bit insn would do fine. However, ...
> >
> > Are all addresses guaraneed to be below 4 GiB?
>
> You use %rax as the loop induction variable, so there isn't any address
> in it? Plus you already use ...
>
> >>> +        lea     x86_cpu_to_apicid(%rip), %rcx
> >>> +1:
> >>> +        add     $1, %rax
> >>> +        cmp     $NR_CPUS, %eax
>
> ... as 32-bit insn here anyway.

But %rcx contains an address and it is added to %rax for `cmp` (quoted
below).  Also if an address can be larger than 4 GiB, REPNE SCASL will
have to be 64-bit which is incompatible with the lookup for a 32-bit
value (unless I'm missing an instruction form that takes 64-bit address
but compares 32-bit values).

> >>> +        jb      2f
> >>> +        hlt
> >>> +2:
> >>> +        cmp     %esp, (%rcx, %rax, 4)
> >>> +        jne     1b
> >>
> >> ... can't all of this be a simple REPNE SCASL?
> >
> > It can, but then can't have an upper bound, right?
>
> I fear I don't understand the question. REPNE SCASL scans at most %rcx
> slots, whatever %rcx is set to up front.

Right, ignore that, the source I used to look up details confused me
about terminating conditions.

> >> As to the upper bound of NR_CPUS, do we really need to look this far?
> >
> > Are you suggesting to use `max_cpus` instead?
>
> Whatever the dynamically determined upper bound is, yes.
>
> Jan

I guess that's `nr_cpu_ids` actually, `max_cpus` is a user parameter.

Regards,
Sergii

