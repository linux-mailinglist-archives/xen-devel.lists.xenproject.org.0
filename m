Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B706E802D18
	for <lists+xen-devel@lfdr.de>; Mon,  4 Dec 2023 09:25:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.646582.1008976 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rA4GA-0002Vb-4o; Mon, 04 Dec 2023 08:24:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 646582.1008976; Mon, 04 Dec 2023 08:24:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rA4GA-0002SH-1u; Mon, 04 Dec 2023 08:24:58 +0000
Received: by outflank-mailman (input) for mailman id 646582;
 Mon, 04 Dec 2023 08:24:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=CG6/=HP=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1rA4G8-0002SB-8w
 for xen-devel@lists.xenproject.org; Mon, 04 Dec 2023 08:24:56 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20601.outbound.protection.outlook.com
 [2a01:111:f403:2612::601])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 99df2d85-927e-11ee-9b0f-b553b5be7939;
 Mon, 04 Dec 2023 09:24:54 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AM9PR04MB8523.eurprd04.prod.outlook.com (2603:10a6:20b:432::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.22; Mon, 4 Dec
 2023 08:24:52 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44%3]) with mapi id 15.20.7068.022; Mon, 4 Dec 2023
 08:24:51 +0000
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
X-Inumbo-ID: 99df2d85-927e-11ee-9b0f-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IqmSm1GfFS5lXZ4mtu5f3ICO5hU1lFpXvuNln81vjetHQGFdVmXNi9GXC4/r81WpQsWaJBecEW0zGYGgK/h+YdKCacmzpcuJVboLsI9Fgv+Pk2DyopnnyoogyQwguhO773ACUlDmxZJ8mBPeg/q4eqNIiqo+MKmfx3gKD9uTuBzHYsGR897l0hnc/mTQOfNKKsheILVptXWi87sxZNRHJHxQsHZ1lzu6noaVi2aAc2Uv4RTjLmvrnNSVALeB1IuZavfGGHsAxPijUf7m+L9v6pV4/wP2B2X21L/ntUckiyVt9rvc1HgmrrR00SThQcYLc6XlCegk6p3e0MhxG9R5yA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AFaj2/jWpQu46xXVWjD3VVpqSR0iQCgRj5RTySehScc=;
 b=AhpOwNTKzDAdu0xzXBwxc0YUFuGrWojsUzirGRAHrXKXkV7svGXiTughOflMgsUuTUGWqkmXNqi9gJVDC8hpYfE8RKyJzlvdi9d+Oh/DrUb6t41SxIWkrDxxJo1DQcHFGz980S7642ZMDO0X9Wy8J9NUAPyMVzvqmfIvGr5hg352CWYNK9E3JladE3wDnjV6+NibfAAmUf22li7D+2tv9DbICDaF8FWzNVZ1rfb2hfcRvtNkYQ7v3w2Mpnf/7gnJdwbXlP/0/czRur7evROhOSbbmhgPrSwi5tEsDlAsi4B8DJFFI7Y1MuFL9CvnjqUnCG6faWDBPF2TpygDZTocpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AFaj2/jWpQu46xXVWjD3VVpqSR0iQCgRj5RTySehScc=;
 b=eGhR55HlJ+N4N4xgGiUmoPogBcH784R74HREY7f6p5aD+vU0spGxvJrzg+/2HbvKHX2cV06a7m2WCouooZ49qUm3PRwVQq3UzIWTot1nbRJ2d5ZJ2O9Qo1ptA/EgVXewbd+kC+ahII8tjlQihjsiyp4TaoWwfyOkXrvysbIAmsFS2rgDg3iTwJp8PgQ4FqRPUx+8/6uucw2K7qk/lAKa+MgA7v/PU40tx5HE+5zShAiaZYJWs1KG/nWFOXPb46mFiKsOavatnVKi7RqTXVdqUPwIYPCSNzlD3Zg+dA3BNzHE4fXwwXuwqg9S29VL2X5L2aS9bquUqdMmvfX3FESjTQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <fcad8f45-a8a3-42c2-9f69-17a0d8a9be2d@suse.com>
