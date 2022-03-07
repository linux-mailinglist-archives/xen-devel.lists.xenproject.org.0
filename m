Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D7EAA4D03B5
	for <lists+xen-devel@lfdr.de>; Mon,  7 Mar 2022 17:08:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.286236.485672 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRFuh-00077U-0a; Mon, 07 Mar 2022 16:08:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 286236.485672; Mon, 07 Mar 2022 16:08:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRFug-00075e-TJ; Mon, 07 Mar 2022 16:08:46 +0000
Received: by outflank-mailman (input) for mailman id 286236;
 Mon, 07 Mar 2022 16:08:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/EJ7=TS=santannapisa.it=Andrea.Stevanato@srs-se1.protection.inumbo.net>)
 id 1nRFue-0005sw-JZ
 for xen-devel@lists.xenproject.org; Mon, 07 Mar 2022 16:08:45 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on0610.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::610])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dbc23599-9e30-11ec-8539-5f4723681683;
 Mon, 07 Mar 2022 17:08:42 +0100 (CET)
Received: from AM6PR03MB5000.eurprd03.prod.outlook.com (2603:10a6:20b:88::11)
 by DB7PR03MB4844.eurprd03.prod.outlook.com (2603:10a6:10:7e::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14; Mon, 7 Mar
 2022 16:08:39 +0000
Received: from AM6PR03MB5000.eurprd03.prod.outlook.com
 ([fe80::cdef:8699:47b:300d]) by AM6PR03MB5000.eurprd03.prod.outlook.com
 ([fe80::cdef:8699:47b:300d%3]) with mapi id 15.20.5038.026; Mon, 7 Mar 2022
 16:08:39 +0000
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
X-Inumbo-ID: dbc23599-9e30-11ec-8539-5f4723681683
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L7x5m7fn2MavIpRBfoFXJejGwJBmwf3Nn0lem+bcKLpRuYf0QzyPAN1HmK7JSc16qJqUmVw7VY0Pbos3DEK2Q0d5cp9yUIVMRwn/dG0kgOHjONPwd7aQVl+jNi1UDDf+qvU07cYgmqY8VlD3zjifTz5lpCwdw+VfYho+sdYYjLxAKNwSpJC6dU2M/npJqRKG9DPcW17vckY11VpX56n3wb05UyqQS9FSGv5vjsEI1idunZzjnRkMZuxmMaKvQxsXPNFA+WIEknIIQ53PfCfR+6hzZRs859gl3oV3gvq81ORGdHE2hSaPaJxRWs1Sy/2BzlwfgH4NqOGEolWAAuOnyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fsov/kYrN0P1VuEaEL68xieAQHSnRBrLrUPiRWzPWQ8=;
 b=FpT90XkGHkwjQkpu0koFxXayW2C0DtCOFEeTYhKT17jopweNbMkgMAvNlno9UREfga6loyzl1qUXIhSQxg4OsQcr015cAabye9FhrKVHV6AnaplkxppmoIHQDa+etU3R7eVGijpEKsnSl/H1RSFdrdd3Qqs+tIG9jrONTS0LIOtZvVUtWNxVUHFnnCCfpAjEWslvYfWTgQyiXCkeCPFt0wggwz/ykvUlpmFC84/WjvPRPa71R5ffR3QTqpkB5IrqCc9PIMbuF8gFKA1w5Wznz4s15vt7RHdK5YVceYyXCAuxkxmuK0JjC2d7Y41IOmMICHRCnKH+9KSy5DUFp0NvXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=santannapisa.it; dmarc=pass action=none
 header.from=santannapisa.it; dkim=pass header.d=santannapisa.it; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=santannapisa.it;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fsov/kYrN0P1VuEaEL68xieAQHSnRBrLrUPiRWzPWQ8=;
 b=pQbC7T1L3f9f7ZeMcH85j8LS6mO9f48gvhOnhhYvpYZByh6dRGWx1dWAchNqyFV9ReFgBd+l97XQidcjuVEwQM5k/Fvd+z4airAWw3/oOpprI4kvfR5kJLMiqqmFDGKMXBGVPAMs3WeeMFV16cXEsWElpmICqyTQFBZXjSPGKxM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=santannapisa.it;
Message-ID: <feaea184-2b6e-3dd4-132f-9a8489ae5a0f@santannapisa.it>
Date: Mon, 7 Mar 2022 17:08:38 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: Network driver domain broken
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>
Cc: Jason Andryuk <jandryuk@gmail.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "wl@xen.org" <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <YiDt7fX92n6Luc2l@Air-de-Roger>
 <CAKf6xpsnmQG7-LXn5+Uz4mncWsN0EZ8wpagY8f8OydvZNb6g5A@mail.gmail.com>
 <YiH9cee6NIKA6MWg@Air-de-Roger>
 <53a4fe6b-efc8-bfa1-8475-0aa58774051a@santannapisa.it>
 <YiIFyRUNXpUfzwRB@Air-de-Roger>
 <0ce52d38-f542-9336-a100-1cbfc559f218@santannapisa.it>
 <YiXq5HIrvZsy7QKU@Air-de-Roger>
 <b388ed5b-177e-2e9d-6450-6df16d9250c4@santannapisa.it>
 <YiXwhUnZL8bcJvH2@Air-de-Roger>
 <93fb9755-d40a-3cfe-1f6e-335b57d5a213@santannapisa.it>
 <YiYcPgVTpA8//ojA@Air-de-Roger>
 <9bdcff21-064c-b671-d8d2-7b7e20e486c7@suse.com>
From: Andrea Stevanato <andrea.stevanato@santannapisa.it>
In-Reply-To: <9bdcff21-064c-b671-d8d2-7b7e20e486c7@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MR2P264CA0035.FRAP264.PROD.OUTLOOK.COM (2603:10a6:500::23)
 To AM6PR03MB5000.eurprd03.prod.outlook.com (2603:10a6:20b:88::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d3420b60-5407-4233-2f35-08da0054be33
X-MS-TrafficTypeDiagnostic: DB7PR03MB4844:EE_
X-Microsoft-Antispam-PRVS:
	<DB7PR03MB4844B15DDF11DF819D6DE68D98089@DB7PR03MB4844.eurprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	fDMCmAHpNLcV1CGu0lvpeOx79/Big8g82RuaydDf67aVzfnv9WL74Id7t0KFsncMZbSAZm0TljKz6hR3/GNKeyvdgg0F1zSw3+AfZReClxAT4nmMIu/I9HMR8eDJeQtFRjA48ImY7Z+qxU0CwQ7XrC2+m4bf0rY0m18LemtLcKFl8p+P9fHcKXFHSVGKhp2g6HSqsqDk8r/dRcEYyyldtFvGiWnP2LHF+IxpURiNPTSPTz+jXOIQ72to9bjkdsxUHPvrKklEL6rfqOTFaKGHFF/AwjNuNP4KPKSyzuPVu7yZj90MdhpBHHNHaTRuH0X2g2EiV3ag/XtF/pqQZAtLSj9JLsheNuzSceWe7iou1rNjIfQXL9q+KfvSaElTnEmtXzeI/Qepyl5MzNkgluo8Jklc+dTI3zhjQwBiDTEKayYnivkTIdOHVvsvJU4g0/V9obgWgtiCo7qIGKjE2EQaNirOPzpA+hYtos64TrZmKO+qezIVOjQwDK1pMQ881H/MEAFCQOE5rXTPpH8l23CAMA84sdy9lDjo6s0ngu2pkDBXx6xJXPqvwBwU44Ve/Kaz628a4kiHLiDMxlRKIShJiFNzD90olqtIzdWUYf622N6w5D5CiEKu2iA5PZmlSvEww1igepqDAqV0+ipg7unOiq9u7sqGXnC5I3iujS8G/UWZCWT0R8eFHEiTcUiQzYpaLWK5tGLY7PxLPwjDlvkJK71ReC1AkMLEUgiM+WOXN2PIp4dWkKoKm2vn9B+AG/m7/jmgQHiyL5ysxSRTG99veA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR03MB5000.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(3480700007)(2906002)(186003)(316002)(786003)(508600001)(66476007)(66556008)(2616005)(44832011)(66946007)(4326008)(8936002)(86362001)(8676002)(83380400001)(53546011)(52116002)(31686004)(6512007)(6506007)(26005)(54906003)(6486002)(31696002)(110136005)(38350700002)(38100700002)(5660300002)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Q0x4RVkyZGFjMzI1dGJhMDRqZDhlSHdQWlZqcEJkZmorWUphSTJpMGdVOExG?=
 =?utf-8?B?amRaT3RBR1RFUlFGSk9FVDBlY0R2Rnp4NHVOdlJHdWp0RmY4MVc3RW1PWnpE?=
 =?utf-8?B?SmVzOUNQUWxWTm1kTXRpSXdLVHplNTdaMUlsWWR1QUgzblk0V1hqOXRYUWQy?=
 =?utf-8?B?MmZlb1NrbFhzckRsL1pDbUhzd3daTHE3UW9wWFRxclFJSjRIODhGYVNiWHVq?=
 =?utf-8?B?WkNpUXhleHZYMGZ2WHVaVi9MSUVibHVEeGNybmQrTUw3NUk3dHNyWWpsSkNN?=
 =?utf-8?B?TW9hUFR6RmpLVGhJdXdhTVhnQVVia0laTEFmU2xsUlkrbEtabDRKSENBdFcv?=
 =?utf-8?B?Mm12WkhHOElzeVN4TXdLVUUrMTV3QlpaaEdCYW82TXptMUc2MUpua2xtd2xt?=
 =?utf-8?B?QlhXZXROL3VUWENyMUN6UmdoOVlDYnJBL1NpWkNGY1pzZ1dlYm9BVnJIbkdY?=
 =?utf-8?B?dUpsU0lCMjBVNTU3aDJ5azdrditoeHFjYmxoTUtQbHJraDNsQXM2M0JGOFhD?=
 =?utf-8?B?WHo1WUhlTVY5ZHRhbTZZREMvZ2ltL2QyaUIzMS9ORUppMnhnNzBJSzZ5VjBs?=
 =?utf-8?B?QnlWckJ2MUhqdGhnZVdxQ2lSb2FwS0UzN1NsaXlBNWRreldJaDZmRmJRSEJk?=
 =?utf-8?B?K1NFS1pCOVRXUWRJQnNpUjNGa1ZmNmZ0WUVRYklzWDhlTlp3WnBoejhBK3FM?=
 =?utf-8?B?U3ZFMzNleUdta0hJZDZzQy9FeUZyK3Z5REVsdzlUZkpwUFBjR1IyL3IzQkpH?=
 =?utf-8?B?ODNmK05UT281WHBpQnpySE01bldOMGVHcGU1ZngzcnFIRFd5S1o2N1lQTUJX?=
 =?utf-8?B?ZDVIUytRRlIzNHN3UlZBbzJ5VFE4RGhDRUI3RnpWZ3UrdmJaNVg0L3JOd0dL?=
 =?utf-8?B?dUE2NHQ3NHZFTjRRU2hCb2dCSDVMd1VVcE9YT2Qxcmtlc0NsU0c5c2EralA2?=
 =?utf-8?B?M3NpSDZtRE1sVGFYL1hmTmMvblk2TW1qRUFTWFZNUTBwK01Bc09Yd3FiV3cz?=
 =?utf-8?B?bG5XNkFTanQvb0xmaG9kNndnazJNaGIyRVBTcTNzN1lTbXZDNjVMWUxkMm1t?=
 =?utf-8?B?OHRqOXdUME0wS2FMZmoyc1hFc2VRMlNVemxSdTZxdTdQWFlsdGRybkIwMWpS?=
 =?utf-8?B?VGk1T2Jid3ROVi8zWjk4ZFNMVkNUd1V3Sy9FOVd6UEZiSkpsOElDTU5qbk9l?=
 =?utf-8?B?Y3k3MVlFV3U5Q3NPb0tKUUlueFVETVlxVHcvaWdjcW9uV2VPS2NicjQwdWpH?=
 =?utf-8?B?Tyt2ZlZpc0ZrSU92Y1Q4TnN2QmpaWk9HQVBGOGR0NlBtRVEvYlRtRlFXUVlF?=
 =?utf-8?B?OUU1aE5sSFhLb2lWL1pHOGJ4M3NjL2dOS0R5VEVoaVVueDlUSml5M3ZkWTVF?=
 =?utf-8?B?V2U3T1RJS3oyZk53T2E5clBUZDUvUG9VbThDZUczMjdaenVmUGlmN1gzWEtO?=
 =?utf-8?B?T3hObkRUWFY5bXBqYnlYa2xlRFVGblc0RHJiQys5cHRxK1VubkVjckJPeVZY?=
 =?utf-8?B?WE83d3RtQVlXL3BadHZSMW5YMnlXbGh2aEhiSSs4U3VrcVFCOHNWQlREVXpH?=
 =?utf-8?B?cUhpc3YxMGg4NG5qTC9JOTFJOFBOdXZHVDNpdW82RkMrRmlNYU80cjd2dFNY?=
 =?utf-8?B?MGdySmlZVEtBekJJWlE0dTg1UnViTHdRUmd4TWVJa1QzZkpmVjdleWk1Tmp3?=
 =?utf-8?B?OGtNbmZId2FFdHhtZHV5SVdHWEo1bG5sTWowVXZncTRiUlJsd0FocGJHRjFW?=
 =?utf-8?B?OEY3UU45cjNnY2xWWmR2UzV3dHdOVys4Vnp0Q0xkSVlsdTVCTnEzclZPN3A4?=
 =?utf-8?B?QXcrbHpXWEM4Q0pCUU4xQm1QSVh3YWY1T203dGJ6UkxTVnpXUWVWcEZuY3Iv?=
 =?utf-8?B?QmVoaEVoZVpteEJwTGhnRnNNYWtqSEk4bzlnMWxZNTI2K2c0bGxTbHZGdWdY?=
 =?utf-8?B?aGVpaTJoeFBpMUNWNG4vb0xKL2kvNXJxZi90dzFTOWpreHBxYWcyY1NiTjJU?=
 =?utf-8?B?NE5LUG1wM1B6S3FmRytJSFg1dklPOVNRTGlXK2xnbHNFa3R1bXVaVXhWenIr?=
 =?utf-8?B?ZTdlN1R2K2s0TnJ3Y3N1ZW4vcUZsNlRtbUdCWk00dTl1a1JMKzltZWZGSWpm?=
 =?utf-8?B?OGl3MGxlWng5QTlWU2hNalJxYXJxNGpOOGxuUExicUZSWkhkVWFNZ2tUdWRZ?=
 =?utf-8?B?eTFrZ2NYSmVJWEFxSWxsVlEyOGx5aGJiVTNFeUFOR3VWM3E2WmgzN2hqMWxn?=
 =?utf-8?B?QTVIZFBndzhheE5RRCt6OUJibEFncC8ya0RVNDNvYjlzbmY0aS96Mk14S0Uv?=
 =?utf-8?B?ZjYvcHZVVXRxKzRsdjNEQ3lBbFNsMEdrMHZ5UEh1d2hLSUlSanZnUT09?=
X-OriginatorOrg: santannapisa.it
X-MS-Exchange-CrossTenant-Network-Message-Id: d3420b60-5407-4233-2f35-08da0054be33
X-MS-Exchange-CrossTenant-AuthSource: AM6PR03MB5000.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2022 16:08:39.5718
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d97360e3-138d-4b5f-956f-a646c364a01e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NQ7SGsJCTL33jig7P0u/r3Jte2z3/CnOpa8fGfY/Ur7KfUAhOFjlYT4ynvwuHIO4Sxi9ksEuv5XVILB+ylihS0exbwFum8Hi148+dUGm/PhJPOBF1sSNnZU4t05OYaQM
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR03MB4844

On 3/7/2022 3:56 PM, Jan Beulich wrote:
> On 07.03.2022 15:52, Roger Pau Monné wrote:
>> On Mon, Mar 07, 2022 at 03:20:22PM +0100, Andrea Stevanato wrote:
>>> On 3/7/2022 12:46 PM, Roger Pau Monné wrote:
>>>> On Mon, Mar 07, 2022 at 12:39:22PM +0100, Andrea Stevanato wrote:
>>>>> /local/domain/2 = ""   (n0,r2)
>>>>> /local/domain/2/vm = "/vm/f6dca20a-54bb-43af-9a62-67c55cb75708"   (n0,r2)
>>>>> /local/domain/2/name = "guest1"   (n0,r2)
>>>>> /local/domain/2/cpu = ""   (n0,r2)
>>>>> /local/domain/2/cpu/0 = ""   (n0,r2)
>>>>> /local/domain/2/cpu/0/availability = "online"   (n0,r2)
>>>>> /local/domain/2/cpu/1 = ""   (n0,r2)
>>>>> /local/domain/2/cpu/1/availability = "online"   (n0,r2)
>>>>> /local/domain/2/memory = ""   (n0,r2)
>>>>> /local/domain/2/memory/static-max = "1048576"   (n0,r2)
>>>>> /local/domain/2/memory/target = "1048577"   (n0,r2)
>>>>> /local/domain/2/memory/videoram = "-1"   (n0,r2)
>>>>> /local/domain/2/device = ""   (n0,r2)
>>>>> /local/domain/2/device/suspend = ""   (n0,r2)
>>>>> /local/domain/2/device/suspend/event-channel = ""   (n2)
>>>>> /local/domain/2/device/vif = ""   (n0,r2)
>>>>> /local/domain/2/device/vif/0 = ""   (n2,r1)
>>>>> /local/domain/2/device/vif/0/backend = "/local/domain/1/backend/vif/2/0"
>>>>> (n2,r1)
>>>>> /local/domain/2/device/vif/0/backend-id = "1"   (n2,r1)
>>>>> /local/domain/2/device/vif/0/state = "6"   (n2,r1)
>>>>> /local/domain/2/device/vif/0/handle = "0"   (n2,r1)
>>>>> /local/domain/2/device/vif/0/mac = "00:16:3e:07:df:91"   (n2,r1)
>>>>> /local/domain/2/device/vif/0/xdp-headroom = "0"   (n2,r1)
>>>>> /local/domain/2/control = ""   (n0,r2)
>>>>> /local/domain/2/control/shutdown = ""   (n2)
>>>>> /local/domain/2/control/feature-poweroff = "1"   (n2)
>>>>> /local/domain/2/control/feature-reboot = "1"   (n2)
>>>>> /local/domain/2/control/feature-suspend = ""   (n2)
>>>>> /local/domain/2/control/sysrq = ""   (n2)
>>>>> /local/domain/2/control/platform-feature-multiprocessor-suspend = "1"
>>>>> (n0,r2)
>>>>> /local/domain/2/control/platform-feature-xs_reset_watches = "1"   (n0,r2)
>>>>> /local/domain/2/data = ""   (n2)
>>>>> /local/domain/2/drivers = ""   (n2)
>>>>> /local/domain/2/feature = ""   (n2)
>>>>> /local/domain/2/attr = ""   (n2)
>>>>> /local/domain/2/error = ""   (n2)
>>>>> /local/domain/2/error/device = ""   (n2)
>>>>> /local/domain/2/error/device/vif = ""   (n2)
>>>>> /local/domain/2/error/device/vif/0 = ""   (n2)
>>>>> /local/domain/2/error/device/vif/0/error = "1 allocating event channel"
>>>>> (n2)
>>>>
>>>> That's the real error. Your guest netfront fails to allocate the event
>>>> channel. Do you get any messages in the guest dmesg after trying to
>>>> attach the network interface?
>>>
>>> Just these two lines:
>>>
>>> [  389.453390] vif vif-0: 1 allocating event channel
>>> [  389.804135] vif vif-0: 1 allocating event channel
>>
>> Are you perhaps using some kind flask/xsm policy different from the
>> defaults?
> 
> Or SILO mode.

It turns out that this was the problem. I changed it to FLASK, added
flask=late to the bootloader cmd and now it works fine (at least for
now).

> Jan

Forgive me for bothering you so much, as soon as I can I will update
the wiki with all the information that I have discovered!
Thank you all!

Cheers,
Andrea

