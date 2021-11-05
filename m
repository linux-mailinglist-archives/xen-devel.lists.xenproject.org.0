Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4902F446036
	for <lists+xen-devel@lfdr.de>; Fri,  5 Nov 2021 08:40:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.222190.384273 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mitpe-0004pZ-CX; Fri, 05 Nov 2021 07:40:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 222190.384273; Fri, 05 Nov 2021 07:40:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mitpe-0004n3-8m; Fri, 05 Nov 2021 07:40:14 +0000
Received: by outflank-mailman (input) for mailman id 222190;
 Fri, 05 Nov 2021 07:40:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=mr/O=PY=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mitpc-0004mx-LH
 for xen-devel@lists.xenproject.org; Fri, 05 Nov 2021 07:40:12 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9b7db2b9-3e0b-11ec-a9d2-d9f7a1cc8784;
 Fri, 05 Nov 2021 08:40:11 +0100 (CET)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2111.outbound.protection.outlook.com [104.47.17.111])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-20-X6YvG3pQN-6Awvs88dUpeQ-1; Fri, 05 Nov 2021 08:40:10 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0402MB3774.eurprd04.prod.outlook.com (2603:10a6:803:1f::28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.17; Fri, 5 Nov
 2021 07:40:08 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898%3]) with mapi id 15.20.4649.022; Fri, 5 Nov 2021
 07:40:08 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM6P194CA0079.EURP194.PROD.OUTLOOK.COM (2603:10a6:209:8f::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4669.11 via Frontend Transport; Fri, 5 Nov 2021 07:40:07 +0000
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
X-Inumbo-ID: 9b7db2b9-3e0b-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1636098011;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/SeAcumihhdSemzUK582nM28r1ZjsgyUumggUR1JHuU=;
	b=UWm2Kgt6ePYQG5lXEiH3d9vzF0/yWO/AzQaSzFh0DwXgIbWdtS6XuOXVCtXiljveU2hm29
	3/Y9tbz6NOgQqBWQv/IwtcZA4hE97TkL3SNoQGoRBIy6z9Y2QdQqaJqPqfEPZYfQh2stDs
	j2eC6zdOxM1ZuA9I+djJ+zXcuT9s3+Y=
X-MC-Unique: X6YvG3pQN-6Awvs88dUpeQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PJ0cKwJoh3sJ9M731jvjY8gk0wDhdWonllwlro7kRWKA5qrN6yV2RYiW9E5rtqYXJKB9MtqdZKQ7pNqwqu4oOuRdfIKEBj9joISkp5IWQsoNmSs/imHp9m9WFDKRrvAJNvoKpujZm567mBsgzUQ4/IMbqOJhOhGWKtyCAMiecHGYpf7YEhZFACiwoaUYaV+aFlEu1fopCmzR7zca97SvG68JW+T65igEPbegK1PO1Vh5qhc229N3dgncx0FD6IUnLzT3M8Y/TEQlfvpG92n+J4qqN6JEwf4bHIAgfxvrY8UgoAuiNSvo8hRwFRS1Ops0GaXexOSrm3oyx0E+LpeMew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/SeAcumihhdSemzUK582nM28r1ZjsgyUumggUR1JHuU=;
 b=kRZ1yKZKVx4pOSSv9YZ1npog0VXHutV2i2CulRoR6h8Y61GKFylleAmVmPviZy1sxs3FRpL07hmX/SSSF8m/qt2uHzOSnl2oyENjoDqfFfFp1IOVski7ewLvFnoLkA2aDvdAgxpYHkuAvq6DJQxpaDYpOdZa2eIdWFu/qm3k3QF3Ib3U/cqkmvSboRlSSgfpalU7SzQd3QIQoNIwyPyGxhkDvYVFFX2h0GsNRJP8eiazqDMqX+M+WD2gm1MGUHAPf8CVHU24X7rTiMcr6mze46O2KPzXj3p26yHk/nde95DRZViOC0MYxERYW2xLx7+9N7G9XPqLGSTswtJgqy8bfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <bb57557a-1001-9bbf-3a1a-b2627d609f18@suse.com>
Date: Fri, 5 Nov 2021 08:40:06 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v6 6/7] xen/arm: process pending vPCI map/unmap operations
Content-Language: en-US
To: Oleksandr Andrushchenko <andr2000@gmail.com>
Cc: julien@xen.org, sstabellini@kernel.org, oleksandr_tyshchenko@epam.com,
 volodymyr_babchuk@epam.com, Artem_Mygaiev@epam.com, roger.pau@citrix.com,
 andrew.cooper3@citrix.com, george.dunlap@citrix.com, paul@xen.org,
 bertrand.marquis@arm.com, rahul.singh@arm.com,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 xen-devel@lists.xenproject.org
