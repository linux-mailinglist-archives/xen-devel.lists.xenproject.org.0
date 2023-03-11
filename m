Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B47836B5D06
	for <lists+xen-devel@lfdr.de>; Sat, 11 Mar 2023 15:52:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.508728.783582 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pb0ZL-00038j-HX; Sat, 11 Mar 2023 14:51:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 508728.783582; Sat, 11 Mar 2023 14:51:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pb0ZL-00036U-Ep; Sat, 11 Mar 2023 14:51:35 +0000
Received: by outflank-mailman (input) for mailman id 508728;
 Sat, 11 Mar 2023 14:51:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PEBH=7D=tklengyel.com=bounce+e181d6.cd840-xen-devel=lists.xenproject.org@srs-se1.protection.inumbo.net>)
 id 1pb0ZJ-00036O-NM
 for xen-devel@lists.xenproject.org; Sat, 11 Mar 2023 14:51:33 +0000
Received: from rs227.mailgun.us (rs227.mailgun.us [209.61.151.227])
 by se1-gles-sth1.inumbo.com (Halon) with UTF8SMTPS
 id 352d57c3-c01c-11ed-87f5-c1b5be75604c;
 Sat, 11 Mar 2023 15:51:31 +0100 (CET)
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com
 [209.85.219.176]) by
 a70f3eba752c with SMTP id 640c9571b0de3c33d3ef4ea5 (version=TLS1.3,
 cipher=TLS_AES_128_GCM_SHA256); Sat, 11 Mar 2023 14:51:29 GMT
Received: by mail-yb1-f176.google.com with SMTP id o199so6068333ybc.7
 for <xen-devel@lists.xenproject.org>; Sat, 11 Mar 2023 06:51:29 -0800 (PST)
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
X-Inumbo-ID: 352d57c3-c01c-11ed-87f5-c1b5be75604c
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=tklengyel.com;
 q=dns/txt; s=mailo; t=1678546289; x=1678553489; h=Content-Type: Cc: To: To:
 Subject: Subject: Message-ID: Date: From: From: In-Reply-To: References:
 MIME-Version: Sender: Sender;
 bh=prnD3HSi7AZyhTBSqAoZ/PGJ4XTNp7GpB00h7XSuOsM=;
 b=CnJ8mIZ8YfNNyP4JK1VCyEnekVlcSDFcy7n6xbhtvUS7nQCHZLUEt1yvnAJfrgz/J9wUbk3ziOWMaNU778Cp1f16yKMBuwOns7UtMeAYGtoVrSQ28CBjj3iXpc2j6H6xlg4Pg/GyWBArYkql3FzoMmrky9EGI48RhFac3gvlOlBUOqbajCGnsDLZ0udxTtL+/ZEGlmEBwgWlJxxPLf0JZ3kWc/pyZZ4uVVZbadcK9XVpaHHSx490gvJ212VMQwNJUh3Vri5ugUvxKHp4qsb0gvvXz1B5J6BBDNrmB33IKdgYRnPCNlP71FIwuNPJtnY2G4qDsZnynKbZvGWLsY6f3A==
X-Mailgun-Sending-Ip: 209.61.151.227
X-Mailgun-Sid: WyIyYTNmOCIsInhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyIsImNkODQwIl0=
Sender: tamas@tklengyel.com
X-Gm-Message-State: AO0yUKXkU8I56LuGojTDVEb0hEEpDbMpeukPn0FfO4R6wnFAcMoxB0db
	4+ILdMur68lGlccAY68mik+ABIzSmosqhqwzAjQ=
X-Google-Smtp-Source: AK7set91islrT4iKxUPh0w+9cI/ORvzHij7YC1jdynpUGTJAGu61EaCVw6Q9QCgHtG3lQZEaGq+labzvRlb6CfO7K1s=
X-Received: by 2002:a5b:a0c:0:b0:a24:1001:1fd2 with SMTP id
 k12-20020a5b0a0c000000b00a2410011fd2mr17676915ybq.0.1678546288775; Sat, 11
 Mar 2023 06:51:28 -0800 (PST)
