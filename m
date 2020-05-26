Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 571911E2043
	for <lists+xen-devel@lfdr.de>; Tue, 26 May 2020 12:58:59 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jdXIG-0004mL-NR; Tue, 26 May 2020 10:58:48 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vgeY=7I=hermes.cam.ac.uk=amc96@srs-us1.protection.inumbo.net>)
 id 1jdXIF-0004mE-Mp
 for xen-devel@lists.xenproject.org; Tue, 26 May 2020 10:58:47 +0000
X-Inumbo-ID: db778dae-9f3f-11ea-9947-bc764e2007e4
Received: from ppsw-31.csi.cam.ac.uk (unknown [131.111.8.131])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id db778dae-9f3f-11ea-9947-bc764e2007e4;
 Tue, 26 May 2020 10:58:40 +0000 (UTC)
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: http://help.uis.cam.ac.uk/email-scanner-virus
Received: from 88-109-182-220.dynamic.dsl.as9105.com ([88.109.182.220]:43890
 helo=[192.168.1.219])
 by ppsw-31.csi.cam.ac.uk (smtp.hermes.cam.ac.uk [131.111.8.157]:465)
 with esmtpsa (PLAIN:amc96) (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
 id 1jdXI7-000qyu-KT (Exim 4.92.3)
 (return-path <amc96@hermes.cam.ac.uk>); Tue, 26 May 2020 11:58:39 +0100
Subject: Re: Xen PVH domU start-of-day VCPU state
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
 xen-devel@lists.xenproject.org, mirageos-devel@lists.xenproject.org,
 anil@recoil.org, dave@recoil.org, martin@lucina.net
References: <20200525160401.GA3091@nodbug.lucina.net>
 <a17fef73-382c-50b3-1e6b-5904fc3bf60f@suse.com>
 <6a22e477-c9e7-f0d7-6cb1-615137a778be@citrix.com>
 <20200526085221.GB5942@nodbug.lucina.net>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <36363b39-c8c1-82bf-af37-f0d917844bb4@citrix.com>
Date: Tue, 26 May 2020 11:58:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200526085221.GB5942@nodbug.lucina.net>
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 26/05/2020 09:52, Martin Lucina wrote:
> On Monday, 25.05.2020 at 17:59, Andrew Cooper wrote:
>> On 25/05/2020 17:42, Jürgen Groß wrote:
>>> You need to setup virtual addressing and enable 64 bit mode before using
>>> 64-bit GDT.
>>>
>>> See Mini-OS source arch/x86/x86_hvm.S
>> Or
>> https://xenbits.xen.org/gitweb/?p=people/andrewcoop/xen-test-framework.git;a=blob;f=arch/x86/hvm/head.S;h=f7dc72b58ab9ec68538f0087969ab6f72d181d80;hb=HEAD
>>
>> But yes - Juergen is correct.  Until you have enabled long mode, lgdt
>> will only load the bottom 32 bits of GDTR.base.
> Ah, I missed Jurgen's and your reply here.

So the mailing list is doing something evil and setting:

Mail-Followup-To: Andrew Cooper <andrew.cooper3@citrix.com>,
    =?iso-8859-1?Q?J=FCrgen_Gro=DF?= <jgross@suse.com>,
    xen-devel@lists.xenproject.org, mirageos-devel@lists.xenproject.org,
    anil@recoil.org, dave@recoil.org

which causes normal replies to cut you out.

~Andrew

