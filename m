Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DF1FF369498
	for <lists+xen-devel@lfdr.de>; Fri, 23 Apr 2021 16:26:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.116426.222221 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZwko-0004GL-7r; Fri, 23 Apr 2021 14:25:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 116426.222221; Fri, 23 Apr 2021 14:25:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZwko-0004Fy-4J; Fri, 23 Apr 2021 14:25:58 +0000
Received: by outflank-mailman (input) for mailman id 116426;
 Fri, 23 Apr 2021 14:25:56 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zio3=JU=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lZwkm-0004Ft-DL
 for xen-devel@lists.xenproject.org; Fri, 23 Apr 2021 14:25:56 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8adaef47-ca2c-413e-ab1c-ee774cbf4f6b;
 Fri, 23 Apr 2021 14:25:55 +0000 (UTC)
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
X-Inumbo-ID: 8adaef47-ca2c-413e-ab1c-ee774cbf4f6b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1619187954;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=h/K4lDpPSC6jswkyW7Wz4oRXbtYBnW8AoV4vxuKL3mM=;
  b=XSJ9EmqaPme3MDJ4POdIfaUP9RdFxdQXYwzNLHxgdNF8yHC8aIyqMEZu
   QW1DIFSYALoiAZ8HQ5bUq05yDMaux4IYE4ASJK+oF/CeAugJyDTbbxpVi
   bMSTcqC3hmKF0B7uTs6JWd4F6nUI92IMgQacmr8dtXH4HXFVlvcy9HkkV
   U=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: quruP4DxeK9B4T2dDPACinPZ7FdXOLxqfXOJAksCyyaaXXFg5h4l/lpSdD0xtylNL6mX2jJQBv
 1xUXBbau/0yKjvGJ0XJo6xAtvnWArXDiylHCLxOhtSqmpcEtUMfI7HVAuBqJaqHvaex6c+BPa+
 ifvl+oHUG+bP4oB16Kw3Z6QM2W/q6/IJlf1nOk4z28zns1KEZZjcKe7/yFdD8xZd/5q5LKEb0d
 /fccfr6heVAFL1r2tDdcRTPaS24/aclAe9NzZsHLgzkLYSNdr1YzMFPKBYlloqkOrnPuFFuuj1
 8YM=
X-SBRS: 5.2
X-MesageID: 42662609
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:EFoxNaFUQgzQ5FNwpLqEE8eALOonbusQ8zAX/mp2TgFYddHdqt
 C2kJ0gpHzJoRsyeFVlo9CPP6GcXWjRnKQf3aA9NaqvNTOGhEKGN4dnhLGM/xTFOwnTstFQzr
 1hda8WMrHNJHx3l9zz7gX9M/tI+qjkzImSie3Tz2hgQGhRAskLgjtRMBqREUF9WWB9ZaYRKZ
 z03KR6jgvlX28WYMS9DnwsRPPCuNXPqZLjbXc9dnsa1DU=
X-IronPort-AV: E=Sophos;i="5.82,245,1613451600"; 
   d="scan'208";a="42662609"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J0gLkn5PgUbgl0590iIPHLu2lzoz6P+5bC+ux0l1+tnmn+q+MaEIVV/mC7K6nVyVbGyDB5jyQweGAGWcaxTx/uUXtNcAZNSXjYeZTV8s8peHhKwkIhtc1L5vXIQbMyXlQKogNmBpc6B5rpswP3/V0F8qM4q0uX4GroheQrtrCF4McJ3sPId2CiQ+nQI+Q/bUgNDy9ZlNPYSsvFg01Toyf5ClPQ34byOO4kwee4u5U97eZqivcVqow+bfyWscaJB3UacMPeAL0ebHdzwPIeXRBYd7kcdVKFnbVJJH6OKHOp4YjoeHXL1+rL5Q24LOmTAnqPbuggfMVQIdkh8CzFWRww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sfm4ssBaOeWSpdHGRGVPJvZoS75dUVH/0fI5rRbpWNs=;
 b=OX520V4rguok+FgA5+3yDTyxSfYNv66vhn4OroXnBUc6ollqf1TQ6W/GkjkW6SoT3w51XRTkC86NNHPdm4ojnPah1/gO76fELIUY3NWBE+QqqzZEdWoULfHL+1ryqwOYeS9xbMfcM0MscgjwXnxf5pIyPOI9L+Xli9Gi1oIPZdgXmdWJ/CdMjtIKX20SNPHg1ETjRhCgLGw/+JGgtAuu4Cncr/H/koryRZh1l8Osp7Bb4lHfj8o4AO7rKtrWtaibM45vOU7ho1cs3Cndbn/T9vt2jR6x138q3eegkjMM7PC8LyukLKsi99P5/+TMmLFQ0joYId8yJs+xNhDQIm4hVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sfm4ssBaOeWSpdHGRGVPJvZoS75dUVH/0fI5rRbpWNs=;
 b=PEP350DOnEXdpvGybSfVjHwFqgmpzj3b2KtyjAUoRep9wAIbsemi4GYC3+Wj3dc5eeMd1fukuGGBLZp+OWTdDywFZ6GRrRcWJ5xHtjJchrBVljFDLDVuJKr6oSwY8n1f93VidW1gBnOTjhDCSAEoqjZyenava2VsskRsru8ewhw=
