Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E6627449AAC
	for <lists+xen-devel@lfdr.de>; Mon,  8 Nov 2021 18:22:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.223541.386302 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mk8KV-0003UX-Jv; Mon, 08 Nov 2021 17:21:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 223541.386302; Mon, 08 Nov 2021 17:21:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mk8KV-0003S7-GY; Mon, 08 Nov 2021 17:21:11 +0000
Received: by outflank-mailman (input) for mailman id 223541;
 Mon, 08 Nov 2021 17:21:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dEZx=P3=oracle.com=boris.ostrovsky@srs-se1.protection.inumbo.net>)
 id 1mk8KT-0003S1-RJ
 for xen-devel@lists.xenproject.org; Mon, 08 Nov 2021 17:21:10 +0000
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3f836855-40b8-11ec-9787-a32c541c8605;
 Mon, 08 Nov 2021 18:21:03 +0100 (CET)
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1A8HDHAa025293; 
 Mon, 8 Nov 2021 17:20:37 GMT
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 3c6sbk4d6s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 08 Nov 2021 17:20:36 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1A8HAvZD165082;
 Mon, 8 Nov 2021 17:20:35 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2170.outbound.protection.outlook.com [104.47.56.170])
 by userp3020.oracle.com with ESMTP id 3c63frjx0h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 08 Nov 2021 17:20:35 +0000
