Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 09E07285E7B
	for <lists+xen-devel@lfdr.de>; Wed,  7 Oct 2020 13:51:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.3474.9924 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kQ7y4-00056u-Mo; Wed, 07 Oct 2020 11:50:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 3474.9924; Wed, 07 Oct 2020 11:50:48 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kQ7y4-00056X-Jc; Wed, 07 Oct 2020 11:50:48 +0000
Received: by outflank-mailman (input) for mailman id 3474;
 Wed, 07 Oct 2020 11:50:46 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=01DM=DO=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1kQ7y2-00056S-Mo
 for xen-devel@lists.xenproject.org; Wed, 07 Oct 2020 11:50:46 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e4c9a103-80d8-4c25-bf56-9188210e164a;
 Wed, 07 Oct 2020 11:50:44 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=01DM=DO=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
	id 1kQ7y2-00056S-Mo
	for xen-devel@lists.xenproject.org; Wed, 07 Oct 2020 11:50:46 +0000
X-Inumbo-ID: e4c9a103-80d8-4c25-bf56-9188210e164a
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id e4c9a103-80d8-4c25-bf56-9188210e164a;
	Wed, 07 Oct 2020 11:50:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1602071445;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=18DJCBD+ATtqoB+qJkoUQ1HbicG3/05YHWIKTsKOYp8=;
  b=KKOh6N+bEtYd87oXUd6zmatZSiVrvapxBknq8J+i9JIGMD2EgS/cYnsQ
   pKuSoDZk0UXZE52mb1ZJs8gjWFMs9gDHY/0sCzJ+myQky1G/3kyZoF7rJ
   ahelKnPQ7AwnrxfSF7QDYTy/ipAr4x1PqPByP8DWtKA/UxoMDoxSK/Cr4
   U=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: gOdAhJx1i83mMobEWzQhwdrkoS6B0Jpc837YhJDDyUNv9KGhyYtWS6dhjv+LfhcMo8inbar1ny
 3YpC4FO/vYi/eU0+tCA37sawA7dQYZRju3U8d3yG2VDMCdKOCTFprcNi9RAciN3nSyfCLP2+4b
 7T1wzhFbo9xjAhNNLV9QraaH4c47CSNBSpgMzi6g35MkOgaZkSU/IIzCKkxma5eSgTfUt3SL1N
 uzwfShoE6uu4fxcQmOdIcraoGGg+u6mVA2cG3+vy/s3FCZ9Y0EABfOGEphNmNLc5C/83hOEMYL
 760=
X-SBRS: None
X-MesageID: 28450333
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,346,1596513600"; 
   d="scan'208";a="28450333"
Subject: Re: [PATCH 3/5] tools/libs/store: drop read-only functionality
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>, Wei Liu <wl@xen.org>
CC: <xen-devel@lists.xenproject.org>, Ian Jackson <iwj@xenproject.org>
References: <20201002154141.11677-1-jgross@suse.com>
 <20201002154141.11677-4-jgross@suse.com>
 <20201007105448.c7scd5hoellddfwd@liuwe-devbox-debian-v2>
 <d03ef7db-8752-ac00-99f1-6c40f62e1162@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <f4b6a87c-ac65-cb3e-d4b2-4504340b81e3@citrix.com>
Date: Wed, 7 Oct 2020 12:50:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <d03ef7db-8752-ac00-99f1-6c40f62e1162@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 FTLPEX02CL05.citrite.net (10.13.108.178)

On 07/10/2020 11:57, Jürgen Groß wrote:
> On 07.10.20 12:54, Wei Liu wrote:
>> On Fri, Oct 02, 2020 at 05:41:39PM +0200, Juergen Gross wrote:
>>> Today it is possible to open the connection in read-only mode via
>>> xs_daemon_open_readonly(). This is working only with Xenstore running
>>> as a daemon in the same domain as the user. Additionally it doesn't
>>> add any security as accessing the socket used for that functionality
>>> requires the same privileges as the socket used for full Xenstore
>>> access.
>>>
>>> So just drop the read-only semantics in all cases, leaving the
>>> interface existing only for compatibility reasons. This in turn
>>> requires to just ignore the XS_OPEN_READONLY flag.
>>>
>>> Signed-off-by: Juergen Gross <jgross@suse.com>
>>> ---
>>>   tools/libs/store/include/xenstore.h | 8 --------
>>>   tools/libs/store/xs.c               | 7 ++-----
>>>   2 files changed, 2 insertions(+), 13 deletions(-)
>>>
>>> diff --git a/tools/libs/store/include/xenstore.h
>>> b/tools/libs/store/include/xenstore.h
>>> index cbc7206a0f..158e69ef83 100644
>>> --- a/tools/libs/store/include/xenstore.h
>>> +++ b/tools/libs/store/include/xenstore.h
>>> @@ -60,15 +60,12 @@ typedef uint32_t xs_transaction_t;
>>>   /* Open a connection to the xs daemon.
>>>    * Attempts to make a connection over the socket interface,
>>>    * and if it fails, then over the  xenbus interface.
>>> - * Mode 0 specifies read-write access, XS_OPEN_READONLY for
>>> - * read-only access.
>>>    *
>>>    * * Connections made with xs_open(0) (which might be shared page or
>>>    *   socket based) are only guaranteed to work in the parent after
>>>    *   fork.
>>>    * * xs_daemon_open*() and xs_domain_open() are deprecated synonyms
>>>    *   for xs_open(0).
>>> - * * XS_OPEN_READONLY has no bearing on any of this.
>>>    *
>>>    * Returns a handle or NULL.
>>>    */
>>> @@ -83,11 +80,6 @@ void xs_close(struct xs_handle *xsh /* NULL ok */);
>>>    */
>>>   struct xs_handle *xs_daemon_open(void);
>>>   struct xs_handle *xs_domain_open(void);
>>> -
>>> -/* Connect to the xs daemon (readonly for non-root clients).
>>> - * Returns a handle or NULL.
>>> - * Deprecated, please use xs_open(XS_OPEN_READONLY) instead
>>> - */
>>>   struct xs_handle *xs_daemon_open_readonly(void);
>>>     /* Close the connection to the xs daemon.
>>> diff --git a/tools/libs/store/xs.c b/tools/libs/store/xs.c
>>> index 320734416f..4ac73ec317 100644
>>> --- a/tools/libs/store/xs.c
>>> +++ b/tools/libs/store/xs.c
>>> @@ -302,7 +302,7 @@ struct xs_handle *xs_daemon_open(void)
>>>     struct xs_handle *xs_daemon_open_readonly(void)
>>>   {
>>> -    return xs_open(XS_OPEN_READONLY);
>>> +    return xs_open(0);
>>>   }
>>
>> This changes the semantics of this function, isn't it? In that the user
>> expects a readonly connection but in fact a read-write connection is
>> returned.
>>
>> Maybe we should return an error here?
>
> No, as the behavior is this way already if any of the following is true:
>
> - a guest is opening the connection
> - Xenstore is running in a stubdom
> - oxenstored is being used

Right, and these are just some of the reasons why dropping the R/O
socket is a sensible thing to do.

However, I do think xenstore.h needs large disclaimers next to the
relevant constants and functions that both XS_OPEN_* flags are now
obsolete and ignored (merged into appropriate patches in the series).

~Andrew

