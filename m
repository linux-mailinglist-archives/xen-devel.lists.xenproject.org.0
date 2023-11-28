Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B6867FBBD0
	for <lists+xen-devel@lfdr.de>; Tue, 28 Nov 2023 14:44:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.643182.1003142 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7yNJ-00028S-22; Tue, 28 Nov 2023 13:43:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 643182.1003142; Tue, 28 Nov 2023 13:43:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7yNI-00025D-Ug; Tue, 28 Nov 2023 13:43:40 +0000
Received: by outflank-mailman (input) for mailman id 643182;
 Tue, 28 Nov 2023 13:43:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xcZ5=HJ=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1r7yNH-00024n-IT
 for xen-devel@lists.xenproject.org; Tue, 28 Nov 2023 13:43:39 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01on0601.outbound.protection.outlook.com
 [2a01:111:f400:fe1f::601])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 225251c4-8df4-11ee-98e3-6d05b1d4d9a1;
 Tue, 28 Nov 2023 14:43:38 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AS8PR04MB8055.eurprd04.prod.outlook.com (2603:10a6:20b:2a4::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.21; Tue, 28 Nov
 2023 13:43:35 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44%3]) with mapi id 15.20.7046.015; Tue, 28 Nov 2023
 13:43:35 +0000
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
X-Inumbo-ID: 225251c4-8df4-11ee-98e3-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RFjOp1rbzcCkBiThiDqzgN3NowHPl5YxYHiThpotWIAd4XYs6atX+JsZwHQAPSsk0YosGHdKFsRxJD1Jxx5a9N3ePDlQ7POF+qRYXT+Efa+Kb+Bm2rq7jfjrcv3wBc91uzB8IBc3PAYDP855CwI4jBMX9h0E/1FlaDuo2R1YRPFMvk5qUJv/VT7MAwc35N7wSNe0Gs+men1C9aRcTL+BIpUCGZZSfZZ9lw3V9OryrC6lcsj9xVehGwa/Wz/QTyQEEYmxX6ptc4E28qnvicyDK1N1LKkPwnjhT2g3xOQHe/jQB1qhjHvmJS/Aszy7YUyqnNVtOI0uKOEUYfvxY9HEPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bRnlGgR3goSptBX4lELfDp94qd3aU64P1ZdD374ZpQY=;
 b=GDM3OmJZtHDFwq72ODlfP7Q+v0S55yZS9KvB4zoswFSoS4DHAZSsEK8Y1A++l1ABH/oafWkFb6GMSvu04m9yLGC54gCpmnZZ5/grqlnkQ4eBVVQ+v19oZqlWkT401BGH3opsHaCxKn91bRToDItfx5WdqkLk7X+lwG9UrTUbo3n+vPhGJ4RD6WHAmdBcWtij0LJNyQuUtLSILXFMVgzUubYhgpFHtQwbDBv/0/ssd79lErzmohR1OUMvYpEh9s44hVSn4TCvzYx9QfJVgHAo2/bMKjnV4mm5wOLZWGR/PwIgxXc7h8kU7/gcNP7w1xJ1t3rkD9Z9vhMH2jynyM448g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bRnlGgR3goSptBX4lELfDp94qd3aU64P1ZdD374ZpQY=;
 b=YLpwukg4jggxnvPJgbjjV0a3PBCLSLVK3JugybEHIlvkITseYRK3yZ2K2QdVNMa+NmXtMIfxOWudvDStnRNTMIEyF1G4/Rc5+krmV/xewF2+NkNcLz9aAQAT35f6pRDOSeHXQix7VxqYAAp7oqzTmttVn3SvBIouBOkYn5mA+hp74ppIg6jCeHS1397bDc4ebWUWGJYv4chG6BtdGEll8RQdsGQp/Z6HTst2p5T+yqzbwvh9MWdoKVFLF1JXv0gP7HcMHb3J/xz3NjokS3XXgbjUjqgq1j7ZzOb2Qe5qpJzRdzPgC2XDw+iv+0+CwEYY9eOm4RtRzuLeAjecntIwGQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <74748681-dca2-437a-a438-f0a6294ea8e4@suse.com>
