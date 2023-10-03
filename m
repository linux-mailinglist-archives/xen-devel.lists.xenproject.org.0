Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EB237B65F9
	for <lists+xen-devel@lfdr.de>; Tue,  3 Oct 2023 12:00:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.612171.952023 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qncCE-0007fP-JN; Tue, 03 Oct 2023 10:00:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 612171.952023; Tue, 03 Oct 2023 10:00:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qncCE-0007co-GB; Tue, 03 Oct 2023 10:00:06 +0000
Received: by outflank-mailman (input) for mailman id 612171;
 Tue, 03 Oct 2023 10:00:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8l/u=FR=gmail.com=bagasdotme@srs-se1.protection.inumbo.net>)
 id 1qncCC-0007Mp-Tf
 for xen-devel@lists.xenproject.org; Tue, 03 Oct 2023 10:00:04 +0000
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com
 [2607:f8b0:4864:20::634])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9c8b5b60-61d3-11ee-9b0d-b553b5be7939;
 Tue, 03 Oct 2023 11:59:59 +0200 (CEST)
Received: by mail-pl1-x634.google.com with SMTP id
 d9443c01a7336-1c5bf7871dcso5302995ad.1
 for <xen-devel@lists.xenproject.org>; Tue, 03 Oct 2023 02:59:59 -0700 (PDT)
Received: from debian.me ([103.131.18.64]) by smtp.gmail.com with ESMTPSA id
 u9-20020a17090341c900b001c1f161949fsm1088243ple.96.2023.10.03.02.59.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Oct 2023 02:59:57 -0700 (PDT)
Received: by debian.me (Postfix, from userid 1000)
 id CEF7581193F1; Tue,  3 Oct 2023 16:59:52 +0700 (WIB)
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
X-Inumbo-ID: 9c8b5b60-61d3-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696327198; x=1696931998; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7mfj166RZXa6+OGlC23mV90s8HoMj5oVIl7zgyFgTFU=;
        b=TnjMjR1ktrtPVmc6EflUmbO6ZIKIVDai9UG4VeaPyaj2SqztSRKggb43C5bTdZu0PM
         kCl++kZ0MB1G0KaYv8zyFw7EzYyLa330Z79ekfmoB6PmTAstrLEwQiINiTN1gZOHgBFm
         FKhZRn0Epv+ZFOxmZjxuyx43wuoQ36M2403MhwLHNRaw+iFfzZKvKQ667RwabgB6gvB1
         5IDtrLEAnYGejlTbGOFfA13r+h8MuIzPhqDtQzmDonmNj8OPTkpwPFPHTA0sKPsz/G0Y
         suTMQsG50d8LemB7FBUJBuNy21izdR3iCeKqEBELoYWAnoZN9H+x7GPY7F0M5SOvAHey
         WX+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696327198; x=1696931998;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7mfj166RZXa6+OGlC23mV90s8HoMj5oVIl7zgyFgTFU=;
        b=Hw4wtsEyTMPTJUy7xgytXNt+zl10Ne88e1DSNdTsbFFwf8VSMKgF/qDfi+H1QoqrTS
         PHQeSwD6QCbT82NEpODJG/9L9bOA2svqDQlICaLofzVY9C1TEgahP7WvnpRle0QTwtCU
         CACQN8KpzJVuR/CwyTfhWLYfRj5CMEkhq78+KWOCW2BDEnqKDUa638TXyzjbGmG3XRTh
         4U2tLyx4et9tl7jOOXA86PL8c1s3NaECBRBANMFWJUlI+Nfq9nBbV85UjliB63RcJxbA
         9C71E5yAO69W7vZ74dU7I8nIi/V6u9gVHrGyeCO1m1E40o6MLmH0k2LODc3i4nruLm45
         cw5g==
X-Gm-Message-State: AOJu0Yzd6/QsuPOHfgh7X/4vXHH/yz7idCthWNXHQjEBdC/JV5tMDM01
	/DXckM9Ps2WfdnynZnLNM+4Ecl8kso0=
X-Google-Smtp-Source: AGHT+IEcFB0/Nf7z2acAywtjf22FDYWrA9IDkrD58mbuzHGOwLkPwm0grCEuAMx9zkt09wQq3hfj/Q==
X-Received: by 2002:a17:902:d2cb:b0:1c4:fae:bf28 with SMTP id n11-20020a170902d2cb00b001c40faebf28mr14401254plc.32.1696327197979;
        Tue, 03 Oct 2023 02:59:57 -0700 (PDT)
Date: Tue, 3 Oct 2023 16:59:52 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Xin Li <xin3.li@intel.com>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-edac@vger.kernel.org,
	linux-hyperv@vger.kernel.org, kvm@vger.kernel.org,
	xen-devel@lists.xenproject.org
Cc: tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
	dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com,
	luto@kernel.org, pbonzini@redhat.com, seanjc@google.com,
	peterz@infradead.org, jgross@suse.com, ravi.v.shankar@intel.com,
	mhiramat@kernel.org, andrew.cooper3@citrix.com,
	jiangshanlai@gmail.com, nik.borisov@suse.com
Subject: Re: [PATCH v12 06/37] Documentation/x86/64: Add a documentation for
 FRED
