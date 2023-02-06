Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 71CA568B8F5
	for <lists+xen-devel@lfdr.de>; Mon,  6 Feb 2023 10:49:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.490180.758784 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pOy8B-0002KX-K9; Mon, 06 Feb 2023 09:49:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 490180.758784; Mon, 06 Feb 2023 09:49:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pOy8B-0002IW-Gr; Mon, 06 Feb 2023 09:49:47 +0000
Received: by outflank-mailman (input) for mailman id 490180;
 Mon, 06 Feb 2023 09:49:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=JzEl=6C=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pOy89-0002IO-QX
 for xen-devel@lists.xenproject.org; Mon, 06 Feb 2023 09:49:45 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2060f.outbound.protection.outlook.com
 [2a01:111:f400:7d00::60f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 957c02ef-a603-11ed-933c-83870f6b2ba8;
 Mon, 06 Feb 2023 10:49:44 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB8PR04MB6779.eurprd04.prod.outlook.com (2603:10a6:10:11b::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.34; Mon, 6 Feb
 2023 09:49:42 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e138:4fc3:705c:d178]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e138:4fc3:705c:d178%6]) with mapi id 15.20.6064.034; Mon, 6 Feb 2023
 09:49:42 +0000
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
X-Inumbo-ID: 957c02ef-a603-11ed-933c-83870f6b2ba8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dLpyYVvj/quzuka2ciQCTFFL893Gk13yFvJj7Jbdx2jXJN0SOU7FJ8KeONT3Lpk00FMf5XgdmVf1WalSyjPGG29w1jwtHI3JZPMbYNts38aZqInrr06xeoCtzaAECn+UAXxNc1bHPeyENvxPk/4xczKZIBscz4Fnsv1x2i0HKOKvUo9DexYxKZvvmS2diN93vgQsD8+CNYZRxXCSpZni0N/ZO3n2dHvO7iwdu+YCULdhS0hw9wElXDL7aq80r5CrgJXMrb3U21dhhJCni5mdXYJmo0LGdhsLqH9dy0q8RtOjtzKYX3OyC8Dd1soEJ/jaZ5kEk83S0w29umqDxldBAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4dnTAYdCtkA3aodozt11bLjhjyRpTm3dTL7CwpGAeDU=;
 b=YAOCkIYmpXJPqxXGJU/U0NiaDRNrlcBH717/Ywvyh0kJc0axO1eXw/lbGsH7H/3QDuSi9NMyRjGIsm3Du+M4ADLG92cYZ52cSSpy4AmW72/DVXbnA/4HQflSYlwEKUHLfy+zWAWJxQKSIRyfgg7d1rnK2NkjI0/i2Q1rPSan3wiTto3t/hMgs4fZDpsApXOlYHlgGW6FE772HRvY9TgL6mxKdJvccfWRfUDSLLMyqk/aDaeh/uQ+Xx8dBw4AhcAxWu0dPmM9LhHNjYq+lxK/G9w4RE6hqe1oQdE3I86bsJtSOsVPhCotx3dyu9TTgHaxS1DMSM9JkJXA/srtPwjVow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4dnTAYdCtkA3aodozt11bLjhjyRpTm3dTL7CwpGAeDU=;
 b=g2DebtgSUYjliXyZeASZIgXfBV9h80FzxtwO66HaPnsq28mm74MMEHqrLLrOFHkAtVpawhEWF362u1l+Be2C8TtGglkvxK435oJaOguBdDq86DblLWMeRe50Ueu7VKGJb7t0+3mZf/1oARcxwl0ZaJhGjNXTx41W5qXCFslSWo5ArHYTCJe5ukPxhRuVfFDSLJL5f0wOfYZ6LA5si+hvKvqotUUWmV7nj+J7HayxGY/JzGGwWUxwSEMOBmQuND2pAUf4s1eht/ksDGnh9EGpPwHD8S/oB9Gq9jnNcKJG7Ma/0VKaqiFIWX/80tIlPItygty6CwbRBXVIGnsoYoy4og==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <53371bbc-ea78-4c2b-a84e-e888ae090d3a@suse.com>
Date: Mon, 6 Feb 2023 10:49:39 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: Proposal: List files in Xen originated from external sources
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>,
 Luca Fancellu <Luca.Fancellu@arm.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>
References: <BC3ED7B9-4917-491C-934A-EF112849CBF1@arm.com>
 <alpine.DEB.2.22.394.2302031145530.132504@ubuntu-linux-20-04-desktop>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <alpine.DEB.2.22.394.2302031145530.132504@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0043.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::15) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DB8PR04MB6779:EE_
