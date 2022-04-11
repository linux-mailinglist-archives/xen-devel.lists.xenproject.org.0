Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 784FB4FB7A7
	for <lists+xen-devel@lfdr.de>; Mon, 11 Apr 2022 11:36:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.302773.516529 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ndqTE-0007F3-Iw; Mon, 11 Apr 2022 09:36:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 302773.516529; Mon, 11 Apr 2022 09:36:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ndqTE-0007DD-F6; Mon, 11 Apr 2022 09:36:28 +0000
Received: by outflank-mailman (input) for mailman id 302773;
 Mon, 11 Apr 2022 09:36:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1peA=UV=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ndqTD-0006iD-Tr
 for xen-devel@lists.xenproject.org; Mon, 11 Apr 2022 09:36:28 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dbe7b3b0-b97a-11ec-a405-831a346695d4;
 Mon, 11 Apr 2022 11:36:27 +0200 (CEST)
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur02lp2055.outbound.protection.outlook.com [104.47.4.55]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-39-i6JRZvgnPVO-5PC4T0Fx5g-1; Mon, 11 Apr 2022 11:36:25 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by PA4PR04MB9639.eurprd04.prod.outlook.com (2603:10a6:102:260::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.26; Mon, 11 Apr
 2022 09:36:24 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5592:2abe:fb16:6cd1]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5592:2abe:fb16:6cd1%6]) with mapi id 15.20.5144.029; Mon, 11 Apr 2022
 09:36:24 +0000
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
X-Inumbo-ID: dbe7b3b0-b97a-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1649669786;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XiXlRp8KAwreSj5L/XmU2xaUcy67hxd0OIDtCutKoAY=;
	b=IB73sCyy9Y8rl4eskM4wMIbuBbiKU6jnHpyg9BGiwdypq8ERuUyrEMpQgSuB2k01rg+3IZ
	rAb8ItcJQ30j+4wumiUWu1IB7u1LaOpxzzgArED+XfS0RWLMtBXKxuMfvpHhKlg7Czontl
	hmhjqt9GmJspgxTndg5/GwqUAevz92w=
X-MC-Unique: i6JRZvgnPVO-5PC4T0Fx5g-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a7EfJJrsByPSCYJnSK9bd1I3HAaWUpbVbi4B/UvPjPGZ0V2E1xUK7CtFKtCFNF7KM/DykFVISRruqhjRoWXmzWXS2ZN50nZ23B5kbqgCtKqctD4+u9OXGah+9brw6sKjtIFZj3Ykzsa+RVVx3FqQH2GMMZNMJXdR2qO42IaTedCd426vEDPbN95u2TqQhLFNoyPhukd79DOaiQ2RdyKYqnPhEnXFzrHaFhKlVKWnVp+UKoy4mnJNiucnNhlP4PSdAKL38IPd0efZLYcKqgyjvtXvISyTh7gYAeSOi6zwE2B+6Xgb5tG7jBUIwx2zZ/KQgcJitcydG91JfpbmM50d4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XiXlRp8KAwreSj5L/XmU2xaUcy67hxd0OIDtCutKoAY=;
 b=kmOSpa/UkF75vWDXm2tWFl88lgghOCxyQfAChE1htTjqQVDiTt4L9qZQOZ9bGrGWQmXCLkTXCs9Hm/+h9lepUyorhuktdo/u5+RQfVYeOTrQYD1S/XyboK2FobiYrNQKxyxfI/1FhrnPYpk257nL6gsqoYsyR2/sOv5MQ0eIc5FmB7s9VdrPRv+ILeZ+AC3QX67URQD+ETcNbbAF3pSdI2mJ8ltPCcExMAqPmCHnLr9TZ/pZMvODkNxTxBqwTsWjQ08rq3+ldoua3PhskQqRJGV1bnU8IWW28HV3i7J+HQizMyzEZUU0h3Ui8qaXxp33WTtD5/ILtfvdMVTlTYmLdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <ad944163-e8cb-6ecc-7e6f-400f9e8cd4bd@suse.com>
