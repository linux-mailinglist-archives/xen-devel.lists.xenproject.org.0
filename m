Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A3316C8375F
	for <lists+xen-devel@lfdr.de>; Tue, 25 Nov 2025 07:25:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1171663.1496671 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vNmUB-0006Fa-IE; Tue, 25 Nov 2025 06:25:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1171663.1496671; Tue, 25 Nov 2025 06:25:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vNmUB-0006DA-Fc; Tue, 25 Nov 2025 06:25:11 +0000
Received: by outflank-mailman (input) for mailman id 1171663;
 Tue, 25 Nov 2025 06:25:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=RmC5=6B=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1vNmUA-0005xb-6H
 for xen-devel@lists.xenproject.org; Tue, 25 Nov 2025 06:25:10 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7db69476-c9c7-11f0-9d18-b5c5bf9af7f9;
 Tue, 25 Nov 2025 07:25:09 +0100 (CET)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-477a1c28778so56101685e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 24 Nov 2025 22:25:09 -0800 (PST)
Received: from [192.168.69.210] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42cb7f34ff3sm32968445f8f.16.2025.11.24.22.25.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Nov 2025 22:25:08 -0800 (PST)
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
X-Inumbo-ID: 7db69476-c9c7-11f0-9d18-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764051909; x=1764656709; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kq1R/KnIl0tjtGNpVBFK4blvRpvREmYvjs4Wzx+ZU8A=;
        b=K4JWjLvSxFoye4FtwmsQE+5lsnMWB95IJ6inVhsB9209x3AG/y8skICSJuwerrjltr
         MgE5Okjut5kkRnJuAo4UvvuJnW3mTeoza/sc6+ZWUQHFnqrwIkJF7dZzM9k70a2VsHCg
         HAVJRciNsOZSIbsOQJd7puvk8RsZgvRxlnDzbZ5Dek+2Q06z6X0fSkVmgEJpblKx8qIt
         64kYBZTf23YKg4jsqtxdFgjjLp0W7Q0xihX6245glpb24ghxwPCVUlwPSDEB9LsUtD9Z
         0xmPcxBdLThvrFE2OJGd04rLarXqVF7b+xoCc75fO4cvuAFpfbQhax3LBH5h3DSxbBVS
         YI7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764051909; x=1764656709;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kq1R/KnIl0tjtGNpVBFK4blvRpvREmYvjs4Wzx+ZU8A=;
        b=U4NsrhDkoiSeVjNCxJT2jZukhnOMJ6CIABMR5UfbRHN2XxNGqUVUMxBpigEH3FKEb7
         +s19RsqPu9S6oVw3hjTSINEcWtGz8KuJFU932U78xebuW5rQ7qocz/1mnrXL5848UmME
         V4F0ey73m1hGZ/VPp5hzqb6x6UB5YWFNBx3fPrYachaZzDHeeGZqFsminvj1uYIp7gc+
         va7eiMnI5DG4F+S5WJnJLbhAy5z0qqikrVBliofJ5T+Usr2Bu2CBVpeXDpXEAXsKuZ1l
         VpREMCC6IwCF27IfdLPEkh+0caDaUwYuxUBV/4SFeUGTAp13YTbEP+mpVdclJHar/HRK
         jZoA==
X-Forwarded-Encrypted: i=1; AJvYcCUsp6cAD6PIqdcHcnVyVXPnaUmefo6Gd3zzMeA/rWCjsuPpEenFjXbo2TNTu3yBKQNuAeARikj1r5A=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwqHANReSDYDCfRcrCaDXwdU8t+mTlyT0thQezTUaxYJo8d5JVQ
	goK4dFTpZpYRBFJyDJmMnmSqtsdktusTkH6G0mZGNnYy5goH7TN66VYlJTfF5i9qyw0=
X-Gm-Gg: ASbGncsSGBbRnOPfs+bZKBC9VUDQBId8CZzLFMko9Dqc/Sef7sAhKVm2l+caE01p/K/
	RtCIlZabIkBTjrazZPh6jwuC2w3jsoWg76BSHn4sf1uL/uuS3kKIq8Ndj8U6AfZrzOZ8gSu6t/z
	n7XLZ++wf1LdsHIRfXULWN2eIMLCRTCVNnyK4hBYU8tDZgaJTMhJf0esVHe6Qk3Z1QMUt7vlbsd
	dqFwIbbKo4sW4qyXUOV7ZycbDdBltgCpDLjtT3NO6dtq9ZDQ5CUo9JoIGcJ5PBt9y26dy+PsA0k
	GVN/WNhKG4d8/R7gfVvXdCSmQh99up9q6Bw492xNBC0r8jZYgwSVZ90f6FOwTfDEpJHstQAoxFy
	MjBK82t82ZnWuiHgu3DXUk5uQBd+LUZi8m0prQKEfjZIMW7vPUzhrovgKgC4nZurvnxi2rUBqBP
	Z+EHbBrTyhYRbrlRc5qcAKF3Rf57zIbD1v5oBVH5Y6YQpRgEXc5Hw0yw==
X-Google-Smtp-Source: AGHT+IFprm3vCDsbWVJfgbV9xKa8iHTCEmXL664XoxSCOsyM7eQ2uIrryW9dfBTvUiv91/I4gz9/gg==
X-Received: by 2002:a05:600c:4685:b0:477:5b0a:e616 with SMTP id 5b1f17b1804b1-47904acaf28mr11379725e9.5.1764051908756;
        Mon, 24 Nov 2025 22:25:08 -0800 (PST)
Message-ID: <54be619f-1de6-47c6-993c-246fa6252596@linaro.org>
Date: Tue, 25 Nov 2025 07:25:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 15/15] block/file-win32: Improve an error message
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
 <20251121121438.1249498-16-armbru@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20251121121438.1249498-16-armbru@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 21/11/25 13:14, Markus Armbruster wrote:
> Two out of three calls of CreateFile() use error_setg_win32() to
> report errors.  The third uses error_setg_errno(), mapping
> ERROR_ACCESS_DENIED to EACCES, and everything else to EINVAL, throwing
> away detail.  Switch it to error_setg_win32().
> 
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>   block/file-win32.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


