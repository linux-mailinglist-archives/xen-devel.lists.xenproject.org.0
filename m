Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CA7593BBD59
	for <lists+xen-devel@lfdr.de>; Mon,  5 Jul 2021 15:10:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.150224.277781 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0OMl-0001ER-38; Mon, 05 Jul 2021 13:10:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 150224.277781; Mon, 05 Jul 2021 13:10:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0OMk-0001BB-WD; Mon, 05 Jul 2021 13:10:27 +0000
Received: by outflank-mailman (input) for mailman id 150224;
 Mon, 05 Jul 2021 13:10:26 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+Qt1=L5=citrix.com=Andrew.Cooper3@srs-us1.protection.inumbo.net>)
 id 1m0OMk-0001B5-12
 for xen-devel@lists.xenproject.org; Mon, 05 Jul 2021 13:10:26 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5c12d3ec-dd92-11eb-8447-12813bfff9fa;
 Mon, 05 Jul 2021 13:10:25 +0000 (UTC)
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
X-Inumbo-ID: 5c12d3ec-dd92-11eb-8447-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1625490625;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=NicIRY1ocQMXug1W7SYrv5IuM2u2a3LlJUKaPsIkiSE=;
  b=hZ8OMlk0Umn6zJ6Jhp7yuO3DKxIULevyLbaQBTeXLh3e530wBiHeHcwp
   NdSQmC+U5w6+4Bq9j+RYOsVyKRy4dDb1jcvFOwGdlM7rEYngd9pEMDlRi
   3PN8Z2ok9kmNbgq3G/7RKy6qwGvRcZ5IilWZeVyO6uk/f9LqEOKncJcJV
   8=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: dDprDHl0z4Osc8MBT7Na7EhFMoyI6uNFfp7CAsTKdQRl5PlOabADCgGiWgr8Ptb5Fypbm7aSmk
 9K7O2oHqsrXDVgph3yIqQkudI4rTmU7EldQeZopdJ85Rnc2tR6lb7wuPA0ClQyD+rKGRHn5MCJ
 7ABsZCTKbtDa4k4+n09iYuUio0DajhjCA2MRoj/oY6AP/kAsFN915+FZqe5G4XFEih4DrFC6QV
 LzJnM4FPe9bxBfNNoQa8uXAxPYleNwYhP95YPohbV/ElpCDcasKkun1FPI3p3xqMpqIKc4XapO
 vyQ=
X-SBRS: 5.1
X-MesageID: 47956556
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:ymUDwqFJ2329aqNXpLqEi8eALOsnbusQ8zAXPiFKKSC9F/byqy
 nAppkmPHPP4gr5O0tApTn/Asa9qBrnnPZICOIqUYtKMjOJhFeV
X-IronPort-AV: E=Sophos;i="5.83,325,1616472000"; 
   d="scan'208";a="47956556"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B9WBR3EqUi2THdOYJYGMhbysiTV6r7hxnkgZNWMZlwQ0G4lYq/z7/+NkYlErAQnsaWc+0pPv766jtkf9NfKJuKIu5YCVZVwyFrdX2hM6ioTFvW/zXJQIA32s4ka6xWrqX48PgHQ7W+7KooNTqDB2F+WUPInfd2hCey3huxBotHZxd1PGPQBdyhGbPKk6II8KbmjhA2suv9sWUsRHBLqQIA1qr7cqyWC66MCDjzy+bZ+v1c5QGAYCVeav86saNItWStbST6uspyeAEWw2GLZliCX5tkhi2Yir6bsAbok/8M6wDC45JoHwx/nXduXupB17PCIWitADidTXAGIfIWR99A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NicIRY1ocQMXug1W7SYrv5IuM2u2a3LlJUKaPsIkiSE=;
 b=WQD5a6/4JTzgn3kDGX8cBcSR2MVc/wBFZEjkMuRDG8IjqedRmTr8e6ZfXCOXVhmsStHyRlQu7rd0SKknrZYdU6tbmzRXlGbQMxGwjHEX7k0/IyniTioEcQNuWybh+sRsfeOxIWpN4uQDuYgJxe5jPG1/V3WoYhl3dFlS2A/Pm5i0DeZrrJGs7hyz0dHAkVjQkOu1FPJiSgrnTA3vPRZff7cUJJr7g9xarYlV0ksAsv8QLk0Q7L6BQL/rPTClCEPmuA/gUXfNqUQVROLySdxmWS9F6Zl/osQl7jhnnuX2APQf77N4X8wPMdMbxOHnTianb5UGrnx0t2EUH77hGMvesw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NicIRY1ocQMXug1W7SYrv5IuM2u2a3LlJUKaPsIkiSE=;
 b=vf9NACi9e3IeLp5vX9YoJS8wAhzuYoPg0aS6uN+6Bza0bCkqt5eMUiCD1HUsa6nXmNtIH1Eo+IcJLwxwsCa77/Kv/U8aXkdJ9ly0kcP2d1H69PIxxXj1NKIxFVXuF2ju/uYZqopXQ/W3FPz78SQ4q/PFNPNxhjb+a/iABMhO3U8=
