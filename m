Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DD85C428A06
	for <lists+xen-devel@lfdr.de>; Mon, 11 Oct 2021 11:46:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.205644.361014 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mZrsc-0006Za-VK; Mon, 11 Oct 2021 09:45:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 205644.361014; Mon, 11 Oct 2021 09:45:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mZrsc-0006XF-R0; Mon, 11 Oct 2021 09:45:58 +0000
Received: by outflank-mailman (input) for mailman id 205644;
 Mon, 11 Oct 2021 09:45:56 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wUPg=O7=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1mZrsa-0006X3-K9
 for xen-devel@lists.xenproject.org; Mon, 11 Oct 2021 09:45:56 +0000
Received: from mail-wr1-x42c.google.com (unknown [2a00:1450:4864:20::42c])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e237623a-6e39-4211-b51d-17c707c08a53;
 Mon, 11 Oct 2021 09:45:55 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id k7so54027622wrd.13
 for <xen-devel@lists.xenproject.org>; Mon, 11 Oct 2021 02:45:55 -0700 (PDT)
Received: from [192.168.1.186]
 (host86-143-223-59.range86-143.btcentralplus.com. [86.143.223.59])
 by smtp.gmail.com with ESMTPSA id r9sm7078320wru.2.2021.10.11.02.45.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Oct 2021 02:45:54 -0700 (PDT)
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
X-Inumbo-ID: e237623a-6e39-4211-b51d-17c707c08a53
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:reply-to:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=l3nZLNB1OcHU4tOQHGyeKXwe/p3/bnTeaQVChfxc8lE=;
        b=pFlo3N/QG+Cq28NeW8/JBBud3J55ARyYeYICkekKPHuYyeNcRXtVceBMiEvNHySxis
         Ul15oRbKT7Jm3m4HwOndT0ySSTpHHKRiqwcFFkUKyqmcEZePe7vlQg8no0ZCORGjAg+y
         jLQL1U4oSTaQ5PxrDJ1AcArBt4PnOVyq/VZDS2yc77LIPjjNYYxl0Yu+gd6PKoWK9fq3
         HJBC+UoXmXGSJcgc2ZkzmRIb8H4dKjJv43CG09mRgH0fpQioFgYLQ95cdTTssHFEDKp5
         BGdDGluXCPCUBwj2MakVv8Vu/KxgHJhvNxamdaV7SyR59ZGWs1MxEYYrogYam7swu0pj
         iBYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:reply-to
         :subject:content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=l3nZLNB1OcHU4tOQHGyeKXwe/p3/bnTeaQVChfxc8lE=;
        b=pTvQy7N3Rpe3qt24GP8ZVCAyU0VZDX5mBT/1+RD0b4y2f2Y6MZvZH5LkXhFERY5R1Q
         ylKRqKYguM/5EVTWvWRqwKHdzkPIxha8sqg196ROzhFLgNgJCN6lOqOtt7WZA0qnKETY
         4nF0L+M8CAcGKxDt6pzwTomggC/IN26UfwsQBOVRziLhOKTc9QBzkK22zidp0DO26/oK
         UaPIjnPN2kuy9bj+vyIjBWGO8czCUh2pxl1BMXpVNN7na+zkA/5bWsGOrZrjiTB+Hyte
         C2TjGB+nRKSCevZRVTnL5ZNr+kCu6LmaervWXKqxkQBX2Rgy5KNaG8f6PIgHXKOHC0A6
         ZYew==
X-Gm-Message-State: AOAM533pmyAalpELHRA6Kj8lCFWKDkpqprmkG0HRD8dJ/Qnoj5fTQ2Ho
	fvSSr5i7nOjh8XbJAIVc+qU=
X-Google-Smtp-Source: ABdhPJxXNLAv8dpZiH5e4OGhmz6llEJUKMMM8vE1HqtNd1vjArAisPa4+i8qcbt3apn6Pt9RH4Jh6Q==
X-Received: by 2002:a5d:6b46:: with SMTP id x6mr23276648wrw.192.1633945554825;
        Mon, 11 Oct 2021 02:45:54 -0700 (PDT)
Message-ID: <b2d4ec6f-3cfb-0dd7-e499-112437e132ae@gmail.com>
Date: Mon, 11 Oct 2021 10:45:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.2
Reply-To: paul@xen.org
Subject: Re: Ping: [PATCH v2 3/3] AMD/IOMMU: consider hidden devices when
 flushing device I/O TLBs
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Paul Durrant <paul@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <c0a460c0-9d7e-c015-37cf-4775bdef33a8@suse.com>
 <09b6d94d-0116-c8ee-5daf-ddcc19d37029@suse.com>
 <2b6cdf04-ab6b-bbbd-6df1-d90fc22752f8@suse.com>
From: "Durrant, Paul" <xadimgnik@gmail.com>
In-Reply-To: <2b6cdf04-ab6b-bbbd-6df1-d90fc22752f8@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/10/2021 09:04, Jan Beulich wrote:
> On 17.09.2021 13:00, Jan Beulich wrote:
>> Hidden devices are associated with DomXEN but usable by the
>> hardware domain. Hence they need flushing as well when all devices are
>> to have flushes invoked.
>>
>> While there drop a redundant ATS-enabled check and constify the first
>> parameter of the involved function.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> The VT-d side equivalent having gone in a while ago, I think it would
> be good to have the AMD side on par.
> 

Agreed.

Reviewed-by: Paul Durrant <paul@xen.org>

