Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 984873AB527
	for <lists+xen-devel@lfdr.de>; Thu, 17 Jun 2021 15:48:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.143998.265137 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ltsMU-0002bK-FB; Thu, 17 Jun 2021 13:47:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 143998.265137; Thu, 17 Jun 2021 13:47:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ltsMU-0002YN-Bx; Thu, 17 Jun 2021 13:47:14 +0000
Received: by outflank-mailman (input) for mailman id 143998;
 Thu, 17 Jun 2021 13:47:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nXfV=LL=ipxe.org=mcb30@srs-us1.protection.inumbo.net>)
 id 1ltsMS-0002YH-LP
 for xen-devel@lists.xenproject.org; Thu, 17 Jun 2021 13:47:12 +0000
Received: from blyat.fensystems.co.uk (unknown
 [2a05:d018:a4d:6403:2dda:8093:274f:d185])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fa25186d-082c-439d-88c9-47cce3c3273e;
 Thu, 17 Jun 2021 13:47:10 +0000 (UTC)
Received: from pudding.home (unknown [213.205.240.250])
 by blyat.fensystems.co.uk (Postfix) with ESMTPSA id 7D9F644193;
 Thu, 17 Jun 2021 13:47:07 +0000 (UTC)
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
X-Inumbo-ID: fa25186d-082c-439d-88c9-47cce3c3273e
Subject: Re: [PATCH v1] tools: ipxe: update for fixing build with GCC11
From: Michael Brown <mcb30@ipxe.org>
To: "Bernhard M. Wiedemann" <bwiedemann@suse.de>, Olaf Hering <olaf@aepfle.de>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 xen-devel@lists.xenproject.org, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>
References: <20210615212613.6270-1-olaf@aepfle.de>
 <b78ccdf3-9898-c903-4d9f-4d25bd27182e@citrix.com>
 <20210616145846.305d3ce1.olaf@aepfle.de>
 <fe5ac73a-6026-6db6-6756-911f803adc5f@suse.de>
 <d8a47c67-0ff3-4fce-5fe5-d444c4c4f859@ipxe.org>
Message-ID: <ff98e992-16cb-f4f7-d3ab-5adfcd215b7a@ipxe.org>
Date: Thu, 17 Jun 2021 14:47:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <d8a47c67-0ff3-4fce-5fe5-d444c4c4f859@ipxe.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.9 required=5.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=ham autolearn_force=no version=3.4.2
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on
	blyat.fensystems.co.uk

On 17/06/2021 13:55, Michael Brown wrote:
>> one way out could be to call objcopy -D $PARAMS || objcopy $PARAMS
> 
> Testing on a clean "centos:7" container shows that "objcopy -D" works as 
> expected (and "objcopy --help" shows the option as existing).
> 
> This container environment has /etc/centos-release showing:
> 
>    CentOS Linux release 7.6.1810 (Core)
> 
> Could you provide a simple environment in which to reproduce the problem?

I've managed to reproduce it using "centos:7.0.1406".  It should be 
fixed in commit

   https://github.com/ipxe/ipxe/commit/51c88a4a6

Thanks for the report!

Michael

