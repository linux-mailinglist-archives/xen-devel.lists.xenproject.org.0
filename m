Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 187907F6EBD
	for <lists+xen-devel@lfdr.de>; Fri, 24 Nov 2023 09:46:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.640266.998275 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6Rp0-0004j8-Ps; Fri, 24 Nov 2023 08:45:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 640266.998275; Fri, 24 Nov 2023 08:45:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6Rp0-0004hF-Mx; Fri, 24 Nov 2023 08:45:58 +0000
Received: by outflank-mailman (input) for mailman id 640266;
 Fri, 24 Nov 2023 08:45:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Ulgz=HF=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1r6Rmh-0001P4-4t
 for xen-devel@lists.xenproject.org; Fri, 24 Nov 2023 08:43:35 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2061e.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::61e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8cdd901b-8aa5-11ee-9b0e-b553b5be7939;
 Fri, 24 Nov 2023 09:43:33 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PA4PR04MB9438.eurprd04.prod.outlook.com (2603:10a6:102:2aa::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.18; Fri, 24 Nov
 2023 08:43:32 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44%3]) with mapi id 15.20.7046.012; Fri, 24 Nov 2023
 08:43:32 +0000
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
X-Inumbo-ID: 8cdd901b-8aa5-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Yb5MX3H/CR3nJGPjJyCJ+gTwsNfIMuKwh9tGGlsIpVPh7yLMyykgB6uGjmwAdhPGdOJrZjQXN2kzYNVOS0W5GHepG2t8GMRag4s1T+O6Sl2AwnL6VYx4cQiqGXlrwbmBUlZm5MpniN/jNH/BCfjdbGWDoLjlcvamQLfIaigd1c5eMPEcgOsi9x5RSq15UBzYdi/4p2fIXXp2DERRTK+4udoeA3omZjzXyaQ08NbqAR0gYaM/NgVXw2fQ5dug/bWwmbw0lE2GUHFJIy7COqS5TkVoF6S4t/RZI5B/GrKezppbr69YJ8BKE2MvYbBpWjxuwN1dRSfWlbT5FM3cgMTXyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Szpwc2wO4UnJhZHXRLFJK3uPqEZ4uan9C+psmzvZ6/w=;
 b=aLFLQ1Q+5ZoBp366aP9HN81bksYgXuaKraGdIMR8hWFta1HtLvM0lmiT6e6lcw+sClIOdFuB50IKrg+ccD0BHjGu1MVLG/vyd7EFsoguKLilg85W7xxYHErxhNonl79blI3nqM8XTL/5XF4zkAv7mo3u50gXh7id/FTipnoAXFLuIE2vRbc/X/shSa/LCxoZ6stmoF4vx8wH8kFD/AOVLwPChF+R5+SatBnTFyKQ6xzRZnsyoQf4OXj7rDhuFyGy13QlZG6wOoD34un0/GK3Alc5Qs0NLImhOf+9f4fEzHMur51NhdwPQs/ckolJLrex9Mt8EavjbCcb814JA0EN7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Szpwc2wO4UnJhZHXRLFJK3uPqEZ4uan9C+psmzvZ6/w=;
 b=iliFBDPLsIB147Mmjdq9xtvFf9wUy6Po68kCXob7APjDaDXgXHk7IVXgtDRcEQ+OIXkKMXBL52vByyiHsf0ktzcTApgQIE5IIrE5OuJ+qx2fmU2shlZMVVXNnfeRRBVb/edm6rYmWCBZA5KbYvy20fu/T3EXLm25icPD/Jc4iUheBWWSx4xD9KImFrMQEyoz9jA+XiGINTZZHeLpefvvGzkA4BiG0cGNnb0T3aq8G2HQLWRsdALHwAnzo070mYjbzpDZVZsJBs+xhthDEEPr3awI8506sfgqTk2Y6F6aj5XzUh9GDspn0yxY4guqlRn4Gn+AZ3OgR4R1Qdu1j4FDDw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <b2accc3a-9b54-45b4-8cec-29cad9c2d638@suse.com>
