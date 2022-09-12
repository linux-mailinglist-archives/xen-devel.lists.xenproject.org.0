Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 60B365B5498
	for <lists+xen-devel@lfdr.de>; Mon, 12 Sep 2022 08:36:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.405439.647898 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oXd2f-0004mr-BV; Mon, 12 Sep 2022 06:35:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 405439.647898; Mon, 12 Sep 2022 06:35:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oXd2f-0004kP-8r; Mon, 12 Sep 2022 06:35:37 +0000
Received: by outflank-mailman (input) for mailman id 405439;
 Mon, 12 Sep 2022 06:35:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=FQsZ=ZP=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oXd2d-0004kJ-M5
 for xen-devel@lists.xenproject.org; Mon, 12 Sep 2022 06:35:35 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2040.outbound.protection.outlook.com [40.107.22.40])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1539105e-3265-11ed-9760-273f2230c3a0;
 Mon, 12 Sep 2022 08:35:27 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by VI1PR04MB6877.eurprd04.prod.outlook.com (2603:10a6:803:131::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.22; Mon, 12 Sep
 2022 06:35:29 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::59bc:901a:98a7:76d4]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::59bc:901a:98a7:76d4%5]) with mapi id 15.20.5612.022; Mon, 12 Sep 2022
 06:35:29 +0000
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
X-Inumbo-ID: 1539105e-3265-11ed-9760-273f2230c3a0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XjqHVwKzCmZNpPKkRuAat+QMkwbMcIRNNdAMSx15OcVcoEaLmsugcSqdDFls+xxCkkMsuOThPADAIMlidNFdeSBUdby7hyQd739KfVCVzIfvhibZA/A7gO6YhBZ5l99z0YupChY9EXOzLxo3eXbiC0HAg8yqTMob7ws61YzKcamXP1NB1252t3hCPWBuz7yisc1V56uhRfllVLerxwphN1vOW0yPYz3+58G1D3LvcjOC6Yds62ohOF046hsNkkEPYBRNy7jXmA/8DX+vvTOvGE5Qs84n61EwtGJcQcJkcZUoMzhjHsMY1m/YFW8L3Utca85XhRET5IdaUbqMItnfng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=084nf392cCI1P826PCCE/SQbqNwDObDQ09A3n9hmV6k=;
 b=Ur7HQY5jdD44faSHmmA8oPmNZOdixO6vC6ycLTpdRz4J63kluFLF15dL+9K6dAq37Wmzs6VBv67Bt+hM6TIp9cnnkQVnisfjjIh7mf5mL6y/6Yii4650hUd9I29fJEMBpNDTC30QpjVvHxe+iGNoIbxECZ+NxUJ1O6FOA0upU3yY31MB8ZXHGDafkPRaf0HKTdxG2LQnT64IImhCwrywuaQ7aZTZ1qeqKLebRBTAf/d2jLwtrTOVUYXOHIADanqoh+d/piEQwcvwaE1x9dbuCFvAsY/F2uHkI0+kpUtFLmi1R9P2vOTjdDZBz8TNhs3O5t2445vL5UUmzs4uI3byhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=084nf392cCI1P826PCCE/SQbqNwDObDQ09A3n9hmV6k=;
 b=NJQkBA2F2rCA6taVcm0K/EzjODQStEcjgwcdQOIDo8pbsfqHjLZsHTvtVW5DNkLQMb6bW7uFQKikV6/VYA5PLO2vHZLkOXXKmQcHXkXpkI/0ne5xpAGBKOjl2Vs0yrjZ8JN3Si8GnkFXLqXowaGfIdt6tRIHlLVk+kXD0EFSbgjRlJwPxyOd4/2xg2yrZNpGaubbAvZ9VRkyEceNcmYT3rdpICB6qFshYXEOpzv2LUoQdn942iHMhFZl4oe6KM1sBT6fS+/g+uL+fnqO9sFDDmBMu8XDXJ30SudTyk0OOFmACQePCojBivqfOHvieWIYFzue8EE991ozLaubuL8bTw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <a501204a-456d-0094-d1c5-544717148921@suse.com>
Date: Mon, 12 Sep 2022 08:35:30 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH] xsm/flask: adjust print messages to use %pd
Content-Language: en-US
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Cc: jandryuk@gmail.com, xen-devel@lists.xenproject.org
References: <20220909095012.4251-1-dpsmith@apertussolutions.com>
 <3da17c12-1cbe-165e-94f4-44face9a181f@suse.com>
 <e6568867-3296-58b2-8744-d1644e401528@apertussolutions.com>
 <f037e0c2-625f-dcad-a67a-6468392c14bd@suse.com>
 <b12addb7-ce3f-b560-4f35-05ba9c699c87@apertussolutions.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <b12addb7-ce3f-b560-4f35-05ba9c699c87@apertussolutions.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8PR07CA0025.eurprd07.prod.outlook.com
 (2603:10a6:20b:451::25) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|VI1PR04MB6877:EE_
