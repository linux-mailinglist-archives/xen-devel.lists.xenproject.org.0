Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E970D2E7160
	for <lists+xen-devel@lfdr.de>; Tue, 29 Dec 2020 15:30:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.59942.105096 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kuG0y-0004Ak-UV; Tue, 29 Dec 2020 14:30:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 59942.105096; Tue, 29 Dec 2020 14:30:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kuG0y-0004AP-R7; Tue, 29 Dec 2020 14:30:20 +0000
Received: by outflank-mailman (input) for mailman id 59942;
 Tue, 29 Dec 2020 14:30:18 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+dLv=GB=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1kuG0w-0004AE-K9
 for xen-devel@lists.xenproject.org; Tue, 29 Dec 2020 14:30:18 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4e4d34b4-6ac2-420d-9dd5-266e5163737c;
 Tue, 29 Dec 2020 14:30:17 +0000 (UTC)
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
X-Inumbo-ID: 4e4d34b4-6ac2-420d-9dd5-266e5163737c
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1609252217;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=f98emElyreMu1VZJ7shMs6d1SeR7iDsoR6szrCGi3pM=;
  b=Z7DyhK8fnpLECjiYb4BCCz0d72nImuFOcPspmvtGwiAreWN3VISO9VsV
   XODShDhHNAH4Zh0Au0k4OYaracOFAw/5kZZtpQB21DQ3OqAfJ+Pa7T2Ui
   P1ueFV4+pJX7ikOs5bR9wNqdIWEt18V+K3E1YYm0drNGseMv6mcgWhM8N
   8=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: UFs6JzTl5EUxWvmRN1EtCHOxJb9nQ21eGhgqc2iNmBvWVxxPhzTzmZlBzqzyX3ldAiJGlKzdlp
 1BGHTpOnJRsQCTd7ttRgDWuceIHd3ytfFlmqb0f9GAEMRMVBvKzHmPM4/cSyxy2GNm8dBeR59P
 Glwq7gleQNTxNuIi2i8DsHEtINVlIx7mSFoFOXi6G45FSoYCCSc5KAoJ2mLl+p5BZ2OArk1tWH
 eNoSx7YuyLvRppiBeeA5v7/2zl1+9DwjQD+9J1pDVPIepkQdzqWQba6X/DrmEXzgjwhEcCzbLm
 vcA=
X-SBRS: 5.2
X-MesageID: 34092057
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.78,458,1599537600"; 
   d="scan'208";a="34092057"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=giFKgx6bduvXfdtPTmC6NGhWyw8Z0Ruw5Fn7bh16d3fnjHTI3mwMcRHgdLSuoAw6ii+Dyy24onkkpKB+l5HBvqJvRimRH0v7VDAVf1BV7A80SYqFfdsndoslk7w1xwerP4l+ZB6jpQ8HR1Evsz2bpaZzZ14AqRMviwPYFSWWyWic6sbh/J23doIkIjRtH1bzMSzgHupDqSQfVKqsxwyz0ueWm3GGyzbCdU6CInPSzLxM7ZAPZuHwILgM9KudI6qiJ/hj51ixb0I2C96SkOBsUYvu9u77E5CGL1Bv0sOYk5xtKk6Nb+fkIa8+tOBWyXCNX6/43JxvnL1J6KPLNPnBpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f98emElyreMu1VZJ7shMs6d1SeR7iDsoR6szrCGi3pM=;
 b=mSlu05E81vqxkopoFv1FzYiO1CZiKsdGqgRQb7I60pWVj49hBqki2VE2RiP9EitT22LvdEkOVab2EmtuJrSsOrp/ZCJWiwDQWVfHbxdMzVHiqAeGmzFbVYWTypedPUVuC1dSIzbarZYHUyCnCQtMPH/+Hf4I93Zk6f1lIPHXcU4r4lWr0u5r3ZSz9V++Zgrs/VCiVB3/svk5Q38Cb294hnS+WB+HAQLlCWi7BGQMxOJvUptp4QqXJZvUHJiRgzeq7neKZAlGbET6DydACiMxoNXa5YmZTlaCZjOI3j0XKD4OGqdHydRemJpVgX5rY5GPV8hjIQh4GMbcpz+jH3ZzAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f98emElyreMu1VZJ7shMs6d1SeR7iDsoR6szrCGi3pM=;
 b=b9sQtkXoOEFeVIKCHRtRZtFfAS+wpC09gCfJhEAM/S16oMgQDxyzQ/lGRy5Vl4siHUJKUqWWeJYVwiIsktOqm3wopqzuuQBCDXB4HF1hpFN7QS3j6nfm3DYKg266vMQ28iHavJqKPwIEAbGgw5XfLoMtyfPuuCyBzeZvjbnvdHw=
Date: Tue, 29 Dec 2020 15:30:09 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Manuel Bouyer <bouyer@netbsd.org>
CC: <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 18/24] xeneventchn_stubs.c doens't need xen/sys/evtchn.h
 (NetBSD fix)
Message-ID: <20201229143009.tvoidmmmcz6uoe5x@Air-de-Roger>
References: <20201214163623.2127-1-bouyer@netbsd.org>
 <20201214163623.2127-19-bouyer@netbsd.org>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20201214163623.2127-19-bouyer@netbsd.org>
