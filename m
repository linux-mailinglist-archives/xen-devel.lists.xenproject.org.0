Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A9D7642BE2C
	for <lists+xen-devel@lfdr.de>; Wed, 13 Oct 2021 12:57:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.208225.364275 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mabwi-0006ic-37; Wed, 13 Oct 2021 10:57:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 208225.364275; Wed, 13 Oct 2021 10:57:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mabwh-0006fc-W8; Wed, 13 Oct 2021 10:57:15 +0000
Received: by outflank-mailman (input) for mailman id 208225;
 Wed, 13 Oct 2021 10:57:14 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EFKL=PB=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1mabwf-0006fW-Sv
 for xen-devel@lists.xenproject.org; Wed, 13 Oct 2021 10:57:13 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 51131954-2c14-11ec-816a-12813bfff9fa;
 Wed, 13 Oct 2021 10:57:12 +0000 (UTC)
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
X-Inumbo-ID: 51131954-2c14-11ec-816a-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1634122632;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=jSnIfmTwQlqawmP3GbudmeyDWMWAOIgm5IAeDQ5vZow=;
  b=FfDfwT9hSDTqbDbh5UPZHHVLKEu9ssAjygvrNh32nX4OBRnYAGs5Tht0
   XwHQcRtYZlUfg4F5YAfwQRuvozpsL1GYqD427AY/Ylc39+VCUo6hF8g6m
   kyhj/7PGdxsr9aDPL5QKJnuY/nWS87CCzqbH/UOyvD5d6DNJLeSDntjd8
   c=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 0gDI79CFDBd+4qoRcS9QaPJyk/YbMofaatRAqNVd5oIphtCdsjXcGyhWeLR2TGsWspbXtBqh6O
 f25zGmEqyapmkFf0YOVZgtBo2n8+gJcm6qSxsEoaUJMCdibwgeQi1B+v2T8xfUiZk87OdloJgC
 ofbBbUVzXwmRvV/J0OvIaFLjJkyhbv/CKNsan37jM2W+qye2oGkawotgLYLkQ4TZNavWctWDjI
 vi2wXGqarOq3tNutRNsOr56k5vvfNcRSPnG5d1tDACWTqAgHNQsuhPt4ytEHQ2cacaHQxIGs+d
 3N4S56Xg5ZiPyeo2e/pVKeb4
