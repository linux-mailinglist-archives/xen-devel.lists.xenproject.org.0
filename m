Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F3E593ACACA
	for <lists+xen-devel@lfdr.de>; Fri, 18 Jun 2021 14:26:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.144563.266071 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1luDZk-0005zw-1v; Fri, 18 Jun 2021 12:26:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 144563.266071; Fri, 18 Jun 2021 12:26:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1luDZj-0005yC-T7; Fri, 18 Jun 2021 12:26:19 +0000
Received: by outflank-mailman (input) for mailman id 144563;
 Fri, 18 Jun 2021 12:26:18 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lC6W=LM=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1luDZi-0005xn-Pg
 for xen-devel@lists.xenproject.org; Fri, 18 Jun 2021 12:26:18 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d88f9200-790b-4fa9-b8d8-fcda2174bfe8;
 Fri, 18 Jun 2021 12:26:17 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2050.outbound.protection.outlook.com [104.47.14.50]) (Using
 TLS) by relay.mimecast.com with ESMTP id de-mta-1-DQIg10i-P8aympca0c91rA-1;
 Fri, 18 Jun 2021 14:26:15 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0402MB3776.eurprd04.prod.outlook.com (2603:10a6:803:18::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.16; Fri, 18 Jun
 2021 12:26:08 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::f06c:6f5d:34d2:1c36]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::f06c:6f5d:34d2:1c36%5]) with mapi id 15.20.4242.021; Fri, 18 Jun 2021
 12:26:08 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR2P264CA0030.FRAP264.PROD.OUTLOOK.COM (2603:10a6:101:1::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4242.15 via Frontend Transport; Fri, 18 Jun 2021 12:26:07 +0000
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
X-Inumbo-ID: d88f9200-790b-4fa9-b8d8-fcda2174bfe8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1624019176;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=B35jHuO4X4cfqMD3Cnwo8Bk7zpT7c8awP7FUbsVIVdk=;
	b=FovnSbmK9JeNMEGFCwQckc9s9HSs4JcktRm4ss/VIV+i4r1LowmI7Fr7jOC/dj6fdrWaEn
	56GAEXZez4o/RDinyzAxVD3Sk/XYZeWL6X0oBR6mu7MEXDC4UIH1iUembHit8UJpjbD5RB
	QmEVmKAPPKwqB0G/tWQ0qhGI5S2Io8o=
X-MC-Unique: DQIg10i-P8aympca0c91rA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aEY/+2uAhgjEnR/wfyZ6E/Dl+bmz0IUXaR3/NK63Ks75l0P5Q/QuFjlK3cEHEcs63xb6KqWvMnTpICnuL6yvgWvfpmfBbd8Aea9+RRe3UE0YZaBbitm4ODhKJiLEw4WsqQmT647orVGK3nIU5xfohvtTDpA3EsGATW7gsyMIobjhAuixvkLReybqNZ6ANhNZmC2JF10t3hhz41CW6h5q7ioODaWGWvmxO2Fo5B+Q1u65BPb+FhNm/nlSBY+rMlBWyK50rKlNOX49jPkDLrkoBwy130Notn/iSXXW6AFuVwOQKHW6dG4J0i9X+tlWa9koBbfBHHb1b/tz5muyJ3MSyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B35jHuO4X4cfqMD3Cnwo8Bk7zpT7c8awP7FUbsVIVdk=;
 b=lrHqv3BopXitkhqvkdLKrzCaKpo2JC5vDBTk0St3NkV+hjVuAycrHWUdJOlV+Wnlh6ROxSrYZlJVH1PwBEyhmVwzErp65aOyeQGCNhdmEGCa7MCXA369TNEoR/EyAKp2NFTIcC8ntp0N3rYyb151wDQk3aBErHNs6Xa5zQxdfGoPQ6WGzNXCpjyRc7vpL+KYY0Y210MEP4qI/WW17q4aUQbok1JhioJsqo/tsF7/bGyMTThRwornPVf0r+S27NqG3XwfQSTRsRzn+Lr81ZnpoHTi0TwEr93eY/NAA1Vf1bY4iKaLnWQM++napSepW0Re6yRRKawT6P2GVpZhN/pQQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH 3/6] xsm: enabling xsm to always be included
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Tamas K Lengyel <tamas@tklengyel.com>,
 Tim Deegan <tim@xen.org>, Juergen Gross <jgross@suse.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>,
 Dario Faggioli <dfaggioli@suse.com>, Paul Durrant <paul@xen.org>,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>, persaur@gmail.com,
 christopher.w.clark@gmail.com, adam.schwalm@starlab.io,
 scott.davis@starlab.io, xen-devel@lists.xenproject.org
