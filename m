Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CE8A39D879
	for <lists+xen-devel@lfdr.de>; Mon,  7 Jun 2021 11:18:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.137765.255198 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lqBOa-0004z1-By; Mon, 07 Jun 2021 09:18:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 137765.255198; Mon, 07 Jun 2021 09:18:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lqBOa-0004xA-8m; Mon, 07 Jun 2021 09:18:08 +0000
Received: by outflank-mailman (input) for mailman id 137765;
 Mon, 07 Jun 2021 09:18:07 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=cRKJ=LB=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lqBOZ-0004x4-1d
 for xen-devel@lists.xenproject.org; Mon, 07 Jun 2021 09:18:07 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 75df9bcb-a70e-4571-ae7c-fd4b61d292ce;
 Mon, 07 Jun 2021 09:18:06 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2058.outbound.protection.outlook.com [104.47.14.58]) (Using
 TLS) by relay.mimecast.com with ESMTP id de-mta-5-T6Eo7SO0P92nw3SxhaRuTg-1;
 Mon, 07 Jun 2021 11:18:04 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB6861.eurprd04.prod.outlook.com (2603:10a6:803:13c::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.24; Mon, 7 Jun
 2021 09:18:02 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::f06c:6f5d:34d2:1c36]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::f06c:6f5d:34d2:1c36%5]) with mapi id 15.20.4195.030; Mon, 7 Jun 2021
 09:18:02 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR1P264CA0035.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:19f::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4195.21 via Frontend Transport; Mon, 7 Jun 2021 09:18:02 +0000
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
X-Inumbo-ID: 75df9bcb-a70e-4571-ae7c-fd4b61d292ce
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1623057485;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wRkRbn3AbloXa7G557ju067kqLTR0OyT6peJ3xbSZ5I=;
	b=OrEaUFCh4jxBn2zftwWmSke2QCzhbXY8UwEyyEGhnAPWKcIROLPtQozax4PZe5sP9x4iOe
	bczpjqpVWyYHnjdK//EQ+82pSy2rF1Mo7PnEMdSGNgaQPPVcIxw46+lVaXFXKAp1qidk1z
	s4KQrz99B9IiR4HfURRGUQ3Q0eBM4t0=
X-MC-Unique: T6Eo7SO0P92nw3SxhaRuTg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hMxhNPszEnH6riyrM8/uG+P2jRMqiHDaM6rBAdbk32HroHs+Bz2dv03NGaH1gUlpZ9kfvjDyjEYT6l48m72YSpbUX4CzD0LQ3w/agwCakhzQNjMVB5egDJJNGuxlFOoh4H9AzGuqK9jT/BpXs0pzxYE9oLLeuDnqXc4EuS2aYSHvCm7tCv2q0iLOmcEBxlimQJuqFpS/hUNVOd9gpqmpiVdtOX1Ns/h5tCl4SU7v+wtwiqyTLO1oRut6yNaGGSKi9AbT/+xRN+MfiKoNFH5I6LtRRNG4fN7uWP34cVRC0cBezXdLu6tw6WGqTogH7mFurpHf1TJvoEmqz3yqHm0tPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BBrx1DxEgaiU2peoYV2TlBUX1tr7Kr/OMfPtof5nPnk=;
 b=MCmglBEWDydHVWD0iBlENqwiFfNkCs+09dyQMoCF/Q3tPu49jahrW64HXcGoxq8q0ZcCi9eD3mj9wmZ22VKJq/HmzLbB1GYCnBSjQh6/QsrPpJluYhP2ZXM0zGXOPjcftlo8Tcn3GYpmdukkg3XKNdJ0Vqs/EJ25bHsIzNseT417L6QjHJqosLyVRTeM+s+9/rXAYFWleVcxf79T25BQr6cGijinYPFKF8wo5fp52hWC73GPHL025RkrCxAUiBiBYuFBrOW9ULnmJvY2z7xKuQPTfWGreSFA6EM4D8D/CrElzbP3wG1gvysZYI0iTXm4sMcDJqBHPtKGGOu4nKme+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH v2] SUPPORT.md: Un-shimmed 32-bit PV guests are no longer
 supported
