Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 953B7B31796
	for <lists+xen-devel@lfdr.de>; Fri, 22 Aug 2025 14:23:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1090066.1447458 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1upQmb-0002tH-S2; Fri, 22 Aug 2025 12:22:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1090066.1447458; Fri, 22 Aug 2025 12:22:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1upQmb-0002qu-Os; Fri, 22 Aug 2025 12:22:13 +0000
Received: by outflank-mailman (input) for mailman id 1090066;
 Fri, 22 Aug 2025 12:22:12 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <anthony@xenproject.org>) id 1upQma-0002qo-LG
 for xen-devel@lists.xenproject.org; Fri, 22 Aug 2025 12:22:12 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1upQmZ-000oxu-1N;
 Fri, 22 Aug 2025 12:22:11 +0000
Received: from [2a01:e0a:1da:8420:b77:bd5:6e45:7633] (helo=l14)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1upQmZ-00D6JL-0v;
 Fri, 22 Aug 2025 12:22:11 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date;
	bh=8wuPx5Qw/cyIUtaM2qPZB2MB2LgK3trRCo6qorCBDQ8=; b=eNy+Ukj7yfIxy/NIh74/I5NaD9
	KSeXhphkfT0xHCN/A2tpoK5zjJoTkJUOIJiKanSly7iagsbygpMhWRiKW2TED/+FlIPGcb4WIZ4C5
	7qcY5M4S0Q/h6i5CQ9HfRD19/FbK7W652ctzQtFd8+WJN0E9vbib1FsoNEyjZC1PuZ7Q=;
Date: Fri, 22 Aug 2025 14:22:09 +0200
From: Anthony PERARD <anthony@xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?iso-8859-1?Q?J=FCrgen_Gro=DF?= <jgross@suse.com>,
	xen-devel@lists.xenproject.org,
	Anthony PERARD <anthony.perard@vates.tech>
Subject: Re: [PATCH] tools/xl: hide xenstore-features behind option
Message-ID: <aKhg8YASgyFQS9g5@l14>
References: <20250815143236.27641-1-jgross@suse.com>
 <3ef1fc73-601c-4de0-b94e-bbf9cc27d081@citrix.com>
 <1704c30a-49fc-49fd-bb2f-a90f7f834761@suse.com>
 <70779bfb-f65e-41c3-abe3-09ef7b13d758@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <70779bfb-f65e-41c3-abe3-09ef7b13d758@citrix.com>

On Fri, Aug 15, 2025 at 03:40:28PM +0100, Andrew Cooper wrote:
> On 15/08/2025 3:39 pm, Jürgen Groß wrote:
> > On 15.08.25 16:36, Andrew Cooper wrote:
> >> On 15/08/2025 3:32 pm, Juergen Gross wrote:
> >>> In order to be able to use "xl info" before Xenstore has been started
> >>> or after it has crashed, hide obtaining the available Xenstore features
> >>> behind the new option "-x".
> >>>
> >>> Fixes: ecce7970cfe7 ("tools/xl: add available Xenstore features to
> >>> xl info output")
> >>> Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
> >>> Signed-off-by: Juergen Gross <jgross@suse.com>
> >>
> >> Probably ought to be Reported-by Ross Lagerwall.  He did all the hard
> >> work debugging this; I just insisted that the conversation move onto
> >> Matrix.
> >>
> >> For the change itself, Reviewed-by: Andrew Cooper
> >> <andrew.cooper3@citrix.com>
> >
> > Thanks.
> >
> > Should I send V2 with the "Reported-by" corrected, or can this be done
> > when committing?
> 
> Happy to fix on commit.

Acked-by: Anthony PERARD <anthony.perard@vates.tech>

Thanks,

-- 
Anthony PERARD

