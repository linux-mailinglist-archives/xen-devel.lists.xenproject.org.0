Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CMKwJR64CmoB6QQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 18 May 2026 08:56:30 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D2AA567090
	for <lists+xen-devel@lfdr.de>; Mon, 18 May 2026 08:56:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1311537.1581652 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wOrtY-0000uo-UO; Mon, 18 May 2026 06:56:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1311537.1581652; Mon, 18 May 2026 06:56:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wOrtY-0000sA-Re; Mon, 18 May 2026 06:56:08 +0000
Received: by outflank-mailman (input) for mailman id 1311537;
 Mon, 18 May 2026 06:56:07 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <xakep.amatop@gmail.com>) id 1wOrtX-0000s4-MQ
 for xen-devel@lists.xenproject.org; Mon, 18 May 2026 06:56:07 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wOrtX-00H0RV-2e
 for xen-devel@lists.xenproject.org; Mon, 18 May 2026 08:56:07 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 6a0ab800-5cb7-0a2a0a5109dd-0a2a4504ca0e-28
 for <xen-devel@lists.xenproject.org>; Mon, 18 May 2026 08:56:06 +0200
Received: from [209.85.208.180] (helo=mail-lj1-f180.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 6a0ab752-1dec-0a2a45040019-d155d0b4d1e2-3
 for <xen-devel@lists.xenproject.org>; Mon, 18 May 2026 08:53:06 +0200
Received: by mail-lj1-f180.google.com with SMTP id
 38308e7fff4ca-394095009beso17595171fa.3
 for <xen-devel@lists.xenproject.org>; Sun, 17 May 2026 23:53:06 -0700 (PDT)
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
ARC-Seal: i=1; a=rsa-sha256; t=1779087186; cv=none;
        d=google.com; s=arc-20240605;
        b=foL67ptgJLg6Ifwwg9cfZF4M/9i+j/EACLe35ri40LPJzWpFp8SFsPQ4vcAAhmew9B
         91MgP1jnamCcaCKtaiZT7OmrmIymN+kkl2SdTK12XoczkfiiEmxJE8K8XUWnGUSX+bl7
         mrs30vkWWnhMjxGFS37VyEx6oEDMXHP8YBr8Zry7stF05PRhBBq0qkWu0lsk4vN/nThP
         CVuRZ4buIE+/Hzqd8XW+V6mkl91eHs7nM8WqOc26TiUJOrpFBH1zi0hCiNTSEgTDaj0D
         E+YlE0Xov6uxvtpzvQQ666Hj+XW0KyApG0/I90HV62hHT7gHU5BwtQ63Xko0VtghBKP7
         43sA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=if3z/eZTD2NfGn5QkNSJkIjt8WzZVWKFhhOShdJzFDU=;
        fh=akXeQf5snvpCIpThYDrDR2mv1hFZob6mP8W1D1NQr7I=;
        b=MN5subxSiaQMUl3MQthgtRbtlt5U9QAm4RmArf9eSQbsXhvzVc3bdNzZFkLctEjBT8
         /9VPHPU1obOE4MqtkHzZjP31a4dyi7w3AXdImNNw/PK2rdWfNCsg2nTdXzHOFBL+YExu
         +3+KTwxLfAWheyc+TNpXMr691nDrkIWq93WElAXs0g+gpEkE4r90By6BhkfV7IldSVqz
         PipnVYT+FDzLIPiwy9bFuqrVOPwoIlhUwezF+COyD/ToHnJbGiahPD6HYuxgafEcqZ9u
         /VGakWbvogsuhSfQ8ZEPICA4+bkkoDPNQk/FuopcEoPgDstIEIYYecN3zzAwOOITPt98
         jrNQ==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779087186; x=1779691986; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=if3z/eZTD2NfGn5QkNSJkIjt8WzZVWKFhhOShdJzFDU=;
        b=jqxBewAF5u7o6d9EOD4J1KQeX8M90ibU9qSbYEMWyZUu3qD4G8GbQInKEqzUv+6kxF
         JObVRlBAtfRoxSZFOpq4+ToEnyNlMzWbPlGQPGwsd/FNw8yeMnzhdQ++xHaOhyV4Im87
         lKQmCFltzYr3udhXd4daDfNf5Z4AznC1SPgqEXFkpaI8BVUEtlbXIwuiv34XC9ZLiaOx
         V0Ga/JEjpe58/ziDRcmYIqQsfMA0Mg+zpfbHKVaW5AywyN+JuNxpPjFTPKDX8awz28ly
         KBnp/0/yLC+jDnoH2OPmeWFUqvHBcAaL7sq6W1RfMNhUC7OAxpl2Gw3Ze4Ffs2qlCwev
         VtLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779087186; x=1779691986;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=if3z/eZTD2NfGn5QkNSJkIjt8WzZVWKFhhOShdJzFDU=;
        b=O/2NjvcuBgaZ/H5ULnQpkZjFpO6weARuWnyprUMe8QeI0x8a81baIoPn8Hpzy/Zg8G
         9O+t1FTlsmOF0Qfv8TqNmA9nT6ILRJdvu6IZSSBb+Hj3ZAhGJZk6BgEBVtwDrwn3s+YP
         w8bsqxwxFox9Aet+E7csVZ1h6IFc6lDR7syvOXcfbsY9jsYJ5bfIulfOmkfgjkl4r6Iw
         ra4FmGbLfN3gaLSmew3B8loFK6LHOqMYtqL/eCPMn1RSq3WuX1hc+1v/acE2gme/cR9M
         Ro3reAND0AMOzpocaMJdQz6RUQWIhUtBItjI+m/GC6JYSBC2iEws8ljRPOpnVn0yxRl9
         9m2A==
X-Gm-Message-State: AOJu0YxG46lRacjLaOFHlmRKIs/MluJnXbnorKfUueyaDHcern24zuGt
	c1Xli9khJaq39kbK/F/oguBAItzdMCvW/fkz4U3kVbOAvjBpBjnGDSRl2zLPiEwBtqSEh0mQXRa
	DcO+bEWH1TRKsVtZpgkvnLEPFjC6zHcs=
X-Gm-Gg: Acq92OHoVdCTgVKwqumFMHwwZgYavcCLmd37Vbkv39/cAuy7EgCnZJBRIT4XXCvFIIw
	59cbWPdCASEzL6lpWTEZatpdYWSGuZcjveM+dJo8e5CLhhVfzwFgLvaqOit2ZiWgM4/29PMiRYv
	V16A4WHy4Vm6qoIw+Edmbl2NPaol7DTRO4dr30/wpM+WTq+cMzhemJ0i0KuwSLQaAwwP02L6OBW
	t8hQZdgQ8mer7BeDLSbPqllK6ZOrp2cF5xam/mVEaHIfRVxY1OW3621NYRvLpS6mB8AwryPNUjg
	LIVP
X-Received: by 2002:a2e:bc83:0:b0:389:fa42:b266 with SMTP id
 38308e7fff4ca-39561a4fc57mr40645281fa.11.1779087185655; Sun, 17 May 2026
 23:53:05 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1778925998.git.mykola_kvach@epam.com> <0820f91dd0499e5f66f8961b5e27fe0a0ff9be35.1778925998.git.mykola_kvach@epam.com>
 <agq0VHVZDCKmMe0u@kraken>
In-Reply-To: <agq0VHVZDCKmMe0u@kraken>
From: Mykola Kvach <xakep.amatop@gmail.com>
Date: Mon, 18 May 2026 09:52:54 +0300
X-Gm-Features: AVHnY4KYcUnx3q16dhJDjq3tuGgE7Vn5k2ZtZ4inlzBM6DKf72XHMvqWQ-vwv7M
Message-ID: <CAGeoDV9UzM25qyLe4k13mMMtOpjDW1B8cA4AZHptpZ2pymAwvQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] xen/common: llc-coloring: reject empty color tokens
To: dmukhin@ford.com
Cc: xen-devel@lists.xenproject.org, Mykola Kvach <mykola_kvach@epam.com>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, 
	Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Stefano Stabellini <sstabellini@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-ebf023/1779087186-40B733FF-2BA4BFA0/0/0
