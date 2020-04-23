Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 59D601B660D
	for <lists+xen-devel@lfdr.de>; Thu, 23 Apr 2020 23:16:05 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jRjB0-0000BX-Ff; Thu, 23 Apr 2020 21:14:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VVSQ=6H=gmail.com=neilsikka@srs-us1.protection.inumbo.net>)
 id 1jRjAz-0000BS-1g
 for xen-devel@lists.xenproject.org; Thu, 23 Apr 2020 21:14:29 +0000
X-Inumbo-ID: 6a27299a-85a7-11ea-b4f4-bc764e2007e4
Received: from mail-ed1-x52b.google.com (unknown [2a00:1450:4864:20::52b])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6a27299a-85a7-11ea-b4f4-bc764e2007e4;
 Thu, 23 Apr 2020 21:14:28 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id k22so5520897eds.6
 for <xen-devel@lists.xenproject.org>; Thu, 23 Apr 2020 14:14:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=tXogdIWucxrZKQeHtyCyKncNdg3MNzcQRHWcSlK+7OE=;
 b=m6v+tFHced7sylqDQ87Z/7XPP4yyiAT/ZiH35yQ0UytEBqk4A0/6yHzFXRuOJF2HYe
 3yeOpTq0UeCTFNtTMkCBhi+TypgLznTImWIeSawHDOWbTMo46M3Cdoelj2+Qb+B8QuRW
 lh4BP2BAE9jWsPTrT0r9VSqdqJyuaGQaAW387E/bmmfyXcnT/97SGb8AtHFNMKD0LVDh
 fkbfScH15/krbYFr3YOKt8/0ytU3r1caNGBMoOTo+K5rC99MBFjXuiUWHsE7DmvcVv5f
 AWf/kKjeoHUpR8gtanS+AMoScAMtODv2y+QwPoupvWtTUccH0mnA2xmbRkiZaeM1UGWK
 8wiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=tXogdIWucxrZKQeHtyCyKncNdg3MNzcQRHWcSlK+7OE=;
 b=FeA+wa1ezgClSm5GA/rbNjlsN5GQ5tEGJ6Ay10QoThfXx7z/GFSKw2SuqvFIr/j59+
 AvKAjjeOl6jxks0iGYmYDqUmzrMKEql7fvGG6NdhM1MlIj9WeN0+rsnV/BMYtfsh6j/Q
 leYHxzMXpvGhGnDHH9EYbvM/vHwq3B0eM/dggTLFDcxX+/eh9qft0IMTpKIrV9BU2jwm
 xj9wDgGMwkG6aIWGiaTs6Ruq+BoK0Dd9llB4XVHYvvIhUd3bRpfcqx0P8QL6/TQoBgku
 ubgTGXDWQunUbIwaaaBlWR2hN0U2hpkp5Zx9LBplZaMo48FcEJCBC7U9miO/eK0diKNs
 UaDg==
X-Gm-Message-State: AGi0PuZh8aw0Vpa23HenXIiNmZ9YvIa7769pYL3Qi6eWawOdP+5zJy9b
 +M3pwJ8h+sfs4mxx1mC+XUL8K38GGkeHarCON3s/z5+Pl30=
X-Google-Smtp-Source: APiQypIJLatPtdgm7ZCWwvQKyrrHr3rfoBDhTdg1i5mXjj0x7m8lTTqcWAruJ+7PNclBRSBkvBh6XA2TBD3kG47dNtU=
X-Received: by 2002:aa7:d4c3:: with SMTP id t3mr4375726edr.191.1587676466771; 
 Thu, 23 Apr 2020 14:14:26 -0700 (PDT)
MIME-Version: 1.0
From: Neil Sikka <neilsikka@gmail.com>
Date: Thu, 23 Apr 2020 17:14:15 -0400
Message-ID: <CAHPMNWeMQSk3gupJhOfeLJVWw5t=oZ=cXbgf9NDdhTRAm3TQ=Q@mail.gmail.com>
Subject: Locking in xl
To: Xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="UTF-8"
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hello,
I see that in the xl binary in xen 4.13.0, the acquire_lock() and
release_lock() functions are only called from create_domain() in
xl_vmcontrol.c, so I assume the lock provides inter-PROCESS
synchronization in the case that multiple instances of xl are running
and creating multiple domains concurrently.

However, this lock causes a bottleneck in the case that an xl restore
process is restoring a DomU with a lot of memory. While the large
amount of memory is being copied from the checkpoint file on disk to
the physical machine's RAM, all other VM creation requests on the
system are starved, leading to a performance loss. When I removed the
lock, my testing of simultaneous creation of 2 DomU's concurrently
worked and I did not see any issues.

Does anyone know what shared resource these locks are guarding? Maybe
we should be making the lock more granular.

-- 
My Blog: http://www.neilscomputerblog.blogspot.com/
Twitter: @neilsikka

