Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E5FE19C0A7E
	for <lists+xen-devel@lfdr.de>; Thu,  7 Nov 2024 16:55:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.832063.1247454 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t94qk-0008Cz-6n; Thu, 07 Nov 2024 15:55:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 832063.1247454; Thu, 07 Nov 2024 15:55:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t94qk-0008Ax-3Y; Thu, 07 Nov 2024 15:55:10 +0000
Received: by outflank-mailman (input) for mailman id 832063;
 Thu, 07 Nov 2024 15:55:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GEtt=SC=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1t94qi-0008Ap-PJ
 for xen-devel@lists.xenproject.org; Thu, 07 Nov 2024 15:55:08 +0000
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [2a00:1450:4864:20::632])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a7c727d4-9d20-11ef-99a3-01e77a169b0f;
 Thu, 07 Nov 2024 16:55:05 +0100 (CET)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-a99f1fd20c4so157490566b.0
 for <xen-devel@lists.xenproject.org>; Thu, 07 Nov 2024 07:55:05 -0800 (PST)
Received: from localhost ([213.195.124.162]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9ee0def54asm109351366b.157.2024.11.07.07.55.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Nov 2024 07:55:04 -0800 (PST)
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
X-Inumbo-ID: a7c727d4-9d20-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo2MzIiLCJoZWxvIjoibWFpbC1lajEteDYzMi5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6ImE3YzcyN2Q0LTlkMjAtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMwOTk0OTA1LjI3NTg5OCwic2VuZGVyIjoicm9nZXIucGF1QGNsb3VkLmNvbSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1730994905; x=1731599705; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ypOxMP7nwAQjcmDUT1kYqE7fwDN1OAKh6KOlmHhvw9c=;
        b=BZxIIrgGdzfAvqa3YrcZEJi32yvKq0tGZ039Kuyqeme4aSPJLnXJmn9QSvXsjowkHF
         S82Xnxl6sssYAp7iRq9DszUYOni/EAo/EdKMrbfY3Ep43CbANknM/2ZBTGEx02ePmPqZ
         Q6B2hDPylBvnCPd+CAkRMd9l+2FlUrn1WOfgQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730994905; x=1731599705;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ypOxMP7nwAQjcmDUT1kYqE7fwDN1OAKh6KOlmHhvw9c=;
        b=ioxZcZ1XB79m1zEYcqqQxrDUd54gQHmI9gGS/s0j5RhdanlDo2ny7pKJM+FPBMYoB8
         mu/CZ4KT9t7Y1svpfmER+4GNTHBHVUWtd8RzWvnpl6nFjdqOuYe7xelHR5P52SC1q77A
         rpKRtRYKsW9rKmZ0dyT7NQeyZFAwrwLJ5pLRUoGnNXIW2qdJK2ZXSpljvqAU+S8SriIf
         hFJmPo4rjDcVwyl/wiLN+gLYTc35E0v58ZIyXds6P1wfeCf4hS+0iOl9AwxrG0f2xEXl
         Km2pg3CCqG9J7HfSbBeqEFpaQ42VQMRlYNVsy4t8AAQGBII8ysHfT2xgTH9q34A46yX7
         OWRw==
X-Forwarded-Encrypted: i=1; AJvYcCWRNHvQd34lMmW6Umxt5y2vhUfeZu8PwDdEpae7liF5WDtboRANuiOkVFHa4RKjzY5Azd4uv54dXps=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx9nm70ZNlN+uIot0y/EHkn4wk5aPDL8fAIPdnO8hvwHFxHx0lM
	LsBF5Jjcz7LQrNxJsP/Hx9WmYrpQ1pPQjTIduB9nAvVnvBN2tk53BL5Y1PH30Z4=
X-Google-Smtp-Source: AGHT+IHF64y3dvHWIsETZMU66q1LZVUSHRxfP/W72r6ptxiY3pdggVmbfrMWgwHLGi146/lgy6Tqrg==
X-Received: by 2002:a17:906:ef08:b0:a9a:80bd:2920 with SMTP id a640c23a62f3a-a9eeb00b3abmr54596966b.53.1730994904656;
        Thu, 07 Nov 2024 07:55:04 -0800 (PST)
Date: Thu, 7 Nov 2024 16:55:03 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: konrad.wilk@oracle.com, ross.lagerwall@citrix.com,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH 2/4] create-diff-object: update default alt_instr size
Message-ID: <Zyzi17UTGMRU_7Ql@macbook>
References: <20241107151509.73621-1-roger.pau@citrix.com>
 <20241107151509.73621-3-roger.pau@citrix.com>
 <28f3bcb5-ce01-48f6-b0a9-0ffa96998315@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <28f3bcb5-ce01-48f6-b0a9-0ffa96998315@suse.com>

On Thu, Nov 07, 2024 at 04:20:35PM +0100, Jan Beulich wrote:
> On 07.11.2024 16:15, Roger Pau Monne wrote:
> > The size of the alt_instr structure in Xen is 14 instead of 12 bytes, adjust
> > it.
> 
> Nowadays yes. Isn't the tool supposed to be usable with all livepatch-capable
> Xen versions, though? As a random data point, 4.7 still had the size at 12.

Yes, livepatch-build-tools will fetch the alt_intsrt size from the
DWARF info.

However when using create-diff-object without the env variable being
set a default value is used, and that's currently 12.  I think it
would be best to update that default to the value used by the current
Xen version.

Thanks, Roger.

