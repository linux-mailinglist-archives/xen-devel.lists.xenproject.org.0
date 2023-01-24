Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 82809679DF2
	for <lists+xen-devel@lfdr.de>; Tue, 24 Jan 2023 16:50:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.483600.749849 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pKLXc-0005fe-TA; Tue, 24 Jan 2023 15:48:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 483600.749849; Tue, 24 Jan 2023 15:48:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pKLXc-0005d3-PP; Tue, 24 Jan 2023 15:48:56 +0000
Received: by outflank-mailman (input) for mailman id 483600;
 Tue, 24 Jan 2023 15:48:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=pasG=5V=list.ru=valor@srs-se1.protection.inumbo.net>)
 id 1pKLXa-0005cx-Ml
 for xen-devel@lists.xen.org; Tue, 24 Jan 2023 15:48:55 +0000
Received: from smtp40.i.mail.ru (smtp40.i.mail.ru [95.163.41.81])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9845d4fc-9bfe-11ed-b8d1-410ff93cb8f0;
 Tue, 24 Jan 2023 16:48:50 +0100 (CET)
Received: by smtp40.i.mail.ru with esmtpa (envelope-from <valor@list.ru>)
 id 1pKLXV-008lrn-3x
 for xen-devel@lists.xen.org; Tue, 24 Jan 2023 18:48:49 +0300
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
X-Inumbo-ID: 9845d4fc-9bfe-11ed-b8d1-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=list.ru; s=mail4;
	h=Content-Transfer-Encoding:Content-Type:Subject:From:To:MIME-Version:Date:Message-ID:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc; bh=6HXaMn8jM3dUyZ4mo/ZEhnoBNBA/htq7A1eFp9MAzro=;
	t=1674575330;x=1674665330; 
	b=PlF8aJ9uflhsCdkK1BYJ5NZU0DPGumRbOyh3hgsANezUDC2k4zpZhEf5ivlROiXYMYAbZrvZVPuGnfI4z89IuscDi7ZmOrqlRWgds1xshR/nnD6xd/9h+pzy2Gx4fZ+h8hF5A9yylp+S+YPadhfYQJSQB/DDlDgnjByiqAi/5j5wtUFiyuNYpBdC2b2wqXoLqQguTGO//bT9JwEHgG6PrMc5karX5NmO99/Jq1QwYUJlQgSC8VrfHp/MqLXx2HcD8Vu9bhu6naoRZNBpvGhE/PFC/qyyxVPLFhXHxvyi5kBSRFHzUTn5qlRbm2uQqF6+U85owzaQLsdJ7ADWInpAfA==;
Message-ID: <ce6e1346-bfea-f047-4a9e-f19c9c48e851@list.ru>
Date: Tue, 24 Jan 2023 18:48:48 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
To: xen-devel@lists.xen.org
Content-Language: ru, en-US
From: =?UTF-8?B?0JrQvtCy0LDQu9GR0LIg0KHQtdGA0LPQtdC5?= <valor@list.ru>
Subject: Xen Kdump analysis with crash utility
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Authentication-Results: smtp40.i.mail.ru; auth=pass smtp.auth=valor@list.ru smtp.mailfrom=valor@list.ru
X-Mailru-Src: smtp
X-7564579A: B8F34718100C35BD
X-77F55803: 4F1203BC0FB41BD9A6D6F5724DD3A0B68C669C2C04C2179C0C66A1D1D8F87810182A05F53808504071D413726DFE6304B63603C4812286292138486762FBF294E8F86B91EF63082F
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE72847AA60176ABEF3EA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F7900637D24CDE3D695BBBC6EA1F7E6F0F101C6723150C8DA25C47586E58E00D9D99D84E1BDDB23E98D2D38B6F1F7B995052D5CEA95824367E20669B48CAAB5AC5CB88DB20879F7C8C5043D14489FFFB0AA5F4BF176DF2183F8FC7C068077CCD40B79AC98941B15DA834481FA18204E546F3947CED96AA85C75E140D117882F4460429724CE54428C33FAD30A8DF7F3B2552694AC26CFBAC0749D213D2E47CDBA5A9658378DA827A17800CE7C88295285D2BDD949FA2833FD35BB23DF004C90652538430302FCEF25BFAB3454AD6D5ED66289B5278DA827A17800CE7B559B571F7C468CAD32BA5DBAC0009BE395957E7521B51C20BC6067A898B09E4090A508E0FED6299176DF2183F8FC7C01B16E1F2CD1A17DACD04E86FAF290E2DB606B96278B59C421DD303D21008E29813377AFFFEAFD269A417C69337E82CC2E827F84554CEF50127C277FBC8AE2E8BA83251EDC214901ED5E8D9A59859A8B6CF11E2829993B7FCEFF80C71ABB335746BA297DBC24807EABDAD6C7F3747799A
X-C1DE0DAB: 0D63561A33F958A5B2C1FD409F46313C5FB9B145A985421178CD409596333F904EAF44D9B582CE87C8A4C02DF684249CC203C45FEA855C8F
X-C8649E89: 4E36BF7865823D7055A7F0CF078B5EC49A30900B95165D346F44602F3B4946346F47734530D7F902BD972D5050F2F4459EDC303C4634050C5508B2FC52C90CB51D7E09C32AA3244CB04EC87922053176B8B73F16A0A5C5DBF26BFA4C8A6946B83EB3F6AD6EA9203E
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2bioj4ukhBIi/0FCSCARYYvmRVg==
X-Mailru-Sender: 6C3E74F07C41AE94600CBC3F37424253AEFFECFB15C1A7282DBEF3C44E9F9C2E8E785B02A3EBB0B4671A0538F0E0E4B8C77752E0C033A69E86F8B8EC1BECD1EECCC3E8BC0E932F7CB4A721A3011E896F
X-Mras: Ok

Hello,

I'm trying to start use of Kdump in my Xen 4.16 setup with Ubuntu 
18.04.6 ( 5.4.0-137-generic ).

I was able to load "dump-capture kernel" with kexec-tools and collect 
crashdump with makedumpfile like this:
```
makedumpfile -E -X -d 0 /proc/vmcore /var/crash/dump
```

This dump file could be used to analyze Dom0 panics.

Though I have some issues while analyzing dump file for Xen kernel:
```
  ~/src/crash/crash --hyper ~/xen-syms-dbg/usr/lib/debug/xen-syms 
/var/crash/202301241536/dump.202301241536

crash 8.0.2++
...
GNU gdb (GDB) 10.2
...
crash: invalid kernel virtual address: 1ef8  type: "fill_pcpu_struct"
WARNING: cannot fill pcpu_struct.

crash: cannot read cpu_info.
```

As far as I know developers community of crash utility doesn't actively 
support Xen. From 
https://github.com/crash-utility/crash/issues/21#issuecomment-330847410 :
```
I cannot help you with Xen-related issues because Red Hat stopped releasing
Xen kernels several years ago (RHEL5 was the last Red Hat kernel that 
contained
a Xen kernel).  Since then, ongoing Xen kernel support in the crash utility
has been maintained by engineers who work for other distributions that still
offer Xen kernels.
```

Does anybody use kdump to analyze Xen crashes? Could anybody share some 
tips and tricks with me to use crash or other tools with such dumps?

Thanks a lot.
-- 
Best regards,
Sergey Kovalev


