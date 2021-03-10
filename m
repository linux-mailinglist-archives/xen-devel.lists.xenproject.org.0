Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BDD25334756
	for <lists+xen-devel@lfdr.de>; Wed, 10 Mar 2021 20:02:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.96266.181990 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lK466-0004wf-3M; Wed, 10 Mar 2021 19:02:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 96266.181990; Wed, 10 Mar 2021 19:02:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lK465-0004wG-Vg; Wed, 10 Mar 2021 19:02:17 +0000
Received: by outflank-mailman (input) for mailman id 96266;
 Wed, 10 Mar 2021 19:02:17 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=a8M+=II=xenproject.org=iwj@srs-us1.protection.inumbo.net>)
 id 1lK464-0004wB-Qx
 for xen-devel@lists.xenproject.org; Wed, 10 Mar 2021 19:02:17 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8a0f7698-1014-4959-bd1a-5b8f3ad4bc32;
 Wed, 10 Mar 2021 19:02:15 +0000 (UTC)
Resent-Message-ID: <24649.6066.185913.382873@mariner.uk.xensource.com>
Resent-Date: Wed, 10 Mar 2021 19:02:10 +0000
Resent-To: <xen-devel@lists.xenproject.org>
Resent-From: Ian Jackson <iwj@xenproject.org>
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
X-Inumbo-ID: 8a0f7698-1014-4959-bd1a-5b8f3ad4bc32
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1615402935;
  h=resent-message-id:resent-date:resent-to:message-id:
   mime-version:from:to:cc:subject:date:resent-from;
  bh=FFlPtTR2s1Hm7sP6trZ7Nj/AqG4KREClitErAm06bz0=;
  b=J3nd5a1PPeWS/pDQTLDQnk2vP+TAfQdP7E6dje+KZJA5iTCT5HkSuIU/
   b49ZpbsQF9nsmQIpEUSX5m4pOJRlqHNCrl48ozjyKKpRQB/TwFo5yGd56
   9GDSoigkVwvVbAqQye2CDYfG5xS80T0oEojPvL796VYSrBiPqZ/ff6apU
   o=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: CXeZT67ID9kz2v5+QvQdgV5d3MF/K+smadsnJnjN5DetGOZNgS7+bS404s8rxiQdYUwhnb7Vrl
 1hEmdCoiSzAd00pXtjHgotPNWz8wT5O/2otlWsIBHJcfMWVKurgtK5md7zeObMWiqW/8FrLuUY
 vQi8x8ikRV/Nc1Qf3IuoL7tYr+49zT4mzkhgsfZYFKiFGKNAr4QDfQzSC+m9/IHQcDX6kZaQlL
 PPO1LJPuuoHe6wUKj4XSl842QROXBbCQ+xtPntgmj27BEUOghPgT3KYaas0GhYtx/3gheoi8I7
 mME=
X-SBRS: 4.0
X-MesageID: 40403192
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.81,238,1610427600"; 
   d="scan'208";a="40403192"
X-Mozilla-Status: 0001
X-Mozilla-Status2: 00000000
X-Inumbo-ID: 318846c8-c861-43d1-ac69-d135625588d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1615394846;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FFlPtTR2s1Hm7sP6trZ7Nj/AqG4KREClitErAm06bz0=;
  b=a4H7pv7Tt31EwqpNoLhnoaNg5MvXZdTdVelQa+SLbFDYoXXEzLzWKMkZ
   feoBSfSpvfZnbXSFOSL+nYZGj49RaHSmHm7jLPYWC4gl4MmLbMkuwmCJj
   WF/5yWAUTOHt4SVCHL1RZPKiwLPJFuMm6ZvW84JHW6i5FHhWE+MJ13o6F
   A=;
IronPort-SDR: eq+k6QL/pN5/H6Qtg8hcNXGSxza6pH21qQBzNwYmfe9CT5QOweDHhPWH46BNM1sY9vVzb7LU+1
 rdY4suQG0AVw++AxdrBSv6b1mrmahAdOYhvFPVoxGraT3sgCxeTaFVyuoPslREgpYs/DCvaLT4
 5gqa/fI6j+K0TtQNxP1OLY2KQcQruEg3eoaxADdU4665ghR1CvnIysLz/VtuINU1KWeqGUvsRX
 Ada7sk6vRG/2zsFbxZtO2IqKSfd36FsCqiA6GhTRFwOq6Ub+r8eZEUuWnx459MHH9KLSh6LQmT
 S6g=
