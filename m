Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 300CE38775F
	for <lists+xen-devel@lfdr.de>; Tue, 18 May 2021 13:22:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.129079.242310 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lixnn-000730-D4; Tue, 18 May 2021 11:22:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 129079.242310; Tue, 18 May 2021 11:22:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lixnn-000707-9R; Tue, 18 May 2021 11:22:19 +0000
Received: by outflank-mailman (input) for mailman id 129079;
 Tue, 18 May 2021 11:22:17 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9UfV=KN=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lixnl-000701-Nt
 for xen-devel@lists.xenproject.org; Tue, 18 May 2021 11:22:17 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f87a7cad-e82f-4cad-9903-da7c1d167681;
 Tue, 18 May 2021 11:22:16 +0000 (UTC)
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
X-Inumbo-ID: f87a7cad-e82f-4cad-9903-da7c1d167681
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1621336936;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=FwdNIL7qXVPlTmxhA3J+zSc7qIgdvIigpL79T2ZcotM=;
  b=Hp0wtejt2VJAgybOjgIOYOhFt0R6OSZoK5Zu6gVuE2TQeBtcaiEw79pF
   ZymHmZtHarUCTXj+/YQrS1BUZC4RpUtTpmJJjyBuCFQ+koTSgLt1d3d72
   rCEd3a5vVSTu7vJd0ckmC2NH/w8iuviJdBYPQTWwhpQrZYWYBrxb2PkKA
   g=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: nsiFW6O9ZJAwvwkt3nImK2sH8ap24MFzq8HQjiDQFTDbZBqanxOSQK+RSIZuCX8OGDKjtbFkml
 CFbNR7lqukG0k16tAK4eAUv1GOM6md+uoWSLOP/X1MiLuB7VFOQxu0siWmZyR3v6V4+mPRpGHA
 wxTdmJY1J8FxGLju9zqQ0csPoXA8FQn023m06wWHqqxyIzk6ubN8vZQBvgysvVIlMJ6zuCMj0g
 gqN4MoZVxbS+dav4A/zff7ttiKAwATNt+U2hIJ13jHvga9GA54w5/qbrTcAxwrZ3qLYtLDeJ3H
 NDU=
X-SBRS: 5.1
X-MesageID: 43811264
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:FB2zAaO1OFrpIsBcT8H155DYdb4zR+YMi2TDiHofdfUFSKClfp
 6V8cjztSWUtN4QMEtQ/uxoHJPwO080lKQFmrX5WI3NYOCIghrLEGgP1/qG/9SkIVyCygc/79
 YQT0EdMqyIMbESt6+Ti2PZYrVQs+VvsprY/ds2p00dMz2CAJsQiTuRZDzrdnGfE2J9dOUE/d
 enl4d6T1XKQwVaUu2LQl0+G8TTrdzCk5zrJTQcAQQ81QWIhTS0rJbnDhmxxH4lInJy6IZn1V
 KAvx3y562lvf3+4ATbzXXv45Nfn8ak4sdfBfaLltMeJlzX+0iVjbxaKv6/VQ0O0aOSAA5Aqq
 iIn/5gBbU915rpRBD0nfO3sDOQlArHghTZuC+laXiKm72weNt1MbsHuWr1GiGpnHbIh+sMpZ
 6j6Vjp/qa/PSmw7hgV2OK4Iy2CtnDE6kbKwtRjxUC2b+MlGclsRNskjT9o+dE7bWTH1Lw=
