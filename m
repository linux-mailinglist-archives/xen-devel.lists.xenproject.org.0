Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D1E662F9C43
	for <lists+xen-devel@lfdr.de>; Mon, 18 Jan 2021 11:19:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.69536.124515 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l1RdB-0002vp-6h; Mon, 18 Jan 2021 10:19:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 69536.124515; Mon, 18 Jan 2021 10:19:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l1RdB-0002vP-0K; Mon, 18 Jan 2021 10:19:29 +0000
Received: by outflank-mailman (input) for mailman id 69536;
 Mon, 18 Jan 2021 10:19:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hh0t=GV=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1l1Rd8-0002vF-VF
 for xen-devel@lists.xenproject.org; Mon, 18 Jan 2021 10:19:27 +0000
Received: from mail-lf1-x12e.google.com (unknown [2a00:1450:4864:20::12e])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9845041d-d216-427f-a107-8639f9db0bb1;
 Mon, 18 Jan 2021 10:19:25 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id o10so23223813lfl.13
 for <xen-devel@lists.xenproject.org>; Mon, 18 Jan 2021 02:19:25 -0800 (PST)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id x8sm1856794lfn.226.2021.01.18.02.19.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Jan 2021 02:19:23 -0800 (PST)
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
X-Inumbo-ID: 9845041d-d216-427f-a107-8639f9db0bb1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=J+di/XmrrIIzm8NKYbzL1twpsaOXI2maXaiCcK3sKM4=;
        b=h4PDQACGQW3AA2V9wnAf62G2wMt0+vwGMlQwWJe2t9yw5FpE6gKIQYxmaWuLQJxg0p
         PbqlJ+8wkx+aJOKUtKTQFyqGm4FlzX442V6iokXgHH25SlDZUooWaHpfC+G3kmy91Jrd
         MvG7rZawyL4IK2H2IPzx5v9a+QJ3ggZfHq0vE+psUniXiTW2t4yIkaa7bRlDvNe8Qq9G
         YlPSw1HjYcsHskRyicDfl5czZZ+U/TAM/bZxy9Xxpxk6wWk1HqiJa17kmFhCM4FQCya5
         vy5sxHeFb9UBrbWEbIJc2NnCB01XHtcKWgZyx2T6yLvJEFKBy/MMvobBiR1Xg/VZF+ZY
         xFSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=J+di/XmrrIIzm8NKYbzL1twpsaOXI2maXaiCcK3sKM4=;
        b=gvs3ju980mSsPWbgP9q7Z3SqvVU2dLSzwYPdXonWbUU15+SwYXh0baqS8RAEbi7+wi
         llioMQaGdJWKEIjE9u5bNHPCwRa38H9ryxZ5XY/C+IAxsMMYQOXTRzEasdEkHJJV79+n
         qMWCm7Z5fXcHg2b8HVcBzLtx1bsb8m0dmK771yYm2lw1LLrC14ntisFYd7sKu/YhjwVb
         axgU4CQ6dKC6m4jLs47ZLgNrTKSnxM265mHKCDyzYEKkA65HcOtOaCAZlnWHmSEXfoHT
         3GRvvE3o/JycDQnbGScUnYLkkHM86FT+dZuu1C8J3xGFqs+/FV/DAFSX1CU/EGGZ2uVB
         WgwA==
X-Gm-Message-State: AOAM530yV5R3ZPc1UxJ5pTMKKpIqCgB7J9xpNd6Hl7ScjMCxxNEVD2CS
	wMM1QyMXdUtrjDvWTBh7mKE=
X-Google-Smtp-Source: ABdhPJx8x7crBNpvgsl4gVTmO3HqqvZXNhNEo+LgOLwJwCeTfuuZRWJWnr1GSpw6JEbXr7AlObJj7g==
X-Received: by 2002:a19:c309:: with SMTP id t9mr11283267lff.46.1610965163966;
        Mon, 18 Jan 2021 02:19:23 -0800 (PST)
