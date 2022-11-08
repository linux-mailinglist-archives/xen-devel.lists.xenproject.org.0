Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 68D3E621937
	for <lists+xen-devel@lfdr.de>; Tue,  8 Nov 2022 17:17:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.440269.694403 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1osRHX-0002XU-38; Tue, 08 Nov 2022 16:16:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 440269.694403; Tue, 08 Nov 2022 16:16:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1osRHW-0002Uv-Vw; Tue, 08 Nov 2022 16:16:58 +0000
Received: by outflank-mailman (input) for mailman id 440269;
 Tue, 08 Nov 2022 16:16:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zz3j=3I=amd.com=Ray.Huang@srs-se1.protection.inumbo.net>)
 id 1osRHV-0002Up-Ed
 for xen-devel@lists.xenproject.org; Tue, 08 Nov 2022 16:16:57 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2041.outbound.protection.outlook.com [40.107.236.41])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c228da3c-5f80-11ed-8fd1-01056ac49cbb;
 Tue, 08 Nov 2022 17:16:54 +0100 (CET)
Received: from DM5PR12MB2504.namprd12.prod.outlook.com (2603:10b6:4:b5::19) by
 CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5791.26; Tue, 8 Nov 2022 16:16:52 +0000
Received: from DM5PR12MB2504.namprd12.prod.outlook.com
 ([fe80::ec49:f96d:d3f2:79d1]) by DM5PR12MB2504.namprd12.prod.outlook.com
 ([fe80::ec49:f96d:d3f2:79d1%4]) with mapi id 15.20.5791.020; Tue, 8 Nov 2022
 16:16:51 +0000
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
X-Inumbo-ID: c228da3c-5f80-11ed-8fd1-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P4dahvRZzffCIs2zRTYKUauC2D5ftLPfDd1na2/OkKyspqHiq5w1zyh7hVDwZ5gCC3JUXLnNb5jriZW8KQKw03jOlMQc9WCovl/6AIlHDitsxEqN/HRZctb1N8rizP8xyrwwaLefis0NTim1H6ZZL4+KaT/b1M0s7Lk5DRL3Nsvvq/HTjiBpymiZmNDWWjqLPBBiqgLArNLUP0XP/QbglUZ1YT/lqTsvVbtDopOXqhM2ZMNEe+ETq9Qkh0UiYg9t8hUcYj0ziiuJShxNlSDIg6oy0NsNXSMgvADTrYHUSAH9ejrLha9KpMfRHpOxuQrlnnh/DeutBuBx3Y8K2SaD7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DipKu9PihlKsrzJFJk2ibqYsugR4ikhWtCKE4PjQcTk=;
 b=PFXQh4kOXdi0bbQswjWjMPfkhKg/S8kr7Ma0adM85f0Ao62XXHa168GqGn0TmFVEklFy0mWbtBJcbc5qre3mUhPQ3rnLIKQUbZ6k03I8J80+0VALHuql+YSE9L+ZG9TgxiSRilpUVcu1ndLkjq13L0ecl1d1YuPcTc+0SYwCm9YJl7XPOSp/awyeEvr4xfT0ZBQqKM9xD9tn47d12VdpYwx1kwJ+RT0F73yxp3F9FmRai3wgFCFqq9n/7GybdB3CQ00ZD9eTUavW1ZkaAxH92shn63LV566NVT0T/7whcGL4uxejyHI2+6rEiTQlt31vQqOtm86g+aWCPAxZ07nsdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DipKu9PihlKsrzJFJk2ibqYsugR4ikhWtCKE4PjQcTk=;
 b=FDmNTra1uvyPp8Y3eedtrXH1j52vNcjtT8Q1bhPnxn4ZU7XNtsQ8FydOtH6gUrNnZTQzsioV5e562B16Ggm3miqu7KlKOF5Us3fLrx5wUkw3dd3kVHIw9KuYTn/bmaPPTI8b+MEXV2rztMehSso6GDUT80EJYaOXJEgp1x5RH9Y=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Date: Wed, 9 Nov 2022 00:16:30 +0800
