Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ECDF31A095A
	for <lists+xen-devel@lfdr.de>; Tue,  7 Apr 2020 10:29:56 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jLjcA-0003as-Fm; Tue, 07 Apr 2020 08:29:46 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=71dA=5X=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jLjc8-0003an-J5
 for xen-devel@lists.xenproject.org; Tue, 07 Apr 2020 08:29:44 +0000
X-Inumbo-ID: eea01246-78a9-11ea-83d8-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id eea01246-78a9-11ea-83d8-bc764e2007e4;
 Tue, 07 Apr 2020 08:29:44 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 75CD2ABE2;
 Tue,  7 Apr 2020 08:29:42 +0000 (UTC)
Subject: Re: [XEN PATCH] hvmloader: Enable MMIO and I/O decode, after all
 resource allocation
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <f7b9e16e394e7e94700ed690f0c9fbd7ce7b5c74.1586195196.git.havanur@amazon.com>
 <001501d60cb0$f60e0660$e22a1320$@xen.org>
 <20200407080651.GZ28601@Air-de-Roger>
 <001801d60cb4$9ed4c880$dc7e5980$@xen.org>
 <20200407082501.GA28601@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <eb510436-21dd-1dce-8a25-815884c75b18@suse.com>
Date: Tue, 7 Apr 2020 10:29:38 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200407082501.GA28601@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: 'Wei Liu' <wl@xen.org>, paul@xen.org,
 'Andrew Cooper' <andrew.cooper3@citrix.com>,
 'Ian Jackson' <ian.jackson@eu.citrix.com>,
 'Harsha Shamsundara Havanur' <havanur@amazon.com>,
 xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 07.04.2020 10:25, Roger Pau Monné wrote:
> IMO forcefully disabling decodings (and enabling them afterwards if
> already enabled) and leaving bus mastering as-is would be better.

Limiting this to the "already enabled" case may not be enough:
Devices needed for guest booting may need them to be enabled
even if prior to BAR assignment they were turned off. That's
what a BIOS would typically do, too. I've seen quite a few
BIOS setups actually where one could chose whether the BIOS
would do so just for what it recognized as boot devices, or
for all of them.

Jan

