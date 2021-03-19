Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 40B17342507
	for <lists+xen-devel@lfdr.de>; Fri, 19 Mar 2021 19:44:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.99370.188961 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lNK6E-0006gC-0j; Fri, 19 Mar 2021 18:43:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 99370.188961; Fri, 19 Mar 2021 18:43:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lNK6D-0006fp-T8; Fri, 19 Mar 2021 18:43:53 +0000
Received: by outflank-mailman (input) for mailman id 99370;
 Fri, 19 Mar 2021 18:43:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=z0Gn=IR=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lNK6C-0006fi-8P
 for xen-devel@lists.xenproject.org; Fri, 19 Mar 2021 18:43:52 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 81c080c9-1fce-4209-b2b4-f1cafc3b517b;
 Fri, 19 Mar 2021 18:43:51 +0000 (UTC)
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
X-Inumbo-ID: 81c080c9-1fce-4209-b2b4-f1cafc3b517b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1616179431;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=SikAD/si2SLckmDGNhPpWymn0rNwZdsyoiN1eJKVspw=;
  b=IP9w+VAS8FdgAY5imBr5Fjd/OCoI2xU5XCoUifYIelGKDQpL4KGHWL46
   KbJ0w213r2YlR/jerwhE8XHpwMMlmC/q3jiabwXZiNiFAoQtWw2Iplf/5
   VOrgjkYuCdvUA4lkkLXI5EQggmtAzYcun/novMvHWyiJw7tJcbuppsjRy
   w=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: ElyVwfaKzokPxK2Z+SaxTYHgvVyWzWQfoRG/yFFBs44CE+8HQvFoiVdT1n75QfvCWl7DMEBiZF
 Hyby8z9liwrEdm+Vk2Egt/ye3H9HtVViXWVTXQizcU9nr3BmHm8R/zB3SV45UA3VkNKyIGQcVo
 ReCfZBNsux6xnnyGCunOf4UOB0puGuKl4UuZar+wwHVSVkdRHaBaqgBZ6jm8f89ZUrCjV0EJpI
 EP6Qe7S1U4dWu026m8CQblnZ6+1g8//yx4SgrZ8xAI5Zr6GT3I6QTldsvvwCHn6iRr8bRsxFzB
 3bI=
X-SBRS: 5.2
X-MesageID: 40078075
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:v/NRIqpHo4BTDlAFErGimEcaV5v5L9V00zAX/kB9WHVpW+SFis
 Gjm+ka3xfoiDAXHEotg8yEJbPoex7h3LR+iLNwAZ6JWg76tGy0aLxz9IeK+UyFJwTS1M54kZ
 1hfa93FcHqATFB5/rSzQGkH78br+Wv37uvgY7loUtFaSFPR+Ve4xxiCgCde3cGITVuIZYiDp
 KT6o5milObCBcqR/+2DHUEQOTPzuej/P7bSCULGgI97022hS6ogYSQLzGjwhwcXzlTqI1Sk1
 TtrgqR3MSemsD+8DDw/Sv575NamNzuo+EzefCku4wuBRjHziqtbIRlcbWesD4yu/HH0idXrP
 D85y0OEu42x3TNfnykgRaF4Xie7B8er0XM5HXdoXz/rdf3TDg3YvAx+75xQ1/ixGcL+PRfuZ
 g7uF6xht5sIj7r2BnZ3ZzuUSpnk0KlyEBS6tI7vjhkfqY1LINKoZd3xjIyLL4wWBjUxaoAC+
 dUAMTV9J9tACmnRkGchGVpzdC2N05DZyuucwwHssyR5TBcgGp0+Use3NAehXcN7vsGOuF529
 g=
