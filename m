Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 649D73AD03B
	for <lists+xen-devel@lfdr.de>; Fri, 18 Jun 2021 18:18:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.144832.266526 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1luHC1-0001dG-Oc; Fri, 18 Jun 2021 16:18:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 144832.266526; Fri, 18 Jun 2021 16:18:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1luHC1-0001aS-Kw; Fri, 18 Jun 2021 16:18:05 +0000
Received: by outflank-mailman (input) for mailman id 144832;
 Fri, 18 Jun 2021 16:18:04 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UjTI=LM=apertussolutions.com=dpsmith@srs-us1.protection.inumbo.net>)
 id 1luHC0-0001aM-2L
 for xen-devel@lists.xenproject.org; Fri, 18 Jun 2021 16:18:04 +0000
Received: from sender4-of-o51.zoho.com (unknown [136.143.188.51])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 65a7c35b-948c-4a08-bd48-10dcef48dec0;
 Fri, 18 Jun 2021 16:18:02 +0000 (UTC)
Received: from [10.10.1.24] (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 1624033060676206.71396478217548;
 Fri, 18 Jun 2021 09:17:40 -0700 (PDT)
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
X-Inumbo-ID: 65a7c35b-948c-4a08-bd48-10dcef48dec0
ARC-Seal: i=1; a=rsa-sha256; t=1624033063; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=SVY7lzYI+Eh7+hr/K2mSbWdkEF25BqhzEJx8wfVRbvPeCX/qBUPi+C3Z3oK3bZSY+6zkpxEI3tE3jgHsA3YcCPIv+shRD9W/C54YuMV0G2jlcop3xHERDyvoIKITJWefcPMJVbntTv9Q40YjoVM1XkbFbtyWXTlQOCwhA7yp4jE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1624033063; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=IVB4Qr50UvnbQI3LXiJt1lhd6SJ2NfYMvK8xQdCWmtM=; 
	b=NPeRghH30tz16mMJZaNMFe32EnxbjT1Q8koqbZcmSrcs97dAs0uNZjuyVQOGgqkfYnT1pCLpswoLHPFL4jpt6NLwheBmoYZ/G0M1Q6zr2inDXJoMn9M/SV4lnX/Gj8yQbnZyLSk7W63tlpOi69v5pRS/DhmgVOs2jNYcN9D9Ico=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1624033063;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=To:Cc:References:From:Subject:Message-ID:Date:MIME-Version:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=IVB4Qr50UvnbQI3LXiJt1lhd6SJ2NfYMvK8xQdCWmtM=;
	b=OnLuvlcNs3XJJd8KtdjGCb9fgEQkl/Wx/C10auXC0+ELvJvxVqKgUiUoMKyAvtnt
	sI0soJAhlP7EH2qP4oHONz/49Cr34hr0PHLp4HbQXImsJ1fna8cyW+ZHWUUUleXfHs4
	LXEKUqw0sit3eMkyqtC3SDsT+3RWXqatdeRXwilo=
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Tamas K Lengyel <tamas@tklengyel.com>, Tim Deegan <tim@xen.org>,
 Juergen Gross <jgross@suse.com>, Alexandru Isaila <aisaila@bitdefender.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>,
 Dario Faggioli <dfaggioli@suse.com>, Paul Durrant <paul@xen.org>,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>, persaur@gmail.com,
 christopher.w.clark@gmail.com, adam.schwalm@starlab.io,
 scott.davis@starlab.io
References: <20210617233918.10095-1-dpsmith@apertussolutions.com>
 <20210617233918.10095-2-dpsmith@apertussolutions.com>
 <07566583-d4bc-dfb8-eccd-d779783d959a@citrix.com>
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Subject: Re: [PATCH 1/6] xsm: refactor xsm_ops handling
Message-ID: <09b506df-3b4b-45f1-5503-ffd44f31a902@apertussolutions.com>
Date: Fri, 18 Jun 2021 12:17:37 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <07566583-d4bc-dfb8-eccd-d779783d959a@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

On 6/18/21 7:34 AM, Andrew Cooper wrote:
> On 18/06/2021 00:39, Daniel P. Smith wrote:
>> The assignment and setup of xsm_ops structure was refactored to make it a
>> one-time assignment. The calling of the xsm_ops were refactored to use the
>> alternate_call framework to reduce the need for retpolines.
>>
>> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
> 
> I think the commit message needs a little more explanation for anyone
> doing code archaeology.
> 
> AFAICT, the current infrastructure has some (incomplete?) support for
> Flask to unload itself as the security engine, which doesn't sounds like
> a clever thing in general.
> 
> What we do here is make a semantic change to say that the security
> engine (Dummy, Flask or SILO) gets chosen once during boot, and is
> immutable thereafter.  This is better from a security standpoint (no
> accidentally unloading Flask at runtime), and allows for the use of the
> alternative_vcall() infrastructure to drop all the function pointer calls.
> 
> Does that about sum things up?

ack

>> diff --git a/xen/xsm/flask/flask_op.c b/xen/xsm/flask/flask_op.c
>> index 01e52138a1..df9fcc1d6d 100644
>> --- a/xen/xsm/flask/flask_op.c
>> +++ b/xen/xsm/flask/flask_op.c
>> @@ -225,26 +225,7 @@ static int flask_security_sid(struct xen_flask_sid_context *arg)
>>  
>>  static int flask_disable(void)
>>  {
>> -    static int flask_disabled = 0;
>> -
>> -    if ( ss_initialized )
>> -    {
>> -        /* Not permitted after initial policy load. */
>> -        return -EINVAL;
>> -    }
>> -
>> -    if ( flask_disabled )
>> -    {
>> -        /* Only do this once. */
>> -        return -EINVAL;
>> -    }
>> -
>> -    printk("Flask:  Disabled at runtime.\n");
>> -
>> -    flask_disabled = 1;
>> -
>> -    /* Reset xsm_ops to the original module. */
>> -    xsm_ops = &dummy_xsm_ops;
>> +    printk("Flask:  Disabling is not supported.\n");
> 
> Judging by this, should this patch be split up more?
> 
> I think you want to remove FLASK_DISABLE (and this function too - just
> return -EOPNOTSUPP in the parent) as a separate explained change (as it
> is a logical change in how Flask works).
> 
> The second patch wants to be the rest, which changes the indirection of
> xsm_ops and converts to vcall().  This is a fairly mechanical change
> without semantic changes.
> 
> I'm unsure if you want a 3rd patch in the middle, separating the
> xsm_core_init() juggling, with the "switch to using vcall()".  It might
> be a good idea for more easily demonstrating the changes, but I'll leave
> it to your judgement.
> 
>> diff --git a/xen/xsm/xsm_core.c b/xen/xsm/xsm_core.c
>> index 5eab21e1b1..acc1af7166 100644
>> --- a/xen/xsm/xsm_core.c
>> +++ b/xen/xsm/xsm_core.c
>>  static int __init xsm_core_init(const void *policy_buffer, size_t policy_size)
>>  {
>>  #ifdef CONFIG_XSM_FLASK_POLICY
>> @@ -87,17 +86,22 @@ static int __init xsm_core_init(const void *policy_buffer, size_t policy_size)
>>      }
>>  #endif
>>  
>> -    if ( verify(&dummy_xsm_ops) )
>> +    if ( xsm_ops_registered != XSM_OPS_UNREGISTERED )
>>      {
>> -        printk(XENLOG_ERR "Could not verify dummy_xsm_ops structure\n");
>> +        printk(XENLOG_ERR
>> +            "Could not init XSM, xsm_ops register already attempted\n");
> 
> Indentation.
ack

>>          return -EIO;
>>      }
>>  
>> -    xsm_ops = &dummy_xsm_ops;
>> +    /* install the dummy ops as default to ensure ops
>> +     * are defined if requested policy fails init
>> +     */
>> +    xsm_fixup_ops(&xsm_ops);
> 
> /* Comment style. */
> 
> or
> 
> /*
>  * Multi-
>  * line comment style.
>  */

ack

>>      switch ( xsm_bootparam )
>>      {
>>      case XSM_BOOTPARAM_DUMMY:
>> +        xsm_ops_registered = XSM_OPS_REGISTERED;
>>          break;
>>  
>>      case XSM_BOOTPARAM_FLASK:
>> @@ -113,6 +117,9 @@ static int __init xsm_core_init(const void *policy_buffer, size_t policy_size)
>>          break;
>>      }
>>  
>> +    if ( xsm_ops_registered != XSM_OPS_REGISTERED )
>> +        xsm_ops_registered = XSM_OPS_REG_FAILED;
>> +
>>      return 0;
>>  }
>>  
>> @@ -197,16 +204,21 @@ bool __init has_xsm_magic(paddr_t start)
>>  
>>  int __init register_xsm(struct xsm_operations *ops)
>>  {
>> -    if ( verify(ops) )
>> +    if ( xsm_ops_registered != XSM_OPS_UNREGISTERED )
>> +        return -EAGAIN;
> 
> I know you moved this around the function, but it really isn't -EAGAIN
> material any more.  It's "too late - nope".
> 
> -EEXIST is probably best for "I'm never going to tolerate another call".

Honestly I didn't think EAGAIN was correct in the first place, so will
gladly change it.

>> +
>> +    if ( !ops )
>>      {
>> -        printk(XENLOG_ERR "Could not verify xsm_operations structure\n");
>> +        xsm_ops_registered = XSM_OPS_REG_FAILED;
>> +        printk(XENLOG_ERR "Invalid xsm_operations structure registered\n");
>>          return -EINVAL;
> 
> Honestly, I'd be half tempted to declare register_xsm() with
> __nonnull(0) and let the compiler reject any attempt to pass a NULL ops
> pointer.
> 
> Both callers pass a pointer to a static singleton objects.
> 
>>      }
>>  
>> -    if ( xsm_ops != &dummy_xsm_ops )
>> -        return -EAGAIN;
>> +    /* use dummy ops for any empty ops */
>> +    xsm_fixup_ops(ops);
> 
> Isn't this redundant with the call in xsm_core_init(), seeing as
> register_xsm() must be nested within the switch statement?

I don't believe so, the one in xsm_core_init is setting the
default/fallback of xsm_ops var to dummy_* before attempting to register
a policy module's ops. Here in register_xsm we are taking a new instance
of a struct xsm_ops and ensuring every handler has a defined entry
before overwriting the xsm_ops variable with passed in xsm module's ops.
Now with that said, I do like your suggest down at the end.

>> -    xsm_ops = ops;
>> +    xsm_ops = *ops;
>> +    xsm_ops_registered = XSM_OPS_REGISTERED;
>>  
>>      return 0;
>>  }
> 
> Having got to the end, the xsm_core_init() vs register_xsm() dynamic is
> quite weird.
> 
> I think it would result in clearer code to have init_{flask,silo}()
> return pointers to their struct xsm_operations *, and let
> xsm_core_init() do the copy in to xsm_ops.  This reduces the scope of
> xsm_ops_state to this function only, and gets rid of at least one
> runtime panic() call which is dead code.

I agree full.

> If you were to go with this approach, you'd definitely want to split
> into the 3-patch approach.

v2 will have this broken out

v/r,
dps