X-SBRS: 5.1
X-MesageID: 55474993
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:4vOXWq14Y4BbNP4j/vbD5fJ3kn2cJEfYwER7XKvMYLTBsI5bp2ZTx
 msbDTqDPq2JYmD8e90jb9m/8UIEu8fdmoU2HgI6pC1hF35El5HIVI+TRqvS04J+DSFhoGZPt
 Zh2hgzodZhsJpPkS5PE3oHJ9RGQ74nRLlbHILOCan0ZqTNMEn970Es7wrVh2+aEvPDia++zk
 YKqyyHgEAfNNw5cagr4PIra9XuDFNyr0N8plgRWicJj5TcypFFMZH4rHomjLmOQf2VhNrXSq
 9Avbl2O1jixEx8FUrtJm1tgG6EAaua60QOm0hK6V0U+6/TrS+NbPqsTbZIhhUlrZzqhtukg8
 OhprIKLbCwzIoKd38ZCThlKOnQrVUFG0OevzXmXtMWSywvNcmf2wuUoB0YzVWEa0r8pWycUr
 6VecW1TKEDY7w616OvTpu1EnMMsIdOtJIoCknph0SvYHbAtRpWrr6DiuIIEg2th15sm8fD2f
 +o4dzRoMUX5ZzpyKkgKC6kRuO6sryyqG9FfgA3M/vdmi4TJ9yRz2rXwNNveevSRWN5Y2E2fo
 wru4GDREhwcctuFxlKt822urv/CmzvhX4AfH6H+8eRl6HWtwWgUBAwTREGMi/CzgU6jWPpSM
 0URvCEpqMAa71e3R9PwWxm5pn+svRMGXddUVeog52mlyLfQ4gufLngJSHhGctNOnPU/RSEuk
 GSImdzpLTV1tfueTnf13pKVpjO7PW4yN30PYQcNVw5D6N7myKkZgwjTVN9lHOiQh8fsBDDr6
 zmQqW41gLB7pcICyaiT513MhDOo4J/TQWYdzwPbRG/j1hlrdZGsfYWA4ELeq/1HKe6xXlSH+
 XQJhcWaxOQPFo2W0jyARv0XG7Ok7OrDNyfT6WODBLF4qW7roST6O9kNvncufy+FL/roZxfAW
 R7rhCdI+qR2F2G2Qv4wQd2sC9YDmP2I+cveatjYad9HY55UfQCB/T1zaUP4410BgHTAgolkZ
 s/FKZfE4WIyTP09lmLvFrh1PaoDn3hmnQvuqYbHIwNLOFZ0TEWeTqsZKxOwZ+Q94bLsTO79o
 osHaZXiJ/myVoTDjsjrHWw7cQ5iwZsTX8meRylrmgireVUO9IYJUa65/F/ZU9Y595m5b8+Rl
 p1HZmdWyUDkmVrMIhiQZ3ZoZdvHBMgk8SplYXZ0ZwrzhxDPhLpDCo9EKPPbmpF9pYReIQNcF
 aFZK61s/NweItg4x9jtRcak99EzHPharQmPIzCkcFACk21IHGT0FivfVlK3rkEmV3Pv3eNn+
 uHI/l6LEPIrGlU5ZO6LOa3H8r9ElSVE8A6EdxCTeYc7lYSF2NUCFhEdeddue5tSdk6ZmmfDv
 +tUaD9BzdTwT0YO2IChrYiPrpuzEvs4GUxfHmLB6q2xOzWc9W2mqbKsms7RFdwEfG+rqqike
 8tPyPTwbK8OkFpQ6tIuGLd316MuodDoouYCnAhjGXzKaXWtC69hfSbajZUe6PUVy+8LoxayV
 2KO5sJeZeeDNvT6HQNDPwEidOmCi60Zw2GA8fQvLUzmzyZr577bA15KNhyBhXUFfrt4OY8o2
 8k7v8sS51DtgxYmKI/e3CtV636NPjoLVKB+7sMWB4riiwwKzFBeYMODVn+qsc/XM9gVaxskO
 D6ZgqbGlo9w/EuafiphD2XJ0MpcmY8K5EJAwmgdKgnbgdHCnPI2gkFcqGxlUgRPwxxb+OtvI
 Ww3ZVZtLKCD8jo01shOW2egR1NICBGDoxGjzlIIkCvSTlWyV3yLJ2o4YL7f8Ecc+mNaXz5a4
 LDHlzq1DWe0JJn8jnkoREpoi/3/VtggpATNlfeuE9mBA5RnMyHuhbWjZDZQphbqaS/raJYre
 QW+ED5MVJDG
IronPort-HdrOrdr: A9a23:0r8WAKsZT9uI//kFC+CV40F97skD5tV00zEX/kB9WHVpW+SEko
 SVkPMHkSD1gF8qKRcdsPicPaGbW3PV8rp84YxUGbu+VE3Bs3GvKY1+4c/D7lTbak7D38ZB0K
 97aah3D/n5DV0/qcrm6E2ECN4m2tGM7aCvgqP/4h5WLT2CCpsQlzuRbzzwLqQYfmR77PYCeK
 Z0o/A3xQZIGk5nF/hTZENlYwGZnaytqHuOW3dvO/dk0njqsdrC0tDH+najsSs2YndtwawrtU
 fElAL0/by5s/anoyWss1M7v648pOfc
