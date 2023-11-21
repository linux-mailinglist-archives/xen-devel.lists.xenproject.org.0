Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DAE477F27FA
	for <lists+xen-devel@lfdr.de>; Tue, 21 Nov 2023 09:50:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.637576.993490 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5MSV-000711-Oq; Tue, 21 Nov 2023 08:50:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 637576.993490; Tue, 21 Nov 2023 08:50:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5MSV-0006z0-M2; Tue, 21 Nov 2023 08:50:15 +0000
Received: by outflank-mailman (input) for mailman id 637576;
 Tue, 21 Nov 2023 08:50:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=GR51=HC=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1r5MSU-0006yu-BP
 for xen-devel@lists.xenproject.org; Tue, 21 Nov 2023 08:50:14 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on2060d.outbound.protection.outlook.com
 [2a01:111:f400:fe13::60d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fb993323-884a-11ee-98e1-6d05b1d4d9a1;
 Tue, 21 Nov 2023 09:50:12 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DB9PR04MB8364.eurprd04.prod.outlook.com (2603:10a6:10:24c::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.17; Tue, 21 Nov
 2023 08:50:09 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44%3]) with mapi id 15.20.7025.017; Tue, 21 Nov 2023
 08:50:09 +0000
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
X-Inumbo-ID: fb993323-884a-11ee-98e1-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MqI2/mPLoxCR94ap3vOL+D2sICp8bOXuNtAhsTwd4tqj0h8KTKevTX/brQswCecpg/qYvmpd45ZsihslCeXy+V/961ZwLIAStYFRLtU2CCcoSF4wpm0CkrM0xJDeEz3qpTpa/50chb0yK0Hm6vyBknEC2o1kGnrloZRYv6SWRHvE9cCi7XmpsnDYV6+4Sn4gtEW8vIhUmtQjWFOMwBSkkdKgzsOBYVQTRaPDaq2XtC2IHQeWJYLnVCzPbwcnYfI2ZuJajhK/c5M5Larlkr8qJkS8W/fIKk/dB3gVfUGa772nfsUYhy6animYUtS7QwEupfgKJ+5VBB4+QoGGdGkdRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IFv3Y5+dqr6SqLam5jaL3GHMtolX+8gQ1BghAQWZrgQ=;
 b=E4YDplDZuq0qCQ38djEJ7uTMuvztIhqK9ZU38PfmoPBgQVC4jA75hl+gthWWniFeRVCQNHJjlxnR+emWrZfieWrnAgfegu+I65hp0QRvUYZ/2oUvfFc8NM08nAL9mCzR0RmQgPb0MNlR4OyVhgMByCVbLqf8eR1vxSRmzPV11TJrAwrw2/7qrD/stJIc0A4gqLdFZxpKM7Bd0xloRv3BBoW5fhH3oknJQi6H+HXfMsLZef8Ax5XrTUmqH9cPqZb2zBzPNzdOQinDsPK1CJfIqjDfGYUQjGMrMu5cajIeSNAHX4QJmU0Tym5hp0rFq5nWlzj8cdFrkX9rVrIY9r/v0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IFv3Y5+dqr6SqLam5jaL3GHMtolX+8gQ1BghAQWZrgQ=;
 b=juVGceu99ll/8ZK9lD01512kOQ/bD9pZ6OXirLecOhK+IMsomEBOOJtnO5daQpcJytofBzqNKqDRU05QR0DYymkkDU1aymfFdf4h2cc84b4LW2+c3CUiZaYYZHJ0/SSWO4n2SV9Skv55O0jch15gcqgVHo97ywYDa0RJ2iSRM8Q36oXi4+uBJDhAl1Fgg2FOg5iFuzFgnMor/B2KMH/VyNTJCCYnJVq4E3K9NmhyqiZd4hTeJKMyJTveNcl6k9cUhzW3UdGksbEZQr0z/t7VjwpoVgiIBG/qg+InmNQDjh6wSTyV2l0uLZk6h+A8jg5/dZoz0pzM2MOu/uNfPX1/lQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <2caaa971-5f36-47d6-8a94-e2ca2e28d21f@suse.com>
Date: Tue, 21 Nov 2023 09:50:07 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH][for-4.19 v6 1/8] xen: modify or add declarations for
 variables where needed