Date: Tue, 28 Nov 2023 14:43:34 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH] x86/guest_walk: address violations of MISRA C:2012
 Rule 8.3
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Federico Serafini <federico.serafini@bugseng.com>
Cc: consulting@bugseng.com, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org
References: <e0422c0127ebb402bb4f593d41571caf36b0864b.1701164432.git.federico.serafini@bugseng.com>
 <320b5d4c-73c0-45de-92d5-953bcae59e4a@suse.com>
 <4f09cc01-3975-4c2f-960f-67f3ac1f53a4@citrix.com>
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
In-Reply-To: <4f09cc01-3975-4c2f-960f-67f3ac1f53a4@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0152.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a2::6) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AS8PR04MB8055:EE_
X-MS-Office365-Filtering-Correlation-Id: c5a4ad0a-cd6b-4f90-f477-08dbf01804dc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	sx/qE9FrDachAR91K+poQFkV3l4VM3oNlrboOVgXVZ7zl0vPnv9sJy6BqD/r7LZJBXKbF0Qw7citymD7NzF/vx45CnBxrJJox8zZGCwmKYRmMRfrGgG/SY8EcPJzfbJuGBq0K4HOIQM1Q3qnWojv+DZ33+u2lBs/EHBYey1UcfnGYz4eAzWazYDPEcXaLW5w9JktSaitNHDU/4si664BWh+QguYu2o5GWRkitzr3bQ3YMvPJOhW2XXdNV7ONZ50wWGN0q+OWRr0FBIdRBxd4RtJ54QXI4RfbBu2rE92Q/X7WNvJB+CEEEtjSE3ad2C36oSfFIICUySLjhsDPt+t+kCPe8NBHPSKaC7G8JO3IVEyFa/HJYefp9GwlW9uUWg+x8SeGbFeC6s5CZJcDjQszO1fCAW8GfYpwioFsBqKYMxaRzDXghBhLymuIFttJstINjwLzNrPQndI35oWykiKgGZ9j9966z5cTQrb7JThu8n93uqmJfVGWuMRm0jZexZWxi/jZi0uyUogTqb6can5lDZcU3ebVH8aVjlDGK3yFS4z79XU2JPjruLBaadA6DAT5p+VRi0EHzXsUkZ3pU2K+Zxn2kPQKuj8s9bu99NWL2OPLLIWNyjIGtcy6xVgxWBUQYYSUr5uBboEY1X2ZSi0rlw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(376002)(136003)(396003)(366004)(39860400002)(230922051799003)(451199024)(1800799012)(186009)(64100799003)(26005)(83380400001)(38100700002)(31686004)(53546011)(6506007)(4326008)(8936002)(66946007)(316002)(66556008)(110136005)(6486002)(966005)(54906003)(66476007)(5660300002)(478600001)(31696002)(8676002)(86362001)(2906002)(41300700001)(36756003)(6512007)(2616005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dmNZblJtQ1EzQlpwWEJoL3diNHVsQW0zQjd5SmlacGRjRzJKYU15MloxL0lY?=
 =?utf-8?B?UDZqZjJoVXRNSVJXQjg0ZUw3V1ZnKzFpRWtYLzRSNTM3NW8remloRzBoT01w?=
 =?utf-8?B?Y3RYSW9DSEkxSnRGVDNqL0FtSVF4aDUwbzZUanEwVjdTa1N0K0VrOTZ1cWxi?=
 =?utf-8?B?cjFsckVNS1VqVTZ0S1JQNjYvci96aGl6ZjhibmZVNThEdHpjTXZlZ0xLZ29U?=
 =?utf-8?B?Q1kzL04vNkQ1QURGcHFGOVR2K0ZKMjBWUHNyam9kcll1Qmtwa1ROSSt3Z0tY?=
 =?utf-8?B?cTlHNTA5STQ3aXNXNG5kUmRnZTVRa2YvbmkwZnJCV3ViS0JHUEd3RDZVSUh6?=
 =?utf-8?B?bUl3SXc3WGk1U09IYTRJNmlUamJYZjBvcDY4aHNaZ3lNUDBlUUlSZnk1eG16?=
 =?utf-8?B?dkhkOFUveE9NWUhLUzJnZW5FTGp6TUxDRWs4N0N2WXN3UFZ6dmVGa2lsbDdH?=
 =?utf-8?B?L2pqN1lpd1RPN3k1MEl1cHUrOStkbGhPU25yeGdtRWh2c2JzRURFbWhsRHlm?=
 =?utf-8?B?ZGVueGlySjYvNzhaL1BFWDI5MTg0RGZKaHd4SGNrdWo0V2t2V0JiZ3RGU2JR?=
 =?utf-8?B?dzlMc3BicThJMUd3MEh0UlFUZ3NseDJ1SEI3aTZBRUpZR25uT1BrbzBHbno2?=
 =?utf-8?B?UTNJbFJtcUtudExWZW5WYXA1ME9WL29aREpxcXVlbU00S2tpbDJndUVzMm5p?=
 =?utf-8?B?VTF1eHFPOW1JZFdiN3lGYlZZd3ZXcGM0QnlpdkxJeWNJWU5kd1VlenhJVzVF?=
 =?utf-8?B?YzdncXNrTGRHaG1xYktSVC9VcXJiblBpc3Z4dUtLbDNKajNYUXBVQ1FPdld0?=
 =?utf-8?B?MUVjcHREZWswQ2kzUUVYSUdaRmFVcTJHWlBOazhxVThHNUI3Zkl2YnRIclcr?=
 =?utf-8?B?RmRRZksyRUE1UkRNdjNtY3ZtcncwQ3ZZbnQxS1JXRHFNWUU5bUlKRDBBZDk5?=
 =?utf-8?B?WUlHTmM1SlF2SG1YcWpMSGJWNE5vY01DRUt0bnpxbmtwSFhUdGVxNHR1YkFl?=
 =?utf-8?B?RUtsL0kvSEFpMDl2RUVtand2U1BzcW1SZlJtVVBMQ0lQN2RGTkpHSFd4S2s5?=
 =?utf-8?B?ajFNT2d3bnl0VXI3MWNoZEZiSGtGVHgybUh0TWVGekUvLzFwOFhQWEhEeXhY?=
 =?utf-8?B?UlJDMFMvYnJjVGhaOVBPT0FuelAzQjBJOVRrcFdLOWdtM2tUQXVHMFI0YzZ1?=
 =?utf-8?B?M3lWV0xlS1hVUXhrMFFCTjltTHFJMklzY0NHNEFqWFoxc1hWUmZxUGNmWXZx?=
 =?utf-8?B?VGhUK28xK21LbFBkc0hUamJRMU44S01pVHRWZ0Z1Vk9BYlAweVN3bE13WjZY?=
 =?utf-8?B?WEE1VWlrQUZmWkN3QkFmeGtKaS9tdHprdy83WVJHQjdqRUFYSVNGYng5RHVh?=
 =?utf-8?B?ZzZwWURDN0h1cG5GNGpLR0hoM0Y4S1J1TFFLL2xJYkIzRlh3L3g1YnB4VnJy?=
 =?utf-8?B?NGVnTGM3MytxWCsrUXkrdXBPVjQzd05NM0lVVTRWdGVjSUxxbGRSTjMxMGVK?=
 =?utf-8?B?VkxpdVlRZWVScEozOG82cHlHUW51ZS9EdW11c3RhNC85N1creUo2ZzhHMVZU?=
 =?utf-8?B?WWh4OER2S3pmaGpuNjBHSUFWeUV0NnZmcTY0RjJvdmdBWjYrY1h5U3NUSG9H?=
 =?utf-8?B?b3lVQjhBZ3BvbEF5RmRUZldPQXBuT2U2K1ZmNTB1Zll0eFBwWGZZSVpsNGs2?=
 =?utf-8?B?OFFsYzhxaVZrOTNVWXdqdUJFdU5oZE4yZ2ttcDRpajhVcDhDc2U5Q0N4VWVL?=
 =?utf-8?B?Z1huSE0xRTdZWE9na3k4VXVKcE0wRmRmUFFBaVhjdXJWcnd4WjFXTVc5c1NN?=
 =?utf-8?B?amV6dUtlZFZQb2liTFNKNXpsTzVxeitIVzdUSjFlRTdockR5U0F3VnNZZi9S?=
 =?utf-8?B?SFprTS94YmlZSnZVbjVWcERVYkpNakx0WGhYWkQ4ZXk2cm1XczJ1a1o2Mnhu?=
 =?utf-8?B?bzEyWkc2cFd5N0NkWFhmVDNwajlNeXZFYlR2UEUrdkZwZlBaNnhJOU1kcndO?=
 =?utf-8?B?dTdxN1hlSFE4UC90ZTREeGZvQ2tURHF3UzR1OS9rYXpFcmlYSW5mNnp0Ti95?=
 =?utf-8?B?RWlwOXdwZmdmQTBkZDZTMmRFQkdONEVTczFRazN5d1BuZVJOc0Qvb1VuT3lT?=
 =?utf-8?Q?lDsi+i7Umk0wmPHLMWmsGrERv?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c5a4ad0a-cd6b-4f90-f477-08dbf01804dc
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Nov 2023 13:43:35.5284
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PRD9Sl5NBq/MD/h4IDNgM12h8k359nSjIpSuFeOQGMhd71VdMgBtFPlPDT98QHHAH8kknop6wmcb8A7GxBUHbg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8055

On 28.11.2023 14:17, Andrew Cooper wrote:
> On 28/11/2023 1:00 pm, Jan Beulich wrote:
>> On 28.11.2023 10:46, Federico Serafini wrote:
>>> Uniform declaration and definition of guest_walk_tables() using
>>> parameter name "pfec_walk":
>>> this name highlights the connection with PFEC_* constants and it is
>>> consistent with the use of the parameter within function body.
>>> No functional change.
>>>
>>> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
>> I'm curious what other x86 maintainers think. I for one don't like this,
>> but not enough to object if others are happy. That said, there was earlier
>> discussion (and perhaps even a patch), yet without a reference I don't
>> think I can locate this among all the Misra bits and pieces.
> 
> I looked at this and wanted a bit of time to think.
> 
> Sadly, this code is half way through some cleanup, which started before
> speculation and will continue in my copious free time.
> 
> It's wrong to be passing PFEC_* constants, and that's why I renamed pfec
> -> walk the last time I was fixing security bugs here  (indeed, passing
> the wrong constant here *was* the security issue).  I missed the
> prototype while fixing the implementation.
> 
> At some point, PFEC_* will no longer be passed in.
> 
> Therefore I'd far rather this was a one-line change for the declaration
> changing pfec -> walk.

So that was what Federico originally had. Did you see my response at
https://lists.xenproject.org/archives/html/xen-devel/2023-07/msg00122.html ?
While I certainly agree with your plans (as far as I understand them),
doing as you suggest would make it harder to spot what values are correct
to pass to the function today. With a suitable new set of constants and
perhaps even a proper typedef, such confusion would likely not arise.

Jan

