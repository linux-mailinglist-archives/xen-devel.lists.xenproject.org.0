Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 03B1EB0C86F
	for <lists+xen-devel@lfdr.de>; Mon, 21 Jul 2025 18:09:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1051646.1420016 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1udt4Q-0001N7-Av; Mon, 21 Jul 2025 16:08:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1051646.1420016; Mon, 21 Jul 2025 16:08:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1udt4Q-0001Kd-7q; Mon, 21 Jul 2025 16:08:54 +0000
Received: by outflank-mailman (input) for mailman id 1051646;
 Mon, 21 Jul 2025 16:08:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YQHN=2C=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1udt4O-0001KX-GA
 for xen-devel@lists.xenproject.org; Mon, 21 Jul 2025 16:08:52 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fd80d1df-664c-11f0-b894-0df219b8e170;
 Mon, 21 Jul 2025 18:08:50 +0200 (CEST)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-4537edf2c3cso47482355e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 21 Jul 2025 09:08:50 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-4563b74029bsm103150715e9.22.2025.07.21.09.08.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Jul 2025 09:08:49 -0700 (PDT)
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
X-Inumbo-ID: fd80d1df-664c-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1753114130; x=1753718930; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PSCNJcv6QTFghzFEJ/V7GveMkpikUdqQNs3AgpLK2aQ=;
        b=OaEzpR2LSQ5j5XxGey+JfcvB9Cvox9BVb24Uhyw2DlDCHlHu8CBfRmfSZDAv9lTFSR
         xD5AF4CewdYJMf6KPLJHO1+Em2vKdELW9am+rurQsFLwQJ4QXDLkqJuKwKSfxctkZC0s
         RP+ag10/ab4d/4zVlssuMlSprI04SSuMHJSbE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753114130; x=1753718930;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PSCNJcv6QTFghzFEJ/V7GveMkpikUdqQNs3AgpLK2aQ=;
        b=p3Q/+mYrgeSwH740DwyLuFB02IMkd2VRmgT63WCpQXcad8EiWkv0LYIRQTxYShlnCH
         smAgmGPVX2XauZpL5gJ2CPJPlzMvVPmQ7rHgl+sW0h5TrYfcjtuxaIEchMDiZ0O3Nmov
         tpvGAeJZh4YIYSQnM+dFKRAY3UPEEpGzzXAX0xI4C6XCVpmG7d7sw1wMnub6W2G/sAJa
         97k+pUyCE3LIAETs8d2NCEdSzWXnlSiOB7HBXvkOlL30nKkz9PjnlnaRejPbjBTJ/+tf
         o5TiPe90M0TT2XHW+2uypwflZnHTrtduYR+CocGfXuxr6Nr965j1rFYrlnLn1OY94Jwq
         d/pw==
X-Gm-Message-State: AOJu0YyjwhOiqvG4Knf7gEvflvaXDNDs544bu2/8IOHmgskLq2ivkOLY
	42oQs1AiF3z6I5xyms+Do7+yBEeQJ9Ysapyzr7AiqCCcQy+Pr0ceIRQUEgrDn/9BQYU=
X-Gm-Gg: ASbGnctxCl0fgpvLnExdmtnf3puf8IdL4Qr1jrAfMgrBzAzGZ83KK3L5ubKbnrTKNU0
	6io/De9HwYrWQx8edtBriXEiqJMr1Vef0Dvq8cFJAXiwq7D1HUB47GxjIw5as9Sr/5V/ofG9sAI
	tybMoOO5+zfmFoLWgd2G9cKTUP2o8tY2yIV+8sUU4RTuGaxnI/Mo8mXYP7Y6zVKCFHquEMTowHR
	YDb2A0P0EWIpOpP7SWPV81yruCuNWJsRqk7btFM4cOZJgIH9bpqeNB/7IxyYBeEvT/ffz8V+He9
	34zWIdo5srnP0Fw43wfaQp1g2YAoZb/NO0YiJRHGKu49UtJS9kGtFWsAfikCKThJT8oulITJZOF
	2N2NOOUERMeZXhxk8ctZ7M3gM02VmZXUn9MD9nDsHvdP0AW+Gaq5thMPlvku5gTFtmg==
X-Google-Smtp-Source: AGHT+IE1IpSTyJb20odiIEMiFMLArXfPu6YgOGdRa7VB+PytcYbWwQXWRvU0M1d4ciWFiehYcXKGaw==
X-Received: by 2002:a05:600c:6819:b0:456:1b24:533c with SMTP id 5b1f17b1804b1-4562e28ca6amr161609895e9.28.1753114129940;
        Mon, 21 Jul 2025 09:08:49 -0700 (PDT)
Date: Mon, 21 Jul 2025 18:08:48 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jiqian Chen <Jiqian.Chen@amd.com>
Cc: xen-devel@lists.xenproject.org, Huang Rui <ray.huang@amd.com>
Subject: Re: [PATCH v7 6/8] vpci/rebar: Free Rebar resources when
 init_rebar() fails
Message-ID: <aH5mEI4WbdO1Wn3N@macbook.local>
References: <20250704070803.314366-1-Jiqian.Chen@amd.com>
 <20250704070803.314366-7-Jiqian.Chen@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250704070803.314366-7-Jiqian.Chen@amd.com>

On Fri, Jul 04, 2025 at 03:08:01PM +0800, Jiqian Chen wrote:
> When init_rebar() fails, current logic return fail and free Rebar-related
> resources in vpci_deassign_device(). But the previous new changes will
> hide Rebar capability and return success, it can't reach
> vpci_deassign_device() to remove resources if hiding success, so those
> resources must be removed in cleanup function of Rebar.
> 
> To do that, implement cleanup function for Rebar.
> 
> Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

