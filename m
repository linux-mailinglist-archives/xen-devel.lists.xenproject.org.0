Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 99CFD398565
	for <lists+xen-devel@lfdr.de>; Wed,  2 Jun 2021 11:38:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.135902.252235 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1loNJG-0006KT-U4; Wed, 02 Jun 2021 09:37:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 135902.252235; Wed, 02 Jun 2021 09:37:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1loNJG-0006IO-Qe; Wed, 02 Jun 2021 09:37:10 +0000
Received: by outflank-mailman (input) for mailman id 135902;
 Wed, 02 Jun 2021 09:37:09 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=O3Rk=K4=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1loNJE-0006II-VO
 for xen-devel@lists.xenproject.org; Wed, 02 Jun 2021 09:37:09 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b7af7b89-20e5-48da-8bf1-fe6616d94a49;
 Wed, 02 Jun 2021 09:37:07 +0000 (UTC)
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
X-Inumbo-ID: b7af7b89-20e5-48da-8bf1-fe6616d94a49
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1622626627;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=jc7qec48AT40alXRPcYQF/ibNgxVXmfPDmJOq+EyVVo=;
  b=LdJIRzGZTWtuuTKnzIu+A4vIBs10yA8zrmObehIiv6E7kkzUZ4+xvhBI
   aZmrjb8uvbu8cYAVm6aquq+Ce1Jrme/XwUV+9Fpdo7MQYX0V133cEJS4v
   UxOncn2g1rB5rh0npkcrjb60I/uooeOYv5HTj5ioyR8FpdjW9XsAjC+Lh
   4=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: /2p7dl3hRiFHA+XGdnu33ak8vPNR+CCRGFgFeNgSQWGmjWS/J6jErDQPQZx5WuO32gdWhicz9e
 MbfyubnOeMv1OX8sMV56jGaM9Q7ShHz/dWKoH3PIVBsCKltXrFnvz1uSg7B5rrH5KsfdSy8+pZ
 fJsHBFJsNkvCdYAwOYiVHnGla0hCRG6FBdDyDyj8bnKpak0Gk9SEV4qdL2Mzfsfmy73+1L7DdA
 6nxBfhclmJTVTUz6S+r1rl7h2iVpTmFwtnW9gzS18nQmlY33lRQIIOHKHf+A5LktrNj4Gnzcfj
 N6E=
X-SBRS: 5.1
X-MesageID: 44875348
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:hnIum6gP+F1h7uMyqxW5XlM5O3BQX+N13DAbv31ZSRFFG/FwyP
 rBoB1L73DJYWgqNE3I+erhBEGBKUmsk6KdxbNhQItKPTOWwldASbsC0WKM+UyEJ8STzJ846U
 4kSdkDNDSSNykLsS+Z2njBLz9I+rDum8rE9ISurQYecegpUdAa0+4QMHfrLqQcfng+OXNWLu
 v62iIRzADQB0j/I/7LSUXsGIP41qv2fP2MW29JOzcXrC21yR+44r/zFBaVmj0EVSlU/Lsk+W
 /Z1yTk+6SKqZiAu1zh/l6Wy64TtMrqy9NFCsDJoNMSMC/QhgGhY5kkc6GevQoyvPqk5D8R4Z
 nxSi8bToFOAk7qDyWISUOH4Xim7N9u0Q6i9baguwqgnSSjLwhKTfao7OliA2jkA0lJhqA37E
 sE5RPBi3L7ZSmw1RgV3OK4Iy2CoHDE6kbKodRj+kC3brFuH4O5jbZvsX+9Q61wUB4T1ugcYa
 FT5ZbnlYlrmBWhHijkglU=
