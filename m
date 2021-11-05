Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A8C04464AA
	for <lists+xen-devel@lfdr.de>; Fri,  5 Nov 2021 15:11:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.222402.384569 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mizwE-0004G8-OA; Fri, 05 Nov 2021 14:11:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 222402.384569; Fri, 05 Nov 2021 14:11:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mizwE-0004EJ-K5; Fri, 05 Nov 2021 14:11:26 +0000
Received: by outflank-mailman (input) for mailman id 222402;
 Fri, 05 Nov 2021 14:11:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UJNx=PY=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1mizwC-0004EB-R1
 for xen-devel@lists.xenproject.org; Fri, 05 Nov 2021 14:11:25 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 40a9bc76-3e42-11ec-a9d2-d9f7a1cc8784;
 Fri, 05 Nov 2021 15:11:23 +0100 (CET)
Received: from [172.20.51.40] (50.216.66.194 [50.216.66.194]) by
 mx.zohomail.com with SMTPS id 1636121476377792.0721610260464;
 Fri, 5 Nov 2021 07:11:16 -0700 (PDT)
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
X-Inumbo-ID: 40a9bc76-3e42-11ec-a9d2-d9f7a1cc8784
ARC-Seal: i=1; a=rsa-sha256; t=1636121480; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=c2IDRfn5CUF8QQMG3JO5C9O1JZ5yN3ExQaqbLCTCCrWer+YMj1D/FDX0HfvP9LMo6+sZ6PMVnD9ErYniOhYtLh3+uW/Re7A+HQHYEIkhDivlMEy7FGzh9TLxW6ULQfkE9fS7SQDuyc9T7Lt0tiSrteyF5w6NCZKaZ3y+GzScKyA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1636121480; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=rfUbYO0yhwfzz0H0V1T3veDUs7oHHuqMmGxL+oZifDM=; 
	b=SmRphK0CTOzpLxRv5V2itr6LDuYKtrTt9zyuHWaFifb4RWT7nyidC2tUeD+wWbKNkvPZDpmu2DMAjaD3MgYY7f3/ark4b9BoFW0u6znwl0+qc8vhCHCXd+KdiDjKnChp9/AMQvuCEYTvjC0qmOWMGjojFkgxGGGmn2O8XySdTdM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1636121480;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=rfUbYO0yhwfzz0H0V1T3veDUs7oHHuqMmGxL+oZifDM=;
	b=LfDxL4HhlvoeQFy11ObGjl9dGd3glpp8+y6YZr8wCW1mWOJe8Tk8WtGIyGHcY4zi
	jIgTAnOyeD1lqfRBL9i/iqNQQVvi+L0S/N5mBaoWyj1lfu/28f/MQm69sRK5Yw6lDFo
	4IT+xZzueKJDDC9ZqGCRiSqSvsWUA+aZZT3WKm14=
Subject: Re: [PATCH 1/5] x86/altcall: allow compound types to be passed
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <jbeulich@suse.com>, Daniel De Graaf <dgdegra@tycho.nsa.gov>
References: <20211105135555.24261-1-andrew.cooper3@citrix.com>
 <20211105135555.24261-2-andrew.cooper3@citrix.com>
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Message-ID: <7353d569-5baf-1ecb-3fcd-31a3b4f5874a@apertussolutions.com>
Date: Fri, 5 Nov 2021 10:09:05 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211105135555.24261-2-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External


On 11/5/21 9:55 AM, Andrew Cooper wrote:
> From: Jan Beulich <jbeulich@suse.com>
> 
> Replace the conditional operator in ALT_CALL_ARG(), which was intended
> to limit usable types to scalar ones, by a size check. Some restriction
> here is necessary to make sure we don't violate the ABI's calling
> conventions, but limiting to scalar types was both too restrictive
> (disallowing e.g. guest handles) and too permissive (allowing e.g.
> __int128_t).
> 
> Note that there was some anomaly with that conditional operator anyway:
> Something - I don't recall what - made it impossible to omit the middle
> operand.
> 
> Code-generation-wise this has the effect of removing certain zero- or
> sign-extending in some altcall invocations. This ought to be fine as the
> ABI doesn't require sub-sizeof(int) values to be extended, except when
> passed through an ellipsis. No functions subject to altcall patching has
> a variable number of arguments, though.
> 
> Requested-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>
> 

Reviewed-by: Daniel P. Smith <dpsmith@apertussolutions.com>

