Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 93AB63445FA
	for <lists+xen-devel@lfdr.de>; Mon, 22 Mar 2021 14:39:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.100211.190798 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lOKlw-0001nU-Lq; Mon, 22 Mar 2021 13:39:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 100211.190798; Mon, 22 Mar 2021 13:39:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lOKlw-0001n5-Ie; Mon, 22 Mar 2021 13:39:08 +0000
Received: by outflank-mailman (input) for mailman id 100211;
 Mon, 22 Mar 2021 13:39:06 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FSIZ=IU=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lOKlu-0001n0-Op
 for xen-devel@lists.xenproject.org; Mon, 22 Mar 2021 13:39:06 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2ae121b1-f4bc-4295-9144-dbffec54d022;
 Mon, 22 Mar 2021 13:39:05 +0000 (UTC)
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
X-Inumbo-ID: 2ae121b1-f4bc-4295-9144-dbffec54d022
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1616420345;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=s6t2bp70Zm8/cQavqkiKctT3lrKLuZWZ+RA0W16eFQM=;
  b=FhRx1JcM1vnYb4Fl16GW7258T9KCAPHTD578/ngtkjCNHj/ASFUYK5sA
   xjD7ShPKGOh1glXhrZB6LaL1f5ad+GrefGzXywPlXTRBmmr0pjvVKVkqu
   ivm4f4KbUbBI+8HmKYWNLp7iBGwKKj095NpWs7Z5T5fKzyshVDLvqRzWm
   I=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: MKLP+c4jYlDH+IWjF33KjXNWbb3utZgNFfaTl2gJX+y1x8qE/Yjq62tiDhFGVPr/yG1UFehg/j
 KsFQ66Ha6AfWiajzFBFITuliOMJr4SCutXYOnnuUHR5INzd6jy8ksQjWwnyfpMwFcNmwImweEy
 ay3I+BRqw/1hDLvUinoltzXp4tgUsvR6AgKhL6LVqIgHFyksIO4t21jKMEIXlejwMw8j4RM1Kc
 ziTTeDOpUdkfr1ggCxRW5kV0AfJUItgv4IvgJ/1EqcwfchplKYdumUEd8EPlKgVelt3CzHggqD
 8EI=
X-SBRS: 5.2
X-MesageID: 39704035
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:tM7AE67qyUcR9/bSfwPXwRqBI+orLtY04lQ7vn1ZYQBJc8Ceis
 CllOka0xixszoKRHQ8g7m7VZWoa3m0z/5IyKMWOqqvWxSjhXuwIOhZnO/f6hDDOwm7zO5S0q
 98b7NzYeebMXFWhdv3iTPWL/8O29+CmZrHuc7771NACT5ncLth6QARMHf/LmRTSBNdDZQ0UL
 qwj/A3xAaIQngcYsSlCnRtZYGqy+Hjr576fQUAQycu9Qjmt1iVwYTnGBuV1Ap2aUIs/Z4e9w
 H+8jDR1+GYnNyQjjTd0GLS6Jo+oqqd9vJzQPaip+JQBjHligODbJlsVbuYrFkO0Z2SwWdvqv
 bgiVMNONly9mPwcwiO0GTQ8jil6hkCwTvDzkKVmnTqq8CRfkNFN+Nxwbh3XzGczmhIhqAa7I
 t7m1i3mrASMDb72AP63NTMXwECrDvOnVMS1dQ9olYabZETc9Zq3Ooi1XIQKrgsNgTg5rsqFe
 F/Zfusnsp+QBehY3fVsnIH+q3UYl0DWhOPQk01sseIyTRhnHdg00sCxMAE901wjK4Adw==
