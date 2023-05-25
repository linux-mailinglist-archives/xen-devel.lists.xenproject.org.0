Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 108D0710C16
	for <lists+xen-devel@lfdr.de>; Thu, 25 May 2023 14:30:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.539559.840561 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q2A5n-0007nq-2U; Thu, 25 May 2023 12:29:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 539559.840561; Thu, 25 May 2023 12:29:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q2A5m-0007lI-VS; Thu, 25 May 2023 12:29:18 +0000
Received: by outflank-mailman (input) for mailman id 539559;
 Thu, 25 May 2023 12:29:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xzDE=BO=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1q2A5m-0007lC-5Y
 for xen-devel@lists.xenproject.org; Thu, 25 May 2023 12:29:18 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2048.outbound.protection.outlook.com [40.107.7.48])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c3e02087-faf7-11ed-b230-6b7b168915f2;
 Thu, 25 May 2023 14:29:17 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB9PR04MB8412.eurprd04.prod.outlook.com (2603:10a6:10:24d::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.16; Thu, 25 May
 2023 12:28:47 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6433.016; Thu, 25 May 2023
 12:28:47 +0000
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
X-Inumbo-ID: c3e02087-faf7-11ed-b230-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GUs3IaAk/BVTsfBldSaYOO5Ac0vIrHJwRPpzxfv3S3JTGw5wr2ExfkDbSFoG8KE1YC7E3EAPVrV48X5yOpft7pIjUgBT8/fyU4j58ZTAyhdW5O9awSUkMWDwBd0xVpQFp/lKt5JKLWVmlG6m5O0oB0hheJgSv1ifRdZzRu5Mdbvwx7Y7Kqy37cEQIbhzWbfOKMZrIDLtTuH1bE7xdbZUzRVf7KXdfLVyrE4BfCdA/RYo7EtHeGr/b135Mp6E0oAR3wiaOP/ua1GlGu+cSwGWNj6svkW4BMqo+g5JO68TCZnUVAoS0hz2A5F/m51aYGESMmBj8S1NVagos/9WMFXNAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y6xkpF3UdqhiGgHXn/x/bWlWeO+PYGhF6H4b6VKbcO4=;
 b=J/ZAdoNrxVTTKFOhSOEvpwIiDwpq0zPWTnu/nkBDn7IKeLyr2PigxDaZI5wJX4ru5mkTp+88m7cIYkkee5CBgutRmYZLdB/z658Yjna2bQdf9BvAwlqPTxir+SkoXq3aaKwDDDYA4i00Umeh0SFty3FxHpIgbsnX8vIrAyoF0qKUXUAm9dGDjdKj/TpY1o6IJ+4/qqbrZEusnQKPeIhTCZ40NLfI9hjoEt9CGYTDzEwyS2/bgx9vu8e+0ntCo/D+GCJwhkl6hOBEBMYifplipskMfah0ZV3m7wWQtSOvQBfQOnRTborl51BWYCi1tJc9GJ8WeaT7Ai32L5tZFfHKVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y6xkpF3UdqhiGgHXn/x/bWlWeO+PYGhF6H4b6VKbcO4=;
 b=XwUlgV5LovBnUuTUud8jNXJJSLppUh/+yl/Lz/BXdpN1+t4docRNCww4E8/Xo9aJ2SvNSdOLMiGRr9axFk8QAOyOV8LcQz5sVhMfcTdGAkUPurgldYHytb1sxOT+MjDUkdJnuk/Uvebx1jBITGW/NmOQJTjczKoeZLKxrvZGWQJIditVUX0Y4FzfEh4HvCBeLKcwQgdRmuWZiAWjWkeSE2GgEpzaO5P55a3KoU6HG7yJv+VUSgO/jKqQSmWvFFxRSi6lPlgqRpr4sKM2cmR0LsvG92fzB9fDMORlqtCnEMh3Ibpvlaqtt2bkL9v+79mzR/jL8cfha8p+dSgb6bWhXA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <85728cb9-f538-e48d-2b57-3abdc793dbc8@suse.com>
Date: Thu, 25 May 2023 14:28:45 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [XEN PATCH 11/15] build: rename CFLAGS to XEN_CFLAGS in
 xen/Makefile
Content-Language: en-US
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
References: <20230523163811.30792-1-anthony.perard@citrix.com>
 <20230523163811.30792-12-anthony.perard@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230523163811.30792-12-anthony.perard@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0162.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:99::12) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DB9PR04MB8412:EE_
