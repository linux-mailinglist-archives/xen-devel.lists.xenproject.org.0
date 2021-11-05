Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EBF83446361
	for <lists+xen-devel@lfdr.de>; Fri,  5 Nov 2021 13:31:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.222257.384345 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1miyMF-0000E2-Eb; Fri, 05 Nov 2021 12:30:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 222257.384345; Fri, 05 Nov 2021 12:30:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1miyMF-0000C1-BO; Fri, 05 Nov 2021 12:30:11 +0000
Received: by outflank-mailman (input) for mailman id 222257;
 Fri, 05 Nov 2021 12:30:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=mr/O=PY=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1miyME-0000B9-H7
 for xen-devel@lists.xenproject.org; Fri, 05 Nov 2021 12:30:10 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1d0d2b9b-3e34-11ec-9787-a32c541c8605;
 Fri, 05 Nov 2021 13:30:09 +0100 (CET)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2051.outbound.protection.outlook.com [104.47.14.51]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-40-17nFVlFgOKKvdk-SO7fhVA-1; Fri, 05 Nov 2021 13:30:07 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0401MB2607.eurprd04.prod.outlook.com (2603:10a6:800:58::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.18; Fri, 5 Nov
 2021 12:30:05 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898%3]) with mapi id 15.20.4649.022; Fri, 5 Nov 2021
 12:30:05 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM5PR0301CA0018.eurprd03.prod.outlook.com (2603:10a6:206:14::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.19 via Frontend
 Transport; Fri, 5 Nov 2021 12:30:05 +0000
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
X-Inumbo-ID: 1d0d2b9b-3e34-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1636115408;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Dsp1ygk8FLkuJXZ38flLcu/V0KRF1ARfOvhMMgkMWjw=;
	b=S8cPGqiRZeaLaDUqrimo+5EYIXPxkHCbgQDnUHMydatONQ4dBm6tuxAK8I9fXP+goz6Fzy
	uOq/m4MzWLeZ4l3GzKWnyH/rSdBXDuG8EJdSKt6RtWaVQGXGi3RZamBbCgt33OMHMfJ8xC
	hgXd3/voTICeLy8qxBWZd0HTBobAqow=
X-MC-Unique: 17nFVlFgOKKvdk-SO7fhVA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XP7cVYANgneKSi19cdx1iCbjPflK1QfSL9CRXt4frs+iaYkwmbKXnEpiotAwSLRZzQgXJ0Rem7Eo3GIZVdRhZF5Dk3sAWvs91pY52AKoskXdzijzCDwuPB+gqnVNdM8au21lGKJb0EOccHwdge30V72HKU/sWGLjXD4LWktKOurnW1JLKVVy/f/ZY3AIh28tvM1Ng9e+zp0vKRdPBMxAg3UAlzZ4Mk1v9cmV+YbWIO1HyYn7besCpSXE7Tajw+Y/ky8GyJSxfK/Fwms8czgjiW3f60ANUXTSAxk0O5+nuOzteCl1r+KKZ4kgTK4GeP+VZv9n2IqUEZhGobP6CoK9AQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Dsp1ygk8FLkuJXZ38flLcu/V0KRF1ARfOvhMMgkMWjw=;
 b=XywiRC8B8JuHXkNVK9nwpYVaRByG5da1Qw9jPdOiySVw/U293NseHi/KbWVdKwGrmbD5qI9S5yvuUILnaVNIj8aKET9BJRTa+oP2c37ilasgYtEI+84S5NQtQay6PUwg6IMnpCbJoC9JjcQ6fFISnjuySAvma3YfRq77gl5EleR1lQsEMvn4YZn5cR5o0Vgsxo4mtohKlDNnyQaVYDoc6ccdsBl++QfGuiYPQCWPty/WhM+1+59NYZthysBgf8EhX8mo8fFP7uPEQvPV0QcQdVpWjKaGQxlwIoJyrf/Bemg6T9Kc/Gk16LcPlMEs5XjqqOJ3Yl0ynzDI8xH0xktLjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <d88cfda3-54e4-2323-f536-547879380815@suse.com>
Date: Fri, 5 Nov 2021 13:30:03 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v2 0/6] x86: ACPI / APIC / IOMMU interaction
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM5PR0301CA0018.eurprd03.prod.outlook.com
 (2603:10a6:206:14::31) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 16bd955b-f539-4656-394e-08d9a057ff2b
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2607:
X-Microsoft-Antispam-PRVS:
	<VI1PR0401MB2607E96E84373B40D8FFC4DCB38E9@VI1PR0401MB2607.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	t/hEtIKx/dPqGs9WGs+ylxa44HcLz1I+9CPLvAg7L7mY20NFuI5YtB+iV6KslZb08j94V4Lo6cpAgT3e5X6clATcXeUPpL5jY8CHWNOD2ds0PE0jE/8jPZrlx15iKTYMGSs+Vmfb1525EfBHOAgiqA7lp0wHfm4tRDIXwj2UREtNBDL7MDvkRrUn6xKxV869WwsMhBMxC4MPqo+8G9TWfThd1dLdXRdTkdrCiDG+x8yErmoUmeSbKR0MQROa/w//RMEu0lgZp6Wo1+N9gzM7pvaoHsFs4ZVv/FaazoLnb6PJtwh0bNIy7dbHxw0i6SG0OueyDoEL2GXnRFSUAxZPDtOHNN2kncy/pzHG8yNFOrkcxbPG7oBijAEZu+EPsRVjamOzdCHcm7HNrWyRXvCs3klhjAA3YTglLxa0xVvUQQKdiKZUOkQ5nRfBgPEaesgWsGcNCeogtwZFFXiNEAbwTTmEeZ7jJ0NuCtMwTw7tVwHpmOd7ab42/Z1vHGVNhSVhuNFYd4uvc6iq0X7G7Uu5rZUUSSm8kykx088+MnJtlBWs9NR8hs7NPSIINLejfORXkyFUgdbgCOqNA2RTNGNushqfsxGek7a0wLm3pq596oE0nZZesQbnLRxD3yvBJNSxW/8Aic0asiGIqhoMwgRMPu3TWsFQlr3OxVqEe3BLA6yvkxmdAVzRP8cChV1kXiry4ywhfp5E3aaqs2s+QJRWUmjP0PcLV3hJ3Xfw8VqIgSLt/LYqQbTIzqpaWD4LgT2i
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(54906003)(66556008)(6916009)(956004)(5660300002)(2616005)(31696002)(86362001)(16576012)(66946007)(508600001)(4326008)(8676002)(36756003)(316002)(66476007)(186003)(4744005)(2906002)(26005)(8936002)(38100700002)(31686004)(6486002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eTRWYUFua0R3ZVVjanZ3M2N6bzVOUGFVWmc4dThOa25QM0s4OTdlK1lJb2pU?=
 =?utf-8?B?YzdmZjN0U2ZkVmlsRUdrZXMxc3REMlU0UkRhRU5oeE9qRG5YS3JDMkx2T0ZS?=
 =?utf-8?B?K2hFT0FJOUd0azZVaVZxc3pmakQ1MlhYR2JXSGVNZ1dqa011RFBNNHVmR0c3?=
 =?utf-8?B?Z0txZk45TG5Cdms1Y2hLcGRlRzdSMlVpTURzT2x0aTFmb1lFK2hta2xJL2VV?=
 =?utf-8?B?U21TZUwxL0JHdG1NWEhHNHZNL2Y2WnZ4Z1RPVnhCSTRlRG5pUzh0aEN4SVVn?=
 =?utf-8?B?ekNmWEk5bjFvYlE0Mkc0bmwveWFmNStlQWxhQ3krWlRRcHRMQWhobUFHNi9o?=
 =?utf-8?B?Mm5BVDV3QXp4T1E2SDVjREJhYzFUS3VBV0Z2bE4zVVlya204bGdGdm01cDNW?=
 =?utf-8?B?S01HV1lZY2ZtNmRHVk5lNkp6ZncwRHZhaDcydzRkTEkweW5ENmF5R0FYZWxV?=
 =?utf-8?B?MWErdUlkQUFkR0h1YW5qVVZYWldHcERoMk1KTGpQY2hVL3ZKTG1JZ1o3K01z?=
 =?utf-8?B?NWI5U2ZUL2tYZURnU2dORnYwZmMrQ0hRT1pzSkJURW9XVWVHM2lvMFNGL0hX?=
 =?utf-8?B?TDhDeDd6a09WNG1IVFQ2YlA2dUhHcHpkbXJ5TzQrQlVnd2RQL1U0NDMrZXVj?=
 =?utf-8?B?U2wvODFZSE9VZUtmK21sanFodDV1VVJBTU51a0JDNVBuSGtmNUhWSUN3dW1G?=
 =?utf-8?B?Z1JuNlhveDRPWGhLUnBLaDh3bXdoTjhKZzlvU1RCbE5pOFRhd2ZqQlZmS3hX?=
 =?utf-8?B?OEV5K2VLZHdDL3VCb1kxbVFGK2pxdkl3Y2tEVWJPdlNpTFJGMXNyVGRsclJB?=
 =?utf-8?B?QU9ycjd0dUNpdnQxTHpZclgzSG1SQ25vQlJ1Z25IR3AxT3JSdmFYc2tuWUNq?=
 =?utf-8?B?YUJuKzZMVitVVHVxeXdyQWhpOG4zTWg4ejZJeXg3ejhsZ3gzQ1F1SWVpVHRJ?=
 =?utf-8?B?VnFnOFROU0lLWlBqcnVqQ1ZHSTU5bnJQcTZBOG9PTytRckNBY3ZHcUdZa3N3?=
 =?utf-8?B?Z2tEaWt5VWJoTkVaMUIwcE1wZGF6clVxeVlOdVM5YXk4VFRBZVpnWVc3QzZo?=
 =?utf-8?B?L281b0JvSFJoamtaZk1yQVljU1hKNnhvd3BXdHZESXVxVThBSHh4TmJWbTVY?=
 =?utf-8?B?Zkk1MkMzQkpnVVBqVWY3KzJuNW4vRnpUL1hHbDRtNXFaYWpVQTM5aDNYcndx?=
 =?utf-8?B?dCtsM3cwMlJGNFN0VjVnK0U2b25QY1dhUEFBQW9JL0R5cmxoTHZtcnBVNmY3?=
 =?utf-8?B?VlJXbExwOXpPU3orTHE0cEFSK3FCcVJrS3ArWnJLSXhvVDFMcTVkMi9FejVj?=
 =?utf-8?B?QnhCY3ZEcFU5ckNHZXNvWldTL1UrU3p1UnZnRy9QY3laVHJUMjJrWXR6QTZQ?=
 =?utf-8?B?Q1RhNUhRZXBNL3FZMU9ENnpBQXp3Y1huekZrVXhYQjk1dUNJRjZZT0xFaUVY?=
 =?utf-8?B?VGw2blk5SGdSaG55UWpCdmszaWswcnllYW5iNFhRb3JlMkkyblZwSlh0OFdZ?=
 =?utf-8?B?dEtFUkpuRldHSU9PbDk2a2VZUlBlbmRvV040WHdLcDltY3NrVEU4N0E3MlNR?=
 =?utf-8?B?YWZadmJ0aUtXNTI5SlpoM2dKejVBZzYwemR5SHB6U1laRkVKOUhaVWZlWjRB?=
 =?utf-8?B?bkpmdC9XVGVyQlFadjcwWUZnVVp4NE85M094cW9RYnloU1Z0Zmx2Y081aEhy?=
 =?utf-8?B?RzBPalVPanoxMkVscG84SDBDamZISSszVG1qYVByYzR4V3pKNkc5M2tSSUJB?=
 =?utf-8?B?VHBwTWg4TEJRRXI5MytvWEkvMWFLWGloVTQrSjNoMTFKdFBXR0RLblNuSE1m?=
 =?utf-8?B?M0dVek1TUTNXcEZUQVdqZUh1TTRMRTMxK2EzZ1JzQ3Rwb2NvM1ZwQkhWbzJ0?=
 =?utf-8?B?SnhPcFRLL2k3WU52NUJhTzRjUWVBWjB5eWtnMTA1MURZajFnQnF6NUtFK2pG?=
 =?utf-8?B?blk2V0ViNkJMeFM0NFVwbDJTWDNjSy9kWnZJMHFVeGxFVHRsWFF1aVZJcFgy?=
 =?utf-8?B?clgxV3MvTCtDWFZXMUg3TmJXS1kxR2NsaXZTNTNoNzVQRkFwUkVLdzF3amxu?=
 =?utf-8?B?NHh1RWlWby9BVjhHQkZzaG1NRHIxUFVOVU5qS2t0R2tYcTc3Vmo3ZHNKSEl5?=
 =?utf-8?B?enhZWnpYb3QvVElXMzNMV0pBV2VzQldmUjRMWGxERjMzOXFSYWtGUER4Z2ZW?=
 =?utf-8?Q?hvfiuZoyROGbK5WLaJOSl0s=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 16bd955b-f539-4656-394e-08d9a057ff2b
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2021 12:30:05.5376
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /NS+bof9I3OadD12MfOFEhqSkUyLVUMTejlcKin2ceJMdiwFyE4uKehPKRgGH2T2U8pa1VyzR1NB7cH0bvRJFw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2607

While reworking patch 1 (the only one here that I consider a candidate
for 4.16; see there) I stumbled over quite a few things that have long
been ripe for cleaning up. Hence the tail of 5 further patches ...

1: x2APIC: defer probe until after IOMMU ACPI table parsing
2: APIC: drop clustered_apic_check() hook
3: APIC: drop {acpi_madt,mps}_oem_check() hooks
4: APIC: drop probe_default()
5: APIC: rename cmdline_apic
6: ACPI: drop dead interpreter-related code

Jan