X-IronPort-AV: E=Sophos;i="5.81,269,1610427600"; 
   d="scan'208";a="39704035"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lc97mgy2q2yp5/fb8IP4lrsI3i6VMCxoB0QI64ukZPryU9plC4gmT5n5TSQ4ef+tQxqBf7j9trBV4/B4ArLv9jAM7i2/RMJgmLUVJI+SOh9dmEZ/MgqtAzR/iBDOIJ0TTbI1UrIoE119m7A7bPoB6Qv4oULOa11CJRCs4n2nCJnK1fffQ7gg24QZB6GTPSVq+Opq5HNp0KvPqLAzm6WSpZMKUS5P7/7i2BnKsdYu6bKyzhx9/bs6Q6BrmPxgzU37zVtgURyaIim32mKhVtqQ+ayan+iOYh382i+M8jxJ0KjSUC0vp3EkvwRLnmB2s7Q9Pn1HUC3WzidkRVIKvqJqVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s6t2bp70Zm8/cQavqkiKctT3lrKLuZWZ+RA0W16eFQM=;
 b=grgWK/a5JpYyAfS8pJmAoeAAhKUQzaTUfsU0w/xA/LGwRiAHoSHhczg9afPnd3DYg6nva3thp5mHZbtLlufAakG6ZPGvlgHKHqqS+fQDGpbX2PFu0zjcWAHT0KFeSCjuiUL4aA0OqSW9erESiJ/+FPV8PJURA1UxgUe4hRFloQjLlmXLsB6U+3wyQVjV2oYdta3rWMyMYqAvfOKK5zwvNh1f0YntOAC92y/EpyawtWoBrlDSHm5o62beCMJxs2V6BeC6b0rstFV83hUWHa6SQgIZjyLOkw/BL1lyFtML4AK51wzcr0SVwjULg1eCtfs0fUiv74qkIfmgC/v2edI3kg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s6t2bp70Zm8/cQavqkiKctT3lrKLuZWZ+RA0W16eFQM=;
 b=BC+Ls6PcIeyaSuDBbkRZxVcGRrEuhP1MCHauR1AGe0fQokcQNats0I66nykSL1OprDJ/NE0MiVvjU5xzAJwxW+SwURX7JfC5TkivciLIYvmlFDRfdiQdahX9YeiRmouApDgL09/eqAa2bUDYO+LJj4SfsPIzlJJ0JO3+RfLQS44=
Subject: Re: for-4.15 [PATCH] xen: Create EFI_VENDOR directory
To: Jason Andryuk <jandryuk@gmail.com>, <xen-devel@lists.xenproject.org>
CC: George Dunlap <george.dunlap@citrix.com>, Ian Jackson
	<iwj@xenproject.org>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>
References: <20210322133301.11308-1-jandryuk@gmail.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <22ea1195-60c7-9f7c-4d19-cf3709106ed7@citrix.com>
Date: Mon, 22 Mar 2021 13:38:47 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
In-Reply-To: <20210322133301.11308-1-jandryuk@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: LNXP265CA0077.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:76::17) To BN7PR03MB3618.namprd03.prod.outlook.com
 (2603:10b6:406:c3::27)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 56b8b340-f093-4356-345c-08d8ed37d53e
