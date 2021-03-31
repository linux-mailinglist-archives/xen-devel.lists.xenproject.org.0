Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ECE5D3501AF
	for <lists+xen-devel@lfdr.de>; Wed, 31 Mar 2021 15:50:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.103939.198254 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRbEd-00070w-Tz; Wed, 31 Mar 2021 13:50:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 103939.198254; Wed, 31 Mar 2021 13:50:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRbEd-00070X-QY; Wed, 31 Mar 2021 13:50:15 +0000
Received: by outflank-mailman (input) for mailman id 103939;
 Wed, 31 Mar 2021 13:50:13 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9hby=I5=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lRbEb-00070O-HL
 for xen-devel@lists.xenproject.org; Wed, 31 Mar 2021 13:50:13 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7e49a467-769a-4560-aa83-6a63cde9f177;
 Wed, 31 Mar 2021 13:50:12 +0000 (UTC)
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
X-Inumbo-ID: 7e49a467-769a-4560-aa83-6a63cde9f177
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1617198612;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=GBcDTyXDl6vJWzMqs1SDGZ5+h/l8kz0WByxPdxVwATk=;
  b=ZyMIker8qQSsFTeYpY2Lj70Emnh6SuxDPoI625HHws8le8AVzV18T2/k
   fCgsN2GsfLJgfNz2iWeZZeol94Vw01NbRuaA8H9B5LB4AKnjh5ZHUx7yu
   xLPGMkVzY2G6qfbVFlUvzSib539RGZOtPVS16x004aR7hHkIBH6Cl5j5p
   s=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: HV0IjXBGr/d1OLwwNRvmVtYVAonN8FeR14k85zfUCxCzq21TNtMQI99ucU7jlaR9n8Y7xPv4lL
 BMOL0f8cKKytzYTwY0SVkRZds18X0G4xDrsWVAgyGZSGj0h8vdXlU/E8mhBNXqMu9HlPql1VZl
 pdRP35C/POtgZOTyx/hmZ+F8ayCh+ZybfKzsYsg9p+QSUex8Jtt4G3Q13H6rtpYBAtM5/pONia
 66YHnSj8IyDZsCLb8EmcH46JlleGU3mPNw7RuJyc3d/v5W9FzlJLYBwcTUpkn4wqiD/y/ZAvf8
 +i4=
X-SBRS: 5.2
X-MesageID: 40937233
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:nMx2A6rV4+VADvpk0XoSEWQaV5vYL9V00zAX/kB9WHVpW+SFis
 Gjm+ka3xfoiDAXHEotg8yEJbPoex7h3LR+iLNwAZ6JWg76tGy0aLxz9IeK+UyHJwTS1M54kZ
 1hfa93FcHqATFB5/rSzQGkH78br+Wv37uvgY7loUtFbQYvUK146hc8NwDzKDwVeCBjJb4UUK
 WR/dBGoT3IQwVxUu2eCmMeV+bO4/3n/aiWAiIuPBIs5AmQgT7A0teTfySw5RsQXyhCxr0v6w
 H+4mnEz56uru2hzVvk33LThq48pPLa1tBBCMaQ4/JlTgnEtwDAXuVccozHhh8ZiqWF6FEmkN
 7Dyi1QQPhb2jfqUUye5Tfo0wnk+j4y53Hl0k/wuwqcneXJAAgUJuAEqYVFcgbIy0dIhqAM7I
 t7m1i3mrASLRTckD/z79LFPisa5nackD4ZvsM4y1l8OLFuEYN5nMgk025+VKokJmbc7rsqFe
 F/Zfusmcp+QBehQF3y+lV0zMfEZAVKIj62BnIsl+ayyDZskHVw3yIjtbAit0ZFzp47RpVejt
 60SZhApfVLRs8SW6p3GP0Md8uxEnDMWhLBKgupUC7aKJ0=