X-MS-Office365-Filtering-Correlation-Id: 6303daf7-b24c-43f1-3806-08db0827784d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Dmy8OwV516fCjvX2d4wjg4ZIiN+MfrcK28vU9djd6ecoVI92MMNOyBvRixTyWgPiFV8YeelOdV5iWGuRNksw0FqjJRf3suxtmZ+aGkIwZSE415unVu56/D2BVab/pi4L1YCuCLViS7eB2M4JqEfvZ6zRPAQrMy7r72gKon3Kb7R6TAcoVC/LgnH8U4/IFV/+qTLTj8Nj+apX+4l2dC5dONwfEiW3Koxg5a8GGLtI6xruIIav0ig/1S1Pagj25nR4EpjGvBKFwCeGhirNanpYJJewOjFa5/r8D8mb8hknvmh+rYvWOC2YjsFJtOH0LhN6l29FqG9VgnutU//43YtKflgFIqWVmpRt6P64QFKiFDAmifvDV7h9lzYtBGGmsBqp6yr5cvuqir0h2t1RVTQvfHN8gn+nvnrOy4gcE6E4hsrpU1QSJtpKxz4ZxayB5sFD6DFh2LBvSZ9Ejavsp4IL+irw/zjeYz2qS1lSK0bxQ4ndFRfj3+LnU7Jj9gs1Vu5+mQKsCPErTc+2TUx15NopnexcSSJaUGlzJYjDmfXngdhtvzvCwTG09bXDPsBh/ngaI6dOidg41KA6IGEwY1CIzyGbOkxG459gJ3mKMmTsvugrG9pG+oWB0OFn9GM0VSowtPNwmq72IAH6Rgvj0FogwLsGgml/Y0Jg69OzfDipisbF9ym8UP4Iut87WdTQeWoVLHXcJ+cQtUrubHJCbwwkdcscJRMDHN3UMv95sSNhS3o=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(39860400002)(376002)(136003)(396003)(346002)(366004)(451199018)(316002)(66476007)(54906003)(110136005)(66556008)(2906002)(38100700002)(36756003)(5660300002)(4744005)(31696002)(86362001)(8676002)(4326008)(41300700001)(8936002)(6486002)(2616005)(6512007)(478600001)(66946007)(26005)(186003)(6666004)(6506007)(53546011)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TTdwVjZBeTJJZC8yRENSTTRkTncybVp4ZmJSS2xvMFBKOXhINWNOVTRsOVBZ?=
 =?utf-8?B?NTBFVDg4eTd4dk11ZEdETVBHa1lFWDgzaDZ3TXRsOVROcE9ka0h2S2g2NjA1?=
 =?utf-8?B?SnIxRVpxK3BHb09nNEFkd2Fhd1kzbllnRzV1VTd5c3paZGFSdnlEaFJXcnAy?=
 =?utf-8?B?YjBvMldqMllVc3NqNWVldG5hT3BrekkyRGs4cndrS0t3WEpVdmp5UVBuUlhw?=
 =?utf-8?B?dHhlWU5IMHVKcFkyK2x2QjdJVDZUWnBSeCtwZzRyRjFPZUxRUUVCMXluSEN6?=
 =?utf-8?B?TnBBZ1RkKy82Z2VxZE5Qc1BwQjMramRiUENTZlYzN0dWaDlXZ2lNS1ZxRktz?=
 =?utf-8?B?KzJrOHhOWDFRbWdPUFN0S2lqNlBlVmUxajAybHRHMDYyck9xWVI3VDdXL0Na?=
 =?utf-8?B?U2R6L2VsdnZjMFpLdmtXRXFpVXdqeDQ4ZjI4NlhmVGZRYy83a3JxZlFYZ295?=
 =?utf-8?B?M3BuS0dnVVhVU2JqRHdQT3JqOEpsa05sWjVSMW5aQ2FZbmF4YVpwbmFwb0ho?=
 =?utf-8?B?NWppaUJ1TVhJZ0hBUjJNYVFxcyt6NHBGcHVjODY3NHNHWVIvZDFVZU45eEc5?=
 =?utf-8?B?QkpKSkhCSzM5N2dnQjQ2Um5IMTZ1Sk11QmVyVk1vQkxzZkxQRnVkOFRCN1Jn?=
 =?utf-8?B?NU84Q3VpdmptMUZmOVkxK00xb2hPOW9FeGdySHh2MHNZSzZKblBaWVFGUms5?=
 =?utf-8?B?Z0tLR09YYWl3UlJzUWFyMVlEL0N6Y0NTMTJIU2oyU2l0ckIycjVCRUh2VlB4?=
 =?utf-8?B?RitrNlVBUWVLOUMyWm1TbnIyZDVxTmhkN3BXVG1WWVppd0xPRHQ2bCtrU0J1?=
 =?utf-8?B?ZUhnZllLR0VleGh5UVNoQ083MnhwNXduWXZNdW4waWxDNGJjZE5PUjA4Z3k3?=
 =?utf-8?B?ZjhVWUdKakhFdXZKZ0xRNFI0Y3JlQkJ6dGpnT1FNbGpLdU1OMXJBNjI2RDRM?=
 =?utf-8?B?dzN2QzFPOVZTMGtndjRSenpET2xBeGlpRHhVVDhhb09vUU5OekIyTlB4UGNs?=
 =?utf-8?B?bnhsMDNHTHFYeGJDOE9kdWlXc0d4alYxSGZ1MHA5QUw3K1QvOW5jTGpxVXBo?=
 =?utf-8?B?WnZyOThId0N1NUk5U3dkRnRLdUVUanZIVkpFZTd5cEJ1cDRIM2ZWMDZHNHFN?=
 =?utf-8?B?M0JkWFJGN3N6NExqVUZQOU9FZnEwTWtqMnk1RW4rc0c4M2hNbHR0MlVnYzJI?=
 =?utf-8?B?ZVQ4N05pYkVtVzVRY0VrdmFYemYzOTZrZnFSRFhEeG1GMC80Z05odEtEbmtE?=
 =?utf-8?B?WlhIL2I3dVFJa2pUSFpGME04eHhTQkJreHVHK1M3d1pHS3B6d3pINitkakZ6?=
 =?utf-8?B?Y01tbW9UVWxELzRWbGg4S1hMRExNb2JscjU1TG15WjhhbWdJWm9uT2dTTjEw?=
 =?utf-8?B?WkFhQmZ5VnBtNlZOOW9icjBTTFB2VWxoMzdid3JPUnZrbFMzOUhsd1Z6bVhS?=
 =?utf-8?B?aXhFQlFWVktlRFJGZnR0MVZnSUY0THdxUGR5U3VuZGRxZ1RwcUx4UDUxZ2lR?=
 =?utf-8?B?WjBaL0x3Q2x3OXdqc2R0aEt1dEYvd3pCM09GOXEvWVE0cGdGSXdwMXNaNklG?=
 =?utf-8?B?c3Z4T0dManpuMzArZUluaEROVmRqejFBaGFvOGN6VVQ0OGVFVHZaVEc5OFVa?=
 =?utf-8?B?cmhwaG9pREZLc3g1VDVZOU5yWWNSb3loRTVNc0R2RDFXN0NUZTBzd0xGam1L?=
 =?utf-8?B?djJwS2xMV2lHUlFtZ1hYTGsvek1wM0hZSDFwd2hDNWhRZGhFeVMyQnB1bzF1?=
 =?utf-8?B?RmRoUzV0WTVtWkVkYzNWSWsvMXdXSjA5TjZYWk90RXphNFZEUTJaMGd0OVdv?=
 =?utf-8?B?S0IwcEhDRmp3Q0syNDAwRlpMNjl3eEdnTnlLMkJBT1R0UFgwK0ZzeHZDSEhZ?=
 =?utf-8?B?WUxmaEc3OFRtTWc2cXpZaUIraGFNMGlkRS91aGFKSmZ5MGdNZTN1eWFiMzJM?=
 =?utf-8?B?eThnTlRQRG9ZTkl2NHFSWU1qcjlLVDVUdXAzejNQd3NGTjh2SFUyMDJWd09r?=
 =?utf-8?B?aGtQRG0xUEorMnFUNlVSTDRUUjd6RHVZZzB3SU1iL3FWUDI5VHVhUWZuRkFx?=
 =?utf-8?B?SXF6Y2R1cExDQWxzbW8zeXBJL2wzeU5Wd1dvZTRVVEVYTnpEWmFqQmh2bi8x?=
 =?utf-8?Q?dniTZkZUJakxdk0NXXyRXQFKz?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6303daf7-b24c-43f1-3806-08db0827784d
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2023 09:49:41.9849
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7RIfm/Y/+r0K8amiaC/a4CN2/gfi8sDn8/SuhYEU3ncJdFD3c0ytMfSnM0jffK4T8/YeQXSPDXdZmntrP/mUgw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6779

On 03.02.2023 20:55, Stefano Stabellini wrote:
> On Fri, 3 Feb 2023, Luca Fancellu wrote:
>> And then, if the file is not subject to backport and now we “own” the file, there is no more the need to list it
>> in the external file, a commit search can reveal when it was converted to Xen codestyle and removed from
>> the external file list so we don’t lose the history.
> 
> Yes, I agree. If a file is coverted to Xen coding style and follows
> MISRA rules, then there is no need to list the file in
> docs/misra/external-files.json.
> 
> 
>> So we would end up excluding just all the file listed in external-file.json by the analysis.
> 
> Right, I think so too

Personally I think this is too focused on Misra. There are other uses of
such data, like automatically identifying changes to the origin file(s)
which we ought to be pulling in (recall that we've been doing a pretty
bad job in this regard).

Jan

