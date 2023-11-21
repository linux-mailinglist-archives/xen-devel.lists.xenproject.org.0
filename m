Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EAD207F288E
	for <lists+xen-devel@lfdr.de>; Tue, 21 Nov 2023 10:19:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.637598.993540 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5MuU-0006Qg-2K; Tue, 21 Nov 2023 09:19:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 637598.993540; Tue, 21 Nov 2023 09:19:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5MuT-0006P0-Tv; Tue, 21 Nov 2023 09:19:09 +0000
Received: by outflank-mailman (input) for mailman id 637598;
 Tue, 21 Nov 2023 09:19:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=GR51=HC=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1r5MuR-0006Ou-PM
 for xen-devel@lists.xenproject.org; Tue, 21 Nov 2023 09:19:07 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01on060f.outbound.protection.outlook.com
 [2a01:111:f400:fe1f::60f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 048df118-884f-11ee-9b0e-b553b5be7939;
 Tue, 21 Nov 2023 10:19:05 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AM8PR04MB7972.eurprd04.prod.outlook.com (2603:10a6:20b:236::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.17; Tue, 21 Nov
 2023 09:19:03 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44%3]) with mapi id 15.20.7025.017; Tue, 21 Nov 2023
 09:19:03 +0000
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
X-Inumbo-ID: 048df118-884f-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y8ET9DJty47f59QxfivFKWjDSqRMUu+gzQUrZrHUr6zsOgxl7Sw8dYzbOQRrNwXhUIGZPgP5bvOBZPfXN8+J/678k53dSQTEcgeZSZ3proGlV6Gucq9Yt51qyYWbA1EwsiUnEJMfY02r7g10IK5q5+Qa/cnaQFANJ0Ukc+rxwBj+3CSWr2VOJBzeqJLHNIHhviRk4eZrZfZMmeoxlMmYCgnwuxljKFsSkybA2OyYfxZEIRLfrErXHCeFFNAq4Y0WEqeIMNRt5A6CgEIy58pTx4v0Cfj0vFmw7i2FuB2Uj8Z/gh5Rjn+ct8mYdtx8lxQs92K8ZqHzQLTHinnbf51ybA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=plSxdD726QpEYDfLtNqC2N8l5l2hj7GgEmui1PqxoRY=;
 b=E/l4PQ1bnLaXvylyI22VC2mIqVDKlWWJ+zlMvpWLC1UzEGLGNaspjb44MXeXmhqmyO1D+zazLO34J12HjV6NNfVqNqSZVx2ldhHLV+nsXkcvGZZvrfqaM6u19j+bRvJuyu6N0ae4QIDMaPlraiU6YFyMmplb+MX3AJxKIGrREJdR64q190dF16e/JTgZnDPstKQpyHN3MjvUCN9+JzmVZ9cc/1zGaWiss0rCwmeVIfo4CZvFqTe6AZV3CTDIhO+NYOtZj2aq12zrkIoptz6Hj1LD9sNbEJvYkPWPiE0l9KgM3sIPiGNMwRs3l0gcBTajSFXOTdMv1+TLrPsqXcByTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=plSxdD726QpEYDfLtNqC2N8l5l2hj7GgEmui1PqxoRY=;
 b=CWAZ/eIVqS8lJ6ptTQ3agZCN1moZTqaA5aM/WFxcQ/zhEVWxr8wCaCo8Gg0SyTX3SkfRPwXDvjnftJxeHCQ0et2td6Op+6LgmRxrj0AlS2+0ArYD3xMTvqPsdh1sxV201g1UE40+OWW/F8f8/eWBSfYqnzeUmVI9/J9d0h5NJ/rcIguIu8wd+q/jbqUyauNcIwMvoHrswP7wB2GfVfI9HOYSzTDJ6j9hYb+O48TYYngixYREya1qvEJJB9XAqV3MKpZbxRADAu/E9SdTIEUg0Cx/XJaxY0bFAmLObcSmduhuefBEK/A+iieK62rz7O34/0qtgfnP8TiKMT1wze0JgQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <ec649a67-63c9-4275-a228-c14dea558eb0@suse.com>
Date: Tue, 21 Nov 2023 10:19:01 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH][for-4.19 v6 0/8] Fix or deviate various instances of
 missing declarations
Content-Language: en-US
To: Nicola Vetrini <nicola.vetrini@bugseng.com>, sstabellini@kernel.org
Cc: michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 andrew.cooper3@citrix.com, roger.pau@citrix.com,
 Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 Simone Ballarin <simone.ballarin@bugseng.com>,
 Doug Goldstein <cardoe@cardoe.com>, Jun Nakajima <jun.nakajima@intel.com>,
 Kevin Tian <kevin.tian@intel.com>, Tamas K Lengyel <tamas@tklengyel.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>, xen-devel@lists.xenproject.org
