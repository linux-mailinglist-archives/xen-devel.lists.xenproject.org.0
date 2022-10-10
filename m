Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B10A5F9E8D
	for <lists+xen-devel@lfdr.de>; Mon, 10 Oct 2022 14:14:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.419238.664022 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ohrfC-0008Cy-Sr; Mon, 10 Oct 2022 12:13:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 419238.664022; Mon, 10 Oct 2022 12:13:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ohrfC-0008AU-QG; Mon, 10 Oct 2022 12:13:42 +0000
Received: by outflank-mailman (input) for mailman id 419238;
 Mon, 10 Oct 2022 12:13:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MT9y=2L=linaro.org=leo.yan@srs-se1.protection.inumbo.net>)
 id 1ohrfB-0008AO-Dg
 for xen-devel@lists.xenproject.org; Mon, 10 Oct 2022 12:13:41 +0000
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com
 [2607:f8b0:4864:20::532])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f93d3db0-4894-11ed-964a-05401a9f4f97;
 Mon, 10 Oct 2022 14:13:40 +0200 (CEST)
Received: by mail-pg1-x532.google.com with SMTP id f193so10211311pgc.0
 for <xen-devel@lists.xenproject.org>; Mon, 10 Oct 2022 05:13:40 -0700 (PDT)
Received: from leoy-yangtze.lan (211-75-219-199.hinet-ip.hinet.net.
 [211.75.219.199]) by smtp.gmail.com with ESMTPSA id
 o8-20020a170902d4c800b00179c81f6693sm6503693plg.264.2022.10.10.05.13.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Oct 2022 05:13:37 -0700 (PDT)
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
X-Inumbo-ID: f93d3db0-4894-11ed-964a-05401a9f4f97
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=m4K7D+0K/F7YWltdqfyFSRBf0Smxfeog/g1nUNmU0aM=;
        b=bEqw4HPnYF0QI5wyBrfwp1/dcKkLnDoVB41yhGDjhB67qtBofwXkqFXOmm63kxpFpS
         CJb/lRz8deKCkD0MEV+OzCCw6eSpUes8XLGtEorXzufotdiPhe+3zztvQVW+1YFDy0z4
         kO+rGmK5igt+oQOELFlUjbxXx0h5ISXt2jRZ0A54eHr1U5+xPUsV2Cekx9VnE5LsAySA
         iiN1KMtKMVhYUBAjaO2XrqpQoiG8D0cHEZ1EioVRmQ+Ivu10tVi76vf9sS5/2HRuOXr1
         etio6Rg1JrvzX2OXBof3ARic99bFQ37HTVB36ppm8hVaojU/5XLgSPa+zNkH68zINNP2
         Mcng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=m4K7D+0K/F7YWltdqfyFSRBf0Smxfeog/g1nUNmU0aM=;
        b=fu09ifAUggKZwSR+LLTGxNMMqJEzRsmgSVA3lctzqX89R2sLAbE3IZx8bWcR2f+LWI
         tCz54FL+4GRGP3MPD2lrAnezRlA27FXidXhR1owepBS1tHHeNZifhx/8EzVM6nXVzi1z
         k8qbxy+QuAwIC2sledR0D9hw+0d7VwFNI1Loasj64HC2QCqa8rIVaRPy1z8yOwajRDm7
         LYXgxRpyG1ft89FYn/fRw5llsRRI/A9HPCLdzeq40OBSd9X3+oOoBs7S3UY3mrj8WWbW
         /oRGltKg3cBrn/MnkrCCnHMckE9mzLkhE37NwS1TPsd4P1cmqXqStZx42+LaVYxT42as
         RG1g==
X-Gm-Message-State: ACrzQf2mwebSvFD5Cbl9qcRuud+CrjtmPRF0Nb3HUr61f/2+J8f+4TR5
	WVvre4N1aZtF7WnYxsrnuYYjBjWa5PCOubjgd9Xxtg==
X-Google-Smtp-Source: AMsMyM4m9ME0T38Q303eUueTkdWIyoKPKshmxkXp50RQmJYTo/D3I69CfN0DeQt7iDIz0LEFSoaK0A==
X-Received: by 2002:a65:6055:0:b0:42a:7b2b:dc71 with SMTP id a21-20020a656055000000b0042a7b2bdc71mr16180548pgp.23.1665404018321;
        Mon, 10 Oct 2022 05:13:38 -0700 (PDT)
