Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E43283696CA
	for <lists+xen-devel@lfdr.de>; Fri, 23 Apr 2021 18:19:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.116530.222420 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZyWY-0000ho-3k; Fri, 23 Apr 2021 16:19:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 116530.222420; Fri, 23 Apr 2021 16:19:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZyWY-0000hP-0X; Fri, 23 Apr 2021 16:19:22 +0000
Received: by outflank-mailman (input) for mailman id 116530;
 Fri, 23 Apr 2021 16:19:20 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=YHlh=JU=list.ru=valor@srs-us1.protection.inumbo.net>)
 id 1lZyWW-0000hK-5t
 for xen-devel@lists.xen.org; Fri, 23 Apr 2021 16:19:20 +0000
Received: from smtp43.i.mail.ru (unknown [94.100.177.103])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f49d61d1-95c9-4eb4-880a-4a5e06a9a292;
 Fri, 23 Apr 2021 16:19:18 +0000 (UTC)
Received: by smtp43.i.mail.ru with esmtpa (envelope-from <valor@list.ru>)
 id 1lZyWT-00048C-6Z; Fri, 23 Apr 2021 19:19:17 +0300
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
X-Inumbo-ID: f49d61d1-95c9-4eb4-880a-4a5e06a9a292
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=list.ru; s=mail3;
	h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc; bh=X+wTKl9jlEwhzLfBJSW+lxHY3EVOln/Z1Iv6s5iVwKM=;
	b=WCDg6fSnx2SJleDNba0T9E6/LRddlD1vPHXCoo7LAGYtxGJFZy1/r1eIO0sgqlhBKsn8und8HatxyN0gROlcuGoM/HeAUv4AAtThHdvswf7LId3IS+OguKUUl5N04NwfPfWp8wWlyZOnuIYYrr+b1ycxTE1TGz44diygWBHJfdc=;
Subject: Re: Fwd: [BUG] Windows is frozen after restore from snapshot
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xen.org, zaytsevgu@gmail.com
References: <6237e102-f2cf-a66e-09b6-954ebfe28f8c@list.ru>
 <46f8bf3e-cd6e-e2de-94c1-c8a55fb10648@list.ru>
 <YILi/Qft51Vh5QZy@Air-de-Roger>
From: Sergey Kovalev <valor@list.ru>
Message-ID: <e8770b62-753a-beed-66b2-e8c99db9a57e@list.ru>
Date: Fri, 23 Apr 2021 19:19:16 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YILi/Qft51Vh5QZy@Air-de-Roger>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp43.i.mail.ru; auth=pass smtp.auth=valor@list.ru smtp.mailfrom=valor@list.ru
X-7564579A: 646B95376F6C166E
X-77F55803: 4F1203BC0FB41BD9203E2ABA940B754838BCE75048F11F6FD8B83E4765829057182A05F538085040B37B096B65D6DB2C2C1287933383E749576B816FE15055E001207E9776F7AA27
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE7370F4F695FFFC24BEA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F79006371DF52D98DC3592C48638F802B75D45FF914D58D5BE9E6BC1A93B80C6DEB9DEE97C6FB206A91F05B29FA71F6202FA4025E58A1DBDE967425FC5BC91295CC49E52D2E47CDBA5A96583C09775C1D3CA48CF17B107DEF921CE79117882F4460429724CE54428C33FAD30A8DF7F3B2552694AC26CFBAC0749D213D2E47CDBA5A9658378DA827A17800CE70F3DDF2BBF19B93A9FA2833FD35BB23DF004C90652538430302FCEF25BFAB3454AD6D5ED66289B5278DA827A17800CE76360B96EAAFD74F5D32BA5DBAC0009BE395957E7521B51C20BC6067A898B09E4090A508E0FED6299176DF2183F8FC7C0B04C176BEB4386DBCD04E86FAF290E2D7E9C4E3C761E06A71DD303D21008E29813377AFFFEAFD269A417C69337E82CC2E827F84554CEF50127C277FBC8AE2E8BA83251EDC214901ED5E8D9A59859A8B69DC5D3EDC80DC730089D37D7C0E48F6C5571747095F342E88FB05168BE4CE3AF
X-C1DE0DAB: 0D63561A33F958A502AF5CC0F737E1BDE6E421D4E4D075CA9D9B32EE4A20FDFFD59269BC5F550898D99A6476B3ADF6B47008B74DF8BB9EF7333BD3B22AA88B938A852937E12ACA751098AAFFB0A1231D8E8E86DC7131B365E7726E8460B7C23C
X-C8649E89: 4E36BF7865823D7055A7F0CF078B5EC49A30900B95165D345CB6DE26F1654667A017E7A8ADB2DD7E0B55067F40E6B47430419C486B4083750C4BFEBFB16380BD1D7E09C32AA3244CCB1E611204EE8A6573895B6803C473F263871F383B54D9B3FACE5A9C96DEB163
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojMA4lh0BuVjPCRqem6sOwmQ==
X-Mailru-Sender: 6C3E74F07C41AE94CB3BE32A1891474618DE35479E7EE78DA627C7923BFAD3723D2E05B2157A1A65E54CE59283E19BE8E66B5C1DBFD5D09DD72DCFCE6FA85F85A74E2CAFD6E5C6FC67EA787935ED9F1B
X-Mras: Ok


23.04.2021 18:08, Roger Pau Monné пишет:
> On Fri, Apr 23, 2021 at 01:22:34PM +0300, Sergey Kovalev wrote:
>> # Abstract
>>
>> After `xl save win win.mem` and then `xl restore win.hvm win.mem`
>> the Windows 10 VM remain frozen for about a minute. After the
>> minute it becomes responsive.
>>
>> During the freeze the OS remains semi-responsive: on `Ctrl+Shift+Esc`
>> press the wait cursor appears (blue circle indicator).
>>
>> This is an intermittent fault been reproduced only twice.
>>
>> # Technical notes
>>
>> It have been noticed that there were no timer interrupts during
>> the freeze.
>>
>> zaytsevgu@gmail.com has debugged the received Xen state file and
>> noticed that the flag HPET_TN_PERIODIC been set after unfreeze.
>>
>> Based on that he provided two Python scripts: one to check the
>> value and one to patch it.
>>
>> Both "broken" state files we have been detected and patched
>> successfully.
>>
>> # Other information
>>
>> ## Target machine
>>
>> ```bash
>> $ uname -a
>> Linux localhost 5.4.0-66-generic #74~18.04.2-Ubuntu SMP
>> Fri Feb 5 11:17:31 UTC 2021 x86_64 x86_64 x86_64 GNU/Linux
>> ```
>>
>> ## Xen version
>>
>> Build from source on tag RELEASE-4.12.4
>>
>> ## OS version
>>
>> * Windows 10 build 1803 x64
> 
> Do you also run other versions of Windows, and in which case I assume
> you have never seen the issue on those, or it's this specific version
> the only that you use?
> 
> Thanks, Roger.
> 

We use Windows 7 SP1 x86/x64, Windows 8.1 update1 and
Windows 10 1803 x64.

The Windows 10 is the only one affected by the bug at
the time.
-- 
With best regards,
Sergey Kovalev


