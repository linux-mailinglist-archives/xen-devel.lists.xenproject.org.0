Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 76E97766354
	for <lists+xen-devel@lfdr.de>; Fri, 28 Jul 2023 06:48:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.571319.894884 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qPFNU-0007tC-VI; Fri, 28 Jul 2023 04:47:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 571319.894884; Fri, 28 Jul 2023 04:47:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qPFNU-0007r0-SG; Fri, 28 Jul 2023 04:47:00 +0000
Received: by outflank-mailman (input) for mailman id 571319;
 Fri, 28 Jul 2023 04:46:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=DqrS=DO=m5p.com=ehem@srs-se1.protection.inumbo.net>)
 id 1qPFNT-0007qu-Q7
 for xen-devel@lists.xenproject.org; Fri, 28 Jul 2023 04:46:59 +0000
Received: from mailhost.m5p.com (mailhost.m5p.com [74.104.188.4])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c6a4affb-2d01-11ee-b24c-6b7b168915f2;
 Fri, 28 Jul 2023 06:46:56 +0200 (CEST)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
 by mailhost.m5p.com (8.16.1/8.15.2) with ESMTPS id 36S4kbWF078991
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Fri, 28 Jul 2023 00:46:43 -0400 (EDT) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.16.1/8.15.2/Submit) id 36S4ka3c078990;
 Thu, 27 Jul 2023 21:46:36 -0700 (PDT) (envelope-from ehem)
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
X-Inumbo-ID: c6a4affb-2d01-11ee-b24c-6b7b168915f2
Date: Thu, 27 Jul 2023 21:46:36 -0700
From: Elliott Mitchell <ehem+xen@m5p.com>
To: Justin Stitt <justinstitt@google.com>
Cc: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        xen-devel@lists.xenproject.org, alsa-devel@alsa-project.org,
        linux-kernel@vger.kernel.org, Kees Cook <keescook@chromium.org>
Subject: Re: [PATCH] ALSA: xen-front: refactor deprecated strncpy
Message-ID: <ZMNILDgqHEGf8fNF@mattapan.m5p.com>
References: <20230727-sound-xen-v1-1-89dd161351f1@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230727-sound-xen-v1-1-89dd161351f1@google.com>
X-Spam-Status: No, score=0.4 required=10.0 tests=KHOP_HELO_FCRDNS autolearn=no
	autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on mattapan.m5p.com

On Thu, Jul 27, 2023 at 09:53:24PM +0000, Justin Stitt wrote:
> Technically, my patch yields subtly different behavior. The original
> implementation with `strncpy` would fill the entire destination buffer
> with null bytes [3] while `strscpy` will leave the junk, uninitialized
> bytes trailing after the _mandatory_ NUL-termination. So, if somehow
> `pcm->name` or `card->driver/shortname/longname` require this
> NUL-padding behavior then `strscpy_pad` should be used. My
> interpretation, though, is that the aforementioned fields are just fine
> as NUL-terminated strings. Please correct my assumptions if needed and
> I'll send in a v2.

"uninitialized bytes" => "leak of sensitive information" => "security hole"

One hopes the unitialized bytes don't contain sensitive information, but
that is the start of the chain.  One can hope the VM on the other end is
friendly, but that isn't something to rely on.

I'm not in charge of any of the appropriate subsystems, I just happened
to randomly look at this as message on a mailing list I'm on.  Could be
the maintainers will find this acceptable.


-- 
(\___(\___(\______          --=> 8-) EHM <=--          ______/)___/)___/)
 \BS (    |         ehem+sigmsg@m5p.com  PGP 87145445         |    )   /
  \_CS\   |  _____  -O #include <stddisclaimer.h> O-   _____  |   /  _/
8A19\___\_|_/58D2 7E3D DDF4 7BA6 <-PGP-> 41D1 B375 37D0 8714\_|_/___/5445



