Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F038B50F1F3
	for <lists+xen-devel@lfdr.de>; Tue, 26 Apr 2022 09:13:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.313472.531012 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njFNl-0004OW-B4; Tue, 26 Apr 2022 07:13:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 313472.531012; Tue, 26 Apr 2022 07:13:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njFNl-0004Lo-7C; Tue, 26 Apr 2022 07:13:09 +0000
Received: by outflank-mailman (input) for mailman id 313472;
 Tue, 26 Apr 2022 07:13:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cQU5=VE=citrix.com=prvs=10866150f=roger.pau@srs-se1.protection.inumbo.net>)
 id 1njFNj-0004Li-Oq
 for xen-devel@lists.xenproject.org; Tue, 26 Apr 2022 07:13:07 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 508fa306-c530-11ec-a405-831a346695d4;
 Tue, 26 Apr 2022 09:13:06 +0200 (CEST)
Received: from mail-bn8nam11lp2171.outbound.protection.outlook.com (HELO
 NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.171])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 26 Apr 2022 03:13:02 -0400
Received: from DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
 by DS7PR03MB5447.namprd03.prod.outlook.com (2603:10b6:5:2c7::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.13; Tue, 26 Apr
 2022 07:12:58 +0000
Received: from DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e]) by DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e%4]) with mapi id 15.20.5186.021; Tue, 26 Apr 2022
 07:12:58 +0000
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
X-Inumbo-ID: 508fa306-c530-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1650957185;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=PgQeWTlh78mDe08LpMccbH2oq7ntRqKFwtKSvEB0Tzo=;
  b=IjEqSTDJHb+sW2EM667f7+OAkftFkFM9FQH+XUQc36HH8OoYfCQUYrGF
   Rvz3Zm160+R8OnZsH177Si0mkbZ++eBdtDa4l+PexJPoSz3GlGDBRQl+b
   c49uiRP+5T5Yi1pqvCTRRzUn+0MhzKCB88UWzpysO4oKNQyym/QqK2yeb
   o=;
X-IronPort-RemoteIP: 104.47.58.171
X-IronPort-MID: 69320991
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:Yd0JtK3ZwINvDms0X/bD5ZJxkn2cJEfYwER7XKvMYLTBsI5bpzxVz
 2caWmuFPa6CZGX3edlwadjlp08BvZGGz9I2HQU5pC1hF35El5HIVI+TRqvS04J+DSFhoGZPt
 Zh2hgzodZhsJpPkjk7xdOCn9xGQ7InQLlbGILes1htZGEk1EE/NtTo5w7Rj2tIy34Dga++wk
 YiaT/P3aQfNNwFcagr424rbwP+4lK2v0N+wlgVWicFj5DcypVFMZH4sDfjZw0/DaptVBoaHq
 9Prl9lVyI97EyAFUbtJmp6jGqEDryW70QKm0hK6UID66vROS7BbPg/W+5PwZG8O4whlkeydx
 /1vj4SvcxgGGZSTifoAWSgJKBAnAqNJreqvzXiX6aR/zmXgWl61mrBEKhFzOocVvOFqHWtJ6
 PoUbigXaQyOjP63x7T9TfRwgsMkL4/gO4Z3VnNIlGmFS6p5B82TBfyVvLe03x9p7ixKNezZa
 McDLyJmcTzLYgFVO0dRA5U79AutrieuKGcA+QPMzUYxyzjD/AtQ2pLECtHuW4aBVO8Isx22h
 kuTqgwVBTlfbrRz0wGt/mq3g+7TnQvyQI8ICKCj7flunUGSwWoIThYRUDOTsfS/z0KzRd9bA
 0gV4TY167g/8lSxSdvwVAH+p2SL1jYiXN5XH/w/+Ru64KPe6AaEBUAJVjdELtchsaceWjgCx
 lKP2dTzClRHq7aSVW7b+r6KrCiaIjQcN2sLb2kFSmMt4dDlrJsikxHnQdNqEarzhdrwcRnr2
 CyDpiU6g7QVjOYI2r+98FSBhCijzrDLUwo06wP/Tm+jqARja+aNbYGy9ULS6/oGKY+DV0SAp
 1ANgc3Y5+cLZbmPniGQROQGHJmy+u2IdjbbhDZHE5co+Dus/HqiVZtN+zw4L0BsWu4IdjPkb
 1XakR9A759Uen2xZOl4ZJzZNigx5a3pFNCgXPaEaNNLO8F1bFXeo3goYlOM1WfwlkRqibs4J
 ZqQbcerCzAdFLhjyz21Aewa1NfH2xwD+I8afrijpzzP7FZUTCf9pWstWLdWUt0E0Q==
