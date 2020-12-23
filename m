Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B0192E1FAC
	for <lists+xen-devel@lfdr.de>; Wed, 23 Dec 2020 18:02:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.58544.103073 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ks7X0-0004Qf-H2; Wed, 23 Dec 2020 17:02:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 58544.103073; Wed, 23 Dec 2020 17:02:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ks7X0-0004QE-Dk; Wed, 23 Dec 2020 17:02:34 +0000
Received: by outflank-mailman (input) for mailman id 58544;
 Wed, 23 Dec 2020 17:02:33 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0ifz=F3=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1ks7Wy-0004Q9-U6
 for xen-devel@lists.xenproject.org; Wed, 23 Dec 2020 17:02:32 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 72847706-24f1-4342-b091-341ccbfc39ae;
 Wed, 23 Dec 2020 17:02:31 +0000 (UTC)
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
X-Inumbo-ID: 72847706-24f1-4342-b091-341ccbfc39ae
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1608742951;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=kYgNW59ChK2fCZZH8onTJqALT3bKd6CHCZsvhPNBxOo=;
  b=Le2arulZUzlywYdbLQTp7isaa2P6aN7/XQtYSSKdRUfz8BxvVCBArbg7
   Yr8y5ZEKDsg6bYZAH/UZOyEuVwYgDpyjmr5kMBLGZLuTylam0LgX1rc65
   Hx//hty0NgQjsAqVnCVP5IlFeAX9uolhkZ1zfnP8MRdVS8muu8yJBpyFg
   Y=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: dbeZBWQAUucFcmFHL29ezytC7/1mVTgorsfr6SpmoFUzhnWiu0w7AsV6OB0/OWuOcc/WsFcqKa
 C6FEdV3HKC7NMrF1I5cHiQpgFuWEoP7V3nARMT8bZ8kAITobnooVGg5hFKEMPMmSyaNze6Xqwh
 OQr1dkvyTJjbZweTOvSzAD17n58QOgMgUHtjMzIW/HsFRUR4FLsfENmWod9mr13Gh2/mxOGEKC
 EWr6KC8jH+dTTn2oQ4mdh14jp3TI8dc+ugT9tlBLlvBz08jLvQcQMsJl3dr2F2B2tPt+HfqHa5
 OIU=
X-SBRS: 5.2
X-MesageID: 33866011
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.78,441,1599537600"; 
   d="scan'208";a="33866011"
Subject: Re: [PATCH v2] lib: drop (replace) debug_build()
To: Jan Beulich <jbeulich@suse.com>
CC: George Dunlap <george.dunlap@citrix.com>, Ian Jackson
	<iwj@xenproject.org>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	=?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <ae31ccf1-7334-cdf9-9b90-edac7ca4e148@suse.com>
 <bdb96275-c6a4-a4d2-9195-67fd2f3f1bf3@citrix.com>
 <11bb1b39-7d1d-bcf4-1bff-4472a3c79dea@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <6f9ece4d-6fef-07cf-b4d5-2b13790956e1@citrix.com>
Date: Wed, 23 Dec 2020 17:02:22 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <11bb1b39-7d1d-bcf4-1bff-4472a3c79dea@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 FTLPEX02CL03.citrite.net (10.13.108.165)

On 23/12/2020 16:59, Jan Beulich wrote:
> On 23.12.2020 17:53, Andrew Cooper wrote:
>> On 23/12/2020 16:05, Jan Beulich wrote:
>>> Its expansion shouldn't be tied to NDEBUG - down the road we may want to
>>> allow enabling assertions independently of CONFIG_DEBUG. Replace the few
>>> uses by a new xen_build_info() helper, subsuming gcov_string at the same
>>> time (while replacing the stale CONFIG_GCOV used there) and also adding
>>> CONFIG_UBSAN indication.
>>>
>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>,
> Thanks.
>
>>> --- a/xen/common/version.c
>>> +++ b/xen/common/version.c
>>> @@ -70,6 +70,30 @@ const char *xen_deny(void)
>>>      return "<denied>";
>>>  }
>>>  
>>> +static const char build_info[] =
>>> +    "debug="
>>> +#ifdef CONFIG_DEBUG
>>> +    "y"
>>> +#else
>>> +    "n"
>>> +#endif
>>> +#ifdef CONFIG_COVERAGE
>>> +# ifdef __clang__
>>> +    " llvmcov=y"
>>> +# else
>>> +    " gcov=y"
>>> +# endif
>>> +#endif
>>> +#ifdef CONFIG_UBSAN
>>> +    " ubsan=y"
>>> +#endif
>>> +    "";
>>> +
>>> +const char *xen_build_info(void)
>>> +{
>>> +    return build_info;
>>> +}
>> ... do we really need a function here?
>>
>> Wouldn't an extern const char build_info[] do?
> It probably would, but I wanted things to remain consistent with
> the siblings, many of which also return string literals (or
> effectively plain numbers).

The only reason they are still functions is because there was an
argument over breaking the livepatch testing on older versions of Xen,
and I got bored arguing.

I, however, don't consider this a valid reason to block improvements.

~Andrew

