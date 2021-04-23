Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D3DE369285
	for <lists+xen-devel@lfdr.de>; Fri, 23 Apr 2021 14:55:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.116315.222016 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZvLU-0001o8-2D; Fri, 23 Apr 2021 12:55:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 116315.222016; Fri, 23 Apr 2021 12:55:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZvLT-0001ni-V2; Fri, 23 Apr 2021 12:55:43 +0000
Received: by outflank-mailman (input) for mailman id 116315;
 Fri, 23 Apr 2021 12:55:41 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=YHlh=JU=list.ru=valor@srs-us1.protection.inumbo.net>)
 id 1lZvLR-0001nI-4f
 for xen-devel@lists.xen.org; Fri, 23 Apr 2021 12:55:41 +0000
Received: from smtp38.i.mail.ru (unknown [94.100.177.98])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7f8b6452-9177-4b23-af37-34ad591240bf;
 Fri, 23 Apr 2021 12:55:38 +0000 (UTC)
Received: by smtp38.i.mail.ru with esmtpa (envelope-from <valor@list.ru>)
 id 1lZvLN-0006JA-0I; Fri, 23 Apr 2021 15:55:37 +0300
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
X-Inumbo-ID: 7f8b6452-9177-4b23-af37-34ad591240bf
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=list.ru; s=mail3;
	h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc; bh=2ZCelCpoAhDVLvnvrVQAwERn99uFxR8hugb7AMaAT/Y=;
	b=DeOJffhHtczamzy400Q+zQRXzB5QrNQWE1t4BVfc9u/r3tHHx0SdHDvobHFsAjMzUQve8HS9oq2jHUg2KHgWGWYrYYT6lQ9vHpulA5ER4ZhJDfVgXRE5Pq4jR6BxFm93ZfTu2O5K7HlniiLkd3+MyH2t5ls41A0tQW5BdHVYaZ8=;
Subject: Re: Fwd: [BUG] Windows is frozen after restore from snapshot
To: Jan Beulich <jbeulich@suse.com>
Cc: zaytsevgu@gmail.com, xen-devel@lists.xen.org
References: <6237e102-f2cf-a66e-09b6-954ebfe28f8c@list.ru>
 <46f8bf3e-cd6e-e2de-94c1-c8a55fb10648@list.ru>
 <57478641-ed64-32bd-a577-428a50c880e2@suse.com>
From: Sergey Kovalev <valor@list.ru>
Message-ID: <33f08c57-08f7-b6c3-02ed-2b66c35665f2@list.ru>
Date: Fri, 23 Apr 2021 15:55:35 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <57478641-ed64-32bd-a577-428a50c880e2@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: ru-RU
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp38.i.mail.ru; auth=pass smtp.auth=valor@list.ru smtp.mailfrom=valor@list.ru
X-7564579A: B8F34718100C35BD
X-77F55803: 4F1203BC0FB41BD9203E2ABA940B7548DB5D504FB17EC32432A3176CEA2677EC182A05F53808504085E95345EB464DA24C95F89A687782216D5A5305607233B230D6E911F57BC8C2
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE76574C3D62D66A535EA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F7900637560334CFC131571A8638F802B75D45FF914D58D5BE9E6BC1A93B80C6DEB9DEE97C6FB206A91F05B2AF1BC9211A70670BEC21858D9C56A98EE8578C74B6F99271D2E47CDBA5A96583C09775C1D3CA48CF90D92131081DE748117882F4460429724CE54428C33FAD30A8DF7F3B2552694AC26CFBAC0749D213D2E47CDBA5A9658378DA827A17800CE74796267E12EBBF229FA2833FD35BB23DF004C90652538430302FCEF25BFAB3454AD6D5ED66289B5278DA827A17800CE7B4476AA2A0681E71D32BA5DBAC0009BE395957E7521B51C20BC6067A898B09E4090A508E0FED6299176DF2183F8FC7C06386F4032A53F176CD04E86FAF290E2D7E9C4E3C761E06A71DD303D21008E29813377AFFFEAFD269A417C69337E82CC2E827F84554CEF50127C277FBC8AE2E8BA83251EDC214901ED5E8D9A59859A8B682BBBAF5DF00056E089D37D7C0E48F6C5571747095F342E88FB05168BE4CE3AF
X-C1DE0DAB: 0D63561A33F958A5D639FBA1762BDC75D853ABC0275EC68A5FA3B338B835E598D59269BC5F550898D99A6476B3ADF6B47008B74DF8BB9EF7333BD3B22AA88B938A852937E12ACA751098AAFFB0A1231D8E8E86DC7131B365E7726E8460B7C23C
X-C8649E89: 4E36BF7865823D7055A7F0CF078B5EC49A30900B95165D341C998A3771F04153765BDB5EB6DF8C6D65D29333895DC1D97DAA1B127B531C49DB7B74C6134BAD091D7E09C32AA3244CEB0A499CBA5209151CAD959AE4670DD581560E2432555DBBFACE5A9C96DEB163
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojMA4lh0BuVjOIVEvxDfWrxA==
X-Mailru-Sender: 6C3E74F07C41AE94CB3BE32A1891474640BFCDF00F37DFA7C292F3EF877376C1A65DDDB4BCE16B06E54CE59283E19BE8E66B5C1DBFD5D09DD72DCFCE6FA85F85A74E2CAFD6E5C6FC67EA787935ED9F1B
X-Mras: Ok

23.04.2021 15:30, Jan Beulich пишет:

 > "Patched successfully" meaning the guest, when resumed using that
 > state, did not stall initially?

Yes.

 > In any event, if HPET_TN_PERIODIC was set after unfreeze, it was
 > also set upon saving state. (Or are you suggesting the flag got
 > "magically" set?)
I understand that it should be OS related. Though I don't understand
how to prevent similar issues in future.

 > Since
 > you've taken apart saved state, could you supply the full set of
 > values (ideally multiple ones, if you happen to have them, plus
 > ones where the problem didn't occur, to allow someone perhaps
 > spot a pattern)?
I could provide a xen state filed received with `xl save`.
Would it be help-full? Where to store the file?

-- 
With best regards,
Sergey Kovalev

