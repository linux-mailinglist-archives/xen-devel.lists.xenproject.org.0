Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D2F863FD747
	for <lists+xen-devel@lfdr.de>; Wed,  1 Sep 2021 11:56:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.176255.320730 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mLMyQ-0006I1-8Q; Wed, 01 Sep 2021 09:56:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 176255.320730; Wed, 01 Sep 2021 09:56:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mLMyQ-0006G2-4v; Wed, 01 Sep 2021 09:56:02 +0000
Received: by outflank-mailman (input) for mailman id 176255;
 Wed, 01 Sep 2021 09:56:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=18Fz=NX=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mLMyP-0006Fq-03
 for xen-devel@lists.xenproject.org; Wed, 01 Sep 2021 09:56:01 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6655b2a7-e3b7-4fb0-9e6d-2cc730b15527;
 Wed, 01 Sep 2021 09:56:00 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2170.outbound.protection.outlook.com [104.47.17.170])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-18-3lGGkDqjPbiQOR7DLdaJ2g-1; Wed, 01 Sep 2021 11:55:57 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4845.eurprd04.prod.outlook.com (2603:10a6:803:51::30)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.21; Wed, 1 Sep
 2021 09:55:56 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4478.019; Wed, 1 Sep 2021
 09:55:56 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 FR0P281CA0070.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:49::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4500.4 via Frontend Transport; Wed, 1 Sep 2021 09:55:56 +0000
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
X-Inumbo-ID: 6655b2a7-e3b7-4fb0-9e6d-2cc730b15527
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1630490159;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FGtjZiIFf5R/oYLpBhLuFfUgjNszBMgjxxQb52D/ECA=;
	b=IpegrnIB96Y939kQ3nJiC+2A/bQu/mkswGUcgxOPHnsHmUscZQrOC9n2owxl10Jh1wMixJ
	5sJCpTfGiuQB/ch+OAMB5oO26q3fenY6LHcC5kNTSpJIsmAnNo1C6hZjT8/mLKNs54CHef
	GqkjPFbhj8vy4lIM0S9qi2fYFcIGZns=
X-MC-Unique: 3lGGkDqjPbiQOR7DLdaJ2g-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MuJGUsdzmBgRgSs3Fd2EEmjjX8tc9VOzjEnkyyCrs7zkix2mQvERZAzDG8gAWBqqbBJWKNjoShK0VD2JOfwyrdO7J0YNnrG5lu+gd+tOXeqsrQOzWUYu5cMrClSo+1dOXOMsJZdLuvxuF8POCjRQckMY01zX1fkAZje5kDkB0ci++JNtqecwspC77FLjWHSi6LPdc5Nw2Cv/YHZrYiu6/tK+bZrwuuu8Nrd+Mh2ksTBBvzFx7p+JNbmDRzyPuLlxBaKPUhqA5G03gAESkcjqrDqly5HebwibbdvEzngmx8R974Hx3UbG0a6bJ0ODqOmnWYOlK3dmoMnvIbecBS0pzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FGtjZiIFf5R/oYLpBhLuFfUgjNszBMgjxxQb52D/ECA=;
 b=JoPOkj2JXoCd4iFw3tjp7oSW6+6H4mcV18h4tXgMhHA3Qxp0OJJPD42xCFgViCQYArj+fQn2NQxfarUmeBTcm/54BthwJwZ5JKlbBF1qyQXD+nyaMLiWQHWPOSDWhEOZKBDu0VVpA5/SlUH/6ir+FmR0jCxJ6Khel8nxp7YhTk1r7K9H52zKg+rbaQ24QlmpMSyW0Oql/R30MUiD1zdI09/O9+qpDWPhEGTWmxTKdRkUVFPU6LQb9XfmZf7Yx6zbu22u1+ERVxfWA74rvZdBnNxBk2zI2YOOSgDDk4RJTxArr4WJlvZo0byZhGLc+npaUti3/YYvzp5NM69EeNRLnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=suse.com;
Subject: Re: [PATCH] Config: use Mini-OS master for xen-unstable
To: Juergen Gross <jgross@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>
References: <20210831073039.7101-1-jgross@suse.com>
 <6837d551-6473-e34d-c0ae-043fcaa9482b@suse.com>
 <d610c89b-fb46-338f-e4b6-5e1d5a0b5040@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <3a662b17-bde7-df0f-3d96-d275c70b43b4@suse.com>
