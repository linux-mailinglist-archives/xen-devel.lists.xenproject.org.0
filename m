Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AE93867C4ED
	for <lists+xen-devel@lfdr.de>; Thu, 26 Jan 2023 08:33:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.484796.751602 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pKwkh-0003hb-DX; Thu, 26 Jan 2023 07:32:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 484796.751602; Thu, 26 Jan 2023 07:32:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pKwkh-0003fI-Ah; Thu, 26 Jan 2023 07:32:55 +0000
Received: by outflank-mailman (input) for mailman id 484796;
 Thu, 26 Jan 2023 07:32:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=71dA=5X=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pKwkf-0003fC-Tk
 for xen-devel@lists.xenproject.org; Thu, 26 Jan 2023 07:32:53 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on2074.outbound.protection.outlook.com [40.107.247.74])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a46901a5-9d4b-11ed-91b6-6bf2151ebd3b;
 Thu, 26 Jan 2023 08:32:52 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DBAPR04MB7351.eurprd04.prod.outlook.com (2603:10a6:10:1b2::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.21; Thu, 26 Jan
 2023 07:32:50 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389%7]) with mapi id 15.20.6043.022; Thu, 26 Jan 2023
 07:32:49 +0000
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
X-Inumbo-ID: a46901a5-9d4b-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZzUgLNJ1riouUaAL0jTs8K6XJgRWWw3Ep1vI+4+c0OOsxaB3pDMqM4Qx4UbwF/4gRqoR/Re8LXyOxHrO5LAMRaEyeGiWQJ6uBqHwOqh6Gj+5qvgqa6Cm7e7a4Vn1s0kKkjd0Ivxq11RUi5g2Y9b+DnGLCWOjl8y9EP3G30Pd8J2FN1cYhvUGs4nxP8O2iPNrbhFyw+h5Mn/S2ij63Aq1LJNhFQnwcZC0rLqwbyEkVciMIRqKMnnLjrbRv4n4BdLRzXyMTNnuAUGAAXNG8fhNSewPnysZSjEhg8l/ZvqMm79ApfRpXE3S5PJ9/yPVVGPa+x/SCnGc3lTworHGQVNJKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=211q3Ct1tYDPKt6ZFKS3g1+8GWE4XUWKff1Fz9CZ/fA=;
 b=ccJWDvxF+hTCaYQ08VMT+0Hv8utlzb+EbcMPgkwE2XFCgY/npUFybDTNQ7a/iA891vU3F85GbUNZwFNzYzHUvZRNVXi+KG9lo4kW+4xV6B5d9IGlGtNu0KVRdzRErZyuudxLKa4b/11j2rWYnDiXVewe56T6xeOC0YI8LzoQUpmopp3WyjAzD7SC1kxVdS5if4ZXXLB8fofR+ZWK5bixTtDdfQYGoS8Yn8/+PSmlh0HMsSL4rQVTeSmj31XXhgBiSSp2OMYv/Mz1bP/Vc/BkgtXsU3PpCQpdFruGE3/Q2Pl+Vf3uKNTt+L2V7lAwACB7ZrmdMne+YEcWuc0UHrKcGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=211q3Ct1tYDPKt6ZFKS3g1+8GWE4XUWKff1Fz9CZ/fA=;
 b=XJggrCQ0H4FQ9PQR1JXjlpiQErgGSgIbGwRS4YJK5Ohz0KvEcXIeCtfvzOi0oENeN8J7O9ycaevXHtsPQ9t1y1ABgU/4eAYtE1yRUfQwps14dOL73mtl0yI7XAtsUNTd/3tuafwSV7jodOtU1hIfTp3QvCx5JEYRa5z5L63pw5Z7FgT060lsiYSksGVm1exZqo1BsDoxsgel9wEGcKfs3XUgum3rZg+5Pnma70JKzZYxhjTCmyXf5Ld37C9bfJGiL+lBiaG5sAQBOv4POnnXcjKeLuhrGBapQo8B3bS3YvcnFz2TMf0hOXG0Uqv+bK8m/MSS9BCGHntxOiEoQcYGgw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <101afc13-d952-b3b7-7594-ab219bd471cc@suse.com>
Date: Thu, 26 Jan 2023 08:32:48 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v3 0/4] x86/spec-ctrl: IPBP improvements
Content-Language: en-US
To: Andrew Cooper <amc96@srcf.net>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <930254a6-d0c8-4910-982a-bfd227187240@suse.com>
 <a4e9272b-6110-e041-13d0-6746f721135e@srcf.net>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <a4e9272b-6110-e041-13d0-6746f721135e@srcf.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0096.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9b::19) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DBAPR04MB7351:EE_
