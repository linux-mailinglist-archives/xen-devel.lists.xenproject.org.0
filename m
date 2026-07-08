Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Gpi6BFJmTmrgLwIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 08 Jul 2026 17:01:38 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 073BD727B73
	for <lists+xen-devel@lfdr.de>; Wed, 08 Jul 2026 17:01:34 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=umich.edu header.s=relay-2 header.b=juMh2Fa5;
	dmarc=pass (policy=none) header.from=umich.edu;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.1357155.1611647 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1whTlz-0001sE-OJ; Wed, 08 Jul 2026 15:01:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1357155.1611647; Wed, 08 Jul 2026 15:01:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1whTlz-0001pb-L3; Wed, 08 Jul 2026 15:01:15 +0000
Received: by outflank-mailman (input) for mailman id 1357155;
 Wed, 08 Jul 2026 15:01:14 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dunlapg@umich.edu>) id 1whTlx-0001pV-Ue
 for xen-devel@lists.xenproject.org; Wed, 08 Jul 2026 15:01:14 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1whTlx-000PPs-Ax
 for xen-devel@lists.xenproject.org; Wed, 08 Jul 2026 17:01:13 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dunlapg@umich.edu>)
 id 6a4e6637-e002-0a2a0a5209dd-0a2a4507d648-4
 for <xen-devel@lists.xenproject.org>; Wed, 08 Jul 2026 17:01:12 +0200
Received: from [18.216.144.57] (helo=yurei.relay-egress.a.mail.umich.edu)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <dunlapg@umich.edu>)
 id 6a4e6635-9c8e-0a2a45070019-12d89039ad80-3
 for <xen-devel@lists.xenproject.org>; Wed, 08 Jul 2026 17:01:10 +0200
Received: from boss-fomorian.authn-relay.a.mail.umich.edu
 (ip-10-0-72-25.us-east-2.compute.internal [10.0.72.25])
 by yurei.relay-egress.a.mail.umich.edu with ESMTPS
 id 6A4E6635.1DE5437F.69E3C8C5.276198; Wed, 08 Jul 2026 11:01:09 -0400
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com
 [209.85.208.182])
 by boss-fomorian.authn-relay.a.mail.umich.edu with ESMTPSA
 id 6A4E6634.2526BBC0.4D6D1869.1910731;
 Wed, 08 Jul 2026 11:01:08 -0400
Received: by mail-lj1-f182.google.com with SMTP id
 38308e7fff4ca-39c7225e58bso5170811fa.1
 for <xen-devel@lists.xenproject.org>; Wed, 08 Jul 2026 08:01:08 -0700 (PDT)
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
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=umich.edu;
	s=relay-2; t=1783522869;
	bh=sMpkM0ytfwnpbpljagJm57/r0iJEepO5ds9cqhA3lBw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=juMh2Fa5OpY+301eqEJHSGGCZqkfrYP6EzktGhgyLwthJCv+QItgfT1NQlSpWh08a
	 teNmgnVnRf3cbF4RNU7U1HnYoIXRIMb7s+7ldJtNxdkA4vJb6sgYlJBsKTsK1gy1xf
	 sgcecTHNXue8WQp0AfpgAQCuYXcYW7wMILdGi7dl81qu9UkLPHS6UZy2hEDwCn9+df
	 ZYHYipFI9nXoMckUiCC9zupSVmXgishFesBpRS0cdSm46V/UaRxzjZQnOWWDMxc6sz
	 UqH3sVYagt+Tp9fkmrnFeM8EFVdRh0hFhZOsgVzjXfqogsSn0GOElv4ZCjryOuBO23
	 mZQstVR1Tv6/A==
X-Gm-Message-State: AOJu0Yw2AI6TlmGnslqXEUHP4VjIEoiI+NZ/hSQ6bF+IbJb/f5ycoa7p
	/aa/wWqntqCD5AOyvjqGre+HYOr08oairQIC8soeuGf8DCMS/AO2TlSFs9vgk2kIxTaCd4/d8Nk
	dglkmne/pdEjH+o0uuLH8S1xVH+eexew=
X-Received: by 2002:a05:651c:546:b0:393:d706:7bc with SMTP id
 38308e7fff4ca-39c79753da2mr6765471fa.0.1783522864664; Wed, 08 Jul 2026
 08:01:04 -0700 (PDT)
MIME-Version: 1.0
References: <20260320150120.874878-1-jgross@suse.com> <20260320150120.874878-11-jgross@suse.com>
In-Reply-To: <20260320150120.874878-11-jgross@suse.com>
From: George Dunlap <dunlapg@umich.edu>
Date: Wed, 8 Jul 2026 16:00:52 +0100
X-Gmail-Original-Message-ID: <CAFLBxZaeTMcF4tcV45MJdCVx4A6qbzQdjKei_Quh_iLrtARVFA@mail.gmail.com>
X-Gm-Features: AVVi8CfbXPmJqExCYdicaF6wjZ7no0NWrGy8tMOaGD8pdeKNPdsYAf9WSLeQKLY
Message-ID: <CAFLBxZaeTMcF4tcV45MJdCVx4A6qbzQdjKei_Quh_iLrtARVFA@mail.gmail.com>
Subject: Re: [PATCH v2 10/12] tools/libxl: add support for xenstore quota in domain_config
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, Nick Rosbrook <enr0n@ubuntu.com>, 
	George Dunlap <gwd@xenproject.org>, Anthony PERARD <anthony.perard@vates.tech>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, Andrii Sultanov <andriy.sultanov@vates.tech>, 
	Guillaume Thouvenin <guillaume.thouvenin@vates.tech>
