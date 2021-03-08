Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DF36330C89
	for <lists+xen-devel@lfdr.de>; Mon,  8 Mar 2021 12:38:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.94814.178573 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJEDB-0007mi-0K; Mon, 08 Mar 2021 11:38:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 94814.178573; Mon, 08 Mar 2021 11:38:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJEDA-0007mJ-TL; Mon, 08 Mar 2021 11:38:08 +0000
Received: by outflank-mailman (input) for mailman id 94814;
 Mon, 08 Mar 2021 11:38:06 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QSVd=IG=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lJED8-0007m9-Ij
 for xen-devel@lists.xenproject.org; Mon, 08 Mar 2021 11:38:06 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e7250106-8053-4e9d-a408-cf166b7d2a68;
 Mon, 08 Mar 2021 11:38:05 +0000 (UTC)
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
X-Inumbo-ID: e7250106-8053-4e9d-a408-cf166b7d2a68
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1615203484;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=UiDoH4ubFhxvZZE1S32tNzBJmS7SiN93C0HiGa9EdBA=;
  b=g2k721o/TsAod2FkYPEVNRXrT4cNWptf1on7eO3vI/9aUiGR2BFoSHpK
   j1D5RDDbA1QMARm10dmDLZRZXa50XC6Fg2NkQKE61BtZxYyeeCkAudSto
   PPJaZVStl3DGLWBuhAN/Ex16aHvmMHGISh1bXwhOzPTcPfQ9m1YPv/Re2
   4=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: ZawCvNDIHC6aUOfblvYyke+0VyMEb1leck/Oq3FZlNLSvXUoKTg4HtKxwkIQ2KPQeRkUmesemC
 SACSud5uGau3DgxAiOsZJVCBuHD/ErIgZiAZNwlxbKsdbA46N8uvrPKrYwkzXu2p+xolOwZiW5
 hxUqjrZwsW8WvIPF0xUvaEwznWK9+R5CPvRIG32RAkDxCWpPawIG6VUjQLBxv9mcjf1FnExfkF
 wNpPzOZmygRRCSQucSmNd5vYljEmd6ZTdNXHPrxTpl0+X2aFTdTlqlVDyAaxzhXAMk5g0Nco2F
 OAE=
X-SBRS: 5.2
X-MesageID: 40169225
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.81,232,1610427600"; 
   d="scan'208";a="40169225"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iNUtPuc4HUMihEjGW1/wAz/TjeVbNmIG7/ebQoytcjxKSypPWGdzmduby2CUON5llxcsHKjD8pLYcFWfxejlTPIKOMFb5n0XWYS4yNfZxQ7hPQUUJi4c1kXT0+6Z8NkM2K9veJfi9r7ws8pTTsYeT4nXtgLEib1G/jcBFuk6gkfW3ksP2EmcbgjHRYaiNE8W2jTaSP25VYsV4JmFvrjM6gdsYp2GU0I5TXkZeAjR1MZhSiH1C1QZKEZ4mk6JMI0zQS2qLeUqXdsOr0Dnc/pnVXIH2TYW3qB2RNj6esItsvWQeVXL2Jiohx71qsZYh4FOG5uKp1Swhv6GU3AyKFyBcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vqRbU6BlIqaSzOEclvGQ11l9rYi7gl+ROTirI7UOxfI=;
 b=OBy33utGN/6Z9u+Nu5kcpJfaJpc0kUGjVYkSJmN/ghuG5QqK+oSQQ1N+Z6rA/BFFSu+B/8bBJ7fQn7rXJd+Ui/9oFIxMA+3VvO3EenTvvlkupFWqFPpEO05/tRAH9v8PgzUXPcS8tHg1N//xKKTaAVDJKxHwgO8wCI2HuJ6UDkRHEBU9a/WCDSdvUq2hWxaF9I9pa1P9vL6izD3nh/qLI1jy+/TT0qKStxW0U+zvTWEZkYcRcIa0aMV+vPRc2eG5N9OOqcYupjDccuzkTss/h/tcfvEEsVRnBcSvdVH7AedmOfh5p81HK91JBPdFUUgCMsGTPyRjwdBxQbbIhecWQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vqRbU6BlIqaSzOEclvGQ11l9rYi7gl+ROTirI7UOxfI=;
 b=gH8LluUC97BaOpRSHzTDPa19trznwOElESy0Zp79JILz03ukYqAbGKy3MFz90NWuhhyoWZgLZcyXJIFiTnwQhHlOVvQ/LV89OVwzj2kaAmJB7vJwcm7GB1DGt/8TuKE9ePPMg3cpXpLiYhiufRXTQ/w2Ekrmz7rnfac78Sy++CU=
Date: Mon, 8 Mar 2021 12:37:37 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, Ian Jackson
	<iwj@xenproject.org>
