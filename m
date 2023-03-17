Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C94B6BEC10
	for <lists+xen-devel@lfdr.de>; Fri, 17 Mar 2023 16:02:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.511150.790059 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pdBao-0006R3-0m; Fri, 17 Mar 2023 15:02:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 511150.790059; Fri, 17 Mar 2023 15:02:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pdBan-0006N6-Tj; Fri, 17 Mar 2023 15:02:05 +0000
Received: by outflank-mailman (input) for mailman id 511150;
 Fri, 17 Mar 2023 15:02:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+pkZ=7J=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pdBam-0006N0-FN
 for xen-devel@lists.xenproject.org; Fri, 17 Mar 2023 15:02:04 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on20606.outbound.protection.outlook.com
 [2a01:111:f400:fe1a::606])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id acfb47fd-c4d4-11ed-87f5-c1b5be75604c;
 Fri, 17 Mar 2023 16:02:03 +0100 (CET)
Received: from DB8PR04MB6554.eurprd04.prod.outlook.com (2603:10a6:10:10a::28)
 by AM9PR04MB8860.eurprd04.prod.outlook.com (2603:10a6:20b:40b::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.35; Fri, 17 Mar
 2023 15:02:02 +0000
Received: from DB8PR04MB6554.eurprd04.prod.outlook.com
 ([fe80::27de:8103:c137:3498]) by DB8PR04MB6554.eurprd04.prod.outlook.com
 ([fe80::27de:8103:c137:3498%4]) with mapi id 15.20.6178.035; Fri, 17 Mar 2023
 15:02:02 +0000
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
X-Inumbo-ID: acfb47fd-c4d4-11ed-87f5-c1b5be75604c
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V+zWXQo0XJ8wsJk0pCD3o5KVUnTDvd8exsF81zEejyYeUsd9X3ppQA/20ukYm/KeuxNXu8BymOJqxJUTv6nUaqBAkKlvlRPQUdZmL0qj1GfaapIewgxK2jBBwy+TmfIr+d6x3rbb45VY8GVUV7L3zhze74kGqKt8x7wBCz6oX7XH5gZyt9NLTxqQCOy4LREyv2/XRdofnCbs692UM8/1U1YtMzIPeEwzOkBiv1a4+m/NHG/FKvx2p2voe5qI49GlbQQqlWgduCQ9Fnr37MiHjMdAPKMeK0BPsxmbUiLomhcZbgcuhWhzpI+Ww+0pfVUJRQkY4H+/1ro7gja7EezPAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q6yTCkFyu6seLkZ+yOGJrAURfhZV2qHsrd+4T4tjdpU=;
 b=I8bJr8GxNwCuk0TZXZMg6Ii/yQyc92DlrNosv1wx8Un2JVUsVhbGfzpYUGyX4il5+tYvpE5yjNo+fApYKcIw4aKSJw8Tn5zhXiNtOVIKkjAWxDQKIJyI/MBUj5Bba83rdiVemUjywJQE7sTB52lTzX5lJA7O5bbhJOspf7gN5n2f7o8ftXeNqegRFNtSjkjRVUUC0otnkoBM0LEyGSdm6nlhpKPe4BNm5V67esWtN3pZTNwgJKMfQrAh69DnCl+lBAzNfOHAleeHaO7W5NYIE4VE+NrIjLkg22NYJz3hnYi7vi7AjaQUcAdmfvBFI9/YZK94NXu/dfKcrQtJ1cAIAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q6yTCkFyu6seLkZ+yOGJrAURfhZV2qHsrd+4T4tjdpU=;
 b=epARhTgYMiyZmbcWfvBr7tbZR9tZ/VgXtnkXSZF6tTk9BtqnFMzNIDEamcQLfWhJY9RNQTASH0w7pk2GFqISKzYTunayzuGDlrVAFZm2FKwKm2tGLzOtawM+XsCohlBxW/xmNGU6GMd2JZQRrHHVfBe/xJ5rvlntI9KLu5MiUXChqYg1wV8S1oI9XzK+ehyNSrrVMuGCgV3/UZ2dnswKnwK4JtEj0A3nceePqISbR6u/Fl4x1otOxnQZeUSPghlEaGm5IlugYt/Oohc8edBuK0D7f2aUP0J32Ei2zO7D9KZ7OPsCNv/v3fLGfvp0KTnR2atzVNqNKXA6c0fIIhTgWw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <a77ec0d5-0f97-409d-e954-0f28c30cf28b@suse.com>
Date: Fri, 17 Mar 2023 16:01:59 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v4] x86/HVM: support emulated UMIP
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Kevin Tian <kevin.tian@intel.com>, Jun Nakajima <jun.nakajima@intel.com>
References: <581a90d5-a168-5445-6a6d-ab20cc43b944@suse.com>
 <ZBR5T57tSqs2o/Sl@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <ZBR5T57tSqs2o/Sl@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0198.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a5::20) To DB8PR04MB6554.eurprd04.prod.outlook.com
 (2603:10a6:10:10a::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB8PR04MB6554:EE_|AM9PR04MB8860:EE_
X-MS-Office365-Filtering-Correlation-Id: 896c4031-7fe7-4548-c9f0-08db26f89053
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	K0pER4IFA1GhoHYU4t7YvJN1Hy6P2lSECPiN6M78wruOh8kHSj/NJNEOawnrW1V+EBg2BBlBE9/kcFIDxhgjmsZP46/hj4Y2lOVGQlXQTw+Z6kroOkI3KON/WfWQnG7oFs4RAW6MFExFXCrRCdDyy8eh7UZdWn25lkEankQkGrCaQZYuMpVWU4fb642mFop7sqiEM2G/8pWQvPteYwEmvSQAFkEqP+vhmNZdGJOMhzSLCyadwqF7nriK0SHJ8ZEocAG2kFsOB65A0J260oBDIGZKG+W6rK/v5j7ek+qkZdJ8L6kkwo/Of2dR2GDJYm3INFqoOZbP3BvUb5iN55nuPAaiQyIHWesx4WhfLxpNKhdKo1FO/Jghd2fALwGmkiHurYMsDIoagH9OXwyZrlfvrjwZXQjrBETv/Y8WMJU05XPlYzYFDQNZKBMAoPsYfzcmd/Jm3OahlitICu2qd7udzABAIm42D+SLV3lueLMj6kVUa8qH2aXQNhc8tMHQkemqL0shnud5RDK7TAlqtiy9Wao1d43bRdDQw2QXmWlUR2ntWt3FRQYoRQpiyaw2iJ/FZ2FB/YlE986IlVCacU6NZiYJvS3271rD1fy6jYF5Cvff/EKR8OAbQZu2ac2UFsbc2DZi4gXdU4mnvnMWEdjHfV0djxxr4oHVvwx8OlDl/JlHxYw6Otvp4jCGq2sq88mII5S2kP6NaZ36nKu1Mec8nhIj+dQKwO2R3m92Ug5tpRA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR04MB6554.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(136003)(376002)(346002)(39860400002)(366004)(396003)(451199018)(8936002)(4744005)(5660300002)(41300700001)(8676002)(6916009)(4326008)(86362001)(36756003)(31696002)(38100700002)(2906002)(6486002)(6666004)(478600001)(186003)(2616005)(26005)(6506007)(31686004)(6512007)(53546011)(66476007)(66556008)(54906003)(66946007)(316002)(66899018)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?V1RVYUpEZ0tESWpJTzNTVDJ5MmRwQTc2aUtQeDloR0haQ2VHcFhiUHFldDY5?=
 =?utf-8?B?QTVZak5lbHJyeENKODZRZUdvckVUWWVzYzZ2cFkreE1mclhheGVqd01xY2NB?=
 =?utf-8?B?bWV6RnpUc0JmUzU1bm9KKzRScE9kRTVpS1dqZzNNMThlTUlJK2EvaUZaZkFT?=
 =?utf-8?B?NU9PN2RycEtjOGVWVVc4eG5zTGE1Y1l4Vjd5dm9ZSHA2WnREQlEwNldMZHlR?=
 =?utf-8?B?cHNHUHNzbXJmazhhTUpMaEp0blhWcHczaWg4Tmd3SFRTVldHK3g0VmNPVUo3?=
 =?utf-8?B?ZEo3S0FKUU00am0vcERDcmpwM085eUEwK2RnMUVsbHNkM0ovL0dCTnpLdjJU?=
 =?utf-8?B?OHJxc3JOaUwwcnRmZnkwaFRyY3ZtbkkxeXhoeFlYcENpQXduSVJ3MERsZjF1?=
 =?utf-8?B?NUkzLzdVZWVHL0F0YjcxRXBtYkFMQjJDQXcrSmxWWTZpd2luVG5QMTdlQVJQ?=
 =?utf-8?B?c1l0U3Bhc0hLWUJzOVdvWGh2SFlJdVlVTG16QnlGZmgxQ2RwYzVMd3lYYzAr?=
 =?utf-8?B?MXNvMkQwTlhMU3lPOW03MnZEVEMwQS9HUWZNazlSY0hSZk1aaUhFRjk0bzQ2?=
 =?utf-8?B?ekRHMk1GQm1FWHJydXRTTlhpS1JXWXRiMXh0bVcyeFYwNXpNZFpJSjBuK3M3?=
 =?utf-8?B?L2xva0lES3NvMXIwUnpaL3RCd2hKVjlmUmZNaUhjRDFYMExiUjlEZjZ6YWxk?=
 =?utf-8?B?ZTBzRmZndHdHclVRb1A4dWp5ZG5jR3dUYmp5YU9TRnJENWNydmxFaEVxNTdS?=
 =?utf-8?B?b25lc2JLRGQ5UUJwdzVhWE1vd3cxY0RjVmtMSDQvMG8yY09UT0l4Q2hNQ1VE?=
 =?utf-8?B?dDdUeTY2T29Xa1pCNnNhMXNLTGx5Q1FNTGg0T3pYMkQ5ZnRwU3Jvd1NTVUFV?=
 =?utf-8?B?U1hKQ2ZoVzVpSTVqNGE2Ukw4VmYxd1d1M2pLQ1dJS3RMMkZLY1RCMzE3ekJa?=
 =?utf-8?B?TmJ2ejAwMTBnalRWK1hQcng2anZTd282d2R3M2E4cTJpdnA1ajRSM1J2cUVQ?=
 =?utf-8?B?UUI1bUZBbXF2OTc3QVIrazFwUnJtSENEVW9OeEYrdnhwcnBwNFlCNWt4RTNL?=
 =?utf-8?B?clkxT3VJUlUvOWxUcjVtdkNZWlRnOElza0x1MUsxV3dHYTVmcGh4cTRZKzl2?=
 =?utf-8?B?RTRXbU1DSzBIK2RVKzZoRzR0VDNCdW96SjFmbWo3RnpKalRyN2xaQjl4S0xX?=
 =?utf-8?B?bExpSU1MTzdhOVdhYzI5UjhXMkVTbWVCK0hBS1poRVlPNFY4V2l0WjBXT1FR?=
 =?utf-8?B?OUlXRVc0amduQllhczdHQmExU2hOVXhFeXd4S1p1NWdGZGV4UzJnRVVJOGNM?=
 =?utf-8?B?MVc4bDFUMExWNmMzTUtGM05id2VZRmwyK3hFOHR1UmkyLzQ4dHdRS1V5QmN1?=
 =?utf-8?B?OHRBRXUvQjZzTmZPYzVGaXdab3g2S2lTcTRoTzI0aUFlV1E4dDAxeFU2NHFZ?=
 =?utf-8?B?c3htcUlHRVRHd3ZyYmxyYlNJcFVsQVQzbmY4QU5VbEYyNEhZcTBSbSsxcVND?=
 =?utf-8?B?eFc0cDFHVmxyYTJ5MnUxMnNCR0I2R2t0byt5WW5zcENMOTVEWE5VZ2NFQnJw?=
 =?utf-8?B?N1JWNkpmTEZsNWpoUkdVcWpDeTh4S2ZUNUE1YkUzRDh2VkJFL1lSaWN3cFNZ?=
 =?utf-8?B?RUtLQnZwbzRQUE9pbjZ4SncybG1nTlh5RDNXcGV2dElzVGM2ZXVZMnZIakU2?=
 =?utf-8?B?S1hxRjRpckVoZXYrK0xCRHR2QVdQdVI5bDdTZzVKWkd1RHJvdFh4TmVIWDNl?=
 =?utf-8?B?VEJLUUpzS3lzMnNzUy9RUFRVV3E0RGQ1aDNmNGVocnVLRmpMZDlhREh4cVlQ?=
 =?utf-8?B?eHByNUUxekRXdVRiUVVCVkFsM1FpaDlwTDR4ZW5xUzVMUzRhM1ZkZ09jSC8y?=
 =?utf-8?B?a1lZRFBiQkM2bGFjbE1aVkpSUEpYamhjZ1BlSndQWXd3Q1B4T3FIUGQ2ajFo?=
 =?utf-8?B?MVJtbmN4Qm1UYW9MS3BtNXRDb3JobER1QXhuNkEzMC84VkVHWkpmVWJhbUpp?=
 =?utf-8?B?Nm9sK1JDR0RZSXhvRWt4K2MvbUhKTHBKcW5tZTdlYkVkRUhEOUdQTVdvVUhY?=
 =?utf-8?B?TnFPYS91VExqNzFEOVc2OXJ0V1JhQWZsRWE2ZGJRd0F5L2htZkczczhsTy9E?=
 =?utf-8?Q?qn8kWcpndG0IYlq4fhoQqGkdU?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 896c4031-7fe7-4548-c9f0-08db26f89053
X-MS-Exchange-CrossTenant-AuthSource: DB8PR04MB6554.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2023 15:02:01.9618
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IU8Xix/Yn+WPNk0EmSKNxS/JXJhFP0w8vgJAnh3w8QbfyCWOOKLRZwfAqI1lweWODsDCnj8RAoxaAGlLvr9fDQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8860

On 17.03.2023 15:29, Roger Pau Monné wrote:
> On Thu, Apr 15, 2021 at 11:47:42AM +0200, Jan Beulich wrote:
>> There are three noteworthy drawbacks:
>> 1) The intercepts we need to enable here are CPL-independent, i.e. we
>>    now have to emulate certain instructions for ring 0.
>> 2) On VMX there's no intercept for SMSW, so the emulation isn't really
>>    complete there.
> 
> Then I'm afraid we can't set the bit in the max CPUID policy.  What
> about domains being migrated from a host that has UMIP to an Intel
> host where UMIP is emulated?  They would see a change in behavior in
> SMSW, and the behavior won't match the ISA anymore.

Right, but that's the price to pay if we want such emulation (which back
at the time did look at least desirable, because the other affected insns
are more important to deal with). Not setting the bit in the max policy
is as good as not having emulation on VMX at all then.

Jan

