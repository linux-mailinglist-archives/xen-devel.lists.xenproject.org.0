Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F0FC6D79A4
	for <lists+xen-devel@lfdr.de>; Wed,  5 Apr 2023 12:27:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.518414.804951 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pk0Lx-0007ms-Ko; Wed, 05 Apr 2023 10:26:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 518414.804951; Wed, 05 Apr 2023 10:26:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pk0Lx-0007kP-Hy; Wed, 05 Apr 2023 10:26:57 +0000
Received: by outflank-mailman (input) for mailman id 518414;
 Wed, 05 Apr 2023 10:26:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Kv/O=74=linaro.org=alex.bennee@srs-se1.protection.inumbo.net>)
 id 1pk0Lv-0007kH-OS
 for xen-devel@lists.xen.org; Wed, 05 Apr 2023 10:26:55 +0000
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [2a00:1450:4864:20::431])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 624caf44-d39c-11ed-85db-49a42c6b2330;
 Wed, 05 Apr 2023 12:26:54 +0200 (CEST)
Received: by mail-wr1-x431.google.com with SMTP id l12so35644946wrm.10
 for <xen-devel@lists.xen.org>; Wed, 05 Apr 2023 03:26:53 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 bd5-20020a05600c1f0500b003f0472ffc7csm1768461wmb.11.2023.04.05.03.26.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Apr 2023 03:26:52 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 7DA471FFB7;
 Wed,  5 Apr 2023 11:26:52 +0100 (BST)
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
X-Inumbo-ID: 624caf44-d39c-11ed-85db-49a42c6b2330
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680690413;
        h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
         :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Lww6dDMe0bMEJli6/6ZP6j4C+of80/qR+ErByK0yw5g=;
        b=A+4oG+PJQ4lEZ6T1z8xTGbTG1pEru7t6wl92B6x2UAdtjSn4xJzf7eV7I2j4gpyXbn
         92WZ5xE3JJgQFywvuyLRJMG40XXULmggfQHz69w92CEIWEygoSuigsrjq9ht1V3Zgu4i
         z6TNY9OfzzcZUcU6HOCAxUSIK/3goyowjInTAglW7fsosL6LxLa21DNgd+90SoYxNwuq
         nd1NNnRxAH+BUWyGiJkYqmYw+QSWqTzOkEiAh19YsI+W7wvfl1+9S9BkkI5tN+bxmvJZ
         grxortISRJgmJfB1B0BK78szZCrNSh2iGdM/WCCfqUuU/hheHyQVJZmwC0sSHOmCINwS
         /EBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680690413;
        h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
         :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Lww6dDMe0bMEJli6/6ZP6j4C+of80/qR+ErByK0yw5g=;
        b=RTx3Mudl1P+J4p5Le4iBC1iyLBqzS8Rv8UWS9wPq1ZzUutVHnCs+3eLeYthxVU2nX0
         31kr/iO12ZomSdAtxRNcIb9h0dPtxsuHK86jSsowCwCsvI3eub/gszdTTa9nZOWBZpoS
         32GAss6SdUmPz6jh1oACyDymOkFZEzV4s9EwmIE+lBk5xrYqT89K8olwtxLK8YfY33JY
         3vT3mGzdXJklb0JylTN2KpZb7HvHJXbrNaAyVCdVGZqUBk6l3TPoPejUnPEZCaFdCsvg
         tT5WvsjX5dMl/aP9IBpOWGpeyQ5D/QzwJL3+jJM30ZAqJ0Q28UrbkZxHL+qDAjtcWwIJ
         YAmg==
X-Gm-Message-State: AAQBX9cKsEvctpLDr+b1F5gN7xnbjsS2FisLyz2aCaEJWG0qS51LmgCf
	v7YLj7f+/keL6diCuH+z7mwXkw==
X-Google-Smtp-Source: AKy350bNr4KJH+ZbusBX8ddHYWCR5TF9ug/D4hQCNf5bE3nZzYv03gsenyNx3XTYaQjbqtu0borjcw==
X-Received: by 2002:a5d:6b0a:0:b0:2cd:bc79:5444 with SMTP id v10-20020a5d6b0a000000b002cdbc795444mr3747030wrw.2.1680690413210;
        Wed, 05 Apr 2023 03:26:53 -0700 (PDT)
References: <cover.1678351495.git.viresh.kumar@linaro.org>
 <20230405080512.nvxiw4lv7hyuzqej@vireshk-i7> <87h6tulkae.fsf@linaro.org>
 <20230405060340-mutt-send-email-mst@kernel.org>
User-agent: mu4e 1.10.0; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Viresh Kumar <viresh.kumar@linaro.org>, qemu-devel@nongnu.org,
 virtio-dev@lists.oasis-open.org, Stefan Hajnoczi <stefanha@redhat.com>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 stratos-dev@op-lists.linaro.org, Oleksandr Tyshchenko
 <olekstysh@gmail.com>, xen-devel@lists.xen.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, Juergen Gross <jgross@suse.com>, Sebastien
 Boeuf <sebastien.boeuf@intel.com>, Liu Jiang <gerry@linux.alibaba.com>,
 Mathieu Poirier <mathieu.poirier@linaro.org>
Subject: Re: [PATCH V3 0/2] qemu: vhost-user: Support Xen memory mapping quirks
Date: Wed, 05 Apr 2023 11:24:43 +0100
In-reply-to: <20230405060340-mutt-send-email-mst@kernel.org>
Message-ID: <87cz4ilj4j.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


"Michael S. Tsirkin" <mst@redhat.com> writes:

> On Wed, Apr 05, 2023 at 11:00:34AM +0100, Alex Benn=C3=A9e wrote:
>>=20
>> Viresh Kumar <viresh.kumar@linaro.org> writes:
>>=20
>> > On 09-03-23, 14:20, Viresh Kumar wrote:
>> >> Hello,
>> >>=20
>> >> This patchset tries to update the vhost-user protocol to make it supp=
ort special
>> >> memory mapping required in case of Xen hypervisor.
>> >>=20
>> >> The first patch is mostly cleanup and second one introduces a new xen=
 specific
>> >> feature.
>> >
>> > Can we apply this now ? I have developed code for rust-vmm crates
>> > based on this and we need to get this merged/finalized first before
>> > merging those changes.
>>=20
>>=20
>> I've queued into my virtio/vhost-user-device series so I'll get merged
>> with that series unless mst wants to take it now.
>
> Well the patches are tagged and I was going to take these after the relea=
se.
> Probably easier not to work on this in two trees.
> Still if there's something in your tree being blocked
> by these patches then
> Acked-by: Michael S. Tsirkin <mst@redhat.com>
> Let me know.

The virtio/vhost-user-device tree work is orthogonal to this vhost-user
enhancement although all the work is related to our latest VirtIO
project inside Linaro, Orko:
https://linaro.atlassian.net/wiki/spaces/ORKO/overview

So if you are happy please take these patches now for when the tree
re-opens.

>
>
>> >
>> > Thanks.
>>=20
>>=20
>> --=20
>> Alex Benn=C3=A9e
>> Virtualisation Tech Lead @ Linaro


--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

