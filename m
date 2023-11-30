Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3850C7FF758
	for <lists+xen-devel@lfdr.de>; Thu, 30 Nov 2023 17:56:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.645082.1006907 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8kJn-000421-NW; Thu, 30 Nov 2023 16:55:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 645082.1006907; Thu, 30 Nov 2023 16:55:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8kJn-0003yz-K2; Thu, 30 Nov 2023 16:55:15 +0000
Received: by outflank-mailman (input) for mailman id 645082;
 Thu, 30 Nov 2023 16:55:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=BG3/=HL=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1r8kJm-0003yd-1v
 for xen-devel@lists.xenproject.org; Thu, 30 Nov 2023 16:55:14 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20600.outbound.protection.outlook.com
 [2a01:111:f403:2612::600])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3a0436ce-8fa1-11ee-9b0f-b553b5be7939;
 Thu, 30 Nov 2023 17:55:12 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AM9PR04MB8954.eurprd04.prod.outlook.com (2603:10a6:20b:409::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.8; Thu, 30 Nov
 2023 16:55:09 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44%3]) with mapi id 15.20.7068.012; Thu, 30 Nov 2023
 16:55:09 +0000
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
X-Inumbo-ID: 3a0436ce-8fa1-11ee-9b0f-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ci08Y0wmOh8iI/fIXWlJSLn4rZT8QJUk/8f3+7IeZL1WY5cC6mjOV7KaKcTYsESBFf/KhOxTp1NrIOOStjMEOnWwT9j/0le1pl7FwHx5k5H8Zx9F3Fv6o5PIkURjPF4Hr5VcYVP31OVW5FnFqVJpPxcDfXvTDlvYB1GbSpNIJq13vTIW0hGPVmMtNB33W1mQ4dmGO/hddMqeZXEfoyTXKjJDf7+5uydQ6NWIk4H4QQUNI+zVSsFV1g0v6TLVHxY09BzeY/Lpf9mhxS9QBzbF6B++7ZWIKdAXkbzeUDyivIhqzG319zyOX7AuyO9caLhYB9JXUT5IHiPXRSul+G9Lww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EN7A2xSqslLl/wKIgCxd8LwVHYij5ag/iOmhZoc69oo=;
 b=UIf65Wm4fvISG+YTG1tBHbb+sEZU7QOWygFuxE+YKqJApZJ7AkfqKALnrcTj1fgjMHvJzlBkgf9sfyxlAmX2FWTNTbSw5940JfXg7GxoIV9menOQ6fjvjiobhCENNLm9RetyxbiMrnPq4yBQ0b7jwZLw8BmPB5F90upG7d70SeR+wooctZGDuTUlEc5OdzDnanZpRCgfWHpLAVFWpLsJHos+oGShBM1ANbm1cFjU+j1CB2lBZr6tbkqObxwHrilJQ9N+aiArVUGO/GOFaPH3Owqf9wohFuzdcMzLmCawIoR2sG6If9CP17ixu9qpsRs420KHnw7WyNQedXLiv6HUUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EN7A2xSqslLl/wKIgCxd8LwVHYij5ag/iOmhZoc69oo=;
 b=SKHHPR+Djkq/3G8T/1IpX3AEKTi4oPLgim92Ucjd5XJHulduKK7O2YKv9/R6ETjHSpDrwiai1nbM+5snsfUOCh2rybO9OH+Y6YQ5i9oh/9nbDwWn1Q95qryzMwAtVvhStklcEF2eDmv6hSr11pvtpJeielH9wjPCqhFUafCTgqDYf99B3axV3KecSSeaYZ0+EVAhQ7S/IhrPhq9cPQVhuVsQeCxAJpJdhOWd2Nycif2rnd9RtWLZCfdlBQLQVuny5mkpYWaL1HXz4jL9giLTfs3S6Zw6vUVetDs0YriVGWT5jPjl6jlVOF3yLXjzVg1lVtD9NVLJTrQVCMOZ+fj4ug==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <a65aafed-68c0-41dd-bf4d-3eeff87dd5d3@suse.com>
