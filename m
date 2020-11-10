Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ED2AF2AD851
	for <lists+xen-devel@lfdr.de>; Tue, 10 Nov 2020 15:10:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.23445.50218 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kcULh-0007tP-AX; Tue, 10 Nov 2020 14:10:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 23445.50218; Tue, 10 Nov 2020 14:10:17 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kcULh-0007t0-5l; Tue, 10 Nov 2020 14:10:17 +0000
Received: by outflank-mailman (input) for mailman id 23445;
 Tue, 10 Nov 2020 14:10:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hJ2u=EQ=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1kcULg-0007sv-6C
 for xen-devel@lists.xenproject.org; Tue, 10 Nov 2020 14:10:16 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 51d9cb08-52d9-45d3-a0a9-039ade9a789c;
 Tue, 10 Nov 2020 14:10:08 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=hJ2u=EQ=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
	id 1kcULg-0007sv-6C
	for xen-devel@lists.xenproject.org; Tue, 10 Nov 2020 14:10:16 +0000
X-Inumbo-ID: 51d9cb08-52d9-45d3-a0a9-039ade9a789c
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 51d9cb08-52d9-45d3-a0a9-039ade9a789c;
	Tue, 10 Nov 2020 14:10:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1605017408;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=W9kR6cuGuPuO59b0WBsQShBKvzrrQm5UGbFW1DW/7uc=;
  b=Oznqxa08v/m58jYuZcBEz7QbImCWpne47d3/4XwccjznBZpdE7i04Yw2
   e6V1cEBbtHNRCC0Zkj3+GM2ZgKoc1QNrSDjPVbuTWmT3Uc0j5ya1gozR/
   r6SPd7M6BzMRFixiKLzhVXY/DOgotKNC9bUbSK4FaLu+/Cf69FkEeoAQX
   I=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: G7VR7kDP5V3iIPLn0XsrBiu3nbzshPs6kHk5H3eeTo6pZ5YQ3rdaROV24AnaEo6HqppRULRd1c
 NnS7USd+dypmyWQxqaEUXBOcB8UV3QgjswUmCFBq96PtoAst5p8c5uSkceuQIfgMEonIqvWqHe
 PezWCCX05E93u1oUOksIE8GDBNx+GWp+TySVXR92XO76cIjf7doBwULX31hmwMp1VZ9zR8xH0P
 uZHfpsGnlBNX3pt32CVslSxT0pozyzB5aFD7etHmAyHTmiHpA4QUIowNDWle7i6lNqdEMVL1/L
 vTQ=
X-SBRS: None
X-MesageID: 31191703
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,466,1596513600"; 
   d="scan'208";a="31191703"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BciKau0nzy4nz0z6qMVZLBIwWYc+iqAQ/LsWVONVzM5/CrvCnYBFGzAVgyWli5+7+Uva2HuXort5mtL3u9k7d/oSJ9Kn/QExMwDO0KXE32cJS+T/+zAs2qtyJYFxlj8Q+nv3RbC3EWwe9il8yHz+8hU13d9yJ3Hr8rWiWRLN/gQEIrKOZkUs9CjPkYUg7dbMB6xt/xIJdmHt6b6kvkHPkakfalv0+PmQ8dtxPQKKPTo6IT5oyxlgabradJoacOCXKTZw2nwdGVa8URYNMCvT6XJATl50aBQGQRXgbdXvdoHr5F8crdNmyb1x0OiPNgpEqDMe6XD2U/yQLExYjmNkZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8IOmeltT7hFatd+i1U39dua0XWlKFgIOmapkPc/V650=;
 b=Z/WP+oZthT3YgxyXjvwAwrsDo6R3KmynGzJfh1v335q1y4pSMtyA9q71DzlZRqfEfuPcLkdei1cwjvn9JIbf8dRJAtm1bOrG99ft1ZcKMIUkbGXi9oLfqiHIwiZ212tWr1KK87PLbmP5McWReQJZ2x8t+3zt4RiGy0ID22XQIseRFQ6rz2yxjYqh1ZcIUd9sn9ucsKrlL3VROsDu4sSzU/128gL5pGv12jupJJsJZDWjH9lD99fv2N+7hQCJJ16ir02gJo/SCIygJ5Rp3ko6kGXJ0Kk1MRZTzsf53dC5F3HgXcyLVufLtU0/iZok6BaXUT6OBLDwDEQAWY0d5W1qrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8IOmeltT7hFatd+i1U39dua0XWlKFgIOmapkPc/V650=;
 b=Qgg/FN5lpuJt8vSM/MHXGAyFQDWA0BCTHiRiheS7qotx63UQlFlrJ2b0KITp6iTlNK0ILA3XULtJZU3lQFp39HjtTIR1YX23hmsJep4EpmgBvq+2zyndpPi4x3SpV7h2qh+V9rLsDkPI7lNTen1DljzRcnzUGjiWJIhiqoqGXf4=
