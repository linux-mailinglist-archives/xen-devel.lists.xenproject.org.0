Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6493E4B5222
	for <lists+xen-devel@lfdr.de>; Mon, 14 Feb 2022 14:51:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.272283.467063 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJbkm-0003fp-Ls; Mon, 14 Feb 2022 13:50:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 272283.467063; Mon, 14 Feb 2022 13:50:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJbkm-0003e1-IF; Mon, 14 Feb 2022 13:50:56 +0000
Received: by outflank-mailman (input) for mailman id 272283;
 Mon, 14 Feb 2022 13:50:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=R+2O=S5=srcf.net=amc96@srs-se1.protection.inumbo.net>)
 id 1nJbkk-0003Qt-VQ
 for xen-devel@lists.xenproject.org; Mon, 14 Feb 2022 13:50:54 +0000
Received: from ppsw-31.csi.cam.ac.uk (ppsw-31.csi.cam.ac.uk [131.111.8.131])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1f86c1c2-8d9d-11ec-8eb8-a37418f5ba1a;
 Mon, 14 Feb 2022 14:50:53 +0100 (CET)
Received: from hades.srcf.societies.cam.ac.uk ([131.111.179.67]:55292)
 by ppsw-31.csi.cam.ac.uk (ppsw.cam.ac.uk [131.111.8.137]:25)
 with esmtps (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
 id 1nJbkh-0010IO-Lp (Exim 4.95) (return-path <amc96@srcf.net>);
 Mon, 14 Feb 2022 13:50:51 +0000
Received: from [192.168.1.10] (host-92-12-61-86.as13285.net [92.12.61.86])
 (Authenticated sender: amc96)
 by hades.srcf.societies.cam.ac.uk (Postfix) with ESMTPSA id 918B01FB1C;
 Mon, 14 Feb 2022 13:50:51 +0000 (GMT)
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
X-Inumbo-ID: 1f86c1c2-8d9d-11ec-8eb8-a37418f5ba1a
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: https://help.uis.cam.ac.uk/email-scanner-virus
Message-ID: <e18c0c5a-d00b-adf9-d4b0-28e702a18241@srcf.net>
Date: Mon, 14 Feb 2022 13:50:51 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Juergen Gross <jgross@suse.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20220214125127.17985-1-andrew.cooper3@citrix.com>
 <20220214125127.17985-5-andrew.cooper3@citrix.com>
 <4d8ab414-caf4-5a12-4cb7-a88c633cfd66@suse.com>
From: Andrew Cooper <amc96@srcf.net>
Subject: Re: [PATCH v2 04/70] x86/pv-shim: Don't modify the hypercall table
In-Reply-To: <4d8ab414-caf4-5a12-4cb7-a88c633cfd66@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 14/02/2022 13:33, Jan Beulich wrote:
> On 14.02.2022 13:50, Andrew Cooper wrote:
>> From: Juergen Gross <jgross@suse.com>
>>
>> When running as pv-shim the hypercall is modified today in order to
>> replace the functions for __HYPERVISOR_event_channel_op and
>> __HYPERVISOR_grant_table_op hypercalls.
>>
>> Change this to call the related functions from the normal handlers
>> instead when running as shim. The performance implications are not
>> really relevant, as a normal production hypervisor will not be
>> configured to support shim mode, so the related calls will be dropped
>> due to optimization of the compiler.
>>
>> Note that for the CONFIG_PV_SHIM_EXCLUSIVE case there is a dummy
>> wrapper do_grant_table_op() needed, as in this case grant_table.c
>> isn't being built.
>>
>> Signed-off-by: Juergen Gross <jgross@suse.com>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> I don't think you sync-ed this with Jürgen's v3. There were only minor
> changes but having a stale version sent two months later isn't very
> nice.

I did resync.  What do you think is missing?

>
>> --- a/xen/common/compat/multicall.c
>> +++ b/xen/common/compat/multicall.c
>> @@ -5,7 +5,7 @@
>>  EMIT_FILE;
>>  
>>  #include <xen/types.h>
>> -#include <xen/multicall.h>
>> +#include <xen/hypercall.h>
>>  #include <xen/trace.h>
>>  
>>  #define COMPAT
>> @@ -19,7 +19,6 @@ static inline void xlat_multicall_entry(struct mc_state *mcs)
>>          mcs->compat_call.args[i] = mcs->call.args[i];
>>  }
>>  
>> -DEFINE_XEN_GUEST_HANDLE(multicall_entry_compat_t);
>>  #define multicall_entry      compat_multicall_entry
>>  #define multicall_entry_t    multicall_entry_compat_t
>>  #define do_multicall_call    compat_multicall_call
> Jürgen's patch doesn't have any change to this file, and I'm afraid I
> also don't see how these adjustments are related here. The commit
> message sadly also doesn't help ...

The changes are very necessary to split it out of Juergen's series.

Without the adjustment, the correction of compat_platform_op()'s guest
handle type from void to compat_platform_op_t doesn't compile.

~Andrew

