Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F09867657B9
	for <lists+xen-devel@lfdr.de>; Thu, 27 Jul 2023 17:31:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.571197.894485 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qP2xc-0007Pg-10; Thu, 27 Jul 2023 15:31:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 571197.894485; Thu, 27 Jul 2023 15:31:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qP2xb-0007Mu-UJ; Thu, 27 Jul 2023 15:31:27 +0000
Received: by outflank-mailman (input) for mailman id 571197;
 Thu, 27 Jul 2023 15:31:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=m5Ij=DN=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qP2xb-0007Mo-2x
 for xen-devel@lists.xenproject.org; Thu, 27 Jul 2023 15:31:27 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2062b.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::62b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a5e44fdb-2c92-11ee-b248-6b7b168915f2;
 Thu, 27 Jul 2023 17:31:25 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DU2PR04MB9051.eurprd04.prod.outlook.com (2603:10a6:10:2e6::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.29; Thu, 27 Jul
 2023 15:31:23 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6631.026; Thu, 27 Jul 2023
 15:31:23 +0000
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
X-Inumbo-ID: a5e44fdb-2c92-11ee-b248-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hWR8bnuDmMHwQAXEn6wWTpMxqwRxz1UdqkeVX05EFdBhHHkg1ljvwp8DTscZcOykpuE9Jg19pcq97PQVYEGDWY3XOcXKpZwik+h5OUYU7OOKcSgBMvkj+NEGEE4LThpHNEfphISX7eGO++2EfBSlK3tbihCPfmmEoaFUb09pvi/cHzAcxDlz3jenZ0xgk4aCqRaqzyJ1fGxBbx+GUxOWlqo6t6Dlg0J4jDUdpsNSlRA2GvicaC4wbBZ3BjOPso1PdzHNH6k+n+yRmpOfI5qm4emXfsR77YoWjFfgcQH9Xg2V9usH9/6LblMmG8zX9jCpVD2WZlPwwMB7/81nFL/5PQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M9dleTywZq3fAzH8saLveL7a84hScw/lpvlbTNpB+ec=;
 b=TEoobtxTuXPGBVI7GFcJSODP8qtQrefaFxSSM0D6lnG5witRQLgwrlvf8vGPahuTrp9WNrmSD7ZgmG3fKl3FYEL3qD3LkrWS5FCflSZq1Jrxlnd3w19tDtisqyY63aNSt4DQcpTorjD8rx7Gpa02/rrZvaQkrW+O65f9qmR99xF04nWsTiSA8vcdDwZEMRnv75r9gg3NwHWS3RYnQ3GQBKSMRmQ7UzZotQExRg2WWD6KO5gJVqtXKZzuDHp1d8vMNZSYw3ew7i+G+TpnMAAMZG+rwL7UB+6vSOUo+txspp690Cw/E3n9QMy9TRnyzCE28Q5Li5GZeQ6wCdlQXz79Bw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M9dleTywZq3fAzH8saLveL7a84hScw/lpvlbTNpB+ec=;
 b=aogAX89AElXd9+vubwv9ljRRP0XGG5jSfqqHkCGZDOiGXcciCmsmKAA+FBMAeY+b6tpTPl3zC3nOixpIFCfKSVRjeosrac0nHuco7IDac9nEeVi6Drj2Itof9PLCWNaCxfqyl6yx1xTJwyR6EHtPUTn7JFNYtStoUoWCzLUqSR9b4nCbfBAdcFfyONlM53GAnlQ/yqN9dUodjFgARyM3Wg/mXm+tmHEiDC+bO/zvnQJWqYw/AwX++izHSVPu1yDsyqpbL+CZAOpZGK7bT++U+cLMzm48PR/Cv+MP8WJ31DjTW7dKlAGecGaQqJqGQo6yWmTqnaBp9EQq5liHC7txjA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <ce404df8-eaf4-327b-e858-c5c65c13c5d0@suse.com>
Date: Thu, 27 Jul 2023 17:31:20 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [XEN PATCH 2/4] x86/emulate: move a variable declaration to
 address MISRA C:2012 Rule 5.3
Content-Language: en-US
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 Paul Durrant <paul@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
References: <cover.1690449587.git.nicola.vetrini@bugseng.com>
 <bc3a28abf9f00bf67cf5ee64bd89e7d38e321c06.1690449587.git.nicola.vetrini@bugseng.com>
 <9db05529-b4ed-89c0-a140-118c0ccf44bb@suse.com>
 <baaed0c1-2324-86ab-a6a4-6721dc67243e@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <baaed0c1-2324-86ab-a6a4-6721dc67243e@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0140.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9e::8) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DU2PR04MB9051:EE_
