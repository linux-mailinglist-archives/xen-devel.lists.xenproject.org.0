Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E15A74743E6
	for <lists+xen-devel@lfdr.de>; Tue, 14 Dec 2021 14:53:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.246761.425561 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mx8Eg-00007m-FX; Tue, 14 Dec 2021 13:52:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 246761.425561; Tue, 14 Dec 2021 13:52:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mx8Eg-00004z-Bx; Tue, 14 Dec 2021 13:52:54 +0000
Received: by outflank-mailman (input) for mailman id 246761;
 Tue, 14 Dec 2021 13:52:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=pVj/=Q7=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mx8Ee-0008U0-O2
 for xen-devel@lists.xenproject.org; Tue, 14 Dec 2021 13:52:52 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 206fc71c-5ce5-11ec-85d3-df6b77346a89;
 Tue, 14 Dec 2021 14:52:51 +0100 (CET)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2113.outbound.protection.outlook.com [104.47.17.113]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-29-aXnlh77NNMm4b7U0JLeoRg-1; Tue, 14 Dec 2021 14:52:49 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0401MB2448.eurprd04.prod.outlook.com (2603:10a6:800:52::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.17; Tue, 14 Dec
 2021 13:52:46 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4778.018; Tue, 14 Dec 2021
 13:52:46 +0000
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
X-Inumbo-ID: 206fc71c-5ce5-11ec-85d3-df6b77346a89
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1639489970;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KWKFtm6ZXF44qiSUmXPznQZW3QCKhJEVH8CFZzICRLA=;
	b=asfyLl33AGSg/wF3dS3+lUiQoq5PKj02l9tKoeF+jgIIIjRjwOKSLCK5BXhIMEHQsnbOtY
	CnrNqMBNjJzGeYvkrFZAZMtZ0OuuI0WK4QxZQ+k9gW/zPYf6yCg6Apt7WQrZn1TRcSgwJs
	q5Miv+vglrIvaXsmotD/5R35464vYCQ=
X-MC-Unique: aXnlh77NNMm4b7U0JLeoRg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W62S0eSkHVUTsuPvS4CfpMMOtu0Dw3sNDu08KpPc1T9y1TZEau8wWDDWW7cAMQ/3xAEH2BGkWrnslcmAyeh9kitL8DllNy3Yge/rWZlVDxVZ1j8xwxwfNhrmMzYXzoejA2speypVqfN6UK16W7MOFD7ZUYY9Zbs2belRqp5LQIG4vYNelawxZaUt6x7eBlfbY/KCOz9S7AR639uptdwy3ulYvkEqf/wn6cZFh7x+n1yHM7fUE0+DFyLc1lTlmG1EfZPV8NYz9nY5dKNp34yTTjFenH3zi0db8uJUE8s0JrZAXfhtWItXLijp5tFnrWY+bZ2t4/qtaYyeO/8A3h4Hjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KWKFtm6ZXF44qiSUmXPznQZW3QCKhJEVH8CFZzICRLA=;
 b=hEXCIS/KMQZ7gZuz2STxDrmU2jF9ukf3Tqlqoolgl1dOAM072CGiRJ7UVe73h101Io2w9X5jbwTRebYXBs8bk3vj9hF6P08XeTTuIV2w5osnOhwdihdwIor5J2jVMJw3pYG6yG10rbKoogE1VEmO6zwwPBk0Q28Jbvz1Q9HpQBPzUjbs7s9xRl26UQw/4QusLhSQxt7rEu6ES75pNOI2w/0cpXITViZ9CfXwENoJw5e+pyCmDClFgayCaNDv0gzFMZuWDll3S+R5AAgA64MRvmQnjznHjyAjdeKRlgac/BYYdMxqHW/kUSU4lVOzezcLBiOQX15sc1AU/MyDURUC8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <18a2487b-f754-d971-2e89-93e54b7b951b@suse.com>
Date: Tue, 14 Dec 2021 14:52:43 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH] libxl/PCI: defer backend wait upon attaching to PV guest
Content-Language: en-US
To: Jason Andryuk <jandryuk@gmail.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>, Anthony Perard <anthony.perard@citrix.com>,
 Juergen Gross <jgross@suse.com>, Paul Durrant <paul@xen.org>,
 Stefano Stabellini <stefano@stabellini.net>
