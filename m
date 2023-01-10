Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 62A7E663D78
	for <lists+xen-devel@lfdr.de>; Tue, 10 Jan 2023 11:02:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.474605.735866 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFBS8-0000PZ-Mo; Tue, 10 Jan 2023 10:01:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 474605.735866; Tue, 10 Jan 2023 10:01:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFBS8-0000NI-KB; Tue, 10 Jan 2023 10:01:56 +0000
Received: by outflank-mailman (input) for mailman id 474605;
 Tue, 10 Jan 2023 10:01:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+HTt=5H=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pFBS7-0000HN-Fb
 for xen-devel@lists.xenproject.org; Tue, 10 Jan 2023 10:01:55 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2056.outbound.protection.outlook.com [40.107.21.56])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cefc20db-90cd-11ed-b8d0-410ff93cb8f0;
 Tue, 10 Jan 2023 11:01:53 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PR3PR04MB7403.eurprd04.prod.outlook.com (2603:10a6:102:8b::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Tue, 10 Jan
 2023 10:01:52 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389%7]) with mapi id 15.20.5986.018; Tue, 10 Jan 2023
 10:01:52 +0000
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
X-Inumbo-ID: cefc20db-90cd-11ed-b8d0-410ff93cb8f0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FRrD8XeNmm81lZ6RzH90uLTYgwD69Ss4T/Qu0mz0AaMy+AMpRt2MxCRcfQ1Xusa0L/D0Cdi++XpZPLLhzBKg5546I3xowsMEg/D9aarGrYWa2UFVLn7D44G8dmD1qxBLAvY7EFdo+8+DOIvKNXaETui9XEp7Fozc9tzl8sSAIjqahlRfrBKA1RX5sQjVBrdyLH8OaiXOkVtl5THLCB026DNr/YjLsI64yI5jB629TYEiOh4Ur0Oo6gCHjZ5463IN56QLsMpY7ph078ccEpsWImj5/ze5YxkoX4yuu9aZu/b7oIn2msItXd4Td7xSq3yib0cqssJiXh6QuYeWW3iqAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BlSIp38KmCDogYRPIN4hEZ5Ie+tbUo38UsCscNJhcl8=;
 b=LGFVhoflcgqO6E3kRG6d5cJGubFGb33FcFuIsUDCpTKo03mdkCSgt8rYd8OOWdj+JKwq43hFZHqXRvhqpqipBReUn+dR5oV2wpf/lwcsElYh+16T632XqoacRyGxW16OWa7Luq+qOTWs/xWGU8CP113k+9z95cB27ikamhqx9VCqMCOXsLlVvxoRx4FUZQkXsTE3X9RfK20i4dKowLJ6ze5Rpq3W1UvbtEK72WrGqMwZlxiOvucf62CR64Q8TW/vabtQroKP9NQPr35aDI368ZatqLAs5GayHBuk63uZ4QwMWDWoHCkDl7eiaIfcYj/2FPnjU5CwOHQR5j4YgKtecA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BlSIp38KmCDogYRPIN4hEZ5Ie+tbUo38UsCscNJhcl8=;
 b=qzWPmXXGc6DCblYDLXBnO4MNxHKbp2Hy+rtDaSrYRLT5nSEHQ6e5x8MaaengdMrEVVdOk6KTTRAlxZGr3oHrng3klZzUQFBqu0GQnZyov68IHcASXni9ygcyqwI2F6Q5VnnAnz3WYZwWX0W4L1s16aBxtshRW6u04c3//Vu1Al0w1NPcr2uRBdO4fJTN6Lm5GfPn1VIOWu0koLl55jHUjxFb6iYc82p3pt9TK2DGBpF6qGyvuknmbwUpD6jA22JRfmq2PG00sAfPcgwHnJYuAYgPX6UGwPpsvOui3mDJPZZ0SrsFVivr9AojMZCR+NLcgibFD9ozPfm2clVm++1zAw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <379a86b8-837c-9b95-7737-1446c1967666@suse.com>
Date: Tue, 10 Jan 2023 11:01:49 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2 17/17] docs: update numa command line to support Arm
Content-Language: en-US
To: Wei Chen <wei.chen@arm.com>
Cc: nd@arm.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20230110084930.1095203-1-wei.chen@arm.com>
 <20230110084930.1095203-18-wei.chen@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230110084930.1095203-18-wei.chen@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DBBPR09CA0031.eurprd09.prod.outlook.com
 (2603:10a6:10:d4::19) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PR3PR04MB7403:EE_
