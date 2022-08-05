Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9683558A8CD
	for <lists+xen-devel@lfdr.de>; Fri,  5 Aug 2022 11:29:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.380927.615374 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJtdp-0004xw-QQ; Fri, 05 Aug 2022 09:29:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 380927.615374; Fri, 05 Aug 2022 09:29:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJtdp-0004w8-Nh; Fri, 05 Aug 2022 09:29:13 +0000
Received: by outflank-mailman (input) for mailman id 380927;
 Fri, 05 Aug 2022 09:29:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=s4Nu=YJ=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oJtdo-0004w2-CS
 for xen-devel@lists.xenproject.org; Fri, 05 Aug 2022 09:29:12 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2067.outbound.protection.outlook.com [40.107.22.67])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 10176a9b-14a1-11ed-bd2e-47488cf2e6aa;
 Fri, 05 Aug 2022 11:29:11 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM0PR04MB5202.eurprd04.prod.outlook.com (2603:10a6:208:c6::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.16; Fri, 5 Aug
 2022 09:29:09 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::d475:4e1c:e4df:495b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::d475:4e1c:e4df:495b%3]) with mapi id 15.20.5504.015; Fri, 5 Aug 2022
 09:29:09 +0000
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
X-Inumbo-ID: 10176a9b-14a1-11ed-bd2e-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IgFE/tN/E2GGsKgXtt1tyNKA5dZp3XMObmMnqB1Af5gJpqAP61fO+JRuUkJLXY0NBJvmHWkM3KMwfOfRi1lMrW6ofJ2vLPkLTkewsN9DU3/5bvHw3srjFoF5JsbKe+Qt9G9Me8WgcTbviLiLyNS3cCFoG/fMbZucokxMIjdm8tNdGK32u5od/3/nb2yVPuTFwEwAMgpc9u9SPQUyyrWjx22c6ZqESKrzYNnW5rZ6AQugGheb/63ruBpvWxrzGyyzb7aRqy34RXxE4e+x5i7LE9mqxMEo59SrU6hq4tDUxqKwDylUnM/5DloGf6vktJHOO/qhF797puhDi5xPftJW2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9ugxw8LhezYCwoJhbYRDo23JGiRd6ZVGAFvSB1KRHK8=;
 b=a7f+UHQC3GaCQE5D57wBrJWZR86fHLtXEt+GUX/lHfrBg4jPnXJs5rqUVLm+htCoSUAVLn/N3cnCb0JxryE1ohagSZtmpTZWsN8Pf/0RcOVANDFATtO2pbGtDk1EiQmYBKQnRyudtS922nGTlk7+kmtAGYWZL2df11e08PbaxCSHWoK7gTdAuDKvBbN74sjN20DemxJwJzuA8dXqkYOuRVpnlI4QC+NYeo+SIaA1xuewJ4zGpKpqzOt4KEFjLKre+YWQuxrMaPWaQl6Z+cTHCc4X09663sGf3idrLmuoFU7In9Zb4thQJb1JHDnpboqsO5tNTVcuC5vCpN57FcRayw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9ugxw8LhezYCwoJhbYRDo23JGiRd6ZVGAFvSB1KRHK8=;
 b=x8jq4CfEeFkttuPTIXwAPVh2p53GRWVroJOGpI0/txtKU1DT4zEW8ZVN45quwcdfs9/84Mfl+5m7UzHWOmivfG40Pq2jyqJQrO6lIC0KW5qbDSghrvMMZyJxuIrFDzzZv/T/70F67Hi94hxGLxRcjh8Magw4qPLBIBjt/gI6I6bLb4A7T8s9uQjdtsdBjXdGsJI7OzWeJmGiqUXAiuXwyt3knmQQmDyUJBLzl0j0LIRCm2R0ojgOHMd7/eIX9y4cUGZk9D8aVVQTQtZ4P1SvGqB9kacpAatx+v7CZYf9w/poGhjYpbU21FxLN+ej+ui/jzY7ODqeoDZluFNep8hWMA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <21d006d5-df5a-afe8-0f79-10e13febf2ea@suse.com>
Date: Fri, 5 Aug 2022 11:29:07 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 3/4] x86/entry: move .init.text section higher up in the
 code for readability
Content-Language: en-US
To: Jane Malalane <jane.malalane@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20220804150424.17584-1-jane.malalane@citrix.com>
 <20220804150424.17584-4-jane.malalane@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220804150424.17584-4-jane.malalane@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0144.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:96::19) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 42d7895d-d304-42f6-7311-08da76c4f36d
