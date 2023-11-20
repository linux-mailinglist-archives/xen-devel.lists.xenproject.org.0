Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BFE07F1225
	for <lists+xen-devel@lfdr.de>; Mon, 20 Nov 2023 12:35:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.636626.992218 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r52YD-0002HS-OC; Mon, 20 Nov 2023 11:34:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 636626.992218; Mon, 20 Nov 2023 11:34:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r52YD-0002ES-Kr; Mon, 20 Nov 2023 11:34:49 +0000
Received: by outflank-mailman (input) for mailman id 636626;
 Mon, 20 Nov 2023 11:34:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9+lD=HB=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1r52YB-0002EM-Sz
 for xen-devel@lists.xenproject.org; Mon, 20 Nov 2023 11:34:48 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20617.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::617])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ce8875e2-8798-11ee-98df-6d05b1d4d9a1;
 Mon, 20 Nov 2023 12:34:46 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AS8PR04MB8103.eurprd04.prod.outlook.com (2603:10a6:20b:3b3::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.16; Mon, 20 Nov
 2023 11:34:44 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44%3]) with mapi id 15.20.7025.015; Mon, 20 Nov 2023
 11:34:44 +0000
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
X-Inumbo-ID: ce8875e2-8798-11ee-98df-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gUFbK6ZKX6xM73gNggmtFspC1OvpiWjCAipAzymsWmXRA6V4AZPxsJEAABxKucWqXevSWAYu9VckmsXpQKlqeC/hIoHUZaJMyboWfwIpHWm5ePOD40mi86Z0wHHRN95L/m0EMf1bAPmO51ctUm7pGKshCyM54q78E7T+GZ2kXGT6aBzPc/6/BWbZLw1k0H+2YaUfv9AOxnEoiuClv+bwrs5UFyyQMmuz8+TeJl+vc2kzSlibhFt5UIgdBHLnL6DIKS+xA27KdzClRpUvphtw2CDk9wf33fEI3X6cdNRU3HVK3XTLVukRY5k12ss6i1nCuelyfPu/ZwVVBw53SkN+Ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z5kLVuIyFrgiWUcHogd2nCXxVGSKSjpcut5ZCn/5sAY=;
 b=HcaMo3oqL0bC//NKtPyFpXG41cdXeISRRGURYgDw8fjcj21f9QAuRimc67xWayKVU5pSy3YziI0QQaDJTiBuY0X4R4qvWMXMBDg90GzWVVS26XPDkiJ531mQAJhhFTT9wIRcoA4BpTO5p6cgbwl8EYoaHBI2k8WT7UlYCG0gyshsulGEcj7+1MsUGvKrzV5KlBnBOKS5/lP07Z/lCYXatkcsxomFY+HcVBUnF3IZ18Qn0LqkOV6E3j2SYc8eBfAg3ttSN4r/UAjhfB0inzn7azT7LdcDUsl6PsED9Da43Ewq1mcEvqXPFugwdM9bclC1XnNRYkdKj2KZdc67eVzuhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z5kLVuIyFrgiWUcHogd2nCXxVGSKSjpcut5ZCn/5sAY=;
 b=pcr8Of2topzpzqGhInHsJUz1chMrnIkO5nqRrlnlLR0ZrNlYdJ0IgW2A/6ix09z8UxPwn8S+9Ly26KM5vuTSaFJgp3ZXkaFzKZrhjvZPZbJ9zrUrn567Km9E2k6draS9IyHnzp2bsN1WEqDWdXtI3N/WNYHjAUYDUQsR1QQJj4SslhCd1GKufJ0g1/4N5eLdq2MaXmeaUhi3aR14zSsfNk7Ah17LAKEV59JEkELVv3Ek/tTPNfSmdVhpAXU2bDTLdvc3PjBzq8sWohg+6Unz4bCeq83E3lu0r8E7FgipdJ637Y3xmPHpK5liH2w819QD8PKjJbNTe+wAeZhes0lp2A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <a857c016-7cc7-48ed-968a-8a9f2748c8d3@suse.com>
