Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 784E84DC9F8
	for <lists+xen-devel@lfdr.de>; Thu, 17 Mar 2022 16:29:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.291651.495159 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nUs3z-0000u7-70; Thu, 17 Mar 2022 15:29:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 291651.495159; Thu, 17 Mar 2022 15:29:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nUs3z-0000r0-3W; Thu, 17 Mar 2022 15:29:19 +0000
Received: by outflank-mailman (input) for mailman id 291651;
 Thu, 17 Mar 2022 15:29:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IuyF=T4=gmail.com=raphning@srs-se1.protection.inumbo.net>)
 id 1nUs3y-0000qu-8b
 for xen-devel@lists.xenproject.org; Thu, 17 Mar 2022 15:29:18 +0000
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [2a00:1450:4864:20::434])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fe407bde-a606-11ec-853c-5f4723681683;
 Thu, 17 Mar 2022 16:29:11 +0100 (CET)
Received: by mail-wr1-x434.google.com with SMTP id h15so7867960wrc.6
 for <xen-devel@lists.xenproject.org>; Thu, 17 Mar 2022 08:29:17 -0700 (PDT)
Received: from [192.168.12.253] (54-240-197-232.amazon.com. [54.240.197.232])
 by smtp.gmail.com with ESMTPSA id
 v20-20020a7bcb54000000b0037fa63db8aasm8143052wmj.5.2022.03.17.08.29.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Mar 2022 08:29:15 -0700 (PDT)
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
X-Inumbo-ID: fe407bde-a606-11ec-853c-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:to:cc:references
         :from:in-reply-to:content-transfer-encoding;
        bh=ABeASIv4UNYtQn+aRapQmIpWwh2knmyHOuvz8vAmwdc=;
        b=lZfs4Ry75nwFRnVbOZiZJOwVN92F4jdbAPRB0rRtO3CEWVhtm1ajCOzJhHH+q6cc5y
         ljbNsPN8iPi1Z01L1P86/Ww41/oBR+WcKU+sxCYJ0icX4TvCIVxXaYBq4JFfuBEVXQy3
         REe+HiN8gViHIKV6hG1o+Ln8Wximebe+zFMJQwuSn++AISvLcx49LNiLo1LwpXPEq7SD
         XeSjMrsmg9xIk5Ok6c5BpV7eI8MYrRKksSGxv2QPvMh7bZtAhBHXnl8mU7wKt2SSov5h
         gMJz8C47KeNQZRSk8z5E4UDPNGAZHmFe2aodODkVOT9ao3XOQ4mngfUuXiz0DP40kFF+
         /gwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :to:cc:references:from:in-reply-to:content-transfer-encoding;
        bh=ABeASIv4UNYtQn+aRapQmIpWwh2knmyHOuvz8vAmwdc=;
        b=LLIvcxlukMyn+fxQ3BsWXsmoPFVPxpkKJSH/cWg4z+PdbRkRf3f3sbUIITnd6jXyH5
         jgJzB6zToeZ14ZvX7Rsy26UdAiPwoBdb4bG2QBQl9dchd7HP4g5/S21Qq3Dgcmu052od
         Tl+oMGJCOXWbEtwXLK5dSNjaiNIyC4UIJVk0vNXygPS1w/CaiRpyCiOipcx/Lg4hJyIc
         oQnBXo81CnSLyddI/qP7oVa1v9LaVzXAwSae3rPe+ip56gATivlEDYKOqDSCjey3u9O9
         LXsGwDJncdzsRTRBNnsfnJ1ZcHBlXtEtwSNqZxZJOSNChuObjQ73uy3ubcMIUIY/pwm1
         RNvg==
X-Gm-Message-State: AOAM5317KTwYLMC+UPqZCQV5fQaXkE57hgNKQEjCfaBZKgflsR8sdKd8
	BAvUr3bjeJ6ewmZ9m2mHjM4=
X-Google-Smtp-Source: ABdhPJw54QLjnlxeDEWtd6FqaDs9Y2Wd04ubYuUV5o7QXslf9o7AwuzAN1A0LxeXE3kGRGHzET1yug==
X-Received: by 2002:a5d:654e:0:b0:1f0:1a18:166c with SMTP id z14-20020a5d654e000000b001f01a18166cmr4490451wrv.28.1647530956085;
        Thu, 17 Mar 2022 08:29:16 -0700 (PDT)
Message-ID: <700ca049-5765-d880-b16f-8cad5bb2884d@gmail.com>
Date: Thu, 17 Mar 2022 15:29:13 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
Subject: Re: [XEN PATCH] evtchn/fifo: Don't set PENDING bit if guest
 misbehaves
To: Luca Fancellu <Luca.Fancellu@arm.com>, Andrew Cooper <amc96@srcf.net>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, David Vrabel <dvrabel@amazon.co.uk>
References: <6b84a20b2753130cc62406a0fd14d2708f6f504b.1647455219.git.raphning@amazon.com>
 <e07d0eda-c117-c83e-227e-7a934585f265@srcf.net>
 <5B2CF3C1-345B-45C8-8E6E-CC118015F4FA@arm.com>
From: Raphael Ning <raphning@gmail.com>
In-Reply-To: <5B2CF3C1-345B-45C8-8E6E-CC118015F4FA@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


On 17/03/2022 14:26, Luca Fancellu wrote:
> I’ve tested on the ARM side, I’ve started/destroyed few guests from Dom0, connect to the console, run
> some network communications between guest and Dom0, everything works:
>
> Tested-by: Luca Fancellu <luca.fancellu@arm.com>


Thanks!  I tested on x86 (in a QEMU VM) by launching and destroying an HVM guest; both dom0 and the guest use FIFO event channels.


>
> Cheers,
> Luca
>