X-SBRS: 5.2
X-MesageID: 40390135
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:fS6H7a949CvUsfT34W9uk+EocL1zdoIgy1knxilNYDRvWIixi9
 2ukPMH1RX9lTYWXzUalcqdPbSbKEmyybdc2qNUGbu5RgHptC+TLI9k5Zb/2DGIIUHD38Zn/+
 Nbf6B6YeecMXFTkdv67A6kE9wp3dmA9+SSif3Dymp2JDsKV4hLxW5Ce2GmO2dxQxRLAod8OZ
 qH/8xcpyehf3N/VLXBOlAuWe/fq9rX0K/3eBJuPW9e1CCirxONrIT7HR+RwwsEX1p0r4sK3G
 DZn2XCl8eemt6hzBu07R63071zuP/MjuROH9aNjM99EESSti+NaJ56U7OP+BAZydvfkWoCq9
 XHrxc+M8kb0Rq4FQvU0HidqjXI6zoy92TkjWaRnHqLm72EeBsBF8FDiYhFGyGpjXYIgdcU6t
 Mu40up87BTDR/GgR3n4cnJWxxAhiOP0AcfuN9WoHpFXYQEbrhN6aQZ4UNOCZ8FWBn38YY9DY
 BVfYrhzccTVWnfQ2HSv2FpztDpdnMvHi2eSkxHnsCOyTBZkF1w0kNw/r1Uol4wsLYGD7VU7e
 XNNapl0JtUSNUNUK57DOAdBeOqF23kW3v3QS2vCGWiMJtCF2PGqpbx7rlwzvqtYoY0wJw7n4
 mEeE9EtFQ1Z1nlBaS1rdF22yGIZF/4cSXmy8lY6ZQ8kKb7XqDXPSqKT01rvNCnp9kZH83HS9
 e+MJ9bGJbYXCrTMLcM+ze7d4hZKHEYXsFQkM08QUiyrsXCLZCvluGzSoeSGJPdVRIfHk/vCH
 oKWzb+YO9a6FqwZ3P+iB/NH1fkekn1+4NMALHXltJji7QlB8lpiEw4mF657saEJXlpqaotZn
 ZzJ7vhj+edqXSp+33Lq0FkIABUAEoQwLiIaQIGmSY6d2fPNZoTsdSWfm5fmFGdIAVkcs/QGA
 lD43Jt+ay2KJSU7Ts4C82uN1+bi3d7ngPFc74s3om4oev1cJIxCZgrHIZrEx/QKhBzkQF27F
 tYZBQ8XU/ZHDP2gaCDhJgZbduvNeVUsUOOG4p5uHjfvUKTqYUKSmEAVzCja8KRnD0jXiFZnF
 F37q8ZjoeRgDrHExpAvM0IdHl3LEiHCrNPCwqIIL9Znb3mYylcZ2aHjz7ysWBERkPas2Epwk
 DxJyydfv/GRmdHsndDy6Dw7RdfbWOGZX99bXh8rKxwHWnLoWxIzOeOf6a/ulHhL2cq86U4Cn
 XocDESKgRhy5SLzxaTgi+FDmhj6ZM0PODRZY5TBo376zeIEsmvmq4HFfMPo8ogG9Dqr+MRUe
 WQPyWSNyj1Dus12wqT4lYpURME20UMoLfN4lnC6mP94VsURdz1C35iT6sAI96d43P/Lsz4p6
 lRvJYQh6+ILm71atS60qnZYD5IFwPLrQeNPpEVgKERmZh3iaB6EJbaWwbZzX1r3B0xK8HviU
 MVKZ4LkozpC8tKf8YIfThe8UdsvNOTLFEzugieOJ52QXgdy1vaNciO+bzGtP4GBVCAvhL5PR
 26/zdG9/nIGwuF2rhyMdN5HU1mLGw94m9l5uWMasn5DxirbfhK+B6CCUCGGYUtPJStKPE3tR
 Z149aBgu+ReW7Z4WnrzEFGC5ML1X2mT8O0CB+LAshS/bWBSBCxvpc=
