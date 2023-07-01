Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 712867447D3
	for <lists+xen-devel@lfdr.de>; Sat,  1 Jul 2023 09:54:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.557822.871503 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qFVQC-0008L6-Tr; Sat, 01 Jul 2023 07:53:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 557822.871503; Sat, 01 Jul 2023 07:53:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qFVQC-0008IU-QE; Sat, 01 Jul 2023 07:53:32 +0000
Received: by outflank-mailman (input) for mailman id 557822;
 Sat, 01 Jul 2023 07:53:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=imK7=CT=citrix.com=prvs=539cab4e8=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1qFVQA-0008IO-Kh
 for xen-devel@lists.xenproject.org; Sat, 01 Jul 2023 07:53:30 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5c5acd9a-17e4-11ee-b237-6b7b168915f2;
 Sat, 01 Jul 2023 09:53:28 +0200 (CEST)
Received: from mail-dm6nam12lp2177.outbound.protection.outlook.com (HELO
 NAM12-DM6-obe.outbound.protection.outlook.com) ([104.47.59.177])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 01 Jul 2023 03:53:24 -0400
Received: from BN7PR03MB3618.namprd03.prod.outlook.com (2603:10b6:406:c3::27)
 by BN9PR03MB6025.namprd03.prod.outlook.com (2603:10b6:408:136::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.24; Sat, 1 Jul
 2023 07:53:21 +0000
Received: from BN7PR03MB3618.namprd03.prod.outlook.com
 ([fe80::7ebd:898:4cb0:7514]) by BN7PR03MB3618.namprd03.prod.outlook.com
 ([fe80::7ebd:898:4cb0:7514%5]) with mapi id 15.20.6544.024; Sat, 1 Jul 2023
 07:53:21 +0000
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
X-Inumbo-ID: 5c5acd9a-17e4-11ee-b237-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1688198008;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=4lipXHd/Hd/oIj7zAyXeYQkzzuPBre6U7XzivX0UrBA=;
  b=S7amrrL9g17O4JBKCDiaI+e/VUqc62VJ9EcwNELsEs7GKOCir/XMJCeR
   WRGW+MaKApbt6c6YkdOUk5LiWEiUmCK08VYY6mwqFTSpcFJPbkJyimosC
   kFANABhUVlVYvEslE8245FH4AV274/o1heMLizYogNAyFOcD+lf6F+LNT
   Y=;
X-IronPort-RemoteIP: 104.47.59.177
X-IronPort-MID: 115250894
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:HuesEKijBmDzlOfJHI4gIsV4X161UBAKZh0ujC45NGQN5FlHY01je
 htvWW3SbvmKMzf8eI0kO47goU5SsZ7RydFqQAFr+ys1Hi8b9cadCdqndUqhZCn6wu8v7q5Ex
 55HNoSfdpBcolv0/ErF3m3J9CEkvU2wbuOgTrWCYmYpHlUMpB4J0XpLg/Q+jpNjne+3CgaMv
 cKai8DEMRqu1iUc3lg8sspvkzsx+qyr0N8klgZmP6sT4gSGzyJ94K83fsldEVOpGuG4IcbiL
 wrz5OnR1n/U+R4rFuSknt7TGqHdauePVeQmoiM+t5mK2nCulARrukoIHKN0hXNsoyeIh7hMJ
 OBl7vRcf+uL0prkw4zxWzEAe8130DYvFLXveRBTuuTLp6HKnueFL1yDwyjaMKVBktubD12i+
 tQ6MhIDVxOn2djn+624auNXh+0THNH0adZ3VnFIlVk1DN4AaLWaGeDmwIEd2z09wMdTAfzZe
 swVLyJ1awjNaAFOPVFRD48imOCvhT/0dDgwRFC9/PJrpTSMilEgluGyb7I5efTTLSlRtm+eq
 njL4CLSBRYCOcbE4TGE7mitlqnEmiaTtIc6TeTlrKMy0AzProAVIEJLWmKf5uegth6FV+lPA
 nwb/A0vjLdnoSRHSfG4BXVUukWsugMXUpxeGusx5QWJ14Ld+QPfDW8BJhZRZdpjuMIoSDgC0
 l6Sg8ivFTFpqKeSS3+W6vGTtzzaETcYLCkJZSICZQIf5p/op4RbphDFQ8tnEaW1psboAjy2y
 DePxAA8mrESgMgjx6i9u1fdjFqEvYPVRwQ44gHWWGON7Q5jYoOhIYuy5jDz8vJoPIufCF6bs
 xAsu8WY9vFIMpiLmwSEWuBLF7asj96ONzjZnFhuA4hn8j2r8nGuZ6hA7TdmPkBrP80YPzjzb
 yf7sgpL6JheFHCjd6NwbsS6DMFC5aLtD8j/X/bYKN9HeIFsdRSv9TtrI0WX2gjFrk8olq0uP
 IaBRuylB30aFKdPwSK/QqEW1rpD7iwm3mbSWZDTxgyqy6aDf2WSTaoZMVyIdaYy66bsiA7V6
 ddEK8ySyxhFFvK4aS3e6407IlUDLHx9Dpfzw/G7bcaGKwtiXW0kVfnYxOp7f5Q/xvsK0ODV4
 nu6R0lUjkLlgmHKIhmLbXYlb67zWZF4rjQwOilE0UuU5kXPqL2HtM83H6bbt5F+nAC/5ZaYl
 8U4Rvg=
IronPort-HdrOrdr: A9a23:onjW660+nKX2NsRM46Y8aAqjBfdyeYIsimQD101hICG9E/bo4v
 xG+c5xuyMc5wxwZJheo6H9BEDtexLhHP1OkPos1MmZLWvbUQKTRekJ0WKI+UyCJ8SRzJ856U
 9qG5IOd+EZZTJB4foTi2ODfOrJD7O8nZyAtKPm6zNIcCkvUqdn6m5Ce3Sm+o8dfng5OXL8fq
 DslvauYlCbCAUqh7+Adx04dtmGncTPiJXlJTYeHnccmXCzpALt0qf+Dx+bmjwDUzZDqI1SjF
 TtokjC/6C+tPP+7RfZ2wbonvNrseqk8MJHGMuPzu4KLTn24zzYArhJavm5pTUop+Pq0nYG+e
 O82ysIDoBI8nbMeWPwmxf3xAX69z4r5xbZuCSlqEqmm9X9WDU5T/VMnphYdByx0TtbgO1B
X-Talos-CUID: 9a23:6xRHA20WSzUcprhVvB6p5LxfONoHfETe6CnqcnSnCkZjc7y8eW+I5/Yx
X-Talos-MUID: =?us-ascii?q?9a23=3ARNSUbwxkYxqhMmGhSW6y9pQFsBiaqPvzB3kp1os?=
 =?us-ascii?q?fh5m/ORdgEgeSihO2Y5Byfw=3D=3D?=
X-IronPort-AV: E=Sophos;i="6.01,172,1684814400"; 
   d="scan'208";a="115250894"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FGe8FKiK0qy+2o7MVSi8bseoB30qN/S4Spvr7eFsUep1pgAv0XmXRIHS/9syBxAR9noaCjlayvQa9ENc2f+GpcWbZC9wYbygk4b231mnq80Hb33K/cDlDF2hzB9WHWxObkamfWfg1aZyv4q7tFzrrMKNUDsES3q9CtCTLeycT2Ts5FvrK4JUc3ExFqzH3HmRZspqnv6SirD336anhzA4Bni3Wkd6Xl3mpnoh8NWDbeGhkRr5l5yg+c6yntZt/tj5xZwisoAQs4RMuAFHh4nkJf8fzd+vV/b61Byn4k3OBU8IqnBR2hRqG+uIKf2ihBdsttiPUcBgIPc4/ci9GW2bww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4lipXHd/Hd/oIj7zAyXeYQkzzuPBre6U7XzivX0UrBA=;
 b=QrxX7X3bBzQeGYcCWpx12i6PEvp/VjhRTQkzz6S5LQxPy8YR+pn516S/xzil6bB5/Ice96YK+SX8f+UccyR3j8ReO2ImS1GjEQtdhJYOK7D0WhCj2OeCPHP4mKmm8l8KYpzZ3rpVlrECN+Fse6Iwj0T6el2auWyqgENpf6y91S7yIKPayBbZ4p9j8OL7xrcBkm2n51ciGn0026MmEeANk4TK/C7/SaM6t45e3JULS0b2OHrxTRExTWEnsAf5C5sLMJa8vPPlzMEj62cxmtRTyFqwbGPcs6mCejK/Xyl0+H8KiuLxmaVm92nzf3g16cUheVl0OrDZkrbkjykigz4KrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4lipXHd/Hd/oIj7zAyXeYQkzzuPBre6U7XzivX0UrBA=;
 b=d3u1tIZ9kd5EI5Jj+U7YcLzj8dQxyaylPrZjjXTyFrDgkdCR2w42Dcrvv7Ev3Ipi8tyWnZGAKkWwWitIgeLAX/RFsbjlCH1xGxdKvmenSJ65co6XdnkPFScZEICLYLRETtHymTL/XR72E6FXxHDhiBS4hJEaYBS2tO+bnam3I5w=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <6060dd00-5d9c-3804-4b9d-154b9b9dca49@citrix.com>
Date: Sat, 1 Jul 2023 08:53:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [RFC PATCH] xen/arm: Rebranding dom0less feature
To: Luca Fancellu <luca.fancellu@arm.com>, xen-devel@lists.xenproject.org
Cc: wei.chen@arm.com, George Dunlap <george.dunlap@citrix.com>,
 Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Henry Wang <Henry.Wang@arm.com>,
 Community Manager <community.manager@xenproject.org>,
 Doug Goldstein <cardoe@cardoe.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Anthony PERARD <anthony.perard@citrix.com>,
 Daniel Smith <dpsmith@apertussolutions.com>,
 Christopher Clark <christopher.w.clark@gmail.com>
References: <20230630091210.3742121-1-luca.fancellu@arm.com>
Content-Language: en-GB
In-Reply-To: <20230630091210.3742121-1-luca.fancellu@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0677.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:351::20) To BN7PR03MB3618.namprd03.prod.outlook.com
 (2603:10b6:406:c3::27)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN7PR03MB3618:EE_|BN9PR03MB6025:EE_
