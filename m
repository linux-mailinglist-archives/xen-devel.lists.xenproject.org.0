Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AB625BE49E
	for <lists+xen-devel@lfdr.de>; Tue, 20 Sep 2022 13:38:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.409338.652339 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oabYo-0006k6-HE; Tue, 20 Sep 2022 11:37:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 409338.652339; Tue, 20 Sep 2022 11:37:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oabYo-0006gq-Dr; Tue, 20 Sep 2022 11:37:06 +0000
Received: by outflank-mailman (input) for mailman id 409338;
 Tue, 20 Sep 2022 11:37:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nmTP=ZX=redhat.com=armbru@srs-se1.protection.inumbo.net>)
 id 1oabYn-0006gk-7D
 for xen-devel@lists.xenproject.org; Tue, 20 Sep 2022 11:37:05 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8a4d1169-38d8-11ed-bad8-01ff208a15ba;
 Tue, 20 Sep 2022 13:37:01 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-49-nyyOMpweMKOJOc5LnI28Bw-1; Tue, 20 Sep 2022 07:36:52 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1C1DF3810D23;
 Tue, 20 Sep 2022 11:36:50 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.163])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EF591112131E;
 Tue, 20 Sep 2022 11:36:48 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id A0E0D21E6900; Tue, 20 Sep 2022 13:36:47 +0200 (CEST)
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
X-Inumbo-ID: 8a4d1169-38d8-11ed-bad8-01ff208a15ba
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1663673820;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Q9Kiy75k/GjyNcX5/jFVpAejSl+0Eo6vMfAUPlGa7+Q=;
	b=OYGbM+OxxxL6pY1TjKJz4gTVCrAaoOCVNRNh2pV3j1iBck0WQc+65xLk//npdeZjAVhr2H
	PZBizRXG16HzwhhLutLXWClNsaKaea862Q3JqHN/2AFETCnk81sG0QpTkb31ChHLTZdkWa
	Mkm3JOJ/NrQImSb2E9IBzN0OE6QxMxQ=
X-MC-Unique: nyyOMpweMKOJOc5LnI28Bw-1
From: Markus Armbruster <armbru@redhat.com>
To: Alistair Francis <alistair23@gmail.com>, Bin Meng
 <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>
