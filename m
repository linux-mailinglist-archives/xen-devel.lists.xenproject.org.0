Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 198163934B5
	for <lists+xen-devel@lfdr.de>; Thu, 27 May 2021 19:25:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.133605.248970 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lmJk4-0002sa-9P; Thu, 27 May 2021 17:24:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 133605.248970; Thu, 27 May 2021 17:24:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lmJk4-0002pk-52; Thu, 27 May 2021 17:24:20 +0000
Received: by outflank-mailman (input) for mailman id 133605;
 Thu, 27 May 2021 17:24:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ln4B=KW=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lmJk2-0002pe-Ei
 for xen-devel@lists.xenproject.org; Thu, 27 May 2021 17:24:18 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3cc73b4c-5d89-4d15-b2a7-6769b630be9a;
 Thu, 27 May 2021 17:24:16 +0000 (UTC)
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
X-Inumbo-ID: 3cc73b4c-5d89-4d15-b2a7-6769b630be9a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1622136256;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=/GGbbTeOcMIKp3C3aoNY8msHhW/owdVlh7u/E4EwR5g=;
  b=TVLVfORoR6y5bJGcZbaqGZazLPiiDCfgWlJLncT+OH+oV4U0s2NuUfCL
   XTTdFTLdGaqv51vAqSloiGpR3gdhuVMtUupPsp8HgmcRhQJSgiQKyhbg5
   qkORCODtuwzozBy8nau7S/JXWWoFWCgCrvEUdCCfjY3diuGuSxngLWUj/
   0=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: qH/sxLvl1LkqLzZvQBAmyDzjpakHpLvCPVDj9CggC7WD1Wi3etZDPmZJUy25TeZoMk17EZaIXI
 T6HygTj5bGJ1xeI6LW64IigMkYXMxYQ0p/lFXUPW7yeSbEkfWIYVzL2JxVnXsR8YLvy+dk6y8G
 50ZMCqNqAtNhFA5joyQY/vWuRhqTp4NuXmu1f7lzWfnKZ3XfrECjBl7npgExsxTbZ1dEa55aur
 w7Fl0NSnseoq0/JaipUAx71DJKr2PqdKAuDc31J22VoUQBwizsBH3WoBfKydTLGiafGOmsLnfc
 ji4=
X-SBRS: 5.1
X-MesageID: 45163423
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:WfvyuK1fe717L2cq01cvpQqjBEIkLtp133Aq2lEZdPU0SKGlfq
 GV7ZMmPHrP4gr5N0tOpTntAse9qDbnhP1ICOoqTNOftWvd2FdARbsKheffKn/bak/DH4Zmvp
 uIGJIObeEYY2IasS77ijPIb+rJwrO8gd+VbTG19QYSceloAZsQnjuQEmygYytLrJEtP+tCKH
 KbjPA33gaISDAsQemQIGIKZOTHr82jruOaXfZXbyRXkDVnlFmTmcXHLyQ=