Message-ID: <ZRvmGNRZ4IvmguAY@debian.me>
References: <20231003062458.23552-1-xin3.li@intel.com>
 <20231003062458.23552-7-xin3.li@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="LN8xCBDRRuLQePIA"
Content-Disposition: inline
In-Reply-To: <20231003062458.23552-7-xin3.li@intel.com>


--LN8xCBDRRuLQePIA
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 02, 2023 at 11:24:27PM -0700, Xin Li wrote:
> diff --git a/Documentation/arch/x86/x86_64/fred.rst b/Documentation/arch/=
x86/x86_64/fred.rst
> new file mode 100644
> index 000000000000..9f57e7b91f7e
> --- /dev/null
> +++ b/Documentation/arch/x86/x86_64/fred.rst
> @@ -0,0 +1,96 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +Flexible Return and Event Delivery (FRED)
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +Overview
> +=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +The FRED architecture defines simple new transitions that change
> +privilege level (ring transitions). The FRED architecture was
> +designed with the following goals:
> +
> +1) Improve overall performance and response time by replacing event
> +   delivery through the interrupt descriptor table (IDT event
> +   delivery) and event return by the IRET instruction with lower
> +   latency transitions.
> +
> +2) Improve software robustness by ensuring that event delivery
> +   establishes the full supervisor context and that event return
> +   establishes the full user context.
> +
> +The new transitions defined by the FRED architecture are FRED event
> +delivery and, for returning from events, two FRED return instructions.
> +FRED event delivery can effect a transition from ring 3 to ring 0, but
> +it is used also to deliver events incident to ring 0. One FRED
> +instruction (ERETU) effects a return from ring 0 to ring 3, while the
> +other (ERETS) returns while remaining in ring 0. Collectively, FRED
> +event delivery and the FRED return instructions are FRED transitions.
> +
> +In addition to these transitions, the FRED architecture defines a new
> +instruction (LKGS) for managing the state of the GS segment register.
> +The LKGS instruction can be used by 64-bit operating systems that do
> +not use the new FRED transitions.
> +
> +Furthermore, the FRED architecture is easy to extend for future CPU
> +architectures.
> +
> +Software based event dispatching
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +FRED operates differently from IDT in terms of event handling. Instead
> +of directly dispatching an event to its handler based on the event
> +vector, FRED requires the software to dispatch an event to its handler
> +based on both the event's type and vector. Therefore, an event dispatch
> +framework must be implemented to facilitate the event-to-handler
> +dispatch process. The FRED event dispatch framework takes control
> +once an event is delivered, and employs a two-level dispatch.
> +
> +The first level dispatching is event type based, and the second level
> +dispatching is event vector based.
> +
> +Full supervisor/user context
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
> +
> +FRED event delivery atomically save and restore full supervisor/user
> +context upon event delivery and return. Thus it avoids the problem of
> +transient states due to %cr2 and/or %dr6, and it is no longer needed
> +to handle all the ugly corner cases caused by half baked entry states.
> +
> +FRED allows explicit unblock of NMI with new event return instructions
> +ERETS/ERETU, avoiding the mess caused by IRET which unconditionally
> +unblocks NMI, e.g., when an exception happens during NMI handling.
> +
> +FRED always restores the full value of %rsp, thus ESPFIX is no longer
> +needed when FRED is enabled.
> +
> +LKGS
> +=3D=3D=3D=3D
> +
> +LKGS behaves like the MOV to GS instruction except that it loads the
> +base address into the IA32_KERNEL_GS_BASE MSR instead of the GS
> +segment=E2=80=99s descriptor cache. With LKGS, it ends up with avoiding
> +mucking with kernel GS, i.e., an operating system can always operate
> +with its own GS base address.
> +
> +Because FRED event delivery from ring 3 and ERETU both swap the value
> +of the GS base address and that of the IA32_KERNEL_GS_BASE MSR, plus
> +the introduction of LKGS instruction, the SWAPGS instruction is no
> +longer needed when FRED is enabled, thus is disallowed (#UD).
> +
> +Stack levels
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +4 stack levels 0~3 are introduced to replace the nonreentrant IST for
> +event handling, and each stack level should be configured to use a
> +dedicated stack.
> +
> +The current stack level could be unchanged or go higher upon FRED
> +event delivery. If unchanged, the CPU keeps using the current event
> +stack. If higher, the CPU switches to a new event stack specified by
> +the MSR of the new stack level, i.e., MSR_IA32_FRED_RSP[123].
> +
> +Only execution of a FRED return instruction ERET[US], could lower the
> +current stack level, causing the CPU to switch back to the stack it was
> +on before a previous event delivery that promoted the stack level.

LGTM, thanks!

Reviewed-by: Bagas Sanjaya <bagasdotme@gmail.com>

--=20
An old man doll... just what I always wanted! - Clara

--LN8xCBDRRuLQePIA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZRvmEwAKCRD2uYlJVVFO
o5qOAQDw8M+2297q5X5j+JlTjJmKURsOh0vN4+TkT6xGTw1/oAEA7lexKTaNoRJm
dwxTvxrQ6FWCfYMKDNZLsLpxSIwB3AQ=
=e3m/
-----END PGP SIGNATURE-----

--LN8xCBDRRuLQePIA--

