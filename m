Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 20DF65BF5AA
	for <lists+xen-devel@lfdr.de>; Wed, 21 Sep 2022 06:56:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.409654.652666 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oarlT-0006iC-GV; Wed, 21 Sep 2022 04:55:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 409654.652666; Wed, 21 Sep 2022 04:55:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oarlT-0006g6-CR; Wed, 21 Sep 2022 04:55:15 +0000
Received: by outflank-mailman (input) for mailman id 409654;
 Wed, 21 Sep 2022 04:55:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=YFKF=ZY=redhat.com=armbru@srs-se1.protection.inumbo.net>)
 id 1oarlS-0006g0-87
 for xen-devel@lists.xenproject.org; Wed, 21 Sep 2022 04:55:14 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9325cb2e-3969-11ed-bad8-01ff208a15ba;
 Wed, 21 Sep 2022 06:55:13 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-262-JDdO1-4NNtms04LwtNgKXw-1; Wed, 21 Sep 2022 00:55:07 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 67BF02999B47;
 Wed, 21 Sep 2022 04:55:05 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.163])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EFABE2024CC8;
 Wed, 21 Sep 2022 04:55:03 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id C2B8221E6900; Wed, 21 Sep 2022 06:55:02 +0200 (CEST)
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
X-Inumbo-ID: 9325cb2e-3969-11ed-bad8-01ff208a15ba
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1663736111;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=d0ewimBIuzA4pcXzNcXQGF6URaG5NO+EI7K2JWsTSM0=;
	b=BvmOz6rLkGiZWGUSJW3b2OY790xekYjtpHk9Y0+xJPAoG44NDocZBpxlJ+c7vVdNcF3+ki
	7YQ/ylqOYuHdIqLUv1gjQCtgoQh8+gXVH/wzpbc/pZxASKHdvEKUPNHKNuHGbfv7/mn6M5
	jU9BfET7q23RZSXJ2QRDijRktZCxkdw=
X-MC-Unique: JDdO1-4NNtms04LwtNgKXw-1
From: Markus Armbruster <armbru@redhat.com>
To: Bernhard Beschow <shentey@gmail.com>
Cc: Alistair Francis <alistair23@gmail.com>,  Bin Meng
 <bin.meng@windriver.com>,  Palmer Dabbelt <palmer@dabbelt.com>,
  "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,  "Michael S.
 Tsirkin" <mst@redhat.com>,  Magnus Damm <magnus.damm@gmail.com>,
  Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,  Bandan Das
 <bsd@redhat.com>,  Matthew Rosato <mjrosato@linux.ibm.com>,  Daniel
 Henrique Barboza <danielhb413@gmail.com>,  Sergio Lopez <slp@redhat.com>,
  Alexey Kardashevskiy <aik@ozlabs.ru>,  Xiaojuan Yang
 <yangxiaojuan@loongson.cn>,  Cameron Esfahani <dirty@apple.com>,  Michael
 Rolnik <mrolnik@gmail.com>,  Song Gao <gaosong@loongson.cn>,  Jagannathan
 Raman <jag.raman@oracle.com>,  Greg Kurz <groug@kaod.org>,  Kamil
 Rytarowski <kamil@netbsd.org>,  Peter Xu <peterx@redhat.com>,  Joel
 Stanley <joel@jms.id.au>,  Alistair Francis <Alistair.Francis@wdc.com>,
  "Dr. David Alan Gilbert" <dgilbert@redhat.com>,  Paolo Bonzini
 <pbonzini@redhat.com>,  haxm-team@intel.com,  Roman Bolshakov
 <r.bolshakov@yadro.com>,  Eric Auger <eric.auger@redhat.com>,  David
 Gibson <david@gibson.dropbear.id.au>,  Daniel P. =?utf-8?Q?Berrang=C3=A9?=
 <berrange@redhat.com>,  Christian Borntraeger <borntraeger@linux.ibm.com>,
  =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>,  Stefan Hajnoczi
 <stefanha@redhat.com>,
  Qemu-block <qemu-block@nongnu.org>,  Eduardo Habkost
 <eduardo@habkost.net>,  =?utf-8?Q?Herv=C3=A9?= Poussineau
 <hpoussin@reactos.org>,  "open
 list:New World" <qemu-ppc@nongnu.org>,  Cornelia Huck <cohuck@redhat.com>,
  Helge Deller <deller@gmx.de>,  Stefano Stabellini
 <sstabellini@kernel.org>,  Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <f4bug@amsat.org>,
  "open list:RISC-V" <qemu-riscv@nongnu.org>,  Stafford Horne
 <shorne@gmail.com>,  Paul Durrant <paul@xen.org>,  Havard Skinnemoen
 <hskinnemoen@google.com>,  Elena Ufimtseva <elena.ufimtseva@oracle.com>,
  Alexander Graf <agraf@csgraf.de>,  Thomas Huth <thuth@redhat.com>,  Alex
 Williamson <alex.williamson@redhat.com>,  Wenchao Wang
 <wenchao.wang@intel.com>,  Tony Krowiak <akrowiak@linux.ibm.com>,  Marcel
 Apfelbaum <marcel.apfelbaum@gmail.com>,  qemu-s390x
 <qemu-s390x@nongnu.org>,  =?utf-8?Q?Marc-Andr=C3=A9?= Lureau
 <marcandre.lureau@redhat.com>,
  Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,  Eric Farman
 <farman@linux.ibm.com>,  Reinoud Zandijk <reinoud@netbsd.org>,  Alexander
 Bulekov <alxndr@bu.edu>,  Yanan Wang <wangyanan55@huawei.com>,  "Edgar E.
 Iglesias" <edgar.iglesias@gmail.com>,  Gerd Hoffmann <kraxel@redhat.com>,
  Tyrone Ting <kfting@nuvoton.com>,  "open list:X86"
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
	<87edw6xoog.fsf@pond.sub.org>
	<0BBD7391-7B2D-44E7-9396-D1747784B9DA@gmail.com>
Date: Wed, 21 Sep 2022 06:55:02 +0200
In-Reply-To: <0BBD7391-7B2D-44E7-9396-D1747784B9DA@gmail.com> (Bernhard
	Beschow's message of "Tue, 20 Sep 2022 23:23:52 +0000")
Message-ID: <87a66tgwd5.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4

Bernhard Beschow <shentey@gmail.com> writes:

> Am 20. September 2022 11:36:47 UTC schrieb Markus Armbruster <armbru@redhat.com>:
>>Alistair Francis <alistair23@gmail.com> writes:
>>
>>> On Tue, Sep 20, 2022 at 9:18 AM Bernhard Beschow <shentey@gmail.com> wrote:
>>>>
>>>> SiFiveEState inherits from SysBusDevice while it's TypeInfo claims it to
>>>> inherit from TYPE_MACHINE. This is an inconsistency which can cause
>>>> undefined behavior such as memory corruption.
>>>>
>>>> Change SiFiveEState to inherit from MachineState since it is registered
>>>> as a machine.
>>>>
>>>> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
>>>
>>> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
>>
>>To the SiFive maintainers: since this is a bug fix, let's merge it right
>>away.
>
> I could repost this particular patch with the three new tags (incl. Fixes) if desired.

Can't hurt, and could help the maintainers.