X-MS-TrafficTypeDiagnostic: AM0PR04MB5202:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	40MuTHm3fdfvHYEFA0sU9VmQr8mnq7OSXmlKYJn2ELH+ODQpefMwaooARHUEqRbRr8Bw2bccGlC1Fl9tNclhTo0e1iV1A1NdxVrU2z7ZmTpCCcuFPt9TwwCB9nK6BWJxJQce7WpQf6hQAM4mhBsAJN4QHW2XsTaa/i8q+S+qSWk9uI0VlPEV5mkHyRZklLg7S5XOuaO6mSl8TwCIEKTnwO/0A+Ob0ABFK1P5GKgh0N76AFX0pjqYsymxr8ET7CPrDujl0+SWNmP0y/0SC1hNOjrhPWUQuD7v+PLp+97JSLmxigmfynVN5gGGxoBvtHUIvY7ghcpnC8fpXnlt23ZdASGYEg0qkRKI8KC/HeYElMK3R3FsqIm/7yA1JrX9mzyNbIEMORT3sE2bLqkKYkRwsY4HEwjL6iX8kKXJFtMdRGTvAI2exWguW6WFsfqxJs3rvLh2EB0fwWJDxKs+zU7z52wM2MFpX2mymiNhLWbADpFgzyhdU/bliRThKnrfuWMOfAKKAQtT4gc0vwlKHhji4/bByC79ij028/JLzlHNABvfrsYLrA+u5/m+hxf9x6H0gPzItpKV+BA9/HsImO2kB33gbww++428Z5AzsNBkh9y8Zu6kcnbNm7SUaCHpFt0r5fMmx0JWdET73drRICUv+EpbNTl6vacTY8fPKkoR2ptb0reYc78y36+KlmXHwAkKyfv2jl8DvVDHhNezD9D3wy3Uf2AB63pV9JG+lM3x3cwdwQIMHhua8WEQ8K5lMNH4j0xofnjM/67t5kbo2z9FTRoST+7577iITNwTLV99vadjpXg5zGqFY2C9sS3OZ+l3Qch5Tb6FfeJS9+Kvse9s16ikCv+RYq/uHBrH8V9qoU0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(346002)(376002)(366004)(136003)(39860400002)(396003)(8676002)(66946007)(66476007)(66556008)(83380400001)(6486002)(186003)(2616005)(5660300002)(4326008)(478600001)(2906002)(6916009)(316002)(31686004)(36756003)(54906003)(31696002)(86362001)(6506007)(53546011)(38100700002)(8936002)(26005)(6512007)(41300700001)(142923001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eVRMVnZiSjVmNmxkeE9tZFc5a0NoVDRxaGIwWTVwVG1JZHpTTzVmL0M1OVhL?=
 =?utf-8?B?TGhka2lnSThmMlBwWWxjT0N2Uk1iakRIMmhUanJyNmpGTSt4djdVL2xsRU05?=
 =?utf-8?B?dEJDTmk0d3VabjlOT0lHQ2wvMVVVRnp6eEZHSHRXMWtHM0xtK1RSWmZwMmRV?=
 =?utf-8?B?OE1WVkU5STZzTitEdnhIZjF0VS9MZUVhb0JJc0hZUjBwTUF3QjlERjlHQ1Fw?=
 =?utf-8?B?cjFkVE1uYUR3WHhJYUh1LzFEd01zcWtveDE0Y24xVEdkK3BpOUxUaGdNYTdq?=
 =?utf-8?B?ckZ1Q3JuMXBHZGJyMXVpVGRJN3JmbkRuRno0cTczSWZaZFRmMEdIdE1qRmVx?=
 =?utf-8?B?Q2hHMnJNemVocTNCVGtjOTZDblhNR09uZmlkeEpLcUFpUmVzYyt5b1JKa0Q0?=
 =?utf-8?B?a2JoMDJwUndwMjFlckZzdlQ0d2psOVkwNitFMi9QQi8wQzlkRk1mSVgvWlNr?=
 =?utf-8?B?d3BicDBUYjZxQWZ3ejkzVG15am1LQ3l3Wk1mcHVRckRTd1lyS3p0MVNoSGZ2?=
 =?utf-8?B?RSthN2ttbVZpRUY1TzZNV05yMzFVbkV3WjdSTGR0NkNCR1pxVzVKSjJWcVpO?=
 =?utf-8?B?Q2dEYTYxZzRtd2c2T0t3eDdJVkQ5ZjRBK3AzSjZPOXByTG1XZk0zcWJFVkNB?=
 =?utf-8?B?cDNVa2pjV3BMUldJTnd0RnluMk5STExkZkkyL1NzeHliZ0FBMEdmUGt3WStP?=
 =?utf-8?B?eFplaWFzamdtdWF1NUdyVm9qc09YU2RLbXB0UCthQmI0SzZlT1RwMlFHeUdl?=
 =?utf-8?B?c09UdHc0Vi8zSXBRQVdpenFSWUpFU1c5TGVpZzdxQU9meFBkd0l0L0xBK3E4?=
 =?utf-8?B?Sm1mQ21zL3pIdTlRK3JPdjVvWDNUUzBxK0JCWkNCTmw5L282dllyVW9GcWY2?=
 =?utf-8?B?Z3cyYnJIcHRlRWgzMWxENUFNYkhmQVErVmRnOEF3RWZjajQ5aHFBd0pSZXU2?=
 =?utf-8?B?ZzJWMHQwT003Y21zTFJ2a2JrdCsrSkw2RnBrYnJVTEFZRjRuRGdaOHNpb2R4?=
 =?utf-8?B?UGNHR3pLeXdLdHhJZk4rdjV0VHd1UnRqem1qci93M3B6aGQ0czFVUlhoODhh?=
 =?utf-8?B?SEtiVnJIOUlqanY5SnBIWFJCWGlSa0dqb3dlNld3WVN5YXMxMWRpRmlNVjR4?=
 =?utf-8?B?NFZ6WCs4dFlWNVN0YzUyQXFONDBydEVMeE5WUlNyMWl2WXUxSitHNGhuOEtY?=
 =?utf-8?B?bHFkd1d3TVQrR1FNQW13eXVEYXo5cGJiRlJoSmpHSXBmVjhxT3c3KzdEK2Jp?=
 =?utf-8?B?cmdnN3JkQ2Q1RzI1N0Y1cGdWYnQxN0hVamdWckNYejFtSDJSVUI3Um5OenBH?=
 =?utf-8?B?N3orQ1RTN0d0SkMxckNqUDNsMFdoai8zaDlLc21EOGlFeXMrbkV3dlVaeTB0?=
 =?utf-8?B?S0NFU0xwWXJYN0tKYnFNOVlHeVhucGV4OXFDeTJnV21Yd2ZrU0lNb1p2cjNp?=
 =?utf-8?B?YjNXZlppVXYwd2c0bGtjYWJmajhVbzBXYlNqeGw5VXlqNzhYNmVqR1hpNHZQ?=
 =?utf-8?B?Rm9zb2M1RDRiWjMyS3NjSEVMWEpwZ3lpRkQyb3E2emlQR1Nud1JNeVdoVzhS?=
 =?utf-8?B?TXRLYzc2SkhHTUF3NlkyaUZaVU1zSjRuaTZmT3FQWGhZblJmLzRoMWlCUm1R?=
 =?utf-8?B?UnE1NEF4Qkd0bDZiU1BrTStXaThTV1FrOUFkSHhkY2tjZjJFZGMxVTJ6cGNT?=
 =?utf-8?B?eGxjTXhVdmExdm5nR3JoU3FtY2M3UndRTXpzV25YUGhoVnRDWTRpeXREV1VH?=
 =?utf-8?B?S2hxVnZoNVZSUkpiK3BZOXY2Z0JoZDcxN2gyOVdqNWJ6eXJLL2FBeG41ZGp6?=
 =?utf-8?B?ZXorRndSQ29VR2xuUTZMZVVyTjJGaDJRYVZ5TFpqL1NWUjd4dzdwZnp6SFAv?=
 =?utf-8?B?WHZZSG12ZGJmVzNvbVhsUUZqVk5iR0dvZktGTjFaQkZYcElyTXhCdXkzTmxU?=
 =?utf-8?B?RlFKdmR2T1FDeXlrTTFabzJ2MVBTUWUxcTI5U01TZk9oU2R4azFwQTVKWEU0?=
 =?utf-8?B?V1hGaXJBQUl5QnV0ei9peWZiTFFVNXBVY1pFaXNNMEN3SDMvZDZQUStrZWVM?=
 =?utf-8?B?UVFZUnJrbk9DSWkrR2hJL05tSnRBQTY2b2RzQTg3alZZb2lZN1pPUUZKZlFN?=
 =?utf-8?Q?2hANIvizsjRm5D4JfKC5cahtg?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 42d7895d-d304-42f6-7311-08da76c4f36d
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2022 09:29:09.7144
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8RgzT2B6st/FAJQ+2K9fnnGI2EYn86hhk5FYbAo3jgBcxO/DbsIfRbKoUW9hKbqVnv8ACuCIXQOoWGWzp5QA6g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB5202

On 04.08.2022 17:04, Jane Malalane wrote:
> Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Jane Malalane <jane.malalane@citrix.com>
> ---
> CC: Jan Beulich <jbeulich@suse.com>
> CC: Andrew Cooper <andrew.cooper3@citrix.com>
> CC: "Roger Pau Monné" <roger.pau@citrix.com>
> CC: Wei Liu <wl@xen.org>
> ---
>  xen/arch/x86/x86_64/entry.S | 19 +++++++++----------
>  1 file changed, 9 insertions(+), 10 deletions(-)
> 
> diff --git a/xen/arch/x86/x86_64/entry.S b/xen/arch/x86/x86_64/entry.S
> index 26bf2f1941..4ad25d9c90 100644
> --- a/xen/arch/x86/x86_64/entry.S
> +++ b/xen/arch/x86/x86_64/entry.S
> @@ -140,6 +140,15 @@ process_trap:
>          call create_bounce_frame
>          jmp  test_all_events
>  
> +        .pushsection .init.text, "ax", @progbits
> +        ENTRY(early_page_fault)

Why is this line suddenly not unindented anymore (as labels ought to be)?

> +        ENDBR64
> +        movl  $TRAP_page_fault,4(%rsp)

As you're moving this code, may I ask that you add blanks after the comma
here and ...

> +        SAVE_ALL
> +        movq  %rsp,%rdi

... here? Then, with Andrew's comments also taken care of,
Reviewed-by: Jan Beulich <jbeulich@suse.com>

Jan

