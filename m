Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C9A0E6B8B50
	for <lists+xen-devel@lfdr.de>; Tue, 14 Mar 2023 07:37:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.509466.785258 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pbyHi-0006Ue-Mq; Tue, 14 Mar 2023 06:37:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 509466.785258; Tue, 14 Mar 2023 06:37:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pbyHi-0006SM-K3; Tue, 14 Mar 2023 06:37:22 +0000
Received: by outflank-mailman (input) for mailman id 509466;
 Tue, 14 Mar 2023 06:37:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=3caR=7G=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pbyHh-0006Rq-6i
 for xen-devel@lists.xenproject.org; Tue, 14 Mar 2023 06:37:21 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2062d.outbound.protection.outlook.com
 [2a01:111:f400:7d00::62d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ab77cf6f-c232-11ed-87f5-c1b5be75604c;
 Tue, 14 Mar 2023 07:37:20 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by GV1PR04MB9054.eurprd04.prod.outlook.com (2603:10a6:150:1d::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.24; Tue, 14 Mar
 2023 06:37:18 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%5]) with mapi id 15.20.6178.026; Tue, 14 Mar 2023
 06:37:18 +0000
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
X-Inumbo-ID: ab77cf6f-c232-11ed-87f5-c1b5be75604c
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PXoydxCrf+zNa4TEg1jFYuB4HLOHarWds4DvLZbjfzwyW3olZHXacgDJnlRuaxlxcj/Kca9qBq199cnEIeP8ud1ijY6mSi5CywZoAzsurMmqY774myS5KgFn9gvYu7bN15GKaWGIfWus+zxyO6m092s2tjmIbusoJyIYOt+hTUMnef6SXkJ50vDNdx15EPaiKYUBJYhrM8Fzmpxc2m/UkeHop7ZLUPAd8gyh+1xbtx9lNbYpJVA91yzVExZFqs8f8MoRZn8NyJWYUdoCzlJw4MXOyZuCxOpbuOGeXvoU7oo4PEEVOKFpjhZQnorNJMPNVCOE1Ns8EW7BXzaJ8LZWqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZIjmnn447syhAgd08zuPhT57WsF3mY9ZqpPB9f7xZwM=;
 b=VL0nDTv5yqor9PhDeNEXcq36WJRj98Ci+UGltI6JENSZ2SpDktFoR24lEJI7Obq+yptQjjPHoHEVms711PLGH9tGC+WiFv5MwiKAG31wRVEZ7M+2+WxjwKoXhUCta6NTtXlURkfXwaW3NrnCN5DBtl9OYM5/4kaQq8Wfkjel7plsLn2mYs/mzI05XrOFnGP2Kd8QN9+p4QxjRdznl9ZblkTC9F/mY6foxAebN7XyUdi+J5NMhYhpjXhCMuEiNIDMgrUZO/oh6tZNUrs1THbpd8nVPOFz0FKbc7mTgFnC0TC4bMdTPqGj2eKA8EZRKgkbhSyWaEUovA5gpUE4qHSBkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZIjmnn447syhAgd08zuPhT57WsF3mY9ZqpPB9f7xZwM=;
 b=wzqJ15iclJeq1gOrMMxSHFUsZo8m5uq0YrsjykhNGnSex5VtANQaFDmnU3TVhmWXFuKb3uLRZfRD/tlLf1Pfx8vP2pPX0ZpOthWqE1KGmzB3InEo9XcbqvpHQsjpGsHnrfOWnzQC84Ieyhlo/bmvidZFb9e9uGgOZZt4S7XIUA5QO/Yr1thTozEpioKwsVdkOuWI7nvDkJIIMWDcINdEQQY0v7l57h3CQvLZ6arL6olvknaa53cTjVkJUfbjSuWnz3Ghvtx7VAOQWKd4gARF0/URAvUkMMekujhqqHMaNh/Y2oem1YLLWhLc0xqJT69W59bPAT+E4GVkaWMunYwlcg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <2afa0abe-abe5-a3d8-658f-abc466d78101@suse.com>
Date: Tue, 14 Mar 2023 07:37:16 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: Aw: Re: [help] Xen 4.14.5 on Devuan 4.0 Chimaera, regression from
 Xen 4.0.1
Content-Language: en-US
To: Denis <tachyon_gun@web.de>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>
References: <trinity-8973751a-6742-4309-b02d-0b4c38f4206e-1678390468345@3c-app-webde-bap36>
 <84f66bc0-ae7c-febe-9a15-98453c48d051@citrix.com>
 <ce1a289e-6ed7-9b5c-42f5-069f16bd6984@suse.com>
 <trinity-429ff607-c131-4745-8c96-9d7f6f61234f-1678481409956@3c-app-webde-bs42>
 <31151e94-b8b3-15ab-3680-e1c6e2e97530@suse.com>
 <trinity-7e872635-20a4-4120-a08d-2d62a77d2da5-1678756503867@3c-app-webde-bs22>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <trinity-7e872635-20a4-4120-a08d-2d62a77d2da5-1678756503867@3c-app-webde-bs22>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0082.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9b::9) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|GV1PR04MB9054:EE_