References: <20210617233918.10095-1-dpsmith@apertussolutions.com>
 <20210617233918.10095-4-dpsmith@apertussolutions.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <c8bd347f-cf14-8b86-81f7-51c035c5c972@suse.com>
Date: Fri, 18 Jun 2021 14:26:05 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210617233918.10095-4-dpsmith@apertussolutions.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.24.206.209]
X-ClientProxiedBy: PR2P264CA0030.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:101:1::18) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b8324a45-552f-4b92-018a-08d932544016
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3776:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR0402MB37764466B260EF58A7A608C5B30D9@VI1PR0402MB3776.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	OHtIezoPzJmDU8BYniVPt0ZswHFAlkTh5oCxC+jzfBNMkUGsBpXT1R6Wn9v1eQ8rBQNkM0j9LgySRZ9YpvC6QC0SuflF1VfyjtKg55yWWhUDxFTll5L2680QeTTgfcmZNPGD/LenSijodnfqq66ILehBekyEiyssfXAnXqxM0xbucqVIynrSclkWcAVYHIhJ4zbrqMObwthRjLN6hd3E6lZxJ8B7GT9BCt6O6vULK7o4csOG+SqqXO1RAaGPorDaEjs9l7CfIMK/MBjqHUPBJYP9grPKPY3w1hnu/hGp1313P6csOfY+sK0FDX+PqVSHtCxXG5lwFrnAgh/tI9xCJ6XfkJVJZjfaDzt2CrkNOkfnMSYW+eHDGiUdE9g/HSp6uhpc3P9uc7uKX6U6XsYqL5SdhABbeSP6dEWdlUMghY3ZaWihYnsGACIj8ldbzUekDusC0SbAYKjU6ap8hEbW8tu97pvVc4g7ycRUpqViyTp714ddp2ZgZlc+qByzo/+munUS7UKhGdqpZTdcTboft2O9zUSHErlzdyFGtxCuqYC5tFyTHuo2twy90UmCMBeATHIUPBRm8t3avrjDb2130wOlDcDu5+bJOFk0+Bc4BhGbfTnxjm72P3/d9Ypo8IdC4TyU3YDGZHe/BV6Z/hVueG7TBgkXGB9Ry2gXrszGJ8xgAFiZFYkrhhbCRb1HFYki
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(346002)(39850400004)(376002)(366004)(136003)(396003)(86362001)(8936002)(38100700002)(6916009)(7416002)(4326008)(316002)(16576012)(6486002)(956004)(53546011)(54906003)(478600001)(66556008)(8676002)(16526019)(83380400001)(31696002)(5660300002)(2906002)(2616005)(66946007)(66476007)(186003)(26005)(36756003)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SXZBdU9YckpZU1U1alBBYjQwZFVIUnFnS04yOEgyRmFXdFovSkdCVDVYZXI4?=
 =?utf-8?B?YkVLZlgyNFBsMjRDMWM5dW12Q3lKcDZ5MHZiODVpdW4wZ0JLWDFLeG44Q2FK?=
 =?utf-8?B?cVVWbFFzRWk4Z0NxTWZhT0lxNkhNQXV6RytrZDFaVEhIVDRmQUJkek1remFY?=
 =?utf-8?B?V2FTY3BrQkZCTFhaSEVNbWl3dUlnYVErczFZN1ZmZGFTYmdVaU50OTI4UlJD?=
 =?utf-8?B?OTMyMHhtcmNva3FDU3JScVJGSGN5ZTgrRWltanRJK3BZdG40K0pIZGlKNlB6?=
 =?utf-8?B?L3ZLQjRHblViaUs4eVBLMW5OQ3B4dHprWC9oc0s0RnZkbWdsYjNFWHdzazYw?=
 =?utf-8?B?Y2lQUDk5Ly9vcFk4L3dNUnlMQzZRaHdmNVV2M0hUbkk4Z3VQN3ZMM2I1Q3Fx?=
 =?utf-8?B?cy83ajkvZHpEYmQ4M21TVklrQXRmb0pnS2Jkb1JHL0ZRbjN1bm04S09kS1N1?=
 =?utf-8?B?L1JXTXJBVkdxZmRTQk43cUI5Um5BdDZFeE1HaS9iY1F2YTVabTVKRDlSUURM?=
 =?utf-8?B?K3BYN3ZXdm1tMkZvQ2c0eGIyTUp4ek9QSXpodS93UXQvUGFhci9INGhDMlVo?=
 =?utf-8?B?cXlkUnRMS2ZNUFk0azA0K0UrMzB0bmc4Qzh2RlArOUZKVjdwZzFrWnl4eERs?=
 =?utf-8?B?Y2RiQ3hXNk5UV1lBMnRZREs0b0lJV2I2elpycjg2WGVvTTVVQ3ltbnc0VE5H?=
 =?utf-8?B?V05MRWlucElnN1h0WkRyeHFRTUp0N2gzWW9zM2FkS2RSNC9Lbm9DQXo5eTJh?=
 =?utf-8?B?QTU5Mmc1SC9HNkgzaWNiRWNXeUpqV1gwaGp0cExHUmF4MmE2bnVZY2M0ak80?=
 =?utf-8?B?UVJ6eEl6SzhNZUovc25ENFVpVWNPR0N3YTBBeG94T2tneHZHVm1sRXFhVmsw?=
 =?utf-8?B?S1dLejhTL2tlbzV5YVB4d1pIVzBTQkdYbVlIcXdBbTk1UXRyUnlDSzhzc1dt?=
 =?utf-8?B?dTVMRk5LRjlkNmgrckwvTVdMcEt1dTc4eG5UNEdwMU8rSWFGZjl4cHE3S0Vk?=
 =?utf-8?B?YjFlZnhuaWdFeTdDUTFnRS9uSFlyYUVMNHc1OTNMeUJReFU4bzZxWmlzMUlS?=
 =?utf-8?B?OUtZMWZTMUd4Rm9TclcvczlSZ2FObXFoOXA5Y1BkODlVUnJvcUpmaFFDZFRO?=
 =?utf-8?B?Y29HWnh0cFNsSHRqUWVCZk1PVStqUHVSQ3hvUjVZZkxLalRlZk80QUhwbmZQ?=
 =?utf-8?B?ekRNYVBjYVZMK1RqVlZaOS8reDRvK1R1RktJRlk4dEVDM3dqdElUQit2ZG4v?=
 =?utf-8?B?OHlWQkF5Y1pJUHlxZ0QySGlWaW4rbngrdnVoaXpEMkNEZVdZM2JRam5URFJl?=
 =?utf-8?B?N1Y5bC82bFhydm9KU3NnTHNEN2dXSUozREQ5Tkc0Z3JzTmlnbi9zZEVNaG5x?=
 =?utf-8?B?Vm52dU1kTS9OR2lmSjhkNU9xUVgrd25LblduQkZpK25qVklOOWV6RDlTY1du?=
 =?utf-8?B?SHlQZmZZUVFjR0JHNVVLZ3RWRjluV1FvbjlqK3pScGxTaEZMMXQ5RGdXY1Bp?=
 =?utf-8?B?WWd6WHRqeW9Xa1JFdWpOZkdqSDdEeXB4a0pRdG1CNXlZZkFzYkJJRXBJYUx5?=
 =?utf-8?B?Vnc5M2Z0ZWVTblFOOHMzb0M2VmtZa1JjSW5HZUdUeGYyVVdBalBsWDFDS2ZD?=
 =?utf-8?B?OFdmU3lvSE01d1hzSWJkeFFhcFB3QVVHanprUjR3MTNwYnlFSzNqTU01djJm?=
 =?utf-8?B?djdwL0Vjd2g5ZzdKRm5tOGpyVnlzZG45YVB4aU5GRFI3Y3FyaDZDL1pWelJD?=
 =?utf-8?Q?NSMclatId5fSF8sIrXwDV2tblDweC+TdMpq6MFH?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b8324a45-552f-4b92-018a-08d932544016
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2021 12:26:08.5710
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 06BahcD5B1G353nC0G0Q6KpoumMADWXR5NkHyVyr3Q4IcqELpJ3+ksyKgJhfcNrgAEK5LDKph+aflTfttlCsiA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3776

