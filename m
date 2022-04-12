Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B24ED4FD71A
	for <lists+xen-devel@lfdr.de>; Tue, 12 Apr 2022 12:26:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.303589.517938 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1neDiX-0003Gr-UX; Tue, 12 Apr 2022 10:25:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 303589.517938; Tue, 12 Apr 2022 10:25:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1neDiX-0003Eh-RC; Tue, 12 Apr 2022 10:25:49 +0000
Received: by outflank-mailman (input) for mailman id 303589;
 Tue, 12 Apr 2022 10:25:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zr8Z=UW=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1neDiW-0003Eb-SE
 for xen-devel@lists.xenproject.org; Tue, 12 Apr 2022 10:25:48 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id eb2aedbd-ba4a-11ec-8fbc-03012f2f19d4;
 Tue, 12 Apr 2022 12:25:47 +0200 (CEST)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2107.outbound.protection.outlook.com [104.47.18.107]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-29-w3_gBEIGMmaEkfjQcpXgCA-1; Tue, 12 Apr 2022 12:25:46 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by PAXPR04MB8688.eurprd04.prod.outlook.com (2603:10a6:102:21f::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.29; Tue, 12 Apr
 2022 10:25:45 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5592:2abe:fb16:6cd1]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5592:2abe:fb16:6cd1%6]) with mapi id 15.20.5144.029; Tue, 12 Apr 2022
 10:25:45 +0000
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
X-Inumbo-ID: eb2aedbd-ba4a-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1649759147;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=PtBvzg8Hif6iiUuiNnK/wboRD62zX+WXGhgns3pTYTQ=;
	b=GC/HY3RUBwhUvgUqjFwDSeCTNz0eK2Pd8iO07oIFOhAP0D9+12jqMds86IH4MRlBRvfZMP
	e73/pgRiDZWaa28UZsTctoJOXPEeSQUjio8Cy7Gsh2g0iiVNtYbr6LpyNKhlxsZslqDTu8
	D6eOhCRn+VbG6KBEcg7psFE9jRCFpFM=
X-MC-Unique: w3_gBEIGMmaEkfjQcpXgCA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Yy0NYUXkhbuHvZsyW6CF1IN5jeyX/cTXOlK1jQLC/CAaEWmxiTf9aYnyz6mD6OMG9HuY3qC5LYQMfFMFrkDKMRxxpTWjWxSiuYR6BnA4MWtn0uqzD1ZnJj0uSiYAmjd6rC+XlFsBAvsvRp15HASR8REPtHnhDHd3yKQZXCDT1M2VgUaYYeD60XyV4c95aXkJyrU3taS5suIUUUo6FRFi07vRPYOA/HGR29VSpVlTZ5srMeq9PSyKaIumEYz5640ZMb5n6oXblPinMfGF1PBvIsWdUsxYm6kYhAqLTLGvKLmeBTFrmlvuGQNMArQBVoXhV83u/KKx8Hf/8OyOAFCXEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PtBvzg8Hif6iiUuiNnK/wboRD62zX+WXGhgns3pTYTQ=;
 b=SoG9L731X6PmSnO2BxgRoUgzMODFcSfo235W+9KanF9MDFEoHTxvMWA5bZ98TMT1wioSUna9CjqmOn2YPdIv9seTdH8KX99MkKEtv9BHrB3oAgmYWGl7i/izEZeCr5Z3UXVc9F34DpzebbwpFsysR8xMeZufWvc8mJ81spkr5caLWYNzGDonerjn32rLOVprJTX0M00Vd49aTyGuzMFve92kJ4OxImvB26EZznFCK4dZLU5SlJjv0uqFz0LZCvMj69nxnKmAHkJwB+hW4Rw98kdRDCaL+zYR5jkttxddKFmhVUkKsLk1ZZy6Ndi63dRMO7W1xhz0r6aldO+B69P9hA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <e4bf47ca-2ae6-1fd4-56a6-e4e777150b64@suse.com>
Date: Tue, 12 Apr 2022 12:25:43 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH 0/2] x86: aid debug info generation in assembly files
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FRYP281CA0002.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10::12)
 To DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 25e2032d-4ac8-4781-28d3-08da1c6ece10
