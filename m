Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 64CC57565CC
	for <lists+xen-devel@lfdr.de>; Mon, 17 Jul 2023 16:07:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.564598.882125 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLOsJ-0000QS-HH; Mon, 17 Jul 2023 14:06:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 564598.882125; Mon, 17 Jul 2023 14:06:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLOsJ-0000OQ-EN; Mon, 17 Jul 2023 14:06:55 +0000
Received: by outflank-mailman (input) for mailman id 564598;
 Mon, 17 Jul 2023 14:06:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hD51=DD=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qLOsH-0000OC-Ov
 for xen-devel@lists.xenproject.org; Mon, 17 Jul 2023 14:06:53 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01on0616.outbound.protection.outlook.com
 [2a01:111:f400:fe1f::616])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2e28983a-24ab-11ee-b23a-6b7b168915f2;
 Mon, 17 Jul 2023 16:06:53 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PAXPR04MB8080.eurprd04.prod.outlook.com (2603:10a6:102:1c9::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.32; Mon, 17 Jul
 2023 14:06:51 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::9bd3:48c9:ff58:9880]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::9bd3:48c9:ff58:9880%4]) with mapi id 15.20.6588.031; Mon, 17 Jul 2023
 14:06:50 +0000
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
X-Inumbo-ID: 2e28983a-24ab-11ee-b23a-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BSRPvNlcme3jzqx6cWnn4PyHbCeQrTqhPyXfuwUL/r2PrlusvoSOAvskkuTzMi31Oc37SxQ0Q+EtkWoJ4lLPZQt0C94v0FkPRtEh569R7UGZrSyaNw6klS40DEdxZL2dOVBNiZ38oaM/OGhjV6oTDVWcySUYy7ZfhhTFZHCHJCgW1pOI2kKqRf7IiAsRRH9rILbeZMxGmuoMeMAkS8EfhWlDPGxZgguzsgK7dm1+fXnYnI4sPVyUs9ww1QN4N8137BRz1+HRLM+Dvw3utOtXKqMV0JcTuJ2iwotuHxHzyLXCp8DiA2/uwPn6thjrEDGOL1+qvBZwrz/RHEWSGYOHcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fDQwFQvoBbaOdP0pTUMUdLxHIzx+97Dnw/VxFzR7lOw=;
 b=mRzIuElab8BERFOlQP1c1oOjMaPwNA4XjotwC8gPBvx0SzJZp/7bb9ZRdOd4+opx6RVmj3cvAzmvDq/+pPejX3lh6HuL0R/fZmNb4lef4bBM+PckWIU673hes5ojxB2ipJIMXWYrTSC4Lri/KNkLiUobpuT4wLoGRevePu96pHUsFjhyeErIrPDONnxJd3BuJp3u91jWUWUtVT8Bi0zZXYqZ6uy676o3alsSua22M5Z9sa4ZTKJd4I236r0IFs4SvNNBEeDNAe2bBC2lWJFDcOKoYi9TzeDyLTJeMFVnmKmfNHAJRgnDpElmKMGBwObKrT+8FtprBvO9uUYXXNeqrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fDQwFQvoBbaOdP0pTUMUdLxHIzx+97Dnw/VxFzR7lOw=;
 b=FQq1+rm0Gay0wDMKzzbZWBRpVyObtS1TQ6vcSUXT4G1g/Gd8YYiDpCv6tEo3lf4XW/w/4NrqyYJbwmUqsdJXn2csZyLIXFi/0KvcXRGSQAcLMeW7kfxFAN4Cg80TgFNxuTLZMmqsxTrEsMAFmY35YZI+pfrVXJZmcsTH9WU9Hgh0ZXI+ezspO+taE0jFnVXcgC5IVSu8rD4yuXsAEP87yUnlrCcBwto3sxkNQ/I3o24qLrDnWTNVyH10uKPdL5432VzfscB5LZUH1Lb3zhOPgluLKNwArrxFc9Hscy3U4/Cm+eButhEudMcMmeOKZHxpFs5MvZYMtH9Ybnaf+BlXcA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <c89d59de-4aaa-7b60-181d-5c3658181b3a@suse.com>
