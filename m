Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C71435EF7F
	for <lists+xen-devel@lfdr.de>; Wed, 14 Apr 2021 10:28:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.110358.210631 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lWasi-0003v0-R7; Wed, 14 Apr 2021 08:28:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 110358.210631; Wed, 14 Apr 2021 08:28:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lWasi-0003uc-Nr; Wed, 14 Apr 2021 08:28:16 +0000
Received: by outflank-mailman (input) for mailman id 110358;
 Wed, 14 Apr 2021 08:28:15 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=O5rk=JL=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lWash-0003uX-Fa
 for xen-devel@lists.xenproject.org; Wed, 14 Apr 2021 08:28:15 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a835bf1a-f0c9-4192-afb0-811f59152a4c;
 Wed, 14 Apr 2021 08:28:14 +0000 (UTC)
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
X-Inumbo-ID: a835bf1a-f0c9-4192-afb0-811f59152a4c
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1618388894;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=XDLQGvHNZbdUsn2uHbWXlByxHynwWp+FQFUd4VeFLEA=;
  b=Omk6sCTsDDytm6Dc1ccLx9kHVmYWhxgixjIxtFd4Kr7H6Rv1rO0ARQEM
   TwPOkEaEdOV7Mxak/BbRaADESU7Qx2jdt7/UYcnF1AWbEeZep9ayHQ8+W
   FoekN81ARDiyJzurN/v53gax9AAfHGaqkSCHm8jN1fuzuPnkYFXgo6QBZ
   8=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: b4k2vgajPao5+jcBvWymnJ3hxYWxRvDiKAL1rtYZYq5ETVTT/d/mNFUBa7rkb9Fd141GfBIZyP
 j9V+U8CyMxx1gxKtfNlgGzN7QEoCjDIv8hP9UlHGjQ54dpHb43FHq4WLO5cqy1Ji5AKNhoesXv
 CBscc+v0QxQDYf7AHdV2pZxgPSSsqV2AnIDQy4O6fCTzCLlEgsMp84tOGVVAkMMe65P+Tm8yUd
 iVH31m7exVVxOzEU9tB17k/wMU6YOIZFxYAjkY3IMCDjCWnOirdYi1j+kKWufp1Hn4Uz6UFo9T
 8/Q=
