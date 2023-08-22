Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E0A3783DB1
	for <lists+xen-devel@lfdr.de>; Tue, 22 Aug 2023 12:12:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.588358.919866 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qYON8-0000bh-6X; Tue, 22 Aug 2023 10:12:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 588358.919866; Tue, 22 Aug 2023 10:12:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qYON8-0000Z2-3n; Tue, 22 Aug 2023 10:12:26 +0000
Received: by outflank-mailman (input) for mailman id 588358;
 Tue, 22 Aug 2023 10:12:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=MJFy=EH=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qYON6-0000Ys-LY
 for xen-devel@lists.xenproject.org; Tue, 22 Aug 2023 10:12:24 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0608.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::608])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 62b37021-40d4-11ee-9b0c-b553b5be7939;
 Tue, 22 Aug 2023 12:12:22 +0200 (CEST)
Received: from AS8PR04MB8788.eurprd04.prod.outlook.com (2603:10a6:20b:42f::21)
 by AM7PR04MB6902.eurprd04.prod.outlook.com (2603:10a6:20b:107::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.24; Tue, 22 Aug
 2023 10:12:20 +0000
Received: from AS8PR04MB8788.eurprd04.prod.outlook.com
 ([fe80::9d93:f481:7a9b:345d]) by AS8PR04MB8788.eurprd04.prod.outlook.com
 ([fe80::9d93:f481:7a9b:345d%5]) with mapi id 15.20.6678.031; Tue, 22 Aug 2023
 10:12:20 +0000
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
X-Inumbo-ID: 62b37021-40d4-11ee-9b0c-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UF5LVmtY5VnSkL2Wrci9kW+/tDGkuHuczvVjUmjd+7opmLh1XzsRwPIgVK897rRhW1mXk+i96WHEB5DHjFCabm0FQcqf01nR2yrcE3aWBFJrCaHYUt33a4vPb7WEDT179LtEjKyybw2CmRSJwfS56jSqtPHZYRWam8isZ/FVP7kyf0dTKsEkIxkQWWlQspUxWzRkjoXG8RNZ5xF5qrPSxDbkXw2JpzW/Dz+y4eACVilMYXK0dPkKcABDlfflIxnI1FjllFeJLynroFGlcngH8E62iLlDj0lGGUJnRD9aJNJQF/cLW1wY0tOYGKX3qFRg9AnaLhG5FisOYUiOj5zcfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SSQbIB30pzcT0a5XP+b1k0QJXvspq2CTTZMGfYu1ohY=;
 b=eNhzl7Q+BYvLVwt29deO1F8xldd03PEh26SjpaBQPWkwzx1EmqtrksGAmiH2wXSVLUEbv/M2zSwDnmg4KeeK0iWn4Kzyg66wX/ZBp1OCLxaQHNXdwtR9aDL8TJi+S+9osEv28ClCsYK3wZxLg3tFBiSiF7CWiMVaJ9ftZHDndP+QaUzu9FbVaxtfFarYOM5cQpQpL7JHCyeFXmAIwzY2vhzoeaxTjMi3m6XiNRZfqpemTEpkU/esKF+r5pFSDfILDS1mtjODXFg6bVwEvclMn/6bsXwrl7Gwxw59oOR+G7bYor/VZt1SjbLFVd9Eo/cuOKISImBTeKEHpuiC787mjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SSQbIB30pzcT0a5XP+b1k0QJXvspq2CTTZMGfYu1ohY=;
 b=O9Iu7zu6FsipqRz7HBtdoiYRcYHiHPMBWH7apzVcQ8KKjxr+SbQSN5UWfA1WZRq21eS1zz6tADR4H8gG4G2eNN14knTznyJcaQoDsiUPC+3HCc44fAeqymvd/G8LDalzI6jmFSY8Xd+i6eV3K7g2oo/bjJgu584FKI8RA+KHWl0z2ym5bt2/HHHTNJ+SOQCeMhcewza6CeUYDZE5sOHQ+NgjI21HX3wkQGy5eZEnJc43wQgnTDXd2oH+UBZChqQkAfBP4qPVbAglgdTM2qbVqNgnZlcmiQTh85gmI0PPcRVkMWB7iF+1J1b+FIgdr/26WCjGRU1im2NwAfs1QiEpUQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <ee6fe3b0-92ab-e215-ea0e-091658b87138@suse.com>
Date: Tue, 22 Aug 2023 12:12:18 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v2] docs/misra: add exceptions to rules
Content-Language: en-US
To: Julien Grall <julien@xen.org>
Cc: andrew.cooper3@citrix.com, roger.pau@citrix.com,
 george.dunlap@citrix.com, bertrand.marquis@arm.com,
 Stefano Stabellini <stefano.stabellini@amd.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20230822013014.2523202-1-sstabellini@kernel.org>
 <f3ea87fe-cc05-453a-87b0-e7f795e24459@xen.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <f3ea87fe-cc05-453a-87b0-e7f795e24459@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0120.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a8::10) To AS8PR04MB8788.eurprd04.prod.outlook.com
 (2603:10a6:20b:42f::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8788:EE_|AM7PR04MB6902:EE_
X-MS-Office365-Filtering-Correlation-Id: 02b90867-a69a-4418-c728-08dba2f8455c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ZB316ahcSVWXJLuINxc6Z4c81I8XjvMOLd+YLJjKZIQeF5dTj7C+hYDiStc3YTqF3D86LIoV6Gh75xQ6in5ZwrVl7JNp5PV5yFemf97oVpZ2chSlodCN51bzVswhYT587wCDx70pa1Ko3l09ALxjxuYgcqvVcO91fR3E5s1wVjRdJ4rAql5rNTWDBJNkKugDzeqgBzI7XT8POjHuhdnt5YakcPRy4Ht+HbV+62ykyUyXp0i31Dvy/lUVjFFyQL+Km9CxvN76Z13c4Nmv8Lj0X1reSlqeXoUwFUzABEktmOwEek52tdDPKt2o86saE9XYkpu0GwPvb0nv0FQYbf2FfauZn0U4HE5M446+SDVHLK8mpCbs+vKwb9QCHozEYw+ZGxiAYrGzCn5uWaumAHGpkcbWBITvljKkBMpPFDfHCFSkXtLe3Bs6D3AKYZ2mxpbfVr8nn/daKv8LeWd0W0fI7tAf9FnQOhqlb9uU3HgUzfX3hggeqrkLZVLQpNmtB9TAa3+Vi0CJOhTwzjUOhYxoJYbvAEiHqO03muVPBBT5BDB55yrOr92IsvnmxbU+bQlx4ghiLDWzfVIQijd/AMKFuByN0RmfqnySBMUD/utibU8c84QYwhLbX+PTnBOrAG9+7qwaos/gsnXm+6kf2Si9Cg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8788.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(136003)(376002)(346002)(366004)(39850400004)(1800799009)(186009)(451199024)(54906003)(6916009)(66476007)(66556008)(316002)(66946007)(6512007)(8676002)(8936002)(2616005)(4326008)(36756003)(41300700001)(478600001)(38100700002)(6506007)(6486002)(53546011)(83380400001)(4744005)(2906002)(86362001)(31686004)(31696002)(5660300002)(26005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZTEyVVJVQTBSVitra0p0cE82YmVlTWt6N0IvK2tNWk5kbE12UDRZMFZvcjBy?=
 =?utf-8?B?bVZHOUVGNDR0RStES0N5Q090Y2swSjNHbkc1S2RBMGpEdFZjZmdraGxGSWVF?=
 =?utf-8?B?RFhJeUFPdlRRdksrR1pnSTN0T2VYNTJIc0pPeDBlN2t0L0gwUzh6eUVHaTBO?=
 =?utf-8?B?Y1hmOUhVV2dqcGFFRHpNYnlaWUh4MmxQb00wc25WVE5xZ0lYblRMNjFRWU4v?=
 =?utf-8?B?TDhHNmJ1LzJwR2R0MDc0UXVKbUlYUUtkcWZ4RXphRnRHMTBoem5lN1FDMlE1?=
 =?utf-8?B?NWs0SG05c1BmOUJGaVZOZFNKT09CTklnY0VyMk5Ic2dVSVNPQ2ZWZytsU1Vz?=
 =?utf-8?B?NnZjY1lQTk9TSWMyRnk4M2NwcGN1UzlHMGM4SnBSTWpqR0tWRzU2T1dUWDRM?=
 =?utf-8?B?anBGOXpVR24rZDNTMjZ4ODZFa0VlK2FtS1ZkWFpkN1R0TUI3WEcxNzJRUFRZ?=
 =?utf-8?B?Q2pONkk1T2JCajE5bENITWxzcVpOa0xYVzVtdXRNMFJGNmMvTGI5cGxvWHJ4?=
 =?utf-8?B?U0R5Zm42Si9taG83b01tU250bnlzdWlnajRvVllseHJxM3hvb00wS3UzRGRl?=
 =?utf-8?B?ZkdlUjlpanB2WmI1YUh2L08vY0tvQVNRaVZtdUFHNTBOVW0vZGdoNDMyd1My?=
 =?utf-8?B?TGIxTDJUT0wrOElGWmhrRThFSDkwTC9OUFAzbVBQVCtjZVozY3RYMzdSNXBm?=
 =?utf-8?B?dFpkeUR2UXpodWdKNExBTDRIZkNWY011WTVwRnNiMkhkN2ZEc25TMDdkU2hu?=
 =?utf-8?B?dFJkYWx5YndoNE0zSllzRG01dXZkczZBQTZpYkFySjk0Q0J3Znh6SUIwRUF2?=
 =?utf-8?B?V004VzJTNHZ2QjJOMWRaNjlLMk9YK2dqcjNnWHFjaG5GMkF2V2dDSFo2dm0r?=
 =?utf-8?B?OGZBWTBBcDcxQ2xpeVlIN0ZRa2IxdzNGOUx3aFpBVkhOQURhc1hMdDVOUHlW?=
 =?utf-8?B?ZXN6NWhqbmU3cGZCdi81SHdFMXJGWVFxbkZTMm92Vnd1SWpDczJmQWJLdHVZ?=
 =?utf-8?B?YTNCbmMvVnMweEtaZ0VEUDNtTkhNMm5xZm9jbW8zd2dESTlFS3FUaWVZNWp6?=
 =?utf-8?B?S2lyUHVMY1c4K1JPaENGOEhENDg2MWUvd0V6UkQ1emZVV1g2U1poYTJRODQ4?=
 =?utf-8?B?RzRwYittamRmckdmRHBkcnluckFoeUxwMDJOQlhIZEV1TUdlNUhDWHhuOGhn?=
 =?utf-8?B?MWFUOENJKzUrN055ME92M2tEQjFoMHpTU28vREdPd2RQcVhUMHlxbm94cU56?=
 =?utf-8?B?TFpNUit0TUFvMUJBVG5jNzZmdHBIS3hOb3h6U1YvM25HR05rRGZ5SExTcVNy?=
 =?utf-8?B?TXh0dVNqRWQ5dXJWS0ZwNmtMTkxyUmsvMHZjL1NtUGtLcThXdHA5TFdDZFlT?=
 =?utf-8?B?MnYzd05LYW5pZE9YWENkQUlLUTh6aHVnMW5JaHpxZElwcFlhL1FnWjREaUVo?=
 =?utf-8?B?MWJDUjZydy93RjVzUCtObGRCM2hCRXhBQk1yNkhJRHhETTZEMzBhNHp0UkJH?=
 =?utf-8?B?WmIyblZWUG9JY3pPV1YxT0dVVXc0QWhDZEorZ2VQY0kyU2RCd2svY0d1QjM4?=
 =?utf-8?B?R2JmZG55WW4rcndWQWtEZWxnT24vZjltS2pkRXVEVkwxZ0o5S0lYZW9ZcHBJ?=
 =?utf-8?B?WHd6c21VUlgvNWppUG92S0U3MnNxQkhDWDFkSDZtU0ZWZjl6ZG5oeHZsSGpl?=
 =?utf-8?B?M08rcGRsVzdTRFRrR2RzZlEwYURRRnhEeGh1M2c5dk42elpwemo4QVpRWGRJ?=
 =?utf-8?B?MS9BZmlDRWVlTFVpK2xSdGxxZmRFNXd3NFJtVktxK1ZRZ01NWlJxY2sxUlF3?=
 =?utf-8?B?YTJlOWU3cFNIdnFXK3lxS3A0d3ZvSXM4ZDduUXNzL1BpSzl2T0FCUkl1M1hv?=
 =?utf-8?B?K1orSFZsVjgwMUoycVp6a1lPQXdjd1ozVzBKOGFCUGdsQmRNMmc2dEIvSkgz?=
 =?utf-8?B?TzczNFNvVzd1L1RZZlk3a3J3eXJqYyt5bWRpNlVKR0ZROWthbTN0QzdJbjd4?=
 =?utf-8?B?cTFGeFZVUTl2c0lSM1l4TGJQWHZvOXJ5eFNWbnplWm9RdTFFVjRuM0EyV2F5?=
 =?utf-8?B?UXBML0xOY2NrS0RpSXRCOVg5QnBwQUx3bkJqaXdvT2NmbDdlWUNEc0V6bk4y?=
 =?utf-8?Q?qeA7T4hEpDSRZ7dTfkL2foppw?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 02b90867-a69a-4418-c728-08dba2f8455c
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8788.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2023 10:12:20.3310
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M2Wwbm6xO1anUscBkPNHkxxUMrLn0Ltma1EI00pQKpjCMg+ZMMNgfQOKtLBHd0QiX2gQKc0dj+1+KcSk4OAMag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6902

On 22.08.2023 09:56, Julien Grall wrote:
> On 22/08/2023 02:30, Stefano Stabellini wrote:
>> --- a/docs/misra/rules.rst
>> +++ b/docs/misra/rules.rst
>> @@ -59,7 +59,8 @@ maintainers if you want to suggest a change.
>>        - Required
>>        - Precautions shall be taken in order to prevent the contents of a
>>          header file being included more than once
>> -     -
> 
> It is not clear to me why this line is removed. Was it added by mistake 
> in a previous commit?

The patch is replacing an empty comment ...

>> +     - Files that are intended to be included more than once do not need to
>> +       conform to the directive

... with a non-empty one.

Jan

