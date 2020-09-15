Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 969DD26A29A
	for <lists+xen-devel@lfdr.de>; Tue, 15 Sep 2020 11:58:26 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kI7iC-0006T0-Vu; Tue, 15 Sep 2020 09:57:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ix3r=CY=trmm.net=hudson@srs-us1.protection.inumbo.net>)
 id 1kI7iB-0006Sv-8s
 for xen-devel@lists.xenproject.org; Tue, 15 Sep 2020 09:57:19 +0000
X-Inumbo-ID: a85c2c85-85a5-4077-9f92-a36bb38af3ce
Received: from mail-40136.protonmail.ch (unknown [185.70.40.136])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a85c2c85-85a5-4077-9f92-a36bb38af3ce;
 Tue, 15 Sep 2020 09:57:17 +0000 (UTC)
Date: Tue, 15 Sep 2020 09:57:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=trmm.net;
 s=protonmail; t=1600163835;
 bh=7KlymjpeMQOvVaWjwOTpF/K8l8ebwdKvU3l+hh44OOg=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=rvtpa+KQvmeA0f3vpv07eJFZoiUf0J4vyOSJU9fLaX+m+Co/TacVcvqCaJRkttArV
 /Tq5BXO3rzHf9XiyXCMOyUZYjZp7N0GoJo2b2IDkBn8X218x/Zk2jVv+CRZf2CAdoH
 LRFnat2Ape6ei1IbukP5PFj632UTIl+BRvcdrtaY=
To: Jan Beulich <jbeulich@suse.com>
From: Trammell Hudson <hudson@trmm.net>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [RFC PATCH] efi: const correct EFI functions
Message-ID: <kFoPdxBCyIMDMrAPifOU0AOIsq4CagfiRSpRt-K7g1Ju10TJ-7OTqz80sioB2rDZ5bEq3Sx9JSAxhYGfcaQ68pQP0v8gUFT_08HcvIXRTMk=@trmm.net>
In-Reply-To: <6f21d741-7e6d-7434-ba2c-dbfb376b529d@suse.com>
References: <20200914142528.897639-1-hudson@trmm.net>
 <c83fa179-253b-29ba-57d7-c2b5a9b0daee@suse.com>
 <GzkAuTpoKeYXGDsEJtlgfK50xky_Z3ipeYUpbKvW9Fu-0uJamNpsRVMR8fIUYpIzoJlzowf-j7pbcoDAmL8qgYRjE2UwZ2wKma0Xm7U5PpQ=@trmm.net>
 <d94fdbee-7e41-99db-13f8-16394a288318@suse.com>
 <k1CeZGAJquzeIZ1QQgwjPptA5Of3tFvfAE7cUeOvP5D8Th9j55kbwhM410STM91F_ys-HvUZ4WRwch4-gY12EG7cx7u8LEQBxroiwhj8T5Q=@trmm.net>
 <6f21d741-7e6d-7434-ba2c-dbfb376b529d@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF shortcircuit=no
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
 mailout.protonmail.ch
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
Reply-To: Trammell Hudson <hudson@trmm.net>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Tuesday, September 15, 2020 9:41 AM, Jan Beulich <jbeulich@suse.com> wro=
te:
> On 14.09.2020 17:05, Trammell Hudson wrote:
> > [...] I checked to see
> > which functions would need to be wrapped. It is a surprisingly
> > small number:
> > #define PrintStr(s) StdOut->OutputString(StdOut, (CHAR16 *)(s))
> > #define PrintErr(s) StdErr->OutputString(StdErr, (CHAR16 *)(s))
> > #define efi_file_open(file,handle,name,mode,attr) \
> > (file)->Open(file, handle, (CHAR16 *)(name), mode, attr)
> > #define shim_verify(shim, ptr, len) \
> > (shim)->Verify((void *)(ptr), len)
>
> That's surprisingly few. What about e.g. HandleProtocol() and
> LocateHandle()? GUIDs shouldn't really be non-const either.

Good point -- I did not track down all uses of efi_bs and every GUID.  I'll=
 send a RFC patch v2 in a minute with all of the GUIDs converted to __initc=
onst.

--
Trammell


