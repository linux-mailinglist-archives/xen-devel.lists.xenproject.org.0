Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CDE197EF3AE
	for <lists+xen-devel@lfdr.de>; Fri, 17 Nov 2023 14:24:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.635193.991052 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3yp5-0007Ir-QE; Fri, 17 Nov 2023 13:23:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 635193.991052; Fri, 17 Nov 2023 13:23:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3yp5-0007GW-Mm; Fri, 17 Nov 2023 13:23:51 +0000
Received: by outflank-mailman (input) for mailman id 635193;
 Fri, 17 Nov 2023 13:23:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Shlr=G6=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1r3yp4-0007FL-DX
 for xen-devel@lists.xenproject.org; Fri, 17 Nov 2023 13:23:50 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on2060a.outbound.protection.outlook.com
 [2a01:111:f400:7eaf::60a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8a033f23-854c-11ee-98dc-6d05b1d4d9a1;
 Fri, 17 Nov 2023 14:23:49 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AM9PR04MB8381.eurprd04.prod.outlook.com (2603:10a6:20b:3b5::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.9; Fri, 17 Nov
 2023 13:23:45 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44%3]) with mapi id 15.20.7025.010; Fri, 17 Nov 2023
 13:23:45 +0000
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
X-Inumbo-ID: 8a033f23-854c-11ee-98dc-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y39wxukyWgiAJydL2KWN3Na4DAUuVrvsLewocw5Bj+om8K5kzU+WMdT5fWgtaCa30SsbsGlvO7JY0AF0cbaOja9yGwpE9pjEFdfWwPLecUW5BTv3Q06wD1hhb6+t8fTKgjX50Y1Ndj8ziAonbsPiqFji1VXjjsG0iPQhmR0wW8oLvpvLc1JEiskODDw/wTB0HqGRF7A3WrEks8aTs5HAbU5LZggpeK440+bkyefGA9osCC2Isv7AQXYjrwh+/t8dMEVTEB1ycefzDtagNCg0bxHwhha1YJsAfwiLik8mjXvgzkZfgtdz7yyZTHadNbtv3cbZXukLc/gJp21rfxjGCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MRHB6+sS19OG4GgIFafW9lXjSRUSHun0zYNKfwru9hk=;
 b=K+4u8kW104lCs9e5niLX8+B6MD7dYpdjHizS6REWPKynIEfUMgfjjnSRPYD9JNpGFpmUUX+lA6sh6l4M+4lWdYasZeLL7qp571SQveVepEzrke1zrMVUmpyUQAYPazNBIMZBIOFFzXuIN/y4H7dlLF3Dkeq98bkbmFE9AlFh5wwnys616pPUH1q9DXY9SofmnE+AGcL1iCRPIUsQrBTGa8XcWym/tHvO83MzciYIimD4U4dddzyIm69NwowhGz2MD7mST8/dtq97goamULlZBgitD4gmld9pv13VThh5GPrSODUlZ6uNk7gktG13ICHW2dQd4ZuTjUKSTBb3CTlH5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MRHB6+sS19OG4GgIFafW9lXjSRUSHun0zYNKfwru9hk=;
 b=5vkzAY6+cp+pMYInSEgAq7t+JCSPny6nhMuKmdFQi0QCN9qNbRhxpu+gQJzGC5Qp/zjbDztDxKAPVXnMkLewmh4fs076rM6waqJi6Dt0NxRTj1N4GQgxQzZfq+2BREHClYJea3Zng7hfRMCMmVpwmQy7cCGQYcfXOKLh/iVElJlncm7G5acempQmheiOyaElxgoKumlyIiwC7SFl2Wm08pltytoL89ezVK9tdx44IzY8+cu3oSF88gyvwzB8JcGnvpceT3O4CbSm/P6SjMz4quOEOwFNaC5Vh+pJ55lmoHTEX0M/DmMG0F09jE3DoTnExdm/0WGfxLL0Q93h9oFO7Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <a81699f2-f273-41f1-b0ad-4fc203b16420@suse.com>
