Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F0B532146EC
	for <lists+xen-devel@lfdr.de>; Sat,  4 Jul 2020 17:33:50 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jrkAd-0001Sd-Vd; Sat, 04 Jul 2020 15:33:39 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=CRhY=AP=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jrkAc-0001SY-MA
 for xen-devel@lists.xenproject.org; Sat, 04 Jul 2020 15:33:38 +0000
X-Inumbo-ID: bb08a6ee-be0b-11ea-b7bb-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id bb08a6ee-be0b-11ea-b7bb-bc764e2007e4;
 Sat, 04 Jul 2020 15:33:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=52tfAKuP79r/HTo90iVbkMWNl79hm+RYb6LyoVA5E18=; b=q6wkeMyhzSu4qtuatDcWBUZoTl
 eVMQQrPZz3renhbOBkQZtVR8tZRnhg97brXyru2hbFSQu4OLUTQtpWKvQJDXDTdXhCNOaBYZdIAHR
 SCmF0FoRnLQtmQZg0r3j1bvbeW5II1hQ4q1DJQdByfjaQBh7Z/8vFiCL340OJwVAlG2I=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jrkAb-0006vc-SP; Sat, 04 Jul 2020 15:33:37 +0000
Received: from 54-240-197-236.amazon.com ([54.240.197.236]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jrkAb-0005yJ-Mn; Sat, 04 Jul 2020 15:33:37 +0000
Subject: =?UTF-8?B?UmU6IOWbnuWkje+8miBbWGVuIEFSTTY0XSBTYXZlIGNvcmVkdW1wIGxv?=
 =?UTF-8?Q?g_when_xen/dom0_crash_on_ARM64=3f?=
To: jinchen <jinchen1227@qq.com>, xen-devel <xen-devel@lists.xenproject.org>
References: <tencent_C1F76837DF25C430969ABF6E4A557260AA0A@qq.com>
From: Julien Grall <julien@xen.org>
Message-ID: <2370c2cc-307c-831c-cfab-0a41412b3e1e@xen.org>
Date: Sat, 4 Jul 2020 16:33:36 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <tencent_C1F76837DF25C430969ABF6E4A557260AA0A@qq.com>
Content-Type: text/plain; charset=gb18030; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi,

On 03/07/2020 07:02, jinchen wrote:
> Thank you for your reply!
> 
> On 02/07/2020 02:41, jinchen wrote:
>  >> Hello xen experts:
>  >>
>  >> Is there any way to save xen and dom0 core dump log when xen or dom0
>  >> crash on ARM64 platform?
> 
>  >Usually all the crash stack trace (Xen and Dom0) should be output on the
>  >Xen Console.
> 
> But if I don't connect a debug serial and want to check the dump error 
> after reboot?
If you don't have debug serial always connected, then it will not get 
the logs.

> 
>  >>      I find that the kdump seems can't run on ARM64 platform?
> 
>  >We don't have support for kdump/kexec on Arm in Xen yet.
> 
> I find the kdump seems the appropriate way to do this, but it doesn't 
> support xen arm64.
> 
>  >>      Are there any patches or other way to achive this goal?
> 
>  >I am not aware of any patches, but they would be welcomed.
> 
>  >For other way, it depends what exactly you expect. Do you need more than
>  >the stack trace?
> 
> The stack trace will be ok, if other infomantion can be save will be 
> better (like memory/vcpu/domain, etc.)

Kexec is probably the way to go. I would be happy to review the patches 
for Xen upstream if you are up to provide an implementation.

Cheers,

-- 
Julien Grall

