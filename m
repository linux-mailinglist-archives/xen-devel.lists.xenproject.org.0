Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3916645EF0E
	for <lists+xen-devel@lfdr.de>; Fri, 26 Nov 2021 14:22:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.233063.404254 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqbAt-0006s0-Dp; Fri, 26 Nov 2021 13:21:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 233063.404254; Fri, 26 Nov 2021 13:21:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqbAt-0006pF-AM; Fri, 26 Nov 2021 13:21:59 +0000
Received: by outflank-mailman (input) for mailman id 233063;
 Fri, 26 Nov 2021 13:21:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=3jyU=QN=srcf.net=amc96@srs-se1.protection.inumbo.net>)
 id 1mqbAr-0006p9-Qe
 for xen-devel@lists.xenproject.org; Fri, 26 Nov 2021 13:21:57 +0000
Received: from ppsw-33.csi.cam.ac.uk (ppsw-33.csi.cam.ac.uk [131.111.8.133])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d3906036-4ebb-11ec-9787-a32c541c8605;
 Fri, 26 Nov 2021 14:21:56 +0100 (CET)
Received: from hades.srcf.societies.cam.ac.uk ([131.111.179.67]:49776)
 by ppsw-33.csi.cam.ac.uk (ppsw.cam.ac.uk [131.111.8.137]:25)
 with esmtps (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
 id 1mqbAj-0005Sv-gW (Exim 4.95) (return-path <amc96@srcf.net>);
 Fri, 26 Nov 2021 13:21:49 +0000
Received: from [192.168.1.10] (host-92-12-61-86.as13285.net [92.12.61.86])
 (Authenticated sender: amc96)
 by hades.srcf.societies.cam.ac.uk (Postfix) with ESMTPSA id DD1381FC54;
 Fri, 26 Nov 2021 13:21:48 +0000 (GMT)
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
X-Inumbo-ID: d3906036-4ebb-11ec-9787-a32c541c8605
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: https://help.uis.cam.ac.uk/email-scanner-virus
Message-ID: <7acc1b9f-a506-5772-694b-dde0825a2507@srcf.net>
Date: Fri, 26 Nov 2021 13:21:48 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [PATCH 00/65] x86: Support for CET Indirect Branch Tracking
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Juergen Gross <jgross@suse.com>,
 Daniel Smith <dpsmith@apertussolutions.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20211126123446.32324-1-andrew.cooper3@citrix.com>
 <2bc4eeab-a69a-a953-e09e-7b87f7dc4b85@suse.com>
 <41e1f32d-6fe0-b588-ca27-8ddbd77f25e4@srcf.net>
From: Andrew Cooper <amc96@srcf.net>
In-Reply-To: <41e1f32d-6fe0-b588-ca27-8ddbd77f25e4@srcf.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 26/11/2021 13:13, Andrew Cooper wrote:
> On 26/11/2021 12:48, Jan Beulich wrote:
>> On 26.11.2021 13:33, Andrew Cooper wrote:
>>> Various note accumulated through the work:
>>>   * I have already posted patches fixing some of the most egregious (ab)uses of
>>>     function pointers.  There are plenty of other areas which could do with
>>>     cleanup.
>>>   * With everything turned on, we get 1688 runtime endbr64's, and 233 init
>>>     time.  The number of runtime endbr64's is expected to reduce with
>>>     Juergen's hypercall series (see later), and in common deployment cases
>>>     where not everything is compiled in by default.
>>>   * I have not checked for misaligned endbr64's, and I'm not sure there is
>>>     anything useful we could do upon discovering that there were any.
>>>     Naively, there is a 1 in 2^32 chance (endbr64 being 4 bytes long), but
>>>     this doesn't account for the structure of x86 code, which is most
>>>     certainly not a uniform random distribution of bytes.
>> Do you really mean "misaligned" here? The 2nd sentence rather might suggest
>> that you mean byte sequences resembling ENDBR, despite actually being part
>> of other insns. If so, checking might not allow to prove anything, as e.g.
>> displacements change with about every build.
> I do mean "any sequence of bytes resembling ENDBR", because that is
> ultimately how the CPU instruction decode will behave.
>
> And yes - you certainly can hide it in a 4-byte disp/imm, but it's an
> incredibly rare imm32 to find (except for tasks such as in patch 64).

To this point, I have a cunning idea.  I'll write a custom is_endbr64()
helper which reads a dword, not's it, and then compares to imm32.  That
is for all intents and purposes the same performance, but doesn't have
an embedded endbr64.

~Andrew

