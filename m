Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F6B72F6695
	for <lists+xen-devel@lfdr.de>; Thu, 14 Jan 2021 18:01:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.67444.120407 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l060E-0008V3-So; Thu, 14 Jan 2021 17:01:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 67444.120407; Thu, 14 Jan 2021 17:01:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l060E-0008Ue-Po; Thu, 14 Jan 2021 17:01:42 +0000
Received: by outflank-mailman (input) for mailman id 67444;
 Thu, 14 Jan 2021 17:01:42 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=J1hy=GR=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l060E-0008UZ-4x
 for xen-devel@lists.xenproject.org; Thu, 14 Jan 2021 17:01:42 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c35c7ae9-1076-4610-8518-daa9fa118337;
 Thu, 14 Jan 2021 17:01:41 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 39E4EABD6;
 Thu, 14 Jan 2021 17:01:40 +0000 (UTC)
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
X-Inumbo-ID: c35c7ae9-1076-4610-8518-daa9fa118337
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1610643700; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=m8OJaOnEP3xCFjsMQdEomEuaij5Ujxi3vBX2hG0bQ8Y=;
	b=GcoHPBE3UzywzxW0/yoLJ93FwCNdhcpailtXQITYU0S9q0xYyXLvJI2GLSVIKMv9SZQgUl
	qfUVVdvbeSWtFez1L9cmA+5YEG/qgh7xoQEGNtmDa/dn0vtmvvjr4+3mSvKu/UIC1Ag/py
	xK1ohWbrqiVUWfBFTeOv/uGnOb3pCMo=
Subject: Re: [PATCH] argo: don't leak stack contents when returning ring info
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Christopher Clark <christopher.w.clark@gmail.com>
References: <a2621d1e-dd52-4e46-9e4b-dffd94e73993@suse.com>
 <20210114165914.rtnzuf5qolifcxv4@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <65e8b764-7ace-9562-89ae-e0259e98835d@suse.com>
Date: Thu, 14 Jan 2021 18:01:40 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210114165914.rtnzuf5qolifcxv4@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 14.01.2021 17:59, Roger Pau Monné wrote:
> On Thu, Jan 14, 2021 at 03:01:06PM +0100, Jan Beulich wrote:
>> The max_message_size field of the output gets filled only when the flags
>> field is non-zero. Don't copy back uninitialized data to guest context.
> 
> I'm afraid I'm missing something. AFAICT ent gets filled from the
> user-space contents of data_ent_hnd that's copied from user-space at
> the top of the function,

Oh, I managed to overlook this multiple time, so ...

> so there's no leak from hypervisor stack in
> the return path?

... yes indeed. Withdrawing the patch.

Thanks for noticing,
Jan