X-MS-Office365-Filtering-Correlation-Id: 3104f890-06e0-4bbc-3a49-08da9488fc2f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	waMSFkmXAEeYQ5Qab/CK7mraICoFOR58RLxjzdbn8iH+V/wRaO6MizGRd2PglfiF1LlN5E6LiETOGr51hfK4QnAtZ8qu/6yhxpjN7yoAa0DR4gTyJm45RhlvOyYXP13VlkxSufOJKkRSmV9a+vgonzyS3ZVW2Y+SxCIFCqEFK3DlDKg7ykgzF3bPwy6Bnjiuv0lsAlnAmQ3kQry0Y8tnvFC4CqaxsRE2pNLMLFFVelnGJYt0DaPWqZZVSJHr4rT/HHzVkbV69TqEqB/fVNBRkcso5E6J+g5VnlqGrHi00atXDVGn91BhH2kegaOyG/rKXCxke+YWy1iQC+5BJNOJnK7qtGryqE1FUyomujKKdZlRDc7FpO+TJ2OifJPAohLjOGzmEfo3vSbnlc4cKnO/Yk5eA1iU6Zkvpx7SDswTAAtg524+U3a0RK4Oyadu3E0s5HaG3588xQum4DMvdUhwOcm8aCDZsK0jmGepKvxX1+lRBn+AbUDPu//3/v/3OjjpfAQvGqh3j4vIZauoWeUZUuOwUvms1Qs0VaWOp//1jtBMXM1JbtMsvEjE0cS8yuEXzTomiSIZAkUvYulqhj4XUptidbYcJT+XDykjh2eXpC6Biwbq1IGbzZdDMfMIt99zv/OWzWLEFT2DtJt1VAi3uBAogBzu/wLazGKej/rCVTxdn5j++s2E7tDRgykYMJInPqyApg/+hc1WGsPXSJ8eA7I+Go6QvIM1jHgCvy2avscwnVAm4yhZo6T4/xgb5VFkRnoQQIPqwEWNkFLlWcQiuFv0jREhWxyWcGjGtqEnW7k=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(136003)(346002)(366004)(376002)(396003)(39850400004)(2616005)(186003)(83380400001)(38100700002)(8936002)(15650500001)(36756003)(31686004)(316002)(66476007)(66556008)(2906002)(5660300002)(6916009)(8676002)(4326008)(66946007)(26005)(86362001)(6666004)(6486002)(6506007)(53546011)(478600001)(31696002)(6512007)(41300700001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QVhjWlZRNys1eGNDZ2RkUDFIOUtMb1VGOENsUWhxczdnY1N6dHpXNzh6Vjhz?=
 =?utf-8?B?ZHFtQng4MUlvVXZFRFQ5L0xEeXRZcmxNZTZ2YjZFb0RPdHdvL001dlJEVDIx?=
 =?utf-8?B?ZnNVTFNsY0JYSktKRnFVQ0hNcUlzQnJGR09YekYyRDlSUjROOFMrL0xHVlBq?=
 =?utf-8?B?RExXQ2w2VzJJejQ3b1VEWHVNcVdSbnNQdDFCeDhzcTRaR2t1WWlVbkNDbDMz?=
 =?utf-8?B?K3RCRkFQL1N6czcrdXliOEc0aDZnRllPS2dYVTBFV3ducU1jSHJ0R2Z1c05w?=
 =?utf-8?B?K2Rob3I4bHFDM21DSXgxNHVRRzgzb2JTcFZFRWNDVC90N3BabEtwNldNS0R4?=
 =?utf-8?B?U1pBejNyVlN0eUphZ0h0QUppQnV1VDV1Z0dDMTNmdlZ4NG14bFBCZXFvMmJs?=
 =?utf-8?B?Smk5THZMTG9ETGxPNEcxakxvUlJrbTdGTHRucGxjYytNT1AzazJhUnVFVXU3?=
 =?utf-8?B?TlFSVUVCRjVBWExlUG55WFY2Mm0zOG90VnBSNGJmT29hcHluZVFrbzhZTzd2?=
 =?utf-8?B?RVVDN0R1R0JmaExnL2F0aTAydkYyVWdrVDkvVHlsR2JlTzJGM24vVk8xZnV6?=
 =?utf-8?B?WmlSV0ZaM3h0eko1MVoxM28xajdGdEx0UGx2bWFYbmFLTmViM09EUXY5b000?=
 =?utf-8?B?dy9qQ3E0VG1oR1o4RTQrV3dyWnhxNk9RS21vZ1RxSFJ6Q3dCM1B4amVMeGFv?=
 =?utf-8?B?ZVZqa2FnaGxqNTJyOUxQNDdzRm82cUdXU2tXck9MMGNEbVhFcUNsaXlSREU1?=
 =?utf-8?B?bkJ1dHpyc0VETUthWHdSVTZ4TWJFTW53eFhXcldKakQ2dmVSU1dXSTZjV21m?=
 =?utf-8?B?dEZXTkpSVDRULzRVQXo5L1Y5RW1PMjh4ZGNGUVkwK0NUL0gvbFRzUVU4bVZG?=
 =?utf-8?B?VjJ2L0lRM2lFUjNhb25LWWlvNEp1bDh3Mk13MjJjYjdsK0s4SmdzV2xKcWNI?=
 =?utf-8?B?Zi9ZTzNLNEdYU2Q2TXF3L3JreStuWU9aUFFZQ1hWTlRRNnNzVm1hWG90Um1i?=
 =?utf-8?B?Q0RsbDVQZEZXclhmUDRTNnZNdXo5SFNRUDFROGVPNTh1Ty9pTGk0RXN0eEtY?=
 =?utf-8?B?SVBZRlpNSTB5ekp2TUlGK1lQOGJOaElERkJXR0thOVBWWkNiZlVRa0FCUXpp?=
 =?utf-8?B?TjBQSmhLSXQxTTU3WlJiWTA2cG16bjRYVWtacWpaWjVYZFRKVVRobSs4RDlB?=
 =?utf-8?B?NEkzejdIVzNyMkE2TXVQYXhKSElpS0JtZVBTTDNxcGwrL2ZzY3Npb2EvRDl2?=
 =?utf-8?B?V05XK0pLRWxTbXdxcmR2THBNdDc1YmpWZGpMNzM2NU5ONTJlMGZIa1F3aUhQ?=
 =?utf-8?B?c0JiWS84VjdhQmN5OHRld0xEUVpKNVF2STRCajJrTHFsbXljQnBuU3NkRURa?=
 =?utf-8?B?T0t6SUFXQk82NXVHZExNQTZMeHBKNEc1MGZhRi9RYWtaTkgxZGM4MWcwWXU4?=
 =?utf-8?B?Zm42Z3BPZXpZaS9Mc29Yd3FsR0hPQW1IWXF5dzc5RTdQTDNncllLUG1zSTlT?=
 =?utf-8?B?Y0ptbXAvMkNjZWxKZ0w1b1Nka3R2aVl0WkpkYzBBUTdWQUVyTDlpbzhIcVEr?=
 =?utf-8?B?b2JqU0hlYmE1ZEpsVGNEd3hHZFQzYlZkR3Ntcmp6bmxYbDdGSHJwbXJMZmRL?=
 =?utf-8?B?Tk9EZEZGVE1KcGlhWTl6clJZemlXNHlHUXkyZGRzYmRZNkpKNGpaTmtzKzBU?=
 =?utf-8?B?QVlnMXpONlh5aFd2dmkzNGRCOW1oTHJzOHB5UktQOUJzaVI2V25mVzdlR0o0?=
 =?utf-8?B?UXFkM01CM1lGT3psRk8yMzEwOXFOb0FmT1ZZTnVjMVErc2lvWGZhM3pDTUFT?=
 =?utf-8?B?UUdOZTRlSlhZOXBjSm5Qb1ZrcnExLzk4SnZFNVpreVVaODk0TzRLZzlybmkr?=
 =?utf-8?B?OWlNZWFlM294WDVEM3dBNHdHSkxQRGswaG5YKys5cjNDR2NTUFpjWWNPVnVI?=
 =?utf-8?B?RG1UN1plcHF6N0RSWitlNC9EVk1vZFlKODVoYjhPeENxTEtLK0tzdytvNlN5?=
 =?utf-8?B?cVc0TnppTExpR0xnZ1RmRzEwMVN1ZWo1UWdVYmJlN3ZpdTdYRWc0Sk1oR01P?=
 =?utf-8?B?a2JCRVNxSG1vb1hIZDcyd01lTUlTTHRqa3JlVlRLZHIwem1GWnVEcUVRWU1r?=
 =?utf-8?Q?Mm25PANuboGeOKMkzN6ifBxjw?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3104f890-06e0-4bbc-3a49-08da9488fc2f
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2022 06:35:29.5013
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RCMbjgNw0r+setBUYwJOtQbvK/fxCgIiQ1IP0oeS9FYi26Lbx5L0Wo0N6msDuK+6EA12wSCBhQuvLB1N6Zwifg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6877