Date: Wed, 1 Sep 2021 11:55:54 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <d610c89b-fb46-338f-e4b6-5e1d5a0b5040@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0070.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::20) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 94446512-6cd1-4f10-0bbf-08d96d2eb192
X-MS-TrafficTypeDiagnostic: VI1PR04MB4845:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB4845734A8300A9D894A21A38B3CD9@VI1PR04MB4845.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	v9l2HxlLY7d2v56MxpKDbJxZ3nqM7uw6Gcx65ojkoco8to87Kz/qls+56GkNvnanQXquuNCqeSjbAtxHwpgDq9mMQL1NIPqPu8toXmJhxM0FPw3vElThbNMCSbEu5RMOqyf30mDrQWr8Zu+fJyasOT7vThYQVXtJ2bSXaiOYyVuEJRyc1Y1FE3Q1XSgEiP/hE75HmDtBPfTKujgJKlXGPJa0HglFm/czZHMcXrDOeXh+Nz5r/sIp1m4T2vMxpMN7GBnCDL6ScRuXZWYrT2x8vFYcZgad2ocRdZ0ArHurHkS5+QyOxUTXRbjsz6W0wIE0LbHWoVPO/lFCo9uQSEF8P27oRZaHnhmiPnmAwPLmwD7MthGPtsgWi5YqWEauR+r+dwu8i/r/fH5O/nL3eNWi8NvHvG+c3txooF5kAYdZA1p64a7W+JsDaihdmm+VExfdtG87aNhUCrSOag0WXWfqCmSU7qDdhtB58CoahQMrObEnQ860KOzcxu4aqDIPIpt7K+BNGlugm5lTj1riH6qlQc96QGLVz0wwzu9ClELoXrdBp1LtppLte7/SlBEUOzqzmqMJFTBlwWrFweXx2gwp9Sj8KGHWdsMS/hiqBdjuELos339tp+f3sIow6b1BOSjsEHH+metoOxOqfrYlnXbYjye1HL4q65mwhCFXBzqTs3AfQe7VS6c+9t+1UpoZrgxhFPbpXMSlH3rw3MkhTLXQcfCIQmMgfpXskkIaYQ0rjwplb0npM5w/0ofjOz+nrPD8
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(66946007)(6486002)(8936002)(508600001)(6636002)(66476007)(2906002)(6862004)(54906003)(66556008)(86362001)(53546011)(4326008)(316002)(16576012)(83380400001)(38100700002)(31696002)(5660300002)(26005)(8676002)(31686004)(2616005)(36756003)(956004)(186003)(37006003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NjZxSmRNKzBLeUswTHYvRzZFcXlJUlZUYjlQaDdDS0tob2FOcUVnL1VGYUdH?=
 =?utf-8?B?cXRTQXZqdmR4QlhOa3VXcFc2cFU2clRaMlRHaVZLVW16dG0wQ3A2TzROSWR3?=
 =?utf-8?B?d0lmLzJnTU9GVExTWWFRQWFJekFHekp4a09zOUNqYnVaZE54dERhdHVWOWZN?=
 =?utf-8?B?cTNXRGh2K0FHK21pQWtmZ1pwYUIvNW0ybWxScEpGMSsxUzNxRlFPaGk0UjRK?=
 =?utf-8?B?Y0hGdFZXSEZFQ25ZOTdKNFlmaGRMeWZDTE1IVjQrQVQzL3lCZ3dneTFVY2k4?=
 =?utf-8?B?NVlnTE8xQnBib0ExcC9LcnpmcWZteTBLVXhpUnVkQzRGTnkwMkxsWHYzY2Ry?=
 =?utf-8?B?RkpSajJVb2xFN2cyQUJUVStqVGNFdHhOSWdVUWROV2FiUWl1TGhneGFCLzZP?=
 =?utf-8?B?Ui9BczNCdForMlRTU1pUQkhXRTdkcnRZWENVMW5KZmVSdlRQK3lTaFozdmVp?=
 =?utf-8?B?VlQrNVgwV1IvMzA2bmtiN2xpdm9LTmNick1zc3l3VHA3dnRGNnJsUVpmNnhL?=
 =?utf-8?B?TVQ1YzdnbUcxeTRsdDhoZGwrMHdvdnZOSnA4MVczWmxOYjFQeDFRYlNJeXZr?=
 =?utf-8?B?N3lLZ0hoUmJjTTUrWUc5VFJLeTNrcXFnM1BHaG96N0ZXb1JQd0o1UWdBQWFO?=
 =?utf-8?B?TlFvRVhjYmhzeEZiUXNGYktwQlRmUUxPN05veVNXL0R0Yno2d2p6TmJJdWtT?=
 =?utf-8?B?Z0Q1ME9jajhWZ1lYcWQwelRXdEhLRVJwSW9oTjlBcjVpMzBOYlB1TDhlWUl6?=
 =?utf-8?B?czJSb1JOenR3WDhwOG1GZjRuSVF6aTUzenVLWllZUXJ4bXFNQzRRdXJUOWJx?=
 =?utf-8?B?cDVzSzNEaFZkN0VkZDVMQWhGQWlMUmxVS2RKcENVMHVmWVJZMkRmUGlFRmxa?=
 =?utf-8?B?YVphK0FVQVNOZ0w0TEx0QUxVU2FHRTdkMi9LenB0RmtOaEdtT1VtcHJoZk5S?=
 =?utf-8?B?S2MvWDlJS0RuZUZuRzJYeGRHTW11Z0oyRW8rOE5NNmlFTCt3aVRFcWtMeE5o?=
 =?utf-8?B?SDlIU1MvK2NiU1FjdXJob0Z6dTJHdGdHSE56ZDlNVXpja0dJamR3SlRBb0J1?=
 =?utf-8?B?akx3WWpnREUwb2ZUMzg0UnNIbUFTbEh5OWE2UTJuUzcwNWhuL3FGMmY4WHRu?=
 =?utf-8?B?dVcvTTgyZ3dHRnVJRERPOTFnYmVRYjZTbU5SdTlkMTV4Mk1zMXByWVp0N2RQ?=
 =?utf-8?B?Q1BDSFpHTHJZVnhzRGdsRVFDdlpCYkU3bVRROURUaVBhVUkvOXZjZ0FwWGZV?=
 =?utf-8?B?bzFjTnFaeXZnamhVMEkya211a2hSTStqZnBySkJLdS9XcWZlTDBralk0N2cv?=
 =?utf-8?B?MmozRUI0ZmV4dzh5TWNiVmM2R0FGZVJ4dnRrWkhyUkRPSzQ5alNrREpWVnpR?=
 =?utf-8?B?NnVOVzFlek9SSHg2enlXZmx6WVNKbXk3MGh2SzNJRjMyTEY5Q1dlaHBRbVJj?=
 =?utf-8?B?NCtMdC9JQzRHR0JvbVMzeU16MzZxbXJNZjVGQ1FadFNibDg0TUVVRmFYWWRZ?=
 =?utf-8?B?WHhwK21ZTCtWNUhVTURyaURSVFpuSnhNcHJ1RFE3dnFrR0xocTZoa3NkZ3dE?=
 =?utf-8?B?bWwwcGg3R0s2OTZEc2N1OTI1K2liWmh1L1A1dEYzU1h6N0xyREk5Zm9DSGFT?=
 =?utf-8?B?T21xbmM3bjFNKzgrTmlwZWhMNUxKd2lmZVBWeFFDOFNXK0U3eGZ2aGFkODFm?=
 =?utf-8?B?eDZWaEZ6YTZTclBCc1hXUnRiZGk2US9BUEtPUVd0SkdydTM2STZBWE1GdjZO?=
 =?utf-8?Q?U8QOSkl+vjfs/4aTDiUfWTUMB1I3Dy7q3nHKovx?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 94446512-6cd1-4f10-0bbf-08d96d2eb192
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2021 09:55:56.5397
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B3gaREVvKF3qEyVu8Gy+UedJq80sZKo4xOrnZB5h6rLrHFG029f9RI5mcjao/wga9yRBaOUcT+F7KcMCq/Dp3g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4845

On 01.09.2021 11:53, Juergen Gross wrote:
> On 01.09.21 10:59, Jan Beulich wrote:
>> On 31.08.2021 09:30, Juergen Gross wrote:
>>> In order to get Mini-OS master branch tested by OSStest, use it for
>>> xen-unstable.
>>>
>>> Signed-off-by: Juergen Gross <jgross@suse.com>
>>> ---
>>> There are some Mini-OS patches pending, of which at least the Mini-OS
>>> netfront fix should be committed as it will be required for qemu-stubdom
>>> to work.
>>> ---
>>>   Config.mk | 2 +-
>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/Config.mk b/Config.mk
>>> index 4d723eec1d..d4e8ced104 100644
>>> --- a/Config.mk
>>> +++ b/Config.mk
>>> @@ -246,7 +246,7 @@ MINIOS_UPSTREAM_URL ?= git://xenbits.xen.org/mini-os.git
>>>   endif
>>>   OVMF_UPSTREAM_REVISION ?= b37cfdd2807181aed2fee1e17bd7ec1190db266a
>>>   QEMU_UPSTREAM_REVISION ?= master
>>> -MINIOS_UPSTREAM_REVISION ?= 051b87bb9c19609976fb038f386920e1ce5454c5
>>> +MINIOS_UPSTREAM_REVISION ?= master
>>
>> I'm afraid this, effectively reverting 82c3d15c903a ("minios: Revert recent
>> change and revert to working minios"), would set us up for the same problem
>> again that was dealt with there. IOW you're re-proposing a change of yours
>> (e013e8514389 ["config: use mini-os master for unstable"]) which was
>> subsequently reverted, without spelling out what has since changed.
> 
> How do you suggest to proceed then?
> 
> Will every Mini-OS commit require to be followed by a Xen commit then,
> which will either result in a test success, or in a revert of that Xen
> commit?

Once the two trees are assumed to be fully decoupled, and once a push
gate has been put in place for mini-os.git, we can do what you suggest.

Jan


