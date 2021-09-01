Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 235BE3FD616
	for <lists+xen-devel@lfdr.de>; Wed,  1 Sep 2021 10:59:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.176133.320589 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mLM5k-0000PP-OX; Wed, 01 Sep 2021 08:59:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 176133.320589; Wed, 01 Sep 2021 08:59:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mLM5k-0000NV-L5; Wed, 01 Sep 2021 08:59:32 +0000
Received: by outflank-mailman (input) for mailman id 176133;
 Wed, 01 Sep 2021 08:59:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qyqW=NX=linaro.org=alex.bennee@srs-us1.protection.inumbo.net>)
 id 1mLM5i-0000NG-KF
 for xen-devel@lists.xenproject.org; Wed, 01 Sep 2021 08:59:30 +0000
Received: from mail-wm1-x32c.google.com (unknown [2a00:1450:4864:20::32c])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4befbfe0-02cf-4f58-ae92-cc2125c322fc;
 Wed, 01 Sep 2021 08:59:29 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 u15-20020a05600c19cf00b002f6445b8f55so1012152wmq.0
 for <xen-devel@lists.xenproject.org>; Wed, 01 Sep 2021 01:59:29 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id q11sm4990687wmc.41.2021.09.01.01.59.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Sep 2021 01:59:27 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id E26A91FF96;
 Wed,  1 Sep 2021 09:59:26 +0100 (BST)
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
X-Inumbo-ID: 4befbfe0-02cf-4f58-ae92-cc2125c322fc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=references:user-agent:from:to:cc:subject:date:in-reply-to
         :message-id:mime-version:content-transfer-encoding;
        bh=4vx7Zbm8CuixWNdewxmOaS8u+QseNO7OTa6aQNrm0kI=;
        b=Dn56lMmrX0vlpkgbNgHhqRiO345nhCfgtmp3bXAdFY+1uszjRzJj3wC+21HEB3EUDi
         CbcMUWUe3+SjAPdtvjLenZP/vubL3FhqjPm5Dvcs01tds9PIkDgTal7dX5qrLBPnfoPA
         bh45l88MiLik/bdk8Fk6pEI2Xn1GqsV8X88IFUxQiiumqrwhDwpAO9fuBmPKmejsy8UU
         3i4UdlvkfACw/gz3uEvM8Ipw+vYnbMMkM3IM/oCTYU3YTtOijHfCgJe0LvunsEVeUchE
         cE2yp4J+6JAg4F6pN4F7APMOL7eBwaV5A/58njHTalQSj5MFZEdP5revZmdYmHRouKhk
         MPLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
         :in-reply-to:message-id:mime-version:content-transfer-encoding;
        bh=4vx7Zbm8CuixWNdewxmOaS8u+QseNO7OTa6aQNrm0kI=;
        b=NPbvgMkRZmSNcVhbh6p/H/Wq+LvA6KjOWSu+8UGtp0tQM0beWpslObKmYG83SqZm3n
         /vHB4ZGgn3LS4RKp5isa2eIhgpcvXlgvlWsJqfHP4ppSyIMGqRzieSSxKPdqrcpCcWAX
         B3k0Xr1vGnZZOMhlN1jG8txj2V8KWfgzrqmPYy4TR62mb8+fuebzoCFmZ+jNHnyai59H
         G+4isKQPFGBPjBm7jyxLNugJAAniu2u1Ey+v7nIxGpWQLUNy4VC40bylgYN7q6+Z/0Pa
         NsnwUhpNmjsg+kEbWFJgCnydeE0rECikRxdSnLoKLa3XzcCMDKdT/nhUsDz81w6X7SOT
         pcZw==
X-Gm-Message-State: AOAM530MIKCoA1GJm5Af54q6AsB/n2pluN9zXrm6Febakv7v0+n1C4Y2
	0YeYrmXgTEQHrw/Y31VzpAhuiw==
X-Google-Smtp-Source: ABdhPJy1JDP7j3J1vzC7astXeHHHohtbMvmxOm+XGvKbN37GI/QmPrNdycwQml/nktVwrMmQ0N4VcA==
X-Received: by 2002:a1c:f314:: with SMTP id q20mr8677397wmq.154.1630486768626;
        Wed, 01 Sep 2021 01:59:28 -0700 (PDT)