X-IronPort-AV: E=Sophos;i="5.83,228,1616472000"; 
   d="scan'208";a="45163423"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EGHQPzIMkeUwX12ZCmgIP23T65pDkQzxz3MaibYtlEEw2/ZRdU16fSVxlbGtteTgB3a3cvRndUoYNlmSIPa/S6VmvZay5vO4JUHFGoV7Lt3Hmjs5M9ouYEX6BZoSfabuxSowcGyi6N7tpXICzym5a0y7+f3HS+o7Skyqt962TSsT4zmkaveP/XJ0FilKGbDa3IR/CHZm8Rw3KVkGqvvLeps9kfLsGyIknvfdlrUZXUSlgwcWkPOsQFzo/n3V/Y5tZTSTcqMSGkMgeLHC2J45UdoNiyr/JrF0LiTzwSL162VgI8b46P34d6NWOHeRIjpZj/IB5ueKlzB1SbUuocHRgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8TSa8Bj66WshHEcSwn6Xn7Gvf4WKJGEibxkzR9PXQjg=;
 b=AnWaBL9SuBcI2VMM4wZfvYcVXErH76xbKQIdhFdDbG0874hfACbfM8jmVY1CXjtzppVDbjgzBUm6YPVkpI1BfPNxO6mEcNeH+Og0yuCBFx6+C/+LIFq7pMtc4qahi0oQdZx92YRw5bozm+9jM29NWhuCh5E0rlJ60UHxZlMitCCbRvsk1zRtjIenYLPD3MHY+Ryu5TmIOVVE5tialvX4yyEspga1+Yl0zOJGe7wYHSHj9uGcHHxfJ3WOsRu3YeTbtvnqS7hga2eHi3qM0GVS+soHCUwbBBCA9q3GvgzZKaVAzgAmYISEXJ+OFvZldtxNCiR+0M8gXgvOjsC+jCckyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8TSa8Bj66WshHEcSwn6Xn7Gvf4WKJGEibxkzR9PXQjg=;
 b=E2CZEI3AT7Lvh2iZ6qOJr6mxa9+AoV9msPOAZoOYYEFbVHhYvwbRHa5KnqICr8oHkZ79fUWx8xyw9soyd71ynGOF0MZQPq8uy1BIQH7Cl2nMPg+JN0GzSBU/YsYuZLO2oVV8D9kb/npMiiqviq6NdroUpLQWNPd3ISuXJb21X6k=
Date: Thu, 27 May 2021 19:24:06 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich
	<JBeulich@suse.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH 3/3] x86/tsx: Deprecate vpmu=rtm-abort and use tsx=<bool>
 instead
Message-ID: <YK/VtuUatxX6lQuo@Air-de-Roger>
References: <20210527132519.21730-1-andrew.cooper3@citrix.com>
 <20210527132519.21730-4-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210527132519.21730-4-andrew.cooper3@citrix.com>
