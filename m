Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 41F846AE6AD
	for <lists+xen-devel@lfdr.de>; Tue,  7 Mar 2023 17:34:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.507611.781352 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZaG6-00006Q-Rm; Tue, 07 Mar 2023 16:33:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 507611.781352; Tue, 07 Mar 2023 16:33:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZaG6-0008Vr-Ol; Tue, 07 Mar 2023 16:33:50 +0000
Received: by outflank-mailman (input) for mailman id 507611;
 Tue, 07 Mar 2023 16:33:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bVoF=67=gmail.com=xadimgnik@srs-se1.protection.inumbo.net>)
 id 1pZaG5-0008Vj-Dz
 for xen-devel@lists.xenproject.org; Tue, 07 Mar 2023 16:33:49 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d6397d76-bd05-11ed-96b5-2f268f93b82a;
 Tue, 07 Mar 2023 17:33:48 +0100 (CET)
Received: by mail-wm1-x336.google.com with SMTP id
 l7-20020a05600c1d0700b003eb5e6d906bso7571036wms.5
 for <xen-devel@lists.xenproject.org>; Tue, 07 Mar 2023 08:33:48 -0800 (PST)
Received: from [192.168.25.218] (54-240-197-230.amazon.com. [54.240.197.230])
 by smtp.gmail.com with ESMTPSA id
 l38-20020a05600c1d2600b003dc434b39c7sm3421568wms.0.2023.03.07.08.33.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Mar 2023 08:33:47 -0800 (PST)
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
X-Inumbo-ID: d6397d76-bd05-11ed-96b5-2f268f93b82a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678206828;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ODFEs4lutUTOCTS0JRQfAjh1n5tVkNHNlTQgykdjlWU=;
        b=euFBFA8ao983NrMKIHWhxAbynR1JGS3jYgumyhV2/wexzrjon0cPEgodhRoTsOo0++
         uEsyiBumQRrttc4yK0Qk/9FBnwlH7oHywmHABJ3QkLWjnRFq52NRQoGoF+fyfYXPumL2
         lW7FFl2aVS+JymtkTW1Ifd3+I3ZE6rnOaT4bEl1ti5d0ublxOzzBpdke4qyCMQZRTpjr
         NC9pfR57CVLdiHfGPNVcB0KhicmBfrQsn2LRWLjC3IBhnGM7UH4aaVmSdxqcNcuD+tu9
         ZgMtMiy0cz4brWk55qszXn5Q/QdkRUnyl2wAcJctr04RofF4+GnRyzAk0/ENkiX7/NfE
         QlIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678206828;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ODFEs4lutUTOCTS0JRQfAjh1n5tVkNHNlTQgykdjlWU=;
        b=ue+qQYcFKCyYUUK9aHKFzCXPphdOe5QyPLgk2GGImCT5sDItmFPsIRW0wkX/Gli8dX
         CD+24UJwriEpamh/2k9FVqI3mRyqf+aZcy/NVlgGuE0JnBvzsMZdFCrpUHVQeuKymeVJ
         PVVLUXm/gh09h1fzlrL3si/TV2L6hbfzBPw5yWMDstCq+FhJ7AVr06OdVv0V3+AbVeQs
         9ykQGQAasYoG2SLEv4ddSdKnuI4t9zQxmp5eRnzkHZFYGNzmSyMv/LaOgAtJygJzSllW
         ArI3AS4sgFd7bQ4ia/pY6ji4blj2EpnDy8YKdlFdDSVQJaGReQFaLF6PvPYtD/Z8QD08
         KEHw==
X-Gm-Message-State: AO0yUKWHIbTF5BiXTScnO1RGQG6+DW79xDJCEK6vXDSonr9U7ymad4yY
	C3XHTrFebwUpXsc5KdunHKQ=
X-Google-Smtp-Source: AK7set9Shid+xe129rlKccGUCdhMNEfOKP/gPOmnbV6whCjg2xYZnzh5gGuDGn58tYqNC8a5Gw9Wxw==
X-Received: by 2002:a05:600c:1906:b0:3eb:3c76:c23c with SMTP id j6-20020a05600c190600b003eb3c76c23cmr13341051wmq.3.1678206828227;
        Tue, 07 Mar 2023 08:33:48 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <9e660371-c77d-1db0-56f0-26c5acfaae9d@xen.org>
Date: Tue, 7 Mar 2023 16:33:46 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Reply-To: paul@xen.org
Subject: Re: [RFC PATCH v1 27/25] docs: Update Xen-on-KVM documentation for PV
 disk support
Content-Language: en-US
To: David Woodhouse <dwmw2@infradead.org>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Joao Martins <joao.m.martins@oracle.com>,
 Ankur Arora <ankur.a.arora@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>, vikram.garhwal@amd.com,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
References: <20230302153435.1170111-1-dwmw2@infradead.org>
 <1de346bcc550da15f43c9efe05cb98ea57260df2.camel@infradead.org>
Organization: Xen Project
In-Reply-To: <1de346bcc550da15f43c9efe05cb98ea57260df2.camel@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 07/03/2023 16:22, David Woodhouse wrote:
> From: David Woodhouse <dwmw@amazon.co.uk>
> 
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> ---
>   docs/system/i386/xen.rst | 30 +++++++++++++++++++++++-------
>   1 file changed, 23 insertions(+), 7 deletions(-)
> 

Reviewed-by: Paul Durrant <paul@xen.org>