X-MS-Office365-Filtering-Correlation-Id: 9fc072ac-3163-4443-b9a8-08db7a083d0e
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	BFadWxqV8exolj48bNnpWlAmbiRlZoB5Mquc6B/v0uL2SSAC744O9M6fIUX9xGKlPCVkt7HYhszhe81wOKVVDEy9oEXyUuBWr2xcYf1SlGRGmfvh1jPbYOwZhY1KTQ7Pm3708vhIIZp3QMkdNveOSRbRRyz4dWV249TpdWMrkAjgBu9uLkrRz1E0/UVh0tFPSPojPkeEcEQ0FZnkQgLF+wtZWt0hlnGhHo3cGvt6uqU9uRlg1tGN4XqU/iFEHj0yaXAqkiu/Pxz148f3C1mMweOBP3mp9ehWKDVBoN0vmx9J3I/2W/MSvf3Syfx9KhMs735eqd5aXyoKESdwtKwlc0Kc1E//ZT6P9HNbPkLoPJ+jn46e3zFHgkYCh5M5flErOMEZb4m3x6HEz5xUfRUAoE0f0Ua7e93+xX05n0WLUH5n5cNSz3JP+9GK4Ey1cuW/Z4FQVl8tztp72DF3ApkyNMP9PBzEWrh6+u++Neuu4AmbvdbZxdRUlzsret2vk8CfZYK7Y8DG790wWXSOlZQxRnBJeKUde7omjhCt2nPEkkf++opEmA+Dtlt6m5qx28uFLaOqH45mCR1V2VXmuP3ej0CVLqQdvh4/opap1+amA0OQ82QwYpQ0+z+Bm5j1TiKfdT3UTVMtG1re7drHd3vbhX2rorC2hySYTvoyvHYln5I=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN7PR03MB3618.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(376002)(39860400002)(346002)(136003)(366004)(451199021)(6666004)(38100700002)(4744005)(2906002)(6486002)(8936002)(8676002)(54906003)(36756003)(41300700001)(5660300002)(7416002)(478600001)(31696002)(66946007)(66556008)(66476007)(86362001)(186003)(53546011)(26005)(6506007)(6512007)(4326008)(316002)(31686004)(2616005)(83380400001)(82960400001)(32563001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NUhmMjA2bVllWDUzSGcrTCtxMUlScGFrZjh4Z1VvdHRRR2M3Ukp0bFhBaWFP?=
 =?utf-8?B?Qlp5K2p3SkR1ZCtSTzFqWTVRNG5YZkNnV2F2ZEpjODI0TXYzWGx1d3FBenhN?=
 =?utf-8?B?eGxzZjRyanQ4bVB4b3Arb3ZvcG5pTkhFMjlrTytFZjNMWWVFQkphQnZqSTdw?=
 =?utf-8?B?c3dpOXJDQVg3TUtjbzkrQ1NwaXJpV1YyRWlMUjlEWmFEdFVudWRIMUFwa1hk?=
 =?utf-8?B?YktURk1ZY0trL2FsenMxRlFTQnYvd1ZnZVBuWms2c2dvc1BKeHFYUFU5dW9q?=
 =?utf-8?B?V1ljRTBUQkVndS9PZ0dWYjliWVJOUlVER1dBNlp5a1lvckVkUWI2Y3hGSm16?=
 =?utf-8?B?M21zSDZ6ZTBGWEFkYklmaHR5TEhaUy9OQjE5OElORVdWNVRXSVdMNkhNT3Rs?=
 =?utf-8?B?YXlnYmRKZ3I1ZXhzZ3ZidTREbTQ1ZUJsQnVEc25DYjBad3NFVEk0cGFvbVFB?=
 =?utf-8?B?V01YZEFzOXMrdkxzVFBudWVuUkpnODRSUUI5eU82VUY1dW1sU25nVStld1JS?=
 =?utf-8?B?SkFWRk5YT2xWaEl1NDNlZ0dlV1Q0UXo1Tng5eVp2K0k5UE1jQU1MdThoeTlV?=
 =?utf-8?B?Y3hnU0tZV2UyQzF0aW9iNnJseCsrT1MrQVM4OGI1aHVmR3BVelM2UGxUdjJ3?=
 =?utf-8?B?NlhrZTNiS0Ircit3T3lOS1YwZElTQ0lLMFRsRUYzN0pKbC95OWhISDdBMVVz?=
 =?utf-8?B?Q08xTUowS1pHcThhY3BHdEovb3FHQWptS2w4dU0wZi9RMWtkVEVtZWpvNGlQ?=
 =?utf-8?B?WmE5TG5lNllIRy91SC9tNUNGRE8zUGczajhLa0RpYXBwWHhkOFROVnl3MUk2?=
 =?utf-8?B?VXBwQUpWNmFTeXNoMzNvMkdGZmJGOENua1lQZTlneFYwaEFuaGlPL2l2MlNk?=
 =?utf-8?B?S0wrSjkxY3IxUWJvcjdCdkZSeithWHhtd2ZzRjR1ZUhsNXBBU3pZK2sxYkpj?=
 =?utf-8?B?M2RjNk9aM1FEdE0veHBONkl6TzFYT2pmTmF0NjdJZ0dHMklMWjJwWWw4Q0J1?=
 =?utf-8?B?WjJxSlVINXgrb2lXWXk1S3hlekZSeWhzMXR3L2Rpa2VkNldpUkcvOWVKeDFI?=
 =?utf-8?B?RW8vY25iVXRTTUd5MlpQTEFqcENnc3pIYm1xTFl4WDJVc0JFTC8rTlhucDI0?=
 =?utf-8?B?MVh4aEE5STh5c1lndklsYXVETXRpN0EreGpSamJORkJ2dFJpY283alNRVFBX?=
 =?utf-8?B?MW0wRHZBVFRCdjJFdm5IQTlNMEFpSXhCalFiTWhXYTVCRmdLTE1za212dXd5?=
 =?utf-8?B?cUFNT0p3MlJoMElocVR5MkV4NSs1YW1hVlgvSjcwR21UYnh2NjhmRU1MY1Vp?=
 =?utf-8?B?emVRZnNoNTI1Q2M4VTlwbExKd283RUVSRGxpR0plSXlpZGgyaS91azd5MzAz?=
 =?utf-8?B?NmxRclUzWE5GMk1UZGYvUEdwamJoT3BsOEMwcU0rWXV0Z2xrQ0lzdGJJRDVy?=
 =?utf-8?B?Z3BEUHJEL2FkRnR3cFdybWFWbFlyNkZ6SXV1NDNnc01zaXdUQ2RIN24zYVZk?=
 =?utf-8?B?WUViVzN2cVlXdTI4VS8wUURhejNSOWhlOEMrakJ1QWJtN0lweWN3V29aRmdL?=
 =?utf-8?B?QWhBcmVjQ29tUUhjZGlIeTNzR2lWMXRpOEZKelJIdTdlQzdqMVZGSnZodFMz?=
 =?utf-8?B?Njgrb0M5K2ZablczVE14UkpKd3E5dUpkdTJWRmJSZ20xQTl3cVpTb1p0RDAx?=
 =?utf-8?B?eWU5NXIrSEhHNDI2TThUck9XcS9UVEQ3eERrWGlFQ3plbEZ5UGx4SlNMdWtr?=
 =?utf-8?B?MGRSSTRGNFRWYjhpcmtQZGVpNGlaTCtBYTlQTE5zbkNTcUoyVURDWk5UZlhv?=
 =?utf-8?B?THlOR2NVVmMvajlrZWgvdFEvSDdFUytsazVqOUp6RDY2UHc2bFYzT2E4L05j?=
 =?utf-8?B?cUpGaFN3NW1QS0lydmZwV2NYVUFGZjhKY09nY255RXJQSjVhaXRFYXJOaXNn?=
 =?utf-8?B?NGFTRENrMmNNTWNoRUYrSjUzZXhVb250WURZZ3FTd205K1hzbHg0THhPZjRI?=
 =?utf-8?B?WGo0ZDBLTnVNbVVCckU4bStKMkVjYjExZ2I0VUVqbDhOMk5xWTVxNkEwcTds?=
 =?utf-8?B?SkI5TzVyNmpxSFRPTWt1MG9NS3pIeTR4ZDRhUGhhRGV1WldldVI5d1R1aU9k?=
 =?utf-8?B?NmJEa1lOaWF3aEdTa3NwOFlRREhueTlPQVhnd3crdG5XbjBOc0YwWUM3Y2tq?=
 =?utf-8?B?Tmc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	=?utf-8?B?R2lONldtRmFLYnhBblQ0Uk5wNXF5YnlxMC9YQ0dXUU5OMDNFWU8wSWROWllJ?=
 =?utf-8?B?ZG9DY0VxaVFVVVFYTzRuV2tjSm1WdDBhUE5oVWpMSGN3NmdQaGhUMnVIK1dF?=
 =?utf-8?B?K2xMWm9jdUtNZWgzYi9uWUJNRTZYYU4rejFXWmtreXZzVFZmRUJjYXl1L2FK?=
 =?utf-8?B?UitpNzJ0QXNPbmxtRUdzV3dtTnZyVm1ZUThIMmw5cEd2N3NZNGxxNU9hd3Ur?=
 =?utf-8?B?SmZSSUN1dFVRU0RTV0VPOHVLbzg2aFRYZzB6TFQyWEZ4TjlvZVN0LzNuUWxI?=
 =?utf-8?B?VVlIalIreW1HWTlUUkhLS2dZRDdaYW1WVC91ZlpUcXJpQUI5dFlsbkxKS2Y3?=
 =?utf-8?B?d3BILzJIZ2lEb3VIYStBNXRYZ3R6anptdVl1ZHkrYitXTzhZbUF2aDNaUU5j?=
 =?utf-8?B?eHF2Z2hndEZDclNoTktUODJIcHRlQ21VZDhzUG1mL0xlbEdoQmhWMEgzSENB?=
 =?utf-8?B?d25KOGFhZVdzWDBkM3pLcTcwcHZjckNFOFRueHVFODdOYTM5TzJ2SUF6ZGJr?=
 =?utf-8?B?YjV6WStBMk5PRVU2YUtTVFVJakphRDBuZTk5akRCVDZyWUlSZE8ydHdqSDg5?=
 =?utf-8?B?ZzdzSS9vcFJIYjhtdFo4bEZ4RnRSbnFnbWNKSWxqK2JuZkpoc3ZjMzErT1Jj?=
 =?utf-8?B?Q3NaTHc1SERSZjZ6VlhzT09LMU1YSmZzQUJQaVM3cDJ0SHlWNVN0eXdrS2xZ?=
 =?utf-8?B?cWlldE5wTVUrREV1aTBZL2l5WEdwVlBMeFpxWkh0NitvSVZ4MTMyd3VtK2JU?=
 =?utf-8?B?YmhpQnFRMVpJaUlVT1V5aWN3VXFaaVRrc0d5RTBiY09jUmRGbk8rN2lPN2JP?=
 =?utf-8?B?TFQvVlY4WmpwS2pzZm5IQ0h3MDVQazFLOE01L2h1Y2duZzlpUnBWWGpWNE1s?=
 =?utf-8?B?dWIzSWpZSzlEN0Mrb0dzMkNtUVpqOTl5V2RMTWpyd1hlaUhvUEVqUlBxN1F5?=
 =?utf-8?B?eVdUOVRuV1k0MUNxQ3B3cUNDM0JwV1dQMUkvVWVrbFlRaHdZRDZ4KzVyUjAx?=
 =?utf-8?B?dTdCUjlJdUF5STZlaHdkc2FYMU5oanhhV1NDaUtxTEpDOHpYWU1GZmZzSjJ5?=
 =?utf-8?B?enlZdWVYNUJXenFIQ0hkUnAzcWhOU0p1NkZ4N3ltUEpsRDBTRzZ6Mm5Ib2ov?=
 =?utf-8?B?MGxrZXZqSHBJVTNvNWJON0pPNy8rZ3dWMk9nVTdSSXUzalFOWkJ5ZEllZXJF?=
 =?utf-8?B?M09mMVVQcWZUTmc4U2dZb2lMdCszcGxuZ0k0VlRJUFFON29PR3ZsUi9MT1ZY?=
 =?utf-8?B?SHg1aURheWRwOFMxbGhLbDZ4Y3haSHhWczNTMEc0V0w3UmJubEJzNVpFT1ZV?=
 =?utf-8?B?QmhVeDJOeEl2OHR2QzBSbkRPTWpVKzdueVZ3cVV5Wm14MXl6clYra1NNLzlG?=
 =?utf-8?Q?rpVshJCJTTV+LuLwg4cnmnoUa7bebgeU=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9fc072ac-3163-4443-b9a8-08db7a083d0e
X-MS-Exchange-CrossTenant-AuthSource: BN7PR03MB3618.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2023 07:53:20.9067
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JllmYz8NkX8Mg1OsnIDoW9D+JxIuqfyX3gzioIupfKkOmRhzT1obNHR+DGuxGMtw/H1jhncoefhsQN8izObP5DwvH48bsuqGvffeLlYEF4c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR03MB6025

On 30/06/2023 10:12 am, Luca Fancellu wrote:
> The "dom0less" feature was intended to be the feature where a domU
> domain could be launched without the control domain (Dom0)
> intervention, however the name seems to suggest that Dom0 cannot
> be part of the configuration, while instead it's a possible use case.
>
> To avoid that, rename the "dom0less" configuration with the name
> "hyperlaunch", that is less misleading.
>
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
> ---
> This is an RFC to get the feeling of the community about the name
> change, for now it's everything in one patch just to see how it
> will look like, if there is interest on proceeding into it, I can
> split in more commit.

Have you discussed this with Dan and Chris at all?  You haven't even
CC'd them.

While there is a lot of end-goal in common between the dom0less and
hyperlaunch, and that the name dom0less is deeply misleading,
hyperlaunch is specifically not this.

~Andrew

