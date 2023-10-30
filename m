Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A37997DBB7D
	for <lists+xen-devel@lfdr.de>; Mon, 30 Oct 2023 15:14:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.625139.974103 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qxT1e-0001CC-4Z; Mon, 30 Oct 2023 14:13:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 625139.974103; Mon, 30 Oct 2023 14:13:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qxT1e-0001AH-0z; Mon, 30 Oct 2023 14:13:54 +0000
Received: by outflank-mailman (input) for mailman id 625139;
 Mon, 30 Oct 2023 14:13:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Hhfi=GM=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qxT1c-0001A9-CO
 for xen-devel@lists.xenproject.org; Mon, 30 Oct 2023 14:13:52 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01on060d.outbound.protection.outlook.com
 [2a01:111:f400:fe02::60d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8cd63a36-772e-11ee-98d6-6d05b1d4d9a1;
 Mon, 30 Oct 2023 15:13:51 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DB8PR04MB6939.eurprd04.prod.outlook.com (2603:10a6:10:11d::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.11; Mon, 30 Oct
 2023 14:13:49 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d924:b650:a2ad:7b25]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d924:b650:a2ad:7b25%3]) with mapi id 15.20.6954.016; Mon, 30 Oct 2023
 14:13:48 +0000
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
X-Inumbo-ID: 8cd63a36-772e-11ee-98d6-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kNgzw+ID/Fh/6ndnlmqz0+y0w+epN7ZWtS6NKa9TWYkDXOJPouqeHYiLsmRogz98DyVQQ/d5u4NqPZZzR7Bfy9X4T6jRXocV6ZFSTxT7EsbBTkvjx6/+u1f2kiWBjtVJ5l6CTbQBazPm83YcViQo27pVLMk1zvB6J9bHHBOm29l6+l6QR9dq5XVNYjAJ37RDPj9hmIoiHVN8LZeBTddg9Gu+ufxR3Aty4RQGBFU8yIRx1CAZNX9bx9Yx0Xeb+w6HsKvxlXF9QhDE2pjtBqktencdBEuc4offgbipO2oHA0yeJx47vrK0tIkksKmAFSunUacSHORa5OK5xCnpkhnD0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ozhRjkKQPTvu5sO3J9PWmPQFmjbIELeiheWHXP7CP6c=;
 b=hWYvL7EJOJEK4fMoHy0/FJxfMA4LSCESOIJARTeNGte22FRbhcEN3IXBPQZEkPXlqaRYixL8RrFfaXi6Y+ER74Wm+xY/slWuwzA0zk+qmXufpbmwM6lh34K/SdnB0KiJP2SCVvdQSp7n9jp12DmeZN2wwNjgjX0H02XgQO7StAVx8EiyUV771cm6GNeb9x26LMEBOKGoKOKWXKBqCDpYElBAZeGUu9QeRHkhlATBj7iOZd4MTur3EYv7RczQ6erj6r79NGnWPmOzn7fMjiu8jLPuSonC5oqZxwqJVyHt1Vt/eA+X8lHimgih0JbZ6R6Q5AYJS/iY+Ua9o5+mqlPsOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ozhRjkKQPTvu5sO3J9PWmPQFmjbIELeiheWHXP7CP6c=;
 b=B++MjrVu9J3yIAsoGexZRvSw5UFJphmaIF40mmohfjUBl26wET7cABVIYogdRE+6saaoMtBIEQDsst+rd69bLZ/G/kUjKn/PhoRdTFiRDMOHqV5M9srJ14s2mZ5jrugT/BSqwmlXeL1vE9Xzp4nqJLbhrV4u2eibUiSMvmXvcOhWe6f4JyGxpZ2n+/tL2Z+VIO3+3HvSv9s/NDfSIr4XXW83g9zERl9nGni2CyBvSuJLS4y+RgtQQm2yLvAPOAuZXAZQP8j1ZJQ7NLzFypBaeZsO91ARF14pFIS56OeKzvWL9IsYND396IhuvT9x8boiQiSl6NjMNWYJ7xEQa3I/PQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <77a0297d-3b47-6679-94a3-1463f642aa72@suse.com>