From: Huang Rui <ray.huang@amd.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	"Henry.Wang@arm.com" <Henry.Wang@arm.com>,
	"Deucher, Alexander" <Alexander.Deucher@amd.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH for-4.17?] x86/pvh: report ACPI VFCT table to dom0 if
 present
Message-ID: <Y2qA3sEnSa2xdseR@amd.com>
References: <20221108135516.62775-1-roger.pau@citrix.com>
 <9b785cc6-2de1-a522-9e57-62c0421c6a21@suse.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9b785cc6-2de1-a522-9e57-62c0421c6a21@suse.com>
X-ClientProxiedBy: TYAPR01CA0212.jpnprd01.prod.outlook.com
 (2603:1096:404:29::32) To DM5PR12MB2504.namprd12.prod.outlook.com
 (2603:10b6:4:b5::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM5PR12MB2504:EE_|CO6PR12MB5427:EE_
X-MS-Office365-Filtering-Correlation-Id: ffe2a025-666c-4882-059a-08dac1a4a4b8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	lfi9lqVl3+yXisIAue9Hok+6vKZIsQ0pBYugKIxpfDaQK6zF9T0ZT3t6McwIBcWiXs8/naiXFQPAkg0BQ3umOqIHUFdd327PYHnWlEd2P2cihYXIaxXAncIqC+5VwkASUhWpzI2x5uKkkRwjd8MjVNMiMok9cFKYfHsYBZrxdccoguFXMXjukoPve+geIZkLDR2McxVPHkZ6miezHUVG6gHgsH4zFvhJ/DWun2vsm+ZPADWmCY1aMM+wCioAZwg7jqliWc5NW1YlsHkghQQiHqCyuDy21ML17xdl5wjVN6BxqchddCoxWrEeLTkGDbf4Nqu60Do7Amv9dD8rfYZ5pjGUe9QBnIlVbFF0eC9EKhimzJRnzxGlxbC4ZsbqE/GgxOl7UfhxqFJJLCv1Q9hLVQkoDCkmtNg8dlbnBYDbHijUSt9Xp3T3KbLeKC7MkWrKuokWcnbtRP+KgpwuZQUIq4hScOYLj7JUrqTrZZ0q4Y0IXvmthzoKs8hn3FxP4NHJneM/jLP1DkxKifkoF5L9/M2dr0DYX5J+3LT3UE4rVHp9vusMIKlTlyOay7F+w7xRwtw9EQ0QzpfhQPJ+Z/3k4NCl/ZTvvl77cifv/fg5SmCmqPvkwFBXeSNIYm7UUVxirxfFnwDblvBCgqR1WXjQaQQXuZm/32+pPDJaeevgUn4SJ7bX0vA6ju20hvFnRUK29wCa58iIZty4GIW6QcIjeobMWxOg2ozVsdTcqFxvaQwlRTVS8pASJ2JCboeRMymF
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM5PR12MB2504.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(376002)(346002)(39860400002)(396003)(366004)(451199015)(36756003)(6486002)(86362001)(2906002)(6666004)(6512007)(53546011)(186003)(83380400001)(2616005)(26005)(52230400001)(6506007)(66476007)(66556008)(66946007)(4326008)(8676002)(45080400002)(478600001)(6916009)(54906003)(316002)(5660300002)(8936002)(41300700001)(966005)(38100700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?lFTrcNa+StBDw7ue1pNURHvZEeO9ZmQIp7jOiLngmHQsSPRGYaImlmgJRo?=
 =?iso-8859-1?Q?VW/Hyzw0xjRnPNua4zfwF/wwombRgmEQusHpQQhnOxaB06nCh+JqCexylW?=
 =?iso-8859-1?Q?+5jhMRKzQYUdNDQpWwHM5kkvrbJmZD3xXIVXQE8Yww06j6OFHCWfWjZASE?=
 =?iso-8859-1?Q?8qYFIXvZPD0nA648pw2osyy3igCN9qpu3Mj1AQDaS3mknUrdhvDZqhaH6+?=
 =?iso-8859-1?Q?npSUiuPgh+hMzBeD7CK6HlXxth9krmqVAtS9BqWJcNTrY835ByaPjdGqju?=
 =?iso-8859-1?Q?Y3lgx+PUx2WTR1CNTj+z6a9ceBiNvte+zlZUPDXLvuHQn6Em8lFXvQqhGG?=
 =?iso-8859-1?Q?bn9XgefhGBNaYnR2sCgYb6oXvbWuajIjXxqrE0ip7BqdjdwGe7dZ8i6gBy?=
 =?iso-8859-1?Q?CT2gQLJUeV53fAPGDxILMREAQl+F2KfoRDr1lY4GTszs/lnVbynjFzbOCC?=
 =?iso-8859-1?Q?N20GJBBIKwDaVIsxVBK6d40+P5w3DNw/EYPVide3cCZ37aKZhZy4HfVEMs?=
 =?iso-8859-1?Q?sjs7unqVBkgslXJJSqYXJHHjVEN1pZXw7sZH1trmvXyq3PR1WRv+5uQRQT?=
 =?iso-8859-1?Q?WsVqMxBkZeVVbtzKlBixK0QTjuXBGVMzMEhw+Q76Wl+RQp9nEhhduce6uR?=
 =?iso-8859-1?Q?VzTE9i9+GIWR2Ca/+zCoKuomp0nP2eBB28+NF0bW99IuvsjSR2sSUFtC5G?=
 =?iso-8859-1?Q?PnO6Z8CnbOrBif1d2COegjo+iQwB1UDXf0Y/jYXFT1nNVzgikIFP9envTL?=
 =?iso-8859-1?Q?Ifw69mOrb5g5Z8tPxU5Vp8Ace0RUlTIDOf9NFhWAes8QYgzvoCwaSwthSi?=
 =?iso-8859-1?Q?qAJvgCaRAFerenEyEnVI0nFv6hJKh32WnfkLXcJjB/wHDtafe+7EgaUY+2?=
 =?iso-8859-1?Q?AgSVOupcrf7FkTPKpuyAcb28bZlNT+Uw+i8nbjqNNfw8J5fBO2j8UWPcvf?=
 =?iso-8859-1?Q?ssxgF/NdBTKtS8hlSE0rPysGs1ofUq56qA87Relhg/Oi7dXlUQh2U8W3jw?=
 =?iso-8859-1?Q?fNqqQ13mvwR4d2jKaW+Sk/yGV5oHpR7Pqni1L9t6jGOkXbmDpNEJ/lDjoD?=
 =?iso-8859-1?Q?vBvt6ATPKu+XKvk8Ag/2FohnuygFoT0rAfbZSKYT/y6QlMxtsYEmpB5Utb?=
 =?iso-8859-1?Q?cNbx19CwJk82MmV5xNLz4EE9kH4w20/vUZk9fS09sA8TK3WFn509BrmVg7?=
 =?iso-8859-1?Q?TqkvmMnt4QTS78Nbc02pJz8PsgoAjIqVUDiVejAju7qe7ySnWLsNpzhkxr?=
 =?iso-8859-1?Q?obQPUSPNZQA55jet47yGDZItjeo75wEcJJql7YC/ZBXkplbCj1/cTi8mwL?=
 =?iso-8859-1?Q?FAGk5qZPWdX+w5ZclDCqbyvaJW/yOIHT9s5S3MjTZ/5kXceTomvjufFtDL?=
 =?iso-8859-1?Q?uQxAXXPJVGPNuaV312KnGa8qYh70eNOyhtfuTXf58c2DJYsr1bGn2UcDsb?=
 =?iso-8859-1?Q?fRm7yvHdLym5cwHzKDBIihcQoR7nsWiPg8k17aiRWIQMsdrjfhmg7ahLfh?=
 =?iso-8859-1?Q?LGPop5gfhV73otQFeSw28Ykp5u0PYFkUlR/ounZGCfTHeIH2t7VKwPHciL?=
 =?iso-8859-1?Q?JaC9FKEHM+vhTWv8UvKchKFYtoDjacIxi0NkAxM48MdYSQqn5bhJSV8u1k?=
 =?iso-8859-1?Q?Qdrxpnefg/plxb+f4KtwwpwGKNCyob3x9K?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ffe2a025-666c-4882-059a-08dac1a4a4b8
X-MS-Exchange-CrossTenant-AuthSource: DM5PR12MB2504.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2022 16:16:51.0698
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QBx2dM/dZApUNeZQYLK6cstmYDmpSD0yOafkxnh+/qqADOW5MLLqcnoKQAbMhDnB0K8hPeDBl438hOv9O/26Fw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR12MB5427

On Tue, Nov 08, 2022 at 11:56:17PM +0800, Jan Beulich wrote:
> On 08.11.2022 14:55, Roger Pau Monne wrote:
> > The VFCT ACPI table is used by AMD GPUs to expose the vbios ROM image
> > from the firmware instead of doing it on the PCI ROM on the physical
> > device.
> 
> I can't find any mention of VFCT in the ACPI 6.3 spec, nor anywhere
> under Linux'es include/acpi/. I don't mind the addition that you're
> doing, but there needs to be a pointer to a sufficiently "official"
> spec.

Thanks! In fact, this is defined by AMD atombios (VBIOS), we have up
streamed this in the Linux kenrel. You can see more details here:

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/gpu/drm/amd/include/atombios.h

Thanks,
Ray

> 
> Jan
> 
> > As such, this needs to be available for PVH dom0 to access, or else
> > the GPU won't work.
> > 
> > Reported-by: Huang Rui <ray.huang@amd.com>
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> > ---
> > This is a bugfix, but given PVH dom0 is still experimental I'm not
> > sure it would qualify for the release.  OTOH being experimental means
> > there are no guarantees it will work, so the change is unlikely to
> > make this any worse.
> > ---
> >  xen/arch/x86/hvm/dom0_build.c | 1 +
> >  xen/include/acpi/actbl3.h     | 1 +
> >  2 files changed, 2 insertions(+)
> > 
> > diff --git a/xen/arch/x86/hvm/dom0_build.c b/xen/arch/x86/hvm/dom0_build.c
> > index 1864d048a1..307edc6a8c 100644
> > --- a/xen/arch/x86/hvm/dom0_build.c
> > +++ b/xen/arch/x86/hvm/dom0_build.c
> > @@ -924,6 +924,7 @@ static bool __init pvh_acpi_table_allowed(const char *sig,
> >          ACPI_SIG_DSDT, ACPI_SIG_FADT, ACPI_SIG_FACS, ACPI_SIG_PSDT,
> >          ACPI_SIG_SSDT, ACPI_SIG_SBST, ACPI_SIG_MCFG, ACPI_SIG_SLIC,
> >          ACPI_SIG_MSDM, ACPI_SIG_WDAT, ACPI_SIG_FPDT, ACPI_SIG_S3PT,
> > +        ACPI_SIG_VFCT,
> >      };
> >      unsigned int i;
> >  
> > diff --git a/xen/include/acpi/actbl3.h b/xen/include/acpi/actbl3.h
> > index 0a6778421f..6858d3e60f 100644
> > --- a/xen/include/acpi/actbl3.h
> > +++ b/xen/include/acpi/actbl3.h
> > @@ -79,6 +79,7 @@
> >  #define ACPI_SIG_MATR           "MATR"	/* Memory Address Translation Table */
> >  #define ACPI_SIG_MSDM           "MSDM"	/* Microsoft Data Management Table */
> >  #define ACPI_SIG_WPBT           "WPBT"	/* Windows Platform Binary Table */
> > +#define ACPI_SIG_VFCT           "VFCT"	/* AMD Video BIOS */
> >  
> >  /*
> >   * All tables must be byte-packed to match the ACPI specification, since
> 

