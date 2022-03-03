Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 602F74CBB84
	for <lists+xen-devel@lfdr.de>; Thu,  3 Mar 2022 11:37:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.283054.481937 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nPipg-0006uQ-Kl; Thu, 03 Mar 2022 10:37:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 283054.481937; Thu, 03 Mar 2022 10:37:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nPipg-0006rC-HN; Thu, 03 Mar 2022 10:37:16 +0000
Received: by outflank-mailman (input) for mailman id 283054;
 Thu, 03 Mar 2022 10:37:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NyQH=TO=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nPipe-0006r1-PT
 for xen-devel@lists.xenproject.org; Thu, 03 Mar 2022 10:37:14 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e3411698-9add-11ec-8eba-a37418f5ba1a;
 Thu, 03 Mar 2022 11:37:13 +0100 (CET)
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur02lp2056.outbound.protection.outlook.com [104.47.4.56]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-33-zlrstAdNNt2Ozab-kUeVMg-2; Thu, 03 Mar 2022 11:37:12 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by AM5PR0402MB2836.eurprd04.prod.outlook.com (2603:10a6:203:9c::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.26; Thu, 3 Mar
 2022 10:37:10 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%6]) with mapi id 15.20.5038.014; Thu, 3 Mar 2022
 10:37:10 +0000
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
X-Inumbo-ID: e3411698-9add-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1646303833;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8E3RCyIW0RgEyy9HViPcUuRfEwybAzF6dZQbN9GiutQ=;
	b=Sd32mRskojwSmvvbCYplbAL+Aa35NtI9WwTG+RooJ+nAKk2y5i5he8Y40+Csrd0E1r7tBR
	HL6yldyGPFt6nnEZBV+N8TCAWfg6Po1D3Lh8yF/e/xxlUYA9MCJV4YsdnHRMujLpotiZsI
	ZLod2jH5zdascAxLM38N74VOSMosvTE=
X-MC-Unique: zlrstAdNNt2Ozab-kUeVMg-2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=huBjHBx/0wMZDUxV/GWEOSgz4BKn/qJDFEmQLZfHYHLa4A+wARSi8U3lULGG2tMHMwpw646pVx+O/QO/yibi+Wpjk289yPaW0vIzB6mS1wB8/lbATZA28NTTdh34ZNM5VhXxTOF5Z12YyraKcDLoMLswpnjKK5HE9PPDfrTIroOuSuCSrtkUfDoDC0lzVac/LDf0yHMCYe6+9If8MgWxuTsn8GSRqkZwmHlrnDjxdAMoGFF2awxI3hhhqlThLosASFptNJjhGkTqXkIdp3Mk0bEdMJGwyJaLlAPy7S+2UB3ifbhWDJbhaHh196M8uKtrg8kfU5PsilSSm4gMjBhuhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8E3RCyIW0RgEyy9HViPcUuRfEwybAzF6dZQbN9GiutQ=;
 b=HwEWkWra9DxPYwAMY+g81RKt+IQcd8pCVFJrG5cvAnR6mLCWdFuitJ3Su3rJxH8vQkJBtH7AQcvle6xSlNPUicmsyR79b4pBOV5+fPdyxy+jracvf7WiqUw8yowLvDke0TqzOFSozBRiadqAJ0/KkkNHveuWjOhtvPERkArXiVjXBA6jVr9Iw1Uoih6gh/aDbgzwL7EC4esYUaFeS//DkCARi8E0wlvpQOF5YvQmPGmkCs5jqYhj9sH3wtvYqY2fhMfyoYWhMyuQczf7/n3xfH4wgsY39JGzpFVDMfGZcVnrplLmm88VqS5zGBRCnSjZWnCC66IWefxX9ZV/Yms+vg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <3bde2fea-f3fd-3926-b98d-aa0afb549bf8@suse.com>
Date: Thu, 3 Mar 2022 11:37:08 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [XEN PATCH v9 24/30] build: grab common EFI source files in arch
 specific dir
Content-Language: en-US
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20220125110103.3527686-1-anthony.perard@citrix.com>
 <20220125110103.3527686-25-anthony.perard@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220125110103.3527686-25-anthony.perard@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0124.eurprd06.prod.outlook.com
 (2603:10a6:20b:467::33) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ac44fe53-e442-4d65-d252-08d9fd01c5a5
