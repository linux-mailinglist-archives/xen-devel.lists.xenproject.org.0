Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AFB9AC026D
	for <lists+xen-devel@lfdr.de>; Thu, 22 May 2025 04:22:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.992779.1376362 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHvYj-0006fN-A5; Thu, 22 May 2025 02:21:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 992779.1376362; Thu, 22 May 2025 02:21:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHvYj-0006cU-7J; Thu, 22 May 2025 02:21:25 +0000
Received: by outflank-mailman (input) for mailman id 992779;
 Thu, 22 May 2025 02:21:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UtGg=YG=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1uHvYi-0006cO-IK
 for xen-devel@lists.xenproject.org; Thu, 22 May 2025 02:21:24 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20618.outbound.protection.outlook.com
 [2a01:111:f403:2009::618])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 73fe6215-36b3-11f0-a2fb-13f23c93f187;
 Thu, 22 May 2025 04:21:22 +0200 (CEST)
Received: from BL1PR12MB5849.namprd12.prod.outlook.com (2603:10b6:208:384::18)
 by MW4PR12MB5625.namprd12.prod.outlook.com (2603:10b6:303:168::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.33; Thu, 22 May
 2025 02:21:17 +0000
Received: from BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285]) by BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285%4]) with mapi id 15.20.8746.030; Thu, 22 May 2025
 02:21:17 +0000
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
X-Inumbo-ID: 73fe6215-36b3-11f0-a2fb-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U/QNpX3sMvsK4g8QCYd8ZbHCmjJsgN3DpclG9Pi6Esn75hJwFVcNdsijWjCq9gSL/WEVm3CgJBU+11+vgeI5hc7fmedvBqAz+oVtDkSYEh4G/lX0YWsNvlvwpXuvJbW4ydFjbMFdxwN7NnEsEJijIbUsWzsOZ8c68GnT2YhODGJNe5DpFwRMOboIS7jiHhX7K7ZkEU0Qo36M5pEklz2KM6Sdly55qbTWGUQLDkz5Du9HzR6B7BXfJ/0hTWrceriL/MubPxAYHMffqP9rWpAlfgFrM0WduHLN73Dfc3porpujShNiNaILAIFYHg46pMg0iuVIsGew61EGqCUouWNDIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zeeBbq30sU0lK56tr9ljt/2A6EWEOrnovqWmRjarNR0=;
 b=zTmsAxJUCGWNXUi2ZC8OltyDfDbItJR8YrHftauTiySu8M4HoKIewITxOct7Z1oHiZJ2iNd44OIZmH01lt6honukd6Mfgom+5NP8IjSMbILomx1TBblD8SPvJFC10UrEm8x3U5psvyk9XxzCIbkWEnKwreEmbGZY53el9tOrcnchE3nGa3Bpso/wb29xBVXyAZ/w56Ky5Eo+rSF4PEU7XYROcBJnPfhWNmLUCEtS0E69TybD8sAhcGOX4q2OxmCzRLr9UAg+3BF7gAtzvy5amhRwMsEQGTZVmAbXqERh1r6arw2dS6Z4kBULJZCDWoka7Qy+XJsM9gn4RbaoGRHn6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zeeBbq30sU0lK56tr9ljt/2A6EWEOrnovqWmRjarNR0=;
 b=HbskI4HSAxA+NN0gMTVAtMQF8cK8KfCgZB+X+Wyd8gceYzWj5BB/NhjVoB43/lT/Y2VtGMdHHxIlBe/uv4ui+yaoRcZSDJ0eho3hTb7vlIjd0bZR3+J+xNVtTeugGwRr2Dq+gU2CxaemXIMRPrrvIA4C+C2qO5C/iMuY3GTFuEw=
From: "Chen, Jiqian" <Jiqian.Chen@amd.com>
To: =?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>
CC: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, "Huang, Ray" <Ray.Huang@amd.com>, "Chen,
 Jiqian" <Jiqian.Chen@amd.com>
