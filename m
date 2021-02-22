Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ED00E321C60
	for <lists+xen-devel@lfdr.de>; Mon, 22 Feb 2021 17:08:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.88227.165759 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lEDl2-0004uY-F1; Mon, 22 Feb 2021 16:08:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 88227.165759; Mon, 22 Feb 2021 16:08:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lEDl2-0004u9-BS; Mon, 22 Feb 2021 16:08:24 +0000
Received: by outflank-mailman (input) for mailman id 88227;
 Mon, 22 Feb 2021 16:08:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=w45/=HY=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lEDl1-0004u4-MN
 for xen-devel@lists.xenproject.org; Mon, 22 Feb 2021 16:08:23 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8a811038-7577-4009-ac84-c7094850eab0;
 Mon, 22 Feb 2021 16:08:22 +0000 (UTC)
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
X-Inumbo-ID: 8a811038-7577-4009-ac84-c7094850eab0
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1614010101;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=29jhYJNSiPzkntXS1Vdx7RLpnsGpoNDg168uheA4bsE=;
  b=Al+32PVKZu0u92C4Bp66Na2dnnWWepFmK1MIJqylOXbzar2ypkdN4J9s
   ejFM/JvRIpANkrPbOpMdUy6FRuPwZaeXg0zddXS+aUlmD8QyduX2E/8Ki
   7thA/tQ55H9p4Sq1YRjWKzCbX4FWmvuSVOpt7H0PKXUoKpRX6AxYtdvov
   0=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 4H+WQCI7vCLXTiDhBv2gLDZdacPuGNvJAYMZIjxCXaMPzf7iAoQOb/larwec8UmgwSZH84gMpP
 634JMeuEO4cQ/IsXkU0YRTnK2UcxzKuCJoa1cvmoxkXHS1zKpHwmi0xWyVX8uPglJ/9QoiNFZg
 BXXJhzhxqSet3k1MUe8VVQCpBY0rk0DtAvF9GBTiOd3y3oQGET9jTYzW4ROorlDXl7CugHLGx2
 OJexsIXc9u0vzkEtWrAWYpd5DzA48FAK2PgHKDiVh/OLJRxUwtwBhdI5rwKf8mwtuOtJ8JDLzQ
 140=
X-SBRS: 5.2
X-MesageID: 37748281
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.81,197,1610427600"; 
   d="scan'208";a="37748281"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XYOUSujoU/eB2aVFpGcUhiBDB19CeBtJUH0O35gMDAlbwDX/0fXf8N0J3zMwBNlE6fcaAATSbvUc8b0oH5kGVsX4tOm2UbSR+E4JamV0IH3//IqaZh6Pc/Jb/DGy36MDSWc+Qnnl3XcgB7rSFfrUe5C5SkHonyBsUPY6Ws61D3nBRRZ5vy5dxo7fTZbMfFGf35Trw+3aTi5gorH9luqs5Yzxdf5p9Q/4lFl78NqbdGisoRXnUMkkGlerAfwCj6MXshrgTdqAAh6M1yZFm4d+Poqj44/O6iuuwfCt95GeOGzXHenny5NZjBsLyFocGFjT2hwbmUoUZo3yF7SeL/sFCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WLnkZsJwwsI8HcmRulCLgyxmuujzINu+NYJ+HPQolY4=;
 b=ncoIMq9+OWRCe/CyvcBX+XdClROT1eeVY7OzhUnMAkmzpvIELHEVshj8CX2GsbUy+8XcwVGb/KeEJaaS6g8jliybMRKc8kN+PfAnesYQd9eQFOkDmcQo6bmBoVfoRHiO1SPgoMbfNNqOqhO2NNFEZwvWH8hP/okaQoEHzf6vKHOlLOfJNDgXHR1Qv0InHVtvbDrVhgAnWUKdMqq/VDHdWiGexnHC6Fggr/SXyUYILVljcYmBekG/x2NzjP+WEuyjAQljRyBb8QDjO4di0EB89iG2Ky7Fcu8OAVUWI+JYNn0A22CZcO0nkGnKYqNRzpnC0bAhnrtuCVOBBemL6JWT9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WLnkZsJwwsI8HcmRulCLgyxmuujzINu+NYJ+HPQolY4=;
 b=NxmpokM9B2SKVUw0LG0IOh+ecuwDTkaZwtLVzULh3J+k0k6uW4vjR1YDheoN3BL5SqxsPaVD4BJws1/eETVBmg3AQwLyzjY3I9zavIamtyZktZcw8P3ZxWn0dgeqXQDavDkTXHuQtuvAIdvyp3iNDBV83r+abnLr/xR4tFIR4mg=
