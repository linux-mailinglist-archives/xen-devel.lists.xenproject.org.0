Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 971AF7FA41C
	for <lists+xen-devel@lfdr.de>; Mon, 27 Nov 2023 16:09:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.642234.1001605 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7dEY-0000mg-Vl; Mon, 27 Nov 2023 15:09:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 642234.1001605; Mon, 27 Nov 2023 15:09:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7dEY-0000jj-St; Mon, 27 Nov 2023 15:09:14 +0000
Received: by outflank-mailman (input) for mailman id 642234;
 Mon, 27 Nov 2023 15:09:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nblC=HI=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1r7dEX-0000jb-1p
 for xen-devel@lists.xenproject.org; Mon, 27 Nov 2023 15:09:13 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2061c.outbound.protection.outlook.com
 [2a01:111:f400:7d00::61c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ebbc80b7-8d36-11ee-98e2-6d05b1d4d9a1;
 Mon, 27 Nov 2023 16:09:12 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AM9PR04MB8955.eurprd04.prod.outlook.com (2603:10a6:20b:40a::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.21; Mon, 27 Nov
 2023 15:09:09 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44%3]) with mapi id 15.20.7046.015; Mon, 27 Nov 2023
 15:09:09 +0000
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
X-Inumbo-ID: ebbc80b7-8d36-11ee-98e2-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U2qobQhoI5Pz5XD8CkBOuzmtid/zbLPXT86ENh5hiX7bQsnr8ZCXjyRH87N7cIi7GSxpkf63xdzapqOlxATJVBZh2qAgqZgHHmbhgP24NuOfwq/T9Gg3lRnyxAruSsT1PO43PlvehQ6UVhqItsI2YySGPqFu/VYlGuuBQWDMCnELI6ko3eu7SfjM2yTYilYvz+p5ma7L4wiLoS2Ghqnfj91I97l/Sz27yJv6Cpdpp4Znv8zGFC/sCaJdMGLKahbHKTaaz+usdhuWdsSgH4/Czyto/R/2QfN4WgOLk2tV4jaQ15AOjsamYpg7eqh2KYlFinHRgREM6TH2iTAAcEYJOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3Xf5m2xX9f8b5p9mAKnkR6dtaoQH3jHgBBjvglAj/C8=;
 b=dNS27vXitN7WZVZT9eo8aXvx8H8TlOVjJ6n55dYNdMpHMHAtYMns6yHkSpBicODwx/Eo0U8RWCGhCnSTh5PTbfEPi5jIUOF03OPGOwBkBBrJSeN6sMdeo1bnvnlI48jGTidVUt8TeCGOQgog7TfH2YeNIcyTZDptwadJQ/5r/R7qZm5ftkYD1M2AqKbCzOLhKs7wnKDCa24p+MScIHcYVN7hCvq3+1ZoNUggcUmWPXWcdm2sZfNCrsjXhCYroUUo5E1jkcOYhK3ylMMLhVrHyGYhfR6yS+va0Bit+nOFcMW+mxMj1avkHEyzw52eyX/vXC4vzV20OB/ey9ZQDwS1iA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3Xf5m2xX9f8b5p9mAKnkR6dtaoQH3jHgBBjvglAj/C8=;
 b=xay2vEBnNn+VwWllsR443EB2yKbCb9JUQN33kXI9ubcechNyzHKjkc4w4vs07qn6f2zBH570qUXbscB9CQV9XEABx8Xl2BYldETM8ZSAWsI35VSYnMdkEaD4MZ22qDJAiKqh803nFD6sNOAzwNS5tR0EAJG/L7d6w3Qt1RmQMYrJocV9HNYaniCmba+Wmc/QNcu6bMp05vGfhbaBLHwMBUFkRgsl1hMlNPstt3U1h5pYhJ89xuyaChTdNgkF3KgM020uDiVVvNRBYtfVDowWO40bHi5r5UCLGGNeBwTc4zi35l+RkhF2RUglmwd0LozyoasJZ8qxzpf0pRnk+EpoYg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <497617b3-6a86-46bf-99ea-2b2f1bdf9d97@suse.com>
Date: Mon, 27 Nov 2023 16:09:07 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v2 2/3] xen/arm: add SAF deviation for debugging and
 logging effects
