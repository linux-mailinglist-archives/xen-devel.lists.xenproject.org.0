Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 95C4D54815A
	for <lists+xen-devel@lfdr.de>; Mon, 13 Jun 2022 10:22:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.347834.574157 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o0fKQ-0002Pp-22; Mon, 13 Jun 2022 08:21:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 347834.574157; Mon, 13 Jun 2022 08:21:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o0fKP-0002O6-Ru; Mon, 13 Jun 2022 08:21:41 +0000
Received: by outflank-mailman (input) for mailman id 347834;
 Mon, 13 Jun 2022 08:21:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=i6zz=WU=citrix.com=prvs=156a1e8c4=roger.pau@srs-se1.protection.inumbo.net>)
 id 1o0fKN-0002O0-Kj
 for xen-devel@lists.xenproject.org; Mon, 13 Jun 2022 08:21:39 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d7a28907-eaf1-11ec-8901-93a377f238d6;
 Mon, 13 Jun 2022 10:21:38 +0200 (CEST)
Received: from mail-dm6nam11lp2171.outbound.protection.outlook.com (HELO
 NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.171])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 13 Jun 2022 04:21:35 -0400
Received: from DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
 by SJ0PR03MB5583.namprd03.prod.outlook.com (2603:10b6:a03:28e::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.12; Mon, 13 Jun
 2022 08:21:34 +0000
Received: from DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::40af:d5f4:95eb:d534]) by DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::40af:d5f4:95eb:d534%6]) with mapi id 15.20.5332.020; Mon, 13 Jun 2022
 08:21:34 +0000
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
X-Inumbo-ID: d7a28907-eaf1-11ec-8901-93a377f238d6
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1655108498;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=R9fY8n18h6g6SC38J+5bz83yfpSa/d201CTWahKP9Y8=;
  b=BLBbOO35NZaDpAZZI4XNjJpcrZ9JfI9JO+PJxogWiqZb+imw1LYblYuD
   5E6lls4N+AnGv9JT9NgAFeez1pMJ4eHNcXteRxhfBEx091P2KcJlCuCl3
   UUmwHArl1ZoMCcNkY6Ms3YO9dvgNWIaMGyveLKwFsFGoAQAlIgLVBn7qY
   Q=;
X-IronPort-RemoteIP: 104.47.57.171
X-IronPort-MID: 73286110
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:wm3PHKDTJvUkMhVW/zXiw5YqxClBgxIJ4kV8jS/XYbTApD4j3zQBz
 WEfXjyDb67cYGf9LY9zboXk8kwH756BmNNlQQY4rX1jcSlH+JHPbTi7wuYcHM8wwunrFh8PA
 xA2M4GYRCwMZiaA4E/raNANlFEkvU2ybuOU5NXsZ2YgHGeIdA970Ug5w7Bg2NYy6TSEK1jlV
 e3a8pW31GCNg1aYAkpMg05UgEoy1BhakGpwUm0WPZinjneH/5UmJMt3yZWKB2n5WuFp8tuSH
 I4v+l0bElTxpH/BAvv9+lryn9ZjrrT6ZWBigVIOM0Sub4QrSoXfHc/XOdJFAXq7hQllkPh9y
 dxPqKOeUT0TGamchNVCCDpKQg9xaPguFL/veRBTsOS15mifKj7A5qsrC0s7e4oF5uxwHGdCs
 +QCLywAZQyCgOTwx6+nTu5rhYIoK8yD0IE34yk8i22GS6t5B8mcGs0m5vcBtNs0rtpJEvvEI
 dIQdBJkbQjaYg0JMVASYH47tLjz3CmhKmQAwL6TjaYW5G7Klwd765j8HOT5U/akfvh1r1nN8
 woq+Ey8WHn2Lue3yzCI73atje/nhj7gVcQZE7jQ3vx3hFyewEQDBRtQUkG0ydGikVK3Ud9bL
 00S+wItoLI0+UjtScPyNzWnpFaUsxhaXMBfe8Uq5QfIxqfK7gKxAmkfUiUHeNEgrNUxRzEhy
 hmOhdyBONB0mLicSHbY+rLKqzq3YHERNTVbOnZCShYZ6d7+po11lgjIUttoDK+yiJvyBC30x
 DeJ6iM5gt3/kPI26klyxnif6xrEm3QDZlRdCtn/No590j5EWQ==
