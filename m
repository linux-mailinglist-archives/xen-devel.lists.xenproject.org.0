Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D9B37F414D
	for <lists+xen-devel@lfdr.de>; Wed, 22 Nov 2023 10:13:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.638559.995236 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5jIK-0002jG-Hj; Wed, 22 Nov 2023 09:13:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 638559.995236; Wed, 22 Nov 2023 09:13:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5jIK-0002h7-EX; Wed, 22 Nov 2023 09:13:16 +0000
Received: by outflank-mailman (input) for mailman id 638559;
 Wed, 22 Nov 2023 09:13:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4N3t=HD=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1r5jII-0002gy-JU
 for xen-devel@lists.xenproject.org; Wed, 22 Nov 2023 09:13:14 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01on0607.outbound.protection.outlook.com
 [2a01:111:f400:fe1f::607])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5ce86be4-8917-11ee-98e1-6d05b1d4d9a1;
 Wed, 22 Nov 2023 10:13:13 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DB9PR04MB9260.eurprd04.prod.outlook.com (2603:10a6:10:370::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.18; Wed, 22 Nov
 2023 09:13:10 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44%3]) with mapi id 15.20.7025.019; Wed, 22 Nov 2023
 09:13:10 +0000
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
X-Inumbo-ID: 5ce86be4-8917-11ee-98e1-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O6JGwymI/q96F2c/hsDnQWTINcqclX6yjy1NURuUxRkT0Cr/Kz0BKsk88jNmPTvrKf7E0jZM2TAR9c9UbzKWhsO1EqWvolSRN2S6pCr0cPJVrhXVXHvUPR03+0q9Bc1fnF59aYT6QhtcBcts7Ou0zeDjZU4F1pOTN0ACJRFENzs82p/1o1sSN1f2G72E/IMXhY8PvadTNq6J3iE3+9HiCSf+HuBIrGGfHuFS2j0noXZH5jDKotYYpkg23cjnK20VrsyMjTk/zyzp+VEf0CKyfIM6Zc18kRmO9gb2iwG0vXt7zwVZMQJxKt5U/lUJ/vXF2nECEeQRvdBI0l+tuwzf0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Avj3hv9hWwGChRxIuZX7GBJy3AIYABhO8tPPDCoxDt0=;
 b=iiTXsDizGM2zl4FivStIkOVVlJmzuA4AwmaiqseVLZjdhG0N8yJoP6AVWnM2eHpRbfVCLVMprMqP/VCJf3TjOZa74D0vtxENEaGcylEwib5LZjj52dNkcnBKDz090XPG6s44lfJCVO84gzY2TXtlh7PGG6OthUiLyYFg7qKFsUfgy0+lyS8qyvUSgDnZqwfD7S1srrgGojHjSsioRvY3Mi8I0xWGNr+HgcbANNmJSwmZrd59DKFImMaxVDUAsGTxDd92vr2aNkcGW9eQ0o104/K4KGyCHn2hX/X1ZEi0QHTeqou8W2FpUbhvLG60JjJ490cyXCamkoVwiWvY1pr3sg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Avj3hv9hWwGChRxIuZX7GBJy3AIYABhO8tPPDCoxDt0=;
 b=WSlE8E04CjI3mYJOSlmURw5KwzgCpqIldAUqgBJSd10pDkQkHJYg/OXebggYxTD2vJOQx9TQp4dkOXgzaObORhsOIJldM+6o6v+CY+rjCJAxFnr/aXhrAck40aVtCrSIYC5RV/Sj7Ff31CoRnztI7fImES3f33Z4QmVcWlnSBh1FTwovmJKgho7KOU3yuW9bfhxgsewH66SYeNfe5aQZeODPePJbmoENT52oysDlC2tGeoYQ42nn4xdGFivxnlPLg6CmgcJu7lF+EBE2Jh6P+A3Mv0LS3W7X2EQ7xCR6tTG2LZvruOHxt8mtpWJMKnWbr1ofML6DW5tWQUB+nOP2Dw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <72b6d1f4-a766-4f30-ae99-12583cc11214@suse.com>
