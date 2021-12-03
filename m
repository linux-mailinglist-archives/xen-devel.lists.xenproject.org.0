Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 12D134675C7
	for <lists+xen-devel@lfdr.de>; Fri,  3 Dec 2021 11:56:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.237341.411647 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mt6F5-0007uo-Q5; Fri, 03 Dec 2021 10:56:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 237341.411647; Fri, 03 Dec 2021 10:56:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mt6F5-0007su-MN; Fri, 03 Dec 2021 10:56:39 +0000
Received: by outflank-mailman (input) for mailman id 237341;
 Fri, 03 Dec 2021 10:56:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EuM9=QU=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mt6F4-0007sk-UW
 for xen-devel@lists.xenproject.org; Fri, 03 Dec 2021 10:56:39 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b0033287-5427-11ec-976b-d102b41d0961;
 Fri, 03 Dec 2021 11:56:37 +0100 (CET)
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur02lp2051.outbound.protection.outlook.com [104.47.5.51]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-13-w61jVg3JMDK7ZefYJVqMhw-1; Fri, 03 Dec 2021 11:56:36 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0402MB3391.eurprd04.prod.outlook.com (2603:10a6:803:3::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.23; Fri, 3 Dec
 2021 10:56:35 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%5]) with mapi id 15.20.4734.028; Fri, 3 Dec 2021
 10:56:34 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM6P193CA0132.EURP193.PROD.OUTLOOK.COM (2603:10a6:209:85::37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4755.17 via Frontend Transport; Fri, 3 Dec 2021 10:56:33 +0000
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
X-Inumbo-ID: b0033287-5427-11ec-976b-d102b41d0961
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1638528997;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QD9We1Cx5H7zmR7/ANXcnQ1Rln6q7zD3LKt1U64J4VU=;
	b=awNekeR3AE3BFT+EhaUWUD/0Iy/eaxKqbkla6/7tlbblbe2MEzbrBiBtWujaD3/8uuxGL8
	Lm9fso7KVP5sINjmJml5rROYDWwbLSkDVAdbRR4P5Hvwv9VzNyzWVd8T1dhjAPoqcH91bm
	H6Y5ux4vIQp75ag7GW5GLslRDgxJBPQ=
X-MC-Unique: w61jVg3JMDK7ZefYJVqMhw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Cypgf/yfxOH2eOVbElMvsTcMbRRiENLi2VQLrmaLcdUxYgpjxiHM78q3O838shZfCPo1gEkKkHkNAkIuvtYqM1YLooA8B1x9+mLxzFHLZpCSMPs3IbfyDtnXhwq1zOfy9wIhvSepPJhE5i7NvLKBcPxOavBXH+htj2v5j5m1upPJgT0L24M2Nwqi8PKqF9AkU9fvX37Xfu+s4trfAjw4JB4YcJkxHh2aJgpSRIZeDChh1eKIjfdMDaidwBeCLyvVQ7r90DgFfsdiY4Cso19vgANNPFpXuqewylr/cApQB16lgkxs080Agx14pv2v8GQYPdVC5Es1uldkZUuVGbg/Gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QD9We1Cx5H7zmR7/ANXcnQ1Rln6q7zD3LKt1U64J4VU=;
 b=BOJhsg9LDei6THoSrvTUPkyaWYf04eapTH6s0WyRQyMx3AEFGbFbEhVyoEuUzOJXQ9CQCtYBvrHcDZaoZQjoVxu1R9ZKLVMX+FQcoodb7g0IkGz8xyCPEfoiWfzTaN+YtN1Hhq0ykgj0eQsth3fYXPPXwb7X5gq+Spbjzuz0m2R4okZleGvSQHmVR97aHlylJc1L9tizMw7x0MPdvFLG6Om54FwMmhXNMXOIgX5zfgRx8KwBEAuX8V03IBYIKuvt8ATcTQZnLuSqK6ws0y0QZcfIbSPCYU4wk/oxxFzjkde1KBdZrwJgNTx6/C92U6WYlGKxWAoMzlkkjvbGEDdzjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <8b369fc8-8f9e-c350-95de-790d47fd9aae@suse.com>
Date: Fri, 3 Dec 2021 11:56:32 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: [PATCH 1/3] EFI: move efi-boot.h inclusion point
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>
References: <46de3a57-76d0-1538-ec3b-79290d1bfb70@suse.com>
In-Reply-To: <46de3a57-76d0-1538-ec3b-79290d1bfb70@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P193CA0132.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:209:85::37) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0e6c7a3d-642a-4a54-f908-08d9b64b9284
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3391:
X-Microsoft-Antispam-PRVS:
	<VI1PR0402MB3391074D9A6BD0E212255318B36A9@VI1PR0402MB3391.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:949;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	6ZIsJhoj2chQ+jrQgpTPKQPD5tod0g7pz9mCDVRBT+rf2Pl57+We61xQpfO8ZXOvlhoxTy8fKbVxNiHXLqZ12iZUZlSYKzox5g1eLSZGW0ZQJidtjBlkL/DwS+yzByv39w4DrdrXBdLhtWgYGAyFZbM5Us/j6xrLb9UZkaxLZFCwSZLxLkgrPc47RsmrAHUXv3OR5kKlZhuZyPoLCpyiim2cpFvg1LbzKcoeYbrOXvZvZGFjIWQsFNsiSQ5uWFb/sBL0T2TojIvH8nSXceBN6Y6904oFV99Y3De0d0K4hq941NVffAWUBcK3MDZDai7URwenjrH+dDPwiwzAwV37Grc5tZo3qGWutEl7z7G59FH7Eq4Yv6uDDrPi3OANjIt0vFEpml+OhwvJ1tGP8C/zIZ8jmDTAqzmhkp1ZLWyfPCVyJD+Ygzn+XV5y3pRwY0rs4BUEK+41RQAm0/fqZkHgZ/WUcV5lIJGOipyfUoL0GNjT11u4ki50jVJefBRaEofBr3qEZO5Loek9wruwxxFldRxdXxPSGgaDEQwjbMjbQNfHyWgR5TXJ0GxpBiXeuc8NRwx8wq9sh7W7yA05tkSfR7bYyBbPr8NYgR3S/WoPpZHXwxZDgOHKqpjrNJXucictf9Rp96sYqOJS5BXx0K2PgQOBdJ83xOzref61nWq9UpPX330ZVB/hMYRgshO0nPNfCXR2qo1p8WqpyPOvIMpxbnnNPBvPPaYwKYsDucmw0JKCEZXZjOmQhjdX6ReJ+wFr
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(6916009)(4326008)(186003)(2906002)(54906003)(66476007)(5660300002)(66556008)(31696002)(2616005)(16576012)(6486002)(508600001)(66946007)(36756003)(86362001)(8936002)(316002)(26005)(956004)(8676002)(38100700002)(31686004)(83380400001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SzdZdi9GNEQ4YnRDZFdkbDA3ZFVQdExqcWxIZTlQWlpxOTFQd3ZLbVJBbEFG?=
 =?utf-8?B?YW1YcXBOYkNkL1hiKzRsM05IM0VBWHA3MGNlc2ZBTHFSZXR2cFZ6MHhFMytU?=
 =?utf-8?B?YzhhY3FKNVZreGw3WkN2bUkwdVlleWpjeUdvRjBjRDlRNzBlbzlVTVR6d1R6?=
 =?utf-8?B?OE4zMHdXVytVRkk0MjVrb1pSTjBkdTNXays0REtlaVVqNXo3TFFBeldhVEE4?=
 =?utf-8?B?dWZOS0V5cEx6OThsei8vcmtaTi9iMjQzeHVFVGxpczlOdXloNDlycEJQcXhn?=
 =?utf-8?B?UldRd3BZOFdISWRWRWYvdlBPbm9tNldCdlNuVzU4bExidUtPa1g5bDdCbkVM?=
 =?utf-8?B?ZDFwMEV6QmdjUFcvK0pBdGxYTmU5anNlQUtlUEpmWHR3ZTRGZFZodUZhRU5r?=
 =?utf-8?B?RHF3enNscVpOUVkrTDlyNGUwZ1hzVHlTUW9keklOU3o5c0hUd2RiVGxoNitj?=
 =?utf-8?B?WDAzVGVvQ2daSjg0L29Fc2dSRTBFcUd5Z2NQQXZRZjRoMHVXTVZTSVdiKzBt?=
 =?utf-8?B?bHUyNFMvZlpXSmFIRFgvdm1UQ3VKZTBsNElvZmtyUjlMYkZTajR3bCtKS3Fa?=
 =?utf-8?B?UXh3Q1BJS0pUcm41dlMwSzlxZEFpZGVEcWdqWjN3S0pvc1ZkWjNVTWFwVXFF?=
 =?utf-8?B?OW5VWHB5TTk5QWFoZ3lzTEZiUnk1MmM3WDY4RUplSFp1OE5ydXlIZHMzU1F6?=
 =?utf-8?B?QWtzT0ZFNklSQWY4c1p3UG1SVUdtclo2UHcvZFkrQ2YwV0pyUUVObTN5c2Q1?=
 =?utf-8?B?dU5GYXZNdUZMU2cxUHdNQS9jcGlDRUZXdDZRdlcreC9aUzNKNStxUVZSZjFa?=
 =?utf-8?B?elZrRmFvc3JZZVM1VGhZS2FNYk5sY2pTbnNGWURoUmRleTd4QTdvZkNvTk50?=
 =?utf-8?B?eW5oZSt6YlVGUFZnN1lZMjd0TjZOL3ZaMmRzMDlJMUgrOEpLODl0QWFkSG5L?=
 =?utf-8?B?bWJ4ZjIyaUhKZkR2WE9ncDMrM05KZFp1b3NxbUhPMDNsUmxFY0duZ3k0OVNh?=
 =?utf-8?B?SGV6ejFmVFJwZmI0b2t2YVZORW41ZDFKVUhiNDRYYSthbExhVzJBN2g5QU4y?=
 =?utf-8?B?UWpaTC9rZzIyRFAwalcrdnd1ekdETm05TjJuSUtBaWJmRHkzQ252SXVGdlpT?=
 =?utf-8?B?RUpDZ0IyZHVmMzVzNkE5ajZaUnptVG1iV0NFVEhRbFRKVzhwdklGWjBQajkv?=
 =?utf-8?B?WHZmRTRuSTA2U1p4OFBwM1Q2bHhOQllCdXJxVnRUN3RUVlJxNkhoR2cxMUd1?=
 =?utf-8?B?RmJuVUZnU2hlSE9MNlRRYlYrOGRrNEZJRTN5ajVJY1RrT0pVa2JKSTBXWlNE?=
 =?utf-8?B?MS85VkZUR0hETGtoN1lJZ0ZtWTJqc0FxbDNHNWIxZFhEcFVmZm5tVXZJV0V5?=
 =?utf-8?B?M1RscEphWW04aERXYWxnTHZIeWlBN0MxUjBQTjMzTGxQQUpkSTZDakQzRjVx?=
 =?utf-8?B?ZkhxbFFUZjA3cHZWZldDd3ZpQjZXZTFTRDl3MlhnbFl6cFlZK0JxOW1xVkQ2?=
 =?utf-8?B?OGVoWjEyN3FRMkxLZlFQWUtqZlFCSnBZUU1GUzl6SEI0cjNoVHhlYURqbnBo?=
 =?utf-8?B?Q3prdmxpaGc2ZUZBcDZwdWVhYXFwdXBkYStCeTVrZ2pGUVkrbG9RR1k1VDF2?=
 =?utf-8?B?ajFlWkJXYXFTa1lwbXBBVS9yL211K3ZKTklqM1ZCejBvVVJ0RndjOU1ubFIr?=
 =?utf-8?B?cVJGbFRwVzE5R0Nnc3NQcURnMDNqSW9jbEdMVmZKMFBQTEo4STZFRk5LVEpo?=
 =?utf-8?B?bGJ6VWY2MDFzQUhsVzNRUWhGaGZqR3lhWDZBenB1TFBUUGV5TnBOdGM2aGp5?=
 =?utf-8?B?NFFLdWpLanpCeXN2NjByM3ZzTXNwTFFzcUFaNGRTSDU5Z05yVitpejgzbUhm?=
 =?utf-8?B?cm96OXprTUgwVEdoQTZXT29WOVVWODU2Q2x0d2kwRlUyVERsM2hsaVdoUkkx?=
 =?utf-8?B?enhNUGlMRDJQaGMxZnp6REs1QW85OXJtam5FY2ZnVDYybmYxY2VoR1Z2Ulls?=
 =?utf-8?B?NEFyeURhM3RDckwwVm5rVWdTRkJrd2Q4MTRITVRTZ1VxVHBnWTZvVVVJTit3?=
 =?utf-8?B?NGtYbXZxaVBHMUZLeXhTdjZkVnRuK1hTSHEzWnNsRHBJS215d3pLUU1XYTVB?=
 =?utf-8?B?TTV3WnJxdW9uZ1FZb0wzNDZKRlFjckJndDV0ODBMSGMxVnZMSzEwN25rWE5S?=
 =?utf-8?Q?vI00+Li4WpVAhZa0gkH2hbU=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e6c7a3d-642a-4a54-f908-08d9b64b9284
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2021 10:56:34.8135
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5UneFSaI4BqUH1QBy9++ApcIU1pxPAQ7JfZ48vU7fZPBpZSF+6un+UgSQvrypJ2WBPM18FrvGR/MBvAQP72VOg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3391

When it was introduced, it was imo placed way too high up, making it
necessary to forward-declare way too many static functions. Move it down
together with
- the efi_check_dt_boot() stub, which afaict was deliberately placed
  immediately ahead of the #include,
- blexit(), because of its use of the efi_arch_blexit() hook.
Move up get_value() and set_color() to before the inclusion so their
forward declarations can also be zapped.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/common/efi/boot.c
+++ b/xen/common/efi/boot.c
@@ -111,25 +111,10 @@ struct file {
     };
 };
 
