Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C61FC463B71
	for <lists+xen-devel@lfdr.de>; Tue, 30 Nov 2021 17:14:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.235302.408295 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ms5m0-00085V-Mt; Tue, 30 Nov 2021 16:14:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 235302.408295; Tue, 30 Nov 2021 16:14:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ms5m0-00083c-JY; Tue, 30 Nov 2021 16:14:28 +0000
Received: by outflank-mailman (input) for mailman id 235302;
 Tue, 30 Nov 2021 16:14:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=AOGb=QR=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ms5lz-00083U-6W
 for xen-devel@lists.xenproject.org; Tue, 30 Nov 2021 16:14:27 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 967adac4-51f8-11ec-976b-d102b41d0961;
 Tue, 30 Nov 2021 17:14:26 +0100 (CET)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2171.outbound.protection.outlook.com [104.47.17.171]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-25-wvAQATxAOHO1TxYpxKA4Xw-1; Tue, 30 Nov 2021 17:14:24 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB6176.eurprd04.prod.outlook.com (2603:10a6:803:f6::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.23; Tue, 30 Nov
 2021 16:14:23 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%5]) with mapi id 15.20.4734.024; Tue, 30 Nov 2021
 16:14:23 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AS9PR06CA0337.eurprd06.prod.outlook.com (2603:10a6:20b:466::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.23 via Frontend
 Transport; Tue, 30 Nov 2021 16:14:22 +0000
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
X-Inumbo-ID: 967adac4-51f8-11ec-976b-d102b41d0961
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1638288865;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=5sUCnrsINgRusgFl/CuhiSxJH2T2g8flT0r7Ag8j8/Q=;
	b=ZU56svzlvsoTLnF2a9Cs9SJ/dlCB42S7AZoP7gGOq/xYxPMbXMBM+9lNiuqKkcy865syOo
	qicZioFPFT9Nj8D/sMQxYWlUMICvqB+pp6YYYt0OdbSFrJKF/FiY7mqyRd965gROf/YKYs
	6AScmSkM7tdbCZUL00pICQIWLFTt71s=
X-MC-Unique: wvAQATxAOHO1TxYpxKA4Xw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U/8RFnPMKdoUT7woJLeVcuEW7AEENM7V7CEDP0B05eCwlGH//fqOZ64WYA2YgKSQmAHDWrufobbiMMW72Av606qYMsmWjRlrmxnZiG118SKC/XoKwcBansPIyM2Jdl1OAI8Q9HeMPqNIvRpvax1HRg+ijxhG/LG8HkulopZ7m/gYuqb8TXQ3gI94jxs9E7jZPJXcG9ERGEeMk5JbSelwlEH2Es7bQExlRL7lM7S5TqFSF6dVqSzeIFBAI4QGhORc3/lL7stSageOnO56Uie1QE8h3kZ2svOG2Jgei4orMlsJQNqTqxHO3S9JccrRcKe4ewCH294UrJMzD7qIoDXPMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5sUCnrsINgRusgFl/CuhiSxJH2T2g8flT0r7Ag8j8/Q=;
 b=IgUPcg/0kV/aOCs+wLpBuC7Amw2l4DXhTtx5MGZaPY523POn/WSLQyHQcgxSypc4hXNwMff7iUlOiwjjioCZWmQ1zAwTqe/QhOW4hiPXHz8wzR+Ci2URomJ4EC0ghMppAekQ16X+6qgtzQUiqABWKZtel9toFTV7mzwFingy8SiMyHatSMBOFppaKCo27/4yLJT+R2bx94K88uNT1wAn2OCY1OVXzu29gxsaUJfGqy+bQUMdkDYp2aXgn5IjaiYRduWf6KuF7rfgFWEAws1Cv3p02o9tKyiCYiQMJF559fz0a4MAqrI8OzXdA12loSoXO0FHJxBJ2VAnIxiOKa9oMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <fff23663-b114-0726-e37f-06461b5ea63d@suse.com>
Date: Tue, 30 Nov 2021 17:14:21 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH RFC] SUPPORT.md: limit security support for hosts with very
 much memory
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0337.eurprd06.prod.outlook.com
 (2603:10a6:20b:466::13) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9618dfb6-9496-4bca-6096-08d9b41c78df
