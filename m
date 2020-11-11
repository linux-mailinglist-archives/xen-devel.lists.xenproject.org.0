Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E8B62AF368
	for <lists+xen-devel@lfdr.de>; Wed, 11 Nov 2020 15:21:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.24860.52328 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kcr02-0000Jm-Ty; Wed, 11 Nov 2020 14:21:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 24860.52328; Wed, 11 Nov 2020 14:21:26 +0000
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
	id 1kcr02-0000J2-Py; Wed, 11 Nov 2020 14:21:26 +0000
Received: by outflank-mailman (input) for mailman id 24860;
 Wed, 11 Nov 2020 14:21:25 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nKbA=ER=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1kcr01-0000HG-5h
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2020 14:21:25 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1477b381-4151-4a07-995a-22faa2ba7360;
 Wed, 11 Nov 2020 14:21:19 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=nKbA=ER=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
	id 1kcr01-0000HG-5h
	for xen-devel@lists.xenproject.org; Wed, 11 Nov 2020 14:21:25 +0000
X-Inumbo-ID: 1477b381-4151-4a07-995a-22faa2ba7360
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 1477b381-4151-4a07-995a-22faa2ba7360;
	Wed, 11 Nov 2020 14:21:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1605104479;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=euGk2UDOuVDTVqJAkajzJT3pF1DGqy1mjJlYnONO37w=;
  b=Q+QzypHjGhqNcigSEbRT75/+8MCaS1K4d/RNXW2k/WzRHu2GTQ/Rr5Vo
   c1GVNUuJn5QuXXdQMfjlwMcX0UTgfZZoEe7FjvU/VMeo0eTpzvpC1AZgY
   BtwqysRT1wrmUGfVkpiDzfbiF3SPICvA0nP90ZMu6ghcfXx3rP7m/mw9j
   Y=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 7Cb9gf1f6/YcEob2H6at6B3acm3+S9ayQdtKyXGaNv/hfpD9x62dCJ35V5xPK27RmoB6rdZ15Y
 k++Xjr/6tBec/Jsis0+GSV8cLgHUZV8U/C802h1rii6q+Ff0PaoYJSmt3E3drCcnWFfjCDVjHM
 W9qMqThW54WxtUWgTolKwVdWdc4E3Oqp2gKbHTAZb/hP1p0Rl6GO35UPWbz8K4ZT8wfgG5MRIl
 WUi5DG8k61rKXFvn7XhGt0N5i9ldyiUAfWSQkXae5x1WrPXIKdzRu4p9KZrlJVjHb0A2JLKDwh
 Ics=
X-SBRS: None
X-MesageID: 31186527
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,469,1596513600"; 
   d="scan'208";a="31186527"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U9o7dnobV0AO/vy6gVegeSCYWJDFlNdiq+5ScPFcIzr5rc8JVjFMXji1kusA0pn5/uifFktS9ay+1qZCWpSE6lm7l+njtk3aHSjmStTSLQu4ECY7yYUevWtCiCkba2qo8qRqAXmiFzxMpSM6MSvdlRShPY0lhI6ArnioD1Val6k2hZkx/xz4KU/baHd/mo8nLe1f4D6N74ZminRvDWdythSPMwM+YPnCFTmYfAUN6gSBx3tq+jdwqQP6SrB185HD4cUG2wxCgqC+49G295pqMfp1Z53t0khgMdMQM/y8jlsJk4msZmtDfimRMHYajAs+1HSCsmXMNEEukBqdjFtI4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uLgc+bWB+b/0Dvw3ibOvwF8NjO3fjE2arC95H/R78UM=;
 b=njGSyA85bseLVmWIfcotqRELnVDVdlXKsAVU3e0OKjfVG36U1ZLedRbnCajh9OmDflHAE2cw73nRGs+nbJ8Xqn4zRAYzG+U+wJKbUYv0NhSgI5ks0LlcskPkVogYAlm49mcMzi3gno12hrz4baRFOJShknAytr3fZ8n+tdmccxJzcGvffpYAxXyriXmfFSockbhQ6J17ZpaMFWuKyLynJ/FI+hRAFUA9Iolh6Oadfp5i8ZfOjCuoEe4ZGxSp2ShgC8r77a2YrVrvBZtmPJCaHbQFNwj8Wy3+VXCB1WV4LHJzChlEb6EvjX6isyvPZOyR5yH2fFJRO/LmSx/YN0/qIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uLgc+bWB+b/0Dvw3ibOvwF8NjO3fjE2arC95H/R78UM=;
 b=bJ+WtfAgPnIpjn9+3OrIOTCNT6f7Hx7sxeTlq7GL8/ifv7zbhRITbEEFOWi77Wp29Qn+tJRRloIXjte7v4ukV50cwiUEMH4HRoxjOLSLyXpInaM/XhWeeYTkeyKzSZjiQn7UlaV00AtUa9M7Ojs3Dv54yjvMnsjvppBJc74O2h4=
