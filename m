Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CF831EA855
	for <lists+xen-devel@lfdr.de>; Mon,  1 Jun 2020 19:19:27 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jfo5c-00063Q-1c; Mon, 01 Jun 2020 17:19:08 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4DG+=7O=hermes.cam.ac.uk=amc96@srs-us1.protection.inumbo.net>)
 id 1jfo5a-00063L-SE
 for xen-devel@lists.xenproject.org; Mon, 01 Jun 2020 17:19:06 +0000
X-Inumbo-ID: fea966b2-a42b-11ea-9947-bc764e2007e4
Received: from ppsw-31.csi.cam.ac.uk (unknown [131.111.8.131])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fea966b2-a42b-11ea-9947-bc764e2007e4;
 Mon, 01 Jun 2020 17:19:05 +0000 (UTC)
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: http://help.uis.cam.ac.uk/email-scanner-virus
Received: from 88-109-182-220.dynamic.dsl.as9105.com ([88.109.182.220]:54576
 helo=[192.168.1.219])
 by ppsw-31.csi.cam.ac.uk (smtp.hermes.cam.ac.uk [131.111.8.157]:465)
 with esmtpsa (PLAIN:amc96) (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
 id 1jfo5R-000aMz-Kp (Exim 4.92.3)
 (return-path <amc96@hermes.cam.ac.uk>); Mon, 01 Jun 2020 18:18:57 +0100
Subject: Re: [PATCH for-4.14] docs/ucode: Extend runtime microcode loading
 documentation
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20200601134025.24142-1-andrew.cooper3@citrix.com>
 <20200601165105.GU1195@Air-de-Roger>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <46ae5234-5f0f-e963-7857-520743e047f9@citrix.com>
Date: Mon, 1 Jun 2020 18:18:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200601165105.GU1195@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Paul Durrant <paul@xen.org>,
 Jan Beulich <JBeulich@suse.com>, Ian Jackson <ian.jackson@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 01/06/2020 17:51, Roger Pau Monné wrote:
>
> On Mon, Jun 01, 2020 at 02:40:25PM +0100, Andrew Cooper wrote:
>> Extend the disclaimer about runtime loading.  While we've done our best to
>> make the mechaism reliable, the safety of late loading does ultimately depend
>> on the contents of the blobs.
>>
>> Extend the xen-ucode portion with examples of how to use it.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks,

>
>> ---
>> CC: George Dunlap <George.Dunlap@eu.citrix.com>
>> CC: Ian Jackson <ian.jackson@citrix.com>
>> CC: Jan Beulich <JBeulich@suse.com>
>> CC: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
>> CC: Stefano Stabellini <sstabellini@kernel.org>
>> CC: Wei Liu <wl@xen.org>
>> CC: Julien Grall <julien@xen.org>
>> CC: Paul Durrant <paul@xen.org>
>> ---
>>  docs/admin-guide/microcode-loading.rst | 22 +++++++++++++++++++---
>>  1 file changed, 19 insertions(+), 3 deletions(-)
>>
>> diff --git a/docs/admin-guide/microcode-loading.rst b/docs/admin-guide/microcode-loading.rst
>> index 5f0f661a2e..8cd5d0351b 100644
>> --- a/docs/admin-guide/microcode-loading.rst
>> +++ b/docs/admin-guide/microcode-loading.rst
>> @@ -104,8 +104,8 @@ modules to find any CPIO archives, and search the archive for the applicable
>>  file.  Xen will stop searching at the first match.
>>  
>>  
>> -Run time microcode loading
>> ---------------------------
>> +Runtime microcode loading
>> +-------------------------
>>  
>>  .. warning::
>>  
>> @@ -113,7 +113,23 @@ Run time microcode loading
>>     or at boot time.  Not all microcode updates (or parts thereof) can be
>>     applied at runtime.
>>  
>> -The ``xen-ucode`` utility can be used to initiate a runtime microcode load.
>> +   Given the proprietry nature of microcode, we are unable to make any claim
>> +   that a runtime microcode is risk-free.  Any runtime microcode loading needs
>> +   adequate testing on a dev instance before being rolled out to production
>> +   systems.
>> +
>> +The ``xen-ucode`` utility can be used to initiate a runtime microcode load::
>> +
>> +  [root@host ~]# xen-ucode
>> +  xen-ucode: Xen microcode updating tool
>> +  Usage: xen-ucode <microcode blob>
>> +  [root@host ~]#
>> +
>> +e.g. With a Linux dom0 on a Haswell system::
>> +
>> +  [root@host ~]# xen-ucode /lib/firmware/intel-ucode/06-3c-03
> Could you expand a bit on the nomenclature used here?
>
> I assume it's something like <fam>-<model>-<version> but might be good
> to provide people a hint to know how to find the appropriate blob for
> their system if possible.

It is $FAMILY-$MODEL-$STEPPING.  Currently only a single version of each
microcode is installed at once by the microcode_ctl package.

However, its infeasible to cater to all setup's/situations here.  Within
linux, you could clone
https://github.com/intel/Intel-Linux-Processor-Microcode-Data-Files/ or
use the slightly older single monolithic microcode.dat.

And that is before you start considering non-Intel systems, or other
ways of packaging microcode.

I'm open to suggestions for how to make this clearer, but we definitely
can't do an exhaustive list of places you might find microcode.

~Andrew