Date: Mon, 30 Oct 2023 15:13:50 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH] x86/x2apic: remove usage of ACPI_FADT_APIC_CLUSTER
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20231024102630.47691-1-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20231024102630.47691-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0091.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9b::10) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DB8PR04MB6939:EE_
X-MS-Office365-Filtering-Correlation-Id: 65b4e0b1-5b9f-41b7-6995-08dbd9526f9c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	d2mCZx8vZNifuozRLhjrNdxhg5oewjP043fSvbrzHW1rcBAUTug+1K9QW9sefb1m4/gktx7qTPVaOlmPfFEppBljCcldDMTANAjTeKsLel95V3y6WkGXTl6KZJLv4MJ+Lg3alo28YP+TU2DG2GB9qR5FFPi5Kkoym9H5ceqb82iJFAopua6z2pCuxWXq+LqjVeMx/3futoIJupgadMM68Cj1fY2WR07+5/vgZSw/WEULO2Jg0JgOE5TS8g786IuTUq8EVVYzK2fxWBMAjYb3mhcoWK32fQi3Cb3RZxRbXNhTqUFNnt39n02UBzhafs6VcwZzxJ1xVGNij+t7YvhXNLeMclYqvYIyNLeR1X4gBtj+9zyTv57d68sT6VNg8pBEk2bxIOHnoyvp5PljnnvJ440Qs9AYF1LYyTLQWc9JT8GHi4439NhOyZCrr3Ygidt/ds4QMjogV/ByQZ9f+Fy5I6eHLR9+EWPZq/0CF7BjFw61DAkZQOISJN9lCdMiavH+VnsvVZ+11PS6DSXcqsxK5hiVp+/GuvzH738I4sEclqmKWVpE8TI/7NnTv269mokUDCzBka0XReA04SDpCUJ1c8OMKawWNxXIPsbvDELi/cSU6tByH7JVTsX287GAVupwt6sV/Nn5xcwrGt9b4NAy5A==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(39860400002)(346002)(376002)(366004)(396003)(230922051799003)(451199024)(1800799009)(186009)(64100799003)(86362001)(31686004)(316002)(6916009)(6666004)(8676002)(38100700002)(6512007)(2906002)(41300700001)(6506007)(53546011)(26005)(2616005)(5660300002)(31696002)(4326008)(36756003)(54906003)(66946007)(66476007)(478600001)(8936002)(66556008)(4744005)(6486002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VU5iZlJ6K0tacDVrekJLZitEWFRucUhNdHVweWxqVnRNZnM1YzVHL2NFVnlS?=
 =?utf-8?B?eG5OeGUvR2xOVS8vUmF1NTJMVFZiemVVc2tpQUlzeSsxb3NnMklHbkxPYkxn?=
 =?utf-8?B?RHBtMGYzZXBEOS9TeHNaSnlOMTJNTmxGL1J3cVRmN2lNaDgvOGx4YjJUYlZh?=
 =?utf-8?B?WVpjOStMZm53SlJlRnRFcC9zMmt1SGRLT3N0bFN4Z3Bud05YeDZrU2dKYkdq?=
 =?utf-8?B?ODdraXUxWVYvT1kvMHhlVDN0WjluMXUzTWRaTGxkcWhORmg4dG82WHQ4dXZO?=
 =?utf-8?B?Nys1WnpueTk5V1hEb1E4UWx5SndETFNraThiWlJrT1V0bHBKVTNDZzFCQ3FV?=
 =?utf-8?B?ZFZwOFVzc1h5SU1HbjdUQ3NwVnVNdVlMWDVSeG1VSkk5bG1xTTNFOVE3cGl5?=
 =?utf-8?B?cXN3QkhUQmNMSDJYQlVpUVkyNUxOSEpEeHg2MXl4V1JhNzd3MFc3Q3BRZktB?=
 =?utf-8?B?R0dhckg4cmJMdkdNZmRHMzlReGkxemtmY0V3SlVwcUg4cFZsUURXVjBpWUlI?=
 =?utf-8?B?QVZOZHVxOEZ1blFWYWdLS0wzSTAxQkdiUUU4T0l1aGxQZXZNTURSV1ZUUXY2?=
 =?utf-8?B?bnRzMW1lWnJtQWtoczRJOTgyZVpWZ3ZFRzZ6dzF4bmZsazlVbHRLNzR6RktD?=
 =?utf-8?B?UUZ3Uk5EL2EwZitHNG0xK0hLR1FDVjUyaEY0SitlVkNwcXg5UUc0SzQwMm5M?=
 =?utf-8?B?dGVGdlg4SytTNzIwOFMxZkFqOUUrK2tqVVpIbnNOSW9SczZaeFcwV2N5dU00?=
 =?utf-8?B?NGFSLytLQXFMSnhYOEU3Wk5GakdLQ3B6M3VJS21raFVZRXhKS0F0bUUyL2FS?=
 =?utf-8?B?aktRNVV1WHpJTm9QSDRsL0lQVFFwNlVPcklwRlIvc01ja1FWSDk4ZWRBR2NJ?=
 =?utf-8?B?OUNkdnFIWS96ZXI3L0M1Q1Y1Nnp6SW5lUVhtTS9lazNGZVIzN3RJRnJFTHM5?=
 =?utf-8?B?Y25hS3hPODBWRUp5bGJSWDJtcFVSMHh5SGRLa1JUeEROVWtHS0xjNEROSmxZ?=
 =?utf-8?B?c1dubll1ckJxTUFYRFRLRHpKWGZRVTU0WjNTWDJuLzZvQmRhWDV3VWNVZGFO?=
 =?utf-8?B?N3ZLa3RnTzg1R1M0ZVA3aDhWQXB4cWVsNU5DV216Z3JwM1krTTh6WEZDbHN5?=
 =?utf-8?B?MWY2L3o2WWdTa1pXTStRY3llT0k4dE5pcE1tcWw3UHhjMHRkM3pEaUtPVjNW?=
 =?utf-8?B?VG9uT1NHM1NPR1R4ZlZwYWlwYkc4K1pVSjhSbE5qeXJQNHBsY2p0YVV4Z2l0?=
 =?utf-8?B?SUQrVEpWYklEQjB5OHFrMjRGTnQ1N21NQ0JDeFY5M1VkbmQyU2VqWE5taXYr?=
 =?utf-8?B?VGwvSmNVLzMwb2ZwVjA3VXdCc0VBODZmSXNoc1VOcUYxWm9YQ1RVY0ZGNFIz?=
 =?utf-8?B?QzhuQlpxYzV1YytaZDRBckY2U0VoY0Y1VjRqejRtUkJYcFJpTy9yZERscGhr?=
 =?utf-8?B?SE51THZsYTVlaW9nOTRmWEV5S3grM2hqdSt2OWlHanBDZnhFeTkzL2liK0Zz?=
 =?utf-8?B?cDN6M29TZlhWL3RiUlpEbGJlUDAxNHZhaXdWWnFobDJ3OVU2WW9TMEllU2tR?=
 =?utf-8?B?eUFSSXdrR0pwbERYdk9JaHdtK1NYUmFTbkh3eFdOMms3VXR2ckZrZDVVWG1R?=
 =?utf-8?B?ZTREQ3RCWEp1aWZKRnpEcXNHNHJGc3dpQnBNNWdjYVA3VDZtMjh4dC9zM1Jk?=
 =?utf-8?B?cFZaRUFiTXZMK1NUWW1qVjhlaFhUNWxEcXE1djZpejNnQ1BXSnVuTWJranJ6?=
 =?utf-8?B?TFExeEVvT1lrR0lqYWc2d01peDBZYThOTWlnbTdTckNERVNXeHRnMXY0WkRI?=
 =?utf-8?B?eVIxZnZ1cDV3SkVRZnZHdDA4d3NLZjE4dnlhRm1tc242eXFVY0dBeFNDTVg5?=
 =?utf-8?B?TDc2Z3VacTByc3ZvM3hqT09zVDEzTzRuRmJXbnRocHJnY0tid1JObjZWVWlp?=
 =?utf-8?B?YWE1TTM4RXZwWlVrYWtyeEd1UldYSUdWT2VucllSakpNY2dPcktxWml4YlA2?=
 =?utf-8?B?eXRNVW1HbHBENm1ZYjJhU2dDSlRkYklPdzA0cGc4bnJzbE11aHYySjlVM3ZG?=
 =?utf-8?B?WVpROG16Q0NxcEsyaDh5SUNpSlAydGtEY2pOWE03cVR6d3NhVWVEQ1FORzZs?=
 =?utf-8?Q?TchCIWOOeXPiE1DmBKqyFS4Yp?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 65b4e0b1-5b9f-41b7-6995-08dbd9526f9c
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2023 14:13:48.8071
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SN3rc00GudSaQsjse9C/ymdnekNrrFlQ5Ax3TtHtElNR15LsrvDCbYZPCc4wf2ed9nq2a/Sr3eWxN0HKG8OSRQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6939

On 24.10.2023 12:26, Roger Pau Monne wrote:
> The ACPI FADT APIC_CLUSTER flag mandates that when the interrupt delivery is
> Logical mode APIC must be configured for Cluster destination model.  However in
> apic_x2apic_probe() such flag is incorrectly used to gate whether Physical mode
> can be used.
> 
> Since Xen when in x2APIC mode only uses Logical mode together with Cluster
> model completely remove checking for ACPI_FADT_APIC_CLUSTER, as Xen always
> fulfills the requirement signaled by the flag.

Actually, one remark: The text in the 6.5 spec really only mentions xAPIC
mode, so it's not entirely clear whether the two flags actually have any
meaning for x2APIC mode.

Jan

