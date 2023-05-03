Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D58A16F52B7
	for <lists+xen-devel@lfdr.de>; Wed,  3 May 2023 10:08:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.529019.822919 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pu7XJ-0002CX-Rl; Wed, 03 May 2023 08:08:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 529019.822919; Wed, 03 May 2023 08:08:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pu7XJ-0002Ad-Op; Wed, 03 May 2023 08:08:29 +0000
Received: by outflank-mailman (input) for mailman id 529019;
 Wed, 03 May 2023 08:08:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=S1uT=AY=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pu7XI-0002AX-BO
 for xen-devel@lists.xenproject.org; Wed, 03 May 2023 08:08:28 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20621.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::621])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ae2e2a2e-e989-11ed-b225-6b7b168915f2;
 Wed, 03 May 2023 10:08:26 +0200 (CEST)
Received: from AM6PR04MB6551.eurprd04.prod.outlook.com (2603:10a6:20b:fa::20)
 by DU2PR04MB8758.eurprd04.prod.outlook.com (2603:10a6:10:2e1::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.31; Wed, 3 May
 2023 08:08:23 +0000
Received: from AM6PR04MB6551.eurprd04.prod.outlook.com
 ([fe80::768c:6df7:9afb:acd7]) by AM6PR04MB6551.eurprd04.prod.outlook.com
 ([fe80::768c:6df7:9afb:acd7%6]) with mapi id 15.20.6340.031; Wed, 3 May 2023
 08:08:22 +0000
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
X-Inumbo-ID: ae2e2a2e-e989-11ed-b225-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ifkwBpCendxZkEV9W6kA0Vw6qpd2Qm5WNJsTHbZW1oHTD0uBt23rug0QR8Ge/SL/KoJxK0svfoTZOID+gSXKpCQ6H27Z/HDfysoT0Hl9cg8bsPYBw1W5jFD4OD+eaSPWXvWMotDG0cKdb4LxLg7u40dU2af1stzUOyFjEQPC7Uf3Uy16rLcm61JG3A/FrhlLFaztTEbZWyaR3IptzD/FsS9k2rXo+miLS9vrQVkMLTDPxXEidoeh6YRUx/O7R6vhHhVqk4V5cOX6857X4nfr2t2fH1r1KRBylSEyS2KsNLx+pTCJYdmPKEKI6GwIDiIMrNKGynSl8M+Pnapia0nT9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DaxVrrA90NzQvNu/mjQcPr0kvA7Gj9knhoypR4X+QXI=;
 b=iV8/Xlb4DUaL29JayndH83Kz4ubk71ihxSlEJJW04n9e39Ovx2huPR1Zgs1hysbHy7+Ck+70jnBO+63OfFbrdHoJ3FM5V+msospBfGiHOuxk/siEdJi9vUZc5oOjlhpb3nmMSDzlrLiUlWEjNZSiPNCKJLs1yMMDTS9eyFh4QV/uCCZgYpQBOsAKX7OjkM/n1A0stUXZx9vkKrwWHPxuXTHnQ0OJFcmIdP2vI8W1Xe6VpB8YIqzfjdiGmkzTjtdoLWZy4HBVCvt7+aeRnuL1qP4KB+30OK9ZmxovvUNwQSfQ/vjERddH4aX5CbhDrhmp7QUVMZKc30CaEN4c771NMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DaxVrrA90NzQvNu/mjQcPr0kvA7Gj9knhoypR4X+QXI=;
 b=FbK+HGKm+aDVs5vyQPMQ562L6OK3Ur/Ai+cSV7777mJsbgmPNMgxwgezaXvf1rOhHDEnCH/JGSoXsT255H6TXeYNUQW2hsSJ0m8ESVUTBD7PI0wOfsZQymW+Ry6I15fH6r9ffIh6iNhjLK9z9uTPSG/XsLDk4cMkSPhfX0XlnBhgVU/IZ70uqjCrOIR2b97JVLbHM8J1C0LNgpKgKpMjoSN9pL5Zaak0sXDKCRC6apy+UYd83moZKTQ/TeOuS066oxdWDT/4RC1emjDHNHeyVv1ALyJnlBX/Ghenh8d9x+hhkKPcD1FjcyA4CqxZgJsqJgt4Nsrmfj0QeTOKqFAM5w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <5045583e-8776-0834-ca93-44f85888d877@suse.com>
Date: Wed, 3 May 2023 10:08:20 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH v2 1/2] x86/head: check base address alignment
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20230502145920.56588-1-roger.pau@citrix.com>
 <20230502145920.56588-2-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230502145920.56588-2-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0107.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a8::20) To AM6PR04MB6551.eurprd04.prod.outlook.com
 (2603:10a6:20b:fa::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6PR04MB6551:EE_|DU2PR04MB8758:EE_
X-MS-Office365-Filtering-Correlation-Id: 0500c80f-b3aa-4a50-55db-08db4bad9075
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ol80LB5lkYT8LRDvFeP04SVCgDs9LApsj3X6B5zvvqc7HCx7uJHB/QgffOis5b6ybaLDrU8BXXvWcJCGwCVLN25NgRmjZPf0zEvpPO4avuFz/v+56F2ZIky6bJw3mISwJyGii0YBPwUnHS5QUsVR2sX+Xy3hgBgHn1OboTsJ4n3SajxsdjxOEKeS/Xbki9bgMmdjuS50jGMU9wOlA46cA7RqPSHp5sDUiS/oPaVjWTWfvQHzfRKDqh5Qf7x5LLtNknb7FORIxY8qfhy0N5V4OgQxjr6nRQ5qUdelYEWn/OpnxeCee6e81LkZ6jYvtqmPahDwgN0QAOm/aBExXwtxHgaF3oP1DmSxLfqujklIup2unq4ITfFMw4spiilawDowR//BBlNuE3ltX9AE7YkFTAw1rrgnKGS+60EBV9TiB40/1EzJP8oZh6P2cvUBXlGiYWpRxgz90UPAWzpgnZXpImUq8Fdyr7Kd6zZIhqMP1zFtpyU8eurz9o4KVyImb5pJt/CrYk4fTVIna3TZxwU0AG8H7Bv/V3y4Ed19keawu536NIo6quZ4Z/93cNf495zonSlKcBMfW3zan+E1YX6KYqTR3qf6CCqkFu8KYv7yjEoHO/tdOU3hH7RVkqCR4PMLymhQcZMdW8qrNWrc50CVxA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB6551.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(346002)(376002)(396003)(136003)(366004)(451199021)(478600001)(26005)(53546011)(6506007)(6512007)(6486002)(83380400001)(54906003)(186003)(31686004)(2616005)(4326008)(38100700002)(6916009)(66556008)(66476007)(66946007)(8676002)(41300700001)(8936002)(316002)(86362001)(31696002)(2906002)(5660300002)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dC9Dam1RM0JNaktwKzRhOVBLcFN2YnpKK2pzemRBZVFMUEIyUzdkN2MxVXJs?=
 =?utf-8?B?Um9VaVFwNnVNNWVaZmNUaVRyZ1doNHgraHdRdWN3SnBUcHprZUg3cGNQSWNl?=
 =?utf-8?B?cFp2QVRMWi9OVVRxdm1mZWlXMk1JNC9COFBWUkpwTTJEYUNGZlNub2dwb2dP?=
 =?utf-8?B?YkNEa0VHMGlvWlJlUU9xRnVtU2tSUVFtZzQxOU9QMDN6d2FWaGY1UjBFTS9l?=
 =?utf-8?B?T0dWaW9nLzFTZ0NtSG1reVk4ODNKRy9pR1l6a1I1UzNocDlsd3BVVmVzTWd0?=
 =?utf-8?B?NmlxdlNtT2JqK2xqOFFRWFJaajVJa2Q1WW9mYmZlWWdWUStqQ2RqWko5dk4w?=
 =?utf-8?B?amtkdXVhMEZ6bWVzZXo2SEtaT0hDZ1BtWUZMZk5ndTVGbWE4UUMvYUl1UnIw?=
 =?utf-8?B?RlFVb2NZdWVvT0V2cUZNS3Z0YklPS05ZRDY5bW9IK3dJNjRralBrUnE4KzEx?=
 =?utf-8?B?WWVwb3MwM1VDLytKL1h1RFU2Q2FWeXM2SXZhVklwWjVEQXpYTTdXRG9YRTBF?=
 =?utf-8?B?bDJoemN4enU0Zk5VNnd4alpMak42L01BMmtJYVUrQ01HOWVrNkJtaTZQdVlX?=
 =?utf-8?B?Qm1FdExISUx4UGRsRGFGZ0tLN1hIOWw2Sy8vN0syR3dhK0IxdXFScmNyNENs?=
 =?utf-8?B?ZUJvZzRVQlRXZnRTa3FicDBXZkZZWlBpa2d4aXBwRHk2RUNDTkRvSXpnSTJa?=
 =?utf-8?B?Qk9ReG1Wam90UVZMTndzZEpKMTU1VjhhcjZPenRQR0VxYXRQVlpoV0FoOG9i?=
 =?utf-8?B?TGdVNTh2eC9rTmFVbXNNdGJ4RUI1S1k0Ky8xWjNLYXZzQ1FrcHQ3OFdpR1Z4?=
 =?utf-8?B?NEQ0d2lVZVFvUnBmbVA4WFgrbURzMTVEdytMc2d4N1h4dTExZDU0MG1YVDB1?=
 =?utf-8?B?dFE4R2NXMEJTT2JDNllvYk1EQytObjVvS0pCM21XZnBZSXh6ZDVoWFprYTNK?=
 =?utf-8?B?aG9xZHBxOEw2K3JWekdBUkZPeWxVcW5MYUU2b0RaMnJkWXdsWnAxUzgxaENE?=
 =?utf-8?B?alZDQTY0d2ZLcldNRHlHSDAreTR4aTR3T1MvdGR5OW5xb2pqQ01SRnhMMzBs?=
 =?utf-8?B?eUJ6M2hBV09Ia255Q2JHaVRDSFRCQjlsWWxHdXlOMXoyMEk3TFRpNU9ISkxx?=
 =?utf-8?B?NGRpblhmcVRDNkxXNFFWUXA1Tkl1QWU4ZmU3eWE3aDRzMVpWUm9DVnBKSFNh?=
 =?utf-8?B?TVJZZFgrY3M2bUVycUcyeW4xbUZMUE5qQW1BdzUxcDcvVEVNZWxRWWJWbEdS?=
 =?utf-8?B?L0lnOXpxV2Z4Zlk4eitDa2RzZGJ5cnp5all3RWNNb21ad2dCM3pjdUxCWHR3?=
 =?utf-8?B?OVMzK203emUzaGpxQ25wS2lUalZHcm9TQmh5T0owVCtOaWc4QWFYaUowRkFh?=
 =?utf-8?B?MUY4S2NpYUtaUXpnclYzcVNkbDlxQTdaVk9OS0tjZ3FnU0pKWTVwSVNubkFG?=
 =?utf-8?B?TWJEK2wxZzZmcE1kbHRaNXNtSEE4bmo5S0FSQTBMaDJMcXJpMy9vN0QwaUhl?=
 =?utf-8?B?OXUveWRqZ1ZMMmM1dC9Xc0h4YlZBeDhjMFpwdTRCYThrcWN5QjNlS08wZ0wy?=
 =?utf-8?B?Yk9qOXZSN0U2Zjc3U2pUb0ErK2ZDNUJGZkxSZ1Z1VU9ORmNMMG81bWMxakl5?=
 =?utf-8?B?dC95alFIM2sxdWsvUjltZ2RMdHExV0dKZG1odmtPT3hEaDdZS1h2RU40bEJJ?=
 =?utf-8?B?M2M3QUdQVE12ejNuby9zam1EUDg1U2JPZ1BBbm9ON2w0cXdoRytVQnFORFdK?=
 =?utf-8?B?alJLSjVCUjEwUjBIYmRPVllVZWZ2UitQNlEvWXBERzh0WlIwMW9TVzlKUEpy?=
 =?utf-8?B?Y1RHK2ZFZVB6OG9BYjZ4WkJOeDdMeC90MEFiUVJJZjZZNzQ4ZjRGdWNFOW5B?=
 =?utf-8?B?QStEMFF1QnBVVGlYOGg1NldMNTFpaXlUSy9OeUdsOXdHejZCbkVxQXhoZHZX?=
 =?utf-8?B?TmlxOHpBQVF1M2ZNcFk0UUNoTGJwNFkvV3BjRzQ2cGEyQWY1dklLRkQ0SFNi?=
 =?utf-8?B?VFVQbWxlSzJ2YnMvZTlhWW13RkxhckNWbDhiSHE4dUFzUVNselVTY0NJY3hz?=
 =?utf-8?B?dUxuY3Z3VU5jblFCTVUySmRLVjBmRXQ2bjcrNnI1NnZTRFNUZzdKTmplU3Vh?=
 =?utf-8?Q?Q83Jw0nWhx6iIdvX6KJyyKoXr?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0500c80f-b3aa-4a50-55db-08db4bad9075
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB6551.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 May 2023 08:08:22.9215
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YAJZAMBudSRTZrzLpMQ1kN7y3PD3XhoU3D0+0Jt6/Pmj0oG5MJeDIG3w7Up1p94Uu27ymrtA6/Vjc6wLnLPigg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8758

On 02.05.2023 16:59, Roger Pau Monne wrote:
> Ensure that the base address is 2M aligned, or else the page table
> entries created would be corrupt as reserved bits on the PDE end up
> set.
> 
> We have encountered a broken firmware where grub2 would end up loading
> Xen at a non 2M aligned region when using the multiboot2 protocol, and
> that caused a very difficult to debug triple fault.
> 
> If the alignment is not as required by the page tables print an error
> message and stop the boot.  Also add a build time check that the
> calculation of symbol offsets don't break alignment of passed
> addresses.
> 
> The check could be performed earlier, but so far the alignment is
> required by the page tables, and hence feels more natural that the
> check lives near to the piece of code that requires it.
> 
> Note that when booted as an EFI application from the PE entry point
> the alignment check is already performed by
> efi_arch_load_addr_check(), and hence there's no need to add another
> check at the point where page tables get built in
> efi_arch_memory_setup().
> 
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

Would you mind if, while committing, ...

> @@ -146,6 +148,9 @@ bad_cpu:
>  not_multiboot:
>          add     $sym_offs(.Lbad_ldr_msg),%esi   # Error message
>          jmp     .Lget_vtb
> +not_aligned:

... a .L prefix was added to this label, bringing it out of sync with the
earlier one, but in line with e.g. ...

> +        add     $sym_offs(.Lbag_alg_msg),%esi   # Error message
> +        jmp     .Lget_vtb
>  .Lmb2_no_st:

... this one? I don't think the label is particularly useful to have in
the symbol table (nor are not_multiboot and likely a few others).

Jan

