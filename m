Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 980D4351118
	for <lists+xen-devel@lfdr.de>; Thu,  1 Apr 2021 10:48:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.104197.199000 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRszt-00070w-IV; Thu, 01 Apr 2021 08:48:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 104197.199000; Thu, 01 Apr 2021 08:48:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRszt-00070X-FH; Thu, 01 Apr 2021 08:48:13 +0000
Received: by outflank-mailman (input) for mailman id 104197;
 Thu, 01 Apr 2021 08:48:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=m73y=I6=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lRszr-00070O-BJ
 for xen-devel@lists.xenproject.org; Thu, 01 Apr 2021 08:48:11 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 54ea3bfb-de98-450b-b3c4-23f6b2c46a20;
 Thu, 01 Apr 2021 08:48:09 +0000 (UTC)
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
X-Inumbo-ID: 54ea3bfb-de98-450b-b3c4-23f6b2c46a20
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1617266889;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=ycESowqVYSX6sOd3+5kZmSuk1kAnamQnVGJeMtY0Z+I=;
  b=aPGdwughSMSVU8RGFBJGTkZduqCMZLbDRkzrV6gJS2+XMI8kbyvoFPbY
   z1sDSm8Ukh0qiKIzSI68gkvfi3HxdueW7xfQp37zhZMj6px16zgP3zAKv
   aVx3c6qmVK3vxaD83YkcKo7s8h0K3EKxDBoJj3gc2NcQ/TvVrPaMVeuMf
   w=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 6pGHwN491dY/sBdxrtQZ5zgn3uRge0bE9xgLF62jz4w/Sko483q7nMj/aeeyKF2Mf6idf58P91
 rq3Ako9dpDFarf/BPCkf1PsrcmM2F9ZT0wi1LhrtZnZxSrrhTK4YOba0h7BF0oWW0ThMeiNNTH
 iiOsWVJgbQWym5lWuC6ciS3/Ul0XT0xs5nBkvWGwqV7HmWo1SyYlNWxLRMbwnHadS6Rm2ptvxx
 W5O9pZsenWHn5E8JtgUOFMV9RrFar44P+HoZ0/VJnREuWIcIF8wLyWGrSowDrzFS1L90PTGGil
 HqM=
X-SBRS: 5.2
X-MesageID: 40807053
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:fBIx+6tR+1S6RWoAoNJB2xrJ7skCIIMji2hD6mlwRA09T+Wzna
 mV7Y0m/DXzjyscX2xlpMCYNMC7MAvh3LNWwa1UB7etWwH6pHClRbsJ0aLOyyDtcheOk9J1+r
 xnd8FFeb/NJHh8yf33+QypV+snqeP3k5yAocf74zNTQRpxa6dmhj0ZNi++HldtTAdLQboVfa
 DsgvZvnDardXQJYsnTPBBsNNTrnNHFmInrZhQLHXcciDWmty+i67LxDnGjr3Ajeg5IqI1Sl1
 TtokjW4uGGv+ugwhHRk1XP54lb8eGM9vJzQOKLjMYRJnHAqCaNIL5gVbqLoSwvrIiUhWoCoZ
 3jpREvOsg20XfNZyWOpwf30QWI6lkTwk6n8lOTjXv9rcGRflwHN/Y=
X-IronPort-AV: E=Sophos;i="5.81,296,1610427600"; 
   d="scan'208";a="40807053"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e/iPIqtm/rwsVrPnt4dnursB8qN8NAtYroNr9M9GhXZRO2uO+s1H3oQ/fh240Hi3OnDvn15MzERZ9nNrSNmeVkBqVSobZ3meE7FF+yy5bhc0/DIxiUjVln6jsgWKMTvOQSgCud/DGQEEErgbrcGs5CKP4Qg/MKzpUzWQlfKBih/U6u+TWhu75yy4vTjD95QLDb/qmyQvDU53DGvAgOiIgCEekJSdVHFFhKDm1uimyKJ6gLJuQXoOuQATnVLUcziuTBjCqSwhpVDAMpIIFWBXlkSd5IixR4CGRqjApb1IlUQHGmwJbVmFstDVU1JDATAb8BJTHFaCMMN+iiM41k6GWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UUcEZb4vYsSnIknMdrcaUmgBNIX+6bgQlq5dQ+9sTIM=;
 b=QvNEo4lGPx0WbEIX/gk/fkTNMJc8L+F6lDJyEq6FY0182ypkhOryZtNT5L1aHxi5paHACQNV95fi9QbYnCyGk+FVNzOVkRaB/IytMBavvHD2gZ70RNJFeBTW284skQWhXq99WfUHI7nhVe9PseuA9ff7owFPL1hP4je+aa1q3pBOrAllLG6PusoWiux0U4E6i4u5PXaphvrzt9RTBVgIx5h6xYowioD1cU5b06zKCBJMQXJs4YK77jJUh2XfgAslgt7qI5ysA+MHCuHK5G+kwU8O3pJvD3hVv4YICkuSKjl9QhPNUfIkrPMMZIgpRGzyBe/CkqIZSTEHEgmL3QBeZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UUcEZb4vYsSnIknMdrcaUmgBNIX+6bgQlq5dQ+9sTIM=;
 b=uxPLG38u5tacv8P/QNTZOvibr5B2fry4bn63WmZ9W2G23Zp+PjPpkKCSqSW6tkHTynyjCl4dPsPFM+5xWo/R0SHqOqYskPlDe4JHMomEZO3KNBEPC5gx52cUxQpBRmkDTQ+govbWMe1kTH4kGLQa4BMu3PgVVMJGMYC9rgFGFYY=
