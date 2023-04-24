Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E058C6ECB29
	for <lists+xen-devel@lfdr.de>; Mon, 24 Apr 2023 13:18:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.525310.816426 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pquDG-0004TU-AT; Mon, 24 Apr 2023 11:18:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 525310.816426; Mon, 24 Apr 2023 11:18:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pquDG-0004RN-6n; Mon, 24 Apr 2023 11:18:30 +0000
Received: by outflank-mailman (input) for mailman id 525310;
 Mon, 24 Apr 2023 11:18:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0Hh8=AP=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pquDF-0004RH-5d
 for xen-devel@lists.xenproject.org; Mon, 24 Apr 2023 11:18:29 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on20608.outbound.protection.outlook.com
 [2a01:111:f400:7eaf::608])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bbdf6fba-e291-11ed-8611-37d641c3527e;
 Mon, 24 Apr 2023 13:18:27 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PAWPR04MB10031.eurprd04.prod.outlook.com (2603:10a6:102:38b::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.32; Mon, 24 Apr
 2023 11:18:24 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae%2]) with mapi id 15.20.6319.033; Mon, 24 Apr 2023
 11:18:24 +0000
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
X-Inumbo-ID: bbdf6fba-e291-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dOzgqmt9zarBT1KyFH0rtEGb8k71B3sxGZ9bEJJRCHMSh+i0Vp+ExHpEdk2XzRy2ghAtGJguXklCjacDET5PJKBaOT5M3ps312abTITS7Bz0vGhR++xKeQHNKIrZNE9YJK5uYSvyQQ8LOpn6k38fOfetF4XvkEumhn7EH7OJdbtxgQiDzqqkN14+8HQGISoR5SBlqxsnWq8jt5RJugylPDLMttu+J6TKYetEO+D1YYZH39+gftJ7oGVYLTGr1qmOUsMCmSXvcPGvxDbLQNaVBbk+anmH4BIxyMmuQWEDX7adsXWMSXBXXUw3UrOhBiIZDTmX46YvT6spK4g3nBV6Dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z9dKh8YrF6igLz27Jqrhx+ueGiA8Ku8+DNWjTADSGM0=;
 b=oBswKIVwggv1VdqlYLtj9AlBZDeh7hCjqKk2aFEQhcValC6yWJMym9RY2y2XG0Nxe92CNnzupr9V/rfQVuqyAbQ2wS7PK/07kV6wxBH5c09Pr3RBcxzQnrepQ2UPNXy14T083EOquP1KGujH7xdQusMrkPQDmoGRXuVIx32Mk449Mjcv1nWR/RDHGfdM3IollMDBKRf7LhjA8MiNJQRhjWOT9bvMDPItxytoATbfgSxqyx3tbQQ8urdhnsiy4pLl7JkSqN9yXw7C06wmaGxfaHl61MnngpdRTXnAINM6eHWEqOVd2uuCshgHlDGH2IfRbKWEBZA9s9wS8+vFqIR57g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z9dKh8YrF6igLz27Jqrhx+ueGiA8Ku8+DNWjTADSGM0=;
 b=wKm/OEtmnlolctOBi/Bq1foa73dJ1n2l8z6PVt5pibfcpmrSc/weBUvk6i9rKI793C8XAhHh8trpK1zIRmggFwVo8dB1zXCiQAjtzxge5oHETBpe6TVKrEDif+CF0DaUGn4b8fTUraQC9n74y1/iR1Sf4PJu6eMMlX/0arOCMgpz4+MOH/i+drJ+jedREocLZjjIaYPumifjl4g5eC8Ae2OZDa6AElJXatZi0Uuul7D+pLfuSe4uyTgxkrarwW2YS91i+4RW30q7uDLtJCG5DMRqn42gbaojqv6JQYyP06uyymnvxz9u3sn/0Qy3tMVJ5L92nNWAFuxC8EUmC1Q0cQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <63976a6a-f984-6c75-c3b7-34cd81eff33f@suse.com>
