Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 86C1E76D38B
	for <lists+xen-devel@lfdr.de>; Wed,  2 Aug 2023 18:20:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.575076.900825 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qREZC-0002PM-0N; Wed, 02 Aug 2023 16:19:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 575076.900825; Wed, 02 Aug 2023 16:19:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qREZB-0002N1-Tu; Wed, 02 Aug 2023 16:19:17 +0000
Received: by outflank-mailman (input) for mailman id 575076;
 Wed, 02 Aug 2023 16:19:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=rdMi=DT=rabbit.lu=slack@srs-se1.protection.inumbo.net>)
 id 1qREZ9-0002Mt-SP
 for xen-devel@lists.xenproject.org; Wed, 02 Aug 2023 16:19:16 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 528be2e0-3150-11ee-b262-6b7b168915f2;
 Wed, 02 Aug 2023 18:19:14 +0200 (CEST)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-3fe2bc2701bso241745e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 02 Aug 2023 09:19:14 -0700 (PDT)
Received: from [192.168.2.1] (82-64-138-184.subs.proxad.net. [82.64.138.184])
 by smtp.googlemail.com with ESMTPSA id
 22-20020a05600c22d600b003fbb618f7adsm2069195wmg.15.2023.08.02.09.19.09
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Aug 2023 09:19:11 -0700 (PDT)
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
X-Inumbo-ID: 528be2e0-3150-11ee-b262-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rabbit-lu.20221208.gappssmtp.com; s=20221208; t=1690993154; x=1691597954;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uOrjw3OVIELigHd6J8onu3wawRYKujsftrlpLv+TAgM=;
        b=Sk24tqc+5FebLHoamkHyQEzK2ViGxDcERwYLQhqe952i3HuExmq1Lu6XmQEJKX8z1p
         fOF/Wo4Qex4X6t8seClEDBcW1GJINe7Am7ICiyv41/egw5ocX8VPEheeQ1/lsDvDytOp
         IrWV1G8OrPTAKnjS3ZjvBOimO4j9xordBAIQznq5tSd9N9F6p5V3ux24yhlMTR15kkRm
         5eDqSKGVsTqjMtae40yEOtx1FrEc2X4GrQa+ylNt9OHovAkm9K1MzqXS5m5NXgdeXj05
         EnZExh4B+4/hk8f/ffM06iN5LD3lZLBgWTaM6tyOo3ynfO1W2QjiNEErnOyfG4aCaPQ5
         0Abw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690993154; x=1691597954;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=uOrjw3OVIELigHd6J8onu3wawRYKujsftrlpLv+TAgM=;
        b=EYUB60TuuyT4bKXIeKb1qA/vfygNkl7nldajRzOuStkKCn8a8/IjSle5pKFjsyXxUL
         HRHZDcbGLQQcATxSO8Cqu+P+7GCHIJ/9qKOQ/ASO+xERHnsc42QkTJDF5hLbuyIWqdVC
         Ln+5U4SO1uxlwvsRNMLti9emWNb9n3Vp73FtjDM/2aO+GqNXrsVai/tN/f5/4AF9n9Z9
         Dp5A3yKGCS4lGaJ7CYrnfmjQ4vjTsPi9d4Ul7A163lo2IOD4WpezPCmPUOk5RDNhzkmk
         Bq48zhxakrEZb8nk3nAnAtOrEeHDBlVMcg+9/HOEu5tFh8e8E3DQxgq4gXpI3/XmIFWM
         HitQ==
X-Gm-Message-State: ABy/qLbZp0RaL/AN6V/J18ATzkkUFY8S0XDWVK+fGfQnSh8PdcUMSjLw
	rTsJVF5sNHU5p+MGxykSiFJX+DWq1zt3JN6XU40=
X-Google-Smtp-Source: APBJJlEh6fCrXDrhqN2eTIB19YNxuRiNTr5vrGAEBDadKq1INRMdqQzX/2Zqt4AkPatzS3HByMvBRg==
X-Received: by 2002:a1c:7c03:0:b0:3fe:2140:f504 with SMTP id x3-20020a1c7c03000000b003fe2140f504mr5553845wmc.20.1690993154130;
        Wed, 02 Aug 2023 09:19:14 -0700 (PDT)
Message-ID: <f3d98514-0dbf-d6fd-c0da-cda4fca6152c@rabbit.lu>
Date: Wed, 2 Aug 2023 18:19:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.1
Content-Language: en-US
To: xen-devel@lists.xenproject.org
From: zithro <slack@rabbit.lu>
Subject: Network interfaces naming changes in domUs with >10 vifs (Debian bug
 1042842)
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello all,

I report here following a discussion on #xen-devel about Debian bug 
1042842 (https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=1042842).

When using more than 10 vifs in a domU on Xen 4.14 (deb11), the 
attributions are like :

vifX.0 <> eth0
vifX.1 <> eth1
vifX.2 <> eth2
[...]
vifX.10 <> eth10

With Xen 4.17 (deb12), it changes to :

vifX.0 <> eth0
vifX.1 <> eth1
vifX.10 <> eth2
vifX.2 <> eth3
[...]

Both tests are using oxenstored (the default in Debian 11/12), I don't 
know for the bug reporter. I didn't try cxenstored.
The bug reporter mentionned commit 
"http://xenbits.xen.org/gitweb/?p=xen.git;a=commit;h=fce6999", I don't 
know if it's related or not.
For now, he's using "/etc/network/interfaces" to force the attribution.

If I understood correctly, all people who answered on IRC think this is 
"not-a-Xen bug", but I was asked to post here for all to discuss.

For more context, I extracted some comments from IRC (I removed 
usernames as I didn't know if I was allowed to quote them).

Thanks !

--------------
IRC DISCUSSION
--------------

- AFAIK, there is no sorting in Xenstored. And you should not expect 
that even if libxl sorted properly it will be seen in the same order on 
the other end.
- is the ethN number in domU related to vif number in xenstore, or to 
device detection order?
- there's no order to eth names at all. they're allocated 
first-come-first-serve, so it entirely depends on how parallel the 
probing of nic drivers are. even if netfront is serialised around 
xenstore accesses, it probably allocates in the order that XS_DIRECTORY 
comes back with
- from simple tests, it looks like VIFs are created in Xenstore in the 
order of the config file, but if you "xenstore-ls /[...]/vif", you can 
see vifs are ordered like vif1,vif10,vif11,vif2,etc
- the order is different between Xen 4.14 and 4.17 (ie. the "expected" 
order works on 4.14, not 4.17)
- But really, Debian should have never relied on how the nodes are 
ordered. This is not something we guarantee in the Xenstored API
- the last big batch of XSA content for the xenstoreds did some major 
rearranging of oxenstored. We dropped a NIH second garbage collector, 
and a NIH weakref system IIRC. I could entirely believe that the 
apparent sort order changed as a result
- generally, I think Linux world established quite some time ago that 
ethN names are not stable
- It's definitely a complicated issue.  Perhaps best to post to 
xen-devel so we can have a discussion. I expect the answer is not-a-Xen 
bug, but I don't think we have a clear understanding of the problem yet


--
zithro / Cyril

