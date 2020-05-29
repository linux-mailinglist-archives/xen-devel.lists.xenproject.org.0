Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 332571E79F8
	for <lists+xen-devel@lfdr.de>; Fri, 29 May 2020 11:59:04 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jebmw-0004qr-Tn; Fri, 29 May 2020 09:58:54 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jshP=7L=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jebmv-0004qm-Qm
 for xen-devel@lists.xenproject.org; Fri, 29 May 2020 09:58:53 +0000
X-Inumbo-ID: 0036150c-a193-11ea-a884-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0036150c-a193-11ea-a884-12813bfff9fa;
 Fri, 29 May 2020 09:58:52 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 9AAE7AEE5;
 Fri, 29 May 2020 09:58:51 +0000 (UTC)
Subject: Re: [PATCH 2/2] xen: credit2: limit the max number of CPUs in a
 runqueue
To: Dario Faggioli <dfaggioli@suse.com>
References: <158818022727.24327.14309662489731832234.stgit@Palanthas>
 <158818179558.24327.11334680191217289878.stgit@Palanthas>
 <3db33b8a-ba97-f302-a325-e989ff0e7084@suse.com>
 <7b34b1b2c4b36399ad16f6e72a872e15d949f4bf.camel@suse.com>
 <cd566bb2-753f-b0eb-3c6a-bc2dc01cf37c@suse.com>
 <a959e9e807dc1f832d151ab72f324f2c084c2461.camel@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <bc005ca2-7bf2-3bb0-b9cd-0be05c914f3f@suse.com>
Date: Fri, 29 May 2020 11:58:51 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <a959e9e807dc1f832d151ab72f324f2c084c2461.camel@suse.com>
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
Cc: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org,
 George Dunlap <george.dunlap@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 28.05.2020 16:55, Dario Faggioli wrote:
> On Wed, 2020-05-27 at 08:17 +0200, Jan Beulich wrote:
>> On 27.05.2020 00:00, Dario Faggioli wrote:
>>> Just in case, is there a
>>> way to identify them easily, like with a mask or something, in the
>>> code
>>> already?
>>
>> cpu_sibling_mask still gets used for both, so there's no mask
>> to use. As per set_cpu_sibling_map() you can look at
>> cpu_data[].compute_unit_id to tell, but that's of course x86-
>> specific (as is the entire compute unit concept).
>>
> Right. And thanks for the pointers.
> 
> But then, what I am understanding by having a look there is that I
> indeed can use (again, appropriately wrapped) x86_num_siblings, for
> telling, in this function, whether a CPU has any, and if yes how many,
> HT (Intel) or CU (AMD) siblings in total, although some of them may
> currently be offline.
> 
> Which means I will be treating HTs and CUs the same which, thinking
> more about it (and thinking actually to CUs, rather than to any cache
> sharing relationship), does make sense for this feature.
> 
> Does this make sense, or am I missing or misinterpreting anything?

Well, it effectively answers the question I had raised: "What about HT
vs AMD Fam15's CUs? Do you want both to be treated the same here?"

Jan

