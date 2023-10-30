Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C2B8D7DBE01
	for <lists+xen-devel@lfdr.de>; Mon, 30 Oct 2023 17:35:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.625310.974503 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qxVE4-0001an-OT; Mon, 30 Oct 2023 16:34:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 625310.974503; Mon, 30 Oct 2023 16:34:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qxVE4-0001Y3-Ky; Mon, 30 Oct 2023 16:34:52 +0000
Received: by outflank-mailman (input) for mailman id 625310;
 Mon, 30 Oct 2023 16:34:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Hhfi=GM=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qxVE3-0001Tj-Ut
 for xen-devel@lists.xenproject.org; Mon, 30 Oct 2023 16:34:51 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on20603.outbound.protection.outlook.com
 [2a01:111:f400:7eaf::603])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3ec2ce92-7742-11ee-9b0e-b553b5be7939;
 Mon, 30 Oct 2023 17:34:50 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AM9PR04MB8193.eurprd04.prod.outlook.com (2603:10a6:20b:3ea::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.14; Mon, 30 Oct
 2023 16:34:47 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d924:b650:a2ad:7b25]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d924:b650:a2ad:7b25%3]) with mapi id 15.20.6954.016; Mon, 30 Oct 2023
 16:34:47 +0000
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
X-Inumbo-ID: 3ec2ce92-7742-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ba24XC6svDCLnVWEJy08p/IC1xmgokJej8whPjuOb/XWJxJYX+QeEu/uGFsUVhFbEQNgUkazWyHEQ0pQYaT5DKM8oOybWiFE1iRtM5Z3KwOGavOX4kArAgIVZFcZFtoD5V5xLbNDOC4dosoA8AwklP4F43pMXcVGQR8UuuJ8dUp32x2+FfNTPw2xEV6iDK0cVYasuGV8Y1rFiWs7XocLDxbBsFCER//J/HrMfrPpW2k5NI/USTOnmBlrWfURn80SsspfINn2H/QK7c4WOGxXE/UXNzzPEi9Po88dA7Ek2opLJyL1xG/rsUAt6try+F3Zkp0TSOkBG/Q2G6kb7Ysp4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sQg8h0NKIXYmbrbgWzJEBlL60OwNyl7e/y8fpoDn7f4=;
 b=n9MmZU7aeiu8Dob140SKUAOer8X3Ypy14qzg+h4vVip/raRH2Xk0oulvjTpn5FEfeHF4+lqkRDxB/PnF0TYqb6pSzEQa7mHwEd7aWXmopANH4ZS2f3B3DP1DHLfYuMG8qeXStTQew7OkmnBT7h+T8efI4aRrghLu7BaepdfMj6J1jUqI9RktnNUf9S6X+ZHb2nFlS8D/we9xjTJsrYw6yrEebeRwyVq+7uR84EX68ce42s6TSn0qmtR+/Hjufgik42gDwDmlogLN3k06jqawLl94ToL70T/yCGUp3HTFROBfJcV5szcIwmXq4AykvzvW9gxPOPzahI4tQ8yTS9gDjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sQg8h0NKIXYmbrbgWzJEBlL60OwNyl7e/y8fpoDn7f4=;
 b=3NDAjZ08WZbZi/DMHZVkEh4eihXHoqsiCkQ2Ddj+4Ftib/LHrnh4cuQosNIk5RDu2Nmpkt7C5dQ3mKOCXV3H/icGCQvi8EZNAr2S+3i0scb4jn8qojUSKxtfB0H5bpXtGbDaVlxCNbK9QfS16hO9S4mPgkRz1O8WD5jRAJMawnTa8UrETF9XNoz+dIbldXgMpzwjgKChejZcJE06vIGbvX1RDVYJc5Gt76J3qdT134hwHot9aM5MOKegl+1rrcCGvxF1QQIROqem4XXUZVkiWTgSLqlwrOeMRvNJA0ok5WmXy1/OFJmJTtC1ISoh8Vyx3ttm10F5rrQDFmQDpIiEsw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <db4eac3c-3ecf-d376-0a22-6cdcf6616f73@suse.com>
