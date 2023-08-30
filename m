Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 653D078D650
	for <lists+xen-devel@lfdr.de>; Wed, 30 Aug 2023 15:49:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.592947.925804 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbLZ4-0007Fc-Cg; Wed, 30 Aug 2023 13:48:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 592947.925804; Wed, 30 Aug 2023 13:48:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbLZ4-0007CJ-9G; Wed, 30 Aug 2023 13:48:58 +0000
Received: by outflank-mailman (input) for mailman id 592947;
 Wed, 30 Aug 2023 13:48:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=a0OZ=EP=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qbLZ3-0007CD-8c
 for xen-devel@lists.xenproject.org; Wed, 30 Aug 2023 13:48:57 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on2062c.outbound.protection.outlook.com
 [2a01:111:f400:fe1a::62c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f60a5e51-473b-11ee-8783-cb3800f73035;
 Wed, 30 Aug 2023 15:48:55 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DBBPR04MB7948.eurprd04.prod.outlook.com (2603:10a6:10:1e6::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.20; Wed, 30 Aug
 2023 13:48:53 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654%5]) with mapi id 15.20.6699.035; Wed, 30 Aug 2023
 13:48:53 +0000
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
X-Inumbo-ID: f60a5e51-473b-11ee-8783-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S+sb1xYY2+Dk4WK5fVO/z4HsWinhbgWy3NkjXvf95J4+AWYb6bYfsyYG1pw6nQntL8ljOceq/CiIKwd8IYI8LNhQ2cd3N5w3Nbg9xwqxDIc0x+SMyEoH1bz05QspU9tiQl6Ncr6DiMvW7+YZ6ZVvhkcmLCG0toAzwGC103+L+jamMvu/aXj2J4jIBO/dY3Lei9db+U8yNm9fj6B7jX+vO0a5HdkKJqxWza5q/s5qdLdQQOaNdGkJdWZJwbCUw6TtqlO1B20yM/oxH2TnmXgjQ7xE7nX3jQbUw28IyIcqkyrpbNG3ZhB05FUqjxAUdchORe9LID9a4OGKXtkJhdR6UQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fKPocFkeYTneXgaiReDsec7s2FuthhJR8Xg/5zUkQ0c=;
 b=bPGHaebOjVU2nyTpH05DPJtRwjsxH4tSTpwgnkH/T+m4Xev5wLnXiCttiaCFMzkV5LaGxFFX5TLN09LH8wPgbHtOYOq4nxLD85KaAvu8THS7MSIRkhT3nyOkE00ZbpP8WjeS2EmMJiDshgCWe1XUwYP9q+VD9p/GQvVRN8py0FqghN8dys+avtAKMBqMdakOaC/jPJkPycGDVrotMOBHGfjujnnBwcg09+OHx9gIPIQqRZgvZQ0PaSDcy655H9FRR1XZkvV4kaweO4nyYc/aruxbXe/757eBRNvyGndHVIfSRYMgy1gOsJthoQ3JRohSIfNQ/Qw7+edGQKbv0MpJvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fKPocFkeYTneXgaiReDsec7s2FuthhJR8Xg/5zUkQ0c=;
 b=re89Dr1xxRcVRYN1xRfl90yCJ3CSV+nwZSkakHk74FNdk2WxCuB9N2LzO4oQO1kbPub7L0lNkqI0uOA5xeeSu+DdMq3e+TN6yelY0zO1v3j2yqZh+H/YiTWyYyiLpUxdSref8fs/E25bxdHx0HUYe/H80rc6uVR3etU+Snwq/l90wFaZQEQKgHZXK3luuM6LR4MSQsvHjeppV206Sila+eMQx9JhhMUuNzDhWzDYrHrQCXOroQl4CGlEGvjAxopv7m451beKB3qSs7mzm3tXQ+zvW130rYoCPLDVeNAXJuJqyNOFsKxUn87c0wZf/bbUwJJgl84Gb9lgzhHY0BSBSw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <4d42d360-bd59-5b67-1d50-e0345a25af15@suse.com>
Date: Wed, 30 Aug 2023 15:48:50 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v4 2/6] xen/pci: convert pci_find_*cap* to pci_sbdf_t
Content-Language: en-US
To: Stewart Hildebrand <stewart.hildebrand@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Paul Durrant <paul@xen.org>, Kevin Tian <kevin.tian@intel.com>,
 xen-devel@lists.xenproject.org
References: <20230828175858.30780-1-stewart.hildebrand@amd.com>
 <20230828175858.30780-3-stewart.hildebrand@amd.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230828175858.30780-3-stewart.hildebrand@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0080.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1e::14) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DBBPR04MB7948:EE_
