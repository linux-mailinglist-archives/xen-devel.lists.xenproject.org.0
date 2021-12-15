Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F22B475B4D
	for <lists+xen-devel@lfdr.de>; Wed, 15 Dec 2021 16:03:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.247424.426652 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mxVo5-0001fo-Eb; Wed, 15 Dec 2021 15:03:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 247424.426652; Wed, 15 Dec 2021 15:03:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mxVo5-0001de-Ar; Wed, 15 Dec 2021 15:03:01 +0000
Received: by outflank-mailman (input) for mailman id 247424;
 Wed, 15 Dec 2021 15:02:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uCzL=RA=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1mxVo3-0001cs-Hk
 for xen-devel@lists.xenproject.org; Wed, 15 Dec 2021 15:02:59 +0000
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [2a00:1450:4864:20::129])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 16c6ee67-5db8-11ec-85d3-df6b77346a89;
 Wed, 15 Dec 2021 16:02:58 +0100 (CET)
Received: by mail-lf1-x129.google.com with SMTP id cf39so31591776lfb.8
 for <xen-devel@lists.xenproject.org>; Wed, 15 Dec 2021 07:02:58 -0800 (PST)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id i17sm356323lfe.281.2021.12.15.07.02.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Dec 2021 07:02:57 -0800 (PST)
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
X-Inumbo-ID: 16c6ee67-5db8-11ec-85d3-df6b77346a89
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=3VUw9tM+m0jbarRH4w6pSt3+J8WEisanbtrcGRlG8ww=;
        b=XnX3KlMW71XibvS+5PXXLlk/jp/CjOWYWwz+PHDxyU+EBz4JT0PPCKxrWWXOY9YA8L
         qn+C3VGweZy/OFJjDBD4VO8HkNajlpPonD/3H3IPcZdKtXUJ7rJ7/HxeBX7EvBBhjXZT
         mZea9qLNtc2Nlqhb2kkM2wKbFvrrsDsBzVX+dBZZ2LxeWxXlo79pHJsSCFIqH7YH2eVl
         7AcZcEUlsyyB+6jJLvPCCasQKM8D6q+0716kCv2+9TCEMIZ0Pfh+7ApQYRfrwJscY47S
         zrA5s2Dc4vDxnUWUIAE8tq6S7yy2FXWaeVP1L97Ln55xYLX9oP8kh0uxPGsB9mUViQ7F
         dupQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=3VUw9tM+m0jbarRH4w6pSt3+J8WEisanbtrcGRlG8ww=;
        b=AlvZOxNJ0gosS+jmi+E2XgYsq5WPD+YcdtytmOfHJnr6U/MTEAGHERuR9p/2muyFPv
         D6R4HNwGG1Nkn/5UGhJFvLqIZF1+6jQn19uMevyO9sksh+9MX/8sO33yZOPQcSlua0O0
         GbFDVnYm/06zG30MjJqkFFy1mESBY/VsinZyGi+Xiwi3XsWXAxAH5wi1Wenjr/mkhgxM
         /k+CXng2dv2G/Ce2BNpdRXRfXuBXt9wDSC7HBGE4aq/xnTozlFJoQVX0/aVm2D333TfF
         yKDyDwM5Xt4razyIUD0s8yGaX4Ztg4Z4JUEnMtn6HWDVf5Z3evAg81vHuCHE+pZBR+uh
         61lQ==
X-Gm-Message-State: AOAM533naV6r9+6f7Ie3B1gillozVwY8mKsDJ7Dt+OvRqftnJk2UniBj
	PbHyYaqqxafnTbnDoZy211k=
X-Google-Smtp-Source: ABdhPJwwLhZgub0yES1ms41VWT9/AvEg4+0/KrQ2xBoQ/ggbyh9d+FURZ5MtAp17elZ2aHcq7O0W1g==
X-Received: by 2002:a05:6512:308b:: with SMTP id z11mr9662770lfd.177.1639580577565;
        Wed, 15 Dec 2021 07:02:57 -0800 (PST)
