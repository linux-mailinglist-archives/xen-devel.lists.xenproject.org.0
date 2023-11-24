Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 673067F6E73
	for <lists+xen-devel@lfdr.de>; Fri, 24 Nov 2023 09:41:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.640242.998216 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6RkL-00014b-JT; Fri, 24 Nov 2023 08:41:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 640242.998216; Fri, 24 Nov 2023 08:41:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6RkL-00011n-G3; Fri, 24 Nov 2023 08:41:09 +0000
Received: by outflank-mailman (input) for mailman id 640242;
 Fri, 24 Nov 2023 08:41:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Ulgz=HF=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1r6RkK-0000w7-7c
 for xen-devel@lists.xenproject.org; Fri, 24 Nov 2023 08:41:08 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2054.outbound.protection.outlook.com [40.107.7.54])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 35fd36c1-8aa5-11ee-98e2-6d05b1d4d9a1;
 Fri, 24 Nov 2023 09:41:07 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AS8PR04MB8326.eurprd04.prod.outlook.com (2603:10a6:20b:3ff::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.14; Fri, 24 Nov
 2023 08:41:06 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44%3]) with mapi id 15.20.7046.012; Fri, 24 Nov 2023
 08:41:06 +0000
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
X-Inumbo-ID: 35fd36c1-8aa5-11ee-98e2-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D+ouUBlKszdRgtU2ttY+EwDtXA8DUCwg6Bu6OXVFMQIWb2MWY5yjhBdCtGrlUt1ou+pymfw8GxmRv+XROVLbGwWtusXtq1vIfjgRNJg1S6Tsi68yjViohSolR/YWxOZLrTcwHVmL/KrNxhSbEmtmg4PzvJK1SKH6lag2kZnZGcLEfmqoqRUFjdWXltUkR1H2WVr7atX8NcD81S/pZEACBGkZkKT+5+ZiWIRWP5dbTO0q+z2qtUPcS85EBAiHVkETHSSRq40x9hGLM7E1cViI18koDJWKgfJX2Put6pq+6pQ0HxkZoNWd5XJY97es0CRRaB4fnnsCYzc3qkV9R4xSpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Kyyx5vIHThvSYKK02N9Y0rNPtrf3MAusP4heeqDrmco=;
 b=jky5A/+2rbuGTqAbXBKi+a2wviEMfLw1bAnXO5WdkOBKbyKPkt9Q+BmKidDIIPP8k/T7t+GoRiOmGvYVNleZiczjQbTinCUJ7wxwMdLq+pTptRMaiVE1F2FhnsHypOyofEvQhGoC4A0OASjnac2lssKjN+x+e2g64ZdJPDVmNF+JeRgASKB2xqfsjFjrX7W2dZggJu4KCtL1uIOeFvDC0j/2W+Wm0wX4RxTo0SxE5xhKOCc4K47NOi9Vn2xs5XOveTRAzE7pXG+KH1I6jdMQnA+EqxqzH1kiMALfM89nzAiHLJSNKtcC2FkE3eYllvLaIES4hcwn81qO6acx+uOeDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Kyyx5vIHThvSYKK02N9Y0rNPtrf3MAusP4heeqDrmco=;
 b=WMfIQjOEeg+6m+YVy3EqCoKDFh9AiPahYEYtYTQRp3Rl0MjOPMw1Bum0mkOS9OE52bJevOeOR4DMcaegYDjAet1wySJzmMBBBBJY7W8Mn4OziiQ8AvzvNfgTB7PK5M14aCX9XwET0Pelz8s2d2xAZOXm//kfto8w4Qpw70oXKvxptRzXcAUtzGmDFnxZgQ9uxukxLxupnUVlaER6+cJzpp5fZuPjhtLgN51nA9UXFOic3FJQVxoBqzUK7Zji5yFU3s68vKl9yxY2nixblkJr9H/RRJ8RxaMoCh7wvnEO2HQJMHiSDYoPbMM57kULPVWq8sylsPgpOuyzkxHaYqEteA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <d07fb86f-ef9c-4c2b-ba9a-f1e5c813d45d@suse.com>
