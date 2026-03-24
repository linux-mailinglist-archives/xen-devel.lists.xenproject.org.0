Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MFxrHBrBwmmjlQQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 24 Mar 2026 17:51:38 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CE976319694
	for <lists+xen-devel@lfdr.de>; Tue, 24 Mar 2026 17:51:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1261163.1554274 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w54yN-0007Fp-AB; Tue, 24 Mar 2026 16:51:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1261163.1554274; Tue, 24 Mar 2026 16:51:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w54yN-0007Dr-70; Tue, 24 Mar 2026 16:51:19 +0000
Received: by outflank-mailman (input) for mailman id 1261163;
 Tue, 24 Mar 2026 16:51:17 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <xakep.amatop@gmail.com>) id 1w54yL-0007Dl-Fg
 for xen-devel@lists.xenproject.org; Tue, 24 Mar 2026 16:51:17 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w54yK-00DrGC-AF
 for xen-devel@lists.xenproject.org; Tue, 24 Mar 2026 17:51:16 +0100
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 69c2c0f0-5cb7-0a2a0a5109dd-0a2a45048ece-28
 for <xen-devel@lists.xenproject.org>; Tue, 24 Mar 2026 17:51:16 +0100
Received: from [209.85.208.169] (helo=mail-lj1-f169.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <xakep.amatop@gmail.com>)
 id 69c2c103-c823-0a2a45040019-d155d0a9e905-3
 for <xen-devel@lists.xenproject.org>; Tue, 24 Mar 2026 17:51:16 +0100
Received: by mail-lj1-f169.google.com with SMTP id
 38308e7fff4ca-38c26612508so11505461fa.3
 for <xen-devel@lists.xenproject.org>; Tue, 24 Mar 2026 09:51:16 -0700 (PDT)
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
ARC-Seal: i=1; a=rsa-sha256; t=1774371075; cv=none;
        d=google.com; s=arc-20240605;
        b=IgoiThrMJ5Z6SnmaaCXARBAvVgILNXHlKxrTCNZ2D5MYt2+lguJLLExq38JroBRSz6
         bk/C/MbyNTgpBhbSt/icsTleXb4+6Gs18iaGVJY42+0bb4dIQzmQl2jyiWDXNm7Z82mk
         YOnhkkxx1LYAVgyrUxlgYhoWNeXBWHJPsSDY1360XZVpiu9QfwX/fQ6y2FpMdeorun+K
         +HIZx8uRSIPitYAqH3JIOY6RAGMZuI+Q97GlaAs5+1AvgE/nivcrNv6JbM1u6Ja6wYIT
         iB8XzTXOYRpMeDhZh7YeKFYeNRq+nTAMuYFY39SDkyJ+y0ca0G3B02uCoKe89z/63927
         9Mjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=NIbM3vXcIWf1SnXsthNSF6HQboFq04VNp1Ij5u/rO4c=;
        fh=SmKtTP+//FoTguQaCWAbd7P0/DDZIbvi8at9iFw3jIU=;
        b=ZyYUpCt5w4tp9pg9RzD4g9p4QsTugrZzUdiJnpcjl+Aqx3MwWYaWP7Nmpoo5vXrv+0
         b8HEySmLYw/NLTfxAtKTd3qtju4e0aQwtsyTHQPzjfb6AOx8lyOYWfMaKguHvltR7XDI
         PcoTCJCNR3YRMOc/bW9sUOF6OgsA975Ce7vtZdO9foZrhqdqJwtyK0fMh5zGdY5DHBrM
         UaDer1UiO2Su+XVHovOxm6O2WLgnYGm6WuJ0RpIvQpoo4dI7Cb10+93EYyuPavSxKcn1
         0Zw4zSjR6sxaqFEFVPQcx3qgIrH8Vcz1831tpTa4LBR3DP2kNX+MTtZMo9/412m7Gkh4
         CGaw==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774371075; x=1774975875; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NIbM3vXcIWf1SnXsthNSF6HQboFq04VNp1Ij5u/rO4c=;
        b=K6Vs+e2uEC+9USiGPc0mPDGyF6Dhqf2xwfir8GcJGFFiB61KzUx3+q3Fy9VsMoZlyT
         OZndD90n+Oneo8uYPJ+9cAvxAiQeFh7fiocO2MjIp28LK637yuAAk1ixwrx4TAc7Yq5P
         kJqt4CVeU/JzjEWlQwbNv2ETcYWVt+PK1WZOm0yZfyqerjyWOpWHqYrLR/2S97n+ugcm
         fHkzoAT0gspsOn6utXhX8kKS59ZqD4W4e11PUQZM7haYsTG0gy5K6r4sh85JExplEaFt
         t6Y5NrXPzEMmBQmMy5xT3+vmVfLt7SDRNGkkjsJ3+5r6tyZvcV10FCL1xsf2hpYjExn7
         Vn0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774371075; x=1774975875;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NIbM3vXcIWf1SnXsthNSF6HQboFq04VNp1Ij5u/rO4c=;
        b=OoNy3OEOycpk+OvOVMhbkBI5jDODVUTd5jziFpTxE0iV/x7AHvdHkl3/Rcl+SiqWKo
         NMc/Ic964ivjXT0fi/p7gQ4wqPUvVVQWSQ/Wg594xM+HmJPAK/b7VuIaj6+oV2DTGVjE
         1D4ZiLRVuHtj9Og5W3fG5saD1kDGfZtHF+fuQDS8N6v4u1vwfBoI4B+W7INjAOdp+9ti
         Rc2maKC/Rzy39T3n1JN8RKgbRFWVvxlVuoTM69l4Q+u42utoHhITCWaz+Z0uiB0Ln1ap
         0euT6Xpowj1vujbCWQFk5Bc1FPpvHcJISn74AOH6cLbOHBJkvd8eCv+SygtYrZqvYgJ9
         rnfg==
