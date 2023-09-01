Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 58E8A78FF88
	for <lists+xen-devel@lfdr.de>; Fri,  1 Sep 2023 16:55:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.594641.928021 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qc5YJ-0004ri-8g; Fri, 01 Sep 2023 14:55:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 594641.928021; Fri, 01 Sep 2023 14:55:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qc5YJ-0004pI-60; Fri, 01 Sep 2023 14:55:15 +0000
Received: by outflank-mailman (input) for mailman id 594641;
 Fri, 01 Sep 2023 14:55:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=SnXb=ER=kaod.org=clg@ozlabs.org>)
 id 1qc5YH-0004pC-Qa
 for xen-devel@lists.xenproject.org; Fri, 01 Sep 2023 14:55:13 +0000
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8bafa84a-48d7-11ee-8783-cb3800f73035;
 Fri, 01 Sep 2023 16:55:11 +0200 (CEST)
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4Rch0C0g8Nz4wy8;
 Sat,  2 Sep 2023 00:55:07 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4Rch000JYNz4wy7;
 Sat,  2 Sep 2023 00:54:55 +1000 (AEST)
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
X-Inumbo-ID: 8bafa84a-48d7-11ee-8783-cb3800f73035
Message-ID: <e6a0b290-b76c-2f6d-4bbc-c97222d26935@kaod.org>
Date: Fri, 1 Sep 2023 16:54:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 7/7] qobject atomics osdep: Make a few macros more
 hygienic
Content-Language: en-US
To: Markus Armbruster <armbru@redhat.com>
Cc: Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org, kwolf@redhat.com,
 hreitz@redhat.com, vsementsov@yandex-team.ru, jsnow@redhat.com,
 idryomov@gmail.com, pl@kamp.de, sw@weilnetz.de, sstabellini@kernel.org,
 anthony.perard@citrix.com, paul@xen.org, pbonzini@redhat.com,
 marcandre.lureau@redhat.com, berrange@redhat.com, thuth@redhat.com,
 philmd@linaro.org, stefanha@redhat.com, fam@euphon.net, quintela@redhat.com,
 peterx@redhat.com, leobras@redhat.com, kraxel@redhat.com,
 qemu-block@nongnu.org, xen-devel@lists.xenproject.org,
 alex.bennee@linaro.org, peter.maydell@linaro.org
References: <20230831132546.3525721-1-armbru@redhat.com>
 <20230831132546.3525721-8-armbru@redhat.com>
 <vfkfi6uld3gbd4urmqdlzkv6djtws6mkbluc5qvwcla6btszhu@ff66zfyd7smm>
 <7b8a4589-7f29-e564-4904-9b1a4fd342af@kaod.org> <87ttsevtgl.fsf@pond.sub.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <87ttsevtgl.fsf@pond.sub.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 9/1/23 16:50, Markus Armbruster wrote:
> Cédric Le Goater <clg@kaod.org> writes:
> 
>> On 8/31/23 16:30, Eric Blake wrote:
>>> On Thu, Aug 31, 2023 at 03:25:46PM +0200, Markus Armbruster wrote:
>>> [This paragraph written last: Bear with my stream of consciousness
>>> review below, where I end up duplicating some of the conslusions you
>>> reached before the point where I saw where the patch was headed]
>>>
>>>> Variables declared in macros can shadow other variables.  Much of the
>>>> time, this is harmless, e.g.:
>>>>
>>>>       #define _FDT(exp)                                                  \
>>>>           do {                                                           \
>>>>               int ret = (exp);                                           \
>>>>               if (ret < 0) {                                             \
>>>>                   error_report("error creating device tree: %s: %s",   \
>>>>                           #exp, fdt_strerror(ret));                      \
>>>>                   exit(1);                                               \
>>>>               }                                                          \
>>>>           } while (0)
>>> Which is why I've seen some projects require a strict namespace
>>> separation: if all macro parameters and any identifiers declared in
>>> macros use either a leading or a trailing _ (I prefer a trailing one,
>>> to avoid risking conflicts with libc reserved namespace; but leading
>>> is usually okay), and all other identifiers avoid that namespace, then
>>> you will never have shadowing by calling a macro from normal code.
>>
>> I started fixing the _FDT() macro since it is quite noisy at compile.
>> Same for qemu_fdt_setprop_cells(). So are we ok with names like 'ret_'
>> and 'i_' ? I used a 'local_' prefix for now but I can change.
> 
> I believe identifiers with a '_' suffix are just fine in macros.  We
> have quite a few of them already.

ok

>> I also have a bunch of fixes for ppc.
> 
> Appreciated!

count me on for the ppc files :

  hw/ppc/pnv_psi.c
  hw/ppc/spapr.c
  hw/ppc/spapr_drc.c
  hw/ppc/spapr_pci.c
  include/hw/ppc/fdt.h

and surely some other files under target/ppc/

This one was taken care of by Phil:

  include/sysemu/device_tree.h

C.

