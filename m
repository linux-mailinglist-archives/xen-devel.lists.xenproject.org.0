Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EF92036FC92
	for <lists+xen-devel@lfdr.de>; Fri, 30 Apr 2021 16:38:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.120559.227996 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lcUHO-0001XU-I2; Fri, 30 Apr 2021 14:38:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 120559.227996; Fri, 30 Apr 2021 14:38:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lcUHO-0001X9-EX; Fri, 30 Apr 2021 14:38:06 +0000
Received: by outflank-mailman (input) for mailman id 120559;
 Fri, 30 Apr 2021 14:38:05 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jCGG=J3=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lcUHN-0001X4-L9
 for xen-devel@lists.xenproject.org; Fri, 30 Apr 2021 14:38:05 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0347e828-a7f7-490d-8f9c-1f519fc8c2f1;
 Fri, 30 Apr 2021 14:38:04 +0000 (UTC)
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
X-Inumbo-ID: 0347e828-a7f7-490d-8f9c-1f519fc8c2f1
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1619793484;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=HEc+3CPnJ1db/RT4hNaK9Yh9VtsKig7nB7ETyMinqXc=;
  b=GRoN0S/ZfLv6G+k4OZ77B3qvZwZz0b5SN6fTmIWexKsbbGjLGmc0+pm7
   c+/djDu/EQM30P5XeVR1N/fhS9TPcwZtiBFYDSn4bQPoT5FPKYMUIMZ/+
   GMb4RYklycG77oomjxNwsSIkiG/utSUUVf/BQQhwBq28SchNBNtOhvAYP
   s=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: R9gneq8lKNy0l7lNl0mh34aqSZzE9ySzc9OjuLeaDbxQPH2WOSFkTICwOIYk6hv5wUkFmfK6fJ
 QHeJBVB06WukVyFMKdJj5Jx9HdVOIdECoG7VrC/kfBLgfcDnT6YR7rGFbDQm/npun5scd0jnlE
 PM6wXzud6KNmBb1OQcQ8xWnLu9snehEnc0aFbO1ssQQWJSkO2z5tDjr903aK1AbUuUG5y+/4Px
 WvKwkYaP9jsIlwk8orhs9eEBa+6xUhQkMtROetUlaKHV6wz36MccVFFFt80BDwPNesIOakvSch
 ir4=
X-SBRS: 5.1
X-MesageID: 42803436
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:Eg2XSqlg35eD1lGuiy34J7lQ0CjpDfP2imdD5ilNYBxZY6Wkvu
 izgfUW0gL1gj4NWHcm3euNIrWEXGm0z/NIyKMWOqqvWxSjhXuwIOhZnO7f6hDDOwm7zO5S0q
 98b7NzYeebMXFWhdv3iTPWL/8O29+CmZrHuc7771NACT5ncLth6QARMHf4LmRTSBNdDZQ0UL
 qwj/AmmxOadX4abtu2CxA+NoCum/TxmI/7ehlDPhY76WC15g+A0qLwEBSTw34lIlBy6IolmF
 KlryXJop+Nntv+4R/a2m/V4f1t6aHc4+oGPuOgoIw4Lj3tjyyheYhuXaaT1QpF3d2H2RIRv/
 Tn5zsmIsRv+1PdF1vF3SfF6k3b/xsFr1/k1FOCjnPoraXCNU0HIvsEv611WF/9ySMbzbVB+Z
 MO5U21nd5rKCmFuyLH693BR3hR5zKJiEtnq8E/pThiS4cEAYUhyrA3zQduP7orOjn104wjGP
 kGNrCm2N9mNWmXaH3UpQBUsbqRd0V2Gh+HR34LsdCO3w5Xm2hkz1AZyNZ3pAZ4yK4A
