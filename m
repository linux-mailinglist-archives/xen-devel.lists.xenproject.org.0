Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C1F942F21B3
	for <lists+xen-devel@lfdr.de>; Mon, 11 Jan 2021 22:23:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.65377.115821 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kz4eM-0002ob-JX; Mon, 11 Jan 2021 21:22:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 65377.115821; Mon, 11 Jan 2021 21:22:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kz4eM-0002ny-Et; Mon, 11 Jan 2021 21:22:54 +0000
Received: by outflank-mailman (input) for mailman id 65377;
 Mon, 11 Jan 2021 21:22:53 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=57GD=GO=cam.ac.uk=amc96@srs-us1.protection.inumbo.net>)
 id 1kz4eL-0002nU-5G
 for xen-devel@lists.xenproject.org; Mon, 11 Jan 2021 21:22:53 +0000
Received: from ppsw-41.csi.cam.ac.uk (unknown [131.111.8.141])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 929993c8-9988-4324-a550-d546b8c78985;
 Mon, 11 Jan 2021 21:22:51 +0000 (UTC)
Received: from 88-111-124-141.dynamic.dsl.as9105.com ([88.111.124.141]:48888
 helo=[192.168.1.219])
 by ppsw-41.csi.cam.ac.uk (smtp.hermes.cam.ac.uk [131.111.8.159]:465)
 with esmtpsa (PLAIN:amc96) (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
 id 1kz4eB-000qUM-SW (Exim 4.92.3)
 (return-path <amc96@cam.ac.uk>); Mon, 11 Jan 2021 21:22:43 +0000
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
X-Inumbo-ID: 929993c8-9988-4324-a550-d546b8c78985
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=cam.ac.uk;
	 s=20180806.ppsw; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=x4abE5ch6BWg+vHxKHAz5kz7ma28JEIZtELC3KWCYko=; b=BNRrCheNxPVTi9XCXhgKmoknHc
	8hJEa8nBTSbDMXGTMZKlDodyvcJyutobFLWO77YKluh+96F/PMQdTCKHvNAgrnHZai39JtWD+5RnJ
	bgorcDX0antu9edkeYcaAeVShnf/wGrMXObsA3+3YBabLepDtDuaAIdzn6dbX3QTdVQA=;
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: http://help.uis.cam.ac.uk/email-scanner-virus
Subject: Re: [PATCH v2 02/11] xen/gnttab: Rework resource acquisition
To: Jan Beulich <jbeulich@suse.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Ian Jackson
 <iwj@xenproject.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Julien Grall <julien@xen.org>,
 Paul Durrant <paul@xen.org>, =?UTF-8?Q?Micha=c5=82_Leszczy=c5=84ski?=
 <michal.leszczynski@cert.pl>, Hubert Jasudowicz <hubert.jasudowicz@cert.pl>,
 Tamas K Lengyel <tamas@tklengyel.com>, Andrew Cooper <amc96@cam.ac.uk>
References: <20200922182444.12350-1-andrew.cooper3@citrix.com>
 <20200922182444.12350-3-andrew.cooper3@citrix.com>
 <538236fd-af25-9e35-8f44-3125fe71e4bd@suse.com>
From: Andrew Cooper <amc96@cam.ac.uk>
Message-ID: <a2c77b68-5434-836d-40e4-40fb037617d5@cam.ac.uk>
Date: Mon, 11 Jan 2021 21:22:43 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <538236fd-af25-9e35-8f44-3125fe71e4bd@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB

On 25/09/2020 14:17, Jan Beulich wrote:
> On 22.09.2020 20:24, Andrew Cooper wrote:
>> --- a/xen/common/grant_table.c
>> +++ b/xen/common/grant_table.c
>> @@ -4013,6 +4013,81 @@ static int gnttab_get_shared_frame_mfn(struct domain *d,
>>      return 0;
>>  }
>>  
>> +int gnttab_acquire_resource(
>> +    struct domain *d, unsigned int id, unsigned long frame,
>> +    unsigned int nr_frames, xen_pfn_t mfn_list[])
>> +{
>> +    struct grant_table *gt = d->grant_table;
>> +    unsigned int i = nr_frames, tot_frames;
>> +    mfn_t tmp;
>> +    void **vaddrs = NULL;
>> +    int rc;
>> +
>> +    /* Input sanity. */
>> +    if ( !nr_frames )
>> +        return -EINVAL;
> I continue to object to this becoming an error.

It's not a path any legitimate caller will ever exercise.  POSIX defines
any mmap() of zero length to be an error, and I completely agree.

The problem isn't, per say, with accepting bogus arguments.  It is the
quantity of additional complexity in the hypervisor required to support
accepting the bogus input cleanly.

There are exactly 2 cases where 0 might be found here.  Either the
caller passed it in directly (and bypassed the POSIX check which would
reject the attempt), or some part of multi-layer continuation handling
went wrong on the previous iteration.

For this hypercall (by the end of the series), _acquire_resource()
returning 0 is specifically treated as an error so we don't livelock in
32-chunking loop until some other preemption kicks in.

In this case, the check isn't actually necessary because it is (will be)
guarded higher up the call chain in a more general way, but I'm not
interested in adding unnecessary extra complexity (to area I've had to
rewrite from scratch to remove the bugs) simply to support a
non-existent usecase.

~Andrew