Date: Mon, 4 Dec 2023 09:24:53 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 4/5] [FUTURE] xen/arm: enable vPCI for domUs
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Stewart Hildebrand <stewart.hildebrand@amd.com>,
 xen-devel@lists.xenproject.org, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 Paul Durrant <paul@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
References: <20231113222118.825758-1-stewart.hildebrand@amd.com>
 <20231113222118.825758-5-stewart.hildebrand@amd.com>
 <ZWmkh0Xeaynh43N7@macbook>
 <alpine.DEB.2.22.394.2312011847520.110490@ubuntu-linux-20-04-desktop>
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
In-Reply-To: <alpine.DEB.2.22.394.2312011847520.110490@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0031.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:14::18) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AM9PR04MB8523:EE_
X-MS-Office365-Filtering-Correlation-Id: 2cdd79d7-20ef-4d43-1c26-08dbf4a27c8f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	d3DEYw+rEmwmvSegJBOYbHkCmPC7mOBLjjRg4pHT4CKyZfGxWCTOUbrdNQXRtcTtiOD3XHYNnw6e+oyEHYzyDPEPnW9fl0sa/tGbbWfSYJyk5KFSDux7Au+cikwUDw+8Py1AG/vxWvSangYFTAh+k/4bP+eUHMdrd2Nf09hs9AsXLNiR8GVH17HHqoyTZRglm/LHE9aaBKnGxtTMh0eDJ1JxnlNJ2R5Nad8WwQ9u7gi/0wKsoo2XF6koj4Ie9uJgxrfM0tqBGwOlM0PsiszCvM/Sua3KJbjdVgnEpEPesJFh4f1onH88RYHlVswrpQT5yehLd8kK73BH6sdSm61NFU4q7X2yyWgdgZeFBeqdAuMe1pVSditsNaYY5AJhyAIGq2cELRDJbPEEgq4nNNUb/e+MXauru1Wxn+UXW2xFAqwCktonFSLkTcG2KoCKGbgCFyGobLTVTOg06ymorOM2yzxUVMlLeds9yNgayNEf7KV2fmV0QQkAH/08FgyM8l+zN7DhuyL/wywltOdQouXryTbW4OzYWwd4L5y/AwOZ5jEjIm+oz+m2sFHBpQ/OBMX4tHYV7XGXjBwP3Xw3XVbusv5W0V5OYTfW8TdARu+wGOtBGjLjEjW8Waw25DrduV/rfHABWk0s4J+vCX4uaKIGCAz/ah1tK1b6rV3V2nhjsDYX/2wRcMZ3emXs8slib+oS
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(136003)(396003)(376002)(366004)(346002)(230922051799003)(230273577357003)(230173577357003)(186009)(64100799003)(451199024)(1800799012)(31696002)(5660300002)(7416002)(86362001)(4326008)(8676002)(8936002)(2906002)(41300700001)(36756003)(2616005)(6512007)(6506007)(53546011)(83380400001)(6486002)(478600001)(26005)(38100700002)(31686004)(316002)(54906003)(6916009)(66476007)(66556008)(66946007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?K1UrbEZQcHVJZGtqbkFYRmltMnIzL096a05keHYrQXgzUEFBaVdvdTZ6ZFBC?=
 =?utf-8?B?aFcvOXdqc3ZxV1JzK25uUDNHNE0xQTQ5OWx6NlNxZDAvWHdBMHhuS21LSElX?=
 =?utf-8?B?VVg4TjhFRzJ6UWNqcWMrZGdEYnBZNDRRWmF1N1BwYUppYUp4TUR3dEVWQjBa?=
 =?utf-8?B?TEdNeUl5clRtZzkwRjFEa3ZkRHBpT3NBaTVtYWtDMFlpVjZDNnRSaStZSTNC?=
 =?utf-8?B?SmRpU1BhV3FWQ2IySjZRdng4OEpSYTRnK01Yb0ZPUFpza0VJc1kvY0piS3RY?=
 =?utf-8?B?aFVqV3g4UFpsUzVnQjhZMTNWRHNadzFzbmZmdTk2azZ3elBDTWhOZ0JaOTJp?=
 =?utf-8?B?TkZ6RjNMWFhWMjg2b2FoanozZTVnYWFHaW5temkzd0kxTGZpYXBaSGIvVGVN?=
 =?utf-8?B?MjNhbW1lZzFOdU5icHVSTFJ3NUJwRmNIaXk0K0MyWHpKbnU0L29yY3JkZ1NH?=
 =?utf-8?B?YWlncnpCeENPc2lnQm9qTkpvc2tzTlpLKzZlZlJqL29tWWx2Y1MwRFVDbUJy?=
 =?utf-8?B?OGpOVFdra0pNcXJRaW02YmJsdFJ6am1SWTNabHJvV2VDZ2tESjc1TTMvL1Fl?=
 =?utf-8?B?ZnNGVEFUYm5zOWJvNHdFNkplS0tvbkpHcGRrRkJzYUhWYkd1dzJrWVhWTnRX?=
 =?utf-8?B?VEI1RWNRZW9BMVdRVktxUjBqd0txMUk2Z3ZhaW5YeXZvZk1UUGJ6djNMdHZS?=
 =?utf-8?B?WmFIUlRVTFJtaHhzN2FYMCtEVFJ3OTVYaEUwckRMbmhJa2N3QUlhVGsyRU84?=
 =?utf-8?B?ZGdSSWEvalMzWlVKeHpTb1FsTWpYNEhlWnZKREJYbnFhRzIxUEtZNHFFTUJS?=
 =?utf-8?B?aHhBeVdPOElFRkRQTjBnSUJuY0xETm1JVWZ1WW4vL2FaVElNVGYxK2ZBQVpK?=
 =?utf-8?B?YzZHdkhrZjhrR3N2bjdNaEhUNDZGV0xZQ1lLU3p1VndydVhIUllqa0FFNjQ3?=
 =?utf-8?B?enYwOTZkQVRVWXh1aytqeGNzRG9SVDQvRHNiUWc0Y0kyM1B4VVdwUXpIZ2Vo?=
 =?utf-8?B?ek1LVlNmTkRjcUErc0MvKzBYTWFlR3NMdUxkRmR5YzBBL2tYb2swcldYZDdJ?=
 =?utf-8?B?Qjk5d3ZpdGNZVWl6c285RVZ4TlVIb21oQU4wRTBoZ2pJWGs1dmVNa1hzelpj?=
 =?utf-8?B?cHNzODVtZ1Q5bS9Pb1BhTkx4R2l6anZLVHlVMWZUa1VQL0pHSGc2WDZYKzRU?=
 =?utf-8?B?ZmJHVzdQOU16S1pKallNWGNDUVp2aFRsNmhrUys2Rnk0c3kwWi9vR0x1THho?=
 =?utf-8?B?b3VuVjBnQXduY3VVM3AzbkNxSURVWk5JNGdGUi9EcWRIN3k1MHg4M1FMaFg3?=
 =?utf-8?B?aFNuRkNSNVZyWUNLUnpSRWtSbTgxSFozdjNRNFM0L1Y2RHFsY0xvVVpSemlP?=
 =?utf-8?B?d0dGUTNBOEJHWE9Qa3l3R0ZuSHpTSkdFQWZMeXZ2d1Znb0dIWTNCVGpiQThn?=
 =?utf-8?B?U21IU0Vvc3J3a3dvTUxCWEZkUDZjOXE4cnhBcnA3ZytGbVJmb2tXU3ZESW9U?=
 =?utf-8?B?Z2g4cUllbHl2NzQxY0hDNFJTV0FrcFg5Z0ovWlBrdHEvdm1TVGZ0MnNsZ3d3?=
 =?utf-8?B?b3ZSTTFSM3YzWDNLK3hQNi9qOWh6YVhRUUxzVnNnU2ZhSC9YanFtb21jZVI4?=
 =?utf-8?B?aFV2b1Z2cG04bldaM0RvSVlUV2llN1dLbDh5eFhuMUxIeUFzSFhjV1BTaEkx?=
 =?utf-8?B?Q3BadFpMcHl2Y01HdUJrQmdzQWEyVmdzRjd6Y0hIU2lmNXNWckZtZURTVG9m?=
 =?utf-8?B?c2k0QmZ0ZC9kcFdBZGhQaTlMdjZoQWw0OVR5TkQyb2NFWkU0SWlkUFlTY1Ay?=
 =?utf-8?B?NUtCeUppd1RqNE1GbHJWbCtJclgwRllISGd0bDlyR2oyckJLM0VLWXQwSUlo?=
 =?utf-8?B?eEIyVkI2YTZuYmx0TGovSlR4SFB4QlJVa29OQXN5b0swT1hCdGVxVzgvMjhh?=
 =?utf-8?B?cnpNTkZqd09VUW1uNWc4ZysycEZLMzl4ZDQ3VGx6b0R4MUdqUmp6ZFpBQUQr?=
 =?utf-8?B?dnl6ODMra0lENGVXR2MwM094Skh4S1l6cWtHUHpIT3hxcVFPNWQ0OVhIUnla?=
 =?utf-8?B?Ni9MQXNjdTFiY3RnVkpXaHZra0tydFlGUTA5RWQ3NGRzeTVHYysvU2YrZFBv?=
 =?utf-8?Q?oo4jMYJpYElMHfxuClk4h2Jai?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2cdd79d7-20ef-4d43-1c26-08dbf4a27c8f
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2023 08:24:51.7000
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BA9SdXVT6AsJKmSLc0ZuaIb0p+to0UfBkw4hRn/dddLIB4SDheZBUPnrpI4nQ1/xBTITmbOhK3D7NumcCFsBfg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8523

On 02.12.2023 03:56, Stefano Stabellini wrote:
> On Fri, 1 Dec 2023, Roger Pau Monné wrote:
>> On Mon, Nov 13, 2023 at 05:21:13PM -0500, Stewart Hildebrand wrote:
>>> @@ -1618,6 +1630,14 @@ int iommu_do_pci_domctl(
>>>          bus = PCI_BUS(machine_sbdf);
>>>          devfn = PCI_DEVFN(machine_sbdf);
>>>  
>>> +        if ( needs_vpci(d) && !has_vpci(d) )
>>> +        {
>>> +            printk(XENLOG_G_WARNING "Cannot assign %pp to %pd: vPCI support not enabled\n",
>>> +                   &PCI_SBDF(seg, bus, devfn), d);
>>> +            ret = -EPERM;
>>> +            break;
>>
>> I think this is likely too restrictive going forward.  The current
>> approach is indeed to enable vPCI on a per-domain basis because that's
>> how PVH dom0 uses it, due to being unable to use ioreq servers.
>>
>> If we start to expose vPCI suport to guests the interface should be on
>> a per-device basis, so that vPCI could be enabled for some devices,
>> while others could still be handled by ioreq servers.
>>
>> We might want to add a new flag to xen_domctl_assign_device (used by
>> XEN_DOMCTL_assign_device) in order to signal whether the device will
>> use vPCI.
> 
> Actually I don't think this is a good idea. I am all for flexibility but
> supporting multiple different configurations comes at an extra cost for
> both maintainers and contributors. I think we should try to reduce the
> amount of configurations we support rather than increasing them
> (especially on x86 where we have PV, PVH, HVM).
> 
> I don't think we should enable IOREQ servers to handle PCI passthrough
> for PVH guests and/or guests with vPCI. If the domain has vPCI, PCI
> Passthrough can be handled by vPCI just fine. I think this should be a
> good anti-feature to have (a goal to explicitly not add this feature) to
> reduce complexity. Unless you see a specific usecase to add support for
> it?

I could see very special devices to want accompanying by a special ioreq
server. I could also see tandem pass-through/emulated device pairs to
potentially be of use and require coordination in the same ioreq server.

That said, I wouldn't insist on allowing a mix of vPCI and ioreq servers
to be used until an actual use case (with code supporting it) actually
appears.

Jan

