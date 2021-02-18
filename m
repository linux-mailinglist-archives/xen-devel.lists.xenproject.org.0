Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CB8D31E951
	for <lists+xen-devel@lfdr.de>; Thu, 18 Feb 2021 12:54:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.86603.162722 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lChsv-00022Z-SU; Thu, 18 Feb 2021 11:54:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 86603.162722; Thu, 18 Feb 2021 11:54:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lChsv-00022A-PE; Thu, 18 Feb 2021 11:54:17 +0000
Received: by outflank-mailman (input) for mailman id 86603;
 Thu, 18 Feb 2021 11:54:16 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=x3vz=HU=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lChsu-000225-E7
 for xen-devel@lists.xenproject.org; Thu, 18 Feb 2021 11:54:16 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 81fa8e0f-598e-4254-8b63-3a48d9af044a;
 Thu, 18 Feb 2021 11:54:15 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 9CFECAF0C;
 Thu, 18 Feb 2021 11:54:14 +0000 (UTC)
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
X-Inumbo-ID: 81fa8e0f-598e-4254-8b63-3a48d9af044a
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1613649254; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uLeCNH+QoFBFXb0fm7m+wzQKZXmls20NMPsf/D+qskk=;
	b=YdYRq6aJ3vn/BJ+A3ckF15fML3BMBEnplleVbAIP8PHA7Qsg43FERMfdaTOysfwaDKagWg
	8KwgVRTFP1RJZziMXC+4OBrManqO7lXgtKi/7tfBqfxOroyoc7fl8A7UC4dPGyTbxW9tGM
	1TJqR9Yqecxn4RGmFPq6aWoQUtjQ85Y=
Subject: Re: [PATCH v2 1/4] xl: Add support for ignore_msrs option
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, iwj@xenproject.org, wl@xen.org,
 anthony.perard@citrix.com, andrew.cooper3@citrix.com,
 jun.nakajima@intel.com, kevin.tian@intel.com,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
References: <1611182952-9941-1-git-send-email-boris.ostrovsky@oracle.com>
 <1611182952-9941-2-git-send-email-boris.ostrovsky@oracle.com>
 <YC5EitRCZB+VCeCC@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <a78a4b94-47cc-64c0-1b1f-8429665822b2@suse.com>
Date: Thu, 18 Feb 2021 12:54:13 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <YC5EitRCZB+VCeCC@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 18.02.2021 11:42, Roger Pau Monné wrote:
> On Wed, Jan 20, 2021 at 05:49:09PM -0500, Boris Ostrovsky wrote:
>> This option allows guest administrator specify what should happen when
>> guest accesses an MSR which is not explicitly emulated by the hypervisor.
>>
>> Signed-off-by: Boris Ostrovsky <boris.ostrovsky@oracle.com>
>> ---
>>  docs/man/xl.cfg.5.pod.in         | 20 +++++++++++++++++++-
>>  tools/libs/light/libxl_types.idl |  7 +++++++
>>  tools/xl/xl_parse.c              |  7 +++++++
>>  3 files changed, 33 insertions(+), 1 deletion(-)
>>
>> diff --git a/docs/man/xl.cfg.5.pod.in b/docs/man/xl.cfg.5.pod.in
>> index c8e017f950de..96ce97c42cab 100644
>> --- a/docs/man/xl.cfg.5.pod.in
>> +++ b/docs/man/xl.cfg.5.pod.in
>> @@ -2044,7 +2044,25 @@ Do not provide a VM generation ID.
>>  See also "Virtual Machine Generation ID" by Microsoft:
>>  L<https://docs.microsoft.com/en-us/windows/win32/hyperv_v2/virtual-machine-generation-identifier>
>>  
>> -=back 
>> +=over
>> +
>> +=item B<ignore_msrs="STRING">
>> +
>> +Determine hypervisor behavior on accesses to MSRs that are not emulated by the hypervisor.
>> +
>> +=over 4
>> +
>> +=item B<never>
>> +
>> +Issue a warning to the log and #GP to the guest. This is default.
>> +
>> +=item B<silent>
>> +
>> +MSR reads return 0, MSR writes are ignored. No warnings to the log.
>> +
>> +=item B<verbose>
>> +
>> +Similar to B<silent> but a warning is written.
> 
> Would it make sense to allow for this option to be more fine-grained
> in the future?

From an abstract perspective - maybe. But remember that this information
will need to be migrated with the guest. It would seem to me that
Boris'es approach is easier migration-wise.

> Not that you need to implement the full thing now, but maybe we could
> have something like:
> 
> "
> =item B<ignore_msrs=[ "MSR_RANGE, "MSR_RANGE", ..]>
> 
> Specify a list of MSR ranges that will be ignored by the hypervisor:
> reads will return zeros and writes will be discarded without raising a
> #GP.
> 
> Each MSR_RANGE is given in hexadecimal format and may be a range, e.g.
> c00102f0-c00102f1 (inclusive), or a single MSR, e.g. c00102f1.
> "
> 
> Then you can print the messages in the hypervisor using a guest log
> level and modify it on demand in order to get more verbose output?

"Modify on demand"? Irrespective of what you mean with this, ...

> I don't think selecting whether the messages are printed or not from
> xl is that helpful as the same could be achieved using guest_loglvl.

... controlling this via guest_loglvl would affect various other
log messages' visibility.

Jan