Date: Fri, 24 Nov 2023 09:43:31 +0100
User-Agent: Mozilla Thunderbird
Subject: [PATCH v2 14/15] VMX: convert vmx_vmfunc
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
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0408.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:d0::6) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PA4PR04MB9438:EE_
X-MS-Office365-Filtering-Correlation-Id: d836cb5e-49c1-41c2-62e2-08dbecc97052
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	OXENjelHW7Sm+60ukAF35A3fHHbsR58KPEt8iFqOyplehV4ZgnOqaUjwRS0JVq63oQ6AC1Eu/CjlfHzHvCoHet7jDtIsU0QaHSJy5LjcyVBNCmi5gTPRYGV9OyB2CsRwLinBnXIoJ7ziS991F/s8cDePsHUJ8Rny3C9GFPADCxFunjnkbiZYpTDSza5Y2G6igEINa+9xtsLk4vObTdR93v1jHj/wqfrUC3WLzXjpqEINnhGLRH4zGT6HNCBmaZIMGOnKVIB+QWhE1+RJdZOLjYODY1vlZ+PB3frKAd4+ziJdGRuTJLqDRTAPPjXuK6RcCAnizdwYHYWXUFb/QVYGET0Wej+B1ctmJA1qJ0PiIos54sB0WjQvoSnvc/Bug23JN6EPjDS0nhubvO+dRndcTa6Vjf7OyyLAH9J1OxpV4gnuBz0QaxbQegrHV15ltq78aDHfPMN9TP3hbKP/xv48CJAcs3aiWQSd33UOA7BNV7kPqFp6PwNwEWKButkcb4PI5OhEsCwmLJ3u8Lh/AbRCDQbgIh4COo46xAzQpJmRYypI1ES+BgkXHOcZ/g/yUYEFkcYmRydvNqh3LJX+xRz9Pz5RSZGJdOumEbme62ie+enKWGYNJMx4cXG0j5iPhjUGlJHcNcl7ck+7TlK/z3MgMw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(346002)(136003)(366004)(396003)(376002)(230922051799003)(64100799003)(186009)(451199024)(1800799012)(36756003)(2616005)(6512007)(8936002)(5660300002)(4326008)(8676002)(26005)(6506007)(66476007)(54906003)(66556008)(66946007)(316002)(6486002)(2906002)(6916009)(478600001)(31686004)(86362001)(31696002)(41300700001)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZlFCVW1xRmF0VTRIcjhobVlaOFBzekZnUmsxOFk4MmcwM2prNjNKN2tLaWxF?=
 =?utf-8?B?YW91UnA5czRGQi9TT095MGpIU3RCSXM4RjNtOSswZ0VRcHNNa3NZNWZwUCtx?=
 =?utf-8?B?ZFFOcWJwTHB3NlFoUzY2UGpneTI1S2VmbFBWNmpJd3FJVHYxaGdNWnpRODVq?=
 =?utf-8?B?U2U2MWMyN25JL1BaNm1JUEl2ZE11Zkd6MVFSZ3FxQTYrQXJCbWZ3RVpOSHNH?=
 =?utf-8?B?Y00xT2dBamtWd1kxNGNSZUtIQ3p5WXJkOE80YzVHcE9UK0tjQjRFWmlhWmYw?=
 =?utf-8?B?U0xDSW1mSDNlWUpnQ0YwaktuOEdJK3gzQ2dlQ0pOblArNnJsd3FWTkgvT2xy?=
 =?utf-8?B?MG4vMmdpdjhQb0xCaVgvQ0xhdUpXMk1aNE8xS0RlYTI5SlR4VlZWUTB6VXBp?=
 =?utf-8?B?dTdYY2R5SDBiK3o0SHRXL3hGTlQ4eXJsVTJwZFBtaERTdk15Sm9ySVFnWWhZ?=
 =?utf-8?B?d3dTdWJSVnQzakRlenpEN2RhSEJzZ2RnUlVndXFiTjlyZVVDWi9xNTVHTjNW?=
 =?utf-8?B?Rm5XNjNxVXVXUmZlZmNRTFNlSHdpQnFRb2tROUphenlwMkVJTWpLM3NzMDFZ?=
 =?utf-8?B?Rk9EeU9SbnZkTG1LZHZub0ZrSmNaMitvY3NweEp3c3JMWUYxckNFdW5PSVhW?=
 =?utf-8?B?WTYxeCtwQ1E3NFA0Y1RXWVJ6ek40UW04NGRsZjRXRmpiOURjcTR6RDloYVdw?=
 =?utf-8?B?Zzh3OUZKNVVMNGpLczFCVGtJM2lKSnhyL09TS3VHZVY0L1VjeWROWG1tUUFp?=
 =?utf-8?B?ZzBPZnluUWhMVU1jZEdhWGVJNEhIN29BK2tiM2dLbXF1bFFvSTl0bnBEOWdp?=
 =?utf-8?B?cTc2dmtFL0hsZSt4c0tQT0VjTUlaUmVwMGkvK2VrNU5NSXA0aDN0a1ljZG9T?=
 =?utf-8?B?dkowdGRJbTlSOWxGMG85anVGQms5eGx6MG1JUVZiYnZ6M0dmQS9ZZjBlYWxo?=
 =?utf-8?B?bHFscUs3UGNDS0NvK0ZiZzlUNi9rNDRlWTNVSWhGN1ZvcXdEb21hbFhwUmV4?=
 =?utf-8?B?dW1tV1U0QUQ5VjhVZWxsMzNLSE94T0ZmNHFtaE5Ybyt4V2NKUG0yVEc4TFVs?=
 =?utf-8?B?SUNsa0NiSjkwL0FLMThDckwvN1h3WXF2VlczZnl0T3A1RCtLNTZ5TVY1RDFE?=
 =?utf-8?B?VU5FRUZ3U1NiNnNMZVM0b3A1dTVvVksvdHlXU1pxQnMvOGFBOGFjSDdzWWJK?=
 =?utf-8?B?R1UwUDNhU3Nqa2sxQ2F1azN1NktYZ1c4L2xYT242NjduUEF3OEorbkViQzhi?=
 =?utf-8?B?V09ZODEwZkt3aGtNNVdVbm9yeU5JSFdOaU5zek1JbTBIZUVMK1pKU3BjSjBT?=
 =?utf-8?B?enFwOUEvd1ZaT0NnTXBNNHlXdTlvWmdVOTNmRmNDOUVMZ296M05jSUhBK0FC?=
 =?utf-8?B?M2RPUCs5bjEvRGl4UmZieXN0QVg5S21ST2RrbkR6bDBNU01jV1ZNc0diOU15?=
 =?utf-8?B?YTRPQW9KRzJnWmtIcUFpdTVjUlZFWmNBYlI0Qm1ZNUhPOFVBNlFSdVpacHVD?=
 =?utf-8?B?czZQOTRodW1TV3hjNUhsWGg0MFV6bjFINExnTzBSc2RpaEg1bDU2UHJDVVZU?=
 =?utf-8?B?bFNXNks2SmFlZHplVTNiVlpFMXpKQXRkY25IRTZhYTgyblFuYysrdm5IL0hj?=
 =?utf-8?B?ZXhtcmdRcW9TUFpMcUNyMllTRVBoY0NEOFpIcjBWZmNUVzg0SWhGM0lGb0xU?=
 =?utf-8?B?Ui96Wk1KaHA2Z212T3BvdVY2c2pHTHNPdkoxNmdjam5sQ1NGOENWSjVjV0Nk?=
 =?utf-8?B?R1NtWVRSOUUwOEQxdGxhbHBKRVVjbU1yZUFZOURJWCtUSXdOZ1hUcEJHVGdH?=
 =?utf-8?B?cTVUV1B4azdNT2UyWFgzMWJLbHZVYlFXZFc3M2FpN3pYZWRVRS9JeC9RczAy?=
 =?utf-8?B?M1JDZkpQb2R1Z2FFS2FYaFk1ZGxudmNET09sdmtXQnpTU1dRTS8xc3JhMUVm?=
 =?utf-8?B?RGlJQlk0cEx1TlNpUThVVCtNWm5zTFl3MUpVS1dHQzg4Y3V0YjQ2OUhFYVM0?=
 =?utf-8?B?YkplSnZidWZTbVNnN2F2eFhmSzdrcTVPK3ZSckdvekIrMVNkcXJhajU1b200?=
 =?utf-8?B?eENMaXBiWG5QNk5kd0Ezb01uR2t1dUwrYnFmZnpMeG1PZXYvQW9CUmxWU3hW?=
 =?utf-8?Q?PefCrxZqKIyZCpRsfEWK6QPCT?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d836cb5e-49c1-41c2-62e2-08dbecc97052
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2023 08:43:32.1555
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bIAy8xEwfSnkJR2cfWGOONq89L0VuWDPeVEUivjegATm54Gkv/s9sndbVTr/9z9eck8tsdaUX9LfITpamuXg1g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9438

