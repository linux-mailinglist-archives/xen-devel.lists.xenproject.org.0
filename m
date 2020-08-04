Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E4CD623B51E
	for <lists+xen-devel@lfdr.de>; Tue,  4 Aug 2020 08:43:00 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k2qeo-0003Op-VN; Tue, 04 Aug 2020 06:42:42 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xzDE=BO=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1k2qen-0003Oj-Jp
 for xen-devel@lists.xenproject.org; Tue, 04 Aug 2020 06:42:41 +0000
X-Inumbo-ID: b1291ee0-d61d-11ea-b00d-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b1291ee0-d61d-11ea-b00d-12813bfff9fa;
 Tue, 04 Aug 2020 06:42:40 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id B89F6AC7D;
 Tue,  4 Aug 2020 06:42:55 +0000 (UTC)
Subject: Re: [PATCH 00/10] x86emul: full coverage mem access / write testing
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <97ca3d9c-7540-c7b1-cf84-34c75c9127df@suse.com>
 <60a128e9-0480-a753-4aa8-177c270d09f4@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <78a9ef20-eb9b-81a0-8b3d-de668db3f828@suse.com>
Date: Tue, 4 Aug 2020 08:42:40 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <60a128e9-0480-a753-4aa8-177c270d09f4@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 03.08.2020 18:40, Andrew Cooper wrote:
> On 03/08/2020 15:47, Jan Beulich wrote:
>> ... and a few fixes resulting from this work. This completes what
>> was started for legacy encoded GPR insns in a rush before 4.14.
>>
>> There's one thing I'm still planning on top of both this and the
>> EVEX-disp8 checking: For all encodings we produce via general
>> logic (and in particular without involvement of any assembler) I'd
>> like to add a kind of logging mechanism, the output of which could
>> be fed to gas and then some disassembler, to allow verification
>> that the produced encodings are actually valid ones. See e.g. the
>> first patch here or commit 5f55389d6960 - the problems addressed
>> there could have been caught earlier if the generated encodings
>> could be easily disassembled. What's not clear to me here is
>> whether this is deemed generally useful, or whether I should make
>> this a private addition of mine.
> 
> Seems fine to me.
> 
> I have encountered a failure on AMD Naples which I doubt is related to
> this series, but is blocking testing on some of the content here.
> 
> Testing fnstenv 4(%ecx)...              failed!
> 
> AMD Fam17 does have the fcs/fds save-as-zero logic which is still not
> wired up anywhere in Xen, which seems like the most likely candidate
> here (without having investigated the issue at all yet).

There are two zap_fpsel() in place there, which I would have thought
to cover this. I'll see whether I can repro on my Rome box.

Jan

