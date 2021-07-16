Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6688E3CBA66
	for <lists+xen-devel@lfdr.de>; Fri, 16 Jul 2021 18:15:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.157633.290312 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m4QUa-0004Cs-E4; Fri, 16 Jul 2021 16:15:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 157633.290312; Fri, 16 Jul 2021 16:15:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m4QUa-0004A9-AJ; Fri, 16 Jul 2021 16:15:12 +0000
Received: by outflank-mailman (input) for mailman id 157633;
 Fri, 16 Jul 2021 16:15:11 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3zi8=MI=citrix.com=Andrew.Cooper3@srs-us1.protection.inumbo.net>)
 id 1m4QUZ-0004A3-1Y
 for xen-devel@lists.xenproject.org; Fri, 16 Jul 2021 16:15:11 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id fdaea084-e650-11eb-899f-12813bfff9fa;
 Fri, 16 Jul 2021 16:15:09 +0000 (UTC)
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
X-Inumbo-ID: fdaea084-e650-11eb-899f-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1626452109;
  h=to:cc:references:from:subject:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=qi/0MKpUhsMWSdazeCCbRG7PbIrzbJG8w5alOwgNjUk=;
  b=OCXl1wbwYvax62AU0fwAJMNDLky71uCEXDoKtU2TEJvY8aW4Qqr7lG9K
   p2xDlBqT/kyNtYqAfI9W32YsayTcJjHhR69TVpkLfaRM+MYrVwg5FAIXh
   L17KWisBfWDSoe/fXENwKyL6NIUc8vli/FvYIXkx8wd0+Ofe1rhjfS7ew
   4=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: JjUiUbn8XNwQOAKzU+z1OlpTthx/Cr0yCJFA4Y4sVVaC3hNWNqFcqtCIJdFt4NRmrSHG7hs47x
 VdtcPahfNxo6Z3BFv6qgeRrFq68iJtaEAF4pc/Eny57MbmkmAjMCSf4UJ95SFrE9t4SpDNroo2
 UWngoBDhtJsAaaMEUF4fX+KB6RIz27mHl0gA8ML7n8gzJltQbmKGbH5/wj76tRFzmzEwBWl+Ph
 LjGrkO2Aw+GWJDUi3RHWtkacDNkWDBgdIdnTBsOiCpcXGHTvnBCl93M7tqpvqjoMjID/iTltDN
 00U=
X-SBRS: 5.1
X-MesageID: 48446561
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:J63ZyaGbcZaVUV+LpLqEEseALOsnbusQ8zAXPiBKJCC9vPb5qy
 nOpoV+6faQslwssR4b9uxoVJPvfZq+z+8R3WByB8bAYOCOggLBQL2KhbGI/9SKIVydygcy78
 Zdm6gVMqyMMbB55/yKnDVRxbwbsaa6GKPDv5ah8590JzsaDJ2Jd21Ce32m+ksdfnghObMJUK
 Cyy+BgvDSadXEefq2AdwM4t7iqnayzqHr+CyR2fyIa1A==