Content-Language: en-US
To: Simone Ballarin <simone.ballarin@bugseng.com>
Cc: consulting@bugseng.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Dario Faggioli <dfaggioli@suse.com>, xen-devel@lists.xenproject.org
References: <cover.1700844359.git.simone.ballarin@bugseng.com>
 <761ce615438312ca5d37fb8829a0ba903375392f.1700844359.git.simone.ballarin@bugseng.com>
 <ec587cf6-088b-4142-8067-4d9d67fc58c1@suse.com>
 <59744708-c2fb-488c-9e6b-e47faf7a8007@bugseng.com>
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
In-Reply-To: <59744708-c2fb-488c-9e6b-e47faf7a8007@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR5P281CA0031.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f3::7) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AM9PR04MB8955:EE_
X-MS-Office365-Filtering-Correlation-Id: 0c06743a-825a-4d74-9eed-08dbef5ace65
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	9hoSuaQm4JPr1lSAopaVK/vUqhiVUdKgNt/8baHvmsJtG9dmrH4PGKxKklwAM8B5+oyP0U3bjoT4t0pqLah9kGXsNyZOCjY/OLAnlOXmUkFEwpi3h5kQUnrMRK1AtjHBI2Zqh711lRkbtGgsLmllF2WJu/ySwx8LJln0oGcr1sSfVhjyIU9y7eSvyZgaWtsS1XTPJkEcTqTJjIChJaC0pL6aj9s4aJ108tfzg7Mnd9NZCnw5JlCEtrRQ/wDjSyFQt4+yxR02BYQmwKHzl4gFjIbaOoakXF0aAC5pPogGaSSrh3TU5Oy5z0q30wran3yM3mLNBN8wvYX0KY98YTkWGHuffxxIrF3nYAKerVrs68T8gPs9Kk2uQUdHtpYRG3Urq3oCTCJayuxti8A1iuTEHtlVr/2Hz4bvJAm2sYxaCFD3RkV6UE+2MFg1lEmaDSrXfNuDENYxVQfl9t84uS5bwohbTelzxu3puwLRl0zHUgjen8CzVmv1uUS0HkKRnycmvR6Fe5GlC1pfe8k4jEpdNqzjYpUD9TzGTouzfiYeguHQciQ9OsTF2+3rabbuV9zdIO1pwF4Elhiuh6BvVafqjFWpPqfUc9ZCVWHrICqqXWAifW+SdqjbMkyM+JbYZ3pu1vXKQjdGeyNZfXsQVYZrzg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(376002)(136003)(366004)(346002)(39860400002)(230922051799003)(451199024)(64100799003)(1800799012)(186009)(31686004)(26005)(66899024)(6486002)(2616005)(6506007)(53546011)(478600001)(6512007)(38100700002)(86362001)(36756003)(31696002)(5660300002)(41300700001)(7416002)(2906002)(66946007)(83380400001)(66556008)(54906003)(4326008)(316002)(6916009)(66476007)(8936002)(8676002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?clpqbHRlUXJ3a0orSWVtcTFub1JaMmdNYzlEN3BiUkVvRFdJeHFtWFhZbVMv?=
 =?utf-8?B?T0lDUDRBR1pia3dEa09JeDJ6bXBJTU5WVW1YVWpsSDF2em51ODlsNUVsUkNI?=
 =?utf-8?B?T1llaGEwQkRzZzA5STVHTzQrSDd2dVZ4cEd5WTNLMHZUYVFBL3lmc2FxUmpx?=
 =?utf-8?B?cWkrdGZ2eStCTzVDVnVJMkYwdGpTQmZDRGNQblVBTUlycDA4U25jS1I0Nnpp?=
 =?utf-8?B?cXFOZUczNnVxNVRxSStiNVlRVGhLQXZnTGx4RkpMU1RhVlcyYkRJd3AyRWlJ?=
 =?utf-8?B?YXU3WFprcmVsd2ExTVFxeHdaUjd3YTNSQmFkdUxiUFpjQkpsM2ZaTlc2UHo5?=
 =?utf-8?B?QTdwSGVDcmFucG9DRzhiZUR1VnZsNEFsTzRnUmxDQ1QyR1BubnZraEVPYmRF?=
 =?utf-8?B?SXNTUjcyZGNMNWZyUk5vRkRnNWpGdXdRZmNDcG96S3FJcHJmeGU2VlMzSUtP?=
 =?utf-8?B?OTMwM3VSQjNZNFF4L0VEVG4zKzZFYmFDME1aYzIxSXBhY0Y3MkRNTEZXSGdy?=
 =?utf-8?B?YTFNbXYyMXI0NnFDZDVWd09IckJ6SXdjcXRPaWdLY1BhZkxaY2NXRWZhTjZV?=
 =?utf-8?B?TGxFTmFHQXNJSXR5a1hUeEJBRkR3NkRiWUpEeGVyNmdIK2hiQis3UUpmVXZ2?=
 =?utf-8?B?Rk9oNnlGdFRTV0c4MVliWVhtZ3liNHh5SERDaFF4ellpcVc3LzZxOXZlcGtL?=
 =?utf-8?B?aytVa3VsMm9IdGEvd0ZxNXZXck0zVVpSeWMvamVGbWdWS3VPWnNrb0VEeGMy?=
 =?utf-8?B?UndZSWlhaGJNQ3N2YmJyUGtNbXdQS2xDVUltSHVYanFrc2p6RW0zMjNxUjhQ?=
 =?utf-8?B?S2ZyemFWYzd1cUhiWkZXdXJNY2RZRi92bldzS1pFaXhqTFVpcTJaek1xMVA4?=
 =?utf-8?B?NTdwQ2hMMlAweVo2R0hNZytHQm9DT3hPeUhQZXlUTVlxTVVoTTZmUXJQWEdS?=
 =?utf-8?B?RlhaM3ZUVWR1MkFONnRRQTJhVHByMVJQZjdTUGszRTcxSEs3dW5YMjRXWHNh?=
 =?utf-8?B?SkVVeDQ4QUJyT1BuRkVMUXlzditsazdWa2hWUEh4QWpYSDVhTlpRODhvNTZV?=
 =?utf-8?B?RVhsK3czMzJGdmJ6RDd6VU5pV1RzMTljRjVEbUpLZUdycUU0ZStRekxselM3?=
 =?utf-8?B?VkRXQS9CbnJTNEdCQTc3YmpIY2NhdWVtbDY4ejl6Mk1yRVNMSTlhS0R3dkgv?=
 =?utf-8?B?K1h3UmNtcWNsTUVvVU5SV1l3MEJ6YmtNbWhhUEM4bVgwRGhuQStOSHdrTzM0?=
 =?utf-8?B?b1NwWnJ5T01iUjVoWGRLSnhmVHg1VHZLM2JXalVWdHdtTVI2M1NDWGZYZWdB?=
 =?utf-8?B?dkMwTFJOOG8xUEpEd0RjV3M0Umh4bzljNU1aMEpIRmxVWXpRUmpKTVZPNlNC?=
 =?utf-8?B?U0x4cnVibGo0SncybkZRWEdiNVhXSWdiVnZwY1YreDlLVjhsSFBiMzc5Vngv?=
 =?utf-8?B?YnBxTldrZnJPZzZSRXZpaDYwRGs1b05HZW9KbWFyTkZvcG90WmNjY3ViZlNm?=
 =?utf-8?B?TnplaHZoRjNoU1k3cDlBQ0VKS21zcjR0SW9hRy9tWnBsOEhVZG9YUVpLZWdk?=
 =?utf-8?B?WG1MRlhHOGNBYzFSUjUyaFNHaGtoYjlNc2hGTHFycUd4MFFqNnA3Nms4Vmp4?=
 =?utf-8?B?TXZwMTR6Q21EcHp2TTQwVmVnYjNzSFBFaUJTQU4yZ2poaWhiTCtDc0lUdU94?=
 =?utf-8?B?VjZOK0lMeVVNYW5pM3M4ZEU3VjU4YVlkcmdUN2ZodXNZanhlazhJRmNqT1Rm?=
 =?utf-8?B?c01TbE04Y1V5eStXUTZvQ1Q5V0E5N2IyZlhUbmN1STM0Zmc0dzF1SHdhRzJH?=
 =?utf-8?B?TEl5VzczZWdLajVQMWZQS1k5RGkvdzc2STN2UnBHZFV2cHllOWZYN080Uk5t?=
 =?utf-8?B?VHAzb254N05zVTNxNUQvZlZ3Z25NVUUyb00wSVdZT3ZXL1BtQ3NaK1VLRG80?=
 =?utf-8?B?L1d0aE9SQU13YmFWWDRyZXFPd2lVOEtHc3ZVNktGTzdMc2gyL1cvUjdIdnAz?=
 =?utf-8?B?N1dONGEvY1ovTEdEaXlzRjlycDdBWUVaN1FQRysyQk9qZTE0TkN0Rm1RZS80?=
 =?utf-8?B?R0ROdC92WUQ3c2cva01pYlcwdlNxZzZqMEJhY0RUUHFHWER2dnlFc3dNWjl5?=
 =?utf-8?Q?hypCygAziC8r01HHZcBgn3+FC?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c06743a-825a-4d74-9eed-08dbef5ace65
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2023 15:09:09.3179
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OMA1Pf1Glv1I7Myk2NFAwpXhjRx7Mp/2S6HqAYMCkpDcIrL4ZcMNUV3pN8dCqkvdaqQY5wZlaFxFbGU93F+1aQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8955

On 27.11.2023 15:35, Simone Ballarin wrote:
> On 27/11/23 11:46, Jan Beulich wrote:
>> On 24.11.2023 18:29, Simone Ballarin wrote:
>>> --- a/docs/misra/safe.json
>>> +++ b/docs/misra/safe.json
>>> @@ -28,6 +28,22 @@
>>>           },
>>>           {
>>>               "id": "SAF-3-safe",
>>> +            "analyser": {
>>> +                "eclair": "MC3R1.R13.1"
>>> +            },
>>> +            "name": "MC3R1.R13.1: effects for debugging and logging",
>>> +            "text": "Effects for debugging and loggings reasons that crash execution or produce logs are allowed in initializer lists. The evaluation order in abnormal conditions is not relevant."
>>> +        },
>>
>> I'm wary of this statement. Order may not matter much anymore _after_ an
>> abnormal condition was encountered, but in the course of determining whether
>> an abnormal condition might have been reached it may very well still matter.
> 
> Do you object to the deviation in general? Or just to the wording?