Date: Thu, 1 Apr 2021 10:48:00 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: <xen-devel@lists.xenproject.org>, Ian Jackson <iwj@xenproject.org>, Wei
 Liu <wl@xen.org>
Subject: Re: [PATCH 03/21] libs/guest: introduce xc_cpu_policy_t
Message-ID: <YGWIwFwC9wFoQ/AT@Air-de-Roger>
References: <20210323095849.37858-1-roger.pau@citrix.com>
 <20210323095849.37858-4-roger.pau@citrix.com>
 <7f52bd98-24fd-95ba-f8c6-05a331941b49@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7f52bd98-24fd-95ba-f8c6-05a331941b49@citrix.com>
X-ClientProxiedBy: MRXP264CA0009.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:15::21) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1125c19e-7626-47b7-8b23-08d8f4eade4e
X-MS-TrafficTypeDiagnostic: DS7PR03MB5591:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DS7PR03MB55915B25EDCD5D68DDBA4C608F7B9@DS7PR03MB5591.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ec+SsOJojLakCyvyrDxvvpKBhc736buEVp2Jm0GkkGI1JS6dF9vG9s0xEl9PiqaV+LsShkF0L2uM5SMMk4utPevU84bnfXyR/xoSAXg52rGlYtEIe+zDcF+oavaIINAFfPUybPb0y/ooO1faZqnwsI55TOu/8vWSfh2gaW3JRZQfypicFSm8d0TUUYNujCMZBHkMcFYX5h8xxs8VDAH16krcCRzB6EkrB8di/u3mm+gssT+4fenzhQLkgou2g7AuoNY5ucXeSrTiTTE0ixsuhxLMzVPQLrzW2CEFmySHIUGOJwBC3bCFcG2uWAjFzsFmz9elHB+63J66pUgJqqh2xd76jlCT6PDrRbRarHVwrtDc0tK+NWOFrn8dkqm+rkFJGgmN3IWKGsxxAYS44yNObtu/LeP3Q/nKZF6TfjOeXX3WwBGz76RneZq3DP0aPdNmlf2Osg0TR5KanKtDFZ7eRZwD6FYeE3/JNRXoIf1dxvb5he9TdSVjNE3pMeEUBJodk2gMtXqTJLNMWdIblUoZ7jYQlnVkKmheYQCDdBNGLtJin5YYWC8DBnvoxUkAkdSTygvOovxnM6FQ4Zvl5871jYNrJZ8HUA4uYO0RRnwU/QvN2cYyrzUCZMFgYNTYz9ZL2dnnUQScinBaG/AFbAZmrmQccaLDkhjtgUQt8F1AmaE=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(376002)(366004)(346002)(136003)(396003)(39850400004)(54906003)(86362001)(316002)(38100700001)(85182001)(66556008)(6862004)(478600001)(6636002)(186003)(6496006)(8936002)(26005)(4326008)(53546011)(9686003)(33716001)(6486002)(66946007)(6666004)(16526019)(8676002)(5660300002)(2906002)(956004)(66476007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?Z3h2amRSeTlYY3ZnYTJMaGRLeHRCUnJhYThrVUpzSjI5VmtwREltQlRVMmZ4?=
 =?utf-8?B?RWs1V0JjSFVlVHc4TmwwSDFUK1VKTWlleHJnRS94ZVc1Nk9pZ0JYN09zQ3hx?=
 =?utf-8?B?Z25ScFVxaE9mV0tyRFRtMnJSY0dBcDE3TmJzRVUwd0tNSTRYWHJTVVlyWDZv?=
 =?utf-8?B?RUNxakhrcWxIVDRpUjVNeHBsSlh4MngrN05uVnV1TFNNK1pYR2d6ZEdXL3J1?=
 =?utf-8?B?SElJTEJSVEc1alZrMHFJKzdXbmR3d0taaklmemFHNmI2U0FGVWRKQ2hIMXUw?=
 =?utf-8?B?NFNmYTU0Y0RTRzNnQy8wNDZvY0Q5QkpZNFJ6dkMxSDJYUjZHYlByR2FlWktu?=
 =?utf-8?B?ZHRIRXBuRk1kd0swYWJQR0VPQXBtV1pQaGovWjJJRS91Z0l6dHJtbFpUY29o?=
 =?utf-8?B?T3NTY3RmV2FCa2ZNRG5LRDMzamM3bHhXL2pRcTVDOEhTcTEyeFhFT0djT2Jl?=
 =?utf-8?B?UjRxRDM1RmV6Vk5xMU1kdUUwbmVYcER0eWpVaTZ2UTh1bW81Y0ltV3NVRkdl?=
 =?utf-8?B?VUE0NmtNNEVNc0FxdUNtNitGUU5iMjB2dDN4dkJZRHN1cy8yMlVrOGJtUjcy?=
 =?utf-8?B?LzZycEIzTlUvMlg5d1kzaEliaU9KWDBrVjgwdVI4cm5PaFJndFFIL2hhUU5Y?=
 =?utf-8?B?cksyNWcvaThuQm1yWUphSGRlUi9ZT0p3ZklIVFpDMEVzOEp1ajl4T2FNczhM?=
 =?utf-8?B?dk93N3NSNWg1Y0V4aEZMcDBKN1hweWxIME1BZVBNbkJGV2JsVkl2OGdqMjVM?=
 =?utf-8?B?SENIOUJlWWltck10MGl1WjBWa2xZOVN3Y2Q1d05kN0pYVUl5cnF0dEs1cU4y?=
 =?utf-8?B?QnNHTFd6Y1dQWVlUM0RmNldhK1FnN0F0Ump2Q0x2R1hxRGpsTXorMEN6NEUz?=
 =?utf-8?B?c0ZuNzRTb3ZyMFZTR2p6RlNCV1BEaWZhdFBuNW1paTNCRDJ4SlhyV3FtTmk0?=
 =?utf-8?B?aWIvMElrYXZhaFZtUE1vTUdzYU1wRCtHc2Q4bTE5QUwyRENlOVlTY2FKZmho?=
 =?utf-8?B?RlltSVBGRHBGTXJqTVgvZjVUd1EwbFNmUkxCRUhmRDhOcjQ4dG1qZjZWSDJS?=
 =?utf-8?B?YSt3a1B0bFdScEtxcjFGdjJ2UzRJMm92N2JGcFJ3RHhWb2tDR20xTm0rWkNU?=
 =?utf-8?B?YjRweDMvMm9iU2RTYnhxK2pvcExTckxoZFc5ZGJDRnpWUTAxTlMzMmw4MEJ5?=
 =?utf-8?B?NHdtTGZTUWFBVWlOOHY0aTJaaFJqOFNmTStQR1ZwVTRJb0paMnMxT2RRb1FW?=
 =?utf-8?B?NDFDYmk5OG12ei9kRmxrTzVub0NkM0svRmVWTXFZd2RlV2VCbjNiYnJWNjJa?=
 =?utf-8?B?T3dWZTlnS0VrVW1ZTnZ1ejhXSmxBR2loY3ZsaXJPQkE3SjV2Z0k5QXNVd0or?=
 =?utf-8?B?QTZRRkZkakI3SEtYanh3MTQxQ3pZOGJDQWdoYVlIaFBjdHdFaGpWblRNQzBi?=
 =?utf-8?B?S0p5NHg3WWxlMS9rSTRVcGhEQ3JISmVtSUVZTGxWcUp2b01Qakw0dWNwY2tx?=
 =?utf-8?B?R1dmbWNwaXV1VWFxUWhBalp0YUk2ckFnMGdoOGlNKzhoeGpZVTdTN05EWHFo?=
 =?utf-8?B?Qm1xNUFjNFQ1R1gzUFpoOTRsRGlLOVNlOXJmaENLa1dETy9OY2hWODdXWnoz?=
 =?utf-8?B?aHBMblJOL1lUcDNTOGJwaWNGNEw0d21xblFCT1ZXUzNwMHpZc0Fucjd2K0Y3?=
 =?utf-8?B?VkZJbmFHSVNCNGtMMkRQbk80ODBIQlhLRHlKWk92U3gwU2dkVUROdElRcGVn?=
 =?utf-8?B?Zm9Cc3IyWG04UTJieXBvcVBWOTRweVZta3VidFhHQ09uV2NCc3pDK09nNVRB?=
 =?utf-8?B?YVkzQXJaZ1RuVTRIc1I0dz09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1125c19e-7626-47b7-8b23-08d8f4eade4e
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2021 08:48:06.4229
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7fEMHS8be/3w1ZtBodqoG4pUgM1KLddxNPDK3ukQCGbF9kOrJ7svJFjhyg45ZoUcw2rwX2R2aH+FwYVisBZsdw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR03MB5591
X-OriginatorOrg: citrix.com

On Wed, Mar 31, 2021 at 09:10:13PM +0100, Andrew Cooper wrote:
> On 23/03/2021 09:58, Roger Pau Monne wrote:
> > Introduce an opaque type that is used to store the CPUID and MSRs
> > policies of a domain. Such type uses the existing cpu_policy structure
> > to store the data, but doesn't expose the type to the users of the
> > xenguest library.
> >
> > Introduce an allocation (init) and freeing function (destroy) to
> > manage the type.
> >
> > Note the type is not yet used anywhere.
> >
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> > ---
> >  tools/include/xenctrl.h         |  6 ++++++
> >  tools/libs/guest/xg_cpuid_x86.c | 28 ++++++++++++++++++++++++++++
> >  2 files changed, 34 insertions(+)
> >
> > diff --git a/tools/include/xenctrl.h b/tools/include/xenctrl.h
> > index e91ff92b9b1..ffb3024bfeb 100644
> > --- a/tools/include/xenctrl.h
> > +++ b/tools/include/xenctrl.h
> > @@ -2590,6 +2590,12 @@ int xc_psr_get_domain_data(xc_interface *xch, uint32_t domid,
> >  int xc_psr_get_hw_info(xc_interface *xch, uint32_t socket,
> >                         xc_psr_feat_type type, xc_psr_hw_info *hw_info);
> >  
> > +typedef struct cpu_policy *xc_cpu_policy_t;
> > +
> > +/* Create and free a xc_cpu_policy object. */
> > +xc_cpu_policy_t xc_cpu_policy_init(void);
> > +void xc_cpu_policy_destroy(xc_cpu_policy_t policy);
> > +
> >  int xc_get_cpu_levelling_caps(xc_interface *xch, uint32_t *caps);
> >  int xc_get_cpu_featureset(xc_interface *xch, uint32_t index,
> >                            uint32_t *nr_features, uint32_t *featureset);
> > diff --git a/tools/libs/guest/xg_cpuid_x86.c b/tools/libs/guest/xg_cpuid_x86.c
> > index 9846f81e1f1..ade5281c178 100644
> > --- a/tools/libs/guest/xg_cpuid_x86.c
> > +++ b/tools/libs/guest/xg_cpuid_x86.c
> > @@ -659,3 +659,31 @@ out:
> >  
> >      return rc;
> >  }
> > +
> > +xc_cpu_policy_t xc_cpu_policy_init(void)
> > +{
> > +    xc_cpu_policy_t policy = calloc(1, sizeof(*policy));
> > +
> > +    if ( !policy )
> > +        return NULL;
> > +
> > +    policy->cpuid = calloc(1, sizeof(*policy->cpuid));
> > +    policy->msr = calloc(1, sizeof(*policy->msr));
> > +    if ( !policy->cpuid || !policy->msr )
> > +    {
> > +        xc_cpu_policy_destroy(policy);
> > +        return NULL;
> > +    }
> > +
> > +    return policy;
> > +}
> > +
> > +void xc_cpu_policy_destroy(xc_cpu_policy_t policy)
> > +{
> > +    if ( !policy )
> > +        return;
> > +
> > +    free(policy->cpuid);
> > +    free(policy->msr);
> > +    free(policy);
> > +}
> 
> Looking at the series as a whole, we have a fair quantity of complexity
> from short-lived dynamic allocations.
> 
> I suspect that the code would be rather better if we had
> 
> struct xc_cpu_policy {
>     struct cpuid_policy cpuid;
>     struct msr_policy msr;
>     xen_cpuid_leaf_t leaves[CPUID_MAX_SERIALISED_LEAVES];
>     xen_msr_entry_t msrs[MSR_MAX_SERIALISED_ENTRIES];
>     /* Names perhaps subject to improvement */
> };
> 
> and just made one memory allocation.
> 
> This is userspace after all, and we're taking about <4k at the moment.
> 
> All operations with Xen need to bounce through the leaves/msrs encoding
> (so we're using the space a minimum of twice for any logical operation
> at the higher level), and several userspace-only operations use them too.

We would still need to do some allocations for the system policies,
but yes, it would prevent some of the short-lived allocations. I
didn't care much because it's all user-space, but removing them will
likely make the code simpler.

Thanks, Roger.