X-IronPort-AV: E=Sophos;i="5.82,310,1613451600"; 
   d="scan'208";a="43811264"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eMP8c6ipiwoFOKyECASbD7GFzNmiIDuucIMN/WPSFwnqlK5UEW+JRQM33ZZTswYr4kpD66wRXMhqSQqExdjBoqmJht4z0mIOU/yvRLU1UmjZ7yns3dn6tbHVVAKesUPPqeJHm6t+idQQobTZnkSJpfLFwusyClLpsk0RG5OSJRXMdybIaywGPJTDwweoo4XiRPMSiXuamfKjv+7Rby0VEqJEGsDHD9Xwj66g9Tw/IwqJhkWkfpRcGtO90HuA7kNiSwh6IaJRb+k4R6CDnQ2KoZE9bu3Sb+BWGGjDGqwTFt4qKj8pvTB1XXj8TgEgra5+D2H5nHi98BpwU3qzRoOuEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OgOXpGvZRfLjobJD5KW4J7iqSCteow7nPWaKurE1NW8=;
 b=XypIPlp/U7kToJA4GqyEDKvoC6IAFdHYwY8A43fKxP/L2Boj1jRiu8z/BwgMV/TBtOVFKXJjoj2ioJYU+bzxZC9xD1s43ETPKOrAbWGuCMySraiqlkI7num1SuYmYL4qYgedOfvM1/DOIqhSbbdH2MhzK+QEImD+jvwgaVyFvjSWcf6MkYvmD8jDsHEesMtv5s3igeOwHOt2/XeJFrSDGgjuQ74vYdjmsP9nuJx4lqomGgV4T/2LOmVC86z8az2n36EW1wyAwQpCKyZ47Q4Djoh9oeI8hYTJ/byENrGrTU81SWLgd2yXAeaGHSyGXvy8ZxlSj5q1Vkdj5vPodoV58Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OgOXpGvZRfLjobJD5KW4J7iqSCteow7nPWaKurE1NW8=;
 b=IOEq9aXIdU4IxVI/9GKs1LDYdFksACxWJXqlToHRy509W+GtGLLbp9LrBY187DUC8gjzgqJ0iGxZ1shCzdga/bZr5cq7/s0L+ian9qSfzbtIiWk85JLTrxhz1RNcRmzueLwRVsLhp4GlNveMukfToj9w5AEQpJW5SFMbTP3Y/3Q=
Date: Tue, 18 May 2021 13:22:07 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Julien
 Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] libelf: improve PVH elfnote parsing
Message-ID: <YKOjX2pYc+SCHyBn@Air-de-Roger>
References: <20210514135014.78389-1-roger.pau@citrix.com>
 <8ef298f4-24b5-e133-fc3e-87a67132a61b@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <8ef298f4-24b5-e133-fc3e-87a67132a61b@suse.com>
