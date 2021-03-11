Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E1483373D5
	for <lists+xen-devel@lfdr.de>; Thu, 11 Mar 2021 14:28:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.96540.182710 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lKLMl-0005WM-2L; Thu, 11 Mar 2021 13:28:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 96540.182710; Thu, 11 Mar 2021 13:28:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lKLMk-0005Vx-VC; Thu, 11 Mar 2021 13:28:38 +0000
Received: by outflank-mailman (input) for mailman id 96540;
 Thu, 11 Mar 2021 13:28:36 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=QJ7d=IJ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lKLMi-0005Vs-Oz
 for xen-devel@lists.xenproject.org; Thu, 11 Mar 2021 13:28:36 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 71ec5d34-e96f-4668-ad19-6df3a038931a;
 Thu, 11 Mar 2021 13:28:36 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 4B420AC17;
 Thu, 11 Mar 2021 13:28:35 +0000 (UTC)
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
X-Inumbo-ID: 71ec5d34-e96f-4668-ad19-6df3a038931a
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1615469315; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=97+7cVHLYJrSNxbgQR4BFmmxVrB8XCPJYoxHCAcPS/Y=;
	b=gr8+2698g+Lyt+n91dW6Tqih28wTWljeBVhlJF879szU9CFUnBJXgkHf/5yQckT62sswyN
	7tz9O2HA0gUI5IRGmlD/hfysmXNKkmopd31rJ2xI1YtdtHSBLjx7DJDvp8ZMbMGHcJ1nTe
	3Hys1vvl8Dw1Cu9/fTi6ex6+W6cW8Wo=
Subject: Re: [PATCH for-4.15 v2] xen/dmop: Strip __XEN_TOOLS__ header guard
 from public API
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Ian Jackson <iwj@xenproject.org>,
 Xen-devel <xen-devel@lists.xenproject.org>, Juergen Gross <jgross@suse.com>,
 Paul Durrant <paul@xen.org>
References: <20210310150722.27194-1-andrew.cooper3@citrix.com>
 <d375232a-d1a7-737c-0887-8b7e1c9a772d@suse.com>
 <13f03a67-18c2-e564-a0f6-84eccc7eeb76@citrix.com>
 <556ce32b-5087-b8b1-432e-643218dd8c6e@suse.com>
 <9ca069ab-8b6c-c8f1-d68b-4a9bb0cf5c56@citrix.com>
 <c8ed458a-6064-95d3-f189-f0928b09baca@suse.com>
 <62b79d56-2438-23ab-49c0-a8c4b290c4f7@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <9a248354-f68b-8cba-f18c-f4a26473f9bf@suse.com>
Date: Thu, 11 Mar 2021 14:28:34 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <62b79d56-2438-23ab-49c0-a8c4b290c4f7@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 11.03.2021 14:00, Andrew Cooper wrote:
> However, having laid things out in this way today, it occurs to me that
> we should consider further cleanup as well.
> 
> I do agree that code wanting to use the libxendevicemodel.h API almost
> certainly don't want/need the dmop ABI.  (i.e. an individual consumer
> will want one, or the other, but almost certainly not both together).
> 
> Should libxendevicemodel.h really be including dm_op.h?

I was indeed wondering.

>  AFAICT, it is
> only the ioserverid_t typedef which is API shared between the two
> contexts, and we can trivially typedef that locally.

Hmm, a local typedef isn't nice - there should be one central point.
Granted there's no risk for this to change in anywhere halfway
foreseeable future, but still. Also neither C89 nor C99 allow a
typedef to be repeated - in those versions we'd then rely on an
extension.

> This is something which we should either do now, or not at all.

Well, yes, would be better.

Jan

