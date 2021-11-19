Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7256C456D23
	for <lists+xen-devel@lfdr.de>; Fri, 19 Nov 2021 11:21:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.227720.393961 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mo115-0001vz-W5; Fri, 19 Nov 2021 10:21:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 227720.393961; Fri, 19 Nov 2021 10:21:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mo115-0001tK-Sj; Fri, 19 Nov 2021 10:21:11 +0000
Received: by outflank-mailman (input) for mailman id 227720;
 Fri, 19 Nov 2021 10:21:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=v60N=QG=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mo114-0001si-7T
 for xen-devel@lists.xenproject.org; Fri, 19 Nov 2021 10:21:10 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 69b7166a-4922-11ec-a9d2-d9f7a1cc8784;
 Fri, 19 Nov 2021 11:21:09 +0100 (CET)
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur02lp2053.outbound.protection.outlook.com [104.47.4.53]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-16-PM4tJkMSMSuCZqGyvd_4Ng-1; Fri, 19 Nov 2021 11:21:08 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0402MB2704.eurprd04.prod.outlook.com (2603:10a6:800:b5::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.22; Fri, 19 Nov
 2021 10:21:07 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898%3]) with mapi id 15.20.4713.022; Fri, 19 Nov 2021
 10:21:07 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM6P191CA0067.EURP191.PROD.OUTLOOK.COM (2603:10a6:209:7f::44) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4713.20 via Frontend Transport; Fri, 19 Nov 2021 10:21:06 +0000
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
X-Inumbo-ID: 69b7166a-4922-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1637317269;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Z0rK9VmEi1jVsksstUzQ7TXl9Hlmh2BpCcX4s9+HTHg=;
	b=GkIZNOP6qlBJWvuvZha9gtShbhXb6y48SJ/72ezzupA9rc6UUrXnlbm/NbxAGaGntsWhWt
	e8AjajJZzSxB7PMd7cS97+5j3XgXppkJwqrWt+1EPYEmfnD4dUbYtqnuXHp50mwV9yZHfW
	bcp9w1qU6GYFOTlHQMQ8SkJttf2ypr0=
X-MC-Unique: PM4tJkMSMSuCZqGyvd_4Ng-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZdDwwF7yPgtmUB2LY1Mq9lo8oMgv4gyOly+Q2n5U/4+8gCvqbjB8RkgfNoVumNnw9gv6Xxv3otJCoZxiyHZis71ZPFSHx6NyBVG5BST/2CxyRL/u73XQ73LGxCQT2bNJE4TO38AzmhkP0B9f+3x/CVEBtgFc5nNZvuvvaOswjAbm02LJJWfWRdLxV4i2ziiHbAv60GtmyorUtuu62DbXEwUhHaj7BM6l+u+tQEE02snw1RYRNiFVrRY9LRUbPzt4bhFQsllD24i2wEWS0K0GiACJVILgrquSu+B026/LOvI5TVUtj1INNSDf8vERxOI6JD77YStOnIsLMqklYwZTmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z0rK9VmEi1jVsksstUzQ7TXl9Hlmh2BpCcX4s9+HTHg=;
 b=iE0rm04yOlcGyFmDfn0Oyde/fslqXg9HUMESizOLSzph+Omr0cU36uaTB70/8OmuUTgGMBi0nHbfrmbebPAd5X8JwbjrclH2Sm+bUqXByAilHj8SRi3936rxXuBlJ0XYZmhh6HRyWp0AJ3sqHVjw7TCiqpdh/kqs3nhwMAOcLgcEALB/1uahFFEH04F9TQSHCzJA0DTkOEv3WLvidFwSwJmpitTxrklSFK80PG7nY8FDWzu9zONxWxmT3Qu97m+60T8CIZVDVi+yTQmdRQoOyBpJGa5q1IARH0/YmFBVjMs/4FqGJX6R8VgCudV29u2uawqL7n/FLIJq5zSM3VXP/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <0ed245fa-58a7-a5f6-b82e-48f9ed0b6970@suse.com>
