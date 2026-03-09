Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SCiRF77KrmnEIwIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 09 Mar 2026 14:27:26 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AD657239BA8
	for <lists+xen-devel@lfdr.de>; Mon, 09 Mar 2026 14:27:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1249496.1546966 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vzacp-00087M-1T; Mon, 09 Mar 2026 13:26:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1249496.1546966; Mon, 09 Mar 2026 13:26:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vzaco-00084y-U9; Mon, 09 Mar 2026 13:26:22 +0000
Received: by outflank-mailman (input) for mailman id 1249496;
 Mon, 09 Mar 2026 13:26:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mqfy=BJ=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1vzaco-00084s-8e
 for xen-devel@lists.xenproject.org; Mon, 09 Mar 2026 13:26:22 +0000
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c105::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8ed9c572-1bbb-11f1-b164-2bf370ae4941;
 Mon, 09 Mar 2026 14:26:20 +0100 (CET)
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by DM8PR03MB6232.namprd03.prod.outlook.com (2603:10b6:8:3d::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.25; Mon, 9 Mar
 2026 13:26:12 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9678.023; Mon, 9 Mar 2026
 13:26:12 +0000
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
X-Inumbo-ID: 8ed9c572-1bbb-11f1-b164-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TtP1QJ7VIkT8vd01GEBRFmexd1GmbKxOds8N2Kulda2UQ8skGGSM8YkZ3v0wI1bcw4/vAQ8F1gSs3Vp7TbLHPXdo34qMgj6WofGRhYiV0rwas3w7zKEePUpHdf+4+mL+yVSpQqDsWk/ZVRJnSi8jqT/SnXEYDjzTiJ2ZxWh9q2InL+0g8yp5f52+lLShpx9nBcsIh6CjDxM+o42cHpNYwZzow3qMYvRb8ylthvYG4O6aeTdvGMNrTda8Ns7nEAbEYhUkXxhO8RnjvEQVoBQ2tskfd/0iDgddrKHbFeAJZ0ILiCfWaLSWaYh4R8F4zqAlYW88rPuVdKErhViqhudWWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l7n5O3eHZxb0m8XX25UCo/ymu9WkcyBzlfUUnlzR+e0=;
 b=SwYcl3vsX6lc3NyItOTZfRqRI8YPGO7T8YYIe/aLcMG824v8bHl2Y4erjXRzfZRaWH0375CTx3OiEZ+KJ17/qmCsv/eCTNVUPbKyPeEBTnIqhd3zqO1WU8C47LDyosydPwOHhLOW99d3vqe6RcjK5rsd3fPgYYsIyE2xgTY3roCGUNL4YioQGwbT4jCQ2ZAfFMGjhlt00qDYDBTqTlJLV/7gH4CoHFqb7pqbyjpZIvBmlzZtT7j4VhhGetommWF9xi49fAYk0dwFeqBCrB4E+XJHqK2OPUAIRLv2o7dLe6YRQvpoWYoliS8zSVLuLtv4w2Ys4hrgU+dIQdMMHkGi5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l7n5O3eHZxb0m8XX25UCo/ymu9WkcyBzlfUUnlzR+e0=;
 b=sNQ0LbAUiotXBWKd2Xyh6Fgg6wE0C81HqB5qUpjka3dA9CqmwWbGGi7jrS/jJZvylx3zMBCRiXgb2rLyYw068dSfoKHvldaCW3xQUwNntTdW4Zlr7fdtL298km74RnRUPD9+4DNqkJKFSuO+gCMxGeKt9C133Nz2fLMeZEg0lBE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Mon, 9 Mar 2026 14:26:09 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Julian Vetter <julian.vetter@vates.tech>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Juergen Gross <jgross@suse.com>, Julien Grall <julien@xen.org>
Subject: Re: [PATCH v3 6/7] x86/dmop: Add XEN_DMOP_enable_ext_dest_id DM op
Message-ID: <aa7KcQQoc3-HwlcE@macbook.local>
References: <20260309123055.880050-1-julian.vetter@vates.tech>
 <20260309123055.880050-6-julian.vetter@vates.tech>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260309123055.880050-6-julian.vetter@vates.tech>
X-ClientProxiedBy: MA2P292CA0022.ESPP292.PROD.OUTLOOK.COM (2603:10a6:250::11)
 To CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|DM8PR03MB6232:EE_
X-MS-Office365-Filtering-Correlation-Id: d86c132f-f008-4dec-c434-08de7ddf6ec9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	XvzjhGbOF+VlJKbv6FeAQhjk6ewuC8gBz+x929U6CY8F0q+e6jl+Q1Z/SQQdR8l50vXCxdpOfWtdnL7R+tDa9g+o6e4unvOUYMQ3tKkce5PuJnmHYMP9fri1iKxvNI26AGNcAun6gkjvjH9cx84MQs+shrqGtOxVG5hDLz04xz5dp3JvSwNm+9MkLIkqUB7eLIIoHgzFEnIz61FIHm3p68IxwtOqMzS8bQF5AiDOmGQ1CabWTOk92/JtRxQ5vhugorFqlhzj96SWKkMYY00bA/RpmzVx3RiRzfeY+PcNF1xRcg7WAzS87FRWDmkPPJMDuo7i49zZvj9D7NKw5WgWajl7AR+y+lau2rcocusyhlRhGZIfCC9SMXU02Aq2uFoHTeFIfwcfmh3QyMJwP+ZG5IaI5JAuo4PF04CaEuRnlpqbG6GWm64Lgb+LDm4imfgx/ciQOoTtPHYaGgVCeOM+RVNrkEf7/S0/t6Doeqsb9AAlpzzpIVDzHQ5F+I7AfPOdS1qR8SNMfd1SCHVNaMT3E3y4ErvYIBKC2SHP0cdSFjlp1mTYKKeV5WgfeJcZEN9A963aFmCy+nTeOoZPwDuitZ/hcXQ0xNoH2BUWATd9VU/Zwt9/njjdeAayuyDiOi9gEzNe21FprBUx3vW7EDTQKoniPmFeUytMJTuqgOzU1ZTyMvV4+6em5B/Hmbv/iJ3IQGCAAoGW1PUlnM6ls93CMEECnNZIhP8kxfVDc7838uo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?b3cxalVBZWFGVGtxRmY3cVMrUGlwUkQrNnZXZDE4Yit1SDFUdDkyaGwyZUJQ?=
 =?utf-8?B?dTdDYnVoVXZkbjBSdExpTUdnaDl2QjEveVA5aU9zTzF1aW44QlBJUENRSlVw?=
 =?utf-8?B?eGxva2JiS2pZSVFFbmVWUVdXUzJWWWcxTW16cXQyeVRFdTJkQ0Q1R3d4djNN?=
 =?utf-8?B?aHBSRXZuc3hRWUFBMTlKSkxxKzVlbVhGTTIvam1IRktZZDJtaFFLUjFLMnFN?=
 =?utf-8?B?SG14ODd1M0x6aGE2NVI4UWMvbWNUOFhNKzB4N24ySkdsYU52ODQzdk16M2E2?=
 =?utf-8?B?WUI1TW1wWFVsSXFrQmorbDFyaFVrVlVoV2ZFUjd4Tmh4NUpIRldqbVlGbllC?=
 =?utf-8?B?QlJsYUZoS2piNTg1bDNMRW5VbGw1a2YvUDdINUFCa1FBS2RHR2xvRzRwUU1a?=
 =?utf-8?B?bHlDekNGTHlxVDQxQ2lmTGlGS0xXY0d6WHI0Q3hwODhQVEdjY3NzMi8zb2J2?=
 =?utf-8?B?azZ2Mk44QWxlL0I5MFc5TlcwQUFsempEVmxScmNUQzZVYnVab2Y5SmpiUEpw?=
 =?utf-8?B?d2xWcmdjN1pGT1ZZbW1YR0pLVHZGZUtUTXNuRzFHdCtYNXFpRGJOTzl3cGpq?=
 =?utf-8?B?eHRYcUtUaUVIajdaZEI1RS9EWk1BTURiNzZVcUhVOW9zRldlTTF6YzJZcWRP?=
 =?utf-8?B?WVRTUHIvUFVPaFBTdWVXQlJKT09pbEdDVDJMZTZzaEhwUXRobHluQVlwbzg5?=
 =?utf-8?B?UjdHOXd4SHMwdkxMb1JrVHBwRHc5bjlpNm5SRXBERVRtaHJPVVdCSXVBVjJt?=
 =?utf-8?B?Mm5BWVFoZW9STE04WkpGc2ttTXBoc3Q3ZThhbWt4c3dXZ1RiNUNjbE5DRW1Z?=
 =?utf-8?B?RGx6OUVDWDl4b0dUeFYzMHlrOEZUMWd6V3d1K0FxcWZLeW5DWUpOazR6Mysz?=
 =?utf-8?B?dCtLZ2xUQ3VIT3VxMktPVXpMaDk5SVp6a1NUZkhMSDZ5VVBoWk8zK3hzaG9P?=
 =?utf-8?B?OVl1NncwTnBTbHFNQWFhRURzWEk5V2hhU3BDV25FaGlZMmdFeVJGbzZJUHpY?=
 =?utf-8?B?aWVzWVZZTEVGYVd1VnZjbXlLVjR2RHhvVnZGZDl1TE5rR3pveXExdHVqZ1E1?=
 =?utf-8?B?aHoxclFGa1FsVHFsYkF5UFlhdlVrTHBDOXUwTUtHUHpoU3ZXVmZVVUdSeFZz?=
 =?utf-8?B?aUhqbWZkU1JDcVhUalhsTWk5cHp6dnZSK2o3Sk1zMnRIV29SVE4yajBoUHFX?=
 =?utf-8?B?Vld5WHEwZjBuc1Znc3BXQ0hnbmU0UmZUMmFub3g5clR5ekZRcnhSL3pPcjVZ?=
 =?utf-8?B?aWNTTmFFZjdCMlB1TTBZU2k1WUJYay9IcklncnU5a1JHMy9hUWlGMXJxbGhu?=
 =?utf-8?B?d1IrVGpFcE94amptbmgwTzc2UmtUb01VTGV1THg1Z2dCckNJVHhDNHEzMU9l?=
 =?utf-8?B?ZUxZVGk1QUpoZGNSNXQwS2YzZjNMWjZiaFhXNlBBMkUvRG5jVmR3YlBsU3l4?=
 =?utf-8?B?OVprL24rQTNUMnBTanF4SjZVbUdRL3JGNHlLL2I2ZXAzSWVGUXRVOWtaQTdn?=
 =?utf-8?B?SmppTlo4aUNOUk5vOStDenp3akc1SzVjOUhXWkIyRmhVb2x5djlRdmhPY0hv?=
 =?utf-8?B?STEvbzlIaE02T0RpRUFhVW94Ry9aVkJqeExvS2tZVzRPWUhyOTd6QW1VaHJJ?=
 =?utf-8?B?b0hHWkVZMytsOVhCK2pESkJuU3UrbmM1WW54WGZIcmxNMUxWZlk4NlB5V2lP?=
 =?utf-8?B?WkUzcVczK01kNjdPVVdLM3U5T1lyU1hvaitkNFo5dnI0UUZVVS9MY0R1VFRi?=
 =?utf-8?B?bStDVElUZi9WdksvTUI1bW1KaG1RTkZ1ZStmSk5GaVh1bkR2SVRaRm5KTk1I?=
 =?utf-8?B?MkxCaFpIYlNMbVJxaG5nN1I0S01kWC84NWE2RHFMMmJKMVBUOUl6Zk9oc1Za?=
 =?utf-8?B?MWtIM2hLcWN4MlFOUTFIRW8zODVuc3IwZm00Z2lqMmdrT2Y5WGVNZHZiNUtB?=
 =?utf-8?B?Y0hFMnJBRlpnUm1MbWxVY09Xd0Q2YW45bzRncHFtV1E3UjFCVEhXNWhxUUhQ?=
 =?utf-8?B?Ni9teEhvZ2dmM3FBSXBzM2hpc1dxWFB1OEduU3J6ekNySTdKSEZ6ZnVUWUpa?=
 =?utf-8?B?OVg3cFNHZm00TzQ5NmpqWFU0cm9IeUMrU0ZGWG1BdDV3MXVWYmFrVEZPQWtx?=
 =?utf-8?B?TEtLR3lJRmxKSjZrZ05WU1VGc29uQ041TlZQZm1YQ2RGV3lXK1FVTURtTisv?=
 =?utf-8?B?RjhqcDlGcWJONFgvM2JCcXhCalB1cmtwRGlMajlpVFZLd2J2V1JiUElpVVVP?=
 =?utf-8?B?dGdSZ2svSzJieHpkM09mekdOTURDYkx6Q3hHN0tDa2MyNVRZU1piKzVmeE9a?=
 =?utf-8?B?K1JHcTAwaEU0R1Z5b3VEemhWRGdVd2NsbmNtRGlnQkxUWTFKRDc5UT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d86c132f-f008-4dec-c434-08de7ddf6ec9
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2026 13:26:12.6036
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: L3K97Ok4AZtVeGd2zeztPi9LMX5A+ytvOFRakzvERwUiWLj5aeePk0Ir2yQqRxM4QEdlGmlZ6JM2TXGTf1fAFg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR03MB6232
X-Rspamd-Queue-Id: AD657239BA8
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[macbook.local:mid];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS(0.00)[m:julian.vetter@vates.tech,m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:sstabellini@kernel.org,m:jgross@suse.com,m:julien@xen.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[citrix.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.970];
	RCPT_COUNT_SEVEN(0.00)[9];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Action: no action

On Mon, Mar 09, 2026 at 12:31:03PM +0000, Julian Vetter wrote:
> Xen cannot simply advertise XEN_HVM_CPUID_EXT_DEST_ID to the guest
> without knowing that the device model will handle extended destination
> IDs correctly for passthrough MSIs. A device model that still uses
> XEN_DOMCTL_bind_pt_irq would pass only the low 8 bits of the destination
> ID, misrouting interrupts to vCPUs with APIC IDs greater than 255. So,
> add a DM op XEN_DMOP_enable_ext_dest_id that the device model can call
> during domain setup (before vCPUs are started) to signal that it will
> use XEN_DMOP_bind_pt_msi_irq for all passthrough MSI bindings. When
> called, Xen sets ext_dest_id_enabled in struct hvm_domain, so it's
> visible to the guest via CPUID.

Have you considered whether you could re-use the padding in
XEN_DMOP_create_ioreq_server to signal whether the device model
supports Extended ID parsing?

Also, you might want some negotiation between multiple ioreq servers
on the same domain.  IOW: is multiple ioreq servers are registered
ahead of the domain having finished creation you could level whether
extended ID should be announced.  For ioreqs that are registered after
the domain have started you need to enforce the currently set Extended
ID support.  If the domain is running, and Extended ID is advertised
you must prevent registering any new ioreq that doesn't support
Extended ID.

Thanks, Roger.

