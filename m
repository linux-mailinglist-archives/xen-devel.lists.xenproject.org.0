Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A1D1136C598
	for <lists+xen-devel@lfdr.de>; Tue, 27 Apr 2021 13:50:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.118346.224402 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lbMEZ-0004tm-13; Tue, 27 Apr 2021 11:50:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 118346.224402; Tue, 27 Apr 2021 11:50:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lbMEY-0004tN-U7; Tue, 27 Apr 2021 11:50:30 +0000
Received: by outflank-mailman (input) for mailman id 118346;
 Tue, 27 Apr 2021 11:50:29 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=D0mD=JY=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lbMEX-0004tI-M0
 for xen-devel@lists.xenproject.org; Tue, 27 Apr 2021 11:50:29 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d53d7965-f1fb-4c72-a9bc-d065589f5af1;
 Tue, 27 Apr 2021 11:50:28 +0000 (UTC)
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
X-Inumbo-ID: d53d7965-f1fb-4c72-a9bc-d065589f5af1
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1619524228;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=hz7IYbfx0HCzaHaC0j8zxMW6UIZADZQLYxucFuc/kkU=;
  b=fA0nqrgO5zy7apzeMpvv+ptCkn4ve4ohzryVx3QbV7eEEVT++CzSkkIN
   VCquqXFpg8SOoq85lyCxR481j2Vwajavm2HBtXsoS8RU4jaH6oH8z9BAi
   IofmEO1xAgoZ6+7Ye7o076AM2Cldpmk4bMti15prloPxXj+jOyZu9nVjS
   A=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: EYRS8S1cGMfK+AlcbiCz59+4wdDwHLch0UVIutt0d4qk2fmL9SJEFofgzQ1VGR8FEICz4IA/ta
 0HAhlopQ3rcNKzgLPHY58NnXOx1xHgKGK7b5LdX0fvtamtNoUeNp4Pf0m5VG3yvkda65aPDiht
 e40Xb6B4odJiIzhL1L+AVRakxWfQ/IW+RlIC+BLBOUIkxTzm96OaG/4bXuTTmLUxVITcT7we82
 +12Ojfmnu3kSSjqT+OQ9Ab8C3mUSA8YdzNROrjW73m6YJasqzaxgVCuhAGyYlGaXwYWAtJ6jcu
 G60=
