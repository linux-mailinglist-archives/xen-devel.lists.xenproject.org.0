Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E5211EFF5B
	for <lists+xen-devel@lfdr.de>; Fri,  5 Jun 2020 19:48:05 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jhGRI-00054L-3I; Fri, 05 Jun 2020 17:47:32 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wVi9=7S=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jhGRG-00054G-Ro
 for xen-devel@lists.xenproject.org; Fri, 05 Jun 2020 17:47:30 +0000
X-Inumbo-ID: 9feb12b6-a754-11ea-b00e-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9feb12b6-a754-11ea-b00e-12813bfff9fa;
 Fri, 05 Jun 2020 17:47:29 +0000 (UTC)
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: g3bDy7/aKMqYA/nRD5k68luHJp3E/nGih27P7PhJUOpnnhfOGwp0qJFtygVEGhyl+ac10kgls8
 XXlxVsWW/EPpoEUtl6USTiJmP8KjyB49IoW6ymWnc/MhSserHnDy3I0ovXdpv4nwt1008sM781
 K1kSbgfv3EnIp6x1AWRZB6aSsLGul0thqHGytc4j/MGr3bmXOxwMzRgtu1KgoQomO2uzjJ4TyX
 PGa7zdE8f5N8vtWM90oSDYtz3OlYnjibcEim0HC6d/wQpe+S8tJM4kPIh64WvM8gvU7qwJEEBz
 McM=
X-SBRS: 2.7
X-MesageID: 19369432
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,477,1583211600"; d="scan'208";a="19369432"
Subject: Re: [PATCH] x86/Intel: insert Ice Lake and Comet Lake model numbers
To: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>
References: <baa738ce-0398-48df-e94e-dc8b86a35f6c@suse.com>
 <20200605080216.GI1195@Air-de-Roger>
 <32c4cdf7-0fdd-8b12-ee42-dfe8fe096935@suse.com>
 <20200605084644.GJ1195@Air-de-Roger>
 <d24f6ebc-7b3c-d560-c073-3c039542ebf8@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <570eee9d-fcf4-be2b-f56e-c739eea9eca7@citrix.com>
Date: Fri, 5 Jun 2020 18:47:24 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <d24f6ebc-7b3c-d560-c073-3c039542ebf8@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
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
 Wei Liu <wl@xen.org>, Paul Durrant <paul@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 05/06/2020 09:54, Jan Beulich wrote:
> On 05.06.2020 10:46, Roger Pau Monné wrote:
>> On Fri, Jun 05, 2020 at 10:10:01AM +0200, Jan Beulich wrote:
>>> On 05.06.2020 10:02, Roger Pau Monné wrote:
>>>> On Fri, Jun 05, 2020 at 09:51:09AM +0200, Jan Beulich wrote:
>>>>> Both match prior generation processors as far as LBR and C-state MSRs
>>>>> go (SDM rev 072) as well as applicability of the if_pschange_mc erratum
>>>>> (recent spec updates).
>>>>>
>>>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>>>> ---
>>>>> Such changes having been subject to backporting in the past, this
>>>>> change may want considering for 4.14.
>>>>> ---
>>>>> I'm leaving alone spec_ctrl.c, albeit there's a scary looking erratum
>>>>> for Ice Lake indicating that MDS_NO may wrongly be set. But this is
>>>>> apparently addressed by ucode update, so we may not need to deal with
>>>>> it in software.
>>>>>
>>>>> --- a/xen/arch/x86/acpi/cpu_idle.c
>>>>> +++ b/xen/arch/x86/acpi/cpu_idle.c
>>>> What about mwait-idle? I guess we pick that from Linux and no patch
>>>> has been added so far?
>>> Correct. I've looked at recent history there, and I'm uncertain they'll
>>> add further models there. They look to prefer to use ACPI _CST now again
>>> with, as it seems, not overly much of a difference to the ACPI driver
>>> (which, if we were to follow, I'd rather see us integrate there).
>> Urg, OK, that's a shame as using mwait-idle was IMO better from a Xen
>> PoV as we didn't rely on dom0 in order to discover C states. I wonder
>> if we could continue to update mwait-idle on our own for newer models.
> This would be nice indeed, but would require Intel to provide us with
> the necessary data.
>
>> FWIW, wikichip also lists 6c and 6a [0] as Ice Lake Server model versions,
>> but I'm not sure if this has been confirmed in any way?
> SDM vol 4 confirms this, but mentions the two model numbers exclusively
> in the table matching signatures to model names ("Future Intel Xeon
> processors based on Ice Lake microarchitecture"). Without there being an
> actual table for these I don't think we should "speculatively" add the
> numbers anywhere.

0x6a is server, 0x6c is microserver.

From this patch, 0x7d is regular client and 0x7e mobile, but there is
also 0x9d which is separate model for inference (I believe its server
with extra AVX512).

Its high time we borrowed intel-family.h from Linux and used that.

~Andrew

