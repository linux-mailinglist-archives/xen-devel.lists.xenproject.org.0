Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 494421DCB05
	for <lists+xen-devel@lfdr.de>; Thu, 21 May 2020 12:27:25 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jbiP8-00016T-Jj; Thu, 21 May 2020 10:26:22 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2WPz=7D=hermes.cam.ac.uk=amc96@srs-us1.protection.inumbo.net>)
 id 1jbiP7-00016O-Ug
 for xen-devel@lists.xenproject.org; Thu, 21 May 2020 10:26:21 +0000
X-Inumbo-ID: 82eff54b-9b4d-11ea-aaee-12813bfff9fa
Received: from ppsw-40.csi.cam.ac.uk (unknown [131.111.8.140])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 82eff54b-9b4d-11ea-aaee-12813bfff9fa;
 Thu, 21 May 2020 10:26:20 +0000 (UTC)
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: http://help.uis.cam.ac.uk/email-scanner-virus
Received: from 88-109-182-220.dynamic.dsl.as9105.com ([88.109.182.220]:40636
 helo=[192.168.1.219])
 by ppsw-40.csi.cam.ac.uk (smtp.hermes.cam.ac.uk [131.111.8.158]:465)
 with esmtpsa (PLAIN:amc96) (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
 id 1jbiP2-000tJn-jr (Exim 4.92.3)
 (return-path <amc96@hermes.cam.ac.uk>); Thu, 21 May 2020 11:26:16 +0100
Subject: Re: [PATCH] x86/shadow: Reposition sh_remove_write_access_from_sl1p()
To: paul@xen.org, 'Xen-devel' <xen-devel@lists.xenproject.org>
References: <20200521090428.11425-1-andrew.cooper3@citrix.com>
 <003e01d62f58$66bbcea0$34336be0$@xen.org>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <3c829c7d-2a3f-0d15-ea77-3a88df57aaaa@citrix.com>
Date: Thu, 21 May 2020 11:26:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <003e01d62f58$66bbcea0$34336be0$@xen.org>
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
Cc: 'Tim Deegan' <tim@xen.org>, 'Jan Beulich' <JBeulich@suse.com>,
 'Wei Liu' <wl@xen.org>,
 =?UTF-8?B?J1JvZ2VyIFBhdSBNb25uw6kn?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 21/05/2020 11:12, Paul Durrant wrote:
>> -----Original Message-----
>> From: Xen-devel <xen-devel-bounces@lists.xenproject.org> On Behalf Of Andrew Cooper
>> Sent: 21 May 2020 10:04
>> To: Xen-devel <xen-devel@lists.xenproject.org>
>> Cc: Andrew Cooper <andrew.cooper3@citrix.com>; Tim Deegan <tim@xen.org>; Wei Liu <wl@xen.org>; Jan
>> Beulich <JBeulich@suse.com>; Roger Pau Monné <roger.pau@citrix.com>
>> Subject: [PATCH] x86/shadow: Reposition sh_remove_write_access_from_sl1p()
>>
>> When compiling with SHOPT_OUT_OF_SYNC disabled, the build fails with:
>>
>>   common.c:41:12: error: ‘sh_remove_write_access_from_sl1p’ declared ‘static’ but never defined [-
>> Werror=unused-function]
>>    static int sh_remove_write_access_from_sl1p(struct domain *d, mfn_t gmfn,
>>               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>>
>> due to an unguarded forward declaration.
> Is this, perhaps, an argument for making SHADOW_OPTIMIZATIONS tunable via Kconfig so that randconfig could catch things like this?

Given enough TUITS, yes.

~Andrew