Content-Type: multipart/alternative; boundary="000000000000cc38d906561ac626"
X-purgate-ID: tlsNG-ef75cf/1783522871-7DF2525E-58BF2B98/0/0
X-purgate-type: clean
X-purgate-size: 36160
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[umich.edu,none];
	R_DKIM_ALLOW(-0.20)[umich.edu:s=relay-2];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[multipart/alternative,text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jgross@suse.com,m:xen-devel@lists.xenproject.org,m:enr0n@ubuntu.com,m:gwd@xenproject.org,m:anthony.perard@vates.tech,m:andrew.cooper3@citrix.com,m:andriy.sultanov@vates.tech,m:guillaume.thouvenin@vates.tech,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,lists.xenproject.org:from_smtp,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_SENDER(0.00)[dunlapg@umich.edu,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[umich.edu:+];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[dunlapg@umich.edu,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[11]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 073BD727B73

--000000000000cc38d906561ac626
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 20, 2026 at 3:02=E2=80=AFPM Juergen Gross <jgross@suse.com> wro=
te:

> Add support for xenstore quota in the struct domain_config. Initially
> it will be used only for migration of a domain.
>
> Signed-off-by: Juergen Gross <jgross@suse.com>
> Acked-by: Nick Rosbrook <enr0n@ubuntu.com> # golang stuff
> ---
> V2:
> - use LOGED() for error logging (Anthony Perard)
> - mention additional struct member xenstore_quota in libxl.h
>   (Anthony Perard)
> ---
>  tools/golang/xenlight/helpers.gen.go |  6 ++++++
>  tools/golang/xenlight/types.gen.go   |  1 +
>  tools/include/libxl.h                |  1 +
>  tools/libs/light/libxl_dom.c         |  8 ++++++++
>  tools/libs/light/libxl_domain.c      | 11 +++++++++++
>  tools/libs/light/libxl_types.idl     |  1 +
>  6 files changed, 28 insertions(+)
>
> diff --git a/tools/golang/xenlight/helpers.gen.go
> b/tools/golang/xenlight/helpers.gen.go
> index 767b9e45f5..b0c09da910 100644
> --- a/tools/golang/xenlight/helpers.gen.go
> +++ b/tools/golang/xenlight/helpers.gen.go
> @@ -1286,6 +1286,9 @@ if err :=3D
> x.TrapUnmappedAccesses.fromC(&xc.trap_unmapped_accesses);err !=3D nil {
>  return fmt.Errorf("converting field TrapUnmappedAccesses: %v", err)
>  }
>  x.XenstoreFeatureMask =3D uint32(xc.xenstore_feature_mask)
> +if err :=3D x.XenstoreQuota.fromC(&xc.xenstore_quota);err !=3D nil {
> +return fmt.Errorf("converting field XenstoreQuota: %v", err)
> +}
>
>   return nil}
>
> @@ -1825,6 +1828,9 @@ if err :=3D
> x.TrapUnmappedAccesses.toC(&xc.trap_unmapped_accesses); err !=3D nil {
>  return fmt.Errorf("converting field TrapUnmappedAccesses: %v", err)
>  }
>  xc.xenstore_feature_mask =3D C.uint32_t(x.XenstoreFeatureMask)
> +if err :=3D x.XenstoreQuota.toC(&xc.xenstore_quota); err !=3D nil {
> +return fmt.Errorf("converting field XenstoreQuota: %v", err)
> +}
>
>   return nil
>   }
> diff --git a/tools/golang/xenlight/types.gen.go
> b/tools/golang/xenlight/types.gen.go
> index 8dd610919d..e0fd78ec03 100644
> --- a/tools/golang/xenlight/types.gen.go
> +++ b/tools/golang/xenlight/types.gen.go
> @@ -629,6 +629,7 @@ VmtraceBufKb int
>  Vpmu Defbool
>  TrapUnmappedAccesses Defbool
>  XenstoreFeatureMask uint32
> +XenstoreQuota XsQuotaList
>  }
>
>  type DomainBuildInfoTypeUnion interface {
> diff --git a/tools/include/libxl.h b/tools/include/libxl.h
> index 6d2910df34..80e3ec8de9 100644
> --- a/tools/include/libxl.h
> +++ b/tools/include/libxl.h
> @@ -1545,6 +1545,7 @@ void libxl_mac_copy(libxl_ctx *ctx, libxl_mac *dst,
> const libxl_mac *src);
>   * libxl_xs_quota_global_set()
>   * libxl_xs_quota_domain_get()
>   * libxl_xs_quota_domain_set()
> + * and the xenstore_quota member of struct domain_build_info
>   * are available.
>   */
>  #define LIBXL_HAVE_XENSTORE_QUOTA
> diff --git a/tools/libs/light/libxl_dom.c b/tools/libs/light/libxl_dom.c
> index 05ebc69534..4ff5f65f6f 100644
> --- a/tools/libs/light/libxl_dom.c
> +++ b/tools/libs/light/libxl_dom.c
> @@ -509,6 +509,14 @@ retry_transaction:
>
>      xs_introduce_domain(ctx->xsh, domid, state->store_mfn,
> state->store_port);
>
> +    if (info->xenstore_quota.num_quota) {
> +        rc =3D libxl_xs_quota_domain_set(ctx, domid, &info->xenstore_quo=
ta);
> +        if (rc) {
> +            LOGED(ERROR, domid, "Failed to set Xenstore quota");
> +            goto out;
> +        }
> +    }
> +
>   out:
>      free(vm_path);
>      return rc;
> diff --git a/tools/libs/light/libxl_domain.c
> b/tools/libs/light/libxl_domain.c
> index 5be47f687f..37fcd92871 100644
> --- a/tools/libs/light/libxl_domain.c
> +++ b/tools/libs/light/libxl_domain.c
> @@ -2533,6 +2533,17 @@ static void
> retrieve_domain_configuration_end(libxl__egc *egc,
>          }
>      }
>
> +    /* Xenstore quota */
> +    {
> +        libxl_xs_quota_list_dispose(&d_config->b_info.xenstore_quota);
> +        rc =3D libxl_xs_quota_domain_get(CTX, domid,
> +                                       &d_config->b_info.xenstore_quota)=
;
> +        if (rc) {
> +            LOGED(ERROR, domid, "Fail to get xenstore quota");
> +            goto out;
> +        }
>

This change seems to cause `xl list` to hang on oxenstored systems.

I'm not an expert in ocaml; Claude seems to think that the problem is as
follows:

1. oxenstored doesn't implement XS_GET_QUOTA, and
2. when it receives an unknown message it returns an error, but
3. the error payload is length zero, and
4. oxenstored has a bug such that it will never actually send messages with
a zero-length payload.

Below is a more complete report from Claude; as I said, I don't know enough
ocaml to evaluate it. Plan `xl list` only triggers it on staging, but
apparently `xl list -x` will trigger it in Xen 4.21.

Assuming the analysis is correct, it's concerning that an issue with the
default xenstored instance wasn't caught earlier.

 -George

8<---

Subject: oxenstored hangs on any xenstore request with a zero-length payloa=
d

  Affects, on oxenstored systems:
    - `xl info -x` and `xenstore watch -d N`  -- RELEASE-4.21.0,
RELEASE-4.21.1
    - `xl list -l`, `xl save`, `xl migrate`   -- 4.22.0-rc1..rc3, unstable
  The C xenstored and xenstore-stubdom are unaffected.


Symptom
-------

On an idle dom0 with no guests, running oxenstored, `xl list -l` never
returns and produces no output. The same holds for `xl save`, `xl migrate`,
`xl info -x`, and `xenstore watch -d N`. Meanwhile `xl list`, `xl list -v`,
`xl info -n`, `xenstore-read` and `xenstore-ls` all work normally.

The client is blocked in read(fd, buf, 16) awaiting an xsd_sockmsg header
that never arrives. Both socket queues are empty. oxenstored itself remains
healthy and continues to serve every other connection.


Root cause
----------

oxenstored's socket backend never delivers a request whose payload length
is zero. This is independent of the opcode: XS_READ and XS_DIRECTORY with
len =3D=3D 0 hang exactly as XS_GET_QUOTA does.

In tools/ocaml/libs/xb/xb.ml, Xb.input() consumes the 16-byte header and
sets partial_in <- HaveHdr pkt, then returns None unconditionally:

    | NoHdr (i, buf)      ->
        (* we complete the partial header *)
        if sz > 0 then
          Bytes.blit b 0 buf (Partial.header_size () - i) sz;
        con.partial_in <- if sz =3D i then
            HaveHdr (Partial.of_string (Bytes.to_string buf)) else NoHdr (i
- sz, buf);
        None

The packet would be produced by the *next* call to input() -- the HaveHdr
branch handles Partial.to_complete =3D 0 without reading anything further.
But has_more_input is hardcoded false for socket backends:

    let has_more_input con =3D
      match con.backend with
      | Fd _            -> false
      | Xenmmap backend -> backend.work_again

so xenstored.ml re-enters do_input only when poll() reports the fd readable=
.

  - For len > 0, the payload is still buffered in the socket, so poll()
    fires again and the packet completes. This is why every other request
    works.

  - For len =3D=3D 0, nothing remains to be read. poll() never fires, and a
    fully-received request sits parked in partial_in indefinitely.

It is finally processed only when further input arrives on that connection
-- including POLLHUP at client teardown -- at which point the reply is
written to a dead socket.

oxenstored's dispatch layer is correct: XS_GET_QUOTA with a non-empty
payload returns XS_ERROR "ENOSYS" in under a millisecond. Only the framing
layer is broken.

Guest ring (Xenmmap) connections appear unaffected, since there
has_more_input follows work_again. NOTE: this is a source-level inference;
I did not exercise a ring connection with a zero-length request.


Evidence
--------

strace of oxenstored. \31 =3D 25 =3D XS_GET_QUOTA, \2 =3D XS_READ:

  # len=3D0, unknown opcode 25 -- nothing written, silence, then client EOF
  14:54:01.801066 read(23, "\31\0\0\0\336\300\0\0\0\0\0\0\0\0\0\0", 16) =3D=
 16
  14:54:06.806325 write(18, "[...]  A81 invalid", 50)   <- only at POLLHUP
  14:54:06.806811 read(23, "", 16)        =3D 0

  # len=3D0, WELL-KNOWN opcode 2 -- identical hang
  14:54:10.840293 read(23, "\2\0\0\0\336\300\0\0\0\0\0\0\0\0\0\0", 16) =3D =
16
  14:54:15.845644 read(23, "", 16)        =3D 0

  # same opcode 25, len=3D2 -- answered instantly
  14:54:19.879492 read(23, "\31\0\0\0\336\300\0\0\0\0\0\0\2\0\0\0", 16) =3D=
 16
  14:54:19.879698 read(23, "0\0", 2)      =3D 2
  14:54:19.879810 write(18, "[...] A83 invalid / error ENOSYS", ...)

The poll() following the parked read requests POLLIN only -- no POLLOUT --
i.e. oxenstored has nothing queued to send. xenstored.log contains neither
"process packet:" nor "got a bad client": process_packet is never entered.

Decisive: send the len =3D=3D 0 header, wait three seconds (nothing), then =
send
one unrelated byte. The ENOSYS reply *for the original request id* is
emitted within 1 ms. The request was never dropped -- it was parked,
waiting for a poll() that had nothing left to deliver.


Trigger
-------

libxenstore has exactly two zero-length senders, both recent. Before them,
no xenstore client had ever sent a zero-length request over the socket, so
the defect lay dormant.

  xs_get_features_supported()  XS_GET_FEATURE  tools/libs/store/xs.c:1486
      added by 5234b61eab
      in: RELEASE-4.21.0, RELEASE-4.21.1, 4.22.0-rc*, unstable
      reached by: xl info -x, xenstore watch -d N

  xs_get_quota_names()         XS_GET_QUOTA    tools/libs/store/xs.c:1537
      added by ba90589447
      in: 4.22.0-rc1..rc3, unstable
      reached by: xl list -l, xl save, xl migrate -- since a6f159f92c made
      libxl_retrieve_domain_configuration() query xenstore quota

Both are the only `struct iovec iov[1]` call sites in xs.c.


libxl is not at fault
---------------------

tools/libs/light/libxl_xsquota.c explicitly treats quota as optional:

    names =3D xs_get_quota_names(ctx->xsh, &num);
    if (!names) {
        /* Xenstore quota support is optional! */
        if (errno !=3D ENOSYS) { ... rc =3D ERROR_FAIL; }
        else                 { rc =3D 0; }

Confirmed empirically: with an LD_PRELOAD shim forcing xs_get_quota_names()
to fail with ENOSYS, against the same hanging oxenstored, `xl list -l`
returns rc=3D0 with full JSON and `xl save` writes a 2.1 GB savefile. A
xenstored that lacks opcode 25 but *answers* ENOSYS works fine. The C
xenstored answers ENOSYS to unknown opcodes at any length.


Age
---

The defect is present in oxenstored's original commit:

    c3afd398ba7f349fdf59d79aaed4da256176806a
    Keir Fraser <keir.fraser@citrix.com>, 2010-05-06
    "ocaml: Add XS bindings."

`git log -S has_more_input -- tools/ocaml/libs/xb/xb.ml` returns that commi=
t
and no other; has_more_input has never been modified. The NoHdr branch is
unchanged in substance since RELEASE-4.2.0, and
`git diff RELEASE-4.21.0 HEAD -- tools/ocaml/libs/xb/{xb,partial,op}.ml`
is empty -- the files are byte-identical.


Reproducer
----------

Attached: oxs-zerolen.c (50 lines, no dependencies).

  gcc -o oxs-zerolen oxs-zerolen.c && sudo ./oxs-zerolen

Against oxenstored:

  XS_READ(2)      len=3D21  (sanity)           -> reply type=3D2 len=3D8
  XS_GET_QUOTA(25) len=3D2  (unknown op)       -> reply type=3D16 len=3D7
[ENOSYS]
  XS_READ(2)      len=3D0   (known op!)        -> NO REPLY (5s timeout)
  XS_DIRECTORY(1) len=3D0   (known op!)        -> NO REPLY (5s timeout)
  XS_GET_FEATURE(23) len=3D0  (xl info -x)     -> NO REPLY (5s timeout)
  XS_GET_QUOTA(25) len=3D0  (xl list -l)       -> NO REPLY (5s timeout)

Against the C xenstored: all six reply in 0.000 s.


Fix
---

In Xb.input, return the packet as soon as a complete header with len =3D=3D=
 0
has been read, rather than returning None and waiting for input that will
never arrive:

    | NoHdr (i, buf) ->
      if sz > 0 then Bytes.blit b 0 buf (Partial.header_size () - i) sz;
      if sz =3D i then begin
        let partial_pkt =3D Partial.of_string (Bytes.to_string buf) in
        if Partial.to_complete partial_pkt =3D 0 then begin
          con.partial_in <- init_partial_in ();
          Some (Packet.of_partialpkt partial_pkt)      (* was: None *)
        end else (con.partial_in <- HaveHdr partial_pkt; None)
      end else (con.partial_in <- NoHdr (i - sz, buf); None)

Alternatively, fix has_more_input, which is where the invariant is actually
violated -- "a complete packet is buffered" ought to imply more work is
pending. This duplicates no packet construction, since the HaveHdr branch
already handles to_complete =3D 0 with no read:

    let has_more_input con =3D
      match con.backend with
      | Fd _ -> (match con.partial_in with
                 | HaveHdr p -> Partial.to_complete p =3D 0
                 | _ -> false)
      | Xenmmap backend -> backend.work_again

The Fd arm being a hardcoded `false` while Xenmmap consults work_again is
the asymmetry that hid this.

Tested on
---------

Xen 4.23-unstable, git e58a8e0889, debug=3Dn, bare metal (Debian 13, x86_64=
).
oxenstored built from the same tree; running binary sha256-verified against
tools/ocaml/xenstored/oxenstored.

Not tested: 4.21.0 / 4.22-rc binaries were not built and run. The claim tha=
t
they are affected rests on (a) the xb library being byte-identical to HEAD
and (b) 5234b61eab / ba90589447 being present in those tags. Both were
checked with git; neither was exercised.


---oxs-zerolen.c
/*
 * oxs-zerolen.c - oxenstored never answers a request with len =3D=3D 0.
 *
 *   gcc -o oxs-zerolen oxs-zerolen.c && sudo ./oxs-zerolen
 *
 * Against oxenstored: every len=3D=3D0 request times out, whatever the opc=
ode.
 * Against C xenstored: every case replies immediately.
 */
#include <stdio.h>
#include <string.h>
#include <stdint.h>
#include <unistd.h>
#include <poll.h>
#include <sys/socket.h>
#include <sys/un.h>

struct xsd_sockmsg { uint32_t type, req_id, tx_id, len; };

/* Send one request, wait up to 5s for a reply header. */
static void probe(const char *what, uint32_t type, const char *pl, uint32_t
len)
{
struct sockaddr_un a =3D { .sun_family =3D AF_UNIX };
struct xsd_sockmsg m =3D { type, 0xC0DE, 0, len }, r;
struct pollfd p;
int fd =3D socket(AF_UNIX, SOCK_STREAM, 0);

strcpy(a.sun_path, "/var/run/xenstored/socket");
if (connect(fd, (struct sockaddr *)&a, sizeof(a))) { perror("connect");
return; }

if (write(fd, &m, sizeof(m)) !=3D sizeof(m)) { perror("write"); return; }
if (len && write(fd, pl, len) !=3D (ssize_t)len) { perror("write"); return;=
 }

p.fd =3D fd; p.events =3D POLLIN;
if (poll(&p, 1, 5000) =3D=3D 0)
printf("%-42s -> NO REPLY (5s timeout)\n", what);
else if (read(fd, &r, sizeof(r)) =3D=3D sizeof(r))
printf("%-42s -> reply type=3D%u len=3D%u\n", what, r.type, r.len);
close(fd);
}

int main(void)
{
probe("XS_READ(2)      len=3D21  (sanity)", 2, "/local/domain/0/name", 21);
probe("XS_GET_QUOTA(25) len=3D2  (unknown op)", 25, "0\0", 2);
probe("XS_READ(2)      len=3D0   (known op!)", 2, NULL, 0);
probe("XS_DIRECTORY(1) len=3D0   (known op!)", 1, NULL, 0);
probe("XS_GET_FEATURE(23) len=3D0  (xl info -x)", 23, NULL, 0);
probe("XS_GET_QUOTA(25) len=3D0  (xl list -l)", 25, NULL, 0);
return 0;
}

--000000000000cc38d906561ac626
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Mar 20,=
 2026 at 3:02=E2=80=AFPM Juergen Gross &lt;<a href=3D"mailto:jgross@suse.co=
m">jgross@suse.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">Add support for xenstore quota in the struct domain_confi=
g. Initially<br>
it will be used only for migration of a domain.<br>
<br>
Signed-off-by: Juergen Gross &lt;<a href=3D"mailto:jgross@suse.com" target=
=3D"_blank">jgross@suse.com</a>&gt;<br>
Acked-by: Nick Rosbrook &lt;<a href=3D"mailto:enr0n@ubuntu.com" target=3D"_=
blank">enr0n@ubuntu.com</a>&gt; # golang stuff<br>
---<br>
V2:<br>
- use LOGED() for error logging (Anthony Perard)<br>
- mention additional struct member xenstore_quota in libxl.h<br>
=C2=A0 (Anthony Perard)<br>
---<br>
=C2=A0tools/golang/xenlight/helpers.gen.go |=C2=A0 6 ++++++<br>
=C2=A0tools/golang/xenlight/types.gen.go=C2=A0 =C2=A0|=C2=A0 1 +<br>
=C2=A0tools/include/libxl.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 |=C2=A0 1 +<br>
=C2=A0tools/libs/light/libxl_dom.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0=
 8 ++++++++<br>
=C2=A0tools/libs/light/libxl_domain.c=C2=A0 =C2=A0 =C2=A0 | 11 +++++++++++<=
br>
=C2=A0tools/libs/light/libxl_types.idl=C2=A0 =C2=A0 =C2=A0|=C2=A0 1 +<br>
=C2=A06 files changed, 28 insertions(+)<br>
<br>
diff --git a/tools/golang/xenlight/helpers.gen.go b/tools/golang/xenlight/h=
elpers.gen.go<br>
index 767b9e45f5..b0c09da910 100644<br>
--- a/tools/golang/xenlight/helpers.gen.go<br>
+++ b/tools/golang/xenlight/helpers.gen.go<br>
@@ -1286,6 +1286,9 @@ if err :=3D x.TrapUnmappedAccesses.fromC(&amp;xc.trap=
_unmapped_accesses);err !=3D nil {<br>
=C2=A0return fmt.Errorf(&quot;converting field TrapUnmappedAccesses: %v&quo=
t;, err)<br>
=C2=A0}<br>
=C2=A0x.XenstoreFeatureMask =3D uint32(xc.xenstore_feature_mask)<br>
+if err :=3D x.XenstoreQuota.fromC(&amp;xc.xenstore_quota);err !=3D nil {<b=
r>
+return fmt.Errorf(&quot;converting field XenstoreQuota: %v&quot;, err)<br>
+}<br>
<br>
=C2=A0 return nil}<br>
<br>
@@ -1825,6 +1828,9 @@ if err :=3D x.TrapUnmappedAccesses.toC(&amp;xc.trap_u=
nmapped_accesses); err !=3D nil {<br>
=C2=A0return fmt.Errorf(&quot;converting field TrapUnmappedAccesses: %v&quo=
t;, err)<br>
=C2=A0}<br>
=C2=A0xc.xenstore_feature_mask =3D C.uint32_t(x.XenstoreFeatureMask)<br>
+if err :=3D x.XenstoreQuota.toC(&amp;xc.xenstore_quota); err !=3D nil {<br=
>
+return fmt.Errorf(&quot;converting field XenstoreQuota: %v&quot;, err)<br>
+}<br>
<br>
=C2=A0 return nil<br>
=C2=A0 }<br>
diff --git a/tools/golang/xenlight/types.gen.go b/tools/golang/xenlight/typ=
es.gen.go<br>
index 8dd610919d..e0fd78ec03 100644<br>
--- a/tools/golang/xenlight/types.gen.go<br>
+++ b/tools/golang/xenlight/types.gen.go<br>
@@ -629,6 +629,7 @@ VmtraceBufKb int<br>
=C2=A0Vpmu Defbool<br>
=C2=A0TrapUnmappedAccesses Defbool<br>
=C2=A0XenstoreFeatureMask uint32<br>
+XenstoreQuota XsQuotaList<br>
=C2=A0}<br>
<br>
=C2=A0type DomainBuildInfoTypeUnion interface {<br>
diff --git a/tools/include/libxl.h b/tools/include/libxl.h<br>
index 6d2910df34..80e3ec8de9 100644<br>
--- a/tools/include/libxl.h<br>
+++ b/tools/include/libxl.h<br>
@@ -1545,6 +1545,7 @@ void libxl_mac_copy(libxl_ctx *ctx, libxl_mac *dst, c=
onst libxl_mac *src);<br>
=C2=A0 * libxl_xs_quota_global_set()<br>
=C2=A0 * libxl_xs_quota_domain_get()<br>
=C2=A0 * libxl_xs_quota_domain_set()<br>
+ * and the xenstore_quota member of struct domain_build_info<br>
=C2=A0 * are available.<br>
=C2=A0 */<br>
=C2=A0#define LIBXL_HAVE_XENSTORE_QUOTA<br>
diff --git a/tools/libs/light/libxl_dom.c b/tools/libs/light/libxl_dom.c<br=
>
index 05ebc69534..4ff5f65f6f 100644<br>
--- a/tools/libs/light/libxl_dom.c<br>
+++ b/tools/libs/light/libxl_dom.c<br>
@@ -509,6 +509,14 @@ retry_transaction:<br>
<br>
=C2=A0 =C2=A0 =C2=A0xs_introduce_domain(ctx-&gt;xsh, domid, state-&gt;store=
_mfn, state-&gt;store_port);<br>
<br>
+=C2=A0 =C2=A0 if (info-&gt;xenstore_quota.num_quota) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 rc =3D libxl_xs_quota_domain_set(ctx, domid, &=
amp;info-&gt;xenstore_quota);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (rc) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 LOGED(ERROR, domid, &quot;Failed=
 to set Xenstore quota&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto out;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 }<br>
+<br>
=C2=A0 out:<br>
=C2=A0 =C2=A0 =C2=A0free(vm_path);<br>
=C2=A0 =C2=A0 =C2=A0return rc;<br>
diff --git a/tools/libs/light/libxl_domain.c b/tools/libs/light/libxl_domai=
n.c<br>
index 5be47f687f..37fcd92871 100644<br>
--- a/tools/libs/light/libxl_domain.c<br>
+++ b/tools/libs/light/libxl_domain.c<br>
@@ -2533,6 +2533,17 @@ static void retrieve_domain_configuration_end(libxl_=
_egc *egc,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
+=C2=A0 =C2=A0 /* Xenstore quota */<br>
+=C2=A0 =C2=A0 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 libxl_xs_quota_list_dispose(&amp;d_config-&gt;=
b_info.xenstore_quota);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 rc =3D libxl_xs_quota_domain_get(CTX, domid,<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;d_co=
nfig-&gt;b_info.xenstore_quota);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (rc) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 LOGED(ERROR, domid, &quot;Fail t=
o get xenstore quota&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto out;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br></blockquote><div><br></div><div>This cha=
nge seems to cause `xl list` to hang on oxenstored systems.</div><div><br><=
/div><div>I&#39;m not an expert in ocaml; Claude seems to think that the pr=
oblem is as follows:</div><div><br></div><div>1. oxenstored doesn&#39;t imp=
lement XS_GET_QUOTA, and</div><div>2. when it receives an unknown message i=
t returns an error, but</div><div>3. the error payload is length zero, and<=
/div><div>4. oxenstored has a bug such that it will never actually send mes=
sages with a zero-length payload.</div><div><br></div><div>Below is a more =
complete report from Claude; as I said, I don&#39;t know enough ocaml to ev=
aluate it. Plan `xl list` only triggers it on staging, but apparently `xl l=
ist -x` will trigger it in Xen 4.21.</div><div><br></div><div>Assuming the =
analysis is correct, it&#39;s concerning that an issue with the default xen=
stored instance wasn&#39;t caught earlier.</div><div><br></div><div>=C2=A0-=
George</div><div><br></div><div>8&lt;---</div><div><br></div><div>Subject: =
oxenstored hangs on any xenstore request with a zero-length payload<br><br>=
=C2=A0 Affects, on oxenstored systems:<br>=C2=A0 =C2=A0 - `xl info -x` and =
`xenstore watch -d N` =C2=A0-- RELEASE-4.21.0, RELEASE-4.21.1<br>=C2=A0 =C2=
=A0 - `xl list -l`, `xl save`, `xl migrate` =C2=A0 -- 4.22.0-rc1..rc3, unst=
able<br>=C2=A0 The C xenstored and xenstore-stubdom are unaffected.<br><br>=
<br>Symptom<br>-------<br><br>On an idle dom0 with no guests, running oxens=
tored, `xl list -l` never<br>returns and produces no output. The same holds=
 for `xl save`, `xl migrate`,<br>`xl info -x`, and `xenstore watch -d N`. M=
eanwhile `xl list`, `xl list -v`,<br>`xl info -n`, `xenstore-read` and `xen=
store-ls` all work normally.<br><br>The client is blocked in read(fd, buf, =
16) awaiting an xsd_sockmsg header<br>that never arrives. Both socket queue=
s are empty. oxenstored itself remains<br>healthy and continues to serve ev=
ery other connection.<br><br><br>Root cause<br>----------<br><br>oxenstored=
&#39;s socket backend never delivers a request whose payload length<br>is z=
ero. This is independent of the opcode: XS_READ and XS_DIRECTORY with<br>le=
n =3D=3D 0 hang exactly as XS_GET_QUOTA does.<br><br>In tools/ocaml/libs/xb=
/<a href=3D"http://xb.ml">xb.ml</a>, Xb.input() consumes the 16-byte header=
 and<br>sets partial_in &lt;- HaveHdr pkt, then returns None unconditionall=
y:<br><br>=C2=A0 =C2=A0 | NoHdr (i, buf) =C2=A0 =C2=A0 =C2=A0-&gt;<br>=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 (* we complete the partial header *)<br>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 if sz &gt; 0 then<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 B=
ytes.blit b 0 buf (Partial.header_size () - i) sz;<br>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 con.partial_in &lt;- if sz =3D i then<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 HaveHdr (Partial.of_string (Bytes.to_string buf)) else NoHdr=
 (i - sz, buf);<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 None<br><br>The packet would=
 be produced by the *next* call to input() -- the HaveHdr<br>branch handles=
 Partial.to_complete =3D 0 without reading anything further.<br>But has_mor=
e_input is hardcoded false for socket backends:<br><br>=C2=A0 =C2=A0 let ha=
s_more_input con =3D<br>=C2=A0 =C2=A0 =C2=A0 match con.backend with<br>=C2=
=A0 =C2=A0 =C2=A0 | Fd _ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-&gt; fal=
se<br>=C2=A0 =C2=A0 =C2=A0 | Xenmmap backend -&gt; backend.work_again<br><b=
r>so <a href=3D"http://xenstored.ml">xenstored.ml</a> re-enters do_input on=
ly when poll() reports the fd readable.<br><br>=C2=A0 - For len &gt; 0, the=
 payload is still buffered in the socket, so poll()<br>=C2=A0 =C2=A0 fires =
again and the packet completes. This is why every other request<br>=C2=A0 =
=C2=A0 works.<br><br>=C2=A0 - For len =3D=3D 0, nothing remains to be read.=
 poll() never fires, and a<br>=C2=A0 =C2=A0 fully-received request sits par=
ked in partial_in indefinitely.<br><br>It is finally processed only when fu=
rther input arrives on that connection<br>-- including POLLHUP at client te=
ardown -- at which point the reply is<br>written to a dead socket.<br><br>o=
xenstored&#39;s dispatch layer is correct: XS_GET_QUOTA with a non-empty<br=
>payload returns XS_ERROR &quot;ENOSYS&quot; in under a millisecond. Only t=
he framing<br>layer is broken.<br><br>Guest ring (Xenmmap) connections appe=
ar unaffected, since there<br>has_more_input follows work_again. NOTE: this=
 is a source-level inference;<br>I did not exercise a ring connection with =
a zero-length request.<br><br><br>Evidence<br>--------<br><br>strace of oxe=
nstored. \31 =3D 25 =3D XS_GET_QUOTA, \2 =3D XS_READ:<br><br>=C2=A0 # len=
=3D0, unknown opcode 25 -- nothing written, silence, then client EOF<br>=C2=
=A0 14:54:01.801066 read(23, &quot;\31\0\0\0\336\300\0\0\0\0\0\0\0\0\0\0&qu=
ot;, 16) =3D 16<br>=C2=A0 14:54:06.806325 write(18, &quot;[...] =C2=A0A81 i=
nvalid&quot;, 50) =C2=A0 &lt;- only at POLLHUP<br>=C2=A0 14:54:06.806811 re=
ad(23, &quot;&quot;, 16) =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D 0<br><br>=C2=A0 # l=
en=3D0, WELL-KNOWN opcode 2 -- identical hang<br>=C2=A0 14:54:10.840293 rea=
d(23, &quot;\2\0\0\0\336\300\0\0\0\0\0\0\0\0\0\0&quot;, 16) =3D 16<br>=C2=
=A0 14:54:15.845644 read(23, &quot;&quot;, 16) =C2=A0 =C2=A0 =C2=A0 =C2=A0=
=3D 0<br><br>=C2=A0 # same opcode 25, len=3D2 -- answered instantly<br>=C2=
=A0 14:54:19.879492 read(23, &quot;\31\0\0\0\336\300\0\0\0\0\0\0\2\0\0\0&qu=
ot;, 16) =3D 16<br>=C2=A0 14:54:19.879698 read(23, &quot;0\0&quot;, 2) =C2=
=A0 =C2=A0 =C2=A0=3D 2<br>=C2=A0 14:54:19.879810 write(18, &quot;[...] A83 =
invalid / error ENOSYS&quot;, ...)<br><br>The poll() following the parked r=
ead requests POLLIN only -- no POLLOUT --<br>i.e. oxenstored has nothing qu=
eued to send. xenstored.log contains neither<br>&quot;process packet:&quot;=
 nor &quot;got a bad client&quot;: process_packet is never entered.<br><br>=
Decisive: send the len =3D=3D 0 header, wait three seconds (nothing), then =
send<br>one unrelated byte. The ENOSYS reply *for the original request id* =
is<br>emitted within 1 ms. The request was never dropped -- it was parked,<=
br>waiting for a poll() that had nothing left to deliver.<br><br><br>Trigge=
r<br>-------<br><br>libxenstore has exactly two zero-length senders, both r=
ecent. Before them,<br>no xenstore client had ever sent a zero-length reque=
st over the socket, so<br>the defect lay dormant.<br><br>=C2=A0 xs_get_feat=
ures_supported() =C2=A0XS_GET_FEATURE =C2=A0tools/libs/store/xs.c:1486<br>=
=C2=A0 =C2=A0 =C2=A0 added by 5234b61eab<br>=C2=A0 =C2=A0 =C2=A0 in: RELEAS=
E-4.21.0, RELEASE-4.21.1, 4.22.0-rc*, unstable<br>=C2=A0 =C2=A0 =C2=A0 reac=
hed by: xl info -x, xenstore watch -d N<br><br>=C2=A0 xs_get_quota_names() =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 XS_GET_QUOTA =C2=A0 =C2=A0tools/libs/store/xs.c=
:1537<br>=C2=A0 =C2=A0 =C2=A0 added by ba90589447<br>=C2=A0 =C2=A0 =C2=A0 i=
n: 4.22.0-rc1..rc3, unstable<br>=C2=A0 =C2=A0 =C2=A0 reached by: xl list -l=
, xl save, xl migrate -- since a6f159f92c made<br>=C2=A0 =C2=A0 =C2=A0 libx=
l_retrieve_domain_configuration() query xenstore quota<br><br>Both are the =
only `struct iovec iov[1]` call sites in xs.c.<br><br><br>libxl is not at f=
ault<br>---------------------<br><br>tools/libs/light/libxl_xsquota.c expli=
citly treats quota as optional:<br><br>=C2=A0 =C2=A0 names =3D xs_get_quota=
_names(ctx-&gt;xsh, &amp;num);<br>=C2=A0 =C2=A0 if (!names) {<br>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 /* Xenstore quota support is optional! */<br>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 if (errno !=3D ENOSYS) { ... rc =3D ERROR_FAIL; }<br>=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 else =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 { rc =3D 0; }<br><br>Confirmed empirically: with an LD_PRELOAD s=
him forcing xs_get_quota_names()<br>to fail with ENOSYS, against the same h=
anging oxenstored, `xl list -l`<br>returns rc=3D0 with full JSON and `xl sa=
ve` writes a 2.1 GB savefile. A<br>xenstored that lacks opcode 25 but *answ=
ers* ENOSYS works fine. The C<br>xenstored answers ENOSYS to unknown opcode=
s at any length.<br><br><br>Age<br>---<br><br>The defect is present in oxen=
stored&#39;s original commit:<br><br>=C2=A0 =C2=A0 c3afd398ba7f349fdf59d79a=
aed4da256176806a<br>=C2=A0 =C2=A0 Keir Fraser &lt;<a href=3D"mailto:keir.fr=
aser@citrix.com">keir.fraser@citrix.com</a>&gt;, 2010-05-06<br>=C2=A0 =C2=
=A0 &quot;ocaml: Add XS bindings.&quot;<br><br>`git log -S has_more_input -=
- tools/ocaml/libs/xb/<a href=3D"http://xb.ml">xb.ml</a>` returns that comm=
it<br>and no other; has_more_input has never been modified. The NoHdr branc=
h is<br>unchanged in substance since RELEASE-4.2.0, and<br>`git diff RELEAS=
E-4.21.0 HEAD -- tools/ocaml/libs/xb/{xb,partial,op}.ml`<br>is empty -- the=
 files are byte-identical.<br><br><br>Reproducer<br>----------<br><br>Attac=
hed: oxs-zerolen.c (50 lines, no dependencies).<br><br>=C2=A0 gcc -o oxs-ze=
rolen oxs-zerolen.c &amp;&amp; sudo ./oxs-zerolen<br><br>Against oxenstored=
:<br><br>=C2=A0 XS_READ(2) =C2=A0 =C2=A0 =C2=A0len=3D21 =C2=A0(sanity) =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -&gt; reply type=3D2 len=3D8<br>=C2=A0 XS_G=
ET_QUOTA(25) len=3D2 =C2=A0(unknown op) =C2=A0 =C2=A0 =C2=A0 -&gt; reply ty=
pe=3D16 len=3D7 =C2=A0 [ENOSYS]<br>=C2=A0 XS_READ(2) =C2=A0 =C2=A0 =C2=A0le=
n=3D0 =C2=A0 (known op!) =C2=A0 =C2=A0 =C2=A0 =C2=A0-&gt; NO REPLY (5s time=
out)<br>=C2=A0 XS_DIRECTORY(1) len=3D0 =C2=A0 (known op!) =C2=A0 =C2=A0 =C2=
=A0 =C2=A0-&gt; NO REPLY (5s timeout)<br>=C2=A0 XS_GET_FEATURE(23) len=3D0 =
=C2=A0(xl info -x) =C2=A0 =C2=A0 -&gt; NO REPLY (5s timeout)<br>=C2=A0 XS_G=
ET_QUOTA(25) len=3D0 =C2=A0(xl list -l) =C2=A0 =C2=A0 =C2=A0 -&gt; NO REPLY=
 (5s timeout)<br><br>Against the C xenstored: all six reply in 0.000 s.<br>=
<br><br>Fix<br>---<br><br>In Xb.input, return the packet as soon as a compl=
ete header with len =3D=3D 0<br>has been read, rather than returning None a=
nd waiting for input that will<br>never arrive:<br><br>=C2=A0 =C2=A0 | NoHd=
r (i, buf) -&gt;<br>=C2=A0 =C2=A0 =C2=A0 if sz &gt; 0 then Bytes.blit b 0 b=
uf (Partial.header_size () - i) sz;<br>=C2=A0 =C2=A0 =C2=A0 if sz =3D i the=
n begin<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 let partial_pkt =3D Partial.of_strin=
g (Bytes.to_string buf) in<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 if Partial.to_com=
plete partial_pkt =3D 0 then begin<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 co=
n.partial_in &lt;- init_partial_in ();<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 Some (Packet.of_partialpkt partial_pkt) =C2=A0 =C2=A0 =C2=A0(* was: Non=
e *)<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 end else (con.partial_in &lt;- HaveHdr =
partial_pkt; None)<br>=C2=A0 =C2=A0 =C2=A0 end else (con.partial_in &lt;- N=
oHdr (i - sz, buf); None)<br><br>Alternatively, fix has_more_input, which i=
s where the invariant is actually<br>violated -- &quot;a complete packet is=
 buffered&quot; ought to imply more work is<br>pending. This duplicates no =
packet construction, since the HaveHdr branch<br>already handles to_complet=
e =3D 0 with no read:<br><br>=C2=A0 =C2=A0 let has_more_input con =3D<br>=
=C2=A0 =C2=A0 =C2=A0 match con.backend with<br>=C2=A0 =C2=A0 =C2=A0 | Fd _ =
-&gt; (match con.partial_in with<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0| HaveHdr p -&gt; Partial.to_complete p =3D 0<br>=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| _ -&gt; fal=
se)<br>=C2=A0 =C2=A0 =C2=A0 | Xenmmap backend -&gt; backend.work_again<br><=
br>The Fd arm being a hardcoded `false` while Xenmmap consults work_again i=
s<br>the asymmetry that hid this.<br><br>Tested on<br>---------<br><br>Xen =
4.23-unstable, git e58a8e0889, debug=3Dn, bare metal (Debian 13, x86_64).<b=
r>oxenstored built from the same tree; running binary sha256-verified again=
st<br>tools/ocaml/xenstored/oxenstored.<br><br>Not tested: 4.21.0 / 4.22-rc=
 binaries were not built and run. The claim that<br>they are affected rests=
 on (a) the xb library being byte-identical to HEAD<br>and (b) 5234b61eab /=
 ba90589447 being present in those tags. Both were<br>checked with git; nei=
ther was exercised.</div><div><br></div><div><br></div><div>---oxs-zerolen.=
c</div><div>/*<br>=C2=A0* oxs-zerolen.c - oxenstored never answers a reques=
t with len =3D=3D 0.<br>=C2=A0*<br>=C2=A0* =C2=A0 gcc -o oxs-zerolen oxs-ze=
rolen.c &amp;&amp; sudo ./oxs-zerolen<br>=C2=A0*<br>=C2=A0* Against oxensto=
red: every len=3D=3D0 request times out, whatever the opcode.<br>=C2=A0* Ag=
ainst C xenstored: every case replies immediately.<br>=C2=A0*/<br>#include =
&lt;stdio.h&gt;<br>#include &lt;string.h&gt;<br>#include &lt;stdint.h&gt;<b=
r>#include &lt;unistd.h&gt;<br>#include &lt;poll.h&gt;<br>#include &lt;sys/=
socket.h&gt;<br>#include &lt;sys/un.h&gt;<br><br>struct xsd_sockmsg { uint3=
2_t type, req_id, tx_id, len; };<br><br>/* Send one request, wait up to 5s =
for a reply header. */<br>static void probe(const char *what, uint32_t type=
, const char *pl, uint32_t len)<br>{<br>	struct sockaddr_un a =3D { .sun_fa=
mily =3D AF_UNIX };<br>	struct xsd_sockmsg m =3D { type, 0xC0DE, 0, len }, =
r;<br>	struct pollfd p;<br>	int fd =3D socket(AF_UNIX, SOCK_STREAM, 0);<br>=
<br>	strcpy(a.sun_path, &quot;/var/run/xenstored/socket&quot;);<br>	if (con=
nect(fd, (struct sockaddr *)&amp;a, sizeof(a))) { perror(&quot;connect&quot=
;); return; }<br><br>	if (write(fd, &amp;m, sizeof(m)) !=3D sizeof(m)) { pe=
rror(&quot;write&quot;); return; }<br>	if (len &amp;&amp; write(fd, pl, len=
) !=3D (ssize_t)len) { perror(&quot;write&quot;); return; }<br><br>	p.fd =
=3D fd; p.events =3D POLLIN;<br>	if (poll(&amp;p, 1, 5000) =3D=3D 0)<br>		p=
rintf(&quot;%-42s -&gt; NO REPLY (5s timeout)\n&quot;, what);<br>	else if (=
read(fd, &amp;r, sizeof(r)) =3D=3D sizeof(r))<br>		printf(&quot;%-42s -&gt;=
 reply type=3D%u len=3D%u\n&quot;, what, r.type, r.len);<br>	close(fd);<br>=
}<br><br>int main(void)<br>{<br>	probe(&quot;XS_READ(2) =C2=A0 =C2=A0 =C2=
=A0len=3D21 =C2=A0(sanity)&quot;, 2, &quot;/local/domain/0/name&quot;, 21);=
<br>	probe(&quot;XS_GET_QUOTA(25) len=3D2 =C2=A0(unknown op)&quot;, 25, &qu=
ot;0\0&quot;, 2);<br>	probe(&quot;XS_READ(2) =C2=A0 =C2=A0 =C2=A0len=3D0 =
=C2=A0 (known op!)&quot;, 2, NULL, 0);<br>	probe(&quot;XS_DIRECTORY(1) len=
=3D0 =C2=A0 (known op!)&quot;, 1, NULL, 0);<br>	probe(&quot;XS_GET_FEATURE(=
23) len=3D0 =C2=A0(xl info -x)&quot;, 23, NULL, 0);<br>	probe(&quot;XS_GET_=
QUOTA(25) len=3D0 =C2=A0(xl list -l)&quot;, 25, NULL, 0);<br>	return 0;<br>=
}<br></div><div><br></div></div></div>

--000000000000cc38d906561ac626--

