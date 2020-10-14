Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 04CB428E758
	for <lists+xen-devel@lfdr.de>; Wed, 14 Oct 2020 21:31:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.6984.18281 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kSmUi-0006mG-B9; Wed, 14 Oct 2020 19:31:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 6984.18281; Wed, 14 Oct 2020 19:31:28 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kSmUi-0006lr-7n; Wed, 14 Oct 2020 19:31:28 +0000
Received: by outflank-mailman (input) for mailman id 6984;
 Wed, 14 Oct 2020 19:31:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=x6PD=DV=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1kSmUg-0006lk-EV
 for xen-devel@lists.xenproject.org; Wed, 14 Oct 2020 19:31:26 +0000
Received: from mail-lj1-x243.google.com (unknown [2a00:1450:4864:20::243])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 749f7d32-3890-4b02-a482-08344a67e536;
 Wed, 14 Oct 2020 19:31:25 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id f21so643647ljh.7
 for <xen-devel@lists.xenproject.org>; Wed, 14 Oct 2020 12:31:25 -0700 (PDT)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=x6PD=DV=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
	id 1kSmUg-0006lk-EV
	for xen-devel@lists.xenproject.org; Wed, 14 Oct 2020 19:31:26 +0000
X-Inumbo-ID: 749f7d32-3890-4b02-a482-08344a67e536
Received: from mail-lj1-x243.google.com (unknown [2a00:1450:4864:20::243])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 749f7d32-3890-4b02-a482-08344a67e536;
	Wed, 14 Oct 2020 19:31:25 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id f21so643647ljh.7
        for <xen-devel@lists.xenproject.org>; Wed, 14 Oct 2020 12:31:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/sQlbZjIbCkTXYZuFjyqLr22q7RrXyITM6aG6gZEwQM=;
        b=rNxdRPukI2aQeQhs80XN7ERXfk63ATqoDHdvm4y6fcPdYqooy40XCDG+mjGJ1quewV
         z7av/j5tnGBmHnG6b58/4GDRUNcAgs5ydoPZ9E65HRy+GSHu7NynekJ6n0UfxHO64cPP
         vpSR9bJAwVJwNKyx2CSNOfRFVfGK0NTYhHySkYSscCpeUkzlpa5aCXDOL8kPOSr3pCsv
         nuZdBCNCy3LfrfJsxa8DHTQOUKl5pgQL09i0xx1efDyg+ZdQ2v+CruYimYf1CV0V9A1J
         rCBtMBXat2nRuhcVRshcQQtmEWHiUqRPBZ4uyw/Cr/yv546I2OcqKsI36wi+SQw98Xov
         Y5OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/sQlbZjIbCkTXYZuFjyqLr22q7RrXyITM6aG6gZEwQM=;
        b=L5++wcSnv+VYE6GtKWALA+sIkfQgbovshEeJSUMfkqYnGvlf0wPT55haOfOvYxnsdx
         SOO6FSiykdhrNfdELeezFxHZ2zc5KCCdsQv/XQcnFIrsheIXuaIMdN8q15u8kO57s//c
         nUgahJG588YcXrtcsFDeoI6ndzLUxnbUn35AkV31Dd3Ytn2lPpHyU/a6bnoQIM3dvSTo
         7GO/RuBii/QUK+dJ12XJEIbzZsPHToeHk0rRflcVbJtfcbVG5a2XbNjkmX4jhPqVbT7O
         U5fIUEAAw/DH3MMkEmxld3T7Kq85iTe3SJ8awfW3M/bpraA9/+uIjhgmfp1BeYbQsrKB
         8FmA==
X-Gm-Message-State: AOAM532wkzkwYlaEtw9Jro+FChyqP/LSOH6tq5bTCdarWffKpLEwtgr5
	e0+iB6HCm3b38CFwyiVGlJaukHmzKwgCoIEh4ns=
X-Google-Smtp-Source: ABdhPJzxtIT/fRFaxw4POtgjFD2lu3ZKUpuH6kSY1wBzaGoIgufVPV+KqKbHVmfWxJGA9ncNLpIa+gGMVDT1QoDcz2Q=
X-Received: by 2002:a2e:96d2:: with SMTP id d18mr67974ljj.407.1602703884588;
 Wed, 14 Oct 2020 12:31:24 -0700 (PDT)
MIME-Version: 1.0
References: <20201014175342.152712-1-jandryuk@gmail.com> <4973553f-fad2-83b9-fa19-26370ced2c2d@citrix.com>
In-Reply-To: <4973553f-fad2-83b9-fa19-26370ced2c2d@citrix.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Wed, 14 Oct 2020 15:31:13 -0400
Message-ID: <CAKf6xpvg0sk4V_txu-RYhK8cO4kLNSm8dFjEOCm38phMSYSorg@mail.gmail.com>
Subject: Re: [SUSPECTED SPAM][PATCH 0/2] Remove Xen PVH dependency on PCI
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>, Juergen Gross <jgross@suse.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, xen-devel <xen-devel@lists.xenproject.org>, 
	"H. Peter Anvin" <hpa@zytor.com>, open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, Oct 14, 2020 at 2:04 PM Andrew Cooper <andrew.cooper3@citrix.com> wrote:
>
> On 14/10/2020 18:53, Jason Andryuk wrote:
> > A Xen PVH domain doesn't have a PCI bus or devices,
>
> [*] Yet.

:)

> > so it doesn't need PCI support built in.
>
> Untangling the dependences is a good thing, but eventually we plan to
> put an optional PCI bus back in, e.g. for SRIOV usecases.

Yes, and to be clear this change doesn't preclude including the PCI
code.  I was just looking to remove code from my VMs that aren't using
PCI devices.

Regards,
Jason

