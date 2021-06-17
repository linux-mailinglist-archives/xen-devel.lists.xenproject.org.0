Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 448D13AB2D3
	for <lists+xen-devel@lfdr.de>; Thu, 17 Jun 2021 13:41:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.143884.265001 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ltqOC-0002Nb-4P; Thu, 17 Jun 2021 11:40:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 143884.265001; Thu, 17 Jun 2021 11:40:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ltqOC-0002Kn-0k; Thu, 17 Jun 2021 11:40:52 +0000
Received: by outflank-mailman (input) for mailman id 143884;
 Thu, 17 Jun 2021 11:40:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RfGr=LL=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1ltqOA-0002Kf-8j
 for xen-devel@lists.xenproject.org; Thu, 17 Jun 2021 11:40:50 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a44f6786-c1f6-4c62-b1f6-5d631c10fb83;
 Thu, 17 Jun 2021 11:40:49 +0000 (UTC)
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
X-Inumbo-ID: a44f6786-c1f6-4c62-b1f6-5d631c10fb83
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1623930049;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=BjMBZQqQ97Fem6z5BNiJI+cN+RhUVIahknuWCnEulew=;
  b=OAHzswDi2KwGDI9nbA5tK8xDdXoS6RvsxbEdlBzqIZsDz8zdxU1eRKG9
   l5Ut7bHtq5h7vaZct0kLsqfzvDFDsEPZD2wf+J+c34DcCQRkuRTqjYtti
   Y2BzbvDCW1/TcPSmgEFTaF/ywxoFy8AbpA2Ls8bcE/aZnZ6KYBuWLKMdV
   g=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: WBQGKv6YHS42qTnRs3Sm4ChMIBPoR8IxkfL8RQQFh40XaAs5PxK8M1CIDTT31Fl8ePPVFWIdSc
 kjRO5ltD6ZCZMvSRtv72e/HRfv2+SoNj3yihtK05CEqMG0jBPc8eSE8eVM42he+7OoZzjedvWK
 NydlHy03wOiBVt8DvL1+sK6tTJ3QHhgXZ+hwizvECloZLRPMQqdhUl/ZN6nd8lWoosg3PTF/LQ
 0+2FYAY4JQUUNkk+f5RCJ2m2KiuqBCiP4+T6aqyPt/8DQRPRCJ+ba1Qjy2ENRUCSli5pQWI+xN
 hrk=
X-SBRS: 5.1
X-MesageID: 46083128
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:uBuWi6sNBiAUMAV29io57iqd7skDFdV00zEX/kB9WHVpm62j9/
 xG+c5x6faaslsssR0b8+xoW5PgfZqjz/FICOAqVN+ftWLd1FdAQrsN0bff
X-IronPort-AV: E=Sophos;i="5.83,280,1616472000"; 
   d="scan'208";a="46083128"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XKn4/e7oMUpFVP0pfySrlzdUlREtjYaCHSplLPCcx5VdO64cJQlOcd8Qkt9Y29BQg8ZRGQxAreK05L3HRE3P1eCdtrAB08j2smOeLURmxsfoQANJgswS8vClvqaDJfCF1HUcsd0kTjWoQlMBHTLFlFwBrgf/kPGSGN8HOqwz5IEa8J/5IjvlOVTMNGjwPoJxqx+Y/94xtQJbJnVdj0eixcGafJgwnAPeR89Gfx3iisVtBXPdCD4glBo7KXd63huoHn1HwQ4jE9C49QqYQsSdQeDdDuI0zri3TyppEqHCituZhWJO37ECHh0nex0hsZNuaxL4wqhbjoYGo1XETBYWqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wd1VxetJ+fnJozp7KE+NdfZNJ6gI3wySJMPW5Cp+MTU=;
 b=aSdR+I0uzVOp90wJhPbFDsLibDFBEgeUtQ1fCWItdWuYIRb+9o0qitSqO9GWte0Vb4yNrMsUtHPIl99sw3fuXKGeWOD0Wio2EInIfAq7DquvWPJZYefeayLjTP7NNy8pX83YQrDRMPE27LbUlvK+zOBDHrWku5JZnF1I0vsztzX7jRaLY0ZJUrJ2UmZMGi1PeFXOGjSYMYwWOowzIJFlUXdbGPbN/K3TVcB5U4xc2Fj4NSAgOvJ8pFn6MFSdQ/0qAD6NkeamLGuhi87NSwUzLrRfZt/6U1DiuUwaTXIx6ZNg+2jGYUYQ5ctfsT4rawI31wl8KUmx5JQSUn8+3BSuow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wd1VxetJ+fnJozp7KE+NdfZNJ6gI3wySJMPW5Cp+MTU=;
 b=cMxMkz5Fy4LHB2VuIOlC837P1a9syoXB+TeDZDa53yeUGF8QYykiQy7+01nc0s5A1gz5bYOLQQWAYhQg+y66xtNunc72wBgJXXrNoRHgnH+fsIovzdzPcrNHGyZr1SUnopVzV+/XyXHaKRyPV143y73fGOID4IaRQRL80PmU0ak=