X-IronPort-AV: E=Sophos;i="5.81,237,1610427600"; 
   d="scan'208";a="40390135"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RqaZc2eWDMIJc5pvts9t0QJ6eoHU8dYK5Qdo25jVxfvtCsO3ozUVuyBdnnS2Keo1jyCLDFqs0OltaX2IINrPdWljGax5UXMRgEgQJPGkC0z3rGkyijyEbe5dJarN8/YcXeePvp+D7tDTE3VhsLImPT3QvJGzdG7QouILJrdU0KrNZo00Ktl9xPMBYcuvOGUt80M1qeK1JT5WN/1fCEGMk/Pu6fXqQ4Ovot6wso8zYsX4DXOYPA8ZWgL+f6E2ePpHOJYzil54H5sKLWKuQXlqwCh0+RQo3veUoX9CMmabqW+W16XLSMvN2uZwzbu9BYioWW3L96lR2Gk6/t1M9P12xQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gmGLIOoT+DiOsrVphlt5lw1sE8UbvBvcFWORl/tmDbE=;
 b=E6v98V1lQbpVTZDqTVkCgaDWkCZOrKRmQTQ/aQ8ydE3ELKfnT2Hf0a+ZQ5TWyOeVSonSJeEDf4lEVdbg3HyZinC1XWG8dCcLbd9gFwVQ1ydp0ZcEyzxQdJ0THjL3vOclBVWWzPoPldSdUOYPULcDJB3nucMJIS7opcmLNJxF6p2ZU49a7NOTRfAWXnKqHqk/ZVPQjYBffYOf8QD00vdf3eXcjPBHj6Rlp8X39PkRFnGRc+sR56WRGxL15z7v5tSkxmvQNuy0p7oo/QwIw6QJH+4ATDFgjegUB6H0kdKaToW4yLSJEfyIXC4XIA40IkU8Sw2mk7T01bGi0d1IdRflmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gmGLIOoT+DiOsrVphlt5lw1sE8UbvBvcFWORl/tmDbE=;
 b=hfGrlJQhqqRTag3CdWs+XHdijxVxEFHDpplbdBXJPxFd+afQkZM7zWRN9Dj8i3w50vv8tiXERLk4bKYLXGtjeeLJ8c3TMMvHb+XSLckcrjx0lqIFw4fqAUo9FHGC9erIAC9yZNz11cWukV6GMwDDGoMV6sUmvCWBNSCS52+nRKY=
