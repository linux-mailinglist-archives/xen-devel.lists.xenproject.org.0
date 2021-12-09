Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 72EA646E692
	for <lists+xen-devel@lfdr.de>; Thu,  9 Dec 2021 11:27:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.242897.420053 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mvGdP-0003oU-P2; Thu, 09 Dec 2021 10:26:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 242897.420053; Thu, 09 Dec 2021 10:26:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mvGdP-0003mP-LJ; Thu, 09 Dec 2021 10:26:43 +0000
Received: by outflank-mailman (input) for mailman id 242897;
 Thu, 09 Dec 2021 10:26:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+Con=Q2=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mvGdO-0003mJ-A7
 for xen-devel@lists.xenproject.org; Thu, 09 Dec 2021 10:26:42 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7fc4bd2e-58da-11ec-9d12-4777fae47e2b;
 Thu, 09 Dec 2021 11:26:41 +0100 (CET)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2110.outbound.protection.outlook.com [104.47.18.110]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-38-GrTsKIDqN9-y7vhlpdRm0w-1; Thu, 09 Dec 2021 11:26:40 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4352.eurprd04.prod.outlook.com (2603:10a6:803:4a::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.22; Thu, 9 Dec
 2021 10:26:37 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4755.024; Thu, 9 Dec 2021
 10:26:37 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AS8PR05CA0026.eurprd05.prod.outlook.com (2603:10a6:20b:311::31) with
 Microsoft SMTP Server (version=TLS1_2, cipher=) via Frontend Transport;
 Thu, 9 Dec 2021 10:26:36 +0000
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
X-Inumbo-ID: 7fc4bd2e-58da-11ec-9d12-4777fae47e2b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1639045601;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Ktr193pS08mX1sljE5M2Ea+ogUG4Xlq9xwDI7AlWsFI=;
	b=QYa++v+B+4pGpeWgfu+YlHCYOUso8Od0BBX+gU9ZQSbcFSkQuERttuwaUuh9hqLu4x2jSi
	V+jniTb055L2M+xmYlKV2TIo+VKVA8eadGZeVj1cjwX97vDGcRb+8i5vvDA9+pSN80Bxrz
	KDxTDAToMys02elKi15449u/6nip1p0=
X-MC-Unique: GrTsKIDqN9-y7vhlpdRm0w-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XIozplYWqsEfD/ZPkksusTqqpOF6A/QVPaj5OM6CgIq9ZMsRgESIPCLR6QL5bZMTvgsZZOZmXVvjy4x69jSzqLqXSaa0GbGgvBrdwcIVLzDz0uRPR96XNErnTbm0v8FCZJzwDrm/EQnrAxqu/9wwnHA5JMYQnLMNNXG2K9vcz1r0DusiWYMrFUccsJHxR1uYudGF1zU9BMpEVNVMpinyyWIOC6EEufHbvczyzapLSxY3EZFazUJ4RsrjJDkMBlVLz40HyptzoZodT+UYytlC5FWqxyXgLtlfArZThddv0WUYCgmloGSILbyC2EtItQxd1s7hhH5nfwgP+BgnMheb+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ktr193pS08mX1sljE5M2Ea+ogUG4Xlq9xwDI7AlWsFI=;
 b=ayVp0oLd2XCSx1hR+c38uLTCrVljHY7cs1y7LDkDNdX9KvUia3lo+ItK3qUWIYdMZdTjYq7LZivc1qclz8Ii4IvzDATfOmdE80QNTk+gG0tv5CfAS/rlxnjJLd5DxgPXaVo3g9394Ak1igNxj14yIVGybXpOL30UifpibjP2yqrQl4bCIRnZn2D6/oJDwnDiDHBoNJX/5TOQ/kfBFIKl53ivEj6BPSe3zRS/jtx5Td3V+y7B+afT/XlGj9MSzXHN24ohPcWkCm9yvUS2/eWX5HbFvz5H0N02lCsOC8gw6JuQ4zNdT51bdqcrGwjb7nQ0QpaSq7t8LldZ/eB5i2N4tA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <912e2574-2adf-25cf-498f-86a86f31c30d@suse.com>
Date: Thu, 9 Dec 2021 11:26:35 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Wei Liu <wl@xen.org>, Anthony Perard <anthony.perard@citrix.com>,
 Juergen Gross <jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] libxc: avoid clobbering errno in xc_domain_pod_target()
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8PR05CA0026.eurprd05.prod.outlook.com
 (2603:10a6:20b:311::31) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 520b4c84-80c1-46a1-32f0-08d9bafe6191
