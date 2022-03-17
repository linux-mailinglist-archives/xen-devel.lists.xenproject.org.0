Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 820A04DC8B9
	for <lists+xen-devel@lfdr.de>; Thu, 17 Mar 2022 15:26:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.291620.495081 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nUr4i-00089Q-QR; Thu, 17 Mar 2022 14:26:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 291620.495081; Thu, 17 Mar 2022 14:26:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nUr4i-00086r-NP; Thu, 17 Mar 2022 14:26:00 +0000
Received: by outflank-mailman (input) for mailman id 291620;
 Thu, 17 Mar 2022 14:25:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WHX2=T4=srcf.net=amc96@srs-se1.protection.inumbo.net>)
 id 1nUr4h-00086k-GW
 for xen-devel@lists.xenproject.org; Thu, 17 Mar 2022 14:25:59 +0000
Received: from ppsw-41.csi.cam.ac.uk (ppsw-41.csi.cam.ac.uk [131.111.8.141])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2939a01c-a5fe-11ec-8eba-a37418f5ba1a;
 Thu, 17 Mar 2022 15:25:58 +0100 (CET)
Received: from hades.srcf.societies.cam.ac.uk ([131.111.179.67]:47826)
 by ppsw-41.csi.cam.ac.uk (ppsw.cam.ac.uk [131.111.8.139]:25)
 with esmtps (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
 id 1nUr4e-000Sq8-SH (Exim 4.95) (return-path <amc96@srcf.net>);
 Thu, 17 Mar 2022 14:25:56 +0000
Received: from [192.168.1.30] (unknown [84.66.49.165])
 (Authenticated sender: amc96)
 by hades.srcf.societies.cam.ac.uk (Postfix) with ESMTPSA id 88EE31FABC;
 Thu, 17 Mar 2022 14:25:56 +0000 (GMT)
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
X-Inumbo-ID: 2939a01c-a5fe-11ec-8eba-a37418f5ba1a
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: https://help.uis.cam.ac.uk/email-scanner-virus
Message-ID: <c028a0e8-4818-f648-5b9c-44539a426362@srcf.net>
Date: Thu, 17 Mar 2022 14:25:55 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 1/2] livepatch: do not ignore sections with 0 size
Content-Language: en-GB
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>
References: <20220317110854.39050-1-roger.pau@citrix.com>
 <20220317110854.39050-2-roger.pau@citrix.com>
 <7443a703-6215-1b8f-a6c7-bab606ad016a@citrix.com>
 <YjNCu9nD30DkLZX9@Air-de-Roger>
From: Andrew Cooper <amc96@srcf.net>
In-Reply-To: <YjNCu9nD30DkLZX9@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 17/03/2022 14:16, Roger Pau Monné wrote:
> On Thu, Mar 17, 2022 at 02:00:19PM +0000, Andrew Cooper wrote:
>> On 17/03/2022 11:08, Roger Pau Monne wrote:
>>> A side effect of ignoring such sections is that symbols belonging to
>>> them won't be resolved, and that could make relocations belonging to
>>> other sections that reference those symbols fail.
>>>
>>> For example it's likely to have an empty .altinstr_replacement with
>>> symbols pointing to it, and marking the section as ignored will
>>> prevent the symbols from being resolved, which in turn will cause any
>>> relocations against them to fail.
>> I agree this is a bug in livepatch handling, but it's also an error in
>> the generated livepatch.  We should not have relocations to an empty
>> altinstr_replacement section in the first place.
> Well, the relocation destination is in the .altinstructions section
> (which is not empty). It happens however to reference a symbol that
> points to the .altinstr_replacement section that's empty.
>
> We could likely avoid generating the altinstr_replacement section in
> the first place, but I think it's more robust to handle those properly
> in the elf loading code.

Actually, it turns out it's distinctly non-trivial to omit these
references.  We need to put the replacement somewhere, so we can
subtract the start from the end, and figure out if it is 0.

~Andrew