References: <5114ae87-bc0e-3d58-e16e-6d9d2fee0801@suse.com>
 <CAKf6xpt6+ZkXK5uXyp15UyA1J2AhtZWipW04M1xD1Yx4nx3jOw@mail.gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <CAKf6xpt6+ZkXK5uXyp15UyA1J2AhtZWipW04M1xD1Yx4nx3jOw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0003.eurprd06.prod.outlook.com
 (2603:10a6:20b:462::9) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d5a1cc19-37ac-4c1e-34e7-08d9bf09020a
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2448:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-Microsoft-Antispam-PRVS:
	<VI1PR0401MB2448B392B74D47282695123AB3759@VI1PR0401MB2448.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	sUnom1axr6L+20WFYfdCmczZQrgIz49x+SXeviYMh5mDSFEJ8RePURaCCQGZDhfJkb9dNtagixNtPyNgyMfkePFmkgNWwzLzJkwt4MCnjV0CwAzE3tywF1wrQlbGrcFPt57boZOXmuCgMzDsY+WICa1wGXvgTQwsfuQ9oGEd8wTXodmn+j6aAwwJDiIsDD6ePNomxN0J/JuZl+25G71mPaCYwPRK9H5ZVXW5sOeSuvlirJgxyoQ9b3gxz5MmdrOgOUHcXvfyCZmBejYKe4mGeszUJy+7x0JrOmtaOveM5Tsn/x+hXTOaPAqUqj6fQP8uTkTsJpaRbD1tOejRty8wEvn4aR87E7RCpvGphaBHEriPidtWc2Y1YrwmT8N7ymF1ueeuqoUZpf0eskz/6FL1qnZs54bTzkfdrIitgQGhgVwwmy7197PIZgxoKyDOCfvhcJHdadxaBaqpE/AKTaD68/mPhSczwPOC29/BeMwbKgSwCEPCXsaB7rcTD0Iiqtll502fDUgel7kZVzVDX3cC5gDhL11wRjGDKq7JQLMpEQf15a0G7gftkupqPnAQ7hjfxc3woLEoO3CuqOjYbKqkm9kgA05cJ99u3dN8ZcabwCs7Tf/yqnRRfZRNuu4g1021DicC7jLOqhuI8aCTaBsH4rLImIsxJFMbA4NqFWIF3aUT/GJ4rX7E/Hgy+6dFY3mcv0/OrEa9qJezSTuPxpBRGHw3V9NBvia192HARirH03O7Y9Z/W54r/yED4MaSEOlz
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(26005)(6486002)(86362001)(6506007)(53546011)(4326008)(31696002)(5660300002)(8676002)(31686004)(186003)(6512007)(2616005)(508600001)(6666004)(6916009)(2906002)(66476007)(8936002)(316002)(36756003)(66556008)(66946007)(83380400001)(54906003)(38100700002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WmJrVzlwMVJsUVFHWWZWM0d4c093bDNRVmFrNmxjdGRKQ1I3T3R4ZEQyeGY2?=
 =?utf-8?B?WHh4V0dHL3FyelFEeVhGUXpUaDE0T2g1UENNL3piaERZdmVWWlgvbDAwdmJh?=
 =?utf-8?B?YzZrc1ozc2JESlBHQ0ZsdE1PWExNVVhmY0N2aHVyMTFBbnpYcVpRbkFtdThz?=
 =?utf-8?B?ZVM5UW45dm1PbmFkK0V6ZWhkMHVzYVlLdEEyaDVidFlPS1UyRVB2M1N5Ris1?=
 =?utf-8?B?TGFDSW1iSmM1WXBqTVk5TnpBbEFCRm02Q3F2VmtPY3NwL2c3RmtuZmRkQldv?=
 =?utf-8?B?V2NBYVdWMUdJYzY1d1RDaFd1VUNsYytRVUZDUi9Vc1MrVWJmaFJPMzRCdEdQ?=
 =?utf-8?B?WGxnWjhYeVNaSFJKY29KRVhSbTA5NHVjVENJMEw2RFBRTWZNTXVrUFBCdHdK?=
 =?utf-8?B?NWJvMDI4OTg3MjA0L1FsZDZONGdEcDkraUxpYmxjTUFOd2l3WEhDdzlvMHh0?=
 =?utf-8?B?eVZPWFN5VFF3YzEvMzdRT1VybGtkQkVQYlE2UU1rN3g1VUdGRzFxd3B4UkRF?=
 =?utf-8?B?OTB1eGQ2QlRvS041RW41Y2ovNC9uZG1ZTVVycjJzTkpwbjFrSllsQU9JS05a?=
 =?utf-8?B?QVdvZUdSNVh4alowbmNibXRqMzdkcTdKL0gycXpXZnRTMEl5NE9LM0Raem9F?=
 =?utf-8?B?cUtjbzlhNXh3WHlnSFVyQmdmR2NBbTEzcnI2QmtuWVFSeFV1NVdyZ2FmK2x6?=
 =?utf-8?B?bmY5V0JjVWJUOXFMakN6dy9zWFVBeFFmemFoT2wxOGhBTFhISlF3NWlTcHZF?=
 =?utf-8?B?bUh5RmtEVmoyRWdhYWd5U1ZJRkY2NzVraGdWYnY0QWkrcDlrYlRlQXRPUUdo?=
 =?utf-8?B?ZjkvTmJjUTM5b0xrMmY1VGVtT2llWE9XUDRkK3hJL2tQcGl1Ym9kUitmZERR?=
 =?utf-8?B?UDE2UklkSHRoWjlHNi9mUHRMSjVndTNBRjkrTlh3Yk0xU0NHOFdraFNxbWZK?=
 =?utf-8?B?UjU3bGpIQUNWQU85MkdBM01HUnpkWDRtdFo4Z0RxbXNWUXhHV0ZFeEx5UDJu?=
 =?utf-8?B?NzBYaEkvNUgvWmtwSklpdTlycXdxRjY2SlFoRlM4Q0I4WXM2ckNlc0xpMXVr?=
 =?utf-8?B?RUk1WjFlWnJVNHJwR3R6UnhFM1M4ZzdDb2lEZCs5TStSL21OVjVQV1RBNVcz?=
 =?utf-8?B?T2diRDFVZ1J4SzBJbm1ueVlCM0U5eDNNLzN1Q3FkcnpQaHNaYVFvbTI2ZHkz?=
 =?utf-8?B?SkJDQ3pjODB6L3hnbW8zZWZXY1JvQ0N3TisrWXVsNkJKbENyakNiOHB1RVBi?=
 =?utf-8?B?OCt5bG02YlZhRUdtUjg5d21QSVZFU0d0dk1XZ2hSdVNJZjVsZ1JtaCtET1Jt?=
 =?utf-8?B?NUg1RGI4SjV5N2loa09qdENqcUUwc2laZ211V21hYU13bjQ3K1pwSnJJNEtn?=
 =?utf-8?B?UW02MFNzZXU5MG8wWXViN3hUVnRRbGlhYWVrQ1A0OEY5YTRqT2wyQmVHMHpH?=
 =?utf-8?B?amdCMWE2bEhEQ3cycEY0WDlFMDBodU9tdFlVSElKYnJnZk9qYVdRNkhCNkJT?=
 =?utf-8?B?SGRTOGp1ZW1TNFZvNFdaUEhQRmNxN2JVSWM4c3BtU3BVc1A3cmFrVktpVEx1?=
 =?utf-8?B?bWNJdTdadEt2a3RuT1RmVTJ0UG1uVS9uemEveUNHbmRRYlprOEYyNkFZMXpS?=
 =?utf-8?B?M2c4RHIrWEovQ3g5RU9PR3A1eENOaFJ4TjFZMlNjZ0RseklNSWg2QVoxZnhF?=
 =?utf-8?B?Y0xVU0pRQ3Y3dkl2YWl1cHkyYmIrTjUyUmk0RlFIc3FpWWR5VUNuNVJxN3Rw?=
 =?utf-8?B?SHdwbkxBaDJ6V0lnWUYvNUJ3RERGYld4OUludEdQOG1aZk9SL3o3VHpLMSts?=
 =?utf-8?B?cXNRL1ZRaEFxZEFNTUIvL1RyOTZwTDBZU0JHYWlianBGOE1YemdEc0lERGtT?=
 =?utf-8?B?bG5tYi9pU05iTWcrcVgrcHI3TzhWMEc0V2RTc3J4d3hxS2Y0V0h4Mnhxc1ht?=
 =?utf-8?B?ZVVRYkpUNGZ0VU43eDRtU21laFdydmgyTmF2b2swUFBVRWlMMlljOVJtV2ZG?=
 =?utf-8?B?L1JLU1UwZ1RIU0c1aTJmQ1ZaQTVsS0wwSVVrZlF4TDhlTlpZMlpRMll3ZlA2?=
 =?utf-8?B?N1JkY0h5SVhsNGlWblcxZ0M0V0dEUzFFbTNQRm5ka2NSVHpuUWxyeEtZU2Nz?=
 =?utf-8?B?K2VRQ0JoL1RnUmdUUmx6bDUwcnljQUJ6SjhPN3laTkZCQkZqZTlDdFZmVUtn?=
 =?utf-8?Q?Y/C+r5IMjE2MmwJzkq1n5IY=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d5a1cc19-37ac-4c1e-34e7-08d9bf09020a
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Dec 2021 13:52:46.1159
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O1PlPuvDFt0S8phx/ULuG3CBRZBwfDKAzg+toQgKaouon3XZFHPMgNdXhz36C5FGVXREHrMqIQ7DSU7NyZp4PQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2448

On 14.12.2021 14:34, Jason Andryuk wrote:
> On Tue, Dec 14, 2021 at 2:50 AM Jan Beulich <jbeulich@suse.com> wrote:
>>
>> Attempting to wait when the backend hasn't been created yet can't work:
>> the function will complain "Backend ... does not exist". Move the
>> waiting past the creation of the backend (and that of other related
>> nodes), hoping that there are no other dependencies that would now be
>> broken.
>>
>> Fixes: 0fdb48ffe7a1 ("libxl: Make sure devices added by pci-attach are reflected in the config")
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> ---
>> Just to make it explicit: I have no idea why the waiting is needed in
>> the first place. It's been there from the very introduction of PCI
>> passthrough support (commit b0a1af61678b). I therefore can't exclude
>> that an even better fix would be to simply omit the 2nd hunk here.
> 
> The first time a device is attached, the backend does not exist, and
> the wait is not needed.  However, when a second device is attached,
> the backend does exist.  Since pciback goes through Reconfiguring and
> Reconfigured, I believe the wait exists to let the frontend/backend
> settle back to Connected before modifying the xenstore entries to add
> the additional device.  I could be wrong, but that is my best answer
> for why someone went to the trouble of adding a wait in the first
> place.

If things are as you describe them, then the change here is wrong: The
waiting gets moved from before the creation of the new device's nodes
to immediately after. Yet then I also can't see how else I should
address the issue at hand, so I'd have to defer to someone else; this
may involve undoing / redoing some of what the commit referenced by
the Fixes: tag did.

However, since all new nodes get added in a single transaction, I
can't see why waiting for the completion of a prior reconfigure would
be necessary: That'll either notice (and process) the new nodes, or
it won't. If it does, the next reconfigure would simply be a no-op.

Jan


