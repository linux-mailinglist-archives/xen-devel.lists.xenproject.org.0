Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B8B5A4F2B6C
	for <lists+xen-devel@lfdr.de>; Tue,  5 Apr 2022 13:10:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.298733.509010 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nbh4Z-0006cn-AE; Tue, 05 Apr 2022 11:10:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 298733.509010; Tue, 05 Apr 2022 11:10:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nbh4Z-0006Zc-6u; Tue, 05 Apr 2022 11:10:07 +0000
Received: by outflank-mailman (input) for mailman id 298733;
 Tue, 05 Apr 2022 11:10:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0KMS=UP=citrix.com=prvs=0874ecad3=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nbh4Y-0006ZW-I5
 for xen-devel@lists.xenproject.org; Tue, 05 Apr 2022 11:10:06 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f1606ae5-b4d0-11ec-a405-831a346695d4;
 Tue, 05 Apr 2022 13:10:05 +0200 (CEST)
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
X-Inumbo-ID: f1606ae5-b4d0-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1649157004;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=Ei8yoeKvYI0m9hANnQYNtTOzSR3ITuGRE/zEji92RoU=;
  b=EMWm6vuVD26b7LYcoUT2FdjhMeKWZibAE4AA9ACY9WZKOqdkSd3Clqus
   cw2aAc21//TWJpZSYiEkLJ3OccmsVzPrNcOjR0JEeS+tkqQI35/MzsdEQ
   A/FKkuzdAA7CtpghOaOg7B7K4RZm01EJb6rKDFHCO7wZLrN7MCxb1xPSx
   I=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 68031898
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:OVDVUqPLIMsFwu7vrR23l8FynXyQoLVcMsEvi/4bfWQNrUpwgTEDz
 2EeD2vUO63eazb1Ktlxboiw8R5X6pPXndZnQQto+SlhQUwRpJueD7x1DKtR0wB+jCHnZBg6h
 ynLQoCYdKjYdleF+lH1dOKJQUBUjclkfJKlYAL/En03FFcMpBsJ00o5wbZl2tMw2LBVPivW0
 T/Mi5yHULOa82Yc3lI8s8pvfzs24ZweEBtB1rAPTagjUG32zhH5P7pGTU2FFFPqQ5E8IwKPb
 72rIIdVXI/u10xF5tuNyt4Xe6CRK1LYFVDmZnF+A8BOjvXez8CbP2lS2Pc0MC9qZzu1c99Zw
 ZZElMKyQxkTPPOQt+I0WSFKLxBCIvgTkFPHCSDXXc27ykTHdz3nwul0DVFwNoodkgp1KTgQr
 7pCcmlLN03dwbLtqF64YrAEasALBc/nJo4A/FpnyinUF60OSpHfWaTao9Rf2V/cg+gQTa6FP
 ppIOVKDajzDUhl0ZAwuL6s4xuGLn3y4dz0flmqK8P9fD2/7k1UqjemF3MDuUsyHQ4BZk1iVo
 krC/n/lGVcKOdqH0z2H/3mwwOjVkkvTR4Y6BLC+sPlwjzW7xGYeFRkXXluTuuSihwi1XNc3F
 qAP0nNw9+5orhXtF4SjGU3jyJKZgvICc9MTGsxk6guT8KiKvymfL2I8XAJwVMNz4afaWgcW/
 lOOmtroAxlmv7uUVW+R+9+okN+iBcQGBTRcPHFZFGPp9/Gm+dhu1UyXEr6PBYbv1rXI9SfML
 ydmRcTUr5EaloY12qqy5jgraBr898GSHmbZCug6N19JDz+Vhqb4PORECnCBtJ6sybp1qHHb4
 RDofODEsYgz4WmlznDlfQn0NOjBCwy5GDPdm0VzOJIq6i6g/XWuFagJvm0vfB0xbptYImO1C
 KM2he+3zMUOVJdNRfUpC79d9uxwlfSwfTgbfq68giVyjmhZK1bcoXAGib+41GHxikk8+ZzTy
 r/AGftA+U0yUPw9pBLvHr91+eZymkgWmDOCLbimnk/P+efPOxaopUItbQLmghYRt/jf/m04M
 r93aqO39vmoeLanOHOKrtdPcwtiwLpSLcmelvG7v9Wre2JOMGogF+XQ0fUmfYlklL5SjeDG4
 je2XUow9bY1rSevxdmiApy7VI7SYA==
