Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7552D7FA457
	for <lists+xen-devel@lfdr.de>; Mon, 27 Nov 2023 16:24:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.642287.1001656 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7dTW-00027N-HG; Mon, 27 Nov 2023 15:24:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 642287.1001656; Mon, 27 Nov 2023 15:24:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7dTW-00024F-EH; Mon, 27 Nov 2023 15:24:42 +0000
Received: by outflank-mailman (input) for mailman id 642287;
 Mon, 27 Nov 2023 15:24:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nblC=HI=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1r7dTU-000247-Nl
 for xen-devel@lists.xenproject.org; Mon, 27 Nov 2023 15:24:40 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20616.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::616])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 14b76c41-8d39-11ee-98e2-6d05b1d4d9a1;
 Mon, 27 Nov 2023 16:24:39 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AM8PR04MB7810.eurprd04.prod.outlook.com (2603:10a6:20b:237::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.21; Mon, 27 Nov
 2023 15:24:37 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44%3]) with mapi id 15.20.7046.015; Mon, 27 Nov 2023
 15:24:37 +0000
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
X-Inumbo-ID: 14b76c41-8d39-11ee-98e2-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VdgtaFZZinFMoevVTuLDlyrcOuwKAEFcH9LzjxsAoFS7Hujr1AuqusU0kKrRhW5/G7Cyi77nGwJ3SiZhLQ5fqqALBHghlTkoNpw//sar9TsGGzCs1Y7uOWoxnE/2wg0fZ57h9q2jiUTdeDA0/JQk8rtqxXASt8CR9bN3dGa77fU3WAZo6TRfrdho+Poj4X2EP2fTymybutH2SmjV6KyrwCUAqJGJY7fC9uBhPlNjyN3/QxdbbHWmoL+oEDRlbVsWz9xNLGbUG5Pou5w5IAFovyM54EYqdGbUEMlfOjZgqZ0BhSfGSdXzb3MOoKgm1NrsN03JrMbz8sho7c01ZfNW0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u0Cwd7dsA21FG8IH3ZruaTlV0TrtwyPEbjnUByz3u5A=;
 b=k+We0bb4VOVa4qTZuEjGaJppwPOtRQlQOXj+7DJf3/EtBAaIHjSFW8fdRg5O9w7MFRbBLZyRqF22K+s6rj515e/jNMQKD/maGbInhXLiMlW/97troqyOnrZCqqQeeCnLxUAnvKOzED7T91cIEGPITEI2x5bpX1DX8VrynRiPnop9HAOtW/f9R5NHB66iGQPeIXLTtq+sjFL+BRaM1Aodk4ReOhANJ6JRXJHJ+QXdrzRxZSxeYTZigQ93+06aWczOJbkb4HBK9Aeex0vjIBQ3vGDKtyDjF2tgvh1kdMvWJ5tpXd6Vz3KIqQ3xO64j2HEWmYji2U9S6Jn0z6EuJKmI4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u0Cwd7dsA21FG8IH3ZruaTlV0TrtwyPEbjnUByz3u5A=;
 b=YuNX3IruWzdIreBd9SZGy7ebB7ngeiB7LZYGe6kkyWHN+qHww3Ybj2evG73LockqWIfPnoQa30zH/CMYMwX1261WPVWoABgKQ7fc/Uvv6cAKQ6bjHB0E/OhOy1KMH8Xnp0eCoD6fglg3it8AT1cpPqw3/IE55jAPiM+tOP53yjHuDRH7nd8HVUEVCLkX/UE4MvdmA06RL29lAoO3LXP/AYc1psX/H4PW4s/+eZLsjZsrgZE4s5KFmUUy6nPTddM8UNvvoYkiMTxlhmK4F6J4D5Ub9BuLVwbk9MUgmqKoJ1A0/PJJSE/uQC8/PMOBV4pMxkoqvtwscFwE5umTedrSlA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <37ea7f26-cfc5-43c2-9ca1-5850c786ae60@suse.com>
Date: Mon, 27 Nov 2023 16:24:35 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v4] xen: replace some occurrences of SAF-1-safe with
 asmlinkage attribute
Content-Language: en-US
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 andrew.cooper3@citrix.com, roger.pau@citrix.com,
 Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Wei Liu <wl@xen.org>,
 Julien Grall <jgrall@amazon.com>, xen-devel@lists.xenproject.org
