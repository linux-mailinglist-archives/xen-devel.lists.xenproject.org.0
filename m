Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9789C7D6433
	for <lists+xen-devel@lfdr.de>; Wed, 25 Oct 2023 09:57:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.622664.969691 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvYlI-00048W-Ci; Wed, 25 Oct 2023 07:57:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 622664.969691; Wed, 25 Oct 2023 07:57:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvYlI-00045n-8v; Wed, 25 Oct 2023 07:57:08 +0000
Received: by outflank-mailman (input) for mailman id 622664;
 Wed, 25 Oct 2023 07:57:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=e1rq=GH=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qvYlG-00045h-LL
 for xen-devel@lists.xenproject.org; Wed, 25 Oct 2023 07:57:06 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on2060b.outbound.protection.outlook.com
 [2a01:111:f400:7eaf::60b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 15abd77f-730c-11ee-98d5-6d05b1d4d9a1;
 Wed, 25 Oct 2023 09:57:05 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DB8PR04MB6954.eurprd04.prod.outlook.com (2603:10a6:10:11c::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.14; Wed, 25 Oct
 2023 07:57:00 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d924:b650:a2ad:7b25]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d924:b650:a2ad:7b25%3]) with mapi id 15.20.6933.011; Wed, 25 Oct 2023
 07:57:00 +0000
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
X-Inumbo-ID: 15abd77f-730c-11ee-98d5-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xs0a9UeWWK7UGs05jr9pJDxJbeD+0A85Ed2gTkpRE7lNKOog+xtFxSilxx445fdKnNcRQhU591Akbb3yQjwrJ3b9JRtMOXkVbVtRQHdNoPBJqX2GpnfrD/Tvk6o5Wjh+IxkgjuVORSO7YcKf7A3p6IJDsxxUayMZjL9nfT80c7i//64NbIwQ/+oi1fi7++r8jSolbo2FecqqqaMEK7R21ih1YV7JEi7a6ZWwvvx5gfs+pCvLOgMq7PNEoDLdYuWwpz75zRgs0upDGVpgErdY8aPEFjMYmWVpZfz5kGgpkMTKUGBXtXpY67N5SConwB99TBcXxqRlKXFDRFPqrAlycg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vOZ01sg+PZU3KcQUkP1hOk4ZuRr6eFjI/iPRTcO+Rbw=;
 b=k+TwHTs7axWPUpHHPrr4oYU6X3gP9lBFalj7DS4c4Bn86VAM/t/B2UJOkkPQOu5MPxhLIKTG9iPlbQIQcWcBe+Gmw7lAeUMCyg7lONzGBeaUX1YvsWB0cTqS/Kw7bU9t8w+D3/OyxlWbVadgLpnHC3eAu8Kdqsi0BAQxgObAuDbkjcrLZy3k1bvs5Fv8NfRc+mqRUdPzI+c0WfRWsWTN5oZQ+XK+n02rIA9fCOrpaD5fRwhOCVlWBEaCkvJFERfuw+pm9A1syOoeZUqsP3eZ4HR+yd1ToNVIFZa+S+RbbMyn+KKjZxa1WxKs0zac2JCd1Cu2N6uHgTdegS/KqKMVFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vOZ01sg+PZU3KcQUkP1hOk4ZuRr6eFjI/iPRTcO+Rbw=;
 b=q2ObA6JEm0iFqz0D8mF3v/mZ5TG33tUTzf7reei/LRDv0sf4E/837qzERk8igxPYgWRMhi39sRu2f9zImOzrKqrNdZg0Dc/UPuiUNR6z2G8qA84ZtHvniiZhUjXX8i0V8n3XxbKZYWZdQzAy6zxFJ0YRcBBvwJKMO+a83TfYPq4XTxbZXm/WP2ApCz/2EtwERbV5NjgPCCiwE23c4WuRwYYGqgkYBYDfIctN/4aUzuiJdjCLqv+oH2UQMOEIWOpt6jtqJgyllerSEw/M6DqFIz+nCCq+vrd9vFbH+2rqx2QxZ9hTa0Stv3/PHip8JKKrQ8lzYfSlLRQqgY6EE17EBg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <41562c7a-6260-3104-b2d4-d6fd4df0cffc@suse.com>
Date: Wed, 25 Oct 2023 09:56:57 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [RFC 1/4] x86/ioemul: address MISRA C:2012 Rule 9.3
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Nicola Vetrini <nicola.vetrini@bugseng.com>, michal.orzel@amd.com,
 xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, consulting@bugseng.com,
 andrew.cooper3@citrix.com, roger.pau@citrix.com, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1698155925.git.nicola.vetrini@bugseng.com>
 <76c9f78179a8bb5b4f99b34f163933394f79066c.1698155925.git.nicola.vetrini@bugseng.com>
 <60e26ad6-7366-2604-e9b2-ed401cee6e73@suse.com>
 <alpine.DEB.2.22.394.2310241317030.271731@ubuntu-linux-20-04-desktop>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <alpine.DEB.2.22.394.2310241317030.271731@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0264.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e8::18) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DB8PR04MB6954:EE_
