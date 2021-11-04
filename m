Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D871A444FEF
	for <lists+xen-devel@lfdr.de>; Thu,  4 Nov 2021 09:08:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.221286.382927 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1miXmt-0001Hf-UI; Thu, 04 Nov 2021 08:07:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 221286.382927; Thu, 04 Nov 2021 08:07:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1miXmt-0001EY-Pw; Thu, 04 Nov 2021 08:07:55 +0000
Received: by outflank-mailman (input) for mailman id 221286;
 Thu, 04 Nov 2021 08:07:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=s15q=PX=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1miXms-0001ES-5g
 for xen-devel@lists.xenproject.org; Thu, 04 Nov 2021 08:07:54 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4eb403a4-3d46-11ec-9787-a32c541c8605;
 Thu, 04 Nov 2021 09:07:52 +0100 (CET)
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur02lp2054.outbound.protection.outlook.com [104.47.6.54]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-27-eCtrcNlFNFOERomWyqFm0w-1; Thu, 04 Nov 2021 09:07:50 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0402MB3774.eurprd04.prod.outlook.com (2603:10a6:803:1f::28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.17; Thu, 4 Nov
 2021 08:07:49 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898%3]) with mapi id 15.20.4649.022; Thu, 4 Nov 2021
 08:07:49 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AS8PR04CA0093.eurprd04.prod.outlook.com (2603:10a6:20b:31e::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4669.11 via Frontend Transport; Thu, 4 Nov 2021 08:07:48 +0000
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
X-Inumbo-ID: 4eb403a4-3d46-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1636013271;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9gcqew/cT6mEn33a5vopPSuLysDz0wbCMrM2k/usQCU=;
	b=C1szR8OeBpjVEeAN9yUR0ECVZ16xGWOMl08g2iaj/+Y6dp2CRGhU53dvuPN8FpFtxAnTti
	7QT5i6OViYymZg6OdiR87EenvH6qX3SxhUAgzMCjMAx4OBR8se6cIF/itA/Fu68oZV8OOM
	MiYlEd6cdi3HH6RBUN9PlwmXoyAYFtc=
X-MC-Unique: eCtrcNlFNFOERomWyqFm0w-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X7BEDNpnlY3V4pYZBlFbg7eZeEH6kIHaurvjZa+h/Ab4Vs0GmGxZnpqifgldxHmRYZX33UkBIL85QTpg4ONbUnDieA2KdXBsPTVuVixciZTNd+95TXSRwhHVWs7DFfPFQUUNFyT7qEaVEgjl6izprwsCRgo7U1CGt7sKqzpmTBgKeCwZO+wK1WHhpYFhG7XhD5KJEHoB8k3iZNqeU0LEAV/W6s9ZMproDvbueNruf81Yko8DvuhdzFv07r8H5GLWWtEk6bs6y+E0cxK/gIIFV7/toaoM086fyHZAuVt6OMVDujbN/t/8rDgy5qj48M/+2+a42C/4udpAr8e3regalw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9gcqew/cT6mEn33a5vopPSuLysDz0wbCMrM2k/usQCU=;
 b=AwvyW7Pltg7di158DlYnW2QyTeBEsqGrLVgmvRbCUHoYPouD+3+/oRetL3KGneoa4DfjcYafDdm50947QS1egfs4J/jjHN9tC2/Nl/+KMvAslw3hG3IFpA1fAs0BucpY5tkcoGd7oFYeS90i5QqaEQ0QubDefY1+FTR1YCvD4MQTFSdw0k8TSug2iR6aR7PuZHnlGFxlT4SMocQXhDenI+VoI1owXM1y+Wos/FoX+Obuicc9MBACB4wb6DnXV39PGvKHNx6ZjPqBZLrl7bycW9l5tublucWTVaBZB1rPgTdpENjFCdEt0yVlWFoa9XrHag2/NH+uhBHwRCvllswcOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <1950ed44-5b0f-bdad-75f9-b91c66d95fdd@suse.com>
Date: Thu, 4 Nov 2021 09:07:47 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH for-4.16] x86/passthrough: Fix hvm_gsi_eoi() build with
 GCC 12
