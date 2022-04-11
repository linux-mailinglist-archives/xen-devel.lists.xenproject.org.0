Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 99A024FBBD8
	for <lists+xen-devel@lfdr.de>; Mon, 11 Apr 2022 14:14:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.303039.517010 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ndsvW-0007GX-TN; Mon, 11 Apr 2022 12:13:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 303039.517010; Mon, 11 Apr 2022 12:13:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ndsvW-0007EZ-QM; Mon, 11 Apr 2022 12:13:50 +0000
Received: by outflank-mailman (input) for mailman id 303039;
 Mon, 11 Apr 2022 12:13:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1peA=UV=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ndsvV-0007ET-Li
 for xen-devel@lists.xenproject.org; Mon, 11 Apr 2022 12:13:49 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d7351ba9-b990-11ec-a405-831a346695d4;
 Mon, 11 Apr 2022 14:13:48 +0200 (CEST)
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur02lp2056.outbound.protection.outlook.com [104.47.5.56]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-19-M85w8Hk4NZyAD8B56b1zeg-1; Mon, 11 Apr 2022 14:13:46 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by VI1PR04MB4656.eurprd04.prod.outlook.com (2603:10a6:803:6c::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.29; Mon, 11 Apr
 2022 12:13:44 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5592:2abe:fb16:6cd1]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5592:2abe:fb16:6cd1%6]) with mapi id 15.20.5144.029; Mon, 11 Apr 2022
 12:13:44 +0000
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
X-Inumbo-ID: d7351ba9-b990-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1649679227;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pfltAWvtqebYL/YjpIbHeXdHvY76RQY6YsBcpCchCIU=;
	b=Y73wMxcYGXO5rQo4S+RrCPkn0zKjN0LRgij4sYNChH+iq2zSdv+baNImOGUPki/zPugiX8
	YHNSBYP/JoMlL9TLbroeF8ywq+UKWb6vyNXStMTcLlPctogmjmlfa4F7zBIFE9eqkaaN5M
	D+LKfxVdA0VLDPHsDRccMA+o17M6YOM=
X-MC-Unique: M85w8Hk4NZyAD8B56b1zeg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jYc2t9Ps1dmAe3YeKDPoj4WcLkLvwppHS+1oKwPTS1xzAZVhM/st3VszAtzEHVBoFED2de/RkPRkH4zVM98dohCN+TewVPJy+ZvzRHD1DBHyz0hpugWBMEYw8VcH3vD93524Y69LQhpzT5jCS9oU4iaGw6HZLcoKuXxqHSBIeKdd8YGuyaGVqb0/KdmY/NSwmZKV8XRUDk5aRHoSZJnigyikqe6knVx3bJQs0t0+iJW2qVID8QPzUZBKhFmws1+b30TJ6/SsGvTtODWe58KP8tendR5NQ1S+PY/AarZlCZ5yu+jM0PqkXxgIO4/eCIzRsIhc2VmQAcXJ0/3CurKchA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pfltAWvtqebYL/YjpIbHeXdHvY76RQY6YsBcpCchCIU=;
 b=Dc05SpZpXQtv1Dk5E/XTwNBlyUXUYQq6sCCj6R90rHwJybdsx/pU5gHT7Br1s62EeANLMSRTz/a6YfMVvN11kzmWjRkyCi2fDfwiU0VAPtThYPBRKaT6VxyPIhCRa6OF448MgujYcMWTF2BDMb/nLxfkjDfm5WpDINZ59Y88y43vj5RLnz13Ls286ozqOK+zQmLRJo7fWhXsUM5j3zmxAIHfK05VE4bXcBsByJqH6qjUfP/Xk6iFw2ZtZeTRmw6VNSX0m71OsesOIISyQNTbmL8UJlyo/GmJuN3uXO6HIUSUKQSzf1QMWhPYNnl8zfKrTdvxrgKYPfjiiFP7hNbqqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <87d451fa-b8fa-05fb-1f97-c30a28aaa890@suse.com>
