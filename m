Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E08D77694B6
	for <lists+xen-devel@lfdr.de>; Mon, 31 Jul 2023 13:22:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.572928.897061 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQQyJ-0003X8-Jt; Mon, 31 Jul 2023 11:21:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 572928.897061; Mon, 31 Jul 2023 11:21:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQQyJ-0003VU-H5; Mon, 31 Jul 2023 11:21:55 +0000
Received: by outflank-mailman (input) for mailman id 572928;
 Mon, 31 Jul 2023 11:21:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=bN9S=DR=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qQQyH-0003VJ-UV
 for xen-devel@lists.xenproject.org; Mon, 31 Jul 2023 11:21:53 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2060c.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::60c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 729f632b-2f94-11ee-8613-37d641c3527e;
 Mon, 31 Jul 2023 13:21:52 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AS8PR04MB7541.eurprd04.prod.outlook.com (2603:10a6:20b:29a::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.42; Mon, 31 Jul
 2023 11:21:49 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6631.026; Mon, 31 Jul 2023
 11:21:49 +0000
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
X-Inumbo-ID: 729f632b-2f94-11ee-8613-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ePI16BBlHbrvmcsVPXHsnMGDhW9Z3G3WQgVpLeeSAge2kNqvHMaSbJ31k0uCxFAU8YXySLnOGvaP7VWm0y0Oc6jRtY4U6xmxVpn5NSBRlpCRrumbZCqpMmtakmdPKa8/6al5vkMsdQHgOBCZR+I7H3QqjBRfiLlgQkm/uJNcDu1eUs1CIr4wzQDqzlNA4NAim7+bRqaN5BTrjvBj8E4owoiEMnfEeQE1enV3hFp/TGqxKMZByxZPW2IVSGMz6bTT0JDlYHXJ3D+sQq1q8uJ21PK2FGPDjgHWE25p4C5MImf7zvXO2pB321g8MwDzKcsWEp6ftPsEhZhWrl2/B3O/rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h51W8AFPnEmtnFCwCyouES4Oqa3SJaYrWkAAk2V3AGQ=;
 b=VLnGSAGvhAi+GZpGO7bmOoxJ4C/qddLWbHeeNMs5LVVVx5ATRkEd6VqEsiqFgmKmrwGxkCUzfsmZftk8CFHyRBofXttr7+oJRZQV4ogXbSHYaXsLaYLrLMXKDH0XH/QBfX5cuTciblisqgP1Et+3STdTMlVl2WGCENs8tAfSxvOYgwCshmB8qwuedXoRavrBRVx8A6F4qCc2ZZBCV6phsw5NGm4LjKqxMV+KZe6rKJhxoRwbE9xNwd8IbxdhvYhVFNZhPy9T/m5J1i7jgRwoATRttE5+b7+t0wZZTnt3IsEvV8OQBcvZMkrm0acN9inQcp6q39lomQX0LEI5Dconig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h51W8AFPnEmtnFCwCyouES4Oqa3SJaYrWkAAk2V3AGQ=;
 b=n1fghCtg0IfUDFujtbcrXFs+xmNzaof67i/pILVBuwEkSa53x9RmW0ycPNBc+5/TgOFodQPgA2FL03zpaFYVUXHdpT8gqdcp/c8ksBcQq2hCpU9YpPXLNf4UrMXwY+2uivbgIb38zbvfazD/57zEod5hh9ercCbEajxsdJzLRFFy32iRo7+BtEL9fiV0bw2n29L+qadIDnM/DELzy3V64gYWKtf+HdF1YyYjKWhK6cRNGXq9XxRbslbPqhhuveKlGQOOntLKKlpQED2QZPvysSeU/g8Gf/HHP6/PVIR4TncZHfhyVVadGE4FfdaIGuC/NCwhj8MC29e67C/vnSL0yw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <d7b55bb0-328f-b99b-71b8-708ad40b3d64@suse.com>
Date: Mon, 31 Jul 2023 13:21:49 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.1
Subject: Re: [XEN PATCH v2 1/4] x86: mechanically rename to address MISRA
 C:2012 Rule 5.3
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
References: <cover.1690788513.git.nicola.vetrini@bugseng.com>
 <b169d1c682254e682e6ed34f33481a768209ce9b.1690788513.git.nicola.vetrini@bugseng.com>
 <bdd5376b-477f-71e1-94db-71a2e4cb716e@suse.com>
In-Reply-To: <bdd5376b-477f-71e1-94db-71a2e4cb716e@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0216.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ac::20) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AS8PR04MB7541:EE_
X-MS-Office365-Filtering-Correlation-Id: 5add7aaa-0f18-42c6-12cc-08db91b85553
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	9eCDhktHE3trISt/9kygLq7JKfoYO9Bd1Q1KHVcanaks9RE/RI32IbF5QY4LF+Gc0OuZcu3Jg6dqeGVoI8CZPcpFJTOcD8vjJ1q/wY0LJxGjAyLaNDgPJ1o4NSUPdiCqdixMKGMXrCqyijmz5tV8NZzfOw0JhSvWz8nNe+UIcLUcvoli4xBukXFXI/vBIRuQ4KKWlo8138OAy5j+OKaaVVlURVAy1NZoMvNFq3gkySdT74+N7MpLJ/QredmoVWq6kiile2P4mMRn6lnj56pZbu5spgZd+oBmXGXZaqV9yFthcK5jn342C6aAMt31d/7YrNDLm1Nm65rIk/V6UPLlGH9+sBQ3HZ79qu0Zwm/HcJGVLmAsc5vKD15IReYzMGyZNWQ3Tb+LGkYo9WznrjkBCDlQ1HeoYfrozQKi2ldMCqlGaBeksg88T8SKcAkecNvqJIVtkXR5vUI7F0/ZNinYmCQRXFmzIcN7dDpG14zQRgltM/VgRkFIwNzYn+gaC6TNtO0PlfsSDjmmaMWuRLNjjMsTrDKtql/Z87syDb8dRC//SeGzpgAi0CuJV5BpXjznfdf83idlQ1n/4diCsABu0OjDzTq8yrIHYuVc9fPIVtSIol2S2lE8Ioo0/HpuLsN9wGZ5iX8qYQKc3faSXCNAzg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(366004)(39860400002)(346002)(376002)(396003)(451199021)(6512007)(6486002)(36756003)(53546011)(2616005)(26005)(6506007)(83380400001)(186003)(66946007)(66556008)(7416002)(54906003)(31696002)(86362001)(66476007)(316002)(4326008)(5660300002)(6916009)(8676002)(8936002)(31686004)(41300700001)(38100700002)(2906002)(478600001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZHc4SFRqeXZZL0g1RjhrdWI5K1REakZydDRKT2grNi9hWWh4bGFkeGdGMFMw?=
 =?utf-8?B?TzRXd0NOVmJjSFp1R3FmZjZ2cVRTQjdQZGZnNFBhYUVoejhxS3FwNmxNZFNp?=
 =?utf-8?B?aFpRZTRpMHZtamJQSSsrTmFCa2lpT0VMeE45UEFjVWlKZnZ4RGpGVzRqT2hZ?=
 =?utf-8?B?aHVJQyt4dUhCejBpcnRUMEhycHl6NE5zN2R2ellITHFUNjJiTU1LdnN1UlJQ?=
 =?utf-8?B?VTNmb1hyb3JRZ3ZFaFhEREZBMFU1eGpSZUZSOXd5aDJzb1V5WmZxeGdkRHZU?=
 =?utf-8?B?WlFDMTd5Q2ZKSW43d0FveS93VkxwT1pDL3M1MFpteG5ZcWRBdmduTnVCRnMy?=
 =?utf-8?B?WEVWQUtEdnNYR0tPMXFBVlhlaWZMMTFlRzdhMDlpTzMrMWdnbkg0eWd2ZHJW?=
 =?utf-8?B?dUV2MERtVitRemNjcHFzTitxUnQrai9oeUtTdkJmUmRKWkd0Q3J1clpkUTVt?=
 =?utf-8?B?NVh6c0ZRLzZ1ZkRjMFdEWHFoRmw1NDNnNHpDbmt1K1Q5eDZMbmNJT1cxU2JM?=
 =?utf-8?B?N0NzSi9MWEFyaHA1bHByRElNUHp1eld0VlJPWkVKdDFrcEJhREk2UjFmTVhX?=
 =?utf-8?B?TS90bSt1NlJpUlAvdTJKTzRZSU1YTGNuZ0Vjd2J2QWwwS2tQOUxrVU1OUWxX?=
 =?utf-8?B?TVg1Q0N2VGdaR21UcjBidm5QdDRTdStxbGdaZW04WnZwNjJ6U005VkJYKzJD?=
 =?utf-8?B?VUtoWGJNQ1gzbGwvTGhrd0l3cllzY0JoTFh0ZlZ5bEFHaDFXSnJVbnEyQXJ2?=
 =?utf-8?B?ZWI2SURjWGJjemV2cHdCL2ZFdGpJSGFMREZmRlhwaUhQQmJ6WUoxNVIyU0lP?=
 =?utf-8?B?VFQ3NlpWZVRlODQ5RC9zREFXU0lhUW1haVlYUkhxQW5SRlNPSXQ0aXVCRktW?=
 =?utf-8?B?K1lZejY4cmZOMGVXVVNZWWFzeVRtVit4TXhRODV2TW5tUStxSmwxZkV3SUZB?=
 =?utf-8?B?dWlZU2MxTjJWalhIcXBsb09tVUJHMGZNbE5Na05SOUxuV0paY1hxWUt4Nkdo?=
 =?utf-8?B?bUtyb2xKbnRpOGo5RHZXbWRlVDJqZUhlVGZMeWtIYWxUUGVhVjBHMWFlN2s3?=
 =?utf-8?B?L2Q4TUJwdHljNkI2cGRBQlp4b1JOTFdJR2ozSFRhc0J2UW9veUpIVi9MVkh5?=
 =?utf-8?B?NkRSTmNoUVBFTGlVSTFpTVAxaXlCN1RzRDlIZWNUMTFpVWFpSDErKzZKbHBr?=
 =?utf-8?B?eEV4ZHZ1dktBRm1NNjdtVDE0eHpyTDlEbHhnalZCdnhWRDRyS2RFQjRnNWlm?=
 =?utf-8?B?N3NpSk9wQnAxYWkxcGJQT3RyQXRZVGcrdHdZQ1JqM0hHTkN3L2dCMTNZN1V1?=
 =?utf-8?B?QUNFLzFaTDBjTmpuUzhZMmVOUzhzMWg0cEg0V3hBZWpGUUVibjZTWExIRTZK?=
 =?utf-8?B?WWp6VUY3czhvVng5c0xUNGtaWHRuMS81MnlyQVl6cDYvdEJiVXFRMy9QQW1i?=
 =?utf-8?B?aXVTL0l4U3FTQ1Jyb0JqK1JXdUtmTGFvVlpLdUZVRzNBdFd3VDdXckFvVnNT?=
 =?utf-8?B?YXgxTUNvWlJlQ01UUk54Nm5CTlFjZ2JETDdpOXlBcGNGQUhCNXQwOHR2Qmda?=
 =?utf-8?B?NTNFNzR3L0x6UTRJU3JGaXJwT3BFRmw1Q3lTYmJxZUVHQWRBTkVoNXJUcGh3?=
 =?utf-8?B?UXpKZCtya0xsQ05CdHJIblJqSzdxTmN4b0NBUUNIUUdXQlNRRHRuU2RQblc3?=
 =?utf-8?B?WExUeGg4dHF0V0ltTEJBUTQrYUk3RG9HajdoaW9VYUNVOE9BUHJXbDdta3Nz?=
 =?utf-8?B?dGVJdUVDaGRUY1BjWEh0dXBxeWNRVmxvMktWdE9tcDg4eEhhdWp0UWt5cWlT?=
 =?utf-8?B?NjU2ZEhpQVlDelNuM2tJSC91d2tLRjgrMzVtaDFPb0xBWmdlYkhtZmVEQ0tC?=
 =?utf-8?B?d2F4Z2pZMURLVmU5SHdqaERLRFBma0FTQUNLN1FxWktPa0djUm0wdGpkNVIy?=
 =?utf-8?B?VFR2eGJWVkNhQzMrZ3RUc3VuZXF3OHZHRldQQ0NCampyUi90NkFSdTNyZktt?=
 =?utf-8?B?c2dNS0xneFEzWTNzK204Rms0TEdxSW9hdnU1NDBBck5vU3N2STU5NmRLYlYv?=
 =?utf-8?B?cnB3U0ZCamFwOG82K0RuMStpekhaaEMyR1d3Z2NvTFBxdi9DZmNWY2dTUjd0?=
 =?utf-8?Q?rzK3maBO3+Fy95r8e0cXaiH38?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5add7aaa-0f18-42c6-12cc-08db91b85553
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2023 11:21:49.5903
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /KIU8T4C+4YI6QjhY7bP96u3PJBk+DYMym8G8O1GIt0GcVmNCqscnZVtUcu0hMPLmByYucbTJsmUgjj6r1rCdw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7541