X-IronPort-AV: E=Sophos;i="5.83,241,1616472000"; 
   d="scan'208";a="44875348"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Mlin6qe6porkE5UdemfXPXC5ZGBowzCafT+QUZIVEgfTBh5r/el32KBfeOYa8xFjYMsM+W+etE9N6nsEph7Yc6xHoNSU0fGiuIRDEIZRpwBeleZlmduK8NCOVrK3o4vmaGg7VJon6TFd8ohqGCYG5oIbTtjvx4ExKqzI7Wzf6FAH0PIcnRgwOYktkKIZ78E8JSy8RxKGqXBb2bn4Z5oOzXtSgnUdZv0E5yvhPGWaAvIC/Tkib9KZMNEuimEwmotDdRQ51f8vPDLmcKavmNFqHmxiXPmh03SK6PCZeT391XiA5g74cYVCE5vXMgOQpXqxPQ6LLMC3zdF3GuPXn/DWjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pIQiLOdKv57R81Ktjktc4X+j3YRvkgqyEtOGYpMpneA=;
 b=VcREAnuKCFFVXPQneExNwmSG4USXFZv5baswR3sJsi4PqEqDhKOO7qn3YVuEbGKESsC+p/67ycfenz4OR6Ui6XC4ATWnxHC0J0FG7mVl6e46AVa/vevcZ0vPOpfJzIVuNu/i9Rt0zFVHZuDMsuJ9iYsBzxJGyNo+cxDOQmNKBdJvwlkcjI2YFBkyTW0XKSyHdlHR7QErTe6J/7jwWkaQf7UCW8oy4wd6NLDX7tXMAQt26q1b/rnlKed0LfwCU2a4gteaSA0q4vD2B22uFjpez7GYwSyy1PI55jzVD5k3jdDQ+sUxC6AUWQZLbqjLqgy8NdQ7f13P8CUKgx8w8U+ErA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pIQiLOdKv57R81Ktjktc4X+j3YRvkgqyEtOGYpMpneA=;
 b=rrELwaBbGtp9pwaE9ikjawezSmHp+DcQGLxjbLoS1dAqEcF52lBgFIbIe+/bg9DcGBDp05EN4v6KviRmr5EDx4Z6izQemmdMGt9apv5gHJ9qyLYPMl2TdyOAd15kEXblyIpdnL97PEOY2h6BrIKrJtwJMLbmsZoNCAf9VxCsewQ=
Date: Wed, 2 Jun 2021 11:36:58 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, "George
 Dunlap" <george.dunlap@citrix.com>, <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 3/3] x86/ept: force WB cache attributes for grant and
 foreign maps
Message-ID: <YLdROqDpiUY0eGUI@Air-de-Roger>
References: <20210528173935.29919-1-roger.pau@citrix.com>
 <20210528173935.29919-4-roger.pau@citrix.com>
 <c3aeb303-760b-fe6a-d51e-6271eaf37d80@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <c3aeb303-760b-fe6a-d51e-6271eaf37d80@suse.com>
X-ClientProxiedBy: AM4PR05CA0024.eurprd05.prod.outlook.com (2603:10a6:205::37)
 To DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bfeaf7a9-38b7-41e8-642b-08d925a9faa5
