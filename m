Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7986719549F
	for <lists+xen-devel@lfdr.de>; Fri, 27 Mar 2020 10:59:26 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jHlis-0001Io-7I; Fri, 27 Mar 2020 09:56:18 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Ixpe=5M=citrix.com=igor.druzhinin@srs-us1.protection.inumbo.net>)
 id 1jHlir-0001Ij-38
 for xen-devel@lists.xenproject.org; Fri, 27 Mar 2020 09:56:17 +0000
X-Inumbo-ID: 327c9441-7011-11ea-892e-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 327c9441-7011-11ea-892e-12813bfff9fa;
 Fri, 27 Mar 2020 09:56:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1585302975;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=htq6WXiF6QTYM79gv8zGmYvpTv7YXl4VdD/rM1in2s0=;
 b=JP6J36kk6eeDFuh6YLFtJjFE1BZ5tIfa7jn62WNfMq/J/epHX8Ke0Hfo
 XiJUaNL1WQpQdgsaA1v5WjP2tC6Wsyr1lXS/j8/aNt8MNVlImq5mkBZ1g
 OgOfJ0fyW+RS7tZroeublgK7WemvIn6b9q6lCtIm5uJYq+UYzJX8K94Fn c=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=igor.druzhinin@citrix.com;
 spf=Pass smtp.mailfrom=igor.druzhinin@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 igor.druzhinin@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="igor.druzhinin@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 igor.druzhinin@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="igor.druzhinin@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: XiM6b2Q1wDznoryHPbarScuL/Fzy7BbwYrX3cfniGPy2ybXNjGgKA/knPe+UFxbfP4NUzl0K2M
 Gke+V3hyi80QFLXBzkpve2I3Xm4pEQIhn37rk47bnF79zRAkoB8ecDLHePIAX4xwokCMuhPHtm
 T+vKTczf+3TSoRUuimPHyjQBFBuGumCFsuWXh53meTiYA9iNXDHrLjr3HqGULCCmD5xRZAb+H2
 3+370YO+bUXtRcUdecYf0E2ssgAFlgkBOk9xEGbb33cBCYWjzZJ+BK0hiQ0d/HWqO0h6KcGegv
 tn0=
X-SBRS: 2.7
X-MesageID: 15154012
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,311,1580792400"; d="scan'208";a="15154012"
To: Jan Beulich <jbeulich@suse.com>, =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?=
 <jgross@suse.com>
References: <20200326091918.12388-1-jgross@suse.com>
 <20200326091918.12388-4-jgross@suse.com>
 <260d0f20-a424-3708-3ab7-6d8c89247a2a@citrix.com>
 <7a9cff0b-4c8f-899a-3fae-8a703bc90125@suse.com>
 <859b4b9e-d839-0961-6c09-4c6aebefe9e4@suse.com>
From: Igor Druzhinin <igor.druzhinin@citrix.com>
Message-ID: <03685b16-c05c-d7d8-19fb-f8bfcf8956bd@citrix.com>
Date: Fri, 27 Mar 2020 09:56:10 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <859b4b9e-d839-0961-6c09-4c6aebefe9e4@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Subject: Re: [Xen-devel] [PATCH v8 3/5] xen: don't process rcu callbacks
 when holding a rcu_read_lock()
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 27/03/2020 08:35, Jan Beulich wrote:
> On 27.03.2020 09:10, Jürgen Groß wrote:
>> On 27.03.20 00:24, Igor Druzhinin wrote:
>>> On 26/03/2020 09:19, Juergen Gross wrote:
>>>> Some keyhandlers are calling process_pending_softirqs() while holding
>>>> a rcu_read_lock(). This is wrong, as process_pending_softirqs() might
>>>> activate rcu calls which should not happen inside a rcu_read_lock().
>>>>
>>>> For that purpose modify process_pending_softirqs() to not allow rcu
>>>> callback processing when a rcu_read_lock() is being held.
>>>>
>>>> Signed-off-by: Juergen Gross <jgross@suse.com>
>>>> Reviewed-by: Jan Beulich <jbeulich@suse.com>
>>>> ---
>>>> V3:
>>>> - add RCU_SOFTIRQ to ignore in process_pending_softirqs_norcu()
>>>>    (Roger Pau Monné)
>>>>
>>>> V5:
>>>> - block rcu processing depending on rch_read_lock() being held or not
>>>>    (Jan Beulich)
>>>
>>> Juergen,
>>>
>>> Our BVT revealed a likely problem with this commit in that form.
>>> Since 12509bbeb9e ("rwlocks: call preempt_disable() when taking a rwlock")
>>> preemption is disabled after taking cpu_maps which will block RCU
>>> callback processing inside rcu_barrier itself. This will result in
>>
>> Why would that block RCU callback processing?
>>
>> RCU callbacks should be blocked only if a rcu lock is being held.
>>
>> Did I miss something in my patches?
> 
> Igor, are you perhaps running without "rcu: add assertions to debug
> build"? I think this actually fixes what you describe. Without it
> rcu_barrier(), in its second loop, calling process_pending_softirqs(),
> would cause the RCU softirq to not be invoked anymore with preemption
> disabled. Of course the title of this change doesn't reflect this at
> all.

Yes, that explains it - I indeed skipped that patch from backporting to
our tree. Thanks, for the quick catch!

Igor


