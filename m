Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eFNQFvBKj2moPQEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 13 Feb 2026 17:01:52 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 04318137C83
	for <lists+xen-devel@lfdr.de>; Fri, 13 Feb 2026 17:01:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1231257.1536475 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqvbt-0002Vc-Mk; Fri, 13 Feb 2026 16:01:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1231257.1536475; Fri, 13 Feb 2026 16:01:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqvbt-0002TI-JO; Fri, 13 Feb 2026 16:01:37 +0000
Received: by outflank-mailman (input) for mailman id 1231257;
 Fri, 13 Feb 2026 16:01:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=v8h/=AR=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vqvbr-0002Sy-OI
 for xen-devel@lists.xenproject.org; Fri, 13 Feb 2026 16:01:35 +0000
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azlp170120002.outbound.protection.outlook.com
 [2a01:111:f403:c007::2])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 43f88e43-08f5-11f1-9ccf-f158ae23cfc8;
 Fri, 13 Feb 2026 17:01:34 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by PH7PR03MB7297.namprd03.prod.outlook.com (2603:10b6:510:24d::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.10; Fri, 13 Feb
 2026 16:01:29 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.20.9611.013; Fri, 13 Feb 2026
 16:01:28 +0000
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
X-Inumbo-ID: 43f88e43-08f5-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L4/f02YHtgSGKHn2D/U3wjv6hc0FZOOIau7NRhqk36Sbj3DCUjnu/+C0oYrwFpwSFDlgzXFITo+Sj7l/DQLdTpSxl2ePjWWMKxFLSPbMJbntG0QPDye23NKZQ1iZ2/rfGee5S09fDeFFEjZ+m10HR3WbpWsSpUcRNi1fYXi+YLuWMpYRsYj4RqODn0Im85iURdnjNAxqYnG32HJ63vR+su8KmmixAy4ujNjsl6v4exhp0F8Ji634SAAfJ5c6Nz6DCQgf6DMZMXquzNOl3v4TI2pFZFkOil3d/nw/w5FcXbBIgMTguBssSRujGLR2xtxVnMbBh5mMhd4/eTKiB0Qd6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fLOphD0jur9UOiAHjMvOhmytlNXwdiOi5GDPDxuG8nA=;
 b=IFf0VG2ivLunTfeXlbT4bOAySame4tnfRJZjA/nIoGAlUBXrLxs+cXVjhffP47CEWH1ucqHjIe3efoI3K3fWZ2p9g0XICL0GrkublETWCVQNQwy1F6V2UuuMw30fIrfa+KKr15MF5hFp7sKLYAW8AyrlmKKsSWr5p1FxXgNGqHR4uvOKw/GSBNCvuJgUM5aMMDDbxev7ELhAuFq01SAGwzqLRpiwwiksBJ1BU3DaArLZqi0UYzHPWE+ZBOY0y8y6drdFehe0M0tfmE8wDfu27+K3J+i+IEK9USEghPuQk5J+7e7RZMT9vC7MRH4vzGbaa2BZT8pHov84sf43Dp2yEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fLOphD0jur9UOiAHjMvOhmytlNXwdiOi5GDPDxuG8nA=;
 b=dynw6x48R6z+aB0sJiIYoBNl8ktEb1AsEXxbFfs/zxAYFY+nkJ6iws27xvruqbUb4aUW889y1hc3fkEAz5gBhPoaj5EP0sv0/393uI8UPIR3UQcM8dfrrFXEx5YOTeY9yzSDmdgXgcHBAn6C/+ufGFid0v3TG5eqQrSl/MD1XqY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <1e4e20cb-71fd-4ed3-888b-7ca8b17175a5@citrix.com>
Date: Fri, 13 Feb 2026 16:01:25 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH 1/2] x86: Make hvm_enabled a constant unless both PV and
 HVM are both compiled
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Alejandro Vallejo <alejandro.garciavallejo@amd.com>
References: <20260213133732.132326-1-alejandro.garciavallejo@amd.com>
 <20260213133732.132326-2-alejandro.garciavallejo@amd.com>
 <aY80qJVIZOjjqBOS@Mac.lan>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <aY80qJVIZOjjqBOS@Mac.lan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0091.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2bc::8) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|PH7PR03MB7297:EE_
