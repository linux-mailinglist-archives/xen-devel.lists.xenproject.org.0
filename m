Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BF0F36DFA8F
	for <lists+xen-devel@lfdr.de>; Wed, 12 Apr 2023 17:49:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.520253.807640 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pmciL-0003JX-CR; Wed, 12 Apr 2023 15:48:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 520253.807640; Wed, 12 Apr 2023 15:48:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pmciL-0003Gm-9W; Wed, 12 Apr 2023 15:48:53 +0000
Received: by outflank-mailman (input) for mailman id 520253;
 Wed, 12 Apr 2023 15:48:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=YunU=AD=rabbit.lu=slack@srs-se1.protection.inumbo.net>)
 id 1pmciJ-0003Gf-GC
 for xen-devel@lists.xenproject.org; Wed, 12 Apr 2023 15:48:51 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 84108b4c-d949-11ed-8611-37d641c3527e;
 Wed, 12 Apr 2023 17:48:49 +0200 (CEST)
Received: by mail-wm1-x330.google.com with SMTP id
 n19-20020a05600c501300b003f064936c3eso11523826wmr.0
 for <xen-devel@lists.xenproject.org>; Wed, 12 Apr 2023 08:48:49 -0700 (PDT)
Received: from [192.168.2.1] (82-64-138-184.subs.proxad.net. [82.64.138.184])
 by smtp.googlemail.com with ESMTPSA id
 p23-20020a1c7417000000b003f0824e8c92sm2785131wmc.7.2023.04.12.08.48.48
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Apr 2023 08:48:48 -0700 (PDT)
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
X-Inumbo-ID: 84108b4c-d949-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rabbit-lu.20210112.gappssmtp.com; s=20210112; t=1681314528; x=1683906528;
        h=content-transfer-encoding:content-language:to:subject:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6LBfq31O2AAEWRG4ywnAOsuD4uMl32CAztINfYySm/o=;
        b=FomN/lr86BLNsr3Y6cWC+1+pMbxorYG9R719VX9WrNvHZJTeZ4y4gy7Hxc8h0IuPFv
         Obb5gp+sgDGmu6fI2h9Rz36/Vq/uhoDSvPzjHhTLKNDZlT0W1kTOVIHy3YeSIgD+907Y
         k2+cAIZRcpzgLey++BfSxQysBcaqm83FKMdY6AuRlgt6RfCdRjWdhw/vZBQwzgjSYUyD
         8a1KSEZ4kug8fGGNzrdEKpV5KssgDq7w6Zdd2Z8HeUmAz+wJnzlXZKE0auPiSbIM4uFX
         YmzCz31IcXt+TMYZolqT+Ca4fen/pcrZBDE4f6dJaKqkln/Mf4IWh6EhbJ9GV9D2q9Rx
         K4Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681314528; x=1683906528;
        h=content-transfer-encoding:content-language:to:subject:from
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6LBfq31O2AAEWRG4ywnAOsuD4uMl32CAztINfYySm/o=;
        b=g03A9ZG63od65j7Q9eoLTZmAX2zSPIHay1V+5IStWVh+/B4FfEi16M4zJ0LZJKuNf1
         2qhzo92DFwQ/KrbxBRp69mv5JBDKUAlJDYn9+s780xDpXhjt3QHOZ5gEWTmoTEV0b2V5
         yxEQhN2b9VSjbOqKR45DkX5vagTurWZsxavzEDGVq+SJPYFWgxTg/s024UOIietztrg9
         dUCd7OcFXPAYg7n9nbdnzS1Je3UWQYFwOdqRe4Ntb2yqx0mHUupQFO7bjEWDZBfWhYa1
         CI/KU05eLbw90FhyWpZVzdmH1CskUGqw6bt9WMDEn3VgJNP+pz3y/LNRGrlxW1r8e05J
         3V5w==
X-Gm-Message-State: AAQBX9d1UZ3A2AMD2s79vM04McIr/tZc5aXNfHfqPpn8FgRxWDzVNe3t
	k1mL+GdFQiZPXhwvjggXV1UzIN/jDfmsxCQFxfI=
X-Google-Smtp-Source: AKy350ZulnTz82F7LR/eWwDJDfiN8TI/mkgCMOD78h2qvnKeIWRImZdwnFRQOMiUurBImH3ktPxG+g==
X-Received: by 2002:a7b:c4c8:0:b0:3f0:9b53:b997 with SMTP id g8-20020a7bc4c8000000b003f09b53b997mr2609182wmk.35.1681314528622;
        Wed, 12 Apr 2023 08:48:48 -0700 (PDT)
Message-ID: <3065c524-07c7-6458-ff4c-ba68ff78c946@rabbit.lu>
Date: Wed, 12 Apr 2023 17:48:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
From: zithro <slack@rabbit.lu>
Subject: xenstored: EACCESS error accessing control/feature-balloon 1
To: xen-devel@lists.xenproject.org
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi all,

this is what I have in "xenstored-access.log" in dom0 :

[20230411T23:48:27.917Z]  D5         write     control/feature-balloon 1
[20230411T23:48:27.917Z]  D5         error     EACCES
[20230411T23:48:27.923Z]  D5         write     data/updated Wed Apr 12 
01:48:27 CEST 2023

It happens once each minute, on two different hosts, both amd64.
(both hosts using the same config, only the hardware differs).

I tried looking up for a similar bug, but didn't find one.
I apologize in advance if this error is known, and if this is not the
place to report this !

-----------------------
Technical infos
-----------------------
dom0s:

Debian stable, kernel 5.10.0-21-amd64
Xen 4.14.5
xl.conf has : autoballoon="0"
GRUB_CMDLINE_XEN="dom0_mem=2048M,max:2048M dom0_max_vcpus=4 
dom0_vcpus_pin loglvl=all guest_loglvl=all ucode=scan iommu=verbose"
Running "xenstore-ls -f -p | grep balloon" returns no result
-----------------------
domUs (D5 in above logs):

HVM TrueNAS Core, based on FreeBSD 13.1-RELEASE-p7
(it happened also on previous FreeBSD realeases, but don't remember when
it started, logs have been filled and rotated).
In cfg files, using either the same value for "memory" and "maxmem" or 
only setting "memory" give the same results.

What's strange is that I have xen* commands in FreeNAS :

xen-detect        xenstore-control  xenstore-ls       xenstore-watch
xenstore          xenstore-exists   xenstore-read     xenstore-write
xenstore-chmod    xenstore-list     xenstore-rm

root@truenas[~]# xenstore-ls
xenstore-ls: xs_directory (/): Permission denied

root@truenas[~]# ps aux
root   [...]     0:36.98 [xenwatch]
root   [...]     0:01.01 [xenstore_rcv]
root   [...]     0:00.00 [balloon]
root   [...]     0:01.74 /bin/sh /usr/local/sbin/xe-daemon -p 
/var/run/xe-daemon.pid
[...]

The xe-daemon looks strange also, I don't use XenServer/XCP-ng, only
"raw" Xen.
And this script which hand

I also use PFsense domUs (based on FreeBSD), but they don't exhibit
this behaviour (ie. no xenstore access error in dom0, no xen*
commands in domU).

So is this a problem with TrueNAS rather than with Xen ?
If so I apologize for wasting your time.

Thanks, have a nice day !
(and as it's my first post here: thx for Xen, it rocks)

zithro

