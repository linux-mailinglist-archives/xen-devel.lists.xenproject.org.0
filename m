Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AF93939DB3
	for <lists+xen-devel@lfdr.de>; Tue, 23 Jul 2024 11:28:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.762881.1173102 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWBnW-00040U-F6; Tue, 23 Jul 2024 09:27:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 762881.1173102; Tue, 23 Jul 2024 09:27:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWBnW-0003ym-Cd; Tue, 23 Jul 2024 09:27:06 +0000
Received: by outflank-mailman (input) for mailman id 762881;
 Tue, 23 Jul 2024 09:27:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=BZ+O=OX=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1sWBnU-0003yg-RM
 for xen-devel@lists.xenproject.org; Tue, 23 Jul 2024 09:27:04 +0000
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [2a00:1450:4864:20::42f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b8bab586-48d5-11ef-bbfe-fd08da9f4363;
 Tue, 23 Jul 2024 11:27:03 +0200 (CEST)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-3687fd09251so2277479f8f.0
 for <xen-devel@lists.xenproject.org>; Tue, 23 Jul 2024 02:27:03 -0700 (PDT)
Received: from ?IPV6:2003:e5:8729:4000:29eb:6d9d:3214:39d2?
 (p200300e58729400029eb6d9d321439d2.dip0.t-ipconnect.de.
 [2003:e5:8729:4000:29eb:6d9d:3214:39d2])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-368787ebd50sm10860153f8f.93.2024.07.23.02.27.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Jul 2024 02:27:02 -0700 (PDT)
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
X-Inumbo-ID: b8bab586-48d5-11ef-bbfe-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1721726823; x=1722331623; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZUJXxiHx3ch4xF9jcjJSjJMIWkQGZZEcgDv7d4gcZVc=;
        b=QH/bmc16SwgExPPRW3//cwjfvB7jNw6hnGpT9tBvo3no/FeSGCQAT4PA0FiMuhzzAH
         oNBi98227X0TMyUj13zQHjuMrT2km3TOFyzmOm9rmxgAfmZtRRjVKPcmXlFFWWDHesOS
         rgRJCuqakds/eMBejOidwytpB8ebxwmpnhXxo/pbVvaIR4hKsSxxIenO9Rq67Kocf0lS
         V4AseMtKmWEq5OaQyTVOv6SIaOD0sC7my7dxbo2mpYMfc4Xqw0sWjDgyQWjXklpIGquH
         rfejbQyrrfW0NdcRjNuWk2cNpEtnqT1pBS7HGURhQgFpdYbYg4SmHwijcWWBOJz5H9FH
         miRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721726823; x=1722331623;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZUJXxiHx3ch4xF9jcjJSjJMIWkQGZZEcgDv7d4gcZVc=;
        b=YzU9t/sqR3qA8itApJiztEC4I1oJO2Znb23rWhco7OW+BWOfs3L5lvdpvlU7JJc55d
         qFdOAu+bG3FTz7029qVykECRvuA/o6ZzYg2jl7PI7J+xqakDn11/VVYxha36oonaKR7a
         cUOrIOiplYlx/GT/1Hta4j2Pb7U25oLPI1M6Ky99MjSypBIVIFudq5eUafPXCHLPhp+n
         7NuJD5lVKq1w5BKpgHnROTIvlPvLq6CnIVJywaly4SlJcLP2bXVAhbC3h8m25gzpXjkC
         cNo5XjgK98SlzL4mZ6idsMcvWr1ftcJFT7sXNphaWE8xsUkxEzBCtWCHbET375+DW8NU
         DKEw==
X-Forwarded-Encrypted: i=1; AJvYcCWPtzm1JIjo8vcZy23NMsQRcp3VeKfep+1zUX7w33g4sPSZOchlAQvG5pLC6w/JKhpmkeytJ8OWhJ+z3fiJ7IsSP8HQDCFUIY3+EVy4W68=
X-Gm-Message-State: AOJu0Ywe1OKtnYimsvrPEbRmS4gky6x6DCrRG7HRLpHmWHHf9CuMlccj
	n0fzxQyjPWXWp6BWoP33QnO0XnCEqXV5VaQnhZPiezzQIJFQUJOj0lk6bAc+7H0=
X-Google-Smtp-Source: AGHT+IGzvFURKQTRvuwcjd1BXlqNpUrDfAivc4nrPIjvbjmMLEzc+NeoxbLeSoIVfCaEP8Xn5spajA==
X-Received: by 2002:a5d:6b0d:0:b0:368:4edc:611e with SMTP id ffacd0b85a97d-369bae3c846mr5408038f8f.14.1721726823149;
        Tue, 23 Jul 2024 02:27:03 -0700 (PDT)
Message-ID: <45fd3774-9336-47bb-9111-af0ad41664c9@suse.com>
Date: Tue, 23 Jul 2024 11:27:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/6] tools/libxs: Rework xs_talkv() to take xsd_sockmsg
 within the iovec
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Anthony PERARD <anthony.perard@vates.tech>
References: <20240718164842.3650702-1-andrew.cooper3@citrix.com>
 <20240718164842.3650702-3-andrew.cooper3@citrix.com>
Content-Language: en-US
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
In-Reply-To: <20240718164842.3650702-3-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 18.07.24 18:48, Andrew Cooper wrote:
> We would like to writev() the whole outgoing message, which is hard given the
> current need to prepend the locally-constructed xsd_sockmsg.
> 
> Instead, have the caller provide xsd_sockmsg in iovec[0].  This in turn drops
> the t and type parameters from xs_talkv().
> 
> Note that xs_talkv() may alter the iovec structure.  This may happen when
> writev() is really used under the covers, and it's preforable to having the
> lower levels need to duplciate the iovec to edit it upon encountering a short
> write.  xs_directory_part() is the only function impacted by this, and it's
> easy to rearrange.
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Juergen Gross <jgross@suse.com>


Juergen