Subject: Re: [PATCH v4 09/10] vpci/msi: Free MSI resources when init_msi()
 fails
Thread-Topic: [PATCH v4 09/10] vpci/msi: Free MSI resources when init_msi()
 fails
Thread-Index:
 AQHbwMGh3xGCtPOZ6EmRbIkDtAY42rPbIqIAgAApmYCAAAFtgIAACDMAgAHezgD//894AIABfxcA
Date: Thu, 22 May 2025 02:21:16 +0000
Message-ID:
 <BL1PR12MB5849BD99C735B7821B7841D1E799A@BL1PR12MB5849.namprd12.prod.outlook.com>
References: <20250509090542.2199676-1-Jiqian.Chen@amd.com>
 <20250509090542.2199676-10-Jiqian.Chen@amd.com>
 <8d89f644-4ded-4490-ad23-518563d230d2@suse.com> <aCxGwSl_UuCWPf6B@Mac.lan>
 <e7ab7be1-e256-4f63-a835-cf1e13e0183f@suse.com> <aCxO1Gh_ehxpsznI@Mac.lan>
 <BL1PR12MB5849E2CD05D70E7A475646F3E79EA@BL1PR12MB5849.namprd12.prod.outlook.com>
 <aC23xI0qgsAqLb2S@macbook.local>
In-Reply-To: <aC23xI0qgsAqLb2S@macbook.local>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-imapappendstamp: BL1PR12MB5849.namprd12.prod.outlook.com
 (15.20.8746.028)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5849:EE_|MW4PR12MB5625:EE_
