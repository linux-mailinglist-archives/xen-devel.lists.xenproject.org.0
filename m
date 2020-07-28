Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A369C230647
	for <lists+xen-devel@lfdr.de>; Tue, 28 Jul 2020 11:15:24 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k0LhD-0001X0-SP; Tue, 28 Jul 2020 09:14:51 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uMAr=BH=amazon.com=prvs=4712fd9bf=elnikety@srs-us1.protection.inumbo.net>)
 id 1k0LhC-0001Wv-Rc
 for xen-devel@lists.xenproject.org; Tue, 28 Jul 2020 09:14:50 +0000
X-Inumbo-ID: c9f58a50-d0b2-11ea-a884-12813bfff9fa
Received: from smtp-fw-4101.amazon.com (unknown [72.21.198.25])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c9f58a50-d0b2-11ea-a884-12813bfff9fa;
 Tue, 28 Jul 2020 09:14:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1595927691; x=1627463691;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=Uqe1Nay8XvAbyfPor+W0T3vBFrSJIFtN50u7uH/H0rQ=;
 b=KkhuP+tnt+Xu6IrW6T1qe4tEXIifQ/BvVTFgD+YskVJNwajek4ORH9fc
 n8+9hsLLxzvOwPtMHjhDDBqpUUUCId0a6TLAxZGBAAN6nZe7NzQEvN48v
 VFq3sjkh7+7swqQAeACSXI7tHft9KpFq+f5epwzapiPq6fNwQn1uotEkh M=;
IronPort-SDR: LkAw6DeIXCnTl+/nN/x9qovTJgrP9wZhL7wa400RWEp3jNbs9kCtOjLhEzgkPV2dW4NxSuAaej
 wOFLOdgbskVg==
X-IronPort-AV: E=Sophos;i="5.75,405,1589241600"; d="scan'208";a="44605149"
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-1e-303d0b0e.us-east-1.amazon.com) ([10.43.8.6])
 by smtp-border-fw-out-4101.iad4.amazon.com with ESMTP;
 28 Jul 2020 09:14:50 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan2.iad.amazon.com [10.40.159.162])
 by email-inbound-relay-1e-303d0b0e.us-east-1.amazon.com (Postfix) with ESMTPS
 id E8525A21B1; Tue, 28 Jul 2020 09:14:47 +0000 (UTC)
Received: from EX13D03EUA002.ant.amazon.com (10.43.165.166) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Tue, 28 Jul 2020 09:14:46 +0000
Received: from a483e73f63b0.ant.amazon.com (10.43.160.48) by
 EX13D03EUA002.ant.amazon.com (10.43.165.166) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Tue, 28 Jul 2020 09:14:43 +0000
Subject: Re: [PATCH] x86/vhpet: Fix type size in timer_int_route_valid
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Eslam Elnikety
 <elnikety@amazon.com>
References: <20200728083357.77999-1-elnikety@amazon.com>
 <20200728085815.GY7191@Air-de-Roger>
From: Eslam Elnikety <elnikety@amazon.com>
Message-ID: <8c2a7d95-c830-485c-05c2-980994806425@amazon.com>
Date: Tue, 28 Jul 2020 11:14:38 +0200
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200728085815.GY7191@Air-de-Roger>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.43.160.48]
X-ClientProxiedBy: EX13D16UWB004.ant.amazon.com (10.43.161.170) To
 EX13D03EUA002.ant.amazon.com (10.43.165.166)
Precedence: Bulk
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: xen-devel@lists.xenproject.org, Paul Durrant <pdurrant@amazon.co.uk>,
 Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi Roger,

On 28.07.20 10:58, Roger Pau Monné wrote:
> On Tue, Jul 28, 2020 at 08:33:57AM +0000, Eslam Elnikety wrote:
>> The macro timer_int_route_cap evalutes to a 64 bit value. Extend the
>> size of left side of timer_int_route_valid to match.
> 
> I'm very dull with this things, so forgive me.
> 
> Isn't the left side just promoted to an unsigned 64bit value?
> 
> Also timer_int_route will strictly be <= 31, which makes the shift
> safe?

This is all true. The size mismatch is indeed benign. The patch is only 
for code sanity.

> 
> I'm not opposed to switching to use unsigned long, but I think I'm not
> understanding the issue.
> 
> Thanks, Roger.
> 

Regards,
Eslam

