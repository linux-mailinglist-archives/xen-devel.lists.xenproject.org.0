Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A61EC8033B2
	for <lists+xen-devel@lfdr.de>; Mon,  4 Dec 2023 14:00:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.646913.1009575 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rA8Yi-0003Tx-Fc; Mon, 04 Dec 2023 13:00:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 646913.1009575; Mon, 04 Dec 2023 13:00:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rA8Yi-0003SJ-Cl; Mon, 04 Dec 2023 13:00:24 +0000
Received: by outflank-mailman (input) for mailman id 646913;
 Mon, 04 Dec 2023 13:00:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bwcF=HP=cloud.com=george.dunlap@srs-se1.protection.inumbo.net>)
 id 1rA8Yh-0003SD-Dy
 for xen-devel@lists.xenproject.org; Mon, 04 Dec 2023 13:00:23 +0000
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [2a00:1450:4864:20::12a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 14f2baf6-92a5-11ee-9b0f-b553b5be7939;
 Mon, 04 Dec 2023 14:00:21 +0100 (CET)
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-50be0f13aa6so2325446e87.1
 for <xen-devel@lists.xenproject.org>; Mon, 04 Dec 2023 05:00:21 -0800 (PST)
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
X-Inumbo-ID: 14f2baf6-92a5-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1701694821; x=1702299621; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=hB0hAu0fUpxj2GhqHqzQ9MR208iJYFJMrWeCss5UAIk=;
        b=lIjr5Pf2hedspkqxygflpKZpsbIXACJV3VUjKXev/N5x+WR/vpJyYaMC8YQj6pUSZ2
         eoWW3iQFDomNTZWcI+YJEX0f87WtCmGD25xRF+Iv7DnY1Sfx1APd3f3akXH2T+cU1681
         Uv2JiPjqfgIbkJ/6WhwllLn6poqwTfg3sTxM0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701694821; x=1702299621;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hB0hAu0fUpxj2GhqHqzQ9MR208iJYFJMrWeCss5UAIk=;
        b=Libs9RVBQq2fxJdysGHWM5sT3Vu6DTJpiLSD2TVdVX7GDcdDP2sj0kif5Ek9a7Y1Lu
         ovDqYunPjb1PobIzBXyDQMzXkEkycz5aknN0xc+lo6e/lbqJAS5fyHtOZQPPXan3VNAP
         X87fk2C7Wp8Meo2GwBWrliXofhcU5pVPS895yXpt8uICAuD1+CCtmLOtf110KqhS3stI
         hDQydcFWmm1eoZ06ujPhhRMaRt2ym6vb8DA4n9WTVgqNzNREan0uSul/sgBluILTaLTX
         hkiGUosLBxV24a0sKkEYYRNhl+dke4SrdUAButYDCh1UnyrB87M8ebUuiD8EA6VArDMN
         mERQ==
X-Gm-Message-State: AOJu0YyUwNcXCKA+KrIOZGXqUDVGZKGMGTzcn20lxM7eIzohIPX1r3QX
	KX0DkP63AIQELbBV//vRiuAh4Ix+t3qDK2SLciIUIw==
X-Google-Smtp-Source: AGHT+IHm4w4mHlceczZP6ViTcmso1QWUsE8ctsviqEU3IONvuts4dJBCOyXL/8clcLbBes2Gkw5/fa5UZ9qo/Dq0/0k=
X-Received: by 2002:a2e:b3d7:0:b0:2c9:c610:7c8e with SMTP id
 j23-20020a2eb3d7000000b002c9c6107c8emr3479093lje.16.1701694820715; Mon, 04
 Dec 2023 05:00:20 -0800 (PST)
MIME-Version: 1.0
References: <2b59a3a2-d2f3-4d29-ab40-3f630fd497fe@suse.com>
In-Reply-To: <2b59a3a2-d2f3-4d29-ab40-3f630fd497fe@suse.com>
From: George Dunlap <george.dunlap@cloud.com>
Date: Mon, 4 Dec 2023 13:00:09 +0000
Message-ID: <CA+zSX=Zenkkyv2cQD-CKt=i90YUxxf=B_AuLgh82HDRUEkXJcg@mail.gmail.com>
Subject: Re: [PATCH] sched: correct sched_move_domain()'s cleanup path
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Dario Faggioli <dfaggioli@suse.com>, 
	Juergen Gross <jgross@suse.com>, =?UTF-8?Q?Ren=C3=A9_Winther_H=C3=B8jgaard?= <renewin@proton.me>
Content-Type: multipart/mixed; boundary="0000000000004e3dfe060baeb329"

--0000000000004e3dfe060baeb329
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 4, 2023 at 10:57=E2=80=AFAM Jan Beulich <jbeulich@suse.com> wro=
te:
>
> It is only in the error case that we want to clean up the new pool's
> scheduler data; in the success case it's rather the old scheduler's
> data which needs cleaning up.
>
> Reported-by: Ren=C3=A9 Winther H=C3=B8jgaard <renewin@proton.me>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> Reviewed-by: Juergen Gross <jgross@suse.com>
>
> --- a/xen/common/sched/core.c
> +++ b/xen/common/sched/core.c
> @@ -810,7 +810,7 @@ int sched_move_domain(struct domain *d,
>      for ( unit =3D old_units; unit; )
>      {
>          if ( unit->priv )
> -            sched_free_udata(c->sched, unit->priv);
> +            sched_free_udata(ret ? c->sched : old_ops, unit->priv);
>          old_unit =3D unit;
>          unit =3D unit->next_in_list;
>          xfree(old_unit);

This code is unfortunately written in a "clever" way which seems to
have introduced some confusion.  The one place which calls "goto
out_free" goes through and replaces *most* of the "old_*" variables
with the "new" equivalents.  That's why we're iterating over
`old_units` even on the failure path.

The result is that this change doesn't catch another bug on the
following line, in the error case:

sched_free_domdata(old_ops, old_domdata);

At this point, old_ops is still the old ops, but old_domdata is the
*new* domdata.

A patch like the following (compile tested only) would fix it along
the lines of the original intent:
8<-------
diff --git a/xen/common/sched/core.c b/xen/common/sched/core.c
index eba0cea4bb..78f21839d3 100644
--- a/xen/common/sched/core.c
+++ b/xen/common/sched/core.c
@@ -720,6 +720,7 @@ int sched_move_domain(struct domain *d, struct cpupool =
*c)
         {
             old_units =3D new_units;
             old_domdata =3D domdata;
+            old_ops =3D c->sched;
             ret =3D -ENOMEM;
             goto out_free;
         }
@@ -809,10 +810,15 @@ int sched_move_domain(struct domain *d, struct cpupoo=
l *c)
     domain_unpause(d);

  out_free:
+    /*
+     * NB if we've jumped here, "old_units", "old_ops", and so on will
+     * actually be pointing to the new ops, since when aborting it's
+     * the new ops we want to free.
+     */
     for ( unit =3D old_units; unit; )
     {
         if ( unit->priv )
-            sched_free_udata(c->sched, unit->priv);
+            sched_free_udata(old_ops, unit->priv);
         old_unit =3D unit;
         unit =3D unit->next_in_list;
         xfree(old_unit);
---->8

But given that this kind of cleverness has already fooled two of our
most senior developers, I'd suggest making the whole thing more
explicit; something like the attached (again compile-tested only)?

 -George

--0000000000004e3dfe060baeb329
Content-Type: application/octet-stream; 
	name="0001-sched-clarify-and-correct-sched_move_domain-s-cleanu.patch"
Content-Disposition: attachment; 
	filename="0001-sched-clarify-and-correct-sched_move_domain-s-cleanu.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_lpqx5cnv0>
X-Attachment-Id: f_lpqx5cnv0

RnJvbSBhYjdlY2FlOTIxZDBmYTIxYmQyNTYxOTkwYzkxYWVkYTc5Mjc1Y2VmIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBHZW9yZ2UgRHVubGFwIDxnZW9yZ2UuZHVubGFwQGNsb3VkLmNv
bT4KRGF0ZTogTW9uLCA0IERlYyAyMDIzIDEyOjI1OjAzICswMDAwClN1YmplY3Q6IFtQQVRDSF0g
c2NoZWQ6IGNsYXJpZnkgYW5kIGNvcnJlY3Qgc2NoZWRfbW92ZV9kb21haW4oKSdzIGNsZWFudXAg
cGF0aApNSU1FLVZlcnNpb246IDEuMApDb250ZW50LVR5cGU6IHRleHQvcGxhaW47IGNoYXJzZXQ9
VVRGLTgKQ29udGVudC1UcmFuc2Zlci1FbmNvZGluZzogOGJpdAoKV2hpbGUgbW92aW5nIGEgZG9t
YWluLCBzY2hlZF9tb3ZlX2RvbWFpbiBmaXJzdCBtYWtlcyBwZXItc2NoZWR1bGVyCmFsbG9jYXRp
b25zIGZvciB0aGUgc2NoZWR1bGVyIG9mIHRoZSBuZXcgY3B1cG9vbCwgdGhlbiBkZWxldGVzIHRo
ZSBvbGQKb25lcy4gIEluIHRoZSBldmVudCBvZiBhbiBlcnJvciwgdGhlICpuZXcqIGFsbG9jYXRp
b25zIG11c3QgYmUgZnJlZWQKdmlhIHRoZSBuZXcgc2NoZWR1bGVyLgoKSW4gb3JkZXIgdG8gYXZv
aWQgY29kZSBkdXBsaWNhdGlvbiwgdGhlIGVycm9yIHBhdGggY29tbWFuZGVlcmVkIHRoZQpvbGRf
dW5pdHMgYW4gb2xkX2RvbWRhdGEgdmFyaWFibGVzIHRvIHBvaW50IHRoZW0gYXQgdGhlIG5ldyB1
bml0cywgc28KdGhhdCB0aGUgd2hpY2ggb24gdGhlIG5vbi1lcnJvciBwYXRoIGZyZWVkIHRoZSBv
bGQgdW5pdHMgd291bGQgbm93CmZyZWUgdGhlIG5ldyB1bml0cy4KClRoaXMgY29kZSwgaG93ZXZl
ciwgaGFkIHR3byBidWdzIGluIGl0LiAgRmlyc3QsIHdoZW4gbG9vcGluZyBvdmVyIHRoZQp1bml0
cywgaXQgYWx3YXlzIGZyZWVzIHVzaW5nICJjLT5zY2hlZCIgKHRoZSBuZXcgb3BzKTsgbWVhbmlu
ZyBvbiB0aGUKc3VjY2VzcyBwYXRoIHdlJ3JlIGZyZWVpbmcgdGhlIG9sZCBkb21kYXRhIHVzaW5n
IHRoZSBuZXcgc2NoZWR1bGVyLgpTZWNvbmRseSwgd2hlbiBmcmVlaW5nIHRoZSBkb21kYXRhLCBp
dCBhbHdheXMgZnJlZXMgdXNpbmcgb2xkX29wcywKbWVhbmluZyBvbiB0aGUgZmFpbHVyZSBwYXRo
IHdlJ3JlIGZyZWVpbmcgdGhlIG5ldyBkb21kYXRhIHVzaW5nIHRoZQpvbGQgc2NoZWR1bGVyLgoK
V2UgY291bGQgZm9sbG93IHN1aXQgd2l0aCB0aGUgZXhpc3RpbmcgY29kZSwgYW5kIG9uIHRoZSBl
cnJvciBwYXRoIHNldApvbGRfb3BzIHRvIGMtPnNjaGVkLCBhbmQgYWx3YXlzIHVzZSAib2xkX29w
cyIgaW4gdGhlIGZyZWVpbmcgY29kZS4KVGhpcyB3b3VsZCBzb2x2ZSBib3RoIHByb2JsZW1zLgoK
SG93ZXZlciwgZ2l2ZW4gdGhlIG51bWJlciBvZiBtaXN0YWtlcyBhbHJlYWR5IG1hZGUgaW4gdGhp
cyBjb2RlLCBpdApzZWVtcyBsaWtlIGEgYmV0dGVyIG9wdGlvbiBpcyB0byBtYWtlIGEgbmV3IHNl
dCBvZiBleHBsaWNpdGx5LW5hbWVkCiJmcmVlXyoiIHZhcmlhYmxlcyB0byB1c2UgZm9yIHRoaXMg
cHVycG9zZS4KCldoaWxlIGhlcmUsIHJlbmFtZSAiZG9tZGF0YSIgdG8gIm5ld19kb21kYXRhIiwg
aW4gbGluZSB3aXRoCiJuZXdfdW5pdHMiLCBmb3IgY2xhcml0eS4KClJlcG9ydGVkLWJ5OiBSZW7D
qSBXaW50aGVyIEjDuGpnYWFyZCA8cmVuZXdpbkBwcm90b24ubWU+CkluaXRpYWwtZml4LWJ5OiBK
YW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+ClNpZ25lZC1vZmYtYnk6IEdlb3JnZSBEdW5s
YXAgPGdlb3JnZS5kdW5sYXBAY2xvdWQuY29tPgotLS0KIHhlbi9jb21tb24vc2NoZWQvY29yZS5j
IHwgMzQgKysrKysrKysrKysrKysrKysrKystLS0tLS0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQs
IDIwIGluc2VydGlvbnMoKyksIDE0IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3hlbi9jb21t
b24vc2NoZWQvY29yZS5jIGIveGVuL2NvbW1vbi9zY2hlZC9jb3JlLmMKaW5kZXggZWJhMGNlYTRi
Yi4uYjRkMDc4NTkwMyAxMDA2NDQKLS0tIGEveGVuL2NvbW1vbi9zY2hlZC9jb3JlLmMKKysrIGIv
eGVuL2NvbW1vbi9zY2hlZC9jb3JlLmMKQEAgLTY3OCwxMiArNjc4LDExIEBAIGludCBzY2hlZF9t
b3ZlX2RvbWFpbihzdHJ1Y3QgZG9tYWluICpkLCBzdHJ1Y3QgY3B1cG9vbCAqYykKIHsKICAgICBz
dHJ1Y3QgdmNwdSAqdjsKICAgICBzdHJ1Y3Qgc2NoZWRfdW5pdCAqdW5pdCwgKm9sZF91bml0Owot
ICAgIHN0cnVjdCBzY2hlZF91bml0ICpuZXdfdW5pdHMgPSBOVUxMLCAqb2xkX3VuaXRzOworICAg
IHN0cnVjdCBzY2hlZF91bml0ICpuZXdfdW5pdHMgPSBOVUxMLCAqb2xkX3VuaXRzLCAqZnJlZV91
bml0czsKICAgICBzdHJ1Y3Qgc2NoZWRfdW5pdCAqKnVuaXRfcHRyID0gJm5ld191bml0czsKICAg
ICB1bnNpZ25lZCBpbnQgbmV3X3AsIHVuaXRfaWR4OwotICAgIHZvaWQgKmRvbWRhdGE7Ci0gICAg
c3RydWN0IHNjaGVkdWxlciAqb2xkX29wcyA9IGRvbV9zY2hlZHVsZXIoZCk7Ci0gICAgdm9pZCAq
b2xkX2RvbWRhdGE7CisgICAgc3RydWN0IHNjaGVkdWxlciAqb2xkX29wcyA9IGRvbV9zY2hlZHVs
ZXIoZCksICpmcmVlX29wczsKKyAgICB2b2lkICpuZXdfZG9tZGF0YSwgKm9sZF9kb21kYXRhLCAq
ZnJlZV9kb21kYXRhOwogICAgIHVuc2lnbmVkIGludCBncmFuID0gY3B1cG9vbF9nZXRfZ3JhbnVs
YXJpdHkoYyk7CiAgICAgdW5zaWduZWQgaW50IG5fdW5pdHMgPSBkLT52Y3B1WzBdID8gRElWX1JP
VU5EX1VQKGQtPm1heF92Y3B1cywgZ3JhbikgOiAwOwogICAgIGludCByZXQgPSAwOwpAQCAtNjk2
LDEwICs2OTUsMTAgQEAgaW50IHNjaGVkX21vdmVfZG9tYWluKHN0cnVjdCBkb21haW4gKmQsIHN0
cnVjdCBjcHVwb29sICpjKQogCiAgICAgcmN1X3JlYWRfbG9jaygmc2NoZWRfcmVzX3JjdWxvY2sp
OwogCi0gICAgZG9tZGF0YSA9IHNjaGVkX2FsbG9jX2RvbWRhdGEoYy0+c2NoZWQsIGQpOwotICAg
IGlmICggSVNfRVJSKGRvbWRhdGEpICkKKyAgICBuZXdfZG9tZGF0YSA9IHNjaGVkX2FsbG9jX2Rv
bWRhdGEoYy0+c2NoZWQsIGQpOworICAgIGlmICggSVNfRVJSKG5ld19kb21kYXRhKSApCiAgICAg
ewotICAgICAgICByZXQgPSBQVFJfRVJSKGRvbWRhdGEpOworICAgICAgICByZXQgPSBQVFJfRVJS
KG5ld19kb21kYXRhKTsKICAgICAgICAgZ290byBvdXQ7CiAgICAgfQogCkBAIC03MTIsMTQgKzcx
MSwxNiBAQCBpbnQgc2NoZWRfbW92ZV9kb21haW4oc3RydWN0IGRvbWFpbiAqZCwgc3RydWN0IGNw
dXBvb2wgKmMpCiAgICAgICAgICAgICB1bml0LT5kb21haW4gPSBkOwogICAgICAgICAgICAgdW5p
dC0+dW5pdF9pZCA9IHVuaXRfaWR4ICogZ3JhbjsKICAgICAgICAgICAgIHVuaXQtPnZjcHVfbGlz
dCA9IGQtPnZjcHVbdW5pdC0+dW5pdF9pZF07Ci0gICAgICAgICAgICB1bml0LT5wcml2ID0gc2No
ZWRfYWxsb2NfdWRhdGEoYy0+c2NoZWQsIHVuaXQsIGRvbWRhdGEpOworICAgICAgICAgICAgdW5p
dC0+cHJpdiA9IHNjaGVkX2FsbG9jX3VkYXRhKGMtPnNjaGVkLCB1bml0LCBuZXdfZG9tZGF0YSk7
CiAgICAgICAgICAgICAqdW5pdF9wdHIgPSB1bml0OwogICAgICAgICB9CiAKICAgICAgICAgaWYg
KCAhdW5pdCB8fCAhdW5pdC0+cHJpdiApCiAgICAgICAgIHsKLSAgICAgICAgICAgIG9sZF91bml0
cyA9IG5ld191bml0czsKLSAgICAgICAgICAgIG9sZF9kb21kYXRhID0gZG9tZGF0YTsKKyAgICAg
ICAgICAgIC8qIEZhaWx1cmUgcGF0aCBmcmVlcyB0aGUgbmV3IHVuaXRzL2RvbWRhdGEgZnJvbSB0
aGUgbmV3IG9wcyAqLworICAgICAgICAgICAgZnJlZV91bml0cyA9IG5ld191bml0czsKKyAgICAg
ICAgICAgIGZyZWVfZG9tZGF0YSA9IG5ld19kb21kYXRhOworICAgICAgICAgICAgZnJlZV9vcHMg
PSBjLT5zY2hlZDsKICAgICAgICAgICAgIHJldCA9IC1FTk9NRU07CiAgICAgICAgICAgICBnb3Rv
IG91dF9mcmVlOwogICAgICAgICB9CkBAIC03NTEsNyArNzUyLDcgQEAgaW50IHNjaGVkX21vdmVf
ZG9tYWluKHN0cnVjdCBkb21haW4gKmQsIHN0cnVjdCBjcHVwb29sICpjKQogICAgIG9sZF91bml0
cyA9IGQtPnNjaGVkX3VuaXRfbGlzdDsKIAogICAgIGQtPmNwdXBvb2wgPSBjOwotICAgIGQtPnNj
aGVkX3ByaXYgPSBkb21kYXRhOworICAgIGQtPnNjaGVkX3ByaXYgPSBuZXdfZG9tZGF0YTsKIAog
ICAgIHVuaXQgPSBuZXdfdW5pdHM7CiAgICAgZm9yX2VhY2hfdmNwdSAoIGQsIHYgKQpAQCAtODA4
LDE3ICs4MDksMjIgQEAgaW50IHNjaGVkX21vdmVfZG9tYWluKHN0cnVjdCBkb21haW4gKmQsIHN0
cnVjdCBjcHVwb29sICpjKQogCiAgICAgZG9tYWluX3VucGF1c2UoZCk7CiAKKyAgICAvKiBTdWNj
ZXNzIHBhdGggZnJlZXMgdGhlIG9sZCB1bml0cy9kb21kYXRhIGZyb20gdGhlIG9sZCBvcHMgKi8K
KyAgICBmcmVlX29wcyA9IG9sZF9vcHM7CisgICAgZnJlZV91bml0cyA9IG9sZF91bml0czsKKyAg
ICBmcmVlX2RvbWRhdGEgPSBvbGRfZG9tZGF0YTsKKwogIG91dF9mcmVlOgotICAgIGZvciAoIHVu
aXQgPSBvbGRfdW5pdHM7IHVuaXQ7ICkKKyAgICBmb3IgKCB1bml0ID0gZnJlZV91bml0czsgdW5p
dDsgKQogICAgIHsKICAgICAgICAgaWYgKCB1bml0LT5wcml2ICkKLSAgICAgICAgICAgIHNjaGVk
X2ZyZWVfdWRhdGEoYy0+c2NoZWQsIHVuaXQtPnByaXYpOworICAgICAgICAgICAgc2NoZWRfZnJl
ZV91ZGF0YShmcmVlX29wcywgdW5pdC0+cHJpdik7CiAgICAgICAgIG9sZF91bml0ID0gdW5pdDsK
ICAgICAgICAgdW5pdCA9IHVuaXQtPm5leHRfaW5fbGlzdDsKICAgICAgICAgeGZyZWUob2xkX3Vu
aXQpOwogICAgIH0KIAotICAgIHNjaGVkX2ZyZWVfZG9tZGF0YShvbGRfb3BzLCBvbGRfZG9tZGF0
YSk7CisgICAgc2NoZWRfZnJlZV9kb21kYXRhKGZyZWVfb3BzLCBmcmVlX2RvbWRhdGEpOwogCiAg
b3V0OgogICAgIHJjdV9yZWFkX3VubG9jaygmc2NoZWRfcmVzX3JjdWxvY2spOwotLSAKMi4yNS4x
Cgo=
--0000000000004e3dfe060baeb329--