X-IronPort-AV: E=Sophos;i="5.82,262,1613451600"; 
   d="scan'208";a="42803436"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=deYF4Eaf7INnwssLOGd4H/HU7w6kew0cERyr98QuzpKf8XrPCGaQ99SDaG4z5D0Ki/aF4aumrjedaxRBx2VOcdNZDJnfh3wVwYmW+/eeiwVfW5tXhaE543BH49K4MfGCDhHa+jrhyjehFXDLt/ZbxOmEJyQjyunpGgvPm5crzH9Mj5ab4OyKZGm7bBRHLk5ppThnE5Y6rVGOxY/8qSDxAaLDIwjaSRUz3n059jfAJ1JV7reyks4UZ1Lxl9PMukZbChaaGjkyEMLmxOWatxAuKBA78/9mWUr4AfKN5IKYjJ0eWkbT9yFyejTjmoWo/i/7+apxFFUQhAutN89DO6twXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hPP+gb/1JdksoVtDSzODY1lG/SGpk1N4fr0iVoKhuTo=;
 b=EkbuKv5ZKhA0eQ3nhYyzknWcoCzqH3hf5MqDYA0ut3J05/Z0GnpSroVOq2b5ghjOyOMbr2ukcWXmv7wPG0NcFV3TDkMUjmujnAp6r101On1FYIdoggtUmF7WzxY2qaOo2dR+V7s85yOIqbZzkFFQIDjiCHS5menBoSHr1JaOyhJ8+2UaIVzWKQCZ+1Z6BUfZled1pkC63trRMlRe2d8Q71zv4lQCYPJ+6aIsXXNACDuZ0BvTj+K99DGxo0QgKoxnFW8ejEKUSzglggY+zz66NKaHB6ZgNNPL/K7nUJPzuM4Rwzv56Gid7wMmeN977R2ArhzcoiqsbB4pcvSD48DKsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hPP+gb/1JdksoVtDSzODY1lG/SGpk1N4fr0iVoKhuTo=;
 b=TiwIP6QkdAAKUi2tIr0Jmszukf0dzI7bEA+ZLzGP0OCdf++c1W7JwyY3EfKsHiR3HdvenXUbt/+4dfn6Pehe7kbdil/wgmwoSYkfMuY9DN/qPMPjQoTp9vpC8P/Rlc8koX0NwPyPyutY0PZpYm/pRrOAxtElEP46ztyJgf5L7YE=
Date: Fri, 30 Apr 2021 16:37:54 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Daniel de Graaf
	<dgdegra@tycho.nsa.gov>, Paul Durrant <paul@xen.org>, Tamas K Lengyel
	<tamas@tklengyel.com>, Petre Pircalabu <ppircalabu@bitdefender.com>,
	Alexandru Isaila <aisaila@bitdefender.com>
Subject: Re: [PATCH v2 09/12] x86: make mem-paging configuarable and default
 it to off for being unsupported
Message-ID: <YIwWQnNDLFXDMYoJ@Air-de-Roger>
References: <3cf73378-b9d6-0eca-12b6-0f628518bebf@suse.com>
 <26dae9ef-5fcb-f806-059d-7cdd2974ad40@suse.com>
 <YIvUJqtdsOLia8nc@Air-de-Roger>
 <143b84c7-84dd-6b36-997e-a38718651723@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <143b84c7-84dd-6b36-997e-a38718651723@suse.com>