On 09.09.2022 17:41, Daniel P. Smith wrote:
> 
> On 9/9/22 08:10, Jan Beulich wrote:
>> On 09.09.2022 13:34, Daniel P. Smith wrote:
>>> On 9/9/22 06:04, Jan Beulich wrote:
>>>> On 09.09.2022 11:50, Daniel P. Smith wrote:
>>>>> --- a/xen/xsm/flask/avc.c
>>>>> +++ b/xen/xsm/flask/avc.c
>>>>> @@ -566,14 +566,14 @@ void avc_audit(u32 ssid, u32 tsid, u16 tclass, u32 requested,
>>>>>       if ( a && (a->sdom || a->tdom) )
>>>>>       {
>>>>>           if ( a->sdom && a->tdom && a->sdom != a->tdom )
>>>>> -            avc_printk(&buf, "domid=%d target=%d ", a->sdom->domain_id, a->tdom->domain_id);
>>>>> +            avc_printk(&buf, "source=%pd target=%dp ", a->sdom, a->tdom);
>>>>>           else if ( a->sdom )
>>>>> -            avc_printk(&buf, "domid=%d ", a->sdom->domain_id);
>>>>> +            avc_printk(&buf, "source=%pd ", a->sdom);
>>>>>           else
>>>>> -            avc_printk(&buf, "target=%d ", a->tdom->domain_id);
>>>>> +            avc_printk(&buf, "target=%pd ", a->tdom);
>>>>
>>>> Apart from switching to %pd to also replace "domid" by "source". That's
>>>> fine in the first case (where both domain IDs are logged), but in the
>>>> second case it's a little questionable. Wouldn't it be better to be
>>>> able to distinguish the tdom == NULL case from the tdom == sdom one,
>>>> perhaps by using "source" in the former case but "domid" in the latter
>>>> one?
>>>
>>> Apologies as I am not quite following your question. Let me provide my 
>>> reasoning and if it doesn't address your question, then please help me 
>>> understand your concern.
>>>
>>> The function avc_printk() allows for the incremental build up of an AVC 
>>> message. In this section, it is attempting to include the applicable 
>>> source and target that was used to render the AVC. With the switch to 
>>> %pd, the first and second lines would become "domid=d{id}". I personally 
>>> find that a bit redundant. Adding to that, in the context of this 
>>> function there is "sdom" which is source domain, "cdom" which is current 
>>> domain, and tdom which is target domain. The print statements using cdom 
>>> or tdom already denoted them with "current=" and "target=" respectively. 
>>> Whereas, sdom was prefixed with "domid=" in the print statements. To me, 
>>> it makes more sense to change the prefixes of sdom with "source=" to 
>>> accurately reflect the context of that domid.
>>
>> Well, yes, perhaps "domain" would be better than "domid" with the change
>> to %pd. But I still think the middle of the three printk()s would better
>> distinguish tdom == NULL from tdom == sdom:
>>
>>         else if ( a->sdom )
>>             avc_printk(&buf, "%s=%pd ", a->tdom ? "domain" : "source", a->sdom);
> 
> Okay, I see you are trying to reduce away the last "else", but I have
> several concerns about doing this suggestion.

No, I don't. And I therefore think you further reply (left intact below)
also doesn't really apply. The last else only applies when sdom == NULL,
but the goal of my suggestion is to distinguish tdom == NULL from
tdom == sdom.

>  - The biggest concern is the fact that in the past, a domain referred
> to strictly as "domain" or "domid" in an AVC has always implied it was
> the source. At the same time, the target domain has always been
> referenced as "target". This suggestion would completely flip that
> implied understanding around. In part, this change was to move source
> from being implied to being explicitly reported. The end result is it
> then makes source explicit as it is for current and target.
> 
>  - AFAICT the suggestion is not logically equivalent. The current form
> checks first if sdom is defined, then prints it. If sdom is not defined,
> then it is presumed that tdom will be defined, and will then print it.
> AIUI, the suggestion will lose the case where sdom is not defined.
> 
>  - I haven't went to confirm this, but I believe the logic here is based
> on an understanding of when sdom and tdom are defined. Specifically, the
> expected situations are,
>   1. sdom and tdom are defined and not equal, report both
>   2. if sdom and tdom are defined and equal, report only sdom as tdom
>        is implied to be the same

This isn't describing the behavior - tdom could also be NULL here. This
is the case I think wants expressing in a way different from sdom == tdom.

>   3. if sdom is not defined, then tdom must be defined, report only tdom
>      and sdom is implied to be cdom

There are also no assumptions - see the enclosing if(). cdom is printed
only if "a" is NULL (implying sdom and tdom to be NULL) or both sdom and
tdom are NULL.

Jan

> Finally, as I was typing this up, I had a realization that I may not be
> able to relabel the reference. It is believed at some point you could
> feed Xen AVCs to audit2allow to generate an allow rule for the AVC.
> Though recent versions do not appear to work, so I am going to try to
> find a day or two to dig in and determine what influence this might have
> on the change.
> 
> v/r,
> dps


