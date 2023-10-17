Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 63AAB7CBBDE
	for <lists+xen-devel@lfdr.de>; Tue, 17 Oct 2023 09:02:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.618077.961338 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qse5l-0003Kp-WA; Tue, 17 Oct 2023 07:02:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 618077.961338; Tue, 17 Oct 2023 07:02:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qse5l-0003IJ-Sq; Tue, 17 Oct 2023 07:02:13 +0000
Received: by outflank-mailman (input) for mailman id 618077;
 Tue, 17 Oct 2023 07:02:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ibp0=F7=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qse5k-0003IC-Cf
 for xen-devel@lists.xenproject.org; Tue, 17 Oct 2023 07:02:12 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on060f.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::60f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 172d9cfd-6cbb-11ee-9b0e-b553b5be7939;
 Tue, 17 Oct 2023 09:02:10 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PA4PR04MB7502.eurprd04.prod.outlook.com (2603:10a6:102:ef::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.36; Tue, 17 Oct
 2023 07:02:06 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d9c0:d907:4d2d:15b3]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d9c0:d907:4d2d:15b3%6]) with mapi id 15.20.6886.034; Tue, 17 Oct 2023
 07:02:06 +0000
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
X-Inumbo-ID: 172d9cfd-6cbb-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WDjj0F7JnG1TYdsW0DajpjMFENoBxE97d2A8vtKLuqf+ZrF5JKJ9QxXzLkTT51+NMF3Tno10B9RYOpwIzHBYub0oH76QnnWP6h6xDgw13keLOLvuOgh/NA9OSu9c3S40Xu94Nvj4Fwsu4UmASJtvvdZURgL4w6mEg3I/509xADrTmPk8ggIs1NZ93G82yo/lZ9cx0Id7lfsCvfi/zdmcrJQ+eFNRxIaHr+rEpgLnGQ+fYg5IJ0vd4Yr40zVcx4YGkcAgFCuhu2mItMopSN7W13HuUhY20cwngenffQWyB3bMRAQOPFIb/qgbI3z5krQr9/rgBSopoREUDFSRUh2ucA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Lg13GoIsI7dB1FWZ5xU2D/AIk+2JTmUdJE5NNUtXe7I=;
 b=UXvBa5bJc6rM9gAA3HlxmfmrMk9cPCEB3xZm2ti9ooyyCuEbn4ij4QF+M/sp2on7kwXjVXmv3SoiaYMlqxIqXLZYDV7ddmEkWuES5K+Z7YsFVxFGfH/rlmUKog2eXKnlGHN7BebDiJ7K5vUvRYvheh40SP63w+eITxerwCWUQEcQXyYya2FOQY8DuT94pmNZQcvUnZ6WicI2sC7EyYLzo6UJdD8gjk1acAKhRBTEtFkfrzMA1qH2L9bQqt1U1Ij6KlO452asuy/6gHj/qJnOoYrtiQGIKMgmVyWpWbdN4dod5DBTgNeUzyRkYI8MC+57N+3PwVlEJuInMlh0FF0lSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Lg13GoIsI7dB1FWZ5xU2D/AIk+2JTmUdJE5NNUtXe7I=;
 b=y4IwNSoEO7njonx0AqnRtEq6Ou/Wk48dpp8HhDo1MzP61JVEmBXsEqD9BtoRqO0m+ln3T2a6J5Q2t686SAXd3cexaiU71eMLejzkPeuMWKrFRH7nUjPXTP72Qvt//R+0e8JLcKBvcQPVtAxbEw9+I2C3YWVTWMglpZhiWTqWWCrxLwYcBRK9PQHt8XP9UXfCs+l7jS50ShwnTCIEdLNzG8ATgDbNKVMEvsWV4s1CwKEP+Bl5TB/IQm0w0VGvu3yZVahAq74gUQWbpR3eMuaOYyj2pxlW9wC4ncxGaVdqd4eM4+7PAgz1y3YwnWc8TpgKhYLcZEXn3hsBh2yXMItgfA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <172b1f70-bffb-125f-3181-38ce5989daec@suse.com>
Date: Tue, 17 Oct 2023 09:02:03 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [XEN PATCH][for-next v2 6/8] x86/mce: Move MC_NCLASSES into the
 enum mctelem_class
Content-Language: en-US
To: Nicola Vetrini <nicola.vetrini@bugseng.com>,
 Roberto Bagnara <roberto.bagnara@bugseng.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 andrew.cooper3@citrix.com, roger.pau@citrix.com, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1697123806.git.nicola.vetrini@bugseng.com>
 <6622a2ec7079f86b73ae420e1e840d3d35ffb3a0.1697123806.git.nicola.vetrini@bugseng.com>
 <f1f0fc3c-0eb2-81d6-132c-d6b2ed2d7308@suse.com>
 <d417da49a926fec385c95774035dc4cb@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <d417da49a926fec385c95774035dc4cb@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0072.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9a::11) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PA4PR04MB7502:EE_
