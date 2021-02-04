Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A544930EFD5
	for <lists+xen-devel@lfdr.de>; Thu,  4 Feb 2021 10:41:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.81195.149572 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l7b8Y-0008I3-04; Thu, 04 Feb 2021 09:41:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 81195.149572; Thu, 04 Feb 2021 09:41:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l7b8X-0008Hd-RM; Thu, 04 Feb 2021 09:41:17 +0000
Received: by outflank-mailman (input) for mailman id 81195;
 Thu, 04 Feb 2021 09:41:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YP8j=HG=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1l7b8W-0008HY-RP
 for xen-devel@lists.xenproject.org; Thu, 04 Feb 2021 09:41:16 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8618e7d8-6bf2-4d6c-b67f-293db70a7c2d;
 Thu, 04 Feb 2021 09:41:15 +0000 (UTC)
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
X-Inumbo-ID: 8618e7d8-6bf2-4d6c-b67f-293db70a7c2d
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1612431675;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=FMDVXBrap7ApEzdp7tbHIqaD4Q8/49II7EbgvHeWv44=;
  b=CJABbjvErJPFqg4lIlrBy9eg78C4rMSvK2n0hdTJIncEPh5DsiRqouQ9
   DCNXqc1GWt/8co4Gd+Cw76jTsyEtxancgfIVPt13fcONZg6E5oLYNGqG1
   Af1EKG48BJY+3J56iVzIQuTaBDDeIydqVSwRWpINsMhflBPOLipqMwf+l
   8=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: mEq6I5MJL0d9r9E+X/A07TnoAd/74Xqxl5s3yuP6c1eSEq2Ueu6WGsWO26PG7kecR89qyXFr2F
 CuQSegvEow9Lz0Y0VpnN1BtQpKBGBSHQwTzVMX97IfyW0moxUUJQIMFu5vnO5lsg3jD2aIhC3b
 cGAkCCpwhk8rpZmhAhpdNW1J49seBz7Qm5TNHeDtkOgwGBBOqrL1FcJORkCCHkr8h1rpU8VulL
 UoJ7cpuNcqxYoxYQD+rDyQYK+8q58KwUK5F4R8Vj2byjlNQZvuQ4OukF+rmFlweLr4SMxRbbTR
 R2Q=
X-SBRS: 5.2
X-MesageID: 36487253
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,400,1602561600"; 
   d="scan'208";a="36487253"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fT9o4CtekVL7SBBMSsuQzK7xFMOkJ0EdkDVplzf2HBz78/eoQS3RW+S67mPG1ixufeBHJMRYWI99HqhTcb4GN3z7vdZViju/EPtVCsG2gqALCypDPisPpGjC4MS1kjEgaQ+u4Xwysv3iwHtp/XACG6tlm4cyKomJFiVz+j2WYjjcp+QggaoYhcntbq2GVoh8HRRgocXioKQK9xMbTkrqtfBmBKub4ywky2njDS/avBZLsl8U/Acwa7CoHeDTSgwQzef/LgcvfR8TzRioYNQieEVZIfO7zbVxBMozo9lubFxf2+tZZc7bDm2Stf95nersspr0jCweuvn1ISOUbiOCPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UNYHDhfPOHqIe4jfqbK9HaUjY8ZU7s7RN0jYylJkosI=;
 b=KrwfMUMJq6HegnkeHLk389Xf9NSmYQLCPa5jA6WVXXqCwp2T3OKNeqlBMUmxq4krvAEJsHrbtZlCtQusL1dRjDsacoWVZn4RY07DbOzYRbMFmdFPbFyvyCjtgxKA3h9QfpOLJDGVMl9anq6FpJ1eOcB5Tkpeug7TdSM1u5me5bFTmBiOwZmOnuc0Le9A1Hc6fBqHwnVgiGJPb6zpFiMybyTmEQdSR6eD3YkBaKEO0O7rrqUqktgR/SOQD+6nwjwqVEg2FmrxpEfpvoDkfV42GPCaXcnJWNZZZ8/PXqeahZOGh5PavwVYexZslLUO2+P2WF62PjdGJsXCanN9Q9pI6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UNYHDhfPOHqIe4jfqbK9HaUjY8ZU7s7RN0jYylJkosI=;
 b=Ae7oJ+2Uy93P1yayFT0RUCHm5YC6FtjYE5grSEV/Rw3NFa2VKclqf5ocjE67ea4nPueIo5z1tLby7YyzDDeEtyO01GYez86LQnKfcx3O13Zr7dcgX+WP9+mceA3RTtgPm1Ir+/dLtzTbmU19A8IzTb23lTwgj1m6fRZ8n+eiFlQ=
