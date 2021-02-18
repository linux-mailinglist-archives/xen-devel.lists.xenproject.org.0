Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9156631E818
	for <lists+xen-devel@lfdr.de>; Thu, 18 Feb 2021 10:46:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.86517.162515 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lCftD-0004qF-FU; Thu, 18 Feb 2021 09:46:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 86517.162515; Thu, 18 Feb 2021 09:46:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lCftD-0004po-Ae; Thu, 18 Feb 2021 09:46:27 +0000
Received: by outflank-mailman (input) for mailman id 86517;
 Thu, 18 Feb 2021 09:46:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gXm/=HU=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lCftB-0004pj-EJ
 for xen-devel@lists.xenproject.org; Thu, 18 Feb 2021 09:46:25 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5584014d-611a-4628-8f50-77fa3e66d2f4;
 Thu, 18 Feb 2021 09:46:24 +0000 (UTC)
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
X-Inumbo-ID: 5584014d-611a-4628-8f50-77fa3e66d2f4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1613641583;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=In0H3GKAIQ6+4OBnb5ov4Vo8dGUkbVupydG+4XFu8Bo=;
  b=M6hd8RZRb56DZBh/0PHgTwYiNFYZz5/9o/z365QbAt9uGyVrL4dNup6r
   OMJ6FBDMvRfEiXsrK2L1ux138+W2co/7ZRiyx+96Q7qfubPJ9Sw1JlsW+
   T6C69CEyyh41I/skSgsZ2OhS4iu+q5s6NtWK24Fv0/yBFfN+XEfXTEHje
   0=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: UoJTiv5V4jRBe0Y00jc3hlmzX7xSgE58DcB7/2mGHALHi2Jigd/PG8oMRglOQk+eCti6W+VPA+
 aX7YWUMbmGObi4qvI52u1E1PqYUN6rbsDhp91cIgdk3DYKyyFqivdaMiFsFU2XeYUz7yd+TogK
 Pgkn2z4ISwjbJOPk4eiQSRKfNALTDAgswaPSTJadkDnXUPQV1+5nN0mBGFXehKgtlpyVdUkdFm
 Y+Riaai+upuggRApBfoeEiGo5WtKLrw78JAHpEJ2g8ZpALyogMipKz5uWsXc+Yg1GcsPOuZKPS
 6Jk=
X-SBRS: 5.2
X-MesageID: 38871673
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.81,186,1610427600"; 
   d="scan'208";a="38871673"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=djLiSb0LGj8ENRaRSn0sFZSvs1J4CeL1L5mhw4wiZzQ6qQHo4t/jF71Ad2fYVv1bV+xtTgSFGhHW8cSsVVYoCgy7Iz5OjMLqL9S7z3DLuXuH3nynKTYv8FFyWzlCXradEvpxiWvWfq1YLb51zteSU6aIH7+rq9UNqhDe0jnoWLC50di5H4X/KTS62h3qzt9z4LwIdHYDPwkoZf1fS69+w+X22GWg1Vwe6RdSYyNW3wQfhtOfiJoSSfQfR5AsFunBN8BkjD/H0RJtQ1fobQrrrmwGq/7LdnEYjysPHiyxUi4ysjXX7ZVCmwKqu8vTMA6JmJ7TUgN4ne/zio9/0DakIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=In0H3GKAIQ6+4OBnb5ov4Vo8dGUkbVupydG+4XFu8Bo=;
 b=GM8EQKW7LPM2TOXfAm91a/WUECTlh2fP2HdJLvefUpsynRhj8cmUeTU5KfEiLJS18Jg9bhPdUkKPhTG1lm3Pu1VRewdT6QOdaCkLg5RQYtlWPrhrd6zV0vfbVmZlYZd7CtOOB/nnxATHDoljJkMY3kLMjegBvUISXzxrlmUgut8sCbZK68IxfvR0qvQ/gcgijmPROVhOJCtG9JVgc33VmE4RwakIDC1zKWdQC0NHOo362NJQWO+G4avpSzeS+1qonCvDO8WjUeAQroeYthPPlIHQlE0AicnJKlrus2l2XW62C6oNLFzJveWJhCZpYkE0Lk+9iYHtuQD6HvW+PydcVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=In0H3GKAIQ6+4OBnb5ov4Vo8dGUkbVupydG+4XFu8Bo=;
 b=wOYJ4bd9F+3qlNjmcJ5ZVGWKLueyHr5OSv191ShQBkulZgAYSg+cGZURPmRQPAOVq3IRlUUlXWGFMPzAKmBfxcn63F+gaeCDxFFy6zlNhRPV9x+KYR01wA2fjluIc/NOv8GsGAEl0WFoi/bJZIyEeF57kvJIFMkde3QBx8xYUtU=