X-IronPort-AV: E=Sophos;i="5.81,262,1610427600"; 
   d="scan'208";a="40078075"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NHkw/nU03X5rsLEPPnwF6eH22GqWsm5zMpWpkGvRMGPWojcqF/8TLWFfkZvaLvxJ8GHGyXvZFCG4K0uMhM7D5Z2zdtDn1tJlfNnDqjjBMsVnRyMf++3JEdVSalsIBtgFYSiKHDq5aSBKKfS14/lGFccgnzl1T1/WVh3bdfPDpnGHUPx8PYDyxEsY3Qj9DAc2hKfjFtgRi6rDwNSWvP2R74vO67XXOo3W5heguYAxxLoh39HzgbWahdida4MmJe2/M6pxgM1HmNBRZ212SShH0LB4UcX9283vHkvS8kSLcqYCarCPP2NMaolnsUqAKu5ddi1Y8a+oQ463WNeQFWtB+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SikAD/si2SLckmDGNhPpWymn0rNwZdsyoiN1eJKVspw=;
 b=btwPyfscbPOkrjdObr+o/5jZkrH5FjAUebsFjVlRcqx3OshWdKLbjdywxSjdx42JTZ9kUb2mWmT82KYh8XAWcgTAMEqWBDUZNwe6N7PWbpY6T1FmLlLM0sP6bJIjPdBSrwxV8+z9b+yPDInO48geRhEsmDpdKuJkCa21+1uPK3fqbxwvlF42K+nBOnqXoGMz6Szl5WLsmOBabQhTWJ7g8Oe59vNXb6SruZ2nfhixcTutP4zAlEBlyJMDZr/jEh6KSQIxjOVlC+xToA4K5Ha6mZA6EVHitBSh4ErKFLZs7jpS4cHVnGkixictK0LQnTqTRVipYdNwAFRUpgIObgBeTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SikAD/si2SLckmDGNhPpWymn0rNwZdsyoiN1eJKVspw=;
 b=kvM5gz4+BbEVzpPF2Pqgjj3rt5V7XMHFLl0Z+pXBz3z32XJLYU+i3t7YXj09w8vyN9SDbD/m7bfSD/CP2ZQQwwPtD70G1BPsjZO5N4rw7IB3QWhG5O03/Kv9btrnY0cOM3XGXCv5IgmRglTM1YrmUQ9slHcUv9ocCH3nOx6o5Lw=
Subject: Re: preparations for 4.13.3
To: Jan Beulich <jbeulich@suse.com>
CC: George Dunlap <george.dunlap@citrix.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Ian Jackson <ian.jackson@citrix.com>, Wei Liu
	<wl@xen.org>, Anthony Perard <anthony.perard@citrix.com>, Julien Grall
	<julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
References: <5373f9d5-fc03-1967-8181-d77bbdaf25b9@suse.com>
 <7b3a06af-103a-db05-b494-94f5a1081bc7@citrix.com>
 <f0446475-d9ca-bade-49e1-bd34d921e131@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <4cbfc75d-2850-95a7-2de8-e9f76fd68336@citrix.com>
Date: Fri, 19 Mar 2021 18:43:39 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
In-Reply-To: <f0446475-d9ca-bade-49e1-bd34d921e131@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0384.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18f::11) To BN7PR03MB3618.namprd03.prod.outlook.com
 (2603:10b6:406:c3::27)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ae431e8c-b6da-4500-1170-08d8eb06ed8f