X-MS-TrafficTypeDiagnostic: BN6PR03MB3124:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BN6PR03MB3124C8C43F8CBFCB5FD62667BA659@BN6PR03MB3124.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: L1k+lE/YbQot3lJXErLJpOtl5wlzZVmRIaqLOQZkP/xOGWaO9gtRvrY1KNmJMj/r4J4o1JGwWOOAP+3RLHF5IEHhZT4EoyNUwVgujQq0eYGYyjYkexf9YeAXmpsnlhCtDtdcWM32C2mUywW0gg3OdmeS/DmnzkNPcLPZwKo22YXjLe2C5Y4NS7BuDBEJTt/g2G+INAWUFH3KR6qaTMxBQgPtRJJoNRtypOmNlYxSfnIzjfpy1FZHPTD5tUhaxF55YLmz+d25vPyjjVjKMFHtO+hmkvFVxL4CFiRmNNrpP9DoXyaXze+m0QY4FQh+oPwroVnoWfpMw98BxFe1S6+FRFBILRAtrQn9YVgPd7hIpnkxb8eJm0BMEKJN77/LiSv4XJT4n7grIDE7fH4tuK/hrmQP+RAdrY+NWxsNzaZh81p5F3guemhGDoJn8mFvgmZNlftOtNfoU2zT4EM96RoEYZZ/R7Xkm0E2N1r1L8PDZPptGxsd2ysLfM7oKGzgiYyoJjDAnK+44/WOOfbfjD8LA+lojzr2oSFt5UxlLyWJcK2BlEbMw0/0iz4RTeiwAnWi07MJXpvLL+zvxJ3QDbUFiheNGmR6l1+KUt4yEmmarkFDPJbqYZDfpo/RJ42ZeHREBklAuVgcTdxRNoanXNUuFlwsUhswOjjvC/ixIl/caGf7pytZ9AxdBWofm0UHgpMUKUOXsgL+GJimdWHAsq0N0Ue/3kmANzXVmrRzOL/hXD8=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN7PR03MB3618.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(376002)(39860400002)(366004)(136003)(396003)(38100700001)(66556008)(54906003)(8936002)(956004)(66476007)(6486002)(316002)(2616005)(6666004)(4326008)(16576012)(31696002)(31686004)(66946007)(86362001)(36756003)(186003)(478600001)(8676002)(4744005)(2906002)(26005)(16526019)(53546011)(5660300002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?YTEwSExqMW5ndkpUTU9BckxqVDMvY0FLNGNqZCtRcGV1RTU2ME5oZWlQa2t3?=
 =?utf-8?B?ZmNJdU11cTA1MVgyMHpRS2VTbGErOHhtUm5iMlBSM0pORzVxOVN3cTZPZ2Fh?=
 =?utf-8?B?akliYXVHc1NiejdSRkZlaEE3U1pPL2JnbFFqVEt2RVQzVHVyYUdNY0pJd2dw?=
 =?utf-8?B?aGhYYUxFNno2TDFMS2lISmI0VzBkMkNHQ3A1WXJSVnlZZXhHSHpuUnRVSVZL?=
 =?utf-8?B?MEJSYWszR1AyVjhqVlM2ZWFhS2VBYm11YWFOblRYZGtzdS9QUGJZcmdMcmpY?=
 =?utf-8?B?RWtxOEdmTy9vTDJlaXlIdlpGM2FkM2o0V2N4WGszZXVrMndlTUkvZ1c0VkVU?=
 =?utf-8?B?MWQ1M0dtNkZUQWw2TGtWeDJ6NkwxMlJiTG8ya2ZXNVRVL1MrUkxYWTdpWVY4?=
 =?utf-8?B?VGRJbHdOdC9Oem84Qlk0ZllpMWM0VElkb1FFKzJWbDVZYjFJUnMzaDZqbjZj?=
 =?utf-8?B?anJEQVlBQnZTemszamYzc1NhdHZUWEJmR0ZsQUI1MDVja1NpWmt5WG1OMFd5?=
 =?utf-8?B?TDhuWExOZTU3TnRQMTFlbTRVNkdMSnFzUzZGN2V2OTdPMFZHbUtLVUkxWnhO?=
 =?utf-8?B?ZEpXcHJWSDFQYlVKN0tzNTF2K2VGOGpCVXBrYmNYZ2pPaldZZW0vaXBRUFA4?=
 =?utf-8?B?aU5EODRrRFd6cDI4ZWpGN2tYRmQzTXlFeGtZSkxwMzNOSm1rMHI2OU1MWjNM?=
 =?utf-8?B?SCtwU3RZcXpUSDl1NXRkbzdiVkZUUm1JSHpnRi8rQ01SMVVnTDVIWmg5bDJ4?=
 =?utf-8?B?UFRoTzdSTkNyWEQwVnk1M1B0MDJvRXBhVmREV2RpYVR1anlIN2kyRG9xRTVa?=
 =?utf-8?B?QitYZGxtb0ZKUE4wMHVqLzdJbTYwRVJPcFNkOXRLNkNWcWhxUXhKZm5pQjdB?=
 =?utf-8?B?MHZ5VS9BdmROaUpHZkd3Q0ZlNHROdG9OZ2V4TU94dUVSM21LVHAydXJTSlBt?=
 =?utf-8?B?dkZyWDA2UmhSY2NGdHl1aVQxTnN5bEVNZlNNWVVMN0VOdjhYWndxeko2SENo?=
 =?utf-8?B?b0FsNEVrQVZpWFM4QmxvSFJIWVBuOUtWMDlKRTN4WS9RSTFNcjlDNld1M2hO?=
 =?utf-8?B?L1hUTTNUTE9ISXQxVXU0VkRNNTJjSlJBdTI0ajNndW9rL1BKSHlkcFJLVVRa?=
 =?utf-8?B?ZTZjNTJXcFVXYUN4aXQrVytFb0tsWDdlTTRhbUVrUkp5dGlub1VRS1VoQzBp?=
 =?utf-8?B?TVhzSm9UeHQva0RmMVpabmUwamRPUEZmK3dBNnFySVdjMVM3U3h0NHBCbjJ2?=
 =?utf-8?B?RUFtdldnN3EvamRhdHhUcVNRRUhNemRNck1lRHRQa1E0aGE0UG54RmVyeEIz?=
 =?utf-8?B?dUNZeEhWaHVxUDRwczRHek5WM0pGOUhLd0twQ0VCSXk3Y0o4emd5UEdma1hD?=
 =?utf-8?B?b29kNjFjb251eExyalkrRFhTcVl0OTFFZUY2dzkzd0VGSzFQZHRLU01Fd2Rz?=
 =?utf-8?B?SVJURnVEcWYzWVczdGdNaytSblNZWnhtZlZXVklSNTVCbEdXbllqVWpCZFZX?=
 =?utf-8?B?dlhGWTRLS1B2S0xidEVqajAyZWtIUGR0UHRjUmJDNHhSMml5WDY3SWMwS1p6?=
 =?utf-8?B?NHNKck1hZy9qQmFJdlJxNU9jaUpMVVRKZE1SaUtJMHdMbmRMRVV4VHc1RGk3?=
 =?utf-8?B?Z1FJZ3VEcVBja2ZPODNwWE5CLzdwV0ozWUdOaStUTFNGaFpqOE8yVEFRSmZD?=
 =?utf-8?B?MlNBa0FxWmRRVEpmMjYxaDBpellPNmZERndXY2lTTXVSeWF3UUdFbm9hazFQ?=
 =?utf-8?Q?4js2vyTg3qEMih6tdnehin6wzpS0S4M2nUt78TB?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 56b8b340-f093-4356-345c-08d8ed37d53e
X-MS-Exchange-CrossTenant-AuthSource: BN7PR03MB3618.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2021 13:38:53.0642
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aN+4N/qDywruMLbehL359SCW+uzSOwYSX+aGgKOBYolmJ3FxrXZMUAEATcqLNuyI/fS2qdtEKLbgLuSNMYJFAzybvFtjwUYdl6AwBYm/+iQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR03MB3124
X-OriginatorOrg: citrix.com

On 22/03/2021 13:33, Jason Andryuk wrote:
> make install-xen fails when EFI_VENDOR is set (=fedora) with:
> install: cannot create regular file '/home/user/xen/dist/install/boot/efi/efi/fedora/xen-4.15.0-rc.efi': No such file or directory
>
> Create the EFI_VENDOR directory so xen.efi can be installed within.
>
> This removes the need for Fedora and Qubes xen.spec files to manually
> create the directory in advance.
>
> Signed-off-by: Jason Andryuk <jandryuk@gmail.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

This wants backporting, and should be considered for 4.15 at this point.

