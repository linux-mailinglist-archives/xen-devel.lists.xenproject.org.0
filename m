Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EB7BF7FEB58
	for <lists+xen-devel@lfdr.de>; Thu, 30 Nov 2023 10:04:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.644472.1005527 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8cxs-0004b4-Ub; Thu, 30 Nov 2023 09:04:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 644472.1005527; Thu, 30 Nov 2023 09:04:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8cxs-0004YC-Rj; Thu, 30 Nov 2023 09:04:08 +0000
Received: by outflank-mailman (input) for mailman id 644472;
 Thu, 30 Nov 2023 09:04:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=p39W=HL=gmail.com=xadimgnik@srs-se1.protection.inumbo.net>)
 id 1r8cxr-0004Wo-Qe
 for xen-devel@lists.xenproject.org; Thu, 30 Nov 2023 09:04:07 +0000
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [2a00:1450:4864:20::529])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6a97a078-8f5f-11ee-98e4-6d05b1d4d9a1;
 Thu, 30 Nov 2023 10:04:07 +0100 (CET)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-548ce39b101so629502a12.2
 for <xen-devel@lists.xenproject.org>; Thu, 30 Nov 2023 01:04:06 -0800 (PST)
Received: from [192.168.17.21] (54-240-197-238.amazon.com. [54.240.197.238])
 by smtp.gmail.com with ESMTPSA id
 i16-20020a1709061cd000b009b2cc87b8c3sm438680ejh.52.2023.11.30.01.04.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Nov 2023 01:04:05 -0800 (PST)
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
X-Inumbo-ID: 6a97a078-8f5f-11ee-98e4-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701335046; x=1701939846; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rDG0LfrN9KzuY1dutbAJHJsyvk/SVEQtsaapgDeTQgk=;
        b=ZaF8wdfsKx3Tv16GEdAkSVo0Y38kp3AMAH1+q2aUPcawzkeJmg8sCeNP/YraeIm2u5
         kI4hltHPDLNIYWtw7EGzFyKFI3Y2goEUGBY9yYUXzn+3UBzNcROuz9TBHH1UujPlzBp7
         9UzdC9LA5O8Z3NDbnu/e8q1iQOwVGKif1XXs+ZcoZjfpFPYpziTLFT9QgR/LXr7t/zyf
         SyFcF6rtsSXn7B0gv73E2gPbJ6q2z34zBJq0OYqPryyMPPAWE+TGWSQLfVkHGgrEq10P
         +0SZjzEHlAUjOCUnDoCMIGfl8sgE/SgSOD5CO3h1i6NyRk3q+dzBq4NoIHnLdmsgctCN
         xx8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701335046; x=1701939846;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rDG0LfrN9KzuY1dutbAJHJsyvk/SVEQtsaapgDeTQgk=;
        b=cqzxTeaM3ZYCnvl0pcj8ziQ2bngU6h4AeTx3H3R/noEmerebDJtjDARizZ8FyCe0DX
         M4sMi6VNtWItXpMtE97OwKLXYypMjkGcNvDnh6l2wNMgfZc1PAEJP031RBnZhG3QAwjF
         EMaB/1Dplk6O9e3SdZKaMifyJoepFYTIFnnPQMIBLkYLZ1ANnGzCLy0lY5ZHvHaU3AI/
         Oeftp+zRGflg3N0VnacJx2FCSCJfh7YzEykstApURazopQ5Kd10Jpc+AcXDSQM8vkg58
         Rf6XCSaEJLCq4IbcSoZ63HoZcpDmgH73CM4aZEUqupVrt8MxxuGmKtCPGQu8JAoXE93F
         9uhA==
X-Gm-Message-State: AOJu0Yz9XmTnXYXIVDdGmBL8+3aq1zoowpLVQlTLzVyzMsJqauzLQXHP
	IXIPgQHd2xcwGxM+OUTkuus=
X-Google-Smtp-Source: AGHT+IH62q365iHhXfNeCdgPZMilj33GjyyKhNs3sjPFImh+k7bvQx+U/QmZwntDvSzeLzApdBDisw==
X-Received: by 2002:a17:906:197:b0:a02:9987:dc3b with SMTP id 23-20020a170906019700b00a029987dc3bmr14284857ejb.15.1701335046283;
        Thu, 30 Nov 2023 01:04:06 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <67642c0a-4c2d-4f0b-90e8-9b125647af6c@xen.org>
Date: Thu, 30 Nov 2023 09:03:58 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: paul@xen.org
Subject: Re: [PATCH 2/6] qemu/main-loop: rename QEMU_IOTHREAD_LOCK_GUARD to
 QEMU_BQL_LOCK_GUARD
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
 Alistair Francis <alistair.francis@wdc.com>,
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
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, qemu-ppc@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Akihiko Odaki <akihiko.odaki@daynix.com>, Leonardo Bras
 <leobras@redhat.com>, Nicholas Piggin <npiggin@gmail.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>
References: <20231129212625.1051502-1-stefanha@redhat.com>
 <20231129212625.1051502-3-stefanha@redhat.com>
Organization: Xen Project
In-Reply-To: <20231129212625.1051502-3-stefanha@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 29/11/2023 21:26, Stefan Hajnoczi wrote:
> The name "iothread" is overloaded. Use the term Big QEMU Lock (BQL)
> instead, it is already widely used and unambiguous.
> 
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>   include/qemu/main-loop.h  | 20 ++++++++++----------
>   hw/i386/kvm/xen_evtchn.c  | 14 +++++++-------
>   hw/i386/kvm/xen_gnttab.c  |  2 +-
>   hw/mips/mips_int.c        |  2 +-
>   hw/ppc/ppc.c              |  2 +-
>   target/i386/kvm/xen-emu.c |  2 +-
>   target/ppc/excp_helper.c  |  2 +-
>   target/ppc/helper_regs.c  |  2 +-
>   target/riscv/cpu_helper.c |  4 ++--
>   9 files changed, 25 insertions(+), 25 deletions(-)
> 

Reviewed-by: Paul Durrant <paul@xen.org>


