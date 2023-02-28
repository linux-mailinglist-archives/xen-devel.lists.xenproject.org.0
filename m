Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9007C6A539C
	for <lists+xen-devel@lfdr.de>; Tue, 28 Feb 2023 08:17:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.503026.775147 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pWuE6-0005xw-HT; Tue, 28 Feb 2023 07:16:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 503026.775147; Tue, 28 Feb 2023 07:16:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pWuE6-0005ue-Dq; Tue, 28 Feb 2023 07:16:42 +0000
Received: by outflank-mailman (input) for mailman id 503026;
 Tue, 28 Feb 2023 07:16:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=rjMb=6Y=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pWuE5-0005uT-1q
 for xen-devel@lists.xenproject.org; Tue, 28 Feb 2023 07:16:41 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on0604.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::604])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d72c2d14-b737-11ed-a550-8520e6686977;
 Tue, 28 Feb 2023 08:16:39 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB9PR04MB9625.eurprd04.prod.outlook.com (2603:10a6:10:308::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.25; Tue, 28 Feb
 2023 07:16:36 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%7]) with mapi id 15.20.6134.030; Tue, 28 Feb 2023
 07:16:36 +0000
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
X-Inumbo-ID: d72c2d14-b737-11ed-a550-8520e6686977
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ju6x2amSfSt4WY0/co2en5XjuqiId7SK7Xt3RElDTfsizhYuxKE+yISRKNV/nmD0poC5RkxoD+8Xc+s+rmBxLRL9D8sZoCO1WTVx0CnymAkgsxmVrp3GOOPQgm1UGdIgPjdU8olPVB/eDeZ5AsL+2KKymG9fUanpSKbd67NYLhj/E47fqV6aslINXnvWiWG7Jgo5oUdd0V/vUkRuy2SwhRL0hcUC9k0HN9s62uuNwzoTdLw4Htb6o9ltmrWKz28pD+Td66QfMdJ3wGMlxZCsF3/SVPfPdPNIe4yCZPs9bAhipZd0ECfIFEmW4jlb8/7I3x7OaGyonz1uIHAM3XkfVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mu2CFQ4HgF3EX88DAtfBNvYiNId3X68cby2T5ixRBnA=;
 b=kbVyCBslbdXGpUbGwjVtfvfal9tDvN/BN9O1XgEmBC15bzrikuCGdBVaESJ3WkYVrRU91itJXLAI8I47NwIiof5v4KB4BK0VnktkeDkdma/qy2/iGnY6KELWTkZvx619kqCUM2g3oa4UNAidFdjK7V4cZyoY3aPFOSb1kW82JDKrXFRy3FDqFeYBS8D6l/m8vMserCXTjqIyUoakqQgM8wbAF5vYjgRkyqZPsCegJszFdoFrvBrV+d8+ewOK2bVB63fvuEf/J8y7PMIOdPBFQl/4/WB/waUvba/xwKPYByE9pPdB8RRCQP3ROPYl1kS0LMHIdvkNagAiAb95gFTBwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mu2CFQ4HgF3EX88DAtfBNvYiNId3X68cby2T5ixRBnA=;
 b=ciLibconxNCll342GD5Arkm3VPTogeLwc9qWBIjixoa02kqYFFb0HsQRHqj+ed2wKvDsXnUy768yeInNoaOwAtClcKwZ4KCrHn7nl8wRZD7zp40plx/8VrgffkfpPCCpHY/ZDO6UADyTf3IQDdvwLnS24ZtxlJ2eWsl1UungH5zmxLUQkF9AuWNdXkLd2i658LWmnQ5jDLYEViZELpFiyVPUjW3IIbe8qzi3Eja56Kik361Qc4rJr+9PBmAb8HBAvYSQHYZTIEu5dlOx30nKMnAcoPPbY9yJRTVFKEkhS1UO33clGZ+jgC/u6pEzcHlGN7Lk/JGqGlb7n9rK4BY4rg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <ae0b11d5-2294-7b96-c244-3fd85be92b9b@suse.com>
Date: Tue, 28 Feb 2023 08:16:34 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [ANNOUNCE] Call for agenda items for 3 March Community Call @
 1600 UTC
