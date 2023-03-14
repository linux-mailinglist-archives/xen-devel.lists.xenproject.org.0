Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 459886B9F62
	for <lists+xen-devel@lfdr.de>; Tue, 14 Mar 2023 20:10:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.509794.786283 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcA26-0000TR-JS; Tue, 14 Mar 2023 19:10:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 509794.786283; Tue, 14 Mar 2023 19:10:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcA26-0000PC-GR; Tue, 14 Mar 2023 19:10:02 +0000
Received: by outflank-mailman (input) for mailman id 509794;
 Tue, 14 Mar 2023 19:10:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xZxk=7G=web.de=tachyon_gun@srs-se1.protection.inumbo.net>)
 id 1pcA25-0000JB-Em
 for xen-devel@lists.xenproject.org; Tue, 14 Mar 2023 19:10:01 +0000
Received: from mout.web.de (mout.web.de [212.227.17.12])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d10870bb-c29b-11ed-87f5-c1b5be75604c;
 Tue, 14 Mar 2023 20:10:00 +0100 (CET)
Received: from [92.76.123.191] ([92.76.123.191]) by web-mail.web.de
 (3c-app-webde-bap40.server.lan [172.19.172.40]) (via HTTP); Tue, 14 Mar
 2023 20:09:57 +0100
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
X-Inumbo-ID: d10870bb-c29b-11ed-87f5-c1b5be75604c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de; s=s29768273;
	t=1678820997; i=tachyon_gun@web.de;
	bh=K8b6TQ/yuFp8adhkzTY8OO+4t/3xvqoZl6YAW0PinoE=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
	b=rliAD70S+qkX8EwJR2Hbv1E9HcosKequRfhG0GZLg2dfT/iE6Rm2Fk3SOGbr35TkS
	 0ZgpJ0cKin6kKbuwDerMewcr7+kQX9G1oFMC5B1RDtL16rO22+IbEihWLZbTt19ZsO
	 HrNNiKoVTRTXVQpt8ds5k97I/WFFB5LbbxyerdJy75l1qAB5j8e6BDraL31NXW8dDR
	 3uzaloHdBorXvolXFKRUqvjRFHFnUKCBOjvI0Oo4ON3OCD6JsbewUCUCwGwYWojoI3
	 llqkl9poAC41TwLSpzkLHV+1tsR/UahgSjdVIKYslbKWEOmCneU60N17erFH6Iiv2a
	 Fwke7iw9MwtSA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
MIME-Version: 1.0
Message-ID: <trinity-4a07ad86-ea5d-415b-b8cc-e9f0289e1a10-1678820997547@3c-app-webde-bap40>
From: Denis <tachyon_gun@web.de>
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Aw: Re: [help] Xen 4.14.5 on Devuan 4.0 Chimaera, regression from
 Xen 4.0.1
Content-Type: text/plain; charset=UTF-8
Date: Tue, 14 Mar 2023 20:09:57 +0100
Importance: normal
Sensitivity: Normal
In-Reply-To: <805f8cbd-e6ce-85bb-7ad6-3c461fc41c07@suse.com>
References: <trinity-8973751a-6742-4309-b02d-0b4c38f4206e-1678390468345@3c-app-webde-bap36>
 <84f66bc0-ae7c-febe-9a15-98453c48d051@citrix.com>
 <ce1a289e-6ed7-9b5c-42f5-069f16bd6984@suse.com>
 <trinity-429ff607-c131-4745-8c96-9d7f6f61234f-1678481409956@3c-app-webde-bs42>
 <31151e94-b8b3-15ab-3680-e1c6e2e97530@suse.com>
 <trinity-7e872635-20a4-4120-a08d-2d62a77d2da5-1678756503867@3c-app-webde-bs22>
 <2afa0abe-abe5-a3d8-658f-abc466d78101@suse.com>
 <trinity-7c345507-5695-4649-a62b-be4dd793cc00-1678805608384@3c-app-webde-bap40>
 <40da0146-21fa-d5a9-7ae1-4ed2cf4a5785@suse.com>
 <trinity-720cf1eb-48bc-4eba-9e14-e9eb570b1e7f-1678812331526@3c-app-webde-bap40>
 <805f8cbd-e6ce-85bb-7ad6-3c461fc41c07@suse.com>
