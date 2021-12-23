Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9546247E604
	for <lists+xen-devel@lfdr.de>; Thu, 23 Dec 2021 16:50:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.251122.432363 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n0QLK-0003Mc-LU; Thu, 23 Dec 2021 15:49:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 251122.432363; Thu, 23 Dec 2021 15:49:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n0QLK-0003Ka-Hq; Thu, 23 Dec 2021 15:49:22 +0000
Received: by outflank-mailman (input) for mailman id 251122;
 Thu, 23 Dec 2021 15:49:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xdKn=RI=gmail.com=firemeteor.guo@srs-se1.protection.inumbo.net>)
 id 1n0QLK-0003KT-0Z
 for xen-devel@lists.xen.org; Thu, 23 Dec 2021 15:49:22 +0000
Received: from mail-io1-f45.google.com (mail-io1-f45.google.com
 [209.85.166.45]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e4522994-6407-11ec-bb0b-79c175774b5d;
 Thu, 23 Dec 2021 16:49:20 +0100 (CET)
Received: by mail-io1-f45.google.com with SMTP id u8so7630767iol.5
 for <xen-devel@lists.xen.org>; Thu, 23 Dec 2021 07:49:20 -0800 (PST)
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
X-Inumbo-ID: e4522994-6407-11ec-bb0b-79c175774b5d
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=G9c/L0SIJCU70WhuqWHTiXFgSxsq352JlPnfYky8nlI=;
        b=2f/9Slg8yjA2t7olZrFr8ykdvYtJvqAGy907IopIfCbiu/gthQKpJPB85OXr9TPVGH
         LXsZ2CTrLnQ/VncGJm4a3SZpsiSAmUI4FJopmjuQ9bl4ItpPNv8wwewfjTh+ax24ecZ8
         2IvoKsCc8d04iBaZfHtvj+4K/xvruO4T584N7EADEdEaGbaobqltniuQ6teXoHRRNX8O
         qPaoDPhUPEMwFOYoBGO7bG4OWC51wk5JoOCj+462DNmU52GK91GRBOaH8L4ElBcUfd+L
         B17QI1evR1zvSGE+voTUekVWjbYRLwNaEhTDdy5tExbaxlIXqMSzrPqpjOF0PCJjn5TL
         zAsA==
X-Gm-Message-State: AOAM5329jPwHYgM2I0T1NG4cncd8Y+m/DrhEcGyWIancNgGbmBtQ8EoW
	Q3iHcb1hvigLaiVD26VpIpJHpCuWX7yMkMgV0Vc=
X-Google-Smtp-Source: ABdhPJz43FfikZuVJAAN4Ox40RkZiOyRNWeyjNqKCEOgrKhsCQ87AKjaLn8pLtjh+OJVrqIV3d2D8oL1F93JH1YOnNM=
X-Received: by 2002:a05:6602:2bc2:: with SMTP id s2mr1478841iov.23.1640274559523;
 Thu, 23 Dec 2021 07:49:19 -0800 (PST)
MIME-Version: 1.0
References: <CAKhsbWZ5KCrwJqbchx31LWfaJeS=khP9sgoo4y8ZZqOexsUUdA@mail.gmail.com>
 <CAKhsbWYLC+cEuaJefi4Zy1ZcZaOtM6_2WV+9uq8=pTdi5NYLJA@mail.gmail.com>
 <CAKhsbWbv-Poscajj=Hwe3g6WO9b8VaZm39ygFnsbEfHTpRzrfA@mail.gmail.com>
 <YcHbuug9AECvKXm9@Air-de-Roger> <CAKhsbWZkSoM-N=HXfb_OeSGLqYMdtcxRph+=_vqp6tjHgikYVQ@mail.gmail.com>
 <YcInKtCNgA9v0k+c@Air-de-Roger>
In-Reply-To: <YcInKtCNgA9v0k+c@Air-de-Roger>
From: "G.R." <firemeteor@users.sourceforge.net>
Date: Thu, 23 Dec 2021 23:49:08 +0800
Message-ID: <CAKhsbWZMRMfrsWDcZLSS7q4ciR0UbyGE2sO-tN1dr+9juuEfsQ@mail.gmail.com>
Subject: Re: Possible bug? DOM-U network stopped working after fatal error
 reported in DOM0
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: xen-devel <xen-devel@lists.xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 22, 2021 at 3:13 AM Roger Pau Monn=C3=A9 <roger.pau@citrix.com>=
 wrote:

> Could you build a debug kernel with the following patch applied and
> give me the trace when it explodes?

Please find the trace and the kernel CL below.
Note, the domU get stuck into a bootloop with this assertion as the
situation will come back after domU restart and only dom0 reboot can
get the situation back to normal.
The trace I captured below is within the boot loop. I suspect the
initial trigger may look different. Will give it another try soon.

FreeBSD 12.2-RELEASE-p11 #0 c8625d629c3(truenas/12.0-stable)-dirty:
Wed Dec 22 20:26:46 UTC 2021
The repo is here: https://github.com/freenas/os.git

db:0:kdb.enter.default>  bt
Tracing pid 0 tid 101637 td 0xfffff80069cc4000
kdb_enter() at kdb_enter+0x37/frame 0xfffffe009f121460
vpanic() at vpanic+0x197/frame 0xfffffe009f1214b0
panic() at panic+0x43/frame 0xfffffe009f121510
xn_txq_mq_start_locked() at xn_txq_mq_start_locked+0x4c6/frame
0xfffffe009f121580
xn_txq_mq_start() at xn_txq_mq_start+0x84/frame 0xfffffe009f1215b0
ether_output_frame() at ether_output_frame+0xb4/frame 0xfffffe009f1215e0
ether_output() at ether_output+0x6a5/frame 0xfffffe009f121680
ip_output() at ip_output+0x1319/frame 0xfffffe009f1217e0
tcp_output() at tcp_output+0x1dbf/frame 0xfffffe009f121980
tcp_usr_send() at tcp_usr_send+0x3c9/frame 0xfffffe009f121a40
sosend_generic() at sosend_generic+0x440/frame 0xfffffe009f121af0
sosend() at sosend+0x66/frame 0xfffffe009f121b20
icl_send_thread() at icl_send_thread+0x44e/frame 0xfffffe009f121bb0
fork_exit() at fork_exit+0x80/frame 0xfffffe009f121bf0
fork_trampoline() at fork_trampoline+0xe/frame 0xfffffe009f121bf0