X-IronPort-AV: E=Sophos;i="5.81,293,1610427600"; 
   d="scan'208";a="40937233"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b7UVQxYi4YlDsDZB+JsLdUBY4byFQZiqavQdqf8UTpBy446TP6FtjROUmHP0z19nWEYhqQ9MpnMVxG6NRK3/Y7pYd+2whTVjk75hTDsBvwXsmKlGXcR7ln3AgLuooy0J7u35r3UYpHFuZABeMyMRTh7BXnXZ/mlNz3eci+2F1jl7DHvuL5UnTtPTDtqWRTsUoN6a6fuhehcBfxdLkaclpkh2yVAMvRlZ9CJCYQVziZ7+z5/oWAJbJoie1lsZPXdnSPwItrEwUn8zO7f3VY01KP++1rF6fhVQwD0RKsaXZOWsT7samHR/53yyoCib6WKMFT33jhFxBxGePrXMnhEVpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FZNS2mJd/FbJHrnS83x1Zr1zbQob3rCmLpZKA1B+rEw=;
 b=OYzqh5l9sRs9XoIHnw+vFpJJqHXuGhl70Fd13uSx9CUuKr803Ks8ucvGqtrvEX9KkZxcf9F77qo63lJuOGB2mX9a/zOz5DwM3SM6sBcmE0neXXdVMNGVceVTChLIk1n4MxzP+gHrxp6Fyp8eqU1VO+En3wawuO+n5PrfOSAIBZjpTE0c9/tMs+C7t6x2UtFb4vYHIFLciT1csIvQkHctdVvoqis6Ms0T2d12cxC/8KJ1FkMa7J1xHkdmvqrO1F/kmqcB8nftRRkMDTxpyvMKLqHj1WO+SiN3dcC/HpuLJ8mCEbjMZphyLhDVhkO0tmtb+AtIdAX5JOVQR5jLQnhFig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FZNS2mJd/FbJHrnS83x1Zr1zbQob3rCmLpZKA1B+rEw=;
 b=jmVyXCsosN5BdnBdm2YPVI+Fe3KOVLgW2+9HeCyNe1a0rWatSwzPFUaUCwGDvyuj+KInWfOoABftPjlhKwDoLzsnglTjXkKiOzf0pkwDa/UT0T6H1BNiLfSdxD98OI6CT0RPfEt9Q01FEcVW5/23dREYaTKoNnoIbpOqgIKyH6E=
Date: Wed, 31 Mar 2021 15:49:46 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich
	<JBeulich@suse.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH] x86/hvm: Fix double free from vlapic_init() early error
 path
Message-ID: <YGR9+is03vAZgtd0@Air-de-Roger>
References: <20210331133125.7072-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210331133125.7072-1-andrew.cooper3@citrix.com>
X-ClientProxiedBy: AM5PR0101CA0012.eurprd01.prod.exchangelabs.com
 (2603:10a6:206:16::25) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1e5ec91b-6c22-4469-1372-08d8f44bdc57
