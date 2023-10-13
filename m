Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 08DBF7C82DB
	for <lists+xen-devel@lfdr.de>; Fri, 13 Oct 2023 12:16:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.616393.958365 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qrFDV-0005mJ-IY; Fri, 13 Oct 2023 10:16:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 616393.958365; Fri, 13 Oct 2023 10:16:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qrFDV-0005jO-FN; Fri, 13 Oct 2023 10:16:25 +0000
Received: by outflank-mailman (input) for mailman id 616393;
 Fri, 13 Oct 2023 10:16:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=36VQ=F3=cloud.com=george.dunlap@srs-se1.protection.inumbo.net>)
 id 1qrFDT-0005j6-Vk
 for xen-devel@lists.xenproject.org; Fri, 13 Oct 2023 10:16:24 +0000
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [2a00:1450:4864:20::22b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8f331551-69b1-11ee-98d4-6d05b1d4d9a1;
 Fri, 13 Oct 2023 12:16:22 +0200 (CEST)
Received: by mail-lj1-x22b.google.com with SMTP id
 38308e7fff4ca-2c50305c5c4so12627081fa.1
 for <xen-devel@lists.xenproject.org>; Fri, 13 Oct 2023 03:16:22 -0700 (PDT)
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
X-Inumbo-ID: 8f331551-69b1-11ee-98d4-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1697192182; x=1697796982; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=VL/OWh/DzPzw/Gw1t3arje36iohI3iQRyvwNcUDAQHA=;
        b=CwzUvwVMKub1/wOycuce1Fq/rX7fm/F+VjHk9nJwj2do7CH1Wc2sLxC/j9i4M9B6C2
         f2R5kYA/xKA0tFYZP+8L97tStkC2I5d8bkYvewKal7pTLPYu45/JAoSsNa8qA9ZadmTq
         CeHrE6CoV5KvY8o7vxek18LO97yobE4kiQ3aY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697192182; x=1697796982;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VL/OWh/DzPzw/Gw1t3arje36iohI3iQRyvwNcUDAQHA=;
        b=gWBPG2KRwL/p5tgKoJlRCHBcDKuGPBZuXCcDNBid0EEsoovwrcF9r+TciWpXnRikIa
         9RoPzUiwJ+49ygJjeTmA8prNmwVgR8Rpt13nawvtaI4+drRx2vZvKU8vOVOCZdu3Ezwj
         BpY3QhBVsmwQyOL0YpZIy1iGfGetXX+otPQjH6UsHuEJhYIsMMQWa1OrSto1qlH7IDdQ
         g14NUUerICYZ5LGHkB7j0l7i0idghudMSHOOvYhZIH6dWIZhTCyqz8UA/tZwFueiCsap
         XqStnRzRuO8009Q0BSFhRcdfGxki6mC2dwOyBpvmMW/sMkHL+6YR+8/WQi7Lqn01y0gM
         Q74w==
X-Gm-Message-State: AOJu0Ywpu1foxj0iDb7H51C0h3uunXv//Ce8L9MC+rI90BAq+KYD9TjS
	eR4Yh7Xzby+MH681COLurFRruBJXKUMXsd7xIUqynQ==
X-Google-Smtp-Source: AGHT+IHsngRznFlRb2agXcaKE4TcpzCxP+Ks4r3/EOTXacORCngfCZTfibpuyyUycgsuU526Z4YNbHKnvx2dtxTlSCU=
X-Received: by 2002:a2e:b893:0:b0:2c5:634:b45e with SMTP id
 r19-20020a2eb893000000b002c50634b45emr1397197ljp.36.1697192182279; Fri, 13
 Oct 2023 03:16:22 -0700 (PDT)
MIME-Version: 1.0
References: <AS8PR08MB7991D1099E32CC9F03B0E0F692FCA@AS8PR08MB7991.eurprd08.prod.outlook.com>
 <alpine.DEB.2.22.394.2309271603590.1403502@ubuntu-linux-20-04-desktop>
 <a31ce6cb-6234-5e7f-5cd4-ed190f029811@citrix.com> <alpine.DEB.2.22.394.2309271658500.1403502@ubuntu-linux-20-04-desktop>
 <CA+zSX=ZbeUFrfAUJShooJFJ+d89f4xdXfJJ9HoJKRh4UStkTFQ@mail.gmail.com> <alpine.DEB.2.22.394.2310121535580.3431292@ubuntu-linux-20-04-desktop>
In-Reply-To: <alpine.DEB.2.22.394.2310121535580.3431292@ubuntu-linux-20-04-desktop>
From: George Dunlap <george.dunlap@cloud.com>
Date: Fri, 13 Oct 2023 11:16:11 +0100
Message-ID: <CA+zSX=Y5dMVFM6dVNgBRHxKc0C1e5WGgweQ0FaXXCfAFGH1aPA@mail.gmail.com>
Subject: Re: Xen 4.18 release: Reminder about code freeze
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Henry Wang <Henry.Wang@arm.com>, 
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Julien Grall <julien@xen.org>, 
	Bertrand Marquis <Bertrand.Marquis@arm.com>, Jan Beulich <jbeulich@suse.com>, 
	"jgross@suse.com" <jgross@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Anthony PERARD <anthony.perard@citrix.com>, 
	"community.manager@xenproject.org" <community.manager@xenproject.org>
Content-Type: multipart/mixed; boundary="0000000000002423b3060796591a"

--0000000000002423b3060796591a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 12, 2023 at 11:36=E2=80=AFPM Stefano Stabellini
<sstabellini@kernel.org> wrote:
>
> On Thu, 12 Oct 2023, George Dunlap wrote:
> > > > Stop tinkering in the hope that it hides the problem.  You're only
> > > > making it harder to fix properly.
> > >
> > > Making it harder to fix properly would be a valid reason not to commi=
t
> > > the (maybe partial) fix. But looking at the fix again:
> > >
> > > diff --git a/tools/xenstored/domain.c b/tools/xenstored/domain.c
> > > index a6cd199fdc..9cd6678015 100644
> > > --- a/tools/xenstored/domain.c
> > > +++ b/tools/xenstored/domain.c
> > > @@ -989,6 +989,7 @@ static struct domain *introduce_domain(const void=
 *ctx,
> > >                 talloc_steal(domain->conn, domain);
> > >
> > >                 if (!restore) {
> > > +                       domain_conn_reset(domain);
> > >                         /* Notify the domain that xenstore is availab=
le */
> > >                         interface->connection =3D XENSTORE_CONNECTED;
> > >                         xenevtchn_notify(xce_handle, domain->port);
> > > @@ -1031,8 +1032,6 @@ int do_introduce(const void *ctx, struct connec=
tion *conn,
> > >         if (!domain)
> > >                 return errno;
> > >
> > > -       domain_conn_reset(domain);
> > > -
> > >         send_ack(conn, XS_INTRODUCE);
> > >
> > > It is a 1-line movement. Textually small. Easy to understand and to
> > > revert. It doesn't seem to be making things harder to fix? We could
> > > revert it any time if a better fix is offered.
> > >
> > > Maybe we could have a XXX note in the commit message or in-code
> > > comment?
> >
> > It moves a line from one function (do_domain_introduce()) into a
> > completely different function (introduce_domain()), nested inside two
> > if() statements; with no analysis on how the change will impact
> > things.
>
> I am not the original author of the patch, and I am not the maintainer
> of the code, so I don't feel I have the qualifications to give you the
> answers you are seeking. Julien as author of the patch and xenstore
> reviewer might be in a better position to answer. Or Juergen as xenstore
> maintainer.

I understand that; my main point is that the change is more complex
than you're characterizing it.  This is information necessary to
understand whether the patch is correct, but it's not in the patch
description, nor in the subsequent thread back in May.

> > Are there any paths through do_domain_introduce() that now *won't* get
> > a domain_conn_reset() call?  Is that OK?
>
> Yes, the already-introduced and the restore code paths. The operations in
> the already-introduced or the restore code paths seem simple enough not
> to require a domain_conn_reset. Julien and Juergen should confirm.

There is no "restore" codepath through do_domain_introduce(); it
passes "false" for the "restore" argument.  So we  only have two paths
to consider through do_domain_introduce(): The "not introduced and not
restoring" path, and the "already-introduced" path.

I'm not sure what the "simple" elements on the branch in
introduce_domain() have to do with whether the content of the page
needs to be cleaned up.  As I said, I don't 100% understand this code,
but it seems like if anything, the reset would be *more* important to
have in the "reintroduce" case than in the "initial introduction"
case, since I'd expect the "initial introduction" case to be empty
already.

> Doesn't it seem weird to you that we set a connection to CONNECTED,
> notify the domain that it is ready to go, and only *after* that we reset
> the connection to zero?
>
> What happens if a domain starts using the connection as soon as it
> receives the event channel notification and before domain_conn_reset is
> called?

Yes, it does seem weird, which is why I said the following. :-)

> > I mean, it certainly seems strange to set the state to CONNECTED, send
> > off an event channel, and then after that delete all watches /
> > transactions / buffered data and so on;

But just because the current code is probably wrong, doesn't mean that
the modified code is probably correct.

If the problem is the delay between the xenevtchn_notify() in
introduce_domain() and the domain_conn_reset() afterwards in
do_domain(), would it make sense instead to move the notification into
do_introduce(), after the domain_conn_reset()?  It is, after all, in
response to XS_INTRODUCE that we want to send the notification, not in
dom0_init() or read_state_connection() (which seems to be more about
restoring a domain).

What about something like the attached? (NB not even compile tested)

 -George

--0000000000002423b3060796591a
Content-Type: application/octet-stream; 
	name="0001-cxenstored-Wait-until-after-reset-to-notify-dom0less.patch"
Content-Disposition: attachment; 
	filename="0001-cxenstored-Wait-until-after-reset-to-notify-dom0less.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_lnoge6k40>
X-Attachment-Id: f_lnoge6k40

RnJvbSBkNmE2NDg4MmEwNmMzNjRlZjE3YjU0YjI1OTAwN2U1YjA3ZDRkN2YwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBHZW9yZ2UgRHVubGFwIDxnZW9yZ2UuZHVubGFwQGNsb3VkLmNv
bT4KRGF0ZTogRnJpLCAxMyBPY3QgMjAyMyAxMDo1NTo1MyArMDEwMApTdWJqZWN0OiBbUEFUQ0hd
IGN4ZW5zdG9yZWQ6IFdhaXQgdW50aWwgYWZ0ZXIgcmVzZXQgdG8gbm90aWZ5IGRvbTBsZXNzIGRv
bWFpbnMKCkNvbW1pdCBmYzJiNTdjOWEgKCJ4ZW5zdG9yZWQ6IHNlbmQgYW4gZXZ0Y2huIG5vdGlm
aWNhdGlvbiBvbgppbnRyb2R1Y2VfZG9tYWluIikgaW50cm9kdWNlZCB0aGUgc2VuZGluZyBvZiBh
biBldmVudCBjaGFubmVsIHRvIHRoZQpndWVzdCB3aGVuIGZpcnN0IGludHJvZHVjZWQsIHNvIHRo
YXQgZG9tMGxlc3MgZG9tYWlucyB3YWl0aW5nIGZvciB0aGUKY29ubmVjdGlvbiB3b3VsZCBrbm93
IHRoYXQgeGVuc3RvcmUgd2FzIHJlYWR5IHRvIHVzZS4KClVuZm9ydHVuYXRlbHksIGl0IHdhcyBp
bnRyb2R1Y2VkIGluIGludHJvZHVjZV9kb21haW4oKSwgd2hpY2ggMSkgaXMKY2FsbGVkIGJ5IG90
aGVyIGZ1bmN0aW9ucywgd2hlcmUgc3VjaCBmdW5jdGlvbmFsaXR5IGlzIHVubmVlZGVkLCBhbmQK
MikgYWZ0ZXIgdGhlIG1haW4gWFNfSU5UUk9EVUNFIGNhbGwsIGNhbGxzIGRvbWFpbl9jb25uX3Jl
c2V0KCkuICBUaGlzCmludHJvZHVjZXMgYSByYWNlIGNvbmRpdGlvbiwgd2hlcmVieSBpZiB4ZW5z
dG9yZWQgaXMgZGVsYXllZCwgYSBkb21haW4KY2FuIHdha2UgdXAsIHNlbmQgbWVzc2FnZXMgdG8g
dGhlIGJ1ZmZlciwgb25seSB0byBoYXZlIHRoZW0gZGVsZXRlZCBieQp4ZW5zdG9yZSBiZWZvcmUg
ZmluaXNoaW5nIGl0cyBwcm9jZXNzaW5nIG9mIHRoZSBYU19JTlRST0RVQ0UgbWVzc2FnZS4KCk1v
dmUgdGhlIGNvbm5lY3QtYW5kLW5vdGZ5IGNhbGwgaW50byBkb19pbnRyb2R1Y2UoKSBpbnN0ZWFk
LCBhZnRlciB0aGUKZG9tYWluX2Nvbm5fcmVzdCgpOyBwcmVkaWNhdGVkIG9uIHRoZSBzdGF0ZSBi
ZWluZyBpbiB0aGUKWEVOU1RPUkVfUkVDT05ORUNUIHN0YXRlLgoKKFdlIGRvbid0IG5lZWQgdG8g
Y2hlY2sgZm9yICJyZXN0b3JpbmciLCBzaW5jZSB0aGF0IHZhbHVlIGlzIGFsd2F5cwpwYXNzZWQg
YXMgImZhbHNlIiBmcm9tIGRvX2RvbWFpbl9pbnRyb2R1Y2UoKSkuCgpTaWduZWQtb2ZmLWJ5OiBH
ZW9yZ2UgRHVubGFwIDxnZW9yZ2UuZHVubGFwQGNsb3VkLmNvbT4KLS0tCkknbSBub3QgZmFtaWxp
YXIgd2l0aCB0aGlzIGNvZGUsIHNvIHRoaXMgY29tbWl0IG1lc3NhZ2UgaGFzIGJlZW4Kd3JpdHRl
biB1c2luZyB0aGUgInRoZSBmYXN0ZXN0IHdheSB0byBnZXQgdGhlIHJpZ2h0IGFuc3dlciBpcyB0
byBwb3N0CnRoZSB3cm9uZyBhbnN3ZXIiIG1ldGhvZC4gIElmIHlvdSBrbm93IHhlbnN0b3JlZCAm
IHRoZSBwcm90b2NvbCwKcGxlYXNlIHJldmlldyBpZiBjYXJlZnVsbHkgZm9yIGFjY3VyYWN5Lgot
LS0KIHRvb2xzL3hlbnN0b3JlZC9kb21haW4uYyB8IDEyICsrKysrKy0tLS0tLQogMSBmaWxlIGNo
YW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS90b29s
cy94ZW5zdG9yZWQvZG9tYWluLmMgYi90b29scy94ZW5zdG9yZWQvZG9tYWluLmMKaW5kZXggYTZj
ZDE5OWZkYy4uYWRkYzM0ZjVmOCAxMDA2NDQKLS0tIGEvdG9vbHMveGVuc3RvcmVkL2RvbWFpbi5j
CisrKyBiL3Rvb2xzL3hlbnN0b3JlZC9kb21haW4uYwpAQCAtOTg4LDEyICs5ODgsNiBAQCBzdGF0
aWMgc3RydWN0IGRvbWFpbiAqaW50cm9kdWNlX2RvbWFpbihjb25zdCB2b2lkICpjdHgsCiAJCS8q
IE5vdyBkb21haW4gYmVsb25ncyB0byBpdHMgY29ubmVjdGlvbi4gKi8KIAkJdGFsbG9jX3N0ZWFs
KGRvbWFpbi0+Y29ubiwgZG9tYWluKTsKIAotCQlpZiAoIXJlc3RvcmUpIHsKLQkJCS8qIE5vdGlm
eSB0aGUgZG9tYWluIHRoYXQgeGVuc3RvcmUgaXMgYXZhaWxhYmxlICovCi0JCQlpbnRlcmZhY2Ut
PmNvbm5lY3Rpb24gPSBYRU5TVE9SRV9DT05ORUNURUQ7Ci0JCQl4ZW5ldnRjaG5fbm90aWZ5KHhj
ZV9oYW5kbGUsIGRvbWFpbi0+cG9ydCk7Ci0JCX0KLQogCQlpZiAoIWlzX21hc3Rlcl9kb21haW4g
JiYgIXJlc3RvcmUpCiAJCQlmaXJlX3NwZWNpYWxfd2F0Y2hlcygiQGludHJvZHVjZURvbWFpbiIp
OwogCX0gZWxzZSB7CkBAIC0xMDMzLDYgKzEwMjcsMTIgQEAgaW50IGRvX2ludHJvZHVjZShjb25z
dCB2b2lkICpjdHgsIHN0cnVjdCBjb25uZWN0aW9uICpjb25uLAogCiAJZG9tYWluX2Nvbm5fcmVz
ZXQoZG9tYWluKTsKIAorCWlmIChpbnRlcmZhY2UtPmNvbm5lY3Rpb24gPT0gWEVOU1RPUkVfUkVD
T05ORUNUKSB7CisJCS8qIE5vdGlmeSB0aGUgZG9tYWluIHRoYXQgeGVuc3RvcmUgaXMgYXZhaWxh
YmxlICovCisJCWludGVyZmFjZS0+Y29ubmVjdGlvbiA9IFhFTlNUT1JFX0NPTk5FQ1RFRDsKKwkJ
eGVuZXZ0Y2huX25vdGlmeSh4Y2VfaGFuZGxlLCBkb21haW4tPnBvcnQpOworCX0KKwogCXNlbmRf
YWNrKGNvbm4sIFhTX0lOVFJPRFVDRSk7CiAKIAlyZXR1cm4gMDsKLS0gCjIuNDIuMAoK
--0000000000002423b3060796591a--

