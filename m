Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 416A0793565
	for <lists+xen-devel@lfdr.de>; Wed,  6 Sep 2023 08:34:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.596237.930046 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qdm6u-0006YK-EX; Wed, 06 Sep 2023 06:33:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 596237.930046; Wed, 06 Sep 2023 06:33:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qdm6u-0006Wb-Ay; Wed, 06 Sep 2023 06:33:56 +0000
Received: by outflank-mailman (input) for mailman id 596237;
 Wed, 06 Sep 2023 06:33:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=SxG1=EW=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qdm6t-0006WI-Ea
 for xen-devel@lists.xenproject.org; Wed, 06 Sep 2023 06:33:55 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2062b.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::62b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5972a018-4c7f-11ee-8783-cb3800f73035;
 Wed, 06 Sep 2023 08:33:54 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AM9PR04MB8842.eurprd04.prod.outlook.com (2603:10a6:20b:409::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.34; Wed, 6 Sep
 2023 06:33:52 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654%6]) with mapi id 15.20.6745.034; Wed, 6 Sep 2023
 06:33:52 +0000
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
X-Inumbo-ID: 5972a018-4c7f-11ee-8783-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kHfSlgF2ZTsfepuMPuw0E8M5/5CQWK2mWtLUp19c4n0pNmIQd7+0HOjXs4CH+rZe7c5YCyoxvcBn11njsignX/eceGTFmGneolf+J9SOE7Wv+IrKBkmmSr5x9LFYFMrkIXiotzx/O5aM+A8K1IAr6knRRgSwvkyfIb6YPcTsRssoo/eq0Wuju7KOgrgA4bnRIDnE0/4lCcGubA+Wk3VTi2vrkNuXYzPvZplZEX3/+Kx9NffhOE7srPkCuxHooEhjxrKjIR8QmxxiLOYoCmcloqztbhr/LcbtI0055vpk9GRkioKIdY/qxhhdFNDiyY7f7jmWIxCRiv4rj2b+WyPl3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U5BGLBNicceP2/lgYPNwLZNDj1v04gEpsGB773amOeY=;
 b=nh0ggBWi3aS9XddLZH44/+0hLbxQk6RLQr/fFOcqgwdbOgEev/36xks+1gckmhZHLv6No5Dn/VsPzmDKGdr5QI1TccatIJJxVs2ZNJn+IXBbNrEmcJ4qyZd6PQmhzvOGVKLJbwETz54l119hjXEw6ul7FH4jkjbQPPZ6bl3vEThiEooe6jlaD72vUjaXYNlBso9eRF8BkhYzzn2sxR4giLKfmvK0nAAbTamCTSGkIN3jHKUQfjO3JBpcDqS730nvFF8fNcaLY4SiTt1GHPA1kdoZoNgj9+a5f6HYmz+2fRZQ95czSqT9OAfjR25ifRgBgsL2dD2/8tupcmo/YS9xlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U5BGLBNicceP2/lgYPNwLZNDj1v04gEpsGB773amOeY=;
 b=mh8p6r8S+CGu7SHcInqqAAgzGqS4BpnUPXslVIgZJU22kLpp6Vrxt9Cs/F1SKQNszTjwsjdCc/PMYtUEXkDzsJzSdrs2n2v+M+R1GJ8oSCcW4UQ7TvAyoCrX0Im4WYHelbkDSa9b/ShVz/guCTY4oYAlGl+3ngIPapWElIA0Ubm9PnbDkemrSO8eyJ/53OwllI/Cx660MVIWI+80FlWV6QRNBZo1Gfcjhg1nFhX85jn9igFgzWQt/y+dQ8jaePeqg1zwdAc1Yiwhi0i6RijUpq8va0JwHZp37z3I2LZkEES06G8qP2hrWTGCT0wWp5BnQ/TykbldYxfCslWDQz2TPg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <3d811598-54b1-fda9-35e2-7a2ace8595fb@suse.com>
Date: Wed, 6 Sep 2023 08:33:49 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [XEN][PATCH v12 11/20] xen/iommu: Introduce
 iommu_remove_dt_device()
Content-Language: en-US
To: Vikram Garhwal <vikram.garhwal@amd.com>
Cc: julien@xen.org, michal.orzel@amd.com, sstabellini@kernel.org,
 Paul Durrant <paul@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
References: <20230906011631.30310-1-vikram.garhwal@amd.com>
 <20230906011631.30310-12-vikram.garhwal@amd.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230906011631.30310-12-vikram.garhwal@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0046.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::12) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AM9PR04MB8842:EE_
