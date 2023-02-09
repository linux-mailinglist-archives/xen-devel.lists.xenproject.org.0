Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D644B68FC41
	for <lists+xen-devel@lfdr.de>; Thu,  9 Feb 2023 01:57:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.492086.761492 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pPvFa-0007d9-2t; Thu, 09 Feb 2023 00:57:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 492086.761492; Thu, 09 Feb 2023 00:57:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pPvFZ-0007aU-WB; Thu, 09 Feb 2023 00:57:21 +0000
Received: by outflank-mailman (input) for mailman id 492086;
 Thu, 09 Feb 2023 00:57:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UnIs=6F=gmail.com=alistair23@srs-se1.protection.inumbo.net>)
 id 1pPvFY-0007aN-J6
 for xen-devel@lists.xenproject.org; Thu, 09 Feb 2023 00:57:20 +0000
Received: from mail-ua1-x933.google.com (mail-ua1-x933.google.com
 [2607:f8b0:4864:20::933])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b3490c28-a814-11ed-93b5-47a8fe42b414;
 Thu, 09 Feb 2023 01:57:18 +0100 (CET)
Received: by mail-ua1-x933.google.com with SMTP id u3so114902uae.0
 for <xen-devel@lists.xenproject.org>; Wed, 08 Feb 2023 16:57:18 -0800 (PST)
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
X-Inumbo-ID: b3490c28-a814-11ed-93b5-47a8fe42b414
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=4uHBjjVmNrtcdknf+hhlTiF9Ollq5qqhwybOZJGangk=;
        b=cCZ0rcl0R0zr6qzJQyvsivbSHn87dnZ0nh+2OUwXNOFNJPP5cOjSgJdykmEsoEp2V5
         +R6jvAWZSZv7GA7xzmQJT8UOHWa1ZGo4mVX6LZn8AjWWVxm9WBRazmcUm5T8fiuqRzIM
         aMEQ6lf42ABLKUgCSle97YW79ZD85Ff42dn6GTkDKc73n/aV69MxYR3+9oupw2bNaUC8
         TylyhZQepc/4Fqb8TFkDNNsI0S95ZnApmQ6WL3R4DBJ1ljShe7FrnRIKYOsfJGOaSMzY
         T3ktfdtu2KjGR/Sh3bFipSILRDceJcVmmQoKmhsvGR/sLG3CHHy9XgkPzYMn2+RrHaOz
         qTVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4uHBjjVmNrtcdknf+hhlTiF9Ollq5qqhwybOZJGangk=;
        b=6k0EJVkr5cYm+duP6SNaYf6lRoUZN34NNi6iHKw2gC0viPppQFQPPenh7maO+N8TLq
         MOih6QL8xnIIvPYBYWKGYpaUAeM1uFfdbyFzw+3wKuBWHc8szrzZd+gJu0N9/Aw/vDpB
         Tcc2vUulGbjv+05Jykp+xLV6GKQaBTfpc9fU1ZhBAHipIbrD/PLnpQS/mpvWZ0/2kFdR
         h0PpabhHmIShy7+C1eDqi8f3M8Gb3NSwykcaJwAt/K8C5uNwWOv98wWiSRDV5MGns8sJ
         fvFgUzPVHJULYXuD7N+7G7w72pauoRMGSUzZ76EKlrjB8Enkc+kvqUxd7EgfWGtO2n80
         BsJA==
X-Gm-Message-State: AO0yUKVZBUzllXIEK+Ndybi9BpG77IXQ8OXl48R6G/UPLgmNxH7//+Hx
	4ItRmj5UNvqpbU25gozMy70ymCKdd+o3pXpcQFQ=
X-Google-Smtp-Source: AK7set8FGJL8tZKfgggACdVWUfcy1hzFe5ek7l5CvvPOa1xap77UBHrR5J1xzkPZNAexHSkhUh8Rs7P9Le8d/96HV5o=
X-Received: by 2002:ab0:3488:0:b0:67f:50ba:4c23 with SMTP id
 c8-20020ab03488000000b0067f50ba4c23mr2272832uar.11.1675904237473; Wed, 08 Feb
 2023 16:57:17 -0800 (PST)
MIME-Version: 1.0
References: <cover.1675779308.git.oleksii.kurochko@gmail.com> <95527748699e6ab643dc2fdee634fe934ae12f60.1675779308.git.oleksii.kurochko@gmail.com>
In-Reply-To: <95527748699e6ab643dc2fdee634fe934ae12f60.1675779308.git.oleksii.kurochko@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 9 Feb 2023 10:56:51 +1000
Message-ID: <CAKmqyKPOo3aSD3aBwkwx=VspcteTGPf+J09MbVcJiROarKspag@mail.gmail.com>
Subject: Re: [PATCH v3 14/14] automation: modify RISC-V smoke test
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>, 
	Julien Grall <julien@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Gianluca Guida <gianluca@rivosinc.com>, 
	Doug Goldstein <cardoe@cardoe.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, Feb 8, 2023 at 12:47 AM Oleksii Kurochko
<oleksii.kurochko@gmail.com> wrote:
>
> The patch modifies the grep pattern to reflect the usage of WARN.
>
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
> Changes in V3:
>  - Update commit message
> ---
> Changes in V2:
>  - Leave only the latest "grep ..."
> ---
>  automation/scripts/qemu-smoke-riscv64.sh | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/automation/scripts/qemu-smoke-riscv64.sh b/automation/scripts/qemu-smoke-riscv64.sh
> index e0f06360bc..02fc66be03 100755
> --- a/automation/scripts/qemu-smoke-riscv64.sh
> +++ b/automation/scripts/qemu-smoke-riscv64.sh
> @@ -16,5 +16,5 @@ qemu-system-riscv64 \
>      |& tee smoke.serial
>
>  set -e
> -(grep -q "Hello from C env" smoke.serial) || exit 1
> +(grep -q "WARN is most likely working" smoke.serial) || exit 1
>  exit 0
> --
> 2.39.0
>
>

