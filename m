Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7466B650CAD
	for <lists+xen-devel@lfdr.de>; Mon, 19 Dec 2022 14:33:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.466110.724956 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p7GGO-0006Cd-Ko; Mon, 19 Dec 2022 13:33:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 466110.724956; Mon, 19 Dec 2022 13:33:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p7GGO-0006A4-Hd; Mon, 19 Dec 2022 13:33:04 +0000
Received: by outflank-mailman (input) for mailman id 466110;
 Mon, 19 Dec 2022 13:33:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=S2HB=4R=tibco.com=etorok@srs-se1.protection.inumbo.net>)
 id 1p7GGN-00069s-Bc
 for xen-devel@lists.xenproject.org; Mon, 19 Dec 2022 13:33:03 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a3a3f2b0-7fa1-11ed-8fd4-01056ac49cbb;
 Mon, 19 Dec 2022 14:32:53 +0100 (CET)
Received: by mail-wm1-x333.google.com with SMTP id ay40so6420663wmb.2
 for <xen-devel@lists.xenproject.org>; Mon, 19 Dec 2022 05:33:02 -0800 (PST)
Received: from smtpclient.apple (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 y12-20020adffa4c000000b002258235bda3sm9982551wrr.61.2022.12.19.05.33.01
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 19 Dec 2022 05:33:01 -0800 (PST)
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
X-Inumbo-ID: a3a3f2b0-7fa1-11ed-8fd4-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hyqBFqrtmlfxIHvmtBOqZBB+aaAVvAnC/1WGsPr5f64=;
        b=Bd3q0uQQcCrQfzu9lU8bWzwcwB9U4o+RnAdzJjm/wKLZOrISoe+fLS6gxQ6/7cUrY5
         xQRomUkMotvmW3o7kzhkM0c/j5q1nnW+hxnIdLU9plVz8CsXf+PHRtkAgh+f756wrVMk
         Vp63zi1ThZS6BjjnUydKwL75GODzgYzuYc/SU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hyqBFqrtmlfxIHvmtBOqZBB+aaAVvAnC/1WGsPr5f64=;
        b=f5P21NtMejl/sotb7lSJsrefe4jJbGvyS6KLvwN1BI1vlDoMR+BuBdgvofF7e6lrAG
         0dkN/ak2Prz5dqXQROnJHlmvIRN8bUWjEWwqcmYnZx1JbuaQ/TAU49HtgsCRbWjrlrPj
         ZLvEfdEeFCRKHHHPOQ9dCoYaJRVy2Tnnojup5iHfXFG315ZCwa383ZW1DE8+gDjFlGMe
         z4f4ivmaq4vGpy3fJXmijb0z4VjB83EhJnZp0BnXd/bDXScnl7rtIzlDMFcpD+tDt2Q8
         7qqmpCLCsW0quZN8pP7RXNpzpoFXkERZPnfCuqqtt/Gm0JOm5+97rPAo4yvt6RyMtUY/
         HKmg==
X-Gm-Message-State: ANoB5pkepl+MEy1xZF2iT3PBzIMVxdJE/KawcNwbpjOq0704UZ5WOPML
	YrvaEc5CV75/ab3TGr0kT+SgXw==
X-Google-Smtp-Source: AA0mqf4sQodQR34lFKzuw3jB0bs2vNrIqw435DUm50XvXbLP9Dahm7SdD9F6r90Omnpjk0QDP916uQ==
X-Received: by 2002:a7b:ce84:0:b0:3c6:e63e:24e with SMTP id q4-20020a7bce84000000b003c6e63e024emr32647826wmj.37.1671456781921;
        Mon, 19 Dec 2022 05:33:01 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.200.110.1.12\))
Subject: Re: [PATCH v4 03/11] CODING_STYLE(tools/ocaml): add 'make format' and
 remove tabs
From: Edwin Torok <edwin.torok@cloud.com>
In-Reply-To: <Y6BQhAs0ZgRqJ3//@perard.uk.xensource.com>
Date: Mon, 19 Dec 2022 13:32:51 +0000
Cc: =?utf-8?B?RWR3aW4gVMO2csO2aw==?= <edvin.torok@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 David Scott <dave@recoil.org>,
 Wei Liu <wl@xen.org>,
 Christian Lindig <christian.lindig@citrix.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <9056A016-609C-4AD8-B989-868E81763B85@cloud.com>
References: <cover.1671214525.git.edwin.torok@cloud.com>
 <81d621cea5975fdd9698992b968dcd7528c637af.1671214525.git.edwin.torok@cloud.com>
 <Y6BQhAs0ZgRqJ3//@perard.uk.xensource.com>
To: Anthony PERARD <anthony.perard@citrix.com>
X-Mailer: Apple Mail (2.3731.200.110.1.12)



> On 19 Dec 2022, at 11:52, Anthony PERARD <anthony.perard@citrix.com> =
wrote:
>=20
> On Fri, Dec 16, 2022 at 06:25:12PM +0000, Edwin T=C3=B6r=C3=B6k wrote:
>> + git ls-files '*.c' '*.h' | xargs -n1 sed -ie 's/\t/    /g'
>=20
> Seen as there's a patch adding .clang-format, what the point of this
> command?

The diff to change tabs to spaces (and the equivalent one from =
ocp-indent) can be proven
to introduce 0 changes by looking at the diff with ignore-whitespace.
Proving the same with ocamlformat or clang-format is more difficult (and =
in particular if you keep rebasing commits from after the reformat =
commit to before it
you risk losing the change if you don't redo the format commit =
correctly).

So I intended to do this gradually: first get indentation to be =
consistent, and then get formatting to be consistent later once
the former has been accepted and committed.

>=20
> "-ie" means to ask sed to change file in-place an keep a copy of the
> original file with "e" as suffix. So please replace that by "-i~" or
> "-i -e" or just "-i", with the first one create a "~" backup, the last
> two not creating a backup at all and probably what you wanted. ("-e" =
is
> optional as there's only a single command)
>=20

Thanks for pointing it out, what I wanted is 'sed -i -e', and you can =
usually merge multiple single char flags into a single one,
except that is not the case for -i, and I keep making this mistake.

.PHONY: format
format:
	git ls-files '*.ml' '*.mli' | xargs -n1 ocp-indent -i
	git ls-files '*.c' '*.h' | xargs -n1 sed -i 's/\t/    /g'


--Edwin=

