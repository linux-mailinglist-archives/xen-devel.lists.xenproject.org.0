Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C4CE2CD96D
	for <lists+xen-devel@lfdr.de>; Thu,  3 Dec 2020 15:41:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.43675.78527 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kkpnG-0005LO-3O; Thu, 03 Dec 2020 14:41:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 43675.78527; Thu, 03 Dec 2020 14:41:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kkpnF-0005Kd-Uh; Thu, 03 Dec 2020 14:41:13 +0000
Received: by outflank-mailman (input) for mailman id 43675;
 Thu, 03 Dec 2020 14:41:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ho2W=FH=gmail.com=tamas.k.lengyel@srs-us1.protection.inumbo.net>)
 id 1kkpnE-0005Ia-BI
 for xen-devel@lists.xenproject.org; Thu, 03 Dec 2020 14:41:12 +0000
Received: from mail-wm1-x343.google.com (unknown [2a00:1450:4864:20::343])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id eee0cced-9aa4-4e40-b8a4-305ce3a4e205;
 Thu, 03 Dec 2020 14:41:10 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id a3so4123647wmb.5
 for <xen-devel@lists.xenproject.org>; Thu, 03 Dec 2020 06:41:10 -0800 (PST)
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
X-Inumbo-ID: eee0cced-9aa4-4e40-b8a4-305ce3a4e205
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=HK1V8/imb7tnSnJOei6g4pqy91wESKuWzAGgLPwjHwg=;
        b=SZHioIOn5tVu6tr8ybd3wXB3XD17SHBvvUHrKmgn5nzUUr9WTl3tW9lNsgArUvLm3Q
         ZV3GxTDDTFehHtJdjsdJ5BNTTDJaCL5oRK9ZHNQw7fD5ihGhnx3tj9FufdD8WFm0sSpf
         8wVZjOPbIlVKMR7eCcx6dZz9Q9ot/QzVGKf3h+GM8CZJ7F5TkJaIUYVlMIPi1JIsT72I
         0J4+XFIg8yOWuRaGYxiD+tmLahsIKO+2kjlhnSjzQTkCiv3eLv9xpvctn97rsCcp3FDZ
         2XLnBvymwoxiob6wEQ4XHV1Hok+273jGdjVGI6NOtSYSKpT1Szhun0oekITnZhntGX4o
         G01A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=HK1V8/imb7tnSnJOei6g4pqy91wESKuWzAGgLPwjHwg=;
        b=F1QV2XpWOcbkvlQaMt5/dBVRPmiz/+qaQAeERyMDwT2LTXOQtz+ORHJXzbOd9uV7CG
         SmJtaYL0nxaRbAnZYcq3AeV6Qo8QZBHx4b4c+LaZdZMX59M1OXfT7NQXNeip7eapJxep
         3mI98r0O4WL2CKEhcSwwUthEh/ydfrjlZ6o4BMp4QxD8xVn1Elrkhc+A21jySSqri/hv
         S5/rzjKxwKAlo38FljQpxJcmkta0PNIldIaQfphcpOYBdoGowfHrenkKc3tVGJ0nKSyx
         Z9T6ewwVsnySFpiP3xf8kL3e7QdljAJZHMuhf5FOPxI04HxuXQcPCSahboqZwEfG0jki
         Km8Q==
X-Gm-Message-State: AOAM532AkROkozVAq36uPiAXIJQtznQXuN8BwX/RGpfT3rgAUmZDeVVY
	wbBe9O5+C3n0UILWETqVvIyEsKmPXeaHX71SB8c=
X-Google-Smtp-Source: ABdhPJz6l0FDh5GRb5vo96+kF3as3jgAwFUvAeJUW0gxT8LtGN2Hm+Rzn0Pgu341aLOD4TUKSaHHGmoYiW7hs+0kvzo=
X-Received: by 2002:a1c:4e0a:: with SMTP id g10mr3733729wmh.51.1607006469731;
 Thu, 03 Dec 2020 06:41:09 -0800 (PST)
MIME-Version: 1.0
References: <9d7a052a-6222-80ff-cbf1-612d4ca50c2a@suse.com>
 <d821c715-966a-b48b-a877-c5dac36822f0@suse.com> <17c90493-b438-fbc1-ca10-3bc4d89c4e5e@xen.org>
 <7a768bcd-80c1-d193-8796-7fb6720fa22a@suse.com>
In-Reply-To: <7a768bcd-80c1-d193-8796-7fb6720fa22a@suse.com>
From: Tamas K Lengyel <tamas.k.lengyel@gmail.com>
Date: Thu, 3 Dec 2020 09:40:34 -0500
Message-ID: <CABfawh=t+TK+Bm3JUee+ZZ7SSPRLtgnq162Sk17cKNKqJMRreA@mail.gmail.com>
Subject: Re: [PATCH v3 5/5] evtchn: don't call Xen consumer callback with
 per-channel lock held
To: Jan Beulich <jbeulich@suse.com>
Cc: Julien Grall <julien@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	George Dunlap <George.Dunlap@eu.citrix.com>, Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>, 
	Stefano Stabellini <sstabellini@kernel.org>, Tamas K Lengyel <lengyelt@ainfosec.com>, 
	Petre Ovidiu PIRCALABU <ppircalabu@bitdefender.com>, Alexandru Isaila <aisaila@bitdefender.com>, 
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, Dec 3, 2020 at 5:09 AM Jan Beulich <jbeulich@suse.com> wrote:
>
> On 02.12.2020 22:10, Julien Grall wrote:
> > On 23/11/2020 13:30, Jan Beulich wrote:
> >> While there don't look to be any problems with this right now, the lock
> >> order implications from holding the lock can be very difficult to follow
> >> (and may be easy to violate unknowingly). The present callbacks don't
> >> (and no such callback should) have any need for the lock to be held.
> >>
> >> However, vm_event_disable() frees the structures used by respective
> >> callbacks and isn't otherwise synchronized with invocations of these
> >> callbacks, so maintain a count of in-progress calls, for evtchn_close()
> >> to wait to drop to zero before freeing the port (and dropping the lock).
> >
> > AFAICT, this callback is not the only place where the synchronization is
> > missing in the VM event code.
> >
> > For instance, vm_event_put_request() can also race against
> > vm_event_disable().
> >
> > So shouldn't we handle this issue properly in VM event?
>
> I suppose that's a question to the VM event folks rather than me?

IMHO it would obviously be better if the Xen side could handle
situations like these gracefully. OTOH it is also reasonable to expect
the privileged toolstack to perform its own sanity checks before
disabling. Like right now for disabling vm_event we first pause the
VM, process all remaining events that were on the ring, and only then
disable the interface. This avoids the race condition mentioned above
(among other issues). It's not perfect - we ran into problems where
event replies don't have the desired effect because the VM is paused -
but for the most part doing this is sufficient. So I don't consider
this to be a priority at the moment. That said, if anyone is so
inclined to fix this up, I would be happy to review & ack.

Tamas

