Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 21F6F1EA74E
	for <lists+xen-devel@lfdr.de>; Mon,  1 Jun 2020 17:50:09 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jfmhM-0005Sf-Ks; Mon, 01 Jun 2020 15:50:00 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4DG+=7O=hermes.cam.ac.uk=amc96@srs-us1.protection.inumbo.net>)
 id 1jfmhK-0005SV-Oa
 for xen-devel@lists.xenproject.org; Mon, 01 Jun 2020 15:49:58 +0000
X-Inumbo-ID: 8b2d3990-a41f-11ea-ab2d-12813bfff9fa
Received: from ppsw-31.csi.cam.ac.uk (unknown [131.111.8.131])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8b2d3990-a41f-11ea-ab2d-12813bfff9fa;
 Mon, 01 Jun 2020 15:49:58 +0000 (UTC)
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: http://help.uis.cam.ac.uk/email-scanner-virus
Received: from 88-109-182-220.dynamic.dsl.as9105.com ([88.109.182.220]:51234
 helo=[192.168.1.219])
 by ppsw-31.csi.cam.ac.uk (smtp.hermes.cam.ac.uk [131.111.8.157]:465)
 with esmtpsa (PLAIN:amc96) (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
 id 1jfmhG-000h9E-Ln (Exim 4.92.3)
 (return-path <amc96@hermes.cam.ac.uk>); Mon, 01 Jun 2020 16:49:54 +0100
Subject: Re: [PATCH for-4.14] x86/ucode: Fix errors with start/end_update()
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20200601145755.3661-1-andrew.cooper3@citrix.com>
 <20200601154832.GT1195@Air-de-Roger>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <d590d2af-ccb1-451d-1af9-5db511ac05e1@citrix.com>
Date: Mon, 1 Jun 2020 16:49:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200601154832.GT1195@Air-de-Roger>
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 Jan Beulich <JBeulich@suse.com>, Paul Durrant <paul@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 01/06/2020 16:48, Roger Pau Monné wrote:
> On Mon, Jun 01, 2020 at 03:57:55PM +0100, Andrew Cooper wrote:
>> c/s 9267a439c "x86/ucode: Document the behaviour of the microcode_ops hooks"
>> identified several poor behaviours of the start_update()/end_update_percpu()
>> hooks.
>>
>> AMD have subsequently confirmed that OSVW don't, and are not expected to,
>> change across a microcode load, rendering all of this complexity unecessary.
> Is there a reference to some AMD PM or similar document that can be
> added here for completeness?

Not at the moment.  (I'm attempting to solve this...)

>
>> Instead of fixing up the logic to not leave the OSVW state reset in a number
>> of corner cases, delete the logic entirely.  This in turn allows for the
>> removal of the poorly-named 'start_update' parameter to
>> microcode_update_one().
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks,

~Andrew

