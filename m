Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B7F3F47BB5A
	for <lists+xen-devel@lfdr.de>; Tue, 21 Dec 2021 08:55:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.250149.430792 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mzZzh-0003Up-4b; Tue, 21 Dec 2021 07:55:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 250149.430792; Tue, 21 Dec 2021 07:55:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mzZzh-0003T3-1P; Tue, 21 Dec 2021 07:55:33 +0000
Received: by outflank-mailman (input) for mailman id 250149;
 Tue, 21 Dec 2021 07:55:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=GYHQ=RG=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mzZzf-0003Su-H8
 for xen-devel@lists.xenproject.org; Tue, 21 Dec 2021 07:55:31 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5e292ac8-6233-11ec-9e60-abaf8a552007;
 Tue, 21 Dec 2021 08:55:30 +0100 (CET)
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01lp2052.outbound.protection.outlook.com [104.47.0.52]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-25-7Z6sZh2gPSKMXl-4YP0MFw-1; Tue, 21 Dec 2021 08:55:29 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB6303.eurprd04.prod.outlook.com (2603:10a6:803:f2::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.17; Tue, 21 Dec
 2021 07:55:26 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4801.022; Tue, 21 Dec 2021
 07:55:26 +0000
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
X-Inumbo-ID: 5e292ac8-6233-11ec-9e60-abaf8a552007
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1640073330;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IsxppLuFbpcMhrCnFc1ICeRDJ58oDWZqxda8HtzEPuQ=;
	b=Qk+MQfb7o0Jqjr0jBl+h3Roz5wOe+F8z8WxK0ObU3ff8koa5L136UysdR96ZYqlr/omqFp
	CxzCw8ZI206Ck0Z0cyklRCGpcSXs11WflonGRUzAd4eEvo7B9d0Zi8pSM4Hw4Mg3JTLMeg
	K45ky1etfSXDWg6j7EghQLgHDpYq6tA=
X-MC-Unique: 7Z6sZh2gPSKMXl-4YP0MFw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l0xcjxlM4moCP90RWRhsM5KjABJoRm5bHfoLU904WI6Lf63/YGb36csnh6FiZdWdhsfiKBCUle+tPqZ/Bqssgpnlghlz1qNvKif5jIY+k8phfIBvgGlqEmGQ0xcZMvt2zxMm3Yd1m3Qh3d3CNW7JtzkYgjHpOZ9b1TxsGN2HgATevnvkHd3rhmDysAF95LjzZ0HzyauQcniZPnulMzZPJG7e2e4FVXxU8d3054c4YDEzKEGkskWQyLR/zgt2cVrFc0hsBDLSJB/HtlMVHy6XYT07cTJBfjn4ieHt1tueL8bwru7BG4c+67k8IBYdhQLDMdDSPFtsKlrlihP1ymd+wA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IsxppLuFbpcMhrCnFc1ICeRDJ58oDWZqxda8HtzEPuQ=;
 b=e572zwejZk7hg0pRysSKz9F+LEPuBnP5I7dO1V4mzjnx2DxaS9u6gEDQ+tdtuR9bu+JHYkeN0bQfg/eaY06Oe34w97cHP1beAeAguxAKKvKKQ9YQkNFr5hRMT8iIc42vnG/gkQxE4z8Ec2A+jn/APRDwo/VxpTi6NNkDGxV0PHrrVDRTkOVWY/ppepgj/iYoQmrRCKueBpU9Ynpq40xdN8ClalzsSAGbX2aMucWP3iedUMtpVVh7jpt9Lh2m1BEvm7byAjpKYy0i9W2wU5hOulsPlUdJN+e0UC/wq5E1Fgj9Lw5nvwG8h9P4enJXPx+EuN/SS+JknEd2tHEtxn1z8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <35327375-fb82-ace7-ecb0-be9188c0d280@suse.com>
Date: Tue, 21 Dec 2021 08:55:26 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [XEN PATCH v8 12/47] build: build everything from the root dir,
 use obj=$subdir
Content-Language: en-US
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: Bob Eshleman <bobbyeshleman@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 xen-devel@lists.xenproject.org
References: <20211125134006.1076646-1-anthony.perard@citrix.com>
 <20211125134006.1076646-13-anthony.perard@citrix.com>
 <0b2eb0e2-a07f-6ba2-8f59-b7c207ed30da@suse.com> <YbseOtj7prFqViyV@perard>
 <YcBpLbxObugQ3doZ@perard>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <YcBpLbxObugQ3doZ@perard>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8P189CA0025.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:31f::26) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a95ff982-86d7-4835-1531-08d9c4574009
