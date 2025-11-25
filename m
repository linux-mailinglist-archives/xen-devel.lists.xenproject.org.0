Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 21F17C847CB
	for <lists+xen-devel@lfdr.de>; Tue, 25 Nov 2025 11:29:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1171830.1496855 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vNqIC-0001bd-Ux; Tue, 25 Nov 2025 10:29:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1171830.1496855; Tue, 25 Nov 2025 10:29:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vNqIC-0001a9-Ry; Tue, 25 Nov 2025 10:29:04 +0000
Received: by outflank-mailman (input) for mailman id 1171830;
 Tue, 25 Nov 2025 10:29:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=RmC5=6B=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1vNqIC-000842-0z
 for xen-devel@lists.xenproject.org; Tue, 25 Nov 2025 10:29:04 +0000
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [2a00:1450:4864:20::433])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8f8077b9-c9e9-11f0-980a-7dc792cee155;
 Tue, 25 Nov 2025 11:29:02 +0100 (CET)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-42b32900c8bso3070208f8f.0
 for <xen-devel@lists.xenproject.org>; Tue, 25 Nov 2025 02:29:02 -0800 (PST)
Received: from [192.168.69.210] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42cb7fb9190sm33346517f8f.33.2025.11.25.02.28.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Nov 2025 02:29:00 -0800 (PST)
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
X-Inumbo-ID: 8f8077b9-c9e9-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764066541; x=1764671341; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FOtq6FkTjjV4xqPH8MCZhBCC4A3ygFQQRD95vDYNiQk=;
        b=YsLPAwZ8KuR1MdgJUT6rr0OC94pGers3TT6UudR0eC4HjZeeytj5266Zz+yq5PwFEG
         OG3YvS9I19Szlshh/Ong0vL84W1W/HIzXALtfVu2x7v3ov3UFcWW4Ti2I1bVqyBOmSk/
         igNjZpURc+/VswjKb9ZQrZ1r2BQ/k8/DmQ6BkLLhou5RK4NZSivM5Tnapz6HzV9aTmUv
         fQBJZP7EVBkJK5LaOWgswa+3gYZt/dJRkXOB/2ZUHSp4QP3eMw5t9Y7JZ2kWkx/IPvML
         cElA7FvLF4BVM+GEI9Dur+qjc+6Lm3dNE9voXXcURbGU8FJ0FcIHdJV5ZY8cJK5qlQjj
         kglg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764066541; x=1764671341;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FOtq6FkTjjV4xqPH8MCZhBCC4A3ygFQQRD95vDYNiQk=;
        b=vgq3mcuI9k1NgEOlcQKd4WQbQWt7awZB2ryVJr+xCCEw/JcET/WIhvquieuwjfP1Gg
         lJN7QD71Xj8zSa4ExG2DidEZjvz5TxBPCjh3dd0xrDgzkcAOj6agoxoBi5JIRPomUaq7
         laNg9M78DvI7kbLrJGGa6c3RwTpWbjoQoLQV3QhWcjn2/1Kbq3qQt/n7w8l6gYuIZQ37
         KsWF0LvZN/1yaqSTJxknhVypRfAWXo7Q8j79+5Y7XKsHx/iQjnM773WKlnEKoINed+aK
         Ye6vLfb7vRQZZ1OgFkJKg4V/5sgpWmiTqojZMm317zIclczx3mTqX4KD4Pnc2C99ufEx
         h2Rw==
X-Forwarded-Encrypted: i=1; AJvYcCWCRkNG2zy+xuWBYklY/CSd1KDHHEmOvQ+m9MUwOC0a53ZIznFFScQSOhnFv/5HH2tBsmlXdm98Zu8=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxl4MhuqEo+Cd0Sns7DlKXUE8IU4pXoHClt7/q1Qq9G/0IgAAqP
	2P9BI6z71pJIMMJMJq7AhGtv0v6jLOlimJVePwqw31rIW3LMmTtHCdueXdT0wb3gPmg=
