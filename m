Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E06ADB85999
	for <lists+xen-devel@lfdr.de>; Thu, 18 Sep 2025 17:30:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1126307.1467926 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uzGZp-0001t5-1j; Thu, 18 Sep 2025 15:29:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1126307.1467926; Thu, 18 Sep 2025 15:29:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uzGZo-0001qw-UW; Thu, 18 Sep 2025 15:29:40 +0000
Received: by outflank-mailman (input) for mailman id 1126307;
 Thu, 18 Sep 2025 15:29:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+spj=35=eik.bme.hu=balaton@srs-se1.protection.inumbo.net>)
 id 1uzGZn-0001qq-K7
 for xen-devel@lists.xenproject.org; Thu, 18 Sep 2025 15:29:39 +0000
Received: from zero.eik.bme.hu (zero.eik.bme.hu [152.66.115.2])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 49843575-94a4-11f0-9d13-b5c5bf9af7f9;
 Thu, 18 Sep 2025 17:29:38 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id CC4D856F30D;
 Thu, 18 Sep 2025 17:29:36 +0200 (CEST)
Received: from zero.eik.bme.hu ([127.0.0.1])
 by localhost (zero.eik.bme.hu [127.0.0.1]) (amavis, port 10028) with ESMTP
 id kz7_8Rgw4BnB; Thu, 18 Sep 2025 17:29:34 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id C875B56F2AE; Thu, 18 Sep 2025 17:29:34 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id C493656F295;
 Thu, 18 Sep 2025 17:29:34 +0200 (CEST)
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
X-Inumbo-ID: 49843575-94a4-11f0-9d13-b5c5bf9af7f9
X-Virus-Scanned: amavis at eik.bme.hu
Date: Thu, 18 Sep 2025 17:29:34 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Peter Xu <peterx@redhat.com>
cc: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>, qemu-devel@nongnu.org, 
    Alex Williamson <alex.williamson@redhat.com>, 
    =?ISO-8859-15?Q?C=E9dric_Le_Goater?= <clg@redhat.com>, 
    Paolo Bonzini <pbonzini@redhat.com>, 
    =?ISO-8859-15?Q?Daniel_P=2E_Berrang=E9?= <berrange@redhat.com>, 
    Eduardo Habkost <eduardo@habkost.net>, 
    David Hildenbrand <david@redhat.com>, 
    =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>, 
    Richard Henderson <richard.henderson@linaro.org>, 
    Helge Deller <deller@gmx.de>, 
    =?ISO-8859-15?Q?Marc-Andr=E9_Lureau?= <marcandre.lureau@redhat.com>, 
    "Michael S. Tsirkin" <mst@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>, 
    John Snow <jsnow@redhat.com>, qemu-block@nongnu.org, 
    Keith Busch <kbusch@kernel.org>, Klaus Jensen <its@irrelevant.dk>, 
    Jesper Devantier <foss@defmacro.it>, 
    Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, 
    Nicholas Piggin <npiggin@gmail.com>, qemu-ppc@nongnu.org, 
    John Levon <john.levon@nutanix.com>, 
    Thanos Makatos <thanos.makatos@nutanix.com>, 
    Yanan Wang <wangyanan55@huawei.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>, 
    Daniel Henrique Barboza <danielhb413@gmail.com>, 
    David Gibson <david@gibson.dropbear.id.au>, 
    Harsh Prateek Bora <harshpb@linux.ibm.com>, 
    Alexey Kardashevskiy <aik@ozlabs.ru>, 
    =?ISO-8859-15?Q?Alex_Benn=E9e?= <alex.bennee@linaro.org>, 
    Fabiano Rosas <farosas@suse.de>, Thomas Huth <thuth@redhat.com>, 
    Laurent Vivier <lvivier@redhat.com>, 
    Peter Maydell <peter.maydell@linaro.org>, 
    Aurelien Jarno <aurelien@aurel32.net>, 
    Aleksandar Rikalo <arikalo@gmail.com>, Max Filippov <jcmvbkbc@gmail.com>, 
    =?ISO-8859-15?Q?Herv=E9_Poussineau?= <hpoussin@reactos.org>, 
    Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, 
    Artyom Tarasenko <atar4qemu@gmail.com>, 
    Alistair Francis <alistair@alistair23.me>, 
    "Maciej S. Szmigiero" <maciej.szmigiero@oracle.com>, 
    Bin Meng <bmeng.cn@gmail.com>, Stefano Stabellini <sstabellini@kernel.org>, 
    Anthony PERARD <anthony@xenproject.org>, Paul Durrant <paul@xen.org>, 
    "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, 
    xen-devel@lists.xenproject.org
Subject: Re: [PATCH v3 0/7] Do not unparent in instance_finalize()
In-Reply-To: <aMwRSpezxmIwIHrU@x1.local>
Message-ID: <f536fc18-73ab-676c-bdec-59e94a3e5408@eik.bme.hu>
References: <20250917-use-v3-0-72c2a6887c6c@rsg.ci.i.u-tokyo.ac.jp> <aMwRSpezxmIwIHrU@x1.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed

On Thu, 18 Sep 2025, Peter Xu wrote:
> On Wed, Sep 17, 2025 at 07:13:25PM +0900, Akihiko Odaki wrote:
>> Based-on: <cover.1751493467.git.balaton@eik.bme.hu>
>> ("[PATCH v2 00/14] hw/pci-host/raven clean ups")
>
> Could I ask why this is a dependency?

It removes an address_space usage from raven so this series does not have 
to change that and I don't have to rebase that series. Otherwise these are 
not related. I'll check the problem reported about my series and send an 
updated one.

Regards,
BALATON Zoltan

