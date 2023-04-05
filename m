Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A7E86D7D7D
	for <lists+xen-devel@lfdr.de>; Wed,  5 Apr 2023 15:15:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.518529.805184 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pk2yR-000139-IR; Wed, 05 Apr 2023 13:14:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 518529.805184; Wed, 05 Apr 2023 13:14:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pk2yR-00010L-Ev; Wed, 05 Apr 2023 13:14:51 +0000
Received: by outflank-mailman (input) for mailman id 518529;
 Wed, 05 Apr 2023 13:14:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gw2r=74=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pk2yQ-00010B-43
 for xen-devel@lists.xenproject.org; Wed, 05 Apr 2023 13:14:50 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01on0620.outbound.protection.outlook.com
 [2a01:111:f400:fe1e::620])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d7716a81-d3b3-11ed-85db-49a42c6b2330;
 Wed, 05 Apr 2023 15:14:49 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DU2PR04MB9523.eurprd04.prod.outlook.com (2603:10a6:10:2f6::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.28; Wed, 5 Apr
 2023 13:14:46 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%6]) with mapi id 15.20.6254.035; Wed, 5 Apr 2023
 13:14:46 +0000
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
X-Inumbo-ID: d7716a81-d3b3-11ed-85db-49a42c6b2330
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IK0ByPSu7cNyDE/ZVGvNyUdr4GKHcAVgFKC7pvcaUX9ep5AquFUp/rqOp6dkfsrMr2RYl9Ai++xARhi2nJZ9xk2qvvWw0Vh6tNCeUyziYtmuLUIfYBTWBDTeb3QiCwuoSvThqN9WftfsOS6nEIi57y1z6fy7un8NbEjIWs+qhTAUTtCLCAJyHo3JvGS4XzX8VsXpVPb9eOEIWB7ekKuBwd8wOuXAWZod2nSqbvwkbUrBaaEtdeqgcASHNqrR7PaJAjh2eLMN7gRTcIuypVHe/XaCepRJBsKmuL6xER3qjqmxq5+O75XkA/7uaOH8x0Cz2+ZFAFqKWrodKjf5hIgJFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=imZI6b+yoZSV7HogzUtbHcB4pG1nP8AqkDs/5EMUxAk=;
 b=dcC8xVBO0KqmilzM+Z8Bvon7nZJwa+eGflSvnn49mg66W4nAKQdRiZATv5YNeHSZvRatDcFbr/qsGBHzFLgzt4eHm+qwW22AzCZQf4f1djYlaDEo2kgfoWzuOp10WpWdMfvrdroqpuc4lSczC7bi+IYb/y8sof6wxpjUB3vCICJmkHn8NDLkGoo22mEubQ/BG+U7yTTtvnzosNtVOD3pOntpot0ZJwUrucX0FDvGMOgAEIqWW2FjosdoGaOVCDxPIq3tndxx4hgaiOfer4CSKvtaY8TOmBZ7jcWzWJM5wKj8JRVphvoSEDOdoOYHM7K8HhiyWve1LWRmnbeDoh+gjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=imZI6b+yoZSV7HogzUtbHcB4pG1nP8AqkDs/5EMUxAk=;
 b=h1dfp0fOI5TFWwfT75I7xEa0C4Mk83+RgYWi1nwTTSYK46DCFSre/seNXzCE+a221dDV6jwVnF2PhU0oXEBYY/4aY8llcytibb1xUiM2cki4ja3jkBvcMeVW0QrccOfEh7CDbDI0hDjAd2lX9OJhR2mqh/AcuDYUuSeY/exYD2fmxi7UE9Mer5cWT/MBnXawBf+aekZZ7lTJzMscFpSv3LvOqu1S5BkUy+LMpyUjEKvTs75cXAzre43S0KAD2B61o2mDwHAc28m/Kjnefz+GsKHPvKWRl7EHxGvp4aN1GmEBSD8s+8ozz3IL5F4VKDMNwjG5IOylejjfK2t4YJ2OmQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <c22b42fc-9dcb-72cf-ad6c-fa4311502465@suse.com>
Date: Wed, 5 Apr 2023 15:14:43 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH v2 1/2] xen: move CONFIG_DEBUG_INFO out of EXPERT section
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20230403162823.30681-1-jgross@suse.com>
 <20230403162823.30681-2-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230403162823.30681-2-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0058.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4b::19) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DU2PR04MB9523:EE_