X-IronPort-AV: E=Sophos;i="5.85,370,1624334400"; 
   d="scan'208";a="55474993"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U+f4JKblnrUOGsvn84ggUMOwGMelGJQl9BGpOYPC0nzJ0FRXazy9f6cSHpWEz/nW19sliKjOQoPBR3vULD+aXAF5THKSRZdh5UEKbCZeKWQ0rlZYbJZ2ytYlnLYkP3F4gz/+G/QjjpUixCINLKMaJ3bI4knZCO5J4D7hFs1ErboE38Wtdhfy4f5MLLV0eoYLqg/Z5uYRf29ES4jJKgcKvRi9IERSGvMCsvgSK5620pShRPGN0GSouRzneW/eXzU+cfV1VtAFLO9LQC2YOizT0jvuk/fLv7RiYUXzNAQN3jqolCqBlfAqM0qeAcEzfa532HHWuY474U1z/ATxo1rC3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qvWUaTLlMhlBbjgpRAozt5nGpRv63Sd4mitQamEdmLU=;
 b=Z0VA1xK1qohwFrBaSVvIhsLRYBUbdHO00JuzJlmO+MPEtf8LQuy4+Hd8wACL+8KcUTXyFFuPEemNOGtlXzzAdr/t4x7ZYNRwMhdRVf2z9zzDjOsYOXHbKYjgi4gQgxlIFgwh8AhDjM+sUsKA+xQ7PR/9NYK4C7NA3FrcYLmVoJGnDieV+rCDa9HtlmnU3NHp6MUPDiq8CaiCnzWJ2Tu6iD/jCvSCgnJIGWRvVipiefxNLPOvw+2YEGM3DaguMNI7qXbC50Hi60+0g5pYV8EbOpRA6byJ/FQCcJLxdrJcAVal0lyheHTnX5Ivh5NtomhC2kz/ZBtc8ugUcjHquMC9Kw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qvWUaTLlMhlBbjgpRAozt5nGpRv63Sd4mitQamEdmLU=;
 b=JhFvFM+OGFV/KhmvgB7JxiLx/KJkeDoNfj2ZEhZ1PbnqSu+4TI2V1KW/LskSgUhwwjy2keyhNQorxSgv+Zmd9kMR1uRNjjtG3teYRmsAAdBgXUJZZznOookI/GuA37iuAMT0ATzVCQzMrdxILWfldVzcfuu52q1iCljKe6PPc3Q=
Date: Wed, 13 Oct 2021 12:56:56 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
CC: Michal Orzel <Michal.Orzel@arm.com>, Rahul Singh <Rahul.Singh@arm.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andre
 Przywara <Andre.Przywara@arm.com>, Christian Lindig
	<christian.lindig@citrix.com>, David Scott <dave@recoil.org>, Ian Jackson
	<iwj@xenproject.org>, Wei Liu <wl@xen.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Jan
 Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v5 07/11] xen/domctl: Introduce XEN_DOMCTL_CDF_vpci flag
Message-ID: <YWa7eGr3D8Ax8VUX@MacBook-Air-de-Roger.local>
References: <cover.1633540842.git.rahul.singh@arm.com>
 <20d5b9d6a0d01a7b90711d28cbefb5701a88b438.1633540842.git.rahul.singh@arm.com>
 <YWQDguvmf/O4rDIs@MacBook-Air-de-Roger.local>
 <9217a6b8-fc53-a049-7cd3-7458b574424b@arm.com>
 <YWaZKX44IOfIBtX6@MacBook-Air-de-Roger.local>
 <8F9D6B9C-58CB-4000-995A-95517EE72A3B@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8F9D6B9C-58CB-4000-995A-95517EE72A3B@arm.com>