X-MS-TrafficTypeDiagnostic: DM6PR03MB4844:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB484410F83A769DD43F9A953D8F7C9@DM6PR03MB4844.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1002;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: N5zvz9ECeOa1RgslGhDsGGi8EfT3mqdvjm6n8FMQQrzIt8QlswCmbvFX2RoFSebpLYzpPzLjdOBFBJ8fKtVNtzojUzF8nKUhITBN33gjvD0K0j+0Zlir4EoYeFJhukDeq7N078nfvmeaQqU9BCSqx7PQQnNfNAGr+UH03eB+hNYSB5QR7SWEQCX0GrPYXj4W0c+m99xqXEnjePDjoIHvH1ujMnHC4IdITbAY1vFoZ23GF4ta+eiONiUAVZmuUfkK57B58cwmRr3KI6Hio8XjDOfnIL1V/ynay/T49lHL+Ya/M0Tz/8CIFl/KvoALop19d93T0XZKtmP02o7I1zIcgP9olTuObOuFOq4Vdsmxi7eGgFMXtH4XRbaHpKVWZ/Vrf6C3S1o3HTih2tf8vijxuUDZO4aTENw7sXtMISTx9BOVL+gMpkf0sVHtfAFJuke30E3i96uv5rfe8E1qFLpxKwRa6IHMB5PIOP8QMAiqU8Mbh3Ttx1hyYk28IvXGeDN6quDvH2Nd9LNI0St7gJ+QiDHILfbxuQ10CZqgJaufO3lVz360tyAAeA+OjAJWiqZuQK511XudRNVEZIzjy+9mBN/sE0rFC9MF1ZauYji/UgCxcCngZTxcYLNBygi87pQAoaFEp9uIL5Y7rGdB603md1G2lmjZJve3RxT797QAcKlvSHBtKjFH6C3bnT8N+DjM
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(366004)(346002)(396003)(376002)(136003)(39860400002)(66476007)(478600001)(66946007)(83380400001)(16526019)(186003)(956004)(6636002)(6666004)(9686003)(85182001)(316002)(54906003)(6496006)(66556008)(6486002)(4326008)(8936002)(8676002)(5660300002)(6862004)(38100700001)(2906002)(33716001)(26005)(86362001)(67856001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?Z1FXUk94dW1uSGMrQkh3Y3h5Umh4akYrZzNXU3A5MUNqSW04b2tjaElSc2FW?=
 =?utf-8?B?QXdZRXVQZnBCbUIycmpLWWhWaXdsMEdLTG5odjA2NExPOEhycFc2VzhsVUM1?=
 =?utf-8?B?bGdJNHVqTUxOOFB4Z2NHYnFFRXVkSGs0UFNTWXNtdFE0YThzSkZNNDJDay9W?=
 =?utf-8?B?eGJhSFRFWSt2M084Yk1qTSs4RGlxMnVkeWhVNnYveEY4NXpMb3lRV0FnQTNB?=
 =?utf-8?B?eHd3VWkvcFQrcGJsOUpPRXVCL2RjWUNkUGpvNzhkamJvaU11N1FaTEF3akhT?=
 =?utf-8?B?T1ZLcXFUMVpCd0MvZ1VnTll2QzBLK25Hb2t4M2duZE03Q2UzcXhQbVNGUmd1?=
 =?utf-8?B?aFNrR1ZSanBqNTVOdkpSdVFzVlRyK0VwOEtSOGI0bHpUMSttdWhLZ2w5aFZU?=
 =?utf-8?B?bXRqa2VFVGdsbWxmZDZ5YUxZMDYvRVJMU3hqNTRhMlB6TTdCcm94WnhlUlhM?=
 =?utf-8?B?THpBcVN0Y1hIRmZPU2ZlNUhURGVRczhIQ0FDNXhLVlJHVEVSOXVyVDRJUGpn?=
 =?utf-8?B?ZXg2S3lodDJZU0dldUI5YmZEcmtKenZGdWtSc0dSNE9FQXAxZU1tdzVOUDJB?=
 =?utf-8?B?WERhZVdrekV2RDlBNndlU013dm5iYzh4bzVHVFptL1FCcU9iL3ZaZjl0Z04v?=
 =?utf-8?B?c0x5VWxhVnBWelk5NnpyQXVQY1pQZGZZM3B1dTV1SzNqUHlidTArV0FWSkx4?=
 =?utf-8?B?eTRHZlBPcDdob1lWUlZWK2F5RzIwRGlXWUdSMm9aL1NIYTJVMWRROHJaaXVH?=
 =?utf-8?B?V2swZ2VkV281ZkdZQy8yYjFJL1gyNHkrM0dPYXBwQ1lqNERpaEdnNFhLU0xK?=
 =?utf-8?B?RlVyeStBdmpSOXc3YmxhbEdZUTdyUVNjRE1iaWlUd21xUnVObmtKakpHNk5F?=
 =?utf-8?B?SEhRdmlxUEJSbURuejgwb3VSaUdUYjFsb20xUXNPR29HeDFudWY0clJxeENU?=
 =?utf-8?B?S3F2M2VJTkNyNk5hd28vVFJta1VOODBQWG5ZWlNOTmJWaHRoRkRRUXVQOEdS?=
 =?utf-8?B?aU5wQlpKVFBzS3dyZm03VVhjYnJWRlJhUHJROTdPamprM1RCVkI4ODNpZnVt?=
 =?utf-8?B?SUppUlpMenpVQ213TlA5QWUxaS80ajVPZUcvTU40WW9md01qcjYxVXg3UGxU?=
 =?utf-8?B?QXZHQUlOcXQzTU1RYy9QNXpCQ0FtdWxOSjY2VjNrRU41Qk10QkZvY3V2UlZO?=
 =?utf-8?B?RXlGUjlpV3VYbFdtbjBFdFp1MTkwdXF5MUEzcG5abExnTTR4cVZqNVcwNXc2?=
 =?utf-8?B?ZE02MkFWUVZMeGZHbDkxVmV5dkxUVzU2alY3TUJ6ZjhXWEVtcVZYV2h6aUl3?=
 =?utf-8?B?bCtIVkt0aWtOOG1YOElVT1M3UXFSV3dqK0FGVUl1QXFPck1TZmFMbkR0U2Nq?=
 =?utf-8?B?Sy9zYTJKT0NSVFBia0lmbWNIRkhSNlNkZEdnWlEySHZjbGR3cnlWb1diQlB6?=
 =?utf-8?B?TjRkaXFJTGlOMERrdDdwZTVBemMyWTJyOXNYVGhaV0tHbGdsQmJlaWxxZEhv?=
 =?utf-8?B?bDd6cEdmVXREVldVZ0sweWp6MnhoZlFuSG5xdlNhQ1c1S2pMQ2xvVFM1R2Y4?=
 =?utf-8?B?NUJPSk5pazd1L3lmY0hYOFhDdWFYVm0zK2xiMHZLTWprSHdzV0gxSFBQZU5D?=
 =?utf-8?B?Ynh3L2FNVFQ2cGxhUzJJOHZ0bkM0MEh2L2g3WUpIV0dHQ01BN0hIWGhOc2Fa?=
 =?utf-8?B?TnpIM2dURjZtM0VPbU5lTWhBSHYrK3Vmdit5Y0NjdTA3eFkzUVQ5UGtXUmR2?=
 =?utf-8?B?a0N3ZzRCckRLdjBYUVhCRldweGx6Ym1pWDl1bGhLV043Z1laSlBEakFXcWtP?=
 =?utf-8?B?N0VSczAveGFRczg4ODZ6UT09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e5ec91b-6c22-4469-1372-08d8f44bdc57
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2021 13:49:53.3206
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5OB7aVNmnopsIwME5UQRkaqALe7mnhGRNipz8nk8JZM9W3SAyqUbQsm5iT2cZ6NFdk0XgBdtIA+2sraXGJysEA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4844
X-OriginatorOrg: citrix.com

On Wed, Mar 31, 2021 at 02:31:25PM +0100, Andrew Cooper wrote:
> vlapic_init()'s caller calls vlapic_destroy() on error.  Therefore, the error
> path from __map_domain_page_global() failing would doubly free
> vlapic->regs_page.
> 
> Rework vlapic_destroy() to be properly idempotent, introducing the necessary
> UNMAP_DOMAIN_PAGE_GLOBAL() and FREE_DOMHEAP_PAGE() wrappers.
> 
> Rearrange vlapic_init() to group all trivial initialisation, and leave all
> cleanup to the caller, in line with our longer term plans.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> CC: Wei Liu <wl@xen.org>
> ---
>  xen/arch/x86/hvm/vlapic.c     | 11 ++++-------
>  xen/include/xen/domain_page.h |  5 +++++
>  xen/include/xen/mm.h          |  6 ++++++
>  3 files changed, 15 insertions(+), 7 deletions(-)
> 
> diff --git a/xen/arch/x86/hvm/vlapic.c b/xen/arch/x86/hvm/vlapic.c
> index 5e21fb4937..da030f41b5 100644
> --- a/xen/arch/x86/hvm/vlapic.c
> +++ b/xen/arch/x86/hvm/vlapic.c
> @@ -1608,7 +1608,9 @@ int vlapic_init(struct vcpu *v)
>          return 0;
>      }
>  
> +    /* Trivial init. */
>      vlapic->pt.source = PTSRC_lapic;
> +    spin_lock_init(&vlapic->esr_lock);
>  
>      vlapic->regs_page = alloc_domheap_page(v->domain, MEMF_no_owner);
>      if ( !vlapic->regs_page )
> @@ -1616,17 +1618,12 @@ int vlapic_init(struct vcpu *v)
>  
>      vlapic->regs = __map_domain_page_global(vlapic->regs_page);
>      if ( vlapic->regs == NULL )
> -    {
> -        free_domheap_page(vlapic->regs_page);
>          return -ENOMEM;
> -    }
>  
>      clear_page(vlapic->regs);
>  
>      vlapic_reset(vlapic);
>  
> -    spin_lock_init(&vlapic->esr_lock);
> -
>      tasklet_init(&vlapic->init_sipi.tasklet, vlapic_init_sipi_action, v);
>  
>      if ( v->vcpu_id == 0 )
> @@ -1645,8 +1642,8 @@ void vlapic_destroy(struct vcpu *v)
>      tasklet_kill(&vlapic->init_sipi.tasklet);
>      TRACE_0D(TRC_HVM_EMUL_LAPIC_STOP_TIMER);
>      destroy_periodic_time(&vlapic->pt);
> -    unmap_domain_page_global(vlapic->regs);
> -    free_domheap_page(vlapic->regs_page);
> +    UNMAP_DOMAIN_PAGE_GLOBAL(vlapic->regs);

