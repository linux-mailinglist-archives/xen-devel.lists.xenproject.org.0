Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C247F3CAE7C
	for <lists+xen-devel@lfdr.de>; Thu, 15 Jul 2021 23:24:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.156948.289607 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m48pE-0008Kr-Gg; Thu, 15 Jul 2021 21:23:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 156948.289607; Thu, 15 Jul 2021 21:23:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m48pE-0008J2-DH; Thu, 15 Jul 2021 21:23:20 +0000
Received: by outflank-mailman (input) for mailman id 156948;
 Thu, 15 Jul 2021 21:23:18 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=55eu=MH=bounce.vates.fr=bounce-md_30504962.60f0a744.v1-a4f06ca28cd744a985a1551ff8dd0c63@srs-us1.protection.inumbo.net>)
 id 1m48pC-0008It-HZ
 for xen-devel@lists.xenproject.org; Thu, 15 Jul 2021 21:23:18 +0000
Received: from mail145-24.atl61.mandrillapp.com (unknown [198.2.145.24])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id debaa324-e5b2-11eb-892c-12813bfff9fa;
 Thu, 15 Jul 2021 21:23:16 +0000 (UTC)
Received: from pmta06.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail145-24.atl61.mandrillapp.com (Mailchimp) with ESMTP id
 4GQnR84CPjzGlsnyd
 for <xen-devel@lists.xenproject.org>; Thu, 15 Jul 2021 21:23:16 +0000 (GMT)
Received: from [185.78.159.90] by mandrillapp.com id
 a4f06ca28cd744a985a1551ff8dd0c63; Thu, 15 Jul 2021 21:23:16 +0000
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
X-Inumbo-ID: debaa324-e5b2-11eb-892c-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.fr;
	s=mandrill; t=1626384196; i=charles.schulz@vates.fr;
	bh=Tp9bH+cYU/zl+a5MhwxZN8iPwjd4N9cfUSPfU8F5kRc=;
	h=From:Subject:To:Cc:Message-Id:Date:MIME-Version:Content-Type;
	b=Ywhvh1oEV616SFcsXDApxGED0M2PqXTA79spyTysK/x4LAtSgwqaBQ10QvCn++P3H
	 zs42kEBvhIWXxcxJuRsgdnlESWGv1OQLirL01TTa3/5YMhqIZP0tfioYVJOVOIvUVo
	 NZSeWsdK23+y2oCOiOmlE5DJs6bQjYJHlCDJ0RgE=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com; 
 i=@mandrillapp.com; q=dns/txt; s=mandrill; t=1626384196; h=From : 
 Subject : To : Cc : Message-Id : Date : MIME-Version : Content-Type : 
 From : Subject : Date : X-Mandrill-User : List-Unsubscribe; 
 bh=Tp9bH+cYU/zl+a5MhwxZN8iPwjd4N9cfUSPfU8F5kRc=; 
 b=k0FQfmR2FSaU/PdnYOTlOP2BJqQOOB4F4PYqvIa2iBWljnqS7UZoCit5mAeclLqRl4ccXG
 J2pqr+5btorP8m+UTOTwC5j78BtkOmzjmVKMSZg1WrTYi4k+mTsVy3ZGrSfSFvHVeGAPoEUS
 xzp1Mab9hLAOIo18RnN+VfgahRzgc=
From: "Charles-H. Schulz" <charles.schulz@vates.fr>
Subject: Suggested changes to the admission policy of the vulnerability pre-disclosure list
X-Virus-Scanned: amavisd-new at vates.fr
To: xen-devel@lists.xenproject.org
Cc: 
Message-Id: <87r1fzclw0.fsf@vates.fr>
X-Report-Abuse: Please forward a copy of this message, including all headers, to abuse@mandrill.com
X-Report-Abuse: You can also report abuse here: http://mandrillapp.com/contact/abuse?id=30504962.a4f06ca28cd744a985a1551ff8dd0c63
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20210715:md
Date: Thu, 15 Jul 2021 21:23:16 +0000
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="_av-FpYHEP5ClHZ4aaYfD4CIbQ"

--_av-FpYHEP5ClHZ4aaYfD4CIbQ
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Hello,

I /we /Vates would like to suggest some changes to the policy regarding the
enrollment to the pre-disclosure mailing list of the Xen Security Team.

We have had some talks with the French national CERT who has a need to be the
recipient of such a list. This national CERT -and in my experience other
national CERTs such as the NIST for instance- is in constant contact with a
large Xen userbase that is mostly made up of large parts of the public sector
as well as critical infrastructure operators belonging to the private
sector. For confidentiality reasons they cannot disclose who uses Xen and
where it is used nor who may be using it internally or within the related
national cybersecurity authority.