Received: from BLAPR10MB5009.namprd10.prod.outlook.com (2603:10b6:208:321::10)
 by MN2PR10MB3886.namprd10.prod.outlook.com (2603:10b6:208:1bf::28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.13; Mon, 8 Nov
 2021 17:20:32 +0000
Received: from BLAPR10MB5009.namprd10.prod.outlook.com
 ([fe80::3c49:46aa:83e1:a329]) by BLAPR10MB5009.namprd10.prod.outlook.com
 ([fe80::3c49:46aa:83e1:a329%5]) with mapi id 15.20.4669.016; Mon, 8 Nov 2021
 17:20:32 +0000
Received: from [10.74.106.251] (138.3.200.59) by
 BYAPR02CA0044.namprd02.prod.outlook.com (2603:10b6:a03:54::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4669.11 via Frontend Transport; Mon, 8 Nov 2021 17:20:30 +0000
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
X-Inumbo-ID: 3f836855-40b8-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=aOYwDHeoTwFBbLeM8Hc8dMyT2YDdAGdHFv2ithKVb7M=;
 b=bMBiHX9xYTME79SHJjdO7hqwg2z3r46HnKoByN20+wzi2TNWUjEv0SegafwmRjFpjHou
 OuldKGEMBb/6TSNOiP2p5u5MhtGQP8c2G+FIIaAi4Rb5JrcIr1vxQERloOIHcb03rH5L
 KmLmU/a60A07dHwWjDaYulnE1kbgn/wsbOJyLBGll1cOBFd6DVZ5gXUy6toSbeGyKrmf
 d2geR7LocUnSnhZmolxAhbi8dmC7x0LlDo94Umuazet8EiuZK2wc1d8UZ3X1HO+fz/V4
 X5wZXBWLxgJol0BW9uzTHZZu8npStv73NA5m+LPDi6UkIGXIB9bBeA9LdG7Uk4KuLFju dg== 
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kR22KvtoGZN6B0Ep/uKoGQrm10S767AkRuaPS5DmjCgxouA6RMI312Lj/xSih0zp0KFuIJRfXV4DVJisCxhPc6TZe++c4SSCeHZG+h1n1IEFzXeG9rgyEdRSrgpWeC+GdAYEBxw90+rWwyh8oGFcwcHyBivQRYvH3sTrRbNHTUOJKNsQChETVe+/xHETr5o0ArCobj3W3GZIhgEuYhofJ009hdVXQeLzv5DGIzCHHiu2Q3H4mluCwua/K1KjlzQkb6DrWi6hslrn7BWyOiD37Uv+Au2KXb4a4RjTdU1Dyt3pVrrHFpGyUU0MiAEq7jLakEHPM3gqIXwGEb6GpTsFAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aOYwDHeoTwFBbLeM8Hc8dMyT2YDdAGdHFv2ithKVb7M=;
 b=GTVSfdaT3ntx8ASjjRvcKk3E0Wn1XfEGq9sVa4gFPfK/6M76SpLt2DcadnS2i0AbZSbm+lC1iRemc3VYreXLDZ8TGPuzdHBKSW2F0QblRUpAEM2nmEaFOuQho8/y73PWYO6rnzljKevutnFBErbLzSqGE9X4bNv1KjMPavbeX8Fxpohf0B3lPn0t/q0ziPAguDmneoqry02K//MdvJ0npYAQ7e5vNqo3vzJaqQxpSw/VDNejk7+rdw3SkyuKSNHHZYRZe/957ouzHv6A7Shj7RWIp+x9iA50Knf/tvZsz2Cxzc+MUu2KbT37yCiwdr3VTcj36yDM9i8WximWz4P2DQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aOYwDHeoTwFBbLeM8Hc8dMyT2YDdAGdHFv2ithKVb7M=;
 b=Utl6xzljmC5NQRhRDjCQCcuh/oHqnPviWZXbQbIT8QgIy6ZqeW9iOM+jiFOIw7SjNLNvCvyW99Dl0d6Fjbpf7kA7Dgm/2OF+rlrgEU+T4ZL9QFGkAH5KZnGqUYv4+ayKE6Cd/Ybt3vav2yhjtPo5awM7o0xejueBykpWUIl79Nw=
Authentication-Results: infradead.org; dkim=none (message not signed)
 header.d=none;infradead.org; dmarc=none action=none header.from=oracle.com;
Message-ID: <48fb48fa-c65d-8e38-dabb-cf9be21365ca@oracle.com>
Date: Mon, 8 Nov 2021 12:20:26 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.3.0
Subject: Re: [PATCH] x86/smp: Factor out parts of native_smp_prepare_cpus()
Content-Language: en-US
To: Peter Zijlstra <peterz@infradead.org>
Cc: linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org,
        tglx@linutronix.de, bp@alien8.de, dave.hansen@linux.intel.com,
        x86@kernel.org, hpa@zytor.com, jgross@suse.com
References: <1635896196-18961-1-git-send-email-boris.ostrovsky@oracle.com>
 <YYk+D17oIOGKWNtN@hirez.programming.kicks-ass.net>
From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
In-Reply-To: <YYk+D17oIOGKWNtN@hirez.programming.kicks-ass.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR02CA0044.namprd02.prod.outlook.com
 (2603:10b6:a03:54::21) To BLAPR10MB5009.namprd10.prod.outlook.com
 (2603:10b6:208:321::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1d0e2fb8-4f73-4dbb-0969-08d9a2dc11f1
X-MS-TrafficTypeDiagnostic: MN2PR10MB3886:
X-Microsoft-Antispam-PRVS: 
	<MN2PR10MB3886DDE8BC819AA269EE728D8A919@MN2PR10MB3886.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	cqt7TaJQS2fC0CgfcIdyppleV4K28HAspmG8xD7J6np9dFSsW2+IBTXokCofboWf9rEn0glT10J6JwjfSiARDwCbN/WhdRk0Hc4p8vqsxl2yzUtIcXc4QlY9XF5g+H56RlRizh0//WD94gQohCXddJ64KOVZofCD/HtYdtvKq8XHY5OzXkLsopRS1uGBqYQSOxFP5J0ng4s9gRWmjVtkab9uQ/hMbccNDRAzAa11rCkCAyXkAfdsNKQCKBgY0/yNSDTpH5PaKyoEupORqFvQ54gS11rH5qEdohGQ+uH+IJs6GlTZ5yBBEkZJq0ZWZEGHBXwM6X7G95NiHLCpMNuCLWi6aFE/WnlXJBqugN2w455QXTZ4/LCsE4IsugbvUxALvmI9BxTFxUxWeAzSOtQfsGWDSy7AltzSzpew4mXIRaKra9YJh7grX2sJyjOmNxvyWcNP9Cuc2IJyi53kLgLiqtHJFQzBY9PJh56oX3G82q+nGrV5F32uNva0rtLO5702TcRN9kfjJKOW9MdA1IATzqo/efLYx3NBw8beSHaMKHZUPDSeDttMZyHWKcBXWRxfL1uzyhBigk2EXDBN6BAB4lh2G3lozHzIMOYyvnuSOuefTf2UFZehiRkmypyiBrz82RIEdEtTwHA9ObjqX7Y2fpYQm2DxX9+x2Kw45fyvdpAMwWyBYygwU45Dy3vixchVpHmsmv1qUD2QdovD6DBWkT1lnHpk/q8CklRLt+sw698ZOtFhlptSiasWF2b6ADOzyP+7c8puLO22XwxjYJJStrUCAT4jExFyNAdJc9edyfvu5//EB8QC2XEAFcMinTmwtTqtvS9Kg0CEELb1oNMkaA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BLAPR10MB5009.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(6916009)(2906002)(966005)(83380400001)(53546011)(86362001)(508600001)(38100700002)(2616005)(8936002)(6666004)(31696002)(956004)(31686004)(44832011)(26005)(66556008)(36756003)(66476007)(8676002)(6486002)(186003)(4326008)(66946007)(5660300002)(16576012)(316002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?eHFZTjlWeFFXaU5VV2JyQkdRWTRJbExFWTViZ2IvQWhkd2RlNFh1d1NkMGl3?=
 =?utf-8?B?dzR6OExIYXQ5TVRPNUxkdTF1Y3loUGlpVHFBZWdldWZCNklUd3NMZm9UNUJK?=
 =?utf-8?B?emVnTTl4QklUSnliRlk2QzJEdTlIckpnZUZhVGJEeWZQUW03d3dQZDloVnFx?=
 =?utf-8?B?UjRJU2NNditXclkxRWpxSWhqQ3Q2dFM4Tmx6NVhLZU1Mcng3ajZIVjBncmxi?=
 =?utf-8?B?dFQzRndZRjdCdDR2djBxQitYVFZVR0VvazBhKzlESzY1d29kRWpJai9vZnJI?=
 =?utf-8?B?Tk9KYWcxWXR2VUFFRUcrTHJDTkk1RVA4eXVhRGJVeXFSaCtGM09QamJuQ0Y3?=
 =?utf-8?B?cjcvV3MxVmdUWTB2Y3JhOWZSU1FXRitlL29DTzhZVFZPc3ZWalF0OFh4a3U1?=
 =?utf-8?B?YUUzL0tpbHMzOGRjOHNSeDJWZjF6LzQxN2JpSEJPK3BqNmdBTHk0S0NIQW9u?=
 =?utf-8?B?Vm5jbU50ZVRCaGtIZk53TkhmdG53dGQyd0Rqb0RMVnBRYWNaM09ia2xhSHow?=
 =?utf-8?B?OWNuRncrNHhUL0FyY3QrYlpZUmsrRlJqc1VDWHNRZ3prd3V6QkxNTDcwRXhz?=
 =?utf-8?B?cFVJQlEwNWhnWmJsQW83bmdTWUpZWFZOTTR6b1doUUFlNGFpMnZrTWUwZGRC?=
 =?utf-8?B?TkNGcWR4cmZ2d2VObDYxblB2dnhQM0ZTWmlFdmllanVtdk95T2RpdlRVTzlz?=
 =?utf-8?B?RVdvTWZVc05iL1VrN1pOeU4xcW9oUnFKR0pzTUZYcmlwV3k1SDdiLy9KMTZQ?=
 =?utf-8?B?bDdjMEN5S2ZRQ1hPY3dRMHJPSUtGZnBQMTB6dHBoMGV6eGxWRGkrdUtpbmRK?=
 =?utf-8?B?N1lKMTBtVHR6SWFlYXB2SCsvU050Z1FPeTFUZ2JrMXFySDdBSzRELzVnOFpk?=
 =?utf-8?B?MVZObjFOUytWcXp2UWpEdm0wOE93VWlzZGhFcDhkeHdhTmhXYzZ6dzRRVDUx?=
 =?utf-8?B?c05BZ0VNS2wyaSt1YWFyQjJoY1g5eHZqU1FkNUxrYkwrN2dDdVVBR1cvcDFD?=
 =?utf-8?B?bnFCTnFnUndSeDg4SFIyN0R1eEZpbG1ZNytNcTFwT1FsWUhpTUFpMHF1VndE?=
 =?utf-8?B?dTNoNk5rNnVkOEZoYXF3eVlFQ0dBbUg4eFFTSkdCMXVqVWZDUEQ4LzYva2VN?=
 =?utf-8?B?c2YrRUwxUUxTdTZkSVVuTFRFNklORFdyOWI5YjI2R2Y3alVaNS81aEVTbXJ3?=
 =?utf-8?B?K0RJRE52aWdJWENMdGRrMmc4TWgrb0ZvWVZlQjNCeXJrTnJRdnVOdTZ4a3NU?=
 =?utf-8?B?MnNBeHR5OTk4Z1NwS3MzWnN5U2RyQVQvMEYzbDU3T0t4L255aGdEUmR3T29G?=
 =?utf-8?B?NjNLeHQ0VTNIWEJldEdOM3dvRUJsQ1RReVMxS3ZqY2l5MTI2S1E2UXByc3Rw?=
 =?utf-8?B?MUJ4SmJLdkJpUDh4T1VzMGFGQTNEVDQvM245U2JVbFhZSFdlNEhrYWNmdVhO?=
 =?utf-8?B?eVBPMkRmQzhRM1NsMW9heUVRRUxGeGRaVXVYTi85SG04eU9SWDVLbnRSSnY0?=
 =?utf-8?B?V1YvbXkzbVVmMm4rNjZuNW5QRzFONHBHeUxrUlJObm5jNWc4SlNVbE01dkR4?=
 =?utf-8?B?Q0NCZExUMDg0TjVNUzQweEhIRFpud1FyaHZTR1I2NnQ2dXJzUjl1ZUIrZFUz?=
 =?utf-8?B?eklnbkkvbEtkUU1QRUxrbkVEODljRFh1VnZTRlV1bEVvTGtZSzFkRTBpUFRF?=
 =?utf-8?B?Z2FjS0J0aE1SQng5MEZGL2xCMDRraFFqb1YzQ0tQSEJOK3hKTFQwRFcwSE1p?=
 =?utf-8?B?ZFdzMDVHdVprdG1zcHVFd1ozWnc3OFA2enhtVnpvOWlZdG1LdEQ2eE9Pd2Vq?=
 =?utf-8?B?Yk1JaWNHKzFDVUhSNCtTcnQ0VGpTLzlCNDB0YUpPN2dINWx3V1NNNHRwdThp?=
 =?utf-8?B?d1h5c0RGYzVyZTY2c3h4dklteUZDY0gyUTRFRkU5V1Q1UGtCRkRVOXhZbjlD?=
 =?utf-8?B?dERIOUJ5KzFacWtoZkFSUmNQL3FSMFdaRjdqTXlFYTA2UGhtVCtHZHl2b2lu?=
 =?utf-8?B?dlc3VDJESmdUZ2dxd1NtM0JiU2xyNlIvNTdrc3ozUjZmVmZhczZIVkZLRnFV?=
 =?utf-8?B?ckd2UnEzVUo3em5XMXRuRHdMMGtyUEM3L1VPSWZZVzB2b29TT2Yva2hPTjlt?=
 =?utf-8?B?dytwZFRBSk1ERkZKc2xZZDJFTTdOazRjTFNRNkhlNXAybEZEZ3pFM0Jab3pv?=
 =?utf-8?B?Vk1vMFhvN2NXVWVKZ3FzNmlKMkM3YUFTQ2NWK2hMb3h4TmhtWDJqd0pIaFRH?=
 =?utf-8?B?NC8xcExvN0ZMOS9BMlNxQ1BzYUVnPT0=?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d0e2fb8-4f73-4dbb-0969-08d9a2dc11f1
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB5009.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2021 17:20:32.8105
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OcdYYg6zioBhcAH7k7cMf7nPCSAStzCLb9q3SPR9NFPsF2d2LnUzXfKgvZaUrKpMSoVA5N4Jg1KOT6KT9xZ2GV/LNsClQxyBEVZBhk03cbI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB3886
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10162 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 spamscore=0 mlxscore=0
 bulkscore=0 phishscore=0 suspectscore=0 adultscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2111080104
X-Proofpoint-GUID: WwJ6HiBW37uzhIH0qk1HR2IZoU-95bAv
X-Proofpoint-ORIG-GUID: WwJ6HiBW37uzhIH0qk1HR2IZoU-95bAv


On 11/8/21 10:11 AM, Peter Zijlstra wrote:
> On Tue, Nov 02, 2021 at 07:36:36PM -0400, Boris Ostrovsky wrote:
>> Commit 66558b730f25 ("sched: Add cluster scheduler level for x86")
>> introduced cpu_l2c_shared_map mask which is expected to be initialized
>> by smp_op.smp_prepare_cpus(). That commit only updated
>> native_smp_prepare_cpus() version but not xen_pv_smp_prepare_cpus().
>> As result Xen PV guests crash in set_cpu_sibling_map().
>>
>> While the new mask can be allocated in xen_pv_smp_prepare_cpus() one can
>> see that both versions of smp_prepare_cpus ops share a number of common
>> operations that can be factored out. So do that instead.
>>
>> Fixes: 66558b730f25 ("sched: Add cluster scheduler level for x86")
>> Signed-off-by: Boris Ostrovsky <boris.ostrovsky@oracle.com>
> Thanks! I'll go stick that somewhere /urgent (I've had another report on
> that here:
>
>    https://lkml.kernel.org/r/20211105074139.GE174703@worktop.programming.kicks-ass.net
> )


Thank you. (I don't see this message btw)


>
> But looking at those functions; there seems to be more spurious
> differences. For example, the whole sched_topology thing.


I did look at that and thought this should be benign given that Xen PV is not really topology-aware. I didn't see anything that would be a cause for concern but perhaps you can point me to things I missed.


>
> Should we re-architect this whole smp_prepare_cpus() thing instead? Have
> a common function and a guest function? HyperV for instance seems to
> call native_smp_prepare_cpus() and then does something extra (as does
> xen_hvm).


Something like


void smp_prepare_cpus()

{

     // Code that this patch moved to smp_prepare_cpus_common();


    smp_ops.smp_prepare_cpus();  // Including baremetal

}


?


XenHVM and hyperV will need to call native smp_op too. Not sure this will be prettier than what it is now?



-boris


-boris


