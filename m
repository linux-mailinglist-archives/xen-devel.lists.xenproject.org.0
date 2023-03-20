Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 077916C119D
	for <lists+xen-devel@lfdr.de>; Mon, 20 Mar 2023 13:14:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.511873.791248 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peEOj-0007bQ-0t; Mon, 20 Mar 2023 12:13:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 511873.791248; Mon, 20 Mar 2023 12:13:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peEOi-0007Yc-Tv; Mon, 20 Mar 2023 12:13:56 +0000
Received: by outflank-mailman (input) for mailman id 511873;
 Mon, 20 Mar 2023 12:13:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=AUe7=7M=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1peEOh-0007YU-LS
 for xen-devel@lists.xenproject.org; Mon, 20 Mar 2023 12:13:55 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on061e.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::61e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id adf2dce5-c718-11ed-b464-930f4c7d94ae;
 Mon, 20 Mar 2023 13:13:53 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB9PR04MB9626.eurprd04.prod.outlook.com (2603:10a6:10:309::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Mon, 20 Mar
 2023 12:13:50 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%5]) with mapi id 15.20.6178.037; Mon, 20 Mar 2023
 12:13:46 +0000
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
X-Inumbo-ID: adf2dce5-c718-11ed-b464-930f4c7d94ae
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QxmPTqKxXuWb+ndm6lsEAJDDwbU9gdO7C6TGJiJDX2ceU97Qr6FnY8FbCX9bZYo+ff09K9nFX4tWiRg97F2Oqa1GRehaSqSqkmZqTL/cmUSTZ33bbE8zsoSiKxd+HOBLxmqVgdghbiquVw11hAtKiay9b4eKMDjztffkpHwivB9wgXNgMyVzgSYSFV+y0eEhGwppooPJjfxYEYDDiiNXpUfJVnVYtSRJrthNzXsHc9jkchUB3Pj07CMI8rvAmrCejMYd+EUNPxOaRNOcuC8TLOA77YXzHQLz1eo8G9pMCzdw88rDJUw6xc7MV+g8uhaczmhreIGSiNXxrSGHUuOkcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CzKOI6iVSjEoLgjJ/8u8+fttePmh6/XEFxae61/6/Mg=;
 b=Qbaaut1RbZ1gWEE0MT4F3vMjQnmqTdC9jItp7t9KRdkGyLCNcm8vFwQximn7iBgRcjnENwsztCpfaKuB3RvmQUToAEdUZRBPD1tm59zX8hYA+Ou69Rkdiv08qoux4p5gPk7TCi2xioKx83ZWTwknzKtMx7sL7kq+Z2IRm/UgJuNnatmCLVY+6xnw7lD92gG3XB8aF7F5k/Dj3r1fC8BrSyyM23cDlGDIuQKo3ae+t3FGjystvMRutuuNeDeZCyL6rpSeToiUm+o9yW/Ci/kw3ZXcuT6VwME7ffCi6cfLMiGX0am92xbOg1o27VDowBStz9gwPEhhTDtFmVZGdRG/YQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CzKOI6iVSjEoLgjJ/8u8+fttePmh6/XEFxae61/6/Mg=;
 b=s/zdBrT45C7uC+W1td0LFX48LJ+Vrw0kdHDoilB7TX9FSZQji49ErdCKq+HWDUiTUtBp5M+Pg07RI9H7fDuvo33euAQashMZQKYPg08FTv6P8W6XZwm1Gr7viUfe5Im4HYViB7uBW8b/DYBh+HR8XvKqW0rtWfFjbOblZYVgBQFoE230XVBRKMOb5hzE3JysJnBbpEzMBC+577CJn9rDxR1uY4vBFS96G3TjLKxtjFd9pZH268BV4ahWKXDQf41513kWKG+ZbFkwrg3I/y2DuMsrNeM/bHOavQGZDOuUg5/lw8uJUT3VaAyCUi4qmSzsETcXO5inJRhLElZHFn32Zg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <f4421e0d-1346-4837-8fef-ec1d4d589219@suse.com>
Date: Mon, 20 Mar 2023 13:13:50 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v3] xen/console: Skip switching serial input to non
 existing domains
Content-Language: en-US
To: Michal Orzel <michal.orzel@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20230320081935.18367-1-michal.orzel@amd.com>
 <39426526-c576-e3e3-4cb2-d3741d447bdd@suse.com>
 <66a3b439-478c-64c9-c713-b3ce6d3b779b@amd.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <66a3b439-478c-64c9-c713-b3ce6d3b779b@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0094.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a9::14) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DB9PR04MB9626:EE_
