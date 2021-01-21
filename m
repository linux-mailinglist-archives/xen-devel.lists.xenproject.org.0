Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D68852FDECE
	for <lists+xen-devel@lfdr.de>; Thu, 21 Jan 2021 02:34:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.71857.129026 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2Or5-0002W0-4x; Thu, 21 Jan 2021 01:33:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 71857.129026; Thu, 21 Jan 2021 01:33:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2Or5-0002Ve-0y; Thu, 21 Jan 2021 01:33:47 +0000
Received: by outflank-mailman (input) for mailman id 71857;
 Thu, 21 Jan 2021 01:33:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iqt5=GY=gmail.com=dpsmith.dev@srs-us1.protection.inumbo.net>)
 id 1l2Or3-0002VY-MI
 for xen-devel@lists.xenproject.org; Thu, 21 Jan 2021 01:33:45 +0000
Received: from mail-qk1-x72a.google.com (unknown [2607:f8b0:4864:20::72a])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id cbd1d084-e2c6-47ba-9fc0-e03eb0813bed;
 Thu, 21 Jan 2021 01:33:44 +0000 (UTC)
Received: by mail-qk1-x72a.google.com with SMTP id k193so274340qke.6
 for <xen-devel@lists.xenproject.org>; Wed, 20 Jan 2021 17:33:44 -0800 (PST)
Received: from [10.10.1.167] (c-73-129-147-140.hsd1.md.comcast.net.
 [73.129.147.140])
 by smtp.gmail.com with ESMTPSA id m64sm2682810qkb.90.2021.01.20.17.33.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Jan 2021 17:33:44 -0800 (PST)
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
X-Inumbo-ID: cbd1d084-e2c6-47ba-9fc0-e03eb0813bed
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=6V9W97T0394SCnXWA8Vj9G4n38Rj3gF1dOp1xyu9jNQ=;
        b=rCEFRXRyhOKsVw6ADrS40Vy7VmMin3faJGGFQSL+/+Mk7yV7ZQPUjAw2cMgjPK6JGD
         OI+oGhsXj7CnAOjoFmCmXsruGzID06KO4zFUFuwPoUGUEcu2DWvvrv26+9b4U+Qt2bte
         nMhd2VC16MatzHDCxXcZKXiFAR17h6vqjssBQ50qVazaqLWrWX3DYCA1v2tR3cSdqISP
         YBBRWDtEGk2nv2ET3tuFvVznoPAMv+ycZA1y3EtYmz2fBPnHGtGebY0TZ1Ot0jjizhvr
         Xww3ulaVJP3HN/1BB954DOFxYeNN/aHUkULdjGBDIq5Roy8ioXHEv66ScCiMnV+Fwewo
         Al/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=6V9W97T0394SCnXWA8Vj9G4n38Rj3gF1dOp1xyu9jNQ=;
        b=QTN4btfj43WBF2W1UXNZD+w3bF7MOkDBpOUrp7dK1AfhrMC+HN2bV+Z8hMXxK5xMbh
         35DRCSvzaeE6TWFDgf1bRViU2pk9wqBbvmORI4UhWHY1f2BpEDz0b+R1Dm/wdYs4TbPp
         HbZVePxyi9OS4yxYRR1VOglvENcXi8+UFtDR/ebHjjGBTKYAg8JVRF9BPS1SXlfPTwbv
         83Pf2x+jBelA7BEjOl023bRSTc1G6X+gLLAorZ81neWA8RPlIvB/DkbdsO12ND65T3ph
         ty6q1Ptu1MQw7tud9g5uIX2+XHtvcWyMc5cDvsluRhFocXhDFxubn0BK9JVqRnFlkOfU
         BQfw==
X-Gm-Message-State: AOAM532WA0dx+YU0wjgAkTUWaOXY8Vm/KXvRoK+qXiugD45ZK/yEozq1
	di8ByNGdyGJdsVRUvt+Wsgs=
X-Google-Smtp-Source: ABdhPJwTab9Iqy9MnUqptcE2XoPTJjP2ExtdJcUxpdZLCGuc3ow+mThE5liN9ykuiBeBkPe/+6x4vw==
X-Received: by 2002:a37:88c2:: with SMTP id k185mr12321420qkd.474.1611192824648;
        Wed, 20 Jan 2021 17:33:44 -0800 (PST)
Subject: Re: [PATCH] flask: label-pci: Allow specifying irq label
To: Jason Andryuk <jandryuk@gmail.com>, xen-devel@lists.xenproject.org
Cc: Daniel De Graaf <dgdegra@tycho.nsa.gov>, Ian Jackson
 <iwj@xenproject.org>, Wei Liu <wl@xen.org>
References: <20201019200318.103781-1-jandryuk@gmail.com>
From: "dpsmith.dev" <dpsmith.dev@gmail.com>
Message-ID: <5cf615a7-7fb4-bef5-4745-fdc2658b7cf3@gmail.com>
Date: Wed, 20 Jan 2021 20:32:48 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201019200318.103781-1-jandryuk@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 10/19/20 4:03 PM, Jason Andryuk wrote:
> IRQs can be shared, so uniquely labeling doesn't always work.  You run
> into issues if you have domA_t allowed access to device_A_t and domB_t
> to device_B_t.  The shared IRQ can only be labeled one of
> device_A_t or device_B_t, and assignment of the second device fails
> since domA_t doesn't have permission for device_B_t and vice versa.
> 
> Add the ability to specify an irq label to flask-label-pci.  A
> shared_irq_t can then be used to for the PIRQ.  The default remains to
> use the device label if an IRQ label isn't specified.
> 
> Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
I don't think it should block this from going in but it probably would 
be good to get an update into docs/misc/xsm-flask.txt on how to 
appropriately use this expansion.

Reviewed-by: Daniel P. Smith <dpsmith@apertussolutions.com>

v/r,
dps