Because of that, their request may not be clear or matching the existing
criteria for inclusion in the mailing list. National CERTs are trusted
actors and have historically been among the very first entities to define,
advocate for and put in practice the very notion of responsible
disclosure. Much of the current practice of Open Source projects in that
regard actually stems from CERTs. As part of their policies and processes
regarding vulnerability disclosure, the notion of confidentiality and
documented, waterfall-like processes of disclosure is play an integral
part of
how they handle informaton and publicity around vulnerability. As a result,
national CERTs (and the French National CERT) do not spread undisclosed
vulnerability without following established and agreed-upon processes. Such
processes include, in our instance, the ones defined and followed by the Xen
Security Team. Compliance with these are the first criteria to earn trust and
respect from the ecosystem and the downstream users. You can see an example
of their work here: https://www.cert.ssi.gouv.fr/

Part of the mission of the French National CERT is to work with
critical infrastructure providers in securing their IT.
This kind of expertise entails the securing of these information
systems before any unforeseen incident as well as after the incident
(incident remediation).
None of the tasks involved imply the communication of zero-day types
of vulnerabilities or vulnerabilities that are unpublished to the
downstream users.

I hope this clarifies the request and I'm looking forward to your feedback.

Best regards,

-- 
Charles-H. Schulz
Chief Strategy Officer - CSO
XCP-ng & Xen Orchestra - Vates solutions


--_av-FpYHEP5ClHZ4aaYfD4CIbQ
Content-Type: application/pgp-signature
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="signature.asc"

LS0tLS1CRUdJTiBQR1AgU0lHTkFUVVJFLS0tLS0KCmlRSk1CQUVCQ0FBMkZp
RUVCcE15NjBzdVV4LzhhVjUxZnFKcldiZVl0T01GQW1Ed3B5OFlIR05vWVhK
c1pYTXUKYzJOb2RXeDZRSFpoZEdWekxtWnlBQW9KRUg2aWExbTNtTFRqN0FJ
UC8wQTRYL20yS2ZoYWNZaVVTSllIZlZzVApad3RhRUNjTE9QSW52Y08rWEI2
cWZsQ0d2MHBWSkdlMlJxb1YxSzJGYitYUzBLTTdTNzJDVGwyb0c0RE5PL09m
CndmZkNtSUdlcXdxdHNjSXlyVFBqbnF4Tm5TT2pOVm9Td0NQRjVVTEk4eUNo
ZFZoV3RDTDF6WitRQS9qY1NxZy8KVXhzV2lVMDBaN0xGZVFsdDltTHk1MWxX
UVZjS2lsQ2xJZXhpN1g0SWZDZ205MFVLY0R2U3ZsSWdFWTFyWGFrbwpZcnd3
SHpWdTdveW9zQkw4azhKb2pwVlFpWlhIQXRwU0hPd1Y4S3hrWVEzakVQZkth
Rm9HK0F6TXRQdmt5SzZkCnVwNXRUTUE1M0ovMGxoNDdPRkhqMnV3QjhpSGRM
RWRTZEZoOXg5aGRQQXlibDZVcGlDbzFGVm8wNDBsakc1MTYKNjYvYTRXUU10
TTlBMHQ0bkNCQlIzQnNDSGpRQ09ZQVFab0JudllJaTlWVEdyN2duS0psdXc5
QjBERkd2YTZzYwp3SFp3STNrNW5mMFVhU2pPK1Znbk5qQVg2Y0JrSTVicUtQ
YUt3TlBtMXU5cjl5b0ZjdUdqUUQ2L1RXNGFvbk5WCmhkUDFQOE5wNUdYd2M4
WlBCYlM2RmNnUEQ1MnFtWHF1ZXN3ZDFOMlgrdldPQWJPMWpZQ29Yb3lZMVk0
NVZrZFoKekZxeHdlZ2ZWQW9SQjRsenNWaWF3Vk02MzZMY3B6clB6a2h5WjQy
a3NId0N1NCtIMmhjK1F5ODhEOFJxWmVqQgpUUkoreWNtRWZYd0pyVlhPN09h
R1g4eWlxOGNOZWF1QWxmWFJVaXZNaWVNZTdvWDQyL0wyL0lNTFI3Ull1L1c5
CjlIQWNEYUpSaXFWN1ZQVkN3QmoxCj1EZTE2Ci0tLS0tRU5EIFBHUCBTSUdO
QVRVUkUtLS0tLQo=

--_av-FpYHEP5ClHZ4aaYfD4CIbQ--