X-MS-TrafficTypeDiagnostic: VI1PR04MB4352:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB4352AB8274A3718AD3BD2DF1B3709@VI1PR04MB4352.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	30cT9jpfQXt3pve5BQPTb4YOpYI+z77zmwk49PzTTolxsAnsJddz4Jk3yiw70W1AXtt6LOpoeGq5wn1CKZU2Jh7YU8Usew8W8K/83qCFP3crWhceZgiJmYpXY6mdIWjFci9lRfCdjuB2fJVQK7fB1WT1VBvawb5xKrfBcXLMlMGQKo+JE+tZ8tkLwe/ogr+GnxXzLxDR7d95weAMFbgRs48NugrluY0ri88hVE54Uw0dqmdEueFDfai3yIrBsVdsYBEGVLE407gPbmAv6SzE0wJYC2W90/+ZFJlXnRHc8lLtxZ7Pt1aUOwQ75s1RyO2jObsdKbt4dZrpsXRh7X31VndYA6z0qWksxCjU3kOAU+y7M+Nv6F/LAZxBLUSl4a35ZmSMdM/2rYOMcyyTOp/L8EB+xr+Y5AexoIYvputgFUbwAWTycWZufwbzvndHgI8CyIMdFNqsHxoOI/OInGybLsIacfIVCkoXt8Q+VeDGxE97StbIUGRPRZljEDhT6RWMa6dm3fR2XTspHSWLritSdH8w1YXIYI7NJetFkfiHuajTb/D5nSQPmlfyLWQTDM125OXU7C1GTRcKYdSrXZpwm5dbqMLs7tMzgn2Qz82VZvak/yyLjm3PYpTy6dTByY9Rte3FKkKO3JDyas7yPdX1WDNDLa6mZSOQz0XlNeY9083/BgG0D+3Q43RDaoK+x9clbvcq2jZvjxjIAtbT+b0fgeB5oUBosIQmm87Ffml+7YUU3Zs23BIxuHJ8t/1l124S
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(66946007)(26005)(107886003)(54906003)(4326008)(186003)(66556008)(38100700002)(508600001)(6916009)(4744005)(86362001)(956004)(5660300002)(16576012)(2616005)(316002)(31686004)(8936002)(8676002)(6486002)(2906002)(66476007)(31696002)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OGFaa042U3lHWVJOeFRnRTlkeW9uNzlqbXVGV2JsUXluQk9sUEZWeSttQkRo?=
 =?utf-8?B?NG1UUUFPUi94a0lleGJjWXVMUFc5SGRkaVZNYmlGVXpDRG9ZODhnck8xdTAw?=
 =?utf-8?B?d3NVZnFyNExyc0hPenRQT0h0clFBb2xLVzFuMUxqZUNMNGJ6VEk4eHZHVm0r?=
 =?utf-8?B?SFFrbTFCcUQzeVVFTjFBRnFsSmJKZkplS252RU9vVG9UWW1seWxmYlhlbzVz?=
 =?utf-8?B?a204L2ZhdEhOMlNoWmpDWXFHa2RpQXAwK3Zoa2t6ZHRGRG42NG9raWtOcG45?=
 =?utf-8?B?dTNDbkZ2cVNVOFN6WjFrMjZ0eTFiVE5lVXhOTXFUQVlpVFptT08vVE9SeENy?=
 =?utf-8?B?RmRSeEhqcElKaDVuYnlVRlpoZ0FsSk5Wb2cwZ29NcUd6QWNQc29UUHl4SjBj?=
 =?utf-8?B?dG5HaGdxbWJBamJHTFZjNUdMaWZZS0ZweUJLRVYrQzg4NmpUWE5sS3E2U1c3?=
 =?utf-8?B?aHlQL043eXVzdWhCY2FRMHFhZnhKMUk0MTlnUStUL0x4NlBrMFlaaWRFWGVG?=
 =?utf-8?B?MnJSOWdySUdGamxkWkVQOHd3RjF3Tk1CaU9pQlB3T0R5dzdKWXcwQ0NQRXg2?=
 =?utf-8?B?Tmpmb2dRWE9qd0RsMlJuOVlDcW84a2RZQWk2MllmaWV3V2dHV0RpNHJZT2tz?=
 =?utf-8?B?dmluakhMVFZVU0VZY0VIRTltU084NHdqN0NvdGs2NEk2bTQ4T2NEU3VKajFZ?=
 =?utf-8?B?ZHRYV0I5YUdpZUw4V2xsdm5rWjFTNmdJcXZqMlNoKzVQYUhEYmlzallBcjNh?=
 =?utf-8?B?WXErbjVDaFdVWk1TTVBhV1pQcEJzRDJTSzg1MENXOGZiNjh3ODJPYUFVUHVZ?=
 =?utf-8?B?bXNzL21JdmZmY0paQjFQUGRwWkpKVnBXeFp6MFNWU2VMck53R3JSL21OdXJn?=
 =?utf-8?B?VkNSejRDamk4cWo4N0RoQk9SWkY1M3dLcG9oaWUzcmwrR3c3SHh4dUJueWx2?=
 =?utf-8?B?aEpOV3J5R0ExMkt6OTJWSFE5VDNHZzQ5M0dvU2drTWVqWjlDVmFXcW5FT3hJ?=
 =?utf-8?B?U2hIa1RTaXp3WEJLOXB2b3pYRTcwK1FxUUhBbzRQRElyK0E5ZTBoUjhRa2ZO?=
 =?utf-8?B?WEthakdIUm5CUTRJZnlSZHJsWEFqekE0MjJvcXhSTDFGeUVhcStjU1lpbXZR?=
 =?utf-8?B?aGVYMTJYS2FQTXY4NTRnZGdKZmdDdDR5TmM2WEpwb0tBY3JWeWF1VXdCNVFp?=
 =?utf-8?B?aExFVWlxNnkyTzlmUG9lY3YrM0FYTHYvR0xYRHM1SEk1L1BEQUdJemlVb1Uy?=
 =?utf-8?B?aGhtcm9XK0p0aDBxK1E4eFVMWXh1cjdZQnNCQ0RqSktSeTQwTjJabFhZSHkz?=
 =?utf-8?B?emZmSkxpUFF3UHVyOWlmbmRwblVVR2dYaXVsRVEvem9WZkxURFZxSFNnUk1C?=
 =?utf-8?B?ODRRd284RjFDaUtPNEtzSFZzMW4rUTNqL21wMW1XdVBoZXRhdFhjdmVuaUtF?=
 =?utf-8?B?LzhMMTRhaS8xREpjNTB3NGdqMFNKdVlmd3hmamp2WGpvUDAxdVN0SE9FZUdm?=
 =?utf-8?B?MERSQlptVHplU0QxaUtLdXFvNVlnSklTQ2M5ZDZjZGpCVXdvOFdXS2I5SkJV?=
 =?utf-8?B?VXYzb2dIMXVIK3hBbVJoSzN1S3FwQ2dyOEhic3Y5S2dTQlpSRjZaR0Z5QVdp?=
 =?utf-8?B?TUFtT1hrMURRbGFoU3BQNnZjUlJpN3FvR1AvWE95QWdydkZoYk42TXFsYXVW?=
 =?utf-8?B?VEdpeW9URno3OUhsRE9IL0FZb1JOQjJvVUptWlFNcnkxRzQ3L2VSNlMrajUw?=
 =?utf-8?B?VG9KWmplM3MxOHN5MklBMVpCbW9Wd0RucjBENmsya0EzSnFxQlJTK3ovclhE?=
 =?utf-8?B?ZnpJUHhNelNaUXpvT1pJWHVURkV4azAyKzliMk0rVlNYNVlkTS9kT0JWS2hn?=
 =?utf-8?B?eUJHbzJhTlZYSWtTdTZtaFQ0R21oWjBPNWdydlF6Y3BoV3MxbFR5M2Ewakhn?=
 =?utf-8?B?dkxoM3RqUVVRSVpvYnJVUmU5cmpBRW1TL2ZUbjIwYkF5VTZKeFUvZjRva001?=
 =?utf-8?B?dSthRGpKZGdiYkJPdVd6YnVhWEl0ay81dE9mRjBFMTJvQjhwRisyUWxBS2hT?=
 =?utf-8?B?dEtVZU1NOGgvUzVmME11aTRhN2VVb2FiTXhGZlIzMEpKcldaNUlnLzBKcDVh?=
 =?utf-8?B?MEFEZGJiamZna3hGbnB1T3VpcEJhRk53MmM2RFd1azZIcDFOOWVkK0FwbnRp?=
 =?utf-8?Q?293rNy04ZwcW/9x7+SF/wek=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 520b4c84-80c1-46a1-32f0-08d9bafe6191
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2021 10:26:37.3329
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +QM72ZTxNJK0LEsS09ZDb8sB2jXVbCIGL0ainxU0fiZqedqAxoBUsCXu9G1P8S8BEPxMtfy90fGcDLvIiDi3DQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4352

do_memory_op() supplies return value and has errno set the usual way.
Don't overwrite errno with 1 (aka EPERM on at least Linux).

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
An alternative would be to let go of the DPRINTK() and leave errno and
err alone altogether. While the hypervisor side of the hypercall gives
the impression of being able to return positive values as of
637a283f17eb ("PoD: Allow pod_set_cache_target hypercall to be
preempted"), due to the use of "rc >= 0" there, afaict that's not
actually the case. IOW "err" can really only be 0 or -1 here.

--- a/tools/libs/ctrl/xc_domain.c
+++ b/tools/libs/ctrl/xc_domain.c
@@ -1231,10 +1231,11 @@ static int xc_domain_pod_target(xc_inter
 
     if ( err < 0 )
     {
+        err = errno;
         DPRINTF("Failed %s_pod_target dom %d\n",
                 (op==XENMEM_set_pod_target)?"set":"get",
                 domid);
-        errno = -err;
+        errno = err;
         err = -1;
     }
     else


