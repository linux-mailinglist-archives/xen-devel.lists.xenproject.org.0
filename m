Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 354C13BBEBE
	for <lists+xen-devel@lfdr.de>; Mon,  5 Jul 2021 17:16:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.150361.278027 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0QKl-0007io-7Z; Mon, 05 Jul 2021 15:16:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 150361.278027; Mon, 05 Jul 2021 15:16:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0QKl-0007gk-3e; Mon, 05 Jul 2021 15:16:31 +0000
Received: by outflank-mailman (input) for mailman id 150361;
 Mon, 05 Jul 2021 15:16:29 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HGaV=L5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1m0QKj-0007gR-FF
 for xen-devel@lists.xenproject.org; Mon, 05 Jul 2021 15:16:29 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id cc6a4b37-51ac-4aaf-8f83-bdcfe2678826;
 Mon, 05 Jul 2021 15:16:28 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2050.outbound.protection.outlook.com [104.47.14.50]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-39--TSgA9JGM7yATgxUCHtwrA-2; Mon, 05 Jul 2021 17:16:26 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5472.eurprd04.prod.outlook.com (2603:10a6:803:d3::28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.23; Mon, 5 Jul
 2021 15:16:25 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4287.033; Mon, 5 Jul 2021
 15:16:24 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR3P191CA0016.EURP191.PROD.OUTLOOK.COM (2603:10a6:102:54::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4264.18 via Frontend Transport; Mon, 5 Jul 2021 15:16:24 +0000
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
X-Inumbo-ID: cc6a4b37-51ac-4aaf-8f83-bdcfe2678826
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1625498187;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0wA9AAqtkrdQU9VPvSonatQPKPM1QlgORRMW1Ye+aCM=;
	b=mKC+xD6lzcYufRDdn+1C9uF9t6ujsKj8WgAQnpB1PWFF06WzPvNb+a1KiTygjJsGVaC0dr
	yAsw9W1IFum8UmOJOta2N63bTthzirmDYN6bKBAaC2IVjQ97iagLArFXWZBgBq6kqQPaB3
	RsqV23+rwcumAbRBqlbaNtR9cOo8sks=
X-MC-Unique: -TSgA9JGM7yATgxUCHtwrA-2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YQqWpj7gBxmMeY9HAbLLd7Ej7yqNMw5Y+/KqOy/U6oM6Shd7L9A/vBCANvBxvnDUxtR1z717M/XuHyPc5kWhA527xXf3ta2dWOPy+faNiGvJQzFwsY03YJzp0pUe83GwUuwBVLm4VO86jSUNBc+EPleKnqYqXuj+Afub5iLNYxKwMvrRzVJ9+wDvSSolrqix6E/RwxQ2dU8CUESbb8LhVgYaEOV4P7plk6qF15eYdppYlucm0i7Bd8ZJB0wCNi3n/biWUgoPftvoQciuzJjAt3NC1UwryHCApVG40gFgD3Z8okTqw/ol0O97IZyNkYZesq8jd6CvDtRjRlBUs0mQgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0wA9AAqtkrdQU9VPvSonatQPKPM1QlgORRMW1Ye+aCM=;
 b=HABKzdKtFiT5IH3krVMarL002MTR1X4gSJOPsOSEk5e4M8zHa7QcvbCxrL6dxMklhUZ1HsuwZn1jNqCLu2E6/T201+rMrsVerknA5wnMMLiyXvZrXtpjOdwT06QVt2MNml6cajUf+qKBO4SErfDbtWYRZD3NqfWSD5RDJBhsMDJJrm/+jEf1SkrcC1QqCFhmC50Me05T4RhBYP9TJe1JAQ1T5JWKDy3mRIQgzAexBd8i7r5rtNTZFK6qtNEyhZ+vuVQSQbQZdLRJ9M9qZO2neaNPAbMhe2GqvjSgx9WKqZKaXlMojwaEW5PyMg7U9LEmq+vrQMxedXskHiXhJmVx6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: xenproject.org; dkim=none (message not signed)
 header.d=none;xenproject.org; dmarc=none action=none header.from=suse.com;
Subject: [PATCH v2 10/13] libxc: simplify HYPERCALL_BUFFER()
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Wei Liu <wl@xen.org>, Juergen Gross <jgross@suse.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>
References: <0bebfe8c-6897-dc8b-7fe0-9127d4996eb8@suse.com>
Message-ID: <2d8b0f54-3045-f881-4705-28317e5ab509@suse.com>
Date: Mon, 5 Jul 2021 17:16:23 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <0bebfe8c-6897-dc8b-7fe0-9127d4996eb8@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.24.206.209]
X-ClientProxiedBy: PR3P191CA0016.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:102:54::21) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 259828eb-8c8a-4791-3af6-08d93fc7da97
X-MS-TrafficTypeDiagnostic: VI1PR04MB5472:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB54723648A525E89C68B62C92B31C9@VI1PR04MB5472.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ANXTnSZQqwVmOoJSScKLv+3JIK8uSQlW7I/pt6AY/DeDGSFYjx2ib8giNu8MSrSwmMaCaTfOKi5ynl6/+KOGv+jRGU6CsNERIXOcr/LV+lsfp8ZtITvxpmI7i/we45bFnRBmDAQEunad3EKs/8f2d4itkoylP95/DKtVqv5Rd8Aq1mvI5F8jQ1b/hKPThr/kGK+6Ruowy4NXAaHuTWlO+y9RovegsQK5rS1nnznHfTpS51NNssiZrxl3EVPMhJngM7NAYQtS2SAtheEFOX852PAaqR5iDzeu4e1zPXXKDtE/NELgzLREWHGro/TEwIUHTTQUJn8E4LqB4hgleqO6v3KuyqPH1Hvb+ZzcwWSYkVh93HS5VsLLWtcz8rHoarsrjEhck7pg+5ftSLyGKLTDxWUaOnR7ijQXOhxYZC2Z8crGVAZ+Tz0wPO77R/50AwEB/tYZTRKdqtHG0Jnk4VEkSU9Izahpq+XbT/Nb4n0aTZLd4KxLplI3baBJJt6F+oOCxgIvEoB7RdSwYIr1ERrDLqNbN3EMvp4KawUn3k49k3Nve8XIUhxmN30EkR89qMa30446V0K0QbTkfecIwEAEMD8Jy5/jnUDeghX5CSzG0Z+L7W6vy4YAXk0g71lPF4ALnSZSATkqrq7izq09eRXYIVpaEM32GXWBZH+SW73eb7XbrqpumWxyt9p1xTQq8N+HLBxy9ifC4M6ptLIRy8pAy4ZLEsCUXS0QKEtNNixYdtE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(346002)(136003)(376002)(39860400002)(366004)(396003)(54906003)(478600001)(6486002)(316002)(16576012)(2616005)(83380400001)(6916009)(8936002)(2906002)(8676002)(956004)(4326008)(5660300002)(66946007)(86362001)(66556008)(66476007)(36756003)(38100700002)(26005)(186003)(31696002)(31686004)(16526019)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NFBxR3B4bUMvVUNEd2JybFhsUUV1aG5iV3R4Q3hXS3djU3NuSUdvYWp4ekxE?=
 =?utf-8?B?eFlzTGVhbHBGWHVCU1RtWEFaRGpML0VhWUg4b0hqekk2Umw3S1RIZkFBbXFt?=
 =?utf-8?B?ckFkTUtsNXFwV0d6T21yMDBJM2R3aHIxQVBSckEzMVQ3ZklUV2N4V3RsN0RS?=
 =?utf-8?B?Sm9TcUZHUXl4eHgwS0xkWDNOdkZYa2VvMHg0Mlo5SnRDVk43bXV1TEh4Y0Zi?=
 =?utf-8?B?NDZFWVU5cG5NMjNuQndQdVFZaU5jWTNGQkpnQ0tLeXRYc3ZyN2VIODQyNGh5?=
 =?utf-8?B?a0tWNTNrbXhJVzFrYkRzKzdmbTZIZzZFNEJoWEhkK09oUVRlckJpVTNQamlu?=
 =?utf-8?B?UU5BVXNlc1FlTmpVWnJSL2RLWHl4ci9RZG5PZ0FtS3FHNU5qYVdNendTU2hw?=
 =?utf-8?B?UmJJVUtGeEgxMHZGRUtrWXlwb0hPSDlXVkFaR2UrNC91SnpRWVZYMW1mcUlR?=
 =?utf-8?B?QjhMaEUrSGdENEY4d2t3VmhWZjAzUGE5S21INFc0UVFlMmdUQkVHY0NpSTlU?=
 =?utf-8?B?Q1VpeUpaOWFXZ2E0dmNsYWpON2s3dzFWeDkvcEZ3ZjUveE5RT1pmaDNTWTU4?=
 =?utf-8?B?V3dTdUVZNE82dGpETkJKeGx5N1l0RERTTHZHQU9sY3BtZ3pXUTNIVVZUN2VN?=
 =?utf-8?B?UHJlYkV1dUJaRmw0V1QxMmpwUjNrakozRUZKbS90MWJaQ3A0dEdqeWU4N1BV?=
 =?utf-8?B?a2NWTWRxdThIelU4WEc4VG5BNlNUcUYvL1ZnS2JJS1NUSFY5aXd6ckcyY1R2?=
 =?utf-8?B?TUp2OFUrQTI4cWhNZFBjbEYvY3l2a08zMlNUREtiZEtha3cwMFlsY0dmUGdn?=
 =?utf-8?B?NkhwSHQ1NUNaZ0ErRm03NmhaaVRKV3JFY2FkQ1RoMzd5eStHcVlKNjNaT012?=
 =?utf-8?B?N0phLy9JZkdQcTNPdk50RW5mR1ZhVDdsYitXanF5U3ZGNTFZM29IVk92bFRE?=
 =?utf-8?B?YnJXOHVSeVZZcmpuT3MxcUVITVVjbXJzc2pKc3ZGTUw1d3cvN1dFaWZSV2dP?=
 =?utf-8?B?SXowRUcvYUZPZzZTbVhURXJXcjM0aW5Qakx1SnE5UmhxUWJUZEtHbGhJeVJz?=
 =?utf-8?B?VUNZbEhrckV6SkFORHpOSm1NdHMwTjdCU2ZLYUgvK1E5dXd3M1labTFUWmZZ?=
 =?utf-8?B?d1MwaFRVa25tL0wxanY5bXFGTFlFR1REclUydW5UcmRJZUpWdzVsWHBIR2Fi?=
 =?utf-8?B?bjhQYWJRK1ZxY1NDb0dLdGdIa2luMVcwcThjVFIzWmZaWVBabGRWaStCelRS?=
 =?utf-8?B?R2J3UUo4elBrT1ROOEJUVjUxN2FwU0laTkloYytTcmphUnIxVDdyQkFTVEUy?=
 =?utf-8?B?OStNdHdDNUM1UDhFdHpaK0ppT3dQUWx2ajVLTm1CRHNqZDg1SU1oazN4Z0g2?=
 =?utf-8?B?dmNoc2xyTnl0YlNmWXZua1VpZzljempsc2lOeGNqT0tIMUhDTTRjeUFzWTYy?=
 =?utf-8?B?TGFqRm5Oa2E0Vit1M0NQOW9HbjNNMTVaby80amY2b1dDeVFlYjZka1JCazVo?=
 =?utf-8?B?cWFrbEZwQmllWkRaeS81YlgxTFFnU1VrWjFjSkVuL2JCU1BuQUZDalVkL3Nv?=
 =?utf-8?B?OWVNUkdycU5RRGU5NlQzR21jM2lGLzhiUThES3g0UUc1RlVmZDJmczlxSzhl?=
 =?utf-8?B?MGtMRDJHUnZwbGkwbnV0cmFOUi9RT1lMbUl1eGZGZXMwSWhyYllUNFpmdHFR?=
 =?utf-8?B?VDB1R1pOTXlEc1h6TndjVXpjV0JGLzN3YzJRWCs1R3owa1dzczdteW0vMWVz?=
 =?utf-8?Q?fd+Q84wfLJ5a9d11RHLaFS225cWfW/bq3TIT8Jb?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 259828eb-8c8a-4791-3af6-08d93fc7da97
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2021 15:16:24.9091
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aQlG3QWZ8FUZ4OENAowtOhAFR6GYECATSU+ObCQAdZsCEUuDY1Cp5aIXtiSei1EIzfPK2eThMeZg9LB1GKuKNg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5472

