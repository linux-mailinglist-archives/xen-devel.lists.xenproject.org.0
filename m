Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EE3421EBB34
	for <lists+xen-devel@lfdr.de>; Tue,  2 Jun 2020 14:06:46 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jg5gU-0005Ip-1Z; Tue, 02 Jun 2020 12:06:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=KuHF=7P=redhat.com=philmd@srs-us1.protection.inumbo.net>)
 id 1jg5gS-0005Ih-IX
 for xen-devel@lists.xenproject.org; Tue, 02 Jun 2020 12:06:20 +0000
X-Inumbo-ID: 757a7720-a4c9-11ea-8993-bc764e2007e4
Received: from us-smtp-1.mimecast.com (unknown [207.211.31.81])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 757a7720-a4c9-11ea-8993-bc764e2007e4;
 Tue, 02 Jun 2020 12:06:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591099575;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=d7m2QFyJVw1rLrp1fry7cSRUKAvbCa1EjKPWalkfzgM=;
 b=Wjxdx6Axfwo17oakcxQFwF9SYRLwqy66yjHXu/kDOsTZtusISnlLxffYDhyC+21Wk8dgdG
 pQP/0XWIef7iwdz0YZHkEHKpP+w9kRN+SVOcwVo5s1Pi4zX1dAHILyHZsQZCpg1eej79ws
 mZzo/u/OHojx4rOdGQ23Jz/G1Yjh6Jk=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-379-HzgcIdNxPJWTTIpM-n8EoA-1; Tue, 02 Jun 2020 08:06:11 -0400
X-MC-Unique: HzgcIdNxPJWTTIpM-n8EoA-1
Received: by mail-wm1-f72.google.com with SMTP id 11so760394wmj.6
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jun 2020 05:06:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=d7m2QFyJVw1rLrp1fry7cSRUKAvbCa1EjKPWalkfzgM=;
 b=rK+B0h51qW5Ga0n9gTAKG3vPQ2qSOIjkMM/cH5Yxr22u91yzypnEcs4dKyu0Xw8uHl
 hIjKRsHvQBm9GWzQ217vjLSw9LR4JoC8WrEgWsADieZMAGXr7iHhIQDB8G+fbZs5VISC
 k//MhSjtlSVVAOEuh6UOKqWS3mHaBmpSLiMm0yuSm4gCmfUicExQ9KMftYeUV5BCOVD8
 0I605bMqFNbGKJm+WQ93E7t75QXRqh+rRLupQ9uZFDP+sKtqAnkRmDPAlkjZKuL675eA
 Opu8jv15JXlfXkrFFw3AUaM+R49sKjRMt9ukUDbCG9Pe7uscnK+uo6A/nKTQDm15x2WG
 5Vpg==
X-Gm-Message-State: AOAM533TtLneQkSd0QAHsS3IIL1uDLi3W05fdA4/q2Ngn26m5PskxihA
 8Kmu6+bt/32Q5K0MZvl0txEdhao6eZddaOdebDPu1atkl9IZJt09cTkTivkAFuXt1kCHjsVfFyh
 TvRLnivr0CaLvqNPZSV8AS5x9DAE=
X-Received: by 2002:a1c:e20a:: with SMTP id z10mr3595243wmg.63.1591099570434; 
 Tue, 02 Jun 2020 05:06:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz6/5iO0FjobYpMpwbo/RzDPk0W+RqLPZyFssRcCX6GjUd4vY6UZSLo9NiCzNn0T62+PgeDMA==
X-Received: by 2002:a1c:e20a:: with SMTP id z10mr3595223wmg.63.1591099570229; 
 Tue, 02 Jun 2020 05:06:10 -0700 (PDT)
Received: from [192.168.1.43] (181.red-88-10-103.dynamicip.rima-tde.net.
 [88.10.103.181])
 by smtp.gmail.com with ESMTPSA id k14sm3392890wrq.97.2020.06.02.05.06.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Jun 2020 05:06:09 -0700 (PDT)
Subject: Re: [PATCH v8 5/8] qdev-properties: make blocksize accept size
 suffixes
