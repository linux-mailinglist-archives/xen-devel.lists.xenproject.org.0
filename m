Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 60D6E380656
	for <lists+xen-devel@lfdr.de>; Fri, 14 May 2021 11:36:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.127278.239180 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lhUF9-0006ot-9s; Fri, 14 May 2021 09:36:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 127278.239180; Fri, 14 May 2021 09:36:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lhUF9-0006m9-65; Fri, 14 May 2021 09:36:27 +0000
Received: by outflank-mailman (input) for mailman id 127278;
 Fri, 14 May 2021 09:36:26 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6p66=KJ=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lhUF7-0006m3-Qc
 for xen-devel@lists.xenproject.org; Fri, 14 May 2021 09:36:26 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1c8f95f4-9aec-4ae2-b841-5f76460f2ff5;
 Fri, 14 May 2021 09:36:24 +0000 (UTC)
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
X-Inumbo-ID: 1c8f95f4-9aec-4ae2-b841-5f76460f2ff5
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1620984984;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=PDGEfs1Mj7mGII5pOVsH/w5XrXO7fByhkGskNpfqjzs=;
  b=GQk270OlFT6K9Sv/u/YO/dXlyduu5k1dn4ilVuG7oRZxRn85tyttNCvY
   uEkxawRGKMhKduHaNaVw8TMxSfJKrtPs3i7FTzcsqmS2uuhHCn4Mk01x+
   FnXHTXtieUhsqaVHMepolNjW1z7rLSCvlWDmE2zGwVCFK/G4orkei0qnD
   Y=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 2HR/JhpxVyPlBjBUFruYbJ84y5Ju5BB8pK+YQHptqraxqJc1GQtlm7yTaM2s64zFZWl0Lh+hOS
 RrpDhnaUpuA/B+5vsAwUaPgzPFUjSNmA4jrW/h6ehh2bS6obsXoEXQS/9mFKaLZDkekhW6BTYJ
 g2F1tdrJspkBUKV1PdesTmP0hqbSvsxZTPfXXXABNN9rLE6F1x/LpCmn9YkshtSaCYRquEbQ15
 rN9TqAChn86zEixlDuLNYKgdEVPpgNBgU8wYU/m607eXOepIHBLBiV1HK+HMLeU4jdUfRttETe
 l/M=
X-SBRS: 5.1
X-MesageID: 43588709
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:vilYsa0Sc56uNSvGFv9x3AqjBbByeYIsimQD101hICG9Lfb3qy
 n+ppsmPEHP5Ar5OEtBpTiBUJPwJ0800aQFnLX5XI3SJjUO3VHIEGgM1/qG/9SNIVybygcZ79
 YdT0EcMqyBMbEZt7eD3ODQKb9Jq7PrgcPY55at854ud3AQV0gJ1XYJNu/xKDwOeOApP+tfKH
 LKjfA32QZINE5nIvhSaRI+Lqf+juyOsKijTQ8NBhYh5gXLpyiv8qTGHx+R2Qpbey9TwJ85mF
 K10zDR1+GGibWW2xXc32jc49B9g9360OZOA8SKl4w8NijssAC1f45sMofy/QzdmNvfqmrCre
 O85ivJZ69ImjfslyCO0FXQMjDboXUTAySI8y7evZOLyvaJNw7TCKJ69Mlkm1XimgwdVHwV6t
 M844ujjesiMfr3plW02zH5bWAeqqOKmwtUrQcytQ0UbWJMUs4dkWQglHklWavoSxiKl7zPVt
 MeVf3h2A==