_hcbuf_buf1 has been there only for a pointer comparison to validate
type compatibility. The same can be achieved by not using typeof() on
the definition of what so far was _hcbuf_buf2, as the initializer has
to also be type-compatible. Drop _hcbuf_buf1 and the comaprison;
rename _hcbuf_buf2.

Since we're already using compiler extensions here, don't be shy and
also omit the middle operand of the involved ?: operator.

Bring line continuation character placement in line with that of
related macros.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v2: New.

--- a/tools/include/xenctrl.h
+++ b/tools/include/xenctrl.h
@@ -247,13 +247,10 @@ typedef struct xc_hypercall_buffer xc_hy
 /*
  * Returns the hypercall_buffer associated with a variable.
  */
-#define HYPERCALL_BUFFER(_name)                                 \
-    ({  xc_hypercall_buffer_t _hcbuf_buf1;                      \
-        typeof(XC__HYPERCALL_BUFFER_NAME(_name)) *_hcbuf_buf2 = \
-                &XC__HYPERCALL_BUFFER_NAME(_name);              \
-        (void)(&_hcbuf_buf1 == _hcbuf_buf2);                    \
-        (_hcbuf_buf2)->param_shadow ?                           \
-                (_hcbuf_buf2)->param_shadow : (_hcbuf_buf2);    \
+#define HYPERCALL_BUFFER(_name)                                \
+    ({  xc_hypercall_buffer_t *_hcbuf_buf =                    \
+                &XC__HYPERCALL_BUFFER_NAME(_name);             \
+        _hcbuf_buf->param_shadow ?: _hcbuf_buf;                \
      })
 
 #define HYPERCALL_BUFFER_INIT_NO_BOUNCE .dir = 0, .sz = 0, .ubuf = (void *)-1