X-MS-Office365-Filtering-Correlation-Id: 297949e2-d4b3-449a-8b4a-08db5d1b9671
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	iRN1LhU2Mro5ZmFPksp6+qbUZzxZwC0XilT8aScqI0c4Dkv9ATK7pDK7coHR7A0hJbRXoUaNsvPggkvbmYf3TIXMDUB9R6s/nRaLTNSf0BaCYGnpXgTJeS3eC0Y6u1FGMj14wb5bqbo2O+Pp9kCKe8zqpGeYndpJ3FlQ3Gh60qdZFvSwBqbby7FKbTZ4fXVyETP3rVLEL94l6LKQsAkzpNYZswVmo/HkycCo9EX3qor6uMed5/YjkkiA7isJR23LXx8M/ajq/lXz4jLvRCXfmyREB7U4VebhdChrbs9iqU7hsO7T9VXYqogLziKObOJ4F2QeNO9xso1dn/mXsLrop0L0ULYgapuei0DKR3ETn6LdVz88zSidzL42Ng/qgBUZbSSk6pzGzt1iYbOAk/1gbi2HuHr04mMrwW0dXDeKXojFcTb+VlenoYTDSDBN6/uY6j/cwhsVMupbvB0Vdl00xDtAL9hU6liKe/gfFf0XKJIf6KNEjYa4eNQjywvYoJXqnrpGrXZjoe+bf4dt0X53PFvuOGMtkVjKlZOtUGqDrwV0IcAd04kkytGymmiH2XkOos88ihqtsPbe8XKBbcsnlClkayVZz1YyTtVdyxVUVdJtbV2yHySQpoAMSl2zzN60RoTczwTQDHb1qa260f/1qg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(396003)(136003)(376002)(366004)(39860400002)(451199021)(6486002)(41300700001)(7416002)(26005)(6512007)(6506007)(8676002)(8936002)(38100700002)(5660300002)(53546011)(36756003)(2616005)(31696002)(83380400001)(2906002)(186003)(86362001)(66476007)(6916009)(4326008)(66946007)(66556008)(31686004)(54906003)(478600001)(316002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?U1JLem1FcVE5M2Ficndic2tZVDF4L3YyRFFwMGx1RGdrRTE5bnZMU3R5UlQx?=
 =?utf-8?B?T1RValFXNVJHQjcrK013L3NGUkdGb3kxRm9nUVRSVzJsQ3hxYXEzNUdKdUdX?=
 =?utf-8?B?YU1qWVFYRmY5K0s5aWpuRXB6eXpuUnZSMmhyWFArbE53SnIwdXVIblJLU05R?=
 =?utf-8?B?a0g3SmVZUHA2Y2xZQWdRYkMxZHVtZlZwU0hRa3RveXhwdXZUOEtvWEduelov?=
 =?utf-8?B?VlRhMFdwNGx1YU9GMnJwdTV6U1N4NzNnOUlEeFRrd3ptMExYaHNvcy8xSFJu?=
 =?utf-8?B?MlI1MWlBYnYvNVV4RTE4N0YrTDl0dTU2SGV3RE5ST0F4YkJRaWZjenR6OFor?=
 =?utf-8?B?K0praHNvaGtZTVRjcjlSdURDSVU1dEtzbDUvKzFnK0E1WGhXWUw4dHFCVXRa?=
 =?utf-8?B?VjNETXZBYllnNEluYVNhZWY5QmdhMU1sL1JIOC8xejFGMzE5dlFLQnJkakY0?=
 =?utf-8?B?ZGdnRGFkRkdBZ3F4NmhZR3QwWDlMcHZVNGd1WUF3ZFNUemZCK01NTk1rbFRH?=
 =?utf-8?B?aXhzaG1IckEwWm51VllaRHpXUUFUQ2lWT2JVUHYzRDBoT3V6WTF6Vm5YbkpN?=
 =?utf-8?B?N1dZM21BakdUS0MvazFCZnFYK29DS3EyOHJwa2FJcTRmdXI0NjZld2pUUG5X?=
 =?utf-8?B?MWtLaStDWTdqZHo4UXNUOEN5NUtiOGVuNWI1d2VWWmdmVEJHOEhBWUtQYXFr?=
 =?utf-8?B?SVdZU3h0Q3FqcGMwbFQyNnkzMUlsQmpmc3NrcFRsUnVSN1BOR2poL1JrMGJX?=
 =?utf-8?B?QkVLWFFPZDlCaDVwOTVCd3hsQXlUTGU5bkI1Ny85Y0xEM0VNWS9IVVlUYzdi?=
 =?utf-8?B?Y1Z0Uy9ZcGgwdUgrRzREb3ZmM3RBZ1BMbGlBMzBlUFAxdEV5RmxPQUJ6Q3E4?=
 =?utf-8?B?eFBzSXl5aG1nbFNHM1FxdVZYTWZoeFgxL0VwQXZDdDlJVERXWGlPa3Y4SDJC?=
 =?utf-8?B?ZjU2S3hISEZHSEwzS1FOaUZ1cTNFMkVpYmRpcHBxQURvYm9LQjUvZllTV1Nq?=
 =?utf-8?B?TW1yWjJaMk5Ea2FQNW11eWdKaUEwY2dNeEJybnNpYzVMU05xUFhmTyt2OW1T?=
 =?utf-8?B?aWZ6RGJBbkpuZ1BlN2xXUGpmYSthNHBDVWNZcDc0UTI4VmM4WU42TzlQcndV?=
 =?utf-8?B?aWsvNGdPTnB1L1lPazhnWm15WWJjNmVjQzdSa1NBWVFvSlVueG1qUStac3RH?=
 =?utf-8?B?aSt2aFNtVXE1aE5XVXorbXdXS0NOQk1Ia2lDcW9kU1BFeVlFc2c3SzlsRnY0?=
 =?utf-8?B?ckdSOGdLelU3QzQ1bGNkTmZyQisvWXdYTG0yQWZmYnhYdUtzT2FnRHJqcENJ?=
 =?utf-8?B?YUxSUWNiM2hTbGU0cWxDdTNpTHo4d09tOXZyMlc3cTJyTjZCVU0zVDNQbWx5?=
 =?utf-8?B?aU9iS2huaTRzSCtoVEQ3T2lieGUyajM4MGFrRGY4UkFBK1lUOVd3UXJPMnpt?=
 =?utf-8?B?dnJ3TXRvMzJvSngyQVBEMUxjbVRESnp2ZDdXb0RmOFE3KzlpTWc4WFlXNkhX?=
 =?utf-8?B?aU13c09SdkdweThPYjVBOUoyNXRNVTdEb2NpTVhwQ0NDMXMweWhNQlNGSS9z?=
 =?utf-8?B?RzBqcVNGNk9Ud2hwYkVoV0t3U0lIZ3RWejRTdjFoV2phR0xGcGUyS2dhVWtk?=
 =?utf-8?B?c3p1cy9kUEpwd2pTYXloUGlZSDQrMzduUE9zQWVUU3ZnN0dXczNPVUVmblNC?=
 =?utf-8?B?TnlHZ0x3V0JXc1p6ZHJudDRBZUpORWFFY2Q3Mkt0QnFidEFqcERPaG9mRzBM?=
 =?utf-8?B?cnNOSm1kZlJWRWhvdUplV2w2UE1aOVdhdTNWR0FqdWJ6Ym9VWmVqVUZRSEhF?=
 =?utf-8?B?ald4OXRMbDNOcGNCVTloWllqcStmWlBadWVlMVltOVliQkxZZjFPcHdLNVBV?=
 =?utf-8?B?YW1JVnZiUDdsZExDWHdUZWhJWm96MlduRHRkZ3cxc2VlWFlONFd0Q2s2OThT?=
 =?utf-8?B?T0YrY3ErR0czVkM1UTBCTHFldmxMSWhTY0hzdjRBRTBmK2NLOStnU0I1RFNl?=
 =?utf-8?B?UGZRZU9EUnZQdmUrdXlJWHZaWlozTzFTdWlyUm5BSkRCL2lQRVR4c21rZ1Zv?=
 =?utf-8?B?M25GUWhJK0hVaG15ekpRaVpTdXYvaTUvOHl1YSsxa1E2T1duZGQ0ZDZhbUU3?=
 =?utf-8?Q?GS4rYaptHjcJLndpc1rkfeHTe?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 297949e2-d4b3-449a-8b4a-08db5d1b9671
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2023 12:28:47.4112
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nTaIriYZ/586mhc+p/JDS3dNJhizeeT+SwGPvdXJF8barQSoK2Isrnh3ZjibMvc3lH/L4otG2bdvQQolpJgAkw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8412

On 23.05.2023 18:38, Anthony PERARD wrote:
> This is a preparatory patch. A future patch will not even use
> $(CFLAGS) to seed $(XEN_CFLAGS).
> 
> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>

Acked-by: Jan Beulich <jbeulich@suse.com>

I have a question though, albeit not directly related to this patch:

> --- a/xen/Makefile
> +++ b/xen/Makefile
> @@ -259,6 +259,7 @@ export KBUILD_DEFCONFIG := $(ARCH)_defconfig
>  export XEN_TREEWIDE_CFLAGS := $(CFLAGS)
>  
>  XEN_AFLAGS =
> +XEN_CFLAGS = $(CFLAGS)
>  
>  # CLANG_FLAGS needs to be calculated before calling Kconfig
>  ifneq ($(shell $(CC) --version 2>&1 | head -n 1 | grep clang),)
> @@ -284,7 +285,7 @@ CLANG_FLAGS += $(call or,$(t1),$(t2),$(t3))
>  endif
>  
>  CLANG_FLAGS += -Werror=unknown-warning-option
> -CFLAGS += $(CLANG_FLAGS)
> +XEN_CFLAGS += $(CLANG_FLAGS)
>  export CLANG_FLAGS
>  endif
>  
> @@ -293,7 +294,7 @@ ifeq ($(call ld-ver-build-id,$(LD)),n)
>  XEN_LDFLAGS_BUILD_ID :=
>  XEN_HAS_BUILD_ID := n
>  else
> -CFLAGS += -DBUILD_ID
> +XEN_CFLAGS += -DBUILD_ID
>  XEN_TREEWIDE_CFLAGS += -DBUILD_ID

Is this redundancy necessary? IOW can't XEN_CFLAGS, at an appopriate
place, simply have $(XEN_TREEWIDE_CFLAGS) appended?

Apart from this the same process question again: Is this independent
of earlier patches (except the immediately preceding one), and could
hence - provided arch maintainer acks arrive - go in ahead of time?

Jan

