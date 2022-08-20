Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 83E2359AEDA
	for <lists+xen-devel@lfdr.de>; Sat, 20 Aug 2022 17:33:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.390815.628393 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oPQT8-0000WQ-Bj; Sat, 20 Aug 2022 15:33:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 390815.628393; Sat, 20 Aug 2022 15:33:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oPQT8-0000Ud-8i; Sat, 20 Aug 2022 15:33:02 +0000
Received: by outflank-mailman (input) for mailman id 390815;
 Sat, 20 Aug 2022 15:31:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tuUL=YY=ispras.ru=subkhankulov@srs-se1.protection.inumbo.net>)
 id 1oPQRb-0000TI-2y
 for xen-devel@lists.xenproject.org; Sat, 20 Aug 2022 15:31:27 +0000
Received: from mail.ispras.ru (mail.ispras.ru [83.149.199.84])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2678856e-209d-11ed-bd2e-47488cf2e6aa;
 Sat, 20 Aug 2022 17:31:25 +0200 (CEST)
Received: from [192.168.0.105] (unknown [136.169.224.60])
 by mail.ispras.ru (Postfix) with ESMTPSA id CFF9740D403D;
 Sat, 20 Aug 2022 15:31:19 +0000 (UTC)
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
X-Inumbo-ID: 2678856e-209d-11ed-bd2e-47488cf2e6aa
Message-ID: <6228a437bb9d7f677f5e97973518bcd555bc2a07.camel@ispras.ru>
Subject: [POSSIBLE BUG] Dereferencing of NULL pointer
From: Rustam Subkhankulov <subkhankulov@ispras.ru>
To: Juergen Gross <jgross@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Oleksandr Tyshchenko
	 <oleksandr_tyshchenko@epam.com>, xen-devel@lists.xenproject.org, 
	linux-kernel@vger.kernel.org, Alexey Khoroshilov <khoroshilov@ispras.ru>, 
	ldv-project@linuxtesting.org
Date: Sat, 20 Aug 2022 20:30:56 +0300
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1-0ubuntu1 
MIME-Version: 1.0

Version: 6.0-rc1

Description:=20

In function 'privcmd_ioctl_dm_op' (drivers/xen/privcmd.c: 615)return
value of 'kcalloc' with GFP_KERNEL flag is assigned to "pages"
variable. GFP_KERNEL flag does not guarantee, that the return value
will not be NULL. In that case, there is a jump to the "out" label.=20

---------------------------------------------------------------------
667	pages =3D kcalloc(nr_pages, sizeof(*pages), GFP_KERNEL);
668	if (!pages) {
669		rc =3D -ENOMEM;
670		goto out;
671	}
---------------------------------------------------------------------

Variable 'pages' is passed to function 'unpin_user_pages_dirty_lock' as
1st parameter at [drivers/xen/privcmd.c: 695].

---------------------------------------------------------------------
694	out:
695		unlock_pages(pages, nr_pages);
---------------------------------------------------------------------

Then, variable 'pages' is passed to function
'unpin_user_pages_dirty_lock' as 1st parameter at
[drivers/xen/privcmd.c: 612].

---------------------------------------------------------------------
610	static void unlock_pages(struct page *pages[], unsigned int
nr_pages)
611	{
612		unpin_user_pages_dirty_lock(pages, nr_pages, true);
613	}
---------------------------------------------------------------------

'pages' and 'npages' are passed as parameters to function
'sanity_check_pinned_pages' at [mm/gup.c: 311].

---------------------------------------------------------------------
299	void unpin_user_pages_dirty_lock(struct page **pages, unsigned
long npages,
300					 bool make_dirty)
301	{
302		unsigned long i;
303     struct folio *folio;
304     unsigned int nr;
305	=09
306		if (!make_dirty) {
307			unpin_user_pages(pages, npages);
308			return;
309		}
310
311		sanity_check_pinned_pages(pages, npages);
---------------------------------------------------------------------

In function 'sanity_check_pinned_pages', if
(IS_ENABLED(CONFIG_DEBUG_VM)) and (npages > 0), NULL pointer 'pages' is
dereferenced at [mm/gup.c: 51].

---------------------------------------------------------------------
32	static inline void sanity_check_pinned_pages(struct page
**pages,
33						     unsigned long
npages)
34	{
35		if (!IS_ENABLED(CONFIG_DEBUG_VM))
36			return;
..
50		for (; npages; npages--, pages++) {
51			struct page *page =3D *pages;
								^^^^^^
^
---------------------------------------------------------------------

Else if (!IS_ENABLED(CONFIG_DEBUG_VM)) and (npages > 0) function
'gup_folio_next' is called with 'pages' and 'npages' as parameters at
[mm/gup.c: 311].

---------------------------------------------------------------------
312		for (i =3D 0; i < npages; i +=3D nr) {
313			folio =3D gup_folio_next(pages, npages, i, &nr);
---------------------------------------------------------------------

In function 'gup_folio_next' NULL pointer 'list' is dereferenced at
[mm/gup.c: 263].

---------------------------------------------------------------------
262	static inline struct folio *gup_folio_next(struct page **list,
263			unsigned long npages, unsigned long i,
unsigned int *ntails)
264	{
265		struct folio *folio =3D page_folio(list[i]);
							=09
		^^^^^^^^^
---------------------------------------------------------------------


