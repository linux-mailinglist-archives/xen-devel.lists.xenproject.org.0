Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C10EF20F521
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jun 2020 14:52:41 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jqFk9-0002Aj-Ce; Tue, 30 Jun 2020 12:52:09 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AMeW=AL=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1jqFk7-0002Aa-M0
 for xen-devel@lists.xenproject.org; Tue, 30 Jun 2020 12:52:07 +0000
X-Inumbo-ID: 80d19c3a-bad0-11ea-bb8b-bc764e2007e4
Received: from mail-ed1-x543.google.com (unknown [2a00:1450:4864:20::543])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 80d19c3a-bad0-11ea-bb8b-bc764e2007e4;
 Tue, 30 Jun 2020 12:52:07 +0000 (UTC)
Received: by mail-ed1-x543.google.com with SMTP id d15so16046682edm.10
 for <xen-devel@lists.xenproject.org>; Tue, 30 Jun 2020 05:52:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:thread-index
 :content-language;
 bh=3gN6LhDZ3WO6b+v/EAtB65ovPUJ5OfHHriG5/WGDqaI=;
 b=pvVxXlQZy7X4EJVdzbjqo3BIRxt6u29gGnuOO/VTKYY2G83axV0OzfN9FXfO5Uc+eE
 zLGPBPO8Ml8WC1y7aejwbzilb50BmrLAQd8Q+BqF9sVrohi8OAvnCRMoIE8Rf8goLS08
 0N2Zk38utjgxxzn5EoghB7eJPHuyt6cmIxKQPYb/4kBgxGIeOyFxAdAuqCasmi2EV2Vj
 h4PoSnYNNKgF28TJSzVC9OwP4EMdHtDLwUv2V6sPuEMGhncglH6poFdzylpdH6dzOiJC
 z5Vp5cikBbUWCalfzLhTYrR2FI2DSAP2cLq2s3bd6Sq1Bgrb5uwV+xPmnF+7Muf/cIgo
 pTSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :thread-index:content-language;
 bh=3gN6LhDZ3WO6b+v/EAtB65ovPUJ5OfHHriG5/WGDqaI=;
 b=JJodXoJ/MenPBaJgyMiAcFQt4AwaOT2lFpfBCIsNlCzfOq/BH0wFlJQ+PJ0phIBZlT
 TvwNT2bwBVlohxpngWsvPnR83tCvYmdm2H30Cqiy5BhGqO2pofGj5wVijXytr/sHl12c
 49+Hhcq0KTbD0pJzI5jBF1tst/5ryXr93TFR39gX3ZLTdqR+4DxspysZBd2TU8cnZBFN
 1gZXMlTtthWW6DnkAOVJGJ1OyK2aLMphfh+1/WXDbjYjtqGWpcNt2VUQw8pnNcxsB6d1
 Kacu56AfL3GWewhJXiRkzCjrK0xHRoL0Wpbgb81MQEi7Mpd/xJ4TjFDWtZtuPhinfb/e
 3l+A==
X-Gm-Message-State: AOAM531bPMPuYOglpG9kZIBa/ur5mWvH8f7c9w9ISPMKbAJ7dm/9L08w
 slNoeVDOviqje89PiypPZY8=
X-Google-Smtp-Source: ABdhPJwDX5d7ICGG+Ej8J7zNh0awLsjM3HqQWK3MzQtsZ6k8NXYYtE3xXXRRAMosSEm3Z6yf1O8oZA==
X-Received: by 2002:a50:8143:: with SMTP id 61mr23160507edc.202.1593521526254; 
 Tue, 30 Jun 2020 05:52:06 -0700 (PDT)
Received: from CBGR90WXYV0 (54-240-197-238.amazon.com. [54.240.197.238])
 by smtp.gmail.com with ESMTPSA id h2sm2753569edk.54.2020.06.30.05.52.04
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 30 Jun 2020 05:52:05 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: "'Julien Grall'" <julien@xen.org>,
 "'Roger Pau Monne'" <roger.pau@citrix.com>,
 <xen-devel@lists.xenproject.org>
