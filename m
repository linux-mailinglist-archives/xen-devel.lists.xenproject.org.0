Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DEBA55BE8E4
	for <lists+xen-devel@lfdr.de>; Tue, 20 Sep 2022 16:27:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.409465.652413 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oaeD1-0001ny-CR; Tue, 20 Sep 2022 14:26:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 409465.652413; Tue, 20 Sep 2022 14:26:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oaeD1-0001m9-9K; Tue, 20 Sep 2022 14:26:47 +0000
Received: by outflank-mailman (input) for mailman id 409465;
 Tue, 20 Sep 2022 14:26:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=R99E=ZX=oracle.com=boris.ostrovsky@srs-se1.protection.inumbo.net>)
 id 1oaeCz-0001m3-VI
 for xen-devel@lists.xenproject.org; Tue, 20 Sep 2022 14:26:46 +0000
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3ec04898-38f0-11ed-9647-05401a9f4f97;
 Tue, 20 Sep 2022 16:26:43 +0200 (CEST)
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28KDXQZT003540;
 Tue, 20 Sep 2022 14:26:33 GMT
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3jn688exan-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 20 Sep 2022 14:26:32 +0000
Received: from pps.filterd
 (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 28KDlHNu022968; Tue, 20 Sep 2022 14:26:31 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2170.outbound.protection.outlook.com [104.47.56.170])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 3jp39qm1he-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 20 Sep 2022 14:26:31 +0000