X-MS-Office365-Filtering-Correlation-Id: 69a30146-80d2-4efd-c2e3-08dba95fd948
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	61uK4Yfi6t8truLVeBDPhueeOl7vZ6wL7nHUJKpIRTYW2bGd9aLKd4Z6EoADnWlvE6Y6gQ9O0LfLxhY6z02qoJbKHkW/piTCGJmTnMrskBnq3zzDnVKH0d3QsXuzAifRWseS58M1dVFcWUE0nI575ZkojbCnkNwTlpsbVqAsAN1vGBnEOXVmfvLZC4y4CeFYp+if2/Ipobu5rpQ4ndUGAS7l84f3ZWjBmFqA9gClSK9SxIeH2Tllp/pkVR8PxyJIyl0GbsM6TY/BOSMw75N+FsC7afKD0zgOXPHIm0wa5NR+B25jBq5Y/9btbvNGj1YUznOnDdVQo30tFQkIyCyQdI2WSL0PQ/6KqLJWQ+ZgNQzo+oH5WS2nCN3wMBb/U3nLN5wP4DNxVCXCo4jaqyGcp+9vKsx/xIuYZoOEZ3wjtF+BfQGBuCuMW4XMfzo3wC14L9qbV3eK2LMHPpzEJQeXHpGZ7fkNrA/EdOoEW+f2PoyePoH+CKSDmMS959/k9O6VCKMZph9ILXzMWmrLVbSKHiNoXop4ZY0JrtVI/X603NmfYpfDm1eigm8+/N9I0ItBeQBTNcIdoNrmNRpVPxYWFaqlTRPAt8dOSDzH0SeDGJz+lpZ0pddIzRy20uTpgIKUbhEHx5CX0Zm4vb1ICEBewQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(376002)(136003)(396003)(366004)(346002)(186009)(451199024)(1800799009)(66556008)(54906003)(66946007)(66476007)(316002)(6916009)(478600001)(38100700002)(4744005)(2906002)(7416002)(86362001)(31696002)(8936002)(41300700001)(5660300002)(4326008)(8676002)(6512007)(6486002)(6506007)(53546011)(26005)(2616005)(36756003)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Y3NZQitXUG56V2J1UVJoTGh0aXFocmVFdU9ibWtGcE1vQXN1b2JXa0p3U3dO?=
 =?utf-8?B?TStRR2lNWkI3S0RRY3hnZ08xckFvTW5sYXl1V21xWHBGQWpxVmZNSUFpYmJ6?=
 =?utf-8?B?azlQZjF4bzZhVFd5bitseFYzUG1EYmwwR1VUdHdoczZPZG1JdnhUSW4vYUp0?=
 =?utf-8?B?eTZZVkV0dGs5Z29GNUQ2bDNCRllCNWVZWlNWSDZGUFh5VFVHTDZ2RGRXc3Js?=
 =?utf-8?B?WU43UE80WXJQSDNDQUtTdThqU2IwKzAyWTNTNmx1a21lRnNudVFLT0R1dWVw?=
 =?utf-8?B?MGdhZVRacHJzYVdZODhwTXlPc1VkZnlDVFJPQzBuRUR2bWNTd1JKaGVZV0FD?=
 =?utf-8?B?ZkFYY1dQYS9tTFRDUGFMZHU1M29kcjRVVHpxUjNnbHVaTlI2L0NNZkFLY1dl?=
 =?utf-8?B?N1JQV1YzQmIxVmJSb3dyVjdQWndpT1Fwc2VjaWtIZzhmNGRybndnNzhzL2E2?=
 =?utf-8?B?SE00TUFrQ2c0Ums1cWNNNHFrNGs1cmtlREpQUVljRkZ3K0tuNzBOZXYrTEg1?=
 =?utf-8?B?YWlWdEk5Tm5aRCtFaWh1eTVnNW4wZURkc0FCY01RZXRNbGNuOU5lanc5NVJD?=
 =?utf-8?B?TmpKZkxCeWdQcXZLYWppM0NJMHVHbmlXSTZiWG5OMVBrOGM5RjZJQmRCTzBh?=
 =?utf-8?B?VVNCZWo2WDV4RU9seFlGLzhYMndpMFN0VE82NlFPeDF5b3AyU2hobDZWYW5J?=
 =?utf-8?B?NjhyMSs2Y2FUYkRYbWZYU3BDQWNocTJRRmhQenlibFpRMDRpaGhpMkZLT1JF?=
 =?utf-8?B?U0syK0M4VW1HUDBrOTRPV1UwMlE0TGdMYUR0aVNjemJBOVFTbS9xZG1qV05Q?=
 =?utf-8?B?M09KeW13ZFVwbS9vKzJwaW8wNGVGeEpDSjRRZzRuOVl3cGxNVVVjZFNqSk1E?=
 =?utf-8?B?bVMxQUhzcnlBQzRXQjNLY1FjWjcvelNNNnR6TWUvVGJrMnJFSHV0WGdsejJO?=
 =?utf-8?B?TTZqVW9zRm9EK0RlcHFwVCt5YU43b3NsTXhxUHFzNmdwUGlITnA5VmQ0cGFX?=
 =?utf-8?B?SDBNY08vZzdUb2xmei9ZK0dnT01EWSs1V0RlaUFreHFmdFIxRWZCamlwWU5o?=
 =?utf-8?B?emduclJiN21YV3JTNTdCM0Y1OFk2SW42aTZ2RHRzd1ljcys0anFuNSs5Mm5I?=
 =?utf-8?B?VWZwZlBSTmtXeDVOWnJ4ODR1VUpCblBvUlF4bjNxNGxEbnAzaVlWWmxuU1cr?=
 =?utf-8?B?Nmx2NUo5TSs3anFOelk5UGxpd0Fqc1hVRy9VVUluZ25TcTVDWkNzTDlxSDlB?=
 =?utf-8?B?ZXJlV3IxQ0VtSnRsTSt1OStYcWFuOHR5a0JwQk9KSXZmeFhycENWUVN0Ynli?=
 =?utf-8?B?Ti92bkpESDYrc3I1eDYyUTZlZ1BWbmhENTFZaGUyUzA2aHU2VE56TkFOT0Nn?=
 =?utf-8?B?Y0NtMWQ1L0daZGFGbndERmlEdWl3b0pMUWxuQ0tUZnZjVkJITEswS3g5Yldj?=
 =?utf-8?B?VjVMdWpzc0tFb2tJcTdkSVV1Y2lEbHp5RkZDRjIreFFoK2JMUDFjT2djK1pj?=
 =?utf-8?B?Wmt1S0s4SElmS3J0ZGZDTXZzNVZBSkYxUVhDQlR5bkw1ZENyTXNoVGhMQW9n?=
 =?utf-8?B?dm92VXhiNFA3bzRGVW5RTHRncDg0dkxGY3ZPeHhSeGV6YUtyL0ZJZ1lmSHNC?=
 =?utf-8?B?Z2dZNG8xS1JFeHplSE1EM1FSTGRqWWRnWWZYOWNoSXMzaTduUHEydVh3dStv?=
 =?utf-8?B?QmRNT2lKWmxhMDNxR0EzUVRsSFMyWTdIbTY5RkFyd2NYUzAvSmh0dGJpYnFk?=
 =?utf-8?B?ZkdnR3FrM2laR0xTL3R5UTVxNWZZU0k1cFB1eTRNeXBXcjhqTk8zT2FwNC9B?=
 =?utf-8?B?cVZZS1NKUXNKSjB5ZHVrQzdmQ0M1bkppVDBUaXhzMTNKaCtrMHNyUHBnZjUz?=
 =?utf-8?B?anlkdWNOWFlsME91SUVOVE8wYndoM2U0bWxuVGxMQmwyM0dCRy9QdEtpQkEv?=
 =?utf-8?B?am1aSnRjakxhQldFZTJzbXlENitXVkR2eXZ3UGp0RVFWcGlMR0pQR0ZSV1lL?=
 =?utf-8?B?K2hUZnd3QkdSRk1HdEU1UTFKK3o5WW1SUTRnVEk5Q2JnRVVyeklXWGxuRXFK?=
 =?utf-8?B?N3hmWFI2SCsvRm1vMHhrb04rL0VMTEZ4d2ROdGtaUnUwcEs4cVFmRk5ETUQ2?=
 =?utf-8?Q?6JdNfVvL3NVjs8s6pMvHtSGBn?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 69a30146-80d2-4efd-c2e3-08dba95fd948
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2023 13:48:53.7200
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kC//XdpPYI4Th1Rsoh+fETcRjVdP7AiK/nnePpOPn05ULCLUW2Ao0FHgp1A7mwVVKLspGEhZk7UlaDyCUDVTDg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7948

On 28.08.2023 19:56, Stewart Hildebrand wrote:
> Convert pci_find_*cap* functions and call sites to pci_sbdf_t, and remove some
> now unused local variables. Also change to more appropriate types on lines that
> are already being modified as a result of the pci_sbdf_t conversion.
> 
> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>


