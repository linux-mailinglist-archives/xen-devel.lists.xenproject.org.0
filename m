Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3275C455110
	for <lists+xen-devel@lfdr.de>; Thu, 18 Nov 2021 00:21:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.227032.392539 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mnUEh-0002dG-5q; Wed, 17 Nov 2021 23:21:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 227032.392539; Wed, 17 Nov 2021 23:21:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mnUEh-0002bS-2f; Wed, 17 Nov 2021 23:21:03 +0000
Received: by outflank-mailman (input) for mailman id 227032;
 Wed, 17 Nov 2021 23:21:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=tBek=QE=srcf.net=amc96@srs-se1.protection.inumbo.net>)
 id 1mnUEg-0002bM-6I
 for xen-devel@lists.xenproject.org; Wed, 17 Nov 2021 23:21:02 +0000
Received: from ppsw-33.csi.cam.ac.uk (ppsw-33.csi.cam.ac.uk [131.111.8.133])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 06d79b8f-47fd-11ec-9787-a32c541c8605;
 Thu, 18 Nov 2021 00:21:01 +0100 (CET)
Received: from hades.srcf.societies.cam.ac.uk ([131.111.179.67]:47600)
 by ppsw-33.csi.cam.ac.uk (ppsw.cam.ac.uk [131.111.8.137]:25)
 with esmtps (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
 id 1mnUEc-000KhY-hQ (Exim 4.95) (return-path <amc96@srcf.net>);
 Wed, 17 Nov 2021 23:20:58 +0000
Received: from [192.168.1.10] (host-92-12-61-86.as13285.net [92.12.61.86])
 (Authenticated sender: amc96)
 by hades.srcf.societies.cam.ac.uk (Postfix) with ESMTPSA id 305C81FBFC;
 Wed, 17 Nov 2021 23:20:58 +0000 (GMT)
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
X-Inumbo-ID: 06d79b8f-47fd-11ec-9787-a32c541c8605
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: https://help.uis.cam.ac.uk/email-scanner-virus
Message-ID: <ab199183-2413-163c-bc28-9d0b3b4627c2@srcf.net>
Date: Wed, 17 Nov 2021 23:20:57 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 5/5] xen/xsm: Address hypercall ABI problems
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 Daniel Smith <dpsmith@apertussolutions.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20211105135555.24261-1-andrew.cooper3@citrix.com>
 <20211105135555.24261-6-andrew.cooper3@citrix.com>
 <e8a9d0bf-c9d7-a1ab-f50d-7ebaffbb3f8a@suse.com>
 <ae979a87-41c0-51ec-db41-6bcc1eaa896f@srcf.net>