Date: Fri, 24 Nov 2023 09:41:05 +0100
User-Agent: Mozilla Thunderbird
Subject: [PATCH v2 08/15] VMX: convert vmx_basic_msr
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Kevin Tian <kevin.tian@intel.com>, Jun Nakajima <jun.nakajima@intel.com>
References: <b63b648f-02d0-4e52-a5e5-94ffd5666a14@suse.com>
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
In-Reply-To: <b63b648f-02d0-4e52-a5e5-94ffd5666a14@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0408.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:d0::6) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AS8PR04MB8326:EE_
X-MS-Office365-Filtering-Correlation-Id: 935eef31-ed9b-4576-38c7-08dbecc9196b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	enLxqzssjVJx/wQOZVANK5hv7Us8r2/7tkQir13eYb1/aiKsJpf/wU+Gs3Hffr5Qqg4Wnqpe4YDDQ53QDs67IDQ2upOUJB93s3dWCqiycO1lXrz6PjS4XXswpOaEyeAOvJwLLVP2niWS7liamwOGQNojBz5OFw4vQl/JH1867yXIz6ruZWBL6ADTHkKCmiG315Oc8ZuRhU1kdHECFxMinQIPRvbSsMs8WIVclkyKuWjYpKH+S8K7IiM75GH/Rp5yaBjAvHvEh+FEhgcvvGQaJa3pqSUr6a6r9HzEsZ0AfqGDUXcVtTB3+5lZtl2nG0zbTKybHfzcRSO4OpnLn/o25GCBjfKYtoPduGGPue3QUPfe1ptW8UqiNnJr7XYW5HuiA56ArObdLqYgG8RUvilMT3wVl7oR1L8odXLFN1hxjfEpYjb7GK8jbqb8HKHzrIg57kvl2PIY6ag8ZWHy5fzJa4+H2XOsawPqPTN5HqDdz8sbKuhb/NH3EwuReZkSPuvHw7wujFRN8x8C21WWENjTrtsJjHcmQR36UHgxa0spj7fAkE3pbFp1VfrEPL2rcR2XxvBvGfKbiiRC0zyLyr4b0Y7f86PwhA55AC2vXvqLhqXSqRMxJgnAS57ZWdYOEqagusKucbZwAfotSdqJTbOEJA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(136003)(396003)(376002)(39860400002)(366004)(230922051799003)(451199024)(64100799003)(186009)(1800799012)(31686004)(26005)(66946007)(6916009)(66476007)(66556008)(54906003)(38100700002)(36756003)(31696002)(86362001)(6486002)(83380400001)(2616005)(6512007)(6506007)(478600001)(4326008)(2906002)(316002)(8676002)(8936002)(5660300002)(41300700001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bDZyK0REOUl3RzJialVabTdreXhvUy9QQXh5aFEzYk53S25nQWVxSFc3MTRS?=
 =?utf-8?B?NE5PYUxHKzlSejJhZHozNHNQYXFBYTFKQ2taQ0pYQnZJY0VHay96M2N3UW1K?=
 =?utf-8?B?d1IzSWVBanE2cXNPUHJUeGZQcWlTeEtsUDR1cTRMa0tDWkd4a3V3K3AvR3Fx?=
 =?utf-8?B?aVpPdXNMNjc0eUxuaWY3T3kzRmpaUDJzaWszTVB3Z2NMdFZlN2RxbmVPbFMy?=
 =?utf-8?B?TDQxU0ZQaHpUd1hCR3REV3hveU9uUGxwWWNhYmxBdU9kWjRZQ1lyYkJuSVRa?=
 =?utf-8?B?NDgxVSt5SGxaTTNJL05IYkgvZzBDeTZ0MzBldzZjYXRmS0ZTYmxoT01FL0ls?=
 =?utf-8?B?TmVSN2FPNDlwSnFKWU9pUVgra1VtUldVSmFUQmFDUTkzcGJOaXZlY2lRaEkr?=
 =?utf-8?B?bVVQSmlkK0I2cDQwM3Yza3BpKytjeHZ1Vm1CNDlWREJkYVFtZHQyd2NWWnRs?=
 =?utf-8?B?d21ucVlLT29nZ3pRVklpaW1zTWNQdUxOT2tFbmYxOTRveUtJR05OVjdTcFpQ?=
 =?utf-8?B?bisraVpjODdZYUIrWUFsT0RqV1JEUUxRaFQxVGdjMWREMVFPZ2VtV3VHbWFJ?=
 =?utf-8?B?KzZvTzRES3ZpYVU4U3IvWnd2M2NYQ0ZGS3IwQk56RW1JbzJxVXRvalFZcVZx?=
 =?utf-8?B?L3lCR3N6NG9NYmFYamxXS1hPU0dhL2JWNysrMXIzVTVSMjBhSTB4U0luOUpF?=
 =?utf-8?B?YzlQTzJJYkluVlBGdnB3N3NxZ3VnRWlYWktidFNvL1dKZHpNTGZIWXhWd2pu?=
 =?utf-8?B?REV0UlRibkNpWTZ6YndHSHlnOXRpazNhOHVicDVjWHFOWGMvOWpkeDNiM0I5?=
 =?utf-8?B?c2tMdDRpeTlxVEdscmZuUkdQT3QxdjJzY1poN2tzV3hNTWV2aU9MTWxONEhK?=
 =?utf-8?B?QXRrdENkYSs0WWtrQ3JIUVR3MEREZjZkVEhvUCtRWDE2R2N1QytKMStsMVNY?=
 =?utf-8?B?eTArcnY3aUpOakFhTFpMV25DK1RFWHoxdXlza1FwQzlqcGRzSmxoeWI5bTFE?=
 =?utf-8?B?MEprb28yNWMxWWRtS1k1YzdjZE1wTmRJMmx3bEhWZWg4YlVQb2huc2tlUXpI?=
 =?utf-8?B?dzd4SjIvRjgvem9mQkRMcFpuMXp0Y0g2UEdGclA3cWhrcXVySlhXaXBYSjJP?=
 =?utf-8?B?S05JYTczdXFlZVQ5cktYWGlsQytRUDNPbjUxV3RudFBqQW5LUkxESmZSNHFm?=
 =?utf-8?B?Z0tQVFA2TVVxc2gvNGJDSVhXUnIrUWoxbHQ2WjN2ZVczWUVWK0FxaERDVEF0?=
 =?utf-8?B?bTlldjBsOFZ2UTRmNEl3Mk9yVDZJSFNsckc4MGg4N1puY05tNis4SlltMnc4?=
 =?utf-8?B?RWtmVC9sZGQwdlFGWlNNV2F6NzRKbVpzckY0T254cm53UVNZeG9Nb0szbkFy?=
 =?utf-8?B?Tk5QbitZZStnVmRSY0MyNSs3MUJDdkZKV1dOWjZiT3I3Q1dCbGZhcFkzMWZX?=
 =?utf-8?B?bEVHM09WS2F5YzFnTUl0OGc0Z2F2cDZPUHRxMDZHZlgrTVhCSllBM1k1ZjNs?=
 =?utf-8?B?QnE5eEpHVkZsc3NDbmlKWkhlcEc4SStpK0Zrb2lHWGNGVWhkUEluTU10NUN4?=
 =?utf-8?B?OEd6eFNPQWxMZTdGOGlMMURkT1F2Z0NCUWJtMFYydUh2NGN2cjJLT0JJdXl3?=
 =?utf-8?B?Zzh2U0EwZmJTRXpLeCtmQVlpeDZqMlA4RnR6b3pucFZqYVVYL2FPUW9hTTVV?=
 =?utf-8?B?VUE2bGRYS1BDYUl6Vmc5OGN2NHUxVkZkTUNiWndxRW5ERHltYjFGZDVjTzNM?=
 =?utf-8?B?am40YWZhMmRLcHhHL3BQSTVwK2ozbDJOZW1wU0R6Z2R0RnZ0aTlBZnd3UFRx?=
 =?utf-8?B?dlpiRE8xZzE3ci9tK3YzOFRGWGFaUGtVNVZ1UHZPcnlQanVHT1JMTTI1RTMw?=
 =?utf-8?B?L2dhd1FtTVAxWHpDSzJqWFJnMDR6aStMekNjM0I2Ui9OMktRa1VIYmtndFpx?=
 =?utf-8?B?RU5rWkJDZHJTYitIUDd3QjlQU2F1UTdKK2xvMXZTQ3E3NmV5d2pHb0IzQ0gv?=
 =?utf-8?B?WC9OeHg0R0RmRXZiRWJOdzBCOUQzS2Z6ZTQ3WEwybmIvVHFZTDlZTGpkZ21Y?=
 =?utf-8?B?Yjd0OEd4aXRkSWY3UzlLR2NvUGZMZklRVmpVTUlKV043aU12L1laL0JNNHhO?=
 =?utf-8?Q?RCtSsOuRStHiMlpfcbTXYweHb?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 935eef31-ed9b-4576-38c7-08dbecc9196b
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2023 08:41:06.2992
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zuoUYtDUYONARDDkFzcZO71nEp6WmTSZYegvyIo6RvjLAid/V0N2oHo79gNFTNGqvVJ3bFNwrdH8P6ByiThxDQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8326

... to a struct field, which is then going to be accompanied by other
capability/control data presently living in individual variables. As
this structure isn't supposed to be altered post-boot, put it in
.data.ro_after_init right away.

Suggested-by: Roger Pau Monné <roger.pau@citrix.com>
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v2: New.

--- a/xen/arch/x86/hvm/vmx/vmcs.c
+++ b/xen/arch/x86/hvm/vmx/vmcs.c
@@ -161,6 +161,7 @@ static int cf_check parse_ept_param_runt
 #endif
 
 /* Dynamic (run-time adjusted) execution control flags. */
+struct vmx_caps __ro_after_init vmx_caps;
 u32 vmx_pin_based_exec_control __read_mostly;
 u32 vmx_cpu_based_exec_control __read_mostly;
 u32 vmx_secondary_exec_control __read_mostly;
@@ -174,8 +175,7 @@ static DEFINE_PER_CPU(paddr_t, current_v
 static DEFINE_PER_CPU(struct list_head, active_vmcs_list);
 DEFINE_PER_CPU(bool, vmxon);
 
-#define vmcs_revision_id (vmx_basic_msr & VMX_BASIC_REVISION_MASK)
-u64 __read_mostly vmx_basic_msr;
+#define vmcs_revision_id (vmx_caps.basic_msr & VMX_BASIC_REVISION_MASK)
 
 static void __init vmx_display_features(void)
 {
@@ -470,8 +470,8 @@ static int vmx_init_vmcs_config(bool bsp
         vmx_ept_vpid_cap           = _vmx_ept_vpid_cap;
         vmx_vmexit_control         = _vmx_vmexit_control;
         vmx_vmentry_control        = _vmx_vmentry_control;
-        vmx_basic_msr              = ((u64)vmx_basic_msr_high << 32) |
-                                     vmx_basic_msr_low;
+        vmx_caps.basic_msr = ((uint64_t)vmx_basic_msr_high << 32) |
+                             vmx_basic_msr_low;
         vmx_vmfunc                 = _vmx_vmfunc;
 
         vmx_display_features();
@@ -522,7 +522,7 @@ static int vmx_init_vmcs_config(bool bsp
             mismatch = 1;
         }
         if ( (vmx_basic_msr_high & (VMX_BASIC_VMCS_SIZE_MASK >> 32)) !=
-             ((vmx_basic_msr & VMX_BASIC_VMCS_SIZE_MASK) >> 32) )
+             ((vmx_caps.basic_msr & VMX_BASIC_VMCS_SIZE_MASK) >> 32) )
         {
             printk("VMX: CPU%d unexpected VMCS size %Lu\n",
                    smp_processor_id(),
@@ -2169,7 +2169,7 @@ int __init vmx_vmcs_init(void)
          * _vmx_vcpu_up() may have made it past feature identification.
          * Make sure all dependent features are off as well.
          */
-        vmx_basic_msr              = 0;
+        memset(&vmx_caps, 0, sizeof(vmx_caps));
         vmx_pin_based_exec_control = 0;
         vmx_cpu_based_exec_control = 0;
         vmx_secondary_exec_control = 0;
--- a/xen/arch/x86/include/asm/hvm/vmx/vmcs.h
+++ b/xen/arch/x86/include/asm/hvm/vmx/vmcs.h
@@ -283,6 +283,12 @@ extern u64 vmx_ept_vpid_cap;
 
 #define VMX_TSC_MULTIPLIER_MAX                  0xffffffffffffffffULL
 
+/* Capabilities and dynamic (run-time adjusted) execution control flags. */
+struct vmx_caps {
+    uint64_t basic_msr;
+};
+extern struct vmx_caps vmx_caps;
+
 #define cpu_has_wbinvd_exiting \
     (vmx_secondary_exec_control & SECONDARY_EXEC_WBINVD_EXITING)
 #define cpu_has_vmx_virtualize_apic_accesses \
@@ -366,9 +372,8 @@ extern u64 vmx_ept_vpid_cap;
  */
 #define VMX_BASIC_DEFAULT1_ZERO		(1ULL << 55)
 
-extern u64 vmx_basic_msr;
 #define cpu_has_vmx_ins_outs_instr_info \
-    (!!(vmx_basic_msr & VMX_BASIC_INS_OUT_INFO))
+    (!!(vmx_caps.basic_msr & VMX_BASIC_INS_OUT_INFO))
 
 /* Guest interrupt status */
 #define VMX_GUEST_INTR_STATUS_SUBFIELD_BITMASK  0x0FF
--- a/xen/arch/x86/hvm/vmx/vvmx.c
+++ b/xen/arch/x86/hvm/vmx/vvmx.c
@@ -1556,7 +1556,7 @@ static int nvmx_handle_vmxon(struct cpu_
     rc = hvm_copy_from_guest_phys(&nvmcs_revid, gpa, sizeof(nvmcs_revid));
     if ( rc != HVMTRANS_okay ||
          (nvmcs_revid & ~VMX_BASIC_REVISION_MASK) ||
-         ((nvmcs_revid ^ vmx_basic_msr) & VMX_BASIC_REVISION_MASK) )
+         ((nvmcs_revid ^ vmx_caps.basic_msr) & VMX_BASIC_REVISION_MASK) )
     {
         vmfail_invalid(regs);
         return X86EMUL_OKAY;
@@ -1794,7 +1794,7 @@ static int nvmx_handle_vmptrld(struct cp
             {
                 struct vmcs_struct *vvmcs = vvmcx;
 
-                if ( ((vvmcs->revision_id ^ vmx_basic_msr) &
+                if ( ((vvmcs->revision_id ^ vmx_caps.basic_msr) &
                       VMX_BASIC_REVISION_MASK) ||
                      (!cpu_has_vmx_vmcs_shadowing &&
                       (vvmcs->revision_id & ~VMX_BASIC_REVISION_MASK)) )
@@ -2187,7 +2187,7 @@ int nvmx_msr_read_intercept(unsigned int
     case MSR_IA32_VMX_TRUE_PROCBASED_CTLS:
     case MSR_IA32_VMX_TRUE_EXIT_CTLS:
     case MSR_IA32_VMX_TRUE_ENTRY_CTLS:
-        if ( !(vmx_basic_msr & VMX_BASIC_DEFAULT1_ZERO) )
+        if ( !(vmx_caps.basic_msr & VMX_BASIC_DEFAULT1_ZERO) )
             return 0;
         break;
 