X-MS-TrafficTypeDiagnostic: VI1PR04MB6303:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB630303921A53A18D5779E8B0B37C9@VI1PR04MB6303.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ilG6C8vXdl0wiFl7YdPat3G2FW0S//EBaAzX4SnlL6UKUsF5ABHBtBH6scsVKmQcX4LS3KWtlx0UI0kBDcOSqDjIBu2Al+IfH4BA0PJVf/p+EYRlfcbJqGPUFRI/VuJZG23kXVh8s/5jnMuOPG0y7IyOE/EWCwe5mjMVEhz5QZ/Xqye9Spw3Vn7GbRBaMhuUPB6seFJXq0yMK7uWKQC/+j6SKcCmXqz+9d6rDbmDlA0L8523kH5g0KGKbRCbn0v3jcypGloC6Q8cQXUL6mm932skp1Q78fyZEj45CGPlK9oO9UmZF4Ej4+KU2ym6GvTps32sabQ7B6N0BHh8hmjynrVZddLIiDW8ZYpu1DxXGFyeqqqSWPsT+clkSaPT/XO/w93H5xwi+EnwKf8ZwyFiuKo0A3DJxzSZ7QDhLNc50miZzMLk4p8+pyQLhoLag09QsEbXbg30McZSSY2aaSKblwP1319qMqx0A1nXn9E7saE98S1B457jTlqpuVmflc+a33eczbg3CnTfwZFnCYusiPK/4535B84aYr4RbNbdUgErn/1BVVnfDtxfcmIAU/2i0FdDiAj9OJ+7L6nWqxJSnKO38BU6nM5gqrBiQjaBnMzNPUhz8xvqyhpF26k3uqevXM1dKyJmoZCYpCqJt6ESvJ3li4kyyCaOWWEeQUTAYFFRsUzYvOJn/Uq0RdXHrQxT3lCglgxS0Ld0WXSlBTLwpnwq3/BIGjahX4BieuHdekf1OqyrYPzf2ll50WncrNbI3a6KEjxMkJEnVXXQyMgTVQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(86362001)(31696002)(5660300002)(6916009)(38100700002)(2906002)(36756003)(31686004)(54906003)(2616005)(6486002)(66556008)(6506007)(186003)(4326008)(66946007)(8676002)(53546011)(316002)(7416002)(8936002)(26005)(6512007)(508600001)(66476007)(155303001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?K3c1WUZmWGMwUnZzR0RiTnBBNVd3eTYxMXpSTkZRNU02UEEvMC85RWVhSTVC?=
 =?utf-8?B?U0RZaFpOZHFUYWR0S05LN2ZIbVRCaW9BT2dZdWF3RkQ1engzeWJsZExnSlor?=
 =?utf-8?B?aGFTamk1UmtmRkFqSkNhRldYTTVEMGs3MFozR2lrN2JHRk5PbXFxdWVFNmp0?=
 =?utf-8?B?eVduVWZudVYvUnRBUzZxbGhOMkFPZEZSRmk4dWdKTnhRWHpkVWozY2pIcU5T?=
 =?utf-8?B?Q09ObnN1azRNZFhubC9oU1ZjN29BT3JCa2x4OGYzakphSzhGSHZDbG0zamZP?=
 =?utf-8?B?OW4rcjZ5dklsWGlHcEJtVk5GQ0NCVytPWE8zMjlmZWRhS1dmRDBpZGh3cEpi?=
 =?utf-8?B?UHdkTkVhcU1TR0pMNnQwQkkyRXVsUFdOWDROclg0SHNSc2NFM0Q2ZU1DZjlV?=
 =?utf-8?B?ZTRObXpJOVZOaWlPS3BIbEpkN3dPQ05pNGpZT29TQXA1SUxlLzVlZUMzbStM?=
 =?utf-8?B?ZE9PdnRGSHFMRGtLYmNnZVRVNjgvbGROR01sYnpsT1JScTNCNUtwSW1nZjJs?=
 =?utf-8?B?VUEwQkF5ZGQ0MmtqcStKeU02S2Mra2lQSHh6SnZnNWJMUEE2RlRLZjFWZ01G?=
 =?utf-8?B?MklrbklYR2QydHJnZ0praWowOEF3R3paNUdZMzJObWlQMEJSaHoyN0t6ZGtX?=
 =?utf-8?B?eVVSR2ZGdjdyVGdrdHhWMzBhZ1luMHZKelgwQ0VLUnoxK2pKMWk2SllJMVJJ?=
 =?utf-8?B?blhUWG43NjQ0bVZyMnFLd2dzdmM4VTdNRzBUaXJDZCtoQVZGNy9scHFCbmg2?=
 =?utf-8?B?RmF5N1Z1SnVUVk5uUmprV0QzbWMxUHJOenhTUVN1TFpjZERnNGplcXg1WHF3?=
 =?utf-8?B?dFpJRUxnT3Z4eVZtUUR1M2kyZTd5UC9pUmtjODJSMU1NR2pEOXhVQ1F5L0lS?=
 =?utf-8?B?U0lpdGdxcnhSRSt6SklKNnlQeDZVcUFBVkp3Uy95WWk3K1pTSTRHWXUyazFm?=
 =?utf-8?B?aGExWXVmZStzNmpDWHBjWHU2aEZ2QlZVcXlsYkVoYnVxamhSdnRzRXNhYk9J?=
 =?utf-8?B?eEp4cFk1SE4wN3o3U3RyQUwrQW9BajhmZ2FqMXJkYjEzNFhtTkNkREdidU5o?=
 =?utf-8?B?amRkYXFhMUZUY0w3YnU1NU43TU4wY2toU2szVnBIRmgvQVhkL3ZSNThSU1FT?=
 =?utf-8?B?U1ZGVG9lZmp4YlZyS0FwdVArbTQ3NU5wUXdUbU4raEN1WFZpR0RHUUZqOU5Q?=
 =?utf-8?B?NTF6QjdMOGs3R3JlM1h4cmNxYUUwcTdRanc0bC9NSmRnODNkMGxMcG5QU3ZJ?=
 =?utf-8?B?aE5tS3FqTStNTStwemtrV3hwcEwza3VrN2Znd2tudENNc1ppbXdoMXloZ2gv?=
 =?utf-8?B?M3ZxL3VZOGlzK2wzeEl3Z0Z6c3hLbG9mRitCc0J1OUY0alJuV2pDSHJQT3Za?=
 =?utf-8?B?S0g0RTM1QWpnMGZRTW9DSE56RUwvYWxWdnpkSmJpaWk4ZzRUdFc0QjV2cGVz?=
 =?utf-8?B?THVhKzVGa0hMcTh2VWRWZFQ0SmhVM3NnMWtzbnU2UUxUTEhKTVNBenFvYm1F?=
 =?utf-8?B?bDVVSkRsSjlFc3Zrc2JwM0JKZzN0R25lTEtmMWJrOThuaWJYRVE4M055TzBE?=
 =?utf-8?B?bnZrRi9lVXVHelNaVjlGZzllUTZDeTJrNzA2ODRxdkxiMlZLT3ZmVzBJaUJo?=
 =?utf-8?B?dXB0Z0tsZkRackdDTjhWWDIyWWFuc1ZMRS9sM0RlNmM5akYzek5kTW1iSnp6?=
 =?utf-8?B?Z1VLdkhMNHNhWkpJRG5rTTY0VmE4MTZMbVdoMmRkZWNWU2Rnd20yc2dlQmUy?=
 =?utf-8?B?TVdoYWRmM21YU0tXSVQ1UzNWL2w4cytqc0h5MUZiZmZEVy9FZFp2bzFXaEFu?=
 =?utf-8?B?WkNOaDh0OGRLdm8xL043MEtsY2JwRTBUT1dWOXZ2N2NYcElOcWZ1c3J3b3BN?=
 =?utf-8?B?Rm5MM01kQnJUK3h1a1dJNmFGMXVQdXkrVDh6K2VlWnJPQUtDbWZiTGEzSG9H?=
 =?utf-8?B?SGxMaDI2MktoL1BwR0l1dGdiNEM5OUJGWXBTSFdWSzVxOHV5OWtxaitGaDAx?=
 =?utf-8?B?TktDS0hDZktNTWcwVVhucXh2emY3S2ErdmMrTzg0U1J6RTBVTUdycW9xbEN4?=
 =?utf-8?B?SjJNMjhqM2lPRHg5aTFPR2p4dTFOQlFQYktUbnBIUmhmczdCRFBFa0tzNWV6?=
 =?utf-8?B?OWhXVkpoTS9lL28rNjdpcTVuSVV2QVJIM1puNEx3SzhFRWx4TzR5Y1FXRmg5?=
 =?utf-8?Q?AUDLtydrnznUsbXLaMdDcA0=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a95ff982-86d7-4835-1531-08d9c4574009
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Dec 2021 07:55:26.7260
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d//umgGibXyzJ8lVoMmRPAQiFrGHfJMDZybiHoCI5qbR1LAIBJNSzGO4+w6BStZwqpSwSHnrZcCpYlN82Yvoyw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6303

