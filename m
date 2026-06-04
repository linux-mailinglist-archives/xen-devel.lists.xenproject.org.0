Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id kPsEOK2RIWpPJAEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 04 Jun 2026 16:54:37 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BB416411A6
	for <lists+xen-devel@lfdr.de>; Thu, 04 Jun 2026 16:54:37 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=UjmZdMyN;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("google.com:s=arc-20240605:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1327998.1592663 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wV9Sh-00013A-VI; Thu, 04 Jun 2026 14:54:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1327998.1592663; Thu, 04 Jun 2026 14:54:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wV9Sh-000110-Ot; Thu, 04 Jun 2026 14:54:23 +0000
Received: by outflank-mailman (input) for mailman id 1327998;
 Thu, 04 Jun 2026 14:53:50 +0000
Received: from [195.190.135.10] (helo=mx.expurgate.net)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <freddy77@gmail.com>) id 1wV9SA-0000xw-8S
 for xen-devel@lists.xenproject.org; Thu, 04 Jun 2026 14:53:50 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wV9S8-00207V-Kd
 for xen-devel@lists.xenproject.org; Thu, 04 Jun 2026 16:53:48 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a219173-5cb7-0a2a0a5109dd-0a2a4508ae86-20
 for <xen-devel@lists.xenproject.org>; Thu, 04 Jun 2026 16:53:48 +0200
