Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 15D781CD289
	for <lists+xen-devel@lfdr.de>; Mon, 11 May 2020 09:26:55 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jY2p9-0003Pe-Le; Mon, 11 May 2020 07:26:03 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4Y5i=6Z=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jY2p8-0003PZ-Iz
 for xen-devel@lists.xenproject.org; Mon, 11 May 2020 07:26:02 +0000
X-Inumbo-ID: a9d470fc-9358-11ea-a1f3-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a9d470fc-9358-11ea-a1f3-12813bfff9fa;
 Mon, 11 May 2020 07:26:00 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 0D896B32A;
 Mon, 11 May 2020 07:26:02 +0000 (UTC)
Subject: Re: [PATCH v8 08/12] x86emul: support FLDENV and FRSTOR
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <60cc730f-2a1c-d7a6-74fe-64f3c9308831@suse.com>
 <09fe2c18-0037-af71-93be-87261051e2a2@suse.com>
 <20200508133720.GH1353@Air-de-Roger>
 <4b6f4353-066e-351d-597d-4455193ff95f@suse.com>
 <a8342bf8-d866-b507-9420-0384545e9a4f@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <dece70e0-3140-eb4a-b6c7-0bf904cb6f2a@suse.com>
Date: Mon, 11 May 2020 09:25:54 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <a8342bf8-d866-b507-9420-0384545e9a4f@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
 Wei Liu <wl@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 08.05.2020 20:29, Andrew Cooper wrote:
> On 08/05/2020 16:04, Jan Beulich wrote:
>>>> +            }
>>>> +
>>>> +            if ( bytes == sizeof(fpstate.env) )
>>>> +                ptr = NULL;
>>>> +            else
>>>> +                ptr += sizeof(fpstate.env);
>>>> +            break;
>>>> +
>>>> +        case sizeof(struct x87_env16):
>>>> +        case sizeof(struct x87_env16) + sizeof(fpstate.freg):
>>>> +        {
>>>> +            const struct x87_env16 *env = ptr;
>>>> +
>>>> +            fpstate.env.fcw = env->fcw;
>>>> +            fpstate.env.fsw = env->fsw;
>>>> +            fpstate.env.ftw = env->ftw;
>>>> +
>>>> +            if ( state->rex_prefix )
>>>> +            {
>>>> +                fpstate.env.mode.prot.fip = env->mode.prot.fip;
>>>> +                fpstate.env.mode.prot.fcs = env->mode.prot.fcs;
>>>> +                fpstate.env.mode.prot.fdp = env->mode.prot.fdp;
>>>> +                fpstate.env.mode.prot.fds = env->mode.prot.fds;
>>>> +                fpstate.env.mode.prot.fop = 0; /* unknown */
>>>> +            }
>>>> +            else
>>>> +            {
>>>> +                unsigned int fip = env->mode.real.fip_lo +
>>>> +                                   (env->mode.real.fip_hi << 16);
>>>> +                unsigned int fdp = env->mode.real.fdp_lo +
>>>> +                                   (env->mode.real.fdp_hi << 16);
>>>> +                unsigned int fop = env->mode.real.fop;
>>>> +
>>>> +                fpstate.env.mode.prot.fip = fip & 0xf;
>>>> +                fpstate.env.mode.prot.fcs = fip >> 4;
>>>> +                fpstate.env.mode.prot.fop = fop;
>>>> +                fpstate.env.mode.prot.fdp = fdp & 0xf;
>>>> +                fpstate.env.mode.prot.fds = fdp >> 4;
>>> This looks mostly the same as the translation done above, so maybe
>>> could be abstracted anyway in a macro to avoid the code repetition?
>>> (ie: fpstate_real_to_prot(src, dst) or some such).
>> Just the 5 assignments could be put in an inline function, but
>> if we also wanted to abstract away the declarations with their
>> initializers, it would need to be a macro because of the
>> different types of fpstate.env and *env. While I'd generally
>> prefer inline functions, the macro would have the benefit that
>> it could be #define-d / #undef-d right inside this case block.
>> Thoughts?
> 
> Code like this is large in terms of volume, but it is completely crystal
> clear (with the requested comments in place) and easy to follow.
> 
> I don't see how attempting to abstract out two small portions is going
> to be an improvement.

Okay, easier for me if I don't need to touch it. Roger, can you
live with that?

Jan

