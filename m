Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F25D29503F
	for <lists+xen-devel@lfdr.de>; Wed, 21 Oct 2020 17:55:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.10108.26673 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kVGSm-0004So-Co; Wed, 21 Oct 2020 15:55:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 10108.26673; Wed, 21 Oct 2020 15:55:44 +0000
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
	id 1kVGSm-0004SO-9K; Wed, 21 Oct 2020 15:55:44 +0000
Received: by outflank-mailman (input) for mailman id 10108;
 Wed, 21 Oct 2020 15:55:42 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Yt4r=D4=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1kVGSk-0004SJ-GX
 for xen-devel@lists.xenproject.org; Wed, 21 Oct 2020 15:55:42 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a06dfe49-14eb-4bb3-8dad-2badd2c19f4a;
 Wed, 21 Oct 2020 15:55:41 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=Yt4r=D4=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
	id 1kVGSk-0004SJ-GX
	for xen-devel@lists.xenproject.org; Wed, 21 Oct 2020 15:55:42 +0000
X-Inumbo-ID: a06dfe49-14eb-4bb3-8dad-2badd2c19f4a
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id a06dfe49-14eb-4bb3-8dad-2badd2c19f4a;
	Wed, 21 Oct 2020 15:55:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1603295741;
  h=subject:from:to:cc:references:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=3Ij3KMWZF3vJCFollHAJrc9dutGwQkDI7uVM6NY8uc4=;
  b=Li5PEYVMKbyKAKQ/9KbVHPfwMfbBUmSW5wvE2LchRSLP23u2NwLf9chw
   /5YXJbEe+ESangySGeWBCf8L1JrV0k4oORVqGm6Mh2/pMPp4Nm98xMJtL
   AiTDSWao60fInR1pKLi0GPBgjykSlEq76TxlRJKoy7ZTpjO03J+P1zGtq
   g=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: 0vfR56qbxVlDV4WFYB6R6d0WLUj/lXEP7hiFt7Rvb01HijHzU57P8eUBY6l4i9PBmvTPSVQL8d
 PEMSNaC4EJxtXp6RvYa8JahOTY+7EPRWd+9dPrpVOlo8paW+Zpoltkk1wShyqTcR0Oei4PNDiF
 okE0poYlXaHGzqad/F0Hcrm3kOBVoGSUoZkwPEoF7BOabiThHS56zHTVdEYU3MYsmAug3cC8iX
 KyS943gLUJBPjES37SNKNYYNwpHzjwXXA2bKdGROeSnf7l/EQx9eQ7th8xm3y54GAcc+kk5j/1
 oVE=
X-SBRS: 2.5
X-MesageID: 30555245
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,401,1596513600"; 
   d="scan'208";a="30555245"
Subject: Re: [PATCH] x86/pv: Flush TLB in response to paging structure changes
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>,
	=?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>
References: <20201021130708.12249-1-andrew.cooper3@citrix.com>
 <7967fa6e-213d-50e2-87d3-dbd319aa2060@suse.com>
 <9fe3d967-6bfe-71ef-6430-029de97dca8c@citrix.com>
Message-ID: <cd2bdd84-4b78-7f19-81a2-ffd358cb3b13@citrix.com>
Date: Wed, 21 Oct 2020 16:55:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <9fe3d967-6bfe-71ef-6430-029de97dca8c@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 FTLPEX02CL05.citrite.net (10.13.108.178)

On 21/10/2020 16:39, Andrew Cooper wrote:
>>> @@ -4051,27 +4057,28 @@ long do_mmu_update(
>>>                          break;
>>>                      rc = mod_l4_entry(va, l4e_from_intpte(req.val), mfn,
>>>                                        cmd == MMU_PT_UPDATE_PRESERVE_AD, v);
>>> -                    if ( !rc && pt_owner->arch.pv.xpti )
>>> +                    /* Paging structure maybe changed.  Flush linear range. */
>>> +                    if ( !rc )
>>>                      {
>>> -                        bool local_in_use = false;
>>> +                        bool local_in_use = mfn_eq(
>>> +                            pagetable_get_mfn(curr->arch.guest_table), mfn);
>>>  
>>> -                        if ( mfn_eq(pagetable_get_mfn(curr->arch.guest_table),
>>> -                                    mfn) )
>>> -                        {
>>> -                            local_in_use = true;
>>> -                            get_cpu_info()->root_pgt_changed = true;
>>> -                        }
>>> +                        flush_flags_all |= FLUSH_TLB;
>>> +
>>> +                        if ( local_in_use )
>>> +                            flush_flags_local |= FLUSH_TLB | FLUSH_ROOT_PGTBL;
>> Aiui here (and in the code consuming the flags) you build upon
>> flush_flags_local, when not zero, always being a superset of
>> flush_flags_all. I think this is a trap to fall into when later
>> wanting to change this code, but as per below this won't hold
>> anymore anyway, I think. Hence here I think you want to set
>> FLUSH_TLB unconditionally, and above for L3 and L2 you want to
>> set it in both variables. Or, if I'm wrong below, a comment to
>> that effect may help people avoid falling into this trap.
>>
>> An alternative would be to have
>>
>>     flush_flags_local |= (flush_flags_all & FLUSH_TLB);
>>
>> before doing the actual flush.

Also, what I forgot to say in the previous reply, this is still buggy if
hypothetically speaking FLUSH_CACHE had managed to be accumulated in
flush_flags_all.

You cannot have general accumulation logic, a special case for local,
and any catch-all logic like that, because the only correct way to do
the catch-all logic will clobber the special case for local.

~Andrew

