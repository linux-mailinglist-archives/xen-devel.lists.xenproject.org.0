Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F2F3455A04
	for <lists+xen-devel@lfdr.de>; Thu, 18 Nov 2021 12:20:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.227349.393197 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mnfSD-0001Zq-Sm; Thu, 18 Nov 2021 11:19:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 227349.393197; Thu, 18 Nov 2021 11:19:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mnfSD-0001Y4-Pj; Thu, 18 Nov 2021 11:19:45 +0000
Received: by outflank-mailman (input) for mailman id 227349;
 Thu, 18 Nov 2021 11:19:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9nqF=QF=srcf.net=amc96@srs-se1.protection.inumbo.net>)
 id 1mnfSC-0001Xy-58
 for xen-devel@lists.xenproject.org; Thu, 18 Nov 2021 11:19:44 +0000
Received: from ppsw-32.csi.cam.ac.uk (ppsw-32.csi.cam.ac.uk [131.111.8.132])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6cdda234-4861-11ec-9787-a32c541c8605;
 Thu, 18 Nov 2021 12:19:43 +0100 (CET)
Received: from hades.srcf.societies.cam.ac.uk ([131.111.179.67]:41040)
 by ppsw-32.csi.cam.ac.uk (ppsw.cam.ac.uk [131.111.8.136]:25)
 with esmtps (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
 id 1mnfS9-000hzy-1F (Exim 4.95) (return-path <amc96@srcf.net>);
 Thu, 18 Nov 2021 11:19:41 +0000
Received: from [192.168.1.10] (host-92-12-61-86.as13285.net [92.12.61.86])
 (Authenticated sender: amc96)
 by hades.srcf.societies.cam.ac.uk (Postfix) with ESMTPSA id 155CA1FC53;
 Thu, 18 Nov 2021 11:19:41 +0000 (GMT)
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
X-Inumbo-ID: 6cdda234-4861-11ec-9787-a32c541c8605
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: https://help.uis.cam.ac.uk/email-scanner-virus
Message-ID: <439464d3-43fe-58a1-521b-0cc4eed02d08@srcf.net>
Date: Thu, 18 Nov 2021 11:19:40 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Paul Durrant <paul@xen.org>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20211117182603.20057-1-andrew.cooper3@citrix.com>
 <df71b9a1-9aed-d0ce-ecf1-2addc69511d1@suse.com>
From: Andrew Cooper <amc96@srcf.net>
Subject: Re: [PATCH] x86/hvm: Remove callback from paging->flush_tlb() hook
In-Reply-To: <df71b9a1-9aed-d0ce-ecf1-2addc69511d1@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 18/11/2021 10:45, Jan Beulich wrote:
> On 17.11.2021 19:26, Andrew Cooper wrote:
>> TLB flushing is a hotpath, and function pointer calls are
>> expensive (especially under repoline) for what amounts to an identity
>> transform on the data.  Just pass the vcpu_bitmap bitmap directly.
>>
>> As we use NULL for all rather than none, introduce a flush_vcpu() helper to
>> avoid the risk of logical errors from opencoding the expression.  This also
>> means the viridian callers can avoid writing an all-ones bitmap for the
>> flushing logic to consume.
> I think you want to clarify that you convert only one of the two ways of
> specifying "all". The other (HV_GENERIC_SET_ALL as consumed by
> hv_vpset_to_vpmask()) could also be converted, but this would be a bit
> more involved. I have no idea which of the two Windows would typically
> use, nor why there are two mechanisms in the first place.

Oh - I'd not spotted that path.  It is well hidden away from
HV_FLUSH_ALL_PROCESSORS.

Giving how windows APIs typically evolve,
HVCALL_FLUSH_VIRTUAL_ADDRESS_{SPACE,LIST} where first.  It has a limit
of 64 vCPUs, and the VpSet sparse form is clearly catering to massive
numbers of vCPUs.

I'd expect to see both paths used, so we ought to see about optimising
that too, in due course.

>> No functional change.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

Thanks.

~Andrew

