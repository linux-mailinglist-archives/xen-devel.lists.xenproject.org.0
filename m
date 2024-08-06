Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 88D30948CD8
	for <lists+xen-devel@lfdr.de>; Tue,  6 Aug 2024 12:30:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.772752.1183197 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sbHRm-0007Cl-Ip; Tue, 06 Aug 2024 10:29:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 772752.1183197; Tue, 06 Aug 2024 10:29:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sbHRm-0007Ao-Fp; Tue, 06 Aug 2024 10:29:42 +0000
Received: by outflank-mailman (input) for mailman id 772752;
 Tue, 06 Aug 2024 10:29:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ByCl=PF=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1sbHRl-0007Ai-8i
 for xen-devel@lists.xenproject.org; Tue, 06 Aug 2024 10:29:41 +0000
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [2a00:1450:4864:20::532])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c85b3b27-53de-11ef-8776-851b0ebba9a2;
 Tue, 06 Aug 2024 12:29:38 +0200 (CEST)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-5b3fff87e6bso611055a12.0
 for <xen-devel@lists.xenproject.org>; Tue, 06 Aug 2024 03:29:38 -0700 (PDT)
Received: from ?IPV6:2003:e5:8729:4000:29eb:6d9d:3214:39d2?
 (p200300e58729400029eb6d9d321439d2.dip0.t-ipconnect.de.
 [2003:e5:8729:4000:29eb:6d9d:3214:39d2])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5b839c25558sm5842319a12.32.2024.08.06.03.29.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Aug 2024 03:29:37 -0700 (PDT)
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
X-Inumbo-ID: c85b3b27-53de-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1722940178; x=1723544978; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ara8Ck//VhUeTFESs0zv2ocdoS7WiqC+ams8ldqOD8g=;
        b=TE3cvynrRytkVsd8cW7qC0ds0ytRsRwBxNzH0qkozes5CJ9KKCOsqcpXCVOm2PJ8Zg
         NsamPg8oF37TS2jab4K9Mr0YlbweumwTFr14nNVxikE7aoqvIS0Z234uEHigS8JySiBv
         W2CoIckoWjt0ec04kkhHqiSsfxrJsP0D8l48hBg9ckw2T9aUNaSqYNlLVmngDuO4+4fO
         yu1f9WEb02NhaU1eGuWWMkwcg1VFvUpoRAi7Y25rgMJvN8eGit44O+E4nDgpWY4ffC7L
         M7A8KEQ+zsWenpcc/E/ivfZclHVE+InlSdYb2PsvCQ0LiHTO9h5cYxlY29DOb68K0eoC
         p2ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722940178; x=1723544978;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ara8Ck//VhUeTFESs0zv2ocdoS7WiqC+ams8ldqOD8g=;
        b=MAZFgyZMhvh3UusaI/fFGfbj/Ik30P1vqu4QZo7VNjgWUEDdarTF0R/k1X1Z6fWtGn
         df6y8IAmjrOvf3q+sTUcJvpFyw88MWAgbdpr6mz6VjxPe3OuhmdGQnzujx8ulGL+qZs6
         66lMB50txkwKoX9op0x2QpE2Lpq5nOlwVrbXBK2NCzdBYifCH2kj+3ud2gU1r4IJsoM9
         dR0vhtsqHg6CRjb7L4svfhi8vqv/C7wfU/IOAdnB6KC3pAxrVvq6213TOYApMubK26UL
         9pag/FDSX9gBMwkTuZ8zwr3cNkh04nYOA3ypYWlglRi/CTdLud7+WbdQOrJigyfLstzR
         Cxtw==
X-Forwarded-Encrypted: i=1; AJvYcCWiYIkzjb8HbDREd2t2bB+mGnQL5mLLaqm5y2nEsjJ7emmJcY7V0AZmLqdAmu1FllCHkggnO+Jielbmyc1xk5V+iKYOgDt/TzvIRQJqTXk=
X-Gm-Message-State: AOJu0Yz2IX8HXe2BvUXmDsQPcdkNviiXv4FJHHM45Tbc8+5u7i/1gVwN
	1I5pTHmcIEqyt3i6BEghExZkILOnQZgIsR23xi73lNo+HEUc/hhmzes30BZSgU4=
X-Google-Smtp-Source: AGHT+IFZJqkh3XINVxZYEUmUFQWgau0QkX25NIfXXGejXjkLdZGBlvCb6/BB/wxJb40934O1mv18PA==
X-Received: by 2002:a50:fe99:0:b0:5a2:abcb:c4cf with SMTP id 4fb4d7f45d1cf-5b7f4294f19mr10731768a12.22.1722940177571;
        Tue, 06 Aug 2024 03:29:37 -0700 (PDT)
Message-ID: <dd233141-5beb-4681-874a-7cffcd3d9da2@suse.com>
Date: Tue, 6 Aug 2024 12:29:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] libxl/disk: avoid aliasing of abs()
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Jason Andryuk <jason.andryuk@amd.com>
References: <ad3b9873-b478-4448-8395-498399040324@suse.com>
Content-Language: en-US
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
In-Reply-To: <ad3b9873-b478-4448-8395-498399040324@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 06.08.24 10:40, Jan Beulich wrote:
> Tool chains with -Wshadow enabled by default won't like the function
> parameter name "abs", for aliasing stdlib.h's abs(). Rename the
> parameter to what other similar functions use.
> 
> Fixes: a18b50614d97 ("libxl: Enable stubdom cdrom changing")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Juergen Gross <jgross@suse.com>


Juergen


