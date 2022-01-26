Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 06A4449C44A
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jan 2022 08:28:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.260671.450558 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCchz-0004Uk-K2; Wed, 26 Jan 2022 07:27:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 260671.450558; Wed, 26 Jan 2022 07:27:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCchz-0004SH-Ft; Wed, 26 Jan 2022 07:27:11 +0000
Received: by outflank-mailman (input) for mailman id 260671;
 Wed, 26 Jan 2022 07:27:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OZ3N=SK=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nCchx-0004Rs-HO
 for xen-devel@lists.xenproject.org; Wed, 26 Jan 2022 07:27:09 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5de044f2-7e79-11ec-8eb8-a37418f5ba1a;
 Wed, 26 Jan 2022 08:27:07 +0100 (CET)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2112.outbound.protection.outlook.com [104.47.18.112]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-3-pbNVz2CNMliLxo1dvg2ZIw-1; Wed, 26 Jan 2022 08:27:05 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by HE1PR04MB3004.eurprd04.prod.outlook.com (2603:10a6:7:1f::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.17; Wed, 26 Jan
 2022 07:27:02 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::a1a4:21a6:8390:b5d5]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::a1a4:21a6:8390:b5d5%5]) with mapi id 15.20.4930.015; Wed, 26 Jan 2022
 07:27:02 +0000
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
X-Inumbo-ID: 5de044f2-7e79-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1643182027;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OEX4N2B01Jxm0BJaGdJHzMtz1VgusAUO3h04R7rCRj4=;
	b=FcRrSGpvMpe0eMMUMk5Hsg84d9BD30ssCZID1m4zSdxpD501vlrStjVo8fkbHD1rHawHKi
	AZj2geNVSFFM/dUcOP4VZEcNUBP+CjlhUWFIMXLX/QOC9nngQPFmceQfkvXYx6Wtopug1+
	xrwpuYXkz4e+HRGv9fAaWKgGGcDB5iU=
X-MC-Unique: pbNVz2CNMliLxo1dvg2ZIw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Hac++wy36rKJjnofiAASRw+8JsEQGhIzy5yPtlai524Gy8ISiPLQKi68R7NDtn/I5UnPKkl/eST5E/rHNKfhmWCCcjsTIOvIxizLLWASCKDOsPPcQEXlveeC8bZc0hn+hHMK0inMQCPRvSQuHPOheN+4Z9OGzVjb2P976L3hc1xm/KKdWR1+VdgrYPLCYZHxfj0VSTb3A7PoEfHMZFvRqA9pW8QAGnvw8uii/UJtwwLHUPUz8H5ua5BT8m5zUZ1uAqW1U//FySaHTV9F3jetLGeSeo2lqOLZ2yVMf/16aKDFfVwhJh12TY2UWLfzS2l+oUcmJ9g5jAqpC9qYv1kNPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OEX4N2B01Jxm0BJaGdJHzMtz1VgusAUO3h04R7rCRj4=;
 b=nze/kLHRDjzqJoWj0Epp9lOwQH0jDX8Yod783FrgowPz/JfhaRgMxMAUABfb1wOsT6AiThXQn1E47N8UrcVh9ukzY9nQC/YKnrGGxOFEuc8d4KGAy6LbtCocKUoVyiX05q9o3yGHUjWkEbX5RrDmsaBBnOSYSUPZd4JhSP6GY489DSlOM174nf8jbHjrkML0j6Z4F8lJNMw9IKY7rk4vvXNZtAR7hL1iDRQxWq6ADAW0cMtSvT1c1PVPS/Rf3sQmrrvKGji/iE0lVgJ2Mcvni2oujSjTW2n1f+7GD390XNk08tHDbvW4JrcAvXlXoGUh2hKfYTrt5rf6nAv3rdKKkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <0d873a8f-a461-80df-755e-f636039c7177@suse.com>
Date: Wed, 26 Jan 2022 08:26:59 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [XEN PATCH v2 2/5] xen: export get_free_port
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, jgross@suse.com,
 Bertrand.Marquis@arm.com, Volodymyr_Babchuk@epam.com,
 Stefano Stabellini <stefano.stabellini@xilinx.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>