Date: Mon, 11 Apr 2022 14:13:42 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH RFC] evtchn: add early-out to evtchn_move_pirqs()
Content-Language: en-US
To: Julien Grall <julien@xen.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Dario Faggioli <dfaggioli@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <a0fbf06a-be3c-37bd-2abf-599912ad9bf5@suse.com>
 <42d16ff2-725d-ae10-ba6b-561487252125@xen.org>
 <3217803e-16d5-6e2a-bde7-ff9a1237dd39@suse.com>
 <decf721a-8062-a23f-a810-78fb86a42d1d@xen.org>
 <747017ab-9aa9-b958-8cbf-42c2cc3ffdb1@suse.com>
 <0f18eb04-7b39-da75-fcf4-f765d8ea28b1@xen.org>
 <e41da164-7aeb-3d99-ef4d-17c591af7e37@suse.com>
 <afea970d-fe71-5f28-edda-c51e80d6e3d3@xen.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <afea970d-fe71-5f28-edda-c51e80d6e3d3@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM5PR0201CA0021.eurprd02.prod.outlook.com
 (2603:10a6:203:3d::31) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 147b8760-1ea2-4176-d59b-08da1bb4b912
X-MS-TrafficTypeDiagnostic: VI1PR04MB4656:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB465606D4399A5D372118FF7EB3EA9@VI1PR04MB4656.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	4UGlWOJ9ImIMfN31VL9DM4jBiDErVUPaU8cO/axK0lHAS0IvYczvg2Uirlmt0qyL4DDSp8SQtlh2Wa6GQXlxhTDDWVzL2uPZyHafXuQQ73moEXZotJlKc7rzEkotNYZYnWQywIbod6LfIZMJTHlzPqnUExBiyqQaT5rj4yiWv4cSDCJAEVWwIfJsfTXnZ7xCZqix3nhhgb8BBFhJ1QxvMK88QQqpkQKfGSljPD9H1SdUYmHJZYkxp2J4QaRKgNpr+Bh4gAqCEcuJ+J29UwzdWL2j1c5xgGMrUX7MvEifuv58Rd7rYT2chAPRJMxP+wPLLPT8g5boISRuoiBiwNFThWYx6ly6IVlEHjtZ0s+TxRsjlVvopvkpfeop5v2tlSF+3TvKjpFidXvJUUxh90pjmfmPcufb6kkO78D//0viZSi8jhmdgZ0HRp2tTWiWauPGCf6CD4zq5NgAAlYcaJsB03pGOPwCy41rKotmRPTEWgO9mGs6eGN68aETRpYPJqZQVBeS+4DcQI3AKZcGlqHM5x+iSPEktTL4UiW7eXeYO8s1D4NAPJ3D+r1WI/rBgeKCgHUY46teyDIjSXWrilJaxZHStzc3LiNu756XmERLHLrGBTGhcPGqvTJfJgYWhW/h8744fiXFspbJJWyjfMxfNpdlMLhEdO+tfKpD1haCLeJGOoiRfANTCfD6Y81wa4yoU2EG3qivNfuudYZgdK1FfpYdmwh5OU5TVE1053Msr2j+DD6Q55Upe63cmcURH4Tz
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(66556008)(4326008)(8676002)(66476007)(508600001)(2616005)(8936002)(66946007)(6486002)(54906003)(316002)(31696002)(86362001)(6506007)(6916009)(53546011)(6512007)(83380400001)(26005)(186003)(31686004)(2906002)(5660300002)(38100700002)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dzZzNGFGR1IxODZMRHBuT29GOEFIQ0RKY0FMR0dZeTZUSUtId1pqUUoxY3dH?=
 =?utf-8?B?bkNBM2RUbjVVN3VCNmR3a2hETFVGaFNmL2dsVlNocVZOWFUxNWhsYmpZZVRw?=
 =?utf-8?B?VW5EU2UzRjREZk1YTzZ1emN0Z0VmODg1ZlI0TmRYM0ZMNUVGVm15RzdGYzY1?=
 =?utf-8?B?VGFUK0toaE1KSkpuR3JKLzhHVytLOTVBK3k4WG9acjg2ZncyVThzRUtkdUhE?=
 =?utf-8?B?ZnVHVWNHbEd1UG1mYlpHZ2c5aXl4Wjgyb25wbnBwbURkaCtISUFzdWVPcElO?=
 =?utf-8?B?L055NTZ1WFdaTmFXb1ZpNXc2TWxabWNHUDRkWWN2V2xLRjhLanJvcEJmekdu?=
 =?utf-8?B?ck9mMVRPWk1MMVVlb3pIV0F0WXplN0lHd0JPeHVTVEg3ZFFKeWhDRWJlZjl5?=
 =?utf-8?B?TlllRUV1eTN6ZXdyUVl6S282VGlkZnhtVzJhUEVhNWxlcDdlY05WVmoxaUEz?=
 =?utf-8?B?VXAwb2s1T09hWmp6eDFVeU5SbEhwQ3VNejhLMnNxdURENjBad2ZqdmhpaTg3?=
 =?utf-8?B?MmpKWlBaYVJMSThTcVMyTDh1ZGQrMDJlTHZFSjdVYTVZb0RaZ1diSHRPU3By?=
 =?utf-8?B?RDBEc2E3cENaRm9RK3k1QThrTWtuZmZDKzRQY0JkMVJFNEkvTkJUamVkNHFw?=
 =?utf-8?B?WnFQaTZZUU10SWlUSU5qN2xzU1pSODV5QmNKa2FFN2N6TGgxS0RyUXRKWHFz?=
 =?utf-8?B?TjhQdm1FUVJkT0xQZ3lGSzFzdU5YeWpXNEhQN1YrR0xxeVNFY2YxYXYzQm9Y?=
 =?utf-8?B?M09TZkh5UmpJa0hzWnc0ME5UVkkwTG56VE83Zi9rU0VmUTNoc0pmRGwxUVlt?=
 =?utf-8?B?OFZEQy9LdDYvSDBwclBRTHRvT0ZvZGg2QnM2ZDQzbHhkQmY3K05nQUtUdjhl?=
 =?utf-8?B?cWY2T1RTSlJzVHlYYXVrTmxHMWh0aDU0bmpUeWRCQ3BCN1JKZXpFRkZpZ1d6?=
 =?utf-8?B?STY5bVFqQWliREI5cExXNU8xSVgwSWFIRzh2bkNBY0MwaS9ERjFFQ2pqeGt1?=
 =?utf-8?B?ZnZsdnRMQVlpZDU5Y1FXRUZtdmZLelFxTERSN3dQdVBQY1JCVlJzZnhIZGhB?=
 =?utf-8?B?akZydWhBN0NWM0VIQWVsMERNZmdvOGRBVnlDdG94QThicWR3cU1tekxwTTlG?=
 =?utf-8?B?dFF3RTNmSnJvak1LOHZsdHp1eEszTktxcW5selFkQ3RSMExjYjFEaCtIdXJu?=
 =?utf-8?B?VHlEZU00UFQyVlkvWHdYNHpXdHVxWGxRdjZBc25nYUZ0QTdud24zSlVYMW5V?=
 =?utf-8?B?NThINjdwT2FkeitNSlVvSmNjZnJpVDdJc0M2VlZ2WURuMjhnalZCWTBIai9l?=
 =?utf-8?B?QW9tZFJHa1hMcnRXejZzZDRJRDQ2ZkJKbld3VEltclBoUjFBQWdlaWhyaGQw?=
 =?utf-8?B?Z3NTRVlFVW4rMWYyZ1RFcUpnek9oYlE3bTA4ZzRxdGRQSmM3ZFVWNThlUUNt?=
 =?utf-8?B?SGJwZ2xFQVFSdWlpejRjQUVESGw1Zk9QenFVVW82a2NKZlAxS3ZiSW85c01a?=
 =?utf-8?B?RlJUNHhUM293WWtMbXdGaVVwQmU2S1hxRlNPMUxYWEZCZkhscEx5RmtmN3ZY?=
 =?utf-8?B?L1J4MUVzQlE3elI2c3VCSDV5RngzOGE3M0c0bWFXU2JYR1pFenRlaUZLK3ZZ?=
 =?utf-8?B?ZVJ5NHVRZHFjU2twZmpVc01qT1dKcjN2aTg2WUI1YVhMTHhlT0p2cTF3WFRk?=
 =?utf-8?B?SnIrVXRPSWdrYkdZN0lUWjhSZlJuTHJTSXh3TGVPUjlVU2RSSjNnNDhOUGlq?=
 =?utf-8?B?eExEcnUwYUtreTZiVStBZzlrdXdHcmtSZHFNNGRjU1N6TkVreVVIZ1ZhcWtr?=
 =?utf-8?B?SUh4L0I3c3NDRk5NVW1qcW03Zkx6NWIwQ0N5RjIrVjdmTGVJS0NiZUc5N2h3?=
 =?utf-8?B?eDREY3NDeGJKbDhuL0lqcW5raGFmaHBnWWYrVGU5RlJwbTdZZXUzQlJyK3pa?=
 =?utf-8?B?M2kvT3FXZGVXMzVCU0ZPNndwY29qQ3ZTdTdpZUszMi9obDBqUjRrd21raU9Z?=
 =?utf-8?B?RTJlcWhleklEYjBZMXBXRXJzem1NSkh4SDNpVmxKdys4cDlkZjJjUER2VnUw?=
 =?utf-8?B?M2owaHJLQ1BmbUgxQklzR2d5ZWlIUnBjSGEvS0hRbEN5ZngxeGlnKzFOdjZR?=
 =?utf-8?B?T0ljcEQ0QVEycTkzR3loVm43WUhYSmM1UmR1RTdHTStwUGdmL2ljOVRSUitn?=
 =?utf-8?B?c3J5N2RnSTRkeEhxLzJJKyt1ZDFjaDgxR0ZRbitaNEx2bDBRQi9OSnFvcnR6?=
 =?utf-8?B?ZTlpeDl6Qm5SQmg4YTNzL1VNZ0VVVDliM1N3MjRhYUVselhyQVlnUEVQTjY2?=
 =?utf-8?B?ODZ5THVwK2dXNW9aWEhOTFpmSkxzUC9VUTh3a0dKL0VNNit3OVlqdz09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 147b8760-1ea2-4176-d59b-08da1bb4b912
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2022 12:13:44.1784
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XzNBeWA4UkF9XQHIXTxnRdcDZs3vYK/5asL+cViWSxxcWb+wEQ5G43P7GQQyS6X87mIzpvscdzv/AwBHs+enbg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4656

