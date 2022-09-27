Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 087A05EC4EF
	for <lists+xen-devel@lfdr.de>; Tue, 27 Sep 2022 15:50:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.412618.655982 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1odAyO-00059N-Vm; Tue, 27 Sep 2022 13:50:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 412618.655982; Tue, 27 Sep 2022 13:50:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1odAyO-000567-St; Tue, 27 Sep 2022 13:50:08 +0000
Received: by outflank-mailman (input) for mailman id 412618;
 Tue, 27 Sep 2022 13:50:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Qlh4=Z6=redhat.com=pabeni@srs-se1.protection.inumbo.net>)
 id 1odAyM-00051Z-QQ
 for xen-devel@lists.xenproject.org; Tue, 27 Sep 2022 13:50:07 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4a3d4018-3e6b-11ed-9374-c1cf23e5d27e;
 Tue, 27 Sep 2022 15:50:05 +0200 (CEST)
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-397-JoYQex5rOxO2psl2rxXfSg-1; Tue, 27 Sep 2022 09:50:01 -0400
Received: by mail-qk1-f197.google.com with SMTP id
 u20-20020a05620a455400b006ce5151968dso7295195qkp.11
 for <xen-devel@lists.xenproject.org>; Tue, 27 Sep 2022 06:50:00 -0700 (PDT)
Received: from gerbillo.redhat.com (146-241-104-40.dyn.eolo.it.
 [146.241.104.40]) by smtp.gmail.com with ESMTPSA id
 s16-20020a05620a255000b006b98315c6fbsm1038185qko.1.2022.09.27.06.49.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Sep 2022 06:49:59 -0700 (PDT)
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
X-Inumbo-ID: 4a3d4018-3e6b-11ed-9374-c1cf23e5d27e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1664286604;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ofqCX7PnDwCH2641aVSgoebhxmiEcI1UVFpct2yGqJc=;
	b=UmquJ5A2/35hG57PVNEdyls9H6Cg96CW65GmkeOHRHckPOpsZRMbku4mntOie7WMxPBz3u
	dL/TTTuWNy3HJCV5FaOG6wYZgXAwDjFW8bf9jB37bzn1qTzx9ub5EEHHCbOL/zd27ZsBtU
	F8otFkZ5ZwklCD/oSU+NlUfvQvBpDeU=
X-MC-Unique: JoYQex5rOxO2psl2rxXfSg-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:user-agent:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date;
        bh=ofqCX7PnDwCH2641aVSgoebhxmiEcI1UVFpct2yGqJc=;
        b=yNc6P2wIB3ytKQqQWrmCEibKOw1hKY4T/V+YkaAf8u9TXEVd9N3ul2Znjl6LKZgy/g
         CSCxmNu+RV9U1JTtw45IXBGwbqLGm5Tkm7ph/Y/kRhGY8luT62E7I7j9kRbi5cPKbnDE
         FX1Na5Kcy9wwmYW7U21cByKkWhXNao8qqje+B6nVln2CfJ0uAtSL+OtlviCiXPbLITPb
         abpNt5K1/ttlgVbe+fTJjMgO2sZmdbqHFd+UHV0ofwQd4xdx/XCyECjqE4Q0ifTAObtQ
         4JKpN52fDUYcCVk0jd+nO+cdWE5v7lWDDhQVNsPipETq9quihSiBJteai0eJP9PEm89c
         uPDQ==
X-Gm-Message-State: ACrzQf1Fv3itandykI4Srd1rD6q0vEThdTnFUXa0u62t5HvRWdq1YatW
	uzYFcN2ZO4o3gL3TDxHSkl8nuCn9o2k1m7g8bgOGi+cwaQMej2dr7SmcsVVWMYYtb8TsGz7Yb5h
	mBl/5lRuRzfBGK41l+N7vCGUcam8=
X-Received: by 2002:ac8:7dc7:0:b0:35c:c050:16aa with SMTP id c7-20020ac87dc7000000b0035cc05016aamr22041922qte.455.1664286600563;
        Tue, 27 Sep 2022 06:50:00 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7c0Ohy85DoU6iQp5X+btljELCKn/uXSAjNiHTKbhnRxjc5Y3nT0n3WTDb8R9S/7JggYSEMwg==
X-Received: by 2002:ac8:7dc7:0:b0:35c:c050:16aa with SMTP id c7-20020ac87dc7000000b0035cc05016aamr22041898qte.455.1664286600331;
        Tue, 27 Sep 2022 06:50:00 -0700 (PDT)
Message-ID: <7fef56880d40b9d83cc99317df9060c4e7cdf919.camel@redhat.com>
Subject: Re: [PATCH net-next 0/4] shrink struct ubuf_info
From: Paolo Abeni <pabeni@redhat.com>
To: Pavel Begunkov <asml.silence@gmail.com>, netdev@vger.kernel.org
Cc: "David S . Miller" <davem@davemloft.net>, Jakub Kicinski
 <kuba@kernel.org>,  linux-kernel@vger.kernel.org,
 xen-devel@lists.xenproject.org, Wei Liu <wei.liu@kernel.org>, Paul Durrant
 <paul@xen.org>, kvm@vger.kernel.org, 
 virtualization@lists.linux-foundation.org, "Michael S . Tsirkin"
 <mst@redhat.com>,  Jason Wang <jasowang@redhat.com>
Date: Tue, 27 Sep 2022 15:49:55 +0200
In-Reply-To: <cover.1663892211.git.asml.silence@gmail.com>
References: <cover.1663892211.git.asml.silence@gmail.com>
User-Agent: Evolution 3.42.4 (3.42.4-2.fc35)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Hello,

On Fri, 2022-09-23 at 17:39 +0100, Pavel Begunkov wrote:
> struct ubuf_info is large but not all fields are needed for all
> cases. We have limited space in io_uring for it and large ubuf_info
> prevents some struct embedding, even though we use only a subset
> of the fields. It's also not very clean trying to use this typeless
> extra space.
> 
> Shrink struct ubuf_info to only necessary fields used in generic paths,
> namely ->callback, ->refcnt and ->flags, which take only 16 bytes. And
> make MSG_ZEROCOPY and some other users to embed it into a larger struct
> ubuf_info_msgzc mimicking the former ubuf_info.
> 
> Note, xen/vhost may also have some cleaning on top by creating
> new structs containing ubuf_info but with proper types.

That sounds a bit scaring to me. If I read correctly, every uarg user
should check 'uarg->callback == msg_zerocopy_callback' before accessing
any 'extend' fields. AFAICS the current code sometimes don't do the
explicit test because the condition is somewhat implied, which in turn
is quite hard to track. 

clearing uarg->zerocopy for the 'wrong' uarg was armless and undetected
before this series, and after will trigger an oops..

There is some noise due to uarg -> uarg_zc renaming which make the
series harder to review. Have you considered instead keeping the old
name and introducing a smaller 'struct ubuf_info_common'? the overall
code should be mostly the same, but it will avoid the above mentioned
noise.

Thanks!

Paolo


