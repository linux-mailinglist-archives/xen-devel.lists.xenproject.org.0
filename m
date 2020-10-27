Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A4A9929A95B
	for <lists+xen-devel@lfdr.de>; Tue, 27 Oct 2020 11:18:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.12744.33021 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kXM3h-0006xY-RI; Tue, 27 Oct 2020 10:18:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 12744.33021; Tue, 27 Oct 2020 10:18:29 +0000
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
	id 1kXM3h-0006x9-Na; Tue, 27 Oct 2020 10:18:29 +0000
Received: by outflank-mailman (input) for mailman id 12744;
 Tue, 27 Oct 2020 10:18:28 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aH5n=EC=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kXM3g-0006wQ-9q
 for xen-devel@lists.xenproject.org; Tue, 27 Oct 2020 10:18:28 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id db142a89-cd33-4480-962a-ee65fbfe4c82;
 Tue, 27 Oct 2020 10:18:26 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 13D63AD21;
 Tue, 27 Oct 2020 10:18:26 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=aH5n=EC=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kXM3g-0006wQ-9q
	for xen-devel@lists.xenproject.org; Tue, 27 Oct 2020 10:18:28 +0000
X-Inumbo-ID: db142a89-cd33-4480-962a-ee65fbfe4c82
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id db142a89-cd33-4480-962a-ee65fbfe4c82;
	Tue, 27 Oct 2020 10:18:26 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1603793906;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FBDlXNcbk66/HGikRnlnbPAO0NKwpzbMr56EI5mizNE=;
	b=nlewcj8gpXe9mhik9uvAKoKINZjaDGhMSTTKAaoEE0cci6/kUfP0bYx0Uc1EtnOdxuqgbR
	JAR/gjwbmUe4wMd1BuM3yhHOzB3fXt4b2boMMYEUAzSVe1wG/OeIbmZNM3v7Jo4a6l29fy
	QTqMl56iwijPPGqime2Kw9A0wVmOQjY=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 13D63AD21;
	Tue, 27 Oct 2020 10:18:26 +0000 (UTC)
Subject: Re: flawed Makefile dependencies in libacpi
To: Olaf Hering <olaf@aepfle.de>
References: <20201027104548.5823c554.olaf@aepfle.de>
Cc: xen-devel@lists.xenproject.org
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <d6e3a7b0-129e-9b47-8802-b71eb8642519@suse.com>
Date: Tue, 27 Oct 2020 11:18:26 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201027104548.5823c554.olaf@aepfle.de>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 27.10.2020 10:45, Olaf Hering wrote:
> Every once in a while build.c fails to compile because ssdt_s3.h does not exist. The 'sed' command which creates the file appears a few lines down in the build log.
> 
> I'm not familiar with make. I wonder if "build.o" should depend on "$(H_SRC)" instead of the expanded list of generated headers.

Oh, yes, it definitely should. Will you make a patch?

Jan