X-ClientProxiedBy: PAYP264CA0015.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:11e::20) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ad15d11a-b684-49d1-704f-08d919ef2ed2
X-MS-TrafficTypeDiagnostic: DM5PR03MB2490:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR03MB2490C304E2EEE986D8728B2F8F2C9@DM5PR03MB2490.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HWaOy8i229f8rXqiZAUV4lYKOPdL+gJBBJatyL+5J9qztdrfFuZNGrGtPJi6dGLAiMv3u2xcG0CKfPXzKD7BUPZQODezPCCHQdwL/xf1SHua31MC8xuIiUXun3MkoNDtfpdZx88FGLBpI4fyqMrhYiWe62dbRculeLS3EP/LiQklpobvPQyP3xuY54olW7IepfFxz1x2pM0vER5vU+NpgoUnOYm15UZwKTMMF7dmMzGVT2APRwbhGgY/H/YWiGpZRioNPaV4AonrGS0uoU+Fw3Kh73MfQvPHpmOGQ3o9+cEhPTH3dB3FhwoGYPlP8yiYCkA8XDiVj5bzM/xvp4nLu+i6bD0qys8/J5ou3HtEv8RUP9ygdEN4fjmljF+ySyGk+5IcpDu19x7P21SK057gLmIW3dnpbD5mfs6PA/Rb+pRjboaVpWKzjBrkpT0JCK79cOEXoSGHkwnzEC65BqX3b5FV1WCkXwk2o4j9d8Tpjy3AQpcyA6b4cgNmPJmCb15fM9nBqgDzD8rppZJw1U/ctQot/xV9jlk2i0hAvu2G7355TODLMEaFS9yL+qXrSuA+kYZdJ2keESVFrb0SbUcG8fzLxeZ9z3uKYODvsoh7g1Z5hUmznEF3vnokYtbRCqjUmQeLNSa6MPfWx/4HZLimAw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(39850400004)(376002)(366004)(346002)(396003)(136003)(6916009)(5660300002)(2906002)(316002)(8936002)(54906003)(6666004)(478600001)(6486002)(86362001)(8676002)(4326008)(6496006)(16526019)(956004)(186003)(9686003)(26005)(66946007)(33716001)(66556008)(66476007)(83380400001)(85182001)(53546011)(38100700002)(67856001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?ajgraXQ2RXJOQk82Nlh0ZDZ6YzJLMCtTRE56R3ZzVTFucHBSdmdERVNlSEYx?=
 =?utf-8?B?ckM0UVl5RHNnVVB2TkRoNUhGNEJmREFRb2NqZ2ZxTnVRUEM0Uk8zR3VKMTIz?=
 =?utf-8?B?RllNMS9KK1o3Y3RISHFIYVFJS1dlMG9kY0l1ZVpYR3BBSWRyTDFQYjllMU1W?=
 =?utf-8?B?UjZ2d3RFdUhXalE1dEIyVllIQ09WNW1mUUk0ZUdsamcvMnA4a202UGpBbWdw?=
 =?utf-8?B?OEM1dU10Ylp5UHp5NWcrbjQ0MzdEMDBJam5XWXBibGVQK2IvbG5vMmxXa3c4?=
 =?utf-8?B?aHRnS3JhZlRjMDZoc2gwNkJGQzBOeVFkK2dkQ3ZIVWhNKzRLblVXT2lRakYy?=
 =?utf-8?B?aUlqTldDNmtpdTJmUVY0QzFMVkJFdlhjQmxlOTkvOHNmNlp5MXA4Nm5ENHor?=
 =?utf-8?B?Y1RlWHFXRW9obVlkbDFVMXJqK3hlbExvc3NrQ3NSbHh6ZHd0U3VDNUZmaDZi?=
 =?utf-8?B?M0M4S1hLOHJIbGp0THY3TnNCMW9CZTBTNDN2c1crR21mVjMxcUpKT0xXKzdj?=
 =?utf-8?B?dXBnZmVRMVBOQ1IrSlV4SkpoY1NkaVdVL0g0aHVDR0NSU0VacEc1OW9CYVoy?=
 =?utf-8?B?Vzk1RTgzcmFJYjU3MHNpeWxxWnBJc1RaOU5GbWxGTnpVbTBlQ2dqQ1d3UENh?=
 =?utf-8?B?NlpicXBQTzNxWTFVdUdtZkNYMzVSeENZSlRZd0Eyald0a3plbmgxdWNudXNI?=
 =?utf-8?B?ZEY1em93cFVPdkpiSDVLYWV3MFdVaWFkeElMNG0rWVZRV1VtVGJVWEc2aXFl?=
 =?utf-8?B?cFNyeTBDcGw3MTdVeDhYdTRmSUk1UHF6dFRDRGNPYlVwTmxscVV0a2ovM3p1?=
 =?utf-8?B?a01Rcjd6Rm8rSkJSMUYxQmtFYlpZenFNUm5OOFhBTXUyWmpqd0Q1c1g3cnh2?=
 =?utf-8?B?a3pxVHBuazlyL0tXNTNOM2w0ZTBxUnJnNEVXOGpMUzBGSnZ3bEI3RDBidDdj?=
 =?utf-8?B?aVErZ2ZaRXJqMFhjeXJ2VHdPVUtQdE5teStrcE9IOUNveWdkVHhQSWlHek15?=
 =?utf-8?B?dFV3SU5jR2cydTZvT2hCNnFEaUZRWTFEQm5HMks1bXlOL1IzQ25sd2Naa2Fn?=
 =?utf-8?B?MFowRHRkMEhJcEorSzRPYUtPU1pxcXV5Z2tpdU1qNzJxMXBkYXZVWmdNSEtF?=
 =?utf-8?B?eWVrazNLNDJlVWh0RXNPTlBYYUw2bjZWWmF6NS8zS1NSUzZDWmdxN2QvdWRa?=
 =?utf-8?B?RXFiVUZjeXQzMTZwWE5Gc2ZUSURjNkgvcnprWi8vODJNVzA2NHp5dVRGRktN?=
 =?utf-8?B?eGtDOHJWOHV4U2JKeUVFNmdDQ2Z1c1NwKzlCU2g1ZUYyNnI5Q1VORHdVaDBh?=
 =?utf-8?B?L1BiVzRYVFJHWVdZR1VhSDFubmhwVzZMTzV4OGlHVjloMmJoQm9WdFZES0Ez?=
 =?utf-8?B?UGJhRE5EZlU0QWVidVIxTmdjSDBxUUw0TXRWMG1OeWlsMTNvTUZaMTcvb2Rh?=
 =?utf-8?B?SnMxVFVIaGlIdTNqS3lzaWRJZ3dWeEd6MzhiRHZDNmM2cVg3Z0hScC9Fd2Vy?=
 =?utf-8?B?anR2Zit5RFNXOUZZL3ZkYTNSb0FWV1BhQmluekpIbmVzNWpEb25NcUFLZHk5?=
 =?utf-8?B?Y1BnTzJxb3hPWFFJSU0vK3Y5Vm53QzE3Kzk3Wm03ZVdaZG0zRFBTM1pVaTBv?=
 =?utf-8?B?VHp4b1hCNC8wOTlZamk1N2t5UGFjMnYrSnFXWGRidTlxTmdUNWJveU8vR0tY?=
 =?utf-8?B?TUliK3FzMklHLzhRbThwR2liSUVMQUlQQ2VyVUdRSlNRTk1DeXVmZ0dyTEZV?=
 =?utf-8?Q?R6OlwScuwIXgERb2HqI7q4QevMjVhrhU35vkQPN?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ad15d11a-b684-49d1-704f-08d919ef2ed2
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2021 11:22:12.6113
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V+M+cA9nxGUnNQsa9C88ci5U59DLempypqScWZoYeO+R7RazTzDkFjBVHNxZw6p79XBiPfxB7BC68bLaR3kWKg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB2490
X-OriginatorOrg: citrix.com

On Mon, May 17, 2021 at 01:09:11PM +0200, Jan Beulich wrote:
> On 14.05.2021 15:50, Roger Pau Monne wrote:
> > @@ -426,7 +426,7 @@ static elf_errorstatus elf_xen_addr_calc_check(struct elf_binary *elf,
> >      }
> >  
> >      /* Initial guess for virt_base is 0 if it is not explicitly defined. */
> > -    if ( parms->virt_base == UNSET_ADDR )
> > +    if ( parms->virt_base == UNSET_ADDR || hvm )
> >      {
> >          parms->virt_base = 0;
> >          elf_msg(elf, "ELF: VIRT_BASE unset, using %#" PRIx64 "\n",
> > @@ -442,7 +442,7 @@ static elf_errorstatus elf_xen_addr_calc_check(struct elf_binary *elf,
> >       * If we are using the modern ELF notes interface then the default
> >       * is 0.
> >       */
> > -    if ( parms->elf_paddr_offset == UNSET_ADDR )
> > +    if ( parms->elf_paddr_offset == UNSET_ADDR || hvm )
> >      {
> >          if ( parms->elf_note_start )
> >              parms->elf_paddr_offset = 0;
> 
> Both of these would want their respective comments also updated, I
> think: There's no defaulting or guessing really in PVH mode, is
> there?
> 
> > @@ -456,8 +456,13 @@ static elf_errorstatus elf_xen_addr_calc_check(struct elf_binary *elf,
> >      parms->virt_kstart = elf->pstart + virt_offset;
> >      parms->virt_kend   = elf->pend   + virt_offset;
> >  
> > -    if ( parms->virt_entry == UNSET_ADDR )
> > -        parms->virt_entry = elf_uval(elf, elf->ehdr, e_entry);
> > +    if ( parms->virt_entry == UNSET_ADDR || hvm )
> > +    {
> > +        if ( parms->phys_entry != UNSET_ADDR32 )
> 
> Don't you need "&& hvm" here to prevent ...
> 
> > +            parms->virt_entry = parms->phys_entry;
> 
> ... this taking effect for a kernel capable of running in both
> PV and PVH modes, instead of ...
> 
> > +        else
> > +            parms->virt_entry = elf_uval(elf, elf->ehdr, e_entry);
> 
> ... this (when actually in PV mode)?

Oh, I somehow assumed that PV guests _must_ provide the entry point in
XEN_ELFNOTE_ENTRY, but I don't think that's the case. Will update and
send a new version.

Thanks, Roger.

