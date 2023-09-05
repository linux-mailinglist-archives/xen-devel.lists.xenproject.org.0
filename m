Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D7310792109
	for <lists+xen-devel@lfdr.de>; Tue,  5 Sep 2023 10:37:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.595460.929030 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qdRYY-0000m4-BR; Tue, 05 Sep 2023 08:37:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 595460.929030; Tue, 05 Sep 2023 08:37:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qdRYY-0000il-80; Tue, 05 Sep 2023 08:37:06 +0000
Received: by outflank-mailman (input) for mailman id 595460;
 Tue, 05 Sep 2023 08:37:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=JoEh=EV=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qdRYW-0000if-Re
 for xen-devel@lists.xenproject.org; Tue, 05 Sep 2023 08:37:04 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on20608.outbound.protection.outlook.com
 [2a01:111:f400:7eaf::608])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 62e6e894-4bc7-11ee-9b0d-b553b5be7939;
 Tue, 05 Sep 2023 10:37:02 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AM9PR04MB8305.eurprd04.prod.outlook.com (2603:10a6:20b:3ee::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.33; Tue, 5 Sep
 2023 08:37:00 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654%6]) with mapi id 15.20.6745.030; Tue, 5 Sep 2023
 08:37:00 +0000
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
X-Inumbo-ID: 62e6e894-4bc7-11ee-9b0d-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dVFKpgH/BbJf9tK2sJuc/hkaA4Mk07MqCV9LjTSwGdcMU8R5r9gyhwhUUcJOd7Pbg1Km719BOmflo4vR9Q7hSm+doDMWVu7/FF2XDPZMB/HePRqMTVq1V7hMkJN7ddLWIecjpGOvZl2pqBYCpUO+G03ihyicOhbAvBttm0J3Yga1rzbUFtwc47KiXBEShhNLbm4HazWNBfmYOcSn+IXYZ6zHkMc5AFBL5AROe64876spj/9AFJdUhvCy4rHU43UAnoPZbIcejTeyv9qavEcq6yA9+fjfxkjpO9bcu24uGPqnd7yUtyYqaaxQ2MBw/hjzS2lWHLmYVwdZ05Zyql2m+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PodOGwYb2dB3wHOO+VCt4Tg169CUtnUQRoGFdlfnJBA=;
 b=n2J3UzCDWjeYj/oSM++NwdQo7nSqqcDDTXWjzXJyBnk2v5pZtCVXqQ7vjki5hBcbuG9JsD4ie90qphwPhfVk0vLN7H1GgjOsElrT5QsYALkguANQZVzcAoRI08uDHSKy47uhqnpTM7s2QljI8dK1meqt2e7uB+CCj9Q+K4gl/X/kj8ZHlYN0rLBQBHculZ/Xjl72QKVSrenEm9t0S+qNVl1NYsdIBH9ar01GL0uLtYP1Xmrtqp8faQ8Jfk54czu/VSBXRoZ0nXaNWgkfkLHiCGSqsJp6tuQDffiac9E8Ka1D1FtDzi+jfDTrX7ru9wrPKhqevkaPlshBCcboPSI9XA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PodOGwYb2dB3wHOO+VCt4Tg169CUtnUQRoGFdlfnJBA=;
 b=POIG6l5KNJHF7y6DzcAnxGI82ZyaNRBlYYjvLwHYP6yDheP8HrU6GTr+nRdV1TyW36lVqZMbfwRdAaOP6wiGXLiDo6f3zOiN9TltImv8YInX28z5EeSMOvRWsPnmmSJBQRTkfmJ4EqZBoVV+jVSC7TAfofR734uhw43vjSZNdb262eq4otKqI28oW/ywkPGlR5AP/T/NpE7z2vMTOjtKJRdVGvMVvFMKnPWgQW33ZCNkwmJR7puB0kQ1AYUnyViHUvElkAdy2QfGJ/EzQ+sj6fo8DW9oHknQ/IBmbMyn7sT17Dp5J0XlbeykRu1Awgd+ty9iWGjZNnatTJ3VYm9biw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <0ae5cc93-6de1-8c37-f6da-086ba1287e98@suse.com>
