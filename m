Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 73DCC2DA309
	for <lists+xen-devel@lfdr.de>; Mon, 14 Dec 2020 23:12:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.52731.92052 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kow4R-0001D8-WE; Mon, 14 Dec 2020 22:11:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 52731.92052; Mon, 14 Dec 2020 22:11:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kow4R-0001Cj-Sr; Mon, 14 Dec 2020 22:11:55 +0000
Received: by outflank-mailman (input) for mailman id 52731;
 Mon, 14 Dec 2020 22:11:54 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nAAc=FS=gmail.com=persaur@srs-us1.protection.inumbo.net>)
 id 1kow4P-0001B7-Rp
 for xen-devel@lists.xenproject.org; Mon, 14 Dec 2020 22:11:53 +0000
Received: from mail-il1-x12c.google.com (unknown [2607:f8b0:4864:20::12c])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7aea62ea-7663-44e8-8099-1bc20991033c;
 Mon, 14 Dec 2020 22:11:52 +0000 (UTC)
Received: by mail-il1-x12c.google.com with SMTP id p5so17321779iln.8
 for <xen-devel@lists.xenproject.org>; Mon, 14 Dec 2020 14:11:52 -0800 (PST)
Received: from [100.64.72.3] ([173.245.215.240])
 by smtp.gmail.com with ESMTPSA id l78sm12417573ild.30.2020.12.14.14.11.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Dec 2020 14:11:51 -0800 (PST)
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
X-Inumbo-ID: 7aea62ea-7663-44e8-8099-1bc20991033c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=content-transfer-encoding:from:mime-version:subject:date:message-id
         :references:cc:in-reply-to:to;
        bh=Ehqbtw+xjl33wXScdfoTBtwSesAfNQAHAc1Tvg1WS/A=;
        b=bhDZlepEmyvUsTHOGP1ik251oafXHlXFWOowM7IaOoqg0iS/8Icif5UA/xTazcBvJq
         1JwCHqmgvAHo4BaG8hhclCPdJbpBuZVF17Z2I4fJMDLX3MD3LpOwrG284On/N5xLm097
         lb9sKFV1cH8ZlK+bUVDu1Je7HPc7uEHZYsR0vdbkc2A00ZEVzwzBNywrbj2asvHZ6gqV
         tyJ2x8mRcsLt+yFR9DmWRa2MbHEuxOnHauD4bINQjJFNL2uMy0smD2TGPLAX0eKtqCBf
         I+88KM04l6lDjr5tSxhzAc4YNXzfTrSoagXE9oHuGQu6MXT7bi07kWZpQb+2+LUFLtaO
         bGvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:content-transfer-encoding:from:mime-version
         :subject:date:message-id:references:cc:in-reply-to:to;
        bh=Ehqbtw+xjl33wXScdfoTBtwSesAfNQAHAc1Tvg1WS/A=;
        b=aUE5MQ5U0iVEtPan/aYzB4R1aI+boaQkEmo4GNZ6OXF82DwJVtYn0x+htgB3DDFfvU
         4Us80fM4Q2GKGX3ikhgtbhdc9TmTYbAk6ggO/bcQpcnINlcvJKXYZA25IyqVJKAisGfT
         dDCGoqjp8X0TOcAwH5/tzdq2vlF1/jGiLTi0KQZatGSybtJJ7O/3Wg+4HilLu+9eV1tM
         nMcA2iRHSpKIP492BRaxTDuaWQFD1+IanwvfEWrTsvFWNHVswGVpYJBD4wBQliXfQn8v
         ZTQbY5KNs0Kdc0UhMDgUqKVZb3GdKaYs+ZHDNZcRBdhq8xyFOtpTAvHmU9cejE/3XM2l
         jJrg==
X-Gm-Message-State: AOAM533mzUZJo1FJ1gePV9OfZ2ACp9yBhqwC6q2WOdD0soBX1ungDJZ3
	mpkMvADVq5iT1+NmpTSQ1N8=
