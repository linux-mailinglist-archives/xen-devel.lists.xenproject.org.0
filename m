Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A9A23929A4
	for <lists+xen-devel@lfdr.de>; Thu, 27 May 2021 10:34:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.132896.247823 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lmBSb-0002rE-MJ; Thu, 27 May 2021 08:33:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 132896.247823; Thu, 27 May 2021 08:33:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lmBSb-0002p4-IU; Thu, 27 May 2021 08:33:45 +0000
Received: by outflank-mailman (input) for mailman id 132896;
 Thu, 27 May 2021 08:33:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ln4B=KW=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lmBSZ-0002oy-Ov
 for xen-devel@lists.xenproject.org; Thu, 27 May 2021 08:33:44 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 30217639-f2aa-4329-965c-c6a48bdb532c;
 Thu, 27 May 2021 08:33:41 +0000 (UTC)
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
X-Inumbo-ID: 30217639-f2aa-4329-965c-c6a48bdb532c
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1622104421;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=9cftIIrtFdADYAwrBJaBZ9mQzL/SewCn95MgE2Q5FUM=;
  b=EivGKUGuv4Jc5CYKFH4WLpMC8TfrGOCMXx2FPS+d9wmiHYS8r36ugXQP
   ZgkpwRQ1nBsRkQpOLdIdweeI8Kea/1+0rsrlE9n6Iv9TgafIR+LnfOsKB
   Y+Z1J/1HdlfvnupkVT4016ceKeQc1s5DoKiCN0KvD+F2C4pKlW4ZELzkt
   g=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: ZBXMOD9DanDRHEUsUOMQpKN4q0ZakTFJS2K+iiZEzR5seMVaQFgwbCg/UU/jTIhlExS0eSt6lw
 B2C4vHjxzt5QpkMv+7+PV3Qn2TfORVq07ngDJv3moZNvQczsTsV1hIlQ7nIMNWa2x63pZSt6FQ
 sbsHrIEqST2tjUsU1vpqydmOXXyiuFWIJI/7/87d+vMxI10dIk17iBDXlkWAGWMvf+uPN/iD16
 4B1CqDrS+6EpdJaldFccor+jUHASql6dg5C5pD4eS4WpGYz3s05nWV72E+XJvksXSvi3cpWsou
 +LQ=
X-SBRS: 5.1
X-MesageID: 44724844
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:WvpU+K/TJQBiEovjIoZuk+Hadb1zdoMgy1knxilNoENuHPBwxv
 rAoB1E73PJYVYqOE3Jmbi7Sc+9qFfnhONICOgqTM2ftWzd2VdAQ7sSiLcKrweQfxEWs9QtqZ
 uIEJIOeOEYb2IK9foSiTPQe71LrajlgcLY99s2jU0dNj2CA5sQnjuRYTzra3GeKjM2YqbQQ/
 Gnl7R6TnebCDgqhqvRPAhLY8Hz4/nw0L72ax8PABAqrCOUiymz1bL8Gx+Emj8DTjJm294ZgC
 j4uj28wp/mn+Cwyxfa2WOWxY9RgsHdxtxKA9HJotQJKw/rlh2jaO1aKvy/VQgO0aOSAWsR4Z
 zxS09KBbU215qRRBD6nfLV4Xii7N50gEWSjmNx6BDY0L/ErDFTMbsLuWsWSGqe16KM1OsMpp
 6j5Fjpw6a/Oymw1BgV1+K4Ii2CqXDE1kbKsdRjxUC3ArFuJYO4k+QkjQpo+cA7bV3HAcYcYb
 BTMP0=