IronPort-HdrOrdr: A9a23:x5FoTq3IWhZwlHACqiwYhgqjBS5yeYIsimQD101hICG9Lfb0qy
 n+pp4mPEHP4wr5OEtOpTlPAtjkfZr5z+8M3WBxB8baYOCCggeVxe5ZjbcKrweQeBEWs9Qtrp
 uIEJIOdOEYb2IK6voSiTPQe7hA/DDEytHPuQ639QYRcegAUdAF0+4WMHf4LqUgLzM2f6bRWa
 DskPZvln6FQzA6f867Dn4KU6zqoMDKrovvZVojCwQ84AeDoDu04PqieiLolis2Yndq+/MP4G
 LFmwv26uGKtOy68AbV0yv2445NkNXs59NfDIini9QTKB/rlgG0Db4REoGqjXQQmqWC+VwqmN
 7Dr1MJONly0WrYeiWPrR7ky2DboUMTwk6n7WXdrWrooMT/Sj5/IdFGn5hlfhzQ7FdllM1g0Y
 pQtljp+6Z/PFflpmDQ9tLIXxZlmg6funw5i9MeiHRZTM83dKJRl4oC50lYea1wUR4S0LpXXt
 WGMfuspcq/KTihHjDkVyhUsZaRt00Ib1i7qhNogL3X79BU9EoJvXfwivZv3Evoz6hNNaWs19
 60TZiAq4s+P/P+TZgNcNvpEvHHfVAkf3r3QRKvCGWiMp07EFTwjLOyyIkJxYiRCe81Jd0J6d
 /8bG8=
X-IronPort-AV: E=Sophos;i="5.91,296,1647316800"; 
   d="scan'208";a="73286110"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IjaUUD3DZ18yWJteyM281O8OMxrAqjG0T+AIv7VQocfn9dwBcdatAp/UWMCFfTV+FS5/aNpbfubNnuEP74G1S6RXn18ITFoo/6jpzQBU1iNk3AS3P0zdB5wbh+X3qCaZ4A1TlMTZMWzA4RhzMuqZpPE6mDVKA4MadIx0Qug6sFJWvXbwPg+muAp3Ae2aC6BHWGD9olhYhCLmsJ1wCehRiHY9NFxdt3AD17MSPDpmYxorBZYb5yPD7kBUURduFVnPKRL6T1e5pnjHFsQNNrAcElWyS61NCWgxwwQnarAbGV7op2r6xQGD+Y4mbdhAcEN5WFziIBMf2vjDoFf5LlXB0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6oKQVHWQuTJ1uGEX+rVQcqENNtypqDEfE7TBGxyKO3I=;
 b=RyUQshTsIryXXWhqHnNJs1NdS2I4VxIMPmzFU9EDSFrhqVgxV3EXfo+fqI+073ccHTXOkuJkyi4X7NBaOGh9YxmE3alQ8ynmF9SFcjCnDKXNKNBke9TP1Ed8bmLXPHxod54an9q3PbRiONMwAujSLs7vwUuvVcl/rkxjpJJe4GDld2242Hz7dUiFWQxP0zz2q9kOGhJLbCfS3ClS2pthM2e4cC0YSBMIj6bccl4liIBkNyt9o4KZo/B5+7SS0ItOec8ZymF0vfML06qTgC3CdPVhGYRUx+2ysV1gKd1acopFn9Nfx5vKeh7ybc59bJ6l8/Y7WircJqSY7lnJcCJIGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6oKQVHWQuTJ1uGEX+rVQcqENNtypqDEfE7TBGxyKO3I=;
 b=oj4RsBNEfAK15mDo4/0QOu5euX7OIArmmjKajE+L9/qYkEb5JUG8/j6E5MRA4zu0eZF817KqhJguWeDcmc8T2U7AbDoFpvWaIwMki2pcom9LyvQBBYo6fmjTVODIGeVNDhPmkb3EKQakYM9PwLY8GONDucK5XyKwTS4dcnGM6tI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Mon, 13 Jun 2022 10:21:29 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH] xen/console: do not drop serial output from the hardware
 domain