X-SBRS: 5.1
X-MesageID: 43997859
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:syzhuKrRNLqb92B+ab/DVjkaV5uRKtV00zAX/kB9WHVpW+SivY
 SHgOkb2RjoiDwYRXEnnpS6NLOdRG7HnKQZ3aA4Bp3neAX9omOnIMVZ7YXkyyD9ACGWzIRg/I
 9aWexFBNX0ZGIQse/T6gO1Cstl5dGB/ryhi+u29QYXcShBQchbnmREIyycFVB7QxQDIJI/Go
 aV6MYvnUvbRV08aMOnCn4ZG9XSvtGjruOqXTcqJT4CrDOPgzSh9aLgH3Gjsis2fjtTzd4ZgA
 /4uiPj4KHLiZCG4z/ak1Te9pFH3Obmo+EzfPCkrugwBnHShh2zZIJnMofy8AwdhO208l4lnJ
 3tjn4bTqJOwkjcdG20vhfhsjOIuFlB11bYxVCVmnflq8DiLQhKcvZpv55TcRfS9iMbzbNB+Z
 9LxG6Qut52Ch7NjU3Glrz1fixqjUa9rD4el/cShRVkIO4jQYJWxLZ+wGplVLM7WA7q4oEuF+
 djSOvG4uxNTF+cZ3fF+kFy3d2FRB0Ib1m7a3lHnvbQ/yldnXh/wUdd7tcYhG08+JU0TIQBz/
 jYM55viKpFQqYtHONALdZEZfHyJn3GQBrKPm7XC0/gDrs7N3XErIOyx7kp+uewetgtwIEpkJ
 rMFHNU3FRCO37GOImr5tlm4xrNSGKyUXDG0cdF/aV0vbX6Wf7lKiuGRFcyk9axovkWD8HBMs
 zDeq5+MrvGFy/DCIxJ1wrxV915Mn8FSvAYvd49RhaPr6vwW8jXn92eVMyWCKvmED4iVG+6KG
 AERiLPKMJJ6V3uXnf5hRPWSm78Y0CXx+M1LIHqu8wojKQdPIxFtQYYzX6j4NuQFDFEuqsqOE
 1kIL3mlau/rXKs/XnB6nhoPhY1NDcX3JzQF1dx4SMaOUL9drgO//+Ff3pJ4XeBLhhjC9/NHB
 VHvFRx86KvJ5mWzSQvYujXdV6yvj82njanXp0ckqqM6YPZYZs+FI8hQ7E0Px7MDQZJlQFjr3
 pjZAcISlTELC7njbyogfUvdafiXug5pD3uAMZP7VrDqE2XpKgUNwYmdg/rdfTSvCEDaH5/gE
 Zr/6oWnbya8AzfVVcXsaAfK11DaGOeHbRcKh+KDb8k1YzDcB1sTGuMmDyRgwwyfG2v7EkJmm
 n9N0SvCI/2K15Gumlv167g/FZvH1/tAH5YezR0t5ZwGn/BvWs22eiXZrCr22/UcVcaxPoBWQ
 u1Kgc6M0drx9qt0gSSlyvHHXI6xo82Nui1NsVrT5jDnnesIpaPj6cIArtd+4tkLsnntqsOXf
 iEcwGYaDP+BOVB4X3cml81fC11omIji/XmxVns63W5xmc2Bb7KO0t9LotrV+20/izhXbKFwZ
 95hdU6sa+5NXjwcMePzeXSYyRYIh3erGaqR4gT2NpplLN3sKE2E4jQUDPO2n0Cxhk4IcvunE
 4VQahw4tn6S/lSVt1Xfzgc8ksildyJIkdurxf/BfUme0oxy3DcJNGE7tPz2M8SK1zEoBG1P1
 aR8ydQpaiYGySC0KMXEKI2LyBdblMm5HFr4eOFcMnRBWyRBpJ+1Uv/NmX4drlXDLWBE/EXqB
 1x5tmThe+ZdybiwmnrzExGC7ML93ziWN+4BQKHBPVB/NO7M0mdm6fC2r/CsB7nDT+gL1kCjY
 JLdUYMft1OhzkrgoowyDWzQMXM0zAYukob5ypmmF7r0pWn52meHVguC3ypvqlr
X-IronPort-AV: E=Sophos;i="5.82,254,1613451600"; 
   d="scan'208";a="43997859"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ioM2tmTAfzIBeCNFz6HL/iAlHOmwrpdJHrYMhSe+35Q3ih1/MvQS8MLTSfEyX1J6c8d0ArAZhyJr797Puu4umHqJMXxUxiQmEXg3BErqs8eumZy2D2WKIzAcVnKylwYQRqgR32L5Otclc4txhziiw/fbYtzvlKPIAgoaBrCAEdi4GkNC7z46PEK3ArBcVHvaQUfaSmTP44CQo9mxkypv+pdKMIKkEut/Azh0R/kQyamc0N8MHE2Zmh7f5+ja+QOJeYcI+xwJcDmxx1rHl4dmhW0QLtHYBljo3JFmeNEyhv2nGDFVjA7ZxfbYFS8Gb0Ajq7vaivljgxlWjAI17GfKdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NBhYHFcqwLgMG01x8oXgMRgHYh1klyA5h9cl6AsWXSM=;
 b=KkgBguGphhEz0IQPTNaFAdZNupBq4ep75rXApZ4Tz3qn+4HK7eyv329SaU99R2eCPY5PgUuTL4N9pQh+9nwbBGEXVxJTS4CQIFFrt+a04LU5mXWiQ0ZDNzCXurWMyB0+MPpKYEnlzsCoHw/j17w/QzsHUyo1kzeFUQgLbqYBNbBpICE8V01tD2GWykFnvZVUkm6uCuIEn60CvTjQPH+kl4+a2/nU2g1zbARV2gt1y4HAES58PLqTMynDQDyX9SPhcARxI+9nbH2GSe0cF33fpeKl98qL95Suhd6DkR5iTux+6pRpPDHFpRXz6wyC878h1vGLeB2GbzltX5+URDd8bQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NBhYHFcqwLgMG01x8oXgMRgHYh1klyA5h9cl6AsWXSM=;
 b=GZ5vHr871AOsCN2pecyKd07SOlBOe6nZAJq2JIf/O7r4JvI8YdltwxNPdDLetaEV4+Q3b0TZUfy8DDwq3fbjZL7+BUpB6Qisvkp6JaVEaEx3ueZXBQgUKyY/HN640tpNU8IL0kZyyLD+6SG8X/vX0oL+ryJUtOShFHVkEF6g7NI=