X-IronPort-AV: E=Sophos;i="5.82,334,1613451600"; 
   d="scan'208";a="44724844"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BALIWWDTQ+ZlIKK28l85+CK4+s6kgnoGO3ZUTrRFyLrOgqpLbLZeSB+9KmXioCQ9MaOgpRqxs3OX3mNy8nIF3bUBZiBfMRBdU/dQuW9tFudAtgX0v2P/3J0rnyJ3/meIEF67nFwkWipIq5rAPWSRJQQyC/3cRif0Ts3udBtpwAG5VAxRxz5qL5LKEWYr4IGUBzzzjBXzPGp1EG0YoBqBuQKD96573sAvtmQGeNT1P7b4Bcx+kfcCfuPJgVga/pspwxIxhMhumM61F45ZJw3H15T0UKqyNUZsNDxadIr0902dYEQhePq24eQFf5w0gC9uG6ySgNY9OdX9PLc8Xlxydg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jHN9epAEuXEjx8aqD1gWoOXLpmP0sYTmOEO7deqJ1oA=;
 b=cHQuxQk7m8tXlXfNQLUo/haEVKol6RGnATV44r2koQMAvayjJRSgeAHin24tNhPiSaYma/0fWKYbilgxxhf3mYb8qeh8iMxdcabk4jtOwkDpMC0KkhSIZPmQEDIYVqZmtDVwPGKjfWL17uPpAHN4hmrMQbw7MKvu7UVl8eW9bGVdihqbCdFtgtBvTQuFcoFNbOjy/VrwG5c13r3QIlyoVwG5BoBEc4AOvHyh35CHvnJu8o0OMwxows3c994zCRoovPlzuDIHXSDoMyCUi7ekwLN6ko1aLUlcIuMBEoZ294NtauhCPkHcDFXzHWuR76qFkhaDQ1Wt9BE3pe6B2NjU9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jHN9epAEuXEjx8aqD1gWoOXLpmP0sYTmOEO7deqJ1oA=;
 b=HrQ1JCzinDvJdOCuvIP5cciV/KqIDSevjk9JY8d2FBmNjPNhXiGMsaWkdGNPrj5tQ4hJxaZlhyrJ0lQ0PRp9Vs8mZR3g2CFCximJaRZ9Hlz5P+AfOE5TqYUHIjbhqr1555O3Zm1sqryobZAb+W0MV+AzoMFMwJWCTqDHZ+zFa8I=
Date: Thu, 27 May 2021 10:33:32 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, Olaf Hering
	<olaf@aepfle.de>
