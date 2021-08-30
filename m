Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 56CE83FB6F0
	for <lists+xen-devel@lfdr.de>; Mon, 30 Aug 2021 15:26:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.175088.319062 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mKhIU-00064I-TE; Mon, 30 Aug 2021 13:25:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 175088.319062; Mon, 30 Aug 2021 13:25:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mKhIU-000628-Py; Mon, 30 Aug 2021 13:25:58 +0000
Received: by outflank-mailman (input) for mailman id 175088;
 Mon, 30 Aug 2021 13:25:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=YhGR=NV=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mKhIT-00061w-FJ
 for xen-devel@lists.xenproject.org; Mon, 30 Aug 2021 13:25:57 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8597a4f1-76c0-4f95-b893-a89753d0d250;
 Mon, 30 Aug 2021 13:25:56 +0000 (UTC)
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur03lp2056.outbound.protection.outlook.com [104.47.8.56]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-32-B_w0i8RnOvOVGvQKCEeWgA-1; Mon, 30 Aug 2021 15:25:54 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VE1PR04MB6669.eurprd04.prod.outlook.com (2603:10a6:803:125::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.23; Mon, 30 Aug
 2021 13:25:53 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4457.024; Mon, 30 Aug 2021
 13:25:53 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR0P264CA0239.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:1e::35) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4457.20 via Frontend Transport; Mon, 30 Aug 2021 13:25:52 +0000
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
X-Inumbo-ID: 8597a4f1-76c0-4f95-b893-a89753d0d250
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1630329955;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YijU97BGAya0YebLzbC8pIWYa7G/7VdXA4ljHZeR9k4=;
	b=Fo+25+So5OEtUC4p2r1NB+t7RCoR/fEJqqyKBfUS7dJ7APsDYK7G8lmB4UVIE7lJF79EzO
	eA3mp57edTfOUipPNY8i1OR6LbhAA+6R/Arz28Zhsj9lO7V6pM5dS6/IfAUnHkxkxzomfE
	8nAjmZ/1x6xCsHVyHGbmzVA3U4c2mLo=
X-MC-Unique: B_w0i8RnOvOVGvQKCEeWgA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UFUmzMUigR9DkqFBStnHUW81tR8hubZoh0j/LFN2/SR+7VZWIbQwKYi7qJMj0AZJCWkKrnCp8FxlGOoB3QjAjJLZqKUY0/f6vl15Kklod5YYiiOtUqk7ZYgyj0egc7gE2JZW9s5EkJ2joBmys2j/y3G/XOqzJvGw8Sz+4QP9scrxR6295C6wEJ9gdtOJgDDGQAaHZPEASLqc85Uo7xFB5Xo/7S+vbGLAuJheHpBVxyk6vNkLfAFy68uXLyDmMu0gWULPTGPtAnIe0FuO/KERA48S89rtpcmbyeCJs/YAmwflfEbSaQwPqNkSnkexKDpaZEthyz05MH/RUVF6M3NYyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YijU97BGAya0YebLzbC8pIWYa7G/7VdXA4ljHZeR9k4=;
 b=QnppbTxyekhzGDofvIXWeCE4n9ove/o5onFaFje4S2p5p1eeOXGeS00dm7w+2x6o9LPKUyXzcVz30alTClHhlpHrDpJe6+EBXwMkFF74Ir2Ms13blqMtpvZqAYN3Sb7W0zcCq4pzrQaFmdYDQm5a+yLtboOsh8/U8dwYe/0pkw2jt0npxFkgdh9ABEx1zLUppcNl71BdAP8aRraJErL5fDZkOZuqpZuuDEghA8Kru9tv5mUu806jx3w1QFf0sLE80VtmbLFUEC/UdfiLItdsnplFIuUUkwePA0DAIgCUkNiyTUQm4rhx/s3n85T4GvWG+kQ2msqS0VM9AI8YIEmSzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH v3 6/7] xsm: drop generic event channel labeling exclusion
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20210805140644.357-1-dpsmith@apertussolutions.com>
 <20210805140644.357-7-dpsmith@apertussolutions.com>
 <dc2fbefb-93fb-4574-ef7b-23a9c9a248fe@suse.com>
 <bed0ac0e-b5ba-d8e4-3869-3db493b3c890@apertussolutions.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <509a28b0-da33-fc00-1674-c934afae612a@suse.com>