References: <cover.1698829473.git.nicola.vetrini@bugseng.com>
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
In-Reply-To: <cover.1698829473.git.nicola.vetrini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0038.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::14) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AM8PR04MB7972:EE_
X-MS-Office365-Filtering-Correlation-Id: 9034ad3b-3a1f-46af-19d5-08dbea72e795
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	JtKxSSV7MgQtelzaE0bfN2BOLtmoldwS+aZ90KaYk7vEck+ALf6X2U6PJL7wFJSti1QOLoavfiCSyT1TPGuZzPAP7Hcad6TjYY7axcvZq8kQzpZG4Hbr3Kc5N9fKaktkWIBtxF5goMB/7zFgBGTf5VJBLLmmmA7+ynZyh8Cn3WXXCzOpvyS3kvNpPvfirF/G/pEvtTs3LC60YKaZPf+WUYO1pCOu6XuvA2daUuxMcz082cITR8LeM/nMGPi56HZGgfkx+PMRecLRxQkHOVBtNoFYOTw2XnPUZEtIz7T5W2//dI/qAXmwoLwW3XzqjKthYn3pWrU/vv9cV4kGjPsshEmweqCENsEWduktusXIXVJnYu1tcGAT4RoP/2hTcYAT/W13BcS1+/bvtT7zVTolcAY3PY0tJdRnuDwO7/wo1Hmm3QulZwX0v9jDyXwoPpFJmg0na91yme9XM9blNL8F9FAkK1r9PJ+yt30nSCSowSvarH/h53edqlJbwMG0kaVgvt4QnDefYGXvuP+6yBtjgY99umP7CCdzUZ3W8by09WMMGFKlCyRjxCkpq2ICMvU34kroaQNGSKCWgZUwTGePAhjzYc6UiJtuUs2w/QelHTZfWwlotTQe4yEUQ2vokfoyS7y41XpGB1Qosmcv/BNM7w==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(396003)(366004)(376002)(136003)(39860400002)(230922051799003)(1800799012)(186009)(451199024)(64100799003)(478600001)(6512007)(83380400001)(6486002)(2616005)(53546011)(31686004)(6506007)(26005)(54906003)(66946007)(66556008)(66476007)(316002)(86362001)(31696002)(2906002)(41300700001)(5660300002)(7416002)(38100700002)(36756003)(8676002)(4326008)(8936002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WDliSWh2Mi9kWlU2RmZmMHkzbVJrN2l1RkNIT1NXeEtzODVwUXpQdnUvZVFO?=
 =?utf-8?B?Sk13a1hpcHlmc3d6K3Irdm8vUXFJZUNQN2FOY1RUMy93ZDU4eEs3Z3lhdlZo?=
 =?utf-8?B?OERQeVFubkRYL2NyazN3TmVUU2daWi9RNWhSR08zbXo5Q25FUlowN2RSeVNm?=
 =?utf-8?B?Q2NIbDRCenBCVlF4dERGMVcyTlgyaDZFd2tpa1RjSk91WEZ2SWhlaG9DRG5V?=
 =?utf-8?B?TnlEU0pFUXI0SUd6Y2FoZlJjak1KVWNGVTRNc3hNR29VTUMzQW1yK0J5YVBE?=
 =?utf-8?B?Sk9UOTdheEE1dWZzUytuQXpBRkQ3dm53SWlQcXJkM2FZcmw2SjBGMCtUaGNr?=
 =?utf-8?B?UnJvZlpkSitPbkdNWTM3c0tvcGVTOXFkM0FybDUvTlVJMHg5N2h2c2wwOE1M?=
 =?utf-8?B?bWR3bTN6ekd1YThtZHpBVnF0MDhWQWNBdW16R0k1QjFUTmliTEVncEFWWXJ6?=
 =?utf-8?B?dVRIM3B3N0N1Y3dLdkNVZmJxWWFPVnRwQVoyQTVheW5EdUVxbXhiUzVDVGhs?=
 =?utf-8?B?QW5saGRndDI1TEpDcHVrdmhtNUJsdGliWHlHVzFqRk42YTVHYTEweHM2M2Q2?=
 =?utf-8?B?dk8yKzZCYTRrdGtvZkFQSExROEtrUzdrNy9OMFNKNGd4NHFjV1JpRm5CaXJR?=
 =?utf-8?B?SWZibGZjVU50Y1FLcktheGlOdVI3OUJhcENHck13eElUNlRsZ3BrQ2V6dHFP?=
 =?utf-8?B?ZzViZ3hWWHAwOU1neVFQd29HVHdtYlhPdFR6OVdOamJUdngxNW5LcDkveWtm?=
 =?utf-8?B?Qm5wTVNyamJnMkxEWVJYYlZFdlNhV3QyR2N5b2xwZmF4bWZlaFZpa0w0bWFx?=
 =?utf-8?B?eFFtbnJkY2dRYzZZRDdFVDBvendnZzVjUzhIejNTWEwrMit6aCt1Q0FjYzVt?=
 =?utf-8?B?VzFJbEZFRmJlOHdrbGY2WC9GT3BMNUpqYVI4aGRWTjl5UVdXdHZseXdSb290?=
 =?utf-8?B?Y1A0emcreVdvK2hoZ25sSUNVRUVTMUt0cDVtOXc3SzA3SUtPeVUwRUlNVS84?=
 =?utf-8?B?bUMzcUlZTHgyL3h5Z09LakxvUXpWallFa0I2dWdpWWRQcHczT1BIeHRXRlZC?=
 =?utf-8?B?Uk1PRHh3SHhvT25mNFBiY2hlZDYxYzllY09vRVBSajk0aDI2cE0wNHE1bjlL?=
 =?utf-8?B?TlNxZ0tFVDJFSVloZmVoRUFoMU03V25XQi8rU2JKS0xlMXVEYU5OWWR3Nzcz?=
 =?utf-8?B?YU5GbWZHNG1memhWR1dkY2JqbFFvdDd2TmdjaDQ1Um9zSVkyR0h2cXVBaXU4?=
 =?utf-8?B?aysyMkNQemg0R3ArM2dnYU1BM0F6dU5Ka1Nma0ladGRQZTkrNk9VdXdNa3Vq?=
 =?utf-8?B?ZjQ5WVB3NjJDMktQTjMvdVhINktGcitmcUhaZGx3VzFoMEYyMVVlelhUQjRs?=
 =?utf-8?B?YTVZU29mOVBaNENqcVVFRzVKWXI3SWRHVi90MVp6UDlyWUd4T3dLMFlBeURZ?=
 =?utf-8?B?Y0s1eG4vby8veStmdEJLaDZ2c0VZeThCUzAvai9hZmQ3TDViRWlmYlJPbm11?=
 =?utf-8?B?N2tKbFZ3TTdQT3BYazhxbEMrMHhvVXkzeExRYXpYYWlKTFRja2huTGZ3d1kv?=
 =?utf-8?B?QUVaaHlET3plYmJGMkNQODkrQ3ZqSzV3RGlHMEllTTRvMDlOUnQrcjZDWEV1?=
 =?utf-8?B?cTFiUGtpMTM4VFd3OTJlaHU0SHE5QUZaSkxSUFBHWGNhazZvMmsrR2tyVitp?=
 =?utf-8?B?ZEZEblZLaUZUSnYzMFNyeXlMZ281MjFZQ2JVTG15Sisrek4wejR4VWh1WnY2?=
 =?utf-8?B?eXpZLyt5MWVBbTNTUGliQ3dseTJyeFFQdmpkbklPY0VYTFZOOW92aVh2YXcy?=
 =?utf-8?B?V2F5cmNaRkdHNUJXVDJkSXBpTFljZFpldGlCWFpFd1lFSy9LclVtU1k3Tmlv?=
 =?utf-8?B?K1RrbG1yajFFd3BrN1IwQlJEVzJGUG9rMUo0bjYvYnE5M3hmbmM1MHd2dmVX?=
 =?utf-8?B?ZTFKamk0WTh1eHRWYUZFQ2lwU0F0RGNURUZNOVhHeDRNRDVTYUxObWRHa3M1?=
 =?utf-8?B?R2kxWXdjNVhXbURpRGgvd0xocTJ2MWkyMTFUMmJtZUJpdUlobFVCUS8ySEVr?=
 =?utf-8?B?MEhXdTlJa1ZTTVJUU29HL1JXWWpHWWlJRVVTTVhCLzJLZzc4S1hvaFBaTDEz?=
 =?utf-8?Q?3UB9o8yOkLh/zWluHgGIHnUB5?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9034ad3b-3a1f-46af-19d5-08dbea72e795
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2023 09:19:03.6616
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ktm75nt8F/R0xjstJ53imNDrOZ0k7KFgxBOksVHReD/Bp+s4iwb0hwXMxKXUy5JffDK32chqHGPXUqf9zwGfhQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7972

On 01.11.2023 10:30, Nicola Vetrini wrote:
> The patches in this series aim to fix or deviate various instances where a
> function or variable do not have a declaration visible when such entity is
> defined (in violation of MISRA C:2012 Rule 8.4).
> An exception listed under docs/misra/rules.rst allows asm-only functions and
> variables to be exempted, while the other instances are either changed
> (e.g., making them static) or a missing header inclusion is added.
> 
> Nicola Vetrini (8):
>   xen: modify or add declarations for variables where needed
>   x86: add deviation for asm-only functions
>   x86: add asmlinkage macro to variables only used in asm code
>   x86/grant: switch included header to make declarations visible
>   x86/vm_event: add missing include for hvm_vm_event_do_resume
>   xen/console: remove stub definition in consoled.h
>   x86/mem_access: make function static
>   docs/misra: exclude three more files

While I committed most of the patches from this series, the situation with
patch 2 has become sufficiently unclear to me, such that I refrained from
committing that and the dependent patch 3.

Stefano, assuming you know what exact massaging it wants done while
committing, please can I leave that to you? Or else there may want to be
a re-submission.

Thanks, Jan

