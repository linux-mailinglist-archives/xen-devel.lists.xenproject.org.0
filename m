Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 62F81321F69
	for <lists+xen-devel@lfdr.de>; Mon, 22 Feb 2021 19:54:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.88348.166077 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lEGKU-0006XN-BK; Mon, 22 Feb 2021 18:53:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 88348.166077; Mon, 22 Feb 2021 18:53:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lEGKU-0006X1-7x; Mon, 22 Feb 2021 18:53:10 +0000
Received: by outflank-mailman (input) for mailman id 88348;
 Mon, 22 Feb 2021 18:53:09 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oys7=HY=gmail.com=kevinnegy@srs-us1.protection.inumbo.net>)
 id 1lEGKT-0006Ww-At
 for xen-devel@lists.xenproject.org; Mon, 22 Feb 2021 18:53:09 +0000
Received: from mail-oi1-x233.google.com (unknown [2607:f8b0:4864:20::233])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0d77ed82-a3aa-4b5b-9e2f-e3ad4407d926;
 Mon, 22 Feb 2021 18:53:08 +0000 (UTC)
Received: by mail-oi1-x233.google.com with SMTP id f3so15004157oiw.13
 for <xen-devel@lists.xenproject.org>; Mon, 22 Feb 2021 10:53:08 -0800 (PST)
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
X-Inumbo-ID: 0d77ed82-a3aa-4b5b-9e2f-e3ad4407d926
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=f1puqYGuQ0MULhYXk50f1Ja3v9r3HCUU4QrM/Mkm1gI=;
        b=f7q9AE0VqTXmXXz461I2PttTbNs3JNA/Jf4uQEHRhhjx0fZq23GF1nOT4PySEM81Bh
         1JHgqnw8x9Jzrr6aThel9//jFsTG+KgJEGeuIg9wCYE83pgi0fP1ca1zh5uaMmbMnTZW
         M1CcgQP5Ls+b5h1DxH03SIeJPOFjfkGRa7HMx3JaNujHs9WSk5lIPOYwaHUBIjT9wjrH
         heXpSV5fnwGk8jt/iiea2fKNdePWCF3EmPCGmgUIaBTalmNErgqF6vY4oWtwa5y/j1Cx
         KtTtCK0qWKI6IIai1Te7n3HEPjJxHTR9u5vOG6/UIgO8e3WBRRJy3oVkbr20V1stMzHo
         ojFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=f1puqYGuQ0MULhYXk50f1Ja3v9r3HCUU4QrM/Mkm1gI=;
        b=sIk2kFRyJJcXujUWC7ZObbjV5OQQ5TDpN0KI+KDmYF0ADf6eAszkP4y9b9GAvRWfj1
         dXYXYyMwvc+l7FOw6yeAgIvjafrj7vcOiHqaEgdiKfaq3pYvuYjnGR6l0KM4DhmNxoul
         0rB2G24hcfaES7DYFGzWo68ZtLsyS3lDgqNRxxgURZcaP34Jl7j+yUx74+hN6ltkH5xC
         lLRqz89+8BOMExxsAGCEa1H0Xv8FpU0xtuguZj1vKoiQSdCtT74uXsuYIVk6IHhGETvU
         rSXjiskKr/UXvnpixHesabNZYrE7SOnykmGWkHGgQygX1kXDBsIFhNd3bpbvfvYbS1po
         VLnQ==
X-Gm-Message-State: AOAM531ZQunZ1kNy9AKlsZU6iMvUwCxOYFOIEWEtK12kjqqO4Evh9sbP
	CX1jQTcfWkMmXDE854eGomNSDuR7ixFKvGXhsWIv9aioKTNZ
X-Google-Smtp-Source: ABdhPJwZWWWvlTzS20caJnqhNysg3K9xiCXBWFkYWpvpdOUsDn5312T+Xf+kHOa0kIr+OoLW4JkEtDT1h2AK+fpyx+U=
X-Received: by 2002:aca:5954:: with SMTP id n81mr16469325oib.25.1614019987627;
 Mon, 22 Feb 2021 10:53:07 -0800 (PST)
MIME-Version: 1.0
References: <CACZWC-qK_biKgyi+ZiXnsHRscAbK9pz=kncdBA25QYWY129HCQ@mail.gmail.com>
 <38cf0d39-da1d-5375-89dc-1668e26323a2@citrix.com>
In-Reply-To: <38cf0d39-da1d-5375-89dc-1668e26323a2@citrix.com>
From: Kevin Negy <kevinnegy@gmail.com>
Date: Mon, 22 Feb 2021 13:52:31 -0500
Message-ID: <CACZWC-r7fS2AztaAgGdVPv5NcJiAxZ5mvC4FQTkorPDGwOfn9g@mail.gmail.com>
Subject: Re: How does shadow page table work during migration?
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org
Content-Type: multipart/alternative; boundary="00000000000005e3f605bbf150f0"

--00000000000005e3f605bbf150f0
Content-Type: text/plain; charset="UTF-8"

Hello again,

Thank you for the helpful responses. I have several follow up questions.

