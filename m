Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C94BC50DE22
	for <lists+xen-devel@lfdr.de>; Mon, 25 Apr 2022 12:47:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.312749.530101 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1niwFb-0004Y0-2G; Mon, 25 Apr 2022 10:47:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 312749.530101; Mon, 25 Apr 2022 10:47:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1niwFa-0004Ve-Uf; Mon, 25 Apr 2022 10:47:26 +0000
Received: by outflank-mailman (input) for mailman id 312749;
 Mon, 25 Apr 2022 10:47:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OfhB=VD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1niwFY-0003yz-IJ
 for xen-devel@lists.xenproject.org; Mon, 25 Apr 2022 10:47:24 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 16e6f593-c485-11ec-a405-831a346695d4;
 Mon, 25 Apr 2022 12:47:23 +0200 (CEST)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2111.outbound.protection.outlook.com [104.47.18.111]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-18-xSdu224CNzWfkOmkjINSUg-1; Mon, 25 Apr 2022 12:47:20 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by AM7PR04MB6790.eurprd04.prod.outlook.com (2603:10a6:20b:dd::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.21; Mon, 25 Apr
 2022 10:47:19 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f%9]) with mapi id 15.20.5186.021; Mon, 25 Apr 2022
 10:47:19 +0000
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
X-Inumbo-ID: 16e6f593-c485-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1650883643;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=gSHZrWWi42V/brh4EXJTJNbSe9aBFjvHmxN0fNwYBR4=;
	b=lCIqY+aLKA03YsIky/6uF2ilA6pUrpuyOVNtC6G4yKnP5lRsUJ/BBvBbRTYuVljmDYovtu
	uPbV1b+WoEdxnfv535UmDolPi8QHbka1dcmblcb0fSYNKwu6mZWX9ALXGBj2ktnTA1r2AR
	ezfDHoUs8Bp+rBJiRXPQSVYtkNFbJHs=
X-MC-Unique: xSdu224CNzWfkOmkjINSUg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gwkCsvwCqPq6Yp5f2zzM2NxLnB8q6/4V+aIqIlhwqTN4R4Xt3HrfiFaHenKEGtnrgS8WUNqF62xIZ3Cd9lg90x94Qlf8ArQb4rlqUNuv7ynN6DuPRCEV9pNzcefmKTR4r0KPfjW8MUaypS2qOQhSKjSaFCG64S8wlqSZYJ4a4EIcZz+WlAyd3/oqVNKcWr20wwfFP5CMt3A0boeA8dwU4hpcaah4U+cSxeOfQ1k5nfhKLGCQkso6uZPAZTzhH1JOQkTsao1RzwhgW5l43jwrB2KQ83VTd5uVX3VFvGUf5LuFvjjzCbYBTtzTQ+CPrxcxjRhSKIc3mNRC4R1lztx7ZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gSHZrWWi42V/brh4EXJTJNbSe9aBFjvHmxN0fNwYBR4=;
 b=LKM3ZAo7p+3+02rZ4Kkrz0k1fzf3oaU5edF2fJp8b8I1VUZwwWRSi+3bOgl7PjPRDFWy3bRMlsdV+Eu0RdY0vaxHmCXH545y1PcRwxGLKOqafELNvLwLubXtdx5O2+n3qDrznTQueWXB6b031GPBxSoY35LWR8aJhL101G9u24SJ06cx7daJjSKnLQjc46aYrFMtdiPzPhrRh9pVd7dk6GcFimmkd6Vt8HiZ03dZiIZuimXgr8Udt/JT166nvqf2QYV5U55+qUS1i00mqfwN9L445I0aSht5cd6xGx1Rjh0u//fgCYBAn0eZqLlNjHELhJc2y17X/goB5lUR9/n3ig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <55e50138-1d41-1e79-f269-df875473b1d2@suse.com>
