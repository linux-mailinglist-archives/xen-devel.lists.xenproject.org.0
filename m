Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D1BF42AEFBD
	for <lists+xen-devel@lfdr.de>; Wed, 11 Nov 2020 12:37:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.24658.52010 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kcoRW-0007N8-AT; Wed, 11 Nov 2020 11:37:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 24658.52010; Wed, 11 Nov 2020 11:37:38 +0000
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
	id 1kcoRW-0007Mi-6S; Wed, 11 Nov 2020 11:37:38 +0000
Received: by outflank-mailman (input) for mailman id 24658;
 Wed, 11 Nov 2020 11:37:36 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nKbA=ER=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1kcoRU-0007Md-Of
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2020 11:37:36 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 364fe789-e6ea-4c93-bd99-5a249932279b;
 Wed, 11 Nov 2020 11:37:35 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=nKbA=ER=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
	id 1kcoRU-0007Md-Of
	for xen-devel@lists.xenproject.org; Wed, 11 Nov 2020 11:37:36 +0000
X-Inumbo-ID: 364fe789-e6ea-4c93-bd99-5a249932279b
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 364fe789-e6ea-4c93-bd99-5a249932279b;
	Wed, 11 Nov 2020 11:37:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1605094656;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=r4CEbq3N7zmXBLL5E7Y/EU2TQNHFkbVKI4fNR4dUkPw=;
  b=TfRgk7349urMCuzHE0u82LPmjdR/jvDKJfYQt713IoGfp/iNsnvnjpnl
   Bsbysl/s+Abd3FAXTyXlc2BP3Yir4zXhEIKSs4Q3Q3wuhWW8tRHB06xgI
   +FMi1BHOrP+pMXPsq/+e6Gv4IEyhz8t4o/LPmy139m0oXZ3K8gTYuxF6f
   M=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: T/gZ5yTe7OUWbCeyld5+RaT1yWeTwowFhXbl2SiM5drIaW+ANDMxt+xXJlECdO3EfBlIUGvjON
 iitNxc6pUVBB26SmUN/+JCKcOeue/yY9+G3CqR4fWdaSZL4ZUs3eXEfq+iKzpfGka51fMAInwt
 6iU6Bs/xZAbvp6ya/IgAtOgMgPG0xvj966dvdcFtxhkKOJfBx76km2uMmDRCQLOZQsOr87vWoj
 I3cWWb/3aKp1Gn99Dr2AzAGWbxLDvk2r1YYAFW3jRbi8Z936A2qFJUFOIwJw1bH0xZJr3zmF37
 Bmk=
X-SBRS: None
X-MesageID: 31278426
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,469,1596513600"; 
   d="scan'208";a="31278426"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VSmrSAlk0uB+c8FlQnXi0Wvp9iOPAg2oWfeQGqgQZLxq2a3OWrC4AJ6edUiKVBUcjepqsChOfUTbHVPjSm/2EZmoz/yp2ftkWjQqwjAkEq4mzrwfaUqcpMG3VNRZTFub34HCzqERS5jEdtfRE68c8Kv/sGR47GYGE1cCsaxemweAfEoQOW0LBfLVPubr81BAj0bVvrnCiCe6OT1vkt/4HdLBAxsA6um5X9wNMH30zDuX/iHYcfL/nB3lG8EPdcXZvpiBll6Sfey0jTICmYSvJ2iXx04I1gPp87Rf8UIdgcwnHYINeaBc8mSmT4auUBYP82a4kzzIS8rgiimcspwoZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5kZWfWIhx2RjfP2NAAjZM9KwgA88SUFpP0h7VcqMtMY=;
 b=C1c1ujbnyjwKrOZghFivP/wvRuS0gMS56FERva75rZser86xUFmthTCXEMf8a57By8YhHgi8CGH/lSSgvSuvX+V2FwTtK4S5d08lN4Yt5JfH6olh88EYGnzEsRV2uX+W60ok64pv7I4Wv4pcD9LPcAb+vxrIOaB/IDmchTU8m1d/FG7I9zdzzv3byj/XGM4OhUubhAGHUKoFy7VJXkyfltfk4CZvWJx3PrMnz8hi/ZL/shHALwNEm0oCOwvVx4ECZJ20zbEJKtca5jbxHbTzSSnm5WloAyaWG2QKHUO6AYQQOGjXzKND/dM+QLZX+o+5IzbwuxBS1PThGnkMm6MNoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5kZWfWIhx2RjfP2NAAjZM9KwgA88SUFpP0h7VcqMtMY=;
 b=oUSgXbM/rvKbaajhr0Mev1zdBD7KWMjy8BTiPCN1eUdAlac/fN20nmEtcKmYXwjVxjg4aCn/R04Pf4m6CV4VFLDpUIQhnGFK/4K94wdEhfzOfgSlpwk8e+6luAVUxvdESNqPtK5iuV3nuRO50d5on7NuPk9YUvy5ovypynwZGnw=
