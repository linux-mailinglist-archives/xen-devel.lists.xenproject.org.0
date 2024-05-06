Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E7D78BC999
	for <lists+xen-devel@lfdr.de>; Mon,  6 May 2024 10:34:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.717320.1119403 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s3tnk-0003OD-DN; Mon, 06 May 2024 08:34:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 717320.1119403; Mon, 06 May 2024 08:34:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s3tnk-0003Mh-AW; Mon, 06 May 2024 08:34:24 +0000
Received: by outflank-mailman (input) for mailman id 717320;
 Mon, 06 May 2024 08:34:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VpOg=MJ=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1s3tni-0003Mb-UW
 for xen-devel@lists.xenproject.org; Mon, 06 May 2024 08:34:22 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6ffa7319-0b83-11ef-909c-e314d9c70b13;
 Mon, 06 May 2024 10:34:22 +0200 (CEST)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-41ba1ba55ffso8591605e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 06 May 2024 01:34:22 -0700 (PDT)
Received: from localhost ([213.195.114.223]) by smtp.gmail.com with ESMTPSA id
 p8-20020a5d4588000000b00341ce80ea66sm10118640wrq.82.2024.05.06.01.34.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 May 2024 01:34:21 -0700 (PDT)
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
X-Inumbo-ID: 6ffa7319-0b83-11ef-909c-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1714984461; x=1715589261; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=QwgDWwoaxTcN56Er8JLtUEke87wX8zbb94LYyK8GmOg=;
        b=p5sFfBuov7fhzr7lgIQiquT8umeLuHfuzb8fpIa3axRuXKRuH9I7fxuAQJtReRJlVq
         g7e3McW2tSV9YnyDPgvuB2O+yCTcm/0m4iIyJD1jFmJgj0w5rjkARvOknBSB8exPADQT
         2k8du8v5tFmGuyCBA3lOTn9ypvW2BAK6Z0JEk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714984461; x=1715589261;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QwgDWwoaxTcN56Er8JLtUEke87wX8zbb94LYyK8GmOg=;
        b=jDqHWseas/bVu6pQh0qhtXtWBH4vDLyKArU/cJ34gPeX3NMazeNf61vbgL7FAKYlAm
         SdEtc5YRI6FyWa+zHXvoqBH97b5O4O+KAImc3YgBJjv7QoElWM/HKci8rGNnVC8es4Fw
         39Tcv9ZkwvpX/gXTefXvYihYxPMzp6Xnr3N6QUDEUt7smVGHJ3R7Qfh8lr4NthfTA+76
         grWSIwfPdR4QIXeMzE2OO2S1uA5cYGQdTgpwMKqMsytwBeW8Nm5wGdcOWBgR9iwT8NTS
         ecbhefZGG9WuEFZL9o22xNqRk6/npOZiK0BNeslYP3+QoYzojoLhDuYQTgwbx6O+654+
         3Mug==
X-Gm-Message-State: AOJu0Yw1nTKFnaio5OhszidWPRFi7fMWBLBI8QsSpU2m0irW7YDalmV4
	Ns0XcJ1q82TtfewGrmdrK+KI4OvtG9+v6BMYvKNeGipn7wWyFAEagW58c76i4dU=
X-Google-Smtp-Source: AGHT+IE1RCjHpW3xXL0Otsjm29GPRvmWbM+Z6ai4/nkhmQPTzvJCJOtILnnNLc5i0ZXrTW1UxITluQ==
X-Received: by 2002:a05:600c:3c89:b0:41b:34d3:42a5 with SMTP id bg9-20020a05600c3c8900b0041b34d342a5mr8860077wmb.1.1714984461444;
        Mon, 06 May 2024 01:34:21 -0700 (PDT)
Date: Mon, 6 May 2024 10:34:20 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Fonyuy-Asheri Caleb <fonyuy-asheri.caleb@inria.fr>
Cc: xen-devel@lists.xenproject.org
Subject: Re: file xen/include/xen/lib/x86/cpu-policy.h: Meaning of CPUID
 constants
Message-ID: <ZjiWDMXFNmwSzAxQ@macbook>
References: <2066842119.4829764.1714981618946.JavaMail.zimbra@inria.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <2066842119.4829764.1714981618946.JavaMail.zimbra@inria.fr>

On Mon, May 06, 2024 at 09:46:58AM +0200, Fonyuy-Asheri Caleb wrote:
> Hi, 
> I am currently doing a study on the way xen handles CPUID information. 
> 
> I came across these constants in the code (xen/include/xen/lib/x86/cpu-policy.h file) but no explanation of why they have been set that way. 
> 
> #define CPUID_GUEST_NR_BASIC (0xdu + 1) 
> #define CPUID_GUEST_NR_CACHE (5u + 1) 
> #define CPUID_GUEST_NR_FEAT (2u + 1) 
> #define CPUID_GUEST_NR_TOPO (1u + 1) 
> #define CPUID_GUEST_NR_XSTATE (62u + 1) 
> #define CPUID_GUEST_NR_EXTD_INTEL (0x8u + 1) 
> #define CPUID_GUEST_NR_EXTD_AMD (0x21u + 1) 
> 
> Please can someone explain to me why we have these constants or point to a documentation which explains it? 
> I am particularly interested in the CPUID_GUEST_NR_BASIC given that for intel processors for example, we have 
> basic leaves running up to 0x21u already for recent processors. This value sort of forces a particular max leaf value. 

This is related to the maximum leaves supported in the cpu_policy
structure:

https://elixir.bootlin.com/xen/latest/source/xen/include/xen/lib/x86/cpu-policy.h#L122

For basic leaves (0x000000xx) we support up to leaf 0xd (XSTATE).  It
doesn't mean there are no further leaves behind it, but we likely
still have no use for them, and hence they are not part of the policy.
The cpu-policy is used to store a (cpuid) policy object for guests,
so if the information exposed in those leaves are related to features
that are never exposed to guests is makes no sense to have space for
them.

Regards, Roger.

