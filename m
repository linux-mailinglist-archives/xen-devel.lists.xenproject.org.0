Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 11AC36D7930
	for <lists+xen-devel@lfdr.de>; Wed,  5 Apr 2023 12:02:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.518373.804841 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjzxe-0007aD-Sc; Wed, 05 Apr 2023 10:01:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 518373.804841; Wed, 05 Apr 2023 10:01:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjzxe-0007XX-PG; Wed, 05 Apr 2023 10:01:50 +0000
Received: by outflank-mailman (input) for mailman id 518373;
 Wed, 05 Apr 2023 10:01:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Kv/O=74=linaro.org=alex.bennee@srs-se1.protection.inumbo.net>)
 id 1pjzxd-0007XQ-IH
 for xen-devel@lists.xen.org; Wed, 05 Apr 2023 10:01:49 +0000
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [2a00:1450:4864:20::42a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dfee48be-d398-11ed-b464-930f4c7d94ae;
 Wed, 05 Apr 2023 12:01:47 +0200 (CEST)
Received: by mail-wr1-x42a.google.com with SMTP id e18so35587146wra.9
 for <xen-devel@lists.xen.org>; Wed, 05 Apr 2023 03:01:46 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 w7-20020adfec47000000b002cfe687fc7asm14532282wrn.67.2023.04.05.03.01.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Apr 2023 03:01:45 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 1E04B1FFB7;
 Wed,  5 Apr 2023 11:01:45 +0100 (BST)
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
X-Inumbo-ID: dfee48be-d398-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680688906;
        h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
         :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xDFJjTGQNkjMjQaKDKrEsiOprP+3eY5rMht1R3BPmqI=;
        b=qJuUB8lXKPAV5az5FqyOzh/WnCwEbzeWlRe/pF6mMPsBue+wMOt4jrinivf9lbjUpj
         549SQvsI4JEw1kWHpGuzNjjgtF2FaRY74NPXxJL3rebT/OBdwarrYv3hKyub+n6lHD+v
         W1KKhZQ8xjsJwLmRTzhw1Jk0CGJc9RwPZTQr83EK9C0L96NZNLAlfk8qH1mvrT1mhp9E
         V7+aPEI7hnb4bZ+spDvZL1hbXutqqILlju2OgGdfRbp7wMf7Tpzjfq2e+dBmEqUyZHIe
         XvGZlRwMbSL9yUBa64cqjZlqK/PQIpmHT+l9dqKQsfiMiQ0J67JYpgDz+eVq5o4Ks3H7
         Semg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680688906;
        h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
         :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xDFJjTGQNkjMjQaKDKrEsiOprP+3eY5rMht1R3BPmqI=;
        b=XYAdqiSk81kYEuDaSk/klKXTpwdJsJxKFhq960sQLqS1D4lKx3aUOG+xG07OPp6xBN
         M8ZVUgeuuA6yYDUxlBqxPtWTlW0CXPwM3AKna5y0a7E5Qj/0A9otXYwWVGij2xQCCHhV
         zaLO2f9TKNaKwDlqUtqHT6d4nd7tYLrmi1ayfiKlYwuTt2vRGkqNHt+RkRJxpGY916F5
         6F4XLRgVju3J4yHI3sCFmIAGFPFSvXAGW1/kBAI7cOjdohP5t25WmCU91OFPqf9cfChd
         xpiw6em/C+h3vNSesQtZpRX/6telwnr9f4VZjtmUXDNjn6Fx4nYm4HYjNKQXfuXO6v0r
         5sGw==
X-Gm-Message-State: AAQBX9fC2FGlRvloSFXs4NYrxx5q+Jo0LpmzxfFN2LZ/VpDDwSTkcOtG
	SYuz59ZfTbPtiM5fWYXuOJSmyw==
X-Google-Smtp-Source: AKy350ZtC2zcGgpmA1tObIYkI/B3t4R7tGoffPFGOXgc8gOET2D0kOgJ1A31FE4xklaO7MxIT2j8nA==
X-Received: by 2002:adf:f1cc:0:b0:2cf:e67c:8245 with SMTP id z12-20020adff1cc000000b002cfe67c8245mr3708097wro.44.1680688905956;
        Wed, 05 Apr 2023 03:01:45 -0700 (PDT)
References: <cover.1678351495.git.viresh.kumar@linaro.org>
 <20230405080512.nvxiw4lv7hyuzqej@vireshk-i7>
User-agent: mu4e 1.10.0; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: qemu-devel@nongnu.org, virtio-dev@lists.oasis-open.org, Stefan Hajnoczi
 <stefanha@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>, Vincent
 Guittot <vincent.guittot@linaro.org>, stratos-dev@op-lists.linaro.org,
 Oleksandr Tyshchenko <olekstysh@gmail.com>, xen-devel@lists.xen.org,
 Andrew Cooper <andrew.cooper3@citrix.com>, Juergen Gross
 <jgross@suse.com>, Sebastien Boeuf <sebastien.boeuf@intel.com>, Liu Jiang
 <gerry@linux.alibaba.com>, Mathieu Poirier <mathieu.poirier@linaro.org>
Subject: Re: [PATCH V3 0/2] qemu: vhost-user: Support Xen memory mapping quirks
Date: Wed, 05 Apr 2023 11:00:34 +0100
In-reply-to: <20230405080512.nvxiw4lv7hyuzqej@vireshk-i7>
Message-ID: <87h6tulkae.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


Viresh Kumar <viresh.kumar@linaro.org> writes:

> On 09-03-23, 14:20, Viresh Kumar wrote:
>> Hello,
>>=20
>> This patchset tries to update the vhost-user protocol to make it support=
 special
>> memory mapping required in case of Xen hypervisor.
>>=20
>> The first patch is mostly cleanup and second one introduces a new xen sp=
ecific
>> feature.
>
> Can we apply this now ? I have developed code for rust-vmm crates
> based on this and we need to get this merged/finalized first before
> merging those changes.


I've queued into my virtio/vhost-user-device series so I'll get merged
with that series unless mst wants to take it now.

>
> Thanks.


--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

