Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DB2D939DBE
	for <lists+xen-devel@lfdr.de>; Tue, 23 Jul 2024 11:29:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.762887.1173114 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWBpv-0004a4-Sg; Tue, 23 Jul 2024 09:29:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 762887.1173114; Tue, 23 Jul 2024 09:29:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWBpv-0004XF-PN; Tue, 23 Jul 2024 09:29:35 +0000
Received: by outflank-mailman (input) for mailman id 762887;
 Tue, 23 Jul 2024 09:29:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=BZ+O=OX=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1sWBpu-0004X9-RB
 for xen-devel@lists.xenproject.org; Tue, 23 Jul 2024 09:29:34 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 11a57a02-48d6-11ef-8776-851b0ebba9a2;
 Tue, 23 Jul 2024 11:29:32 +0200 (CEST)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-a79f9a72a99so91250466b.0
 for <xen-devel@lists.xenproject.org>; Tue, 23 Jul 2024 02:29:32 -0700 (PDT)
Received: from ?IPV6:2003:e5:8729:4000:29eb:6d9d:3214:39d2?
 (p200300e58729400029eb6d9d321439d2.dip0.t-ipconnect.de.
 [2003:e5:8729:4000:29eb:6d9d:3214:39d2])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7a97684349sm52247866b.163.2024.07.23.02.29.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Jul 2024 02:29:32 -0700 (PDT)
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
X-Inumbo-ID: 11a57a02-48d6-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1721726972; x=1722331772; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BzY9nlCaBT/4mCOvCOKVBNvXiwyyb2HyvTMBaPfKsFM=;
        b=FmvmBH2jYBEih/zu50brnc6bulbnVe4pOeDlxLiix1kd9paLSCxdhHC+yGNSUzDiWR
         VMHF+yyvrnlla+Ge+PkD/8x6VTeCqrDc0E98oT5s4EHYr/4dh0up6HZw4j4FM1hzWxaY
         HS54YKEetLp5nlrHJUuMSVPqdJ41L2nmI7rjGIVXAnSdop2Rrg5BhFkvNm3boLBBOQWu
         S9Kt/j56Ig6yFt5gdbjYsTXFqE05v76PD5rC4bLebLob/M0UKOpAExydp9j7IWSgAfLT
         HzSf4PVvKx6bSd6isZUKZV/R1/vImR1m8lgYIzyT6ndHS3/u5TVrQge5aKdEW9h+4qhx
         JtDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721726972; x=1722331772;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BzY9nlCaBT/4mCOvCOKVBNvXiwyyb2HyvTMBaPfKsFM=;
        b=IYjVXyhBmq4EmfnKxr5r5Vf12AV1cKvBk+58K1mlcoIsIGIlanC4NRp63hOZ0bKBbx
         rXzbSb37mCSrrjNUmLsgvv0lO28htO+Qmf7jyzODo1XQIUcoox7BQh3sVQH6EtwOWBEz
         hTUZV06cEeLfqXfI/Fgx4VWINBw7vmWLHyMgwqX+nyVOosn64Z2AAb4y8J+zWWA+7ZwB
         lmG3yMG2uer99wtxBHWr06PPm9Xi3YyE0O2UNaFYWxfniK7KqWW8rcVnVcEa+YXx9otf
         0O377gbEnHASUs0ULKvlKvnjdulDOx1oRX+QbZhNNhApUQQWRjccBT3RGZ1Cdz/FeaJH
         Hofg==
X-Forwarded-Encrypted: i=1; AJvYcCV/HMTs6aEoB7iUnbjaNRhynU0/fwBSSk06V502ZAXKOCuOSqRj5GxzNptDAVZkrzN/EDlXXwMYle9kaMsAR6aQ53IwELT1ziY3KYclzGU=
X-Gm-Message-State: AOJu0YwnBtO9wMYd5UNp6vYHvQRj1z+Y5Gr7lJErtiq1GzBFzaFfR7wM
	xkS2ZyecBM+sd8LJYgmIC7YZ9Kl/9Y0at83fR0zc2O5SbPK463mO6rVP2TtOL+tG0bTB5SuYbxm
	x
X-Google-Smtp-Source: AGHT+IGM+WNd9+MYH0nkgkRXwXsvcfT5/T80qfz8k6cKVgna0TRlWcRQBpl4LA6U/jQ4+4s2IAvf2Q==
X-Received: by 2002:a17:906:c142:b0:a77:c693:9ddf with SMTP id a640c23a62f3a-a7a943c25camr149435566b.34.1721726972302;
        Tue, 23 Jul 2024 02:29:32 -0700 (PDT)
Message-ID: <0f02c5fd-4d38-4c5c-b8dc-abef52c2c492@suse.com>
Date: Tue, 23 Jul 2024 11:29:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/6] tools/libxs: Rationalise the definition of struct
 xs_handle
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Anthony PERARD <anthony.perard@vates.tech>
References: <20240718164842.3650702-1-andrew.cooper3@citrix.com>
 <20240718164842.3650702-4-andrew.cooper3@citrix.com>
Content-Language: en-US
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
In-Reply-To: <20240718164842.3650702-4-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 18.07.24 18:48, Andrew Cooper wrote:
> Right now there are two completely different struct xs_handle definitions,
> depend on #ifdef USE_PTHREAD.  One is especially well hidden, and often
> escapes updates.
> 
> Rework struct xs_handle using some interior ifdefary.  It's slightly longer,
> but much easier to follow.  Importanly, this makes it much harder to forget
> the !PTHREAD case when adding a "common" variable.
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Juergen Gross <jgross@suse.com>


Juergen