I think you need to check whether vlapic->regs_page is NULL here...

> +    FREE_DOMHEAP_PAGE(vlapic->regs_page);
>  }
>  
>  /*
> diff --git a/xen/include/xen/domain_page.h b/xen/include/xen/domain_page.h
> index a182d33b67..0cb7f2aad3 100644
> --- a/xen/include/xen/domain_page.h
> +++ b/xen/include/xen/domain_page.h
> @@ -77,4 +77,9 @@ static inline void unmap_domain_page_global(const void *va) {};
>      (p) = NULL;                     \
>  } while ( false )
>  
> +#define UNMAP_DOMAIN_PAGE_GLOBAL(p) do {   \
> +    unmap_domain_page_global(p);           \
> +    (p) = NULL;                            \
> +} while ( false )
> +
>  #endif /* __XEN_DOMAIN_PAGE_H__ */
> diff --git a/xen/include/xen/mm.h b/xen/include/xen/mm.h
> index 667f9dac83..c274e2eac4 100644
> --- a/xen/include/xen/mm.h
> +++ b/xen/include/xen/mm.h
> @@ -85,6 +85,12 @@ bool scrub_free_pages(void);
>  } while ( false )
>  #define FREE_XENHEAP_PAGE(p) FREE_XENHEAP_PAGES(p, 0)
>  
> +#define FREE_DOMHEAP_PAGES(p, o) do { \
> +    free_domheap_pages(p, o);         \

...as both unmap_domain_page_global and free_domheap_pages don't
support being passed a NULL pointer.

Passing such NULL pointer will result in unmap_domain_page_global
hitting an assert AFAICT, and free_domheap_pages will try to use
page_get_owner(NULL).

Thanks, Roger.

