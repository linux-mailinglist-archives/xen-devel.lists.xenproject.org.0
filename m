Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 91CB66D66B3
	for <lists+xen-devel@lfdr.de>; Tue,  4 Apr 2023 17:04:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.517951.803993 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjiCj-0006f7-95; Tue, 04 Apr 2023 15:04:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 517951.803993; Tue, 04 Apr 2023 15:04:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjiCj-0006ce-6I; Tue, 04 Apr 2023 15:04:13 +0000
Received: by outflank-mailman (input) for mailman id 517951;
 Tue, 04 Apr 2023 15:04:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7Jsu=73=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pjiCh-0006cY-PF
 for xen-devel@lists.xenproject.org; Tue, 04 Apr 2023 15:04:11 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20619.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::619])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f445bdf1-d2f9-11ed-85db-49a42c6b2330;
 Tue, 04 Apr 2023 17:04:10 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PAXPR04MB8441.eurprd04.prod.outlook.com (2603:10a6:102:1d8::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.35; Tue, 4 Apr
 2023 15:04:07 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%6]) with mapi id 15.20.6254.035; Tue, 4 Apr 2023
 15:04:06 +0000
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
X-Inumbo-ID: f445bdf1-d2f9-11ed-85db-49a42c6b2330
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dJ3Jz95BAxaEfcUaLgmAxhFzC8qLu3IZw8sFwrIRSH1rbAEt3wovjz1er+uWoudXh4SO5n4cxqWimMr4wdN4X3PV8DKY1BfIiqTKjGExrfaS2AJSniTFewGmegkrhsANOmMRVCE+y1THeBLAMoF/b051JaYVFy40k/KJrXoBlVEgELkmqrYAyI3YL9ukilVbiHTSawtUhEn1SKNOeSgT0ZruPRhlW0s/KCBsPHbU7PXVGZx51PsrcUhHY3sjsgT1DCJI6CFWsYuMfquChj7AqMpNKMgX0DsAU7du08xAafG+8XV2cAZnmfE2zxaj1B7N/bvY05nlePp9/as3DlA7Ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kGuOQTAuPBRa5775jCnhEJmWNqlJN05jP5ku+zddE8M=;
 b=bPHKoqBtX4UszgXQ+YE/snVgbVrJrrnXNk7M8mQI8EmKR5zPZo9UrMItRa4WmX5fOPjnlvb06mOetimF4KANC11W2VX4Maqk7v7LDlv2WEaAuhQpULk9emx7tJZSgJuMNZb10NobYSOvweevpiUzg5ereBjnZ4+IkfTaxY+stv+i782BHYeyTwQ9WKeptJREMxJkJ79uKCfrPu+RgXvrQpVLieTtwz7pUFHAKvMs4dX+DH3avQIQVk5EAK0UJKHl/AQ0iDj1cV7JMgArfCsKsSbgRbQ1nuwV6cHpJbC7e5vnhDfyueppiIyhA3kxcanCTCP3z4mloJKyYjt2yIxVDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kGuOQTAuPBRa5775jCnhEJmWNqlJN05jP5ku+zddE8M=;
 b=3r7anzR6MHKgnJE7J5DFvb/doTrtD6kquzUZ0P6qbkv94vEAL9HKvbpwRVDPGRCUtM6SsZyzas3wYOX7Q5zm9ZMRcXPbU26PLW0XrP/RfZZejtShoR4lN6xCQu46Vph4bl7KtvLiobiZKr36t3WjN3UXV/QUaAQgRaR31hxPYgdDYldVpKPdOU992+vrloK3xYVwI63bsWrOP2FbRqNn/khZEz5MTMKmOFmvlMDJjKVNw50YYs3pwoeea3X+yxUGOrwb1Jb4VFEyWHOuljZpAc+E5OHQlkCBIYEJ+HK1oiKMU+7qjfa5vGjEtnhC9IZ2vuSu22NBG1kpERkJjs1qcw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <60e92022-e383-6382-ff50-d6c67e2be227@suse.com>
Date: Tue, 4 Apr 2023 17:04:04 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH v2 10/15] x86/boot: Move MSR policy initialisation logic
 into cpu-policy.c
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20230404095222.1373721-1-andrew.cooper3@citrix.com>
 <20230404095222.1373721-11-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230404095222.1373721-11-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0007.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:15::12) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PAXPR04MB8441:EE_
