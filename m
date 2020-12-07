Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 272B92D148E
	for <lists+xen-devel@lfdr.de>; Mon,  7 Dec 2020 16:25:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.46709.82797 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmIOT-0002FL-Mw; Mon, 07 Dec 2020 15:25:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 46709.82797; Mon, 07 Dec 2020 15:25:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmIOT-0002Ew-Ju; Mon, 07 Dec 2020 15:25:41 +0000
Received: by outflank-mailman (input) for mailman id 46709;
 Mon, 07 Dec 2020 15:25:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=3bhA=FL=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kmIOS-0002Er-BQ
 for xen-devel@lists.xenproject.org; Mon, 07 Dec 2020 15:25:40 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 370156ee-ea5a-409a-8625-12cb07d49450;
 Mon, 07 Dec 2020 15:25:39 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id D64DCAB63;
 Mon,  7 Dec 2020 15:25:38 +0000 (UTC)
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
X-Inumbo-ID: 370156ee-ea5a-409a-8625-12cb07d49450
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1607354738; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=I6SoY8CvJ7zGy7t31o0iJZMwSuFc/r2C5JcqmfBX6Go=;
	b=Qtqdppx02gtRACsGXJlhE/wuAfABeE2V2rJpGKtiSYW0o57LmrLeX4ylFwrJrnsIrbJR4f
	fRBrns1DoVeAmtCDBzbyxRnhDi2hDxx87MSlR/rLpbD80xzFNrhfRu9fEIiSY0FZZZTjKZ
	rwTIUZNszT89aw22Up2r5YCFx0/pD8s=
Subject: Ping: [PATCH] libxenstat: avoid build race
To: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Olaf Hering <olaf@aepfle.de>, Bertrand Marquis <Bertrand.Marquis@arm.com>
References: <273da46e-2a56-f53c-f137-f6fc411ad8db@suse.com>
 <6CDFEFFF-368E-467B-970A-4CDFA7978A2E@arm.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <f2b92ab9-5bc2-79f8-8c28-2cf5d17f49e2@suse.com>
Date: Mon, 7 Dec 2020 16:25:41 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <6CDFEFFF-368E-467B-970A-4CDFA7978A2E@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 18.11.2020 15:27, Bertrand Marquis wrote:
>> On 17 Nov 2020, at 09:42, Jan Beulich <jbeulich@suse.com> wrote:
>>
>> Olaf reported observing
>>
>> xenstat_qmp.c:26:10: fatal error: _paths.h: No such file or directory
>> .../tools/libs/stat/../../../tools/Rules.mk:153: xenstat_qmp.opic] Error 1
>>
>> Obviously _paths.h, when included by any of the sources, needs to be
>> created in advance of compiling any of them, not just the non-PIC ones.
>>
>> Reported-by: Olaf Hering <olaf@aepfle.de>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Ping? (I guess this one is again simple enough that I should
time out waiting by the middle of the week.)

Jan

>> ---
>> A similar issue (at the time of the report) in the building of
>> libxenstore was addressed by Jürgen's 9af5e2b31b4e ("tools/libs/store:
>> don't use symbolic links for external files").
>>
>> --- a/tools/libs/stat/Makefile
>> +++ b/tools/libs/stat/Makefile
>> @@ -30,7 +30,7 @@ include $(XEN_ROOT)/tools/libs/libs.mk
>>
>> include $(XEN_ROOT)/tools/libs/libs.mk
>>
>> -$(LIB_OBJS): _paths.h
>> +$(LIB_OBJS) $(PIC_OBJS): _paths.h
>>
>> PYLIB=bindings/swig/python/_xenstat.so
>> PYMOD=bindings/swig/python/xenstat.py
>>
> 


