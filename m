Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DBD2621ADC
	for <lists+xen-devel@lfdr.de>; Tue,  8 Nov 2022 18:38:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.440392.694579 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1osSXb-0004WU-CY; Tue, 08 Nov 2022 17:37:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 440392.694579; Tue, 08 Nov 2022 17:37:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1osSXb-0004UY-9I; Tue, 08 Nov 2022 17:37:39 +0000
Received: by outflank-mailman (input) for mailman id 440392;
 Tue, 08 Nov 2022 17:37:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5OwR=3I=citrix.com=prvs=304cef38d=edvin.torok@srs-se1.protection.inumbo.net>)
 id 1osSXZ-0004US-AV
 for xen-devel@lists.xenproject.org; Tue, 08 Nov 2022 17:37:37 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 072e0c74-5f8c-11ed-8fd1-01056ac49cbb;
 Tue, 08 Nov 2022 18:37:35 +0100 (CET)
Received: from mail-dm6nam11lp2173.outbound.protection.outlook.com (HELO
 NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.173])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 08 Nov 2022 12:37:32 -0500
Received: from SJ0PR03MB5888.namprd03.prod.outlook.com (2603:10b6:a03:2d6::7)
 by SA0PR03MB5626.namprd03.prod.outlook.com (2603:10b6:806:ba::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.25; Tue, 8 Nov
 2022 17:37:30 +0000
Received: from SJ0PR03MB5888.namprd03.prod.outlook.com
 ([fe80::fc0e:731b:b539:94b]) by SJ0PR03MB5888.namprd03.prod.outlook.com
 ([fe80::fc0e:731b:b539:94b%4]) with mapi id 15.20.5791.026; Tue, 8 Nov 2022
 17:37:30 +0000
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
X-Inumbo-ID: 072e0c74-5f8c-11ed-8fd1-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1667929055;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=D/tqUZ8DclLQY6J1jbsoyCI+16ygZTKBiDCAKLhdM2k=;
  b=GtKk/mN8EtVGQj5cw5gjnDrMIl0nlGX4CP1/G+idHsIsOYNQvE+lJivZ
   7MeqP+EOMzKO1neNiw/CVTcXcv3QfGf6ysmP9/65bFIFPbIkljxZ1iG02
   PYsmgIcBVe/cHPrcqy1QoKqHoyRLX4tOXpaDBQQPf2Ojy9zqsFGPAXhgJ
   A=;
X-IronPort-RemoteIP: 104.47.57.173
X-IronPort-MID: 84411567
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:6SwgW6Ig5ZkAczm6FE+REpQlxSXFcZb7ZxGr2PjKsXjdYENS12ZVy
 mZJWG6PbPvfNDChLYokO9i//E5VuJKAy9VnHVFlqX01Q3x08seUXt7xwmUcnc+xBpaaEB84t
 ZV2hv3odp1coqr0/0/1WlTZhSAgk/rOHv+kUrWs1hlZHWdMUD0mhQ9oh9k3i4tphcnRKw6Ws
 Jb5rta31GWNglaYCUpJrfPdwP9TlK6q4mlB5wRuPaojUGL2zBH5MrpOfcldEFOgKmVkNrbSb
 /rOyri/4lTY838FYj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnVaPpIAHOgdcS9qZwChxLid/
 jnvWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I+QrvBIAzt03ZHzaM7H09c5QBTFXx
 fkmcwonLRaHu+O14eqaSshV05FLwMnDZOvzu1lG5BSAVLMKZM6GRK/Ho9hFwD03m8ZCW+7EY
 NYUYiZuaxKGZABTPlAQC9Q1m+LAanvXKmUE7g7K4/dopTGMl2Sd05C0WDbRUtGGW8RT2Fqfv
 GXF12/4HgsbJJqUzj/tHneE1rOTxHqmBt16+LuQ9/9IhnyKxTMpEzYzBHawhuOJlH+yVIcKQ
 6AT0m90xUQoz2SpU938UhuQsHOC+BkGVLJ4A+A8rQ2A1KfQywKYHXQfCC5MbsQ8s807TiBs0
 UWG9/vJCDp1ofuqQHSS3r6OqHW5Pi19BWMLeyIsVwYO5Njn5oYpgXrnUdJLAKOzyNrvFlnNL
 yuiqSE/g/AfiJAN3qDipFTf2Wvz/d7OUxI/4RjRUiS99ARlaYW5Zouur1/G8fJHK4XfRV6E1
 JQZp/WjACk1JcnlvESwrC8lQNlFO97t3OXgvGNS
IronPort-HdrOrdr: A9a23:4x/5K60HI+1yV9UApkAOnwqjBJckLtp133Aq2lEZdPUMSL3+qy
 iv9M516faGskd2ZJhGo6H7BEDgewKmyXcb2/hzAV7PZmTbUS6TXeVfBOjZskDd8k/Fh4xgPM
 5bGsAUYuEYT2IK6PoSizPXLz9U+rm6GdeT5Ns2oU0Acem3A5sQkzuRQTzra3GeDDM2faYEKA
 ==
X-IronPort-AV: E=Sophos;i="5.96,148,1665460800"; 
   d="scan'208";a="84411567"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R34EZeByEbuM7DVp+ehwM5QIQ2ArqsEmhGgbDAmH8nb9T2drNwAmxx0sxmtYNoe+PPMMmKboFxutGl/TFo/HG9vXUUuOa6MvtX1EYGWzEiRvGkFz7E6h8ynpOEHIEqomd2jC2fgMHNtSSyPoHu38QPb7M4iFBZTWqBUJ3PkiPKfEx0+kWOVUJYS5MZBT2uyMRhAKWrLpRzw2EePxn7uBP8DWQzurSPZTc18cqSBQnT3/4OM9K4QJeYHmqGlBh0suiVIzPXCYtBfpTALZe/sf7+SQVrThMYLMWJCz3ohrS+Vzd7U5Yqv75BeR2Lu4lhjhkTPCKuvN93mdjV4j4rrHiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D/tqUZ8DclLQY6J1jbsoyCI+16ygZTKBiDCAKLhdM2k=;
 b=h1WRpYhcOFgSnfsBsx+5LxwXSwd1H4SszrN0aSfcfQKDsYjQaNwaLrf/5xT7GjF56JejPeI2E4W9BNAvw/oKPEx/JgxhM61maESlivIgB1UojqtcNqzewKJLQSFyjqe/uk7zic+0Gxwx8vuHUJ7btxB9PqChpoCreZiB9xv++RiTIWb3vky+x1SehQci6w7zLhXAFc2yQRJBRiD00ga9BGaJX41qbaDao2f2nHLWfqHn3veWltejoYn18Uxodi+NQcugaLdYLqxtn/ogmkDON18vnPX34AojtrCBVNvP+aE7RDKng8lobQTKxDW7sjLhAxde4ow+WGTanXW2IqP7Lw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D/tqUZ8DclLQY6J1jbsoyCI+16ygZTKBiDCAKLhdM2k=;
 b=pYmI5kLfocx6iMZzQHQYvSS27b0fS2HZzKiLiu2pkrZ39i3UCaUW9jT3tQtIcO7MwbF5Z78BzRRQq8n5p+JmWbkUE9Kmt0kgsIZKb4nLGInZgcKfsm7VAWLgyaBWLdEm6erluU+vJFHrQ6FHuWtuW5sQUY6ftnrSu9B06CI8HNo=
From: Edwin Torok <edvin.torok@citrix.com>
To: Julien Grall <julien@xen.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Henry Wang
	<Henry.Wang@arm.com>, Christian Lindig <christian.lindig@citrix.com>, David
 Scott <dave@recoil.org>, Wei Liu <wl@xen.org>, Anthony Perard
	<anthony.perard@citrix.com>
Subject: Re: [PATCH for-4.17 v3 07/15] CODING_STYLE(tools/ocaml): add 'make
 format' and remove tabs
Thread-Topic: [PATCH for-4.17 v3 07/15] CODING_STYLE(tools/ocaml): add 'make
 format' and remove tabs
Thread-Index: AQHY84fA+Ym2JRve3kKJcIO1APAKeK41MEgAgAAQaICAAAaygIAAAw6A
Date: Tue, 8 Nov 2022 17:37:29 +0000
Message-ID: <7BD7C0AF-0D72-4125-BE97-8AD5FC15CA93@citrix.com>
References: <cover.1667920496.git.edvin.torok@citrix.com>
 <16f52592270e36670947fbcbe1e4d91f1daf9823.1667920496.git.edvin.torok@citrix.com>
 <4baa6580-a779-f1e4-b504-59895fa97309@xen.org>
 <B27F889D-619C-4D34-92F0-AFB95DA84547@citrix.com>
 <1f8c90cd-8037-84eb-d6f7-c639f8a87585@xen.org>
In-Reply-To: <1f8c90cd-8037-84eb-d6f7-c639f8a87585@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.200.110.1.12)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR03MB5888:EE_|SA0PR03MB5626:EE_
x-ms-office365-filtering-correlation-id: f68bb6ce-d2c1-4091-0d85-08dac1afe90e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 8oUddBTNNcwIwmeQq/aVfJ8jhe340sRW9pznsZQ5T9q7c8BMOlnFokl9MzNyoHf1QVLxzsL5xJE4P5zjQf2nfbn6rUMjtboIqNSjkDNLaOSJqrOG/QwCyJxC2G4EKBdHfrBtnqMBjIxvXUH2r4uhcmxtoxH1EpkX+h+4uY0Y3N/ovvYgB3PCukaKZNsAvUfZn/+gdYiYRKUpemPQyfZ6t6/upWOACge1akbAb5kCJEhkWKO4uzFURHYO7opcpW3t0nx9SRSR6youXuRs3UK11kch5IE5KS6/jXkY3qMqfuo3iNpSoHuwkIIpeObbshnezDJjODG0glz8aW7gLiGd14Wcy47q4ve+k6zDsY6x+avGF+KOoUZwwa+iDU20SXbAwe9zLmGN4EWzzOQOUvGO2qZ/bQm3MqLLBT8wjnm54gukA8ImMW01ecQiFzmMeytM54Csad5puCOGFf0hmzB6gYPZKhcwg7grGCTMic8SrLbURls6MpahPIB4n+A5IfOk0Vpgx+QiMXedX0At37SvXuvQn+PwN+O5IrBe4tfo+E7/yEicjEdqLrsikbqKbR3GUA+6t2BYKOSLk6njy7a3DPiuy2fAfZX5QzqqaNIFYU/g6gvIsGY7u51mkXiNbD8jcgB++2x7mAwvTDlFw0LESkybcHrcRI/cB0REDBeM4/XI94Dnn9eK445T9hHRl88GNdlvmq8wLLtsuQsMF802pWqB8Yje7WzEsLxGE1p3CiCucBEFxxeySn+cXJ352i/EqBiukdoRsSpuWUKllBj6rALtOmiVchoMKeR6xr8kwDI=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB5888.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(396003)(136003)(366004)(346002)(39860400002)(451199015)(2616005)(83380400001)(26005)(66574015)(122000001)(107886003)(6916009)(38100700002)(186003)(6512007)(2906002)(53546011)(6506007)(8936002)(66446008)(41300700001)(5660300002)(64756008)(478600001)(54906003)(8676002)(4326008)(66556008)(76116006)(6486002)(66476007)(316002)(66946007)(71200400001)(91956017)(45080400002)(38070700005)(36756003)(82960400001)(86362001)(33656002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?V3VQdHZxRTJNUW9HT1dmbUwyemVGcWVEMzkwL3kvRWxtRW1kQnhxRWFlcFM5?=
 =?utf-8?B?L0grMlk3ZmFJRDZ3b0lOTEVFcnFtYUp3eGpJWStVK2plZE16ZTk0R2FUZjEv?=
 =?utf-8?B?eGR4WVFnSitvOUczZ0JBdm5BdmJNekh5WDlHUnpSWGFlWG9zeEdjZlVndkNv?=
 =?utf-8?B?ZUNyb1lOUVB6M2F3RzFqdEcwL0dUZVFxNDZ4ZnZvUUhJc0prbE9XZUFNQTFX?=
 =?utf-8?B?UC9nUnhBT0Vrd3RabTR2VU9aUHBYSUxRcDE3RTBlOHFGTm5xbmVXT1Q4bVNZ?=
 =?utf-8?B?US9QTE0xZWlkOEpRc2FHYWZJNGNxTXVQcWVDd053WEczNWk4VmQzK0ljTkph?=
 =?utf-8?B?Z1VZVUlwLzRoMVRDZ0Q1V0cxMXhQbWZsMHNPM013NXJFZUJ1OUhWeThEZkVV?=
 =?utf-8?B?QUlaOXlOQ3lmeG1xbWY2eE9jOG5LSmRSU1Vid1BsTElOTDBKVTZSMVhmZXpw?=
 =?utf-8?B?T0xyT3Nsbnd6TjltVDhkQ3N2azhQVzRmUFZnbGUybk04MTRnRmR1cVB3U0oz?=
 =?utf-8?B?MDcvUWZlTUExa29jd0xwUHRrU2toWi8vRWlHSTAzTEF0VytNN3VkYm5MZnFh?=
 =?utf-8?B?eWlKVS9iTmV1SlhoVU5ldGI1NldqOHJKaGZpT0pWaFhVZDRFbU50QlhpZzl4?=
 =?utf-8?B?MDR4cCtOMjRkckZaeHhkSXMvNHRHRSs1TXljS1FvOFNtOVlmaFJHTDUxT1Ro?=
 =?utf-8?B?UDlWTjlRR3ZsUlNhb1lrMjEvZEdGcWZhNmVaUzB4akp3b2hjNUVkcUIrSWxy?=
 =?utf-8?B?WllJd01UaVdLVHpQR3Rvb0JXTmw0WngzblZXZEdPM1E1aGNkd2FDSWtBZkxw?=
 =?utf-8?B?KzZtZ1lTZ1ZVd0JTV3FYc0tINEd0ZzZiYUxjL25QTStKS3ZPY0NDdUs4Lyth?=
 =?utf-8?B?SHJCSjJ5ZkpsYUpoazJvNjd3aTl1enczeDRZUlJaT2F6bUlsZ1FqaDMyNytJ?=
 =?utf-8?B?K2tCOEFTd09jdVFFMmJYakUzOGlPdlMxM0pjOFhOVmZjTkJybEdLb3Y4ODYr?=
 =?utf-8?B?cnVmcS9abG9HTkhQeXNzY012cGdTcGQ1UWVaeFFmeVZhUm1VV1lxU0ppbU5Q?=
 =?utf-8?B?T0x6ZHl4SEVvbVBPaEtwdWl5eXZ6ZVpZSTUyYWdyTEFvZGZ2dVBkNFd4N0VI?=
 =?utf-8?B?YXhlOXNob1lnMW1BTCtYNEhROTR4ZkNlVG1yZmkwdVlqTUZrelplTWdxTUUx?=
 =?utf-8?B?UFlBc3BVSmlyZlg5N2laSDZPLzNJNTJDNGtiRG5qeFYzY2VIUE4wUFNiZnhQ?=
 =?utf-8?B?MkZZbnU4aElnbk9QSGFQS3l1TytKaytnUnBrVmhHNnVuWVB0eUNSYjRrQ0Vl?=
 =?utf-8?B?ZFZYVnVhSzZBMVlReHZGZHJ4NnVHdnM0U2lDVDNIdGVtQUZJWUU0T0tuc3Ew?=
 =?utf-8?B?TGsrWkhySGNSN0c0MXlTQjRrQUNzNnRvcWc3Q2R2QU5uUjdFV0J0K3NjaFNW?=
 =?utf-8?B?S252ODdFclpwV0N1Nm50bk9aTTU0VHhENmFvUDZ0cnBIaHlyS2o3ZWlLYUVQ?=
 =?utf-8?B?MzVIdFhacGhIc0hOOTZtbkVkMmhYWDdCbHY4Skw4WnBhc0YwUnFvUnZ6V0NO?=
 =?utf-8?B?dEt3SnltNzVuZ255bHFjd3dRaE1DUzVpajQ1UU40WUlGQVVyWk5uOHpWc2JU?=
 =?utf-8?B?YXFLZUVPL1JjNnFqRTBmMFEyM2FkRnJSdkpxWHRad1grR09zK2VKL3dBdVVE?=
 =?utf-8?B?UjRmMyt4MGx0TUE2dE9DWkRtNnpQZCtBVUtmaUQ3NHE2Q1B1RGU5RDgwbldj?=
 =?utf-8?B?L0RqakxwNkNtRkpBeGRmejlMZ0dVNndFNGJEWnBWa3JYajZyL3ZhNGVsL2VT?=
 =?utf-8?B?K2doaC84bXJsUkVHQkphLzBkT3lDbEU2bEtydGkvaVlLVUM2MHNhOXZmLzlK?=
 =?utf-8?B?REkwUEIrVkwvQ3liWTJCSnhEbmZGcjZYdm9xKzJyaGFtY1RGRjAyRjBhY0I0?=
 =?utf-8?B?MGQ2Wnp6aEVJWDRRYWxuTXBzcnpka1JnTUdzWlMvWmdQaVpGSkNWUWt4ZHdu?=
 =?utf-8?B?Y3pvZ25memhuNTJZekpGd05qYURHVTdTMy9ZUmxvTUNpRk5JY0VpOHU2YzBT?=
 =?utf-8?B?Z1lPTURFaStmKzRzWXBPVzlQUlJhUDBaS2REeDdWczA0Y2wrMlgydnB0RlhW?=
 =?utf-8?B?UE9pL1ZFVGVtUWFXR25VYStaV1RtYTBFOCtoRGpsb3JmemI1aE15RnBycHpP?=
 =?utf-8?B?cUE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E23591D83E1B094DB3B2B4FFD55D9B95@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB5888.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f68bb6ce-d2c1-4091-0d85-08dac1afe90e
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Nov 2022 17:37:29.9483
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NiVakPaODMgOPy9CG2CtEWIyyGPE2ohPvjJurEJHmNfwo56/sW7ZhZ7jJy6FGMKWKqFy3a9mbWUrPE7Zepfmmw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR03MB5626

DQoNCj4gT24gOCBOb3YgMjAyMiwgYXQgMTc6MjYsIEp1bGllbiBHcmFsbCA8anVsaWVuQHhlbi5v
cmc+IHdyb3RlOg0KPiANCj4gDQo+IA0KPiBPbiAwOC8xMS8yMDIyIDE3OjAyLCBFZHdpbiBUb3Jv
ayB3cm90ZToNCj4+PiBPbiA4IE5vdiAyMDIyLCBhdCAxNjowMywgSnVsaWVuIEdyYWxsIDxqdWxp
ZW5AeGVuLm9yZz4gd3JvdGU6DQo+Pj4gDQo+Pj4gSGksDQo+Pj4gDQo+Pj4gT24gMDgvMTEvMjAy
MiAxNTozMywgRWR3aW4gVMO2csO2ayB3cm90ZToNCj4+Pj4gU2VlIENPRElOR19TVFlMRTogWGVu
IHVzZXMgc3BhY2VzLCBub3QgdGFicy4NCj4+Pj4gKiBPQ2FtbCBjb2RlOg0KPj4+PiBVc2luZyBg
b2NwLWluZGVudGAgZm9yIG5vdyB0byBqdXN0IG1ha2UgbWluaW1hbCBtb2RpZmljYXRpb25zIGlu
DQo+Pj4+IHRhYnMgdnMgc3BhY2VzIGFuZCBnZXQgdGhlIHJpZ2h0IGluZGVudGF0aW9uLg0KPj4+
PiBXZSBjYW4gaW50cm9kdWNlIGBvY2FtbGZvcm1hdGAgbGF0ZXIuDQo+Pj4+ICogQyBzdHViczoN
Cj4+Pj4ganVzdCByZXBsYWNlIHRhYnMgd2l0aCBzcGFjZXMgbm93LCB1c2luZyBgaW5kZW50YCBv
ciBgY2xhbmctZm9ybWF0YA0KPj4+PiB3b3VsZCBjaGFuZ2UgY29kZSB0b28gbXVjaCBmb3IgNC4x
Ny4NCj4+Pj4gVGhpcyBhdm9pZHMgcGVycGV0dWF0aW5nIGEgZm9ybWF0dGluZyBzdHlsZSB0aGF0
IGlzIGluY29uc2lzdGVudCB3aXRoDQo+Pj4+IHRoZSByZXN0IG9mIFhlbiwgYW5kIHRoYXQgbWFr
ZXMgcHJlcGFyaW5nIGFuZCBzdWJtaXR0aW5nIHBhdGNoZXMgbW9yZQ0KPj4+PiBkaWZmaWN1bHQg
KE9DYW1sIGluZGVudGF0aW9uIHRvb2xzIHVzdWFsbHkgb25seSBzdXBwb3J0IHNwYWNlcywgbm90
IHRhYnMpLg0KPj4+PiBDb250YWlucyBhIGJ1Z2ZpeCBmb3IgYGFiaS1jaGVja2Agc2NyaXB0IHRv
IGhhbmRsZSB0aGUgY2hhbmdlIGluIHRoZQ0KPj4+PiBhbW91bnQgb2Ygd2hpdGVzcGFjZS4NCj4+
Pj4gTm8gZnVuY3Rpb25hbCBjaGFuZ2UuDQo+Pj4+IFNpZ25lZC1vZmYtYnk6IEVkd2luIFTDtnLD
tmsgPGVkdmluLnRvcm9rQGNpdHJpeC5jb20+DQo+Pj4+IC0tDQo+Pj4+IFJlYXNvbiBmb3IgaW5j
bHVzaW9uIGluIDQuMTc6DQo+Pj4+IC0gbWFrZXMgaXQgZWFzaWVyIHRvIGJhY2twb3J0IGNoYW5n
ZXMgZnJvbSBtYXN0ZXIgdG8gNC4xNw0KPj4+IA0KPj4+IFJpZ2h0LCBidXQgeW91IHdpbGwgaGF2
ZSB0aGUgcHJvYmxlbSB3aGVuIGJhY2twb3J0aW5nIHRvIDQuMTYgYW5kIG9sZGVyLiBTbyB0aGUg
b3ZlcmhlYWQgd2lsbCBhbHdheXMgYmUgdGhlcmUgZm9yIGEgY291cGxlIG9mIHllYXJzLg0KPj4g
VGhlcmUgd2lsbCBhbHdheXMgYmUgbW9yZSB0aGFuIG9uZSBYZW4gcmVsZWFzZSBpbiBzdXBwb3J0
LCB3aGljaCBtZWFucyB3ZSdkIG5ldmVyIGJlIGFibGUgdG8gZml4IHRoaXMuDQo+IA0KPiBOb3Rl
IHRoYXQgSSBoYXZlbid0IHNhaWQgdGhpcyBzaG91bGQgbmV2ZXIgYmUgZG9uZS4gVGhpcyBqdXN0
IG5lZWQgdG8gYmUgY29ycmVjdGx5IHRpbWVkLiBEb2luZyBpdCBpbiB0aGUgbWlkZGxlIG9mIGEg
ZGVlcCBmcmVlemUgZG9lc24ndCBsb29rIHJpZ2h0IHRvIG1lLg0KPiANCj4gWy4uLl0NCj4gDQo+
Pj4+IC0gYXZvaWQgcGVycGV0dWF0aW5nIGEgZGlmZmVyZW50IGNvZGluZyBzdHlsZSAoSSB0aG91
Z2h0IHRhYnMgd2VyZQ0KPj4+PiAgIG1hbmRhdGVkIGJ5IFhlbiwgYW5kIHdhcyBhYm91dCB0byBm
aXggdXAgbXkgZWRpdG9yIGNvbmZpZyB0byBtYXRjaA0KPj4+PiAgIHdoZW4gSSByZWFsaXplZCBY
ZW4gYWxyZWFkeSBtYW5kYXRlcyB0aGUgdXNlIG9mIHNwYWNlcykNCj4+Pj4gLSBzaG91bGQgbWFr
ZSBzdWJtaXR0aW5nIHBhdGNoZXMgZm9yIE9DYW1sIGVhc2llciAoT0NhbWwgaW5kZW50YXRpb24N
Cj4+Pj4gICB0b29scyBrbm93IG9ubHkgYWJvdXQgc3BhY2VzLCBzbyBJIGVpdGhlciBjYW4ndCB1
c2UgdGhlbSwgb3IgaGF2ZSB0bw0KPj4+PiAgIG1hbnVhbGx5IGFkanVzdCBpbmRlbnRhdGlvbiBl
dmVyeSB0aW1lIEkgc3VibWl0IGEgcGF0Y2gpDQo+Pj4+IC0gaXQgY2FuIGJlIHZlcmlmaWVkIHRo
YXQgdGhlIG9ubHkgY2hhbmdlIGhlcmUgaXMgdGhlIE1ha2VmaWxlIGNoYW5nZQ0KPj4+PiAgIGZv
ciB0aGUgbmV3IHJ1bGUsICdnaXQgbG9nIC1wIC0xIC13JyBzaG91bGQgYmUgb3RoZXJ3aXNlIGVt
cHR5DQo+Pj4gDQo+Pj4gV2hpbGUgSSB1bmRlcnN0YW5kIHRoZSBnb2FsIGFuZCBzdXBwb3J0LCB0
aGlzIHNlZW1zIHRvIGJlIGEgYml0IHRvbyBsYXRlIHRvIGRvIGl0IGluIFhlbiA0LjE3ICh3ZSBh
cmUgb25seSBhIGNvdXBsZSBvZiB3ZWVrcyBhd2F5KS4gQXQgdGhpcyBzdGFnZSBvZiB0aGUgcmVs
ZWFzZSB3ZSBzaG91bGQgb25seSBkbyBidWcgZml4Lg0KPj4gSSB0aGluayBpdCBjYW4gYmUgZmFp
cmx5IGVhc2lseSBwcm92ZW4gdGhhdCB0aGVyZSBpcyBubyBmdW5jdGlvbmFsIGNoYW5nZSBieSBy
ZXJ1bm5pbmcgdGhlIG1ha2UgZm9ybWF0IGNvbW1hbmQgbWFudWFsbHksIGFuZCBieSBsb29raW5n
IGF0IHRoZSBkaWZmIHdpdGggaWdub3JlIHdoaXRlc3BhY2UgYXMgc3VnZ2VzdGVkIGFib3ZlLg0K
PiANCj4gVGhhdCdzIG5vdCByZWFsbHkgdGhlIHBvaW50IGhlcmUuIFRoZSBwb2ludCBpcyB0aGF0
IGlmIHdlIHN0YXJ0IHRvIGFsbG93IGxhcmdlIGNvZGluZyBzdHlsZSBjaGFuZ2UgKHdoZXRoZXIg
YXV0b21hdGljIG9yIG1hbnVhbCkgdmVyeSBsYXRlIGluIHRoZSByZWxlYXNlIHRoZW4gaXQgd2ls
bCBiZSBoYXJkIHRvIHJlamVjdCBpdCBpbiB0aGUgZnV0dXJlLg0KPiANCj4gSW4gZmFjdCB3ZSBh
bHJlYWR5IGhhdmUgZ3VpZGVsaW5lcyBmb3IgdGhhdC4gSWYgeW91IGxvb2sgYXQgWzFdLCBvbmx5
IGJ1ZyBmaXhlcyBzaG91bGQgYmUgZG9uZSBwYXN0IHRoZSBjb2RlIGZyZWV6ZSAoMjNyZCBTZXB0
ZW1iZXIpLg0KPiANCj4gQXMgSSB3cm90ZSBiZWZvcmUsIHRoaXMgcGF0Y2ggb25seSBzZWVtIHRv
IGJlIGEgY29zbWV0aWMvcXVhbGl0eSBpbXByb3ZlbWVudC4gSU9XIHRoaXMgaXMgbm90IGEgYnVn
IGZpeCBhbmQgd291bGQgbm90IHF1YWxpZnkgZm9yIDQuMTcuDQo+IA0KPj4gSSB1bmRlcnN0YW5k
IHRoZSByZWx1Y3RhbmNlIGluIGluY2x1ZGluZyBpdCAod2hpY2ggaXMgd2h5IEkgd2FzIG5vdCBz
dXJlIHdoZXRoZXIgdG8gcG9zdCBpdCBpbiB0aGUgZmlyc3QgcGxhY2UpLCBidXQgSSB0aGluayBp
dCBtaWdodCBiZSBiZW5lZmljaWFsIHRvIGRvIGl0Lg0KPj4gVGhlcmUgaXMgYSBsYXJnZSBiYWNr
bG9nIG9mIHdvcmsgaW4gb3hlbnN0b3JlZCB0aGF0IGdvdCBwaWxlZCB1cCBkdXJpbmcgdGhlIHBh
c3QgY291cGxlIG9mIHllYXJzIG9mIFhTQSB3b3JrLCBhbmQgaXQnZCBiZSBhIGxvdCBlYXNpZXIg
dG8gdXBkYXRlIGFuZCB1cHN0cmVhbSB0aG9zZSBpZiB3ZSB3b3VsZG4ndCBoYXZlIHRvIHdvcnJ5
DQo+PiBhYm91dCBpbmRlbnRhdGlvbiBhdCBhbGwuDQo+IA0KPiBUaGlzIGlzIGFuIGFyZ3VtZW50
IGZvciBpbmNsdWRpbmcgdGhpcyBwYXRjaCBpbiBYZW4gNC4xOC4gQXMgSSB3cm90ZSBhYm92ZSwg
SSBhbSBub3QgYWdhaW5zdCB0aGF0Lg0KPiANCj4+IFVzdWFsbHkgcGF0Y2hlcyBvbiBMQ00gYW5k
IHNlY3VyaXR5IGJyYW5jaGVzIGFyZSBhdm9pZGVkIHRvIHJlZHVjZSB0aGUgcmlzayBvZiBicmVh
a2luZyBhbnl0aGluZywgYnV0IGEgcmVpbmRlbnRhdGlvbiBwYXRjaCBzaG91bGQgbm90IHJlYWxs
eSBicmVhayBhbnl0aGluZyAod2VsbCBvdGhlciB0aGFuIHRoZSBhYmktY2hlY2sgc2NyaXB0IGlu
IHRoZSBidWlsZCwgYnV0IEkgZml4ZWQgdGhhdCB0byBhY2NlcHQgYm90aCB3YXlzKS4NCj4gDQo+
IFdoYXQgZG9lcyBMQ00gc3RhbmRzIGZvcj8NCg0KTENNIGlzIHdoYXQgd2UgaW50ZXJuYWxseSBj
YWxsIHRoZSBsb25nIHRlcm0gcmVsZWFzZSBicmFuY2ggd2hlcmUgd2UgYmFja3BvcnQgZml4ZXMg
KGkuZS4gNC4xNiBpcyBhbiBMQ00gYnJhbmNoIGFmdGVyIGl0IGlzIHJlbGVhc2VkKS4gSSB0aGlu
ayBpdCdkIGJlIGVxdWl2YWxlbnQgdG8gdGhlIHN0YWJsZSBicmFuY2ggb2YgWGVuL0xpbnV4LCBJ
IHNob3VsZCd2ZSB1c2VkIHRoYXQgdGVybWlub2xvZ3kuIChJIHRoaW5rIGl0IGlzIGFuIGFiYnJl
dmlhdGlvbiBvZiBzb2Z0d2FyZSBsaWZlY3ljbGUgbWFuYWdlbWVudCkNCg0KPiANCj4+IE9uZSBh
bHRlcm5hdGl2ZSB3b3VsZCBiZSB0aGF0IEkgYWRkIGFub3RoZXIgc3RlcCBhZnRlciByZWZvcm1h
dCB0aGF0IHJ1bnMgc2VkIGFuZCB0dXJucyBzcGFjZXMgYmFjayBpbnRvIHRhYnMgZm9yIG5vdywg
YW5kIHRoYXQgd2F5IEkgY2FuIHN0aWxsIHJ1biAnbWFrZSBmb3JtYXQnIGF0IGVhY2ggc3RlcCB3
aGlsZSBwcmVwYXJpbmcgcGF0Y2hlcyBmb3IgbWFzdGVyLCBvciA0LjE3IG9yIHNlY3VyaXR5IHBh
dGNoZXMgYW5kIGdldCBzb21ldGhpbmcgY29uc2lzdGVudCwgYW5kIHRoYXQgbWluaW1pemVzIG90
aGVyIHdoaXRlc3BhY2UgY2hhbmdlcywgYnV0IGl0IHdvdWxkbid0IGNvbXBsZXRlbHkgZWxpbWlu
YXRlIHRoZW0gKGUuZy4gdGhlcmUgYXJlIHBpZWNlcyBvZiBjb2RlIHRoYXQgYXJlIGp1c3Qgd3Jv
bmdseSBpbmRlbnRlZCwgc28gdGhlcmUnZCBiZSBhdCBsZWFzdCBhIGRpZmYgdG8gZml4IGFsbCB0
aGF0KS4NCj4gDQo+IEkgd291bGQgdmlldyB0aGlzIGFzIGEgZmVhdHVyZS4gV2hpY2ggYWdhaW4g
ZG9lc24ndCBxdWFsaWZ5IGZvciBYZW4gNC4xNyByZWxlYXNlLiBUaGlzIGRvZXNuJ3QgbWVhbiB0
aGUgcGF0Y2ggY291bGRuJ3QgYmUgYmFja3BvcnRlZCBhZnRlcndhcmRzLg0KDQoNCkFoIG9rLCBp
ZiB0aGlzIGNhbiBiZSBiYWNrcG9ydGVkIHRvIDQuMTcuMSwgb3IgYXBwbGllZCBmb3IgNC4xOCB0
aGF0IG1pZ2h0IHdvcmsgdG9vLiAoSSBqdXN0IHRob3VnaHQgdGhlIHJ1bGVzIGFyb3VuZCBiYWNr
cG9ydCB3b3VsZCBiZSBldmVuIHN0cmljdGVyIHRoYW4gd2hhdCBjYW4gZ28gaW50byBhIHJlbGVh
c2UpDQpJJ2xsIHRyeSB0byBmaW5kIGEgc2hvcnQgdGVybSB3b3JrYXJvdW5kIGZvciB0aGUgc3Bh
Y2VzIHZzIHRhYnMgaXNzdWVzIG1lYW53aGlsZS4NCg0KDQo+IA0KPiBDaGVlcnMsDQo+IA0KPiBb
MV0gQVM4UFIwOE1CNzk5MTE0NUM4MDYzRDY5MzlBRkZFRDhGOTI4MjlAQVM4UFIwOE1CNzk5MS5l
dXJwcmQwOC5wcm9kLm91dGxvb2suY29tDQoNCg0KSG1tIEkgdGhvdWdodCB0aGF0IGlzIG15IE91
dGxvb2sgcmV3cml0aW5nIHRoZSBsaW5rLCBidXQgdGhlIGFyY2hpdmUgYXQgbG9yZS5rZXJuZWwu
b3JnIHNlZW1zIHRvIGhhdmUgdGhpcyBtYW5nbGVkIFVSTCBhcyB3ZWxsIHdoaWNoIEkgY2Fubm90
IG9wZW4uDQpDb3VsZCB5b3Ugc2VuZCBpdCBpbiBzdWNoIGEgd2F5IHRoYXQgaXQgaXMgbm90IGVu
Y29kZWQgd2hlbiBiZWluZyBzZW50IChlLmcuIGJhc2U2NCBlbmNvZGUgaXQuLi4pDQoNCj4gDQo+
PiBCZXN0IHJlZ2FyZHMsDQo+PiAtLUVkd2luDQo+Pj4gDQo+Pj4gQ2hlZXJzLA0KPj4+IA0KPj4+
IA0KPj4+IC0tIA0KPj4+IEp1bGllbiBHcmFsbA0KPiANCj4gLS0gDQo+IEp1bGllbiBHcmFsbA0K
DQo=

