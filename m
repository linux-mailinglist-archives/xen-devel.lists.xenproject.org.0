Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 63839262EA5
	for <lists+xen-devel@lfdr.de>; Wed,  9 Sep 2020 14:43:36 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kFzRX-0001hM-IN; Wed, 09 Sep 2020 12:43:19 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=uggq=CS=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1kFzRV-0001hH-L7
 for xen-devel@lists.xenproject.org; Wed, 09 Sep 2020 12:43:17 +0000
X-Inumbo-ID: 17492840-0b2a-4e31-bef3-014b7d28c3c2
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 17492840-0b2a-4e31-bef3-014b7d28c3c2;
 Wed, 09 Sep 2020 12:43:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
 bh=XzC+A47GwdEpqmRrdh7v8HbkVIJ0ZaLc7R844Dp5/oE=; b=rfPRvUa2DbANZx1w60YwWJ90Pm
 BBntN56XHq0n9yeWmmTs+aLbtaZ5o1hCABWIkKGxroNR5MY8Q1SFHKmqxb/wR7uhYOT2WxGMWlJPE
 riHvIdT4o9PTXmk1aZpCYWFn1G6VvduYexRU2YPrKWbt80fwV5mLpmbiixUBr1omkB3s=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kFzRQ-00082m-IW; Wed, 09 Sep 2020 12:43:12 +0000
Received: from 54-240-197-233.amazon.com ([54.240.197.233]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kFzRQ-00077T-9P; Wed, 09 Sep 2020 12:43:12 +0000
Subject: Re: [PATCH v1] docs: remove bridge-utils from requirements
To: Olaf Hering <olaf@aepfle.de>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Jan Beulich <jbeulich@suse.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <20200909104849.22700-1-olaf@aepfle.de>
From: Julien Grall <julien@xen.org>
Message-ID: <8240eea7-4822-f8f9-75ee-5ea7c2e85630@xen.org>
Date: Wed, 9 Sep 2020 13:43:10 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200909104849.22700-1-olaf@aepfle.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
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

On 09/09/2020 11:48, Olaf Hering wrote:
> Having the latest Xen, but an obsolete iproute package, is an unusual
> combination.

The README suggests that bridge-utils is required for /sbin/brctl. On 
Debian bullseyes:

42sh> sudo apt-file search brctl
bash-completion: /usr/share/bash-completion/completions/brctl
bridge-utils: /sbin/brctl
bridge-utils: /usr/share/man/man8/brctl.8.gz
python3-networking-mlnx: /usr/bin/ebrctl
python3-networking-mlnx: 
/usr/lib/python3/dist-packages/networking_mlnx/eswitchd/cli/ebrctl.py
zsh-common: /usr/share/zsh/functions/Completion/Linux/_brctl

A grep in the tools directory seems to list some uf ose brctl in the 
hotplug scripts. So can you expand how this is an unusual combination?

Cheers,

-- 
Julien Grall