X-Gm-Message-State: AOJu0YyUQXV/kGF/Z1WS6rZ9D15E2FWkzxQjTlI/AFCav63cYmULU9Cu
	Hg9c0sXl92vTA4ZHWQf50vNH852CeLbRk+XiJFqa7MgNv7R1vNFmHIh3cb6tbDoIL/9iMLhssE9
	3PFeNLBep573S0HOkPN7bIUbVjvFSZ2o=
X-Gm-Gg: ATEYQzx0PAH1fXLDLtpl6UuCD04gnJmefOB48SOQW1PHmgHISPT1DMCD9VUAbP7F6ti
	q+3gDUt5PHdine8XEzpcDsYb9vDbh7NJHlP94ybodwtGNJXpxcsr9Zq4tcY1hyuguwaXbby3CdS
	abtYkCUiMdC9vy5sLSRg9+q9zrW/GPia+iKn4pnWUzkNhBYrQzQ3Dr2iCuMS5zAjTIYxvSD9qpE
	oHv85Sd9a06NdYn1uvneMLHtWrGXyuxP9MhePk1WnC8NaNspoaJhliZo2QuBlOvZ3IDEALNkXXc
	Bja3uA==
X-Received: by 2002:a05:6512:2248:b0:5a1:49a0:af35 with SMTP id
 2adb3069b0e04-5a29b98116bmr110802e87.10.1774371074995; Tue, 24 Mar 2026
 09:51:14 -0700 (PDT)
MIME-Version: 1.0
References: <63284ab7-8e38-4448-a789-1b9c23c4d95c@suse.com> <97d6ba6c-4ffe-4e1b-814a-d51a0bcf363e@suse.com>
In-Reply-To: <97d6ba6c-4ffe-4e1b-814a-d51a0bcf363e@suse.com>
From: Mykola Kvach <xakep.amatop@gmail.com>
Date: Tue, 24 Mar 2026 18:51:03 +0200
X-Gm-Features: AaiRm51n-bpF7dF2mfbp-jdK0iDUcrImnPc7hI_O7ptjsmqqP3zbMEDXpAKOxSs
Message-ID: <CAGeoDV-zPfn5iDN6gcwq2bA5vcG0SUsgZbQufDWpux1rugXFEg@mail.gmail.com>
Subject: Re: [PATCH 2/5] llc-coloring: improve checking while parsing
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>, 
	Stefano Stabellini <sstabellini@kernel.org>, Anthony PERARD <anthony.perard@vates.tech>, 
	Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Kamil Frankowicz <kamil.frankowicz@cert.pl>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-ebf023/1774371076-BBA969D1-71353200/0/0
X-purgate-type: clean
X-purgate-size: 1849
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[cert.pl:email,mail.gmail.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:email,xen.org:url,patchew.org:url];
	TAGGED_FROM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[xakepamatop@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:julien@xen.org,m:sstabellini@kernel.org,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:roger.pau@citrix.com,m:kamil.frankowicz@cert.pl,s:lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[xakepamatop@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: CE976319694
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Mar 24, 2026 at 6:37=E2=80=AFPM Jan Beulich <jbeulich@suse.com> wro=
te:
>
> We can easily avoid the risk of wrapping UINT_MAX <-> 0 by applying a
> check against the compile-time-constant maximum number of colors.
>
> Additionally the overflow checks suffered from an off-by-1, as the parsed
> ranges are inclusive (e.g. end =3D=3D start being possible, requiring 1 a=
rray
> slot, while availability of 0 slots was checked in that case).
>
> Fixes: 6cdea3444eaf ("xen/arm: add Dom0 cache coloring support")
> Reported-by: Kamil Frankowicz <kamil.frankowicz@cert.pl>

For reference, I previously reported the UINT_MAX wraparound aspect here [1=
]
and later also here [2]. The off-by-1 in the inclusive-range accounting loo=
ks
like a separate issue.

Those threads also mention a few other related corner cases.


Best regards,
Mykola


[1] https://patchew.org/Xen/20241217170637.233097-1-carlo.nonato@minervasys=
.tech/20241217170637.233097-5-carlo.nonato@minervasys.tech/#db5d6a67-61d9-4=
8d3-b6c4-213c1cbbda21@gmail.com
[2] https://lists.xen.org/archives/html/xen-devel/2026-01/msg00369.html

> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>
> --- a/xen/common/llc-coloring.c
> +++ b/xen/common/llc-coloring.c
> @@ -76,8 +76,9 @@ static int __init parse_color_config(con
>          else                /* Single value */
>              end =3D start;
>
> -        if ( start > end || (end - start) > (UINT_MAX - *num_colors) ||
> -             (*num_colors + (end - start)) >=3D max_num_colors )
> +        if ( end >=3D NR_LLC_COLORS || start > end ||
> +             (end - start) >=3D (UINT_MAX - *num_colors) ||
> +             (*num_colors + (end - start + 1)) >=3D max_num_colors )
>              return -EINVAL;
>
>          /* Colors are range checked in check_colors() */
>
>

