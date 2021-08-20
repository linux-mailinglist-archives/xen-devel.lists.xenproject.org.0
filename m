Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F12133F28FB
	for <lists+xen-devel@lfdr.de>; Fri, 20 Aug 2021 11:14:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.169347.309331 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mH0at-00042L-07; Fri, 20 Aug 2021 09:13:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 169347.309331; Fri, 20 Aug 2021 09:13:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mH0as-0003zN-TE; Fri, 20 Aug 2021 09:13:42 +0000
Received: by outflank-mailman (input) for mailman id 169347;
 Fri, 20 Aug 2021 09:13:41 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EFwF=NL=citrix.com=Andrew.Cooper3@srs-us1.protection.inumbo.net>)
 id 1mH0ar-0003zH-44
 for xen-devel@lists.xenproject.org; Fri, 20 Aug 2021 09:13:41 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e81fbc24-0196-11ec-a692-12813bfff9fa;
 Fri, 20 Aug 2021 09:13:39 +0000 (UTC)
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
X-Inumbo-ID: e81fbc24-0196-11ec-a692-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1629450819;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=6ZduSl7WPfFrHM1VfSFFaEa9OsElRosG9c5PZHElAlo=;
  b=FSSLg74WF7Nsb81TPuNMD27tMZibqtVSnxzpdnT7tZRjdOmevxsUibNH
   SXHhWT9wSeFLGQOw9Y9/UNpuwBpgGMit7mOaK+8jCxqxwMm1JaaNjnKKf
   MjvO8+HaV+5TH2JmPyC2T18BovUigwXrd4RxZWqhj+Px/V6hbVsHxJLXB
   U=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: k3Nd3+xIyO4TZir7rt0UEMqr+va4gHX1V/6soL9n3yclZfIwlhzHfm6TjbBdQ4cv6I58NwctDc
 j9xTO3fClFyIZqRwo6l+bS+dcRHEsUZ3e2eMZBrBO9qQvGpj/BA60QfJ3zBT7tgDrHzc+0UiW7
 qwUAAxvrFs0dKauYndclXNvv+V+mDt1JSe8KMtt2FHKmNVdYsXTlZIVrhiYGOqzSAddzMuAIVB
 1uGWJP8PbdxEfdQekDM5b6Uugli2X/IYg5HkJCtDvdXlsYuubIzEW6RhjeyfIKya9g8xoW2zI0
 zXgp4fgZutlt08JJmrdAecr/
X-SBRS: 5.1
X-MesageID: 50893041
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:Kqu/bqzf7xgylZOnj190KrPwIr1zdoMgy1knxilNoH1uHvBw8v
 rEoB1173DJYVoqNk3I++rhBEDwexLhHPdOiOF6UItKNzOW21dAQrsSiLfK8nnNHDD/6/4Y9Y
 oISdkbNDQoNykZsfrH
X-IronPort-AV: E=Sophos;i="5.84,337,1620705600"; 
   d="scan'208";a="50893041"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WDixxePfLFQKkV8pLYlgcQhW96p8oOLkr3HpZVYcusg3dLrTsuratTg2rWQow9FDY3Q0vHF7DjiNuAjAkN2xeumlbNnl0yTuYEd3nONS64AvG0WPKtxW3MX4T3TLr8YMzBnOvW1puwSfx5iwcmFin/k0VX7DzoWc/gsInZzBAoPz+YKQbs9XaDOdhaBUxuYxqPTELNiY2MLix8ySR8U64uFTsoYmgShhhSCDpe6XhMIV71hsOTMabdvP+DToqOOIsoKYwCbWuEC2h2zpp3onparoLA8G3f1T55BpqNjA9JtpldfYYbV3EX4X9KzvWbTbnvED2Ul9v0MIXBiHlIdtuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Tym9z1Vq0nvOKwiPamxTmho0cNMuab8J76H/8UwHZr8=;
 b=fgXhPtU25PJ1nPvlWrAnMyHqx4gO/kuZGngm8llZE1aiSSVkayCpr7E1ohag+BXTst2MlLGiOi0qkfnOLqbFaQX5Xtf24K/5TCABFS2RNFy2P3nVbPP4rERSzYXJXG2UsYRepach+E+6Wk6AjeJSieJyeBYwQ5G5ol3UA/5QEL6IyT5Er/EgcEP0ymZi1aa8CKJjoF3LTls3MbjEH55lpIoLQnCBGobQPyV0E08arG4SPElU2t9nmqEs+jO8FnVCUzgNppeUXp4wJss63g39GRbT/nxx2/6RYN2p7pCCOOs5z3eHbUJb6kGnF6xUJeJmCEac+x/6lhpjuCO3TORpmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Tym9z1Vq0nvOKwiPamxTmho0cNMuab8J76H/8UwHZr8=;
 b=Keh/1TREjTQvcTx0qtNVAut89nhKtsQ3Mopn2XmFkbkKPQzm+1GdB+yCTP8Ox1sVQ93O9Bz8Cd6tekg0uybpGgI7xYmMWsa1H4+pFNqY6DgZVzxvf06PldKW56HS7T0a2zLFsVwm7sDGB6x5vTGUNqSame150dfzrHaqil3cNB4=