Date: Mon, 17 Jul 2023 16:06:48 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [RFC PATCH 2/4] xen/arm64: bitops: justify uninitialized variable
 inside a macro
Content-Language: en-US
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "michal.orzel@amd.com" <michal.orzel@amd.com>,
 "xenia.ragiadakou@amd.com" <xenia.ragiadakou@amd.com>,
 "ayan.kumar.halder@amd.com" <ayan.kumar.halder@amd.com>,
 "consulting@bugseng.com" <consulting@bugseng.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Luca Fancellu <Luca.Fancellu@arm.com>, Julien Grall <julien@xen.org>
References: <cover.1689329728.git.nicola.vetrini@bugseng.com>
 <d06a312944bee7457fa2ac75e0cfef20f0ec430f.1689329728.git.nicola.vetrini@bugseng.com>
 <d1ccb5e1-d122-88df-e46a-39494b6d6d12@xen.org>
 <299D0BAE-D15E-4260-AF3E-8D84CF058083@arm.com>
 <528fb310-f469-e449-d1c3-269fa7dec750@xen.org>
 <2bc64be1-10c0-d064-a5a2-1f076b596e6e@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <2bc64be1-10c0-d064-a5a2-1f076b596e6e@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0072.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4b::23) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PAXPR04MB8080:EE_
