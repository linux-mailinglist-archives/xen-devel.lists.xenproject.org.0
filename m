Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B2D85EA2D1
	for <lists+xen-devel@lfdr.de>; Mon, 26 Sep 2022 13:14:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.411683.654701 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ocm4G-00082X-DJ; Mon, 26 Sep 2022 11:14:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 411683.654701; Mon, 26 Sep 2022 11:14:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ocm4G-00080H-A8; Mon, 26 Sep 2022 11:14:32 +0000
Received: by outflank-mailman (input) for mailman id 411683;
 Mon, 26 Sep 2022 11:14:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=t0pF=Z5=citrix.com=prvs=2617546cc=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1ocm4E-0007zs-Ir
 for xen-devel@lists.xenproject.org; Mon, 26 Sep 2022 11:14:30 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 62765f69-3d8c-11ed-9648-05401a9f4f97;
 Mon, 26 Sep 2022 13:14:28 +0200 (CEST)
Received: from mail-dm6nam11lp2174.outbound.protection.outlook.com (HELO
 NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.174])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 26 Sep 2022 07:14:26 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by SJ0PR03MB6390.namprd03.prod.outlook.com (2603:10b6:a03:396::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.14; Mon, 26 Sep
 2022 11:14:22 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::56c6:613e:cc95:d028]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::56c6:613e:cc95:d028%6]) with mapi id 15.20.5654.026; Mon, 26 Sep 2022
 11:14:22 +0000
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
X-Inumbo-ID: 62765f69-3d8c-11ed-9648-05401a9f4f97
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1664190868;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=QCdtDN2pQBs5V5dBUrzXQaVfraSamPBUiVlbDjCvmZU=;
  b=f1Tzvtg99Q1GjKBhat6j83R3BJoQ7m2ZIagStzEVz3WCfOuHrvwUXIV/
   xvenJlp8XQe/U/C3g5VFFhamFpLZ/Pfwck3weSBQqmLvR3cBCHf4aZq4O
   kANLsh5lXDPxZV120fIs4VJUkrJpUt618ajOa+yKW4PH1xZ3oSUqM86N5
   8=;
X-IronPort-RemoteIP: 104.47.57.174
X-IronPort-MID: 80473139
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:9XBrlai3lMMZvxs6+dGnflidX161oBEKZh0ujC45NGQN5FlHY01je
 htvWW+FafeNZGGme95/btmz8B5QuJLRzN5gQFBqpCg3EH8b9cadCdqndUqhZCn6wu8v7a5EA
 2fyTvGacajYm1eF/k/F3oDJ9CU6j+fQLlbFILasEjhrQgN5QzsWhxtmmuoo6qZlmtH8CA6W0
 T/Ii5S31GSNhnglaQr414rZ8Ek15KWo5WtC1rADTasjUGH2xiF94K03fcldH1OgKqFIE+izQ
 fr0zb3R1gs1KD90V7tJOp6iGqE7aua60Tqm0xK6aID76vR2nQQg075TCRYpQRw/ZwNlPTxG4
 I4lWZSYEW/FN0BX8QgXe0Ew/ypWZcWq9FJbSJQWXAP6I0DuKhPRL/tS4E4efr023PllI1h12
 9cbDhApMB2GoP2z3+fuIgVsrpxLwMjDGqo64ygl4RSHSPEsTNbEXrnA4sJe0HEonMdSEP3CZ
 s0fLz1ycBDHZB4JMVASYH48tL7w2j+jLHsF9xTM+vZfD2v7lWSd1JDENtbPd8PMbsJShkuC/
 UrN/njjAwFcP9uaodaA2iL02rCUxHiqMG4UPP6q7KEyona+/y9NFUJRTFuigqKVhHfrDrqzL
 GRRoELCt5Ma5EGtC9XwQRC8iHqFpQIHHcpdFfUg7wOAwbaS5ByWbkAmZDNcbN0ttOctWCcnk
 FSOmrvBADV1tbSPRHG197GKrCizMywYMW8DYyAfSQIPpdLkpekbrh/JVMclL6ezgfX8AzS2y
 DePxBXSnJ0WhM8Pkqm+o1bOhmv1ooCTF1FpoALKQmii8wV1Ipa/YJCl4kTa6vAGK5uFSl6Gv
 z4PnM32AP0yMKxhXRelGI0ldIxFLd7cWNEAqTaDx6Ucygk=