Subject: Re: [PATCH] x86/PV: account for 32-bit Dom0 in
 mark_pv_pt_pages_rdonly()'s ASSERT()s
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
	<roger.pau@citrix.com>
References: <14ed9a42-981b-da81-9a30-6ff9b3896bfb@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <4f0b9a70-e58c-7005-6eeb-82b9cd295a72@citrix.com>
Date: Fri, 20 Aug 2021 10:13:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <14ed9a42-981b-da81-9a30-6ff9b3896bfb@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: LO2P265CA0457.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a2::13) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 28eb05b0-8def-4f1a-f298-08d963baca70
X-MS-TrafficTypeDiagnostic: SJ0PR03MB5727:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SJ0PR03MB5727855C2D6D31416E575E8BBAC19@SJ0PR03MB5727.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2582;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0cGa69fGoWadegEQ2L0Ql2lPt1GkjGdK45Xv6Wdxq/6VzEMgTgUMq6U/9LQJBPt4xJ/3P2mfXxB3Q4RH9vQiEycB3yYrPnuzZDRg9BiPKUDqEzyKpjttKYuaztb58g5TIh4AkuANPPkeB3EL1P/MBRijfsXo2pSHrN1kPe0eAsjFWi0177xX0S/j9kYgdeBbt4pasi7tcyaeIlGexm5g7dIdIS+Br10MpF2l1TWYpicYw6oL/B1OBjavIR/SyA88fHdFmaP9q025aklCCJaBDu2cKXTPGZTmQiX79cYuHW6rUpDMAgMlDUKbVjsBHldSP/sDW/7lm1q3m24pVbOUiaAzBSLyj5Nbe0grKo49HOZCV1tSBeb7sMri5LqpD8Go6EwLMPuZir6BwGoD6mR0EzHpANBqnHFwljJVwV2wKWSWWHcVb8VkcbqB8sesMgkrqI87PX0nwrqK8Lmq/U7keM9ibwvIlADGY5pRzTrOlDSMYt+go9qMUFOjxqPqPSpTViFViJ4cC6TprC3TCvQ5xvou8lW4eOWpARsOsA+rSib9he4LZbVdZqpF/fxV/2NRyOVieLlfaFwNfkhobPtNiwjMQLF2zB+eDvZMQAFqb9QpG4DiX6hVmdTIvOsdbRNTg/vl90q93WuuvcaUHv1tEhaze2f/KUlAeMVcnCbr5fALtzJycizn9avGsUwZ/tTDQvgt/HeGLulsM+ncQmz/tcQ2cY7S29ZemeR8u6qnyxY=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(316002)(4744005)(53546011)(54906003)(8676002)(16576012)(86362001)(6666004)(31696002)(26005)(36756003)(110136005)(38100700002)(508600001)(6486002)(186003)(5660300002)(4326008)(66556008)(66476007)(107886003)(2616005)(956004)(66946007)(8936002)(55236004)(2906002)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TmJibUhuOHkwSFo0VkUwN2E2WTJoTHBSOTh4QkE3VXdLWVQrT2J1S0VKckVC?=
 =?utf-8?B?SXRyVlJ0MFFqT0JCUkNYdGhIMjdmYmExcnF5SzdUWHhyNHJhdG9ETmg0ZVZK?=
 =?utf-8?B?eUlkQ0s1SzJJWjhibHVBSUdGWjN6YjNTdUxnWThLVmNLYkdPNjNiQ2xkR1pS?=
 =?utf-8?B?S0w4dXI1YWIvZkN1UWFaUFNYekZqejVjSGJSZjBKNEt6MG93Tm5TTHJ1WmFO?=
 =?utf-8?B?ZzVYYVRtNGZzRzRuUjFicE03M1BDdXNGd1hlcVM2cmc3WGxvdzMwVTJSMnpn?=
 =?utf-8?B?ZmFLS3lDRHBvNUlnSld4MW5QMWVLdVZ5aWhKTjlVZGRpclRmK3N4azg2WjBV?=
 =?utf-8?B?RDluMEFuQndKcXRtYUlxSi9DcXh6ejh2azZORmdQQkhmN2NXTnlTS0ptYk4v?=
 =?utf-8?B?M0p4bS9BWCtXenlVUG5pZno5QVZDN2hvdE53dFBRRlo0Y1dHL3JjZUQ2a214?=
 =?utf-8?B?ZW9uSVozZDJlUFBtWlRsdEFrcFJYcXpVb1NsdkdnTmU3WWt6R285b0RmQXA4?=
 =?utf-8?B?S21nTk51NkhnSmF5cmI4UnNsRUU1UlM2bXlYQktaTGFsand1dXk2dW9aV0U3?=
 =?utf-8?B?SlFwSGpFTGdFSUVYYUlSL3A3TnVuSG9NV2cwSHRUK1BzMWV1dDhzY3l6NFRq?=
 =?utf-8?B?L0ZIZUJXdlozT0Q5UWM5NUtiYXBNVFV2SFdzc2RqK1huM2IzV3padHd1RUZH?=
 =?utf-8?B?Mk9FMkRjcncwVHFOMVoxc2hwOTQyNzZ5UmIyS2ZLK2owNG9zaXpEM0R2aTl2?=
 =?utf-8?B?RjBFck83VGEvUnQ4NjQxY2NHZjZ1bUdIaEduODhEdjN1bytNNTdEeVBoYUt2?=
 =?utf-8?B?QXVDUDZHR0lkYkkzSm93VEdhRVdoRGNtdEVLVUxjeWZQRjdnWkMxOXhtMUk1?=
 =?utf-8?B?S2VMdUI3dUIyUmJsNFNpL1lRTDE4QzNRdWtSeXUxSE5weEtyMFc4WEo0ZFha?=
 =?utf-8?B?YW5kZ1ZoNUc2TnVScm12K1N1ZHRFMGl5WFdQNGJpcWRrSmhtajNyOUxNNHcv?=
 =?utf-8?B?QStQRzFZbXpGaFAveE5wcmlqcHVFUW9iTUFpdnVCZFlvVnpwcDBaVGZyTVBV?=
 =?utf-8?B?VjV5czc1MzMrM1h1QzJnaHp1SDFQWDJQb1pqeFVsZEN2c3ZNZmpPTlJlMjN4?=
 =?utf-8?B?bThSRE8vU1dqVXFQSzlBclFNUWpuL0U0WGhiWHNQcjZRbzFOQmtPRmJmU1Iw?=
 =?utf-8?B?ZG92NWNOVUhIcktrQlZ0czE4NnBqQkw5OGwvVVlpNjhVRndHbDlLRStla0hQ?=
 =?utf-8?B?Tkg0SUpMMHcvaTRaV2w4WFc5MHZnQTFaUVRyMkl4TmJnM0hveDRid0wwTVND?=
 =?utf-8?B?TVM0bWtDY0lWcjQ5TFRHVGVwMmxnb25YSTRwaXpxZE1oTFdESDJEN2ozMUlH?=
 =?utf-8?B?MWcrVFJacWRpdG03TElTY0xQcWRNQkdldmxTRDcxcHBPb0R6YmNXTlFFbEJK?=
 =?utf-8?B?SkdMSUZTMjE5Uml5K3dMbVY5ZG5hU1FEQnN3b3pGNk16ZUZKZkk1eG5uSmpD?=
 =?utf-8?B?ZUJ5RGozUUFkUTZiSHdGeHE2V0RQRzdhZXU3T3RmWEJycktIVXBydkhwWjE5?=
 =?utf-8?B?cjd5RDNTemdReVg2ZVVsRmpRWlZvNk02Z1haWnRvKzg1eEplU3NHSXVmSTll?=
 =?utf-8?B?YzR1azlkem9jdEJURWZnVzJBK21icmtiOTAvb0lYbjRLNExmR2llRGJvZWtv?=
 =?utf-8?B?MjRnbHpINnczZ2ZjenZmNndkY2oyTFVvODJFQnJVZjhVWUlwT1BkQlpjZnl3?=
 =?utf-8?Q?2k+bRKg4lJeXxBY3iLZX1Nj9dbyPpVWallCD1eO?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 28eb05b0-8def-4f1a-f298-08d963baca70
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2021 09:13:36.2961
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: toVJ78VVX3sJT3aEWNpf6GzaZ/gOjADl9ZvYqzyJFQD5nYKV1LCW7birqT5mdMRx1piZONh7ENicUyUMKXYea51P44aVSQ6jCdwhbqIxq9c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5727
X-OriginatorOrg: citrix.com

On 20/08/2021 07:22, Jan Beulich wrote:
> Clearly I neglected the special needs here, and also failed to test the
> change with a debug build of Xen.
>
> Fixes: 6b1ca51b1a91 ("x86/PV: assert page state in mark_pv_pt_pages_rdonly()")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>
> --- a/xen/arch/x86/pv/dom0_build.c
> +++ b/xen/arch/x86/pv/dom0_build.c
> @@ -67,7 +67,7 @@ static __init void mark_pv_pt_pages_rdon
>           */

^ this comment needs adjusting too.

Presumably this is because PGT_pae_xen_l2 is logically part of the type?

~Andrew

>          ASSERT((page->u.inuse.type_info & PGT_type_mask) >= PGT_l1_page_table);
>          ASSERT((page->u.inuse.type_info & PGT_type_mask) <= PGT_root_page_table);
> -        ASSERT(!(page->u.inuse.type_info & ~PGT_type_mask));
> +        ASSERT(!(page->u.inuse.type_info & ~(PGT_type_mask | PGT_pae_xen_l2)));
>  
>          /* Read-only mapping + PGC_allocated + page-table page. */
>          page->count_info         = PGC_allocated | 3;
>


