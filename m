Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 150E96016EE
	for <lists+xen-devel@lfdr.de>; Mon, 17 Oct 2022 21:09:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.424553.672063 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1okVTH-0000v1-0j; Mon, 17 Oct 2022 19:08:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 424553.672063; Mon, 17 Oct 2022 19:08:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1okVTG-0000sH-Tt; Mon, 17 Oct 2022 19:08:18 +0000
Received: by outflank-mailman (input) for mailman id 424553;
 Mon, 17 Oct 2022 19:08:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=A/1i=2S=citrix.com=prvs=2822150b0=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1okVTF-0000sB-HO
 for xen-devel@lists.xenproject.org; Mon, 17 Oct 2022 19:08:17 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 09264442-4e4f-11ed-91b4-6bf2151ebd3b;
 Mon, 17 Oct 2022 21:08:14 +0200 (CEST)
Received: from mail-co1nam11lp2176.outbound.protection.outlook.com (HELO
 NAM11-CO1-obe.outbound.protection.outlook.com) ([104.47.56.176])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 17 Oct 2022 15:07:34 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.33; Mon, 17 Oct
 2022 19:07:33 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::1328:69bd:efac:4d44]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::1328:69bd:efac:4d44%3]) with mapi id 15.20.5723.033; Mon, 17 Oct 2022
 19:07:32 +0000
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
X-Inumbo-ID: 09264442-4e4f-11ed-91b4-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1666033693;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=QuAvrJvYXucoKIMO8EkIU6VL6cY3WHerJ0IxHPEf9Mc=;
  b=bt2NiWUFzeYAtajdF+bOTIHEupwXoxOjSZ576Bi0s+ZvJZ9QhvJhEXZU
   NVNYIhgEht2V6xft72kepq5Z4uyi3hQ0g9mSCxNwR4vOH5x5wHzA9ydz0
   9wLOUwHq0VpTNyW37+FCFDTF1BZCBPDwMGW4bY2IeMjosI6Z+uCk06u97
   A=;
X-IronPort-RemoteIP: 104.47.56.176
X-IronPort-MID: 85457342
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:wPSmh6uzAQaw7MUhO67Mhewj3efnVNtfMUV32f8akzHdYApBsoF/q
 tZmKW+Ab6yCNmD8Ld9xbNu28BwFuMKHzoc3GVY5pX0wF39G+JbJXdiXEBz9bniYRiHhoOCLz
 O1FM4Wdc5pkJpP4jk3wWlQ0hSAkjclkfpKlVKiefHgZqTZMEE8JkQhkl/MynrlmiN24BxLlk
 d7pqojUNUTNNwRcawr40Ire7kIy1BjOkGlA5AZnPakU5AW2e0Q9V/rzG4ngdxMUfaEMdgKKb
 76r5K20+Grf4yAsBruN+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+v9T2M4nQVVWk120c+VZk
 72hg3ASpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn9IBDJyCAWlvVbD09NqbDklu7
 eMnLS4wRCm9oMGr8KzrcO5LgvQKeZyD0IM34hmMzBn/JNN/GNXoZPyP4tVVmjAtmspJAPDSI
 dIDbiZiZwjBZBsJPUoLDJU5n6GjgXyXnz9w8QrJ4/ZopTWNilUujtABM/KMEjCObexTklyVu
 STt+GPhDwtBHNee1SCE4jSngeqncSbTCN9OSeLjqqQCbFu74nEjUCMOX0SBjd69iFHnfdtiB
 2cG5X97xUQ13AnxJjXnZDWYrXier1gjUtxfO+Qg7UeGza+8yxaUAC0IQyBMbPQitdQqXno62
 1mRhdTrCDdz9rqPRhq17ayIpDm/PSwUK24qZiIeSwYBpd75r+kbjA/LT9tlOL64iJvyAz6Y6
 zqHtjQkjrMfy8sCzbym/Evviiip4JPOS2Yd+QjWGGml4wVRbZSgIYev7DDz0/FEK4qIS0ibi
 1INkcOe8eMmAImEkWqGR+BlIV2yz/OMMTmZilk2GZAkrm2p4yT6It4W5yxiLkB0NMpCYSXuf
 ELYpQJW4tlUIWeuaqh0JYm2DqzG0JTdKDgsbdiMBvImX3S7XFPvEP1GDaJI413QrQ==
