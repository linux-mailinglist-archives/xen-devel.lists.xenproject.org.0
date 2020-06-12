Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AE30E1F75DD
	for <lists+xen-devel@lfdr.de>; Fri, 12 Jun 2020 11:24:04 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jjfub-00056q-Be; Fri, 12 Jun 2020 09:23:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Kdnc=7Z=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jjfua-00056l-Ep
 for xen-devel@lists.xenproject.org; Fri, 12 Jun 2020 09:23:44 +0000
X-Inumbo-ID: 694c4bc8-ac8e-11ea-b7bb-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 694c4bc8-ac8e-11ea-b7bb-bc764e2007e4;
 Fri, 12 Jun 2020 09:23:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=uvZCzwaqZgPntnmUnlhdv8YsVulwsIzCx9fgPNtiPZc=; b=BsjCPgKsurIfejLFhqsGviNsvN
 h9waYojxxCmbRhYANy4yYq9SafXa6HZVoYoL3vzNGv2RGYYLi555F5ZTfQrINaYHBb6dIbkhyPYdf
 1ZNL78bYZHXni7XAyLevvamfNVfKr2KeVoFVtA+K5X8p8fXHsmc9elbo5rVX5k4XEWO4=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jjfuY-0005fH-8A; Fri, 12 Jun 2020 09:23:42 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jjfuY-0003Kv-0Y; Fri, 12 Jun 2020 09:23:42 +0000
Subject: Re: Kexec and libxenctlr.so
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
 Julien Grall <jgrall@amazon.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Anthony Perard <anthony.perard@citrix.com>, "wl@xen.org" <wl@xen.org>,
 daniel.kiper@oracle.com
References: <7a88218d-981e-6583-15a5-3fcaffb05294@amazon.com>
 <261293b1-f4c9-e41d-0c76-cd47fe5c0dc2@suse.com>
 <5602eebf-c149-17f7-37c9-b263ff290509@xen.org>
 <ffd017a7-8278-85ee-81fa-9dad147eb0e5@suse.com>
 <6fa3067c-2c71-bb8e-eab8-30f44782d002@xen.org>
 <6c662ac7-ee10-1ac1-5b9f-df9a02d00d5c@suse.com>
 <ae721247-ef18-b044-7a5b-fba6313d5f99@xen.org>
 <ae231e90-46da-31f3-81cb-560b92211022@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <659d1348-56d9-0de7-960f-212a39596302@xen.org>
Date: Fri, 12 Jun 2020 10:23:39 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <ae231e90-46da-31f3-81cb-560b92211022@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
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
Cc: "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 "ian.jackson@eu.citrix.com" <ian.jackson@eu.citrix.com>,
 "paul@xen.org" <paul@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>



On 12/06/2020 10:18, Jürgen Groß wrote:
> I just wanted to point out that in case you need a new stable interface
> between kexec and the hypervisor you could consider using hypfs for that
> purpose instead of introducing a new hypercall.

I am not looking to introduce a new interface with the hypervisor. 
Instead I am looking to have a stable library that can be used by Kexec.

The underlying communication with the hypervisor doesn't need to be stable.

Cheers,

-- 
Julien Grall

