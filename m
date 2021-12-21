Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0981747C0D4
	for <lists+xen-devel@lfdr.de>; Tue, 21 Dec 2021 14:33:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.250422.431309 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mzfGh-0003p3-Ib; Tue, 21 Dec 2021 13:33:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 250422.431309; Tue, 21 Dec 2021 13:33:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mzfGh-0003lg-FD; Tue, 21 Dec 2021 13:33:27 +0000
Received: by outflank-mailman (input) for mailman id 250422;
 Tue, 21 Dec 2021 13:33:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=GYHQ=RG=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mzfGg-0003lZ-OV
 for xen-devel@lists.xenproject.org; Tue, 21 Dec 2021 13:33:26 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 92865036-6262-11ec-bb0b-79c175774b5d;
 Tue, 21 Dec 2021 14:33:24 +0100 (CET)
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur03lp2054.outbound.protection.outlook.com [104.47.10.54]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-22-NKKaV__sMYqnK4WIwT1unw-1; Tue, 21 Dec 2021 14:33:22 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5599.eurprd04.prod.outlook.com (2603:10a6:803:de::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.17; Tue, 21 Dec
 2021 13:33:20 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4801.022; Tue, 21 Dec 2021
 13:33:20 +0000
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
X-Inumbo-ID: 92865036-6262-11ec-bb0b-79c175774b5d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1640093604;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JtykITmE1BB0t5DVKQKDzCmAwSXVRtF17oWYPRkD4yI=;
	b=BBLIPkDWJJ8W7QTeEQM8liWzw/2u156JWl1Cl23NED4j7zkTi8NZq5HaWe8fksEBe4uxSy
	KPM8TSpUlXkzLmD5RfaIrOWCE2i5NUpro0svOKZyLlYFjY8ZGjCIqw56Q9ppLeBSrnWH8p
	JOZQJyVvWw5k5CXmS9FiOJAgqyqn7E8=
X-MC-Unique: NKKaV__sMYqnK4WIwT1unw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZvzXhyFShLVTMS07Z2eILadfS0MP+uhcXusb/3irmLRmW7RMWiT/ZerezW3MByhRP3VuEvA6FWi6Bfpk5t5MGm4VG9vcovxLvwlrVaJsuIaviLgKg15tjboIDw47gL1zCcBDuDilcFnpw2zAZDtF+ueqRchUvUnx8/Ig+tTzIQVxG6wHILzU/snxyCw3qYiQAcjX6lMge4MENVicfF/dq3FaY2w24fG9gtm4wVWtOc/S3MOSsSR+L0bKFwQ7Xz3PvXob5gLiBg6mSI7I9D8sJYUqgphuOSmNIm1SebhX7cM+cScMAduCmiEg7txurzEtvIdDhYZMrdDLgjYiKbH4AQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JtykITmE1BB0t5DVKQKDzCmAwSXVRtF17oWYPRkD4yI=;
 b=CdYl8J9IvFZV+n2YcmnDpIAr6eseF33/03c+Co81VSuJ660Gw89pa39MzQT1smuFuz0wMutbJZiso121TU1GKE38NsIUzyBHiK1F+hW4ECgT7EP67e9zQucVRiti4vNtZsz2hfVMubN5IMQKiyH37M9eoicXmcQheF3SezFhkQvuPU20gcSVPzi34X+0DKVQOrnALR9Z4XmjC0Egf2Ps2SWp/j07PqPMz9m8mKmJ8h82UMRH+flNbFgBLq/bKHeRhNVcAqVIgIHyZMQ0T3SlQgkIYon0pveCxbCVMRn6y5QWYE/7R9bON304L0Pn1TSGbnuOn+z/VIKcEVxNT0LGNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <8d7694a4-d7aa-200e-d29a-f055909a13ea@suse.com>
Date: Tue, 21 Dec 2021 14:33:18 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [XEN PATCH v8 26/47] build,x86: remove the need for build32.mk
Content-Language: en-US
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
References: <20211125134006.1076646-1-anthony.perard@citrix.com>
 <20211125134006.1076646-27-anthony.perard@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20211125134006.1076646-27-anthony.perard@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P192CA0055.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:209:82::32) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 777d43e3-5de7-4079-5cc9-08d9c486741e