-static CHAR16 *FormatDec(UINT64 Val, CHAR16 *Buffer);
-static CHAR16 *FormatHex(UINT64 Val, UINTN Width, CHAR16 *Buffer);
-static void  DisplayUint(UINT64 Val, INTN Width);
-static CHAR16 *wstrcpy(CHAR16 *d, const CHAR16 *s);
-static void PrintErrMesg(const CHAR16 *mesg, EFI_STATUS ErrCode);
-static char *get_value(const struct file *cfg, const char *section,
-                              const char *item);
-static char *split_string(char *s);
-static CHAR16 *s2w(union string *str);
-static char *w2s(const union string *str);
-static EFI_FILE_HANDLE get_parent_handle(EFI_LOADED_IMAGE *loaded_image,
-                                         CHAR16 **leaf);
 static bool read_file(EFI_FILE_HANDLE dir_handle, CHAR16 *name,
                       struct file *file, const char *options);
 static bool read_section(const EFI_LOADED_IMAGE *image, const CHAR16 *name,
                          struct file *file, const char *options);
-static size_t wstrlen(const CHAR16 * s);
-static int set_color(u32 mask, int bpp, u8 *pos, u8 *sz);
-static bool match_guid(const EFI_GUID *guid1, const EFI_GUID *guid2);
 
 static void efi_init(EFI_HANDLE ImageHandle, EFI_SYSTEM_TABLE *SystemTable);
 static void efi_console_set_mode(void);
