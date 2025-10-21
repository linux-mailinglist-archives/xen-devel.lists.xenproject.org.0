Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 42A59BF6DEE
	for <lists+xen-devel@lfdr.de>; Tue, 21 Oct 2025 15:50:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1147233.1479572 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vBCkO-0007ES-D7; Tue, 21 Oct 2025 13:49:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1147233.1479572; Tue, 21 Oct 2025 13:49:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vBCkO-0007Cz-9a; Tue, 21 Oct 2025 13:49:56 +0000
Received: by outflank-mailman (input) for mailman id 1147233;
 Tue, 21 Oct 2025 13:49:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7+p/=46=treblig.org=dg@srs-se1.protection.inumbo.net>)
 id 1vBCkN-0007Ct-JF
 for xen-devel@lists.xenproject.org; Tue, 21 Oct 2025 13:49:55 +0000
Received: from mx.treblig.org (mx.treblig.org [2a00:1098:5b::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d1f6e874-ae84-11f0-9d15-b5c5bf9af7f9;
 Tue, 21 Oct 2025 15:49:53 +0200 (CEST)
Received: from dg by mx.treblig.org with local (Exim 4.96)
 (envelope-from <dg@treblig.org>) id 1vBCk5-000B3N-1t;
 Tue, 21 Oct 2025 13:49:37 +0000
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
X-Inumbo-ID: d1f6e874-ae84-11f0-9d15-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
	; s=bytemarkmx; h=Content-Type:MIME-Version:Message-ID:Subject:From:Date:From
	:Subject; bh=LHZXynPB0hLQ+CBy8lrGdpgfsv32Vai29vkeHTpK2ck=; b=AaJoJRCrdJAEQGZf
	w9YjMn4734mkUHeOBJkdePtpJDTHkk2w0ISZh4Y3GmCbHPFjkCYBAHHj37lXx1pDzaoAxr4GoJNko
	ZwfZbctB8awpat4JKKZzK7Ns6cbh8Df0Ji2xKMCszqHMUVVgd+wywJpLbDx1pMUVvMj6znwEbGZtz
	AWAU8OtbzMUmRs1NPVC7lRi8NwfLEQIBy3fgpb+xKUw0twzTBjxPeGCFLmMCFYapg2UIJJxgf8C88
	9cypXp+mGgtoL9b6Iw8hSZv5wYZgy/f40cHt/kKq6uZ5C0Hm2gJwc8Bz+y30h1MLM7USJRUv+fETC
	Ya35X/iXopHXlilz8A==;
Date: Tue, 21 Oct 2025 13:49:37 +0000
From: "Dr. David Alan Gilbert" <dave@treblig.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: marcandre.lureau@redhat.com, qemu-devel@nongnu.org, pbonzini@redhat.com,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Stefano Garzarella <sgarzare@redhat.com>,
	"Gonglei (Arei)" <arei.gonglei@huawei.com>,
	Zhenwei Pi <pizhenwei@bytedance.com>,
	Laurent Vivier <lvivier@redhat.com>, Amit Shah <amit@kernel.org>,
	Stefan Berger <stefanb@linux.vnet.ibm.com>,
	Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
	Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>,
	=?iso-8859-1?Q?Cl=E9ment?= Chigot <chigot@adacore.com>,
	Frederic Konrad <konrad.frederic@yahoo.fr>,
	Alberto Garcia <berto@igalia.com>, Thomas Huth <huth@tuxfamily.org>,
	Halil Pasic <pasic@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Jason Herne <jjherne@linux.ibm.com>,
	Yoshinori Sato <yoshinori.sato@nifty.com>,
	Magnus Damm <magnus.damm@gmail.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	Harsh Prateek Bora <harshpb@linux.ibm.com>,
	"Collin L. Walling" <walling@linux.ibm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony PERARD <anthony@xenproject.org>,
	Paul Durrant <paul@xen.org>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Alistair Francis <alistair@alistair23.me>,
	Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Corey Minyard <minyard@acm.org>,
	Paul Burton <paulburton@kernel.org>,
	Aleksandar Rikalo <arikalo@gmail.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Weiwei Li <liwei1518@gmail.com>,
	Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Michael Rolnik <mrolnik@gmail.com>,
	Antony Pavlov <antonynpavlov@gmail.com>,
	Joel Stanley <joel@jms.id.au>,
	Vijai Kumar K <vijai@behindbytes.com>,
	Samuel Tardieu <sam@rfc1149.net>,
	Gustavo Romero <gustavo.romero@linaro.org>,
	Raphael Norwitz <raphael@enfabrica.net>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	"reviewer:vhost-user-scmi" <mzamazal@redhat.com>,
	Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>,
	Dmitry Osipenko <dmitry.osipenko@collabora.com>,
	Fabiano Rosas <farosas@suse.de>,
	Markus Armbruster <armbru@redhat.com>,
	Zhang Chen <zhangckid@gmail.com>,
	Li Zhijian <lizhijian@fujitsu.com>,
	Jason Wang <jasowang@redhat.com>,
	Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Helge Deller <deller@gmx.de>, Max Filippov <jcmvbkbc@gmail.com>,
	Lukas Straub <lukasstraub2@web.de>,
	"open list:Sharp SL-5500 Co..." <qemu-arm@nongnu.org>,
	"open list:S390 SCLP-backed..." <qemu-s390x@nongnu.org>,
	"open list:sPAPR (pseries)" <qemu-ppc@nongnu.org>,
	"open list:X86 Xen CPUs" <xen-devel@lists.xenproject.org>,
	"open list:RISC-V TCG CPUs" <qemu-riscv@nongnu.org>,
	"open list:virtiofs" <virtio-fs@lists.linux.dev>,
	"open list:Rust-related patc..." <qemu-rust@nongnu.org>
Subject: Re: [PATCH] char: rename CharBackend->CharFrontend
Message-ID: <aPePcTKl6s4FoLCL@gallifrey>
References: <20251021122533.721467-1-marcandre.lureau@redhat.com>
 <CAFEAcA-jPE_onLYLMxgcAOB7dWRXOLJrWcGPnR0NUdjYytPDVA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAFEAcA-jPE_onLYLMxgcAOB7dWRXOLJrWcGPnR0NUdjYytPDVA@mail.gmail.com>
X-Chocolate: 70 percent or better cocoa solids preferably
X-Operating-System: Linux/6.1.0-34-amd64 (x86_64)
X-Uptime: 13:49:19 up 176 days, 22:02,  1 user,  load average: 0.00, 0.00,
 0.00
User-Agent: Mutt/2.2.12 (2023-09-09)

* Peter Maydell (peter.maydell@linaro.org) wrote:
> Marc-André Lureau <marcandre.lureau@redhat.com> wrote:
> > The actual backend is "Chardev", CharBackend is the frontend side of it,
> > let's rename it for readability.
> 
> I always thought the "frontend" was the device the guest
> saw (the 16650 UART or whatever). invocation.html has bits
> talking about "virtio hvc console frontend device" which
> seem like they also use that terminology.
> 
> If we want to clean up the naming it might be helpful to have
> a comment somewhere documenting the different components and
> what names we give them and how they fit together (or even
> better, something in docs/devel/...)

Or something more descriptive like 'CharGuestSide'

Dave

> thanks
> -- PMM
-- 
 -----Open up your eyes, open up your mind, open up your code -------   
/ Dr. David Alan Gilbert    |       Running GNU/Linux       | Happy  \ 
\        dave @ treblig.org |                               | In Hex /
 \ _________________________|_____ http://www.treblig.org   |_______/