On 31.07.2023 13:15, Jan Beulich wrote:
> On 31.07.2023 09:33, Nicola Vetrini wrote:
>> --- a/xen/arch/x86/include/asm/hvm/save.h
>> +++ b/xen/arch/x86/include/asm/hvm/save.h
>> @@ -49,21 +49,21 @@ void _hvm_read_entry(struct hvm_domain_context *h,
>>   */
>>  #define _hvm_load_entry(_x, _h, _dst, _strict) ({                       \
>>      int r;                                                              \
>> -    struct hvm_save_descriptor *desc                                    \
>> +    struct hvm_save_descriptor *descriptor                              \
>>          = (struct hvm_save_descriptor *)&(_h)->data[(_h)->cur];         \
>>      if ( (r = _hvm_check_entry((_h), HVM_SAVE_CODE(_x),                 \
>>                 HVM_SAVE_LENGTH(_x), (_strict))) == 0 )                  \
>>      {                                                                   \
>>          _hvm_read_entry((_h), (_dst), HVM_SAVE_LENGTH(_x));             \
>>          if ( HVM_SAVE_HAS_COMPAT(_x) &&                                 \
>> -             desc->length != HVM_SAVE_LENGTH(_x) )                      \
>> -            r = HVM_SAVE_FIX_COMPAT(_x, (_dst), desc->length);          \
>> +             descriptor->length != HVM_SAVE_LENGTH(_x) )                \
>> +            r = HVM_SAVE_FIX_COMPAT(_x, (_dst), descriptor->length);    \
>>      }                                                                   \
>>      else if (HVM_SAVE_HAS_COMPAT(_x)                                    \
>>               && (r = _hvm_check_entry((_h), HVM_SAVE_CODE(_x),          \
>>                         HVM_SAVE_LENGTH_COMPAT(_x), (_strict))) == 0 ) { \
>>          _hvm_read_entry((_h), (_dst), HVM_SAVE_LENGTH_COMPAT(_x));      \
>> -        r = HVM_SAVE_FIX_COMPAT(_x, (_dst), desc->length);              \
>> +        r = HVM_SAVE_FIX_COMPAT(_x, (_dst), descriptor->length);        \
>>      }                                                                   \
>>      r; })
> 
> The macro-local variable gets too long for my taste, to be honest,
> and it being improperly named anyway suggests it simply wants a
> trailing underscore added. And then, since for a variable named "r"
> the risk of shadowing is equally high, that one wants to gain a
> trailing underscore as well imo. (And while at it, I personally
> would also drop the leading underscores from the macro parameter
> names. Furthermore I think it would be nice if at on the lines
> touched anyway indentation was also corrected. Overall maybe best
> if I submit a patch.)

In that replacement patch I would like to mention what "desc" this
collides with, but your description didn't say so and I'm afraid I
also haven't been able to spot it (grep-ing for "desc", even with
a couple of extra restrictions, still yields way too many hits).

Jan

