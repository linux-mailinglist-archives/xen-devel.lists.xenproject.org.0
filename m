Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B5CF506858
	for <lists+xen-devel@lfdr.de>; Tue, 19 Apr 2022 12:07:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.307969.523407 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ngkku-0005FD-Ry; Tue, 19 Apr 2022 10:06:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 307969.523407; Tue, 19 Apr 2022 10:06:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ngkku-0005Cp-Ov; Tue, 19 Apr 2022 10:06:44 +0000
Received: by outflank-mailman (input) for mailman id 307969;
 Tue, 19 Apr 2022 10:06:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RCdx=U5=gmail.com=xadimgnik@srs-se1.protection.inumbo.net>)
 id 1ngkks-0005Cj-Uo
 for xen-devel@lists.xenproject.org; Tue, 19 Apr 2022 10:06:43 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 68bee55c-bfc8-11ec-a405-831a346695d4;
 Tue, 19 Apr 2022 12:06:41 +0200 (CEST)
Received: by mail-wm1-x32c.google.com with SMTP id
 o20-20020a05600c511400b0038ebbbb2ad8so1154572wms.0
 for <xen-devel@lists.xenproject.org>; Tue, 19 Apr 2022 03:06:41 -0700 (PDT)
Received: from [10.7.237.14] (54-240-197-231.amazon.com. [54.240.197.231])
 by smtp.gmail.com with ESMTPSA id
 i7-20020a5d5587000000b00207a8cde900sm12105557wrv.19.2022.04.19.03.06.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Apr 2022 03:06:39 -0700 (PDT)
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
X-Inumbo-ID: 68bee55c-bfc8-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:reply-to:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=3mt7mOFZJb2BomB+X9UDKgv1Z1dwvs1e1sh0ADJD7TE=;
        b=mIjPoARufNtPdPLvLJT4F7c6A68GsVVgOruZfbtD4sLmZBmRt9yoIPCstihc91juUv
         c7vNRnHUJB3+qoVFM2SEceNgTZAQ3eu8+ZqwEhj7/LBbGdbqgaxDsNc2mjKYNnBDY8DK
         hmANgfuUBz5xpW1IWO6I9x/nkuSSY1QynNiXY+kIMEH0k8P0X+857YbJKEqiFg6LjOvP
         8APTRLtaWT7T9fMvUw6p4Toeu0gy4Ui3TGcAbrda2fWENSfO5ok9rXAKkaUb+UlmLZuT
         JOTcpCgzzgILqblHcqeBCTxH/u3UbfsbWKuFniIFHNObP9JXxuFgwU9lVFPYkXxv7tYP
         UVWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:reply-to
         :subject:content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=3mt7mOFZJb2BomB+X9UDKgv1Z1dwvs1e1sh0ADJD7TE=;
        b=5CPz+f6sW8+7JRJcFQXZ8vl7671X3U+rH9i/3fUuuQAaX7ZwFsc1oYV8U3Sc6r1GBJ
         7YbyKcqghvdU2rHZ01iSqt9+pYB+b4RmMWkEXxIf9slBgWkHW755g7Ze85CH7YPr6OBk
         r5Mjb6zqkbjHFvj8gjHLdY09G3KEGrmJuO3G/YR9eKq4ioBkJSeBXkFOBuh5qGxjkdV1
         66sWts2i5c1cnEknqemkxKazkA77zivJqMElxOLLHnJd22bXudyjMoh++wowl4sqNIOF
         VeyOR6XE5RApR+FFfHGZm2zT1FtN79BYCe/ZV1VpExpIMrXiFGIL5A+XBZUCUSC5JFOv
         naSA==
X-Gm-Message-State: AOAM532zuE1a31nOB1VWwxLv8mQtzPa7MfxYaSrlAezgkXKOhgra+mVl
	KhOBVGoGmyBwg4oNYpTTzdM=
X-Google-Smtp-Source: ABdhPJxXEXNVcE0YvhDx0cTraXOy56bdxwUACJi/7OtqmN+4UWPij4JIgJKdEiqNZbvotUJpbF8UZg==
X-Received: by 2002:a1c:7408:0:b0:38e:b7af:c503 with SMTP id p8-20020a1c7408000000b0038eb7afc503mr19301922wmc.58.1650362800997;
        Tue, 19 Apr 2022 03:06:40 -0700 (PDT)
Message-ID: <c97c6909-83f9-fbde-21aa-ce027c4a653e@gmail.com>
Date: Tue, 19 Apr 2022 11:06:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Reply-To: paul@xen.org
Subject: Re: [PATCH] IOMMU: make domctl handler tolerate NULL domain
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Paul Durrant <paul@xen.org>
References: <bc61d9cd-5da4-e35c-fb21-eeba5ab6e529@suse.com>
From: "Durrant, Paul" <xadimgnik@gmail.com>
In-Reply-To: <bc61d9cd-5da4-e35c-fb21-eeba5ab6e529@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 19/04/2022 10:39, Jan Beulich wrote:
> Besides the reporter's issue of hitting a NULL deref when !CONFIG_GDBSX,
> XEN_DOMCTL_test_assign_device can legitimately end up having NULL passed
> here, when the domctl was passed DOMID_INVALID.
> 
> Fixes: 71e617a6b8f6 ("use is_iommu_enabled() where appropriate...")
> Reported-by: Cheyenne Wills <cheyenne.wills@gmail.com>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Paul Durrant <paul@xen.org>

