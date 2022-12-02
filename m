Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A0056403B1
	for <lists+xen-devel@lfdr.de>; Fri,  2 Dec 2022 10:47:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.451715.709480 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p12d2-0005oM-Rm; Fri, 02 Dec 2022 09:46:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 451715.709480; Fri, 02 Dec 2022 09:46:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p12d2-0005lP-P7; Fri, 02 Dec 2022 09:46:44 +0000
Received: by outflank-mailman (input) for mailman id 451715;
 Fri, 02 Dec 2022 09:46:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=JFaq=4A=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1p12d0-0005lJ-ON
 for xen-devel@lists.xenproject.org; Fri, 02 Dec 2022 09:46:42 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20619.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::619])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 389b9572-7226-11ed-91b6-6bf2151ebd3b;
 Fri, 02 Dec 2022 10:46:40 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DU2PR04MB9210.eurprd04.prod.outlook.com (2603:10a6:10:2f9::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.19; Fri, 2 Dec
 2022 09:46:38 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5857.023; Fri, 2 Dec 2022
 09:46:37 +0000
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
X-Inumbo-ID: 389b9572-7226-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BoIFhcN+ShJK34TfM7uAX6BVdHH6KOxqH/Z6c5k7OoYqJk3nDCPQ6MuiBigDdzUGbQJxtJrf8rOYUcCtxOM8g2BFbGEJFcxW3lWEatDMlv8fX+o2dkKdiZBfJnKWrQRYDqlKVU2MyOrktW0bTUB84AEO13sD4XRV8yDuO5EeEfatXpdBJapyN+Dc+qXSxY84UzuDCoCohlbT3ktjoXL+ELlYu8YUOnwZ2Ttn2UKsYp4bsJZpbBrzts0KfH9kiX+2ICEwogikiIXZRvMcbD3W7ieNXX76X0eXWXh1B2Vml/SC9xaPFOfg/awOTG5wcycoz4aQWKXGVagGRZX329YwxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=535S2e3PBAXBJycWTq5nnuXtVmPz1++/Yp9MQ94s6S8=;
 b=IcnXttkoeh+MLtcEpjislOzLXd4M7M83yqIPNi+iNz6OtQa0EReZESYGARsFwC91CYeMxKKqbliiqrUg2af59kID65XUp80fJAr6LKqhTei9ILvBE51aAWJK1Z1jpffN5ZfgxX3K/VlJdMr6LlGyICUbBdal1XGbToaYIlu5WngqNJyt0TQCWR5zACmpI2cMrV7nTUJcIfW+S5nz9RJQ4ABnEGpJPsEkKM/l05cHEv/8OYbCrjUPoyuKXpQ2IaQrQFhMaTIIj9eIS0aEFjb+GlAntxf3Z0Mgx176gm34lMR1LWcU6OM5SW5qCQrdfXvCidpm020BXuLtMJI5y1qkqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=535S2e3PBAXBJycWTq5nnuXtVmPz1++/Yp9MQ94s6S8=;
 b=LpAOgGyd4WGAg5RxqJ7f/nIM6WS1ge0VNaE0LSNvWJWKhChrrHDVdjK3xKpBTwvt/UAS9xfuX1iE8iWkAUQyzl2fE1jTp5Vd7oHeJocLWM3Ag8GzLoKfSeR0HzZCvZDj5zXuN7lZn9+J1sIX7ARkC0HDurUNVLxCk7XyQWUMNcuuBpbEMexK4vAymKE99QdcMCXbowOwanZmVMC/cQ7iSzRJU3J4iFVih0X6CsXuGFlJVhrpEK8Jk0H2EUvCQ31EzYIhFwaKgufuyBML2DQxRocrRPkQdvy4wsrCEBBlAuzhfAgDhlO+9d2a35/U3kojMdqXaE1wixmRg03+ofpQVA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <9d796752-8f8e-dc64-9803-a33e31a3f7d4@suse.com>
Date: Fri, 2 Dec 2022 10:46:36 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v2] gnttab: don't silently truncate GFNs in compat setup-table
 handling
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0054.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:48::16) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DU2PR04MB9210:EE_
X-MS-Office365-Filtering-Correlation-Id: a5c345d8-cb2c-4544-3bf6-08dad44a1b40
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	8MrcHMSX7gOJMVc2ZIPHc0FawPhdgX7oA3Q2aaARS/RzVPBbGUYJ0DIrMgqAJTDD1HbnqEmkn6/weSPNSfGMdxaJw940zWrMrsxC+7sttUm6sHasXoZ/r7h4AhZF4bJoMlEzqlKPLFJP6S8NoXYtEet6zu+nTqWIrw45vlga2+dlW94MyNXYA44zlD/Oxw/kRc20rB7ISx7EZ142OpHFkLSFQ4Y6ppIyKf9WNZyzaBTAM/AnJ2BTdBman+VzQUuWCHzg+bCwW4VmvTpwWhDZIcLr6kuFA6siCoRIPFNDnHrnZW+veNxmufikCSoIe69E9ZnRdOXchcHdRXCkude/cbUqw/pUSv/O9zWdvm/PX9tDW8635sWeKUM9LlHTLkHDYlRCi7Jh/gg2VsWbloU5AQlshZ4oyATF1e446zeFf1bbTkVBGdra1BGOLz5zcbzcIBnyAhG7frDTuyXHlYIPCfaNVXPKfp5siEPaJZMgu9f8SzUIIKx30ozDdVFCE9ndS3ilaelfH2HPDTxTD9neul7ohgpa5/4RWu+/NEgFrhuHGCcdi4M4NTqEmpu4MsvMz08PlfBrsBX+xSksjtKB2uJEf1XIyYvbgFinBsPsG7v7/k2KUJ7n8i39ZqyaAX6xnn8KaNrXfnN6qdW0PMGFBSrGIrnuw7U1Rxn5HwT3Yso/DM0Y6tjf32sa2Ed++QOK
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(366004)(346002)(136003)(376002)(39860400002)(396003)(451199015)(6486002)(6506007)(31686004)(478600001)(26005)(84970400001)(6512007)(38100700002)(31696002)(36756003)(2906002)(186003)(6916009)(2616005)(41300700001)(86362001)(8936002)(8676002)(316002)(66946007)(54906003)(5660300002)(4326008)(4001150100001)(66476007)(66556008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cXNjOG9VeGNIaGJXVTIrYm56MGY0SXlCckpCWnlUeUpGMWJ0R3Z0RVFrb1FT?=
 =?utf-8?B?RXY3T2lMVGMybG02TnN2WHk5VURpY3FlMHcrMC9KaHhUK3ZlODNXM2xjNmFu?=
 =?utf-8?B?QWtzU2F2SjRaaUNVaXUxQnFVYStrdGNBSXZUNEFOSFE0aDI5MG16MENVUlZp?=
 =?utf-8?B?K0xRakRpdDVZbGU2MnhzOTNNdHJEdEdJNXR2a1lVekxMaUlGTTdhT1ptcUI4?=
 =?utf-8?B?RnoyUWoxNkw2cE9KaG54WC9CYXpmNUlEQmNDSFJ3bDdTc014aGhjSzVjdmlQ?=
 =?utf-8?B?Mk5HVGV3OWJ1UUJYeXNGTU9MTzZUUTRPUnNZdm1OT1FhNkxEYzIrblhIbW9j?=
 =?utf-8?B?UVJxT2NqZWxYOUFtRnptV3VQeE1rcldOQ3czaTVQZkNySGRzakN5aDlFbkVm?=
 =?utf-8?B?c2tkbVNuMWcwMGJKbjZTeEZscU9BTmNENlBIQnhpbnNpZWNybmdSTW8yd1dj?=
 =?utf-8?B?bFVGdThiL29JNWFCVVF2NzdKVDJlei9UMDR2VjBmZUd1Skd3cnFqRHhFSHFP?=
 =?utf-8?B?cTQyUDJTRG1vd01MT0ZXVjBWQW5SaVp2V2RTV3QvTHdnZHZ6cUlseXhLUFZS?=
 =?utf-8?B?dDM0YmFQQTJSWEoxdU40ZjV6V0NGeUVwR1NUc21QZi9GcnNHdmZHYklaYVlW?=
 =?utf-8?B?SURWcjdSV1NWYzJWVWJTV0JNOWpFSllXdy9HVEpVRTNDYjQ4WEVYMTdsci9u?=
 =?utf-8?B?aHFnOGZOb2Ywb2RQRlVmMENXdTFEMGpuMFpIdUhSLzdaSlM2UWhGZlFuQmZi?=
 =?utf-8?B?cUlxQlFNaXA1V29nb1ZjcFVqbnpNMndLRE9zbVhaY0xWZWQzQ29VQmM2UUxz?=
 =?utf-8?B?WG80aWJQMmVld00xcHlSTG8vTnhSdGNDV2VrTFR2a0c3Ym4xODNwd1VvcC9S?=
 =?utf-8?B?djBuM3o2Ny81Rk5Nc2E5d3lPQUhhbjZrRXpkdHVSc1A2OVhOTmhUMXZId1dF?=
 =?utf-8?B?TUpWOEhGNkdKTjBIQXp3NXViL2g2Vk9HdHFKRXoyVlFOY094NzZBSG9DVEM3?=
 =?utf-8?B?OGJHYVhoM3NBcGs0TXAzODlwZzZoT0RSTW9wRXlER1ByVUZCOGdWdXhveU9Q?=
 =?utf-8?B?VHh5SWI5aGdPQ2ltSnV5UmJ1SHBZV0JrZ2pPdnA0Y0ptVStBamdBTzR6SGlR?=
 =?utf-8?B?a2VyTTRtS0FSMWU3R1pHcFpmaUpINTdTeUl4ejMxM2g5d3RtUVRKeDhodVRw?=
 =?utf-8?B?WGFBYTJEZUhEQ0s2L2hHemlIbGplek9meFhjM0l2K0ZldWlqT0g1VngvYjRM?=
 =?utf-8?B?aUxVYlNwSXpHUTNKbkxlSk5FMkpHM2txOFpicEQ3RzlYbkJxQ0g5N2VuUnN5?=
 =?utf-8?B?SkdTVDRXanYwUlhQYlF6MTVEZ3FXN2krMlRzTVhkQmdLUlRCMEtZQzF3NW16?=
 =?utf-8?B?WG52SjJIUUJBZkRVWWJ4cVU5NlpQOVVoT09XaGpKOGVveHVJVDRRY1JCMW5Z?=
 =?utf-8?B?cUdNdHptbkFNVncyOXdxMUpkcGpXYzRSNXB1MGJCUXQxb1lObno1WVRadnB6?=
 =?utf-8?B?VENZSHJ5UG9Da3FIbWRVeWlZd1ZaYXQ4Y0thYUxEYnBQeWNuT3Q4c1NxNGY3?=
 =?utf-8?B?VE5VTE9XcXZXcDd5RVhDbkRjSkMvR2ZkQjhWcjB4Y0RsSk9sZERVMjJvNzkv?=
 =?utf-8?B?cFN4bnBNVzB6YUJpekVjWlJkMWt1SlZxUnF6ZjNlWHl1M0pBRGhYUStqcU9n?=
 =?utf-8?B?ZzltWk9FWmVkTHh6YjBONzZXb2tyYy9xcTIwUmZtYUhuVkhGQVlEc2gwcjNh?=
 =?utf-8?B?M3FmZ0I4U09WVTFQT3lzR1d0YUN1SS81V0ZUbmpKY0h0NlhUdFN5dG5sWUdP?=
 =?utf-8?B?WGpyeURjcktOdTZsT1oyYUJnWCtROVVIOVlvV2xmYm5kWmloNFJaTkFCS3Zi?=
 =?utf-8?B?T2dWeGJhK0c4c0dyQ1lKT0dkK2R2Z0N6cGJCRElrZjRUUDRzN0RHR3I3d3g1?=
 =?utf-8?B?NUtyaHNRWmtwcmtJbUF2OEJKTHBzWnhINDBRYjlDb1BEcWVXSDN3Uk84RW1i?=
 =?utf-8?B?WitjcnNONDdaTmZDMFlWME5SaEdBcTA1M1RaYUQ0NlNiN2pzbnQ4Wm05S05y?=
 =?utf-8?B?WXhIb2F5cGU2YmZFelJVQk95Nk1VUjlOY0pSSnViTjRaSktLQWdzSlVwYU9N?=
 =?utf-8?Q?0iVZggvBVU66m0LI1p2B5HnOM?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a5c345d8-cb2c-4544-3bf6-08dad44a1b40
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2022 09:46:37.7459
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F6Kzs2p2t+Yjb5idBoWnqTyc6Sz6XFeKoq3xMbaH6vrEJH5CcYPGKT/5tOSb0ukTgyiOHGguaPy4layFFv844Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB9210

Returning back truncated frame numbers is unhelpful: Quite likely
they're not owned by the domain (if it's PV), or we may misguide the
guest into writing grant entries into a page that it actually uses for
other purposes.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v2: Drop use of VALID_M2P(). Use "break". Move type change for "frame"
    here (from earlier patch).
---
RFC: Arguably in the 32-bit PV case it may be necessary to instead put
     in place an explicit address restriction when allocating
     ->shared_raw[N]. This is currently implicit by alloc_xenheap_page()
     only returning memory covered by the direct-map.

--- unstable.orig/xen/common/compat/grant_table.c	2022-10-10 11:02:21.198223952 +0200
+++ unstable/xen/common/compat/grant_table.c	2022-10-10 10:31:25.000000000 +0200
@@ -176,7 +176,12 @@ int compat_grant_table_op(
                     { \
                         for ( i = 0; i < (_s_)->nr_frames; ++i ) \
                         { \
-                            unsigned int frame = (_s_)->frame_list.p[i]; \
+                            compat_pfn_t frame = (_s_)->frame_list.p[i]; \
+                            if ( frame != (_s_)->frame_list.p[i] ) \
+                            { \
+                                (_s_)->status = GNTST_address_too_big; \
+                                break; \
+                            } \
                             if ( __copy_to_compat_offset((_d_)->frame_list, \
                                                          i, &frame, 1) ) \
                             { \

