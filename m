Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 414D73AB41B
	for <lists+xen-devel@lfdr.de>; Thu, 17 Jun 2021 14:55:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.143975.265101 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ltrY8-0004uK-Pf; Thu, 17 Jun 2021 12:55:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 143975.265101; Thu, 17 Jun 2021 12:55:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ltrY8-0004rB-Lz; Thu, 17 Jun 2021 12:55:12 +0000
Received: by outflank-mailman (input) for mailman id 143975;
 Thu, 17 Jun 2021 12:55:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nXfV=LL=ipxe.org=mcb30@srs-us1.protection.inumbo.net>)
 id 1ltrY7-0004r5-H8
 for xen-devel@lists.xenproject.org; Thu, 17 Jun 2021 12:55:11 +0000
Received: from blyat.fensystems.co.uk (unknown
 [2a05:d018:a4d:6403:2dda:8093:274f:d185])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8632a62c-0b59-47a1-a6c8-823fb41cdea7;
 Thu, 17 Jun 2021 12:55:10 +0000 (UTC)
Received: from pudding.home (unknown [213.205.240.250])
 by blyat.fensystems.co.uk (Postfix) with ESMTPSA id 0B10544175;
 Thu, 17 Jun 2021 12:55:06 +0000 (UTC)
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
X-Inumbo-ID: 8632a62c-0b59-47a1-a6c8-823fb41cdea7
Subject: Re: [PATCH v1] tools: ipxe: update for fixing build with GCC11
To: "Bernhard M. Wiedemann" <bwiedemann@suse.de>, Olaf Hering <olaf@aepfle.de>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 xen-devel@lists.xenproject.org, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>
References: <20210615212613.6270-1-olaf@aepfle.de>
 <b78ccdf3-9898-c903-4d9f-4d25bd27182e@citrix.com>
 <20210616145846.305d3ce1.olaf@aepfle.de>
 <fe5ac73a-6026-6db6-6756-911f803adc5f@suse.de>
From: Michael Brown <mcb30@ipxe.org>
Message-ID: <d8a47c67-0ff3-4fce-5fe5-d444c4c4f859@ipxe.org>
Date: Thu, 17 Jun 2021 13:55:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <fe5ac73a-6026-6db6-6756-911f803adc5f@suse.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.9 required=5.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=ham autolearn_force=no version=3.4.2
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on
	blyat.fensystems.co.uk

On 16/06/2021 14:33, Bernhard M. Wiedemann wrote:
> So this means, CentOS7 binutils has
> 9cb80f72d8b from 2011-12-21
> but not
> git blame binutils/objcopy.c|grep enable-determini
> 955d0b3bd75 (Roland McGrath       2013-01-07 17:40:59 +0000  549)   -D
> --enable-deterministic-archives\n\
> 2e30cb575a1 (Cary Coutant         2012-04-25 17:50:14 +0000  555)   -D
> --enable-deterministic-archives\n\
> 
> one way out could be to call objcopy -D $PARAMS || objcopy $PARAMS

Testing on a clean "centos:7" container shows that "objcopy -D" works as 
expected (and "objcopy --help" shows the option as existing).

This container environment has /etc/centos-release showing:

   CentOS Linux release 7.6.1810 (Core)

Could you provide a simple environment in which to reproduce the problem?

Thanks,

Michael

