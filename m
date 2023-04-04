Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B4B026D680D
	for <lists+xen-devel@lfdr.de>; Tue,  4 Apr 2023 17:58:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.518009.804113 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjj2K-0001m8-BH; Tue, 04 Apr 2023 15:57:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 518009.804113; Tue, 04 Apr 2023 15:57:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjj2K-0001jb-7o; Tue, 04 Apr 2023 15:57:32 +0000
Received: by outflank-mailman (input) for mailman id 518009;
 Tue, 04 Apr 2023 15:57:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=b6be=73=citrix.com=prvs=4510202f8=roger.pau@srs-se1.protection.inumbo.net>)
 id 1pjj2J-0001jT-1X
 for xen-devel@lists.xenproject.org; Tue, 04 Apr 2023 15:57:31 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 64a97c0f-d301-11ed-85db-49a42c6b2330;
 Tue, 04 Apr 2023 17:57:27 +0200 (CEST)
Received: from mail-dm6nam11lp2172.outbound.protection.outlook.com (HELO
 NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.172])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 04 Apr 2023 11:57:24 -0400
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com (2603:10b6:a03:395::11)
 by SJ0PR03MB7101.namprd03.prod.outlook.com (2603:10b6:a03:4e2::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.33; Tue, 4 Apr
 2023 15:57:17 +0000
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::48a7:d1ab:897:acda]) by SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::48a7:d1ab:897:acda%6]) with mapi id 15.20.6254.026; Tue, 4 Apr 2023
 15:57:17 +0000
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
X-Inumbo-ID: 64a97c0f-d301-11ed-85db-49a42c6b2330
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1680623847;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=x4cE0SxBtJATw7E3uGvEqgIgR/UsymTRX4mzi0JwnBU=;
  b=XDJTbOCIFHWHBt+cM2HasjH0u9fP1kg9DXdWVZQf/qkbifk/BhupmEY5
   If3o4SxdpjKNEjNPw/XY0HKTR4qTh41W+amyk0foGw3BffO+aoW3JzcSx
   iGJWWwGWH/A4Qhs7HjLYg9OmHNcJZvYkaIokuBswPCXIVybVqOvz+FGzF
   0=;
X-IronPort-RemoteIP: 104.47.57.172
X-IronPort-MID: 104210500
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:idS6EazMPcynro3SM796t+cRxyrEfRIJ4+MujC+fZmUNrF6WrkUPn
 DZKDGzUM/rbY2D0eo8gO4yx/UxV6pOByYc3TQpv+SAxQypGp/SeCIXCJC8cHc8wwu7rFxs7s
 ppEOrEsCOhuExcwcz/0auCJQUFUjP3OHfykTrafYEidfCc8IA85kxVvhuUltYBhhNm9Emult
 Mj75sbSIzdJ4RYtWo4vw//F+UMHUMja4mtC5QRiPawT5jcyqlFOZH4hDfDpR5fHatE88t6SH
 47r0Ly/92XFyBYhYvvNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ai87XAME0e0ZP4whlqvgqo
 Dl7WT5cfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQq2pYjqhljJBheAGEWxgp4KXBi1
 aE3Og4UVU+4q+Oqw52DTctyq9t2eaEHPKtH0p1h5RfwKK9/BLzmHeDN79Ie2yosjMdTG/qYf
 9AedTdkcBXHZVtIJ0sTD5U92uyvgxETcRUB8A7T+fVxvjeVlVMruFTuGIO9ltiiX8Jak1zev
 mvb12/4HgsbJJqUzj/tHneE37eTx3qjBdpKfFG+3t5WmHK8+zJUNB4TdEuxpcSBm2qSGN0Kf
 iT4/QJr98De7neDTNPwQhm5q36spQMHVpxbFOhSwBGAzO/Y7hiUAkAATyVdc5o2uckuXzso2
 1SV2dTzClRHr7m9WX+bsLCOoluP1TM9KGYDYWoISFUD6ty6+YUr1EuQFJBkDbK/icDzFXfo2
 TeWoSMihrIVy8kWy6G8+lOBiDWpznTUcjMICszsdjrNxmtEiESNPeRENXCzAS58Ebuk