1)

> With Shadow, Xen has to do the combination of address spaces itself -
> the shadow pagetables map guest virtual to host physical address.


The shadow_blow_tables() call is "please recycle everything" which is used
> to throw away all shadow pagetables, which in turn will cause the
> shadows to be recreated from scratch as the guest continues to run.


With shadowing enabled, given a guest virtual address, how does the
hypervisor recreate the mapping to the host physical address (mfn) from the
virtual address if the shadow page tables are empty (after a call to
shadow_blow_tables, for instance)? I had been thinking of shadow page
tables as the definitive mapping between guest pages and machine pages, but
should I think of them as more of a TLB, which implies there's another way
to get/recreate the mappings if there's no entry in the shadow table?


2) I'm trying to grasp the general steps of enabling shadowing and handling
page faults. Is this correct?
    a) Normal PV - default shadowing is disabled, guest has its page tables
in r/w mode or whatever mode is considered normal for guest page tables
    b) Shadowing is enabled - shadow memory pool allocated, all memory
accesses must now go through shadow pages in CR3. Since no entries are in
shadow tables, initial read and writes from the guest will result in page
faults.
    c) As soon as the first guest memory access occurs, a mandatory page
fault occurs because there is no mapping in the shadows. Xen does a guest
page table walk for the address that caused the fault (va) and then marks
all the guest page table pages along the walk as read only.
    d) Xen finds out the mfn of the guest va somehow (my first question)
and adds the mapping of the va to the shadow page table.
    e) If the page fault was a write, the va is now marked as read/write
but logged as dirty in the logdirty map.
    e) Now the next page fault to any of the page tables marked read-only
in c) must have been caused by the guest writing to its tables, which can
be reflected in the shadow page tables.


3) How do Xen/shadow page tables distinguish between two equivalent guest
virtual addresses from different guest processes? I suppose when a guest OS
tries to change page tables from one process to another, this will cause a
page fault that Xen will trap and be able to infer that the current shadow
page table should be swapped to a different one corresponding to the new
guest process?

Thank you so much,
Kevin

--00000000000005e3f605bbf150f0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hello again,<br><br>Thank you for the hel=
pful responses. I have several follow up questions. <br><br>1) <br><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px=
 solid rgb(204,204,204);padding-left:1ex">With Shadow, Xen has to do the co=
mbination of address spaces itself -<br>
the shadow pagetables map guest virtual to host physical address.</blockquo=
te><div><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">The sha=
dow_blow_tables() call is &quot;please recycle everything&quot; which is us=
ed<br>
to throw away all shadow pagetables, which in turn will cause the<br>shadow=
s to be recreated from scratch as the guest continues to run.=C2=A0</blockq=
uote><br>With shadowing enabled, given a guest virtual address, how does th=
e hypervisor recreate the mapping to the host physical address (mfn) from t=
he virtual address if the shadow page tables are empty (after a call to sha=
dow_blow_tables, for instance)? I had been thinking of shadow page tables a=
s the definitive mapping between guest pages and machine pages, but should =
I think of them as more of a TLB, which implies there&#39;s another way to =
get/recreate the mappings if there&#39;s no entry in the shadow table?</div=
><div dir=3D"ltr"><br><br>2) I&#39;m trying to grasp the general steps of e=
nabling shadowing and handling page faults. Is this correct?<br>=C2=A0 =C2=
=A0 a) Normal PV - default shadowing is disabled, guest has its page tables=
 in r/w mode or whatever mode is considered normal for guest page tables<br=
>=C2=A0 =C2=A0 b) Shadowing is enabled - shadow memory pool allocated, all =
memory accesses must now go through shadow pages in CR3. Since no entries a=
re in shadow tables, initial read and writes from the guest will result in =
page faults.<br>=C2=A0 =C2=A0 c) As soon as the first guest memory access o=
ccurs, a mandatory page fault occurs because there is no mapping in the sha=
dows. Xen does a guest page table walk for the address that caused the faul=
t (va) and then marks all the guest page table pages along the walk as read=
 only. <br>=C2=A0 =C2=A0 d) Xen finds out the mfn of the guest va somehow (=
my first question) and adds the mapping of the va to the shadow page table.=
 <br>=C2=A0 =C2=A0 e) If the page fault was a write, the va is now marked a=
s read/write but logged as dirty in the logdirty map.<br>=C2=A0 =C2=A0 e) N=
ow the next page fault to any of the page tables marked read-only in c) mus=
t have been caused by the guest writing to its tables, which can be reflect=
ed in the shadow page tables.<br>=C2=A0 =C2=A0 <br><br>3) How do Xen/shadow=
 page tables distinguish between two equivalent guest virtual addresses fro=
m different guest processes? I suppose when a guest OS tries to change page=
 tables from one process to another, this will cause a page fault that Xen =
will trap and be able to infer that the current shadow page table should be=
 swapped to a different one corresponding to the new guest process?<br></di=
v><div dir=3D"ltr"><br></div><div>Thank you so much,</div><div>Kevin</div><=
br></div>

--00000000000005e3f605bbf150f0--