Date: Thu, 18 Feb 2021 10:46:14 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Christian Lindig <christian.lindig@citrix.com>, Edwin
 =?utf-8?B?VMO2csO2aw==?= <edvin.torok@citrix.com>,
	=?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>, Ian Jackson
	<iwj@xenproject.org>
Subject: oxenstored restart after system crash
Message-ID: <YC43ZrCyScGxHEVE@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
X-ClientProxiedBy: MR2P264CA0009.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:1::21) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a1700421-028e-485b-38ce-08d8d3f20b56
X-MS-TrafficTypeDiagnostic: DM6PR03MB4841:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB48414C4DB0AAFB455B39BE638F859@DM6PR03MB4841.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: u2FQ4zQfdvtZrkdYOuSSZ2/UTRbFJQ2sDM+uiNZQSis/z31WUOdpguIB2cZ+yb5uvaPTCf7Y+IwT2knCuY+OKqZWDLt2bTAgtDYofH/q1rZtywy7c51QnXAYBq5NEWeYPpOzYugxW6bYLhi2h/x94Tdsk9saiYjkeARWFRKF/MSoVw0UKSc/m+ou4ibNGkftU5TN2SVgZt/JfvFojyu+ArUzBcNporclQ8JgH87TdSpSupnFemnzH7ZUwX8DwlQwyH2N+w92PhS3ZWsTF2a5HB4+J0m2lm73tFiBks/bS9+Ut/hx3GqNjxi4u57rROhhZXT0SOJJJrS3aybDB1xBMCtZidvC1MmyW+/LInshz48rYudS87w3LZWC6DsgbVBeCG7hFKSersnlmJN+LcUrjbyqbTc94XkgYeXLV0MyCsCSvo1bUlOfB13jsmJJbVuZ0AWA2VCX0ynFmMno/A/thWP/rRMdPd4oYaTnXFjZCkF0fOb3S5jBN0f9ywZvV4FE2dSXvStwGJe4P4x18YqP2aB5bdmWEBC7WVcBVr83KPSXI9CWxG+/GqKTj9RMkAKvI26Wcm/jRNt/mHy147BWtDhvUP8TKebgs23pzH0WkNQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(396003)(346002)(39850400004)(136003)(366004)(376002)(33716001)(8936002)(4744005)(956004)(6496006)(966005)(8676002)(6666004)(26005)(85182001)(86362001)(478600001)(6486002)(5660300002)(66476007)(316002)(4326008)(9686003)(83380400001)(186003)(54906003)(16526019)(2906002)(66556008)(6916009)(66946007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?V0dkZnhmVUhvOGVkd3NIYmN5dTJLMDk4MmFZWEVhYUMxNUxQWkpMTFA1TDRw?=
 =?utf-8?B?TklDN1Z4SHVyZSsxMkphYkNlZlJjdEdUWGhCNVB1aG01YVFFLzV2L2x2clJj?=
 =?utf-8?B?cTVqUU51Y3ZLUDd6M09MdDFyMVNMeVc5b3R6RzhBWGVZWXRnaG1ZMDUzTHd3?=
 =?utf-8?B?OEphd2RqYXM3R0dRalRwSVZaLzg4bnZrRVBoWTdqREhiMXI3bGl3QWk3eEtI?=
 =?utf-8?B?UXhrZnhDKzgyclRKSnlaVG5oTmFmVWtvR2JoU2xjNkNKUXZZVXp5TG5RUTdX?=
 =?utf-8?B?YzFjNmUwWEhiL2lQYWpoc3VySEprSXhWNHJTSTJSVUx3S2V4RTM2cVQ5T0hX?=
 =?utf-8?B?djZpSnduVTlUeUxDMGV0VjRGbVc4NUU4bXdJcm9MaUk4Zi8xTDdUYXlRZmc2?=
 =?utf-8?B?VVhWNnJXVVNSb1ZIQ1R3K0k5cUZIenQ2UFg2TVNJRk5iR3kzY3ovb3NzZUI2?=
 =?utf-8?B?WTNyTi9xN0tZREY2WUNFSEpsTkpWajFrU241THRoaVcwYnNvVlBseVRZcks1?=
 =?utf-8?B?ZHNBSXhHMEFweHg4ZGFmRFFnYVJDblpXb2NVT0tHSGlLLzJvc015eit5VUZW?=
 =?utf-8?B?d3gwK3c4UGZoc0o4R1JmY1I5YnV4SW9lRys5MmNyTjdhakhHcWlKUjZhYXdQ?=
 =?utf-8?B?NGM1b0IyRlpiNlROMitIRmJscFRWRXNQbE9EejRtUUQvV3UyODM3SlJrdFM0?=
 =?utf-8?B?RS9RdnpzRTE0ajlYMFZOTVdGcDNaSTZlU0U0RVY0aWxicElGNmxkcGJuRFJz?=
 =?utf-8?B?RFFVaDVHOEdRY1h3UTdua0k1dHk1cW9xaDJuWE9BQ25vMmJGM0dJamdhS0RL?=
 =?utf-8?B?TksrZGZrN3M1UlNzbXE2UzNyUW9Kd1U3bzF2TDRaZmptRE5zNVJPU2J4cmRX?=
 =?utf-8?B?VHRtYlB6V3ZJcEErYUJKU01ldGZidXNhTmNKdFJoZVpiQ0dSU2NtL2ozWFpD?=
 =?utf-8?B?SVRyVnZMS0Y3UTFSYXcwRm00bi9Eb2EvekxYQVc3aXFpcjVtQm1aeFRKSXhh?=
 =?utf-8?B?WTAzYTdjb0NJS1ltMUQ1NmgzY3Z6eDBrNmF5ek5EYnNtbGU4NWYzQW1WU1pH?=
 =?utf-8?B?Rk5oN1VHVFZqZmc2cXNGTWtXNVNXdU1yMHMvWjJCM2FWUzNjK3AxZGJUSjEw?=
 =?utf-8?B?MHNQRXlnd3h1RFUwamxrbXdNREplUy93Z2NmTXAwTW9RUGV1bWJpTjZGcXhk?=
 =?utf-8?B?enpkNE5JY0xZVHhuVkJnQjFlZStOaklFaXp4RW90WDJTSHVvTlpOWlhqaUg0?=
 =?utf-8?B?akRYQk1WVjBaRGNzem1OdTUrM05GZmN6dkRZZDNrc3JCaEpOcEp3cEx5dUdQ?=
 =?utf-8?B?SHNOVWo1WXlaUzBZeDJJRkZxMGNKNGJXQ21iaUpSamZZUHY4aG8xYTRRQVBn?=
 =?utf-8?B?alVnU2thSXBIeS9Qb2NpTWd3amFtSnBBWkRrekFRSG9yR1lmZFU2WW1jd1FP?=
 =?utf-8?B?WU9hZGR4UEwxaW9JczdaYXVtQi9UdlIvR0sxTnJrUnBMKzlOSWN3NXF2UnZ4?=
 =?utf-8?B?d2YySkFkcDhqNGlLZWFOTFlOcEUxU3RKRFlNd1RjMTQyQjNLSGdtd1ptZW42?=
 =?utf-8?B?cWdTcDh0b0R4cVVad3VBUTdKcXVlSGp0Tmo5TzNGVjcwSUNyWFgyaUI5WDFZ?=
 =?utf-8?B?TDduQW8rc0M3Q25TNktKMDhmZnpHSEp0eU16NEF6c0lvR2FzS1FvSHJCaGxU?=
 =?utf-8?B?TWNGYXFIUGxldUtseC9sdk1jbEJUaEI0SGJXQjgvaURnSmFOem52UndXUnFv?=
 =?utf-8?Q?EJ8ejRrCHdw8dlvwYOkmsnB5ciSDH2ahAhYSxsi?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a1700421-028e-485b-38ce-08d8d3f20b56
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2021 09:46:19.9916
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /6glbdv3I7yKtzWLkpHLeHGEGLSs1zXcjsAprn54ZoPYZIkzLFRxXmpKkrRfHacP+2M4YRp1S69l16Z26zCJwA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4841
X-OriginatorOrg: citrix.com

Hello,

Last month I got a query from a FreeBSD Xen user having issues with
xenstored after a power failure:

https://lists.freebsd.org/pipermail/freebsd-xen/2021-January/003446.html

I'm not sure what's the right approach here. I've been told cxenstored
will attempt to unlink the tdb file when starting, does oxenstored
attempt to do the same?

Should the tdb file be placed in a path that's cleaned up on boot?

Should xencommons remove the stale tdb before starting xenstored?

Mostly wanted to know what's the approach on Linux so that I can do
the same on FreeBSD.

Thanks, Roger.