... to a field in the capability/controls struct.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v2: New.

--- a/xen/arch/x86/hvm/vmx/vmcs.c
+++ b/xen/arch/x86/hvm/vmx/vmcs.c
@@ -162,7 +162,6 @@ static int cf_check parse_ept_param_runt
 
 /* Dynamic (run-time adjusted) execution control flags. */
 struct vmx_caps __ro_after_init vmx_caps;
-static uint64_t __read_mostly vmx_vmfunc;
 
 static DEFINE_PER_CPU_READ_MOSTLY(paddr_t, vmxon_region);
 static DEFINE_PER_CPU(paddr_t, current_vmcs);
@@ -234,7 +233,6 @@ static int vmx_init_vmcs_config(bool bsp
     u32 vmx_basic_msr_low, vmx_basic_msr_high, min, opt;
     struct vmx_caps caps;
     u64 _vmx_misc_cap = 0;
-    u64 _vmx_vmfunc = 0;
     bool mismatch = false;
 
     rdmsr(MSR_IA32_VMX_BASIC, vmx_basic_msr_low, vmx_basic_msr_high);
@@ -426,14 +424,14 @@ static int vmx_init_vmcs_config(bool bsp
     /* The IA32_VMX_VMFUNC MSR exists only when VMFUNC is available */
     if ( caps.secondary_exec_control & SECONDARY_EXEC_ENABLE_VM_FUNCTIONS )
     {
-        rdmsrl(MSR_IA32_VMX_VMFUNC, _vmx_vmfunc);
+        rdmsrl(MSR_IA32_VMX_VMFUNC, caps.vmfunc);
 
         /*
          * VMFUNC leaf 0 (EPTP switching) must be supported.
          *
          * Or we just don't use VMFUNC.
          */
-        if ( !(_vmx_vmfunc & VMX_VMFUNC_EPTP_SWITCHING) )
+        if ( !(caps.vmfunc & VMX_VMFUNC_EPTP_SWITCHING) )
             caps.secondary_exec_control &= ~SECONDARY_EXEC_ENABLE_VM_FUNCTIONS;
     }
 
@@ -456,7 +454,6 @@ static int vmx_init_vmcs_config(bool bsp
         vmx_caps = caps;
         vmx_caps.basic_msr = ((uint64_t)vmx_basic_msr_high << 32) |
                              vmx_basic_msr_low;
-        vmx_vmfunc                 = _vmx_vmfunc;
 
         vmx_display_features();
 
@@ -495,7 +492,7 @@ static int vmx_init_vmcs_config(bool bsp
         mismatch |= cap_check("VPID Capability", vmx_caps.vpid, caps.vpid);
         mismatch |= cap_check(
             "VMFUNC Capability",
-            vmx_vmfunc, _vmx_vmfunc);
+            vmx_caps.vmfunc, caps.vmfunc);
         if ( cpu_has_vmx_ins_outs_instr_info !=
              !!(vmx_basic_msr_high & (VMX_BASIC_INS_OUT_INFO >> 32)) )
         {
@@ -2153,7 +2150,6 @@ int __init vmx_vmcs_init(void)
          * Make sure all dependent features are off as well.
          */
         memset(&vmx_caps, 0, sizeof(vmx_caps));
-        vmx_vmfunc                 = 0;
     }
 
     return ret;
--- a/xen/arch/x86/include/asm/hvm/vmx/vmcs.h
+++ b/xen/arch/x86/include/asm/hvm/vmx/vmcs.h
@@ -287,6 +287,7 @@ struct vmx_caps {
     uint32_t vmentry_control;
     uint32_t ept;
     uint32_t vpid;
+    uint64_t vmfunc;
 };
 extern struct vmx_caps vmx_caps;
 