IronPort-HdrOrdr: A9a23:NYvlbK2r7a8zQdkSaox/uwqjBRFyeYIsimQD101hICG9Lfb0qy
 n+pp4mPEHP4wr5AEtQ4uxpOMG7MBDhHQYc2/hdAV7QZnidhILOFvAv0WKC+UyrJ8SazIJgPM
 hbAs9D4bHLbGSSyPyKmDVQcOxQj+VvkprY49s2pk0FJW4FV0gj1XYBNu/xKDwVeOAyP+tcKH
 Pq3Lsjm9PPQxQqR/X+IkNAc/nIptXNmp6jSwUBHQQb5A6Hii7twKLmEjCDty1uEg9n8PMHyy
 zoggb57qKsv7WQ0RnHzVLe6JxQhZ/I1sZDPsqRkcIYQw+cyjpAJb4RGIFqjgpF5d1H22xa1O
 UkZC1QePib3kmhPF1dZyGdnTUIngxeskMKgmXo/EcL6faJOA7STfAxy76xOyGplXbJ9rtHod
 129nPcuJxNARzamiPho9DOShFxj0Kx5WEviOgJkhVkIMIjgZJq3PsiFXluYeE9NTO/7JpiHP
 hlDcna6voTeVSGb2rBtm0qxNC3RHw8EhqPX0BH46WuonNrtWE8y1FdyN0Un38G+p54Q55Y5/
 7cOqAtkL1VVMcZYa90Ge9ES8qqDW7GRw7KLQupUBzaPbBCP2iIp4/84b0z6u3vcJsUzIEqkJ
 CES19cvX5aQTObNSRP5uw/zvngehTPYd228LAu23FQgMyNeJP7dSueVVspj8ys5/0CH8yzYY
 fABK5r
X-IronPort-AV: E=Sophos;i="5.95,192,1661832000"; 
   d="scan'208";a="85457342"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y0Avv6VNM7W+mjkt6To68Brsi8xo3pgb9EMC/yQpjNsGNYeNdiUquNgnZhRA8Ruukp2f8Kl+yYMNWV8RbBDQrpI3e2P4MFgh0tuqdz4if1pLb9l2/JyF/giT/lECoHf6EpRQYIeoUvjw+idh5Zpu7LaXSYbFjF74Y18ehjHw1IMkWoQowas0HMw6Yyr5vJpm3jPV/Zx2pKZ8TVcOdEL1C3angsnlPtLSn38gKbJ7ccdmzdVIHaWRPLRLaoistkZfdpR5+0d5YR0t8iBOBumOxgYZD8ukwC70LYVEsI1WMYe6Fz1dK9wGyI1LvdYl135aW/mcie1AXD9KjC1OFIu7jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QuAvrJvYXucoKIMO8EkIU6VL6cY3WHerJ0IxHPEf9Mc=;
 b=jVEjfsuxBPArUCWODoAkrr4vg4OvkCya355NTXmSijZ7Ua5MR8S/Wp15BRLF4ax+3jlJrdUFNS36N4psJCNkvccXeRs35gcfaVMnynPNd36wu69hoMGU3E5jFucGphtCN5y831kt+uBZmArTp9fA7j6xplKG06ZyEc+k13KAWwvIThf0J6lvyvhnr+WWVXXokYVUfDOYJ/UlciHJLAw+cNSzwjNzbZGG7v9YgyQQxXbLysFIQDf+IeSYnPj050hp2WjZjRfxa2RQVkjCyESysrMTuboxoN9il/w7zdjBOJxRpsVUnXUaN+7IsdVq7WioZuVFWc8V6g1dOFtUQ7X7Eg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QuAvrJvYXucoKIMO8EkIU6VL6cY3WHerJ0IxHPEf9Mc=;
 b=lZdZJ0kWpunxdMpCTOEjjdaWdHGGkT3u4Qjt7jhcl7ljFOoD9/7n7mF1QlilPJ+jr8tAqYVGVDe5qAgCrdDsSOgHBpL3QEpFH5OB7ZziDyfUluuwoXzugB/n3+hI5R1wrP0SdM1UE7k11bLsC5iR9JBRNi9vTil5yhU2ePayPm4=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Henry Wang <Henry.Wang@arm.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Wei Chen
	<wei.chen@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v4] xen/arm: p2m: Populate pages for GICv2 mapping in
 arch_domain_create()
