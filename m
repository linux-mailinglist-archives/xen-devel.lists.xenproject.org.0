Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FC0A57E519
	for <lists+xen-devel@lfdr.de>; Fri, 22 Jul 2022 19:10:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.373417.605628 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oEwA0-0005mm-PY; Fri, 22 Jul 2022 17:09:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 373417.605628; Fri, 22 Jul 2022 17:09:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oEwA0-0005jx-Lt; Fri, 22 Jul 2022 17:09:56 +0000
Received: by outflank-mailman (input) for mailman id 373417;
 Fri, 22 Jul 2022 17:09:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/THL=X3=gmail.com=xadimgnik@srs-se1.protection.inumbo.net>)
 id 1oEw9z-0005gM-Sc
 for xen-devel@lists.xenproject.org; Fri, 22 Jul 2022 17:09:55 +0000
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [2a00:1450:4864:20::434])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1b6cb211-09e1-11ed-924f-1f966e50362f;
 Fri, 22 Jul 2022 19:09:55 +0200 (CEST)
Received: by mail-wr1-x434.google.com with SMTP id u5so7368258wrm.4
 for <xen-devel@lists.xenproject.org>; Fri, 22 Jul 2022 10:09:55 -0700 (PDT)
Received: from ?IPV6:2a00:23c5:5785:9a01:c8eb:68b3:50cf:a1a9?
 ([2a00:23c5:5785:9a01:c8eb:68b3:50cf:a1a9])
 by smtp.gmail.com with ESMTPSA id
 h17-20020adfe991000000b0021dd3e2fb60sm6220440wrm.0.2022.07.22.10.09.54
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 Jul 2022 10:09:54 -0700 (PDT)
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
X-Inumbo-ID: 1b6cb211-09e1-11ed-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:reply-to:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=9455aJTLpHUAD4z+LwIX3srv5fwyHOkSK65qhSwRZaw=;
        b=E2iRV1OQDgi7+AfSPCYhsBnBmXTMcHGNnJ/7LEUWU2AL8xlpws1DJSjTsXRkLsoVaP
         K1dwNO+9Wp/eNhprT+g5mDSkEIr1koFNKo4KVsJFRh87la3/opY8aRqofy/H2aM/qg+i
         3i7ItxrA5ypD/nALxQfSXD74hYy9xUY/qOBlTML9UPKfYLpRK29A58mN2P8CNvZDh8iR
         HTZfvUoltZ7fQf9hGeRzox/JMbXGOp84me0W6ITV9c1GZA1pD0xqbR7vmx0qV6NUhfEk
         3FnrmeEgMo7XzQlcZCEIuMOwXGayyKaa6eiRsWoLsLroPfCxrMM6IZwp4ZG07oKGEtKR
         G8kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:reply-to
         :subject:content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=9455aJTLpHUAD4z+LwIX3srv5fwyHOkSK65qhSwRZaw=;
        b=JoPkYKAVGgaDX05tJz26mkOlLWFo7APUn0MOH+OnUhMVs+mluKlGSavBb2bGu8X2mY
         lFKD2+aYj3tKNSMaWs6KTQyMwcFIIyB8eVH/9l3czXMLtUs0RKB9B8d5QZj0JT6NDK+f
         pASlIrjBShn0CMmaYfOBol+8CMDAFhhO+M3sj/4JItCHS6q1GgMMNEJJwcsN701tVVrl
         f4BV9svO4zn9NqRn5rIedAqqHWr/Wlhmf/J6QKFdr1CVA2VbzOdKO1SaGiBtV9mUFtlJ
         qvD5O4n164cHYUzIHS+GX0c7X8Mvgz/b7Ca6E/cEEmEBIUCx0vnpru5q1ZuKfcxLQ9mU
         lR0w==
X-Gm-Message-State: AJIora8dxoaW/cl/UWCm1zSUGdFWuaZniF4+2NiLtruOV8xFueUebNft
	cVqCgsMp6++yk6PT29etp3hXHDSoPOy/Sg==
X-Google-Smtp-Source: AGRyM1ufHlbFIAUZzARe47CG4qulQ8NjSPoe+GhPy5AWVpQ/Qx4kdg2wEcT0WwGYkx5AJg+K309hhA==
X-Received: by 2002:a05:6000:1f08:b0:21e:54e1:6f21 with SMTP id bv8-20020a0560001f0800b0021e54e16f21mr584736wrb.255.1658509794778;
        Fri, 22 Jul 2022 10:09:54 -0700 (PDT)
Message-ID: <fa8ed6e5-9720-8e3c-552b-9c98bf21fd08@gmail.com>
Date: Fri, 22 Jul 2022 18:09:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Reply-To: paul@xen.org
Subject: Re: [PATCH v7 13/14] IOMMU/x86: add perf counters for page table
 splitting / coalescing
Content-Language: en-US
To: xen-devel@lists.xenproject.org
References: <4c9d4b32-d4db-3a4f-fe92-6022e63c3f82@suse.com>
 <1dab40d4-75f1-566c-f982-610013db72f5@suse.com>
From: "Durrant, Paul" <xadimgnik@gmail.com>
In-Reply-To: <1dab40d4-75f1-566c-f982-610013db72f5@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 05/07/2022 13:49, Jan Beulich wrote:
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> Reviewed-by: Kevin tian <kevin.tian@intel.com>
> Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Reviewed-by: Paul Durrant <paul@xen.org>