IronPort-HdrOrdr: A9a23:NRgmeqENDFM52XcIpLqFSJHXdLJyesId70hD6qkvc3Jom52j+P
 xGws526fatskdsZJkh8erwXJVp2RvnhNBICPoqTMiftW7dySqVxeBZnMTfKljbehEWmdQtrZ
 uIH5IOauEYSGIK8PoSgzPIU+rIouP3i5xA7N22pxwGIGEaCJ2IrT0JcDpzencGHjWubqBJc6
 Z0k/A33gZIDk5nCPhTaEN1OtTrlpnurtbLcBQGDxko5E2lljWz8oP3FBCew1M3Ty5P6a1Kyx
 mHryXJooGY992rwB7V0GHeq75MnsH699dFDMuQzuAINzTXjBqybogJYczBgNl1mpDr1L8Zqq
 iKn/4SBbU015oXRBDtnfLZ4Xil7N/p0Q679bbXuwq5nSWzfkNFNyMIv/MpTvKe0Tt8gDg06t
 M544rS3aAnfS/ojWDz4cPFWAptkVfxqX0+kfQLh3gaSocGbqRNxLZvtn+9Pa1wVB4S0rpXW9
 WGzfusk8p+YBefdTTUr2NvyNujUjA6GQqHWFELvoiQ3yJNlH50wkMEzIhH901wuK4VWt1B/a
 DJI65onLZBQosfar98Hv4IRY+yBnbWSRzBPWqOKRDsFb0BOXjKt5nriY9Fqd2CadgN1t8/iZ
 7BWFRXuSo7fF/vE9SH2NlR/hXEUAyGLH3QIwFllu5EU5HHNc/W2He4OSITeuOb0oEiPvE=
X-IronPort-AV: E=Sophos;i="5.90,236,1643691600"; 
   d="scan'208";a="68031898"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W2I+W7m3FXK7o6eGHMPPuE5oHVPcdECw3mUBmf4e8535CS+TiofFqOtdh2PufE+hTWquDvUbiEQkjGcKOyahdSUY4YMZlYPhyM2WuoIpCFAH40n20lRyRqFoAppm5de7Wk1NiZRjsz1YXSF6YHGu2oLlcS3MJZYMMZRX7eVZOqizNKWDmRb/IKZIcr6G88qJUQbk+x5wMmta3Ic30ByvdmYkRFYN5lcGZmJE5vgsJsLIN4A/y4xKPOEamfRrZ2lqAi69VxCD/1stGbA6vv9F2m5QCCyGott8O5lOeaB5NU1DQ/y/pFy2K3IK7bPG/IAPT7qWTguWwz7UhXKidC7Xcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ei8yoeKvYI0m9hANnQYNtTOzSR3ITuGRE/zEji92RoU=;
 b=N2EvSqXAASNaGTd373cmBhYa5PMp6M4jCe+h2yApEAoXcuhmBH9Bn+KdlL1XyL6eMLKErUsSGp2AzhTiZf6t/s1+a5FZYNk9ffDqVHu32Up7OYdlxz3UVGcFAy/Fobxsebgha6m9kuIbADqKH+n0E8ldzwuqT1RRlHWGaER5l57f4UYiX/BQOGyj7ivc2VMbYtvITx5QRFTNk1X0xzPI2EiAssqH4EK+MfxF634EnzQCQ90cGKdIyl2CUZT5ElP1vEyDEgD++yPSwBmJjJEW4+95Va4LZbZKAow2iEd5xA0OMWUXGURkxQ1mxcKVrBA6r5PBKIwi601miEbolzNLtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ei8yoeKvYI0m9hANnQYNtTOzSR3ITuGRE/zEji92RoU=;
 b=uLH6lIBMLMpj62F58oV2ezKF41oWNVL5U8jFndO9LpBIHfKSepifGuGfKsfzeO01VkT0w5sRKMRRzD8nipqIZTzx5E8DGSux5adZMT2aw8ZMvVewG75UsBe7zpQGYwG6DMVqQ1n+NRUDAfIPyetPJ7Ho5PIOoz8Ve90BFgzglog=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Wei Liu <wl@xen.org>, Anthony Perard <anthony.perard@citrix.com>, "Roger
 Pau Monne" <roger.pau@citrix.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 1/2] tools/firmware: fix setting of fcf-protection=none