Date: Tue, 5 Sep 2023 10:36:58 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: xen | Failed pipeline for staging-4.17 | 699de512
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <64f6e593e9f77_28aa2c885476f@gitlab-sidekiq-catchall-v2-5dbc7c84dc-8wms7.mail>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <64f6e593e9f77_28aa2c885476f@gitlab-sidekiq-catchall-v2-5dbc7c84dc-8wms7.mail>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0033.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:14::20) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AM9PR04MB8305:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c1d8338-eef5-4def-2e7b-08dbadeb4603
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Fa1mcWn6R0d/SdZUyWgdndeApb+oalQ+/vyKuzT0IqNapU86apGml7ARz4lUNIEbsnL/edFPN7caEZHvdjGRsaJZyB5A/UvsptyoCYJ1+4LVpdWIsizvipx014YX7Rsxwk+OOZ1q4040jdxnuBi+HWbVtqb7SAo35aCfzszeMsdBpn63ft4/0Y9MPLMRwLlbzcMYhV1wjgu7W5ZgVHD2RDDUOWvJjEJ1Yi4b7OmKFwJ02qOE/WNGx5Vg72eFgxJRa9KhXX+1sAcrNP9Xg038Ph8+4RrbgLGP+W0UX7aB5uGBpoK3Gw1gCdSDmpef/MAHrpTD01/tHsOPKgxY3OaSRMOqPg0JMmgU+EBgfb23NEE17sk2nIdnZy9pTmeQH5NU4mg1h1j9z/iPc+qKBDp4tyzJiOqQK9k8Xsdmxf0NFsJDzs3UUh4yKJj3H2NiE8zD8dfDaZ9MRTpaBuX8EaV8Xnkc7GCgrJZDpNvRr7l5GeTgfal8oEPMzseIQUZ+wCTM+CLG85bVBWGD6FckXcy6ULJdEGUgDuw83vYl31ehgc3cZsbjhBFiSfUDzFHnsThP3Sshv9cd6gkyWTzm9n6PFHKlS+3aLbf8rH7j5Z9x/9ZZc6ewr5KSQro8iedhHB53bS5KCjOcHSDbUBFotEgddA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(376002)(366004)(39860400002)(136003)(396003)(451199024)(186009)(1800799009)(53546011)(26005)(5660300002)(2616005)(66946007)(66556008)(66476007)(6512007)(316002)(6916009)(6506007)(41300700001)(8676002)(8936002)(31686004)(478600001)(6486002)(83380400001)(966005)(2906002)(31696002)(86362001)(36756003)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Qmt5bDJEN2lRbVBtbWpEYUtraWlNdlh6M2pod01FMm1BbTQvQmF6YlUyTi9O?=
 =?utf-8?B?TVFGcmkwNlF3VU1uK1pBWmlDLzg2RjhvcGRwaGlWbXQ2ZEdXSDd4TzBmVDFL?=
 =?utf-8?B?cU04Vlc5cGhoN3lNT1ZNQTV3SnUxWENaaThXNCt1VkVOQ0lEUThnTXZSZ0J3?=
 =?utf-8?B?ZjFlZUI0L2pzZ2dLQmJPUnVDU2Mwc1JRRDVaTWs3TzhzVzlNWDBKZklsOHlU?=
 =?utf-8?B?TUQrL0ZpZ2JxdnhnL0xKWW11VTUrV05HTlg3SjFvZlAyV3dSL3dkOFpGbE0z?=
 =?utf-8?B?bEtZd25xQWJiV1ZsQjE4T3NqaTRCSWJuVlF4bEJGTWlZaFBybmQ2SGZTMXhC?=
 =?utf-8?B?cHRreEp0Zy9qWU82S3VBZUN2R2V6MGxRbCtzVU91ZFpRVTJSdkhMVTNKUitz?=
 =?utf-8?B?MzdLbUZqMzI0T0hObnpYRXNsbGEwOE5zOVZTTlF6b250NUJpRjBwSE5IQWI1?=
 =?utf-8?B?N0M0WFJvRE1vN2t4VmlCclpVTHpLcmdoY2tPQkt3RzFMVmQxM1RObzhYWGdI?=
 =?utf-8?B?V1V2amw3WXFsSXVPSlJ6czVXd0lGRUtKeE5UWXZlZVkvYmROTVBCU05YaG1k?=
 =?utf-8?B?RUc2ZkkzT3VNY3pSN3JFeDNaeDF6Y2FhZkRNVlBSZVJqVHc2a0FGRXJrcGlQ?=
 =?utf-8?B?aHFGd0ZtTDJUeVJRMXdhNEpRUVFaTWlmemFRV1lWWDh5NVN3c2FYT2kzYjA4?=
 =?utf-8?B?UmdyY05POExmZmRvUis0QXZJbE90cEgzbmFQbkhpdFNzUExjR2dvV3NyOHZl?=
 =?utf-8?B?ZUZQS1JOTnE1L2hQZStSL3ExWWp5WG1INWQwUEFiTTNnNlczS2hKOXRMVDly?=
 =?utf-8?B?Y3RML0FVSWduRWlxU2dNNjdkWE5nRmc5NEczdmlkTzhkOFpYVlZWN0RBdTlr?=
 =?utf-8?B?eHRBTEZURFNyVDNmQm1MWTJQSzBrcEFLTVZGMk90RVQ3ajc0T1RCU0RwbjVr?=
 =?utf-8?B?ZGpGY3VmWmZVUCsrTnprdm5halExeFZlc1orRnJlSjBRV2lHTkh0SDNZSkVs?=
 =?utf-8?B?NE9RZHlvUnkyM0Fzbmg0RUpuWnFPbk1CS0ExL2ZPVjVSMENzMmF6SU5Ccklm?=
 =?utf-8?B?d2tVQ0QrZW03MG1qd24yQ2pnQkw5aHNEdE5xN2ZGWklYSkFzN0o5UENQbC9P?=
 =?utf-8?B?RWVDRDVhaUVLY2YzcVdQTFFuVGpWNDRJZElTb2ZUMGVKR2xSODNPUWxyTzNv?=
 =?utf-8?B?c1pNSTg3eGhoazB3b0xPNnFwNW5kOVpMMHUzYmpjMlJBVk9iL1BMaWlndUJN?=
 =?utf-8?B?ditxd1JsUDdxLzRiMmpzMW1XL0ZJV3ArNXpqdGU0SmQwQzJwY2hTMVVXelFV?=
 =?utf-8?B?Tm9LeHRoVlAwSy96bk4xaUwvK2NLRGhHaHU4WDQ4a0J5YWcwNEFPejIxVG4x?=
 =?utf-8?B?ZjdSKzBzelNheVNzVDlYa04veFF1YmV6ZzN1aVcxQ1N1THRPQTF3SDJyajU4?=
 =?utf-8?B?Y0l0UHRKVU4xZytPeis2b2gvWS9GK2R1ZkE3WU9WeHF4elV1SmVUcUhhWjAv?=
 =?utf-8?B?ZHV6WUNLUW94T29icWJld0hkMEpaSHFPZXpnK0pPaXpiQ1dOZTZLaUJDNEM2?=
 =?utf-8?B?eTFRWWpXYWpFeVE4akR4WkZRb0tmMks2cFlqNE1odW01K1dSOVdEVmJwcGlq?=
 =?utf-8?B?RVhpQlZsd1dPUnROa2JlRXAvWGQvcVN6SmkyZTlBbjFrY2NITkc1dEtZUkpv?=
 =?utf-8?B?eUJobGl0QVBMdXZQeUVxOEkyOTg0MnFsQ2xjTGFYWEZWNU81cmZRTFJRWWtH?=
 =?utf-8?B?RFplUndlNjdaSjNsQ0ZiSDF6bHpqRkJtTkVPcjQvZnd0Zi95cnFwRkx2azhX?=
 =?utf-8?B?a3E1eW1oZ2lDenVHNlRSUEZxMGlqUHJiVGNaV1Y0K0p6ZWQ5eEd1aFYzWVVx?=
 =?utf-8?B?aDVFdmZRM1BvYS9wRmFFaG5nZWdGVTArK21aU1hJOTQ1NXRrN0ZvalhUNEZ2?=
 =?utf-8?B?Q0ZVSzZWSlgxd2FDUVZvRGZSZEdMUkpIS3dZczhVdnRLSlIxaXNmbTFOOVNn?=
 =?utf-8?B?SHJyNXMwR0syWERWRFZpc1BmTUk4cUJUZmk0KzExdmg2WG1HQ1dZREZXcmQ0?=
 =?utf-8?B?T2dEanhuQVBBbDBKNTVHclRzTVlQaG5ORXgzNEkydWk1YjltMU41dmFGTDJk?=
 =?utf-8?Q?oybtzVTYPtAKcEk88JnEq2lsg?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c1d8338-eef5-4def-2e7b-08dbadeb4603
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2023 08:37:00.8062
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lQxjL4nxC1yJcpZz6eWMtAlv71yMCk+KmSsJqBgVt8wmU897/mcYt8/i9LOdjHicRSihYEAdsR2bfOwadvOoyg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8305

