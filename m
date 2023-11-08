Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8884D7E51EC
	for <lists+xen-devel@lfdr.de>; Wed,  8 Nov 2023 09:25:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.629227.981262 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r0dri-0006Mx-Gi; Wed, 08 Nov 2023 08:24:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 629227.981262; Wed, 08 Nov 2023 08:24:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r0dri-0006Ka-DT; Wed, 08 Nov 2023 08:24:46 +0000
Received: by outflank-mailman (input) for mailman id 629227;
 Wed, 08 Nov 2023 08:24:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=d36Q=GV=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1r0drg-0006KU-D8
 for xen-devel@lists.xenproject.org; Wed, 08 Nov 2023 08:24:44 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20601.outbound.protection.outlook.com
 [2a01:111:f400:7d00::601])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 43eab6cd-7e10-11ee-9b0e-b553b5be7939;
 Wed, 08 Nov 2023 09:24:42 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DU2PR04MB8599.eurprd04.prod.outlook.com (2603:10a6:10:2da::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.17; Wed, 8 Nov
 2023 08:24:39 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44%3]) with mapi id 15.20.6977.018; Wed, 8 Nov 2023
 08:24:39 +0000
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
X-Inumbo-ID: 43eab6cd-7e10-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WoUl6idtcr+CtA9UPZ0BOcvp2QxPdI+epSTHs9hbuHmybiHdo93/9j/hJdFU+k8cc7f+7FZQCBjI4cr8RGYFyx6/vu/rBHNuDfmQZqKGCexyHsNjmkSC25rMKQwjko8yVvHdEKIP+81WSR+HSpgjiyWExa/zGpguU77/1fyTH3XYTdaUZI0sSmLDoBXDfywJ20N8jBgeKfjJhwtmIndScLkuqzJNh7z1iJtnaCRcvKE7hpYaTPJHIUTouM7WSbGg3DiQrf304dQ3sztIoI1k8qj4jYq4g3Ml+qZ9nQhnguTrT5mleOA3HUh4QxynTTeqrajFlbfMplfZrQmbjY6euw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4k2I7rMtePHodnnE/F0J8bnrAivnEquTzBtf+BHUxBY=;
 b=TGpZDmAefSSbqsv0DE8UG4uzFu5LkZIUg0D/Pt1c5k+NZ+A1O7APYRrW9LMy6xVhwGVSeLh9QwaOL7BFPwakzQ8lTLYgNiNI1zs6zbL82Po4HObu5HAhbdIg5WDu4oiyCDa1q6YNSzySozY/+ZS/DiQ0hK9Kt5sg4dgDTF40rnRoH3bvSvPZYYDQQWPI/+j5zAA/S2REdzm7YnLFGBj0OANR7+u1/bSclEmz+fiWEsS9g/T6565CPnXEmHoiiNa4At5Vl6kAhop1JTk1NvTSKjcOpd5okvdbtis1YCIYdZsJGRCTPWMZbgFKnoW0fr5DIHaSmDFgXv9N++ricUqjqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4k2I7rMtePHodnnE/F0J8bnrAivnEquTzBtf+BHUxBY=;
 b=XAmIGgKzRDWC9B8mml5sEUGtKCC5JSpeekb3laFkC2EDldciQzwuz3MAWUoxOdAKTuBqA7Mm2/7WoBw9a0MjbDj27mlKsKkfs5zV/s7DV2pW5u91Bem58rOj4Ew19uBZVPcuTHWtNA73dn7+hkendJklFiN3V+BwW27UQXx9zV+wgR+G778DpnuLWriWsKuKbJD+jATQx+UaXNNjluIVRoQcy63g0VgnL38g5UUV9ugcb/4xomS8YPzzXC5jD0KEkOFbBG7ecyrXX2TFZLXyK9b5hP6FJ/4bQE+Ew3wO0vwlb7DJRqxhWAPA2ODogthlOmGPhesKebnYnVxxzSG1QA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <d67ec7e2-a606-ed62-150f-08e3c1c9aabe@suse.com>
Date: Wed, 8 Nov 2023 09:24:36 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [XEN PATCH][for-4.19] domain: add ASSERT to help static analysis
 tools
