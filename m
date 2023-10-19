Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 78D747CF05F
	for <lists+xen-devel@lfdr.de>; Thu, 19 Oct 2023 08:48:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.618901.963183 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtMp6-0006qd-PY; Thu, 19 Oct 2023 06:48:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 618901.963183; Thu, 19 Oct 2023 06:48:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtMp6-0006nz-N1; Thu, 19 Oct 2023 06:48:00 +0000
Received: by outflank-mailman (input) for mailman id 618901;
 Thu, 19 Oct 2023 06:47:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=g4nO=GB=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qtMp4-0006ni-Rz
 for xen-devel@lists.xenproject.org; Thu, 19 Oct 2023 06:47:58 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2062f.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::62f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6ed5fe4b-6e4b-11ee-9b0e-b553b5be7939;
 Thu, 19 Oct 2023 08:47:56 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DU2PR04MB9178.eurprd04.prod.outlook.com (2603:10a6:10:2f5::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.8; Thu, 19 Oct
 2023 06:47:53 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d9c0:d907:4d2d:15b3]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d9c0:d907:4d2d:15b3%7]) with mapi id 15.20.6907.022; Thu, 19 Oct 2023
 06:47:53 +0000
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
X-Inumbo-ID: 6ed5fe4b-6e4b-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VdJOO4H7fCxpOAU6HCHAJiM8lAfKGVhqragpthUSv6jPp5pLKw1cNbiDk+0BZdcdOFTlDz4OJBrJWRBrBii4Kz001kEa8XAtUI6HL//BkUjxnPXMFm3y7HtPa8rnn1TXHbTDC5Zj1Tw7rxvGP3Jl2MGu5/qiu0MtZm7O+HRmJkvXrbGnqm+729MsjWyw1Go+0tEyXXvpsVVj1pay9iaCUyilA5JP9llg8GSatVFIBWmCK4u0yM0MqTfCk+Fb1pI9e6A82HIg7M5WTpnbSoJbKMILenF/Vh6Ax/EcOxRsqPLITu0bHhPZ5A7DmJX4I8m/PPh+07Cef/YrsylwDuWZJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KnhP3zfZNcV37hu5itZ0SOX16z+YvEZfB4Ow62HPw9I=;
 b=ka2/CNhmiv2c+qJzMTBD92hHIiASXGvI2Ki6FZPHbG9kTLtmDvOa/OxQK6jzMpX52WYfyG+Vtisqxna6LQEonSFlhgFDXXOEsv62MKPc3XnOBf5DmvGKiQkn9vnsE9iFjcV54MQYeayzl4V72hc/q+5gfXgQ+0ipqdqZqkJfYLFEQSfu9ulW4hHar5EYD5v80Q1ckEPq60m7/qt2k9ZRAP1rlz2SqCUgDpo5luJqsylquBYUv+i6D7lQmPfsh87/aQ0KAD6NTuBIjlBlF1pPNZ463RJ1vSD1PG9bs1I/V7iRj9yZRwiLxL415eNBQTRfQVaHIBtF/hLEB6hnjEA/wg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KnhP3zfZNcV37hu5itZ0SOX16z+YvEZfB4Ow62HPw9I=;
 b=1Yl6OJKLDbVOoQDCaaPxyCrBoXgrGevGIJJRqysVs3740cYSy2FffIbXp5fXhY0iqf+TKXPISpXCRC7ELh5oq+1XUOp+oMDztV5a7tiW3bQ6F30Z5MV0xvXSbPacQM5CCQQJ850Qy8P1sGfYLG7/pKIQTSXpYyCHOXHpVvO2TdNXZn0/BlqUrExtJcH6VKzGcdeCwaLBFT5/jaIu/cOF8ptEARv2MxZ+ag0n5/686jA5DT3bC1QIAQozoCB8iaJ1LY3i9VwcP/5BcMLFiFRNCOVnQ8jKIurSjvjWfeqHLgW/ncAS8gUCOqPe8WoRaBH0sloAxwTfjXLOGm4s/gaY3Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <30394e20-04cd-9978-f9fb-575148f87104@suse.com>
