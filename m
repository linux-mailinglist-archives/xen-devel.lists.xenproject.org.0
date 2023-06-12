Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 43D1E72C352
	for <lists+xen-devel@lfdr.de>; Mon, 12 Jun 2023 13:44:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.547043.854224 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q8fyS-0006XZ-W7; Mon, 12 Jun 2023 11:44:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 547043.854224; Mon, 12 Jun 2023 11:44:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q8fyS-0006VN-TJ; Mon, 12 Jun 2023 11:44:40 +0000
Received: by outflank-mailman (input) for mailman id 547043;
 Mon, 12 Jun 2023 11:44:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Cme/=CA=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1q8fyR-0006VF-E2
 for xen-devel@lists.xenproject.org; Mon, 12 Jun 2023 11:44:39 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on062d.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::62d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 822cca6b-0916-11ee-8611-37d641c3527e;
 Mon, 12 Jun 2023 13:44:37 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DU2PR04MB9196.eurprd04.prod.outlook.com (2603:10a6:10:2fb::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6477.29; Mon, 12 Jun
 2023 11:44:35 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6455.039; Mon, 12 Jun 2023
 11:44:35 +0000
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
X-Inumbo-ID: 822cca6b-0916-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZxEAiqJUxrARTyhLehUh6YoOqEdXjQO/TQ5gyC0tg9f4FAb5MCypFsP+Skf/NFcz/Fni++Zf9UIjn7pjRt0ggWjMQ4V/Me3KxCzqhcx0a3/UenjA7iRXLIjm9TY1qdZFjqrTSmxrjs0hS8/ehalN229GfULvkvHLI+uXAqaGwnCr54dc8S5oRRLSqeuXu21/ND7GAb2bv2bnO/s4U0ndVtqGn2QF5OnYyD3FyXGokGX0DF8KTWL4FUR8pfeXs2qc8q0WasG0ramDVe2hh0yocYyA0JbmYOs9dlKXQQG3kp+ZZSmJJbJ9Ev85RwoMqJdDzf2HZkNNq0kncEoZ+IYJNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HunZ1Ybqmh3jQqmttIU82H5hOmm602MiozqinnZGkmc=;
 b=QAop4zRk8gKt/9MnjIBV9JmY/n6yheQndpKaC7ssXIcGZ9B0Tpn+be992lYV5f9rc14rAq1hdJCmHaRkXVRgoaz2t9coJvjf8jiYw2pzG1CUrtsEZC2xFYYYa+HOIELrW+gZaiTRYQ1c6eCPy0h3ULn0e6v+PbnXtgPa6/aWCR1W/CuRge7Ez8cQ+qBTyIpO9M99HDG6GabKQn9n80eSxqQ4FfFOQargJRQHaFNJv2RYpsixPFQ/PG/F50ieOmM8f2g6GrVcJNHaochCbGEpuWKe2or37uCao7XJneebeDLJIJEr7gm4zhVzOXZq9f3Wq6T6ys03CexxH1qxwFF+mA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HunZ1Ybqmh3jQqmttIU82H5hOmm602MiozqinnZGkmc=;
 b=OOURdPDKKrXYFZtkJYhFc8e7Kthm7uI409KIKp5SiK4ETDtgt8gs2A1eV2StEGFY/UW0J/DfMlGke8s6/oU54uPa152W24yb2NmfL+g7BcvV9nYK76XPLvjS9Ia5JqxG9RFRNTICf3M4WD70fDLLmlzn387TJN6SGuoJkQP4tZ2z5kjHEk0jHRstKCjBgPk0a4OhtmvmuY40d9xyBjZAIS2buMXsRR50MlvuwyFnTH+9oUScTbcOfATY7jrlsz1mG9XEzDOPEILcBYysXeT9cGQbZrDdFx9On13unCdthgyH9yeSM3+PXjABWOpTUWOVsduD/c5fZFCYlHMzTd/YRA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <8eb549c7-be3a-a41b-bee0-4cc6d39e7aa7@suse.com>
Date: Mon, 12 Jun 2023 13:44:34 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v1] tools: fix make rpmball
Content-Language: en-US
To: Olaf Hering <olaf@aepfle.de>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>
References: <20230530111807.6521-1-olaf@aepfle.de>
 <6734a258-3396-4641-b9bf-edf6193a8095@perard>
 <20230612133545.1318ce98.olaf@aepfle.de>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230612133545.1318ce98.olaf@aepfle.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0144.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:98::18) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DU2PR04MB9196:EE_