From: Andrew Cooper <amc96@srcf.net>
In-Reply-To: <ae979a87-41c0-51ec-db41-6bcc1eaa896f@srcf.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 17/11/2021 23:14, Andrew Cooper wrote:
> On 08/11/2021 09:50, Jan Beulich wrote:
>> On 05.11.2021 14:55, Andrew Cooper wrote:
>>> Currently, __HYPERVISOR_xsm_op enters xsm_ops.do_{xsm,compat}_op() 
>>> which means
>>> that if any other XSM module registers a handler, we'll break the 
>>> hypercall
>>> ABI totally by having the behaviour depend on the selected XSM module.
>>>
>>> There are 2 options:
>>>   1) Rename __HYPERVISOR_xsm_op to __HYPERVISOR_flask_op.  If 
>>> another XSM
>>>      module wants hypercalls, they'll have to introduce a new top-level
>>>      hypercall.
>>>   2) Make the current flask_op() be common, and require new 
>>> hypercalls to fit
>>>      compatibly with xen_flask_op_t.  This can be done fairly easily by
>>>      subdividing the .cmd space.
>>>
>>> In this patch, we implement option 2.
>>>
>>> Move the stub {do,compat}_xsm_op() implementation into a new 
>>> xsm_op.c so we
>>> can more easily do multi-inclusion compat magic.  Also add a new 
>>> private.h,
>>> because flask/hook.c's local declaration of {do,compat}_flask_op() 
>>> wasn't
>>> remotely safe.
>>>
>>> The top level now dispatches into {do,compat}_flask_op() based on 
>>> op.cmd, and
>>> handles the primary copy in/out.
>> I'm not convinced this is the only reasonable way of implementing 2).
>> I could also see number space to be separated in different ways, ...
>>
>>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>>> ---
>>> CC: Daniel De Graaf <dgdegra@tycho.nsa.gov>
>>> CC: Daniel Smith <dpsmith@apertussolutions.com>
>>>
>>> Only lightly tested.  Slightly RFC.  There are several things which 
>>> aren't
>>> great, but probably want addressing in due course.
>>>
>>>   1) The public headers probably want to lose the flask name (in a 
>>> compatible
>>>      way), now that the hypercall is common.  This probably wants to be
>>>      combined with no longer taking a void handle.
>> ... leaving per-module public headers and perhaps merely adding an
>> abstracting
>>
>> struct xen_xsm_op_t {
>>      uint32_t op;
>>      ... /* placeholder */
>> };
>>
>> or (making explicit one possible variant of number space splitting)
>>
>> union xen_xsm_op_t {
>>      uint32_t op;
>>      struct {
>>          uint16_t cmd;
>>          uint16_t mod;
>>      } u;
>>      ... /* placeholder */
>> };
>>
>> in, say, a new public/xsm.h.
>
> That doesn't work.  The ABI is fixed at sizeof(xen_flask_op_t) for all 
> other modules, because a caller which doesn't know which module is in 
> use must not have Xen over-read/write the object passed while it's 
> trying to figure things out.
>
>> As a result I consider this change either going too far (because of
>> not knowing future needs) or not far enough (by e.g. leaving
>> do_xsm_op() to use xen_flask_op_t.
>
> Well - what it does is prevent someone from breaking the ABI with 
> literally this patch
>
> diff --git a/xen/xsm/silo.c b/xen/xsm/silo.c
> index 3550dded7b4e..36b82fd3bd3e 100644
> --- a/xen/xsm/silo.c
> +++ b/xen/xsm/silo.c
> @@ -100,6 +100,11 @@ static int silo_argo_send(const struct domain 
> *d1, const struct domain *d2)
>
>  #endif
>
> +static long silo_do_xsm_op(XEN_GUEST_HANDLE_PARAM(void) op)
> +{
> +    /* ... */
> +}
> +
>  static const struct xsm_ops __initconstrel silo_xsm_ops = {
>      .evtchn_unbound = silo_evtchn_unbound,
>      .evtchn_interdomain = silo_evtchn_interdomain,
> @@ -110,6 +115,7 @@ static const struct xsm_ops __initconstrel 
> silo_xsm_ops = {
>      .argo_register_single_source = silo_argo_register_single_source,
>      .argo_send = silo_argo_send,
>  #endif
> +    .do_xsm_op = silo_do_xsm_op,
>  };
>
>  const struct xsm_ops *__init silo_init(void)
>
>
> This is a damage limitation patch, but without knowing how the next 
> module is going to want to do hypercalls differently, it is rather 
> hard to judge what is appropriate.  I certainly didn't waste much time 
> thinking about it.
>
>>
>>>   2) {do,compat}_xsm_op() are currently identical other than the 
>>> dispatched-to
>>>      functions because the size of xsm_flask_op_t is invariant with
>>>      COMPAT-ness.  We could simplfy things by only having one, and 
>>> dispatching
>>>      to {do,compat}_*_op() directly, but I'm not sure whether the 
>>> complexity is
>>>      worth it.
>> Perhaps not, I would say, not the least because (as said above) I
>> think we shouldn't put in place restrictions which may get in the
>> way of adding some future module.
>>
>> Extending struct xen_flask_op to become a generic XSM interface
>> structure (or even just for Flask's own purposes) also is not as
>> straightforward as it might seem: There's currently no provision
>> for sub-structs which would grow the overall size of the structure:
>> The copy_{to,from}_guest() invocations for existing sub-ops may not
>> copy more that the present worth of sizeof(struct xen_flask_op).
>> Yet your implementation of do_xsm_op() moves this deficiency from
>> Flask to XSM.
>
> Deficiency yes, but necessary to avoid breaking the ABI for caller 
> which doesn't know which module is in use.  This cannot be fixed 
> without swapping to approach 1.
>
>>>   3) Bloat-o-meter says these changes add 16 extra bytes to dm_op() 
>>> and I can't
>>>      figure out what could possibly be causing this.
>> Without comparing the object files in closer detail it's guesswork,
>> but might this be register scheduling differences resulting from
>> the changed sizeof(struct xsm_ops)? I've been observing similar
>> seemingly unmotivated changes to generated code ...
>
> The only thing it can plausibly be is a knock-on effect from the 
> structure of xsm_ops changing.
>
> Normally, I wouldn't be to surprised to see some displacement fields 
> dropping from 4 to 1 byte as xsm_ops is getting smaller, but 
> everything is alt_call()'d up so should be a 7-byte `call *disp32(%rip)`.
>
>>> --- a/xen/xsm/flask/flask_op.c
>>> +++ b/xen/xsm/flask/flask_op.c
>>> @@ -22,6 +22,8 @@
>>>   #include <objsec.h>
>>>   #include <conditional.h>
>>>   +#include "../private.h"
>> Kind of odd: I'd expect a file named such to not get included
>> across directory levels, unless a single component was split in
>> such a way (to me Flask and XSM core are separate, yet still
>> related components).
>
> Its all a tangled mess because logically separating XSM and Flask was 
> a task done when SILO was introduced.
>
> There is not an appropriately located file (under xen/xsm/ ) where the 
> prototypes could reasonably live, and this felt like the lesser of the 
> available evils.

I guess it is worth adding, so we're all on the same page.

The thing I actually need to do is fix the fact that the prototypes for 
{do,compat}_flask_op() are local in xen/xsm/flask/hooks.c and not in a 
header shared with xen/xsm/flask/flask_op.c.

The thing I wanted to do is stop it being so trivially easy to break the 
ABI with a 5-line patch.


Any bikeshedding beyond that can happen in due course.

~Andrew

