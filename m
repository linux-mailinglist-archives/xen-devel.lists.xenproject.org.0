Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AC0547D6E28
	for <lists+xen-devel@lfdr.de>; Wed, 25 Oct 2023 16:04:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.622928.970216 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qveUZ-0003Mx-Eg; Wed, 25 Oct 2023 14:04:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 622928.970216; Wed, 25 Oct 2023 14:04:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qveUZ-0003Jr-C0; Wed, 25 Oct 2023 14:04:15 +0000
Received: by outflank-mailman (input) for mailman id 622928;
 Wed, 25 Oct 2023 14:04:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=e1rq=GH=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qveUY-0003Jl-Kp
 for xen-devel@lists.xenproject.org; Wed, 25 Oct 2023 14:04:14 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20607.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::607])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 608aca0e-733f-11ee-98d5-6d05b1d4d9a1;
 Wed, 25 Oct 2023 16:04:13 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DU2PR04MB9177.eurprd04.prod.outlook.com (2603:10a6:10:2f4::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.14; Wed, 25 Oct
 2023 14:04:12 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d924:b650:a2ad:7b25]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d924:b650:a2ad:7b25%3]) with mapi id 15.20.6933.011; Wed, 25 Oct 2023
 14:04:12 +0000
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
X-Inumbo-ID: 608aca0e-733f-11ee-98d5-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IKVpOqlI5zO6cyGpJROaOVUWJE46W+7zy++0bHFm7rcdvcWSor3dJSmRET/0mlQLqhRdi30tcODHNl3FjDylJKyZaCAeIfy91ucnyQmeVCvMwmsvqZ6xNLg8hxPGGwbgsakm8+a7geVaXzIUxmMxHZ7NjRZs7IxBeUtnWwxkakQBFntVezQgjLLX189lwOyl3RP0YkBwj5w1PTpsKktWkc+aiDviXTLDYYmWl2K+60KH51VdDJqv89JlPg7pCoaSsrO6QVZMg3Z9hJA1g0BqIAHDYykNpJ5VwB2oq2k3u1uSAMQCyLc0P+mwWDV3oi2zphmhMUghjWBCpVOIRxexpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7GcS7NTqBQQL8SPqbl4FS5pMWN2TOUh2BHFgtwkottU=;
 b=dHBZDJpoMTW3Io0/bELH1GxpSsQFw2Q/HYKKNmYsxc+STucrNEDI6FCo/45RAJOpL7liES9K9wikpSbbGAH594T0pmfDsQnVL+FUWm43HCyUEeJMYJ4GOK6wI28UcJ8fi8+gyKd77trK20okQBq7x07fygR7xbgxi2xPVTqFbKNQmGmrSRJLz9g9sDRep7nqmanTHpJK/Z6vMVj9gRauw1MJYn3PqsVOtsqq3Sf0EWyRfMJ6Up6ZnxF+X4o8My8aI7ch42T7vluXeWx1B0XQsZkDJVv9k2Xv/4L/MT/OyMRUgK4dlQfGSkvbeUinXv2OpUolQcnoTA4vhn3Q85PL+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7GcS7NTqBQQL8SPqbl4FS5pMWN2TOUh2BHFgtwkottU=;
 b=NCpXZ0WOv7By17xdsFOVzb1o02nC8P5I0Xf9UPlGsUbUsbsG970o9Nai+NxnGw9w5r1a3jH9XdRY024hV6yyFyyxfK9om9CftVsDEsdafwnbvDAOsqBj7cFrYn8ckLSNPH9N4u1evDtdL4aJ5/dl6jSCSk3B0K8x0Hof/GME/behW1ha7rYRhwBXt1YK9h9u6Jin9luoVwF3J79WXvhGyHmn+RLlLBr31TDphPDb0CH0dgWyEyabxJG4krKqT006EtKmRvTLVaX836wlgwZLpKDw6sCaUv6swm96VPH6dxcCYV7E0hNUcniKNgRa2b9IEZtEgkBUlzgHVF+4SQGo6A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <a907d98a-2d0d-cbf0-ae9e-cfa2e3dd37e2@suse.com>
Date: Wed, 25 Oct 2023 16:04:10 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH] tools/ocaml/Makefile.rules: use correct C flags when
 compiling OCaml C stubs
Content-Language: en-US
To: =?UTF-8?B?RWR3aW4gVMO2csO2aw==?= <edvin.torok@citrix.com>
Cc: =?UTF-8?B?RWR3aW4gVMO2csO2aw==?= <edwin.torok@cloud.com>,
 Christian Lindig <christian.lindig@citrix.com>, David Scott
 <dave@recoil.org>, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
