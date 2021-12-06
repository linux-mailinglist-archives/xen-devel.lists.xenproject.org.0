Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B72A646A1D7
	for <lists+xen-devel@lfdr.de>; Mon,  6 Dec 2021 17:53:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.239403.414932 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muHEZ-0003SJ-KT; Mon, 06 Dec 2021 16:52:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 239403.414932; Mon, 06 Dec 2021 16:52:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muHEZ-0003Q2-GD; Mon, 06 Dec 2021 16:52:59 +0000
Received: by outflank-mailman (input) for mailman id 239403;
 Mon, 06 Dec 2021 16:52:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0GdR=QX=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1muHEY-0003Pw-8u
 for xen-devel@lists.xenproject.org; Mon, 06 Dec 2021 16:52:58 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f6212bc5-56b4-11ec-a5e1-b9374ead2679;
 Mon, 06 Dec 2021 17:52:56 +0100 (CET)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2108.outbound.protection.outlook.com [104.47.18.108]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-37-QW98Xi5jOtavbvncoJZNoA-1; Mon, 06 Dec 2021 17:52:55 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB2960.eurprd04.prod.outlook.com (2603:10a6:802:9::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.24; Mon, 6 Dec
 2021 16:52:53 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4755.021; Mon, 6 Dec 2021
 16:52:53 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AS8PR04CA0034.eurprd04.prod.outlook.com (2603:10a6:20b:312::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4755.14 via Frontend Transport; Mon, 6 Dec 2021 16:52:52 +0000
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
X-Inumbo-ID: f6212bc5-56b4-11ec-a5e1-b9374ead2679
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1638809576;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=joui1Zy17jMpXVG4p+Fro0dNZj0AQu1QlOhnmwZMn+w=;
	b=X7Qn2GvC13wiIOxDlihaa9sIVNBypjkEqKRNm/eiwJMoX5PkPTHBsynH3JClW+GpotAmac
	ReM7z7Hf+ceGXIyc7TWKukHZnMnNTCyRresvNPRPDLPomNRUnKCPwFnZOou2WUkyZjO9+n
	7EZJd2/LLvRWzJJfO9jnUy0VD5+znS8=
X-MC-Unique: QW98Xi5jOtavbvncoJZNoA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IiRdMbOrcpkZvYmd7c30+SVxtYzWluAXVoqCjSj2PRrCR8MNVdlJYJnHL2nNoMkghVlpuE1cnhndOaJJux2AqGDBn9xGojWFqRv6wC9e0qtOKEKOOIq05wT9Zf3LM4Mr66TJwvOHUCMOh073MjXJBYi0oMhDozYSM/CIt57MckzZy7BKFU6/oe2HZ/85OH91YpQ8BYMe3I6OYX2MAuWzTaoU4Ljj25vJmbB2Fuj100VBrxC3ccQoSDJmrtVkY1AfNGUXzBSbZxxxgJ12XLVj8iVV+aoA+MZQ6rO+AHJe8vw3VCWuERbsW8aY1ZKLei0Y4mrAC6VQuHGOU4sSMi0RwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=joui1Zy17jMpXVG4p+Fro0dNZj0AQu1QlOhnmwZMn+w=;
 b=NW9CfsbLCGgu18t+rGz1j3IW5KDJizW2KJOOItqNjVd6EuQ2a8kruNh7s1Q7kiIDp+8tqFKA9h9tfMAMu7m9UNoTYY1cFIRwT3ki0W7FmUelr14yHodFzA+IjXt9J4P7Wpk/O+fyWITvHSigKR+dp7kA7NCEyOImG9pRNeIt0LU5DF3syWGRwv5n20drm35sC8bQLGiDsbj88M3vWmrR1huCO3rOFF1YjIbyYwvZO4Xpo6hyhB4l1YuSZ38WswKvivShUNeESBBqVSTKv/4Uc2Jsk7XFYSkfHSwaM7QtiZbg/2W7rWqYXK53DVb8IQoNYYeL/Pm3XYcyHfZw4Gg2ng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <b4bde105-094d-067a-4657-a7ff041aee4a@suse.com>
Date: Mon, 6 Dec 2021 17:52:51 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [XEN PATCH v8 07/47] build: set ALL_OBJS to main Makefile; move
 prelink.o to main Makefile
Content-Language: en-US
To: Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20211125134006.1076646-1-anthony.perard@citrix.com>
 <20211125134006.1076646-8-anthony.perard@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20211125134006.1076646-8-anthony.perard@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8PR04CA0034.eurprd04.prod.outlook.com
 (2603:10a6:20b:312::9) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2b540426-0b2e-45bf-85af-08d9b8d8d86a
X-MS-TrafficTypeDiagnostic: VI1PR04MB2960:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB2960928C8B58E2B4D65995A3B36D9@VI1PR04MB2960.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4502;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	gYwcysj63j+wXdyCrscouADtZcYLMy/8G5iuHqKenY1wWdXjN0McxXRJ02K/5hMVaioRRg3WsSUWKGgsXcq5fsA7Qs9/W12Mc67+Sgk5lR34wEZKkE64zMpkTVcrSkhdsqtjddyBV1Gv0y2WUSK8k74NS46wYpI/dooGAOCOn+di+SS1TviGMD9yZIrg6R1KoE07DMddjIjQZPLHb7XlEn+LkXEXC+5Q6hAP67PNldjm8fWljzrSGXgnOeKi+0AIJ7rIrdUBOpa+r/YN1ZfyUdQHwYx9N0776f/Kbjm0XesJF9JivusX0qRhCddnV7vZU9Be0En/l1AZIne2CGyIMqyBGExE6JbOBx8CkS+axubnk23VNctXxy9cctC5IrKxr7v5MN+hz2ouuTWJxB9ziIv3NnTFDcEQO3I9MBVz6KbKul1NrKbUUhqIN+zjg0iDNI8cSY56N1z81q+H8TebN94M2PCGO7ayGYcAmw11XQraiH/LXjeTW7mMYg/7+uNrsj07WJYK0BIWMA3IbPcilnnsu9aliqIY9RgKP1vRmn5cdAnhcUEocGiJISOgxDNW5PHN9CzY4k8uTpvdu1yOPCTQL9RldkglZG1OYg1E5g4jpeB1CFwjT2MAhrwfwuoTMHPzNxDrimbI3johjkogWXlqjidHxBYvFK3iOq/UU47QsLG+6n28rm8kEvHECoCoH4NuxWY8Q2g08ZrqEYm6dLT5x0jyX192eZjrfJspsqeUXfUgirk7fHQTJrK9XIN0
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(38100700002)(2616005)(54906003)(66476007)(36756003)(66946007)(53546011)(31696002)(4326008)(83380400001)(7416002)(66556008)(8676002)(508600001)(16576012)(26005)(316002)(5660300002)(8936002)(956004)(6486002)(31686004)(2906002)(86362001)(186003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NG5pSFlnV1phTHcyU282aU01bmJrQVYzdW9vbGEwTlhTSFIyUnYvY1NmZUJw?=
 =?utf-8?B?UlJyeml1YXdyWlVvZzU1anNkRkJTeFQ4T1VmNFl5amlHbjU2QVV6L1VhSkVY?=
 =?utf-8?B?dFA0U0FCU0xOWCsrNU04RU5QNzVmZ2RBOXJmWTFKRFp2OWNLekREeWlDTElS?=
 =?utf-8?B?c0F2TjRkWXRaMmpHcmVybjNsdGhUeFBHUHd0V1VZT1ZjRGI2WVBmNlo1YitQ?=
 =?utf-8?B?OTJZS2w0UHREaFRaUHI4MFlleGpKdzVDbVRycHBmbXNFUnA0dE03dC84SWdz?=
 =?utf-8?B?Zlhpb3FMWDlwSkhWV0NydlhDMnRNSW9wZU55YjArUUFpSjZDYWNlem9kK0Ju?=
 =?utf-8?B?TXk1USt4QzdVUlFZU3B0SWUzdnYybXhsSWhkU1BFWGkzSnR6SzkvRjllVVR5?=
 =?utf-8?B?aFRoQmg5ZDdwN1lWYWJTdDF6OGdWSXFkMWtFaGFVZHlnT2hRZll3OUN4Q1F6?=
 =?utf-8?B?ZXlaOVBhTFNITVh5MTJhbWhXT1pzMTFPTE5tbWRMd2VJdkpLVGJnaGhRdE9X?=
 =?utf-8?B?bVRjRG8xNGsvTW5scVhVSVlXTlJpcGt5K1hHbVR4VnB3aHNpemRwa29GKy9x?=
 =?utf-8?B?Wk4xdmVEOEQ3QzFhWnJXNVAzaEVxdysrOHIvTkJNQTBrMWhwZ3BDUXRwdWI4?=
 =?utf-8?B?bkttZGlDekxPYjdFTTdDME9INXBIV29LbWNiM25zMnBoc2JlZDlMWEtGSGZp?=
 =?utf-8?B?SDFuaUR3YWZZRWZkWjIxRkl1aVJyREZSYVliZDhVYXRxOGlUMTgwK3VrS3dM?=
 =?utf-8?B?RDNMTlp2dHo3eWhPczBHQlZVSDRtd2tsRDhReHY0MWJnY0RYeGZmMy94bisr?=
 =?utf-8?B?U2Z2Z3pCQ3h6Qll6QkJOTnRjMW5kd0Y0bzJmNlNFM2V0K2hSSnl4WGU4d2Zv?=
 =?utf-8?B?RkFJenpuRUl0VlJ0ZUNac3BjTTNaMVR4d1BOVUJsUEtzOGFadU4zVlVSMTZF?=
 =?utf-8?B?M1g4ZlVUdFpFYUd3VmFnYmo5ZTEvZFBGVDdqS0J0ciswZXJKU0gvc2JPalRV?=
 =?utf-8?B?djVrQUo4WUQvTTZmTGlQOEswWURyY0FCUEtkdEF4cmxNTEdDMUovYTRPbktI?=
 =?utf-8?B?OFRoclF1KzdtMU9xWm51TTFGN0V6VEM3VDVJSDVBSWt1czBRVWdqMnVhSUxF?=
 =?utf-8?B?Zzh1amlvWFh1TWFFeE5hT2ttWUlEdTN6T0luRWNGOE9LV0twR0tpRkMwcmdh?=
 =?utf-8?B?QlVGQ05mWWY4T0s2eVJmUDE2NTNnTUZxNEM2Q2FIMG83Vkh4VUJoWDEzeVd2?=
 =?utf-8?B?bjJIclJmbnQ1MWZKWENwbFY4RThwOENKdU1qN0R2cVNmRFdBNDlYVWxsVnR3?=
 =?utf-8?B?d1Y2YjB1dVRVaDZKWm9HZWRJOE9nWVJmVTlsaStxSm5OT0Vab1puTlF6a1BC?=
 =?utf-8?B?N0RlTHBhU1pnMVArTVpHSTJxTllZVDNnTk55cE4yL2dYWVBXOGYxUnVnQlR5?=
 =?utf-8?B?TklvVXNjQnlTaUJnTFBMcjdIalJwd0M0WjdEUy9LUnA4V3JyL29IZWMySDZM?=
 =?utf-8?B?Z2tDY2tCcThBandMUFlUQ01zc1RTS3J5VWVuelFHMHdsU0lLU0g3WDNUdlA5?=
 =?utf-8?B?a2VaVnp2TUs3ZTYzQm1nTlhQSERVaHl4ZzMyYldxeHJreG9BZWd3Y1hMbkQ2?=
 =?utf-8?B?T0Nyb3docWZiL3RZMVNaVllGbjZDbnJMR2Vzd29wZVRWTkN6OGNqQVpDY29L?=
 =?utf-8?B?bkk2ZllOdVVaSFB5OW1ZbDRlOXFwUk5qRU81TjBEUlZ3WmdXdmg1TGtQclp2?=
 =?utf-8?B?SnJFSUtqN3c2L3dsNDNWN2FJTFN6RFpybTJqUWh0TS9GOXdMMlNjUnUxdVBr?=
 =?utf-8?B?UlJRSHYycTI0ejZhK0tHbStSNWJvNTk1TXZYRHFBQTN2SllrQWRIQnRzeUEw?=
 =?utf-8?B?MjRNQWFNeW9kK1A1WEpONlg4Sk1HSHd4YnFxS1lOQ3hxNFluSWZRa2VWZFEw?=
 =?utf-8?B?TTA0cW5uL2w5N3ZjTXllZ1dIQ0xuMlJYUzc0S2pNb2hJQjA0K1RHWDJtMW5Q?=
 =?utf-8?B?UU5mamlqVG1BTGlnemE0VDRva3JKTUdpREwzMjJSdHkyUUlzUUZQd3Jsanox?=
 =?utf-8?B?M0x2djZzS1pXeldOUXM3YUVnTmtSbTVLQVlSa3Qza0JnSVlFYXVHODgrQzc0?=
 =?utf-8?B?d1hqQkNPbzVROTViWk5aMlZJb3pONkVQZXdoL3NGNk1KY3I4TUZmQjBpTXls?=
 =?utf-8?Q?N9mfOTw6yp95UYfLT0ZWSAs=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b540426-0b2e-45bf-85af-08d9b8d8d86a
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Dec 2021 16:52:53.4291
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sFuuvG8UOKgjbi/QuXFwL9dyn3OTN1hVJdF5YkTiZxWbK2GwjrCGmwSKD4YyR1bJzVyjWOENkGfpB9ULdhm1Kg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB2960

On 25.11.2021 14:39, Anthony PERARD wrote:

Nit: In the title, do you mean "set ALL_OBJS in main Makefile; ..."?

> --- a/xen/Makefile
> +++ b/xen/Makefile
> @@ -285,8 +285,21 @@ CFLAGS += -flto
>  LDFLAGS-$(CONFIG_CC_IS_CLANG) += -plugin LLVMgold.so
>  endif
>  
> +# Note that link order matters!
> +ALL_OBJS-y                := common/built_in.o
> +ALL_OBJS-y                += drivers/built_in.o
> +ALL_OBJS-y                += lib/built_in.o
> +ALL_OBJS-y                += xsm/built_in.o
> +ALL_OBJS-y                += arch/$(TARGET_ARCH)/built_in.o
> +ALL_OBJS-$(CONFIG_CRYPTO) += crypto/built_in.o
> +
> +ALL_LIBS-y                := lib/lib.a
> +
>  include $(BASEDIR)/arch/$(TARGET_ARCH)/arch.mk
>  
> +export ALL_OBJS := $(ALL_OBJS-y)
> +export ALL_LIBS := $(ALL_LIBS-y)

Who's the consumer of these exports? I ask because I don't consider the
names very suitable for exporting, and hence I'd prefer to see their
scope limited. If e.g. it's only a single make invocation where they
need propagating, doing so on the command line might be better.

> --- a/xen/arch/arm/Rules.mk
> +++ b/xen/arch/arm/Rules.mk
> @@ -0,0 +1,5 @@
> +# head.o is built by descending into arch/arm/$(TARGET_SUBARCH), depends on the
> +# part of $(ALL_OBJS) that will eventually recurse into $(TARGET_SUBARCH)/ and
> +# build head.o
> +arch/arm/$(TARGET_SUBARCH)/head.o: arch/arm/built_in.o
> +arch/arm/$(TARGET_SUBARCH)/head.o: ;

Can't this be a single line:

arch/arm/$(TARGET_SUBARCH)/head.o: arch/arm/built_in.o ;

?

> @@ -235,7 +218,7 @@ $(TARGET).efi: FORCE
>  	echo '$(if $(filter y,$(XEN_BUILD_EFI)),xen.efi generation,EFI support) disabled'
>  endif
>  
> -efi/buildid.o efi/relocs-dummy.o: $(BASEDIR)/arch/x86/efi/built_in.o
> +# These should already have been rebuilt when building the prerequisite of "prelink.o"
>  efi/buildid.o efi/relocs-dummy.o: ;

If the comment is true in all cases, do they really still need an empty
rule?

Jan


