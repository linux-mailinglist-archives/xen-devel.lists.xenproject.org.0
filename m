Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 553B774F5B9
	for <lists+xen-devel@lfdr.de>; Tue, 11 Jul 2023 18:41:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.561839.878407 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJGQ9-0004G7-ED; Tue, 11 Jul 2023 16:41:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 561839.878407; Tue, 11 Jul 2023 16:41:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJGQ9-0004Cm-B2; Tue, 11 Jul 2023 16:41:01 +0000
Received: by outflank-mailman (input) for mailman id 561839;
 Tue, 11 Jul 2023 16:40:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=t7q7=C5=bugseng.com=roberto.bagnara@srs-se1.protection.inumbo.net>)
 id 1qJGQ7-0004Cg-NS
 for xen-devel@lists.xenproject.org; Tue, 11 Jul 2023 16:40:59 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b62573bc-2009-11ee-b239-6b7b168915f2;
 Tue, 11 Jul 2023 18:40:58 +0200 (CEST)
Received: from [192.168.1.48] (unknown [151.29.134.109])
 by support.bugseng.com (Postfix) with ESMTPSA id 624D04EE0737
 for <xen-devel@lists.xenproject.org>; Tue, 11 Jul 2023 18:40:57 +0200 (CEST)
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
X-Inumbo-ID: b62573bc-2009-11ee-b239-6b7b168915f2
Message-ID: <fa2bc5da-b866-05ac-409f-c26e025428c3@bugseng.com>
Date: Tue, 11 Jul 2023 18:40:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US; rv:1.7.12) Gecko/20050929
 Thunderbird/1.0.7 Fedora/1.0.7-1.1.fc4 Mnenhy/0.7.3.0
To: xen-devel@lists.xenproject.org
Content-Language: en-US
From: Roberto Bagnara <roberto.bagnara@bugseng.com>
Subject: Violations of mandatory MISRA C:2012 Rule 19.1 in X86_64 build
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


Hi there.

Mandatory Rule 19.1 (An object shall not be assigned or copied to an
overlapping object) is directly targeted at two undefined behaviors,
one of which is the subject of 6.5.16.1p3, namely:

   If the value being stored in an object is read from another object
   that overlaps in any way the storage of the first object, then the
   overlap shall be exact and the two objects shall have qualified or
   unqualified versions of a compatible type; otherwise, the behavior
   is undefined.

You can see a number of definite violations in the X86_64 build
at this link:

   https://saas.eclairit.com:3787/fs/var/local/eclair/XEN.ecdf/ECLAIR_normal/origin/staging/X86_64-Set1/149/PROJECT.ecd;/by_service/MC3R1.R19.1.html

As the rule is mandatory, it cannot be deviated.
Kind regards,

    Roberto