X-MS-TrafficTypeDiagnostic: BN6PR03MB2513:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BN6PR03MB2513ABD9BC43BB69CA8897A0BA689@BN6PR03MB2513.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mNvCQwO5a/0HcvBSbw75TEgduesIuzTFM74sl/DNn9sPdQtFvZdgsNRy3ppIqei1uY+E3b8216BxuvRFDsRa2c40J2cA2ZBRV5dUeRWlbbKcTW6tBjB51MlOk5mcZsjMry/8rpnm8rkFvhUOzSTjTAalI5KEPSyn+JxIboRwAJmuMbLSj940D2rhyMtt9YjQIBuSr7s00tMvBqEI5ZQWhL+O4P6NlqkfLGugg8/wRIqCTJhw20kH3M7GZCfvuFYsH/O/qDNxTQUMMNwagYsE0L5y+i6sqdPQ8SMmQbZ4zh4jY6mIi4GvnQY6M8nF6f8UWJ8pgsi9/L1/FXDI0Fm4iIEtPoPWjhk26SrQwvLL7SWmGzOwYcbUV0H+kytT917U4vUZZH6y+fIfGKRxG0GuWXw6ETNaYZ6QMZbA6T4H9/cg6KQPgawzUnDwMCxv4quPLnA3kvIldMa2famp2FDS2onpiYhOsAA2I5cskWzKhJDfGWpIkpPwPSmZorMO/V31dE3GWsm886hFQ+xYxTl8x/9R5YZPwuHtA/bsndMczVZp8jhrYiQlim/gdO4+eOgJZ7UmoOtCAsZT4uSczzqCn6zlKB6hDjLEmWMQSd+ozz0YOgKEhXu5I3haIf4tLjAu52hwmeOfOwT8Vu87kQd+5Lf1UOUZB+/UFxBX2Ql2F8XnD7iptA+sCgwiYSGnBc13ZZMSdjF/L9py2vy2IbkM//LvNkcKhQmeT0Omn2sY1x0=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN7PR03MB3618.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(366004)(396003)(346002)(136003)(39860400002)(2906002)(5660300002)(26005)(38100700001)(16526019)(186003)(6666004)(54906003)(6916009)(86362001)(6486002)(8676002)(66476007)(16576012)(36756003)(4326008)(31686004)(66556008)(66946007)(478600001)(8936002)(316002)(53546011)(7116003)(2616005)(956004)(31696002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?SjhaNEFPbVFiNW9VTFhHNElxb1hvVldYWW1ST2NXR2pweHpxWjBGZW9zOEVQ?=
 =?utf-8?B?SlZ6K1p6ZjR6Vmt1UmQrMkpweUkwSjZFcStLTkdVQkNnc3NFeUJaSzMrN3I3?=
 =?utf-8?B?aUxxMGtoTnNsRDVmckw4ZkI5bFN0RDFjNEE5ZGtGV3NndWpDd0czbVR6YlI0?=
 =?utf-8?B?SmJ1NTBBYnZ2QW9vUWNHQ3llT1AwNENoMzdXN0MzdXVFU0tHbkhqU1NiaHhK?=
 =?utf-8?B?Um5NU3k3UWZCMTV6R093cnJjM0hNUk1oT2p2M080N0U2RTJGMEIySkkxMy94?=
 =?utf-8?B?Y0swS1ZEKzlwYWFjZFlkOTcyV3pFVUNmRjdXVEhHWjg0MWZSM1BJaHZRUW9i?=
 =?utf-8?B?RnZOZGZCb29jSW9KT3prS2p0bmJiandzNjY5a2VOcFR1M0tsOW1tL1d5cHVZ?=
 =?utf-8?B?UGEwa2J0U2NhOEF6Y3VXTFRpVEgvNTlnY0s3WG02TGEyWndFK0t5T3pOd2sr?=
 =?utf-8?B?N1UzVlorblVyUEhhaDlDV2YzcTlrdHBMc2tRZEZPQ0lxYVNjYmFUUVdCTmJy?=
 =?utf-8?B?RXJiaG1CbEVPZDV0Tk8ybVdnQ290ZzQ3Nm9PQm9qMGVJRVJ0Y3JPU3BZbTFP?=
 =?utf-8?B?L0k4dVpQYTFIRTZ1YlhYV0p3VGR0akNMN2xBbzNwcm1qaCszM2hQWVdya2tH?=
 =?utf-8?B?Y2c3UUJEVGMvZ1lkRFNrZDRnMkovbnFnSGFXK2pNMFBwSUpPN25hbWZ6T2VQ?=
 =?utf-8?B?ZTRVSU4vbGN0NkR3SmgzWmdGMFYzU1lPTFpvRzNudk5jSy8rVVVibE4xQlhr?=
 =?utf-8?B?UkhFOUhJRlNHdm1RdU9JaUdISHlmalFpcGxVaE5JRjFYdmswZCtIWnBzaFBQ?=
 =?utf-8?B?djlVQUw4bW9BK0wvMlpObzkrVXM1ZTNhK1hqNlpnWlFQQXBhZkc0bU5EelFL?=
 =?utf-8?B?ckNESk5jOUxDQmlMY3U2bjJRbWNISDhCV1Y0ek1JWlZKdVZhd0pjU2o4TVVH?=
 =?utf-8?B?OVE0cVBLcGpMWGdlZTJKOStYaWVjODMzZWZMMS9SZDQzY3JZWU90aEdCbFZI?=
 =?utf-8?B?R3V2NjZCbisySXZkR1BFNnlLSE04S1hQdGd0L1M1S1dxZ2VaMnF1cHU0WDVV?=
 =?utf-8?B?Y2FqMHhJU0xSVGZDeUltWTUvZ1FZR3dXWXdDTG5qZGx1U2c5YWxhK000S3RM?=
 =?utf-8?B?QVNualB4TFUrb2ZzUko5Rzdmc3llbTZ3YmVOcU12d1pRV3dpS2Z1VW4zemd6?=
 =?utf-8?B?T3VweVRuNVljeDFYV09kbXhKcUNQMkJuanlOU2QybXFMMHBrT2p2NDNCaTJ3?=
 =?utf-8?B?amlFSEJLZzRQdlZWMUNNWWhDeUc4K0FZS3Z2c0FTVW5wQkJZUlJhUTdod3Fq?=
 =?utf-8?B?ZEc2c0dXY3NKVFJXSE11ejZMQlZneWRxaUxnbjB4ditqeGVGRml5VHFTYnRZ?=
 =?utf-8?B?OXJka04vQlBWY3VlclplQjJuM29lWFNQT3RIN0d3bnhBbG5ydGRHN1JJN1Jv?=
 =?utf-8?B?OUg2ZFVQTllPdU1MbFJCYm1jZU9sbndmVGp1OUI4OStUajNacnc1bTdGbVFa?=
 =?utf-8?B?cjlnbGdsc0w4eVFvendsdWkzV2FoeFdrYjgvaEhDZmNaN2NRM01yRzVlMjBq?=
 =?utf-8?B?OEVkeEhRcEF2NGRkTkJHd2VNWXZadHpvdEVsOHpLdjZhNlFIeElaTFcvSTBE?=
 =?utf-8?B?TkZxd2hENUNYa0gwQ2JpT3hPcVVROGk4T01nL0ljVGZqeGI0ZGZFNTUwTk1H?=
 =?utf-8?B?Vk43d1lHa0l2VDQxekladXl4Qkg1dnFYQTZqYWxRSmNqTUlMT002RVl5ajNv?=
 =?utf-8?Q?BVRjXIZ1CDyZkme+q05yRqJR3G55AEy4Ow+hcbI?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ae431e8c-b6da-4500-1170-08d8eb06ed8f
