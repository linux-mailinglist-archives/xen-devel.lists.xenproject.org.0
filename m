Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 18A1250A344
	for <lists+xen-devel@lfdr.de>; Thu, 21 Apr 2022 16:51:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.310281.527022 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nhY8s-00006p-9X; Thu, 21 Apr 2022 14:50:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 310281.527022; Thu, 21 Apr 2022 14:50:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nhY8s-0008Ve-6U; Thu, 21 Apr 2022 14:50:46 +0000
Received: by outflank-mailman (input) for mailman id 310281;
 Thu, 21 Apr 2022 14:50:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BFhx=U7=gmail.com=xadimgnik@srs-se1.protection.inumbo.net>)
 id 1nhY8r-0008VY-8B
 for xen-devel@lists.xenproject.org; Thu, 21 Apr 2022 14:50:45 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6bdd31dd-c182-11ec-a405-831a346695d4;
 Thu, 21 Apr 2022 16:50:44 +0200 (CEST)
Received: by mail-wm1-x330.google.com with SMTP id
 v64-20020a1cac43000000b0038cfd1b3a6dso6042468wme.5
 for <xen-devel@lists.xenproject.org>; Thu, 21 Apr 2022 07:50:44 -0700 (PDT)
Received: from [10.7.237.9] (54-240-197-225.amazon.com. [54.240.197.225])
 by smtp.gmail.com with ESMTPSA id
 m4-20020a7bcb84000000b00389efb7a5b4sm2238632wmi.17.2022.04.21.07.50.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Apr 2022 07:50:43 -0700 (PDT)
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
X-Inumbo-ID: 6bdd31dd-c182-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:reply-to:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=xBmdIR6wjqg4mGc+d6ERxxHFFhbZxiDh8aa+zoHO7oo=;
        b=BsPzQg9C7WZmWatbiQCyBE8gFNC5U8m3pbO0fG9Q+yEHtbyarMgqmFbVz7+swym/On
         yPKf03qIZLge3K2zB3+/AVen+/aW9DOemoVgtvP3J0Ib23uGye7VJE28nD2VCHr61CD7
         o92PehUgwpbJdE0smDKshlxSvdHRoSdF2UBbBNWkrHM3Cmd5oKUDkLWOnfXtHo4J+GAg
         t4ra+mfPQ5zpMYGkvEvxgZcwWrH8K5XAcZi0z+K3YR7gMYclyihu9CZOhJes97uueprW
         gWrg+cOl0/zWn28xTbFKFmrUzjmnPEV19v4QglZXTC9DVIRKMdOJLWADfAH1SauM7FAb
         B28w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:reply-to
         :subject:content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=xBmdIR6wjqg4mGc+d6ERxxHFFhbZxiDh8aa+zoHO7oo=;
        b=ohDup7zMflYBwPmqhxhVIrctdTi0dZ9RStVQdGHdPi1G2CScY1byXM7GHxMJyB86dl
         /zOtyjJHTwfeI72QuxnzuIK4jGPjDgHxaxiFpOAoiLMuu7p1fZzzt96KHl7MFXq0gMCb
         chFAq8m6s0xkO7i/2K0l/SvDPlRQTAnQ6W4ZfH6Dw253xXXRsD6+WEZVGdc2V9OyTVXQ
         fM5HEWutVLqCHY3IEOWLPqypMqNgMCdXnFzbf1Az9VY9/yPE2AqepanOdErxUxNmVQfB
         ZYHIVHT8SgNdwjsE9Pgdup9RdwaKlnioa+dVlNBRkvTVVMKyxt1jL2cJyqHWa+LaVMTV
         6AMA==
X-Gm-Message-State: AOAM532VlDqgiIhnuk0tkf9u+dTgerPgSXka1Pp2A/UyLri1OBTw7WYs
	5fL++NRM9SMiyNkCsqQ7ucI=
X-Google-Smtp-Source: ABdhPJwwt3vzYd4VTyrQBWRQUNiOJfL7xvPZbEOIyCeEFGC11nnonkE2pnQofyL8spN7j3Vh3ms/FA==
X-Received: by 2002:a05:600c:1e1f:b0:38e:c3eb:2d9 with SMTP id ay31-20020a05600c1e1f00b0038ec3eb02d9mr9307563wmb.90.1650552643773;
        Thu, 21 Apr 2022 07:50:43 -0700 (PDT)
Message-ID: <a638ded8-3bb8-0fad-c97a-8b3d9752310a@gmail.com>
Date: Thu, 21 Apr 2022 15:50:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Reply-To: paul@xen.org
Subject: Re: [PATCH v2 1/2] PCI: replace stray uses of PCI_{DEVFN,BDF}2()
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Kevin Tian <kevin.tian@intel.com>, Paul Durrant <paul@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>
References: <9a471a5f-497b-1015-8554-68117863f48a@suse.com>
 <6dd6719f-a05d-3f90-95b5-0ce9b5b0a2da@suse.com>
From: "Durrant, Paul" <xadimgnik@gmail.com>
In-Reply-To: <6dd6719f-a05d-3f90-95b5-0ce9b5b0a2da@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 21/04/2022 15:26, Jan Beulich wrote:
> There's no good reason to use these when we already have a pci_sbdf_t
> type object available. This extends to the use of PCI_BUS() in
> pci_ecam_map_bus() as well.
> 
> No change to generated code (with gcc11 at least, and I have to admit
> that I didn't expect compilers to necessarily be able to spot the
> optimization potential on the original code).
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
> Reviewed-by: Kevin Tian <kevin.tian@intel.com>

Reviewed-by: Paul Durrant <paul@xen.org>

