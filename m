Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E7A37F26AE
	for <lists+xen-devel@lfdr.de>; Tue, 21 Nov 2023 08:52:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.637543.993440 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5LXq-00010M-7e; Tue, 21 Nov 2023 07:51:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 637543.993440; Tue, 21 Nov 2023 07:51:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5LXq-0000yb-3o; Tue, 21 Nov 2023 07:51:42 +0000
Received: by outflank-mailman (input) for mailman id 637543;
 Tue, 21 Nov 2023 07:51:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=GR51=HC=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1r5LXo-0000yV-Tq
 for xen-devel@lists.xenproject.org; Tue, 21 Nov 2023 07:51:40 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on20601.outbound.protection.outlook.com
 [2a01:111:f400:fe1a::601])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cda3d2bf-8842-11ee-98e0-6d05b1d4d9a1;
 Tue, 21 Nov 2023 08:51:39 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AS8PR04MB7845.eurprd04.prod.outlook.com (2603:10a6:20b:2a7::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.17; Tue, 21 Nov
 2023 07:51:37 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44%3]) with mapi id 15.20.7025.017; Tue, 21 Nov 2023
 07:51:37 +0000
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
X-Inumbo-ID: cda3d2bf-8842-11ee-98e0-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CvtAUhjKncNx3pZChXX5sH7ZhEjsNiRgXr5CbMvrQ4O6Df9SU3upunyd/KFpFpN8l2bzdkZ6KeJFHZF3dvRtNC1Ey7nMZIziloMRJCca5etsj6Cl8kl3hdh7sYY74Y8WpQpZmKHyizhvnHDfF1NfKoFrGKYTcDs03KYv+UlYIQxfphtF/+9GGLg5dMKY+QdcaBy5ddFd4L4445qiP0RU/vgoN8bmUR64CMgUIbDsx/LR2CnUbNXQRbJv9FqpmAM4NTIwFWISvjxq/MXHLzeYaY7UeVuFwAggVF1On75jgB8bVo5hYkZRBt3FgNCjqBqP+YNW/OIwqg5NMnnFHvfzdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g+Pawjvh5SRvBlXq9dDwKAkGRDL48PudhnjDk1gP2p8=;
 b=kWd/MWim/0f0kVc1fguzrGKkgeslZ8qBZRz2PywMB1MDsR0MYTahdA8siH/wJ/AWcGCY6P1EU64Dn4XHk0dpVlYlXVbHuZj3GyilyvvctHBOHtkJPEsQNRu5UN06LciJxdAXbXjSY+Lg+5/c2SMQfY83JDqivsHnH0kgVIds4YWpFYqV23olvAzmIc7CMB9w6j6yhgMkxmNwCEeIy2n7v53I9HKDCRc2SFCoqITwJG6HWb9ZS4fxlvpN6DY7yOLoIXIrZ0cotfCXaA7y5N4n0YU2/uLlivl8Rna6ich12JS24+P5MG9Z4JVYqr4FJ8T5bZYiFiS4/SEWgH2UxbAkBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g+Pawjvh5SRvBlXq9dDwKAkGRDL48PudhnjDk1gP2p8=;
 b=Es1+U+eh2k8ir2YU505QK0UMV7zy2EvFxVldIM92E6SpcYDc4JfJJdlgBCNbZN3a8de8IvDd847jIQyHv8s5VOmAbQGSJUuodpuPvEFmQDZNUF4avqPHNg6gJt742OTNs4+Dq4a9hq6CLesZq1ShyUimN9rEdMB9+F9y4eCtMG7v+hxRz7TMvzZfsOwOpOZ1F1kj5iJQrK6doEqXfJeBGe8RCf5V3lTuBq4HRuey+N8OZt+42hvjDdpMoInmB/dc6/kPfBe+sUQ/bUYL3znDztSgrUBPRDiV0xpZWBuHqJrPlKZnl1z3+jtZDVUFnK87VHyGGCQNN373FDsa3c57Kw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <6dab17c7-2363-491b-a3ef-46b6c4ea206f@suse.com>