Date: Mon, 20 Nov 2023 12:34:45 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] amd-vi: use the same IOMMU page table levels for PV
 and HVM
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <20231117094749.81091-1-roger.pau@citrix.com>
 <20231117094749.81091-2-roger.pau@citrix.com>
 <e90d416e-f4dd-4b2c-9247-0e3aa35c26d9@citrix.com>
 <0392fe23-7589-4dc2-b664-1e7e01c3914d@suse.com>
 <ZVs0fvUQI9C7NRc5@macbook.local>
 <f414730f-307d-4ef6-9aaa-a861925fdab4@suse.com>
 <ZVs52elOtWbTaD0i@macbook.local>
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
In-Reply-To: <ZVs52elOtWbTaD0i@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0283.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e6::12) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AS8PR04MB8103:EE_
X-MS-Office365-Filtering-Correlation-Id: d9e905ea-c5f6-422d-32b4-08dbe9bcb19a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Eg2GGbQrih52bfOWKwBnqBc96leRO1iKpAOckXlOZgc8iyRMWtSoeXj1Sjv8sIEFwyuPPpEx8Nlveudkwqo6QkuqQ6M/wraL/n/F0ENEFqUiwWJVRH+cYp4B64iMcGJMC/3BVe4zxSnXoDJp/FsCdJlYs2YwjYpKK+3AKlHjKWB82hz/uoFkVtKRfXa9aAUJb8YjoHtXKVKfNFcNdaY+O+0o+jYQ8q3B4Y9ZfwsnN7pKV0O47/emD7SCOJ3Y/kZzkAWwNDBp0+W/HDNHALw1s5y2xLa8oU0T+CwYZpuvzy833pe4shLKcGb490FPVW0DVSfnci2j1049FoiKbln/2Qii2GEdeh0EWta01FX0lyYLlqGKLpboIiqz+dkCFu7tjNQI4ocoYiNf3+HOsSUimEQLb2aAunJhDBn67q4C2tQzEKcWkgGqFM0lBXH/XFxqGez9X2SHza78V4woQo1725Nw2XVm1WaHt3pFML0GnxEtvmt5Dr5bdAmrBzUXq/UHjB+tlwJ4Rl87gVet44d24gwsaqOUrbhjha2h6VwchRQGpmqtzYhoFppBEwxrdXVx/kSR5l7Sv4PaAktI2gWFKqHERmuU4EWl0txo7+cnzPBnhgBnJDIZAovGmDoE0PUCHaHbOsJOX9shHluykhn2Zg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(376002)(366004)(346002)(136003)(39860400002)(230922051799003)(451199024)(64100799003)(1800799012)(186009)(41300700001)(36756003)(5660300002)(86362001)(31696002)(2906002)(6512007)(6506007)(53546011)(2616005)(26005)(83380400001)(6486002)(478600001)(31686004)(4326008)(8676002)(8936002)(38100700002)(316002)(6916009)(66946007)(66556008)(66476007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZGxBRGFXWVRnZFc1M3pwWEYrcm8zVmdEaFBPYzdza0tCSjJDNjBzMWtIbi96?=
 =?utf-8?B?N3RQelR1RlpYd0RndVE2NUVVRFE4QlR4RFRwbi80RCtPWlROVEJiU1ErU3du?=
 =?utf-8?B?bkZjdVRPK0NpZzh5SmZZc0czWGxkcFRSd0FoTzJKM25NVStSTlg0RWxndjBv?=
 =?utf-8?B?aXRYVHg3THBrUkREOEtZVUxyZ1orUmVQK3oxbmIwUlVmcWo3TUxkeWMyUTlL?=
 =?utf-8?B?TiswbDNmRkp2TXJxU211R3Q5d0tWcTBvdGdxbGJyWEcxVm1US04ybE52d05h?=
 =?utf-8?B?Sm5ETm9qTVdSVERhYmpwa29YTW1lMDRZcUlCUGhacXphaVgySis5NTZCWUJJ?=
 =?utf-8?B?L1VBSjl3OHJrV3NjdmU4c255TWxPdHlXdC9IcTByTzlvenVIcGp3M3RaMXBw?=
 =?utf-8?B?R3dnd253QlVwWmtFUXhRc2IzRWRtT0NBbUNVcnRtVjhaNjNhcHZOVFlBVVRO?=
 =?utf-8?B?Qk5QOWxRdDdCZDcrNGZ4VFh5cFk1SEpEZ25ieE9hTlI4dEtBWDFnTVJ4eTM3?=
 =?utf-8?B?RDF6MDFxeWNHR2dXalZBT002OUVBeDU5K2thY1lXK2ExODlzaEY0blg2b3Zw?=
 =?utf-8?B?Q0I2enFWL253WktuV0V2ZUc1THFFRHRGY0hxcWFERHRxbFpIQ0xPK0Fhc1lC?=
 =?utf-8?B?ejE0OSszZHZoSnNIOGdQQTFOVmpEZXNlajhDKzlpdTUvaUp4d2d3cDVwSUJM?=
 =?utf-8?B?MHM5RFBJNnBMTXBmbGZqK1B4WHBIZDN0M1NvcklUbXhydE54bDdpTGdnYnhk?=
 =?utf-8?B?ZlhsWnoyd0x0UFlmZXJVczdxNDI5WjM5d3FkRGE5QTVwV1N6cmRFeDhmTzFh?=
 =?utf-8?B?K01jbFVZeVRHUi8xMDIvaldCZUNMZXlZRFFJY3hGN1BjOWhnM2JyRXhnRUJ4?=
 =?utf-8?B?UGJQV2EzQWNnblYyNGgyN1F1V0ZrOCtFbDBscHYrcWNReVAxNUVSRDhadUJI?=
 =?utf-8?B?T0R4RXJMUVFycTcxNGtSMmlkdkpsQWs2UnQ0eEhLMjNYWVNtOTE5VWpmOUpG?=
 =?utf-8?B?RlhFb1dScnB5cXkxMkhYVnRZOWhyZDZmaklRSXBmeTAzcWNmNXU2aEE2bktN?=
 =?utf-8?B?NmZJV0FsL0xTRmJqc1ZLSjd4RXl5czJBMy90eml3TWtieUkwejluUlh3QmZx?=
 =?utf-8?B?ZG1QTXh2NVdSSGVSUm5SVVl1QnhtNVJxVXUzOG9uSWpNS1BjbE5UYURLNUVI?=
 =?utf-8?B?aDFIVHV2a0s4ck5uM25BSmFEYXBSUGo1eHVjbWdHNENOdWxiNlFJWGx5OXpH?=
 =?utf-8?B?dzJLTm54M1NjWTNLbVVvdDEvWU1ralJTVmNsNWRUKzluUEpuV0k2K3FRY1pu?=
 =?utf-8?B?RUFoWXFrVTFJN1puQ29iTWpXVE5uRUt1bjh2d0FJWmNGVHJKOFZmaDl6bVFj?=
 =?utf-8?B?YU9GbU1VNTFiV1hCSkZDR0ZQM21GQ2dKYjhxYkJaV1hOWEFPQml2eTg5VmNi?=
 =?utf-8?B?amRpRGp6djJJL3VPT1RmckIvNmZPeW5iUnVGSWpMZ3JUbFhmTUw2YnVSUFRo?=
 =?utf-8?B?dUNoczVsRHA2a3NBUlJuY3VpeGRsTXVzeHErZ2w3UDF4T3NwRy9Fa3JrNWRv?=
 =?utf-8?B?bDB4RTNBQXRtRERvYlFEY3Y4RWZDM0krSHhSUlpBUjY3aFUrV1dmekZDQzlS?=
 =?utf-8?B?dUs0SkVqSHRKYnRqY3B6bklZOENCWEsrRkpmeWlnYjlpdjJobkl2b1FtUzdw?=
 =?utf-8?B?bi9KenhpYVhSeHNlV1R5S0lpSVJaby9QMWFUMmFHQ3F0YlJPd3RuM01YMTdC?=
 =?utf-8?B?QXZhZTNIRzdHTHl0OUJWQzZpRGZlUnlveTgyUjZ2cDAzcVZRN1RRNUJ1cUJt?=
 =?utf-8?B?MElId1NxN3pDbUFUTXpLaEJ5Y0ZaSGRHMW1jZUV6Uy9FR1JTYUlVL1l5bDBR?=
 =?utf-8?B?QmJJeVQxMW00OUpJWjF5SDN0NmlUb2hZTDlLT28zcW9xTE1IKzZrejlrMjdC?=
 =?utf-8?B?RXB0MkJCUmZTZStxK3orZjF5Y2ZrTjFvTGhUR0N3WWtXUHpzYXYyYlUwclZj?=
 =?utf-8?B?aUZxajFtM0NBN3dyaFhSeTRBa0tVdVlwbkl0Z0VLbmtGM2tpSmp6eEQwcm1S?=
 =?utf-8?B?SDVmSVZPbDE4eFIzSmNxeFhXeFlHVno2OVVMdDNsVXpicDlrbUREOFh0aGNJ?=
 =?utf-8?Q?KMq8LovNIlGgc8v+49nt4h2In?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d9e905ea-c5f6-422d-32b4-08dbe9bcb19a
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2023 11:34:44.7385
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zpPPxMMBMw08dYKMF+IKF5NscrYIKioRq4XA9FbaAGl0vR7H9kX8Bzfq04BnbwdKKaiBO8yESl2jtJLzbv1AmA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8103

On 20.11.2023 11:50, Roger Pau Monné wrote:
> On Mon, Nov 20, 2023 at 11:37:43AM +0100, Jan Beulich wrote:
>> On 20.11.2023 11:27, Roger Pau Monné wrote:
>>> On Mon, Nov 20, 2023 at 10:45:29AM +0100, Jan Beulich wrote:
>>>> On 17.11.2023 12:55, Andrew Cooper wrote:
>>>>> On 17/11/2023 9:47 am, Roger Pau Monne wrote:
>>>>>>      /*
>>>>>> -     * Choose the number of levels for the IOMMU page tables.
>>>>>> -     * - PV needs 3 or 4, depending on whether there is RAM (including hotplug
>>>>>> -     *   RAM) above the 512G boundary.
>>>>>> -     * - HVM could in principle use 3 or 4 depending on how much guest
>>>>>> -     *   physical address space we give it, but this isn't known yet so use 4
>>>>>> -     *   unilaterally.
>>>>>> -     * - Unity maps may require an even higher number.
>>>>>> +     * Choose the number of levels for the IOMMU page tables, taking into
>>>>>> +     * account unity maps.
>>>>>>       */
>>>>>> -    hd->arch.amd.paging_mode = max(amd_iommu_get_paging_mode(
>>>>>> -            is_hvm_domain(d)
>>>>>> -            ? 1UL << (DEFAULT_DOMAIN_ADDRESS_WIDTH - PAGE_SHIFT)
>>>>>> -            : get_upper_mfn_bound() + 1),
>>>>>> -        amd_iommu_min_paging_mode);
>>>>>> +    hd->arch.amd.paging_mode = max(pgmode, amd_iommu_min_paging_mode);
>>>>>
>>>>> I think these min/max variables can be dropped now we're not doing
>>>>> variable height IOMMU pagetables, which further simplifies this expression.
>>>>
>>>> Did you take unity maps into account? At least $subject and comment looks
>>>> to not be consistent in this regard: Either unity maps need considering
>>>> specially (and then we don't uniformly use the same depth), or they don't
>>>> need mentioning in the comment (anymore).
>>>
>>> Unity maps that require an address width > DEFAULT_DOMAIN_ADDRESS_WIDTH
>>> will currently only work on PV at best, as HVM p2m code is limited to
>>> 4 level page tables, so even if the IOMMU page tables support a
>>> greater address width the call to map such regions will trigger an
>>> error in the p2m code way before attempting to create any IOMMU
>>> mappings.
>>>
>>> We could do:
>>>
>>> hd->arch.amd.paging_mode =
>>>     is_hvm_domain(d) ? pgmode : max(pgmode, amd_iommu_min_paging_mode);
>>>
>>> Putting IVMD/RMRR regions that require the usage of 5 level page
>>> tables would be a very short sighted move by vendors IMO.
>>>
>>> And will put us back in a situation where PV vs HVM can get different
>>> IOMMU page table levels, which is undesirable.  It might be better to
>>> just assume all domains use DEFAULT_DOMAIN_ADDRESS_WIDTH and hide
>>> devices that have IVMD/RMRR regions above that limit.
>>
>> That's a possible approach, yes. To be honest, I was actually hoping we'd
>> move in a different direction: Do away with the entirely arbitrary
>> DEFAULT_DOMAIN_ADDRESS_WIDTH, and use actual system properties instead.
> 
> Hm, yes, that might be a sensible approach, but right now I don't want
> to block this series on such (likely big) piece of work.  I think we
> should aim for HVM and PV to have the same IOMMU page table levels,
> and that's currently limited by the p2m code only supporting 4 levels.

No, I certainly don't mean to introduce a dependency there. Yet what
you do here goes actively against that possible movement in the other
direction: What "actual system properties" are differs between PV and
HVM (host properties vs guest properties), and hence there would
continue to be a (possible) difference in depth between the two.

>> Whether having PV and HVM have uniform depth is indeed desirable is also
>> not entirely obvious to me. Having looked over patch 3 now, it also
>> hasn't become clear to me why the change here is actually a (necessary)
>> prereq.
> 
> Oh, it's a prereq because I've found AMD systems that have reserved
> regions > 512GB, but no RAM past that region.  arch_iommu_hwdom_init()
> would fail on those systems when patch 3/3 was applied, as then
> reserved regions past the last RAM address are also mapped in
> arch_iommu_hwdom_init().

Hmm, interesting. I can't bring together "would fail" and "are also
mapped" though, unless the latter was meant to say "are attempted to
also be mapped", in which case I could at least see room for failure.
Yet still this would then feel like an issue with the last patch alone,
which the change here is merely avoiding (without this being a strict
prereq). Instead I'd expect us to use 4 levels whenever there are any
kind of regions (reserved or not) above 512G. Without disallowing use
of 3 levels on other (smaller) systems.

Jan

