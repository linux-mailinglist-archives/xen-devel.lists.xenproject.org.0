Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D8AB431256
	for <lists+xen-devel@lfdr.de>; Mon, 18 Oct 2021 10:43:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.211858.369538 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mcOEl-0008QU-Rc; Mon, 18 Oct 2021 08:43:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 211858.369538; Mon, 18 Oct 2021 08:43:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mcOEl-0008Og-OK; Mon, 18 Oct 2021 08:43:15 +0000
Received: by outflank-mailman (input) for mailman id 211858;
 Mon, 18 Oct 2021 08:43:14 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=628V=PG=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mcOEk-0008Oa-2G
 for xen-devel@lists.xenproject.org; Mon, 18 Oct 2021 08:43:14 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6d5ceb2e-2fef-11ec-82d0-12813bfff9fa;
 Mon, 18 Oct 2021 08:43:12 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2176.outbound.protection.outlook.com [104.47.17.176])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-33-54Dsm5k0O7yp7hAzmGZIhw-1; Mon, 18 Oct 2021 10:43:10 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4608.eurprd04.prod.outlook.com (2603:10a6:803:72::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.25; Mon, 18 Oct
 2021 08:43:09 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4608.018; Mon, 18 Oct 2021
 08:43:09 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM5PR0402CA0005.eurprd04.prod.outlook.com (2603:10a6:203:90::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.16 via Frontend
 Transport; Mon, 18 Oct 2021 08:43:08 +0000
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
X-Inumbo-ID: 6d5ceb2e-2fef-11ec-82d0-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1634546591;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kzawKHRM+YDpQu86QEL4tfIbOhZUcRbkP6EYJTYzHmU=;
	b=ivzw4Ebuq8d9S1jWM5Fx/cS1lacUAOWO3xiImEAOG/9/OvmDpuz05SZsL3ti9o+ZcJS3ws
	B2CafEOPpGP9oJBP+pWczQ8O7C+8s2szGGgzWQkWTJIrb44vXcm7LjXZ6Vth9C9Si/kIDL
	aRYaGWv8Ea9sMuawWylsSfNTzrDZdwM=
X-MC-Unique: 54Dsm5k0O7yp7hAzmGZIhw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y/Pwc07tS7KAbXwVq1SoEZ2mbSe7WPG9lrUvUqIqKf16DHML+Vf6iKZrCP3PPSY0acnlnqrwkHXQ/skd7Sf9hqmEVJC6GC7asjQS52RvonWy9USV8Dqxff0NOzs+SN+Dk9bKWHu87DJqjJWKbTTj9eHdgnHlMrLzIWozzAzBE/5g08ODLPk47vGFl7EfxjhDUFTkH+ZsUDfEKk89+PnvUiPfK1dY3bsHS7lYrGmt/6e2Yr6Dp/7vNssoQicP2wzeUMmMcRKKaSDOKPFMeQsp/PG7a/kNbTjfLJSu1roPFUpPenL/53RnbkXrM+3w9vEtqkIKkngC2fwprqS1q3TW5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kzawKHRM+YDpQu86QEL4tfIbOhZUcRbkP6EYJTYzHmU=;
 b=DaI1ObrAD1i9OIlx00B++2QxS8G4ASDqwnMlZ/PfPCWESNmtAHSnY3kHHZxGKmdqOpqNZlztubRafD3kljxNPzoLMSVRWea6dYdHrtVNTgpr/PlNkSwrLqlZC5dBcCqLNzeWR+0ZNTGXH9IxC/wA6e8zue3N6PaGEMZXTKDqpxo3wet9bdlFQubO0X4Xgeo2nrnkLtS1zDJZQC1Nsn1bhMqW+r1ut5WJIpMzgC2cAWz87b8S9yQx/+3hUVRj3r+xZ577PLQYmraj1X8q77vckjabQPHRSKIkId1wWpOvGawpi0xe/OWB35XjRJa/hQWbjzDaxd5aaoN/beD9IGAaFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [XEN PATCH v7 41/51] build,x86: remove the need for build32.mk
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20210824105038.1257926-1-anthony.perard@citrix.com>
 <20210824105038.1257926-42-anthony.perard@citrix.com>
 <c99f2bc5-b1dc-7647-4199-a6a731730967@suse.com> <YWmjvqyIyCP6IXmh@perard>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <19e598b6-547d-fa90-83c5-66eaa3787268@suse.com>
Date: Mon, 18 Oct 2021 10:43:07 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <YWmjvqyIyCP6IXmh@perard>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM5PR0402CA0005.eurprd04.prod.outlook.com
 (2603:10a6:203:90::15) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7f656f41-a649-4eb2-9205-08d992134fb8
X-MS-TrafficTypeDiagnostic: VI1PR04MB4608:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB4608733863807551BF3C15A5B3BC9@VI1PR04MB4608.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Fg5NZdrapVW0gfN9p24qqfTZkuzB4EyiMu0pbvEPIIVLyjHddvM+IrYP43yvOM8e3dLxjpBl7f+5e2ojjrU4sPgAYwQwckv56e5NEk0DraIMeVCTyXvB2j3v89P6yEKSbEILtbQagXt40IDVArq5RVVNpmycjSOYHllMxhuLswpCxCVqG7l+lI06slxYw0JlcEGbbe+EQkM2EobbeEFtQN+P+CZoujdWA6PZqmtj17tFx4Jw6nM/lG3f7sdsu+B0paCuhyne0BuHXKMsZhqaMCp/1Vl1DhmJF7c9sWvDtazFMkU8PBsQjlgmot+GIVilE3IYB+7ezi8XUfUb/BvIey3X49zYEP3MajpouxaUbmtzOdZ21w4lpfBvqDrzmDsQ85FP4FIC9p52Yyb/m1ozildGu6Xf+DpkRNXFgvi/bAEgObFTHsxktITHRJjPWLL5Nf3W8UjzU+AGBzWj7oHZV0cYtF8KHhaTtxxxkXEGjiJ2ceK05ozo9EyaYLCE+c+bC5ugfLoqsMIi7cGZxS/Gf+QE0UzDmqNnQ/XNSkuNae8SdmJj2FMZrV4r8C0guInnbDNiO7Mqz2pQvaHWyomU/flfWrD7bLkNGIxhc6inZfqKAdcY4QUjRyrMkitz2POehw8T3OUxNcjFLfpg2k8Fo3jUyyjBscZuHtKWSfpcVqUGtNcHQuylEty1BKXuePoetDI5tJsGAHSPnG8QzaBYYetfuZGp+Ad4tPBrVzkMbrc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(8676002)(6486002)(54906003)(16576012)(186003)(53546011)(36756003)(8936002)(508600001)(316002)(2906002)(4326008)(26005)(5660300002)(66556008)(6916009)(66946007)(66476007)(31696002)(31686004)(38100700002)(2616005)(86362001)(956004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dnJnWHBsOERUV1hpai8ySjFHVi9VUGJtL0FaUjVzOXRIWEx6aVJJcUFGcXdp?=
 =?utf-8?B?VTRMbVRtbWJpYTF0MG8wNVExOFI2VVdFbjhhWUVzVmNXSWFic2pOZUJveTcy?=
 =?utf-8?B?YkhPOVE4ZUZ5a2sySk04MDQ2dUw1R3B0Y20rUnhUdzZBdllBVGllUyt3aDFp?=
 =?utf-8?B?Y0t5MmgvVGUvVTB2WVZwY1grbjZwaWVoRzNseEQveHExOXo2R2ZOVWlteHFI?=
 =?utf-8?B?VUxxYXZKd2NOS1RQYVJ1bk9NbjI4eTNiUCtvS1RZOWtwRGc5K25ubEZzVlpu?=
 =?utf-8?B?ZVE2VXY0TEJkYkgvbGNpcWhxRFdHV0hwTWFOc2NTQXVLRzAyY0FuMWR0Z1lw?=
 =?utf-8?B?ek1oTGROQWVNVEhTU0JkS2lUaDM4bktVU3VPZFBFbTVrTE5GNXpOWmtoQ1g3?=
 =?utf-8?B?M2I4NWxHT3FrQVBGQ1o2YnlvcDFqN1B2ZlRWalB0bE85RUFmWkdZeTR0UFhk?=
 =?utf-8?B?enpXUWE4U1k5bFBYNVZWOVBkdGtvbUhqemY1ek1kVkgrZ1MzSXRLMGxnb1pv?=
 =?utf-8?B?bFlJTjE4V0lobklMZnc4QS9qQlM3SE1DRlZUcUNSb084Z1pUVDZvakUzRlRX?=
 =?utf-8?B?Mkg3Nk9ZK01DY0tqSFBRUmpwSXBpclZLZkErZWU2dTRyVm1oaHRQcjVoamx4?=
 =?utf-8?B?dzdCVE5Ic0hyamJhdWNrakpRMUpaQjNkUVNhTE95Tnd4ZU1MbEdiWWVva3Ba?=
 =?utf-8?B?cG9VR05ZRWtMdW10OXJ1WTIxSjVUaHMxa0Z6RHdrR21rRWtXenpVNERiZTJH?=
 =?utf-8?B?L0NhZkxDbEM3NmxiV3lsSTI0TkRrTko1ZnZKSVBtTXFucnVIQ0o2dUExWEVB?=
 =?utf-8?B?TjN4Q21nRFk5MDhFM0JTdGgvb0tqODQ4OW5PcStOVUVDSWF1NkVpMlE1SU96?=
 =?utf-8?B?TlEvSnVOcXVQMzIzSGlCdjdZTmdWa0IwRnZtaGUvUjFncGxwdzYwUzMvdXV0?=
 =?utf-8?B?ZjhGcDcvaTdWOTBzeEt2eExvdEZ0Y2Vrc3BhSDc4aFNNK1lzcEYrWG02Y2xM?=
 =?utf-8?B?bHR5MFhOdTV1d1ZsSWZXcDVvM3Q2TTNPMDRyWWl0NEZlMDYvMHJsZTdWM1BF?=
 =?utf-8?B?d3AwZ3lQZmg4Rmloemw2R2hDL3NEUUVjR0VscmNCNlIrcXY2NUtlcEF0d1Ja?=
 =?utf-8?B?S3BUeTZORE90ZlNUV0V4MHdtS3RzN1dHTTBZUEZIRjFUVUxKWi90bkI2ZVRJ?=
 =?utf-8?B?a0lueU5rUGtqU1I3ZnVsaTlLWW1xZjVwUTF5MzI5SHNxWnpxUzlLeFhjM2VW?=
 =?utf-8?B?c1VtV3MxQWF2ajdTMU1Ob3hyd3pqSlpJRk1rc3pCTXBEL2lhSitaZ3VMbDRS?=
 =?utf-8?B?MUE3bTVrZ1piRnFkRWloaXRhbXhVSE53SkhSUDNEb2w4Q2FSV21HNjhGNU1R?=
 =?utf-8?B?VWh1YkZkM2U2c0FMTDNOK1hiTWd5YldxWXBSb1h0L2ZTRHlqQVh3bk9GTk92?=
 =?utf-8?B?NTduMFZVWjB1V1lxdXFMVGNzTHVXU1Awcys1b2xlSDVMS2wvci9oWmJsOEs0?=
 =?utf-8?B?Ukh6S09XMk00MVBrZWZHQTJjZDYxZ2FFbFVJUEV3ZUNtWklOWXU2U2RBUjJW?=
 =?utf-8?B?UmtOMDZZbVlIamNGMTZZNUNKbHV0cWdVUTNXaG15MGpmYW1wYTNBZGdpRzJV?=
 =?utf-8?B?ZHYxUHFaNGJMRGZXd0R5WUFWVFZ4aXMrTFJqSXRiWXB5RVlteGd1aWtud0d3?=
 =?utf-8?B?V1JBNTg1bUZTa0lTMUk1TFg4V1p0TFJXOEVWYWVRbjJmK1lIR1NlMDl0dUJY?=
 =?utf-8?Q?CeGpO/l08+5nSCCjRV2iADa1MGmCZ0Gf7TDTb1w?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f656f41-a649-4eb2-9205-08d992134fb8
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2021 08:43:08.9995
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 54MKGRZ6npjE/XH2rfmi4D2ynr/SBI3RL1pLl5sOm5feTILyYtMuGtq5pZn2iA3EIwsYTATu64Xiv8Sc1V3P4g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4608

On 15.10.2021 17:52, Anthony PERARD wrote:
> On Thu, Oct 14, 2021 at 10:32:05AM +0200, Jan Beulich wrote:
>> On 24.08.2021 12:50, Anthony PERARD wrote:
>>> -$(obj)/cmdline.S: $(src)/cmdline.c $(CMDLINE_DEPS) $(src)/build32.lds
>>> -	$(MAKE) -f $(BASEDIR)/$(src)/build32.mk -C $(obj) $(@F) CMDLINE_DEPS="$(CMDLINE_DEPS)"
>>> +CFLAGS_x86_32 := -m32 -march=i686
>>> +CFLAGS_x86_32 += -fno-strict-aliasing
>>> +CFLAGS_x86_32 += -std=gnu99
>>> +CFLAGS_x86_32 += -Wall -Wstrict-prototypes
>>> +$(call cc-option-add,CFLAGS_x86_32,CC,-Wdeclaration-after-statement)
>>> +$(call cc-option-add,CFLAGS_x86_32,CC,-Wno-unused-but-set-variable)
>>> +$(call cc-option-add,CFLAGS_x86_32,CC,-Wno-unused-local-typedefs)
>>> +$(call cc-options-add,CFLAGS_x86_32,CC,$(EMBEDDED_EXTRA_CFLAGS))
>>> +CFLAGS_x86_32 += -Werror -fno-builtin -g0 -msoft-float
>>> +CFLAGS_x86_32 += -I$(srctree)/include
>>
>> I'm afraid I'm not convinced that having to keep this in sync with the
>> original is in fair balance with the removal of build32.mk.
> 
> Why would this needs to be kept in sync with the original? I would
> actually like to get rid of Config.mk, I don't see the point in sharing
> CFLAGS between a kernel and userspace binaries. Also, I hope one day
> that we can have the hypervisor in its own repo, and thus they won't be
> any Config.mk to keep in sync with.

My point wasn't about Config.mk as the reference in particular, but ...

> The goal of this patch is less about removing build32.mk, and more about
> using the rest of the build system infrastructure to build those few
> 32bits objects, and been able to use the automatic dependencies
> generation and other things without having to duplicate them.
> 
> It probably make the build a bit faster as there is two less invocation
> of $(MAKE) (which parse Config.mk).
> 
> As for a possible change: instead of having those x86_32 flags in
> arch/x86/boot/, I could have them in arch/x86/arch.mk. Linux does
> something like that were it prepare REALMODE_CFLAGS.
> 
> I know it's a bit annoying to have another list x86_32 cflags, but I
> don't see how we can extract them from Config.mk (in a Makefile where we
> want to use both x86_32 and x86_64 flags).

... about the general (apparent) plan to have two sets of flags, which
may not strictly _need_ to remain in sync, but better would. So while
I appreciate the alternative of putting stuff in arch.mk, I'd still
like to see common things like -W... to get probed for and added to
whichever variable just once.

Jan