References: <87v94ldrqq.fsf@linaro.org>
 <alpine.DEB.2.21.2108041055390.9768@sstabellini-ThinkPad-T480s>
 <0100017b33e585a5-06d4248e-b1a7-485e-800c-7ead89e5f916-000000@email.amazonses.com>
 <CAHFG_=WKjJ1riKtaWC8jm13shc3RtVsNNqd3j9WD9Fq0NeRS2Q@mail.gmail.com>
 <20210813051038.GA77540@laputa>
User-agent: mu4e 1.7.0; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: AKASHI Takahiro <takahiro.akashi@linaro.org>
Cc: Fran??ois Ozog <francois.ozog@linaro.org>, Stefano Stabellini
 <sstabellini@kernel.org>, paul@xen.org, Stratos Mailing List
 <stratos-dev@op-lists.linaro.org>, virtio-dev@lists.oasis-open.org, Jan
 Kiszka <jan.kiszka@siemens.com>, Arnd Bergmann <arnd.bergmann@linaro.org>,
 jgross@suse.com, julien@xen.org, Carl van Schaik
 <cvanscha@qti.qualcomm.com>, Bertrand.Marquis@arm.com,
 stefanha@redhat.com, Artem_Mygaiev@epam.com, xen-devel@lists.xen.org,
 olekstysh@gmail.com, Oleksandr_Tyshchenko@epam.com,
 xen-devel@lists.xenproject.org
Subject: Re: [Stratos-dev] Enabling hypervisor agnosticism for VirtIO backends
Date: Wed, 01 Sep 2021 09:57:45 +0100
In-reply-to: <20210813051038.GA77540@laputa>
Message-ID: <87eea8hdsh.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


AKASHI Takahiro <takahiro.akashi@linaro.org> writes:

> Hi Fran=C3=A7ois,
>
> On Thu, Aug 12, 2021 at 09:55:52AM +0200, Fran??ois Ozog wrote:
>> I top post as I find it difficult to identify where to make the comments.
>
> Thank you for the posting.=20
> I think that we should first discuss more about the goal/requirements/
> practical use cases for the framework.
>
>> 1) BE acceleration
>> Network and storage backends may actually be executed in SmartNICs. As
>> virtio 1.1 is hardware friendly, there may be SmartNICs with virtio 1.1 =
PCI
>> VFs. Is it a valid use case for the generic BE framework to be used in t=
his
>> context?
>> DPDK is used in some BE to significantly accelerate switching. DPDK is a=
lso
>> used sometimes in guests. In that case, there are no event injection but
>> just high performance memory scheme. Is this considered as a use case?
>
> I'm not quite familiar with DPDK but it seems to be heavily reliant
> on not only virtqueues but also kvm/linux features/functionality, say,
> according to [1].
> I'm afraid that DPDK is not suitable for primary (at least, initial)
> target use.
> # In my proposal, virtio-proxy, I have in mind the assumption that we wou=
ld
> # create BE VM as a baremetal application on RTOS (and/or unikernel.)
>
> But as far as virtqueue is concerned, I think we can discuss in general
> technical details as Alex suggested, including:
> - sharing or mapping memory regions for data payload
> - efficient notification mechanism
>
> [1] https://www.redhat.com/en/blog/journey-vhost-users-realm
>
>> 2) Virtio as OS HAL
>> Panasonic CTO has been calling for a virtio based HAL and based on the
>> teachings of Google GKI, an internal HAL seem inevitable in the long ter=
m.
>> Virtio is then a contender to Google promoted Android HAL. Could the
>> framework be used in that context?
>
> In this case, where will the implementation of "HAL" reside?
> I don't think the portability of "HAL" code (as a set of virtio BEs)
> is a requirement here.

When I hear people referring to VirtIO HALs I'm thinking mainly of
VirtIO FE's living in a Linux kernel. There are certainly more devices
that can get added but the commonality on the guest side I think is
pretty much a solved problem (modulo Linux-ism's creeping into the
virtio spec).

--=20
Alex Benn=C3=A9e

