Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B8CA249F671
	for <lists+xen-devel@lfdr.de>; Fri, 28 Jan 2022 10:33:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.261900.453757 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nDNdI-0002rO-Sn; Fri, 28 Jan 2022 09:33:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 261900.453757; Fri, 28 Jan 2022 09:33:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nDNdI-0002pE-Pf; Fri, 28 Jan 2022 09:33:28 +0000
Received: by outflank-mailman (input) for mailman id 261900;
 Fri, 28 Jan 2022 09:33:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NLE7=SM=gmail.com=xadimgnik@srs-se1.protection.inumbo.net>)
 id 1nDNdG-0002ow-Oc
 for xen-devel@lists.xenproject.org; Fri, 28 Jan 2022 09:33:26 +0000
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [2a00:1450:4864:20::435])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 57cc90b5-801d-11ec-8eb8-a37418f5ba1a;
 Fri, 28 Jan 2022 10:33:25 +0100 (CET)
Received: by mail-wr1-x435.google.com with SMTP id a13so9671526wrh.9
 for <xen-devel@lists.xenproject.org>; Fri, 28 Jan 2022 01:33:25 -0800 (PST)
Received: from ?IPV6:2a00:23c5:5785:9a01:ad9a:ab78:5748:a7ec?
 ([2a00:23c5:5785:9a01:ad9a:ab78:5748:a7ec])
 by smtp.gmail.com with ESMTPSA id j2sm1652268wms.2.2022.01.28.01.33.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Jan 2022 01:33:25 -0800 (PST)
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
X-Inumbo-ID: 57cc90b5-801d-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:reply-to:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=plhXkEzt/U4kKfasM9VBlGsAddywk/NZy1UIU6M0Dcc=;
        b=SN9XjuVt4SQPxCgWSLSaG+9QiJdi7C/7x4OhMtoC32vj8ZLWq52rUAN35CpEETSxig
         ey00hCL9j2QWAaE8sbfqpvv45sFh/fr36n5MOX/g6iyVXPAxd88cS1dOp02lHB3qW6se
         Pq2qWBxCSNU33gNWcfIZsr6e6jY2uJ8bJD39fS8K8hoNZlWRY9pstW1arr5iVrp5gxRd
         IY2or7Cj6hw3APqZuYKfqwgYe10TiZiZFCcfa/B7BhTayVspuHD0LYSJk6UisylNeoVV
         dUQ5zA8II+qEmF3IuZYl1uwTxivqpUJKHfUx0qmRPzJ0mfJR9OXR1+5fUlES03C2AlzG
         NLvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:reply-to
         :subject:content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=plhXkEzt/U4kKfasM9VBlGsAddywk/NZy1UIU6M0Dcc=;
        b=PBgKh1n2++5uszUL42H1ILRBREFi/wVQcjFG6oyOdMNELAGpOwmnk3UB6cM4k5+hJh
         lozhvfCGSJyuj8eD+OnAwd33ud717MB9B8R0PBIPmRTLmQeIiEv31iQ20TVs6IreupRu
         KCrDqEjJ9MXG8yA4wB++qyhUUbX1Ny/xEZ1ME5wHNIFZT1lwzE2NDk4u8PqnZ+KX9YVJ
         ZdBoe3eGLNHrBy58L+AaJHr1fr2mrafrf4jZa/RJh69sf100ZAoSzfPqXt7TTGy36wC3
         FWAGKQj7HhK83q2avlHbriKMxFmoYpyi2ZKoYVYERftsJ5szNceBYoDKJFsBKHapIGBq
         BJjA==
X-Gm-Message-State: AOAM532kCixyLgygK+NK/Hrc+kT9FtnYEwrYTRQcAn3sMe4r9m592T9P
	VnLVhRzR49rd8qwZTAo8rRc=
X-Google-Smtp-Source: ABdhPJzVNDebvB0BksOvP2AeoIfSOcAj6W1AvoQPWcqABnzeTPtP/qjMjYQiKoGx5lbyfqb2slzJgg==
X-Received: by 2002:adf:f302:: with SMTP id i2mr6414441wro.114.1643362405426;
        Fri, 28 Jan 2022 01:33:25 -0800 (PST)
Message-ID: <a62cbd59-f968-0bb4-b261-8ad21c19c593@gmail.com>
Date: Fri, 28 Jan 2022 09:33:24 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Reply-To: paul@xen.org
Subject: Re: [PATCH v2 3/4] VT-d: replace flush_all_cache()
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Paul Durrant <paul@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Kevin Tian <kevin.tian@intel.com>
References: <4b7db7ae-eb84-7ecc-4334-fe5f0f7ef46b@suse.com>
 <2a39cb48-7d38-6d7e-0557-fd93d377a31b@suse.com>
From: "Durrant, Paul" <xadimgnik@gmail.com>
In-Reply-To: <2a39cb48-7d38-6d7e-0557-fd93d377a31b@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 27/01/2022 14:49, Jan Beulich wrote:
> Let's use infrastructure we have available instead of an open-coded
> wbinvd() invocation.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Paul Durrant <paul@xen.org>

