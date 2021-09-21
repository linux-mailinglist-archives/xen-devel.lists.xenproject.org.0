Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BB24A4136D1
	for <lists+xen-devel@lfdr.de>; Tue, 21 Sep 2021 17:59:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.191797.341904 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSiAE-000644-0u; Tue, 21 Sep 2021 15:58:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 191797.341904; Tue, 21 Sep 2021 15:58:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSiAD-00062I-U0; Tue, 21 Sep 2021 15:58:33 +0000
Received: by outflank-mailman (input) for mailman id 191797;
 Tue, 21 Sep 2021 15:58:32 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=n1Hg=OL=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mSiAC-00060f-5Q
 for xen-devel@lists.xenproject.org; Tue, 21 Sep 2021 15:58:32 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c3d698e8-1af4-11ec-b900-12813bfff9fa;
 Tue, 21 Sep 2021 15:58:30 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2172.outbound.protection.outlook.com [104.47.17.172])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-4-RDxiLevxMSu8YIGmp2-low-1; Tue, 21 Sep 2021 17:58:29 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB3294.eurprd04.prod.outlook.com (2603:10a6:802:3::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.17; Tue, 21 Sep
 2021 15:58:27 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4523.018; Tue, 21 Sep 2021
 15:58:27 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM0P190CA0009.EURP190.PROD.OUTLOOK.COM (2603:10a6:208:190::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4544.13 via Frontend Transport; Tue, 21 Sep 2021 15:58:26 +0000
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
X-Inumbo-ID: c3d698e8-1af4-11ec-b900-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1632239910;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YzVDtu6c47NQj1352kpAYcG/QTW8cdOFMazIOozwIr8=;
	b=Cn56iMbrFVj9xfpzi995rHf1d2LczHnzYSEvXEegeNpBHSpFKfIhB7RctEZQFtY4xPiwqa
	SOIFCuJ6bX6SDP0D5aCYRakYLF8O76kqjC8UArWJF/nO7fHaNlJOMW1uBJAWNDsS5oY6Im
	pbJrUWVIxZzo2xAqr8mvXyDDWvv5+b0=
X-MC-Unique: RDxiLevxMSu8YIGmp2-low-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YH4huxZxQfVk5Foj7iR4zVc58bFjMfBrOv7E3HytfVqzcgnqvzYtvbXJVaCg9AJOVDHMQ9GiHcTXCk9uHbG9tpd6XnjdMfu7ioWGniT1687xb4Qcusvp/XE3o9OCIqxWVOyDn1DY1oK87/N8neD2VjWdHxMt10CBPZ8dzn7pSkeolKNsWPO4f4S3fctHewVr3VB8HNqKOnLB1Qf2SYbIuprb8ke3Qt33RB4M3T/yKo9ZJc/5Bnlnbc+57lK7MiiVAOAWUKVPxF48nYEK+lHPOdsl90oOKZhHRY7GQDU5Ss86qUGureogM4n+nLzMOKvoqxNmvSBfJoymUqoD4ywRvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=YzVDtu6c47NQj1352kpAYcG/QTW8cdOFMazIOozwIr8=;
 b=nCI3sqMZI7ozvplt6TQrZgqjjgjF2nSHCsYzRZPhZVzAr84T+K/iQ7ey7WES5yw8daNlR8Wu8R4efc+qj+odrqoSOb5f5YK0HR701RpOtkEbj+1VehHizZGrHzSVs9hdg4QQY9Z3H1il6+n+DGhpO15y80dlpL7avvja35ix5ldQjB/u/gl6K56PO5zssuPx7P0HG4wLWiVtngDWe0rmDZkfC+jNkFNAc7v9+DAw7eB+nZm+lK4TW8+V24kzXwAVmHdY7EiMo+N1xPTfKf3GS77SMgwUEuuB7t35Nb5TuhcmObkCfkxhOTcnBJOBwDICL5oW+j1wyW3kt/9E7Hwnkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH v2 10/12] x86/pv: Move x86/trace.c to x86/pv/trace.c
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20210920172529.24932-1-andrew.cooper3@citrix.com>
 <20210920172529.24932-11-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <c64b5e8f-7491-9afd-c107-0e48a26badc4@suse.com>
Date: Tue, 21 Sep 2021 17:58:25 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <20210920172529.24932-11-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM0P190CA0009.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:208:190::19) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f2319307-cc7d-4092-ed79-08d97d18a648
X-MS-TrafficTypeDiagnostic: VI1PR04MB3294:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB32946070B94CC8D51BCDF029B3A19@VI1PR04MB3294.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	34QV1tkPc2LDFUQaL6r+dXYpElbUZXiP4/YK/bNbDDbmN2JWzdfOncxwOR/jRPN6U/N6ENsJs/yJ3FgrZnN8asCC6MEnGtgVL8K1BbwiGSKH2xZq/DlWTh0U/3SDbr10hY82J3ZhFxfrwGPxqzwX8RERLw66LEbLtqQCR15Fi2lFdEeQGz+yXpTxC5uXLIKPwu16UsRcNx6K2aee9qB6r/YgHcnwnKJiskH6XnykiXVKIw8Lx1u664GKT/eSHQw31zX2vPFy9N2AgYWx6aNNEVI230amwkBbXOMX579vrnfZxC9Zd30ANCiRQ2ZMVCAvDDEzDtHaMBATvR0+Kl8X8z7BvDbSV1YI3SpRmyBIac7CjDgz5EHDl+AzNlp+OySL4N0Cvq/SGlHch/1YDySS6hHxsb0HEWvXRkK923An+ldmbrlZ05brtCAupl87zCkuPVUqpMRWoRaYD6GuLI3loRbWSNM2G1qZV76FdwBP5TTfePJ23ChnuVqvUOSeT9zTTgSTLL+WT2T7sjCyPkudmDfMKvHn0vviPLLi5uwFm1BmpU+odziDXNsW8LoL84OS0/jedAeQIURwlN47nCC4uyNQ+3ZxA1q9hlucngHhc3CmfRpK/rT+qeOTUXSMuxYFrPYQaMPOZpiQpAGuE16N2pkjL0f6v2ETS00piZfhhwIuudwR9eiAw2PddekaFscWgomoQwcnSuaPZTL5FZKCykzcN1zkEoYYVVFKDuzwsCA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(186003)(6916009)(4744005)(508600001)(2906002)(26005)(8936002)(16576012)(66476007)(5660300002)(66556008)(86362001)(53546011)(4326008)(316002)(8676002)(31696002)(66946007)(38100700002)(54906003)(36756003)(956004)(31686004)(2616005)(6486002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?K2VZQm1NeWIrVXQ2TFBldzlMbTYvbm5rVkQwaFhrNlZUeEg5Slg1WVVuTUt0?=
 =?utf-8?B?MFRXUEc2MFQ1Q1hDVWxJR2hhQjMzNjU5VFBhRE1yK3YyN3cyVzVTdlJTc053?=
 =?utf-8?B?TXlQdjI3WE9OUUlkVEdhM1NURzlGMGRpWll6RG5LN2h2Zzd4TmkyKzNmZjU1?=
 =?utf-8?B?QnpSZmZ4ZEhtb0VuejFhMUt3WHZrQTUrYk1DdnU4dGlzVFNiampQa0NJNDYw?=
 =?utf-8?B?akYrU0RSeDdLM2lJcFJlSzIzSW50WThzWkV0V1o3dEsyVFpNeEZHWWdQOUFH?=
 =?utf-8?B?S3VZQnpnMXdWeFIwSEZlUHNieVRUZ3VLZ3JubXRFNzhjRXRndXNKVDd4WHNT?=
 =?utf-8?B?cjRhTG4xUVhQMlpsR2NmY2w0UlNkR1dzcXlKTWErcjNZVGxETUt0OGlOQitJ?=
 =?utf-8?B?UERXUGNVS0xVSUd6VUNyYXlvclpVbm5wN1pkV3NWdjdLYnV6QmhnZTdSeG42?=
 =?utf-8?B?bW1lNWQxdm50ZFhaTEZMREVVYWxmTDJIcG0vdHV4RWxsUjA2N3cyZnRXb1c0?=
 =?utf-8?B?TENsdU80NlJnYjN6bFYyMXcrcEFpS0ltTXRvaTFHZ0E0YUlTOFBPUXdsOXhZ?=
 =?utf-8?B?MGh0aStEQlpkSHJFNXpGOE14d05PMnZQeVJnUTVFRTNDeUZZQVh1N0Y0T1VQ?=
 =?utf-8?B?bHRyaFhxZGFQaGZBMk93QTNXbkgvdzNXdkVrdGZ0ZG5xaUo3NC9WSGpBdW5t?=
 =?utf-8?B?VisrV2Y1c3pNcUFTQkhxdzZsUXpoRUxucUkwblZwa1JmcEszSC9jeEVKdnp2?=
 =?utf-8?B?VmRGZi9sOGNMYUR2OEdKRXVzYmQ4VXE2eEJFRUd5SlcraGJFSXRUZWRNeDNt?=
 =?utf-8?B?V0xBUXRGNnZxWHptczNjM3Q0WkszOUQ3WDgrc25UY0hkZGdzVitXMHA3czA2?=
 =?utf-8?B?Skd6TkVvYTM3NS8rcERtbDhoeEJ0K2lub0x5NkZWNnlIUWxOTkJlNjY2ekdt?=
 =?utf-8?B?L3N4ZG9id0NIU3E0eVUrSS9TRW44dSswakg4VG56MitNU2NOL1NIRFFsbm9Y?=
 =?utf-8?B?NHRUWkhQYXQvK2IzVE83ZElnTVRKb2tCWkRaZ2VPSENic3E2VjZINzFQNnM0?=
 =?utf-8?B?dVJoQmZoamdUc0taR3IxMm8ycU9HRzBSSVBIdzJzRzFMMXdJWUVMUmVRN0pS?=
 =?utf-8?B?YXhZeW1QVW00aXFuZkI5SE85bENIVm9uRGRTV09ET3JqelZHb1hZaENaTzhp?=
 =?utf-8?B?K2h0SUFPUlhkMkpTSDRML0t0SjhFVlBKamZHcE1UYjQ4c0N2R2JOVFdqSlg5?=
 =?utf-8?B?cDUyVjRBOEN5MmhDLzdVNUpWMHJvakMvUkN5VmdSUnk1L2paYkNDcjFJV0Ns?=
 =?utf-8?B?dWhIOGxta0dqQ2VDbVR5aFhpU3E5a3ZONjlLd3hpOFNFeXM0UFpYdk1rdy94?=
 =?utf-8?B?QnlndDF4SkNGd215SXlaTkg5NEdIdTNmakhvc3QrdTU4T0FwL1FjbTA2dDZp?=
 =?utf-8?B?WElRVklxak5nNzlvL1d1akE2MlFsc3loby9GN2NDcW1JQUMvZjFKT0ZzcXlT?=
 =?utf-8?B?NkRoL1FTOU51ZnoxWUkwbDREVnk4UU5qbm1qVWU1TDdKbUNKSlFRb05xaFI5?=
 =?utf-8?B?T25scGt1WE9leWZyS2FET0cwdGoyeVB3RW5sZUl5RzFyckF1WmJ4WnZBVVAx?=
 =?utf-8?B?S1ZzRE5RYktnZDRHaVMvT1Z4ZktndjFML1VBOXIzTXJ4dlhWT2FlOVYvTnNz?=
 =?utf-8?B?MnpoNTdGYzF5WmZFc2xVM0VMQ2dVeHRVQzJmSjU2QlE0Sm9RcHFWWTgzbWp2?=
 =?utf-8?Q?wdzbVgtkFROS/IKhOCJqYRWFmZoohzdS+clrohz?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f2319307-cc7d-4092-ed79-08d97d18a648
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2021 15:58:27.3039
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r3k6vKysNA2HGyK8yUN0PLDLMz/m+K5OysqWDAPjsNGwrdLh2j9KMz5uVdTkL693vHJg+xyUS7DFhYXa5fUUiA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB3294

On 20.09.2021 19:25, Andrew Cooper wrote:
> This entire file is pv-only, and not excluded from the build by
> CONFIG_TRACEBUFFER.  Move it into the pv/ directory, build it conditionally,
> and drop unused includes.
> 
> Also move the contents of asm/trace.h to asm/pv/trace.h to avoid the functions
> being declared across the entire hypervisor.
> 
> One caller in fixup_page_fault() is effectively PV only, but is not subject to
> dead code elimination.  Add an additional IS_ENABLED(CONFIG_PV) to keep the
> build happy.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>


