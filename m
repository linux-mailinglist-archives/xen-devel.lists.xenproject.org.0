Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E4252B05F7
	for <lists+xen-devel@lfdr.de>; Thu, 12 Nov 2020 14:07:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.25835.53862 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kdCJx-0004y1-Aw; Thu, 12 Nov 2020 13:07:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 25835.53862; Thu, 12 Nov 2020 13:07:25 +0000
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
	id 1kdCJx-0004xc-7g; Thu, 12 Nov 2020 13:07:25 +0000
Received: by outflank-mailman (input) for mailman id 25835;
 Thu, 12 Nov 2020 13:07:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=muz0=ES=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1kdCJv-0004xX-Lf
 for xen-devel@lists.xenproject.org; Thu, 12 Nov 2020 13:07:23 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 072e60ef-78ad-47bb-8ebd-fb63d5d443c4;
 Thu, 12 Nov 2020 13:07:22 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=muz0=ES=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
	id 1kdCJv-0004xX-Lf
	for xen-devel@lists.xenproject.org; Thu, 12 Nov 2020 13:07:23 +0000
X-Inumbo-ID: 072e60ef-78ad-47bb-8ebd-fb63d5d443c4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 072e60ef-78ad-47bb-8ebd-fb63d5d443c4;
	Thu, 12 Nov 2020 13:07:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1605186441;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=7Gv/6FDaDrPRhhJAoYiZ+Db9VnDK/9SfH6tR5sfFb8c=;
  b=edjlq4yrgw0nlYn9weeDbUiGzIczBTDYiRnPjwd7VmPBsxeGLldH7lsw
   di0X+CqXhQDR/rkFCItqF4LLaSe4fZ9t7tOnpPQaZGQJ7nBV4gFDkq6qH
   Y2qZNEQnGUnHebhjX4kjjjy2t70TAXf4vcItiOFKAvCHhx0KgfSWGjyTO
   I=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: Zah3bmuYtVEbuoqncFXydUjpN0X6F0qAXfIYcb9LHx7RMSHZW47weVpRHq61zBe3ul81ipZOmW
 v50V9CDu8mk84vd7ehaYy/3GmowXOVCocQey1kPPjjCxwEYu3ASOguasxGTJwe+Q2ROTOz1o8x
 3OwIqknsQl1AkyV5rCDYIzYWc2abLOPe9H2f7KJE+Ty9PKAFCqLjgM2WErhy3S0b5xPn1MVbX8
 X6JFY+XIxWltrU1cLQ8yx6T9xMkHfpopO+tIXGNyJ6hKd5Y8Tn7pjBMM53YjvFGZ3aCJUnXT5d
 DLY=
X-SBRS: None
X-MesageID: 32147879
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,472,1596513600"; 
   d="scan'208";a="32147879"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WPp5iWTULhmpssm2pqz3w2vZjCSKKLEICwrMKxXeOjOy6xBe0Erj4JSKZCWNxn3pzseX9/qeJ9i2vTstXPBW7xBV3ixxGRugt5J7WbRVc9MKbAE7Be5x2f7tTKoPagX+CiI978ufNsMK5E/7JqBxdjVXYZvwWNCViEBvUD+EwMVaK5A/FDDDiG9I8l+ZdzSzNZFytl6YpdMU4+Lm3pRMSfE74F5EXPow0toFNtiMY+1akAhqDp2Cpy1o3oBLqpyTPRLGejNOqCb9pB+y2mFuPbni8+/lLRVOzJ0lQdqrEAX8TEqXVvkNR0XUwLXbtCNCGda8CuPhI9j1bhjUrmHw8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k7KauaaH7z6ZEv3zdHOFzAM00pLUAq41via9BBBSiBY=;
 b=kpMEGplTLqyczvEOZj6hzDpWbMVwrvj3MOQwq0AcA4AKqr/mCx/h2bEENEk0whBehiNbpMnJeBygwl7mlVke/IWjTTuibBaXDzqGKC7eV2oFyb7aeUVcylmXegL974iOakITRRzcbboLIlBrcSBMBv1nob/7ZCj1mNbbCfctELhFL1q7NUb33+LCn+5qQo+Fsb9gy3Dic/y3u6aCvU+YE6uhGxczRLmxxVkelNue2h9SJOVMpXP9u+RnKqKl6vL4nhFJFLkcWRst10uJFJ3zjhK2W3PX9hAvQz8fKR6HjoZLMqaKfrTggUN4ezpwtagrUjF4C2oUV3IQSRoKzFY1lw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k7KauaaH7z6ZEv3zdHOFzAM00pLUAq41via9BBBSiBY=;
 b=Snvs1cQrrtQ1yyldqoPmXJst99FDr8l9/9nH1g/+r9PMbk5wQnOUAqy1V9eIaiMdmlA82MYf4XxTfEfFNCfj6wGD+ekaM+kGknVPHm4UhVmr2b03wXotv/qsecSvmeZPesu4vIj8t4PQpWHyCu0OYMiyunNGI/PBHgCDpo9T1BI=