Date: Tue, 27 Apr 2021 13:50:18 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v2] x86/oprofile: remove compat accessors usage from
 backtrace
Message-ID: <YIf6eji3jr3vy1El@Air-de-Roger>
References: <20210423143755.12189-1-roger.pau@citrix.com>
 <e2f1f3a6-ca54-7459-c60e-ff02e6857b17@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <e2f1f3a6-ca54-7459-c60e-ff02e6857b17@suse.com>
X-ClientProxiedBy: AM6P192CA0019.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:209:83::32) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3206323c-c23e-42e1-ed0c-08d90972a4a9
X-MS-TrafficTypeDiagnostic: DM5PR03MB3147:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR03MB3147406B7A1F0E6683B6C0FC8F419@DM5PR03MB3147.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kClEqS2E+ggbnisyUn1/lSxtTo3ck2FlAmnyDVsnfOvTJtdhROuHAi+MBsIbekmM9J/nM934sU+QNHB20bLyebVzOjy76VfptSWN6PgcxQ6u5l4KO2nUKz/3OACGkv7YPapFxZuvzTKqQsXlhTARdMprnT9lCxKgI0CsEZmyvDE6/BRnE57Nmr6p4DpjFkGkCg8c7u80x/g8NM/RmV1MEsh2CYv/45aafC8cXdOswCqoDnOZmuTs1Dde5M1Ykmb9GcHyuSfN0dX0qPjVTY5FocJerCvspAlkzy/cBlAorVgYRbiKeRNVkyg0bZBvrO5z4MVT69/Ant7sCjXwjgVbF0m59jycWzYfmxHSL3DlNOXdJyj9N2OsjRHB0YmINxUqKA5cALkF3YBHaxlW893DCo/XIJ6qGr3rBmFcWbTmtY7Gyq+PqGHjCuEhZYbz0Jp9xmCqvXXNtT8pldW9D7jMlaYLUj7H+Pt/IJa1wDOwYcDWU1OgeoIICkv1h7mGRB7p/f007IS9kOlfeePIahNFiwgJUGroAYlukD53R+G17p4uZwLwbQxpexgUDzC84KGJhn/DQitUU2sw9f6Am4ck8NKKL2/uJLsQDmXG6osJNCw=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(136003)(396003)(346002)(376002)(39850400004)(366004)(66476007)(66946007)(66556008)(54906003)(86362001)(38100700002)(53546011)(6496006)(85182001)(8676002)(26005)(5660300002)(4326008)(2906002)(83380400001)(16526019)(6916009)(33716001)(316002)(8936002)(956004)(186003)(6666004)(9686003)(478600001)(6486002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?eG1lSDB5MTNIclluaHluNlFNdVFtZE55cFJiNEM5L0ZtWGs5UVExaEdHNjFo?=
 =?utf-8?B?VGhzMW1QY0wzOWpHRy9DZzN1TC8wUWFzWWNjeW03SkRHYndrUmp1QVlkdmFL?=
 =?utf-8?B?ZWhhOTVWOXlSSWhtMFFuZlNUU2JML0FSVWlWa1FvTW5QMGFUU1gzcWVEQkJ3?=
 =?utf-8?B?VVg5OUcwTUdrVU5CcUVOZ29tQjhlY1o0UDVwVmhQS3lodVpnUnVNRGVwK2Qz?=
 =?utf-8?B?bzdMWUFwRWttdnRXNlI0SFN6UUlQVWNqWWRXQWNjWGxlZzY0WFFkNjVVeE1V?=
 =?utf-8?B?Ymt3d1JQUFpERGRWY3VCY01zNHMwL2xSaEdFNk9oTDRhYU9BWVZnU0tYeDlQ?=
 =?utf-8?B?Tis0S0IvTnk4eFlqdUh1VkgrcUR0eGJPVVFpNzVoSFp0TnE0bWJpbkt0U01j?=
 =?utf-8?B?dmEyU3lMSy9CZElhTVFwUVFuOXdBbE5ndWF1TjFhbi94bDBUZFZWQW5tMEh5?=
 =?utf-8?B?REduT0NpM05lRnBKZkFkL3RPN1lqYW03ZVYvYlRpSExkUGxLY3JtUGFqdlJO?=
 =?utf-8?B?djFnd29qYWhyQVdQWWorQ2FncDZtc09LdjZXNDB4TkpRaXJsRzA2NCs3bkNH?=
 =?utf-8?B?SUd4dzlEL1NhbUNwZjFZa2Y3dS83cnRNSVBtS0hzd3JRNUw0cm1JbTFCL1hS?=
 =?utf-8?B?c1RPM3ltdkY0dWRzWktvbE5UcFNlbWJjbm0xS2pRajJldWViZitjTU8vYVF2?=
 =?utf-8?B?Q1NXWUZudDV4cmFvYnRJdy8wM2VWTDRXcUw3REQrZWVDSGRweHF2bEhQVjhm?=
 =?utf-8?B?aXM1UzNkRW9GdHloSis3dlpSbDdXZUJtK21yY0c0OHArS1JncTFGcXR3MmZ0?=
 =?utf-8?B?Q0pJNnhBWmFTN3lMNTJlaUdnVnl5b3hoZk9BU2lNL3FkZGlPcjhFOWcvT3pR?=
 =?utf-8?B?L0IycjhzaXoyLzRBRXpWWlNjUG9tNHVMVlVVZmNOQ3dEcjRUNklOK1BGcXJT?=
 =?utf-8?B?WWJvalBLZTBqSWU0cGZjN3FxK2s1SW9QVGVaMDJrSEJLakFUUTFOZml5VUMz?=
 =?utf-8?B?SFV2WjN1dEdaMTVTNDVVRk04dDQzMDF1Mm9PWCsreXhyT1dNTmYycEtiTG1S?=
 =?utf-8?B?MWJxZjJWQ2Fyb3diZmp5dGxtMVlaVDVGUldxU3lOUFliTS9MNGgzQjdmYUw3?=
 =?utf-8?B?RE15d2RtSUZEeHYrSkh0UFNGdmt0c1hLS1ZOU29JWUp6U0hnVW52bHZHQ1lX?=
 =?utf-8?B?UmVEekJYbW5BRGdPZ0hXR0JEUkJCMVp5dy9YQU9xeXFRT3ZPT2tFNmVLZ3Bn?=
 =?utf-8?B?UnBrMHpqTTZLSUVHQk9oOU51UmJVQU91VmdlT3Y4OGl4QWdnUzRnRUJ1dzZS?=
 =?utf-8?B?NS9rZnFCczZGLzlLVCtGUWJBL05ubmZwdzc1K01YZE5wUzg1U0R4Tm5pQkg4?=
 =?utf-8?B?L1M2WXFuem9pQ2RyUU1qN1djbEM0M1JrWGtobXJqTXkrQXlEdVhwSExwTTY4?=
 =?utf-8?B?TXB4a3lXM1FEOWhWNzFyTGRRUWJhNGwxd1RZd2FsemRIT2NHTjg0emJXclpl?=
 =?utf-8?B?azk3K094dkhoLzFyUDZCVnRLaWFQcDFmczVGaVlzblBmejBVMjFPUVFMbVYv?=
 =?utf-8?B?MmFQZXhLM09ZQ0dIbEFzdmx6Snd2Q0VETDkwQ05TZjd6dXVhUnQ1SDh0amRP?=
 =?utf-8?B?MklRL0pPSE05NTg5Y0s1ZzBSTG1mRFk2MTQ1bDVUTXQyL0lnZ3h5cDd6UWZV?=
 =?utf-8?B?Z3dESnhDUG5PM3YybWxnODdoRDhndmRqbkZIdWQrbGJGR3c0M05hb1IrRGpo?=
 =?utf-8?Q?xYoRX+6BMbCf/vjBGrdG+ndlBwBB3pjNDNLPD+2?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3206323c-c23e-42e1-ed0c-08d90972a4a9
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2021 11:50:24.5586
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SjFIrqgNXJ+AM9trMhqDilT8W4q1P884nZj7VnUcExWmKp/tUCIDmCgXjeG7+3DSt2d3TS5owgZojeB9/4kU6Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB3147
X-OriginatorOrg: citrix.com

On Mon, Apr 26, 2021 at 09:49:13AM +0200, Jan Beulich wrote:
> On 23.04.2021 16:37, Roger Pau Monne wrote:
> > Remove the unneeded usage of the compat layer to copy frame pointers
> > from guest address space. Instead just use raw_copy_from_guest.
> > 
> > While there drop the checks for the accessibility of one struct
> > frame_head beyond the current one: it's not clear why it's needed and
> > all the hypnoses point to dropping such check being harmless. The
> 
> DYM "hypotheses"?

Yes, sorry, selected the wrong spell checker suggestion I guess.

> 
> > worse that could happen is that a failure happens later if data past
> > frame_head is attempted to be fetched, albeit I'm not able to spot any
> > such access.
> > 
> > Also drop the explicit truncation of the head pointer in the 32bit
> > case as all callers already pass a zero extended value. The first
> > value being rsp from the guest registers,
> 
> While I know I'm guilty of splitting hair saying so, I'd like to point
> out that I'm unaware of guarantees that the upper halves of GPRs are
> zero after a switch from compat to 64-bit mode. With this I'm also
> unconvinced there are guarantees that the %rsp stored into a stack
> frame is actually guaranteed to be zero-extended. Nevertheless I'm not
> meaning this remark to keep the change from going in as is - for all
> practical purposes what you say is presumably true.

Also, given the context of this code (oprofile backtrace generation),
I'm unsure what issues could arise from not using a zero extended
value for a guest in 32bit mode apart from a failure to obtain the
backtrace itself.

> What I would consider nice though is if the two remaining if() could
> be corrected for coding style: Adjacent code is already inconsistent,
> so taking the opportunity to move it a little in the right direction
> would seem desirable to me. (I would suggest doing so myself while
> committing, but because I don't fully agree with dropping the 2-frame
> checks described further up without properly understanding why they're
> there, I'd like to not put my name on this change in any way, not even
> just as committer. But I guess Andrew or Wei or whoever ends up
> committing this could do so, as long as they agree of course.)

OK, I can add the 2-frame checks back in, I certainly don't have that
strong opinion and the resulting code will be better just by dropping
the usage of the compat layer even if we decide to keep those
checks.

Let me prepare a new version.

Thanks, Roger.

