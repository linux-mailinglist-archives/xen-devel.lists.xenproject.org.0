Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E9AE264C5F3
	for <lists+xen-devel@lfdr.de>; Wed, 14 Dec 2022 10:29:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.461894.720058 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5O4c-0002JJ-A6; Wed, 14 Dec 2022 09:29:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 461894.720058; Wed, 14 Dec 2022 09:29:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5O4c-0002GF-6P; Wed, 14 Dec 2022 09:29:10 +0000
Received: by outflank-mailman (input) for mailman id 461894;
 Wed, 14 Dec 2022 09:29:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dEbZ=4M=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1p5O4a-0002G9-9Y
 for xen-devel@lists.xenproject.org; Wed, 14 Dec 2022 09:29:08 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2067.outbound.protection.outlook.com [40.107.21.67])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c193f203-7b91-11ed-8fd2-01056ac49cbb;
 Wed, 14 Dec 2022 10:29:07 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB7797.eurprd04.prod.outlook.com (2603:10a6:20b:2a8::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.11; Wed, 14 Dec
 2022 09:29:04 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5880.019; Wed, 14 Dec 2022
 09:29:04 +0000
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
X-Inumbo-ID: c193f203-7b91-11ed-8fd2-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iKbFNjod6x/ucMUpT3YE7mofZw2jBW8Je5yVgFpB+Vw3tSNHqz6WY8gtmaFisXrtZuoNRQWbb31xCL2NPDeN8nircPYtu55vBIR+WowM0GrFqbbhxSqpOsN8gMe35ByPPkdVyd3nQlU9mGuLmxTSQuQE77j3Z8ZoAeZpk8b3KvP4DW3QIS5rUnumMx+V2H46bAcQEn/FLgs00wXxEvU2x1MBbivwAMvOyuzMd9bsvvAx4cuIUnmo/d+TKQdRiSCoCnssTUsmVcGP0IZnh5Wlrv/rC6RgjUjoySZeZKe4XZulOXleyoA+xyAyUsYR+JXs2L1pX0gS9h4Op0zilhIA2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i3hXx2cbdpKx3o9kl14I0z199W/XNiiVhDO1ry9IzAw=;
 b=lXJ0CKR/y55ibqQfq0PjQ4g0bBaVpv4Nx8afz8CyfPLNr6uYeczdtN9PahhRSA03bFUWEstMjycT0a+W64uvyu0vP5Mh/iyKAQxBUcybnaWNg0B0ywjOfWs9X99d9R/tTR5pq5TBFr4Z8+8akltMeZk22E4dShC285ulbrXaU3BZelsWN93Rh+/uVgRZLkBUC036GaMHc9r+hYf+93qYmZFA/nMjEwy+750hMDbGI04GzHlWpSk0hiAsbZmTR5FhiMDDONJ/6s7DSG9wgUeqNuRp7i4Z01pJ1/ibpmmOdQyT3iIc6/+Fq+Z+Lgvz2r7CFlniCdj9Ztm5nxCIIhyOtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i3hXx2cbdpKx3o9kl14I0z199W/XNiiVhDO1ry9IzAw=;
 b=xTI6n37aWThP0ZAsTZA0bM9QEatNfu9+wencRauM1qS/EAdhoQ8MPQbmxdHWj0lP0ynmZMPlQ/3s3FvZkKS1O95KO82gt7sP2nchIwDLEPXpuqL3elkmAaEwEQUjSh8IiSLqw6vuitW5nEkGdfbvz2qGP3n1Rx5axccGufjaI25BR91Vxws39lAlguYlsfypaMc7hXgFyR8XP1EIsCq0vTuB6RveXOLjVmBI+04uRbcStSAf2jdykT0FqDWL1tH4g3cBmQEBz6YMvDp0EgO+k70uIhToD4YqrsEfZ0+NKchKcCXxAXO1kr60/wSXg1boRDn7Zs4Irm5d8sE3Lf8giw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <42aac506-8226-cd69-cfce-0430781bda80@suse.com>
Date: Wed, 14 Dec 2022 10:29:00 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [RFC 1/4] Add VMF Hypercall
Content-Language: en-US
To: "Smith, Jackson" <rsmith@RiversideResearch.org>
Cc: "Brookes, Scott" <sbrookes@RiversideResearch.org>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 "bertrand.marquis@arm.com" <bertrand.marquis@arm.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 "demi@invisiblethingslab.com" <demi@invisiblethingslab.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 "christopher.w.clark@gmail.com" <christopher.w.clark@gmail.com>
References: <BN0P110MB1642835E0DE845205B5EA59CCFE39@BN0P110MB1642.NAMP110.PROD.OUTLOOK.COM>
 <BN0P110MB16428FBE352C8FC0E76E6C75CFE39@BN0P110MB1642.NAMP110.PROD.OUTLOOK.COM>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <BN0P110MB16428FBE352C8FC0E76E6C75CFE39@BN0P110MB1642.NAMP110.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0057.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:93::17) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS8PR04MB7797:EE_