X-MS-Office365-Filtering-Correlation-Id: e051e80e-00b1-47a5-e270-08dbcedef941
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	GUMoTUspgd+4lzlnux26KRoCieiuXdTxRIqzrH0wvWTcIKZdZApvhQXaPAR9zryWNNBqupqPQWpJhMXKM6/3pcj1EK4ZSOKCG8bAKbNSky1OaGuKd1iEPwO4k2JFVrqmxxVZVLfo9dN7IepcpdNdw48Kzau4MuTvuRZQuWsLQRvGMdLlyEvMUuW7aJ/FI/o80WY/0JevxCnYlk2sLDCcTtV/g16XwMP8mRzcGuyvO5q7lWz0VOTDTZroPDpCxwr2jqDFMnp7luKoRTClZLcK7Gc5zOPZje5mIUo5UeSw6vNJwf17OFMRrfhe8DU1QUITwEue2U1Rj5lGPLme1f2K50zeWcAjv3CRnBoZ44iUXMomyAbBi9eQp4N4m+16H0QU+MHWLRmtXz/mQwVfqvLsC48MIdQ7OT7TLyTGPmbkwbr+K8RHGNVzrScPzzkJKpI3LuYoBqaXCZwmGYg00KXOmZbYXmvckCxFi92vo6Zs/YX+W2VQwP5OU3RBbC+mpiHQYKZ9zfTbu3iXvv/4yCn7kK6wPt2E6Y1NAkJGls37cmenY0XGaoLFPGerXOJHt8JRMDK+mtnutyEnSObcUwt+s5NOdEV65nMA/7rMcgAPVPZDIVx/iMhe0BvX7QOmfSzJ1dIDIh1+wckIF4xmrZ0VwQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(39860400002)(376002)(136003)(366004)(396003)(230922051799003)(451199024)(64100799003)(1800799009)(186009)(316002)(83380400001)(4326008)(8676002)(8936002)(7416002)(478600001)(66556008)(66946007)(6506007)(6666004)(6486002)(110136005)(26005)(66476007)(53546011)(2616005)(6512007)(4744005)(2906002)(36756003)(5660300002)(86362001)(31696002)(38100700002)(41300700001)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SnBTaDU3bm5wZVRGOGlqZlpOcTVlMEUyeHczY1pnYlc1R055UlpMeXRjNHhm?=
 =?utf-8?B?aE5JaUV1MWE5Q2FhVm5JN3ViU01jQWZMcnIrMDI0SC9Tdm0yMDhDR2x4c24z?=
 =?utf-8?B?K1lsd0NtWVlta055Z3FXM3VsYU1SbUN3UU1IWVp0T1E5ekJSMjVveUdIODRT?=
 =?utf-8?B?dEdSQklFaXRvd2NSUGFycTJrTUoyQjh3RXE3NXhYQnhKRDMyTTUzZUx1SEl0?=
 =?utf-8?B?L0puUk5hSnl6SjdtR1pUc3hXSStGSC9ERUVjS0ppN2RTWTZacmpKKzVlRUpz?=
 =?utf-8?B?QkF0UCtJczJZRzBsUkt3REtvUGVOc1hlbVhuM3p6blZOQlI3UjQ0MDdhbXJ6?=
 =?utf-8?B?QXR4ZDg2UUtYVHNqbHRGRlBwNnJDRDdCSXJMcUxZNDI1RVUwdnRDazdTeXBL?=
 =?utf-8?B?OWZIT2w2YXJrMXZVdnFUOE5DMFVLL1AwK2w1cUVDZWdqVFkrc0Zrblh4R282?=
 =?utf-8?B?bUJsU3hiQlVDdDEvRlI2SEh1eG1QWTM3ejREZUhBYlF4bkRvRm5jMHZieWcx?=
 =?utf-8?B?Zi9EN2NFc1FKSGR6YlUzdWdiQ1JwNStRaWRsdWtOR3hwcFJ3Q0NKQkhNeHk3?=
 =?utf-8?B?ZHM5NGZaQlFQaWxpbVJiVW1BbkxHc2VoYXlVemNxc3FmY0VaNHliV3c4ZXNM?=
 =?utf-8?B?b1RTMnp3QmpJTzJhb3hEMXpVVFd2cjhvVHFmV3gxWHBFKzJmQmY0RDJoTVZq?=
 =?utf-8?B?SVRwb1JTZUsrRmIzUTlrSjhLbHcwYTlFYzdFV1R2N0VIY1B5djVoVU1HdEl3?=
 =?utf-8?B?YjJnUTh6aTRtQ1ZiSTIybWIzMG9NMGx0YWUrYmliU0JiZnU1U2x2OVBSdldK?=
 =?utf-8?B?OUlnRWRuQjN6Rm4wbFhIUHRWRlhXTTJDMWJaeU5NMVRGQzU4V2FoWm13MTdo?=
 =?utf-8?B?S1hqbUQxeVBLVVVZK2M3WHNqN3dwSEJGaHNVT3cyZlI0YjVJY25EUitWRGtM?=
 =?utf-8?B?ZjlGeXN5UVVsV1luODlLbTB0VUY0OVYxNDFuTWt4Wk9hZUtlejlhNEhwOG5T?=
 =?utf-8?B?TGFpcCtGd2JzUVp2d2o1ZzB2YWliY3pXRXR1Yk11Mkw1UGhTS3R3OXBXck5a?=
 =?utf-8?B?L1JjbUZYYzE5aXI2bE5vL3RZeFpXOWF3VGs1UmhaQkM1VlhJdjMwNDRSenRk?=
 =?utf-8?B?dlRhTUpSWkpEZXpKbkRFM1d4cEZPVmgxaVJ0QlFOQkZLVkMycHVNYVZweDlm?=
 =?utf-8?B?dS9iNTZRejgyK1Q4MFpZSlBLRHovTVE5NStUOExzY1FramFKUFQ5M1dZUEp3?=
 =?utf-8?B?M0VNamovM3NMb24vSU9GMGNpdzRkVHNmUUdMdmNaeXBnQmYrRVRKdmhvMUI4?=
 =?utf-8?B?RUVLUE5xcHZvcWFZWG9KYUJNOExJc0hReXBxeGwyWlorUTZPcUNDTXRJT2pM?=
 =?utf-8?B?SGJEMGF4NVdZS2RuRzFVdkNXWDQ3cFdVR3JmV0dhNUZIbStQVENOMm9MRU1O?=
 =?utf-8?B?bVdxYjlxUEg5TzdjMTc2THQ0SnIrc2I3ZXBDRFhJRGR5dzE3ejlGQm9ud2I3?=
 =?utf-8?B?dW1VaUJqVmxmUnJZcmU1OG4zTlRtTzlSQThSSjIzaEJvbWM0MjhOUXpTV3Zq?=
 =?utf-8?B?QnVIZ2xvdlUva0F2eDdmMGhwU0Nld0ErdUYzWjVLVUVIRnNCcTRveC8wVGlL?=
 =?utf-8?B?TmMyRFc2bDF5aVBQdGlEZWlCRjRkWjBCZXl0UmZBVnVmMi80S3NqQi9DS2E0?=
 =?utf-8?B?RkVsNHczbVptOXNiSmVzOC9kektVZ1I3VGhFa1Jtc3VmZmVGK3hiMWl6L1RN?=
 =?utf-8?B?M3g1NFhWWWVyUTJScnNZT21jM3dzcjdBa3pBRkZjenZFam1xT0RSSFpOMnln?=
 =?utf-8?B?Y1UyRkJoT1A5MDEwdFFRejNaRDJ1SUJITkZSOTI5L3dmcW1CeEc4emFiNGNz?=
 =?utf-8?B?QlRIeHk4UFJ1YkUwTlRRN3o5L2UvMVZtYnlpekk5N2N0U2VaVFVpcUtaSnRi?=
 =?utf-8?B?a3A3TDk3RHo2TVJkYTNlZGFXK2NJMzRyV2V4Nk9SNDZuTWpiQ2JMNkRwQzN5?=
 =?utf-8?B?YWRINFVBb0N4c1FvT09qNXhHamJHT2d0WWVLQnIrTDd2UDZSMUZaUUJOVXRQ?=
 =?utf-8?B?NGh2WUxsVEk4bkxWTTN1MkxycE9IZllhRm1XWVFxcFBJY1ZWR0k1Q0JyTzJF?=
 =?utf-8?Q?JcHiG48MeMR5LM+8Yolob/7O9?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e051e80e-00b1-47a5-e270-08dbcedef941
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2023 07:02:06.4859
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4OSg/epZnFpivtDnbNUxHjAn9A7OcsJotY9cTfvl+L/1RBnehYajfr6Vok092oPwpekd0Bj7z3tCalTnPONDNA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7502

On 16.10.2023 18:05, Nicola Vetrini wrote:
> On 16/10/2023 17:45, Jan Beulich wrote:
>> On 12.10.2023 17:28, Nicola Vetrini wrote:
>>> The definition of MC_NCLASSES contained a violation of MISRA C:2012
>>> Rule 10.1, therefore by moving it as an enumeration constant resolves 
>>> the
>>> violation and makes it more resilient to possible additions to that 
>>> enum.
>>
>> And using an enumerator as array dimension specifier is okay for Misra?
>> That would be odd when elsewhere named enums are treated specially.
> 
> Yes, the array subscript operator is one of the few places where an enum 
> can be used as
> an operand (also because negative values wouldn't compile), as opposed 
> to mixing them
> with ordinary integers.

When saying "odd" I didn't even think of negative values. May I therefore
ask for the reasoning of why this specific case is deemed non-risky? To
me there looks to be a fair risk of creating undersized arrays, leading
to out-of-bounds accesses.

Jan