References: <20200626155723.91558-1-roger.pau@citrix.com>
 <c7557e6f-2dd3-e9b4-07d9-51f16fe8baee@xen.org>
In-Reply-To: <c7557e6f-2dd3-e9b4-07d9-51f16fe8baee@xen.org>
Subject: RE: [PATCH for-4.14 v4] x86/tlb: fix assisted flush usage
Date: Tue, 30 Jun 2020 13:52:04 +0100
Message-ID: <000301d64edd$41fa4cf0$c5eee6d0$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQEPrqt6NsU03o2hOfg+V497vZFhIwIMPTDRqm37HcA=
Content-Language: en-gb
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Reply-To: paul@xen.org
Cc: 'Stefano Stabellini' <sstabellini@kernel.org>, 'Wei Liu' <wl@xen.org>,
 'Andrew Cooper' <andrew.cooper3@citrix.com>,
 'Ian Jackson' <ian.jackson@eu.citrix.com>,
 'George Dunlap' <george.dunlap@citrix.com>, 'Jan Beulich' <jbeulich@suse.com>,
 'Volodymyr Babchuk' <Volodymyr_Babchuk@epam.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> -----Original Message-----
> From: Julien Grall <julien@xen.org>
> Sent: 30 June 2020 13:48
> To: Roger Pau Monne <roger.pau@citrix.com>; =
xen-devel@lists.xenproject.org
> Cc: paul@xen.org; Stefano Stabellini <sstabellini@kernel.org>; =
Volodymyr Babchuk
> <Volodymyr_Babchuk@epam.com>; Andrew Cooper =
<andrew.cooper3@citrix.com>; George Dunlap
> <george.dunlap@citrix.com>; Ian Jackson <ian.jackson@eu.citrix.com>; =
Jan Beulich <jbeulich@suse.com>;
> Wei Liu <wl@xen.org>
> Subject: Re: [PATCH for-4.14 v4] x86/tlb: fix assisted flush usage
>=20
> Hi Roger,
>=20
> On 26/06/2020 16:57, Roger Pau Monne wrote:
> > Commit e9aca9470ed86 introduced a regression when avoiding sending
> > IPIs for certain flush operations. Xen page fault handler
> > (spurious_page_fault) relies on blocking interrupts in order to
> > prevent handling TLB flush IPIs and thus preventing other CPUs from
> > removing page tables pages. Switching to assisted flushing avoided =
such
> > IPIs, and thus can result in pages belonging to the page tables =
being
> > removed (and possibly re-used) while __page_fault_type is being
> > executed.
> >
> > Force some of the TLB flushes to use IPIs, thus avoiding the =
assisted
> > TLB flush. Those selected flushes are the page type change (when
> > switching from a page table type to a different one, ie: a page that
> > has been removed as a page table) and page allocation. This sadly =
has
> > a negative performance impact on the pvshim, as less assisted =
flushes
> > can be used. Note the flush in grant-table code is also switched to
> > use an IPI even when not strictly needed. This is done so that a
> > common arch_flush_tlb_mask can be introduced and always used in =
common
> > code.
> >
> > Introduce a new flag (FLUSH_FORCE_IPI) and helper to force a TLB =
flush
> > using an IPI (flush_tlb_mask_sync, x86 only). Note that the flag is
> > only meaningfully defined when the hypervisor supports PV or shadow
> > paging mode, as otherwise hardware assisted paging domains are in
> > charge of their page tables and won't share page tables with Xen, =
thus
> > not influencing the result of page walks performed by the spurious
> > fault handler.
> >
> > Just passing this new flag when calling flush_area_mask prevents the
> > usage of the assisted flush without any other side effects.
> >
> > Note the flag is not defined on Arm.
> >
> > Fixes: e9aca9470ed86 ('x86/tlb: use Xen L0 assisted TLB flush when =
available')
> > Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
> > Signed-off-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
>=20
> Acked-by: Julien Grall <jgrall@amazon.com>
>=20

And...

Release-acked-by: Paul Durrant <paul@xen.org>