Date: Thu, 19 Oct 2023 08:47:51 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH] cxenstored: wait until after reset to notify dom0less
 domains
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: George Dunlap <george.dunlap@cloud.com>,
 Stefano Stabellini <stefano.stabellini@amd.com>, jgross@suse.com,
 julien@xen.org, wl@xen.org, xen-devel@lists.xenproject.org
References: <20231013230624.1007969-1-sstabellini@kernel.org>
 <55f70f98-4a84-401c-f9a4-3cb50ca1418c@suse.com>
 <alpine.DEB.2.22.394.2310181430550.965337@ubuntu-linux-20-04-desktop>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <alpine.DEB.2.22.394.2310181430550.965337@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0184.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ca::19) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DU2PR04MB9178:EE_
X-MS-Office365-Filtering-Correlation-Id: f900cd67-681f-416c-8efa-08dbd06f51c5
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	WeW07rqTIEtTWx8tUDa3OToTg+fIgd13QfxWGLhzpjFKKWTDTL7ik8JXqLsbjQeRO372xQwq4m65FeSplANLhTdjovGUZbNLoU22EinOrNyU09ee3LySfsmVD5lKPs43oT9js7dQXhIia1VA7Qbb3RDN2epvK9i1iJus8SvONC7xh/VYN0cW2QoQmJTCsgqt4h6wWzoMgeJfNpmN0N5kB+/Oe86Sp99eRr+KLtrLLAX3bhXGuso5NdaO4terx/Kr1PyDjWwy/A66bsUKC0KwRFyDg7lXMM2qPGcZG7ghFIpvFlV6ufO0UhiSQkrr/1G6FZZw3y6C/KzIqvAGS8RvolX5CRbrWOAk47MkhT/k+PNo2Ihzbut2CZhjcvGQBrzmciXu/w/lSd0wFwTshz3ZPuBPU2a0PZuBrsOQ9K2rNKwJeoa2s4W5ZCLzhsBmQ7LsPngF9Kj9jVEBMzfDT16IjiyGLV+oSpKCE+QxGoXegGPZXQhFcF7vlcIdLACJRwquejML+wuaveSD5Hrhk42D2VNbs4R6DZF8pd+dLN6SB0MPOAcT2zxeTbUACWWnQPV7xh7fIdFIkFR00OhJM/p5VE03Uell89uyfoAaUBp5K/5RL+3V2eMhuCTqErNf/T2i0ZLGCeoRoObSXIz7+C4TWTDv2K5MsUfWUowsy8MENl4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(376002)(366004)(136003)(39860400002)(346002)(230922051799003)(186009)(1800799009)(451199024)(64100799003)(36756003)(31686004)(54906003)(66476007)(6916009)(316002)(66946007)(66556008)(86362001)(31696002)(38100700002)(53546011)(83380400001)(26005)(2616005)(6512007)(6506007)(2906002)(8936002)(478600001)(6486002)(41300700001)(4326008)(5660300002)(8676002)(32563001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?S1VJQWdyNVNSRHc2bXExSGlZc1dkQkFMeVhBYU9Ta2dKeVh4cXczQ2lQdVY4?=
 =?utf-8?B?NmZxckdLR29ZRG9qOUxmYWFsTEMwK1YwOWVyYnVhSUxaWW9jRTdoZjRpRGlt?=
 =?utf-8?B?Vnk5ZFJqYk9QNCtLTjAwYVpNelNUN1dQcVlJRVd6YkNndGVuazI1Mkl5UmlE?=
 =?utf-8?B?VWRqcmVFQ2hOZmg5dVR1VVl0Z0piVDBSb094b1NicDdkN3hQYXpZdzd6NjQ3?=
 =?utf-8?B?dkUwRjBtODhkRWQvZjVPZS9lUC9abTB2N1EyZ21LRXV5N1UwQ29HSko1TktI?=
 =?utf-8?B?QVNVUDRlVHBkTis5djhCNWtxWnRKdG5VVjZVakQ1RWx4RUVPaEdrdHphQnV5?=
 =?utf-8?B?WlRjZUh5YkVGNW5vZ2JNK3JvMnpFV25ueUlTc3NnUDFDRnErdkg1OXdYY1l2?=
 =?utf-8?B?OURWUXlxcnRKNDNFOWUvVm80K0o1S3NnMXBUd3JReS85Y09NdEIzRmNkNkVv?=
 =?utf-8?B?RW5WTWhWMnZFTTBOVjFCRFp5Z01MdXFHa2ttYzdONmVCNnNXYUJrazgxS09o?=
 =?utf-8?B?QStHUHZsSW1uQWQyeWY2NkJmb1pUYm5zZTN2cndRRHdkQlVJMVFXc1JNSDlm?=
 =?utf-8?B?aXViSjJVMlhPd1RjOUJaMDdxRnZQNVEzelpGVHc3OWxqK2pRQzNnTEtFV1dK?=
 =?utf-8?B?QUMyOWx6T2tXU3hyWEtHUHVDb1ZUWHhWcVBoUnBWNXJjb0U4UkVmTXprVGhq?=
 =?utf-8?B?UEdZL3c3OEl1TUR0elQrSGFXajdhaUswcUw4SWdDejRsQm9mNHlCbHozODQv?=
 =?utf-8?B?a1NYYkVKZnc0MlVGbE1hU3hlbENRQWtmeGFUN0J6WE40QUVHQ0pudkN1dXBL?=
 =?utf-8?B?MU95QjFXWVNuUTZCQUZrWS9OVUREVFZGekEvSlFVai9wZTVxT3lTczlUWFg0?=
 =?utf-8?B?aTFienVJUEJJWFo5MG1oQ25EZUlBZ0YxclJTVlk5ZHBGODdQS1laMm9TNHkx?=
 =?utf-8?B?YmhhNTlhK3g1cFMxV2ZLNVBoMW04bnJ6VWpmc25zMkJMcCtmUXJZYWNrUUtr?=
 =?utf-8?B?RENhUVpEeXpwZG14UGpXNGVNVklITjY0ay96VTFVaEVHN0ZZZ2VQMlFtM1Rz?=
 =?utf-8?B?NHROWWJkOUN0MFRYR2Q5dm1EZldTMWhwS29sY3Bja3k0MENkamUrMEY2MWpI?=
 =?utf-8?B?Y0lZeHFXUzY4VTlnelBJQ1FXRGNxbndGNFYvY0NvWEwrQUl5MXJoa2hTb0lF?=
 =?utf-8?B?aVdXVEN1TWhqM1QzbmhtNk0reWR3RUNkRUMyUUhRV2VSbEErN1Yxd1BReU5M?=
 =?utf-8?B?S3I3VFQ0ZWtaSVdPaERGcXFMK2pNT2FxZ0FRRExyK2dpT1ZyUGI3MEF6NFJF?=
 =?utf-8?B?Y1QxbWpRbDdPaC9sUWFZamxQQlhaSk94RGI3M2k0ZVVZakJWS1o4ZStZaDlh?=
 =?utf-8?B?TTBVNndLZEkwanMwdTQ5S016WmxZYnpZNEtPV1ZyS3NTRnNLZjRFUEh0ZmRx?=
 =?utf-8?B?MkpDNUdnSW5HWVRuTDFWZ1RZZWRub24wanIycyt1b3lDNUNyRDVla3lvQnoz?=
 =?utf-8?B?dUlJeTFoNzRZWDE2WC9HQlBlS2FYdGpRSGUzUzhSMnE0VjFtYTBpTnBYRk9N?=
 =?utf-8?B?UjM5aWwxNStGRVBnbFF5V1lLbUp0akx6aVBNTzU5NXhFWmVmZnVTNWNvZXJW?=
 =?utf-8?B?UHBSYVB6WTEwM1J2N25RUFRTekR0YTNJOWRtYzZlRGlRaW4wcVZzaW9wSjcw?=
 =?utf-8?B?aW1uNm1oaVJUN0NoYjBJVDJmQkVjYk5CcFd3RVhwaUwxbVNQd0RGT0MwYTJK?=
 =?utf-8?B?OWZxNjljeU80N0hvVnMxMUxselhpK0IzOWcxS2ZKemVBQ2x6WjFnTG9tejB6?=
 =?utf-8?B?cTVBZGJ6ZFdGK2ptMUZPK2VmdW5xbmpPMHFUUmFmcWNhUk5UdDZTTWwxRC9S?=
 =?utf-8?B?Q0RTczVWYzdxN2t4WktMM3ptZlB0Z0pDNjVabGZiLytyUlZkaTh6TzA0NC9C?=
 =?utf-8?B?UDlySDFreDk2dlZlTGNORnF4bjJLV0RmcVFqNjRiK0lmSjRPSDZTV0o2T2F5?=
 =?utf-8?B?T1dJbmZlczJONFhmV3FIY0RHbjArNys1aUc3VzU5TlBlL25LNEovZmtmUVlj?=
 =?utf-8?B?N0xOblFUZDdtZ2NPeHcwTmFMdkczbVZFNVdjNjZkNW5mTlVYcmlEOUdsNUQ1?=
 =?utf-8?Q?YfeaeUU2Y9k8S05Nl9Z1x2CNB?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f900cd67-681f-416c-8efa-08dbd06f51c5
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2023 06:47:53.5993
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jcuHiaQmi9DD8tdfmvFCaSNlnnRGzjJKQ/Jc7APQj8A/bYu6gwgcYi/Lt71fYkut4U3P6KJE+MV+MPyTAcxY2A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB9178

On 18.10.2023 23:31, Stefano Stabellini wrote:
> On Wed, 17 Oct 2023, Jan Beulich wrote:
>>
>> On 14.10.2023 01:06, Stefano Stabellini wrote:
>>> From: George Dunlap <george.dunlap@cloud.com>
>>>
>>> Commit fc2b57c9a ("xenstored: send an evtchn notification on
>>> introduce_domain") introduced the sending of an event channel to the
>>> guest when first introduced, so that dom0less domains waiting for the
>>> connection would know that xenstore was ready to use.
>>>
>>> Unfortunately, it was introduced in introduce_domain(), which 1) is
>>> called by other functions, where such functionality is unneeded, and
>>> 2) after the main XS_INTRODUCE call, calls domain_conn_reset().  This
>>> introduces a race condition, whereby if xenstored is delayed, a domain
>>> can wake up, send messages to the buffer, only to have them deleted by
>>> xenstore before finishing its processing of the XS_INTRODUCE message.
>>>
>>> Move the connect-and-notfy call into do_introduce() instead, after the
>>> domain_conn_rest(); predicated on the state being in the
>>> XENSTORE_RECONNECT state.
>>>
>>> (We don't need to check for "restoring", since that value is always
>>> passed as "false" from do_domain_introduce()).
>>>
>>> Also take the opportunity to add a missing wmb barrier after resetting
>>> the indexes of the ring in domain_conn_reset.
>>>
>>> This change will also remove an extra event channel notification for
>>> dom0 (because the notification is now done by do_introduce which is not
>>> called for dom0.) The extra dom0 event channel notification was only
>>> introduced by fc2b57c9a and was never present before. It is not needed
>>> because dom0 is the one to tell xenstored the connection parameters, so
>>> dom0 has to know that the ring page is setup correctly by the time
>>> xenstored starts looking at it. It is dom0 that performs the ring page
>>> init.
>>>
>>> Signed-off-by: George Dunlap <george.dunlap@cloud.com>
>>> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
>>
>> Should this have had a Fixes: tag thus marking it to pick up for
>> backport?
> 
> Sorry this was committed already

That's why I used "have had". I still need an answer to the question
though; your reply only hints towards "yes".

Jan

