Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2278877D62C
	for <lists+xen-devel@lfdr.de>; Wed, 16 Aug 2023 00:33:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.584132.914580 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qW2bP-0004wz-Vl; Tue, 15 Aug 2023 22:33:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 584132.914580; Tue, 15 Aug 2023 22:33:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qW2bP-0004ui-Sr; Tue, 15 Aug 2023 22:33:27 +0000
Received: by outflank-mailman (input) for mailman id 584132;
 Tue, 15 Aug 2023 22:33:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BVlh=EA=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1qW2bO-0004uc-Gl
 for xen-devel@lists.xenproject.org; Tue, 15 Aug 2023 22:33:26 +0000
Received: from sender4-of-o50.zoho.com (sender4-of-o50.zoho.com
 [136.143.188.50]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bd88e7ac-3bbb-11ee-8776-cb3800f73035;
 Wed, 16 Aug 2023 00:33:24 +0200 (CEST)
Received: from [10.10.1.156] (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 1692138795951979.2977584258178;
 Tue, 15 Aug 2023 15:33:15 -0700 (PDT)
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
X-Inumbo-ID: bd88e7ac-3bbb-11ee-8776-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; t=1692138797; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=RcvOepF6WnO8b/YQwZZ/vC65kMhsn/utoB7mqf6/1T0gpIxxE0Fdo6IYVwOVH647fU4Z9N9YRSO0YscjkcuOEkHAWrWQdtLIC8SkGuIUr2QUmKBYdJOFSg964dR7L2RKNp0qzHZjYcDW81kVlWbCnTIlE+ChLTuLyfgjiYyCHrk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1692138797; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=4xald0xPMGPETqWp1nQJL/Gvd9PW6x/W6zZzCVPaYT4=; 
	b=A95z30PZAeW6KHxRn92eTV4X8ghsAFTm+jk8/NHuUQHfw4Ls4xnqX7yniv0BQlx+ghLIlllNKjyygMAo+UAMquNGtggfDElT3BNQCN9nX3JuwBmjxVzfggboTOA9LjdwKQ1sDzVLnvPzeVR7rc4JCH81gxov7jRncHJqu8qr4yg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1692138797;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=4xald0xPMGPETqWp1nQJL/Gvd9PW6x/W6zZzCVPaYT4=;
	b=vCHD2QKmcbJN674y+Hy1jB7nKZyR7F6q2stK3v/S32ekaPJBr1qfE9VeAwi+F337
	Ymb9h8R/rdNkOyDpc6rmRFuWnwNkBUWR2CQHDjYFNud/IpayhtG2Is6u9R/6QWifVcS
	8i4PmC8BMzV5NjibwZXX+Xx9Rj/KEiTM+jwsW3cw=
Message-ID: <ac0488ca-2cab-b9f9-0e93-6fd22176c3ce@apertussolutions.com>
Date: Tue, 15 Aug 2023 18:33:13 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v3 04/10] xen/version: Misc style fixes
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <jbeulich@suse.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Julien Grall <julien@xen.org>, Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 Jason Andryuk <jandryuk@gmail.com>, Henry Wang <Henry.Wang@arm.com>
References: <20230815210650.2735671-1-andrew.cooper3@citrix.com>
 <20230815210650.2735671-5-andrew.cooper3@citrix.com>
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
In-Reply-To: <20230815210650.2735671-5-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

On 8/15/23 17:06, Andrew Cooper wrote:
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Acked-by: Jan Beulich <jbeulich@suse.com>
Reviewed-by: Daniel P. Smith <dpsmith@apertussolutions.com>