Date: Mon, 30 Oct 2023 17:34:48 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH] x86/x2apic: introduce a mixed physical/cluster mode
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20231024135150.49232-1-roger.pau@citrix.com>
 <6734e477-0aa5-c74c-4f64-02ca0415ae9e@suse.com> <ZT_VguxJLtOQeYK1@macbook>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <ZT_VguxJLtOQeYK1@macbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0185.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a4::18) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AM9PR04MB8193:EE_
X-MS-Office365-Filtering-Correlation-Id: 888f2d7b-fe9e-4d85-803d-08dbd9662178
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	zIekqVYtGYZXvf2JZX0aML3EPIONgFDJC7NkEY8FLKIlXT25odGB+tPxPsQVB40EWAzIpdGduWWTvCThuGg1I+3BrVdA7jrZWqLpYfCxpaYwGBAk4Vqr2zNF9Q8gJkrtHub9jldqR+lbLmsP9DojmBtUmz11b/y8Xa/PY7WEESnNcFzsZerjOXdEO26h22n3iYQBaO9dSCiAIzfpiIfjuqiZpaNXhBh4KCCD1i4w/hYnVTHCvAsCd7QI5Wu/M4NIC9D+Q9yqkFWoFBxVh/kRrFN15IYOyRG5XwVxB6xanO07aYlsCUUcnxYYY+7pDDpvocwaURssBjMY+86SXMPUHftuoE6WG4p0+A8YPm0KCgXhKKfnS4ourXtzYpqgnEHsaeyr6EmYhJ28SJFB8cDgt/FakGcuneRD70D26jArmoBa+CgN/dKWUwqs5glqICkHHzNL4Wd8DNjRg8EBAeBwCBWT8JXonxXYOnsOuTI/OcddeB84aYAPhqSw36HDlGPFqjT3XsATiXMJwC1k/gqqTMQdWEswNojmx/lDJ44vnkE5TIr/lW7eqUE9ifwRmGJZFsKC3lFM+pCf+D7RWBoKx9EhnUb7I9qptNCWPgD1KMKDBgYIaMva5Dl4Cj2hHZHYuSWq7DElAWGIUrfLYoAsygbCQSG4uAxy0sQzojxQIcZTGCbeWW1IXjIzbsn3uZBH
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(39860400002)(366004)(346002)(376002)(396003)(230273577357003)(230173577357003)(230922051799003)(451199024)(64100799003)(1800799009)(186009)(4326008)(8936002)(41300700001)(8676002)(2906002)(5660300002)(36756003)(53546011)(6506007)(6512007)(83380400001)(2616005)(38100700002)(66946007)(86362001)(31686004)(316002)(66556008)(26005)(31696002)(6486002)(6916009)(66476007)(54906003)(478600001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QUpYOEtFNWRCOE51bk9PUDFSd2MwOEYxaitGWC9DMG50NVRBNDBxMFZaYVRO?=
 =?utf-8?B?SGphSUMyMHhPaEtEMGhsMW9HMkNvUklIY1NSUmFPNFN2WkRpZUJCSWlBcnlW?=
 =?utf-8?B?QWxQaU9MMXljdFV0NlpvdFQ5L1ZNY2pWbVQweCsvaG5lUk5Mc091eHpEaHp5?=
 =?utf-8?B?b1lBNE9IQ1I1NHhqVkpZdmw2MmtHaGxTcFRDWDk2TCtKSkNCTXhxTk1BQmJy?=
 =?utf-8?B?ZXZNbXhGVFR2NCtkYUIrNDZNOFFweEhwdHV2UzM4R3RrN3BETS9UbERIaWdz?=
 =?utf-8?B?SDRJZmJwV2JzeUJjZTc4U08rVE1UMk1LK29uNSt6OGVaSStaNEkzSDE3dFRG?=
 =?utf-8?B?UUZ5aWZzMldNRkxMblJEcGVjVTNzSFljUU0waTF6YjBJL1V2U1dLc3Y0OVZv?=
 =?utf-8?B?cldSSis0R3ZTQnpVZGFaM2hFSnFKQVpqLzRHNGdCVzVOVjNqL2RqNkpYOFJC?=
 =?utf-8?B?TEtDeFJ6T0VqREtneUVlMFZWUWFIbGZRVGNwaTk1TGNrcmRHZzlub3pNelE4?=
 =?utf-8?B?T1A2S3I5ZVlnTzlQK0dnRXlzQ1B0ZU9BTHRFS05lQy9JS1BSUHdhUUlseTV1?=
 =?utf-8?B?bXVuN0RKcVpzRlZWaXU4dWhZZW9WR1FrRkd5dHFsR2xFV3dFNXhlS1oxT3NL?=
 =?utf-8?B?M3JHS1pTNXp5b1hIa3g4aFJIc0JoN1RxaUVVdkk1Y0JXNFJYNmg0Y1YyOGdB?=
 =?utf-8?B?STAxTDlZN2JhVjByaGZ6MzJWckpKU09ZZ2wrdW55ZlpoRXgzbDFIRzhzdC9Z?=
 =?utf-8?B?cFE1K0hDaDV6QWthbFZwUjl6ejFLQjJuTjNqdER6cnBvYzQxZzl6TWM3bnRr?=
 =?utf-8?B?TDVqc2FJM0x0emNpMGVibEVHdzRyVVhaMzRsY3dWVmJkZ2tSdDVFamZ5WEVh?=
 =?utf-8?B?MzVSUytyc0J6V3RWckpZcHFheXRNNTZrbXptQ2JUcGhBcTN4Q1ZyYzVpWnYz?=
 =?utf-8?B?T1g2aW1jdmM2MlV0VHdKNDlQV0RDU0trK1cvZVNzQjdXdlNkbzR3d1I5eEdN?=
 =?utf-8?B?YUlKVUMyNGc4UHp4eDNEYTR6N1RZNFZOSFd2OGdJRVV4ZXo3UkdaN3NHaE9o?=
 =?utf-8?B?YVVTSHQ3dlRUZUNIZXdUZ0c0VXh5RjYvRnNCSEZJWXBweDBSOXlaZ2YxZ0hI?=
 =?utf-8?B?dWs1c3hpTTBTY09HT3d1YmpEVTUva0Z5MnpsQk1hb1Z2OWZLSkpUdXdpelAy?=
 =?utf-8?B?U05EQjBVRzRwajBmWUZqeTAyZnNBVUNMRWZtNzRyU3BLU3FPZmRCaU9wMk5W?=
 =?utf-8?B?WVhwN0tER1NEdGxFRUloSk9sSWpCZit6UlovNkIzdktNTmRtcTM3dVhoR3Z0?=
 =?utf-8?B?TXhyRXV1Rll6ZXpTSjNxYWdoL2crYmJqU0tOd1ZiOFJxRFVtdjVvRlFKMGdE?=
 =?utf-8?B?UlRPRnVONXlLT0N2NGJ3azFXenJzU0hQK1FtNlRBV2FQMjVhdVU0RE5aT2FB?=
 =?utf-8?B?U0RwYWhGckp6eVlkQnpZZVhzc0lXNkQ1Y0dHVEF6T2VxYTA1aHFMZUtNMFlo?=
 =?utf-8?B?dFB6K0J0L0YrMG01eDAwMW1yQXFualh6OEd0dUcyZnhtTEQ1a1IzRnlSRE5E?=
 =?utf-8?B?VVN3TTNIcTF0cWllbE81dUl1bFI1NUtzUGpBdDI0V2I5Ni9pRTA4R3IwY2tU?=
 =?utf-8?B?Q2szT0xtWGhIcjVLU04zMVFaSTdWUVIyUVlIK2VnbmVRM2Jjemw4M09mM2xn?=
 =?utf-8?B?ckl2Q3pXN0poRW42TTJXTWZINUZkd3A4QkI0NXJNMms5WjVlcTc5eXpTanhG?=
 =?utf-8?B?N1VkeTMyaWNZb2R2NFVGK0U1OGdiLzVyakQwbnc5TC9vN0ZwMU5IRm1RNXdl?=
 =?utf-8?B?Vms0Ry9yWDBTbG1ob1ZBUllLbWtRVGo0aDY4a3pYdXdtRjlhbVExdnRybGQ1?=
 =?utf-8?B?RkhudFVFeXdmYXpYRWo3blFhL3JCdmg5NDJJam9PRTRtVy93SjIwZlBBbkFq?=
 =?utf-8?B?RUV4NS9xalFSdnhCTkE1VWlKVVVpMlZCTzNmdU5lYUY3QkxkTVpnaFpVQW1K?=
 =?utf-8?B?TU9kOGxSaVlCVndndjlPMEltUzdubkQwelYzSEFpM3I0SVBsUkZhQmFMaWQ2?=
 =?utf-8?B?UEtBQVBsUlEyckpQOTVYN0k5MjJZTXFLTWFCWEhaL1RkZ2lUd3FnbGovWXdk?=
 =?utf-8?Q?fSL3u9Jxf0FD8zXCLuVB6x+zx?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 888f2d7b-fe9e-4d85-803d-08dbd9662178
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2023 16:34:47.5561
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B6B2SsMQy0BngnBIfHYvKOo+UQbtQa1TtQlBZiFtGqI3xiOh0ZqRUq8yPG9QZFvLkeAzXsBGfdSL6XHO+kSmgg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8193

On 30.10.2023 17:10, Roger Pau Monné wrote:
> On Mon, Oct 30, 2023 at 03:32:56PM +0100, Jan Beulich wrote:
>> On 24.10.2023 15:51, Roger Pau Monne wrote:
>>> The current implementation of x2APIC requires to either use Cluster Logical or
>>> Physical mode for all interrupts.  However the selection of Physical vs Logical
>>> is not done at APIC setup, an APIC can be addressed both in Physical or Logical
>>> destination modes concurrently.
>>>
>>> Introduce a new x2APIC mode called mixed, which uses Logical Cluster mode for
>>> IPIs, and Physical mode for external interrupts, thus attempting to use the
>>> best method for each interrupt type.
>>>
>>> Using Physical mode for external interrupts allows more vectors to be used, and
>>> interrupt balancing to be more accurate.
>>>
>>> Using Logical Cluster mode for IPIs allows less accesses to the ICR register
>>> when sending those, as multiple CPUs can be targeted with a single ICR register
>>> write.
>>>
>>> A simple test calling flush_tlb_all() 10000 times in a tight loop on a 96 CPU
>>> box gives the following average figures:
>>>
>>> Physical mode: 26617931ns
>>> Mixed mode:    23865337ns
>>>
>>> So ~10% improvement versus plain Physical mode.
>>
>> Nice.
>>
>>>  Note that Xen uses Cluster
>>> mode by default, and hence is already using the fastest way for IPI delivery at
>>> the cost of reducing the amount of vectors available system-wide.
>>>
>>> Make the newly introduced mode the default one.
>>>
>>> Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
>>> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
>>> ---
>>> Do we want to keep a full Logical Cluster mode available?  I don't see a reason
>>> to target external interrupts in Logical Cluster mode, but maybe there's
>>> something I'm missing.
>>>
>>> It's not clear to me whether the ACPI FADT flags are meant to apply only to
>>> external interrupt delivery mode, or also to IPI delivery.  If
>>> ACPI_FADT_APIC_PHYSICAL is only meant to apply to external interrupts and not
>>> IPIs then we could possibly get rid of physical mode IPI delivery.
>>>
>>> Still need to put this under XenServer extensive testing, but wanted to get
>>> some feedback before in case approach greatly changes.
>>
>> Looks quite okay, just a couple of minor remarks:
> 
> Thanks.
> 
> Do we still want to keep the pure cluster mode?

I think we should keep it for a full release cycle or two.

Jan