Date: Fri, 17 Nov 2023 14:23:42 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 1/2] xen/vpci: header: status register handler
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Stewart Hildebrand <stewart.hildebrand@amd.com>
References: <20230913143550.14565-1-stewart.hildebrand@amd.com>
 <20230913143550.14565-2-stewart.hildebrand@amd.com>
 <ZVdfRQpGFSU1OIkh@macbook.local>
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
In-Reply-To: <ZVdfRQpGFSU1OIkh@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0118.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a3::13) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AM9PR04MB8381:EE_
X-MS-Office365-Filtering-Correlation-Id: 37429c09-b265-471a-b904-08dbe7706c8c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	GMJNcy/twBwzteDqgsYdGXDAschZ7gmm5tWl3g8JMaJCr/alPTRw6IHrFU1CnqqimRQXaqhJ/58E+7IvgMxRTdTyvCeUeTqbW3WpTVHrPQWpB3nmPBFvklpi5k4POBw89tBofijLBM0eiHlLgdFmauoNN/11Sx9sHWD891evIRP/n8Vf2docAmEr28IO9bOzyE18S2dZ3JNFhWo6D2sT0LizfIXqyk6PnRONPIrHoDWjjskgHZInZwGB/gyhtUwMtgfrCwG9n/jCh0G1rD9H2MoCWyYgQ5XMrtSSpGrNZvQ7sphnjLidN5brcMd6dTt+iu5hNDbZKGct8cTWoTdcQ2TGa5bgW9+5pu8c2vrwPx+rZXxQ5//buEg1SyuzL556plgjI0zpXTPsmmsSyo7Tj7AwDp/FsLzcnVL6PtAAX2b/qZxZkDjaFY6B5eZskbsxTrH8bRWiBmQ+jLdvOGcxu3IAV8Z3ZnOqO2kmBRZUFZJ+kT6aJCvH+IUktAFh93gDcQwXSJRAREU8LkTqBJ3oISNfe2D9M7Mmf5K/zhx/wKTmuhtptLk8LJBI7i3oNO1w4/Z2qY6RWum3P0iR6gh3t81oJl2xuLzHqum4A08FZnAC8VkQYd8xJ7SlCRbBqvGHHebgtkIX29hnEpd804WXOA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(346002)(39860400002)(366004)(136003)(396003)(230922051799003)(1800799009)(186009)(64100799003)(451199024)(38100700002)(31686004)(83380400001)(36756003)(53546011)(6512007)(6506007)(26005)(6666004)(478600001)(2616005)(6486002)(86362001)(5660300002)(41300700001)(66476007)(66946007)(54906003)(66556008)(316002)(6916009)(8676002)(8936002)(4326008)(31696002)(4744005)(2906002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cHNUc2UxMWY1OWFZeHFKeGdDSm1OU0VKQUcyaHdLdzFlSEtMSnJvaFlQUzF0?=
 =?utf-8?B?emhYb3psTVZiOVJjMHY2Q2NhMFcwaEV4MjlUVlJkVXBBaVZGM1VueEV5YVZr?=
 =?utf-8?B?NHZhdUR5ZGNhSG5mUm9ER3J4THhTaFJMMWhyMVNkNkdMbC8vRERjYkl4bUNh?=
 =?utf-8?B?cDZRU0ltTkM2eDJMYmZ3bjFIZWxwVzBybEJUUGNpY09HWE5pYkJ0OUJxVTFp?=
 =?utf-8?B?SDVlSUNFOWZ6bUt5TWI3TFJRMm1JZEpnakxOR2FDbldTeXF4WENRWkVNUlBG?=
 =?utf-8?B?S1hpcW9nY2gvUERQY3JsZy9FYjN0WGZvK2xBVEJWVmRjaU9XKzEzclFVVlpC?=
 =?utf-8?B?Yzd2T0JQaXlqQ2xpNGZqSlowQ0haaFVqc3ZBK0FLd2hzM1plK1BmdlE2OGl3?=
 =?utf-8?B?a2NNVnJzTkxzdDFVY0RRVzc0WS9La3hmWFVISGx6N0RwcWpJaHdTQ01vc01a?=
 =?utf-8?B?OVJnNFU4MzFBa2wrb0I2MTh3ZnlvMnV1OGo1d1hyTURBTll4YzBIb2lJQWRR?=
 =?utf-8?B?bzVoQlgxV0F0VFBmaU9IUStVNGRmemhzbGJjSHJrUWEvbmI3Mlh6L1hkWFBz?=
 =?utf-8?B?MFVMMDhzQ1BWQkYzSkpVT0lOTUp1Qm9hWG5GZ3lOT1A4ZUJaWHAveXI5QXBI?=
 =?utf-8?B?ZHV5YTJpYk1pd2lhdkdoWlMveXMvQ1hzWHhUeG1nMEpwcGR1alBXTWJJT1dJ?=
 =?utf-8?B?aHRtcW8wd2h1Yy9NZ2l1bU5SbW9BQ2pJVis1amlCd2ZsbkZoSUkvM0dDdTZK?=
 =?utf-8?B?TWowQ2ZsTGRrMDc2bTIxRFRMbE9HWUV2amd2NXk3elV5WHVRdmZhdnhKQ2lo?=
 =?utf-8?B?WldKT2M2eE1SM01xRm1EeFBDdndHZEpMeWpkd1NiTk5ZNGJ4UVViYmc3N2dC?=
 =?utf-8?B?K0E5Uk5IdXNJb3RBaGVIRytGcjF3d0VGTzJ2U1k2Mm9oUzd5YWlIcnpCYm5F?=
 =?utf-8?B?NGgzNDJ5bVRZUzNEOHoxSURha0t1T0pJNm1OQXFhVU1YUThSWE1VM1J4dHQ4?=
 =?utf-8?B?L1NyaVdEcjJvZjNWQk91L0MzYXNUYmYvRWM1OVdFZThZWkFvamM5RjVIOW1k?=
 =?utf-8?B?a25CYlpjc05OMWlpdXdhL004Q1VnWnBGWVk4YzFWaDdkQkpsMThVODFUalZj?=
 =?utf-8?B?UlFIaEdOOFpXVGNJSHRtNVNXWWZRb0d4OXkzaFc1N0piNW5JZ1Z4dWNWSEZy?=
 =?utf-8?B?ekQ1ZkJaaWw5UmNwK1BmaTJlM21Ya2hycCtMdGh3czlqUjlOd1JhUjE1L09K?=
 =?utf-8?B?TnhzalBGVExwREh1MTBETEQ3MEMxVlFVRnNMcEx6N0JhZDZOUUdDZVNiWktT?=
 =?utf-8?B?YzUrZXVTZDY2MS9CQkp2SGxXM3Y0a1pXZWx4RjZaZGt4VmUyZ1JYU1F1OHNz?=
 =?utf-8?B?MEZHMWVmOVhoSEdrYi8vOFp5b1pQU1U4ZDhYWEJBbC9peTQvd0lBSEVyUU84?=
 =?utf-8?B?NVFQZFNqb3VzNXhqSU0zRy9HeDNSMmh0RFBSZTFOSlVsWmJSVk5HTUV2TWgy?=
 =?utf-8?B?UXA0RE4xMzdteHdRNk1aSk9ESTA4bkRPcU9RaHBzVjhEVkh1WGpjT1AydDR0?=
 =?utf-8?B?YmlweGx3Rkw4aXUxZnBHUUxIUEpUQmVLUEtKYzFqQzhLQVRqRVZ4WVFBTGZN?=
 =?utf-8?B?ZkFGMXFyM1VWd3lQVnYwQmVsWGZPUGpSblVjSFVuczlJN0pCNEFPMlJNcTRp?=
 =?utf-8?B?YnpCenZiaG9wWVI1Q1dKU2RvbURKWnVzWUZxQ3VsRkt2MDFGOW5HSFhwdzVl?=
 =?utf-8?B?VnZtMzRHQnBtSmFGUHo2aGVDZFNSaHIwNFpKdXBhMGZvL0ludkVkRXFlcDJ5?=
 =?utf-8?B?eWNQME1kbk1WQW96R3RvbjhDNCtLNTFjWWcwOFN6bDhjamxSdGJlN3pjWEgv?=
 =?utf-8?B?OUN3WFQ0RlJBUWhPdVEyNkc1TzhLY0tMa2RSTllibGJGMjV2bEdsVWJ5Q01s?=
 =?utf-8?B?OWs0blNwbmZsbkovcktGS0tMdnZ6MUlPZlcrMENNVTVjcUFQbVgrUzZCbHY0?=
 =?utf-8?B?Z1JtV1J2cS9CY2hmV3U2NDEzYjJKV1BVNG5pckF4YjJaaUZCN3Z3R2JBTW1W?=
 =?utf-8?B?RlFNMER1Qk9RUFJNdTc4UmU3eURCK05NWHNuS284bkZZdUlqdW9vbmZGcnBy?=
 =?utf-8?Q?QwlrD7aTJCSRtZGD/MDWRwK4d?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 37429c09-b265-471a-b904-08dbe7706c8c
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2023 13:23:44.8371
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Pg5oYWpR5teP0AUbOAkuJiW/DeftE68Fzfufx0vlfshOT1XYYvznKaYTpnQFjA5xfffLFv0sZ5AqUdcJh83tUg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8381

On 17.11.2023 13:40, Roger Pau Monné wrote:
> On Wed, Sep 13, 2023 at 10:35:46AM -0400, Stewart Hildebrand wrote:
>> --- a/xen/drivers/vpci/vpci.c
>> +++ b/xen/drivers/vpci/vpci.c
>> @@ -29,6 +29,9 @@ struct vpci_register {
>>      unsigned int offset;
>>      void *private;
>>      struct list_head node;
>> +    uint32_t rsvdz_mask;
>> +    uint32_t ro_mask;
>> +    uint32_t rw1c_mask;
> 
> I understand that we need the rw1c_mask in order to properly merge
> values when doing partial writes, but the other fields I'm not sure we
> do need them.  RO bits don't care about what's written to them, and
> RsvdZ are always read as 0 and written as 0, so the mask shouldn't
> affect the merging.

What some version of the spec says is r/o or reserved may be different
in another. Also iirc devices may (wrongly?) implement r/o bits as r/w.
When presenting a virtual view of devices to guests, in this regard I
think we want (or even need) to enforce our view of the world.

Jan