X-MS-TrafficTypeDiagnostic: VI1PR04MB5599:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB559990B66926CD95D28F8C0FB37C9@VI1PR04MB5599.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4941;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	x234nkvXeTC1uIxunBHLmT7oZzlbo3GO5cJbHSCdrV7uHS6xPQmF02y/SHqiR4AtMk3YeYI78UlvTV6v8sjzYdvbVVi9V730zgPq9EZ0tp57zFYPeVooteM1w3hTCe9f1HjbI2zLmdfGlB35Ep8qPcC0eDd0DYEmSqoUSskLVrdl9jJtNM7hHl65ndJvvBrI85B/iLpwa1xzazxPzqD05h2oE1cVWdp3ktSCJSIrRlzObyYwZEzyF5vVnK8WV8HfM2VsIJEWvPMCPQOYlHpVfbcOCuS49ksRY2K/3q1oDLIVDaUWzltVHL3Wi1TjUpj9wC6+csHWDk9vvyHtFv9JGYgHN192a0w/79/zWzUcgT1zOBhmTfrNM5a3WuqJk8Aq7wXiK4Nv19r79psGsb40bc5w8v89wurKqOoam1tlMDfHnReqcy2zq+mh0Lfc5CNfT2k9Muea8CyAnTSHHzuVJFoi+MxK3shhb+zv267rulgoKah4IDUi5ZyrPnAjrzgy9gYxGxrTaeBmYxI3g4yf0ea2/V1dEbli45bfQxRmRFE7X7YI/8jIqTgjpTSl40+7NZ3l6Dn9KRVrpPkYdC22Q6Ah/Qwrmnmx7xdIhwJVbjltV6A243wp5Oj8GSdU2E9LW/k9PT4m/bPp4PajKBKDs6Yp9df8O8U41HstiituzbUZWXn5f1pIQd3utGg1l+nsrFI+vst7qPl5XjyjHigyQnMYA9MTyWfiQAH/+yN5fi8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(6486002)(2906002)(316002)(5660300002)(31696002)(6916009)(38100700002)(86362001)(31686004)(66556008)(8936002)(508600001)(6506007)(66476007)(6512007)(4326008)(54906003)(26005)(53546011)(66946007)(186003)(36756003)(8676002)(2616005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aHA3VVdYL25FQXduT05ZMzI2ZnNKSmE0bytibG92R2JEOEFOTEZmdG51NWZE?=
 =?utf-8?B?c1J4Nk1PaVpLUnc4bERZeVZ2MDRUcVBSUGpUL205Y2I2VTFkakZCc1dUQVAz?=
 =?utf-8?B?ajJ2dENzazN1WmJLblRWRGx3WHgzQWpxNXZ4U09CN2d1MUpRYnNCZzczUU1z?=
 =?utf-8?B?alZrODlDVTRYWHFSNlRUbDMyTjhnZUxJNnN2TWpVbDFKYzllNjYySFhtbjJy?=
 =?utf-8?B?Qzl1dTg1K1BxWlB0TnQ1MEsrVHVTWHdCWFRkNE1GU09UZHk1K2lOT1BOMnho?=
 =?utf-8?B?VDIwS1RMSTBvMHR6b0ZPalhxS3NobDZtYnRJTU5DbUpCL2k2UkRDeVk2eWhD?=
 =?utf-8?B?cUpTbzVlc3RNSHdxUkxIY2lLdjh3UFdXdDR4N0g0SzRBdFREakVaeFlOVGZn?=
 =?utf-8?B?dlQ5UHRKSE5GdktJT05pWEFua2NNUFlzRlczZW1paXhvOFNXOEkwNGtXeStI?=
 =?utf-8?B?RVVVQ0RLTXZOZm1RQUVPdUhKU29tVUNmQ2JuNCt2bDVsUVJET3VKQlZKMkVo?=
 =?utf-8?B?MERKdWRQRVFTZWQ1OFhpbm5jWkdWRmlZQisvLzBteUlXc0l5QkVTNWJiaXVH?=
 =?utf-8?B?YmtGSFh3dlAybEFmQ3BOMS9sYXpvSUJIdXF2azBwYis1dDlMZjduT2lZWnBC?=
 =?utf-8?B?VGxwZCttYWwxYk1MdWxnWWRVU2U0Z3JSZFBHL1VhZFUzRWQwUk16Zm9OSlhu?=
 =?utf-8?B?WnNYSFhmejB3elFvQldNNXlIM09zajQ1UVZML0R3NzNMZkExeGw2NDlwMHdR?=
 =?utf-8?B?SHZyZ3AwVlJuRjY1Zm9QMjJIREVUQ0xVMStOaXhCMFBTeERzSUlkMkJtaXBj?=
 =?utf-8?B?eVVHUDNOQk90em5kcGhSSnRnN01BeGNKbnpxTHRFdmtEQmsyYzZHQXBac2xZ?=
 =?utf-8?B?dTk4VmUvbnBCR2NqVTZjYlNqV0tvbXlOWEpLL3pwb25Lei9GSUdYS1hTaHpR?=
 =?utf-8?B?aHNpeGROOUtGYW41QmZZNlorOERuMTI3MXFtVXFMN3lEaEdMUVgwMUdJVDJI?=
 =?utf-8?B?OUdhMjFwL1FRQXBYbUdqcGc4NUxVL1NWanVnUEdUam5zeTdaNzlpQ0VwdVUy?=
 =?utf-8?B?WEhpRW5ZV3I4dlFXR1A5YlFBb0NoajdxU1dkdUtaQzVLeit3NFVxRWRNSzRK?=
 =?utf-8?B?ZjhsYlJ3dFdsTHJWVE5ZNEt4Z0dXUVppOWFPREx3NWxkY3RvMHVCSkkyMTRS?=
 =?utf-8?B?R09DNHl6cmVuVm5Ya0x3MFpKaEI2SEpSSDRsMUVjSDM5c1k4bTRBVEdGQmov?=
 =?utf-8?B?b0c2MnpFSDFhNVR6TlhTNVpEMW1aOFFSM0Z2TU53UGc0K1FKVEF6aXovbHFp?=
 =?utf-8?B?SEM5K2lhWHk3dFcrbmRQYnlMTHhRMWNqWldZTVJsRm5ieEUzTHVLTHM0eisw?=
 =?utf-8?B?Mlh1Wi9EUm5OZkFiOU91YlpaZ1pFTzNoc1NIbmFsNmFKYmZ1bzdYdGQxWlM0?=
 =?utf-8?B?WlphQlFpQ3pGWkdFSGVpWUdZS0RDTUhVRm5hWUhUckdmekY3TGx4Mm5iK0Nq?=
 =?utf-8?B?d3JoOERSaGthdDd2Sm5RUGNWS05DNkFRS0RaT3JjN29rcjVURVl6OTAxOTZm?=
 =?utf-8?B?Uzg1M1M3MG5HSmlacXFER25rWmR3a2pLS0paQWR0SGoyUVgraVQreEZ2RTBN?=
 =?utf-8?B?NitOSFYwakZTK3lKaEVmUzI4cnpjRG5GdFRzeEVuMlJyQ0t1aVBsTjFIcDNa?=
 =?utf-8?B?VTBpSFNWcWo5NTkyRVFSd0wzSkQweFk1WXk4azMwbTcvc3JVK1o1WHEvTGZZ?=
 =?utf-8?B?UVpSVkJPTm1ma2hFdllSSVVQWFU3ZEpvY3k1VGJraU42c0ljNHU3cGszQTg0?=
 =?utf-8?B?bklkTmtXclhTeTdVMUVLZ1B2UU9nOHZnVXovQUMrMzJLajljZS96WDBuVkdN?=
 =?utf-8?B?ZS9FNXp6V2JJL2EwemFVMEx3WnA4THlTNDNETW9aeGpqOFhIZzZQc2lFMmZY?=
 =?utf-8?B?V3R4NVJZQTd2S1ZyUjlOT3VPSXlGN3Q4UUVCQXJWS2gwTFZrRzhIT2VBRWhh?=
 =?utf-8?B?L2RabDhUMmN5QmRGMWNzd3Y5NDV0L0dNMlRqaENGY3JRYlY3MHdKVjRQQlFP?=
 =?utf-8?B?NFp1N3ZycmVaNEZPVmxtWGREQTlJV1A0OGpyS0oxcHZqRnhPelhSWDYwM29N?=
 =?utf-8?B?Nm4wb0tWWG9OUWw3bDlVbUtkbEFJREJUeENrU3ZYbXRPYllCRlJyMU9CU2U3?=
 =?utf-8?Q?LNGbAgGd7NxniSHllyceDks=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 777d43e3-5de7-4079-5cc9-08d9c486741e
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Dec 2021 13:33:20.3693
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zfFkOgEEs+4+CTfebFoD6w95KnHQ6WclpbFEmjSqPepXcZyxZVAOdizg2wRgzQDsxIb58KOaXHyFPpeDluMIPw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5599

On 25.11.2021 14:39, Anthony PERARD wrote:
> --- a/xen/Makefile
> +++ b/xen/Makefile
> @@ -171,6 +171,10 @@ export LEX = $(if $(FLEX),$(FLEX),flex)
>  # Default file for 'make defconfig'.
>  export KBUILD_DEFCONFIG := $(ARCH)_defconfig
>  
> +# Copy CFLAGS generated by "Config.mk" so they can be reused later without
> +# reparsing Config.mk by e.g. arch/x86/boot/.
> +export XEN_COMMON_CFLAGS := $(CFLAGS)

For my own understanding (it's hard to check being half way through the
series): At this point there are no further adjustments expected to
CFLAGS?

> --- a/xen/arch/x86/boot/Makefile
> +++ b/xen/arch/x86/boot/Makefile
> @@ -1,25 +1,45 @@
>  obj-bin-y += head.o
> +head-objs := cmdline.S reloc.S

Is "-objs" really a suitable part of the name for a list of *.S?

> -DEFS_H_DEPS = $(abs_srctree)/$(src)/defs.h $(abs_srctree)/include/xen/stdbool.h
> +nocov-y += $(head-objs:.S=.o)
> +noubsan-y += $(head-objs:.S=.o)
> +targets += $(head-objs:.S=.o)
>  
> -CMDLINE_DEPS = $(DEFS_H_DEPS) $(abs_srctree)/$(src)/video.h \
> -	       $(BASEDIR)/include/xen/kconfig.h \
> -	       $(BASEDIR)/include/generated/autoconf.h
> +head-objs := $(addprefix $(obj)/, $(head-objs))
>  
> -RELOC_DEPS = $(DEFS_H_DEPS) \
> -	     $(BASEDIR)/include/generated/autoconf.h \
> -	     $(BASEDIR)/include/xen/kconfig.h \
> -	     $(BASEDIR)/include/xen/multiboot.h \
> -	     $(BASEDIR)/include/xen/multiboot2.h \
> -	     $(BASEDIR)/include/xen/const.h \
> -	     $(BASEDIR)/include/public/arch-x86/hvm/start_info.h
> +$(obj)/head.o: $(head-objs)
>  
> -$(obj)/head.o: $(obj)/cmdline.S $(obj)/reloc.S
> +$(head-objs:.S=.lnk): LDFLAGS_DIRECT := $(subst x86_64,i386,$(LDFLAGS_DIRECT))

Considering there's just a single use of LDFLAGS_DIRECT below, wouldn't
it make sense to avoid overriding the variable and doing the $(subst ...)
right at the use site instead?

> -$(obj)/cmdline.S: $(src)/cmdline.c $(CMDLINE_DEPS) $(src)/build32.lds
> -	$(MAKE) -f $(abs_srctree)/$(src)/build32.mk -C $(obj) $(@F) CMDLINE_DEPS="$(CMDLINE_DEPS)"
> +CFLAGS_x86_32 := $(subst -m64,-m32 -march=i686,$(XEN_COMMON_CFLAGS))

I can't seem to be able to spot -march=i686 in the old code. Or wait -
Is this duplicating what config/x86_32.mk has?

> +$(call cc-options-add,CFLAGS_x86_32,CC,$(EMBEDDED_EXTRA_CFLAGS))
> +CFLAGS_x86_32 += -Werror -fno-builtin -g0 -msoft-float

You did inherit -Werror and -fno-builtin from $(XEN_COMMON_CFLAGS)
already, so I don't think you need to specify these again?

> +CFLAGS_x86_32 += -I$(srctree)/include

Isn't this present in $(XEN_COMMON_CFLAGS) as well?

> -$(obj)/reloc.S: $(src)/reloc.c $(RELOC_DEPS) $(src)/build32.lds
> -	$(MAKE) -f $(abs_srctree)/$(src)/build32.mk -C $(obj) $(@F) RELOC_DEPS="$(RELOC_DEPS)"
> +# override for 32bit binaries
> +$(head-objs:.S=.o): CFLAGS-stack-boundary :=
> +$(head-objs:.S=.o): XEN_CFLAGS := $(CFLAGS_x86_32) -fpic

-fpic should again already be there.

> +$(head-objs): %.S: %.bin
> +	(od -v -t x $< | tr -s ' ' | awk 'NR > 1 {print s} {s=$$0}' | \
> +	sed 's/ /,0x/g' | sed 's/,0x$$//' | sed 's/^[0-9]*,/ .long /') >$@
> +
> +# Drop .got.plt during conversion to plain binary format.
> +# Please check build32.lds for more details.
> +%.bin: %.lnk
> +	$(OBJDUMP) -h $< | sed -n '/[0-9]/{s,00*,0,g;p;}' | \
> +		while read idx name sz rest; do \
> +			case "$$name" in \
> +			.got.plt) \
> +				test $$sz != 0c || continue; \
> +				echo "Error: non-empty $$name: 0x$$sz" >&2; \
> +				exit $$(expr $$idx + 1);; \
> +			esac; \
> +		done
> +	$(OBJCOPY) -O binary -R .got.plt $< $@
> +
> +

Nit: Please no double blank lines.

Jan


