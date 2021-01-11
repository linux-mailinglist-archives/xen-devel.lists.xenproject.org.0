Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D80012F21B2
	for <lists+xen-devel@lfdr.de>; Mon, 11 Jan 2021 22:23:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.65376.115812 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kz4eM-0002nz-9G; Mon, 11 Jan 2021 21:22:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 65376.115812; Mon, 11 Jan 2021 21:22:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kz4eM-0002nZ-5e; Mon, 11 Jan 2021 21:22:54 +0000
Received: by outflank-mailman (input) for mailman id 65376;
 Mon, 11 Jan 2021 21:22:51 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=57GD=GO=cam.ac.uk=amc96@srs-us1.protection.inumbo.net>)
 id 1kz4eI-0002nO-BU
 for xen-devel@lists.xenproject.org; Mon, 11 Jan 2021 21:22:51 +0000
Received: from ppsw-41.csi.cam.ac.uk (unknown [131.111.8.141])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1158a2d7-e561-4e34-8729-583f69a34b6a;
 Mon, 11 Jan 2021 21:22:49 +0000 (UTC)
Received: from 88-111-124-141.dynamic.dsl.as9105.com ([88.111.124.141]:48882
 helo=[192.168.1.219])
 by ppsw-41.csi.cam.ac.uk (smtp.hermes.cam.ac.uk [131.111.8.159]:465)
 with esmtpsa (PLAIN:amc96) (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
 id 1kz4e8-000qTF-QO (Exim 4.92.3)
 (return-path <amc96@cam.ac.uk>); Mon, 11 Jan 2021 21:22:40 +0000
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
X-Inumbo-ID: 1158a2d7-e561-4e34-8729-583f69a34b6a
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=cam.ac.uk;
	 s=20180806.ppsw; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=IEtjtzZ2aHxFB70Qf7INd8OoFuEgLWM0UWRISsMj7wQ=; b=TwLLNPrZLMNrpjfFhb238FbsTb
	NSurde/JbY/ZjulleSwo1KVEUaKiEWM4T1yBeYAhQdQIxfbrshbJ/5h0I8W38w8OMJpGvbQ76AZWq
	vo/+hJkFObzJWozUmg5EsLQ0AtyYflaNfbwq251P3TXZ4r++da3c87zWTMwz4uA8MSKg=;
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: http://help.uis.cam.ac.uk/email-scanner-virus
Subject: Re: [PATCH v2 02/11] xen/gnttab: Rework resource acquisition
To: paul@xen.org, 'Xen-devel' <xen-devel@lists.xenproject.org>
Cc: 'George Dunlap' <George.Dunlap@eu.citrix.com>,
 'Ian Jackson' <iwj@xenproject.org>, 'Jan Beulich' <JBeulich@suse.com>,
 'Stefano Stabellini' <sstabellini@kernel.org>, 'Wei Liu' <wl@xen.org>,
 'Julien Grall' <julien@xen.org>,
 =?UTF-8?B?J01pY2hhxYIgTGVzemN6ecWEc2tpJw==?= <michal.leszczynski@cert.pl>,
 'Hubert Jasudowicz' <hubert.jasudowicz@cert.pl>,
 'Tamas K Lengyel' <tamas@tklengyel.com>, Andrew Cooper <amc96@cam.ac.uk>
References: <20200922182444.12350-1-andrew.cooper3@citrix.com>
 <20200922182444.12350-3-andrew.cooper3@citrix.com>
 <001601d69258$4d6a7c90$e83f75b0$@xen.org>
From: Andrew Cooper <amc96@cam.ac.uk>
Message-ID: <835893e1-fcd0-efa1-86ce-02af70dd1101@cam.ac.uk>
Date: Mon, 11 Jan 2021 21:22:39 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <001601d69258$4d6a7c90$e83f75b0$@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB

On 24/09/2020 10:51, Paul Durrant wrote:
>> diff --git a/xen/common/grant_table.c b/xen/common/grant_table.c
>> index a5d3ed8bda..912f07be47 100644
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
> Nit: inconsistency with full stops on single line comments.

The whole point of relaxing the style was because feedback over minutia
such as this was deemed detrimental to the community.

If I ever see feedback like this, I will commit commit the patch there
and then.  This is the only way upstream Xen is going to turn into a
less toxic environment for contributors.

>> +            rc = -EINVAL;
>> +            break;
>> +        }
>> +        rc = gnttab_get_status_frame_mfn(d, tot_frames - 1, &tmp);
>> +        break;
>> +    }
>> +
> I think you could drop the write lock here...
>
>> +    /* Any errors from growing the table? */
>> +    if ( rc )
>> +        goto out;
>> +
> ...and acquire it read here, since we know the table cannot shrink. You'd need to re-check the gt_version for safety though.

And you've correctly identified why I didn't.  If we had a
relax-write-to-read lock operation, that would also be fine, but we don't.

Fundamentally, this is an operation made once during VM construction, to
map one single frame.  It is not a hotpath in need of microptimising its
locking pattern, and absolutely not something worth introducing a safety
hazard for.

~Andrew

