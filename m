Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E4877D56B0
	for <lists+xen-devel@lfdr.de>; Tue, 24 Oct 2023 17:39:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.622130.969381 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvJV2-0007ZU-NF; Tue, 24 Oct 2023 15:39:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 622130.969381; Tue, 24 Oct 2023 15:39:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvJV2-0007XD-JQ; Tue, 24 Oct 2023 15:39:20 +0000
Received: by outflank-mailman (input) for mailman id 622130;
 Tue, 24 Oct 2023 15:39:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+b+W=GG=gmail.com=xadimgnik@srs-se1.protection.inumbo.net>)
 id 1qvJV0-0007X7-Ur
 for xen-devel@lists.xenproject.org; Tue, 24 Oct 2023 15:39:18 +0000
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [2a00:1450:4864:20::235])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7e44d0c5-7283-11ee-98d5-6d05b1d4d9a1;
 Tue, 24 Oct 2023 17:39:18 +0200 (CEST)
Received: by mail-lj1-x235.google.com with SMTP id
 38308e7fff4ca-2c4fe37f166so66445811fa.1
 for <xen-devel@lists.xenproject.org>; Tue, 24 Oct 2023 08:39:18 -0700 (PDT)
Received: from [192.168.6.66] (54-240-197-238.amazon.com. [54.240.197.238])
 by smtp.gmail.com with ESMTPSA id
 d17-20020a5d6451000000b0032da022855fsm10102024wrw.111.2023.10.24.08.39.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Oct 2023 08:39:16 -0700 (PDT)
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
X-Inumbo-ID: 7e44d0c5-7283-11ee-98d5-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698161957; x=1698766757; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tlEmeIXZ50wWPACQtQWY4ubCrlx8dw20cymk7ZBn6mM=;
        b=crBi2w5yqIeU5JP5HBn4dUFnhCd+0i3Occ4hxKy0IFFSDRlxz2aMmf63TwTiJ0gFWE
         GA3Y9HtVpLlhBOIsESO1NNjilt/LyYJf+8pAiEJvE1ac37Mp5vuTYRd83maWhqhn306s
         mIZ6GE3Qjjntup2jrj52Bj0jwxHeRTmnWdopSDZuI5lNYUFBb7iolIwmET+0xT8Q4wxE
         VBiKfE/C5rlR0Ivy8U2kDpQNYHiheU3zC/OPD6DzJS6s7cqYq6JZYDE4GpfbQPDaXPyI
         63JzhuS6/94NSkyNcz9mDdTG3OgzLex/EWx6e7qwO2L5RjX2rX6M3kVDaHgpQLfxPvOb
         qocA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698161957; x=1698766757;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tlEmeIXZ50wWPACQtQWY4ubCrlx8dw20cymk7ZBn6mM=;
        b=l7hXZaNoKK34NDANz4hev1Pkaaz/JJnEFbiqHxulx8BdQrFShd9XGAYXiRLURo1sdc
         KlaLLoSsL7cfp9NFQi7qwAjVlETRcoZcy0K8IgvE++jrVGU2jdEABZAl9lO5Mzg/Vzez
         FnLyFdf0JOmd8dnubi5YQEdF7ECZK2UzP+OyqZKugQYgUTxXDJvGTx9/FoUyY0qtLBOA
         9ULpQ1xulaWo4Rv3YsyLYBw6RXWvjS4KPMxT+oMEiCow4B0gpYspodIlg72iKX/1cSEN
         ORR3hc7ppek1r0Em/Zwksla8+VoZpzE932GCFVN6KKK2Gwh4DQoTGDc36L9wfll3IKJW
         5OCQ==
X-Gm-Message-State: AOJu0Yzr1mvkSKFM8ZA5wU83dq8cxN/yUtpxsJR6zaErJqaNx04zxCAC
	HBlZ6x+G1/DD/zlCR8j8oxc=
X-Google-Smtp-Source: AGHT+IF0q/RHR9QB8PZoYcnAqa6LCHwv1hACOYhfgQS8+0Un8TgpeFTwgjZUGx/iI4BFscPRP+CgPA==
X-Received: by 2002:a2e:ba9e:0:b0:2c5:1ad0:e306 with SMTP id a30-20020a2eba9e000000b002c51ad0e306mr7448511ljf.8.1698161957367;
        Tue, 24 Oct 2023 08:39:17 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <3f22903b-30f0-40f2-8624-b681d9c7e05d@xen.org>
Date: Tue, 24 Oct 2023 16:39:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: paul@xen.org
Subject: Re: [PATCH 12/12] hw/xen: add support for Xen primary console in
 emulated mode
Content-Language: en-US
To: David Woodhouse <dwmw2@infradead.org>, qemu-devel@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, Marcelo Tosatti
 <mtosatti@redhat.com>, qemu-block@nongnu.org,
 xen-devel@lists.xenproject.org, kvm@vger.kernel.org
References: <20231016151909.22133-1-dwmw2@infradead.org>
 <20231016151909.22133-13-dwmw2@infradead.org>
 <c18439ca-c9ae-4567-bbcf-dffe6f7b72e3@xen.org>
 <3acd078bba2d824f836b20a270c780dc2d031c43.camel@infradead.org>
Organization: Xen Project
In-Reply-To: <3acd078bba2d824f836b20a270c780dc2d031c43.camel@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 24/10/2023 16:37, David Woodhouse wrote:
> On Tue, 2023-10-24 at 15:20 +0100, Paul Durrant wrote:
>> On 16/10/2023 16:19, David Woodhouse wrote:
>>> From: David Woodhouse <dwmw@amazon.co.uk>
>>>
>>> The primary console is special because the toolstack maps a page at a
>>> fixed GFN and also allocates the guest-side event channel. Add support
>>> for that in emulated mode, so that we can have a primary console.
>>>
>>> Add a *very* rudimentary stub of foriegnmem ops for emulated mode, which
>>> supports literally nothing except a single-page mapping of the console
>>> page. This might as well have been a hack in the xen_console driver, but
>>> this way at least the special-casing is kept within the Xen emulation
>>> code, and it gives us a hook for a more complete implementation if/when
>>> we ever do need one.
>>>
>> Why can't you map the console page via the grant table like the xenstore
>> page?
> 
> I suppose we could, but I didn't really want the generic xen-console
> device code having any more of a special case for 'Xen emulation' than
> it does already by having to call xen_primary_console_create().
> 

But doesn't is save you the whole foreignmem thing? You can use the 
grant table for primary and secondary consoles.

   Paul