IronPort-HdrOrdr: A9a23:+4DvjqwWxfJg5AEahHl5KrPxj+skLtp133Aq2lEZdPULSKGlfp
 GV9sjziyWetN9IYgBapTiBUJPwIk81bfZOkMQs1MSZLXPbUQyTXc1fBOrZsnfd8kjFmtK1up
 0QFJSWZOeQMbE+t7eD3ODaKadu/DDkytHPuQ629R4EIm9XguNbnn5E422gYy9LrXx9dP4E/e
 2nl696TlSbGUg/X4CePD0oTuLDr9rEmNbNehgdHSMq7wGIkHeB9KP6OwLw5GZebxp/hZMZtU
 TVmQ3w4auu99uhzAXH6mPV55NK3PP819p4AtCWgMR9EESttu/oXvUjZ1SxhkFxnAid0idvrD
 AKmWZmAy1H0QKSQohym2qq5+Cv6kd215ao8y7kvZKqm72EeNt9MbsOuWsRSGqm16Jr1usMr5
 5jziaXsYFaAgjHmzm479/UVwtynk7xunY6l/UP5kYvGLf2RYUh2rD3xnklZqsoDWb/8sQqAe
 NuBMbT6LJfdk6bdWnQui1qzMa3Vno+Ex+aSgxa0/blmAR+jTR81Q8V1cYflnAP+NY0TIRF/f
 3NNuBtmKtVRsEbYKphDKMKQNexCGbKXRXQWVjiaWjPBeUCITbAupT36LI66KWjf4EJ1oI7nN
 DbXFZRpQcJCjbT4A21reh2Gzz2MRaAtG7Wu7BjDrBCy83BbauuNzGfQ1YzlMblq+kDA6TgKo
 SOBK4=
X-IronPort-AV: E=Sophos;i="5.93,345,1654574400"; 
   d="scan'208";a="80473139"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nLsLG0x2x2VPmEdczTHlW8nTCiRo3UsGhN7WRfX8/CVUpsFGg+j4h9LnZgpdnyQ25o7Q+y0XyiTcf3ZvgnwHFW6+wpBCZFOFW2qOXfXg4wCR973te+BtSA++4eTpaptl7zIWo4Avk11rMp08UC61G4Sm/M0uxbhik+qmAvGjSs+f4dISSe2oM8XJCek8VMdqG8QKAaFlBkoqENHoU4tHn/zt6cXf1xXtl5qFqItd/W0h9ZlJzbGbwoyp7Ebs0CBumHjICGvez3kwV4KWMElh56t0e6yAH9DmvYBj9sm3vJLL06h/vWXqVI4j55MUJwY/DX35Ar+uZIgbHheKHa04Sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QCdtDN2pQBs5V5dBUrzXQaVfraSamPBUiVlbDjCvmZU=;
 b=D9AamGwz3DGqCpIff99JW3J23fVcJ0bidJt62Ick9AwZAp/rm5OoRvxKDHlDyfF9Ney3wPlzHdaY8vYLpVXKXjuQQ6XMMiX4WVVdUNHm3olcVLD9WBq1msSq/l+K04+6iI9YS8a9D8GsAXeJb85BG+/rcTQ878V3i06JC0iZKYzcVRldZfNUIpwutAu5AmbPo7uAA/qgf2MDsHfEMrmrlbPJjkj/uZcT/DIXcY7np6XYdLVnno36eYrx7pVU+mu8l7czh6dCi1HrTw9APjgyaBPdHMjszjcjVew08sf3D0z8tkS6Qps1YeDytGDPRu15wHUWMWPot1DjgVN7f2tJfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QCdtDN2pQBs5V5dBUrzXQaVfraSamPBUiVlbDjCvmZU=;
 b=izjQo1wJqdKTa6xGR0hGybYUDb7TyX09rzNZQm6QRTkfHttMXxA8zk2zPwNiF/tH5YtwHs95mRYWl1dBaa7p64IEv/mtEv7+mcgMSUBHbnriYxJHvXC2/4npCOTi4uOu8xkaqQd84w0/akBzp4tiThCXleU/43c6vSv8Yr650TA=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Jan Beulich <JBeulich@suse.com>,
	=?utf-8?B?TWFyZWsgTWFyY3p5a293c2tpLUfDs3JlY2tp?=
	<marmarek@invisiblethingslab.com>, Henry Wang <Henry.Wang@arm.com>
