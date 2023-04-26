Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CF15A6EF03A
	for <lists+xen-devel@lfdr.de>; Wed, 26 Apr 2023 10:29:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.526567.818406 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1praW6-0006DR-HJ; Wed, 26 Apr 2023 08:28:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 526567.818406; Wed, 26 Apr 2023 08:28:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1praW6-0006B0-EZ; Wed, 26 Apr 2023 08:28:46 +0000
Received: by outflank-mailman (input) for mailman id 526567;
 Wed, 26 Apr 2023 08:28:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dTkW=AR=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1praW4-0006Au-Pl
 for xen-devel@lists.xenproject.org; Wed, 26 Apr 2023 08:28:44 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on2062c.outbound.protection.outlook.com
 [2a01:111:f400:fe13::62c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5a11eebe-e40c-11ed-8611-37d641c3527e;
 Wed, 26 Apr 2023 10:28:42 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB9PR04MB9308.eurprd04.prod.outlook.com (2603:10a6:10:36c::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.34; Wed, 26 Apr
 2023 08:28:40 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae%2]) with mapi id 15.20.6319.033; Wed, 26 Apr 2023
 08:28:40 +0000
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
X-Inumbo-ID: 5a11eebe-e40c-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Kp06BwQD5taHwt4kdGt27XsSd0ozuP+FGwh9ouWtiBuqQaL92HKEu7vn8eMRTFdsAQmnTIv9rd4mAcZaR1o4NUKqyPmKLHaU2xvBtmtGngcHfECWFEgWC8FemdM9I+1AKKo5Wc4uzYkkWUHA/F6t85YDGG3O1h6q62KdLumvfFJnLO1x+FHFPaMVcyx4U1jEWHV53HcMLad3k+7h9MEQnA2T3z81GH+SOJjmOxzQ1yHY8hUMtpwYmX00i3i9mzd4jus+2+K1G+hRj15YUB41i+lKztMf/8H8Gjp0CpxcCnodPGa3xs7Jij0LNqDJywFvWwl8QZIHiSW1H9IUw84VwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LXmGxvmAdzkpAAMX6LCCjraR1Hfm7l7ALV3nAUsJmGM=;
 b=XW+AV9m8D5afuGdXEq0nhFuXdeacydj+YQnKJptBrjDODyXIKlRfhtrhomWONI2Y6hmFXDsE7AClq0oHwO5zcARuJf/Hy0CTh52NL6j/W3VywkqK0k0qVHwq+9cHFvsVoLv+ALjzILOw5yeKdMvzTIZ5n5ONRZ4MJrdfPqBqiOhTzJq2VCx51cNy0XQSjpdEi50vreyS6J3w7cyAPbYzGD6nXwfPbC62axnz5P1lkAynML89YjgE0LfnJm64Suk65izyhIW0bmr+L0zfJvKB+HvjzHcazJOmuyplKucpFPjFbUPV6f880YUn9wdxBSTOmHH1ZmbY2NSeHq+3ReSkww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LXmGxvmAdzkpAAMX6LCCjraR1Hfm7l7ALV3nAUsJmGM=;
 b=G1FWLBUMLIDValv0CdpMiWb0RM8d2Jsv4nZ7h6PFgCrt96SedlYt0Vkf0ge/kN2Ab8v8x3Dy++ZUfjCGIFOK6Hus1OqF/WG9qyLW3agr8oCVHIAKnBfRsbRm5qST53px75MGC+K4zU3VXB+ZppGs+4v6rWIjT3cQiNpYMUkGQNNWTD1sUBLLxRTHMGcvn1mk2tg3iHEIf/Erdd59+F0fPDQogtLMdatQDHnIXP1rV6lIJdJ0DTlzci99letVYxN1aOnwIQA0+gygXZcakJofHjKLVl4mNM5Qo107HyzAwWyzUNgXIgq0bondz1gSgAgE1H8v3E6KegYvrHWHbAfFoQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <650a7f6e-be82-0312-05f2-bb69e51e828d@suse.com>
Date: Wed, 26 Apr 2023 10:28:38 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH] Fix install.sh for systemd
Content-Language: en-US
To: Olaf Hering <olaf@aepfle.de>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>,
 Jason Andryuk <jandryuk@gmail.com>
References: <20230425194622.114869-1-jandryuk@gmail.com>
 <20230426091533.68324d8d.olaf@aepfle.de>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230426091533.68324d8d.olaf@aepfle.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0207.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a5::12) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DB9PR04MB9308:EE_