Received: from [74.125.224.43] (helo=mail-yx1-f43.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a21917b-63b5-0a2a45080019-4a7de02be523-3
 for <xen-devel@lists.xenproject.org>; Thu, 04 Jun 2026 16:53:48 +0200
Received: by mail-yx1-f43.google.com with SMTP id
 956f58d0204a3-66077c46c5cso829861d50.1
 for <xen-devel@lists.xenproject.org>; Thu, 04 Jun 2026 07:53:48 -0700 (PDT)
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
ARC-Seal: i=1; a=rsa-sha256; t=1780584827; cv=none;
        d=google.com; s=arc-20240605;
        b=QDFhCY6zO8w5A80Yu7eOs9ZuHM2MwJ2Ae4rI5QIkcD16tKaFpesXoenBd2cQT8iaKO
         P5WZZQqlENodxlAqraE21rkXfS0e+BE5BUnYKwn4+gkKc5QUxGL756+d8KQGPUHH/a1Y
         wwp1z4d3LULqUlbfqL67ogTp/hj3gciMHv7h1PCpDqG3h+oHUs1pIMRbpwH0I5tSbrbp
         VOKIx/ReAbOwleoFggV7KVOaAO18Qv3TE7zUMlrTr28ojsgMpCtg64iA/VflXOXgjEHa
         wHIvsM+6Dc+UheJZmp1JNw8pnbEI+aIiVST+reslXT4mh8HnMPtKvjb4FfYVS7f+qe6O
         sZ0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=IkBbANetMCxqghNRXbWF8j+PjDLKAZbWvRSqS5GrfpU=;
        fh=38FPawrv/CpM0hOVM3+pacaNsP8K3Kcq1eyRmzZWXeE=;
        b=FqEeFb/gdzsuldwviqmjpCTENFQNOkJC3bngwGJII69tPVg77wKEnHcJ8XzUmSw/ak
         pvbUSmueZRutaDakiCqWoe9LP+SBQcqv2yMhcDrZhj4W4bZLPpi/RQHlpIOsSUmHtPhK
         NFDchcXaprqfa6NKXJ+UfJrLeiQTWXDJH87kRoaXMR+jiFguloh83ZatqxgUUD3sqAr5
         hZEyCuFYQYNTNPGr8FI9tt5jSKuJwCocv/+2r0imZRnBUN5SoZ1tdSp/66nkKMOYnB0n
         AxoLqmYzFt5hwC+2ujDCvMpPQYOjRT0gIuSdsgdpt0hbPq8gIMqA0rQ3qUtN9HrQbjHb
         YEqg==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780584827; x=1781189627; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=IkBbANetMCxqghNRXbWF8j+PjDLKAZbWvRSqS5GrfpU=;
        b=UjmZdMyNU+7sA+PBzs2vVgHiCNfpXEM2R8qexP3qomGhuBGod9PP3yxMqHcQYKOuOM
         PkcpXP6cG9AuakKnktNdc1IyzU0G3uIO2JaBZ//e9PRnh7CYYi+TtRA9FF6W/smOxaI1
         6/5NlIZDMd3Nbv+35S2WAoU37AonQJB4TnjdxJZ6TIw0WzgvDkPYDgIyAD0RsoXYYoln
         DUfFXkh2pW/7LBjKYTHWINLy5XT66kuTqSB2nKwdiye8bOkjdiKXscahYGcJz9Fizvs7
         d7jrFR4CHSEz4DqiMfmQGixCdpNOSvYo0ZK+Ban8aMEvte/MkcOTPPH13SRBPXa5t/Ss
         AAbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780584827; x=1781189627;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IkBbANetMCxqghNRXbWF8j+PjDLKAZbWvRSqS5GrfpU=;
        b=Ycja+rBYAAzahLXExRQ+Gyr362Pen1ZtX6tHIHlQtyR0XtkmBgwYYbXtpGMMQWtySJ
         rtr0egK3BCUGdkcy/E53t66soTkx/rUAldIvrW7u3vsDNvzU63jBtMeCq89hglSmD4Sh
         wcjDMW17y4ikJ1332gBypTvk1SOYD7TdN4hyq7ugyYDcqMTdQEbhILlBI9gwzpSiLW5e
         Dvgi3jAF55Rzhgd5Dm/iU2igRe4wKPqWgxvvNL85GMxYTjdSbxcVJpkOW5Z1a0fPZ/Gd
         FM4AdHaezgdS0INtBhtAhCI4UjYdw+1/2FZ9s5AV75X5OivtFTcpRSsv7MgfYo0ORenT
         Xbfw==
X-Forwarded-Encrypted: i=1; AFNElJ+e2UgQ+w5DAOdY23QX3Faiktgt61tv4QbHkYzF6wusWSXkY2LoZZg/u2WF0KBDneNacGvTi3P6L3A=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxTEZ0Ow+TATujPiOXfbFOi0fWidaUR+NVg0hNMG33YGy5G0582
	0aSIevbUyYQUrSEj97XpA1eM9KoAGis9cl8faFPcCbteS8wUHmXABDR25onq0AI/2Obifcv6Y0+
	C8Yh7ZjTgVwTgh6zOdN/K1K60MxYonK4=
X-Gm-Gg: Acq92OEHZEdgXgSta32JcTswwRQwyRfKjBBMNyAMPTQIAsuXB0LZCHXVOc8u+odN219
	7zQFiPbk8CGx7WyCapcpc59evRUdZAKQlALuVFXIAQIEgBSqcbb6f5Md2QI7BnUY8SOjDvLeWaJ
	Fwc6XX2+OGemMZATgg86H5uGEKxfUpJOmtJ439en7i1ZHnpmVuujUjgeYS/AhdkzBy6QvS/PrHy
	J/b/FnG35niJ5BmoI1j2KHikJufyK1iYJ+fyXDtEtZ+JjD86a9cVy2YWqbviw3cC4Kq7VgN1YFQ
	+ir9dVQqDKHw9hjis826Qb2ISG4MXxifLotRBgkhIr1cViS9
X-Received: by 2002:a05:690e:2c1:b0:65e:40ef:dc8f with SMTP id
 956f58d0204a3-660dc561a19mr5663973d50.51.1780584826590; Thu, 04 Jun 2026
 07:53:46 -0700 (PDT)
MIME-Version: 1.0
References: <20260529153531.1341542-1-frediano.ziglio@cloud.com>
 <20260529153531.1341542-4-frediano.ziglio@cloud.com> <35a67929-aaef-4b1f-8370-7dcdf096fbb1@suse.com>
 <CAHt6W4fXPy9o2VzO-E+PkNv+VA2FcRPTzJzH6gAyqwXuV6ytmg@mail.gmail.com> <9859bb92-d532-4169-9b0d-1d7543491d6c@citrix.com>
In-Reply-To: <9859bb92-d532-4169-9b0d-1d7543491d6c@citrix.com>
From: Frediano Ziglio <freddy77@gmail.com>
Date: Thu, 4 Jun 2026 15:53:35 +0100
X-Gm-Features: AVHnY4J1C9YtvvpEyl4N1MJZBOQYY659UZlZ_wmMOY92l3JaYb1trP4K5b1CeX0
Message-ID: <CAHt6W4eojHTfRU8mmLDn=c2USXt4_=seRtu08wCvanUQ5O0oog@mail.gmail.com>
Subject: Re: [PATCH 3/6] x86/efi: discard .text.header for PE binary
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Teddy Astie <teddy.astie@vates.tech>, 
	=?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?= <marmarek@invisiblethingslab.com>, 
	xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
X-purgate-ID: tlsNG-c1860d/1780584828-BD76EDB1-F4D3F243/0/0
X-purgate-type: clean
X-purgate-size: 1674
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:jbeulich@suse.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:marmarek@invisiblethingslab.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,suse.com:email,mail.gmail.com:mid];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER(0.00)[freddy77@gmail.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[freddy77@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4BB416411A6

On Thu, 4 Jun 2026 at 15:31, Andrew Cooper <andrew.cooper3@citrix.com> wrote:
>
> On 04/06/2026 11:28 am, Frediano Ziglio wrote:
> > On Tue, 2 Jun 2026 at 13:15, Jan Beulich <jbeulich@suse.com> wrote:
> >>> --- a/xen/arch/x86/xen.lds.S
> >>> +++ b/xen/arch/x86/xen.lds.S
> >>> @@ -57,6 +57,9 @@ SECTIONS
> >>>    __image_base__ = .;
> >>>  #else
> >>>    . = __image_base__;
> >>> +  /DISCARD/ : {
> >>> +    *(.text.header)
> >>> +  }
> >>>  #endif
> >> We already have DISCARD_SECTIONS, so I think it needs clarifying why that
> >> can't be used / extended.
> >>
> > Yes, this can be done that way. Roger, do you agree on this ?
>
> You'll need to add a general ARCH_DISCARD_SECTIONS, and have x86 fill in
> {ELF,EFI}_DISCARD_SECTIONS conditionally.
>

I think binutils simply ignore sections not present so this is not
necessary. I'll test it.

> Also you need to fold this hunk.
>
> diff --git a/docs/hypervisor-guide/x86/how-xen-boots.rst b/docs/hypervisor-guide/x86/how-xen-boots.rst
> index 8b3229005cca..b6d852050a0c 100644
> --- a/docs/hypervisor-guide/x86/how-xen-boots.rst
> +++ b/docs/hypervisor-guide/x86/how-xen-boots.rst
> @@ -82,12 +82,6 @@ When a PEI-capable toolchain is found, the objects are linked together and a
>  PE32+ binary is created.  It can be run directly from the EFI shell, and has
>  ``efi_start`` as its entry symbol.
>
> -.. note::
> -
> -   xen.efi does contain all MB1/MB2/PVH tags included in the rest of the
> -   build.  However, entry via anything other than the EFI64 protocol is
> -   unsupported, and won't work.
> -
>
>  Boot
>  ----
>

Sure, thanks

>
>
> ~Andrew

Frediano

