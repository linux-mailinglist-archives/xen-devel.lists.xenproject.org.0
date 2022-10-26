Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2674E60DF49
	for <lists+xen-devel@lfdr.de>; Wed, 26 Oct 2022 13:06:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.430457.682182 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oneEk-0004ZZ-42; Wed, 26 Oct 2022 11:06:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 430457.682182; Wed, 26 Oct 2022 11:06:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oneEj-0004Uj-Vs; Wed, 26 Oct 2022 11:06:17 +0000
Received: by outflank-mailman (input) for mailman id 430457;
 Wed, 26 Oct 2022 11:06:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JODj=23=citrix.com=prvs=291bfe38a=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1oneEi-0004UF-G5
 for xen-devel@lists.xenproject.org; Wed, 26 Oct 2022 11:06:16 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3382b0f8-551e-11ed-8fd0-01056ac49cbb;
 Wed, 26 Oct 2022 13:06:14 +0200 (CEST)
Received: from mail-bn8nam12lp2176.outbound.protection.outlook.com (HELO
 NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.176])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 26 Oct 2022 07:06:01 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by SJ0PR03MB6536.namprd03.prod.outlook.com (2603:10b6:a03:394::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.28; Wed, 26 Oct
 2022 11:05:55 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::1328:69bd:efac:4d44]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::1328:69bd:efac:4d44%3]) with mapi id 15.20.5746.028; Wed, 26 Oct 2022
 11:05:54 +0000
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
X-Inumbo-ID: 3382b0f8-551e-11ed-8fd0-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1666782374;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=OjkB2EtK+PgSY0hM7qYybrQOJJaKiOjzfOJG+aTe394=;
  b=LnSWw3G+c0nGlyRpcdKg9HJ8E4m1XwslRP7BoMvX5eGMM3VVy0FTWoOU
   0T6EHp8WJtP/g2nF2bFvQEajdWdQe72LrEbpuebihIlQJrM/E1dkTF4pW
   XiJTlBm3ZDybnYkXBXJ3eiapmGQZKwOHtt5iWmqrzDqwDwTZ6EgRjAm8y
   8=;
X-IronPort-RemoteIP: 104.47.55.176
X-IronPort-MID: 86063442
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:QkQB7aKBErOpQeUDFE+RL5QlxSXFcZb7ZxGr2PjKsXjdYENS0mMFy
 mYWXTqGOfmMNDamet0lPNjl8BsPsZHVmN9rTQVlqX01Q3x08seUXt7xwmUcnc+xBpaaEB84t
 ZV2hv3odp1coqr0/0/1WlTZhSAgk/vOHtIQMcacUghpXwhoVSw9vhxqnu89k+ZAjMOwRgiAo
 rsemeWGULOe82MyYz98B56r8ks15q2q4m1A5zTSWNgQ1LPgvyhNZH4gDfnZw0vQGuF8AuO8T
 uDf+7C1lkuxE8AFU47Nfh7TKyXmc5aKVeS8oiM+t5uK23CukhcawKcjXMfwXG8M49m/c3Kd/
 /0W3XC4YV9B0qQhA43xWTEAe811FfUuFLMqvRFTGCFcpqHLWyKE/hlgMK05FaoJ5e1NIzlrz
 NdGFC8HSBeinubmma3uH4GAhux7RCXqFKU2nyg6iBv/XbMhS52FRLjW79hF2jt2ntpJAfvVe
 8seb3xocQjEZBpMfFwQDfrSns/x3iW5L2Ie9Q/T/PVpi4TQ5FUZPLzFGdzZYNGVA+5SmV6Vv
 Dnu9GXlGBAKcteYzFJp91r82LeRxn+nAur+EpWD08VEhHSa91YyASYcckG0vtqhpGCHDoc3x
 0s8v3BGQbIJ3FCiS9DmGRm1pnGVsxo0WtxMHul84waIooLE7gDcCmUaQzppbN09qNRwVTEsz
 kWOnd7iGXpoqrL9YW2Z3qeZq3W1Iyd9BW0NfygfViMe/sLu5oo0i3rnTNxuDaq0hd3dAizrz
 naBqy1Wr7cOi4gN3qay/1HCihqtoITESkg+4QC/dmGo8AJ/IpKkboqA6F7H4PIGJ4GcJmRtp
 1ABksmaqeoIXZeEkXXXRP1XRe73ofGYLDfbnFhjWYE78Cig8GKieoYW5yxiIEBuMYAPfjqBj
 FLvhD69LaR7ZBOCBZKbqaroYyj25cAMzejYa80=