X-MS-Office365-Filtering-Correlation-Id: 8cf33ddc-1dfa-42e2-7dec-08db46303ced
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	aKZm/NdpBgU43+OXGhn6bzAMgIaL4yPdVnkqJhtVFvuAnhRthMYXDpUpEWhu8neCQicZk9gjZNjeV3cuRlcv/segrBW/94IWEhN7MrZlkdN4cNlBJK2vQyKcP+HtTazwpOMNytPcGI6RiaN4rMn251R7SMGiFZibpkYbCD340+Gg53fU0ATcotJbv3wcD4I7pbrKqt34HCi1qbyQR+ZNCv/GWQRLjEBblAs2J9YWDTDfgkZz28a2NWNjbT3N+Oi5hKI3wDL1EX1qpC/OW605WXHmpB/zVSQEj7+809zEtPZHJv0mBgqJecanptQX7t4dl21rAmsfcM2Q+2DHcTusUNnn9czwZiOKn2h2+shYAxtYlOLq5snBQA68Y7wiItk+zUKiB61xH/B8Qle20Q8ZXnf9Xwt4H47Z7A9LYSmyLUkq3rJPD/xkUxHhksDV6B3zVyT+RhRLtv7VmM72Gz80OwkaT8w8U7YD92ZNkdsgxUvZPrNG9lT6GNKk8ITYQlGMtyw1SX4a6CYBQvFPTmSVMt0aIXqUlkYNNbqyCm9OeCfTtBoezvdE1o8tHQM2IWX5kMblT+u5KL/H8BdQkvi6nFeHaeJ/V+cOCqh8vVT1yNfkcnZCjVzJB6+np4dLZp4n1ud9VQH81FK0cZuvYCk2lg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(366004)(136003)(396003)(376002)(346002)(451199021)(31686004)(36756003)(5660300002)(8676002)(316002)(8936002)(4744005)(38100700002)(66946007)(31696002)(41300700001)(86362001)(66476007)(66556008)(4326008)(2906002)(6916009)(186003)(53546011)(6506007)(54906003)(26005)(6512007)(478600001)(6486002)(2616005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?T0ZXZnBQWWdwWUliWEdIdmFpWFcrWk1QeTVLWUplaVQwZ0RnUTUzaVNjL2NB?=
 =?utf-8?B?MDNrc0J0REN4djNZeUs2SjQyK3NuTlE4NnNlRDF3Y2V0dWNuczM3K2x0WTlJ?=
 =?utf-8?B?U2lCcXduLzl6RUo3TWVKQ1EvWDIvbi9HNmdBL3BnZmtHMnRpR3JUaGpoYk1V?=
 =?utf-8?B?ZzgrcldNY09oemJHY043UURsWk9wQ0RkV2RSYllMMElHbU8rTzc1SWxITGRX?=
 =?utf-8?B?cTNPK2FqbU1zeHVsRi9jZVc1VTZZV0dGTUNmaGdxVk1BT0ZDa2owQTlUWFda?=
 =?utf-8?B?OWdaaElWckw1QTY3RWpRcDh3bCthL29kSTNNdzZDdVc1RVdQU25OOVVjRlQ4?=
 =?utf-8?B?akFzcndWOXZNaFd5Vk9vN2VlT0NGeGsxY2RNRXFsRVdXWDlyeEV2L0JCYS9P?=
 =?utf-8?B?cFA0RmppR1ZJRTdWOW4wSnZlWEYyNjZibm94SS82RE1LRlRBZmpib3N2STNv?=
 =?utf-8?B?NVorRjBoK3V1RS9oQlZINlZYYUJyR1NkdUJuZnF6VUJNenhEekUxVTZXUHhX?=
 =?utf-8?B?eTlDNXhiS25PTHI3V1dpWVFKSkd3Rk5raWpZOVk1S3Z5dEVTMHlrcFp4N2JK?=
 =?utf-8?B?RWhsZStoUSt4NldLTTNuY290azVjb01qSWM0TksvejdSS1Ziakg1MThWb0FQ?=
 =?utf-8?B?MHRsZ0tPMVdQMXBxcVFJYTJoUVYvZHY2aTFnSzFBdUVYWXp1QkpLa1Y3NGZs?=
 =?utf-8?B?M2VHRFUvbmZIL3dwamZteElWTXkzMWxHdmd5NUZuOXhOVXZ1UmIyY3U0QWxT?=
 =?utf-8?B?UmI5eEpxdk04NGNGU2ZJT3F5d1dWZDJsRzNHNlZ1WFhvZElxNXoyR1FscDUz?=
 =?utf-8?B?STZLSlh3MkNnY2ZCdndYYmJxeTAwemZMV0hPK3NuUDBZQ0cwLzRmWGZhMU53?=
 =?utf-8?B?cVFUeG10OGw1cmtmaDhBd0FwUnNTMGp3dll0OWRXOUpuSWRkVEM4SmV0NWtl?=
 =?utf-8?B?WWVScE0xak93NUxKV0FtalVaK0RuQ3dVNi9CTk1CMGJnY1A0TldzeWJHWkhx?=
 =?utf-8?B?aWNVaFJnUzcxWW9mNVhpRXk3KzM2bnRkU3hnTG1GK0dHQ0toUjBqT0V4VmxY?=
 =?utf-8?B?c3ZIYnpLdlczVlhZYkFTbHJuTXhoMWhuN0JZdjRiVDh1bk9KU1ZhU0xTZWRO?=
 =?utf-8?B?eXk0Q256V0tYaGpUdFQvcUd0anZINHFnZzhPeTFOTmlDbDlYZ2UrNlo3UndB?=
 =?utf-8?B?NlBzb1pLV0xsZzRTS1NIQVpZK0xKeW54RmRUMkQ5ZGJOR3BReXpud2U2NCtQ?=
 =?utf-8?B?c0VDNmVudG9NOENzTExiT0VVc3IvREhPQlllcHh0UWhmdmdXWW9UeWxieE1B?=
 =?utf-8?B?QTJVeEJXVnQrSjFMZk9sMFBUenJUbGlndUhoK0l6LzVpWnV4UlhrbHJ3d0hX?=
 =?utf-8?B?Mkh2NjAxZGpwS0hCOEplcVdWd1NBU1ZRSUlzTDhXa2crRjlWbzdyd05Ob01z?=
 =?utf-8?B?SUdxSGRkMUZkUTczWkdBaVk5a1FhMkJsZi9nSERQWVh1RGJQbUVmeDh1ak9Z?=
 =?utf-8?B?SmtXK29GcEJvWkp3Q0RQYzd1UDhUd2dTRC85NzRvdmR4MTNsMXBZUzgrYWZD?=
 =?utf-8?B?Zm1iMU9Qd0wvUGt4Qk9TRU5tZWZOZk9KRWRCa3NJTGtCb0hIM0o5VDJNR3Bj?=
 =?utf-8?B?SVhybVpSYmE5N0hHYzZsdkdRbmpFY1RFZkJDNkYvM1J6V2JHZURtVUdQaC9O?=
 =?utf-8?B?Qm0wcU9XODdLT1NkSlVnSFVkRlFQdTk3cUVxSSsxYUJ3OXQrNHd4KzczYU9o?=
 =?utf-8?B?OXVNV21reWszY3l1ZUVJT2NmMHhpNnRtaDFtT2R4L1RTU3B5Qkl1ZGVJRXF1?=
 =?utf-8?B?L25TUkRkYWh2OVRsZUE0WGcweTdobTN4aDFJZk55aEw0a1M4S1VLV1RPL1pG?=
 =?utf-8?B?YWZwUE5JMmptbnBzZlBVcXV1d1YxWThiVVZvZTErOXpydG84QWwyN1R1ekht?=
 =?utf-8?B?MVdSVFVVMW14V0xnSFMvTkwvTGlEdUZMaGF0L0FhL0RoWWRXWm5NZzJmYXRZ?=
 =?utf-8?B?bHdPZmpCSXdqQ2Q2YXRnWGZRQjZCelppQzBiTFRxS0ZvdlQ2ci91L2lqQitK?=
 =?utf-8?B?ZnZpMDlvUFF6WlBwcDhjeWxENC9LeEZIWEhDcmVncDUxMmV5NmROSXBWWCtI?=
 =?utf-8?Q?8Ysjl0J2yze8QuYkNlBpleyq+?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8cf33ddc-1dfa-42e2-7dec-08db46303ced
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2023 08:28:39.9781
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: N6OTc2qgv9/8pVVs91tKgXmYFVzWpkaTuCtqgaG8tb3q57eNkl102D9Na5kchB5dV35qKRJ7ywlxu6veYOMbGQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9308

On 26.04.2023 09:15, Olaf Hering wrote:
> Tue, 25 Apr 2023 15:46:20 -0400 Jason Andryuk <jandryuk@gmail.com>:
> 
>> Skip populating /var/run/xen when systemd is being used.
> 
> It was wrong to do it like that from day one.
> Such directory has to be populated on demand at runtime.

Is this to be translated to Reviewed-by: <you>?

Jan

