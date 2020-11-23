Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 56FA12C0FBA
	for <lists+xen-devel@lfdr.de>; Mon, 23 Nov 2020 17:10:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.34798.66031 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khEPs-0005JP-6c; Mon, 23 Nov 2020 16:10:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 34798.66031; Mon, 23 Nov 2020 16:10:12 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khEPs-0005Iz-26; Mon, 23 Nov 2020 16:10:12 +0000
Received: by outflank-mailman (input) for mailman id 34798;
 Mon, 23 Nov 2020 16:10:10 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/SOx=E5=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1khEPq-0005Iu-7I
 for xen-devel@lists.xenproject.org; Mon, 23 Nov 2020 16:10:10 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2777f2bc-c262-4b61-95c4-94fb0909ce57;
 Mon, 23 Nov 2020 16:10:09 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=/SOx=E5=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
	id 1khEPq-0005Iu-7I
	for xen-devel@lists.xenproject.org; Mon, 23 Nov 2020 16:10:10 +0000
X-Inumbo-ID: 2777f2bc-c262-4b61-95c4-94fb0909ce57
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 2777f2bc-c262-4b61-95c4-94fb0909ce57;
	Mon, 23 Nov 2020 16:10:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1606147808;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=ryx6tvbDSn4Pgt6hgVpjI4WmhMm0V87W8eAjRkqQYCs=;
  b=S4BIQiI0SLcFSbybwnY3QkUb8QwiE4iocJ0U0oEl0i2em9kHpTAey7UM
   WoTQYCP+8zGwAymiYGBWORxAiaUEsiGGFoJMMGPZMDf1vuJpkKHHSxboZ
   str9ZQHOhgX1AxQEIsZ5Cnq3qKe/RGibbAn5OSsog1SZRhhl6xEtU9BIY
   4=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 7sNxluc5xYVLmZVFvE4hP3uLIWy513TgFvZpPa8Nwg2lPu0wwSHdkW237ndP6ARk/R/i2oIG2F
 ZD5kNUjM5g8JR97a+AF4GEr0jKaPShUrSHqdS8VojpFGZIolEyCLpFY5QOWEQG08HJ52SZRy56
 p/vmiOxhKJLo8Wj5LKPGRjC2xoUAPcukncPvZo81zkduRo92/sMZy11IxK9peNOUI79/VlL7MV
 E4aLp20PoQWh93tZFX64Wq2J58e+biCaiSx6v5gHujcGIHAuVPX+pwcJ+elZGX4m8Adg13IYNS
 ijc=
X-SBRS: None
X-MesageID: 32100465
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.78,363,1599537600"; 
   d="scan'208";a="32100465"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hK7DVLoiZTYgE3lc1DvHIQDCXa7EBYx1yBDu/5gigFnk9dmgXAeh7Fbag9G3vlDdvjYc0Q8lKLsmqUBrHYEm/D419sujG0MNWEA7MF5k0UdKmnTpDESKs3fKdRVcDrhXIkj1GEuGDTQbB+qiZP6PCElOklGTrQnUQIaLlkSUWTxW0F74OOjjgo/fjGkWYMalxYFo6xS9pQDiyyo/32YCv0ZyPLhfZpQVJ+nwJdBWKjoIpVc3/HGOyD10dq6VX5qpfRpTxxu5e99N4Y3ysg5KmdRZGby3jz+3rH5SnEeTTX4beceSPmS1fjt8YKBMqJkHjDcD8bZhPTUp6+oggz9s+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6L+vGl7XkwkUhbmdK7E3v/6ATjVKN0IXMowwJC+cO5Y=;
 b=bKcLNyLMw93L07b+OP1Vek+qn86UwazYsXqcIlBGXog3Pg7UcFrg77cinSMN0Bm9MxdvZd8JRkfE+45Omjt1CUZiRUYhIAUv7F/dPuQ9WTbpCrqoZQdpNyZ5czaPet8kJMwIgzzL1FktXyW8r1utcsXe7gNpahVBYXBSHwtuGOe/WNUilOuIvo8TlGhQ1mIhPGcOtuY0IdXWcRohyiljwHjN1QbZ73qBzsi3MdbBVVHoycjw9CFNM02hz4MYTT3C6AejQ4jmeAPtJLLJMMEgPwIOmmlHz72Vadb/d6+7WOI7BA7G6OJhAXYFpOGth/UqJHkbRqZTrvqc/bnAOmIvMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6L+vGl7XkwkUhbmdK7E3v/6ATjVKN0IXMowwJC+cO5Y=;
 b=Z05cBux0nN91VoFf0/t1nfRtlcLaKBfsjK8e+o26/j2V1IviR6qmCLvPFeR7BVBCn5NTumiI0GX2OERGVmXC608dXKkGsaIh1QAMhl4QVWasX1bIJknlN7mAOZ5wZtpGWCyxN70DBy/nWU7Ho7t/UBjQ5uVCRRsy3xgwOgUYoMA=