X-MS-Office365-Filtering-Correlation-Id: 1fd89c40-23d1-43d1-2268-08db24568ea3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	yccTnGWsoVwM8v/3ANXIhcrs2IWUJyKKRprQQpfSwvfdnttnW2LxY4Y9YO6hmLYZhlcIQ5LgNJshUd4CYkTSob5HORYgt8CiNwcG02XjjE8EQCqcXvWYQcWSl/8DcIF4XBgQn/ZJQzPj96W5Xb8K7Q171vK05QyF4Vvrpu3vC23urIJ6pRLEi+sV6dXutDVRuEL9r3uU0WVr06oy9/mdfZnaP1l+X4GdvKWcBJ0aZatDqmT3jVQ09GVl5j5eV4jUBp8+EROs+4bKh4Hng28WLlZmA03p6odI0mKHbvqbnwMo5HgjKBkJfz1Kjfnarb9dI+eD1rJ8DF5lcdaBKYilzw4yqPQJjLqI94yLVFCaj5CiDpKf1o9Dg6Wm37IwGd+GtSPt+c8wFtrP1uidx2ljfoNiAN8sTTo9h6/+HZxZm6KCcYYyWvhdmH03CD0CniJbBjFvgMAz7KirQFUeaaCIgcf5LFoG6mL9kebhRP97ToKVdmvwV0JjiTbCCbGEUM+ZZxopwgRsBRplDPcPfIe+EzDZL6JC2mHNcEsUToMOzBee9DEKD9C0W13aVX0Q1Xgpd+AGwSVSTJ0tZv4QxOJrswEQ+rp9Jhd7UogDbPOmqwLWCrhTzatSQo7jKeotJesQaeCvQytzHNGgZwTtENvctYdTnwdpFYaoBzpQlEtm8q7jQGhOlaiXRIry80222aqsxFh6qwJL/Wg0eVeKiPa6j3DLVPbJBaXkCCx1WOoN7zI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(136003)(376002)(366004)(346002)(396003)(39860400002)(451199018)(2906002)(41300700001)(8676002)(66556008)(66476007)(316002)(36756003)(478600001)(54906003)(6916009)(31696002)(66946007)(86362001)(4326008)(38100700002)(6486002)(5660300002)(4744005)(53546011)(6512007)(6506007)(2616005)(31686004)(186003)(8936002)(83380400001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZVJrdnhOWWU4ZTIyYktwVlVEOFpkVjhBYTdzRHdLK1JYT00zQlVQL2s2dnpw?=
 =?utf-8?B?U3ExN1NRbVpmM1pOVTk4VGw2dzRDU3JzRlhVUkRhWGJuclpWUnA0a2hOdzF5?=
 =?utf-8?B?S2VEQ2N3TTVkY2dERnUveHlybTdGajR2aGpVWkNjRlorMzNtaEMzT2NqRlU1?=
 =?utf-8?B?cmtva0VXbUdsSkNLTnpmb2hHUis5ZzUvS1ZQVkYyMnZLdE5nK05LallDZ0U3?=
 =?utf-8?B?cW43WDljbTVVMEJDbDJHNXI3UkVRWjRldXhwdVlxRHowYUlFSVRlUjNZdkls?=
 =?utf-8?B?bUtxc2F1WVVlSzZ6U21LeEF3NkJiNmlUMnQ1NlJiWG5mV1Q3ZUFJdG1ucEQ5?=
 =?utf-8?B?VmdnS2wwWmRDM2g4Tkk2VHZVNVhTV3dhbVhNRkRCS1lWdi9GUFR0R3pMeWlw?=
 =?utf-8?B?S0djZGFhWHUyWHREWm1LbGdPektOWHFqcGdLNHNIS3orV3V0Rjk2eEFhOW81?=
 =?utf-8?B?N3RjektVaGpIY0g3MS9ROEpKL0p6bnhvaGhjTmhBZVJpbDlyZGZ4dzB1Qmww?=
 =?utf-8?B?NDI3WnFHVnFsVDlqb0RPMVpZT2p4LzFDWW9qQkRwelEzaGJqMU1TRFl6RC82?=
 =?utf-8?B?WUtjL2cycjkwVFJJZjRzMG1SZ1VQenFQRmVDQkludWQ5bzFSN0F2cUpXQXE2?=
 =?utf-8?B?ZHZRSzBRQjBtZ2lkUFErUktUSkkyenowRHlpSDVOcU9xaGlpMmhidnNSTm42?=
 =?utf-8?B?eXlrM0EzVHRsSDRLQ3Vra2FwaU9NcEl5Nk1DM0ZGWmo4dDdhTHpxcURNQlVQ?=
 =?utf-8?B?VENJN3JQc1RKTUc5cEhCdHhBSHFKUEZudXlWNVJMdmw2TnJIVHJwMy9jcm85?=
 =?utf-8?B?MUd3T3gwcS8wRk9QV3QyS3BtYWJyYi9yRjRxZHRXcFhOR3RCRFBkclVMb1Rl?=
 =?utf-8?B?OS9Va0RsWUFkazNnR2NPdmNzOFpBdjVQMEVZL3dLTEhOazdUZzBuNE9ndTlM?=
 =?utf-8?B?SzZsUE1yMTltbWcyeGtiazVzNG42cEN0eVMwRnZudlZ3YTg4SnZ3am0xSm91?=
 =?utf-8?B?NXNiWGVHc3JGRncvY1daL1ltdmFEZGVhVnJFQ0R5TDBscSt2eHdHMEdkZzVM?=
 =?utf-8?B?Y3ZiZE9QRUxkWGZ0YUYvam44c1JTR1NRaERLNTcyWjRGN0hOektRNCtLcWtk?=
 =?utf-8?B?ZktDak0xUHVnRTVvU0tIaXprQ1UrTFNtYzdobDNoYzZYdFZ6RUhRY1JVUElh?=
 =?utf-8?B?TTI0RWxBR1pDVVFVUEpVY2dWdmdoeXJQUDh2TkpVbmM2UG1OcEFSKzQyTFcy?=
 =?utf-8?B?QTg0M3RiVG5URjZQUlcxMWRMNTdlYXBEK1RzQnBra1dORzJDNzBmcUt2UW9U?=
 =?utf-8?B?NVExUUtwcWFieHdXSE0wS3JDSDZQQUk1ajhnYkUzOGMwSmptQnY1MUJsMG9v?=
 =?utf-8?B?Q3VVbFlIeUgxSmhicmF6aHRxWUVpanJVU3l5K3hJUytNeEp6TytPL3ZVU3Vn?=
 =?utf-8?B?TUh5bnBJNmx5bTMxaGZ4dHQxYnJqN1lRb0hNRGxRd1ovM08xdUlQWGF4MEFO?=
 =?utf-8?B?MEptYi9yVWNYZ24yRlRyaWNUYU1OU3lZb3NxckJ2ejk5NmtuYVhmRnllbC9W?=
 =?utf-8?B?SGZodkRWUUVPM0dUbU9JVkR6Z2ZHbXh1V2ZqbFMveFlNcnV4MUV6cVFFU0t4?=
 =?utf-8?B?RVdtSDZMV2diV3JnTThRQ1RBQm5VaFZnWXpxaW9LeDAwSVgwUW9jTkRhQ3Fu?=
 =?utf-8?B?TjNHUWRFS3h1NkxKdG1rbmp6QXo5V2xUU2drNmR0eDdkaDBSN3JLVzlJN1g4?=
 =?utf-8?B?dWh3TTZROHluYzNncXppaFBtbzQ0WnRxRHZlcGJCWkVDRkFpeXVMQWsrMXRi?=
 =?utf-8?B?QnZzQkRHd2RXZ09SOHh4dThueFRkZytOR2V1OHRUNFRnTm84MDBlLzlWOEZl?=
 =?utf-8?B?UUVROVRlZG4yTG9SRmVDYzhxUE1vSzd2b3lheFBOekpEWUpYYmJ2d1RZQjla?=
 =?utf-8?B?d1Q0TERwSDhPNjQyb1g4eUlTVHZPUFBuWW9wZ0MyNkh0NFRKdDRWcTdSTk5U?=
 =?utf-8?B?OXI5UHJYQ2hCOVNHdFZVTjMyWW8rSXVNVDlERVpibE5acjQ3MEpCQ2dyVGk5?=
 =?utf-8?B?UHE2dndwZW0vMGcydXJuYkM3d0FVSkxJcVJvSzVpNDVnaFROWlhPK0txNzha?=
 =?utf-8?B?T05naFVUdzA4V0ZtaVE4MFpBRGZFM3ByT2RQVzlqNkpHc3h4VytINmFJNEF0?=
 =?utf-8?Q?gaWiOZBppZlwU2qAG5HowENLiQicjc1fmXyjF9xK04W4?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1fd89c40-23d1-43d1-2268-08db24568ea3
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2023 06:37:18.3462
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hRqupXTqVfujXQYiN9hw1b2z+iHUpgYVQNxUSlUest+uLzZNqgPuU4NFVNDJ8xIs0FHnO3C361J9vPO9om2VCg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB9054

On 14.03.2023 02:15, Denis wrote:
> On 13.03.2023 10:36, Jan wrote
>> On 10.03.2023 21:50, Denis wrote:
>>> Should I test something else?
>>
>> ... there was no request for any further testing here, for the moment.
> 
> ah...sorry, going by "Would be nice to have this confirmed forthe system 
> in question, i.e. without Xen underneath Linux" I thought I could test 
> something which might help shed some light on all of this.

Well, yes, that Linux-without-Xen test would still be useful to have
results from. I didn't account for this in my earlier reply because
I had asked for it before already, and I did take "something else"
for meaning anything that might have turned up as useful from the new
data you had provided.

Jan

