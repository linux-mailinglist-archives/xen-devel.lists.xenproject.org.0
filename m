Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B60565214E3
	for <lists+xen-devel@lfdr.de>; Tue, 10 May 2022 14:10:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.325571.548197 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1noOhI-0002ph-1X; Tue, 10 May 2022 12:10:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 325571.548197; Tue, 10 May 2022 12:10:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1noOhH-0002nJ-UE; Tue, 10 May 2022 12:10:35 +0000
Received: by outflank-mailman (input) for mailman id 325571;
 Tue, 10 May 2022 12:10:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JkLT=VS=citrix.com=prvs=122513738=lin.liu@srs-se1.protection.inumbo.net>)
 id 1noOhG-0002nD-4r
 for xen-devel@lists.xenproject.org; Tue, 10 May 2022 12:10:34 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2f7dda66-d05a-11ec-8fc4-03012f2f19d4;
 Tue, 10 May 2022 14:10:31 +0200 (CEST)
Received: from mail-mw2nam08lp2177.outbound.protection.outlook.com (HELO
 NAM04-MW2-obe.outbound.protection.outlook.com) ([104.47.73.177])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 10 May 2022 08:10:28 -0400
Received: from SJ0PR03MB5405.namprd03.prod.outlook.com (2603:10b6:a03:286::9)
 by DM5PR03MB3115.namprd03.prod.outlook.com (2603:10b6:4:40::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.20; Tue, 10 May
 2022 12:10:26 +0000
Received: from SJ0PR03MB5405.namprd03.prod.outlook.com
 ([fe80::6821:288d:5d32:98e7]) by SJ0PR03MB5405.namprd03.prod.outlook.com
 ([fe80::6821:288d:5d32:98e7%7]) with mapi id 15.20.5206.027; Tue, 10 May 2022
 12:10:26 +0000
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
X-Inumbo-ID: 2f7dda66-d05a-11ec-8fc4-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1652184631;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:mime-version;
  bh=bpdndaNXXSm1m9Cwda7xV13DUgIUQRz8cTzD5WdQI8s=;
  b=JASDHEiymKf/P8h+nMe6/eohRHAcwoMP12qMonilSG2xZL3GqMS1QJ6H
   PpvNqqK0pJgqk+S2uqUks+ds5tU4eHb2X29EQTuI3VcCn/6X7mwPW6/Hd
   AzOUOj9MqsxyhPblASFETAWqC9bFs9h1zp/ZGRNmCAdbDm27We8sgWv5c
   c=;
X-IronPort-RemoteIP: 104.47.73.177
X-IronPort-MID: 71373732
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:AaKl/KjOypke1SvRwQtLkLNWX161qBEKZh0ujC45NGQN5FlHY01je
 htvUD3VOayIMzP1fIwlbIq0o0pQvZKGxtEySVE9rytgEiMb9cadCdqndUqhZCn6wu8v7a5EA
 2fyTvGacajYm1eF/k/F3oDJ9CU6jefSLlbFILas1hpZHGeIcw98z0M68wIFqtQw24LhXlrV4
 YmaT/D3YzdJ5RYlagr41IrbwP9flKyaVOQw5wFWiVhj5TcyplFNZH4tDfjZw0jQG+G4KtWSV
 efbpIxVy0uCl/sb5nFJpZ6gGqECaua60QFjERO6UYD66vRJjnRaPqrWqJPwwKqY4tmEt4kZ9
 TlDiXC/YQd4Z53W3+00aTJjTHh9Lath4ZbpHmfq5KR/z2WeG5ft69NHKRlqeKgnoKNwC2wI8
 uEEIjcQaBzFn/ix3L+wVuhrgIIkMdXvO4Qc/HpnyFk1D95/GcyFH/qMuoQehWhv7ixNNa+2i
 84xbTtpKhDBfjVEO0sNCYJ4l+Ct7pX6W2IB8w3O+vFti4TV5F1Q4J/yYeuOQMPJZdh0s2iR5
 UvMzU2sV3n2M/Tak1Jp6EmEhPLLnC79cJIfEvu/7PECqE2ewCkfBQMbUXO/oOKlkQiuVtRHM
 UsW9yEy668o+ySDVcLhVhe1pHqFuB80WNdKFeA+rgaXxcL86QuDGnINSDIHbdU8rdI3XhQjz
 FrPlNTsbRRRt7mSRWOY562jhzq4MigILkcPfSYBCwAC5rHLoos+kxbORdZLC7Oug5v+HjSY6
 y+OhDgzgfMUl8Fj6kmg1VXOgjbpo4eTSAcwvlXTRjj8sVw/Y5O5bYu171Sd9exHMIuSUliGu
 j4DhtSa6+cNS5qKkURhXdkwIV1g3N7dWBW0vLKlN8BJG+iFk5J7Qb1t3Q==
IronPort-HdrOrdr: A9a23:UcR9cK+ELgkxq9lSyR1uk+Ftdb1zdoMgy1knxilNoENuH/Bwxv
 rFoB1E73TJYW4qKQodcdDpAtjifZquz+8O3WBxB8bpYOCCggeVxe5ZnOzfKlHbehEWs9QtrZ
 uIEJIOReEYb2IK6/oSiTPQe7lP/DDEytHQuQ609QYOcegeUdAF0+4PMHf/LqQZfml7LKt8MK
 DZyttMpjKmd3hSRN+8HGM5U+/KoMCOvI76YDYdbiRXpzWmvHeN0vrXAhKY1hARX3dk2rE561
 XIlAT/++GKr+y78BnBzGXehq4m1ucJi+EzRfBkuPJlaQkEuTzYJriJnIfy+QzdldvfqGrCVu
 O85yvIcf4DrE85NVvF3CcFkzOQrArGrUWShWNwyEGT3vDRVXY0DdFMipledQac4008vMtk2K
 YOxG6BsYFLZCmw1RgVyuK4IC2CrHDE10bKUNRj/EB3QM8bcvtcvIYf9ERaHNMJGz/78pkuFK
 1rANvH7PhbfFuGZzSB11Mfi+CETzA2BFOLU0ICssua33xfm2141VIRwIgakm0b/JwwRpFY76
 DPM7hulrtJUsgKBJgNTNspUI+yECjAUBjMOGWdLRDuE7wGIWvEr9rt7LA89IiRCeg1JVsJ6e
 H8uX9jxB8PkhjVeLOzNbVwg2DwaXT4WyjxwcdD4JU8sqHgRdPQQF++dGw=
X-IronPort-AV: E=Sophos;i="5.91,214,1647316800"; 
   d="scan'208,217";a="71373732"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=juRWu/OIiMwGb2kOYrN/OSp0qwuFFDZuF6y6uQQCFT/SBDRJaD0jeuyXs1UpP8lM38m2FXFxO7JQd/Q0gBCueXLTfnsnecYC6x1KYpAPiXgGqtvZzp6XhoG+Rt7nBPmIU4sEHBNNAjVHHX5Ypsmb7Xvr3QMJoajkOQFO830IEdoySoAe5RYpvbM/xNMlTMwyT6HfaGUN6tY3a+F5ENie2unngjpS6n0y/wjgLTDTdIEOwh77iBT3kbkPFrqqrtS7RVXn4Q5qds4vzw5PvspuKBjCbHBLbgfJ22LJgcHtUwl0QfAFXJSRBO1GyVi7ki0VQzN/QR8VNrSLSvqxJ43urg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PFKuD9etltBqEaM+5XMhtGOpO/FTPxSZggd8NgZ9YC8=;
 b=ZE61uJIRHrvuhBGpVdEE7zr1JKeCoUGwt/0HLzQ9EP2OnP/HuAtWfJG1wB4cV2ri1Ckn8xu2wz8jp3wEyPwARjoUqdRbQ87W2leaDPnaG0GQaVHHjYBU0UVQGPRSdLhQkg1gEmEl9IQcd63AqFNdV/NOTqihbbaFBfNQQSUS6KI2LIv5E8XhN5nwYZ2SAyZVG6BpcbEpJ8Axv12CTyr02SexiQFKWd1rNKdFF7I7YRrQN0ZDjQQOOeHpCzHKPE8txSH+v7a4y+mEl7Os1nlPY5MgjuvJITr4rQBgfMNsoEnV6/HFpIA2nqmcR9ohA/X968rdwlk746Rac+zy0UfuIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PFKuD9etltBqEaM+5XMhtGOpO/FTPxSZggd8NgZ9YC8=;
 b=KrPYy1qRFrjZ+w5x/7QwRBX2moDBIR1XX3OND8amKb82Y07BcXq3+KZumfF78+0WfAvH5tqmIMOO5ECaauK9oHpjO+8i6Icb3oEpsIQXJNz1OokaM/gPEP+PYCxoRytoXWDg8Fa4Fq3YLSHvvf83xVeWOfjFeLw2d0mxHrUZf/k=
From: =?gb2312?B?TGluIExpdSCjqMH1wdajqQ==?= <lin.liu@citrix.com>
To: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <Andrew.Cooper3@citrix.com>, George Dunlap
	<George.Dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, Wei Liu
	<wl@xen.org>, Roger Pau Monne <roger.pau@citrix.com>
Subject: Re: [PATCH v3 1/6] xen: implement byteswap
Thread-Topic: [PATCH v3 1/6] xen: implement byteswap
Thread-Index: AQHYZFb0Ik5G7uZNNE+lQn3ZaONJQ60X9FWAgAAQFI4=
Date: Tue, 10 May 2022 12:10:26 +0000
Message-ID:
 <SJ0PR03MB540509C0FCD040A3680DE3799DC99@SJ0PR03MB5405.namprd03.prod.outlook.com>
References: <cover.1652170719.git.lin.liu@citrix.com>
 <2699787cd4ba1d71448bbcdf190d927e180e80b9.1652170719.git.lin.liu@citrix.com>
 <11269227-ba07-b2b1-c2ef-ea6309980f67@xen.org>
In-Reply-To: <11269227-ba07-b2b1-c2ef-ea6309980f67@xen.org>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a5c6abe2-8cff-4b21-fbc6-08da327e1154
x-ms-traffictypediagnostic: DM5PR03MB3115:EE_
x-microsoft-antispam-prvs:
 <DM5PR03MB3115749091ABF53DB3B2F0439DC99@DM5PR03MB3115.namprd03.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 2ohLYqYNihmOc8Jz9TWQ+sbJhMIptKYOqdSsJunq61FGgJF2WYFwxaPNKqLF7PCgJz/nUnXEn+pJ/s0/SxU2L693onIoGSZLbqfSSdiTicFPbIFv1oeHaCM2/PPv8gAWJS0OEuW+fIj/6qfqa6D7u0095xu0XMzVd+7sm35AV13QBOec3y0xeXJRSfOA+YH+7pgshehBmgYiGPDQ89suY1XIH2+KMlbcsqqtA9/arsCso17rq1pbMhSidETyhwylNv/MsIsWfRiugK6sWD1zY5hbNYO9wsFs3C4Wa54XweTLm8jj+MRcxdjUKNhFOm0AnfZbHnRNp5WP4ao6eucjSpi5+vtkKHKVJq84qLJtTWLjRulKp6i9Z7OUXDlaFprm89X4AXwnbyYDcyPla+a49QY4U0+2Z3KAoxWWHP+/Ger0BP6dp6S8pCKTuoAMyHjnTkGSf64iUjMTwa2ICkvL5zG/qh13o/nOIhFydurHyp5xbMjvnITsFvSBlEJlk0U/OFBiMW3L0C25eggfm5EUuPML0qC9r9Ht6cKjZW+sVw3LQeW4Lgr2fpqKbMmSQNSbuPlIZUh0z1YjHjnWLoy7G0WJH864xGeGN1H8nbBfmwaLZ9heAunrbdbEejUN5LJ1kHRbatq+7eemZmkHJtT3Y3DGOXgX+yvgbXPDci2g//S7If8/S9Riz9CFDzyhbkySwkCZShXAW3nMQIJnO0/rtVuGcVNkMXKeia3aBglaEGDwC2nnb90fJwnSNscGk0zPq8jfTME1dn3uCKQ89McokDdxL8d0FIUoJGlCrwV8WVk=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB5405.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(508600001)(38100700002)(2906002)(76116006)(91956017)(8676002)(66556008)(5660300002)(55016003)(33656002)(85182001)(186003)(83380400001)(966005)(52536014)(110136005)(8936002)(316002)(64756008)(66446008)(4326008)(66476007)(107886003)(54906003)(66946007)(86362001)(38070700005)(26005)(166002)(7696005)(71200400001)(122000001)(9686003)(45080400002)(6506007)(82960400001)(53546011);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?gb2312?B?SlFIcDdIMW51QzZDUEs1RWd3eDlnM0JtM1ovdm9BNXVmYXZhM3hoQis4Uk1m?=
 =?gb2312?B?T2I2M2JUZWtjOUZaNUFoWlZuWldFSHFtb1dtWk8xRmV5dEN0RXN5UlozTmN5?=
 =?gb2312?B?Z1N2MGw3RnFFdnVNZXE3OWhHTGo5NXA2NkZkY2FsS2tQdVIvQWtKOUMzdENl?=
 =?gb2312?B?OWZsYndlcFRCeWxnZXRaNi9MbFBYZGhlTkViYzQ3bWh3QVpvZ3FZejhadUpE?=
 =?gb2312?B?UzJmWDZqK0ROeUlQaWJudzB3Zk9NcGxQaUR0Tm52KzgrK0xLbUxndkUzVlFz?=
 =?gb2312?B?aDUyYi9jdFR3T3BRU1lmRUdWUGNTRDl5YjBLTlhlVld6ejlSb3o0MzhoYmtG?=
 =?gb2312?B?ZXl2YkE1K29ld0xuNlo2cXpoKzZVaGFDbmhvSGFoc1hUbnJoRTNuWU00ZVpV?=
 =?gb2312?B?UEd6MHBvSTdBd2tMSTJSbStFY2VCc2JWNGd6Z296L0IxRGVtLytEVzJiYjdO?=
 =?gb2312?B?WkVGeGlIcGRpWnVrSk5YdnhZTUpkZGh2K3JVUjNwQlp1VTBOTkRISmpkcHNr?=
 =?gb2312?B?OW52SHpZZGEva2F4L3Nmbk9mMzVFRy9QemE2T3BaSTdJa3NERncvVDcrb3Rr?=
 =?gb2312?B?UWJNTm1wdTNPZFFZNTV6WXR6MXI1c3BKckd1NlBYVjlFUjI5L3kwalV3QSti?=
 =?gb2312?B?eVU4eEFiT0lpWDIxVDhGcnp0S0QzSm4yd2czRlhINWRDNnMvMWhUMkt5Ylg4?=
 =?gb2312?B?dys5aERhUEp2TytWUVBWSHZ3Z0grVDNXVEpGc1RIK3FrV01BWkZseU5HVnVk?=
 =?gb2312?B?T0xrbHR6Zm5tTmdHRzFiMGZqMmFsRjk1ekFPTUR3TkZGK3lZS1JzeGprR1lz?=
 =?gb2312?B?ajdwYWMyOTRHbXBOeE5wcFdYbTJQWUZ2WmFBWW00Wm5iSFoyRHhERjE1b3No?=
 =?gb2312?B?aDU5SU5lVmFzR1BpeHIwU0V2cStpNlc3WGNpdXpTb3ZCcGUwdEhRbXBQWlFw?=
 =?gb2312?B?SVU3NVFjUTZ0eGw1U2VPY01BVDJCSXRGbWc3NzdlQlRYWnIxMHdITFd1U1ZH?=
 =?gb2312?B?Wk9yQXlQM1Nlb1NqakRqcHpvdmcwQnBzNDAvMSs5cWRwZ2c3NkhYdzI2QThV?=
 =?gb2312?B?VFVjZVJEek4xUVdHSHNuaExQZEtJZ3FyUGw4MTBIeDVKQlEybU5XMlliNk1k?=
 =?gb2312?B?cDB3b1Q4cHVKeVN6RzZhSld4MmFMend1aUNXcWtZbStuL3k1MEJjQUhXditw?=
 =?gb2312?B?Vkt6dzBMd1pzVGFJcTBiNGRJRFM4MUZ4Mk9MTGJFZWxlNFhQOFcyZ3JDZVds?=
 =?gb2312?B?dGxOSFdPK3lZMmF3Ums1VENIaUYxam8rak1KKzQ4QjVyZGNDeGVxVzVWQXg2?=
 =?gb2312?B?aTMwbFRBVWxjMURkdi8vSncxc2hpTkZCdEtIL2xEeStMcjlpMzV2ckZRdHFr?=
 =?gb2312?B?MzRFVWdoeDk3bkYyK3JjYnZuRHdSbkNoVENYSVh6Q3g0dnh3WEZieTFDL0FU?=
 =?gb2312?B?Yk15Tkx2TVc4dDZMM1BLNGtXYnpNM1ZiTHI3THR4b1lONzNlNVFMYnhOLzBY?=
 =?gb2312?B?YWJNRERSMmIybGRiMWpTN0lWTVJ3ekE1c2RsNFJuNU9WRFRWUS9zN250WENW?=
 =?gb2312?B?T0lnTHJXUDYzcTQ3STVndTBFUm9Gc01BUDF0c1hBSW82NjZubTF3WUIxYnF4?=
 =?gb2312?B?N0JnZnVlbWZ4SS9lcldicHJVa2Rsckx1ZXhWYnM4YjhLbk12QjN0NFFJVUN3?=
 =?gb2312?B?cWxPZDBKejQxeHFNU0hMekNIMjVkTzJkNnZRRTRJOXpmeU5qdDFRUWgrdDQ5?=
 =?gb2312?B?WkVOWVpEb3lSL08wN1RVd21ieG5VWlRUSThJdEJpYzh1UWV0R3RMNXR0VVVT?=
 =?gb2312?B?LytuVU5ZVVNzbmlVMm9Lb2NHRGN0U1FRa01VUjJsaFl6ZWV1MStXUHlxR1E0?=
 =?gb2312?B?eitOVVVjVWRScVRSU1JOMWZXcG8vMFd1bDZ0RjV5U3h5aU15QWl6R0VDNFk1?=
 =?gb2312?B?MmN4V0F2N29mTnlFc2NqS2pZdXF0OVBYWU53ZnZOY2FDUFlOQyszUmoyaXly?=
 =?gb2312?B?VHdDb3dsRTVlSzk3cXJvOW15U2REeThXL1cwaHZqZkd4bDZVbUZYRTVMY1Ew?=
 =?gb2312?B?THBuYzJZSkUreTVacFhHQ3Jhdnh2dTRSa3ZnMVRGMjZiS2ZjUGJkWkc3WDFy?=
 =?gb2312?B?ME5IVUFGVGhzWXZzUXN5WWhzMkpRR2locGxLME1lRkdDU3BMQVhCOU0zQzB0?=
 =?gb2312?B?ZEpmYVZ5eDI2c1QvVi9Ya1ZOZFpZbDhZb2tQUjBKRG5VKzRqa2p3V25aNzdw?=
 =?gb2312?B?Z2FKb3h6YnAxbTE5WWVFVE56VmdNTzVYd0RMekhYWnRIWldCdnpqOEhZcSts?=
 =?gb2312?B?L3dKMDhWOVZPVmticGcyR2Z0aGFkcXR1NTNtRkw5b1cvRWJTbHk5S1llYkZz?=
 =?gb2312?Q?T23aih4JvYjR9lsQ=3D?=
Content-Type: multipart/alternative;
	boundary="_000_SJ0PR03MB540509C0FCD040A3680DE3799DC99SJ0PR03MB5405namp_"
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB5405.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a5c6abe2-8cff-4b21-fbc6-08da327e1154
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 May 2022 12:10:26.3928
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: D/VC5FPmAs/AUy97W99yUbc4rdK8g0Qf+LYrhO8lzbpL5LMQ1gVfYjqUVEhZfu9UWYarZWla/hqUuT6/0QZ+cw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB3115

--_000_SJ0PR03MB540509C0FCD040A3680DE3799DC99SJ0PR03MB5405namp_
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64

SGksDQoNCk9uIDEwLzA1LzIwMjIgMTE6MTUsIExpbiBMaXUgd3JvdGU6DQo+IHN3YWIoKSBpcyBt
YXNzaXZlbHkgb3ZlciBjb21wbGljYXRlZCBhbmQgY2FuIGJlIHNpbXBsaWZpZWQgYnkgYnVpbHRp
bnMuDQoNCk5JVDogImJ5IGJ1aWx0aW5zIiAtPiAiYnkgcmUtaW1wbGVtZW50aW5nIHVzaW5nIGNv
bXBpbGVyIGJ1aWx0aW5zIi4NCg0KPiBUaGUgY29tcGlsZXJzIHByb3ZpZGUgYnVpbHRpbiBmdW5j
dGlvbiB0byBzd2FwIGJ5dGVzLg0KPiAqIGdjYzogICBodHRwczovL25hbTA0LnNhZmVsaW5rcy5w
cm90ZWN0aW9uLm91dGxvb2suY29tLz91cmw9aHR0cHMlM0ElMkYlMkZnY2MuZ251Lm9yZyUyRm9u
bGluZWRvY3MlMkZnY2MlMkZPdGhlci1CdWlsdGlucy5odG1sJmFtcDtkYXRhPTA1JTdDMDElN0Ns
aW4ubGl1JTQwY2l0cml4LmNvbSU3Q2UwYjNkOThkN2Y4ZDQ3YjhmZTg3MDhkYTMyNzVhZmNkJTdD
MzM1ODM2ZGU0MmVmNDNhMmIxNDUzNDhjMmVlOWNhNWIlN0MwJTdDMCU3QzYzNzg3Nzc3ODI5NDA2
NzkxMSU3Q1Vua25vd24lN0NUV0ZwYkdac2IzZDhleUpXSWpvaU1DNHdMakF3TURBaUxDSlFJam9p
VjJsdU16SWlMQ0pCVGlJNklrMWhhV3dpTENKWFZDSTZNbjAlM0QlN0MzMDAwJTdDJTdDJTdDJmFt
cDtzZGF0YT1IRFRGMUxESmNEMlBMU0N1TSUyRmpJeiUyRldHZjFDcllrMGUlMkZMb3gyMiUyRlhu
dlElM0QmYW1wO3Jlc2VydmVkPTANCj4gKiBjbGFuZzogaHR0cHM6Ly9uYW0wNC5zYWZlbGlua3Mu
cHJvdGVjdGlvbi5vdXRsb29rLmNvbS8/dXJsPWh0dHBzJTNBJTJGJTJGY2xhbmcubGx2bS5vcmcl
MkZkb2NzJTJGTGFuZ3VhZ2VFeHRlbnNpb25zLmh0bWwmYW1wO2RhdGE9MDUlN0MwMSU3Q2xpbi5s
aXUlNDBjaXRyaXguY29tJTdDZTBiM2Q5OGQ3ZjhkNDdiOGZlODcwOGRhMzI3NWFmY2QlN0MzMzU4
MzZkZTQyZWY0M2EyYjE0NTM0OGMyZWU5Y2E1YiU3QzAlN0MwJTdDNjM3ODc3Nzc4Mjk0MDY3OTEx
JTdDVW5rbm93biU3Q1RXRnBiR1pzYjNkOGV5SldJam9pTUM0d0xqQXdNREFpTENKUUlqb2lWMmx1
TXpJaUxDSkJUaUk2SWsxaGFXd2lMQ0pYVkNJNk1uMCUzRCU3QzMwMDAlN0MlN0MlN0MmYW1wO3Nk
YXRhPUV2V2NMTWkydnRUOWhhUVZvJTJGOXVYbWpCaDJ6VkxVelpBZ1U1N2klMkZGTU5vJTNEJmFt
cDtyZXNlcnZlZD0wDQo+IFRoaXMgcGF0Y2ggc2ltcGxpZnkgc3dhYigpIHdpdGggYnVpbHRpbnMg
YW5kIGZhbGxiYWNrIGZvciBvbGQgY29tcGlsZXJzLg0KPg0KPiBTaWduZWQtb2ZmLWJ5OiBMaW4g
TGl1IDxsaW4ubGl1QGNpdHJpeC5jb20+DQo+IC0tLQ0KPiBDYzogU3RlZmFubyBTdGFiZWxsaW5p
IDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPg0KPiBDYzogSnVsaWVuIEdyYWxsIDxqdWxpZW5AeGVu
Lm9yZz4NCj4gQ2M6IEJlcnRyYW5kIE1hcnF1aXMgPGJlcnRyYW5kLm1hcnF1aXNAYXJtLmNvbT4N
Cj4gQ2M6IFZvbG9keW15ciBCYWJjaHVrIDxWb2xvZHlteXJfQmFiY2h1a0BlcGFtLmNvbT4NCj4g
Q2M6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+DQo+IENjOiBHZW9y
Z2UgRHVubGFwIDxnZW9yZ2UuZHVubGFwQGNpdHJpeC5jb20+DQo+IENjOiBKYW4gQmV1bGljaCA8
amJldWxpY2hAc3VzZS5jb20+DQo+IENjOiBXZWkgTGl1IDx3bEB4ZW4ub3JnPg0KPiBDYzogIlJv
Z2VyIFBhdSBNb25uqKYiIDxyb2dlci5wYXVAY2l0cml4LmNvbT4NCj4gQ2hhbmdlcyBpbiB2MzoN
Cj4gLSBDaGVjayBfX2hhc19idWlsdGluIGluc3RlYWQgb2YgR05VQyB2ZXJzaW9uDQo+DQo+IENo
YW5nZXMgaW4gdjI6DQo+IC0gQWRkIGZhbGxiYWNrIGZvciBjb21waWxlcnMgd2l0aG91dCBfX2J1
aWx0aW5fYnN3YXANCj4gLSBJbXBsZW1lbnQgd2l0aCBwbGFpbiBDIGluc3RlYWQgb2YgbWFjcm9z
DQo+IC0tLQ0KPiAgIHhlbi9hcmNoL2FybS9pbmNsdWRlL2FzbS9ieXRlb3JkZXIuaCB8IDE0ICsr
LS0tLS0NCj4gICB4ZW4vYXJjaC94ODYvaW5jbHVkZS9hc20vYnl0ZW9yZGVyLmggfCAzNCArKy0t
LS0tLS0tLS0tLS0tLQ0KPiAgIHhlbi9pbmNsdWRlL3hlbi9ieXRlb3JkZXIuaCAgICAgICAgICB8
IDU2ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysNCj4gICB4ZW4vaW5jbHVkZS94ZW4vYnl0
ZXN3YXAuaCAgICAgICAgICAgfCA0NCArKysrKysrKysrKysrKysrKysrKysrDQo+ICAgeGVuL2lu
Y2x1ZGUveGVuL2NvbXBpbGVyLmggICAgICAgICAgIHwgMTIgKysrKysrDQo+ICAgNSBmaWxlcyBj
aGFuZ2VkLCAxMjAgaW5zZXJ0aW9ucygrKSwgNDAgZGVsZXRpb25zKC0pDQo+ICAgY3JlYXRlIG1v
ZGUgMTAwNjQ0IHhlbi9pbmNsdWRlL3hlbi9ieXRlb3JkZXIuaA0KPiAgIGNyZWF0ZSBtb2RlIDEw
MDY0NCB4ZW4vaW5jbHVkZS94ZW4vYnl0ZXN3YXAuaA0KPg0KPiBkaWZmIC0tZ2l0IGEveGVuL2Fy
Y2gvYXJtL2luY2x1ZGUvYXNtL2J5dGVvcmRlci5oIGIveGVuL2FyY2gvYXJtL2luY2x1ZGUvYXNt
L2J5dGVvcmRlci5oDQo+IGluZGV4IDljNzEyYzQ3ODguLjYyMmVlYWJhMDcgMTAwNjQ0DQo+IC0t
LSBhL3hlbi9hcmNoL2FybS9pbmNsdWRlL2FzbS9ieXRlb3JkZXIuaA0KPiArKysgYi94ZW4vYXJj
aC9hcm0vaW5jbHVkZS9hc20vYnl0ZW9yZGVyLmgNCj4gQEAgLTEsMTYgKzEsMTAgQEANCj4gICAj
aWZuZGVmIF9fQVNNX0FSTV9CWVRFT1JERVJfSF9fDQo+ICAgI2RlZmluZSBfX0FTTV9BUk1fQllU
RU9SREVSX0hfXw0KPg0KPiAtI2RlZmluZSBfX0JZVEVPUkRFUl9IQVNfVTY0X18NCj4gKyNpZm5k
ZWYgX19CWVRFX09SREVSX18NCj4gKyAgICNkZWZpbmUgX19CWVRFX09SREVSX18gX19PUkRFUl9M
SVRUTEVfRU5ESUFOX18NCj4gKyNlbmRpZg0KPg0KPiAtI2luY2x1ZGUgPHhlbi9ieXRlb3JkZXIv
bGl0dGxlX2VuZGlhbi5oPg0KPiArI2luY2x1ZGUgPHhlbi9ieXRlb3JkZXIuaD4NCj4NCj4gICAj
ZW5kaWYgLyogX19BU01fQVJNX0JZVEVPUkRFUl9IX18gKi8NCj4gLS8qDQo+IC0gKiBMb2NhbCB2
YXJpYWJsZXM6DQo+IC0gKiBtb2RlOiBDDQo+IC0gKiBjLWZpbGUtc3R5bGU6ICJCU0QiDQo+IC0g
KiBjLWJhc2ljLW9mZnNldDogNA0KPiAtICogaW5kZW50LXRhYnMtbW9kZTogbmlsDQo+IC0gKiBF
bmQ6DQo+IC0gKi8NCg0KPj4gVGhpcyBjaGFuZ2UgbG9va3MgdW5yZWxhdGVkIHRvIHRoaXMgcGF0
Y2guIENhbiB5b3UgZXhwbGFpbiBpdD8NCg0KRG8geW91IG1lYW4gZm9sbG93aW5nIGNvZGUgYmxv
Y2s/IFllcywgaXQgaXMgdW5yZWxhdGVkLCBJIHJlbW92ZWQgaXQgYXMgSSBmb3VuZCBzb21lIGZp
bGVzIGRvZXMgbm90IGluY2x1ZGUgc3VjaCBmaWVsZC4NCldpbGwgcmV2ZXJ0IHN1Y2ggZmllbGQg
aW4gVjQuDQo+IC0vKg0KPiAtICogTG9jYWwgdmFyaWFibGVzOg0KPiAtICogbW9kZTogQw0KPiAt
ICogYy1maWxlLXN0eWxlOiAiQlNEIg0KPiAtICogYy1iYXNpYy1vZmZzZXQ6IDQNCj4gLSAqIGlu
ZGVudC10YWJzLW1vZGU6IG5pbA0KPiAtICogRW5kOg0KPiAtICovDQo=

--_000_SJ0PR03MB540509C0FCD040A3680DE3799DC99SJ0PR03MB5405namp_
Content-Type: text/html; charset="gb2312"
Content-Transfer-Encoding: quoted-printable

<html xmlns:o=3D"urn:schemas-microsoft-com:office:office" xmlns:w=3D"urn:sc=
hemas-microsoft-com:office:word" xmlns:m=3D"http://schemas.microsoft.com/of=
fice/2004/12/omml" xmlns=3D"http://www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dgb2312">
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:DengXian;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:"\@DengXian";
	panose-1:2 1 6 0 3 1 1 1 1 1;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	font-size:10.0pt;
	font-family:"Calibri",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:blue;
	text-decoration:underline;}
