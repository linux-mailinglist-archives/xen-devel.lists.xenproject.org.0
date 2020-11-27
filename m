Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D0DD2C6C62
	for <lists+xen-devel@lfdr.de>; Fri, 27 Nov 2020 21:05:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.39744.72743 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kijyf-0000JN-2H; Fri, 27 Nov 2020 20:04:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 39744.72743; Fri, 27 Nov 2020 20:04:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kijye-0000Il-Uo; Fri, 27 Nov 2020 20:04:20 +0000
Received: by outflank-mailman (input) for mailman id 39744;
 Fri, 27 Nov 2020 20:04:19 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JwIZ=FB=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1kijyc-0000Ig-U5
 for xen-devel@lists.xenproject.org; Fri, 27 Nov 2020 20:04:18 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e10e425f-6153-40ea-89d4-4bfb00952b27;
 Fri, 27 Nov 2020 20:04:17 +0000 (UTC)
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
X-Inumbo-ID: e10e425f-6153-40ea-89d4-4bfb00952b27
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1606507457;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=L5JMnt0wjOTycQ8Eb7dBHfgB7Noge5RbaeQUYwGkL+w=;
  b=KoUBnDaxAhMSTtbeyFjP2jWQWYR/ccioIvfbMw6AXsgCGfoH6tLH95f9
   d3a9wgO+YE3mh1ykVOP9C2k1MZR8OCDNY47kXDAwfkd1OTl+s61pLq8F6
   1y0bqfBElSF+VAX7Zvfi5yJE1aACrXvxdyFs5o5dA8etZ15uJhQqY/Igl
   A=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: 8bPTCzUyw4wFCEpehrHObRBOg2Sqq4ds71YZOP4u9DGoE5w6ZZymN9nf8n7Om8Sm+WcsdX0CaM
 rYGa7Xl7NOgMdxKFI7s6PQ8qVdFcV/P6OPg5nhrd0oIUchXdcthaM9zG6rZYW33M6Voq2bg9zi
 3S5EqTyM9h8OgRKDk0vmdHbx3sxyV1sqqWNxGZDvdt21Fnnbs1Sqq+CmWm61Dm1XNiXeqfnVDt
 36RiYaejc7kKOC1+HGTj3e+7kjM6gY3+v8Rq+gJ+QAw50K9Kc6VaByzF3hhft4gneVI32q6m+m
 im0=
X-SBRS: None
X-MesageID: 32065761
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.78,375,1599537600"; 
   d="scan'208";a="32065761"
Subject: Re: [PATCH v4 0/3] xen/arm: Make PCI passthrough code non-x86
 specific
To: Rahul Singh <rahul.singh@arm.com>, <xen-devel@lists.xenproject.org>
CC: <bertrand.marquis@arm.com>, Jan Beulich <jbeulich@suse.com>, Paul Durrant
	<paul@xen.org>, George Dunlap <george.dunlap@citrix.com>, Ian Jackson
	<iwj@xenproject.org>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <cover.1606326929.git.rahul.singh@arm.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <44df65a3-b23d-7dee-e6aa-28101b39ab21@citrix.com>
Date: Fri, 27 Nov 2020 20:04:09 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <cover.1606326929.git.rahul.singh@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 FTLPEX02CL04.citrite.net (10.13.108.177)

On 25/11/2020 18:16, Rahul Singh wrote:
> This patch series is v4 of preparatory work to make PCI passthrough code
> non-x86 specific.
>
> Rahul Singh (3):
>   xen/pci: Move x86 specific code to x86 directory.
>   xen/pci: solve compilation error on ARM with HAS_PCI enabled.
>   ns16550: Gate all PCI code with CONFIG_X86

https://gitlab.com/xen-project/patchew/xen/-/pipelines/222243396

There was an ARM randconfig failure which looks relevant to the content
in this series.

~Andrew (in lieu of a real CI robot).

