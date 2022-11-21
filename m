Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 98B5B632B5F
	for <lists+xen-devel@lfdr.de>; Mon, 21 Nov 2022 18:45:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.446836.702648 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oxAqF-0006HX-7l; Mon, 21 Nov 2022 17:44:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 446836.702648; Mon, 21 Nov 2022 17:44:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oxAqF-0006Em-2z; Mon, 21 Nov 2022 17:44:23 +0000
Received: by outflank-mailman (input) for mailman id 446836;
 Mon, 21 Nov 2022 17:44:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HMyA=3V=gmail.com=xadimgnik@srs-se1.protection.inumbo.net>)
 id 1oxAqD-0006Eg-BB
 for xen-devel@lists.xenproject.org; Mon, 21 Nov 2022 17:44:21 +0000
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [2a00:1450:4864:20::436])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 20aedae8-69c4-11ed-8fd2-01056ac49cbb;
 Mon, 21 Nov 2022 18:44:20 +0100 (CET)
Received: by mail-wr1-x436.google.com with SMTP id z4so6381418wrr.3
 for <xen-devel@lists.xenproject.org>; Mon, 21 Nov 2022 09:44:20 -0800 (PST)
Received: from [10.95.165.146] (54-240-197-238.amazon.com. [54.240.197.238])
 by smtp.gmail.com with ESMTPSA id
 i3-20020a1c5403000000b003cfc02ab8basm19695480wmb.33.2022.11.21.09.44.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Nov 2022 09:44:19 -0800 (PST)
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
X-Inumbo-ID: 20aedae8-69c4-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=6CZHdh0V/+SYwu9a7gToiPM7S/ZgBybSFroCH/WhgYI=;
        b=o9Y0LGoyN02A8le6Z2d/o3VW+fZe0Oc2tiRUnJSX8ur3/OZLm5wG5zqid41Yq+GjM2
         u6EHb15dvRjJKAp5dR2eZk/CUSW/mUq+714z1YTeNkZxLOItddi9V5AKDNPStZAOIQfe
         uSkCJXY1fjRIAkfR2tfyNWrlrWDQd/fFNpfWtiJq4KGTUxXAzZ/Czty8Csqyo1aG5ZOE
         X4CC2eY+C0d38R70NyN7ofeu+VK9L1aqqdnhZu82/1hVF+Xsy0Igp/1u1w1njjaSbE6+
         OKQB++nu2zE0GJen3CbdpyYMcIeTDNsXM0YPQ/GhI5pv/aNRzJvCXLihbWRtTI8nPZl4
         eMhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6CZHdh0V/+SYwu9a7gToiPM7S/ZgBybSFroCH/WhgYI=;
        b=OvCi3F8tYc4hBjr7iV6DDm+IZOztiXowFWiW1F+4lKR6T0J/qzi3+wY5OSAo3rE2jd
         oj0w0ld/rCikFCWrFtcvohdcR1hZU6QiTTvqeKde2m5V3P7a1xISMYO0fkIPsL9NiMLV
         cwc+vR+G/KhP/ilqKOrZyOwoNGBhdwIqWcpAZ+yDW9akn02clh8J5duHeYmkHX9wSb0l
         DuO+cL4BDMOsi8EMD3zMlJiTx/lcq6amcBtHsFxf9i8bCZjkJVHldnYV7iD9GlR2qe+g
         Iirw/MV1S3/Zw8luhQBgBc+6UM4IpK/g/N9BBLgSwS+tXcn5Ity50K83txltw9MK1TNv
         LQUQ==
X-Gm-Message-State: ANoB5plUkl0+nwTkUmFcIcPGhF7bcztiy0cpYxgnilP3Kux/sBFdzAT8
	1d+jw+2BsrjEDvfJhv2qcc8=
X-Google-Smtp-Source: AA0mqf6mz6tckF37iW+VhPcyLTEn0ltS+FrrSued1Msttt5q/vY7ELJWB/eItUl4u1LBs7ZmQXoDQQ==
X-Received: by 2002:adf:a546:0:b0:234:d3ce:6b32 with SMTP id j6-20020adfa546000000b00234d3ce6b32mr11789191wrb.718.1669052659733;
        Mon, 21 Nov 2022 09:44:19 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <8b5f085c-bc81-0312-294a-b224f23387fa@xen.org>
Date: Mon, 21 Nov 2022 17:44:18 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH] x86/Viridian: don't mark IRQ vectors as pending when
 vLAPIC is disabled
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <a098e0ac-72f7-20d3-df5d-05e50e75ea51@suse.com>
Content-Language: en-US
Organization: Xen Project
In-Reply-To: <a098e0ac-72f7-20d3-df5d-05e50e75ea51@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 21/11/2022 12:13, Jan Beulich wrote:
> In software-disabled state an LAPIC does not accept any interrupt
> requests and hence no IRR bit would newly become set while in this
> state. As a result it is also wrong for us to mark Viridian IPI or timer
> vectors as having a pending request when the vLAPIC is in this state.
> Such interrupts are simply lost.
> 
> Introduce a local variable in send_ipi() to help readability.
> 
> Fixes: fda96b7382ea ("viridian: add implementation of the HvSendSyntheticClusterIpi hypercall")
> Fixes: 26fba3c85571 ("viridian: add implementation of synthetic timers")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Paul Durrant <paul@xen.org>