IronPort-HdrOrdr: A9a23:RiSeT69N2rh/UECPIttuk+FKdb1zdoMgy1knxilNoENuH/Bwxv
 rFoB1E73TJYVYqN03IV+rwXZVoZUmsjaKdhrNhRotKPTOWwVdASbsP0WKM+V3d8kHFh41gPO
 JbAtJD4b7LfCdHZKTBkW6F+r8bqbHokZxAx92uqUuFJTsaF52IhD0JbjpzfHcGJjWvUvECZe
 ehD4d81nOdUEVSSv7+KmgOXuDFqdGOvJX6YSQeDxpizAWVlzun5JPzDhDdh34lInhy6IZn1V
 KAvx3y562lvf3+4hjA11XL55ATvNf60NNMCOGFl8BQADTxjQSDYphnRtS5zXgIidDqzGxvvM
 jHoh8mMcg2w3TNflutqR+o4AXk2CZG0Q6X9XaoxV/Y5eDpTjMzDMRMwahDdAHC1kYmtNZglI
 pWwmOwrfNsfFz9tRW4w+KNewBhl0Kyr3Znu/UUlWZjXYwXb6IUhZAD/XlSDIwLEEvBmcwa+d
 FVfYDhDcttABOnhyizhBgt/DXsZAV/Iv6+eDlNhiTPuAIm3kyQzCMjtbkidzk7hdcAoqJ/lp
 X525RT5c9zp/AtHNJA7cc6MLyK4z/2MGTx2Fz7GyWVKIg3f1TwlrXQ3JIZoMmXRb1g9upBpH
 2GaiITiVIP
X-IronPort-AV: E=Sophos;i="5.90,290,1643691600"; 
   d="scan'208";a="69320991"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WW6ZmzaZQzWPfcSTHoorTjjH4Yu98jl/t2Rs/WjTgh5f63Cvt6TLTnD5HNynwH/zJ9DirV5ruTe88M9gY0H62pzu0llFRhcjx495c4J6FlNEH7gJ9ulsXIUag5fiKy4BSx1NXdPE8hvY4C34+XQZmcDzheRLKmLOaK/tYL3RFROh0TuifZSSoM98yeJxPQl0nUWS181YyJ8e4u4CYe0AuZ+Q4ec2+RebAk29UNNlpq4w/M0go0gbt0znMoXNK7V3L011Bm24K8yGRSKXd2FrhM3+4BbtePd+McnZRq87lFS4IcT7IvTbBCGSDhJ2YYG3eHjHVqV5A/a4UyTkuquRsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mnAj+ibkU6zymtcm59DbtnqdExUD9SINdw3zagV1Wfc=;
 b=NiaAisvznkeBuWfCkhjiSTOlunf+P7vtnuhaX4JM/xEyLL9hK52ME929f9uZwTec8QXY+0UFTRVBJEKGSl4PyRQMCTfuqY6fx6FDFcCW2DecqbUdTojJZ68Szjmkz8pw/tgb/IA61o3h8SXRq3OXVJsfBeyu2RQNfuqE5Lfr/tAekcK979bpn00IavnxbOB32plsevvdomVoJCuQr7QYj3PGIOlJ3L4V2lq9NgmGfHQAfy1/HdlS7iCC7+t5FB2pU4LW/NncEYE54dHpxCnGFY10gd5sLQJqY2HQqXYqgOit6V+tyxYfOxTExQ8kLs1RdUqdxAIS8C6B+g3jMP/plQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mnAj+ibkU6zymtcm59DbtnqdExUD9SINdw3zagV1Wfc=;
 b=HoRlk0LbxDCsN+cXMkpLcN3y2TbiTLLlDXRgWMowXPGyPwAwL3cuYBZeb+kg0Gh87CoVOUaty18UGYHT+0OZ9iTNt0QB4az1+ottnngFcQ4Va+eZqKjgDo8ngcubL381xYZelbpLERosvHVTy3+2QuQ31cuUcjzyY7nZec9jFLw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Tue, 26 Apr 2022 09:12:53 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Cc: xen-devel@lists.xenproject.org,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Wei Liu <wl@xen.org>, scott.davis@starlab.io, jandryuk@gmail.com,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Dario Faggioli <dfaggioli@suse.com>,
	Daniel De Graaf <dgdegra@tycho.nsa.gov>