X-MS-Office365-Filtering-Correlation-Id: a6150b87-a238-4ad1-c5d2-08db351dd5e2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	41epBBVYVpwblG2jiHD/PvMA2phDRHb9KdSeOXbNd0oGKaPWEqsW0SsDl/+WOZaev5cQJppfEwyGNj9yAlYzvMjhHdf2VrVXLJ2Z1BjI7AGyp9Fu/n+clBTlrmPifGqg1bq5AjsxCzWsrSOcCsZUjlmUHKE0vhDXVYOaVALk6AcCGcQWs6aIH8FzY+vGOAnK1J3jWDo208WAt0xjtuWKPkR/zvmhIK/b8uAth5wlR6Y8XxYsRtRkwzK5ilVyU9d8Bj8qWyc5eHC04AXC8AkcwRwDT/Ysza1oiKBwlCNiCYAoUgK0ImWJfcQuaEwlsZ7JBlZozn9NTrDbssknxyEAae4BLLC/Q0WdZKujTfONhE5wdYHGPl2RNJ3OhOtlhbg+91idHNXUaP9mZnF8w9I2AVQgAg0a2r8Q/n2+I4kdWxh2S4s0uiM8gumBUwvrt3CLYfadyu57eHG2bsSyBsJ7iQUinwnKpQzaYlpGgQXVcOJW+bFKFTkrG4zRCvx4mJLDt48benIWYUlhULTX5Er+rASjaYex8OpLZkVYVe8XCS7tVpC2Fe8/hvRf5g99SFWGj+B5ShsxBF2FhuaxP0jg0xQb4UYv3qCn16LgrhF/u8SR8leoi1htFadjRND+XdXdIOgBsCi/Y4WfO7aKspRfUA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(136003)(396003)(366004)(39860400002)(346002)(451199021)(558084003)(36756003)(38100700002)(31696002)(86362001)(2906002)(6486002)(6512007)(26005)(53546011)(6506007)(66946007)(66476007)(6916009)(4326008)(8676002)(66556008)(41300700001)(54906003)(478600001)(316002)(5660300002)(8936002)(31686004)(2616005)(186003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MHQ1eWpySVcwWE5TczZPYkpGQVVYKzAzdXRaQlkzUFJMOERCdUkvQ0RFMUJk?=
 =?utf-8?B?SVZVOEx4ZVB2RGZ1R0NzS2phSUxtQU4xdURnZy9jVytYNkVtYnU3T2R3ZndI?=
 =?utf-8?B?K2wyaHRTeThwQmxlOHVzdFVkNTdoZUFOMTkyS3cvckN1VnZMUkVOdjlMVU4z?=
 =?utf-8?B?czNqYTlXaVFtMExqbnZzTWFWRW5XZXFVaUZxQmEySFJZUjJua1RFTFBVRGxj?=
 =?utf-8?B?RnN5UklYOFhHNWlFazdHQjh5eWw5dUFMTkhmdlNKeE9mbmk0Vmo1OTQ4QXJR?=
 =?utf-8?B?MlkzRzdsUFVUTU5TUXE1aVJrNEFab0hrUG5ORFJqWU5XVlN4ZjgzekZMcXdK?=
 =?utf-8?B?cTdPZTNrQnNtODhPOHpTWlBtQzl0aHA1ZjdPT3hRQkQxTkVSc3c3Tk8wVU4r?=
 =?utf-8?B?NSsyR3Ixc1dON0NTQzVLMW4ySnJuV3NpZlFwZFRsTWpLYUhuZlh2TnZWZlVZ?=
 =?utf-8?B?R0U3dFRRZWdyK0kwV051RDFpRlpiTkZNeENrdmpTUlo5RjgyQi8zNU5IMWJq?=
 =?utf-8?B?ZURIdzRyTmNZZGdhdktpblBrQVhOTHI5bk13N2d5WFNSbHVJUzZybFZRR3FV?=
 =?utf-8?B?dU1NY2l6bktNYU9kUTFNcVNyNmJvMkRnQVQwZVlTYWQxNkxKN0VTMWJGUkln?=
 =?utf-8?B?MXkyMEpJU3BzdG81b2JFNmI4SjI2UzlxVkJ2TEt6ME9BQWdQdUF6TGcwQW9m?=
 =?utf-8?B?dFZUN3ZGMFMwdXNaNlNidlFTR1hRYy80aCtWcldYMFBUS0RXL0R6cUVmNmNO?=
 =?utf-8?B?R09VTldZMkdKMFplSTc1MFM5QU8vaGVFNnh1R1FnazAyZTZvVjFBMXpGR291?=
 =?utf-8?B?RDdBeUh0SGRmWTZicXQvVi9zdlBrcCtKci9wL2o2SUdxMkRCNWg4d3JvM3I5?=
 =?utf-8?B?dEpwbEdrL1h6QXN0T2VhaEV2SEJNQkEwa1ZDbXpQR0U4RnZGeTEzMEh3WnJB?=
 =?utf-8?B?SEV3SzhYVTgyQjBQdlVGUFBDSjFjM0xnc3JnQnlCQk5mRWdaSHA5QTcwcFpn?=
 =?utf-8?B?cHcxQmtHSnkzSTdhQW03bndEVDFrMWJNclp3blZTTXpLdFo5Vy92WmhsLzln?=
 =?utf-8?B?S0pjbGFQeTYrNGJJY1NLS3FKMFgwR29YQzBZcXI0UGg0dUNKT3AxcVA2TmtL?=
 =?utf-8?B?SHJBZkVDcFRUVHRKbjB0QmI1YURyQ2phZGkxelBjdUZoVElRUTV5cis1QmVZ?=
 =?utf-8?B?VEV0WFRwemNXOHFWTUYzSFF3U204NUFOMUpTRjdiaVhzemxvVTlULzZBcmZk?=
 =?utf-8?B?NWRLKy9nNjBKbkNSK3EzRFUyZXIxV0dzTXAzWTZ2WXprcnlXbHEzVFlrMDV1?=
 =?utf-8?B?bEVocXJNcE9GVFVvenZPTEU5T011emxBa3pJQnJsbndYZWFRbHR0NitCWng1?=
 =?utf-8?B?SThBSUM3RHdYTDB4Rmhlb2ZpS3ZRN1lZSnZESWk3VlVvL2xCSXFsSEhuR2VK?=
 =?utf-8?B?czlRdWprTUVROW93c2ZvMlZQOFdNNFFiVmt3VW54cW1POXFOdTUxYlY1NWdt?=
 =?utf-8?B?MGFuUjBYakpPdVluV0puUU1UZFpvbXorNm9VY1pYSDJWWVUrV1BHU2NUNStC?=
 =?utf-8?B?eUFZMEplOFZqRlpTZEpHQXl6NFB3ckNwZGMvOUJYM0pDOTR6ZzlzWllZYmZn?=
 =?utf-8?B?eXlPRm1IMm1EcGRMbGtsUjM5VU93TkdzKzZmZlordm9lZ3Zzdk9yc240bm82?=
 =?utf-8?B?bDB6Y0FwbU12UjNpMWlWN2JIOTd3c3FaQVRyalNtaVdRVithWGFDRkNRbmVE?=
 =?utf-8?B?Z3I5K0lyZ1NBblZYd3Nkc0ZMOFJjWVJFMUc4aktWdWwzMHE5STJMdWFKT2xt?=
 =?utf-8?B?eG5uYWJGZEgrN3AzbytCSUQ3SzRjTm5ZenpQcm5qclpsYW9mK0EvT2pmb0JE?=
 =?utf-8?B?b3lsV3ZpRFNudVVzVis4QUpYS29HZFh0S3RJTEZSNjFkaGw0K2pkWGZBRGxr?=
 =?utf-8?B?dklkVUJXWjEyTG0yTW5LbEFONU5rWHdvVWdldUxIWDdUR3FvbmJrSmlSV3N2?=
 =?utf-8?B?Tk90RlZoaFptVHBwZmk0cDZ6Q2dTOG9GMklFMlR4YnM2bnl0YUtZSWlMV1Ny?=
 =?utf-8?B?bytaeXVXbWFmZVNHYnFkL201dzVpUXdaUkt0eUpvTXBkWk9IaHRWY1JOMGRm?=
 =?utf-8?Q?9UAn50KisctOjY4IGcwt38JV+?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a6150b87-a238-4ad1-c5d2-08db351dd5e2
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2023 15:04:06.3767
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9q3EroGxX9ZsllO2HRY9CHKEhpxsU4NWaQXvzhsvfy+1fuMW/Fa4zcpMwwU0/xRoFzRHqLfWkNHmLse4EdR8MQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8441

On 04.04.2023 11:52, Andrew Cooper wrote:
> Switch to the newer cpu_policy nomenclature.
> 
> No practical change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Jan Beulich <jbeulich@suse.com>



