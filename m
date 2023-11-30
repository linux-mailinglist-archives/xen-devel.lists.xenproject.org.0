Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 574607FE996
	for <lists+xen-devel@lfdr.de>; Thu, 30 Nov 2023 08:18:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.644426.1005406 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8bJK-0004d4-TI; Thu, 30 Nov 2023 07:18:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 644426.1005406; Thu, 30 Nov 2023 07:18:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8bJK-0004b5-QR; Thu, 30 Nov 2023 07:18:10 +0000
Received: by outflank-mailman (input) for mailman id 644426;
 Thu, 30 Nov 2023 07:18:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=YLtP=HL=redhat.com=armbru@srs-se1.protection.inumbo.net>)
 id 1r8bJJ-0004az-1c
 for xen-devel@lists.xenproject.org; Thu, 30 Nov 2023 07:18:09 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9ba98b59-8f50-11ee-98e4-6d05b1d4d9a1;
 Thu, 30 Nov 2023 08:18:07 +0100 (CET)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-605-faJQaflrONWae7UjryOpGg-1; Thu, 30 Nov 2023 02:17:58 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AF742811001;
 Thu, 30 Nov 2023 07:17:56 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.148])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7D59D40C6EB9;
 Thu, 30 Nov 2023 07:17:55 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 90DFA21E6A1F; Thu, 30 Nov 2023 08:17:54 +0100 (CET)
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
X-Inumbo-ID: 9ba98b59-8f50-11ee-98e4-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1701328686;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2p1/yCCqE7V/A9ix7GiHFBqyRKKVluWD2OXS34K6s/4=;
	b=gtD8qWltl0UMcMRkzbo4FjXPgRJFotsrichqmVHjQpBeCZAGYIlZQBBZDfwfAm+xzdy5iA
	3JB/o0Y/cF6/MSVcpOc/dEOR4qRbc9t5848brWgiXxZySFamEW9zSgBHag8khVqgEm273Y
	3Uh7uNOap+aFm0V5me9tNTSZGtMlvJY=