Subject: Re: [PATCH] x86/AMD: expose SYSCFG, TOM, and TOM2 to Dom0
Message-ID: <YK9ZXJuPk1G5SGnK@Air-de-Roger>
References: <c5764274-1257-809e-a2a7-d87b9d0fe675@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <c5764274-1257-809e-a2a7-d87b9d0fe675@suse.com>
X-ClientProxiedBy: MR2P264CA0114.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:33::30) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e5abda23-578c-4de2-0cce-08d920ea1f5f
X-MS-TrafficTypeDiagnostic: DM6PR03MB5179:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB51791CFDE75D761B7C06834E8F239@DM6PR03MB5179.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wEee9m+L7x2GAHxeDNRRWibf5lJibVsSx/Otk9EJkgfm+KXv7Kaaqp/JAq8oG16V4oGbu9v9CMtEmbEJuBGXcqlz08pQHD74nPXy11O+7GAjwG+4C6uqdCF5/jVHtIK2tXOuND84sNFXod7de/0oIeFBXjejZFrq8/fv/7vzOMzF911E5XNA2xfkZhUkeq2nqqfYt97fuPOgITtEY1BZ5RJVTSFV2FdIAYpyn45Y21p89oGyEVgW2N/Rboo4TtMUPGMVs+T5Xgz5ntYLeE+mGOJyZ5dh/Egtpb20wm1pjBzFMrC23GM91tCCQGr1jd9/IWpBiN+VqVGc4QVx7qSrqjyT7Lv/41FPZZ59nOCXQdxXUa7WQfIKXS6mm2M3FXyG/ZkNI+sLiqGK4p5/R9QEVWkWA4ONJWSg3YpSLAIkg32icD8bu24k+CHWAWnL5GTnajp3F3tahv/ZqpC5zNFtbGbgEAQs28xeziDt1hIqVeDuk0eDZLNs8rI6P6WugMpLaswVJu+xduLgKwg9fKHyDMOW6WhegC7a22THp5KLDTonQw3eXkpVVIi22eSyIjM72G4pAN1/8vYv21jhL9Iu5w==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(136003)(39850400004)(396003)(376002)(366004)(346002)(6496006)(83380400001)(86362001)(5660300002)(8676002)(38100700002)(6916009)(54906003)(33716001)(16526019)(956004)(186003)(66556008)(6666004)(316002)(66476007)(66946007)(6486002)(8936002)(2906002)(478600001)(4326008)(85182001)(9686003)(26005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?MDA3cEJXeTJ4ZmFUODFkSjVTNXBFSy9TK2J1RFJyQ2duT0Y0NldFWWg3ZW42?=
 =?utf-8?B?SFRldWdyZytRbGwrbklheE1IdXBpcUkxalpueTd4TDYycFRCNGRhdnAvZnRt?=
 =?utf-8?B?eVAxRmNzSU12MVFZWUtES2ovZ0FkUHFDeXBjUzl2V0Q0Qi9NcjZEMmVoczVw?=
 =?utf-8?B?SGNwbi9iTXp4U1hPVzFKM0dBakpZTzB4c2xpbzRyNUpoQjFYWlBOb0RyR2J0?=
 =?utf-8?B?NmM1Z1N1NHR4ZGZvUXFrWXN3VUNDOXZhR3EvN0FJdFBZR0N3UVBxR3dBemV4?=
 =?utf-8?B?Z1VpVmoyclFCQU9YY05hVU0yd1hWbUt1Q3EwYnErZ2dNVEhrMFJwK3pacVAx?=
 =?utf-8?B?cDQzQmlUOVA5NHFkUXNCbGt6V2IxanZ4U0JxN0dUdWpCSjI0NkhRQ1lpNW9Q?=
 =?utf-8?B?c1Z5TnA3N3ZIRS9odlpNUjdxOUFWYXB3VXMzSlczZ29OUWRMY1hrWm1yclRY?=
 =?utf-8?B?eHFzbFZLenlKR0UzVDZEc2FydnlnTXlOUEsvMTlOUmZnaGlCZXR6UnJxZ0dp?=
 =?utf-8?B?TWJmV0dhQ1BIWSsweUFNM3F5UGtkVE1IMGxmc3VSMUJDT3ZRSWkySzBmR0FO?=
 =?utf-8?B?b1ZUWktTK2hmR2RjbWpSdmpleEd0bnJReTVYZXZ0LzlzSjg3ZTdhcng0SVpK?=
 =?utf-8?B?ZkJXc1JtTGc4ODdVVzF6Q0dGZGlMWVFnamlKaUxLOU52TTh2Zy9hV3hRUU8y?=
 =?utf-8?B?ck95RmZhdjlGbkNRb3dId0lEL1JZTlB2U1VMdFIzV2g4RC83WHM0eWhsYWNL?=
 =?utf-8?B?bEF4c0wrZlc2YW5oUlFiOGxCMUp1L2drdmR3ZXkyMmpRNi9nNGNkS0c3R0pO?=
 =?utf-8?B?RWVBWnZESjU2YjgyYkpzVk5oaVgzLzJYVEVxM0RWQ1Z6SHRKUzU5Z0RaR0pH?=
 =?utf-8?B?TE83NGdVcC9xQy9ob0dhVndrTnIyRHZxRTFWT3MzdUVGdEh6UFZzMVBzWGRk?=
 =?utf-8?B?cUtFbFhYNGFPL2pFZmh4OXV3dGZLclc5VVpMOWtCcUFQNEg2dTdXR0Y0eXRK?=
 =?utf-8?B?cGxGRW1melZKcWYxd0x2ZGEzY3AxeTZhRTNkY3FhWml6YklRaVdUMkRqTW5x?=
 =?utf-8?B?WXBORkZ5YkdVaHc4dC8zeGh6UWYwTGZVazRkNWM1b0piUlB4UWpxVy94NWpQ?=
 =?utf-8?B?ZjI3Vm05OTFGMkZkUlZiSjhQdDYxRllGcmZZNlFXcmhlSi90RjVzckJtTEwv?=
 =?utf-8?B?allEcFdGN3VETlBKRm9ub2pkNFcwL2FaQjlCbE82K1h1WExCbHRxSlNmU2pX?=
 =?utf-8?B?MFI1Wmgvekw1dkU1dXJLdlVVQUU0bjJTQ1dIdEJxUzc0T3Y0Ukdia1N6VlVG?=
 =?utf-8?B?QXdkbldSZXIraDlKSTZNZHVEMENQclM0Sy82dzhWMVZ2TVJVNkdmcDdHc0Fs?=
 =?utf-8?B?dkhsNkhxd2tYQi94amx0bmlySHh1ZkNtUjVHeUZiVjlRYm1wYXZKSkU4aWxT?=
 =?utf-8?B?enBwVDd5eTJLc0NndDFIbDJ5NFhONkt2V05pWVp4Z0E2bUlOSm9lMmd0dWM4?=
 =?utf-8?B?d1h4aHJsZVZBekpzZ1FFaGhwNWQ0TjdTekVDYndWandSc1hLbXlRbFhwSi9Y?=
 =?utf-8?B?OFpNeXk5amdSeWhIVlhRUXhjWVR4VWVYRURFUFloSlBMUW1IaXdhRENjQTdZ?=
 =?utf-8?B?WE9acWFmYjZDYXc0bVBjQXZ5azlxK25YN1NsQzZWOFBFb0ZRTTFMU0d2ZGJs?=
 =?utf-8?B?ZlRuQnlUV2VkRUdLVCtlcTlPZExldFE3blZxTHRvcG53UGN2MHAzM1IxUXdZ?=
 =?utf-8?Q?4t5TIpS0wrTJWQA2qpsyDE0drKPWpKPI6nWQvVp?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e5abda23-578c-4de2-0cce-08d920ea1f5f
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2021 08:33:37.1719
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5qPNMjvbGoz7mAv9/7yUGjY3ikNq/UOYFs0viHzkU+k0ar/lzuLsba84v8J5ZLKwEHJPwAl0duaOY1ATpp0icA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5179
X-OriginatorOrg: citrix.com

On Wed, May 26, 2021 at 02:59:00PM +0200, Jan Beulich wrote:
> Sufficiently old Linux (3.12-ish) accesses these MSRs in an unguarded
> manner. Furthermore these MSRs, at least on Fam11 and older CPUs, are
> also consulted by modern Linux, and their (bogus) built-in zapping of
> #GP faults from MSR accesses leads to it effectively reading zero
> instead of the intended values, which are relevant for PCI BAR placement
> (which ought to all live in MMIO-type space, not in DRAM-type one).
> 
> For SYSCFG, only certain bits get exposed. In fact, whether to expose
> MtrrVarDramEn is debatable: It controls use of not just TOM, but also
> the IORRs. Introduce (consistently named) constants for the bits we're
> interested in and use them in pre-existing code as well.

I think we should also allow access to the IORRs MSRs for coherency
(c001001{6,9}) for the hardware domain.

> As a welcome side effect, verbosity on/of debug builds gets (perhaps
> significantly) reduced.
> 
> Note that at least as far as those MSR accesses by Linux are concerned,
> there's no similar issue for DomU-s, as the accesses sit behind PCI
> device matching logic. The checked for devices would never be exposed to
> DomU-s in the first place. Nevertheless I think that at least for HVM we
> should return sensible values, not 0 (as svm_msr_read_intercept() does
> right now). The intended values may, however, need to be determined by
> hvmloader, and then get made known to Xen.

Could we maybe come up with a fixed memory layout that hvmloader had
to respect?

Ie: DRAM from 0 to 3G, MMIO from 3G to 4G, and then the remaining
DRAM from 4G in a contiguous single block?

hvmloader would have to place BARs that don't fit in the 3G-4G hole at
the end of DRAM (ie: after TOM2).

> 
> Fixes: 322ec7c89f66 ("x86/pv: disallow access to unknown MSRs")
> Reported-by: Olaf Hering <olaf@aepfle.de>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> --- a/xen/arch/x86/cpu/amd.c
> +++ b/xen/arch/x86/cpu/amd.c
> @@ -468,14 +468,14 @@ static void check_syscfg_dram_mod_en(voi
>  		return;
>  
>  	rdmsrl(MSR_K8_SYSCFG, syscfg);
> -	if (!(syscfg & K8_MTRRFIXRANGE_DRAM_MODIFY))
> +	if (!(syscfg & SYSCFG_MTRR_FIX_DRAM_MOD_EN))
>  		return;
>  
>  	if (!test_and_set_bool(printed))
>  		printk(KERN_ERR "MTRR: SYSCFG[MtrrFixDramModEn] not "
>  			"cleared by BIOS, clearing this bit\n");
>  
> -	syscfg &= ~K8_MTRRFIXRANGE_DRAM_MODIFY;
> +	syscfg &= ~SYSCFG_MTRR_FIX_DRAM_MOD_EN;
>  	wrmsrl(MSR_K8_SYSCFG, syscfg);
>  }
>  
> --- a/xen/arch/x86/cpu/mtrr/generic.c
> +++ b/xen/arch/x86/cpu/mtrr/generic.c
> @@ -224,7 +224,7 @@ static void __init print_mtrr_state(cons
>  		uint64_t syscfg, tom2;
>  
>  		rdmsrl(MSR_K8_SYSCFG, syscfg);
> -		if (syscfg & (1 << 21)) {
> +		if (syscfg & SYSCFG_MTRR_TOM2_EN) {
>  			rdmsrl(MSR_K8_TOP_MEM2, tom2);
>  			printk("%sTOM2: %012"PRIx64"%s\n", level, tom2,
>  			       syscfg & (1 << 22) ? " (WB)" : "");
> --- a/xen/arch/x86/msr.c
> +++ b/xen/arch/x86/msr.c
> @@ -339,6 +339,19 @@ int guest_rdmsr(struct vcpu *v, uint32_t
>          *val = msrs->tsc_aux;
>          break;
>  
> +    case MSR_K8_SYSCFG:
> +    case MSR_K8_TOP_MEM1:
> +    case MSR_K8_TOP_MEM2:
> +        if ( !(cp->x86_vendor & (X86_VENDOR_AMD | X86_VENDOR_HYGON)) )
> +            goto gp_fault;
> +        if ( !is_hardware_domain(d) )
> +            return X86EMUL_UNHANDLEABLE;

It might be clearer to also handle the !is_hardware_domain case here,
instead of deferring to svm_msr_read_intercept:

if ( is_hardware_domain(d) )
    rdmsrl(msr, *val);
else
    *val = 0;

...

> +        rdmsrl(msr, *val);
> +        if ( msr == MSR_K8_SYSCFG )
> +            *val &= (SYSCFG_TOM2_FORCE_WB | SYSCFG_MTRR_TOM2_EN |
> +                     SYSCFG_MTRR_VAR_DRAM_EN | SYSCFG_MTRR_FIX_DRAM_EN);
> +        break;
> +
>      case MSR_K8_HWCR:
>          if ( !(cp->x86_vendor & (X86_VENDOR_AMD | X86_VENDOR_HYGON)) )
>              goto gp_fault;
> --- a/xen/arch/x86/x86_64/mmconf-fam10h.c
> +++ b/xen/arch/x86/x86_64/mmconf-fam10h.c
> @@ -69,7 +69,7 @@ static void __init get_fam10h_pci_mmconf
>  	rdmsrl(address, val);
>  
>  	/* TOP_MEM2 is not enabled? */
> -	if (!(val & (1<<21))) {
> +	if (!(val & SYSCFG_MTRR_TOM2_EN)) {
>  		tom2 = 1ULL << 32;
>  	} else {
>  		/* TOP_MEM2 */
> --- a/xen/include/asm-x86/msr-index.h
> +++ b/xen/include/asm-x86/msr-index.h
> @@ -116,6 +116,13 @@
>  #define  PASID_PASID_MASK                   0x000fffff
>  #define  PASID_VALID                        (_AC(1, ULL) << 31)
>  
> +#define MSR_K8_SYSCFG                       0xc0010010
> +#define  SYSCFG_MTRR_FIX_DRAM_EN            (_AC(1, ULL) << 18)
> +#define  SYSCFG_MTRR_FIX_DRAM_MOD_EN        (_AC(1, ULL) << 19)
> +#define  SYSCFG_MTRR_VAR_DRAM_EN            (_AC(1, ULL) << 20)
> +#define  SYSCFG_MTRR_TOM2_EN                (_AC(1, ULL) << 21)
> +#define  SYSCFG_TOM2_FORCE_WB               (_AC(1, ULL) << 22)
> +
>  #define MSR_K8_VM_CR                        0xc0010114
>  #define  VM_CR_INIT_REDIRECTION             (_AC(1, ULL) <<  1)
>  #define  VM_CR_SVM_DISABLE                  (_AC(1, ULL) <<  4)
> @@ -279,10 +286,7 @@
>  #define MSR_K8_TOP_MEM1			0xc001001a
>  #define MSR_K7_CLK_CTL			0xc001001b
>  #define MSR_K8_TOP_MEM2			0xc001001d
> -#define MSR_K8_SYSCFG			0xc0010010
>  
> -#define K8_MTRRFIXRANGE_DRAM_ENABLE	0x00040000 /* MtrrFixDramEn bit    */
> -#define K8_MTRRFIXRANGE_DRAM_MODIFY	0x00080000 /* MtrrFixDramModEn bit */
>  #define K8_MTRR_RDMEM_WRMEM_MASK	0x18181818 /* Mask: RdMem|WrMem    */

That last one seem to be unused, I wonder if you could also drop it as
part of this cleanup?

Thanks, Roger.