X-MS-Office365-Filtering-Correlation-Id: f764966a-0178-488f-d937-08db6b3a653e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	gK8PGqgrb8jRyyVvnC5wkUdTON6GHSXEgJ4JnRsdmFFNzXM7jp5LOQ43arfkw1ZmVaPJKrD614pSdtNO5GW0yzwZqwXHrSIpabByv6Tkwo5FEe2ZyWIfwurwGyEhHX4tpKl4D+egn0phByyXajwqsKPDYgHrqb6UtbwqOPHSKhkN87Noun9VE6+eNcrgcBb34gl1gU23juc3Eu8FiGYHdwzjql31KJ7tn7D0jiZilR3kXoyISu/6xbP0Tjj9IcOVNMNqlDgBcSjR2ZHUQe535nBjSsA1iOad4j+bYfp+4bOKYIIQThPYHJFDpc+cbDdy2a8U4UNPiN/qCgwIHC9/B/dKN8oD823qW1SDPxjLd7YmWc/q1Qd1Gg6kNnYxzd716hBYF74h5YleVo3UnxCBx4WGJCR6Hw3NM64TKx1AIr3chNHE7dSruYA5eXK1jAwpZZxmafRal1RGc2KX/ziA7h6QovyR/QcTc3BsGLfaVG2V8Zcu0ZdSS7USIVvgDB1MWfIKtaSJQIZ6mUa/5RI91HO0szWjCaMFxDZe5xs7lVftryMU33HAAarAMAF49UrsoKKeYBdGEAbD76X/z3zO4yFmdEsWIn8oHSMEfZNr9FC7T6tXvFAmSaWkdG2xFC79kW3jdpTzjKBJJ1ZWub+ffdvft46B9es9Lc/vHk1fKRFiucpP4nag23oO2+6poXc0ERawXwKlBcyBWbIHnFJNZQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39850400004)(366004)(376002)(346002)(136003)(396003)(451199021)(54906003)(5660300002)(31686004)(4326008)(66946007)(66556008)(6916009)(8936002)(8676002)(41300700001)(316002)(4744005)(186003)(2906002)(478600001)(66476007)(6486002)(6512007)(6506007)(53546011)(26005)(36756003)(86362001)(2616005)(31696002)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ekVLaGFoM25TSVJITDRTVmV6RkJEc2h4YTVLcVRiRzdsSFpLOHJaVDlQVGps?=
 =?utf-8?B?ZDQvaGNEemlWM3lvcm43L3NxZ3pXUndjYUdPRnFmMi9qN3VVTFptSWFHQjVL?=
 =?utf-8?B?OEVQNTg4ejhybUJYRk9FdmtSM05VOWxzcTB4RlBWbzZqVHFFYkRNaDhmVjh3?=
 =?utf-8?B?MTRsNWZjVy9yK3BqQjEveWFEbXVKMjF0QTVRM0RoR3JRWHpOb2FOUEoyekdB?=
 =?utf-8?B?Tzl4c1hLL1JFVWgxVFhFMnZKdVRNRWRkRW95Mm02TXVDTnRHcGpKcHVDNEFG?=
 =?utf-8?B?bHo5KzQ1N1E3alpLVnFFOEs1VWMwNlhSemhSTEtjUmhxeXE2ZlpwcVVJdTRF?=
 =?utf-8?B?dXVzR1RnS2U5UnNJRkxrVHBvY1BrMTV5T2dHVUNlMUcvdWtZLzJjM01sQWpr?=
 =?utf-8?B?b1VwUkt6R3pZNndtL1NVeGFKM29JT0FrVmNVZ0wwajZETHE4akdJZk1vYVda?=
 =?utf-8?B?MUwrdnU2UTd4MnAvUU9XOXROT3V6b1NHNVk0ODR3c0RnVXl6bGdMa1l2TmJh?=
 =?utf-8?B?TURLejhMTkROMGpMaFlUQUVldEcrZTJ0NUVCeFJrQWh6VGtubSs2NExIUitP?=
 =?utf-8?B?MDJXN3llY0JpQlhWb25pUjRLOEF4R2FrbmRSUGNURXVtRUxKZ1E3bmgzUGN1?=
 =?utf-8?B?MUdGL2pJNkdXSlJOanBwRUFNTTQxSHQwQW03TkwrOEIveDAyWk1yOUkzMTBw?=
 =?utf-8?B?Tm5TbVFkSng2NGJ3eGI3VnRiSmNQUXpYcDB6aTFHVFVGVzZEUldxcVVZZ0hY?=
 =?utf-8?B?T3lCSEdLZWgxOFdHSUNudEZLdHVrMEdvWENMMFByRDE5cXM5QVducTQwTVhS?=
 =?utf-8?B?eURnWkpoL0lGbFV5V1pVQ3BCVW1ROWNweElUczRJVFlLOXp4MURoc0RKclBu?=
 =?utf-8?B?Rkp5amt6N2JvYXVkNktWMExLT28wZnk5NXdveHNlUnZZLys4YUN6YVZHbTdW?=
 =?utf-8?B?NWJBR0NIWnIyYzFXMUZHa014R0FuakJ2ZHlsL3p3c1pCY1l6bjAwVVZ3QVdu?=
 =?utf-8?B?ai81aHJTaU42RHV1czREdE9qUlgxL3JrYlQvWlpSRjZyOHBRS0drYjhHY2Vx?=
 =?utf-8?B?SEZOUk8wQWg5bkdjbXQ0cnJrU1lBKzVLaEs5U2QyMUlDSWlLZmR6QU1qL2c1?=
 =?utf-8?B?d3NYSzhsRVBFWE5RZ3hUejZzVWFkZS9lME4vMTRMS1o0bWFkSUk2d3VTQmpx?=
 =?utf-8?B?RDY5ZHpMRXBUU1lva1d4QlUvV3h3Y1FQclhzemRCWm5GN2I2akpOY0xXcHhQ?=
 =?utf-8?B?UG5hRVB5eG1NZWtMZk5sWGlubWgvTlN5b3RKcnkxUU1UbkZ1Rnh2SzZFYi9t?=
 =?utf-8?B?K2I2dmk0MFFER1lpSzBRVHJ3Rkl2b24wdjl6QnNhdStxY3YydmhzUkdqeVlN?=
 =?utf-8?B?L2tvVFdUMmdBbE5qY3hGallRc2tTOUEwQVEyeDJlUzRZZFdXcEN2Q29NU3Jt?=
 =?utf-8?B?ZGV0OWRFbHFlYnNCVWNtL1U4WTFmQkJpMG5iZWdZeHZtV0dvN3FIVm9tVys0?=
 =?utf-8?B?NUZvQXNsTnh3L3AxSlE4aFRONGF0OVpmNGRIRzdHSW9rZTlodjJIN0MvMDdk?=
 =?utf-8?B?TStEWlNiYzArTWs1WmZ3ci95NW5JSkFuMDU4c3hseFJCNnh2aFNyQlZKdkR3?=
 =?utf-8?B?cTBSeC9FWno0bHBraGoxeU0wNzE1U3dXSjVzVlNKbCttU1ZpUTBEbzNYaVZF?=
 =?utf-8?B?VWhPTVNFdjFqaFZKOE9mUlE3TWxRaE5ZWVVJUWhldVQyYmNtSDB3aDJieXB6?=
 =?utf-8?B?MnppdThjVzFPVmRCaWV6S0pVRXVTVVpuLzVPcVlGNWpQNWQzaUxTYlBKYnhr?=
 =?utf-8?B?NXd3eVFiakRUekNoVFUzZWNKUnRjUzFtRGVneWt3UFNIcktxd1ZodGs5VnM0?=
 =?utf-8?B?L2NqVjRIM2lRMTIzUC95bWZob01WYnNQa3pYeXRra2FSeHdVZHZYazMyOHIr?=
 =?utf-8?B?UWtYS3RCd0g1WG9ZK2VMdURmdlBGVmdsdDdSc0NlelNHUnJta0Z3QUtoZ0hY?=
 =?utf-8?B?eml5OU9HNVNkc2g1dXFUYzJlMnNOSkJURnlLRE1hMXRodzRYM0JPSVd0cDFO?=
 =?utf-8?B?MUJoOVo2RDFXTTFLVU5sMk1WdkZ2Y21ybEVqNFRhdUpGTFVGVndDY0pPeUsw?=
 =?utf-8?Q?GRuKyJNSb/jaDkCUQr/gHHfiF?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f764966a-0178-488f-d937-08db6b3a653e
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2023 11:44:35.6052
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3jsDsQmhYih/xIH57RVZbHoId9+7E4It5AO/o7NoVYJVJKsQsmU+5UwIfFJhk9s+UGPiswUNUTvVCuwO0s8TpA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB9196

On 12.06.2023 13:35, Olaf Hering wrote:
> Mon, 12 Jun 2023 11:40:55 +0100 Anthony PERARD <anthony.perard@citrix.com>:
> 
>> On Tue, May 30, 2023 at 01:18:07PM +0200, Olaf Hering wrote:
>>> +pushd %buildroot
>>> +popd  
>> Are these 2 lines left over from testing? They don't appear to do
>> anything useful.
> 
> I think the intention was to test if mkdir succeeded. But then it
> should have been right after mkdir...
> 
> I will send v2 without these two lines.

I'd be fine dropping them while committing.

Jan

