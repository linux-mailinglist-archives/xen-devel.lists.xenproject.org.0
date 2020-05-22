Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7757E1DE807
	for <lists+xen-devel@lfdr.de>; Fri, 22 May 2020 15:28:44 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jc7iQ-0004mI-CZ; Fri, 22 May 2020 13:27:58 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hXvX=7E=hermes.cam.ac.uk=amc96@srs-us1.protection.inumbo.net>)
 id 1jc7iP-0004mD-PH
 for xen-devel@lists.xenproject.org; Fri, 22 May 2020 13:27:57 +0000
X-Inumbo-ID: 0c3298d4-9c30-11ea-b9cf-bc764e2007e4
Received: from ppsw-31.csi.cam.ac.uk (unknown [131.111.8.131])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0c3298d4-9c30-11ea-b9cf-bc764e2007e4;
 Fri, 22 May 2020 13:27:57 +0000 (UTC)
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: http://help.uis.cam.ac.uk/email-scanner-virus
Received: from 88-109-182-220.dynamic.dsl.as9105.com ([88.109.182.220]:43970
 helo=[192.168.1.219])
 by ppsw-31.csi.cam.ac.uk (smtp.hermes.cam.ac.uk [131.111.8.157]:465)
 with esmtpsa (PLAIN:amc96) (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
 id 1jc7iM-000sCb-M2 (Exim 4.92.3)
 (return-path <amc96@hermes.cam.ac.uk>); Fri, 22 May 2020 14:27:54 +0100
Subject: Re: [PATCH v3 1/3] x86: relax GDT check in arch_set_info_guest()
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <cbed3c45-3685-4bce-9719-93b1e8a2599a@suse.com>
 <acbaead9-0f6c-3606-e809-57dafe9b3f01@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <58510f15-68d6-c773-5166-a38c72573442@citrix.com>
Date: Fri, 22 May 2020 14:27:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <acbaead9-0f6c-3606-e809-57dafe9b3f01@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
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
Cc: Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 20/05/2020 08:53, Jan Beulich wrote:
> It is wrong for us to check frames beyond the guest specified limit
> (in the compat case another loop bound is already correct).
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

I'm still not overly convinced this is a good idea, because all it will
allow people to do is write lazy code which breaks on older Xen.

However, if you still insist, Acked-by: Andrew Cooper
<andrew.cooper3@citrix.com>