Thread-Topic: [PATCH 1/2] tools/firmware: fix setting of fcf-protection=none
Thread-Index: AQHYRdaC1Ty1lDbR3E6vxjqdlx39GKzbI4SAgAAExYCABfjsgIAAC0sAgAABkQCAAAGdgA==
Date: Tue, 5 Apr 2022 11:09:55 +0000
Message-ID: <f14a8c34-7dfa-5ee4-57cd-7203fbec2d17@citrix.com>
References: <20220401143720.23160-1-roger.pau@citrix.com>
 <20220401143720.23160-2-roger.pau@citrix.com>
 <e20b3d17-0c2a-b23f-d949-667072a54f58@citrix.com>
 <ed31e78b-087e-869b-8aa0-5d5d0f3183fd@citrix.com>
 <75bd55fa-d29b-d49e-c3db-1bb952e4578f@suse.com>
 <4a425427-275f-e116-66a9-78e0bfc1be36@citrix.com>
 <7e2f17b2-8e54-ea9d-0a20-b49fb5ddf98c@suse.com>
In-Reply-To: <7e2f17b2-8e54-ea9d-0a20-b49fb5ddf98c@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 45fb3b3d-728f-42e0-4335-08da16f4d0fa
x-ms-traffictypediagnostic: BYAPR03MB4053:EE_
x-microsoft-antispam-prvs: <BYAPR03MB4053DD68B4CBE58062B6CE2FBAE49@BYAPR03MB4053.namprd03.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: C6QKpJ9R3GQZlgDPCznGWXiWZFFaCxhNv475cqphTTK3PnM86oPrx/S+pHV+VlKC8tdWnq9ip8DDkSU3rgUcFoXgquS8qHKP0QSTe5jtp3lJZroawc9mNy5gNBfJr5XzMCK20joYWwHa96XJaUGmLZX+wgQQoB+78TIaZ6mt1MzL0dWPKvSTdKVpt7NPJOsXSYVV7+CijipS/ojgKbirea+jhZ6sC+M3ToPREOjZ1g2RgqIVKW+WmfA+UfOZcYckFgA/pbGWX5rVq97cnOS/xaz0hY4l8KnwwYxyBYijdScAgWq99oskY3/vUDkHU2PFUOenmvGqJxbWMZZiJPwCgEFc/H4jwNHLZaCaTDKjw4IDDJ7+7E3Ft3xccPV/iotWMp5GoaWzqPVz7WZI9Rdndak7gea1siYv5Ua7aSId/a06vlIKEk1ZAO8P5F4t9PzBB/7jdR8qPUOlwYWedm8eo1bKo9Xv+/29EBpOxc+3slBeeM7Wa5N+OyVA+bq2oYUys6Ibya0lhG7KeC1/gQ0xv3RqUiucw7NnIM/HyOqww0vzoZMVA+E/9SWErJes4mYySnOaT0Oky4KQtCEJcOeNV6xIzPeXVSZqdDaR7mOQ1FlipMp1TJqEGrQty3jYwFq8iXMuO6MaPCcmM/fQJctsf+42DX5YBnTkDl0lUv4mXJU6AAPetNoyQORWAVPMY+H1JavZwh1kV7e6EBMWbWcJMiDfbGlGQrNXQmOxssjifZxwE++0KXmDjqjs666gbYyca3PwxAIYiTvdfNzBeaEuFw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(4326008)(8936002)(71200400001)(5660300002)(36756003)(66446008)(66556008)(64756008)(76116006)(66946007)(66476007)(82960400001)(6506007)(508600001)(91956017)(53546011)(6486002)(6512007)(6916009)(2906002)(316002)(26005)(2616005)(38070700005)(8676002)(38100700002)(54906003)(31696002)(186003)(86362001)(122000001)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UzI0Ujk0RVJDYXNIeFVyM2NuUzh4ajNtbmVvUjRIOXdBVHluYzFsUS8yYWsz?=
 =?utf-8?B?MjFSdkQ0RVp0cFdhQThSdkZibVpuOW9JdktIb2x6YThCZWRLZVQwanhmdDQ4?=
 =?utf-8?B?cS9IRU1nV0E2ZmRaZEIxNEtEcFVpRDdYQk5SZTczeHM0OWV1eDNPdTYveTR5?=
 =?utf-8?B?STJoYnVXU1R6bmJSendMLzZiaTdkOWtnVTdQbVlDUVlncENhcEdXL25xa3Nl?=
 =?utf-8?B?b0hIWC81a0dMellCTTUrLzNpTkdteFdqL0x5enlGcUVDUElzejNHZ2JoU25r?=
 =?utf-8?B?SVNPcjlRTTcxVzc0dmZMbFJNbGk3REMvVkNlbjV3ZCtGV2JBNlBEQzFVUFQ4?=
 =?utf-8?B?K1lUWGg3U2NFVnR3Z2hmRDF3UER6d000dDZxWkFjQWZOSzBnVmFtL1dmTUI4?=
 =?utf-8?B?Q0NXYWx6Y1loS2t5SmlRUldzdHNNL3FXTGQweXdkZ1hReC91dEp0OTJzU3Z2?=
 =?utf-8?B?dVpZTjBWYmRMeG1zY2xjNy92N1JwRDRUQWF3R0paaGU0eTVpZlVNK3UyU2dB?=
 =?utf-8?B?bHpkZ1V6R3FtVFpkWURVMndacjltV0QrcGJZU2U0UFcySkUrMFlKWEpubHps?=
 =?utf-8?B?NW9UOEVMaWZENTBGVkJzUzVpS2laNEdJeXZsQ3ROTER5NHlDV1VmSjFXQmJE?=
 =?utf-8?B?VnNYK0FINUFPdnI0M0FUeEFRRXpvVlIrWlVHUnZ1SThDc01KQVVjTW1UQVc4?=
 =?utf-8?B?WjdTSzBrMENyd3pHVjBLVVBWTnlRY2RQVkM4dzVwZ1piV014ZnZVdVpXektz?=
 =?utf-8?B?c0lmeU9lKzJ5QWIybWFsVVdpNGg3ekZsTCtpZWIwUW5ST1g1SGJma0ZvZUs0?=
 =?utf-8?B?SzZWcFdCV3F0Tzdpelg4djkrdWVzWUNuRk1DUG0vSTZ6aVZJWjV3bXpuTUEv?=
 =?utf-8?B?MjdNYjN2ampIVWpWT1hsM2RDTVZwaVFKT3hUWHBqMmFOU25FMzVIRW9VcWRO?=
 =?utf-8?B?dTMxaXVTUUM3QitzOXhpNm9CL3EvRFF5bzMxdnpPVnlNMEtSakNFeENpbklQ?=
 =?utf-8?B?dmtWZVBxcGxTem41L29uVDlLSnZkSnJRRENsOWEzc0tBc01EUCtHNGZpUHR0?=
 =?utf-8?B?Tlh1Ni9yQ2h5aFFQMTdKWXdDNFo4Y0hKa0ZQZDQ2STVCNHlCTktvVU9ISXp4?=
 =?utf-8?B?cU02QXZkSUVSNnZDc05VaERqTjBkbFRVRFhTdHpaMFUvelFhUHFKOFhoSUdF?=
 =?utf-8?B?WkRqWDltSmd4OTgrRStwNlJKYVNaenFVcWRSYW9JcVQybUdhN0ZpVXpTUkxa?=
 =?utf-8?B?SjQ0bENlZzVaRnFWQ3UwbzRzRmdIWG9ZbDV4QU5GYTM2eXJTSFBiK2hyZXhp?=
 =?utf-8?B?eDRldmV4akdsaktpOCtsU2JaU3dpclFGeVQ0RjRZdWhsVy9ScDFLSHFhWWx4?=
 =?utf-8?B?dTZ2ejF4aWhFZ0dmWm5rQVIzQmo3NEdPZFUvTEtPRFJyZlFQTzQwcnNsQ3k1?=
 =?utf-8?B?bFBjNWFDQmJVdTZTMFNwMk9tOGUwemxKV3lVQzJvcktRM0VWb3pIYjliNWJW?=
 =?utf-8?B?SnBYVGRQL3NsbSszZ2JBREovTzlVUDVKdXFSMGJxZjl1M0VXMDFCa2xDTTIz?=
 =?utf-8?B?dmg1b2h2QlYyTkcvOGJsL2UvUWRiVDA4L21jekk4WjN4eGt0M2w1dVkwNFlp?=
 =?utf-8?B?UHpQMHY1RVg2bGNOVGxKcVFZK2k1Znp4RGVVb3VEUE5XTTJWQzJqdklyRXQ3?=
 =?utf-8?B?OW11WTdTYzZYSGZEQ3I1TUF0Qm40ZStCT0tBdVo0dHBkdHpwL1FDYmFDdlNv?=
 =?utf-8?B?QS9XY1dyOERZVko4YWtIQjMzVUwxY01oMmppbzUyMTFha2FES1hocnpIZ1RI?=
 =?utf-8?B?dFlpbE45allQV0orS1VtSStZWG5XUDlQOCtZN1lYU3FmQTZQTTM2RjVNK2V6?=
 =?utf-8?B?MHY1WXRUbXFOUDBvWCtHMDVxbWdKcmszRHcvU3ZQYWdDVDg1amNsOHVIU3JO?=
 =?utf-8?B?TkFUd1ZyL2c3WkNJTHpkM21NZU13Qk1CU1hFVko0bWNkSTJlOUFWQitpc1Vi?=
 =?utf-8?B?dG1tVmxkNjBBcW8yV0RoMHdwZ2kyMlJDM094enRqVHBuWW5oNExML1JDRDk2?=
 =?utf-8?B?V0dKRjkya2hQcm1jdEJtbEVHNXdSaHZOS3J6azlFdEZIQkVWM1d2V2R6M3F5?=
 =?utf-8?B?Y2dRaW5nNkhPd2NUaFduUi9lR3lnTXc4dm5xbTFpdlJGWEY2cVF0NWRBUkZx?=
 =?utf-8?B?VTdKTE5lR3FOd0gxdmNFZjdnTlJ3WVBnaGxOdEJKaVJsSFJlaWRDdUJ6ekd4?=
 =?utf-8?B?ekp2NjFTKzhxTzZrZHo2NXQrREJFdXBDQzBhdXRxcGV4bDRMUjNWa0s1YkFO?=
 =?utf-8?B?RmlXWTlEZ1RxRFg4L016YXRTb1RzcTlnNUdadEdhWVJ0blNTYU9PZz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <20DBD78B44D1FD42B5F0208E0BC3100C@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 45fb3b3d-728f-42e0-4335-08da16f4d0fa
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Apr 2022 11:09:55.9146
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QHOJfAiLICxgpUufv4Ap3HeL4a9cQUE2DywmcoiNSZjDqSQddt7foJl4H4bMVEb962b6zLLWO7xeymkNuPGXd7MyfjiNGe6N4q4Eay1XO0Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB4053
X-OriginatorOrg: citrix.com

