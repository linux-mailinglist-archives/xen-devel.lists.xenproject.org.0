Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E2641824152
	for <lists+xen-devel@lfdr.de>; Thu,  4 Jan 2024 13:11:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.661713.1031394 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rLMYh-0002mw-Fi; Thu, 04 Jan 2024 12:10:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 661713.1031394; Thu, 04 Jan 2024 12:10:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rLMYh-0002kb-D2; Thu, 04 Jan 2024 12:10:47 +0000
Received: by outflank-mailman (input) for mailman id 661713;
 Thu, 04 Jan 2024 12:10:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PTP6=IO=daynix.com=akihiko.odaki@srs-se1.protection.inumbo.net>)
 id 1rLMYf-0002kV-FG
 for xen-devel@lists.xenproject.org; Thu, 04 Jan 2024 12:10:45 +0000
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com
 [2607:f8b0:4864:20::632])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 48f55c84-aafa-11ee-98ef-6d05b1d4d9a1;
 Thu, 04 Jan 2024 13:10:44 +0100 (CET)
Received: by mail-pl1-x632.google.com with SMTP id
 d9443c01a7336-1d4c767d3a8so2658025ad.1
 for <xen-devel@lists.xenproject.org>; Thu, 04 Jan 2024 04:10:44 -0800 (PST)
Received: from ?IPV6:2400:4050:a840:1e00:9ac7:6d57:2b16:6932?
 ([2400:4050:a840:1e00:9ac7:6d57:2b16:6932])
 by smtp.gmail.com with ESMTPSA id
 x22-20020a170902821600b001cfc1b931a9sm25324308pln.249.2024.01.04.04.10.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Jan 2024 04:10:42 -0800 (PST)
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
X-Inumbo-ID: 48f55c84-aafa-11ee-98ef-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1704370243; x=1704975043; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Q23i9yT7yrVEFxnf3fk5D4MyK0KHTuKJKDM3rop1kno=;
        b=yE44NLqUwonY1rOBOjL8u4S1iR5hYGEvQlRfIUDZDUooSmdkiRlqgUZZeIV4j2rUzQ
         E7kfjrAcWvXgSH83gnJTEj1TWL11B74KAzCWEuvNJbtdQeQdQqZNPveNxPgoOyDWDUU6
         gQ6JUUbenTrcdcDJCsMLR6K/zWtWOTEhE0/GTwsXcjfftYy2MMc59HuW09O55beQWkue
         IQO1s9FYTR9L+JdNwHQkxQfqK7js1hjpJLVqKqTTEuiBGNBKRYO+KNgfZKuA9r0lHqBu
         xvD4wWq7rb74fjRn80gH4a0ffvDu1Rv4W+Pg9aYeqTE0FSKxDTuO09yCMLocYa7dKMMQ
         llVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704370243; x=1704975043;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Q23i9yT7yrVEFxnf3fk5D4MyK0KHTuKJKDM3rop1kno=;
        b=jBR15QTJioY9Y37Sr6SS/3G/sksbeQGZfyI8WOBQWXTq5SHyjtNHF4dwx4am6tBN3i
         XOsMa6kYhaFMRbW4m2RONfpIOfMcSxh698tpYdcz+wwRpM9O5aLq6h4zcRqQIuGA7PHL
         yJYWQWMMP6akYNRWK30gHf6gN8IiCI4faUHmLDGbmy7wtaQNt7OXcnwyjna1wwW6OYta
         KtTFuqkLwYhh32brSK7ZQLZOl34n8eFBWysdADGrUsID6M+EauXfrsWCti+WiaX0BkLG
         eUJG7wdxt4KR4Sf4lsEOhHRWyL7wUPDiVGg9nhZxtNCzw1xqzcM0m1Xp6Ut1VKv86Blp
         ciyw==
X-Gm-Message-State: AOJu0YylrI0pharM+rA/A4A9Ch0g4gA4LwaT9jFqZGqep3kXHr37IPlL
	s5DIFBpFlVpPVohG05qarBf1X2Qbvh13fw==
X-Google-Smtp-Source: AGHT+IEvVniyWW6+pm7fNDiUCukxNFVRQmngQJsY2M7PnvRddXZwN4RLgEaC/QIRqiAw2JDtmofBpQ==
X-Received: by 2002:a17:903:1d1:b0:1d4:2b5a:9cb7 with SMTP id e17-20020a17090301d100b001d42b5a9cb7mr365235plh.47.1704370243101;
        Thu, 04 Jan 2024 04:10:43 -0800 (PST)