References: <edbf9e56a404a456db26445ce0d79b0c178a54f4.1700813413.git.nicola.vetrini@bugseng.com>
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
In-Reply-To: <edbf9e56a404a456db26445ce0d79b0c178a54f4.1700813413.git.nicola.vetrini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0204.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a5::9) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AM8PR04MB7810:EE_
X-MS-Office365-Filtering-Correlation-Id: d4a8ac9c-7d5a-4fd5-68bd-08dbef5cf7cc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	YogBJHulNgUldoboFFj/RlMCSl546Uyaz9dAhiiSIYs/wM7NhQBrJe/HLHXMWp2Hdemxdf9vhfooQYjbDDnCtJLghAvCby5JH2GaSwsqCixQEZYUy/6MfUeSQCz1yZZNrXuBcrS0WMK6wWsjfgQS1Awujk9p/jNY5T0F37wCj/YSswOc41x8Di76eGnVpgv1wOLOPDykvAAqGz9GbgFXlACJD5yxgr3Iyvea/v3TJvnsmjFewYbpa7nhTSKb+zNHT8LmT5tRrE83n8zlhwRYYxZzVq9YV/TRhTpis7m2X0QPX8RnyAThkDayHpUF8hNxp/+0gmdA1XJLH4edVYKTcxNljxvlqriuPYgkMBtUOvuXkUX5enmmVL120lwtDR4ZCYUTvMNt6PPkYtklv5j+YHIcdYOpHEaSefeTozgNe+2sRnRUwynCMGwiXZcB0NqQ5NvMqyKrWIL9vGw87FmyDJj6ho2+iSQ+OxTaAJx8yRJtdqwmQc1/RzC3eIrLAB29M3dHwwbiJYu3izcGPNOk7BUDDp3+M5HWfupaSGt39BXOGj1K106bI5U54oCYlYGCR9e194tsqusXpV7RGVfFNr6ogzlsFdQ+r88i8SEsV1J1MnuDZLCDqqSOj8bxmozpzav+mozCZ2l1y+Lk/+Mq4g==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(376002)(136003)(366004)(346002)(39860400002)(230922051799003)(451199024)(64100799003)(1800799012)(186009)(31686004)(26005)(6486002)(2616005)(6506007)(53546011)(478600001)(6512007)(38100700002)(86362001)(36756003)(31696002)(5660300002)(41300700001)(7416002)(2906002)(66946007)(4744005)(66556008)(54906003)(4326008)(316002)(6916009)(66476007)(8936002)(8676002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NkdyY1dSRE5nZy9tMUpQeWE5Q0szQURjU2lMQnpBRCtZdDVRbUlweko3MkJv?=
 =?utf-8?B?NHdIa001aG1YdEZseVZ0UkFHUlNSa1ErenBveEY1a2VsYVBYdEhpNjUzQ3FB?=
 =?utf-8?B?TWtibUVNQzVHZ3lwclhiZlR1KzVsSWg5S2dhMllaUklLMFVoWFNpRENJUHpt?=
 =?utf-8?B?dm90enZac1FUS3RVWm9mUUZ0cVJNVHJMTmFuM2hoaUFNRFBkUlVZc21pNzZM?=
 =?utf-8?B?b2hIRTRXVUJBVitFQjZwU0p6Mzg3QWR3elo5MkllUzJ0blArbXRvLzErTlFB?=
 =?utf-8?B?NXFyZ1FSL1QrYjBEVFZsQSt6d2MrT0p4MzRrb2xiR1JjR1QvM25OVy9kek1D?=
 =?utf-8?B?NEEwbW5KMmw0MThaZUpFNWlJSExjNTQwc05HNkNrSjl5Y3JYYXlPL1ByZUFl?=
 =?utf-8?B?K2EwOE5CZUtteHBISSs3dWQvSmIrVnZIcEV2cUYyN0xGczlTMXRGNDlJNStp?=
 =?utf-8?B?ZzgrV1Y5TTlsa1JJYk9XWitRN2VyWlBsNGhuRXR1bURMZWV1MGJoa1c2YTlV?=
 =?utf-8?B?MjFXbEV1SnZPczEzUVhHdGIvdGpYY0E2Nm1pelhQYTNQWDJqcWtOT1pLQVph?=
 =?utf-8?B?cjdQREFqYUpmajVYQXUrcjRSN0I2bktBWHByTHQ1L0Zaa01lS1NoMWtsMlBF?=
 =?utf-8?B?NUlsd0R3RWhMN251RkZVSkdObFB2Qll4c09TZnd0d3ZNR0E3N3daVWpEeTVW?=
 =?utf-8?B?dEpva1BNN1BDQTRYcGwramM1OEE0cE8vMzJsOXloWmZscTZKdjFBemY1d3dP?=
 =?utf-8?B?QVBOWVNRck1zQWtkY2FRQnVIdHZXNUhGMjc4clhSMFFJRlc2KzNLZUhBZlZH?=
 =?utf-8?B?UEFBLzc2VTRRd052cUFLaGNEeDVOeGZQL2JpWkFlMUZhL1ZLTUlLSGZVUmVt?=
 =?utf-8?B?MUF1RktKeWlQby9CZjc5bnA1VzVpZXgwQ0ZIeDlxZXV4NXhQWkhEMmMySUk0?=
 =?utf-8?B?QkF6b2xoclphMHZlaGpveVI2aUUvQktFcjZRSG55MGJEemtUTlVnVzR1bERo?=
 =?utf-8?B?bkQwdE5HMUlGZ080elpPelBwbFNTMXJ0c1crR2JneG9nZENKZzVoWHMvWUlK?=
 =?utf-8?B?NEZqTDh1WWZmOUlHZEtCZFJEbU05Z1NITEZJOHFETTVNdU45a2p1SmMxUFBq?=
 =?utf-8?B?OFZpNWhpTzZPcGp1blIydG0rQ1VCZUt4VGlWZmRna2VFY0wrT1NwL1E1RDdE?=
 =?utf-8?B?LzJjREtueFZtSnJVUFhZZDgwMkRPVUV1UHhrWFYzQ2VVT0xEYUVxMHU3WUh5?=
 =?utf-8?B?Ylo0bHUzYW5Wd2cwdG1MbWowVGgvc04remZXNWhPb2R4amdzbGdrWXdjSUVV?=
 =?utf-8?B?a3czblg0ek9HMzFGdC9OMnQySWQyUE5UTHEvZE5KNXRmc2ZZK0FMUE14bHZL?=
 =?utf-8?B?VVhmb296bGc2QXYzNjl5VzZ1eVZZV0hRM3k1THRtWWJNOFJOYlo3eHVSejdX?=
 =?utf-8?B?S0ZZUlhSUXh2V3FEOGUxTWNRcW1TZ290OG1VUEViRktlSC9zSXBNSkk4Qjkv?=
 =?utf-8?B?MDFVNGlERTBSRTRXT0FZZ2VvYitZV1ZaUGlDQXBhekI5d0hsWlU1SFJwYUo3?=
 =?utf-8?B?b0J0VkxYRTFCZkIzYjVrSWNUaEUyVldJVlpNQ1B3WG9hNENWWDg5a3RkcWV0?=
 =?utf-8?B?NGUrcVVUZnBVVi81S3YzWTRWdmM3UmwxV3FtZkgzTzBOS1hKdHJIQnpveDB1?=
 =?utf-8?B?MFg0VS9HemFhSXErcDlSLzBDaytmYlZwdmZJTDFHZ24yTENudGNHL0svYVY3?=
 =?utf-8?B?ekZGSGEzRFQ5RitZNFByVVdHbndweFNQM3JyTGRxa0pLems4RHQ5b2M1R1Rv?=
 =?utf-8?B?RG1wblpkQnRaS3dnWXc2eC93WTRVUzIrU0UzVDQ5QmE3cFI4TW01TE4wYjdO?=
 =?utf-8?B?cnlHN2tJTTM4ZTAxVUYyVjc3NGkyRTZlRGk1V2c4WUFHRFhlR3BpQzR6VEFO?=
 =?utf-8?B?VCsxR1BQWmNrVHU4bjBLUDY2eHZmUm5qTmhCN2FyT1ZZV084UUgwMjlxMks4?=
 =?utf-8?B?NnJjZW9xN2o1ZnhJL05BcVZWR2RKdzFTOW5BSVlQRDlsREVtL1BSRllPekQ4?=
 =?utf-8?B?YUFSQTdZZ0J1enhlZ1hnVlRCNzZhMHY5dTM5TzdlNVJuZjFMeXQ4QXpFMCt4?=
 =?utf-8?Q?umKhu21IrC2oNP3mosRpiYZ7r?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d4a8ac9c-7d5a-4fd5-68bd-08dbef5cf7cc
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2023 15:24:37.7453
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BElIWPwVWxGK6aEjLqcpR+ZqjC39bKzxWBeAP4cdvVnmhbLzpagdwGfAcMeAeOHu170DxegMoaw2aP7mFtRMwQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7810

On 24.11.2023 09:11, Nicola Vetrini wrote:
> The comment-based justifications for MISRA C:2012 Rule 8.4 are replaced
> by the asmlinkage pseudo-attribute, for the sake of uniformity.
> 
> asmlinkage may in the future have the effect of altering the calling
> convention, therefore three special where the calling convention is
> altered by another macro retain the textual deviation.
> 
> No functional change.
> 
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
> Acked-by: Julien Grall <jgrall@amazon.com>

Acked-by: Jan Beulich <jbeulich@suse.com>

Irrespective guidelines on when to use which will likely want spelling out
somewhere.

Jan