Date: Wed, 22 Nov 2023 10:13:08 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] x86/HVM: drop tsc_scaling.setup() hook
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Kevin Tian <kevin.tian@intel.com>, Jun Nakajima <jun.nakajima@intel.com>
References: <791a9f45-2bed-48f9-af6a-9fbde65bcc71@suse.com>
 <d5b7124f-b7cd-4a3a-b12f-e8e315e9f89d@suse.com>
 <ZV3EnVFk7DtlLyXS@macbook.local>
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
In-Reply-To: <ZV3EnVFk7DtlLyXS@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0018.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:15::23) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DB9PR04MB9260:EE_
X-MS-Office365-Filtering-Correlation-Id: 3970624c-f2c9-4f4e-a99f-08dbeb3b3f9c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	mtyFz8OeSRWLBBOK1oLcDzUWle0cIDFxpfs8TFfJVeMQLdniqrfCgXq2NbRhOA4c03geoKkyDlUPYmQ3Khzd7ZwHr3vHlmsgNsERKJtEvV8HLEyCsxJ/RBivfng/GZw8qM88O0w8IwLZm4kMNjPFT1W2Lc2STRqrYSssSiY7rbFsyuMFLoDAHVBgAWBJFv56vG1vfYRQEGhB/2wxrUcLXct3H8kcGeoGhL6VXublVwZAHuVsRfMunQVqHe51QePAkFX4oUWhhFA/5lX1RFYssKsM/z03N7cJ/EFGWJ7+KW6t2B6tY3DsrCuHo1O7u22XSLz3WpzhW9AmrS8okdP+ZlYjyarDQTUDc6/sZPg6Y+9RfOTG8Rk40c8MptyipDG/HZ1EnzqssI1Z59EFIkmOlNyMOZmZvX9a0brC07sCJYBtRBNoAMElHndEpjujodZVUw0ZrarOzUO70jDfp0JwIKLWZ44plhMOOhGf57gcGZa+/CKBAyEUQ3VAh+neWnHplZOxobJJYVjbJjTAc1wiZTc03jya7GLLaGFNxZqk8PRdmZUbgmpKhO6aDWD0FFDXmNBIHcVZ9SaouXb1ZYBs8QW4if7fdTRFojiObnBEmD9VhyNCTX7lxU6jXbOmCma4pEQK5mJyto4mLBDui/y6yg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(39860400002)(346002)(396003)(376002)(366004)(230922051799003)(186009)(64100799003)(1800799012)(451199024)(31686004)(2616005)(31696002)(5660300002)(36756003)(2906002)(86362001)(41300700001)(66476007)(38100700002)(8936002)(4326008)(8676002)(316002)(6486002)(54906003)(6916009)(6512007)(26005)(66946007)(83380400001)(6506007)(66556008)(478600001)(53546011)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MHlNNkRheWUxQWh5MEQ0elRNdW9JMHJhMllKRUoveUZoTW9Ja3hSSGVqZHR4?=
 =?utf-8?B?TThHcGcxMEZ1V0xwa2dTTFlQZXFUZ244WWh3V2RuMEY2TlFXenpxQytNWFFH?=
 =?utf-8?B?WXBVRlZvMHNlWFJ2U1V4a0VLc2ZWWE5SOVlGcDZxRlg0M2IycWZLRk01cENB?=
 =?utf-8?B?OUFTTUZCdG9yK2RJMUpNeE8rZWxrb3dGcGd4a1pudStFTTZ0RVl5cjNsM1pj?=
 =?utf-8?B?OURaTFhTdEJtQmQxa0ErVjZtSGV4QVBJMy83VWxFRmdxbmxyaCtCSVFYQXl0?=
 =?utf-8?B?TjQwOCt5UzEwNDBtdkpwOHBWVHVaK0ZRVHFaSlBaMUxJWG8wcjYyKzNMZnRM?=
 =?utf-8?B?czJ6bnMzSkprdEk2Y3dxSUhjU3p0anJUWURNcUdLWTVQdjNaanBUMXBRRHIx?=
 =?utf-8?B?QUVNNFdVM1owL1JFSTM4WTN3aUZYSEd4Mk5GWWVUTWRManhUT2w2RXJzcllR?=
 =?utf-8?B?bTBWN0tsSEJRMm5EeU5Zbnp0K1RyNXdJUFVFYW4vVzlHMGFnTUsxYzRZdEhO?=
 =?utf-8?B?OE5GUkIyRGdsck4vWlN1d3VUSjRNQ0FsdE9kWk1ycXpodUhESDVWcFQzaHBD?=
 =?utf-8?B?a3lnYTRMSS9Mb2ZPZWVOVVoydkRBbDZtNFNGUjZvS2xmNVI1WXpHY2YvanNj?=
 =?utf-8?B?VkhINEIyZHBJbE45b0ZVNGlkdkZRQityditFQWxMaExldTJRUU55R3FYWlF1?=
 =?utf-8?B?Mng2R25UVW54TlJWRFRKZVVYSDYvTlNkTk1MZnF0d0pJTVhkNjR3TEo4SUg1?=
 =?utf-8?B?NHpMYkFzWTRDbUdZcEd5Q0k0bUsxR3g1a2dqN1VWWHZkb2w5cTNBeURNcnNE?=
 =?utf-8?B?SGxJUjlOaTRwa1pEM2JnVEZWRUgvM0VDM3lJVHdZVnh4VGlpUHJ1bEFCSW5X?=
 =?utf-8?B?UUlDc1JnWnRzanVia2dZcHZreEo3QzltcklZRXZCYjZUNCtsUGFHUGF0Nnov?=
 =?utf-8?B?QWN6U09PRXBOWURXdjBoSUVzMGtQSnY4b1hMUXZ1YXpBUmdsWTBIR3VSTnV5?=
 =?utf-8?B?VzZzWThlTHl1VDZqemZzVDRyRXNBbTF4L1Q2azNOVzBreUhYa1B6dXFvTDA0?=
 =?utf-8?B?anJRbHRYV25yUVEyWUdPRUNQVVovWnliT3FBd2x2NVhzOEpoby94aklHNmxw?=
 =?utf-8?B?SldqMStVM2lPeU5GdThlS0NaN1R6WHZvNGxxU2ZmV3VHZnBsU284ajFmdDd6?=
 =?utf-8?B?U2pPUVh0M3ljWHlpWHJYYXhVTXpoalo4akgyVWhkdXRLczRpL093M3NVRW9U?=
 =?utf-8?B?a3hIbFFVeGVTRHVUVENrZzYwcmpGdHpFZW1TU05Zc0JldGFNNWxJMCsyeWJ1?=
 =?utf-8?B?MzVZT05mUWx5VXdCeUw0QjRDT3NCc2tRR1FuVWEwMlYxS0d4Zng0Z3hSeGZm?=
 =?utf-8?B?WUJFejR3QnY4ZDEvRm5laFB0WnNEY3FXaGxWQ0RvUTR1YVlMaVN2ZWJ2Q0xz?=
 =?utf-8?B?aDFiQ205ZUFiZW9iZlNvVW04cXFOZmtKYlJLRWp6VTBwZWJkQ3FlQVkyVW44?=
 =?utf-8?B?Vk5xY2NmSmowMzVlQVNlc3MvMzRWMWpISEM1ZmszZWs2ZTJyMG43R0NnS3dJ?=
 =?utf-8?B?aElMOTNvMmM0aWwwS0pTZ2hOQlovS3NKUXVHaDZRRjNyY2wzSWtBdktYZFU4?=
 =?utf-8?B?Q0luU0ZFUCtJZ05JOHg0bURVZDdnWVdlcFh6dUJKYmZqV0dzdFgwY0I1bmtL?=
 =?utf-8?B?dU53MWUzdjE4Qy9XUW96WitDN2p0RTFWanRIOURkTUorbUdkU25iYzRGdThT?=
 =?utf-8?B?SHZnd1pWWWEyMmtwWTBHMkdDRGhPdCthdTlVaEltOTBqMG8rRnJZVnhPQ2pU?=
 =?utf-8?B?dWFsRUN3TDBuMS9YakVTaVAzbm5oRmpRWG8zTXFsL3F1bjNiQ0IwL1VIMUFG?=
 =?utf-8?B?Q21uNERkMDRxSlFnS2s4UllXUlAzMUllK2VWOHA2MytHdUJFYy9LZ1ZsV2VF?=
 =?utf-8?B?OG1NRTA5RkptcUhwTHRVL1VnWHV2MFhuVThuUml1QmQwa3ZyUnFsbktMN0Z1?=
 =?utf-8?B?MSs1OTNKMFV4UG9pY0lzY1dQY1B5R2lVaUlRN1pZR3EwWHRKWFFZM3lNNURy?=
 =?utf-8?B?bk9ON0JlcnYwV1FFNDNPWmRwYVI2bTdRV1ozZ2lyNFpjZS9TcWJ0OGVSRWVN?=
 =?utf-8?Q?R/ZqiaMb0RxjFUIrO+86cEPgG?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3970624c-f2c9-4f4e-a99f-08dbeb3b3f9c
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2023 09:13:10.7053
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dawduF3iE3wkU98CpAaoX0w9TMss9UsfwiabwsJUZjE6gUmCf79VkgoY2u+BTUGNgNeJ93u/mhIyQy0oTyqkQA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9260

On 22.11.2023 10:06, Roger Pau Monné wrote:
> On Thu, Nov 16, 2023 at 02:32:47PM +0100, Jan Beulich wrote:
>> This was used by VMX only, and the intended VMCS write can as well
>> happen from vmx_set_tsc_offset(), invoked (directly or indirectly)
>> almost immediately after the present call sites of the hook.
>> vmx_set_tsc_offset() isn't invoked frequently elsewhere, so the extra
>> VMCS write shouldn't raise performance concerns.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks.

> I would be lying if I told you I understand guest TSC management in
> Xen, but patch does keep the previous call sites with adding others
> that are indeed not hot paths.
> 
> I do wonder whether it would be possible to set this before the domain
> is started, as AFAICT the TSC scaling ratio is only set before the
> domain is started (either by domain create or other toolstack
> hypercalls).
> 
> Could we maybe further limit the write to the case where the vCPU is
> not running?

Possibly, but not straightforwardly: E.g. I think we'd need to actually
enforce tsc_set_info() to only ever act on non-running (perhaps even
not-yet-started) domains. And I mean not by looking where it's being
called from at present (which may already provide such kind-of-
guarantees), but in the function itself.

Jan