Primarily the wording. Yet the need to adjust the wording also hints at there
needing to be care when actually making use of this deviation. Which it turn
I'm not convinced is in the spirit of Misra.

>>> --- a/xen/arch/arm/device.c
>>> +++ b/xen/arch/arm/device.c
>>> @@ -331,6 +331,7 @@ int handle_device(struct domain *d, struct dt_device_node *dev, p2m_type_t p2mt,
>>>           .p2mt = p2mt,
>>>           .skip_mapping = !own_device ||
>>>                           (is_pci_passthrough_enabled() &&
>>> +                        /* SAF-3-safe effects for debugging/logging reasons are safe */
>>>                           (device_get_class(dev) == DEVICE_PCI_HOSTBRIDGE)),
>>
>> What's the debugging / logging reason on the commented line?
> 
> The "ASSERT(dev != NULL)" in its body.

"it" == device_get_class() I assume? Imo to unobvious to deal with like this.

>>> --- a/xen/arch/arm/guestcopy.c
>>> +++ b/xen/arch/arm/guestcopy.c
>>> @@ -110,18 +110,21 @@ static unsigned long copy_guest(void *buf, uint64_t addr, unsigned int len,
>>>   unsigned long raw_copy_to_guest(void *to, const void *from, unsigned int len)
>>>   {
>>>       return copy_guest((void *)from, (vaddr_t)to, len,
>>> +                      /* SAF-4-safe No persistent side effects */
>>>                         GVA_INFO(current), COPY_to_guest | COPY_linear);
>>>   }
>>>   
>>>   unsigned long raw_copy_to_guest_flush_dcache(void *to, const void *from,
>>>                                                unsigned int len)
>>>   {
>>> +    /* SAF-4-safe No persistent side effects */
>>>       return copy_guest((void *)from, (vaddr_t)to, len, GVA_INFO(current),
>>>                         COPY_to_guest | COPY_flush_dcache | COPY_linear);
>>>   }
>>>   
>>>   unsigned long raw_clear_guest(void *to, unsigned int len)
>>>   {
>>> +    /* SAF-4-safe No persistent side effects */
>>>       return copy_guest(NULL, (vaddr_t)to, len, GVA_INFO(current),
>>>                         COPY_to_guest | COPY_linear);
>>>   }
>>> @@ -129,6 +132,7 @@ unsigned long raw_clear_guest(void *to, unsigned int len)
>>>   unsigned long raw_copy_from_guest(void *to, const void __user *from,
>>>                                     unsigned int len)
>>>   {
>>> +    /* SAF-4-safe No persistent side effects */
>>>       return copy_guest(to, (vaddr_t)from, len, GVA_INFO(current),
>>>                         COPY_from_guest | COPY_linear);
>>>   }
>>
>> I can only guess that in all four of these it's the use of "current" which
>> requires the comment. Yet imo that either needs making explicit, or such a
>> comment shouldn't go on use sites of "current", but on its definition site.
>>
> 
> "current" does not contain any violation of R13.1. Its expansion
> produces a side-effect, but this is not a problem in itself. The real
> problem is that GVA_INFO expands it in an initializer list:
> #define GVA_INFO(vcpu) ((copy_info_t) { .gva = { vcpu } })

But an initializer list doesn't itself constitute a side effect, does it?

> GVA_INFO(current) is the real piece of code that requires to be
> deviated.

In which case I think this such want spelling

    return copy_guest(to, (vaddr_t)from, len,
                      /* SAF-4-safe No persistent side effects */
                      GVA_INFO(current),
                      COPY_from_guest | COPY_linear);

or some such. Not the least because we want to make sure a deviation does
not have wider than necessary scope (which when formatted as above is,
aiui, always the following source line).

Jan