On 18.06.2021 01:39, Daniel P. Smith wrote:
> The only difference between !CONFIG_XSM and CONFIG_XSM with !CONFIG_XSM_SILO and !CONFIG_XSM_FLASK
> is whether the XSM hooks in dummy.h are called as static inline functions or as function
> pointers to static functions. As such this commit,
>  * eliminates CONFIG_XSM

Following from what Andrew has said (including him mentioning your
changing of certain Kconfig option defaults), I'm not convinced this is
a good move. This still ought to serve as the overall XSM-yes-or-no
setting. If internally you make said two variants match in behavior,
that's a different thing.

>  * introduces CONFIG_XSM_EVTCHN_LABELING as replacement for enabling event channel labels

Is this mode needed as separate functionality at all? Nothing defines
XSM_NEED_GENERIC_EVTCHN_SSID anywhere. _If_ XSM went away as a separate
setting, then imo this one should go away as well.

> --- a/xen/common/Kconfig
> +++ b/xen/common/Kconfig
> @@ -197,22 +197,33 @@ config XENOPROF
>  
>  	  If unsure, say Y.
>  
> -config XSM
> -	bool "Xen Security Modules support"
> -	default ARM
> -	---help---
> -	  Enables the security framework known as Xen Security Modules which
> -	  allows administrators fine-grained control over a Xen domain and
> -	  its capabilities by defining permissible interactions between domains,
> -	  the hypervisor itself, and related resources such as memory and
> -	  devices.
> +menu "Xen Security Modules"
>  
> -	  If unsure, say N.
> +choice
> +	prompt "Default XSM module"
> +	default XSM_SILO_DEFAULT if XSM_SILO && ARM
> +	default XSM_FLASK_DEFAULT if XSM_FLASK
> +	default XSM_SILO_DEFAULT if XSM_SILO
> +	default XSM_DUMMY_DEFAULT
> +	config XSM_DUMMY_DEFAULT
> +		bool "Match non-XSM behavior"
> +	config XSM_FLASK_DEFAULT
> +		bool "FLux Advanced Security Kernel" if XSM_FLASK
> +	config XSM_SILO_DEFAULT
> +		bool "SILO" if XSM_SILO
> +endchoice