X-Gm-Gg: ASbGncuHn676g4HL0pA3aoyz3yn22ULgB89AOCi+Kg+ikwH/XFDpc5aPhmwR96+IfOh
	dDi9Ja6gCunxXdZfhd0Ry0gyDFqSvCFSoHng9BiChv/h+4FAkvnK/NPIobVWpf/9zvm5qaUweBv
	yoop135BBF8Rx1he+YjvPnHqiQA9F8RHcvYwy7Wwgbr9JhkbxW8scqMOjtIWWVvuuzmK9yC8G4g
	hO5F4ScsKaJKMJo0ZUASA21GVLt6tFxWCC48MsG+5BSAjAdQA+p84a6K0uBNC1YcPUT3S64rrNp
	HuCKoJJ5VuPdF+S4F4znEJSKIoEd9pxFvcd9dKx+oLoZw8NGLutJxORSgCV0N3o5iVUq0LMy/2g
	EzyOBz6TjNdctJpOxo1MDixXBT2O+PwLt7jGDeOdfLZTQzWAxt162ZvVTfidwa4ZYRp4dIQONLh
	Nolfb54n+0XxA8oObW891k/hotXNpMDq1/t0Q2/fQ4bQpy1n9HhBOPkw==
X-Google-Smtp-Source: AGHT+IEbJeTrLY46fCznAtjfXdYPHTUtYeQtitUWoI1YXftLHuYFMPldzZFqKU9cjG8M/We/w9d/JA==
X-Received: by 2002:a5d:588b:0:b0:42b:411b:e487 with SMTP id ffacd0b85a97d-42cc1cd920amr16516595f8f.2.1764066541445;
        Tue, 25 Nov 2025 02:29:01 -0800 (PST)
Message-ID: <9922cb86-5c48-464f-a811-05a7a4b4a9cb@linaro.org>
Date: Tue, 25 Nov 2025 11:28:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 05/15] qga: Use error_setg_file_open() for better error
 messages
Content-Language: en-US
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
Cc: arei.gonglei@huawei.com, zhenwei.pi@linux.dev, alistair.francis@wdc.com,
 stefanb@linux.vnet.ibm.com, kwolf@redhat.com, hreitz@redhat.com,
 sw@weilnetz.de, qemu_oss@crudebyte.com, groug@kaod.org, mst@redhat.com,
 imammedo@redhat.com, anisinha@redhat.com, kraxel@redhat.com,
 shentey@gmail.com, npiggin@gmail.com, harshpb@linux.ibm.com,
 sstabellini@kernel.org, anthony@xenproject.org, paul@xen.org,
 edgar.iglesias@gmail.com, elena.ufimtseva@oracle.com, jag.raman@oracle.com,
 sgarzare@redhat.com, pbonzini@redhat.com, fam@euphon.net, alex@shazbot.org,
 clg@redhat.com, peterx@redhat.com, farosas@suse.de, lizhijian@fujitsu.com,
 dave@treblig.org, jasowang@redhat.com, samuel.thibault@ens-lyon.org,
 michael.roth@amd.com, kkostiuk@redhat.com, zhao1.liu@intel.com,
 mtosatti@redhat.com, rathc@linux.ibm.com, palmer@dabbelt.com,
 liwei1518@gmail.com, dbarboza@ventanamicro.com,
 zhiwei_liu@linux.alibaba.com, marcandre.lureau@redhat.com,
 qemu-block@nongnu.org, qemu-ppc@nongnu.org, xen-devel@lists.xenproject.org,
 kvm@vger.kernel.org, qemu-riscv@nongnu.org
References: <20251121121438.1249498-1-armbru@redhat.com>
 <20251121121438.1249498-6-armbru@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20251121121438.1249498-6-armbru@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 21/11/25 13:14, Markus Armbruster wrote:
> Error messages change from
> 
>      open("FNAME"): REASON
> 
> to
> 
>      Could not open 'FNAME': REASON
> 
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> Reviewed-by: Dr. David Alan Gilbert <dave@treblig.org>
> Reviewed-by: Kostiantyn Kostiuk <kkostiuk@redhat.com>
> ---
>   qga/commands-linux.c | 11 ++++++-----
>   1 file changed, 6 insertions(+), 5 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


