Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A394337CB6
	for <lists+xen-devel@lfdr.de>; Thu, 11 Mar 2021 19:34:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.96712.183293 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lKQ8N-0007xL-09; Thu, 11 Mar 2021 18:34:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 96712.183293; Thu, 11 Mar 2021 18:34:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lKQ8M-0007ww-T4; Thu, 11 Mar 2021 18:34:06 +0000
Received: by outflank-mailman (input) for mailman id 96712;
 Thu, 11 Mar 2021 18:34:05 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yo+K=IJ=gmail.com=bobbyeshleman@srs-us1.protection.inumbo.net>)
 id 1lKQ8L-0007wr-NM
 for xen-devel@lists.xenproject.org; Thu, 11 Mar 2021 18:34:05 +0000
Received: from mail-pf1-x434.google.com (unknown [2607:f8b0:4864:20::434])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0ce06f15-c045-4b52-b1aa-8b89e7816e0d;
 Thu, 11 Mar 2021 18:34:04 +0000 (UTC)
Received: by mail-pf1-x434.google.com with SMTP id a188so135305pfb.4
 for <xen-devel@lists.xenproject.org>; Thu, 11 Mar 2021 10:34:04 -0800 (PST)
Received: from ?IPv6:2601:1c2:4f80:d230::5? ([2601:1c2:4f80:d230::5])
 by smtp.gmail.com with ESMTPSA id gz4sm2953252pjb.0.2021.03.11.10.34.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Mar 2021 10:34:03 -0800 (PST)
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
X-Inumbo-ID: 0ce06f15-c045-4b52-b1aa-8b89e7816e0d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:organization:to:cc:subject:message-id:date:user-agent
         :mime-version:content-language:content-transfer-encoding;
        bh=Viw3fs9xSOk3floRadbZbBqxhggHQ/CuFwAqa0RM85w=;
        b=fX+pCwlxConGkm8T1dEcR4BTjPw+iL33plnI2vs5ccVvy1EmRYcZekNH5UJtHMYIwg
         n0r/tK4s/oF777QQ5XFj270TAjMSkPJH7YZITI5yOMhdvIRYcpAqlrhk+lZFA6LLfZBL
         /Lm/gbUBstu++1wqmS+1xYcHJPqE4f20WSM3JKZZYJj3CgBnK9qCxT5d1Ce0treA+Gjk
         Myxjw8t8OwGQm2R/grwp5MnO6CQoeW/1gUcx/6gMjcCsyqGCk6JuAK0NtHkKTfmzSbxm
         Qw8qt1k/pftfiY4IUovG5QH5Z/ODWf9dzVjpROmETDtUBeXbau1bJKADr/BqQQeNAkFA
         9h6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:organization:to:cc:subject:message-id:date
         :user-agent:mime-version:content-language:content-transfer-encoding;
        bh=Viw3fs9xSOk3floRadbZbBqxhggHQ/CuFwAqa0RM85w=;
        b=WbHPK0wDeHZenhPvAwr8kP8f2Nwl/nXgNf3ID8cRyNP3WWdLAlgx3YyGDqCx9QdzBV
         TeZPJ0t0kHMA7kccbLoWo8Jv9afdetl45SphnOHT73rkU0QrHj1lo+MECTSb+tqHQlSc
         7ddN3Me3JeemSephuPqZhja+LEXBdgbX33byRLLqIy7pFhh4NRwd0cQttLJM5VNALksh
         E7gQoVr5JGNjduigCrgQyj235CY7tMfzSUCrSRLZ0/jBXdYx93FxPdnuptcsrweQX3jX
         QP4A+Ian9QxvrxInytD3jQKoPWcqrqAm9qCGX0TRHU1RqpoKW+HaJyiWA1MVgRP6rxjk
         U6fw==
X-Gm-Message-State: AOAM530Ma1EKOe93sDfK99UeodFRg35LaTZw6fw5lOm844f0ouath4hD
	gkX/VpgTeDQu7MI9jWCLlKg=
X-Google-Smtp-Source: ABdhPJz+OnX2bGXdnoz61l9f5lQEUzQ/e5w2d6x2Frq/KCIhSVVm2+spVnTQfMFw2XmlYnG71CrblA==
X-Received: by 2002:aa7:8a99:0:b029:1a6:c8b8:1414 with SMTP id a25-20020aa78a990000b02901a6c8b81414mr8363944pfc.66.1615487644214;
        Thu, 11 Mar 2021 10:34:04 -0800 (PST)
From: Bob Eshleman <bobbyeshleman@gmail.com>
Organization: Vates SAS
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, piotr.krol@3mdeb.com,
 Olivier Lambert <olivier.lambert@vates.fr>
Subject: Working Group for Secure Boot
Message-ID: <9280f0d0-e994-71c1-9482-63f97296acb7@gmail.com>
Date: Thu, 11 Mar 2021 10:34:02 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hey all,

We would like to start a working group for secure boot support in Xen
to coordinate the various interested parties and set out a plan for
the feature and its implications for the whole Xen system.

The end goal is a full implementation that restricts the interfaces
dom0 has to affect Xen, akin to Linux's lockdown LSM.  This implicates
important parts of the ABI (e.g., /dev/xen/privcmd/) and so will
require input from the greater community.

I'm not familiar with how working groups function in the Xen project,
so this email also opens the floor for suggestions as to how this might
be managed.

We'd love to hear from anyone interested in such a group and how the
community as a whole feels about such an effort.

Best regards.

---

Bobby Eshleman
SE at Vates SAS

