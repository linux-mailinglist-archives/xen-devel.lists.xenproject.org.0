Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 79A818FF17B
	for <lists+xen-devel@lfdr.de>; Thu,  6 Jun 2024 18:01:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.736138.1142226 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sFFX5-0004Xp-AN; Thu, 06 Jun 2024 16:00:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 736138.1142226; Thu, 06 Jun 2024 16:00:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sFFX5-0004WK-7k; Thu, 06 Jun 2024 16:00:07 +0000
Received: by outflank-mailman (input) for mailman id 736138;
 Thu, 06 Jun 2024 16:00:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=tbpc=NI=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sFFX3-0004RJ-N0
 for xen-devel@lists.xenproject.org; Thu, 06 Jun 2024 16:00:05 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d66b4794-241d-11ef-90a2-e314d9c70b13;
 Thu, 06 Jun 2024 18:00:04 +0200 (CEST)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-4215fc19abfso5959455e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 06 Jun 2024 09:00:04 -0700 (PDT)
Received: from [172.20.145.98] ([62.28.225.65])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-35ef5e983e3sm1887078f8f.83.2024.06.06.09.00.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Jun 2024 09:00:03 -0700 (PDT)
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
X-Inumbo-ID: d66b4794-241d-11ef-90a2-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1717689604; x=1718294404; darn=lists.xenproject.org;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/dEI8GtrXaOrV70aXcdMBloGENMJVqUl/hbJDplseHA=;
        b=QiFcAxKVk490rcCJ0DiQqxUxV+dYLCfeUVY12+V99O4COs+J+CaAzIpKkdjwGUnU+u
         QU1Pkm8z3eX//L7t+ANXChYLcv7LM8XzV5w2CECOra4+hOfyqVPiiYsMFo66OfBqGCsR
         k3s8cNtpeO+YAcKdYaVdQvU0mw/ZVCRHWkTgy6uCPYFE/WlEzZUgJRi2YHkA22GoiB2V
         0a4XXPlk4KrnxzNBJMvFwlVEsu983EtuofRZY0PAC8OjopwH3gwKV+s4nuNX000lLfUH
         umVViFw8aqtHBtpIz7/P/BCLnEtCheUuXO1bBHOc71+ymPnCgZ0/LhiLWf6HWwIcBhMg
         Tc9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717689604; x=1718294404;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/dEI8GtrXaOrV70aXcdMBloGENMJVqUl/hbJDplseHA=;
        b=IhFcfhTNe/WIewLBwiwTGQGVI8J8Gv2Os+CcWH5uyuqyfWuYUXeyHCfMllKdWojikq
         7IQ6BsrSngJuiMv/BP6rtywnzfa7q1Wa5mYnggxTXqfVctixaWsN5bKbD+MzBHIia/e4
         kOfgAy1kA9oM/AS4nmrtYMs5pHT4Fe1jYbUQjqurr1WwaEteNAZOVR3lairZ2nU5BA5/
         EI48KgxaBLbOE+mSTkpi/iII8AmKQgPbpACklBHr+DlsvNBY5HI1upvJirItUkVasM/3
         5g+Q0pxLeMExwp+1n8ESmVkCiNdibH0LfTWQl053JMTNjVTMs6UvQkhrfqCkZI8HSyOM
         4spw==
X-Gm-Message-State: AOJu0YxgATest5Q5QS4EaRR6aTXU0V8E63YfsRD4kD2cJW6X8XA9HjyV
	rFK+m2gjDt1oRSiJ+H0eyera5qYG3SrdvWhPwAYpjD35GxK0URmu9WxUeitxag==
X-Google-Smtp-Source: AGHT+IGL1nwvzI0W6hB8Fp/Bhu78C0jW9piL7o8qR48b840k8AfP6Cteu5TlR1K/ho0kWpo1CJs+Sw==
X-Received: by 2002:adf:ec0f:0:b0:354:de8f:daa0 with SMTP id ffacd0b85a97d-35efedcbd63mr26654f8f.53.1717689603652;
        Thu, 06 Jun 2024 09:00:03 -0700 (PDT)
Message-ID: <bd6bd37c-3fb5-4353-a760-5c4465bf7582@suse.com>
Date: Thu, 6 Jun 2024 18:00:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
From: Jan Beulich <jbeulich@suse.com>
Subject: [for-4.19] x86 emulator session outcome
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Oleksii,

a decision of the session just finished was to deprecate support
for XeonPhi in 4.19, with the firm plan to remove support in 4.20.
This will want putting in the release notes.

Jan

