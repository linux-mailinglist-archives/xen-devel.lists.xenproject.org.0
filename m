Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7362C6FCB9E
	for <lists+xen-devel@lfdr.de>; Tue,  9 May 2023 18:48:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.532392.828581 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pwQVP-0004GJ-N5; Tue, 09 May 2023 16:48:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 532392.828581; Tue, 09 May 2023 16:48:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pwQVP-0004Da-Jl; Tue, 09 May 2023 16:48:03 +0000
Received: by outflank-mailman (input) for mailman id 532392;
 Tue, 09 May 2023 16:48:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Biuh=A6=citrix.com=prvs=486aa7bf2=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1pwQVN-0004DS-To
 for xen-devel@lists.xenproject.org; Tue, 09 May 2023 16:48:01 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4054dd7e-ee89-11ed-8611-37d641c3527e;
 Tue, 09 May 2023 18:47:59 +0200 (CEST)
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
X-Inumbo-ID: 4054dd7e-ee89-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1683650879;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=SlO5o6QMvWhWZy6Z5a5MuJGBudeCec69EU74MjRd1Wc=;
  b=LFxdp3oppPagKPwdmu8joI0J9vLSDIlFZ80dwrLlzd7wQLiFLXiR09FV
   2I3JAbX3CFf6ucBtVYyMsIg8YiV8jpmzp2WfGfes8DRWr7utZRKa/sWC6
   HngUob+ejzDdrQDZr96W6ZE7ssIU6kLyIWzqzC88VrkSU0pTZrljNSff4
   k=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 110875268
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:ArTh6aJLd15VoWIwFE+Rx5UlxSXFcZb7ZxGr2PjKsXjdYENS1T0Gx
 2QXW2iCP/aKM2rxe492ao+y8EgG6JWDztJlTwNlqX01Q3x08seUXt7xwmUcnc+xBpaaEB84t
 ZV2hv3odp1coqr0/0/1WlTZhSAgk/rOHvykU7Ss1hlZHWdMUD0mhQ9oh9k3i4tphcnRKw6Ws
 Jb5rta31GWNglaYCUpJrfPSwP9TlK6q4mhA4wRvPaojUGL2zBH5MrpOfcldEFOgKmVkNrbSb
 /rOyri/4lTY838FYj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnVaPpIAHOgdcS9qZwChxLid/
 jnvWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I+QrvBIAzt03ZHzaM7H09c4tBHBCp
 PExcgkJRSCzrtKJkei2cthz05FLwMnDZOvzu1llxDDdS/0nXYrCU+PB4towMDUY354UW6yEP
 oxANGQpNU6bC/FMEg5/5JYWleG0hn75YntApUicv6Yf6GnP1g1hlrPqNbI5f/TTHJ0FwRvC+
 DKuE2LRLgErJoaE2xu/8H+GoeDjmnjASdg9C+jtnhJtqALKnTFCYPEMbnO8pfC3okezQ9xbJ
 goY90IGvaU0sUCmUNT5dxm5u2Kf+A4RXcJKFO834x3LzbDbiy6GAkAUQzgHb8Yp3Oc/XTEw3
 0WFt8/oDzdo9raSTBqgGqy89G3of3JPdClbOHFCFFFeizX+nG0tpkjKX9oyHYfvt9neKQHZ8
 w/b9iUGtqpG2KbnyJ6H1VzAhjutoL3AQQg0+hjbUwqZ0+9pWGK2T9f2sAaGtJ6sOK7cFwDc5
 yZcx6By+chUVfmweDqxrPLh9V1Dz9KMK3XijFFmBPHNHBz9qif4Lei8DNyTTXqF0/romxezO
 Cc/WisLvve/2UeXgVdfOd7ZNijT5fGI+S7Zfv7VdMFSRZN6aRWK+ipjDWbJgTC2zRd1wP9gZ
 MfLGSpJMUv29Iw9lGbmLwvj+eVDKt8CKZP7GsmgkkXPPUu2b3+JU7YVWGazghQCxPrc+m39q
 o8PX/ZmPj0DCIUSlAGLq99MRb3LRFBnba3LRzt/LbHbe1U6RDl4VJc8A9oJIuRYokicrc+Ql
 lnVZ6OS4ACXaaHvQelSVk1eVQ==
IronPort-HdrOrdr: A9a23:gzMUWayNziQEcQXCgc6dKrPwKL1zdoMgy1knxilNoH1uA6qlfq
 WV9sjzuiWE7wr5J0tApTntAtjkfZqkz/JICOoqU4tKPjOIhILAFugLgLcKpQeQeBEWntQ36U
 4KSdkdNDSfNykfsS43iDPZL+od
X-Talos-CUID: 9a23:69SCf2D+kFAfpDP6E3Ni5UJFF+l/S3n2/Ef5E3DpU2tReaLAHA==
X-Talos-MUID: =?us-ascii?q?9a23=3AQETH+w9zv/3YB0JYoC8wzhWQf+t40rb0E1Isq5c?=
 =?us-ascii?q?Lke6LGSsrACbHoyviFw=3D=3D?=
X-IronPort-AV: E=Sophos;i="5.99,262,1677560400"; 
   d="scan'208";a="110875268"
Date: Tue, 9 May 2023 17:47:33 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Olaf Hering <olaf@aepfle.de>
CC: <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v1] tools: drop bogus and obsolete ptyfuncs.m4
Message-ID: <9fd06ad0-4c21-43be-ac48-8d30844535ad@perard>
References: <20230502204800.10733-1-olaf@aepfle.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230502204800.10733-1-olaf@aepfle.de>

On Tue, May 02, 2023 at 08:48:00PM +0000, Olaf Hering wrote:
> According to openpty(3) it is required to include <pty.h> to get the
> prototypes for openpty() and login_tty(). But this is not what the
> function AX_CHECK_PTYFUNCS actually does. It makes no attempt to include
> the required header.
> 
> The two source files which call openpty() and login_tty() already contain
> the conditionals to include the required header.
> 
> Remove the bogus m4 file to fix build with clang, which complains about
> calls to undeclared functions.
> 
> Signed-off-by: Olaf Hering <olaf@aepfle.de>

That change isn't enough. And I'm not convinced that it needs to be
removed.

First, AX_CHECK_PTYFUNCS is still called in "tools/configure.ac".

Then, AX_CHECK_PTYFUNCS define INCLUDE_LIBUTIL_H and PTYFUNCS_LIBS.
Those two are still used in the tree.

Also, that that macro isn't just about the header, but also about the
needed library.

Thanks,

-- 
Anthony PERARD

