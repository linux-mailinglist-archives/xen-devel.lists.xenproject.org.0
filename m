Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B3FBFC8371D
	for <lists+xen-devel@lfdr.de>; Tue, 25 Nov 2025 07:18:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1171584.1496602 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vNmNT-0001BT-Ed; Tue, 25 Nov 2025 06:18:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1171584.1496602; Tue, 25 Nov 2025 06:18:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vNmNT-000194-Bk; Tue, 25 Nov 2025 06:18:15 +0000
Received: by outflank-mailman (input) for mailman id 1171584;
 Tue, 25 Nov 2025 06:18:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=RmC5=6B=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1vNmNS-00018p-7m
 for xen-devel@lists.xenproject.org; Tue, 25 Nov 2025 06:18:14 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 859a15e4-c9c6-11f0-9d18-b5c5bf9af7f9;
 Tue, 25 Nov 2025 07:18:13 +0100 (CET)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-4779aa4f928so42164555e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 24 Nov 2025 22:18:13 -0800 (PST)
Received: from [192.168.69.210] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-477bf22dfc1sm231064705e9.12.2025.11.24.22.18.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Nov 2025 22:18:12 -0800 (PST)
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
X-Inumbo-ID: 859a15e4-c9c6-11f0-9d18-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764051492; x=1764656292; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DGzD1fnYIa6B4Wk/+xHq8vM1YIpJLnhM/vaTxvSqse0=;
        b=E2jnJ/uw/6x9odyPCyV4mz9JtrD4EHGteX16oYYt+ZBO7BlUpQ4W70niZADjWUC62O
         02XLB4UDSm6FREbMeGvnXjGsA3iptN49s2U7VNBrDSRKzi2l5X2t9fnLVXvtvENzQfNi
         o4j1jP72uYXu+dwhCqlTpaAlSscRRuUX9Q8u40E0KL6G1TdDiLoXLUMyIH+Xy2ayEovg
         CyEnopaWtTQ4N9QnJfjyew0h8rpObJLVuCX8pdWOZAO0NWT/OOsFy7WbPfOOIM9agQuG
         mnMC4s0qs552Zb3U1raEzo/zOInY1pgy6tob8ERAKYQHBmAYlm0gd/95jYk6aaqNNBoc
         gg9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764051492; x=1764656292;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DGzD1fnYIa6B4Wk/+xHq8vM1YIpJLnhM/vaTxvSqse0=;
        b=ZCOO4itNLNSulyrUFymepIA80FXC6WCn+GEgUJAjJLp8c5MRwFHFbf3ao1U9ZlJUn3
         a9w7pNNO9L6aHEFHspPAup63OOfRgmZmyUmwVh4xdP+b/IkR16p9QZXEnCCb6agYQoO2
         Ynxc7Ie2k5Vt1Zsbi2IAeyY/FFB+dDkDKTPqOwyDSOzdGonkwDOd0lRgT7sDSmrNsz9a
         GxbLaei4tNDmTdKo4x10ufHo0OJu6eSZP8OveQc1pbW/gJjisGdslksxr4f522XMmzHO
         oweESHHmB5bGNS1e3Z5rro0Kokv2xiqGmTQduXh7EXMWmDPDAyrXG0bWm1TCmldMxuuK
         xaDg==
X-Forwarded-Encrypted: i=1; AJvYcCWml4t3j1XoDGLAFn5YUOnHZ0kHeQnEudqDOUvLOWlC/t5Duq9HLPeY0noJ8PlhCxoSQ+um2Wo4v7g=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx2urYip5xUeHnFs0NluroHY95G7GaRe9pBvqAxe7cAd6QwjJCP
	SlzIA9hFQyH52mvp8zJ38ycjsUnLmO7x+E8NX9KG6JqFwgiIcFMcGzBAzAJ6rVvRb8w=
X-Gm-Gg: ASbGncs7Zsn7pGqxus8GN7R2ehUJXcPt7NZjol1cYrqzlh1ehz3YKYTrdF9tSZgfjvc
	/KOcTlcxENAWGDsdSyyQIDAg9uPeuztbqbAmHH8uWLiRKa1G2x3MYvyV3xb9FgUlonwFFLFOFbO
	Ncyc/plhgWeK9TjUKtIOqt6bqHzqhgcvC+xrYTF2NsvKT5XKMH0RHukhGhzJlPAZlQsesCsKQWm
	obLmoNDUdwDxh346MyGTERmtpMiMQDGopLP+z5iAQAic56It+4cKRldaxB+Yf8lSRMpANtoiM+G
	vKjeWsCBzQv6bWAWCn2ySRnW8wW8vJhvv4jrZ9nNdnt11e6frn6RMumUFRnKerV7vWiL8VqfjYY
	VXkoFMqmzOnFdKbdI4Sg2MyjC+tYR/RC9Rcrhu63OXQbyGW7XndAOHlTMSIPS2SZ+xTxjJr42NY
	LXqFX7ke/7xnydMquYZ5laTBALgpS0B4ESw9Wey/XzjJeAJ6fM2PVxLDzbU+vgoKlH
X-Google-Smtp-Source: AGHT+IFEapOZrwVKXPqkXWl1ucGf2xeCrDksHj/tDIzv3GC9v5QhNc1aLWWWmC76do8k0bUg496w7A==
X-Received: by 2002:a05:600c:1c87:b0:477:98f7:2aec with SMTP id 5b1f17b1804b1-47904acef12mr14113255e9.3.1764051492559;
        Mon, 24 Nov 2025 22:18:12 -0800 (PST)
Message-ID: <37f651b9-06b5-4264-966d-f8c766df6be8@linaro.org>
Date: Tue, 25 Nov 2025 07:18:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 06/15] hw/scsi: Use error_setg_file_open() for a better
 error message
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
 <20251121121438.1249498-7-armbru@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20251121121438.1249498-7-armbru@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 21/11/25 13:14, Markus Armbruster wrote:
> The error message changes from
> 
>      vhost-scsi: open vhost char device failed: REASON
> 
> to
> 
>      Could not open '/dev/vhost-scsi': REASON
> 
> I think the exact file name is more useful to know than the file's
> purpose.
> 
> We could put back the "vhost-scsi: " prefix with error_prepend().  Not
> worth the bother.
> 
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> Reviewed-by: Dr. David Alan Gilbert <dave@treblig.org>
> ---
>   hw/scsi/vhost-scsi.c | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