Subject: Re: [PATCH V4 09/24] xen/ioreq: Make x86's IOREQ related dm-op
 handling common
To: paul@xen.org
Cc: xen-devel@lists.xenproject.org, 'Julien Grall' <julien.grall@arm.com>,
 'Jan Beulich' <jbeulich@suse.com>,
 'Andrew Cooper' <andrew.cooper3@citrix.com>,
 =?UTF-8?B?J1JvZ2VyIFBhdSBNb25uw6kn?= <roger.pau@citrix.com>,
 'Wei Liu' <wl@xen.org>, 'George Dunlap' <george.dunlap@citrix.com>,
 'Ian Jackson' <iwj@xenproject.org>, 'Julien Grall' <julien@xen.org>,
 'Stefano Stabellini' <sstabellini@kernel.org>,
 'Daniel De Graaf' <dgdegra@tycho.nsa.gov>,
 'Oleksandr Tyshchenko' <oleksandr_tyshchenko@epam.com>
References: <1610488352-18494-1-git-send-email-olekstysh@gmail.com>
 <1610488352-18494-10-git-send-email-olekstysh@gmail.com>
 <00c301d6ed7a$aeeb5660$0cc20320$@xen.org>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <415a6457-546c-3c58-31ae-da368fcea1e4@gmail.com>
Date: Mon, 18 Jan 2021 12:19:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <00c301d6ed7a$aeeb5660$0cc20320$@xen.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US


On 18.01.21 11:17, Paul Durrant wrote:

Hi Paul



