Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C0D84D1254
	for <lists+xen-devel@lfdr.de>; Tue,  8 Mar 2022 09:34:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.286620.486206 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRVIN-0004Ak-Sv; Tue, 08 Mar 2022 08:34:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 286620.486206; Tue, 08 Mar 2022 08:34:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRVIN-00048X-PT; Tue, 08 Mar 2022 08:34:15 +0000
Received: by outflank-mailman (input) for mailman id 286620;
 Tue, 08 Mar 2022 08:34:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=KW+D=TT=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nRVIM-00048P-Lc
 for xen-devel@lists.xenproject.org; Tue, 08 Mar 2022 08:34:14 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 87812786-9eba-11ec-8539-5f4723681683;
 Tue, 08 Mar 2022 09:34:11 +0100 (CET)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2050.outbound.protection.outlook.com [104.47.13.50]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-16-1zanYYQrPsWsmPF9LybEwQ-1; Tue, 08 Mar 2022 09:34:11 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by AM6PR04MB4295.eurprd04.prod.outlook.com (2603:10a6:209:4f::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14; Tue, 8 Mar
 2022 08:34:09 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%6]) with mapi id 15.20.5038.027; Tue, 8 Mar 2022
 08:34:09 +0000
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
X-Inumbo-ID: 87812786-9eba-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1646728452;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UFQud19bU5SI+K0oYr86ExH4b1i7NXdnwoCxsRWm00w=;
	b=AokvIVn5vA2u1X3jRAKF50GO4vntZbVYGib44CEajM6We/ssQLbogneCf+j8IAtt0EWBtE
	s60KArxHHTRcekh4cYrqZcdd2pQRiAHrCGXHZ9PkwM9/+9MJyQ/GQpOd506otSyb+ZLw/P
	YEDDC6vCbrqM3Pb8aXIswr5R7xkAnpo=
X-MC-Unique: 1zanYYQrPsWsmPF9LybEwQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nax93LHza/Ni4W+PR5+uFsaVQ7BDiECIq5tZ9313hhY41uqf7L1DT54vhACx0wFzCnUnPRJEWDSuu2UfLBixHEwVOFXdoUL/QQjXh+wQwO2SeCsq9c5j+2Mwd7Md0XuYRJ6KXDH1dusP4z0okXYeIxo2DvQihV/gxhpr+Eakk7VTyTU8o9APtmyOsRQQZ6YAjU+9Y17BJqHjRM+wgKOp+WHtnH2Y0F7aLbHQgslTLXxFgcHZeepF9n1qtoUkUqoRLDegKTubt0sAq0eRuHL4v+xvpkigB7a52Cla83OiqLuYHkvMGUiI9l0dMISHubmqJ1ajpXjcZXx567FqwIMpUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UFQud19bU5SI+K0oYr86ExH4b1i7NXdnwoCxsRWm00w=;
 b=lS1Hz6qigDr9VU6IxVHurVNEL3Nfz2y6FoHwfvDiXEztjk82Nk5+MeKg4Ej6RR0ntSa6ILXlqbtKePEDGU5MdImUtT+ASS5WRBUuH4s3jPz8oThXVMHgOR2lDzxE5oYFABk6SymVggWi+9JAMFeqOmLewshJnk5i/v7pqfw50XgDQGm9RHSrrlDQZxAAbn8hzVM1rDyVUufibr+ySriaFf/S9Ds+9/Nv8bkXNCRe4YBOWw/5JBgZoC6tEaSRLMzapdV+8dQEuTdal4TGGT9WgxmxrS/JovG1sYTIV25YyHthfQZFrRFp2Q5D4tJPJMSXXRNLS2dl9VN+l4C+32h7Pg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <0ec9f176-1108-e1ac-a250-5ab9d151f7a8@suse.com>
Date: Tue, 8 Mar 2022 09:34:07 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH v3 00/13] xen: drop hypercall function tables
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Christopher Clark <christopher.w.clark@gmail.com>,
 xen-devel@lists.xenproject.org
