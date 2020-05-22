Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DC521DE39B
	for <lists+xen-devel@lfdr.de>; Fri, 22 May 2020 11:59:09 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jc4S3-0008Ew-5w; Fri, 22 May 2020 09:58:51 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=knsM=7E=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jc4S2-0008Er-7U
 for xen-devel@lists.xenproject.org; Fri, 22 May 2020 09:58:50 +0000
X-Inumbo-ID: d56170d6-9c12-11ea-aba9-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d56170d6-9c12-11ea-aba9-12813bfff9fa;
 Fri, 22 May 2020 09:58:49 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 605C2AD60;
 Fri, 22 May 2020 09:58:51 +0000 (UTC)
Subject: Re: [PATCH v2] x86: use POPCNT for hweight<N>() when available
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <55a4a24d-7fac-527c-6bcf-8d689136bac2@suse.com>
 <20200514140522.GD54375@Air-de-Roger>
 <83534bf1-fa57-1d4a-c615-f656338a8457@suse.com>
 <20200520093106.GI54375@Air-de-Roger>
 <53fdfbe2-615a-72f9-7f2d-26402a0a64d0@suse.com>
 <20200520102805.GK54375@Air-de-Roger>
 <0e97e3af-b66e-4924-a76c-9e33cdd1a726@suse.com>
 <20200520114327.GL54375@Air-de-Roger>
 <d0a15359-339f-6edd-034c-cd6385e929d1@suse.com>
 <20200520171829.GO54375@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <2be7b657-1027-2fef-fd26-131c27e940db@suse.com>
Date: Fri, 22 May 2020 11:58:40 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200520171829.GO54375@Air-de-Roger>
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 20.05.2020 19:18, Roger Pau Monné wrote:
> I also assume that using no_caller_saved_registers when available or
> else keeping the current behavior is not an acceptable solution? FWIW,
> from a FreeBSD PoV I would be OK with that, as I don't think there are
> any supported targets with clang < 5.

By "current behavior" do you mean what the patch currently
does (matching my earlier response that I may try going this
route) or the unpatched upstream tree?

Jan