Date: Thu, 17 Jun 2021 13:40:39 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: "Tian, Kevin" <kevin.tian@intel.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"Nakajima, Jun" <jun.nakajima@intel.com>, Jan Beulich <jbeulich@suse.com>,
	"Cooper, Andrew" <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, George
 Dunlap <george.dunlap@citrix.com>
Subject: Re: [PATCH 3/3] x86/ept: force WB cache attributes for grant and
 foreign maps
Message-ID: <YMs0t/gQEK4kUGiQ@Air-de-Roger>
References: <20210528173935.29919-1-roger.pau@citrix.com>
 <20210528173935.29919-4-roger.pau@citrix.com>
 <MWHPR11MB188653F8277F861018DB00118C0E9@MWHPR11MB1886.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <MWHPR11MB188653F8277F861018DB00118C0E9@MWHPR11MB1886.namprd11.prod.outlook.com>
X-ClientProxiedBy: MR2P264CA0098.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:33::14) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3ec37145-0385-46b5-aab6-08d93184becf
X-MS-TrafficTypeDiagnostic: DM6PR03MB3673:
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB3673D5E9BE463304EDA0C3BE8F0E9@DM6PR03MB3673.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zceKVqRHG9ise1YnpBvqHNa4ieJfuP5jykEgdf5kbZCnci39NJn+NEZ5NJ/u47t+9tIrgLFLSj1Xby9sfCgGw9hP/fn6oyaL/uwOsYxxsibWqPhgY3bwla0Z81ehAWwh57VMAfMlxxiuI39nSgWBx88+jfDwN7Iuz33LABp5bhYpWdKoeXHQJxJwed2Deu04h49P1I55WFw9Oa001QfTHsskiCVg0QDwFnqUhHG6eh0J8sqlK4exi+eOM3QcgJQw5Nef5Z9X8Pu9ncxLfRJlsXPSnEVQ+ZUFGTwyK7v51RUGW4o+fJ3FCOMrPV4q/5Cv7nhdPDEZae4YgkNf+qVYsgxGHwcgBZBsNk0/mjg5Vl4IvfyhN3Jd0U75JO6OehGnUw/bzUeukLlu0v7lUGjBzCI6Yxdj8dFGVoEPsQf/K9RlnlRPKiNM8AdSeZPtRghMmmlEHGrirX3SSTbJqToG67b85v1xkwtIgj5xqPWaceYiFS8eRujKRUDSfkHX0Nc5KsvNJXrAC/M5xMGseMTC+wjaKyO3JYOeqcZQcQJFJs793rOnRCOD5QjwFABJzrCcNwCL61lQy/tbi/H9LZfanlUJFclyipSWI//zdyLj7Dg=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(396003)(39860400002)(366004)(346002)(136003)(376002)(107886003)(316002)(6486002)(4326008)(26005)(16526019)(54906003)(9686003)(186003)(33716001)(2906002)(5660300002)(6496006)(86362001)(6666004)(8676002)(38100700002)(66556008)(478600001)(66946007)(6916009)(66476007)(85182001)(956004)(8936002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OUgxZGxpR3RDdFR3dGJrLzV3aHNRRXJ2YUdVbW5vMGRHd1laV1NISGh4NS9N?=
 =?utf-8?B?a1dteXNXTkFGNEtnZC9zdktjY2tRRjJiY0srL1p4TUhkSUtvNXRSdmRQZzRq?=
 =?utf-8?B?aWdMNHYvUUZwZUFxRGx6SGg1TXJhQWNmeE1SanFDL0h5Z1ZlK3ZOR0hQSm9l?=
 =?utf-8?B?NDBzQlBHS1paNkN4T2lqaE1FVnJqZlNJem5LeC9ENGhpdDMvYWpJSmVOd2ZX?=
 =?utf-8?B?WUVWS2tRd3NhenYyYUU2UnJ4T0d4RExGUFR5bjhvdDhrcmxmTHc1dTN6alZ0?=
 =?utf-8?B?ZVdMd013ak1ydEJ6bHU3Z05VeWJsRko3cDk1RGdUSFNESm93bjA5NzBRNVlU?=
 =?utf-8?B?Q2lYcEdQbkJRb2doZlhhYnU1WVhrNXZRazNkdTE5MW1sTnoxVDVCYnptMkRj?=
 =?utf-8?B?WTZ0MlRXWjFFbklXNWNjWWtuTzczczhJdzhyeGRna09ITjlya0FMaFVEVzVE?=
 =?utf-8?B?YklXSW43UW5SYVo0R2o0bzBteU9JR0Q1VEdsTjM3SnZKTCthM0lYT2NDZTh3?=
 =?utf-8?B?M2w1TWRRenJUbXJCbkRSSFZZRjRRTyt4YkJ4Wk4rUUJEc3NPQ1VGbHlkZTJZ?=
 =?utf-8?B?d0tPdGhsTjU3WTBxTkZKdmhuYS9relFNdVpDSmxkMGtaa21aeHlJM1hIQmts?=
 =?utf-8?B?eUJpRk0yMVNiSWxwakVqWVROcUw4bUpmVVVXaDg1eU9WaTB6ajcxVjhkTzU5?=
 =?utf-8?B?dmRqdDlVb0F4SCs4a1l2RmtleHFrdHRKQUYyMzJBVnVwSGQ5bGpWZDdKZ3h2?=
 =?utf-8?B?Nk1aOEFJRDZwRnpDeThaZXVSL2tzNC9reUZZTnJ5eG5EbTJ1VWltcEs5ZjVy?=
 =?utf-8?B?K3FGY3BpcEJ6bHlNMVVzSm91cVRzYm4vZENXdDNoVTFCamU1S2Via2RETGNz?=
 =?utf-8?B?NmFEdmM2YkIxdmE5OCtDMWM4TWlrNUN1VHIxcU9maFBYZG01T2JtZGNsN0RX?=
 =?utf-8?B?QVhXWWF0QTZkRW80Z2Z2cGl2RTZWS01SUEhjZmUzRlE2MVVYOUt4b3RKVnNJ?=
 =?utf-8?B?anVFeG85OG52U09yVmxNNVp5QXNhQ0FDOElJSmtPZmwyQmdnZzRFY2RRaEZl?=
 =?utf-8?B?blpWTFVzQXU2WUl6eDBCbWU0d2w2WUVLWDJvNDNkMEc3WHRIVGdXWFdoUlB4?=
 =?utf-8?B?bEVhcXBtMXJDcVhKblBCR1FRbzl5RmJMRzAvZXR6d0xCclBuWURaUnhhMkFB?=
 =?utf-8?B?RnZzNFljT3dXSDFvNmY5dDNOMlU0ajRzalBVRDlpbWhzV0phMHRUMFJQWmZC?=
 =?utf-8?B?ekp5TVFCZE9leHo2SUMwVTVVNEVSU2lQN2pmSWM3NVYyYXNRVzlYZTdHSFdq?=
 =?utf-8?B?TFg4WFR5WVdyQnRHZXQ3cnQxZGNFU1lTV1lRT0dBbTQ2K2FkWkhZL2hjTHd5?=
 =?utf-8?B?djN2eGpHdTVzdi9Va1lLZmV4OFJNYXc1Q3NpZTB4azdRL01GYTA5K3R6VWY2?=
 =?utf-8?B?eG9wRXNqZ1A1NXZ3TEZaQWNVQllGZllSb1l2WEhwTkJvRm92Z3ZKMUwzeGdR?=
 =?utf-8?B?WnJ4OTA1aERsdFJhT0EvV2pPR1FrS0lCaWg1TTUyYWoyeGFEbGJRbXN3b21q?=
 =?utf-8?B?UVRHdlBTcVhLa1ZwTG4vb2NRM1JGRjRUSWlVa2hRdlIrOXpiUWdYTjJML05i?=
 =?utf-8?B?QUI3VkNxOVN4dUc3azlvN1VSZUQ1dGZpdm8rdVZYRmFpcWxjaFMwWThzd0x4?=
 =?utf-8?B?b1k5cGRFenVHTUtlZzl1ZXh2SDVCTWVwU2FvcnNJMS9udVNlSmhkUWNVY3Q5?=
 =?utf-8?Q?gkqEUGtZcfoTQvTClg0nFTc17U6GHoU4Mv3MaWz?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ec37145-0385-46b5-aab6-08d93184becf
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2021 11:40:45.9466
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ga5mQDt84Yi4713hbDaU9o3uLHQmln7+HbtNgtQFhKzzBSJXp4M78PZinPmjdOuUWCuyFEyCqJYMrZdVda4iTg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB3673
X-OriginatorOrg: citrix.com