X-MS-TrafficTypeDiagnostic: DM4PR03MB6096:
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM4PR03MB6096EAADD674FF35CAC5DF5B8F3D9@DM4PR03MB6096.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KjQsLw5joIXr1LmrAYJbJqwUb0sJCKPgehDk3s2cRULnRTjoGUjwa5As3BNsAzS2zwwHbSkwyglAlmhcpS0RHI2NAAGP55dwJ+eX8m6h1pfR+z112IigRbu9mkXjkr7NYLMS2v+0tuLNDGQw3zQg6B+4RZRYxPt1je41gJCvxMathjDVv4NYbmP8zXnCS1VlGcbflxiP6x9gCbT7ss3a3co8gZsd8E4KDbEOk/HRHhCqnRPkn7tSAxxRa6KZPGOzao3vmS2SeoTQP2dzRNXj/NWH3JlLWezGCQaT04Uk7B1d8nPDp6PfTHmc0RaLf6z0Mk9Z40Q7+3TbDKH6l9k3qx86hABRh5dUnSRMPnbncHgOqTajsEj0T4ZKKIT9KNbIm+smUYXgOWURleQ1CFzm+8vCIQeWBz8pXeWOvVWK2Dmp5uDORaeUd67kF++qfbG1M1RGa1NzXvKZa6lyf/fc/Ipte/ZCETBvBrbhYUKuBIIapIlfw+PO+5T91yzYEViAbsgU7G6yERTEMzkJ9StsrgjONmaQ3q3X4aPM3XwQi2XvenG5M0qnk+8e7xUfmbpwLlxpRKlzF59pyljnSSCUwECk6VlgETL5WtNAh0ydO5k=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(39850400004)(136003)(366004)(346002)(396003)(376002)(83380400001)(53546011)(316002)(38100700002)(6666004)(956004)(6496006)(6916009)(5660300002)(186003)(4326008)(85182001)(26005)(16526019)(33716001)(9686003)(6486002)(54906003)(66556008)(66946007)(8676002)(2906002)(86362001)(8936002)(66476007)(478600001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?eXoxTzZrQlcyRFlJOUFCa0YrRHFMVFVkbmswRWhITk9KTk9kQ2JRUll0VmRm?=
 =?utf-8?B?MkxKbHF3OTVtWklrVzFTMmRKdTRyMExHQTBWRUEra3ZudURIb3J0LzFENUo0?=
 =?utf-8?B?K3Uvd1BxYlBRbmhWSGdGWGg1TXJUSk1VZ29wRXNtdVRHYWpjUC9kZjAxK1hW?=
 =?utf-8?B?bDN2T0tsMXUzdVY0WktRTmpOd3c3MlJ1OC8xTEJQamdleFRPcEgyQ2ZZeDdH?=
 =?utf-8?B?am56TXFnZHV5dmRTRTdEa1J1T0YrQ1RQbVZ1TTZWTGZlSXMyTnlBbURNcUdF?=
 =?utf-8?B?YzdNNVgxdEJJWUJwdTd1cS80QnpjVXFQNjhrbldMWVRuNmIreVlxN0l0MFN4?=
 =?utf-8?B?NUNyOG5xempCbkVHSlhaWjFDbTJvdFZ0UE9CM1AyTUg5Um5ZR0FsOCtWNmQ3?=
 =?utf-8?B?ZzFFY0FqcnlLcFAzVFoyZTd1MjdsU0RhbTdONUFjMkNGYys5NVQ0MDlsSk5D?=
 =?utf-8?B?dU15VnVUZ1V6RFVxQkl6ZU5rKzdJVk4xbHlIN293VjBCL0o2MnBNR0ordHpB?=
 =?utf-8?B?YjQ5OU4vVXF2Z2tTSTRQVG8zdDliRVhPNGFWc1RzTkRqV0d5TUZTMWtqektm?=
 =?utf-8?B?enFuMWRMYjZoVE1HVTJ2b2hqOU8ydnBsOTFlcjZwd3Z3WGxHeEE0LzQrdSsz?=
 =?utf-8?B?Y1RUN0xvZ0YxQlRsZDlVblNUYnNtN1h0eC9DOEVaQk05Z2ZXcVAzYkJXRmI5?=
 =?utf-8?B?THFsM2txQjNMTVVTeVBzbEl6bWRkUkZRQzFDbGlnN1NLS3p6d3lybzlWUlA5?=
 =?utf-8?B?N2xTaUdLTDRMalpzS0FTdWxCbmo0b29nWmgrT1dJRkQ4S01YWVptZXZpL0gy?=
 =?utf-8?B?citIaFVQSGdyaklobW55anE5Vk9NbTdUQVJxNFloaGJiYmx5TFkxUndVVnp3?=
 =?utf-8?B?YmtOd0dxSnJJeGZFTzBBNmhJUjVKZkJvSEVXdlkyQXNaYXdsNGtjWWt1RW5i?=
 =?utf-8?B?WlNNVEZyQi9lbWh6d1Bzc1RqWCtUdU1vVlc5TllEdW9QbU9peGxPSlBLTk5n?=
 =?utf-8?B?V2I2eXRnR1FBMDZWVEVvTnlxaG41ZzdPek1BRXkxaWFrYlZFRTNJL1ZNYzVO?=
 =?utf-8?B?WG01TEpyRi9vL08yZmJqRjIrbWtmRE56Mm80THNEOWJwMk5PaDlTbTVnRTJ2?=
 =?utf-8?B?WTFSckh2U3A0SENGRUQrRU1qT2NnV3hlbC84VThRNGhMeUlUZFQzaUwvUHo3?=
 =?utf-8?B?SGd5NTdMTGR5SE5hM2lHSEhMeHN1emFHcTFUMTFQUHloR3F6RXpuSUo3Ums5?=
 =?utf-8?B?QllJTmZnbVhiTkhhNnIzZGM2dm9yVmR1b0tFTjlOUHN0azRZWDdPV01yOWho?=
 =?utf-8?B?alhrSWk5ZG0zM3lMenJPZmZxekY1amRDOExwRmtVSjQzRXNHTXpWTmpLNnVx?=
 =?utf-8?B?M1Zhdkc1OFFsVkpLTVBMSGdraElucFdkUzJVQ0Z5WksvcXJvSGNCLzF2OVIz?=
 =?utf-8?B?NENKL09mZGVmYXpzbUlUT3g2NVhWMXMvMmlRbHI5U05XcGlxczlUS3l1QUlF?=
 =?utf-8?B?TlBaYXo4aFpVQVA3Q3N6VGRPVFZGQXYzTzdzUG5hdjZNMVh1SHpmcUxMSGJu?=
 =?utf-8?B?VmpnTWxDc3B4YWUrTkFOcWdWK0R2SFVmb0IxNWdwMlYzbXJ1QVJIL0pDWm0r?=
 =?utf-8?B?K09MMWxhaU1kSmM2eVlNb3JVd0pQNnpLdVhPaFZ1L1BmYlR0WDVxazRoZ0FU?=
 =?utf-8?B?dVhYbFR4dmJFbVdjTmZZUHowZ0VKQVlCRDRTSURIWUNRMStMU3YxMTZaeFFM?=
 =?utf-8?Q?yTXGXyRm58YRRmO0ljswTFzt7lPkwXfi+VvXcPv?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bfeaf7a9-38b7-41e8-642b-08d925a9faa5
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2021 09:37:03.5734
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bKeqN92JDtCrUABHM5HcCthce9rhYG0sVTa5hsjtKTzw0tlmrwEOUUK5y4koGMUUUAj7A7Gxa5FjKskK88JeEw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR03MB6096
X-OriginatorOrg: citrix.com

On Mon, May 31, 2021 at 09:21:25AM +0200, Jan Beulich wrote:
> On 28.05.2021 19:39, Roger Pau Monne wrote:
> > --- a/xen/arch/x86/mm/p2m-ept.c
> > +++ b/xen/arch/x86/mm/p2m-ept.c
> > @@ -487,11 +487,12 @@ static int ept_invalidate_emt_range(struct p2m_domain *p2m,
> >  }
> >  
> >  int epte_get_entry_emt(struct domain *d, gfn_t gfn, mfn_t mfn,
> > -                       unsigned int order, bool *ipat, bool direct_mmio)
> > +                       unsigned int order, bool *ipat, p2m_type_t type)
> >  {
> >      int gmtrr_mtype, hmtrr_mtype;
> >      struct vcpu *v = current;
> >      unsigned long i;
> > +    bool direct_mmio = type == p2m_mmio_direct;
> 
> I don't think this variable is worthwhile to retain/introduce:
> 
> > @@ -535,9 +536,33 @@ int epte_get_entry_emt(struct domain *d, gfn_t gfn, mfn_t mfn,
> >          }
> >      }
> >  
> > -    if ( direct_mmio )
> 
> With this gone, there's exactly one further use left. Preferably
> with this adjustment (which I'd be fine to make while committing, as
> long as you and/or the maintainers agree)
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

Thanks. That's fine, I was about to drop it but didn't want to introduce any
more changes than necessary.

> 
> > +    switch ( type )
> > +    {
> > +    case p2m_mmio_direct:
> >          return MTRR_TYPE_UNCACHABLE;
> 
> As a largely unrelated note: We really want to find a way to return
> WC here for e.g. the frame buffer of graphics cards, the more that
> hvm_get_mem_pinned_cacheattr() gets invoked only below from here
> (unlike at initial introduction of the function, where it was called
> ahead of the direct_mmio check, but still after the mfn_valid(), so
> the results were inconsistent anyway). Perhaps we should obtain the
> host MTRR setting for the page (or range) in question.
> 
> As to hvm_get_mem_pinned_cacheattr(), XEN_DOMCTL_pin_mem_cacheattr
> is documented to be intended to be used on RAM only anyway ...

I also think we should make epte_get_entry_emt available to all p2m
code so it can partially replace the logic in p2m_type_to_flags to
account for cache attributes. I don't think there's much point in
keeping such different methods for accounting for cache attributes. I
know AMD lacks an ignore PAT equivalent, but there's no reason why p2m
cache attributes calculation should be done differently for AMD and
Intel AFAICT.

Roger.