X-ClientProxiedBy: MRXP264CA0019.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:15::31) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 02366dbe-e751-493c-5e95-08d921343e1d
X-MS-TrafficTypeDiagnostic: DM5PR03MB3212:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR03MB3212A7E09553334E2CBBD9F88F239@DM5PR03MB3212.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4125;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VYMvAC+OXzwIAfFNDezqmBAQAuia4S6FNePRWUeyMAjQ7fHfsB3aP8o+LA+GFYEQVuKXQ2w3C1Hic971udswV2j+/e49Hgb58+LN6i8KELnnJamXwGlL4HeeXu6WrWowPNfwnENySwTkpnXDBE0ZKINWVpzU9/68AI8AFnXmXtwKN4LAs1iMOWHb0Dajvs4hBxjuiWDpMyhra8RYBmcVK3hGDtvAzOYIeEsG7wYHraH4KL/EknyT3mYThIwurBZdix5ccB+ZayhLGI7LT4DCIbUyXrq26G82+Ne1FH6x6NBsipP5lMsWPinCgNy/kwc3qKfLvGKcMFKEijR+PtqQkYoqJ+OqyQawqYaUhQDhQo/hOUcklYEZndzFhQuv3x/c00eHcYwGlzxUUUa8ekOAIK38oUS3NWuKG1G/CiQGd+j8ZK+BxJnu3Vg9S24c6n2kfs5vY242EiejP/kdzhh95Yzn0yF1Ts3kMf/WgNxEbaHu294J68/5XWnXcxPs7cgt3pfViaYr1p31mC/eILZ68fDlMmIV4ftHsha+FPcUaaEibfigwvyWFa6VH/MTCt+5HC7drXCF+x6gZT13RHAJwdSVPrqrSYXSMAbFCskwQdZF5Wzcho5/EKWiG0hjZeeIl9oxnNem/l0QpdYPqScDxA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(346002)(39860400002)(366004)(376002)(396003)(136003)(6496006)(86362001)(16526019)(54906003)(316002)(186003)(478600001)(85182001)(5660300002)(8936002)(6862004)(9686003)(2906002)(26005)(66476007)(4326008)(66556008)(6666004)(33716001)(6636002)(66946007)(38100700002)(83380400001)(8676002)(6486002)(956004)(10944003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?S0NOWGZrTjR1Mnd6VDdjdGZXTGROWUlIRjlMdFZ4SFlPN3JQd0lkYzB4aFRB?=
 =?utf-8?B?b1ExeGRCbXdGOVl6VlFlcFBJU1NqYkUvMGo0WTB2V2JPbDZGYVJscHp4ZzQr?=
 =?utf-8?B?MzVDMk1tZm1pZUJlbXFodmIwdDExWkllaGxQRHh0UXpxcE9tc2dmbnd4akxl?=
 =?utf-8?B?c0poUm9hODMzWWNrS2UrMEZjZlZpbm9pWjZpN3J3dy9IRmFiQWxPaXVsclRX?=
 =?utf-8?B?WWEzeFBkbVFCMmdYYkFHUHhiZlZRbXRGMkdRb0E1dTZpeUlPNS84ZGRjRzBQ?=
 =?utf-8?B?UjRRQTZsUlU3NHB0N2tqNC9WWHhFTThLRW1zSENxZ1BVWG1tZVY1OHlUdHJi?=
 =?utf-8?B?aytMbHB4KzhOZ1lJUEhJdzA0Nk9sS1BjQ1R1R0RVck1KTnR0cXNNK0tLcGM3?=
 =?utf-8?B?UTdpM0d4RkJmTXIrck1YSEpVcVFkNnpDSXU1YnV5SUNMWVhwbjh1OEhIQXZu?=
 =?utf-8?B?RXZGMjcvRXJVVlZQY0RHVnQ3WjFncUFJdE1wazZiOUFRcXhOUFdSemJxK3RJ?=
 =?utf-8?B?LzZyQ3BBeE80S2dCdCtjNklMMVVqTXZrZWlrUHkzaFZCdjF2OGJHMmVxT3B1?=
 =?utf-8?B?ZCtMaVkrZzhnZGVKU2ttNlNKdUtNYTNWQWRHRE80MWYvMmVkTDJndk5nUnpC?=
 =?utf-8?B?YlJCbWNaUDg0RjZ1OUxwOGFzaHQ0a0RwUWkvMm9DNTlJYVZuZGVBTTdxQklC?=
 =?utf-8?B?OVAwVEwyc091cWFhSW9CWkJ4d1dHNTFwRmhOYjFMNnpWU3N2ZzE0UWhRWHo0?=
 =?utf-8?B?eGlyWUdiSENpcENJd2ZVNGNyRnJVdTNYbE4vV1FobU1OQjdEUDdOdmhiTnU1?=
 =?utf-8?B?V2ZTVUUyU3hVcXBZRjZOeFF4VzFXL0tIWHVsbVJSNW9idko4Z2dBTTFGbTh5?=
 =?utf-8?B?OFdQQzF5eXlEQVpnUFFnb28xWWJjSEg0Z3E4cVhRWkw0NVVueGttTEtOZUNp?=
 =?utf-8?B?UDlBTlRuVnlaMW5tNmYraGQxSFFYY2dPaVk0SjR3bVIvdWR4ZDFScTZVclhE?=
 =?utf-8?B?Q1hCTE5BNFhWSE1YS2dpbG1HNitJQ04wa1hnSCtTclY5bWQxcFdkMFZUN2RF?=
 =?utf-8?B?NXlialhjMElYYitPaUpjVWJYNUlCbkVVNm5YalNmZnU5M0o3UlhURndKM3pF?=
 =?utf-8?B?UmdOcFVaNmVvOHhjTDJSeEJTU1RYNWQrTXVFMnQ1UWFacDNGL0NXNEphbXFK?=
 =?utf-8?B?SFJ6M2dqemQrREZROEVYYVNBTjZWM3Q0a0ZzOFBvTFk4R3dlQzJSZU42R1pV?=
 =?utf-8?B?Z0RzY0NEYVNmSFdBOHF1TmtiUW9sRUhGRWNqS1ArcjFKaEpteUxMRmVTblp6?=
 =?utf-8?B?T2xpOGxkeDRJaEllcTdpenRLcXF6dUxzeWtQMVhRMTNWTEp2T2pGeUVTakZG?=
 =?utf-8?B?WU1pRUJJTWtlZnBxLzVPNUp0SnU3TG5QT0xMWFh2YWRLZXc0aVIwc0w0ZVhP?=
 =?utf-8?B?Um0rQThQRnpPdEpKbTNuOHRFK0JRWWtPYitFUUNOSWQ1aDdvNllBNEhVZ05p?=
 =?utf-8?B?RGJmNldSNmJkekdMNm1lUEZzeXd0eExDQWtkWFZOOG1VV2NlQitxS1FBZkRU?=
 =?utf-8?B?OHlFajRqVUYyRko3ZElhNHVxL29FWi9ZSEdWb21XQUdDcXpGRXZndU82SG4w?=
 =?utf-8?B?dFlLaGdIK0Q2aGJJVkdzZFl2VTF3VDB5TndQaDdySFFkbjZOWlJNaFlHRktq?=
 =?utf-8?B?TTNIRXY3Nm1meHEwTFpsY0hLbWtadkNvZ0ZPUW04ZUlIQ0FrT1FkaEc5Ylp2?=
 =?utf-8?Q?KcrOyCsiWA/lOcAI0GxZ8Lg55KOQvnNKK7XTu1o?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 02366dbe-e751-493c-5e95-08d921343e1d
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2021 17:24:11.5297
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lUc0quZblceSB4v+p6nq2y7d6CROiVZPV6dMJPty7/98B/e0p4Mccf0X7Mkbbe521k1SPLxzA1pHtx5fJ82CGg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB3212
X-OriginatorOrg: citrix.com

On Thu, May 27, 2021 at 02:25:19PM +0100, Andrew Cooper wrote:
> This reuses the rtm_disable infrastructure, so CPUID derivation works properly
> when TSX is disabled in favour of working PCR3.
> 
> vpmu= is not a supported feature, and having this functionality under tsx=
> centralises all TSX handling.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> CC: Wei Liu <wl@xen.org>
> ---
>  docs/misc/xen-command-line.pandoc | 40 +++++++++++++++---------------
>  xen/arch/x86/cpu/intel.c          |  3 ---
>  xen/arch/x86/cpu/vpmu.c           |  4 +--
>  xen/arch/x86/tsx.c                | 51 +++++++++++++++++++++++++++++++++++++--
>  xen/include/asm-x86/vpmu.h        |  1 -
>  5 files changed, 70 insertions(+), 29 deletions(-)
> 
> diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
> index c32a397a12..a6facc33ea 100644
> --- a/docs/misc/xen-command-line.pandoc
> +++ b/docs/misc/xen-command-line.pandoc
> @@ -2296,14 +2296,21 @@ pages) must also be specified via the tbuf_size parameter.
>  
>  Controls for the use of Transactional Synchronization eXtensions.
>  
> -On Intel parts released in Q3 2019 (with updated microcode), and future parts,
> -a control has been introduced which allows TSX to be turned off.
> +Several microcode updates are relevant:
>  
> -On systems with the ability to turn TSX off, this boolean offers system wide
> -control of whether TSX is enabled or disabled.
> + * March 2019, fixing the TSX memory ordering errata on all TSX-enabled CPUs
> +   to date.  Introduced MSR_TSX_FORCE_ABORT on SKL/SKX/KBL/WHL/CFL parts.  The
> +   errata workaround uses Performance Counter 3, so the user can select
> +   between working TSX and working perfcounters.
>  
> -On parts vulnerable to CVE-2019-11135 / TSX Asynchronous Abort, the following
> -logic applies:
> + * November 2019, fixing the TSX Async Abort speculative vulnerability.
> +   Introduced MSR_TSX_CTRL on all TSX-enabled MDS_NO parts to date,
> +   CLX/WHL-R/CFL-R, with the controls becoming architectural moving forward
> +   and formally retiring HLE from the architecture.  The user can disable TSX
> +   to mitigate TAA, and elect to hide the HLE/RTM CPUID bits.
> +
> +On systems with the ability to disable TSX off, this boolean offers system
> +wide control of whether TSX is enabled or disabled.
>  
>   * An explicit `tsx=` choice is honoured, even if it is `true` and would
>     result in a vulnerable system.
> @@ -2311,10 +2318,14 @@ logic applies:
>   * When no explicit `tsx=` choice is given, parts vulnerable to TAA will be
>     mitigated by disabling TSX, as this is the lowest overhead option.
>  
> - * If the use of TSX is important, the more expensive TAA mitigations can be
> +   If the use of TSX is important, the more expensive TAA mitigations can be
>     opted in to with `smt=0 spec-ctrl=md-clear`, at which point TSX will remain
>     active by default.
>  
> + * When no explicit `tsx=` option is given, parts susceptible to the memory
> +   ordering errata default to `true` to enable working TSX.  Alternatively,
> +   selecting `tsx=0` will disable TSX and restore PCR3 to a working state.
> +
>  ### ucode
>  > `= List of [ <integer> | scan=<bool>, nmi=<bool>, allow-same=<bool> ]`
>  
> @@ -2456,20 +2467,7 @@ provide access to a wealth of low level processor information.
>  
>  *   The `arch` option allows access to the pre-defined architectural events.
>  
> -*   The `rtm-abort` boolean controls a trade-off between working Restricted
> -    Transactional Memory, and working performance counters.
> -
> -    All processors released to date (Q1 2019) supporting Transactional Memory
> -    Extensions suffer an erratum which has been addressed in microcode.
> -
> -    Processors based on the Skylake microarchitecture with up-to-date
> -    microcode internally use performance counter 3 to work around the erratum.
> -    A consequence is that the counter gets reprogrammed whenever an `XBEGIN`
> -    instruction is executed.
> -
> -    An alternative mode exists where PCR3 behaves as before, at the cost of
> -    `XBEGIN` unconditionally aborting.  Enabling `rtm-abort` mode will
> -    activate this alternative mode.
> +*   The `rtm-abort` boolean has been superseded.  Use `tsx=0` instead.
>  
>  *Warning:*
>  As the virtualisation is not 100% safe, don't use the vpmu flag on
> diff --git a/xen/arch/x86/cpu/intel.c b/xen/arch/x86/cpu/intel.c
> index 37439071d9..abf8e206d7 100644
> --- a/xen/arch/x86/cpu/intel.c
> +++ b/xen/arch/x86/cpu/intel.c
> @@ -356,9 +356,6 @@ static void Intel_errata_workarounds(struct cpuinfo_x86 *c)
>  	    (c->x86_model == 29 || c->x86_model == 46 || c->x86_model == 47))
>  		__set_bit(X86_FEATURE_CLFLUSH_MONITOR, c->x86_capability);
>  
> -	if (cpu_has_tsx_force_abort && opt_rtm_abort)
> -		wrmsrl(MSR_TSX_FORCE_ABORT, TSX_FORCE_ABORT_RTM);
> -
>  	probe_c3_errata(c);
>  }
>  
> diff --git a/xen/arch/x86/cpu/vpmu.c b/xen/arch/x86/cpu/vpmu.c
> index d8659c63f8..16e91a3694 100644
> --- a/xen/arch/x86/cpu/vpmu.c
> +++ b/xen/arch/x86/cpu/vpmu.c
> @@ -49,7 +49,6 @@ CHECK_pmu_params;
>  static unsigned int __read_mostly opt_vpmu_enabled;
>  unsigned int __read_mostly vpmu_mode = XENPMU_MODE_OFF;
>  unsigned int __read_mostly vpmu_features = 0;
> -bool __read_mostly opt_rtm_abort;
>  
>  static DEFINE_SPINLOCK(vpmu_lock);
>  static unsigned vpmu_count;
> @@ -79,7 +78,8 @@ static int __init parse_vpmu_params(const char *s)
>          else if ( !cmdline_strcmp(s, "arch") )
>              vpmu_features |= XENPMU_FEATURE_ARCH_ONLY;
>          else if ( (val = parse_boolean("rtm-abort", s, ss)) >= 0 )
> -            opt_rtm_abort = val;
> +            printk(XENLOG_WARNING
> +                   "'rtm-abort=<bool>' superseded.  Use 'tsx=<bool>' instead\n");
>          else
>              rc = -EINVAL;
>  
> diff --git a/xen/arch/x86/tsx.c b/xen/arch/x86/tsx.c
> index 98ecb71a4a..338191df7f 100644
> --- a/xen/arch/x86/tsx.c
> +++ b/xen/arch/x86/tsx.c
> @@ -6,7 +6,9 @@
>   * Valid values:
>   *   1 => Explicit tsx=1
>   *   0 => Explicit tsx=0
> - *  -1 => Default, implicit tsx=1, may change to 0 to mitigate TAA
> + *  -1 => Default, altered to 0/1 (if unspecified) by:
> + *                 - TAA heuristics/settings for speculative safety
> + *                 - "TSX vs PCR3" select for TSX memory ordering safety
>   *  -3 => Implicit tsx=1 (feed-through from spec-ctrl=0)
>   *
>   * This is arranged such that the bottom bit encodes whether TSX is actually
> @@ -50,6 +52,26 @@ void tsx_init(void)
>  
>          cpu_has_tsx_ctrl = !!(caps & ARCH_CAPS_TSX_CTRL);
>  
> +        if ( cpu_has_tsx_force_abort )
> +        {
> +            /*
> +             * On an early TSX-enable Skylake part subject to the memory
> +             * ordering erratum, with at least the March 2019 microcode.
> +             */
> +
> +            /*
> +             * If no explicit tsx= option is provided, pick a default.
> +             *
> +             * This deliberately overrides the implicit opt_tsx=-3 from
> +             * `spec-ctrl=0` because:
> +             * - parse_spec_ctrl() ran before any CPU details where know.
> +             * - We now know we're running on a CPU not affected by TAA (as
> +             *   TSX_FORCE_ABORT is enumerated).
> +             */
> +            if ( opt_tsx < 0 )
> +                opt_tsx = 1;
> +        }
> +
>          /*
>           * The TSX features (HLE/RTM) are handled specially.  They both
>           * enumerate features but, on certain parts, have mechanisms to be
> @@ -75,6 +97,12 @@ void tsx_init(void)
>          }
>      }
>  
> +    /*
> +     * Note: MSR_TSX_CTRL is enumerated on TSX-enabled MDS_NO and later parts.
> +     * MSR_TSX_FORCE_ABORT is enumerated on TSX-enabled pre-MDS_NO Skylake
> +     * parts only.  The two features are on a disjoint set of CPUs, and not
> +     * offered to guests by hypervisors.
> +     */
>      if ( cpu_has_tsx_ctrl )
>      {
>          uint32_t hi, lo;
> @@ -90,9 +118,28 @@ void tsx_init(void)
>  
>          wrmsr(MSR_TSX_CTRL, lo, hi);
>      }
> +    else if ( cpu_has_tsx_force_abort )
> +    {
> +        /*
> +         * On an early TSX-enable Skylake part subject to the memory ordering
> +         * erratum, with at least the March 2019 microcode.
> +         */
> +        uint32_t hi, lo;
> +
> +        rdmsr(MSR_TSX_FORCE_ABORT, lo, hi);
> +
> +        /* Check bottom bit only.  Higher bits are various sentinels. */
> +        rtm_disabled = !(opt_tsx & 1);

I think you also calculate rtm_disabled in the previous if case
(cpu_has_tsx_ctrl), maybe that could be pulled out?

Thanks, Roger.