Date: Mon, 11 Apr 2022 11:36:23 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: [PATCH 2/8] VT-d: drop ROOT_ENTRY_NR
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Kevin Tian <kevin.tian@intel.com>, Paul Durrant <paul@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <4785ba7d-8759-7441-4ac8-0866489707b6@suse.com>
In-Reply-To: <4785ba7d-8759-7441-4ac8-0866489707b6@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P195CA0041.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:209:87::18) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4f5823ed-a78f-4cf3-361a-08da1b9ebec8
X-MS-TrafficTypeDiagnostic: PA4PR04MB9639:EE_
X-Microsoft-Antispam-PRVS:
	<PA4PR04MB9639C7D7B83F1DA40B9FEA8AB3EA9@PA4PR04MB9639.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	bdHNKV9LAf9FsUcMkxqWWH+0rCP7H3FI+osryLp/n7jsy8vbeVSWcVli1wLGhp2oAa+yhaTsu8RUGT0dv+BpH195ra+8SNt5Tgp+t/S94p0JBOAJlgsagvslxbMShwXPikxLWGKHPaCJfHpqlDwkxLgKCla55KfCv/uZslIqnKD6aOiMK+VeH8W+atWx0ZoGYstQir92Eu8+UYO4mrGA/yUrimMSU0Qb+SOiJqs+B6V3cv9/U23UgRKTmst5KIgg2Wce5UByD5RrJtCi7jFzm3sw9iJlh92qjqOd1SeqheMJq+DR3Ac5C9CmOHemVOekj4A9pceB7zfOTUexU0Z521bVlG5/YKsmdA3USsNvAh8NpYq28iCc1ktK10b9tKd7h91gyD8u73wgu1/9/vBDFtakQ4v8mzwJYau+6eFNiDF0CgUGvusKnLBWjGBnNGb57dYMhXH3gVPTQ1+glZndLsfL1RRYPVcctCjAEMrRjz1XBUrhnnO+kZ3gihBFaNwsRmzagoNKzQ2Y/QJHTCfsNIXxQHGnLsag7Y/HQmMpbzpq78GnCWxzE5ryap5KevYewmkQw9aHTOINv4YH86KSqDIev+TXA05+oWQq+hke+E5h9VmPjbYXGpjXMzKbuEwxfR6f6sUtXkSBDI6LqMnEZxofovFGKbmQutJvnUrixofyu9lWW0JxY/nTTOSaXnvQVxgBq2SlHpSDHHa+HLEVPxNqiV8Zzo20syeq2LubnNyjjfbXRcPGdbcyvmNVwlSt
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(5660300002)(54906003)(8676002)(66556008)(36756003)(26005)(2616005)(2906002)(31686004)(6512007)(186003)(316002)(31696002)(6916009)(508600001)(4744005)(4326008)(8936002)(6486002)(6506007)(66946007)(38100700002)(86362001)(66476007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dEEvc2JicGp0bkM2WEM4WDFMQ1BwSTRUSWx2eHF3c0o3RlN5RUtLVVhZZGVx?=
 =?utf-8?B?TVdBMGtmc21oa0c4ZGxNVkREbWsxNjdSV0lyZDhUbEgrU2VWUkc2b2treGJL?=
 =?utf-8?B?T0Jrd3NpQWgxLzBmSDE5bTlqcHlkbWYvS2l3UzdBakRLOHgyU1FPdUEwYnRk?=
 =?utf-8?B?WlJOVmFQZVFIYWVIbnU5UmRvMUg2SmdHeHBsN0dDL0VLZWxwSFg1Rnd4TTQ3?=
 =?utf-8?B?OE8yYkFsckxWRmZpZThBYmRxd29Db2Q5djVBUjBOUmhwNHRWYmowbFh6blRp?=
 =?utf-8?B?NFoxbHVXTFhaMHdRSFJ5WFh4UVlRU0lpK1daeUNTbjdodWhMWDRUbUNWZVpE?=
 =?utf-8?B?djhTMmFlV1pMWGRrWURsa01VcVpoOHdYWGxLcXpMR05vb255UmtveFBpamE0?=
 =?utf-8?B?Vmo0VmVqOW00Z0ljUWh1MGRxcE8yVlBRVjZoWGJESzRuWVo5Qmdad0ZwM2Za?=
 =?utf-8?B?NDBPZG5kY2VZdkExUmVURWRhcklVYjBYODlRVm5jRTY5a1pTMWxtcURRcTE1?=
 =?utf-8?B?bFR1SXZwYXIxUXd5dWdheUVqdHd6VWZWam1IRW10YWNRZFppS3labjRLeU8y?=
 =?utf-8?B?MXJYMjZiN3d3TDBVVXNqNmNvYmUrMGlnZTB6TDNwVkFjOTRFL2tzVVN4Q2lB?=
 =?utf-8?B?a3pPc3VReGdlTnNHV0JOb0oxbHZQMHh0QjlEUlFGc1dqeTd2MEx2WnV4WERh?=
 =?utf-8?B?YUU3S0k3S2VxNkQwczgzL29KdVRpZmlSUU0rajNaRlN6WmNWOVYveloyTjJh?=
 =?utf-8?B?VFBJYS9FVkJqbzlZRjEvOHB5VWgwaDRCc3cwVGloVHlwNkZCZEoyenpQeVNQ?=
 =?utf-8?B?R3QvYVpEcWRWUGFtWkx0RHc1aTU2cUhCR2cwTGl4ekdqZTMxWnNZZE5abDVz?=
 =?utf-8?B?V3J0c1JPQlA4TUIvM2NuTmE4WWpEcHAxU0FCUFlMaEJFRHE2N1hFVGdiczB6?=
 =?utf-8?B?U2VuNkh0Qkk5RENoS0R0QUdQeDdUUm9RSmZFN0tmeG5aZXZwZVF5Z2I0WUto?=
 =?utf-8?B?VUhDRStCMis1TE9RZWhYUHg5UEkvQXFEY1F5VEdlNXJUUjBCSENtZlZBeVpP?=
 =?utf-8?B?V2x5bDBOQUdyM1NTKzNaZ1ZzbHNZVGVwNlhWdUltTUNhdVB3T3lyZVNHd3B5?=
 =?utf-8?B?QU8wTjZOYjV6a0VvcStoYU9oU0tCcGMydnYyT1ZES2JBbitJejk1S2lVOG1K?=
 =?utf-8?B?dVY3Y21WSkZYcjc0WlEyT3FiM3l6Qm54UzVieW9ieTB0TGtUektJUGVkakdY?=
 =?utf-8?B?aytGSTNNWGNIQnRZWDdNTTBBRU1NcmpLcEoxOWNPWS80dms1cTRLZGpzODhq?=
 =?utf-8?B?anpRdEk3Tm0ycFZ4OGRXUVJVKy9rU09ZUmp3ZXpJNytNdS95ZEFGeUpzRkFu?=
 =?utf-8?B?ZnRtUXp0WGt4R2FRNk5aY3U5UEV3WGgyREpYVytHVnBXWTJGcDc5QlYvak5Q?=
 =?utf-8?B?R1JUK0g0WXlhVXFjcFEzWFB5eXFRRGhzbWtTaFlpU2VxbnN3WVJvRzBoaCsw?=
 =?utf-8?B?eG9ZY2Q2WUt6SmtIbWVSbGJFL3hia2E3SFJURkhpK3JDRWVuVVVpWW1rVkdh?=
 =?utf-8?B?NVI4OVNZQVp4cFdaSFNhU3ZOMkg5S0FYSFF3azZrTUtoWmxRWHBjSHJFeng5?=
 =?utf-8?B?Q25NVnNsVDFYV1ljZ2ZsTTNWa0hkZmZqVVpKSVNtQWNCS2x3N2tmOVh5NHFH?=
 =?utf-8?B?bFdUVXhWbEJOVnMyNnd4ZDdSNEViZ0RlSlZJV2FKeFB5aUlQeWZ4V1BXNU82?=
 =?utf-8?B?eTdzbnJyUnBNelZTRmt3MitBOFF2U05QYUtCc0tId29sdGpCWTRKb2F4bmRj?=
 =?utf-8?B?N0VyM2V4bkYwSVRDR3JITFkrYk45OGw2TlU2alFFbUxwaEllc1VPeVNxSlJo?=
 =?utf-8?B?MU04czNBN0kwTFVIeGlLemxDdFQvVlc3TW9hY3o2WXQrbU05Q0VsVHVoV09G?=
 =?utf-8?B?QUp1L3pTVmpORGNxU0pzejlSZmZnTUxJY3hkdCtiaWloNUdYbVVINCswZzlp?=
 =?utf-8?B?ZU1BMnVMUHJLb2l1U2J3R3V1MEdFQ0FQYnMrYUFsdXR1VHRvQzhPeFpRNjM3?=
 =?utf-8?B?c0xhWmxZeVgwOEV2UWNFWXl1cStlZjl2dlkvdkRlQnBXSVJ5M0RsaDdnWTZF?=
 =?utf-8?B?aE9uK2hHb0VLKzl4Uk9ITVUyb3I4SE5XZS9WZUZ5NTFER1I2dzluekZQdHgw?=
 =?utf-8?B?Um0wVHp1TXVRV2tPb3NqZVh3cjBkYjgzaDVDRlU0T0I3ZWhiVHMrYjdZdEhp?=
 =?utf-8?B?R2wwU0F3QVBXZ0NyMlFTTENQZHBUMjNUbXR5WGJBMThGRDhHYlE2QjNhM3FW?=
 =?utf-8?B?NmJDK002bm1WTStBdVpLUTRrbHBDTVdDSTVmbzAyQW02bWxBNHlyQT09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f5823ed-a78f-4cf3-361a-08da1b9ebec8
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2022 09:36:24.7952
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5LhjsT5Kxk95Y279pXdpxZHXhnbTh95djOtli2w7Ccg7ou/npL23oteRAK2TIRbvk7vCYquBbu07ImMuBnLiVg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9639

It's not only misplaced, but entirely unused.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/drivers/passthrough/vtd/iommu.h
+++ b/xen/drivers/passthrough/vtd/iommu.h
@@ -204,7 +204,6 @@ struct context_entry {
         __uint128_t full;
     };
 };
-#define ROOT_ENTRY_NR (PAGE_SIZE_4K/sizeof(struct root_entry))
 #define context_present(c) ((c).lo & 1)
 #define context_fault_disable(c) (((c).lo >> 1) & 1)
 #define context_translation_type(c) (((c).lo >> 2) & 3)


