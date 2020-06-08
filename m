Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 00C9D1F17E8
	for <lists+xen-devel@lfdr.de>; Mon,  8 Jun 2020 13:36:03 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jiG3K-0002SF-Ls; Mon, 08 Jun 2020 11:34:54 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Nc1T=7V=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jiG3I-0002SA-Nr
 for xen-devel@lists.xenproject.org; Mon, 08 Jun 2020 11:34:52 +0000
X-Inumbo-ID: 10cbcaec-a97c-11ea-9b55-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 10cbcaec-a97c-11ea-9b55-bc764e2007e4;
 Mon, 08 Jun 2020 11:34:51 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 2BB0BABE4;
 Mon,  8 Jun 2020 11:34:54 +0000 (UTC)
Subject: Re: [PATCH-for-4.14] ioreq: handle pending emulation racing with
 ioreq server destruction
To: paul@xen.org
References: <20200608094619.28336-1-paul@xen.org>
 <4d63c9c7-f4e8-4c56-7778-df17b3c5254b@suse.com>
 <002a01d63d84$9c351430$d49f3c90$@xen.org>
 <f606e364-9ec0-2766-072f-6485afd2baae@suse.com>
 <002d01d63d86$f2c35d50$d84a17f0$@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <7912fccb-ca4a-97c5-769d-4559196f3e8a@suse.com>
Date: Mon, 8 Jun 2020 13:34:49 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.1
MIME-Version: 1.0
In-Reply-To: <002d01d63d86$f2c35d50$d84a17f0$@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Cc: xen-devel@lists.xenproject.org, 'Paul Durrant' <pdurrant@amazon.com>,
 =?UTF-8?Q?=27Marek_Marczykowski-G=c3=b3recki=27?=
 <marmarek@invisiblethingslab.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 08.06.2020 13:21, Paul Durrant wrote:
>> From: Jan Beulich <jbeulich@suse.com>
>> Sent: 08 June 2020 12:10
>>
>> As said in the other thread, I think the change here will mask
>> a problem elsewhere (presumably in qemu). I'm therefore unsure whether
>> we want to apply it right away, rather than first understanding the
>> root cause of Marek's specific problem.
>>
> 
> I think it ought to be applied right away since an emulator could die at any time and we don't really want the vcpu constantly bouncing in this case. Also, thinking of using emulators other than qemu, it's not necessarily a bug if they deregister at an arbitrary time...

Oh, sure, I fully agree we need the change regardless of the possible
qemu misbehavior. But if we commit this change right away, will there
be anyone still caring about / looking into the qemu side issue?

Jan

