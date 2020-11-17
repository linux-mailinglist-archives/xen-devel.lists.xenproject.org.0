Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F2D6B2B5AC6
	for <lists+xen-devel@lfdr.de>; Tue, 17 Nov 2020 09:12:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.28757.57862 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kew66-0004qR-6X; Tue, 17 Nov 2020 08:12:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 28757.57862; Tue, 17 Nov 2020 08:12:18 +0000
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
	id 1kew66-0004q2-31; Tue, 17 Nov 2020 08:12:18 +0000
Received: by outflank-mailman (input) for mailman id 28757;
 Tue, 17 Nov 2020 08:12:16 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+6JM=EX=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kew64-0004px-Gf
 for xen-devel@lists.xenproject.org; Tue, 17 Nov 2020 08:12:16 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 026c294e-1185-40e7-9194-664038b8a5a3;
 Tue, 17 Nov 2020 08:12:15 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 623CBAD2D;
 Tue, 17 Nov 2020 08:12:14 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=+6JM=EX=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kew64-0004px-Gf
	for xen-devel@lists.xenproject.org; Tue, 17 Nov 2020 08:12:16 +0000
X-Inumbo-ID: 026c294e-1185-40e7-9194-664038b8a5a3
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 026c294e-1185-40e7-9194-664038b8a5a3;
	Tue, 17 Nov 2020 08:12:15 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1605600734; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=g8SCEM3AchjQG8YOYHO0TBbekwafiQ6MQ8X2JLbb9IQ=;
	b=NNjMJ29m6Ope1R+lXw2SeDhhr5z4scO2wJ+SrWsAMyfHgmnVP0rMuRjJbBT+RI2jTXWakP
	XNMsKi/VMQY/H36b2mRy5AB8xVDCKsGjq4PU/sH3q6rhQE2JhzR2U3XBj0eYutNnDZZbkz
	UHFpgR1mgK1k0FUJItBJ0onkSzp79z8=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 623CBAD2D;
	Tue, 17 Nov 2020 08:12:14 +0000 (UTC)
Subject: Re: XSA-351 causing Solaris-11 systems to panic during boot.
To: Cheyenne Wills <cheyenne.wills@gmail.com>
References: <CAHpsFVc4AAm6L0rKUuV47ydOjtw7XAgFnDZxRjdCL0OHXJERDw@mail.gmail.com>
Cc: xen-devel@lists.xenproject.org
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <7bca24cb-a3af-b54d-b224-3c2a316859dd@suse.com>
Date: Tue, 17 Nov 2020 09:12:10 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.3
MIME-Version: 1.0
In-Reply-To: <CAHpsFVc4AAm6L0rKUuV47ydOjtw7XAgFnDZxRjdCL0OHXJERDw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 16.11.2020 22:57, Cheyenne Wills wrote:
> Running Xen with XSA-351 is causing Solaris 11 systems to panic during
> boot.  The panic screen is showing the failure to be coming from
> "unix:rdmsr".  The panic occurs with existing guests (booting off a disk)
> and the  booting from an install ISO image.
> 
> I discussed the problem with "andyhhp__" in the "#xen" IRC channel and he
> requested that I report it here.

Thanks. What we need though is information on the specific MSR(s) that
will need to have workarounds added: We surely would want to avoid
blindly doing this for all that the XSA change disallowed access to.
Reproducing the panic screen here might already help; proper full logs
would be even better.

Jan

