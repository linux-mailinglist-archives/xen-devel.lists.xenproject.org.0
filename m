Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B13E4271F10
	for <lists+xen-devel@lfdr.de>; Mon, 21 Sep 2020 11:41:16 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kKIJh-0005jY-4J; Mon, 21 Sep 2020 09:41:01 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8Wak=C6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kKIJf-0005jS-MD
 for xen-devel@lists.xenproject.org; Mon, 21 Sep 2020 09:40:59 +0000
X-Inumbo-ID: aad083be-d7ea-4c4d-9f00-bfa8c477baa6
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id aad083be-d7ea-4c4d-9f00-bfa8c477baa6;
 Mon, 21 Sep 2020 09:40:58 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1600681257;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CzC+YjMWGNadFsl5pePwNNxVz4TI7BNFOlIZPG3cNVg=;
 b=niCR5aNs+lwW/LjSrfMQEnNq0zsvxGpVbIQiBYzCuoODjXxCPJQcsSd7iHnoV29LY2WoUC
 0whn7Qeixci/AbMXe485gPIYz171k4tRGvyCF+P2JOYTCJSC1VdPkoei85i1TfiYViJ04m
 TSzc+Yj2INtuuS3shSiiYQwLxQsfCps=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 6DCB5ADB3;
 Mon, 21 Sep 2020 09:41:33 +0000 (UTC)
Subject: Re: qemu and Xen ABI-unstable libs
To: paul@xen.org
Cc: 'Ian Jackson' <iwj@xenproject.org>,
 "'Debian folks: Michael Tokarev'" <mjt@tls.msk.ru>,
 'Hans van Kranenburg' <hans@knorrie.org>,
 "'Xen upstream folks with an interest: Andrew Cooper'"
 <Andrew.Cooper3@citrix.com>, =?UTF-8?B?J1JvZ2VyIFBhdSBNb25uw6kn?=
 <roger.pau@citrix.com>, pkg-xen-devel@lists.alioth.debian.org,
 xen-devel@lists.xenproject.org,
 "'My Xen upstream tools co-maintainer: Wei Liu'" <wl@xen.org>
References: <24420.58027.291045.507128@mariner.uk.xensource.com>
 <001b01d68fe9$fb3ae060$f1b0a120$@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <a034987c-3b73-cc99-fdf2-74959710b6c1@suse.com>
Date: Mon, 21 Sep 2020 11:40:56 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <001b01d68fe9$fb3ae060$f1b0a120$@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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

On 21.09.2020 09:36, Paul Durrant wrote:
>> From: Xen-devel <xen-devel-bounces@lists.xenproject.org> On Behalf Of Ian Jackson
>> Sent: 18 September 2020 17:39
>>
>> xc_domain_iomem_permission
>> xc_domain_populate_physmap_exact
>> xc_domain_ioport_mapping
>> xc_domain_memory_mapping
>>
>> The things done by these calls in qemu should be done by the Xen
>> toolstack (libxl), during domain creation etc., instead.
> 
> I don't think that is practical. E.g. if a guest re-programs a PCI I/O BAR then it may necessitate re-calling
> xc_domain_ioport_mapping(); the tool-stack cannot know a priori where PCI BARs will end up in guest port/memory space.

In your reply I assume you meant just the latter two of the four?
For these I agree, and as a result they shouldn't be domctl in
the new model.

Jan

