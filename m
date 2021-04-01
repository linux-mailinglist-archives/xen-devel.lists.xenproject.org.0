Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C795D351062
	for <lists+xen-devel@lfdr.de>; Thu,  1 Apr 2021 09:51:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.104119.198759 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRs6q-0008Kz-GL; Thu, 01 Apr 2021 07:51:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 104119.198759; Thu, 01 Apr 2021 07:51:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRs6q-0008Kd-DH; Thu, 01 Apr 2021 07:51:20 +0000
Received: by outflank-mailman (input) for mailman id 104119;
 Thu, 01 Apr 2021 07:51:19 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=evtz=I6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lRs6o-0008KY-S3
 for xen-devel@lists.xenproject.org; Thu, 01 Apr 2021 07:51:18 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4f27c75c-d8f4-4639-abcf-ca1f1e361d2b;
 Thu, 01 Apr 2021 07:51:18 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 21A85AF4F;
 Thu,  1 Apr 2021 07:51:17 +0000 (UTC)
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
X-Inumbo-ID: 4f27c75c-d8f4-4639-abcf-ca1f1e361d2b
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1617263477; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mM301/30alX098xW5XnviSToFopYKP7Lp25WeUemPCc=;
	b=OeHmsI0nhC9iydjwRHN0rVFTlD1/Q2lL3t6yScXSWn1j0eSLxuHwXTIrXC2ZJK3QC9iIIf
	iP6DDl0xivWpCf98eD/3t4klDm7r+TMz9AAlGzzyVlOqG5UNlQg31AwMETcbXTgs33FIXX
	xf89n6KqaU9oGG0FzaluS3oGEgh7EQs=
Subject: Ping: [PATCH 5/5] x86: don't build unused entry code when !PV32
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <46d83c92-0b06-fc09-4832-7a7d7935d5c2@suse.com>
 <d417d3f9-3278-ed08-1ff6-45a13b5e3757@suse.com>
 <20201228153004.qip3v6er5rk22fnu@Air-de-Roger>
 <0341c1f1-dc50-552c-f246-56605ae7c83a@suse.com>
 <20210104155358.snzakj4kcs47tt22@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <f3322a34-7887-98d7-b32f-fe6325e4ff14@suse.com>
Date: Thu, 1 Apr 2021 09:51:16 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <20210104155358.snzakj4kcs47tt22@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 04.01.2021 16:53, Roger Pau Monné wrote:
> On Mon, Jan 04, 2021 at 02:56:12PM +0100, Jan Beulich wrote:
>> On 28.12.2020 16:30, Roger Pau Monné wrote:
>>> I would like to have Andrew's opinion on this one (as you and him tend
>>> to modify more asm code than myself). There are quite a lot of
>>> addition to the assembly code, and IMO it makes the code more complex
>>> which I think we should try to avoid, as assembly is already hard
>>> enough.
>>
>> Well, while I can see your point (and I indeed asked myself the same
>> question when making this change), this merely follows the route
>> started with the addition on CONFIG_PV conditionals. If we think that
>> prior step didn't set a good precedent, we ought to undo it.
>> Otherwise I see no good argument against doing the same kind of
>> transformation a 2nd time (and further ones, if need be down the
>> road).
> 
> I think we need to apply some common sense and reach consensus about
> where it's fine to make code conditional at build time as to not make
> the existing code much harder to read and reason about. This is mostly
> a subjective decision, so I understand your concern.
> 
> I still think I would like Andrew opinion on this one, as said you and
> him are the ones mostly doing assembly coding. I find it already hard
> to follow myself without the conditionals.

Seeing no feedback for about 3 months, I intend to commit this once
the tree is fully open again (if need be without any acks), unless
I hear otherwise by then.

Jan