@@ -168,19 +153,6 @@ static void __init PrintErr(const CHAR16
     StdErr->OutputString(StdErr, (CHAR16 *)s );
 }
 
-#ifndef CONFIG_HAS_DEVICE_TREE
-static int __init efi_check_dt_boot(EFI_LOADED_IMAGE *loaded_image)
-{
-    return 0;
-}
-#endif
-
-/*
- * Include architecture specific implementation here, which references the
- * static globals defined above.
- */
-#include "efi-boot.h"
-
 static CHAR16 *__init FormatDec(UINT64 Val, CHAR16 *Buffer)
 {
     if ( Val >= 10 )
@@ -291,30 +263,6 @@ static bool __init match_guid(const EFI_
            !memcmp(guid1->Data4, guid2->Data4, sizeof(guid1->Data4));
 }
 
-void __init noreturn blexit(const CHAR16 *str)
-{
-    if ( str )
-        PrintStr(str);
-    PrintStr(newline);
-
-    if ( !efi_bs )
-        efi_arch_halt();
-
-    if ( cfg.need_to_free )
-        efi_bs->FreePages(cfg.addr, PFN_UP(cfg.size));
-    if ( kernel.need_to_free )
-        efi_bs->FreePages(kernel.addr, PFN_UP(kernel.size));
-    if ( ramdisk.need_to_free )
-        efi_bs->FreePages(ramdisk.addr, PFN_UP(ramdisk.size));
-    if ( xsm.need_to_free )
-        efi_bs->FreePages(xsm.addr, PFN_UP(xsm.size));
-
-    efi_arch_blexit();
-
-    efi_bs->Exit(efi_ih, EFI_SUCCESS, 0, NULL);
-    unreachable(); /* not reached */
-}
-
 /* generic routine for printing error messages */
 static void __init PrintErrMesg(const CHAR16 *mesg, EFI_STATUS ErrCode)
 {
@@ -542,6 +490,7 @@ static CHAR16 *__init point_tail(CHAR16
             break;
         }
 }
+
 /*
  * Truncate string at first space, and return pointer
  * to remainder of string, if any/ NULL returned if
@@ -559,6 +508,95 @@ static char * __init split_string(char *
     return NULL;
 }
 
+static char *__init get_value(const struct file *cfg, const char *section,
+                              const char *item)
+{
+    char *ptr = cfg->str, *end = ptr + cfg->size;
+    size_t slen = section ? strlen(section) : 0, ilen = strlen(item);
+    bool match = !slen;
+
+    for ( ; ptr < end; ++ptr )
+    {
+        switch ( *ptr )
+        {
+        case 0:
+            continue;
+        case '[':
+            if ( !slen )
+                break;
+            if ( match )
+                return NULL;
+            match = strncmp(++ptr, section, slen) == 0 && ptr[slen] == ']';
+            break;
+        default:
+            if ( match && strncmp(ptr, item, ilen) == 0 && ptr[ilen] == '=' )
+            {
+                ptr += ilen + 1;
+                /* strip off any leading spaces */
+                while ( *ptr && isspace(*ptr) )
+                    ptr++;
+                return ptr;
+            }
+            break;
+        }
+        ptr += strlen(ptr);
+    }
+    return NULL;
+}
+
+static int __init __maybe_unused set_color(uint32_t mask, int bpp,
+                                           uint8_t *pos, uint8_t *sz)
+{
+   if ( bpp < 0 )
+       return bpp;
+   if ( !mask )
+       return -EINVAL;
+   for ( *pos = 0; !(mask & 1); ++*pos )
+       mask >>= 1;
+   for ( *sz = 0; mask & 1; ++*sz)
+       mask >>= 1;
+   if ( mask )
+       return -EINVAL;
+   return max(*pos + *sz, bpp);
+}
+
+#ifndef CONFIG_HAS_DEVICE_TREE
+static int __init efi_check_dt_boot(EFI_LOADED_IMAGE *loaded_image)
+{
+    return 0;
+}
+#endif
+
+/*
+ * Include architecture specific implementation here, which references the
+ * static globals defined above.
+ */
+#include "efi-boot.h"
+
+void __init noreturn blexit(const CHAR16 *str)
+{
+    if ( str )
+        PrintStr(str);
+    PrintStr(newline);
+
+    if ( !efi_bs )
+        efi_arch_halt();
+
+    if ( cfg.need_to_free )
+        efi_bs->FreePages(cfg.addr, PFN_UP(cfg.size));
+    if ( kernel.need_to_free )
+        efi_bs->FreePages(kernel.addr, PFN_UP(kernel.size));
+    if ( ramdisk.need_to_free )
+        efi_bs->FreePages(ramdisk.addr, PFN_UP(ramdisk.size));
+    if ( xsm.need_to_free )
+        efi_bs->FreePages(xsm.addr, PFN_UP(xsm.size));
+
+    efi_arch_blexit();
+
+    efi_bs->Exit(efi_ih, EFI_SUCCESS, 0, NULL);
+    unreachable(); /* not reached */
+}
+
 static void __init handle_file_info(const CHAR16 *name,
                                     const struct file *file, const char *options)
 {
@@ -685,42 +723,6 @@ static void __init pre_parse(const struc
                    " last line will be ignored.\r\n");
 }
 
