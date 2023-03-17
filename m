Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8089D6BE62F
	for <lists+xen-devel@lfdr.de>; Fri, 17 Mar 2023 11:06:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.510980.789607 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pd6y9-0003TY-Jf; Fri, 17 Mar 2023 10:05:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 510980.789607; Fri, 17 Mar 2023 10:05:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pd6y9-0003QB-Fb; Fri, 17 Mar 2023 10:05:53 +0000
Received: by outflank-mailman (input) for mailman id 510980;
 Fri, 17 Mar 2023 10:05:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=001K=7J=citrix.com=prvs=433d55c46=roger.pau@srs-se1.protection.inumbo.net>)
 id 1pd6y7-0003Q5-V1
 for xen-devel@lists.xenproject.org; Fri, 17 Mar 2023 10:05:52 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 490e7ed7-c4ab-11ed-b464-930f4c7d94ae;
 Fri, 17 Mar 2023 11:05:48 +0100 (CET)
Received: from mail-mw2nam04lp2173.outbound.protection.outlook.com (HELO
 NAM04-MW2-obe.outbound.protection.outlook.com) ([104.47.73.173])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 17 Mar 2023 06:05:41 -0400
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com (2603:10b6:a03:395::11)
 by BN9PR03MB5980.namprd03.prod.outlook.com (2603:10b6:408:135::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.35; Fri, 17 Mar
 2023 10:05:38 +0000
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::48a7:d1ab:897:acda]) by SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::48a7:d1ab:897:acda%6]) with mapi id 15.20.6178.031; Fri, 17 Mar 2023
 10:05:38 +0000
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
X-Inumbo-ID: 490e7ed7-c4ab-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1679047548;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=ufl4KFj/550MwfRz4wryGMZEhCnMc/CqlnsILxobF0Q=;
  b=E9Govjoin0gy4Niz/frg7ECbTYBklZf/yY5yJWZ5QsG7zAssaGk2X4gX
   ypWUPmU72i9D9RGhF8mXDCVhldc+sJMD/ovXzrMGhgSZ5VmXz2TFoWLgq
   5C/MItgxU7lH06lD1deBC8i7XQLxwuK9daDSaTyZACoJraVwWfpQ3U+yi
   k=;
X-IronPort-RemoteIP: 104.47.73.173
X-IronPort-MID: 100614782
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:ezuGvqlwRPYSex+8ANwFM4zo5gxjJ0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xIZWD+CaP2IYmv9eNpzaY3n8E1S6JTXm9RmHQM5/iExFyMWpZLJC+rCIxarNUt+DCFhoGFPt
 JxCN4aafKjYaleG+39B55C49SEUOZmgH+a6U6icfHgqH2eIcQ954Tp7gek1n4V0ttawBgKJq
 LvartbWfVSowFaYCEpNg064gE4p7aSaVA8w5ARkPqgQ5QCGzhH5MbpETU2PByqgKmVrNrbSq
 9brlNmR4m7f9hExPdKp+p6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTbZLwXXx/mTSR9+2d/
 f0W3XCGpaXFCYWX8AgVe0Ew/yiTpsSq8pefSZS0mZT7I0Er7xIAahihZa07FdRwxwp5PY1B3
 eY0MW4zale4vd7o462bR8gvlt8fIta+aevzulk4pd3YJdAPZMifBoD1v5pf1jp2gd1SF/HDY
 cZfcSBocBnLfxxIPBEQFY46m+CrwHL4dlW0qnrM/fZxvzeVk1c3iee2WDbWUoXiqcF9hEGXq
 3iA523kKhobKMae2XyO9XfEaurnxHujBttOS+3inhJsqFqs12E4JR0Wb1qYhd+grRC3XPdwF
 kNBr0LCqoB3riRHVOLVXRe1vXqFtR40QMdLHqsx7wTl4rrZ5UOVC3YJShZFacc6r4kmSDoyz
 FiLktj1Qzt1v9W9S2+Z97qShSO/P24SN2BqTTQfUQIP7t3noYcyphHCVNBuFOiylNKdMS706
 yCHqm45nbp7pfAM06K37FXWmQWGr5LCThM2zgjPV2fj5QR8DLNJfKSt4FnfqPNfdoCQSwHdu
 GBewpfFqucTEZuKiSqBBv0XG62k7OqENzuahkNzG54m9HKm/HvLkZ1s3QyS7XxBaq4sEQIFq
 meJ0e+NzPe/5EeXUJI=