X-IronPort-AV: E=Sophos;i="5.82,299,1613451600"; 
   d="scan'208";a="43588709"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jSZQ2OLuLkBBylV1GiY+djKviXf7avekLXJslaRcfsTI33g6Xsnf3DcWal1NI6BylSIQjFNwzq9Yg1066ABno/4jBfw/LnLd+V9M3aA7Fj+SxFQHf5bEZgLlm1bmj2q07pr30Tf9uJ+s6RKK+pyca1sN2twr9xl1YrrtZjFK831Sq7mH/5npbeKVhpMotuwL86t72RjONLjJSSzCVm8K8KrWZbxD0wwOxUuFuMUDX1+J9CPCDjfvB1uOPXcUdffX9ODN55MEq6yfNaYe8JPRdQHrNSge9wjQXNL+YUTbEQlI01zLlyKaYSZVDFGUVWRk6ljAmN+l9x/1vXKyyBxYpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oFY+P0vCHwC1ZGQbL3Mljf4Z3Nq0ZT0Q6qIFdYRgqhg=;
 b=bjokIZjubOsJn+uzI1on0p3sySymg4/5dtQMo1EwSU90ZPAd82CPRYfp0gfb5ERCjmHrV27TBY/OLlmdoxTcE5r0skUVUUH7LfJmNyJDR7Y1o4fzELeQk7jND+ay74/Ttf+U1r28+Ni1CTErAJKxcbZNRLLSC/rcI04ViV0ZZ4c2/R4KSkGbj7FNySp8KExdyH9jHq/EaZmW7U/6wrTEvadMMy6IKi+fUcTjRzUGQq/6CFtvlw4RZXf3600SiVs32IlViOtrgIdxFZ+2D67Xwh7phRqwb0vvdjSFuJhhKK4EOL3WhZ2o8uqMN1K9QkFSYxr29g/N0h8ml8Sh1L3EBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oFY+P0vCHwC1ZGQbL3Mljf4Z3Nq0ZT0Q6qIFdYRgqhg=;
 b=v4Oy/n0LnT6Vz2GczUEkjPFz6+3l9px71LYYAB3B+zcUQ2rGgrMc9pIh5kFbvMAOPpyj0+KwPylEnH90dcPNqmnrfcW4BgimeaYAgK7miDO2uAz/ClreTAC7PHhhOFdk7eUUVfhsIjraNVwoAzepik1sk+gjCMLZXFvBTX7CW6g=
Date: Fri, 14 May 2021 11:36:14 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson
	<iwj@xenproject.org>, Wei Liu <wl@xen.org>, Anthony PERARD
	<anthony.perard@citrix.com>
Subject: Re: [PATCH v4 09/10] libs/{light,guest}: implement
 xc_cpuid_apply_policy in libxl
Message-ID: <YJ5EjsgzVXFDqlE1@Air-de-Roger>
References: <20210507110422.24608-1-roger.pau@citrix.com>
 <20210507110422.24608-10-roger.pau@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210507110422.24608-10-roger.pau@citrix.com>