Date: Fri, 19 Nov 2021 11:21:06 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: [PATCH 1/7] xz: add fall-through comments to a switch statement
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>
References: <f96f014c-057a-80a7-b19d-04d7234d3f64@suse.com>
In-Reply-To: <f96f014c-057a-80a7-b19d-04d7234d3f64@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P191CA0067.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:209:7f::44) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bf198489-fb39-4abd-d27c-08d9ab464c9b
X-MS-TrafficTypeDiagnostic: VI1PR0402MB2704:
X-Microsoft-Antispam-PRVS:
	<VI1PR0402MB2704F65FEE3899CBE6761CEDB39C9@VI1PR0402MB2704.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:196;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	2K0QjACt30PfqxoI6Kx1MCGJBaXNCUMfxFQwYDNxBEeoTfUWSMs1Y7hh3b304tocW3cJ15jiUFWgMqJ09qdAuoY0rd7FpANE8SF/ptM9Z4OnsfRI09npDf0qdg55JV2KUGF6i8fRERbUd6pT/rqjRbi6pXMh8Wt7GoSDgoNYc1usVInubQjKYYmrEof6DB/xy4nyZG30bpSxhi4iZW6eW6a8Lsz4lN36RdwEQkRX8pxb1baE9a9DQtUFFNMdBo/DmV5sFTgAi8qxP2uGBQOy9a+M2Bp0XjsZDOaonlsl4tKjn8UjudKO7P30GBmYKY0WM9EQwYvSiG5lqnX8YcbB1tYWKARenKC14p/CwnoQDgug3jektZz7l0cF3wwTk/Aj3fTRoLaCHvEC9iIR4nmEJD3uD4CubvBcXH+1gInBmc+5FpD20BDZvVWBOn9QwLeBTKl7znf5+8PmFGngwYh9UDDf+b27JaccbwxSeKFYGSyp1QnNPuJDmQDh3nE5yjoboNu2ezbqdT9NFX1TNh9vG2pm8IeJ9hEPxurpHNs35h7dKWmdkmCvGRcJKYm2Ie2BekUhifC+aBnhnpI1tqcBsy/vTNSwBSFnEWV+vhIFiTFHlGNw037za75FLfsb9QogqvQINkJl0VlLnf4oggAcB0PSEQNVDodw1gwhEumrf2cOE8FtNBT16ifYVS1uiPuE4TyhP6TzdDB93fbJirns8QAMJNEM0QkAFIUxI7Qb5bcVIin17lZ4T2x17C7GEJKU
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(31696002)(38100700002)(36756003)(508600001)(2906002)(31686004)(8676002)(83380400001)(66476007)(66556008)(86362001)(956004)(2616005)(5660300002)(26005)(8936002)(6486002)(186003)(316002)(66946007)(54906003)(6916009)(16576012)(4326008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZTAzd3lRQ01xWGtLQ1JDeWdXN21HU1F4UTNUN3R6emNOYUU2dXdNK0xMd3ph?=
 =?utf-8?B?clJaNEZTWE04SnAraldOUWp1VEZpNEY4WFExQlNYaVBoN25mNitTQlNFQWFa?=
 =?utf-8?B?UmU4ZGhyVm0wVHlGeUhMQ1hhYWRLcmUycmRHeGdWUzhKWjdCTmxWekNNRE8x?=
 =?utf-8?B?elJycGtqWWRLcEQrNTFNOEVHbHV2bWI5RThsVUsreFZwRUxBSXZ5emJXWXd0?=
 =?utf-8?B?QjM3SU1adWpxWTlWVlJpY3k4MzZ4VWVFUlZFVURMTGVqQ1U4TEZVU1RFbEx1?=
 =?utf-8?B?RmdoTkJnYllVQkJjbXFYaWdNWVJJbnh5VUxuaTVHNDRRdTlydXYxVExQdWx1?=
 =?utf-8?B?WUVCTHpCRWJtc01UQlgvRDZZSmpodjZVaUhYTUVCNkhNYXphZVNmS2tubXlJ?=
 =?utf-8?B?NDZ1eDJ3WU5LalAxdlBRQVk3SjJGZnFRNmxzaWZPczcwa0E3ZzdVcEVESHY2?=
 =?utf-8?B?dGFkK2lYUmdQNVBKTWdhd2JNcDFYU3FXK214UHpsUzRvUnVOd0g3bThKRjB5?=
 =?utf-8?B?cUhiaklwNnk2bGJyNEZncmFUbWIwYTNPNHNWdk5nbUdmeENqYzRJVnd1eUZv?=
 =?utf-8?B?dzBvdjJVUlBDUTZuejlnOTBodXRoai9WN29ZSVpRN2FmZGdjMTRBYTJwK2xR?=
 =?utf-8?B?U1NIRHRNV2c0MjU1a3lmdEtrSEdlOGsyZHJyUExYZkVZY1lIL3NYMXhoU1c1?=
 =?utf-8?B?WGZaWGVjS2pkUStQcjExUTFOSXRrSURKbW1UV2xmeHNZU25VZGliUGtabDZR?=
 =?utf-8?B?YjYzWnZWd0ovbXNOY0ZDU0RsMTNBbTVVSWpIck1LcWtBZndCQU9tVWxCdGNl?=
 =?utf-8?B?V3BGTDhESGxwdmwrcXRRakFBT1hRaGVNaHJJenZ3Nm94ZWJjZGt3RXFYR3FZ?=
 =?utf-8?B?NFZxU05RVlFGNHN6RlRiT1h3SkxzRUd1aFB1VTNMZmIxTDBjL0R5Tkl3emcr?=
 =?utf-8?B?UjdOZXRXc1ltTU5jaDZOYlJ4VzNSM05mYUlUKzE0MlZUWEhzcVpzRCs3Unhs?=
 =?utf-8?B?RGRrTE9ZUjlSS3BTbTJ6Y2NRTFVhNlUvcCt5UVh6U0F0ajVjNHhtY1krSXVt?=
 =?utf-8?B?U2NIQjZ2VEQza1dGL1hIbEVKQWNjWUg1OHAvWkZhSTJQd1hSNlVmWkFZL2hI?=
 =?utf-8?B?NUhCcXJlQ25ieUpsMUtiR21ibHRTSVlnYlI5OFppbnZJSVZVY251eFlYWCtX?=
 =?utf-8?B?MTlIc3dlUTFZT0tTQ09Uek01dXlLTm80Rzc5d3I2dFl5cS9NM1VzTDNRZE1j?=
 =?utf-8?B?L0ZsT1ZUeEJva0UzdVFqdGsvUVlRQ1BiSU9YWkFkS0pLM3RqdjJ0Ri92c3Bo?=
 =?utf-8?B?eHc4YityOHJsNG1YbWFYZEdkeWNHU2taTXZkNFRvUzB6ZkFQMVk3MWY5VktC?=
 =?utf-8?B?T1BtbzgxRHhqWTRZc09LUFRyVW1DZk5NNktRK1h3QWZpZnBmVndxUzVKemxR?=
 =?utf-8?B?WlI4ZFEwQXE5ekZhZnJyc2paZVpIZG1rczMwRUl4ckdNTkNsU1duL1loRGJr?=
 =?utf-8?B?QUpMUkk0M1lKc3FVbTJuV2R1ZU1nT1NNZ09TcjlxQmN4MEVXdWJqR3lMRi9L?=
 =?utf-8?B?L0xHbHhITTBhVzl3MXNRcGZDL3FMOTQwR0FLanNVNXR0dlFwd3QwUkdFbGRj?=
 =?utf-8?B?ZFUvSzE0QTAvdThZbmFJMWF2c1BBQUdkaVhGb1MrSlU4WnZyem1lUVNxQWho?=
 =?utf-8?B?WTh6dE5xUU5VL3QrUFg0eGJwaTFIVGp1SW9XUk41VE0xNzEyNmcxV0NCU0sv?=
 =?utf-8?B?Zy9TQlVPaFpBZDNjWWxMMmg3NTg0a2RxZ2l4bDNKZndTOEcrSDF5anJERjNL?=
 =?utf-8?B?SWp6SFJmSm41WTVyUmh1MER6emd3ZGpkSGxwVUdaU0hpYTFRSkdKdEM4NmtO?=
 =?utf-8?B?RDlYZTJxbHd0aGhmTHRtdHJXYk5FYStNRWk3RVZGUlJGQTlkaDl1Sm92ZjVI?=
 =?utf-8?B?MGxpOWNRQ1A0SkgxeVV0WGw2OGV0ZkpSZlRzNndVNjFMQlVqRm1jcDg1RE1C?=
 =?utf-8?B?eFdNNWhud1NnWkZjZm12bWl1cythcVQ4RmJucXdLZmRDYUltaXNEU0xhemQ5?=
 =?utf-8?B?UHBGeDdjWXZnd1I2N2RoWlRmZFRhcXhkeElxSDJ3dmRIYjJSWGRmM3ZkUWgz?=
 =?utf-8?B?ZDBKWmVkNEw2ZGF5UDFxa1Z1eE80VzNNc3dJK1J6ZUNtMVkrOUJwTDBqaTBF?=
 =?utf-8?Q?U4n0cLTn23wkqI8GcMzgqvI=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bf198489-fb39-4abd-d27c-08d9ab464c9b
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2021 10:21:07.2275
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WkmYN1gGkjSfwEywigRb5Pc1IamV2xsx92mtZ9ZlV83hSGrdEVkb9cNY3simB2NBxJkRVvukl5rsgISvWQ0N6g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB2704

From: Lasse Collin <lasse.collin@tukaani.org>

It's good style. I was also told that GCC 7 is more strict and might
give a warning when such comments are missing.

Suggested-by: Andrei Borzenkov <arvidjaar@gmail.com>
Signed-off-by: Lasse Collin <lasse.collin@tukaani.org>
[Linux commit: 5a244f48ecbbd03a11eb84819c5c599db81823ee]
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Linux has meanwhile further moved to using the "fallthrough" pseudo-
keyword, but us doing so requires the tool stack to first make this
available for use in at least stubdom builds.

--- a/xen/common/xz/dec_stream.c
+++ b/xen/common/xz/dec_stream.c
@@ -583,6 +583,8 @@ static enum xz_ret __init dec_main(struc
 			if (ret != XZ_OK)
 				return ret;
 
+		/* Fall through */
+
 		case SEQ_BLOCK_START:
 			/* We need one byte of input to continue. */
 			if (b->in_pos == b->in_size)
@@ -606,6 +608,8 @@ static enum xz_ret __init dec_main(struc
 			s->temp.pos = 0;
 			s->sequence = SEQ_BLOCK_HEADER;
 
+		/* Fall through */
+
 		case SEQ_BLOCK_HEADER:
 			if (!fill_temp(s, b))
 				return XZ_OK;
@@ -616,6 +620,8 @@ static enum xz_ret __init dec_main(struc
 
 			s->sequence = SEQ_BLOCK_UNCOMPRESS;
 
+		/* Fall through */
+
 		case SEQ_BLOCK_UNCOMPRESS:
 			ret = dec_block(s, b);
 			if (ret != XZ_STREAM_END)
@@ -623,6 +629,8 @@ static enum xz_ret __init dec_main(struc
 
 			s->sequence = SEQ_BLOCK_PADDING;
 
+		/* Fall through */
+
 		case SEQ_BLOCK_PADDING:
 			/*
 			 * Size of Compressed Data + Block Padding
@@ -643,6 +651,8 @@ static enum xz_ret __init dec_main(struc
 
 			s->sequence = SEQ_BLOCK_CHECK;
 
+		/* Fall through */
+
 		case SEQ_BLOCK_CHECK:
 			if (s->check_type == XZ_CHECK_CRC32) {
 				ret = crc32_validate(s, b);
@@ -665,6 +675,8 @@ static enum xz_ret __init dec_main(struc
 
 			s->sequence = SEQ_INDEX_PADDING;
 
+		/* Fall through */
+
 		case SEQ_INDEX_PADDING:
 			while ((s->index.size + (b->in_pos - s->in_start))
 					& 3) {
@@ -687,6 +699,8 @@ static enum xz_ret __init dec_main(struc
 
 			s->sequence = SEQ_INDEX_CRC32;
 
+		/* Fall through */
+
 		case SEQ_INDEX_CRC32:
 			ret = crc32_validate(s, b);
 			if (ret != XZ_STREAM_END)
@@ -695,6 +709,8 @@ static enum xz_ret __init dec_main(struc
 			s->temp.size = STREAM_HEADER_SIZE;
 			s->sequence = SEQ_STREAM_FOOTER;
 
+		/* Fall through */
+
 		case SEQ_STREAM_FOOTER:
 			if (!fill_temp(s, b))
 				return XZ_OK;