IronPort-HdrOrdr: A9a23:3zH+Hqxzv+pNORl9DaB8KrPwl71zdoMgy1knxilNoNJuE/Bw8P
 re+sjztCWE7wr5PUtLpTnuAsS9qB/nmaKdpLNhXotLsmHdyReVxcJZnPbfKwSJIVyAygcl79
 YfT0EdMr3N5ClB/KLHCVKDYq8dKbC8mcjCuQ6d9QYOcegNUc5dBmxCe2Om+yNNKjWuLKBJZa
 a0145opyeAZX9SVciyHH8DNtKz3eHjpdbJYQMmGxVi0wWFjSqp5LnmeiLopSs2YndgwaoC7W
 OAqADy5ryiv/anjjfQ2nTe9Y4+oqqQ9vJzQOKNl+kIIXHXhgGkaJ8JYcz7gAwI
X-IronPort-AV: E=Sophos;i="5.98,268,1673931600"; 
   d="scan'208";a="100614782"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jgJ8gkL4FpTaBpPLNjSB7U6UCu4z2KZCpVCMAMK1S0nDmbOS68XhsF6v8Gqw2csoq9uGy9H5+oeQnWJ7wxfo9ZvU06lcMdYytZHgUOygwYO1CHxDH65s1JazzM96SkT5qJvvpw3QAKO3gGl2Kmvp35+FYnXEPvF6YCUufa3kqUwaLDXezi10P7nElxtO7LZnrDYPWRZGQO5EasAqo9jr90W8f/2XEEGsM0/Ys4NFWOHH5PMIF28EwtizoaHL6TjYc7y6NUYhp/qggen+M4cNwC4wX4LVrhQnq7d0MnbB8BukP1sLc+M6+7F/JyTPxFak7WUPddjrVAhH0+d7cE35cQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=09Qnpf0epWFhf1C2bypJQVHdua/AjLFMIs9olYFn/68=;
 b=N82//oD2MEwjE4xjuTs88T863PpssQXrKoavJM2JXm6q2ZmNBkm0KnxC7olp7DRTUOTY2eh8he5M8OngyHfsxhN8FllK3gbuLTLvM9si6iQAMhFBddszmcaHAoEQrIchaBDtZVgxZ3GsT2C9g7BtnuK8sUHACuIkEISKwdYts2ZFPGNRctvnAVUGs49WcM7gLlHzSlU6VUmaRrLhvW6NB+74GkxQh8ZZNO6Oq8eD8yWdypM+DLxOY23L2SN0iprVHoSRrCJUBAf+MlW+Lh+MuC0ALKPBeUkmC2WsmszKBFey4qql+TzcbJJAJ6C/tQ2V75cMpDiWbjuwfRJ+m991Xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=09Qnpf0epWFhf1C2bypJQVHdua/AjLFMIs9olYFn/68=;
 b=xI8c993tl8o116kBrSOxyuzM658SmBxzO32rgaB2wS5ZcXZLv7ZoEznl2680GYukOs9nYcuBxwyIkpjFaiVkSdFP2wVpOGyuzZ2ey1ZyLMCBym6A56XgtSyRF/oKNu7v9x22okRf0DWtDuRqNceGzP/xMCT4ussRLUhqYj+0EKc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Fri, 17 Mar 2023 11:05:32 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v3 1/6] xen: add reference counter support
Message-ID: <ZBQ7bMo8JRsBUVmN@Air-de-Roger>
References: <20230314205612.3703668-1-volodymyr_babchuk@epam.com>
 <20230314205612.3703668-2-volodymyr_babchuk@epam.com>
 <ZBNBhS2I4XWkwXr0@Air-de-Roger>
 <dc31ee54-b6ce-3251-ab0d-487d9a9bfd35@suse.com>
 <ZBNGO7/NY0VQQM/f@Air-de-Roger>
 <8331a0c4-07fa-0340-20bf-77a5c8661aa1@suse.com>
 <ZBNIbhW3Eu07aj8I@Air-de-Roger>
 <9693e011-a0df-4b18-fc49-fe8f46d97d9f@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9693e011-a0df-4b18-fc49-fe8f46d97d9f@suse.com>
