Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 401B2773B03
	for <lists+xen-devel@lfdr.de>; Tue,  8 Aug 2023 17:37:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.580073.908357 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTOlS-00024h-Iz; Tue, 08 Aug 2023 15:36:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 580073.908357; Tue, 08 Aug 2023 15:36:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTOlS-00022t-GB; Tue, 08 Aug 2023 15:36:54 +0000
Received: by outflank-mailman (input) for mailman id 580073;
 Tue, 08 Aug 2023 15:36:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/GY6=DZ=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qTOlQ-00022l-Ge
 for xen-devel@lists.xenproject.org; Tue, 08 Aug 2023 15:36:52 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on2062f.outbound.protection.outlook.com
 [2a01:111:f400:fe1a::62f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6499cdf9-3601-11ee-b280-6b7b168915f2;
 Tue, 08 Aug 2023 17:36:51 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DU2PR04MB8952.eurprd04.prod.outlook.com (2603:10a6:10:2e3::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.27; Tue, 8 Aug
 2023 15:36:48 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6652.025; Tue, 8 Aug 2023
 15:36:48 +0000
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
X-Inumbo-ID: 6499cdf9-3601-11ee-b280-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mva2z9WvqJl4epr7zZuY5uudnGMKwiSpuHbe7wTO4/hy7c6556cGbzZIbl7RXcX8RitF2XbrYBo51O74aXwDwZ99TcziLuSjC++Yp8um4PfVTRaHrIcWDF3qUAVD9S13/aHJ6psn9bgQVDkKLtu4XWgb/eottV1Ypg7JbMeLytsDWr5+5r4ROsDewyA82WleacCHN3q1gDo/GTED76hffqcJBgmUMa1lxx/fR6f6JLft46AbAsoHrXxJgs7R0DvFyKk4OmxrrN1riK7LDlyEszBnQmbG9MqTHrMwvJyREqKOekSay3hH0Js5NloQVpg+/c671ZNtSjlC2zpckMQdIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0SflO+UEOlwdotTVRSMKPXjDifvAURaeLbRt7mtTpIw=;
 b=WZ8xfzKNFuJh64FfhyuGh8ofq8Gf2mZHpS2ubF+kz1UFgt4/dbxaEV4TfEjFebpn1cKoIvLewLm8vVBxgHa8njT1STajOLG3LAwkSPyVgQqUJ0w4y+u0Izc3CX2K1ZvJWL9rX/rN3sNDy8rJ1lAgdqGA0rIcUsn6br0HO6vkAiTEoLcBiO2xhM++ABxIgXP/YH1cjfdo//ld4ne5R2MYV3+AyGbqIhvznbJHdA3m6zN8jkD9evjLTpTnDAUakDtXkgt7+1J28Ra/dHk16t3xtD1dfvQC9DtBQW470/6qu739xmhzzP7TLh8nds2G4ksKKLaRDFZWobLqFKrAFtGqhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0SflO+UEOlwdotTVRSMKPXjDifvAURaeLbRt7mtTpIw=;
 b=Hyf5UP3cLL+TLikl/Z2lbWyorzoFLZDKeK2r3mVM6pYBZOCWT/LxxMe5m4pSjzSPlxZqhQyvX6WwM+u7CnvVvqzNZUQdGemfRNldSxFJ79YcbcnRGHjz/5U8FvQ61B52sC35QCnW3+kaXpft8fgXhXiWQNc1idPP1RC+jHLrHOLiIKngT3/XRVISoVNxb+9aKMS5et032vlElOeXR3T4cyeKuSCwYljMaCntI5QCRNv60Jl94o2a7nPZbgFSZcwTvk30ClN03j53HNocrk870zUayZspxKd4VVQVTH+s82081OUYuU7tDkg/90SKqNtw/5nbThSiKsnYUhoP7BMvyQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <5135e7ac-1025-3a45-7cf6-d049a15b8df5@suse.com>
Date: Tue, 8 Aug 2023 17:36:46 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [XEN PATCH 10/11] xen/sched: add ASSERT_UNREACHABLE() to address
 MISRA C:2012 Rule 2.1
Content-Language: en-US
To: Julien Grall <julien@xen.org>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 George Dunlap <george.dunlap@citrix.com>, Dario Faggioli
 <dfaggioli@suse.com>, Nicola Vetrini <nicola.vetrini@bugseng.com>,
 xen-devel@lists.xenproject.org
References: <cover.1690985045.git.nicola.vetrini@bugseng.com>
 <3f1385f2ddb151a53ca092ea1caeac5d12fd80f5.1690985045.git.nicola.vetrini@bugseng.com>
 <db2ac35e-b371-4537-9d56-8703e3648abe@xen.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <db2ac35e-b371-4537-9d56-8703e3648abe@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0124.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:94::15) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DU2PR04MB8952:EE_
X-MS-Office365-Filtering-Correlation-Id: 82fcdb77-b364-44f2-f4d2-08db982547a5
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	EqgEbG5klXu4tjqD9fD/NS2YMM+9MmP7plu+Ia41rJ04hLZ9B47GPizTil4Ee8VE80iUjdA3vfQVjwVeLycyc9Z17aRQXyC1mZvb4SDvNGY536anyRoQLbyaL2wKqc6c6a+IueyOy9tmoiybZWkUEmzMzW2ADOtui6Ny+tb/aTeY3y3eufait0VRsWX/jG8bpg4xiavQMOwYRNIbNBuNP1W0Esmknb1aL+PvJrkW6fX9hm1c17CYYSZX8efcSitDC/kd0yI6+cI3g0Jlr9EjI+yGCvVjYBnEtYUIExJVkuGKG1lcCFTHe+SXVRWdSNTPnoVBFC7IPHXHy5Ibuwj7BV6OayogYchTcJD/ranNuZOlBVPUDxGYhoqi3eve6vTSw3VtlS/oPNg1MA+gEIAGhFlLrLqSqcE8A1RywpLkue8b+YhD8HjP023rndOtWH0NuHoGgi3Wp4yBT6T1nZcCvA3LcdY6df1qVn9mgQNGmawpfPIB+Rn0ct6x00OvPni9dkMq3IzLiKmn8VjBn8VqERQe0hK9m8uwrbfRrZkr9X3e3IrcoXpRHYoO2V9qZWEDmQr5KUWJx7UiZ40piUUXPy0j8Y5AssypT4C/Xo7NetCrVbJpgCY2A9bGcpXYzy8yKOnFGYjscQsO+Ovi7AINQg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(346002)(366004)(396003)(376002)(39860400002)(451199021)(1800799003)(186006)(36756003)(2906002)(5660300002)(2616005)(54906003)(38100700002)(6486002)(66476007)(66946007)(66556008)(6916009)(6512007)(4326008)(316002)(31686004)(41300700001)(31696002)(86362001)(8676002)(8936002)(26005)(6506007)(478600001)(53546011)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TTNxRFlHOFV2WmhSZ2MveWRaWHIvWGJldnNaY3ZYem5kdERyWC9TRW00aDZJ?=
 =?utf-8?B?blFJN0NHbnRQemxPZ2xGS0sxQmZqaDgrMTVwQmpnMDZuZkFkOWxWQThzdHBu?=
 =?utf-8?B?OUcrQWpEYkNxR1VMWmRIRDFtYm9ZTExPRXc1eHNxczZqeDd4S0JRRGl3djVo?=
 =?utf-8?B?Z3l1UDl5WlN6UGFNUFJlNE1iMURCSXhhTm9OS01TV0JxM1hTWlI1bVI1YzIv?=
 =?utf-8?B?OE94UkErRGdoTENKdzI1UXpwNWMvSzVlbnlvRCs1bU43cnFNWXlvVDMyRUQr?=
 =?utf-8?B?TENnVzhxcE9BV3BVSVYxUzN3QlZlMHB4bmtUNTJvYU9wZzZhZFgwcGpKeEFz?=
 =?utf-8?B?aVNBamNwZ2NhWnptVk5IMmhyZjNnMUFIcTRaRzRuNForaENwVlB6MVlONktB?=
 =?utf-8?B?bXkvWFU1Vk5qd2NFUkNSZHNWdEVkSG9ySFgvMnY5OGpOazA1RDRSNVBHY0E3?=
 =?utf-8?B?NHZlcmJwNS90WFBRQ2tJZWRhaWo1T3AvSmhLMjQ5b2pVRzg0RlU5UXhLTGFj?=
 =?utf-8?B?VkdPaTN3VzQ0QTFEdmcwSmlJenBVOHZQSm5wdnY2dE9qbmJqbHVQNml1aUF5?=
 =?utf-8?B?VVI4SEc2VnhNdWhTUVRsM2x6NjdHckRxWFdQZmh0cHVla2N4eSszcVgvTWE1?=
 =?utf-8?B?bGg1T3lsZGF4OFBacEdmbmFkVlNhV1YrU1NQZlNiWEhnWThIY0RIY3U2enVp?=
 =?utf-8?B?ekpXaVhHNkFPTW9tZmdaSWtoa3JIZ1phMEthV01wdXB3M0dEbFhWV3ZwQS93?=
 =?utf-8?B?c1pjem5aUkxZZHIrRHZDQUFiNkdDcjNrMEpFTzU5N1duTXFRZGpyVWk1WG1C?=
 =?utf-8?B?MFJsZndIdlo5YlNXNFZBNmlhK2tYRkJ0REZSQlgxeDFpbzhtWk5kQ0c4bGZu?=
 =?utf-8?B?cmxkd21temJTSEY3bVhYbEZXaFJvVHdFNmVXcWRUNTJnZC9LSDVSS0N0bU9x?=
 =?utf-8?B?K3BtcVBBNDRkcmVnVXhTRnJETEYrMk4xTlFQTlRQb25LUHRSWlNOZ1hZeVBs?=
 =?utf-8?B?Z2tEa1BLTXMyV2RyZ1ZPWTF5SUFaN3pqVis2SWZqWnpMUHp1dEdITEI5bGYr?=
 =?utf-8?B?WVpDVXZmdjkxV1B6L203d0t1Z0dzNGFjYWpQRkZqNUlsQzJobFk5dDFpTXRa?=
 =?utf-8?B?MlBFR2NsL0F0YlVtaEhwYS9YbjVGWmN4c3JwNC9EUVVoZHQ4OXhxWEtBTlFK?=
 =?utf-8?B?aWNybDQyZjFlZWFUMzBWcVBPKzZzNmRZS3gybm9udm8yczFQOTJ4K3BzaHRW?=
 =?utf-8?B?bnVMWHlldUtPek82eWNiOEtjUGlDS1dtUTNHOFFNYzF4aE9vM1dLMVUwNDdt?=
 =?utf-8?B?UHkvNTVnN0ZjLzE0c1cwa0hlazllNWw4ZXlSWlhLaHk4L3pDQm8rRkhrczNk?=
 =?utf-8?B?V3pvZURGcVdMRFI2eWJLQngzNmJsTE5tb2t5NTcxQk5pQjNkN0cxNXM2M1hC?=
 =?utf-8?B?dzY0dHgyOVZUQXBjdHdUU0IxKzBza1BhNklPN2NyM1A2M21ha3EzM2VtL2s2?=
 =?utf-8?B?c3d5R2dXUDRuaWJVV3p6UEZ3NGoyOWJDanplUHJKQ3JyczNpUnRZN3JQR3B6?=
 =?utf-8?B?eDBQY2JvcEVhVVFheVV3bjhYOWtaZTM4WldudWViNWpyVWxiMWFTaDdSQzdD?=
 =?utf-8?B?TTNzZktsakJabGhSS1ZzYW0rZ2Ntc1VXZ0wweXQvUEhvQWFUdGdsd000UjZG?=
 =?utf-8?B?blFhWEp2SjNLd0hwOWdYN0svNlgxL0I4Y0JEYXJZSFd2NjNGaWs4aFNzbEFx?=
 =?utf-8?B?ZEtHQ05IM0tNNEY4dFBuNEtxZHUyZDU4VldJUEppSUNRYmlnQ0haK05yWjRC?=
 =?utf-8?B?SHAzMzBIYStwMUsycGpja09TNXJibnBuT2t4VmhLdlZTZk55ZjJFUWRVV1hM?=
 =?utf-8?B?akxhcHVselVGM1RNdHNIR0h1aEZBb0N5UTdOWHZSYU1MNVJBMGdNalBQLzVj?=
 =?utf-8?B?eGNNTkNRKzhob1JwTHJTZjNtcUdmdVg5RTlYNTNRMnM0azhCb1FiZytHYnpY?=
 =?utf-8?B?L21td2pVMU41dlpJUWhKc2hnYk5HcUxUeThYZEZGdXNPN1pkUGFEYjMzd1p5?=
 =?utf-8?B?eGEvcW5veEdKYnZ5RGtMUzBCampVRm5QdXhLUHlXcUh2SC9lMlVjbVMrRUo1?=
 =?utf-8?Q?BdLI4dFeAUK0NLZJ46WtbCY5J?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 82fcdb77-b364-44f2-f4d2-08db982547a5
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2023 15:36:48.7693
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 15Lr6/nuZvCWabBVf1aB7HzV9cCKFcbKr9GhlzUQH+0sTj5+XvubgdIe2OEPcDz2Wn7P4RIjLp190lv77IRC/A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8952

On 08.08.2023 17:25, Julien Grall wrote:
> On 02/08/2023 15:38, Nicola Vetrini wrote:
>> The break statement after the return statement is definitely unreachable.
>> As such, an call to the ASSERT_UNREACHABLE() macro is added to signal
>> the intentionality of such construct.
> 
> How about using unreachable() rather than ASSERT_UNREACHABLE()? The main 
> difference is the later will hint the compiler that the code cannot be 
> reached and will not crash Xen in debug build (this could be changed).

Isn't using unreachable() in place of ASSERT_UNREACHABLE() unsafe (not
here but in general)? It'll tell the compiler that (in the extreme case)
it can omit the function epilogue, including the return instruction. In
the resulting build, if the code turns out to be reachable, execution
would fall through into whatever follows.

In the case here ...

>> --- a/xen/common/sched/core.c
>> +++ b/xen/common/sched/core.c
>> @@ -2233,6 +2233,7 @@ static bool sched_tasklet_check_cpu(unsigned int cpu)
>>           /* fallthrough */
>>       case TASKLET_enqueued|TASKLET_scheduled:
>>           return true;
>> +        ASSERT_UNREACHABLE();
>>           break;
>>       case TASKLET_scheduled:
>>           clear_bit(_TASKLET_scheduled, tasklet_work);

... "return" alone already tells the compiler that "break" is
unreachable. You don't need unreachable() for that. As said before,
"break" like this simply want purging (and Misra is wrong to demand
"break" everywhere - it should instead demand no [unannotated]
fall-through, which can also be achieved by return, continue, and
goto).

Jan

