Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A46FA4906C6
	for <lists+xen-devel@lfdr.de>; Mon, 17 Jan 2022 12:07:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.258108.444122 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n9PrX-0005Ag-A4; Mon, 17 Jan 2022 11:07:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 258108.444122; Mon, 17 Jan 2022 11:07:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n9PrX-00056w-59; Mon, 17 Jan 2022 11:07:47 +0000
Received: by outflank-mailman (input) for mailman id 258108;
 Mon, 17 Jan 2022 11:07:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ZUQe=SB=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1n9PrV-00056q-4R
 for xen-devel@lists.xenproject.org; Mon, 17 Jan 2022 11:07:45 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b1bf8623-7785-11ec-9bbc-9dff3e4ee8c5;
 Mon, 17 Jan 2022 12:07:44 +0100 (CET)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2057.outbound.protection.outlook.com [104.47.14.57]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-40-MKB9EXg_P7u75f-inkB47A-1; Mon, 17 Jan 2022 12:07:41 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5774.eurprd04.prod.outlook.com (2603:10a6:803:eb::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.12; Mon, 17 Jan
 2022 11:07:40 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4888.013; Mon, 17 Jan 2022
 11:07:40 +0000
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
X-Inumbo-ID: b1bf8623-7785-11ec-9bbc-9dff3e4ee8c5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1642417663;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ihUnC56vuaM9FzmZhn8NfOhIp3Vv8NxTu0GYUJs7XcQ=;
	b=nTLUZrq20EByc1VblVWTj1X1c6+J1zK3Bo0orjnSKa93OIicwufTcowzaSVCqx2/PwP/cw
	BZEfVVY121ersiN2zVLRBC6POvdn61UPZW2E+AKhpkKRvYtfCvpLA1+qwdLHh5+a8GF8rb
	ZZfv+gBX4+p4lHNTDjILhUVhjgcOoeI=
X-MC-Unique: MKB9EXg_P7u75f-inkB47A-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gr5l2VQ5mQFG8gDGM4swD3CTOuzLgngXSqn0JjOk+spteIl7LnOOd4xyFZReIeWd76hmJ1HsiiNTM/MsFwpCYkQEyUAdg/GkZs1Vt4gQlWMTYJUPT5p9SKQ/SH+V+gapk3LNPE7iVW3ZDfZtiVktT7tXvDcorhw37OXFPTkyuovEv7JM3domKngWwz01RJW3pX+22pHJ/Xo/Jun9yy26OjYgcDwwyBcyZn3eP3jV3ymhZKBbpXuDtskRWj9v410Hyvqm2L3mY/MK0hotcPfz5iOwGSfa6+7Tl+JzTEgkH4vhuNZVyJHyXrvmbThfya5gFR2xyvBIm24K3EobeG0oyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ihUnC56vuaM9FzmZhn8NfOhIp3Vv8NxTu0GYUJs7XcQ=;
 b=LiVP5jqXB+bqsd8GD7Ug29yoxRsVMlOE/kymnpzj6PaEQcQmqUVZDed16oV4sUypIZUTupv0Lq1j0OeTjWf8fzfj9HjQIkoYqjfPVqzdjh4xwKB7WL0+VZbl2pqojNGj7XAkxHfMHgCdic7uYgm1TvLdMA0SwmQ91MmFZXWoNVxkuqY/12g210oTh9J7D8BBu1D4s8cs+bdi5bx3/ZRVG3KvDVDgQVefm7bB+26IkjC9nn4maaLBsr5QZjChK614DGlqKfEKWv054UYJLtoFtXpsybHeO4cQlBZM0ICIrx3kisje6EjKvTXTC7BtRvEtADEh5ubt0SAkZcob6gg1dg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <c060f55e-7b18-b559-f703-b3aace50f438@suse.com>
Date: Mon, 17 Jan 2022 12:07:38 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 1/3] x86/msr: Split MSR_SPEC_CTRL handling
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20220113163833.3831-1-andrew.cooper3@citrix.com>
 <20220113163833.3831-2-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220113163833.3831-2-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P194CA0093.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:209:8f::34) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b862f197-0805-4dd5-27d3-08d9d9a993f1
