Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 72D3A1C83B3
	for <lists+xen-devel@lfdr.de>; Thu,  7 May 2020 09:45:54 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jWbDc-00078Q-FF; Thu, 07 May 2020 07:45:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FcBF=6V=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1jWbDa-00078L-JS
 for xen-devel@lists.xenproject.org; Thu, 07 May 2020 07:45:18 +0000
X-Inumbo-ID: b1c1fe62-9036-11ea-ae69-bc764e2007e4
Received: from mail-wm1-x341.google.com (unknown [2a00:1450:4864:20::341])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b1c1fe62-9036-11ea-ae69-bc764e2007e4;
 Thu, 07 May 2020 07:45:17 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id m12so355260wmc.0
 for <xen-devel@lists.xenproject.org>; Thu, 07 May 2020 00:45:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:thread-index
 :content-language;
 bh=Q6iZqKK/iHuwFM/LAaovynXP4aAGFMqMvRLsceV5SNE=;
 b=A1kJ6z7nL8McT7QXfnekaDP4cqS6iADy1J922uglLxpRamYkQx8slWIphinkxbMwaO
 Jg7f/KYE92niYFxsbJWXXd408a3w1dm8V+EeQSaAz9/TfNQ0e4PRlE1IU+Mc5k1SizU1
 Re4eAcTgUKW9IiNdkabzjN7w4Fmaq41JRllcmECeRFxmW+pxfeeCiSkVe1VDRWIrkreW
 0TjgqI//tBRjdqFkzWAbZ3e4JCCEBfXJ72cA/R9T6E2hez2x+xLWVWlyCcfjOmb4XWUq
 S6/1MSpaiF/pEPH/fQwMsLr1w98mfAlQzFEr+Zoct/dS0AYktO/4tLb8n5A8J0gOJ7X9
 yiRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :thread-index:content-language;
 bh=Q6iZqKK/iHuwFM/LAaovynXP4aAGFMqMvRLsceV5SNE=;
 b=FVauDAJIVns1jjYsg2DtvqiVZ3kSJ/zuJnMiVDrS3m0nzr6SGJpMjZFCaxNAC1WlSC
 xc5z2xWmaZUS54xkaEKmXYxD7xJcC0XDX6JxLuql5S1pTITzoKbAfD29htD/wibRNIjo
 DMRjLrRqkunGqYlJXK8t6OhepFFxctjylCDr5MldOO8AwzNdRA5zRWh6QXfrwWf2VBZj
 El7/MiYQpdfNDFSpl7bYpc5Nmd4axOc/YvKyJ7LU+HwISX36dts04hrly7SDLmssLH4n
 luThwBcOwsUIRqEh2KkBruKVkirQ3hKR0TDsA2jfGloOHesPFGf7jm5yIWivMMx+SMje
 MDxA==
X-Gm-Message-State: AGi0PuYhbejhDs0oK017cBC/6FymqgPU5ZBA5H+3GzLxlILGZrGCf9kZ
 L0DFGH/YZ4fbSMzDUvv6w6U=
X-Google-Smtp-Source: APiQypKIcL3axkw4PeLPYkyKJ4jSmxuu6pWFtiZMdNZakOXtayNIgQugT7Cpk3nsDnPYswKBYjbIsA==
X-Received: by 2002:a7b:c5d4:: with SMTP id n20mr9217441wmk.92.1588837516753; 
 Thu, 07 May 2020 00:45:16 -0700 (PDT)
Received: from CBGR90WXYV0 ([54.239.6.185])
 by smtp.gmail.com with ESMTPSA id b22sm14760861wmj.1.2020.05.07.00.45.15
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 07 May 2020 00:45:16 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: "'Jan Beulich'" <jbeulich@suse.com>
References: <20200407173847.1595-1-paul@xen.org>
 <20200407173847.1595-2-paul@xen.org>
 <d5013c9d-b1a9-6139-a120-741332d6e086@suse.com>
 <009601d623c5$9547abc0$bfd70340$@xen.org>
 <63772836-3b3c-753a-18e5-d9fe3a6666a2@suse.com>
 <00ab01d62441$ef2630e0$cd7292a0$@xen.org>
 <4ac9fc33-393d-d550-c656-94814d8f5467@suse.com>
In-Reply-To: <4ac9fc33-393d-d550-c656-94814d8f5467@suse.com>
Subject: RE: [PATCH v2 1/5] xen/common: introduce a new framework for
 save/restore of 'domain' context