To: Roman Kagan <rvkagan@yandex-team.ru>, qemu-devel@nongnu.org
References: <20200528225516.1676602-1-rvkagan@yandex-team.ru>
 <20200528225516.1676602-6-rvkagan@yandex-team.ru>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Autocrypt: addr=philmd@redhat.com; keydata=
 mQINBDXML8YBEADXCtUkDBKQvNsQA7sDpw6YLE/1tKHwm24A1au9Hfy/OFmkpzo+MD+dYc+7
 bvnqWAeGweq2SDq8zbzFZ1gJBd6+e5v1a/UrTxvwBk51yEkadrpRbi+r2bDpTJwXc/uEtYAB
 GvsTZMtiQVA4kRID1KCdgLa3zztPLCj5H1VZhqZsiGvXa/nMIlhvacRXdbgllPPJ72cLUkXf
 z1Zu4AkEKpccZaJspmLWGSzGu6UTZ7UfVeR2Hcc2KI9oZB1qthmZ1+PZyGZ/Dy+z+zklC0xl
 XIpQPmnfy9+/1hj1LzJ+pe3HzEodtlVA+rdttSvA6nmHKIt8Ul6b/h1DFTmUT1lN1WbAGxmg
 CH1O26cz5nTrzdjoqC/b8PpZiT0kO5MKKgiu5S4PRIxW2+RA4H9nq7nztNZ1Y39bDpzwE5Sp
 bDHzd5owmLxMLZAINtCtQuRbSOcMjZlg4zohA9TQP9krGIk+qTR+H4CV22sWldSkVtsoTaA2
 qNeSJhfHQY0TyQvFbqRsSNIe2gTDzzEQ8itsmdHHE/yzhcCVvlUzXhAT6pIN0OT+cdsTTfif
 MIcDboys92auTuJ7U+4jWF1+WUaJ8gDL69ThAsu7mGDBbm80P3vvUZ4fQM14NkxOnuGRrJxO
 qjWNJ2ZUxgyHAh5TCxMLKWZoL5hpnvx3dF3Ti9HW2dsUUWICSQARAQABtDJQaGlsaXBwZSBN
 YXRoaWV1LURhdWTDqSAoUGhpbCkgPHBoaWxtZEByZWRoYXQuY29tPokCVQQTAQgAPwIbDwYL
 CQgHAwIGFQgCCQoLBBYCAwECHgECF4AWIQSJweePYB7obIZ0lcuio/1u3q3A3gUCXsfWwAUJ
 KtymWgAKCRCio/1u3q3A3ircD/9Vjh3aFNJ3uF3hddeoFg1H038wZr/xi8/rX27M1Vj2j9VH
 0B8Olp4KUQw/hyO6kUxqkoojmzRpmzvlpZ0cUiZJo2bQIWnvScyHxFCv33kHe+YEIqoJlaQc
 JfKYlbCoubz+02E2A6bFD9+BvCY0LBbEj5POwyKGiDMjHKCGuzSuDRbCn0Mz4kCa7nFMF5Jv
 piC+JemRdiBd6102ThqgIsyGEBXuf1sy0QIVyXgaqr9O2b/0VoXpQId7yY7OJuYYxs7kQoXI
 6WzSMpmuXGkmfxOgbc/L6YbzB0JOriX0iRClxu4dEUg8Bs2pNnr6huY2Ft+qb41RzCJvvMyu
 gS32LfN0bTZ6Qm2A8ayMtUQgnwZDSO23OKgQWZVglGliY3ezHZ6lVwC24Vjkmq/2yBSLakZE
 6DZUjZzCW1nvtRK05ebyK6tofRsx8xB8pL/kcBb9nCuh70aLR+5cmE41X4O+MVJbwfP5s/RW
 9BFSL3qgXuXso/3XuWTQjJJGgKhB6xXjMmb1J4q/h5IuVV4juv1Fem9sfmyrh+Wi5V1IzKI7
 RPJ3KVb937eBgSENk53P0gUorwzUcO+ASEo3Z1cBKkJSPigDbeEjVfXQMzNt0oDRzpQqH2vp
 apo2jHnidWt8BsckuWZpxcZ9+/9obQ55DyVQHGiTN39hkETy3Emdnz1JVHTU0Q==
Message-ID: <3b747d26-4bba-7691-c13b-a48c8df5257b@redhat.com>
Date: Tue, 2 Jun 2020 14:06:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200528225516.1676602-6-rvkagan@yandex-team.ru>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 Paul Durrant <paul@xen.org>, Eric Blake <eblake@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 Max Reitz <mreitz@redhat.com>, Keith Busch <kbusch@kernel.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 John Snow <jsnow@redhat.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 5/29/20 12:55 AM, Roman Kagan wrote:
> It appears convenient to be able to specify physical_block_size and
> logical_block_size using common size suffixes.
> 
> Teach the blocksize property setter to interpret them.  Also express the
> upper and lower limits in the respective units.
> 
> Signed-off-by: Roman Kagan <rvkagan@yandex-team.ru>
> Reviewed-by: Eric Blake <eblake@redhat.com>
> ---
>  hw/core/qdev-properties.c | 16 +++++++++-------
>  1 file changed, 9 insertions(+), 7 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


