Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FCED1EA6F7
	for <lists+xen-devel@lfdr.de>; Mon,  1 Jun 2020 17:38:47 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jfmVO-0004QG-4b; Mon, 01 Jun 2020 15:37:38 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=L6P3=7O=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1jfmVM-0004QB-I8
 for xen-devel@lists.xenproject.org; Mon, 01 Jun 2020 15:37:36 +0000
X-Inumbo-ID: d0880fbc-a41d-11ea-8993-bc764e2007e4
Received: from mail-ej1-x644.google.com (unknown [2a00:1450:4864:20::644])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d0880fbc-a41d-11ea-8993-bc764e2007e4;
 Mon, 01 Jun 2020 15:37:35 +0000 (UTC)
Received: by mail-ej1-x644.google.com with SMTP id y13so9630983eju.2
 for <xen-devel@lists.xenproject.org>; Mon, 01 Jun 2020 08:37:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:content-language
 :thread-index; bh=Jv6OLcuPiMadg4Gy5MXrfLGU1Fw3y+ypYx3GzGtHVNQ=;
 b=kJSAnnVRnctywj0SEBQdhKfpPDlyUXohjE8ty4wiPpM6c6ERAeHAwoDkzy4L9jK1uK
 QJl9rkBtKfCuA+o7gvsyrHzDgVgMuw7DxgG/QokrkZxmtmDrVMR6fcPp0hFvVkc8Qdex
 /kiiyi4al/vgQThjldAmpzx2ZFl4Ivol5ytOeq6UQ0frv9u9Usek6Q3DyoAkSnFsUxj+
 5G59AEZ59wtUO6Bk2/mqNen6G9STvSRFM/vxn0FvMX4j98nUKiftdVi8MooHDZgftOev
 FTlre0GpTtqGZZSKbyox0Ge6DbC2ZmyUpo3sSmC53vlG9dfN6xdJTjX7zSbtwSVp/Ibh
 feyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :content-language:thread-index;
 bh=Jv6OLcuPiMadg4Gy5MXrfLGU1Fw3y+ypYx3GzGtHVNQ=;
 b=dfxeZ0GKGEMwrAX3HE7ECc0Y+jaxvllD5QY950NIhdnMZmG8EQfqG3ZVze5c3me89q
 AhDlJk/pcOTLZ3FmprL7u/Ksq9vQmFwr0yNta3ebYefZ+Qx3cbnvbhjoAu8xUx22omLj
 /DNDitdgOPLCUD3DzoPmh2R8R0fA9+BZ/kDpqta1qYYBLXiAXkVdQNdmL6DRny1L+MoU
 fTPNw1pKbq8XjClertnF0RUSnMmVJbKNMJk0ln3mfKlQlvPjb7R77UBiQn36afqryY/V
 G4zoOhZzstUyy2BK3WbuvdhHcQ/oLXdItQQU033HcFYINRybQi2TzVOBu4/6QnNMhQuE
 xntg==
X-Gm-Message-State: AOAM533amLV/DwupfXnd1Ni+BqotsEu0/lt46EQVlFL+e6gaiC0pFcxL
 pOT6sqK9WRhQo27toFeTbN/5UcbBMkE=
X-Google-Smtp-Source: ABdhPJwItA1ZrD0csIEGa4tBgOSi3EAFJcENfk47bC4g0m0ceSjQghyh9qxWhM+FwJ5xqllBmCP/0A==
X-Received: by 2002:a17:906:8387:: with SMTP id
 p7mr8985850ejx.323.1591025854414; 
 Mon, 01 Jun 2020 08:37:34 -0700 (PDT)
Received: from CBGR90WXYV0 (54-240-197-236.amazon.com. [54.240.197.236])
 by smtp.gmail.com with ESMTPSA id b24sm7566342edw.70.2020.06.01.08.37.33
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 01 Jun 2020 08:37:33 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: "'Andrew Cooper'" <andrew.cooper3@citrix.com>,
 "'Xen-devel'" <xen-devel@lists.xenproject.org>
References: <20200601145755.3661-1-andrew.cooper3@citrix.com>
In-Reply-To: <20200601145755.3661-1-andrew.cooper3@citrix.com>
Subject: RE: [PATCH for-4.14] x86/ucode: Fix errors with start/end_update()
Date: Mon, 1 Jun 2020 16:37:32 +0100
Message-ID: <001701d6382a$91b94b70$b52be250$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQIqvXK6hdkmpmdfDaUWiTnUn1sFw6ga2f/Q
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
Cc: 'Wei Liu' <wl@xen.org>, 'Jan Beulich' <JBeulich@suse.com>,
 =?utf-8?Q?'Roger_Pau_Monn=C3=A9'?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> -----Original Message-----