X-Google-Smtp-Source: ABdhPJyNHNP//MQMvEkBPFkEEZAWMHVXNF+rWzY7xlXJMdRAxwhhXwmaBf3gvE9hKilmEQePahazEg==
X-Received: by 2002:a92:da46:: with SMTP id p6mr24745755ilq.136.1607983912338;
        Mon, 14 Dec 2020 14:11:52 -0800 (PST)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From: Rich Persaud <persaur@gmail.com>
Mime-Version: 1.0 (1.0)
Subject: Re: [openxt-dev] Re: Follow up on libxl-fix-reboot.patch
Date: Mon, 14 Dec 2020 17:11:50 -0500
Message-Id: <3ACCFEC6-A8B7-48E6-AA3F-48D4CDE75FA4@gmail.com>
References: <CAKf6xps-nM13E19SVS3NJwq6LwOJLUwN+FC6k_Sp9-_YaRt-EA@mail.gmail.com>
Cc: Chris Rogers <crogers122@gmail.com>,
 Jason Andryuk <jandryuk@gmail.com>
In-Reply-To: <CAKf6xps-nM13E19SVS3NJwq6LwOJLUwN+FC6k_Sp9-_YaRt-EA@mail.gmail.com>
To: openxt <openxt@googlegroups.com>, xen-devel@lists.xenproject.org,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@citrix.com>,
 =?utf-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
 Olivier Lambert <olivier.lambert@vates.fr>,
 Andrew Cooper <andrew.cooper3@citrix.com>
X-Mailer: iPhone Mail (18C66)

(adding xen-devel & toolstack devs)

On Dec 14, 2020, at 16:12, Jason Andryuk <jandryuk@gmail.com> wrote:
>=20
> =EF=BB=BFOn Fri, Dec 11, 2020 at 3:56 PM Chris Rogers <crogers122@gmail.co=
m> wrote:
>>=20
>> This is a follow up to a request during our roadmapping meeting to clarif=
y the purpose of libxl-fix-reboot.patch on the current version of Xen in Ope=
nXT (4.12).  It's pretty simple.  While the domctl API does define a trigger=
 for reset in xen/include/public/domctl.h:
>>=20
>=20
>> The call stack looks like this:
>>> libxl_send_trigger(ctx, domid, LIBXL_TRIGGER_RESET, 0);
>>> xc_domain_send_trigger(ctx->xch, domid, XEN_DOMCTL_SENDTRIGGER_RESET, vc=
upid);
>>> do_domctl()
>>> arch_do_domctl()
>> and reaching the case statement in arch_do_domctl() for XEN_DOMCTL_sendtr=
igger, with RESET, we get -ENOSYS as illustrated above.
>=20
> Thanks, Chris.  It's surprising that xl trigger reset exists, but
> isn't wired through to do anything.  And that reboot has a fallback
> command to something that doesn't work.
>=20
> If we have to turn reboot into shutdown + start, it seems like that
> could be done in xenmgr instead of libxl.  Similarly, this may avoid
> the signaling between xenmgr and libxl.

If upstream Xen's libxl cannot support VM reset, can we drop/hide reset supp=
ort from the OpenXT CLI and UIVM? That would avoid incurring costs for a fak=
e feature with no long-term future. A reset is not the same as shutdown + st=
art.  If reset is not supportable, the user can perform shutdown + reboot ma=
nually. Then they would at least be aware of the consequences, e.g. temporar=
y storage snapshots will be deleted and changes lost immediately.

OpenXT derivatives which need reset support can use another Xen toolstack wh=
ich provides this capability, e.g. the Citrix XenServer xapi ocaml toolstack=
, for this single function.  Or the old XenClient xenops fork of xapi.

The long-term direction, based on an upstream prototype in Rust, is a low le=
vel toolstack daemon that accepts input over an RPC protocol that is stable a=
nd versioned, which will drive a stable hypercall ABI for Xen. We can ask fo=
r reset support to be prioritized in the Rust prototype, which would then en=
able testing of OpenXT integration.

Hopefully an upstream Xen LibXL developer will recall why the reset logic is=
n't yet fully wired up.

Rich=

