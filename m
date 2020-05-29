Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D26511E8A55
	for <lists+xen-devel@lfdr.de>; Fri, 29 May 2020 23:46:30 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jempB-0005Fl-TF; Fri, 29 May 2020 21:45:57 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mY44=7L=hermes.cam.ac.uk=amc96@srs-us1.protection.inumbo.net>)
 id 1jempA-0005Fg-56
 for xen-devel@lists.xenproject.org; Fri, 29 May 2020 21:45:56 +0000
X-Inumbo-ID: c4c40a2a-a1f5-11ea-a91f-12813bfff9fa
Received: from ppsw-31.csi.cam.ac.uk (unknown [131.111.8.131])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c4c40a2a-a1f5-11ea-a91f-12813bfff9fa;
 Fri, 29 May 2020 21:45:53 +0000 (UTC)
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: http://help.uis.cam.ac.uk/email-scanner-virus
Received: from 88-109-182-220.dynamic.dsl.as9105.com ([88.109.182.220]:46062
 helo=[192.168.1.219])
 by ppsw-31.csi.cam.ac.uk (smtp.hermes.cam.ac.uk [131.111.8.157]:465)
 with esmtpsa (PLAIN:amc96) (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
 id 1jemp4-000ak6-Jt (Exim 4.92.3)
 (return-path <amc96@hermes.cam.ac.uk>); Fri, 29 May 2020 22:45:50 +0100
Subject: Re: [PATCH v2 06/14] x86/shstk: Create shadow stacks
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
References: <20200527191847.17207-1-andrew.cooper3@citrix.com>
 <20200527191847.17207-7-andrew.cooper3@citrix.com>
 <8a02b933-3b7e-ded9-8bf3-a1c35f2ef7ae@suse.com>
 <fe8f077d-2048-38af-5deb-0d9dda48cf36@citrix.com>
Message-ID: <fb55d660-4a81-101b-85a4-7ece3c98b8ef@citrix.com>
Date: Fri, 29 May 2020 22:45:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <fe8f077d-2048-38af-5deb-0d9dda48cf36@citrix.com>
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
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 29/05/2020 20:35, Andrew Cooper wrote:
>>> +    }
>>> +    map_pages_to_xen((unsigned long)p, virt_to_mfn(p), 1, PAGE_HYPERVISOR_SHSTK);
>> As already hinted at in reply to the previous patch, I think this wants
>> to remain _PAGE_NONE when we don't use CET-SS.
> The commit message discussed why that is not an option (currently), and
> why I don't consider it a good idea to make possible.

Apologies.  I thought I'd written it in the commit message, but it was
half in the previous patch, and not terribly clear.  I've reworked both.

The current practical reason is to do with clone_mappings() in the XPTI
case.

A wild off-stack read is far far less likely than hitting the guard page
with a push first, which means that a R/O guard page is about the same
usefulness to us, but results in a much more simple stack setup, as it
doesn't vary attributes with enabled features.

~Andrew