Received: from BLAPR10MB5009.namprd10.prod.outlook.com (2603:10b6:208:321::10)
 by DS7PR10MB5390.namprd10.prod.outlook.com (2603:10b6:5:3a1::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5632.21; Tue, 20 Sep
 2022 14:26:29 +0000
Received: from BLAPR10MB5009.namprd10.prod.outlook.com
 ([fe80::dcc6:79b8:7480:2ecf]) by BLAPR10MB5009.namprd10.prod.outlook.com
 ([fe80::dcc6:79b8:7480:2ecf%3]) with mapi id 15.20.5654.014; Tue, 20 Sep 2022
 14:26:23 +0000
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
X-Inumbo-ID: 3ec04898-38f0-11ed-9647-05401a9f4f97
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=message-id : date :
 to : cc : references : from : subject : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2022-7-12;
 bh=OXKOkKMY4UdF9Ksdqo8CuHT57dJsmzm4vvl1rc4TCl0=;
 b=Fo/Fal7uS9jIbyB/8wZcJSNqIQYsMrTzlSh2fR++UVu5J0BwsU3phKq2XWjJOyELcxQQ
 lYU+83+jvF9PM8t6WI7MTWXaCMn7Z59DDRsQMduK0zg4MlsHnReL2fxXC4hwNTsn8YXw
 90nde55buUrWKz/HCEsv5X4yV/FKsY9dx9OVqDQv7hQV/fA8COoVz9d46pKyiNOrO2a5
 iOB4mnylEYzVfTwzIWLBuMNzD/SdKqO32Xc/KZr2+xDPZ5qFWKkmuNG15kUoaG0NiqMA
 32xhgK+728RwlyzoGoLdkNeL+y95G9b6gp21DyPr6tkuVdkZxTUnO0+/lSOKqj4vTz02 RQ== 
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C3N1NryndL86A9mPwLy+KiwhpDT+hJpFIN4WbJUgPW/4KYEm8iaYbZkRMM6ioHsihftJjOb8yyGAQVH48j+3iNJK8f1aQEOhEypSBxPCVIkxK+xQJuGRJVVKID9WWkZm6V3g6hz6tUIJU6MVyG1WuvtNP98m/jRgP8y/TDwRpMCnS0WQSlWRBvMokTpJcRfLF7K/d0eregOguVhvqQz4otZQbCIu92KL8xGu5oVb0gvf+9oOaCZ1Khos5K5fRuKAaxJg0are992O1D6b2jT5zPwQUrpXCLQW/i2FixqxJDKwJiPWQrQxjbx1GUZycNsDeGjP/s59F/96BC0zTYpALg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OXKOkKMY4UdF9Ksdqo8CuHT57dJsmzm4vvl1rc4TCl0=;
 b=SLjOaClct14qhVqFq0hljJwM9WgkPCiJUJuSHIT9pCFA6KOHuYZBvXVOWnKSuJbWKN6XKC56VZfkf6Bwb5K3bBGlI50JJbANpnDc9/FfeuZJQsZOKiz2wahrIDMVhcxgjlxALjwqJHjdpHUdEP3VR+V4NL3iyjhbp0SxfG4z/s7DHX3cNla72wRhoKjWa1I+J8FCuXt0peniiF+eXyg/oeo5BZmFclrz8gW1J7Irptx7b+po+mMKBjUf2hs5WN+ZcUmLpze4ZEnvo2bzYwrvmqXyHQovUiI7SJrnPHaEg4DXsAVYR3gYhNZGH7MYJJh2WNFZGHT1MrkjyOx28P5yGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OXKOkKMY4UdF9Ksdqo8CuHT57dJsmzm4vvl1rc4TCl0=;
 b=Zf2+g/Dqw2IeTtPz3/u8Ylxd9FPuUWOcBdUEKfqtFiZA+6ajZugZj2Qdx/lC5UAhFdpxO+mvO2PwbkfF5fMkITCfpuAel03jUmoLxI8U4fq8tSYuNp9R7N7F/F+iLIWzG1r5ek9OzmqUhO7MI7PoaIk/4OqWyAPDqmO+OBxqCFc=
Message-ID: <4d317c1e-3481-6d9e-c5ab-dfd9c559d89d@oracle.com>
Date: Tue, 20 Sep 2022 10:26:18 -0400
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.0
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
        =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
        Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org,
        Tamas K Lengyel <tamas.lengyel@intel.com>,
        Tamas K Lengyel <tamas.k.lengyel@gmail.com>
References: <8294476a707d7f20799a40479cc0bf9a1cf07673.1663249988.git.tamas.lengyel@intel.com>
 <9fa4a72f-8b38-fbf0-40c7-8fcd6b34cf10@suse.com>
 <9e79155f-0836-1b18-b648-b6e5422e89c8@oracle.com>
 <737386d2-ceeb-ad97-39a1-42585b913b9d@suse.com>
 <CABfawhk+TByRwVvGjv-e6-2UFeO7g6xBz3-CR_QOtYM2_37U=Q@mail.gmail.com>
 <29d29f64-b799-d56c-1292-661fb5127728@suse.com>
 <CABfawhnRUhQAc0cRybz8sLLkxjuZCO6JVA5QYHBERG7gf0zpZQ@mail.gmail.com>
 <406b7f6e-d092-fb6a-d0dd-60a9743027f6@suse.com>
 <CABfawhmrnL1HGOWS1fkEv5X4CwfkrBj-+APJ=hM1GCzzgjW4zA@mail.gmail.com>
 <5d1b06f0-fc20-585e-9da0-fb24c5931ad3@suse.com>
 <ffc59d24-7862-b7fb-e11e-b5f773129b0c@oracle.com>
 <8c0c9e20-f3d5-86fc-647f-ee89d63f2118@suse.com>
From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: Re: [PATCH] x86/vpmu: fix race-condition in vpmu_load
In-Reply-To: <8c0c9e20-f3d5-86fc-647f-ee89d63f2118@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DS7P222CA0021.NAMP222.PROD.OUTLOOK.COM (2603:10b6:8:2e::20)
 To BLAPR10MB5009.namprd10.prod.outlook.com (2603:10b6:208:321::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BLAPR10MB5009:EE_|DS7PR10MB5390:EE_
X-MS-Office365-Filtering-Correlation-Id: 9990f081-3f4c-4163-de97-08da9b1417d3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	VGlOLctN/rhiCaLEcTUJ1r2WIO5lwA/dGygGOsAIg5vluX7aa12KqA2frpl/mAA+2xRF2V0Gw4b5nua3SJGuPE2QOq+kOO0ctEbICn41KirwbOzWE9kOOF9kIWfNNbbLZae9tbnSW7pGE4bUtPXtB8VUmRV8l67P0O6iCt4EAQXmtu5US6TpIjL2FQ2H/0xOb35HSngRWl7vLqUqMwdD78uPwg8T4KZqueBrIGdF9x52hgq2IpCEhopuHuGzEMCQfAEAt24uBblfBKlk0Yvqxtl9gnNrJyNi+KYx9EcT3H5of939ebHkJcWE6ZeTFtkmJy34G9MLnvCtuwez8C8jftkuDrNaBp0caGT+8AkAKbwWbx3+o1dSzlFb8msm5Rgx4jcJoTKoHFFHuiVKxZDXY04QZ4KOuXYVMRdH5kd4WluMn87v0ZLnnzSm6Ww9Cuo2u/zno/oQiAWSdYx2wHhl1bMR+Pxoi4xxvFO+fH4JagNb4L+GI8iQneSaFiavi/+hbcf68M1MoXd9jK1TQCVsjuPLesMRcJqxd71PHyAmubf1N9V97BZvvLyhyAExQ/ywV+l3EFYWzrlD76zRfx44+nc7NZjGRgz8ePtv6+l07ipgNG801XqVkT4FWcAGCnIJ2p4JWHnKy/I01dbh/h0C1lybWuMxaIAkdbX7NES96J4gGQ45zFZgEFLDlAPMRU5y6FAlMJ2vlnhHGfswr9ibbF1Y+SdjFVWtXn61CCK7gwDE9bx9y+alUJfdB0i7Va3NunRkBQVnnsxazHh4gs3rObZqC+/xxoaW6QAu9FFKR+U=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BLAPR10MB5009.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(346002)(366004)(396003)(39860400002)(376002)(136003)(451199015)(44832011)(31686004)(36756003)(2906002)(6666004)(316002)(38100700002)(4326008)(8676002)(66556008)(5660300002)(66946007)(66476007)(6916009)(31696002)(54906003)(86362001)(186003)(478600001)(2616005)(26005)(6512007)(53546011)(8936002)(6506007)(6486002)(41300700001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?UlV5Y1Y3QlZkWklDTEYrQThzNmJTSERiMEwrVkJwMWlNYXVCdzF3ZmZ1MkN0?=
 =?utf-8?B?SE9wQzNFQmpIOXlsa3Q1YWZxeFdTMWJkUk9yOWY2clZvQW1uSjgzd0pvdVNY?=
 =?utf-8?B?NXh4LzJJVFhDOWJ4cWRXM0N2ZHhFOEpwUVhlaG84RDNBdmFHQk8zVEcybUhD?=
 =?utf-8?B?R0Y1c2VOT3EyQkxSOU11eE15SVMzdTVkblI3NythRG94Z202OXhPOXVDZHVi?=
 =?utf-8?B?MFYraXNIU1RqWjh6WkNhVkUyaXYyZEdncytESjBUcEhZeHh4OWNWQ1NLS01o?=
 =?utf-8?B?WlJsZVlKSjZJT2V0MytNOUYwTFlLbWpOanlzakFNNWlmQ25TaDgxUUdSUmY2?=
 =?utf-8?B?dDYza1NPZ0tPMnltNndiS0xwTDlURG1RSDdxbjgwUW1QbVRzYS9Ib0R3MUlX?=
 =?utf-8?B?ZWF5M1lQdGVGTm1qZ2N2WFB1YjRGTmRsc3RJbldEMG4rNG1YajhiWWxKb3Zw?=
 =?utf-8?B?S3FlVVJHZ1hSa0hFTlY4Z0xkdUVHdzVWeS92Qi8wV0p3VHJXUkl2empFZW1I?=
 =?utf-8?B?REUrMVVGRFlLYUY4cGw1VW1rYXY3NVJ2cS9ZRTkvN1ZNbU1CaTM0MUpxL2RT?=
 =?utf-8?B?ZHVCb3V6Ykg4b1hNbEdUL21JTktRdm0wN01ZekhkVWNRL0FDRTRydC9XT0VE?=
 =?utf-8?B?b041U0ExY1hVSG5FNjd5U2xOdXM4d0NRRm1zRDJPUjhhbEFnNDZDdEdseWI5?=
 =?utf-8?B?ZlRWQU9GTm9QbC84VTcyNG0vUThIQkZnd2hnZ1V4NitwZndnb2RtMjNhelYy?=
 =?utf-8?B?aFJ3K1hNeXdFVVdXdTMxQXZjQUR1ZHFxbUlxUE96UGhjdVpsalhwZXQvQS90?=
 =?utf-8?B?ZTFIOXZOMjhXTWFXcks4VWh6eE9yOTM2V3g5eFhLZEc5WHBSNXFRZDh5dnpj?=
 =?utf-8?B?VnlSWGcwQU5oY3o1R3p3Y01zRXhmOXpqMjcyZ0h1enU5bjBJWnhMZGs4TW9M?=
 =?utf-8?B?cXVZMW1DS1hkNUpoczhpZHdJMHVNUytyTFdkRWNkNllxbU95cFBFRHpEdEdo?=
 =?utf-8?B?NlIvUlVDWm1oZEdNemZleUNWZ1Q3TzFPRTYvYWZ5azJDaFEvWmJ0MVZsbnIw?=
 =?utf-8?B?ekV2T2JmRzNIaUozSkhPQnBTUlhCSzFmdktlQmlTTFMzL3B0NFZkS0FkbGVi?=
 =?utf-8?B?akdQSm01TDViUzlkd3VISS9GcHVqZ2NQa1pRQktoQktRNmJOQy95RWNTWFN0?=
 =?utf-8?B?OTFzcjhTSk9kd3NSM1hlOU5xVUIxbkwwQ0pQbGdnUWluTHFFTHd6amNnRWRs?=
 =?utf-8?B?Q0dtQm1nWGtqOWMvTGdVWUpaTFVDNGR5THlyZ3MxV2pWcUR4b0RQWWIyUTVV?=
 =?utf-8?B?N0hkSHl2SlZvOTFCREtCWU5JUXJXUzVsNnIrRUVBWllDcklpSzY2VzhGSElL?=
 =?utf-8?B?S3VJa25tQS81YW5sTHNxUUhROEppYzJnWWVGUkg5R3FzUXpnMEoyY2t5RWYv?=
 =?utf-8?B?MTFFZVZmMFlYNWtzM2tPWjFjYlpQcE96TUJJTWFnbGVvbjhnUm9Ta01uTHZn?=
 =?utf-8?B?ZFFnbFR2ZzgwNjZhMTI0bVNqZVI0Q0hFaGFNVy81bVhNSmNublBoRFlkZ09B?=
 =?utf-8?B?QTdjaG94clhCdFYxMTJYN0MzZ09Sbm44Y1hERW1ydnQvNHJDOXc5MmorN2Zp?=
 =?utf-8?B?dHh3RXZOMlZYcmZQN1ZvL2dnK3daWEFNbGVOWSs5Qy9ROWtkcGF3a0pkZkZJ?=
 =?utf-8?B?NVJjY3krSDhDSDB2VU0rTm52Sm56dWlEbmJMcUltOWMraTRXRUFwajFPZ0xB?=
 =?utf-8?B?S2lOc09uejllS2pQa3hCSGpNK2QvNWE5OS9JOEVEYVhrWkFxRkRqT0xVNU1P?=
 =?utf-8?B?bjQ3TlB6YWlWc3ZyQU90dytPSVB0UDFGTXBNay9WQUxyZEdhdWhRNjMxQnZv?=
 =?utf-8?B?RnZvL1IyTkZzbDhSQjlDRmFvT2pobDdGTVMrNUpkdDMvcDR4R0lBd3UwcTR2?=
 =?utf-8?B?NjNXVnpsQ3ErRkhJdys2Si85dmptWm1SaDVudXg3T3ZaWHRHU3I2dm40dXJm?=
 =?utf-8?B?RWZmYVphNk1BeTc0QUk3Q0RZdE1xQVRVRnJoYWkrT2JQbVo2ZnhuMFFEN3Rw?=
 =?utf-8?B?K0tyT0FGa3ViamJuR2o2YzlQT01HVnR1MzcyRlhuYU1McFhHVzlCdnF0ZS9I?=
 =?utf-8?B?UnlydDR3UmROZGVXZDVKNTdWKzROZ05xbCtYZVZHRXRqMFZHeUp5YmhJYllF?=
 =?utf-8?B?Unc9PQ==?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9990f081-3f4c-4163-de97-08da9b1417d3
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB5009.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2022 14:26:22.9164
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u+CMwe25+5wb31Yf7is0PczDHiKdXCWB0NXNCeiE7kjCWBEkG3Fiodn0jxi+t+ns24uvJ68Rwd7+3Oj0hzTJEOenlv+JficksCIt8IPHumU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB5390
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-20_06,2022-09-20_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 adultscore=0
 phishscore=0 bulkscore=0 malwarescore=0 spamscore=0 suspectscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2209200085
X-Proofpoint-GUID: X-FfGq7hWBW4Nk40Kv0PVn6l3s02rbdO
X-Proofpoint-ORIG-GUID: X-FfGq7hWBW4Nk40Kv0PVn6l3s02rbdO



On 9/20/22 4:01 AM, Jan Beulich wrote:
> On 20.09.2022 00:42, Boris Ostrovsky wrote:

>>
>> It is saving vpmu data from current pcpu's MSRs for a remote vcpu so @v
>> in vmx_find_msr() is not @current:
>>
>>        vpmu_load()
>>            ...
>>            prev = per_cpu(last_vcpu, pcpu);
>>            vpmu_save_force(prev)
>>                core2_vpmu_save()
>>                    __core2_vpmu_save()
>>                        vmx_read_guest_msr()
>>                            vmx_find_msr()
>>
>>
>> The call to vmx_find_msr() was introduced by 755087eb9b10c. I wonder though whether
>> this call is needed when code path above is executed (i.e. when we are saving
>> remove vcpu)
> 
> How could it not be needed? We need to obtain the guest value. The
> thing I don't understand is why this forced saving is necessary,
> when context_switch() unconditionally calls vpmu_switch_from().


IIRC the logic is:

1. vcpuA runs on pcpu0
2. vcpuA is de-scheduled and is selected to run on pcpu1. It has not yet called vpmu_load() from pcpu1
3. vcpuB is ready to run on pcpu0, calls vpmu_load()
4. vcpuB discovers that pcpu0's MSRs are still holding values from vcpuA
5. vcpuB calls vpmu_force_save(vcpuA) which stashes pcpu0's MSRs into vcpuA's vpmu context.


-boris