X-MS-Office365-Filtering-Correlation-Id: 13afa134-94ba-411a-6d23-08daddb5a46f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	7tYOOyrO60rEDyaDX607Mpzs95GB8VClZs/KOqTYrVw4uqjh5wz3IyULOBoicptVUsmk8czbPihhzKQWjz/ep4qM0brPpBcLk7OJsJ2sY+dIFa/Fhy/bVMOR2QT3oHYriF5VTTmOlPPTL67oCZCWZ99aT3jgXg0a8/BkilpHB4iz8fZAAFedBgHNAhYdaDtLW61UaiMeSy/5sCSgWXBRc0U+0BCONU54r5xlzA8hnEprvVlRrMeHjY1cyj/OqRukLn1ZZNuvJ7C09DGNA9ABShURvEZVqKbVzoUmwq2XHWO/eQ48sW8qK0BuoAh2RAGjgPzLxkB4FJiB5udH8L5Wvn7vlAPeVQN24HyWXfg8NqC4bytwAvxJUTpQ8pFHU0BMLe5ppxP3tygzyLaBs0oZt+L8tjXmu8l2Z4cpOw+aFGW3fdQZja+zxWiSoLrh9STmh1diaNluoPkaBr70Q4a3J6XiB+Lq+/5+ErL/pnPlfllxt53nl51s1uvL6lphf5tJ/mlQWQ1z2mSC81WMxL89Hn79koGnAB3TkqxJpRwMgt9g39cDOE88M3XT2B2kdGDiEjtqWkY0e3vLRbYywQ/IKDp2B3mQ/fVWKruDDwAg6N/c5OmSE0k8sSHv0IN7iHgdcNwev0p/lwWUOhuV3DPa7OLsDSDelTLuGD/n0GHLjL4CZ8cJIJTJItxTWv+PMb6cO8AZ5oratPPTC/11x98XlM01Iuz+XLQresaiX+zySY0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(39860400002)(136003)(346002)(376002)(396003)(366004)(451199015)(2906002)(6512007)(26005)(186003)(41300700001)(5660300002)(8676002)(86362001)(36756003)(66556008)(31696002)(4326008)(66946007)(2616005)(66476007)(54906003)(6916009)(7416002)(316002)(478600001)(6486002)(31686004)(4744005)(6506007)(8936002)(6666004)(38100700002)(53546011)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?N2hWT0xySFkycE9DVWtVQW1TY011SU9kQWR3YTlCajViS3VVanF0bDFHdFMr?=
 =?utf-8?B?MU1WUW03K0tCemVEWGVzVG5MZk8zeUFjY1BrVXMyVGdkYW1NdU9WMkI1WDZP?=
 =?utf-8?B?ZTVkbEUxWExLVjh1dTZpcTZhZkoyRjc4Vm5ZcEU5M2wrUE5Yd1F0ZS9Nb2Qy?=
 =?utf-8?B?M285VlgreTZmTnova0NXOTBaVkp3MldaSHlhRTQzNSthK3I4WXlvc2JDQzZ4?=
 =?utf-8?B?YkZEZnNNdGtxTEZtZnkyMTE2d2ZGRXd2cU5vemZwQVVYZGxybGg2Mlp5bk5M?=
 =?utf-8?B?RWdWSUlrZHo3MlVSWkw1R1VUbE5NbzVrdWZ5YXAxY3RuTlJpOStpeDFnZGZF?=
 =?utf-8?B?eUlFZDRzRGVRNUQyeWdtdGMzQ1N0Z0tJdFBqSGkrUVJWZGk2eDIrT0xuSDVk?=
 =?utf-8?B?cVhwZWJobUd1cWZXME1nMHBGVWFERjhlSnJvWW9MM1lRWTJNaURCWGV0cEMy?=
 =?utf-8?B?VXZDaVpzUTBNbVlxYkRQbzBVS05XVVZ1RnFZaEg1emNTZ1BRVmF6NVRmaUpn?=
 =?utf-8?B?bEdwbU5oS0MxWU0yczJwUlAxdnBzbTVDRHRMdk0vUS9LOFM0VlFxUXhHMXhV?=
 =?utf-8?B?Z2RhVThFbitVektDNVZjL2NZbnU5T3JzdGlYTHlBREsxR0dzdXdSVXFyYWQv?=
 =?utf-8?B?TC9mcGQvby9DZjlRVjh5VEFiVFJIQW1HRGdnRnYzTStlWTk2V2dzM2hXcWdH?=
 =?utf-8?B?WlZncjVYbWpkTE12c3duTVJEVk1wRlFtZVZONklhRWE0Y1VmQW11dEZEVlNX?=
 =?utf-8?B?MThoSWdKWmVnc1dOSHgrOVpzdkRwQW16Y1BwMGFHM1VpandCaUtVQnNrOEJB?=
 =?utf-8?B?NzZscVlsOXFRUWtiYXI5TWRqZyttcVN6dmZuU0w3M1NPeE5wSDJaVTl0dnhB?=
 =?utf-8?B?ZTRPaTN6UC9aTXRuQW0veEtDcTI4Z0FmSFhiVUdJdTlta3g4KzVNYUlyaDlx?=
 =?utf-8?B?SldoUEtHaC9zQXkrZ0tmMUZJSTVJdmNWRHpkRWcrNjIrNllpVWdRSDZ3NHZR?=
 =?utf-8?B?dkk5UFJ0OVNSWlFvYVB4dUVYek1Dd3B6Tk42c3RUNTl6Z2RIdXJTQ1FwQnBI?=
 =?utf-8?B?U3QzQXhiQXZTWGpMTURKQ0hoMjZ5Q01TVlpWTm9ZdVJUS1ZBcVVBTGpLaTll?=
 =?utf-8?B?SUNPRWp4dkt3ZHI4WENuR1Zmck0yR1pxTndod0lWVXN4ZjF5aDZGUVJzNjNO?=
 =?utf-8?B?dytBNzlOQ2E4VldCTzR5SnlxMHZiQ0FWVHBuSUhuSkRFaWN2bldjb2RRRkFm?=
 =?utf-8?B?OHpWbUN5NmlnMmF3ZTdKNFJ4cjZPMDU2TUxHTzBucXRabDg2dkNpV041eEdN?=
 =?utf-8?B?MVFKMXZ0OEY3dkFrYUpNOUg2MExyWERlSkpISWh2aG5lUGtBZkVtbS8yc2FC?=
 =?utf-8?B?N3hQL01BM1F5Z05mOE1IbkZkL00rTk53TkFDeU5mbWM0ZlIrQjBscm9LWW1t?=
 =?utf-8?B?ZVMvKzI5V0xaaXA4WXFYMzRWT2xkMThrVU42SkpxRGc4Z2JGb0ZGd2locklZ?=
 =?utf-8?B?YVl2d0hOTU9OT2RIaDFaMGU5SXY5QSt5M1lpM2RnV2pvMUp4RG9qdjJMUkw2?=
 =?utf-8?B?azBZeVBicVdsNk55QmMvUWRzSjA5cVJLT1plWE5Pb1Y4aStEVVowYUQ3VUhK?=
 =?utf-8?B?emNLdW9WL1R4TzVWd2NWS3g0UVdUd0dwY3FSSzJnOGJVNHdhZnVGS2xmb3c2?=
 =?utf-8?B?OHVtRzY5Wnp2dDN2c29sSDF5UElCSDdSZVpMaHR0M0NHck5lOHRLbXA3YXY1?=
 =?utf-8?B?ODVuQ21TWkVlMTJCNnhFdytVZmZ2cEEzd0NENUhwcmFCb2dUSm13dnBVbGxX?=
 =?utf-8?B?dEc3aGdFUDEyTy9BejN4RDg3RTNLWTJDV1ZjMlNnTkY5SmZhUk5zZEFldTZR?=
 =?utf-8?B?Rk9OM3hpY0FpQS8yZDRSY0Rab0xNVllNbUtHWHZRZkVmekNydEs4NitsQzhY?=
 =?utf-8?B?V2hDSHhhcjZNN0xQVmF6czFpTlNNVW5xYkprWTllYlpyVnRRZkhxc1BweWFB?=
 =?utf-8?B?bTNsNUpmMk03OG9iOHFiZDdxTWprdDE0YUhFR0l2cFNuRnlyTEdPa3AwL3dT?=
 =?utf-8?B?MmVHTzVIVkUxczZRQk1tYjc3elo2b0hWRzdRdmVaNmFjcVFSalJuTUN4Uk5I?=
 =?utf-8?Q?7bEetphX45rsg8iFt7KNemcVO?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 13afa134-94ba-411a-6d23-08daddb5a46f
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Dec 2022 09:29:04.6118
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8zXukKDZ6Jkhel9gtiJ2TcvDDasJmyW4QZbulQA0ZEp6DkyOKvne5twVK6OPHzOZKPG6jVUWxxESxlejsFyX7A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7797

On 13.12.2022 20:50, Smith, Jackson wrote:
> This commit introduces a new vmf_op hypercall. If desired, could be merged
> into an exisiting hypercall.
> 
> Also, introduce a VMF Kconfig option and xen/vmf.h, defining the arch specific
> functions that must be implmented to support vmf.

Neither here nor in the public interface header you describe what this is
intended to do (including both present sub-ops as well as future ones,
which - judging from the numbering - appear to exist somewhere). Therefore
there is too little context here to make any judgement.

Jan