X-MS-Office365-Filtering-Correlation-Id: fc44305b-dbc5-4b48-ed2f-08de6b192575
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MW5UdnNHSis0UmVUVktaQzYrdk5RNzByQ25IeWovTHV1QkhVY0lOanJLRVN3?=
 =?utf-8?B?bmpCdEo2dURZbXN3Z0xXZDZGTXo3K29uMTZoYlFBTkVXNlhsZDVaZDM4Y1Fo?=
 =?utf-8?B?bDZMNmZ0YXFPWlJWeEVydXNsN05TYkMyTGpKejhZRjcvTEYxakJ1Nmk4Qmhp?=
 =?utf-8?B?clNuQWk0Zi9oclR0RzlNdVdKblROSXlBZnhjaEdCODlNazlRUzUyRXJLZzZX?=
 =?utf-8?B?R3Q0VS9WcWdYNTN3UmZMTU1iZEhkeDRFWkt0UHhQNU4wSkc3Mno3REcyZFZw?=
 =?utf-8?B?RzRrdjhiSGx5T1JuYTY5MDhYZSsra2JtRkRmNmdyMlErd1NoMWdFV1VXNENi?=
 =?utf-8?B?dENlMG5vbnZkUVU1RklMamx0aFJPSlZiSHZjUFEvZk9nTXg5WkdwL2sxZ2Rw?=
 =?utf-8?B?REhxekNrL3lNL01BRlU0STNLdHl1MW1FNVhnOTIxZlhZcHpCLzJSMGF5Vjl1?=
 =?utf-8?B?amxoMGp4RW5aRUdQcStheTlKdVFmSTE2bWdCWUJkVE8yU3dxejRhL2RhWXZk?=
 =?utf-8?B?cmdGVGd4KzhCVmF0bjRESU5vaWZYMUtuT1RkVitoUTdjaENXeEF0WkhJVnJy?=
 =?utf-8?B?N1RpL0psaVl3dU9iSHJOZFFVWXdVMXZrQWUyL241YmVHNUZGbHlmODl1ZkZa?=
 =?utf-8?B?QkhMbWl5MlVqcndWbFVwUG0zWjYrSGxHQXZNaVlMVm1wNEFzQXp5UEJQU25W?=
 =?utf-8?B?bVJBSmtFVXFZUnFzQk9SVU9xTEtJa0dFUzFLNVBweEs4a09WWG9Jb0QwYUdY?=
 =?utf-8?B?OWNOSGQ3ZTZVNG5nR01PTFB1cWU0RlVJbW5JQUtOcHBmVG5sZDNqN1k0eWRJ?=
 =?utf-8?B?OTUxTklQZjE2eWgyTERZSWtyS08yWGpkSTk4ck5YVFF0UXZ4L1dVN3NjSDRF?=
 =?utf-8?B?cXpQQ1hnSW80RWtFd1BjZDAyNkxuQkNBSzNhTUdNb0o2dG0vVkIrV0ltS3hX?=
 =?utf-8?B?eGNnSHBwTzYwdlVLQ05LNkxqOVhOcFVjNVAwZmxpZHlxYnpkV2NucThvQUk2?=
 =?utf-8?B?NVE5bFRhQXd1a1dydm12UzAwWVJZaDNvbWJSNUVLVjhKMEg1TEI2T2pQRWdI?=
 =?utf-8?B?aUk0cFB6RUYzWHVVWGtoYkhDbnR1SEJ0WVFhRDFEMUduZENvVk5JUHZMODg2?=
 =?utf-8?B?ODM4eWg1Q3hTdHVxZS9XdnYwZkUyN0txMWV4VVlTbkhBTkZLWW1wc2VPQ0po?=
 =?utf-8?B?RWp3dlU3T0xPTnBFTUtlZmNtMTdGbEkxS2NDOVVEeHVaYlA3ZlBzQTNQWHFW?=
 =?utf-8?B?cGFJWmlCZ3M4RUZrZE1hMFpmdXN1bnNVdVlEV2JhRm5Ncnc0Wm5POFg5czRP?=
 =?utf-8?B?cEJ4VjVVdHU3eWJrZWVyWjVrMmJiNUFQNjBlVXhPOHFHYXVTdERQWm5NdlZ4?=
 =?utf-8?B?UitZYVFmUVdtS0xPQUNzaGZDVHpXa2pCYzFwekEvbDVucFJubGV2ODVPR3ZG?=
 =?utf-8?B?SlhoS1hzTkN0eE5qc3BpZnYwQW5pRklld2hhVmxNczdQNk5DanFtam5sQmw5?=
 =?utf-8?B?RUk3VFZUYXpyLzNPWlR3QzlZNUpzdXJ5UWRCOGZtbjNOQ0lucndZR1pteEMz?=
 =?utf-8?B?dk9Xd3BQdVhtSmdWMjJzYUxKczhGRU85NGxJVkN4RVZYdkpJNXFza1pQeUo4?=
 =?utf-8?B?ZDk0cFRnU1FjeWJYaUJyV0tHNGl3ZWxpOWFUL2s5ZDRuU1ZjN25DN21RSUJW?=
 =?utf-8?B?VW1RN3RuYlMveG5vcURvT21haWVDK044Y3hYODhoekFDOUU5cGx4YjYyMlBk?=
 =?utf-8?B?ZHVrM3VwRUZSYVp1TkpZVjdMVjd2N0N3azJLSm5BUitPa3VYdWZxL1V0V012?=
 =?utf-8?B?OVRicEdZNWQxOXVReGZNSVU5S2xKMEhERXNEV3VmRnd4N0pGU3NER0ZIdkk4?=
 =?utf-8?B?ZEZaeXJPV0hDZDhQVFJ3bktRaUtkM3VpN2xLWFc3d015QU9peHc1SW5WLy9h?=
 =?utf-8?B?MDNSaU54dlJEMFJSYVhFWmNXeGZQcDVrTUVtWklmMzBSL0pmTE5OR2R4NTNC?=
 =?utf-8?B?M3JMRTRTcXJ1Tjg0TlZHN0xZTEFMbmF3dmhOM1dvMC9iT0FjOEhack9KTTJh?=
 =?utf-8?B?bFJNdkFrbFphUElnVnBieXJ3emJhVTFiQzVzSmFoQWhvbHRJeHV1T0NkdHI2?=
 =?utf-8?Q?8PxU=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?U3Q2NGpkQThqazU2TmFMdlNTbE5jTWNYUFZ0am9SQ1RVV25CTVpFaUY4N0ov?=
 =?utf-8?B?K0hNZFFxMFNvNk5aUGJUeGpGenl1UmFieDhQUyszK1FSMGdMYVVwRy9zWGU4?=
 =?utf-8?B?a09ESTNqNWZmVERDcGUxblZMSHUwSzRzdWFpV0VvRFh0K3VoQ0h1V2xaMnE2?=
 =?utf-8?B?WVBra01pOUpwSlBSNmtVdFhDaTNjejN0RDFXN2ZYeUhWenY5YW1XbFVaTmxR?=
 =?utf-8?B?MElGdkRLbG1tZFk3WitOZjdkZUVRRkhKTEFkU3E0U1VaMHVqdGI1NFNVR0I4?=
 =?utf-8?B?UUJqdGJNZTJ6MWxIOFF3Uld3MVVIUE02Y1QrRTF0MW5JbVBkc0ZZWlJvNUsw?=
 =?utf-8?B?NnNnRTZ0Z1VVMzJrejkxY0MvWmJxeGh0QTZLZkpsWWoyTVJTRHovWFkyNVRl?=
 =?utf-8?B?TW9xMTJTdERoLzU5TmFOQmpjWGpQTWJOaDh2OS9FMm13cWc5OWpKRXVjVWx1?=
 =?utf-8?B?SUJXNlZUT1lqbnRzNXo0NHViTE5pdlNwbU5KY3JKRnRoeHA1SDYzTitpU2RU?=
 =?utf-8?B?TVhHcVVUT2FJU1ZHS3h1M3ZRZS9UNXJJbEJaNE1nS3E2cysxSnVlR09Bek4z?=
 =?utf-8?B?TG5SbUhITytaTVh3OHRKeFphbTNQOE1LQlNLbHNaVm5xSmdXbGFHV1FIdkoy?=
 =?utf-8?B?REU1NnhXQU9oTjQycnd6WEFVaEdlQkR0NFo1OGhWeHhZY0EyZysxcHFKdEdB?=
 =?utf-8?B?T2xFQVoxNk5WaHNSU3NjM0tGWTVSRDZJZnNYZ1FBSkFuYnRrbFhFaDk5aER0?=
 =?utf-8?B?SVMvaFFKS3FVdnBBc3JNMGlITDBqL1dmZ2F6S1YrZnNiSy9TenJVcmtSN1dI?=
 =?utf-8?B?RHhIdmxuMThwblZUVWtUV3hoVCtNNmZWamdxOGFNbW9BMmNXYkJHSGh1TjdM?=
 =?utf-8?B?ZzFUVkU1b0RZN1ZsQlN3R3hnNlJ1cFowRTN4ZWVvVk8yS1lRZWphcDlEVldG?=
 =?utf-8?B?VTFibFRSTzBYNmRnQSsyQWc4WFVNZEZqb04yT0VVbDFlMFNpQTU4STViYjhJ?=
 =?utf-8?B?cE5Sa2RWYjB5N0RsQ3hLZ2c3S0VyUmI3L3ZoSjZOR2tCV1pyK2pFWUMydTRk?=
 =?utf-8?B?V21Rd0JkWXJmRW5tMWhQa240WTI5WWpSOGhGVjBqVTFKdS94VXZRYU1SUm1u?=
 =?utf-8?B?V2xuSVljZXVBc2cyQm1xTUtKUjBxR2Zpc04zdUtjWHJKSDA0OFdJclpKZGh0?=
 =?utf-8?B?OWdRelhMY2hMS3JZS3pXbmYzR1lJSHVZbHdwRG1wYUZlQlgwa3lZU1NHVEl5?=
 =?utf-8?B?dFFJTjRGWmRIdU93eEljZDBwSHd0Tk5OZUhxTThZSmkxclAzR2dHdVFhV0lD?=
 =?utf-8?B?ek1kT3AxbkdZMnExdGEzZHNVa1BBNDlBRVYwWkgwcHhOUUlnWjQ1c0ZVN2Vu?=
 =?utf-8?B?MkR3eWtRRjlLckIrZEJsWVZFMUVjNVdFZHJTTGpKcjlPcnRwYUtucmFRRlFN?=
 =?utf-8?B?T2plODcyc1JEREJCc1JXVVdGa3NLdTZiaUVKbDJGTXp1bVJLZVE0VmUvSUtU?=
 =?utf-8?B?L1FwSFd2cE1pSmRRd1ZlaGs2bStQSmYwQjJaOHk3U0E5M3g5SlhKak45R2pa?=
 =?utf-8?B?bVZXTkpJci9qellOcXZCK2llODRHNWNHRTNrK3lSNE5WKy9aTVNuMTBxVVpZ?=
 =?utf-8?B?RW5JT2lObU5rT1RNMmlXZnBoelJrM2RRVzQ5R09mMERCNit5N3Z6RTV0WXJX?=
 =?utf-8?B?VHc5dXc4NVBpa1VPTXRiSDNZNnVBMXVYSEJ5MTQ2aHhoWUc4dUJzME54Z3lE?=
 =?utf-8?B?MWJIbFVoYnpkQWRZWEZVSk1EdVJTZlF4cDBWSEhWWGlNbGZsTzFYWXQwcG5D?=
 =?utf-8?B?Tmk1VzdHMFFyRGlkRkY4RjdVWU9yREpLNkI5Ykh5RkpOaDc4TDUyOWkxcm1M?=
 =?utf-8?B?Z1gxVVNHeWV3N2ppNjFDYWhEdS9iOFBWWlZrek11aEFuWnQxeHlNbDg4UlNN?=
 =?utf-8?B?ek5UQVZRdWRnb0kxL25sQllTM2lwdjM2OGhncjRYbWV6M3BTU05xNSs3U2xE?=
 =?utf-8?B?RG1OOFZmbjRiL3RnQXAxRkJTcFlDODlVeG9OUmwvTmVyMWZrN054M3ZDTTE4?=
 =?utf-8?B?QzVmdmovS1d4K3VRaytndlM5aWVsRUZsQnRUdlluZzF6ZDlmUUhvTUt2dmdY?=
 =?utf-8?B?RG1xTUx6cFU2dStJUHBNYlRuNkFqTlM4M3l1blB5ampyNTE1UEFNQTVMWDd6?=
 =?utf-8?B?STZYWm1MNlhqdjJqR0U4OVlyN0FWTFFsRHM5ZDcwNGdNS3EwTC9BdGFvTGph?=
 =?utf-8?B?R3BmVjhRcUhUcWRLcytoTWx3TzFxMDFFWFdJbHZ3SElnNVIvSXF0TlRLT0tv?=
 =?utf-8?B?dU5iRWlrTGdUVXNEa0ZZNStQRWtGdXNLQm1hTFBLaVIwQ3paT2Jpdz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fc44305b-dbc5-4b48-ed2f-08de6b192575
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2026 16:01:28.2778
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SDbuwf3OwB2gZk27AmCQzb3PzBhCeL4Z965KxDggLhj+X662YcdiaiuVq1zqiVpOboenEbI4HFn1TRJfcfinc75WDIGJScmeUDvu629IGkI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR03MB7297
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,m:roger.pau@citrix.com,m:alejandro.garciavallejo@amd.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RSPAMD_URIBL_FAIL(0.00)[citrix.com:query timed out];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 04318137C83
X-Rspamd-Action: no action

On 13/02/2026 2:26 pm, Roger Pau Monné wrote:
> On Fri, Feb 13, 2026 at 02:37:29PM +0100, Alejandro Vallejo wrote:
>> diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
>> index 4d37a93c57..da56944e74 100644
>> --- a/xen/arch/x86/hvm/hvm.c
>> +++ b/xen/arch/x86/hvm/hvm.c
>> @@ -173,9 +175,16 @@ static int __init cf_check hvm_enable(void)
>>          svm_fill_funcs();
>>  
>>      if ( fns == NULL )
>> +    {
>> +        if ( !IS_ENABLED(CONFIG_PV) )
>> +            panic("HVM support not detected and PV compiled-out\n");

As with Rogers feedback on the next patch, this wording isn't ideal. 
How about:

"HVM support required but not available\n".

This is reachable for people who use cpuid=no-vmx,no-svm but they get to
keep all the pieces and the documentation already has a general warning
about this kind of stuff.

>> +
>>          return 0;
>> +    }
>>  
>> +#ifdef CONFIG_PV
> CONFIG_HVM I think?

No - CONFIG_PV is correct here, because we're inside an HVM-only file. 
It's the only case where this variable exists for real.

~Andrew

