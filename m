Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 727BB25DF9C
	for <lists+xen-devel@lfdr.de>; Fri,  4 Sep 2020 18:16:52 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kEEOC-0005ls-7N; Fri, 04 Sep 2020 16:16:36 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6qam=CN=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1kEEOA-0005lm-AM
 for xen-devel@lists.xenproject.org; Fri, 04 Sep 2020 16:16:34 +0000
X-Inumbo-ID: 46c5f64f-f2af-4dd7-816b-68f390576d55
Received: from mail-wr1-x442.google.com (unknown [2a00:1450:4864:20::442])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 46c5f64f-f2af-4dd7-816b-68f390576d55;
 Fri, 04 Sep 2020 16:16:32 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id m6so7334929wrn.0
 for <xen-devel@lists.xenproject.org>; Fri, 04 Sep 2020 09:16:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:thread-index
 :content-language;
 bh=b5S2goIRS4moC2Pky/HQPqn4RRQnwG99BXlGjy+V9e0=;
 b=Ip0ssHAMIqGtWAJGryw9VacNceFHpsW/RwrwRc/0MYPtxoGlCRNEOyVbAwBTS/Ap23
 WHIxesGtHCnDHnEc8tDNe3/GOo06GicHDimevNb/zuAMbhfxvrfa5TPX6jIq5lx7qWwg
 e5QVE4v4ZQ0C1hy3RsWJ9kp2askWLjtxaiRIoZHu/PZ/bUSImgPlsu4KPS5s2mAsdPMj
 graoURYz5LAbuQxtsezkW57JFD8yu8IOODR3upPyAsBa6PHRqE6nNbTmBcs+gV4gA2+H
 vfm0VfHX/UVX3Fzr9XnfKYx/TfEWo7+qHBTGcVNJeW8LguMVDuoazE3WRU0Zg6A5CBv4
 2xMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :thread-index:content-language;
 bh=b5S2goIRS4moC2Pky/HQPqn4RRQnwG99BXlGjy+V9e0=;
 b=F0UJ1Kp1lERM3oOImkyRM9krOuAUtOHtErF+jek9njvy/iXYG4kwOwhwNNM0Y6XrQr
 V1mgb+lNRMCW6duhw8/a+hhozQlz0N3UgSBMjIFlygr1Vv+C78h152AnMTrKtI8nxwk4
 l+oalR9jxGjGgAnFO0DSMbB1o/4ansTAi03SJLHSbqpOrqugGgZvnhllYjVXWbkgkw00
 PnQPZGkcC3/aIWPz/44+VIRmw84seUbUaJGuL++mtJA+Jrgr1522a6gIMrVi2nHsHya6
 9oPA6tkFYWJpqCnFSHwNpzjKf32J2aV1xVvcYAd7NjW44baArYqQtgzbJj8SIZ++/HUb
 Q61w==
X-Gm-Message-State: AOAM5323EyheaWj3IDir/Fn2QSC8xd9xBlRafWgY8wps/zkq1J3G0jVv
 NR0FZghFenuaz429/Q88LLY=
X-Google-Smtp-Source: ABdhPJyzEU/0C9g/Gq4poiDfja5ehEjPOQ6lRiJua0bsKaSr3heXed/vGzWVJMilrT/WEf9GKHB3FA==
X-Received: by 2002:adf:81c6:: with SMTP id 64mr8095745wra.176.1599236191912; 
 Fri, 04 Sep 2020 09:16:31 -0700 (PDT)
Received: from CBGR90WXYV0 ([2a00:23c5:5785:9a01:c940:c3c6:26f0:df49])
 by smtp.gmail.com with ESMTPSA id f19sm12129902wmh.44.2020.09.04.09.16.30
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 04 Sep 2020 09:16:31 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: "'Jan Beulich'" <jbeulich@suse.com>,
	<xen-devel@lists.xenproject.org>