Subject: Re: [PATCH v3 1/2] xsm: create idle domain privileged and demote
 after setup
Message-ID: <YmebdccTfa7wKc9U@Air-de-Roger>
References: <20220422163458.30170-1-dpsmith@apertussolutions.com>
 <20220422163458.30170-2-dpsmith@apertussolutions.com>
 <YmZtiJ5Jf1CNOpeZ@Air-de-Roger>
 <25e701d4-62ae-278d-b165-2201459c7cee@apertussolutions.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <25e701d4-62ae-278d-b165-2201459c7cee@apertussolutions.com>
X-ClientProxiedBy: MR2P264CA0074.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:32::14) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0a05ced1-b7c5-4ac7-8bfc-08da27543115
X-MS-TrafficTypeDiagnostic: DS7PR03MB5447:EE_
X-Microsoft-Antispam-PRVS:
	<DS7PR03MB5447D1EC7465DF09B187707F8FFB9@DS7PR03MB5447.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	M1Rz4U5W3ym/XIxD0pX7LaCA3EuCuO3xNFxGmfHDcg0qqPUUl0rzslTONp6FfX+d+NcuTd+1wT6FWZF6B8a82zcE6hU+wOK0CkAUZv4D5J2yHAtaHhp5CwcD+Z+Wt0jrYuFgra+j/OhCjJTqO3imeVkZ5bHD9YZSTjpXDTFmM9A7K0s5fjMgGkVLPMOY/Qq9UZvYivCsK+nclbIDhO9gtYy5Wijb5kHYPIzYtJhbZ/J5QT6/bTj0EE28IRXw2fDzncDXFY38jYGnfGaSVHdHp3j3DdbUCX2GfyJLDezIm8PyI+zxzP9SshDen81X8noglYFUyrGI2ACxJvgUYCVC+0Ln4Gz14G/UomaY67GR2aQnXdaMJpUpGg0+ameYwPTNVsVkDpChf40A/vSYt555JWZR80hrN5iOhNDuJdSEtWvOiJUpRlAlYwvWf+R08+KlMOOLfROm865ekJPwIpQ8PNu3l+ooHk4HM9LlQRazBm+xlMXhPkI/wKulaTFgGi4q0xjyrMvdERgis4QkQ8ekByvNsCDDyc+ZEKqn06/CtCu8nFMM66YEadiZxhRueXjIStE2QBrWaJNgvDceAq0VHKBBfGP94/tbw6h8LvGmeqZIM9J+3LgiCn9XWTreSgkF8Wt7QxsDAutXChKEBzFtwQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(4636009)(366004)(53546011)(26005)(186003)(54906003)(6916009)(6512007)(9686003)(6506007)(33716001)(85182001)(508600001)(6486002)(5660300002)(38100700002)(86362001)(7416002)(2906002)(316002)(6666004)(82960400001)(83380400001)(8676002)(4326008)(8936002)(66556008)(66946007)(66476007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZU1MRko0UnNiMnZRZGU3TUs2a2p5aHlSTmxtVjAwTGhFVEdmd3NrbVM5K3F1?=
 =?utf-8?B?RWlYeXV6cWxyY04rT1pER0JlOHJDYUhLWnRlWUx3dmxFblc3dmozYjRkOFNl?=
 =?utf-8?B?UHhUV0xSL2MvaGlYZ1lkSmNJZmkvczBCcVcwUDJROVJPQ0RwZnl3b2MxUEkz?=
 =?utf-8?B?a0Rjbi9aNjZkWmxnSW9ub0lWRFUyc2VIbyt1eXdIUXh6Smc5T2I5dWxyYXNT?=
 =?utf-8?B?eDN1SmtYVzNqSENsRkMzR29MejZlNkl6QVpoN3BQRll6SDlybTdoUDBuZnJB?=
 =?utf-8?B?NGdldXdtdi8wbkxOQnZsNEoyQ3FmMWhyTThUSzVTUkRzUThlRXA0V2lyODBw?=
 =?utf-8?B?NGRVYnQ4K2VVYS9OR3JGTzNtT0VSTTZHYW5sMTZnaXEwc21GTkV3ZmpJeGM2?=
 =?utf-8?B?VEQvbm5JaUdCdmVZUVZyaHpxdzZ1U2ZuWlpncEIzMVRJN0VPbGV0SHFZc0k0?=
 =?utf-8?B?UHZveit0M2ZXdUIyR2IzU2RpVTBXV3FjaU4vNWhodmo5cXZkR1pManhjZDZF?=
 =?utf-8?B?Y044WTVDUm1EOXBBR1JkTDRFc1ZkUDJWRGorcXllYTBVYVlmYTdUaWEwWGd0?=
 =?utf-8?B?OVEvOUZlcG9wN2Jqblh2TXlXUDhSNExzZFBqM05HdzVyYnNXYUdtTmVVdUUv?=
 =?utf-8?B?Ynl2bmU0YzB2d0d5QnFHOEJRa0pwSE5GempubEs2U3VhZ3BYR1RZUnJTSzJ2?=
 =?utf-8?B?V0E5bUJNTk9mVmlqRWtGS1FMbmZ2bUtFUCtDUXM0MkxiNlVHTWs5dTBNaVUy?=
 =?utf-8?B?WjZSVlVraHVFUzB2MFVKREtYSnM4M0p1Q1R4SEFka200TlprS3Q2YnF5OEVS?=
 =?utf-8?B?dzZXSVJoSytxNkhYcXhrTXYzdW95Uk4wTzNQSHlLdkJwc2pGMkhKM1UzOVVE?=
 =?utf-8?B?eU9yRk8rbXovbjZUZkFYRGVVbW90K1Z0dUUyV2Fta29LaFpldmxNNmFVSG8v?=
 =?utf-8?B?SWJUWVNYUm5XdmhKUVkzclBNSlNVeHhraDdnUU9BblorT1BGdGRVbVl5YnBK?=
 =?utf-8?B?Tjc2RXN5djlwYVNsWHVFenpRMkVZbXJkMGlFdE9YWnlMRmVRYThKY0g4bWcr?=
 =?utf-8?B?b29WdjZIQ3E3OHhIcXo3UU15VDdJTi9ZTnFpNyt1cnp4ejBKTmh5Rk1QNmF0?=
 =?utf-8?B?VkRKcCsxSW40c3BqYzl2RTFPczlHOVBNbGgydEJuUWxLb3YxaHhoV1M3WlJ6?=
 =?utf-8?B?eitBMS9mdzFjcEo3Z2gwVFRleU9pWFVpcTRkR3pwRWYrUTZDdW9BZ2tnUUZr?=
 =?utf-8?B?eURqNTd2NGpxVmhSNlBkeGw0Sk0zR2tuWGJhMW1RdHNocTBMcEovNjZoUExs?=
 =?utf-8?B?WUgvTENsdnEvbmtuWlBQZlNTNGl2c2ZQM0s2YjJrWXBxQVowOUhvZjI4WDd5?=
 =?utf-8?B?TDRxT0x5LzNKVTZSNFlKUW14d21DZXRrdytKZmpQbGUxWm9XS01OcGFZWGdW?=
 =?utf-8?B?SXRXZjBqbkhOQ2NNNGdwSUd3Mk1kWU5HdkVUdENhY3o0WU9JWi94Ni91WUZs?=
 =?utf-8?B?QjBFTzQyYjhrcWxRLzhmYmZSTDZpcXg4NW5qTG1RSy8rdlVMSUxNVzExN3B6?=
 =?utf-8?B?bXIvREt5SDBuaXVRNDh6L1QzbHZGK0pjdUdQWjZ4VG43SHUxYjhBb2VScksv?=
 =?utf-8?B?WCtKOE9NQXgwUGZXS0RVS3dzZ054T0VTWFRLNmpqbGZSbnQwMGF4VkFtM2dW?=
 =?utf-8?B?TUtZTXhSejRPVzA2Z21VOFJWUGJsSVZsMFFqRXJhdjExOEFLVHg4Mm54YmxP?=
 =?utf-8?B?QVpjb0thcUhMOU1ncUJzVUs4TmlEODFIUUJnZ1pkZ3NKSkN3UmVEN1FpZnRI?=
 =?utf-8?B?Q0ZJNWFFYzN6Y2NiWFkvSDd4S1ZoK1UwUEsyRVFSZTkrTVlUN0pCR3FXREhw?=
 =?utf-8?B?UXRNMlFtekFvdk5zcndOYStGYWwxZjREVFRpY00rU1RFL2NBTkxXaklpdFJn?=
 =?utf-8?B?TVFocXFlNUJ2Y0V0aG85NXVaZTk1WGlDUEhqV3RrSjBMUWRBazNLNGZxTE5V?=
 =?utf-8?B?SzF5SW1BRTA0Qzk1dTY5Snl2MjIzZDdtaTFLcTRhcHlpcUxLWHp2MDVWRVcv?=
 =?utf-8?B?Y0NmNTRNT1JPZnJVRHhkMStETkl2OGQ5UDJkN3RHRFBtbkhoSUlXNXdWOHlL?=
 =?utf-8?B?eGJMczczVXNWL2ZPYjFvazFuMy9CUjQwcVB2Z2psK0ZBbitXR2YzaVRLZ2RB?=
 =?utf-8?B?RkxjOXlKeFVsRmNHM2VnWjBFRjBBWm1kZmdoZ1FwNjdLaytjVE1zcG9PbVYx?=
 =?utf-8?B?YlVYK2dnekx1dlBWSE1QNVhudFVZTVVnYXpXTmg1aUdvdnd0aFdZd042SHFy?=
 =?utf-8?B?RHhmMWxVWjZMMjlyWXVEaGtLOGR4dlBtZDB4cGFHb092dVNVSXBkRWdwL2RW?=
 =?utf-8?Q?EFO/cYdwUed17WH8=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a05ced1-b7c5-4ac7-8bfc-08da27543115
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2022 07:12:58.1984
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SsaYWfSZbO6Tb8obsdsHnZledTekxdYoZLaPrTLuKhetINGOVPpWF/v5YAz6lyfRB5pTUhB/9e/lMX/F7v+8uQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR03MB5447

On Mon, Apr 25, 2022 at 12:39:17PM -0400, Daniel P. Smith wrote:
> On 4/25/22 05:44, Roger Pau Monné wrote:
> > On Fri, Apr 22, 2022 at 12:34:57PM -0400, Daniel P. Smith wrote:
> >> diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
> >> index d5d0792ed4..e71fa3f860 100644
> >> --- a/xen/arch/arm/setup.c
> >> +++ b/xen/arch/arm/setup.c
> >> @@ -1048,6 +1048,9 @@ void __init start_xen(unsigned long boot_phys_offset,
> >>      /* Hide UART from DOM0 if we're using it */
> >>      serial_endboot();
> >>  
> >> +    if ( xsm_set_system_active() != 0)
> >> +        panic("xsm: unable to set hypervisor to SYSTEM_ACTIVE privilege\n");
> >> +
> >>      system_state = SYS_STATE_active;
> >>  
> >>      for_each_domain( d )
> >> diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
> >> index 6f20e17892..a3ce288ef9 100644
> >> --- a/xen/arch/x86/setup.c
> >> +++ b/xen/arch/x86/setup.c
> >> @@ -621,6 +621,9 @@ static void noreturn init_done(void)
> >>      void *va;
> >>      unsigned long start, end;
> >>  
> >> +    if ( xsm_set_system_active() != 0)
> >            ^ extra space.
> > 
> > Since the function returns an error code you might as well add it to
> > the panic message, or else just make the function return bool instead.
> > 
> > Or just make the function void and panic in the handler itself (like
> > in previous versions), as I don't think it's sensible to continue
> > normal execution if xsm_set_system_active fails.
> 
> After reflecting on it, I believe that was not the correct action. The
> policy should handle setting/checking all access control state and fail
> with an error of why and then allow the hypervisor logic decided what to
> do with that failure. For the policies that are present today, yes it is
> an immediate panic. Ultimately this will future proof the interface
> should a future policy type be introduced with a more varied result that
> could allow the hypervisor to continue to boot, for instance to a
> limited and/or debug state.

That's all fine, but if you return an error code, please print it as
part of the panic message.  The more information we can add in case of
panic, the better.

> >> diff --git a/xen/xsm/dummy.c b/xen/xsm/dummy.c
> >> index 8c044ef615..e6ffa948f7 100644
> >> --- a/xen/xsm/dummy.c
> >> +++ b/xen/xsm/dummy.c
> >> @@ -14,6 +14,7 @@
> >>  #include <xsm/dummy.h>
> >>  
> >>  static const struct xsm_ops __initconst_cf_clobber dummy_ops = {
> >> +    .set_system_active             = xsm_set_system_active,
> >>      .security_domaininfo           = xsm_security_domaininfo,
> >>      .domain_create                 = xsm_domain_create,
> >>      .getdomaininfo                 = xsm_getdomaininfo,
> >> diff --git a/xen/xsm/flask/hooks.c b/xen/xsm/flask/hooks.c
> >> index 0bf63ffa84..8a62de2fd6 100644
> >> --- a/xen/xsm/flask/hooks.c
> >> +++ b/xen/xsm/flask/hooks.c
> >> @@ -186,6 +186,26 @@ static int cf_check flask_domain_alloc_security(struct domain *d)
> >>      return 0;
> >>  }
> >>  
> >> +static int cf_check flask_set_system_active(void)
> >> +{
> >> +    struct domain *d = current->domain;
> > 
> > Nit: you should also add the assert for d->is_privileged, I don't see
> > a reason for the xsm and flask functions to differ in that regard.
> 
> This goes back to an issued I have raised before, is_privileged really
> encompasses two properties of a domain. Whether the domain is filling
> the special control domain role versus what accesses the domain has
> based on the context under which is_control_domain() is called. For
> instance the function init_domain_msr_policy() uses is_control_domain()
> not to make an access control decision but configure behavior. Under
> flask is_privileged no longer reflects the accesses a domain with it set
> will have, thus whether it is cleared when flask is enabled is
> irrelevant as far as flask is concerned. For the ASSERT, what matters is
> that the label was set to xenboot_t on construction and that it was not
> changed before reaching this point. Or in a short form, when under the
> default policy the expected state is concerned with is_privilege while
> for flask it is only the SID.

I certainly don't care that much, but you do set d->is_privileged =
false in flask_set_system_active, hence it would seem logic to expect
d->is_privileged == true also?

If not for anything else, just to assert that the function is not
called twice.

Thanks, Roger.

