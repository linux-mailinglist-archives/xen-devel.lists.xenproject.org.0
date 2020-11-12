Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 056EC2B06DB
	for <lists+xen-devel@lfdr.de>; Thu, 12 Nov 2020 14:43:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.25897.53958 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kdCsp-0001GW-DK; Thu, 12 Nov 2020 13:43:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 25897.53958; Thu, 12 Nov 2020 13:43:27 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kdCsp-0001G7-AO; Thu, 12 Nov 2020 13:43:27 +0000
Received: by outflank-mailman (input) for mailman id 25897;
 Thu, 12 Nov 2020 13:43:25 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2UFB=ES=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kdCsn-0001G2-HY
 for xen-devel@lists.xenproject.org; Thu, 12 Nov 2020 13:43:25 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b82396ce-b2ee-49e1-9b2b-69d9369c4f10;
 Thu, 12 Nov 2020 13:43:24 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id DE7FDAC1D;
 Thu, 12 Nov 2020 13:43:23 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=2UFB=ES=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kdCsn-0001G2-HY
	for xen-devel@lists.xenproject.org; Thu, 12 Nov 2020 13:43:25 +0000
X-Inumbo-ID: b82396ce-b2ee-49e1-9b2b-69d9369c4f10
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id b82396ce-b2ee-49e1-9b2b-69d9369c4f10;
	Thu, 12 Nov 2020 13:43:24 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1605188604;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uK18gfZ7Cv4BatXuQtSCa+4tfAYmJ4mvF4Bk1+DC59w=;
	b=kNGAjSM8uF343l01k6tEvPOai9MsOjuRr+JyzD2NKcBgzNJYfBNiDQBKs1OXa+PmQ96RPw
	9K8t76XIqLdJ1u8NHMbXn0X9V3Vw6eSp2bdc14YHNyWY72MhO8E9gJ5se1l6PLoM89s+TS
	e3dXFdZn5D58S0TeDOSz0dFQl5KDNtk=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id DE7FDAC1D;
	Thu, 12 Nov 2020 13:43:23 +0000 (UTC)
Subject: Re: [PATCH v5 2/3] xen/oprofile: use NMI continuation for sending
 virq to guest
To: Juergen Gross <jgross@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20201112131424.9930-1-jgross@suse.com>
 <20201112131424.9930-3-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <c03669ae-e09f-681b-c98b-5719932033cd@suse.com>
Date: Thu, 12 Nov 2020 14:43:24 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.1
MIME-Version: 1.0
In-Reply-To: <20201112131424.9930-3-jgross@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 12.11.2020 14:14, Juergen Gross wrote:
> Instead of calling send_guest_vcpu_virq() from NMI context use the
> NMI continuation framework for that purpose. This avoids taking locks
> in NMI mode.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

