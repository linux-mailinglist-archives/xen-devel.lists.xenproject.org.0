Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3413530EFA2
	for <lists+xen-devel@lfdr.de>; Thu,  4 Feb 2021 10:26:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.81190.149536 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l7atv-00060O-4s; Thu, 04 Feb 2021 09:26:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 81190.149536; Thu, 04 Feb 2021 09:26:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l7atv-0005zz-1m; Thu, 04 Feb 2021 09:26:11 +0000
Received: by outflank-mailman (input) for mailman id 81190;
 Thu, 04 Feb 2021 09:26:09 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SI1E=HG=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1l7att-0005zu-Kp
 for xen-devel@lists.xenproject.org; Thu, 04 Feb 2021 09:26:09 +0000
Received: from mail-wr1-x432.google.com (unknown [2a00:1450:4864:20::432])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 738f4b5e-d347-4486-8735-4827e2d7c01e;
 Thu, 04 Feb 2021 09:26:07 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id v15so2637207wrx.4
 for <xen-devel@lists.xenproject.org>; Thu, 04 Feb 2021 01:26:07 -0800 (PST)
Received: from CBGR90WXYV0 (host86-190-149-163.range86-190.btcentralplus.com.
 [86.190.149.163])
 by smtp.gmail.com with ESMTPSA id l1sm4921463wmq.17.2021.02.04.01.26.05
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 04 Feb 2021 01:26:06 -0800 (PST)
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
X-Inumbo-ID: 738f4b5e-d347-4486-8735-4827e2d7c01e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
         :mime-version:content-transfer-encoding:thread-index
         :content-language;
        bh=YgMIO4QlRwtCHJVXKAiPwTXPhhYr/y0FarmhJ4l+GWg=;
        b=KWPFBkvXrwU8Ckk1aSirKduTBDoltf2vZN3HLAhSMk0QmNsB9Pa94Z3KeOVn8Pehw5
         juv7N+7qcwIbqQuQNUh1jaZErsuD41jObLSNbru/Ebkz2qcqWJy7Nor+Bu6DH+oQTFAk
         xcRm5y6EbVHHDqr8p9qMNyemlfVriWjTrbAa1+xJ1CnizVW6meAa2Dcg1AhZQZq9JKjq
         j5SZAEbV3YY7RdRgMhf07NRvLbVnJA5/zZSwHbh+OPq7D89ZV7YqoEwfxrf+n3j+Ven4
         rrEx2/KjrT2/K7eOBpQVkcOwzNEqkd/9SUVAUO07+jIi/wKZuB1wB77s/ZKzpfas0fz0
         Q5hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
         :subject:date:message-id:mime-version:content-transfer-encoding
         :thread-index:content-language;
        bh=YgMIO4QlRwtCHJVXKAiPwTXPhhYr/y0FarmhJ4l+GWg=;
        b=CfW/upeNILWtyyPlP45cBV+4R5+mILkDcmQTAa0r8hxSTE8Oe3cKTpfCxu+GFhwDiH
         8beTK75q0xaYKRrho93cT6fEG1lxdJxXUdgmC9zEJaxg30HsptqhjhJv6LM6y8Ud0WXI
         wkWiRQ4jCBaBA0AmBv5A3ADuG6rkZqd9VVdoredQH9TKfoJ+JWBNBmUwGcFpjMzCS8Vj
         w+CMH9EEL8aPi7ieLs3bVGuClmK+Yejv6QqodT8mQ50K9NJBp54y+VBZ9RZPXIkSuSGX
         XUz8pRMn3bv3nbYSn/u5GvCcOsWxJAmJTF8qb7Xw4ERH/f2kvHkhxLhQZEou7rWMofDs
         eRxQ==
X-Gm-Message-State: AOAM533DfVjOcyX5T7NI8IaaGd2URsu2WnpqMozGfQUTi+TnjY9m283X
	3Gy4GluJKzvbtQXDV8e/oIs=
X-Google-Smtp-Source: ABdhPJw3yoDv4R0uoiSYO+6vjaWmMyHJ2+Oewx7bQpV8FIdzH8YG2PDLfJ8YJd4hUfJtZVmiaj/Y0w==
X-Received: by 2002:adf:8b47:: with SMTP id v7mr8119940wra.133.1612430766601;
        Thu, 04 Feb 2021 01:26:06 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
Reply-To: <paul@xen.org>
To: "'Jan Beulich'" <jbeulich@suse.com>,
	<xen-devel@lists.xenproject.org>
Cc: "'Andrew Cooper'" <andrew.cooper3@citrix.com>,
	"'Wei Liu'" <wl@xen.org>,
	=?utf-8?Q?'Roger_Pau_Monn=C3=A9'?= <roger.pau@citrix.com>,
	"'Julien Grall'" <julien@xen.org>,
	"'Stefano Stabellini'" <sstabellini@kernel.org>,
	"'George Dunlap'" <george.dunlap@citrix.com>
References: <0e7265fe-8d89-facb-790d-9232c742c3fa@suse.com> <e2682f84-b3bb-b9fb-edd8-863b9036de95@suse.com>
In-Reply-To: <e2682f84-b3bb-b9fb-edd8-863b9036de95@suse.com>
Subject: RE: [PATCH v2 2/2] IOREQ: refine when to send mapcache invalidation request
Date: Thu, 4 Feb 2021 09:26:04 -0000
Message-ID: <03fb01d6fad7$c39087b0$4ab19710$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQHgg/zPp1o/mkuzupLKGuAOuFa3bwGR/APtqigXZrA=
Content-Language: en-gb



> -----Original Message-----
> From: Jan Beulich <jbeulich@suse.com>
> Sent: 02 February 2021 15:15
> To: xen-devel@lists.xenproject.org
> Cc: Andrew Cooper <andrew.cooper3@citrix.com>; Wei Liu <wl@xen.org>; =
Roger Pau Monn=C3=A9
> <roger.pau@citrix.com>; Paul Durrant <paul@xen.org>; Julien Grall =
<julien@xen.org>; Stefano Stabellini
> <sstabellini@kernel.org>; George Dunlap <george.dunlap@citrix.com>
> Subject: [PATCH v2 2/2] IOREQ: refine when to send mapcache =
invalidation request
>=20
> XENMEM_decrease_reservation isn't the only means by which pages can =
get
> removed from a guest, yet all removals ought to be signaled to qemu. =
Put
> setting of the flag into the central p2m_remove_page() underlying all
> respective hypercalls as well as a few similar places, mainly in PoD
> code.
>=20
> Additionally there's no point sending the request for the local domain
> when the domain acted upon is a different one. The latter domain's =
ioreq
> server mapcaches need invalidating. We assume that domain to be paused
> at the point the operation takes place, so sending the request in this
> case happens from the hvm_do_resume() path, which as one of its first
> steps calls handle_hvm_io_completion().
>=20
> Even without the remote operation aspect a single domain-wide flag
> doesn't do: Guests may e.g. decrease-reservation on multiple vCPU-s in
> parallel. Each of them needs to issue an invalidation request in due
> course, in particular because exiting to guest context should not =
happen
> before the request was actually seen by (all) the emulator(s).
>=20
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> v2: Preemption related adjustment split off. Make flag per-vCPU. More
>     places to set the flag. Also handle acting on a remote domain.
>     Re-base.

I'm wondering if a per-vcpu flag is overkill actually. We just need to =
make sure that we don't miss sending an invalidation where multiple =
vcpus are in play. The mapcache in the emulator is global so issuing an =
invalidate for every vcpu is going to cause an unnecessary storm of =
ioreqs, isn't it? Could we get away with the per-domain atomic counter?

  Paul