On Thu, Jun 17, 2021 at 09:31:28AM +0000, Tian, Kevin wrote:
> > From: Roger Pau Monne <roger.pau@citrix.com>
> > Sent: Saturday, May 29, 2021 1:40 AM
> > 
> > Force WB type for grants and foreign pages. Those are usually mapped
> > over unpopulated physical ranges in the p2m, and those ranges would
> > usually be UC in the MTRR state, which is unlikely to be the correct
> > cache attribute. It's also cumbersome (or even impossible) for the
> > guest to be setting the MTRR type for all those mappings as WB, as
> > MTRR ranges are finite.
> > 
> > Note that on AMD we cannot force a cache attribute because of the lack
> > of ignore PAT equivalent, so the behavior here slightly diverges
> > between AMD and Intel (or EPT vs NPT/shadow).
> > 
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> 
> Reviewed-by: Kevin Tian <kevin.tian@intel.com>
> 
> btw incorrect cache attribute brings functional/performance problem. 
> it'd be good to explain a bit why this problem doesn't hurt AMD in the 
> commit msg...

What about re-writing the last commit paragraph as:

Note that this is not an issue on AMD because WB cache attribute is
already set on grants and foreign mappings in the p2m and MTRR types
are ignored. Also on AMD Xen cannot force a cache attribute because of
the lack of ignore PAT equivalent, so the behavior here slightly
diverges between AMD and Intel (or EPT vs NPT/shadow).

Thanks, Roger.

