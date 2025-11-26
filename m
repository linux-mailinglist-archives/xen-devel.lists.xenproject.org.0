Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FC21C8A4FC
	for <lists+xen-devel@lfdr.de>; Wed, 26 Nov 2025 15:25:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1172956.1498061 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOGSE-0007P7-OX; Wed, 26 Nov 2025 14:25:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1172956.1498061; Wed, 26 Nov 2025 14:25:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOGSE-0007Mr-Lg; Wed, 26 Nov 2025 14:25:10 +0000
Received: by outflank-mailman (input) for mailman id 1172956;
 Wed, 26 Nov 2025 14:25:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HtuU=6C=raptorengineering.com=tpearson@srs-se1.protection.inumbo.net>)
 id 1vOGSD-0007Ml-1b
 for xen-devel@lists.xenproject.org; Wed, 26 Nov 2025 14:25:09 +0000
Received: from raptorengineering.com (mail.raptorengineering.com
 [23.155.224.40]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b4d8a782-cad3-11f0-9d18-b5c5bf9af7f9;
 Wed, 26 Nov 2025 15:25:07 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 824CB7790D36;
 Wed, 26 Nov 2025 08:25:06 -0600 (CST)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id kOh24_SIDnvO; Wed, 26 Nov 2025 08:25:05 -0600 (CST)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id B28A57790E59;
 Wed, 26 Nov 2025 08:25:05 -0600 (CST)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id 4lILqfeyHDET; Wed, 26 Nov 2025 08:25:05 -0600 (CST)
Received: from vali.starlink.edu (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 8344E7790D36;
 Wed, 26 Nov 2025 08:25:05 -0600 (CST)
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
X-Inumbo-ID: b4d8a782-cad3-11f0-9d18-b5c5bf9af7f9
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com B28A57790E59
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1764167105; bh=VY8Yn0305rHKYhG2eoCWBXzlFAw6xEYpgO57TDu/nH8=;
	h=Date:From:To:Message-ID:MIME-Version;
	b=FxnyqkgSgo8FcMF0BqUAAnEzsODdun3CFi2KQvMdcQVnUuZQNcO4QknCDsFgGjCPa
	 AtRP3qvY+IBDIvX2/tYSe0D3z7hPXW98LBRza0ftiW8mwuxbOb8LRk5AFYEsbK/T0G
	 43DOOUs2GEOl4bhUPLs8fAm/28By6UHApwho3oZA=
X-Virus-Scanned: amavisd-new at rptsys.com
Date: Wed, 26 Nov 2025 08:25:02 -0600 (CST)
From: Timothy Pearson <tpearson@raptorengineering.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, 
	Julien Grall <julien@xen.org>, 
	Stefano Stabellini <sstabellini@kernel.org>, 
	Anthony PERARD <anthony.perard@vates.tech>, 
	Michal Orzel <michal.orzel@amd.com>, 
	Roger Pau =?utf-8?Q?Monn=C3=A9?= <roger.pau@citrix.com>
Message-ID: <834118820.127247.1764167102624.JavaMail.zimbra@raptorengineeringinc.com>
In-Reply-To: <6de82773-c084-49e6-b4b4-466a35583ed8@suse.com>
References: <bd689f02-3e6b-4d15-aa1d-d757a9ee54a8@suse.com> <b915451d-62c9-4128-807a-42b908dbaef4@suse.com> <1755986020.127148.1764166039180.JavaMail.zimbra@raptorengineeringinc.com> <fdfe411d-0710-4439-85f3-a77ba71b8afb@suse.com> <1213078822.127214.1764166453810.JavaMail.zimbra@raptorengineeringinc.com> <6de82773-c084-49e6-b4b4-466a35583ed8@suse.com>
Subject: Re: [PATCH 3/8] symbols/ppc: re-number intermediate files
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Mailer: Zimbra 8.5.0_GA_3042 (ZimbraWebClient - GC141 (Linux)/8.5.0_GA_3042)
Thread-Topic: symbols/ppc: re-number intermediate files
Thread-Index: NENqvzTugVoYskUPh7CdLQMHcHIb5w==


----- Original Message -----
> From: "Jan Beulich" <jbeulich@suse.com>
> To: "Timothy Pearson" <tpearson@raptorengineering.com>
> Cc: "xen-devel" <xen-devel@lists.xenproject.org>, "Andrew Cooper" <andrew=
.cooper3@citrix.com>, "Julien Grall"
> <julien@xen.org>, "Stefano Stabellini" <sstabellini@kernel.org>, "Anthony=
 PERARD" <anthony.perard@vates.tech>, "Michal
> Orzel" <michal.orzel@amd.com>, "Roger Pau Monn=C3=A9" <roger.pau@citrix.c=
om>
> Sent: Wednesday, November 26, 2025 8:21:31 AM
> Subject: Re: [PATCH 3/8] symbols/ppc: re-number intermediate files

> On 26.11.2025 15:14, Timothy Pearson wrote:
>> ----- Original Message -----
>>> From: "Jan Beulich" <jbeulich@suse.com>
>>> To: "Timothy Pearson" <tpearson@raptorengineering.com>
>>=20
>>> On 26.11.2025 15:07, Timothy Pearson wrote:
>>>> ----- Original Message -----
>>>>> From: "Jan Beulich" <jbeulich@suse.com>
>>>>> To: "xen-devel" <xen-devel@lists.xenproject.org>
>>>>
>>>>> In preparation to do away with symbols-dummy, re-number the assembly =
and
>>>>> object files used, for the numbers to match the next passes real outp=
ut.
>>>>> This is to make 0 available to use for what now is handled by
>>>>> symbols-dummy.
>>>>>
>>>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>>>
>>>> Looks good to me.
>>>>
>>>> Acked-by: Timothy Pearson <tpearson@raptorengineering.com>
>>>
>>> Thanks, but for clarification: This doesn't mean very much unless provi=
ded
>>> by a maintainer (M: in ./MAINTAINERS). As a reviewer, you'd use Reviewe=
d-by:
>>> to fulfill the purpose set forth in the textual part of that file. Prov=
ided
>>> of course you actually did a review.
>>=20
>> Understood, and yes, the patches were in fact reviewed.  I will use the
>> alternate string in the future.
>=20
> Then still for the ones here: May I flip them to R-b, meaning the patches=
 can
> in fact go in without anyone else's (i.e. a REST maintainer's) ack?
>=20
> Jan

Yes, for both the [3/8] and [4/8] patches which I have personally reviewed.

