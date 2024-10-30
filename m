Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 378269B6280
	for <lists+xen-devel@lfdr.de>; Wed, 30 Oct 2024 13:03:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.828158.1243000 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t67QH-0006d7-7N; Wed, 30 Oct 2024 12:03:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 828158.1243000; Wed, 30 Oct 2024 12:03:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t67QH-0006bA-4g; Wed, 30 Oct 2024 12:03:37 +0000
Received: by outflank-mailman (input) for mailman id 828158;
 Wed, 30 Oct 2024 12:03:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wQZl=R2=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1t67QG-0006b4-Dp
 for xen-devel@lists.xenproject.org; Wed, 30 Oct 2024 12:03:36 +0000
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [2a00:1450:4864:20::232])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fc5e104c-96b6-11ef-a0c3-8be0dac302b0;
 Wed, 30 Oct 2024 13:03:33 +0100 (CET)
Received: by mail-lj1-x232.google.com with SMTP id
 38308e7fff4ca-2fb443746b8so61048081fa.0
 for <xen-devel@lists.xenproject.org>; Wed, 30 Oct 2024 05:03:33 -0700 (PDT)
Received: from localhost ([217.156.233.154]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5cbb631af38sm4700808a12.62.2024.10.30.05.03.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Oct 2024 05:03:31 -0700 (PDT)
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
X-Inumbo-ID: fc5e104c-96b6-11ef-a0c3-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjoyMzIiLCJoZWxvIjoibWFpbC1sajEteDIzMi5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6ImZjNWUxMDRjLTk2YjYtMTFlZi1hMGMzLThiZTBkYWMzMDJiMCIsInRzIjoxNzMwMjg5ODEzLjQ3MjkwNywic2VuZGVyIjoiYWxlamFuZHJvLnZhbGxlam9AY2xvdWQuY29tIiwicmVjaXBpZW50IjoieGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnIn0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1730289813; x=1730894613; darn=lists.xenproject.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=du2DzXjJp6yzynAei4vIIDyisv1OcR9Se4VuRx7GxJk=;
        b=c40fPZi4mJ+SYJfcNd1nZyUtuRI5IYWn1B+A6Cvi8iqS3t5BsPwpPbhpPcUjjoo+iF
         cdEiRvncTjgHYkLlRxIXm4Ez7a1pc71w/dAXp57uJHQ9QgwytoCjSws/78wD72y2PZ4s
         cEBtq7l+JN6OPXRpoWeFYfe8xsFAUIuFHXdE0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730289813; x=1730894613;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=du2DzXjJp6yzynAei4vIIDyisv1OcR9Se4VuRx7GxJk=;
        b=HhTtwyUH+QF5k2KaQS8YZ74bstgpcHVcfzyxkp0gNNiptfYG0hr5WSeZBPBBixMHMz
         FAQL+DlbDOtNDRD6o/8Pa5TZZhxr7eaKhdv8V8vcHc3R5R7sU6aHZOpHqk3twIwWfspj
         ya6I1ci+Qf9gIJ5NOHAo8SZj9uPNuWsnIBf9qphjnvU4QRAxJJZ35uaxrtXkkuKwYVQt
         w/I7Ong8Xd4hIIa1lcrzg6pnX9HCuWpe83GD5yO6CMVSgiu+l5zGPX7eTsoIXqpO9Eue
         FF3qRnVHEs4/ll93+5fGtc5Wo4jLGXTPjSIvWMjg3COZTAMl84zb+TAXRIciUbEyJ4I2
         0qJg==
X-Forwarded-Encrypted: i=1; AJvYcCVQnOXLO06WtrR3SqIMZA1Wtnnn1LHXc9TLR9rFP4RtWb3l9cfuN7WCEzroPx3+QjD4ZvVepM7jIHM=@lists.xenproject.org
X-Gm-Message-State: AOJu0Ywf6d4IzKyMV82bfgPxpb6jwyE4APjus8YKzB5ZvZHKeGvIwhqs
	NSI/OJvXqK1MLVbv+6k7M4WWhwPk0ZM1hETJPrdY/V4TybPEEc1+VL7HAokXHc0=
X-Google-Smtp-Source: AGHT+IE+hIjYnzDkzjjQTufXCgog2RyFhYeti1ab/HABqISg+ryI2xsRaP76XRt0xcfUHfB5qpgmoA==
X-Received: by 2002:a2e:a7ca:0:b0:2f7:ad6b:a31e with SMTP id 38308e7fff4ca-2fcbe09a70fmr72073021fa.31.1730289812796;
        Wed, 30 Oct 2024 05:03:32 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 30 Oct 2024 12:03:30 +0000
Message-Id: <D594JPJZA0NY.2XQ3SJ44SY8X@cloud.com>
Cc: =?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v7 02/10] xen/x86: Add initial x2APIC ID to the
 per-vLAPIC save area