X-MS-Office365-Filtering-Correlation-Id: 672bc308-14f8-40fd-bda3-08daf2f1b24b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Nl2weA04A0dXcOoqWbdb7ab25RqBYZtkNzYEExEc83oNv52tgKdhuoqfD3dyf+Qu//YyfRdSbJSVE4hIgOCIVoiay+LRoUhDRHJPCtekNJ7kL2yW66Xoejdi3pCUCToEo+9iFUH0d/GxjjHmvTfVy/izoocCpsyO7g4bIzZnB9kkcl5yRVqRDOaE3mfbwRUVSDo7ljfAyY3Jzew7tJ/h1Pmmq7lh5mZ+RjsLt41lj8UXWflL/0Ne4s8UMCbiAQ53kzsoQwlOCbZmn0+iLGlcng+6FI8CKGpeMmNJrFlXJ5/XBdR3n/uYfglkDZTWdgXVlP0KNUIuNk0Lwc+u6N7DmTWY8ErObUTk+GJQ4zDLhPjdS2V7Fyl0f1EMkGepovyBdnXabIl6qn1XvYehSAJaAGPYC1KR9r6RE0h8tJ28urK9G02vjEmXKB/1fOhO3lV9TZkP3t9/IfeMrClO/AsXReqYoGsvjUZpmdzA4nV0xK1SdGA/zhNc5fV2dm9DWX2l4XsgFRL/qpjD60qYEXH7qFJE69exPTWVjvrOOwdMDTj/1+SPMPqpMh4i9/K7M4brgSTNx4Y02tPnawyaFsVY3rbURyq4XZ+wGlLxlAlVDpR57qQ+IxHula8F76AgLXxm1jqD8k9H/p/CMrqXLu7e6YWvbWPdmSmgRBr6zIYm5gTBZOGIY9Ehv608vt94IdLYfvY3lqhJVvsd2YuZtJn3mt8NLpEDUHsEtHID2022zkI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(136003)(366004)(346002)(396003)(376002)(39860400002)(451199015)(66946007)(31686004)(41300700001)(2906002)(8936002)(36756003)(5660300002)(4744005)(8676002)(66476007)(6916009)(6512007)(66556008)(316002)(54906003)(6666004)(6486002)(53546011)(478600001)(6506007)(186003)(4326008)(26005)(2616005)(31696002)(83380400001)(86362001)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Uk5XemFLQXRqQm9EVkNoSUtnM0pKeVVhcllRV1lEcWZrVW81anpUQkcyN3B0?=
 =?utf-8?B?R05RdWZQd0MzZHlSTzNWNFlLdzZwZ2UxekJFT3RjVXFNSnlUTVYyK3NnRk9D?=
 =?utf-8?B?dFdQWHoxYnoyVnVhUWw1UlhCay9KMW55VHlNeVljUFFpZk8rVHVQVlJycEhZ?=
 =?utf-8?B?RkFqQkxUUE0zd0VJQVJFTmFIYzFCUXBQeXRNTGZoTVBmaVhiOU5abXlMdWdW?=
 =?utf-8?B?MmlTR1RrUmlDdzF6L0ZLcUtkRVpTa2g2WnBNdTNPdHFpcUZIb3hLa01kaUhm?=
 =?utf-8?B?R0dMSDhEV1JNQkhlVXN2cjRTWmt0bzlxM29Oc0kzblY4Y2lNelBHZkJmOHg4?=
 =?utf-8?B?cUZpVy9kbTRoYWNUSUs0WlZNK05pMXFabzZuV1ZRS0FzeW15TEJPQWNoL0NX?=
 =?utf-8?B?UFR1eXRCTnRVS094VnZPQS9CYjErZDZGb1Q0SG50UW5qK0wrc250ZGExdGJt?=
 =?utf-8?B?U3ZFR3RiS2N2UG1uK1ovUzlldXVJYWV1d0FWRWN6ODhnWDVaNHBpYnduaDRr?=
 =?utf-8?B?blV5QWdrM0pGRTU2a2EweVZwdmR0RWtnOUlHdzZraWQzOTVUcmVhZElwek12?=
 =?utf-8?B?cHdIM3VEd1VrbkZ4bVMzRlZpaGtCajdWSHBJNmtPUmR5SHBrbXRrUHpqNEJG?=
 =?utf-8?B?RzRqeUNSNHI4U1p2ZUJWR2xYWVNxTGE1N056UU5wanhRSTJXSXM5UkNQN1l3?=
 =?utf-8?B?djVMVnpHSHBCQndxTFVHODFQdUgwK1ZpL3NZMVdkZ1FWd01JY3BJbEhOdW1W?=
 =?utf-8?B?Y3ZpcElBdUNXMHNCWDc2NTk5dU9yQmd3Q1FIMFJ5MHVsclh3Q3UyOTlGamwz?=
 =?utf-8?B?K2NHMHN2Qm9BR1BLTUNKdmNGamVQNTRhcWZXYlFET1AzQlFNeDNRZTIyV0xU?=
 =?utf-8?B?eG5YU2U5RGsyTXV5V1NtYVI0Snc3V0hldmRCY2xQMlRnVEFOMFJVRFFoZTZ0?=
 =?utf-8?B?WmdiMXVGTlhEbEkrbWxpaXRPWjlRYjRGSjJSVVkrSjlTdVMzVEJOcHZZaDBz?=
 =?utf-8?B?UlEyWksrSTU0b3I4VHZUKzErYzVuSDFKQjROcWlaeG1zZzh3VWtDQks4R2tp?=
 =?utf-8?B?QXZwZjU2bkpOVk9JM3pDMFB5eVlGbm03TFo3M01wc0FSSGI5RkR4b2ExaVdR?=
 =?utf-8?B?cWJsMWRTQjVzV09HVjhPbG1mY3JYdHVBcjQ0ejNUMGFKbVZOQ2RyS2xvUThr?=
 =?utf-8?B?NjVzMHBReFVGczJZQmx6eWIxbGdFazZrbW9aSXlwTXl5bnRYdVVkVkwvWFNR?=
 =?utf-8?B?ZmZsQ0tJVmgyb2c4NGRmVm1pN2lkblVjUnpGbnhZOU1rUEpZM0d5WGE2Ylds?=
 =?utf-8?B?dEdkd2JjZzVGbjZOU25kTWp0U08zYkFMMm1vZFBYMjI2Z3dLd0dpcmFkdVE2?=
 =?utf-8?B?VHIvcEZaZnczaXlRZ09mck53RGhqSUlKWitid2Z2Rm5OKzA0RDNCR0Q1bVA0?=
 =?utf-8?B?OElNSVZzeDc3aTJLQTZDQUpQbDlMV3NDYjVrM2IxVkR4U3FjNlR1OTVPQmJT?=
 =?utf-8?B?cXczUVhIV1l1YjNJdFNZMVJnQWhBZkRwa1Z5dXBKV0UrUFRBc0J0MS9WUWcx?=
 =?utf-8?B?eXlYYnViZnYzQ0pDTmpiQXI2OEJKZEdPN00xU2lvcEhPNC8reHNqVlozTkJW?=
 =?utf-8?B?SFY2N29JaCt0NWRneHUrdGFwSXAxV1E3NytEeVVzNnRreDR4bUFrUldydVBj?=
 =?utf-8?B?eDJHa0JEWnova1F2WEdGRmpiMEQ2Y1JBWi9BYlhqdnQ2THRQQnNNSnREaVQz?=
 =?utf-8?B?N0J0R05RcEhmVXRFSzVTZElSVlVwUVFUOXhPZ1p0TDlSRzBmc2N0RndpRi9U?=
 =?utf-8?B?dXd5TW1GVmFWbUFyNzZhK2RqNy83SzFmV3I5Y08zNVhMZThVcG93eVZNa3N4?=
 =?utf-8?B?a2Z0YlZla2prdGh2VDE2TDJ3TjBZVUhYNXVGdFZKck4zdzBPaEEzYzhObnBQ?=
 =?utf-8?B?c1V5T3NoVlZwZTZRVXNqTDJ1Wi9iMndHMDhBOFZMTFNVeWd6clFHZHhhNEJS?=
 =?utf-8?B?YjdQRW12cDlyZld4Y1NKTEJ2eFBNYW5Va04veGVRUW5NK1ZXZ2JoRFRjYnQ0?=
 =?utf-8?B?dkdsQXA0Z3FiSEQvQkM5K2hnZkUwTHp0MUd2cFFMalF4d25EeUdXNlhuck5O?=
 =?utf-8?Q?ayDW9BScEkbBz3I37p/2k0oGa?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 672bc308-14f8-40fd-bda3-08daf2f1b24b
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2023 10:01:52.0569
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WvnTVH31MzmFEJ2zdc8g+YndeLbhJc39BGHbNSZ0AssLTuz8xrgA3tr2WzpWSlE3ziWG9vycEDwEa5ZXOAloYg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7403

On 10.01.2023 09:49, Wei Chen wrote:
> Current numa command in documentation is x86 only. Remove
> x86 from numa command's arch limitation in this patch.
> 
> Signed-off-by: Wei Chen <wei.chen@arm.com>

Acked-by: Jan Beulich <jbeulich@suse.com>

Of course not on its own, only on top of all the earlier patches.

Jan