On 20.12.2021 12:29, Anthony PERARD wrote:
> On Thu, Dec 16, 2021 at 11:08:47AM +0000, Anthony PERARD wrote:
>> On Tue, Dec 07, 2021 at 12:10:34PM +0100, Jan Beulich wrote:
>>> On 25.11.2021 14:39, Anthony PERARD wrote:
>>>> --- a/xen/Makefile
>>>> +++ b/xen/Makefile
>>>> @@ -22,6 +22,15 @@ export CHECKPOLICY	?= checkpolicy
>>>>  export BASEDIR := $(CURDIR)
>>>>  export XEN_ROOT := $(BASEDIR)/..
>>>>  
>>>> +abs_objtree := $(CURDIR)
>>>> +abs_srctree := $(CURDIR)
>>>
>>> Nit: In line with e.g. obj-y I think these would better be abs-srctree and
>>> abs-objtree.
>>
>> I guess that would be fine, we don't need to keep the same spelling that
>> Kbuild does.
> 
> Actually, those two variables are exported, as it appear in the next two
> lines. Exporting a variable with a dash doesn't work very well as shells
> may not be able to use them. When make find a variable with a dash in
> it in the environment, it unexport them.
> 
> So, for those two variable, we need to avoid using a dash, so I think
> keeping the current name is better. (And now, I've find out that there's
> an issue in the build system, I'll prepare a patch.)

Oh, sure - if they have to be exported, the names should remain as they are.
Question of course why they need exporting when by the end of the conversion
you don't change directories anymore.

Jan


