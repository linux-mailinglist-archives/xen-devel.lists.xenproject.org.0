Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1944F351623
	for <lists+xen-devel@lfdr.de>; Thu,  1 Apr 2021 17:23:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.104611.200297 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRzAK-0002nS-VP; Thu, 01 Apr 2021 15:23:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 104611.200297; Thu, 01 Apr 2021 15:23:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRzAK-0002n3-S9; Thu, 01 Apr 2021 15:23:24 +0000
Received: by outflank-mailman (input) for mailman id 104611;
 Thu, 01 Apr 2021 15:23:22 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=evtz=I6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lRzAI-0002my-M7
 for xen-devel@lists.xenproject.org; Thu, 01 Apr 2021 15:23:22 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3e0f563c-c0bd-4f67-a4f7-83bf3d90e85b;
 Thu, 01 Apr 2021 15:23:21 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 63F60B178;
 Thu,  1 Apr 2021 15:23:20 +0000 (UTC)
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
X-Inumbo-ID: 3e0f563c-c0bd-4f67-a4f7-83bf3d90e85b
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1617290600; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8IK3GLOdH0ou+vGzI9xfv152WM2AtTmLOx2bfWp3KnU=;
	b=gfZBD9Z3rJ5Bgg+vGhW3bQPhhLEGeysJGf+k/VQyfhxUEIbMu6+QRtOdPK81ddz0gRlamA
	HClKqd28r5Oc6ZmsrCRJ9M/ScA+O/yIbleX9WI1gzFnKB2/yoCjhQSqYNzfF0OtfArYtlN
	2IrgyznNwJyTj5792AzQLGihHuYpnrY=
Subject: Re: [PATCH 02/23] lib: move 64-bit div/mod compiler helpers
To: Julien Grall <julien@xen.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <c53a6802-8bae-1dc6-5ac4-6238e122aaa4@suse.com>
 <0fec827f-bb0b-4ea1-7757-9c27e9138be7@suse.com>
 <008a8b14-8f58-2127-9e97-87c696e07b5e@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <0ddcecbb-dc42-ba4e-fccc-6988c7e54456@suse.com>
Date: Thu, 1 Apr 2021 17:23:19 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <008a8b14-8f58-2127-9e97-87c696e07b5e@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 01.04.2021 16:56, Julien Grall wrote:
> On 01/04/2021 11:19, Jan Beulich wrote:
>> --- a/xen/common/lib.c
>> +++ b/xen/lib/divmod.c
>> @@ -40,7 +40,6 @@
>>    * OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
>>    * SUCH DAMAGE.
>>    */
>> -#if BITS_PER_LONG == 32
> 
> In theory BITS_PER_LONG == 32 is not quite the same as 32-bit arch. Can 
> you clarify whether this code is necessary on 64-bit arch where long is 
> only 32-bit.

Likely the compiler can get away without invoking these helpers, so
the code would remain unused. I'm uncertain whether CONFIG_64BIT
ought to be set for such an architecture, as we assume sizeof(long)
== sizeof(void*), and hence pointers would then need to be 32-bit
as well there.

Jan

