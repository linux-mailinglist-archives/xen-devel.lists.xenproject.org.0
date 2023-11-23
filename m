Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 69A9D7F5E40
	for <lists+xen-devel@lfdr.de>; Thu, 23 Nov 2023 12:51:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.639670.997263 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r68F6-0007pG-K5; Thu, 23 Nov 2023 11:51:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 639670.997263; Thu, 23 Nov 2023 11:51:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r68F6-0007na-Gx; Thu, 23 Nov 2023 11:51:36 +0000
Received: by outflank-mailman (input) for mailman id 639670;
 Thu, 23 Nov 2023 11:51:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vIdj=HE=desiato.srs.infradead.org=BATV+39fc1edcc778f4c9f1e2+7396+infradead.org+dwmw2@srs-se1.protection.inumbo.net>)
 id 1r68F3-0007nK-He
 for xen-devel@lists.xenproject.org; Thu, 23 Nov 2023 11:51:34 +0000
Received: from desiato.infradead.org (desiato.infradead.org
 [2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a4b2bcbe-89f6-11ee-98e2-6d05b1d4d9a1;
 Thu, 23 Nov 2023 12:51:32 +0100 (CET)
Received: from [2a00:23ee:2220:2c6:5955:525e:d466:b180] (helo=[IPv6:::1])
 by desiato.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1r68Ev-00D16r-0x; Thu, 23 Nov 2023 11:51:27 +0000
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
X-Inumbo-ID: a4b2bcbe-89f6-11ee-98e2-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Message-ID:References:In-Reply-To:Subject:CC:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=pzyXewFhRtpYTI9XrpP9cFM6t8eBr20xSghVjL/NanQ=; b=QMctfK2xRqeYxuZIPFq596XsFH
	DpzZOmjWHnHJ0Q8JC6gea87yefwtSEVqCtYVzFFE4efwMdO9dalfLdMMF/YTj+RdKzvYApNoXijvY
	c0UHPFTchdYhsCYGOKFwpc62p6cCu5JtGNHlFd6lzJTnxm9wIR7aGVDtzjrNEL1WOaZ+FxHlN2rT5
	n44OnpFF+AfeATyjMeFjD7DcsVxLb+FfqhNa/tVAFQ3uXrZxBh4ARALh5zpM55t7EGjrxq52vx4De
	B2CtVmUl8ngYB/AQXwYfkS5Ix/rgxLcy4vczw/8MCBYAwNS4fvsOyOa85MbK+b6I8CSq7sXIuxlev
	dXZvfhfg==;
Date: Thu, 23 Nov 2023 11:51:24 +0000
From: David Woodhouse <dwmw2@infradead.org>
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
CC: "paul@xen.org" <paul@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Julien Grall <julien@xen.org>,
 Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 "open list:X86 Xen CPUs" <xen-devel@lists.xenproject.org>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v2_4/6=5D_xen=5Fpvdev=3A_Do_not_?= =?US-ASCII?Q?assume_Dom0_when_creating_a_directory?=
User-Agent: K-9 Mail for Android
In-Reply-To: <87leaoy9sy.fsf@epam.com>
References: <20231121221023.419901-1-volodymyr_babchuk@epam.com> <20231121221023.419901-5-volodymyr_babchuk@epam.com> <b04daedc-ba6a-4109-8e23-fbcd023bcfec@xen.org> <alpine.DEB.2.22.394.2311221428570.2053963@ubuntu-linux-20-04-desktop> <ce719f35e72a9387fc04af098e6d688f9bbdca4e.camel@infradead.org> <alpine.DEB.2.22.394.2311221508270.2424505@ubuntu-linux-20-04-desktop> <a4e6a62a7cfe756344a1efcb8b2c3cfb1e50817e.camel@infradead.org> <alpine.DEB.2.22.394.2311221515010.2424505@ubuntu-linux-20-04-desktop> <87r0khz6zj.fsf@epam.com> <87cyw1z61i.fsf@epam.com> <dce4efb0-4fdc-404c-8e5d-c90ed732eb8a@xen.org> <db7f8751c569c7cbf0049807050054071ddda0d9.camel@infradead.org> <87leaoy9sy.fsf@epam.com>
Message-ID: <2609ABBE-A827-41E4-B65F-78EF88006299@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by desiato.infradead.org. See http://www.infradead.org/rpr.html

On 23 November 2023 11:43:35 GMT, Volodymyr Babchuk <Volodymyr_Babchuk@epam=
=2Ecom> wrote:
>
>Hi David,
>
>David Woodhouse <dwmw2@infradead=2Eorg> writes:
>
>> [[S/MIME Signed Part:Undecided]]
>> On Thu, 2023-11-23 at 09:28 +0000, Paul Durrant wrote:
>>> On 23/11/2023 00:07, Volodymyr Babchuk wrote:
>>> >=20
>>> > Hi,
>>> >=20
>>> > Volodymyr Babchuk <volodymyr_babchuk@epam=2Ecom> writes:
>>> >=20
>>> > > Hi Stefano,
>>> > >=20
>>> > > Stefano Stabellini <sstabellini@kernel=2Eorg> writes:
>>> > >=20
>>> > > > On Wed, 22 Nov 2023, David Woodhouse wrote:
>>> > > > > On Wed, 2023-11-22 at 15:09 -0800, Stefano Stabellini wrote:
>>> > > > > > On Wed, 22 Nov 2023, David Woodhouse wrote:
>>> > > > > > > On Wed, 2023-11-22 at 14:29 -0800, Stefano Stabellini wrot=
e:
>>> > > > > > > > On Wed, 22 Nov 2023, Paul Durrant wrote:
>>> > > > > > > > > On 21/11/2023 22:10, Volodymyr Babchuk wrote:
>>> > > > > > > > > > From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epa=
m=2Ecom>
>>> > > > > > > > > >=20
>>> > > > > > > > > > Instead of forcing the owner to domid 0, use XS_PRES=
ERVE_OWNER to
>>> > > > > > > > > > inherit the owner of the directory=2E
>>> > > > > > > > >=20
>>> > > > > > > > > Ah=2E=2E=2E so that's why the previous patch is there=
=2E
>>> > > > > > > > >=20
>>> > > > > > > > > This is not the right way to fix it=2E The QEMU Xen su=
pport is *assuming* that
>>> > > > > > > > > QEMU is either running in, or emulating, dom0=2E In th=
e emulation case this is
>>> > > > > > > > > probably fine, but the 'real Xen' case it should be us=
ing the correct domid
>>> > > > > > > > > for node creation=2E I guess this could either be supp=
lied on the command line
>>> > > > > > > > > or discerned by reading the local domain 'domid' node=
=2E
>>> > > > > > > >=20
>>> > > > > > > > yes, it should be passed as command line option to QEMU
>>> > > > > > >=20
>>> > > > > > > I'm not sure I like the idea of a command line option for =
something
>>> > > > > > > which QEMU could discover for itself=2E
>>> > > > > >=20
>>> > > > > > That's fine too=2E I meant to say "yes, as far as I know the=
 toolstack
>>> > > > > > passes the domid to QEMU as a command line option today"=2E
>>> > > > >=20
>>> > > > > The -xen-domid argument on the QEMU command line today is the =
*guest*
>>> > > > > domain ID, not the domain ID in which QEMU itself is running=
=2E
>>> > > > >=20
>>> > > > > Or were you thinking of something different?
>>> > > >=20
>>> > > > Ops, you are right and I understand your comment better now=2E T=
he backend
>>> > > > domid is not on the command line but it should be discoverable (=
on
>>> > > > xenstore if I remember right)=2E
>>> > >=20
>>> > > Yes, it is just "~/domid"=2E I'll add a function that reads it=2E
>>> >=20
>>> > Just a quick question to QEMU folks: is it better to add a global
>>> > variable where we will store own Domain ID or it will be okay to rea=
d
>>> > domid from Xenstore every time we need it?
>>> >=20
>>> > If global variable variant is better, what is proffered place to def=
ine
>>> > this variable? system/globals=2Ec ?
>>> >=20
>>>=20
>>> Actually=2E=2E=2E is it possible for QEMU just to use a relative path =
for the=20
>>> backend nodes? That way it won't need to know it's own domid, will it?
>>
>> That covers some of the use cases, but it may also need to know its own
>> domid for other purposes=2E Including writing the *absolute* path of th=
e
>> backend, to a frontend node?
>
>Is this case possible? As I understand, QEMU writes frontend nodes only
>when it emulates Xen, otherwise this done by Xen toolstack=2E And in case
>of Xen emulation, QEMU always assumes role of Domain-0=2E


No, you can hotplug and unplug devices in QEMU even under real Xen=2E And =
if QEMU in a driver domain is given sufficient permission to write to its g=
uest's frontend nodes, it should not need to be in dom0=2E