References: <fd09742f7c2191be3cdfafbd4c7cccb10eb0e3a2.1698240589.git.edwin.torok@cloud.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <fd09742f7c2191be3cdfafbd4c7cccb10eb0e3a2.1698240589.git.edwin.torok@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0428.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:d1::11) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DU2PR04MB9177:EE_
X-MS-Office365-Filtering-Correlation-Id: 00776cb7-b56d-41db-9871-08dbd56343d1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	b7NV+R2LrP7hSeeT2LNamZAqUL4QTxPSAEeH/jzVPPXZKTv55Um9yiDRvsUELriHUR1K/zYH5uIO9dPV4ljkLIuktGoBLtg62BzVAztwppufB7Na81pbPOBqb7DhNzw7obV3cDpSprMkJzBLc+oHxibe1fM2IVmLi6r85+T7LD4m/y5NzFKDGx4ouK2QvQok+xDqDy8Y65WrU8PlY/Cql+O4mZAv07le5u+Wa3jCFzxM0yGvlwM37jg/fbH5vGccB36lNJLfHSivDBTCD3KjQ93QSHlw2oYBIPAjza/XEDjZu4uZNeb/RKd1WeNPAMONRRqWB1SL1+T8xXB12WuF1yLwyPLFstVnR7vTTEv+jipJJk8zoaA+OD6g0FOkcMkfHu3l0Ln8oHXZ99FGermKxP2xTVk4ACJrUoPgAerzRrvzvXXYl9wh4yDYeltPN+6YB0gvBGV7ZtuNr/LeJL0QIYVWSFMoRxXmG5IO8qIWqlrWtIH6bNefBu8La3C02PqauATAcB5LC1Xn1915IekQK9/Y03GeL67ymbt5/EbLVhqATM658dnjT+5SWOFBTvWy2nujjIQHUhQC8kOKliiuOI85mg5r6pIko3qzjSim77OdLrwXSVPLAiaSR8senFBdrJ3nERzonfGwFx84bLeZUA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(346002)(136003)(396003)(366004)(39860400002)(230922051799003)(64100799003)(186009)(451199024)(1800799009)(26005)(31686004)(36756003)(38100700002)(2906002)(4744005)(41300700001)(31696002)(5660300002)(86362001)(316002)(8936002)(8676002)(4326008)(478600001)(6506007)(66476007)(66946007)(6916009)(66556008)(54906003)(2616005)(53546011)(6486002)(6512007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NzBIdkRERXk2ZkFSMmFNWWd3Tkljc3lWVVBaTHk2aVgrNFJzYXcwb0pPTkFl?=
 =?utf-8?B?YWVVOFh4OHBiNVAzelFic1JWbXBOTktDbU1vb2twRjcybTV3dUQ1bm1lanph?=
 =?utf-8?B?eUxENGZYbzNIamtRck9UZy9YVnlZYlh4bUpFbXlDcTdiSEVQK1RNZjYwdFdO?=
 =?utf-8?B?TkQrK3lTcWJmd1BLOGc2U2E4WVJwWW5kYStYYWhvWTBjdFN2b2FpS2djVkRu?=
 =?utf-8?B?NG9vVUxLb1NjTEp6RU90T2FaT3hscC80eFZOc0RhWkNoUTV6TkM1eC9kb0Rz?=
 =?utf-8?B?L3BYU3FHRTBoeXh2M1lQalgzODhtTSthZTNiN01Zb0t3c3grbFBRNU9KcllU?=
 =?utf-8?B?VWl2UWM2VnFVQytnWmhoMDhpeEpiVXBFRlBDYjFqY1F5V21iMkNOdHdQb21N?=
 =?utf-8?B?eU53VDlyTklCaisvZ2c4WFp4WWR2VzlvbUlzOFlCN0g3VERRV1hIRHRCdElH?=
 =?utf-8?B?SlRRNG1CUHRWUnJsWXZZbkwzWXBBSG9GUUdtRFFnbWw3K1VpeERPMHhHeWda?=
 =?utf-8?B?aVRiWEE3SVY0b1p6SjJTM0JMQmJpemltTGVrNWQyZEJOY091eVJObDM0Zmd0?=
 =?utf-8?B?N01KZmVKKzE2bzVMY2hQanl4Lzc1dld6NUpjYVhHbk5QbWpJUWNEUGhTaU8z?=
 =?utf-8?B?MWR5VTFCeVNRTlUwa2phaksvVzExQ2ZrVnkyR1k1WWQxV3RHNTdoeUVnOUt3?=
 =?utf-8?B?ckFmdGlUNkhuejQvYlMrZWE3SU5mbWtmTUJybFZMVFhKVVlQWWxkVHFPNy9Y?=
 =?utf-8?B?Wmo5MGtkb1paelMrcHNmdTdCN1BjUlc5R0ZsL3FuWE80SW9RWHNnYnAxSC92?=
 =?utf-8?B?WVA0SkFZUWlCNDBJU014ODVhM3FiTmJrSmU3cXRQMTJjL1JtdTI5T05TSWdi?=
 =?utf-8?B?YmsvbWR5ejdrUXpvaWFFRS9JemVGNEROaUNYTFVSWmNKb0VXTW9NdjFrYlZp?=
 =?utf-8?B?bFRxRWgyS3dlVXA0RHdpUi9VZTlJVXNEdE01STJGOThQdWNvNm84VHhVSXA3?=
 =?utf-8?B?TDE3SHhzQVVzbnpxMkd6K3VZL0J4eEtOblkxZmdtdUIxOWQ1S2FTczlwN1c1?=
 =?utf-8?B?RzZieVhBWHNUakxPZ2NkRHNhZ2swZFVneHZiVFRFNVBpWGlPeEp3NHNhZXgy?=
 =?utf-8?B?Y3VZWVFuSS9vekRzMDV0Z2orK0s4K1NnMW9uWnhjL1FWM296YWY3dUlZMUlN?=
 =?utf-8?B?WUhTVVB4d2MxNnZ2dDAvNHllSWdkOFZkNS8wQnRFYXFISFNRa2xjSCt4YlhU?=
 =?utf-8?B?L2dHVTBYNk13eEFpTDdrY091alFHRmc0TWNKYkhsWjUxeTRJMXRpbGp1RE9o?=
 =?utf-8?B?ZnVjeEJwUWlZbVFZcUNYRXdOM0JBY284NXRGLzMrT3RDdkVkNGRIUHVxSTM2?=
 =?utf-8?B?dXROTkJzc01wNGhxOU1FMzFBWUJyazhBSmpYUHJZT3ZEanN5Rm5nejl3M2Vp?=
 =?utf-8?B?MEhnaG52NklwSFdpRUxWckcxQktkRlp2ZTBqd2ZNY3dQcDBOUmxxT29wbXhi?=
 =?utf-8?B?ZkFKUFZxQUh1RTl2dkJ6SGdrQUR3M1owMmxqVHJvbXRqR2R1Vy9GbmduYUFG?=
 =?utf-8?B?Q0VHdlFxeEc2ekpZY1QrYkF5eWpRRVdzVXN4akFXYW5IY0grM0RWcHIwT0w0?=
 =?utf-8?B?VHdSeGRjTXhIVVlKa0VUVmNYa0dNcnM5VzFTZlV1VFR4NXMyc3VDLzh4VElN?=
 =?utf-8?B?VkV2cTRRdG1kWDd6VXptUWhhUkJTMUJEZFBnRXRuUDBuWWlGV3VKS0tRQXZO?=
 =?utf-8?B?alNnOXhMTmYvQitXcUkrbEphd2NPZnRzR29nN1B0RkFwcG5NNU54d2dsQkUv?=
 =?utf-8?B?NE9ib0JjR2pNWWxaU0JvdFQvb1pHNEFZUnA3Y2Y5ZnFoekw3L0loRnFqamVD?=
 =?utf-8?B?clJrQXNEVVJWSTJUb09UdzdpRE1vUllzUnU0N0MrZ2FLbzdrL0N2SkJDbzd3?=
 =?utf-8?B?eXhUL0RydGhIbDFYTVdGTXJJZWpyMVIvMk1BdC9JQURoRmsvbFgwVWdVVXNE?=
 =?utf-8?B?RGhFbnJ0WlMwa3p2NUNVblZ6RFgrQy9DQTBUc0U5bjhmdkFjWVJaMjNmanNN?=
 =?utf-8?B?N0JNQkJ6NE1qaVl5bjkyYVBuZDh4dTNZVW1aSzVGLzlEWVc2NFI5ODk5dUZ1?=
 =?utf-8?Q?ZN40v8ESCeU7WJloHfrU5WTnI?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 00776cb7-b56d-41db-9871-08dbd56343d1
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2023 14:04:12.0809
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cHGLSARddS6aBI4qh0Dovw7fa9zU5puhtUEmQgi4VL4PtWFu30FEbtnbypI8PnWRa/8ZFvj8509XUClUJZyS7w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB9177

On 25.10.2023 15:52, Edwin Török wrote:
> --- a/tools/ocaml/Makefile.rules
> +++ b/tools/ocaml/Makefile.rules
> @@ -37,7 +37,7 @@ ALL_OCAML_OBJS ?= $(OBJS)
>  	$(call quiet-command, $(OCAMLYACC) -q $<,MLYACC,$@)
>  
>  %.o: %.c
> -	$(call quiet-command, $(CC) $(CFLAGS) -c -o $@ $<,CC,$@)
> +	$(call quiet-command, $(OCAMLOPT) -verbose $(addprefix -ccopt ,$(CFLAGS)) -c -o $@ $<,CC,$@)

Wouldn't -verbose better be passed only if the build isn't a quiet one?

Jan