Date: Mon, 25 Apr 2022 12:47:18 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] EFI: don't mistakenly delete a file we never installed
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P191CA0084.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:209:8a::25) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1c954a15-e5fa-4a2e-2da5-08da26a8f895
X-MS-TrafficTypeDiagnostic: AM7PR04MB6790:EE_
X-Microsoft-Antispam-PRVS:
	<AM7PR04MB67902FB331FF41F9C8B8DD4BB3F89@AM7PR04MB6790.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	iPO/yqEOFEcdTXEvezUXDHIjKod4ctjpRxg7Bwc4F6a3VnpSqJzUjtaMz0d+yz+H1ZcAwC8oCTf2E3oCsP7JPr7JBLro3PQfqIi724FiDEPIGNb+ffbDUmeQhlpjsnbQtuiQf2FaivWIMNEmKdQI/OJCIXeZKrnwX7JT5hN0Y4HklURpOfe6dY1eaHV2VYOmZDVcO6H0bZmKmq3hhVaZyUTYcyt8+jpYYpwkz/cbsjcGxE8EYfcYc6nhWS2JTinizl4NtbOTxzM/4mpRC7OhG+hJYioX1rQuO/8iC3pegncTGtgUrHrYX4u6LZ7zch/pn1teYn6no4ho+QcypoSlUgE3kFqgXUk4eig+lTignLeIoGjL1VWAFb2D0IOtrzuNZoFsT86EL1ylgfBhAaFTY+p03UWHmxkCzycXSwvGFovPXBXHXH319SHstB3yjhAEmbOg2CypEtSpCV6RjfiwW5czpu2KntTkcw/mM1ehLz1Bga8RzOfNO/uioqBC/YVceW9zq6cJzg1+zSeSbwByfVU0IT/PRrIAOsxmSFaeE+fy64uAp7+VLZrX6uvwSMSPocZN/RrVXmtKO0vA81JAfqgZ9GqLbDsR9QFeGqWEVW/2ltsWaYkd0SLV5QRC0lDMb49EMX88QuF9C+37nNDs0jL2U0uZyX7eTBk3s4TEUacUHY4OLT//njMg2//NWBtrEinmD1G5ryWBeZQ8I18hMmmRJakv2d/QKV+QbSiDpirSiaCYCE26U0ip9u9+wZBj
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(31696002)(86362001)(66476007)(66556008)(2616005)(4326008)(66946007)(186003)(38100700002)(8936002)(5660300002)(36756003)(316002)(6486002)(2906002)(508600001)(8676002)(26005)(54906003)(6512007)(6916009)(4744005)(6506007)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dEl2SUZpK2JidjdXUkU2RXdYckhGNXJYaXNUWkk0Ui9QM1pId3ZLSWJNb1BG?=
 =?utf-8?B?NDhHdnpkbVRuaGgwL0FtWURTYW1TS2tLZXVwZHp6dWhsNm1pRXlVSWk5RWt4?=
 =?utf-8?B?QUozZHI1QUh3KzFrankzSEhaVW9UNzVaMDdOMFlPUDU5TzJwTXduY2R3YWFr?=
 =?utf-8?B?QzhkVE52SERCMGxXM21LcUVTUG54dWJDWmdQdGl5clp5MnZFeWR5dnB0ZHZQ?=
 =?utf-8?B?Z0c1UC9EaUxKYi91cVBkRDNzSTBBZlk3VXlNMENNM0kxK2FPbVhsdnhtVXFi?=
 =?utf-8?B?WlRzSlo0RlB5U1V5WEY3dFo4ZXZoMVQxdXNLSm90aVZjckpzNWlyRjNQaUVM?=
 =?utf-8?B?T1dHSGpFN0U1SUprWTUyenhEOXh3ZnhCOGtEZFNKL1p1R1VEbFp5em9WTHZ3?=
 =?utf-8?B?NjI2cWxYVmZWRHVid1VGakttdTZ4R0VJbG5TRXRuWnZvSXJLdHNuZkQwRWFy?=
 =?utf-8?B?SE9VS1NzL3hwNDVHdDBIbHkrY1lFZFErVHduT2thSmZuTGw0d1RUaTZYY1N1?=
 =?utf-8?B?ZVNSK2oxclY5NDZTVGJVYWora2hzSzFPd00wQ2U1YzhsWkhaSHFwWExaV2Zn?=
 =?utf-8?B?S3dRMnREeFdOWTI5bTByV1RWZUJyT3daMnVDNXIvSzNjQk00STE1K0p2WWxF?=
 =?utf-8?B?R3k2YTRjZDZITllmaS9MTnM5REMwRWdmQ1dlY2NyUEFhWUY4NjZVeXJCcFJ3?=
 =?utf-8?B?U01uY1QvMEFUR240eTNEM3F4YzJ4L3RISDhtQkpWY3ZteVlRa2pFb1JuYWFX?=
 =?utf-8?B?Q3I5UlQvZ2JSM2grdjB6QjJRa05vcnZBa0VPOUhtZUlodWxjWC9Mclo4UmRB?=
 =?utf-8?B?L2twcTIyZWlmenBJSHlsUSs2MXo5U245TWc2QVNmWi9QZm94Yy9pMldtQU5B?=
 =?utf-8?B?T2p5L21HUG5YZmdRRjZpeDJ6QTdNRHQ0LzZnMVZLMmhMTWV4T3pLWlZvb1Br?=
 =?utf-8?B?YjNRSExtTWQ4MWdqdERrbThhbnhFRGhIY3Q0SXFGWjhNeHdWMkpGNFVlcm50?=
 =?utf-8?B?dEl6T2o2eVJLQzZueGwraTY5MVJ0VDJvTEw3RDJXYVpIYks1ZDhpSCtTUGt6?=
 =?utf-8?B?N1ZTZjNzUWN1MjBweWtKbGZqc1VKbGJPZTFNUk95cDE2MzdYWnd5bmtZbVdl?=
 =?utf-8?B?d3gzdnhRMTU0RjJsVHN4aE1sRTYwZE9hYndqQkptZHcydE0zbUZ6ZXk3dENX?=
 =?utf-8?B?RXEwVFkzU2xUd1dNRzBKdDNJbHhGY1pBMm1uMlRDeFJMVW1VOGFGOHNGSncr?=
 =?utf-8?B?QlFEWnk3Ull6VkwwdjBVd29rZGs4ZVpmRWFrOEw3UzJCTzlLUWRGZzVxajBz?=
 =?utf-8?B?RVlRanQxZUd0dWhDU01LQnIvU1RxNXRselNJSE4ybmhCdUthcnZnVGZRQVAx?=
 =?utf-8?B?dFdjMkQwMkNTWGhGcFFjRDZDRW9lcXpWN3d0amhCOTZ1WER5UDFIbndmdm5i?=
 =?utf-8?B?ditSR1lvRklsRkFPc0g3ZklpcUE5amlMQzZoNHNSZWNhd20xSkdOOEdmczRu?=
 =?utf-8?B?em55NkpYNmhtUFJYLzRhVUFSU1BXbzRNdUUxR1BsTHAzQ0YvbTRRM0FBV0hl?=
 =?utf-8?B?YXpzUERXL042ZWYrQ0YyL01sMVIxTTZjbTEvSk1vU2xPTmlSZ3lEcTk5cUp3?=
 =?utf-8?B?SWxyZWNTU0lpYUphV2hSRktYMFRXT3U2Z2pRMVhSM0Q0dWhKWFZwdEYvT1ly?=
 =?utf-8?B?enhTZ1M5aGE3Wlh6eWVvbkdDaHQ0UWc3OUtBaGUrUk5va2ovVFd1SmRsQ2o0?=
 =?utf-8?B?T2dTd2U2ZXZaYTB0UG9IUjdBVHgwQVZTZEFTRFFkWDZvQUY5MHRVVE9Cb3dB?=
 =?utf-8?B?WFdITmNyK2lUOHM3M2JtTEZxdUdERmYvdjNIYTFwQzFBKy9wcGZobEFvWTQ2?=
 =?utf-8?B?OFlaSmx3L1R4RFZKc0huTHdqbUVUb01FRVRmYXdVQ1Myb0RsVDNYVW9EcS96?=
 =?utf-8?B?YkdLYXRZaS93Uko3Wk0rQUlWdURUZWFrUVZhVzlGNGNaS0RKZWozTllyMDc1?=
 =?utf-8?B?VWRLU1NTeUZvRmYyVmFpdkZKeFNBSEwwNXZoSFVsTDhMYm5EWExRa241bXdx?=
 =?utf-8?B?WUFLaHd5bkVHOXZXQVcyWHZSclRJTUc0WnhrMlAwVlFLZEw4YXhCU1dxa0Vu?=
 =?utf-8?B?ZnZxdE5odlk3eVA0TW1CM0hlcDEwd1QvSGNwQy9vYkJERmp4VlZtS3JCSnFN?=
 =?utf-8?B?UHA0TWhTZHFOVlJhcFdhazIySFZXSFBsKzRLY0RleFBKNzFDbVBYemFOZXFt?=
 =?utf-8?B?L1JLNEEwMGl0WGQ0dG5iN3J1ZXl1YTJmRFk3UFMzYWRXNUJPT1FBYUNubFRH?=
 =?utf-8?B?bVBSWGozQnNYNTJMamZPLzBxM1doWnJ0K1praWg3anBxREE3VHVaUT09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c954a15-e5fa-4a2e-2da5-08da26a8f895
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Apr 2022 10:47:19.5108
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +ClO3u/esT8/DK9dYcyBTs+o/ZVP/IxqdGIZ2Tbdn0+OOLy9JNVtRZjvC2Gm1TAeZMGp657YeGoEUSSDG5gYqQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6790

Just like for "install", make dealing with xen.efi on the EFI partition
dependent upon mount point and vendor directory being known.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/Makefile
+++ b/xen/Makefile
@@ -515,7 +515,9 @@ _uninstall:
 	rm -f $(D)$(DEBUG_DIR)/$(T)-$(XEN_FULLVERSION).efi.map
 	rm -f $(D)$(EFI_DIR)/$(T)-$(XEN_VERSION).efi
 	rm -f $(D)$(EFI_DIR)/$(T).efi
-	rm -f $(D)$(EFI_MOUNTPOINT)/efi/$(EFI_VENDOR)/$(T)-$(XEN_FULLVERSION).efi
+	if [ -n '$(EFI_MOUNTPOINT)' -a -n '$(EFI_VENDOR)' ]; then \
+		rm -f $(D)$(EFI_MOUNTPOINT)/efi/$(EFI_VENDOR)/$(T)-$(XEN_FULLVERSION).efi; \
+	fi
 
 .PHONY: _debug
 _debug:


