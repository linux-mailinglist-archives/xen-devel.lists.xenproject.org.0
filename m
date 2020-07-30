Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 74630233973
	for <lists+xen-devel@lfdr.de>; Thu, 30 Jul 2020 22:01:41 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k1EjT-0005x0-AZ; Thu, 30 Jul 2020 20:00:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=IK5u=BJ=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1k1EjS-0005wu-2y
 for xen-devel@lists.xenproject.org; Thu, 30 Jul 2020 20:00:50 +0000
X-Inumbo-ID: 5c86ad53-d29f-11ea-8dc7-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5c86ad53-d29f-11ea-8dc7-bc764e2007e4;
 Thu, 30 Jul 2020 20:00:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=XOqBVUmSR6XbSqoKdv8Ee7IMVjkKW34Rs6RR9l/DbA0=; b=ASlhrZb4/vPTrI14J0edpJ4rPN
 gQupt3Wm6+qomnQ8/T36AAYCfR9H09QDwkS3v68uHdJgqBiTdhrcNyJW3lOwMOaqwmag/RdpwnbS2
 vmqCQK/6qgmIsx9wnV99JKc1cLYRNMaK7DieTVHzfi0nQgpqUIyjo57yKiigaawxOXOE=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1k1EjL-0001fi-E3; Thu, 30 Jul 2020 20:00:43 +0000
Received: from 54-240-197-226.amazon.com ([54.240.197.226]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1k1EjL-0004yG-5k; Thu, 30 Jul 2020 20:00:43 +0000
Subject: Re: [PATCH 4/5] xen/memory: Fix acquire_resource size semantics
To: Andrew Cooper <andrew.cooper3@citrix.com>, paul@xen.org,
 'Xen-devel' <xen-devel@lists.xenproject.org>
References: <20200728113712.22966-1-andrew.cooper3@citrix.com>
 <20200728113712.22966-5-andrew.cooper3@citrix.com>
 <002b01d6664b$c7eb5f40$57c21dc0$@xen.org>
 <474ff131-83d8-deff-4e3a-32392ea092b3@citrix.com>
From: Julien Grall <julien@xen.org>
Message-ID: <5c7d67c3-4731-caf0-cbe5-3849cd07bf98@xen.org>
Date: Thu, 30 Jul 2020 21:00:40 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <474ff131-83d8-deff-4e3a-32392ea092b3@citrix.com>
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
Cc: 'Stefano Stabellini' <sstabellini@kernel.org>,
 'Hubert Jasudowicz' <hubert.jasudowicz@cert.pl>, 'Wei Liu' <wl@xen.org>,
 'Konrad Rzeszutek Wilk' <konrad.wilk@oracle.com>,
 'George Dunlap' <George.Dunlap@eu.citrix.com>,
 =?UTF-8?B?J01pY2hhxYIgTGVzemN6ecWEc2tpJw==?= <michal.leszczynski@cert.pl>,
 'Jan Beulich' <JBeulich@suse.com>, 'Ian Jackson' <ian.jackson@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi Andrew,

On 30/07/2020 20:46, Andrew Cooper wrote:
> On 30/07/2020 09:31, Paul Durrant wrote:
> In between these two hypercalls from the utility, the guest can do a
> v1=>v2 or v2=>v1 switch and make the resource spontaneously appear or
> disappear.

This can only happen on platform where grant-table v2 is enabled. Where 
this is not enabled (e.g Arm), then I think we want to return 0 as there 
is nothing to map.

Cheers,

-- 
Julien Grall