Date: Mon, 24 Apr 2023 13:18:22 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v3 03/17] xen/arm: implement node distance helpers for Arm
Content-Language: en-US
To: Henry Wang <Henry.Wang@arm.com>
Cc: Wei Chen <Wei.Chen@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20230420112521.3272732-1-Henry.Wang@arm.com>
 <20230420112521.3272732-4-Henry.Wang@arm.com>
 <ac54e04c-58b7-d0c9-2443-bb09258c8bc8@suse.com>
 <AS8PR08MB79912F294EDAC48F835FBB7A92609@AS8PR08MB7991.eurprd08.prod.outlook.com>
 <bdf33169-4e29-8c50-ff76-16d05df81a14@suse.com>
 <AS8PR08MB7991576C75D0D4482595E7E292669@AS8PR08MB7991.eurprd08.prod.outlook.com>
 <e06fc93f-293f-a873-c9b9-2d5c941168f9@suse.com>
 <GV2PR08MB8001D4A1EA5B854CA065B34992679@GV2PR08MB8001.eurprd08.prod.outlook.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <GV2PR08MB8001D4A1EA5B854CA065B34992679@GV2PR08MB8001.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0042.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:92::15) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PAWPR04MB10031:EE_
X-MS-Office365-Filtering-Correlation-Id: a72c13a7-0a80-463e-a5b8-08db44b59e76
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	LOw4QkrkKc+/F1zk7EJ/UYB/PdKTeYgqGhCNEOa/uwBIFSUoY8ZTtfjuaH1eFLN15BycNVqvW3KJKmcYv7740VkD3RRtiYYSv/SEv71jUvacao+t/jptZP1Yk+Pp6ZP4IklD6jv+oOJ3R41zOc4dFyWeF1lKn/iMSSqSP4qtZlVs20re65FOAKMtkXctGArJVyYtuo3tHLypWVYknDJbdI0t+gMRV1q40/nnHD9oFipMxPw0MA2g7yMe/kPJYE7gzCTvPmXgNdkQlJUPekcp9dygr7elypfngeowSYBNhDjYYLfaORbimFw8AB0H3Naye7ernjDuWiAlptwyFbq9443I8Ot1BdvoTrqGRsxOUI042o55k9uGIVHFmBeFfTPVnjF986/trLq6SzVQ2TmidTiPZVWL+Q9v2188q401AvEQSZA3UYWIHkaeKnA7I1Z3OiE6nqE41LJnltaCxv4VOdiAujSQWh15MvQ+GDRqQG07WY+t0b9odhfBAdEcWlWa8ROzRwF8uk5QdDxTJbNY/+V7y4Gd3+rvo9Ruk6Zj3880aY4/wKbu6cpvRchZJgWY4hcVzs/qVobJOmz52o2JmtQQlfsjYZqTjS675lJ3rZ6eoypbRFgPmzune9iSUO0WcHCovB0RUN4ID0CZwNESlg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(366004)(346002)(39860400002)(136003)(396003)(451199021)(54906003)(6486002)(2616005)(83380400001)(6506007)(53546011)(36756003)(6512007)(26005)(186003)(478600001)(8936002)(8676002)(41300700001)(6916009)(66946007)(66476007)(66556008)(4326008)(316002)(2906002)(86362001)(31696002)(31686004)(7416002)(5660300002)(38100700002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TXVNTUpzaEZNYXc4TXF1L1hvWFkrRm5zR0dwbWcyMXU2YmczNEc4b0psRkNT?=
 =?utf-8?B?cGZjZmkrVzQ4ZDZGZUxhTHFqc0JsKzJUNFZHWmp5UG9XYVJhNWhCZGEwM2RT?=
 =?utf-8?B?NlFBcmNvckV3ZHdhVnkxemRZWHhRSVdhajQ3ZHAwWEZHN0pVbGJ0eVlvTWRa?=
 =?utf-8?B?bkp6OXh5MTlhbGE2R0tyZ1hXQ0lHeU9DQWNSZC9XWnFteWxzOTdQbUk1a09s?=
 =?utf-8?B?UkcvNmtsYmNzbXZ2SGU0MUVHamE0RnhMbTJoQ0NwcUxJWFc4bElKVVdKd0Y3?=
 =?utf-8?B?SE5lY1VtZ1lUQ1lWak9zdDRqR3c0WXBLN1lmdm9Zcy9ldURoN2pDNGhPTXZN?=
 =?utf-8?B?VVFYbEY1NzJhUjZ2SjYxRVNjamF0Qmc3OGNrUkNzVWtDbjlZN2szdnJIREdP?=
 =?utf-8?B?QSswMTlVcHFhUDQ1bjdRSzM3VHlaVElHWlp2dDVkclV0TTRWck9DSWxleWtL?=
 =?utf-8?B?VVR0aEkydUJNOXFpVkhVdjBYcUpqQ2JPR1ptb01PRXk2VXpHalliWEpUOG5l?=
 =?utf-8?B?MURkV0FtSSt5QXVGOVlsUmZ2elRUOU93REluQ1crRS9IOFZBV0owM204ZFBv?=
 =?utf-8?B?UkwzVWpuVkNPMWxvL2Z3SS9BNzVTM2ZaWHFseG9FL0ZsUU11ZWkvN1NtbWRU?=
 =?utf-8?B?RWI1dmJodThaclVpNFNta0tTd0QxLzJaWVRlRU8wZzN4UXNLQ1AweGQ4U0dN?=
 =?utf-8?B?T0NHaGEwamJzSHMwQjQxRDMvaFpmVG5jb05XMUxISGhub3pYSjUzMWpKREow?=
 =?utf-8?B?Y1R5cm9VZXNreUk0aXptblJ0TnlFS3ZTdXJDQ1h2WGVpSmtsaDh1cEpsRUpT?=
 =?utf-8?B?MkphTUl2Q2xMRGp6bExLTjcwMzJsSitkT1MvOUEweXdDTWN3TjR2d2JGWTZC?=
 =?utf-8?B?dm1MZ00xelpVRVlZd2xrYTJsNWFmbmRHb2IvRXV0SG10WDloWDV5SC9ONkdN?=
 =?utf-8?B?QXppODkwL3dOd2ZoTktGNlhPa0MzNERibURya1RFRHN4WGgxUUZZQ3FlV21Q?=
 =?utf-8?B?M1k3ZERaekhkcDhGeFN1OXlTZlgyT0srTmdwLzNUckVTTG5MblVqOXFMRGdC?=
 =?utf-8?B?enQ3eTJMQXRESElhM0pRNkhvR0xSNWMrd09zdTZDclFiTGJrZXJJRTVaLzU0?=
 =?utf-8?B?Rkd6c01Uamh3YjlrMjViOFpMU2R6b2JjV0IremNEazZGbU5QdFFIcmJxL0wr?=
 =?utf-8?B?bEw4UXlPbUg4d2Q1K3RFS0Q0Uk8vdmYxWlpKVHMwYXEyOVdmV3NlRFpYcWp1?=
 =?utf-8?B?Snc1cmI5ZldmOHZjWnVwL0NFd3VCdjlkd0JXd3N0blpwbVhEUzE3S0NqaFA4?=
 =?utf-8?B?TEVIZDFIVzFPbzJYblM4WmRZd2ZQV3hUTWRLU0FlcUJjYzhVdUJoUUpTaGcr?=
 =?utf-8?B?Q3IvdVRpWXB1UHVwS0lucFhHSlRSc3lXc1ZOd1dtWGhyVEY2bUhjWGx0REFx?=
 =?utf-8?B?NlZ1SUlneVNGYmM0NXJybW43TUJGd1U5UithVXNSV2MwM3Z5d0U4RTE2UlV5?=
 =?utf-8?B?OTZ5YU14N3prN21aY1o4NjloY1dSSjRJNkZqMlcvQ2xxTEt0SHJCMU5pZnN3?=
 =?utf-8?B?ejFONlh2ZjlBNFVNcXhqN2tuSm1UUHJuS05wNWZRYytyV3p1OXZnTnpYZUxQ?=
 =?utf-8?B?MElGWnhnKzJBdUZxTWtPbjljOWpQUDRmM2hrNm5rZG4vUUFmQWliem16eTUy?=
 =?utf-8?B?S3JDeU0yUit5QUlrTnJYdzQweTVNK3dYT3lkM1JadlVDRm5LM2RsZnoyZkxo?=
 =?utf-8?B?UnJtTXJYU1MyR3VkL2ZGYVEvQXkzV2JmRVIyTDZydGNNaDlpVG55VDR1UXR0?=
 =?utf-8?B?YUk1TTlwaXhqSm54ZUlSNmE2WHppaWhBSmNIdXVLVlZ1b3RSSDBKTUxHdjNR?=
 =?utf-8?B?dUJZQkpRSlUwRnc2b25QQnlicTl2T0RDMndjNFFpa1FrVDRMc1RrVU96MWN3?=
 =?utf-8?B?ZjJwdWVCTSt6VlJTUTUyeW9mOUJOdEdrdmNIQUZueEJ4bjliM29JZjFXNTRV?=
 =?utf-8?B?OEZlQ2V5TllETjlzbmw2cEZqR0grWGlkdVZvV2JJSG9UTitra1BLRVlBdUIy?=
 =?utf-8?B?RWtpZFB0Qnp1RUhIa3lkN2Z6a2lUN3E5Z2Vja1YwbzZudjJOQ0t4Q1g2cFRq?=
 =?utf-8?Q?J7Uc7irpKarXPlTBapXzYG4A5?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a72c13a7-0a80-463e-a5b8-08db44b59e76
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2023 11:18:24.3032
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Qmg4cfTyEEw3JXP5ing9sn8DuRzOPT/aevIPrO2Tg2Efn/aliEMjnrohZasAjCBrNYKD+aO9O7I0TgTHgHDLYQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR04MB10031

On 24.04.2023 13:02, Henry Wang wrote:
>> -----Original Message-----
>> From: Jan Beulich <jbeulich@suse.com>
>>
>> On 23.04.2023 07:36, Henry Wang wrote:
>>>> -----Original Message-----
>>>> From: Jan Beulich <jbeulich@suse.com>
>>>>>> However, looking at the code below, don't you mean to have the array
>>>>>> pre-set to all NUMA_NO_DISTANCE?
>>>>>
>>>>> ...I am a bit puzzled about why pre-setting the array to all
>>>>> NUMA_NO_DISTANCE matters here, as I think the node distance map will
>>>>> be populated when parsing the device tree anyway no matter what their
>>>>> initial values.
>>>>
>>>> From this patch alone it doesn't become clear whether indeed all array
>>>> slots (and not just ones for valid nodes) would be populated. I think
>>>> the code in the patch here would better not make itself dependent on
>>>> behavior of code added subsequently (which may change; recall that a
>>>> series may be committed in pieces).
>>>
>>> Correct, I agree. I added a numa_init_distance() function (in patch #12) to
>>> set all values to NUMA_NO_DISTANCE. The numa_init_distance() will be
>>> called in the beginning of numa_init().
>>
>> Why do you need a function for this? As said, this array can be pre-set at
>> compile time (unless I'm overlooking something).
> 
> Sorry I overlooked this comment, correct me if I am wrong, but IIUC we
> can only pre-set the 2D array to 0 at the compile time. Could you please
> elaborate a bit more about the code in your mind? Thanks!

static unsigned char __ro_after_init
node_distance_map[MAX_NUMNODES][MAX_NUMNODES] = {
    [0 ... MAX_NUMNODES - 1] = { [0 ... MAX_NUMNODES - 1] = NUMA_NO_DISTANCE }
};

or even (limiting redundancy a little)

static unsigned char __ro_after_init
node_distance_map[][MAX_NUMNODES] = {
    [0 ... MAX_NUMNODES - 1] = { [0 ... MAX_NUMNODES - 1] = NUMA_NO_DISTANCE }
};

Jan

