Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D768C986648
	for <lists+xen-devel@lfdr.de>; Wed, 25 Sep 2024 20:29:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.804504.1215500 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stWkq-0001gH-0D; Wed, 25 Sep 2024 18:28:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 804504.1215500; Wed, 25 Sep 2024 18:28:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stWkp-0001dV-Sv; Wed, 25 Sep 2024 18:28:47 +0000
Received: by outflank-mailman (input) for mailman id 804504;
 Wed, 25 Sep 2024 18:28:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lFoA=QX=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1stWkp-0001dP-7p
 for xen-devel@lists.xenproject.org; Wed, 25 Sep 2024 18:28:47 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ff9870d1-7b6b-11ef-99a2-01e77a169b0f;
 Wed, 25 Sep 2024 20:28:45 +0200 (CEST)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-a8d6ac24a3bso32839266b.1
 for <xen-devel@lists.xenproject.org>; Wed, 25 Sep 2024 11:28:45 -0700 (PDT)
Received: from [10.125.226.166] ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a93930caeaesm238836166b.115.2024.09.25.11.28.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Sep 2024 11:28:44 -0700 (PDT)
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
X-Inumbo-ID: ff9870d1-7b6b-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1727288925; x=1727893725; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=fwEfeaDSBn8msOqSdNlm06yquTmLjohsS4pYzmoPPg8=;
        b=m9V4U/6EfRFim66K9GMI8X2Rkesna1am1Po5EkVoQwZaVIuKMsQwWTgkH/W7R+UMMi
         Z61v/4/1oTsX6PpzvaPHTbzKRpOnQwml6X1alyrt6ejWpfR310wotnlc++rV4O5Lij0j
         PGJBPVP2xNnMjrFwDZNr99W1/+y8d1esjbfr0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727288925; x=1727893725;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fwEfeaDSBn8msOqSdNlm06yquTmLjohsS4pYzmoPPg8=;
        b=LmggjQsSd0SzWIy8rPOmAW6KOgL4K+wvq9kMhIDtLauCIuE0F/dExF5pA4dpTVz6Rs
         KQa4Z28iz5ORAZBBSghrdRxTdNC126TTySw+ww4drBfOEBk6u9bOxIZpWmAhh2ePwkzB
         usUtlcblbnWTh/YQhIFgiXL95Rky7IL3O/6FzaIS7DXHzvJ7F2eLXs1tcKYrnZ7ef5kS
         qxsIx8wia64EqYGbbsVweKYOkIF1M3XN/3mxKrnOzEy/rLIOpndRjX/zSa4aPrBlVUVf
         aupA7b18mPapU8S13sysAOHL7DFbbVfKk97BLO9hUZF+qPRlC9mrHkPAH51k+pf86mMM
         vr5w==
X-Gm-Message-State: AOJu0Yx00qtbMomC2qs34ypg7AIw1fAcd1oaaFTQuUPZ1O3ljxPGZhif
	3nmD77dMF48ad6Z9hVIeHKbRxbiPHQf4WXf0pbr8KBNo2bZwqJCvAcsnE7k33iw=
X-Google-Smtp-Source: AGHT+IFpIa9nOC9lGHF1n4xKKG9so399nihnA5zQDEU+aBbIZspjGDHcUSuRyRhOHMCqWttMKTPRSA==
X-Received: by 2002:a17:907:d589:b0:a8a:cc5a:7f30 with SMTP id a640c23a62f3a-a93b1620f21mr56097966b.25.1727288924609;
        Wed, 25 Sep 2024 11:28:44 -0700 (PDT)
Message-ID: <14e0bb5d-7f68-418e-8313-48593ceea7d5@citrix.com>
Date: Wed, 25 Sep 2024 19:28:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/6] xen/livepatch: zero pointer to temporary load
 buffer
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Ross Lagerwall <ross.lagerwall@citrix.com>
References: <20240925084239.85649-1-roger.pau@citrix.com>
 <20240925084239.85649-3-roger.pau@citrix.com>
 <c357ec68-bfd2-427e-8f33-5826a2252b0e@citrix.com>
 <ZvPfVokJHOpzEZXc@macbook.local>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <ZvPfVokJHOpzEZXc@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 25/09/2024 11:00 am, Roger Pau Monné wrote:
> On Wed, Sep 25, 2024 at 10:33:39AM +0100, Andrew Cooper wrote:
>> On 25/09/2024 9:42 am, Roger Pau Monne wrote:
>>> The livepatch_elf_sec data field points to the temporary load buffer, it's the
>>> load_addr field that points to the stable loaded section data.  Zero the data
>>> field once load_addr is set, as it would otherwise become a dangling pointer
>>> once the load buffer is freed.
>>>
>>> No functional change intended.
>>>
>>> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
>>> ---
>>> Changes since v1:
>>>  - New in this version.
>>> ---
>>>  xen/common/livepatch.c | 3 +++
>>>  1 file changed, 3 insertions(+)
>>>
>>> diff --git a/xen/common/livepatch.c b/xen/common/livepatch.c
>>> index df41dcce970a..87b3db03e26d 100644
>>> --- a/xen/common/livepatch.c
>>> +++ b/xen/common/livepatch.c
>>> @@ -383,6 +383,9 @@ static int move_payload(struct payload *payload, struct livepatch_elf *elf)
>>>              }
>>>              else
>>>                  memset(elf->sec[i].load_addr, 0, elf->sec[i].sec->sh_size);
>>> +
>>> +            /* Avoid leaking pointers to temporary load buffers. */
>>> +            elf->sec[i].data = NULL;
>>>          }
>>>      }
>>>  
>> Where is the data allocated and freed?
>>
>> I don't see it being freed in this loop, so how is freed subsequently?
> It's allocated and freed by livepatch_upload(), it's the raw_data
> buffer that's allocated in the context of that function.

Well, this is a mess isn't it.

Ok, so livepatch_upload() makes a temporary buffer to copy everything into.

In elf_resolve_sections(), we set up sec[i].data pointing into this
temporary buffer.

And here, we copy the data from the temporary buffer, into the final
destination in the Xen .text/data/rodata region.

So yes, this does end up being a dangling pointer, and clobbering it is
good.


But, seeing the `n = sec->load_addr ?: sec->data` in patch 4, wouldn't
it be better to drop this second pointer and just have move_payload()
update it here?

I can't see anything good which can come from having two addresses, nor
a reason why we'd need both.

Then again, if this is too hard to arrange, it probably can be left as
an exercise to a future developer.

~Andrew