X-MS-Office365-Filtering-Correlation-Id: 5484958b-e5a3-4172-3503-08db86cf112f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	P9vX/63WarB6wMO89hSa6ZuZHqv5/Vf8svCmG5iGCrxj+7F7hxpI0d/pDJNaeNfM7JdZbm2qXiR3RdsKlM75EJInkdlqcbdw2LsqhJb9pbl31TZUl2x4RwDbGB+6XQAPrUrf2koE8niX7WeX1DFvylv4PUMI5GfQaRAyBc5OGS4+Mw7h4h+hW+blRYxRuU63oT8aQfFlsjjROeMOI3uUjKvyJh9EZNFPQrQmwmiDTKBbP4FEp0eyJTNcgvbdtBFktu/oxNk8A0qJYRL5+ltGSH3RxWQDt4rh/abFZgEFxxoT2B0NsplPrpQ72kjLfMB06KyuB6Wb/GLaMl4RuS8mwBavTrJcB6wGbs0o9lh95e30elXS3Qr6tfyo0WHTOcHnBKKdZ3/L1ac7ef+Njw4IhGytUnfqFHMjXuO25PgBEUO+dw2aMYvRV//Q5NcQEVNRI7cPBmf2KUSc9hOltRu6D3KHeKmgC/hTz3+1PDpwm9GnXkE1H4qBYj10/6TfVwwl2xJt63zVfclocL2Jqos0yewIAKUEj/7csD2zTiGrB7OUUn52WvqW8oVTeyMAhJmOaFuDof4PC5Qf13TT4/QqB+Y8PBCRictt6T+kSo8mncIKidvBaP+mrpiAb75Y0638PtGLRmV4M/Zu92uit0Pkew==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(396003)(136003)(346002)(366004)(39860400002)(451199021)(54906003)(38100700002)(6486002)(41300700001)(478600001)(8676002)(8936002)(5660300002)(66556008)(66476007)(6916009)(66946007)(316002)(4326008)(2616005)(186003)(6512007)(53546011)(6506007)(26005)(31696002)(86362001)(36756003)(7416002)(2906002)(31686004)(66899021)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cDVCL3o5ZnNhbERRQUtZTXltakxvVjhZaWlzNzZqWUZuWEY3QTYyQVBQZVFO?=
 =?utf-8?B?Y2JXUnVmQU4xQm5IdEkyU0Fxam0zR3VpYkVNSTZQczR0NUJUNVVNdEQvSXRU?=
 =?utf-8?B?SExaWHIxMzBiOHlvZkFiMy9Ta0ZkdWp3TThMOFFrWlVRUENJUHJFQTVCakpR?=
 =?utf-8?B?MUJ4U2lPNmI3TUFieGRNd2ovTXlYRmFsU1V5a0pUSU53NmdITGNJS2w5TkxE?=
 =?utf-8?B?RmxLRjh4SnBXQ1VXZCtOa1ZVU216K2VBNWNyU2cyMm8xek1VMXdWbUZuNGJN?=
 =?utf-8?B?MkJINmdEdm81M2dRTW4xdTRKb2VLekVKQ3JOS0JUSU5RVzBLSmMxVkU0Zk1J?=
 =?utf-8?B?ZUFqbXZSRnFXWjNPNTNqaWt3L1lFamY0ZkI4NWtWVVJLWmhyUTIwN3lPalNW?=
 =?utf-8?B?bzZBazdyR0tRejI3N0pxakEvYm9JZml1NjJKdTZneVNySnBSRTZnb0p2VHV4?=
 =?utf-8?B?TitNSVF0eEFMTnBuM09wVlRYNWdKRXpxVjBIeUE4bDFKcFI1d1dEUDZEVzlC?=
 =?utf-8?B?OXBxbG9uVCtUajc1L2U1a0hoY1Nsc3RYamhJK3EvQzR1UW45c3dGcVA1OGhO?=
 =?utf-8?B?aDRoY3JRTThwS01aV1lXZUFJSlhibFdwQ1JsWkdMYzB0Z2JwbUhNWTZsMnlh?=
 =?utf-8?B?aCt3aUJqTXZhTHpVT1UwbjUwYm03U2pYazNEeVVVRm04WXUyNmtvRlRzSDhH?=
 =?utf-8?B?S2ZLYStlZmlIcEFseU84TzRzK2ZPWmQ5bVZBNHJtbXdEZUpaQmc1M2pPYVpT?=
 =?utf-8?B?RzlRSlhoSCtCS2E2aVUvc2Jib1pMSzdaYXlrdzk4WURSbW5UVTh1WWt3OERn?=
 =?utf-8?B?ZHYveTFlZjBTbkw2cnJ2NWFRZHBkbjF3RXdNcHJtUWljaVowZUxXSk9pUDQ1?=
 =?utf-8?B?czN2aDdoZkFnTnJyUXpZbFc5RWdRcVVFbFFnMlR1RUtnRkxlSC9odGlEMW1V?=
 =?utf-8?B?ZG0rd2tZSDdLQmsvMHhJeHMrdGR1RkxOS1RPTm1hWGcvL3BTemt2R29oNDNL?=
 =?utf-8?B?OHRkZXJDWXRORk52dDEya3d2bnFyL2d2b0NkZnVhbWVvVHV4VE9wcnVqVHZy?=
 =?utf-8?B?TG9KTll1WSs3a1JSOUx6L2hqTmJUMW84bmh3MWFwL2pOQ0VtSlF6eW4zMEN2?=
 =?utf-8?B?amlud1hmczV6bWdYVCtXazNHWHV1VXhsaGJ1emgzNWFVa2NFUW14Vnd6aWxQ?=
 =?utf-8?B?YWphdHgxZDh4aWl0bEMvYmpTZk9xUmNNTndWYmxkcHFzbWN4U0pleG9kREZ6?=
 =?utf-8?B?MG1KeTE1UEdZTVpOcTBEMFdBMWNUNG5VZUpRSlJKbG5FNS81aGtuUno4TnNp?=
 =?utf-8?B?OW54TVpJc3UrRGhJaFVMZWZWY0F0Tlp0V0VIVDNES0F3SUtjQjJNUWM0Sm1u?=
 =?utf-8?B?azcxMUl2L3BPNTQ5WkVFd1c0Rit2ZWg2UC85SXp2QStTVkMxd2taOGgwb2NH?=
 =?utf-8?B?c09RWFd0bDF0Uk9OWmxDNkhCVVNOWmRwRUlGTk1ERlNzMmlhSk5uQ3lZNW5j?=
 =?utf-8?B?dTFNMkNtblA3VWwxOGtNOS9qU2NNWlp3akZvRHI4RlBoYlc4alhqbmJ0VUpY?=
 =?utf-8?B?L2xZSmZYZkE4bHdOelFBcHIzQlRSOTRLN2xRTm9MRmtOdnhUeStvdWozZ1Nq?=
 =?utf-8?B?dzZYSGJKMFlqdlFYSFE1Sjh2SXM4OGlvblhsMURPNGU5K3VJRzl0SXRwRHo5?=
 =?utf-8?B?b0k5Y0U1bTR4WEtYemVTVWFwZjFwcFJVL2xKZEQ3cWJPZFp3K05ybFdYUjht?=
 =?utf-8?B?Ky92Ukt5ZjdPQnJSVXd0eXVxK2kvejJZQ3V1S04zaVVOVlh1MFhWallpUlA3?=
 =?utf-8?B?N3U3L1FmL3l6NnJTbVBPNXlISjByZXVETytNaVZ4VGE5ekVDNWZMUnZqSUlN?=
 =?utf-8?B?RzVsMEYyUE9JSTZleTZnWHk1UWNRSE1KOFZ1MlRrQjhqa0hMZHdVR3cxYlVD?=
 =?utf-8?B?bHM0d01QRE1ySW9HMWVVeEFudlJkV3NaNGhLVGZlSk5vOVpsT2Y3QllldUVV?=
 =?utf-8?B?YVVRK20zWHVNQkRtVDQvK0NJQlpmSXFwY3lzaGNXWDhua0N6RjF4ZDJCeENY?=
 =?utf-8?B?M3hZbDF5Y20wVnAvSEUreERaWmM1TE93M1hYcTRPakxaNDZOTThQQlYvdU4v?=
 =?utf-8?Q?fSqyrKIhV4Whly6POlICTOucd?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5484958b-e5a3-4172-3503-08db86cf112f
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2023 14:06:50.8677
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4agYxlvHTx7fMtJZO6Ba01vFaQ7cfxMq+N9bau8wxkcbSOLh52ptSiD2Elx0tI+L8LYjBxsIsU9NN9+LaUCdsg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8080

