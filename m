Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C46C97F275B
	for <lists+xen-devel@lfdr.de>; Tue, 21 Nov 2023 09:22:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.637562.993470 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5M1B-0000Qo-Fh; Tue, 21 Nov 2023 08:22:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 637562.993470; Tue, 21 Nov 2023 08:22:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5M1B-0000OA-CE; Tue, 21 Nov 2023 08:22:01 +0000
Received: by outflank-mailman (input) for mailman id 637562;
 Tue, 21 Nov 2023 08:22:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=GR51=HC=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1r5M1A-0000O4-8L
 for xen-devel@lists.xenproject.org; Tue, 21 Nov 2023 08:22:00 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on062f.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::62f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0988bbf2-8847-11ee-9b0e-b553b5be7939;
 Tue, 21 Nov 2023 09:21:58 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AS8PR04MB7575.eurprd04.prod.outlook.com (2603:10a6:20b:29c::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.17; Tue, 21 Nov
 2023 08:21:55 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44%3]) with mapi id 15.20.7025.017; Tue, 21 Nov 2023
 08:21:55 +0000
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
X-Inumbo-ID: 0988bbf2-8847-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Lo/u7/a79FvguutA4atTzr56zrEgpx2WlTP+qEgzH8SCGZ4vT4bcwLMC5o65auVPbYASP6z8WoJXj5CNC6yf5sFwNwFNJzqycux9nwVIAMIwQZQ+t/Txnm1bwa0GwBrxS5OsdeKn4klHS/6PMe78pyXQ3JFO2QmM6sLk3AlLeB3RIAuHvqGczwOLCCzS5FvrEBGZPmGWoyXxvxSjXtep/eghitY5h7EtkvQ9eYo9wM0Lj25jqmBfhbiyybK6JkyrbGdUfPUbhcA5+2PdiC0KMGxLRnhRBYpGoTHxpcJR80cXPitLX+nuRXXNg9+hcqkVbtFd70szbAw+Vx2QxV8xbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dtrFhYKpz0Xt6o9hu6G05oYg8fotudtKjQzc2U+NLg8=;
 b=aM2Q8OuzGg7j33IyK/zoF/bzFGKoKj12cUmVakKP09wDgTRVP33pyENFQ0e8eUTQUqaIjGZ5lNygZNi3+8F8eEGIwxggCvr+c1zqNyL0X9JKEm+8+3hgePvRFuE1KjOo/wkx1TxTGT7xolb1RzJGbDcgC/hnulPV7ojQPKOPDyVuXD3/hhDgciE5rtmR5C7JdFeRqAWulBwf99BEPt2XBsyKNkYCcBhfiTV20Fp6evrh3baUSkKDKGO5hdeMFXmeq+DHH6GEXW6lwNtNnXp7gIo0uOo9Lc44rWMnk9wRyvIFQspVPkr2k+zqzg89nGJeB48widyIM0RuSc5Pp5fSyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dtrFhYKpz0Xt6o9hu6G05oYg8fotudtKjQzc2U+NLg8=;
 b=50uEJTSl611YIhCEIHXQCa2hQYOJyVN/GTh4QaNj7jeKhAL+y/fyPWBF9h1N/MRjsB6/fEVcAkgsZXEjDp71IwUhP7PKp7KfpJo5FSutozXXwXQOlTlGNU3c/jWZAIGbPFhJ1gucobaQ/aiD48YEiB/yirz4YY2s37iVXjT+8u30whHY+xt3lD3jxQQT6nN40NwvV003/wlfxndpUz/uJPDM+5mHJFcpzIeT106D62Entq7ZI8bGEr5RHCHRWWm/SE1F1UT1K2KUs+79UkpUrmXAzJNPMepZWwCFt82apYiDCZGy4X8snvSrQTn3UeprVgpuXY4saAiky8MGCJhPsQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <7c954d5a-b2dd-4a8a-8b3f-2ec398bf5a25@suse.com>
