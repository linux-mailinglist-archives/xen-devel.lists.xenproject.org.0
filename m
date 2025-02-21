Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C6DA6A3F869
	for <lists+xen-devel@lfdr.de>; Fri, 21 Feb 2025 16:25:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.894509.1303209 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tlUt2-0003c5-Vp; Fri, 21 Feb 2025 15:24:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 894509.1303209; Fri, 21 Feb 2025 15:24:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tlUt2-0003a2-TC; Fri, 21 Feb 2025 15:24:20 +0000
Received: by outflank-mailman (input) for mailman id 894509;
 Fri, 21 Feb 2025 15:24:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7TFm=VM=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tlUt1-0003Zw-Ht
 for xen-devel@lists.xenproject.org; Fri, 21 Feb 2025 15:24:19 +0000
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [2a00:1450:4864:20::429])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e9039423-f067-11ef-9896-31a8f345e629;
 Fri, 21 Feb 2025 16:24:15 +0100 (CET)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-38f1e8efef5so1354270f8f.1
 for <xen-devel@lists.xenproject.org>; Fri, 21 Feb 2025 07:24:15 -0800 (PST)
Received: from [10.81.43.157] ([46.149.103.9])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38f259f771dsm23466161f8f.81.2025.02.21.07.24.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Feb 2025 07:24:14 -0800 (PST)
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
X-Inumbo-ID: e9039423-f067-11ef-9896-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1740151455; x=1740756255; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=dJDBAxBXXq6N1wJrQCZ0JFw2XU1ubq2LliR2HN8OwHs=;
        b=pH7xZWR+qUf3ryQEtIz7xZbsu+TgyJ3DyJPqhPF1RVPpV706whJTuIObT4g9r2/sra
         cURLUFPAMc1znExVOPyEl1ZryfReXnCgaFv+3qSp/gx4TiJhHtvKGCWWZ2buTroZYlHU
         7w5WN6hYq3nj3h5Deq+i1/n77CzY8L6+y2mV4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740151455; x=1740756255;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dJDBAxBXXq6N1wJrQCZ0JFw2XU1ubq2LliR2HN8OwHs=;
        b=ibbIrvXCpMkO0q/mNqzSuY9YgYMRey5eZ4boAZKQN2vWwm6MgzEye7hGssxSw9v9UC
         x8q07aGCfhLTeIURglrTPZ4iGyjTNWzIfiXAB9VkE+YcK2hBYObRmfFP/Ap8bn/oGh1g
         HR2ZHS5kA998XXU19wriPhcaWqjaK4tIehpYvpLEE3/9ag/TUP7vJqBQ+cbn5OS8rOx2
         bUrTXe22i1URn27kVDk9YHmoHGhKN3VwR1tOjCPq9sAzzZGPjL0fGJiVo9uNGcsO27fq
         2h0G2HcdgmFyUIr17Ss3sFghPOnW6d0rT63hESemt6Vsemd8MmslEgIW7hcHCetWaJV7
         4OEQ==
X-Forwarded-Encrypted: i=1; AJvYcCVmnu4cbBZSHcqhmMmltWXMAe8DfQ0Ydm+LVd3+Zopa2Wi2ndxxkikFaz4coApU/i/DPhXoMmimPjw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwBye+2kBp0XYxeajU86ob0dWKVWnzNBIJoN3a3h4EBKTtAMieY
	DxOdxj/WkjF5lC7ee/sdYZqeZcsvV3WNDZsBV+XseNRoeyEgHNtnD25rY8kHcs0=
X-Gm-Gg: ASbGncuqjNxgNzlOVlxdKfkLOYSU7k/uI5nibAtRLMSrmc/NFrtwIm2ALdRx3OcyNSC
	+U/GXZnpozqduGwDCpQ9E66q9YQtUoZ6bejWs3UPn/gI2g2MzjTefNyvP93UQWkuL79ltPbOCB7
	v6Y4FVRqUN55dC8808FMk67e+nX5HshBeIDdFILFSiyhPt0JNFeWgjj8WEcz7n9kPGxSR1ylrrG
	vjMTt8QPQ+9PvCB0LzvaI9irUKUsDS+7UDxaxDBugo5HtPb63XbV7fu18D0XbrlV3qa6mtYS+Oy
	+LnSNqGJy7Xj1yuytgC9oRorF2YPY34u5BE=
X-Google-Smtp-Source: AGHT+IExDMKsBEQ9f21JE6JN43WVIHZ+1B2Q1ebRycRrdtbuIHDa150HauOAPp8BRWsunRR6UCe88A==
X-Received: by 2002:a5d:6482:0:b0:38d:de45:bf98 with SMTP id ffacd0b85a97d-38f6e755ebdmr3441895f8f.8.1740151454803;
        Fri, 21 Feb 2025 07:24:14 -0800 (PST)
Message-ID: <5bcd5f0c-e9b6-46ae-a6a9-dac00ae15c43@citrix.com>
Date: Fri, 21 Feb 2025 15:24:13 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] automation: upgrade arm32 kernel from bullseye to
 bookworm
To: Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
Cc: Doug Goldstein <cardoe@cardoe.com>, Michal Orzel <michal.orzel@amd.com>
References: <alpine.DEB.2.22.394.2502201453560.1791669@ubuntu-linux-20-04-desktop>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <alpine.DEB.2.22.394.2502201453560.1791669@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 20/02/2025 10:56 pm, Stefano Stabellini wrote:
> automation: upgrade arm32 kernel from bullseye to bookworm
>
> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
>
> diff --git a/automation/scripts/qemu-smoke-dom0less-arm32.sh b/automation/scripts/qemu-smoke-dom0less-arm32.sh
> index 41f6e5d8e6..0c94e662aa 100755
> --- a/automation/scripts/qemu-smoke-dom0less-arm32.sh
> +++ b/automation/scripts/qemu-smoke-dom0less-arm32.sh
> @@ -11,7 +11,7 @@ serial_log="$(pwd)/smoke.serial"
>  
>  cd binaries
>  # Use the kernel from Debian
> -curl --fail --silent --show-error --location --output vmlinuz https://deb.debian.org/debian/dists/bullseye/main/installer-armhf/current/images/netboot/vmlinuz
> +curl --fail --silent --show-error --location --output vmlinuz https://deb.debian.org/debian/dists/bookworm/main/installer-armhf/current/images/netboot/vmlinuz
>  # Use a tiny initrd based on busybox from Alpine Linux
>  curl --fail --silent --show-error --location --output initrd.tar.gz https://dl-cdn.alpinelinux.org/alpine/v3.15/releases/armhf/alpine-minirootfs-3.15.1-armhf.tar.gz


This isn't even deterministic, because it's always taking the latest
debian kernel.  Can we please get this into test-artefacts so it becomes
stable.

Also, do we really want to be mixing an up-to-date debian kernel with a
very obsolete Alpine initrd?

~Andrew