X-ClientProxiedBy: MR2P264CA0066.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:31::30) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fb4740d7-19d2-4278-ba62-08d90be58d95
X-MS-TrafficTypeDiagnostic: DM6PR03MB4476:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB4476447B15DD306168CB4A868F5E9@DM6PR03MB4476.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4tnCz0JbFVEx8kA9EmVFBcBrS7cr6Uq/Kszjyj5CFv1+laDkQCkttXWn85UReqmaawR49dr/Vp8DLV3uRJNxSEVMOs6Ij5oHTyARBc+r8YJZtOYgVu6VGy1anBhrxSFtyQa6Z/uvUFs5re5DrTo/C7URisqhU5rJw1Bxrrzn3md+fFTY0GtkbBX37UxKjNpcKUHYhK7or0JH16ZkChb3h2p3IUR1a5Rv3visXq23DtuW6TMGA6PLY3feb5LMxypgRavaOsZuTeFTbGUzZm8AWwAX/s6umhcXfzR+VndJtCnDx0JyP3xdqLm7neSO+Cfy8t5/BUtidwMrdQobs6AyVArP38KQ9oQwt6B9qWzxub4nCgcgYH38+t7/wW8QIr66JNFZq+DumGIxxiLrX+ILU2ycYlcBJ24IZSO6C1S/lSH1FkJ1b6sqdFGVBSlmm6crT8AH58ckvnakDt9Jbxv93lvf8Wmx2qfnf7GQN3u21WE38gSbrrAJZh9YdauFY1rALE4eBbig2l+0KfL6Wf32KT4P1HHO4iMg7nd4AezUflsPtCoP3/uC9MpV2qP8YZJIEvnaeRRj6hObc/oluwuiXtTx3yXlSREbwZ/ns3n6dDA=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(376002)(39860400002)(366004)(346002)(136003)(396003)(38100700002)(9686003)(53546011)(66476007)(86362001)(66556008)(66946007)(316002)(83380400001)(6486002)(6666004)(478600001)(7416002)(8676002)(54906003)(4326008)(6916009)(26005)(16526019)(33716001)(85182001)(5660300002)(956004)(6496006)(2906002)(186003)(8936002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?SnBFakFpSDAvUm5TajRPZmdYOGdEcFNuVi9VTjRkMUVwcWdBRlpBSlhGcnE1?=
 =?utf-8?B?QWJVNUFCcndubjMwL0pJSWxKTi9NWlpYVFJaaktqeFNERTFLQ3pBMGlKUk9V?=
 =?utf-8?B?YnlrZnZjYy80ZEM0UThHWXd1a1l4ckN4VnJDaVlLMmZpTHhsbGJGQmMxVE9V?=
 =?utf-8?B?cjZWWUhVTFhZejlRU2srWW5ibWxaeGVEUWtISHNDT25TRmFyb3hTNzd1cG80?=
 =?utf-8?B?aVFCV3Jsb0VhUm54dkdjbFhUR0ZNNDk0TUNTanFVamlrTTdmNEtJRDJDMHNZ?=
 =?utf-8?B?enFwUTVlNTVjN3dVRHBOaWpTRkdiclI2VXoxekNRMHRYZCt0VUtNZHBXOUJO?=
 =?utf-8?B?aXVRdzM4eTRSOXoxT2pabW95bUdSQWRlSVRqYXBHY2M1TUlLZGwvWVh2ZTJG?=
 =?utf-8?B?dFY4UFFadzMzUWZYdkIrMi9Vd0JmTzRIcFltS1BlZ0sxZmNmSVF2c3I0TVNS?=
 =?utf-8?B?cHlkclVVYlVWa1hwU1dDRGlla1ZSRlhwbEo5YjZWSC85SkdPMklQc3BJWXVM?=
 =?utf-8?B?dzdGaVBMNW5BbTVlaXl4TjEzZnVDWG5YV3owN0F3S1dFbDZrSVFMNE1pdTdU?=
 =?utf-8?B?UWtqQ2FEQndMYWRnSXVMOERvZVQvSXVUNi9WSmIyZnh4VWdlVzB4L21EUlZL?=
 =?utf-8?B?dksvVjJMMUJ0Y2ZkN0I1RDlrdUhXd0lVa1dHcDhEQ2IwUERIdWFlSGF6MFJy?=
 =?utf-8?B?bmF2Z3plN2FyZk9CeFRPa1VrQ2M0ZkhBS01yRUlHMHhJb25kY21SckRGcG1h?=
 =?utf-8?B?MFphaFhueXRnT0RDS1JHQ1RyL1AyWnh4ZTRqS0J6REZiU0hsR0V3WnQ4RHV3?=
 =?utf-8?B?Vlc2M0k5ZzVmc09ybEpDRXBaZWdiekxoTlVlTURET2htNGxZSTkwQ3UvRFZJ?=
 =?utf-8?B?RUNFYW9kcW5Pa3hPbWNKREd3eXlQcHg4eTArZW5LNTRxR1grQlh5MFkydlEr?=
 =?utf-8?B?aHE4QW0rZWdXb1dSNXNvajlzNEsxbm03WmJRT204ZXd5ckplLzNKNVIwR3lH?=
 =?utf-8?B?aFlIeXllckNRR3ArNS9pWlpJdzlsYzZnU0J1dlV4YUJwckF4V1ExcCs0OHdy?=
 =?utf-8?B?QVBsTlJwS2E2ak51eWFzZi9Cano2NC9BcUMyOHRXcTBLTnZIYzBSTG1NN1Fn?=
 =?utf-8?B?MUcraGpHbzI0U00vaGEvTS9HTnpaaUpkM1p3MTE1Z3dsSjVXdXRTbUhuMFF2?=
 =?utf-8?B?Q05GbDNMK3BpMzVXMmpaUU1qS1J3ZTB6S2hvMHE3N0IySERNL1hIcWFvTzB6?=
 =?utf-8?B?Z3lCVlJ5WkRDbm1RaUVUV1B6bVV1NWZ2VWpPY0NmalEvdzM2WkpKNmJuSFVC?=
 =?utf-8?B?ZURoSWdrWU1zVGZ4WXZvL09GT2V0N1ZuckJubVdZNnBlRDBCTVFmUG9ZOVZi?=
 =?utf-8?B?dnZLc2p5L3p3cTl5dlVjZ281SWV0V1I5UHBuNEdjTTVBb1IyNUxwQ0dHSmtU?=
 =?utf-8?B?aVlwMlU2dFhaN005K01sZWUvdHcvS3BFRDBFNVJFSDZsbGNGZWFPRE9DdmNk?=
 =?utf-8?B?T2tHZjdqc2dXOW1wc2xlUktWS0ZBSzFjRjN4SmZrRVQ0cjA4ckh1ckpCc1FO?=
 =?utf-8?B?TCtHN0dwNFRjYjE2ZHNDbVVSQzhFbklkVnBraVhoa1dEdjNKSklIRm5haXRX?=
 =?utf-8?B?dEJVSHc0dEp5a09xRjloblIyUmdKclV2clF3Ty9URWxvUUFQVy9yUEgveGZF?=
 =?utf-8?B?eSs3NXk1U2c5a1hyTmJpczQxZnNOTk9ZMklEQmwvWHU1c01ITGhvL1VvWFl0?=
 =?utf-8?Q?b+s1+xya2/3XcagfnvEhO/0qizV2iZi5koio7bd?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fb4740d7-19d2-4278-ba62-08d90be58d95
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2021 14:38:00.3319
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +xIH/qs9SeLZBmT9AA9CJXtH0osl25k/gmmVTjjb3Cbkf8VJ7BpPhDIu6KMSs6Y3vNiNRWBuDRWNb07nXbiLvg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4476
X-OriginatorOrg: citrix.com

On Fri, Apr 30, 2021 at 04:16:24PM +0200, Jan Beulich wrote:
> On 30.04.2021 11:55, Roger Pau Monné wrote:
> > On Mon, Apr 12, 2021 at 04:12:41PM +0200, Jan Beulich wrote:
> >> --- a/xen/arch/x86/x86_64/compat/mm.c
> >> +++ b/xen/arch/x86/x86_64/compat/mm.c
> >> @@ -155,8 +155,10 @@ int compat_arch_memory_op(unsigned long
> >>      case XENMEM_get_sharing_shared_pages:
> >>          return mem_sharing_get_nr_shared_mfns();
> >>  
> >> +#ifdef CONFIG_MEM_PAGING
> >>      case XENMEM_paging_op:
> >>          return mem_paging_memop(guest_handle_cast(arg, xen_mem_paging_op_t));
> >> +#endif
> >>  
> >>  #ifdef CONFIG_MEM_SHARING
> >>      case XENMEM_sharing_op:
> >> --- a/xen/arch/x86/x86_64/mm.c
> >> +++ b/xen/arch/x86/x86_64/mm.c
> >> @@ -994,8 +994,10 @@ long subarch_memory_op(unsigned long cmd
> >>      case XENMEM_get_sharing_shared_pages:
> >>          return mem_sharing_get_nr_shared_mfns();
> >>  
> >> +#ifdef CONFIG_MEM_PAGING
> >>      case XENMEM_paging_op:
> >>          return mem_paging_memop(guest_handle_cast(arg, xen_mem_paging_op_t));
> >> +#endif
> > 
> > I would create a dummy handler when !CONFIG_MEM_PAGING in
> > asm-x86/mem_paging.h.
> 
> I was simply following the neighboring mem-sharing approach,
> which you've stripped here, but which is still visible in the
> xen/arch/x86/x86_64/compat/mm.c change above. I think the two
> are helpful to be similar in such aspects.
> 
> >> --- a/xen/include/asm-x86/p2m.h
> >> +++ b/xen/include/asm-x86/p2m.h
> >> @@ -136,11 +136,16 @@ typedef unsigned int p2m_query_t;
> >>  #define P2M_PAGEABLE_TYPES (p2m_to_mask(p2m_ram_rw) \
> >>                              | p2m_to_mask(p2m_ram_logdirty) )
> >>  
> >> +#ifdef CONFIG_MEM_PAGING
> >>  #define P2M_PAGING_TYPES (p2m_to_mask(p2m_ram_paging_out)        \
> >>                            | p2m_to_mask(p2m_ram_paged)           \
> >>                            | p2m_to_mask(p2m_ram_paging_in))
> >>  
> >>  #define P2M_PAGED_TYPES (p2m_to_mask(p2m_ram_paged))
> >> +#else
> >> +#define P2M_PAGING_TYPES 0
> >> +#define P2M_PAGED_TYPES 0
> >> +#endif
> > 
> > Since you don't guard the p2m related paged types in p2m_type_t is it
> > worth having diverging P2M_{PAGING/PAGED}_TYPES?
> > 
> > I guess it might be required in order to force the compiler to DCE
> > without having to add yet more CONFIG_MEM_PAGING guards?
> 
> Indeed, this is the reason.
> 
> > I don't really have a strong opinion on whether the code should be
> > removed, IMO it's best to start by making it off by default at build
> > time and remove it in a later release?
> 
> Matches my way of thinking. I also wouldn't want to be the one to
> delete code completely out of the blue.

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks.

