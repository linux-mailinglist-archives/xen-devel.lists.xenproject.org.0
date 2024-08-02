Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EBC72945B66
	for <lists+xen-devel@lfdr.de>; Fri,  2 Aug 2024 11:49:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.770876.1181479 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZou8-0002nj-4K; Fri, 02 Aug 2024 09:48:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 770876.1181479; Fri, 02 Aug 2024 09:48:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZou8-0002kb-0i; Fri, 02 Aug 2024 09:48:56 +0000
Received: by outflank-mailman (input) for mailman id 770876;
 Fri, 02 Aug 2024 09:48:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=q5EM=PB=bounce.vates.tech=bounce-md_30504962.66acab83.v1-f1cd66103ba84679b24e48d33b4ef37f@srs-se1.protection.inumbo.net>)
 id 1sZou6-0002kT-Qm
 for xen-devel@lists.xenproject.org; Fri, 02 Aug 2024 09:48:54 +0000
Received: from mail132-30.atl131.mandrillapp.com
 (mail132-30.atl131.mandrillapp.com [198.2.132.30])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6cbb129b-50b4-11ef-8776-851b0ebba9a2;
 Fri, 02 Aug 2024 11:48:52 +0200 (CEST)
Received: from pmta09.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail132-30.atl131.mandrillapp.com (Mailchimp) with ESMTP id
 4Wb1Hl2cjXzP0Jmsx
 for <xen-devel@lists.xenproject.org>; Fri,  2 Aug 2024 09:48:51 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 f1cd66103ba84679b24e48d33b4ef37f; Fri, 02 Aug 2024 09:48:51 +0000
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
X-Inumbo-ID: 6cbb129b-50b4-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1722592131; x=1722852631;
	bh=3paG7WC5tpFjE6isF4nMpqvZDXu4SaH1/XFsf9DbhnE=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=MMR44B54Pwb8w2eXIomrlVjLSDBqBq52/UsQonhkrowV5AqKP3XMig85HTvU3W4nU
	 8ra3FibVaOKJaYFzC3ehpkrsyBkWLyK7gwW+0eHiclFRvD0SqXp/6XDFNEQXqXGBZQ
	 EdA4iF/UjzGv956YB5VGlzbAsS93Z9gS5jGrqUQSqppuUpnwWTKxH4JSbZbU5XCUdw
	 MzHy8QIrdeFHOqiPvOSYbPh8rJ6oEM8B50WlS6VpweU7mznSu5b+rqgvglrSL84Rdw
	 LSDzE/TqpE6FKkiF0XH+QWnA9XG2EJsCCM30CbJ3PzsiR30ApMUaYg3H6FibJY5s/h
	 UXAh7fq2QRAWw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1722592131; x=1722852631; i=anthony.perard@vates.tech;
	bh=3paG7WC5tpFjE6isF4nMpqvZDXu4SaH1/XFsf9DbhnE=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=qIPRBUOgOFri+DZjQnN8dxBm+9g+gwjTXcRTa+TGYLu7+K2f9ahta5F5aSgGxk1yH
	 voRr0r5VKT2KoL8dNanN/Zqc22inu6bBe0zjm7uIKwCnbrSVzb3o+No3WUII7+CIHR
	 LteKiiyAroXeQW3Z2L386sEEvUF1YIZhE7jDtt0VP0ul1WAD8l47KhB/+SQAQsMBnQ
	 bYXeyBGSUda0KszbpiS6K+o5YotRW8uXq2btEw6RB/vo91GJ+Xn3b3QYD9jyRq4bBT
	 H9H4OHCdmc4rrM3nkHvtpk1ZIpQuMctj/DPOasArYO8GHPhRmB1VmPQPBWMC4ZQaS5
	 4FmYIdZTB/BBA==
From: Anthony PERARD <anthony.perard@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH]=20mktarball:=20only=20archive=20Xen?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1722592130481
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
Message-Id: <ZqyrgV5vXPKwppvP@l14>
References: <cf280800-d0d6-4493-933f-f83f418dd91d@suse.com> <Zqym5op9e2BAn5KA@l14> <4cff5f0b-3a19-4071-a201-51ea72ee48ce@suse.com>
In-Reply-To: <4cff5f0b-3a19-4071-a201-51ea72ee48ce@suse.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.f1cd66103ba84679b24e48d33b4ef37f?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20240802:md
Date: Fri, 02 Aug 2024 09:48:51 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On Fri, Aug 02, 2024 at 11:34:53AM +0200, Jan Beulich wrote:
> On 02.08.2024 11:29, Anthony PERARD wrote:
> > As for removing the rule "subtree-force-update-all", I don't think
> > that's a good idea at all. As long as Xen's build systems is cloning
> > subtrees we need to keep the rule. Those subtrees aren't going away
> > anytime soon, especially mini-os for stubdom.
> 
> So you expect people might be using that goal from the command line?
> Fair enough to keep it if so. I simply didn't think a goal with this
> long a name would be intended for manual use.

Well, there's "subtree-force-update" described in `make help`, intended
to be used by developers. The "-all" variate update every subtree
regardless whether they are enable with ./configure or not. I did confuse the
two when replying, so I don't know if "-all" variate is still useful or
not.

-- 

Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech

