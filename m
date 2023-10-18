Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 51E887CEC0B
	for <lists+xen-devel@lfdr.de>; Thu, 19 Oct 2023 01:31:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.618822.962973 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtFze-0002rs-HD; Wed, 18 Oct 2023 23:30:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 618822.962973; Wed, 18 Oct 2023 23:30:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtFze-0002os-Dy; Wed, 18 Oct 2023 23:30:26 +0000
Received: by outflank-mailman (input) for mailman id 618822;
 Wed, 18 Oct 2023 23:30:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=w+tR=GA=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1qtFzd-0002om-AE
 for xen-devel@lists.xenproject.org; Wed, 18 Oct 2023 23:30:25 +0000
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [2a00:1450:4864:20::236])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4fc11fea-6e0e-11ee-98d5-6d05b1d4d9a1;
 Thu, 19 Oct 2023 01:30:24 +0200 (CEST)
Received: by mail-lj1-x236.google.com with SMTP id
 38308e7fff4ca-2c50cd16f3bso78891231fa.2
 for <xen-devel@lists.xenproject.org>; Wed, 18 Oct 2023 16:30:24 -0700 (PDT)
Received: from [192.168.1.10] (host-92-26-107-252.as13285.net. [92.26.107.252])
 by smtp.gmail.com with ESMTPSA id
 m36-20020a05600c3b2400b00405bbfd5d16sm2940958wms.7.2023.10.18.16.30.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Oct 2023 16:30:23 -0700 (PDT)
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
X-Inumbo-ID: 4fc11fea-6e0e-11ee-98d5-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1697671824; x=1698276624; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ewCKmGXOJvZOSgMbWns6ex8vwXVdo6mv1Ve49Ck6p6c=;
        b=HLijXH62XsIYDxuLTPdn8uosuyfCWeN4T/ImkyHifsaY9nfFYfkv/bn+lLBK9x0DC1
         w7AlT0XdVt+p/wlmwbWe5E63ZFdDPBb8bsqq71BDLOm9qWiMHkFP6eZwxek94SfrjDJd
         tgqcOrulLEyh/5wFfZw5ZcjMsZnirYTo1WFXk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697671824; x=1698276624;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ewCKmGXOJvZOSgMbWns6ex8vwXVdo6mv1Ve49Ck6p6c=;
        b=Jlvjv5GiCZ+yZvjzKJSR/rtiE9cbS8idqc0HGUs3ph8ytobsmQIFVPz/GK5A3NmJ8r
         B8PUzhqocSqpSd/XHM/5jgv1Un8fa48w6s6sNMfrrYuo3Cd39ynpvFtqE9o5oXANLoUu
         eYLVpxQn0tZlL5i+3uJbZLEJm/mNNBHz+SCUY0YSIjDTEBSpAyjWjd6jUMgLz7JOu6X7
         2lWOQC+gWJojQnLue0MT3gaj2Ui26LXC6Lml81DE5+i9tWRNIA95TrBDXFsOeyfyWcpk
         seruD5riPB02g6twqdoBTZ1Knn/LONyfdtlHvaQtdQ3I/rgZ6rk/hYz3ciGFrG1X7O74
         UqWQ==
X-Gm-Message-State: AOJu0YxBRJV1ny2cZ13LKJ/qTvHIKqydU35iy6a9DYZFj3lNKaVqEloQ
	oYeUy2l4vQOAYgnZRkj+f1SdUg==
X-Google-Smtp-Source: AGHT+IFXfcVC8coGZrSkW/k9kwFcaVAR40K9xME9FADxa7quLR4131chr6/qBoBBMCiWdlZKM84mqQ==
X-Received: by 2002:a2e:a233:0:b0:2c5:11fe:53af with SMTP id i19-20020a2ea233000000b002c511fe53afmr232403ljm.17.1697671823656;
        Wed, 18 Oct 2023 16:30:23 -0700 (PDT)
Message-ID: <33c1d5b2-8652-43b7-be7a-699db144e911@citrix.com>
Date: Thu, 19 Oct 2023 00:30:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] automation: improve checking for MSI/MSI-X in PCI
 passthrough tests
Content-Language: en-GB
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, xen-devel@lists.xenproject.org
Cc: Henry Wang <Henry.Wang@arm.com>, Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <cover.550599c54c91da4f8417fde358992e75bf8163c0.1696557834.git-series.marmarek@invisiblethingslab.com>
 <18b10f667f2df986691ed299f7640724618ec95a.1696557834.git-series.marmarek@invisiblethingslab.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <18b10f667f2df986691ed299f7640724618ec95a.1696557834.git-series.marmarek@invisiblethingslab.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 06/10/2023 3:05 am, Marek Marczykowski-Górecki wrote:
> diff --git a/automation/scripts/qubes-x86-64.sh b/automation/scripts/qubes-x86-64.sh
> index 5464d10fc343..842e6fae7204 100755
> --- a/automation/scripts/qubes-x86-64.sh
> +++ b/automation/scripts/qubes-x86-64.sh
> @@ -90,23 +90,18 @@ on_reboot = "destroy"
>  
>      domU_check="
>  set -x -e
> -ip link set eth0 up
> -timeout 30s udhcpc -i eth0
> +interface=eth0
> +ip link set \"\$interface\" up
> +timeout 30s udhcpc -i \"\$interface\"
>  pingip=\$(ip -o -4 r show default|cut -f 3 -d ' ')
>  ping -c 10 \"\$pingip\"
>  echo domU started
> -cat /proc/interrupts
> +pcidevice=\$(basename \$(readlink /sys/class/net/\$interface/device))
> +lspci -vs \$pcidevice

Actually, I know I said I had no more comments, and maybe this is one
for further cleanup rather than for now, but wouldn't we be much better
using a heredoc?

read -r -d '' domU_check <<"EOF"

lorem ipsum, no \ escaping " or $

EOF

If nothing else it would make the innards of the more readable as a
script fragment, and less likely go to wrong with variable expansion in
the wrong context.

~Andrew