Content-Language: en-US
To: Ian Jackson <iwj@xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20211027200713.22625-1-andrew.cooper3@citrix.com>
 <77acd9ab-1bf0-cc02-3865-bf9844b3eae2@suse.com>
 <24962.46376.136195.463274@mariner.uk.xensource.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <24962.46376.136195.463274@mariner.uk.xensource.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8PR04CA0093.eurprd04.prod.outlook.com
 (2603:10a6:20b:31e::8) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 392158e6-4844-4362-541e-08d99f6a3161
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3774:
X-Microsoft-Antispam-PRVS:
	<VI1PR0402MB3774A65854E71D915F0C765CB38D9@VI1PR0402MB3774.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	1jPz7Py144gspYPOQl1zQwnQYCpbyn8csbbazK22tHdIHwlBZBMTln2CqnToL+TAOShlqEGvH8cyJJ9DBt96JJuACcbMX1RQzYqxYN7hZxKcK2CApBhieG9sEvQgEvI84ZLMOTdmzlEUlNq9YGToR+Rst9i1dhSsD/q6xPPutBcTccHeqtXRoeaiVUzwQWZNNYgcVbGp0rat803JZXxfsDVzczGMjyWZnHmiZtWGwjI/+obHokw+4wBOVynzV92sjBFNGsr65nnIVVpOOisMR/HgWFtSVxxpERZDx48uhPRYAtPchZpmt/u68KuJxcIxwknKRAQ/VPSGZI7HNF3ihJwZf6U/WCuA2ilwiY2RDuxcYJ6ICAUhwvT2o+rpJyNnNE7EtJB3RWLfOsFSDHiZIrzY5eUvyR5tyrzd5Kl99CREqiHnUBpYFk3JcnqQx6taic+52aIdPTgaptQLdpcWeCi4dJxAKrUaQF4RvWiJnj+SDz4lPAf0vxd5OWe+8tDwgwORrUMgLWnnQiNXQkNevYj5YiYHLK6qgUz/z3qSqel4dZssZyVV4fhrrW5FnprqhzZXQ37IucUDYqxx5M4xnQSgaEF7Mn42TSfxKt0rwcx4lZY8OZ0trGWuYogdfNEkiUVE6h7N5voSgF5ouOsjJZJ/VeiXCOqK/AEkiBM1qJPRhIqgDPPkii0GIWoWaYL5ud9rucizsqqsspYC6A++m0pHIhpToizfuXBtlVaIlkU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(86362001)(5660300002)(2906002)(38100700002)(6916009)(8676002)(508600001)(26005)(53546011)(8936002)(31696002)(956004)(83380400001)(66946007)(66556008)(66476007)(186003)(6486002)(36756003)(31686004)(54906003)(16576012)(316002)(4326008)(2616005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?S0tZTUJnMDl2OGljOUJQYlNpVDFkZlV3Mkt0Z1pQdDJHM2wyb2tFMEk3Umk0?=
 =?utf-8?B?cCtKeS8xeWJqZUJPWGZwQmF1S01qRmFudUM5bkYzbUt5Uk1KZ2F4Z1hJdDk5?=
 =?utf-8?B?cU4wdVZ1QTNsU2w0MVI5SUtIV0FPbDN3MkM4TW9rRTVSTlcrNVRSd3Z1aGZs?=
 =?utf-8?B?amVHYllFZmdNUUJ3b2o0dTlPVUdhN0sySGd5NWx3TjAvZXJQMUdnTEdOZE5w?=
 =?utf-8?B?UStnNCtKWUc1eXIzTjBEd2R1c1owMWlFWWxkeVgrOVZ3RlR2M2lwakhWMjRH?=
 =?utf-8?B?aXFXRE9uN05TS3hpR3R1WXptUTZXK0NvRWZ5WkI4L1g0TFE2bWFiT2E0UURF?=
 =?utf-8?B?YWR1VHZacEx2QWxQRVF4d2o3RDRPOTRyWjBoWlV0dGNlK0hBR3NUL1RHWTlB?=
 =?utf-8?B?MmxMTUdKN1g0OXo3NGVuR1JkUDczYnRzUGJmRktJdS93NTZpNnEvcUh5WmpE?=
 =?utf-8?B?UWI0ZGJsdDVaTyswNlN5VFhmQ25ZeFBTRGVpdVVwWnk4T3hycjJwd2xCRG82?=
 =?utf-8?B?VVN2UUtyN1NXWnBmQ0hjZTg3ZjlPQVZaYmp1RkxQUFN2dXpmbUtxZ2ZtTWFC?=
 =?utf-8?B?YXdVSittYzQ2L252cU5ORXgvQ0p3RHlGN3loaEdiSERLY2FObFl0MmRTVll1?=
 =?utf-8?B?amg5U016QS9YYmFSQ2hOb21DTnpBclhvaTlsWnVKbnk5bEdFd2RoZ0libnBH?=
 =?utf-8?B?ZldaYXEvRVE5KzdNc3FxdStteWowVTRpQU5Ya2VpQ0pqbTlnZE1KVlRZTkVv?=
 =?utf-8?B?bThCZlJ1WjhLcFJhNm55dUc2TVRmbTVPcHRENW1vaUo2VVI5aUJxRnVMMFZU?=
 =?utf-8?B?SzFQQUdGUHNkdjc5S2JwbkRxeDdac1lEOW1NdVlKakZrdlBnSXNJWWtscXE0?=
 =?utf-8?B?Qm5oNFJMTVZDeTBVT1JpU1h2dGM5MjhkdThNOUdZTWM3d0Ira1RzMy9ZN0R0?=
 =?utf-8?B?YkFuYUVsaVJmNkRsd0xrSG5UKy83ZDN2U3p3OGgrMWxnaENSQWhtUmlzUWs2?=
 =?utf-8?B?T1Boc1VORkN5enI0YzI0dTRUWVJlR1puMEUyWERLL2JFQmpuNXFlU0ZrcFNY?=
 =?utf-8?B?M3JxN1hXRVluV2cxd2txZE4zN0FubUplZ1VYYmRZa01DbVdvemRqYkc3WEpY?=
 =?utf-8?B?aWlDUnhmdGRSSDF2cGk4TWJpWk9TWXNWSGd6dGpCeEpkaE1sbFNWaTJQS3Va?=
 =?utf-8?B?RHJ6QnR5UDJKMkhIZ2doYW9QTFpkUFYvTVhkSS9WZXJ4WVVTWkszZTNCZ0d2?=
 =?utf-8?B?MWI1YXpCbVlGZkFGdXVVbmREcEd2Z0pJT0o1RXQ0YmVTMWJIZ05leU4vSDU1?=
 =?utf-8?B?aU9PRTBYczhSNUFXNGEwM09rQzNNY05TenAxOVh1TXJLV2Vyem9tZWlBUjZv?=
 =?utf-8?B?YjIxTHFXaVMwT256dXBRTlE0MDBXR3Y2UjlHd2hBdlZydGRZVFNXTVZDRUZp?=
 =?utf-8?B?RHFhTEpaS1A2MncxdWtQREFHYnpnNEdXZTk0TDMrdE5HbklXM2pxeURzd1Rm?=
 =?utf-8?B?S1k5ZXpKUlJFUTloZHNvZldxd2ZrVG9iNUYvZTVrMHRFdkFxRFA3T3dpSWgz?=
 =?utf-8?B?Q0hwUHIyVTA2cktoZUY0WXpGT2ppUklkWm90aG94b3EzNjFPeDBhMy95c05N?=
 =?utf-8?B?OWVHazF0MmE1cDhXa093QTNYQWp1Qkhjb3RyR2VFM0xVeVN6WE5KRGZZVDNk?=
 =?utf-8?B?SXVqMGkxajNlcFNTUzBlYTltUGZ6OFFLRk5Ic2tkSWVCSGE3OUR6cXFtbUFm?=
 =?utf-8?B?Tko5aEoxb1RQVGFRNDJkOWExNDNtNURVZTBCVGR0QVVveFdVa1NkSHFXS25k?=
 =?utf-8?B?VHkxNnRHb2lPY1pMdjlYbDJKa3p6VlE1ek5WVnhVaW1ObHlSNWpVSUZoeGpF?=
 =?utf-8?B?b1VJZHVHSXVQNC92MDdLcjRUU1hlaE8yMklGWXc3MXU3ODBhekdBSk1qSnJN?=
 =?utf-8?B?S3dIcXAzbmEyenlvaXVpMGN2SXllNVF1NFQ0ODl6MmY0NnBya20zYktTck1V?=
 =?utf-8?B?emZ1Sk5zOWxQOFRPWmI0MUlsZHIxNVJYYk9rRHcvd0Q5UTIwU1BXTVJ6cThC?=
 =?utf-8?B?enFKQ082Q1hpakF4NFpYZ3l5RHJiUTJVTEN1SWx6NGh5VTlYSjVnNzdWb2FP?=
 =?utf-8?B?QUNUYi8vY0ZkZFAyNmtLeHVBblBhL0xyRXRkaUtLZVBaazQ0UDJyREtrbTVL?=
 =?utf-8?Q?NwMDSGQWXGIVR4adWZ5nr5w=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 392158e6-4844-4362-541e-08d99f6a3161
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2021 08:07:49.5376
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZJHgyD7gAdbBlpYewlDkIUTb2ejoA19yXULIZlYGx2ijJJqW6xlKx37NmObA2uhVXgwuhIdr+Ep7E+/jpef09A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3774

On 03.11.2021 17:13, Ian Jackson wrote:
> Jan Beulich writes ("Re: [PATCH] x86/passthrough: Fix hvm_gsi_eoi() build with GCC 12"):
>> On 27.10.2021 22:07, Andrew Cooper wrote:
>>>   if ( !((pirq) ? &(pirq)->arch.hvm.dpci : NULL) )
>>
>> I disagree with the compiler's analysis: While &(pirq)->arch.hvm.dpci
>> indeed can't be NULL, that's not the operand of !. The operand of !
>> can very well be NULL, when pirq is.
>>
>>> which is a hint that the code is should be simplified to just:
>>>
>>>   if ( !pirq )
>>>
>>> Do so.
>>
>> And I further agree with Roger's original reply (despite you
>> apparently having managed to convince him): You shouldn't be open-
>> coding pirq_dpci(). Your observation that the construct's result
>> isn't otherwise used in the function is only one half of it. The
>> other half is that hvm_pirq_eoi() gets called from here, and that
>> one does require the result to be non-NULL.
> 
> Can you (collectively) please come to some agreement here ?
> I think this is mostly a question of taste or style.

Personally I don't think open-coding of constructs is merely a style /
taste issue. The supposed construct changing and the open-coded
instance then being forgotten (likely not even noticed) can lead to
actual bugs. I guess the issue should at least be raised as one against
gcc12, such that the compiler folks can provide their view on whether
the warning is actually appropriate in that case (and if so, what their
take is on a general approach towards silencing such warnings when
they're identified as false positives).

Jan