X-MS-TrafficTypeDiagnostic: AM5PR0402MB2836:EE_
X-Microsoft-Antispam-PRVS:
	<AM5PR0402MB28368DC2D5D976DFCECE9892B3049@AM5PR0402MB2836.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	hnD5FmRkrvp6eBssjkbhV23cKRbAoggKFEG0QqL7tJuHQiLf0fZGl6/qVpSnydYrTgxpVi3bR0hPx9cyaDVTyTCDSmZpCZ9g1EWN/mwalHu2NCM60UFb8J4gPpRsq9CI7RnToyCsfd77Q6NdTt2s/VJ4xuveboZo4/GDudCIHocT1FG59kqeIdPpwzTOeuNLhkf2Hj7FRXLk33H9rdohtmwC/juym2eK0+XGBBLuubv8TLfTv0lVdErdR0gNmYo8CQViz+I9cHpVRkjdkyyv4wE+62ecdIP4DwdVt9mFDhXEa2MBslraJrr8iHMYAjmKvCxD3Zr13jMtipvPor5V6WhC/tSwNor7T+SpwO5g1C0NmoF5kcvM1Y9Q+RiTOutWJkbULE6cIWfE2Np6ZqJTjhRIVR4M25kX9z0HJPRkgYVRUTG8VOLDkyaoqSCMGZzdNgV4Xm36xONcezu3RWwQlFcA5woftrmtx7G1v9vJw91Y+cb6zXi5Da2cMcG0hEiJocAm/q6fI+1Mtq+RBEKVVTWzk4bMx5txk+YCV2chEW4y9ssTWvrco8CuO1JU/58m7Zh9HAGehJY7Hlw9Z0zPzIw55jE+1DI9oBtXMG7RK6L/VSa+3dzTxuT/mXMKxXIKlP7sIeReA48uRBAYkPwF9vqcFaXMkaml/tI2fBvuHJk3j9SFMwN0MRtz0Pt7UW4lIYWkWNLxJagXuzoOQTNRg4uEu2j/HIrUGnrUD2C3GyM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(53546011)(54906003)(6916009)(186003)(6506007)(6512007)(31686004)(5660300002)(36756003)(2616005)(508600001)(6486002)(2906002)(38100700002)(4326008)(66946007)(8676002)(66556008)(66476007)(26005)(8936002)(7416002)(316002)(86362001)(31696002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SEVQV2F5Z21CRmM4dmdsM3U0N0tWUWFVUTdDUkJqY0hjNTNyU0h5VEdRemx2?=
 =?utf-8?B?enIwbEpxSkVwSC9heTU4eTQ5NDJIdExOMndlZ0JzT0Rpa1B0QWd5ZnNnNlVl?=
 =?utf-8?B?NjNnb3BTZE5xd0Y1WlFEL1BVb1EwbUJDcHlKRnl1c3Rkc0o5RjUxY3JwU0ZK?=
 =?utf-8?B?Z3BzdFk2TnJ3SkNNK3FYbnNSUTdJTGt0ZXROTVNGOTRYejBndDZLRUZaSklp?=
 =?utf-8?B?Z3hoU3Nkd0ZLY0p3YzcvaWxaMVhxOXM0dksyZ213NXpXMjZBQi9QVXFWUlYy?=
 =?utf-8?B?VzlSOVZtaWZxbVJhS1VSL1RVRVpVSVNTcFNSRkR4N3lQbmZKYTZzWW5Lc3Qx?=
 =?utf-8?B?azVVZlBnaWM0VkZGNUpaM3BBMzdTV3FCMG9UR1VTVm1MaUpFenBkdmFFa3dE?=
 =?utf-8?B?d0pkb3lhOWM1eFRYcjAyeS8rS2dCK2x3SU9TOVNFVDJFVDR3WDJmWHJESE9h?=
 =?utf-8?B?QVkxQldGK3gybnZobzBXSEhtVjdqaTBLL0Z4eXJ4ZjFvaUtYOURiMzVQeVp4?=
 =?utf-8?B?aWFBcVlhcXpBb0c3WjRiL095K1FtYTBubzZwZzJUNFhTSGx1dnNycTgxajRn?=
 =?utf-8?B?VEN6SGdtaVRXOWZGa3BhTjVTbncrTUF0R3VmS1VMS2tSOXJuR2dxVGVlYkVx?=
 =?utf-8?B?Vlg0emFEcUhkZk5rUlJYNG5KQklWdEY5OUwyN0JsSzJhT1ZRYWxHV2xBWVdB?=
 =?utf-8?B?OEsrZFVPbS83L2JUZ0M1aWxZRlRJVEtPNjV4R1BYVjRJQU9OeDJxV1JWU1NY?=
 =?utf-8?B?NGxNalJ3U0xkL0R4Ym9NNnF2QkFIbHBQYlk2ME93eUpzUzhjMmU1ZkZnVUJt?=
 =?utf-8?B?b3QzVDdSVFpKazM5QWthVkp2aElrYUlhbEwyQ0U5TDNEeTNrejFDMG5Wcjl5?=
 =?utf-8?B?VGtiaVNsVWpXNFM0RW1GMFVsZnBqZ1dseFkzQXErNE4wZUNjUnI0NFNWbzJF?=
 =?utf-8?B?d2J4d0ttcFQwZjVPalRiWWJYeHR3NXVqRnpSUnpxTG1XTlYvSXFVTGZhRWJy?=
 =?utf-8?B?RjFtMkFVUDNZeVkrQ3dmc3BqWGpjZTBLdVVuR1JkL29hTDBJeGNmTTRmaDYw?=
 =?utf-8?B?aTIvMmNVc24vOE5VaWNreWdjbnFId1JzNHVxQnVFT3l3Z3FBejVxVm43UTls?=
 =?utf-8?B?dEQ1OGQ3OG1NZEFkcFlkekVqT2hPdzZTLzFuQVo0OFFEVGJtM2pwNnFNNzRP?=
 =?utf-8?B?V2RTd3A3YSsrcXo1VTZzMjN0NndaYzNIU1ZZOWlkVjh1MDFpM1AwbllBWnYx?=
 =?utf-8?B?UkNrNkxRTmdWRjFCSnpjb1NWWG1WZUx3Ym8xVkQ2WEtJREFrU0ZDd3ZGa21N?=
 =?utf-8?B?dDZyUXc4bXdSR2x2MGZIZDViZHNMd0hXL2FrVnBINnFBUXBEcFV2MzNPancr?=
 =?utf-8?B?ODU1NVpKM1ZRY0R2MVNuWVd3d29NUnA0d1hWYUVIQ3c2d1hvYTRJRTJNalNi?=
 =?utf-8?B?UzBJb3ZPK1F6SWlPc1N3MnlVWUZRUlNNa2FSSXhoUlZ0UTk1REpqelpWQWVS?=
 =?utf-8?B?bERBQUdlQ2dZYVFkdk02cmVOOGx4cW1YclhCQUZMRUdjd01UdnBCSU14Nk9B?=
 =?utf-8?B?cnJ6N3FWOVdJTnFVQldqZ3gvL1paOTZJSm9rSTJ5SG13eTh1aEg3N28wcGM3?=
 =?utf-8?B?OERaS3kzVEI2Vm9jUXlrR1c4Z3FkVlhvcTRNMWZjTVZMb284SzNCcGdKWHh4?=
 =?utf-8?B?eXQrSXA4WUVSb0JnUGJ0R0xQNjl5ME8yWG9XTzR2RzNBUWNUcEc5Tyt2VWUr?=
 =?utf-8?B?eDc0cHY3ZTJlbFBaenZhZ0FHR1h1bUc2ZnJ0dXhWaUlSNG0rbHEyZnZuenFG?=
 =?utf-8?B?eHVCNEtrTmluUE5xL2FTK1N5SlAxcXVrNXFaY2p5TVpmdFZ2YzZ6SENXaExv?=
 =?utf-8?B?dlZiS1IzY1VjNWx2ZStvRXJtN1dIMzFXeWYyTjV1N2tyYjBzUW1TeUUxc0xi?=
 =?utf-8?B?akJKN0I0ZkhUTmRUZ1gzUU56UDZCUmJtd0RHajRxMDZtcWVCclRaeG9mQkFW?=
 =?utf-8?B?Rk8rcDhGODVtL0hZSng4NnM0TmVPL2lrZkFhVVhham1RTkZTZnFRdThaQm9B?=
 =?utf-8?B?QXlQUDhSVlFsT29UWTQ4WHdURnByelNhOWpZbWdmUnpKVmgxTFNiMzR2ajJu?=
 =?utf-8?B?eGlhT0ZUQUc0ODRxdGovQzlvN1hvTmVwNGYrVWdXQ3VNaWZjcU9abTFDUTFO?=
 =?utf-8?Q?PMEqWDFd966LeSfXboTxSqA=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ac44fe53-e442-4d65-d252-08d9fd01c5a5
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2022 10:37:10.4284
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +wGmRaJSy+SyKNDb8xVSer2WZkRURJb4XRdP2TbcqwSQu3PT1Gw2ky8mZNEE3aQRicD1pwbIuscNlt/cnHcL/w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0402MB2836

On 25.01.2022 12:00, Anthony PERARD wrote:
> --- a/xen/arch/x86/Makefile
> +++ b/xen/arch/x86/Makefile
> @@ -77,8 +77,9 @@ obj-$(CONFIG_COMPAT) += x86_64/platform_hypercall.o
>  obj-y += sysctl.o
>  endif
>  
> -# Allows "clean" to descend into boot/
> +# Allows "clean" to descend
>  subdir- += boot
> +subdir- += efi

No similar addition is needed for Arm?

> --- /dev/null
> +++ b/xen/common/efi/efi-common.mk
> @@ -0,0 +1,15 @@
> +EFIOBJ-y := boot.init.o pe.init.o ebmalloc.o runtime.o
> +EFIOBJ-$(CONFIG_COMPAT) += compat.o
> +
> +CFLAGS-y += -fshort-wchar
> +CFLAGS-y += -iquote $(srctree)/common/efi
> +
> +# Part of the command line transforms $(obj) in to a relative reverted path.
> +# e.g.: It transforms "dir/foo/bar" into successively
> +#       "dir foo bar", ".. .. ..", "../../.."
> +$(obj)/%.c: $(srctree)/common/efi/%.c FORCE
> +	$(Q)ln -nfs $(subst $(space),/,$(patsubst %,..,$(subst /, ,$(obj))))/common/efi/$(<F) $@

What is the "reverted" about in the comment? Also (nit) I think you want
s/in to/into/.

Jan