X-ClientProxiedBy: LO2P123CA0054.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1::18) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4b845371-e3bf-4991-3266-08d8ac0641ab
X-MS-TrafficTypeDiagnostic: DM6PR03MB3948:
X-Microsoft-Antispam-PRVS: <DM6PR03MB3948FC3EF352ACAE3DA8F3D38FD80@DM6PR03MB3948.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4941;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6Qqb8FeXyDOczn4G1YabPXkf8KJP+Stu0+WmkTHwj7uBLDtVSBLRP+htwNSEm+L3+eHvkYeGS09Qvc57e3EoaoALRL7rwXr9CNPqXrZfshaT+z+4J7VRPYa8lV4j1WB1kqtPkb4abpsAqkB0rcCS/vV8i4dkC7boBX3H2agW0JIxe6Zt48wpOHPceFlBPrtS2T633VrSSMGjNpO9/b0zkgsLreftxW56umAUxg//wxIO72IdmveASwrLMAtTbO5tkDbmu6u7R/cSfa7QaXfZRQWUYliYvZUDsUepMm9Qv7B631MXD/ekFEc5m12PPrq6Jfub0n9uD5PHdOLgNK/qttFnluldUIIeWOxaqNMtZl1UiXvRmV4WoGn8KjU4daOKeEgjW7HiKsgDaO90xTFkDg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(136003)(346002)(366004)(396003)(376002)(39860400002)(6666004)(66476007)(6486002)(33716001)(478600001)(6496006)(8936002)(26005)(16526019)(6916009)(316002)(956004)(186003)(4326008)(2906002)(1076003)(5660300002)(558084003)(86362001)(9686003)(8676002)(66556008)(85182001)(66946007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?NSt4Vi9VQjhiZVIzTzRWRHVNZTFocHZoS1FDWkVQc3NCZlFMK1hPVlBZN0Js?=
 =?utf-8?B?d1BtdUxRbUd6YXQ2dHRJV3BHNzAxSkEyNGlaS3RwYnYxNHdweENpMnM1RW9p?=
 =?utf-8?B?M2xFRGZ2Mmcvb2lKdFhmb2swOS9CaDdKWGNIeDNZL0pxeDAvam0wczVyVUNp?=
 =?utf-8?B?clFnUzdkTVYvZ1pQcVVDTHBOY0hacWRhelRsZ0tPMmlDM2thdDJaalFlVit4?=
 =?utf-8?B?a2FZVCtDSzQyNkxhTFQ5eUs3eUV3VUJIUUlKV1ZRczh0NG5nY2IxSzJGN2Nu?=
 =?utf-8?B?Z1FuN29UNFhOWHNLV1o1TGZ0anpQRTlJMUZCVCtsZkpZVmNoYzRsMUVvTmVu?=
 =?utf-8?B?MEhUREFzY3VwN0VBbDBFRlFEUXNTYmkxRitiSFY0b3Z5QUQ3UC9nUHlzcG00?=
 =?utf-8?B?aWl1SExYYTFjOWVNcnB3RmJGNFVrM2RMRGg2MFcxWkticndobDl5bG1tQjZQ?=
 =?utf-8?B?cW9Sa29FNm1TemlRZWhoYlpuN2FIUTNrTldCb0Y4ZFRGdy9aUmphbTI2cnhM?=
 =?utf-8?B?VU9jUitEU3JSeUxLZUFESGlzN3JkdlY5OU9Rb203amM0M3hEOXk1Qm9HZVhy?=
 =?utf-8?B?d2gvRGZocEtsd0cxSDBHL2xLSmNQblJXVkVCZVYvbWsyVnE4N0JiTGxYcS9L?=
 =?utf-8?B?TDhVTWNkQkQyN1hLUUxmNjFDZnQ5Rzdib2pVaEFId2Y1enZ0NTFqbnlURjE1?=
 =?utf-8?B?dlcrUm1vWk02cUs4U0gwTEQwR1FHVVZMcVUrZmRKNGdnb2YzcGNSQkU1R1NR?=
 =?utf-8?B?bnVOdnREZG1sRWtGVzc4TU9pdGZtSjk3UmlrQ1RRL0dJcUI5MERKb2lLSnBm?=
 =?utf-8?B?NjFJNUxSQzN1MHpOTlhIMUtIMlRFU3B6VG9rNmQwcnFTZEMvQm4vL3R6ZTVm?=
 =?utf-8?B?YmRyMVNJd2ZRRzgwZTFjV0x1UXdOaDZaQ1VIdHVTaWM1aTkwc3NCQUhBUERI?=
 =?utf-8?B?Rk9hK0RURTVtNGRHYzNOYk84cXNKdFpBWC9DNDZZS0pYWmR1aG0vcDJ2Slc5?=
 =?utf-8?B?dkxxVm9sQzVOOUFvZFNxSkt3eDQ0Q2NMSkxVOW5wSWY0QnNNYXhscGVSV0hY?=
 =?utf-8?B?Zm9kR3dsdnU1Qkhub0w2VGo0dW5kMGE2Wm1DY1FvblB2RFdmWE10R1J1Tis0?=
 =?utf-8?B?elFTSzA2RnJjZGJLWVdKRS9xWWxzV1ZYWmtZRlhzYVFRKzVpdkkva253YjRY?=
 =?utf-8?B?WVhvMENBcFhNcTJGK2xSR1V6bUVkR3NYVXpWVWxGTUtKOWFZMmk0NzRZdnFW?=
 =?utf-8?B?VnUvbzhrQ1B1RWtMMmxIaHlscjErbUhRNHdpYjgzSCtiWTgrcEZiNnlnNlpv?=
 =?utf-8?Q?ubUvuIaS5sAB4qpbK9W4BAul6Ark9U2ebu?=
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Dec 2020 14:30:14.3768
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b845371-e3bf-4991-3266-08d8ac0641ab
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LwFzvtwrcBzhowHtEaSytgdqzQqvipLgN2MG1j21vIMUbYRPa2MToGHvCYXqRouvKpNJUHTmrk7n0JW8pmbKNA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB3948
X-OriginatorOrg: citrix.com

If it builds on other OSes:

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Subject would better be:

tools/evtchn: remove unneeded evtchn.h include

Thanks, Roger.

