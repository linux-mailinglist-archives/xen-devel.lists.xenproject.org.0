Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BB902464C78
	for <lists+xen-devel@lfdr.de>; Wed,  1 Dec 2021 12:19:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.235913.409208 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1msNdu-0001Up-MC; Wed, 01 Dec 2021 11:19:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 235913.409208; Wed, 01 Dec 2021 11:19:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1msNdu-0001Sc-J2; Wed, 01 Dec 2021 11:19:18 +0000
Received: by outflank-mailman (input) for mailman id 235913;
 Wed, 01 Dec 2021 11:19:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gc09=QS=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1msNdt-0001SU-K4
 for xen-devel@lists.xenproject.org; Wed, 01 Dec 2021 11:19:17 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f8f2cb4c-5296-11ec-b945-1df2895da90e;
 Wed, 01 Dec 2021 12:08:12 +0100 (CET)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2053.outbound.protection.outlook.com [104.47.14.53]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-12-jtsYoZX9OlGWnqfnTOiT0A-1; Wed, 01 Dec 2021 12:19:15 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0402MB3936.eurprd04.prod.outlook.com (2603:10a6:803:23::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.23; Wed, 1 Dec
 2021 11:19:13 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%5]) with mapi id 15.20.4734.024; Wed, 1 Dec 2021
 11:19:12 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AS9PR06CA0023.eurprd06.prod.outlook.com (2603:10a6:20b:462::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.23 via Frontend
 Transport; Wed, 1 Dec 2021 11:19:11 +0000
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
X-Inumbo-ID: f8f2cb4c-5296-11ec-b945-1df2895da90e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1638357556;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ON7hD8sHqeqLdbOjK5/eHp1WPkZVK6dUNLVok3+jMsU=;
	b=gieOwb2oV5XYwfRATR8fGY0+3nolpSSd2/qEiZhtzPYeKY1CSbUBQrcawrPK5HmVvhDLG6
	RRRElHJUo0Cl42xBXExU1iiRhg/udLOZLtRb33M3eeFSyI1jUeQFE73uPexwDmOaiuVvP6
	7/ufPl7RivsL6JIPwb3gonrqB6gI4Zw=
X-MC-Unique: jtsYoZX9OlGWnqfnTOiT0A-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LbndUAh/fKP4Ne1jfBS+5I0sfutBK41rFsS2pAUG4H5PYBaxfAaUN9Xxi4kSyyKGykECNql9kGSg4e0zMYQ6Yb2c97EgelGyq/nZDug7KdCC26xHlwamFc5Tz+Xu2O8w4FDCYZzfWfafhKgvyFiGHGhYMYeV0YavfOSNl6w/nI48QPbl6WH9pQUz7zsVxzZ1F2+CcmM35yr2deGA0lpij2LBdKV/PXBvZ1M9ASRuoblg/sMSIJquafni2Dv90zRK1HDJ4qzBtUEzUV5zcPWFhc4Er2yYzjjwZo6SIonHZK2ONN2/y+6/G3LK3ThudNxKM2gDab79Im7vduX5EumIiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ON7hD8sHqeqLdbOjK5/eHp1WPkZVK6dUNLVok3+jMsU=;
 b=cAU6jqKvAchNwxfxxuwSWr7UCHR8ujJNURsCPHB+DIppl8zuklf8iunR2iWvf94zYhrCMO0rKyEfrllDavuTyS4lHtIILgejN2kp7JShqUV0ENVAAcTYW0MtwpG5t8YQeIet90oeqPbVG8oBPv7fMXk8BO4elm3llMSYLpBktpaNQowSIS/ItkUc/DWm5QeUvJQ6W+lAyg8mUTc2ldopp975eWBQjYI0MwhxpwZChcfAii+c7BtHZpZhAGTIiahsGNGsbAiLr3IvUoZ0p8mk2QnmqOxmyDXMEpEcSIIvI3P/S/so3bwT3hAN9/xDG+BSuQ50ONxynOu4bJAoMFjOSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <8bb92e3f-38b4-16a1-0a45-5f393081f230@suse.com>
Date: Wed, 1 Dec 2021 12:19:10 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v2 0/2] x86/mm: get/set PoD target related adjustments
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0023.eurprd06.prod.outlook.com
 (2603:10a6:20b:462::28) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2ed31984-396e-4735-938c-08d9b4bc66f2
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3936:
X-Microsoft-Antispam-PRVS:
	<VI1PR0402MB39365FE8BF0AD992BFAA3F5FB3689@VI1PR0402MB3936.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3826;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	uvLLqd1fZasjR+MnTiJxJsqaH07X5NA86Qmm2VBDq90Nxr+JLbUfg/CNkyxuUTVYLRRcBp2tT5v7tHTdic79R4aZmcCGviSAt3dmfEkLBwYriNJyIUwwEsVIGqSFd2o/OT4UasX8FkJtFwOv8luvzpNYx1R2+n0OBQeI8lt6hPssClelXZ20IjOPiSyc0iGSrnynvMKz4SSiYguqAU16kgT1Wmyck6F/nUo2UoozKSFxjd78fTurHbW+q4NhSYzAx9sMTipn4QKcctzC2fZGhDsm59ea05FImO1eGD2+G07OcbQDv+w0BBnrlOvpya9dfljeUYFeDrd7xqYZogTr4lrjOXo10Bm7JVh0U6anKu81GmJsjWAVlwZBKZlalfKVUt641MXiWRYH5QmKDcY9uXhorOzjqpYLOXJIlXzoM3yNoYTbqUo9hOpRgrgKmT/Ut2NmdgTj9fB/TdgTYgxLIT9XT/BiSjNINbEjvSchP2VS4mlzbCtBrXh3kLls/J4ozIM2uEodk2Z623xEe2YI6LCisq2NqZ+4qzBfLqQ1KbR0D265p93i/krcQgNdJ5sPiSS0Xm0soOUPbQTETKHVuYDmr13Px8ai1KATWFwmUSUWc7XzlnWXfbjM9e1h06M98FLFr4cdG2BYdsvgFb+5oj6FtHXHsw6i1yR8GrJw0RtbReL3kfLt5FSnbMjpLX+S3tTADzOwOgoRJy2Z41uU35fj5keOHw5TBVUirCE/8uw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(8936002)(2616005)(36756003)(6486002)(4326008)(86362001)(5660300002)(6916009)(508600001)(16576012)(54906003)(66556008)(66476007)(31696002)(26005)(66946007)(31686004)(2906002)(558084003)(956004)(186003)(38100700002)(8676002)(316002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?M0NFS2x6SUpnRVhNTTRaVmtud1B5WHRHMmNHdHZFeEVTQWdjYkpQdFFTQ21p?=
 =?utf-8?B?K1VuazNoekVLc0Q2MUFsRllyRDVmWEg2Qnh5Ny9hRXNkS2t3K0hQdkh1TUhl?=
 =?utf-8?B?QXJlS3JHMTlCbFgvekZKd1RvbE8xQm12VCtCL0Z2SElOWlZzcExBVHlCV2sx?=
 =?utf-8?B?VDFIejN1b3J0eVEzZDc1ZEdTMWk4SXpRaDFOcG9PR0hTdjR1SnNHc0JnUUdy?=
 =?utf-8?B?N0VGVXZ4ZDBua29TWVZZSWZwWk81YU0rcUg3SjVONGpyQTR4SnU2bHZvSXBs?=
 =?utf-8?B?NDdTVzJDSGxDeEFMM0o5WERpdzE0NUZhQU5yNG1hbE1YTkNqQzlFdnBqZWNk?=
 =?utf-8?B?QTVhejJIVVBHaXlIYWFsY2x5dVlhRWZSZWxLL09obmMzWlhreC80Ri9ITHJa?=
 =?utf-8?B?VjQ1TENXd3MveVBYb3dTNC96SUZoanQ2VGJ3MDVkKytqNFA0NmUyS3dQNGUy?=
 =?utf-8?B?MWtlVDhOVjl0VkZET0VENXpBVjdzbERlbkd4RTdlM0tWUVRuS2pOdE5FcWRq?=
 =?utf-8?B?aldLbi9nNUFORnBjdTdCck5aV3hFa25YYVJPTFl3WU5JSy9JanNBZUdxNXRN?=
 =?utf-8?B?Vng0WTNMOFJ1aE5nNjFqellzSDRjaWNMNnNiT1dYK2ZLMVFVcGxIeW5XdVZ1?=
 =?utf-8?B?eDY2WTFUZEluR3k4VXJ4SkRkK21LU0M3bWlxWE1qaGNhaTFiZTYvNzlabC9O?=
 =?utf-8?B?RUcwQVpSQktqZjZ0TGFjN0Q2b25RaFVhK0Vobk5XVitXRVZvcERSQ3JTZElD?=
 =?utf-8?B?a2RWMDNFenVSMGZwcTZ2ME5FS3g1enY2Q3NiRStFVTAyaUlObXpEcjhYWGV6?=
 =?utf-8?B?MnRwc3c4WXdUSEJHTnRzM25WdnVhZkl0eXRKRmlBVFdTUDQvN2NtdVEvSlBT?=
 =?utf-8?B?aTkwTmUyekJTTEZCaFg1ZlpkSnFJOC94aE5TWlVTYUdkV1lDQkZUVmJqNzlW?=
 =?utf-8?B?YkZ5czJGM1V2NS93YXVuTU4yOXVMVFhwZWQ0VDJsZnF1YVFvY21wNGFvVk1E?=
 =?utf-8?B?SXR2emNndmN1UEZsR0J4QVNtclFSQW56djhrWGdaYzc2TnJnazlaTzN4SzJ5?=
 =?utf-8?B?S1BDM1V4R2ROMGdDcWo1enZxWVVZbDVQVVA4TjZTZGk0QkoyUVhCb0Njdnh2?=
 =?utf-8?B?ejhyL1hDczhhWFlTY045MkNkejJBVDZ1aTFJVGtURDNVamZ6YlV4emliN3Zr?=
 =?utf-8?B?T2o4bEM3WmFCM1hEdExPOGJaY1JrWEpRc2RhUld6STJwOXVIZlEwVEhNV3pP?=
 =?utf-8?B?c3IzbGc2dHFBVXlNbGgyUkg0SEtVRkVLRTNjTVdqZVNhZmowUXdxYi9nc1Nv?=
 =?utf-8?B?bkcyR2IvK2JMZmZDdENZck1NWTU0MHhhby96bEtkNitJSVVQM1Z6RjNQbkZW?=
 =?utf-8?B?M0dCMVdRTzZrV1V2N01hUjQrOVRMQWZXcVdSL252RWk2bVZTRnFxLytSQ2xQ?=
 =?utf-8?B?dlZmdzdYV0t1dkEzNEtweHlvbnBBME9jbjBpdXJjQStBWk4vYm5WaWd0TytU?=
 =?utf-8?B?eFk5R1lNNTlNNGZwVGptZlg5bWNxV3c0ZUt2alUwbVJuRVhVZ0FUcUNWa25D?=
 =?utf-8?B?V08vU00wa3paVThRYkxUVTVMd1lLQTI0Z2dCYnJ4SCtKemJuVzBCUnRrYm5Y?=
 =?utf-8?B?STk2UmN2ZGY1UExYQjhtUUM3QkhRd01pcS9Ya1pRdFdMMDRJdFA2WjN4dVRr?=
 =?utf-8?B?M2RiR1k4bUhNc0FNUmNNSFFkU1RpMTE0YVc1RFVjLytHdkdLZkl1enh4MGdX?=
 =?utf-8?B?eHZYK21pUVRIVC8rSmZEU2RuNFZoTURRWVIrK3FSdjVGdjNnOURNdDVkaFBw?=
 =?utf-8?B?c2xMRUlxWWVEVmwvU080bFNLTXM2eE83bTVHcGZZLzNBS0xtNFY5bVBxU1g2?=
 =?utf-8?B?aFkzRTZaTG4wTXZLR1hSQjYzTHp5dXVESzcycll6VFZwWnFmSndsSUJlVGhU?=
 =?utf-8?B?SzdQa1RoT21jV0l3cU5XRXBDUTViZytCZ2c5OHJ2Z09KTDVZR0ZjRXFkUjQ4?=
 =?utf-8?B?RC9WQkFPRGt5NDNad2Z6Q1VHS1YrSTFOODVlRzhlUWQ3NUNKeEp2QjRoSGU4?=
 =?utf-8?B?a2JteHVvZkJ0YTJaN2tsbkJCZ1NIMFh4d21OVDhFTXhwc3E4Sng2WGljWUFa?=
 =?utf-8?B?b1Z3aDBKU3l4SUhHa1NsRG1nTjRWa0ZxWm1Eb3pKeFZ5WHR5K2ViTGF5RUZZ?=
 =?utf-8?Q?s/173EQKwiKgPFrQMzH800k=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ed31984-396e-4735-938c-08d9b4bc66f2
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2021 11:19:12.5179
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: igJgycaQ+EfzJIBDZ1JbWbKH2s3sody60WmnnU4OQwoexow2lIQjs7TY8uT+TZBFQd6Ubuqc78JnTgt2Q9pQGg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3936

New 1st patch, subsuming the original one.

1: IOMMU/x86: disallow device assignment to PoD guests
2: x86/mm: tidy XENMEM_{get,set}_pod_target handling

Jan


