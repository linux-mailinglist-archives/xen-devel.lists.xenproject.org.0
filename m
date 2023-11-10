Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DD38F7E7C24
	for <lists+xen-devel@lfdr.de>; Fri, 10 Nov 2023 13:24:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.630264.982975 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r1QYF-0008Ji-3n; Fri, 10 Nov 2023 12:23:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 630264.982975; Fri, 10 Nov 2023 12:23:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r1QYF-0008HP-0d; Fri, 10 Nov 2023 12:23:55 +0000
Received: by outflank-mailman (input) for mailman id 630264;
 Fri, 10 Nov 2023 12:23:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3cT5=GX=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1r1QYC-0008EJ-V9
 for xen-devel@lists.xenproject.org; Fri, 10 Nov 2023 12:23:52 +0000
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [2a00:1450:4864:20::22a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 00d5b25a-7fc4-11ee-9b0e-b553b5be7939;
 Fri, 10 Nov 2023 13:23:50 +0100 (CET)
Received: by mail-lj1-x22a.google.com with SMTP id
 38308e7fff4ca-2c788f5bf53so12615591fa.2
 for <xen-devel@lists.xenproject.org>; Fri, 10 Nov 2023 04:23:50 -0800 (PST)
Received: from localhost ([213.195.113.99]) by smtp.gmail.com with ESMTPSA id
 16-20020a05600c021000b004060f0a0fdbsm4928552wmi.41.2023.11.10.04.23.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Nov 2023 04:23:49 -0800 (PST)
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
X-Inumbo-ID: 00d5b25a-7fc4-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1699619029; x=1700223829; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=d6qsLjLzarjsyj792WOvem3ireyRhFP9cH08JtZTK6c=;
        b=niclZSPtq7fLL+NsanaU3B9lo9ncM3PTZMJPtrQJBD54iY7Uc5pKWHNFFQ0n5eyOgg
         ievK1KYIPNUsB75/x2wMdVv0/BbCYVIFMlNcHhZLTtSEnXYeFfvuG2/u+r/r4NFzMOWe
         V1G7i+f4hZ75xCOybwDRqXnDBKr70/TjpuNXE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699619029; x=1700223829;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d6qsLjLzarjsyj792WOvem3ireyRhFP9cH08JtZTK6c=;
        b=Ku9YopJTPD50uFMuZ/wZrH5cXpalmX/utxyxbJD/ru5oI+iFJ6GpQcM3n0SNUkRZCK
         peiS1tqP46z5wTyt5sduSijTnkP/6u4XL9O2ypEkDxHkSrP15XtKQ1mnDV7BXWVlQEwD
         6ihP+hMhwdQvLxd0tV5WihYd7tLPVpvxgcZEwk8cGIDJn6E/1fx2kXpOOyBTjTxhKR+f
         RFoKRwFup75ffsFOuGjoXwRW4+1uTXGOKNujRzf2OvfqHzN/MSoIC7XRcDOHtcwu4z81
         EC11p3FtfNQeSPZ4IsgbDVtZNdumWRJKCEORX0cQdXbvMM4fogUQ6+Dzqe74xpkZVbs3
         D4xQ==
X-Gm-Message-State: AOJu0Yzsy+bdilHyQ9+nynM9oHEDiyiO6yR3OKzDRgzHkLrabxSOxZjR
	N21DKQG6FZEvToTEsKOq0x0vNA==
X-Google-Smtp-Source: AGHT+IEVMcz88wiybwFGxqthBAENB/4ZAWD9T1MqprzLvhMKOFRNktjF4uG6aJTQhyehTtkPg/SmcQ==
X-Received: by 2002:a2e:b00c:0:b0:2c5:1037:b54d with SMTP id y12-20020a2eb00c000000b002c51037b54dmr6517610ljk.31.1699619029580;
        Fri, 10 Nov 2023 04:23:49 -0800 (PST)
Date: Fri, 10 Nov 2023 12:23:47 +0000
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Juergen Gross <jgross@suse.com>
Cc: minios-devel@lists.xenproject.org, xen-devel@lists.xenproject.org,
	samuel.thibault@ens-lyon.org, wl@xen.org
Subject: Re: [PATCH v2 2/5] Mini-OS: get own domid
Message-ID: <ZU4g0y-Y6-77sY-C@macbook.local>
References: <20231110113435.22609-1-jgross@suse.com>
 <20231110113435.22609-3-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231110113435.22609-3-jgross@suse.com>

On Fri, Nov 10, 2023 at 12:34:32PM +0100, Juergen Gross wrote:
> Get the own domid via creation of a temporary event channel. There is
> no "official" way to read the own domid in PV guests, so use the event
> channel interface to get it:
> 
> - allocate an unbound event channel specifying DOMID_SELF for the
>   other end
> 
> - read the event channel status which will contain the own domid in
>   unbound.dom
> 
> - close the event channel

Should we look into introducing a way to expose the domid, so that in
the future we might not need to resort to this workarounds to get the
domid?

Maybe in the PV-specific cpuid leaf?  It's a shame we didn't put it in
a non-HVM specific leaf when it was made available to HVM for pvshim
reasons.

Thanks, Roger.