To: George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>
CC: xen-devel@lists.xenproject.org
References: <20210506124752.65844-1-george.dunlap@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <ce26e02d-e784-4c07-3061-36f64ed7d287@suse.com>
Date: Mon, 7 Jun 2021 11:18:01 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210506124752.65844-1-george.dunlap@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [37.24.206.209]
X-ClientProxiedBy: PR1P264CA0035.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:19f::22) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6add63d6-44c9-4830-9721-08d9299526b3
X-MS-TrafficTypeDiagnostic: VI1PR04MB6861:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB686178D7AC1F3E119CCD9E0EB3389@VI1PR04MB6861.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	JBME0OUxWKnJflw0iYgV/B7Twrv1PlgLttn7oeNje6Ak5RibtoqtQu13Z+7nsiLxVuurzWBXecf7KmGn1G0HVQ3/LJT+O8PJM/5UH/n+/qwglQ59fmxQhnEi5vfGNHD1jLKrfCHhAvR6bAAwDXPijv4ZB3Ti0jN/B1Yy14K0l0cg6s1xRQb44vjSXU+g3OYrl5QhBF+S4ht3zEW9bqA1KI/FE0vubmkrH1aIOVi0iLfM8CYMrZWov1MYGHOXehXW23+aCJZ0ZWeVxqInjWqZjiBhpkDqfweVYJrGi8YtPOIl8j3v1r/wfvJVHRfDGnFvQTQPqvxPw97oiSz/gML/hVQe5k4zHDhy+0R/ifD12dBQJursMbhV+xKc48FRR+gxIBTRf0lPCKCmK6UZP4xUjOHo5oYq1mu4XS4Fp8PW6JOXMAT+85LJTytjDXZYlvRQwMZyGgE/++cCG4xR880Lb2CgphPG+Tpdt0Uo4cEISmsYKMQGt3/s2OW+f6M6kWbmEOGmByK9PlGPoTa5RccCv1YAF9vrQheB6L96odmyWH7L8zAWqEy84G4S4zvSFPvE/kt+h8jC3l+3PnJf/sZygGyVZrfkoLvD2IUOTdk6hBdVNiq0FCCFQ4XU5t7AH4CPY0E0PlPeVT40MK2e9n3uEDe3DmFj0QxfRjadhfcpNRS+vAaPWFFoWzP0lNbpvUfs
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(39860400002)(396003)(376002)(366004)(136003)(346002)(5660300002)(26005)(186003)(8676002)(956004)(16526019)(31696002)(2616005)(86362001)(8936002)(31686004)(53546011)(16576012)(110136005)(36756003)(2906002)(6486002)(4326008)(478600001)(316002)(66476007)(66946007)(66556008)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData:
	=?us-ascii?Q?U3ORTMftSWGLKHO3ugqOFKAJ6Gy8FOwupkY+E4Y9Adb+INjxacpb1KO+dIcu?=
 =?us-ascii?Q?W/6Vo9eIaLhxs37RmrgPuVL5Vxp48pOWi0kI8qwZivOfwVe21INJw+DCKMfX?=
 =?us-ascii?Q?ADzbsHbMU9L2K1sowRw9ws3NCYlVQ2cp5KVET/nE5hCQppWqeYtMcybyorYH?=
 =?us-ascii?Q?RpeZbMkqU6DliI90921I+8LHij2z2FQ7P9Ofw4km35wE6FHSSnw0DKnNPqaK?=
 =?us-ascii?Q?T0s3VrnHGWGf7qVziYKfdl3BAme5lRy8u5JJkhqyj1IVMjHHvJBeqtJ/U5k3?=
 =?us-ascii?Q?J4NI7cowBHHJaAvTgjbgj4QMuioDQXYcgOGYjfZWHLCFjt2DGnxbMzF6favH?=
 =?us-ascii?Q?oYkjMhXTpY85b0mAaTrNS/lE/Z87fC/lQW851zLXCi2db89ZzavpvYXPL2gq?=
 =?us-ascii?Q?RXlxYU1D3eRypP21ASW1O58Uyqx/4kTNZG1MTwdpQLGmfYp5MNkRifJsTmjw?=
 =?us-ascii?Q?SzOMg+8GRLISupPNcz4WVR6lHgKe8/l9t0xcK3ydgmplbzso1b0vqyVNZi5L?=
 =?us-ascii?Q?3HZbFq2YWQX5kzAsz0a31Q62fDMVEW6F4dr84vyKCJjVjsqJE5lUWYnjcTSW?=
 =?us-ascii?Q?2r7OVmBwhu9SscFitHk+77NHrHfC/uZC6C2BfbR/GsMSTOwY9spjR4j2f5ah?=
 =?us-ascii?Q?HXrSl0cJLv5dJwF2FM51RgfmpvLpIjX7/WZgIEZLwgbnuPhqQdWFxLYI30s1?=
 =?us-ascii?Q?ZY6KtIxlCC6ACgO9rFiGWRfx6OloVVkPtcgx28C5i8q/Np4Hp6HZTEr5yKuB?=
 =?us-ascii?Q?f6S+CugA41zLmTWTWTmGe6pg/Dv0EqTTuL4o3FyynkuEtr/G1/QvrsZC8lOW?=
 =?us-ascii?Q?4wfmsgdO0LkmVmElSWzd1TlqhR918zqHIiA1TBKTxGu1pSles435YP/q54Ut?=
 =?us-ascii?Q?auAy8ijPbvEYj9WAQDvbOFlGQq5EgwwFedWKSugeiLhKuwGynMFGRLlCgkwg?=
 =?us-ascii?Q?NHyv3KTcz9cj5ji+ZW9Wrz99q9/UTJ281BD+80eb6utFulE3F/0vbzvySJGv?=
 =?us-ascii?Q?Dh6VFlCNjZMzYR1Nc+1QJBKTRIjBc3ZMDEAnJNXVb33em0iugxjajbW1ug4h?=
 =?us-ascii?Q?MBUY+C4OFaB9pv/N9c72oZlH5SADEWfy3JscwPCdKp0Ogc6blbDP6AGwo3eM?=
 =?us-ascii?Q?1HLkNJO8APxoZSRzV06DwKnes1WsrEv/yYPsn2H+D2KhsT8R76BL8q2Yhbsy?=
 =?us-ascii?Q?vNu5JQbnnPKzcU5Qh4eWAs8RHP2g0PN7xaZ9NmP/zpgxFPIBCBNOCfdalI93?=
 =?us-ascii?Q?dNlCAMXARbUb3meBkF6n+BH6EzhIpZqWIcHa9FZAXRNZ/lbp5FoZYyIPrkkR?=
 =?us-ascii?Q?ccD8Y83vmQDscISid3KRaBmb?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6add63d6-44c9-4830-9721-08d9299526b3
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2021 09:18:02.7144
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: huoeaxHypID3LqwSM4DeWT2CPH59v/4QC5YOx2dp0cgwpX7vuBDoX7cA2RLf91m1ErTCn9mM5eKsBfp75feBSg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6861

On 06.05.2021 14:47, George Dunlap wrote:
> --- a/xen/arch/x86/Kconfig
> +++ b/xen/arch/x86/Kconfig
> @@ -55,7 +55,7 @@ config PV
>  config PV32
>  	bool "Support for 32bit PV guests"
>  	depends on PV
> -	default y
> +	default PV_SHIM
>  	select COMPAT
>  	---help---
>  	  The 32bit PV ABI uses Ring1, an area of the x86 architecture which

The tool stack side change that J=C3=BCrgen has just sent will only address
the smoke test side of the resulting fallout. Unless steps get taken to
continue to build Xen with PV32=3Dy in osstest (despite the changed
default), I expect many (all?) of the test-amd64-i386-* to then fail
when doing a full flight, as otherwise a 32-bit Dom0 then also won't be
usable anymore. Of course I think I recall the question having got
raised in the past whether the 32-bit Dom0 testing shouldn't be dropped
at some point. Yet even then I suppose some 32-bit DomU testing would
still want keeping, which still would require a PV32=3Dy hypervisor.

I guess we want to postpone backporting until that is sorted.

Jan


