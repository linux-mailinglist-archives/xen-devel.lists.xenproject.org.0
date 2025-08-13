Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AA43B256A3
	for <lists+xen-devel@lfdr.de>; Thu, 14 Aug 2025 00:32:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1080375.1440812 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umK0t-0007tj-7r; Wed, 13 Aug 2025 22:32:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1080375.1440812; Wed, 13 Aug 2025 22:32:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umK0t-0007rF-52; Wed, 13 Aug 2025 22:32:07 +0000
Received: by outflank-mailman (input) for mailman id 1080375;
 Wed, 13 Aug 2025 22:32:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2/kn=2Z=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1umK0r-0007pu-06
 for xen-devel@lists.xenproject.org; Wed, 13 Aug 2025 22:32:05 +0000
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [2a00:1450:4864:20::435])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5633f8d6-7895-11f0-a328-13f23c93f187;
 Thu, 14 Aug 2025 00:32:04 +0200 (CEST)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-3b9e4106460so193046f8f.2
 for <xen-devel@lists.xenproject.org>; Wed, 13 Aug 2025 15:32:04 -0700 (PDT)
Received: from [192.168.1.183] (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b79c3b9c7dsm48736510f8f.26.2025.08.13.15.32.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Aug 2025 15:32:03 -0700 (PDT)
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
X-Inumbo-ID: 5633f8d6-7895-11f0-a328-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1755124323; x=1755729123; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=r33n16Q1Y6Q6BzW9l9p0XcW49r+7320vuawT6pS7iyg=;
        b=V8rwxsH8QKGV8IqBlVJBNbhNCJkvToX1Bfa/ci1M8LoJGmrTPhcqINcBFHG61M/Wrh
         mS/3zCHnI6GzFFBc9Njy8lP9O/b3sgmlcAJNooAQdvterjIiU5gZBtFR7+u18gWMJE21
         m69+0tGt8iElYobchhE6xqDOJ8qPhSHmI7vgI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755124323; x=1755729123;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r33n16Q1Y6Q6BzW9l9p0XcW49r+7320vuawT6pS7iyg=;
        b=ocF99leasPEl2VNc7CYfnc49zhB0ZTgWLCUlrCzjs7tC4sQwVIpqqOdYwoG/fyhXPz
         nzfoHWAf5bEVgj69qhmEL3fEqSXxuZMmE+m58uw9/xK5YSGtjGKM5UtfGrY4xykiiiHr
         l98ENmQkXOUatUh6BF3TWlgS09SsscxQU/Qyv5i3cwsftBP4owPNmKHW8UCEXga+MAqH
         RfSQbE2KV+8Sv+RxzH1a3+yC97ehuEyIkAr8680qcF+0d3SAmoEdZ+wt+vkOYMCnGsag
         SMHmBEl6T8sPPg30OXskU28fvoA+U1W9VhGuYq7gasmLj8aQFvHFPhJBJ9MVC8/rXYkW
         BKFw==
X-Forwarded-Encrypted: i=1; AJvYcCVMZPwYn7ijZ1NVUkzyOqg9HipdWh2PBaV41av5nDRvvAQ+Gw79KQrABHWLfivwR5ega1g/XVrZzls=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxPQXRNxQ3lSFie0UtPN/zgRuQCUa6BZoCHQlcm2Zzc/pe14NMo
	BuEdgmr6pb1vznWX11VfAmCydT7BQdSKua7IXPtdf04K+V9bR5H8AEghhK8cm4AHlvI=
X-Gm-Gg: ASbGncuntwI3i1HTUJMTX0qebPHFzvzbcNnaxhCs1OuoLDvvBEDsp+1SlLSXO2NtwVP
	ddgQsBT7eve3YQj1CRVNKhdbjUAO7GnZZ/sPt5jUodO/tFUL1djqsP05bCf822MSIGtHQKHzD85
	16y77AIBIbXGop4L7thDb6HStdyPX2+yq/6fsdRYdHvCPsAuRKZ0dupr7rogxRMo8Wf48erpOcf
	QNYbpXBp5k0PpxYPxAY2eZP1uoVh0hJuQN5a2X/q+ND9CyULhKnah5uB1uXk3HhQVXbvzHW7AY3
	IS3ldZIrVLiDzyQQqO4nY2e8ZQqFsYUe2wQYtbJp6VLR8CnM7nuPwI0c6kGoZd2qmi9Ho98cUk0
	K+bUjxj7NvjdVInmZt+zTOPItB/fjeOKrdll/yI4hL7uOqT3/QlM4GL7ON+31i4tlMhr4
X-Google-Smtp-Source: AGHT+IEDM0XqEkBSqTPR2Nn16MklTPm9y9fjyeF4LkIeB94PPFJJUNY3sUx2qVtjtE/oVc+0mEmNSw==
X-Received: by 2002:a05:6000:2012:b0:3b8:d3ae:26e with SMTP id ffacd0b85a97d-3b9edf82927mr716651f8f.53.1755124323533;
        Wed, 13 Aug 2025 15:32:03 -0700 (PDT)
Message-ID: <83a83cdf-91e2-4b82-89b9-b07ecdb20a3f@citrix.com>
Date: Wed, 13 Aug 2025 23:32:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH 1/3] xen/compiler: drop alternative unreachable()
 definition for older GCC
To: nicola.vetrini@gmail.com, xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>
References: <cover.1755111932.git.nicola.vetrini@bugseng.com>
 <9215845f364527203efaea9dd1019cd1e3c1768b.1755111932.git.nicola.vetrini@bugseng.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <9215845f364527203efaea9dd1019cd1e3c1768b.1755111932.git.nicola.vetrini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 13/08/2025 8:12 pm, nicola.vetrini@gmail.com wrote:
> From: Nicola Vetrini <nicola.vetrini@gmail.com>
>
> The GCC baseline version is 5.1, which supports __builtin_unreachable(),
> therefore the alternative definition can be dropped
>
> Signed-off-by: Nicola Vetrini <nicola.vetrini@gmail.com>
> ---
> Mentioned in https://gitlab.com/xen-project/xen/-/issues/201

Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