On 05.09.2023 10:23, GitLab wrote:
> 
> 
> Pipeline #992747061 has failed!
> 
> Project: xen ( https://gitlab.com/xen-project/xen )
> Branch: staging-4.17 ( https://gitlab.com/xen-project/xen/-/commits/staging-4.17 )
> 
> Commit: 699de512 ( https://gitlab.com/xen-project/xen/-/commit/699de512748d8e3bdcb3225b3b2a77c10cfd2408 )
> Commit Message: x86/irq: fix reporting of spurious i8259 interr...
> Commit Author: Roger Pau Monné
> Committed by: Jan Beulich ( https://gitlab.com/jbeulich )
> 
> 
> Pipeline #992747061 ( https://gitlab.com/xen-project/xen/-/pipelines/992747061 ) triggered by Ganis ( https://gitlab.com/ganis )
> had 5 failed jobs.
> 
> Job #5017577664 ( https://gitlab.com/xen-project/xen/-/jobs/5017577664/raw )
> 
> Stage: test
> Name: qemu-smoke-arm64-gcc-staticmem
> Job #5017577671 ( https://gitlab.com/xen-project/xen/-/jobs/5017577671/raw )
> 
> Stage: test
> Name: qemu-smoke-arm64-gcc-boot-cpupools
> Job #5017577635 ( https://gitlab.com/xen-project/xen/-/jobs/5017577635/raw )
> 
> Stage: test
> Name: qemu-alpine-arm64-gcc
> Job #5017577678 ( https://gitlab.com/xen-project/xen/-/jobs/5017577678/raw )
> 
> Stage: test
> Name: qemu-smoke-arm32-gcc
> Job #5017577654 ( https://gitlab.com/xen-project/xen/-/jobs/5017577654/raw )
> 
> Stage: test
> Name: qemu-smoke-arm64-gcc
> 

Hmm, none of what I pushed looks to stand a fair chance of affecting Arm.
IOW I'm afraid I don't see what's going on here.

Jan

