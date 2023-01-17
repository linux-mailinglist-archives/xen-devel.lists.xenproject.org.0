Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EC5566DA18
	for <lists+xen-devel@lfdr.de>; Tue, 17 Jan 2023 10:37:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.479267.743009 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHiP9-0005Nu-58; Tue, 17 Jan 2023 09:37:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 479267.743009; Tue, 17 Jan 2023 09:37:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHiP9-0005Lv-23; Tue, 17 Jan 2023 09:37:19 +0000
Received: by outflank-mailman (input) for mailman id 479267;
 Tue, 17 Jan 2023 09:37:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=IWGa=5O=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pHiP6-0005Lh-WF
 for xen-devel@lists.xenproject.org; Tue, 17 Jan 2023 09:37:17 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2080.outbound.protection.outlook.com [40.107.7.80])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 86035ae4-964a-11ed-b8d0-410ff93cb8f0;
 Tue, 17 Jan 2023 10:37:14 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PAXPR04MB8784.eurprd04.prod.outlook.com (2603:10a6:102:20f::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.23; Tue, 17 Jan
 2023 09:37:11 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389%7]) with mapi id 15.20.6002.012; Tue, 17 Jan 2023
 09:37:11 +0000
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
X-Inumbo-ID: 86035ae4-964a-11ed-b8d0-410ff93cb8f0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lPZvsfywG7ijVC3GyUyzmURO0/+8j/o52pAZ5gl9eLrZnHq9DsqAg7sojgAFBWfovqn+YunvobwRRayfE2iYctN0eWx5wsnU/HF2dhGAe0T/Z5Wt5NEvsqc39Whe5t5wvUrbee+B1SuDXqprLSSyJ2mTRUn6xjp9eGOqXoXNnAh/npVuyhOTj6veyKl4Tr0KcbTZ6GXmvWSdAa+MPY19NMBBM9R9Cqf8hlsVUFdMELhk40agd8UOt7ODfI7Mj8Qv4n5dxX4QvRidaxKUD6ZVBOcnLXFp3vxdPxLoXxzMchKqO1HJK4U8aGKMdhPOz4RNnR7J6JDzNmU6ABjc4elChg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kJ7ikuLLte0KHA5P+3v6Zz3NVJyL0NCw88NVD57UyQI=;
 b=bm5IZMZlNWN1lS3SBJZOgfho2KHsQ1886uhkoPdFzzOMz+Q3ovXTN7wH0kl6aYGX9h8rY3uPc8+ZSJsJIwobXdjF+EEEQ335FekkbJD8vNpqIyDzvATmlHfRDP47VW1oz29rcMaa7lJiO17ESgqu9FJ6/VIi3TqpUduYdxEBysGeGldNlE9SIUfx9GXJftX9hFkAcIJPWMUoo/y4gGvFhLcU0B6j3jImrdaFpG7xhG04anV6iLW6BofZOWDeFd4WdXBQuRKRbpEsuv5ASfaSmOiaylMWHGIXO6eW8yMf2g3XUgcgKfzScIrD2QAlF9ixM3HJA/mDXXFXU/ftKp7fKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kJ7ikuLLte0KHA5P+3v6Zz3NVJyL0NCw88NVD57UyQI=;
 b=MRFk/+pXqO4gak0Hqfj+ggQEPjemOWROwm24uc9Gq7mBM7ETmTrp25NGtiqh9q6G2KS1UVj5tKwBa9O4VmhN1lHqhTlEmgMiTnvxx0X0b39GdnrgxLqNmTlljWINw+a0w4SD6rdlyiBN/ZjlZEvYOjaMZZC6BDL3Cnaj3p9sco/zPonM4X3A9gtjHKlAI1/h/YBDd6Iy5TdMCll7+dDM0au5M9ztQsoHIYUuvJumvyD1G2SnxyYlIeo52XgfF/FYbambnQ09VISE4Mn6p7xehO6afrR+7VI5vrzPb+BRSGkisnD7U5vKKoXbdeBiIwfWYKRY+bivsLNStCfCbghKLA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <aceeec22-2183-2a60-7a68-58f43d8da493@suse.com>
