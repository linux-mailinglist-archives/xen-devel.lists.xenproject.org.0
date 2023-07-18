Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C531758748
	for <lists+xen-devel@lfdr.de>; Tue, 18 Jul 2023 23:36:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.565504.883698 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLsMH-0004y1-3I; Tue, 18 Jul 2023 21:35:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 565504.883698; Tue, 18 Jul 2023 21:35:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLsMH-0004w0-0A; Tue, 18 Jul 2023 21:35:49 +0000
Received: by outflank-mailman (input) for mailman id 565504;
 Tue, 18 Jul 2023 21:35:47 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qLsMF-0004vq-EY
 for xen-devel@lists.xenproject.org; Tue, 18 Jul 2023 21:35:47 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qLsME-0005OE-9P; Tue, 18 Jul 2023 21:35:46 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qLsME-0000KY-2H; Tue, 18 Jul 2023 21:35:46 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:Subject:
	From:References:Cc:To:MIME-Version:Date:Message-ID;
	bh=R+hM2T1qEn6KAWkJuJMergNd0eKtNWPMRvuIxsIUfpk=; b=LYbZB9Suz1RrCV/avta/d4v6eF
	f9FmYQwzcQCyHumNMd4XY/hU4wPzV+hseK3MnLB/ha7s3RKpgaQrCh+EogdN7TGoBKEgCxSYie1jC
	X3t0bpM1a5GY1lKKjcvEttt5Sduk2eJhk+RcrPMygO+HN5lpOc6aZT9QeuiNwaT5amFM=;
Message-ID: <64ec2fd3-fcec-6ebf-5924-6b591215e19e@xen.org>
Date: Tue, 18 Jul 2023 22:35:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.13.0
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20230710065947.4201-1-jgross@suse.com>
 <20230710065947.4201-19-jgross@suse.com>
From: Julien Grall <julien@xen.org>
Subject: Re: [PATCH v2 18/18] tools/xenstore: add nocopy flag to node read
 functions
In-Reply-To: <20230710065947.4201-19-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Juergen,

On 10/07/2023 07:59, Juergen Gross wrote:
> Today when reading a node from the data base through read_node(), the
> node data is copied in order to avoid modifying the data base when
> preparing a node update, as otherwise an error might result in an
> inconsistent state.
> 
> There are, however, many cases where such a copy operation isn't
> needed, as the node isn't modified.
> 
> Add a "nocopy" flag to read_node() and get_node*() functions for making
> those cases less memory consuming and more performant.

Reducing memory consumption and improving performance is good. However 
you are now relying on the caller to do the right thing when 'nocopy' is 
true. I believe this is a disaster waiting to happen.

So as it stands, I don't support this approach. The solution I have in 
mind would require that 'struct node' is const for the 'nocopy' case. I 
agree this means more work, but that's the price for reduce the the risk 
of corruption.

> 
> Note that there is one modification of the node data left, which is not
> problematic: domain_adjust_node_perms() might set the "ignore" flag of
> a permission. This does no harm, as such an update of the permissions
> doesn't need to be undone in case of a later processing error.
Even if this is the "ignore" flag, this is definitely not an ideal 
situation. And, AFAICT, this is not even document. I don't to be the 
reader trying to figure out why read_node() and db_fetch() returns a 
slightly different node content :).

Cheers,

-- 
Julien Grall

