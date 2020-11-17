Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BC77C2B67D3
	for <lists+xen-devel@lfdr.de>; Tue, 17 Nov 2020 15:50:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.29062.58281 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kf2JZ-0003Jc-Bw; Tue, 17 Nov 2020 14:50:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 29062.58281; Tue, 17 Nov 2020 14:50:37 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kf2JZ-0003JC-8l; Tue, 17 Nov 2020 14:50:37 +0000
Received: by outflank-mailman (input) for mailman id 29062;
 Tue, 17 Nov 2020 14:50:35 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+6JM=EX=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kf2JX-0003J7-I8
 for xen-devel@lists.xenproject.org; Tue, 17 Nov 2020 14:50:35 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 38ee0997-aef8-4514-8ca2-5c1e392bdcc7;
 Tue, 17 Nov 2020 14:50:34 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id C1D1FAC23;
 Tue, 17 Nov 2020 14:50:33 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=+6JM=EX=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kf2JX-0003J7-I8
	for xen-devel@lists.xenproject.org; Tue, 17 Nov 2020 14:50:35 +0000
X-Inumbo-ID: 38ee0997-aef8-4514-8ca2-5c1e392bdcc7
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 38ee0997-aef8-4514-8ca2-5c1e392bdcc7;
	Tue, 17 Nov 2020 14:50:34 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1605624633; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0XJx1Hac8LSV8gciGkalOYU/2bo1JHDIsC6Q7dplHtE=;
	b=HM7lGMBKddNO+cNqx4XGjP2TP7Wac9zyGTSTVkazxLorsnXK5zREgVrG6HM26MulWmql3e
	yj755Xi0Zw1ELS7tkBUjlQuLMtYtssDJEy2N3o2Fep5Z+3hlei83Zp69luE2idP0SSIlCJ
	gyHvgpqQIO/l+nFqe+H5hb2mKQ5jHv8=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id C1D1FAC23;
	Tue, 17 Nov 2020 14:50:33 +0000 (UTC)
Subject: Re: [PATCH 09/12] xen/hypfs: add support for id-based dynamic
 directories
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20201026091316.25680-1-jgross@suse.com>
 <20201026091316.25680-10-jgross@suse.com>
 <6f8c0d3d-73f6-d10f-182a-8bf76856bf09@suse.com>
 <95f673e5-90a8-0fe9-3842-bdb9de5c4aa4@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <0b8ae7db-b1f6-a23c-e608-27650db702ae@suse.com>
Date: Tue, 17 Nov 2020 15:50:34 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.3
MIME-Version: 1.0
In-Reply-To: <95f673e5-90a8-0fe9-3842-bdb9de5c4aa4@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 17.11.2020 15:38, Jürgen Groß wrote:
> On 17.11.20 14:33, Jan Beulich wrote:
>> On 26.10.2020 10:13, Juergen Gross wrote:
>>> +static struct hypfs_entry *hypfs_dyndir_findentry(struct hypfs_entry_dir *dir,
>>> +                                                  const char *name,
>>> +                                                  unsigned int name_len)
>>> +{
>>> +    struct hypfs_dyndir_id *data;
>>> +
>>> +    data = hypfs_get_dyndata();
>>> +    if ( !data )
>>> +        return ERR_PTR(-ENOENT);
>>> +
>>> +    /* Use template with original findentry function. */
>>> +    return data->template->e.funcs->findentry(data->template, name, name_len);
>>
>> Why does this pass the address of the template? If it truly is
>> (just) a template, then its dirlist ought to be empty at all
>> times? If otoh the "template" indeed gets used as a node in the
>> tree then perhaps it wants naming differently? "Stem" would come
>> to mind, but likely there are better alternatives. I've also
>> considered the German "Statthalter", but its English translations
>> don't seem reasonable to me here. And "placeholder" has kind of a
>> negative touch. (Also in this case some of my "const?" remarks
>> may be irrelevant.)
> 
> It is basically a template tree.
> 
> In the current use case (cpupool/<id>/sched-gran) the template is
> <id> with the leaf "sched-gran" which is the template for the per
> cpupool incarnation.

I can see sched-gran being a template, albeit even that will get
dirtied as soon as a second leaf appears, as then these entries
again need linking together. I think anything called template
should be strictly r/o.

It's also not clear to me how adding a 2nd level in the hierarchy
would end up working: <component>/<id1>/<id2>/<leaf>. How would
<leaf> know all the higher level IDs it's associated with? While
I don't think this needs making work right away, the underlying
model at least shouldn't prohibit it.

Jan