Date: Mon, 30 Aug 2021 15:25:51 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <bed0ac0e-b5ba-d8e4-3869-3db493b3c890@apertussolutions.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR0P264CA0239.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1e::35) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8f0184c2-e6b0-4546-5c75-08d96bb9b0f7
X-MS-TrafficTypeDiagnostic: VE1PR04MB6669:
X-Microsoft-Antispam-PRVS:
	<VE1PR04MB6669057863A7406093D3BFCCB3CB9@VE1PR04MB6669.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	xjIUbaterPml8j01ou0/g2udkY+1iEE/0xgyV8SKMWMRYT92fMHEEMTSY5aaVYoNB22VPWmxvpjrqX0LgwXDYeDFp2cmdlQQuRrOR2sxfHoshZ2eYFmZ+FGcZ9/IXusXYP1QLfkyvKRoXNmQUen8eBmdS0yXqfyn0tcx4ts5dDVP7sfGlUyX+nAgKcxJxcuIIKjsoUnkdCjkrIZseRBK+Ok/bTOuJQxA5CBeWuUs+ghm8U+6imu5P338zNAY8Yyj8dDYLcj4NjH+DZfcgeAEMAD99Lsj1X69RyofetLAi5OJl9jxcyUwbRGd5Ous7PuAij7fgqsW5KPS6XIfjNrJkcsFJ9oGDlCaYe+jKjO0/xiBcR7X9pSdh/u4Jf6wYsIvMTtqzkVfeTVw/rj2UZ6QzErObblgpkqI4fNDJDeRkYP7xlYrKJT7oc9JqIq7TEznfHyh/IbugaJq7tX1MHekxGnJFYe/FeBokIm9L60DnP6dW/huHbQP3U6l3RqchsU/Wtdm+og6lmm7nMIFIQjRmbV1komVxswauEWAe63CS/6ikXGcqfVLDdt1/XbH7nUXuyAr9YdE37psXv3aY08MV260ETLQzZNrudrQcChPfLIlCxuKpIdh8eV4CdFQa+CkxR7y+OO0PMM6nXqldBKdI+qy+4TeWAnkCRKjR6ldfi5NneoUKBkG8gmLFdE0g+44luMYgTjFFZQdrxhs7/E5pXHOdkGHNiTt7LnDtIeafcADVJ0disQHvrloYWqNYnSQwNTiGrRK6+B5bh5DhhU+5Q==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(376002)(396003)(39860400002)(136003)(346002)(366004)(2906002)(316002)(31686004)(66556008)(66946007)(2616005)(956004)(86362001)(4326008)(83380400001)(5660300002)(36756003)(16576012)(6486002)(53546011)(38100700002)(8936002)(478600001)(8676002)(26005)(186003)(31696002)(6916009)(66476007)(54906003)(41533002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?c2ZiK0FKV1Z6YlJhRXRxU3BtVUpkZis4WW45ZkZqSnlxZnZ4bkl3Qk5pM0NH?=
 =?utf-8?B?ek5XVmpOSlRNMkpHR3ZOdm9tNGhwQnoxbFhsb3c3MGVPZzl4dzR6aHp3NzZD?=
 =?utf-8?B?WEQrd0FXbmp2bkRNNHNBdWcwVEtlSnBidU9JS21wMURNZDRLV1UyUmRTNGFw?=
 =?utf-8?B?Szk5OEdzY3VIR01TNHdvWFU2UjA4VUhPbStnMVY5bG13elllV1gzVnUwb3dx?=
 =?utf-8?B?anIvWHBGcXRmUFdXS1pGQ09LS3IzclI5TXdHeXVFMlNRQUxXVFJVN21WalIw?=
 =?utf-8?B?UHV2OTVxMU9SZ0J5SGlvWVR3cmorUkNmUDNRSElsWTUwSXRUMDZ2YzJJclhY?=
 =?utf-8?B?V1ZIK2RWdk00ejJsSjFOK3lqemZ6OVozOEFsOU9OeDg4SjlkeXo0OGpKVElY?=
 =?utf-8?B?ZDRKd0RMR2g5VUZOVENSbE4xVmhYeTY4UXdLcHdZaTh3aGx1VEtmaEQ0aTBY?=
 =?utf-8?B?dW90ZFJZUVpyQzZGMTZuUnFqdzdJSTluUTdwTHAzVHFweHp0Ujd2UE91OVZz?=
 =?utf-8?B?a1NCdTNDU2luaGV5czBvNCtvYW8rcjUrNEV5OFpXNnR2VjJwaFg1RnJFclo2?=
 =?utf-8?B?VTVxUXhTaTdZY1lZaTZGbXhJRlFDTGhXeUg3MytLMzBObW1DV3BqUkd4cGl0?=
 =?utf-8?B?ZmFPTkhjaFFNbGJWSmFlc0NPQ1h6ZFNYOHNlZXJYWGdhS28wQWZKeWlOckQv?=
 =?utf-8?B?b0VKckF5MkxXRjQrcHBobWFqa3lnN0x1NHlnWkpGZmQyUDNIVGtGektQenBO?=
 =?utf-8?B?Y3JhMXliTVZhRUdaSkt0T28wSkQrVjh3V2tOVW80ejVQeDROaTVjMnROVEo5?=
 =?utf-8?B?NjdZVU9SZ1VLTnRXbHRnUStpa0Y2VUJ4MXNoTC9nclZ4RGtqSkh3OW5TREZR?=
 =?utf-8?B?YkI3QzFKWjFDbm9wdEVxekh4c1owR0YydTRuV3lROTdOZmE0aUgvOFZMUE1D?=
 =?utf-8?B?eVY3LzI5SlhXWmJiMUxhN2w1MTlPaEEwN2tTZGxVQVZXVmIybEs5dStDUVRm?=
 =?utf-8?B?WHFGdWd0c3l4bUdRK2Y4TktYVEo2THZpY0FvL09la2U3Nm5BNUs1ZXZ0M0F5?=
 =?utf-8?B?LzVSL2c2c2dXZktRV3ZsM1RZNE1RRGxBUjlXTXFLK3k5R09aL1ZhT0hQT0R4?=
 =?utf-8?B?RTNUbDc2SDdFYUMxTkQ1dUh3aFh5NUsyeDhEOTk1NGFkVHBkS3ZUZThuemYr?=
 =?utf-8?B?K1B0RlNnb1BaYjViaGwzWE9weGtkNnpRVUFuUTFtWjBBS0Nxc0xkZFhISitu?=
 =?utf-8?B?NzRkNUpTMFRUN05OYXlocFpsNmVBQWxnbmptVlFTNGJFenBIc2ZFTkM4U29r?=
 =?utf-8?B?ODdrTVo2R3dnWHllVjhNSDJDOEIvVWx3OFgzV2FieUVtTzdIQk5HUitvZjNh?=
 =?utf-8?B?Sm9INkNCOTNhS3pIdGNoaGlDVW1BV2VFUkt0bEZRYmVTelVjdDI3TlBoZkZu?=
 =?utf-8?B?dkEvZWJKM0w0aXBQZ2paaUU0dEpDektITGs1NUNsditpNnJOQWFFcVlKNHBj?=
 =?utf-8?B?NVFHQ29mL2tCM1NDYXJkT25SZDVoQTJveHBMMFpQdFVkdktxeFBNODlZalZN?=
 =?utf-8?B?MXJZQ1lNWTcvT0JuZThCTXdLRjBTZEk1djdzM2NXbC83UnJwdmxZcWdOZk5u?=
 =?utf-8?B?SThuTm1NWkxockRaZytWcTROdmNMc0VNQS9xNUFFV1hRSmFCblZhdjVqTmlz?=
 =?utf-8?B?NmdWdmZ0K04vS3cvOTZDNDlBSHZhQjd4VFVralNJK1F6V3lXZnBaK1prZVhh?=
 =?utf-8?Q?2MCvr5g0W4VCp+Cv8id6pXb3HeszOX68IrEFFez?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f0184c2-e6b0-4546-5c75-08d96bb9b0f7
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2021 13:25:53.2948
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B4TynCTp34jW3TmwDX09vRYhCf9o5GyjJgbdrZxiAPUNOlAQ8VrDo5nZRKnKxuJy/u0Uu+XoEEWbC2qn9cD7Tw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6669

On 27.08.2021 16:16, Daniel P. Smith wrote:
> On 8/25/21 11:44 AM, Jan Beulich wrote:
>> On 05.08.2021 16:06, Daniel P. Smith wrote:
>>> The internal define flag is not used by any XSM module, removing the #ifdef
>>> leaving the generic event channel labeling as always present.
>>
>> With this description ...
>>
>>> --- a/xen/include/xen/sched.h
>>> +++ b/xen/include/xen/sched.h
>>> @@ -120,15 +120,12 @@ struct evtchn
>>>      unsigned short notify_vcpu_id; /* VCPU for local delivery notification */
>>>      uint32_t fifo_lastq;           /* Data for identifying last queue. */
>>>  
>>> -#ifdef CONFIG_XSM
>>>      union {
>>> -#ifdef XSM_NEED_GENERIC_EVTCHN_SSID
>>>          /*
>>>           * If an XSM module needs more space for its event channel context,
>>>           * this pointer stores the necessary data for the security server.
>>>           */
>>>          void *generic;
>>> -#endif
>>>  #ifdef CONFIG_XSM_FLASK
>>>          /*
>>>           * Inlining the contents of the structure for FLASK avoids unneeded
>>> @@ -138,7 +135,6 @@ struct evtchn
>>>          uint32_t flask_sid;
>>>  #endif
>>>      } ssid;
>>> -#endif
>>>  } __attribute__((aligned(64)));
>>
>> ... I can see the inner #ifdef go away, but not the outer one. While
>> the (imo bogus) attribute means you don't alter the size of the
>> struct, I'm afraid that's not obvious at all without counting bits
>> and bytes, and hence this may also want saying explicitly in the
>> description.
> 
> I can put the #ifdef CONFIG_XSM back and in the subsequent patch change
> it to CONFIG_XSM_CONFIGURABLE, making this the only difference between
> being able to select the XSM policy in effect or not.

Well, yes, that's one way of addressing my comment. Another would be to
actually justify the removal. (Personally I'm in favor of the former.)

Jan