Date: Mon, 10 Oct 2022 20:13:30 +0800
From: Leo Yan <leo.yan@linaro.org>
To: Xen Develop <xen-devel@lists.xenproject.org>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Jan Beulich <jbeulich@suse.com>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>,
	Kasper Ornstein Mecklenburg <Kasper.OrnsteinMecklenburg@arm.com>
Subject: Issue: Networking performance in Xen VM on Arm64
Message-ID: <Y0QMQuAUKKSgrAAV@leoy-yangtze.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi there,

I tested the networking performance on my Arm64 platform in Xen
virtual machine, below I will try to give out summary for testing
result and share some analysis, at the end I want to check a bit
from the community and get suggestion before I can proceed.

First of all, if you want to know more details for the profiling, you
could access the slides:
https://docs.google.com/presentation/d/1iTQRx8-UYnm19eU6CnVUSaAodKZ0JuRiHYaXBomfu3E/edit?usp=sharing

## Testing summary

The TL;DR is that I used two tools: netperf and ddsperf to test the
networking latency and throughput for Xen Dom0 and DomU, the below
result shows the performance for sending data from a Xen domain (Dom0
or DomU) to my x86 PC respectively, and performance is poor when
transmit data from Xen DomU (Note, I used the default networking
bridge configuration when launch Xen VM).

  Throughput result:

    Profile     netperf (Mbits/sec)    ddsperf (Mbits/sec)
    Xen-Dom0    939.41                 > 620
    Xen-DomU    107.73                 4~12

  Latency result:

    Profile     ddsperf's max ping/pong latency (us)
    Xen-Dom0    200 ~ 1400
    Xen-DomU    > 60,000

## Analysis

The critical thing for the performance is low level network driver if
it uses synchronous or asynchronous mode for skb transferring.

When we transfer data from my x86 machine to Xen DomU, the data flow is:

  bridge -> xenif (Xen network backend driver)               => Dom0
	      `> xennet driver (Xen net forend driver)       => DomU

In this flow, Xen network backend driver (in Dom0) copies skb into the
mediate buffer (gnttab_batch_copy()) and notify Xen VM by sending rx
irq, the key point is the backend driver doesn't wait for Xen VM to
process the skb and directly return to user space, therefore, Xen Dom0
and DomU work in asynchronous mode in this case (Dom0 doesn't need to
wait for DomU), the duration for handling a skb is 30+ us.

Conversely, if transmit data from Xen DomU, the flow is:

           DomU                    |               Dom0
  ---------------------------------+------------------------------------
  xennet driver receives skb       |
    `> send tx interrupt to Dom0   |
                                   |  xenif respond tx interrupt
	                           |  Copy skb into mediate buffer
                                   |  Notify DomU (send tx irq)
  xennet driver handle tx irq      |
  free skb                         |

So we can see when DomU sends out packets, it needs to wait for Dom0 to
process the packets, until Dom0 notifies DomU that packet has been
processed the net forend driver in DomU releases skb.

This means it's a long way to process skbs: Xen DomU and Dom0 work
in synchronous mode, the forend driver in DomU sends out skb and
notifies Dom0, Dom0 handles skb and notifies back to DomU, finally DomU
knows the skb has been processed and releases it.  The duration between
sendind and releasing a skb is about 180+ us.

## Questions

Given Xen network driver has been merged in Linux kernel 2.6 (back in
2007), it's very unlikely I am the first person to observe this issue.

I think this is a common issue and not specific to Arm64 arch, the
reason is the long latency is mainly caused by Xen networking driver
and I did't see the Xen context switching on Arm64 is abnormal (I saw
it takes ~10us for context switching between Xen domains).

Could anyone confirm if this is a known issue?
 
The second question is how to mitigate the long latency when send data
from DomU.  A possible solution is the Xen network forend driver copies
skb into mediate (bounce) buffer, just like what does in Xen net
backend driver with gnttab_batch_copy(), in this way the forend driver
doesn't need to wait for backend driver response and directly return
back.  But here I am not clear for the mechanism for Xen grant table,
especially if the Xen grant table is only writtable from Dom0, then it
would be hard for us to optimize the forend driver in DomU by directly
copying skb into the grant table.  Any thoughts for this?

Welcome any suggestion and comments.  Thanks!

Leo