Content-Language: en-US
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 andrew.cooper3@citrix.com, roger.pau@citrix.com,
 Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1698829473.git.nicola.vetrini@bugseng.com>
 <03ff750e9580c2de8ce3d1211562a03f663d678c.1698829473.git.nicola.vetrini@bugseng.com>
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
In-Reply-To: <03ff750e9580c2de8ce3d1211562a03f663d678c.1698829473.git.nicola.vetrini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0385.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f7::10) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DB9PR04MB8364:EE_
X-MS-Office365-Filtering-Correlation-Id: f6f8a12c-8121-422b-2f47-08dbea6eddce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	zYIn0UZ5atd+e/TTUVybSap0UCLc38k+/nhP/31kA8TLT27Aru1kicoICoMTApGP5Qy/viPnaLFGpaZmMma7YbrpbP5W7lmijYpNUMZjC2jg2/Wdx/s0q0DnHYT5s7s/elGhgiNhw1V804Q89Uu/wXDV3aLVELk6aEqYgOyC9udiAAIGJoMkehSnbVadQHcF1WdbAq6txZO+E+GKV4taaFm6NWLT2lLZ5ZZMXnNsdh02NO5mRAUimyfHWszU4mq9Nn8fixzRr1dRv0+5TWJ3TjANKSOWNIzYFJ6/EEeFk8Ztbecjj7hAC+8Muz5snsgmmNvuZc+C2kkFBY2mIj0EOLXxdvs/8jR0onoenJWNg04YFYqZw1rwzMULIEd9dRnvnbGrFvBVOgK6IT1m8JZ9dMO81Mek0NLqcFwC1JHEx25+1F+f7dUAtR/ZHjwp70RNiYlI1EoCjkA2sqVm9Qw8KvhsXQdk78vj/i7zb9mYuP77lccvN3oPzp+A7kLrj4H+X1xb4Cv43k4/hNWYEbz+z7FBaCYCANFTvloUyqT0K62G5UvLMTNu/fXTPHXiVtcuJ5qPMtiI0Iz9fOGzu1RGfDUq/3+SGVLlJ/nXI17+aQ2Bm4brEX+PkhyMSSbS1frcD46Y5mf0+TiSVsIeUdqDVnDBiS6ykp0uUrmbARntwM//c19y4nprl3dk8Bsmd8fS
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(39860400002)(396003)(136003)(366004)(376002)(230922051799003)(230273577357003)(230173577357003)(64100799003)(1800799012)(186009)(451199024)(478600001)(6512007)(6486002)(2616005)(53546011)(31686004)(6506007)(26005)(54906003)(66556008)(66476007)(66946007)(316002)(6916009)(86362001)(31696002)(2906002)(41300700001)(5660300002)(7416002)(38100700002)(8676002)(4326008)(8936002)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Ukp0ODZENWZZa3VHYjJUTmRLRjBFL1B2ZmxyMmJvT3VvQitHaW1HMTgwdENw?=
 =?utf-8?B?b2xWdkw4RE5ybVUrQnBFdXJFaGJlOXhBUUNQdGc1di9kY0RXV1J0T0xtVGRn?=
 =?utf-8?B?VHhtUzA4dGpJODdtaWZZT1J5QlQrSyt2ckI5U0J2MFhNRzY2MEhrMGxjWVp4?=
 =?utf-8?B?YkMrSUhMU3NoekhuRFpraUI2cHhrTmIxS2ZKTzAxNjYyY1FZdlhYQ1pqZFhD?=
 =?utf-8?B?c2Uycm9FanBjeU9IV0RpcDdjTGFYazRJV29QKzM1Q1hpS3JzbFVzbml5RHMw?=
 =?utf-8?B?ZlFJazBSVG1ZNkhSYmZoZkpNSFBMTU5HQTl6R1NXN3RQNEVGUzBESzExSlVK?=
 =?utf-8?B?N29qcE9vYmwxVnVvbUNxTE9xeFdjaGJzUDY3SEJwZk1PSkhpdnpBNWxkOXpP?=
 =?utf-8?B?N0NRUyt4MDBxeGxuVWUvT05JVWZvOWFEU3JNRHp5WE9zeWRSUUxyWGFLN09w?=
 =?utf-8?B?V3FuLy9LSmo0emNIOFdYYjJxbFA1VjJWaGtrUFJtOTduRjZJK3Z0NWtuQkJZ?=
 =?utf-8?B?RS80YU1uMWdrRHFjOWcvRy9FMDRRUEJzamhxc0xOdGhLTGVkR2VwcWw4MUFO?=
 =?utf-8?B?WldlaEJ0WE02RWJrcTlTV3h1WkhsdmhyZm52VzNGOEtRM0lhQWMwcUpDTHBw?=
 =?utf-8?B?YWhtRXlZVForOUdkOE44ZWp2NTR6eStCVDB5NzlqR2t1WFptSUdyMklYbi9Y?=
 =?utf-8?B?Yis1ZGJ1RUVjVFVuekpkSlZFVTBVUzd0N3pucjBSMHowUXdFV0VxeFY1eXFv?=
 =?utf-8?B?TzhPQlVRM1pEUHl5V29KcW4zRWFOZjRQYWwvaWhMT091VlpCdVdpc09rYkE4?=
 =?utf-8?B?dUxGL2wydGwyUVdVYUwwTzgremg5WUJGSmdhei9OSThmVCtJSytmVmFKaWZR?=
 =?utf-8?B?NTlVL2luK0ZXOWRaSHdMeGhkZEFSSFA1dkVHeWozZkdCdllKa290R0duOEdI?=
 =?utf-8?B?Q25tNEZwRkRER25Ka3FzdEtKU0YrUlBDMWlpNGdOSlg5NUh6emZQb2VCWmUv?=
 =?utf-8?B?Q2lESTd0dm1DY1pLTWFTS1NpM0VMZldUQW1yaWE5bGpJMjI5L091emM2dEM2?=
 =?utf-8?B?RklDc0ZlVVhLY055Q3hSc0s1b3FORnVqTUJUYXhLcDd6RXZ3UnB1SG05TG5l?=
 =?utf-8?B?dTNyUWgxVHQ2T3RkcUorY1I2bXFxY3p0aWtGRXptdHZBSUxyMVNNT0R1RnM5?=
 =?utf-8?B?WjdmRXQ0WFVvMzlIbnZ5WDBXOEpQT2phQnF1c3hDL3JMMWF3bHYzbHQvMEJW?=
 =?utf-8?B?OU5CVENHVXNvaGpoTDQxQkJDeGVENFdVVWJsamtrV1psQ3lSckZyTWIxTENY?=
 =?utf-8?B?WFRCMCt5YTJWczFWK1A4K2JtRXB6K1B3anhCaXEwb2RkTDBlRE4xbXNPQW5C?=
 =?utf-8?B?ajNHODM4d2N5RVBucHVxaXNkZ2dPenlmRDBINUZ0anhmVnZIMzB3WG5Cd3dB?=
 =?utf-8?B?QWxuODdEUnJyV2lCMGpSMUVjZGxhaWFsTlIybm1JVjFpUHA3ZXBBQU9NMFBa?=
 =?utf-8?B?U3Nqa1VzSGNyV3FQN1h6UktFZnhPM2pUZzJtNkhaWG9hNDNqM0F0THdnb2Rs?=
 =?utf-8?B?YVBhejUxRHN6YlJXN3ZlWEpXL3V1WENqUjYzbDZXclNTWFhjNmFaYTJoNVBX?=
 =?utf-8?B?TTJiQjFSbi9YYURoOC9YS3RvWHhiUnpseHY2Y3p2eVJEU1U1cVpmUmdtV09t?=
 =?utf-8?B?QXFXVHhrY2JzU3lGaUV2VkdpaW4xL3JUMnhrYjBYQUdyb2dNaUhKWVVDSE5Y?=
 =?utf-8?B?MU0wK2lWU1VNMVB0Q2xJWmpCSlhDc0RiY3FhK3hqV2NuYWtEQW9zTWZDSGlI?=
 =?utf-8?B?TnhaMTRCdkJkL002Ly93NDQ3R29SQzBlRHc1TmxiQWF6bGVRZklIV1J2SHhx?=
 =?utf-8?B?c2x3bURTK3IyYTdpMjBVU004ZnoxRDlCR3I3d2RjaTlFQzFRK0Z2UWVKOHAz?=
 =?utf-8?B?TElkU05tQk4xN09tUEsxU0Q3Vlg1dVlaWG5LZlllN2w4L0RuRUExU2dXYmJN?=
 =?utf-8?B?QTR3WWwrUVB0V1kzZmt0Nmk5ZTVSTG5pRHVMUTNiSlMrV2ErOUpqRjlVTXA3?=
 =?utf-8?B?bTZGRzhwMWxhdG0weXhFeE4vVy9ESVVmMmdoc3ROKzZudml3cW5veVVROVlP?=
 =?utf-8?Q?8bqJhWFXOlMFy7E49S9ZEBBtu?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f6f8a12c-8121-422b-2f47-08dbea6eddce
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2023 08:50:09.3393
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vrkIBTQ/6x5L+cwFkc3ceBLecRT+kgem3W9Hx/6TgaEHXAcorzpbUvKUPmNqCPqSRRTaNnNWFG8Hq7SzTbCF+g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8364

On 01.11.2023 10:30, Nicola Vetrini wrote:
> Some variables with external linkage used in C code do not have
> a visible declaration where they are defined. Other variables
> can be made static, thereby eliminating the need for a declaration.
> Doing so also resolves violations of MISRA C:2012 Rule 8.4.
> 
> Fix typo s/mcinfo_dumpped/mcinfo_dumped/ while making
> the variable static.
> 
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
> Acked-by: Jan Beulich <jbeulich@suse.com>
> ---
> Jan's ack is for the x86 part, but no other concerns have been
> raised for the arm files.

Actually, there is one:

> --- a/xen/include/xen/symbols.h
> +++ b/xen/include/xen/symbols.h
> @@ -33,4 +33,5 @@ struct symbol_offset {
>      uint32_t stream; /* .. in the compressed stream.*/
>      uint32_t addr;   /* .. and in the fixed size address array. */
>  };
> +
>  #endif /*_XEN_SYMBOLS_H*/

This is a stray change, and wants dropping here no matter that there indeed
wants to be a blank line there. I'll take the liberty of doing so while
committing.

Jan