Cc: "'Andrew Cooper'" <andrew.cooper3@citrix.com>, "'Wei Liu'" <wl@xen.org>,
 =?UTF-8?Q?'Roger_Pau_Monn=C3=A9'?= <roger.pau@citrix.com>,
 "'Jun Nakajima'" <jun.nakajima@intel.com>,
 "'Kevin Tian'" <kevin.tian@intel.com>,
 "'George Dunlap'" <George.Dunlap@eu.citrix.com>
References: <96a4cc9b-b1fd-494c-9e99-6d3ca733dea9@suse.com>
In-Reply-To: <96a4cc9b-b1fd-494c-9e99-6d3ca733dea9@suse.com>
Subject: RE: [PATCH v3] x86/HVM: more consistently set I/O completion
Date: Fri, 4 Sep 2020 17:17:04 +0100
Message-ID: <003301d682d6$d4b5ba20$7e212e60$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQKLGnh8NTAXxwELiAxasezQUK7x/KfvK7uA
Content-Language: en-gb
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> -----Original Message-----
> From: Jan Beulich <jbeulich@suse.com>
> Sent: 27 August 2020 08:09
> To: xen-devel@lists.xenproject.org
> Cc: Andrew Cooper <andrew.cooper3@citrix.com>; Wei Liu <wl@xen.org>; =
Roger Pau Monn=C3=A9
> <roger.pau@citrix.com>; Paul Durrant <paul@xen.org>; Jun Nakajima =
<jun.nakajima@intel.com>; Kevin Tian
> <kevin.tian@intel.com>; George Dunlap <George.Dunlap@eu.citrix.com>
> Subject: [PATCH v3] x86/HVM: more consistently set I/O completion
>=20
> Doing this just in hvm_emulate_one_insn() is not enough.
> hvm_ud_intercept() and hvm_emulate_one_vm_event() can get invoked for
> insns requiring one or more continuations, and at least in principle
> hvm_emulate_one_mmio() could, too. Without proper setting of the =
field,
> handle_hvm_io_completion() will do nothing completion-wise, and in
> particular the missing re-invocation of the insn emulation paths will
> lead to emulation caching not getting disabled in due course, causing
> the ASSERT() in {svm,vmx}_vmenter_helper() to trigger.
>=20
> Reported-by: Don Slutz <don.slutz@gmail.com>
>=20
> Similar considerations go for the clearing of vio->mmio_access, which
> gets moved as well.
>=20
> Additionally all updating of vio->mmio_* now gets done dependent upon
> the new completion value, rather than hvm_ioreq_needs_completion()'s
> return value. This is because it is the completion chosen which =
controls
> what path will be taken when handling the completion, not the simple
> boolean return value. In particular, PIO completion doesn't involve
> going through the insn emulator, and hence emulator state ought to get
> cleared early (or it won't get cleared at all).
>=20
> The new logic, besides allowing for a caller override for the
> continuation type to be set (for VMX real mode emulation), will also
> avoid setting an MMIO completion when a simpler PIO one will do. This
> is a minor optimization only as a side effect - the behavior is =
strictly
> needed at least for hvm_ud_intercept(), as only memory accesses can
> successfully complete through handle_mmio(). Care of course needs to =
be
> taken to correctly deal with "mixed" insns (doing both MMIO and PIO at
> the same time, i.e. INS/OUTS). For this, hvmemul_validate() now =
latches
> whether the insn being emulated is a memory access, as this =
information
> is no longer easily available at the point where we want to consume =
it.
>=20
> Note that the presence of non-NULL .validate fields in the two ops
> structures in hvm_emulate_one_mmio() was really necessary even before
> the changes here: Without this, passing non-NULL as middle argument to
> hvm_emulate_init_once() is meaningless.
>=20
> The restrictions on when the #UD intercept gets actually enabled are =
why
> it was decided that this is not a security issue:
> - the "hvm_fep" option to enable its use is a debugging option only,
> - for the cross-vendor case is considered experimental, even if
>   unfortunately SUPPORT.md doesn't have an explicit statement about
>   this.
> The other two affected functions are
> - hvm_emulate_one_vm_event(), used for introspection,
> - hvm_emulate_one_mmio(), used for Dom0 only,
> which aren't qualifying this as needing an XSA either.
>=20
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> Tested-by: Don Slutz <don.slutz@gmail.com>
> ---
> v3: Add comment ahead of _hvm_emulate_one(). Add parentheses in a
>     conditional expr. Justify why this does not need an XSA.
> v2: Make updating of vio->mmio_* fields fully driven by the new
>     completion value.
> ---
> I further think that the entire tail of _hvm_emulate_one() (everything
> past the code changed/added there by this patch) wants skipping in =
case
> a completion is needed, at the very least for the mmio and realmode
> cases, where we know we'll come back here.
>=20
> --- a/xen/arch/x86/hvm/emulate.c
> +++ b/xen/arch/x86/hvm/emulate.c
> @@ -1683,9 +1683,11 @@ static int hvmemul_validate(
>      const struct x86_emulate_state *state,
>      struct x86_emulate_ctxt *ctxt)
>  {
> -    const struct hvm_emulate_ctxt *hvmemul_ctxt =3D
> +    struct hvm_emulate_ctxt *hvmemul_ctxt =3D
>          container_of(ctxt, struct hvm_emulate_ctxt, ctxt);
>=20
> +    hvmemul_ctxt->is_mem_access =3D x86_insn_is_mem_access(state, =
ctxt);
> +
>      return !hvmemul_ctxt->validate || hvmemul_ctxt->validate(state, =
ctxt)
>             ? X86EMUL_OKAY : X86EMUL_UNHANDLEABLE;
>  }
> @@ -2610,8 +2612,13 @@ static const struct x86_emulate_ops hvm_
>      .vmfunc        =3D hvmemul_vmfunc,
>  };
>=20
> +/*
> + * Note that passing HVMIO_no_completion into this function serves as =
kind
> + * of (but not fully) an "auto select completion" indicator.
> + */
>  static int _hvm_emulate_one(struct hvm_emulate_ctxt *hvmemul_ctxt,
> -    const struct x86_emulate_ops *ops)
> +    const struct x86_emulate_ops *ops,
> +    enum hvm_io_completion completion)
>  {
>      const struct cpu_user_regs *regs =3D hvmemul_ctxt->ctxt.regs;
>      struct vcpu *curr =3D current;
> @@ -2642,16 +2649,31 @@ static int _hvm_emulate_one(struct hvm_e
>          rc =3D X86EMUL_RETRY;
>=20
>      if ( !hvm_ioreq_needs_completion(&vio->io_req) )
> +        completion =3D HVMIO_no_completion;

The comment doesn't mention that passing in something other than =
HVMIO_no_completion could get overridden. Is that intentional?

> +    else if ( completion =3D=3D HVMIO_no_completion )
> +        completion =3D (vio->io_req.type !=3D IOREQ_TYPE_PIO ||
> +                      hvmemul_ctxt->is_mem_access) ? =
HVMIO_mmio_completion
> +                                                   : =
HVMIO_pio_completion;
> +
> +    switch ( vio->io_completion =3D completion )

I thought we tended to avoid assignments in control flow statements.

>      {
> +    case HVMIO_no_completion:
> +    case HVMIO_pio_completion:
>          vio->mmio_cache_count =3D 0;
>          vio->mmio_insn_bytes =3D 0;
> +        vio->mmio_access =3D (struct npfec){};
>          hvmemul_cache_disable(curr);
> -    }
> -    else
> -    {
> +        break;
> +
> +    case HVMIO_mmio_completion:
> +    case HVMIO_realmode_completion:
>          BUILD_BUG_ON(sizeof(vio->mmio_insn) < =
sizeof(hvmemul_ctxt->insn_buf));
>          vio->mmio_insn_bytes =3D hvmemul_ctxt->insn_buf_bytes;
>          memcpy(vio->mmio_insn, hvmemul_ctxt->insn_buf, =
vio->mmio_insn_bytes);
> +        break;
> +
> +    default:
> +        ASSERT_UNREACHABLE();
>      }
>=20
>      if ( hvmemul_ctxt->ctxt.retire.singlestep )
> @@ -2692,9 +2714,10 @@ static int _hvm_emulate_one(struct hvm_e
>  }
>=20
>  int hvm_emulate_one(
> -    struct hvm_emulate_ctxt *hvmemul_ctxt)
> +    struct hvm_emulate_ctxt *hvmemul_ctxt,
> +    enum hvm_io_completion completion)
>  {
> -    return _hvm_emulate_one(hvmemul_ctxt, &hvm_emulate_ops);
> +    return _hvm_emulate_one(hvmemul_ctxt, &hvm_emulate_ops, =
completion);
>  }
>=20
>  int hvm_emulate_one_mmio(unsigned long mfn, unsigned long gla)
> @@ -2703,11 +2726,13 @@ int hvm_emulate_one_mmio(unsigned long m
>          .read       =3D x86emul_unhandleable_rw,
>          .insn_fetch =3D hvmemul_insn_fetch,
>          .write      =3D mmcfg_intercept_write,
> +        .validate   =3D hvmemul_validate,
>      };
>      static const struct x86_emulate_ops hvm_ro_emulate_ops_mmio =3D {
>          .read       =3D x86emul_unhandleable_rw,
>          .insn_fetch =3D hvmemul_insn_fetch,
>          .write      =3D mmio_ro_emulated_write,
> +        .validate   =3D hvmemul_validate,
>      };
>      struct mmio_ro_emulate_ctxt mmio_ro_ctxt =3D { .cr2 =3D gla };
>      struct hvm_emulate_ctxt ctxt;
> @@ -2727,8 +2752,8 @@ int hvm_emulate_one_mmio(unsigned long m
>      hvm_emulate_init_once(&ctxt, x86_insn_is_mem_write,
>                            guest_cpu_user_regs());
>      ctxt.ctxt.data =3D &mmio_ro_ctxt;
> -    rc =3D _hvm_emulate_one(&ctxt, ops);
> -    switch ( rc )
> +
> +    switch ( rc =3D _hvm_emulate_one(&ctxt, ops, HVMIO_no_completion) =
)

Again, why move the assignment into the switch statement?

>      {
>      case X86EMUL_UNHANDLEABLE:
>      case X86EMUL_UNIMPLEMENTED:
> @@ -2755,7 +2780,8 @@ void hvm_emulate_one_vm_event(enum emul_
>      switch ( kind )
>      {
>      case EMUL_KIND_NOWRITE:
> -        rc =3D _hvm_emulate_one(&ctx, &hvm_emulate_ops_no_write);
> +        rc =3D _hvm_emulate_one(&ctx, &hvm_emulate_ops_no_write,
> +                              HVMIO_no_completion);
>          break;
>      case EMUL_KIND_SET_CONTEXT_INSN: {
>          struct vcpu *curr =3D current;
> @@ -2776,7 +2802,7 @@ void hvm_emulate_one_vm_event(enum emul_
>      /* Fall-through */
>      default:
>          ctx.set_context =3D (kind =3D=3D EMUL_KIND_SET_CONTEXT_DATA);
> -        rc =3D hvm_emulate_one(&ctx);
> +        rc =3D hvm_emulate_one(&ctx, HVMIO_no_completion);
>      }
>=20
>      switch ( rc )
> @@ -2874,6 +2900,8 @@ void hvm_emulate_init_per_insn(
>                                          pfec, NULL) =3D=3D =
HVMTRANS_okay) ?
>              sizeof(hvmemul_ctxt->insn_buf) : 0;
>      }
> +
> +    hvmemul_ctxt->is_mem_access =3D false;
>  }
>=20
>  void hvm_emulate_writeback(
> --- a/xen/arch/x86/hvm/hvm.c
> +++ b/xen/arch/x86/hvm/hvm.c
> @@ -3798,7 +3798,7 @@ void hvm_ud_intercept(struct cpu_user_re
>          return;
>      }
>=20
> -    switch ( hvm_emulate_one(&ctxt) )
> +    switch ( hvm_emulate_one(&ctxt, HVMIO_no_completion) )
>      {
>      case X86EMUL_UNHANDLEABLE:
>      case X86EMUL_UNIMPLEMENTED:
> --- a/xen/arch/x86/hvm/io.c
> +++ b/xen/arch/x86/hvm/io.c
> @@ -81,20 +81,11 @@ void send_invalidate_req(void)
>  bool hvm_emulate_one_insn(hvm_emulate_validate_t *validate, const =
char *descr)
>  {
>      struct hvm_emulate_ctxt ctxt;
> -    struct vcpu *curr =3D current;
> -    struct hvm_vcpu_io *vio =3D &curr->arch.hvm.hvm_io;
>      int rc;
>=20
>      hvm_emulate_init_once(&ctxt, validate, guest_cpu_user_regs());
>=20
> -    rc =3D hvm_emulate_one(&ctxt);
> -
> -    if ( hvm_ioreq_needs_completion(&vio->io_req) )
> -        vio->io_completion =3D HVMIO_mmio_completion;
> -    else
> -        vio->mmio_access =3D (struct npfec){};
> -
> -    switch ( rc )
> +    switch ( rc =3D hvm_emulate_one(&ctxt, HVMIO_no_completion) )
>      {
>      case X86EMUL_UNHANDLEABLE:
>          hvm_dump_emulation_state(XENLOG_G_WARNING, descr, &ctxt, rc);
> --- a/xen/arch/x86/hvm/vmx/realmode.c
> +++ b/xen/arch/x86/hvm/vmx/realmode.c
> @@ -97,15 +97,11 @@ static void realmode_deliver_exception(
>  void vmx_realmode_emulate_one(struct hvm_emulate_ctxt *hvmemul_ctxt)
>  {
>      struct vcpu *curr =3D current;
> -    struct hvm_vcpu_io *vio =3D &curr->arch.hvm.hvm_io;
>      int rc;
>=20
>      perfc_incr(realmode_emulations);
>=20
> -    rc =3D hvm_emulate_one(hvmemul_ctxt);
> -
> -    if ( hvm_ioreq_needs_completion(&vio->io_req) )
> -        vio->io_completion =3D HVMIO_realmode_completion;
> +    rc =3D hvm_emulate_one(hvmemul_ctxt, HVMIO_realmode_completion);

Ok, I guess the override of completion is intentional to deal with this =
case. Perhaps expand the comment above _hvm_emulate_one() then.

>=20
>      if ( rc =3D=3D X86EMUL_UNHANDLEABLE )
>      {
> --- a/xen/include/asm-x86/hvm/emulate.h
> +++ b/xen/include/asm-x86/hvm/emulate.h
> @@ -48,6 +48,8 @@ struct hvm_emulate_ctxt {
>=20
>      uint32_t intr_shadow;
>=20
> +    bool is_mem_access;
> +

Whilst you mention in the commit comment why this is added, I don't see =
any consumer if it in this patch. Will the come later?

  Paul

>      bool_t set_context;
>  };
>=20
> @@ -62,7 +64,8 @@ bool __nonnull(1, 2) hvm_emulate_one_ins
>      hvm_emulate_validate_t *validate,
>      const char *descr);
>  int hvm_emulate_one(
> -    struct hvm_emulate_ctxt *hvmemul_ctxt);
> +    struct hvm_emulate_ctxt *hvmemul_ctxt,
> +    enum hvm_io_completion completion);
>  void hvm_emulate_one_vm_event(enum emul_kind kind,
>      unsigned int trapnr,
>      unsigned int errcode);


