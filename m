Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 449E67FEFF1
	for <lists+xen-devel@lfdr.de>; Thu, 30 Nov 2023 14:21:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.644692.1006082 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8gyG-0003os-Vk; Thu, 30 Nov 2023 13:20:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 644692.1006082; Thu, 30 Nov 2023 13:20:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8gyG-0003mT-St; Thu, 30 Nov 2023 13:20:48 +0000
Received: by outflank-mailman (input) for mailman id 644692;
 Thu, 30 Nov 2023 13:20:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Tvl7=HL=kaod.org=clg@ozlabs.org>)
 id 1r8gyF-0003mN-Nf
 for xen-devel@lists.xenproject.org; Thu, 30 Nov 2023 13:20:47 +0000
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 43eef967-8f83-11ee-98e4-6d05b1d4d9a1;
 Thu, 30 Nov 2023 14:20:46 +0100 (CET)
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4Sgxdj5bkSz4xjY;
 Fri,  1 Dec 2023 00:20:41 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4Sgxck69gcz4xW7;
 Fri,  1 Dec 2023 00:19:50 +1100 (AEDT)
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
X-Inumbo-ID: 43eef967-8f83-11ee-98e4-6d05b1d4d9a1
Message-ID: <f9b6941c-15b9-40ec-bc17-a154678d1a1c@kaod.org>
Date: Thu, 30 Nov 2023 14:19:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/6] qemu/main-loop: rename qemu_cond_wait_iothread() to
 qemu_cond_wait_bql()
Content-Language: en-US
To: Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org
Cc: Jean-Christophe Dubois <jcd@tribudubois.net>,
 Fabiano Rosas <farosas@suse.de>, qemu-s390x@nongnu.org,
 Song Gao <gaosong@loongson.cn>, Marcel Apfelbaum
 <marcel.apfelbaum@gmail.com>, Thomas Huth <thuth@redhat.com>,
 Hyman Huang <yong.huang@smartx.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Andrey Smirnov <andrew.smirnov@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, Kevin Wolf <kwolf@redhat.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>, Artyom Tarasenko
 <atar4qemu@gmail.com>, Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Max Filippov <jcmvbkbc@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>, Paul Durrant <paul@xen.org>,
 Jagannathan Raman <jag.raman@oracle.com>, Juan Quintela
 <quintela@redhat.com>, =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?=
 <berrange@redhat.com>, qemu-arm@nongnu.org, Jason Wang
 <jasowang@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 BALATON Zoltan <balaton@eik.bme.hu>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Hailiang Zhang <zhanghailiang@xfusion.com>,
 Roman Bolshakov <rbolshakov@ddn.com>, Huacai Chen <chenhuacai@kernel.org>,
 Fam Zheng <fam@euphon.net>, Eric Blake <eblake@redhat.com>,
 Jiri Slaby <jslaby@suse.cz>, Alexander Graf <agraf@csgraf.de>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, Weiwei Li <liwei1518@gmail.com>,
 Eric Farman <farman@linux.ibm.com>, Stafford Horne <shorne@gmail.com>,
 David Hildenbrand <david@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Reinoud Zandijk <reinoud@netbsd.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Cameron Esfahani <dirty@apple.com>, xen-devel@lists.xenproject.org,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>, qemu-riscv@nongnu.org,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 John Snow <jsnow@redhat.com>, Sunil Muthuswamy <sunilmut@microsoft.com>,
 Michael Roth <michael.roth@amd.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Bin Meng <bin.meng@windriver.com>,
 Stefano Stabellini <sstabellini@kernel.org>, kvm@vger.kernel.org,
 qemu-block@nongnu.org, Halil Pasic <pasic@linux.ibm.com>,
 Peter Xu <peterx@redhat.com>, Anthony Perard <anthony.perard@citrix.com>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, Paolo Bonzini <pbonzini@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 qemu-ppc@nongnu.org, =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>, Christian Borntraeger <borntraeger@linux.ibm.com>,
 Akihiko Odaki <akihiko.odaki@daynix.com>, Leonardo Bras
 <leobras@redhat.com>, Nicholas Piggin <npiggin@gmail.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>
References: <20231129212625.1051502-1-stefanha@redhat.com>
 <20231129212625.1051502-4-stefanha@redhat.com>
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20231129212625.1051502-4-stefanha@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 11/29/23 22:26, Stefan Hajnoczi wrote:
> The name "iothread" is overloaded. Use the term Big QEMU Lock (BQL)
> instead, it is already widely used and unambiguous.
> 
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>


Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.