X-ClientProxiedBy: AM8P190CA0011.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:20b:219::16) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ae3f4536-1c9f-4ae1-eea2-08d916bbbb6f
X-MS-TrafficTypeDiagnostic: DM6PR03MB5083:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB50833DFB978374D8A2B98CF38F509@DM6PR03MB5083.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: K44YVnAPfUPcgI0tzN+Aa5pd89F3MRHNrLtYamt9bx4Y6n/Rz0fT9O7GrR3x8svJN4yeNaQP0Fccrxn08I6go2y6ZUbs52eoT2SDk2IWHicYGNfTKgnKEb4GUUc3WyAVeLbGXXnMVIBkVgvXeIBm8mX2DVZKT2hejbGxE5qSRQPHM/UqywdahhoxTdSlB876w1GdlK9S+YMaE9QYSmBxIuIn2gXv3N2/IWJKKka/aQav8NmzDrGeBf/FGzoi8i1aCUq/291962coswVOZRPaingkkkyUr1riPw1gS3elDYDnMfq04EKI4HkGOyV3dVlAuzUFDRlzZUF5Qpi55EOCZ2+3jpm8AA90ISoRheBVbHy7D8wh0UkLMUAY8BQrcmc84zUZieE64P7nDl9kOPPSXb9nfenpRDAuR6wHXpVUYn/I83oSfCV3RGBml7eGnBRp+9F3o4pOGtcwy0YjCkG8VuMidXuBewTbh5U5Gk9BNY0kmYj4Ns4fVeM17TRDR2qkNEoHIQZe9D0gyeMz8ybGE9ju//hxehwKTPIopntFOEUGSESYBg/r/R1OVJonuIhic5Ghk4aVhPf7qI9hqpFe0r/3YTQGgky/SZkFatfGygg=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(39850400004)(376002)(136003)(346002)(396003)(366004)(4326008)(16526019)(8676002)(186003)(33716001)(6666004)(5660300002)(316002)(6496006)(6916009)(86362001)(38100700002)(66946007)(6486002)(66476007)(956004)(83380400001)(54906003)(8936002)(66556008)(26005)(2906002)(4744005)(107886003)(478600001)(85182001)(9686003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?cGhPaEJiWkRReEcycmZrU2RVM1BsR2l0aU1wWnlmMGJzNHp6R2RjWnBwdlhh?=
 =?utf-8?B?TmtkYmd6MTFnSytpT3V5YU9KYk5Cbno2aUZpSGZNT3JwelFlQk1LQW1IT3FM?=
 =?utf-8?B?L0dBR3RIVUNhY3NGWjRHMnoxNUcyU294KzJyWmE1WEFDWWJKVDJkYVorcE9J?=
 =?utf-8?B?T2pLcGo0bGdJL2RiT0JxZS9rcy9Yd0Y5SkFoNEpoWVp3a0U0TGdmcEgvMFZ6?=
 =?utf-8?B?aU9HUTNzb3pVQ1lFOEZCR3BzNVVIMGQ2N3pSVXFmMEJDWHJoTDJzQkExYmg5?=
 =?utf-8?B?S3QwUVNFRXFhdVlDK2tZaVhvclF5S05MaENTS1M1a3Uvc0crUEhRMXZ5YWYx?=
 =?utf-8?B?eS9NcW90SnlZakoxSDUyZ2w5dm1Cb3FLRXVxbit0QWZmam8xaHJGczhNT0Rh?=
 =?utf-8?B?L3pVOE1ESXNHcldDVEcwakVobjEwZ3Z4ekVJMnVVT1ZsOWhNSFJ6Q3pGZTdj?=
 =?utf-8?B?eUk1T0ROVmlSdERuKzNmWllzR1g2NmgzU3Qzdy9SRS94cStTZVlKM1ozZWpm?=
 =?utf-8?B?UitFQkw3dXh2U3gwL3p1MDJzbGhHS2RvYnFPMUtXWmt3cVJ4a1RJMzhCYWk3?=
 =?utf-8?B?TkF3NjlUQzV3RURvYmlibE9jdEVibEEzd09oNkU3ZHlxZmh5MG1ub0JIaHJx?=
 =?utf-8?B?b0VWMXk5eGVObXd4ajZKQjVlV1dZR2U3VVZlMXBrMWJTdFJDejVMRnAzTHVZ?=
 =?utf-8?B?WXlhMUw1V3RPanlTOHA5WDc5UDZ3Z2lIbVJsZGU3RTB6cTZHUFBmUlJXOWpI?=
 =?utf-8?B?WmpFNkEzYnFkcVovL0ovaEVXVEgrTEExSVBpa09rOUxFdzlNaGtlRHZPeWR1?=
 =?utf-8?B?SlVzR25xaWtubmlXWVlvYnV3TmJVd2tiTGpmcDNVbGdYS3JlV0V4Qyt5L3pR?=
 =?utf-8?B?bC84NFVqbUhjbTBVUmdaa2dXakIraTVGTnFtaFpVMW05TlJYYUcwSnJVdC9a?=
 =?utf-8?B?MWVFS0ErSEFGZTlBend0NE9obVFDZ2pmZFR2TDhFOE1SRTVnY0I5bUlTMEp3?=
 =?utf-8?B?R2J6UWV3cTdtM0xvUXQySHRoUkpsNVUxUkxjRXVrTmNGK1I2RUttNm93ZTYy?=
 =?utf-8?B?Y1dETXRkeWVFUVRoaWxUSzVtdWxaa1AxNEpEQUt1ejBpUURXL2RpcTZyNFlG?=
 =?utf-8?B?Q2IyRG42cU5YWFVkY3AwdXl4WmRkVGU0S29SN0FiS2RZTXNqT0lxVndQK1Ja?=
 =?utf-8?B?MWM3cVJYK0RNOFdobVRGQmVweGwwR1V0QjFXL0c4RzBNbVY5b1NSVlNPekFG?=
 =?utf-8?B?KzR5VHIrbHgrc1JhNll6SUR4aDY5WHN5VTVRRzFsSEZwMUtJdk5vR0pJZGo2?=
 =?utf-8?B?UHdOVmp1SDJFd09mbFBlNzZzUVk3MGtQQU9qUGVLMDJBMUZKOW84RDNrdTEy?=
 =?utf-8?B?dHlCR2VVWlRUMmRqb09QRFBCbGV2RmMvdTJDNCtGR0VwMEtsbUNTbzliMDhR?=
 =?utf-8?B?ZFBiQnFLeDJMVW9TeFZGWVhzcTk0aHkrNmxhOTVTMVU5dFBtMjlVQjJNT0hC?=
 =?utf-8?B?cDBObm4xdXhkTnhmL0lJKyt5U1pDRmtjRFgreE52T2tlai9SUkcvOTkxQ3o2?=
 =?utf-8?B?ZnlsUGRWaGhnWTZoR2NDcVRjTGc3dGtlSThBNlpyVTFoaHEycUlvWDFBWnhC?=
 =?utf-8?B?bmtBWElZdml6ZVNlaTRudWp5MjdKMEdHdDlNbjZ6SVRwME1yZ3lLOUl2dVRw?=
 =?utf-8?B?RVJUWWNvMU9SbDYxYmZCTkxkckI5Y1FlQWs2Q1NEcWgzejFpdFlLbStKMlFP?=
 =?utf-8?Q?Y+Arj+uu0XKQhYzcQyRhlvciKK231IlgMSzuoRd?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ae3f4536-1c9f-4ae1-eea2-08d916bbbb6f
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2021 09:36:20.9952
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E4Ne58eCSO43mxZ25P37rVvdffgxD36L8bN0beKDzV16OEw+hAGdtcgq1gBuAsdvMaAvxc2KQLM88Zvs+xTGtg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5083
X-OriginatorOrg: citrix.com

On Fri, May 07, 2021 at 01:04:21PM +0200, Roger Pau Monne wrote:
> diff --git a/tools/libs/light/libxl_cpuid.c b/tools/libs/light/libxl_cpuid.c
> index eb6feaa96d1..6d17e89191f 100644
> --- a/tools/libs/light/libxl_cpuid.c
> +++ b/tools/libs/light/libxl_cpuid.c
> @@ -430,9 +430,11 @@ int libxl__cpuid_legacy(libxl_ctx *ctx, uint32_t domid, bool restore,
>                          libxl_domain_build_info *info)
>  {
>      GC_INIT(ctx);
> +    xc_cpu_policy_t *policy = NULL;
> +    bool hvm = info->type == LIBXL_DOMAIN_TYPE_HVM;

This is wrong and should instead be:

bool hvm = info->type != LIBXL_DOMAIN_TYPE_PV;

To account for libxl having a different domain type for PVH. I've
fixed it on my local copy of the patch.

Maybe the variable should also have a different name? I really cannot
think of any other name short of 'translated' or hvm_container. Let me
know if I should change the variable name.

Roger.