Date: Mon, 22 Feb 2021 17:08:13 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, George Dunlap
	<george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>
Subject: Re: [PATCH v2 5/8] x86/gdbsx: convert "user" to "guest" accesses
Message-ID: <YDPW7TJh+IctgNIq@Air-de-Roger>
References: <b466a19e-e547-3c7c-e39b-1a4c848a053a@suse.com>
 <d1a1b9eb-33b4-4d07-9465-189699f88323@suse.com>
 <YDPOOpC6/wGZaAkA@Air-de-Roger>
 <aa96faaf-478a-bfb0-1def-e79efb399668@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aa96faaf-478a-bfb0-1def-e79efb399668@suse.com>
X-ClientProxiedBy: MR2P264CA0144.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:30::36) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7f40fe13-5d5d-4625-92eb-08d8d74c11a3
X-MS-TrafficTypeDiagnostic: DM5PR03MB2713:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR03MB27134E969C9633D77F79E9D88F819@DM5PR03MB2713.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cRIFX1o+7MxM58q9eRLMob5531B+jQc7q3Mbwhqtpchroysp7wbrmrpq6+1iMEr1t1znGoEGJvVJVFqQ9K51LG8LGVNn5A1dfanuI7aEJv++lmY4drG0eDnrHOSggY28KExkIQC74d0gVkZ+kd3Lw2VXC2WcjSNfa+QqyH9q/mIFPv1cJhrKWewwEaZB4SGxL4TB20RsRVU2LA/7aYDnemQBle3hnpS+5DMcgyuC+lEYKjbOcRnZhvlc5QEPXFf1VwCp8JAmCVGJmHQjlT6G4VzAuEqxg7HUkf9qteVwzlFynnLT2dcsQFIRbiyarxSSSjdqRXYACEqbP5IK4ck38SGZw40YoZUPfNYmkgFuHDDoT7/Yqu450wdho0THkKuAadH8ScY5oxdiZnZSVyAPOHb4w0jJzErah5kZSGe3bgpMZFJ1MGHJfGc4ilElr9XsDQ8NA5o4F8YNq/FT/5qTBQNUN9wRYCanhDEfg3kTHXfjEE/Lk6SzVt2P9a1fkjY1LUqBbJQJGz3TnJhqZpp5f5TuMtQXeP2K3YwAAb7Nz0Bi/xCL3B9kabW+AjaySSGI
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(39860400002)(376002)(366004)(396003)(136003)(346002)(6666004)(66556008)(86362001)(316002)(956004)(6496006)(8936002)(9686003)(5660300002)(478600001)(6486002)(2906002)(85182001)(53546011)(186003)(8676002)(26005)(66946007)(33716001)(54906003)(16526019)(6916009)(66476007)(4326008)(67856001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?SThpaVJ1ZWJlYWFQVU43RWpORUZBd1hhYVdEeUlSUUZXUGRXd2ZhWDBrN2xB?=
 =?utf-8?B?YzRJZU9EWEk5NFIvcTBsVkdRaFEvMVIycVJaSWg0YWpNY1NSWXE0bGlmREZl?=
 =?utf-8?B?bzFvQjd5MWxsejdBT0svVURQUVBaSnhrTkZIcVJOZ2xYQXo3d2xTZk9Zd3NH?=
 =?utf-8?B?RmRaVlVWZFhBVHVLcERWeThtb3lzSzV2OWRjLzZpL0ZjenhXSTlnUU9VSkhI?=
 =?utf-8?B?WVdqVDIrOVVqL1llZGZXaUQ1STFVTHlBWnhDR2hGUnNXVUMwcHZRNU5ONTkz?=
 =?utf-8?B?MXhOWDB1NTZsYkJ0UDBRN3poQ1pwVnAyZm9OZU9pc24weVhEa2NSTGF4czZ1?=
 =?utf-8?B?RDBrbTY4RHREaHV1VnkydExPNkhKa2Z3V01TbUp6NUpKY2c2ejJyYzdNNEp2?=
 =?utf-8?B?N2Vxblp4UFNqZXlwdXlpQWJXckhqVDRWbjFyYjlvRTdoOE5OeTh6SzRYbGha?=
 =?utf-8?B?bTluVzF3WnljbHFib1J5YW11b3kwbWZLc2N0ZzVnR1ZFNzZvcjd3Zzg1em9h?=
 =?utf-8?B?QkRob05uNGdtNnhjR1hYdkZEQSsvY0w0b0VrSkd3NXhZU2tWK0hwRmhrR3FS?=
 =?utf-8?B?ZGlrNWZzUXVTNWtHSS9Ra3FpbU5raFpaalp1TFRWbGpiNjdxQnhRdnJ3SXk5?=
 =?utf-8?B?VUVMU0gvQ3pNc091RjdFWDV6NlB3Y2Ewd1NQamlHQlVmTk0zTWNveTNYaEor?=
 =?utf-8?B?NjROL3MvMU4rdC9GM0lNT2daeGhZenN4Q1pnRGV2MDkzc2dadEQzRVBRTnZh?=
 =?utf-8?B?M1VnNmFZRnJoZm05aTgybDZhbFg0dkJtT2ZyMFlyMThadmdsL2VleENMcEl2?=
 =?utf-8?B?RjJsOUhFM0pDR0FNbmdkMEpVejFNYnlDbnNjYU8vZ1Q1eXQzSDB3NEwxb04y?=
 =?utf-8?B?a1I5Y1pxUG5qWFVGWmNrbjgwWmlLTHR0WWxxenRZUit5bWVOTGVVTTZSVjYv?=
 =?utf-8?B?bG9PNW12VCt4Rm1CTVhQMmZYV0QrRGJjOFN3UndVSVhvd0t5Mlh2ZGsrWFNr?=
 =?utf-8?B?TUsxamQvR3IwaG9FaE4zRUd2NG5pSmhUVDFWMHUvQ0d1WVhEZmxabEpzVXZ4?=
 =?utf-8?B?OFA4ZjY4R245QUxQRFN5VWRFMFh4VVRESVM1RThpYTkvdmVIT3F3NUs0b1VN?=
 =?utf-8?B?WHZzRkZXaEtXV2dyK1ZzMUVDQUFTV1BxSHMvQ0NuU0kreS9EVXdxOW8reEJY?=
 =?utf-8?B?KytyY2xRN1RzcVc3VUoybXhHZ2lYd1RINW1PZzNMd3NDQUp4SEZxWkIyMzVo?=
 =?utf-8?B?YTZOY2dvbFIvWDJ1T0ZjWVdObmpxZXdEVlhpUmdNN0JEcTR6UHdiK2xDNXBU?=
 =?utf-8?B?V0E5SExPc3BHM3NBby9rdzlZY2ZESzFEc1RTQVZORzJzQWxpbUkwd2wxTmQw?=
 =?utf-8?B?K2hWWWs5cE5MWnlNN2dGcm5Pdm1IZzNIWW84d1pJN0YwUHFxQXUrNURaR2RR?=
 =?utf-8?B?Zzhyek5SNEV5RlVqVmFWR09YaWkwQjYrRnpGbDBkZjNzMnVJZy90RDM2Ums1?=
 =?utf-8?B?a3UwN1gzdklUVTc2aEtGaGJiL0dJUnd4bS9RWUUwSHE4RUkzYldrT3VJMXhK?=
 =?utf-8?B?YmoyNk1DQUViME5nV3Y1TGFtaWFHQUJCRXJPYmJ2SmV6TDlyNWpOK0JOSkRw?=
 =?utf-8?B?Y1BPT0VVVG9EQjZnMGxLV1hFM0ROS1RockkvQVZ4b2Q4VGg2UkFQKzRVNG9w?=
 =?utf-8?B?K2wrTUExWjFVMzhwbUhhcXJ2VFRsWW5ZL1ljOWJFOUIrTURvMHV6ak12R3Zx?=
 =?utf-8?Q?gHHREc4hToY4ErEx5Jw21R6kk3Mj/ePIi2yLDVM?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f40fe13-5d5d-4625-92eb-08d8d74c11a3
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2021 16:08:18.8743
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uQz9U2uSN4oL39A7yuwgxT/MsUYNUjUwTV9Feu5BQ0cn+tkLoPN3QaoNX/I2pvKoqCMeIjWACXoN80xSXndnbA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB2713
X-OriginatorOrg: citrix.com

On Mon, Feb 22, 2021 at 04:55:03PM +0100, Jan Beulich wrote:
> On 22.02.2021 16:31, Roger Pau Monné wrote:
> > On Wed, Feb 17, 2021 at 09:21:36AM +0100, Jan Beulich wrote:
> >> Using copy_{from,to}_user(), this code was assuming to be called only by
> >> PV guests. Use copy_{from,to}_guest() instead, transforming the incoming
> >> structure field into a guest handle (the field should really have been
> >> one in the first place). Also do not transform the debuggee address into
> >> a pointer.
> >>
> >> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> > 
> > Acked-by: Roger Pau Monné <roger.pau@citrix.com>
> 
> Thanks.
> 
> > One minor comment below that can be taken care of when committing I
> > think.
> > 
> >> ---
> >> v2: Re-base (bug fix side effect was taken care of already).
> >>
> >> --- a/xen/arch/x86/debug.c
> >> +++ b/xen/arch/x86/debug.c
> >> @@ -108,12 +108,11 @@ dbg_pv_va2mfn(dbgva_t vaddr, struct doma
> >>  }
> >>  
> >>  /* Returns: number of bytes remaining to be copied */
> >> -static unsigned int dbg_rw_guest_mem(struct domain *dp, void * __user gaddr,
> >> -                                     void * __user buf, unsigned int len,
> >> -                                     bool toaddr, uint64_t pgd3)
> >> +static unsigned int dbg_rw_guest_mem(struct domain *dp, unsigned long addr,
> >> +                                     XEN_GUEST_HANDLE_PARAM(void) buf,
> >> +                                     unsigned int len, bool toaddr,
> >> +                                     uint64_t pgd3)
> >>  {
> >> -    unsigned long addr = (unsigned long)gaddr;
> >> -
> >>      while ( len > 0 )
> >>      {
> >>          char *va;
> >> @@ -134,20 +133,18 @@ static unsigned int dbg_rw_guest_mem(str
> >>  
> >>          if ( toaddr )
> >>          {
> >> -            copy_from_user(va, buf, pagecnt);    /* va = buf */
> >> +            copy_from_guest(va, buf, pagecnt);
> >>              paging_mark_dirty(dp, mfn);
> >>          }
> >>          else
> >> -        {
> >> -            copy_to_user(buf, va, pagecnt);    /* buf = va */
> >> -        }
> >> +            copy_to_guest(buf, va, pagecnt);
> >>  
> >>          unmap_domain_page(va);
> >>          if ( !gfn_eq(gfn, INVALID_GFN) )
> >>              put_gfn(dp, gfn_x(gfn));
> >>  
> >>          addr += pagecnt;
> >> -        buf += pagecnt;
> >> +        guest_handle_add_offset(buf, pagecnt);
> >>          len -= pagecnt;
> >>      }
> >>  
> >> @@ -161,7 +158,7 @@ static unsigned int dbg_rw_guest_mem(str
> >>   * pgd3: value of init_mm.pgd[3] in guest. see above.
> >>   * Returns: number of bytes remaining to be copied.
> >>   */
> >> -unsigned int dbg_rw_mem(void * __user addr, void * __user buf,
> >> +unsigned int dbg_rw_mem(unsigned long gva, XEN_GUEST_HANDLE_PARAM(void) buf,
> >>                          unsigned int len, domid_t domid, bool toaddr,
> >>                          uint64_t pgd3)
> > 
> > You change the prototype below to make pgd3 unsigned long, so you
> > should change the type here also? (and likely in dbg_rw_guest_mem?)
> 
> I'd rather undo the change to the prototype, or else further
> changes would be needed for consistency. I'll take it that
> you're fine either way, and hence your ack stands.

Yes, that's also fine as long as it's consistent.

Roger.