References: <alpine.DEB.2.22.394.2201121646290.19362@ubuntu-linux-20-04-desktop>
 <20220113005855.1180101-2-sstabellini@kernel.org>
 <f3b2ae98-c7af-d8c0-b0a4-52e622517c34@xen.org>
 <alpine.DEB.2.22.394.2201241652330.27308@ubuntu-linux-20-04-desktop>
 <14af544d-0d20-9b58-4d70-5f5086ece032@suse.com>
 <alpine.DEB.2.22.394.2201251435030.27308@ubuntu-linux-20-04-desktop>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <alpine.DEB.2.22.394.2201251435030.27308@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM5PR0602CA0022.eurprd06.prod.outlook.com
 (2603:10a6:203:a3::32) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 02f242b9-4c26-4677-a8e1-08d9e09d3ef0
X-MS-TrafficTypeDiagnostic: HE1PR04MB3004:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-Microsoft-Antispam-PRVS:
	<HE1PR04MB3004055CDAE1A829B6862827B3209@HE1PR04MB3004.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	z5zDw8SJTj0JWTS/TPH0eUrl0hM9PHZusf1xkQ8e75QxjL/mTmi/F3S3s65xSGheUU+zIA89I560US//5mCtDszJPBQ6KlRldsPF13rde1fxuIphBmT4oIjCnGUWGJ97fOauWOGkdKe07IjyW0IajR4BSibJiX3Sl2A1fkqMKs0vncTt+g8LBlHgquiRJzJdUYPX+1yl7xcZ8Gnma3iXX8sqnomSwA5XgpmQOKS6wpTAPoqjbBZTtQ7Mj+mhB+lJUyxf/XXymLsQoFl6R9yDQiSQbyRWScFQKsfuu1JKeAFO+8L/cnODVoGl0fFqBWP+uBJXFHoorgqSPVsOwS0oC5nN0dWxkyF36gkppMh3KvhNpc+nbS/bgSKPRd5QaMkx5FEvdTMd2i2FGCVI8f0TB56I8nNXIyGmaKIcg833Z7CuHrDazuUN1sM6cbeyPfkh+MCrUr4G7BwQtHh9LgD279gAdd7iKzTSP+ZHfQTGbPni1IG7Et2KKf2FYy/fSSp9Ql4xcrcySuOOvPGf/moriyQZcBlcEMip4igB60aaTHp3tbpHKLCAD6UQFp1FeEjAuzWKibr07HKXLq2QubIbL+9zvWNEkaEK4Ib2wrt/wBwaD40a5V4lO/Q8eCaPVeKV4xShCINc52rlQRLXVHMqAFcn4XimmhfCJQsKZSbuPNmh+/lsquz9yNzmUxyv4I9d/a3H0JoCKl48t8OH0ovKk9US9tkSrKKg7Vvkn3f0/Ok=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(66556008)(66476007)(66946007)(6506007)(53546011)(186003)(86362001)(2616005)(31686004)(6666004)(38100700002)(6512007)(6486002)(31696002)(316002)(54906003)(2906002)(6916009)(8676002)(36756003)(8936002)(26005)(4326008)(508600001)(5660300002)(83380400001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZFVWTDNiM1JhamRuaUgzRWxZanl4bUVaeHF2a2VUV0Y3RmpBNWszRnZTZ3Jz?=
 =?utf-8?B?bTdieVVMTUcxTHhlZWZzbFFEREtNd2JXRjgxT2QwUEdGcEQybnZuUlNGR01Q?=
 =?utf-8?B?R3h2L2ovbGJGcGREcGJGd3hhblNoR2l5YXZYRE5QQjUyQXBCaStUR2FiaWxX?=
 =?utf-8?B?SWs3WHJCNW84NDQ1ZzNYRDA0RFhybkNwdHJ4UEJOcnFySFV2TVFrdktRV1hK?=
 =?utf-8?B?akxhU0k5dTZRZkJnZWJqTERGeTNHS1BRVnpkSE45ZmhGYkxJbVFWMkdGVWE1?=
 =?utf-8?B?dWV3L2E3NUNmZDlxaGRPUk9jQTllUm43ZWF4Q2owWjhTZTVTdzI0b3Z6b2Zo?=
 =?utf-8?B?Qk56aTlqTmlOS3VTWkt6Vmd0SWRFRVRWYWkwQVQyQ1JXdlN1dWZXcnZwWnBL?=
 =?utf-8?B?bUpidXFiUVZMZDNMK2JyMFIvVUw1U1duaElpVmwwU1EraEI4Vkc4WktUek9O?=
 =?utf-8?B?MXJyNWRhVFVnd0cwSDdURVFwTVJZNytVaER1SzRYR2Q5RDBCVkV4OGc4dld2?=
 =?utf-8?B?LytvaXZtU1pweko4TUFNWFBwZmw2RjVGbml2ZzlVK0tlaU1jVVhFTlMyelZG?=
 =?utf-8?B?b1hSNzhOUC9rMWlQWWU4NXVoMCtKNVUxckN0Z2wzVXBvTStmd2U1YWFsay9Z?=
 =?utf-8?B?bW8raHFLNS9McWRKZTlZU3QwaEpkSHF6M2wwWWRYb2dkWUgyRjZtWUVkYTMy?=
 =?utf-8?B?S0c2Y1RTQWlQaW5icXBtZTFPaEhDN3NUaWdLZTNLMnpONVJlL2J5ZlpNajJu?=
 =?utf-8?B?aktncUt0Mnhlck96SHoxcHJjY0dYS0R2ZHhnbmtZbFFxVFBtalpZZ3NoQjA3?=
 =?utf-8?B?ZlJYUFFUU0QxcG82UFljU2JiYUFLc2oxTjZLa3RTL1lmL2xMdVJtcUcxOHJu?=
 =?utf-8?B?NFhReG9ndTgrRHJEOWFlQXlHT2FjeDc4dWtrbFdJV3A3REpVaWlUV28yZElK?=
 =?utf-8?B?QTVGbVlyU3k5TEVwb3FmbGV6YmpJWUZUM0lhVG9iOGlJejlEeUM5UkMrcU9j?=
 =?utf-8?B?UEdRRktiSCtRL1U1Y1BWWFdBVkR2WmI4VCt3eEV1MTdNUmg2K2dBaHdaemZY?=
 =?utf-8?B?NytuU0dLODZlWVNZSzF2VCsxSTNKWDgrNzJSTCs1cWlYSkI4dm0yRHR1bllV?=
 =?utf-8?B?b0tQVU9tVnhBeExhUTNJamNzY3FEMWF5dmJnL2crMTlrdmhYYnF1M2NnUERT?=
 =?utf-8?B?Z0dNdnFjSDEzaDJBNUlyd0YweXd6RVBidm1hQVpURXc2WEI1dUNCV2Z1NHFi?=
 =?utf-8?B?RlM4R2ZxTFZpQ3RRaUlXVFM0QndySzVRNzFLY3JleDlLT0lpNEdnd0dPU0JG?=
 =?utf-8?B?Rko4NE9ieElQWXVoZnNYdXhzNmMrdkJXMDcxUnE3dTJwdk5uY3ozWUF0SVh3?=
 =?utf-8?B?SzEvR28vVnovaWl2MW9xeGhoZzEzQUs3RTQyUE1WdDE0YjNHaXZOY25nMm1W?=
 =?utf-8?B?OGpFSjVmeWdEWWFDYm1YcnBZbnNUOXl6YUVub0tVUnBhR1lzaS9nS1JNQzdQ?=
 =?utf-8?B?OGgrNDZNUXhjcFRURWdGbVFrNXprdkUzZzJpR1dnUXVLSzVEQUVveGx0MTFp?=
 =?utf-8?B?Nk56aWFvSGNTdnBBOHhiT0M5RlNDSWJCUkNwVjkvc09kcTltZXdwWmNtZDZQ?=
 =?utf-8?B?RkNxTmtxRi9JRkF5cG9ZVUdLMkR4N2Z4V3ZrWHVnWlZZbHVzZFpXQ0g3USs0?=
 =?utf-8?B?Q0xQN2kvd1pLZ3VRR00xcW5MR3RKcHRMeS9jd2NtNDhWYUhCaXIxR2dybnVU?=
 =?utf-8?B?RlU1azlrRWFPWGpwZnlmNDREL0xScExPUkN3MG13VU44QWJmV1cxRzNDTzk3?=
 =?utf-8?B?OTNqNUN0U2FXVzV5UWp2anlZWllDMnJxS1ZwdktKWlY4bjhXVVBNbFU3MStp?=
 =?utf-8?B?WnkrKzl4cnRad0llcnZnWVJiSlY4RHFZT1FGWCtGZGk2ZkNkOFQ1QWx5YXVv?=
 =?utf-8?B?TkZ0T1ZzSW54VzZjc3lWOTloS3E2NWcyKzl2d0FnNGNjckdNZ0ZJMnlVNmFC?=
 =?utf-8?B?Wm1NcEFsTnpxZWFvb1VFczduUlZxaGlmck9lbzhLdmNpcUdPc1N3QU92elRV?=
 =?utf-8?B?TXRsMk9pdnhWcnN4SFl1NXRVeExCakYremxLNjR1dGlNY2lLbis0N3hoSzJI?=
 =?utf-8?B?cDY1MWJiS2kvd20wWGpmeU1oc1NPZUJ0Z0tlN3pwdk54eGdOdkk2RFRMSU1H?=
 =?utf-8?Q?fefYS0+FoGx0CzMz03vVQR0=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 02f242b9-4c26-4677-a8e1-08d9e09d3ef0
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2022 07:27:02.2738
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xL/NE5OW5dvKaDKXA3cS6bRsmU5IcB/pSUsRCbNXw+mmhxex1MZcVVgNcNO3fvAy9+JdzOvQrjBltRj1ffkKng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR04MB3004

