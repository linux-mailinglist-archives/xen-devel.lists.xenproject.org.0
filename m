Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 30863211D0F
	for <lists+xen-devel@lfdr.de>; Thu,  2 Jul 2020 09:34:39 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jqtjZ-0006l9-La; Thu, 02 Jul 2020 07:34:13 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Mrbb=AN=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1jqtjY-0006l4-5a
 for xen-devel@lists.xenproject.org; Thu, 02 Jul 2020 07:34:12 +0000
X-Inumbo-ID: 6bd62b54-bc36-11ea-8496-bc764e2007e4
Received: from mail-wm1-x331.google.com (unknown [2a00:1450:4864:20::331])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6bd62b54-bc36-11ea-8496-bc764e2007e4;
 Thu, 02 Jul 2020 07:34:11 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id j18so25582524wmi.3
 for <xen-devel@lists.xenproject.org>; Thu, 02 Jul 2020 00:34:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:thread-index
 :content-language;
 bh=fmKoyTMn8HBzb24wwHIteVJ+aDTuBQpLq3NL4nd+YQQ=;
 b=FNLSrx46jlGA6SN0/j37srDQcKnoQL/AGbCnGGmgARnXvAbdDhjxGalG4F/TzduLzh
 xGY0JGtl6iuaWwYhpJeK5TM5k7kqpS8A7Hg+IfY6YS5DYrxlej9fKmK0RnksIg7pObre
 +Nq64+kfeseXQLOzN2DPnEvk/C+51ZVTI88mGA4BtbfjdYsSqyRL5ehlR/ZZ7DBbHwM/
 Ag4g7XCgxSBNeF0creAUmo3IOrpL59Bb2iXqyEuCUZLTJ/OXIMPmo9t3hxACfb6Dj1AY
 wgRuHwVT4E778qD4pub7YIWiRfGakHtBrU12INVPxTjXZ79n09PdZIRCBx3rAVrPu6wq
 2vVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :thread-index:content-language;
 bh=fmKoyTMn8HBzb24wwHIteVJ+aDTuBQpLq3NL4nd+YQQ=;
 b=rkJBXi3wN9kdgmcVc0IgF8LUpxQOgppP7v5gBItuOR22knkW5hxxfV4Je61NLPwhLw
 AJ6R06ZxyLtPObD9nN5zK0xRjy3RRZixerdMNtU2NsdRfD4P/5H5F5l9Ikfg2NY5A7Y/
 /FVOI9oYWbTK2IJfAPcYwEr+aA9wngZUQ5vdFoISdvmFgTWrURdN8F4DXN9S+IxTZTlB
 gjLhfGgHuAFgPPfWgr8w0Nbd0iNAqJUlOMmd19mhh2k6oKiNXTnX3ZEitVCL4YB7P9QZ
 x8SgxBJCklQKyGp5PtYkRn9mRXmnOSLMjXO2PRFMlAroI8xNldFjtvX5jSa80tnXeJtE
 HYNg==
X-Gm-Message-State: AOAM532X6zBLxWdWiw2hI310RzE38aD/iP32/RDc4I5yookSq71gjMEA
 B/0jfrbttwgtJ4GJGU3zyXA=
X-Google-Smtp-Source: ABdhPJxoXmg3mcGxGIhx6YoRqxZf1kaJORFa0jvENrv2yt2xlIHmQSnbdMc34nx+AlaZzyBBxYgVvA==
X-Received: by 2002:a1c:ab84:: with SMTP id u126mr24876397wme.43.1593675250850; 
 Thu, 02 Jul 2020 00:34:10 -0700 (PDT)
Received: from CBGR90WXYV0 (54-240-197-239.amazon.com. [54.240.197.239])
 by smtp.gmail.com with ESMTPSA id x1sm9821978wrp.10.2020.07.02.00.34.09
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 02 Jul 2020 00:34:10 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: "'Jan Beulich'" <jbeulich@suse.com>,
	<xen-devel@lists.xenproject.org>
References: <bb6a96c6-b6b1-76ff-f9db-10bec0fb4ab1@suse.com>
In-Reply-To: <bb6a96c6-b6b1-76ff-f9db-10bec0fb4ab1@suse.com>
Subject: RE: [PATCH v2 0/7] x86: compat header generation and checking
 adjustments
Date: Thu, 2 Jul 2020 08:34:09 +0100
Message-ID: <001d01d65043$2d137890$873a69b0$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQLrhzkctRDO+pIv8AQp+zhKytw4/KbJdpvg
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
 'George Dunlap' <George.Dunlap@eu.citrix.com>,
 'Andrew Cooper' <andrew.cooper3@citrix.com>,
 'Ian Jackson' <ian.jackson@citrix.com>,
 =?utf-8?Q?'Roger_Pau_Monn=C3=A9'?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> -----Original Message-----
> From: Jan Beulich <jbeulich@suse.com>
> Sent: 01 July 2020 11:23
> To: xen-devel@lists.xenproject.org
> Cc: Andrew Cooper <andrew.cooper3@citrix.com>; George Dunlap =
<George.Dunlap@eu.citrix.com>; Ian
> Jackson <ian.jackson@citrix.com>; Julien Grall <julien@xen.org>; Wei =
Liu <wl@xen.org>; Stefano
> Stabellini <sstabellini@kernel.org>; Roger Pau Monn=C3=A9 =
<roger.pau@citrix.com>; Paul Durrant
> <paul@xen.org>
> Subject: [PATCH v2 0/7] x86: compat header generation and checking =
adjustments
>=20
> As was pointed out by 0e2e54966af5 ("mm: fix public declaration of
> struct xen_mem_acquire_resource"), we're not currently handling =
structs
> correctly that have uint64_aligned_t fields. Patch 2 demonstrates that
> there was also an issue with XEN_GUEST_HANDLE_64().
>=20
> Only the 1st patch was previously sent, but the approach chosen has
> been changed altogether. All later patches are new. For 4.14 I think
> at least patch 1 should be considered.

It's now quite a large patch. Since xen_mem_acquire_resouce() has been =
fixed, patch #1 (as you say in the comment there) is addressing a latent =
issue and so I=E2=80=99d prefer not to take what is now quite a large =
patch into 4.14.

  Paul

>=20
> 1: x86: fix compat header generation
> 2: x86/mce: add compat struct checking for XEN_MC_inject_v2
> 3: x86/mce: bring hypercall subop compat checking in sync again
> 4: x86/dmop: add compat struct checking for =
XEN_DMOP_map_mem_type_to_ioreq_server
> 5: x86: generalize padding field handling
> 6: flask: drop dead compat translation code
> 7: x86: only generate compat headers actually needed
>=20
> Jan