References: <20211105063326.939843-1-andr2000@gmail.com>
 <20211105063326.939843-7-andr2000@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20211105063326.939843-7-andr2000@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P194CA0079.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:209:8f::20) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0feb5440-e55d-44f1-1849-08d9a02f7dcd
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3774:
X-Microsoft-Antispam-PRVS:
	<VI1PR0402MB3774D77E57AD0695B950675AB38E9@VI1PR0402MB3774.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4125;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	6kRfPidRR7M6U9/xVi3XHCwdsNuPcc+jUcuoK7ElxbozyTG/OX6aCsM/Nnz+bPiwdkB56BRkwJFyjm8Pc6Di2T1AHmL+bSTrvPJUvQdMGEfyX5VkwDHy3WDXIoJPeIq5nOJ4cr9yjKvemUWiinezY/D3R3COwbmwL9+iR4q5NrUwVNWF7SXlFzFtVIP61O5wrEA1ndARw26x1Qn/nkL8ZANVGssTReWRJTWX6tK+iuvNscs4uC9WzoVs2MfO43vvyLqCeAmt6geEsqkJ46ExmXOm3E+4A3LeTHx5/1Jfrs0LlJBROYN9nSKeQ2pbDDSThpc2QYnuOQIXutPXdrx3b07v2nJYci1m4Y9Q3nc3xtNtxReKYNDwNE29jMnGf0dCtGx1B+rQHNimCBacMQRn1TQy6BFay6ymn/43CeYb4Vr5C4EKXQ4CeoHd5z1G9ucHpUTdZnfXqofSRlItpq1Zc1hl4ATR9xRs8gPkPXiC422uFKd7RUR7rH/a819cawPG5CW61yj7b2ycWwK+8xqAnHo0aE1ecxQsunVXDCceQM379FabW4DNqabndrLkOWTvmhGIIbJ2C91kHSSZjVAvNrTWbDv0kpq9aRl5zSotdcsjYzb10b3Gr+t543Vv3ASuat4cq68maAoJaahL+G97tl9yngA3EGxLqWbCB/mFJ6ZdJPGVjjnh37458CdvrLyeurK31vpA0cfAVNpAUt4oWfnzNab0oUWcP8Cl7J/4+sM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(86362001)(5660300002)(316002)(2906002)(38100700002)(6916009)(8676002)(508600001)(53546011)(26005)(83380400001)(4744005)(8936002)(66476007)(186003)(66556008)(956004)(7416002)(66946007)(36756003)(6486002)(31696002)(16576012)(31686004)(4326008)(2616005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NUtIdVFEOWFzbWFBNFU4TDJEVEljdVUwZys4bFJ0eTBQVEcrVVdMdGdMekhC?=
 =?utf-8?B?SUFtVTg1Q1FTa0lGaXhKaUFpcUhNcURWMGJ2RnpSYUEvelF0VXRmcjNFUWEw?=
 =?utf-8?B?TmFQYTBqUzExMklMK0o0TnJydEtxV1BYVnJQZkEydFN6QkxiaGQ2MnlhV2s1?=
 =?utf-8?B?andUU2NiUVpIWC9XU2N0WWE4Y292YmsrUGFlVVI2NExuNGt2cEJNVHJvZEFP?=
 =?utf-8?B?SjlMUkkxM2FrUTY4RW1wQmpXYVhBWGpHWFJrMUV3ZWxIV2srT1dpQkpTUVll?=
 =?utf-8?B?UlpMT0VtMi9BemNBYmFIcUc1MDl6NU01dVZoaXJlcXNxZFh3SFc0RXE3Rk0r?=
 =?utf-8?B?WmdtaFRzb1J4Tzg2M0ZXU1ZhVjRJWWF6dlJJOFhIVUxGOG9zbWRkeDBaNktV?=
 =?utf-8?B?S3VRZHdZTUlsS0ZzS2xRNWpsQk41ZmRwWGttYWs4dkRnZHhHUlRJdGREWncr?=
 =?utf-8?B?ZjJKZmgxV0V3TytKYlZLNndVK3VBQUxqVi8raWE3QTE1VU16RzltQ3JIWUF0?=
 =?utf-8?B?NkQwa0ZucnZHM2Y3K1JDQmk0UHN1VHd2WnBpU2ZPTm8zbGxRWFAvSThlMUFH?=
 =?utf-8?B?bzFsSlQwTTlPQXdCZEkzQW1teUI4WmRWQ0hqSFRHNk9sVTZXanJYRmVXbUpj?=
 =?utf-8?B?U3U0T1A2TlhFd1Fkemt6amdmOXJWZzM4U3VPblFwOHQxMzVKTzh0NHc2TmtK?=
 =?utf-8?B?ZU51NFJ4ZXZaUkY2NWNWUTdWMFJnQ0UzVnFISnpwV1R4VUM4TDBEQldGSEVx?=
 =?utf-8?B?VUJySE1md2ZOaWExOUZoc0JrL0VPbldOWXNxVTRCUUt4cmw5SG9SWExRTENr?=
 =?utf-8?B?YVJRYkJtUnlxYWdRTkVaSG41Y0Q2NlVtSjRrbDBpYlp5NXBhOTloOXFvYU85?=
 =?utf-8?B?cWhuTWJZNVNvWmUrMjl5WGNCaDd3d2dzMXdXUytTSkh3aHlsOHhSa0JJZ0cz?=
 =?utf-8?B?eVZ0bkRpSFFyU1ZoNFk5V2JHT0xwUU5ZdVkrZ01FdGtTYi9EbW82NXVTYlZv?=
 =?utf-8?B?S01aL2E0WkovdzNhQmRLREdBRTVYRnA1WUVKZXZNMHYyMHY1UnBFbWptU1lp?=
 =?utf-8?B?aDFJVkg1V1hBQWVER1lvaHZtdmVlSmRoUGdMZGhVd1pZb1lENjhHNDlwYlJq?=
 =?utf-8?B?VHVqS3pYUGtoUXNkZWtNWkFKMThZRTlvNkJVSFBxKzJ5ZEcwOGNFc3N4K2ky?=
 =?utf-8?B?YUVkN004cS9PUDZxSlhQTmVNNENTWnorcWFUR0JaeGlSc0x5Z2FUaTNlYjFr?=
 =?utf-8?B?RFdFSTIyVmE0T1k3aHZUY1hqZEZNTGQ1Wk40UGV4NVp6a3RSRkhvOVp2aWVh?=
 =?utf-8?B?T2ZQT2JtaW9aK0ZsTnFYa20vVXlmb3BtbkNxSDFXMU5sWEJ1bWJMV3V2ZmRY?=
 =?utf-8?B?WHQ4TzVORTBaM0ZlNXliRTl0QnhySzFqUXhyVkhmSmJReXc0dTVkblVWT3pX?=
 =?utf-8?B?ZlFmdURLWEo3cnF3QmpIYk5ScFpZaHVMOVdzbkpzZ0hUdXh1WEg0MUp4ayt1?=
 =?utf-8?B?M1dYSHZSOUoyUmVZVnJkbVZWMTQ5T2xualh2Z1Q4c2QxSFFOdXV0bnlkdUkx?=
 =?utf-8?B?WjJ6M2YzbGRDMVpoNjA2c2dGNmQzK0ZoTTg2ZUtsK1lCb0g2RVpOSFlmbWti?=
 =?utf-8?B?alhDK0h4VEFnZlRJajR5QXd5c2xsc3JJcFpVWUFta1NzY1V6dzRReHhKVVdL?=
 =?utf-8?B?QnBhUmZhOXN1eDU2TTNTa1Z2c1E1bGNrdk5jUFQrQU5KNllMbi9pZnZuWXhJ?=
 =?utf-8?B?c2laVTlvbEh6VXpkQ2lkYUNIT0RscEU1cVdaWThHQXNGSmp6TlFvbGllVmFk?=
 =?utf-8?B?emIyKzhTMjhHYzVQcm1YQXhMZWt3TWV5YmpZUGxNQmNLV2JpUHNKdnN6RGw3?=
 =?utf-8?B?TXB2K09zZTFJcXFJbXJQZjdRNEZ6QjF5RjRHSEs2WkNzK0ZpWDN6ZXBJSjZ4?=
 =?utf-8?B?dUFKbmttSTZRc3FJS2Riazl4ZWtJUlA1bXh3QjNKNFNwbHRLQXI3L0s0Z2Fj?=
 =?utf-8?B?d3R1dXNLN01nTXl0aWx3RjBqdVJHQW0ySEhzTDJsOXl5bzJVNTJ6SU5Yd0Jj?=
 =?utf-8?B?N1JQakJKL0xydVRCdDJBVTdZa0FGUGxxby8xaGZqWjlRU1ZaOWl4THV1cmRn?=
 =?utf-8?B?TGVGdUxZdHJtbWlqWnFBYWNTSDVFSE1Wak9rL3N2NG0xaWxoYlJaaEJNYmVE?=
 =?utf-8?Q?FQO15szS1VrSZTPorVroI3Q=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0feb5440-e55d-44f1-1849-08d9a02f7dcd
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2021 07:40:08.6114
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZEjKf0B/y530EWsTbxIvTomRRSbXjbImV347oakUaWM8BmycT06u+Zf9vWua15NJv/QDSIOqox883u1TPihJwA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3774

On 05.11.2021 07:33, Oleksandr Andrushchenko wrote:
> --- a/xen/arch/x86/hvm/hvm.c
> +++ b/xen/arch/x86/hvm/hvm.c
> @@ -546,6 +546,12 @@ void hvm_do_resume(struct vcpu *v)
>  
>      pt_restore_timer(v);
>  
> +    if ( has_vpci(v->domain) && vpci_process_pending(v) )
> +    {
> +        raise_softirq(SCHEDULE_SOFTIRQ);
> +        return;
> +    }
> +
>      if ( !vcpu_ioreq_handle_completion(v) )
>          return;
>  

For this part of the change:
Acked-by: Jan Beulich <jbeulich@suse.com>

Jan