X-IronPort-AV: E=Sophos;i="5.84,245,1620705600"; 
   d="scan'208";a="48446561"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JUsxg0h3+JB9+WKq5fcS8VYvu8hN67U30oLKkUu1cVTuzIDyGYn+GTGqIcGrb33i+bRj1/vZ6z9+lvRJQcoI8TtXhtyWxZB4xPiKocg7aP9maNBNH55gjLLPi3DZVpzRTHsyirc9vLZaDN21jIiNArmmPmbJDJOAVmSccJaEY+ib/Xvh/yoRsHvSic9vGZhWIpVKWsy8sVpLgdXVkpoOk/lXE3DXANFpcfgM/XtE7tImhxAGwDr7JEVfG41ZiGdCnL4g9+AwPVt0SmJ+svZTAp3MwwDuW8z8WcMU5t9Hv0Q0MLdjseK3I4Dr/UiCNOXOFzcvkBQfqFk8Q6Qv98n/qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qi/0MKpUhsMWSdazeCCbRG7PbIrzbJG8w5alOwgNjUk=;
 b=WUDu7VDYl0K/vG9RoK2FJ5DIkijj9Qil4zgQkpiD3mVd+WKvAcuVVyzphoaI8ik0A1r8aPePINKbISCVPAuUSAez6NYQuNpeXb65cp7FZOvG9CpyNcwbqROCn7W9mzdmUJB9vq40zKuu1Ss2kZMzQZ0jJveE1Y17c6DjyiI09fEo5n8xnrGugfbCO/cCLs7cr5lRmCpqBAC7HBF3fxT1gli1e+i1jhsLGL3o1jTUPM8zV580KKBMShtMy57OP3JiJrwWtMPxtGgGmtdEYTaVm7Z4234nWV+SD03y1E8iCDlgdkch0v58VKBRt7PJoUTIGDOySqbJGGIcH7v8vr6ZSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qi/0MKpUhsMWSdazeCCbRG7PbIrzbJG8w5alOwgNjUk=;
 b=ik5j25u125E5fiEVRzMmGQAzdQm+dJnNw+GyRTbRZYogrLz3SeTgorTxjnQly05NgOYUCwprIsI4tgQKpaD7B6Zaa+ttEebGgrBwx2ozO8K09Dt3pOOBja3AD1cO0syln9HI+xbjvEgmKFYNSB2MgtoRPDywBAwUfGIW7SoKpX0=
To: George Dunlap <George.Dunlap@citrix.com>, Anthony Perard
	<anthony.perard@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Ian
 Jackson" <iwj@xenproject.org>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>
References: <20210714161734.256246-1-anthony.perard@citrix.com>
 <40A28D22-91BC-438D-99C9-46DF6DA90A5E@citrix.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [XEN PATCH] xen: allow XSM_FLASK_POLICY only if checkpolicy
 binary is available
