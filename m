Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 083C03B0892
	for <lists+xen-devel@lfdr.de>; Tue, 22 Jun 2021 17:18:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.145904.268384 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lviAr-0008Je-8H; Tue, 22 Jun 2021 15:18:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 145904.268384; Tue, 22 Jun 2021 15:18:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lviAr-0008GZ-5A; Tue, 22 Jun 2021 15:18:49 +0000
Received: by outflank-mailman (input) for mailman id 145904;
 Tue, 22 Jun 2021 15:18:48 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=RtyV=LQ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lviAp-0008En-V1
 for xen-devel@lists.xenproject.org; Tue, 22 Jun 2021 15:18:47 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id bb75cbff-754a-4c11-94fc-1c9c6f25f856;
 Tue, 22 Jun 2021 15:18:46 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2107.outbound.protection.outlook.com [104.47.17.107])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-19-Fa_m54PQP6eF-ciZ81bwUw-1; Tue, 22 Jun 2021 17:18:44 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VE1PR04MB6478.eurprd04.prod.outlook.com (2603:10a6:803:12a::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.21; Tue, 22 Jun
 2021 15:18:43 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::f06c:6f5d:34d2:1c36]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::f06c:6f5d:34d2:1c36%5]) with mapi id 15.20.4242.023; Tue, 22 Jun 2021
 15:18:43 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR0P264CA0263.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100::35) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4242.18 via Frontend Transport; Tue, 22 Jun 2021 15:18:43 +0000
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
X-Inumbo-ID: bb75cbff-754a-4c11-94fc-1c9c6f25f856
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1624375126;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=H8bfy44Kldc2RqppGX0GDbslnJnZuK1kudBdrWRi9kc=;
	b=I9QWOPLQMHSt9CkiOdEuXi1s0Lc2oWdIrwLbZYe102YmaTVu6l0voQTqsYYVw1hs1GwbjE
	D7lNH/RKO5TcDw+ttF6/lc/WS8JtDHVpFxJde8bf2jVkOy0Q05yirSjHKRYeViD+C1QiFm
	/hpgUgj5+/qoJ8o+5Jjtg+oRRnaSNR8=
X-MC-Unique: Fa_m54PQP6eF-ciZ81bwUw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZABdDmzHteT8ecvqp3G/jO/1syomfBkwkR/qouxxIXlUvOY2Db60xyUPHOTsdnrwJPuumXTW5dx9ogGug9ASF7pFDCxfEg53VMSY7YbhuaojchOoA/oI28LPS6yTxHsiVvod/wcpKcwJlIia+4eqf5uwcv3EXHaJTpYAup/dk1ZRO7dgaFte4RkYp4NzmnjEGl/5N9kBWk9AFUym6LOhQNhWhJAvHLDjcZZV9KgPVbketx6c7wz59FbYf9J9Cnb4al4q5qGY1ojq7iA7JKS+wRrTBaIvWOlc5LA/EbAdU6kYfgN3rcdD9ZKcDsL46aTGLwwb1lQTgEIAV/eUXE/5OA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H8bfy44Kldc2RqppGX0GDbslnJnZuK1kudBdrWRi9kc=;
 b=P9FxXsRRMy49hPf2nzaNwZfZf9YKIV9wU2NBjvhZVANXwZbFSdDVlfJ4UbFwVXIxna3/+wQAglgpetaadaymP4xuAbTInNBDCiits6Lh1zQC8htZr9tV3QKWXsMZ8JA+2ikOxSxXMEeeZZzXZu6yZmttOPkIaYxgNxkYxYqgKlYIYxsInLUeDGdP7GRLcuMhv4ZMOOZ1zQMTkVMziSGHutn4Wma9E6MfUE7YAtaS2wse1juBBIP04RQA5hNRJdy77WDOHy0NY835ixlXi9zFLir0b03iTS/HMGi5alCkvZ2EoMzNa3HuCsSt12x6ARhGThzNQS7lupieO0HZOaNgww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=suse.com;
Subject: [PATCH v2 3/6] libxencall: introduce variant of xencall2() returning
 long
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Ian Jackson <iwj@xenproject.org>, Juergen Gross <jgross@suse.com>
References: <6c532607-c2a3-d0ab-e4e5-428f85f4a045@suse.com>
Message-ID: <beca6bb7-a991-8a94-ebbe-af973e1f3958@suse.com>
Date: Tue, 22 Jun 2021 17:18:42 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <6c532607-c2a3-d0ab-e4e5-428f85f4a045@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.24.206.209]
X-ClientProxiedBy: PR0P264CA0263.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100::35)
 To VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c06bc438-2769-4886-86ad-08d9359105fc