Thread-Topic: [PATCH v4] xen/arm: p2m: Populate pages for GICv2 mapping in
 arch_domain_create()
Thread-Index: AQHY4kjMT/hxO9gc1E6OcnjJPjKrQq4S8teA
Date: Mon, 17 Oct 2022 19:07:32 +0000
Message-ID: <fcb69acd-2985-1c84-07b4-94cff742a18c@citrix.com>
References: <20221017165133.17066-1-Henry.Wang@arm.com>
In-Reply-To: <20221017165133.17066-1-Henry.Wang@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR03MB3623:EE_|SJ0PR03MB6423:EE_
x-ms-office365-filtering-correlation-id: ba60c863-959d-428d-60a0-08dab072d850
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 YfSgWVUzL2uMHi9aclMoQbgq3luhjqZOypbvjuYfApZQkPdNLRfq8DViJtKEMsuV8mDGYWi6G0w9QF+2aaynQWrK7OoImn0uGhV7N2xOPdMc+WgE3J28boxnfJnfWVr60bdXckywV5V2OXB8h/QNEAAVeRdFTaYVHq2QcxGMbVtqH6KcJFmBIGFLp0UOHJ5Scvog9TwFCytyLBpDQFrhBb7NH3Jvxbz8wQ/Vs465ZI1NgneegCa/7c+DToEX6CNvwIPblIxTU5F76uE+TjTq3D05Uk/f3j3FGi7tXZkx5KKrwMHWf0iXqXgEgyhZAHjRDz7/g8mtObBHtZXF+gTF64ao9rfwNY96yIQeFoI4eiHUX9XzflJIUqTFhuZ2neWD0G2384Y9f0gcqvlLsaYx/eqHG9OWpiA+mrrpYdCn2pfj3TMdVsGnD1mwE7s2TuwhPDl/MZvIVKqhuIm7FRmlVkZpsIc91qRlbW5Wi+OBLvOeyrQSgOAJUPkVZauZrUY96v+cjRYdkEni/3/2j72w4R8zc9Kd/yLRAgvFcmbTAz2zldanPZNOE25B9wraNBi8TgTATfBz/A4oc+gXkwCjo4P9mPR/XTtUkGCY/R49NK4Wf5RN5sUF4vw/A/DLGTOmJJC2PjKIItvedUsRNApWytmjtmIf/R2ze4ULW6p47tiWxlvCHh3R9kn+gNbITxu2KD6N3swqCHH8D2F/f7LvSoda/6qMiMXP8v0ds48+55z350OYnny5VxehfQGDoGBeBG+0kkuJGjho/Zv6DurKGFtqmXGb0iI6gmQ2i947pLmIpuu1TVakjuBoZOkqcQnff/I00ovPlo5KXV7yqAMtcA==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(136003)(366004)(376002)(39860400002)(346002)(451199015)(6486002)(316002)(110136005)(31686004)(54906003)(8676002)(4326008)(91956017)(66946007)(76116006)(66556008)(66476007)(66446008)(64756008)(71200400001)(478600001)(4744005)(5660300002)(186003)(2616005)(41300700001)(2906002)(53546011)(6512007)(6506007)(26005)(8936002)(36756003)(82960400001)(31696002)(122000001)(86362001)(38070700005)(38100700002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?alo2RnpaUFFmQzAxWEM2M0VnWkdKVEwwM29FUHdxdjB6a04xekRyeENQdHds?=
 =?utf-8?B?Njc1YnFCSTFzeTdvQ1F3dmN0YVMzU2J4MklvK2R6Tm9BenlnV3BGRmdWa20w?=
 =?utf-8?B?RGlSRHl2TDE1NytaUWVGWkhiWUVoRi92K0IvQWw0NGNJTTVhY3lTcnpsL2RD?=
 =?utf-8?B?Zy9PSnRtMTltS1ZrSW8wNzdIQkVMZkZYUy8vK0xzTzdTWmI4ejRaOE45ZTZP?=
 =?utf-8?B?VDN0V1VkWmtnTEllMDlmZHRtbUNvY3VCRDFDNzZ4bVJXb1Z0N0hqRVVrM2dO?=
 =?utf-8?B?OVcvSzdDeENRblBrejQ0UG9SSWFYSFIyL3pVcTgrK1NqbEdvcmtNaUF1UmRu?=
 =?utf-8?B?SEpFQlNCckp3aWRxR1U3T1pZMlRtMjBvMEdyZW9QVzhtdS9PbnhYYkl2dmNJ?=
 =?utf-8?B?ajNjK2hsMzgySlpFVS9ZVlZqdXhWSHhLWW5RQ0hBUmMxYjFkLythcEJZN3NT?=
 =?utf-8?B?NTF2QVB2N2FjenhISzE3ZkYxTWFPYkdDNG9ONk9UVjdtYnBuVUExc0tjbVNs?=
 =?utf-8?B?UXMzZ1cxb1lTempKd3M3Uk1lbzg5OXF4UlBsdWZXcDZ0VFp0ZlI3d3U3N3R6?=
 =?utf-8?B?MG5TRWpOdmJPOE91aG0zZm1SWXFuNG9aSS8vbnJhanY0RTBpVDJ0alk1TXZs?=
 =?utf-8?B?SWdkTTEzcE5RQnVreHFIZFJOYnVtbE1JRkFQclptVFNyQk44TWJJWXY2czRY?=
 =?utf-8?B?a1lMRHRBdHo4L2xyQ3FYQjlHa3l4QTlTNXJETk81ZVZiMnllYjRTNGRQLytZ?=
 =?utf-8?B?ZEc2Q3liRnVjR2tjV2lnWFk1eUU2Yk53cUR5UTdWSEFHQTlzb2FGOG9mdXJy?=
 =?utf-8?B?eEV1ODFvemZ0S0NrUWhWL3NyRWpRQjdyWXNSSUhyZ1M0eTNzVUxaZklNdlFm?=
 =?utf-8?B?d3ZJYWIvNXp2Skt3WFpKYXFPM055emgwRFVxeS9uZ250UFpXQU4xSnkrYUtx?=
 =?utf-8?B?VExwWmlhMG1DblU3U3N3Tyt1d3NtUStNbmRBWTJGTXB2aGRMbW80RTdpSWJz?=
 =?utf-8?B?b0dQV0Yzcnd4ckhhNStzUHNoU1VFWHZBZ1krS0RxLzVCVEtxU205Z3p6dzVv?=
 =?utf-8?B?ZS9BTFR6S3kxQkhqeEJ0UXRzU2JGelBpOXRDYU5qNWRGWTZieTdaeFd5R0Ev?=
 =?utf-8?B?M3R4bzhiN0FaWVRjODNNRnRWaEdWSThmTC9DU0JUWnNLaFBYUFkvNlkyR1NW?=
 =?utf-8?B?YnBEZ2lwa2NNYWdUbUY3dUpOSVNqOFJ0Ty92ejZ4b3NiT1FJdlk1TDNhVWM5?=
 =?utf-8?B?WHZIdHRaaVpYVTZZalpZb3NicWJxcEdncWhpR3U1R0JyUm9pUDBOSkE3VEwv?=
 =?utf-8?B?SzJ4THVuNFhzQjArZUlNNUorM2VlSm5jK3B3QSszRnZ3T1dhb3BZZTRyU2Rw?=
 =?utf-8?B?WDhhUXRjRFVubW5VcGF3c01nQzJWakRYdk5WT3V3UFZhYm5mUDVHNUM3Kzk4?=
 =?utf-8?B?WnZYS3UxcXMyQUkzUzVmWW93VUJpbVM0WmJTNy9MS2dCSzVrbm1uR1F1OUZN?=
 =?utf-8?B?Y0dIUUx3U0pDVVg4WEE0dTN6N1pyYlZGaEpjUFkzOFhZNVFhSEwzMnY5d1lx?=
 =?utf-8?B?THBmYlA2K2dTSGYxVG5WVzdzNXIya3VXbGJRMitBOW1EbDFWTEpyNlFMK1VI?=
 =?utf-8?B?SDkyLzJsa2dwUEptUE40SFpRKyt5anVLc3I0UkFKTTQrRjlpbzBMWDlCQlBy?=
 =?utf-8?B?dVdoQkFDK2pBbmRPc1QvbEhpekVWSkYwdVg2K1FsY0c0elk4UFhMNUFTWUZB?=
 =?utf-8?B?V3dtTUI2YUFmM29EU1o3UzZjSHBuOG5Ga0NFYlpCNWxBL245QlU5NmxlalVU?=
 =?utf-8?B?dDQ4M3JEQ0xaZldMelZSVHFoeHNhenkvVFBpY3ZHZ0RHOWd4VStPbWJjdExs?=
 =?utf-8?B?dFdVdzZhNkdJRnNKZzFSRE5jcGpTdFBTWmJzY2liZEdzWTI2bW5VUkt6OE55?=
 =?utf-8?B?N3JjS0Q5WmRDTGxweFRxMXFzNk9QYktUS2JrT0t4amhzTmJLZ2tLT3ZpdW9m?=
 =?utf-8?B?QWFFTXRkRmRhZ3VOaUdVUVYxZHJZZUFHQUl3dThKTi85RUprd1lBbVRTRGls?=
 =?utf-8?B?QUVBWW1DR1RlcU9tUDdGdW1mTzBaNmg5VHFocndmcktvTDc5RlBDYk1MQjJs?=
 =?utf-8?Q?UtVgm0x7wYtisPsr1vgAlbuc1?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C63F35935CAC6349A1B7EB13A598D6A7@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ba60c863-959d-428d-60a0-08dab072d850
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Oct 2022 19:07:32.7628
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /OmSjHew5hbq93gxyw8mEtY6w7FxarlTTL1/LPDpsXzmHATww7mI64V3aVOzFkcqOpbJ9lRcSo+8PDJtrDj/Wg7IasV2ief/Ke3qDfzOuNI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB6423

T24gMTcvMTAvMjAyMiAxNzo1MSwgSGVucnkgV2FuZyB3cm90ZToNCj4gZGlmZiAtLWdpdCBhL3hl
bi9hcmNoL2FybS9wMm0uYyBiL3hlbi9hcmNoL2FybS9wMm0uYw0KPiBpbmRleCBmMTc1MDBkZGYz
Li4wYjRlMjQyMThlIDEwMDY0NA0KPiAtLS0gYS94ZW4vYXJjaC9hcm0vcDJtLmMNCj4gKysrIGIv
eGVuL2FyY2gvYXJtL3AybS5jDQo+IEBAIC0xNzg0LDYgKzE4MDAsOCBAQCBpbnQgcDJtX2luaXQo
c3RydWN0IGRvbWFpbiAqZCkNCj4gICAgICAgICAgIWlvbW11X2hhc19mZWF0dXJlKGQsIElPTU1V
X0ZFQVRfQ09IRVJFTlRfV0FMSyk7DQo+ICANCj4gICAgICByYyA9IHAybV9hbGxvY190YWJsZShk
KTsNCj4gKyAgICBpZiAoIHJjICE9IDAgKQ0KPiArICAgICAgICByZXR1cm4gcmM7DQoNClRoaXMg
ZXJyb3IgcGF0aCBub3cgbGVha3MgdGhlIFZNSUQuDQoNCkFuZCB0byBwcmVlbXB0IHRoZSBvYnZp
b3VzIGNoYW5nZSwgaWYgeW91IHNpbXBseSBtb3ZlIHRoaXMgbG93ZXIsIHlvdSdsbA0KaW50cm9k
dWNlIGEgcGF0aCB3aGVyZSBwMm1fdGVhcmRvd24oKSBmYWxscyBvdmVyIGEgTlVMTCBwb2ludGVy
Lg0KDQp+QW5kcmV3DQo=

