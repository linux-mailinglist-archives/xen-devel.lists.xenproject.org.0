Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CE52A1E813A
	for <lists+xen-devel@lfdr.de>; Fri, 29 May 2020 17:07:32 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jegbV-000436-Ou; Fri, 29 May 2020 15:07:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mY44=7L=hermes.cam.ac.uk=amc96@srs-us1.protection.inumbo.net>)
 id 1jegbT-00042Z-Iy
 for xen-devel@lists.xenproject.org; Fri, 29 May 2020 15:07:23 +0000
X-Inumbo-ID: 191a92ac-a1be-11ea-9dbe-bc764e2007e4
Received: from ppsw-31.csi.cam.ac.uk (unknown [131.111.8.131])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 191a92ac-a1be-11ea-9dbe-bc764e2007e4;
 Fri, 29 May 2020 15:07:23 +0000 (UTC)
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: http://help.uis.cam.ac.uk/email-scanner-virus
Received: from 88-109-182-220.dynamic.dsl.as9105.com ([88.109.182.220]:33028
 helo=[192.168.1.219])
 by ppsw-31.csi.cam.ac.uk (smtp.hermes.cam.ac.uk [131.111.8.157]:465)
 with esmtpsa (PLAIN:amc96) (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
 id 1jegbQ-0010N0-Li (Exim 4.92.3)
 (return-path <amc96@hermes.cam.ac.uk>); Fri, 29 May 2020 16:07:20 +0100
Subject: Re: [PATCH v10 2/9] x86emul: rework CMP and TEST emulation
To: Jan Beulich <jbeulich@suse.com>
References: <d2375ecb-f662-99d8-84c2-e9f9c5cf7b9e@suse.com>
 <5843dca9-1a1a-a32e-3cb0-95cd93533723@suse.com>
 <c215f77f-f645-eb08-3ac1-7d9f211e1abf@citrix.com>
 <629b042b-1226-6d2d-6509-569bb3c64abe@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <d1d304ee-613e-c013-2000-39c5707c3af0@citrix.com>
Date: Fri, 29 May 2020 16:07:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <629b042b-1226-6d2d-6509-569bb3c64abe@suse.com>
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>, Roger Pau Monne <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 29/05/2020 14:41, Jan Beulich wrote:
> On 29.05.2020 14:24, Andrew Cooper wrote:
>> On 25/05/2020 15:26, Jan Beulich wrote:
>>> Unlike similarly encoded insns these don't write their memory operands,
>> "write to their".
>>
>>> and hence x86_is_mem_write() should return false for them. However,
>>> rather than adding special logic there, rework how their emulation gets
>>> done, by making decoding attributes properly describe the r/o nature of
>>> their memory operands.
>> Describe how?  I see you've change the order of operands encoding, but
>> then override it back?
> There's no overriding back, I don't think: I change the table entries
> for opcodes 0x38 and 0x39, with no other adjustments the the attributes
> later on. For the other opcodes I leave the table entries as they are,
> and override the attributes for the specific sub-cases (identified by
> ModRM.reg).
>
> For opcodes 0x38 and 0x39 the change of the table entries implies
> changing the order of operands as passed to emulate_2op_SrcV(), hence
> the splitting of the cases in the main switch().
> I didn't think this was necessary to spell out in the commit message,
> but of course I can re-use most of the text above and add it into
> there, if you think that would help.

Yes please.  With something suitable, Acked-by: Andrew Cooper
<andrew.cooper3@citrix.com>

~Andrew

