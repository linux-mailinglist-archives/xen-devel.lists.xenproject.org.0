Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AF59D1D7B2C
	for <lists+xen-devel@lfdr.de>; Mon, 18 May 2020 16:25:06 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jaghE-0005Pu-7d; Mon, 18 May 2020 14:24:48 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TuVG=7A=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1jaghC-0005Pp-Am
 for xen-devel@lists.xenproject.org; Mon, 18 May 2020 14:24:46 +0000
X-Inumbo-ID: 4f4d1c87-9913-11ea-a86a-12813bfff9fa
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4f4d1c87-9913-11ea-a86a-12813bfff9fa;
 Mon, 18 May 2020 14:24:40 +0000 (UTC)
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: wzFvJ0cZeqwqiNab3YVcZR2JPAzp5A/NTFcMfCFqHZ5V5eqO/7msNgRTOgTlzJE3DPhC4tGaeM
 kue2Bmr84iE5xPmhSAnGlwiLRmeaSd4cIE14TD8UuPNbPclEEKdWve5b2eu/+QLyijmM2w8fFD
 pteljN0YRQj0n/b6gM2OmdptFf8tqt4MpvOavbBv1GcssoiUL/qrEa2mz7bBxRh38UalE6ZABJ
 70WOlynCZ4T9WWZ+kcN5ug55GGozFxvp0YAwqoH/gnMelZgujSVJx90IXaMp9joGCOmf5qHATg
 jPA=
X-SBRS: 2.7
X-MesageID: 18068792
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,407,1583211600"; d="scan'208";a="18068792"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: 8bit
Message-ID: <24258.39586.245004.804616@mariner.uk.xensource.com>
Date: Mon, 18 May 2020 15:24:34 +0100
To: Jason Andryuk <jandryuk@gmail.com>
Subject: Re: [PATCH v6 09/18] libxl: add save/restore support for qemu-xen in
 stubdomain
In-Reply-To: <20200518011353.326287-10-jandryuk@gmail.com>
References: <20200518011353.326287-1-jandryuk@gmail.com>
 <20200518011353.326287-10-jandryuk@gmail.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
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
Cc: Anthony Perard <anthony.perard@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Marek =?iso-8859-1?Q?Marczykowski-G=F3recki?=
 <marmarek@invisiblethingslab.com>, Wei Liu <wl@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Jason Andryuk writes ("[PATCH v6 09/18] libxl: add save/restore support for qemu-xen in stubdomain"):
> From: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
...
>      if (state->saved_state) {
> -        /* This file descriptor is meant to be used by QEMU */
> -        *dm_state_fd = open(state->saved_state, O_RDONLY);
> -        flexarray_append(dm_args, "-incoming");
> -        flexarray_append(dm_args, GCSPRINTF("fd:%d",*dm_state_fd));
> +        if (is_stubdom) {
> +            /* Linux stubdomain must replace $STUBDOM_RESTORE_INCOMING_ARG
> +             * with the approriate fd:$num argument for the
> +             * STUBDOM_CONSOLE_RESTORE console 2.
> +             */
> +            flexarray_append(dm_args, "-incoming");
> +            flexarray_append(dm_args, "$STUBDOM_RESTORE_INCOMING_ARG");
> +        } else {
> +            /* This file descriptor is meant to be used by QEMU */
> +            *dm_state_fd = open(state->saved_state, O_RDONLY);
> +            flexarray_append(dm_args, "-incoming");
> +            flexarray_append(dm_args, GCSPRINTF("fd:%d",*dm_state_fd));

Hrk.  The stubdom script is expected to spot this particular value in
the dm_args array and seddery it.  OK.  This is, at leasst, sound.
I'm happy with the code and the protocol.

I think this needs a change to this doc:

  Subject: [PATCH v6 01/18] Document ioemu MiniOS stubdomain protocol

  +Toolstack to MiniOS ioemu stubdomain protocol
  +---------------------------------------------

Provided that you update the docs commit and take my ack off that,
please add my ack to this code :-).

Or you can fold the docs change into this commit, if you prefer, in
which case I'll review this patch again.

Thanks,
Ian.

