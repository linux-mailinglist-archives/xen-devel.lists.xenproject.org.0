Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CF3F31EFC39
	for <lists+xen-devel@lfdr.de>; Fri,  5 Jun 2020 17:11:14 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jhDza-0006FV-Vx; Fri, 05 Jun 2020 15:10:46 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0ATx=7S=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1jhDzZ-0006FQ-H4
 for xen-devel@lists.xenproject.org; Fri, 05 Jun 2020 15:10:45 +0000
X-Inumbo-ID: ba5422a2-a73e-11ea-96fb-bc764e2007e4
Received: from mail-wr1-x441.google.com (unknown [2a00:1450:4864:20::441])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ba5422a2-a73e-11ea-96fb-bc764e2007e4;
 Fri, 05 Jun 2020 15:10:44 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id r7so10142980wro.1
 for <xen-devel@lists.xenproject.org>; Fri, 05 Jun 2020 08:10:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:content-language
 :thread-index; bh=IZoRVj27HCkcHvbu9sXMUWc2RYh8crvQ8silDUuIsFY=;
 b=mI7q6dcgPWRRev5M/MD0eMzY9oVSBgcBJRhrKA8qe3z2k27YfajYQg3wSowLQKJS+I
 WSy9wOGqUrYnaUZsmwVU5AK8VGMupmoxEd5iHOjiDObvn/BMQPM1SC9cdN4LRNd1Y0xI
 LifxclxWa/t+vQ2boMPU4kP3/vVY/IfjZ0+4N6lG/IDX2LZGYDFJWTBWShTqnQB9ahXa
 jAo2B1FBLJnUpszZsr/Ucx2moBxEwxwjl00tsYnYD90oFtpD/1kP9lUbPKoxFjfHo+Tp
 xBzW5jJ3ni0IOCWCwAjZfZyC2/wrjd2lmXSTNp7sezdnlyqUbcBck1cpuRWvTzgL8JOD
 K3PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :content-language:thread-index;
 bh=IZoRVj27HCkcHvbu9sXMUWc2RYh8crvQ8silDUuIsFY=;
 b=rLMh7ylbBcJoAQxm/yHnF3/Z9bSnP3Y4wfvZOkePtDvDhX5n4D+w04U66fVMLAokwN
 gFlTvnbF4CusIqgzUofMHFekvY8QL+nXIfGx2FKHdrCCAYHKFk2yqkdetlpgGppQA8uZ
 1ZQUaLyOJT8vczlv4kdXD3npTWJH8v+iK532fdy4DfHaYy/vhC6JO7VH3t2BpbB0w2rA
 86Enx1/MOYrxyV8yRaoVM7LAQJJ0eAL+U5Q6uxzwpLQK16yni0NJyLkm2VN5g/p3JQJ3
 YbILkZpWMwSoS0EKEMfipdVpMN4En3zk1pakfLDK3xf8V0Sb1GpogQsdtwmWKMwALEpA
 MCUg==
X-Gm-Message-State: AOAM531Y5zQpDhSnq478qHRPs7u31pvYliAGg1YfjTryzKsLwn9JKfpM
 5vqUih+jVNRi46DAafSdmi8=
X-Google-Smtp-Source: ABdhPJzaQbIq1F3YvIx7zjCSB4qpQQbNoYZeIoptz/1WrtaYcz3M5qPjd+Ocif2QG7EdvyuG9mRGPQ==
X-Received: by 2002:a5d:440c:: with SMTP id z12mr10357881wrq.241.1591369843967; 
 Fri, 05 Jun 2020 08:10:43 -0700 (PDT)
Received: from CBGR90WXYV0 ([54.239.6.185])
 by smtp.gmail.com with ESMTPSA id z16sm12465472wrm.70.2020.06.05.08.10.42
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 05 Jun 2020 08:10:43 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: "'Jan Beulich'" <jbeulich@suse.com>,
 =?UTF-8?Q?'Marek_Marczykowski-G=C3=B3recki'?=
 <marmarek@invisiblethingslab.com>
References: <20200604014621.GA203658@mail-itl>
 <e9c6dba3-2780-b155-5b12-3eb44dc31957@suse.com>
 <20200605111840.GE98582@mail-itl>
 <ae54e2f6-efc9-1c39-d33a-f633def549e0@suse.com>