Date: Tue, 10 Nov 2020 15:08:56 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v3 5/7] x86: guard against straight-line speculation past
 RET
Message-ID: <20201110140856.dtdql7lkwzwijko2@Air-de-Roger>
References: <7065e2dc-f846-be79-1081-682c2295358c@suse.com>
 <80ceea17-958d-f409-5f39-9f353e780f5b@suse.com>
 <20201110093142.hkufamaepn67gv43@Air-de-Roger>
 <92e58ff0-e6a4-f92f-1ad6-06db7751762a@suse.com>
 <20201110111603.rarf7ncddrkswlxs@Air-de-Roger>
 <586bb9e5-bb90-bb27-3010-e702d65e301c@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <586bb9e5-bb90-bb27-3010-e702d65e301c@suse.com>
X-ClientProxiedBy: LO4P123CA0009.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:150::14) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f27cd11f-2d5a-48ec-91db-08d885822cda
X-MS-TrafficTypeDiagnostic: DM6PR03MB5340:
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB5340B4CC90F6A0DB5CEBB5938FE90@DM6PR03MB5340.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rdRNDHmQiY8j5wek53spxHQlimsy52f7pIIqaylJ9PyKIt7CREf39fBQzn8PphhCwHwh4k6BIgIVyjGUVSwAZiZ2+XHuOxXKvrBR+UmHiQvFV4osS8b45r/8ZxbgIBArM1ivaEwnplfINuBeN/8XnYU+20mbAd4jvCHHrOKOLURgd2g4tc39e4krXZOdorSC8zN1B5UdSLu4a1Q4ZYzSyrok0Xex4bj5XmP2HalBnjU7JGVJ4BQNpG2oa+i9xLqfcswDpE3SMMe5sU1dlcyLya6yNFVzC8deXzLj9IV03Z86vSkhlz58B/eXIY/Atfci/omi5/qNsAD1Beb1V5Ifkg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(136003)(376002)(396003)(346002)(39860400002)(366004)(8676002)(6496006)(54906003)(2906002)(6916009)(956004)(8936002)(16526019)(316002)(6666004)(478600001)(186003)(6486002)(26005)(66556008)(66476007)(66946007)(9686003)(1076003)(53546011)(85182001)(4326008)(33716001)(83380400001)(5660300002)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: H1kSfY8gjyZeBQ+ShnzRjq5dEKwPi/UK+L26EipoDz5qLZIW2ALoPzcyhJl1jzNU5Y7ym+bAZv/5x+UWaRHFdvlued6v8h1JN7My1VC/h0aowpmvM0eg1kZqxw3iVTYylpZha4TV8ypsTLr2oceDW9/lQF4OZfjCKTw2W3WhgS1jeqN2oOnlsUkTMn+mkAyITj8oWu0xy+XyK3iglyAz6A0biUGBJlmef6fjwOZs/yI3k2DLszurIg22YB29+sCr5HWFiP5gws4L3hXKbuOrQi6cDNW/wlrBLCt8ZGNpJx82Hqv2x7LWiA3ZdR9BXpac/64OIYQE7sdVfew9qBl3MqEbCWdVc9NSLgPLei/+KeezjsZ3CpvqYeS3gbY2hjukBlbB+IhvVX4XK72n/glNOIKPb6GkhQvYy6ORbnh39VV4mUc+GSuVvVdPFcYJFgdMj4egNwvT2Zkm/DhuRIOV3gDVYemyHy/jzJGTAHVCFa33F+oVwQxGtkBYF5itxXESzuePZWfUEAipD7ft8XepnJdBnj6CmZpkj1+Ehor/xfZfjxFmeto62T0rFdWzv0mA/gGC//9UK7FALCuYuAN10hUWkjHMFOAkTmmNVP8LxG9IUgdO6vHqE7WtkKxQaGws24YypRNWmMj1P7iyKUEhj7GHbYobA/MWC0xctABsLgoH72dkWDrFQchQb5JBWMDsoI1OYLGNrbRGuDj+oF7sb8rlx6Zj6+jt7HYgHwZndm1mSuBgLLFXhZta2GepGEBiWr2DaLfTO6MmYq9TmxmW0ZQQinCnwr7Z8IXUvtWmVUJUnosXlsWWsEYgAn9qDKRlE5vsRJ9v9DJYpdTo0JZ9A9G8VNtGHYhDkWQ8C+3S2gWqU5Ux3OGIYF7Rt/NW4E0as7+EnWKiZXn771mG7/Gh6g==
X-MS-Exchange-CrossTenant-Network-Message-Id: f27cd11f-2d5a-48ec-91db-08d885822cda
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2020 14:09:01.9800
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9WIlELdmmMpZqXAPFRYeFOXhTlnMs6x/BDWw06kE9+xQG7cXnY3lxbohToiOsvdGGvg02OJCuRoG0Wpx25cENw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5340
X-OriginatorOrg: citrix.com