T24gMDUvMDQvMjAyMiAxMjowNCwgSmFuIEJldWxpY2ggd3JvdGU6DQo+IE9uIDA1LjA0LjIwMjIg
MTI6NTgsIEFuZHJldyBDb29wZXIgd3JvdGU6DQo+PiBPbiAwNS8wNC8yMDIyIDExOjE4LCBKYW4g
QmV1bGljaCB3cm90ZToNCj4+PiBPbiAwMS4wNC4yMDIyIDE3OjA1LCBBbmRyZXcgQ29vcGVyIHdy
b3RlOg0KPj4+PiBPbiAwMS8wNC8yMDIyIDE1OjQ4LCBBbmRyZXcgQ29vcGVyIHdyb3RlOg0KPj4+
Pj4gT24gMDEvMDQvMjAyMiAxNTozNywgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOg0KPj4+Pj4+IFNl
dHRpbmcgdGhlIGZjZi1wcm90ZWN0aW9uPW5vbmUgb3B0aW9uIGluIEVNQkVEREVEX0VYVFJBX0NG
TEFHUyBpbiB0aGUNCj4+Pj4+PiBNYWtlZmlsZSBkb2Vzbid0IGdldCBpdCBwcm9wYWdhdGVkIHRv
IHRoZSBzdWJkaXJlY3Rvcmllcywgc28gaW5zdGVhZA0KPj4+Pj4+IHNldCB0aGUgZmxhZyBpbiBm
aXJtd2FyZS9SdWxlcy5taywgbGlrZSBpdCdzIGRvbmUgZm9yIG90aGVyIGNvbXBpbGVyDQo+Pj4+
Pj4gZmxhZ3MuDQo+Pj4+Pj4NCj4+Pj4+PiBGaXhlczogMzY2N2Y3ZjhmNyAoJ3g4NjogSW50cm9k
dWNlIHN1cHBvcnQgZm9yIENFVC1JQlQnKQ0KPj4+Pj4+IFNpZ25lZC1vZmYtYnk6IFJvZ2VyIFBh
dSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPg0KPj4+Pj4gQWNrZWQtYnk6IEFuZHJldyBD
b29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+DQo+Pj4+IFRoaXMgYWxzbyBuZWVkcyBi
YWNrcG9ydGluZyB3aXRoIHRoZSBYU0EtMzk4IENFVC1JQlQgZml4ZXMuDQo+Pj4gSSBkb24ndCB0
aGluayBzbyAtIHRoZSBiYWNrcG9ydHMgb2YgdGhlIG9yaWdpbmFsIGNvbW1pdCBkaWRuJ3QgaW5j
bHVkZQ0KPj4+IHdoYXQgdGhpcyBwYXRjaCBmaXhlcy4gSSBoYXZlIHF1ZXVlZCBwYXRjaCAyIG9m
IHRoaXMgc2VyaWVzIHRob3VnaC4NCj4+IEluIHdoaWNoIGNhc2UgSSBzY3Jld2VkIHVwIHRoZSBi
YWNrcG9ydC7CoCAoSSByZW1lbWJlciBzcG90dGluZyB0aGlzIGJ1Zw0KPj4gYW5kIHRob3VnaHQg
SSdkIGNvcnJlY3RlZCBpdCwgYnV0IGNsZWFybHkgbm90LinCoCB0b29scy9maXJtd2FyZSByZWFs
bHkNCj4+IGRvZXMgbmVlZCB0byBiZSAtZmNmLXByb3RlY3Rpb249bm9uZSB0byBjb3VudGVyYWN0
IHRoZSBkZWZhdWx0cyBpbg0KPj4gVWJ1bnR1L2V0Yy4NCj4gT2theSwgSSdsbCBhZGp1c3QgdGl0
bGUgYW5kIGRlc2NyaXB0aW9uIHNvbWUgdGhlbiB3aGlsZSBkb2luZyB0aGUgYmFja3BvcnQuDQoN
ClRoYW5rcywgYW5kIHNvcnJ5IGZvciB0aGlzIG1lc3MuDQoNCn5BbmRyZXcNCg==