Date: Fri, 23 Apr 2021 16:25:46 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v2 1/3] x86/EFI: sections may not live at VA 0 in PE
 binaries
Message-ID: <YILY6sTSMTqt27S9@Air-de-Roger>
References: <89e97459-28fd-704f-d424-88afa3a2a4a5@suse.com>
 <748d35dc-5a2f-302f-d789-9797c6726810@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <748d35dc-5a2f-302f-d789-9797c6726810@suse.com>
X-ClientProxiedBy: MR2P264CA0185.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501::24)
 To DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7ff97c36-bf9e-40ca-8e9c-08d90663b253
X-MS-TrafficTypeDiagnostic: DM4PR03MB5999:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM4PR03MB5999CE25298C674D959BAA088F459@DM4PR03MB5999.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1VCRHxC2B3FqbS9b5XmLccZhAhQUCOy8efJIXlu/AZ3iKZgPVFYV1bJNnVuJ6RqeJlb7E9Ek/Pal6YKs0ECBJU/SPPHhMC1UURacO5g+MUAPQOzWR+zdQu1pieKuTu/ViA1pywT4ld/eOUaZ7BRg/WOeIEZrogQQWbd+G7xz2X346uRoHxhJfPDwTTWJEmA6ezsqTuw8tJjddIKJtP15wVIaOUs8cfRKVmhqee/yrrBPeWlv8c1ayVz8AT87uHQpPlntge2gVYuVruDhF+JfmdkiKq2y5gmuZhifTd2k9WvFQZsB0+T4X9FzJzbtxL9p/BmA0wTTNzICi9HT+F1/3RfEc+XOQjSvIWxv2SGXB7lME/vEvId3s553JY2YuEKgfloT3Vx0QKnS1KPw0VhmC4r1s5e3vIBbIo8ufoCy/488y7CGvUbOlrqVzgiWbMYqmu74YpyQNubtUaxTSiQ6JdB67lUwFFoTRQvh7hTUJvfYjVr4PXoxgsGCiL52RrJzIMPrVTcZF/YZiLAa9/ILQ8dyqAljnty0qcYKEmZ4DhIWGARJfyh2+Z8Q5XfxoaQ1W9A30n/F6krTsd3TOpP2R+3uWnku3/3A4gkenKCweFk=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(366004)(39860400002)(376002)(136003)(396003)(346002)(186003)(38100700002)(316002)(9686003)(16526019)(6666004)(6496006)(6486002)(26005)(8676002)(5660300002)(54906003)(6916009)(8936002)(85182001)(66946007)(33716001)(478600001)(83380400001)(4326008)(86362001)(956004)(4744005)(66476007)(2906002)(66556008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?Q1BMVy8rdXRPY3BDL2JwLzFSY1p5TmRPNFcvb0dCakhDeFJLNkFMRmwrSmha?=
 =?utf-8?B?eWQ2TGtuTThVZThtTmtHbmc2WmtQYTY4L0hTNklDN1Fjd293SWpJVlp3SXBW?=
 =?utf-8?B?SjBVOStPN2hWV2hZV2tkZzNpL05UOHdwZll5WGtQakdtamFWNkdjUWpxNVFh?=
 =?utf-8?B?Slk3RTVLUWpVVTlqNkIzL1RkcFNRS0JDdEVSOXVhOWxyR1BjZkxGKzBqNzIv?=
 =?utf-8?B?VmxxRlUrWTZERW5yd0trUU9EQUxqbjE4N3kwQ0JjZEhlZkgwOCsycjBvTUhN?=
 =?utf-8?B?bFFWSGtCRTI0ajBaemxYTzlPZDdLMUtFN0dacTdJMEVSSFo4R2o2UUtzQ2xP?=
 =?utf-8?B?THdTUkM1WTF6azRXSmJiVDQzTEpGZ0VJZ2JFUFVvdlZydURRQ2pvRFhsbng4?=
 =?utf-8?B?RVVNNGVaSGlja2tuTVQzbUM2OFdSc2x3b0xLODY5TzgyTk9QWUZscE9XTlNQ?=
 =?utf-8?B?TDllN0J0cXg3ZEVGS05VbFg0dU1MSThRZEVKdGRrWHl5eEJhWFJOb0NsZzhM?=
 =?utf-8?B?eW5waGc0bTV4TzM5WjJadzh0VDhjL1cyaGZ6OUZtQ3JGYnFCTDNJWGFzL244?=
 =?utf-8?B?dTV6ZmYxZWR4R2FyY0kzZ0tRWTFabWNJWkwvcDc3bXB6RGlrOEdoWUVkNW5O?=
 =?utf-8?B?TVBMUzgrWlY1NHJjcGs4Q004NjhGMmZNS210Q05DZzVFT3NIMUVwVncvVlZw?=
 =?utf-8?B?RGh6YUdSRDd4eEdFajhKYkt4NjBZSDlpTHR3bVR0c0p6SDdHNmVsaWNLaEN0?=
 =?utf-8?B?ZkhsRkVCYlJjcW9lNHRCWnVyOUNzcGtCZUVJb2lFbWVZdWpIQTRlMTE0U09Q?=
 =?utf-8?B?Tlc0K0RLb1BKTGVaaDZ6VEZCS1N5bXdJNmVvbzVwazliZjZCbnk2WEx4RGNW?=
 =?utf-8?B?ekNScEZRTnArNUhtV3RFVkVSQjNUL0ZPcW5CL3BLVUtUTjJsWEtpSi92dW0v?=
 =?utf-8?B?ckpFRVlMbmlxN2d6bVFnTUlsVklYYW5SazBKOGdKYXRMaFV2UVVaSTgzWVY0?=
 =?utf-8?B?ZXFtTURHaGlHandWaGJTUVJRNVZTQVRJSU56N2NDSWhyWmY0TmptaEhjOFV5?=
 =?utf-8?B?SHBoN0V0SUZwc01wSWd0bGlhRjlFLzdvRUkvM1hsK0MxeXh6VUFRWGZ2TWsy?=
 =?utf-8?B?eUJPaU5UeldReThEVUMxRXFSa1FkRkp4UmpSWFF6QkV6S0crcTBMclJhYVo5?=
 =?utf-8?B?L25GeFV3aDh2NkVWVWxob2hmME1lK1VMSmxuUGc0dXBNK3JWbVdrUjFYMVds?=
 =?utf-8?B?OWJ5OWVJQmp2UDJPcUo4Ylh5c2FCMzlRdzlWNUdmcC93M1U4WG9oK21FNFh1?=
 =?utf-8?B?T1FaTldUM25xSjZ6YU96T2tjM2loVjc1U1hacndhWEdSdWNBZW5ldFNSenRi?=
 =?utf-8?B?MGdnZzJjK0xId2lkTS9qMTVTdzdWc2hZdWZwdCt2STlFT05aUW9XSUdIQWxF?=
 =?utf-8?B?ampLb3MxU3VWZlUvSVEwa0JQdXplSjBmU2RZVWMvd3RhcktKVTFyV3JpOTBs?=
 =?utf-8?B?MU9ESnBKN0cwOGdldi9SeGhzTUJORlFvYmVPeXdVNC9Xa3lPOVBOSk5DTFR0?=
 =?utf-8?B?WmsvTHpjcDBaMnp3OG1TVkhaWGpRTTdsdktoSzRHOXhKZUtSYlg4SDBlYTJZ?=
 =?utf-8?B?SDNBd25xOWtYbXJtWnVxbVV1U29XdzA5cVVEQkg1UFcvVllGMDVTT2JwcnFZ?=
 =?utf-8?B?M0U5djgvb2FXR2tOVkFiRTljY0FTRVlXQW5ZTXFuVlVEWU50a3FsVXN2Mlc3?=
 =?utf-8?Q?PkQNc7+Y2XJHTzd7ufnuyYx8U26IaJWd3P9TzQ4?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ff97c36-bf9e-40ca-8e9c-08d90663b253
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2021 14:25:51.4219
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QVQtZMNNHPvGmNgi/4hbMCKJ3/cYGRkqpuJJ044UGoZ7SIHkQz6cxi7joCPETBICS5G7HXlOQsvhvjlWvS30Qg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR03MB5999
X-OriginatorOrg: citrix.com

On Fri, Apr 23, 2021 at 01:03:34PM +0200, Jan Beulich wrote:
> PE binaries specify section addresses by (32-bit) RVA. GNU ld up to at
> least 2.36 would silently truncate the (negative) difference when a
> section is placed below the image base. Such sections would also be
> wrongly placed ahead of all "normal" ones. Since, for the time being,
> we build xen.efi with --strip-debug anyway, .stab* can't appear. And
> .comment has an entry in /DISCARD/ already anyway in the EFI case.
> 
> Because of their unclear origin, keep the directives for the ELF case
> though.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Albeit I would remove those - even if gcc can still generate stabs
debug info I don't think it's used at all, and in any case a user
would have to also modify the build system in order to force gcc to
produce stabs debug info.

Thanks, Roger.