> From: Andrew Cooper <andrew.cooper3@citrix.com>
> Sent: 01 June 2020 15:58
> To: Xen-devel <xen-devel@lists.xenproject.org>
> Cc: Andrew Cooper <andrew.cooper3@citrix.com>; Jan Beulich =
<JBeulich@suse.com>; Wei Liu <wl@xen.org>;
> Roger Pau Monn=C3=A9 <roger.pau@citrix.com>; Paul Durrant =
<paul@xen.org>
> Subject: [PATCH for-4.14] x86/ucode: Fix errors with =
start/end_update()
>=20
> c/s 9267a439c "x86/ucode: Document the behaviour of the microcode_ops =
hooks"
> identified several poor behaviours of the =
start_update()/end_update_percpu()
> hooks.
>=20
> AMD have subsequently confirmed that OSVW don't, and are not expected =
to,
> change across a microcode load, rendering all of this complexity =
unecessary.
>=20
> Instead of fixing up the logic to not leave the OSVW state reset in a =
number
> of corner cases, delete the logic entirely.  This in turn allows for =
the
> removal of the poorly-named 'start_update' parameter to
> microcode_update_one().
>=20
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Wei Liu <wl@xen.org>
> CC: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
> CC: Paul Durrant <paul@xen.org>
>=20
> This wants backporting to 4.13, hence considering for 4.14 at this =
point.

Release-acked-by: Paul Durrant <paul@xen.org>

