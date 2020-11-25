Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FF242C3A4D
	for <lists+xen-devel@lfdr.de>; Wed, 25 Nov 2020 08:51:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.37384.69719 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khpaU-0005sD-Lv; Wed, 25 Nov 2020 07:51:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 37384.69719; Wed, 25 Nov 2020 07:51:38 +0000
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
	id 1khpaU-0005ro-In; Wed, 25 Nov 2020 07:51:38 +0000
Received: by outflank-mailman (input) for mailman id 37384;
 Wed, 25 Nov 2020 07:51:37 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dO0Y=E7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1khpaT-0005rj-Ft
 for xen-devel@lists.xenproject.org; Wed, 25 Nov 2020 07:51:37 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ec37a8ff-9e05-487e-a713-bf37a6061b89;
 Wed, 25 Nov 2020 07:51:36 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 40C22AF45;
 Wed, 25 Nov 2020 07:51:35 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=dO0Y=E7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1khpaT-0005rj-Ft
	for xen-devel@lists.xenproject.org; Wed, 25 Nov 2020 07:51:37 +0000
X-Inumbo-ID: ec37a8ff-9e05-487e-a713-bf37a6061b89
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id ec37a8ff-9e05-487e-a713-bf37a6061b89;
	Wed, 25 Nov 2020 07:51:36 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1606290695; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ywa1RSJ2YPNS20uEm3T4o6nbcbo/euOC4wBThw/kH7A=;
	b=SANHV08dXrAj5Ouc/HMdosUKcbx/AKHH9cL8HiDU84egquj1OPQcZC0/ENn4e1EaB++gqg
	gts2xdapH6uGmHNUYeBCfk9gZK7Q34I3bV+w3HpbSMKOCjRjnzdSLCbojupoJzoIgJ1bZz
	bKubCEjllsWlne3mKmf2FI/mnTSQuuU=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 40C22AF45;
	Wed, 25 Nov 2020 07:51:35 +0000 (UTC)
Subject: Re: [PATCH v3 01/13] viridian: don't blindly write to 32-bit
 registers is 'mode' is invalid
To: Paul Durrant <paul@xen.org>
Cc: Paul Durrant <pdurrant@amazon.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20201124190744.11343-1-paul@xen.org>
 <20201124190744.11343-2-paul@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <ed2dbafa-b1fc-7ce3-9814-9034b0393921@suse.com>
Date: Wed, 25 Nov 2020 08:51:35 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201124190744.11343-2-paul@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 24.11.2020 20:07, Paul Durrant wrote:
> From: Paul Durrant <pdurrant@amazon.com>
> 
> If hvm_guest_x86_mode() returns something other than 8 or 4 then
> viridian_hypercall() will return immediately but, on the way out, will write
> back status as if 'mode' was 4. This patch simply makes it leave the registers
> alone.
> 
> NOTE: The formatting of the 'out' label and the switch statement are also
>       adjusted as per CODING_STYLE.

Partly only as far as the latter goes:

> --- a/xen/arch/x86/hvm/viridian/viridian.c
> +++ b/xen/arch/x86/hvm/viridian/viridian.c
> @@ -692,13 +692,14 @@ int viridian_hypercall(struct cpu_user_regs *regs)
>          break;
>      }
>  
> -out:
> + out:
>      output.result = status;
>      switch (mode) {

This would want to be

    switch ( mode )
    {

I guess this could easily be taken care of while committing.

Jan