Message-ID: <fc2e93b7-020d-1a47-b411-5220e8de74e9@citrix.com>
Date: Fri, 16 Jul 2021 17:14:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
In-Reply-To: <40A28D22-91BC-438D-99C9-46DF6DA90A5E@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0504.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1ab::23) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f56cc124-0210-445e-79cd-08d94874dce8
X-MS-TrafficTypeDiagnostic: BYAPR03MB3493:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR03MB349371E049DA8EC0298E5574BA119@BYAPR03MB3493.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XzIIoSnPg2+fY6SeFW2ei3ATDJ4PqHFGLZKp4w7JkXnygSWNfsk7ZTufcBGtLIs2Xa8wsySHGQg1TuDqJLjhXAb4LNqZjBe7DMirmztFzY0oUQ/mJif7gHgxW73QQd6VU9QXcdFH1DrL7KSEwAjLBWU6EPArkijTo6h9fp5bFWDhOaqNY8T9SOsnmcb9wqgPWk/exbg7tHgE+CYKLbSsOCLzN8twYbDVooN0WnyICON4cxAtPy8uOtzqK03pLhoNkTRgbp6nJB6JpHnaRpiWfja8yhMNG9gaHJz0G5Vx431OqC07MneQXv84jeI55G+aKQXkO+OvjqYfXPzeLCi2T5GpdKjO68WuEFXSFk/4Ln16i4YpT8JCK7rFum7dxicJktPyudKeEG/d2ZzNW1MftLv98Y3O1zTfIqgiei++k5u22fvyFoPtQafTBnZTUHeX5XWIdrSXXku3r8SS2jemfBLpO1NIqqyL71G6FwklxbS54jq2JjtOTkgAWcNWh4S9e2BcCMi8HuwK/jEpRfGrJDj8dEzLnX4cUGm9a8yMWyWqylMh53nJYTRq5T1bTdJr200JP3VMhFjBpvaGXCimRGXRP/z396ld1hUbwYjehKAHze9cVhNk97BTwcxb85OD/ZuWrLRcUhqb2QBWQqLZauKF866zzJIBWHe7N0SltupTjzcCo5DO1fiGMGv5OQKgzyUJn0xy1jHqghERRXWDaknPLIKxArRFVa3428lInhs=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(396003)(136003)(346002)(376002)(39860400002)(6636002)(186003)(110136005)(66946007)(53546011)(38100700002)(83380400001)(26005)(316002)(8676002)(66476007)(66556008)(16576012)(4326008)(31686004)(31696002)(5660300002)(2906002)(2616005)(54906003)(956004)(8936002)(6486002)(478600001)(36756003)(86362001)(6666004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q1hpV3NxMzRMNk5qcHozaWUyZ0cvMmxxZ3QwTlFMdnZZa0VXMXZoaEt1eFQv?=
 =?utf-8?B?YUZVWnBHOW92QURCV3ZEdEpPaklWN0dtZzZYVVZ6MWdCNWU5aFRpaGVjK0Uw?=
 =?utf-8?B?TUJvOGNNNzAxd1RrQ0pMZDdQclA1UGtacTdRVkkrdVdUYThSeXdIczRQOEJW?=
 =?utf-8?B?WWMyYUtqbG1PTU1lb2VKazIrWmw1Tnp0YzNlVVljRFRXNlFSeFh6Q0dOMnZo?=
 =?utf-8?B?bmdra2oySVNsTWpNd0F5UGk2QnA3R09lK3dyNDFERGxWNFNjZVdFNGIxMWtS?=
 =?utf-8?B?NFIyekVESnJUNUl2QzJVTStidFpIRyt4UjJhVnZSZUNHM295VEZvSHdsL0RI?=
 =?utf-8?B?WFJta3lwRUNlQ2haSWJKK0hYeDBHUFJhbFVCTEttT1g1ZU9vSW9LcXFjaXFL?=
 =?utf-8?B?NDJYekwwWVZ2UVc3eWlmQlpDdFlIWmRid2h0VnF6U2s0c1IxTWJxTFYyUWl6?=
 =?utf-8?B?VUs4blhNcExPdkhta2M4VjcxVjVKeEloSjRXWTZzZHlkdGx1cTFHK1ZSNGc5?=
 =?utf-8?B?RjJGMzhaT2hibXNRZGc5Sm5xOWNEakFoNEVpemdJMVd4S3orcCtCU014Z2Jr?=
 =?utf-8?B?aStMZTAyWjBNYmd1Zy9LRmxPR2JvL3ZrbkJYWEVwWEs4M1dKTGVZNllrZmc1?=
 =?utf-8?B?MzlmZGlteTlrczJlamRkQi9lNllKNXR5RkIrRG9xaWVOb0F5YWk2MUlQTWpB?=
 =?utf-8?B?TGFqSWhRU3hLZW1FbWpXUVVMUnI4S0p4TERtd2xjeXVqSzZDTitNUUs1RHgy?=
 =?utf-8?B?K1NjbkM0V3NqQVJ1ckxkdC9XVFEzZ3RZTmdvVG96RWZZUjdEWE9nYjUrVjY1?=
 =?utf-8?B?WkwrUHQ2VmZyUUlwZkJrd2lQa2dvTjJqNzFEbTJyZDBxL2ZFQjFaR0VaWHpw?=
 =?utf-8?B?djhRK1IrTmJhYTRGUEV4N2VpR0FMelFSeVlFYXo3dkNQOXYzNlBsQStBLzBa?=
 =?utf-8?B?MHhXY2wxNXAwWnQ3VUtBZXRXYldNWndCVUxpZ1hGR1pBenRNQUpzZk1MNUts?=
 =?utf-8?B?clhWL2RLWEQyV1krVGhrWDFwaG1kNFhhdUJhcDFwU1Zsb1ZzWlJNNDQvazBk?=
 =?utf-8?B?ejhvTGoyN3JoNVZxUmtSZVVnaXd2NnVaV280SEovbWtVSzdjR1V1Qy9XOEZ2?=
 =?utf-8?B?WWQwVkJncS8waHdUZm1BWlRmM0pydHgzc3RITU9CTFBqb2xpL0xKbWdDaFFu?=
 =?utf-8?B?Y1lrMmloYlBqUDF3aTBKMGJBd2Q4YXlYelZrK1MvVCtaNGdTc2s5UFVLWmZY?=
 =?utf-8?B?K1JXRzlNS2JIU0ZnR0VBb0laYmdPSmdZRDdKTWw0YkVrUGR2ZVU0MHIxRHo2?=
 =?utf-8?B?NlRVMDdDQnNpVGNFM2ZIMEpjcmZwdTJra29obWRQSjdsK2o1aU1NU0o0aGVC?=
 =?utf-8?B?NjFQbGRBL3VaWDlWWXYzK3MzVUlMUDBMeHpEN3lPTmpheGZDUzBYYm9QNzRZ?=
 =?utf-8?B?OFZmM3BvRjYzQ3JzWGZyU2lpYVcwWVNuVTJUVVFTMmNxR1pMYnZDckpBdGds?=
 =?utf-8?B?MjJLUXp0N3BBUHIyMDFRNVR6THhMMDhHN21HcW1wM0Zka2Z1ZlUycXVsb29r?=
 =?utf-8?B?OVdNbWhSU2tLQlhlS2ZQUGdZN3orSkVQc2ZuODJLY0M4UE4zS1JoeFVRN3Qv?=
 =?utf-8?B?eVRjc0d0emppbVpYZGZ4cE5Oemd5V1RZMzhjT0JzSUxGcDRINFhHU1hReDcz?=
 =?utf-8?B?M3BXUVpRMFhxZHRIbTBWZlVVUFAzb0lFSEY5UHpzMURIbFFtNDZNT1FGSWl0?=
 =?utf-8?Q?fQyouGfOog6MrSgf6f/neSjqQeIueCng+VExZM2?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f56cc124-0210-445e-79cd-08d94874dce8
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2021 16:15:01.0394
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Zneu9q0ndSgzn3eMriL7wHAZq3/lipsU1/gJw9ZcqUDuFzQqsMeW3zWytzLVFOMjjbM4Tu9vOWD1eZGI/K+Tz5Wd3S5l0s7QGw102W2MENY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB3493
X-OriginatorOrg: citrix.com

On 16/07/2021 16:26, George Dunlap wrote:
>
>> On Jul 14, 2021, at 5:17 PM, Anthony PERARD <anthony.perard@citrix.com> =
wrote:
>>
>> This will help prevent the CI loop from having build failures when
>> `checkpolicy` isn't available, when doing "randconfig" jobs.
> Hang on, just to clarify what=E2=80=99s going on here.
>
> =E2=80=98randconfig=E2=80=99 is setting CONFIG_XSM_FLASK_POLICY in the .c=
onfig file; and then when the build happens, we error out because one of th=
e required components isn=E2=80=99t there.
>
> What this patch does is to make it so that if someone explicitly sets CON=
FIG_XSM_FLASK_POLICY=3Dy, but doesn=E2=80=99t have checkpolicy, the build s=
ystem will silently disable the policy behind their backs without telling t=
hem?

Yes, but that's how ~everything in the Xen and Linux build works currently.

What this new version will do is produce a config/build combo, with the
config reporting that CONFIG_XSM_FLASK_POLICY was not active.

This is a damnsignt better than the "old" way of doing feature checks in
the makefiles, where there is no trace that the build system disabled a
feature because your compiler was too old.

~Andrew