On Tue, Nov 10, 2020 at 02:19:40PM +0100, Jan Beulich wrote:
> On 10.11.2020 12:16, Roger Pau Monné wrote:
> > On Tue, Nov 10, 2020 at 11:06:46AM +0100, Jan Beulich wrote:
> >> On 10.11.2020 10:31, Roger Pau Monné wrote:
> >>> On Fri, Oct 23, 2020 at 10:38:04AM +0200, Jan Beulich wrote:
> >>>> Under certain conditions CPUs can speculate into the instruction stream
> >>>> past a RET instruction. Guard against this just like 3b7dab93f240
> >>>> ("x86/spec-ctrl: Protect against CALL/JMP straight-line speculation")
> >>>> did - by inserting an "INT $3" insn. It's merely the mechanics of how to
> >>>> achieve this that differ: A set of macros gets introduced to post-
> >>>> process RET insns issued by the compiler (or living in assembly files).
> >>>>
> >>>> Unfortunately for clang this requires further features their built-in
> >>>> assembler doesn't support: We need to be able to override insn mnemonics
> >>>> produced by the compiler (which may be impossible, if internally
> >>>> assembly mnemonics never get generated), and we want to use \(text)
> >>>> escaping / quoting in the auxiliary macro.
> >>>
> >>> Could this have an option to enable/disable at build time?
> >>
> >> Well, a subsequent patch adds a config option for this, which in
> >> the worst case could be turned off. I'm afraid though I'm not
> >> clear about the question, because ...
> >>
> >>> FreeBSD will drop GNU as quite soon from base, and albeit it can be
> >>> installed as a package I would like to be able to build Xen using a
> >>> toolchain based on LLVM exclusively.
> >>
> >> ... it's not clear to me what the implications here are: Are you
> >> saying -no-integrated-as is not going to function anymore, unless
> >> people explicitly install gas? If that's not what you meant to
> >> indicate, then I don't see how building would become impossible.
> > 
> > I'm still inquiring about this, but I would say that when gas is
> > removed from FreeBSD then the 'as' command would be mapped to llvm-as,
> > and thus -no-integrated-as would hit the same issues as the integrated
> > as. So far in Xen we have assumed that -no-integrated-as would
> > fallback to an as capable of doing what the integrated clang as
> > doesn't support, but that might not be the case.
> 
> At which point Xen couldn't be built anyway, I expect. If llvm-as
> isn't sufficiently gas-compatible, we've lost (right now at least).
> 
> > Ideally we would have to re-run the tests with -no-integrated-as, in
> > order to assert that the external as is really capable of what the
> > internal one is not.
> 
> And if it doesn't, what would we do other than failing the build
> (which it would also if we didn't do the 2nd round of checks)?

I would always prefer a clear message (ie: your toolstack is not
capable of building Xen) rather than a weird build time failure.

Also we could maybe disable certain options by default if the
toolstack doesn't have the required support to build them?

Has anyone reported this shortcoming to upstream llvm, so they are
aware and can work on this or maybe provide an alternative way to
achieve the same result?

Thanks, Roger.

