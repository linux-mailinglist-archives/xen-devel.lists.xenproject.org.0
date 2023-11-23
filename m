Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E12C7F5E8B
	for <lists+xen-devel@lfdr.de>; Thu, 23 Nov 2023 12:58:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.639680.997293 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r68L8-0003iG-O9; Thu, 23 Nov 2023 11:57:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 639680.997293; Thu, 23 Nov 2023 11:57:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r68L8-0003ga-KR; Thu, 23 Nov 2023 11:57:50 +0000
Received: by outflank-mailman (input) for mailman id 639680;
 Thu, 23 Nov 2023 11:57:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vIdj=HE=desiato.srs.infradead.org=BATV+39fc1edcc778f4c9f1e2+7396+infradead.org+dwmw2@srs-se1.protection.inumbo.net>)
 id 1r68L7-0003gU-MG
 for xen-devel@lists.xenproject.org; Thu, 23 Nov 2023 11:57:49 +0000
Received: from desiato.infradead.org (desiato.infradead.org
 [2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 83140468-89f7-11ee-9b0e-b553b5be7939;
 Thu, 23 Nov 2023 12:57:45 +0100 (CET)
Received: from [2a00:23ee:2220:2c6:5955:525e:d466:b180] (helo=[IPv6:::1])
 by desiato.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1r68Kz-00D1Ek-0C; Thu, 23 Nov 2023 11:57:41 +0000
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
X-Inumbo-ID: 83140468-89f7-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Message-ID:References:In-Reply-To:Subject:CC:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=2pfjBeGF8kYGcBTnUdyWjjaTzi8VmVJRHFxJbdPixsg=; b=MqCs8nwRox8qPyToePUAkm/UqX
	G3vZp7Y6x+BQN+229oykmk+VN1arlCaH8NkqxKWxe83Z9XoeoR19LEqIcdi+8H/EErEmx4fY1hseP
	7WwcCqldHpx9Z0MbPDAFGqhj2ieTag2c4Cv3pL/VrjwIQAoKZHHOvqQouFG+i4yNztlDfAu+Fdcwe
	MZCZ7Zv0sPY3ncGXY662bV3hCj4gdbzUNU2XkVIRFB7Hhlbj8w5kPPhlOFzxBL+fLejVhn5u3Igdr
	PjciOHmA0ePnB7K2y+jd9FMcIsPc3ohbzFWd/CodCrWlcR5ZDGNCLmOGe/Q+eutvQWt3L8cTL6cjB
	PhZS+hAQ==;
Date: Thu, 23 Nov 2023 11:57:39 +0000
From: David Woodhouse <dwmw2@infradead.org>
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, "paul@xen.org" <paul@xen.org>
CC: Stefano Stabellini <sstabellini@kernel.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Julien Grall <julien@xen.org>,
 Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 "open list:X86 Xen CPUs" <xen-devel@lists.xenproject.org>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v2_4/6=5D_xen=5Fpvdev=3A_Do_not_?= =?US-ASCII?Q?assume_Dom0_when_creating_a_directory?=
User-Agent: K-9 Mail for Android
In-Reply-To: <87bkbky9bb.fsf@epam.com>
References: <20231121221023.419901-1-volodymyr_babchuk@epam.com> <20231121221023.419901-5-volodymyr_babchuk@epam.com> <b04daedc-ba6a-4109-8e23-fbcd023bcfec@xen.org> <alpine.DEB.2.22.394.2311221428570.2053963@ubuntu-linux-20-04-desktop> <ce719f35e72a9387fc04af098e6d688f9bbdca4e.camel@infradead.org> <alpine.DEB.2.22.394.2311221508270.2424505@ubuntu-linux-20-04-desktop> <a4e6a62a7cfe756344a1efcb8b2c3cfb1e50817e.camel@infradead.org> <alpine.DEB.2.22.394.2311221515010.2424505@ubuntu-linux-20-04-desktop> <87r0khz6zj.fsf@epam.com> <87cyw1z61i.fsf@epam.com> <dce4efb0-4fdc-404c-8e5d-c90ed732eb8a@xen.org> <87bkbky9bb.fsf@epam.com>
Message-ID: <5941AF2D-71E7-4A5B-A519-25F87F90DC05@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by desiato.infradead.org. See http://www.infradead.org/rpr.html

On 23 November 2023 11:54:01 GMT, Volodymyr Babchuk <Volodymyr_Babchuk@epam=
=2Ecom> wrote:
>
>Hi Paul,
>
>Paul Durrant <xadimgnik@gmail=2Ecom> writes:
>
>> On 23/11/2023 00:07, Volodymyr Babchuk wrote:
>>> Hi,
>>> Volodymyr Babchuk <volodymyr_babchuk@epam=2Ecom> writes:
>>>=20
>>>> Hi Stefano,
>>>>
>>>> Stefano Stabellini <sstabellini@kernel=2Eorg> writes:
>>>>
>>>>> On Wed, 22 Nov 2023, David Woodhouse wrote:
>>>>>> On Wed, 2023-11-22 at 15:09 -0800, Stefano Stabellini wrote:
>>>>>>> On Wed, 22 Nov 2023, David Woodhouse wrote:
>>>>>>>> On Wed, 2023-11-22 at 14:29 -0800, Stefano Stabellini wrote:
>>>>>>>>> On Wed, 22 Nov 2023, Paul Durrant wrote:
>>>>>>>>>> On 21/11/2023 22:10, Volodymyr Babchuk wrote:
>>>>>>>>>>> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam=2Ecom>
>>>>>>>>>>>
>>>>>>>>>>> Instead of forcing the owner to domid 0, use XS_PRESERVE_OWNER=
 to
>>>>>>>>>>> inherit the owner of the directory=2E
>>>>>>>>>>
>>>>>>>>>> Ah=2E=2E=2E so that's why the previous patch is there=2E
>>>>>>>>>>
>>>>>>>>>> This is not the right way to fix it=2E The QEMU Xen support is =
*assuming* that
>>>>>>>>>> QEMU is either running in, or emulating, dom0=2E In the emulati=
on case this is
>>>>>>>>>> probably fine, but the 'real Xen' case it should be using the c=
orrect domid
>>>>>>>>>> for node creation=2E I guess this could either be supplied on t=
he command line
>>>>>>>>>> or discerned by reading the local domain 'domid' node=2E
>>>>>>>>>
>>>>>>>>> yes, it should be passed as command line option to QEMU
>>>>>>>>
>>>>>>>> I'm not sure I like the idea of a command line option for somethi=
ng
>>>>>>>> which QEMU could discover for itself=2E
>>>>>>>
>>>>>>> That's fine too=2E I meant to say "yes, as far as I know the tools=
tack
>>>>>>> passes the domid to QEMU as a command line option today"=2E
>>>>>>
>>>>>> The -xen-domid argument on the QEMU command line today is the *gues=
t*
>>>>>> domain ID, not the domain ID in which QEMU itself is running=2E
>>>>>>
>>>>>> Or were you thinking of something different?
>>>>>
>>>>> Ops, you are right and I understand your comment better now=2E The b=
ackend
>>>>> domid is not on the command line but it should be discoverable (on
>>>>> xenstore if I remember right)=2E
>>>>
>>>> Yes, it is just "~/domid"=2E I'll add a function that reads it=2E
>>> Just a quick question to QEMU folks: is it better to add a global
>>> variable where we will store own Domain ID or it will be okay to read
>>> domid from Xenstore every time we need it?
>>> If global variable variant is better, what is proffered place to
>>> define
>>> this variable? system/globals=2Ec ?
>>>=20
>>
>> Actually=2E=2E=2E is it possible for QEMU just to use a relative path f=
or
>> the backend nodes? That way it won't need to know it's own domid, will
>> it?
>
>Well, it is possible to use relative path, AFAIK, linux-based backends
>are doing exactly this=2E But problem is with xenstore_mkdir() function,
>which requires domain id to correctly set owner when it causes call to
>set_permissions()=2E
>
>As David said, architecturally it will be better to get rid of
>xenstore_mkdir() usage, because it is used by legacy backends only=2E But
>to do this, someone needs to convert legacy backends to use newer API=2E =
I
>have no capacity to do this right now, so I implemented a contained
>solution:
>
>static int xenstore_read_own_domid(unsigned int *domid)
>
>in xen_pvdev=2Ec=2E I believe, this new function will be removed along wi=
th
>whole xen_pvdev=2Ec when there will be no legacy backends left=2E

Which PV backends do you care about? We already have net, block and consol=
e converted=2E