Cc: Bernhard Beschow <shentey@gmail.com>,  "qemu-devel@nongnu.org
 Developers" <qemu-devel@nongnu.org>,  "Michael S. Tsirkin"
 <mst@redhat.com>,  Magnus Damm <magnus.damm@gmail.com>,  Aleksandar Rikalo
 <aleksandar.rikalo@syrmia.com>,  Bandan Das <bsd@redhat.com>,  Matthew
 Rosato <mjrosato@linux.ibm.com>,  Daniel Henrique Barboza
 <danielhb413@gmail.com>,  Sergio Lopez <slp@redhat.com>,  Alexey
 Kardashevskiy <aik@ozlabs.ru>,  Xiaojuan Yang <yangxiaojuan@loongson.cn>,
  Cameron Esfahani <dirty@apple.com>,  Michael Rolnik <mrolnik@gmail.com>,
  Song Gao <gaosong@loongson.cn>,  Jagannathan Raman
 <jag.raman@oracle.com>,  Greg Kurz <groug@kaod.org>,  Kamil Rytarowski
 <kamil@netbsd.org>,  Peter Xu <peterx@redhat.com>,  Joel Stanley
 <joel@jms.id.au>,  Alistair Francis <Alistair.Francis@wdc.com>,  "Dr.
 David Alan Gilbert" <dgilbert@redhat.com>,  Paolo Bonzini
 <pbonzini@redhat.com>,  haxm-team@intel.com,  Roman Bolshakov
 <r.bolshakov@yadro.com>,  Markus Armbruster <armbru@redhat.com>,  Eric
 Auger <eric.auger@redhat.com>,  David Gibson
 <david@gibson.dropbear.id.au>,  Daniel P. =?utf-8?Q?Berrang=C3=A9?=
 <berrange@redhat.com>,
  Christian Borntraeger <borntraeger@linux.ibm.com>,  =?utf-8?Q?C=C3=A9dri?=
 =?utf-8?Q?c?= Le Goater
 <clg@kaod.org>,  Stefan Hajnoczi <stefanha@redhat.com>,  Qemu-block
 <qemu-block@nongnu.org>,  Eduardo Habkost <eduardo@habkost.net>,
  =?utf-8?Q?Herv=C3=A9?=
 Poussineau <hpoussin@reactos.org>,  "open list:New World"
 <qemu-ppc@nongnu.org>,  Cornelia Huck <cohuck@redhat.com>,  Helge Deller
 <deller@gmx.de>,  Stefano Stabellini <sstabellini@kernel.org>,  Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,  "open list:RISC-V"
 <qemu-riscv@nongnu.org>,  Stafford Horne <shorne@gmail.com>,  Paul Durrant
 <paul@xen.org>,  Havard Skinnemoen <hskinnemoen@google.com>,  Elena
 Ufimtseva <elena.ufimtseva@oracle.com>,  Alexander Graf <agraf@csgraf.de>,
  Thomas Huth <thuth@redhat.com>,  Alex Williamson
 <alex.williamson@redhat.com>,  Wenchao Wang <wenchao.wang@intel.com>,
  Tony Krowiak <akrowiak@linux.ibm.com>,  Marcel Apfelbaum
 <marcel.apfelbaum@gmail.com>,  qemu-s390x <qemu-s390x@nongnu.org>,
  =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,  Mark
 Cave-Ayland
 <mark.cave-ayland@ilande.co.uk>,  Eric Farman <farman@linux.ibm.com>,
  Reinoud Zandijk <reinoud@netbsd.org>,  Alexander Bulekov <alxndr@bu.edu>,
  Yanan Wang <wangyanan55@huawei.com>,  "Edgar E. Iglesias"
 <edgar.iglesias@gmail.com>,  Gerd Hoffmann <kraxel@redhat.com>,  Tyrone
 Ting <kfting@nuvoton.com>,  "open list:X86"
 <xen-devel@lists.xenproject.org>,  Yoshinori Sato
 <ysato@users.sourceforge.jp>,  John Snow <jsnow@redhat.com>,  Richard
 Henderson <richard.henderson@linaro.org>,  Darren Kenny
 <darren.kenny@oracle.com>,  "open list:Overall" <kvm@vger.kernel.org>,
  Qiuhao Li <Qiuhao.Li@outlook.com>,  John G Johnson
 <john.g.johnson@oracle.com>,  Sunil Muthuswamy <sunilmut@microsoft.com>,
  Max Filippov <jcmvbkbc@gmail.com>,  qemu-arm <qemu-arm@nongnu.org>,
  Marcelo Tosatti <mtosatti@redhat.com>,  Peter Maydell
 <peter.maydell@linaro.org>,  Anthony Perard <anthony.perard@citrix.com>,
  Andrew Jeffery <andrew@aj.id.au>,  Artyom Tarasenko
 <atar4qemu@gmail.com>,  Halil Pasic <pasic@linux.ibm.com>,  "Maciej S.
 Szmigiero" <maciej.szmigiero@oracle.com>,  Jason Wang
 <jasowang@redhat.com>,  David Hildenbrand <david@redhat.com>,  Laurent
 Vivier <laurent@vivier.eu>,  Alistair Francis <alistair@alistair23.me>,
  Jason Herne <jjherne@linux.ibm.com>
Subject: Re: [PATCH 1/9] hw/riscv/sifive_e: Fix inheritance of SiFiveEState
References: <20220919231720.163121-1-shentey@gmail.com>
	<20220919231720.163121-2-shentey@gmail.com>
	<CAKmqyKN+V2R8PkED67tB8+pCZs9369ViiL8OZ9XhO3SdUCk5=Q@mail.gmail.com>
Date: Tue, 20 Sep 2022 13:36:47 +0200
In-Reply-To: <CAKmqyKN+V2R8PkED67tB8+pCZs9369ViiL8OZ9XhO3SdUCk5=Q@mail.gmail.com>
	(Alistair Francis's message of "Tue, 20 Sep 2022 09:31:10 +1000")
Message-ID: <87edw6xoog.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3

Alistair Francis <alistair23@gmail.com> writes:

> On Tue, Sep 20, 2022 at 9:18 AM Bernhard Beschow <shentey@gmail.com> wrote:
>>
>> SiFiveEState inherits from SysBusDevice while it's TypeInfo claims it to
>> inherit from TYPE_MACHINE. This is an inconsistency which can cause
>> undefined behavior such as memory corruption.
>>
>> Change SiFiveEState to inherit from MachineState since it is registered
>> as a machine.
>>
>> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

To the SiFive maintainers: since this is a bug fix, let's merge it right
away.


