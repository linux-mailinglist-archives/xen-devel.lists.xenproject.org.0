Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CB4F2C83759
	for <lists+xen-devel@lfdr.de>; Tue, 25 Nov 2025 07:24:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1171652.1496662 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vNmTU-0005k3-Aa; Tue, 25 Nov 2025 06:24:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1171652.1496662; Tue, 25 Nov 2025 06:24:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vNmTU-0005hm-7j; Tue, 25 Nov 2025 06:24:28 +0000
Received: by outflank-mailman (input) for mailman id 1171652;
 Tue, 25 Nov 2025 06:24:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=RmC5=6B=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1vNmTT-0005C3-E3
 for xen-devel@lists.xenproject.org; Tue, 25 Nov 2025 06:24:27 +0000
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [2a00:1450:4864:20::42b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 63a0222d-c9c7-11f0-980a-7dc792cee155;
 Tue, 25 Nov 2025 07:24:25 +0100 (CET)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-429c48e05aeso3152498f8f.1
 for <xen-devel@lists.xenproject.org>; Mon, 24 Nov 2025 22:24:25 -0800 (PST)
Received: from [192.168.69.210] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42cb7fd8d97sm31796036f8f.42.2025.11.24.22.24.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Nov 2025 22:24:24 -0800 (PST)
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
X-Inumbo-ID: 63a0222d-c9c7-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764051865; x=1764656665; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Vq1z7uETBPWyiFMQkSi+G7SH23QCq9t1LMUTYPMDnpc=;
        b=w+2NfQYCwO65wypMVyXChWew9B0B35JQVw5Dlj8gGc7UIy9REUQ/41ZCaODiU5IHHt
         QtLmDURWrsmgzeKA6ShV0mjY+bacawqWdmaa6YMQfH2jqdFTFqmYrPjb93OL6rcAxWQ+
         /VZ/YkL47vbZD+1Pb0qYhnmcbdbJhznKZwghYTrXbvHHijW4FP1GPzihrOfsLMQkPL2Z
         F3lqnG4CHt1mwuzKyzZwyjS49lE3cUroWE6XHqyvp4cqNOH4flsnk1755KwXTP3GzU0T
         MM+HGSZcWlwVUrAEfUAa3Wk36pcyeU/hDnkICftuBNaDwbPrNHlj47m7O8OGSBAb/nZ9
         AY9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764051865; x=1764656665;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Vq1z7uETBPWyiFMQkSi+G7SH23QCq9t1LMUTYPMDnpc=;
        b=llYhHvVbg6OIzU3nraAPCmyaUbvGuOn2WQtl8G5QrMdd/3HPGQofHcPYjtP40GjPDC
         LPj3QnodA8HU2c434rC+oycF6f2/VANosj33qzjHbZrGU0qnTY/ho69Yna5GTfzvuh9W
         X6TyLwwCHuwsR+BRuX+dqRiKbN3pRCXwJ8Kl/EbhHijV5cDV9fBHUjTzkmOYnhvhItQh
         flww2XMfuIYBbIesxZKC0PktsJkRqdc75vrXtjbH5KYDYcIhMfF1vjvOsymjEwEwffwQ
         0ljpfMQrTLKi1ILIR/f+uJ284GT1korOhG+QVD+Z2hB2+fiwzj2Qej/B7GlImxhQK+3V
         OTbA==
X-Forwarded-Encrypted: i=1; AJvYcCUjJx/FE24TX2krc2IxNqv+FE0XYnLWzDGF8Pm0jcE3LJKQFyimUWppk8EifGTFRuVww1UrtBUEQRI=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxai/HyG9MhAQxQqTwjayMHxO4XRVREDIMesh24O6GTh0v4VaeB
	rGcCUTRtmWTBy/ZdcjXKol9fwhJFmqUpF/ilBPwR7fJVz0BHWz7dntMv19aBMXBoQd8=
X-Gm-Gg: ASbGncvNVfjtegucVRiDs4CiOSIKBCunNNrVbJtMI0mLJqaumuiS/rcgBU4oMRG6V6H
	WUj4OMAaoacf3mAWrYitmtskOnGkGoKQSZh3A+BVDZTE99gyF/AeaZD+skLv0yyjRrhR5/dshUp
	aB744abfJG4gj9YwCnrmle8OvUEa27wrgcG/CbxHWrHp+bhHXWgbMTym32gjqff/YNktceeVg5c
	60BlMcOSRZ7zWNVum/xamyv9a8MjYtuaUsNjUBVy1l5+8b0quTP8iLRm1px7Fhr4vpuGJpFci6r
	lacDl37Ukb6VTWcWSqFWFMVp7rxJTokCTv7PrNiTu4TMzrlMHfEuSi4jefEGP7jDiFxWQZAYLmT
	u/TUwgr/RDSc3yKW55Tl/1EXq/6TQNm35ugVr+48jwf6+cq0jIDPp242234x/DjBAyJAsIbomAL
	iwJWzNrtjbOKh7vFjsoVETtSi5y3EQo1+mWTfZbeAsdg4D4lNACY1/daGpmxu3B3NV
X-Google-Smtp-Source: AGHT+IEaf9VPAlvbB+DJWu+zfTWBlEbYA/AGQ5BPVvtwmDg4JvdCIECBmvF4Zcsn6awffVSNfsJ6Hw==
X-Received: by 2002:a05:6000:228a:b0:429:cc39:99c0 with SMTP id ffacd0b85a97d-42cc12f1bddmr17201116f8f.1.1764051865045;
        Mon, 24 Nov 2025 22:24:25 -0800 (PST)
Message-ID: <f356b3c8-ed08-4ec9-93c8-dc9dc6accc59@linaro.org>
Date: Tue, 25 Nov 2025 07:24:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 14/15] qga/commands-win32: Use error_setg_win32() for
 better error messages
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
 <20251121121438.1249498-15-armbru@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20251121121438.1249498-15-armbru@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 21/11/25 13:14, Markus Armbruster wrote:
> We include numeric GetLastError() codes in error messages in a few
> places, like this:
> 
>      error_setg(errp, "GRIPE: %d", (int)GetLastError());
> 
> Show text instead, like this:
> 
>      error_setg_win32(errp, GetLastError(), "GRIPE");
> 
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>   qga/commands-win32.c | 16 ++++++++--------
>   1 file changed, 8 insertions(+), 8 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