Date: Tue, 21 Nov 2023 09:21:53 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/6] x86/setup: Rework cmdline_cook() to be compatible
 with -Wwrite-strings
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Volodymyr Babchuk
 <Volodymyr_Babchuk@epam.com>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Roberto Bagnara <roberto.bagnara@bugseng.com>,
 Nicola Vetrini <nicola.vetrini@bugseng.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20231120224912.1421916-1-andrew.cooper3@citrix.com>
 <20231120224912.1421916-3-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Autocrypt: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJgBBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AACgkQoDSui/t3IH4J+wCfQ5jHdEjCRHj23O/5ttg9r9OIruwAn3103WUITZee
 e7Sbg12UgcQ5lv7SzsFNBFk3nEQQCACCuTjCjFOUdi5Nm244F+78kLghRcin/awv+IrTcIWF
 hUpSs1Y91iQQ7KItirz5uwCPlwejSJDQJLIS+QtJHaXDXeV6NI0Uef1hP20+y8qydDiVkv6l
 IreXjTb7DvksRgJNvCkWtYnlS3mYvQ9NzS9PhyALWbXnH6sIJd2O9lKS1Mrfq+y0IXCP10eS
 FFGg+Av3IQeFatkJAyju0PPthyTqxSI4lZYuJVPknzgaeuJv/2NccrPvmeDg6Coe7ZIeQ8Yj
 t0ARxu2xytAkkLCel1Lz1WLmwLstV30g80nkgZf/wr+/BXJW/oIvRlonUkxv+IbBM3dX2OV8
 AmRv1ySWPTP7AAMFB/9PQK/VtlNUJvg8GXj9ootzrteGfVZVVT4XBJkfwBcpC/XcPzldjv+3
 HYudvpdNK3lLujXeA5fLOH+Z/G9WBc5pFVSMocI71I8bT8lIAzreg0WvkWg5V2WZsUMlnDL9
 mpwIGFhlbM3gfDMs7MPMu8YQRFVdUvtSpaAs8OFfGQ0ia3LGZcjA6Ik2+xcqscEJzNH+qh8V
 m5jjp28yZgaqTaRbg3M/+MTbMpicpZuqF4rnB0AQD12/3BNWDR6bmh+EkYSMcEIpQmBM51qM
 EKYTQGybRCjpnKHGOxG0rfFY1085mBDZCH5Kx0cl0HVJuQKC+dV2ZY5AqjcKwAxpE75MLFkr
 wkkEGBECAAkFAlk3nEQCGwwACgkQoDSui/t3IH7nnwCfcJWUDUFKdCsBH/E5d+0ZnMQi+G0A
 nAuWpQkjM1ASeQwSHEeAWPgskBQL
