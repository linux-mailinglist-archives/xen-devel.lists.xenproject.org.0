Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A66E730DE98
	for <lists+xen-devel@lfdr.de>; Wed,  3 Feb 2021 16:48:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.80960.148605 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l7KO3-0003zV-GZ; Wed, 03 Feb 2021 15:48:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 80960.148605; Wed, 03 Feb 2021 15:48:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l7KO3-0003z8-DP; Wed, 03 Feb 2021 15:48:11 +0000
Received: by outflank-mailman (input) for mailman id 80960;
 Wed, 03 Feb 2021 15:48:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+PM6=HF=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1l7KO2-0003z3-AE
 for xen-devel@lists.xenproject.org; Wed, 03 Feb 2021 15:48:10 +0000
Received: from mail-wm1-x32c.google.com (unknown [2a00:1450:4864:20::32c])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ae1c98af-fc59-4aa1-babc-4ebab13f2744;
 Wed, 03 Feb 2021 15:48:09 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id l12so109256wmq.2
 for <xen-devel@lists.xenproject.org>; Wed, 03 Feb 2021 07:48:09 -0800 (PST)
Received: from CBGR90WXYV0 (host86-190-149-163.range86-190.btcentralplus.com.
 [86.190.149.163])
 by smtp.gmail.com with ESMTPSA id d16sm3999152wrr.59.2021.02.03.07.48.07
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 03 Feb 2021 07:48:07 -0800 (PST)
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
X-Inumbo-ID: ae1c98af-fc59-4aa1-babc-4ebab13f2744
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
         :mime-version:content-transfer-encoding:thread-index
         :content-language;
        bh=QcD9ujADNh4gEP4T6CQjKgXk1e4/dGZeakSlRkYvYCs=;
        b=b2JAdHN/a2ODF4O7H3zTAWXdg4st156Vtf9axC0IN5nt9l5fP1L03+MY8trsQoQdQf
         Z20re5MWWd4Ax7pzzWDqCD7Bhwi0U/EpN1MlPG3jEsJtm7QEtJ0o+z+zD4lbyQxgMGps
         GkBDQQPP+tQiHLy6LPsfNExU3FlljfYyre5hBqJd9B4YdGju9eWfbvddwTiQW50s+12w
         JSZl8Q+bGsdgtlb+1r4Qff3eZnreuLP57m8mLh82GJ0NatLzKXnxtOH7KIlk1oKol4fx
         vVO2Bxsw8UpMhoxwQXh7Oo2pNjTMIKrHZM8hGK2BlZzX3JXjiOlSSmY77uDUW2PpbvEH
         Umbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
         :subject:date:message-id:mime-version:content-transfer-encoding
         :thread-index:content-language;
        bh=QcD9ujADNh4gEP4T6CQjKgXk1e4/dGZeakSlRkYvYCs=;
        b=cNlOKbkcaAecn0yFqV10JvZ0n2NO4btAEbSf04shuXg2wEaqGgBPEkhb9JPs2bL5Cu
         coWeZdFqRifmTIXhOFxEy+slecGRMW2qIRUochctdkhU0E2nGK3/icj+90BvJmdEdAWk
         Z5z+hP5R9HK5DAFa54YLGIB5J+yZF+Ll5DnqbxHlnRuVPU1I/DaqWaUMfBvVc0abq49E
         rsUHUBxpp7q8lQMyUykfAM8lsApI8Qloe2UALhGT62M8npK+zRiaFTLGuPHQk74l+BLx
         G3XTqvvc0c3/9cP0W1qHEoosPljUJHg5XkhZxfIMc9eIFIYcECyjEEzrSylufv7A3kwB
         Tumg==
X-Gm-Message-State: AOAM532K5StzjYcqzXxO7mv2SMac9Y15mt5jWevT8S8OSKGtCu5G0IWN
	OrglulXniN98DswcfkFIw+E=
X-Google-Smtp-Source: ABdhPJxbxhzDZQljCNUMUqTauwihM/GY/eA/0SqSETqf3Urgsoac2WdYw+dDwhNLd8XBJHC6nZ6/ig==
X-Received: by 2002:a05:600c:414b:: with SMTP id h11mr3006567wmm.125.1612367288326;
        Wed, 03 Feb 2021 07:48:08 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
Reply-To: <paul@xen.org>
To: "'Jan Beulich'" <jbeulich@suse.com>
Cc: <xen-devel@lists.xenproject.org>,
	"'James Dingwall'" <james-xen@dingwall.me.uk>
References: <20210201152655.GA3922797@dingwall.me.uk> <d30b5ee3-1fd9-a64b-1d9a-f79b6b333169@suse.com> <03d501d6fa3d$e5227cc0$af677640$@xen.org> <94d4af04-9f3c-8c40-8acd-705259ec91fa@suse.com>
In-Reply-To: <94d4af04-9f3c-8c40-8acd-705259ec91fa@suse.com>
Subject: RE: VIRIDIAN CRASH: 3b c0000096 75b12c5 9e7f1580 0
Date: Wed, 3 Feb 2021 15:48:07 -0000
Message-ID: <03dc01d6fa43$f798fe00$e6cafa00$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQJhmlK/cLfJLwTp9TTyTj8ctTVv3wG1IORhAfTq6uYCUcbZMakBdGpg
Content-Language: en-gb

