Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 13D2E72FF7E
	for <lists+xen-devel@lfdr.de>; Wed, 14 Jun 2023 15:09:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.548753.856874 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9QF1-0001uq-NJ; Wed, 14 Jun 2023 13:08:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 548753.856874; Wed, 14 Jun 2023 13:08:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9QF1-0001so-Kg; Wed, 14 Jun 2023 13:08:51 +0000
Received: by outflank-mailman (input) for mailman id 548753;
 Wed, 14 Jun 2023 13:08:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0wBJ=CC=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1q9QF0-0001si-Oo
 for xen-devel@lists.xenproject.org; Wed, 14 Jun 2023 13:08:50 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 997ed0cf-0ab4-11ee-8611-37d641c3527e;
 Wed, 14 Jun 2023 15:08:48 +0200 (CEST)
Received: from [192.168.1.125] (unknown [176.206.20.8])
 by support.bugseng.com (Postfix) with ESMTPSA id A17584EE0738
 for <xen-devel@lists.xenproject.org>; Wed, 14 Jun 2023 15:08:47 +0200 (CEST)
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
X-Inumbo-ID: 997ed0cf-0ab4-11ee-8611-37d641c3527e
Message-ID: <c171c21a-b19e-7edd-06e5-17f2e95e839a@bugseng.com>
Date: Wed, 14 Jun 2023 15:08:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-US
To: xen-devel@lists.xenproject.org
From: Federico Serafini <federico.serafini@bugseng.com>
Subject: Functions _spin_lock_cb() and handle_ro_raz()
Organization: BUGSENG srl
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello everyone,

I am working on the violations of MISRA C:2012 Rule 8.10,
whose headline says:
"An inline function shall be declared with the static storage class".

For both ARM64 and X86_64 builds,
function _spin_lock_cb() defined in spinlock.c violates the rule.
Such function is declared in spinlock.h without
the inline function specifier: are there any reasons to do this?
What about solving the violation by moving the function definition in
spinlock.h and declaring it as static inline?

The same happens also for the function handle_ro_raz() in the ARM64
build, declared in traps.h and defined in traps.c.

Regards,
Federico Serafini