In-Reply-To: <20231120224912.1421916-3-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0152.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a2::6) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AS8PR04MB7575:EE_
X-MS-Office365-Filtering-Correlation-Id: ef178a9b-24c2-4ce0-4eff-08dbea6aec30
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	lV/45WO0WRnYqbdAo+uSALb5iPRaLWrd/g0477pWsaV6gwv8VOjUwyuhFXJi8qKWHWJ3NlMxQZE1YdOPd4vtL/pBng1jGmkDTItPMytFstr7T8naHJ1CFISJq+ys7Gh+5mP7ugY2DBgCfiwR26xLteOOsH2DVIKh0HGm3kyExck8owD8p6OOpl49EK0GRiAnMkOVunhwd0FvpzDGpmW7apS+HOoQ1z65ZLhOvWjgYS93PchPXRP+7gdy9LvFZYs3V8pKweZFIaNSbjTHMJHB+UfJjF1SwV4SosAlG2lIKFbJaW4M9g0Qe0B/ES/cEUMvlxUMG7Ic1KJE47Q1P0WwE0emknBfRdUMUzyRpyiLSNSVPVSu/jsjw3BeYsVYj/aea9vFJH4U8lBFs9SQnpkxlGjRie7TsVWYqrEIi1mRzh/op5Nj68s6BjulyJchvIMSqa6tR6DCLp2rJT/RG4uVD7vtq5vtxHlpVANOAmtaMkzUs1IpzTSEVShiwpTLv1gd/VAIPTlwFeGZmQi/XxZdLXINK0GHMECwsL47jONKPTOp/C4ghnOKBl1Wjt75S3X7x8lLUOFZoV4fQ5Ew30gMf1bh2Sr7w5pAyya4Iy6VDTsRQLBmQyYHbVhR6ZWzAaU+cKBJgAChR80Jz0PNx9/Tnw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(39860400002)(366004)(136003)(396003)(346002)(230922051799003)(186009)(64100799003)(1800799012)(451199024)(31686004)(83380400001)(6512007)(478600001)(6506007)(66946007)(6916009)(54906003)(66476007)(66556008)(316002)(38100700002)(8936002)(4326008)(8676002)(6486002)(53546011)(26005)(2616005)(31696002)(86362001)(7416002)(5660300002)(41300700001)(36756003)(2906002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VUppQ0gwR200ZEFCdFhCN2g2S3BYdncrUGh4U3RjZXZrVXl1cElqNHdqRm9J?=
 =?utf-8?B?bDk5T2xzUy9MQUZUQ0kzTlF1Q3FsNm5IdzZmaW41VitDUUoxc0RPalRySW13?=
 =?utf-8?B?aldGakVPbHZZVUkwVzU3L2ZwbnJISXdMMlVPbEZjd3dhMTN6MURJeFc4aGZQ?=
 =?utf-8?B?ZUIxSVQrajRWT1d6VHRnYkM1SnpyUXRka1k1MHNWR2o0cHV1UzFxTjFDd0F2?=
 =?utf-8?B?OXcybUxLUVIwdUFPa2RhUjVPdWJUNTZPbXY2Q3QySnYzdWZ1c2duVi9ML2k0?=
 =?utf-8?B?M2tjSmI5dzZyQ2pDZEJJNUJ4SGZRdkZCV1FSRzEzanUyNU1KV1RKTDBTZEFN?=
 =?utf-8?B?YTRORGwrbEl6WS9PNElrTEZiaFozcEExZnFaME5BcjlOQ0M0V0E1OGFkaENm?=
 =?utf-8?B?R3ZzSWs5RXVPaUkvbTREMk96ZDF3ekNPSzFsUk5Nd25nQWRRMlZsQlFURE1k?=
 =?utf-8?B?dG1lQVpYUXExdWNiWVVrVWVjTkhYU2ZENktTckpaZUFQaVNYdGlNTWtXdFlz?=
 =?utf-8?B?WlJUYzBOZ1hNVmJJb0NQdlJSSTlSb1ZFdkJvRTc3NFZhTjkzZkMwR2tZajZM?=
 =?utf-8?B?elJzWFdabTd2YkczTFlkaEphM3dTS0VBRDh0dis2RTJ2UXpiRG5Sblk1S2pR?=
 =?utf-8?B?K2FPNXhzY2RsTHNJY096ak9oTDMrZjNNSXVUaE9Kb2dFc1BNTS8rZmRUL1hi?=
 =?utf-8?B?cEI5M1dKeUQyK3BhdTd6SnVTZzRhQnF0VHlXelNzNXVGU0FqTGUyV1BsMTlX?=
 =?utf-8?B?OGo1azQ2ejdQdFJKTFlFQ0VFNWUybnA0MWo2VXF2M0RrTmZvSytmUG5LLzdS?=
 =?utf-8?B?WDVweVUrRFIxc2J6ZHNvcTB3UDdhQUpwK1ZUN2JvLy9BdlVXUkZibmpONVZS?=
 =?utf-8?B?U3pYYnhZbW1iOTMwVWJWSUNRZzdOZlJiWFlIZ2ZYcHplczROc2Nmb0cvVDZx?=
 =?utf-8?B?N0pPdnorMTRNcmFGeEk5SE1oY2tNUHEzL1c2Q1dMN1YzZzVmcjJGZmZ5bXVO?=
 =?utf-8?B?K2ZuaDVuSmhsMEEySlBCREpyS0pZU1plRUdNQjJRQ3FnMlQ0SUpObkV5b3Jw?=
 =?utf-8?B?RzltVWhhL0ZJNEZKbHpRK1p5UURZTXlMclhGdGFBY25neWQ0eEhmVTliRzlF?=
 =?utf-8?B?VnVMSnI2TlM3ajFmbFgvZ0p3U05QSSs4Y2VNU1pjeDJKR3ZoUkplNWtUYWRn?=
 =?utf-8?B?V2JsVC9jNGZYSWRWbWpKYnpkVFRqTkhHZVhKMVAwMDQvSVFuT1YyNHBWNnBX?=
 =?utf-8?B?bTQ5emFjMmdlMTlVWnN4amtHMG5aeGh2L0V2dW9VQTQ1U2dyZnhpckM0cEZx?=
 =?utf-8?B?TjVWbUtqSFRSUStjU1FTYUh5cm95bEpzbVhSWGRFQzZvNXRWOTNHWWxrRldq?=
 =?utf-8?B?Z0NqS01vSVlVN1N0L0xNSlpmMGYzc1VxdGh3dEtvcm1ZaERVdTg4dWFaM3ov?=
 =?utf-8?B?b3VaRzF5bmJIQ2JQN0VDMjV1OEZvMERCNHBpRWFXaFllOUJVRWIxdWd5cThl?=
 =?utf-8?B?UXRMSEdndzdrTjhhQWdMSkNyMmxSMW4vYnpZZGNBL1FCaUU3ZTVucStNTHZv?=
 =?utf-8?B?K0UrbHpub1pvRGpGQ2s5Y0gyYlIyNEUvd0h5eEVEdTloMUpHYWdIZDh1cmhn?=
 =?utf-8?B?WEpGbVRZWGlqeXRkZE1lMU9MM3ZMdmxZbWVTQXpjZVUvNGVPNHpCcjM2akMr?=
 =?utf-8?B?U3dqZXYxM0I1QjczSzd5U004RFBvSTVSUjlaM2ZOYzJmSThuZzlyZVhGUFpw?=
 =?utf-8?B?ZG4vNUpFV2hBcElRUTRvR2VuaHoxbkZKd0xlc1BNUDA2VUs3WmxDTHVHb200?=
 =?utf-8?B?SkFJSVgxczRQaFNTSnAxNHlDbzBRUDFGNzlaRzhYTGpBR2R1ZUYyUnJiNkhl?=
 =?utf-8?B?Z3pGK1plQzRoZVozUGFXZXlEWTI0TmpnbGVGQnpYcjVqeXZRQVJpNnYvRGhs?=
 =?utf-8?B?QUdBeFlvQjF1QUxNZUhMQjBMSUFrcGIxaFJHS3B2Z3FKNW55YXBEMStPTk5Y?=
 =?utf-8?B?Y3pUc2dKZitWRS9aMk9wbThxNmdWdUdrODBjNldieXZ5M014ZFVFOHVDbkxt?=
 =?utf-8?B?Z1g2WHc5Y3c4aGd0WGtYN1A2UDY0TzZiZzFhY00xb1N5aG1JZ2xyU0MzTDVO?=
 =?utf-8?Q?wPBmZlUSNaWNWnKAIw8FmBN9f?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ef178a9b-24c2-4ce0-4eff-08dbea6aec30
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2023 08:21:55.4368
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NefcZxNfSY6sOEodBMjReitXRGdebSBeI2Dqf+wBuPPxz1NUDo2e414wzsg4kMxOcNFx2kG4Ut8AacCYgAlyhw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7575

On 20.11.2023 23:49, Andrew Cooper wrote:
> Constify both cmdline variables in create_dom0() and __start_xen().
> Initialise Xen's variable to the empty string to simplify the parsing logic.
> 
> Update cmdline_cook() to take and return const pointers, changing it to have
> an early exit for a NULL input (which can happen if the mbi-> pointers happen
> to be 0).
> 
> Note this only compiles because strstr() launders the const off the pointer
> when assigning to the mutable kextra, but that logic only mutates the
> mbi->cmdline buffer.

And a good static analyzer would spot this. At the very least I think this
warrants a comment next to that code. But really I'm inclined to re-write
this to eliminate the issue altogether; I'll try to remember to do so once
your change has gone in.

> --- a/xen/arch/x86/setup.c
> +++ b/xen/arch/x86/setup.c
> @@ -837,9 +837,10 @@ static bool __init loader_is_grub2(const char *loader_name)
>      return (p != NULL) && (p[5] != '0');
>  }
>  
> -static char * __init cmdline_cook(char *p, const char *loader_name)
> +static const char *__init cmdline_cook(const char *p, const char *loader_name)
>  {
> -    p = p ? : "";
> +    if ( !p )
> +        return "";

This change is now needed only for create_dom0(), whereas the call site
change to __start_xen() is redundant with the change here. Did you
consider doing a similar transformation in create_dom0(), thus
eliminating the need for this check altogether? Alternatively I'd like
to ask that ...

> @@ -885,7 +886,7 @@ static struct domain *__init create_dom0(const module_t *image,
>          },
>      };
>      struct domain *d;
> -    char *cmdline;
> +    const char *cmdline;
>      domid_t domid;
>  
>      if ( opt_dom0_pvh )
> @@ -971,8 +972,8 @@ static struct domain *__init create_dom0(const module_t *image,
>  /* SAF-1-safe */
>  void __init noreturn __start_xen(unsigned long mbi_p)
>  {
> -    const char *memmap_type = NULL, *loader;
> -    char *cmdline, *kextra;
> +    const char *memmap_type = NULL, *loader, *cmdline = "";
> +    char *kextra;
>      void *bsp_stack;
>      struct cpu_info *info = get_cpu_info(), *bsp_info;
>      unsigned int initrdidx, num_parked = 0;
> @@ -1027,9 +1028,9 @@ void __init noreturn __start_xen(unsigned long mbi_p)
>                                             : "unknown";
>  
>      /* Parse the command-line options. */
> -    cmdline = cmdline_cook((mbi->flags & MBI_CMDLINE) ?
> -                           __va(mbi->cmdline) : NULL,
> -                           loader);
> +    if ( mbi->flags & MBI_CMDLINE )
> +        cmdline = cmdline_cook(__va(mbi->cmdline), loader);
> +
>      if ( (kextra = strstr(cmdline, " -- ")) != NULL )
>      {
>          /*

... this last hunk be dropped, along with cmdline's initializer. No need
for extra code churn when not gaining us anything. (Also but not only
because the reformatting here is actually beneficial from a readability
pov imo, the variant with applying the same transformation to create_dom0()
would seem preferable to me.)

Jan

