Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C02C21FCCAB
	for <lists+xen-devel@lfdr.de>; Wed, 17 Jun 2020 13:42:17 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jlWRx-0003En-GF; Wed, 17 Jun 2020 11:41:49 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=RQSQ=76=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jlWRw-0003Ei-46
 for xen-devel@lists.xenproject.org; Wed, 17 Jun 2020 11:41:48 +0000
X-Inumbo-ID: 8400fb94-b08f-11ea-b9cf-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8400fb94-b08f-11ea-b9cf-12813bfff9fa;
 Wed, 17 Jun 2020 11:41:43 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 7EAE7AEF6;
 Wed, 17 Jun 2020 11:41:46 +0000 (UTC)
Subject: Re: [PATCH 7/9] x86/hvm: Disable MPX by default
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20200615141532.1927-1-andrew.cooper3@citrix.com>
 <20200615141532.1927-8-andrew.cooper3@citrix.com>
 <58d7254d-8953-93c4-9eb2-9be45f39bc4e@suse.com>
 <ee0819ab-71fe-dcc3-69c0-798ca9a2972c@citrix.com>
 <6898eb94-868c-b706-7cdd-7d54db09c1b0@suse.com>
 <76fabe81-3f2c-5c48-c2c0-879bc29f4fb7@citrix.com>
 <356b06c9-b176-8e72-a3bf-2be62f5cbdb5@suse.com>
 <be0e11e0-8d94-b3e2-da81-94a281eb371a@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <7d0b514c-7af6-e1b2-4b95-1ab62fe02e1c@suse.com>
Date: Wed, 17 Jun 2020 13:41:42 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <be0e11e0-8d94-b3e2-da81-94a281eb371a@citrix.com>
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Ian Jackson <Ian.Jackson@citrix.com>, Paul Durrant <paul@xen.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 17.06.2020 13:28, Andrew Cooper wrote:
> We actually have AVX512 disabled by default in XenServer.  The perf
> implications of letting 1 guest play with it is very severe.
> 
> Now I think about it, I'm tempted to recommend it moves out of default
> generally.

Hmm, I'm tempted to ask whether you're kidding. This is the kind of
feature that I see no reason at all to move out of default. Imo we
shouldn't put in place policy like this - if anything shouldn't be
on by default, it should imo be because of limitations in our
handling (I've recently revived my UMIP emulation patch, which
comes to mind here) or because of uncertainty on some aspects (like
is the case for MOVDIR / ENQCMD for example). Anything else should
be left to the admins to decide.

Jan

