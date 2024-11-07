Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7023D9C097F
	for <lists+xen-devel@lfdr.de>; Thu,  7 Nov 2024 16:00:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.831879.1247258 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t93zA-0003xd-Fb; Thu, 07 Nov 2024 14:59:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 831879.1247258; Thu, 07 Nov 2024 14:59:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t93zA-0003uY-Ct; Thu, 07 Nov 2024 14:59:48 +0000
Received: by outflank-mailman (input) for mailman id 831879;
 Thu, 07 Nov 2024 14:59:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UaIZ=SC=bounce.vates.tech=bounce-md_30504962.672cd5dd.v1-d3db07cae15342c28425c0fbcbd0c7e8@srs-se1.protection.inumbo.net>)
 id 1t93z9-0003uM-5R
 for xen-devel@lists.xenproject.org; Thu, 07 Nov 2024 14:59:47 +0000
Received: from mail136-12.atl41.mandrillapp.com
 (mail136-12.atl41.mandrillapp.com [198.2.136.12])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id eb18bc92-9d18-11ef-99a3-01e77a169b0f;
 Thu, 07 Nov 2024 15:59:42 +0100 (CET)
Received: from pmta11.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail136-12.atl41.mandrillapp.com (Mailchimp) with ESMTP id
 4Xklbd24Bhz5QkP7K
 for <xen-devel@lists.xenproject.org>; Thu,  7 Nov 2024 14:59:41 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 d3db07cae15342c28425c0fbcbd0c7e8; Thu, 07 Nov 2024 14:59:41 +0000
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
X-Inumbo-ID: eb18bc92-9d18-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjE5OC4yLjEzNi4xMiIsImhlbG8iOiJtYWlsMTM2LTEyLmF0bDQxLm1hbmRyaWxsYXBwLmNvbSJ9
X-Custom-Transaction: eyJpZCI6ImViMThiYzkyLTlkMTgtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMwOTkxNTgzLjA3ODYyMywic2VuZGVyIjoiYm91bmNlLW1kXzMwNTA0OTYyLjY3MmNkNWRkLnYxLWQzZGIwN2NhZTE1MzQyYzI4NDI1YzBmYmNiZDBjN2U4QGJvdW5jZS52YXRlcy50ZWNoIiwicmVjaXBpZW50IjoieGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnIn0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1730991581; x=1731252081;
	bh=rAB3NA4jAWP69vOTwwHucDx92mVM2KIOfw2tuJPI2Rw=;
	h=From:Subject:To:Message-Id:Feedback-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:CC:Date:Subject:From;
	b=gUdLgKKeXPXfcuuwtkXZ0qgg+uIGlc/m6dulHMYfcAPnbLRYZ6tCN+yXJ3YEsbQ4Q
	 14IXFffwePbamhxvUbNYVhU4X0u4rfJw9K7lHX0QQslb7jya4tNyfTR/yZl5FMerD8
	 F6MMYmaW0dDSkbD4jW5oubYHW4LDBrM+53UPUxlIVJ8WoAl9FCJ5+s3JO1wncUzSm0
	 aRr9oydFJj3lG5IwnSLcXyFWjucjCk0c4F9d631qzR0fMkddb/vTV395bfqlPVRdIs
	 ynkd6QJQAvkQnwzjseqZ07CxmmQ3s9EOOq5BfLOrxKWyK4PJDjobZwDqP2TzjBYZrN
	 KQUzsEu+0Hx2w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1730991581; x=1731252081; i=anthony.perard@vates.tech;
	bh=rAB3NA4jAWP69vOTwwHucDx92mVM2KIOfw2tuJPI2Rw=;
	h=From:Subject:To:Message-Id:Feedback-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:CC:Date:Subject:From;
	b=L2oRyORFgMGnerTB/z8+PYAZMblQorzDcJ83E4R5YGqZYhztH3vi+tV8FULwF9p6z
	 sY+Wdp3TXqZMkBldV52KqJ+Bsx9GZ/QWjWIaFnlq47vRtEyjf9g6OIw9ODHBpTtWYg
	 4AFtElIFByddg5wa2k958pRV+f2rdfn9dU3qk/+4ouym1wiVl98dgc9k2UzZCrZyZ8
	 G41jCd53kqfYHrQrHO5qRTg1taSjLRONV2sNuoxugNNv5DPUJmUcQI0ePh1QnitmmT
	 BBqzNjyOaSuWxGgd68rB/UfsOU6Wbv7t79Sr0/vGP5ZKhLh2HEZG/wSD5SLHHq+64g
	 RlKmcOjFgf/Tw==
From: "Anthony PERARD" <anthony.perard@vates.tech>
Subject: =?utf-8?Q?Xen=20Project=20Winter=20Meetup=202025?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1730991580551
To: xen-devel@lists.xenproject.org, xen-announce@lists.xenproject.org, xen-users@lists.xenproject.org
Message-Id: <ZyzV2GBrFgz+z1dK@l14>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.d3db07cae15342c28425c0fbcbd0c7e8?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20241107:md
Date: Thu, 07 Nov 2024 14:59:41 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Hello everyone!

Vates is pleased to organize the next Xen Project Winter Meetup. With
this in mind, we're excited to announce that we'll be hosting the Xen
Winter Summit in January 2025, on Thursday 30th and Friday 31st.

Here's what's in store: After a welcoming breakfast, we'll dive into two
days of talks and collaboration, organized as follows:

 - Morning: Talk sessions
 - Afternoon: Design sessions

Whether you're already a Xen developer or just starting out with system
development skills, this event will give you the opportunity to work on
Xen topics to improve the hypervisor. You'll collaborate with Xen
maintainers and help newcomers, including academics, join the project.
We encourage you to register and submit a proposal if you'd like to
share on a related topic - all contributions are welcome, and we'll
review each with great interest.

You can register and submit your proposal at
    https://campaign.vates.tech/xen-project-winter-meetup
at the bottom of the page.

This site also contains all the information related to the event.

We're also organizing a private tour of Aconit, Europe's largest and
oldest computer museum collection, on Thursday afternoon, as well as a
gourmet evening out in Grenoble. A detailed schedule of presentations
and activities will follow soon. The link above also provides guides for
accommodations, directions to the university venue, and activities,
should you wish to enjoy the snow over the weekend or explore Grenoble's
local culture.

Please don't hesitate to reach out for any additional information.

-- 

Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech

