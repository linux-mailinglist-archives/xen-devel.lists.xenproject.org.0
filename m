Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D3BD59C10A
	for <lists+xen-devel@lfdr.de>; Mon, 22 Aug 2022 15:54:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.391434.629255 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oQ7sO-00089V-Vs; Mon, 22 Aug 2022 13:54:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 391434.629255; Mon, 22 Aug 2022 13:54:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oQ7sO-00087K-TA; Mon, 22 Aug 2022 13:54:00 +0000
Received: by outflank-mailman (input) for mailman id 391434;
 Mon, 22 Aug 2022 13:53:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Z5UX=Y2=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oQ7sN-00086y-0B
 for xen-devel@lists.xenproject.org; Mon, 22 Aug 2022 13:53:59 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr50082.outbound.protection.outlook.com [40.107.5.82])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id de4f08d6-2221-11ed-9250-1f966e50362f;
 Mon, 22 Aug 2022 15:53:58 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM9PR04MB8554.eurprd04.prod.outlook.com (2603:10a6:20b:435::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.22; Mon, 22 Aug
 2022 13:53:56 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad%4]) with mapi id 15.20.5546.022; Mon, 22 Aug 2022
 13:53:56 +0000
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
X-Inumbo-ID: de4f08d6-2221-11ed-9250-1f966e50362f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=coWAtY9OTDZmWtw0MRLDQB4uqRBTNboWCXW8hmKTapoQmG2CMz+FQhD/3mMtsdleLdZ/CHW7iBgGtKdoRYyvU+dlGz193fP+IGSduoWy/a37hrK12LTM6vaKf57OobDW0+spk8yQrEOlyAlHrJeXrh5VVAg7XBKnH1g52bBRsLcnuowiHPLoiV558W39L5Ax8qW6pyyiMJvMa30+Na+FD2pW7IyoyiiVpI/WPN93/Mu97gfFuLwvjlf77+ZSq37+0dDPFbHytYl5Rjj/e/RTWqNx/bXGjCmUC8F3jZpN1itxaQjiAF090bPgV1OHMkPiojfcX/LEB4bpmj4Hx6L0Tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6c4P9hhBfahntbwYeZFEue7CEutwcnb/7Qyubl8ktts=;
 b=jy/SG2eJ/18VD3DH2Gc/ekg24Ep7h2ePX8ohMuXrBk19ppYlrM3uoEXxOIhzn6RzsOBSCpS7/kOuuOu9kVkMhz0ONcnxY3vFX8gAJURStSCamITROdFi5vH0CO9u7pAl+Bce8i1gxOPeObn8ijGWKU1FXFuSo8dN+xZonrdzbKvkK8Pz+DpUUgdCGAUqmPP6FXnTrj3K5gP4AANZcRMtrQwfKIpkEqiaIWHZgJBmK8flu8QtAcyGZaDS1vKVTkcq4DUNQMLiXHQTVSB4r42G5SMVyuLlJA8DzaEp3yVW0hJZuDVN5lNcNIKUqG+OvQ3/tRTjiOiVqGR841kWogYXRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6c4P9hhBfahntbwYeZFEue7CEutwcnb/7Qyubl8ktts=;
 b=5LYOcqKpH5h5ur9tVg1r3UinKDN/I7e8pyrU6h49l9gjd4lGbXi6L48O4zcsrM94dddtl1JOC128D2C/5wGlB215bI8IUTmZQcoTIvjqMeY1UL5oTkPpq9OZQed6hvAgwvb9vZlwK3CyZWYxq+2c6ZIkF+5koT/6Q90ygFB6+e2TzHvW5W7dLpTpmShZYdZKKikuoCFaqBRq9AbUqEmLH2cH9ou8zvrJpmDvTx01/HJPkTAw334/YzCNLe8UY9CVWpgSslpxSn05CBPkSSxBInv7xzWaOb/Xx7pX6acMpOKXS+Si3NswZ3PQZxKLlDbH5Vos9rSADixlcVgtiKau4w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <1c669d36-0cb8-53a7-3fea-1caf06b7d363@suse.com>
Date: Mon, 22 Aug 2022 15:53:54 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v2 4/7] xen/evtchn: modify evtchn_bind_interdomain to
 support static evtchn
Content-Language: en-US
To: Rahul Singh <rahul.singh@arm.com>
Cc: bertrand.marquis@arm.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1660902588.git.rahul.singh@arm.com>
 <abe4c5be55125eb3da33dbd187fd9b8ad5ace714.1660902588.git.rahul.singh@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <abe4c5be55125eb3da33dbd187fd9b8ad5ace714.1660902588.git.rahul.singh@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0017.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:15::22) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: dacc0d09-7511-4c2c-41f5-08da8445c182
X-MS-TrafficTypeDiagnostic: AM9PR04MB8554:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ftBgqYZul5mGmb6DfHD8dtGPaqftHi9PpQfy0wxiOAm7FK0y4z0XWl//GHWvgZKbZcRzvG+mPX+9fLD7BclskJAI9XuZZ+9x/hI1AK6k2krxwp1Xv2hp2IOgvPf5LcPtzTigtBCIza6OAYC0aCBMJ6mOyQKqxKQM29sqCv/H5su490nXCHhiAPxDWjWcgTBlxDdKZlQsb0Trfsg/KYLVt04o/RVDkfQWdrWru2YmeNCKyNwvtrdQuA16G+0mgQB0eiUxh+xBPaEmAFEe7/uCTJ22kG8m81yiZVbzOubllzQBG/pdp9N/sBP17niOssuSsRSAam/m7K+6Ls61IcLRFNOAZPLyIjN1dJ7BExq0RiHHfsNJDODgRGfQ5/dQm+g4dJSQs/bQaHQR1wrDq5FIIGHdSzBWXzS2lQe0F/66GY9bYKiERk67R+MkWJJeeigOzbbshw0TfUm0svNJvv17RSXmDqK+pXYaXftl4wQqbsx2kgjwxlJbcXgiAIjb3i54DY2srFjHSNNW7crZhG4KczO4cyS2v/kDTKX85t75DDOkwgM6G+g4pT+rHwM/HXNaRsBbdiiW24w3c0b8RrjxhxEhZ/U5S/gPg+tw5/oIunvi6+zIHZca6UphHLtSY0QO0QVA98iiQ4fLEz2rdaVCByAxenI//CX5CHsuRk9qzO4w6hCf6nErnNUC7aOMM1l8egDaVJGniEUnFwbbgnDwtfdCajCYVLYkmi+DGDZhbSiSzJzPDIvBv+JmdmdqqAvQZC7FdJ4h0QPwwGtWalOYHxkHtG1EofHxqx/CAz78sbQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(366004)(376002)(346002)(136003)(396003)(39860400002)(8676002)(4326008)(66476007)(66556008)(316002)(6916009)(54906003)(66946007)(38100700002)(8936002)(5660300002)(31696002)(86362001)(36756003)(2906002)(53546011)(6506007)(6486002)(186003)(83380400001)(6512007)(26005)(41300700001)(478600001)(2616005)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MmF3MSsxcGRtejU4aml6VWY5VHZXcTFOZElpcmJlRnhRb0EwVXI1UXc2NThM?=
 =?utf-8?B?RzdFRjJwY21YcHBOVnFoTi9oVGNFR0xEeUI5c0daY2pTcnVrMjJYd0txekJC?=
 =?utf-8?B?RHRDTDJlaWlPdWpoVWp4ekZnZTVDNXB1Mnduc2VpNVFhKzl3TXNUZTJneXdu?=
 =?utf-8?B?QW5CWS8zd0ZCV3dQMzBQM0ZnKzNLaFR0dEQ1c2duZlV4ZXFYUDg4cFhPQXdr?=
 =?utf-8?B?SXhiL3Y0NjlOdk9neUxDdHdkdHpXQXFONlF0TlZMUFlTbjdYYU9NaC9IbXVH?=
 =?utf-8?B?YU5zVThUYlloWVBEYUVnVEpxUytPZUJvQWt3U1pHZUgvWWlwYjk5MzFmVDc0?=
 =?utf-8?B?dExUVEt0TnZlOW1vQzlhK0NzMy9WYWFWOG1UY1JKR1NKODZUZTdvRzRkNTM5?=
 =?utf-8?B?QnI5bXJ5TGdkVUl4MkxRR0VXNjcxazIvNEU5aXlyTE5paDhNMkdqV0F1eW9M?=
 =?utf-8?B?UGI5T1gxYjBoQmRQU0l0eW95Q0NuczltVGx6QWdlSkY4UDZPUGVTcTFuM3dW?=
 =?utf-8?B?NStmOU9DVGNUVUl3Qmg4Z3FXU0NET1RucWNkQWZXd0xHdnBYYU1IQUJ5UGs4?=
 =?utf-8?B?ZHRub0pLaThicTltazA0KzFDZ0dxVnJCRHUyTjE1bm1IS1pZOElRaEVGcHhy?=
 =?utf-8?B?WERlcy9BTU9JeUlkclR2VmcrT2dZMkRJdEdXMlBEdmhhbnNRODBpUjFjS1BE?=
 =?utf-8?B?aUNyR1NaaU8wQkdVYUt1Z21IU2dveWdWZmJBWm9Ba0t2TlJ0U201WVQ3cVNn?=
 =?utf-8?B?dkJwWnNwWXhQRzdvMzI5MTZpUFdlc0FDMzZpL0VwZGZjamM4ZTVyOHhWOE9p?=
 =?utf-8?B?a2t6ejNIVUU2VG8zVzVWajhacmpveTNxbW50eGxmUVBUdS9JT2RDNEFadXZn?=
 =?utf-8?B?ZmhKRzBUTHdJQVA4dzUzNGRnblJ5U1F5RS9ZVTdhUWUwYnFIU1J2L2lGakZu?=
 =?utf-8?B?ZnZFaWR2WVR2M2dHOUlpNi9PODlsSGo3VWxXY0UyY21IQ0RaYmJlcEZURzFt?=
 =?utf-8?B?TXdsL3BmOHl5M3VGK1cwNCtTNDFTTjZKQm1PT29JNkZFRGdCZVpHeU1Cb2hk?=
 =?utf-8?B?VXhaYXFDSlRiS0JScWJmWFZoeFl4TlZDamJjTCtYOFpDeUxvMTNQbjhYMHdP?=
 =?utf-8?B?VW9jT2ltQ09zaFJGSmNqTVFTS0tleGZVUHg3TUhNMTIzOHJaOTUra3hkTVE5?=
 =?utf-8?B?SlRpeTE4OFJhcXJWRVVta1luaHlKRWtFdG4rNXd3TllwNldxNytIejVsby84?=
 =?utf-8?B?K1p2bGFFNGoxUEF2RU9Zb1dsSWRKR0t4OXZQYTJRRWRvWjJKeGxNSXIzVE9i?=
 =?utf-8?B?ckpMQ0JXb3hqUmlwQ1hqcUJ0c3Zqd21RMG40S0tFODRXZ01rSXUwUjBNbFhh?=
 =?utf-8?B?Z0EycUtYbEdPanM2Q3lIWXpwME5xVnlyenh3dkZxUk0zc0tzQ1c4cWhsMmkw?=
 =?utf-8?B?blZNbTYwMFhCMEFYbDhQNFI4ckFaTk5qdElETlBGUHZ5UjIrOHl1QXNES2w1?=
 =?utf-8?B?NzE3OTVZVUtPTWw1MmpKd3FoeXVLTEI4NUJwRlZjUmZocU9pUUg2MjBDWWdm?=
 =?utf-8?B?RkRVOUxQeEVhcGNENThsSG5tZHdkbGRLZVQ2dUUrZjkrSFJuT3hKWXdYRTFF?=
 =?utf-8?B?MnhnZnlCNDl6K1ZONW5pM0JIQzZHYUwwVUVHcHJONnd5eW53dEFIbENoejVr?=
 =?utf-8?B?OWw1NFcxY1dleURvYU9qMklKSDdsWmVqVG9QSEh6MGI3UngyRGFzbHBDTmcr?=
 =?utf-8?B?eFkzSVJZd0lZcWJtTnNjWDVwSGNHaHd1WTJqMUJxcG9wMThpOFBET1RVc2NL?=
 =?utf-8?B?R3ZPbWd4TmNpdUw0aXV2OWY1ZzNoMUs3YkxXMHJ3WWM3Q3JnYk4zakJrYlI2?=
 =?utf-8?B?TmxxRlhTRm5jeFNuaVZ0Vk9FQUxaN2c3TUhSTDJYc0RYN3pNQ2JxUmhBOUlP?=
 =?utf-8?B?OXZoYWFZenVzWDZtSTlRcWFCMWV0cDJhWmpGdzE4WVBmTnhZMzlEMjJPUUNa?=
 =?utf-8?B?L285NExtczhtczEyMndwSEYyZnBYSUI2a1JRU2VpK2thTzN4NldUSUtQUU96?=
 =?utf-8?B?d3RHeXU0eDh0cGJCOEhHWlcrK2xPU2s1TDNwbmFjcURQWXpJSEM5ZGVaRUd4?=
 =?utf-8?Q?/npIIfLduPoIYtG33+fYL1Zyr?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dacc0d09-7511-4c2c-41f5-08da8445c182
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2022 13:53:56.2058
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LVkzqcLCaVTn44oqgpyVi6FDgrzd21zD+9ESbKI+7C/Wp9AQ3Ng1VJ6IzcAZ2WR0O/RfIvM7MUwo0/eWs65ghw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8554

On 19.08.2022 12:02, Rahul Singh wrote:
> Static event channel support will be added for dom0less domains. Modify
> evtchn_bind_interdomain to support static evtchn.
> 
> It is necessary to have access to the evtchn_bind_interdomain function
> to do that, so make evtchn_bind_interdomain global and also make it
> __must_check.
> 
> evtchn_bind_interdomain() always allocates the next available local
> port. Static event channel support for dom0less domains requires
> allocating a specified port. Modify the evtchn_bind_interdomain to
> accept the port number as an argument and allocate the specified port
> if available. If the port number argument is zero, the next available
> port will be allocated.
> 
> evtchn_bind_interdomain() finds the local domain from "current->domain"
> pointer. evtchn_bind_interdomain() will be called from the XEN to create
> static event channel during domain creation. "current" pointer is not
> valid at that time, therefore modify the evtchn_bind_interdomain() to
> pass domain as an argument.
> 
> Signed-off-by: Rahul Singh <rahul.singh@arm.com>

Acked-by: Jan Beulich <jbeulich@suse.com>