Date: Tue, 17 Jan 2023 10:37:10 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v3 00/17] tools/xenstore: do some cleanup and fixes
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>
Cc: Wei Liu <wl@xen.org>, Julien Grall <julien@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20230117091124.22170-1-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230117091124.22170-1-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0176.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a0::11) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PAXPR04MB8784:EE_
X-MS-Office365-Filtering-Correlation-Id: 7c98d52a-7490-4c3e-5171-08daf86e68ac
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	WV2nWi4284np0KTBJsQ2H9C9Et7fv+HiUBHGFFgTVIi2OCxEBcBxsvcZiZoOopmjSgSvzswRrr8Mm/0Vfu3VC6njB7sN7/6zcR4V2FlEV/C0fziJix8WWaigZcjOvEDExDYDIGoSKlKZRZTT0iQTAuuweoGs3HX0XIHnFp8BwCEW6XxDfuD/+ZFUH6j2oFtjVmCfzIHNtFD2kLbr4O5dTGX7Vjq9Q0q0ltuh3d6VGGq3Qg846Jpvggsg1e4fsBtbLSmR/HeZtFCp0nv61xfpPp5nudDJS01O8tRciQhd0Z+WVeR9DBC4nkHpSxt2nA6m6/Nr/s/KN6VUJdF/nEkoPeKQ46HZpUppXGObL17GwMML9kjJfRvHBDCWjk+28LzffUKoAf9eGjUPqcJftS45Ifyxa4+EpWvPsKp59B80Xqowd0/5eKQtiTr5alPZgafxL53jiKMg91iMUYRSw1qIUxTrM4qbxrlN7eTfouMWBDJUXVXipJJIZrRlc965Zji9ne+SVwBDdIajMekxLWpF+cvX38Cmc0MBGOyrmZLLWHCK2wcTH/+gxNKv3ZzE9/go6fjnn+HwM+YWopW/Pe5fNoJAd5sY+HFDxJ/TGKRvU9zlJuo2Y9hcBTamzzw6CE/O2q6wmTlLL4D2ExcvZ7gpct5cLO6EjiPkb3szlJpuPz09VNb29uvQsxij6fvXi+TZpyd1WPh5+ZpYRXP12+aTqhsTrSjWNw6SFBi+dZqrS2M=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(39860400002)(376002)(346002)(136003)(396003)(366004)(451199015)(31686004)(2616005)(66946007)(41300700001)(66476007)(66556008)(26005)(53546011)(186003)(6512007)(8676002)(4326008)(31696002)(86362001)(36756003)(5660300002)(38100700002)(8936002)(6862004)(54906003)(6636002)(478600001)(37006003)(83380400001)(6506007)(316002)(4744005)(6486002)(2906002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dDRKOEViaEYrSjExOFZmUjEvWmtBemt3M3k4c2JqT2R1ZFMyZnlRQldVclR2?=
 =?utf-8?B?Q0R1WEtSajd6SVp6UU1nL3dKUFZOYmFEa3Q2eW4zdFJNL05CUWxBQTlHb2xE?=
 =?utf-8?B?MWw5RzNNZ0NTWGhReWNUWkJsNTkrRGRpdGRZRTdURy80LzdWeHk5Z0ZzQWw5?=
 =?utf-8?B?MTQwY0dUV1I3U1R2QksvMU1tQ0hNM0NFMWdsR1pMYlRQUDljVjhyMEdMTGlN?=
 =?utf-8?B?MnFnbHc5NEh4QXNFcTQwZHZKSFhnOTFiSmtmdCs0THV5Z0FRWUkrU0ZudU5E?=
 =?utf-8?B?T2VHbng2d1huMVVndkhnSktnZlJML2JWYlFqS0FQVUsvbGF3WTNCTUk2L2lK?=
 =?utf-8?B?ODdObW10NGNVamRJdy9HQVNTSmhqemdCd2ZXeHpQNXlldFc4bWsxQytFUlVn?=
 =?utf-8?B?VVpYTFN3QXEyUnNiQU1aTXJYR21STkJwQlVrbU5UOUFGK29ZSFkrUEgzbCtv?=
 =?utf-8?B?ZXNyR25kRWlXOHB5RVFZTUxaR1Vib2lmQzRYb0hLZnUvQ2hDWU1FNmhRbG1l?=
 =?utf-8?B?c3ZzRitXcSs4ZEhHRnoyMG5XNEg5b3ExSkN1TFJKMTNHTmlPQXRhNkpLSWF3?=
 =?utf-8?B?dFo4OUNST2VxSVhGa2lsUTBkUDBQRlJwWkU4U3RaU2dWV0MzR084aDFpZSt1?=
 =?utf-8?B?ZXdGWW16amlhNnBTditHdzZIei9QblVyRlYzeGVFV1dxMkEycFVmVlRXQnJt?=
 =?utf-8?B?WEdNRTlXYVhadXBtcWQ5WWsyS3ViczZ2bk02ZzZqVnpwdDZHZXJaOURyazVL?=
 =?utf-8?B?QXdlcnB6ZWN2c3Z3M3ZLcWxuOFZ3NFN3cTlPcmhiTlowUVlSbnBhTGVSUVRr?=
 =?utf-8?B?UWNZa3EyWkIrRnFERkN1bjhReUpSWmp5aHpaV2ROZGh1ODhSa0IwbUNIVVZF?=
 =?utf-8?B?MXJmK0pXMi9yTEljUUF6Y3k3WlV3VFNwVFRqUi9GcFh2cVpVNkZ0b016djdJ?=
 =?utf-8?B?am54N1lsVHlhM0c1TENKaWdTbXVIY2pqcDVPKzdRSWl0b2FZWmtMU0RvZExK?=
 =?utf-8?B?SS9GZk11SGxWR3FuME53SUM5MU10Nms2ZGhoamxwWXBoT0VkSVg1SmZmbXVZ?=
 =?utf-8?B?R09RSE1NanlqN1BFbkpFeTF5RjYvQ01zU3JTOUtTc2ZDb3UrcGVZc0NPTWNi?=
 =?utf-8?B?dmtGRWZZalVBalJYVnhLb3JhMEs4L3lXbm9ybEs5dmVKdUZ0aUVJUU5Dbi9F?=
 =?utf-8?B?bTBoTnBHZi9CdGFiYXBQbVdnc0xBSSt1NWw3VWhDMDE3U3BsSWVxWXdMWkhC?=
 =?utf-8?B?UnFnVDFsZ0tlNGRrRlJ0Y2FWV2NNQ0ZXMlhkSlZkNVJkVENmOWtIdWtJUGVs?=
 =?utf-8?B?Z2FYYTlya3NJMzA0aFZBUHY3NUtNSkF0VWswN3Z1bCt2TUM3VmhJeG9IZ2Nw?=
 =?utf-8?B?R0l4Znp0K3dvR0hzQTNEQkpZVWplc2lCT1V6eUNjbkdibnlNOUtEQ1U0M0ti?=
 =?utf-8?B?cGE0eElFaWcyMDBBd2FuMXlkVnFJWVVoeXRzME1VTWhuM004Vy9pdlh4ZDRE?=
 =?utf-8?B?cXNERkh4Q0FzMnQ1NTVwWGttOURUSlIxUlpIcFh3QXd3cU1DQnluTUgzaDli?=
 =?utf-8?B?MjVnVnhzNWlmWnhKQXBwSGtBaTREMGdZa3FsbjJNemxqd1V4RWdVVlg0UzNJ?=
 =?utf-8?B?aTU0K2EvS3BQVnZJWmhwUWNOZ3dNZEtJNDZrTDZyZFFadEtjTDZzUFJyMUFs?=
 =?utf-8?B?R3o4UGxwRmJRWmRrK0c0a09BSTN5dVNmdnpBUWdsTVBpS0tqNzBwRnJsSno2?=
 =?utf-8?B?NVRyV1Q4UmpnUjU0MmdFWThqN1Y3YTVabUxrYnZJc1NMMzRRcllGMjRmajZY?=
 =?utf-8?B?MTQ4azJDSGF5dWN6c2VTYzgvMTRUQVYzVm5mWXhrSENaWW0wdHp1TGlVVG1H?=
 =?utf-8?B?a1FGcVZTT203TENMeUljbzVxNjI1YTI0cXhYRXB0VUxNRnJhUWcxa29SbnQ3?=
 =?utf-8?B?Ny80enh4VWo2MjEvMU5zTmhMdFVoMWtLV3dEUURnZU5MdTUyRjVFZlZ0U0pS?=
 =?utf-8?B?RHVPQnNMcDViMXRHWDF3QTg1bmx4UkxiTVNzOXNudWh5MDBIdml5NC9jWXdm?=
 =?utf-8?B?T1NRSEJ3aFFIeW93bXJtQVp4RUdzeGd6T0ZRUlA1QkVHcTMwT3BjYnBnZmx6?=
 =?utf-8?Q?g8Od2FJaTasTxTeo6XeWQh0pX?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c98d52a-7490-4c3e-5171-08daf86e68ac
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jan 2023 09:37:11.4435
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NeRqVdzEzSv45ClRMe2ZWv84+ZApy+RjXZUX8timFxROh57iiG1NCJMXHgOn5m5xBOc2BA4XQj0Bg9SpmomUJw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8784

On 17.01.2023 10:11, Juergen Gross wrote:
> This is a first run of post-XSA patches which piled up during the
> development phase of all the recent Xenstore related XSA patches.
> 
> At least the first 5 patches are completely independent from each
> other. After those the dependencies are starting to be more complex.

The same was said in v2, yet three(?) of the early patches were
committed already. Hence with a look towards committing I wonder in
how far the 5 above is accurate.

Jan