X-MC-Unique: faJQaflrONWae7UjryOpGg-1
From: Markus Armbruster <armbru@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: qemu-devel@nongnu.org,  Jean-Christophe Dubois <jcd@tribudubois.net>,
  Fabiano Rosas <farosas@suse.de>,  qemu-s390x@nongnu.org,  Song Gao
 <gaosong@loongson.cn>,  Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
  Thomas Huth <thuth@redhat.com>,  Hyman Huang <yong.huang@smartx.com>,
  Marcelo Tosatti <mtosatti@redhat.com>,  David Woodhouse
 <dwmw2@infradead.org>,  Andrey Smirnov <andrew.smirnov@gmail.com>,  Peter
 Maydell <peter.maydell@linaro.org>,  Kevin Wolf <kwolf@redhat.com>,  Ilya
 Leoshkevich <iii@linux.ibm.com>,  Artyom Tarasenko <atar4qemu@gmail.com>,
  Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,  Max Filippov
 <jcmvbkbc@gmail.com>,  Alistair Francis <alistair.francis@wdc.com>,  Paul
 Durrant <paul@xen.org>,  Jagannathan Raman <jag.raman@oracle.com>,  Juan
 Quintela <quintela@redhat.com>,  Daniel P. =?utf-8?Q?Berrang=C3=A9?=
 <berrange@redhat.com>,
  qemu-arm@nongnu.org,  Jason Wang <jasowang@redhat.com>,  Gerd Hoffmann
 <kraxel@redhat.com>,  Hanna Reitz <hreitz@redhat.com>,  =?utf-8?Q?Marc-An?=
 =?utf-8?Q?dr=C3=A9?= Lureau
 <marcandre.lureau@redhat.com>,  BALATON Zoltan <balaton@eik.bme.hu>,
  Daniel Henrique Barboza <danielhb413@gmail.com>,  Elena Ufimtseva
 <elena.ufimtseva@oracle.com>,  Aurelien Jarno <aurelien@aurel32.net>,
  Hailiang Zhang <zhanghailiang@xfusion.com>,  Roman Bolshakov
 <rbolshakov@ddn.com>,  Huacai Chen <chenhuacai@kernel.org>,  Fam Zheng
 <fam@euphon.net>,  Eric Blake <eblake@redhat.com>,  Jiri Slaby
 <jslaby@suse.cz>,  Alexander Graf <agraf@csgraf.de>,  Liu Zhiwei
 <zhiwei_liu@linux.alibaba.com>,  Weiwei Li <liwei1518@gmail.com>,  Eric
 Farman <farman@linux.ibm.com>,  Stafford Horne <shorne@gmail.com>,  David
 Hildenbrand <david@redhat.com>,  Markus Armbruster <armbru@redhat.com>,
  Reinoud Zandijk <reinoud@netbsd.org>,  Palmer Dabbelt
 <palmer@dabbelt.com>,  Cameron Esfahani <dirty@apple.com>,
  xen-devel@lists.xenproject.org,  Pavel Dovgalyuk
 <pavel.dovgaluk@ispras.ru>,  qemu-riscv@nongnu.org,  Aleksandar Rikalo
 <aleksandar.rikalo@syrmia.com>,  John Snow <jsnow@redhat.com>,  Sunil
 Muthuswamy <sunilmut@microsoft.com>,  Michael Roth <michael.roth@amd.com>,
  David Gibson <david@gibson.dropbear.id.au>,  "Michael S. Tsirkin"
 <mst@redhat.com>,  Richard Henderson <richard.henderson@linaro.org>,  Bin
 Meng <bin.meng@windriver.com>,  Stefano Stabellini
 <sstabellini@kernel.org>,  kvm@vger.kernel.org,  qemu-block@nongnu.org,
  Halil Pasic <pasic@linux.ibm.com>,  Peter Xu <peterx@redhat.com>,
  Anthony Perard <anthony.perard@citrix.com>,  Harsh Prateek Bora
 <harshpb@linux.ibm.com>,  Alex =?utf-8?Q?Benn=C3=A9e?=
 <alex.bennee@linaro.org>,  Eduardo
 Habkost <eduardo@habkost.net>,  Paolo Bonzini <pbonzini@redhat.com>,
  Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,  =?utf-8?Q?C?=
 =?utf-8?Q?=C3=A9dric?= Le
 Goater <clg@kaod.org>,  qemu-ppc@nongnu.org,  Philippe =?utf-8?Q?Mathieu-?=
 =?utf-8?Q?Daud=C3=A9?=
 <philmd@linaro.org>,  Christian Borntraeger <borntraeger@linux.ibm.com>,
  Akihiko Odaki <akihiko.odaki@daynix.com>,  Leonardo Bras
 <leobras@redhat.com>,  Nicholas Piggin <npiggin@gmail.com>,  Jiaxun Yang
 <jiaxun.yang@flygoat.com>
Subject: Re: [PATCH 6/6] Rename "QEMU global mutex" to "BQL" in comments and
 docs
References: <20231129212625.1051502-1-stefanha@redhat.com>
	<20231129212625.1051502-7-stefanha@redhat.com>
Date: Thu, 30 Nov 2023 08:17:54 +0100
In-Reply-To: <20231129212625.1051502-7-stefanha@redhat.com> (Stefan Hajnoczi's
	message of "Wed, 29 Nov 2023 16:26:25 -0500")
Message-ID: <874jh3g15p.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.2

Stefan Hajnoczi <stefanha@redhat.com> writes:

> The term "QEMU global mutex" is identical to the more widely used Big
> QEMU Lock ("BQL"). Update the code comments and documentation to use
> "BQL" instead of "QEMU global mutex".
>
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>

For QAPI
Acked-by: Markus Armbruster <armbru@redhat.com>