Date: Thu, 4 Feb 2021 10:40:57 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, James Dingwall
	<james-xen@dingwall.me.uk>
Subject: Re: [PATCH for-4.12 and older] x86/msr: fix handling of
 MSR_IA32_PERF_{STATUS/CTL} (again)
Message-ID: <YBvBKYi5wweq2kms@Air-de-Roger>
References: <1f4a8233-7f7b-dbd9-26f5-69e3eb659fa2@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1f4a8233-7f7b-dbd9-26f5-69e3eb659fa2@suse.com>
X-ClientProxiedBy: PR0P264CA0230.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1e::26) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f4bf03f9-b9c6-48c1-23e3-08d8c8f0fc8f
X-MS-TrafficTypeDiagnostic: DM6PR03MB4972:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB4972E01A04A97200CCD8ACD08FB39@DM6PR03MB4972.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:242;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TSHRYypD2FC91DzgCZfj6IieDPf2tQNSLnKCPMhSlsWUahQJZTywkGuSXICXshp1F7fc6+nKnKsN8FDOn1FMRquNxUF2LnrEbkd6azyhv8RRaywnwNotrregrfMSeB2GqocEP25JsOVLhxKMKFxYJhjr57g70YbhHozsZnD60QPHiunwxFgDaV7jNED4u+bUaSfrB6AAjg73II86bXI+p2JyuTdxJsjBWkRWIY4uog1ihnjCRi6EWuQlzfB94bGfo/3fE0WJCh71NkkrqlVTsyc9Y7ANADgnwfae05OhDnCjsq2ISzvUuXCyvhIgjPumv3rk2f/1sIwo6w7G8F3+azqX0ApCF/RguBfrbgBSRstq+tTSD9/jFdAIA/uhmyO4QznjxMy94hFF9Wabr6o2Hy/gRK0GwOy9CCS7T1FlVy8HqcLgrjyXriVWgbS4kb9TtK5GEa2ZDD34E6a/SDRUFTPBN48YaEHpJElHUMfGAdUyQ4b/mmMTSFF+4g7EvkhT7IQqUBKwb0vceJYHh5sDzg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(346002)(136003)(39860400002)(376002)(366004)(396003)(6916009)(2906002)(6496006)(5660300002)(4326008)(66476007)(26005)(316002)(4744005)(86362001)(956004)(6486002)(54906003)(33716001)(66946007)(85182001)(186003)(478600001)(6666004)(66556008)(8936002)(16526019)(8676002)(9686003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?V2JIYk9GM1VBenBNZHFKS0RtUmRTZEd2SzRqN1VWYVRXNEc5bS92WlVrMXMv?=
 =?utf-8?B?b1BSbVZFYkRvdWlxYXFVVHRqak4vRXBnZWdjVzZEc1oyMGtNbTJCOWFXd3VH?=
 =?utf-8?B?V3oxYVBSanBMSFFpU3ZqclBENHVjOXpSSzlwWmZ5K2FtWFdGNEF3ZzFaSFFV?=
 =?utf-8?B?UDZXWlFzb0lTSUJ5WFRRcjdZWEpQQlpMbXhmeWZNMld5bUd0d3hDZ05lSE82?=
 =?utf-8?B?R3ZLbUxDRGRIQnZ1cmdGNVNubitZL1pGa0xub29HV3Z2cENUdTZDRGo0Rzg1?=
 =?utf-8?B?anFocThmekRtYjljSE9SaWU2dXRMalQrdHA3SndUcFF6OFpLOXgxTWxCS3JP?=
 =?utf-8?B?dlRidWFJb3hpdHJKa1N0KzY1dVhCSEhRVy9SS3N5ZHRvM2NWRkRkODZzU1Rk?=
 =?utf-8?B?WDlVcFRTeHJOa3R3dE1jVFNiZVl4cnc1a0JrbXUzODNTMWRZN3FpeDN4QnpR?=
 =?utf-8?B?bW5aTkRTSDdVbHloZ0YzRXdPRUNwYS9maFVxQ21yQXg4bGk5UTJWTTVIcFRB?=
 =?utf-8?B?dWx1V2VBMUJLdWhUbkROTk5xV0dvYmRlUktmV3FDVmtDa0hMdjZpWWN0RUY3?=
 =?utf-8?B?WWNxbk5tb25VK3dqbDFGNnRBRFNlMVdMdU1pa29BemxGVDlDWWhZcWl1S2ZX?=
 =?utf-8?B?WHRTT3g3V21sSzJKbGxYaWZZbDU2WW5OaElqbWEvbXBLU3cyQmxkZzNRRVli?=
 =?utf-8?B?V2ZsWk0xdlZwd3pDdkJHd0pRdGs0bU81ZDIrSjRKVFpSYmtFdURpR2crRFNk?=
 =?utf-8?B?VHdmZGVUSzFia3ZkU0I4eW1mNVBuR0p2K2l4TTd0YjNzQUFpL0VlQU9NN1hy?=
 =?utf-8?B?bS9HS2ZjRnlnajdUSVBnWU5kR0pNRmxRUXd4M1pCWmhFT0pHK2plK1RjVGt5?=
 =?utf-8?B?WXovWFZjSXFjQmVvMEkxeGQ1eGlobWJyOTUyZVIvNG5oa1R4YlNVNGxuMnN4?=
 =?utf-8?B?NXJSMDQ2MXhNWU43LzZmMjhodm1NRDAreFZrLzZZYkRzOVBvODNsOTA0RVVs?=
 =?utf-8?B?MVo1N2R2aXIrejBHemVLOWlFNzBVTHhKWnArQXV3c2srK1hoN1g4MElmWUFR?=
 =?utf-8?B?bERET2Q0ak9HQkQvdHFyc1FqN3dzaGlCa0RWRzRvamNURXlZay9pc09JVmhU?=
 =?utf-8?B?U2ZCUXFQWFVKT005eEs4WGZRdWJQalMwUmpmTUZ6Q2cyNSt3YzdsMzhRYytI?=
 =?utf-8?B?QXpEcnphUXBmbmtTS0FzU1BrUlExQlFvQ3Jxc1FHeExvTDhqcWZYdFhrMmNM?=
 =?utf-8?B?bGxhbGI4NHF1Q1MxS0lZaUwyT05sSjJjWmUzL3JTMi9oenllZ3ZqbzVrNGFk?=
 =?utf-8?B?QlRubVZpRFhkcThWODFmaFdUd2w5dUswT3F1TzcvazRTSXRwbnJ6clhQUVZI?=
 =?utf-8?B?SnRZNnRjMEgvTGpidUgzTUMwanlmRm5hVlo5R08wWkFBbUplNWtaVGtJWHJE?=
 =?utf-8?B?dDQyVWd3TjZQUitKVUxtWEJBTUlQVlEzVFJmR2I5Z3A0ZjRmaitXRE4yS1g2?=
 =?utf-8?B?OW84MkF4SndxSUY4NzVqcFNUUjUwTGI2RmFxU1dibGFacDFZdTUrS2NtZEl3?=
 =?utf-8?B?M01oY2ljeTAwN040OG1ibDdrSXM5UG85dXBJRnNDOVZEaW81SUdiNytqbFRS?=
 =?utf-8?B?SzFoeGtaNk1ESkluVVkxazBnck1LV0FHbStYc2RGSk1xdmQ5cUdTdjdkc0sy?=
 =?utf-8?B?eUplQk1CNStZRFowcVJqamNwOS8xbkRvSE8xbWp3TTF3Rk1pV0VqK3F0UHhO?=
 =?utf-8?Q?kazKMeaej0h0YitB+5mFQvKR50HC2mTdUQrGhOv?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f4bf03f9-b9c6-48c1-23e3-08d8c8f0fc8f
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2021 09:41:02.9005
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1eFLtiE+FsWFOHUZSCIHLsEuRA2fzP6WzK11NHFc4bHbRxxcSrgC6PO07hCNKhg3PwGanhnIagtnMUWmR+0TRA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4972
X-OriginatorOrg: citrix.com

On Thu, Feb 04, 2021 at 10:36:06AM +0100, Jan Beulich wrote:
> X86_VENDOR_* aren't bit masks in the older trees.
> 
> Reported-by: James Dingwall <james@dingwall.me.uk>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Should this have a set of Fixes tag for the commit hashes on <= 4.12?

Thanks, Roger.