X-MS-TrafficTypeDiagnostic: VE1PR04MB6478:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<VE1PR04MB6478BDD1F24198CFAF5DB73FB3099@VE1PR04MB6478.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	gUDDvKzVKiCCj9xzUaYYLKGC/hdCUgGTqdigMLN9pgc+9YegNHzpkuUSH5Iyk8AUGN1EZn0eOW7+hdntP6C+pZTxZoiR+LdxELYVM+ERTmZhr0G4mY8OFmn6cPo2VrG+/KhF0WJ9L5QSSUBjJ6vb+vO2x92sWQq/4dv3vEreyialBAPhR28atST4cXioa4hSNALNfKbTcmTD9TPWVCAA26L7D/QPxT+N9kjEyRJHGElMkOzHuYvS09ugABexXDPY1C9SVbakc3U3XA3yqid3aT4bN/FWvZHlkEhY5nyMMCe9RS1XHYwsfl9/6iKRvay0G0brn/ymBdipvqImwViW/fcGUN1DkYFBMviTb6qOJdqHY5fFIqVZ0+sU6VL7ZRT+7qggyDYXBwWvv5ZNqtJ/tEk8fkfrtpTmpXvAiso3fDr2riNteQ+dXRtzwh0z4FuZE4QkfODxOgDUAVp3GDT1g1ix3I5M4GudnfxbcDBh67JYE4WeBNB1vnJVU+HqAvgKZqzOIMq/+/okEHhwUtiwRhJENq/8k2wQ6HffTr69aLL8NPkw9KfUFGiQQSuKRARnPSSxwHDB6sALUvf8TyIEseUV5VZmsLgSYwx2Op8LN1XAGKFveSLmJqrHNqgtCJVpZp1KdJedVfEm1rj/1caNygui04k5tLHlNADgH8ZcVAaC5E46dIhXfbAOjzzLSYdw
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(136003)(346002)(39850400004)(376002)(396003)(366004)(26005)(186003)(5660300002)(4326008)(16526019)(36756003)(38100700002)(2616005)(107886003)(316002)(956004)(54906003)(16576012)(2906002)(31696002)(66946007)(8936002)(86362001)(6916009)(478600001)(6486002)(8676002)(66556008)(66476007)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bVhYVG4xN3ZiWjBIMW1TTk0vV3VueGZHNzJXNGhLTVFsQm1BTHZNVW5OSUNt?=
 =?utf-8?B?MUI3czNqdkhZVnZEOWJabGFTaDRyU283azJJWnlRRk9aREY0bHZ2OUVlT2Ri?=
 =?utf-8?B?NHkwRmJiZXZONG9BVVJueXFqdFlZREFsVVgrd3pDc0F5TmNicHhiRXQxTXpD?=
 =?utf-8?B?cVhuZnpET1VsYlhseXZyTHB6RGR6SGpUcnQrSzlSWnlSeFBVQ0Y1MzlVdExo?=
 =?utf-8?B?T3pZRHNPbVRFTG5jSmFkeEFOVGhzYjNOR3pmLzEvREt4SEJHSTlQOWs0aytI?=
 =?utf-8?B?NlljTVRPcUVpMy95S0RMejZ5UEFIcERzZ3ZuYy85RCtZVkN0L0VEdTF1OE5I?=
 =?utf-8?B?dG4vaFgrNmVUbVdoSi9RK1JaTmdjOTVVZDNUL3RUT2lGR0V4RWZtRkxiMFlW?=
 =?utf-8?B?RHdqNUtkU2JXWVFGWDBXNVZqUkQzU04zam9LYnJ1dTRtak1xd3VHbVJ6V21Z?=
 =?utf-8?B?TXJJcFFRVXBQeG1oeWh3WDdaV0V0V2RyUlp6NmlEZGVSb3QvemcrY0tvZmdZ?=
 =?utf-8?B?bEVPQXJ2RnN5ZkR4d0NEd3FBM0loZjBjbjE5bkRmTnlaVXJYOEpuMnkzRlVu?=
 =?utf-8?B?NTZNQkhiT0VtRCt2MXRNOEtUQTJWeHEwN2RBL3paWmFaeCtDMGp3M3Z4SnhE?=
 =?utf-8?B?M05QNnN6TUVlOGhSOHg3SU9zY3E1QTQyL1h2ZWZsZHROL28yM1MvZVB2Ykdw?=
 =?utf-8?B?YUpCd2NJekJsMVR5a1YzM2FjdWF4bjU1VTVoV0hCU1d5cEpVSlRGaUFvSExj?=
 =?utf-8?B?V0phUUtMbkRiUm15WnVIVklCVGNBNU1tTEd3THRUK2xtcE1CRGZqejZSTHJE?=
 =?utf-8?B?dm9hU0tMOUtLOHYweGtWMGtNS1JJdnhUTFNEc1c1WTVXbnlIaFhKMGJFYXo0?=
 =?utf-8?B?am1qbENncUxOblVQcDMvakdLN0hPTkVVbXY5Z3pRbDN6T3d3ZEZjS0NnZ0JC?=
 =?utf-8?B?WHlKeVlvRFg1c1VvRWJ0VFVOSjFBWWJvcGFPZVk1a3hNYy9QalExYURSTVhl?=
 =?utf-8?B?QTVKNUlMNnJDUGdNajhiVUtPWFdvZ0RwdXVKZk5Jb3V4SmtIZ1NKak4rS2tM?=
 =?utf-8?B?OXlVamZuY3I2UEtGMzA2VWlJU0pXMkpmODBxWEVIYWFBN3pZWFJsK0ZBL3Y3?=
 =?utf-8?B?aUpXajNIdkJvcG1VaTRFMk5qRkVLVHJyTGl5THY3Zjd0NTNvWlBQRUpVa3pv?=
 =?utf-8?B?bWRyb2w4eTVnVW9yWFZSMFZHNWlDK0hjSEpTZ0pTbzhkcVlBdGNreER3U21F?=
 =?utf-8?B?QVE4ZUoyT3lDcWlvb05kLzdLWWZMQ2pGRDN1WGRHOUxMU3V2RDMxdDh3cHNB?=
 =?utf-8?B?Ri92RHp3Smh6SWFKdFBKTGpnN3h5SVZBL3FuTHo0KzgrU0NoQzcvV09JUzBu?=
 =?utf-8?B?N0huanBOL09TTXdWb1QzWWRTeHNMMHR1UHJzTWEySmNFMFk2N2k3alVCaDJi?=
 =?utf-8?B?anF4a04zTGY3UjVFS2VTVDhvNnBzaGg2cU8rS0RmSnZpK0hQYVhENlFkcC8r?=
 =?utf-8?B?dzQwd0hsM2taK2pFcXpROHVLYWZIY2pRUHcwTEIxdXZRSEhzMEc5OGN5SDlZ?=
 =?utf-8?B?RFRxYUJhUEZCaHFLRWMrVmsvbWlwSkYzWmsvS2VGaDI3MStzeFJiRU1pdjJG?=
 =?utf-8?B?V24ySUttUFZSVEFpNGt6cFBQRHlhdjRYaUFtalBEQ3pMN1ZWamU5K0RxSE93?=
 =?utf-8?B?ZnFKWkVsdENaQUI2SnRiTEdzT2cxWUt6WGpCSG44bGYrREVIZEpVcG02dVU5?=
 =?utf-8?Q?xHk3BjVxgJIj60+15dmKFP2a+TVfcXERkIQ2bV4?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c06bc438-2769-4886-86ad-08d9359105fc
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2021 15:18:43.7670
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9tc9Vx6D3GP3CSY+XZ8ho/Ind66LGTJurpJDoqtwRaqm8zdp5jKDax0AMm/jFDhCp333ek20xdQolCFG+RzeCQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6478