Content-Language: en-US
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 andrew.cooper3@citrix.com, roger.pau@citrix.com,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <3f163bb58993410183229e72eb1f227057f9b1c7.1699034273.git.nicola.vetrini@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <3f163bb58993410183229e72eb1f227057f9b1c7.1699034273.git.nicola.vetrini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0199.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a5::16) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DU2PR04MB8599:EE_
X-MS-Office365-Filtering-Correlation-Id: 52919125-9eea-4854-f5ca-08dbe0342658
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Y4pR7eFP7HK8498FxASgD42Z5nGZEKfUCISxkUTye+GaZvpy2iWNhkv0P1X2AcL9gM5hFEm7eWAzjpGMLDpj13MSb5/2VE3C2YrU8HfSvemBviys9R7wQjKxLoPKgIjXClsIef4g8SRG5EgqPyoP7erfPqkNe9HGKXNUVTiZXI1UK3xPabGpSyTJIiKFBaYYYw2y2eZUYbTGmow/tmFM/gYSkkBhkPTk2hOxf/UBX6zBwQ3EMtZlgismIm/Xap63O+TPhX8jyLEKFGhFqXt2+zabQhI2NJT4dSoiREsi7KBPXOq03AUfQ1bWmacO+gtFnx+jkWAxKfiyR524yt+LgrcMvfUbyTRrddp3y7WhlVdkio1FKVEQUV5l5kZ7Fbk9FGDbsBylI7MFOkQyxIKhFhWvMiktWFpKETqFhjIhUZFgtAjkQXDgl8T+I4CqTmUINoGiJNmi6fF/XVWnafRZUi6QD9g2znlnJowQNv+riWqN3WAzKxQn31UBGfcqKM6KS6cQW6f2IiW0KYPbrgDrzpYZZZC5DH2jfC8EilvBCK9V/rt/4zHDnVLYj6tzIDaZbtQnV1FvNGXqcEqu581Ne1G1+j92xes5+06oHnC9aaLptHxJcBAWU5GLPNc+aWiqvV+a2EcL6p1+jsGBAMFA5w==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(346002)(376002)(39860400002)(366004)(396003)(230922051799003)(451199024)(1800799009)(186009)(64100799003)(86362001)(38100700002)(31696002)(36756003)(2906002)(6666004)(6486002)(4744005)(478600001)(53546011)(7416002)(6506007)(5660300002)(26005)(6512007)(2616005)(4326008)(8676002)(8936002)(316002)(6916009)(54906003)(66476007)(31686004)(66556008)(66946007)(41300700001)(83380400001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SUNOL0oxcUVTTUtHY0ZKc3BqRDlna01XSWhZU01jSzFsQ2NkMWw1MWNHYzdQ?=
 =?utf-8?B?NEE1V2tEOGRVVWtsNVE4NTlwYm52ZzdyUHpZeGJCUnpwaE5sVkFBOVdRdDRU?=
 =?utf-8?B?djBsUFhONlp5RFJCcnppYjY5b2RUekJ5R0hPQXBzQWsrS3c0aXRCR1IzWmpH?=
 =?utf-8?B?cUlQMnpFWXNoYzE3VmQ5WFdsd3hxNzM3SFhLWEZwMnBhTWFyYWVaTmMrdFI1?=
 =?utf-8?B?bDZXa1F1REhYZjZQRlpDSUY0cVJ2Z21ic3Mzd1pJQ3ZzQ0pkeGFjbFBuNnN6?=
 =?utf-8?B?d2wyalhZVmxIdVpSZUUvb0laVWRGYXZjRlQ2MjJBdGF6bmlSay9aQ2RyY1Mz?=
 =?utf-8?B?STg5UDRiVDRVMTY5eTR1aFhHMmhNY0NmUWJtY3ppb3RhbnA0Ym5CemNsSG5v?=
 =?utf-8?B?Z0pQUEI0SnZVTkhwSkZHczF5TklFbkhBTDc4UjhMblFUb0FNcUpjbkRuM0J6?=
 =?utf-8?B?QzljYkVuRjUzdlFkYy9UMEJ6TXZGek1zYWpKcmczMStRSFRZWVUyaURvQUxh?=
 =?utf-8?B?TzBpczZ2OHNkUVRRK0N1dmlGZzVzUTZhQ2xRRGdqekNHNEV4Mm9hNXcraUtw?=
 =?utf-8?B?UXVNcGU2WkI0Z1dqNHpNVVNvdzk4RU15ZEVxdWFKWXRzMGIrdCtZRVlHSUdJ?=
 =?utf-8?B?M3F2bWVIT21IankvZVJTd0ZVTVhXNzlJVC9JZnE0MnFDUGRGYTVwUm4weEoy?=
 =?utf-8?B?NjRFQ2tYNmFvVDR0TDQ1Syt4Qjg0dzBOa1FXamlWL3Baa2lUL2ZrS0l1NVpP?=
 =?utf-8?B?Z0NUMVczaFNubmZPVFlTcktRUk8vTG9Xc1hOY09hZkZGSXpnbm9DY1N6NkxO?=
 =?utf-8?B?aHBlNEsyOEU3RWNyREt4NU1ndDJrdHBOWEJIT3Fqdmt2cHBGTkZNOWZ5Zkoz?=
 =?utf-8?B?bGV3QWtQaHhDaHZDRXJtbVFzRWh3K0szdGFmWHNjZnF0Rll0ZzAvajd1NnU2?=
 =?utf-8?B?WVFPbUNyVGxJcWduakJWWG1xT1M0WFZUT1lnVXdQbEFPN3FJWkE4elBvTklq?=
 =?utf-8?B?NkErTUZ3YTFhL0cwZ0NTMTZ3VjAxUDlkYkl2VStIVUNnMUNycU02cE9MZWpL?=
 =?utf-8?B?R2tmeU1WSEQ3ajN0OXRza2lLU1MwZ3h0ZnJmVkZCbkdPNUdVTUtQeUR2eVV4?=
 =?utf-8?B?ZUJYMzF5cVcrUzJZZHJ5MHFVMGVsZmRsMmRlbkdiTTErTlUzSWFpaGFNdXdM?=
 =?utf-8?B?ZzQ3TnU3M0tLeEtSWFhINEZuM2dsZVpIWDFaSTlEMlFzK2JsNUFBS3N6RTUv?=
 =?utf-8?B?am1Md1Q0MVdKYzlDaFJTVUFVTmpiVzlySUpwTDU1QUhGcyt6c3hlYkpvMmtO?=
 =?utf-8?B?NENqTFNRWU1nRGJDczkxaUFoRzRmQno4SDVNQW9yKzk3enE4VDRhK0pwdXU2?=
 =?utf-8?B?NWtyT3dLYnJCZEFLcTY5NXU1T25lZlkxaWhVak1kNFpoRmhaODh2Y0FRUUg5?=
 =?utf-8?B?eXFRUk1nb2V3TE5ZbGI3NkR1WlVJcnVjMk11N29CZlBIVkN3djR2OGRTWVAy?=
 =?utf-8?B?ZmFoMkZOV28zVE1uR3c0NTNyZzV2NHNsQjg5MzVMNEZOWDRPbjhFYXloNkFp?=
 =?utf-8?B?bXFZVVNlWTRIRUFaT0t4V1piQ1d2cEZCdTFXOGNRckQrV0laOFJLTjNtcFJR?=
 =?utf-8?B?SSsxUjRlSUpMYTRzVHdzRVpiR094RlpkMFhpVHlpb1FpYi9FOWcvQU5SZ1d5?=
 =?utf-8?B?NjAzWGk5YnJSVXVLQUg0aStJU3RnNEhBbzFRUk5oLzlPOVRZZUlKVTV3d0cx?=
 =?utf-8?B?ZFFmNHhUNXVEMnZsUHhwRXFLdjhibm9UVzgvZGRKU0ZrdnRIUUdiM0NtN0R4?=
 =?utf-8?B?T09nRDZCWGt2ZlFDdEJHN0pVZ3RFNkxObWJoWGpGZHJ4SElXUGxpWDZVdlpE?=
 =?utf-8?B?VzZlQ0Z1ZG9sMldzSFMwT0Z3ejFEbWgveWZGN1o5WVdtSUcxVjBsajVRUGRY?=
 =?utf-8?B?Si9FUlp5bGRpT2RCSEJRRHpoeDhITXVLbjA5TzVKWDIwOXN3OWprYUFXMXh4?=
 =?utf-8?B?Y0ZkTlpkVmRvMkQ1bmRYaHVjTTE3QXYzazloc28rNFpVMko5cW1lclZBNjVB?=
 =?utf-8?B?Z2V5MjFJSGh4b2Nwbk1OVEs2K3FrNHhRcWVwUkp0WGN2N2w1Nzg1T3d1WUt5?=
 =?utf-8?Q?f2A+ydKmTA0O9PB7wUaiDppm+?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 52919125-9eea-4854-f5ca-08dbe0342658
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2023 08:24:39.0999
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 45v8CzDOiqGokSNOxC1BuX5v1+7KCu6GmkdRPmfVc8MTGWp1SraQd5rYvxufq4Pm3VcRrCyxWJvkC8R01J5HCA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8599

On 03.11.2023 18:58, Nicola Vetrini wrote:
> Static analysis tools may detect a possible null
> pointer dereference at line 760 (the memcpy call)
> of xen/common/domain.c. This ASSERT helps them in
> detecting that such a condition is not possible
> and also provides a basic sanity check.

I disagree with this being a possible justification for adding such a
redundant assertion. More detail is needed on what is actually
(suspected to be) confusing the tool. Plus it also needs explaining
why (a) adding such an assertion helps and (b) how that's going to
cover release builds.

> --- a/xen/common/domain.c
> +++ b/xen/common/domain.c
> @@ -700,6 +700,8 @@ struct domain *domain_create(domid_t domid,
>  
>      if ( !is_idle_domain(d) )
>      {
> +        ASSERT(config);
> +
>          watchdog_domain_init(d);
>          init_status |= INIT_watchdog;

The assertion being redundant clearly requires it to be accompanied
by a comment. Otherwise it is going to be a prime subject of
redundancy elimination.

Jan