X-MS-TrafficTypeDiagnostic: VI1PR04MB5774:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB57741AEB64565A0F68C866F7B3579@VI1PR04MB5774.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	THKQ/jbeRm8SPHvq3Lyy0oZSjRzf0E2I7VqAeo8OfUE0MXqz2BpuiYq+xf9vds0ZTv0oExCw+wdnOT4KVVtHiqVswks0nfGSQB/d29CpUnS6bzS2Xofp8SSG44GWjxDRArIdqtj0GSk5sUGY2cGjsPC0adFj/I+kGedDC1G7FyIOkrJ6FJVJPlz6Iqp+qnBTsR/hlC6PzItwAgmr6xpjU+cBJVb1CtOHdxltwsn2Z1Hi4QnkP8HMRXZGjsW8ymjkxZSV4ezLF2vmsGbkUI4rB24tJX/APCqSXIbVV5u1h7QKkgsP9HlSs7vB18aeIjwND8nQyNIlKdCblDESdgzlElVP2d1gcQO9WX7CLyue0LXTzO7+QUMcs6vbaddraMyx3612On+APepJNrcM21GfnPq50Mv9GpEpscfI5ODvg/Xe3xDnkcBZG/NGYo+efNrhjHRSptOVcJhA5WAQd214BG1Lb20JoYYdH8OVsd0l0KyFnGGxf3kYDAVWvDrWohepcoglf0QjZt/aVXsPM3ZxqKRbS/2b6WPLD3lcS4hweGK8U4VqJukmJ/1JwaWTjyD/FQJf+/RUIX+2ZAObQbcsA6XthJxuvOtm/25DnWIFvVgCx3iHP4HzW0HtESr6GTx4/8y/KPsu48ettOjuZ8nW5yHabRMmaGGs6p+SLlEyj0hcHKw5LIm0279a5tfnSe0QoP9+ZMnoNrwibVlpr3fqPXffy5Xg4UD0KyajXjSBv/4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(6506007)(2616005)(36756003)(83380400001)(31696002)(8676002)(2906002)(6916009)(66556008)(186003)(6486002)(316002)(38100700002)(4326008)(8936002)(54906003)(5660300002)(26005)(66946007)(508600001)(31686004)(86362001)(66476007)(6512007)(53546011)(4744005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RDVxR2cra0lUVHlFeXVMQ1JRQWIrRG50RnM5UDJtdUV1eUdhcFFNNHRXQXgz?=
 =?utf-8?B?MTdEcXI0M1pPbldGbGF2ZklyTGFyeVozTUYwTC9Mdkh1UkNVcFJpSFFTNldl?=
 =?utf-8?B?bVU4bEk2cHo3cnVZeGNHak9lc1EyaFZxcldpcEpvdjFHdG5peW5HeXd0ZGFC?=
 =?utf-8?B?clpIU1ArNkdTQnVrQnZQV3RQdzhKd2JXSzVyN2xYak8wL2lVUHVJVytZTURR?=
 =?utf-8?B?alh1QXZZcG91aWxkTFVMTXc2U3dOSG9pQXhVdG85MGx1a1VTQVJTNklFVEE5?=
 =?utf-8?B?ZkUxV0Q1T3VTQ01QYU9vZ2YzMk5LUVJwMm5jdDQ0NWVJVk1RbzcxZnNoVjgr?=
 =?utf-8?B?YzdpTWxqQysvNXM2dVNrWGJCelVBVWJONVZ1TklLclpSTEVpTTJtb3BhOXNa?=
 =?utf-8?B?WTFOSHdLVlBkS3d3alMrYVNzekFVbVdqK1RvWk5OY3RKOFBNSjhjWVZSZ1li?=
 =?utf-8?B?OGZHVEZGTUZ3TlVmckcvSGdFREwzdUVvS0NqdHZ4QWpGL0hCRGp6NkNIZEdZ?=
 =?utf-8?B?UzR0SEhKdDMrL3hDRXhkUjY3ejFZSnEwVTJJTVBIRnVjbWpsTS9nR2dFb282?=
 =?utf-8?B?N0o5bExDc0pLRHh4VjE5aUhjSFFMTi9EQjBOT3NtRXhHS0NLbS90TUJLL0dQ?=
 =?utf-8?B?RWlqOVJ5YjdNYWpvTDJUc3dnbzB5U08vZithWjJEVHkwdEZsNi9ZcDBDY1Ft?=
 =?utf-8?B?NFZqMDJkK0MyMHJ4LzlCamRXbkFFaGJNVjU1Q3N6dEN6UkIrQmVxL1gvcWR0?=
 =?utf-8?B?ZzhyQXJKR2dQampQUEErWVZvWmxuaGp2SDlxUHhuMzk0NmRKUWZ2ekxXcmJS?=
 =?utf-8?B?NkdZQncwaTQ5YkxZQUE0R0ZkN0QxZFhCUGIwRE9zOFVFcjI0blZmZjFjRy9o?=
 =?utf-8?B?dG01NllnOGY3VHJHV3hRWStqeDBWTVBIc284anB6d3E2NkpJSHJ4cVlEcTZa?=
 =?utf-8?B?UjBENFoySnJjTS9tUDcvTE1kKzlPSkZCZDh0VDhJOG1SVU1XQ3Q0M3p4UVpI?=
 =?utf-8?B?dGFUdzZIYlB6cmxlMkpXOVI5U21mUzFRNStZbG5qQmVhdjZpaTZteHhmR3JG?=
 =?utf-8?B?a05vL0dFbG1QSzFORDZYbWR6TUd0YnNlZ1NTb1FIYUtlOVJOU3ZhVzl6dFY5?=
 =?utf-8?B?bUtEeGcwMFRBU1hkeS9nOWVwVjE0NEVJNm1jdndHaW5NcVZBb0lVL3B5cEtS?=
 =?utf-8?B?UEZ2RlpXems0V0VsVnJTb1pGNEhkc2RIZEQ1SUdJdFd5M0FTTmU0SjhLSXpZ?=
 =?utf-8?B?RkZ0RFFXUERFRUVkbjhiZnJIcDdPTlYzcEJtcUhCYi9TaERYOE9hUk1rS0Nn?=
 =?utf-8?B?Wm53RmwyU3BoN29PTkxTcVF3TFN4MVpHVUJNaGVVVkN1ZGNZWjdqcGQwUGFI?=
 =?utf-8?B?czJSR3N1NG9VVGpycjJrQjFxa2JCbmF4MHRXVElTd0tWb2hFYmVUOFdBK1hl?=
 =?utf-8?B?Um0vMlpHcXRreXFmbkdkUGw5VFJ3RmJuZXVmU2J0V1RGOFM1VGJUTnVCTXFh?=
 =?utf-8?B?aVJBNmhVSi9RMzRnYzlJQ3FYK2Q2TURJMkx5WEs3TEpObC9TdEs0TVFQVzJX?=
 =?utf-8?B?OFJyTGFoOVM3N2hIbzZFazdQcGVmR3BvOGpVRHNpMGZsME1XbnpFM3pKamZr?=
 =?utf-8?B?aW96RW44aXpONHpVdGs1L3E0TWpxdHl0QWhEQVNEaDJ5aGlhQ3dUZWpES2xQ?=
 =?utf-8?B?U1FGbm82SkRhQWNSMmI3cWhSSW0vR1ZsTDJJakpYWkhTdTduM2NHR0ZxMjN4?=
 =?utf-8?B?U1VMRWhOWkFZYk9wT3VNWm0rRk1KWDllQ2dEL1RLaDZ1T3F5TitoS3Mwci9x?=
 =?utf-8?B?YVdmbWZyS1VUVUNCV1NBNDEyQjh3dllVK1hMbkVZSDRBU0dQWUtncjdiWWJs?=
 =?utf-8?B?S0ZGdnNYMUtZRTN5NDNkQmd5Z2QvN3Y4Zkp4WkRQbTlxTXJjK3MwSW1IZXVH?=
 =?utf-8?B?RzhsK3R1c3lFSXJ0elZnQlFzdDFTdGY4djBhSE94MFZkKzhtb0lMZi9RYnIy?=
 =?utf-8?B?dEpQQjlFUEtrcEtJUFA2YXhzZXpBeUJrQzMwV0hjVVlXdW9Bb2xVZVJYbnd3?=
 =?utf-8?B?WThWclo0MXVrSXp4V2xtaGh3cSt1YncvOEpFTFJqK00vOTQ1OU51SVNlbDlD?=
 =?utf-8?B?SFBibDJkdDlRZk5NeFBid1JMR09yS3JnRTMwM29LK3Z6ek1oY3Nsb3J5YUJC?=
 =?utf-8?Q?9Q+IBKF4NFmmtHJKycEJv/A=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b862f197-0805-4dd5-27d3-08d9d9a993f1
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jan 2022 11:07:40.5600
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w/qX9FuX85hVr1S+gDOPjkgYDQKURr2J1TuHkruyMSJNI2VteG1nRXUkLJqeTF9AReGf0igkB32R59A7dngd5A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5774

On 13.01.2022 17:38, Andrew Cooper wrote:
> In order to fix a VT-x bug, and support MSR_SPEC_CTRL on AMD, there will need
> to be three different access methods for where the guest's value lives.
> However, it would be better not to duplicate the #GP checking logic.
> 
> guest_{rd,wr}msr() are always called first in the PV and HVM MSR paths, so we
> can repurpose X86EMUL_UNHANDLEABLE slightly for this.  This is going to be a
> common pattern for other MSRs too in the future.

I consider this repurposing risky. Did you consider using e.g.
X86EMUL_DONE or X86EMUL_RETRY instead? Neither of the two is
presently used by the MSR machinery afaics.

What's worse, aren't you making it possible to hit the
ASSERT_UNREACHABLE() in hvm_save_cpu_msrs() as well as in
XEN_DOMCTL_get_vcpu_msrs handling? And have hvm_load_cpu_msrs()
produce -ENXIO and XEN_DOMCTL_set_vcpu_msrs return -EINVAL?

Jan


