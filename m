Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BC3481B263F
	for <lists+xen-devel@lfdr.de>; Tue, 21 Apr 2020 14:38:31 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jQsAJ-0001sS-9O; Tue, 21 Apr 2020 12:38:15 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=5BlT=6F=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jQsAH-0001sN-Jp
 for xen-devel@lists.xenproject.org; Tue, 21 Apr 2020 12:38:13 +0000
X-Inumbo-ID: f5a8bb33-83cc-11ea-912f-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f5a8bb33-83cc-11ea-912f-12813bfff9fa;
 Tue, 21 Apr 2020 12:38:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1587472693;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=ez7b51wbdbgSx0b91oiYrAWAE9050LVS4gcmvETfNAA=;
 b=DMb5kysf5Y21eAeNV29c5xll0pk8Lt2ugTO2MUG+giHf7tAF9I6yB025
 9X3CPYKgAMCt7XFdGC//qsBCKx6qRtcIAFBQBeOrBdoVUqWVhIUrRU3sG
 YXZKqZEok2t2fGIzWdOVSycXwNHWRlDBS0kSfb6B/SuK7GBAJm8fjqdFP Q=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: wG6Q/7OwvPV7dD3CbWROX0rRD8MynACnSpNQO15rcogPyyXlTcNcg/y/1cwPza891Bh5UaddyQ
 9a3a6WpA8PI/wrsG+KCkUnG0GG82NJwIMNorHtbrMRGZDr/0ah6jJILi0iWUdWJHq1JikjTrwW
 VAMLWuAXa7V9ZDM6rUE1l997EvNp17qU1AOj0Cf67zenR5hJ1L6Dnx6IFhHU/b7PuSv0sY1I2t
 c5qyLr9wUbi5X0AjGBwpkBgTH3ktDn6xuFE2I5Qjk4yrB2fzXohKIlcGG2FnmzFdIxMVAqAhpl
 9nA=
X-SBRS: 2.7
X-MesageID: 16012010
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,410,1580792400"; d="scan'208";a="16012010"
Subject: Re: [PATCH v2 1/2] x86/HVM: expose VM assist hypercall
To: Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>
References: <51dfb592-2653-738f-6933-9521ffa4fecd@suse.com>
 <e5eb3508-141e-dd9d-5177-c08d51ebaaa0@suse.com>
 <1f463b9e-9629-4ba0-3b7f-373b4bcb5b64@xen.org>
 <5863d6d0-22cf-7237-a88b-a3a2c4809635@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <c67330b3-5766-28f1-c2d1-5adb3c302208@citrix.com>
Date: Tue, 21 Apr 2020 13:38:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <5863d6d0-22cf-7237-a88b-a3a2c4809635@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Ian Jackson <ian.jackson@eu.citrix.com>, George
 Dunlap <george.dunlap@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 21/04/2020 06:54, Jan Beulich wrote:
> On 20.04.2020 19:53, Julien Grall wrote:
>>> --- a/xen/common/domain.c
>>> +++ b/xen/common/domain.c
>>> @@ -1517,20 +1517,23 @@ long do_vcpu_op(int cmd, unsigned int vc
>>>       return rc;
>>>   }
>>>   -#ifdef VM_ASSIST_VALID
>>> -long vm_assist(struct domain *p, unsigned int cmd, unsigned int type,
>>> -               unsigned long valid)
>>> +#ifdef arch_vm_assist_valid
>> How about naming the function arch_vm_assist_valid_mask?
> Certainly a possibility, albeit to me the gain would be marginal
> and possibly not outweigh the growth in length. Andrew, any
> preference?

I prefer Julien's suggestion overall.  It is obviously not a predicate,
whereas the shorter name could easily be one.

~Andrew

