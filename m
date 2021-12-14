Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C4324743AE
	for <lists+xen-devel@lfdr.de>; Tue, 14 Dec 2021 14:41:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.246752.425537 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mx83B-0006QC-2f; Tue, 14 Dec 2021 13:41:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 246752.425537; Tue, 14 Dec 2021 13:41:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mx83A-0006N3-VK; Tue, 14 Dec 2021 13:41:00 +0000
Received: by outflank-mailman (input) for mailman id 246752;
 Tue, 14 Dec 2021 13:40:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cai7=Q7=gmail.com=xadimgnik@srs-se1.protection.inumbo.net>)
 id 1mx839-0006Mx-K9
 for xen-devel@lists.xenproject.org; Tue, 14 Dec 2021 13:40:59 +0000
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [2a00:1450:4864:20::432])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7832e218-5ce3-11ec-9e60-abaf8a552007;
 Tue, 14 Dec 2021 14:40:58 +0100 (CET)
Received: by mail-wr1-x432.google.com with SMTP id j3so32485950wrp.1
 for <xen-devel@lists.xenproject.org>; Tue, 14 Dec 2021 05:40:58 -0800 (PST)
Received: from [192.168.1.186] (host31-48-92-117.range31-48.btcentralplus.com.
 [31.48.92.117])
 by smtp.gmail.com with ESMTPSA id u2sm16264414wrs.17.2021.12.14.05.40.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Dec 2021 05:40:58 -0800 (PST)
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
X-Inumbo-ID: 7832e218-5ce3-11ec-9e60-abaf8a552007
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:reply-to:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=d5ndx34hN9m4TAr2xVMmBcuyEYVL6HUh2Zoc6H0l7hk=;
        b=kaRvdUhjK5mUvT3+oDIJClgAKiVvpfQFixukB5F2HVK4rUJMJ9XjxhXjCrceLjBc4h
         StwQCf3n4o/vQdj8KeHTHh5ZcUS/vDMwQtV9JtHE0BmKFUQquPKlB4gankOpGawqLTSi
         DiB9D4XD3hlmVj0KHHaeDaMClV/fnlmnLuz+2cAOjTXHljQ+alZaeT6ESVo2ll8lLHh6
         tTRydUk99j6UVvoeSBCytWV94rfGcVes/oR6rF/Tt6xDstaVqyV4/zAD0WxNznlcSVsp
         FBGOLRdd2dNFgUssQ82YMqtL4n60hzlBATcKzBhMqN9dPMdShuK8XQlm8K0MnUBT/omo
         PWvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:reply-to
         :subject:content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=d5ndx34hN9m4TAr2xVMmBcuyEYVL6HUh2Zoc6H0l7hk=;
        b=JwoMfBCntQKyevMz+vuHmVCsL9xcR5VYDJl8opj+2pcYM56DoqIIwNmZzVWHOl0AOi
         dcT0Ubq/qac7ShvgFrizR9RPLtAKnp/agtaMPCab1VL9+YpwfxzqICmCqxnoJ3MeGk6h
         92gXgYWeRuUcuXZHTFd+28+XhIxDWQrissFsDGfNvFm3wRT6d2ByAf5714zgQ8XYihA+
         A1O4XhWavh1VyixTdmPtw0gdiqc0sRJmorPTztS3Ge/dhgAAHKk//7MGUkxMZ1181PkM
         ssFcJQu2jv/o9WhQ5xAgwX1wUUNA9pTs0BbgAMD8xJChI4x48jQoSmZBGdVeGN2WdJQx
         yuVQ==
X-Gm-Message-State: AOAM533t6HCMmJ1q8T9+9oLBRVsb8Zf4MWruATlk1Auj+mU1W+2j/JKU
	wWI5vJFntfvp2vnBkSRrunY=
X-Google-Smtp-Source: ABdhPJySJ7nTJD03hzl2t9OmC0fdR31hCq/n5Ku3bel24kiVofteNrsCpe58LVNU6wohiG/7LHR/Qw==
X-Received: by 2002:adf:a10f:: with SMTP id o15mr5860296wro.592.1639489258334;
        Tue, 14 Dec 2021 05:40:58 -0800 (PST)
Message-ID: <adfe1c14-f773-0592-e304-d80da8380cc0@gmail.com>
Date: Tue, 14 Dec 2021 05:40:57 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Reply-To: paul@xen.org
Subject: Re: [PATCH] xen-hvm: Allow disabling buffer_io_timer
Content-Language: en-US
To: Jason Andryuk <jandryuk@gmail.com>, qemu-devel@nongnu.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, "Michael S. Tsirkin"
 <mst@redhat.com>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "open list:X86 Xen CPUs" <xen-devel@lists.xenproject.org>
References: <20211210193434.75566-1-jandryuk@gmail.com>
From: "Durrant, Paul" <xadimgnik@gmail.com>
In-Reply-To: <20211210193434.75566-1-jandryuk@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/12/2021 11:34, Jason Andryuk wrote:
> commit f37f29d31488 "xen: slightly simplify bufioreq handling" hard
> coded setting req.count = 1 during initial field setup before the main
> loop.  This missed a subtlety that an early exit from the loop when
> there are no ioreqs to process, would have req.count == 0 for the return
> value.  handle_buffered_io() would then remove state->buffered_io_timer.
> Instead handle_buffered_iopage() is basically always returning true and
> handle_buffered_io() always re-setting the timer.
> 
> Restore the disabling of the timer by introducing a new handled_ioreq
> boolean and use as the return value.  The named variable will more
> clearly show the intent of the code.
> 
> Signed-off-by: Jason Andryuk <jandryuk@gmail.com>

Reviewed-by: Paul Durrant <paul@xen.org>