X-purgate-type: clean
X-purgate-size: 2486
X-Rspamd-Queue-Id: 0D2AA567090
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,epam.com:email,ford.com:email,mail.gmail.com:mid];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[xakepamatop@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:dmukhin@ford.com,m:xen-devel@lists.xenproject.org,m:mykola_kvach@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[xakepamatop@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.976];
	RCPT_COUNT_SEVEN(0.00)[10];
	FREEMAIL_FROM(0.00)[gmail.com];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Action: no action

Hi Denis,

Thank you for the review.

On Mon, May 18, 2026 at 9:40=E2=80=AFAM <dmukhin@ford.com> wrote:
>
> On Sat, May 16, 2026 at 06:03:12PM +0300, Mykola Kvach wrote:
> > From: Mykola Kvach <mykola_kvach@epam.com>
> >
> > parse_color_config() currently accepts delimiters where a color value
> > is expected because simple_strtoul() returns zero without advancing the
> > input pointer. This makes strings such as ",2-6", "-10,19-20" or
> > "1,,2" look as if an empty value was color 0.
> >
> > Also add the missing newline to the DT color parsing error message.
> >
> > Fixes: 6cdea3444eaf ("xen/arm: add Dom0 cache coloring support")
> > Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
> > ---
> >  xen/common/llc-coloring.c | 13 ++++++++++---
> >  1 file changed, 10 insertions(+), 3 deletions(-)
> >
> > diff --git a/xen/common/llc-coloring.c b/xen/common/llc-coloring.c
> > index 2606cb0977..5d00d4b40e 100644
> > --- a/xen/common/llc-coloring.c
> > +++ b/xen/common/llc-coloring.c
> > @@ -64,14 +64,21 @@ static int __init parse_color_config(const char *bu=
f, unsigned int colors[],
> >
> >      while ( *s !=3D '\0' )
> >      {
> > +        const char *endp;
> >          unsigned int color, start, end;
> >
> > -        start =3D simple_strtoul(s, &s, 0);
> > +        start =3D simple_strtoul(s, &endp, 0);
> > +        if ( endp =3D=3D s )
> > +            goto fail;
> > +        s =3D endp;
> >
> >          if ( *s =3D=3D '-' )    /* Range */
> >          {
> >              s++;
> > -            end =3D simple_strtoul(s, &s, 0);
> > +            end =3D simple_strtoul(s, &endp, 0);
> > +            if ( endp =3D=3D s )
> > +                goto fail;
> > +            s =3D endp;
> >          }
> >          else                /* Single value */
> >              end =3D start;
> > @@ -334,7 +341,7 @@ int __init domain_set_llc_colors_from_str(struct do=
main *d, const char *str)
> >      err =3D parse_color_config(str, colors, max_nr_colors, &num_colors=
);
> >      if ( err )
> >      {
> > -        printk(XENLOG_ERR "Error parsing LLC color configuration");
> > +        printk(XENLOG_ERR "Error parsing LLC color configuration\n");
>
> While here, add domain ID to the printout similarly to
> `if ( !check_colors(..) )` processing below?

Yes, that makes sense.

If this patch goes forward, I will add the domain ID to this error
message in the next version.

Best regards,
Mykola