Subject: Re: [PATCH v2 2/2][4.15] x86/AMD: expose HWCR.TscFreqSel to guests
Message-ID: <YEYMgQ+e5A9/jqQE@Air-de-Roger>
References: <f5f17207-b601-2909-8a5c-55276e734272@suse.com>
 <c91b190a-aaa1-d3b8-10eb-d8da7ad1f834@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c91b190a-aaa1-d3b8-10eb-d8da7ad1f834@suse.com>
X-ClientProxiedBy: AM7PR04CA0022.eurprd04.prod.outlook.com
 (2603:10a6:20b:110::32) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fa2ac501-32d7-4885-b55d-08d8e2269619
X-MS-TrafficTypeDiagnostic: DM5PR03MB2634:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR03MB2634A9EF7EEC2044AA3A43D78F939@DM5PR03MB2634.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Gq0eejBZntaQX6lCpTOeFicNdbJydB4SsS860C6GjkEi1zlq4w2c/EPvNjpW84cUqQJK17PK5sPRUdu1zthfP7zz6UIoV5O8knRt/wRWi1aiyj07IOShTyITww+6i+3eOrmNdfDY13Rv79D6Qn7RwqB5xNtymT8l6IJTrgv2xT6/ZLKqNcS6pkQqsklHQtv/SfJzeKnqllT2hRL2sA1VJJNfHhGKVNy/6D9DpnOmpUQPf7H11+CRcitAZdvmuDgLlyODcO9pyCR9JcVlrGri7bUm4x24l1qlYS+aZRkSsGRT4B90xPX2WD4bGBAKTzflg4ujZMDfid73cobxaEFvdRP9zn/2HnNjE0Htfr0ZW+zzDYWmATWbJPU3O9sxcbPUr8eW921faFmbdl/kINZsikWnkydYREScGRCOSWUU/5EI9xL3Yhqlk6/vGbMAc+oONC4DteOtKwrF+VnRoKF96QtMGiTi4hwVazCYiNadoH4GSxz3E+f2GSEdJXlJamZP+3swqH+WRCGXcclE52ChcQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(39860400002)(136003)(376002)(346002)(366004)(396003)(6496006)(54906003)(85182001)(26005)(83380400001)(66476007)(33716001)(9686003)(5660300002)(66946007)(4326008)(6916009)(86362001)(8936002)(316002)(956004)(16526019)(6486002)(186003)(478600001)(2906002)(6666004)(66556008)(8676002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?eDFBdGN6L3VOTFcwRTh2R3RPVGdiYXBwTlJ2Qmh2S29MNFFlOER1NWxFODBM?=
 =?utf-8?B?WVMyRUZEd2pGQmxsUG9pYi9Cb0Y2L0h3R3gwVmRRa0wrS056anUyVi9ubXRD?=
 =?utf-8?B?b0h4aDVxV3hjRk5pT2UyY1UySnp2KzhuYk9WZ1J0TTlVTFd5cSs1LzFTNXBZ?=
 =?utf-8?B?TVpzbE1SLzl6UlFsMytIT3Z6S3VhR2lUL2FvbUlnaTVlYmgzNlpVU2F4Wm53?=
 =?utf-8?B?VmdkdStLU3RPTDZjOFNjNWlzSnNoTFNmWWEzcGJvaVc5TS9Ecm5rOUVSNTcw?=
 =?utf-8?B?VzF5V0d2UnNZVmRnNkdLYzhBdVRuS2ltM2dGb2Y5QjlhWmx5bnJ0cGVCTVFw?=
 =?utf-8?B?OHpBOUJLQjQ5U2ZDNzZhU2NGbmg4bGRKV2I0TnVGUGJJaHp6RlN2SVptWXhI?=
 =?utf-8?B?eTBzNmlSamRrenZoeGU5S3BLQWg0YVQ1Y0trcDZqVnZDaHViMHNSWks3b1k0?=
 =?utf-8?B?WUJ1TGFPdlBKYnUrWnpUYjJOcXF6OExvMExiZC9LWUMycVNTZ2dXdnJ5RURy?=
 =?utf-8?B?T3hST3gzMFdBVkE5dmc4bVFZdzIzTE8xMXhhWldtN2dGVFIrME1aYlU0YS9s?=
 =?utf-8?B?Y2pJcDh1WDRqQWZNQm1xUk5mMDh4aGg0bVhlRWFSMU55WDhTcnlVT1BKYWp5?=
 =?utf-8?B?TTQ2QlJxT1BQaDNUREJzZWdmWXdacElHaTRsWWZsM2lkL1A1NjdtOG01RUdv?=
 =?utf-8?B?WWpiT2l3Y0hCZGlLSmtIekVLYTZZejl3NXoyOEY1QnJPeHFlRHNpQVVWNnR4?=
 =?utf-8?B?MG1pOXNWcDlxOENPa09YU25ncktuZlJkVzlFVjNlRjl0OC9abzhNQ2dUcjI0?=
 =?utf-8?B?dFEwSXBrbm0xdDhsa09tQXhhb00veFNkejdzcStFYmxvWWl3ZTRMNFNLaVZm?=
 =?utf-8?B?YmpnUEdib0I2S2xwODhrejFkd015OWdNSE03SEN4cXJzWHAveW4zc2ZEYVdl?=
 =?utf-8?B?UFFidE9IQ2lhUXFoN3piMDQ3VHV0Y09YTXJyYmhpVW1sc2d0UGZrTzJMNXBR?=
 =?utf-8?B?ZE1aQStzV0VGU2p2QTlKMU9jcDR0SlFMNnJJa1BPY1BhU0tINzJSaEtERlJN?=
 =?utf-8?B?SFlRaUlLU2ZFem5kbUFWU3dLbm1yZ3loK1NhbUVoajVwYVowaVY4QUJOdHZP?=
 =?utf-8?B?RXpXMS9CaDZRdldMRGdQMXptZmg3WjJDa3piT1l2WU5GWk9uWGdXOTdzMFF2?=
 =?utf-8?B?dTF3dDlSSmpLVDZSNi9IOEFRbGhIdUU2N1RjK1ZYZVpUVkV0VE1XMldndFha?=
 =?utf-8?B?RDZyZW1MOUFxdUJLUXZPYWw1YUZLOUtCQ0sxaHVqbUl1czQ2UTJ6S0tUVHZv?=
 =?utf-8?B?N1BqbHlaV3drOENSZExpaEZOOVI1ODFWNStTYVFyc0ZEdUNDcDBad2U5U0U1?=
 =?utf-8?B?ZnZ3Y2JabDhNNTBQQUhjZHZveFhiYktUN3lBM1dQUGMyM3RZT2ROaFcxVmxJ?=
 =?utf-8?B?NGRTT05tN2ZBRFQvbDY1Y3hhcWVLVlJIY3pab2xOOC93bFdkMmtrYjhVUjZQ?=
 =?utf-8?B?dlEwYXhRMHI1bEdQbTA5cG56NlZmMVlFYllCMUJYemdZaUxPL2JEZ0JMOGpS?=
 =?utf-8?B?a21iV2E0MUFWc3FiZkR1M0NsVnZ1dGJFNXRmbWtSYWZ5K2ZocjRna1NTWFJX?=
 =?utf-8?B?ZEhqcGR1d2FwY0hJTlY1OEFYTm5sSXY2a213eHhMMklvaFRXNFg1S21VaE9W?=
 =?utf-8?B?SUFlbktFSEJCaXJRQ3BKeWtBK252TzZaZU1RRGwyRnUwYjZ1WHMyT0JFQVZK?=
 =?utf-8?Q?h16fL/oont2Xj1UqlG5XHAAAGftw5kDJ1m15D+w?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fa2ac501-32d7-4885-b55d-08d8e2269619
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2021 11:37:43.0116
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CK8gGA3Vj3evMoqo6PeNd02fSiHDPmFypT87IqzmeuchN62WjnqYi2s/hS0tUlm3x+hHyM8qbpCzV4XnQ3bR8Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB2634
X-OriginatorOrg: citrix.com

On Fri, Mar 05, 2021 at 10:50:54AM +0100, Jan Beulich wrote:
> Linux has been warning ("firmware bug") about this bit being clear for a
> long time. While writable in older hardware it has been readonly on more
> than just most recent hardware. For simplicitly report it always set (if
> anything we may want to log the issue ourselves if it turns out to be
> clear on older hardware).
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

One question below.

> ---
> v2: New.
> ---
> There are likely more bits worthwhile to expose, but for about every one
> of them there would be the risk of a lengthy discussion, as there are
> clear downsides to exposing such information, the more that it would be
> tbd whether the hardware values should be surfaced, and if so what
> should happen when the guest gets migrated.
> 
> The main risk with making the read not fault here is that guests might
> imply they can also write this MSR then.
> 
> --- a/xen/arch/x86/msr.c
> +++ b/xen/arch/x86/msr.c
> @@ -315,6 +315,12 @@ int guest_rdmsr(struct vcpu *v, uint32_t
>          *val = msrs->tsc_aux;
>          break;
>  
> +    case MSR_K8_HWCR:
> +        if ( !(cp->x86_vendor & (X86_VENDOR_AMD | X86_VENDOR_HYGON)) )
> +            goto gp_fault;
> +        *val = K8_HWCR_TSC_FREQ_SEL;

I've been only able to find information about this MSR up to family
10h, but I think in theory Xen might also run on family 0Fh, do you
know if the MSR is present there, and the bit has the same meaning?

> +        break;
> +
>      case MSR_AMD64_DE_CFG:
>          if ( !(cp->x86_vendor & (X86_VENDOR_AMD | X86_VENDOR_HYGON)) )
>              goto gp_fault;
> --- a/xen/include/asm-x86/msr-index.h
> +++ b/xen/include/asm-x86/msr-index.h
> @@ -287,6 +287,8 @@
>  
>  #define MSR_K7_HWCR			0xc0010015

We could likely drop the K7 define here, as Xen won't be able to run
on K7 hardware anymore AFAICT.

Thanks, Roger.