X-ClientProxiedBy: LO2P123CA0081.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:138::14) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5303ccd0-a81f-4934-9c88-08d98e382eaf
X-MS-TrafficTypeDiagnostic: DM6PR03MB3673:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB367363ABA6F0AB746EF45FD38FB79@DM6PR03MB3673.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +pLKdcKpgynlg0U8OGrsH4s6XHGnrz5lD+3qvE2U/1FMTUdOONhSPGAsM/ZpdlN5YAWyTt7oljF6Zw1GH4xCFbqdmhqsef9ft9gEIdl0xTj/zEQSiv5XOmFEmtomwwZj1xjh11q/MUD4htgpjaYyFCDGwPRSA1kc9Jze0GWY29QVMw0+knMZLGjSVMIZtveuz1Xbdzaghm2aJoO6o1vXAJmJhIuW2BZT+8pi6c+LP9Pt7oMclbr8aHeHtvnGZvXFmZkVVB/n5jv+eQhuFRQUm54kK7xLWIjP/ekHTr/nKaUvTsj0Kw6JWBuiH2ZSBlH/Z746/83n00N6uGbXkGjOqvP/FSMl/ICGvC1SyhxntVfFZzveK1p6TIG/BjWEGWC1Jb0xQxlEuC4Rh0Sd7PC7pthxti2pTnKMsprXY67AUA/Pq5w3eC5rQG9ClBc8hJ59VyCFsYgLE1lyrY8fRzOtP245CuBcEnHEhk5p3O+wxDNEVGV2zLglAdv8rUeINxbDpGv6oauYQLUqPIUUPeeI16vvan92reAT9dD4dfuw7GS3tD6luYAAnBT6L7VmVryHUPFj7iBSExCRbPyqNCl41LejJr9ydySc5vBw2USEFVpBL3Yq6iWtEbYcwju4O5K1uCTwIwaX+4o/nPJulRVG1A==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(2906002)(8676002)(83380400001)(85182001)(53546011)(6666004)(82960400001)(6916009)(8936002)(38100700002)(26005)(7416002)(66946007)(66556008)(4326008)(508600001)(86362001)(5660300002)(316002)(186003)(6496006)(66476007)(6486002)(956004)(54906003)(9686003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YzdNVTZaSkdhcjNrOXVwbzZ3amU0K1htbVozYVh6WGozbXZXOXZYbGtKajhp?=
 =?utf-8?B?ekErZlhrRFJjRk5RL2NxTFl2K2gzNEJoejdPVmd6enpNNkliK2xxVkJibW5q?=
 =?utf-8?B?dXRMaVNIWnAxem1iOFBIOHRDbVh3eExWQ21pL2hJYVdlY1BqTGVZRTIvWVc4?=
 =?utf-8?B?bGdIcmRaTTlpbzFUN0k1ZTYvUXBvUUhCNVJJUUJxNlRaU2lYcldwczZKOFBn?=
 =?utf-8?B?QnRkOFpkblFvMVROMTUyTmljUnNVcUIvamNqVmVsQmVaZ0E3Q2xvZGVaSjlt?=
 =?utf-8?B?c2ZkelBlNVgxUFVOWlVGWXZxdDVtTW1NVWx3UVdQMWpSc3FVbHltZ2dva1hl?=
 =?utf-8?B?SUthS2R1OFJmUUVRS0g1NzI0bGJVdFlOOTdQK2NWSE02SnplMUQ5blZtTU5N?=
 =?utf-8?B?QXI3QmNzVEZqb05VRzlMM1hGRFV2OHBJQjFVNUpJeXhtdjB2K3BSWWxET0dj?=
 =?utf-8?B?V2NDNnVSUTlVUFpOTG9nUXY2ajZpQlNLNk5SUzhGNDdQamd0ZENuRE94YVBH?=
 =?utf-8?B?NGJiVUE4L0lnNzljY0Q0OVh3WFluTHlvbGhSVzU4R2lLR09XOGRxVjVUK0VP?=
 =?utf-8?B?d3lDYUtYeGlSSm1peFhVZ1NaeDJ1RlJqYU5XRWdlQ2NWOEpVNW0xcytnZW16?=
 =?utf-8?B?dGpwTCtGRTlzWU1ra1Bsa0Vsc1pZaVhSelBBN1lRUXUvUTlDb0FpdVRWMG1y?=
 =?utf-8?B?N0hORGFVOVQvb3BQUXZNL0RYcjNBeUZvR1ZreXdPc2VCWWU1QjNzMHVmZjhY?=
 =?utf-8?B?eHluTUJIZ25xRXdHUjdUeERiN082VDBhTGQzTTZXVVBiNzJuSXpjamxqNjZP?=
 =?utf-8?B?UmoydHVHdC9iS0R6dkZRelBTMFpXYldQNHZYcTNJczRJRTdNOG1qd1pFZjdy?=
 =?utf-8?B?TTdHam9qNG1OTGZtUzVwa0F2bGxUa1NCajJMV2RYYTVCMWJDTVdOdmlqS0sz?=
 =?utf-8?B?bGhBMXg1R2hUWUx6RXB1VXcrTFRXMTVIdXJSbW5iYXN4KzhpT2dHRXFSSC9X?=
 =?utf-8?B?ZHkyWVVBNFZFK1JLaXJiSHRjUDNMNUl6Tms5TTFXK1pPSThlNTRsZkZMWUkv?=
 =?utf-8?B?bmZOWEFNeXdYbFI5bzdVcFBIamhBWEhFdkNrN0dhRVJFZFhNb1FRTEdVL0tS?=
 =?utf-8?B?RURoL1N5clUycWpzNzc1cmNEUlhIYmZsNzdnKzJ5UTlJaEozYitiZ3N3MTBy?=
 =?utf-8?B?cTZ3THdEMXd5SG5RNEEyRnVwbUhYNTNPMmw0VXZXeGtqaFBadVdwMUFpWDBr?=
 =?utf-8?B?cS9sa3R1ZEw0VGZvcHpDQWJMUXA2UWpLdk5tUTN6LzI1TUlpd1BFK1k3SThn?=
 =?utf-8?B?T2llc3ROTzF3OGxJUTR1ZGRQRGQydTZCSEdpckNSUnZBSmNGREtnYjdlclU4?=
 =?utf-8?B?NEI1UzFOM2Z2b3QwUzFrQlkyYk5scVlkaC9IcGZpMEpZQUdZbFgwNFcxc01u?=
 =?utf-8?B?M2tnQ2o5WnZRbk5mQm1Ta0pxbkJrWGR1OWl4Wnc1S0oxNDZJVVRsK1dxVE1M?=
 =?utf-8?B?S1J1dHRJVWszTTVKUVluckhVRzFSYjZEeW5DUlN2MjNNZDYxcytMZ3ZSRzB1?=
 =?utf-8?B?TVNDY3F2Zk5MdmNxbnQ2bFZTZjZNRlJLTXUrd2V4eVUzdVR4YVNaZm55SENz?=
 =?utf-8?B?UHhycHVxMWNtZWhEOW9WUkc1NTQrdGlEbUdGN3p1UFFBU0w4RnRsb3pBWGto?=
 =?utf-8?B?OW0vRi9tRTdlZWREOEJCTVN1NzBUUk5yRlJwNjRwZzN3bHhBdHlKNmxOMjA5?=
 =?utf-8?Q?Cqu62ih5Gcv1M7qLZuIcg6G0ukmt+Ke3W5k/eVP?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5303ccd0-a81f-4934-9c88-08d98e382eaf
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2021 10:57:00.3882
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eruS107mmmDiZFtyoHe5OaJyDSLoPGyUHINqXgKhr8q8fLoXJXVLgU1gKbKFvLvtl93mERXI4Xac+pEEKqSFJg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB3673
X-OriginatorOrg: citrix.com

On Wed, Oct 13, 2021 at 09:36:01AM +0000, Bertrand Marquis wrote:
> Hi Roger,
> 
> > On 13 Oct 2021, at 09:30, Roger Pau Monné <roger.pau@citrix.com> wrote:
> > 
> > On Tue, Oct 12, 2021 at 12:38:35PM +0200, Michal Orzel wrote:
> >> Hi Roger,
> >> 
> >> On 11.10.2021 11:27, Roger Pau Monné wrote:
> >>> On Wed, Oct 06, 2021 at 06:40:33PM +0100, Rahul Singh wrote:
> >>>> Introduce XEN_DOMCTL_CDF_vpci flag to enable VPCI support in XEN.
> >>>> Reject the use of this new flag for x86 as VPCI is not supported for
> >>>> DOMU guests for x86.
> >>> 
> >>> I don't like this approach, XEN_DOMCTL_CDF_vpci should be set for x86
> >>> PVH dom0, like we do for any other CDF flags when Xen builds dom0.
> >>> 
> >>> Things like PVH vs PV get translated into CDF flags by create_dom0,
> >>> and processed normally by the sanitise_domain_config logic, vPCI
> >>> should be handled that way.
> >>> 
> >>> Do you think you could see about fixing this?
> >>> 
> >>> Thanks, Roger.
> >>> 
> >> 
> >> I have one question about this fix.
> >> If I set XEN_DOMCTL_CDF_vpci for dom0 pvh in create_dom0, then in
> >> sanitise_domain_config or arch_sanitise_domain_config I have no
> >> knowledge on whether I am dom0 or not. I can check if I'm PVH but not if dom0.
> >> This would be needed to add a warning if this flag is set but we are not dom0 pvh.
> >> 
> >> Any ideas?
> > 
> > I've just realized this is more wrong that I thought. vPCI is
> > signaled on x86 in xen_arch_domainconfig.emulation_flags, so
> > introducing a top level option for it without removing the arch
> > specific one is wrong, as then on x86 we have a duplicated option.
> > 
> > Then I'm also not sure whether we want to move it from
> > emulation_flags, it seems like the more natural place for it to live
> > on x86.
> > 
> > If we really want to make vPCI a CDF option we must deal with the
> > removal of XEN_X86_EMU_VPCI, or else you could introduce an arch
> > specific flag for vPCI on Arm.
> 
> First issue that we have here is that there is no emulation_flags right now on arm.

You don't explicitly need an emulation_flags field, you could add a
uint8_t vpci or some such to xen_arch_domainconfig for Arm if you
don't think there's a need to select more emulation. That's up to Arm
folks.

> So I think there are 2 solutions:
> 
> - introduce PHYSCAP. The problem here is that it is not a physical capacity and
> I think that will hit us in the future for example if we want to use vpci for VIRTIO
> even if there is not physical PCI on the platform.

Hm, PHYSCAP is a bit weird, for example Xen signals shadow paging
support using PHYSCAP which doesn't depend on any hardware feature.

I think you could signal vPCI regardless of whether the underlying
platform has PCI devices or not, as vPCI is purely a software
component.

Regarding VirtIO, won't it be implemented using ioreqs in user-space,
and thus won't depend on vPCI?

> - introduce an emulation flag on arm. The problem here is that there is no emulation
> flag right now on arm so adding this feature will require a change of interface in
> arch-arm.h and in xen domctl interface. But if we introduce one on Arm, it would allow
> the tools to check if CDF_vpci can be set or not which would solve current issues.

I'm not sure I follow. If we go the emulation flags route this will all
be set in xen_arch_domainconfig, and CDF_vpci will completely go away.

> I think the second solution is the right one but it cannot be done so near from the
> feature freeze.
> 
> The CDF flag as introduced right now is not creating any issue and will be used once
> the emulation flag will be introduce. We will be able at this stage to set this properly
> also on x86 (for dom0 pvh).
> Moreover keeping it will allow to continue to merge the remaining part of the PCI
> passthrough which are otherwise not possible to be done as they are dependent on this flag.
> 
> Can we agree on keep the DOMCTL_CDF_vpci flag and introduce the emulation
> flag on Arm after 4.16 release ?

If vPCI for Arm on 4.16 is not going to be functional, why so much
pressure in pushing those patches so fast? I understand the need to
remove stuff from the queue, but I don't think it's worth the cost of
introducing a broken interface deliberately on a release.

I think we need to at least settle on whether we want to keep
CDF_vpci or use an arch specific signal mechanism in order to decide
what to do regarding the release.

Thanks, Roger.