> ---
>  xen/arch/x86/acpi/power.c            |  2 +-
>  xen/arch/x86/cpu/microcode/amd.c     | 17 -----------------
>  xen/arch/x86/cpu/microcode/core.c    | 33 =
+++------------------------------
>  xen/arch/x86/cpu/microcode/private.h | 14 --------------
>  xen/arch/x86/smpboot.c               |  2 +-
>  xen/include/asm-x86/microcode.h      |  2 +-
>  6 files changed, 6 insertions(+), 64 deletions(-)
>=20
> diff --git a/xen/arch/x86/acpi/power.c b/xen/arch/x86/acpi/power.c
> index 0cda362045..dfffe08e18 100644
> --- a/xen/arch/x86/acpi/power.c
> +++ b/xen/arch/x86/acpi/power.c
> @@ -287,7 +287,7 @@ static int enter_state(u32 state)
>      console_end_sync();
>      watchdog_enable();
>=20
> -    microcode_update_one(true);
> +    microcode_update_one();
>=20
>      if ( !recheck_cpu_features(0) )
>          panic("Missing previously available feature(s)\n");
> diff --git a/xen/arch/x86/cpu/microcode/amd.c =
b/xen/arch/x86/cpu/microcode/amd.c
> index 3f0969e70d..11e24637e7 100644
> --- a/xen/arch/x86/cpu/microcode/amd.c
> +++ b/xen/arch/x86/cpu/microcode/amd.c
> @@ -395,26 +395,9 @@ static struct microcode_patch =
*cpu_request_microcode(const void *buf, size_t siz
>      return patch;
>  }
>=20
> -#ifdef CONFIG_HVM
> -static int start_update(void)
> -{
> -    /*
> -     * svm_host_osvw_init() will be called on each cpu by calling =
'.end_update'
> -     * in common code.
> -     */
> -    svm_host_osvw_reset();
> -
> -    return 0;
> -}
> -#endif
> -
>  const struct microcode_ops amd_ucode_ops =3D {
>      .cpu_request_microcode            =3D cpu_request_microcode,
>      .collect_cpu_info                 =3D collect_cpu_info,
>      .apply_microcode                  =3D apply_microcode,
> -#ifdef CONFIG_HVM
> -    .start_update                     =3D start_update,
> -    .end_update_percpu                =3D svm_host_osvw_init,
> -#endif
>      .compare_patch                    =3D compare_patch,
>  };
> diff --git a/xen/arch/x86/cpu/microcode/core.c =
b/xen/arch/x86/cpu/microcode/core.c
> index d879d28787..18ebc07b13 100644
> --- a/xen/arch/x86/cpu/microcode/core.c
> +++ b/xen/arch/x86/cpu/microcode/core.c
> @@ -546,9 +546,6 @@ static int do_microcode_update(void *patch)
>      else
>          ret =3D secondary_thread_fn();
>=20
> -    if ( microcode_ops->end_update_percpu )
> -        microcode_ops->end_update_percpu();
> -
>      return ret;
>  }
>=20
> @@ -620,16 +617,6 @@ static long microcode_update_helper(void *data)
>      }
>      spin_unlock(&microcode_mutex);
>=20
> -    if ( microcode_ops->start_update )
> -    {
> -        ret =3D microcode_ops->start_update();
> -        if ( ret )
> -        {
> -            microcode_free_patch(patch);
> -            goto put;
> -        }
> -    }
> -
>      cpumask_clear(&cpu_callin_map);
>      atomic_set(&cpu_out, 0);
>      atomic_set(&cpu_updated, 0);
> @@ -728,28 +715,14 @@ static int __init microcode_init(void)
>  __initcall(microcode_init);
>=20
>  /* Load a cached update to current cpu */
> -int microcode_update_one(bool start_update)
> +int microcode_update_one(void)
>  {
> -    int err;
> -
>      if ( !microcode_ops )
>          return -EOPNOTSUPP;
>=20
>      microcode_ops->collect_cpu_info();
>=20
> -    if ( start_update && microcode_ops->start_update )
> -    {
> -        err =3D microcode_ops->start_update();
> -        if ( err )
> -            return err;
> -    }
> -
> -    err =3D microcode_update_cpu(NULL);
> -
> -    if ( microcode_ops->end_update_percpu )
> -        microcode_ops->end_update_percpu();
> -
> -    return err;
> +    return microcode_update_cpu(NULL);
>  }
>=20
>  /* BSP calls this function to parse ucode blob and then apply an =
update. */
> @@ -790,7 +763,7 @@ static int __init early_microcode_update_cpu(void)
>      spin_unlock(&microcode_mutex);
>      ASSERT(rc);
>=20
> -    return microcode_update_one(true);
> +    return microcode_update_one();
>  }
>=20
>  int __init early_microcode_init(void)
> diff --git a/xen/arch/x86/cpu/microcode/private.h =
b/xen/arch/x86/cpu/microcode/private.h
> index dc5c7a81ae..c00ba590d1 100644
> --- a/xen/arch/x86/cpu/microcode/private.h
> +++ b/xen/arch/x86/cpu/microcode/private.h
> @@ -46,20 +46,6 @@ struct microcode_ops {
>      int (*apply_microcode)(const struct microcode_patch *patch);
>=20
>      /*
> -     * Optional.  If provided and applicable to the specific update =
attempt,
> -     * is run once by the initiating CPU.  Returning an error will =
abort the
> -     * load attempt.
> -     */
> -    int (*start_update)(void);
> -
> -    /*
> -     * Optional.  If provided, called on every CPU which completes a =
microcode
> -     * load.  May be called in the case of some errors, and not =
others.  May
> -     * be called even if start_update() wasn't.
> -     */
> -    void (*end_update_percpu)(void);
> -
> -    /*
>       * Given two patches, are they both applicable to the current =
CPU, and is
>       * new a higher revision than old?
>       */
> diff --git a/xen/arch/x86/smpboot.c b/xen/arch/x86/smpboot.c
> index 13b3dade9c..f878a00760 100644
> --- a/xen/arch/x86/smpboot.c
> +++ b/xen/arch/x86/smpboot.c
> @@ -369,7 +369,7 @@ void start_secondary(void *unused)
>=20
>      initialize_cpu_data(cpu);
>=20
> -    microcode_update_one(false);
> +    microcode_update_one();
>=20
>      /*
>       * If MSR_SPEC_CTRL is available, apply Xen's default setting and =
discard
> diff --git a/xen/include/asm-x86/microcode.h =
b/xen/include/asm-x86/microcode.h
> index 9da63f992e..3b0234e9fa 100644
> --- a/xen/include/asm-x86/microcode.h
> +++ b/xen/include/asm-x86/microcode.h
> @@ -22,6 +22,6 @@ DECLARE_PER_CPU(struct cpu_signature, cpu_sig);
>  void microcode_set_module(unsigned int idx);
>  int microcode_update(XEN_GUEST_HANDLE(const_void), unsigned long =
len);
>  int early_microcode_init(void);
> -int microcode_update_one(bool start_update);
> +int microcode_update_one(void);
>=20
>  #endif /* ASM_X86__MICROCODE_H */
> --
> 2.11.0