MIME-Version: 1.0
References: <3f577545b8ee6846ff98c4411cdc96dfe1412b3e.1678505295.git.isaikin-dmitry@yandex.ru>
In-Reply-To: <3f577545b8ee6846ff98c4411cdc96dfe1412b3e.1678505295.git.isaikin-dmitry@yandex.ru>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Sat, 11 Mar 2023 09:50:52 -0500
X-Gmail-Original-Message-ID: <CABfawhn0+XuByYGM-rAkQy+XL9E4aNiBDfE5irOzvRVesuKMjg@mail.gmail.com>
Message-ID: <CABfawhn0+XuByYGM-rAkQy+XL9E4aNiBDfE5irOzvRVesuKMjg@mail.gmail.com>
Subject: Re: [XEN PATCH] x86/monitor: Add new monitor event to catch I/O instructions
To: Dmitry Isaykin <isaikin-dmitry@yandex.ru>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>, 
	Anthony PERARD <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, 
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, 
	Stefano Stabellini <sstabellini@kernel.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Alexandru Isaila <aisaila@bitdefender.com>, Petre Pircalabu <ppircalabu@bitdefender.com>, 
	Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>, 
	Anton Belousov <abelousov@ptsecurity.com>
Content-Type: multipart/alternative; boundary="000000000000481a9505f6a10300"