X-MS-Office365-Filtering-Correlation-Id: 4a7701cc-3b13-4fa0-eae3-08db8eb6888b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	9N/nOHK3OwNxGs0LlUuitgMv8tZMD+PMwUP82nEMszHoTPU1KwwdqFOwcu6+P+QLYBiEcGQe7e7/IldBVGDIhB09T+08/dei20x+jB83SFphHIzM8QMTsjvdcFjlo2gj3dPw+vbyo9z5e4drU3Vz1+nayAJAoNIWPRZLos9DBAj6NMMSLhG8Trh5PJqi9WqirkT1nUZLuB6paMz0TAxZLfCR19SrJI0z5uQey1o1G1S4aN6aCNFG4/0xmfNEH8HqdIEy0lnWypwS/8DwdZjwCUzDkoPI1dio74fLrqFlkrOrW5zu8qJcc7uG+JA5F9NKMkNDRIkjtPo0dHzX+TONYqRbNgC5MwYcQLnl7+Wunpk5/FTPPK/HykdZvd1pfkQe5kLYLoDbPJ7AVjVEo4sqC9RvQhMA5xT4hn49bLx8L+jWPSOwYcWlIHZMtVxUziDr4ohNoRovIF/QQDnVTSBF1PYxxm5mDDZMdoXFsjQ4ZVNo0iyAUo5a5u79HthfT4sizGh7utpsSwEigsYlBJBA1GYirb3CG/37sfsGhKHFxi2XymS1BlAu1+NzeDLyVHuW5HHnFQDokFLhmPz8auAl5mf34p3S/KoH0gmzLIBxwIPe63guWESbTLoXnDqaL4VlPSmtkmmunW+h662v4TGuIw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(366004)(376002)(346002)(396003)(39860400002)(451199021)(6486002)(478600001)(53546011)(26005)(6506007)(6512007)(6916009)(4326008)(38100700002)(54906003)(66476007)(66946007)(66556008)(186003)(31686004)(2616005)(5660300002)(7416002)(316002)(8936002)(8676002)(2906002)(41300700001)(66899021)(86362001)(31696002)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?c25Hc1VlTmQ0NGNNVUJKeWMrTGNmSG5ES1pjeGVKbkljRUFqK2RPN1VQRjlz?=
 =?utf-8?B?TjZ0YVpTNWpEMDJpc05NMUE4R2d5VWZVODUwMk1Zdno4WDhLVGthQTZlVWVI?=
 =?utf-8?B?ai80UUZYYnNMUXJxNFQ1NFVNMnU4Q2xIeEREamppTmh6Z0t3eEttV2lKcDc0?=
 =?utf-8?B?citvb2FGd1FOMk1TUmxqakxmZ2lPQllwL1BPRWFXSmppVGdweGhaOGpnMGRl?=
 =?utf-8?B?NHlGaXdsNG1PYkN4WkJLNUlLbGMxdkVXNndONDQwcWpmT1NSOERaNzBvcnFH?=
 =?utf-8?B?REdJNTZnU1BWVmhLcVYxR3l2TXh6UkRWZmxQbGowalpVQXhmNVRWT3pmeTY2?=
 =?utf-8?B?MWV3dEhrOG9XazJVcmZ4MStVUmI3bUZScW05ZC9ERlBQSldjNno1WEdqL2Vl?=
 =?utf-8?B?NVo1WFNVNmZJVWlxWEJON010MXFqNFVoZ0VyOHBwelNYSmlYWmFXRmFreXBl?=
 =?utf-8?B?K1cxTU9GRFVqSXRKdVp5Mm9IQ056V3VhYWtqWEpUQlNmQVBNSGw2dklIZS8y?=
 =?utf-8?B?WmZZVXQzRStuOW5ORzhQWGxSNFc0Zmt3RTRPOGZ5TmpSRDBXK28ySWRvY0cr?=
 =?utf-8?B?NnEybVM4ZDhLWFR6dlRjL2J2cE03aTBYYnQzakJPZDBPRGNzM2Q4bHF3dFRD?=
 =?utf-8?B?VlI5S0NZS0lQNHZGdDJqMTV5VnI2eld3NnpQSG5rRC9QMUtEYzdmKzhhYTd1?=
 =?utf-8?B?ZVRXT2R4VlJBQk92MWlmc0NnV29HWkpTWWNKYmFFUW5BR3BiV2NpcVhFRTdC?=
 =?utf-8?B?QjZhQnlvTmxRYWRTeExnUTRia3lCcy9vZnQ0V2RLU0E1cDczZlB2ZjhmWGRl?=
 =?utf-8?B?cUV6U0Vmd3hucHJ0VGtxS1FITStUeWxDRVJHNnRGK09qVDcza2JwTGJZTkRT?=
 =?utf-8?B?NTQ3MStGa1ZsRFN0SHZVVkh4U3ZyMkNqdE9pNzdsaFg2dCt1Y21mV2R4QWIy?=
 =?utf-8?B?Z0VQQjRjZkU5cldCR1o5WmpFV1BKU3R2dm1BSWRWeWdvSzVkWm5Jd2Juc1Rl?=
 =?utf-8?B?MHVkM2tJcm4rM1JWR3lVcWdrSit1TkwvVDRmMzRBMEdadm1pdTBPNUVVOE94?=
 =?utf-8?B?TjQrTWQrTDl1dFYyN0tMVnZLZWhVdHc3TnJJbW1kV0lIWFFNb0dXRGFici9W?=
 =?utf-8?B?RTZVRmdnbHg1b0JvY0xoK05IN05WM0lOM1hWcXVpNGN2Y0hJTkcxVzJmQ2hw?=
 =?utf-8?B?TWc5Q0txTUJ1clN0eTBvM1dwRlhFelQwVGZUYXduajFCTTBxM3pTMWVhVDZt?=
 =?utf-8?B?eUVqVFo1TFR2RjljWXhhTVBsTkxHa3c4QTQ3UGVieXRjeHl1bG1EQnNtcjRJ?=
 =?utf-8?B?VXJzdkxISjRXaGd5WHpGODJsNzRVNDh1RGpuZjdpODdzT2FzUDZJWjJsSDk2?=
 =?utf-8?B?S3Nvd2NCRjB4R2ZEUU1KTVpNRUxCNDRRYy8wbVFjcmtic0liRW5mOGF1OFp0?=
 =?utf-8?B?SDFPYmlwelhXRnpKVUs3bjJObkh2WldNckY5RUF6cTlxTHlSZStGblEyWnNs?=
 =?utf-8?B?QVhhVzNzOEludUxLVkt4dVNOYThMUnQ5ZEJGZlpZWCsvT1JCRDVrT0hVdUoz?=
 =?utf-8?B?Q3FZSkZzbUJIZGNFNXQ2OXU4WDdpbEowSjFPOXFsU09OenA2eTRIcVBVdjBW?=
 =?utf-8?B?Skt5TWludDJlMCtKTnhLNnc4OW9qQ1ZoUDBuODBsOTlwcVBoWW50OVFoelpP?=
 =?utf-8?B?MkZ5TnAyUnY2UDJNajNwMVpLazRLaGdHOUNncEZCQjZ4YmxjYVNoQmZNZFdw?=
 =?utf-8?B?VlRLQkN0N0NoRk04YlJUWlVheUdCYzVPZStESytRTnl6cmtDZG9iYVI0dGQ3?=
 =?utf-8?B?bEd2NzFGUEJlRnRhOGI2clJYakZRYWdrck8wb1pSamRWbXg3V3NudWozV2tL?=
 =?utf-8?B?ZW1lK012ZklsZFl6aWJsbHhqRFppV2hyVXJGYXBnT3hEK0VFUHRLNTBrZFkr?=
 =?utf-8?B?QkUyTEJkNVV5V3M3T3lvZll6cDl4cjFobzlmUkRnVXNVd1FqVEE0eHJleDlh?=
 =?utf-8?B?VzhpK2RzdEduZ2ozYzBTSXNBbVZPOGtlOExnV1dGWUgvTnEzeGc5cWtrSnZP?=
 =?utf-8?B?NVJoYWozNHZwN0x4QlFIYmRNZEcrenJhd1JWOFNCbVBsRGk3b3hGRWJ0akJ6?=
 =?utf-8?Q?e/69zYgDj7sQhmczrx+P8x5T6?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a7701cc-3b13-4fa0-eae3-08db8eb6888b
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2023 15:31:23.0642
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HPoJ9JCmv5nLTP+vxp+ZBNbTwugGxB1l2DJO0FJIft+qv/vSHH/Vj0ZQAQtShppNDRzJ2FAXOjgPiLalNVkgBA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB9051