X-SBRS: 5.2
X-MesageID: 41933573
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:IL79HaibUIagDS1O9kZbu7lVpnBQX2hw3DAbvn1ZSRFFG/Gwv/
 uF2NwGyB75jysQUnk8mdaGfJKNW2/Y6IQd2+csFJ+Ydk3DtHGzJI9vqbHjzTrpBjHk+odmup
 tIW5NVTOf9BV0St6rHySGlDtctx8SG+qi0heHYi0xgVx1udrsI1WdEIyywe3cGIjVuL5w/CZ
 aa+45rpyC4f24Wc8S8ARA+LpX+jvfMk4/rZgNDOgUu7xOAgSjtxLnxFRWZ2Rl2aUIy/Z4J92
 /Znwvlopiyqv3T8G6n60b/zbRz3OHgxNxKGdCWhqEuSwnEpw60aO1aKti/lR8vpuXH0idPrP
 DtpFMaM913+zfteAiO0GTQ8i3B9Bpr1HP401+fhhLY0L/EbRY3EdBIi44cUjax0TtZgPhG3K
 hG332UuvNsZHuq9kmNhKmrJmRXv3G5rnY4nekYg2Y3a/pkVJZroZEC50QQKZ8cHUvBmfAaOd
 NzB8LR7us+SyLiU1nluABUsbuRd0V2NBKHTk8eg9eSwjhbkVtopnFotfA3rzMu8okwRIJD4P
 mBGqN0lKtWRstTVq5lAvwdKPHHRVDlcFbpCia/MF7nHKYINzbkrIP22qw84KWPdIYTxJU/tZ
 zdWDpjxCAPUnOrLffL8IxA8xjLTmn4dy/q0Nti659wvaC5bKb3MAWYIWpe0PeIkrE6OIn2Sv
 yzMJVZD7vINm31A7tE2AX4Rt17NWQeassIodw2Mmj+4v7jG8nPjKj2YfzTLL3iHXIPQWXkGE
 YOWzD1OYFu9UaudnjkgAXAen/kd0DllKgAVZTyzqw28swgJ4dMug8ahRCS/ceQMwBPtaQwYQ
 9fLdrc4+eGjFjz2VyNw3RiOxJbAEoQyq7nSWl2qQgDNF6xVb4Cvt6YaF1DxXfvHG45c+rmVC
 pk43hn86O+KJKdgQo4Dci8D26ch3wP4FWHUokbga/Gwcv+YJs3AtIHVcVKZET2Pi0wvTwvhH
 ZIaQcCSEOaPCjpk7+ZgJsdA/yaUcJ9jgetKct9smneqk2YmMEqShIgLnyTeP/SpTxraytfh1
 V3/aNaqqGHgyyTJWw2h/l9DEdBc12NALVNDB2MYaJdnryDQnA3cU66wRihzz0jcGvj8Esfwk
 jsNzedd/3wDl1BgXxAyarx/FRodmKSQlJoZhlBwP9APFWDnkw2/f6AZ6K13WfUUFcEz+0HGB
 zuYDcZIGpVtpqK/S/QvAzHOWQtx50oMOCYMa8qdKvL3GixbKeSk7sdIvNS9JF5Fdznv+MRS9
 iDcwuNID6QMZJx5yWl4lIefAVkongtlv3lnCD/5G+jxXglHL78Jk9lS7xzGaDU00HUA9KzlL
 N3gtI+sbHubiHfatuaxbrWaDAGABXJumKyR/wpr5cRna9ajsoFI7DrFR/zkFdA11ECCe2xsm
 U0aqFy+qrANY9iZNZ6QVMTwnMZ0PC0aHI2uQn3CNIkdV4jj3XnL8qEioC43YYHMwmknk/MIl
 GR/C1WwufdUwaC3bAcDbgsIW4+UjlL1F1SuMeDfZbXEgOkaqVq+0e7KGa0dNZmOeW4MIRVih
 Zx+NeTmeCLMwL+xQDLpDN+ZoZD6XyuT8/3IAWCH4dzgpCHEGXJpquh+8ioijjrDRO9dkQDnI
 VAMXUqUf4rsEhrsKQHlg6oSqL2pUo5k1xRpRFf/2SdpLSO0SP8BkFJMQrQn5NMeyJcW0L41f
 j4zQ==
X-IronPort-AV: E=Sophos;i="5.82,221,1613451600"; 
   d="scan'208";a="41933573"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YLj744lvqO0k7DCESA4MI4K02OvJyYQDDOoyF8ie3SPrV+JFrWVtbs/QC6KB6Slf/kRGNgGzFz/6yM9U+c/ERJmWRqiyBMCmpjQqLuMjq3+HqqdpwTFb4NcPIH7x2QZ/K0GxXqCk/kxnnKRwL83r7XV8/8ihX0Iv5HMo8WMqxOlxC8y5tOVBAUFQURS7R7fW1llpccgI/lniF3rOvZqcidgHfu+iySh+zP+DisS/bOJEbRU7M4+3WAe9CB/Su7NTQp/ROjXT1OWX0H4Tp1FvzY/L8pGFLv/tgI6I5V/dbJHE+maTOzPTKn+wZPRM7AEnCTM5dY7/2WnWxE/dmU+Htw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DHQa6crf7cGH4mh1WlCZfYVOL3ATOFCP7uJntZ8rqHs=;
 b=LpGgAm/aWWHBrJMWDcDaNXJMmoT/wK2DuLSxG4kTAhB/EjWMLYWJi4A01IUJKEPW7noiEFX2sEReh7l6H/XoABSycMt67YrlyZAm1M3PEr5RoAxNTEYpa6IqytO7YWka2PHwn/MAcO3d7r1anZ+h4EMDN10EhV2DItuE5KtWp/uvp0IVfXOKwFIomBsa8DSJE3uJuqMinyRsnIJcAn+zienxghTkXxML5skWnHmGImydV76c0hMYXT7lW5BI8aaxkmOkozJwKRB+qYQfbHsisdc/WOYIkuLST+QbZW7g3GnfGx2jO6o4aVXFPisXZUK/k5ZmH7/m7jZwUEhj/rZR2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DHQa6crf7cGH4mh1WlCZfYVOL3ATOFCP7uJntZ8rqHs=;
 b=qbWxaXQdeIwWMPzMQjN3yKXECe1l4AMFMe3/QHou8gMHz1fuaIvjjg3z4ojSUKKTqVdRpVLJSyqGa0ry5LKj4zcMNMT77iJ9Rcf7u6mpaG7aFVaD7GlTgsKn0ge6StrjFLrFzCbQerDau1gzzB9rWTuXJaCJWVr7dju0bU1ceCg=
