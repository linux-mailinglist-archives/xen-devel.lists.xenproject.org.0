Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F35AB979B11
	for <lists+xen-devel@lfdr.de>; Mon, 16 Sep 2024 08:19:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.799120.1208946 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sq53X-0004nI-Ha; Mon, 16 Sep 2024 06:17:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 799120.1208946; Mon, 16 Sep 2024 06:17:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sq53X-0004kk-Ed; Mon, 16 Sep 2024 06:17:51 +0000
Received: by outflank-mailman (input) for mailman id 799120;
 Mon, 16 Sep 2024 06:17:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OuWe=QO=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sq53W-0004ke-E8
 for xen-devel@lists.xenproject.org; Mon, 16 Sep 2024 06:17:50 +0000
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [2a00:1450:4864:20::135])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 65322e4b-73f3-11ef-a0b6-8be0dac302b0;
 Mon, 16 Sep 2024 08:17:48 +0200 (CEST)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-5365a9574b6so3902671e87.1
 for <xen-devel@lists.xenproject.org>; Sun, 15 Sep 2024 23:17:48 -0700 (PDT)
Received: from [172.31.47.100] ([193.118.249.27])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a90612b3997sm266832766b.104.2024.09.15.23.17.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 15 Sep 2024 23:17:47 -0700 (PDT)
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
X-Inumbo-ID: 65322e4b-73f3-11ef-a0b6-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1726467468; x=1727072268; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VYRmWmIj73Iq2lclrxswz6wG8RL/Ue0pIyRVsvzgNfY=;
        b=BAYhaC70O+wOXG5/vgNRA3ee90f4hzKd1rxTytiAIaQks9e1jT5XnI9D8mOWfr8enw
         lET2fzvjFdsg/WQ7MoE7cDXLmSRLwMtIaeVnwd2H61F6vAVMqeYWwMdnnGNtzWOIwVU3
         coHUonJPTC75WbUD/75zBUWTWbrFX0oVv96zskCd+AG/Zm5fDsr2q6yvLuPU8ZANZ45D
         IjIKGzAo+JrgMW67jmBPnh3NumR+pTYUekpkIuxKFGNT+/OQjdWXfzbQuxjsNB0EdelW
         aNp3DqZNbGQArSZqEJ35A6FJ5fUEjS6zsa7+15aonXPtW/vCdPq8yr1DKLNTZTTy4Gci
         hELQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726467468; x=1727072268;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VYRmWmIj73Iq2lclrxswz6wG8RL/Ue0pIyRVsvzgNfY=;
        b=o7BdzAo6Jebl3ntxivQ2IgepRGuqq+bIC7sJUdjoaNgCtDHhaPIZEaALl2ZAwHu/3l
         H+FU2zGzTG+/wmOsOYhqaPj25xNNANXwtXcjbjps1aHfd849kQG7Ik0Tn+1LCKxkyuKf
         tXhNrmhsBNGI2Z7Dg53OQcA6K/u85bX14gdAzWBL/FFjCJCy9fU6/tcRJkEke36Pl3Su
         huvvWHVjRcccVjy0QNHMo7EC0373n7ZojLXU4D38jSyYLcGxkOqZS05uNTAn0Mf14zMA
         ZRKoAA59kfxeQ32lwTDmhyU6RglOihLSvU7wWNK/BFNdHMluls9tsc7iPJeensPyMgP+
         Yk2g==
X-Forwarded-Encrypted: i=1; AJvYcCVb2FhFl9Z9m8YrlI/7edEJfX+MMSX82LWN789IwS6hKVH48ytzxFMG1lXQp8hTQl39z8oNNquffm4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzOt9pBqekKRCgO7A86W0JhDLdVMz87jCX9peMDiJXtxx2BP+Tu
	f7jeUAJCIzCwII2N3m6BgyONutFJW0HdKAU9STPg1GgwA7zzjbYOdUbAYAF9tw==
X-Google-Smtp-Source: AGHT+IGeU6+KECUGKFkR4cOSPW8427s8cBVKq2flPvGzqe7ir3vK6cucpRM0DihdZNW7hbHCabojgQ==
X-Received: by 2002:a05:6512:2803:b0:536:2356:5dce with SMTP id 2adb3069b0e04-5367ff329e6mr5847397e87.58.1726467467858;
        Sun, 15 Sep 2024 23:17:47 -0700 (PDT)
Message-ID: <3f650f8d-6905-4925-a2d5-7044f725f5dc@suse.com>
Date: Mon, 16 Sep 2024 08:17:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 1/8] xen/riscv: use {read,write}{b,w,l,q}_cpu() to
 define {read,write}_atomic()
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
References: <cover.1726242605.git.oleksii.kurochko@gmail.com>
 <7235612db1c273638263b45c59655328256b8cf2.1726242605.git.oleksii.kurochko@gmail.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <7235612db1c273638263b45c59655328256b8cf2.1726242605.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 13.09.2024 17:57, Oleksii Kurochko wrote:
> The functions {read,write}{b,w,l,q}_cpu() do not need to be memory-ordered
> atomic operations in Xen, based on their definitions for other architectures.
> 
> Therefore, {read,write}{b,w,l,q}_cpu() can be used instead of
> {read,write}{b,w,l,q}(), allowing the caller to decide if additional
> fences should be applied before or after {read,write}_atomic().
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>