span.EmailStyle19
	{mso-style-type:personal-reply;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;}
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:72.0pt 72.0pt 72.0pt 72.0pt;}
div.WordSection1
	{page:WordSection1;}
--></style>
</head>
<body lang=3D"en-CN" link=3D"blue" vlink=3D"purple" style=3D"word-wrap:brea=
k-word">
<div class=3D"WordSection1">
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">Hi,<br>
<br>
On 10/05/2022 11:15, Lin Liu wrote:<br>
&gt; swab() is massively over complicated and can be simplified by builtins=
.<br>
<br>
NIT: &quot;by builtins&quot; -&gt; &quot;by re-implementing using compiler =
builtins&quot;.<br>
<br>
&gt; The compilers provide builtin function to swap bytes.<br>
&gt; * gcc:&nbsp;&nbsp; <a href=3D"https://nam04.safelinks.protection.outlo=
ok.com/?url=3Dhttps%3A%2F%2Fgcc.gnu.org%2Fonlinedocs%2Fgcc%2FOther-Builtins=
.html&amp;amp;data=3D05%7C01%7Clin.liu%40citrix.com%7Ce0b3d98d7f8d47b8fe870=
8da3275afcd%7C335836de42ef43a2b145348c2ee9ca5b%7C0%7C0%7C637877778294067911=
%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haW=
wiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;amp;sdata=3DHDTF1LDJcD2PLSCuM%2FjIz%2F=
WGf1CrYk0e%2FLox22%2FXnvQ%3D&amp;amp;reserved=3D0">
https://nam04.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgcc.gnu=
.org%2Fonlinedocs%2Fgcc%2FOther-Builtins.html&amp;amp;data=3D05%7C01%7Clin.=
liu%40citrix.com%7Ce0b3d98d7f8d47b8fe8708da3275afcd%7C335836de42ef43a2b1453=
48c2ee9ca5b%7C0%7C0%7C637877778294067911%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC=
4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&am=
p;amp;sdata=3DHDTF1LDJcD2PLSCuM%2FjIz%2FWGf1CrYk0e%2FLox22%2FXnvQ%3D&amp;am=
p;reserved=3D0</a><br>
&gt; * clang: <a href=3D"https://nam04.safelinks.protection.outlook.com/?ur=
l=3Dhttps%3A%2F%2Fclang.llvm.org%2Fdocs%2FLanguageExtensions.html&amp;amp;d=
ata=3D05%7C01%7Clin.liu%40citrix.com%7Ce0b3d98d7f8d47b8fe8708da3275afcd%7C3=
35836de42ef43a2b145348c2ee9ca5b%7C0%7C0%7C637877778294067911%7CUnknown%7CTW=
FpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3=
D%7C3000%7C%7C%7C&amp;amp;sdata=3DEvWcLMi2vtT9haQVo%2F9uXmjBh2zVLUzZAgU57i%=
2FFMNo%3D&amp;amp;reserved=3D0">
https://nam04.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fclang.l=
lvm.org%2Fdocs%2FLanguageExtensions.html&amp;amp;data=3D05%7C01%7Clin.liu%4=
0citrix.com%7Ce0b3d98d7f8d47b8fe8708da3275afcd%7C335836de42ef43a2b145348c2e=
e9ca5b%7C0%7C0%7C637877778294067911%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjA=
wMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;amp=
;sdata=3DEvWcLMi2vtT9haQVo%2F9uXmjBh2zVLUzZAgU57i%2FFMNo%3D&amp;amp;reserve=
d=3D0</a><br>
&gt; This patch simplify swab() with builtins and fallback for old compiler=
s.<br>
&gt; <br>
&gt; Signed-off-by: Lin Liu &lt;lin.liu@citrix.com&gt;<br>
&gt; ---<br>
&gt; Cc: Stefano Stabellini &lt;sstabellini@kernel.org&gt;<br>
&gt; Cc: Julien Grall &lt;julien@xen.org&gt;<br>
&gt; Cc: Bertrand Marquis &lt;bertrand.marquis@arm.com&gt;<br>
&gt; Cc: Volodymyr Babchuk &lt;Volodymyr_Babchuk@epam.com&gt;<br>
&gt; Cc: Andrew Cooper &lt;andrew.cooper3@citrix.com&gt;<br>
&gt; Cc: George Dunlap &lt;george.dunlap@citrix.com&gt;<br>
&gt; Cc: Jan Beulich &lt;jbeulich@suse.com&gt;<br>
&gt; Cc: Wei Liu &lt;wl@xen.org&gt;<br>
&gt; Cc: &quot;Roger Pau Monn=A8=A6&quot; &lt;roger.pau@citrix.com&gt;<br>
&gt; Changes in v3:<br>
&gt; - Check __has_builtin instead of GNUC version<br>
&gt; <br>
&gt; Changes in v2:<br>
&gt; - Add fallback for compilers without __builtin_bswap<br>
&gt; - Implement with plain C instead of macros<br>
&gt; ---<br>
&gt;&nbsp;&nbsp; xen/arch/arm/include/asm/byteorder.h | 14 ++-----<br>
&gt;&nbsp;&nbsp; xen/arch/x86/include/asm/byteorder.h | 34 ++--------------=
-<br>
&gt;&nbsp;&nbsp; xen/include/xen/byteorder.h&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; | 56 ++++++++++++++++++++++++++++<br>
&gt;&nbsp;&nbsp; xen/include/xen/byteswap.h&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; | 44 ++++++++++++++++++++++<br>
&gt;&nbsp;&nbsp; xen/include/xen/compiler.h&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; | 12 ++++++<br>
&gt;&nbsp;&nbsp; 5 files changed, 120 insertions(+), 40 deletions(-)<br>
&gt;&nbsp;&nbsp; create mode 100644 xen/include/xen/byteorder.h<br>
&gt;&nbsp;&nbsp; create mode 100644 xen/include/xen/byteswap.h<br>
&gt; <br>
&gt; diff --git a/xen/arch/arm/include/asm/byteorder.h b/xen/arch/arm/inclu=
de/asm/byteorder.h<br>
&gt; index 9c712c4788..622eeaba07 100644<br>
&gt; --- a/xen/arch/arm/include/asm/byteorder.h<br>
&gt; +++ b/xen/arch/arm/include/asm/byteorder.h<br>
&gt; @@ -1,16 +1,10 @@<br>
&gt;&nbsp;&nbsp; #ifndef __ASM_ARM_BYTEORDER_H__<br>
&gt;&nbsp;&nbsp; #define __ASM_ARM_BYTEORDER_H__<br>
&gt;&nbsp;&nbsp; <br>
&gt; -#define __BYTEORDER_HAS_U64__<br>
&gt; +#ifndef __BYTE_ORDER__<br>
&gt; +&nbsp;&nbsp; #define __BYTE_ORDER__ __ORDER_LITTLE_ENDIAN__<br>
&gt; +#endif<br>
&gt;&nbsp;&nbsp; <br>
&gt; -#include &lt;xen/byteorder/little_endian.h&gt;<br>
&gt; +#include &lt;xen/byteorder.h&gt;<br>
&gt;&nbsp;&nbsp; <br>
&gt;&nbsp;&nbsp; #endif /* __ASM_ARM_BYTEORDER_H__ */<br>
&gt; -/*<br>
&gt; - * Local variables:<br>
&gt; - * mode: C<br>
&gt; - * c-file-style: &quot;BSD&quot;<br>
&gt; - * c-basic-offset: 4<br>
&gt; - * indent-tabs-mode: nil<br>
&gt; - * End:<br>
&gt; - */<br>
<br>
</span><span lang=3D"EN-US" style=3D"font-size:11.0pt">&gt;&gt; </span><spa=
n style=3D"font-size:11.0pt">This change looks unrelated to this patch. Can=
 you explain it?<br>
<br>
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11.0pt">Do y=
ou mean following code block? Yes, it is unrelated, I removed it as I found=
 some files does not include such field.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11.0pt">Will=
 revert such field in V4.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt; -/*<br>
&gt; - * Local variables:<br>
&gt; - * mode: C<br>
&gt; - * c-file-style: &quot;BSD&quot;<br>
&gt; - * c-basic-offset: 4<br>
&gt; - * indent-tabs-mode: nil<br>
&gt; - * End:<br>
&gt; - */</span><span lang=3D"EN-US" style=3D"font-size:11.0pt"><o:p></o:p>=
</span></p>
</div>
</div>
</body>
</html>

--_000_SJ0PR03MB540509C0FCD040A3680DE3799DC99SJ0PR03MB5405namp_--

