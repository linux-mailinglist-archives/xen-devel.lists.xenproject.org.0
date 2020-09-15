Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E1DCD26A4EF
	for <lists+xen-devel@lfdr.de>; Tue, 15 Sep 2020 14:19:43 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kI9vp-0002Fx-KL; Tue, 15 Sep 2020 12:19:33 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jdui=CY=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kI9vp-0002Fs-69
 for xen-devel@lists.xenproject.org; Tue, 15 Sep 2020 12:19:33 +0000
X-Inumbo-ID: 4cbed8cf-400c-49db-83f9-67210db4025b
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4cbed8cf-400c-49db-83f9-67210db4025b;
 Tue, 15 Sep 2020 12:19:32 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 29AB0AF8D;
 Tue, 15 Sep 2020 12:19:47 +0000 (UTC)
Subject: Re: [PATCH 3/3] x86/shim: don't permit HVM and PV_SHIM_EXCLUSIVE at
 the same time
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 George Dunlap <George.Dunlap@eu.citrix.com>
References: <5d86a23c-5dea-8697-9ba1-900d35b99695@suse.com>
 <d6661f16-0cd2-1eed-0128-c89f1aca240d@suse.com>
 <20200915110233.GK753@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <91bf9bb5-4a8f-6e67-5657-0aebb3dc2a66@suse.com>
Date: Tue, 15 Sep 2020 14:19:31 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200915110233.GK753@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 15.09.2020 13:02, Roger Pau Monné wrote:
> On Mon, Sep 14, 2020 at 02:39:33PM +0200, Jan Beulich wrote:
>> This combination doesn't really make sense (and there likely are more).
>> The alternative here would be some presumably intrusive #ifdef-ary to
>> get this combination to actually build again.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> I'm not sure I see a way to cater for Andrew requests while allowing
> PV_SHIM_EXCLUSIVE to gate options in order to be able to remove
> code.

Yes, I'm specifically hoping for his input, in particular in light
of the additional argument given in the cover letter (HVM not
actually usable in this mode).

> Maybe PV_SHIM_EXCLUSIVE should be moved to the top level Kconfig
> screen on x86 and behave like a list, so that you select a 'Normal'
> hypervisor build or a 'PV shim exclusive' build, and that could
> completely change the contents of the menus?

This might be another option, yes. Let's see what Andrew thinks.

And btw - the patch needs an update anyway, as I've lost the
defaulting to Y of this option.

Jan

