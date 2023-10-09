Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A6D27BEA8B
	for <lists+xen-devel@lfdr.de>; Mon,  9 Oct 2023 21:27:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.614445.955518 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qpvto-0006Se-OX; Mon, 09 Oct 2023 19:26:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 614445.955518; Mon, 09 Oct 2023 19:26:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qpvto-0006Q1-LY; Mon, 09 Oct 2023 19:26:40 +0000
Received: by outflank-mailman (input) for mailman id 614445;
 Mon, 09 Oct 2023 19:26:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Xq5o=FX=tklengyel.com=tamas@srs-se1.protection.inumbo.net>)
 id 1qpvtn-0005su-59
 for xen-devel@lists.xenproject.org; Mon, 09 Oct 2023 19:26:39 +0000
Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com
 [136.143.188.12]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c2f225bb-66d9-11ee-9b0d-b553b5be7939;
 Mon, 09 Oct 2023 21:26:37 +0200 (CEST)
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com
 [209.85.128.171]) by mx.zohomail.com
 with SMTPS id 1696879593265438.689526195775;
 Mon, 9 Oct 2023 12:26:33 -0700 (PDT)
Received: by mail-yw1-f171.google.com with SMTP id
 00721157ae682-5a7a80a96dbso5690977b3.0
 for <xen-devel@lists.xenproject.org>; Mon, 09 Oct 2023 12:26:32 -0700 (PDT)
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
X-Inumbo-ID: c2f225bb-66d9-11ee-9b0d-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; t=1696879595; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=iFgqhNxjCUWDucF/IOJg6yMfhAAyQB5Ih1Aad0dNxZfrnvmdrhyviHqjCmTi9SOYfBHes0uwhsyN4zk6q81SrTKIpu1Z4nJX6lqeiHlgk+HahqEBD6RJJR7ptkNmVIv8HM/oxBsIiS+lv0jI5KKPNU4rz50mgR+J4tM27Ww/ekE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1696879595; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=5OwDAaMh+lWsIjohWuk2Qyb1hsbZccbWqHu1Djv1yPA=; 
	b=TUMRpWkLFdf6+vufOYCozeSkHn83PCI099oCf8JRyiOamZ8Vc9RapFD4IWnBW9eITEQy7g1/VqGCpAmwNnsBIRV3G8+AdLZrV0ZaBsNxHnRuMGjOylXQ1ZHtilvR1UKQaoOKh9WnsNQgZciXOpQaLJuWilse0zhID40KWXrPlsE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=tklengyel.com;
	spf=pass  smtp.mailfrom=tamas@tklengyel.com;
	dmarc=pass header.from=<tamas@tklengyel.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1696879595;
	s=zmail; d=tklengyel.com; i=tamas@tklengyel.com;
	h=MIME-Version:References:In-Reply-To:From:From:Date:Date:Message-ID:Subject:Subject:To:To:Cc:Cc:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=5OwDAaMh+lWsIjohWuk2Qyb1hsbZccbWqHu1Djv1yPA=;
	b=bgyrxsXVBRF0SUNWWCflJHZ0IOQf9xnnRjDbMZZPdTwOWckp1Fkg0fQ+YqhdqBof
	+idC2EKqMjxBc9cbAsgM5hwdEQRKvHSrNMcYOgDKtfElYYzX50rKgPM3k1CIqfzrty2
	ydU48ysAtpVeM4Ap3KnRvfOK5LSwT2QVQ1Kfzu4M=
X-Gm-Message-State: AOJu0Yz+YbU/fgS9Uc0o1sLtdvBGBgflTdCu1EAAHZx6JQk2RdwUSvU+
	y2CPWS9W2Yw9Vz5N/CcUrCsN1isPKrMrEMKrwVo=
X-Google-Smtp-Source: AGHT+IEIgT7UFEhapC+nS7ag9bJFrNfTElK0iwfwp7cYYMWHsYwwiAUS3gL9YjqhGcl9dzCMomd3Z+QCzkBp+Len1Tw=
X-Received: by 2002:a25:ea0a:0:b0:d7b:9d44:769a with SMTP id
 p10-20020a25ea0a000000b00d7b9d44769amr7114023ybd.0.1696879592190; Mon, 09 Oct
 2023 12:26:32 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1696833629.git.nicola.vetrini@bugseng.com> <f9dcb169ad472fe888d6a03234264ec73e290df9.1696833629.git.nicola.vetrini@bugseng.com>
In-Reply-To: <f9dcb169ad472fe888d6a03234264ec73e290df9.1696833629.git.nicola.vetrini@bugseng.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Mon, 9 Oct 2023 15:25:56 -0400
X-Gmail-Original-Message-ID: <CABfawhm6Cv0MxCN6tzYV1Ryz_Ek=E_UN1Z_F1_1KFy6-AZHE2Q@mail.gmail.com>
Message-ID: <CABfawhm6Cv0MxCN6tzYV1Ryz_Ek=E_UN1Z_F1_1KFy6-AZHE2Q@mail.gmail.com>
Subject: Re: [XEN PATCH][for-next v2 7/7] x86/mem_access: make function static
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org, 
	michal.orzel@amd.com, xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, 
	consulting@bugseng.com, jbeulich@suse.com, andrew.cooper3@citrix.com, 
	roger.pau@citrix.com, Alexandru Isaila <aisaila@bitdefender.com>, 
	Petre Pircalabu <ppircalabu@bitdefender.com>, George Dunlap <george.dunlap@citrix.com>, 
	Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 9, 2023 at 2:55=E2=80=AFAM Nicola Vetrini
<nicola.vetrini@bugseng.com> wrote:
>
> The function is used only within this file, and therefore can be static.
>
> No functional change.
>
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>

Acked-by: Tamas K Lengyel <tamas@tklengyel.com>