References: <20211208155606.20029-1-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20211208155606.20029-1-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P194CA0068.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:209:84::45) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d3849b59-45d1-41f2-73fe-08da00de6a88
X-MS-TrafficTypeDiagnostic: AM6PR04MB4295:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-Microsoft-Antispam-PRVS:
	<AM6PR04MB4295D611D85BBD4D752F9621B3099@AM6PR04MB4295.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	2A2Lnncu6ioykOu7n9SR9owcNwIxGTUa/EYBGCpaB2tCapyb+++TSh0bCjU4JKJf+gBzFrOIB0cHfhWsVCKxH3t0QBfRyNHO5S1zpkkfcbBEwsgCip90oi2nst0fZJHJchLw1Zo38I4gXsSdcfCgawm6ib+vgmklKic9YjiscGX+jnf3GWOvaU2CvvMb80zcDZXBr/E7h0f8DPRPevwVeOwiuLBg248ww2bGxUWoXSS3DgapVkY67s+osuOIQLCYz/sWszO2wjf7Giz2VayY+EB4vLgcNssgeJd5w81Nwlr4XwE+++pFWzSZaCDDjER9SLURvQHTzXow7Ras5tWr3TtfjbAN43+fm4bMuiOo2eEXYnAohvig/PdDfkTQgiBHhUTbprFZdtNYesy5lrcnjv5awpXuDjz90hhNkgVbR6BkBOeriFgEprguSPKGCgvCH49xbhbKj3NSwyhSKWq/SMnOTNPYfYEbhKNM/q61R+KH1B5pL01O1vxZG3NFrmhA0I/0/ZDUPqx2LGkVUP1GkHYzJ359OekfdlMrH1mfWUWqqzIUBh5IHrKvoqbBKeEucLsVdj8ZOCyWEmmN9E33RU3+XJYb8rvFC6ju5AG90TN9rY9FFQTydtcW1vaY8Trt2SPleW6tZTKjqsu6oTzxoABOqG1YgiEyCNW1gJrzze73XOpC3DOYDp59cdENrHEN9ncA85MJDUZkZhbvH3GWtckr/9wvmQXZ4JGRawcTjqk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(6512007)(5660300002)(31686004)(66476007)(6506007)(31696002)(6486002)(37006003)(54906003)(6636002)(53546011)(36756003)(86362001)(316002)(26005)(2906002)(186003)(66556008)(4326008)(508600001)(83380400001)(6862004)(8936002)(66946007)(2616005)(7416002)(38100700002)(8676002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WkF1T05qZm1CdG1MNnZaKzV0cHBLRnBWUWVGd0lNN3NpS3RCZm5OV2VjRTZl?=
 =?utf-8?B?eWRNNEV6c1I5UWc2TE9PMFpBWlBMeHFzOVJJZ2NIaEZTdEdSb2E4a2NlMFdw?=
 =?utf-8?B?T05UdldBREthdkthRjQ1bnJVZXVNd3dLTG1FYVJjMFNOdUVTUFF2K0JxUnVa?=
 =?utf-8?B?dlZNUVdpMGxmOE40cTd0M0V0UFVKSHBoUFlGMjV2a05FZWFTTUNHMzRDdkxB?=
 =?utf-8?B?VmFBSEF2c0F0eStwUTczVVZycy91b3JuRkNkUVdFMTlMcU9Qc3BxYm8yTWY3?=
 =?utf-8?B?OUd4dituSjRvdFRtcEJvRWU3TEJwWk5NWmVYSjZrWVAzdDl1QlZ1R01idWVq?=
 =?utf-8?B?STFKdzJIdlVMZUhXV1BzRGVBUWVjMGxSS0pEeWhoTXhzNXJqRzd0V0g0ODdz?=
 =?utf-8?B?K1pvRG5iNDhHSDQ1RnVwMDQ4U0svcGh2Ri9ybHJDZy9IaUh0WStPQXJpUCt2?=
 =?utf-8?B?aXU1Witua1BPeThjUHVZTTRwQWU3UElobXBMY3NEYkdHMGFvNDVhNC9mSzZo?=
 =?utf-8?B?MC8rNUNBZ1Z5cWc1MmtUSFNwS3pQRzAwbjdoYmc5R0h2YzZwTTVRaW16Mktx?=
 =?utf-8?B?c0NGMVlnSDFKM0hvWVpIcUN3bnMwOWpNSElDNXdOSUR5Y1NXd3ZON1g2Qkxx?=
 =?utf-8?B?WGd6enRaZlpnMnkzL0M3SDlrWmpCS1BJQlUrY1pITXpSUklxYmZtNmxkdmdB?=
 =?utf-8?B?Y09NZ2ZnRlg2dG93M1ZoQ3EyamNUUEZ5MFJQdnVZT293YVhqQTJEU1RuSm5w?=
 =?utf-8?B?cStDSnpkbG1JMExVWW9QMmFlcUFKVHFYZkVEaFRIMWZqYldTWm5DNDBGc1Vr?=
 =?utf-8?B?WVNsNWxCUXVWdFVwa0hUT0tvR0ZSV1FPZHBhdlU2ODc2enRLMFVXellpOFZv?=
 =?utf-8?B?WVdrVnRvdTlQVHJORlRJakx5ZXovV2lYMW81YWxBWGVJUEprUnJLL2JhQ1Qy?=
 =?utf-8?B?OEgzRHg2ZTliQnRCMWtORWd5YlZEYVpBa2ZSblh1Z1EyeEkyZFVHVUZsbG9v?=
 =?utf-8?B?OGNwMXdPVk5VaGRUbjRrT21WR25XQUlnNzBOVDNQMnhKT0I3U0lsdWpyTkJZ?=
 =?utf-8?B?Lyt3RjE0SzlpOThJTkJ4U0FGVkxudU9WbkNreWZWN2l3OGhqQnozTHdQTFN5?=
 =?utf-8?B?b0VFN0RXVzRiaU4vQXVqUE9BS0ljVHBkaTNzeDBWVVV5RlN5UGFBUjQyakw2?=
 =?utf-8?B?Y3JrYWNHSnByckw2WjBpWkg4bnpXVi9TbWh0QVdTeW9zSGVsTm5wcElDR1VV?=
 =?utf-8?B?UXgzbmlUS1NXRUpIT21XYkdnSlNadzNXUUFMSkx5Zk1QSHNXQnpIV09SY2da?=
 =?utf-8?B?WDQ4REF4eE5wSUttdW5rSzY3TmFYSFlST0FLeTQ2cndVamV0UnBFd3NuRUlY?=
 =?utf-8?B?ZXU1c3QwL2E0RllYMUUyVHIvSnJjLzh4bzNnSG1XT0Z0Z0tuQ2JTTDRRMGVp?=
 =?utf-8?B?ZUVNNERSMTlOS2dLN3Rzd1pnVmh2enJqb0pYdDd2N0JWS1l3bzhiL21LaWVz?=
 =?utf-8?B?UDhNU2VxdHhQMlNQM25pVFg3Z0JpZVVhdjhnV2ZtZ3NCM2dWY09JR3FnNm4w?=
 =?utf-8?B?aGMwQmtYcHZBNzlvTkdtWnBNYThBdk83TkNFRVdGaE5EcTRFMnFqM0dEbmd1?=
 =?utf-8?B?akh6cU5QRWQ4cXN2Q3hvVTByeStjcnkvZGsya21zYmp6dHo4L1U0OVRTS1Jw?=
 =?utf-8?B?eXJZdDA5MkxjQnR5L3c0T1ZWeitlV2Rpc2Z2dWFoRlR6TUp4OHRDVWRlK0xW?=
 =?utf-8?B?d29vbWF4OFlzNlRQMGExUE51M2hhUGlqai9QeWNMTnMzVXJGMHZYVnZlRmZa?=
 =?utf-8?B?VTNiejNxc2FLNG9wVGFIREFveHpveFhOMjBsZklhL3VnZ0thR1NzL2FmZHZp?=
 =?utf-8?B?dXhwcjRmazFET0hmVHUyb1BNL3Q2Rkx4TTVBS2l2TnhyTmltMDdLNjdsTlJD?=
 =?utf-8?B?M09QOTgrOHVzaVI4NTYyN0xZNml0bWdnTnQrNy9yL1V6RGtFbUxvV0FZOXVh?=
 =?utf-8?B?MlZpdmM5KzZib0xzemwzOG1UbGx0ZDV1MVF3N1A0bXVJZ3haUkxLRjc5blp3?=
 =?utf-8?B?WVkxeHJQRXNZaTNXazZDaVdNTnRGK3NLV1huclc5N2xVb2xEb3p6RHBJUi9E?=
 =?utf-8?B?MFprTHpJSFo1ZGIvci9GRlEyTGtkZ3FiVmxiTWtpYzAxTzlqQm02Q1JuZlpR?=
 =?utf-8?Q?uQWnzuSDozq/nsrZYc12/eQ=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d3849b59-45d1-41f2-73fe-08da00de6a88
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2022 08:34:09.8757
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BQFPFDB4KpM5fau/0mlyk3fIa4grMTXyzfkhOMdRcy2+N5rkbnSVuhYM4461fw5JMsLG7C0SqtZxFt+t/J/l/w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB4295

On 08.12.2021 16:55, Juergen Gross wrote:
> In order to avoid indirect function calls on the hypercall path as
> much as possible this series is removing the hypercall function tables
> and is replacing the hypercall handler calls via the function array
> by automatically generated call macros.
> 
> Another by-product of generating the call macros is the automatic
> generating of the hypercall handler prototypes from the same data base
> which is used to generate the macros.
> 
> This has the additional advantage of using type safe calls of the
> handlers and to ensure related handler (e.g. PV and HVM ones) share
> the same prototypes.
> 
> A very brief performance test (parallel build of the Xen hypervisor
> in a 6 vcpu guest) showed a very slim improvement (less than 1%) of
> the performance with the patches applied. The test was performed using
> a PV and a PVH guest.
> 
> Changes in V2:
> - new patches 6, 14, 15
> - patch 7: support hypercall priorities for faster code
> - comments addressed
> 
> Changes in V3:
> - patches 1 and 4 removed as already applied
> - comments addressed
> 
> Juergen Gross (13):
>   xen: move do_vcpu_op() to arch specific code
>   xen: harmonize return types of hypercall handlers
>   xen: don't include asm/hypercall.h from C sources
>   xen: include compat/platform.h from hypercall.h
>   xen: generate hypercall interface related code
>   xen: use generated prototypes for hypercall handlers
>   x86/pv-shim: don't modify hypercall table
>   xen/x86: don't use hypercall table for calling compat hypercalls
>   xen/x86: call hypercall handlers via generated macro
>   xen/arm: call hypercall handlers via generated macro
>   xen/x86: add hypercall performance counters for hvm, correct pv
>   xen: drop calls_to_multicall performance counter
>   tools/xenperf: update hypercall names

As it's pretty certain now that parts of this which didn't go in yet will
need re-basing, I'm going to drop this from my waiting-to-be-acked folder,
expecting a v4 instead.

Jan


