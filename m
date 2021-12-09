Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 48D5F46E381
	for <lists+xen-devel@lfdr.de>; Thu,  9 Dec 2021 08:50:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.242759.419841 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mvECK-0006Ch-43; Thu, 09 Dec 2021 07:50:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 242759.419841; Thu, 09 Dec 2021 07:50:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mvECK-00069v-09; Thu, 09 Dec 2021 07:50:36 +0000
Received: by outflank-mailman (input) for mailman id 242759;
 Thu, 09 Dec 2021 07:50:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xsbi=Q2=gmail.com=xadimgnik@srs-se1.protection.inumbo.net>)
 id 1mvECH-00069p-UO
 for xen-devel@lists.xenproject.org; Thu, 09 Dec 2021 07:50:34 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id afcb0ab0-58c4-11ec-9d12-4777fae47e2b;
 Thu, 09 Dec 2021 08:50:33 +0100 (CET)
Received: by mail-wm1-x32d.google.com with SMTP id p18so3447819wmq.5
 for <xen-devel@lists.xenproject.org>; Wed, 08 Dec 2021 23:50:32 -0800 (PST)
Received: from [192.168.1.186] (host31-48-92-117.range31-48.btcentralplus.com.
 [31.48.92.117])
 by smtp.gmail.com with ESMTPSA id o4sm6346279wry.80.2021.12.08.23.50.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Dec 2021 23:50:32 -0800 (PST)
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
X-Inumbo-ID: afcb0ab0-58c4-11ec-9d12-4777fae47e2b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:reply-to:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=Mb9rhS4NHaU/VS7Z5fHLKjttyLLnplEcywRYUi/Ow44=;
        b=BjFrOAd+UAARpV7A3cVIRmE1hsW6hI1FyfWJ0xJmkZBT8eA2cYuyVsKlwcFv3gX5tO
         jw4pjZ4vtvfKXAlVHrJKrlrTbuI9zm+rwOFRUV/+s+shLwNeLWzSgfyNEIpE7tZl6ZoW
         MWHWlPwkKICobW+RjRUWuQtaqAY4emXdib+ds1PMk3ge0bW7GIHeXUy32zN6ppXMPR/x
         uabQpDI1v/M/QQVRtQ+O6jrHE4bYy1TgW5L0QEAAFcK+tDkIho6hIsIwYRwSVfJrTOvg
         ult7MxWsFDkZezSGk8pfP76JzGQiNIzQNWOv4KGHV8HX6RaH7YVe7QTebPaecu7lFcov
         n9BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:reply-to
         :subject:content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=Mb9rhS4NHaU/VS7Z5fHLKjttyLLnplEcywRYUi/Ow44=;
        b=kcY184FVFuVGL8ZP2wbKUz96bY3O6TA+fYHp0NTHkUxuj3Ts558Ua/C3FqbQAWP/nB
         EzTAVIdbwMIDv3XnlkggnuX7O74I3rILnJxLN/I8p0zEIR+E+o0UJeOxwpXBE6oNbs3E
         EqnjkX3h90Fd7xNkU7FSzEqpZ60SLXcV4A4EjnuZQPuaTczRBkxdQco1vRHDmgLml0Lc
         SVoFYpv4P1gE8TglvKeF9fqUkU1isBpf3KWy7PetFF0DOXUZ980y5LOPsPZdlFAYbhxT
         8kBD2HFKtSgA5MgpTeCiF0FrulKjSAvO30xE9vXXtZzOijZ4nXSG/KGDSzMB/J9uYoxy
         F5AQ==
X-Gm-Message-State: AOAM533X5ycYlDRuHuYUfbU07Q8xpvRY396SenVA649A4bL84tp/ymKe
	5GPn6v/WjEnHIY5ouiMEESk=
X-Google-Smtp-Source: ABdhPJy8G++4wljNS3tZuaZqbtBL8bRCBeRZjBpHxYqtuBQtjb2Kasy7pMGgpj0NktcAXNvg8puPWg==
X-Received: by 2002:a1c:a7c3:: with SMTP id q186mr5354872wme.20.1639036232495;
        Wed, 08 Dec 2021 23:50:32 -0800 (PST)
Message-ID: <baee00d2-78f1-4df1-b9f7-6ab482011f33@gmail.com>
Date: Wed, 8 Dec 2021 23:50:31 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Reply-To: paul@xen.org
Subject: Re: [PATCH v2] public: add RING_NR_UNCONSUMED_*() macros to ring.h
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
 Manuel Bouyer <bouyer@antioche.eu.org>,
 Simon Kuenzer <simon.kuenzer@neclab.eu>, Paul Durrant <paul@xen.org>
References: <20211209070942.14469-1-jgross@suse.com>
From: "Durrant, Paul" <xadimgnik@gmail.com>
In-Reply-To: <20211209070942.14469-1-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 08/12/2021 23:09, Juergen Gross wrote:
> Today RING_HAS_UNCONSUMED_*() macros are returning the number of
> unconsumed requests or responses instead of a boolean as the name of
> the macros would imply.
> 
> As this "feature" is already being used, rename the macros to
> RING_NR_UNCONSUMED_*() and define the RING_HAS_UNCONSUMED_*() macros
> by using the new RING_NR_UNCONSUMED_*() macros. In order to avoid
> future misuse let RING_HAS_UNCONSUMED_*() optionally really return a
> boolean (can be activated by defining RING_HAS_UNCONSUMED_IS_BOOL).
> 
> Note that the known misuses need to be switched to the new
> RING_NR_UNCONSUMED_*() macros when using this version of ring.h.
> 
> Cc: Roger Pau Monne <roger.pau@citrix.com>
> Cc: Manuel Bouyer <bouyer@antioche.eu.org>
> Cc: Simon Kuenzer <simon.kuenzer@neclab.eu>
> Cc: Paul Durrant <paul@xen.org>
> Signed-off-by: Juergen Gross <jgross@suse.com>
> ---
> I have checked Xen, Mini-OS, qemu, grub2, OVMF and Linux kernel for
> misuses of the RING_HAS_UNCONSUMED_*() macros. There is currently only
> one instance in the Linux kernel netback driver. The BSDs, UNIKRAFT
> and Windows PV drivers should be checked for misuse, too.
> V2: make RING_HAS_UNCONSUMED_*() returning a bool optional (Jan Beulich)
> ---

Reviewed-by: Paul Durrant <paul@xen.org>