On 17.07.2023 14:16, Nicola Vetrini wrote:
> On 16/07/23 18:50, Julien Grall wrote:
>> On 16/07/2023 10:20, Luca Fancellu wrote:
>>>> On 14 Jul 2023, at 14:05, Julien Grall <julien@xen.org> wrote:
>>>> On 14/07/2023 12:49, Nicola Vetrini wrote:
>>>>> The macro 'testop' expands to a function that declares the local
>>>>> variable 'oldbit', which is written before being set, but is such a
>>>>> way that is not amenable to automatic checking.
>>>>
>>>> The code is pretty straightforward. So I am not entirely sure why 
>>>> Eclair is not happy. Is it because the value is set by assembly code?
> 
> Exactly. The reason why I didn't just state that oldbit is always 
> written or never read before being written in that function is that I 
> was unsure about the meaning of the assembly.

So I'm pretty sure the tool wouldn't take apart the string literal passed
first to the asm(). Instead I expect it goes from the operands specified,
which for oldbit is "=&r". There's nothing conditional here, so if the
tool didn't trust that outputs are written, it would need to flag such an
issue on about any asm() having outputs.

I hope the issue isn't that the tool doesn't properly deal with the
do/while.

In any event: I may misremember earlier discussions, but isn't this a
pretty obvious false positive? In which case didn't we mean to flag
those as such (because really an improved checking tool could avoid them)?

Jan