--000000000000481a9505f6a10300
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 10, 2023 at 10:57=E2=80=AFPM Dmitry Isaykin <isaikin-dmitry@yan=
dex.ru>
wrote:
>
> Adds monitor support for I/O instructions.
>
> Signed-off-by: Dmitry Isaykin <isaikin-dmitry@yandex.ru>
> Signed-off-by: Anton Belousov <abelousov@ptsecurity.com>
> ---
>  tools/include/xenctrl.h                |  1 +
>  tools/libs/ctrl/xc_monitor.c           | 13 +++++++++++++
>  xen/arch/x86/hvm/hvm.c                 |  5 +++++
>  xen/arch/x86/hvm/monitor.c             | 21 +++++++++++++++++++++
>  xen/arch/x86/hvm/vmx/vmx.c             |  2 ++
>  xen/arch/x86/include/asm/domain.h      |  1 +
>  xen/arch/x86/include/asm/hvm/monitor.h |  3 +++
>  xen/arch/x86/include/asm/hvm/support.h |  3 +++
>  xen/arch/x86/include/asm/monitor.h     |  3 ++-
>  xen/arch/x86/monitor.c                 | 13 +++++++++++++
>  xen/include/public/domctl.h            |  1 +
>  xen/include/public/vm_event.h          | 10 ++++++++++
>  12 files changed, 75 insertions(+), 1 deletion(-)
>
> diff --git a/tools/include/xenctrl.h b/tools/include/xenctrl.h
> index 23037874d3..05967ecc92 100644
> --- a/tools/include/xenctrl.h
> +++ b/tools/include/xenctrl.h
> @@ -2102,6 +2102,7 @@ int xc_monitor_emul_unimplemented(xc_interface
*xch, uint32_t domain_id,
>                                    bool enable);
>  int xc_monitor_vmexit(xc_interface *xch, uint32_t domain_id, bool enable=
,
>                        bool sync);
> +int xc_monitor_io(xc_interface *xch, uint32_t domain_id, bool enable);
>  /**
>   * This function enables / disables emulation for each REP for a
>   * REP-compatible instruction.
> diff --git a/tools/libs/ctrl/xc_monitor.c b/tools/libs/ctrl/xc_monitor.c
> index c5fa62ff30..3cb96f444f 100644
> --- a/tools/libs/ctrl/xc_monitor.c
> +++ b/tools/libs/ctrl/xc_monitor.c
> @@ -261,6 +261,19 @@ int xc_monitor_vmexit(xc_interface *xch, uint32_t
domain_id, bool enable,
>      return do_domctl(xch, &domctl);
>  }
>
> +int xc_monitor_io(xc_interface *xch, uint32_t domain_id, bool enable)
> +{
> +    DECLARE_DOMCTL;
> +
> +    domctl.cmd =3D XEN_DOMCTL_monitor_op;
> +    domctl.domain =3D domain_id;
> +    domctl.u.monitor_op.op =3D enable ? XEN_DOMCTL_MONITOR_OP_ENABLE
> +                                    : XEN_DOMCTL_MONITOR_OP_DISABLE;
> +    domctl.u.monitor_op.event =3D XEN_DOMCTL_MONITOR_EVENT_IO;
> +
> +    return do_domctl(xch, &domctl);
> +}
> +
>  /*
>   * Local variables:
>   * mode: C
> diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
> index 0c81e2afc7..72c9f65626 100644
> --- a/xen/arch/x86/hvm/hvm.c
> +++ b/xen/arch/x86/hvm/hvm.c
> @@ -3484,6 +3484,11 @@ int hvm_vmexit_cpuid(struct cpu_user_regs *regs,
unsigned int inst_len)
>      return hvm_monitor_cpuid(inst_len, leaf, subleaf);
>  }
>
> +void hvm_io_instruction_intercept(uint16_t port, int dir, unsigned int
bytes, unsigned int string_ins)
> +{
> +    hvm_monitor_io_instruction(port, dir, bytes, string_ins);
> +}
> +
>  void hvm_rdtsc_intercept(struct cpu_user_regs *regs)
>  {
>      msr_split(regs, hvm_get_guest_tsc(current));
> diff --git a/xen/arch/x86/hvm/monitor.c b/xen/arch/x86/hvm/monitor.c
> index a11cd76f4d..f8b11d1de9 100644
> --- a/xen/arch/x86/hvm/monitor.c
> +++ b/xen/arch/x86/hvm/monitor.c
> @@ -233,6 +233,27 @@ int hvm_monitor_cpuid(unsigned long insn_length,
unsigned int leaf,
>      return monitor_traps(curr, 1, &req);
>  }
>
> +void hvm_monitor_io_instruction(uint16_t port, int dir,
> +                                unsigned int bytes, unsigned int
string_ins)
> +{
> +    struct vcpu *curr =3D current;
> +    struct arch_domain *ad =3D &curr->domain->arch;
> +    vm_event_request_t req =3D {};
> +
> +    if ( !ad->monitor.io_enabled )
> +        return;
> +
> +    req.reason =3D VM_EVENT_REASON_IO_INSTRUCTION;
> +    req.u.io_instruction.data_size =3D bytes;
> +    req.u.io_instruction.port =3D port;
> +    req.u.io_instruction.dir =3D dir;
> +    req.u.io_instruction.string_ins =3D string_ins;
> +
> +    set_npt_base(curr, &req);
> +
> +    monitor_traps(curr, true, &req);
> +}
> +
>  void hvm_monitor_interrupt(unsigned int vector, unsigned int type,
>                             unsigned int err, uint64_t cr2)
>  {
> diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
> index 278b829f73..a64c5078c5 100644
> --- a/xen/arch/x86/hvm/vmx/vmx.c
> +++ b/xen/arch/x86/hvm/vmx/vmx.c
> @@ -4579,6 +4579,8 @@ void vmx_vmexit_handler(struct cpu_user_regs *regs)
>              uint16_t port =3D (exit_qualification >> 16) & 0xFFFF;
>              int bytes =3D (exit_qualification & 0x07) + 1;
>              int dir =3D (exit_qualification & 0x08) ? IOREQ_READ :
IOREQ_WRITE;
> +            int str_ins =3D (exit_qualification & 0x10) ? 1 : 0;

You are already in a branch here where str_ins is checked and known to be 1=
.

> +            hvm_io_instruction_intercept(port, dir, bytes, str_ins);

IMHO you should have this intercept be called outside the if-else. The
function already kind-of indicates str_ins is an input yet right now only
called when it's 1.

The rest of the plumbing in the patch LGTM.

Thanks,
Tamas

--000000000000481a9505f6a10300
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><br>On Fri, Mar 10, 2023 at 10:57=E2=80=AFPM Dmitry Is=
aykin &lt;<a href=3D"mailto:isaikin-dmitry@yandex.ru">isaikin-dmitry@yandex=
.ru</a>&gt; wrote:<br>&gt;<br>&gt; Adds monitor support for I/O instruction=
s.<br>&gt;<br>&gt; Signed-off-by: Dmitry Isaykin &lt;<a href=3D"mailto:isai=
kin-dmitry@yandex.ru">isaikin-dmitry@yandex.ru</a>&gt;<br>&gt; Signed-off-b=
y: Anton Belousov &lt;<a href=3D"mailto:abelousov@ptsecurity.com">abelousov=
@ptsecurity.com</a>&gt;<br>&gt; ---<br>&gt; =C2=A0tools/include/xenctrl.h =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A01 +<br>&gt; =
=C2=A0tools/libs/ctrl/xc_monitor.c =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 13 =
+++++++++++++<br>&gt; =C2=A0xen/arch/x86/hvm/hvm.c =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A05 +++++<br>&gt; =C2=A0xen/arch/x86/=
hvm/monitor.c =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 21 ++++++++++++++=
+++++++<br>&gt; =C2=A0xen/arch/x86/hvm/vmx/vmx.c =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 | =C2=A02 ++<br>&gt; =C2=A0xen/arch/x86/include/asm/domai=
n.h =C2=A0 =C2=A0 =C2=A0| =C2=A01 +<br>&gt; =C2=A0xen/arch/x86/include/asm/=
hvm/monitor.h | =C2=A03 +++<br>&gt; =C2=A0xen/arch/x86/include/asm/hvm/supp=
ort.h | =C2=A03 +++<br>&gt; =C2=A0xen/arch/x86/include/asm/monitor.h =C2=A0=
 =C2=A0 | =C2=A03 ++-<br>&gt; =C2=A0xen/arch/x86/monitor.c =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 13 +++++++++++++<br>&gt; =C2=A0=
xen/include/public/domctl.h =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=
=A01 +<br>&gt; =C2=A0xen/include/public/vm_event.h =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0| 10 ++++++++++<br>&gt; =C2=A012 files changed, 75 insertions(+),=
 1 deletion(-)<br>&gt;<br>&gt; diff --git a/tools/include/xenctrl.h b/tools=
/include/xenctrl.h<br>&gt; index 23037874d3..05967ecc92 100644<br>&gt; --- =
a/tools/include/xenctrl.h<br>&gt; +++ b/tools/include/xenctrl.h<br>&gt; @@ =
-2102,6 +2102,7 @@ int xc_monitor_emul_unimplemented(xc_interface *xch, uin=
t32_t domain_id,<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0bool enable);<br>&gt; =C2=A0int xc_monitor_vmexit(xc_interface *xch, uin=
t32_t domain_id, bool enable,<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bool sync);<br>&gt; +int xc=
_monitor_io(xc_interface *xch, uint32_t domain_id, bool enable);<br>&gt; =
=C2=A0/**<br>&gt; =C2=A0 * This function enables / disables emulation for e=
ach REP for a<br>&gt; =C2=A0 * REP-compatible instruction.<br>&gt; diff --g=
it a/tools/libs/ctrl/xc_monitor.c b/tools/libs/ctrl/xc_monitor.c<br>&gt; in=
dex c5fa62ff30..3cb96f444f 100644<br>&gt; --- a/tools/libs/ctrl/xc_monitor.=
c<br>&gt; +++ b/tools/libs/ctrl/xc_monitor.c<br>&gt; @@ -261,6 +261,19 @@ i=
nt xc_monitor_vmexit(xc_interface *xch, uint32_t domain_id, bool enable,<br=
>&gt; =C2=A0 =C2=A0 =C2=A0return do_domctl(xch, &amp;domctl);<br>&gt; =C2=
=A0}<br>&gt;<br>&gt; +int xc_monitor_io(xc_interface *xch, uint32_t domain_=
id, bool enable)<br>&gt; +{<br>&gt; + =C2=A0 =C2=A0DECLARE_DOMCTL;<br>&gt; =
+<br>&gt; + =C2=A0 =C2=A0domctl.cmd =3D XEN_DOMCTL_monitor_op;<br>&gt; + =
=C2=A0 =C2=A0domctl.domain =3D domain_id;<br>&gt; + =C2=A0 =C2=A0domctl.u.m=
onitor_op.op =3D enable ? XEN_DOMCTL_MONITOR_OP_ENABLE<br>&gt; + =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0: XEN_DOMCTL_MONITOR_OP_DISABLE;<b=
r>&gt; + =C2=A0 =C2=A0domctl.u.monitor_op.event =3D XEN_DOMCTL_MONITOR_EVEN=
T_IO;<br>&gt; +<br>&gt; + =C2=A0 =C2=A0return do_domctl(xch, &amp;domctl);<=
br>&gt; +}<br>&gt; +<br>&gt; =C2=A0/*<br>&gt; =C2=A0 * Local variables:<br>=
&gt; =C2=A0 * mode: C<br>&gt; diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arc=
h/x86/hvm/hvm.c<br>&gt; index 0c81e2afc7..72c9f65626 100644<br>&gt; --- a/x=
en/arch/x86/hvm/hvm.c<br>&gt; +++ b/xen/arch/x86/hvm/hvm.c<br>&gt; @@ -3484=
,6 +3484,11 @@ int hvm_vmexit_cpuid(struct cpu_user_regs *regs, unsigned in=
t inst_len)<br>&gt; =C2=A0 =C2=A0 =C2=A0return hvm_monitor_cpuid(inst_len, =
leaf, subleaf);<br>&gt; =C2=A0}<br>&gt;<br>&gt; +void hvm_io_instruction_in=
tercept(uint16_t port, int dir, unsigned int bytes, unsigned int string_ins=
)<br>&gt; +{<br>&gt; + =C2=A0 =C2=A0hvm_monitor_io_instruction(port, dir, b=
ytes, string_ins);<br>&gt; +}<br>&gt; +<br>&gt; =C2=A0void hvm_rdtsc_interc=
ept(struct cpu_user_regs *regs)<br>&gt; =C2=A0{<br>&gt; =C2=A0 =C2=A0 =C2=
=A0msr_split(regs, hvm_get_guest_tsc(current));<br>&gt; diff --git a/xen/ar=
ch/x86/hvm/monitor.c b/xen/arch/x86/hvm/monitor.c<br>&gt; index a11cd76f4d.=
.f8b11d1de9 100644<br>&gt; --- a/xen/arch/x86/hvm/monitor.c<br>&gt; +++ b/x=
en/arch/x86/hvm/monitor.c<br>&gt; @@ -233,6 +233,27 @@ int hvm_monitor_cpui=
d(unsigned long insn_length, unsigned int leaf,<br>&gt; =C2=A0 =C2=A0 =C2=
=A0return monitor_traps(curr, 1, &amp;req);<br>&gt; =C2=A0}<br>&gt;<br>&gt;=
 +void hvm_monitor_io_instruction(uint16_t port, int dir,<br>&gt; + =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned int bytes, unsigned int string_ins)=
<br>&gt; +{<br>&gt; + =C2=A0 =C2=A0struct vcpu *curr =3D current;<br>&gt; +=
 =C2=A0 =C2=A0struct arch_domain *ad =3D &amp;curr-&gt;domain-&gt;arch;<br>=
&gt; + =C2=A0 =C2=A0vm_event_request_t req =3D {};<br>&gt; +<br>&gt; + =C2=
=A0 =C2=A0if ( !ad-&gt;monitor.io_enabled )<br>&gt; + =C2=A0 =C2=A0 =C2=A0 =
=C2=A0return;<br>&gt; +<br>&gt; + =C2=A0 =C2=A0req.reason =3D VM_EVENT_REAS=
ON_IO_INSTRUCTION;<br>&gt; + =C2=A0 =C2=A0req.u.io_instruction.data_size =
=3D bytes;<br>&gt; + =C2=A0 =C2=A0req.u.io_instruction.port =3D port;<br>&g=
t; + =C2=A0 =C2=A0req.u.io_instruction.dir =3D dir;<br>&gt; + =C2=A0 =C2=A0=
req.u.io_instruction.string_ins =3D string_ins;<br>&gt; +<br>&gt; + =C2=A0 =
=C2=A0set_npt_base(curr, &amp;req);<br>&gt; +<br>&gt; + =C2=A0 =C2=A0monito=
r_traps(curr, true, &amp;req);<br>&gt; +}<br>&gt; +<br>&gt; =C2=A0void hvm_=
monitor_interrupt(unsigned int vector, unsigned int type,<br>&gt; =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 unsigned int err, uint64_t cr2)<br>&gt; =C2=A0{<br>&gt; d=
iff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c<br>&gt;=
 index 278b829f73..a64c5078c5 100644<br>&gt; --- a/xen/arch/x86/hvm/vmx/vmx=
.c<br>&gt; +++ b/xen/arch/x86/hvm/vmx/vmx.c<br>&gt; @@ -4579,6 +4579,8 @@ v=
oid vmx_vmexit_handler(struct cpu_user_regs *regs)<br>&gt; =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0uint16_t port =3D (exit_qualification &gt=
;&gt; 16) &amp; 0xFFFF;<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0int bytes =3D (exit_qualification &amp; 0x07) + 1;<br>&gt; =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int dir =3D (exit_qualification &amp;=
 0x08) ? IOREQ_READ : IOREQ_WRITE;<br><div>&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0int str_ins =3D (exit_qualification &amp; 0x10) ? 1 : 0;</=
div><div><br></div><div>You are already in a branch here where str_ins is c=
hecked and known to be 1.<br></div><div><br></div>&gt; + =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0hvm_io_instruction_intercept(port, dir, bytes, str_=
ins);<br><div><div><span style=3D"font-family:sans-serif" role=3D"presentat=
ion" dir=3D"ltr" class=3D"gmail-"><br></span></div><div>IMHO you should hav=
e this intercept be called outside the if-else. The function already kind-o=
f indicates str_ins is an input yet right now only called when it&#39;s 1.<=
span style=3D"font-family:sans-serif" role=3D"presentation" dir=3D"ltr" cla=
ss=3D"gmail-"><br></span></div><div><span style=3D"font-family:sans-serif" =
role=3D"presentation" dir=3D"ltr" class=3D"gmail-"><br></span></div><div><s=
pan style=3D"font-family:sans-serif" role=3D"presentation" dir=3D"ltr" clas=
s=3D"gmail-">The rest of the plumbing in the patch LGTM.<br></span></div><d=
iv><span style=3D"font-family:sans-serif" role=3D"presentation" dir=3D"ltr"=
 class=3D"gmail-"><br></span></div><div><span style=3D"font-family:sans-ser=
if" role=3D"presentation" dir=3D"ltr" class=3D"gmail-">Thanks,<br></span></=
div><div><span style=3D"font-family:sans-serif" role=3D"presentation" dir=
=3D"ltr" class=3D"gmail-">Tamas<br></span></div><div><span style=3D"font-fa=
mily:sans-serif" role=3D"presentation" dir=3D"ltr" class=3D"gmail-"><span s=
tyle=3D"font-family:sans-serif" role=3D"presentation" dir=3D"ltr"> </span>

</span>

</div></div></div>

--000000000000481a9505f6a10300--