X-MS-Office365-Filtering-Correlation-Id: dc3d5f15-702d-415f-dcbf-08dbd52ff7cc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	lnxMKm+1TlKSydYGYXoPtUZHmkwN1jssi4Hzj8yelqmenkeWF+AHtNASSriOTfuCkGgMdtI9Us33xac7rYDUnwGlWmeds57BsrrHpkQKa+zBCUwcXtAnenXzuhJwcgMOVfg6cCH61lpAsfAGJ1gziUtmk4Rwqww3bR38Xb623/OwIRukjVs+AAx0iXoQIaCKrU24oVYgXNmfGVuKABxKFVVdu887FW4zzLkUlAP7lxwauBiC8fkd4+xVvmDQku/JTEkGutPJXfikgc2maCjttdwPw1p7lhz9RNlafsxz01ADq2KbNcw80JelAoDEg2FNINd3OFEsAQ4BtGDuwVAK0JXx5hJgW9TSDVV4MIaLHvQ6ogr0jR4eRmhzeLKqdqcuKlbzxD7ZyMdi+vugt+ElWNzQpZdl4e5DJmwDMvhYHTo8gf/I4XLVJD/I809tzaXtne1PLMM+saxCV92p8bG2kElMjX3UAbU9F+uGXaYh5DjwWOosl/jlzeXAYmmvoaFYVMuYUMlZ7QNZSvROhfm2jK0moVv/jOaHl/mnJCz/+2i5O9OfqNDLsJmPDUkW5zWfZVsMK5L0Idhps1EqRndcPA/TNJI575tVfnsdk/1p7wCGd1S6YYoEtvMbJq1i0EfajtaFkA6kFdmvlpKyXxrfyA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(39860400002)(136003)(376002)(346002)(396003)(230922051799003)(64100799003)(451199024)(1800799009)(186009)(4744005)(66476007)(316002)(31696002)(86362001)(2906002)(38100700002)(6666004)(66946007)(66556008)(6916009)(2616005)(478600001)(6506007)(53546011)(6486002)(54906003)(6512007)(4326008)(7416002)(5660300002)(41300700001)(36756003)(8676002)(8936002)(26005)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bUdNMXo0VUZXdWhTb1RiZHhHVWV4NU5KUWFJYzlhWnlkMWhNdDJ0a2Z0WktF?=
 =?utf-8?B?N2hDTlpwTjVLbnpWckhEdzJiY3JkKzJtTUdDZ1BCQ216bkg3Wm9CVUczUUVi?=
 =?utf-8?B?eVFtOE1GTXdXWlFRaFNnS2VqL3lwb3ByakFsMnVxTnVpTTV2YTJiT3ZYdk5G?=
 =?utf-8?B?ZkRqbDhoNXhYSkZ2OU0vNDh3ZkhvNGkvY0VOZm16NWs0TzM0S2lpcUNEN2sz?=
 =?utf-8?B?Vktmb3UwVnlsR2RzZjBvRzJTN0N6VHlFWjBNNlFSc1JJMnk4QmFOdXMzaDMz?=
 =?utf-8?B?UGlWT0RNcm5vNzg1NFpSQUNNTUx2OXR6U1hLMXZ3NlJ2Yzh5WTl2TmRCK1F3?=
 =?utf-8?B?NXgyUElIN3ExZnF4YzJNL1FQV3MwSE1uNmFrNy9LbEJkR0dXOGJlMUgwUVRh?=
 =?utf-8?B?aXpzWEZySmpaODVzUDNzUzF1T2dxcGZIZzdiZ3lxT0VXTzRHc3ZlUWFVRVoy?=
 =?utf-8?B?ZlRLd2RDNGtieWZBWjRzeVkyOTY1dDlGalNTVzhRUmJEVTV2R29tNUcrbkww?=
 =?utf-8?B?SGFpTVdIN1NLT0JGK09KcEZmaUtGd0dtSDNuZzJ1YlVaUDJlOUU1dlVJbFRo?=
 =?utf-8?B?SUI3M1JKNlY5cjh3N1hJNUtSS09SeHhDUnhZcFR6UllWOWVqSEpqdzk2bW9l?=
 =?utf-8?B?U1ZmZ0llOTdLbzVNTE1Ldmg3UFVRN2VwMkxocmxMR05TOGFQWitSanB1b1NW?=
 =?utf-8?B?ZVJpWUpCeU8vT2hEbExNMjNFR3F3bSszRGp1WkpKZUF0NkZnSUZ3bHF6Z1Ey?=
 =?utf-8?B?YWl0Mkh1Uk5wU05ZZkFjRTJuZVVyczFIQTI4aHNGZmlZVURRaGVRenFkV251?=
 =?utf-8?B?MXBiRUFaRU9vd2FUS3M4UXJNYUZkOHRQVFI2SjFPQjJtRzRET3N1RzN4a0NB?=
 =?utf-8?B?bkRkV0hhaWxLSnZOeG13UHFFcU1EY0hSakgvb3hnVGF3Q0NUaGZGVTY0UERi?=
 =?utf-8?B?NlJRK2UwcHczMnVBeHd3UW5DU01xNmRYcnM4UUl0NXNtMjdZVnNKaktLZmts?=
 =?utf-8?B?cHdqTklZTVRJWEdWSEVOc3B1QlRuREY2eWdWSDNnNTR0dStOd1J6R3NJVElN?=
 =?utf-8?B?Mm81WWF2ZWduU2FzWnlBZTFlQ0tlSjFmTmVmMUVsUURKQmUxS3NzOXVLOU01?=
 =?utf-8?B?aE5GK20wRng2Y1hYRDA0MTMydW5aNGJldENlNEF1dVFqSndzRFNzRlh6djgr?=
 =?utf-8?B?TDFENzNDbytvdEtjcDJaYVZoYmFNRzY1d3BXQlJHazJZVXpzMjltYTBkTisx?=
 =?utf-8?B?ZjNheml2UTNpUGhQK1hmMVYwYmkyakEraHRZa2xHOTBzOVJCVUI0aS9HNnNp?=
 =?utf-8?B?VXJwVk14dm5GZ2trUkNZZFFSemFCL0FvVHAzaTA5MldnT3RhSmxtdWR4Q3Ax?=
 =?utf-8?B?Z3I4bEtEWmZ2UmY3eWZ0dG5jc2kvUFh5Y2JRSzE4NGthRmNtYytrc0NMNXpH?=
 =?utf-8?B?d3puRGgybjVoclQwQXRlNGVtMkVpWU4yazQ2b2FmQkdFczF0Q0JhNTNkaXNJ?=
 =?utf-8?B?ZnlDaVhwNWFDVDV0eU9SbmRnTFBWalFPRkRreWZZT3Q3Mm1zR2RUcHowcVRp?=
 =?utf-8?B?SFM5YWNFOVBYT0FTMHN2dXNJZnFUT3lOamgyNXorWXhrMzFmN2lPU1hvNzJV?=
 =?utf-8?B?U0l4OFFhQldhMzdYT2tHMFZCUmtwaHhFamgydTBTS0ZRK2NmRFdVZGlVZHdG?=
 =?utf-8?B?bll2MTdLZjVEYkVXU2RpM0tqU2cvWWJUdjdCbXN2WmdNWW9YUmlSTEk0V1I3?=
 =?utf-8?B?RE40M0xrVVpSM2FxcHY0dnhtWVJDazFPTThpb3NXNXgyY1hPN1RwSGFpQk9N?=
 =?utf-8?B?UGtKcmhOMitsM1hsSC9OQXVpa3BJNWsrMlZJSEJ6QzZhVXRFTHAyQnYxMmxG?=
 =?utf-8?B?SHBSMFBiN2RaMXFXTys4dkhHSHlNcFZSMUVxUTAxUHN6Q3pPbWpYSnMzOG5h?=
 =?utf-8?B?K1Z2dDU0UHkvZEk1UEYxVGJwTko0M014YXRXQ2J2cUJYbGRtUGdqOXk0WXFa?=
 =?utf-8?B?ZnlycGFrU3R0WEhScDRGNXl4enpvZ1lIbkxTUittajRESUkrZkJWZnN3UytF?=
 =?utf-8?B?TzBJcVZjeE1ObWg3ejlCM1c3WHFyYVgyelQzTGxOTEQzU1FMUlkxSVUvcDVH?=
 =?utf-8?Q?l//XF8kZ5gXpKY/o7rQrhq6ow?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dc3d5f15-702d-415f-dcbf-08dbd52ff7cc
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2023 07:57:00.4976
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gozcv4FQPwM6K+TYGFxl/FtUW1MwFkkQfRW2YJaGi2oN8QHgn0jaU4KkBZnoqekhdHjqCyf+pYA/W1x9IFTSiQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6954

On 24.10.2023 22:27, Stefano Stabellini wrote:
> On Tue, 24 Oct 2023, Jan Beulich wrote:
>> On 24.10.2023 16:31, Nicola Vetrini wrote:
>>> Partially explicitly initalized .matches arrays result in violations
>>> of Rule 9.3; this is resolved by using designated initializers,
>>> which is permitted by the Rule.
>>>
>>> Mechanical changes.
>>>
>>> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
>>
>> While not overly bad, I'm still not really seeing the improvement.
>> Yet aiui changes induced by Misra are supposed to improve things in
>> some direction?
>  
> I think the improvement is clarity, in the sense that the designated
> initializers make it clearer that the array may be sparsely initialized
> and that the remaining elements should be initialized to zero
> automatically.

That's as clear from the original code, imo.

Jan

