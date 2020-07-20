Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EA35226CD1
	for <lists+xen-devel@lfdr.de>; Mon, 20 Jul 2020 19:07:35 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jxZFu-0004cr-LQ; Mon, 20 Jul 2020 17:07:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ezcM=A7=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1jxZFt-0004cm-V5
 for xen-devel@lists.xenproject.org; Mon, 20 Jul 2020 17:07:10 +0000
X-Inumbo-ID: 71e092c2-caab-11ea-84aa-bc764e2007e4
Received: from mail-wr1-x442.google.com (unknown [2a00:1450:4864:20::442])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 71e092c2-caab-11ea-84aa-bc764e2007e4;
 Mon, 20 Jul 2020 17:07:09 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id b6so18575411wrs.11
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jul 2020 10:07:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:thread-index
 :content-language;
 bh=BXp16PYZ88DKP4IeAclMUujGE9G/rGnyLqmlCZUuTIU=;
 b=OmCweoUSkMDNDsRxKUmPLNnKezVSuiYvUHDjj5RnntG/FEYpR8V8r2LkFIiXE0J/O7
 DNX54VuZo9fK/ayuC1b8mkR2sX6sv3EKySXLvrCseJ2k3qATcU+h0uJrh61LFVrBBf5d
 Qv4g3BF88SXDX+HxYllBMNsgNkzMRjAJHwDiUANorhXlFnu7akEio950qWsxjHe1LYOP
 /d7PW0DjBILoXNB6fuE4+Q/FtyfJiCxhcWA16T+vgA/2wRvu2j/zBBcw25OtpwWfWgig
 l+khMnf302wxWbvksFa4buSnJdG88LreNabODrxKvClbUlM8Q0L6oqxXtgkMAzgskOic
 RARA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :thread-index:content-language;
 bh=BXp16PYZ88DKP4IeAclMUujGE9G/rGnyLqmlCZUuTIU=;
 b=uEiF2RPe2S73A9lHK7blUP4OfXBY8GGc7EN93O2m901G8LlSqHBoKtsr1WTDMF6CP6
 5vU4Qfecp6QjGI2HwJupsbNYyFJxbQNZ9actupweQ8EkG9UXP86QM3H9Y7wzQaEb3LPa
 ZvF55OeCZn8OKawa+9Rm3np4ZYUovc9MVGI92BDxkQI/RqoywgJpHLWtb/MNzCrSzogC
 iHb4YRn52IOFDrre9Fz69rCReLHfPcbR+bdF+YxcECR5mmqnXTElp7X2hULwe3RuifWe
 wKutYfQ1D/Udz85iWiwtGFgN0OqWqgApZJBbbzemsA9wfB1tIFhDq5WoycJ2JX5M6sY9
 qUMw==
X-Gm-Message-State: AOAM533kd5Pthm7LmIFVElrjtPpOHYDuHL8dSFfwg1QrhZ9adjSA7XBM
 HiXPLGl0zJP5nARgRYieMaE=
X-Google-Smtp-Source: ABdhPJzCHtqpPB43LV5YDtuJ+ZWnXDRQdkntDQeRNOw3Eo9FfWKFAsN71w8jhdS+SWu9govVzxdxCg==
X-Received: by 2002:a05:6000:120c:: with SMTP id
 e12mr6095116wrx.354.1595264828299; 
 Mon, 20 Jul 2020 10:07:08 -0700 (PDT)
Received: from CBGR90WXYV0 (54-240-197-226.amazon.com. [54.240.197.226])
 by smtp.gmail.com with ESMTPSA id j16sm35331107wrt.7.2020.07.20.10.07.06
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 20 Jul 2020 10:07:07 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: "'Andrew Cooper'" <andrew.cooper3@citrix.com>,
 "'Xen-devel'" <xen-devel@lists.xenproject.org>
References: <20200720165833.14209-1-andrew.cooper3@citrix.com>
In-Reply-To: <20200720165833.14209-1-andrew.cooper3@citrix.com>
Subject: RE: [PATCH] docs: Replace non-UTF-8 character in hypfs-paths.pandoc
Date: Mon, 20 Jul 2020 18:07:06 +0100
Message-ID: <003101d65eb8$32dc7370$98955a50$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQHn4cDTNHEvrMr7/+cssb2RABXLIajtrKoQ
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
Cc: 'Juergen Gross' <jgross@suse.com>,
 'Stefano Stabellini' <sstabellini@kernel.org>, 'Julien Grall' <julien@xen.org>,
 'Wei Liu' <wl@xen.org>, 'George Dunlap' <George.Dunlap@eu.citrix.com>,
 'Jan Beulich' <JBeulich@suse.com>, 'Ian Jackson' <ian.jackson@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> -----Original Message-----
> From: Xen-devel <xen-devel-bounces@lists.xenproject.org> On Behalf Of =
Andrew Cooper
> Sent: 20 July 2020 17:59
> To: Xen-devel <xen-devel@lists.xenproject.org>
> Cc: Juergen Gross <jgross@suse.com>; Stefano Stabellini =
<sstabellini@kernel.org>; Julien Grall
> <julien@xen.org>; Wei Liu <wl@xen.org>; George Dunlap =
<George.Dunlap@eu.citrix.com>; Andrew Cooper
> <andrew.cooper3@citrix.com>; Jan Beulich <JBeulich@suse.com>; Ian =
Jackson <ian.jackson@citrix.com>
> Subject: [PATCH] docs: Replace non-UTF-8 character in =
hypfs-paths.pandoc
>=20
> From the docs cronjob on xenbits:
>=20
>   /usr/bin/pandoc --number-sections --toc --standalone =
misc/hypfs-paths.pandoc --output
> html/misc/hypfs-paths.html
>   pandoc: Cannot decode byte '\x92': =
Data.Text.Internal.Encoding.decodeUtf8: Invalid UTF-8 stream
>   make: *** [Makefile:236: html/misc/hypfs-paths.html] Error 1
>=20
> Fixes: 5a4a411bde4 ("docs: specify stability of hypfs path =
documentation")
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Release-acked-by: Paul Durrant <paul@xen.org>

...and please commit to staging-4.14 a.s.a.p.

> ---
> CC: Juergen Gross <jgross@suse.com>
> CC: George Dunlap <George.Dunlap@eu.citrix.com>
> CC: Ian Jackson <ian.jackson@citrix.com>
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: Wei Liu <wl@xen.org>
> CC: Julien Grall <julien@xen.org>
> ---
>  docs/misc/hypfs-paths.pandoc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/docs/misc/hypfs-paths.pandoc =
b/docs/misc/hypfs-paths.pandoc
> index 81d70bb80c..dddb592bc5 100644
> --- a/docs/misc/hypfs-paths.pandoc
> +++ b/docs/misc/hypfs-paths.pandoc
> @@ -74,7 +74,7 @@ you write finds a path present, it can rely on =
behavior in future versions of
>  the hypervisors, and in different configurations.  Specifically:
>=20
>  1. Conditions under which paths are used may be extended, restricted, =
or
> -   removed.  For example, a path that=EF=BF=BDs always available only =
on ARM systems
> +   removed.  For example, a path that's always available only on ARM =
systems
>     may become available on x86; or a path available on both systems =
may be
>     restricted to only appearing on ARM systems.  Paths may also =
disappear
>     entirely.
> --
> 2.11.0
>=20



