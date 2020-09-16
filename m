Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DAB926C13D
	for <lists+xen-devel@lfdr.de>; Wed, 16 Sep 2020 11:58:04 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kIUC6-0000vR-0R; Wed, 16 Sep 2020 09:57:42 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ruU0=CZ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kIUC4-0000vM-Fh
 for xen-devel@lists.xenproject.org; Wed, 16 Sep 2020 09:57:40 +0000
X-Inumbo-ID: 811e536d-12f7-4c88-84d3-05ac734b5e26
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 811e536d-12f7-4c88-84d3-05ac734b5e26;
 Wed, 16 Sep 2020 09:57:39 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id B137DAED9;
 Wed, 16 Sep 2020 09:57:53 +0000 (UTC)
Subject: Re: [PATCH v4 4/4] efi: Do not use command line if secure boot is
 enabled.
To: Trammell Hudson <hudson@trmm.net>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 "wl@xen.org" <wl@xen.org>
References: <20200914115013.814079-1-hudson@trmm.net>
 <20200914115013.814079-5-hudson@trmm.net> <20200916074544.GS753@Air-de-Roger>
 <qZE7KyS-f57SLweovl4ooU4DeiB-dOQELVrxH38JpcuZtZawcz98dIu1KU1Dg0jumQ9FLkdw31pVzr6EeObfxqi71JIa8qkZiJ9kXD59ec8=@trmm.net>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <fe93838c-ae36-b926-cc48-f9336b9ecc0f@suse.com>
Date: Wed, 16 Sep 2020 11:57:38 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <qZE7KyS-f57SLweovl4ooU4DeiB-dOQELVrxH38JpcuZtZawcz98dIu1KU1Dg0jumQ9FLkdw31pVzr6EeObfxqi71JIa8qkZiJ9kXD59ec8=@trmm.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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

On 16.09.2020 10:50, Trammell Hudson wrote:
> On Wednesday, September 16, 2020 3:45 AM, Roger Pau Monné <roger.pau@citrix.com> wrote:
>> On Mon, Sep 14, 2020 at 07:50:13AM -0400, Trammell Hudson wrote:
>>> If secure boot is enabled, the Xen command line arguments are ignored.
>>> If a unified Xen image is used, then the bundled configuration, dom0
>>> kernel, and initrd are prefered over the ones listed in the config file.
>>
>> I understand that you must ignore the cfg option when using the
>> bundled image, but is there then an alternative way for passing the
>> basevideo and mapbs parameters?
> 
> The cfg option will be ignored regardless since a bundled config
> (or kernel, ramdisk, etc) takes precedence over any files,
> so perhaps parsing the command line is not as much of a risk
> as initially thought.
> 
> The concern is that *any* non-signed configuration values are
> potentially a risk, even if we don't see exactly how the attacker
> can use them right now. Especially if an option is added later
> and we haven't thought about the security ramifications of it.
> 
>> Or there's simply no way of doing so when using secure boot with a
>> bundled image?
> 
> Should these options be available in the config file instead?
> That way the system owner can sign the configuration and ensure
> that an adversary can't change them.

Not really, no. /basevideo needs evaluating very early in any event,
before any (regular) output gets produced. /mapbs could be parsed
later, but the early boot code intentionally does not make any
attempt at parsing the command line options designated for the
common parts of xen.gz and xen.efi. Yet the map_bs variable has one
use in early boot code (i.e. before handing over to __start_xen()).

Jan