This did live after the individual options it depends on for a reason,
and you don't say anywhere why you need to move it up. The way you
have it, with the default command line kconfig tool, users will be
presented with dependent options before having chosen the settings of
the dependency ones. That's because this tool, to a degree, moves
linearly through the options it has parsed.

> @@ -261,25 +271,12 @@ config XSM_SILO
>  
>  	  If unsure, say Y.
>  
> -choice
> -	prompt "Default XSM implementation"
> -	depends on XSM
> -	default XSM_SILO_DEFAULT if XSM_SILO && ARM
> -	default XSM_FLASK_DEFAULT if XSM_FLASK
> -	default XSM_SILO_DEFAULT if XSM_SILO
> -	default XSM_DUMMY_DEFAULT
> -	config XSM_DUMMY_DEFAULT
> -		bool "Match non-XSM behavior"
> -	config XSM_FLASK_DEFAULT
> -		bool "FLux Advanced Security Kernel" if XSM_FLASK
> -	config XSM_SILO_DEFAULT
> -		bool "SILO" if XSM_SILO
> -endchoice
> +endmenu
>  
>  config LATE_HWDOM
>  	bool "Dedicated hardware domain"
>  	default n
> -	depends on XSM && X86
> +	depends on XSM_FLASK && X86

I don't think this is a compatible change. I'm not going to exclude that
this is how it was meant, but as it stands LATE_HWDOM right now doesn't
really require FLASK, and could e.g. also go with SILO or dummy. If you
_mean_ to change this, then your description needs to say so (and ideally
it would then be split out, so - if this is actually a bug - it could
also be backported).

Jan


