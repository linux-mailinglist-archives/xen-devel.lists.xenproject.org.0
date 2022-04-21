Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AF43B50A36A
	for <lists+xen-devel@lfdr.de>; Thu, 21 Apr 2022 16:55:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.310286.527032 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nhYCy-00013k-Nx; Thu, 21 Apr 2022 14:55:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 310286.527032; Thu, 21 Apr 2022 14:55:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nhYCy-00011v-Ku; Thu, 21 Apr 2022 14:55:00 +0000
Received: by outflank-mailman (input) for mailman id 310286;
 Thu, 21 Apr 2022 14:54:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BFhx=U7=gmail.com=xadimgnik@srs-se1.protection.inumbo.net>)
 id 1nhYCx-00011p-8z
 for xen-devel@lists.xenproject.org; Thu, 21 Apr 2022 14:54:59 +0000
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [2a00:1450:4864:20::42e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0320aba0-c183-11ec-a405-831a346695d4;
 Thu, 21 Apr 2022 16:54:58 +0200 (CEST)
Received: by mail-wr1-x42e.google.com with SMTP id c10so7087671wrb.1
 for <xen-devel@lists.xenproject.org>; Thu, 21 Apr 2022 07:54:58 -0700 (PDT)
Received: from [10.7.237.9] (54-240-197-225.amazon.com. [54.240.197.225])
 by smtp.gmail.com with ESMTPSA id
 j16-20020adfff90000000b0020947cf914bsm2407655wrr.31.2022.04.21.07.54.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Apr 2022 07:54:57 -0700 (PDT)
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
X-Inumbo-ID: 0320aba0-c183-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:reply-to:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=jEUURzZf5LICffNomhoozAYCrvZ7XkG9vvU6GCXZWAE=;
        b=BBMvsp+sXTRYkBBgwaw+MBO6pnkp3Ow64Tg7JADsrol6u7F5g9oT++f1O8Y2azfCsn
         aPCLoCwfCgBLjTEnO6HMkAA7dFvuLf2j5MljpkM56BEsKW4g1jxYsOPHY6+ZZmg+3hrU
         zzEfjeOf23Y40jzw3o6zTjwlVd2h+790KyPOtxM1xkI9QvQupoXopBkIta6HxNCacZVs
         CYWp62C73n0Bs/zBNXARXr4b//iE+e3iCzb8Y00ojaNmvvP5Hhuy40hZMQ47fG5li5eX
         I3gn2GwuUFgDVLNQ9yiX7yoZm4t+Rsk9ekKo+pu+rnkEhRXY+5JwgfVOoxiBkkrbuEbt
         uzVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:reply-to
         :subject:content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=jEUURzZf5LICffNomhoozAYCrvZ7XkG9vvU6GCXZWAE=;
        b=oheiYujDuu39UVmZP0mPaXS1Uy/QRyyt1Usyn3ga2pfJMbdn1JSumLD+z5rXDLwj7i
         cgNMIW3bkZqK+XMc/BnQkzzg5ljr5OUN4/FddoA6GxA4KHiKKYQBk8T0RyBkUnfNUogQ
         IX/oAeP8NtjryVlGELzcjbxeoJPKtcRYnyjYFRSVKhaHtXsvHwa4VXJMwpnU1bfUteaJ
         0dzApG26SJ/jUVzdpCx36qWsbDSGHPXLt6nTmpHKalfVTdyt0nIndKlyAEyoBxZfQzG/
         Nd28pnajqjqV/zosGrdt3Fh3BOyrkEycLuj950Pusy5aUj5G3dEfIG0WXZk34cMDck7F
         T7dA==
X-Gm-Message-State: AOAM532LHccpz5QCnUGEpDXwDgQSL9qO5w72eOuJr53NbIddxc1uJCac
	vVyA0BysUh0KttPSQloKl4I=
X-Google-Smtp-Source: ABdhPJzgfKHzKvolxC1fVJLRMM038xEe2Gzx3igugklAyiRPGWF4h5gFjNLYEytmETbH4aBWUyqgHg==
X-Received: by 2002:a05:6000:184d:b0:20a:8a22:cbcf with SMTP id c13-20020a056000184d00b0020a8a22cbcfmr111431wri.350.1650552897611;
        Thu, 21 Apr 2022 07:54:57 -0700 (PDT)
Message-ID: <2e3b2575-edae-06df-c579-d6bade1eeddb@gmail.com>
Date: Thu, 21 Apr 2022 15:54:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Reply-To: paul@xen.org
Subject: Re: [PATCH v2 2/2] PCI: replace "secondary" flavors of
 PCI_{DEVFN,BDF,SBDF}()
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Kevin Tian <kevin.tian@intel.com>, Paul Durrant <paul@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <9a471a5f-497b-1015-8554-68117863f48a@suse.com>
 <609d222f-16db-52c1-1875-0843515a54d7@suse.com>
From: "Durrant, Paul" <xadimgnik@gmail.com>
In-Reply-To: <609d222f-16db-52c1-1875-0843515a54d7@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 21/04/2022 15:27, Jan Beulich wrote:
> At their use sites the numeric suffixes are at least odd to read, first
> and foremost for PCI_DEVFN2() where the suffix doesn't even match the
> number of arguments. Make use of count_args() such that a single flavor
> each suffices (leaving aside helper macros, which aren't supposed to be
> used from the outside).
> 
> In parse_ppr_log_entry() take the opportunity and drop two local
> variables and convert an assignment to an initializer.
> 
> In VT-d code fold a number of bus+devfn comparison pairs into a single
> BDF comparison.
> 
> No change to generated code for the vast majority of the adjustments.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
> Reviewed-by: Kevin Tian <kevin.tian@intel.com>

Reviewed-by: Paul Durrant <paul@xen.org>