Subject: Re: [PATCH v20210701 12/40] tools: unify type checking for data pfns
 in migration stream
To: Olaf Hering <olaf@aepfle.de>, <xen-devel@lists.xenproject.org>
CC: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>, Juergen Gross
	<jgross@suse.com>
References: <20210701095635.15648-1-olaf@aepfle.de>
 <20210701095635.15648-13-olaf@aepfle.de>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <e5f00724-61fe-fed3-35c4-35df837a49c2@citrix.com>
Date: Mon, 5 Jul 2021 14:10:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210701095635.15648-13-olaf@aepfle.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: LO2P265CA0061.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:60::25) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d14a51dc-d9cc-4524-e0ac-08d93fb63aa3
X-MS-TrafficTypeDiagnostic: BYAPR03MB4358:
X-Microsoft-Antispam-PRVS: <BYAPR03MB4358E05671918D75FD4D4AEBBA1C9@BYAPR03MB4358.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9y47SQyUJ5RZTg3E9SL1kdq+2XDFVtHHBxcj21neOg77kggkUwvjaHDmbyhyh6/ca3W/Fw64o+5s8Xo/JXq8PG4Ej91jYOUGD6qKPnUM40pRMB1qEkPAfpByFTTKdFZlj55Ftw8NcBjqDPDWysTpoz0D2bs3XWwBo00w629HO+M14JCXzk1uxHH6DmLF7yXVFFHDs7ErWjSd09w9gBh/4RJFi6fCNQlawXoX+5brz8r5pdT1QuhuW2TZrjDJEQ5boa+S436UYrFaeoV7fspccx2rLLvhBPMQudlD2g3gsU1yU+j12i02bWaWdVzgKDT4WCZoghZTwPWzTI//2TVAJzG+22Xw8H8b+Sf+oRnaT0zFBnfcvQ8pnu8exvpTalw8x7n2ZnaW6aS8DZt54Wmwwa6IvP1UcZiM7w8yDRBOpCBVxB6PXsIm0j/p0WBS2gCpmTMVE1gu7TGxpOZieI6QNUvCRBEcz7GDK+ytWnFp/YkeHiZMwXn4K0bmKU6fAi1IKk2wbLTtMPNzlz87Nu/E7UKIERuhvMeaZ4wJvtYUYwDJWH1QYuB06BJtENlG3EKHB7sfsyKIX1Uvd7nyFQ6Jpbb59jcAt4HwBgtU99PQdSXPc9vK9/Epgvx1kyvdvaP/taTpPU1t8X/R+sNaD5SOlYSrBz652+/QudjqPeEYBOG1issdXR84hslr9l6xT1b7WP1dFH2nSiRKaMCJREGmnAm07IrIsTvyrgE2RS8w3cQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(396003)(39860400002)(376002)(136003)(366004)(478600001)(2906002)(53546011)(316002)(86362001)(38100700002)(36756003)(31696002)(31686004)(16526019)(4744005)(5660300002)(66946007)(66476007)(4326008)(26005)(8676002)(66556008)(8936002)(6486002)(16576012)(956004)(186003)(6666004)(54906003)(2616005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K2xycnJicmdmTzRsdUIyQ25vQnU5aWZUQ2VTdjBSVEJxemxUM2VLcUJ1R2Q2?=
 =?utf-8?B?NVp6NXRMc3NlWklsd3FkSFcxUkc5MEdEMmFmL0JCZVpjSFIyRFdDc2dCSzdj?=
 =?utf-8?B?a2hrd2NRSEUxNkx0ZkNiL0tGRFpSZWQvNVJDNStFcTMrc3BpdGsxSWFVeEVk?=
 =?utf-8?B?SzgvbDN1R0FMMXBKc2JCY1RMei9xOU9NSGpVTEJxeW43Z0RqU1RodFRCZFkx?=
 =?utf-8?B?cXlpbjJ3YXFWVmhjS0tXeC9vbi8yK3hyS09weURIUVM1UHdMOXhoMWJvM3k5?=
 =?utf-8?B?b3JBcDRDRGZnTVRkYkRmZzU0Vi9qNUVuVzFrZEV4SWg1SFd4cHhHTjBxb3lN?=
 =?utf-8?B?UVJyR291KzNrVU82aVA5bUJVTmtCTzlac2RFZW1ic3RuaTZDVURja3Vlb05W?=
 =?utf-8?B?U2RrNHFScWNqTTlNcDZibWt4c3RFTlJVaTQ2eVpPbjJINkkreENKT0Q5SDI4?=
 =?utf-8?B?WFhFUmRMSzNzcS8rSStud2xTanFINENDR05JSjNtM3RQSVRzdUxtYTBWZnQy?=
 =?utf-8?B?M0ErRU9OdnJOb2FrNk9RTXpWcnlpY3hidUQxOE1WL3BaMjNlKzlzdnNJSnhS?=
 =?utf-8?B?WGZQWVZWQ3N4NEtlNUxlNU1KU3FSNTdkZFNJbTF6cjhIK1VpVTNaSU9oOTMx?=
 =?utf-8?B?ekc0dmlxejhFQ1REZHNiMCtEUDRGc2VTV2xJYzhGWWp1dUlEMTZjOHVVU0dK?=
 =?utf-8?B?TFMwdU9XNHI1dVYwVlNPTVJtZ2ZWRkdvQkROSloxQVNoWmF4ZFFHc1N0MExM?=
 =?utf-8?B?MlJqOG9mTVRzOHlNN0lhZ0xXNm9aRHd4RFFFR3A4TnE0dGFEUWprellndnZj?=
 =?utf-8?B?MldkUzI0cjk2dTJJa293QnUwdDJlYzNnMmJhNFZhMFFlcXlmVEl3MXNtb2Zy?=
 =?utf-8?B?ajFBcXA1V3A5cTdZTUQ0Q1ptTHBtdlRNKzNCS0tta3BKL2ozTi8rOHdsVzFW?=
 =?utf-8?B?UTdoTzArODNkMXZoMEJucmdGYnJjbnprUzF1SlFTbWNMOXZpc2ZVWDRJQ1Jk?=
 =?utf-8?B?VjZ5S3J2V1RQN2hZcm9PM09QYlF4cjc0Y3lxVG82Z0ZGcDlid1AyN2JUdno5?=
 =?utf-8?B?Z0dudXErVm9wMDNXdDhTYTdRSXhuSEJwRHRLRkk5Z25UU3U1Q0ROWEFXOTdZ?=
 =?utf-8?B?NWdhY1Ftc2JUaGdkQnFmTENrZGpwQVhEZVlwRi85bDZlSGpPZjJJdmFBV0xy?=
 =?utf-8?B?bFFoZEYraG42MzF3RWZuOXZQbEswN21ZbnJDWEpKWEZhNXBLclgyRnMvMW5K?=
 =?utf-8?B?aW5OVEttdzdldjlQeEZzVUlBVnBaZTZROUQ3OUZMcHhlM1VYd1c4azNleTVl?=
 =?utf-8?B?N2NuRFdHRDhhdlRORXhhZVdRc1lDL05id1J5VytDa1FpWFNLRVEyUUhLL3lr?=
 =?utf-8?B?V05mQXp1eHUwNDBGQjNOUG5YM2cyOXZVOFl3Mm94bVk4NS93Z2x3VVh0SzVV?=
 =?utf-8?B?WWM3bllSdEFvUXFkejBUWjE4Tkc5aHBjek4xeDd5QVczaWNzb0VwY0dTQjZm?=
 =?utf-8?B?alFKeTNjZzRjeVJVdHBuV2NTNWRNTk1NdmxEOHhEWXM2VjVFN0syN1FLL1l4?=
 =?utf-8?B?dnhzSloyemxPRVFweDNNVWducFlHU1UvWjJSa2lGUS9rSnQyQk1taDh4YUlx?=
 =?utf-8?B?Q0t5dkxRRmpyYlkyb004b0pWaElsV2RER1pINTIrbjRiYXJGNG0xUVd4dmtR?=
 =?utf-8?B?TnBTaXZWdG9vYUc3WlE4SDcvQnBzR1ZPK2FnSEFTdjJGY1QxSjJGMVpKRnIz?=
 =?utf-8?Q?PBYil2rT6Ha/MW1MhtIBOzddfITiVTWWJrGtYgA?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d14a51dc-d9cc-4524-e0ac-08d93fb63aa3
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2021 13:10:15.2230
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tBk3OSS+MnG3+XyVg73220+RTe3/srfdO4m8KXjaS79m4/0CZJxN046A+wDljDvRdFJIFJgkdagoFmBF2zlnVrPBe+JgClsNe3Fx2r4bG4c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB4358
X-OriginatorOrg: citrix.com

On 01/07/2021 10:56, Olaf Hering wrote:
> Introduce a helper which decides if a given pfn in the migration
> stream is backed by memory.
>
> This specifically deals with type XEN_DOMCTL_PFINFO_XALLOC, which was
> a synthetic toolstack-only type used in Xen 4.2 to 4.5. It indicated a
> dirty page on the sending side for which no data will be send in the
> initial iteration.

What do you mean "This specifically deals with" ?

AFACT, the code before was correct.

~Andrew