Date: Mon, 23 Nov 2020 17:09:43 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: George Dunlap <george.dunlap@citrix.com>
CC: <xen-devel@lists.xenproject.org>, Ian Jackson <ian.jackson@citrix.com>,
	Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<jbeulich@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, "Julien
 Grall" <julien@xen.org>, Paul Durrant <paul@xen.org>
Subject: Re: [PATCH] MAINTINERS: Propose Ian Jackson as new release manager
Message-ID: <20201123160943.heq6jwcofvauwfjs@Air-de-Roger>
References: <20201123160400.1273386-1-george.dunlap@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20201123160400.1273386-1-george.dunlap@citrix.com>
X-ClientProxiedBy: LO2P123CA0090.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:138::23) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 95ab9a56-5a7e-4abc-5eb7-08d88fca33d2
X-MS-TrafficTypeDiagnostic: DM5PR03MB3369:
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR03MB3369332CB1E4BF2E6AFEB1EA8FFC0@DM5PR03MB3369.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BL9hnLG9JpcPP8hx8R4NB7prPqvFLOUNjwBK/E4cdCCbl4+yqVdLl328RZOOdepJwzl/ROsa383cO86sCQn6xdVPW6/qGqgQHeh/Ux2WQThjK12w96Fll5xWXZA6HO/DLpNDBnD3bBi7Xi7y2N15odHk78jTu7j0duoOsto9f6g7EwHWPjOHwPAY5+jOL741kkIr2glrDqLJFzQBeStQtDFeH3y4eKhyZ+SiJ2B76jdrlM8GCPREzuqq/2MoflFBwPSiLsmIKfSN6NS6hgdIMoYPLctEph0eD659f9UZrn82dLAb+eBat82mdRKSAgBfnfn5UpieX7CUEOj8UOlxGA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(396003)(376002)(346002)(39860400002)(136003)(366004)(66476007)(66556008)(86362001)(83380400001)(4326008)(8676002)(6496006)(5660300002)(6636002)(8936002)(54906003)(6486002)(2906002)(6862004)(316002)(85182001)(9686003)(6666004)(33716001)(66946007)(26005)(956004)(16526019)(186003)(4744005)(478600001)(1076003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 0qAgL1S2V/HjUEaKccXj6rgy5d50ihTyeH88HC+KIVrJSvWzuaD+KIyG965WcSzAppuzBSj+uliFWxzO9Gg7GUYTYD09JQ9UVCzsUpHnwo6+JoCxFNeJqveQxu/Eq4ZvSG6+3/RwKBxchjnMiH8YZkaNdhoflV8w1qySysVjwBvdu1zsVruW25LM5PywNztGniHzbOSCsS7W/iuokekyPF579RywOjEVyCasKin7sJUGD9FTVhF9dvlE01fojPwjZzsTiVF79O+NyVJ5H+WcDoIHH7avzHLoBizDLs+xxe7Iva2MlKAJjnjDk48VRzYiKa+FHp4/38naVYzhJJ3qPxYNS9SComF7OPmvP5DSq3elydb6n3hTQYIHqWFtGW6lHTGA2OFstnQ5/CpW2G0Bp8Zr4lBpzI7kyKE1Ygl3nyZwQg7qtlD0D+DzboPB2A2E1EzCZgpog0LHgE8S/JAp99MeGsJNnjAYe7bGFbWdHtHRXiiygZKH74D4kt6g8HqIrzWNeJXykt2d9iFNwintj1aMElHpwakIBsqADlJtl31xk5pudXh3rhKVfqqu60MnNVkzOHAGfmGNxA+H+BnyPRRLrxvhaW0qVdbVW68JpgOpwtzGD0xRVHiQyWskjTIvOwEDRRREwwMGyDfOOKoteSrPUSXm1W+SOuUQLSUyANs7nTN4LIvOBDr+y1Ev34Yjmse++vXPiWlQHX5p/kVtiIE95y+WljpwAiaMAqZgPx5yM6uwA4lgC69b/xfYdE8EI6X4ABe3MbNawbXp57iDPRSgRewDtrhiaj8vG8udEjRenC0Zp+tyOhttvJiQdWyTxAcGSXfCzvHxv6DVEF9Id6JOjuCP4oiagpv+5R+/xF2YmJL9fes7eBcQc2umuu07HGglL3hOY9cS6MiI66ldEA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 95ab9a56-5a7e-4abc-5eb7-08d88fca33d2
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2020 16:09:48.9690
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: K7AIEjILeKO6fPhK44+JfJRZEzBsxz2egKgGcEh49IksBSscFrMfSmEWuxcAKN9FqPHo6VyQcW1455dfgCIDTg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB3369
X-OriginatorOrg: citrix.com

On Mon, Nov 23, 2020 at 04:04:00PM +0000, George Dunlap wrote:
> Ian Jackson has agreed to be the release manager for 4.15.  Signify
> this by giving him maintainership over CHANGELOG.md.
> 
> Signed-off-by: George Dunlap <george.dunlap@citrix.com>

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Congratulations!