X-MS-Exchange-CrossTenant-AuthSource: BN7PR03MB3618.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2021 18:43:46.6599
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Rh4ytbRKK01qjaiLf1pCF8QZTmTbYscS3iPj9Ssm3yJx5qWXd7g+xS9tH38TU84Q9qBWzRSfGxZkL1A3Y56thQzRm6EwuNnVn62fUXOU3pg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR03MB2513
X-OriginatorOrg: citrix.com

On 19/03/2021 14:02, Jan Beulich wrote:
> On 19.03.2021 12:44, Andrew Cooper wrote:
>> On 08/03/2021 09:49, Jan Beulich wrote:
>>> the release is overdue (my apologies). Please point out backports
>>> you find missing from the respective staging branches, but which
>>> you consider relevant.
>>>
>>> Ones that I have queued already, but which hadn't passed the push
>>> gate to master yet when doing a swipe late last week, are
>>>
>>> c6ad5a701b9a crypto: adjust rijndaelEncrypt() prototype for gcc11
>>> 9318fdf757ec x86/shadow: suppress "fast fault path" optimization without reserved bits
>>> 60c0444fae21 x86/shadow: suppress "fast fault path" optimization when running virtualized
>> fe36a173d110 - x86/amd: Initial support for Fam19h processors
>> 90b014a6e6ec - x86/ucode/amd: Fix microcode payload size for Fam19
>> processors
> For the latter one, didn't you indicate to me elsewhere that there
> was still some uncertainty about the value?

I'm attempting to get the number put somewhere helpful in documentation,
but I'm fairly confident this is the correct number now.

~Andrew