X-MS-TrafficTypeDiagnostic: PAXPR04MB8688:EE_
X-Microsoft-Antispam-PRVS:
	<PAXPR04MB8688E404FB06D73CB198FC8DB3ED9@PAXPR04MB8688.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	1N+mw4AuwLYk3V9n7wCSemRx0tEDrZE10Ll4eNdc5fZa3mKu1N1/GzCl/o1tfjYEbAft9IMX+/LOzdiRZ1N4w2NLgBHHTYdgyq1CmbBMVnlV0odVlH8g8n8sbtjznwrBzA/2hvYx3KFdq00ttW+RV6QdkW8fXv5wkIj/Wb5UOlAUtzWf+7gcFYFJV20eXIH2QTrxTdAJ9ILzudWu9yonCUoAKbV7emzGYRAscFNDv++rK9kgJtpkZJhd9AC0GxXPzpXpMevbdTX0fJDllFCw8rB1mjI1Ru49SrRkUWq6r2geTRObjoLs4/adRzcWyRVmnbD9vH7pLw2JIuPaRb7vGnFRbHUA8iQvT5jdTYQwFsJyvwdKEooZuSI4mLdFSb5sEaAEJOmJQB07JC94HlL26E4eR+DgVERwNaQlVcMhkgDhCeS1VrzMupr0Q4U7D2l8AfK9pURdN2dZEjN4Zxnfp2ZzyW380o6lXN0TzilMGxokBZ4NfWTzFIbsOWtYT9xevcg4V9tjAcOL5YPYUlOZ66nMwwekcGXVTGjWZDNIO/t0dcZ8GfbD4soXQ77k4Sl8BUXaT4WN2Qoin0uL3SkRTrwI5f2noKGoB5mV729wws01bFtBHJfBsGBCv2ZQwQd2MrCHA+Hk3Rh9ZNWagnFP/lolH28FPvxcq+0M0t8Cy17Gp0LXlpgdHuW2jty75OcEAjhCST2ZeWA19A4ru7JQ0KqxaYTHK9R+IWA0pgIFpwdhBd6ViW9fYhzIoQEh8i9t
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(8676002)(36756003)(2906002)(4744005)(6512007)(31696002)(66946007)(54906003)(31686004)(8936002)(6486002)(508600001)(38100700002)(6506007)(26005)(2616005)(66556008)(186003)(316002)(66476007)(5660300002)(83380400001)(6916009)(4326008)(86362001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Zk50SkZGbkZ2cXl3dFZuMGovdnROMW04THNBeDRGMkxOM1c5cjlEMXA5OFpt?=
 =?utf-8?B?OFNSc001TEVEUENtNCtBVFl0Qk1qaXB4TFR4T3JvdHdkbXdEajZpYU5ZRVor?=
 =?utf-8?B?aTlLejNSeklyTS8yb0ZTR0krbHBQY0xvSVFlYTJMV2RpcURyUHJSL0FLMVZ0?=
 =?utf-8?B?Mis3WTloQk5xZjNvVjBIdEF3cWtrZWNhMFZPRnY5WTUzQmVINUxBeEtqRjNt?=
 =?utf-8?B?UlJPRzBoMlBIbW1Tb0Qxdnp2aXpiM3VXZU1PUXA4YVlVcTlVc1pDamt4enNN?=
 =?utf-8?B?cnVBU2ZJaXN4QXBOdDI4bHAzVjlEaDdFc1NRN1FxTHFMdkZEMGtLaTVmZDky?=
 =?utf-8?B?aWp2dmIwYm1VL2NLTEJmVG42QjltdllKV0tsVVZvSU8ybjNXVW5ZTXZBZ1pD?=
 =?utf-8?B?dFBrMU9JZ0RTeXBINlhwc0p2emhiOUZma2hhOG5MZTIxdmV2Ujc1V3pKNFN3?=
 =?utf-8?B?TFUrUE8xZDQ1R0YwSTZjelgxVkwxdG83RjVUd0NPWHhMeW5CT3RwT3VtN2V4?=
 =?utf-8?B?Zi93TXhaWFNVcEdaeEhLUFhuci9Hb1htTGRuMW9NYUFyNzRoLzQybUp1c0Yy?=
 =?utf-8?B?U2VTekl3anpWSDZsQmcxejlURlFIYkdsOG9PdUsxUmNDa3pWSnhRT3ZWME9O?=
 =?utf-8?B?U3ljUVR4RHVsRlJ4MlpPZFgyUGx3YkJQU3hUVUZmaFZPcE9DZDlGNUd3VWtr?=
 =?utf-8?B?TjFXbTB4dmJ3VG01TXhNdlErOG1WZVhxeXFUQXpSL2Q3djBrSWNRUnI2SUYy?=
 =?utf-8?B?ekNBbTVJMWlsdUg4UFZybHorRmRrSWpQcnpjdnFXaEE5RHU3cTBNUTNKZmdw?=
 =?utf-8?B?WWtIekkzZmQwMUZyMW1HU0JHenl2ZTd0NzBGWFB2Zk9aSTZRcUZlQ2NRUmo3?=
 =?utf-8?B?OU5xVjJnSFNwWmdHa2hoczRYRm9sR0VRUXRMV3Uvb1VxcGM2VnFFYTZtRnVp?=
 =?utf-8?B?UngwTFBsODJ2TnorUE1CdGVNOGhpSDZTK29VaFVjMlBOZ0tFdHdsTU8zOVhp?=
 =?utf-8?B?Q1Q3TC8vek9HUUZVbHZHVjdYWVJhMUNyT3lIQkZoTFZYM1MwRTZtMnJJZFd2?=
 =?utf-8?B?b3ZVTzNvUEJ3UTdUOTdzSTRuQ2RYSEI5cUUyM21Xa1o3Yk5ERTg2UW5WVFN5?=
 =?utf-8?B?YTNrQVNYQzVsOXJQSXhMbGdWVEdlZENaS0luc0FtTm1qNUZiNk1CQjN4NTU1?=
 =?utf-8?B?U2lVb2dxYWlBUENRbUljdkExZGNXRWQvN1ViZmFzNzliNnljakNuYlk0YnND?=
 =?utf-8?B?R2lLOGJ1cmNhMFJWYndwR1NISnpSN3ZYdG1CTEY2SGxKeXJ6eXNqRkZNUVAz?=
 =?utf-8?B?eDNiQk10SnM3WDhDcUE3WDR0akpuUFZwKy9iVGwrUFE2amFpd1kyUEVIZ2V4?=
 =?utf-8?B?bEU3cUU5ak1ZQ3NkMlNySlJaWEI2ZVZxMWlXMHdzMnRhbXhPejVvWVlnQUNp?=
 =?utf-8?B?Y3UxNjJlSG1UNWc2RXQyNE5kYlJQckFyS3ozOW9ub2s2UW1uYzdJWHZuY2hW?=
 =?utf-8?B?MHBQWWlXWlROa1NjaW90OVE0Tno2RVpBUDdKcjRNOUl6TXA1czVwV2VlYUgx?=
 =?utf-8?B?enlxUHVFb080amRYblcxQ0VWMC9nbFo1K0tQWEZVV0tQTkJLWGhBTlkxMjd2?=
 =?utf-8?B?eE1la2JmNVpHK0wzVzZrc04vZXVybCtLYmVweVpEZEFBcHljUlVJcjhNb1B3?=
 =?utf-8?B?Y3czL2pwc243WmtXalovdm81b29uWUVqMVpUWWpWRWxvWC9YeFNlQ0JjbWZN?=
 =?utf-8?B?d2VZeFl1UnJjZitaMU1id2pZSDdHWWZDc3U0K25NZDBaYUZxNHhXbXBsRFNk?=
 =?utf-8?B?OEQ3Y2VraHQ0Y082TnkrT2YxYTNvODhLNEN2NlU2SDBua0w1Q0pzYVNqbjcx?=
 =?utf-8?B?Y01vRWk3S05oeWJmK1FCRDBERnhBNHJhTG56bG9sNEdrWHlBQ2VBZmVROWp5?=
 =?utf-8?B?NDlNMVZJR0VqZS83TzBHM25uY0hNcE93NWNuSGFjVTBWT05nNW4rNXcyWFE4?=
 =?utf-8?B?TVZvQWdBSFBhT0VXTU9mWUw4U0loaEhQQ3hiZVpEWmxEeFNZWENHTStiVFFY?=
 =?utf-8?B?aXlOdXVPbzB3N2Ixek9wL09JRExvNE9mQVIvSXFua1A2UHNFYWtmMDNsOGJT?=
 =?utf-8?B?U0o0NFBnMGg5cGU0RGE1eW42WllJUC81b1J5NjYycjNBVjJWU1RkTUN3Q2hT?=
 =?utf-8?B?a1FMeEdCY3ZRM3YxZzc0K0I1bXd6RGptYVdHSEl1cEU0YzhTNHdqUG1sRUFT?=
 =?utf-8?B?cXJhbDRzTmdEclBXcnZvZjV5U2JVdENLMi8zQ2NnaUZkczBYV09xcHIvV2tN?=
 =?utf-8?B?WWREa1BEYVAweVZGem90QkdONXJKaC9QaS9EM2liVGJUNXVqZ0ROQT09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 25e2032d-4ac8-4781-28d3-08da1c6ece10
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Apr 2022 10:25:45.7366
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZjqcPKsMWsuPrBKLxsxiYq9z8jlsYBvL1AVv65K3OD3I3nvbH+4IC1Bmj9PD3J25A1sW4hLpuyq7ri/T0MoZqQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8688

While not immediately useful - a new binutils release would first need
cutting - I thought I'd post early the patches utilizing new functionality
there. The changes made are largely benign with gas 2.38 or older.

1: improve .debug_line contents for assembly sources
2: annotate entry points with type and size

Jan


