Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BF95557652
	for <lists+xen-devel@lfdr.de>; Thu, 23 Jun 2022 11:09:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.354672.581905 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o4Ipr-0000bn-QL; Thu, 23 Jun 2022 09:09:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 354672.581905; Thu, 23 Jun 2022 09:09:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o4Ipr-0000YH-Me; Thu, 23 Jun 2022 09:09:11 +0000
Received: by outflank-mailman (input) for mailman id 354672;
 Thu, 23 Jun 2022 09:09:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uSRO=W6=citrix.com=prvs=166c34e93=roger.pau@srs-se1.protection.inumbo.net>)
 id 1o4Ipq-0007sI-9I
 for xen-devel@lists.xenproject.org; Thu, 23 Jun 2022 09:09:10 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 229e1b09-f2d4-11ec-b725-ed86ccbb4733;
 Thu, 23 Jun 2022 11:09:08 +0200 (CEST)
Received: from mail-mw2nam12lp2046.outbound.protection.outlook.com (HELO
 NAM12-MW2-obe.outbound.protection.outlook.com) ([104.47.66.46])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 23 Jun 2022 05:09:02 -0400
Received: from DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
 by SJ0PR03MB5934.namprd03.prod.outlook.com (2603:10b6:a03:2d7::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.15; Thu, 23 Jun
 2022 09:09:00 +0000
Received: from DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::40af:d5f4:95eb:d534]) by DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::40af:d5f4:95eb:d534%7]) with mapi id 15.20.5353.022; Thu, 23 Jun 2022
 09:09:00 +0000
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
X-Inumbo-ID: 229e1b09-f2d4-11ec-b725-ed86ccbb4733
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1655975348;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=rtOuad8c+07CNIVJbjN8tiZvyJ0+MclpQ3UhlntkBjk=;
  b=N02IfPO1QN1NGPcDkJgRwWGDDUaFM6vNOdtIeAGczy1R5Cm/I0JAuGJL
   RujLkL5rtZzJA4RDQF3OmyJXn3y/YYVxq7W/0aXrQGiwjSfZQawqA0ISF
   fwJ45BCb6jjKguPK2+IRzQXLUnCAUzxbN2+9sXtf+mkvhuUyOhdFz+2P4
   w=;
X-IronPort-RemoteIP: 104.47.66.46
X-IronPort-MID: 73582811
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:Xz3f3KCzm3LO3hVW/zTiw5YqxClBgxIJ4kV8jS/XYbTApGx30TMGy
 GQeDWjUM/iLNGLwKdFyOovn9EIDuMDRn4NqQQY4rX1jcSlH+JHPbTi7wuYcHM8wwunrFh8PA
 xA2M4GYRCwMZiaA4E/raNANlFEkvU2ybuOU5NXsZ2YgH2eIdA970Ug5w7Bj2NY06TSEK1jlV
 e3a8pW31GCNg1aYAkpMg05UgEoy1BhakGpwUm0WPZinjneH/5UmJMt3yZWKB2n5WuFp8tuSH
 I4v+l0bElTxpH/BAvv9+lryn9ZjrrT6ZWBigVIOM0Sub4QrSoXfHc/XOdJFAXq7hQllkPhx7
 /Z8qJmNaz4jP5Tdgd4YWgRIIntHaPguFL/veRBTsOS15mifKT7J/K8rC0s7e4oF5uxwHGdCs
 +QCLywAZQyCgOTwx6+nTu5rhYIoK8yD0IE34yk8i22GS6h4B8ydK0nJzYYwMDMYnMdBEOyYf
 8MEQTFucA7Bc1tEPVJ/5JcWw7z11iOvKmQwRFS9u7Bw20nWyC1I1OLgFdf6eN26X/tekRPNz
 o7B1yGjav0AD/SPxDzA/n+yi+vnmSLgRJlUBLC+7uRtglCY2ioUEhJ+fVmxrOS9i0W+c8lCM
 EFS8S0rxYAw6UiqQ9/VTxC+5nmesXY0QMFMGuc37AWMzKv84AuDAGUACDlbZ7QOq8seVTEsk
 FiTkLvU6SdHtbSUTTeY6e2SpDbrYywNdzdeO2kDUBcP5MTlrMcrlBXTQ91/EamzyNroBTX3x
 DPMpy8771kOsfM2O2yA1Qivq1qRSlLhF2bZOi2/srqZ0z5E