IronPort-HdrOrdr: A9a23:lh5UdaNTx+rN5cBcT5j255DYdb4zR+YMi2TDiHoddfUFSKalfp
 6V98jzjSWE8wr4WBkb6LO90DHpewKRyXcH2/hqAV7EZniohILIFvAu0WKG+VHd8kLFh4lgPM
 tbEpSWTeeAdWSS7vyKrjVQcexQpuVvmZrA7Yix854ud3ASV0gK1XYaNu/vKDwTeOAwP+tdKH
 Pz3Kp6jgvlXU5SQtWwB3EDUeSGjcbMjojabRkPAANiwBWSjBuzgYSKUySw71M7aXdi0L0i+W
 /Kn0jS/aO4qcy2zRfayiv684lWot380dFObfb8yfT9aw+cyDpAVr4RH4FqjwpF591HL2xa1u
 Ukli1QevibLUmhJ11d7yGdgzUImwxelkMKgWXo/UcL5/aJBQ7SQvAx+76wOHHimjUdlcA536
 RR022DsZ1LSRvGgSTm/tDNEwpnj0yuvBMZ4KYuZtNkIPkjgZJq3PoiFXluYd49NTO/7JpiHP
 hlDcna6voTeVSGb2rBtm0qxNC3RHw8EhqPX0BH46WuonJrtWE8y1FdyN0Un38G+p54Q55Y5/
 7cOqAtkL1VVMcZYa90Ge9ES8qqDW7GRw7KLQupUB/aPbBCP2iIp4/84b0z6u3vcJsUzIEqkJ
 CES19cvX5aQTOYNSRP5uw+zvngehTPYd228LAu23FQgMyNeJP7dSueVVspj8ys5/0CH8yzYY
 fHBK5r
X-IronPort-AV: E=Sophos;i="5.95,214,1661832000"; 
   d="scan'208";a="86063442"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EZbESgHOuaNSly0dbqYI6CA5vNnV1Cpf38oup0S+sac9fI8LbnFN8nw4JTyqo+Km1ViH0beMQ6J6dhf4rC9BWeNIL4g+rAU9lFqPlwpuliQOjPhb67SIN4jeP5yw1Q/kO1nl6llTJm+DJwrISX9zk16fv5gw0x+TXcPXB75CZ4Tdoyr+2xFfF6nTX+GWgBkE3YPfxRYm8lZgjFbOOkQXl3Go7MP16tEGmgq91aiEXHgaQS63YuaRMu0W/czNynAedLt9ah1uGCEI+XaMU6GuLXpmvsN9YVRh1U6ReymRtPTylqbeOerBvfoa6eI593woLwPyn+M7sAiv4OwY72ccwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OjkB2EtK+PgSY0hM7qYybrQOJJaKiOjzfOJG+aTe394=;
 b=RnNKIueynBlvTLHvgyuIWlebfpAE8TDGHFFPlKXnskc/jMvt8A4fvXirqrMNjMAIDTpJmmAdWcoQsvrDo9//wmF+fN/wOY13Rz2ZPzIR/6d5PqW/Uie1mHTb5m6LMAs+8U3tlw6G2zp4/vw4AO4cutX5gbLb7Q5S0oBqfu4UJ3VZSloIVY9HGcH0MhRCspEBa7iIGuY2TXi7RNM9Ygg0eU7HC4oOCaIR6m2C8wj8RNVLP1IJJDc6wH+/Hx16LC6YmxNMOZpcK73dxyzrHwv61t9CAdpWCkIh7rA3+R1P+Le9Jc8W+oi/hC1FsZAGz27LuKmf5iFscKAFXam/W1asxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OjkB2EtK+PgSY0hM7qYybrQOJJaKiOjzfOJG+aTe394=;
 b=ZAFXy4NVpII6x1TEmG/qazp+U6IdNNI1FSic0ykhQ7qibu/WboWbSXvv8kMRLfKFsvvvhfjHZBmEFrf5RNbbKHrgZQQO7rqG+/fZFEvMopNcAe7yZ7ReiI6mjZnInkRtsnmrNjMi/DganjbprDkCc8lSjR8o8MQu9O/UfJEF+E4=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Tamas K Lengyel <tamas.lengyel@intel.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Wei Liu <wl@xen.org>, Anthony Perard <anthony.perard@citrix.com>, Juergen
 Gross <jgross@suse.com>, Jan Beulich <jbeulich@suse.com>, Roger Pau Monne
	<roger.pau@citrix.com>, Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian
	<kevin.tian@intel.com>
