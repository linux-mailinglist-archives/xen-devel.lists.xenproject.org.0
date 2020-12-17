Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C93C82DD570
	for <lists+xen-devel@lfdr.de>; Thu, 17 Dec 2020 17:46:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.56058.97854 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kpwQU-0003l8-OS; Thu, 17 Dec 2020 16:46:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 56058.97854; Thu, 17 Dec 2020 16:46:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kpwQU-0003kd-K3; Thu, 17 Dec 2020 16:46:50 +0000
Received: by outflank-mailman (input) for mailman id 56058;
 Thu, 17 Dec 2020 16:46:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WIZe=FV=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1kpwQT-0003kJ-Fo
 for xen-devel@lists.xenproject.org; Thu, 17 Dec 2020 16:46:49 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 214f0f02-32e9-43ad-b9e2-1c96d4e70d9a;
 Thu, 17 Dec 2020 16:46:47 +0000 (UTC)
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
X-Inumbo-ID: 214f0f02-32e9-43ad-b9e2-1c96d4e70d9a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1608223607;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=HON6Rso/LFkmgFDI9GbBKv1wRsoRIqh3NIzDsd9cMzk=;
  b=ZHwIK9qbvb/bg58KN4QmKsmaIv1equcVHNlzhQcOgvRugnPjMuWFwGnx
   RoXxgS2Xnm6y+KwWmBqpUJ2p5VKuHzx8f32aMM04YBfhQv7Dml2cc2fFA
   8Mh8BXpij/1w92YhMBf78MdLAxwRoJ4aE4v3KYvrBH7vOe66o34EWm1Hy
   E=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: vr7Z/XLe1qXhQv2uYamwn4Rw6yA8Lq94tfk/lmidme9JOy3vTSwX2hJxEuVF8lCN7VBwDPJumq
 oq9PgnHG7Ry2gsl50/pp7bLgeslboS96WhLCEpffA+0QlnAcsBHYsb6ZoFKW6STyIOJe+mUqaq
 SIJxDVI9b8iR4qnSLWXkYZWpBjI5nMmm+d6XxZKeMEO9VUFqaZa3Lf1S7MvjU+1HCBzNZFcLn5
 WJzjJ/ZCmber8RXSwsH5vzHTuVVYeEDup7jjTnjdnoJosWAPAFSy+TIYpPXlU0m3YLJPM7pJB1
 qmY=
X-SBRS: 5.2
X-MesageID: 33703718
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.78,428,1599537600"; 
   d="scan'208";a="33703718"
Subject: Re: XSA-351 causing Solaris-11 systems to panic during boot.
To: <boris.ostrovsky@oracle.com>, Jan Beulich <jbeulich@suse.com>
CC: <xen-devel@lists.xenproject.org>, Cheyenne Wills
	<cheyenne.wills@gmail.com>
References: <CAHpsFVc4AAm6L0rKUuV47ydOjtw7XAgFnDZxRjdCL0OHXJERDw@mail.gmail.com>
 <7bca24cb-a3af-b54d-b224-3c2a316859dd@suse.com>
 <4fc3532b-f53f-2a15-ce64-f857816b0566@oracle.com>
 <f4ff3d16-40f6-e8a1-fcdd-ca52e1f52ca6@suse.com>
 <c90622c4-f9e0-8b6d-ab46-bba0cbfc0fd9@oracle.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <0430337a-6fcd-9471-4455-838390401220@citrix.com>
Date: Thu, 17 Dec 2020 16:46:42 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <c90622c4-f9e0-8b6d-ab46-bba0cbfc0fd9@oracle.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 FTLPEX02CL03.citrite.net (10.13.108.165)

On 17/12/2020 16:25, boris.ostrovsky@oracle.com wrote:
> On 12/17/20 2:40 AM, Jan Beulich wrote:
>> On 17.12.2020 02:51, boris.ostrovsky@oracle.com wrote:
>> I think this is acceptable as a workaround, albeit we may want to
>> consider further restricting this (at least on staging), like e.g.
>> requiring a guest config setting to enable the workaround. 
>
> Maybe, but then someone migrating from a stable release to 4.15 will have to modify guest configuration.
>
>
>> But
>> maybe this will need to be part of the MSR policy for the domain
>> instead, down the road. We'll definitely want Andrew's view here.
>>
>> Speaking of staging - before applying anything to the stable
>> branches, I think we want to have this addressed on the main
>> branch. I can't see how Solaris would work there.
>
> Indeed it won't. I'll need to do that as well (I misinterpreted the statement in the XSA about only 4.14- being vulnerable)

It's hopefully obvious now why we suddenly finished the "lets turn all
unknown MSRs to #GP" work at the point that we did (after dithering on
the point for several years).

To put it bluntly, default MSR readability was not a clever decision at all.

There is a large risk that there is a similar vulnerability elsewhere,
given how poorly documented the MSRs are (and one contemporary CPU I've
got the manual open for has more than 6000 *documented* MSRs).  We did
debate for a while whether the readability of the PPIN MSRs was a
vulnerability or not, before eventually deciding not.

Irrespective of what we do to fix this in Xen, has anyone fixed Solaris yet?

~Andrew