Message-ID: <YEj39oqZA0y/af0c@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
X-ClientProxiedBy: LO2P123CA0011.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:a6::23) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 80195b4e-25f4-42df-5f43-08d8e3e41b36
X-MS-TrafficTypeDiagnostic: DM5PR03MB3147:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR03MB3147C27AE9531AA10651B8E78F919@DM5PR03MB3147.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: P0y3beLBjYAf7e7ecpJKrQjf4WjOJ4SPok3vUdpbWinuSdk+ydcuTTSIaDrWtrf8MacJYnh/jXMLZb4vX4+PVztxJR1iqHFUT7aNMce9Puw+XsoPFPwx5A36zr57XBjKy8/EBGucxz2NRyAt9P9SHfz2E5ZtEa4O3Zo1oeD7nvK6fM7W4+gKZww6tb/NwNQMjZP81idG/eojh9MUebcISY7IxXoF1vkfVG5yFIGvw83CAB6I2DscHCnZJseAYgFURs0rTBkextezqT4Zs+XIYwGJeBHrGL/Kuw3AYxc/iXnTW73yn1STLHODfModt0uC6olrVYRZLdhL4/VoiZJaSvwUqeXCRPxi3DRBiXBF4ClOxPxfH6yCe+2X12TGvJOlG6aSyWjhEIY6ywonoq+GSp/e8PmsNLyW9l1+a4L2O9XWIsXhJCxGec1LqagNKyfi7imtyxdRL0ZPCiVQl6dOp9LUDsGcFRbCG99EU01JMRQagyJD55Ft8MaIl0q/AgIi077Xh3zqbVLmUl59joaMsRMIuK1HqSstfhIN7jBwJH68DpxQMmYPA1pCwno1yAoIvuDFxx1Fj4T/pheZO0ndxDcMB5calv9GU1lRazF2WzY=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(39860400002)(136003)(346002)(376002)(396003)(366004)(2906002)(316002)(33716001)(4326008)(86362001)(478600001)(8936002)(186003)(956004)(9686003)(54906003)(5660300002)(3480700007)(966005)(6486002)(6666004)(7116003)(26005)(6496006)(6916009)(66556008)(83380400001)(66476007)(85182001)(16526019)(8676002)(66946007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?RDgxbXlEYVhjUFQwUzZoTVZQc1V2cFBWTmc2cExmeVZrTVYxdTNwYUZNclQy?=
 =?utf-8?B?Z1lSVDVXTUNBdy9SOXNtMGNHQmNZamdsUG9BeG1MWTBUcHFJVkFNN1Z5am5y?=
 =?utf-8?B?Mk8xV2FWWTMzZXhDbVhYcGFvYWgybDJEdndxR0hjaU51ODdYRUdaZmNPU3lW?=
 =?utf-8?B?M2NrQjlHN096UGhnWjVEdkNZc0xzR0M0K0xEL1RSNDJqbHhCT2U1akRaTDh1?=
 =?utf-8?B?SStwS3lCSGlUdzV6QnczSkh2UHlWZUpDZ1ZORlJNMU03ZkhURFNzR3pqZjhC?=
 =?utf-8?B?UVRXYkRVTjBmQWpPKzNCYlBvdDF0ZDBnUks2UTV1NFptcmlSRzBSdDMxZkYx?=
 =?utf-8?B?bko3bTZmcnVIWllzMFpoUUgxOUpjQzgrWkVtTUgvK0NldjJZY1lkS3BIK0h4?=
 =?utf-8?B?bFhzMjV3RE95dHphT1IwVGIwL0pHRU51Mms4SElxejQ1aS9oVHc1dHpnSGJx?=
 =?utf-8?B?UmVaZVN6RElVWTdveXZTVjhxSGRXa2hxUGJwMWlGMEUrRjg2eGxkS2FCb2lj?=
 =?utf-8?B?cXdPVkVzTXlUazZLcmd4Yk1EZFoyL05wWDJxSUpZdVpJNjRlenZpMTY4NlJx?=
 =?utf-8?B?UEtjL0xNa25RcnduK1Azd05GSENieTZwNHRmSDNuUVlYSE5hZFJZQlB6ZXdS?=
 =?utf-8?B?NlNtd3gwbjZzVmVPWm1JMlNXMmI5Y3JsWWlNdlNvU3IxNHBCcTEwTGdCZ09U?=
 =?utf-8?B?VFgwK04rM0EyQzJWUG92aDRrWXpzMmMyR3Rjd0praTZZZDNMb3JJd2w3T1ZQ?=
 =?utf-8?B?QnV3R0NpVVJWWTU1WFczeW5rMlZNTTRPWFdvOEFtMUxKRG1IZFp4RExwTVk0?=
 =?utf-8?B?Yy83dEtvN21zWG9QeCtRM0NiQTBzRDBnME9NQUVKQ3RDR21uNmdEVmdOeWNr?=
 =?utf-8?B?VHFwY1c2TlMyNkdpVXp4Tkx6WmsvSkt5UXRkWVpLbzlwblBjcGluS3BXTnFt?=
 =?utf-8?B?NjN1aFd2V2VJc0NNN1RDL1lVYlpHemFnNHRHVDlVMWx2RWRGdTREZWpkMldz?=
 =?utf-8?B?ODhiU3EycHBLM2RnbkZ1VHRWRFArc01OMi9hR2xuWjN6NTdkV3MyKzU2ZEw1?=
 =?utf-8?B?YVZiVmZoWGJLckN3TlRYZVJDQWhBNktZY05pdDVZVkFYS2o3L2tKZzlpNDFR?=
 =?utf-8?B?WlRaSFpUbEpEZ1B1dU9lSGl1dnN5ZUg2cGp4bERLclBmdmNCYmN5NW9SRy84?=
 =?utf-8?B?Q0pscUZyNUFVMmtuOFY3a3M3dWJSU0NRUWtrK2lYbHV6WlFVWXFGTEoxaVph?=
 =?utf-8?B?V3dEclpPUVlMb0VaMFNQRGRScy9OaG81dmU5OHhiZGxOUUdwR1NmZDBLZUNR?=
 =?utf-8?B?cFFOOWxGOWFMa3FzYmo3QzZtOUltK25CTXlnSERvSHZoZUxodklJYTRaOW1h?=
 =?utf-8?B?T1ZLYU1wYWlnMnRyZmNHVFQxczlDeGdWL2FraG5MVm5RVVk0Q25aV040UDla?=
 =?utf-8?B?cnJXMjhQTmYvSHFNeXpMWWpXejBidGs1akIxYm9NV2VsL2hodXpHSXl5d0Vn?=
 =?utf-8?B?Z1FyUzBickRUSEs0ZmxUVG9PUXBoWUlmNjVzV293cHFZdVhxWDdDK2tSSTF2?=
 =?utf-8?B?NE11M2I1WEtjaVFzQWgvbmIzZC9lQUJUVkdCVHljbDd5U1czS0ZtUXlxNVMy?=
 =?utf-8?B?UTlLeXFqVkgrL2U5SUlKUFoyVHJPUzhxcW1XbEkzRDg0enZvOFd1eVhVUStT?=
 =?utf-8?B?Zk1DcjFzQmFqU0ExbVE3dGwzTGJRUmxsWXRON3dDS2FmcVFCTkJYZFRPakl3?=
 =?utf-8?Q?UQMI9B8AkqnI4+rd1Jy8KQWiyK3LfsPwr4Zt2kl?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 80195b4e-25f4-42df-5f43-08d8e3e41b36
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2021 16:46:52.2637
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cxjwRfOxh0mAqCYhMVKD7+1+7+NaKenr2I6mtXs6bMOD1uDumVrGX1FSWxiroM+1prJ0Xt5uVr2HYA/EmGiHmQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB3147
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: <committers@xenproject.org>
CC: Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <iwj@xenproject.org>
Subject: Remaining MSR wrinkles
Date: Wed, 10 Mar 2021 17:46:46 +0100


Hello,

There are a couple of remaining wrinkles related to MSR that I think we need to
solve before the release, or agree that it's fine to leave them as-is and
document in the release notes. I've tried to summarize the different views
below, sorry if I haven't done this properly or missed some arguments.

I'm sending to committers to see if we can find consensus on the path going
forward, or else to trigger a voting on the possible solutions, because
discussion on xen-devel seems to get stuck.

1. MSR behavior for PV guests without a #GP handler set: PV Linux versions <
   4.14 will use rdmsr_safe (and likely wrmsr_safe?) without having a #GP
   handler setup, which results in a crash. This bug was hidden in previous
   Xen releases by allowing unlimited read access to the MSR space.

   Jan has posted several proposals to address this:

   https://lore.kernel.org/xen-devel/7e69db81-cee7-3c7b-be64-4f5ff50fbe9c@suse.com/
   https://lore.kernel.org/xen-devel/d794bbee-a5e5-6632-3d1f-acd8164b7171@suse.com/

   Which all rely on the fact that for PV guests Xen knows whether there's a
   #GP handler setup and can hence prevent injection of a #GP fault if no
   handler is present.

   Andrew opinion is that we should instead try to figure out which MSRs the
   buggy Linux versions try to access and special case them. Andrew also raised
   the point that continue running with a 'fake' (ie: 0) MSR value might be
   worse than crashing.

   Part of the discussion has also happened here:

   https://lore.kernel.org/xen-devel/4da62f0b-8a08-dd84-2040-fd55d74fd85a@citrix.com/

   Look for the last quote.

   Another option is to document that PV Linux < 4.14 will require msr_relaxed=1
   in order to run. That as Jan pointed out will also imply PV Linux to run with
   a faked (0) MSR value instead of crashing.

2. RAPL_POWER_LIMIT: handle the MSR explicitly to make Solaris happy.
   Alternatively we can list in the release notes that Solaris guests require
   msr_relaxed=1. Andrew is working on a patch for this.

3. MSR_K8_HWCR: Linux will complain about a missing bit (TscFreqSel). Jan
   posted a patch to handle the MSR and unconditionally set the bit:

   https://lore.kernel.org/xen-devel/c91b190a-aaa1-d3b8-10eb-d8da7ad1f834@suse.com/

   There are concerns from Andrew about missing bits in ACPI tables and Pstate
   MSRs if this bit is reported as set.

For 1. I do agree with Jan than this workaround is likely the best option we
have, sort of resorting to request enabling msr_relaxed for all Linux PV guests
< 4.14. Whether we want to limit this workaround to the read side only I'm not
fully convinced. There's something nice about having symmetry in the read and
write paths, but if all the calls we have identified are rdmsr only I prefer to
leave the write path unaltered and request users to use msr_relaxed if write
issues are found later.

For 3. I think I at least need more details about the relation with TscFreqSel
and ACPI or other MSRs, and I haven't been able to find it on the PPRs I
looked.

Thanks, Roger.