x-ms-office365-filtering-correlation-id: 54d08e73-3b57-462c-0076-08dd98d7551e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?F0LwPvj1yK5HZeMnBDVMsPIpNa6gS1VefElwlm7kdBvs4+k8eeT7ngg1qD?=
 =?iso-8859-1?Q?YStxlEYn2BkpL9xBJBDOAcbVZEbxwbUZPirUqyPi7D+b8ZUySaZXxOCA37?=
 =?iso-8859-1?Q?RG/rRszrptIhxBPjEVemgiWYNLxdLnkSADuy8MUPrjsTH2vPkK28aWxq7C?=
 =?iso-8859-1?Q?L/QgUF9jZO/c7rEpkr2fT21gSGTTzkjdAygOU2SP3t5MKeCsXRGrwGdW6h?=
 =?iso-8859-1?Q?3Fyq73kMd7Ry1xho/oSq9JDt+FzgzbNPLB1TWhoaK37k7EW/YeP1DsvN0m?=
 =?iso-8859-1?Q?Rh6D16Oxhft6lX+3OBEkl2qpfQEtq6cWsRIWZTdeGk4jY/voz/U3wa8/Yj?=
 =?iso-8859-1?Q?ok4ZokrEzVfQ2NPO3bPsIT5TqZKhIK2SCBg82uD4tRvj1oRB5gmC9u61tJ?=
 =?iso-8859-1?Q?QyZQWk9Kk3fKF/jYKGvw/C/JtvUFgvGata8goN7ab7HrAj1H7DtWXPVYv3?=
 =?iso-8859-1?Q?+QdBM3X73ZoYEwaTS80RGPs+Vr7Fvqife9H60/HCe7pL+wTAJRsQZdLy/V?=
 =?iso-8859-1?Q?GRQaYMfOUpiYnryJZzNq5PmlqJX3o8KIZ8fodozEG/5z5w9sXn2udYuEdN?=
 =?iso-8859-1?Q?WNuBuWhwOzfwbifjvphy7Q8y7Q07Ka2ipVqZDqCtnhayYFoEKeS4Xzf5V0?=
 =?iso-8859-1?Q?EH8eI1KIQFnZmTCdMifnd1xtWj3InvzAS3/oRDxAVqsr5nXOOPcYWbq4Uf?=
 =?iso-8859-1?Q?uCNZvfAUlM06OBXe4W0Wn7rPQnilEwOPMAAS6dsKEHEGnrPnKf8Nv/ovF1?=
 =?iso-8859-1?Q?Eqn+p2UxewHgoBC43IaWZn3VH1IJTtxo9nRBn9aMiB/iMBjiSKwMNOlCH5?=
 =?iso-8859-1?Q?vPUpqTS+h+ZVKgSVh5AnMwN6cxKfPyHn86ZYlkmlNPmXPqQOem9pfEe2Ym?=
 =?iso-8859-1?Q?mPhwIMY81duzyEDtJkMZzfDoJ99DP27G6AuAeisCnChVdCB0baQ4IIsUpj?=
 =?iso-8859-1?Q?6b3Hpn93zxiyUBgiV5YlMtn+IItYw/242A9ZvRyjryPu0wV5t6IdGbt6fG?=
 =?iso-8859-1?Q?ts5Yo3fl41eS7YH4s+O4wzLiMKLvHXrCBMBJfD2cNfD63L6n5w5csNSWhi?=
 =?iso-8859-1?Q?SCwL+IVEayArs4n2XLhedthVzyCamJysd1/fVRYCGXw6emXTrtJP2c3jW6?=
 =?iso-8859-1?Q?D/F3sBHbykTQXVKMDDeOt5jzajbtFn4sYPdcZrfofbdbxmOlmzSE48ikCM?=
 =?iso-8859-1?Q?6WzsjxltvBu3zyX6uDv5Wf07ejtYvbwhBMwjHM+jQWf3TqUkchAqfKdwcU?=
 =?iso-8859-1?Q?TC0sCFSsv0yPTQVKH+TWkWkc/M5HJQAIFFOpQKJKv+YAVizrRrhSPOEFXP?=
 =?iso-8859-1?Q?Z5PTAqQ8Tp/roVqhn3gu4HHge9ROXIwD/xaEv3YEof77jbwYesD+saLYoZ?=
 =?iso-8859-1?Q?p0buSVOWiFDCmu9auibTIbKY3JpaBqf0kWqhnenJ5+3mHG9E/u0KSNI/YR?=
 =?iso-8859-1?Q?DyhqkMB/RMHk/nhYSNLmk/+fLDTFxdRsO0IKSoq2sXKcoI32/oBq1fkvyx?=
 =?iso-8859-1?Q?Fcn1ChZmI9zA3e5iKeH276FpyPgQeP5EMR1JnNCspfPg=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5849.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?voTGry8a6N4VG/rvBvREM79czdc09kdq6iC1lDXNNHTyT4PMCOGmZOC5YB?=
 =?iso-8859-1?Q?aLn7G2zXmbKDYsQA0ewJGq8hT0juN2eRi9WgreaD9i7uNZKiQ1/T42Hhvr?=
 =?iso-8859-1?Q?5kCqH1PfyYmqohAPMGDh8f+lBVFY3UXHtbdhikgNxcmo3/8ON2kDUa0Fgi?=
 =?iso-8859-1?Q?ssjXibRa8+hQSAUPL1SIvjTK/E8vB2bfecEGgSl7yJ68K8Z9JQzvj09HtA?=
 =?iso-8859-1?Q?IO+qNVkeo6OhkLdE4ZA4wyMVBq1vQv8vwehfX18hYQjCwflMQV2D0mLMqf?=
 =?iso-8859-1?Q?WeMKv4mwDI5dIXZWYpb2C6qaA+klkUWKQRO4p9ZhEGiJ5mr3Q649vx0Zp2?=
 =?iso-8859-1?Q?6tsXqsJhd7fhLpZ8sxnCdU6FJTbmq1dz7+cOCjXd59yuzyfkS+s2AIZP3P?=
 =?iso-8859-1?Q?QdA7LZewTANsJL8xITVoizRbMxxq6YYsWvmxAukKo3DMHdy58jD9uedWE6?=
 =?iso-8859-1?Q?WOkPRY2a7PtBQmMQzlSxwfP8rABMZU31WBY361+AkUB7WICGMzxDCiec1l?=
 =?iso-8859-1?Q?gu+A5RpglKI3suwjx3ra42BjB6mH7OAA1MDx29fPWfZweiGflk5uPGqMcx?=
 =?iso-8859-1?Q?zXrnpN1boXHjPxHWRj460FPeMOARyQgsOn1y9fD1wz6BGt6xhsAhmRjjjT?=
 =?iso-8859-1?Q?+lE9EuiOJmz531IFcg84SVXU1ktqF5hPtmVb95oE/QCPa9SSmmiVXEoRXc?=
 =?iso-8859-1?Q?JwxhJcknPgVLrXY8MsioHik60ccX8Tn6u1Z8j4xWqoFKTwlqRRIOFoJdnd?=
 =?iso-8859-1?Q?CFA9CHJEVYTop86T7lx8f1wykWSG2YtUCoHWe1wnVJi+gdNt6XejcJC0vh?=
 =?iso-8859-1?Q?3dL/rvzERiLrGfKhFfqmV2TE2m3+fySZYkrLeXGcPxnAJJLDL2wiEcQGGc?=
 =?iso-8859-1?Q?rfS4L7sPBAce4Ey6dr1pP9X/yWALgwu4tSx0mOIpfeGv00tL7cC0sHlxnL?=
 =?iso-8859-1?Q?n8g5ozNOZfaXi5qobqQTtexJEy0pKwpW3B2SPyzY/Nz3OnUEFcAHD6sm2y?=
 =?iso-8859-1?Q?x3msW1/0zFj8co08qqGMUuqTBsQ/sVyZ+8OSqg0BiPiNtiv9QJsZKwcZrm?=
 =?iso-8859-1?Q?hnya1YpPKZAW+3zJ0FuYSHf0cwtyvvNYDHvE3opoQ7TQ3TppM+IcisARVs?=
 =?iso-8859-1?Q?3dl+b1EPXnc8pmFksMDWTFcPeXfkIq9VaItIFsZKGCwwzq27IFH5oONuQy?=
 =?iso-8859-1?Q?VbGZ5QPtxCdN5hk/Wcz9hMayOEG0xMyHHJYbPk95rvZ8F2rr4GBXu3X93O?=
 =?iso-8859-1?Q?vfNVEaSXGUpESFaTYTAVHytGtVnCnuXPUeQPRJa6KTHm9vTCJrbET7Ikyo?=
 =?iso-8859-1?Q?NoKru5apJroZk+VrUXYtGLOLPaDOGy+8pZ91qhivselwizhlVXz8rwZndP?=
 =?iso-8859-1?Q?yuKcAAgSrcaXL0HG79Kejz6LxnVDVvL6k3nOh9hDDWYqLSY8xfxXToYyk8?=
 =?iso-8859-1?Q?m8d7VJi/2RKIPGqatk56KHg9htLpE58xolzC4ee/ttOBgvBGD1765bekRy?=
 =?iso-8859-1?Q?C93tzpKZDXlXfcWhNFhTbHfyGYmM/bcD2Baan1573qXh8T+npSdFwv6/vV?=
 =?iso-8859-1?Q?LEKT9+6Zkeoww499Y8qBfxHEsgtVO210XU5DBXYuMQ8v81JpOtm3kspCc9?=
 =?iso-8859-1?Q?8idiK8JrBXOTU=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <56EBAB19B573B2479C903EFAB35DEBFC@amdcloud.onmicrosoft.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5849.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 54d08e73-3b57-462c-0076-08dd98d7551e
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 May 2025 02:21:16.9874
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sOmQUneC59Ue7+sYhFJoLdfOY0/ox5YO+Ui/BBHEg85II1zDAd3N3p9ZQcE53uIPqF+uFYjkLAdzZXKBO8RYkA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB5625

