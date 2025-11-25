Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 561C8C8373B
	for <lists+xen-devel@lfdr.de>; Tue, 25 Nov 2025 07:21:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1171616.1496632 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vNmQ9-0003hj-B7; Tue, 25 Nov 2025 06:21:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1171616.1496632; Tue, 25 Nov 2025 06:21:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vNmQ9-0003fI-7t; Tue, 25 Nov 2025 06:21:01 +0000
Received: by outflank-mailman (input) for mailman id 1171616;
 Tue, 25 Nov 2025 06:21:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=RmC5=6B=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1vNmQ8-0003f8-15
 for xen-devel@lists.xenproject.org; Tue, 25 Nov 2025 06:21:00 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e7c966ff-c9c6-11f0-980a-7dc792cee155;
 Tue, 25 Nov 2025 07:20:57 +0100 (CET)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-477a2ab455fso54489375e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 24 Nov 2025 22:20:57 -0800 (PST)
Received: from [192.168.69.210] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-479052a7330sm7911945e9.3.2025.11.24.22.20.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Nov 2025 22:20:56 -0800 (PST)
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
X-Inumbo-ID: e7c966ff-c9c6-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764051657; x=1764656457; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IHdaIX7rwIeWEffIotS9OpDD12xZA8o++Mo+VV+T6/Y=;
        b=kV/KhdjHOrOaj58oRTKFnQiS/zoIRakx4xgp19QYPeStCVvkHGeqvLgiNMfKF8bpY8
         ztMv0Y4BtrzwKzCTRnSHk8orUd4MoUC7KO9XxOXjJ3NXkUhPVlJbzblkyQq+jrWUNFmd
         AE2rKR1erLigT/mabtQ8AANKx0DkDlJGXuupRBguPXuhTPYxnBMpUfsTUEoZFNz0IGOT
         u79dTKn7ElRc0wW+UkXWJdt9t0X/+lIuHc3S3A58CN5kI9thr9Oo2SIw6qHGD8i6zGLF
         1mrHnhAE2xqoul02Yjz7LSSbMt6F6t7NP+IaGPl5eeJ/mj1au7u4zlCcZMgNdRQR5ZMU
         gXkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764051657; x=1764656457;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IHdaIX7rwIeWEffIotS9OpDD12xZA8o++Mo+VV+T6/Y=;
        b=O787m5pw1JYhgJhAS1TA/pzF6WzSDsHPEOJ61iHd8dRsR2bpab5LE7sTJmC6BKf1L5
         zrmdG43JQ6U+xtijDGgqKnc0r4JtNFs3Ntv/oSqNy1whebaNFgSifpnF2/P+Zk01Yo7M
         iXxBKtxhsZFNX+1NSxkWwpy1A2w8DvWAZ+S/6R1pnqQreeb6VoCKrUtOAcbaWko8bbut
         vh8DZGGuBjbXrtxKafxkMERKEAxG8j2AGkcxGurbHTT3HZ67wCy8nIIvB/Q728Vnv+b2
         qHFfCmLD5aJWlJUeinvYJBLBmKhGvAW39ctwMwEqGfJz3EMm6zpz1Hy5YIexlQeqzoQj
         kvHg==
X-Forwarded-Encrypted: i=1; AJvYcCV65V+Wnp19igYVtoXQprUKrU10uWxBeDp8RqT7UiSzEU+KrXZMa69MSDiqzZXO3/VpN3nxR0A21qM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyhQRKspRz868+uwb0DgHVky+vvc0sel4BOqFKqSIDJCek8N3JY
	mxvHkDCfC8nAYPm84Mv2OFPHoAH2HtIoZyYZgXiApj+KFv8ZXUPGJk7vaMHmItJuTgw=
X-Gm-Gg: ASbGncs8o8qFN5w0MRcKJtwFuheoPjSP5WMk3Zymq+F5kLwFS3E43Vj6qthgxUZE+DI
	V7OX3ENbTnizv0yg6QzIvG08Ct4aYUjq+S3cRlk8EJU2PNfF0iDIB8cEOP5ZWrQBHylfuK2uEhm
	MFoYmjAoQ/AM2QqTLwVfXqT1xfOATmLLUMJ9TIjmlCXVb0fcsoOe4iWRjjQn1FssIgRUTvhV3cx
	xbNHTu9vELXOa5/5gTH+gAD2dRzvVlaUOg/2OBPQr47kopVLJUEChYvT9LyFnvVUR5MAHsEYGAm
	UyPs0tmkk1ZzhDPgPfqYCxrsba4n2KDFKMnfCBV/rby/bAmwOoLdK874V/T/fxTBa7ILcPxSIdZ
	3ToFhU324pHGXuR8+ilxNaRnB9EBK9yN+PR7/n76j1ySDUF9h5zR8qB+pBLkdLDTl57GpguHFkC
	V6QHv+24hgkt90Rv2UoT1UV0/nbTSx7GNkCKifTfoWJrgRWIjIXwb8Jw==
X-Google-Smtp-Source: AGHT+IGHe0GiKC1Okv4GPlfi6I2wY+Fb1eNjMNxPpHleM142ga2JmmwQ8xf+kkSIPlYpCGBLlQhrpQ==
X-Received: by 2002:a05:600c:45d1:b0:475:dae5:d972 with SMTP id 5b1f17b1804b1-477c1123afcmr152637055e9.23.1764051657266;
        Mon, 24 Nov 2025 22:20:57 -0800 (PST)
Message-ID: <ff36ffaa-1a17-41b0-bed2-0fa38fead91e@linaro.org>
Date: Tue, 25 Nov 2025 07:20:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 11/15] net/slirp: Improve file open error message
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
 <20251121121438.1249498-12-armbru@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20251121121438.1249498-12-armbru@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 21/11/25 13:14, Markus Armbruster wrote:
> This error reports failure to create a temporary file, and
> error_setg_file_open() would probably be too terse, so merely switch
> to error_setg_errno() to add errno information.
> 
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>   net/slirp.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