X-MS-TrafficTypeDiagnostic: VI1PR04MB6176:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB61762836696366B3F70F4115B3679@VI1PR04MB6176.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	zFJWM0guTxWmIr6ISxCQTndVeYV9Rd+VGc60bovipyIGL/ZPE7r6XhtTPBOWxFgJdIpxMR9nZ3a7mYJd1f+sLI3wHlPIDcgq+HP/yDNOIITifL/4YPgcRomz/QiN5YfZu8SNXJ5WzxUEwuy0tgXnRLbq+HGASlPFUVs/Zhj72IuMKuxKvYYm3Sgwz6+uLoWJ/vhpRq85qNKeaA2tGq9CTCIBqNcibz5N6OjxT40rJtTDsutydA3hpFL9HbDv74LlEEYD9AARiZ1Ong9I1qhVBOm+LwbZZ0WKkzaTuCIYxgJ4TwIVvbSsZe89paLil7ZoMQfr9/u6qOs88WSDVIgGSEH202u6dezXv38l1IVZeQS7Oeq7m3OaiR1SLwogC/CsgAs/fTodKI+Kq63Wowra4b5HlWzzJgM9D4GlGd7rpmC2rY0MbnAz1N7n77+XVsF9BE9oxLDSR222jdD6z8eL9QhZLoabt0kC3JxtieL6LeZBpXIeki0uohVyY+XdwGM0fDg90kKi+xO7qCSkJPt5TUKEdiB+oNh8I3DspWS8gOKrY1l4kJ1KIksMM+NaZIDZ/7THGlg5igUwtBmi76XWlANGfaDxcSHbOJGCIPwnLZlt6qhuQL1/+OIrMor1h66NmwQof9NBOkMJscGwVwzzCE8U7J34v5yxQKvvWzZef3Qe+FdUVImExN3ErJa0uZ0xWDJSTTfdk+yAEh7u+5HD1q0ac6As5acPuigjJHzzKsktIKq2Lbj3azh4f0Mf2jZDIeLISuieFIqqnhw8BSRbDRMRj9jL9wcUZB3zSMoGbIAgL+JaL5MzISKv5VO9IQJq
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(956004)(2906002)(2616005)(66946007)(66476007)(66556008)(6916009)(8936002)(31686004)(316002)(5660300002)(83380400001)(186003)(8676002)(26005)(508600001)(15650500001)(36756003)(4744005)(54906003)(16576012)(31696002)(84970400001)(4326008)(38100700002)(6486002)(86362001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UXNZeGpCOWVuRFdvUERxeUorNElzS0YrWmh6b1huSitzRXcvSFFqcGwvcFlB?=
 =?utf-8?B?K1VKcnN4YkE0WVFXelE5anBnb0hURFZGUy81Z0NpMlJqQnowai9laGR3R1di?=
 =?utf-8?B?WWRvT3hGWTZmUFMzVnlqY2hSaTc1VWZvVHIyclk1T3FwZlNiOXZjcElmdk1E?=
 =?utf-8?B?UGwrR3lxcVRma2ttUzU4WSt6TWM5UlVpd0lwWkh4VDZ3bTR4MHRzeXRkNi9q?=
 =?utf-8?B?bElFSERrTnhmbmVSUlVwdGt6RlJoU3BvVlJjYXhzb3RiMmg3NnE3ZVVYWEtq?=
 =?utf-8?B?Q2xKanlrY0hiMDNXb2VoUisxYWIzbEh0RTRIMnJhQ3BQWDB1OW1LTGhGa1RZ?=
 =?utf-8?B?cVhVWFVBSEhwWGNrRGYvQ0lBOW1BakdMTTdZL1B4UUF4OWdPRFdOaDNmd0xr?=
 =?utf-8?B?L25XZmgyWWRzc2h6aTlZUHk0RXMxSit1Q3NKQ1FCTkZUa1pxSVViOEYwTG96?=
 =?utf-8?B?ZEFXZUI1aVZXc29BYnpXQnhXVkp2RFpERWw4ZFRMUTVGTFNpQWE1UlZEeE9Q?=
 =?utf-8?B?bVJWRGVsM0YrajRvZjZGTWVRTlo5dUc5dWxwVkxubXAwNmRaSGlZZVdFMHZV?=
 =?utf-8?B?bm5ZcWozNGdYVzdocGp3ZXFYVjF4YnMrZ05KRXFmM05oYUZ0MUZ6VHhjVlZv?=
 =?utf-8?B?OHdMbkFuaFdMMkFxb21GKytObjNRZjRuSGpTT3ZISHVXOUVqVWhzaWxlbjZW?=
 =?utf-8?B?UkxpcDJjRjYyUXBUTEE2ZDhNV3NhMkdkN1pIU0NLMFJ5UjJZQzVESVdRSVhy?=
 =?utf-8?B?YUQ3MzY1STFYWUZmRXlEc3M1ZTJ5TXJqS3dXVmFOT0VZUWIxbjZHdjVkRllM?=
 =?utf-8?B?VmtMNEs0T00vTlp1WDNnV0pmSGZqa1VDa0k2ZEJicWd4RU04NUIxWTRVYXRp?=
 =?utf-8?B?SmwvOHBFRElkR0U3ZStPWjVBSk5vbDAyQU9sbjA0N1RTRy8vWFA1WG5nK2c2?=
 =?utf-8?B?d2FDR2tzeCt3VW52QlNnQ1NWR0hiWnE3NDFidEhZVUt2K3d3d05zd0l3Wi93?=
 =?utf-8?B?Unp0VC82dmtsNE1kQTdzS2JrODU3MHBTUk5aMW81TWozZkRCbnJ4bXVMS0xJ?=
 =?utf-8?B?QzFRdDlwV05hUmNuWGR0RkJtbTB3M1c5R21nRlhoT1AxVlFROEc5TGVmS2JI?=
 =?utf-8?B?MENUaHk2aFpEZHhSdVZkYndRbjFGemwxb3VOck00VEVtRFRjUWE4QVduZXBz?=
 =?utf-8?B?MzRvVlFuQktzWEg5elRCUXpyc29aSnRueXJWRWs1TzNlNUtyYjFJWWorRUVW?=
 =?utf-8?B?c0tFR2R3aGxNMVdSQTE1OE83bFJ1L09YVW4rRnVYaGtQeU9UdGtNV1ptbFZj?=
 =?utf-8?B?cCtmbHZFdEhDdmRtbnhXaERLV3JsdGY1QlRMMFNQUTBqbnBsWHVwbkxzZUh2?=
 =?utf-8?B?KzMrRlNVWjZkU0VyaTNTWGl4RzRKMGNoVm9FbTVha2xvaVU2Rkh4UlFENFNn?=
 =?utf-8?B?Q1cyYlBsKzd3Y3gvVHlnMWlEZ1dlNkVxNm9Ta01yc2ZBQWQ4QXVlRHZ6REY4?=
 =?utf-8?B?cHdjNy9taUFiajVhNWxxZmtBVlZpeWlCVUpyQmtFQjZMbmxINkwzSkkrWnRa?=
 =?utf-8?B?TXBsSHFycWs1MFh2TXRiSlF2Mng4NlNseVd5TWl4M09ta0RGUkdocHF0UitC?=
 =?utf-8?B?all5enIwenB1bWQwMzlwQnRpSTZuZWkwYVhDK2xQbE9uaWVCVEp4OVp4ckcx?=
 =?utf-8?B?Y2JGcERQUkVwaFNzdXgwd2I2VVl5dTVRaU00Q2dhUzBLRCtNdk1XbDF1TnJX?=
 =?utf-8?B?Y3VCNXNmNDl2Q1puTXJVZzVIQ3FheW4xOFJ4ZE11MFlhOFNjRUVDTzV1SlFH?=
 =?utf-8?B?U1NMczJoV3VLMzVOZ1ZXQjZJbi9aRVcreGJxUExEWnJkbmtLa2d0U2VRUFp4?=
 =?utf-8?B?UlZnTWxkZ3R1WnU2OXNvRkM5aDhFT0ZLZnpNWE8zTjdQc2MwODBaeDlnRktO?=
 =?utf-8?B?Tjlnb29FZkZqL0ttTHJHbUJ1NG5WWk0wSnlXUExaVHZFTFdIUzFYcGM0Tzk3?=
 =?utf-8?B?amd0UjVhYkR0NVpRcHBFQ3c5d3ExSHZONTlKaUNoK2NUMkVXUkxHRW8wMjlD?=
 =?utf-8?B?OGVQOE40a0lwZnpFMnU4OHJzV25CQi90YUxDTFNUTFFZejdxNk1Hc3M4YzZy?=
 =?utf-8?B?TUZoajRtTjV4RjNFMTMrRlUxMkVtYkZ2TWI5NGkyL2NXZ0ZHeVZDcGlPc3Jx?=
 =?utf-8?Q?VbN/rVxPGzuTetXyej1ypdI=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9618dfb6-9496-4bca-6096-08d9b41c78df
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Nov 2021 16:14:23.0934
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oGRWX4VRcFfsviGwBN1Yqr6blrWUitdumw2Mw3fCE9z2uwPMCWlg6unEyIW3x3sgsZKqrPyFS5quPE1rwUwsww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6176

Sufficient and in particular regular testing on very large hosts cannot
currently be guaranteed. Anyone wanting us to support larger hosts is
free to propose so, but will need to supply not only test results, but
also a test plan.

This is a follow-up to XSA-385.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- unstable.orig/SUPPORT.md	2021-06-25 11:19:03.000000000 +0200
+++ unstable/SUPPORT.md	2021-09-10 11:15:52.270364645 +0200
@@ -48,6 +48,12 @@ For the Cortex A57 r0p0 - r1p1, see Erra
 
     Status, x86: Supported
 
+### Physical Memory
+
+    Status: Supported up to 8 TiB
+
+Hosts with more memory are supported, but not security supported.
+
 ### Physical Memory Hotplug
 
     Status, x86: Supported


