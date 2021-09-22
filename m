Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 25F9B414F40
	for <lists+xen-devel@lfdr.de>; Wed, 22 Sep 2021 19:38:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.192969.343724 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mT6Bs-0004nF-O6; Wed, 22 Sep 2021 17:37:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 192969.343724; Wed, 22 Sep 2021 17:37:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mT6Bs-0004jw-K4; Wed, 22 Sep 2021 17:37:52 +0000
Received: by outflank-mailman (input) for mailman id 192969;
 Wed, 22 Sep 2021 17:37:51 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=tKcP=OM=redhat.com=philmd@srs-us1.protection.inumbo.net>)
 id 1mT6Bq-0004jq-NY
 for xen-devel@lists.xenproject.org; Wed, 22 Sep 2021 17:37:50 +0000
Received: from us-smtp-delivery-124.mimecast.com (unknown [216.205.24.124])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id ce3ffac2-1bcb-11ec-b9c1-12813bfff9fa;
 Wed, 22 Sep 2021 17:37:49 +0000 (UTC)
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-145-s3trJ2EeMrStDEAWK4WXKQ-1; Wed, 22 Sep 2021 13:37:47 -0400
Received: by mail-wr1-f69.google.com with SMTP id
 j16-20020adfa550000000b0016012acc443so2828563wrb.14
 for <xen-devel@lists.xenproject.org>; Wed, 22 Sep 2021 10:37:47 -0700 (PDT)
Received: from [192.168.1.36] (118.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id v10sm3041925wri.29.2021.09.22.10.37.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Sep 2021 10:37:46 -0700 (PDT)
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
X-Inumbo-ID: ce3ffac2-1bcb-11ec-b9c1-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1632332269;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=w1l0AiXwDhCyCu/u0vTki8Ygujm+OCz4LudDX2/nmkU=;
	b=O3ocui0qCFzw/Q8mEsUfC9BGpUhdsun9gDBL8u9hgwcjKNWX2tjdxEIpNbHE6gWTMaLU+I
	pwRit7KWC6mhJrQf7pl+wPde8Km5Xh3q/pnD50zq103BuMoawBM19flDfe4i7ce7weitsR
	P5J9euhmmCcBMe9fa3vxcjsNxLBuk3Y=
X-MC-Unique: s3trJ2EeMrStDEAWK4WXKQ-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=w1l0AiXwDhCyCu/u0vTki8Ygujm+OCz4LudDX2/nmkU=;
        b=5ns83/uxcmdka/TeyKaA1ck4PvwzKpxTslVnXPItLzZNKj9WZ3mSBi02VRYLW1t9wf
         w42R+BLb7eHAkmvCbVAT+zum49ICWvJe+e9UlZE7nz4EG64crSJiHp+RZnk+aGMHnxbf
         NNs9qFH4qVI0eqfPCtMNmyuRCE4LcAbtoevr/aEW5of5xa3APXh2ZoKoBsN+vXWHqAWV
         rEsdKoaklpbW5i2wZjgVH5LLfD/6exQdI7U1dh9l79ywLUeJRHcMIkP5SGbbdELRfrC4
         NTveEcTXn5+qgP0Eiq09tTwgg+cwZbbmmTl09wSd1/jZarKgmjYqJa1UzreC5dO9R6Mc
         Xcow==
X-Gm-Message-State: AOAM531zsHwb4ZHMrZTCZseyvgKh4M5Kk+8CmWQSauS5zcJZljUEHPRv
	/uWbQn6ILti9AO0ViYvLew4158DKiGaKXpao8R8M+6rw05IWPmWn1AX4pH634uA7urIND9on3QS
	MKdQ0RiW6PTVUPoVie6JqZFiYsRc=
X-Received: by 2002:a05:600c:2046:: with SMTP id p6mr12223532wmg.88.1632332266708;
        Wed, 22 Sep 2021 10:37:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyg6vmpdLqfWALQ+aYScr0ufGB6YbggOHa9PzO72FTcIBc1TC/o6Tu07FmCA0vADFzchZXYUQ==
X-Received: by 2002:a05:600c:2046:: with SMTP id p6mr12223500wmg.88.1632332266506;
        Wed, 22 Sep 2021 10:37:46 -0700 (PDT)
Message-ID: <d27c5829-e28f-4d17-966e-6cb86ebe00e6@redhat.com>
Date: Wed, 22 Sep 2021 19:37:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [RFC PATCH v2 02/16] qapi: Implement query-machine-phase QMP
 command
To: Damien Hedde <damien.hedde@greensocs.com>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, David Hildenbrand <david@redhat.com>,
 Peter Xu <peterx@redhat.com>, mirela.grujic@greensocs.com,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Eric Blake <eblake@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org, Paul Durrant <paul@xen.org>,
 Markus Armbruster <armbru@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Eric Auger <eric.auger@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-riscv@nongnu.org, =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?=
 <berrange@redhat.com>, mark.burton@greensocs.com, edgari@xilinx.com,
 Igor Mammedov <imammedo@redhat.com>
References: <20210922161405.140018-1-damien.hedde@greensocs.com>
 <20210922161405.140018-3-damien.hedde@greensocs.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20210922161405.140018-3-damien.hedde@greensocs.com>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 9/22/21 18:13, Damien Hedde wrote:
> From: Mirela Grujic <mirela.grujic@greensocs.com>
> 
> The command returns current machine initialization phase.
>  From now on, the MachineInitPhase enum is generated from the
> QAPI schema.
> 
> Signed-off-by: Mirela Grujic <mirela.grujic@greensocs.com>

Missing your S-o-b, otherwise:
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

> ---
>   qapi/machine.json          | 56 ++++++++++++++++++++++++++++++++++++++
>   include/hw/qdev-core.h     | 30 ++------------------
>   hw/core/machine-qmp-cmds.c |  9 ++++++
>   hw/core/qdev.c             |  5 ++++
>   4 files changed, 72 insertions(+), 28 deletions(-)