Subject: Re: [PATCH] xen/x86: Make XEN_DOMCTL_get_vcpu_msrs more configurable
Thread-Topic: [PATCH] xen/x86: Make XEN_DOMCTL_get_vcpu_msrs more configurable
Thread-Index: AQHY58oHJ6gDkVUXak23gaU3RLT7hK4ghkAA
Date: Wed, 26 Oct 2022 11:05:54 +0000
Message-ID: <0c7ca888-3142-1719-13c2-4f006ecdf683@citrix.com>
References:
 <854cdedcdd2bfff08ea45a3c13367c610d710aaf.1666630317.git.tamas.lengyel@intel.com>
In-Reply-To:
 <854cdedcdd2bfff08ea45a3c13367c610d710aaf.1666630317.git.tamas.lengyel@intel.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR03MB3623:EE_|SJ0PR03MB6536:EE_
x-ms-office365-filtering-correlation-id: 750edc7a-b74d-4b9e-17a2-08dab7420d87
x-ld-processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 2wHdbR6bbARxKZmrC05ju846Drpebu9PZPtH0HT3p3ldonHdqbCp9pofCfbk4wvTIps72pVsuWuvC6odE9ycSQwvSM8LH0XevnFCuWLac0ZarOpB2UBd7E66duQohD2dPUR/mgz/42hZRnkE/xIpa6Aae15hMBUSFZzdz/pDrn1+mjs3bD01d7uFcEQkeIzOAG0Y90cgIdS5I3m14iPsWvkNozZyL+r50YOV5IcdmSnyoJGPKd36XdSo1D0xUE2ct3CmvEPh8aNLkKRYXyLipG7H4svu01sxku2x1myI6pD7Id9k7c61ngP2YIhjkzpIoyZDZvLk3Br7zQ7llN1ps1JnqLKBW+uYDi+P3qQg2GIRDo/7ia2ag9OGo79Z7rP9ONVTpOhGsJYTbwE7bEjd9h3PKOmE0uLCFXAXHoAPO3XMpvcg4oeKem5TDCpwDemUTeuA8iBEgvzfIZlZuavsJYqPY/BnDFgm1RjHftPT4vBXR2iZ6sP4LBuZAYp81k5t+yG2FkAGSoYg6foelZuAWKeQQDnY6tR2LrqSI+TafRDTMvLTE9ZXwEiTXGtKzvJsgkaQxSrTV6FMNRhg++1Dxq9j6IsXrTe2p0H9A3hHr9qmBrVDHHamv15dKp75baj5rSynaP/caQLojODwTeZOXqSA4wGw+j2XC4CEVcLrYzFq3IIDQRCYDE6/K5oLE0S98NmfvjsrBKGUrUmej6sAT94Pd38KA1TgYm+S54eciZmi+gKxBnsxNXKtsluTFQwOgmsVCiLdsMtkUVd/yTtoNorDooLYIBSSYEdD8kS1tAAfESKegqEAm63GTYrLbny2/td6FWYsmqS6XgHk9RFRaQ==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(376002)(396003)(366004)(39860400002)(346002)(451199015)(122000001)(64756008)(316002)(41300700001)(5660300002)(8936002)(2616005)(83380400001)(186003)(82960400001)(38100700002)(2906002)(4326008)(91956017)(8676002)(110136005)(54906003)(36756003)(76116006)(66946007)(66446008)(66556008)(66476007)(6506007)(53546011)(31686004)(38070700005)(31696002)(86362001)(6512007)(26005)(6486002)(478600001)(71200400001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?U2E0YW54WitVcStacmowcWxvdUcwOFNHSE1DWE50WGYxZi9YS1FmbWRKYUxX?=
 =?utf-8?B?dDJ5NDg0WDNxUzV3MXlTRHlwQURHOUtFN0tMZGpsb2lxYzVtSGI4OXdDK09Y?=
 =?utf-8?B?VnQ1dDJhSDZ4K0M2OTNUa1FDZFZsaHkzVld4eCtTcG9TM2lkdi8wVmVBeGd0?=
 =?utf-8?B?TGZaVE02N2h0bFNyc2FEdUN4dFBwRUxtWFBINnpYcXpRd1dtdXRhbXBmSktP?=
 =?utf-8?B?K3N6VFVwRWpaMUlYRC94SGcvT253cnlLU2MwdVk2dlVQNDZNdW1VME9pNnF6?=
 =?utf-8?B?YUxuTDBDT0lvalB2WlFVSTlrQkVzS3pjb0QvRytJYzMzUGlwdjIxZURYOEJs?=
 =?utf-8?B?R0E1VUx5SUQxU3dCQWNnejFDazdUdXlvUmdUYlJzbkQvbFNnUFB4NmFvZlk5?=
 =?utf-8?B?NHVDRk1OWlp4eWJaTTFDUUhFQXdocjM2emVtM1c0QnFSZVcyQmdVem11VHJz?=
 =?utf-8?B?dE95d3pxN2xWUGhXai9GMWxaYzNvR3JIb0tuczBVdWJPdnc4T0lxaXc2UU1R?=
 =?utf-8?B?YjduVDBReWNqUDRpOHFBdmEzTzUycGdhRE5HL0V2ZEtCU0laNE9UbzlYVXhY?=
 =?utf-8?B?S2wzOW90a0dIeDFWM25Fd0NiQ2RmOUFnS2N1NDhtVG1JTSsxSEpKZnd1T0Rs?=
 =?utf-8?B?d0RIQ2xlSFc1RW9DSXROZ1VHejF4eklEdjdHbm00MjBrclY5VkRNU3A1NTVW?=
 =?utf-8?B?TjVxRUwxUDlyR0p2M1B4SENJekxKUFRDUFVZY1c5U2dKM09idFhoUythRU12?=
 =?utf-8?B?TUhIQmU3RE5JS2NibHgzMnMrRExJYXVDdUVFL0t6eFpQS1RVT0Q2K2NiV3pP?=
 =?utf-8?B?UzQ4YWE3MXQ5R2NpcG1JWkhvRkhJOEM0MnU3MnRNZjNtQWEyVkRoVFZtbVI2?=
 =?utf-8?B?ellPZ0RqNFl1MDlnTFdEd2hrS2MyN053bjVLRXlnM0RQcUc4UmdtbGNIYlZv?=
 =?utf-8?B?K2VhbXJDckRtRHA0bXVDWUtrcnp0YlhZU1hlMk4rSEU4dlFpQURNUGx4bE8w?=
 =?utf-8?B?bUVrT1M2QjhPK2M1eWo5eDlKK1pHWnZaK3hGMzQyQlNuanl1ZU0rVlU1bXA1?=
 =?utf-8?B?QytpdUpxUUM3NHBIcXdERGk2T0pXcSthYUxrMm5yY1BLQXRIeEQrdWloNklm?=
 =?utf-8?B?cm1kblJwbkhQOUl2MTBpYWN3SXVTNW1Vb3BDakN0YUF0TW0xaGpEN1dxcitH?=
 =?utf-8?B?SDVvcThPbzhjV1ltMCt2d2UwcS9mTFk2T2xuQzU2K1VkQ0dwcm5Ec1JyNXRx?=
 =?utf-8?B?RURyNm1pQzl3R3pYblBYbTMydGJPMndLWXRGb2ZzZVJrcmp4QnVYdlN4cVhj?=
 =?utf-8?B?VXdaVTVnSnZIS0tiTmE0Rmdpcks3NUh0b3Z6cDhuT0dNTFhwN2g2ZytqNVVh?=
 =?utf-8?B?bU9GdlozUmQrNTIwNFZYRE9id0Z2eHBqM1JvQzBRb280Z2gxdk5PZGxwQkU0?=
 =?utf-8?B?bkVoam9FcUdocjVHbTFrOU9ML0dyeG9GRGNyS2MwZ0lES296YURUQ2NJajdL?=
 =?utf-8?B?NHQ1WGxxMkthZC9GaEdUSjByQ1JCSUZzcUo5eTUxbERWaEY1bURPaWJ5OWMr?=
 =?utf-8?B?YjM3SVJNWVBPOE9XVW1BejY5NEFZVnFocnY1NGlhRDY5dmlNdk5hekdXem9m?=
 =?utf-8?B?UU9xTmhiR29MZ2t5dVRpOE9ubTNMV3BUeGthczMzcTdqTkhQUzV3cVgvMEN0?=
 =?utf-8?B?anNjZ0ZVd0ZXcTlZK2hXU01zckVRc3hPUlV3OXNTalRmMXlxaEc3czd2TTAy?=
 =?utf-8?B?bUpRcFQyREt5MUhqdU5pb2hKZHNSdkdtVitBcDBKU3Ftc2pXblVBV1pVTmZl?=
 =?utf-8?B?NnlsNDIwQ055U2kwYXA1TE03UHJCckJ2YXlLOEF6T0ZBY0JZdFJEaXo4VlBx?=
 =?utf-8?B?ZWlJc0RWWGFzaFFUSmQ5M0NxVjExRTZPRDVGTEgvSGF1bVIrVktoSmtSNEVH?=
 =?utf-8?B?WnpLU1ZRYkVyM2lsMHpqZDZaRGdoUzlqWDU1dDlDVnhmKzhrNzVGOUlrYnZU?=
 =?utf-8?B?YTY2Q2ZLdHg1VUxldjhXY3hLQmtKUW1yUVMrOVFFc29tM3JpU2FhTUx6ZDla?=
 =?utf-8?B?UHFJSGI3YjMzTXNCUmFvMHhhUXdlWjI5MTMyRWY0ejJjaEc4eHdITkJueTJ6?=
 =?utf-8?Q?/ImAaSp6q8EJEc0KToidfCjos?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <69DE43BBA32D6640A71DD5B9A0EF1706@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 750edc7a-b74d-4b9e-17a2-08dab7420d87
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Oct 2022 11:05:54.8871
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JB2zEYXbH8fWQRXdE7E24AepxHQUeFCSrChXGY8pm5NGOa2q8CMsuvuQAhJYTBFjx8xQWjMx9OhDRbTbYJBsNvBdWyhOlD+NI5XUI+Y/kXY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB6536

T24gMjQvMTAvMjAyMiAxNzo1OCwgVGFtYXMgSyBMZW5neWVsIHdyb3RlOg0KPiBDdXJyZW50bHkg
dGhlIFhFTl9ET01DVExfZ2V0X3ZjcHVfbXNycyBpcyBvbmx5IGNhcGFibGUgb2YgZ2F0aGVyaW5n
IGEgaGFuZGZ1bA0KPiBvZiBwcmVkZXRlcm1pbmVkIHZjcHUgTVNScy4gSW4gb3VyIHVzZS1jYXNl
IGdhdGhlcmluZyB0aGUgdlBNVSBNU1JzIGJ5IGFuDQo+IGV4dGVybmFsIHByaXZpbGVnZWQgdG9v
bCBpcyBuZWNlc3NhcnksIHRodXMgd2UgZXh0ZW5kIHRoZSBkb21jdGwgdG8gYWxsb3cgZm9yDQo+
IHF1ZXJ5aW5nIGZvciBhbnkgZ3Vlc3QgTVNScy4gVG8gcmVtYWluIGNvbXBhdGlibGUgd2l0aCB0
aGUgZXhpc3Rpbmcgc2V0dXAgaWYNCj4gbm8gc3BlY2lmaWMgTVNSIGlzIHJlcXVlc3RlZCB2aWEg
dGhlIGRvbWN0bCB0aGUgZGVmYXVsdCBsaXN0IGlzIHJldHVybmVkLg0KPg0KPiBTaWduZWQtb2Zm
LWJ5OiBUYW1hcyBLIExlbmd5ZWwgPHRhbWFzLmxlbmd5ZWxAaW50ZWwuY29tPg0KDQpOYW1pbmcg
YXNpZGUsIFhFTl9ET01DVExfe2dldCxzZXR9X3ZjcHVfbXNycyBpcyBzdXBwb3NlZCB0byBiZSAi
Z2V0IG1lDQphbGwgTVNScyBuZWVkZWQgdG8gbWlncmF0ZSBhIHZDUFUiLsKgIChJIGRvIGludGVu
ZCB0byByZXRpcmUgdGhlDQpoeXBlcmNhbGwgYXMgcGFydCBvZiBmaXhpbmcgdGhlIFhlbiBzaWRl
IG9mIG1pZ3JhdGlvbiwgYnV0IHRoYXQncyBhZ2VzIGF3YXkpDQoNCkl0IHNlZW1zIGxpa2Ugd2hh
dCB5b3Ugd2FudCBpcyBzb21ldGhpbmcgbW9yZSBsaWtlDQpYRU5fRE9NQ1RMX3tyZCx3cn1tc3Jf
bGlzdMKgIChjb252ZW5pZW50IHRpbWluZywgZ2l2ZW4gdGhlIHJlY2VudCBJU0UNCnVwZGF0ZSku
wqAgSSB0aGluayB0aG9zZSB3b3VsZCBiZSBiZXR0ZXIgYXMgYSBzZXBhcmF0ZSBwYWlyIG9mDQpo
eXBlcmNhbGxzLCByYXRoZXIgdGhhbiB0cnlpbmcgdG8gcmVwdXJwb3NlIGFuIGV4aXN0aW5nIGh5
cGVyY2FsbC4NCg0KDQpBcyBmb3IgYWN0dWFsbHkgZ2V0dGluZyB0aGUgdmFsdWVzLCBwbGVhc2Ug
Zml4IHVwIGd1ZXN0X3tyZCx3cn1tc3IoKSB0bw0KYWNjZXNzIHRoZSBwZXJmIE1TUnMgc2FmZWx5
LsKgIEkga25vdyB0aGUgdnBtdSBNU1IgaGFuZGxpbmcgaXMgaW4gYQ0KdHJhZ2ljIHN0YXRlLCBi
dXQgdGhpcyBuZXcgZ2V0X21zciBzdWJvcCBpcyBtYWtpbmcgdGhlIHByb2JsZW0gZXZlbiBtb3Jl
DQp0YW5nbGVkLg0KDQp+QW5kcmV3DQo=

