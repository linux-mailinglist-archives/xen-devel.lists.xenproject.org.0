Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 77E596C44BE
	for <lists+xen-devel@lfdr.de>; Wed, 22 Mar 2023 09:19:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.513172.793792 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peth4-0007vC-0p; Wed, 22 Mar 2023 08:19:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 513172.793792; Wed, 22 Mar 2023 08:19:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peth3-0007sY-TE; Wed, 22 Mar 2023 08:19:37 +0000
Received: by outflank-mailman (input) for mailman id 513172;
 Wed, 22 Mar 2023 08:19:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=SGSf=7O=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1peth2-0007sQ-Ma
 for xen-devel@lists.xenproject.org; Wed, 22 Mar 2023 08:19:36 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0609.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::609])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 478d3a27-c88a-11ed-85db-49a42c6b2330;
 Wed, 22 Mar 2023 09:19:35 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM9PR04MB7617.eurprd04.prod.outlook.com (2603:10a6:20b:286::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Wed, 22 Mar
 2023 08:19:33 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%5]) with mapi id 15.20.6178.037; Wed, 22 Mar 2023
 08:19:32 +0000
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
X-Inumbo-ID: 478d3a27-c88a-11ed-85db-49a42c6b2330
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cBsesdPM58MQhJol1SHXS4m9Tea+Ug12io0AW2422ltcAz1O4VQIIsViTp8xmrQycomS6usVD9zA/9ZwWVbO7s3QEGbmBS+fpKcF6WydIXs3BFUww2pLr1/nwzXIBGZHCI9Q9ploL1hKWUMRif4zMaGkbPOl3U/mLVIEAzVugIqGnwgn3sbk7EmvUHwRJBKzP+pWI/l5i6vOushYNrE1tSyNakf+WA2tKvP466DnVE1PIhDR0gBSqGoI6qlGah0qoqlx+aLMTb2iCFw8UdwIQP8yVYigmY8Gp0YCmfDMDEzgORyY4IY34XK26UYUb0y7RLgmO3Ej1tCy3g40pt3AIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OcldQZI8nQGZP/xDaxcpXN0xpi9w/XXZ3KAXzU8H35k=;
 b=Cbc0cJ1vsLaRZW5uI9pV+Jc+8ioLCBGbijXZVdlbtBxs5epnnW7mgkQQjkF95e5ieDWXoq1odpHAv0Plq45Q+7LnZILqjrvbgTqKBMSYd4H5465fr161E1V+7P8XeGa7kDGzF40P2MbusDh6olxZNMn5RIePA6xFHKclpFUKlUmEUdU8qnmsMrywutdfrA2v8ZS/Gvves5oBHZFAu5H3J6Txs8bYXfK5itUKJwMpMnjxmthK2MJGxwWTdSBuMW7Er0B5LVMassqU/JAqOG3P8qK6nUahzqEkMMkaIBJ7iMDsacnhDwVqEMa4UogTA36+80f8niXQTYn2V5GbUlxe8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OcldQZI8nQGZP/xDaxcpXN0xpi9w/XXZ3KAXzU8H35k=;
 b=m8cnafQx3Lb0mz8g7T5h+nXk+nksjbMxXVS0dVevVMDe9s0m2sxorAWM0KvrwtGaCmEmk5tt8c+Kx5iY4cyY67D7O7iwRkomocM558onuFvV6j22dgA6PPmFuR/KvdjT0JYD/uVu0cgZptFk5uRqTOKuVL7mNN+qGngUcLv5zDiw0VvumUm5N8yqelB3QVe703i9HqFSjxC99S3q+VrFKCkyg6lZaCEsSHuFmGx7hb4W/hscidIci1CRGxXYSXV1lgjiE32Gx6fRtk1Co61TaREd3LtsGK+SpLe4akvK+H98gF1mvJzx3gkPN1yabEr9rt3QhURQH8T4mhfI85q8eA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <c176f85b-7215-8526-fa59-a3c688c543bc@suse.com>
Date: Wed, 22 Mar 2023 09:19:29 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2 1/3] xen/riscv: introduce setup_initial_pages
Content-Language: en-US
To: Julien Grall <julien@xen.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Gianluca Guida <gianluca@rivosinc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>, xen-devel@lists.xenproject.org
References: <cover.1678984041.git.oleksii.kurochko@gmail.com>
 <85a21ada5a0fc44bb9db1dcc1f6cf191a6e66bfb.1678984041.git.oleksii.kurochko@gmail.com>
 <9ff0e335-6cb2-be49-046d-745ce05f7086@xen.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <9ff0e335-6cb2-be49-046d-745ce05f7086@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0077.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9a::14) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM9PR04MB7617:EE_