IronPort-HdrOrdr: A9a23:et1G8K6yQLn/bb2OwwPXwS6BI+orL9Y04lQ7vn2ZFiY5TiXIra
 qTdaogviMc6Ax/ZJjvo6HjBEDmewKlyXcV2/hpAV7GZmXbUQSTXeVfBOfZowEIeBeOi9K1q5
 0QFJSWYeeYZTYasS+T2njDLz9K+qjjzEnHv5a88587JjsaEJ2Ioj0JfTqzIwlTfk1rFJA5HJ
 2T6o5uoCehQ20eaoCeCmMeV+bOitXXnNa+CCR2TiIP2U2rt3eF+bT6Gx+X0lM3VC5O+64r9S
 zgnxbi7quunvmnwlv31nPV7b5RhNz9o+EzcvCku4wwEHHBmwyobINuV/mruy00mvim7BIQnN
 zFs34bTrZOwkKUWlvwjQrm2gHm3jprwWTl00WkjXzqptG8bC4mCuJa7LgpPyfx2g4FhpVRwa
 hL12WWu958FhXbhhnw4NDOSlVDile0m3w/iuQe5kYvG7f2UIUh4rD3wXklXqvpREnBmcEa+a
 hVfYrhDc9tAB+nhyuzhBgu/DSuNk5DbStuDHJy+fB96AIm40yR/3FouPD3oU1wiq7VM6M0gd
 gsEp4Y4Y2mHfVmGZ6UOo86MLqKI12IZy7wG0SvBnmiPJ07Ghv22u7KCfMOlamXRKA=
X-IronPort-AV: E=Sophos;i="5.92,215,1650945600"; 
   d="scan'208";a="73582811"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TTWXfUrSddY5AT8FGCfmTcNgTVKOr3wq5ONVyLIm79D9yR52ugs4Y7HF3F+MHlgzlUW/tdHOlIY4f3FfyfAGTgSkVnKji2hRbAnuhyGT7dlvI6fdeOlqwgziQ5bb4aIdK4fXOgPI00eh0jtZSmVzlXftyA1uAsf4AVX4xkrQBWm4i5AyznCQbMQgyBpWxgZ1GUgkvcr+kSAJqKb9hj2L0MrTh8K7Fb3Ov52zXFGH7xSN7KvYgqr13LoEvs23sZ7zK9fYUbHd6tqcS/5ygMuBFzflIdwOCoCmJ08BGd3F7ZNSRZv2+8UqUjKzd4vctdQVQH1ZjKGKv8F/Qbly0NqKew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iPok12Lcm4RwiqPaAOJfrYnKaoBs0y2eJqzdIiTG+no=;
 b=BjiFh2S0L3Afu6f/Az9/P6C+vsrDl15N9gDY5piXf821Ho1aqaql3xiQJJ+Gwk6qL+u3INzJ9fkAXLb9l6Nxg2Vih62OnRA51AKghR89MpkUzEvDtv/XgcTbpIQHJUPUuSBrQ0uWhYUXyT0byBmI9J+CvdPP9oGdLzrfkY5X4IC2jZle/hKDQJltwVvpfVRCNUSFFJ2Scy5Ui3AGF+Tdf9bgG/8VPTEePYffdm5lcX7T6MgXu79lIkPkD62ytZsAG3O9mRZXunGx42cmOVPwHHYkT7f77Q16YjESajH/BAUtTn+4/zigT0pRBd7fFIA2tv7TApoxz6vXf7Cq55FHnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iPok12Lcm4RwiqPaAOJfrYnKaoBs0y2eJqzdIiTG+no=;
 b=t1QrSJJo9nWE+uvI0n8ONLrunAENA5OGXu4L+j0xfBGT5Jk8aZVXagNtIA9htL7PNHHRwx9aKMkpgKPlYnsvYNCiJYGadFxQ/w713ARYhAvfmcYBSvc+EzkUFwla8Ui2F/vSK+1pXTHmVRRoC9D6W71l23+Q7mJYEkFqeDXlR/Y=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH 0/2] console/serial: adjust default TX buffer size
