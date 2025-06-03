Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FD98ACC771
	for <lists+xen-devel@lfdr.de>; Tue,  3 Jun 2025 15:14:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1004425.1384141 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uMRSt-0001wT-Lh; Tue, 03 Jun 2025 13:14:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1004425.1384141; Tue, 03 Jun 2025 13:14:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uMRSt-0001v0-Iy; Tue, 03 Jun 2025 13:14:03 +0000
Received: by outflank-mailman (input) for mailman id 1004425;
 Tue, 03 Jun 2025 13:14:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pD2F=YS=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1uMRSs-0001YM-5D
 for xen-devel@lists.xenproject.org; Tue, 03 Jun 2025 13:14:02 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9dc71bbc-407c-11f0-a300-13f23c93f187;
 Tue, 03 Jun 2025 15:14:01 +0200 (CEST)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-450d668c2a1so29625035e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 03 Jun 2025 06:14:01 -0700 (PDT)
Received: from [192.168.1.183] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a4efe6c94dsm18460034f8f.37.2025.06.03.06.14.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Jun 2025 06:14:00 -0700 (PDT)
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
X-Inumbo-ID: 9dc71bbc-407c-11f0-a300-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1748956441; x=1749561241; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=7Ar2Yizbo6vvS5p58yug47JAna3h/wkC62zs6el0WO4=;
        b=iTQDnZjpkiqG8QKT8nqiLJDrHCyp5pWSY4AqBfKeG8dtJVGD5+cEVUrd5EA6cB5y4a
         LQXSe4XyZToGRLV35JHGuQ+IyEeMzZxsSn85fAOxEXJx7eAUC9DGV8oYI9hP/RAWtWoC
         cKDzEkEQxQX4T3psXbD9gIM7iw5Xq3MGNLqeM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748956441; x=1749561241;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7Ar2Yizbo6vvS5p58yug47JAna3h/wkC62zs6el0WO4=;
        b=U4uaYqGPIMU/LpFQHvMTPlz9pxn9g4N5u5FtW+2Z+dg3Mn/qlh0GV1hbI8N1QEGyF8
         rp5ZM15tK0DGzD2KfHKG+CEdgU3UsTilZV2036qD+gILk1h/cXaPAawu93z5cscvOal7
         KuZEKX//0g1I+lteg+Rsl4DgLkMirX0E2MD0FONTTF2URAIRoSb5chK1o+Q+UFGE6JgF
         A1r2kaGmtBugU8eNgeLdKGGMAOK2Cu/2LWcuQrlEkDTH8nuX0JfC+z8Z1aBsJFIjFU7t
         wWaLaPzdkSy3HINyUsLAP+rAYp5XPnzsVqmMR8HqiaB9AHRzCd/l+oDiN9QfjrbrxYWq
         zwYg==
X-Forwarded-Encrypted: i=1; AJvYcCWWhbfdZ2u6zV7GdKdyPhZg89cz3Lyk8DG8nP6LQx5V0Hj4p0Vuek4Y3epW6+pv7S+BDSjN0NO9KCo=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxbfzhNKnLYPDqvqAXlpkiRJvTVu1x6a0ZYaRq58+FkH9y0pjrk
	YBSDvhzcRtO9gIOXD7/YQivFXWAnYKw2n3cv731GBwz5ytK+0eWAyygjVlX9onSVQz5iTfC8l/r
	Z8ML2
X-Gm-Gg: ASbGnctNNPR6XiTo5gy/eYM7ShwqVpAJybKvRKxRj50+HWHfuEvrCenWmf8YzehalaD
	LmioAJho9Jc3eG7OJMThETElCba22la2TUj/8GftHyPJ1AbFDNul7Xtw78wu8nkP+iV942qqXsK
	YaxCbD4t7JI7QAIQktEUFJFFermzUbz2Lt5YpDfnVUJnHuV+jmhTb3m37sLGGU1STwN6e/WX+Q1
	gBDlt4weRqV20RiD/sERDfkiPHFRr0MRlAO+5f45cdKJ+swfcmj/sZFQQLrtdjUdo9APkYDPZWZ
	wfr6Vwe53MFxlDhZjJcZ+O8/cBVaFKQD7r8HO1bFH6LxfVM9GzGwuLNBV7lRqSCljRVFmDFxoDz
	cdTi7iWlX64My/fMu
X-Google-Smtp-Source: AGHT+IHNEIOJzC7PQHqjq+Q5/u+C9LKGCEeaTegrDAHzl0Wk2GwOVZtAXoYFtOXfKs/7GFFT/DeDxA==
X-Received: by 2002:a5d:4c49:0:b0:3a3:779d:7421 with SMTP id ffacd0b85a97d-3a514214285mr1737928f8f.0.1748956440963;
        Tue, 03 Jun 2025 06:14:00 -0700 (PDT)
Message-ID: <30007ef7-9576-41fb-8d4d-08ae7cbdacc4@citrix.com>
Date: Tue, 3 Jun 2025 14:13:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH 6/9] CI: Upload junit result as artefact
To: Anthony PERARD <anthony@xenproject.org>, xen-devel@lists.xenproject.org
Cc: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, Anthony PERARD
 <anthony.perard@vates.tech>, Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20250603124222.52057-1-anthony@xenproject.org>
 <20250603124222.52057-7-anthony@xenproject.org>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20250603124222.52057-7-anthony@xenproject.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 03/06/2025 1:42 pm, Anthony PERARD wrote:
> From: Anthony PERARD <anthony.perard@vates.tech>
>
> This allow to investigate the file in cases of error. Not all
> jobs that extend ".adl-x86-64" are creating a "tests-junit.xml" but
> Gitlab only produce a warning when the file isn't found.

I'm not sure what you're trying to say here.

~Andrew

