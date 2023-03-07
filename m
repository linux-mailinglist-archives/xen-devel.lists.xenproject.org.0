Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AC2B46AE161
	for <lists+xen-devel@lfdr.de>; Tue,  7 Mar 2023 14:52:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.507415.780873 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZXk8-0005nY-EX; Tue, 07 Mar 2023 13:52:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 507415.780873; Tue, 07 Mar 2023 13:52:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZXk8-0005kF-AS; Tue, 07 Mar 2023 13:52:40 +0000
Received: by outflank-mailman (input) for mailman id 507415;
 Tue, 07 Mar 2023 13:52:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bVoF=67=gmail.com=xadimgnik@srs-se1.protection.inumbo.net>)
 id 1pZXk7-0004fq-7s
 for xen-devel@lists.xenproject.org; Tue, 07 Mar 2023 13:52:39 +0000
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [2a00:1450:4864:20::42a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 51e6c609-bcef-11ed-a550-8520e6686977;
 Tue, 07 Mar 2023 14:52:37 +0100 (CET)
Received: by mail-wr1-x42a.google.com with SMTP id bx12so12165982wrb.11
 for <xen-devel@lists.xenproject.org>; Tue, 07 Mar 2023 05:52:37 -0800 (PST)
Received: from [192.168.25.218] (54-240-197-238.amazon.com. [54.240.197.238])
 by smtp.gmail.com with ESMTPSA id
 z11-20020a5d654b000000b002c70f5627d5sm12559129wrv.63.2023.03.07.05.52.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Mar 2023 05:52:36 -0800 (PST)
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
X-Inumbo-ID: 51e6c609-bcef-11ed-a550-8520e6686977
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678197157;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IxFlqZr0mGRhmULnOKeJqsxe48v70ZBxJnmwKGFTiO0=;
        b=VBreMLSBQBTjpHLmYWqbVCZ6vDGTcBjMf8fz7qnwbbAc+FcP7g2m2aPAGuB6WWygHa
         IPM+YL7p5fjWDzGkwbdqDwb5UzO0mOhcZKK0e1gW6CDlaqdMbJDnKSz2yi8nQt0GUNvr
         MBHmtWXum96/Gb6aBkLO08EYK/hoQsHHvt94Pq7Oj56MQW0oA22VKmbgBHQc/U66gBfr
         p1Rk9+qeXSzLmmJ0/F3iAOd30WvBiEMYBq+0fiee22jNeCZeSYqEGCVh9ZmZMJQ3qRQR
         eMBY6K2G8+h//Gf22KXyG06Z3awpR2GhcYnnr3QhkLNOt2pg5d0up/8VDUU2u7ClGFoc
         Tyeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678197157;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IxFlqZr0mGRhmULnOKeJqsxe48v70ZBxJnmwKGFTiO0=;
        b=72bX49/PJuRfWVuanqWpEqOkDwrNR2fRJU3+Kf22RT/DcqeLhwJnVtDnXTP1JUaSU+
         EJ4BxXDJpm5um4RiV7gXaLjgSNUphkRU5X7tNgLxSAjMBlbn5br/GsVuw0I6LgJ5gjBQ
         8BSPQP/IuHKqpqphOiuNmIAkUEvP3jReavKKi2E8bMwLZPD5JD6ZkvDKjuuIRrC23FFg
         wkJCQTNn86GgPtMQIcF+ykJtgbN5s2I6hEFr0dskfZGeOj/+fjIY910ypB5VNV5MDqWs
         y6exSMOmelBjPKGnuGQwPLwAAVmzioQ0MMfGo0grwVyYWu0DPfkwabzUh1mVoKOkm9Ds
         McFQ==
X-Gm-Message-State: AO0yUKXGH40z00s7N7OBHGyF+bJsE53Wv+8Q8c8IIdQUAM+m2NKg/q8v
	qW0G7aTIvQFOufwQfLKaptU=
X-Google-Smtp-Source: AK7set+P/VN1nCeaWEXutY2mF6tnycVncnjJOoM/2Q3o42A0amwIajwY37PDToy2KIlE9qMpN1Hwqg==
X-Received: by 2002:adf:f68a:0:b0:2ca:175b:d850 with SMTP id v10-20020adff68a000000b002ca175bd850mr9346152wrp.11.1678197157288;
        Tue, 07 Mar 2023 05:52:37 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <b5d3d99a-6d33-1336-7f21-6b7277827d54@xen.org>
Date: Tue, 7 Mar 2023 13:52:35 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Reply-To: paul@xen.org
Subject: Re: [RFC PATCH v1 08/25] hw/xen: Create initial XenStore nodes
Content-Language: en-US
To: David Woodhouse <dwmw2@infradead.org>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Joao Martins <joao.m.martins@oracle.com>,
 Ankur Arora <ankur.a.arora@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>, vikram.garhwal@amd.com,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
References: <20230302153435.1170111-1-dwmw2@infradead.org>
 <20230302153435.1170111-9-dwmw2@infradead.org>
Organization: Xen Project
In-Reply-To: <20230302153435.1170111-9-dwmw2@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 02/03/2023 15:34, David Woodhouse wrote:
> From: Paul Durrant <pdurrant@amazon.com>
> 
> Signed-off-by: Paul Durrant <pdurrant@amazon.com>
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> ---
>   hw/i386/kvm/xen_xenstore.c | 70 ++++++++++++++++++++++++++++++++++++++
>   1 file changed, 70 insertions(+)
> 

Reviewed-by: Paul Durrant <paul@xen.org>


