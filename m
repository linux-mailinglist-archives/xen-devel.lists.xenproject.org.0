Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 58AB8662513
	for <lists+xen-devel@lfdr.de>; Mon,  9 Jan 2023 13:09:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.473583.734261 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pEqx7-0001rf-Jt; Mon, 09 Jan 2023 12:08:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 473583.734261; Mon, 09 Jan 2023 12:08:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pEqx7-0001pg-G6; Mon, 09 Jan 2023 12:08:33 +0000
Received: by outflank-mailman (input) for mailman id 473583;
 Mon, 09 Jan 2023 12:08:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TjmM=5G=desiato.srs.infradead.org=BATV+c4f4c0a351f3f62582fc+7078+infradead.org+dwmw2@srs-se1.protection.inumbo.net>)
 id 1pEqx5-0001pa-Es
 for xen-devel@lists.xenproject.org; Mon, 09 Jan 2023 12:08:32 +0000
Received: from desiato.infradead.org (desiato.infradead.org
 [2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 51dc7caa-9016-11ed-91b6-6bf2151ebd3b;
 Mon, 09 Jan 2023 13:08:29 +0100 (CET)
Received: from [2001:8b0:10b:1:b916:482e:69fd:b8ad] (helo=[IPv6:::1])
 by desiato.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1pEqwq-002iBc-0V; Mon, 09 Jan 2023 12:08:16 +0000
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
X-Inumbo-ID: 51dc7caa-9016-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Message-ID:References:In-Reply-To:Subject:CC:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=9a7cthhMBn+fiERgH4CK4Ki4YEtD9TG5jpHvDi/tOEo=; b=Fo9zpnpI7UBzufJvu5HcNTrO/D
	6QBdJtaAOHdTslw5o6E0XWsT6VMss13MKp6+ADHiDU6VpOky+qlQ0VkjwwFL6/SDwDwrGD7YWY4LU
	sjQ2AUV+O3lRkYjw8pLWpZAPzojaPGee6H3i7sr0WjVCYZ5C1SGH7CJYqb0o66y8+g+IzenxGOkTY
	TqNSuDjjgltdWDqlv1NgC0LiUNWk4K7JqWl33rjR9Fae5PSHYtQNXbDEhSYV21iUc/8kubRoXd13U
	LKLGQdNJabdRlaRBycKKqZ0qJdQv38HLZmX5liwpUNn5DK02NFuta37DrNTcGTm/Dj4FE4AmZrvAT
	RQXRdNgw==;
Date: Mon, 09 Jan 2023 12:08:19 +0000
From: David Woodhouse <dwmw2@infradead.org>
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
CC: Julien Grall <jgrall@amazon.com>
Subject: Re: (Ab)using xenstored without Xen
User-Agent: K-9 Mail for Android
In-Reply-To: <a1ee03ca-1304-17c8-d075-9a235aa02fee@suse.com>
References: <22a2352464be2df92dc0d30a955034c59fdf3927.camel@infradead.org> <a1ee03ca-1304-17c8-d075-9a235aa02fee@suse.com>
Message-ID: <60DDB54B-41CC-4DE9-83C9-FA20AEEAA9E8@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by desiato.infradead.org. See http://www.infradead.org/rpr.html



On 9 January 2023 07:40:06 GMT, Juergen Gross <jgross@suse=2Ecom> wrote:
>Sorry for the late answer, but I was pretty busy before my 3 week time of=
f=2E :-)

No problem, I had lots of other things to work on, including my own time o=
ff=2E Hope you enjoyed it!

>On 20=2E12=2E22 13:02, David Woodhouse wrote:
>> I've been working on getting qemu to support Xen HVM guests 'natively'
>> under KVM:
>> https://lore=2Ekernel=2Eorg/qemu-devel/20221216004117=2E862106-1-dwmw2@=
infradead=2Eorg/T/
>>=20
>> The basic platform is mostly working and I can start XTF tests with
>> 'qemu -kernel'=2E Now it really needs a xenstore=2E
>>=20
>> I'm thinking of implementing the basic shared ring support on the qemu
>> side, then communicating with the real xenstored over its socket
>> interface=2E It would need a 'SU' command in the xenstored protocol to
>> make it treat that connection as an unprivileged connection from a
>> specific domid, analogous to 'INTRODUCE' but over the existing
>> connection=2E
>
>Wouldn't an "unprivileged" socket make more sense?

Not sure=2E I think we still need a privileged operation to "introduce" th=
e client domain anyway, don't we?

>> However, there might be a bit of work to do first=2E At first, it seeme=
d
>> like xenstored did start up OK and qemu could even connect to it when
>> not running under Xen=2E But that was a checkout from a few months ago,
>> and even then it would segfault the first time we try to actually
>> *write* any nodes=2E
>>=20
>> Newer xenstored breaks even sooner because since commit 60e2f6020
>> ("tools/xenstore: move the call of setup_structure() to dom0
>> introduction") it doesn't even have a tdb_ctx if you start it with the
>> -D option, so it segfaults even on running xenstore-ls=2E And if I move
>> the tdb part of setup_structure() back to be called from where it was,
>> we get a later crash in get_domain_info() because the xc_handle is
>> NULL=2E
>>=20
>> Which is kind of fair enough, because xenstored is designed to run
>> under Xen :)
>>=20
>> But what *is* the -D option for? It goes back to commit bddd41366 in
>> 2005 whch talks about allowing multiple concurrent transactions, and
>> doesn't mention the new option at all=2E It seems to be fairly hosed at
>> the moment=2E
>
>I guess this was some debugging add-on which hasn't been used for ages=2E
>
>I'm inclined to just remove the -D option=2E

Or use it for the new Xenless behaviour perhaps?

>> Is it reasonable to attempt "fixing" xenstored to run without actual
>> Xen, so that we can use it for virtual Xen support?
>
>I don't see a major problem with that=2E
>
>The result shouldn't be too ugly, of course, and I don't see any effort
>on Xen side to test any changes for not breaking your use case=2E

If anything it possibly makes some test cases a lot easier to run?