On 25.01.2022 23:49, Stefano Stabellini wrote:
> On Tue, 25 Jan 2022, Jan Beulich wrote:
>> On 25.01.2022 02:10, Stefano Stabellini wrote:
>>> @@ -284,7 +285,27 @@ void evtchn_free(struct domain *d, struct evtchn *chn)
>>>      xsm_evtchn_close_post(chn);
>>>  }
>>>  
>>> -static int evtchn_alloc_unbound(evtchn_alloc_unbound_t *alloc)
>>> +struct evtchn *evtchn_alloc_unbound(struct domain *d, domid_t remote_dom)
>>> +{
>>> +    struct evtchn *chn;
>>> +    int port;
>>> +
>>> +    if ( (port = get_free_port(d)) < 0 )
>>> +        return ERR_PTR(port);
>>> +    chn = evtchn_from_port(d, port);
>>> +
>>> +    evtchn_write_lock(chn);
>>> +
>>> +    chn->state = ECS_UNBOUND;
>>> +    chn->u.unbound.remote_domid = remote_dom;
>>> +    evtchn_port_init(d, chn);
>>> +
>>> +    evtchn_write_unlock(chn);
>>> +
>>> +    return chn;
>>> +}
>>> +
>>> +static int _evtchn_alloc_unbound(evtchn_alloc_unbound_t *alloc)
>>>  {
>>>      struct evtchn *chn;
>>>      struct domain *d;
>>
>> Instead of introducing a clone of this function (with, btw, still
>> insufficient locking), did you consider simply using the existing
>> evtchn_alloc_unbound() as-is, i.e. with the caller passing
>> evtchn_alloc_unbound_t *?
> 
> Yes, we tried that first. Unfortunately the (dummy) XSM check cannot
> work. This is how we would want to call the function:
> 
> 
>     alloc.dom = d->domain_id;
>     alloc.remote_dom = hardware_domain->domain_id;
>     rc = evtchn_alloc_unbound(&alloc);
> 
> 
> This is the implementation of the XSM check:
> 
> static XSM_INLINE int xsm_evtchn_unbound(
>     XSM_DEFAULT_ARG struct domain *d, struct evtchn *chn, domid_t id2)
> {
>     XSM_ASSERT_ACTION(XSM_TARGET);
>     return xsm_default_action(action, current->domain, d);
> }
> 
> 
> Note the usage of current->domain. If you have any suggestions on how to
> fix it please let me know.

As an alternative to Julien's suggestion the function could also simply
be given a new boolean parameter indicating whether to bypass the XSM
check. That would be more explicit than deriving from system state.

Jan