Date: Thu, 23 Jun 2022 11:08:50 +0200
Message-Id: <20220623090852.29622-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.36.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0155.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2c7::7) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9d2266d0-480d-42be-53c4-08da54f802f6
X-MS-TrafficTypeDiagnostic: SJ0PR03MB5934:EE_
X-Microsoft-Antispam-PRVS:
	<SJ0PR03MB59345A3283BE6D291E79B3948FB59@SJ0PR03MB5934.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	KE8vyr97RIUl91ZWCe4hcBMmVX6gjbkbkJduFt1lFVzyKKSfAjFgYJ3wqvXYUiApvt3A/HklQEQqSwnwVZr9j5/Xb4Uzj7w7TeWoi2tSu5yj/VPpfoVTiVsi4JX5BdPmYcQKimU88OkhPfaKBEvwBW3MQxAmM2hvhGOQNeo9YqsCARp3K/HtZI6lXwisf/h3tT70Tb88DxD8Ycg4fNenan5rlld1b+DrysYM3MolC1nQUCgVLJLU9D7H0JL/yaT45v7cyruZ359BkahH26Jf13LlntORvFrUCvu3xJxRBvTAE1QZrgajwJyYhJEJeLZu4ZmgHR3ay9qJCaL+EZ5dad+1VI61Gw/OQSdCKXBNsUIawKFMyIQWT2AfDQXX4ig2nQqamvFJLh/pWswQwbTjWUHam/+AgNS90GEGLI25R7Z0/xo5jB/HpwGYs6MBcLdjaKWnze6W++NMMhwVdkC0AqjBQ6tb/DhVs95dUsSPzhMxRgttTx6evgS8E8oS68H9Y/GSZvza9HTN27sZgxv2EfGtDo1m8i8aI/Lc6sQSd789MUiLBhkZMu1twz2dDjYsYL+1yNrYN9MBFovzsJKEJ+pusTx7Ak+DSje6E+LbMQ/cIrMiCnnW9NHFllAK5wfvTssSiltVsfb2/VlnNl6b7y11GyDisvNJjjLg/lxKok3O+JtJc/y5U7nw3eDIuwHJvsN0jTrk9T+pg8Daa2lsIQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(396003)(136003)(366004)(39860400002)(346002)(376002)(6506007)(1076003)(8676002)(4326008)(83380400001)(6486002)(66476007)(6512007)(54906003)(86362001)(66556008)(6916009)(2616005)(26005)(66946007)(41300700001)(6666004)(186003)(478600001)(316002)(5660300002)(4744005)(38100700002)(36756003)(82960400001)(2906002)(8936002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cW9zUDROT0U5OW5FQ3pZVmRMV28wWloveEpTMHRwd0k3aEJLNUpYT0hRUEx6?=
 =?utf-8?B?bldMUEpDaWVEOXVqeG96TG52bW1PT3VXY2h3YzdzS0twYmVTa1c1Z0dPU2Iw?=
 =?utf-8?B?QjhadldJQ3MzQU9XZEg0Q0NMS1RtSXFPU0NKekZoZVdLOHNYdUtqZ2lkMGN4?=
 =?utf-8?B?Y2QxOFVOeEtTeE1JaU5sNTZrN1F4VnpHL2hiS2pBZ2RTY0pjUkgwb1dTb3Qr?=
 =?utf-8?B?SEpicWNKcWNsOWdJVXhCalZScmdDanBFWTlMQitOOUt1TWxRUFF3TDVENE11?=
 =?utf-8?B?SnBvSXpYQkMrUy8wL0paVTQzQ1FOWjZYR0p2K3o0ZWdiTWFZODAvYjRobXdl?=
 =?utf-8?B?RWt1MUdGQnFFY2RScHJEZ1NNQitFcHd2Q2NraVdvUW4zWGtkMncxWVd5aGZo?=
 =?utf-8?B?Wm9pL2I2UWtKWFNsVjhaY2NuYXdQRXhES2FRU2NMSWYrZmpLZHlsYU9wc2d5?=
 =?utf-8?B?MlN0K3V4K2lxUHR3TXpMQ1ZqTldwRm0xNGJkV29KQS91N3F5QS9xSzFvMDd5?=
 =?utf-8?B?TUYzc21oUzg1NVJJcFQxZm5kSmRCRyt0Y2F6R1FsM3hoTkR4U3gzQTNnV3d2?=
 =?utf-8?B?QVp5WVhsZnNoSXVyVWlWRjJWRXJ1cVNFTERIRHZwd3Z2RzEvVWcyVW1YRjRM?=
 =?utf-8?B?WDVJNmZ6RkszQ0VreUVVQ1YxblZ5QjRqeHJPVUFsMWU4dGMvWitjUUVCYXJ4?=
 =?utf-8?B?RkZHWkh0aUJqbmV3anVWWVM3ZFkxV01xZTY3V1pGZE1aVU93MmpnMEt5YTVD?=
 =?utf-8?B?U2wzeXJCUzZWdzRJVG5pZS9xeWF1b2RiZ0VVNzRsNWlzRlRvSXRiZlBwVzNj?=
 =?utf-8?B?STk1TjY2SmNSWXI1SWFHMkRBQ0kzUE82aStHd3RSaFRqTkhDaGVZUkEzc3RE?=
 =?utf-8?B?cml3U2dOR2RWK1dEUGJOU0t4Sk0xVzZOM2QzZlhnT3crdjF1N2E3YzFoYTRw?=
 =?utf-8?B?R05xa1JwdzhFeWgvaEtMU01RUllzZjM3eTlwWkgvaDRYN3FGTDA5MjVZQ0hp?=
 =?utf-8?B?ald3VlgwS25DREdSSXNyaTkxaTJMNkhjc0wwenFtSCtvU2tJbi83K2UwcGYr?=
 =?utf-8?B?VWNxWW50UkdPM0NUY0ZrNWVDM1lBL0NtTkhrNkFkMWQ5a0NQSk94Q084R0wx?=
 =?utf-8?B?MTk2UEN5UjVVREJnd0ltVWwxVHZiWE9QaEtCV0FRNzhqNktGUEZVaEF2ZjJ0?=
 =?utf-8?B?T3pUQ0lQL2ZRdzhFM05pSS9hTWthNkhvV2cyY3F4em1CM3A2UzdNb0JJdEJF?=
 =?utf-8?B?TzBGWm94QXZDSjBMRmwyaVVia1RZYVdBRkR0OGpDZmNoMnVlMjNJNFNVMEFa?=
 =?utf-8?B?bVZWSngzMDlEcUk5dFBGQlh5N3RwUWpsODZ5eGZlenlWU3BWMWFXQklqOCtr?=
 =?utf-8?B?MGxNK05VN3hjdXNmK3V1dkRpVnZiVkNqa2FlVGxrZ3RVSDc4d0E4aDNkLzBT?=
 =?utf-8?B?TUVHb2s3Zlpnd3dvUmg2ZTZPY1M0M0NVaG91VEhnZ0kwVERFcVhpYWpSUllj?=
 =?utf-8?B?aUxFKzJpTm5UN3pyN0ZCT1NWTXFBejJTZmFhczgybzliQTBsUW92TUxPUDEy?=
 =?utf-8?B?aitacE9LTDFNVnVuZFFtVGlhVENJY3NHS3R1N2JxMHlFUzZOemZnZEMzMWFV?=
 =?utf-8?B?ellRVndLcFpjS1pFaGdHdlNCK2krNit5bXpCRnlsU2xWN1F4N1dqaU9mS2hk?=
 =?utf-8?B?aFhZOCtTWkxkdXMvRXc1aWlIZFNDY2tBVTlXa21BWmZJbTVIcWFMbHdtbTJJ?=
 =?utf-8?B?YTNyWmliaU00SWkvUXV0dkw2NnJhRXkyM0tBODVXVjR5aExPWittR2E3YXJ0?=
 =?utf-8?B?ci9zN2Qyd21qbTNGYTFsTmk4OFNsVlR5UHZuQzByRXA1Wk9qK0RobnJaNVNy?=
 =?utf-8?B?SFhDMlJiNG40aUtMOG1QK0VJM2hHK0UrVE1ldDZ1M0tncnY1YVRTcVJGenJU?=
 =?utf-8?B?MWtNa0F5dGxPRFR6czhXa1NtVHd6SkVPUitTZmx1VEpzUVM0citGYkVyZmNj?=
 =?utf-8?B?R2g5L1grdnVPZE5scDJpSjdyclYrOXhKQlFrOUxETGRqK0Rubk9UT0dTR2Rp?=
 =?utf-8?B?OEV6SkczQU02TlZmblFrVjRCU0hUeXpRK0FYRG1uWThuNHJXV2o1Uyt4UHFM?=
 =?utf-8?B?a2dHOWxiK0laUml2dFBaNUJRNFBvVnVLdU5RZkpMaENXdHJ1ZGNwVWlUblIy?=
 =?utf-8?B?MGc9PQ==?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d2266d0-480d-42be-53c4-08da54f802f6
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2022 09:09:00.5292
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cxDeZ/abtxn4SVqLFjM61UFiYcynBOs/iVbniTe+xV7jos+P4fKY0dM96bd4HSbyWVt4GP/Z7Rh6xHUmyGEl9A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5934

Hello,

First patch moves the setting of the default TX buffer size to Kconfig,
and shouldn't be controversial, second patch increases the buffer to
32K.

Thanks, Roger.

Roger Pau Monne (2):
  console/serial: set the default transmit buffer size in Kconfig
  console/serial: bump buffer from 16K to 32K

 xen/drivers/char/Kconfig  | 10 ++++++++++
 xen/drivers/char/serial.c |  3 ++-
 2 files changed, 12 insertions(+), 1 deletion(-)

-- 
2.36.1