Date: Thu, 30 Nov 2023 17:55:07 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/5] x86/livepatch: set function alignment to ensure
 minimal function size
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>, xen-devel@lists.xenproject.org
References: <20231128100352.35430-1-roger.pau@citrix.com>
 <20231128100352.35430-2-roger.pau@citrix.com>
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
In-Reply-To: <20231128100352.35430-2-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0028.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1c::19) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AM9PR04MB8954:EE_
X-MS-Office365-Filtering-Correlation-Id: e8c092ef-bc78-4aff-5d38-08dbf1c51c73
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	YhD3ddlLriEOTcVC2mzqWfo1UWbXx4AqA6ReY8SCNJLnbOUEXXyO8ctQdISRV1gwWm1uHfZbn25w+lsOvnBGyl3Zsk5abIJf+2KlEWjojNcdbdBD8/aR16ka3bes/tmI1PR40XJOGiiQzVpZ0F5Va3/4xOA2yGiZa0VG+P91PCHA6b9u0W/BI3zauiuzjsI2CDQ5AlUkdWPXkO7jDrNsYUnB+LqzmNQYfWHq/TXhsRZ0k36TkdntTgY/Xkj3YbaoeG9C/UAR0eEoQdga0EzUp+ZhDzTvcEl/7Kfy6MNfCXDORng9+E3XrDGdD/VwMVCEc3MoJaZHE/TJO2GBYxCOzOTo7WWBFcAon7IGE4oAFlLSTOJyFo988kUlyeqC4uhyYrodl2SKDo6d8pzu27JZnZ3K8Y6410ud/NQKpe7BGIoOB9HrufHU75J7p3T9RED64y7L8fFb7yy7R7KgNqExv3+oZhg3XMnG8fauHC6+P6NGo5xdBHmG6Whw8+FcgtS6EKthRxXVxbB5gZ3tVC10J2gs2EwSrhobRBZbCOPcAkHf3QYNG9voN7S8b7zyGta62USolJikv9e9KHJk0xBGgCMQQYuAJ632LX0LznIZsl/f5cfygD/aNSoInp0N8gs7/yXpsEssREgeaufOBomApA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(346002)(376002)(136003)(396003)(39860400002)(230922051799003)(451199024)(1800799012)(186009)(64100799003)(2906002)(4326008)(54906003)(66556008)(66476007)(36756003)(6916009)(66946007)(316002)(8676002)(8936002)(5660300002)(41300700001)(86362001)(31696002)(83380400001)(2616005)(26005)(38100700002)(31686004)(6512007)(53546011)(6506007)(478600001)(6486002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OWtwRWM5Um9QVE5tZTR6RmliMU9RQTNmM3NRbHhRMFRabkc0ZHovRXk0YVMx?=
 =?utf-8?B?YWp4eUZpN3FTWCtqcEYxK1NvVDNYcXptMUZWRDVTbEFTODl2KzZyQ2hVWDJW?=
 =?utf-8?B?WC80YUlDc2pRSnAzaFhSTmcybWllVFhHNkZDUHlvV2twUDVTbWNpdW9MUnph?=
 =?utf-8?B?R1I2R2J6NGJCM2o4TVQvMTRaOG1PRWIxcDlPYjBmVER5K2gvL3lyemFJODZZ?=
 =?utf-8?B?RTJ0VW1haTB0Zy92ZDhHYmk5OU0zMFJMc0MwWDI4MFJZa2JteWs2eW9neTA2?=
 =?utf-8?B?cDdEY0VXNk9TdXh3Z3dzaVBjWkZGUEd4ay9UZTJKR0tsQm1KcEtuQXNhVEs4?=
 =?utf-8?B?VGpKREZIMzZsaTFTeS81UWN0NmJ5ZGp6SVBZL1lpMUo3OUg2UXl3M25pd0dX?=
 =?utf-8?B?SU9Yb2oxcFJQR1Y2Y0s2Q096Um9scnRWWWp3QjBkVUtIOForZTdjTFE3VGNU?=
 =?utf-8?B?L1lKQ0NuM0JYV3pWbmJPVVVDUThzT1I4VFQ0d1BqbHhWUldLeWRyS3J0K0xK?=
 =?utf-8?B?NWVsSWhtYlZSOGh3Zmc3cDcwc3JhSStUV2RTaytldWxZTElIU0ZjWTJ4bGQz?=
 =?utf-8?B?ZFlRU2o0ZTZKSUNpNGYwRXRQZC8vQ3QyUUZWZDgrdCtHYjMyMlRNazZKdFFY?=
 =?utf-8?B?TnViU0VCeGIyckJZdXJSMFYzSGF0bzA4TmlVNDNlQnBmaFFPcmhxelpBZWJy?=
 =?utf-8?B?alkrRGEvREdsU2VqQUpMQXFEOU1zN0lqakVBM0JTeGNTdkpQQi9TNlV2dWZy?=
 =?utf-8?B?aFdZU2Q5UjBzeW44WGFLZFhFUGtUbUsrL1hlZGV5WE5sVmtPRUQwcWJOcnh6?=
 =?utf-8?B?OUhSOU5WUkRaaUhwb05zMGZjZVJDbTBuSkhIVUZFMFRCcGJTV2pKU05ZVnJH?=
 =?utf-8?B?OGtxTFBMMlpBaS9kdUU1SmJnNWRwK3dRQU5INEpZeW10dTRBa0R5dTNtTnJ6?=
 =?utf-8?B?cllqV2hKSUNaZUR5ZXl3TlBIcngyZldNeVNQVVoyc2dYYTliUW9qRmdqTE16?=
 =?utf-8?B?RkVoT3RuRUw2VjhJa1FLSXBKT00zeVVOTDV6Y2pnV0NJMmhVTlFidWlXcm1L?=
 =?utf-8?B?ZUljWFI2OXZ4NUpINWlCM0YyczhoUjNuc05RbFpTUUVnRE1vVUxJOFRJRXo2?=
 =?utf-8?B?Z1crNm1RcFNMNHlvekJadjYxN0RXVTFrdXF5VkdwVCtJUEU3ZHhrVnFLQ3JY?=
 =?utf-8?B?dndKbmk1d1gzTGpvMi9nWU9TT2ZWVVI0em05NlphYUdSR1c3MzNRNEtKYm1n?=
 =?utf-8?B?bWh2dFlHUzBUZllPNERSY29yRnB2ZmMxbncxS1ZzNTBUd2VZemkwU0Mrb1Iy?=
 =?utf-8?B?RGxoTnJBSFdwblpHb0xyT3VmWjBodlAyUUhVMmFTOEd3eEk2aWhwNG5BenEw?=
 =?utf-8?B?dm0yUGs3YklXSlA0RmRiV09qYThQMVg2Z05rM1RxUVlMQXJFcnJLakhyeTZS?=
 =?utf-8?B?N0s1ZWw1OTlraWtibDVYRVJtUmFPcW12d1hpdGlOVy9VSmVmREdLOUhqNzNs?=
 =?utf-8?B?KzdaWXJ0dy9BOUd4SUpZU2p6ZXRQbjJZbXJRam1LSlVZNE5jdkt3dlg5b0g1?=
 =?utf-8?B?SmYzUUlsdmlpNGhoRGRlaWh1MW1DZTc3RC9aOXFMdy9IaWJQOEFOZllGamYz?=
 =?utf-8?B?dkZaaytib2NSWFdib1AxUnBEY1BiVUFnSmU3TjU3cktFd2NocXV6VUVYSjlT?=
 =?utf-8?B?Tk52STNIQVFCdnNTVHU3dXVERElKUE4ybHBpSW4vL0Q0UVFMUjc0eWVUandL?=
 =?utf-8?B?ekxOcXFGbyt1NVFOc0gwNzZURC9UMmtXdjV3WStUTXpTWmtGdGNydmV3YmR3?=
 =?utf-8?B?NDJQdXNjNE50T0RXS28yK05ZaG9NQ3V2L0k4alJIZndLNG80Y3hrcENnNEcv?=
 =?utf-8?B?NTlMVmluMkxhZ25ZMENkc2p2MCt6VmE5Z0JMcTc2VzlzM3JUb05TOERidXNG?=
 =?utf-8?B?SFFRZEZFOUdDUjNZK0w2QU9saTZXeGJFMzVaekxaT1dIYlYzYS9FOHpJT2M1?=
 =?utf-8?B?bXd3NVdhbFdKbW9aYnJnY0F1S3ZaVlhQa3lLODVIQmFENFg5aG41Y3IySmhm?=
 =?utf-8?B?NjdYa2tCbVdKQWtoUFM1MHBLNmdlek8yazlsOWxOWlYzcXJRTHdTQVJHVlo4?=
 =?utf-8?Q?Jwj/kGzOskBKPHzvSmg7gqvd5?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e8c092ef-bc78-4aff-5d38-08dbf1c51c73
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Nov 2023 16:55:09.2862
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 130TktVgzjBc+R+JJhtCPXmOBTT4foMNff+etqyaPPWDH9d4R1OyXjNi2AT28BtPNL36rRpnW3jzzdlfunyEUA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8954

On 28.11.2023 11:03, Roger Pau Monne wrote:
> The minimal function size requirements for livepatch are either 5 bytes (for
> jmp) or 9 bytes (for endbr + jmp).  Ensure that functions are always at least
> that size by requesting the compiled to align the functions to 8 or 16 bytes,
> depending on whether Xen is build with IBT support.

How is alignment going to enforce minimum function size? If a function is
last in a section, there may not be any padding added (ahead of linking at
least). The trailing padding also isn't part of the function.

> Note that it's possible for the compiler to end up using a higher function
> alignment regardless of the passed value, so this change just make sure that
> the minimum required for livepatch to work is present.
> 
> Since the option (-falign-functions) is supported by both minimal required
> compiler versions of clang and gcc there's no need to add a test to check for
> its presence.
> 
> The alignment is currently only implemented for livepatch on x86, I'm unsure
> whether ARM has a mandatory function alignment high enough to cover for the
> space required by the replacement instruction(s).

Indeed I was wondering whether this shouldn't be generalized, if indeed
required.

Jan