Date: Tue, 21 Nov 2023 08:51:34 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] x86/setup: Make the loader variable const
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Nicola Vetrini <nicola.vetrini@bugseng.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Roberto Bagnara <roberto.bagnara@bugseng.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20231120224912.1421916-1-andrew.cooper3@citrix.com>
 <20231120224912.1421916-2-andrew.cooper3@citrix.com>
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
In-Reply-To: <20231120224912.1421916-2-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0014.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a::24) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AS8PR04MB7845:EE_
X-MS-Office365-Filtering-Correlation-Id: 4cb3cd08-63f8-4337-5dc6-08dbea66b06c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	TRKDVBYr8njsWJ5SQxfAlyg3ghmyqe3+nWXpY3qM1YYk1gdxAq/7tTSVyEE0AIcUo0CnRKKQAUiq0wYw4/4XyG/bgfQFiiilB1sIIoeZU4hvtGn5lI/P0XavOk9vKkfH85bbTjFqFnoXyZZ0XmpT3iEvaQuYlq91bmES88U890BylxLa5KtYO0iUxKwKRJ9cSUjWXW+PlPoIUoVLZ6MTa83igeXp6TCL/qc+rfjKwg/8MrwM0N+3Fs4nyKocYOK11H/v+L7/LrS1lAUp9BeseE1XayqxoyEOSUGomkM2/d8LaXhpG1zrntxyyyZEc/7AZNxVUHMpG+riWUM0NdMWVw6/GT8TaCfZS5hzMme2fTHTrd5f4D0obq+lu9T0WNSMv9yePu2g0IGSc5L68lsiPqXnjZp+emLcsu3C8SSgBm93/RGERel/+kui/bTqP14dWlmLkn2OSR1IXKTk+4JFLMN/tE+jsIJn9JV+JG569D0A4+s6A6ZJYeS+gGpXYO5GoaV1hglREma/QGxrdyDkaD+KH5gbhr8ijks4BCWHs7BkhJzF/IBFB8GNGWvM9//6pXKjxr89KBVmB7u3Mu5i9rawHruDOeOCsR8D5sCR3ya+y2mwKTy9AiIDPubie636KM44gaRrZXHXCBhm5sWn0Q==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(376002)(366004)(346002)(396003)(136003)(230922051799003)(1800799012)(186009)(451199024)(64100799003)(478600001)(6512007)(6486002)(2616005)(53546011)(31686004)(6666004)(6506007)(26005)(54906003)(66946007)(66556008)(66476007)(316002)(6916009)(86362001)(31696002)(4744005)(2906002)(41300700001)(5660300002)(38100700002)(36756003)(8676002)(4326008)(8936002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SWQxS1grY0U3ZUwxaFJiNkRYa2NIbHdGeE5iV2Y0VUh4S0JVb1lPZlA1S05a?=
 =?utf-8?B?Qy8xUHUrN1MrVGIyNGFNOFlldkF1Wm11cGtsdUdHeGRGQ2VhTlNtNGhGR2pk?=
 =?utf-8?B?K0tIUHFMTWkvZEx6b3BQNjFjZVdUaHp3allKOEhNSHJGOVpleW1yc1dvWW5k?=
 =?utf-8?B?UDk4bGtOZkxBRWdKbTVEL1NZbnFEUFZSZFZpN0JnYUljSWRyY1lyNWE3SUEx?=
 =?utf-8?B?eW4wOHdnVXNaMEFJdGlWclg5ckQ5RmlRS3VoWVpVNUZ1SExmdmt1VkFKdFQ2?=
 =?utf-8?B?LytzUGRrUnR3V0ovbmlpWTVVV3pocWwxTElxc0llTkw3bGE4c2VTTmw3akxE?=
 =?utf-8?B?WWxzSytFc0dNbUNpYWRoQkgrNlN2Vm9pMWcwUm9UUEY5dnBNODZQWCtmR2Yr?=
 =?utf-8?B?QjZ4RE9sRG81eTE5S3FKZks2N2hsVkVqZzdSNWNhdllYOWo5NnhMK3lxSW52?=
 =?utf-8?B?VWo3Z2dQZFR5Y050ZEFLdS95NVBMMklEdTA0K3Q4TzNQcmRhdXVwL0NPc1Ew?=
 =?utf-8?B?c3ZSTkt4ZlUwSW5QV3Q4N1o2U3B0TDJzaEFkZklMc3B6eCtMSVpONW9XbzdB?=
 =?utf-8?B?NWlCcG5LdUlJOEttem9FSVpYV05YRzJoQ3I5MEh4azYwR1kwR0h1NnM4eW44?=
 =?utf-8?B?Zm9tTzdLaExkOWl6MHZpZnZzRTJJZ1Y3bzVXOFVzUHJPalVSMWlsblppZ2hz?=
 =?utf-8?B?bnIycVJwVDdTUlBFcnhkelpMa2poc3VyTmdLYlJib0RyY29EcjBSb3Q1NUli?=
 =?utf-8?B?Ry9tbngyWlIzZTRPbW13bGlrdWtralFJdEUzS28vaWRDWDNOR2FvcjlQTUhM?=
 =?utf-8?B?Yi9wTEhYZTliVjI3b3RaZFo4SmdGaWd5UXphSFZpRXlleUJmL1laWjhpV05a?=
 =?utf-8?B?bURyV3RTTmYwaEtaYlM0YzVNc0RkYkQ2ZWlTL3p3TnZNbmg1V3hUVjd5TlB2?=
 =?utf-8?B?Q0VieW50T2VHSzI2VXY0ZC90NWpwWkVaeGVkbVZlOWNsb1h4Y01yU1g4NXh4?=
 =?utf-8?B?aGY3bUpPS3VyOEgyTHRNTU1wRVZhd2hIVW9heXVXcHRZMGhTUDY2aDlxUkpt?=
 =?utf-8?B?VEZURGdiOGZTd0l6Y0pBRTcrTXZOTjFQbHIrb3p5NW5UaWhsSm5POGVDbU9V?=
 =?utf-8?B?QXdPNVM1OWI5MHNnbDkzNFNpMFowNkZUMkw1Q2Urb3pjL25Ibm0yWlloOXAy?=
 =?utf-8?B?bkxhWDFkT2ZlcURMOE00dlNLZTJ1OFBwM2tBdE5neUpsalEwZUxUYmVYeU5V?=
 =?utf-8?B?RmRVenpMMHNxc0htUWUzdXprcUV2d1kzTys2SWVyL2FlQzI4WjlUYnhXbFlQ?=
 =?utf-8?B?OGFiM252YWZSbE5HcjYwdktab3NpaS9OMWhGKzIweG9ybXZqT0pjRGl4cHhs?=
 =?utf-8?B?eFhCVHVSWUVka0xDUWV6RkE2aXNVZEFFdG12d0VheVl6a3NmakNqUndUOCta?=
 =?utf-8?B?WkEyWmJmVy9KVEZQbVFwdGx6Unl3L0hIbzJwaGp3dGFrS3JjMDlkbUpjL0Mv?=
 =?utf-8?B?ZFlleTA1dXNBOXNrRmMvb1FtMWdFbWh0R2gvNEFFdWRHaXBHV21UZTBmeHNZ?=
 =?utf-8?B?TGhlQWpxdkZwNFdxWHl3RWM4bzBCNjZ5Kzd0MzBPblYzcHZPU3dCdi9BZzk4?=
 =?utf-8?B?VVJ0bzhWQy9IREoySHYzd0xyaloyMDl3Vk5ZU2g2Q3hxc1E2OTk0TW4vQk03?=
 =?utf-8?B?UldVVU5EVnFyMk84RGVTSHI5WDBuZmxtVEtKQVRvdElaNkU1RjFyUTJ5eVVC?=
 =?utf-8?B?RFJxb2YrYUFibmlsc0VnTFZYQURKdEliQkJRR0VnVlYrOU8xcDhMRUtUU2Q1?=
 =?utf-8?B?UVI4WDZ0NUcrK1Z2STBNL291TFowSlU4TmxOUDR3YnphTE1KbW5xbUR6WUVk?=
 =?utf-8?B?SmhqcHJPM2FuTVowSll2eFhGVkZUQ2VBS29vcjJUQWxIT1VzZlRPMUxmUWta?=
 =?utf-8?B?WGNpamt6TXE5NDRBSTRqOUxHNXM3RzNqZi9PSjI2Skt5dXJDck1RQStaVXFj?=
 =?utf-8?B?MjZIdDRCUTJlSFEyTS9ETVNqNG1zclpPeE14S3FsNS9JQ0hsWGpQUmNib3RY?=
 =?utf-8?B?ZHduZThCYVRTU25SeU5HWnJZdE5lYVFrTVMzODl3MnJuVytyTmpxenhHZ0Vi?=
 =?utf-8?Q?E/aO4WPb321+3NIYIjhcjAczp?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4cb3cd08-63f8-4337-5dc6-08dbea66b06c
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2023 07:51:37.1914
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1enrOwTpZGP2q3YBfrFgPJXD3yclO4c2TVCFe3lgq+WSGeQxK3QkvzsHzszA0WLPOnD5cgklxodEfoMpmrTClA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7845

On 20.11.2023 23:49, Andrew Cooper wrote:
> It is never written to, but has a string literal assigned, and needs to be
> const to support -Wwrite-strings
> 
> Suggested-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

Yet maybe "written through" rather than "written to" in the description?

Jan


