Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 68813462D72
	for <lists+xen-devel@lfdr.de>; Tue, 30 Nov 2021 08:23:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.234870.407569 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mrxTi-0003H2-2J; Tue, 30 Nov 2021 07:23:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 234870.407569; Tue, 30 Nov 2021 07:23:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mrxTh-0003FE-VB; Tue, 30 Nov 2021 07:23:01 +0000
Received: by outflank-mailman (input) for mailman id 234870;
 Tue, 30 Nov 2021 07:23:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=AOGb=QR=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mrxTg-0003F8-Jp
 for xen-devel@lists.xenproject.org; Tue, 30 Nov 2021 07:23:00 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5834b49d-51ae-11ec-b941-1df2895da90e;
 Tue, 30 Nov 2021 08:22:59 +0100 (CET)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2113.outbound.protection.outlook.com [104.47.18.113]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-5-NBOJciyJPjKVinSGJhQ9mw-1; Tue, 30 Nov 2021 08:22:57 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4350.eurprd04.prod.outlook.com (2603:10a6:803:3e::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.23; Tue, 30 Nov
 2021 07:22:56 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%5]) with mapi id 15.20.4734.024; Tue, 30 Nov 2021
 07:22:56 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AS9PR06CA0293.eurprd06.prod.outlook.com (2603:10a6:20b:45a::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4734.22 via Frontend Transport; Tue, 30 Nov 2021 07:22:56 +0000
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
X-Inumbo-ID: 5834b49d-51ae-11ec-b941-1df2895da90e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1638256978;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=odC1n4aZFxG/47zdrIL8Roh9CeKcFcCglWyaqxvgrqE=;
	b=Kf/8qyo34UPtWp3p6KF3DcKQb3HjrwcEOrV5iXMQW2pBJ6Toaj60wyL6M9XzmmOhVJfSLO
	NIHVSfC+pu6HsZ/AGY4jJSxNbeWCa5d0VgaRDlsGN4EnfPeIXnBL1z85RIgBa23ewxZblt
	1GbHoVOoVeqxMjdqKnu2gVCINDyCTjI=
X-MC-Unique: NBOJciyJPjKVinSGJhQ9mw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ELoLqT+3Bc9Wo3Unx7hu7lcirkCslZ7W8kJ6kpcwTMf+lTRoA3wJQfznMY0GFBCeM+UqfLGsl30qgVX3cZXSp5foWlhdQG/dASFJhXHrgG5H0JpIUAa6HbUXhH7dTANGdl12TUD1fEFkbsmzODEQ0wHzOVImx9/EguCL20no3Oidy033/jWRkRbD49JCmDvXZ213+ZZnFFTs+UHyxI3UhnTRekYoxkTJMEmxZZhprvJ3Lxa+yKxgffIbuUZ7QDow20c2YvlFUGsL89FDtEd5KSLO+DCuuXsQOricCzHcONLcp1hemsQy4v5DMhdJI/0oXmC+C/Qdz39BqZ73LXivfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=odC1n4aZFxG/47zdrIL8Roh9CeKcFcCglWyaqxvgrqE=;
 b=Z4RQ0+MrN9qQyiLYPNEGBqcFpSWa6M/5qxzO4TNdihIEY5EBy4uSRXS/mT4emCuZQB4U1uw3tIoolcie+QffIkegEteXcTMw+pD7PLtcyKqOKZvQYNehh51XjPSMnHrGY9gSztDtipe1QkGKcqYu7vmhPwoYsWBMywCfO2vUMu4Xw7+a/FgNtVr6oO5b1HctgYprCBMuRv7+cFSH0ZDQAdZypTN9Hk50waQtfbAhsc+CE5NbqFtxCvDy38oHcfhSUhu2dR/2G3pN3A7QEDZRgQAObtQHbuL1PxQS+a2KLcnWsUZNyp0soYkAALbRwmfEX2CoPxkgB9F0FVGXhQIjiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <e421fc4b-afde-8bdc-9be0-859523512b9b@suse.com>
Date: Tue, 30 Nov 2021 08:22:54 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: Xen on LFS
Content-Language: en-US
To: Sai Kiran Kumar Reddy <skiran@cimware.in>
References: <CAAQMfLr_mWgdM3v=smYZbx+t8zhCP7_aCecDPJLLGRu=MH9E0A@mail.gmail.com>
Cc: xen-devel@lists.xenproject.org
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <CAAQMfLr_mWgdM3v=smYZbx+t8zhCP7_aCecDPJLLGRu=MH9E0A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0293.eurprd06.prod.outlook.com
 (2603:10a6:20b:45a::9) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 37cc7f3c-68f5-4fac-cd5c-08d9b3d23af0
X-MS-TrafficTypeDiagnostic: VI1PR04MB4350:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB43500C79475DBE16C86275DAB3679@VI1PR04MB4350.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ZaftNGFn1DlaEOmx7TztZyIMFlhABKkqshiD7FHeyqUqPTfMEB7qfyrbYfv+mvpay8BpJB/7Q61EhAHscZrbiVtQ3TQmC/sVkIq6T/aS4keLUZtUAmIT/CIwCRYKMwDhRkLL1AwNgE9uE6mMvfWWWgBwphiGS+Qb/vqgsXvqGnWLmyvMW7O00J1wfFutPg/L98v911K0lYpm3s0B2YIccVHpredYFPxWlIPbwp0F0g62LLLhHSynb7YTCM/WFiEdjvhNwIPo2nGW0SoFyiwsGS6i3QTT5N0aG/JD2z4YG8/Vmn8JmNhBNCXieqFvMcKdTJl5H7A3x9VJGDp4Nccc0IAMMpYBrTi3ld88hIypz1ns+WGsthgJ6w8yQrLQjNkgHVcGrdxqs7zRxEtTNATNmPU0AqcJP/kbijdG/2xoMZnB3NqoTp7g1tkh7Twx6Fjl3drBT9qCw3iGB3ooGyunhvcdycGctAH0ZwadkgupMcTY1ooEFSOmPnayiwcM9u7tk4lnYbMg1EwqQsku8eosbQaQL1xZyJFDFgK8m/9eAGT+RM1PYt1WGzoYEkkpfJVP34v+eS+K7xSbh9dO1w79dBpERuRaaiLBBNJcABjViOOtrpVdwquWEvKJeOve1UHUI/+2o3Rgh1lo6vDpRp0Bsp77UNQ5biXZtR1CHzDuwcHRflohL74RM3nEtYg0YB3OLHeoIVVX617OlXOU4qzFSU7rLhmyFo58aDmHQTRaiDIksAxJIagtdHoIbcjOBDFBjP1oqVOFcq0GE0t5keuMDlSbNJb6A9s/NUSu4xMUgTRuguEs6XDveJNrtSGbSF4t
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(38100700002)(16576012)(316002)(3480700007)(31686004)(6916009)(53546011)(186003)(6486002)(7116003)(26005)(956004)(8676002)(66476007)(508600001)(5660300002)(86362001)(2906002)(36756003)(8936002)(31696002)(66556008)(4326008)(66946007)(4744005)(2616005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VFNqRmJObzM0ZG4xUnhIQVFBQ3dlbWJ3MUlNdmJMRlk0UW5tVjdZN2hhTUNy?=
 =?utf-8?B?dyt2OXluUTJVWU5DOTducXV0YklHWWd5NjFaUk5COGlpMER3ZmhuUFlZQmxy?=
 =?utf-8?B?THQzYWJuZUIwNUpDWnJxeDBUVVllR2JWcjd0TFlSMmdBYVM2dVJzcWRySURr?=
 =?utf-8?B?K1h2N0EvRjlqV0l0eEphVzdobGNwYXNVL1lmUFZlQzZNcEl3N3ZPeTgxWHdP?=
 =?utf-8?B?Tkg4ZFJtUStjRGw3QkdLWDBLNWVzV3hlZGFHZVBtbm1QTzYrYVczeERjR2JN?=
 =?utf-8?B?NWxEak5qOTlRTDJFWlZHTFJrN0QyTGFwS2VlQXZhcTRzODVmMFM2QkdHbkMx?=
 =?utf-8?B?NHFuQzYvOEY1YjBKdk1YaHNnVmZnU1h5ZDdFUU9DdXhxQyt0Ti9mRXkrcVJQ?=
 =?utf-8?B?NDlnMXZQdTVseHBJams4Uk5laUJwQW5zQTQ4TkZmMC9sb09lSU90aUVmTUUw?=
 =?utf-8?B?K0VuZWpucnMwZkpIOGcyd3MvbmlLSjVneGFmS3VDeUdCdFJIcmV1VDJTa3pp?=
 =?utf-8?B?VWRVL0hmVnk4Ly81MEd5YjVrVUYrWmFxejRBTnBSQVhMT2orR1lHK0JiYXRH?=
 =?utf-8?B?YjJ3Z0ZTOTNieG1GUVFhTFdUdERMaVg3YnYyaS81U3RmODQzWGpOamFvblFh?=
 =?utf-8?B?VGNKcWt6UWNISm5kY0ZkaitzS0NDUUVtS0lwSWgyL1h5dFdKa1lVY1RMR2Zq?=
 =?utf-8?B?R3hoamluMDlnRHB4U1NSOHFhOFdld1NMNGNWMGJHbkYxT2owdFJHblAyRGxh?=
 =?utf-8?B?RXFNRkNoTlZqVkl0SGpVR1JaZFVoc01lTkNkTGl6YXNLTmpZSDJGZ0xVRmI5?=
 =?utf-8?B?MG8zQkwrdHdHWWdQenRoVW5mZ3VySXRYRDdWR0t2ZmZvSGVCYWEyNXhoR012?=
 =?utf-8?B?UU5UUEx0YnM4MldXSUFFN3VmemdzTXMrdlQ4TXRMa1BvSDl1SG9rTTNSUVF4?=
 =?utf-8?B?QWdpbnAyS2RGWksvK2FoamVqN3p5L3pMWVM2d1Q5bWRnc2NUNEdxUHlMZDZP?=
 =?utf-8?B?emE2Y1BVYlFFa3Y2VlNtdHl3QWZFeE1rWGpoeHZCR1B4Smg0dDVsN09xMFdU?=
 =?utf-8?B?ZHpGb2RpTlg0MElyUTEwbVUwTER6UG45ejBJN29YNHgrNjNBZUtrV0tGRVhK?=
 =?utf-8?B?bE9WTHdQazlIellIMW9KVHRUTXFBSUR5TDQ5UzBoMGxiVUk3TjVZVkdLbGtk?=
 =?utf-8?B?SXlmTjZIZTV5dElpdVAwcTZpVE1yL0x1SGhPdkZrNm14MHp0Snd4eXFlWlNy?=
 =?utf-8?B?WWp3TnZraHFpemxsUTBhTWZJZnBMdS8vbXlYRFNqMnlpTks3VFBCcnpZMVBK?=
 =?utf-8?B?eCtUdFl3dFAzbmYza3pJdHVmUG9DdlBOSHRNNUlPeHNaRDhGRzdzMEFab0ty?=
 =?utf-8?B?NmNDYllZRHJHc1VmQUN1bjVVOEJQOE11QUQ0NmJtQ0JQNEt2ejJMUkhnM0VR?=
 =?utf-8?B?bTAzMHBiMEkzOStRL3laUjUybDZvRzlRVmZWMTJ5MGp1OWpBZnVpVHdHS010?=
 =?utf-8?B?ZjVWM3ZwR3YyYmlEdXd4cW02WEp5NFdQQWZQUldqOHlMU1V4ZGs3U2drRHNx?=
 =?utf-8?B?QlFjdzZFZ25GTlViOFNBNmJieVVPWngxcUJOWEozSmZLMTlrZnlxdmNSTUxr?=
 =?utf-8?B?bDZKMTk1SjcvVUJ1MG53RVBHcmVIWTBOdnp0T0p6amNtSFExVjI3WFVRaFFE?=
 =?utf-8?B?cmdCQUtvTXB5b1lJWU1YNElna3lqMFZ6ZEtMdno2Mm05cUxRYmZOWUxIa0pj?=
 =?utf-8?B?eW5td1hhTXhmN2UzNVhtTjZSUzI3SUQra3lOOHJzbldGTmpiNGF1WUd2T0gw?=
 =?utf-8?B?MFdwMUhWdTlzWitISjZzYS9ybmJzK3V6dnNjanAyQURhcVNCUHc1RllLVkF1?=
 =?utf-8?B?NmI2Sk9MNExjY25zTXRKOW16akhnTmU1N0JZZmNKdkZEekZOTjN3L09Tc0pJ?=
 =?utf-8?B?TFRDUStSVER3THp1Mmt1bjdMaTBSbXI5bUVJOGdLOU9CZEJycEJnZkt0bXlF?=
 =?utf-8?B?UkxFbnA2bXFENjJCbWx2MmtEOHEzZ1BIdzR1QkJpS3kyVVBWZFo4aEszL3hv?=
 =?utf-8?B?TGlhOVI3bHh1cFJEWWI0Z05yaVNKUE5TMEFISFVlWklGSUkrUlZyT3RTdWFG?=
 =?utf-8?B?Zm5mQ3llZEd1ZzBTeC8rSzBEOTI4Z1NnSFRFKzU4TEhWRTNHUUdVYkM1WGZK?=
 =?utf-8?Q?VUlKOf+r+9Iou7RNlECbybQ=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 37cc7f3c-68f5-4fac-cd5c-08d9b3d23af0
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Nov 2021 07:22:56.5088
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ch/S8hy1cGz3p6QHCuMqAXiv9N2xV7tqEmK4u4B03z0rpjfxlbATSBWm7nQARKWjWgu52TgDT3B/OAUX03DfnA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4350

On 30.11.2021 07:50, Sai Kiran Kumar Reddy wrote:
> I am Sai Kiran. I am currently working on installing xen on Linux From
> Scratch(LFS) system. One of the dependencies of xen is "xorg" package. This
> package is present in Beyond
> <https://www.linuxfromscratch.org/blfs/view/svn/x/xorg7.html> Linux From
> Scratch(BLFS) <https://www.linuxfromscratch.org/blfs/view/svn/x/xorg7.html>
> manual. But, there are a lot of packages to be installed. I am not sure if
> all these packages are required for Xen. Also, is xorg a must, to build and
> install xen?
> 
> Kindly help me out here. Thanks in advance, for the support.

Thanks for your interest, but I'm afraid your question isn't fitting xen-devel.
Please raise it on xen-users.

Jan