>> -----Original Message-----
>> From: Xen-devel <xen-devel-bounces@lists.xenproject.org> On Behalf Of Oleksandr Tyshchenko
>> Sent: 12 January 2021 21:52
>> To: xen-devel@lists.xenproject.org
>> Cc: Julien Grall <julien.grall@arm.com>; Jan Beulich <jbeulich@suse.com>; Andrew Cooper
>> <andrew.cooper3@citrix.com>; Roger Pau Monné <roger.pau@citrix.com>; Wei Liu <wl@xen.org>; George
>> Dunlap <george.dunlap@citrix.com>; Ian Jackson <iwj@xenproject.org>; Julien Grall <julien@xen.org>;
>> Stefano Stabellini <sstabellini@kernel.org>; Paul Durrant <paul@xen.org>; Daniel De Graaf
>> <dgdegra@tycho.nsa.gov>; Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>> Subject: [PATCH V4 09/24] xen/ioreq: Make x86's IOREQ related dm-op handling common
>>
>> From: Julien Grall <julien.grall@arm.com>
>>
>> As a lot of x86 code can be re-used on Arm later on, this patch
>> moves the IOREQ related dm-op handling to the common code.
>>
>> The idea is to have the top level dm-op handling arch-specific
>> and call into ioreq_server_dm_op() for otherwise unhandled ops.
>> Pros:
>> - More natural than doing it other way around (top level dm-op
>> handling common).
>> - Leave compat_dm_op() in x86 code.
>> Cons:
>> - Code duplication. Both arches have to duplicate do_dm_op(), etc.
>>
>> Also update XSM code a bit to let dm-op be used on Arm.
>>
>> This support is going to be used on Arm to be able run device
>> emulator outside of Xen hypervisor.
>>
>> Signed-off-by: Julien Grall <julien.grall@arm.com>
>> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>> [On Arm only]
>> Tested-by: Wei Chen <Wei.Chen@arm.com>
>>
>> ---
>> Please note, this is a split/cleanup/hardening of Julien's PoC:
>> "Add support for Guest IO forwarding to a device emulator"
>>
>> ***
>> I decided to leave common dm.h to keep struct dmop_args declaration
>> (to be included by Arm's dm.c), alternatively we could avoid
>> introducing new header by moving the declaration into the existing
>> header, but failed to find a suitable one which context would fit.
>> ***
>>
>> Changes RFC -> V1:
>>     - update XSM, related changes were pulled from:
>>       [RFC PATCH V1 04/12] xen/arm: Introduce arch specific bits for IOREQ/DM features
>>
>> Changes V1 -> V2:
>>     - update the author of a patch
>>     - update patch description
>>     - introduce xen/dm.h and move definitions here
>>
>> Changes V2 -> V3:
>>     - no changes
>>
>> Changes V3 -> V4:
>>     - rework to have the top level dm-op handling arch-specific
>>     - update patch subject/description, was "xen/dm: Make x86's DM feature common"
>>     - make a few functions static in common ioreq.c
>> ---
>>   xen/arch/x86/hvm/dm.c   | 101 +-----------------------------------
>>   xen/common/ioreq.c      | 135 ++++++++++++++++++++++++++++++++++++++++++------
>>   xen/include/xen/dm.h    |  39 ++++++++++++++
>>   xen/include/xen/ioreq.h |  17 +-----
>>   xen/include/xsm/dummy.h |   4 +-
>>   xen/include/xsm/xsm.h   |   6 +--
>>   xen/xsm/dummy.c         |   2 +-
>>   xen/xsm/flask/hooks.c   |   5 +-
>>   8 files changed, 171 insertions(+), 138 deletions(-)
>>   create mode 100644 xen/include/xen/dm.h
>>
>> diff --git a/xen/arch/x86/hvm/dm.c b/xen/arch/x86/hvm/dm.c
>> index d3e2a9e..dc8e47d 100644
>> --- a/xen/arch/x86/hvm/dm.c
>> +++ b/xen/arch/x86/hvm/dm.c
>> @@ -16,6 +16,7 @@
>>
>>   #include <xen/event.h>
>>   #include <xen/guest_access.h>
>> +#include <xen/dm.h>
>>   #include <xen/hypercall.h>
>>   #include <xen/ioreq.h>
>>   #include <xen/nospec.h>
>> @@ -29,13 +30,6 @@
>>
>>   #include <public/hvm/hvm_op.h>
>>
>> -struct dmop_args {
>> -    domid_t domid;
>> -    unsigned int nr_bufs;
>> -    /* Reserve enough buf elements for all current hypercalls. */
>> -    struct xen_dm_op_buf buf[2];
>> -};
>> -
>>   static bool _raw_copy_from_guest_buf_offset(void *dst,
>>                                               const struct dmop_args *args,
>>                                               unsigned int buf_idx,
>> @@ -408,71 +402,6 @@ static int dm_op(const struct dmop_args *op_args)
>>
>>       switch ( op.op )
>>       {
>> -    case XEN_DMOP_create_ioreq_server:
>> -    {
>> -        struct xen_dm_op_create_ioreq_server *data =
>> -            &op.u.create_ioreq_server;
>> -
>> -        const_op = false;
>> -
>> -        rc = -EINVAL;
>> -        if ( data->pad[0] || data->pad[1] || data->pad[2] )
>> -            break;
>> -
>> -        rc = hvm_create_ioreq_server(d, data->handle_bufioreq,
>> -                                     &data->id);
>> -        break;
>> -    }
>> -
>> -    case XEN_DMOP_get_ioreq_server_info:
>> -    {
>> -        struct xen_dm_op_get_ioreq_server_info *data =
>> -            &op.u.get_ioreq_server_info;
>> -        const uint16_t valid_flags = XEN_DMOP_no_gfns;
>> -
>> -        const_op = false;
>> -
>> -        rc = -EINVAL;
>> -        if ( data->flags & ~valid_flags )
>> -            break;
>> -
>> -        rc = hvm_get_ioreq_server_info(d, data->id,
>> -                                       (data->flags & XEN_DMOP_no_gfns) ?
>> -                                       NULL : &data->ioreq_gfn,
>> -                                       (data->flags & XEN_DMOP_no_gfns) ?
>> -                                       NULL : &data->bufioreq_gfn,
>> -                                       &data->bufioreq_port);
>> -        break;
>> -    }
>> -
>> -    case XEN_DMOP_map_io_range_to_ioreq_server:
>> -    {
>> -        const struct xen_dm_op_ioreq_server_range *data =
>> -            &op.u.map_io_range_to_ioreq_server;
>> -
>> -        rc = -EINVAL;
>> -        if ( data->pad )
>> -            break;
>> -
>> -        rc = hvm_map_io_range_to_ioreq_server(d, data->id, data->type,
>> -                                              data->start, data->end);
>> -        break;
>> -    }
>> -
>> -    case XEN_DMOP_unmap_io_range_from_ioreq_server:
>> -    {
>> -        const struct xen_dm_op_ioreq_server_range *data =
>> -            &op.u.unmap_io_range_from_ioreq_server;
>> -
>> -        rc = -EINVAL;
>> -        if ( data->pad )
>> -            break;
>> -
>> -        rc = hvm_unmap_io_range_from_ioreq_server(d, data->id, data->type,
>> -                                                  data->start, data->end);
>> -        break;
>> -    }
>> -
>>       case XEN_DMOP_map_mem_type_to_ioreq_server:
>>       {
>>           struct xen_dm_op_map_mem_type_to_ioreq_server *data =
>> @@ -523,32 +452,6 @@ static int dm_op(const struct dmop_args *op_args)
>>           break;
>>       }
>>
>> -    case XEN_DMOP_set_ioreq_server_state:
>> -    {
>> -        const struct xen_dm_op_set_ioreq_server_state *data =
>> -            &op.u.set_ioreq_server_state;
>> -
>> -        rc = -EINVAL;
>> -        if ( data->pad )
>> -            break;
>> -
>> -        rc = hvm_set_ioreq_server_state(d, data->id, !!data->enabled);
>> -        break;
>> -    }
>> -
>> -    case XEN_DMOP_destroy_ioreq_server:
>> -    {
>> -        const struct xen_dm_op_destroy_ioreq_server *data =
>> -            &op.u.destroy_ioreq_server;
>> -
>> -        rc = -EINVAL;
>> -        if ( data->pad )
>> -            break;
>> -
>> -        rc = hvm_destroy_ioreq_server(d, data->id);
>> -        break;
>> -    }
>> -
>>       case XEN_DMOP_track_dirty_vram:
>>       {
>>           const struct xen_dm_op_track_dirty_vram *data =
>> @@ -703,7 +606,7 @@ static int dm_op(const struct dmop_args *op_args)
>>       }
>>
>>       default:
>> -        rc = -EOPNOTSUPP;
>> +        rc = ioreq_server_dm_op(&op, d, &const_op);
>>           break;
>>       }
>>
>> diff --git a/xen/common/ioreq.c b/xen/common/ioreq.c
>> index a319c88..72b5da0 100644
>> --- a/xen/common/ioreq.c
>> +++ b/xen/common/ioreq.c
>> @@ -591,8 +591,8 @@ static void hvm_ioreq_server_deinit(struct ioreq_server *s)
>>       put_domain(s->emulator);
>>   }
>>
>> -int hvm_create_ioreq_server(struct domain *d, int bufioreq_handling,
>> -                            ioservid_t *id)
>> +static int hvm_create_ioreq_server(struct domain *d, int bufioreq_handling,
>> +                                   ioservid_t *id)
> Would this not be a good opportunity to drop the 'hvm_' prefix (here and elsewhere)?

It would be, I will drop.


May I ask, are you ok with that alternative approach proposed by Jan and 
already implemented in current version (top level dm-op handling 
arch-specific
and call into ioreq_server_dm_op() for otherwise unhandled ops)?

Initial discussion here:
https://lore.kernel.org/xen-devel/1606732298-22107-10-git-send-email-olekstysh@gmail.com/

-- 
Regards,

Oleksandr Tyshchenko