Date: Wed, 11 Nov 2020 12:37:26 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: George Dunlap <George.Dunlap@citrix.com>
CC: Andrew Cooper <Andrew.Cooper3@citrix.com>, "open list:X86"
	<xen-devel@lists.xenproject.org>, Ian Jackson <iwj@xenproject.org>, "Jan
 Beulich" <jbeulich@suse.com>, Julien Grall <julien@xen.org>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH] docs: fix documentation about default scheduler
Message-ID: <20201111113726.iqpzf64sgxpnl3gc@Air-de-Roger>
References: <20201110185129.5951-1-roger.pau@citrix.com>
 <9A8ADF64-4D76-4BEE-8E1C-4E23E77B9112@citrix.com>
 <e24211db-7ab5-d950-df56-669b90fda041@citrix.com>
 <19A67843-4667-46EB-8F11-109D8989BB71@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <19A67843-4667-46EB-8F11-109D8989BB71@citrix.com>
X-ClientProxiedBy: LO2P265CA0416.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a0::20) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e22014d1-d454-4d2d-b247-08d886362c9a
X-MS-TrafficTypeDiagnostic: DM6PR03MB3835:
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB38350B0D84EA3D5CCFD30A748FE80@DM6PR03MB3835.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tzKpmXaSWobJDMMEAJAQNQoyfh0NZrIBM75+ZrfTHlTN4OqGGjX5Ubl4S0QKVq/UBJn0hL8AGk/0KARDjsHrQ03AsOfgDxYkXm/6agqxk294RuEmTxsCvHcfaoPPe8TARjtPDAWC7GoWsKkCILZM19x6b5iVDwOCYIqvnHjG3Y2CuE4slW17i6PVjJwd1qUpsqoS692bwP1grnBJKLArk7ZWVIt6CtW96H+ThUIoWCX4uhkI2h+8aX8BTbMLtsI0PjG29OMYslPdJfvSWRpdHy6T1pJiJME2haBneQPF93r2BwBa+XOkGZMvXiOCxsQo
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(366004)(39860400002)(396003)(136003)(346002)(376002)(6636002)(86362001)(66556008)(5660300002)(2906002)(53546011)(83380400001)(9686003)(26005)(1076003)(956004)(85182001)(4326008)(478600001)(54906003)(33716001)(8936002)(6862004)(6496006)(66946007)(6666004)(16526019)(66574015)(66476007)(316002)(186003)(8676002)(6486002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 8EfdEtG9L4DT1a6iZMgZZv9MALImFEb/xWcA+nPanM9jBeZXtwKPoHLVL8I29WD0JBV5I3nIPGbSx30Q/hirhVAhcY60T7HcNaWMvmGbT8j4VotJki/F0luIL16ldxaQUgcnmruTLhRIxWoRR//wSU/5hfWrQjplxGSNlZ/v1lau190aWwQLP3NGjStRZRRL6w7Hzzj2t26zp9M15j6U2Kd+/sSMES/MuubQVpJsq6OBiZKSeS+PdxURwNMEjNiaJRq3OLjDEzVHH5gGH+on7zir79R7eaynfB40uLJrO0sgP0vN5MNHQ6Cmz5LGCJFoJIkw0Gb4BliYmIPVUo/ALtr159zbiqXo9XZc4XhgcnBRCkf+BRGMsatxotCyNZa7avUQ9A5vCD3syOyHApudl1PC/JIB+q/AGnqdXajeP7h3tMFtu1IVpdLhGWDCsBW5EI+IpRaIKJ/B8wcpHatbqVfJThW96QXmJWErW+lvo/dKQz2JdWugQeztZBGrdk6DbCemE0s7O43XdlE+P9xUux83IS6PFLSxcT9Hms7kuuz77INKrR2DG3/DRAZM/poIJOpqpa3FLsv1da9WJ1dcBNc00iIx+67g0FWgxxwp7PKFvtmWnha8U0dE1jW7jcUPqAniVe7MSImbZcaX7/8Pd56U0ZShfyCKe3omHAfxwKKR/OsNMmjo+QGn29pvc7TqBeayh0sit0nPr30c3+YlNXV+jlIjxb1kGI6qw9Ka6xwKUL8yMbVDyIe6gj9rV7wOckE4Nmsef1ww1SQdCxdbAfJqddoAD7OWlt+KvFChMl8pvRzHuECdpc5gTAh2zPDzu5gBryp1Y0sX+Mzx8bkoH8iid0AP66gfhAbjCKyZAw0vKUJRucbTEby/yXFSkrv8xKbnF59SEaDhggeKClmrow==
X-MS-Exchange-CrossTenant-Network-Message-Id: e22014d1-d454-4d2d-b247-08d886362c9a
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2020 11:37:31.0085
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zksifzw+cadGQfJdVqqOwZDAGL2QaZQw1YydrPWDExd4Dwh3eG1zbbdlap1GJbwhbDJa4Mgw1EvxmIXd3LrIQQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB3835
X-OriginatorOrg: citrix.com

On Wed, Nov 11, 2020 at 12:24:50PM +0100, George Dunlap wrote:
> 
> 
> > On Nov 11, 2020, at 11:10 AM, Andrew Cooper <Andrew.Cooper3@citrix.com> wrote:
> > 
> > On 11/11/2020 10:12, George Dunlap wrote:
> >> 
> >>> On Nov 10, 2020, at 6:51 PM, Roger Pau Monne <roger.pau@citrix.com> wrote:
> >>> 
> >>> Fix the command line document to account for the default scheduler not
> >>> being credit anymore likely, and the fact that it's selectable from
> >>> Kconfig and thus different builds could end up with different default
> >>> schedulers.
> >>> 
> >>> Fixes: dafd936dddbd ('Make credit2 the default scheduler')
> >>> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> >>> ---
> >>> Changes since v1:
> >>> - Point that the default scheduler is being selected by Kconfig,
> >>>  don't mention the default Kconfig selection.
> >>> ---
> >>> docs/misc/xen-command-line.pandoc | 2 +-
> >>> 1 file changed, 1 insertion(+), 1 deletion(-)
> >>> 
> >>> diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
> >>> index 4ae9391fcd..eb1db25f92 100644
> >>> --- a/docs/misc/xen-command-line.pandoc
> >>> +++ b/docs/misc/xen-command-line.pandoc
> >>> @@ -1876,7 +1876,7 @@ with read and write permissions.
> >>> ### sched
> >>>> `= credit | credit2 | arinc653 | rtds | null`
> >>> -> Default: `sched=credit`
> >>> +> Default: selectable via Kconfig.  Depends on enabled schedulers.
> >> Sorry for not weighing in earlier; but this basically makes this documentation useless.
> > 
> > No.  It is the only half useable version, by being the only version
> > which isn't misleading.
> 
> The version in this patch essentially says “This has some options, it also has a default, but we’re not going to tell you any of them, nor what your default most likely is.  Go read KConfig to find out.”  This is is completely useless to the person trying to figure out what the default is and what potential alternate values they can put here.
> 
> The vast majority of people who search for this on the internet will have that list of options, and have credit2=default.  As long as we tell them that a local configuration can override the available options and the default, people are smart enough to figure out what their system is doing.
> 
> > It would however be far better to name the CONFIG_ variable (we do
> > elsewhere in this doc) in question so people can actually figure out
> > what they've got in front of them.
> 
> Something like that would be even better, if Roger (or someone) wants to write it up.

I'm happy to send an updated version, but would like to have some
agreement before doing so. Is the text below acceptable to everyone?

### sched
> `= credit | credit2 | arinc653 | rtds | null`

> Default: `sched=credit2`

Choose the default scheduler. Note the default scheduler is selectable via
Kconfig and depends on enabled schedulers. Check
`CONFIG_SCHED_{scheduler_name}_DEFAULT` when you building Xen to adjust the
default scheduler.

Roger.

