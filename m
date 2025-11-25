Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 93257C83747
	for <lists+xen-devel@lfdr.de>; Tue, 25 Nov 2025 07:22:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1171628.1496641 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vNmRY-0004eM-L6; Tue, 25 Nov 2025 06:22:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1171628.1496641; Tue, 25 Nov 2025 06:22:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vNmRY-0004cK-Hw; Tue, 25 Nov 2025 06:22:28 +0000
Received: by outflank-mailman (input) for mailman id 1171628;
 Tue, 25 Nov 2025 06:22:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=RmC5=6B=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1vNmRW-0004c7-KR
 for xen-devel@lists.xenproject.org; Tue, 25 Nov 2025 06:22:26 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1b6218c2-c9c7-11f0-980a-7dc792cee155;
 Tue, 25 Nov 2025 07:22:24 +0100 (CET)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-477770019e4so43579295e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 24 Nov 2025 22:22:24 -0800 (PST)
Received: from [192.168.69.210] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-477c0d85360sm227844905e9.15.2025.11.24.22.22.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Nov 2025 22:22:23 -0800 (PST)
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
X-Inumbo-ID: 1b6218c2-c9c7-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764051744; x=1764656544; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=f9PMY82i/jaFQBwB85/CZ8mIcoZUJob2eOmqwSq7Cyo=;
        b=WX8U22Fm4aSB8zRiz/jDk+3YRuJ4dRRuMp9Bb7+ntcQRh88gEqSKkok7xsoCtDK85R
         CysO6D9p/y0imCCL8LmQm5gpE7dLlj/+GQcSuj4QkphAR4uUqF8bJYTKP1RUuQdXdadc
         9VW1rhEpF/shCWsTcPPPPuCkBx9pT2RXwjJdhipALMns5a72SWOucu0HhGgJI5SpSNPq
         BgJoK14dqrgEzOiEKzvSa4yUQRb9diWRzlCEXD6Df0nz1p4kV35tkU+jLxVIgnS5/0Pf
         JwRumcGQKcn3CaVwS2CEqIQZe295fSvkbNLIHwH5vPMAkiSVvlALI4YMpfBKX1CGteBk
         loTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764051744; x=1764656544;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f9PMY82i/jaFQBwB85/CZ8mIcoZUJob2eOmqwSq7Cyo=;
        b=BcdJuKrEX5wPWA+G3oF0IMyb64jV8SjHAJoivQ6uVjuWy+Bl4+zvNl/TAzSNgxp8FU
         GmErVcRXMYD96yXWk9u2gb9L9DE4O5RkOv/vsTGv1FfhspnUpXzbIO6uFaYjlNJpeAIf
         9YRlrklwCkSzT3D1vG9ZUskg2n6Nt7dq1XLNbSAjmz5xLbUb7e9qebqJ5HRYS4FeMHtl
         HNpLtaWF6bbx+rkxTxWsOF3Jb+3gcrcqGsNSxuDtU1zNrX+HqSj+GI65SaKYrzVcTzgg
         g+CFJGJWzfBZoQJ3YTJ7AEyTCX5iR1RmGsz/nhGeDgpwRNzS3LwloXzXj7DYbVvejDik
         XQpw==
X-Forwarded-Encrypted: i=1; AJvYcCXm4wBiy4x1MXkBlivXEVNCe6KLtEQSL+N/NbsATut/myADxjEA7NCUtbwhu3Jh4CR1Fagc717Voy8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzT2xS+Ck/52ePS8WFe8KyOOm8gjPjmaUvrL1pCl7T6GrC+MEh/
	nJcn1vWkkKsO41bgDlYwfjp1fTt0qrS/K8Rid+aLIMWyku102cMrg1kDjsHRZ/wMjiA=
X-Gm-Gg: ASbGnctAzoqR5o9qiIWyRYYODpS1HO79LFavzN4Fc0x04Ewx6Lt37eFRGL+ei/MlVZT
	CIxyp+PgjPFfes/Y1W1VARpeG0BYZp52ze0cprFHr632LEN0agWKfPmV9TkMf2IGrmtLpKNMvwS
	HgLkUOsYY/OzUlBtoFCk3Xjsv3ASZDIIJ42CNiFI9bRRZLA4EIhQFeUryDY5nYgo+4WNzaRxFqv
	XOhr53ncgmdjXj3b3vz8RLTDzv49go6710F4+7lrpDurV1FnlxtL5WmahLizlPvTmfwOeJ6O6B+
	PGyvEeUGKbPIlat8KjUf7tYxOQzH41WuAw6RtDZ0HnlXgndB0RSNzKWqg6+Kp4pmrr4uiLAsXcL
	hecr/R0lnjVOQQ1b2FREn1KRcR9N0hxqfAUcRnyF8DkMppMK4Rrqcgjj5jjM3O+FXVJ1VhvTyW9
	zci7HDYaEm5GqtTIrNZak0jzwEZFH1vHD0T162q+6G/sJIq+jKiOyqmQ==
X-Google-Smtp-Source: AGHT+IFDchfo8wmvxExDOTScFL75Y50QSTKmA05qmrURNbKfXMlTq1TI/FEAoocUx4gEjb2eI/uz8Q==
X-Received: by 2002:a05:600c:1c87:b0:477:98f7:2aec with SMTP id 5b1f17b1804b1-47904acef12mr14222015e9.3.1764051743857;
        Mon, 24 Nov 2025 22:22:23 -0800 (PST)
Message-ID: <f992f60b-515f-4834-88fd-d033255bed83@linaro.org>
Date: Tue, 25 Nov 2025 07:22:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 12/15] error: Use error_setg_errno() to improve error
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
 <20251121121438.1249498-13-armbru@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20251121121438.1249498-13-armbru@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 21/11/25 13:14, Markus Armbruster wrote:
> A few error messages show numeric errno codes.  Use error_setg_errno()
> to show human-readable text instead.
> 
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>   backends/cryptodev-lkcf.c   |  2 +-
>   hw/ppc/spapr.c              |  6 +++---
>   hw/vfio/migration-multifd.c |  5 +++--
>   migration/rdma.c            |  3 +--
>   net/l2tpv3.c                |  6 ++----
>   target/riscv/kvm/kvm-cpu.c  | 11 ++++++-----
>   6 files changed, 16 insertions(+), 17 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