Some hypercalls, memory-op in particular, can return values requiring
more than 31 bits to represent. Hence the underlying layers need to make
sure they won't truncate such values.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
Acked-by: Ian Jackson <iwj@xenproject.org>
---
v2: Move dropping of xencall6 from the version script to a separate
    patch.
---
I wasn't sure whether equivalents for the other xencall<N>() should also
be introduced, and hence I went for the minimal solution first. Otoh
there's also xencall0() without any users ...

--- a/tools/include/xencall.h
+++ b/tools/include/xencall.h
@@ -113,6 +113,10 @@ int xencall5(xencall_handle *xcall, unsi
              uint64_t arg1, uint64_t arg2, uint64_t arg3,
              uint64_t arg4, uint64_t arg5);
 
+/* Variant(s) of the above, as needed, returning "long" instead of "int". */
+long xencall2L(xencall_handle *xcall, unsigned int op,
+               uint64_t arg1, uint64_t arg2);
+
 /*
  * Allocate and free memory which is suitable for use as a pointer
  * argument to a hypercall.
--- a/tools/libs/call/core.c
+++ b/tools/libs/call/core.c
@@ -127,6 +127,17 @@ int xencall2(xencall_handle *xcall, unsi
     return osdep_hypercall(xcall, &call);
 }
 
+long xencall2L(xencall_handle *xcall, unsigned int op,
+               uint64_t arg1, uint64_t arg2)
+{
+    privcmd_hypercall_t call = {
+        .op = op,
+        .arg = { arg1, arg2 },
+    };
+
+    return osdep_hypercall(xcall, &call);
+}
+
 int xencall3(xencall_handle *xcall, unsigned int op,
              uint64_t arg1, uint64_t arg2, uint64_t arg3)
 {
--- a/tools/libs/call/libxencall.map
+++ b/tools/libs/call/libxencall.map
@@ -27,3 +27,8 @@ VERS_1.2 {
 	global:
 		xencall_fd;
 } VERS_1.1;
+
+VERS_1.3 {
+	global:
+		xencall2L;
+} VERS_1.2;


