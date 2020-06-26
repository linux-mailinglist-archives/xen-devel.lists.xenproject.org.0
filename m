Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C2C8F20B262
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jun 2020 15:22:08 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jooIq-0002f9-AF; Fri, 26 Jun 2020 13:22:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HPqg=AH=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1jooIp-0002f3-7n
 for xen-devel@lists.xenproject.org; Fri, 26 Jun 2020 13:21:59 +0000
X-Inumbo-ID: 02bca416-b7b0-11ea-bca7-bc764e2007e4
Received: from mail-ej1-x635.google.com (unknown [2a00:1450:4864:20::635])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 02bca416-b7b0-11ea-bca7-bc764e2007e4;
 Fri, 26 Jun 2020 13:21:58 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id a1so9326719ejg.12
 for <xen-devel@lists.xenproject.org>; Fri, 26 Jun 2020 06:21:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:content-language
 :thread-index; bh=35nElVfO4ruHe/my6OtnItaNY19Zq7OZe2sq8RVEalA=;
 b=b9Q7/sDzyTSOfvmKO2nLSsd19jiQxMb9W6PcT7xVJG2j2pTPdQuwBCOoaYtS0yVdDL
 tjC8NlkDeBmx3L0p97lu/sp3iw1r/lJHgU2+kqYCSBmVHfd7XBnhIiiQxwOLb7Uo1yv3
 b7LJZ0dJHvMQUmOWanKOyWnCaYGmW8kTnuqHqQ/axyhca6FHPg61B9KiClpO37x4ZifD
 c5/YwsqDELmlEc54ykYCeAtKnNJsO9HDpMJEuv6ZIOMLdr5Mohx+xMQWlIaywNtZNDZu
 qXdo0ma0whoHqahnyysiGjBUTECvYU1d76YIQMlgZrMKGMkXtPgzUbs8oTdhqkpX3r8D
 mUbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :content-language:thread-index;
 bh=35nElVfO4ruHe/my6OtnItaNY19Zq7OZe2sq8RVEalA=;
 b=g4MozpBTmsvqXab9/zjHNO3GrsFWn19TnGOM5YzodrPV3DcCreXI7MJ/c46byVuMBy
 otmhjI7hs3NUSZ6CUzrxiTUJDbRe35OU5h6/nwLuokng6163zASa7ryBQrH7f/LzJ7LJ
 /KbWsXVW3jg1TaD1axcSxbYEkMkrAt16EfZLcpArXpTh9Gnt8RuJ2HK+tiAAyqt05wAG
 Lt9Wgbj+ErbwUtzdgnzvPYtaWbcgSug9z5mSDexVefvU3bTlIqBHECg1W8Z188MuoeoQ
 8lHaMngmXDBy5s3+ZovNd6vrA0BikRFxfhPLwMolskYzDNybiisCkIFDdj972Fcrhd2k
 LF8Q==
X-Gm-Message-State: AOAM531VV2QZj7vIa+AYJ/WqnZfC/CtNgKy3eRCjfcDGQayTrvnz8AgG
 +gDV8WXgZ7+uM8ZoeKoz+1g=
X-Google-Smtp-Source: ABdhPJwKed8mGY3+lJBzy831qAcDxGDZNnONnWWAIIyVanWbqwreTXOLPZ93/1rmppbN2vQUrUPp5Q==
X-Received: by 2002:a17:907:b03:: with SMTP id
 h3mr2665047ejl.367.1593177717324; 
 Fri, 26 Jun 2020 06:21:57 -0700 (PDT)
Received: from CBGR90WXYV0 (54-240-197-236.amazon.com. [54.240.197.236])
 by smtp.gmail.com with ESMTPSA id bz14sm18770473ejc.100.2020.06.26.06.21.56
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 26 Jun 2020 06:21:56 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: "'Jan Beulich'" <jbeulich@suse.com>,
 "'Andrew Cooper'" <andrew.cooper3@citrix.com>
References: <20200626122408.19151-1-andrew.cooper3@citrix.com>
 <af00d3ae-eba1-43dd-f8b7-d800e53c197b@suse.com>
In-Reply-To: <af00d3ae-eba1-43dd-f8b7-d800e53c197b@suse.com>
Subject: RE: [PATCH v2 for-4.14] x86/livepatch: Make livepatching compatible
 with CET Shadow Stacks
Date: Fri, 26 Jun 2020 14:21:55 +0100
Message-ID: <000c01d64bbc$c3f75730$4be60590$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQFni0xM86WbiVrPLWulsmYIT6MTPgHnaHqAqbknfuA=
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
Cc: 'Wei Liu' <wl@xen.org>, 'Konrad Rzeszutek Wilk' <konrad.wilk@oracle.com>,
 'Ross Lagerwall' <ross.lagerwall@citrix.com>,
 'Pawel Wieczorkiewicz' <wipawel@amazon.de>,
 'Xen-devel' <xen-devel@lists.xenproject.org>,
 =?utf-8?Q?'Roger_Pau_Monn=C3=A9'?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> -----Original Message-----
> From: Jan Beulich <jbeulich@suse.com>
> Sent: 26 June 2020 14:15
> To: Andrew Cooper <andrew.cooper3@citrix.com>
> Cc: Xen-devel <xen-devel@lists.xenproject.org>; Wei Liu <wl@xen.org>; =
Roger Pau Monn=C3=A9
> <roger.pau@citrix.com>; Konrad Rzeszutek Wilk =
<konrad.wilk@oracle.com>; Ross Lagerwall
> <ross.lagerwall@citrix.com>; Pawel Wieczorkiewicz <wipawel@amazon.de>; =
Paul Durrant <paul@xen.org>
> Subject: Re: [PATCH v2 for-4.14] x86/livepatch: Make livepatching =
compatible with CET Shadow Stacks
>=20
> On 26.06.2020 14:24, Andrew Cooper wrote:
> > Just like the alternatives infrastructure, the livepatch =
infrastructure
> > disables CR0.WP to perform patching, which is not permitted with CET =
active.
> >
> > Modify arch_livepatch_{quiesce,revive}() to disable CET before =
disabling WP,
> > and reset the dirty bits on all virtual regions before re-enabling =
CET.
> >
> > One complication is that arch_livepatch_revive() has to fix up the =
top of the
> > shadow stack.  This depends on the functions not being inlined, even =
under
> > LTO.  Another limitation is that reset_virtual_region_perms() may =
shatter the
> > final superpage of .text depending on alignment.
> >
> > This logic, and its downsides, are temporary until the patching =
infrastructure
> > can be adjusted to not use CR0.WP.
>=20
> In particular on this basis ...
>=20
> > Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>=20
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

Release-acked-by: Paul Durrant <paul@xen.org>

>=20
> Jan