Date: Wed, 11 Nov 2020 15:21:09 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
CC: "Rahul.Singh@arm.com" <Rahul.Singh@arm.com>, "Bertrand.Marquis@arm.com"
	<Bertrand.Marquis@arm.com>, "julien.grall@arm.com" <julien.grall@arm.com>,
	"jbeulich@suse.com" <jbeulich@suse.com>, "sstabellini@kernel.org"
	<sstabellini@kernel.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, "iwj@xenproject.org" <iwj@xenproject.org>,
	"wl@xen.org" <wl@xen.org>, Oleksandr Andrushchenko <andr2000@gmail.com>
Subject: Re: [SUSPECTED SPAM][PATCH 01/10] pci/pvh: Allow PCI toolstack code
 run with PVH domains on ARM
Message-ID: <20201111142109.cumpeziv4xruy6t2@Air-de-Roger>
References: <20201109125031.26409-1-andr2000@gmail.com>
 <20201109125031.26409-2-andr2000@gmail.com>
 <20201111123150.7lkabdo3wix7jkdk@Air-de-Roger>
 <57fefaee-9684-4c67-662e-f4c57313886e@epam.com>
 <20201111135513.yvqfe4xongnhtjcq@Air-de-Roger>
 <fc3a73cc-824b-d941-8ec8-dfcae8ee1756@epam.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <fc3a73cc-824b-d941-8ec8-dfcae8ee1756@epam.com>
X-ClientProxiedBy: LO2P265CA0460.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a2::16) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b31d1ac2-015f-4820-b3e9-08d8864d0c6c
X-MS-TrafficTypeDiagnostic: DM5PR03MB2636:
X-Microsoft-Antispam-PRVS: <DM5PR03MB2636A6930DDCD81CA011EBDB8FE80@DM5PR03MB2636.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bfHN0B9SG2hNbfxoPfXJxQghrTXej6+kxoz2UtJgHU1QilytnMpqI5lM3VLzhWfCBlHEuGmO0tH3u8d3eonMTf5cxTPHWXm919ko88RDagYmp9e1w4tLiBxM1Z/zp4qEj2QGl+rkFObARGNBn5+RcWyUAImIcLJkJ0B3LU++cLumCCoQAk1RkjvRBqam6f+Ui4dqSYg73IeYTAaYW2pkef+rTr73y/z/+hFfr10a92u/OrFjxxDzua2l1NtaazT7FiRzlqf10mz/0Npa/WyhSL7CzM14TSt7zvf2fsXcyWZiXLfrARe+r5p5s7mbnu7Hz20LW4BcmmV/2//YOEJkl5Tpo2Bvp7omlYcltSeqFJN4+Sb7IxgaE1YmZM/3Xd9EHPaScBZ9/ZT2xVaRrBIjEg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(366004)(136003)(39860400002)(376002)(346002)(396003)(6486002)(66946007)(66556008)(9686003)(478600001)(66476007)(2906002)(5660300002)(83380400001)(186003)(6496006)(6666004)(16526019)(8676002)(85182001)(966005)(33716001)(6916009)(86362001)(956004)(53546011)(54906003)(316002)(4326008)(1076003)(26005)(8936002)(7416002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: xol+fdf4arqho64v1pyu2kA0PC0BrlID0MQueLGpQ7L6+zGZSrgFL5Wu2QagGTtFAhF5Vq3c5i+1ui7UZZPWiLvZ70owGzRbjspBvDv1ReuZwickCcVSW6iTkRuxr2FusmM/d+IDjqb6DyjLGttPfVOZ0utPu8msvykh+LhV2nlJdAJ5eorOIWaGMxrjQFmcJuz078uK3xvSHAybvTtQSvJBVaRIJGln5Pks2Bqva+s57A1QaTBQVzDZymhUKTtcPDpzG6rEiCLPjTxINHz0sGyAz2Nv8Ih4Y9jkFcR18swOXmeYmdr2KbiHT0HgqpTKEVfdjGhQdNqcObnWNNFbqk9RoGdqbRXarp8h5GrOyQeWQ4R0aiD0c8SCT9+iAOqfFG8Dn6Ur+DssIYyyRR3/3CYyBYoUBNHx7QMMmwRwvDBlwUrbjihgsWhpCNTGLUd3PRNqsm8lKg//BTW8DimyJdiVL19E6drwBpkd4jtbxqfL83iJpgGxefvkzUBKFHef6pWrktXJGd+X0bYIBT42PYotSLbX7wJdy97IKlICjAgkfdApB+wtyGCTCxrc/aFLoA7ObaUZzmMcxArulBh2FrhTpRz8uSvrC5a70ebhROdQ4WwHTP8nqYOFnhzL2MnbdNRnZhrafxjtDRNz4e+bm4bX8kI98r+rFZYzXX1oW8QaKl+hFgevTwbXQo+w3KGk2TJavjtLbDL/rG+022/HXqQzP168bdSWHGZ07+m+q+gumPAPQ5Vu1UVvQJ+k58N16laUWA7Lq1bus9vWYC+NC/AUUyFYPFQBYiwFFbO8RTdIbYofhQygr2Q6dNlcBh+qc/p0T+beRCk/NYPMZxKAXfmFMP7xsu+luITLK65+3gjaDT1lBJY6GiraIzakS4IVYZHsz0nZckKoA/ElNbnUcw==
X-MS-Exchange-CrossTenant-Network-Message-Id: b31d1ac2-015f-4820-b3e9-08d8864d0c6c
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2020 14:21:15.3482
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X94TMd4UTRNBmqTT4xJZU+w6lOSOWi91M2eor6qinZOS7FzexZG/UuOx3vNl9LpN/MYFfgCumWBySyMnkJOllg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB2636
X-OriginatorOrg: citrix.com