> -----Original Message-----
> From: Jan Beulich <jbeulich@suse.com>
> Sent: 03 February 2021 15:43
> To: paul@xen.org
> Cc: xen-devel@lists.xenproject.org; 'James Dingwall' <james-xen@dingwall.me.uk>
> Subject: Re: VIRIDIAN CRASH: 3b c0000096 75b12c5 9e7f1580 0
> 
> On 03.02.2021 16:04, Paul Durrant wrote:
> >> From: Xen-devel <xen-devel-bounces@lists.xenproject.org> On Behalf Of Jan Beulich
> >> Sent: 03 February 2021 14:55
> >>
> >> On 01.02.2021 16:26, James Dingwall wrote:
> >>> 21244@1612191983.282480:xen_platform_log xen platform: XEN|BUGCHECK: EXCEPTION (0000A824848948C2):
> >>> 21244@1612191983.282617:xen_platform_log xen platform: XEN|BUGCHECK: CONTEXT (FFFFD0014343D580):
> >>> 21244@1612191983.282717:xen_platform_log xen platform: XEN|BUGCHECK: - GS = 002B
> >>> 21244@1612191983.282816:xen_platform_log xen platform: XEN|BUGCHECK: - FS = 0053
> >>> 21244@1612191983.282914:xen_platform_log xen platform: XEN|BUGCHECK: - ES = 002B
> >>> 21244@1612191983.283011:xen_platform_log xen platform: XEN|BUGCHECK: - DS = 002B
> >>> 21244@1612191983.283127:xen_platform_log xen platform: XEN|BUGCHECK: - SS = 0018
> >>> 21244@1612191983.283226:xen_platform_log xen platform: XEN|BUGCHECK: - CS = 0010
> >>> 21244@1612191983.283332:xen_platform_log xen platform: XEN|BUGCHECK: - EFLAGS = 00000202
> >>> 21244@1612191983.283444:xen_platform_log xen platform: XEN|BUGCHECK: - RDI = 00000000F64D5C20
> >>> 21244@1612191983.283555:xen_platform_log xen platform: XEN|BUGCHECK: - RSI = 00000000F6367280
> >>> 21244@1612191983.283666:xen_platform_log xen platform: XEN|BUGCHECK: - RBX = 000000008011E060
> >>> 21244@1612191983.283810:xen_platform_log xen platform: XEN|BUGCHECK: - RDX = 00000000F64D5C20
> >>> 21244@1612191983.283972:xen_platform_log xen platform: XEN|BUGCHECK: - RCX = 0000000000000199
> >>> 21244@1612191983.284350:xen_platform_log xen platform: XEN|BUGCHECK: - RAX = 0000000000000004
> >>> 21244@1612191983.284523:xen_platform_log xen platform: XEN|BUGCHECK: - RBP = 000000004343E891
> >>> 21244@1612191983.284658:xen_platform_log xen platform: XEN|BUGCHECK: - RIP = 00000000A43C72C5
> >>> 21244@1612191983.284842:xen_platform_log xen platform: XEN|BUGCHECK: - RSP = 000000004343DFA0
> >>> 21244@1612191983.284959:xen_platform_log xen platform: XEN|BUGCHECK: - R8 = 0000000000000008
> >>> 21244@1612191983.285073:xen_platform_log xen platform: XEN|BUGCHECK: - R9 = 000000000000000E
> >>> 21244@1612191983.285188:xen_platform_log xen platform: XEN|BUGCHECK: - R10 = 0000000000000002
> >>> 21244@1612191983.285304:xen_platform_log xen platform: XEN|BUGCHECK: - R11 = 000000004343E808
> >>> 21244@1612191983.285420:xen_platform_log xen platform: XEN|BUGCHECK: - R12 = 0000000000000000
> >>> 21244@1612191983.285564:xen_platform_log xen platform: XEN|BUGCHECK: - R13 = 00000000F7964E50
> >>> 21244@1612191983.285680:xen_platform_log xen platform: XEN|BUGCHECK: - R14 = 00000000F64D5C20
> >>> 21244@1612191983.285796:xen_platform_log xen platform: XEN|BUGCHECK: - R15 = 00000000F7964E50
> >>
> >> I'm also confused by this - the pointer given for CONTEXT suggests this
> >> is a 64-bit kernel, yet none of the registers - including RIP and RSP -
> >> have non-zero upper 32 bits. Or is qemu truncating these values?
> >
> > The logging is coming from the PV drivers (in
> https://xenbits.xen.org/gitweb/?p=pvdrivers/win/xenbus.git;a=blob;f=src/xen/bug_check.c). The
> truncated values may just be due to a 32-bit user process I guess.
> 
> Since you pointed me at the code and truncation inside a string
> not likely being due to some user process, I went and looked:
> The driver uses %016X, instead of e.g. converting to (PVOID)
> and using %p like code elsewhere in the file does (presumably
> because there's no really convenient way to print 64-bit values
> in Windows, short of using their custom "%016I64X" format
> specifier, and the absence of a uniform specifier allowing to
> format pointer-sized integers independent of architecture).

Oh yes, good point... Other places in the code use the %p trick. It should be changed.

  Paul

> 
> Jan