Subject: Re: [PATCH V6 1/2] libxl: Add support for Virtio disk configuration
To: Juergen Gross <jgross@suse.com>
Cc: Anthony PERARD <anthony.perard@citrix.com>,
 xen-devel@lists.xenproject.org,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, Wei Liu <wl@xen.org>,
 George Dunlap <george.dunlap@citrix.com>,
 Nick Rosbrook <rosbrookn@ainfosec.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>
References: <1638982784-14390-1-git-send-email-olekstysh@gmail.com>
 <1638982784-14390-2-git-send-email-olekstysh@gmail.com>
 <YbjANCjAUGe4BAar@perard> <bce10079-abd6-c033-6273-ac0ea9f51668@gmail.com>
 <4c89e55d-4bf1-506e-d620-4a0ff18ef308@suse.com>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <dc1b70ac-079d-5de8-cb13-6be4944cef0a@gmail.com>
Date: Wed, 15 Dec 2021 17:02:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <4c89e55d-4bf1-506e-d620-4a0ff18ef308@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US


On 15.12.21 08:08, Juergen Gross wrote:

Hi Juergen

> On 14.12.21 18:44, Oleksandr wrote:
>>
>> On 14.12.21 18:03, Anthony PERARD wrote:
>>
>> Hi Anthony
>>
>>
>>> On Wed, Dec 08, 2021 at 06:59:43PM +0200, Oleksandr Tyshchenko wrote:
>>>> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>>>>
>>>> This patch adds basic support for configuring and assisting 
>>>> virtio-disk
>>>> backend (emualator) which is intended to run out of Qemu and could be
>>>> run in any domain.
>>>> Although the Virtio block device is quite different from traditional
>>>> Xen PV block device (vbd) from the toolstack point of view:
>>>>   - as the frontend is virtio-blk which is not a Xenbus driver, 
>>>> nothing
>>>>     written to Xenstore are fetched by the frontend (the vdev is not
>>>>     passed to the frontend)
>>>>   - the ring-ref/event-channel are not used for the backend<->frontend
>>>>     communication, the proposed IPC for Virtio is IOREQ/DM
>>>> it is still a "block device" and ought to be integrated in existing
>>>> "disk" handling. So, re-use (and adapt) "disk" parsing/configuration
>>>> logic to deal with Virtio devices as well.
>>> How backend are intended to be created? Is there something listening on
>>> xenstore?
>>>
>>> You mention QEMU as been the backend, do you intend to have QEMU
>>> listening on xenstore to create a virtio backend? Or maybe it is on the
>>> command line? There is QMP as well, but it's probably a lot more
>>> complicated as I think libxl needs refactoring for that.
>>
>>
>> No, QEMU is not involved there. The backend is a standalone application,
>> it is launched from the command line. The backend reads the Xenstore 
>> to get
>> the configuration and to detect when guest with the frontend is 
>> created/destroyed.
>
> I think this should be reflected somehow in the configuration, as I
> expect qemu might gain this functionality in the future.

I understand this and agree in general (however I am wondering whether 
this can be postponed until it is actually needed), but ...


>
>
> I'm wondering whether we shouldn't split the backend from the protocol
> (or specification?). Something like "protocol=virtio" (default would be
> e.g. "xen") and then you could add "backend=external" for your use case?

... I am afraid, I didn't get the idea. Are we speaking about the (new?) 
disk configuration options
here or these are not disk specific things at all and to be applicable 
for all possible backends?
If the former, then could the new backendtype simply do the job? For 
example, "backendtype=virtio_external" for our current use-case and 
"backendtype=virtio_qemu"
for the possible future use-cases? Could you please clarify the idea.


Thank you.



> We could later expand that to "backend=qemu" or "backend=<script-path>".
>
>
> Juergen

-- 
Regards,

Oleksandr Tyshchenko