Message-ID: <YqbziQGizoNX7YFr@Air-de-Roger>
References: <20220610150651.29933-1-roger.pau@citrix.com>
 <3a462021-1802-4764-3547-6d0a02cd092f@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <3a462021-1802-4764-3547-6d0a02cd092f@suse.com>
X-ClientProxiedBy: PR0P264CA0153.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1b::21) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e01d4043-bb09-46fd-ffff-08da4d15ba1a
X-MS-TrafficTypeDiagnostic: SJ0PR03MB5583:EE_
X-Microsoft-Antispam-PRVS:
	<SJ0PR03MB55834DDCBDDC9FE4FA7A76308FAB9@SJ0PR03MB5583.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	/UKZvWwrD6JCCnfZpIoXw4ZXWco/sTlnLo3G8e+cPH53DfMkFj1QbmJlutI2GDbJgfGbuAJ+ghuEIV5x8rfxVzS8Sd2wDjX65tPTgHvHmjZ8FyxHXI1DUDCpiEDw8bY/qs3o5JB7So9pfkU5Ig/w7o9k8bTaEDw2ei5cbHQh09FF4R+nAI3+HVETGyvVYeMG/vINff23Y/4tRGvK/OuDxziw9ZE7D2f9QeJHY5tv6ZjtJjV+eeydrLMqYMzTNma9vCxzC4xjEkwfZHHVXDA5J76v1xZZZVrvXHGnSEhHsieKS9MDFYEYVvMsL23BI3HQq5JH7KoYcVpTWXI4BEWAiI4BAIKUJPJjsP2DtUfpxc/VErDSdyjUQsgeobKCK9tjbR5iC/bsU2Zrqe7If+wNP13GoPEbYUlmKgumXahDtBQ62v/wADk6yqYD0ViL9MVaxr9TXNwRgc9AmGrdSsb7lMPS4a15tnw9DiPpdJbEl5WGUDzoVgYo9GEynLQhihuzQTpogpTXrTBA5mqYLtKeezKz5WO1SbfZ2Cu5u1NRsHJcOu/iQL+mXEEmDqJldsddsS/owWmuS0g3F0TxXu2VwSx+KhNGnpgLSaYaAd2anX6+ciIBvAR7a3QCv7Lja+eb7cJxfZdoVy6IelZIS9qCYQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(7916004)(366004)(6916009)(83380400001)(86362001)(26005)(6512007)(8936002)(316002)(82960400001)(9686003)(6666004)(38100700002)(4326008)(6486002)(186003)(66946007)(66556008)(66476007)(2906002)(53546011)(8676002)(6506007)(508600001)(33716001)(85182001)(5660300002)(54906003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NEIwbU5iVmUxaGlESDRveVN0cEJvR2kyaDRrWmhxYW1jWTFkM0F0Tnk1b2hV?=
 =?utf-8?B?QVVvT0dTK0F3Y1JLaTFGTWF1L3I4WW9zODUyajFaRS9LVzlxcVN3anpzaWlW?=
 =?utf-8?B?ZWlaZ0xaK1FaTUZ1NlFIdVQ3Y0J0UHpGNklCSXZLTmRSQkcyQVNWL2pScndS?=
 =?utf-8?B?WWRUdlFUS0ttMDY4aXRtRWlkVTBudDI0S0ZSbW41a3VNc0o2L2FZRFNkd3dx?=
 =?utf-8?B?MUtVRG4rOVVwcDJ1UnZicE5YUlcxN01nTWx4c3ZOK1NSbnFranY4U0NPSGgw?=
 =?utf-8?B?UkU5aFZIMkVPWXFDNjNyd1hBUjErYUNESXp5dU84K2ZubWM0djJYUjVSN1pJ?=
 =?utf-8?B?ZjNhZ0dPR1J0U3BkcDBJUnJDVFNRVkRJL3A5Y3BNR0YvMTZ1cEhFVHo5eXhE?=
 =?utf-8?B?d2hHREJUVmN3R2xmYTFRZ1hlSW9zdkxaZ1BYMVE3aXhtUUI3bllHMzZMbkdV?=
 =?utf-8?B?M1F6dzNGUlQ0VGZFd3l4VXhEZmswTWdBQkgzbjZXVUJlbjBVSlBrRUYrOW81?=
 =?utf-8?B?dmwzbDFWN1A0Wnd1Z2RsWFU3end3dkF0VWlOcEo5MlkzdktIRm4vM1pwbXdq?=
 =?utf-8?B?WGVtU2k2OGpyMWQxSDN3SE9EMFlpeXVDeklRNVF1cmZURldSSFcxbWJ1MVhP?=
 =?utf-8?B?a1ptZ0lUS1k2V1FVa3RZU3dWcEt3dU94YnFIVW1odEZGL0w5UXB0aUVzR2ND?=
 =?utf-8?B?RTU4d1JiYkVFUnREYk9zQXh1ZUJVUDJXNnRld290cVNiNlpVdGJaOUgzam1W?=
 =?utf-8?B?dmkvRUlLNjNBMm9GZ0NvKzREaGNPdHdXRUEvMTc4TXdVY1Fsb1d2VDNTY0hY?=
 =?utf-8?B?S1hybXh6R01mWFdoQ25HdzV3QS9qdDhtNXFUeHFpME5PdDF6c21XTDUzWXY3?=
 =?utf-8?B?MS9YYlVmRjJucFZxWSsyaWxZWC9wNHNwM1FsNFZkTjlXMWpCdnZxZE1GWGhD?=
 =?utf-8?B?MVhrbzJRbEtsRmZhWDNBaTBEMHJnNWN1TE04eGFMbHVmT2FkQ3Z0UmNYSEZ6?=
 =?utf-8?B?NEpUQ05IMWhxUjlqeVpkUENaVGtld0tSMUpHTmY1OCtoR3BIa1luNHdxSlRI?=
 =?utf-8?B?WkZTb0NqTlpJWHJGdVRwb3grMUdFV0tpTnlPNjQ2UHBWZFVsd0pQTkY5QmM1?=
 =?utf-8?B?MjFlU3pTT0tjVmNiUjRoU2JSSnRTSCtzbUZIZTVaM2NSTlRicitkMzhWYWZt?=
 =?utf-8?B?cFdLSVh4N1o1SjBFbm5MZ2ZCT2FOUXNCd0N3YWh6UzdxbTg0VXp2MnBEMFZB?=
 =?utf-8?B?UVlsOFA3TVBYUjlEMC9JWEl6Um1DRXc0amhFM3hicktJZ1RubHpPMGJzdWc2?=
 =?utf-8?B?SmFQQVZ0aWJJRWRjN24xayttdndUNFpWQWJuVmp3VUVrRDBkYTBxdjhhR0RZ?=
 =?utf-8?B?NG0wSExTVHYyQWNsWkw0aGliUmFzWlI1eXU0aVZRdnREOUZpVHNHc2VHbHRv?=
 =?utf-8?B?anBxbVFLcm1kSXVFUlh2c1kzR0Q5MmxjVEo5TUNGUEp1MmdLTHBPWTdiaW0v?=
 =?utf-8?B?NWVGekZvZ0hPVzFJNFlTZ0FrdjJ1U0N1eEg4MG9WaExyQkxyazBRUDQvQUVD?=
 =?utf-8?B?LzVCbVFBZ2JVRjFjMTJOcXFweVlZb2dKbnVzbVNJSjJYKzJ5UGgzT1VOK0dp?=
 =?utf-8?B?V3hSLzVjV3VwRDRYZHg5N29xUXhzeTcrYWdoM09yV01nb29PY3hINUgyb25H?=
 =?utf-8?B?YnpyNDBlTktKM2tXejhkRFo4L1RUOHRnN2J3OTJ2c2tqOFFjTzA2TXFFTTRZ?=
 =?utf-8?B?RXNmOEdTS1hRbjNsRWVYMlB1SGRKaU5Ydy9BcEhSYUNtaG9IQlA4MG5ZaHRw?=
 =?utf-8?B?WGhLdTZVSmEyL0E5dHpwMTFxekN0TU5UVm9CL1BnT0tFU2dKY1pMR2prcEZW?=
 =?utf-8?B?ME1OclY3dEtQM0ZYSXRMdFpUUWdPVUV3dUlwNWdtNzhLVkZYeEpkNDhOaldX?=
 =?utf-8?B?SCtPMGRQQ0FvRVM0MTNVbVNFa1R6bldGckRLYkhPZDRUS3RJT2drOXRqVmpn?=
 =?utf-8?B?YkFGVFJ6RGxwV1JxRjJSN0RCQkFFaWo5a0lIcWVmeXJJWHh4KytGWlorZFRt?=
 =?utf-8?B?UFM3NHdldFI4a1k4ZldMWmJLSlprU3haelF1ZnRUN2xHWUM5bXJFbkN6aEl4?=
 =?utf-8?B?S3ZwUGpsL0ZEYUd2U3pzSGkyOWg2Y2s5TVZEWUhCQTl5K0Z3dWNhMWM3K2p2?=
 =?utf-8?B?dlBUL3p0MWtKdUxPSHFEUFBVU3dxVVZpRFZKRmNWSlNiUFlSTnRNdUdZUHBn?=
 =?utf-8?B?bWtzTEFmTThRQW5FRFhnRkgzWGhIY1NEZkFadGg3MloyZm1NVzBCVlY2Z3dr?=
 =?utf-8?B?U0FFQnJhbFRCOFRVdStuSktOOXU1R212ZHgvWmVTbzQ4YWR0YzJ0dTlSbXQy?=
 =?utf-8?Q?bQ/0k9xwzTB6IYIc=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e01d4043-bb09-46fd-ffff-08da4d15ba1a
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2022 08:21:34.0517
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BkudsgFTz0+OBeqEMwxanKkpTVIxPsAWK1lTBDZbai+uZ6qPUfOy/bdDxxnRw9xHg0EKokT/C73efhm53l/hpA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5583

On Mon, Jun 13, 2022 at 09:30:06AM +0200, Jan Beulich wrote:
> On 10.06.2022 17:06, Roger Pau Monne wrote:
> > Prevent dropping console output from the hardware domain, since it's
> > likely important to have all the output if the boot fails without
> > having to resort to sync_console (which also affects the output from
> > other guests).
> > 
> > Do so by pairing the console_serial_puts() with
> > serial_{start,end}_log_everything(), so that no output is dropped.
> 
> While I can see the goal, why would Dom0 output be (effectively) more
> important than Xen's own one (which isn't "forced")? And with this
> aiming at boot output only, wouldn't you want to stop the overriding
> once boot has completed (of which, if I'm not mistaken, we don't
> really have any signal coming from Dom0)? And even during boot I'm
> not convinced we'd want to let through everything, but perhaps just
> Dom0's kernel messages?

I normally use sync_console on all the boxes I'm doing dev work, so
this request is something that come up internally.

Didn't realize Xen output wasn't forced, since we already have rate
limiting based on log levels I was assuming that non-ratelimited
messages wouldn't be dropped.  But yes, I agree that Xen (non-guest
triggered) output shouldn't be rate limited either.

> I'm also a little puzzled by the sync_console argument: If boot
> fails, other guests aren't really involved yet, are they?

No, but it would useful to get all relevant info without having to ask
users to use sync_console.

> Finally, what about (if such configured) output from a Xenstore
> domain? That's kind of importantish as well, I'd say.

I would be less inclined to do so.  Xenstore domains can use a regular
PV console, which shouldn't be affected by the rate limiting applied to
the serial.  Also that would give the xenstore domain a way to trigger
DoS attacks.

Thanks, Roger.