On 27.07.2023 17:22, Nicola Vetrini wrote:
> 
> 
> On 27/07/23 17:06, Jan Beulich wrote:
>> On 27.07.2023 12:48, Nicola Vetrini wrote:
>>> --- a/xen/arch/x86/hvm/emulate.c
>>> +++ b/xen/arch/x86/hvm/emulate.c
>>> @@ -2024,15 +2024,15 @@ static int cf_check hvmemul_rep_stos(
>>>   
>>>       switch ( p2mt )
>>>       {
>>> -        unsigned long bytes;
>>>           char *buf;
>>>   
>>>       default:
>>>           /* Allocate temporary buffer. */
>>>           for ( ; ; )
>>>           {
>>> -            bytes = *reps * bytes_per_rep;
>>> -            buf = xmalloc_bytes(bytes);
>>> +            unsigned long bytes_tmp;
>>> +            bytes_tmp = *reps * bytes_per_rep;
>>> +            buf = xmalloc_bytes(bytes_tmp);
>>>               if ( buf || *reps <= 1 )
>>>                   break;
>>>               *reps >>= 1;
>>
>> This wants dealing with differently - the outer scope variable is unused
>> (only written to) afaics. Eliminating it will, aiui, address another
>> violation at the same time. And then the same in hvmemul_rep_movs(), just
>> that there the variable itself needs to survive. I guess I'll make a
>> patch ...
> 
> Wouldn't this code at line ~2068 be possibly affected by writing to 
> bytes, if the outer variable is used?

Which outer variable? I'm suggesting to drop that (see the patch that
I've sent already).

Jan

> /* Adjust address for reverse store. */
> if ( df )
>    gpa -= bytes - bytes_per_rep;
> 
> rc = hvm_copy_to_guest_phys(gpa, buf, bytes, curr);
> 
> You're right about the other violation (R2.1)
> 