On Wed, Nov 11, 2020 at 02:12:56PM +0000, Oleksandr Andrushchenko wrote:
> 
> On 11/11/20 3:55 PM, Roger Pau Monné wrote:
> > On Wed, Nov 11, 2020 at 01:10:01PM +0000, Oleksandr Andrushchenko wrote:
> >> On 11/11/20 2:31 PM, Roger Pau Monné wrote:
> >>> On Mon, Nov 09, 2020 at 02:50:22PM +0200, Oleksandr Andrushchenko wrote:
> >>>> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> >>>>
> >>>> According to https://urldefense.com/v3/__https://wiki.xenproject.org/wiki/Linux_PVH__;!!GF_29dbcQIUBPA!nEHd6eivmqtdJxtrhO-3x2Mz9F50JsKUoV7WTEJd_D1N01DrBOJXzGW1QAqwshZ9AMxywbUhOA$ [wiki[.]xenproject[.]org]:
> >>>>
> >>>> Items not supported by PVH
> >>>>    - PCI pass through (as of Xen 4.10)
> >>>>
> >>>> Allow running PCI remove code on ARM and do not assert for PVH domains.
> >>>>
> >>>> Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> >>>> ---
> >>>>    tools/libxl/Makefile    | 4 ++++
> >>>>    tools/libxl/libxl_pci.c | 4 +++-
> >>>>    2 files changed, 7 insertions(+), 1 deletion(-)
> >>>>
> >>>> diff --git a/tools/libxl/Makefile b/tools/libxl/Makefile
> >>>> index 241da7fff6f4..f3806aafcb4e 100644
> >>>> --- a/tools/libxl/Makefile
> >>>> +++ b/tools/libxl/Makefile
> >>>> @@ -130,6 +130,10 @@ endif
> >>>>    
> >>>>    LIBXL_LIBS += -lyajl
> >>>>    
> >>>> +ifeq ($(CONFIG_ARM),y)
> >>>> +CFALGS += -DCONFIG_ARM
> >>>> +endif
> >>>> +
> >>>>    LIBXL_OBJS = flexarray.o libxl.o libxl_create.o libxl_dm.o libxl_pci.o \
> >>>>    			libxl_dom.o libxl_exec.o libxl_xshelp.o libxl_device.o \
> >>>>    			libxl_internal.o libxl_utils.o libxl_uuid.o \
> >>>> diff --git a/tools/libxl/libxl_pci.c b/tools/libxl/libxl_pci.c
> >>>> index bc5843b13701..b93cf976642b 100644
> >>>> --- a/tools/libxl/libxl_pci.c
> >>>> +++ b/tools/libxl/libxl_pci.c
> >>>> @@ -1915,8 +1915,10 @@ static void do_pci_remove(libxl__egc *egc, uint32_t domid,
> >>>>                goto out_fail;
> >>>>            }
> >>>>        } else {
> >>>> +        /* PCI passthrough can also run on ARM PVH */
> >>>> +#ifndef CONFIG_ARM
> >>>>            assert(type == LIBXL_DOMAIN_TYPE_PV);
> >>>> -
> >>>> +#endif
> >>> I would just remove the assert now if this is to be used by Arm and
> >>> you don't need to fork the file for Arm.
> >> Sounds good, I will drop then
> >>
> >> But what would be the right explanation then? I mean why there was an ASSERT
> >>
> >> and now it is safe (for x86) to remove that?
> > An assert is just a safe belt, the expectation is that it's never hit
> > by actual code. Given that this path will now also be used by PVH
> > (even if only on Arm) I don't see the point in keeping the assert, and
> > making it conditional to != Arm seems worse than just dropping it.
> 
> Ok, so I can write in the patch description something like:
> 
> "this path is now used by PVH, so the assert is no longer valid"
> 
> Does it sound ok?

LGTM.

Roger.