X-MS-Office365-Filtering-Correlation-Id: 4931f041-61a2-46ee-3065-08daff6f86f5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	R9gqL/Dl3qM+LuIUvo9Qsw4pz9BGNBGABRRyGHv+k5bSrb31dVVzrwHLdkF4nlUXE/h5vMw6kpGYPlO/q6RxZkeHlSjbkw9OYvFr83gaMFAyJ/Y/RoH8cyR3V8op53NmrOFGbw0CgNodvCnhdg0RMO+/eWUZy/pXgckarQvTg7/9JwAT46WEg+6P6VaOOn0DbOXYFuJhFHH2nagujZsdqeNl5pdkmGC7j01wvKpPywaxr5d40QJsy3FXePfEESI0G27uopA85AkOu6uIjItRlfHJjyA/D0eoMZKGwhWl/r6vKeJE9YaFs2usmnJ4KuuIYos1UExEdqe6PkcKuZPtjn8iw+aoYdGovjOA4JrI23Wa4fbiqSJkRVfhOnbDSfAG2QIFi4oiv1eCP1E5JDFYDlkrQ1Gm2zdWP4Zzhmw1JiXRc1AutFeMlPU8kO7xn1fklt4P00GsT13k19mtr6LOaFKnLZ5bILgVq4tTA/fl0n4zJ/OAfOXkTnXQQ7V2JrxLe5PtHNBzoup1zHjVhBt7fmv7Mc6ZruPzwmyu/QrI0sqQoONUO6k3ozQawRhnkH2Jfq5x/QqyTPHSEyTM5GrjDlab0KpK7BX0xyVC7rqpobSfMZbwrtLVRxS8YprbczoiD7fGhtoFpUsm4NfU4q2XWv/UxxqQ3ww7ccZnQSRTuvEmhLa6no3Dcm4EcrIjWvPWQ2bi/Bew8iHDeC7O1IXBTq0ZDwYrvoiMAtsMdPX+P0s=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(39860400002)(346002)(396003)(376002)(366004)(136003)(451199018)(5660300002)(186003)(2906002)(66556008)(8936002)(8676002)(4326008)(66946007)(6916009)(66476007)(31686004)(6512007)(41300700001)(83380400001)(6486002)(478600001)(26005)(6506007)(53546011)(316002)(2616005)(38100700002)(54906003)(36756003)(31696002)(86362001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cjJuTXZ4V25CaXBmcGVVeUtQK0NTZHhHRy9SMklISEMyTkZnNzBPR29kLzVQ?=
 =?utf-8?B?QklyaTV0MklubHMzZ2hrVElOcmZ4aFkyU0lCck4zYSttU2lQbzhSV1BQMWZa?=
 =?utf-8?B?SWlSWVRpMGVBdW15ZU5CbXB2YmFmQ3NqR01xb0lHeW1aYnB2NlZMa1BjQVp3?=
 =?utf-8?B?cjVRL3hWZU1laEgwS0c3RTdhVHQrS3YzTkJZSXVRV0lpV0dMd1djaEpnMlpG?=
 =?utf-8?B?Q3pVeURnY1JrQ2pJeVdTZUJ3bkRQL1puRFRhNjF4Nkh5eGoxYjNVR0hZM3dP?=
 =?utf-8?B?dDFMd24vczZOM2lscW0zbnNsTUJ1TUlLTmZaZHdNcFV3S3dCM0JMV1czeHNa?=
 =?utf-8?B?UEhGRWMydDcxZEgxNUsxaFhnb0ltd1RrOHZTV3ZRUjRXS3oxQldETTNRQU5R?=
 =?utf-8?B?dGE0cXM3bWl6VjNldEF3cTZ1dXM4cW9UUnBFQit3aXZKNldRaEVEOWFIZklJ?=
 =?utf-8?B?ZjN1NUVQSk1jeU9TcGtYR05lcE1qWUtGUGMxZXJaUjRTV3RFSXVvV3FKTEZo?=
 =?utf-8?B?VjUrL1VjMWdhWjJvZ2ljSXRSeHordlBsTE45YXMvYnp0TzNTWWFlOVZjNHRN?=
 =?utf-8?B?TlcwcjVNckx6WXYzNGUrZ1lvZDcxQndlUE1POERmdGxiRmhtSkhHeWRtOW5S?=
 =?utf-8?B?b1FWYVpGbmRvWmNxdVg1WmVZaW5COWcvL2RBVEl0YnlTcm1tZHlXOForL2Jp?=
 =?utf-8?B?VE9RUEk0RnliSlMrU2ZJTHdrZENNVEpIRlhiaUh1Wkd1ZGk3Z1JpeG52dTEr?=
 =?utf-8?B?L01RYVVXdEdkbE1LVHJ4MmI4TnVwQnNvamI4UUVubjJPWEJXa0tIK0tZQWQw?=
 =?utf-8?B?Rk00NXBrcXhVczBlWkFva2RRbFRjRDEyUDFINzBndVJCRmJlY3N0WVo3RXNq?=
 =?utf-8?B?ZE9EQURlUFkrbEhZcVhrdk1aaW51eU42RDFkM0NTWVZ1V3RXU3U2eDNmYUZv?=
 =?utf-8?B?eGZyREpMNWR3VVAvaGlYWk8rZzVaWVdoU3p5dnBWMEVMa2cvS29vUTBzVGNr?=
 =?utf-8?B?M1d2eDFpRW13cTJ0V3FaTE9zMWxmSStoendpZ2R6M2s3U0E1RjBTZGI2QSs1?=
 =?utf-8?B?VUVIY0hvenJFZnZrQmNialBYOGdSQ3orZlpxOG94bUpnSnFKWENDdEs4VTdB?=
 =?utf-8?B?ZTFNYkUvZU9oVkVvL2RoZm1XQXZ0b0V5NDFEZnB1V0pmclpJamtjOXZjWUNz?=
 =?utf-8?B?MVl6VmNlYllPdWFvYXIwY3NiY2QwT1BNNzNoMDdmT0tZNVFKZUt6RXo0ZjZX?=
 =?utf-8?B?bDgycU0vOW9KL3FXUG12SVkxeUpQM3BSNTFKR3grVWw2VXlKcmFKR1VSajhq?=
 =?utf-8?B?UEMvMEF5NXprZW9HN3gxaXozSmxVRU82WTFsNFB2VnFiZTEvNGNPZnJLTytN?=
 =?utf-8?B?K1dUeHpKRklQcC8xTEhNOUR5WTVGN1k4R1d5NTlZeG92UWVIc1p3ZjdWRjBk?=
 =?utf-8?B?OVQrY3VDTENtWjdxZGlQU25xYmVkaGJ3a2hRTlcrRFBucVFIVHRFZmJkM3or?=
 =?utf-8?B?SE5DdXd4YlgzdkdRdjEzS2lnWHNaTm14QXNLUVlWZ0ltNmNXT0t2cncyUlg0?=
 =?utf-8?B?OVh3VEdBazAzbW9UaHFDVi9JOXpzNE5iNFFlcVFRaUxwWTVDeURQcWNtLzN0?=
 =?utf-8?B?UmpXd1RVQ3NvVHcvcmRpV09sV3JoT0ZmdGZhR0QrSXo4Q09vc3hEZFdMNi94?=
 =?utf-8?B?Y2RUSmhHMEpHdEtrWHdUVCt1QUtWSUJvMk9MRElsbERPamtudnZJWVNUMUhZ?=
 =?utf-8?B?QkN0dHVxbE5SNHVLeWFTekl4T1FESHZ3VkkybTYxb3VHMitsV0RRSWNYUEpN?=
 =?utf-8?B?Z3pFeWlJeTR3OFRxMHFFOTJhZkVSZG5rWFJXT2ZzYTNQRlV5NFBVOERXVnlG?=
 =?utf-8?B?LzUxcmozU3o2VStVN1Y0NTVBb0N5VkZ3SURBMXBGaTNaVkdFaFhydFgyblJT?=
 =?utf-8?B?VFhYWkVRNGRrN2w1aWl3NVI3bnZYM0w5RlJhV0dUSmJZNlBsM1ZYN2M3UzJL?=
 =?utf-8?B?YXVwL1liVG1OSHYwdzcrWkRrUnU4OUxOWFpNckpGbXIvOUNJKzdCTnRjMkta?=
 =?utf-8?B?QjAwVXpUVmp0NUxOSHlITmtoRnZMd0xsZEQ2bCtidUZzV0ppMEFDeWh4ZU5q?=
 =?utf-8?Q?iEELosQokW5UATgC89Y/VKFIn?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4931f041-61a2-46ee-3065-08daff6f86f5
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2023 07:32:49.8421
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qumHtgoNJLZL4BAUzPRA+vLHGyjLt9CkKj2a3L3XC9hqV10HKUJuSW9So3qOOnwYEQdnUMQUHuOmKqKnnF5WJg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7351

On 25.01.2023 18:49, Andrew Cooper wrote:
> On 25/01/2023 3:24 pm, Jan Beulich wrote:
>> Versions of the two final patches were submitted standalone earlier
>> on. The series here tries to carry out a suggestion from Andrew,
>> which the two of us have been discussing. Then said previously posted
>> patches are re-based on top, utilizing the new functionality.
>>
>> 1: spec-ctrl: add logic to issue IBPB on exit to guest
>> 2: spec-ctrl: defer context-switch IBPB until guest entry
>> 3: limit issuing of IBPB during context switch
>> 4: PV: issue branch prediction barrier when switching 64-bit guest to kernel mode
> 
> In the subject, you mean IBPB.  I think all the individual patches are fine.

Yes, I did notice the typo immediately after sending.

> Do you have an implementation of VMASST_TYPE_mode_switch_no_ibpb for
> Linux yet?  The thing I'd like to avoid is that we commit this perf it
> to Xen, without lining Linux up to be able to skip it.

No, I don't. I haven't even looked at where invoking this might be best placed.
Also I have to admit that it's not really clear to me what the criteria are
going to be for Linux to disable this, and whether perhaps finer grained
control might be needed (i.e. to turn it on/off dynamically under certain
conditions).

In any event this concern is only related to patch 4; I'd appreciate if at
least the earlier three patches wouldn't be blocked on there being something
on the Linux side. (In fact patch 3 ends up [still] being entirely independent
of the rest of the rework, unlike I think you were expecting it to be.)

Jan