Content-Language: en-US
To: George Dunlap <george.dunlap@cloud.com>
References: <CA+zSX=bwfZnssbjB=4=_r+a=w-=8i7+i8yZ5bgOrjAox0PR7pQ@mail.gmail.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <CA+zSX=bwfZnssbjB=4=_r+a=w-=8i7+i8yZ5bgOrjAox0PR7pQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0116.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a8::18) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DB9PR04MB9625:EE_
X-MS-Office365-Filtering-Correlation-Id: 0ce393ce-b552-4526-7fb4-08db195bba75
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	MoGT+o8vsvOrRXWhnIgpa+exhaqndBPzP87kJJrCEMkBzX3n50We9whsWTME9ucYu0DNGzM+kEZpwAsqZL3KzIPx9LVSwLu5mf3vt+WiAG6vn+3RU6btRsaLH4SZJsKK6dLMb+Tq8usK4NJJHpCQKEGTvmN+MeCU+kh06KLsTbh1oKHnblZQSX69/emA0mGjxuUtmv+3tGFrhcWrAtHRqZET0NZYOqL42rDtUrbWmf2KehFV42yn/zLgyiKZqBMApwgsOThoVlcg58NTgoDw5fQ0v27qo1v6usbOhir4ycutjOZcy+9MzKLj+asqdeHOhqhd+Rf5cokCJQkpO3ybJWKKSj6Ivc/ZORNe7G6K95XH78kP9HLOMbykjJqAA5DBGzlJQCzOZaPS9esxZY5vGYFGlt2aekwGFpl3qmFEmEFzKVIJsZ4Hu7kZB1wcBkfntWulFx3trgGJBOwRM7/MyqzC+29vvLnK4RhTZsrhUZ0w10duI+zKGJadtoSptGQL5dJ9QZLLOjJ7266KUM2MmF0QI6l86s72OppDNkARIT7mrmJUTNBBimfw0dLdU73Ww4lxmqyeOATdIYZ56tfhYzqUoCXhX7e5UhFJLX/cLHyz4vBaUgbr2pJTLdVZgHFLq2R5MFsMR+r8dz9s2N0UW/TiLUQ5HK+RM6Ajntf/EzvHE8cWMHfKoAbmO/M5ZV5DQkL0prszpY8TOxA1WVeyLe81GykSxS4z/PVww7/G6lM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(136003)(346002)(396003)(376002)(366004)(39860400002)(451199018)(36756003)(2906002)(86362001)(31696002)(4744005)(38100700002)(83380400001)(2616005)(6486002)(316002)(478600001)(53546011)(6512007)(26005)(6506007)(186003)(6916009)(8676002)(4326008)(8936002)(5660300002)(41300700001)(66476007)(66556008)(66946007)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cWtUeUdibW1GbXRyZElkUkFoNHEvNFR5S0JxVVpHaGhEdWZpVEw5cmU0cTBS?=
 =?utf-8?B?dUkrT2tYQ0Y3bWNmcWlNMGVYekNLTTU0dEt3UWZLVGhqRm1xNEI0WlR0dkE5?=
 =?utf-8?B?dURkZFhmNG9mdFc0VVEzQVNmK3pFanJDbGpVNTkyTHdGMVZqZncxbndTWmpp?=
 =?utf-8?B?M1BoNEkwam9ibWJFbXA5WEowZHFjdUo2b1JtbnYxNi84T2R2dmtjalNIZmQ5?=
 =?utf-8?B?MTlvQWh6MUxlOW5xcTZMbmtLaUI0TTlnQ1dkOUptUk9CVE5QQmRIQjNnckFS?=
 =?utf-8?B?WlNWdVRUSTV5RzhyVEVWYVg0QW45RmRENWZ0amhtLzl6alBLLy9BMkRsWW4v?=
 =?utf-8?B?WElacW42cW1GSlRtbkNRUDk4ZVY1RTVqampnSkJZcXRKeVozc3VJSTJYcVA5?=
 =?utf-8?B?SkExSGQ2REc1c2VYOUdEYjNZRWtFdTRVdVIxWkowd2hveFFPa0lXZU5haGFH?=
 =?utf-8?B?MlM1NmZSQXFwY0Z3YWI4VmIya2MvVG0zazdtcDdVSGpkMVpjZDd2UWVQc0hC?=
 =?utf-8?B?emtTVUQvZ3J5Uk1yZDdzMjA5akNYVHhQamNrVDY2Z3pPRzh2alFpeWxyb0pM?=
 =?utf-8?B?ZFZsa3VNeFI3aUg4eUhCSThOY0p4SmYrWjBuRXNmYTlzRXE1R3cxMDRMdGxM?=
 =?utf-8?B?TkNEVXMxbEc0RWxGVlN0bnloY3piVEFFME5nQUN4cDg5Z2dLYVhsL3FVNitk?=
 =?utf-8?B?U09VWFQzbk1PWjBhNFVmZWpwaUcxWUJiQ3RMNFFLODFyZEU4NzhtaWNFTnRr?=
 =?utf-8?B?TGZibTRXL1hucDNUTFdJbTlobmxnM25rd2VXdW1ESTRIcmh3cXRUbnhvUnNO?=
 =?utf-8?B?cGVoZXZ5MjNkVnFkNy9hUVhVL09VU1lPNDRzQnZLVDYyZDV3Yjd3TkhQR3lL?=
 =?utf-8?B?R0dsRHJscEFsL2ZsdGsrd2daRzRYZjZMTjBtUFFyMHo0V2dUQWl5Y0lQelQ4?=
 =?utf-8?B?a1QyWFpHdzk0dHFHNEtoNHhpSlJ6dENPbDB6Z1ludkhTenE1RUF0NlJPRlB3?=
 =?utf-8?B?YU1TVWhJYmw2UWsxVStUZWFrSzlKNkh6T2lBcFFjSCtvTTJLb1hMdExSZGlj?=
 =?utf-8?B?RFRBbEQ1RGoyRkowYW1JNkpyYVZEdnFCOGtQSC8veGgra1VLN0RRMUROQTZX?=
 =?utf-8?B?cFJqVzNvcDMzR1lDYnE2VUhZVjdmV0dTM05heElXREsyOEZuUVhhOWpKM241?=
 =?utf-8?B?L2Q5cmhRUW5ra0haOVFXZzhRWmsxbXFqa25meXZ6SXNwYW9IM3FvUEE4UE84?=
 =?utf-8?B?WGYybUtzUkJqN2xSNkV4UXlNSW0rM1BsQW83Szkxa05QKzA0ZlpjcGh5S3JC?=
 =?utf-8?B?ZTh4bWtXOHREMVBBdTl5U2x3UldXeTE2eWM4ckFLdkZMVlMxUE44WG51KzBr?=
 =?utf-8?B?RFlTOXdvT3lqNlBtdDY3STRsZkdRQjlhZXJzWC9LdmxuRnRlcmNqM3N3eVM1?=
 =?utf-8?B?aDdib1RwaEpzeTZtRG9BQW4wQ3J4MlZlVTFoSC9DSHhJMjNkMys3bGNRR3Z2?=
 =?utf-8?B?UW5LR3hVQWh3c1ppaTRlaVdVVXZyYm5NbWdRcVZnMGlnUTY2K2R2OElyZ0pB?=
 =?utf-8?B?K2h5ZWZCTEVsVXlLT3pMUHp6azVTcGZ4UnY1akpRdUp1U3kxanZkU2E0akQ0?=
 =?utf-8?B?emw4NWQrbmtxS3dpYzhyNWcxYXVzY3lFRkptV3ZxUytBTW1zeUNkYzl2OFp6?=
 =?utf-8?B?c0FUK05wVmE5WXFWTWdVUFFhMU9TL3dTQm1QYk5SOGw0TER1QTJjbTh2amc3?=
 =?utf-8?B?cHlnWThFYXBIT2hTV3dIQ0I3UEtYNXg5b3N6OTJINytUMXFOcmNsV3plRGFZ?=
 =?utf-8?B?RGxPTEhpWkVDUlBuYXNJRzNCOGdaS1lpcU9SODZlZW5CUDRQMEFTVUREQ29z?=
 =?utf-8?B?dXpSakw3WnBuU0JpLzB0MzROSGJxbGR1M0dhd2NHak5hbVd1NFd1TVk3Rk11?=
 =?utf-8?B?UmF0Zk1HbzhGaCtXYVdiSUlWVG1BQnEzVklqZVBrU2s2ZUJhdGFZZlFZY1RE?=
 =?utf-8?B?NU5TU3FsWVk2M0NTNkZCa1RDbHlrUW9oTy9DRTR4aExDSm0ydXBUd3VPY3hK?=
 =?utf-8?B?N0xSRHNPVGVoMUMraXdYb1pxSFJsL2JUMjJQemZLRGttSEtIa0NoMXhGcERM?=
 =?utf-8?Q?NXFpxo1hyRKYh4PduRYgwc0t3?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ce393ce-b552-4526-7fb4-08db195bba75
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2023 07:16:36.5756
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FRs9ESKgut9xxv9h52SuWZJemHxjVgNGfMUN8KtH0OdqIkl9KIhprg5FGaXcfEBDQn6eFXAl9ZMqxRfEBq+EAg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9625

On 27.02.2023 22:41, George Dunlap wrote:
> Note the following administrative conventions for the call:
> * Unless, agreed in the previous meeting otherwise, the call is on the 1st
> Thursday of each month at 1600 British Time (either GMT or BST)

Since nothing else was said, I suppose the title is off by one and it's
Thursday March 2nd?

Jan

