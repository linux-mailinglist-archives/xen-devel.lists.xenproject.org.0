Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 691906B85FB
	for <lists+xen-devel@lfdr.de>; Tue, 14 Mar 2023 00:18:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.509394.785075 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pbrQ7-0001zA-Of; Mon, 13 Mar 2023 23:17:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 509394.785075; Mon, 13 Mar 2023 23:17:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pbrQ7-0001xR-Lm; Mon, 13 Mar 2023 23:17:35 +0000
Received: by outflank-mailman (input) for mailman id 509394;
 Mon, 13 Mar 2023 23:17:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Jvaw=7F=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1pbrQ5-0001xK-MC
 for xen-devel@lists.xenproject.org; Mon, 13 Mar 2023 23:17:33 +0000
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [2a00:1450:4864:20::52e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3700202f-c1f5-11ed-b464-930f4c7d94ae;
 Tue, 14 Mar 2023 00:17:25 +0100 (CET)
Received: by mail-ed1-x52e.google.com with SMTP id k10so55051292edk.13
 for <xen-devel@lists.xenproject.org>; Mon, 13 Mar 2023 16:17:30 -0700 (PDT)
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
X-Inumbo-ID: 3700202f-c1f5-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678749450;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/9I78Cyb92tlpD0pxxthBhr0hJmIIDxB9AXNX2L7yYo=;
        b=EztFVng3SMqRAMPFyRS2iqTlFyw/musIq4ZJTe6tpYxuznXla+KIuslhxzYHyfhwNY
         qJU2ErDWAYkO70AIsZR0jdqw8GSgKpDZdSHs+i/GfCgaVouf6HZ1Bbmf4bGt49SVq9+M
         Zffa3RVsrNjUELLx5VU6cBqFSbLE1BVyblqFAT9RB4W4PELSryrSH6xF9maEQIUnyNe2
         oXh4w0krevPgXnFCWZmyaeaZpf0pWElTKMO3ZdNw6vtni3icuxTtZ1FMEeP/57weMbQW
         7htMQVV32odcxZyG9b4VjGOI+JGivhDUgS6KRgVOeJ9G5KRUYYNCwAfbcmVVrhlkbTuD
         chZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678749450;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/9I78Cyb92tlpD0pxxthBhr0hJmIIDxB9AXNX2L7yYo=;
        b=vbS5CfMTFOyhHWr7dSM/rEb1HgitQ1x79bKVm8pIWf6Xd0xWKK8W588xPElFlhAyTD
         vvTyAPLDEyJhVedV3p/l1nP9FZ6fdJhatTnK3G8lBFKp2Mm9SdcDszE9xnq3lbYthw0E
         CAA4lthzT6Q+TWdt8jDHEEb68b7RSEhrVvc0lrXj5eRkJBvUDIr5cfQqhp93ZuN39h69
         MuFVevTRLGQAgEJMRQu63b71B8T1joHy+bUuNu8idDyhUN3AC7v3NC8PF6zdKI6dUhhC
         7IWHIAjHipItlkPVYDtwfT2cSBVgdsXDfPmNtIukUUvICrjTkfI9PajqtvLlwFBKtQDC
         aNwg==
X-Gm-Message-State: AO0yUKUCrqYZWae1OH4FpYn7+btAiWDFVBtu427FSUvM1XrK1D71EgvI
	XUksMdWsKXHopEMAq+WLIE5/G7ks7PTbQJpCXaU=
X-Google-Smtp-Source: AK7set97PfEpqjdeGqjYGfSvaN6ETH7lY49N26u1x9C+z7Z//EzMqhrvs+2EgL2O0xxKu2hDGBaQ/lkq9hbPNc3KQVE=
X-Received: by 2002:a17:907:e91:b0:924:32b2:e3d1 with SMTP id
 ho17-20020a1709070e9100b0092432b2e3d1mr146951ejc.3.1678749450023; Mon, 13 Mar
 2023 16:17:30 -0700 (PDT)
MIME-Version: 1.0
References: <20230307182707.2298618-1-dwmw2@infradead.org> <20230307182707.2298618-14-dwmw2@infradead.org>
 <CAKf6xpuH2E=16s1jFvgL9J723wv0dhBD5aYWP2NBNj5rZio2jg@mail.gmail.com> <5062bef5b5cfd3e2d7f313de9af306f5e4f841f5.camel@infradead.org>
In-Reply-To: <5062bef5b5cfd3e2d7f313de9af306f5e4f841f5.camel@infradead.org>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Mon, 13 Mar 2023 19:17:17 -0400
Message-ID: <CAKf6xptRmeVmH3xmF8QffQA=aYeXxCWUw9ta2HaYx1xQngzjTA@mail.gmail.com>
Subject: Re: [PULL 13/27] hw/xen: Add xenstore operations to allow redirection
 to internal emulation
To: David Woodhouse <dwmw2@infradead.org>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org, 
	Paolo Bonzini <pbonzini@redhat.com>, Paul Durrant <paul@xen.org>, 
	Joao Martins <joao.m.martins@oracle.com>, Ankur Arora <ankur.a.arora@oracle.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, vikram.garhwal@amd.com, 
	Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org, 
	Juan Quintela <quintela@redhat.com>, "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, David,

On Mon, Mar 13, 2023 at 4:45=E2=80=AFAM David Woodhouse <dwmw2@infradead.or=
g> wrote:
>
> On Sun, 2023-03-12 at 15:19 -0400, Jason Andryuk wrote:
> >
> > This breaks dm_restrict=3D1 since the xs_open is not allowed by the
> > time
> > this is called.  There are other evtchn errors before this as well:
> > # cat /var/log/xen/qemu-dm-debian.log
> > char device redirected to /dev/pts/8 (label serial0)
> > xen be core: can't open evtchn device
> > xen be core: can't open evtchn device
> > xen be core: can't open evtchn device
> > xen be core: can't open evtchn device
> > xen be core: can't open evtchn device
> > xen be core: can't open evtchn device
> > xen be core: can't open evtchn device
> > xen be core: can't open evtchn device
> > Could not contact XenStore
> >
> > Ok, those "xen be core: can't open evtchn device" were there before
> > the recent changes and seem to be non-fatal.
>
> Hm, I *think* we can just revert that part and use the global
> 'xenstore' like we did before, except via the new ops.
>
> --- a/accel/xen/xen-all.c
> +++ b/accel/xen/xen-all.c
> @@ -32,28 +32,18 @@ xendevicemodel_handle *xen_dmod;
>
>  static void xenstore_record_dm_state(const char *state)
>  {
> -    struct xs_handle *xs;
>      char path[50];
>
> -    /* We now have everything we need to set the xenstore entry. */
> -    xs =3D xs_open(0);
> -    if (xs =3D=3D NULL) {
> -        fprintf(stderr, "Could not contact XenStore\n");
> -        exit(1);
> -    }
> -
>      snprintf(path, sizeof (path), "device-model/%u/state", xen_domid);
>      /*
>       * This call may fail when running restricted so don't make it fatal=
 in
>       * that case. Toolstacks should instead use QMP to listen for state =
changes.
>       */
> -    if (!xs_write(xs, XBT_NULL, path, state, strlen(state)) &&
> +    if (!qemu_xen_xs_write(xenstore, XBT_NULL, path, state, strlen(state=
)) &&
>              !xen_domid_restrict) {
>          error_report("error recording dm state");
>          exit(1);
>      }
> -
> -    xs_close(xs);
>  }

This looks good, better than what I posted, and seems to work for both
dm_restrict set and unset.

>
> Alternatively, that xs_write is destined to fail anyway in the
> xen_domid_restrict case, isn't it? So the xs_open() should be allowed
> to fail similarly. Or perhaps we shouldn't even *try*?

For dm_restricted, xs_write() does fail.  I verified that with a print
statement.  I think "shouldn't even try" makes sense.  I'm thinking
that  xen_domid_restricted shouldn't even add the callback.  Something
like:

--- a/accel/xen/xen-all.c
+++ b/accel/xen/xen-all.c
@@ -39,8 +39,7 @@ static void xenstore_record_dm_state(const char *state)
      * This call may fail when running restricted so don't make it fatal i=
n
      * that case. Toolstacks should instead use QMP to listen for
state changes.
      */
-    if (!qemu_xen_xs_write(xenstore, XBT_NULL, path, state, strlen(state))=
 &&
-            !xen_domid_restrict) {
+    if (!qemu_xen_xs_write(xenstore, XBT_NULL, path, state, strlen(state))=
) {
         error_report("error recording dm state");
         exit(1);
     }
@@ -101,7 +100,10 @@ static int xen_init(MachineState *ms)
         xc_interface_close(xen_xc);
         return -1;
     }
-    qemu_add_vm_change_state_handler(xen_change_state_handler, NULL);
+
+    if(!xen_domid_restrict)
+        qemu_add_vm_change_state_handler(xen_change_state_handler, NULL);
+
     /*
      * opt out of system RAM being allocated by generic code
      */

That works for both dm_restrict 0 & 1.

I think you should submit your change and I can follow up with the
above if it seems desirable.

Thanks,
Jason