X-MS-Office365-Filtering-Correlation-Id: fd25bd51-1bb0-46cf-6308-08db293c8e37
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	526XgKodr+df/NYRHM8lYOmjS8ePufJnyM2wYZ48Y6JEdJbIAYlQf7owhtna0qdyWAotMZf5V+N+WaNktw94fVV7sAqCipj62/L1OZx/sLAkhLrKVbZnUy7RPSYZhqeomnURqjdamatt7qank7w5D9WECJeNve/rgvqKZZKKabS2CSfz7WNT64RIZOsaJf1qZcPRBNKdNdcJFB8GUAgkoFjZCKrNb2USujQ4CHU8kHrxZT8yFMb4kUXpvZR9U9S0SVeX0DOaUKnzzSQKkH6m6JTBrA9kOptCPPKQrrA1SQTN2YNgsLIDaioB8yXMRVcwYSj+XcplsPszvcWHgpdheooJqMkjhGkgwjQPgegMoesMVl/GldmenrfFnbrFC2cRbKZyZCZfyEbNNp4sEPurKLAyr+mBYMG7fF11z7o2EGrobbZ2nw92YcTnL462yQGGax2KtbD2m9kKV1xdqoHexzy2iP+qBU69VGz1bcxnuV53Kbbg5+RKVLSB1toeXpY1yq8pK9bFI00Ij7H0zVtS9Qb2ztrb3+IAlcBnkyJF/72Sc5tZnCFeXTrDn1TRI2ujoWzsz2q/HomdTCu7P9Gszc0lv0GPvoAZDXKY85+2dPulDOcRJfNMcAN5uNs+vAdnvQtPX6Grj9jf90TVxFMyGhDz57xAcNjmTN/rG2xlLdYYZ+GmdGlQptuQ4AgGU5+12mhAMAYS4V0J5ARjcHOzb1lzn/pYJcLqn0VxlIJSRyY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(396003)(39860400002)(346002)(136003)(366004)(376002)(451199018)(38100700002)(66556008)(2616005)(2906002)(478600001)(31686004)(316002)(186003)(66476007)(8676002)(6916009)(66946007)(6506007)(6512007)(36756003)(53546011)(31696002)(86362001)(4326008)(54906003)(26005)(4744005)(6666004)(41300700001)(5660300002)(8936002)(6486002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WTdPK3RBQVJaNGZaZUxBZGlNaEUwakJRUXB3WEVwdnpVWDVhM21KUVJIYUtu?=
 =?utf-8?B?NTIrMUF0c2xmOFRCdGgwWXpkdGJtZWFLY2l6TUR3M0tVa3pBREt6Q3hIdHgz?=
 =?utf-8?B?VTBaOEo4SUVxWkhYalVrWGVqdGF2MVN1T2Jab1lSYmtVKzIyT0dWREtFRDJR?=
 =?utf-8?B?R09SbW9uTXExMWl3ZHg1dU96T2FWUTJLMUw1OUF1Z3lXR1RMOVdrbGZxYTg5?=
 =?utf-8?B?ajVYY1dpN0pYZ3VnQTJGWHhId282bitKWnBManV2K09rb3BiRDZ3aXVFWnov?=
 =?utf-8?B?eGx3ZnJFU01DRlE2WTFnMWNpZndpc0loQkF1cTVaeFptNDFCZk4vU3RWUXFR?=
 =?utf-8?B?KzdzZUlRbWRtY1ZaRmR5UWV5RW5yWHdieGRNSDZ3aitJcDRhUHNnUXVxK201?=
 =?utf-8?B?aVpjSWVubURTaGRWekl1dFhldytmRVVCRFVHSUtmSW1MYy92VGJ5TUNHVlZF?=
 =?utf-8?B?VEx2eUpDL2NneENKbWp0V2kraGtjbmdoQnN2cGlQL3RhckY1UzkxZnhVUVZX?=
 =?utf-8?B?RTQxazFNR1VzU2FzdWRkMXZ5WEc0VDF5ZEdoRzhrMWxTUytDQlF2TjVXQnBi?=
 =?utf-8?B?VHpBaU5XMHAyQU5QT28wMCsvUUQ0MGNKMXI3OHd1clBDQ0d5YzJDanpoL1M1?=
 =?utf-8?B?blhWN3pPZGZ2b01wVTV3OUJrWlpIMHVKVkNnWjBNK3ErSUdXT3V6aWNRYWNt?=
 =?utf-8?B?eUJzSW5vaVA4ZU15S1RQZHFoL3F3a1NLODFsZkhiVFNNZVdOUjZ0cHZxVkxW?=
 =?utf-8?B?c0tOSU13Vm14d3ZMNWRPN25jWVZEMk1NaStDNUVEM1QvbU8reSs4ZjhWMWRR?=
 =?utf-8?B?RllleFRDdGxmckhkQnVzdnpwVGtsRC8zSU9WUlVzS2JuZitnOEwzdzhNN1RY?=
 =?utf-8?B?Ri9FMGdiSmFSV2dYM0luMS9yME9TWUVVWW5jdXFSMWxFYXh2TTBicWFkNTlq?=
 =?utf-8?B?SnprK0swanVxd3paRjZIYWI2ajI1dkFWbXpiLzIrZzA5MmQ1UzhRT2RHSWRO?=
 =?utf-8?B?S2hxY01IQWRUdVp0WTBWTHI0MmxBUkh4dWFGQTF4QUZQbVlicnRTMHhHQ2xK?=
 =?utf-8?B?dFFtVnZibmJuYi9pNTVWdVk2ZlgzcnN5T3plbDBJWjBqdHB0NU5EUFZzWFNZ?=
 =?utf-8?B?M1hyeitXdHBlT1RLRzlZTzlIWTV1MlBmdkRuVlBiRDdXVFJaT09yanNsRmxE?=
 =?utf-8?B?NGNVUWJrQWFDWlJXckM3MmJnci8wTy9rNDdtR1ZwbEw0Sy8zUzBKNVQ1NnpF?=
 =?utf-8?B?Mi9KUUdSaldHdzI1anM3UXRuZW9wVU5LT2RtSWhlSkVQcXVGSmRjNGlURDcv?=
 =?utf-8?B?eWpyTVo5Vk9BMkpyVldZL0JpVWMra01wbDZMOTAxWVpnc3J4VzdsVHFIRHBQ?=
 =?utf-8?B?aUgyRHEyZk8xWEI3NTdpbGdBcGRYdm8rZlVWSUFzVmhHUjdURUo3bDJlS1or?=
 =?utf-8?B?Z2o4ang5NjQ0V3J3eGwvT1VScW80TTE0ekg5MURIKzAyNElRR3ZQME9DS2V5?=
 =?utf-8?B?TEtxcmhSSHNWR2VGNUNjc0E0Y1ltWGV0eUk0cE9RUWhoc1NWVERSc25Gb1BU?=
 =?utf-8?B?T28zNG1DSUZGdVRZWlhpbVYwYWZ6cWswbWlkTnQ3Yk51c2dqNmFWM2Fvd3Jy?=
 =?utf-8?B?QjBCVUdOTThIckdEbjdrR3llWkp3dTFPd0tZMm1QZnlYZDdXMDM0dXFvTits?=
 =?utf-8?B?Y0tDTlE2KzJoWmlMU1dlQ2xVMGp0TVRId2hpOVUvTWVsQmdETnNpZ0RyK0cr?=
 =?utf-8?B?S1BTNTNSeWhUTHoyWTZoZjM4SGR2ZUJNYkVJbFhmRExLRjNBVG5ONzhPY3JL?=
 =?utf-8?B?QVkzNXkzRnc0ajlyQmZFN3lqL1ZZMW9HNkwwUGpxK0FrUDU0Qkk2RFhmRVN2?=
 =?utf-8?B?cmpJSnMwUVBxWUZZdGJhdit6UW5RZFZiRnpMVHB0NE5jWjY3MDUxVXdTQUh3?=
 =?utf-8?B?ZmRGRmRrR0NQMXN1YUYzOWdML21SRFJRUGNEamozalhLdWRZRVJ5cDFvM0o4?=
 =?utf-8?B?SkZOU2pBOGRNdU43OG5pQTRLMmk2MGhQaFRRaVphMUdXeDMyaTNHOFJMQ3FD?=
 =?utf-8?B?cWxSN3FyTWM5V0JCeDB1Y1JqWkF6QU40UkMrVk9Lazc3aWVhaUc5S3Z6STI0?=
 =?utf-8?Q?nw61j/XTIbjBHwQ5WsGeHM+b4?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fd25bd51-1bb0-46cf-6308-08db293c8e37
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2023 12:13:46.6799
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gxL89ayz+oCMpyWIdbSyNPQkx9cdM/zYsax+qJCYLNCTTAA7nYjGe84Id0UHYexo/+Jk5e87a9TSOKm/R/6cyg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9626

On 20.03.2023 13:07, Michal Orzel wrote:
> On 20/03/2023 12:17, Jan Beulich wrote:
>> One other transformation for you to consider is to switch to a base
>> layout like
>>
>>     unsigned int next_rx = console_rx;
>>     while ( next_rx++ <= max_console_rx )
>>     {
>>         ...
>>     }
>>
>> i.e. without a separate increment at the bottom of the loop. Which,
>> now that I've spelled it out, raises the question of why the outer
>> loop needs a condition in the first place (because as written above
>> it clearly is always true). So perhaps better (and more directly
>> showing what's going on)
>>
>>     unsigned int next_rx = console_rx;
>>     for ( ; ; )
>>     {
>>         if ( next_rx++ >= max_console_rx )
>>         ...
>>     }
> Makes sense to me so I will do this assuming that you agree on adding your Rb tag also
> for this approach.

I do, yes.

Jan