Message-ID: <480302ec-4fb2-4e97-8940-8ec27846efc5@daynix.com>
Date: Thu, 4 Jan 2024 21:10:26 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/5] Make Big QEMU Lock naming consistent
Content-Language: en-US
To: Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org
Cc: Hanna Reitz <hreitz@redhat.com>, qemu-riscv@nongnu.org,
 Roman Bolshakov <rbolshakov@ddn.com>, =?UTF-8?Q?C=C3=A9dric_Le_Goater?=
 <clg@kaod.org>, Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 Eduardo Habkost <eduardo@habkost.net>, Thomas Huth <thuth@redhat.com>,
 qemu-block@nongnu.org, Andrey Smirnov <andrew.smirnov@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, Huacai Chen
 <chenhuacai@kernel.org>, Fam Zheng <fam@euphon.net>,
 Gerd Hoffmann <kraxel@redhat.com>, David Gibson
 <david@gibson.dropbear.id.au>, John Snow <jsnow@redhat.com>,
 Stafford Horne <shorne@gmail.com>, Weiwei Li <liwei1518@gmail.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Cameron Esfahani <dirty@apple.com>, Alexander Graf <agraf@csgraf.de>,
 David Hildenbrand <david@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Nicholas Piggin <npiggin@gmail.com>, Max Filippov <jcmvbkbc@gmail.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Markus Armbruster <armbru@redhat.com>, Peter Xu <peterx@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-s390x@nongnu.org,
 Jiri Slaby <jslaby@suse.cz>, Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Eric Blake <eblake@redhat.com>, =?UTF-8?Q?Alex_Benn=C3=A9e?=
 <alex.bennee@linaro.org>, Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Fabiano Rosas <farosas@suse.de>, Michael Roth <michael.roth@amd.com>,
 Paul Durrant <paul@xen.org>, Jagannathan Raman <jag.raman@oracle.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Hyman Huang <yong.huang@smartx.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 xen-devel@lists.xenproject.org, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Song Gao <gaosong@loongson.cn>, Kevin Wolf <kwolf@redhat.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>, Artyom Tarasenko
 <atar4qemu@gmail.com>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Reinoud Zandijk <reinoud@netbsd.org>, qemu-ppc@nongnu.org,
 Marcelo Tosatti <mtosatti@redhat.com>, David Woodhouse
 <dwmw2@infradead.org>, Aurelien Jarno <aurelien@aurel32.net>,
 Bin Meng <bin.meng@windriver.com>, qemu-arm@nongnu.org,
 Anthony Perard <anthony.perard@citrix.com>,
 Leonardo Bras <leobras@redhat.com>,
 Hailiang Zhang <zhanghailiang@xfusion.com>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>, kvm@vger.kernel.org,
 Palmer Dabbelt <palmer@dabbelt.com>, Eric Farman <farman@linux.ibm.com>,
 BALATON Zoltan <balaton@eik.bme.hu>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>
References: <20240102153529.486531-1-stefanha@redhat.com>
From: Akihiko Odaki <akihiko.odaki@daynix.com>
In-Reply-To: <20240102153529.486531-1-stefanha@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2024/01/03 0:35, Stefan Hajnoczi wrote:
> v3:
> - Rebase
> - Define bql_lock() macro on a single line [Akihiko Odaki]
> v2:
> - Rename APIs bql_*() [PeterX]
> - Spell out "Big QEMU Lock (BQL)" in doc comments [PeterX]
> - Rename "iolock" variables in hw/remote/mpqemu-link.c [Harsh]
> - Fix bql_auto_lock() indentation in Patch 2 [Ilya]
> - "with BQL taken" -> "with the BQL taken" [Philippe]
> - "under BQL" -> "under the BQL" [Philippe]
> 
> The Big QEMU Lock ("BQL") has two other names: "iothread lock" and "QEMU global
> mutex". The term "iothread lock" is easily confused with the unrelated --object
> iothread (iothread.c).
> 
> This series updates the code and documentation to consistently use "BQL". This
> makes the code easier to understand.

For the whole series,
Reviewed-by: Akihiko Odaki <akihiko.odaki@daynix.com>

Thank you for sorting this out.