From: "Alejandro Vallejo" <alejandro.vallejo@cloud.com>
To: "Jan Beulich" <jbeulich@suse.com>, "Andrew Cooper"
 <andrew.cooper3@citrix.com>
X-Mailer: aerc 0.18.2
References: <20241021154600.11745-1-alejandro.vallejo@cloud.com>
 <20241021154600.11745-3-alejandro.vallejo@cloud.com>
 <974538f8-10b5-4fa3-9069-df6655a5d86d@citrix.com>
 <b143ada2-9719-4701-9a03-36ee8607958f@suse.com>
In-Reply-To: <b143ada2-9719-4701-9a03-36ee8607958f@suse.com>

Hi,

On Wed Oct 30, 2024 at 6:37 AM GMT, Jan Beulich wrote:
> On 29.10.2024 21:30, Andrew Cooper wrote:
> > On 21/10/2024 4:45 pm, Alejandro Vallejo wrote:
> >> @@ -310,19 +309,16 @@ void guest_cpuid(const struct vcpu *v, uint32_t =
leaf,
> >>          break;
> >> =20
> >>      case 0xb:
> >> -        /*
> >> -         * In principle, this leaf is Intel-only.  In practice, it is=
 tightly
> >> -         * coupled with x2apic, and we offer an x2apic-capable APIC e=
mulation
> >> -         * to guests on AMD hardware as well.
> >> -         *
> >> -         * TODO: Rework topology logic.
> >> -         */
> >>          if ( p->basic.x2apic )
> >>          {
> >>              *(uint8_t *)&res->c =3D subleaf;
> >> =20
> >> -            /* Fix the x2APIC identifier. */
> >> -            res->d =3D v->vcpu_id * 2;
> >> +            /*
> >> +             * Fix the x2APIC identifier. The PV side is nonsensical,=
 but
> >> +             * we've always shown it like this so it's kept for compa=
t.
> >> +             */
> >=20
> > In hindsight I should changed "Fix the x2APIC identifier." when I
> > reworked this logic, but oh well - better late than never.
> >=20
> > /* The x2APIC_ID is per-vCPU, and fixed irrespective of the requested
> > subleaf. */
>
> Can we perhaps avoid "fix" in this comment? "Adjusted", "overwritten", or
> some such ought to do, without carrying a hint towards some bug somewhere=
.

I understood "fix" there as "pin" rather than "unbreak". Regardless I can a=
lso
rewrite it as "The x2APIC ID is per-vCPU and shown on all subleafs"

>
> >> --- a/xen/include/public/arch-x86/hvm/save.h
> >> +++ b/xen/include/public/arch-x86/hvm/save.h
> >> @@ -394,6 +394,8 @@ struct hvm_hw_lapic {
> >>      uint32_t             disabled; /* VLAPIC_xx_DISABLED */
> >>      uint32_t             timer_divisor;
> >>      uint64_t             tdt_msr;
> >> +    uint32_t             x2apic_id;
> >> +    uint32_t             rsvd_zero;
> >=20
> > ... we do normally spell it _rsvd; to make it extra extra clear that
> > people shouldn't be doing anything with it.
>
> Alternatively, to carry the "zero" in the name, how about _mbz?
>
> Jan

I'd prefer that to _rsvd, if anything to make it patently clear that leavin=
g
rubble is not ok.

Cheers,
Alejandro