In-Reply-To: <ae54e2f6-efc9-1c39-d33a-f633def549e0@suse.com>
Subject: RE: handle_pio looping during domain shutdown,
 with qemu 4.2.0 in stubdom
Date: Fri, 5 Jun 2020 16:10:42 +0100
Message-ID: <002301d63b4b$7b65bf60$72313e20$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQGjLdCXHS+ot6864srdbAQDyQsvoAIM6jibAY4RUisDBXtFN6j7Nxlw
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
Cc: 'xen-devel' <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> -----Original Message-----
> From: Xen-devel <xen-devel-bounces@lists.xenproject.org> On Behalf Of =
Jan Beulich
> Sent: 05 June 2020 15:00
> To: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingslab.com>
> Cc: xen-devel <xen-devel@lists.xenproject.org>
> Subject: Re: handle_pio looping during domain shutdown, with qemu =
4.2.0 in stubdom
>=20
> On 05.06.2020 13:18, Marek Marczykowski-G=C3=B3recki wrote:
> > On Fri, Jun 05, 2020 at 11:38:17AM +0200, Jan Beulich wrote:
> >> On 04.06.2020 03:46, Marek Marczykowski-G=C3=B3recki wrote:
> >>> Hi,
> >>>
> >>> (continuation of a thread from #xendevel)
> >>>
> >>> During system shutdown quite often I hit infinite stream of errors =
like
> >>> this:
> >>>
> >>>     (XEN) d3v0 Weird PIO status 1, port 0xb004 read 0xffff
> >>>     (XEN) domain_crash called from io.c:178
> >>>
> >>> This is all running on Xen 4.13.0 (I think I've got this with =
4.13.1
> >>> too), nested within KVM. The KVM part means everything is very =
slow, so
> >>> various race conditions are much more likely to happen.
> >>>
> >>> It started happening not long ago, and I'm pretty sure it's about
> >>> updating to qemu 4.2.0 (in linux stubdom), previous one was 3.0.0.
> >>>
> >>> Thanks to Andrew and Roger, I've managed to collect more info.
> >>>
> >>> Context:
> >>>     dom0: pv
> >>>     dom1: hvm
> >>>     dom2: stubdom for dom1
> >>>     dom3: hvm
> >>>     dom4: stubdom for dom3
> >>>     dom5: pvh
> >>>     dom6: pvh
> >>>
> >>> It starts I think ok:
> >>>
> >>>     (XEN) hvm.c:1620:d6v0 All CPUs offline -- powering off.
> >>>     (XEN) d3v0 handle_pio port 0xb004 read 0x0000
> >>>     (XEN) d3v0 handle_pio port 0xb004 read 0x0000
> >>>     (XEN) d3v0 handle_pio port 0xb004 write 0x0001
> >>>     (XEN) d3v0 handle_pio port 0xb004 write 0x2001
> >>>     (XEN) d4v0 XEN_DMOP_remote_shutdown domain 3 reason 0
> >>
> >> I can't seem to be able to spot the call site of this, in any of
> >> qemu, libxl, or libxc. I'm in particular curious as to the further
> >> actions taken on the domain after this was invoked: Do any ioreq
> >> servers get unregistered immediately (which I think would be a
> >> problem)?
> >
> > It is here:
> > https://github.com/qemu/qemu/blob/master/hw/i386/xen/xen-hvm.c#L1539
> >
> > I think it's called from cpu_handle_ioreq(), and I think the request
> > state is set to STATE_IORESP_READY before exiting (unless there is =
some
> > exit() hidden in another function used there).
>=20
> Thanks. There's nothing in surrounding code there that would =
unregister
> an ioreq server. But as said elsewhere, I don't know qemu very well,
> and hence I may easily overlook how else one may get unregistered
> prematurely.
>=20

See =
https://git.qemu.org/?p=3Dqemu.git;a=3Dcommit;h=3Dba7fdd64b6714af7e42dfbe=
5969caf62c0823f75

This makes sure the server is destroyed in the exit notifier (called =
when the QEMU process is killed)

  Paul

> Jan