X-MS-Office365-Filtering-Correlation-Id: d04b5c51-31c0-4d69-31bf-08db2aae29f1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	XrhNXbP85JsaHlwtlf20e29sDOsaRlDdnVbRe+wp2d0hXlmjn++QuwhsOhStBwPplUCfKgiqovArrolORIgOFa6ZB06pAOSXCwisWL73Oj/8X9psf+PbG/50qCG/WJVSl50wPzOfagusJaBS/5wNJZ+ThIM3M1HcocAa/6b5zG+EiB0DJvXJD+i25zUZ9KA86BRgnmnQvysI/4Y80TkcDj/50ObPK8Ng9cocDxAvC9rV6lg3hDNVmCUyflvVGIkHbhmToiKYuN2E/k7RRdhuBp6mAurMJRgctRgsekkYT5rvDekYmKGuCU9QQhdkV4jN2LjTgb+JVIpFtT+snU+jY6prMeqqcabWHGH1AYpTdTHNBdOfnkBeDJUccpaJf+MEJofUwEFerBtfjoCQxx3yr2kZI143PrbK+v5SEhDEE2kN2CdleQIV/noLWI1uPghYR6dvoXxyCsP9uUOSXTlskatfyqOOTmwOM6VdEUJJRbZQsejXCKcuTEE49oAdX7qtV3UtjzY3bxfEufGx4zoWPctpxONGPZBL/0zYCVgKrVGDT14KX9qwjIrPsRDvr3mPUlJPi1LLVWFxKRruvI1ChKHOP2LG6BCMJ2tpNyk5PYvORgQbCTMPpURmFr1F8Ar41DhZOtHdcgqYG2KU5sVlga/RzqITDYLIR6KJAnzK40OiXGRq5LOBtdbH1GcZ15Qjhh6N/MvBTNIRwwLA69vO+u5zGgYt94SUeO78RYc4quQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(346002)(396003)(376002)(39860400002)(136003)(366004)(451199018)(8936002)(4744005)(5660300002)(41300700001)(31696002)(86362001)(38100700002)(2906002)(36756003)(4326008)(186003)(6486002)(478600001)(6666004)(2616005)(6506007)(26005)(6512007)(31686004)(53546011)(54906003)(316002)(8676002)(6916009)(66946007)(66476007)(66556008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UGlGeGFpQ0dzN2kxNGVQcUpYQWRKYjJzWlBEcVZ0YUpVTXNaY1pnODJidFBz?=
 =?utf-8?B?dmJWa2V5MXk0TDgwZGh4b3Jabm1zSW0xS0NNeE1NcGRqMjQ1Qk42YXdSUTBV?=
 =?utf-8?B?TnRvNWZOQWhMZlBsUzdiUy9VOU9tSDRQaGFwSXZWZ0xqWVVXSWp6dFc1Zith?=
 =?utf-8?B?cWdudGIxejNVRytIR3hpMzBhcjcyUzNrZll2aCtnR203ejJrRTU0dDVyN2FI?=
 =?utf-8?B?MGp0YWRXV2p0TmI3S0ZkaDRVc1l1bE9DbFRkc0gvdU1ZZDVDN1dVZ2owSUM4?=
 =?utf-8?B?SWI5MDFwYmYrYS9HMFVlWmN2R0QyeTNaNFVici95TUxFb1AvUktseDllR3NB?=
 =?utf-8?B?dUswS3lYbEZmajB6TGFPT3FSalJlMEJqV09TazRDUlc3cFdnbjhXTk1mNGZi?=
 =?utf-8?B?VnZQNHpYQ3IyVklNbmcrVWZLYWEwYTg1VmtGNjJObURYVnVMMGFPRXdYVHk3?=
 =?utf-8?B?NUJRQjlkMjNsMHBkbzJmd2ZDTDZjdzB2YnJsZkZOcGVDY3FVZUJKSVcveTkz?=
 =?utf-8?B?dnhoS3ZWUFg3R3Z2SmhtaXdqY1E4WFdwMy9BbDFHdWlWVll2YjZId3VYZ1FZ?=
 =?utf-8?B?NmtJZnNFVzlGOGdPcEpQTWlxcVZ3ZSswamFHWUlKMVpIM1FhbzdJMjBOb2Mv?=
 =?utf-8?B?ZVNKd1FhT3MvWUFyRlRXZkdWeG9Dcnh4STBGd2VmY3JnaWJueVVtMVRrT1FN?=
 =?utf-8?B?M3RkYzdwcGMzY25GUS9WYjJ2TmxmSEJqZC9yWEwzU04yK2lXMG1OOEhCdmtX?=
 =?utf-8?B?c2JoN29FYU1SQkZWUFAyRjJoSHJyaWFDMjlQRWM2c0RpQjhQY0ZCUHBDKzFR?=
 =?utf-8?B?VERjU1NZNC9VRkd0MEVuNEV4dThvR3Qzb2xIdS9QUndLUjhFQ0s3RDI1MVlj?=
 =?utf-8?B?T0JmeS96MEhIbmhvb1FaWVBjMWdTR3E1VDN1eC9kby9YZlV4SVFwaVlLc0dF?=
 =?utf-8?B?WFNRN0FBUG9oQUhUY0c1c2hYMmo3SXFKK1NlSjNMak9xOW4vWHhFT2VBRitY?=
 =?utf-8?B?NkVXYUJGYzhKREM5YXQxOURZbFZxNkdqZm5CNkZNMWNVelQ3UXY2WSs4dmFn?=
 =?utf-8?B?L1MrQkdmQXBmUnJaQlJ6VEkzSHNsa0crN3dqL0V5cWhOc2JVQTNialJtQWJh?=
 =?utf-8?B?aDEyOTVmS1FFM3lkOWZyN3VhdEZhOHI0T2kxWHp3Mk1jSWtwOTZ4UERiN3Vz?=
 =?utf-8?B?Y1pCNDVLVldnR05HbVVCajRrYm53N1VnR2U1UzhQT09uMllSUGdXR3VIRkJk?=
 =?utf-8?B?b1Q0TzBTT1hMdUxlNG9ISnNsbEc2YnBDby9XTTJPUjVONXh5UVQ1YnJvOFR1?=
 =?utf-8?B?dnRrK1NYWklIeWxVcHBHWlUxeTFpSmtFZVNob3VCOHNNN05LdHFNUUVNT2Ew?=
 =?utf-8?B?ZVdGMEtOLzFpSFBST2lLQkU2RVk0elNheEVtM0V2dUJxbThUaURFWFc0ZlUx?=
 =?utf-8?B?MmNXRmlqWE9pcGx4d0tTbzRHQWc5c1Vmclh4ZnlHalhaZTZwTmlYTGZaY0FF?=
 =?utf-8?B?aVB5V1ZnV1c1WWxmWXJUWkltc3JNNWhBNTdmUG1IcG11MVRzN2Z5VlpwWEND?=
 =?utf-8?B?TWNSWFFUSVRmdkxnR1Y4V2dqQTRibm5GZHRERGhLMGEvYnpQOVFlS1pLMGlr?=
 =?utf-8?B?ZFJmTnFNMVI4aHZwQ2pSdTVpVkcyU2x0bm5td0ZvN0dCRDZycjJvL2ZsM0Z4?=
 =?utf-8?B?d3JNenFXM3h2MTA3MmV6eVkwMkdPeEtVSWxJUFBIb3pneEREVnQyQmh0dnFy?=
 =?utf-8?B?aGFKbU9sYWdMSWhTdS9sMG14SzhoR1d1Q0FTSmtMUHFGL2hDTEtwaERpd2ls?=
 =?utf-8?B?VWhEV0xVUFRsa0JoNG9MaUlLRFprbFFmRTAvazdlclZZRGlNNmFuclZZNnBi?=
 =?utf-8?B?QzhRUGtWS21qTWZsMjRNRGxMajFGY2xUU1VIb1AvUjh6RVA2bHFERWp1eGQ5?=
 =?utf-8?B?Z1R2NUFMVGpiSSs0THJuM1dSYklYaFZZMGwwaWhFTnRhU1FlNE9lbmYyKzlo?=
 =?utf-8?B?cndpbjl0TlFFSEJnaDFlN2lBdjBKTFJwbkFaclM1ZXlFcGphL2h5K2d5YWY0?=
 =?utf-8?B?SWlqcEFHSEZISGJkTld3c0FhWmtHTmk4cUNpQiszdU54b2F5cHBIbWs1MExC?=
 =?utf-8?Q?Euw6ZmUNzn5cUMUMyZcD6AP3+?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d04b5c51-31c0-4d69-31bf-08db2aae29f1
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2023 08:19:32.0968
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WO3oGTijI2slbQcYewJM7srnxKnF8Q+20afylKwnlbqGwIs03BswonDWcE0GkbElMBoLOUzVoHXQmBtLeVcl6w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB7617

On 21.03.2023 18:58, Julien Grall wrote:
> Also, where do you guarantee that Xen will be loaded at a 2MB aligned 
> address? (For a fact I know that UEFI is only guarantee 4KB alignment).

I don't think this is true. We rely on UEFI honoring larger alignment on
x86, and I believe the PE loader code is uniform across architectures.
Of course you need to specify large enough alignment in the PE header's
SectionAlignment field (right now in the Arm64 binary it's only 4k).

Jan