X-MS-Office365-Filtering-Correlation-Id: d32427e7-e4ea-4a32-c77e-08db35d7b9be
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	b7Gzme0Y2q+/k4HydgpoyBzp9nf/NdugyddVAdefsyYR63o0ZyuF7aAbolQ8iC8kAgNuoGFhVeoVPRu+gCQrXIfIOjwoEwoIwsz/wj/5FQ3MJ+W0FLsWmDXTBDnWV2Qx7+b4kFtp0+yu0OQioWQLeM4YrY5h4bROoT/0fbc4oepF06pBVWio2zWMcOWUs2b2aSkaje0Kuj+KZ3HOytKAzelD1cxlySLWT2J62ms2/0lM8iqmumWIezXxeFF6FmVx8HDAUmoU2pAOSIwyGIfWLQURnvoSkSDS5YAezlooc17AGwdTpWRRhNcXL8W3/4WSxjdOnNG6gDa/w4IthEhdX/7Ys+OWYEENVKapOOpyfKnnPkvMQAzL2uc/Ywa0i4MlnkpqWrRK7BdQiyBICDiG1zkIGnJKKoGmolJpcNRQUSaRkoWM2saHxNzOtvlVOpYkC7o9pA26x1w3Z3GleXnPOsFksNb7so3BvBKtzjnReMu+TPF51d0L5rpbNqIG5yDWkmz5gdkzxEk6ZfnHocIpHBxDYu4tswTfycOSZ2WW5q/ynZuhTs+wwidYEnMZOZfUWDmDhWdk1yKHyT1jGS48JisLm1TNb+UuFS1p5sWqfFhlEqjXTN9pdfwaDpHoG8XZqYZoJbt3SzVN/HNBVtXrLw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(376002)(346002)(396003)(39860400002)(136003)(451199021)(31696002)(2906002)(36756003)(66899021)(86362001)(31686004)(83380400001)(2616005)(186003)(53546011)(6666004)(6486002)(6512007)(26005)(66476007)(5660300002)(478600001)(66556008)(6506007)(66946007)(54906003)(38100700002)(8676002)(41300700001)(316002)(8936002)(6636002)(4326008)(6862004)(37006003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UTRDY21EWjlYRFQzSnFwYmM1TVBRa0RrV1Z6S2RvK3FKUnN4ajVPZzFGeUhz?=
 =?utf-8?B?ZVpsT1ZZdUluRCtTZUEwU1ZIakczbWZJN1lVZFEzeFpaQjd5VmNxRklMUGV5?=
 =?utf-8?B?KzA3aFF1S2tGK3N6ZWFJUDdJTGJtbGJMK0tMMi8zSlc1VXZsVHBIWHVLOHlC?=
 =?utf-8?B?VmJPMjNJdmcybWExeGozZ0NrbHJVNm1GV1J3Um9DNGh0clA3WVF3RnM4TVpQ?=
 =?utf-8?B?OXMvdWFnQTR3OVcvSHcvTmlwSGJxMVhsK21URk1DUWtpbk5mK1ArSnNjMXhN?=
 =?utf-8?B?T1lnMVFlVVJMU0Zma3VqN2pja29JdE0rZW1wSmovQ2JVR29sTHErNU91SFA2?=
 =?utf-8?B?ZHJzUzJvanF5R1orS1k5Sm1Wcy9SVHN3eG5nVUFDdmRGT3prM0c1Z1R1ZklC?=
 =?utf-8?B?SFkzWHpkbmdzOXNWbHJXd0J2c2MyQldLR3JVTVBUYVNxOWlIR285a3h0Skhj?=
 =?utf-8?B?WFFQRzdheGNWNGdjQllweEJscXluSlNlL2NGZWtTOFhpblBDcmpKWHdHYTRO?=
 =?utf-8?B?cFE2anBzSy9nTGprVUtpT1F2U0ZCR0owWnd3aTl4V1NGWksweitxVWlDYWtB?=
 =?utf-8?B?bk55aGVCaW55UWJiN3pvVG9mbkxsN2ZFWEg1akpaYzhYbnl2RTlNV284Mlkz?=
 =?utf-8?B?MVAyM1BGalgyQkdrRTRDNkxpVnZ0d25CQlBWZkdTNmhlcTgyTWdaL0RDekZy?=
 =?utf-8?B?QjB4QWpZMHc3WTd5c3lrYW5xMUs3QUhYdnRGWm95WmkwM3N5bnl4eldNcW05?=
 =?utf-8?B?SDN3ZnlZa002azgydHRQQkJ5c2F2RWxZK1J4eEpBUUVFUEF5eGdtZDRaci9h?=
 =?utf-8?B?Sm1NZm15K01Tc0tmeVlLUDl0SEVzMDlxWmZnNGN1YzN5WHlYNFg1SzR4ajd1?=
 =?utf-8?B?a0xINVBDd2cyTS9kVGhSTUMyOWNtcHhzVFFic3d6Mnp5NXBWSGJLNW9jOUox?=
 =?utf-8?B?blRLRmZGOVNSYmUwYzhhQXpxaUFmQ2Z2RE9kTWQ4ODFnK1ZIbWRiazcrYU5t?=
 =?utf-8?B?TlFqVWNsNFMyOVdHRVlWWnVuNVR6UjFsUUVGQzZFK0ZwOWpSOHNkSWhmU1hz?=
 =?utf-8?B?ZVdtNG1jd1YzY3gyMWpSSkh4WVpCN2RPNVJsOXQzMTI2VDdCcE9nbG5xcVF4?=
 =?utf-8?B?c0pJM2V0dVhMa0I4NFVFcWR6R0pBNWtENTBFU2ErTUthcVprRkdXRXJLU1pz?=
 =?utf-8?B?cnBlNm1RWU83emdqMjNTYWtDYnZBV2dmMnJybmxyUXhWWUpnbExyVnByUXBI?=
 =?utf-8?B?dW40Snh0ZXN0aG5DR0ZlK1hXaGxHVVliUTA5R1hhVzN3TlJ6d3p3bVBuUzJv?=
 =?utf-8?B?N2xmbjJTd3QzQ0c1UTBGcUJ2UExIV09pQjQyU0kwQmZwaTRUQzRMMXJiZnAz?=
 =?utf-8?B?YzZZVENUQWVZcFF5KzVZQUhxS0QwSHVhV3FvOVdWVUlnaU5ENFBGUURBTGpM?=
 =?utf-8?B?d1lQa0d0alNaQUtiOCtDNXhnd2djQTFldTlpZG5adkMxZmZhS3pyWXRXS2Zj?=
 =?utf-8?B?VGltNkg1Q1RTNm1LZnVJcWJON2wxN0syZ3lWV2w1YWQyU1BBMU5XRDBJZ0Rs?=
 =?utf-8?B?bkFoenpFdzlKTStEb1VZbklQZWVoOUVnVnNTOFhMdWwzeHlXcENEWTVXeG9o?=
 =?utf-8?B?UGU2TkNtVGJpRHBUMVJSOXlsenM5QStPeHFkSnhUUWFFM0dxWnp0TTRZYm81?=
 =?utf-8?B?bnlPZE9tR25pVmR5eFY1Y0toMXNOaDBIclVPdlFSSUdhODRqOWxuQ1k5K2Jr?=
 =?utf-8?B?b2hDQjBKdHVEUkg4d1UvZjFSd0RJZzlHZ0g5VFVSRWRROGpreGppZUoxNGdX?=
 =?utf-8?B?S1AybFJUYk9VZkhOa2dvTTB1cDB4emFPUzZGMDgxRGxOeGJZYVJ1YVNJVFFR?=
 =?utf-8?B?QjBYMThmdDM1Yi82U055MzlYeW5wTFJFMnB5UVVCcFRmb0s2SWgyTWlqckxK?=
 =?utf-8?B?dDhaRDl3c0RkTHZyZS85WkRhZCtLb3VoUm1wSHQ0ZnVsNy9Cb0luTmFOSVpX?=
 =?utf-8?B?V1QvL3dQL3h5U3RPZUhSOSthVDBnMGR1RFNjdUVFY3RlR1dCUm5KME03elVn?=
 =?utf-8?B?Z0FNL2twQ2pnL2F3bExXU1JXZ3NWS2ZKNDJqaUJPOXVpWnFUUGR0bkxFWElY?=
 =?utf-8?Q?EbKkHHvE+kjB60bwUfd4AxpXq?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d32427e7-e4ea-4a32-c77e-08db35d7b9be
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Apr 2023 13:14:45.7355
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Wf4DR2jPDU/1CE7EpBhl7kdY7sPLdAAdijKAGh2pKuduZGocX39wxDBBujfsHCuvfiTIgaAnP820S3wUQvpedQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB9523

On 03.04.2023 18:28, Juergen Gross wrote:
> In order to support hypervisor analysis of crash dumps, xen-syms needs
> to contain debug_info. It should be allowed to configure the hypervisor
> to be built with CONFIG_DEBUG_INFO in non-debug builds without having
> to enable EXPERT.
> 
> Using a rather oldish gcc (7.5) it was verified that code generation
> doesn't really differ between CONFIG_DEBUG_INFO on or off without
> CONFIG_DEBUG being set (only observed differences were slightly
> different symbol addresses, verified via "objdump -d", resulting from
> the different config.gz in the binary). The old gcc version selection
> was based on the assumption, that newer gcc won't regress in this
> regard.
> 
> So move CONFIG_DEBUG_INFO out of the section guarded by EXPERT.
> 
> It should be mentioned that there have been reports that the linking
> of the xen.efi might take considerably longer with CONFIG_DEBUG_INFO
> selected when using newer binutils.

Thinking of it: Because of the need to deal with older binutils, we
already force --strip-debug as a linking option for xen.efi in
certain cases. Perhaps we could make another (x86-only) Kconfig
control which allows to force this mode even with recent binutils?
If so, would you be willing to include this right here, or should I
take care of this afterwards (or maybe even in parallel)?

> --- a/xen/Kconfig.debug
> +++ b/xen/Kconfig.debug
> @@ -11,6 +11,13 @@ config DEBUG
>  
>  	  You probably want to say 'N' here.
>  
> +config DEBUG_INFO
> +	bool "Compile Xen with debug info"
> +	default DEBUG
> +	help
> +	  If you say Y here the resulting Xen will include debugging info
> +	  resulting in a larger binary image.
> +
>  if DEBUG || EXPERT

Just to repeat my v1 comment (to which your response was "Fine with me"):

The new placement isn't very helpful when considering some of the ways
kconfig data is presented. At least for the non-graphical presentation
it used to be the case that hierarchies were presented properly only
when dependencies immediately followed their dependents (i.e. here:
DEBUG is a dependent of everything inside the "if" above). Therefore I
think rather than moving the block up you may better move it down past
the "endif".

Jan