On 2025/5/21 19:23, Roger Pau Monn=E9 wrote:
> On Wed, May 21, 2025 at 07:00:37AM +0000, Chen, Jiqian wrote:
>> On 2025/5/20 17:43, Roger Pau Monn=E9 wrote:
>>> On Tue, May 20, 2025 at 11:14:27AM +0200, Jan Beulich wrote:
>>>> On 20.05.2025 11:09, Roger Pau Monn=E9 wrote:
>>>>> On Tue, May 20, 2025 at 08:40:28AM +0200, Jan Beulich wrote:
>>>>>> On 09.05.2025 11:05, Jiqian Chen wrote:
>>>>>>> When init_msi() fails, the previous new changes will hide MSI
>>>>>>> capability, it can't rely on vpci_deassign_device() to remove
>>>>>>> all MSI related resources anymore, those resources must be
>>>>>>> removed in cleanup function of MSI.
>>>>>>
>>>>>> That's because vpci_deassign_device() simply isn't called anymore?
>>>>>> Could do with wording along these lines then. But (also applicable
>>>>>> to the previous patch) - doesn't this need to come earlier? And is
>>>>>> it sufficient to simply remove the register intercepts? Don't you
>>>>>> need to put in place ones dropping all writes and making all reads
>>>>>> return either 0 or ~0 (covering in particular Dom0, while for DomU-s
>>>>>> this may already be the case by default behavior)?
>>>>>
>>>>> For domUs this is already the default behavior.
>>>>>
>>>>> For dom0 I think it should be enough to hide the capability from the
>>>>> linked list, but not hide all the capability related
>>>>> registers.  IMO a well behaved dom0 won't try to access capabilities
>>>>> disconnected from the linked list,
>>>>
>>>> Just that I've seen drivers knowing where their device has certain
>>>> capabilities, thus not bothering to look up the respective
>>>> capability.
>>>
>>> OK, so let's make the control register read-only in case of failure.
>>>
>>> If MSI(-X) is already enabled we should also make the entries
>>> read-only, and while that's not very complicated for MSI, it does get
>>> more convoluted for MSI-X.  I'm fine with just making the control
>>> register read-only for the time being.
>> If I understand correctly, I need to avoid control register being remove=
d and set the write hook of control register to be vpci_ignored_write and a=
void freeing vpci->msi?
>>
>> "
>>      if ( !msi_pos || !vpci->msi )
>>          return;
>>
>> +    spin_lock(&vpci->lock);
>> +    control =3D vpci_get_register(vpci, msi_control_reg(msi_pos), 2);
>> +    if ( control )
>> +        control->write =3D vpci_ignored_write;
>> +    spin_unlock(&vpci->lock);
>> +
>>      if ( vpci->msi->masking )
>>          end =3D msi_pending_bits_reg(msi_pos, vpci->msi->address64);
>>      else
>>          end =3D msi_mask_bits_reg(msi_pos, vpci->msi->address64) - 2;
>>
>> -    size =3D end - msi_control_reg(msi_pos);
>> +    start =3D msi_control_reg(msi_pos) + 2;
>> +    size =3D end - start;
>>
>> -    vpci_remove_registers(vpci, msi_control_reg(msi_pos), size);
>> -    XFREE(vpci->msi);
>> +    vpci_remove_registers(vpci, start, size);
>=20
> I think you want to first purge all the MSI range, and then add the
> control register, also you want to keep the XFREE(), and set the
> register as:
Understood.

>=20
> vpci_add_register(vpci, vpci_hw_read16, NULL, msi_control_reg(msi_pos),
>                   2, NULL);
And one more question, how do I process return value of vpci_add_register s=
ince definition of cleanup hook is "void"?
Print a error message if fail?

>=20
> So that you make it strictly hardware read-only, and not use the data
> in vpci->msi.
>=20
> Regards, Roger.

--=20
Best regards,
Jiqian Chen.