X-MS-Office365-Filtering-Correlation-Id: 351e7b13-eedf-4fef-8d7a-08dbaea33cc3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	7ed3TnEkYenYSAdCOA7fp1hrPfPOA6sn6M3QkiZxwOMbodDkEazLFTEGGDkneCDTEVi48oAVqRS/YuoolOjhxKIsBZtoOZ1TPliBaZUW7u5jsH4lQr/xdlvZp7F37ElTOXiStPxrzn0svkFLInhEf4u8SM7CD+NTW+vm6r6ARS5cc6YlCkmOsttQSG+AOcV59bpFfFpGSHg3hkZeAaMy/C+E693/l75PxLe7ZY5LwweHZMDvR8HajH91409Cu3LpX8miM3vHXnIXzKJXFBAUbnaa8hBaji+qesl9mDJ+Dk8dBMnjv/I/NVQhSr0XZ79U/E3luk0lYvxBkPfnGWJknHjJwTHw6a1wJlLytI0ugA5xi7hE2AmYISswkD6vDPBP1JkPluVgY0vO15cRRzh1alv0n/nF5wGN2BNM51MaYDkKtKVXaspIIRtV5h2LgCGNfXsJiuBbsAkgh0LPE7D1t3Rcq5lcZ30aMNdG4z4noql+CrBAZCBvdPXHacm1Le1brF89nx085KM/ohWl5zv/esjqLpwg9Th7Fg1fxyKLVKwsPf2tI6bWu/tJtSv7auJkBtQv9z63/IQRQovP9Tk3+wCBdLyWtaU/2iKKSQDpYAkHjHtPneeJz53mgW4OubEHF9d8qwTktfSbM3FLINxSJQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(396003)(346002)(39860400002)(376002)(136003)(451199024)(1800799009)(186009)(36756003)(38100700002)(31696002)(86362001)(31686004)(6666004)(478600001)(26005)(316002)(5660300002)(6486002)(53546011)(6506007)(54906003)(66476007)(66556008)(66946007)(6916009)(41300700001)(8676002)(6512007)(2616005)(8936002)(4326008)(2906002)(4744005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YjZQems4YkU1QmZEZDRENzV5ZXptN3kwdnp1ZmlyNGd4WmFKRlZYTThhbEUy?=
 =?utf-8?B?c21uUUxBdlR4YXJ6RHhNRGVpajNPcG9nWDBGdGdSM2k5aHNad05GOWV5bjEz?=
 =?utf-8?B?R0lKRFFmRDZKY2hIWjhjcHdTK1pvVkh2S3cwMVBJUWF1TmtKeFJJMjgzZlFq?=
 =?utf-8?B?MnA4Si9RWDBHaXZGakpyVy9COElLWkRTekFIMi9oZnpnQnRmdXJqekVtMEpN?=
 =?utf-8?B?R3o1emhpakt4OHkvK2k4UGNzUm02TE16aGFpNU5sa01pWHRZcTFEenZpSFEr?=
 =?utf-8?B?cHFwKzhBYlJmd3EwOWVqMWY4ZkFOTzdZbzBFSXNvcFJ3M0lIekd3Y0gvdTVL?=
 =?utf-8?B?K0hzL2VpUTJRbzNsTGhWcjhTWkJWVWdxWXBTVDJBb2tjZktlenFuSGhCMTNP?=
 =?utf-8?B?cHVnd2tnczRuOEppcDd4cjZRMVBiR2RERzMzK2FlYUN2TnZDc2xOQVVGWktY?=
 =?utf-8?B?RnU3RFNSVXp5bWYwUmF0YWUyQy9qSTAzOVFrYU5aeEs2Myt3NEN1YUdOM0FV?=
 =?utf-8?B?clUwSkVVTVJGdm5OSWROdk9IU2U2TStKN2ZzbzliZnM4TXU5c1lwZ0ZIT252?=
 =?utf-8?B?elpLYk5JVFNYUFRYT3hPd2JFWEt6L3k0VklXVnhZdlc2QkVVK0tidEJFd2tn?=
 =?utf-8?B?NEswMVhSV3FKNGNHcmh6M0swNTI3bm9JSnExYnZ6a2c1NDhEUUk0V2xyOXBy?=
 =?utf-8?B?eW9YWHIxZWJGRnJHQkh1cUVkcGRlVlQ3Q2lWdnZUTC9DVjcrcmNIWE1XekFZ?=
 =?utf-8?B?U2VuT3RBU1J2MFVTZ2ZBa1VxSUFuM25QRFJLYk5vQTdpdldzS3RDNk4wekFz?=
 =?utf-8?B?cG9xazNEeG01cmFOMk1BRC9CN3BFamsycXhOQjRXWWNBZSt0Wm9xOEsvYWRv?=
 =?utf-8?B?MHpadXI1Q2R5YjFzNklIMGNSMXhCM1BVaTBES1RRZ3FjbndvbjBFclRHd0VO?=
 =?utf-8?B?VEFnTnk2UkI4L0l0bERCTVNVd2p1c1R1bXZoY2dvOE5VaTVCRTZvVVFMdTBK?=
 =?utf-8?B?QnpXUE5qazFLdzVoZGxTRGM4YUhqcTRFN3ozZnlqRnAvZ1lvR0R5QlZTUGl0?=
 =?utf-8?B?VmM1TWhHZXVhK1JxRjV2bkk1bEF6QzRTc3F4a2JURkk0MzdjUUIzU2ppeHRJ?=
 =?utf-8?B?MTJNWTJVNmQ2eFBSZlJWUDdnVldIeGtuZ3NIUFEzQ29FalpmOVpwbnQyZlBn?=
 =?utf-8?B?bFM3SmtwcnZOOWpVcHlqVEVoR1VrWk1EclRUT281Sm1YdzYrbTVTcnhZa0FV?=
 =?utf-8?B?cVFXbXVBUmtMeXJEK1ZtUkFSekVMMk45N2E1QlMyQWJPQ2JZQXFjTE5lRjND?=
 =?utf-8?B?U0RWVDllYzdOQVlvdS9kWlpoWWpXUGFwQloraEN5NEVZbHhGTVhKa2plTFox?=
 =?utf-8?B?Tk5hOFUxVFkwMlo2L21pYno1TVJDWnF0RlJaQi9zeXViT3VuSnZHa1RoZTZs?=
 =?utf-8?B?MWpGSGJDaE9BNGZWb3YxZVQ4amZjS1RwckkxZUhLOWRFUzBOUzcrWVcwQVUw?=
 =?utf-8?B?SmlOT1o1dWVzNFhvSFNpNjZYTUg4RnhiZ25OZmc5U1FSOGlYRzlQbWdGMGJL?=
 =?utf-8?B?b2doTkIycWhHeGthQWp1TWJtaDMxd0tDQkFzYlF2c0FLMkt1Z1ZFMUNSTEpB?=
 =?utf-8?B?Ky83SzZPdlZQYXpIeFVQaFh0ek9HUXUxVmZyb05WdWdGTHgrQUMxaVJYeGNF?=
 =?utf-8?B?YkpXV1lLQWVuZnErNFR6MjFwNUdmOG1aUXpvanYvQkF0alFtME1DL0xRQkJB?=
 =?utf-8?B?ZVFUSTc1RjJ4cmdRNnN2cmIwM3BXUmp2MVhkOFJ2RjBmN3Juc3VaODY1VnZQ?=
 =?utf-8?B?Q1daQk0zOE5jdTVMSkNQN0xWTk5zTkg0L2I3WElTUHFsaE9VNWRaVndTd3dv?=
 =?utf-8?B?SE5rOWF0d0puWHhydzNqdkk3blBmMlhOdldveGZWbDlXcllsb2ZYOGZCREVk?=
 =?utf-8?B?N1FPZmZ5dE45QWtmRTBBV1pDMWVFV2YrM0x6R0hSRnMwYjZFQ2Z3aDNQZW5l?=
 =?utf-8?B?ZnpCVU5RQjNDby9GSFV0TXJZVUs3ZUJYZU4yN2lkZ3BnN2diNm1BR3Uya09k?=
 =?utf-8?B?MERFdGhNUkF4QW8rSnRHbE9zUytodFdtdkU0V3BVekI0ZzZXa0hoaUdZYUVT?=
 =?utf-8?Q?wUOpu8hPCZIv9drG1cO8YvD8A?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 351e7b13-eedf-4fef-8d7a-08dbaea33cc3
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2023 06:33:52.6709
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Go7bOt4pstZvryD6tel4GWb+N5O3eGanYpm1xEqwoN+4FAqKPcnfA9N8d3qHiJHzFXB7iF6Ao8pXzaFT5H79Pg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8842

On 06.09.2023 03:16, Vikram Garhwal wrote:
> Remove master device from the IOMMU. This will be helpful when removing the
> overlay nodes using dynamic programming during run time.
> 
> Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
> Reviewed-by: Michal Orzel <michal.orzel@amd.com>
> Acked-by: Stefano Stabellini <sstabellini@kernel.org>

Since apparently required from a formal perspective:
Acked-by: Jan Beulich <jbeulich@suse.com>

Jan