X-UI-Message-Type: mail
X-Priority: 3
X-Provags-ID: V03:K1:2DEchfj5kLglH60t5pKhF6di/C/5jzSlcXEACneDr4CyEgIN4s/Fb3Ctt+lCNvBU8reze
 T7G3BJ0UuyLgfRZUXbcxmktEbPUJZCF8xX0/SoxujG0wUe+gaU8D3Sv7tAP7DiAeBb3+giLZH3u9
 222vHN0toXzKLR6rEBprut3B8Hw+ue0sgJzaePRxSM0rgtAqfYM+FDc748fupcuJlj2lG206b6Aa
 Yr2vJjwQcRQw+pwfzozw9zDPxWI8fM/0Rio/1pRz4EQm/Vllm/t1g2SLcPWVBff71hUoKjRm979k
 ug=
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:HBWskucrB3o=;b3TWLp3Z9P+CV9FH3cUdVlbCDzH
 myVul0lPJkB0DeBHuqEPdYBX7aAg6wW3pdrtiWs1T3zSB5NwSiUKAROUnn7nG0MdnSWjIPotk
 h6tCtwxWI/0Ezi/iypULofKEI2hmPNUsKmkKutjTiXg3oO4HBwlRIjSOWDq8H7zCh5v16VybT
 kaFZZdd6qVqMoRYR0am/+Jyi3erPhfSgGiiqf+v+yIj04KOy82M0zF4BidvSg/RKJRKY0IRr7
 BfR//BhRlHkZWL+oYDBbB9kSLYdqo0fEGV9ys26xuqozTBognTqsqqZl5Ik23LEW/RRtB+xKz
 wGn858xLzAEl//okOUP+cZL+2zxo1H7/faqJFlYkX8+/VbvA0Aa/eC3sCiZbazsrI8BCSscLG
 9uakGDwzZQYlJ9O+oCZCySDxEwPU4cjcQgfbMHe1KnQTCQaFdsnCUxhJ84xITp5N/4ULkXPUl
 1/X/OcSDb6gX2gFHCdywKxh/Qi2FKTuws6PvMO5c1X0+FSMkcePqQ8Ot92kpGZCbDE82GyB/x
 wDnK5wkD2mG5st1FUX9i0+8xuQBx0IkUmiamqe3e2RmzcjogA9H+oENCzN6Wpz/LKRKzA7C98
 cn5ft+WgEc8azCQO6TXJSZZ7M38db3eN/TEQ0Eiuf1/DZlVd2XX2cYi7RyA3C89KRKUUKaknH
 yvZ/yNOWStV4g1/OWn8XlzgUvdvzgfIXlPoTFfKs0ASMMcPbs9F4WtSi88Nd6FjM1qBmgnRDD
 hESoqu/uYyh3BXuhCdCAbUh3W+8VO9udsCLB8pX6PsxFk7v1ufi8EDeKNE4GpjlqlKERRBsJP
 B2LtJuHy1Su+cqsRx2rSmG6w==
Content-Transfer-Encoding: quoted-printable

On 14.03.2023 17:59, Jan Beulich wrote:
> On 14.03.2023 17:45, Denis wrote:
> > On 14.03.2023 16:37, Jan Beulich wrote:
> >> On 14.03.2023 15:53, Denis wrote:
> >>> What tests could I do or what info should I provide to help?
> >>
> >> Boot plain Linux (no Xen underneath) and collect the full set of kern=
el
> >> boot messages (some distros store this at /var/log/boot.msg); "full"
> >> meaning we want to be able to see all output regardless of log-level.
> >
> > I'll attach some files from /var/log.
>
> Thanks, and there we go:
>
> [    0.121463] AMD-Vi: [Firmware Bug]: : No southbridge IOAPIC found
> [    0.121495] AMD-Vi: Disabling interrupt remapping
>
> It's 5.10, so somewhat old already, but from looking at the code I would=
n't
> expect anything else with a newer kernel.

So older versions (be it Kerenel or Xen) didn't look for a secondary South=
bridge IOAPIC?
If so, was that a change made due to the vulnerabilities in Xen due to pas=
sed-through
devices?
Just asking because age-old distros worked as it seems...


Denis

