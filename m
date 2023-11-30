Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 924327FF049
	for <lists+xen-devel@lfdr.de>; Thu, 30 Nov 2023 14:37:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.644718.1006126 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8hDt-0001fy-Bc; Thu, 30 Nov 2023 13:36:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 644718.1006126; Thu, 30 Nov 2023 13:36:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8hDt-0001d6-8l; Thu, 30 Nov 2023 13:36:57 +0000
Received: by outflank-mailman (input) for mailman id 644718;
 Thu, 30 Nov 2023 13:36:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dHGs=HL=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1r8hDr-0001cv-QQ
 for xen-devel@lists.xenproject.org; Thu, 30 Nov 2023 13:36:55 +0000
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [2a00:1450:4864:20::431])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 85f5fb94-8f85-11ee-9b0f-b553b5be7939;
 Thu, 30 Nov 2023 14:36:53 +0100 (CET)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-332ed02ccd9so635611f8f.0
 for <xen-devel@lists.xenproject.org>; Thu, 30 Nov 2023 05:36:53 -0800 (PST)
Received: from [192.168.69.100] (sev93-h02-176-184-17-116.dsl.sta.abo.bbox.fr.
 [176.184.17.116]) by smtp.gmail.com with ESMTPSA id
 i2-20020adffc02000000b003330aede2aesm1559297wrr.112.2023.11.30.05.36.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Nov 2023 05:36:52 -0800 (PST)
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
X-Inumbo-ID: 85f5fb94-8f85-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701351413; x=1701956213; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=92EVl/+kAJa1w133nRnLwZdbri5T/CNJ+OGiI8vF/hc=;
        b=nTJzlPiWMtogYQyMG51+Bvt7CkuhdSFtf2YFIraAUThjR1rNDJyDjesFgrfvgv/P34
         NOn1CkT/wjUDxSlB1Ky6S3X+CyyIB1KshEkxW5ojx+g9m4acJRplrXHZLhcBaLtudzTM
         uycKWekHiOxNyi9dx4P+YNziGvOBR3TsaYcKg6oBzTK1FgKMy67+jIOFjHP19foVENjh
         ABeYFb8I7LYLMugntvkzATdFvLPRJLz8dD31bF1zeWYIaUFr20YzuyagaPX1m5UWr54z
         drVPnOZMFdTqW8/FUnAJQ746rwy1Q1BxepKoxhfQD5rzWsS8U71h+LASEMJUDORlUgF0
         VPZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701351413; x=1701956213;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=92EVl/+kAJa1w133nRnLwZdbri5T/CNJ+OGiI8vF/hc=;
        b=fs9lBBO+bchgWHXKElJDq7jpS4WhbvZuI1dUaR8Mr11m3YwuScyXKY1TXa/rKdi/VP
         O+I71wr8eK48IF6iE2juhl7bme/EzGYdb88ODgYillGpIZKXbGhLYEqIq859M3XuauWs
         SSfVEgEDxVFd4Tzw4jyqMs3y4q+zqe8K3q1hO0DqbgP9NZrH87uts5VVi6yjfZ5S/9Ru
         N20rqb1bUth5vIa4Yp9M0KW+VcxkwQCj4+x685tTomN0qZcoXqnYnWuMyLvBUs6uUzOp
         HeTSdpdqNKPnGhcXBteJckfCtibhi5IhTOEzPVG7aHjA+vE/LcjrV7F0Zn7bRKVw52g4
         Epow==
X-Gm-Message-State: AOJu0YzNU+k/3nY0Ity3DmfpUZ855jkEMVVFeYXLPMCTc0m2hoKyXHK4
	+sNqM5hV8DBcPkhQJvrz1P6loA==
X-Google-Smtp-Source: AGHT+IGzSdlgStqYT69A2lG9GtqRHhg/niB3F/uN4GK5nKt0eJM7WDiZHR6K1BVe40jqO9Y7LSdkKg==
X-Received: by 2002:a05:6000:10c:b0:333:2be6:860e with SMTP id o12-20020a056000010c00b003332be6860emr238311wrx.71.1701351413167;
        Thu, 30 Nov 2023 05:36:53 -0800 (PST)
Message-ID: <ce8686c9-ac4b-4bb8-a181-af536ef1097a@linaro.org>
Date: Thu, 30 Nov 2023 14:36:46 +0100
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
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, qemu-ppc@nongnu.org,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Akihiko Odaki <akihiko.odaki@daynix.com>, Leonardo Bras
 <leobras@redhat.com>, Nicholas Piggin <npiggin@gmail.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>
References: <20231129212625.1051502-1-stefanha@redhat.com>
 <20231129212625.1051502-4-stefanha@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20231129212625.1051502-4-stefanha@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 29/11/23 22:26, Stefan Hajnoczi wrote:
> The name "iothread" is overloaded. Use the term Big QEMU Lock (BQL)
> instead, it is already widely used and unambiguous.
> 
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>   include/qemu/main-loop.h          | 8 ++++----
>   accel/tcg/tcg-accel-ops-rr.c      | 4 ++--
>   hw/display/virtio-gpu.c           | 2 +-
>   hw/ppc/spapr_events.c             | 2 +-
>   system/cpu-throttle.c             | 2 +-
>   system/cpus.c                     | 4 ++--
>   target/i386/nvmm/nvmm-accel-ops.c | 2 +-
>   target/i386/whpx/whpx-accel-ops.c | 2 +-
>   8 files changed, 13 insertions(+), 13 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


