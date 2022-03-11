Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D8CC94D67C3
	for <lists+xen-devel@lfdr.de>; Fri, 11 Mar 2022 18:40:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.289196.490654 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nSjFB-0006ZC-Cx; Fri, 11 Mar 2022 17:40:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 289196.490654; Fri, 11 Mar 2022 17:40:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nSjFB-0006XJ-9s; Fri, 11 Mar 2022 17:40:01 +0000
Received: by outflank-mailman (input) for mailman id 289196;
 Fri, 11 Mar 2022 17:39:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bM73=TW=minervasys.tech=marco.solieri@srs-se1.protection.inumbo.net>)
 id 1nSjF9-0006XD-Mq
 for xen-devel@lists.xenproject.org; Fri, 11 Mar 2022 17:39:59 +0000
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [2a00:1450:4864:20::429])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 44e12c3d-a162-11ec-8eba-a37418f5ba1a;
 Fri, 11 Mar 2022 18:39:57 +0100 (CET)
Received: by mail-wr1-x429.google.com with SMTP id j17so14102968wrc.0
 for <xen-devel@lists.xenproject.org>; Fri, 11 Mar 2022 09:39:57 -0800 (PST)
Received: from localhost (nb2assolieri.mat.unimo.it. [155.185.4.56])
 by smtp.gmail.com with ESMTPSA id
 l10-20020a056000022a00b001f017dfb5cdsm9218270wrz.90.2022.03.11.09.39.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Mar 2022 09:39:55 -0800 (PST)
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
X-Inumbo-ID: 44e12c3d-a162-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minervasys-tech.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=0SdaYfl4J3Hk0WbpMOxuF3TK/zJq9KPEi4t5ysXyntE=;
        b=oFaq5fSN+T00BiBnW9bL/3uwgxBWm2+9KnXOP6HSd0K8QbxoqzL3Y0DoH/FQrIxv8B
         IjaEhQpb7zsyUtI4iKcRqwmMKWrG15gQ5fLmjMBqjLxJr9jJewxahZrufsFct1iq89ph
         UBZLG3EKSbw9zl9FLg/BMdLRd/exLp1fqNrGFJaVHM3O0jHpBYxuRVrjqApc+xGeiwtu
         4T+y+Zhu7w4pAY2xwVOcjcu/UXryckhhS1DOOuVY4eSthei4EE4lQfY+eCMQWthpI9em
         xRkR9/4RHbxkk75qF4V569B+JmBpbaMgvMTZ2hKCVVIoM+UMN6FYl5I3dnlWBW7tVPa2
         KgPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=0SdaYfl4J3Hk0WbpMOxuF3TK/zJq9KPEi4t5ysXyntE=;
        b=TPHo4oD+lbee3hgEcIk6kytnRTkpSB24LFV3LpCP/HvudQYItv2nZuRMkVPJn94W95
         YG8rISVAU8ObhV9CWKINGtqWc5vbrFMoG+azLM2LZngVRJNYX94Mip0mLwu9/EjzC/Li
         XCMTL/moq1UIwZAmrLElN6qPzHdqmKLEopoSv6Hy0HEgMMeMbf0JKYXJ9Wwy1OT1JMd5
         aP7/wuPR1HBOqtmgbA0Xh8ajgTkQz0+33gP+bcLFFguQ3N2BjWMX18Fgx5cutfbbncra
         gMqmiIikjGfNuHU7WLxPdTtEh6o3mmxJyk2psgTJareQ1oyVv1QN6Hqq4dBpmE3k828+
         i/Gg==
X-Gm-Message-State: AOAM533fqjYwVI9a+vsy5pwbEkEDnGCc8DtX8R+xsymYQiUEqAwHApzk
	L9D4dyNbZ0BKuJDGsZygx9sh6A==
X-Google-Smtp-Source: ABdhPJyg8aKhc8vuk69WmjSnIwv7hsQiQa64W/e+SK4MlIHWSo0If06v+PYctnm/HeNkwy1E/zK3PQ==
X-Received: by 2002:adf:a199:0:b0:1f0:20f5:8f79 with SMTP id u25-20020adfa199000000b001f020f58f79mr7690877wru.296.1647020397082;
        Fri, 11 Mar 2022 09:39:57 -0800 (PST)
Date: Fri, 11 Mar 2022 18:39:14 +0100
From: Marco Solieri <marco.solieri@minervasys.tech>
To: Julien Grall <julien@xen.org>
Cc: xen-devel@lists.xenproject.org,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	Marco Solieri <marco.solieri@unimore.it>,
	Andrea Bastoni <andrea.bastoni@minervasys.tech>,
	Luca Miccio <lucmiccio@gmail.com>
