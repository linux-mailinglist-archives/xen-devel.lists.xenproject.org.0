Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EA9E211C91
	for <lists+xen-devel@lfdr.de>; Thu,  2 Jul 2020 09:21:40 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jqtVw-0005o2-Fp; Thu, 02 Jul 2020 07:20:08 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=DrmV=AN=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1jqtVv-0005nx-6U
 for xen-devel@lists.xenproject.org; Thu, 02 Jul 2020 07:20:07 +0000
X-Inumbo-ID: 73e857f6-bc34-11ea-bb8b-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 73e857f6-bc34-11ea-bb8b-bc764e2007e4;
 Thu, 02 Jul 2020 07:20:06 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 731B3AF37;
 Thu,  2 Jul 2020 07:20:05 +0000 (UTC)
Subject: Re: [PATCH v2] xen/displif: Protocol version 2
To: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>,
 Oleksandr Andrushchenko <andr2000@gmail.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "ian.jackson@eu.citrix.com" <ian.jackson@eu.citrix.com>,
 "wl@xen.org" <wl@xen.org>
References: <20200701071923.18883-1-andr2000@gmail.com>
 <dffd127d-c5a1-4c77-baa8-f1d931145bc4@suse.com>
 <b5a6e034-4d52-d6b2-7c14-3c44c4a19cc3@epam.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <e442e4d9-fe79-7f65-c196-2a0a35923492@suse.com>
Date: Thu, 2 Jul 2020 09:20:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <b5a6e034-4d52-d6b2-7c14-3c44c4a19cc3@epam.com>
Content-Type: text/plain; charset=utf-8; format=flowed
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

On 01.07.20 14:07, Oleksandr Andrushchenko wrote:
> On 7/1/20 1:46 PM, Jürgen Groß wrote:
>> On 01.07.20 09:19, Oleksandr Andrushchenko wrote:
>>> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
>>>
>>> 1. Add protocol version as an integer
>>>
>>> Version string, which is in fact an integer, is hard to handle in the
>>> code that supports different protocol versions. To simplify that
>>> also add the version as an integer.
>>>
>>> 2. Pass buffer offset with XENDISPL_OP_DBUF_CREATE
>>>
>>> There are cases when display data buffer is created with non-zero
>>> offset to the data start. Handle such cases and provide that offset
>>> while creating a display buffer.
>>>
>>> 3. Add XENDISPL_OP_GET_EDID command
>>>
>>> Add an optional request for reading Extended Display Identification
>>> Data (EDID) structure which allows better configuration of the
>>> display connectors over the configuration set in XenStore.
>>> With this change connectors may have multiple resolutions defined
>>> with respect to detailed timing definitions and additional properties
>>> normally provided by displays.
>>>
>>> If this request is not supported by the backend then visible area
>>> is defined by the relevant XenStore's "resolution" property.
>>>
>>> If backend provides extended display identification data (EDID) with
>>> XENDISPL_OP_GET_EDID request then EDID values must take precedence
>>> over the resolutions defined in XenStore.
>>>
>>> 4. Bump protocol version to 2.
>>>
>>> Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
>>
>> Reviewed-by: Juergen Gross <jgross@suse.com>
> 
> Thank you, do you want me to prepare the same for the kernel so
> 
> you have it at hand when the time comes?

It should be added to the kernel only when really needed (i.e. a user of
the new functionality is showing up).


Juergen