X-ClientProxiedBy: LO4P123CA0686.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:37b::18) To SJ0PR03MB6360.namprd03.prod.outlook.com
 (2603:10b6:a03:395::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6360:EE_|BN9PR03MB5980:EE_
X-MS-Office365-Filtering-Correlation-Id: d372e3ca-6a3f-4264-1e4e-08db26cf2837
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	M831rcooCfdHZS9KduZQI8jIr3LQCPW1amwNAGHhZy/N+VNeCjGzay/XHSraphwjVSjCikDfjmWQAwmLnOVdKSuFvtCXR+JsIuC3pWpy8jKeLrc7YZuKjEuxVB8ZdX6BZEcA4IgiHNmNX+699TLVTfq8akpO3p1i7ebyWnJ41QW5cf/1alglqGyVo9+43er4RvPT7EZRPna5yJggNSlkF2LucYTxHfwEhnpGTyvRh6ieQqK+AkjbiTx2EE/3esAgPmXmIU8ECHEXTb1cTfQkQT6wzWgiR8LwJWKO1L7+j1sHFzQBgaMEK7KyRrQFBxWhGtH+DiWJx+cINsQbNRzwBKzayecshx4jhZzZh8huYCAojQaN8oqDbHahnv2bJAaG+aw2GLc94KGoBEtalue96Z45Q+SHn2hrLjREWi+rOsX5wXJhJFc9x2KL4nE568mQQUjYhQMwITbUOw0KMdqbq1eSQkrhyY6iZEaHqiWnxAnWmv8QO9ae3nP5ywP9JbL0Sixu7S/zSdXC4Nd8Ddq/b7gqe/XUn36bJX5Wik9pVazo3GxEu+mZFq/xF3WS3Ut6TKVKRqKjPWAVHjvBgXmr7dY2TMBVX+6ZUrq6yRjK9iHyfoPJSFlpgoRcZ8pIbONS5BcIZ4uayrJrg3uGTl6Y8w==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6360.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(7916004)(4636009)(39860400002)(366004)(346002)(396003)(376002)(136003)(451199018)(85182001)(38100700002)(82960400001)(86362001)(4326008)(9686003)(5660300002)(2906002)(66476007)(8676002)(6916009)(66556008)(66946007)(8936002)(6506007)(33716001)(186003)(83380400001)(316002)(54906003)(53546011)(6666004)(26005)(6512007)(6486002)(41300700001)(478600001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WWRrOEZjZmlRaXAzbWc3NEVYVEpOWjZZL3J6c3hxbHkyQ2FQQ1JORnB4azVr?=
 =?utf-8?B?SmFHS2FIM0VNSzZ2TUtid2FrMGRFZjgrYVZZV0JPbUY1U1k4UUFnaUNBaDZU?=
 =?utf-8?B?TzIxZ21rMjBuVXRhZHdFWGZoK0VLcEluOWxWWFNtMWtLTWN4QXdUd3JGcTFU?=
 =?utf-8?B?RjY0QU1TV3RycnlVSnhOKzl6Z1NjVW9lVk5sZnJpMnhDWDUzUUgxanFkV3Za?=
 =?utf-8?B?b0Z2bFFkQkpCemFXMVVjMXNXTUtlRWZjTGs0b3g3OXI5S29FMmZmdGRFWkRD?=
 =?utf-8?B?NHNxSFREcXlZeWlCenBtYjBsRzlSYjAzSlVobExYVmxObVdtencwbzN0bUtO?=
 =?utf-8?B?SXFiMnlGeTRHQjNmMDFrTE9Mb0EzYUgxaWFsdjhRcTNCWlRBRXRBWnQwMWVt?=
 =?utf-8?B?UG1icThqY1lxa1hsZXlqcVJGVis0MlhsbW5td3NpcjVLZjU5VW10NWREZk5a?=
 =?utf-8?B?QnlTZmx0N21IUkVMOWdOWGttYmNxVndGMVIzVE9uUCtGd3QrRGNsWVpCdVhC?=
 =?utf-8?B?SUZRSGV6Z2hsanNGS0sxZytMS3JnT3hBNGYzQjIyQldLRWdQQU9lYmh1L3hr?=
 =?utf-8?B?dnJtQXJZbG0vYlgzUmJkUEFnTWo3OVM1RXdGTlZTWDJWVUg4LzZnUzZDeHRm?=
 =?utf-8?B?VmcxVGJHS2NCT1BhclFMK3dZdFY5YXhySzh1NWF2eE1CRlZUWWRIb1dOQjZv?=
 =?utf-8?B?M3lMZDE3aW92VHp2bWU1cDg0TG91OVZTSUJCMFdiVEtDbWo1NmxPbzhhajdx?=
 =?utf-8?B?NEJuZjFDcEJnTThrR05LWDEzMjhvbmwyZzFkZm1TV3VyaTJrN1I1WFJEcjhr?=
 =?utf-8?B?eGZDZTlQa05QK1VMZk91Wk5ZWWFCSXJDc1B3ZUtNVE9UNkNvaDFVdW9ZbzVB?=
 =?utf-8?B?Tkd5TnlGelFFRUJENHZtOGxvMlZSZW0wQjJoRU56TzZ5RlJ5eW1oNGs3L0ww?=
 =?utf-8?B?SHR0V0kzbnFKODlCVWNrbzMyQmlYa3hJL1ZITll1MmRZM2UzVEFvdDVUMEZ0?=
 =?utf-8?B?KzNkR2dwL1Vud0diN2hXdUF2Y1U2UjNPWWZzUFVWNFRYTVJJSkQxVGZ0MXJL?=
 =?utf-8?B?Z01sTVpFMTkyUk1raUtNTkRCVHRRUUF2SjNUZmVUeXB2UWZQVkQ1K0dNV1FC?=
 =?utf-8?B?VnpZMjlwUlBVZzR2U1JMSXhDUGdzQWxDQmczMjhOUi9kZER3YVJJWUVkRldD?=
 =?utf-8?B?eERQR1pTbStzbjBWdWNsN1VKdld5N2xoN2pIcTVkREYrSFpqaUszYWtUcGhY?=
 =?utf-8?B?SzlTdGIzQ01hcndIdlNGSG9LWnZEZElOMHcvazBWWXhwQWVXTEdKcWoxS3R4?=
 =?utf-8?B?SUZIbGFvV21XVXNVTVZIUUVZeGt5SjVOL1FsNURsMHh4VWpsK21vNmdlOGRl?=
 =?utf-8?B?bEp3cm9aUmlsU1BSb0hheXYyTk1oVm1iTmVGY3lHeXNOS01jMk0raDdSL1ZE?=
 =?utf-8?B?dVJmN2VuSjBzM3FTaUJsekhHWkZ1dE1Ka2VzdW1FMUhEWU9OVE9qMjNBRklZ?=
 =?utf-8?B?NW4vUGs5QWRzV3lxeUNPWnMzeTdRSnFkdXFmMmFLSlhmSEo4cml6T2ppbFdP?=
 =?utf-8?B?UTd3LzYyWm4yVDdEcXhhNUh3dlMzV2NHcjNnZk9TS3c3QzFVR092blR0Ulky?=
 =?utf-8?B?YkNlRE1IN1hMbGJxM2FqUDZ0Vmk4VlRwdHlVYk5ObWNJcVl0TEFwQ1hVcHAw?=
 =?utf-8?B?aDZpZFMxQXN6YkJMYnNGWkE0SnBSazJQODF6NkNFTFUwaEk2MUxTQmI4aWxw?=
 =?utf-8?B?bk9iMzJoeUNSWDN5dFRvRysrdENUQkpnQVhpVC9qWFZsWFQweWEzbklsK2Iw?=
 =?utf-8?B?MVJ1N1pRdFRnanNNLy92YXA3S2ZycW1xUkROTHZobXIzNTRrRTE4QitDVnRq?=
 =?utf-8?B?SnRkWmxQZFJ6ZDlyZHJvbjBCa3Yxam1HNS9CMVJqaTQ3UXNsd0ZVbXE0NVl3?=
 =?utf-8?B?d3FaRDdMcnhJUExOTFJuUHF4cmZJMjRaSm5UQmFneUZLWVllSmFWRXdwbFN3?=
 =?utf-8?B?MFRLNldQV253VUdCL1BGdDkvbklSN3lVT3NoVzkyOVRFK1lKSUMvek5OaGN2?=
 =?utf-8?B?c1A3V09yQW13NnM3TEtabjNwbkpTVFJEdkU1MVhidDQ4cGFjaVMrYjZWK0JU?=
 =?utf-8?B?eVN1R3JWMU1sMlF5TmFhYVJnbDZOSmJ6UWVGU0ZXUnhIc2YwRmFNWTVxN1Fr?=
 =?utf-8?B?M2c9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	YT8tpR87je65R0VVjA2cd8cQWLJNCNs4Y0fxZeEioyg3wkV+fgDCwjVSEd4HXUy9hQ33YBN3aoM7uMhtD9+H3jqEKVef2TnxzesrEHtgxL5QCsOprxC8asp4uKTA0ilhA4U4F0x5OBPoh9fL6RCBAl+3BW/xolv9tyPvckuBq64uOqXolLORDGxb7thIFoZX5DuULEEpZYVgR7tqlMWGPZb4btCCsBZRZWlCYVTd8J95E3CSGMuGW/YVxDK4jNFV1WIfEr+ej3+WIecZ/goGFC97ScdLk8pPPXbW8+oAczc/eyJLBSY09ptQsjEMOGt6s4N/XpslNqhPd+DYu/B/mkCme03xXtMeATagzuhTVpUvTUas63/FH3GSaF4DtqAuKTcNXp/zu45z1yNiaIqI5NgaYwG6sK302WEJpxU7HpSYUsMvOfCwHD/9zpwIJmof4aELJ0B9KqjcRTXvpl5sVsdKMvoy5pLVuPnkwdsVVtVBpUnvIom/cdutfjOfgZ42U/JU6zhbon62BnvLmqLIpyCf5loGIQFHfW5hgHWQYogTBFFS+T72rzwzXyGb1MjruT3D4WdQZOfh+eIaDdL+9dLWICk0JY7OmXw7Wtzwb95wL4OLtDtuKVuDBtg0wnW9+SEx18jjleyvE2EdP4W1oa5GrMdoxOhZCL+0SCUcv1CT3DMdZuOn7I1SseisEuCp/LdWPDmTVbKOIb9WjubXJQSIM5qMfSVgCjIQ39reYvhEyn2ctAKJLuzrw1+k+QOYsXVzLdpS89R0nVKjA+K0wZaVV9vqAUT8ZrxEYUKdzfcwd2Ub5PW+5d4+ZcTXOUDveN+xK7K7hKgfhp/aek5P7IcsEyk0QzS/0KbOx8kuWoq0k74tLCOFr18aya2zwcOt
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d372e3ca-6a3f-4264-1e4e-08db26cf2837
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6360.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2023 10:05:37.9562
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pXadkmbNV/CsZFX6gaUbmsMPaF5WxM2bui0Onx4gStM7GMgtvnmU7JHKM7wt3IrAh/BxfqaDPSYG8KBd/Pduvg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR03MB5980

On Thu, Mar 16, 2023 at 05:56:00PM +0100, Jan Beulich wrote:
> On 16.03.2023 17:48, Roger Pau Monné wrote:
> > On Thu, Mar 16, 2023 at 05:43:18PM +0100, Jan Beulich wrote:
> >> On 16.03.2023 17:39, Roger Pau Monné wrote:
> >>> On Thu, Mar 16, 2023 at 05:32:38PM +0100, Jan Beulich wrote:
> >>>> On 16.03.2023 17:19, Roger Pau Monné wrote:
> >>>>> On Tue, Mar 14, 2023 at 08:56:29PM +0000, Volodymyr Babchuk wrote:
> >>>>>> +static inline void refcnt_get(refcnt_t *refcnt)
> >>>>>> +{
> >>>>>> +    int old = atomic_add_unless(&refcnt->refcnt, 1, 0);
> >>>>>
> >>>>> Occurred to me while looking at the next patch:
> >>>>>
> >>>>> Don't you also need to print a warning (and saturate the counter
> >>>>> maybe?) if old == 0, as that would imply the caller is attempting
> >>>>> to take a reference of an object that should be destroyed? IOW: it
> >>>>> would point to some kind of memory leak.
> >>>>
> >>>> Hmm, I notice the function presently returns void. I think what to do
> >>>> when the counter is zero needs leaving to the caller. See e.g.
> >>>> get_page() which will simply indicate failure to the caller in case
> >>>> the refcnt is zero. (There overflow handling also is left to the
> >>>> caller ... All that matters is whether a ref can be acquired.)
> >>>
> >>> Hm, likely.  I guess pages never go away even when it's refcount
> >>> reaches 0.
> >>>
> >>> For the pdev case attempting to take a refcount on an object that has
> >>> 0 refcounts implies that the caller is using leaked memory, as the
> >>> point an object reaches 0 it supposed to be destroyed.
> >>
> >> Hmm, my thinking was that a device would remain at refcnt 0 until it is
> >> actually removed, i.e. refcnt == 0 being a prereq for pci_remove_device()
> >> to be willing to do anything at all. But maybe that's not a viable model.
> > 
> > Right, I think the intention was for pci_remove_device() to drop the
> > refcount to 0 and do the removal, so the refcount should be 1 when
> > calling pci_remove_device().  But none of this is written down, so
> > it's mostly my assumptions from looking at the code.
> 
> Could such work at all? The function can't safely drop a reference
> and _then_ check whether it was the last one. The function either has
> to take refcnt == 0 as prereq, or it needs to be the destructor
> function that refcnt_put() calls.

But then you also get in the trouble of asserting that refcnt == 0
doesn't change between evaluation and actual removal of the structure.

Should all refcounts to pdev be taken and dropped while holding the
pcidevs lock?

I there an email (outside of this series) that contains a description
of how the refcounting is to be used with pdevs?

Thanks, Roger.