Date: Wed, 14 Apr 2021 10:28:04 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Julien Grall <julien@xen.org>, <xen-devel@lists.xenproject.org>,
	<bertrand.marquis@arm.com>, Andrew Cooper <andrew.cooper3@citrix.com>, "Wei
 Liu" <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>, Ian Jackson
	<iwj@xenproject.org>, Stefano Stabellini <sstabellini@kernel.org>, "Paul
 Durrant" <paul@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Daniel De Graaf <dgdegra@tycho.nsa.gov>, Rahul Singh <rahul.singh@arm.com>
Subject: Re: [PATCH v2] xen/pci: Refactor PCI MSI interrupts related code
Message-ID: <YHanlHbEvzXHbQoj@Air-de-Roger>
References: <e4ca856b19d9128cae5f6aa4ace550ace17fd877.1617977720.git.rahul.singh@arm.com>
 <YHQlptvoC06rqNhQ@Air-de-Roger>
 <f7659788-ff1b-23dd-e838-b35ae8ef9e50@xen.org>
 <ca4bef26-0869-8a56-e96c-04d3b41ffcd6@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ca4bef26-0869-8a56-e96c-04d3b41ffcd6@suse.com>
X-ClientProxiedBy: MR2P264CA0096.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:32::36) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 809f86ac-dec2-4fe3-c083-08d8ff1f3cc5
X-MS-TrafficTypeDiagnostic: DM6PR03MB4058:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB405822C6CF469019121D6B468F4E9@DM6PR03MB4058.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SFClCKh7Ki1ZxlxsdkTVeE9l1AtmIfuTvwNct6ZXI7ZFmE34S6F6Nd/8UMgghdg+gPrRwB+onyJWMURvfoMaxHtHNreX6fpwf8rC/kS4DEy6uY295CZM5bUw0AcxV0OKZnWgxhEGHGi7dGv2BxKIggTRUeJi9ruXEYL9D+M9c4cPGkpg4We95UBELZvz/6PAp0ZGBm6rTYAk5XDXbvzCD7T4VCl/sg3DuhDqI4UL01VWS3+oDC1XNxAYSWDWGpdj2gOqLS3aEKnRTEzgyc9bBlQrN88nMlSfzXh4ljO/kamAg427VyQg6rU9Z1bIsB1l4dl88LgnlFmTNesMniZHfhrkc/xTl/4FAeWcjNBgaHKy6mQI7PuzsuVDZzMRqoPYSC2ixqLpIAqT4bBAFXJlQhGVvuItWGAaZHLjtXtZRTB2rpcWs/3nsWLjK6Gd2iigFnC5VDnEHJAr7PvvQA4HtNKQVL5/Uq3qDn8uoCwfSOPhIsgKb7uM7eo4NL3Sdw+0U7G1N/I1loq44Ec8FEtzXbwCysmaukYfpWGFXhRZDlWcJESogCX0ooYICSsONW7ziuZvDNix6ttV3RPVmX+wGPp1DklOGHG3fuKdzX/RV6g=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(136003)(39860400002)(396003)(366004)(376002)(346002)(8936002)(38100700002)(956004)(2906002)(9686003)(186003)(16526019)(86362001)(8676002)(66476007)(4326008)(6486002)(6916009)(66556008)(53546011)(478600001)(85182001)(5660300002)(26005)(316002)(83380400001)(66946007)(33716001)(7416002)(54906003)(6496006)(6666004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?UjRqV3NoNmppcVdzR2xHSEU3eE9qVFYvZG55USt3QXhqeFpiZnpEdmhFUnhR?=
 =?utf-8?B?MUJtS0xpNWRrME1TdFp1NXRiUjdwK0sxWVErUDBnWWtMbDh0c1RtL1hFNUt3?=
 =?utf-8?B?MjMyL2s4V29hNWNCSWxCRmxzS2JkcDQ2QnM2andSU2pFNjhGSXNhZXd2a0JD?=
 =?utf-8?B?YjM2VFpjNFUzcHMvVVhqV3ZUd1UvWHpGT2ozdGZRcUhDQkc0NWZaNXJPMEcy?=
 =?utf-8?B?aC9ZUlAwdXovTEVRR2pvNENCSHRWcjBpVFNteXdBVi9zZnFpNGo0YmxaaWs4?=
 =?utf-8?B?SElQVnM4bTBJbDZDTklFa2lhR2RzVDV4ay8rNE9aS3pBNkhPYmdWR21FU3pu?=
 =?utf-8?B?Q2N5TEJHRHhZYTYzM0V4RmVHUVNSUVc1V0JhU2lCQnRFbTZNQVh4eGI2d1F5?=
 =?utf-8?B?VUxGQmxyUkhSaVBoV2pvTjJyRmpKTW05NmlOVUJBN0k5Q3FKcTZxcFA2TUs2?=
 =?utf-8?B?NlN4bExGWmNFdnZhZ2FKZXMxWFhBQUxuM3I0Y3JFRVVWZHpMN2x2WFpIMnFo?=
 =?utf-8?B?cWxlOUMvRGdKRS9sR3NBbTZQencxdUFDZGJyVzhlWVhSVmJlc1kzSVg1RDBu?=
 =?utf-8?B?RW9vZXRwNWpRem1uRFhPdUNneEJyNFhFVGROQmFoUFNIMG43VklybURPNmRI?=
 =?utf-8?B?YXcvWmt1cFFHclJsd2htNUUzKzNUaG5hRE5pclZ5YmtQRllNVUZSL0pYN3I2?=
 =?utf-8?B?U0JzcWkyczNYLzVkaGx3TDJuTUc2YU5MRHhmMnRFQm1kTlhrYWcvRnkzRzBa?=
 =?utf-8?B?amkzd3RTWkJNNkU2MGtUSWp3WVlVN0pVdEZnbEsrZ2pTcVdzVkF4dGpGS1A0?=
 =?utf-8?B?UTl6aXg4VmJJSlVyV2Q4bmltQlRBTSs5OWtjNTRHVHA1cnRjbVAreTgzTXBG?=
 =?utf-8?B?dUhGWTJOV01aSFc0ejlEV3pPbUxlUG40Sng4TUVHb1dvMzFsTFZTZGlHeDdF?=
 =?utf-8?B?U3d4aFo5cFlBMW4vNWM2bVpiMXdYRitlb0tnTVBuYWpZeW00QTI3ekdYZk0x?=
 =?utf-8?B?VVNFSW5FZUtjQ0lWdlhaa1RMaW8yeUYyZTFKZ3hYWnZNbEJ2U0ZlN0xUVmlj?=
 =?utf-8?B?M3BubkFvbWxXQlJvV0Ryb1F1MHpoQzI1NndPREJQNEtiVkZvdkg2bG9SNjM2?=
 =?utf-8?B?dnJ2MHRaZjhCTVNWK0NXVlhxWGxYY1NTTnZSZU56M2VBVXo3WDR0bk5Hd1pB?=
 =?utf-8?B?VmlxMjdPVUo3a0kwSkEvSEpSdEpDaUI3Qzdma08rTG1rUnZzZEwzbWcxdGd5?=
 =?utf-8?B?UDBtcEFTUWJSb0ROUE9OSDhQeGlEZndya2lHbW95Mmd2bDQxZ3dyMjZ4aVNp?=
 =?utf-8?B?UUJpeXpkcDlpL2ZUa1NZN1A0dlcyRHowQWhDcTZDcHFLTU5UQ3VIbFU4L2pq?=
 =?utf-8?B?eC8vbVVsc1hScDVOdXo3dVNETzlwSXFpS3RWT0JhWEtIM2lmNk8wdFp4SWVW?=
 =?utf-8?B?UHhEU1c1ZmE2Nzh3OEIvbExObTBaeHNHaEZNa01oN1pCT3U5U1I3bkJuUmh4?=
 =?utf-8?B?R1BMeVdwRXorVDFLQ2piaHVjRmVGSUlvQVhhS2VNWTB1alp4d2NhU282SDZC?=
 =?utf-8?B?UnFFS1JDVHZLSEluc0toK2lZT1liWWZnaEZXUjZoQlBDeXU1b2FuSGI4cytZ?=
 =?utf-8?B?LzFoVkJ5aEVIL0t4QnBRQTRMSTl4eUVEL2M3U2lwQ2hGcVhoUzZNSS9YNkhS?=
 =?utf-8?B?UzYxcjQ1STNNU2cxNUx6bENlbnpJN0xyTFVGazJnc2VpTkFCcGlxOUVrYzRT?=
 =?utf-8?B?VEJzMXVUOUdtTlgxb2hmSXBWWGpWckdCb2hndm4rR3c3WTF4WXNxc3hNTmFK?=
 =?utf-8?B?TGxNcVp5dzA4a21nYjRuZz09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 809f86ac-dec2-4fe3-c083-08d8ff1f3cc5
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2021 08:28:10.3339
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dogbcU7Z9SkyFifA0j79gBt2CadP8TLfZxJfVmWilCh5CpHJhSaXU0WuNu861JcfvWJn3BtxVQ/JRomNiO7TCg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4058
X-OriginatorOrg: citrix.com

On Wed, Apr 14, 2021 at 09:08:53AM +0200, Jan Beulich wrote:
> On 13.04.2021 19:12, Julien Grall wrote:
> > On 12/04/2021 11:49, Roger Pau Monné wrote:
> >> On Fri, Apr 09, 2021 at 05:00:41PM +0100, Rahul Singh wrote:
> >>> --- a/xen/include/xen/vpci.h
> >>> +++ b/xen/include/xen/vpci.h
> >>> @@ -91,6 +91,7 @@ struct vpci {
> >>>           /* FIXME: currently there's no support for SR-IOV. */
> >>>       } header;
> >>>   
> >>> +#ifdef CONFIG_PCI_MSI_INTERCEPT
> >>>       /* MSI data. */
> >>>       struct vpci_msi {
> >>>         /* Address. */
> >>> @@ -136,6 +137,7 @@ struct vpci {
> >>>               struct vpci_arch_msix_entry arch;
> >>>           } entries[];
> >>>       } *msix;
> >>> +#endif /* CONFIG_PCI_MSI_INTERCEPT */
> >>
> >> Note that here you just remove two pointers from the struct, not that
> >> I'm opposed to it, but it's not that much space that's saved anyway.
> >> Ie: it might also be fine to just leave them as NULL unconditionally
> >> on Arm.
> > 
> > Can the two pointers be NULL on x86? If not, then I would prefer if they 
> > disappear on Arm so there is less chance to make any mistake (such as 
> > unconditionally accessing the pointer in common code).
> 
> Alternative proposal: How about making it effectively impossible to
> de-reference the pointer on Arm by leaving the field there, but having
> the struct definition available on non-Arm only?

We could place the struct definitions somewhere else protected by
CONFIG_PCI_MSI_INTERCEPT, but I'm not sure that would be much
different than the current proposal, and overall I think I prefer this
approach then, as we keep the definition and the usage closer
together.

Maybe we could slightly modify the current layout so that
the field is always present, but the struct definition is made
conditional to CONFIG_PCI_MSI_INTERCEPT?

Thanks, Roger.

