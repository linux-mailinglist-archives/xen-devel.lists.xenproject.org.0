Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CCEAA655C0
	for <lists+xen-devel@lfdr.de>; Mon, 17 Mar 2025 16:32:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.917202.1322166 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuCS6-00021W-BE; Mon, 17 Mar 2025 15:32:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 917202.1322166; Mon, 17 Mar 2025 15:32:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuCS6-0001z4-8W; Mon, 17 Mar 2025 15:32:30 +0000
Received: by outflank-mailman (input) for mailman id 917202;
 Mon, 17 Mar 2025 15:32:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=KhIg=WE=redhat.com=armbru@srs-se1.protection.inumbo.net>)
 id 1tuCS4-0001tW-FB
 for xen-devel@lists.xenproject.org; Mon, 17 Mar 2025 15:32:28 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 04ae68f1-0345-11f0-9899-31a8f345e629;
 Mon, 17 Mar 2025 16:32:22 +0100 (CET)
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-79-rZ07XL0XNsqRgktiRCcYpg-1; Mon,
 17 Mar 2025 11:32:17 -0400
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id A6D9A180AF4D; Mon, 17 Mar 2025 15:32:13 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.22.74.4])
 by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 5F423180094A; Mon, 17 Mar 2025 15:32:12 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 4355821E675E; Mon, 17 Mar 2025 16:32:08 +0100 (CET)
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
X-Inumbo-ID: 04ae68f1-0345-11f0-9899-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1742225541;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=k6AP8qPgf7yOre7jra69M1oGbFQiEjvBM1isV3S1yxw=;
	b=ZLBIkAYgwC3ZAPUN0TUVj+LfbMbj+L5GtbPhrQ4PUpdzs4nAeX3lkpwmo+emIzvzThFyBG
	e59mk+NqUMag4wNgseLUW7LOWvWv02LywA1J9M/bmV/ODab8HgcVj3/9SwGZsPpmfbC7xn
	BMRLhK9riZ6xekPl85EBBgxsBTETfxM=
X-MC-Unique: rZ07XL0XNsqRgktiRCcYpg-1
X-Mimecast-MFC-AGG-ID: rZ07XL0XNsqRgktiRCcYpg_1742225534
From: Markus Armbruster <armbru@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: Pierrick Bouvier <pierrick.bouvier@linaro.org>,  Anthony PERARD
 <anthony.perard@vates.tech>,  qemu-devel@nongnu.org,  qemu-ppc@nongnu.org,
  Yoshinori Sato <ysato@users.sourceforge.jp>,  Paul Durrant
 <paul@xen.org>,  Peter Xu <peterx@redhat.com>,  alex.bennee@linaro.org,
  Harsh Prateek Bora <harshpb@linux.ibm.com>,  David Hildenbrand
 <david@redhat.com>,  Alistair Francis <alistair.francis@wdc.com>,  Richard
 Henderson <richard.henderson@linaro.org>,  "Edgar E. Iglesias"
 <edgar.iglesias@gmail.com>,  Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
  Nicholas Piggin <npiggin@gmail.com>,  Daniel Henrique Barboza
 <danielhb413@gmail.com>,  qemu-riscv@nongnu.org,
  manos.pitsidianakis@linaro.org,  Palmer Dabbelt <palmer@dabbelt.com>,
  kvm@vger.kernel.org,  xen-devel@lists.xenproject.org,  Stefano Stabellini
 <sstabellini@kernel.org>,  Paolo Bonzini <pbonzini@redhat.com>,  Weiwei Li
 <liwei1518@gmail.com>,  Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH v5 00/17] make system memory API available for common code
In-Reply-To: <3ce90214-a080-4ae8-86ff-9f8fd20f1733@linaro.org> ("Philippe
	=?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Mon, 17 Mar 2025 10:21:00
 +0100")
References: <20250314173139.2122904-1-pierrick.bouvier@linaro.org>
	<5951f731-b936-42eb-b3ff-bc66ef9c9414@linaro.org>
	<Z9R2mjfaNcsSuQWq@l14>
	<ee814e2f-c461-4cc2-889d-16bb2df44fdf@linaro.org>
	<3ce90214-a080-4ae8-86ff-9f8fd20f1733@linaro.org>
Date: Mon, 17 Mar 2025 16:32:08 +0100
Message-ID: <87h63rekqv.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111

Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> writes:

> Hi,
>
> On 14/3/25 19:39, Pierrick Bouvier wrote:
>> On 3/14/25 11:34, Anthony PERARD wrote:
>>> On Fri, Mar 14, 2025 at 10:33:08AM -0700, Pierrick Bouvier wrote:
>>>> Hi,
>>>>
>>>> one patch is missing review:
>>>> [PATCH v5 12/17] hw/xen: add stubs for various functions.
>>>
>>> My "Acked-by" wasn't enough? Feel free try change it to "Reviewed-by"
>>> instead.
>>>
>> Those are differents. From what I understand, Reviewed implies Acked, bu=
t the opposite is not true. If it was, they would be equivalent.
>> Thanks.
>
> IIUC on QEMU Acked-by means "as a maintainer of files modified by
> this patch, I don't have objection on my area, as long as someone
> else takes the patch". It doesn't mean the patch has been reviewed.
>
> Please correct me if I'm wrong.

Documentation/process/submitting-patches.rst has some advice, but not
much.  Kernel docs are more thorough, and I believe the information
there applies to QEMU reasonably well:

https://docs.kernel.org/process/5.Posting.html#patch-formatting-and-changel=
ogs