IronPort-HdrOrdr: A9a23:tFKDTKnjg6jQzZcEk8XeY8GmgOXpDfIo3DAbv31ZSRFFG/Fw9v
 re+sjzsCWftN9/YgBGpTn+Asi9qB/nhPtICPAqUYtKPzOJhILLFu5fBOLZqlWMJ8SZzJ8/6U
 4JScND4bbLfDpHZKjBkW2F+xpJ+rm6zJw=
X-IronPort-AV: E=Sophos;i="5.98,318,1673931600"; 
   d="scan'208";a="104210500"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fNKvwg+I+Ci2icnQYj06xmeA3MCE+Z5AV2EBmLAznZTjI/arlVWxb2w9N1eecbtVGzSb3SLIVDr66+AQ9IttVl4bG8jnJ/F1O9DFCugC+QONhFB5pTX+aoSc+CUDWc7lQ+e7j/x6cUOws7I/Ce/kZMr7/4WemuP3z81oziMoRdYszwm1G9Ksn1kDlhEyJKId5Ofytdd8CFExPv+j769QuiG5kic+yDRVW9XP7gnc9GMjlNhkMiVZt8Kc8xNHC4cOrRJBAeHEFJ/D64o+S3qaHlPExxf9znsNNe2W8UQgdu35sxkQDTOMVNh/4GyTpts9EQmInuy0RpNy0ZnEhEucqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZhJ5xzIUm24PVzc6DAO6I1XdSsa+BdeUXFhz3Cs1W84=;
 b=og5/8MExSaAZFP9tFLo41KJwk7CyDfjERuOwBDg0JJ9h4HpNHaFqhtkjpbgnj1kQaIzzqDOVL8ck+Vpu1EHP6TGBjTgXuizK1W4EewgjiziVl8g36F6b3ViH5qiK4oMm5SjjcduRdupao6v05WzuUtrIdzd1lI9Lt7Bu5PxbF50qKSLPQzZX9z6P2/wNBADEghx5S817osPjORyyYSV8/uupaNa6bazzqvkJSnppTo7qe4Bqz9XNrUHzCrxKrVGYjJEoSsuJN8R37NUrJ/8wjaFFO6s4DjfnipIBVqSJgW9YYAgp5i7JPp99HaI/cMqZPqgO8DNX7iYilvwawyC0JQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZhJ5xzIUm24PVzc6DAO6I1XdSsa+BdeUXFhz3Cs1W84=;
 b=BdDp7i9H65v8BSLcY3kknAuFISKAxdjdnFBLOOsri8M0I4aXqo49U/6VLeKA4LvyI6lStS1SfjnMJx9r0UvwQfGq6k6HcUqNr6LBLC9o9aLF9Sz+9fdqxluNCMTxEpoLnsDP0Zsh202WopN4IuA7oz7GpLNRWmmHFccU8XJ7/4M=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Tue, 4 Apr 2023 17:57:11 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH] x86/PV32: restore PAE-extended-CR3 logic
Message-ID: <ZCxI18gb8zK5X+nR@Air-de-Roger>
References: <47ab9000-68f6-8925-d814-a3a955b7f6cc@suse.com>
 <ZCv3+cpzJ52Y679G@Air-de-Roger>
 <3752672b-f4a0-5ffb-9759-dd315ce31079@suse.com>
 <ZCwM1SfCAfh2koBD@Air-de-Roger>
 <ac13fa57-ceb2-0aaa-dcfa-42d8d01ee6d7@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ac13fa57-ceb2-0aaa-dcfa-42d8d01ee6d7@suse.com>
