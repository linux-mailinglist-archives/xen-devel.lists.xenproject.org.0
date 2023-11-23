Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 95AA17F5CAD
	for <lists+xen-devel@lfdr.de>; Thu, 23 Nov 2023 11:41:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.639527.997033 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r679S-0006gi-JT; Thu, 23 Nov 2023 10:41:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 639527.997033; Thu, 23 Nov 2023 10:41:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r679S-0006eU-GV; Thu, 23 Nov 2023 10:41:42 +0000
Received: by outflank-mailman (input) for mailman id 639527;
 Thu, 23 Nov 2023 10:41:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RRmN=HE=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1r679Q-0006Wv-OE
 for xen-devel@lists.xenproject.org; Thu, 23 Nov 2023 10:41:40 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e1ceb247-89ec-11ee-9b0e-b553b5be7939;
 Thu, 23 Nov 2023 11:41:39 +0100 (CET)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-407da05f05aso4577335e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 23 Nov 2023 02:41:39 -0800 (PST)
Received: from localhost ([213.195.113.99]) by smtp.gmail.com with ESMTPSA id
 d21-20020adf9b95000000b003316ad360c1sm1326475wrc.24.2023.11.23.02.41.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Nov 2023 02:41:38 -0800 (PST)
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
X-Inumbo-ID: e1ceb247-89ec-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1700736098; x=1701340898; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FWFg81kHTOeNmvjHZbq2eLjKUMq3ECl0btiwtA0aZQ0=;
        b=v2PEszEeluZaOCsW/CrzDgCANkHw2z+HhirjlfgUKptMg7to+m3v8TNyMUnY/SnRGI
         eEB+jIfhhRY4ZD2DPjQoJNt3s4Z3R08cWqDjzbBgCBnnoTj9Qlso99/G8wD8XFhaPM0Y
         N7XhF4+FJeFIBMYAqNY+IxjyvQU26J6gbBYsU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700736098; x=1701340898;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FWFg81kHTOeNmvjHZbq2eLjKUMq3ECl0btiwtA0aZQ0=;
        b=OTO/73kHHLua3pRTQs/kLT0ZXadstqXZDFde6pu7mQlhT6ClUB4TR9YLPzC+nUxRDK
         js61NxgjxhagGv8KTIg3rIL3anf1vMOpR+WZ5KHoSQrilo5VgWkj7Uc+DUxsMyua71kz
         vZfVTHufwftbq9CY+BB0hoAW5VOHlkaOatfThtnMrC7IccO75D3Rekr16lf1wpU7nNuL
         J+vd3zF5IfjUy2/0vBs6D66Crzv/gUs0Svfal/7vUc+Im91TRcBJT01n4yZbJ0235S/2
         nKVS3wqY6QyV34IxChywuxRHD+3Dtwx6SlygWbz8ZfYMko6k0hxT/2ozU1OE72i1b21e
         ByPQ==
X-Gm-Message-State: AOJu0YymQRF6zfC0jWHRbqpmx4s+/HBlLDpbB4OrLFtA5nAbON/MQNRC
	nfaY0Q0frrtBSWOKvQNreshWNg==
X-Google-Smtp-Source: AGHT+IGVukoRIKKdoE+XZQ4i0Cf8GRXK0OMdjzbsrUjfxjlJMNDWOALCDcbIARj93zs8yiXQ5+uv1Q==
X-Received: by 2002:a05:600c:a46:b0:402:f55c:faee with SMTP id c6-20020a05600c0a4600b00402f55cfaeemr3591473wmq.26.1700736098437;
        Thu, 23 Nov 2023 02:41:38 -0800 (PST)
Date: Thu, 23 Nov 2023 11:41:37 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH] x86/vPIC: correct vcpi_domain()
Message-ID: <ZV8sYSbcVV6Fs_JQ@macbook>
References: <f7016076-19a4-4416-b7be-df16e8d4a017@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f7016076-19a4-4416-b7be-df16e8d4a017@suse.com>

^ typo in the subject :).

On Thu, Nov 23, 2023 at 11:20:24AM +0100, Jan Beulich wrote:
> Make it use its parameter in both places.
> 
> Fixes: 00a70f44a68c ("[HVM] Update VPIC device model for new interrupt delivery code")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