Date: Thu, 12 Nov 2020 14:07:09 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, George Dunlap
	<George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>
Subject: Re: [PATCH 5/5] x86/p2m: split write_p2m_entry() hook
Message-ID: <20201112130709.r3acpkrkyck6arul@Air-de-Roger>
References: <29d30de1-2a8d-aee2-d3c3-331758766fc9@suse.com>
 <7b2b7cc9-8828-41bd-7949-764161bbe7ff@suse.com>
 <20201110135944.hbsojy6eeyw53has@Air-de-Roger>
 <d73234b0-f22e-0783-3fbe-759ccb0ecc48@suse.com>
 <20201111121730.pblsf6inot5gixfc@Air-de-Roger>
 <7f916527-9a9c-8afe-5e5c-781554d1bd73@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7f916527-9a9c-8afe-5e5c-781554d1bd73@suse.com>
X-ClientProxiedBy: LO4P123CA0027.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:151::14) To SA0PR03MB5610.namprd03.prod.outlook.com
 (2603:10b6:806:b2::9)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8f9b5eac-1ee2-431a-1eff-08d8870be16b
X-MS-TrafficTypeDiagnostic: SA0PR03MB5657:
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SA0PR03MB565728422DE1F2A5E22DD0B78FE70@SA0PR03MB5657.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fc6jrdO1TV3u/yiJwnzXHSxF2fmugeI2WjHZPTI+qwYb0NFPEireVRppOnfMnP/3EV7F8D+0rFPNnX8qdYKrR0z9jVFgOX+3RML+VgfAU6yApXBElMHYZ+ZBtZXAbKEPui9MAg4lgu7GnVcCVFFbNfrQMtXv2ay7vFR1MNQxsj/i/UTVIxk04C38tAYlHfTMx/xw/ubFy+UkjsuDNXTi4Uky0d+56zNoo4L5BdxlqmsSRR9z8puGfdbmMqPo5zDs+/c9PDA8tPG9vtZci/9KXk6M5hZnEYQ4GUgnIOj3aubW8si8frCpqm6Kz1IZLfsXok5VABf40hOCV+4QTca3yqFvKf47LL1TV2zGL//yfB2Yk7YDhZh4NyfqU8J1G+bA
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA0PR03MB5610.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(366004)(376002)(346002)(396003)(136003)(39860400002)(66946007)(54906003)(66556008)(66476007)(4326008)(478600001)(1076003)(2906002)(83380400001)(85182001)(5660300002)(33716001)(8676002)(9686003)(8936002)(86362001)(6916009)(6486002)(186003)(53546011)(26005)(6496006)(6666004)(956004)(16526019)(316002)(70780200001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: l5bQvJ2k2JPhyuKREPVc5vQKqc5OFoRSrhsfpg5DG37XKARInfw+I51xZ6NIoRUgqLVsM62o5xE5v+snBlpIvDbqrP36j6z7ZdP5lyY/K8/U15HrMsChLjQmog1CgEskVnB6VrrjDoA1yanmllwqGkP2OFtKmcdP5bmMdZrLVrUNOukeOlPOzG17dniFHp0f5UmawTAdPd94+BYI7gTl8F2JH/wlUNTyGJDv6lqTfWlrl6N6d1vwBhDqYdDt2rjmR4YqQZCdGpzHt11McR4Yq4uwCgkVsm0lJuXdcI8pJ83cMEW1H8PqsHhgayALC9YfXmrt9iV7UvWJQzlS8HvsCtMwvs++sf4WO04e44iXET3JKoTPE7pa2qw6Shov1pBwFtrkaHgYrCJ61QLzrOdBLd7d+4RKZZ1QvQLKrKBGWHJ3S7ms1MD4dYt9WMxRYHa5jquwTNjXbWfLK7j+BR/C0308axNWeYB4TyTQuKvzMSEHQ/f7+nRbJ1s8B+pYV6u3KG05OpAdsch57FwpZZRWxFnpLK5DhiVl8+mRZ3CSv3lBi5Cq4vZZlj3U4FJWMcrbltpPAUSq7bW/7XwhaJCL/mJjrXb8FVKXGr73PFwvYxwPuTpb4+KiFE0d8r1EAA+qKeZqQT/rxOFOrqg1aktL5w==
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f9b5eac-1ee2-431a-1eff-08d8870be16b
X-MS-Exchange-CrossTenant-AuthSource: SA0PR03MB5610.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2020 13:07:17.1698
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OVmI+qdT1HjkmM1yRa+oEUdiTiWfJ9jzK+k2M7f28k1j61aAcBxOlLULm1qipos47V/1f77PIqzLpQqaROELFQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR03MB5657
X-OriginatorOrg: citrix.com

On Thu, Nov 12, 2020 at 01:29:33PM +0100, Jan Beulich wrote:
> On 11.11.2020 13:17, Roger Pau Monné wrote:
> > On Tue, Nov 10, 2020 at 03:50:44PM +0100, Jan Beulich wrote:
> >> On 10.11.2020 14:59, Roger Pau Monné wrote:
> >>> On Wed, Oct 28, 2020 at 10:24:53AM +0100, Jan Beulich wrote:
> >>>> --- a/xen/arch/x86/mm/p2m-pt.c
> >>>> +++ b/xen/arch/x86/mm/p2m-pt.c
> >>>> @@ -122,17 +122,55 @@ static int write_p2m_entry(struct p2m_do
> >>>>  {
> >>>>      struct domain *d = p2m->domain;
> >>>>      struct vcpu *v = current;
> >>>> -    int rc = 0;
> >>>>  
> >>>>      if ( v->domain != d )
> >>>>          v = d->vcpu ? d->vcpu[0] : NULL;
> >>>>      if ( likely(v && paging_mode_enabled(d) && paging_get_hostmode(v)) ||
> >>>>           p2m_is_nestedp2m(p2m) )
> >>>> -        rc = p2m->write_p2m_entry(p2m, gfn, p, new, level);
> >>>> +    {
> >>>> +        unsigned int oflags;
> >>>> +        mfn_t omfn;
> >>>> +        int rc;
> >>>> +
> >>>> +        paging_lock(d);
> >>>> +
> >>>> +        if ( p2m->write_p2m_entry_pre )
> >>>> +            p2m->write_p2m_entry_pre(d, gfn, p, new, level);
> >>>> +
> >>>> +        oflags = l1e_get_flags(*p);
> >>>> +        omfn = l1e_get_mfn(*p);
> >>>> +
> >>>> +        rc = p2m_entry_modify(p2m, p2m_flags_to_type(l1e_get_flags(new)),
> >>>> +                              p2m_flags_to_type(oflags), l1e_get_mfn(new),
> >>>> +                              omfn, level);
> >>>> +        if ( rc )
> >>>> +        {
> >>>> +            paging_unlock(d);
> >>>> +            return rc;
> >>>> +        }
> >>>> +
> >>>> +        safe_write_pte(p, new);
> >>>> +
> >>>> +        if ( p2m->write_p2m_entry_post )
> >>>> +            p2m->write_p2m_entry_post(p2m, oflags);
> >>>> +
> >>>> +        paging_unlock(d);
> >>>> +
> >>>> +        if ( nestedhvm_enabled(d) && !p2m_is_nestedp2m(p2m) &&
> >>>> +             (oflags & _PAGE_PRESENT) &&
> >>>> +             !p2m_get_hostp2m(d)->defer_nested_flush &&
> >>>> +             /*
> >>>> +              * We are replacing a valid entry so we need to flush nested p2ms,
> >>>> +              * unless the only change is an increase in access rights.
> >>>> +              */
> >>>> +             (!mfn_eq(omfn, l1e_get_mfn(new)) ||
> >>>> +              !perms_strictly_increased(oflags, l1e_get_flags(new))) )
> >>>> +            p2m_flush_nestedp2m(d);
> >>>
> >>> It feel slightly weird to have a nested p2m hook post, and yet have
> >>> nested specific code here.
> >>>
> >>> Have you considered if the post hook could be moved outside of the
> >>> locked region, so that we could put this chunk there in the nested p2m
> >>> case?
> >>
> >> Yes, I did, but I don't think the post hook can be moved out. The
> >> only alternative therefore would be a 3rd hook. And this hook would
> >> then need to be installed on the host p2m for nested guests, as
> >> opposed to nestedp2m_write_p2m_entry_post, which gets installed in
> >> the nested p2m-s. As said in the description, the main reason I
> >> decided against a 3rd hook is that I suppose the code here isn't
> >> HAP-specific (while prior to this patch it was).
> > 
> > I'm not convinced the guest TLB flush needs to be performed while
> > holding the paging lock. The point of such flush is to invalidate any
> > intermediate guest visible translations that might now be invalid as a
> > result of the p2m change, but the paging lock doesn't affect the guest
> > in any way.
> > 
> > It's true that the dirty_cpumask might change, but I think we only
> > care that when returning from the function there are no stale cache
> > entries that contain the now invalid translation, and this can be
> > achieved equally by doing the flush outside of the locked region.
> 
> I agree with all this. If only it was merely about TLB flushes. In
> the shadow case, shadow_blow_all_tables() gets invoked, and that
> one - looking at the other call sites - wants the paging lock held.

You got me confused here, I think you meant shadow_blow_tables?

The post hook for shadow could pick the lock again, as I don't think
the removal of the tables needs to be strictly done inside of the same
locked region?

Something to consider from a performance PoV.

> Additionally moving the stuff out of the locked region wouldn't
> allow us to achieve the goal of moving the nested flush into the
> hook, unless we introduced further hook handlers to be installed
> on the host p2m-s of nested guests.

Right, or else we would also need to add that chunk in the
non-nestedp2m hook also?

Maybe you could join both the nested and non-nested hooks and use a
different dirty bitmap for the flush?

Thanks, Roger.

