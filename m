Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 882A18CCE74
	for <lists+xen-devel@lfdr.de>; Thu, 23 May 2024 10:45:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.728249.1133117 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sA43t-0000vK-PQ; Thu, 23 May 2024 08:44:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 728249.1133117; Thu, 23 May 2024 08:44:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sA43t-0000sc-MF; Thu, 23 May 2024 08:44:33 +0000
Received: by outflank-mailman (input) for mailman id 728249;
 Thu, 23 May 2024 08:44:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=cGfz=M2=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1sA43s-0000sW-Hi
 for xen-devel@lists.xenproject.org; Thu, 23 May 2024 08:44:32 +0000
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [2a00:1450:4864:20::52b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ab948f5b-18e0-11ef-b4bb-af5377834399;
 Thu, 23 May 2024 10:44:30 +0200 (CEST)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-57822392a0dso3832284a12.0
 for <xen-devel@lists.xenproject.org>; Thu, 23 May 2024 01:44:30 -0700 (PDT)
Received: from ?IPV6:2003:e5:8729:4000:29eb:6d9d:3214:39d2?
 (p200300e58729400029eb6d9d321439d2.dip0.t-ipconnect.de.
 [2003:e5:8729:4000:29eb:6d9d:3214:39d2])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5733becfcc1sm19031506a12.45.2024.05.23.01.44.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 May 2024 01:44:29 -0700 (PDT)
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
X-Inumbo-ID: ab948f5b-18e0-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1716453870; x=1717058670; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DKuv3MYckGRWLgNn8D6Uv/o4O6IE46yX2fIp5S7vyAg=;
        b=ZhFm1s9J72KcjBCnPM3iQLHbm7GP8YLKHH51rtsI3WHO11Ecj/y4lK/+nAe9tm0cbs
         MUR6ce1y1gKjw0f3ZxX8+NzPxJEeDVXm84hrjwAw1Fl/uxZxfhAAznTrAHSSg5FktGPc
         3IDKAlTtETzv2UXnOTo/2/wxS8D2P8HlEwKP8YtR/cLVIVaIwuROO4xyhAr93R5sKyyO
         3E2wIOz/FReMHXM5lMvWPA6GMZT6KEkOXJRSw2lalvfgUOuvOok5qSt9YBQwSCF8Ji7G
         liKJ96gmX67KswcOcnYIlrMM+RhmX4W+OJJyNy26mhpaZBOIcW8bvLMBnYTrUjXwQp+M
         X+8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716453870; x=1717058670;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DKuv3MYckGRWLgNn8D6Uv/o4O6IE46yX2fIp5S7vyAg=;
        b=KBuyCHJfsR6fSzY4/dAoM+BgZhJ8qjB9NG6SpP+Ycne1e5H//SrY2AKVaeG6zMDQeH
         Iw/p87pxpIIcr6BvS3WJT2Rx8kMyFbpb23/1mM31GOE3KaI+/UbTF/nwgKtTm0HHUeAO
         S6QV/OItnzyR7HwciWm4b4+8RyXznixtCZ5mOImuXFfHFhpKEJVP8WTWFIXOOLgMqcgB
         48QljOyphSfugx2AS6fIvxxxCYp5mzP87McuBlJ3PaaRPDYRcKsd/cs1/UlyBoXdxL3d
         M5+2jfMxHadMCQ/26UYg3wef8XcmxWe19Qo+JZuchXZ1G7dvHQzI8EWdOh6xGyGG3gjx
         yAWA==
X-Forwarded-Encrypted: i=1; AJvYcCX9qScqErmhiH/WvTMQfoqJUioNyoG3ftIzXb0x15q6FJt/GpQfehfXkHAzkwEGNzKcSnKF/CYOhY8YMMG0l0GrsjMtNPk3dUIJQZwDDlE=
X-Gm-Message-State: AOJu0YyCadXopwtNtniGIocxMVu+jb5ryIsc6ZB6QenDFc7Mrtj4tvkT
	n1+g3zFsLDAGIVrLRoKCZMgvn3SPROYDYGK5QzYO+HawE0ja2uGxzJ251zNBN5U=
X-Google-Smtp-Source: AGHT+IGgkhcVIznYB8BZOUkgANZXwhHcDuhG4Uaff+ftDVniaQQSakKYWn76aH5g6iDM/QMd5HQQ3g==
X-Received: by 2002:a50:c2d2:0:b0:572:a123:5ed0 with SMTP id 4fb4d7f45d1cf-57832a8913emr3160490a12.21.1716453869778;
        Thu, 23 May 2024 01:44:29 -0700 (PDT)
Message-ID: <0dabccae-6570-4099-88a7-b599b5a7ed38@suse.com>
Date: Thu, 23 May 2024 10:44:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] tools: Drop libsystemd as a dependency
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Anthony PERARD <anthony@xenproject.org>,
 George Dunlap <George.Dunlap@citrix.com>, Jan Beulich <JBeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Christian Lindig <christian.lindig@citrix.com>,
 =?UTF-8?B?RWR3aW4gVMO2csO2aw==?= <edwin.torok@cloud.com>
References: <20240516185804.3309725-1-andrew.cooper3@citrix.com>
 <20240516185804.3309725-5-andrew.cooper3@citrix.com>
Content-Language: en-US
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
In-Reply-To: <20240516185804.3309725-5-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 16.05.24 20:58, Andrew Cooper wrote:
> There are no more users, and we want to disuade people from introducing new
> users just for sd_notify() and friends.  Drop the dependency.
> 
> We still want the overall --with{,out}-systemd to gate the generation of the
> service/unit/mount/etc files.
> 
> Rerun autogen.sh, and mark the dependency as removed in the build containers.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Juergen Gross <jgross@suse.com>


Juergen