On 11.04.2022 13:00, Julien Grall wrote:
> On 11/04/2022 11:45, Jan Beulich wrote:
>> On 11.04.2022 12:25, Julien Grall wrote:
>>> On 11/04/2022 07:13, Jan Beulich wrote:
>>>>>>>> --- a/xen/common/event_channel.c
>>>>>>>> +++ b/xen/common/event_channel.c
>>>>>>>> @@ -1559,6 +1559,16 @@ void evtchn_move_pirqs(struct vcpu *v)
>>>>>>>>          unsigned int port;
>>>>>>>>          struct evtchn *chn;
>>>>>>>>      
>>>>>>>> +    /*
>>>>>>>> +     * The work done below is an attempt to keep pIRQ-s on the pCPU-s that the
>>>>>>>> +     * vCPU-s they're to be delivered to run on. In order to limit lock
>>>>>>>> +     * contention, check for an empty list prior to acquiring the lock. In the
>>>>>>>> +     * worst case a pIRQ just bound to this vCPU will be delivered elsewhere
>>>>>>>> +     * until the vCPU is migrated (again) to another pCPU.
>>>>>>>> +     */
>>>>>>>
>>>>>>> AFAIU, the downside is another pCPU (and therefore vCPU) will get
>>>>>>> disturbed by the interrupt.
>>>>>>
>>>>>> But only rarely, i.e. in case a race would actually have occurred.
>>>>>
>>>>> Maybe I am too paranoid here. The other side of race is controlled by a
>>>>> domain. So wouldn't it be possible to increase how often the race is hit?
>>>>
>>>> Yes, of course - just to harm itself.
>>>
>>> Are you sure? Wouldn't this also harm the next vCPU running on the pCPU
>>> because it will get interrupted more often?
>>
>> Possibly, sure. But we don't make any promises here. And recall that
>> this optimization as a whole has been put under question in the past.
> 
> I don't remember this discussion. Do you have a pointer?

I'm sorry, but no, I don't have a pointer. This may even have been on irc.
All I recall (or at least I think I do) is that it was Andrew who raised
the concern.

Jan