-static char *__init get_value(const struct file *cfg, const char *section,
-                              const char *item)
-{
-    char *ptr = cfg->str, *end = ptr + cfg->size;
-    size_t slen = section ? strlen(section) : 0, ilen = strlen(item);
-    bool match = !slen;
-
-    for ( ; ptr < end; ++ptr )
-    {
-        switch ( *ptr )
-        {
-        case 0:
-            continue;
-        case '[':
-            if ( !slen )
-                break;
-            if ( match )
-                return NULL;
-            match = strncmp(++ptr, section, slen) == 0 && ptr[slen] == ']';
-            break;
-        default:
-            if ( match && strncmp(ptr, item, ilen) == 0 && ptr[ilen] == '=' )
-            {
-                ptr += ilen + 1;
-                /* strip off any leading spaces */
-                while ( *ptr && isspace(*ptr) )
-                    ptr++;
-                return ptr;
-            }
-            break;
-        }
-        ptr += strlen(ptr);
-    }
-    return NULL;
-}
-
 static void __init efi_init(EFI_HANDLE ImageHandle, EFI_SYSTEM_TABLE *SystemTable)
 {
     efi_ih = ImageHandle;
@@ -1114,21 +1116,6 @@ static void __init efi_exit_boot(EFI_HAN
     efi_fw_vendor = (void *)efi_fw_vendor + DIRECTMAP_VIRT_START;
 }
 
-static int __init __maybe_unused set_color(u32 mask, int bpp, u8 *pos, u8 *sz)
-{
-   if ( bpp < 0 )
-       return bpp;
-   if ( !mask )
-       return -EINVAL;
-   for ( *pos = 0; !(mask & 1); ++*pos )
-       mask >>= 1;
-   for ( *sz = 0; mask & 1; ++*sz)
-       mask >>= 1;
-   if ( mask )
-       return -EINVAL;
-   return max(*pos + *sz, bpp);
-}
-
 void EFIAPI __init noreturn
 efi_start(EFI_HANDLE ImageHandle, EFI_SYSTEM_TABLE *SystemTable)
 {


