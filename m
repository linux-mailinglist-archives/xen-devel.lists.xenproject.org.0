Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 568C41DBA4C
	for <lists+xen-devel@lfdr.de>; Wed, 20 May 2020 18:54:36 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jbRz8-0005jl-So; Wed, 20 May 2020 16:54:26 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4N77=7C=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jbRz8-0005je-7N
 for xen-devel@lists.xenproject.org; Wed, 20 May 2020 16:54:26 +0000
X-Inumbo-ID: 8f7cb715-9aba-11ea-aa4d-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8f7cb715-9aba-11ea-aa4d-12813bfff9fa;
 Wed, 20 May 2020 16:54:25 +0000 (UTC)
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: Lvc6ObjI9N98SWdsow66xDUKaclVoU264U7YC2yYbq/qGZNFyV9pjHxRFhAwfpcXP2a6VR0BBi
 ljlol3mxhHb+EhP8U4JOu0sZt0VJoluONgXOvXFTcthD8wHmaBbjxCQYJRmLrJ50FyzLoe5FCn
 DGiVnLQLER8+ZXjTk8Zl/SUGRR77yWb+ZaPKhleoJ5GleGMFHmeR6Mjhopm614Oatr0AG/pvi3
 CES+dFpJXPWO0BynbG85PR1nowkcoY/wei0iAWnjn2ZjguY3fDDfYdDsdgqA0hQT4wrhLEv/os
 go0=
X-SBRS: 2.7
X-MesageID: 18375230
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,414,1583211600"; d="scan'208";a="18375230"
Subject: Re: [BUG] Consistent LBR/TSX vmentry failure (0x80000022) calling
 domain_crash() in vmx.c:3324
To: Elliot Killick <elliotkillick@zohomail.eu>
References: <36815795-223f-2b96-5401-c262294cbaa8@zohomail.eu>
 <c715f89a-b2ba-490c-c027-b4c7d7069f42@citrix.com>
 <2bcd2ccc-b58e-1268-68ce-3ef534534245@zohomail.eu>
 <1b76cd6a-c6a2-c9c9-1d8b-32a9a1dbc557@citrix.com>
 <657e7522-bd0f-bea3-7ce8-2f6c4ec72407@zohomail.eu>
 <dc1ef4b6-9406-b625-c157-6ebec2a6afda@citrix.com>
 <325c716c-df62-d24c-2e48-3a100e84f48d@zohomail.eu>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <c09d62a4-6362-8eb9-a3b0-79c429850db6@citrix.com>
Date: Wed, 20 May 2020 17:53:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <325c716c-df62-d24c-2e48-3a100e84f48d@zohomail.eu>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
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
Cc: xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 20/05/2020 15:59, Elliot Killick wrote:
> On 2020-05-20 12:31, Andrew Cooper wrote:
>> On 20/05/2020 12:46, Elliot Killick wrote:
>>> processor	: 0
>>> vendor_id	: GenuineIntel
>>> cpu family	: 6
>>> model		: 60
>>> model name	: Intel(R) Core(TM) i5-4590 CPU @ 3.30GHz
>>> stepping	: 3
>>> microcode	: 0x27
>>> cpu MHz		: 3299.926
>>> cache size	: 6144 KB
>>> physical id	: 0
>> Ok, so the errata is one of HSM182/HSD172.
>>
>> Xen has workaround for all of these.  However, I also see:
>>
>>> (XEN) ----[ Xen-4.8.5-15.fc25  x86_64  debug=n   Not tainted ]----
>> which is an obsolete version of Xen these days.  It looks like these
>> issues were first fixed in Xen 4.9, but you should upgrade to something
>> rather newer.
>>
>> ~Andrew
>>
> Ah, so this is originally a CPU bug which Xen has had to patch over.

Yes.  It was an unintended consequence of Intel being forced to disable
TSX in most of their Haswell/Broadwell CPUs.

> As for the Xen version, that's controlled by the "distribution" of Xen I
> run which is Qubes. To remedy this I could run the testing stream of
> Qubes which currently provides the latest version of Xen (4.13) but that
> could bring its own set of problems.

Ah, in which case Qubes will probably consider backporting the fixes. 
Open a bug with them, and I can probably point out a minimum set of
backports to make it work.

~Andrew