Date: Thu, 7 May 2020 08:45:14 +0100
Message-ID: <00ac01d62443$72c88140$585983c0$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQIOC3/NwyZzJjhdRz0oBcI7Is/lxwF9QIbqAnK/qAwCoq+JvwFlXK23AoxL9wsCIkLQPqfHOe9A
Content-Language: en-gb
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Reply-To: paul@xen.org
Cc: 'Stefano Stabellini' <sstabellini@kernel.org>,
 'Julien Grall' <julien@xen.org>, 'Wei Liu' <wl@xen.org>,
 'Andrew Cooper' <andrew.cooper3@citrix.com>,
 'Paul Durrant' <pdurrant@amazon.com>,
 'Ian Jackson' <ian.jackson@eu.citrix.com>,
 'George Dunlap' <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org,
 'Volodymyr Babchuk' <Volodymyr_Babchuk@epam.com>,
 =?utf-8?Q?'Roger_Pau_Monn=C3=A9'?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> -----Original Message-----
> From: Jan Beulich <jbeulich@suse.com>
> Sent: 07 May 2020 08:40
> To: paul@xen.org
> Cc: xen-devel@lists.xenproject.org; 'Paul Durrant' =
<pdurrant@amazon.com>; 'Andrew Cooper'
> <andrew.cooper3@citrix.com>; 'George Dunlap' =
<george.dunlap@citrix.com>; 'Ian Jackson'
> <ian.jackson@eu.citrix.com>; 'Julien Grall' <julien@xen.org>; 'Stefano =
Stabellini'
> <sstabellini@kernel.org>; 'Wei Liu' <wl@xen.org>; 'Volodymyr Babchuk' =
<Volodymyr_Babchuk@epam.com>;
> 'Roger Pau Monn=C3=A9' <roger.pau@citrix.com>
> Subject: Re: [PATCH v2 1/5] xen/common: introduce a new framework for =
save/restore of 'domain' context
>=20
> On 07.05.2020 09:34, Paul Durrant wrote:
> >> From: Jan Beulich <jbeulich@suse.com>
> >> Sent: 07 May 2020 08:22
> >>
> >> On 06.05.2020 18:44, Paul Durrant wrote:
> >>>> From: Jan Beulich <jbeulich@suse.com>
> >>>> Sent: 29 April 2020 12:02
> >>>>
> >>>> On 07.04.2020 19:38, Paul Durrant wrote:
> >>>>> +int domain_load_begin(struct domain_context *c, unsigned int =
tc,
> >>>>> +                      const char *name, const struct vcpu *v, =
size_t len,
> >>>>> +                      bool exact)
> >>>>> +{
> >>>>> +    if ( c->log )
> >>>>> +        gdprintk(XENLOG_INFO, "%pv load: %s (%lu)\n", v, name,
> >>>>> +                 (unsigned long)len);
> >>>>> +
> >>>>> +    BUG_ON(tc !=3D c->desc.typecode);
> >>>>> +    BUG_ON(v->vcpu_id !=3D c->desc.vcpu_id);
> >>>>> +
> >>>>> +    if ( (exact && (len !=3D c->desc.length)) ||
> >>>>> +         (len < c->desc.length) )
> >>>>> +        return -EINVAL;
> >>>>
> >>>> How about
> >>>>
> >>>>     if ( exact ? len !=3D c->desc.length
> >>>>                : len < c->desc.length )
> >>>>
> >>>
> >>> Yes, that doesn't look too bad.
> >>>
> >>>> ? I'm also unsure about the < - don't you mean > instead? Too
> >>>> little data would be compensated by zero padding, but too
> >>>> much data can't be dealt with. But maybe I'm getting the sense
> >>>> of len wrong ...
> >>>
> >>> I think the < is correct. The caller needs to have at least enough
> >>> space to accommodate the context record.
> >>
> >> But this is load, not save - the caller supplies the data. If
> >> there's less data than can be fit, it'll be zero-extended. If
> >> there's too much data, the excess you don't know what to do
> >> with (it might be okay to tolerate it being all zero).
> >>
> >
> > But this is a callback. The outer load function iterates over
> > the records calling the appropriate hander for each one. Those
> > handlers then call this function saying how much data they
> > expect and whether they want exactly that amount, or whether
> > they can tolerate less (i.e. zero-extend). Hence
> > len < c->desc.length is an error, because it means the
> > descriptor contains more data than the hander knows how to
> > handle.
>=20
> Oh, I see - "But maybe I'm getting the sense of len wrong ..."
> then indeed applies.
>=20
> Any thoughts on tolerating the excess data being zero?
>=20

Well the point of the check here is to not tolerate excess data... Are =
you suggesting that it might be a reasonable idea? If so, then yes, =
insisting it is all zero would be an alternative.

  Paul