Subject: Re: [PATCH 16/36] xen/color alloc: implement color_from_page for
 ARM64
Message-ID: <20220311173914.mppkerpbme6roo6w@carbon.xt3.it>
References: <20220304174701.1453977-1-marco.solieri@minervasys.tech>
 <20220304174701.1453977-17-marco.solieri@minervasys.tech>
 <1bf96df3-3593-1c01-a571-a0ee6e63524e@xen.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="eddp35kr53vdp4fl"
Content-Disposition: inline
In-Reply-To: <1bf96df3-3593-1c01-a571-a0ee6e63524e@xen.org>


--eddp35kr53vdp4fl
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 04, 2022 at 08:54:35PM +0000, Julien Grall wrote:
> On 04/03/2022 17:46, Marco Solieri wrote:
> > The colored allocator should not make any assumptions on how a color
> > is defined, since the definition may change depending on the
> > architecture.
> IIUC, you are saying that the mapping between a physical address to a
> way is the same on every Armv8 processor.
>=20
> Can you provide a reference from the Arm Arm which confirm this
> statement?

We are actually stating quite the opposite.  Generally speaking, the Arm
ARM leaves as IMPLEMENTATION DEFINED many details that are needed to
determine how colouring should be defined, most notably:
- the physical vs virtual indexing, which determines whether colouring
  is possible;
- the cache line length and the degree of associativity, which determine
  the way size, which in turn, together with the page size selected by
  the OS/hypervisor, allows to compute the number of available colours;
- the number of levels of shared caches, which determines the number of
  different colour sets.

For the sake of simplicity, we wanted to decouple the notion of colour
=66rom the many hardware features that enable/suggest one of the
(sometimes many) instantiations.

All these details are usually reported in the processor TRM.  E.g., in
the A53 TRM [DDI 0500J] we read (Sec. 7.1):

| Optional tightly-coupled L2 cache that includes:
| =E2=80=94 Configurable L2 cache size of 128KB, 256KB, 512KB, 1MB and 2MB.
| =E2=80=94 Fixed line length of 64 bytes.
| =E2=80=94 Physically indexed and tagged cache.
| =E2=80=94 16-way set-associative cache structure.

A simplified version of this configuration is implemented in PATCH
06/36, where the fallback automatic configuration assumes that colouring
targets the LLC, and that this is the only shared cache level.

I hope that this clarify some points.


Cheers.

--=20
Marco Solieri, Ph.D.
CEO & Founder
Tel: +39-059-205-5182 -- Cell: +39-349-678-66-65 -- OpenPGP: 0x75822E7E

Minerva Systems SRL -- http://www.minervasys.tech
Via Campi 213/B, 41125, Modena, Italy -- PIVA/CF 03996890368

~~>
Discover how to easily optimise complex embedded solutions
for high-performance, safety and predictability. Together.

--eddp35kr53vdp4fl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOC2XMK2o3tvc3F09Ctn83XWCLn4FAmIriUIACgkQCtn83XWC
Ln6tlQ//ZOIJwN5Ddg1VBBaiG/3kEamnKVZcnuQpZFl/kzpSg9ko10ZmOzHjbvyQ
AHgyV2aEyfUCbNIGo4SgjTI7LmUnizNB8yu0bDsJZq/K76rWveqBB8bCG0CrtkNy
V7b71bcdz1dHFTI87tLnxUV67tQIYjGXm+ngmqHIJ4oRFCZE1LZpmFARyiskk2Cj
kAjgUCW1u39TQa/8hOZ7S2qZeFw1O9LlbLu78Y0tDqQz3L3qbUbhJECdgtEdHXOS
+CezapfznuwblhXkxoSF9BpmNo8i4VorJlA+QvFb1hA0510Yc7Q/6HbCPHKuOzf5
IhecLjUHU0mP9WTqGwuQSwZS4gj/RYjs7np8hLRPGEIMd0iS5TDAE3xiqRG0PJNP
38lMlYHiacMWod/IHiUtLWRc3GAkMpxPbPU9K4ZQ4lFbndPCpE8HVKBawggWpDEz
msUt74qUpSt8e5i0PoXRU6JpLzKtOeOPt9BUayKYdoAcuCwAxfxLj2wgEsuORUl/
ap5nANYpnZTQaJ3Q7fUiafmIB7TKs4cxALkkYNKB3kfCSW/mf7ydJCyAS+TSf/MC
awFyt6dKBZtSnQN4y2t/ix6WGzVb9l5Z8Z8uYyfkMe1O+ITj5u5hdsrIcUxMMzWg
WKhpgRKGYhosRhgOT20DZhmpxsiT1bwJ+7A543E+PWNmGc0x9PI=
=BNqq
-----END PGP SIGNATURE-----

--eddp35kr53vdp4fl--