Subject: [For 4.17] Re: [PATCH] drivers/char: Fix build when CET-IBT is
 enabled
Thread-Topic: [For 4.17] Re: [PATCH] drivers/char: Fix build when CET-IBT is
 enabled
Thread-Index: AQHY0ZgJqCa/HgBJ80OfcMoFcfGuLq3xjxEA
Date: Mon, 26 Sep 2022 11:14:22 +0000
Message-ID: <603e39a8-965a-7869-d1f6-072bb29d103b@citrix.com>
References: <20220926110547.21287-1-andrew.cooper3@citrix.com>
In-Reply-To: <20220926110547.21287-1-andrew.cooper3@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR03MB3623:EE_|SJ0PR03MB6390:EE_
x-ms-office365-filtering-correlation-id: be5c327b-1737-4141-2ef9-08da9fb043b7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 qJZwsULNXYTk0EqN5OoDt0nSpEMyJqpbOtEP90E8mfvaLmbRs7kR+xQfkvVGRT2lO47QQdZv0Q8AP3VFqdOLj6i+zco3z5feJSUfE0PFyN9qtMZLwv3dpHGfLSqmZ8yv2HdhWUWrwvz6iLygGMMeIyFijoUKPq9VsEuPcHryiFdmudFP00965BDxw0IfT3CCKF0Z1zzwshkoIX4YLIWZbcPfz+p6a+hvZLoZXKMqLOCFqkqi0xd+Cxkw+q1ZBY/3C9wCigOk1H5M6QpNMO476EF5xMpcu2+EqP80aei9Mk9h/W1vwow3fRypG+gFUVhOPGNzUMZlweQ7ZmRQ4xk91C2ENwttJpYGEVR/sgyTRS+++hdbJRdMNH4MSLYjBQVXyoETkmKC9DtIfCmN/QHOiBDNQT0j4ihf/O7NE8Lg3B2LFIZBiwvaONEdBkFOgfpFTx3PCJuMNqBsbt1VF1kHnoWmcRQ+QdiqUbdlnjDtCyFUKAg0P344eb8Hv4ot869cLRx+cv4A3CuZCOypmVno+px+D3Ts2wjk58EJDxPJZDOx89lvxktseuTZxI+UeuOOHXihZ7Hd1Y0ocVR52rASHVzesK/faD6ZvH9dW+5BSV9MLq8acCREM+pzgeBKTnSsDrOA+0ZDmTTHKmT8m2tfqhCL05oHXmb1HvlcbZReUg0lkGdNuXAQhMHSstN71ptPRDw+euo8LVK62kFRxMb4jFQeLFlQTdlQqxlrYJY/QoTCeE0ARUmNr2S6fyFSofdhyWhBsuHtX/AstrWHt2XTQCXuDU5062dq7HUMkCJIiSBg3g03Ym25HnBBA0seHUK8wE097s1YJChh6oAZOfrxNToA+3+E/n/Lvr/eW0I9p6w=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(346002)(136003)(396003)(366004)(376002)(451199015)(966005)(6486002)(8936002)(6916009)(54906003)(71200400001)(64756008)(66556008)(4326008)(8676002)(76116006)(26005)(66946007)(41300700001)(66476007)(316002)(53546011)(91956017)(6506007)(66446008)(478600001)(38070700005)(31696002)(38100700002)(82960400001)(86362001)(2616005)(5660300002)(6512007)(2906002)(186003)(83380400001)(31686004)(36756003)(122000001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?L3RaZDhhMHJOeUh0R0dlUTA5UDJhdXZlK0txYUUxWS9YQ1Z6OGhSUjZNUENu?=
 =?utf-8?B?djdNQXMraEZPcUJ5SE8yODNaWUlDRy9LcXF6cGlNL1FTMFB3NzVBSVdUeTha?=
 =?utf-8?B?TnExMEp3VkdMakk0YXg1NXBVMGNiT0k0OGdpZ05sbnpGWEZHZzhkVDRlVFR5?=
 =?utf-8?B?UFl6RnJEQzd0VDJYZXBtbnhiUEVqWVdEbzEwWWtlM0hlVEN1WGR5OFVFWUJN?=
 =?utf-8?B?KzlVSjE4K2N3aXVGTndjUDhXb0JFUU1oMWhZaS9KVHN4bnkwb05XZ0RDcXp0?=
 =?utf-8?B?LytFL0VBWCtnQXhERzU1WkYxbG4wY2ZUd0NobWZaeE1oM2xIU1I4YXNZYjZP?=
 =?utf-8?B?YzlzZG54a0pXbGxheTUzekJtNnNaaFRVZkthVUNGVzA5S3B4aWhkTGh3NjZo?=
 =?utf-8?B?b2xYcEVRQ2w4SkRKUXMxdENKTy9SYmFEcTdkMXJaYnFaRUZyYU1aclpjSEZl?=
 =?utf-8?B?R3ZSNVV6aUdhdDZRa0o0Qlp4QjVJTTJtWDlJQk41VTBpTVg4a2Ywa3kvVjRP?=
 =?utf-8?B?NlQvMkI4a2NCUi9ZU1N2SFJpWHFmMzhZNzQ4ZkRIODd1aStQWEVGYy9la09h?=
 =?utf-8?B?aEh0ZTl1M0hMV2NmbXdMUE45UmNueUhpNkw4VDBqMklJMUtqblJCNnBSTEdQ?=
 =?utf-8?B?SzQxZXRsWWJQY3RNN01kMndZbGFOd2IxRytOWnYxajlmVEIzWlduYkwycGpM?=
 =?utf-8?B?NkJNUVlPWmRERE9CQUIxR1o5MVhNUEh4UWIwblY0ZktSeU5oWC9YQlM1UXpS?=
 =?utf-8?B?Ym1NNEtGc3RseFcvQS9wSndlMXk5ZUZhM2xzcFpVTVYzNEVCNnZqVEVxRUc0?=
 =?utf-8?B?SlNXdHNXd0Y4ME9McUpuVENpT0pyeUNQejNkTnNPWTd3dU1XdGJBeEJJZTV3?=
 =?utf-8?B?Y203MC9OZ3F2SnlSV0F0Y1ZvbDJCOEVGZm5FakZPTHllZHQwYlp0RXhiM08z?=
 =?utf-8?B?NXBIa3FnaFFPR0I3MjcxK2JEd2g5OXVUQlk5UVI3dExNd056VkhKOEJ2SUZi?=
 =?utf-8?B?b0FmMmh0NkFNVG9rTU9YaWZrN1NvMUdTdHkrclBjK1pqT2dVNDhtVnROSzIw?=
 =?utf-8?B?NC9pYk5XRm1NcXIwcGJMWWhYaHlnQ0pBMHhIWnhGWkNwZTliMkI5enQ1YXV6?=
 =?utf-8?B?eG9yQnk3OTZ5QW5iRkhXUTFjTlExb3ZuOFpOaGI3NGZqRGpETThyUjBtUDRh?=
 =?utf-8?B?Wnk0YlJXUVRIYktJc28vVEU0OThNZFNmRVNnNnBpYkI2TkJGKzJDZi9HTEFk?=
 =?utf-8?B?Tkt6SkpGL2NPdVBxZTNXc1Q0UHh3MHBWSW9aenVqMFpjTVZ6aFBGc3BGRmZ5?=
 =?utf-8?B?eTkrS0pnZE5kQUR1MmtITGxkVVlqNzF2S3VGNlRDSk9OVDFhOUVhYlpDOEdK?=
 =?utf-8?B?eVJYeUgwaHJzNWE2QkVXMHFIaUE0Y2ZHNHpQNE9MUUJUNXRJMUozekNRSnVU?=
 =?utf-8?B?VG1KZUkwc24zZk1ZL2RvNkVXTFZmZVhtSFpQY3F0bTF3Rlp2di9YcUlVOWFK?=
 =?utf-8?B?S2ZUTWZxR2F3RGc0T281bUYwa1M3RTBYRndDUS9qY1FkVlpJZHB0VGNVdUJU?=
 =?utf-8?B?eFkvalBrYkw4YlU4M2VrRTU0TVFHQnlWb1RqVG5JdkF2QUJpOTZFQ1J3dVpY?=
 =?utf-8?B?SElSZU1RTjdhUHBrWXZML3I1cXNHL3I5RE9abGlsUk82VFlzYWM0VE1DYmc5?=
 =?utf-8?B?eHFMNG5rMElUODNSdXBXUnM4VFkzYzVvTk1VM3lYSFA1Z3RLL2ZpVU4xUzkw?=
 =?utf-8?B?TjgwdTNtcDdaU1ZRTHhpMDZ6dkhVUzBhL1MyTjZTU2F4K0dZWUpqWWY5cHNQ?=
 =?utf-8?B?VzAyVHVDa1E0OXVyeHk3VEZaSU1zY0VHTUVIalRXZFVBVlpVOXdMTFhaWWZN?=
 =?utf-8?B?aFlia1dGOGp4eTI1cXNWeVFDRDFSckY3ZWF3Lzl3TEVuSjg4RFRoMlFkRnMr?=
 =?utf-8?B?aGNXaDJvU2FNNDZjakJCUmswb2FTZmoya1dNbW9lOExRYWRnQnFuRlpmTm1j?=
 =?utf-8?B?YlBOL3p4SGtFWVk3MnpXbHdSbEErN3REWmZnWFY0NlRZVklhWjNiWFpPVXdn?=
 =?utf-8?B?c245NzlXQnBVelhpa25CMGxXVFhmdHFSV1B1M3RXTm82YkU4RXpWU1lJODhW?=
 =?utf-8?Q?MSq8N1uzIM2NUFjDVvR3Ob1Zg?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <7C5945DA1CF169498FCFE0A9D610B97A@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: be5c327b-1737-4141-2ef9-08da9fb043b7
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Sep 2022 11:14:22.4860
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tvCopp/dIsqi8xnuWBtgxm7CcWPwkkAqRCSLVgTh0ilsz+N35qdQQnilgy19qG+0+cFPvJev9Zqoq+gITJwMW6A5OiVxSrrStqGzhnZ5H+E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB6390

T24gMjYvMDkvMjAyMiAxMjowNSwgQW5kcmV3IENvb3BlciB3cm90ZToNCj4gaHR0cHM6Ly9naXRs
YWIuY29tL3hlbi1wcm9qZWN0L3hlbi8tL2pvYnMvMzA4MzA2ODk1MCNMMTc2Mw0KPg0KPiBTaWdu
ZWQtb2ZmLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPg0KPiBG
aXhlczogMDIyZTQwZWRkNGRjICgiZHJpdmVycy9jaGFyOiBhbGxvdyB1c2luZyBib3RoIGRiZ3A9
eGhjaSBhbmQgZGJncD1laGNpIikNCj4gLS0tDQo+IENDOiBKYW4gQmV1bGljaCA8SkJldWxpY2hA
c3VzZS5jb20+DQo+IENDOiBNYXJlayBNYXJjenlrb3dza2ktR8OzcmVja2kgPG1hcm1hcmVrQGlu
dmlzaWJsZXRoaW5nc2xhYi5jb20+DQo+IENDOiBIZW5yeSBXYW5nIDxIZW5yeS5XYW5nQGFybS5j
b20+DQoNClNvcnJ5IC0gZm9yZ290IHRvIHRhZyBGb3ItNC4xNyBpbiB0aGUgc3ViamVjdC4NCg0K
fkFuZHJldw0KDQo+IC0tLQ0KPiAgeGVuL2RyaXZlcnMvY2hhci9laGNpLWRiZ3AuYyB8IDIgKy0N
Cj4gIHhlbi9kcml2ZXJzL2NoYXIveGhjaS1kYmMuYyAgfCAyICstDQo+ICAyIGZpbGVzIGNoYW5n
ZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkNCj4NCj4gZGlmZiAtLWdpdCBhL3hl
bi9kcml2ZXJzL2NoYXIvZWhjaS1kYmdwLmMgYi94ZW4vZHJpdmVycy9jaGFyL2VoY2ktZGJncC5j
DQo+IGluZGV4IDhhMGI5NTg1MDYwOS4uYmI5ZDMxOThkOWYyIDEwMDY0NA0KPiAtLS0gYS94ZW4v
ZHJpdmVycy9jaGFyL2VoY2ktZGJncC5jDQo+ICsrKyBiL3hlbi9kcml2ZXJzL2NoYXIvZWhjaS1k
YmdwLmMNCj4gQEAgLTE0NjUsNyArMTQ2NSw3IEBAIHN0YXRpYyBzdHJ1Y3QgZWhjaV9kYmdwIGVo
Y2lfZGJncCA9IHsgLnN0YXRlID0gZGJncF91bnNhZmUsIC5waHlzX3BvcnQgPSAxIH07DQo+ICAN
Cj4gIHN0YXRpYyBjaGFyIF9faW5pdGRhdGEgb3B0X2RiZ3BbMzBdOw0KPiAgDQo+IC1zdGF0aWMg
aW50IF9faW5pdCBwYXJzZV9laGNpX2RiZ3AoY29uc3QgY2hhciAqb3B0KQ0KPiArc3RhdGljIGlu
dCBfX2luaXQgY2ZfY2hlY2sgcGFyc2VfZWhjaV9kYmdwKGNvbnN0IGNoYXIgKm9wdCkNCj4gIHsN
Cj4gICAgICBpZiAoIHN0cm5jbXAob3B0LCAiZWhjaSIsIDQpICkNCj4gICAgICAgICAgcmV0dXJu
IDA7DQo+IGRpZmYgLS1naXQgYS94ZW4vZHJpdmVycy9jaGFyL3hoY2ktZGJjLmMgYi94ZW4vZHJp
dmVycy9jaGFyL3hoY2ktZGJjLmMNCj4gaW5kZXggNWY5MjIzNGE5NTk0Li40M2VkNjRhMDA0ZTIg
MTAwNjQ0DQo+IC0tLSBhL3hlbi9kcml2ZXJzL2NoYXIveGhjaS1kYmMuYw0KPiArKysgYi94ZW4v
ZHJpdmVycy9jaGFyL3hoY2ktZGJjLmMNCj4gQEAgLTEyODIsNyArMTI4Miw3IEBAIHN0cnVjdCBk
YmNfZG1hX2J1ZnMgew0KPiAgc3RhdGljIHN0cnVjdCBkYmNfZG1hX2J1ZnMgX19zZWN0aW9uKCIu
YnNzLnBhZ2VfYWxpZ25lZCIpIF9fYWxpZ25lZChQQUdFX1NJWkUpDQo+ICAgICAgZGJjX2RtYV9i
dWZzOw0KPiAgDQo+IC1zdGF0aWMgaW50IF9faW5pdCB4aGNpX3BhcnNlX2RiZ3AoY29uc3QgY2hh
ciAqb3B0X2RiZ3ApDQo+ICtzdGF0aWMgaW50IF9faW5pdCBjZl9jaGVjayB4aGNpX3BhcnNlX2Ri
Z3AoY29uc3QgY2hhciAqb3B0X2RiZ3ApDQo+ICB7DQo+ICAgICAgc3RydWN0IGRiY191YXJ0ICp1
YXJ0ID0gJmRiY191YXJ0Ow0KPiAgICAgIHN0cnVjdCBkYmMgKmRiYyA9ICZ1YXJ0LT5kYmM7DQoN
Cg==

