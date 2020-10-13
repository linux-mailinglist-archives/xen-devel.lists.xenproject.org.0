Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 13B8628CBAE
	for <lists+xen-devel@lfdr.de>; Tue, 13 Oct 2020 12:31:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.6140.16172 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kSHa4-0002o3-QG; Tue, 13 Oct 2020 10:30:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 6140.16172; Tue, 13 Oct 2020 10:30:56 +0000
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
	id 1kSHa4-0002ne-N6; Tue, 13 Oct 2020 10:30:56 +0000
Received: by outflank-mailman (input) for mailman id 6140;
 Tue, 13 Oct 2020 10:30:54 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VY8U=DU=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kSHa2-0002nY-OW
 for xen-devel@lists.xenproject.org; Tue, 13 Oct 2020 10:30:54 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e54a6e2b-8432-4c2f-8c7e-36df2551e152;
 Tue, 13 Oct 2020 10:30:53 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 3100BB07D;
 Tue, 13 Oct 2020 10:30:53 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=VY8U=DU=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kSHa2-0002nY-OW
	for xen-devel@lists.xenproject.org; Tue, 13 Oct 2020 10:30:54 +0000
X-Inumbo-ID: e54a6e2b-8432-4c2f-8c7e-36df2551e152
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id e54a6e2b-8432-4c2f-8c7e-36df2551e152;
	Tue, 13 Oct 2020 10:30:53 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1602585053;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cjCKpF2vmv3OiCeAo+dpD3redlGSX1a+7nXDX1jjRc0=;
	b=sdtSVN22j7drEU7OT85uHfG3qc+kzM+azQtVSt2fprem0FhHpLSs6eb1J4loh2TBMw9RVI
	WALf57peud+eHhwPTFQymGsDihjSkcO1pBwjBKeVnGv7gC/L+0dePyM1VlgvF/qQOaJFXZ
	o5/jYaAtcPnOzJUSA0HHFyExuRX/Tdc=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 3100BB07D;
	Tue, 13 Oct 2020 10:30:53 +0000 (UTC)
Subject: Re: [PATCH v2 3/4] x86/shim: don't permit HVM and PV_SHIM_EXCLUSIVE
 at the same time
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>, George Dunlap <George.Dunlap@eu.citrix.com>
References: <c6b9c903-02eb-d473-86e3-ccb67aff6cd7@suse.com>
 <c94e4480-96a0-34b6-a4c6-6176daa57588@suse.com>
 <20201008145229.GK19254@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <1bd5f625-351f-5f70-e3d8-830c4108ac60@suse.com>
Date: Tue, 13 Oct 2020 12:30:52 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201008145229.GK19254@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 08.10.2020 16:52, Roger Pau Monné wrote:
> On Wed, Sep 16, 2020 at 03:08:00PM +0200, Jan Beulich wrote:
>> This combination doesn't really make sense (and there likely are more);
>> in particular even if the code built with both options set, HVM guests
>> wouldn't work (and I think one wouldn't be able to create one in the
>> first place). The alternative here would be some presumably intrusive
>> #ifdef-ary to get this combination to actually build (but still not
>> work) again.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> I can see the desire for being able to remove code, and the point
> Andrew made about one option not making another disappear in a
> completely different menu section.
> 
> Yet I don't see how to converge the two together, unless we completely
> change our menu layouts, and even then I'm not sure I see how we could
> structure this. Hence:
> 
> Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks.

Andrew - are you okay with this going in then? Or if not, do you have
any thoughts towards an alternative approach?

Jan

