Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F5FAB96354
	for <lists+xen-devel@lfdr.de>; Tue, 23 Sep 2025 16:23:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1128417.1468775 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v13vU-0002Ty-F4; Tue, 23 Sep 2025 14:23:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1128417.1468775; Tue, 23 Sep 2025 14:23:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v13vU-0002SC-CV; Tue, 23 Sep 2025 14:23:28 +0000
Received: by outflank-mailman (input) for mailman id 1128417;
 Tue, 23 Sep 2025 14:23:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=QOel=4C=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1v13vS-0002S6-HV
 for xen-devel@lists.xenproject.org; Tue, 23 Sep 2025 14:23:26 +0000
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [2a00:1450:4864:20::42a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id db67bd9a-9888-11f0-9809-7dc792cee155;
 Tue, 23 Sep 2025 16:23:21 +0200 (CEST)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-3fc36b99e92so1522129f8f.0
 for <xen-devel@lists.xenproject.org>; Tue, 23 Sep 2025 07:23:21 -0700 (PDT)
Received: from [172.20.5.108] ([50.239.116.157])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-77f335995cbsm6907107b3a.63.2025.09.23.07.23.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Sep 2025 07:23:20 -0700 (PDT)
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
X-Inumbo-ID: db67bd9a-9888-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1758637401; x=1759242201; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MzK+IETyG2Lq3t2yFPuegv66ul4IJON4z1UQ6o9xoH4=;
        b=P3OvVmh9Uf5isJInHnKVdNVk+c3caN3I5l2e/8dya+JaBjn8Hv0ophQmJgJQi0hSIi
         hqpXeyUj/H4MF9SxY9JzviqyRz8Tf6XrEHIk0hVftch8hP6nW/DlHyXOneA5eqb9pn66
         yJT14/KdjQoKfNZK9trmzAbb9E4CbDPNpc5XD63H/RFeT2tmN8RAID1/0MVUVz7hFME6
         YPwizd19xhbpciYaF2O55ix+yxg4dJSBK3cLZRwAUFxEIUuNbqBN1dXEx2va2HI3wwWB
         6afI36sGieK0cP65TJCdEiwsYDJiyBbm11dBQJ1IEmCMQZvOwcPlj8dAO/CABNgM4XuX
         ybIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758637401; x=1759242201;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MzK+IETyG2Lq3t2yFPuegv66ul4IJON4z1UQ6o9xoH4=;
        b=uUf/iS5UM74xCQIB2pXDejJaizUeeMSXIKikP83Qb8y0nz4EArushIU3+U7oYCrWmZ
         QS+jN1oPDqdwfSrnDEF6+bD9MhiLnzPhxm04ly607NZCwRSeGIUV9hCcrYqz3578EfCR
         O5rIdvt7eUZy0YoC2AQBkmsa548sqCTxTkRDCBuPB5Fx8rCPdOawpsnhBmwpw9ZjFQ7n
         tQGu5uV4rjxg92uMTDSsBHLMh76M8r0akcKA8FVxb6zTdqa/UKF2pbWrXrDQmpZkO9ij
         qAkqW5MZWNLZHI5ktsYjN1/4qv4338wa1TRU5awKAQPPb772kfM6p1oj/r8p+7sYyFUZ
         GAVQ==
X-Forwarded-Encrypted: i=1; AJvYcCW1fzkN0howBY5szlfZvq9psWOA5aqqi0PQalJFgAmjXLdPueNJZ79r0uHW7eC3gCU5UjB5qO9INSw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YztQe0QRZwcb0lTCPJaDHQGnOIYvHwTzFlide5jA8G5zUZD099x
	QFjh8QXnZGplrUfUyRf+ns/sNB9SNxN2BQRu/QdVTF+lNj8jZnwqi0gE+4iOTKxTZA==
X-Gm-Gg: ASbGncvqONx814N/RXEBdrTOrdC5T6pCzHyVYOv/l+Noy0POmewhC63eNLkVCqIyLEx
	ZMQwok+BY/Mk3QsMTQt0fC0QwAEXlMLbaU30WzS/W1bn7RVnE4OW5XcW8mvaBRnDjg83+Vr6JUA
	tl/SBdUGnncyfFqn/+Bxl6jP2rXlCu3iWJR2/K4jwqmSknwW8khFnC5RBt4F8k04gNWW5q4i/eG
	Vtx1k7GOglBH54GO2ELpm/O08OWf2Am4uLcTmIJaHI39YvoLe+sfPyzNUb4PN4yVjIgDyR+e7QI
	kIdHmDAm6AbKC6huSXH1+2mEztCVwhOzSJe3D3ihM8YF8i1lgcCtLEKFp/Vj/mIihMcxQUst46F
	HNjOxHLR2xAuMHp4TSuWgtcajt9pDRdVK
X-Google-Smtp-Source: AGHT+IF2XG8J+l8e+Cg5twOHP7DA0dBQneimjUG4sowjs9kmFm8s5g9jExvxm9s5hcxat6NniJuQDQ==
X-Received: by 2002:a05:6000:2484:b0:3fd:7388:28a with SMTP id ffacd0b85a97d-405cb3e57efmr1983917f8f.8.1758637400816;
        Tue, 23 Sep 2025 07:23:20 -0700 (PDT)
Message-ID: <7e04b98f-18fb-4213-9276-a5ca97e75f0e@suse.com>
Date: Tue, 23 Sep 2025 16:23:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 05/22] x86/boot/slaunch-early: early TXT checks and
 boot data retrieval
To: Sergii Dmytruk <sergii.dmytruk@3mdeb.com>
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Ross Philipson <ross.philipson@oracle.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 trenchboot-devel@googlegroups.com, xen-devel@lists.xenproject.org
References: <cover.1748611041.git.sergii.dmytruk@3mdeb.com>
 <a05ef5d70803eb25ab959de011c9717ce9194558.1748611041.git.sergii.dmytruk@3mdeb.com>
 <0024c24f-39a4-4b5e-af7b-536f7cebfaff@suse.com> <aNJcyA-4sJdQNFK3@MjU3Nj>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <aNJcyA-4sJdQNFK3@MjU3Nj>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 23.09.2025 10:39, Sergii Dmytruk wrote:
> On Tue, Jul 08, 2025 at 06:00:13PM +0200, Jan Beulich wrote:
>> These inline functions are pretty large. Why do they need to be inline ones?
> 
> The functions are run at entry points, one of which is in 32-bit early
> code and another in 64-bit EFI.  Having this in the header is simpler
> than compiling the code twice.  Despite having many lines, it's just a
> sequence of checks, so it didn't seem like too much for a header.

Otoh especially the being compiled as 32-bit and as 64-bit can end up being
a pitfall - one wouldn't necessarily expect this when editing a header file.
A dual-built C file would be different in this regard, imo.

Jan