X-ClientProxiedBy: LO4P123CA0409.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:189::18) To SJ0PR03MB6360.namprd03.prod.outlook.com
 (2603:10b6:a03:395::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6360:EE_|SJ0PR03MB7101:EE_
X-MS-Office365-Filtering-Correlation-Id: ac7192a8-c1a5-49c6-3c33-08db352543bf
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	V4rzIh/kFzauq0AWovF4N68I/MYyCjFsSBk12qtixJK/8Zlg5ulazUbLMYEFS0DS20Zvw9vFkFQFM7KK3tuF8FwfIYnhCwrrgTL1bOcunzTNRNIIGHhUoZkui7Am3+NcWH7DQ+70rA/HD8Au3wBC0ukb1bbb/kSd5H7IY4tlafQ7EO1lICrrBnvWYsv2OeDe86Z7rVS8yGZRV//9J5Ojdi/k5sbitI2J1Y521hrnFEKWGurZBJZD3gkXM0gnhlnSJ3iN3Ydap+sIh3MonBkgtpaiKrTdmgZdW65wx49LIAMbsTyFfb4XLeXPDEBGxrYRSNzaIr01+2qEFoVKNyUeTKeJ3bpcdrhl1LF6YGfaXGbXtSPjfCfGUAnm0Tat+XKqa9FJqdDJ2nJXmYcHGXYKkbrzbAn29g/9hSdisn30RZe/0F/fK4Hxl01Z1PTe9obKisn6cqmb0yecGBZ8kUaCvBG+J3V/Jt3gFStFY1ubADPVBBKdW5YwNpTgho+eMDin29VbqVayOJZQsMSCvKEcptDAG03cPWb3xLJXxJJv4Jcw+xtojvC558mwM5a13hBO0Utqlm+AMJWoUX4y5ggcIbd1pwwav+PMDwSBai0msNo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6360.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(7916004)(346002)(366004)(39860400002)(376002)(136003)(396003)(451199021)(2906002)(82960400001)(38100700002)(86362001)(66899021)(33716001)(6666004)(6512007)(66476007)(66946007)(66556008)(8676002)(4326008)(53546011)(9686003)(41300700001)(6506007)(26005)(316002)(6916009)(54906003)(478600001)(85182001)(6486002)(83380400001)(5660300002)(8936002)(186003)(67856001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aHRTNnBEMUcvTWQ3bEVRMXRrTVJBMjIwV1dIbnVBYTRNZkFSOGFBSkZqNkhE?=
 =?utf-8?B?ZzRBZVUrVXpPYWhmUkcyK0VCWTlsa1FSemVxbTFrUlRGbjBCOTNwRW9xeVJo?=
 =?utf-8?B?TFF4TlNORHp2ZVRkMzM0WDF4d0tHdkUwU2VxWjkvSU95QzA5WlQwem04UFky?=
 =?utf-8?B?d1crOHYwVVg5VlhvaVRzcURkYVhrb0w2YWd0eVhLa2Q0RGM5Zms3NzBWazQ2?=
 =?utf-8?B?SEc4TjJxN0JLT1UvcGZJS3hWbTVjTDFpN0Jra01IdXNsRWR1NVlDRDJSYWZt?=
 =?utf-8?B?WjNqTkNVYk1BYStDN0xlYS9taXZuZDhCaGZSZ3ZKMGJGbzh6MFhIVVh5UEpH?=
 =?utf-8?B?TmIzckN6dmI3SnVGOGQ5VkkxNHkyOEp2S21SK3AwK0x1b3VVNGFJNFdVRXBz?=
 =?utf-8?B?VXcreVNnK053K2pGc1FFNVpocUhMVkpRZG5zNEh4L1JYb3FPaFhLTlY0TWlC?=
 =?utf-8?B?ZkZhSmZCa0RnbVFxb2FtcG9JQVBYcExPWEU0TWpMMlZjVHQrcGlPVXU3S1BC?=
 =?utf-8?B?dHFzZHdkbkhBQWR2enBQSDk4U2lGa1QyVklXZ2VSWmlUVDNyL3gvOGNTcFJ5?=
 =?utf-8?B?TFR2Vk4zR1ZoUEZHODh4d255WjFwcnRJM1liOW51KzhtUWtna1hhVEd6R1Zu?=
 =?utf-8?B?TXVlZjlHR2RobjlFQUFWQzBuUTAvU2pFUXAwN2N6MWcyM3FPZC96cHRQWm9j?=
 =?utf-8?B?ODdPQnpuc3loSmtSWVk2eGpnUXBOcE5mRlBVejFFdldVTVl3ejIyTUxIRTBv?=
 =?utf-8?B?MDJEdjB5Qk8xaWxiZE9KejVBRldaSWRGRjdMZ0gwdEFsR0JNOUprR2UzYi90?=
 =?utf-8?B?cDBYQ3haQldjUjRRL1Z0MFVEc0s3V2U2MWlXZDViN0R1SDZRQkFTWGlmNk5h?=
 =?utf-8?B?dndtRUpPc3gxQjVuMkY3Yjh0OEI1YklhWmFOZXhNQjZnb2lOVnFXOVVyWGtj?=
 =?utf-8?B?bzRHU0diSENsdlV3TlRHbVd3dDNSSWkycGpvS2ZzemQ3V0U5QlB3THFyTmlP?=
 =?utf-8?B?TWZyV3h0ajhSUlZiWW9CaUdEc0htYnlxcHRoMEgxVDIzWW45K2YrL1RxZFd2?=
 =?utf-8?B?Y1crQ1hRcEU3QllOcWJoYWlybVA0TTdkaTRDYXRNaDd4Q0FNb21SQ1IwN2Yw?=
 =?utf-8?B?d3gxQlBld3IrbFpKMWtRS204ajhXa1BUNkVjMVdJRThCSlpIa0VLcjVYMEdF?=
 =?utf-8?B?V0laL2ZONzdXMm9iSmUvVlZwcGdxQkpSMDVpWnArUU1qdmJobzRSS3VIY2Jn?=
 =?utf-8?B?U3YvTUZTUDRVMllWcURuZHB2eXZCaFptR000eUd0WDc0NW5vQnR3NmdaUU0x?=
 =?utf-8?B?ZUlETXN1VHFBaE80VnMxZmJMRHpoRUtDUVlYbVQzK2xLSzN1b0kyaFRSUjJj?=
 =?utf-8?B?WmhoVlF1Y3Q5Ulh6ZXFhTi94Wi9wU1hwQ1BOU1JaUlgyMDJrbDlRYis1M3ZB?=
 =?utf-8?B?cUtCdEI4OC8xWHRvNmJqL04rQnVBd1RtRmsxc0tOZUtmbXFnY1NpRFB4dFJD?=
 =?utf-8?B?R0NmZzREUXJ0NW1SYklSUFg3ajU5OWpXb0o1L20wUW94TzlIbUFtNjI2SmdE?=
 =?utf-8?B?bkg1K2M5VUFCWmU5cUNza2tBTFg2UURaVFpDVmF4djh4ZjJmTU1odEJ5OStS?=
 =?utf-8?B?bDhRRUVlc0MvNVhnbVZDWGJRdFFsNy9zbDIzQjBpUFVZdTZJcFI1YVBlaGwz?=
 =?utf-8?B?d0dOdjd5UkJLV3R1ZXJ6eFlKbEJHTXBRQ295elNBZzJqa3MrYWJ6TnZGMUFR?=
 =?utf-8?B?UDFqMEtUb2VOMDNMRi8wQk1vaWxCRHN0ZUhjRkdOV3lwcmRIWW9Eb3NIVjd2?=
 =?utf-8?B?OWo3VXN3cm1FNCtEQXFubHZzM2QvL295bXhyd2R6NWpLWVVqUHBwYVV4bnJV?=
 =?utf-8?B?MlhGOGU3eG9leUhtcUhtYjVQQ0d6d0RLM0twWGVKbk1ackNMMTBJaTNOREFL?=
 =?utf-8?B?MWFxcFEyZHlGNktJZTJIalplVmRFU0pMZVdpVTFkcDFka25ZTzAwUHZ0SlVK?=
 =?utf-8?B?MGp3MEpxSFh2clVvaTJHbHVCZWVocUM3c0ZQakIyZVNnYzVseGtjT01WOFhv?=
 =?utf-8?B?ek5mN0dKa1BKQ2xRTk5NQVJwdHJ3N3NaOTBQWDRHL3IvZEw0dkVCdENBYjZv?=
 =?utf-8?Q?yn8dKp5HVKQ4se3D9lGEDc+48?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	JLf8pMbefW55+2gdRTJqVSLIMVy6xOlc6xGMqrEBSW0mAsV3RVb38VrQokofDAcVlmq5Z6pescGHitHcfhjCDt4Ax8QkoFI6x6pyHIdK6V7ySIBdumbmat0yC2Nya9lRYTR/0MMCneK7rQ/roMHZ+BbdQX381Scpoqe0VTP936BHDUkwgRnsKZu+eRj9E2dXJjVbUPC2ekAO7eOvBrSsXPsPqR15T2YDV3ZuzbnPP5XCJO5rnyPcLo1ml7ECRKh3ixwfvCXJFlUsxHRIrD8lG8CbnhPD4lVcp0GbqZzFTcpJE86jDEhf1V/vwkgS6wQUAJ+VIW/D14+g4Oc22rLrd0KymnjFa5SCteRbw/XCJdIOZU+UebMS8G/Wa2CZnLu/wC3R4BS/MKz2sdluNLg5F93syhdlcOcimpeQ7n241RTz03LC7I5+dojxaL1H9KaHyAckRDYywVgC+dl7x/6mnlJzX9QQg9aCUQD5wA96oTBGg4mf+SMAbu70N8hV1nhnq+4zko/i1kjnljO76pgAEDvNy/p+79VFVcEMFG+EbT7VzFb9xnI6yW4qTOiGRkcsQaGjDHl7xeKjOlzQRAE5/FzJNs/GN9mONDh2uc+voGL2bOiPdHNzejmFp2ec/5MwPKM5oOH4/lwvH/5ZMAdLr6uZJOyo4tLCkhlt1kWrbAHeReWxwsI+63jho2O8qnt1NK4Na5z4wOmCoffegg7Je3RuqcEsMh1krovCtz2CBEV+BoehlO1U5tFaw4Gp8UHbxKkpglPrZWGuhWZBSsoxYwkUfJTzQbD3gWr6OGSq/6NZmMv8RZ80ZWB6fIGleA+e
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ac7192a8-c1a5-49c6-3c33-08db352543bf
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6360.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2023 15:57:17.2939
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EsjZht/Ytd4OyysFc8M1iLLlbFfkkf2v7qfuc+Hp4XMRsUgQGxXnF4LUqcvsW5J4V82c99jw3DCcq+1MGtisIg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB7101

On Tue, Apr 04, 2023 at 04:24:16PM +0200, Jan Beulich wrote:
> On 04.04.2023 13:41, Roger Pau Monné wrote:
> > On Tue, Apr 04, 2023 at 12:31:31PM +0200, Jan Beulich wrote:
> >> On 04.04.2023 12:12, Roger Pau Monné wrote:
> >>> On Wed, Feb 15, 2023 at 03:54:11PM +0100, Jan Beulich wrote:
> >>>> While the PAE-extended-CR3 VM assist is a 32-bit only concept, it still
> >>>> applies to guests also when run on a 64-bit hypervisor: The "extended
> >>>> CR3" format has to be used there as well, to fit the address in the only
> >>>> 32-bit wide register there. As a result it was a mistake that the check
> >>>> was never enabled for that case, and was then mistakenly deleted in the
> >>>> course of removal of 32-bit-Xen code (218adf199e68 ["x86: We can assume
> >>>> CONFIG_PAGING_LEVELS==4"]).
> >>>>
> >>>> Similarly during Dom0 construction kernel awareness needs to be taken
> >>>> into account, and respective code was again mistakenly never enabled for
> >>>> 32-bit Dom0 when running on 64-bit Xen (and thus wrongly deleted by
> >>>> 5d1181a5ea5e ["xen: Remove x86_32 build target"]).
> >>>>
> >>>> At the same time restrict enabling of the assist for Dom0 to just the
> >>>> 32-bit case. Furthermore there's no need for an atomic update there.
> >>>>
> >>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> >>>> ---
> >>>> I was uncertain whether to add a check to the CR3 guest read path,
> >>>> raising e.g. #GP(0) when the value read wouldn't fit but also may not
> >>>> be converted to "extended" format (overflow is possible there in
> >>>> principle because of the control tools "slack" in promote_l3_table()).
> >>>>
> >>>> In that context I was puzzled to find no check on the CR3 guest write
> >>>> path even in 4.2: A guest (bogusly) setting the PCD or PWT bits (or any
> >>>> of the low reserved ones) could observe anomalous behavior rather than
> >>>> plain failure.
> >>>>
> >>>> As to a Fixes: tag - it's pretty unclear which of the many original
> >>>> 32-on-64 changes to blame. I don't think the two cited commits should
> >>>> be referenced there, as they didn't break anything that wasn't already
> >>>> broken.
> >>>>
> >>>> --- a/xen/arch/x86/mm.c
> >>>> +++ b/xen/arch/x86/mm.c
> >>>> @@ -1520,6 +1520,23 @@ static int promote_l3_table(struct page_
> >>>>      unsigned int   partial_flags = page->partial_flags;
> >>>>      l3_pgentry_t   l3e = l3e_empty();
> >>>>  
> >>>> +    /*
> >>>> +     * PAE pgdirs above 4GB are unacceptable if a 32-bit guest does not
> >>>> +     * understand the weird 'extended cr3' format for dealing with high-order
> >>>> +     * address bits. We cut some slack for control tools (before vcpu0 is
> >>>> +     * initialised).
> >>>
> >>> Don't we then need some check in the vCPU init path to assure that the
> >>> cr3 is < 32bits if we allow those to initially be set?
> >>>
> >>> Or will the initialization unconditionally overwrite any previous cr3
> >>> value?
> >>
> >> That's not the way I understand this "cut some slack". Instead I read it
> >> to be meant to cover for the VM-assist bit not being set, yet. Beyond
> >> that it is assumed to be tool stack's responsibility to constrain
> >> addresses suitably. If it doesn't, it'll simply break the guest. (There
> >> is some guessing on my part involved here, as the original introduction
> >> of that code didn't further explain things.)
> > 
> > If it's just the guest that's broken I would think it's fine.  As long
> > as such mismatch doesn't cause issues in the hypervisor internal state.
> > 
> > Did you see a toolstack setting such entries before pae_extended_cr3
> > is set?
> 
> To be honest - I didn't look. As said in the longer reply to Andrew, I
> think it is more logical this way (the page table root already being
> validated as an L3 table when vCPU 0 is inititalized, which includes
> setting its CR3). Hence even if right now the order was the other way
> around (which I doubt it is), I wouldn't want to make impossible to
> restore the original ordering again.

IMO I think it would be better if we could already report error at
domain creation time if the toolstack is attempting to create a domain
that the hypervisor knows is not going to work properly, rather than
allowing it and the guest failing in maybe non obvious ways.

It seems to me however that we would need to fix xc_dom_boot_image()
in order to setup the vCPU before creating the initial page-tables.
(->setup_pgtables() hook being called before ->vcpu() hook)

So I don't think this is strictly worse than what we have, but it
would also be nice to get things sorted out so the ability of the
toolstack to shot its own foot is limited.

Thanks, Roger.

